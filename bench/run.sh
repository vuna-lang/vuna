#!/usr/bin/env bash
# vuna-perf：生成程序 + 编译器运行基准（`nix run .#vuna-perf`）。
#
# 与 bench/bootstrap.sh 的分工：bootstrap.sh 测**构建/编译**的墙钟与产物尺寸；本脚本测
# **生成程序运行时**（vuna 产物 vs 手写 OCaml 等价实现）与编译器的运行期负载。
#
# 口径（写进 docs/reference/performance.md）：
#   * 每个 benchmark 一份 `bench/programs/<name>.vuna`（vuna）与 `<name>.ml`（手写
#     OCaml 等价实现，同算法；个别库基准用标准库上限，见各文件注释）；
#   * `--target` 选择被测后端：ocaml（默认）/ native / both；
#   * `.out` 是 golden：每个被测产物与手写实现都必须输出它；
#   * 每项先 warmup 再跑 --runs 次取**中位数**；峰值内存用 GNU time 的 max RSS，
#     计时结束后单独跑 --rss-passes 次取**最大值**（不参与计时）；
#   * native 不做尾调用优化：深递归基准在默认 8 MiB 栈上会崩溃，因此 native 进程统一在
#     `ulimit -s unlimited` 下运行，并在 JSON meta 的 `stack_policy` 里记录；
#   * 跨机器比较只看 `ratio = <backend>_median / ocaml_median` 与
#     `rss_ratio = <backend>_max_rss / ocaml_max_rss`（绝对 ms/KB 不可比）。
set -euo pipefail

RUNS=3
WARMUP=1
RSS_PASSES=3
THRESHOLD=20
JSON_OUT=""
BASELINE=""
CHECK=0
ONLY=""
TARGET=ocaml
VUNA_BIN=${VUNA:-vuna}
OCAMLOPT_BIN=${OCAMLOPT:-ocamlopt}
CC_BIN=${CC:-cc}
VUNA_BASE_OVERRIDE=${VUNA_BASE:-}

BENCHES="arith string_ops hashmap list_recursion gc_pressure array records closures sorting float_math text_scan nat_bits"

usage() {
  cat <<'EOF'
usage: vuna-perf [options]

在仓库根目录运行。默认测量全部基准并打印表格。

options:
  --runs N               计时重复次数（默认 3）
  --warmup N             计时前预热次数（默认 1）
  --rss-passes N         峰值内存采样次数，取最大值（默认 3）
  --target T             被测后端：ocaml / native / both（默认 ocaml）
  --only NAME            只跑一个基准（可重复）
  --compiler PATH        被测 vuna（默认 PATH 里的 vuna / $VUNA）
  --cc PATH              native 链接器（默认 PATH 里的 cc / $CC）
  --json FILE|-          写出 JSON 报告；`-` 表示只输出 JSON
  --baseline FILE        与基线 JSON 对比（默认 --check 时读 bench/baseline.json）
  --check                对 ratio 超过 --threshold 的项打印 WARN（软告警，退出 0）
  --threshold N          回退阈值，百分比（默认 20）
  -h, --help             显示帮助

环境：
  VUNA / OCAMLOPT / CC  工具路径；VUNA_BASE 覆盖 base 包位置（默认 <repo>/base）
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
    --rss-passes) [ $# -ge 2 ] || die "--rss-passes needs a value"; RSS_PASSES=$2; shift 2 ;;
    --rss-passes=*) RSS_PASSES=${1#*=}; shift ;;
    --target) [ $# -ge 2 ] || die "--target needs a value"; TARGET=$2; shift 2 ;;
    --target=*) TARGET=${1#*=}; shift ;;
    --only) [ $# -ge 2 ] || die "--only needs a value"; ONLY="$ONLY $2"; shift 2 ;;
    --only=*) ONLY="$ONLY ${1#*=}"; shift ;;
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
    -h|--help) usage; exit 0 ;;
    *) die "unknown argument: $1 (try --help)" ;;
  esac
done

case $RUNS in ''|*[!0-9]*|0) die "--runs must be a positive integer" ;; esac
case $WARMUP in *[!0-9]*) die "--warmup must be a non-negative integer" ;; esac
case $RSS_PASSES in ''|*[!0-9]*|0) die "--rss-passes must be a positive integer" ;; esac
case $THRESHOLD in ''|*[!0-9]*|0) die "--threshold must be a positive integer (percent)" ;; esac
case $TARGET in
  ocaml) TARGETS="vuna_ocaml" ;;
  native) TARGETS="native" ;;
  both) TARGETS="vuna_ocaml native" ;;
  *) die "--target must be ocaml, native or both" ;;
