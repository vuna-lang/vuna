#!/bin/sh
# checks.vuna-diag：诊断策略三件套（码覆盖 / 位置 / 文案）。
# 实现分别在 nix/checks/lib/diag-*.sh，本入口只按顺序跑并汇总失败。
set -eu

OUT=${1:?usage: diag.sh OUT}

for s in diag-coverage diag-located diag-style; do
  sh "nix/checks/lib/$s.sh" "$OUT"
done
