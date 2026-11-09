#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

# 14) 统一 CLI：help、退出码、子命令要求、已删除参数（M24：DT 是唯一路径，`--dt` 全删；
#     M26：`--root` / `--split` / `seed` 子命令删除）。
section_begin
help_out=$("$VUNA" help 2>&1)
check_contains "vuna help" "$help_out" "usage:"
"$VUNA" >/dev/null 2>&1
check_eq "vuna no args exit" "2" "$?"
rm -rf "$tmp/cli-ok"
"$VUNA" compile corpus/run/01_arithmetic.vuna "$tmp/cli-ok" >/dev/null 2>&1
check_eq "vuna compile exit" "0" "$?"
rm -rf "$tmp/cli-err"
"$VUNA" compile corpus/err/01_case_indent.vuna "$tmp/cli-err" >/dev/null 2>&1
cli_code=$?
if [ "$cli_code" -ne 0 ]; then ok; else bad "vuna compile error exit" "non-zero" "$cli_code"; fi
"$VUNA" corpus/run/01_arithmetic.vuna >/dev/null 2>&1
cli_code=$?
if [ "$cli_code" -ne 0 ]; then ok; else bad "vuna bare command exit" "non-zero" "$cli_code"; fi
bare_msg=$("$VUNA" corpus/run/01_arithmetic.vuna 2>&1)
check_contains "vuna bare command hint" "$bare_msg" "unknown command"
old_nt=$("$VUNA" compile --no-typecheck corpus/run/01_arithmetic.vuna 2>&1)
check_contains "vuna removed --no-typecheck" "$old_nt" "has been removed"
old_ty=$("$VUNA" --typed corpus/run/01_arithmetic.vuna 2>&1)
check_contains "vuna removed --typed" "$old_ty" "has been removed"
# M24：`--dt` 不再属于任何命令（DT 是唯一路径），与 `compile --package` 一并报 removed。
for dt_cmd in compile check build interp; do
  dt_msg=$("$VUNA" "$dt_cmd" --dt 2>&1)
  dt_code=$?
  check_contains "vuna $dt_cmd removed --dt" "$dt_msg" "removed"
  check_eq "vuna $dt_cmd removed --dt exit" "2" "$dt_code"
done
old_pkg=$("$VUNA" compile --package corpus/run/01_arithmetic.vuna 2>&1)
pkg_code=$?
check_contains "vuna removed compile --package" "$old_pkg" "error"
if [ "$pkg_code" -ne 0 ]; then ok; else bad "vuna removed compile --package exit" "non-zero" "$pkg_code"; fi
# M26：removed hint（--root / --split / seed）都必须是 exit 2 + 明确提示。
for removed_cmd in \
  "compile --root lib corpus/run/01_arithmetic.vuna $tmp/removed-1" \
  "interp --root lib corpus/run/01_arithmetic.vuna" \
  "check --root lib corpus/run/01_arithmetic.vuna" \
  "compile --split $tmp/removed-2 corpus/dt_pkg/01_exec" \
  "build --split $tmp/removed-3 corpus/dt_pkg/01_exec" \
  "seed $tmp/removed-4 corpus/dt_pkg/01_exec" \
  "seed"; do
  # shellcheck disable=SC2086
  removed_msg=$("$VUNA" $removed_cmd 2>&1)
  removed_code=$?
  check_contains "vuna removed: $removed_cmd" "$removed_msg" "removed"
  check_eq "vuna removed exit: $removed_cmd" "2" "$removed_code"
done
"$VUNA" interp /no/such/file.vuna >/dev/null 2>&1
check_eq "vuna interp missing exit" "2" "$?"
"$VUNA" lint >/dev/null 2>&1
check_eq "vuna lint no args exit" "2" "$?"

# 14b) 编译器二进制指纹回归（PerfCache.binaryFingerprint）：指纹只能基于可执行文件
#     自身（execPath+size+mtime），**不得**把「第一个用户参数」当路径去读——旧实现用
#     不含 argv[0] 的 prim_getArgs 首参，cwd 里有同名文件/目录时直接
#     `Fatal error: exception Failure("readFile: ...")`。这里 cwd 造一个 `build/`
#     目录（旧实现会命中它）再 `vuna build pkg`，必须正常构建并运行。
fp="$tmp/fp-probe"
mkdir -p "$fp/build/keep" "$fp/pkg/app"
printf '[package]\nname = "fp-probe"\n' >"$fp/pkg/vuna.toml"
printf 'main : Int\nmain = 7\n' >"$fp/pkg/app/Main.vuna"
fp_out=$( cd "$fp" && "$VUNA" build pkg 2>&1 )
fp_code=$?
check_eq "binary fingerprint build exit" "0" "$fp_code"
check_contains "binary fingerprint build built" "$fp_out" "built"
check_eq "binary fingerprint build runs" "7" "$(run_bin "$fp/pkg/.output/bin/fp-probe" 2>&1)"

assert_min_section_checks "§14 统一 CLI" 20


finish