esac

REPO=$PWD
[ -d "$REPO/bench/programs" ] || die "run from the repo root (bench/programs not found)"
[ -d "$REPO/base" ] || die "run from the repo root (base/ not found)"
command -v "$VUNA_BIN" >/dev/null 2>&1 || die "vuna not found: $VUNA_BIN"
command -v "$OCAMLOPT_BIN" >/dev/null 2>&1 || die "ocamlopt not found: $OCAMLOPT_BIN"
case " $TARGETS " in
  *" native "*)
    command -v "$CC_BIN" >/dev/null 2>&1 || die "cc not found: $CC_BIN (native 链接需要)"
    bash -c 'ulimit -s unlimited' 2>/dev/null ||
      die "native 基准需要 ulimit -s unlimited（当前栈硬上限不足）；native 不做尾调用，默认 8 MiB 栈会让深递归基准崩溃"
    STACK_POLICY=unlimited
    ;;
  *) STACK_POLICY=n/a ;;
esac

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
LOADAVG=$(cut -d' ' -f1 /proc/loadavg 2>/dev/null || printf 'unknown')
OCAMLOPT_VERSION=$("$OCAMLOPT_BIN" -version 2>/dev/null || printf 'unknown')
VUNA_VERSION=$("$VUNA_BIN" --version 2>/dev/null || printf 'unknown')
GIT_HEAD=unknown
GIT_DIRTY=false
if command -v git >/dev/null 2>&1 && git rev-parse --git-dir >/dev/null 2>&1; then
  GIT_HEAD=$(git rev-parse HEAD 2>/dev/null || printf 'unknown')
  if [ -n "$(git status --porcelain 2>/dev/null || true)" ]; then GIT_DIRTY=true; fi
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

# 比率：$1/$2，两位小数；分母 <= 0 时给 0。
ratio_of() {
  awk -v a="$1" -v b="$2" 'BEGIN { if (b + 0 <= 0) print "0"; else printf "%.2f", a / b }'
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

# native 产物在 unlimited 栈下运行（脚本启动时已探测硬上限）。
run_target() { # target program
  case $1 in
    native) bash -c 'ulimit -s unlimited; exec "$1"' _ "$2" ;;
    *) "$2" ;;
  esac
}

rss_target() { # target program
  case $1 in
    native) rss_of bash -c 'ulimit -s unlimited; exec "$1"' _ "$2" ;;
    *) rss_of "$2" ;;
  esac
}

capture_target() { # target program
  case $1 in
    native) bash -c 'ulimit -s unlimited; exec "$1"' _ "$2" 2>&1 ;;
    *) "$2" 2>&1 ;;
  esac
}

selected() {
  case " $ONLY " in
    *" $1 "*) return 0 ;;
    *) [ -z "$ONLY" ] && return 0 || return 1 ;;
  esac
}

declare -A MED RSS GC_MINOR_WORDS GC_MAJOR_WORDS GC_MINOR_COLLECTIONS GC_MAJOR_COLLECTIONS GC_TOP_HEAP
declare -A RATIO RSS_RATIO
ORDER=()

# 编译一个被测后端到 <dir>/prog。
build_target() { # name target dir
  local name=$1 target=$2 dir=$3
  case $target in
    vuna_ocaml)
      "$VUNA_BIN" compile "$REPO/bench/programs/$name.vuna" "$dir" --target ocaml \
        >"$WORK/$name.$target.compile.log" 2>&1 || return 1
      ( cd "$dir" && sh build.sh prog ) >"$WORK/$name.$target.build.log" 2>&1 || return 1
      ;;
    native)
      "$VUNA_BIN" compile "$REPO/bench/programs/$name.vuna" "$dir" --target native \
        >"$WORK/$name.$target.compile.log" 2>&1 || return 1
      ( cd "$dir" && "$CC_BIN" -static -nostdlib -no-pie -Wl,--build-id=none -o prog main.s ) \
        >"$WORK/$name.$target.build.log" 2>&1 || return 1
      ;;
    *) die "unknown target: $target" ;;
  esac
}

