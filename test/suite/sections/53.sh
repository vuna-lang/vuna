#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

# 53) codegen 单元缓存**默认开启**（`VUNA_UNIT_CACHE=0` opt-out）+ 桶内 GC：
#     - 多模块包改叶子后默认路径必须命中未受影响单元（`unit-cache-hit`），产物与干净重建
#       逐字节一致；`VUNA_UNIT_CACHE=0` 必须完全不写/不用单元缓存。
#     - 同一入口反复编辑（entry key 每轮都变）后，桶内 `.unit` 文件数必须收敛到「本次单元
#       数」（= 产物 .ml 数），不能随编辑次数累积。
u53="$tmp/unit-default-pkg"
u53_cache="$tmp/unit-default-cache"
u53_out="$tmp/unit-default-out"
rm -rf "$u53" "$u53_cache" "$u53_out"
mkdir -p "$u53/lib" "$u53/app"
printf '[package]\nname = "unit-default-pkg"\n\n[dependencies]\nvuna-base = "%s"\n' "$VUNA_BASE" >"$u53/vuna.toml"
printf 'module Leaf (leafVal) where\n\nleafVal : Int\nleafVal = 1\n' >"$u53/lib/Leaf.vuna"
printf 'module Mid (midVal) where\n\nimport Leaf\n\nmidVal : Int\nmidVal = leafVal + 1\n' >"$u53/lib/Mid.vuna"
printf 'module Top (topVal) where\n\nimport Mid\n\ntopVal : Int\ntopVal = midVal + 1\n' >"$u53/lib/Top.vuna"
n=1
while [ "$n" -le 4 ]; do
  printf 'module Other%d (other%d) where\n\nother%d : Int\nother%d = %d\n' "$n" "$n" "$n" "$n" "$n" >"$u53/lib/Other$n.vuna"
  n=$((n + 1))
done
printf 'import Top\nimport Other1\nimport Other2\nimport Other3\nimport Other4\n\nmain : Int\nmain = topVal + other1 + other2 + other3 + other4\n' >"$u53/app/Main.vuna"
if TMPDIR="$u53_cache" "$VUNA" build --no-compile --out "$u53_out" "$u53" >/dev/null 2>&1; then
  u53_units=$(find "$u53_out" -maxdepth 1 -name '*.ml' | wc -l | tr -d ' ')
  u53_bucket0=$(find "$u53_cache"/vuna-cache/*/split-units -name '*.unit' 2>/dev/null | wc -l | tr -d ' ')
  # 改叶子（Leaf/Mid/Top 三个单元失效；Other1..4 与 runtime/entry 中 runtime 仍可命中）。
  printf 'module Leaf (leafVal) where\n\nleafVal : Int\nleafVal = 2\n' >"$u53/lib/Leaf.vuna"
  u53_log=$(TMPDIR="$u53_cache" VUNA_DEBUG_PERF=1 "$VUNA" build --no-compile --out "$u53_out" "$u53" 2>&1)
  u53_code=$?
  check_eq "unit cache default build exit" "0" "$u53_code"
  if printf '%s' "$u53_log" | grep -q "unit-cache-hit "; then ok; else bad "unit cache default hits unaffected units" "unit-cache-hit" "none"; fi
  # 干净重建（独立缓存 + 显式关闭）→ 产物逐字节一致。
  rm -rf "$tmp/unit-default-fresh"
  if TMPDIR="$tmp/unit-default-fresh" VUNA_UNIT_CACHE=0 "$VUNA" build --no-compile --out "$tmp/unit-default-fresh-out" "$u53" >/dev/null 2>&1; then
    if diff -r "$u53_out" "$tmp/unit-default-fresh-out" >/dev/null 2>&1; then ok; else bad "unit cache default output identical" "identical" "diff"; fi
  else
    bad "unit cache fresh rebuild" "0" "failed"
  fi
  # opt-out：完全不使用单元缓存（无 hit 记录，也不产生 split-units 文件）。
  rm -rf "$tmp/unit-optout-cache"
  u53_off=$(TMPDIR="$tmp/unit-optout-cache" VUNA_UNIT_CACHE=0 VUNA_DEBUG_PERF=1 "$VUNA" build --no-compile --out "$tmp/unit-optout-out" "$u53" 2>&1)
  if printf '%s' "$u53_off" | grep -q "unit-cache-hit "; then bad "unit cache opt-out no hits" "no unit-cache-hit" "found hit"; else ok; fi
  if find "$tmp/unit-optout-cache" -name '*.unit' 2>/dev/null | grep -q .; then bad "unit cache opt-out writes nothing" "no .unit" "found .unit"; else ok; fi
  # 桶内 GC：连续编辑入口 6 轮，桶内文件数收敛到单元数。
  u53_i=1
  while [ "$u53_i" -le 6 ]; do
    printf 'import Top\nimport Other1\nimport Other2\nimport Other3\nimport Other4\n\nmain : Int\nmain = topVal + other1 + other2 + other3 + other4 + %d\n' "$u53_i" >"$u53/app/Main.vuna"
    TMPDIR="$u53_cache" "$VUNA" build --no-compile --out "$u53_out" "$u53" >/dev/null 2>&1 || bad "unit cache bucket edit $u53_i" "0" "build failed"
    u53_i=$((u53_i + 1))
  done
  u53_bucket_files=$(find "$u53_cache"/vuna-cache/*/split-units -name '*.unit' 2>/dev/null | wc -l | tr -d ' ')
  check_eq "unit cache bucket bounded" "$u53_bucket0" "$u53_bucket_files"
  if [ "$u53_units" -gt 0 ] && [ "$u53_bucket0" -gt 0 ] && [ "$u53_bucket0" -le "$u53_units" ]; then
    ok
  else
    bad "unit cache bucket unit count" "0 < bucket0 <= $u53_units" "bucket0=$u53_bucket0"
  fi
else
  bad "unit cache default warmup" "0" "build failed"
fi


finish
