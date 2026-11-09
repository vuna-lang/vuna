#!/usr/bin/env bash
# vuna-bench: 手动性能基准（构建 / 编译 / 产物尺寸）。
# 由 `nix run .#vuna-bench` 提供；默认不是 CI check，运行结果只在 --json/--save
# 指定时写文件；入库的产物只有基线 nix/bench-baseline.json（--check 的软对比对象）。
#
# 基线：`nix run .#vuna-bench -- --quick --json nix/bench-baseline.json` 生成
# 提交入库的基线；之后用 `--check`（读基线、超阈值 WARN、退出 0）做软对比。
# 基线按机器记录 meta（arch/nproc/compiler/runs/warmup），跨机器或口径不同时
# 只软告警、不阻断；--strict 也只把「同机器 + 同 compiler」的超阈值当失败。
set -euo pipefail

RUNS=3
WARMUP=1
COMPILER=vuna
JSON_OUT=""
BASELINE=""
CHECK=0
STRICT=0
THRESHOLD=20
WITH_TESTS=0
KEEP=0
STATUS=ok

usage() {
  cat <<'EOF'
usage: vuna-bench [options]

手动测量 vuna 的构建/编译性能与生成产物尺寸。默认测量 vuna（stage 1）；
加 `--compiler seed` 测量 vuna-seed（stage 0 多文件种子）。请在仓库根目录运行。

options:
  --compiler vuna|seed   被测编译器（默认 vuna）
  --runs N               计时重复次数（默认 3）
  --quick                等价于 --runs 1、无 warmup
  --json FILE|-          写出 JSON 报告；`-` 表示只输出 JSON
  --save FILE            与 --json 相同
  --baseline FILE        与之前的 JSON 报告对比，输出 delta（jq 解析）
  --check                读取基线（--baseline FILE，默认 nix/bench-baseline.json），
                         对超出 --threshold 的指标打印 WARN；软告警，退出 0
  --strict               与 --check 连用：同机器、同 compiler 的 WARN 变为退出 1；
                         跨机器/口径不同以及 bench 状态失败仍只告警、不阻断
  --threshold N          性能回退阈值，百分比（默认 20）
  --with-tests           额外运行原生 suite（较慢）
  --keep                 保留临时构建目录
  -h, --help             显示本帮助

基线：`--quick --json nix/bench-baseline.json` 生成入库基线；基线 meta 记录
arch/nproc/compiler/ocamlopt/git_head/git_dirty/runs/warmup，跨机器只做软告警。

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
    --check)
      CHECK=1
      shift
      ;;
    --strict)
      STRICT=1
      shift
      ;;
    --threshold)
      [ $# -ge 2 ] || die "--threshold needs a value"
      THRESHOLD=$2
      shift 2
      ;;
    --threshold=*)
      THRESHOLD=${1#*=}
      shift
      ;;
    --with-tests)
      WITH_TESTS=1
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
case $THRESHOLD in
  ''|*[!0-9]*|0) die "--threshold must be a positive integer (percent)" ;;
esac
case $COMPILER in
  vuna|stage1) COMPILER=vuna ;;
  seed|vuna-seed|stage0) COMPILER=seed ;;
  *) die "--compiler must be vuna or seed" ;;
esac
# --strict 是 --check 的失败模式；单独出现时隐含 --check。
[ "$STRICT" = 1 ] && CHECK=1

REPO=$PWD
[ -f "$REPO/seed/build.sh" ] || die "run from the repo root (seed/build.sh not found)"
[ -f "$REPO/app/Main.vuna" ] || die "run from the repo root (app/Main.vuna not found)"
[ -d "$REPO/compiler/lib/Vuna/Compiler" ] || die "run from the repo root (compiler/lib/Vuna/Compiler not found)"
[ -d "$REPO/lib/Vuna" ] || die "run from the repo root (lib/Vuna not found)"
command -v ocamlopt >/dev/null 2>&1 || die "ocamlopt not found (use: nix run .#vuna-bench)"