# 校验产物输出与 golden 一致。
expect_out() { # label target program golden
  local label=$1 target=$2 program=$3 golden=$4 actual
  actual=$(capture_target "$target" "$program") || die "$label: program failed: $program"
  if [ "$actual" != "$golden" ]; then
    die "$label: output mismatch
  expected: $golden
  actual:   $actual"
  fi
}

max_rss() { # target program
  local best=0 v i
  for ((i = 0; i < RSS_PASSES; i++)); do
    v=$(rss_target "$1" "$2")
    [ "$v" -gt "$best" ] && best=$v
  done
  printf '%s' "$best"
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
  local mldir=$WORK/$name-ml
  mkdir -p "$mldir"
  local oprog=$mldir/prog
  local mlcopy=$mldir/$name.ml
  cp "$ml" "$mlcopy"
  if ! ( cd "$mldir" && "$OCAMLOPT_BIN" -o "$oprog" "$name.ml" ) >"$WORK/$name.ocamlopt.log" 2>&1; then
    die "$name: ocamlopt failed for $ml"
  fi

  local -A PROGS=()
  local t dir
  for t in $TARGETS; do
    dir=$WORK/$name-$t
    if ! build_target "$name" "$t" "$dir"; then
      die "$name ($t): build failed (see $WORK/$name.$t.*.log)"
    fi
    PROGS[$t]=$dir/prog
  done

  expect_out "$name (ocaml)" ocaml_ref "$oprog" "$golden"
  for t in $TARGETS; do
    expect_out "$name ($t)" "$t" "${PROGS[$t]}" "$golden"
  done

  local i
  for ((i = 0; i < WARMUP; i++)); do
    run_target ocaml_ref "$oprog" >/dev/null 2>&1
    for t in $TARGETS; do run_target "$t" "${PROGS[$t]}" >/dev/null 2>&1; done
  done

  local -A VALS=()
  local ms
  for ((i = 0; i < RUNS; i++)); do
    ms=$(time_once run_target ocaml_ref "$oprog")
    VALS[ocaml_ref]+=" $ms"
    for t in $TARGETS; do
      ms=$(time_once run_target "$t" "${PROGS[$t]}")
      VALS[$t]+=" $ms"
    done
  done
  MED["$name:ocaml_ref"]=$(median_of ${VALS[ocaml_ref]})
  for t in $TARGETS; do
    MED["$name:$t"]=$(median_of ${VALS[$t]})
  done

  # 峰值内存：计时之后单独采样，取最大值。
  RSS["$name:ocaml_ref"]=$(max_rss ocaml_ref "$oprog")
  for t in $TARGETS; do
    RSS["$name:$t"]=$(max_rss "$t" "${PROGS[$t]}")
  done

  # 分配 / GC 统计只来自 OCaml 后端的生成 runtime（VN_PERF_STATS=1 退出打印）。
  if [ -n "${PROGS[vuna_ocaml]:-}" ]; then
    local gc_line
    gc_line=$(VN_PERF_STATS=1 "${PROGS[vuna_ocaml]}" 2>&1 >/dev/null | grep '^VN_PERF ' | tail -n 1 || true)
    GC_MINOR_WORDS[$name]=$(printf '%s' "$gc_line" | sed -n 's/.*minor_words=\([0-9][0-9]*\).*/\1/p')
    GC_MAJOR_WORDS[$name]=$(printf '%s' "$gc_line" | sed -n 's/.*major_words=\([0-9][0-9]*\).*/\1/p')
    GC_MINOR_COLLECTIONS[$name]=$(printf '%s' "$gc_line" | sed -n 's/.*minor_collections=\([0-9][0-9]*\).*/\1/p')
    GC_MAJOR_COLLECTIONS[$name]=$(printf '%s' "$gc_line" | sed -n 's/.*major_collections=\([0-9][0-9]*\).*/\1/p')
    GC_TOP_HEAP[$name]=$(printf '%s' "$gc_line" | sed -n 's/.*top_heap_words=\([0-9][0-9]*\).*/\1/p')
  fi

  local base_rss=${RSS["$name:ocaml_ref"]}
  for t in $TARGETS; do
    RATIO["$name:$t"]=$(ratio_of "${MED["$name:$t"]}" "${MED["$name:ocaml_ref"]}")
    RSS_RATIO["$name:$t"]=$(ratio_of "${RSS["$name:$t"]}" "$base_rss")
  done
  ORDER+=("$name")

  note "  ocaml_ref ${MED["$name:ocaml_ref"]} ms  ${RSS["$name:ocaml_ref"]} KB"
  for t in $TARGETS; do
    note "  $t ${MED["$name:$t"]} ms  ${RSS["$name:$t"]} KB  ratio ${RATIO["$name:$t"]}x  rss ${RSS_RATIO["$name:$t"]}x"
  done
  if [ -n "${GC_MINOR_WORDS[$name]:-}" ]; then
    note "  gc    minor_words=${GC_MINOR_WORDS[$name]} major_words=${GC_MAJOR_WORDS[$name]} top_heap=${GC_TOP_HEAP[$name]}"
  fi
}

