#!/bin/sh
# checks.vuna-static 的一部分：产品 / 开发命令边界的结构守卫。
#
# 约束：`vuna dev …` 是仓库专用命名空间，实现集中在 `Vuna.Cli.Dev`（产品工具链包里）。
# 入口二进制（`packages/cli`）不得 import 任何工具实现或 dev 命名空间——它只做发现与路由；
# 开发命令的唯一合法引用点是接线表 `Vuna.Cli.Registry`。
set -eu
export LC_ALL=C

cd "$(pwd)"

fail=0

report() {
  echo "product-boundary: $1" >&2
  fail=1
}

# 开发命名空间必须存在，且被接线表接上。
[ -f packages/toolchain/lib/Vuna/Cli/Dev.vuna ] || report "missing packages/toolchain/lib/Vuna/Cli/Dev.vuna"
grep -q '^import Vuna\.Cli\.Dev$' packages/toolchain/lib/Vuna/Cli/Registry.vuna ||
  report "Vuna.Cli.Registry does not import Vuna.Cli.Dev"

# 接线表与 Dev 自身之外，产品工具链模块不得 import 开发命名空间。
for f in $(find packages/toolchain/lib -name '*.vuna'); do
  case "$f" in
    packages/toolchain/lib/Vuna/Cli/Registry.vuna) continue ;;
    packages/toolchain/lib/Vuna/Cli/Dev.vuna) continue ;;
  esac
  if grep -q '^import Vuna\.Cli\.Dev$' "$f"; then
    report "$f imports Vuna.Cli.Dev (only the wiring table may depend on the dev namespace)"
  fi
done

# 入口二进制只做发现与路由：不得 import 工具实现。
for f in $(find packages/cli/lib packages/cli/app -name '*.vuna'); do
  if grep -qE '^import Vuna\.(Fmt|Lint|Doc|Search|Lsp|Repl|Interp|TestRunner|Run|Obs|Index|Clean|Add|Fetch|Cli\.Registry|Cli\.Spec)' "$f"; then
    report "$f imports a toolchain module (the entry binary must only discover and route)"
  fi
done

# 开发命令必须挂在 `dev` 前缀下（不能散落在产品面）。
if grep -q 'subCmd \["suite"\]' packages/toolchain/lib/Vuna/Cli/Spec.vuna; then
  report "dev suite is declared outside the dev namespace in Vuna.Cli.Spec"
fi
if grep -q 'subCmd \["obs"' packages/toolchain/lib/Vuna/Cli/Spec.vuna; then
  report "dev obs is declared outside the dev namespace in Vuna.Cli.Spec"
fi

[ "$fail" -eq 0 ] || exit 1
echo "product-boundary: ok"