#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

# 50) M38 CLI 诊断片段：`-->` + 源码行 + 插入符；无位置错误保持单行；退出码不变。
m38_diag="$tmp/m38-diag-pkg"
mkdir -p "$m38_diag/app"
printf '[package]\nname = "m38-diag-pkg"\n\n[dependencies]\nvuna-base = "%s"\n' "$VUNA_BASE" >"$m38_diag/vuna.toml"
printf 'main : Int\nmain = "boom"\n' >"$m38_diag/app/Main.vuna"
m38_diag_out=$("$VUNA" check "$m38_diag" 2>&1)
m38_diag_code=$?
check_contains "m38 diag snippet arrow" "$m38_diag_out" "  --> "
check_contains "m38 diag snippet location" "$m38_diag_out" "app/Main.vuna:2:8"
check_contains "m38 diag snippet source line" "$m38_diag_out" 'main = "boom"'
check_contains "m38 diag snippet caret" "$m38_diag_out" "^"
check_eq "m38 diag snippet exit" "1" "$m38_diag_code"
m38_noloc=$("$VUNA" check "$tmp/m38-no-such-entry.vuna" 2>&1)
m38_noloc_code=$?
check_contains "m38 diag no-location message" "$m38_noloc" "no such file"
check_eq "m38 diag no-location exit" "1" "$m38_noloc_code"
case "$m38_noloc" in
  *"-->"*) bad "m38 diag no-location single line" "no snippet" "$m38_noloc" ;;
  *) ok ;;
esac
# 44f) 包内逐模块增量（S4）：复制 base，改一个叶子模块后重算——其余模块复用、只 parse
#      改动模块、第二次运行收敛（全部干净、零重写）、manifest 与全量路径逐字节一致，
#      注入类型错误后增量与全量诊断逐字节一致。
summ_pkg=corpus/packages/m34_summary
summ_vuna=$(command -v "$VUNA" 2>/dev/null || true)
[ -n "$summ_vuna" ] || summ_vuna="$VUNA"
repo_cache="$tmp/summary-repo-cache"
mkdir -p "$repo_cache"

incr_base="$tmp/incr-base"
incr_cache="$tmp/incr-cache"
cp -r "$VUNA_BASE" "$incr_base"
if ! TMPDIR="$incr_cache" "$summ_vuna" check "$incr_base" >/dev/null 2>&1; then
  bad "summary incremental cold check" "0" "cold base copy failed"
