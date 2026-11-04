#!/usr/bin/env bash
# vuna-perf：M33 的生成程序 + 编译器运行基准（`nix run .#vuna-perf`）。
#
# 与 nix/bench.sh 的分工：bench.sh 测**构建/编译**的墙钟与产物尺寸；本脚本测
# **生成程序运行时**（vuna 产物 vs 手写 OCaml 等价实现）与编译器的运行期负载。
#
# 口径（写进 docs/reference/performance.md）：
#   * 每个 benchmark 一份 `bench/programs/<name>.vuna`（vuna）与 `<name>.ml`（手写
#     OCaml 等价实现，同算法；个别库基准用标准库上限，见各文件注释）；
#   * `.out` 是 golden：vuna 产物必须输出它（同时校验手写实现输出一致）；
#   * 每项先 warmup 再跑 --runs 次取**中位数**；RSS 用 GNU time 的 max RSS（单次）；
#   * 跨机器比较只看 `ratio = vuna_median / ocaml_median`（绝对 ms 不可比）。
set -euo pipefail

RUNS=3
WARMUP=1
THRESHOLD=20
JSON_OUT=""
BASELINE=""
CHECK=0
ONLY=""
VUNA_BIN=${VUNA:-vuna}
OCAMLOPT_BIN=${OCAMLOPT:-ocamlopt}
VUNA_BASE_OVERRIDE=${VUNA_BASE:-}

BENCHES="arith string_ops hashmap list_recursion gc_pressure array"

usage() {
  cat <<'EOF'
usage: vuna-perf [options]

在仓库根目录运行。默认测量全部基准并打印表格。

options:
  --runs N               计时重复次数（默认 3）
  --warmup N             计时前预热次数（默认 1）
  --only NAME            只跑一个基准（可重复）
  --compiler PATH        被测 vuna（默认 PATH 里的 vuna / $VUNA）
  --json FILE|-          写出 JSON 报告；`-` 表示只输出 JSON
  --baseline FILE        与基线 JSON 对比（默认 --check 时读 bench/baseline.json）
  --check                对 ratio 超过 --threshold 的项打印 WARN（软告警，退出 0）
  --threshold N          回退阈值，百分比（默认 20）
  -h, --help             显示帮助

环境：
  VUNA / OCAMLOPT        工具路径；VUNA_BASE 覆盖 base 包位置（默认 <repo>/base）
  TMPDIR                 临时目录根
EOF
}

die() {
  printf 'vuna-perf: %s\n' "$*" >&2
  exit 2
}

note() { printf '%s\n' "$*"; }

while [ $# -gt 0 ]; do
  case $1 in
    --runs) [ $# -ge 2 ] || die "--runs needs a value"; RUNS=$2; shift 2 ;;
    --runs=*) RUNS=${1#*=}; shift ;;
    --warmup) [ $# -ge 2 ] || die "--warmup needs a value"; WARMUP=$2; shift 2 ;;
    --warmup=*) WARMUP=${1#*=}; shift ;;
    --only) [ $# -ge 2 ] || die "--only needs a value"; ONLY="$ONLY $2"; shift 2 ;;
    --only=*) ONLY="$ONLY ${1#*=}"; shift ;;
    --compiler) [ $# -ge 2 ] || die "--compiler needs a value"; VUNA_BIN=$2; shift 2 ;;
    --compiler=*) VUNA_BIN=${1#*=}; shift ;;
    --json|--save) [ $# -ge 2 ] || die "$1 needs a value"; JSON_OUT=$2; shift 2 ;;
    --json=*|--save=*) JSON_OUT=${1#*=}; shift ;;
    --baseline) [ $# -ge 2 ] || die "--baseline needs a value"; BASELINE=$2; shift 2 ;;
    --baseline=*) BASELINE=${1#*=}; shift ;;
    --check) CHECK=1; shift ;;
    --threshold) [ $# -ge 2 ] || die "--threshold needs a value"; THRESHOLD=$2; shift 2 ;;
    --threshold=*) THRESHOLD=${1#*=}; shift ;;
    -h|--help) usage; exit 0 ;;
    *) die "unknown argument: $1 (try --help)" ;;
  esac
done

case $RUNS in ''|*[!0-9]*|0) die "--runs must be a positive integer" ;; esac
case $WARMUP in *[!0-9]*) die "--warmup must be a non-negative integer" ;; esac
case $THRESHOLD in ''|*[!0-9]*|0) die "--threshold must be a positive integer (percent)" ;; esac

