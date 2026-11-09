#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

# 60) F3 B：语言级调试构造 `dbg` / `assert` / `todo` 与 release 构建拒绝。
d60="$tmp/debug-constructs"
rm -rf "$d60"
mkdir -p "$d60"

printf 'main : Int\nmain = dbg "msg" (assert True "ok" 1)\n' >"$d60/ok.vuna"
d60_ok=$(VUNA_BASE="$VUNA_BASE" "$VUNA" check "$d60/ok.vuna" 2>&1)
d60_ok_code=$?
check_eq "debug constructs: debug build accepts dbg/assert" "0" "$d60_ok_code"

printf 'main : Int\nmain = assert False "boom" 0\n' >"$d60/assert.vuna"
d60_rel=$(VUNA_BASE="$VUNA_BASE" VUNA_RELEASE=1 "$VUNA" check "$d60/assert.vuna" 2>&1)
d60_rel_code=$?
check_eq "debug constructs: release rejects assert" "1" "$d60_rel_code"
check_contains "debug constructs: release assert diagnostic" "$d60_rel" "TC_DebugConstructInRelease"

printf 'main : Int\nmain = todo "later"\n' >"$d60/todo.vuna"
d60_todo=$(VUNA_BASE="$VUNA_BASE" VUNA_RELEASE=1 "$VUNA" check "$d60/todo.vuna" 2>&1)
d60_todo_code=$?
check_eq "debug constructs: release rejects todo" "1" "$d60_todo_code"
check_contains "debug constructs: release todo diagnostic" "$d60_todo" "TC_DebugConstructInRelease"

printf 'main : Int\nmain = dbg "x" 1\n' >"$d60/dbg.vuna"
d60_dbg=$(VUNA_BASE="$VUNA_BASE" VUNA_RELEASE=1 "$VUNA" check "$d60/dbg.vuna" 2>&1)
d60_dbg_code=$?
check_eq "debug constructs: release allows dbg" "0" "$d60_dbg_code"

d60_flag=$(VUNA_BASE="$VUNA_BASE" VUNA_RELEASE= "$VUNA" check --release "$d60/assert.vuna" 2>&1)
check_contains "debug constructs: --release flag also gates" "$d60_flag" "TC_DebugConstructInRelease"

finish
