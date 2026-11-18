#!/bin/sh
# test/corpus/doc/check.sh：`vuna doc` 单文件 HTML / docstring / --check 自检。
#
# 用法: sh check.sh <vuna>
set -u

VUNA=${1:?usage: check.sh <vuna>}
case "$VUNA" in
  /*) ;;
  */*) VUNA=$(cd "$(dirname "$VUNA")" && pwd)/$(basename "$VUNA") ;;
  *) VUNA=$(command -v "$VUNA" 2>/dev/null || printf '%s' "$VUNA") ;;
esac

here=$(cd "$(dirname "$0")" && pwd)
tmp=$(mktemp -d "${TMPDIR:-/tmp}/vuna-doc-check.XXXXXX") || exit 1
trap 'rm -rf "$tmp"' EXIT INT TERM

pass=0
fail=0
ok() { pass=$((pass + 1)); }
bad() {
  fail=$((fail + 1))
  printf 'FAIL: %s\n' "$1" >&2
}
check_eq() { if [ "$2" = "$3" ]; then ok; else bad "$1 (expected [$2] got [$3])"; fi; }
check_contains() {
  case "$2" in
    *"$3"*) ok ;;
    *) bad "$1 (missing [$3])" ;;
  esac
}
check_absent() {
  case "$2" in
    *"$3"*) bad "$1 (unexpected [$3])" ;;
    *) ok ;;
  esac
}

fixture="$here/02_html"
out="$tmp/api.html"

"$VUNA" doc "$fixture" "$out" >"$tmp/doc.log" 2>&1
check_eq "doc exit" "0" "$?"
if [ -f "$out" ]; then ok; else bad "doc did not write $out"; fi
text=$(cat "$out" 2>/dev/null)

check_contains "html doctype" "$text" "<!doctype html>"
check_contains "html search input" "$text" "<input id='search'"
check_contains "html embedded index" "$text" "id='vuna-index'"
check_contains "html search JS" "$text" "addEventListener('input'"
check_contains "module doc multi-line" "$text" "Module docs line one"
check_contains "module doc second line" "$text" "Module docs line two"
check_contains "fun doc" "$text" "Id function"
check_contains "block doc" "$text" "A box with members"
check_contains "block doc continuation" "$text" "Second line of block doc"
check_contains "ctor doc" "$text" "Empty box"
check_contains "field doc" "$text" "X coordinate"
check_contains "method doc" "$text" "Area"
check_contains "search JSON symbol" "$text" '"n":"Demo.Docs.id"'
check_absent "ordinary comment not doc" "$text" "普通注释"
check_absent "private symbol skipped" "$text" "_hidden"

case "$text" in
  *"src='http"*|*"href='http"*) bad "html has external resource URL" ;;
  *) ok ;;
esac

"$VUNA" doc "$fixture" "$tmp/api2.html" >/dev/null 2>&1
if cmp -s "$out" "$tmp/api2.html"; then ok; else bad "doc output not deterministic"; fi

"$VUNA" doc --check "$fixture" >"$tmp/check.log" 2>&1
check_eq "doc --check documented exit" "0" "$?"
check_contains "doc --check documented message" "$(cat "$tmp/check.log")" "docstrings ok"

"$VUNA" doc --check "$here/03_missing" >"$tmp/missing.log" 2>&1
check_eq "doc --check missing exit" "1" "$?"
check_contains "doc --check missing names symbol" "$(cat "$tmp/missing.log")" "missing docstring: Demo.Missing.needDoc"

# 尾随 doc（`-- ^` / `{- ^ -}`）：与目标同一行；前置 `-- |` 与尾随同时存在时前置优先。
trail="$here/04_trailing"
"$VUNA" doc "$trail" "$tmp/trail.html" >"$tmp/trail.log" 2>&1
check_eq "trailing doc exit" "0" "$?"
ttext=$(cat "$tmp/trail.html" 2>/dev/null)
check_contains "trailing doc decl (same line)" "$ttext" "limit trailing."
check_contains "trailing doc ctor (line comment)" "$ttext" "Empty trailing (line comment)."
check_contains "trailing doc ctor (block comment)" "$ttext" "Full trailing (block comment)."
check_contains "trailing doc field" "$ttext" "px trailing."
check_contains "trailing doc method" "$ttext" "area trailing."
check_contains "leading doc still wins" "$ttext" "Leading doc wins."
check_absent "leading wins over trailing" "$ttext" "trailing doc that must lose."
check_absent "trailing fixture ordinary comment not doc" "$ttext" "普通注释"
"$VUNA" doc --check "$trail" >"$tmp/trail-check.log" 2>&1
check_eq "trailing doc --check exit" "0" "$?"
check_contains "trailing doc --check message" "$(cat "$tmp/trail-check.log")" "docstrings ok"

"$VUNA" doc --package doc-html "$fixture" "$tmp/pkg.html" >/dev/null 2>&1
check_eq "doc --package filter exit" "0" "$?"
"$VUNA" doc --package no-such "$fixture" "$tmp/no.html" >"$tmp/no.log" 2>&1
check_eq "doc --package missing exit" "2" "$?"
check_contains "doc --package missing error" "$(cat "$tmp/no.log")" "no such package"

printf 'doc: %d passed, %d failed\n' "$pass" "$fail"
[ "$fail" -eq 0 ] && echo "doc check passed"
[ "$fail" -eq 0 ]