abspath() {
  case $1 in
    /*) printf '%s\n' "$1" ;;
    -) printf '%s\n' "$1" ;;
    *) printf '%s\n' "$REPO/$1" ;;
  esac
}

# --check 默认读取入库基线 nix/bench-baseline.json。
if [ "$CHECK" = 1 ] && [ -z "$BASELINE" ]; then
  BASELINE=$REPO/nix/bench-baseline.json
fi
if [ "$CHECK" = 1 ] && [ "$JSON_OUT" = "-" ]; then
  die "--check 不能与 --json - 组合（机器 JSON 与 WARN 行会混在一起）"
fi
if [ -n "$BASELINE" ]; then
  # 基线解析只用 jq（不再 sed 正则抠 JSON 字段）。
  command -v jq >/dev/null 2>&1 || die "jq not found (use: nix run .#vuna-bench)"
fi

if [ -n "$JSON_OUT" ]; then JSON_OUT=$(abspath "$JSON_OUT"); fi
if [ -n "$BASELINE" ]; then BASELINE=$(abspath "$BASELINE"); fi
# 基线缺失/非法在开始测量前就报错，避免白跑一遍基准。
if [ -n "$BASELINE" ]; then
  [ -f "$BASELINE" ] || die "baseline not found: $BASELINE"
  jq -e . "$BASELINE" >/dev/null 2>&1 || die "baseline is not valid JSON: $BASELINE"
fi

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
SEED_SHA=$(find seed -type f | LC_ALL=C sort | xargs sha256sum | sha256sum | awk '{ print $1 }')
SRC_LINES=$(cat compiler/lib/Vuna/Compiler/*.vuna lib/Vuna/*.vuna app/*.vuna | wc -l | tr -d ' ')
SRC_BYTES=$(cat compiler/lib/Vuna/Compiler/*.vuna lib/Vuna/*.vuna app/*.vuna | wc -c | tr -d ' ')

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
cp -r compiler lib app base seed vuna.toml "$WORK/src/"
if [ "$WITH_TESTS" = 1 ]; then
  cp -r test "$WORK/src/"
else
  mkdir -p "$WORK/src/test/corpus"
  cp -r test/corpus/run "$WORK/src/test/corpus/"
  cp -r test/corpus/dt "$WORK/src/test/corpus/"
  cp test/corpus/vuna.toml "$WORK/src/test/corpus/"
fi
cd "$WORK/src"
# M26：包上下文取代 `--root`；工作副本的 base 位置（无 manifest 的临时夹具用）。
export VUNA_BASE="$WORK/src/base"

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
SEED_BIN=$WORK/vuna-seed
STAGE1_SRC=$WORK/stage1src
STAGE1_BUILD=$WORK/stage1build
VUNA_COMPILER_BIN=$WORK/vuna-compiler
PRODUCT_SRC=$WORK/productsrc
PRODUCT_BUILD=$WORK/productbuild
VUNA_BIN=$WORK/vuna
SELF_OUT_SRC=$WORK/selfsrc
SELF_COMPILER_SRC=$WORK/selfcompilersrc

measure seed_build sh seed/build.sh "$SEED_BIN"
measure seed_compile "$SEED_BIN" compile compiler "$STAGE1_SRC"
cp -r "$STAGE1_SRC" "$STAGE1_BUILD"
measure stage1_build sh "$STAGE1_BUILD/build.sh" "$VUNA_COMPILER_BIN"
measure product_compile "$VUNA_COMPILER_BIN" compile . "$PRODUCT_SRC"
cp -r "$PRODUCT_SRC" "$PRODUCT_BUILD"
measure product_build sh "$PRODUCT_BUILD/build.sh" "$VUNA_BIN"

if [ "$COMPILER" = vuna ]; then
  SELF_BIN=$VUNA_BIN
else
  SELF_BIN=$SEED_BIN
fi

measure compiler_self_compile "$SELF_BIN" compile . "$SELF_OUT_SRC"
measure compiler_closure_compile "$SELF_BIN" compile compiler "$SELF_COMPILER_SRC"
cat "$SELF_OUT_SRC"/*.ml >"$WORK/self_concat.ml"
cat "$STAGE1_SRC"/*.ml >"$WORK/stage1_concat.ml"
cat seed/*.ml >"$WORK/seed_concat.ml"

printf 'main : Int\nmain = 40 + 2\n' >tiny.vuna
measure tiny_compile "$SELF_BIN" compile --no-print tiny.vuna "$WORK/tinyout"
# DT 精化 + 擦除 codegen 基准（单文件，Pi + 类型擦除；M24 起是唯一 codegen 路径）
measure dt_elab "$SELF_BIN" compile --no-print test/corpus/dt/03_compose.vuna "$WORK/dtelab"

# ---- corpus 批量编译（单次计时，内部循环） --------------------------------
cat >"$WORK/corpus.sh" <<'EOS'
#!/usr/bin/env bash
set -u
rm -rf "$CORPUS_OUT"
mkdir -p "$CORPUS_OUT"
: >"$CORPUS_FAIL"
for f in test/corpus/run/*.vuna; do
  out="$CORPUS_OUT/$(basename "$f" .vuna)"
  if ! "$CORPUS_BIN" compile --no-print "$f" "$out" >>"$CORPUS_LOG" 2>&1; then
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

cat "$WORK/tinyout"/*.ml >"$WORK/tiny_concat.ml"
collect_stats seed "$WORK/seed_concat.ml"
collect_stats stage1 "$WORK/stage1_concat.ml"
collect_stats self "$WORK/self_concat.ml"
collect_stats tiny "$WORK/tiny_concat.ml"

# ---- 状态 ----------------------------------------------------------------
FIXED_POINT=skipped
if [ "$COMPILER" = vuna ]; then
  if diff -r "$STAGE1_SRC" "$SELF_COMPILER_SRC" >/dev/null 2>&1; then
    FIXED_POINT=true
  else
    FIXED_POINT=false
    STATUS=fail
  fi
fi
SEED_MATCHES=false
if diff -r -x "*.cmi" -x "*.cmx" -x "*.o" -x "vuna-seed" -x "build.log" -x "build.sh" "$REPO/seed" "$STAGE1_SRC" >/dev/null 2>&1; then SEED_MATCHES=true; fi

TESTS=skipped
TESTS_SUMMARY=""
if [ "$WITH_TESTS" = 1 ]; then
  if VUNA_BASE="$REPO/base" VUNA=$VUNA_BIN VUNA_SEED=$SEED_BIN OCAMLOPT=ocamlopt \
       "$VUNA_BIN" test --suite "$REPO/test/suite.toml" --jobs 1 --no-cache >"$WORK/tests.log" 2>&1; then
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
  metric_line product_compile
  metric_line product_build
  note ""
  note "== 编译性能（$COMPILER）=="
  metric_line seed_compile
  metric_line compiler_self_compile
  metric_line compiler_closure_compile
  metric_line tiny_compile
  metric_line dt_elab
  metric_line corpus_compile
  note "  throughput: ${SELF_LINES_PER_SEC} lines/s, ${SELF_KB_PER_SEC} KB/s (self-compile source: $SRC_LINES lines / $SRC_BYTES B)"
  note "  corpus: ${CORPUS_OK}/${CORPUS_TOTAL} compiled"
  note ""
  note "== 产物尺寸 =="
  printf '  %-10s %10s %8s %9s %8s %8s %10s %9s\n' artifact bytes lines max_line '>120' '>500' 'trail_ws' 'blank_ws'
  for key in seed stage1 self tiny; do
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

# 当前口径的扁平指标：timings_ms.<key>.median / sizes.<key>（与基线 flat 对齐）。
declare -A CUR_FLAT

collect_current_flat() {
  local key
  for key in "${!MEDIAN[@]}"; do
    CUR_FLAT["timings_ms.${key}.median"]=${MEDIAN[$key]}
  done
  for key in "${!SIZE[@]}"; do
    CUR_FLAT["sizes.${key}"]=${SIZE[$key]}
  done
}

# 基线扁平指标：只由 jq 解析（flat 缺失时从 timings_ms/sizes 回退合成）。
baseline_flat() {
  jq -r '
    (.flat // (
      ((.timings_ms // {})
        | to_entries
        | map({ key: ("timings_ms." + .key + ".median"), value: .value.median })
        | from_entries)
      + ((.sizes // {})
        | to_entries
        | map({ key: ("sizes." + .key), value: .value })
        | from_entries)
    ))
    | to_entries[]
    | select(.value | type == "number")
    | "\(.key)\t\(.value)"
  ' "$BASELINE"
}

compare_baseline() {
  [ -f "$BASELINE" ] || die "baseline not found: $BASELINE"
  command -v jq >/dev/null 2>&1 || die "jq not found (use: nix run .#vuna-bench)"
  jq -e . "$BASELINE" >/dev/null 2>&1 || die "baseline is not valid JSON: $BASELINE"

  local base_compiler base_arch base_nproc base_runs base_warmup
  base_compiler=$(jq -r '.meta.compiler // "unknown"' "$BASELINE")
  base_arch=$(jq -r '.meta.arch // "unknown"' "$BASELINE")
  base_nproc=$(jq -r '.meta.nproc // "unknown"' "$BASELINE")
  base_runs=$(jq -r '.meta.runs // "unknown"' "$BASELINE")
  base_warmup=$(jq -r '.meta.warmup // "unknown"' "$BASELINE")

  note ""
  note "== 对比基线 =="
  note "baseline: $BASELINE"
  note "baseline meta: compiler=$base_compiler arch=$base_arch nproc=$base_nproc runs=$base_runs warmup=$base_warmup"

  SAME_COMPILER=1
  SAME_MACHINE=1
  if [ "$base_compiler" != unknown ] && [ "$base_compiler" != "$COMPILER" ]; then
    SAME_COMPILER=0
    note "跳过比较: 基线 compiler=$base_compiler，当前 compiler=$COMPILER（只对同 compiler 比较）"
  fi
  if [ "$base_arch" != unknown ] && [ "$base_arch" != "$ARCH" ]; then SAME_MACHINE=0; fi
  if [ "$base_nproc" != unknown ] && [ "$base_nproc" != "$NPROC" ]; then SAME_MACHINE=0; fi
  if [ "$SAME_MACHINE" = 0 ]; then
    note "跨机器基线（arch/nproc 不同）：差异只作软告警，--strict 也不因此失败"
  fi
  if { [ "$base_runs" != unknown ] && [ "$base_runs" != "$RUNS" ]; } ||
    { [ "$base_warmup" != unknown ] && [ "$base_warmup" != "$WARMUP" ]; }; then
    note "口径不同: 基线 runs=$base_runs warmup=$base_warmup，当前 runs=$RUNS warmup=$WARMUP（只作软告警）"
  fi

  WARN_COUNT=0
  HARD_WARN=0
  SOFT_WARN=0
  CMP_COUNT=0
  if [ "$SAME_COMPILER" = 0 ]; then return 0; fi

  collect_current_flat
  printf '  %-42s %12s %12s %10s  %s\n' metric current baseline delta result
  local key basev cur delta flag verdict
  while IFS=$'\t' read -r key basev; do
    [ -n "$key" ] || continue
    cur=${CUR_FLAT[$key]:-}
    if [ -z "$cur" ]; then
      note "  (当前未测量: $key)"
      continue
    fi
    CMP_COUNT=$((CMP_COUNT + 1))
    read -r delta flag <<<"$(awk -v c="$cur" -v b="$basev" -v th="$THRESHOLD" 'BEGIN {
      if (b + 0 == 0) {
        if (c + 0 == 0) { print "0.0 flat" } else { print "n/a new" }
        exit
      }
      d = (c - b) / b * 100
      if (d > th) { printf "%.1f WARN\n", d }
      else if (d < -0.5) { printf "%.1f down\n", d }
      else if (d > 0.5) { printf "%.1f up\n", d }
      else { printf "%.1f flat\n", d }
    }')"
    verdict=$flag
    shown_delta="${delta}%"
    case $flag in
      new) shown_delta="n/a" ;;
      WARN)
        WARN_COUNT=$((WARN_COUNT + 1))
        if [ "$SAME_MACHINE" = 1 ]; then
          HARD_WARN=$((HARD_WARN + 1))
        else
          SOFT_WARN=$((SOFT_WARN + 1))
          verdict="WARN(cross-machine)"
        fi
        ;;
    esac
    printf '  %-42s %12s %12s %10s  %s\n' "$key" "$cur" "$basev" "$shown_delta" "$verdict"
  done < <(baseline_flat)

  note ""
  note "threshold: ${THRESHOLD}%  compared: $CMP_COUNT  warn: $WARN_COUNT (hard: $HARD_WARN, cross-machine: $SOFT_WARN)"
  if [ "$WARN_COUNT" -gt 0 ]; then
    note "BENCH-CHECK-WARN"
  else
    note "BENCH-CHECK-OK"
  fi
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
  if [ "$CHECK" = 1 ]; then
    if [ "$STATUS" != ok ]; then
      note "note: bench status=$STATUS（--check 下不因此失败；--strict 才失败）"
    fi
    if [ "$STRICT" = 1 ]; then
      if [ "${HARD_WARN:-0}" -gt 0 ]; then
        note "BENCH-CHECK-FAIL（--strict：同机器 ${HARD_WARN} 项超出 ${THRESHOLD}% 阈值）"
        exit 1
      fi
      if [ "$STATUS" != ok ]; then
        note "BENCH-CHECK-FAIL（--strict：bench status=$STATUS）"
        exit 1
      fi
    fi
    exit 0
  fi
  [ "$STATUS" = ok ] || exit 1
fi
