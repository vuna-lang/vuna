#!/bin/sh
# checks.vuna-static：不依赖 vuna 二进制的结构守卫（诊断码 / IR 边界 / 进程绑定岛 /
# 隐藏效果）。实现分别在 nix/checks/lib/，本入口只按顺序跑并汇总失败。
set -eu

OUT=${1:?usage: static.sh OUT}

for s in diag-raw ir-boundary steps-inproc eff-boundary; do
  sh "nix/checks/lib/$s.sh" "$OUT"
done