REPO=$PWD
[ -d "$REPO/bench/programs" ] || die "run from the repo root (bench/programs not found)"
[ -d "$REPO/base" ] || die "run from the repo root (base/ not found)"
command -v "$VUNA_BIN" >/dev/null 2>&1 || die "vuna not found: $VUNA_BIN"
command -v "$OCAMLOPT_BIN" >/dev/null 2>&1 || die "ocamlopt not found: $OCAMLOPT_BIN"

VUNA_BASE=${VUNA_BASE_OVERRIDE:-$REPO/base}
export VUNA_BASE

if [ "$CHECK" = 1 ] && [ -z "$BASELINE" ]; then BASELINE=$REPO/bench/baseline.json; fi
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
OCAMLOPT_VERSION=$("$OCAMLOPT_BIN" -version 2>/dev/null || printf 'unknown')
VUNA_VERSION=$("$VUNA_BIN" --version 2>/dev/null || printf 'unknown')
GIT_HEAD=unknown
GIT_DIRTY=false
if [ -r .git/HEAD ]; then
  HEAD_REF=$(cat .git/HEAD)
  case $HEAD_REF in
    ref:\ *) REF=${HEAD_REF#ref: }; [ -r ".git/$REF" ] && GIT_HEAD=$(cat ".git/$REF") ;;
    *) GIT_HEAD=$HEAD_REF ;;
  esac
fi
if command -v git >/dev/null 2>&1 && [ -n "$(git status --porcelain 2>/dev/null || true)" ]; then
  GIT_DIRTY=true
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

# 单次墙钟（ms，四舍五入到整数）。
time_once() {
  local t0 t1
  t0=$(now_ns)
  "$@" >/dev/null 2>&1
  t1=$(now_ns)
  printf '%s' $(((t1 - t0 + 500000) / 1000000))
}

# 中位数：参数是若干整数（每行一个）。
median_of() {
  printf '%s\n' "$@" | sort -n | awk '{ a[NR] = $1 } END { if (NR % 2) print a[(NR + 1) / 2]; else print int((a[NR / 2] + a[NR / 2 + 1]) / 2) }'
}

# GNU time 的 max RSS（KB）；不可用时返回 0。`type -P` 跳过 bash 的 time 关键字。
TIME_BIN=$(type -P time || true)
if [ -n "$TIME_BIN" ] && ! "$TIME_BIN" -f '%M' true >/dev/null 2>&1; then TIME_BIN=""; fi
rss_of() {
  [ -n "$TIME_BIN" ] || { printf '0'; return 0; }
  local f=$WORK/rss.txt
  "$TIME_BIN" -f '%M' -o "$f" "$@" >/dev/null 2>&1 || true
  local v
  v=$(head -n 1 "$f" 2>/dev/null | tr -dc '0-9')
  printf '%s' "${v:-0}"
}

selected() {
  case " $ONLY " in
    *" $1 "*) return 0 ;;
    *) [ -z "$ONLY" ] && return 0 || return 1 ;;
  esac
}

declare -A VUNA_MED VUNA_RSS OCAML_MED OCAML_RSS RATIO
declare -A GC_MINOR_WORDS GC_MAJOR_WORDS GC_MINOR_COLLECTIONS GC_MAJOR_COLLECTIONS GC_TOP_HEAP
ORDER=()

# 校验产物输出与 golden 一致（vuna 与手写 OCaml 两侧都校验）。
expect_out() { # name program golden
  local name=$1 program=$2 golden=$3 actual
  actual=$("$program" 2>&1) || die "$name: program failed: $program"
  if [ "$actual" != "$golden" ]; then
    die "$name: output mismatch
  expected: $golden
  actual:   $actual"
  fi
}

