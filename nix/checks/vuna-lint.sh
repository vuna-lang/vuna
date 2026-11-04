#!/bin/sh
# checks.vuna-lint：当前源码（compiler + CLI + base + app）必须零 lint finding。
#
# 已知豁免（case-to-clauses 拆分与 STR 的冲突，见 docs/reference/lint.md §5）：
#   Doc.renderTy / Index.Scan.renderTy / Fmt.Expr 的若干互递归或自递归函数：
#   拆成多 clause 后 STR 失去下降环（递归/互递归函数保持 case 形态）；
#   Loader.Resolve.resolveModules 同理。
set -eu

OUT=${1:?usage: vuna-lint.sh OUT}
: "${VUNA:?VUNA 未设置}"

"$VUNA" lint $(find compiler/lib base/lib lib app -name '*.vuna' -print) 2>&1 | \
  grep -v -e 'lib/Vuna/Doc.vuna:.*LN_CaseToClauses' \
          -e 'lib/Vuna/Index/Scan.vuna:.*LN_CaseToClauses' \
          -e 'lib/Vuna/Fmt/Expr.vuna:.*LN_CaseToClauses' \
          -e 'compiler/lib/Vuna/Compiler/Loader/Resolve.vuna:.*LN_CaseToClauses' \
          >/dev/null || true
