#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

# 47) M38 vuna test 选项：--list / --filter（可重复）/ --verbose / --fail-fast；
#     默认输出与退出码不变（第 42 段已锁默认输出，这里锁新开关的行为）。
section_begin
m38_tlist=$("$VUNA" test corpus/test-m30 --list 2>&1)
check_contains "m38 test list root group" "$m38_tlist" "-- test-m30 --"
check_contains "m38 test list file" "$m38_tlist" "PureInt.vuna"
check_contains "m38 test list member group" "$m38_tlist" "-- test-m30-member --"
m38_tfilter=$("$VUNA" test corpus/test-m30 --filter Pure 2>&1)
check_contains "m38 test filter run" "$m38_tfilter" "workspace: 4 passed, 0 failed"
case "$m38_tfilter" in
  *"IoPass.vuna"*) bad "m38 test filter excludes" "IoPass.vuna not run" "$m38_tfilter" ;;
  *) ok ;;
esac
m38_tmulti=$("$VUNA" test corpus/test-m30 --filter IoPass --filter member 2>&1)
check_contains "m38 test filter repeated" "$m38_tmulti" "workspace: 2 passed, 0 failed"
m38_tnone=$("$VUNA" test corpus/test-m30 --filter zzz-nomatch 2>&1)
m38_tnone_code=$?
check_contains "m38 test filter no match" "$m38_tnone" "workspace: 0 passed, 0 failed"
check_eq "m38 test filter no match exit" "0" "$m38_tnone_code"
m38_tverbose=$("$VUNA" test corpus/test-m30 --filter IoPass --verbose 2>&1)
check_contains "m38 test verbose per-file ms" "$m38_tverbose" "ok   IoPass.vuna ("
check_contains "m38 test verbose total" "$m38_tverbose" "total: "
"$VUNA" test corpus/test-m30 --filter >/dev/null 2>&1
check_eq "m38 test filter missing value" "2" "$?"
# fail-fast：root 组失败、member 组通过；默认会跑到 member，fail-fast 不会。
m38_ff="$tmp/m38-ff"
mkdir -p "$m38_ff/app" "$m38_ff/test" "$m38_ff/member/app" "$m38_ff/member/test"
printf '[package]\nname = "m38-ff"\n\n[workspace]\nmembers = ["member"]\n\n[dependencies]\nvuna-base = "%s"\n' "$VUNA_BASE" >"$m38_ff/vuna.toml"
printf '[package]\nname = "m38-ff-member"\n\n[dependencies]\nvuna-base = "%s"\n' "$VUNA_BASE" >"$m38_ff/member/vuna.toml"
printf 'main : Int\nmain = 0\n' >"$m38_ff/app/Main.vuna"
printf 'main : Int\nmain = 0\n' >"$m38_ff/member/app/Main.vuna"
printf 'main : Int\nmain = 1\n' >"$m38_ff/test/Fail.vuna"
printf 'main : Int\nmain = 0\n' >"$m38_ff/member/test/Pass.vuna"
m38_ff_all=$("$VUNA" test "$m38_ff" 2>&1)
m38_ff_all_code=$?
check_contains "m38 test fail-fast baseline member" "$m38_ff_all" "-- m38-ff-member --"
check_contains "m38 test fail-fast baseline summary" "$m38_ff_all" "workspace: 1 passed, 1 failed"
check_eq "m38 test fail-fast baseline exit" "1" "$m38_ff_all_code"
m38_ff_stop=$("$VUNA" test "$m38_ff" --fail-fast 2>&1)
m38_ff_stop_code=$?
check_contains "m38 test fail-fast summary" "$m38_ff_stop" "workspace: 0 passed, 1 failed"
check_eq "m38 test fail-fast exit" "1" "$m38_ff_stop_code"
case "$m38_ff_stop" in
  *"-- m38-ff-member --"*) bad "m38 test fail-fast stops" "member group skipped" "$m38_ff_stop" ;;
  *) ok ;;
esac

assert_min_section_checks "§47 vuna test 选项" 12

finish
