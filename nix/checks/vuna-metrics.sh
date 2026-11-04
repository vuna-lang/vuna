#!/bin/sh
# checks.vuna-metrics：固定夹具 test/corpus/codegen 的 codegen 产物对
# nix/codegen.baseline 的精确基线。
#
# 输入固定，所以任何指标漂移都是 codegen 输出变化；剔除 base/Prelude/runtime，
# 避免库/运行时增长重新引入「移动靶」（种子尺寸不设门槛，只由 bench 报告）。
# 由 nix/checks/default.nix 的 mkCheck 调用：cwd 是已暂存的工作树，$1 是输出目录，
# $VUNA 由 Nix 注入。
set -eu

OUT=${1:?usage: vuna-metrics.sh OUT}
: "${VUNA:?VUNA 未设置}"

FIXTURE=test/corpus/codegen

"$VUNA" build --no-compile --out "$OUT/fixture" "$FIXTURE"

mkdir -p "$OUT/measure"
count=0
for f in "$OUT/fixture"/*.ml; do
  [ -e "$f" ] || continue
  name=${f##*/}
  case "$name" in
    Base_*.ml|Prelude.ml|Vuna_runtime.ml) continue ;;
  esac
  cp "$f" "$OUT/measure/"
  count=$((count + 1))
done
[ "$count" -gt 0 ] || { echo "vuna-metrics: no fixture .ml under $OUT/fixture" >&2; exit 1; }

sh nix/metrics.sh "$OUT/measure" nix/codegen.baseline
