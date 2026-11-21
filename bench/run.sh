#!/usr/bin/env bash
# vuna-perf：生成程序 + 编译器运行基准（`nix run .#vuna-perf`）。
#
# 与 bench/bootstrap.sh 的分工：bootstrap.sh 测**构建/编译**的墙钟与产物尺寸；本脚本测
# **生成程序运行时**（vuna 产物 vs 手写 OCaml 等价实现）。
#
# 口径：
#   * 每个 benchmark 一份 `bench/programs/<name>.vuna`（vuna）与 `<name>.ml`（手写
#     OCaml 等价实现，同算法；个别库基准用标准库上限，见各文件注释），`.out` 是 golden；
#   * 可选 `<name>.bench` sidecar（`key=value`）：
#       repeat=N      每次计时采样内重复运行 N 次（默认 1；小项 / 启动成本用）
#       ops=N         该程序一次运行的代表性操作数（默认 0 = 不报 ns/op）
#       targets=a,b   只在这些 target 上跑（ocaml / native / wasm；默认全部）
#       c=path        额外参与链接的 C 源（FFI；相对 bench/programs）
#       skip=1        不参与默认集合
#   * `--target` 选择被测后端：ocaml（默认）/ native / wasm / both / all；
#   * 每项先 warmup 再跑 --runs 次取**中位数**；峰值内存与 GC 采样在计时样本上做
#     （`--rss-passes`，默认 1，0 = 不采样），不再单独跑一轮；
#   * native 进程由入口自带栈运行（默认 512 MiB 虚拟，独立于 `ulimit -s`）；
#     `stack_policy` 记进 JSON；
#   * 跨机器比较只看 `ratio = <backend>_median / ocaml_median` 与
#     `rss_ratio`；wasm 另给 `net_*`（减掉 node 启动地板）；
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
RSS_PASSES=1
THRESHOLD=20
FAIL_THRESHOLD=50
ARTIFACT_THRESHOLD=20
STRICT=0
LIST=0
JSON_OUT=""
BASELINE=""
CHECK=0
ONLY=""
TARGET=ocaml
VUNA_BIN=${VUNA:-vuna}
OCAMLOPT_BIN=${OCAMLOPT:-ocamlopt}
CC_BIN=${CC:-cc}
VUNA_BASE_OVERRIDE=${VUNA_BASE:-}

usage() {
  cat <<'EOF'
usage: vuna-perf [options]

在仓库根目录运行。默认测量全部基准并打印表格。

options:
  --runs N               计时样本数（默认 3）
  --warmup N             计时前预热次数（默认 1；golden 校验那次也计一次）
  --rss-passes N         RSS / GC 采样数（默认 1；从计时的样本里取，0 = 不采样）
  --target T             被测后端：ocaml / native / wasm / both / all（默认 ocaml）
  --only NAME            只跑一个基准（可重复）
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
    --rss-passes) [ $# -ge 2 ] || die "--rss-passes needs a value"; RSS_PASSES=$2; shift 2 ;;
    --rss-passes=*) RSS_PASSES=${1#*=}; shift ;;
    --target) [ $# -ge 2 ] || die "--target needs a value"; TARGET=$2; shift 2 ;;
    --target=*) TARGET=${1#*=}; shift ;;
    --only) [ $# -ge 2 ] || die "--only needs a value"; ONLY="$ONLY $2"; shift 2 ;;
    --only=*) ONLY="$ONLY ${1#*=}"; shift ;;
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
case $RSS_PASSES in *[!0-9]*) die "--rss-passes must be a non-negative integer" ;; esac
case $THRESHOLD in ''|*[!0-9]*|0) die "--threshold must be a positive integer (percent)" ;; esac
case $FAIL_THRESHOLD in ''|*[!0-9]*|0) die "--fail-threshold must be a positive integer (percent)" ;; esac
case $ARTIFACT_THRESHOLD in *[!0-9]*) die "--artifact-threshold must be a non-negative integer (percent)" ;; esac
[ "$FAIL_THRESHOLD" -ge "$THRESHOLD" ] || die "--fail-threshold must be >= --threshold"
# RSS/GC 采样从计时样本里取，至少留一个纯计时样本。
if [ "$RSS_PASSES" -ge "$RUNS" ]; then RSS_PASSES=$((RUNS - 1)); fi
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
bench_meta() { # name key default
  local f=$REPO/bench/programs/$1.bench
  [ -f "$f" ] || { printf '%s' "$3"; return; }
  local v
  v=$(sed -n "s/^$2=//p" "$f" | tail -n 1)
  printf '%s' "${v:-$3}"
}

