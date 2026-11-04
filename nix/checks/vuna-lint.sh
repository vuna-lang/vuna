#!/bin/sh
# checks.vuna-lint：当前源码（compiler + CLI + base + app）必须零 lint finding。
# AST 驱动规则（literal-if-chain / lift-destructure / case-to-clauses）只报可安全自动修复的形态；
# 签名含隐式 Pi 的函数跳过 clause 级改写；case-to-clauses 对 body 引用 scrutinee 的分支用
# as-pattern（`x@pat`）保持绑定。
set -eu

OUT=${1:?usage: vuna-lint.sh OUT}
: "${VUNA:?VUNA 未设置}"

"$VUNA" lint $(find compiler/lib base/lib lib app -name '*.vuna' -print)
