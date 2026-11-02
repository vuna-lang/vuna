#!/bin/sh
# checks.vuna-index：`vuna map` / `--find` / `--impact` / `api` 在真实仓库树上可用。
#
# 由 nix/checks/default.nix 的 mkCheck 调用：cwd 是已暂存的工作树，
# $1 是输出目录，$VUNA 由 Nix 注入。
set -eu

OUT=${1:?usage: vuna-index.sh OUT}
: "${VUNA:?VUNA 未设置}"

sh nix/index-check.sh "$VUNA" .