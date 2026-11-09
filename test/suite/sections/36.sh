#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

# 36) 错误码文档：`vuna gen-errors` 从 docstring 生成（M3），分区 + 幂等（M4）
# 沙箱里源码树只读，gen-errors 写 ROOT/docs/.generated/——用 tmp 根：软链 compiler +
# 复制 Rules（readDir 跟随软链），再写 $errroot/docs/.generated/errors.md。
errroot="$tmp/errroot"
mkdir -p "$errroot/lib/Vuna/Lint" "$errroot/docs"
ln -s "$PWD/../compiler" "$errroot/compiler"
cp ../lib/Vuna/Lint/Rules.vuna "$errroot/lib/Vuna/Lint/Rules.vuna"
"$VUNA" gen-errors "$errroot" >/dev/null 2>&1
check_eq "gen-errors exit" "0" "$?"
errs_doc="$errroot/docs/.generated/errors.md"
errs_content=$(cat "$errs_doc")
check_contains "gen-errors tc section" "$errs_content" "## 类型检查 / 精化（TC_）"
check_contains "gen-errors cg section" "$errs_content" "## 代码生成（CG_）"
check_contains "gen-errors ln section" "$errs_content" "## Lint 规则（LN_）"
check_contains "gen-errors fx section" "$errs_content" "## 修复规则（FX_）"
check_contains "gen-errors tc code" "$errs_content" "TC_NotExhaustive"
check_contains "gen-errors cg code" "$errs_content" "CG_NoMain"
check_contains "gen-errors lint code" "$errs_content" "LN_LiteralIfChain"
check_contains "gen-errors fix code" "$errs_content" "FX_literalifchain"
cp "$errs_doc" "$tmp/errs1.md"
"$VUNA" gen-errors "$errroot" >/dev/null 2>&1
diff "$tmp/errs1.md" "$errs_doc" >/dev/null 2>&1
check_eq "gen-errors idempotent" "0" "$?"


finish
