#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

# 45) M38 运行时错误报告：未捕获异常 → "vuna: runtime error: ..." + vuna 位置帧 + exit 2。
#     `.err` 的既有断言（片段 "division by zero"）仍成立；这里额外锁定新格式，
#     并确认不再泄漏 OCaml 的 `Fatal error: exception ...`。纯 main（模块初始化期求值）
#     与 IO main（main 钩子 thunk 执行期）两条路径都覆盖。
m38_rt="$tmp/m38-rt"
mkdir -p "$m38_rt/app"
printf '[package]\nname = "m38-rt"\nprivileged = true\n\n[dependencies]\nvuna-base = "%s"\n' "$VUNA_BASE" >"$m38_rt/vuna.toml"
printf 'main : Int\nmain = 10 / 0\n' >"$m38_rt/app/Main.vuna"
if ! "$VUNA" build "$m38_rt" >"$tmp/m38-rt-build.log" 2>&1; then
  bad "m38 runtime build" "exit 0" "$(tail -3 "$tmp/m38-rt-build.log")"
else
  m38_rt_err=$(run_bin "$m38_rt/.output/bin/m38-rt" 2>&1 >/dev/null)
  m38_rt_code=$?
  check_contains "m38 runtime error message" "$m38_rt_err" "vuna: runtime error: division by zero"
  check_contains "m38 runtime error frame" "$m38_rt_err" "  at main ("
  check_contains "m38 runtime error location" "$m38_rt_err" "app/Main.vuna:"
  check_eq "m38 runtime error exit" "2" "$m38_rt_code"
  case "$m38_rt_err" in
    *"Fatal error"*) bad "m38 runtime error no Fatal" "no Fatal error" "$m38_rt_err" ;;
    *) ok ;;
  esac
fi
printf 'import Base.IO.Host\n\nmain : IO Int\nmain = do\n  println "m38-start"\n  exit (10 / 0)\n' >"$m38_rt/app/Main.vuna"
if ! "$VUNA" build "$m38_rt" >"$tmp/m38-rt-io-build.log" 2>&1; then
  bad "m38 runtime io build" "exit 0" "$(tail -3 "$tmp/m38-rt-io-build.log")"
else
  m38_rt_io_out=$(run_bin "$m38_rt/.output/bin/m38-rt" 2>"$tmp/m38-rt-io.err")
  m38_rt_io_code=$?
  m38_rt_io_err=$(cat "$tmp/m38-rt-io.err")
  check_contains "m38 runtime io stdout" "$m38_rt_io_out" "m38-start"
  check_contains "m38 runtime io frame" "$m38_rt_io_err" "  at main ("
  check_eq "m38 runtime io exit" "2" "$m38_rt_io_code"
fi


finish