run_bench() { # name
  local name=$1
  local src=$REPO/bench/programs/$name.vuna
  local ml=$REPO/bench/programs/$name.ml
  local golden
  [ -f "$src" ] || die "missing benchmark: $src"
  [ -f "$ml" ] || die "missing OCaml reference: $ml"
  golden=$(cat "$REPO/bench/programs/$name.out")

  note "== $name =="
  local vdir=$WORK/$name-vuna
  local vprog=$vdir/prog
  local oprog=$WORK/$name-ocaml
  if ! "$VUNA_BIN" compile "$src" "$vdir" >"$WORK/$name.compile.log" 2>&1; then
    die "$name: vuna compile failed (see log)"
  fi
  if ! ( cd "$vdir" && sh build.sh prog ) >"$WORK/$name.build.log" 2>&1; then
    die "$name: build.sh failed (see $WORK/$name.build.log)"
  fi
  # ocamlopt 把 .cmi/.cmx/.o 放在源文件目录；复制进 $WORK 再编译，保持仓库干净。
  local mlcopy=$WORK/$name.ml
  cp "$ml" "$mlcopy"
  if ! ( cd "$WORK" && "$OCAMLOPT_BIN" -o "$oprog" "$mlcopy" ) >"$WORK/$name.ocamlopt.log" 2>&1; then
    die "$name: ocamlopt failed for $ml"
  fi

  expect_out "$name (vuna)" "$vprog" "$golden"
  expect_out "$name (ocaml)" "$oprog" "$golden"

  local i
  for ((i = 0; i < WARMUP; i++)); do "$vprog" >/dev/null 2>&1; "$oprog" >/dev/null 2>&1; done
  local vr=() or=()
  for ((i = 0; i < RUNS; i++)); do
    vr+=("$(time_once "$vprog")")
    or+=("$(time_once "$oprog")")
  done
  VUNA_MED[$name]=$(median_of "${vr[@]}")
  OCAML_MED[$name]=$(median_of "${or[@]}")
  VUNA_RSS[$name]=$(rss_of "$vprog")
  OCAML_RSS[$name]=$(rss_of "$oprog")
  RATIO[$name]=$(awk -v a="${VUNA_MED[$name]}" -v b="${OCAML_MED[$name]}" 'BEGIN { if (b <= 0) print "0"; else printf "%.2f", a / b }')
  # 分配 / GC 统计：生成 runtime 在 VN_PERF_STATS=1 时退出打印（M33 W2）。
  # 放在计时之后，不影响墙钟读数。
  local gc_line
  gc_line=$(VN_PERF_STATS=1 "$vprog" 2>&1 >/dev/null | grep '^VN_PERF ' | tail -n 1 || true)
  GC_MINOR_WORDS[$name]=$(printf '%s' "$gc_line" | sed -n 's/.*minor_words=\([0-9][0-9]*\).*/\1/p')
  GC_MAJOR_WORDS[$name]=$(printf '%s' "$gc_line" | sed -n 's/.*major_words=\([0-9][0-9]*\).*/\1/p')
  GC_MINOR_COLLECTIONS[$name]=$(printf '%s' "$gc_line" | sed -n 's/.*minor_collections=\([0-9][0-9]*\).*/\1/p')
  GC_MAJOR_COLLECTIONS[$name]=$(printf '%s' "$gc_line" | sed -n 's/.*major_collections=\([0-9][0-9]*\).*/\1/p')
  GC_TOP_HEAP[$name]=$(printf '%s' "$gc_line" | sed -n 's/.*top_heap_words=\([0-9][0-9]*\).*/\1/p')
  ORDER+=("$name")
  note "  vuna  ${VUNA_MED[$name]} ms  ${VUNA_RSS[$name]} KB"
  note "  ocaml ${OCAML_MED[$name]} ms  ${OCAML_RSS[$name]} KB  ratio ${RATIO[$name]}x"
  if [ -n "${GC_MINOR_WORDS[$name]:-}" ]; then
    note "  gc    minor_words=${GC_MINOR_WORDS[$name]} major_words=${GC_MAJOR_WORDS[$name]} top_heap=${GC_TOP_HEAP[$name]}"
  fi
}

for name in $BENCHES; do
  selected "$name" && run_bench "$name"
