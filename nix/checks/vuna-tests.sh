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
# e2e 顺带跑 `tools` tier：这些 case 与 e2e 共享同一批预热产物，一起交给 LPT
# 才能按耗时摊开（单独跑时只有两个 case，分片后必然压在 1–2 片上）。
now_s() { date +%s; }
phase_t0=$(now_s)
case " $VUNA_TEST_TIERS " in
  *" e2e "*)
    "$VUNA" check "$VUNA_BASE"
    "$VUNA" check packages/compiler
    "$VUNA" check .
    ;;
esac
phase_t1=$(now_s)
TIER_ARGS=""
for tier in ${VUNA_TEST_TIERS:-}; do
  TIER_ARGS="$TIER_ARGS --tier $tier"
done
case " $VUNA_TEST_TIERS " in
  *" e2e "*) TIER_ARGS="$TIER_ARGS --tier tools" ;;
esac
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
# 影响面切片：VUNA_TEST_AREAS 是空格分隔的 area 名（见 nix/checks/slices.nix），
# 由 suite.toml 的 [family.areas] / steps 的 `# areas:` 认领。
AREA_ARGS=""
for area in ${VUNA_TEST_AREAS:-}; do
  AREA_ARGS="$AREA_ARGS --area $area"
done
# CI 分片：VUNA_TEST_SHARD=i/N 把选中 case 按耗时均衡切成 N 份、只跑第 i 份。
# 每份仍是完整 case 集合的一部分（不是采样），union 由 runner 的分桶覆盖保证。
SHARD_ARGS=""
if [ -n "${VUNA_TEST_SHARD:-}" ]; then
  SHARD_ARGS="--shard $VUNA_TEST_SHARD"
fi
# 切片过滤后 case 数下限：先 `--list` 数一遍，低于下限直接失败——挡住「area 名打错 /
# family 掉出切片」变成 0 个 case 的全绿。`--list` 不编译、不执行 case。
if [ -n "${VUNA_TEST_MIN_CASES:-}" ]; then
  # shellcheck disable=SC2086
  selected=$("$VUNA" dev suite --all --list $TIER_ARGS $BACKEND_ARGS $MATRIX_ARGS $AREA_ARGS $SHARD_ARGS | grep -cE '^[A-Za-z][A-Za-z-]*/[A-Za-z0-9_]+/' || true)
  if [ "$selected" -lt "$VUNA_TEST_MIN_CASES" ]; then
    echo "vuna-tests: only $selected case(s) selected, VUNA_TEST_MIN_CASES requires >= $VUNA_TEST_MIN_CASES" >&2
    exit 1
  fi
fi
# `--all` 读 test/suite.toml 的 driver 清单；清单只维护这一份。
rc=0
# shellcheck disable=SC2086
"$VUNA" dev suite --all --jobs "$JOBS" --timeout 240 --strict-skips $TIER_ARGS $BACKEND_ARGS $MATRIX_ARGS $AREA_ARGS $SHARD_ARGS || rc=1
phase_t2=$(now_s)

# 包内单测（`vuna test <pkg>`：顶层 test/*.vuna）；http/web 的行为面不在 suite corpus 里。
# 切片按 VUNA_TEST_UNIT_PKGS 只跑相关包；未设置时跑全部。
run_unit_tests() {
  for pkg in "$@"; do
    [ -d "$pkg/test" ] || continue
    set -- "$pkg"/test/*.vuna
    [ -e "$1" ] || continue
    "$VUNA" test "$pkg" --jobs "$JOBS" || rc=1
  done
}
if [ "${VUNA_TEST_UNIT_PKGS+set}" = set ]; then
  # 切片显式声明单测包；空值表示该切片不跑包内单测。
  # shellcheck disable=SC2086
  run_unit_tests $VUNA_TEST_UNIT_PKGS
else
  run_unit_tests packages/*
fi

phase_t3=$(now_s)
# 分段耗时：分片的 wall 由「预热 + 主 suite + 尾部（包内单测；分片为空）」组成，
# 只有主 suite 参与 LPT 平衡。
echo "=== suite-timing warmup=$((phase_t1 - phase_t0))s cases=$((phase_t2 - phase_t1))s tail=$((phase_t3 - phase_t2))s"

# 调度权重：把本轮实测耗时表打进构建日志。runner 的机器特征与开发机差数倍，
# `test/suite/costs.baseline` 的 LPT 权重只能按 runner 上的读数重录。
if [ -f .local/test-suite/costs.tsv ]; then
  echo "=== suite-costs begin"
  cat .local/test-suite/costs.tsv
  echo "=== suite-costs end"
fi

exit "$rc"