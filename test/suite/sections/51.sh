#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

# 51) mtime 快路径安全窗（`VUNA_CACHE_MTIME=1`）：`prim_fileMtime` 只有秒精度，
#     「同秒 + 同大小」的编辑不能靠 mtime+size 判未变。安全窗（5s）内一律回落内容哈希，
#     所以刚写出的接口即使 mtime/size 都没变也必须被判定失效（回退全量、报出真实错误）。
#     确定性做法：编辑后把 mtime 显式 touch 回记录的秒值（模拟同一秒内两次写）。
mt_cache="$tmp/mtime-window-cache"
mt_dep="$tmp/mtime-window-dep"
mt_root="$tmp/mtime-window-root"
rm -rf "$mt_cache" "$mt_dep" "$mt_root"
mkdir -p "$mt_dep/lib" "$mt_root/app"
printf '[package]\nname = "mtime-window-dep"\n\n[export]\nmodules = ["MDep"]\n\n[dependencies]\nvuna-base = "%s"\n' "$VUNA_BASE" >"$mt_dep/vuna.toml"
printf 'module MDep (mVal) where\n\nmVal : Int\nmVal = 1\n' >"$mt_dep/lib/MDep.vuna"
printf '[package]\nname = "mtime-window-root"\n\n[dependencies]\nmtime-window-dep = "%s"\nvuna-base = "%s"\n' "$mt_dep" "$VUNA_BASE" >"$mt_root/vuna.toml"
printf 'import MDep\n\nmain : Int\nmain = mVal\n' >"$mt_root/app/Main.vuna"
if TMPDIR="$mt_cache" VUNA_CACHE_MTIME=1 "$VUNA" check "$VUNA_BASE" >/dev/null 2>&1 \
  && TMPDIR="$mt_cache" VUNA_CACHE_MTIME=1 "$VUNA" check "$mt_dep" >/dev/null 2>&1 \
  && TMPDIR="$mt_cache" VUNA_CACHE_MTIME=1 "$VUNA" check "$mt_root" >/dev/null 2>&1; then
  mt_file="$mt_dep/lib/MDep.vuna"
  mt_sec=$(stat -c %Y "$mt_file")
  mt_size=$(stat -c %s "$mt_file")
  # 同字节长度改内容：Int → Bnt（未知类型名；mtime 秒值与大小都不变）。
  sed -i 's/mVal : Int/mVal : Bnt/' "$mt_file"
  touch -d "@$mt_sec" "$mt_file"
  mt_now=$(date +%s)
  if [ "$(stat -c %Y "$mt_file")" = "$mt_sec" ] && [ "$(stat -c %s "$mt_file")" = "$mt_size" ] && [ $((mt_now - mt_sec)) -lt 5 ]; then
    mt_out=$(TMPDIR="$mt_cache" VUNA_CACHE_MTIME=1 "$VUNA" check "$mt_root" 2>&1)
    mt_code=$?
    if [ "$mt_code" -ne 0 ]; then ok; else bad "mtime window same-second edit invalidated" "non-zero" "check passed with stale iface"; fi
    check_contains "mtime window diagnostic" "$mt_out" "Bnt"
  else
    bad "mtime window fixture" "same mtime/size within 5s" "sec=$mt_sec size=$mt_size now=$mt_now"
  fi
else
  bad "mtime window warmup" "0" "base/dep/root check failed"
fi


finish
