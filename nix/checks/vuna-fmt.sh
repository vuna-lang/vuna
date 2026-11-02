#!/bin/sh
# checks.vuna-fmt：源码必须与 `vuna fmt` 输出一致（workspace 全包 + examples）。
#
# 由 nix/checks/default.nix 的 mkCheck 调用：cwd 是已暂存的工作树，
# $1 是输出目录，$VUNA 由 Nix 注入。
set -eu

OUT=${1:?usage: vuna-fmt.sh OUT}
: "${VUNA:?VUNA 未设置}"

# 省略 PATH = workspace 内所有包的 lib/app/test（corpus 夹具自动跳过）。
"$VUNA" fmt --check
# examples/ 不在 workspace 包扫描范围内，显式检查。
"$VUNA" fmt --check examples
