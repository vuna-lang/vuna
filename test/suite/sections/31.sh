#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

# 31) doc / repl 冒烟（M23：Repl 已切 DT，顶层定义必须先输签名行；裸表达式可直接求值）
"$VUNA" doc corpus/packages/01_workspace "$tmp/api.html" >/dev/null 2>&1
check_eq "vuna doc exit" "0" "$?"
check_contains "vuna doc content" "$(cat "$tmp/api.html" 2>/dev/null)" "Vuna.Hello"
sh corpus/doc/check.sh "$VUNA" >"$tmp/doc_check.log" 2>&1
if [ "$?" -eq 0 ]; then ok; else bad "doc check" "exit 0" "$(tail -5 "$tmp/doc_check.log")"; fi
repl_out=$(printf 'x : Int\nx = 1 + 1\nx + 40\n:q\n' | "$VUNA" repl 2>&1)
check_contains "vuna repl eval" "$repl_out" "42"
printf ':q\n' | "$VUNA" repl >/dev/null 2>&1
check_eq "vuna repl exit" "0" "$?"


finish
