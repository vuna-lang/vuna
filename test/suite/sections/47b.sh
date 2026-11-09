#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

# 47b) W1 单测超时（`vuna test` 的 IO 路径）：corpus/cli/timeout_hang 有一个 1ms 的通过
#      测试和一个 30s 的长睡眠测试；短超时（8s，够 build）下必须「长睡眠 FAIL 且不挂死、
#      1ms 测试照常通过」。退出码 1（有失败），失败行文案带 timed out after Ns。
m38_th_out=$(VUNA_TEST_TIMEOUT=8 "$VUNA" test corpus/cli/timeout_hang 2>&1)
m38_th_code=$?
check_eq "vuna test io timeout exit" "1" "$m38_th_code"
check_contains "vuna test io timeout keeps quick test" "$m38_th_out" "ok   timeout_quick.vuna"
check_contains "vuna test io timeout fail message" "$m38_th_out" "FAIL timeout_sleep.vuna: timed out after 8s"
check_contains "vuna test io timeout summary" "$m38_th_out" "1 passed, 1 failed"


finish
