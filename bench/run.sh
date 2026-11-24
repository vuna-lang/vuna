#!/usr/bin/env bash
# vuna-perf：生成程序 + 编译器运行基准（`nix run .#vuna-perf`）。
#
# 与 bench/bootstrap.sh 的分工：bootstrap.sh 测**构建/编译**的墙钟与产物尺寸；本脚本测
# **生成程序运行时**（vuna 产物 vs 手写 OCaml 等价实现）。
#
# 口径：
#   * 每个 benchmark 是 `bench/programs/t<N>/<name>/<name>.vuna`（vuna）与同目录的
#     `<name>.ml`（手写 OCaml 等价实现，同算法；个别库基准用标准库上限，见各文件
#     注释），`.out` 是 golden；`t<N>` 是机制分层（见 `bench/programs/TIERS.md`）；
#   * 可选 `<name>.bench` sidecar（`key=value`）：
#       repeat=N      每次计时采样内重复运行 N 次（默认 1；小项 / 启动成本用）
#       ops=N         该程序一次运行的代表性操作数（默认 0 = 不报 ns/op）
#       targets=a,b   只在这些 target 上跑（ocaml / native / wasm；默认全部）
#       c=path        额外参与链接的 C 源（FFI；相对 case 所在目录）
#       n=N           C 对照的 argv（有 <name>.c 时用）
#       cc_flags=...  C 对照的额外 cc 参数
#       timeout_x=N   运行超时 = N × 参照耗时（缺省按 tier）
#       timeout_ms=N  绝对运行超时
#       skip=1        不参与默认集合
#   * `--target` 选择被测后端：ocaml（默认）/ native / wasm / both / all；
#   * 每个样本由 `bench/lib/timestat` 一次运行同时给出三个指标：墙钟（CLOCK_MONOTONIC）、
#     CPU（wait4 rusage 的 user+sys，微秒级）、峰值 RSS（ru_maxrss）；每项先 warmup 再跑
#     --runs 个样本，墙钟与 CPU 取中位数、RSS 取最大值；GC 诊断行来自同一样本；
#   * native 进程由入口自带栈运行（默认 512 MiB 虚拟，独立于 `ulimit -s`）；
#     `stack_policy` 记进 JSON；
#   * 对照列：手写 OCaml（`ocaml_ref`，每个用例必测）与手写 C（`c_ref`，有 `.c` 就测）。
#     每个后端对两个对照组各给 `vs_handwritten` / `vs_c` 的墙钟、CPU、RSS 三套比值；
#     wasm 先减掉固定地板（空 node 进程的墙钟 / CPU / RSS），另记 wasm 线性内存；
#   * 每个后端另记产物指标：中间文本 `files/bytes/lines/max_file`、最终二进制
#     `binary_bytes`（wasm 是 `wasm_bytes`）、构建耗时 `build{codegen_ms,toolchain_ms,
#     postprocess_ms}`（wasm 的 `.wasm` 由 `wasm-tools parse` 汇编后再经 `wasm-opt` 优化）
#     与对应的 `*_cpu_ms`（user+sys；文本与二进制由 flake 固定工具链生成，大小跨机器
#     可比；耗时只同机可比，负载波动时看 CPU）；
#   * 基线只有一份 `bench/baselines/programs.json`（全部 target）；`--check` 只比本次
#     实际跑的 target / benchmark，并报告 `new` / `missing`。
set -euo pipefail

RUNS=3
WARMUP=1
THRESHOLD=20
FAIL_THRESHOLD=50
ARTIFACT_THRESHOLD=20
STRICT=0
LIST=0
JSON_OUT=""
BASELINE=""
CHECK=0
ONLY=""
TIER_FILTER=""
C_REF=auto
TARGET=ocaml
# 运行超时：每个 case 用参照实现（手写 C / OCaml 里更快的那个）的实测时间推导，
# 0 = 不限。`timeout_x` 的缺省按 tier 给（见 tier_timeout_x）。
RUN_TIMEOUT_MS=0
PROBE_TIMEOUT_MS=10000
TIMEOUT_X=0
TIMEOUT_MIN_MS=1000
TIMEOUT_MAX_MS=30000
VUNA_BIN=${VUNA:-vuna}
OCAMLOPT_BIN=${OCAMLOPT:-ocamlopt}
CC_BIN=${CC:-cc}
VUNA_BASE_OVERRIDE=${VUNA_BASE:-}

usage() {
  cat <<'EOF'
usage: vuna-perf [options]

在仓库根目录运行。默认测量全部基准并打印表格。

options:
  --runs N               采样数（每个样本同时给墙钟 / CPU / 峰值 RSS，默认 3）
  --warmup N             计时前预热次数（默认 1；golden 校验那次也计一次）
  --target T             被测后端：ocaml / native / wasm / both / all（默认 ocaml）
  --only NAME            只跑一个基准（可重复）
  --tier T               只跑某个机制层（如 t1；可重复）
  --c-ref MODE           手写 C 对照：auto（有 <name>.c 就跑，默认）/ on / off
  --timeout-x N          golden 校验超时 = N × 参照实现耗时（默认按 tier：t5/t6 为 5，其余 3）
  --timeout-min-ms N     超时下限（默认 1000）
  --timeout-max-ms N     超时上限（默认 30000）
  --probe-timeout-ms N   参照实现自身的探测超时（默认 10000）
  --list                 列出自动发现的基准与 sidecar 元数据，不测量
  --compiler PATH        被测 vuna（默认 PATH 里的 vuna / $VUNA）
  --cc PATH              native 链接器（默认 PATH 里的 cc / $CC）
  --json FILE|-          写出 JSON 报告；`-` 表示只输出 JSON
  --baseline FILE        基线 JSON（默认 bench/baselines/programs.json）
  --check                与基线对比；默认软告警（WARN），--strict 时 exit 1
  --threshold N          WARN 阈值，百分比（默认 20）
  --fail-threshold N     FAIL 阈值，百分比（默认 50；超过即 exit 1）
  --artifact-threshold N 产物字节数 WARN 阈值，百分比（默认 20；0 关闭）
  --strict               WARN 也 exit 1
  -h, --help             显示帮助

环境：
  VUNA / OCAMLOPT / CC  工具路径；VUNA_BASE 覆盖 base 包位置（默认 <repo>/packages/base）
  TMPDIR                 临时目录根
EOF
}

die() {
  printf 'vuna-perf: %s\n' "$*" >&2
  exit 2
}

note() {
  # `--json -` 要求 stdout 只有 JSON；进度与检查都走 stderr。
  if [ "$JSON_OUT" = "-" ]; then printf '%s\n' "$*" >&2; else printf '%s\n' "$*"; fi
}

while [ $# -gt 0 ]; do
  case $1 in
    --runs) [ $# -ge 2 ] || die "--runs needs a value"; RUNS=$2; shift 2 ;;
    --runs=*) RUNS=${1#*=}; shift ;;
    --warmup) [ $# -ge 2 ] || die "--warmup needs a value"; WARMUP=$2; shift 2 ;;
    --warmup=*) WARMUP=${1#*=}; shift ;;
    --target) [ $# -ge 2 ] || die "--target needs a value"; TARGET=$2; shift 2 ;;
    --target=*) TARGET=${1#*=}; shift ;;
    --only) [ $# -ge 2 ] || die "--only needs a value"; ONLY="$ONLY $2"; shift 2 ;;
    --only=*) ONLY="$ONLY ${1#*=}"; shift ;;
    --tier) [ $# -ge 2 ] || die "--tier needs a value"; TIER_FILTER="$TIER_FILTER $2"; shift 2 ;;
    --tier=*) TIER_FILTER="$TIER_FILTER ${1#*=}"; shift ;;
    --c-ref) [ $# -ge 2 ] || die "--c-ref needs a value"; C_REF=$2; shift 2 ;;
    --c-ref=*) C_REF=${1#*=}; shift ;;
    --no-c-ref) C_REF=off; shift ;;
    --timeout-x) [ $# -ge 2 ] || die "--timeout-x needs a value"; TIMEOUT_X=$2; shift 2 ;;
    --timeout-x=*) TIMEOUT_X=${1#*=}; shift ;;
    --timeout-min-ms) [ $# -ge 2 ] || die "--timeout-min-ms needs a value"; TIMEOUT_MIN_MS=$2; shift 2 ;;
    --timeout-min-ms=*) TIMEOUT_MIN_MS=${1#*=}; shift ;;
    --timeout-max-ms) [ $# -ge 2 ] || die "--timeout-max-ms needs a value"; TIMEOUT_MAX_MS=$2; shift 2 ;;
    --timeout-max-ms=*) TIMEOUT_MAX_MS=${1#*=}; shift ;;
    --probe-timeout-ms) [ $# -ge 2 ] || die "--probe-timeout-ms needs a value"; PROBE_TIMEOUT_MS=$2; shift 2 ;;
    --probe-timeout-ms=*) PROBE_TIMEOUT_MS=${1#*=}; shift ;;
    --list) LIST=1; shift ;;
    --compiler) [ $# -ge 2 ] || die "--compiler needs a value"; VUNA_BIN=$2; shift 2 ;;
    --compiler=*) VUNA_BIN=${1#*=}; shift ;;
    --cc) [ $# -ge 2 ] || die "--cc needs a value"; CC_BIN=$2; shift 2 ;;
    --cc=*) CC_BIN=${1#*=}; shift ;;
    --json|--save) [ $# -ge 2 ] || die "$1 needs a value"; JSON_OUT=$2; shift 2 ;;
    --json=*|--save=*) JSON_OUT=${1#*=}; shift ;;
    --baseline) [ $# -ge 2 ] || die "--baseline needs a value"; BASELINE=$2; shift 2 ;;
    --baseline=*) BASELINE=${1#*=}; shift ;;
    --check) CHECK=1; shift ;;
    --threshold) [ $# -ge 2 ] || die "--threshold needs a value"; THRESHOLD=$2; shift 2 ;;
    --threshold=*) THRESHOLD=${1#*=}; shift ;;
    --fail-threshold) [ $# -ge 2 ] || die "--fail-threshold needs a value"; FAIL_THRESHOLD=$2; shift 2 ;;
    --fail-threshold=*) FAIL_THRESHOLD=${1#*=}; shift ;;
    --artifact-threshold) [ $# -ge 2 ] || die "--artifact-threshold needs a value"; ARTIFACT_THRESHOLD=$2; shift 2 ;;
    --artifact-threshold=*) ARTIFACT_THRESHOLD=${1#*=}; shift ;;
    --strict) STRICT=1; shift ;;
    -h|--help) usage; exit 0 ;;
    *) die "unknown argument: $1 (try --help)" ;;
  esac
