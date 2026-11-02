#!/bin/sh
# checks.vuna-metrics：机器无关 codegen 指标（聚合 seed 闭包的 DT split 产物）对预算。
#
# 由 nix/checks/default.nix 的 mkCheck 调用：cwd 是已暂存的工作树，
# $1 是输出目录，$VUNA 由 Nix 注入。
#
# M24：`compile --package` 已删除，指标口径改为 `vuna seed`（DT 逐模块 split 生成
# compiler 包闭包），聚合 OUT/self 下全部 .ml。
set -eu

OUT=${1:?usage: vuna-metrics.sh OUT}
: "${VUNA:?VUNA 未设置}"

"$VUNA" seed "$OUT/self" compiler
sh nix/metrics.sh "$OUT/self" nix/metrics.budget >"$OUT/metrics.txt"
cat "$OUT/metrics.txt"