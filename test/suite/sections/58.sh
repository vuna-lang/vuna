#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

# 58) 只读降级：iface 目录不可写（父路径是普通文件，root 也必失败）时 check 退出码不变、
#     打 `iface-skip readonly`、不崩；REPL 照旧（没有接口就回退全量）。
iface_ro_file="$tmp/iface-ro-file"
iface_ro_cache="$tmp/iface-ro-cache"
: >"$iface_ro_file"
iface_ro_log=$(TMPDIR="$iface_ro_cache" VUNA_IFACE_DIR="$iface_ro_file/iface" "$summ_vuna" check "$VUNA_BASE" --debug-perf 2>&1)
iface_ro_code=$?
check_eq "iface readonly check exit" "0" "$iface_ro_code"
check_contains "iface readonly skip note" "$iface_ro_log" "iface-skip readonly"
check_eq "iface readonly no stray file" "1" "$(find "$iface_ro_file" -maxdepth 0 -type f | wc -l)"
iface_ro_repl=$(printf 'x : Int\nx = 1 + 1\nx\n:q\n' | TMPDIR="$iface_ro_cache" VUNA_IFACE_DIR="$iface_ro_file/iface" "$summ_vuna" repl 2>&1)
check_contains "iface readonly repl works" "$iface_ro_repl" "2"

# 58b) 默认布局写只读源树（Nix store 场景）：非 root 时用 chmod 模拟；root 下由
#      `nix build` / `flake check` 的 store 只读路径覆盖，这里记一条 ok。
iface_ro_src="$tmp/iface-ro-src"
cp -r "$VUNA_BASE" "$iface_ro_src"
if [ "$(id -u)" -ne 0 ]; then
  chmod -R a-w "$iface_ro_src"
  if ( unset VUNA_IFACE_DIR; TMPDIR="$tmp/iface-ro-src-cache" "$summ_vuna" check "$iface_ro_src" --debug-perf >"$tmp/iface-ro-src.log" 2>&1 ); then
    check_contains "iface readonly source tree skip" "$(cat "$tmp/iface-ro-src.log")" "iface-skip readonly"
  else
    bad "iface readonly source tree check" "0" "$(tail -3 "$tmp/iface-ro-src.log")"
  fi
  chmod -R u+w "$iface_ro_src"
else
  ok
fi


finish