else
  printf '\nincrProbe : Int\nincrProbe = 1\n' >> "$incr_base/lib/Base/Error.vuna"
  incr_log=$(TMPDIR="$incr_cache" "$summ_vuna" check "$incr_base" --debug-perf 2>&1)
  incr_code=$?
  check_eq "summary incremental check exit" "0" "$incr_code"
  incr_total=$(find "$(iface_mirror_dir "$incr_base")" -name "*.iface" 2>/dev/null | wc -l)
  incr_clean=$(printf %s "$incr_log" | sed -n "s/.*cache-own-clean=\([0-9][0-9]*\).*/\1/p")
  if [ -n "$incr_clean" ] && [ "$incr_total" -gt 0 ] && [ "$incr_clean" -lt "$incr_total" ]; then ok; else bad "summary incremental reuses clean modules" "0 < clean < $incr_total" "clean=$incr_clean total=$incr_total"; fi
  incr_parse=$(printf %s "$incr_log" | grep -c "parse-module=Base\." || true)
  check_eq "summary incremental parses only dirty modules" "$((incr_total - incr_clean))" "$incr_parse"
  incr_writes=$(printf %s "$incr_log" | grep -o "iface-write=[0-9]*" | head -1 | cut -d= -f2)
  if [ -n "$incr_writes" ] && [ "$incr_writes" -ge 1 ]; then ok; else bad "summary incremental writes changed module" ">=1" "writes=$incr_writes"; fi
  rm -rf "$incr_cache"/vuna-cache/*/check
  incr_log2=$(TMPDIR="$incr_cache" "$summ_vuna" check "$incr_base" --debug-perf 2>&1)
  check_contains "summary incremental converged clean" "$incr_log2" "cache-own-clean=$incr_total"
  check_contains "summary incremental converged writes" "$incr_log2" "iface-write=0/"
  printf '\nbadProbe : Int\nbadProbe = "x"\n' >> "$incr_base/lib/Base/Error.vuna"
  TMPDIR="$incr_cache" "$summ_vuna" check "$incr_base" >"$tmp/incr-bad.log" 2>&1
  incr_bad=$(grep -vE "^(DEBUG|PERF) " "$tmp/incr-bad.log")
  TMPDIR="$tmp/incr-bad-full" VUNA_ELAB_FULL=1 "$summ_vuna" check "$incr_base" >"$tmp/incr-bad-full.log" 2>&1
  full_bad=$(grep -vE "^(DEBUG|PERF) " "$tmp/incr-bad-full.log")
  check_contains "summary incremental negative diagnostic" "$incr_bad" "TC_TypeMismatch"
  check_eq "summary incremental/full diagnostics identical" "$full_bad" "$incr_bad"
fi

# 44g) LSP/REPL 消费依赖接口（`VUNA_IFACE_TOOL=1`，默认关闭）：预热依赖接口后，
#      REPL 求值走接口路径（`iface-source=repl`），LSP 诊断链仍全部通过；默认路径不变。
( cd .. && TMPDIR="$repo_cache" "$summ_vuna" check . >/dev/null 2>&1 ) || true
repo_iface_repl=$( cd .. && TMPDIR="$repo_cache" VUNA_IFACE_TOOL=1 VUNA_DEBUG_PERF=1 sh -c 'printf "x : Int\nx = 1 + 1\nx + 40\n:q\n" | "$0" repl' "$summ_vuna" 2>&1 )
check_contains "summary repl consumes dep ifaces" "$repo_iface_repl" "iface-source=repl modules="
check_contains "summary repl iface eval" "$repo_iface_repl" "42"
repo_iface_mods=$(printf %s "$repo_iface_repl" | grep -o "iface-tool-lazy modules=[0-9]*" | head -1 | sed "s/.*=//")
if [ -n "$repo_iface_mods" ] && [ "$repo_iface_mods" -lt 60 ]; then ok; else bad "summary repl lazy iface closure" "<60 modules" "modules=$repo_iface_mods"; fi
if ( cd .. && TMPDIR="$repo_cache" VUNA_IFACE_TOOL=1 sh test/corpus/lsp/smoke.sh "$summ_vuna" >/dev/null 2>&1 ); then
  ok
else
  bad "summary lsp consumes dep ifaces" "0" "smoke failed"
fi

# 44h) codegen 单元级缓存（S5）：改入口后重建——依赖单元命中缓存，产物与干净重建逐字节一致。
unit_pkg="$tmp/unit-pkg"
cp -r "$summ_pkg" "$unit_pkg"
sed -i "s|\.\./\.\./\.\./\.\./\.\./base|$VUNA_BASE|" "$unit_pkg/root/vuna.toml"
sed -i "s|\.\./\.\./\.\./\.\./\.\./base|$VUNA_BASE|" "$unit_pkg/dep/vuna.toml" 2>/dev/null || true
unit_cache="$tmp/unit-cache"
rm -rf "$tmp/unit-gen1" "$tmp/unit-gen2"
if TMPDIR="$unit_cache" VUNA_UNIT_CACHE=1 "$summ_vuna" build --no-compile --out "$tmp/unit-gen1" "$unit_pkg/root" >/dev/null 2>&1; then
  printf '\nunitProbe : Int\nunitProbe = 1\n' >> "$unit_pkg/root/app/Main.vuna"
  unit_log=$(TMPDIR="$unit_cache" VUNA_UNIT_CACHE=1 VUNA_DEBUG_PERF=1 "$summ_vuna" build --no-compile --out "$tmp/unit-gen1" "$unit_pkg/root" 2>&1)
  check_contains "summary unit cache hit" "$unit_log" "unit-cache-hit "
  TMPDIR="$tmp/unit-fresh-cache" VUNA_UNIT_CACHE=1 "$summ_vuna" build --no-compile --out "$tmp/unit-gen2" "$unit_pkg/root" >/dev/null 2>&1
  if diff -r "$tmp/unit-gen1" "$tmp/unit-gen2" >"$tmp/unit-gen.diff" 2>&1; then
    ok
  else
    bad "summary unit cache output identical" "identical" "$(head -5 "$tmp/unit-gen.diff")"
  fi
else
  bad "summary unit cache cold build" "0" "failed"
fi


finish
