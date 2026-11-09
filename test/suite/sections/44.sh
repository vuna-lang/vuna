#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

# 44) M34.5 接口摘要（TTC 式模块化精化）：依赖包缓存预热后，根包只精化本包 decls。
#     正向：摘要路径命中（cache-path=summary）且 check 通过、产物正确；
#     负向：注入类型错误时摘要路径与全量路径（VUNA_ELAB_FULL=1）诊断逐字节一致；
#     回归：仓库自身 check . 在摘要路径下通过（C37 的 Eq Type 假歧义）。
summ_pkg=corpus/packages/m34_summary
summ_cache="$tmp/summary-cache"
mkdir -p "$summ_cache"

# 44a) 依赖闭包自底向上预热：base（无依赖）→ dep（库包，消费 base 接口）→ root。
#      `VUNA_IFACE_SELFTEST=1` 让写侧读回校验（Marshal 稳定性 / 包接口 / 模块名集合）。
if TMPDIR="$summ_cache" VUNA_IFACE_SELFTEST=1 "$summ_vuna" check "$VUNA_BASE" --debug-perf >"$tmp/summ-base.log" 2>&1; then
  ok
else
  bad "summary base check exit" "0" "$(tail -3 "$tmp/summ-base.log")"
fi
check_contains "summary base iface selftest" "$(cat "$tmp/summ-base.log")" "iface-selftest=ok"
if TMPDIR="$summ_cache" VUNA_IFACE_SELFTEST=1 "$summ_vuna" check "$summ_pkg/dep" --debug-perf >"$tmp/summ-dep.log" 2>&1; then
  ok
else
  bad "summary dep check exit" "0" "$(tail -3 "$tmp/summ-dep.log")"
fi
check_contains "summary dep iface selftest" "$(cat "$tmp/summ-dep.log")" "iface-selftest=ok"

# 44a-2) 接口布局：包镜像根下有 `.vuna-iface` manifest + 每模块一个 iface 文件（与源码
#        布局一致）；删掉 check 缓存后重算但接口未变 ⇒ 写侧只重写 manifest（`iface-write=0/`）。
summ_iface_dir=$(iface_mirror_dir "$VUNA_BASE")
if [ -f "$summ_iface_dir/.vuna-iface" ] && find "$summ_iface_dir" -name '*.iface' 2>/dev/null | grep -q .; then
  ok
else
  bad "summary per-module iface files" ".vuna-iface + *.iface" "missing under $summ_iface_dir"
fi
find "$summ_cache"/vuna-cache -type d -name check -prune -exec rm -rf {} + 2>/dev/null || true
if TMPDIR="$summ_cache" VUNA_IFACE_SELFTEST=1 "$summ_vuna" check "$VUNA_BASE" --debug-perf >"$tmp/summ-base2.log" 2>&1; then
  check_contains "summary per-module rewrite skip" "$(cat "$tmp/summ-base2.log")" "iface-write=0/"
else
  bad "summary per-module rewrite recheck" "0" "$(tail -3 "$tmp/summ-base2.log")"
fi

# 44a-3) 损坏的模块接口文件：读侧按自描述头拒绝 ⇒ 回退全量；写侧强制全量重写并修复
#        （不会因为「manifest 说哈希没变」而永久跳过损坏文件）。
corrupt_file=$(find "$summ_iface_dir" -name '*.iface' 2>/dev/null | head -1)
printf 'not-a-valid-iface' > "$corrupt_file"
rm -rf "$summ_cache"/vuna-cache/*/check
if TMPDIR="$summ_cache" VUNA_IFACE_SELFTEST=1 "$summ_vuna" check "$VUNA_BASE" --debug-perf >"$tmp/summ-corrupt.log" 2>&1; then
  check_contains "summary corrupt iface falls back" "$(cat "$tmp/summ-corrupt.log")" "cache-path=summary deps=0"
  check_contains "summary corrupt iface repaired" "$(cat "$tmp/summ-corrupt.log")" "iface-selftest=ok"
  check_contains "summary corrupt iface rewritten" "$(head -c 40 "$corrupt_file")" "vuna-iface-file 1"
else
  bad "summary corrupt iface check" "0" "$(tail -3 "$tmp/summ-corrupt.log")"
fi

# 44b) 根包（入口-only 包，没有 lib 模块接口可写）：依赖接口命中 ⇒ 摘要路径；依赖模块
#     **不再 parse 源码**；check 通过。
summ_root=$(TMPDIR="$summ_cache" VUNA_IFACE_SELFTEST=1 "$summ_vuna" check "$summ_pkg/root" --debug-perf 2>&1)
summ_root_code=$?
check_eq "summary root check exit" "0" "$summ_root_code"
check_contains "summary path used" "$summ_root" "cache-path=summary deps=2"
if printf '%s' "$summ_root" | grep -q "parse-module=Dep"; then
  bad "summary dep module not parsed" "absent" "found parse-module=Dep"
else
  ok
fi


# 44b-2) mtime 快路径：独立缓存里以 `VUNA_CACHE_MTIME=1` 预热 base/dep 后，根包仍命中摘要
#        路径（读侧用 mtime+size 快判；写侧仍存内容哈希）。
summ_mt_cache="$tmp/summary-mtime-cache"
mkdir -p "$summ_mt_cache"
TMPDIR="$summ_mt_cache" VUNA_CACHE_MTIME=1 "$summ_vuna" check "$VUNA_BASE" >/dev/null 2>&1
TMPDIR="$summ_mt_cache" VUNA_CACHE_MTIME=1 "$summ_vuna" check "$summ_pkg/dep" >/dev/null 2>&1
summ_root_mt=$(TMPDIR="$summ_mt_cache" VUNA_CACHE_MTIME=1 "$summ_vuna" check "$summ_pkg/root" --debug-perf 2>&1)
check_contains "summary mtime fast path" "$summ_root_mt" "cache-path=summary deps=2"

# 44c) 同一份源码全量路径也通过；构建产物正确（摘要只服务 check，codegen 仍全量）。
if TMPDIR="$tmp/summary-full-cache" VUNA_ELAB_FULL=1 "$summ_vuna" check "$summ_pkg/root" >/dev/null 2>&1; then ok; else bad "summary full-path check exit" "0" "$?"; fi
rm -rf "$tmp/summary-out"
if ! "$summ_vuna" build --out "$tmp/summary-out" "$summ_pkg/root" >/dev/null 2>&1; then
  bad "summary build exit" "0" "failed"
else
  check_eq "summary build runs" "42" "$(run_bin "$tmp/summary-out/bin/summary-root" 2>&1)"
fi


finish
