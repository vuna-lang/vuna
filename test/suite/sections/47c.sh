#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

# 47c) 独立夹具副本，避免与 §42/§47a 争 corpus/test-m30 的 .output。
ws_test_m30="corpus/.m38-ws-47c"
rm -rf "$ws_test_m30"
cp -r corpus/test-m30 "$ws_test_m30"
trap 'rm -rf "$ws_test_m30"' EXIT

# 47c) `vuna test --jobs N`：包内测试文件进程级并行（每个文件一个子进程，
#      父进程 prim_wait 汇总）。夹具 corpus/packages/m38_test_jobs：3 个纯测试 + 2 个 IO
#      测试 + 2 个「START → sleep → END」重叠探针；fail/ 是独立嵌套包（1 通过 + 1 失败）。
#      断言：串行/并行 exit 0 且 pass/fail 行集合逐字一致、汇总一致；重叠证据（串行下
#      第一个 END 早于第二个 START，jobs=2 下两个 START 都早于第一个 END）；失败文件
#      exit 1 + FAIL 行；非法 --jobs exit 2；workspace 聚合行为不变。
mp_fixture=corpus/packages/m38_test_jobs
if [ -d "$mp_fixture" ]; then ok; else bad "m38 test jobs fixture" "directory" "missing $mp_fixture"; fi
mp_serial=$("$VUNA" test "$mp_fixture" 2>&1)
mp_serial_code=$?
check_eq "m38 test jobs serial exit" "0" "$mp_serial_code"
check_contains "m38 test jobs serial summary" "$mp_serial" "7 passed, 0 failed"
mp_parallel=$("$VUNA" test "$mp_fixture" --jobs 2 2>&1)
mp_parallel_code=$?
check_eq "m38 test jobs parallel exit" "0" "$mp_parallel_code"
check_contains "m38 test jobs parallel summary" "$mp_parallel" "7 passed, 0 failed"
# 并行只改变行序，不改变 ok/FAIL 行的集合（IO 测试自身的输出行不参与比较）。
mp_serial_lines=$(printf '%s\n' "$mp_serial" | grep -E '^(ok   |FAIL )' | LC_ALL=C sort)
mp_parallel_lines=$(printf '%s\n' "$mp_parallel" | grep -E '^(ok   |FAIL )' | LC_ALL=C sort)
check_eq "m38 test jobs parallel result lines" "$mp_serial_lines" "$mp_parallel_lines"
# 重叠证据：首个 END 之前的 START 行数。用 --filter 只选两个探针，保证 jobs=2 时
# 两者一定在同一个窗口里启动（不依赖 readdir 顺序）。
mp_starts_before_first_end() {
  printf '%s\n' "$1" | awk '/^START-/{n++} /^END-/{print n + 0; exit}'
}
mp_overlap_serial=$("$VUNA" test "$mp_fixture" --filter Overlap 2>&1)
mp_overlap_parallel=$("$VUNA" test "$mp_fixture" --filter Overlap --jobs 2 2>&1)
check_contains "m38 test jobs overlap serial summary" "$mp_overlap_serial" "2 passed, 0 failed"
check_contains "m38 test jobs overlap parallel summary" "$mp_overlap_parallel" "2 passed, 0 failed"
check_eq "m38 test jobs serial no overlap" "1" "$(mp_starts_before_first_end "$mp_overlap_serial")"
check_eq "m38 test jobs parallel overlap" "2" "$(mp_starts_before_first_end "$mp_overlap_parallel")"
# --verbose 并行：每文件耗时由子进程打印在行尾，total 行由父进程打印。
mp_parallel_verbose=$("$VUNA" test "$mp_fixture" --filter Pure --jobs 2 --verbose 2>&1)
check_contains "m38 test jobs parallel verbose per-file ms" "$mp_parallel_verbose" "ok   PureOne.vuna ("
check_contains "m38 test jobs parallel verbose total" "$mp_parallel_verbose" "total: "
# 失败路径：并行下 exit 1 + FAIL 行 + 正确汇总；fail-fast 下在跑文件等完再汇总。
mp_jobs_fail=$("$VUNA" test "$mp_fixture/fail" --jobs 2 2>&1)
mp_jobs_fail_code=$?
check_eq "m38 test jobs parallel fail exit" "1" "$mp_jobs_fail_code"
check_contains "m38 test jobs parallel fail line" "$mp_jobs_fail" "FAIL FailOne.vuna:"
check_contains "m38 test jobs parallel fail summary" "$mp_jobs_fail" "1 passed, 1 failed"
mp_jobs_ff=$("$VUNA" test "$mp_fixture/fail" --jobs 2 --fail-fast 2>&1)
mp_jobs_ff_code=$?
check_eq "m38 test jobs parallel fail-fast exit" "1" "$mp_jobs_ff_code"
check_contains "m38 test jobs parallel fail-fast fail line" "$mp_jobs_ff" "FAIL FailOne.vuna:"
# 非法 --jobs：0 / 非数字 / 缺值都是 usage error（exit 2）。
"$VUNA" test "$mp_fixture" --jobs 0 >/dev/null 2>&1
check_eq "m38 test jobs zero exit" "2" "$?"
"$VUNA" test "$mp_fixture" --jobs abc >/dev/null 2>&1
check_eq "m38 test jobs invalid exit" "2" "$?"
"$VUNA" test "$mp_fixture" --jobs >/dev/null 2>&1
check_eq "m38 test jobs missing value exit" "2" "$?"
# workspace 聚合不变：包间仍串行，包内文件并行。
mp_ws=$("$VUNA" test "$ws_test_m30" --jobs 2 2>&1)
mp_ws_code=$?
check_eq "m38 test jobs workspace exit" "0" "$mp_ws_code"
check_contains "m38 test jobs workspace summary" "$mp_ws" "workspace: 5 passed, 0 failed"
check_contains "m38 test jobs workspace member group" "$mp_ws" "-- test-m30-member --"

assert_min_section_checks "§47 vuna test 选项" 12


finish
