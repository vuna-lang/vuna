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

# --jobs auto = 探测到的全部可用核；--no-cache 让 CI 保持权威口径。
"$VUNA" test --suite test/suite.toml --jobs auto --timeout 240 --no-cache --strict-skips
