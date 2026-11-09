#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

# 46) 语言级调试构造（F3 B）：dbg/dbgShow 走 stderr 且返回值不变；assert/todo 失败走
#     运行时报告器（exit 2、帧指向调用点）。
m38_dbg="$tmp/m38-dbg"
mkdir -p "$m38_dbg/app"
printf '[package]\nname = "m38-dbg"\n\n[dependencies]\nvuna-base = "%s"\n' "$VUNA_BASE" >"$m38_dbg/vuna.toml"
printf 'main : Int\nmain = dbg "m38-trace" (dbgShow 42)\n' >"$m38_dbg/app/Main.vuna"
if ! "$VUNA" build "$m38_dbg" >"$tmp/m38-dbg-build.log" 2>&1; then
  bad "m38 debug build" "exit 0" "$(tail -3 "$tmp/m38-dbg-build.log")"
else
  m38_dbg_out=$(run_bin "$m38_dbg/.output/bin/m38-dbg" 2>"$tmp/m38-dbg.err")
  m38_dbg_code=$?
  m38_dbg_err=$(cat "$tmp/m38-dbg.err")
  check_eq "m38 debug trace stdout" "42" "$m38_dbg_out"
  check_eq "m38 debug trace exit" "0" "$m38_dbg_code"
  check_contains "m38 debug trace stderr" "$m38_dbg_err" "m38-trace"
  check_contains "m38 debug traceshow stderr" "$m38_dbg_err" "42"
fi
printf 'main : Int\nmain = assert False "m38 assert" 7\n' >"$m38_dbg/app/Main.vuna"
if ! "$VUNA" build "$m38_dbg" >"$tmp/m38-assert-build.log" 2>&1; then
  bad "m38 assert build" "exit 0" "$(tail -3 "$tmp/m38-assert-build.log")"
else
  run_bin "$m38_dbg/.output/bin/m38-dbg" >/dev/null 2>"$tmp/m38-assert.err"
  m38_assert_code=$?
  m38_assert_err=$(cat "$tmp/m38-assert.err")
  check_contains "m38 assert message" "$m38_assert_err" "assertion failed: m38 assert"
  check_contains "m38 assert frame" "$m38_assert_err" "  at main ("
  check_eq "m38 assert exit" "2" "$m38_assert_code"
fi
printf 'main : Int\nmain = todo "m38 todo"\n' >"$m38_dbg/app/Main.vuna"
if ! "$VUNA" build "$m38_dbg" >"$tmp/m38-todo-build.log" 2>&1; then
  bad "m38 todo build" "exit 0" "$(tail -3 "$tmp/m38-todo-build.log")"
else
  run_bin "$m38_dbg/.output/bin/m38-dbg" >/dev/null 2>"$tmp/m38-todo.err"
  m38_todo_code=$?
  if grep -q "TODO: m38 todo" "$tmp/m38-todo.err"; then ok; else bad "m38 todo message" "TODO: m38 todo" "$(cat "$tmp/m38-todo.err")"; fi
  check_eq "m38 todo exit" "2" "$m38_todo_code"
fi


finish
