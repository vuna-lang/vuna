#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

# 42) M30 P3：REPL 多行/效果 + TestRunner 效果/workspace 聚合
# REPL：多行定义（`=` 续行 + 缩进 + 空行提交）与纯表达式
section_begin
repl_multi=$(printf 'f : Int -> Int\nf x =\n  x + 1\n\nf 41\n:q\n' | "$VUNA" repl 2>&1)
check_contains "vuna repl multiline def" "$repl_multi" "42"
# REPL：IO 表达式走临时包编译+运行（效果输出直接到终端）
repl_io=$(printf 'import Base.IO\nprint "hi"\n:q\n' | "$VUNA" repl 2>&1)
check_contains "vuna repl io effect" "$repl_io" "hi"
# REPL：不完整输入 + 空行 → 报错丢弃但继续
repl_bad=$(printf 'x =\n\n:q\n' | "$VUNA" repl 2>&1)
check_contains "vuna repl incomplete input" "$repl_bad" "输入不完整"

# TestRunner：workspace 聚合（根包 3 纯 + 1 IO，成员 1 纯）
test_ws=$("$VUNA" test corpus/test-m30 2>&1)
test_ws_code=$?
check_eq "vuna test workspace exit" "0" "$test_ws_code"
check_contains "vuna test workspace summary" "$test_ws" "workspace: 5 passed, 0 failed"
check_contains "vuna test workspace io test" "$test_ws" "ok   IoPass.vuna"
check_contains "vuna test member group" "$test_ws" "-- test-m30-member --"
# 失败路径：纯失败 / 效果失败（退出码非 0）/ 不支持的 main 类型 / 聚合失败
"$VUNA" test corpus/test-m30/bad-pure >/dev/null 2>&1
check_eq "vuna test pure fail exit" "1" "$?"
"$VUNA" test corpus/test-m30/bad-io >/dev/null 2>&1
check_eq "vuna test io fail exit" "1" "$?"
"$VUNA" test corpus/test-m30/bad-other >/dev/null 2>&1
check_eq "vuna test other main exit" "1" "$?"
"$VUNA" test corpus/test-m30/ws-fail >/dev/null 2>&1
check_eq "vuna test workspace fail exit" "1" "$?"
# 单包行为不变：没有 test/ 仍是输入错误（exit 2）
"$VUNA" test ../base >/dev/null 2>&1
check_eq "vuna test missing dir exit" "2" "$?"

assert_min_section_checks "§42 vuna test/repl" 7


finish
