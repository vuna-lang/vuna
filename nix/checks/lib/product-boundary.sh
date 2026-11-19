#!/bin/sh
# checks.vuna-static 的一部分：产品 / 开发命令边界的结构守卫。
#
# 约束：`vuna dev …` 是仓库专用命名空间，实现集中在 `Vuna.Cli.Dev`。产品侧模块不得
# import 它——这样以后要把开发命令拆成第二个二进制时，边界已经存在。接线表
# `Vuna.Cli.Registry` 是唯一允许 import 产品与开发两侧的地方。
set -eu
export LC_ALL=C

cd "$(pwd)"

fail=0

report() {
  echo "product-boundary: $1" >&2
  fail=1
}

# 开发命名空间必须存在，且被接线表接上。
[ -f packages/cli/lib/Vuna/Cli/Dev.vuna ] || report "missing packages/cli/lib/Vuna/Cli/Dev.vuna"
grep -q '^import Vuna\.Cli\.Dev$' packages/cli/lib/Vuna/Cli/Registry.vuna ||
  report "Vuna.Cli.Registry does not import Vuna.Cli.Dev"

# 产品侧模块不得 import 开发命名空间（接线表与 Dev 自身除外）。
for f in $(find packages/cli/lib packages/cli/app -name '*.vuna'); do
  case "$f" in
    packages/cli/lib/Vuna/Cli/Registry.vuna) continue ;;
    packages/cli/lib/Vuna/Cli/Dev.vuna) continue ;;
  esac
  if grep -q '^import Vuna\.Cli\.Dev$' "$f"; then
    report "$f imports Vuna.Cli.Dev (product code must not depend on the dev namespace)"
  fi
done

# 开发命令必须挂在 `dev` 前缀下（不能散落在产品面）。
if grep -q 'subCmd \["suite"\]' packages/cli/lib/Vuna/Cli/Spec.vuna; then
  report "dev suite is declared outside the dev namespace in Vuna.Cli.Spec"
fi
if grep -q 'subCmd \["obs"' packages/cli/lib/Vuna/Cli/Spec.vuna; then
  report "dev obs is declared outside the dev namespace in Vuna.Cli.Spec"
fi

[ "$fail" -eq 0 ] || exit 1
echo "product-boundary: ok"