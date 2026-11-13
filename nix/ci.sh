#!/bin/sh
# 仓库 CI 单一入口：在仓库根跑全量 Nix checks；可选再跑软性能检查。
#
# 用法:
#   sh nix/ci.sh              # 等价于下方命令
#   sh nix/ci.sh --keep-going # 额外参数透传给 nix flake check
#   sh nix/ci.sh --bench      # flake check 通过后再跑
#                             #   nix run .#vuna-bench -- --check
#                             # 性能检查是软告警（WARN/非零退出都不阻断 CI）
#
# 固定三件事，避免本地/CI 口径漂移：
#   - 关闭 eval cache：并行/多 worktree 下 eval-cache 可能返回旧求值结果；
#   - --keep-going：一个 check 失败不阻断其它 check，失败面一次看全；
#   - log-lines：失败 derivation 的日志尾巴从默认 25 行放大。默认值会把
#     vuna-tests 这类「几百行逐 case 输出 + 末尾汇总」的失败现场截掉，只剩汇总行，
#     看不出是哪个 case 失败（CI 上一次 vuna-tests 失败就是这么丢掉信息的）。
#     log-lines 只在**失败**时放大打印，通过时无额外输出。
#
# 全局 token 预算：CI_TOKENS（默认 nproc）是总核数；CI_JOBS（默认 2）是同时跑的
# derivation 数；每个 derivation 拿 CI_TOKENS/CI_JOBS 个 cores。gate/e2e 两个
# suite check 共享这个预算，e2e 内的 tools 层再固定 2 worker。
#
# --bench 默认关闭：性能读数受机器负载影响，入库基线（nix/bench-baseline.json）
# 只对同 arch/nproc/compiler 的回归做软告警（见 nix/bench.sh 的 --threshold）。
set -eu
cd "$(dirname "$0")/.."

# nix.conf 覆盖（理由见文件头）：关 eval cache + 失败日志尾巴放大到 5000 行。
NIX_CONF="eval-cache = false
log-lines = 5000"

# 全局 token 预算：CI_TOKENS（默认 nproc）/ CI_JOBS（默认 2）；每个 derivation
# 拿 CI_TOKENS/CI_JOBS 个 cores。gate/e2e 两个 suite check 共享该预算。
TOKENS=${CI_TOKENS:-$(getconf _NPROCESSORS_ONLN 2>/dev/null || nproc 2>/dev/null || echo 8)}
case "$TOKENS" in ""|*[!0-9]*) TOKENS=8 ;; esac
JOBS=${CI_JOBS:-2}
case "$JOBS" in ""|*[!0-9]*) JOBS=2 ;; esac
[ "$JOBS" -ge 1 ] || JOBS=1
[ "$JOBS" -le "$TOKENS" ] || JOBS=$TOKENS
CORES=$((TOKENS / JOBS))
[ "$CORES" -ge 1 ] || CORES=1
export CI_TOKENS="$TOKENS" CI_JOBS="$JOBS" CI_CORES="$CORES"

bench=0
# 重建参数表：吃掉 --bench，其余原样透传（保留带空格的参数）。
_n=$#
_i=0
while [ "$_i" -lt "$_n" ]; do
  arg=$1
  shift
  case $arg in
    --bench) bench=1 ;;
    *) set -- "$@" "$arg" ;;
  esac
  _i=$((_i + 1))
done

if [ "$bench" = 1 ]; then
  env NIX_CONFIG="$NIX_CONF" nix flake check --keep-going --max-jobs "$JOBS" --cores "$CORES" "$@"
  printf 'ci: flake check 通过；运行软性能检查（nix run .#vuna-bench -- --check）\n'
  if ! nix run .#vuna-bench -- --check; then
    printf 'ci: bench check 退出非零（软告警，不阻断 CI）\n'
  fi
  exit 0
fi

exec env NIX_CONFIG="$NIX_CONF" nix flake check --keep-going --max-jobs "$JOBS" --cores "$CORES" "$@"
