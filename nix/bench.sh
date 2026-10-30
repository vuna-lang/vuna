#!/usr/bin/env bash
# vuna-bench: 手动性能基准（构建 / 编译 / 产物尺寸）。
# 由 flake app `nix run .#bench` 提供；不是 CI check，不写入仓库。
set -euo pipefail

RUNS=3
WARMUP=1
COMPILER=vuna
JSON_OUT=""
BASELINE=""
WITH_TESTS=0
WITH_DYNAMIC=1
KEEP=0
STATUS=ok

usage() {
  cat <<'EOF'
usage: vuna-bench [options]

手动测量 vuna 的构建/编译性能与生成产物尺寸。默认测量 vuna（stage 1）；
加 --compiler boot 测量 vuna-boot（stage 0 种子）。请在仓库根目录运行。

options:
  --compiler vuna|boot   被测编译器（默认 vuna）
  --runs N               计时重复次数（默认 3）
  --quick                等价于 --runs 1、无 warmup
  --json FILE|-          写出 JSON 报告；`-` 表示只输出 JSON
  --save FILE            与 --json 相同
  --baseline FILE        与之前的 JSON 报告对比，输出 delta
  --with-tests           额外运行 test/run-tests.sh（较慢）
  --no-dynamic           跳过 --no-typecheck 动态路径测量
  --keep                 保留临时构建目录
  -h, --help             显示本帮助

环境：
  TMPDIR                 临时目录根（默认 /tmp；不可写时请指向可写目录）
EOF
}

die() {
  printf 'vuna-bench: %s\n' "$*" >&2
  exit 2
}

note() {
  printf '%s\n' "$*"
}

while [ $# -gt 0 ]; do
  case $1 in
    --compiler)
      [ $# -ge 2 ] || die "--compiler needs a value"
      COMPILER=$2
      shift 2
      ;;
    --compiler=*)
      COMPILER=${1#*=}
      shift
      ;;
    --runs)
      [ $# -ge 2 ] || die "--runs needs a value"
      RUNS=$2
      shift 2
      ;;
    --runs=*)
      RUNS=${1#*=}
      shift
      ;;
    --quick)
      RUNS=1
      WARMUP=0
      shift
      ;;
    --json|--save)
      [ $# -ge 2 ] || die "$1 needs a value"
      JSON_OUT=$2
      shift 2
      ;;
    --json=*|--save=*)
      JSON_OUT=${1#*=}
      shift
      ;;
    --baseline)
      [ $# -ge 2 ] || die "--baseline needs a value"
      BASELINE=$2
      shift 2
      ;;
    --baseline=*)
      BASELINE=${1#*=}
      shift
      ;;
    --with-tests)
      WITH_TESTS=1
      shift
      ;;
    --no-dynamic)
      WITH_DYNAMIC=0
      shift
      ;;
    --keep)
      KEEP=1
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      die "unknown argument: $1 (try --help)"
      ;;
  esac
done

case $RUNS in
  ''|*[!0-9]*|0) die "--runs must be a positive integer" ;;
esac
case $COMPILER in
  vuna|stage1) COMPILER=vuna ;;
  boot|vuna-boot|stage0) COMPILER=boot ;;
  *) die "--compiler must be vuna or boot" ;;
esac

REPO=$PWD
[ -f "$REPO/bootstrap/seed.ml" ] || die "run from the repo root (bootstrap/seed.ml not found)"
[ -f "$REPO/app/Main.vuna" ] || die "run from the repo root (app/Main.vuna not found)"
[ -d "$REPO/lib/Vuna" ] || die "run from the repo root (lib/Vuna not found)"
command -v ocamlopt >/dev/null 2>&1 || die "ocamlopt not found (use: nix run .#bench)"