done

case $RUNS in ''|*[!0-9]*|0) die "--runs must be a positive integer" ;; esac
case $WARMUP in *[!0-9]*) die "--warmup must be a non-negative integer" ;; esac
case $THRESHOLD in ''|*[!0-9]*|0) die "--threshold must be a positive integer (percent)" ;; esac
case $FAIL_THRESHOLD in ''|*[!0-9]*|0) die "--fail-threshold must be a positive integer (percent)" ;; esac
case $ARTIFACT_THRESHOLD in *[!0-9]*) die "--artifact-threshold must be a non-negative integer (percent)" ;; esac
case $TIMEOUT_X in *[!0-9]*) die "--timeout-x must be a non-negative integer" ;; esac
case $TIMEOUT_MIN_MS in ''|*[!0-9]*) die "--timeout-min-ms must be a non-negative integer" ;; esac
case $TIMEOUT_MAX_MS in ''|*[!0-9]*) die "--timeout-max-ms must be a non-negative integer" ;; esac
case $PROBE_TIMEOUT_MS in ''|*[!0-9]*) die "--probe-timeout-ms must be a non-negative integer" ;; esac
[ "$FAIL_THRESHOLD" -ge "$THRESHOLD" ] || die "--fail-threshold must be >= --threshold"
case $TARGET in
  ocaml) TARGETS="vuna_ocaml" ;;
  native) TARGETS="native" ;;
  wasm) TARGETS="wasm" ;;
  both) TARGETS="vuna_ocaml native" ;;
  all) TARGETS="vuna_ocaml native wasm" ;;
  *) die "--target must be ocaml, native, wasm, both or all" ;;
esac

REPO=$PWD
[ -d "$REPO/bench/programs" ] || die "run from the repo root (bench/programs not found)"
[ -d "$REPO/packages/base" ] || die "run from the repo root (packages/base not found)"

# 后端构建与产物度量（与 bench/artifact.sh 共用）。
. "$REPO/bench/lib/targets.sh"

# ---------------------------------------------------------------- 发现与 sidecar
# 用例按机制分层：`bench/programs/t<N>/<name>/` 是单个用例目录，目录名同时是用例名
# （基线 JSON 的键）与入口文件 stem。目录里没有同名 `.vuna` 时不参与发现（可放辅助
# 文件）。`tier` 取用例目录的父目录名；同名用例出现在两个 tier 下会撞键，发现阶段直接报错。
declare -A BENCH_DIR=()
declare -A BENCH_TIER=()
BENCHES=""

bench_meta() { # name key default
  local dir=${BENCH_DIR[$1]:-}
  [ -n "$dir" ] || { printf '%s' "$3"; return; }
  local f=$dir/$1.bench
  [ -f "$f" ] || { printf '%s' "$3"; return; }
  local v
  v=$(sed -n "s/^$2=//p" "$f" | tail -n 1)
  printf '%s' "${v:-$3}"
}

discover_benchmarks() {
  local d n f
  BENCHES=""
  for d in "$REPO"/bench/programs/t*/*/; do
    [ -d "$d" ] || continue
    d=${d%/}
    n=$(basename "$d")
    f=$d/$n.vuna
    [ -f "$f" ] || continue
    if [ -n "${BENCH_DIR[$n]:-}" ]; then
      printf 'vuna-perf: duplicate benchmark name %s (%s and %s)\n' \
        "$n" "${BENCH_DIR[$n]}" "$d" >&2
      exit 2
    fi
    BENCH_DIR[$n]=$d
    BENCH_TIER[$n]=$(basename "$(dirname "$d")")
    [ "$(bench_meta "$n" skip 0)" = 1 ] && continue
    BENCHES+="$n"$'\n'
  done
  BENCHES=$(printf '%s' "$BENCHES" | sort)
}

target_allowed() { # target allowed_csv
  local t=$1 a=$2
  [ -z "$a" ] && return 0
  case $t in vuna_ocaml) t=ocaml ;; esac
  case ",$a," in *",$t,"*) return 0 ;; *) return 1 ;; esac
}

target_name() { case $1 in vuna_ocaml) printf 'ocaml' ;; *) printf '%s' "$1" ;; esac; }

discover_benchmarks
[ -n "$BENCHES" ] || die "no benchmarks found under bench/programs/t*/*"

case $C_REF in auto|on|off) ;; *) die "--c-ref must be auto, on or off" ;; esac

if [ -n "$TIER_FILTER" ]; then
  filtered=""
  for name in $BENCHES; do
    case " $TIER_FILTER " in
      *" ${BENCH_TIER[$name]} "*) filtered+="$name"$'\n' ;;
    esac
  done
  BENCHES=$(printf '%s' "$filtered" | sort)
  [ -n "$BENCHES" ] || die "no benchmark in tier(s):$TIER_FILTER"
fi

if [ "$LIST" = 1 ]; then
  printf '  %-16s %-6s %-16s %-6s %s\n' benchmark tier targets repeat notes
  for name in $BENCHES; do
    t=$(bench_meta "$name" targets "ocaml,native,wasm")
    r=$(bench_meta "$name" repeat 1)
    c=$(bench_meta "$name" c "")
    o=$(bench_meta "$name" ops 0)
    extra=""
    [ -n "$c" ] && extra="c=$c"
    [ "$o" != 0 ] && extra="$extra ops=$o"
    printf '  %-16s %-6s %-16s %-6s %s\n' "$name" "${BENCH_TIER[$name]}" "$t" "$r" "$extra"
  done
  exit 0
fi

command -v "$VUNA_BIN" >/dev/null 2>&1 || die "vuna not found: $VUNA_BIN"
command -v "$OCAMLOPT_BIN" >/dev/null 2>&1 || die "ocamlopt not found: $OCAMLOPT_BIN"
# timestat（三指标采样）与手写 C 对照都要 cc。
command -v "$CC_BIN" >/dev/null 2>&1 || die "cc not found: $CC_BIN（timestat 与手写 C 对照需要）"
# wasm 的执行宿主是仓库自带的 Node/V8 宿主：与浏览器同一套 WebAssembly API 和 host 层。
WASM_RUNNER=${WASM_RUNNER:-$REPO/wasm-host/run.mjs}
WASM_OPT_BIN=${WASM_OPT_BIN:-wasm-opt}
WASM_OPT_FLAGS="--enable-gc --enable-bulk-memory --enable-tail-call --enable-reference-types"
WASM_OPT_LEVEL=${WASM_OPT_LEVEL:-3}
NODE_BIN=${NODE:-node}
NODE_VERSION=n/a
NODE_STARTUP_MS=n/a
NODE_STARTUP_CPU_MS=n/a
NODE_RSS_KB=n/a
WASM_ENGINE_VERSION=n/a
case " $TARGETS " in
  *" native "*)
    STACK_POLICY=self-managed
    ;;
  *) STACK_POLICY=n/a ;;
esac
case " $TARGETS " in
  *" wasm "*)
    command -v "$NODE_BIN" >/dev/null 2>&1 || die "node not found（wasm 基准用 JS 宿主执行）"
    command -v wasm-tools >/dev/null 2>&1 || die "wasm-tools not found（wasm 产物需要 wasm-tools parse）"
    command -v "$WASM_OPT_BIN" >/dev/null 2>&1 || die "wasm-opt not found（wasm 产物需要 binaryen）"
    [ -f "$WASM_RUNNER" ] || die "wasm JS host runner not found: $WASM_RUNNER"
    NODE_VERSION=$("$NODE_BIN" --version 2>/dev/null || printf 'unknown')
    if [ "$STACK_POLICY" = n/a ]; then
      STACK_POLICY="node (V8 wasm stack ~1 MB default; --stack-size scales, browsers fixed)"
    else
      STACK_POLICY="$STACK_POLICY; node (V8 wasm stack ~1 MB default; --stack-size scales, browsers fixed)"
    fi
    ;;
esac

VUNA_BASE=${VUNA_BASE_OVERRIDE:-$REPO/packages/base}
export VUNA_BASE

if [ "$CHECK" = 1 ] && [ -z "$BASELINE" ]; then
  BASELINE=$REPO/bench/baselines/programs.json
fi
if [ -n "$BASELINE" ]; then
  [ -f "$BASELINE" ] || die "baseline not found: $BASELINE"
  command -v jq >/dev/null 2>&1 || die "jq not found (use: nix run .#vuna-perf)"
  jq -e . "$BASELINE" >/dev/null 2>&1 || die "baseline is not valid JSON: $BASELINE"
fi

TMPROOT=${TMPDIR:-/tmp}
mkdir -p "$TMPROOT" 2>/dev/null || true
WORK=$(mktemp -d "$TMPROOT/vuna-perf.XXXXXX" 2>/dev/null) || die "cannot create temp dir under $TMPROOT (set TMPDIR)"
cleanup() { rm -rf "$WORK"; }
trap cleanup EXIT INT TERM

# 三指标采样器：一次运行同时给出墙钟 / CPU / 峰值 RSS。
TIMESTAT=$WORK/timestat
if ! "$CC_BIN" -O2 -o "$TIMESTAT" "$REPO/bench/lib/timestat.c" >"$WORK/timestat.cc.log" 2>&1; then
  die "cannot build bench/lib/timestat.c (see $WORK/timestat.cc.log)"
fi

# wasm 的固定地板在 median_of 定义之后测（见 measure_node_floor）。
TIMESTAMP=$(date -u +%Y-%m-%dT%H:%M:%SZ)
ARCH=$(uname -m)
NPROC=$(getconf _NPROCESSORS_ONLN 2>/dev/null || printf 'unknown')
LOADAVG=$(cut -d' ' -f1 /proc/loadavg 2>/dev/null || printf 'unknown')
OCAMLOPT_VERSION=$("$OCAMLOPT_BIN" -version 2>/dev/null || printf 'unknown')
VUNA_VERSION=$("$VUNA_BIN" --version 2>/dev/null || printf 'unknown')
WASM_OPT_VERSION=$("$WASM_OPT_BIN" --version 2>/dev/null | head -n 1 || printf 'unknown')
GIT_HEAD=unknown
GIT_DIRTY=false
if command -v git >/dev/null 2>&1 && git rev-parse --git-dir >/dev/null 2>&1; then
  GIT_HEAD=$(git rev-parse HEAD 2>/dev/null || printf 'unknown')
  # 基线文件本身是本次输出，不计入 dirty（否则重标每次都记 git_dirty=true）。
  STATUS=$(git status --porcelain 2>/dev/null || true)
  if [ -n "${JSON_OUT:-}" ] && [ "$JSON_OUT" != "-" ]; then
    REL=$(realpath --relative-to="$REPO" "$JSON_OUT" 2>/dev/null || printf '%s' "$JSON_OUT")
    STATUS=$(printf '%s\n' "$STATUS" | grep -v -F -- "$REL" || true)
  fi
  if [ -n "$STATUS" ]; then GIT_DIRTY=true; fi
