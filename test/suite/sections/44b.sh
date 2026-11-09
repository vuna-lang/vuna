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


# 44d/e 的独立预热：只准备接口缓存，不重复断言。
TMPDIR="$summ_cache" "$summ_vuna" check "$VUNA_BASE" >/dev/null 2>&1 || true
TMPDIR="$summ_cache" "$summ_vuna" check "$summ_pkg/dep" >/dev/null 2>&1 || true
TMPDIR="$summ_cache" "$summ_vuna" check "$summ_pkg/root" >/dev/null 2>&1 || true
# 44d) 负例：摘要路径不得漏检；与全量路径诊断逐字节一致。
summ_bad="$tmp/summary-bad"
mkdir -p "$summ_bad/app"
cp "$summ_pkg/root/app/Main.vuna" "$summ_bad/app/Main.vuna"
printf '\nbroken : Int\nbroken = "x"\n' >> "$summ_bad/app/Main.vuna"
sed "s|\.\./dep|$PWD/$summ_pkg/dep|; s|\.\./\.\./\.\./\.\./\.\./base|$VUNA_BASE|" "$summ_pkg/root/vuna.toml" > "$summ_bad/vuna.toml"
summ_bad_out=$(TMPDIR="$summ_cache" "$summ_vuna" check "$summ_bad" 2>&1)
summ_bad_code=$?
if [ "$summ_bad_code" -ne 0 ]; then ok; else bad "summary negative check exit" "non-zero" "$summ_bad_code"; fi
check_contains "summary negative diagnostic" "$summ_bad_out" "TC_TypeMismatch"

# 44c-2) 模块接口构建路径与全量构建路径的 codegen 产物逐字节一致（只 codegen、不链接）。
rm -rf "$tmp/summary-gen-iface" "$tmp/summary-gen-full"
mkdir -p "$tmp/summary-gen-cache-iface" "$tmp/summary-gen-cache-full"
if TMPDIR="$tmp/summary-gen-cache-iface" "$summ_vuna" compile "$summ_pkg/root" "$tmp/summary-gen-iface" >/dev/null 2>&1 \
  && TMPDIR="$tmp/summary-gen-cache-full" VUNA_ELAB_FULL=1 "$summ_vuna" compile "$summ_pkg/root" "$tmp/summary-gen-full" >/dev/null 2>&1; then
  if diff -r "$tmp/summary-gen-iface" "$tmp/summary-gen-full" >"$tmp/summary-gen.diff" 2>&1; then
    ok
  else
    bad "summary codegen iface/full identical" "identical" "$(head -10 "$tmp/summary-gen.diff")"
  fi
else
  bad "summary codegen iface/full build" "exit 0" "failed"
fi

summ_bad_full=$(TMPDIR="$tmp/summary-bad-full" VUNA_ELAB_FULL=1 "$summ_vuna" check "$summ_bad" 2>&1)
summ_bad_full_code=$?
if [ "$summ_bad_full_code" -ne 0 ]; then ok; else bad "summary negative full-path exit" "non-zero" "$summ_bad_full_code"; fi
check_eq "summary/full diagnostics identical" "$summ_bad_full" "$summ_bad_out"

# 44e) 仓库自身：预热 base/compiler 缓存后 check . 走摘要路径且通过（Interp.vuna:71 回归）。
repo_cache="$tmp/summary-repo-cache"
mkdir -p "$repo_cache"
if ! ( cd .. && TMPDIR="$repo_cache" "$summ_vuna" check base >/dev/null 2>&1 && TMPDIR="$repo_cache" "$summ_vuna" check compiler >/dev/null 2>&1 ); then
  bad "summary repo dep check" "0" "base/compiler check failed"
else
  repo_summ=$( cd .. && TMPDIR="$repo_cache" "$summ_vuna" check . --debug-perf 2>&1 )
  repo_summ_code=$?
  check_eq "summary repo check exit" "0" "$repo_summ_code"
  check_contains "summary repo path used" "$repo_summ" "cache-path=summary deps=2"
fi


finish

