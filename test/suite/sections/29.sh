#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

# 29) 包模式错误：缺依赖 / 依赖环 / 隐藏模块（[export] 限制）/ 依赖包歧义 → 非 0、含片段、
#     不写产物。`vuna build` 在写 .output 前就做包解析与 DT 精化，失败不得留下任何产物。
#     95_cross_dep 是两包方向性实验（父目录本身不是包），见段 39。
require_files "§29 corpus/packages 反例" corpus/packages/9[0-9]_*/ corpus/packages/m31_*/
for dir in corpus/packages/9[0-9]_*/ corpus/packages/m31_*/; do
  [ -d "$dir" ] || continue
  dir=${dir%/}
  case "$dir" in
    *95_cross_dep) continue ;;
  esac
  fragment=$(cat "$dir/expected.err")
  rm -rf "$dir/.output"
  actual=$("$VUNA" build "$dir" 2>&1)
  pkg_code=$?
  check_contains "$dir (package error)" "$actual" "$fragment"
  if [ "$pkg_code" -ne 0 ]; then ok; else bad "$dir (package error exit)" "non-zero" "$pkg_code"; fi
  if [ -e "$dir/.output" ]; then
    bad "$dir (package no output files)" "absent" "present"
  else
    ok
  fi
  rm -rf "$dir/.output"
done

# 29b) D28 定义级信任点（`[trust] unsafe`）：夹具自带 check.sh（严格模式正例 + 非严格
#      对照 + 4 组负例）。包内 trust 列表只允许真实定义；非信任定义直调 unsafe 门控
#      入口即被 Loader 拒绝。正例包本身已被 §28 的 [01][0-9]_* glob 覆盖 build/test。
trust_points_fixture=corpus/packages/12_trust_points
if [ -f "$trust_points_fixture/check.sh" ]; then
  if trust_points_out=$(sh "$trust_points_fixture/check.sh" "$VUNA" 2>&1); then
    ok
  else
    bad "trust points fixture" "exit 0" "$(printf '%s\n' "$trust_points_out" | tail -5)"
  fi
else
  bad "trust points fixture" "check.sh" "missing $trust_points_fixture/check.sh"
fi


finish