fi

json_escape() {
  local s=$1
  s=${s//\\/\\\\}
  s=${s//\"/\\\"}
  s=${s//$'\n'/\\n}
  s=${s//$'\t'/\\t}
  printf '%s' "$s"
}

now_ns() { date +%s%N; }

# 中位数：参数是若干数字（每行一个）。保留小数：小项（T0）的每轮耗时可能 <1 ms。
median_of() {
  printf '%s\n' "$@" | sort -n | awk '{ a[NR] = $1 } END { if (NR % 2) printf "%.3f\n", a[(NR + 1) / 2]; else printf "%.3f\n", (a[NR / 2] + a[NR / 2 + 1]) / 2 }'
}

# 比率：$1/$2，两位小数；分母 <= 0 时给 0。
ratio_of() {
  awk -v a="$1" -v b="$2" 'BEGIN { if (b + 0 <= 0) print "0"; else printf "%.2f", a / b }'
}

# 一个样本：timestat 一次运行同时给墙钟 / CPU / 峰值 RSS，并按后端打开 GC 诊断。
# 读全局 MS_TARGET / MS_K / MS_LOG / MS_CMD（调用方 take_sample 填好）。
# 结果写进 SAMPLE_WALL_MS / SAMPLE_CPU_MS / SAMPLE_RSS_KB / SAMPLE_RC。
measure_sample() {
  local -a envs=()
  case $MS_TARGET in
    vuna_ocaml) envs+=(--env VN_PERF_STATS=1) ;;
    native) envs+=(--env VUNA_NATIVE_GC_LOG=1) ;;
    wasm) envs+=(--env VN_PERF_STATS=1) ;;
  esac
  "$TIMESTAT" --timeout-ms "$RUN_TIMEOUT_MS" --repeat "$MS_K" --log "$MS_LOG" \
    ${envs[@]+"${envs[@]}"} -- "${MS_CMD[@]}" >"$WORK/sample.out" 2>"$WORK/sample.err" || true
  local w u s r rc
  w=0; u=0; s=0; r=0; rc=1
  read -r w u s r rc <"$WORK/sample.out" || true
  SAMPLE_WALL_MS=$(awk -v v="${w:-0}" -v k="$MS_K" 'BEGIN { printf "%.3f", v / 1000 / k }')
  SAMPLE_CPU_MS=$(awk -v u="${u:-0}" -v s="${s:-0}" -v k="$MS_K" 'BEGIN { printf "%.3f", (u + s) / 1000 / k }')
  SAMPLE_RSS_KB=${r:-0}
  SAMPLE_RC=${rc:-1}
}

# wasm 的固定地板：空 node 进程的墙钟 / CPU / RSS。三个 net_* = 绝对值 - 地板；
# 地板只含宿主本身，模块编译与实例化留在被测值里（它们也是 wasm 的真实成本）。
measure_node_floor() {
  local i w u s r rc
  local -a walls=() cpus=() rsses=()
  for i in 1 2 3 4 5; do
    "$TIMESTAT" --timeout-ms 10000 -- "$NODE_BIN" -e '' >"$WORK/node.floor" 2>/dev/null || true
    w=0; u=0; s=0; r=0; rc=1
    read -r w u s r rc <"$WORK/node.floor" || true
    walls+=("$(awk -v v="${w:-0}" 'BEGIN { printf "%.3f", v / 1000 }')")
    cpus+=("$(awk -v u="${u:-0}" -v s="${s:-0}" 'BEGIN { printf "%.3f", (u + s) / 1000 }')")
    rsses+=("${r:-0}")
  done
  NODE_STARTUP_MS=$(median_of "${walls[@]}")
  NODE_STARTUP_CPU_MS=$(median_of "${cpus[@]}")
  NODE_RSS_KB=$(median_of "${rsses[@]}" | awk '{ printf "%.0f", $1 }')
}

# native 产物由入口自带栈运行；wasm 产物由 JS 宿主执行。
run_target() { vuna_run_target "$1" "$2"; }

# 运行超时：按 ms 包一层 coreutils timeout（三端统一；退出码 124 = 超时）。
# 只用在 golden 校验与参照探测上——同一二进制、同一 N 已经证明会返回之后，计时与
# 采样直接跑裸程序：wrapper 的 fork 成本会污染小项，`timeout` 进程还会污染 RSS。
timeout_secs() { awk -v m="$1" 'BEGIN { printf "%.3f", m / 1000 }'; }

run_timed() { # target prog timeout_ms
  local target=$1 prog=$2 ms=$3
  if [ "$ms" -le 0 ] 2>/dev/null || ! command -v timeout >/dev/null 2>&1; then
    run_target "$target" "$prog"
    return $?
  fi
  local secs
  secs=$(timeout_secs "$ms")
  case $target in
    wasm) timeout -s TERM -k 2 "$secs" "$NODE_BIN" "$WASM_RUNNER" "$prog" ;;
    *) timeout -s TERM -k 2 "$secs" "$prog" ;;
  esac
}

# native 默认栈探针：固定 8 MiB soft limit，记录程序能否正常退出（信息性）。
default_stack_run() { # program [timeout_ms]
  local ms=${2:-$RUN_TIMEOUT_MS} secs=""
  if [ "$ms" -gt 0 ] 2>/dev/null; then secs=$(timeout_secs "$ms"); fi
  if [ -n "$secs" ] && command -v timeout >/dev/null 2>&1; then
    bash -c 'ulimit -s 8192 2>/dev/null; exec timeout -s TERM -k 2 "$1" "$2"' _ "$secs" "$1"
  else
    bash -c 'ulimit -s 8192 2>/dev/null; exec "$1"' _ "$1"
  fi
}

capture_target() { run_target "$1" "$2" 2>&1; }

# 校验 golden：0 = ok，2 = 超时，1 = 输出不符 / 崩溃 / 非零退出。
check_target() { # target prog golden
  local out rc=0
  out=$(run_timed "$1" "$2" "$RUN_TIMEOUT_MS" 2>&1) || rc=$?
  [ "$rc" -eq 124 ] && return 2
  [ "$rc" -eq 0 ] || return 1
  [ "$out" = "$3" ] && return 0
  return 1
}

# 参照实现的探测：校验 golden 并返回实测毫秒（超时用 PROBE_TIMEOUT_MS 兜住）。
probe_ref() { # label target prog golden
  local t0 t1 out rc=0
  t0=$(now_ns)
  out=$(run_timed "$2" "$3" "$PROBE_TIMEOUT_MS" 2>&1) || rc=$?
  t1=$(now_ns)
  if [ "$rc" -eq 124 ]; then
    die "$1: timeout after ${PROBE_TIMEOUT_MS}ms（缩小 N 或放宽 --probe-timeout-ms）"
  fi
  [ "$rc" -eq 0 ] || die "$1: program failed (exit $rc)"
  if [ "$out" != "$4" ]; then
    die "$1: output mismatch
  expected: $4
  actual:   $out"
  fi
  printf '%s' $(( (t1 - t0 + 500000) / 1000000 ))
}

# 超时倍数：缺省按 tier 的目标比给（目标的 2 倍），sidecar 的 timeout_x 覆盖。
tier_timeout_x() { # tier
  case $1 in
    t5|t6) printf '5' ;;
    *) printf '3' ;;
  esac
}

compute_timeout() { # name t_ref_ms
  local name=$1 t_ref=$2 x ms
  ms=$(bench_meta "$name" timeout_ms "")
  if [ -n "$ms" ]; then printf '%s' "$ms"; return 0; fi
  x=$(bench_meta "$name" timeout_x "")
  [ -n "$x" ] || x=$TIMEOUT_X
  [ "$x" -gt 0 ] 2>/dev/null || x=$(tier_timeout_x "${BENCH_TIER[$name]}")
  awk -v x="$x" -v t="$t_ref" -v lo="$TIMEOUT_MIN_MS" -v hi="$TIMEOUT_MAX_MS" \
    'BEGIN { v = x * t + 200; if (v < lo) v = lo; if (v > hi) v = hi; printf "%d", v }'
}

selected() {
  case " $ONLY " in
    *" $1 "*) return 0 ;;
    *) [ -z "$ONLY" ] && return 0 || return 1 ;;
  esac
}

declare -A MED CPU NET CPU_NET RSS RSS_NET WALLVALS CPUVALS \
  RATIO CPU_RATIO RSS_RATIO C_RATIO CPU_C_RATIO RSS_C_RATIO \
  DEFAULT_STACK SKIP CASE_TIMEOUT \
  GC_MINOR_WORDS GC_MAJOR_WORDS GC_MINOR_COLLECTIONS GC_MAJOR_COLLECTIONS GC_TOP_HEAP \
  NATIVE_GC_NATIVE_LIVE NATIVE_GC_NATIVE_ALLOC NATIVE_GC_NATIVE_COLLECTIONS \
  WASM_MEMORY_BYTES ART_BYTES ART_LINES WASM_BYTES SAMPLE_LOG \
  WASM_READ_MS WASM_COMPILE_MS WASM_INSTANTIATE_MS WASM_START_MS \
  ART_FILES ART_MAX_PATH ART_MAX_BYTES ART_MAX_LINES BIN_BYTES BUILD_CG_MS BUILD_TC_MS \
  BUILD_CG_CPU_MS BUILD_TC_CPU_MS BUILD_POST_MS BUILD_POST_CPU_MS
ORDER=()

sum_bytes() { awk '{ s += $1 } END { print s + 0 }'; }

