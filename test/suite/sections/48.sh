#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

# 48) M38 vuna run：增量 build + 执行 + 参数透传 + 退出码；--no-build / 缺 bin / 库包。
"$VUNA" build corpus/packages/11_run_args >/dev/null 2>&1
m38_run_out=$("$VUNA" run corpus/packages/11_run_args 2>&1)
m38_run_code=$?
check_contains "m38 run default output" "$m38_run_out" "no args"
check_eq "m38 run exit" "0" "$m38_run_code"
m38_run_args=$("$VUNA" run corpus/packages/11_run_args --no-build -- alpha beta 2>&1)
check_eq "m38 run args passthrough" "alpha" "$m38_run_args"
m38_run_outdir="$tmp/m38-run-outdir"
m38_run_out_out=$("$VUNA" run corpus/packages/11_run_args --out "$m38_run_outdir" 2>&1)
check_contains "m38 run --out output" "$m38_run_out_out" "no args"
m38_run_out_args=$("$VUNA" run corpus/packages/11_run_args --no-build --out "$m38_run_outdir" -- alpha 2>&1)
check_eq "m38 run --out args passthrough" "alpha" "$m38_run_out_args"
m38_run_exit="$tmp/m38-run-exit"
mkdir -p "$m38_run_exit/app"
printf '[package]\nname = "m38-run-exit"\nprivileged = true\n\n[dependencies]\nvuna-base = "%s"\n' "$VUNA_BASE" >"$m38_run_exit/vuna.toml"
printf 'import Base.IO.Host\n\nmain : IO Int\nmain = exit 7\n' >"$m38_run_exit/app/Main.vuna"
if "$VUNA" build "$m38_run_exit" >"$tmp/m38-run-exit-build.log" 2>&1; then
  "$VUNA" run "$m38_run_exit" --no-build >/dev/null 2>&1
  check_eq "m38 run child exit passthrough" "7" "$?"
else
  bad "m38 run child exit build" "exit 0" "$(tail -3 "$tmp/m38-run-exit-build.log")"
fi
m38_run_nobin="$tmp/m38-run-nobin"
mkdir -p "$m38_run_nobin/app"
printf '[package]\nname = "m38-run-nobin"\nprivileged = true\n\n[dependencies]\nvuna-base = "%s"\n' "$VUNA_BASE" >"$m38_run_nobin/vuna.toml"
printf 'main : Int\nmain = 0\n' >"$m38_run_nobin/app/Main.vuna"
m38_run_nobin_out=$("$VUNA" run "$m38_run_nobin" --no-build 2>&1)
m38_run_nobin_code=$?
check_contains "m38 run missing binary" "$m38_run_nobin_out" "binary not found"
check_eq "m38 run missing binary exit" "2" "$m38_run_nobin_code"
m38_run_lib_out=$("$VUNA" run ../base 2>&1)
m38_run_lib_code=$?
check_contains "m38 run library package" "$m38_run_lib_out" "no executable entry"
check_eq "m38 run library package exit" "2" "$m38_run_lib_code"


finish
