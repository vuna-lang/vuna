#!/bin/sh
# checks.vuna-tests：在沙箱里跑原生 suite（vuna dev suite）。
#
# 由 nix/checks/default.nix 的 mkCheck 调用：cwd 是已暂存的工作树，
# $VUNA / $VUNA_SEED 由 Nix 注入。章节脚本需要 VUNA_BASE / VUNA_OBS_PKG
# 指向仓库内的包目录。
set -eu

OUT=${1:?usage: vuna-tests.sh OUT}
: "${VUNA:?VUNA 未设置}"
: "${VUNA_SEED:?VUNA_SEED 未设置}"
VUNA_BASE=$PWD/packages/base
VUNA_OBS_PKG=$PWD/packages/obs
export VUNA_BASE VUNA_OBS_PKG VUNA_SEED

# 沙箱内一个 check 用私有对象库：worker/case 共享同一根（父进程预热一次），
# 但不写进源码树，也不依赖宿主 ~/.vuna/store。
VUNA_STORE=$(mktemp -d "${TMPDIR:-/tmp}/vuna-test-store.XXXXXX")
export VUNA_STORE

# 全局并发预算：Nix 给本 derivation 的 cores（或显式 VUNA_TEST_JOBS）；
# 不用 --jobs auto，否则 nix flake check 里会重复吃满所有核。
JOBS=${VUNA_TEST_JOBS:-${NIX_BUILD_CORES:-1}}
[ "$JOBS" -gt 0 ] 2>/dev/null || JOBS=1

# 分层：VUNA_TEST_TIERS 是空格分隔的 tier 名（gate = fast integration，e2e = e2e）。
# 空值 = 全量（本地调试）。e2e 先串行预热 packages/base、packages/compiler、全部包：23 s，换 e2e 长
# case（44g 等）共享预热好的 base/compiler 产物，不各自冷跑；总 wall 不变、单 case 显著下降。
case " $VUNA_TEST_TIERS " in
  *" e2e "*)
    "$VUNA" check "$VUNA_BASE"
    "$VUNA" check packages/compiler
    "$VUNA" check .
    ;;
esac
TIER_ARGS=""
for tier in ${VUNA_TEST_TIERS:-}; do
  TIER_ARGS="$TIER_ARGS --tier $tier"
done
# 后端矩阵：VUNA_TEST_BACKENDS 是空格分隔的目标名（ocaml / wasm / native）。
# 只跑 `matrix` 声明的允许面（见 test/suite.toml 与 testing.md）。
BACKEND_ARGS=""
for backend in ${VUNA_TEST_BACKENDS:-}; do
  BACKEND_ARGS="$BACKEND_ARGS --backend $backend"
done
MATRIX_ARGS=""
for matrix in ${VUNA_TEST_MATRICES:-}; do
  MATRIX_ARGS="$MATRIX_ARGS --matrix $matrix"
done
# `--all` 读 test/suite.toml 的 driver 清单；清单只维护这一份。
rc=0
# shellcheck disable=SC2086
"$VUNA" dev suite --all --jobs "$JOBS" --timeout 240 --strict-skips $TIER_ARGS $BACKEND_ARGS $MATRIX_ARGS || rc=1

# 包内单测（`vuna test <pkg>`：顶层 test/*.vuna）；http/web 的行为面不在 suite corpus 里。
for pkg in packages/*; do
  [ -d "$pkg/test" ] || continue
  set -- "$pkg"/test/*.vuna
  [ -e "$1" ] || continue
  "$VUNA" test "$pkg" --jobs "$JOBS" || rc=1
done

# e2e check 内再跑 tools 层（47c/54b 等 25 s 级工具 case）：固定 2 worker，
# 与 e2e 的 8 worker 串行，避免它们在 gate/e2e 的大并发里被拖到 30 s+。
case " $VUNA_TEST_TIERS " in
  *" e2e "*)
    # shellcheck disable=SC2086
    "$VUNA" dev suite --all --jobs "${VUNA_TOOL_JOBS:-2}" --timeout 240 --strict-skips --tier tools $BACKEND_ARGS $MATRIX_ARGS || rc=1
    ;;
esac

exit "$rc"