artifact_measure() { # name target dir
  local name=$1 target=$2 dir=$3
  case $target in
    vuna_ocaml)
      ART_BYTES["$name:$target"]=$(find "$dir" -name '*.ml' -printf '%s\n' | sum_bytes)
      ART_LINES["$name:$target"]=$(find "$dir" -name '*.ml' -exec cat {} + | wc -l | tr -d ' ')
      ;;
    native)
      ART_BYTES["$name:$target"]=$(find "$dir" -name '*.s' -printf '%s\n' | sum_bytes)
      ART_LINES["$name:$target"]=$(find "$dir" -name '*.s' -exec cat {} + | wc -l | tr -d ' ')
      ;;
    wasm)
      ART_BYTES["$name:$target"]=$(wc -c <"$dir/main.wat" | tr -d ' ')
      ART_LINES["$name:$target"]=$(wc -l <"$dir/main.wat" | tr -d ' ')
      WASM_BYTES["$name:$target"]=$(wc -c <"$dir/main.wasm" | tr -d ' ')
      ;;
  esac
  local key val
  while IFS=$'\t' read -r key val; do
    case $key in
      files) ART_FILES["$name:$target"]=$val ;;
      max_path) ART_MAX_PATH["$name:$target"]=$val ;;
      max_bytes) ART_MAX_BYTES["$name:$target"]=$val ;;
      max_lines) ART_MAX_LINES["$name:$target"]=$val ;;
      binary) BIN_BYTES["$name:$target"]=$val ;;
    esac
  done < <(vuna_artifact_stats "$target" "$dir")
}

# 编译一个被测后端到 <dir>/prog；<name>.bench 的 `c=` 参与链接。
build_target() { # name target dir
  local name=$1 target=$2 dir=$3
  local csrc
  csrc=$(bench_meta "$name" c "")
  local -a csrcs=()
  [ -n "$csrc" ] && csrcs=("${BENCH_DIR[$name]}/$csrc")
  vuna_build_target "${BENCH_DIR[$name]}/$name.vuna" "$target" "$dir" "${csrcs[@]}" || return 1
  BUILD_CG_MS["$name:$target"]=$LAST_CODEGEN_MS
  BUILD_TC_MS["$name:$target"]=$LAST_TOOLCHAIN_MS
  BUILD_CG_CPU_MS["$name:$target"]=$LAST_CODEGEN_CPU_MS
  BUILD_TC_CPU_MS["$name:$target"]=$LAST_TOOLCHAIN_CPU_MS
  BUILD_POST_MS["$name:$target"]=$LAST_POST_MS
  BUILD_POST_CPU_MS["$name:$target"]=$LAST_POST_CPU_MS
}

# 采样一个数据点并累积三指标；返回 2 = 超时，1 = 其它失败，0 = ok。
# 手写 C 对照直接以 `n=` 作为 argv 运行（不经 shim，避免多一次 exec 抬高 CPU/RSS）。
take_sample() { # name target prog repeat [arg...]
  local name=$1 target=$2 prog=$3 k=$4
  shift 4
  MS_TARGET=$target
  MS_K=$k
  MS_LOG=$WORK/$name.$target.sample
  SAMPLE_LOG["$name:$target"]=$MS_LOG
  case $target in
    wasm) MS_CMD=("$NODE_BIN" "$WASM_RUNNER" "$prog") ;;
    *) MS_CMD=("$prog" "$@") ;;
  esac
  measure_sample
  local rc=$SAMPLE_RC
  if [ "$rc" -ne 0 ]; then
    [ "$rc" -eq 124 ] && return 2
    return 1
  fi
  WALLVALS["$name:$target"]+=" $SAMPLE_WALL_MS"
  CPUVALS["$name:$target"]+=" $SAMPLE_CPU_MS"
  local cur=${RSS["$name:$target"]:-0}
  [ "$SAMPLE_RSS_KB" -gt "$cur" ] && RSS["$name:$target"]=$SAMPLE_RSS_KB
  return 0
}

# 从采样日志里读 GC / 内存统计。
gc_measure() { # name target
  local name=$1 target=$2 log=${SAMPLE_LOG["$1:$2"]:-}
  [ -n "$log" ] && [ -f "$log" ] || return 0
  case $target in
    vuna_ocaml)
      local line
      line=$(grep '^VN_PERF ' "$log" | tail -n 1 || true)
      [ -n "$line" ] || return 0
      GC_MINOR_WORDS[$name]=$(printf '%s' "$line" | sed -n 's/.*minor_words=\([0-9][0-9]*\).*/\1/p')
      GC_MAJOR_WORDS[$name]=$(printf '%s' "$line" | sed -n 's/.*major_words=\([0-9][0-9]*\).*/\1/p')
      GC_MINOR_COLLECTIONS[$name]=$(printf '%s' "$line" | sed -n 's/.*minor_collections=\([0-9][0-9]*\).*/\1/p')
      GC_MAJOR_COLLECTIONS[$name]=$(printf '%s' "$line" | sed -n 's/.*major_collections=\([0-9][0-9]*\).*/\1/p')
      GC_TOP_HEAP[$name]=$(printf '%s' "$line" | sed -n 's/.*top_heap_words=\([0-9][0-9]*\).*/\1/p')
      ;;
    native)
      local line
      line=$(grep '^gc ' "$log" | tail -n 1 || true)
      [ -n "$line" ] || return 0
      NATIVE_GC_NATIVE_COLLECTIONS[$name]=$(printf '%s' "$line" | sed -n 's/.*gc n=\([0-9][0-9]*\).*/\1/p')
      NATIVE_GC_NATIVE_LIVE[$name]=$(printf '%s' "$line" | sed -n 's/.*live=\([0-9][0-9]*\).*/\1/p')
      NATIVE_GC_NATIVE_ALLOC[$name]=$(printf '%s' "$line" | sed -n 's/.*alloc=\([0-9][0-9]*\).*/\1/p')
      ;;
    wasm)
      local line
      line=$(grep '^VN_PERF_WASM ' "$log" | tail -n 1 || true)
      [ -n "$line" ] || return 0
      WASM_MEMORY_BYTES[$name]=$(printf '%s' "$line" | sed -n 's/.*memory_bytes=\([0-9][0-9]*\).*/\1/p')
      WASM_READ_MS[$name]=$(printf '%s' "$line" | sed -n 's/.*read_ms=\([0-9.]*\).*/\1/p')
      WASM_COMPILE_MS[$name]=$(printf '%s' "$line" | sed -n 's/.*compile_ms=\([0-9.]*\).*/\1/p')
      WASM_INSTANTIATE_MS[$name]=$(printf '%s' "$line" | sed -n 's/.*instantiate_ms=\([0-9.]*\).*/\1/p')
      WASM_START_MS[$name]=$(printf '%s' "$line" | sed -n 's/.*start_ms=\([0-9.]*\).*/\1/p')
      ;;
  esac
}

