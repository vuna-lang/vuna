#!/bin/sh
# checks.vuna-lint：当前源码（compiler + CLI + base + app）必须零 lint finding。
#
# 由 nix/checks/default.nix 的 mkCheck 调用：cwd 是已暂存的工作树，
# $1 是输出目录，$VUNA 由 Nix 注入。
set -eu

OUT=${1:?usage: vuna-lint.sh OUT}
: "${VUNA:?VUNA 未设置}"

"$VUNA" lint \
  compiler/lib/Vuna/Compiler/*.vuna \
  lib/Vuna/*.vuna \
  base/lib/Base/*.vuna \
  base/lib/*.vuna \
  app/*.vuna