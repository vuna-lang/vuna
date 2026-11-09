#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

# 38) M26 API/产物快照：exports（导出面）/ modules（模块面）/ split 产物布局与逐文件
#     `type t_`/`let v_` 名字清单。快照由 `sh test/snapshots/update.sh` 生成并提交；
#     这里现场重生成到 $tmp 再逐文件 diff（失败提示重生成命令）。
snapdir=snapshots
snap_tmp="$tmp/snapshots"
mkdir -p "$snap_tmp"
if ! VUNA="$VUNA" VUNA_BASE="$VUNA_BASE" sh "$snapdir/update.sh" "$snap_tmp" >"$tmp/snap-update.log" 2>&1; then
  bad "snapshots generate" "exit 0" "$(tail -5 "$tmp/snap-update.log")"
else
  for snap_file in exports.txt modules.txt split-05_entry_data.txt split-06_entry_trait.txt split-dt_ad_hoc.txt; do
    if [ ! -f "$snapdir/$snap_file" ]; then
      bad "snapshot $snap_file" "committed file" "missing (sh test/snapshots/update.sh)"
    elif diff -u "$snapdir/$snap_file" "$snap_tmp/$snap_file" >"$tmp/snap-$snap_file.diff" 2>&1; then
      ok
    else
      bad "snapshot $snap_file" "identical" "$(head -20 "$tmp/snap-$snap_file.diff") (sh test/snapshots/update.sh)"
    fi
  done
fi


finish
