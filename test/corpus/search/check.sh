#!/bin/sh
# test/corpus/search/check.sh：`vuna search` 名称 / doc / 类型检索自检。
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
ws="$here/ws"
tmp=$(mktemp -d "${TMPDIR:-/tmp}/vuna-search-check.XXXXXX") || exit 1
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

run_in_ws() { ( cd "$ws" && "$@" ); }

out=$(run_in_ws "$VUNA" search id 2>&1)
check_eq "search name exit" "0" "$?"
check_contains "search name hit" "$out" "Demo.Search.id"
check_contains "search name match" "$out" "[name"

out=$(run_in_ws "$VUNA" search --doc Increment 2>&1)
check_eq "search doc exit" "0" "$?"
check_contains "search doc hit" "$out" "Demo.Search.inc"
check_contains "search doc match" "$out" "[doc]"

out=$(run_in_ws "$VUNA" search --type "Int -> Int" 2>&1)
check_eq "search type exit" "0" "$?"
check_contains "search type alpha hit" "$out" "Demo.Search.inc : Int -> Int  [alpha]"

out=$(run_in_ws "$VUNA" search --type "a -> a" 2>&1)
first=$(printf '%s\n' "$out" | sed -n '1p')
check_contains "search type ranks alpha first" "$first" "Demo.Search.id"

out=$(run_in_ws "$VUNA" search --type "a -> a" --json 2>&1)
check_contains "search json schema" "$out" '"schema":"vuna-search/1"'
check_contains "search json name" "$out" '"name":"id"'
check_contains "search json match" "$out" '"match":"alpha"'

out=$(run_in_ws "$VUNA" search --type "a -> a" --limit 1 2>&1)
count=$(printf '%s\n' "$out" | grep -c "Demo.Search")
check_eq "search limit one" "1" "$count"

out=$(run_in_ws "$VUNA" search --module Demo id 2>&1)
check_eq "search module filter exit" "0" "$?"
check_contains "search module filter hit" "$out" "Demo.Search.id"
run_in_ws "$VUNA" search --module Nope id >"$tmp/nomod.log" 2>&1
check_eq "search module filter no hit exit" "1" "$?"

run_in_ws "$VUNA" search zzzzz >"$tmp/nohit.log" 2>&1
check_eq "search no hit exit" "1" "$?"
check_contains "search no hit message" "$(cat "$tmp/nohit.log")" "no results"

run_in_ws "$VUNA" search --type "a ->" >"$tmp/badq.log" 2>&1
check_eq "search bad type exit" "2" "$?"
check_contains "search bad type error" "$(cat "$tmp/badq.log")" "cannot parse type query"

( cd "$tmp" && "$VUNA" search id >"$tmp/nonws.log" 2>&1 )
check_eq "search non-workspace exit" "2" "$?"
check_contains "search non-workspace error" "$(cat "$tmp/nonws.log")" "vuna.toml"

printf 'search: %d passed, %d failed\n' "$pass" "$fail"
[ "$fail" -eq 0 ] && echo "search check passed"
[ "$fail" -eq 0 ]
