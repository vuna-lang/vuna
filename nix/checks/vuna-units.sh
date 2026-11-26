#!/bin/sh
# checks.vuna-tests-units：包内单测（`vuna test <pkg>`，各包顶层 test/*.vuna）。
#
# 与 suite 分开成独立 derivation：suite 分片只承担 corpus / steps，单测作为一个整体
# 并行跑，既不挂在 gate 的尾巴上串行，也不会被每个 shard 重复执行。
set -eu

OUT=${1:?usage: vuna-units.sh OUT}
: "${VUNA:?VUNA 未设置}"
: "${VUNA_SEED:?VUNA_SEED 未设置}"
VUNA_BASE=$PWD/packages/base
export VUNA_BASE VUNA_SEED

VUNA_STORE=$(mktemp -d "${TMPDIR:-/tmp}/vuna-unit-store.XXXXXX")
export VUNA_STORE

JOBS=${VUNA_TEST_JOBS:-${NIX_BUILD_CORES:-1}}
[ "$JOBS" -gt 0 ] 2>/dev/null || JOBS=1

rc=0
for pkg in packages/*; do
  [ -d "$pkg/test" ] || continue
  set -- "$pkg"/test/*.vuna
  [ -e "$1" ] || continue
  echo "vuna-units: $pkg" >&2
  "$VUNA" test "$pkg" --jobs "$JOBS" || rc=1
done

exit "$rc"