abspath() {
  case $1 in
    /*) printf '%s\n' "$1" ;;
    -) printf '%s\n' "$1" ;;
    *) printf '%s\n' "$REPO/$1" ;;
  esac
}

if [ -n "$JSON_OUT" ]; then JSON_OUT=$(abspath "$JSON_OUT"); fi
if [ -n "$BASELINE" ]; then BASELINE=$(abspath "$BASELINE"); fi

TMPROOT=${TMPDIR:-/tmp}
mkdir -p "$TMPROOT" 2>/dev/null || true
WORK=$(mktemp -d "$TMPROOT/vuna-bench.XXXXXX" 2>/dev/null) || die "cannot create temp dir under $TMPROOT (set TMPDIR to a writable directory)"
cleanup() {
  if [ "$KEEP" = 1 ]; then
    printf 'vuna-bench: kept %s\n' "$WORK" >&2
  else
    rm -rf "$WORK"
  fi
}
trap cleanup EXIT
export TMPDIR=$WORK

# ---- meta（在复制前从真实仓库采集） -------------------------------------
TIMESTAMP=$(date -u +%Y-%m-%dT%H:%M:%SZ)
ARCH=$(uname -m)
NPROC=$(getconf _NPROCESSORS_ONLN 2>/dev/null || printf 'unknown')
OCAMLOPT_VERSION=$(ocamlopt -version 2>/dev/null || printf 'unknown')
FLAMBDA=$(ocamlopt -config 2>/dev/null | awk -F': *' '$1 == "flambda" { print $2 }' || true)
[ -n "$FLAMBDA" ] || FLAMBDA=unknown
SEED_SHA=$(sha256sum bootstrap/seed.ml | awk '{ print $1 }')
SRC_LINES=$(cat lib/Vuna/*.vuna app/*.vuna | wc -l | tr -d ' ')
SRC_BYTES=$(cat lib/Vuna/*.vuna app/*.vuna | wc -c | tr -d ' ')

GIT_HEAD=unknown
GIT_DIRTY=unknown
if [ -r .git/HEAD ]; then
  HEAD_REF=$(cat .git/HEAD)
  case $HEAD_REF in
    ref:\ *)
      REF=${HEAD_REF#ref: }
      [ -r ".git/$REF" ] && GIT_HEAD=$(cat ".git/$REF")
      ;;
    *)
      GIT_HEAD=$HEAD_REF
      ;;
  esac
fi
if command -v git >/dev/null 2>&1; then
  if [ -n "$(git status --porcelain 2>/dev/null || true)" ]; then
    GIT_DIRTY=true
  else
    GIT_DIRTY=false
  fi
fi

# ---- 工作副本 ------------------------------------------------------------
mkdir -p "$WORK/src"
cp -r lib app bootstrap "$WORK/src/"
if [ "$WITH_TESTS" = 1 ]; then
  cp -r test "$WORK/src/"
else
  mkdir -p "$WORK/src/test/corpus"
  cp -r test/corpus/run "$WORK/src/test/corpus/"
fi
cd "$WORK/src"

log() {
  printf '%s\n' "$*" >>"$WORK/cmd.log"
}

run_once() {
  local t0 t1
  t0=$(date +%s%N)
  if ! "$@" >>"$WORK/cmd.log" 2>&1; then
    return 1
  fi
  t1=$(date +%s%N)
  printf '%s\n' $(( (t1 - t0) / 1000000 ))
}

fail_cmd() {
  printf 'vuna-bench: command failed: %s\n' "$*" >&2
  tail -n 30 "$WORK/cmd.log" >&2
  exit 1
}

declare -A MEDIAN
declare -A MINV
declare -A MAXV
declare -A RUNLIST
TIMING_KEYS=()
TIMING_LABELS=()

measure() {
  local label=$1
  shift
  local i ms vals sorted min max median
  for ((i = 0; i < WARMUP; i++)); do
    if ! run_once "$@" >/dev/null; then
      fail_cmd "$@"
    fi
  done
  vals=""
  for ((i = 1; i <= RUNS; i++)); do
    if ! ms=$(run_once "$@"); then
      fail_cmd "$@"
    fi
    vals="$vals $ms"
  done
  # shellcheck disable=SC2086
  sorted=$(printf '%s\n' $vals | sort -n)
  min=$(printf '%s\n' "$sorted" | head -n 1)
  max=$(printf '%s\n' "$sorted" | tail -n 1)
  median=$(printf '%s\n' "$sorted" | awk '{ a[NR] = $1 } END { if (NR % 2) print a[(NR + 1) / 2]; else print int((a[NR / 2] + a[NR / 2 + 1]) / 2) }')
  RUNLIST[$label]=$vals
  MINV[$label]=$min
  MAXV[$label]=$max
  MEDIAN[$label]=$median
  TIMING_KEYS+=("$label")
  TIMING_LABELS+=("$label")
}

# ---- 构建 ----------------------------------------------------------------
SEED_BIN=$WORK/vuna-boot
STAGE1=$WORK/stage1.ml
VUNA_BIN=$WORK/vuna
STAGE2=$WORK/stage2.ml

measure seed_build ocamlopt -g -w -a+39 -warn-error +39 -o "$SEED_BIN" bootstrap/seed.ml
measure seed_compile "$SEED_BIN" --root lib --root stdlib/lib --root app --no-print app/Main.vuna "$STAGE1"
measure stage1_build ocamlopt -g -w -a+39 -warn-error +39 -o "$VUNA_BIN" "$STAGE1"

if [ "$COMPILER" = vuna ]; then
  SELF_BIN=$VUNA_BIN
  SELF_OUT=$STAGE2
else
  SELF_BIN=$SEED_BIN
  SELF_OUT=$STAGE1
fi

measure compiler_self_compile "$SELF_BIN" --root lib --root stdlib/lib --root app --no-print app/Main.vuna "$SELF_OUT"

printf 'main = 40 + 2\n' >tiny.vuna
measure tiny_compile "$SELF_BIN" --root lib --root stdlib/lib --root app --no-print tiny.vuna "$WORK/tiny.ml"

if [ "$WITH_DYNAMIC" = 1 ]; then
  measure dynamic_self_compile "$SELF_BIN" --no-typecheck --root lib --root stdlib/lib --root app --no-print app/Main.vuna "$WORK/dyn.ml"
fi

# ---- corpus 批量编译（单次计时，内部循环） --------------------------------
cat >"$WORK/corpus.sh" <<'EOS'
#!/usr/bin/env bash
set -u
rm -rf "$CORPUS_OUT"
mkdir -p "$CORPUS_OUT"
: >"$CORPUS_FAIL"
for f in test/corpus/run/*.vuna; do
  out="$CORPUS_OUT/$(basename "$f" .vuna).ml"
  if ! "$CORPUS_BIN" --root lib --root stdlib/lib --root app --no-print "$f" "$out" >>"$CORPUS_LOG" 2>&1; then
    printf '%s\n' "$f" >>"$CORPUS_FAIL"
  fi
done
exit 0
EOS
chmod +x "$WORK/corpus.sh"
export CORPUS_BIN=$SELF_BIN
export CORPUS_OUT=$WORK/corpus
export CORPUS_LOG=$WORK/corpus.log
export CORPUS_FAIL=$WORK/corpus.fail
: >"$WORK/corpus.log"
: >"$WORK/corpus.fail"
measure corpus_compile bash "$WORK/corpus.sh"

CORPUS_TOTAL=$(printf '%s\n' test/corpus/run/*.vuna | wc -l | tr -d ' ')
CORPUS_FAILS=$(wc -l <"$WORK/corpus.fail" | tr -d ' ')
CORPUS_OK=$((CORPUS_TOTAL - CORPUS_FAILS))

# ---- 产物指标 ------------------------------------------------------------
declare -A SIZE
declare -A COUNT

collect_stats() {
  local key=$1
  local f=$2
  [ -f "$f" ] || return 0
  SIZE["${key}_bytes"]=$(wc -c <"$f" | tr -d ' ')
  SIZE["${key}_lines"]=$(wc -l <"$f" | tr -d ' ')
  SIZE["${key}_max_line"]=$(awk '{ n = length($0); if (n > m) m = n } END { print m + 0 }' "$f")
  SIZE["${key}_over120"]=$(awk 'length($0) > 120 { n++ } END { print n + 0 }' "$f")
  SIZE["${key}_over500"]=$(awk 'length($0) > 500 { n++ } END { print n + 0 }' "$f")
  SIZE["${key}_trailing_ws"]=$(grep -cE '[[:blank:]]+$' "$f" || true)
  SIZE["${key}_blank_ws"]=$(grep -cE '^[[:blank:]]+$' "$f" || true)
  COUNT["${key}_let_rec"]=$(grep -c '^let rec ' "$f" || true)
  COUNT["${key}_let"]=$(grep -c '^let ' "$f" || true)
  COUNT["${key}_and"]=$(grep -c '^and ' "$f" || true)
  COUNT["${key}_type"]=$(grep -c '^type ' "$f" || true)
  COUNT["${key}_string_concat"]=$(grep -oF 'String.concat ""' "$f" | wc -l | tr -d ' ' || true)
  COUNT["${key}_bi_eq_int"]=$(grep -oF 'bi_eq_int' "$f" | wc -l | tr -d ' ' || true)
  COUNT["${key}_bi_eq_str"]=$(grep -oF 'bi_eq_str' "$f" | wc -l | tr -d ' ' || true)
  COUNT["${key}_bi_eq_bool"]=$(grep -oF 'bi_eq_bool' "$f" | wc -l | tr -d ' ' || true)
  COUNT["${key}_rec_zero_arg"]=$(grep -cE '^let rec [A-Za-z0-9_]+ = fun \(\) ->' "$f" || true)
}

collect_stats seed bootstrap/seed.ml
collect_stats stage1 "$STAGE1"
collect_stats self "$SELF_OUT"
collect_stats tiny "$WORK/tiny.ml"
if [ "$WITH_DYNAMIC" = 1 ]; then collect_stats dyn "$WORK/dyn.ml"; fi

# ---- 状态 ----------------------------------------------------------------
FIXED_POINT=skipped
if [ "$COMPILER" = vuna ]; then
  if cmp -s "$STAGE1" "$STAGE2"; then
    FIXED_POINT=true
  else
    FIXED_POINT=false
    STATUS=fail
  fi
fi
SEED_MATCHES=false
if cmp -s bootstrap/seed.ml "$STAGE1"; then SEED_MATCHES=true; fi

TESTS=skipped
TESTS_SUMMARY=""
if [ "$WITH_TESTS" = 1 ]; then
  if ( cd test && VUNA=$VUNA_BIN VUNA_BOOT=$SEED_BIN OCAMLOPT=ocamlopt sh run-tests.sh ) >"$WORK/tests.log" 2>&1; then
    TESTS=ok
  else
    TESTS=fail
    STATUS=fail
  fi
  TESTS_SUMMARY=$(tail -n 2 "$WORK/tests.log" | tr '\n' ' ')
fi

SELF_MS=${MEDIAN[compiler_self_compile]:-0}
if [ "$SELF_MS" != 0 ]; then
  SELF_LINES_PER_SEC=$(awk -v l="$SRC_LINES" -v t="$SELF_MS" 'BEGIN { printf "%.0f", l * 1000 / t }')
  SELF_KB_PER_SEC=$(awk -v b="$SRC_BYTES" -v t="$SELF_MS" 'BEGIN { printf "%.1f", b / 1024 * 1000 / t }')
else
  SELF_LINES_PER_SEC=unknown
  SELF_KB_PER_SEC=unknown
fi

# ---- 报告 ----------------------------------------------------------------
metric_line() {
  local label=$1
  [ -n "${MEDIAN[$label]:-}" ] || return 0
  printf '  %-26s median %8s ms  (min %s, max %s; runs:%s)\n' "$label" "${MEDIAN[$label]}" "${MINV[$label]}" "${MAXV[$label]}" "${RUNLIST[$label]}"
}

print_table() {
  note "vuna bench — compiler under test: $COMPILER ($SELF_BIN)"
  note "repo: $REPO"
  note "git: ${GIT_HEAD} (dirty: ${GIT_DIRTY})  arch: $ARCH  nproc: $NPROC"
  note "ocamlopt: $OCAMLOPT_VERSION  flambda: $FLAMBDA  runs: $RUNS  warmup: $WARMUP"
  note ""
  note "== 构建性能 =="
  metric_line seed_build
  metric_line stage1_build
  note ""
  note "== 编译性能（$COMPILER）=="
  metric_line seed_compile
  metric_line compiler_self_compile
  metric_line tiny_compile
  metric_line corpus_compile
  if [ "$WITH_DYNAMIC" = 1 ]; then metric_line dynamic_self_compile; fi
  note "  throughput: ${SELF_LINES_PER_SEC} lines/s, ${SELF_KB_PER_SEC} KB/s (self-compile source: $SRC_LINES lines / $SRC_BYTES B)"
  note "  corpus: ${CORPUS_OK}/${CORPUS_TOTAL} compiled"
  note ""
  note "== 产物尺寸 =="
  printf '  %-10s %10s %8s %9s %8s %8s %10s %9s\n' artifact bytes lines max_line '>120' '>500' 'trail_ws' 'blank_ws'
  for key in seed stage1 self tiny dyn; do
    [ -n "${SIZE[${key}_bytes]:-}" ] || continue
    printf '  %-10s %10s %8s %9s %8s %8s %10s %9s\n' \
      "$key" "${SIZE[${key}_bytes]}" "${SIZE[${key}_lines]}" "${SIZE[${key}_max_line]}" \
      "${SIZE[${key}_over120]}" "${SIZE[${key}_over500]}" "${SIZE[${key}_trailing_ws]}" "${SIZE[${key}_blank_ws]}"
  done
  note ""
  note "== codegen 指标（seed / stage1 / self） =="
  for key in seed stage1 self; do
    [ -n "${COUNT[${key}_let_rec]:-}" ] || continue
    printf '  %-8s let_rec %4s  let %4s  and %4s  type %4s  String.concat %4s  bi_eq_int %4s  bi_eq_str %4s  bi_eq_bool %4s  rec0arg %2s\n' \
      "$key" "${COUNT[${key}_let_rec]}" "${COUNT[${key}_let]}" "${COUNT[${key}_and]}" "${COUNT[${key}_type]}" \
      "${COUNT[${key}_string_concat]}" "${COUNT[${key}_bi_eq_int]}" "${COUNT[${key}_bi_eq_str]}" "${COUNT[${key}_bi_eq_bool]}" \
      "${COUNT[${key}_rec_zero_arg]}"
  done
  note ""
  note "== 状态 =="
  note "  fixed_point: $FIXED_POINT"
  note "  seed_matches_stage1: $SEED_MATCHES"
  note "  corpus_failures: $CORPUS_FAILS"
  note "  tests: $TESTS ${TESTS_SUMMARY}"
  note ""
  if [ "$STATUS" = ok ]; then
    note "BENCH-OK"
  else
    note "BENCH-FAIL"
  fi
}

json_escape() {
  printf '%s' "$1" | sed -e 's/\\/\\\\/g' -e 's/"/\\"/g'
}

json_bool() {
  case $1 in
    true) printf 'true' ;;
    false) printf 'false' ;;
    *) printf 'null' ;;
  esac
}

json_runs() {
  local key=$1
  local first=1 x
  printf '['
  # shellcheck disable=SC2086
  for x in ${RUNLIST[$key]}; do
    [ "$first" = 1 ] || printf ','
    printf '%s' "$x"
    first=0
  done
  printf ']'
}

emit_json() {
  local timings flat sizes counts first key sep
  timings=""
  first=1
  for key in "${TIMING_KEYS[@]}"; do
    [ -n "${MEDIAN[$key]:-}" ] || continue
    sep=""
    [ "$first" = 1 ] || sep=","
    timings+="${sep}
    \"$(json_escape "$key")\": { \"runs\": $(json_runs "$key"), \"min\": ${MINV[$key]}, \"median\": ${MEDIAN[$key]}, \"max\": ${MAXV[$key]} }"
    first=0
  done

  sizes=""
  first=1
  for key in $(printf '%s\n' "${!SIZE[@]}" | sort); do
    case $key in
      *_bytes|*_lines|*_max_line|*_over500|*_trailing_ws) ;;
      *) continue ;;
    esac
    sep=""
    [ "$first" = 1 ] || sep=","
    sizes+="${sep}
    \"$(json_escape "$key")\": ${SIZE[$key]}"
    first=0
  done

  counts=""
  first=1
  for key in $(printf '%s\n' "${!COUNT[@]}" | sort); do
    sep=""
    [ "$first" = 1 ] || sep=","
    counts+="${sep}
    \"$(json_escape "$key")\": ${COUNT[$key]}"
    first=0
  done

  flat=""
  first=1
  for key in $(printf '%s\n' "${!MEDIAN[@]}" | sort); do
    sep=""
    [ "$first" = 1 ] || sep=","
    flat+="${sep}
    \"timings_ms.$(json_escape "$key").median\": ${MEDIAN[$key]}"
    first=0
  done
  for key in $(printf '%s\n' "${!SIZE[@]}" | sort); do
    case $key in
      *_bytes|*_lines|*_max_line|*_over500|*_trailing_ws) ;;
      *) continue ;;
    esac
    sep=""
    [ "$first" = 1 ] || sep=","
    flat+="${sep}
    \"sizes.$(json_escape "$key")\": ${SIZE[$key]}"
    first=0
  done

  cat <<EOF
{
  "schema": 1,
  "meta": {
    "timestamp": "$(json_escape "$TIMESTAMP")",
    "repo": "$(json_escape "$REPO")",
    "git_head": "$(json_escape "$GIT_HEAD")",
    "git_dirty": $(json_bool "$GIT_DIRTY"),
    "compiler": "$(json_escape "$COMPILER")",
    "ocamlopt": "$(json_escape "$OCAMLOPT_VERSION")",
    "flambda": "$(json_escape "$FLAMBDA")",
    "arch": "$(json_escape "$ARCH")",
    "nproc": $(case $NPROC in *[!0-9]*|'') printf 'null' ;; *) printf '%s' "$NPROC" ;; esac),
    "seed_sha256": "$(json_escape "$SEED_SHA")",
    "runs": $RUNS,
    "warmup": $WARMUP
  },
  "timings_ms": {$timings
  },
  "sizes": {$sizes
  },
  "counts": {$counts
  },
  "flat": {$flat
  },
  "status": {
    "fixed_point": $(json_bool "$FIXED_POINT"),
    "seed_matches_stage1": $(json_bool "$SEED_MATCHES"),
    "corpus_ok": $CORPUS_OK,
    "corpus_total": $CORPUS_TOTAL,
    "tests": "$(json_escape "$TESTS")"
  }
}
EOF
}

compare_baseline() {
  [ -f "$BASELINE" ] || die "baseline not found: $BASELINE"
  note ""
  note "== 对比基线 =="
  note "baseline: $BASELINE"
  local base_compiler
  base_compiler=$(sed -n 's/^[[:space:]]*"compiler":[[:space:]]*"\([^"]*\)".*/\1/p' "$BASELINE" | head -n 1)
  if [ -n "$base_compiler" ] && [ "$base_compiler" != "$COMPILER" ]; then
    note "注意: 基线 compiler=$base_compiler，当前 compiler=$COMPILER"
  fi
  local flatfile=$WORK/flat.current
  : >"$flatfile"
  local key
  for key in $(printf '%s\n' "${!MEDIAN[@]}" | sort); do
    printf 'timings_ms.%s.median %s\n' "$key" "${MEDIAN[$key]}" >>"$flatfile"
  done
  for key in $(printf '%s\n' "${!SIZE[@]}" | sort); do
    printf 'sizes.%s %s\n' "$key" "${SIZE[$key]}" >>"$flatfile"
  done
  printf '  %-42s %12s %12s %12s\n' metric current baseline delta
  local cur current
  while IFS=' ' read -r key cur; do
    [ -n "$key" ] || continue
    current=$(awk -v k="$key" '$1 == k { print $2; exit }' "$flatfile")
    [ -n "$current" ] || continue
    awk -v k="$key" -v c="$current" -v b="$cur" 'BEGIN {
      if (c == 0 && b == 0) exit
      if (b == 0) { printf "  %-42s %12s %12s %12s\n", k, c, b, "n/a"; exit }
      d = (c - b) / b * 100
      mark = (d < -0.5) ? "down" : ((d > 0.5) ? "up" : "flat")
      printf "  %-42s %12s %12s %9.1f%% %s\n", k, c, b, d, mark
    }'
  done < <(sed -n 's/^[[:space:]]*"\([^"]*\)":[[:space:]]*\([-0-9.][0-9.]*\)[[:space:]]*,\{0,1\}$/\1 \2/p' "$BASELINE")
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
  [ "$STATUS" = ok ] || exit 1
fi