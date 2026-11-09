#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

# 52) C32 最小硬化：check / split / ast 缓存载荷统一 framing（magic|tag|长度|校验和）。
#     截断（长度不符）、篡改（校验和不符）都必须被读侧拒绝 ⇒ 回退重算、不崩，且缓存文件
#     被重写成合法 framing。单字节篡改用 dd 打在载荷中部（不是头部，避免只靠 magic 就过）。
c32_pkg="$tmp/c32-pkg"
c32_cache="$tmp/c32-cache"
c32_clean="$tmp/c32-clean"
c32_out2="$tmp/c32-out2"
rm -rf "$c32_pkg" "$c32_cache" "$c32_clean" "$c32_out2"
cp -r corpus/packages/m34_summary "$c32_pkg"
sed -i "s|\.\./\.\./\.\./\.\./\.\./base|$VUNA_BASE|" "$c32_pkg/root/vuna.toml"
sed -i "s|\.\./\.\./\.\./\.\./\.\./base|$VUNA_BASE|" "$c32_pkg/dep/vuna.toml" 2>/dev/null || true
if TMPDIR="$c32_cache" "$VUNA" build --no-compile --out "$c32_clean" "$c32_pkg/root" >/dev/null 2>&1; then
  c32_split=$(find "$c32_cache"/vuna-cache -path '*split*' -type f 2>/dev/null | head -1)
  if [ -n "$c32_split" ]; then
    # 52a) 截断：头行完整、载荷少一截（长度校验必须拒绝）。
    head -c 4096 "$c32_split" > "$c32_split.part"
    mv "$c32_split.part" "$c32_split"
    c32_rc=0
    TMPDIR="$c32_cache" "$VUNA" build --no-compile --out "$c32_out2" "$c32_pkg/root" >/dev/null 2>&1 || c32_rc=$?
    check_eq "c32 truncated split cache rebuild exit" "0" "$c32_rc"
    if diff -r "$c32_clean" "$c32_out2" >/dev/null 2>&1; then ok; else bad "c32 truncated split cache output" "identical" "diff"; fi
    check_eq "c32 truncated split cache rewritten" "vuna-cache-frame 1" "$(head -c 18 "$c32_split")"
    # 52b) 篡改：在载荷中部改一个字节（长度不变，校验和必须拒绝）。
    c32_off=$(( $(stat -c %s "$c32_split") / 2 ))
    printf 'X' | dd of="$c32_split" bs=1 seek="$c32_off" conv=notrunc 2>/dev/null
    c32_rc=0
    TMPDIR="$c32_cache" "$VUNA" build --no-compile --out "$c32_out2" "$c32_pkg/root" >/dev/null 2>&1 || c32_rc=$?
    check_eq "c32 tampered split cache rebuild exit" "0" "$c32_rc"
    if diff -r "$c32_clean" "$c32_out2" >/dev/null 2>&1; then ok; else bad "c32 tampered split cache output" "identical" "diff"; fi
  else
    bad "c32 split cache fixture" "split cache file" "none"
  fi
else
  bad "c32 clean build" "0" "failed"
fi

# 52c) check 缓存：截断后必须视为未命中（重算并覆盖），不能静默当成功。
c32_cc="$tmp/c32-check-cache"
rm -rf "$c32_cc"
TMPDIR="$c32_cc" "$VUNA" check "$c32_pkg/dep" >/dev/null 2>&1
TMPDIR="$c32_cc" "$VUNA" check "$c32_pkg/root" >/dev/null 2>&1
c32_check=$(find "$c32_cc"/vuna-cache -path '*/check/*' -type f 2>/dev/null | head -1)
if [ -n "$c32_check" ]; then
  # 把**全部** check 缓存文件截断：只挑一个可能挑到 dep 的缓存，root check 仍命中自己的
  # 合法缓存 ⇒ 没有 cache-path 日志（Nix 沙箱与本地目录顺序不同，曾因此假失败）。
  for c32_f in $(find "$c32_cc"/vuna-cache -path '*/check/*' -type f 2>/dev/null); do
    head -c 200 "$c32_f" > "$c32_f.part"
    mv "$c32_f.part" "$c32_f"
  done
  c32_log=$(TMPDIR="$c32_cc" VUNA_DEBUG_PERF=1 "$VUNA" check "$c32_pkg/root" 2>&1)
  c32_code=$?
  check_eq "c32 corrupt check cache exit" "0" "$c32_code"
  check_contains "c32 corrupt check cache recomputed" "$c32_log" "cache-path="
  c32_reframed=1
  for c32_f in $(find "$c32_cc"/vuna-cache -path '*/check/*' -type f 2>/dev/null); do
    [ "$(head -c 18 "$c32_f")" = "vuna-cache-frame 1" ] || c32_reframed=0
  done
  check_eq "c32 corrupt check cache rewritten" "1" "$c32_reframed"
else
  bad "c32 check cache fixture" "check cache file" "none"
fi

# 52d) AST 缓存：全部截断后照常 parse 并重写（原实现会 Marshal.from_string 崩溃）。
c32_ac="$tmp/c32-ast-cache"
rm -rf "$c32_ac"
TMPDIR="$c32_ac" "$VUNA" check "$c32_pkg/root" >/dev/null 2>&1
TMPDIR="$c32_ac" "$VUNA" check "$c32_pkg/root" >/dev/null 2>&1
c32_ast_list=$(find "$c32_ac/vuna-cache/ast" -type f 2>/dev/null)
if [ -n "$c32_ast_list" ]; then
  c32_ast_count=$(printf '%s\n' "$c32_ast_list" | wc -l | tr -d ' ')
  for f in $c32_ast_list; do
    head -c 8 "$f" > "$f.part"
    mv "$f.part" "$f"
  done
  # 删掉 check 缓存强制重算（否则 check 命中根本不会 parse，也就不会读 AST 缓存）。
  rm -rf "$c32_ac"/vuna-cache/*/check
  c32_rc=0
  TMPDIR="$c32_ac" "$VUNA" check "$c32_pkg/root" >/dev/null 2>&1 || c32_rc=$?
  check_eq "c32 truncated ast cache recheck exit" "0" "$c32_rc"
  c32_framed=0
  for f in $(find "$c32_ac/vuna-cache/ast" -type f 2>/dev/null); do
    [ "$(head -c 18 "$f")" = "vuna-cache-frame 1" ] && c32_framed=$((c32_framed + 1))
  done
  check_eq "c32 truncated ast cache rewritten" "$c32_ast_count" "$c32_framed"
else
  bad "c32 ast cache fixture" "ast cache files" "none"
fi


finish