run_bench() { # name
  local name=$1
  local bdir=${BENCH_DIR[$name]}
  local src=$bdir/$name.vuna
  local ml=$bdir/$name.ml
  local golden repeat allowed csrc
  [ -f "$src" ] || die "missing benchmark: $src"
  [ -f "$ml" ] || die "missing OCaml reference: $ml"
  [ -f "$bdir/$name.out" ] || die "missing golden: $name.out"
  golden=$(cat "$bdir/$name.out")
  repeat=$(bench_meta "$name" repeat 1)
  allowed=$(bench_meta "$name" targets "")
  csrc=$(bench_meta "$name" c "")

  note "== $name =="

  # 手写 OCaml 对照（FFI 基准带 C 源）。ocamlopt 把 .cmi/.cmx/.o 写在源文件旁边，
  # 所以先把 `.ml` 复制进工作目录再编译，产物不落到 fixture 目录。
  local mldir=$WORK/$name-ml
  mkdir -p "$mldir"
  local mlbase
  mlbase=$(basename "$ml")
  cp "$ml" "$mldir/$mlbase"
  local oprog=$mldir/prog
  local -a mlargs=("$mlbase")
  [ -n "$csrc" ] && mlargs+=("$bdir/$csrc")
  if ! ( cd "$mldir" && "$OCAMLOPT_BIN" -o "$oprog" "${mlargs[@]}" ) >"$WORK/$name.ocamlopt.log" 2>&1; then
    die "$name: ocamlopt failed for $ml"
  fi

  # 手写 C 对照（可选）：sidecar 的 `n=` 作为 argv 传给 C 程序。C 侧用动态链接的
  # `-O2`（devShell 没有静态 libc）；比值只看同一窗口内的相对值，启动地板在长基准上
  # 可忽略，T0 另用 `-nostdlib` 版本比地板。
  local cprog="" creal="" cn
  local csrc_ref=$bdir/$name.c
  cn=$(bench_meta "$name" n "")
  if [ "$C_REF" = on ] && [ ! -f "$csrc_ref" ]; then
    die "$name: --c-ref on but $name.c is missing"
  fi
  if [ -f "$csrc_ref" ] && [ "$C_REF" != off ]; then
    local cdir=$WORK/$name-c
    mkdir -p "$cdir"
    creal=$cdir/prog
    local cflags
    cflags=$(bench_meta "$name" cc_flags "")
    # 词分割是有意的：cc_flags 是给 cc 的额外参数串（例如 T0 的 -nostdlib）。
    # shellcheck disable=SC2086
    if ! "$CC_BIN" -O2 $cflags -o "$creal" "$csrc_ref" >"$WORK/$name.cc.log" 2>&1; then
      die "$name: cc failed for $csrc_ref (see $WORK/$name.cc.log)"
    fi
    # 有 `n=` 才包 shim：C 对照从 argv 读 N，vuna / OCaml 侧用字面量。
    if [ -n "$cn" ]; then
      printf '#!/bin/sh\nexec "%s" "%s"\n' "$creal" "$cn" >"$cdir/run"
      chmod +x "$cdir/run"
      cprog=$cdir/run
    else
      cprog=$creal
    fi
  fi

  local -A PROGS=()
  local active=""
  local t dir
  for t in $TARGETS; do
    if ! target_allowed "$t" "$allowed"; then
      SKIP["$name:$t"]=excluded
      continue
    fi
    active+=" $t"
    dir=$WORK/$name-$t
    if ! build_target "$name" "$t" "$dir"; then
      # wasm 的构建失败记成跳过（后端拒绝该程序）；其余后端仍是硬失败。
      if [ "$t" = wasm ]; then SKIP["$name:$t"]=build; continue; fi
      die "$name ($t): build failed (see $WORK/$name.$t.*.log)"
    fi
    case $t in
      wasm) PROGS[$t]=$dir/main.wasm ;;
      *) PROGS[$t]=$dir/prog ;;
    esac
    artifact_measure "$name" "$t" "$dir"
  done

  # 参照实现探测：校验 golden，并用它的实测耗时推导本轮运行超时（取更快的参照）。
  local t_ref t_ocaml t_c
  t_ocaml=$(probe_ref "$name (ocaml)" ocaml_ref "$oprog" "$golden")
  t_ref=$t_ocaml
  if [ -n "$cprog" ]; then
    t_c=$(probe_ref "$name (c)" c_ref "$cprog" "$golden")
    # 用较慢的参照推导超时：C 对照普遍比手写 OCaml 快，取最快参照会把正常后端判成超时。
    [ "$t_c" -gt "$t_ref" ] && t_ref=$t_c
  fi
  RUN_TIMEOUT_MS=$(compute_timeout "$name" "$t_ref")
  CASE_TIMEOUT[$name]=$RUN_TIMEOUT_MS
  note "  timeout ${RUN_TIMEOUT_MS} ms (ref ${t_ref} ms)"

  # 被测后端的 golden 校验；超时记 skip，其余不符仍是硬失败。
  local rc actual
  for t in $active; do
    [ -n "${SKIP["$name:$t"]:-}" ] && continue
    rc=0
    check_target "$t" "${PROGS[$t]}" "$golden" || rc=$?
    [ "$rc" -eq 0 ] && continue
    if [ "$rc" -eq 2 ]; then
      SKIP["$name:$t"]=timeout
      note "  $t timeout after ${RUN_TIMEOUT_MS}ms"
      continue
    fi
    # wasm 在浏览器路径上可能超出 V8 的 wasm 栈（非尾深递归），记跳过而不是中断整轮。
    if [ "$t" = wasm ]; then SKIP["$name:$t"]=run; continue; fi
    actual=$(capture_target "$t" "${PROGS[$t]}" 2>&1 || true)
    die "$name ($t): output mismatch or crash
  expected: $golden
  actual:   $actual"
  done

  local i
  for ((i = 1; i < WARMUP; i++)); do
    run_target ocaml_ref "$oprog" >/dev/null 2>&1 || true
    [ -n "$cprog" ] && { run_target c_ref "$cprog" >/dev/null 2>&1 || true; }
    for t in $active; do
      [ -n "${SKIP["$name:$t"]:-}" ] && continue
      run_target "$t" "${PROGS[$t]}" >/dev/null 2>&1 || true
    done
  done

  # 采样：每个样本由 timestat 一次给出墙钟 / CPU / 峰值 RSS。超时是硬失败（记 timeout），
  # 不是慢：它说明实现已经越过该层允许的倍数。
  local i
  for ((i = 0; i < RUNS; i++)); do
    rc=0
    take_sample "$name" ocaml_ref "$oprog" 1 || rc=$?
    [ "$rc" -eq 0 ] || die "$name (ocaml_ref): timed sample failed (exit $SAMPLE_RC)"
    if [ -n "$cprog" ]; then
      # shellcheck disable=SC2086  # n= 可能是多个 argv（如 "5000 10000"）
      take_sample "$name" c_ref "$creal" 1 $cn || die "$name (c_ref): timed sample failed (exit $SAMPLE_RC)"
    fi
    for t in $active; do
      [ -n "${SKIP["$name:$t"]:-}" ] && continue
      rc=0
      take_sample "$name" "$t" "${PROGS[$t]}" "$repeat" || rc=$?
      if [ "$rc" -eq 2 ]; then
        SKIP["$name:$t"]=timeout
        note "  $t timeout after ${RUN_TIMEOUT_MS}ms"
        continue
      fi
      [ "$rc" -eq 0 ] || die "$name ($t): timed run failed (exit $SAMPLE_RC)"
    done
  done
  MED["$name:ocaml_ref"]=$(median_of ${WALLVALS["$name:ocaml_ref"]})
  CPU["$name:ocaml_ref"]=$(median_of ${CPUVALS["$name:ocaml_ref"]})
  [ -n "${RSS["$name:ocaml_ref"]:-}" ] || RSS["$name:ocaml_ref"]=0
  if [ -n "$cprog" ]; then
    MED["$name:c_ref"]=$(median_of ${WALLVALS["$name:c_ref"]})
    CPU["$name:c_ref"]=$(median_of ${CPUVALS["$name:c_ref"]})
    [ -n "${RSS["$name:c_ref"]:-}" ] || RSS["$name:c_ref"]=0
    BIN_BYTES["$name:c_ref"]=$(wc -c <"$creal" | tr -d ' ')
    ART_BYTES["$name:c_ref"]=$(wc -c <"$csrc_ref" | tr -d ' ')
    ART_LINES["$name:c_ref"]=$(wc -l <"$csrc_ref" | tr -d ' ')
    ART_FILES["$name:c_ref"]=1
  fi
  for t in $TARGETS; do
    [ -n "${SKIP["$name:$t"]:-}" ] && continue
    MED["$name:$t"]=$(median_of ${WALLVALS["$name:$t"]})
    CPU["$name:$t"]=$(median_of ${CPUVALS["$name:$t"]})
    [ -n "${RSS["$name:$t"]:-}" ] || RSS["$name:$t"]=0
    if [ "$t" = wasm ]; then
      NET["$name:$t"]=$(awk -v m="${MED["$name:$t"]}" -v f="$NODE_STARTUP_MS" 'BEGIN { d = m - f; if (d < 0) d = 0; printf "%.3f", d }')
      CPU_NET["$name:$t"]=$(awk -v m="${CPU["$name:$t"]}" -v f="$NODE_STARTUP_CPU_MS" 'BEGIN { d = m - f; if (d < 0) d = 0; printf "%.3f", d }')
      RSS_NET["$name:$t"]=$(awk -v m="${RSS["$name:$t"]:-0}" -v f="$NODE_RSS_KB" 'BEGIN { d = m - f; if (d < 0) d = 0; printf "%.0f", d }')
    fi
    gc_measure "$name" "$t"
  done

  # native 默认栈探针：只在计时之外记录，崩溃不中断基线。
  if [ -n "${PROGS[native]:-}" ] && [ -z "${SKIP["$name:native"]:-}" ]; then
    if default_stack_run "${PROGS[native]}" >/dev/null 2>&1; then
      DEFAULT_STACK["$name:native"]=true
    else
      DEFAULT_STACK["$name:native"]=false
    fi
  fi

  local base_rss=${RSS["$name:ocaml_ref"]:-0}
  local base_cpu=${CPU["$name:ocaml_ref"]:-0}
  local c_ref_rss=${RSS["$name:c_ref"]:-0}
  local c_ref_cpu=${CPU["$name:c_ref"]:-0}
  for t in $TARGETS; do
    [ -n "${SKIP["$name:$t"]:-}" ] && continue
    # wasm 的比值一律用 net（减掉 node 地板）：宿主启动不是被测代码的成本。
    local w=${MED["$name:$t"]} c=${CPU["$name:$t"]} r=${RSS["$name:$t"]:-0}
    if [ "$t" = wasm ]; then
      w=${NET["$name:$t"]}
      c=${CPU_NET["$name:$t"]}
      r=${RSS_NET["$name:$t"]}
    fi
    RATIO["$name:$t"]=$(ratio_of "$w" "${MED["$name:ocaml_ref"]}")
    CPU_RATIO["$name:$t"]=$(ratio_of "$c" "$base_cpu")
    RSS_RATIO["$name:$t"]=$(ratio_of "$r" "$base_rss")
    if [ -n "${MED["$name:c_ref"]:-}" ]; then
      C_RATIO["$name:$t"]=$(ratio_of "$w" "${MED["$name:c_ref"]}")
      CPU_C_RATIO["$name:$t"]=$(ratio_of "$c" "$c_ref_cpu")
      RSS_C_RATIO["$name:$t"]=$(ratio_of "$r" "$c_ref_rss")
    fi
  done
  ORDER+=("$name")

  note "  ocaml_ref ${MED["$name:ocaml_ref"]} ms / ${CPU["$name:ocaml_ref"]} cpu / ${RSS["$name:ocaml_ref"]:-0} KB"
  if [ -n "$cprog" ]; then
    note "  c_ref     ${MED["$name:c_ref"]} ms / ${CPU["$name:c_ref"]} cpu / ${RSS["$name:c_ref"]:-0} KB"
  fi
  for t in $TARGETS; do
    if [ -n "${SKIP["$name:$t"]:-}" ]; then
      note "  $t skipped (${SKIP["$name:$t"]})"
      continue
    fi
    local csuffix=""
    [ -n "${C_RATIO["$name:$t"]:-}" ] && csuffix="  vs_c ${C_RATIO["$name:$t"]}x/${CPU_C_RATIO["$name:$t"]}x/${RSS_C_RATIO["$name:$t"]}x"
    if [ "$t" = wasm ]; then
      note "  $t ${MED["$name:$t"]} ms / ${CPU["$name:$t"]} cpu / ${RSS["$name:$t"]:-0} KB (net ${NET["$name:$t"]} / ${CPU_NET["$name:$t"]} cpu / ${RSS_NET["$name:$t"]} KB)  ratio ${RATIO["$name:$t"]}x/${CPU_RATIO["$name:$t"]}x/${RSS_RATIO["$name:$t"]}x$csuffix"
    else
      note "  $t ${MED["$name:$t"]} ms / ${CPU["$name:$t"]} cpu / ${RSS["$name:$t"]:-0} KB  ratio ${RATIO["$name:$t"]}x/${CPU_RATIO["$name:$t"]}x/${RSS_RATIO["$name:$t"]}x$csuffix"
    fi
  done
  if [ -n "${DEFAULT_STACK["$name:native"]:-}" ]; then
    note "  native default_stack_ok=${DEFAULT_STACK["$name:native"]}"
  fi
  if [ -n "${GC_MINOR_WORDS[$name]:-}" ]; then
    note "  gc    minor_words=${GC_MINOR_WORDS[$name]} major_words=${GC_MAJOR_WORDS[$name]} top_heap=${GC_TOP_HEAP[$name]}"
  fi
  if [ -n "${NATIVE_GC_NATIVE_LIVE[$name]:-}" ]; then
    note "  gc    native collections=${NATIVE_GC_NATIVE_COLLECTIONS[$name]} live=${NATIVE_GC_NATIVE_LIVE[$name]} alloc=${NATIVE_GC_NATIVE_ALLOC[$name]}"
  fi
  if [ -n "${WASM_MEMORY_BYTES[$name]:-}" ]; then
    note "  memory wasm_bytes=${WASM_MEMORY_BYTES[$name]}"
    if [ -n "${WASM_START_MS[$name]:-}" ]; then
      note "  startup read=${WASM_READ_MS[$name]:-?}ms compile=${WASM_COMPILE_MS[$name]:-?}ms instantiate=${WASM_INSTANTIATE_MS[$name]:-?}ms start=${WASM_START_MS[$name]:-?}ms"
    fi
  fi
}

if [ "$NODE_VERSION" != n/a ]; then measure_node_floor; fi

for name in $BENCHES; do
  selected "$name" && run_bench "$name"
