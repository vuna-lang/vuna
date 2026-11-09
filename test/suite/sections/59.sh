#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

# 59) `vuna clean-iface`：批量删除 `*.iface` / `.vuna-iface` / `*.iface.*.tmp`，不动源码与
#     其他文件；--dry-run 只报数量；不存在的目录 exit 2。
clean_dir="$tmp/clean-iface-pkg"
cp -r "$VUNA_BASE" "$clean_dir"
( unset VUNA_IFACE_DIR; TMPDIR="$tmp/clean-iface-cache" "$summ_vuna" check "$clean_dir" >/dev/null 2>&1 )
printf 'user note\n' >"$clean_dir/keep.txt"
clean_before=$(find "$clean_dir" -name '*.iface' | wc -l)
if [ "$clean_before" -gt 0 ]; then ok; else bad "clean-iface warmup" ">0 iface" "none"; fi
clean_dry=$("$summ_vuna" clean-iface --dry-run "$clean_dir" 2>&1)
check_contains "clean-iface dry-run count" "$clean_dry" "would remove"
check_eq "clean-iface dry-run keeps files" "$clean_before" "$(find "$clean_dir" -name '*.iface' | wc -l)"
clean_out=$("$summ_vuna" clean-iface "$clean_dir" 2>&1)
check_contains "clean-iface removed" "$clean_out" "removed"
check_eq "clean-iface no module files left" "0" "$(find "$clean_dir" -name '*.iface' | wc -l)"
check_eq "clean-iface manifest removed" "0" "$(find "$clean_dir" -maxdepth 1 -name '.vuna-iface' | wc -l)"
if [ -f "$clean_dir/keep.txt" ]; then ok; else bad "clean-iface keeps other files" "present" "missing"; fi
clean_out2=$("$summ_vuna" clean-iface "$clean_dir" 2>&1)
check_contains "clean-iface no files message" "$clean_out2" "no iface files"
"$summ_vuna" clean-iface "$tmp/no-such-clean-dir" >"$tmp/clean-iface-bad.log" 2>&1
clean_bad_code=$?
check_eq "clean-iface bad dir exit" "2" "$clean_bad_code"
check_contains "clean-iface bad dir message" "$(cat "$tmp/clean-iface-bad.log")" "no such directory"


finish
