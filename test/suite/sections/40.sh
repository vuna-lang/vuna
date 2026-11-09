#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

# 40) M30 工具链回归：CLI 错误矩阵 + Index v3 自检 + doc [export] + search
#     三个 check.sh 是独立 POSIX 脚本（内部 mktemp 隔离，不碰仓库缓存）。
section_begin
sh corpus/cli/check.sh "$VUNA" >"$tmp/cli_m30.log" 2>&1
if [ "$?" -eq 0 ]; then ok; else bad "cli m30" "exit 0" "$(tail -8 "$tmp/cli_m30.log")"; fi
sh corpus/index/check.sh "$VUNA" >"$tmp/index_m30.log" 2>&1
if [ "$?" -eq 0 ]; then ok; else bad "index m30" "exit 0" "$(tail -8 "$tmp/index_m30.log")"; fi
sh corpus/search/check.sh "$VUNA" >"$tmp/search_check.log" 2>&1
if [ "$?" -eq 0 ]; then ok; else bad "search check" "exit 0" "$(tail -5 "$tmp/search_check.log")"; fi

doc_m30_out="$tmp/doc-m30/api.html"
doc_m30=$("$VUNA" doc corpus/doc/01_export "$doc_m30_out" 2>&1)
doc_m30_code=$?
if [ "$doc_m30_code" -ne 0 ]; then
  bad "doc m30 exit" "0" "$doc_m30"
elif [ ! -f "$doc_m30_out" ]; then
  bad "doc m30 output" "writes $doc_m30_out" "missing"
else
  doc_m30_text=$(cat "$doc_m30_out")
  check_contains "doc [export] includes Visible" "$doc_m30_text" "id='visible'"
  case "$doc_m30_text" in
    *"## Hidden"*) bad "doc [export] excludes Hidden" "absent" "Hidden still documented" ;;
    *) ok ;;
  esac
fi

assert_min_section_checks "§40 工具链回归" 3


finish