done
[ ${#ORDER[@]} -gt 0 ] || die "no benchmark selected (--only $ONLY)"

# 写一个后端的测量块；$1=name $2=target，$3=缩进。
emit_backend() {
  local name=$1 target=$2 indent=$3
  if [ -n "${SKIP["$name:$target"]:-}" ]; then
    printf '%s"%s": { "run_ok": false, "skip_reason": "%s" }' \
      "$indent" "$target" "${SKIP["$name:$target"]}"
    return 0
  fi
  printf '%s"%s": { "run_ok": true, "median_ms": %s, "cpu_ms": %s, "rss_kb": %s' \
    "$indent" "$target" "${MED["$name:$target"]}" "${CPU["$name:$target"]:-0}" "${RSS["$name:$target"]:-0}"
  local ops nsop cpu_nsop
  ops=$(bench_meta "$name" ops 0)
  if [ "$ops" -gt 0 ] 2>/dev/null; then
    nsop=$(awk -v ms="${MED["$name:$target"]}" -v n="$ops" 'BEGIN { printf "%.3f", ms * 1000000 / n }')
    cpu_nsop=$(awk -v ms="${CPU["$name:$target"]:-0}" -v n="$ops" 'BEGIN { printf "%.3f", ms * 1000000 / n }')
    printf ', "ops": %s, "ns_per_op": %s, "cpu_ns_per_op": %s' "$ops" "$nsop" "$cpu_nsop"
  fi
  if [ "$target" = wasm ] && [ -n "${NET["$name:$target"]:-}" ]; then
    printf ', "net_median_ms": %s, "net_cpu_ms": %s, "net_rss_kb": %s' \
      "${NET["$name:$target"]}" "${CPU_NET["$name:$target"]:-0}" "${RSS_NET["$name:$target"]:-0}"
  fi
  if [ "$target" = c_ref ]; then
    printf ', "artifact": { "source_bytes": %s, "source_lines": %s, "binary_bytes": %s }' \
      "${ART_BYTES["$name:$target"]}" "${ART_LINES["$name:$target"]}" "${BIN_BYTES["$name:$target"]:-0}"
  elif [ -n "${ART_BYTES["$name:$target"]:-}" ]; then
    local files max_path max_bytes max_lines
    files=${ART_FILES["$name:$target"]:-0}
    max_path=${ART_MAX_PATH["$name:$target"]:-}
    max_bytes=${ART_MAX_BYTES["$name:$target"]:-0}
    max_lines=${ART_MAX_LINES["$name:$target"]:-0}
    if [ "$target" = wasm ]; then
      printf ', "artifact": { "wat_bytes": %s, "wat_lines": %s, "wasm_bytes": %s, "files": %s, "max_file": { "path": "%s", "bytes": %s, "lines": %s } }' \
        "${ART_BYTES["$name:$target"]}" "${ART_LINES["$name:$target"]}" "${WASM_BYTES["$name:$target"]:-0}" \
        "$files" "$(json_escape "$max_path")" "$max_bytes" "$max_lines"
    else
      printf ', "artifact": { "bytes": %s, "lines": %s, "files": %s, "max_file": { "path": "%s", "bytes": %s, "lines": %s }, "binary_bytes": %s }' \
        "${ART_BYTES["$name:$target"]}" "${ART_LINES["$name:$target"]}" \
        "$files" "$(json_escape "$max_path")" "$max_bytes" "$max_lines" \
        "${BIN_BYTES["$name:$target"]:-0}"
    fi
  fi
  if [ -n "${BUILD_CG_MS["$name:$target"]:-}" ]; then
    printf ', "build": { "codegen_ms": %s, "codegen_cpu_ms": %s, "toolchain_ms": %s, "toolchain_cpu_ms": %s, "postprocess_ms": %s, "postprocess_cpu_ms": %s }' \
      "${BUILD_CG_MS["$name:$target"]}" "${BUILD_CG_CPU_MS["$name:$target"]:-null}" \
      "${BUILD_TC_MS["$name:$target"]:-0}" "${BUILD_TC_CPU_MS["$name:$target"]:-null}" \
      "${BUILD_POST_MS["$name:$target"]:-0}" "${BUILD_POST_CPU_MS["$name:$target"]:-null}"
  fi
  if [ "$target" = vuna_ocaml ] && [ -n "${GC_MINOR_WORDS[$name]:-}" ]; then
    printf ', "gc": { "minor_words": %s, "major_words": %s, "minor_collections": %s, "major_collections": %s, "top_heap_words": %s }' \
      "${GC_MINOR_WORDS[$name]:-0}" "${GC_MAJOR_WORDS[$name]:-0}" \
      "${GC_MINOR_COLLECTIONS[$name]:-0}" "${GC_MAJOR_COLLECTIONS[$name]:-0}" "${GC_TOP_HEAP[$name]:-0}"
  fi
  if [ "$target" = native ]; then
    if [ -n "${NATIVE_GC_NATIVE_LIVE[$name]:-}" ]; then
      printf ', "gc": { "collections": %s, "live_bytes": %s, "alloc_bytes": %s }' \
        "${NATIVE_GC_NATIVE_COLLECTIONS[$name]:-0}" "${NATIVE_GC_NATIVE_LIVE[$name]}" "${NATIVE_GC_NATIVE_ALLOC[$name]}"
    fi
    if [ -n "${DEFAULT_STACK["$name:native"]:-}" ]; then
      printf ', "default_stack_ok": %s' "${DEFAULT_STACK["$name:native"]}"
    fi
  fi
  if [ "$target" = wasm ] && [ -n "${WASM_MEMORY_BYTES[$name]:-}" ]; then
    printf ', "memory_bytes": %s' "${WASM_MEMORY_BYTES[$name]}"
    if [ -n "${WASM_START_MS[$name]:-}" ]; then
      printf ', "startup": { "read_ms": %s, "compile_ms": %s, "instantiate_ms": %s, "start_ms": %s }' \
        "${WASM_READ_MS[$name]:-null}" "${WASM_COMPILE_MS[$name]:-null}" \
        "${WASM_INSTANTIATE_MS[$name]:-null}" "${WASM_START_MS[$name]:-null}"
    fi
  fi
  printf ' }'
}

emit_json() {
  local first=1 name t first_t
  printf '{\n'
  printf '  "schema": 5,\n'
  printf '  "meta": {\n'
  printf '    "timestamp": "%s",\n' "$(json_escape "$TIMESTAMP")"
  printf '    "git_head": "%s",\n' "$(json_escape "$GIT_HEAD")"
  printf '    "git_dirty": %s,\n' "$GIT_DIRTY"
  printf '    "compiler": "%s",\n' "$(json_escape "$VUNA_VERSION")"
  printf '    "ocamlopt": "%s",\n' "$(json_escape "$OCAMLOPT_VERSION")"
  printf '    "arch": "%s",\n' "$(json_escape "$ARCH")"
  printf '    "nproc": %s,\n' "$(case $NPROC in *[!0-9]*|'') printf 'null' ;; *) printf '%s' "$NPROC" ;; esac)"
  printf '    "loadavg": "%s",\n' "$(json_escape "$LOADAVG")"
  printf '    "runs": %s,\n' "$RUNS"
  printf '    "warmup": %s,\n' "$WARMUP"
  printf '    "target": "%s",\n' "$TARGET"
  printf '    "stack_policy": "%s",\n' "$(json_escape "$STACK_POLICY")"
  printf '    "wasm_host_runner": "%s",\n' "$(json_escape "$WASM_RUNNER")"
  printf '    "wasm_opt": "%s",\n' "$(json_escape "$WASM_OPT_VERSION")"
  printf '    "node": "%s",\n' "$(json_escape "$NODE_VERSION")"
  printf '    "node_startup_ms": %s,\n' "$(case $NODE_STARTUP_MS in ''|*[!0-9.]*) printf 'null' ;; *) printf '%s' "$NODE_STARTUP_MS" ;; esac)"
  printf '    "node_startup_cpu_ms": %s,\n' "$(case $NODE_STARTUP_CPU_MS in ''|*[!0-9.]*) printf 'null' ;; *) printf '%s' "$NODE_STARTUP_CPU_MS" ;; esac)"
  printf '    "node_rss_kb": %s,\n' "$(case $NODE_RSS_KB in ''|*[!0-9]*) printf 'null' ;; *) printf '%s' "$NODE_RSS_KB" ;; esac)"
  printf '    "wall_method": "CLOCK_MONOTONIC around fork+wait (bench/lib/timestat)",\n'
  printf '    "cpu_method": "wait4 rusage user+sys (bench/lib/timestat)",\n'
  printf '    "rss_method": "wait4 ru_maxrss on every timed sample; max over samples"\n'
  printf '  },\n'
  printf '  "benchmarks": {\n'
  for name in "${ORDER[@]}"; do
    [ "$first" = 1 ] || printf ',\n'
    first=0
    printf '    "%s": {\n' "$name"
    printf '      "tier": "%s",\n' "${BENCH_TIER[$name]}"
    printf '      "timeout_ms": %s,\n' "${CASE_TIMEOUT[$name]:-0}"
    emit_backend "$name" ocaml_ref '      '
    printf ',\n'
    if [ -n "${MED["$name:c_ref"]:-}" ]; then
      emit_backend "$name" c_ref '      '
      printf ',\n'
    fi
    for t in $TARGETS; do
      emit_backend "$name" "$t" '      '
      printf ',\n'
    done
    printf '      "ratios": {'
    first_t=1
    for t in $TARGETS; do
      [ "$first_t" = 1 ] || printf ', '
      first_t=0
      if [ -n "${SKIP["$name:$t"]:-}" ]; then
        printf '"%s": { "run_ok": false }' "$t"
        continue
      fi
      printf '"%s": { "vs_handwritten": %s, "cpu_vs_handwritten": %s, "rss_vs_handwritten": %s' \
        "$t" "${RATIO["$name:$t"]}" "${CPU_RATIO["$name:$t"]}" "${RSS_RATIO["$name:$t"]}"
      if [ "$t" = wasm ] && [ -n "${NET["$name:$t"]:-}" ]; then
        printf ', "net_median_ms": %s, "net_cpu_ms": %s, "net_rss_kb": %s' \
          "${NET["$name:$t"]}" "${CPU_NET["$name:$t"]:-0}" "${RSS_NET["$name:$t"]:-0}"
      fi
      if [ -n "${C_RATIO["$name:$t"]:-}" ]; then
        printf ', "vs_c": %s, "cpu_vs_c": %s, "rss_vs_c": %s' \
          "${C_RATIO["$name:$t"]}" "${CPU_C_RATIO["$name:$t"]}" "${RSS_C_RATIO["$name:$t"]}"
      fi
      if [ "$t" != vuna_ocaml ] && [ -n "${MED["$name:vuna_ocaml"]:-}" ]; then
        printf ', "vs_ocaml_backend": %s, "cpu_vs_ocaml_backend": %s, "rss_vs_ocaml_backend": %s' \
          "$(ratio_of "${MED["$name:$t"]}" "${MED["$name:vuna_ocaml"]}")" \
          "$(ratio_of "${CPU["$name:$t"]}" "${CPU["$name:vuna_ocaml"]}")" \
          "$(ratio_of "${RSS["$name:$t"]:-0}" "${RSS["$name:vuna_ocaml"]:-0}")"
      fi
      printf ' }'
    done
    printf ' }'
    if [ -n "${MED["$name:c_ref"]:-}" ]; then
      printf ', "ocaml_vs_c": %s' "$(ratio_of "${MED["$name:ocaml_ref"]}" "${MED["$name:c_ref"]}")"
    fi
    printf '\n'
    printf '    }'
  done
  printf '\n  }\n}\n'
}

ns_per_op() { # name target
  local ops
  ops=$(bench_meta "$1" ops 0)
  if [ "$ops" -gt 0 ] 2>/dev/null; then
    awk -v ms="${MED["$1:$2"]:-0}" -v n="$ops" 'BEGIN { printf "%.2f", ms * 1000000 / n }'
  else
    printf '-'
  fi
}

print_table() {
  note ""
  note "-- 时间口径（wall = 墙钟中位数；cpu = rusage user+sys 中位数；ratio 对手写 OCaml）"
  printf '  %-15s %-5s %-10s %9s %9s %7s %7s %8s %7s %7s\n' \
    benchmark tier backend wall_ms cpu_ms w_ratio c_ratio ns/op vs_c_w vs_c_c
  local name t tier vs_c vs_c_cpu
  for name in "${ORDER[@]}"; do
    tier=${BENCH_TIER[$name]}
    printf '  %-15s %-5s %-10s %9s %9s %7s %7s %8s %7s %7s\n' "$name" "$tier" ocaml_ref \
      "${MED["$name:ocaml_ref"]}" "${CPU["$name:ocaml_ref"]}" "1.00x" "1.00x" \
      "$(ns_per_op "$name" ocaml_ref)" "-" "-"
    if [ -n "${MED["$name:c_ref"]:-}" ]; then
      printf '  %-15s %-5s %-10s %9s %9s %7s %7s %8s %7s %7s\n' "$name" "$tier" c_ref \
        "${MED["$name:c_ref"]}" "${CPU["$name:c_ref"]}" \
        "$(ratio_of "${MED["$name:c_ref"]}" "${MED["$name:ocaml_ref"]}")x" \
        "$(ratio_of "${CPU["$name:c_ref"]}" "${CPU["$name:ocaml_ref"]}")x" \
        "$(ns_per_op "$name" c_ref)" "1.00x" "1.00x"
    fi
    for t in $TARGETS; do
      if [ -n "${SKIP["$name:$t"]:-}" ]; then
        printf '  %-15s %-5s %-10s %9s %9s %7s %7s %8s %7s %7s\n' "$name" "$tier" "$t" "-" "-" "skipped" "-" "-" "-" "-"
        continue
      fi
      vs_c=${C_RATIO["$name:$t"]:-}
      vs_c_cpu=${CPU_C_RATIO["$name:$t"]:-}
      printf '  %-15s %-5s %-10s %9s %9s %7s %7s %8s %7s %7s\n' "$name" "$tier" "$t" \
        "${MED["$name:$t"]}" "${CPU["$name:$t"]}" "${RATIO["$name:$t"]}x" "${CPU_RATIO["$name:$t"]}x" \
        "$(ns_per_op "$name" "$t")" "${vs_c:+${vs_c}x}" "${vs_c_cpu:+${vs_c_cpu}x}"
    done
  done

  note ""
  note "-- 内存口径（rss = 样本峰值；wasm 另给 net = 减空 node 地板；ratio 对手写 OCaml）"
  printf '  %-16s %-6s %-10s %12s %12s %11s %10s\n' benchmark tier backend rss_kb net_rss_kb rss_ratio vs_c_rss
  local rss_r vs_c_rss
  for name in "${ORDER[@]}"; do
    tier=${BENCH_TIER[$name]}
    printf '  %-16s %-6s %-10s %12s %12s %11s %10s\n' "$name" "$tier" ocaml_ref \
      "${RSS["$name:ocaml_ref"]:-0}" "-" "1.00x" "-"
    if [ -n "${MED["$name:c_ref"]:-}" ]; then
      printf '  %-16s %-6s %-10s %12s %12s %11s %10s\n' "$name" "$tier" c_ref \
        "${RSS["$name:c_ref"]:-0}" "-" \
        "$(ratio_of "${RSS["$name:c_ref"]:-0}" "${RSS["$name:ocaml_ref"]:-0}")x" "1.00x"
    fi
    for t in $TARGETS; do
      if [ -n "${SKIP["$name:$t"]:-}" ]; then
        printf '  %-16s %-6s %-10s %12s %12s %11s %10s\n' "$name" "$tier" "$t" "-" "-" "skipped" "-"
        continue
      fi
      rss_r=${RSS_RATIO["$name:$t"]:-0}
      vs_c_rss=${RSS_C_RATIO["$name:$t"]:-}
      local rss_net_disp=-
      if [ "$t" = wasm ] && [ -n "${RSS_NET["$name:$t"]:-}" ]; then
        rss_net_disp=${RSS_NET["$name:$t"]}
      fi
      printf '  %-16s %-6s %-10s %12s %12s %11s %10s\n' "$name" "$tier" "$t" \
        "${RSS["$name:$t"]:-0}" "$rss_net_disp" "${rss_r}x" "${vs_c_rss:+${vs_c_rss}x}"
    done
  done
}

# 分层汇总：每个 tier × 后端一行。几何平均压住单点噪声，max 暴露尾部。
geomean_of() { # 每行一个数
  awk 'BEGIN { n = 0; s = 0 }
       $1 + 0 > 0 { n++; s += log($1 + 0) }
       END { if (n == 0) print "-"; else printf "%.2f", exp(s / n) }'
}

print_tier_table() {
  note ""
  note "-- 分层汇总：几何平均，格式为「vs 手写 C / vs 手写 OCaml」；wasm 用 net 口径，无 C 对照显示 -"
  printf '  %-6s %-10s %12s %12s %12s %6s\n' tier backend wall cpu rss cases
  local tiers tier t name n vals_wc vals_wo vals_cc vals_co vals_rc vals_ro
  tiers=$(for name in "${ORDER[@]}"; do printf '%s\n' "${BENCH_TIER[$name]}"; done | sort -u)
  for tier in $tiers; do
    for t in $TARGETS; do
      n=0; vals_wc=""; vals_wo=""; vals_cc=""; vals_co=""; vals_rc=""; vals_ro=""
      for name in "${ORDER[@]}"; do
        [ "${BENCH_TIER[$name]}" = "$tier" ] || continue
        [ -n "${SKIP["$name:$t"]:-}" ] && continue
        n=$((n + 1))
        vals_wo+="${RATIO["$name:$t"]}"$'\n'
        vals_co+="${CPU_RATIO["$name:$t"]}"$'\n'
        vals_ro+="${RSS_RATIO["$name:$t"]}"$'\n'
        if [ -n "${C_RATIO["$name:$t"]:-}" ]; then
          vals_wc+="${C_RATIO["$name:$t"]}"$'\n'
          vals_cc+="${CPU_C_RATIO["$name:$t"]}"$'\n'
          vals_rc+="${RSS_C_RATIO["$name:$t"]}"$'\n'
        fi
      done
      [ "$n" -gt 0 ] || continue
      printf '  %-6s %-10s %12s %12s %12s %6s\n' "$tier" "$t" \
        "$(tier_cell "$vals_wc" "$vals_wo")" "$(tier_cell "$vals_cc" "$vals_co")" \
        "$(tier_cell "$vals_rc" "$vals_ro")" "$n"
    done
  done
}

# 一个格子：vs C 的几何平均（无 C 对照为 -）/ vs 手写 OCaml 的几何平均。
tier_cell() { # vals_c vals_ocaml
  local gc go
  gc=$(printf '%s' "$1" | geomean_of)
  go=$(printf '%s' "$2" | geomean_of)
  if [ "$gc" = "-" ]; then printf -- '-/%s' "$go"; else printf '%s/%s' "$gc" "$go"; fi
}

# 产物表：中间文本文件数与最大文件、最终二进制大小、codegen/工具链耗时。
print_artifact_table() {
  note ""
  printf '  %-16s %-11s %7s %11s %11s %11s %10s %11s %10s %10s %10s %10s\n' \
    benchmark backend files text_bytes max_file bin_bytes codegen_ms toolchain_ms opt_ms cg_cpu tc_cpu opt_cpu
  local name t
  for name in "${ORDER[@]}"; do
    for t in $TARGETS; do
      [ -n "${SKIP["$name:$t"]:-}" ] && continue
      printf '  %-16s %-11s %7s %11s %11s %11s %10s %11s %10s %10s %10s %10s\n' "$name" "$t" \
        "${ART_FILES["$name:$t"]:-0}" "${ART_BYTES["$name:$t"]:-0}" \
        "${ART_MAX_BYTES["$name:$t"]:-0}" "${BIN_BYTES["$name:$t"]:-0}" \
        "${BUILD_CG_MS["$name:$t"]:-0}" "${BUILD_TC_MS["$name:$t"]:-0}" "${BUILD_POST_MS["$name:$t"]:-0}" \
        "${BUILD_CG_CPU_MS["$name:$t"]:-n/a}" "${BUILD_TC_CPU_MS["$name:$t"]:-n/a}" "${BUILD_POST_CPU_MS["$name:$t"]:-n/a}"
    done
  done
}

# 从基线读一个 ratio：kind = wall|cpu|rss（wasm 的值本身已是 net 口径）。
baseline_ratio() { # name target kind
  local name=$1 target=$2 kind=$3 field v
  case $kind in
    wall) field=vs_handwritten ;;
    cpu) field=cpu_vs_handwritten ;;
    rss) field=rss_vs_handwritten ;;
    *) return 0 ;;
  esac
  v=$(jq -r --arg n "$name" --arg t "$target" --arg f "$field" \
    '.benchmarks[$n].ratios[$t][$f] // empty' "$BASELINE")
  printf '%s' "$v"
}

