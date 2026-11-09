#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

# 32) fmt golden 自测（test/corpus/fmt/check.sh：把工具链/编译器/base 合成为临时包编译探针；interp 已随 DT）
VUNA="$VUNA" OCAMLOPT="$OCAMLOPT" VUNA_BASE="$VUNA_BASE" sh corpus/fmt/check.sh >"$tmp/fmt_check.log" 2>&1
fmt_code=$?
if [ "$fmt_code" -eq 0 ]; then ok; else bad "fmt corpus" "exit 0" "$(tail -3 "$tmp/fmt_check.log")"; fi


finish