for name in $BENCHES; do
  selected "$name" && run_bench "$name"
done
[ ${#ORDER[@]} -gt 0 ] || die "no benchmark selected (--only $ONLY)"

# 写一个后端的测量块；$1=name $2=target，$3=缩进。
emit_backend() {
  local name=$1 target=$2 indent=$3
  printf '%s"%s": { "median_ms": %s, "rss_kb": %s' \
    "$indent" "$target" "${MED["$name:$target"]}" "${RSS["$name:$target"]}"
  if [ "$target" = vuna_ocaml ] && [ -n "${GC_MINOR_WORDS[$name]:-}" ]; then
    printf ', "gc": { "minor_words": %s, "major_words": %s, "minor_collections": %s, "major_collections": %s, "top_heap_words": %s }' \
      "${GC_MINOR_WORDS[$name]:-0}" "${GC_MAJOR_WORDS[$name]:-0}" \
      "${GC_MINOR_COLLECTIONS[$name]:-0}" "${GC_MAJOR_COLLECTIONS[$name]:-0}" "${GC_TOP_HEAP[$name]:-0}"
  fi
  printf ' }'
}

emit_json() {
  local first=1 name t first_t
  printf '{\n'
  printf '  "schema": 2,\n'
  printf '  "meta": {\n'
  printf '    "timestamp": "%s",\n' "$(json_escape "$TIMESTAMP")"
  printf '    "repo": "%s",\n' "$(json_escape "$REPO")"
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
  printf '    "stack_policy": "%s",\n' "$STACK_POLICY"
  printf '    "rss_passes": %s,\n' "$RSS_PASSES"
  printf '    "rss_method": "gnu-time max_rss (max of rss_passes)"\n'
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
      printf '"%s": { "vs_handwritten": %s, "rss_vs_handwritten": %s' \
        "$t" "${RATIO["$name:$t"]}" "${RSS_RATIO["$name:$t"]}"
      if [ "$t" = native ] && [ -n "${MED["$name:vuna_ocaml"]:-}" ]; then
        printf ', "vs_ocaml_backend": %s, "rss_vs_ocaml_backend": %s' \
          "$(ratio_of "${MED["$name:native"]}" "${MED["$name:vuna_ocaml"]}")" \
          "$(ratio_of "${RSS["$name:native"]}" "${RSS["$name:vuna_ocaml"]}")"
      fi
      printf ' }'
    done
    printf ' }\n'
    printf '    }'
  done
  printf '\n  }\n}\n'
}

print_table() {
  note ""
  printf '  %-16s %-11s %10s %8s %12s %10s\n' benchmark backend ms ratio rss_kb rss_ratio
  local name t
  for name in "${ORDER[@]}"; do
    printf '  %-16s %-11s %10s %8s %12s %10s\n' "$name" ocaml_ref \
      "${MED["$name:ocaml_ref"]}" "1.00x" "${RSS["$name:ocaml_ref"]}" "1.00x"
    for t in $TARGETS; do
      printf '  %-16s %-11s %10s %8s %12s %10s\n' "$name" "$t" \
        "${MED["$name:$t"]}" "${RATIO["$name:$t"]}x" "${RSS["$name:$t"]}" "${RSS_RATIO["$name:$t"]}x"
    done
  done
}

# 从基线读一个比值：优先 schema 2 的 ratios，其次旧 schema 的 ratio（仅 vuna_ocaml）。
baseline_ratio() { # name target kind(wall|rss)
  local name=$1 target=$2 kind=$3 v
  if [ "$kind" = wall ]; then
    v=$(jq -r --arg n "$name" --arg t "$target" '.benchmarks[$n].ratios[$t].vs_handwritten // empty' "$BASELINE")
    if [ -z "$v" ] && [ "$target" = vuna_ocaml ]; then
      v=$(jq -r --arg n "$name" '.benchmarks[$n].ratio // empty' "$BASELINE")
    fi
  else
    v=$(jq -r --arg n "$name" --arg t "$target" '.benchmarks[$n].ratios[$t].rss_vs_handwritten // empty' "$BASELINE")
    if [ -z "$v" ] && [ "$target" = vuna_ocaml ]; then
      local vr orr
      vr=$(jq -r --arg n "$name" '.benchmarks[$n].vuna.rss_kb // empty' "$BASELINE")
      orr=$(jq -r --arg n "$name" '.benchmarks[$n].ocaml.rss_kb // empty' "$BASELINE")
      if [ -n "$vr" ] && [ -n "$orr" ]; then v=$(ratio_of "$vr" "$orr"); fi
    fi
  fi
  printf '%s' "$v"
}

compare_baseline() {
  command -v jq >/dev/null 2>&1 || die "jq not found (use: nix run .#vuna-perf)"
  local base_compiler base_arch base_nproc base_target base_load
  base_compiler=$(jq -r '.meta.compiler // "unknown"' "$BASELINE")
  base_arch=$(jq -r '.meta.arch // "unknown"' "$BASELINE")
  base_nproc=$(jq -r '.meta.nproc // "unknown"' "$BASELINE")
  base_target=$(jq -r '.meta.target // "ocaml"' "$BASELINE")
  base_load=$(jq -r '.meta.loadavg // "unknown"' "$BASELINE")
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
  if [ "$base_target" != "$TARGET" ]; then
    note "基线目标不同（基线 $base_target，当前 $TARGET）：只作软告警"
  fi
  note "loadavg: 基线 $base_load / 当前 $LOADAVG（wall 与 RSS 读数都受宿主负载影响）"
  note "threshold: ${THRESHOLD}%（按 ratio / rss_ratio 比较；绝对值跨机器不可比）"
  printf '  %-16s %-11s %-7s %10s %10s %10s  %s\n' benchmark backend metric cur base delta result
  local warns=0 name t cur basev delta verdict
  for name in "${ORDER[@]}"; do
    for t in $TARGETS; do
      # 墙钟
      cur=${RATIO["$name:$t"]}
      basev=$(baseline_ratio "$name" "$t" wall)
      if [ -z "$basev" ]; then
        printf '  %-16s %-11s %-7s %10s %10s %10s  %s\n' "$name" "$t" wall "${cur}x" "-" "-" "new"
      else
        read -r delta verdict <<<"$(awk -v c="$cur" -v b="$basev" -v th="$THRESHOLD" 'BEGIN {
          if (b + 0 == 0) { print "n/a new"; exit }
          d = (c - b) / b * 100
          if (d > th) printf "%.1f WARN\n", d; else printf "%.1f ok\n", d
        }')"
        if [ "$verdict" = WARN ]; then warns=$((warns + 1)); fi
        printf '  %-16s %-11s %-7s %10s %10s %10s  %s\n' "$name" "$t" wall "${cur}x" "${basev}x" "${delta}%" "$verdict"
      fi
      # 峰值内存
      cur=${RSS_RATIO["$name:$t"]}
      basev=$(baseline_ratio "$name" "$t" rss)
      if [ -z "$basev" ]; then
        printf '  %-16s %-11s %-7s %10s %10s %10s  %s\n' "$name" "$t" rss "${cur}x" "-" "-" "new"
      else
        read -r delta verdict <<<"$(awk -v c="$cur" -v b="$basev" -v th="$THRESHOLD" 'BEGIN {
          if (b + 0 == 0) { print "n/a new"; exit }
          d = (c - b) / b * 100
          if (d > th) printf "%.1f WARN\n", d; else printf "%.1f ok\n", d
        }')"
        if [ "$verdict" = WARN ]; then warns=$((warns + 1)); fi
        printf '  %-16s %-11s %-7s %10s %10s %10s  %s\n' "$name" "$t" rss "${cur}x" "${basev}x" "${delta}%" "$verdict"
      fi
    done
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