baseline_abs() { # name target kind(wall|cpu|rss)
  local field=median_ms net_field=net_median_ms
  case ${3:-wall} in
    cpu) field=cpu_ms; net_field=net_cpu_ms ;;
    rss) field=rss_kb; net_field=net_rss_kb ;;
  esac
  jq -r --arg n "$1" --arg t "$2" --arg f "$field" --arg nf "$net_field" \
    'if $t == "wasm" then (.benchmarks[$n][$t][$nf] // .benchmarks[$n][$t][$f]) else .benchmarks[$n][$t][$f] end // empty' "$BASELINE"
}

baseline_artifact() { # name target
  jq -r --arg n "$1" --arg t "$2" '(.benchmarks[$n][$t].artifact.bytes // .benchmarks[$n][$t].artifact.wat_bytes) // empty' "$BASELINE"
}

# 统一比较：current / baseline → "delta_% verdict"。$4=threshold $5=fail-threshold。
judge_delta() { # cur base threshold fail
  awk -v c="$1" -v b="$2" -v th="$3" -v ft="$4" 'BEGIN {
    if (b + 0 == 0) { print "n/a new"; exit }
    d = (c - b) / b * 100
    if (d > ft) printf "%.1f FAIL\n", d;
    else if (d > th) printf "%.1f WARN\n", d;
    else printf "%.1f ok\n", d;
  }'
}