done
[ ${#ORDER[@]} -gt 0 ] || die "no benchmark selected (--only $ONLY)"

emit_json() {
  local first=1 name
  printf '{\n'
  printf '  "schema": 1,\n'
  printf '  "meta": {\n'
  printf '    "timestamp": "%s",\n' "$(json_escape "$TIMESTAMP")"
  printf '    "repo": "%s",\n' "$(json_escape "$REPO")"
  printf '    "git_head": "%s",\n' "$(json_escape "$GIT_HEAD")"
  printf '    "git_dirty": %s,\n' "$GIT_DIRTY"
  printf '    "compiler": "%s",\n' "$(json_escape "$VUNA_VERSION")"
  printf '    "ocamlopt": "%s",\n' "$(json_escape "$OCAMLOPT_VERSION")"
  printf '    "arch": "%s",\n' "$(json_escape "$ARCH")"
  printf '    "nproc": %s,\n' "$(case $NPROC in *[!0-9]*|'') printf 'null' ;; *) printf '%s' "$NPROC" ;; esac)"
  printf '    "runs": %s,\n' "$RUNS"
  printf '    "warmup": %s\n' "$WARMUP"
  printf '  },\n'
  printf '  "benchmarks": {\n'
  for name in "${ORDER[@]}"; do
    [ "$first" = 1 ] || printf ',\n'
    first=0
    printf '    "%s": { "vuna": { "median_ms": %s, "rss_kb": %s, "gc": { "minor_words": %s, "major_words": %s, "minor_collections": %s, "major_collections": %s, "top_heap_words": %s } }, "ocaml": { "median_ms": %s, "rss_kb": %s }, "ratio": %s }' \
      "$name" "${VUNA_MED[$name]}" "${VUNA_RSS[$name]}" \
      "${GC_MINOR_WORDS[$name]:-0}" "${GC_MAJOR_WORDS[$name]:-0}" \
      "${GC_MINOR_COLLECTIONS[$name]:-0}" "${GC_MAJOR_COLLECTIONS[$name]:-0}" "${GC_TOP_HEAP[$name]:-0}" \
      "${OCAML_MED[$name]}" "${OCAML_RSS[$name]}" "${RATIO[$name]}"
  done
  printf '\n  }\n}\n'
}

print_table() {
  note ""
  printf '  %-16s %10s %10s %8s %12s %12s\n' benchmark vuna_ms ocaml_ms ratio vuna_rss_kb ocaml_rss_kb
  local name
  for name in "${ORDER[@]}"; do
    printf '  %-16s %10s %10s %8s %12s %12s\n' "$name" "${VUNA_MED[$name]}" "${OCAML_MED[$name]}" "${RATIO[$name]}x" "${VUNA_RSS[$name]}" "${OCAML_RSS[$name]}"
  done
}

compare_baseline() {
  command -v jq >/dev/null 2>&1 || die "jq not found (use: nix run .#vuna-perf)"
  local base_compiler base_arch base_nproc
  base_compiler=$(jq -r '.meta.compiler // "unknown"' "$BASELINE")
  base_arch=$(jq -r '.meta.arch // "unknown"' "$BASELINE")
  base_nproc=$(jq -r '.meta.nproc // "unknown"' "$BASELINE")
  note ""
  note "== 对比基线 =="
  note "baseline: $BASELINE"
  if [ "$base_arch" != unknown ] && [ "$base_arch" != "$ARCH" ]; then
    note "跨机器基线（arch=$base_arch，当前 $ARCH）：只作软告警"
  fi
  if [ "$base_nproc" != unknown ] && [ "$base_nproc" != "$NPROC" ]; then
    note "跨机器基线（nproc=$base_nproc，当前 $NPROC）：只作软告警"
  fi
  if [ "$base_compiler" != unknown ] && [ "$base_compiler" != "$VUNA_VERSION" ]; then
    note "编译器版本不同（基线 $base_compiler，当前 $VUNA_VERSION）：只作软告警"
  fi
  note "threshold: ${THRESHOLD}%（按 ratio 比较；绝对值跨机器不可比）"
  printf '  %-16s %10s %10s %10s  %s\n' benchmark cur_ratio base_ratio delta result
  local warns=0 name cur basev delta verdict
  for name in "${ORDER[@]}"; do
    cur=${RATIO[$name]}
    basev=$(jq -r --arg n "$name" '.benchmarks[$n].ratio // empty' "$BASELINE")
    if [ -z "$basev" ]; then
      printf '  %-16s %10s %10s %10s  %s\n' "$name" "${cur}x" "-" "-" "new"
      continue
    fi
    read -r delta verdict <<<"$(awk -v c="$cur" -v b="$basev" -v th="$THRESHOLD" 'BEGIN {
      if (b + 0 == 0) { print "n/a new"; exit }
      d = (c - b) / b * 100
      if (d > th) printf "%.1f WARN\n", d; else printf "%.1f ok\n", d
    }')"
    if [ "$verdict" = WARN ]; then warns=$((warns + 1)); fi
    printf '  %-16s %10s %10s %10s  %s\n' "$name" "${cur}x" "${basev}x" "${delta}%" "$verdict"
  done
  note ""
  if [ "$warns" -gt 0 ]; then note "PERF-CHECK-WARN（$warns 项超过 ${THRESHOLD}%）"; else note "PERF-CHECK-OK"; fi
}

if [ "$JSON_OUT" = "-" ]; then
  emit_json
else
  print_table
  if [ -n "$JSON_OUT" ]; then
    emit_json >"$JSON_OUT"
    note "json: $JSON_OUT"
  fi
  if [ -n "$BASELINE" ]; then compare_baseline; fi
  exit 0
fi