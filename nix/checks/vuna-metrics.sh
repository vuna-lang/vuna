#!/bin/sh
# checks.vuna-metrics：机器无关 codegen 指标（聚合 compiler 闭包）对预算。
#
# 由 nix/checks/default.nix 的 mkCheck 调用：cwd 是已暂存的工作树，
# $1 是输出目录，$VUNA 由 Nix 注入。
set -eu

OUT=${1:?usage: vuna-metrics.sh OUT}
: "${VUNA:?VUNA 未设置}"

"$VUNA" compile --package --out "$OUT/self" compiler
sh nix/metrics.sh "$OUT/self" nix/metrics.budget >"$OUT/metrics.txt"
cat "$OUT/metrics.txt"