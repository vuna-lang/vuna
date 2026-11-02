#!/bin/sh
# checks.vuna-typecheck：用当前产品 CLI 类型检查自身源码（`vuna check .`）。
#
# 由 nix/checks/default.nix 的 mkCheck 调用：cwd 是已暂存的工作树，
# $1 是输出目录，$VUNA 由 Nix 注入。
set -eu

OUT=${1:?usage: vuna-typecheck.sh OUT}
: "${VUNA:?VUNA 未设置}"

"$VUNA" check .