#!/bin/sh
# checks.vuna-lint：当前源码（compiler + CLI + base + app）必须零 lint finding。
#
# 由 nix/checks/default.nix 的 mkCheck 调用：cwd 是已暂存的工作树，
# $1 是输出目录，$VUNA 由 Nix 注入。
#
# M30：lint 改为 AST 驱动后覆盖全部包源码（不再只扫各包顶层文件）；
# 规则只报告可安全自动修复的形态（不可安全折叠 / 签名含隐式 Pi 的函数不报）。
set -eu

OUT=${1:?usage: vuna-lint.sh OUT}
: "${VUNA:?VUNA 未设置}"

"$VUNA" lint \
  $(find compiler/lib base/lib lib app -name '*.vuna' -print)
