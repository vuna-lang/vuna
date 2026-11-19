#!/bin/sh
# checks.vuna-static 的一部分：产品 / 开发命令边界的结构守卫。
#
# `vuna dev …` 是仓库专用命名空间，实现与命令表在独立包 `packages/dev`（二进制
# `vuna-dev`）。产品侧（`packages/cli` / `packages/toolchain`）只做发现与路由，不得
# import 开发命名空间的任何模块——边界已经是包边界。
set -eu
export LC_ALL=C

cd "$(pwd)"

fail=0

report() {
  echo "product-boundary: $1" >&2
  fail=1
}

# 开发插件必须自成包，且有入口与命令表。
[ -f packages/dev/app/Main.vuna ] || report "missing packages/dev/app/Main.vuna"
[ -f packages/dev/lib/Vuna/Cli/Dev.vuna ] || report "missing packages/dev/lib/Vuna/Cli/Dev.vuna"
[ -f packages/dev/lib/Vuna/Dev/Spec.vuna ] || report "missing packages/dev/lib/Vuna/Dev/Spec.vuna"
[ -f packages/dev/lib/Vuna/Dev/Registry.vuna ] || report "missing packages/dev/lib/Vuna/Dev/Registry.vuna"

# 产品侧（入口 + 工具链）不得 import 开发命名空间。
for f in $(find packages/cli/lib packages/cli/app packages/toolchain/lib -name '*.vuna'); do
  if grep -Eq '^import (Vuna\.Cli\.Dev|Vuna\.GenErrors|Vuna\.Obs|Vuna\.Test\.(Run|Suite)|Vuna\.Cli\.(Suite|IrDump|IrRender))$' "$f"; then
    report "$f imports a dev-only module (dev commands live in packages/dev)"
  fi
  if grep -q '^import Vuna\.Dev\.' "$f"; then
    report "$f imports a Vuna.Dev.* module (dev commands live in packages/dev)"
  fi
done

# 开发命令必须挂在 `dev` 前缀下（不能散落在产品面）。
if grep -q 'topCmd \["dev"\]\|subCmd \["dev"' packages/toolchain/lib/Vuna/Cli/Spec.vuna; then
  report "dev commands are declared in Vuna.Cli.Spec (product table) instead of Vuna.Dev.Spec"
fi
if grep -q 'subCmd \["suite"\]' packages/dev/lib/Vuna/Dev/Spec.vuna; then
  report "dev suite is declared outside the dev namespace in Vuna.Dev.Spec"
fi
if grep -q 'subCmd \["obs"' packages/dev/lib/Vuna/Dev/Spec.vuna; then
  report "dev obs is declared outside the dev namespace in Vuna.Dev.Spec"
fi

[ "$fail" -eq 0 ] || exit 1
echo "product-boundary: ok"