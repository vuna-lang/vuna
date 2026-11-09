#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

# 28) 包模式（M11.5/M12.8/M24/M26）：workspace + 依赖包 + [export] + app/Main.vuna 入口。
#     正例：`vuna build` 走 DT split → .output/{<Module>.ml,Main.ml,build.sh} + bin/<pkg>；
#     `vuna check` / `vuna test` 也已是 DT（包 check = DT 精化；test = DT 核心求值）。
#     E14（M26）：入口里声明的 data 必须发进产物 Main.ml（05_entry_data / 06_entry_trait）。
require_files "§28 corpus/packages 正例" corpus/packages/[01][0-9]_*/
for dir in corpus/packages/[01][0-9]_*/; do
  dir=${dir%/}
  expected=$(cat "$dir/expected.out")
  rm -rf "$dir/.output"
  if ! pkg_out=$("$VUNA" build "$dir" 2>&1); then
    bad "$dir (package build)" "exit 0" "$pkg_out"
  elif [ ! -f "$dir/.output/Main.ml" ] || [ ! -f "$dir/.output/build.sh" ]; then
    bad "$dir (package layout)" "Main.ml+build.sh" "missing"
  else
    case "$dir" in
      *05_entry_data|*06_entry_trait)
        check_contains "$dir (entry data in Main.ml)" "$(cat "$dir/.output/Main.ml")" "C_Color_Red"
        ;;
    esac
    pkg_bin=
    for b in "$dir"/.output/bin/*; do
      if [ -x "$b" ]; then pkg_bin=$b; fi
    done
    if [ -z "$pkg_bin" ]; then
      bad "$dir (package bin)" "executable under .output/bin" "missing"
    else
      actual=$(run_bin "$pkg_bin" 2>&1)
      check_eq "$dir (package run)" "$expected" "$actual"
    fi
  fi
  "$VUNA" check "$dir" >/dev/null 2>&1
  check_eq "$dir (package check)" "0" "$?"
  test_out=$("$VUNA" test "$dir" 2>&1)
  check_contains "$dir (package test)" "$test_out" "1 passed, 0 failed"
  rm -rf "$dir/.output"
done


finish