compare_baseline() {
  command -v jq >/dev/null 2>&1 || die "jq not found (use: nix run .#vuna-perf)"
  local base_compiler base_arch base_nproc base_load
  base_compiler=$(jq -r '.meta.compiler // "unknown"' "$BASELINE")
  base_arch=$(jq -r '.meta.arch // "unknown"' "$BASELINE")
  base_nproc=$(jq -r '.meta.nproc // "unknown"' "$BASELINE")
  base_load=$(jq -r '.meta.loadavg // "unknown"' "$BASELINE")
  local same_machine=0
  if [ "$base_arch" = "$ARCH" ] && [ "$base_nproc" = "$NPROC" ] && [ "$base_compiler" = "$VUNA_VERSION" ]; then
    same_machine=1
  fi
  note ""
  note "== 对比基线 =="
  note "baseline: $BASELINE"
  if [ "$same_machine" = 0 ]; then
    note "跨口径基线（arch=$base_arch nproc=$base_nproc compiler=$base_compiler；当前 $ARCH/$NPROC/$VUNA_VERSION）：只比 ratio，软告警"
  fi
  note "loadavg: 基线 $base_load / 当前 $LOADAVG（wall 与 RSS 读数都受宿主负载影响）"
  note "threshold: WARN ${THRESHOLD}% / FAIL ${FAIL_THRESHOLD}% / artifact ${ARTIFACT_THRESHOLD}%"
  printf '  %-16s %-11s %-8s %10s %10s %10s  %s\n' benchmark backend metric cur base delta result
  local warns=0 fails=0 ok=0 news=0 missing=0 name t cur basev delta verdict metric
  for name in "${ORDER[@]}"; do
    for t in $TARGETS; do
      if [ -n "${SKIP["$name:$t"]:-}" ]; then
        printf '  %-16s %-11s %-8s %10s %10s %10s  %s\n' "$name" "$t" wall "-" "-" "-" "skipped(${SKIP["$name:$t"]})"
        continue
      fi
      # 三个指标各一行（wasm 的比值本身已是减地板的 net 口径）。
      local metric cur label basev
      for metric in wall cpu rss; do
        case $metric in
          wall) cur=${RATIO["$name:$t"]} ;;
          cpu) cur=${CPU_RATIO["$name:$t"]} ;;
          rss) cur=${RSS_RATIO["$name:$t"]} ;;
        esac
        label=$metric
        basev=$(baseline_ratio "$name" "$t" "$label")
        if [ -z "$basev" ]; then
          printf '  %-16s %-11s %-8s %10s %10s %10s  %s\n' "$name" "$t" "$label" "${cur}x" "-" "-" "new"
          news=$((news + 1))
          continue
        fi
        read -r delta verdict <<<"$(judge_delta "$cur" "$basev" "$THRESHOLD" "$FAIL_THRESHOLD")"
        # 同机器有绝对值基线时，ratio 只作参考：归一化会把整体抬升摊掉，也会把手写
        # OCaml 分母的量化噪声放大；回归判定交给下面的 abs 行。
        if [ "$same_machine" = 1 ] && [ -n "$(baseline_abs "$name" "$t" "$metric")" ]; then
          verdict=info
        fi
        case $verdict in WARN) warns=$((warns + 1)) ;; FAIL) fails=$((fails + 1)) ;; new) news=$((news + 1)) ;; ok) ok=$((ok + 1)) ;; esac
        printf '  %-16s %-11s %-8s %10s %10s %10s  %s\n' "$name" "$t" "$label" "${cur}x" "${basev}x" "${delta}%" "$verdict"
      done
      # 同机器时再比三个指标的绝对值（ratio 会归一化掉整体变慢）。
      if [ "$same_machine" = 1 ]; then
        local unit
        for metric in wall cpu rss; do
          case $metric in
            cpu) curabs=${CPU["$name:$t"]}
                 [ "$t" = wasm ] && [ -n "${CPU_NET["$name:$t"]:-}" ] && curabs=${CPU_NET["$name:$t"]}
                 unit=ms ;;
            rss) curabs=${RSS["$name:$t"]:-0}
                 [ "$t" = wasm ] && [ -n "${RSS_NET["$name:$t"]:-}" ] && curabs=${RSS_NET["$name:$t"]}
                 unit=KB ;;
            *)   curabs=${MED["$name:$t"]}
                 [ "$t" = wasm ] && [ -n "${NET["$name:$t"]:-}" ] && curabs=${NET["$name:$t"]}
                 unit=ms ;;
          esac
          basev=$(baseline_abs "$name" "$t" "$metric")
          if [ -n "$basev" ]; then
            read -r delta verdict <<<"$(judge_delta "$curabs" "$basev" "$THRESHOLD" "$FAIL_THRESHOLD")"
            # wasm 的 net 是「绝对值 - 地板」：net 不到地板两倍时地板噪声主导，只作参考。
            if [ "$t" = wasm ] && [ "$metric" != rss ]; then
              local floor=$NODE_STARTUP_MS
              [ "$metric" = cpu ] && floor=$NODE_STARTUP_CPU_MS
              if awk -v v="$curabs" -v f="$floor" 'BEGIN { exit !(v + 0 < 2 * (f + 0)) }'; then
                verdict=info
              fi
            fi
            case $verdict in WARN) warns=$((warns + 1)) ;; FAIL) fails=$((fails + 1)) ;; new) news=$((news + 1)) ;; *) ok=$((ok + 1)) ;; esac
            printf '  %-16s %-11s %-8s %10s %10s %10s  %s\n' "$name" "$t" "abs_${metric}" "${curabs}${unit}" "${basev}${unit}" "${delta}%" "$verdict"
          fi
        done
      fi
      # 产物字节数
      if [ "$ARTIFACT_THRESHOLD" -gt 0 ]; then
        cur=${ART_BYTES["$name:$t"]:-}
        basev=$(baseline_artifact "$name" "$t")
        if [ -n "$cur" ] && [ -n "$basev" ]; then
          read -r delta verdict <<<"$(judge_delta "$cur" "$basev" "$ARTIFACT_THRESHOLD" "$FAIL_THRESHOLD")"
          case $verdict in WARN) warns=$((warns + 1)) ;; FAIL) fails=$((fails + 1)) ;; new) news=$((news + 1)) ;; *) ok=$((ok + 1)) ;; esac
          printf '  %-16s %-11s %-8s %10s %10s %10s  %s\n' "$name" "$t" artifact "${cur}B" "${basev}B" "${delta}%" "$verdict"
        elif [ -n "$cur" ]; then
          printf '  %-16s %-11s %-8s %10s %10s %10s  %s\n' "$name" "$t" artifact "${cur}B" "-" "-" "new"
          news=$((news + 1))
        fi
      fi
      # 默认栈探针（信息性）
      if [ "$t" = native ] && [ -n "${DEFAULT_STACK["$name:native"]:-}" ]; then
        cur=${DEFAULT_STACK["$name:native"]}
        basev=$(jq -r --arg n "$name" '.benchmarks[$n].native | if has("default_stack_ok") then (.default_stack_ok | tostring) else empty end' "$BASELINE")
        if [ -n "$basev" ]; then
          verdict=ok
          [ "$cur" != "$basev" ] && verdict=changed
          printf '  %-16s %-11s %-8s %10s %10s %10s  %s\n' "$name" "$t" stack "$cur" "$basev" "-" "$verdict"
        fi
      fi
    done
  done
  # 基线里有、本次没跑（或本次被 --only 排除）的 benchmark：一行列出。
  local bname missing_names=""
  while IFS= read -r bname; do
    [ -n "$bname" ] || continue
    case " ${ORDER[*]} " in *" $bname "*) continue ;; esac
    missing_names+=" $bname"
  done < <(jq -r '.benchmarks | keys[]' "$BASELINE")
  if [ -n "$missing_names" ]; then
    missing=$(printf '%s\n' $missing_names | wc -w | tr -d ' ')
    note "missing (本次未跑):$missing_names"
  fi

  note ""
  note "summary: ok=$ok warn=$warns fail=$fails new=$news missing=$missing"
  if [ "$fails" -gt 0 ]; then
    note "PERF-CHECK-FAIL（$fails 项超过 ${FAIL_THRESHOLD}%）"
    return 1
  fi
  if [ "$warns" -gt 0 ]; then
    note "PERF-CHECK-WARN（$warns 项超过 ${THRESHOLD}%）"
    [ "$STRICT" = 1 ] && return 1
    return 0
  fi
  note "PERF-CHECK-OK"
  return 0
}

if [ "$JSON_OUT" = "-" ]; then
  emit_json
  rc=0
  if [ -n "$BASELINE" ]; then compare_baseline >&2 || rc=$?; fi
  exit $rc
else
  print_table
  print_tier_table
  print_artifact_table
  if [ -n "$JSON_OUT" ]; then
    if [ "$GIT_DIRTY" = true ]; then
      note "warning: 工作树有未提交改动，基线会记 git_dirty=true（$JSON_OUT）" >&2
    fi
    emit_json >"$JSON_OUT"
    note "json: $JSON_OUT"
  fi
  rc=0
  if [ -n "$BASELINE" ]; then compare_baseline || rc=$?; fi
  exit $rc
fi