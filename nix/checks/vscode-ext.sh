#!/bin/sh
# checks.vscode-ext：VSCode 扩展的离线自检（M30）。
#
# 由 nix/checks/default.nix 的 mkCheck 调用：cwd 是已按 fileset 暂存的工作树，
# $1 是输出目录，node 由 nativeBuildInputs 注入。只校验已提交的 dist/ 与清单——
# 不跑 npm install（CI 离线；重新生成 dist 用 vscode/README 里的 npm ci && npm run build）。
set -eu

OUT=${1:?usage: vscode-ext.sh OUT}
: "${VUNA_VSCODE_ROOT:=$PWD/vscode}"
export VUNA_VSCODE_ROOT

sh "$VUNA_VSCODE_ROOT/check.sh"
printf 'vscode-ext: ok\n' >"$OUT/result.txt"