discover_benchmarks() {
  local f n
  for f in "$REPO"/bench/programs/*.vuna; do
    [ -f "$f" ] || continue
    n=$(basename "$f" .vuna)
    [ "$(bench_meta "$n" skip 0)" = 1 ] && continue
    printf '%s\n' "$n"
  done | sort
}

target_allowed() { # target allowed_csv
  local t=$1 a=$2
  [ -z "$a" ] && return 0
  case $t in vuna_ocaml) t=ocaml ;; esac
  case ",$a," in *",$t,"*) return 0 ;; *) return 1 ;; esac
}

target_name() { case $1 in vuna_ocaml) printf 'ocaml' ;; *) printf '%s' "$1" ;; esac; }

BENCHES=$(discover_benchmarks)
[ -n "$BENCHES" ] || die "no benchmarks found under bench/programs"

if [ "$LIST" = 1 ]; then
  printf '  %-16s %-16s %-6s %s\n' benchmark targets repeat notes
  for name in $BENCHES; do
    t=$(bench_meta "$name" targets "ocaml,native,wasm")
    r=$(bench_meta "$name" repeat 1)
    c=$(bench_meta "$name" c "")
    o=$(bench_meta "$name" ops 0)
    extra=""
    [ -n "$c" ] && extra="c=$c"
    [ "$o" != 0 ] && extra="$extra ops=$o"
    printf '  %-16s %-16s %-6s %s\n' "$name" "$t" "$r" "$extra"
  done
  exit 0
fi

command -v "$VUNA_BIN" >/dev/null 2>&1 || die "vuna not found: $VUNA_BIN"
command -v "$OCAMLOPT_BIN" >/dev/null 2>&1 || die "ocamlopt not found: $OCAMLOPT_BIN"
# wasm 的执行宿主是仓库自带的 Node/V8 宿主：与浏览器同一套 WebAssembly API 和 host 层。
WASM_RUNNER=${WASM_RUNNER:-$REPO/wasm-host/run.mjs}
WASM_OPT_BIN=${WASM_OPT_BIN:-wasm-opt}
WASM_OPT_FLAGS="--enable-gc --enable-bulk-memory --enable-tail-call --enable-reference-types"
WASM_OPT_LEVEL=${WASM_OPT_LEVEL:-3}
NODE_BIN=${NODE:-node}
NODE_VERSION=n/a
NODE_STARTUP_MS=n/a
WASM_ENGINE_VERSION=n/a
case " $TARGETS " in
  *" native "*)
    command -v "$CC_BIN" >/dev/null 2>&1 || die "cc not found: $CC_BIN (native 链接需要)"
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
    # 宿主启动地板：每项测量都包含 node 启动 + 模块实例化，这里单独记一个只含 node 启动的数。
    _t0=$(date +%s%N)
    for _i in 1 2 3 4 5; do "$NODE_BIN" -e '' >/dev/null 2>&1; done
    _t1=$(date +%s%N)
    NODE_STARTUP_MS=$(( (_t1 - _t0 + 2500000) / 5000000 ))
    if [ "$STACK_POLICY" = n/a ]; then
      STACK_POLICY="node (V8 wasm stack, no knob)"
    else
      STACK_POLICY="$STACK_POLICY; node (V8 wasm stack, no knob)"
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

# 中位数：参数是若干整数（每行一个）。
median_of() {
  printf '%s\n' "$@" | sort -n | awk '{ a[NR] = $1 } END { if (NR % 2) print a[(NR + 1) / 2]; else print int((a[NR / 2] + a[NR / 2 + 1]) / 2) }'
}

# 比率：$1/$2，两位小数；分母 <= 0 时给 0。
ratio_of() {
  awk -v a="$1" -v b="$2" 'BEGIN { if (b + 0 <= 0) print "0"; else printf "%.2f", a / b }'
}

# GNU time 的 max RSS（KB）；不可用时返回空。`type -P` 跳过 bash 的 time 关键字。
TIME_BIN=$(type -P time || true)
if [ -n "$TIME_BIN" ] && ! "$TIME_BIN" -f '%M' true >/dev/null 2>&1; then TIME_BIN=""; fi

# native 产物由入口自带栈运行；wasm 产物由 JS 宿主执行。
run_target() { vuna_run_target "$1" "$2"; }

# native 默认栈探针：固定 8 MiB soft limit，记录程序能否正常退出（信息性）。
default_stack_run() { # program
  bash -c 'ulimit -s 8192 2>/dev/null; exec "$1"' _ "$1"
}

capture_target() { vuna_capture_target "$1" "$2"; }

selected() {
  case " $ONLY " in
    *" $1 "*) return 0 ;;
    *) [ -z "$ONLY" ] && return 0 || return 1 ;;
  esac
}

declare -A MED NET RSS RATIO NET_RATIO RSS_RATIO DEFAULT_STACK SKIP \
  GC_MINOR_WORDS GC_MAJOR_WORDS GC_MINOR_COLLECTIONS GC_MAJOR_COLLECTIONS GC_TOP_HEAP \
  NATIVE_GC_NATIVE_LIVE NATIVE_GC_NATIVE_ALLOC NATIVE_GC_NATIVE_COLLECTIONS \
  WASM_MEMORY_BYTES ART_BYTES ART_LINES WASM_BYTES SAMPLE_LOG \
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
  [ -n "$csrc" ] && csrcs=("$REPO/bench/programs/$csrc")
  vuna_build_target "$REPO/bench/programs/$name.vuna" "$target" "$dir" "${csrcs[@]}" || return 1
  BUILD_CG_MS["$name:$target"]=$LAST_CODEGEN_MS
  BUILD_TC_MS["$name:$target"]=$LAST_TOOLCHAIN_MS
  BUILD_CG_CPU_MS["$name:$target"]=$LAST_CODEGEN_CPU_MS
  BUILD_TC_CPU_MS["$name:$target"]=$LAST_TOOLCHAIN_CPU_MS
  BUILD_POST_MS["$name:$target"]=$LAST_POST_MS
  BUILD_POST_CPU_MS["$name:$target"]=$LAST_POST_CPU_MS
}

# 校验产物输出与 golden 一致；返回 1 = 不一致或运行失败（调用方决定 die 还是记 skip）。
out_ok() { # target program golden
  local actual
  actual=$(capture_target "$1" "$2") || return 1
  [ "$actual" = "$3" ] || return 1
  return 0
}

expect_out() { # label target program golden
  local label=$1 target=$2 program=$3 golden=$4 actual
  actual=$(capture_target "$target" "$program") || die "$label: program failed: $program"
  if [ "$actual" != "$golden" ]; then
    die "$label: output mismatch
  expected: $golden
  actual:   $actual"
  fi
}

# 计时：把一个采样内的 k 次运行合在一起，再除以 k（小项 / 启动成本用）。
measure_runs() { # target program k
  local t0 t1 j
  t0=$(now_ns)
  for ((j = 0; j < $3; j++)); do run_target "$1" "$2" >/dev/null 2>&1 || true; done
  t1=$(now_ns)
  awk -v a=$((t1 - t0)) -v k="$3" 'BEGIN { printf "%.0f", (a / 1000000) / k }'
}

# 采样一次：GNU time 取 maxRSS；按 target 打开 GC / 内存统计。不参与墙钟。
sample_target() { # name target program
  local name=$1 target=$2 prog=$3
  local rf=$WORK/$name.$target.rss log=$WORK/$name.$target.sample
  : >"$rf"
  : >"$log"
  local -a envs=()
  local -a cmd=()
  case $target in
    ocaml_ref) cmd=("$prog") ;;
    vuna_ocaml) envs+=(VN_PERF_STATS=1); cmd=("$prog") ;;
    native) envs+=(VUNA_NATIVE_GC_LOG=1); cmd=("$prog") ;;
    wasm) envs+=(VN_PERF_STATS=1); cmd=("$NODE_BIN" "$WASM_RUNNER" "$prog") ;;
  esac
  if [ -n "$TIME_BIN" ]; then
    env "${envs[@]}" "$TIME_BIN" -f '%M' -o "$rf" ${cmd[@]+"${cmd[@]}"} >/dev/null 2>"$log" || true
  else
    env "${envs[@]}" ${cmd[@]+"${cmd[@]}"} >/dev/null 2>"$log" || true
  fi
  local rss
  rss=$(tr -dc '0-9' <"$rf" 2>/dev/null | head -c 20)
  [ -n "$rss" ] || rss=0
  local cur=${RSS["$name:$target"]:-0}
  [ "$rss" -lt "$cur" ] && rss=$cur
  RSS["$name:$target"]=$rss
  SAMPLE_LOG["$name:$target"]=$log
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
      ;;
  esac
}

run_bench() { # name
  local name=$1
  local src=$REPO/bench/programs/$name.vuna
  local ml=$REPO/bench/programs/$name.ml
  local golden repeat allowed csrc
  [ -f "$src" ] || die "missing benchmark: $src"
  [ -f "$ml" ] || die "missing OCaml reference: $ml"
  [ -f "$REPO/bench/programs/$name.out" ] || die "missing golden: $name.out"
  golden=$(cat "$REPO/bench/programs/$name.out")
  repeat=$(bench_meta "$name" repeat 1)
  allowed=$(bench_meta "$name" targets "")
  csrc=$(bench_meta "$name" c "")

  note "== $name =="

  # 手写 OCaml 对照（FFI 基准带 C 源）。
  local mldir=$WORK/$name-ml
  mkdir -p "$mldir"
  local oprog=$mldir/prog
  local -a mlargs=("$ml")
  [ -n "$csrc" ] && mlargs+=("$REPO/bench/programs/$csrc")
  if ! ( cd "$mldir" && "$OCAMLOPT_BIN" -o "$oprog" "${mlargs[@]}" ) >"$WORK/$name.ocamlopt.log" 2>&1; then
    die "$name: ocamlopt failed for $ml"
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

  # golden 校验；成功的那次同时算作一次 warmup（WARMUP=0 时也仍然校验）。
  expect_out "$name (ocaml)" ocaml_ref "$oprog" "$golden"
  for t in $active; do
    [ -n "${SKIP["$name:$t"]:-}" ] && continue
    if ! out_ok "$t" "${PROGS[$t]}" "$golden"; then
      # wasm 在浏览器路径上可能超出 V8 的 wasm 栈（非尾深递归），记跳过而不是中断整轮。
      if [ "$t" = wasm ]; then SKIP["$name:$t"]=run; continue; fi
      expect_out "$name ($t)" "$t" "${PROGS[$t]}" "$golden"
    fi
  done

  local i
  for ((i = 1; i < WARMUP; i++)); do
    run_target ocaml_ref "$oprog" >/dev/null 2>&1 || true
    for t in $active; do
      [ -n "${SKIP["$name:$t"]:-}" ] && continue
      run_target "$t" "${PROGS[$t]}" >/dev/null 2>&1 || true
    done
  done

  # 计时样本：前 (RUNS - RSS_PASSES) 个是纯墙钟，后 RSS_PASSES 个同时采 RSS/GC。
  local -A VALS=()
  local plain_runs=$((RUNS - RSS_PASSES))
  local ms
  for ((i = 0; i < plain_runs; i++)); do
    ms=$(measure_runs ocaml_ref "$oprog" 1)
    VALS[ocaml_ref]+=" $ms"
    for t in $active; do
      [ -n "${SKIP["$name:$t"]:-}" ] && continue
      ms=$(measure_runs "$t" "${PROGS[$t]}" "$repeat")
      VALS[$t]+=" $ms"
    done
  done
  for ((i = 0; i < RSS_PASSES; i++)); do
    sample_target "$name" ocaml_ref "$oprog"
    for t in $active; do
      [ -n "${SKIP["$name:$t"]:-}" ] && continue
      sample_target "$name" "$t" "${PROGS[$t]}"
    done
  done
  MED["$name:ocaml_ref"]=$(median_of ${VALS[ocaml_ref]})
  for t in $TARGETS; do
    [ -n "${SKIP["$name:$t"]:-}" ] && continue
    MED["$name:$t"]=$(median_of ${VALS[$t]})
    if [ "$t" = wasm ]; then
      NET["$name:$t"]=$(awk -v m="${MED["$name:$t"]}" -v f="$NODE_STARTUP_MS" 'BEGIN { d = m - f; if (d < 0) d = 0; printf "%.0f", d }')
    fi
    gc_measure "$name" "$t"
  done
  # ocaml_ref 的 RSS 也来自采样；没有采样时保持 0。
  [ -n "${RSS["$name:ocaml_ref"]:-}" ] || RSS["$name:ocaml_ref"]=0

  # native 默认栈探针：只在计时之外记录，崩溃不中断基线。
  if [ -n "${PROGS[native]:-}" ]; then
    if default_stack_run "${PROGS[native]}" >/dev/null 2>&1; then
      DEFAULT_STACK["$name:native"]=true
    else
      DEFAULT_STACK["$name:native"]=false
    fi
  fi

  local base_rss=${RSS["$name:ocaml_ref"]:-0}
  for t in $TARGETS; do
    [ -n "${SKIP["$name:$t"]:-}" ] && continue
    RATIO["$name:$t"]=$(ratio_of "${MED["$name:$t"]}" "${MED["$name:ocaml_ref"]}")
    RSS_RATIO["$name:$t"]=$(ratio_of "${RSS["$name:$t"]:-0}" "$base_rss")
    if [ "$t" = wasm ]; then
      NET_RATIO["$name:$t"]=$(ratio_of "${NET["$name:$t"]}" "${MED["$name:ocaml_ref"]}")
    fi
  done
  ORDER+=("$name")

  note "  ocaml_ref ${MED["$name:ocaml_ref"]} ms  ${RSS["$name:ocaml_ref"]:-0} KB"
  for t in $TARGETS; do
    if [ -n "${SKIP["$name:$t"]:-}" ]; then
      note "  $t skipped (${SKIP["$name:$t"]})"
      continue
    fi
    if [ "$t" = wasm ]; then
      note "  $t ${MED["$name:$t"]} ms (net ${NET["$name:$t"]})  ${RSS["$name:$t"]:-0} KB  ratio ${RATIO["$name:$t"]}x net ${NET_RATIO["$name:$t"]}x  rss ${RSS_RATIO["$name:$t"]}x"
    else
      note "  $t ${MED["$name:$t"]} ms  ${RSS["$name:$t"]:-0} KB  ratio ${RATIO["$name:$t"]}x  rss ${RSS_RATIO["$name:$t"]}x"
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
  fi
}

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
  printf '%s"%s": { "run_ok": true, "median_ms": %s, "rss_kb": %s' \
    "$indent" "$target" "${MED["$name:$target"]}" "${RSS["$name:$target"]:-0}"
  local ops nsop
  ops=$(bench_meta "$name" ops 0)
  if [ "$ops" -gt 0 ] 2>/dev/null; then
    nsop=$(awk -v ms="${MED["$name:$target"]}" -v n="$ops" 'BEGIN { printf "%.3f", ms * 1000000 / n }')
    printf ', "ops": %s, "ns_per_op": %s' "$ops" "$nsop"
  fi
  if [ "$target" = wasm ] && [ -n "${NET["$name:$target"]:-}" ]; then
    printf ', "net_median_ms": %s' "${NET["$name:$target"]}"
  fi
  if [ -n "${ART_BYTES["$name:$target"]:-}" ]; then
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
  fi
  printf ' }'
}

emit_json() {
  local first=1 name t first_t
  printf '{\n'
  printf '  "schema": 3,\n'
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
  printf '    "node_startup_ms": %s,\n' "$(case $NODE_STARTUP_MS in ''|*[!0-9]*) printf 'null' ;; *) printf '%s' "$NODE_STARTUP_MS" ;; esac)"
  printf '    "rss_samples": %s,\n' "$RSS_PASSES"
  printf '    "rss_method": "gnu-time max_rss on sampled timed runs"\n'
  printf '  },\n'
  printf '  "benchmarks": {\n'
  for name in "${ORDER[@]}"; do
    [ "$first" = 1 ] || printf ',\n'
    first=0
    printf '    "%s": {\n' "$name"
    emit_backend "$name" ocaml_ref '      '
    printf ',\n'
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
      printf '"%s": { "vs_handwritten": %s, "rss_vs_handwritten": %s' \
        "$t" "${RATIO["$name:$t"]}" "${RSS_RATIO["$name:$t"]}"
      if [ "$t" = wasm ] && [ -n "${NET_RATIO["$name:$t"]:-}" ]; then
        printf ', "net_vs_handwritten": %s' "${NET_RATIO["$name:$t"]}"
      fi
      if [ "$t" != vuna_ocaml ] && [ -n "${MED["$name:vuna_ocaml"]:-}" ]; then
        printf ', "vs_ocaml_backend": %s, "rss_vs_ocaml_backend": %s' \
          "$(ratio_of "${MED["$name:$t"]}" "${MED["$name:vuna_ocaml"]}")" \
          "$(ratio_of "${RSS["$name:$t"]:-0}" "${RSS["$name:vuna_ocaml"]:-0}")"
      fi
      printf ' }'
    done
    printf ' }\n'
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
  printf '  %-16s %-11s %10s %8s %12s %10s %10s\n' benchmark backend ms ratio rss_kb rss_ratio ns/op
  local name t
  for name in "${ORDER[@]}"; do
    printf '  %-16s %-11s %10s %8s %12s %10s %10s\n' "$name" ocaml_ref \
      "${MED["$name:ocaml_ref"]}" "1.00x" "${RSS["$name:ocaml_ref"]:-0}" "1.00x" "$(ns_per_op "$name" ocaml_ref)"
    for t in $TARGETS; do
      if [ -n "${SKIP["$name:$t"]:-}" ]; then
        printf '  %-16s %-11s %10s %8s %12s %10s %10s\n' "$name" "$t" "-" "skipped" "-" "-" "-"
        continue
      fi
      printf '  %-16s %-11s %10s %8s %12s %10s %10s\n' "$name" "$t" \
        "${MED["$name:$t"]}" "${RATIO["$name:$t"]}x" "${RSS["$name:$t"]:-0}" "${RSS_RATIO["$name:$t"]}x" "$(ns_per_op "$name" "$t")"
    done
  done
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

# 从基线读一个值。
baseline_ratio() { # name target kind(wall|net|rss)
  local name=$1 target=$2 kind=$3 v
  case $kind in
    wall) jq -r --arg n "$name" --arg t "$target" '.benchmarks[$n].ratios[$t].vs_handwritten // empty' "$BASELINE" ;;
    net)
      v=$(jq -r --arg n "$name" --arg t "$target" '.benchmarks[$n].ratios[$t].net_vs_handwritten // empty' "$BASELINE")
      [ -n "$v" ] || v=$(jq -r --arg n "$name" --arg t "$target" '.benchmarks[$n].ratios[$t].vs_handwritten // empty' "$BASELINE")
      printf '%s' "$v"
      ;;
    rss) jq -r --arg n "$name" --arg t "$target" '.benchmarks[$n].ratios[$t].rss_vs_handwritten // empty' "$BASELINE" ;;
  esac
}

baseline_abs() { # name target
  jq -r --arg n "$1" --arg t "$2" '(.benchmarks[$n][$t].net_median_ms // .benchmarks[$n][$t].median_ms) // empty' "$BASELINE"
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
      # 墙钟：wasm 用 net（减 node 地板）。
      metric=wall
      cur=${RATIO["$name:$t"]}
      if [ "$t" = wasm ] && [ -n "${NET_RATIO["$name:$t"]:-}" ]; then
        cur=${NET_RATIO["$name:$t"]}
        metric=net
      fi
      basev=$(baseline_ratio "$name" "$t" "$([ "$metric" = net ] && printf net || printf wall)")
      if [ -z "$basev" ]; then
        printf '  %-16s %-11s %-8s %10s %10s %10s  %s\n' "$name" "$t" "$metric" "${cur}x" "-" "-" "new"
        news=$((news + 1))
      else
        read -r delta verdict <<<"$(judge_delta "$cur" "$basev" "$THRESHOLD" "$FAIL_THRESHOLD")"
        # 同机器有绝对值基线时，ratio 只作参考：手写 OCaml 分母常常在 1 ms 分辨率上，
        # ratio 的抖动会被误判成回归；回归判定交给下面的 abs 行。
        if [ "$same_machine" = 1 ] && [ -n "$(baseline_abs "$name" "$t")" ]; then
          verdict=info
        fi
        case $verdict in WARN) warns=$((warns + 1)) ;; FAIL) fails=$((fails + 1)) ;; new) news=$((news + 1)) ;; ok) ok=$((ok + 1)) ;; esac
        printf '  %-16s %-11s %-8s %10s %10s %10s  %s\n' "$name" "$t" "$metric" "${cur}x" "${basev}x" "${delta}%" "$verdict"
      fi
      # 同机器时再比绝对值（ratio 会归一化掉整体变慢）。
      if [ "$same_machine" = 1 ]; then
        local curabs=${MED["$name:$t"]}
        [ "$t" = wasm ] && [ -n "${NET["$name:$t"]:-}" ] && curabs=${NET["$name:$t"]}
        basev=$(baseline_abs "$name" "$t")
        if [ -n "$basev" ]; then
          read -r delta verdict <<<"$(judge_delta "$curabs" "$basev" "$THRESHOLD" "$FAIL_THRESHOLD")"
          case $verdict in WARN) warns=$((warns + 1)) ;; FAIL) fails=$((fails + 1)) ;; new) news=$((news + 1)) ;; *) ok=$((ok + 1)) ;; esac
          printf '  %-16s %-11s %-8s %10s %10s %10s  %s\n' "$name" "$t" abs "${curabs}ms" "${basev}ms" "${delta}%" "$verdict"
        fi
      fi
      # 峰值内存
      cur=${RSS_RATIO["$name:$t"]}
      basev=$(baseline_ratio "$name" "$t" rss)
      if [ -z "$basev" ]; then
        printf '  %-16s %-11s %-8s %10s %10s %10s  %s\n' "$name" "$t" rss "${cur}x" "-" "-" "new"
        news=$((news + 1))
      else
        read -r delta verdict <<<"$(judge_delta "$cur" "$basev" "$THRESHOLD" "$FAIL_THRESHOLD")"
        case $verdict in WARN) warns=$((warns + 1)) ;; FAIL) fails=$((fails + 1)) ;; new) news=$((news + 1)) ;; *) ok=$((ok + 1)) ;; esac
        printf '  %-16s %-11s %-8s %10s %10s %10s  %s\n' "$name" "$t" rss "${cur}x" "${basev}x" "${delta}%" "$verdict"
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