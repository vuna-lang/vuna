#!/bin/sh
# checks.vuna-tests：在沙箱里跑原生 suite（vuna test --suite）。
#
# 由 nix/checks/default.nix 的 mkCheck 调用：cwd 是已暂存的工作树，
# $VUNA / $VUNA_SEED 由 Nix 注入。章节脚本需要 VUNA_BASE 指向仓库 base。
set -eu

OUT=${1:?usage: vuna-tests.sh OUT}
: "${VUNA:?VUNA 未设置}"
: "${VUNA_SEED:?VUNA_SEED 未设置}"
VUNA_BASE=$PWD/base
export VUNA_BASE VUNA_SEED

# 沙箱内一个 check 用私有对象库：worker/case 共享同一根（父进程预热一次），
# 但不写进源码树，也不依赖宿主 ~/.vuna/store。
VUNA_STORE=$(mktemp -d "${TMPDIR:-/tmp}/vuna-test-store.XXXXXX")
export VUNA_STORE

# 全局并发预算：Nix 给本 derivation 的 cores（或显式 VUNA_TEST_JOBS）；
# 不再用 --jobs auto 在 nix flake check 里重复吃满所有核。
JOBS=${VUNA_TEST_JOBS:-${NIX_BUILD_CORES:-1}}
[ "$JOBS" -gt 0 ] 2>/dev/null || JOBS=1
"$VUNA" test --suite test/suite.toml --jobs "$JOBS" --timeout 240 --no-cache --strict-skips
