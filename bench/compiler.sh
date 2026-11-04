#!/usr/bin/env bash
# vuna-compiler-perf：M34 编译器自身端到端基准（`sh bench/compiler.sh`）。
#
# 与 bench/run.sh 的分工：run.sh 测**生成程序运行时**（vuna 产物 vs 手写 OCaml）；
# 本脚本测**编译器/工具链自己的墙钟**（check / build --no-compile / map / fmt）。
#
# 口径：每项先 warmup 再跑 --runs 次取中位数；只有绝对 ms（跨机器不可比，**同一台机器**
# 上做回归对比）。`--check` 与 `bench/compiler-baseline.txt` 比，超过 --threshold% 打 WARN
# （软门槛，退出 0）；`--save-baseline` 重写基线（复核读数后手动执行）。
#
# 用法（仓库根目录）：
#   sh bench/compiler.sh                    # 测量全部并打印表格
#   sh bench/compiler.sh --runs 5 --check   # 与基线对比
#   sh bench/compiler.sh --save-baseline    # 重写 bench/compiler-baseline.txt
set -euo pipefail

RUNS=3
WARMUP=1
THRESHOLD=20
CHECK=0
SAVE=0
JSON_OUT=""
ONLY=""
VUNA_BIN=${VUNA:-vuna}
ROOT=$(cd "$(dirname "$0")/.." && pwd)
BASELINE="$ROOT/bench/compiler-baseline.txt"
WORK=$(mktemp -d "${TMPDIR:-/tmp}/vuna-cperf.XXXXXX")
trap 'rm -rf "$WORK"' EXIT INT TERM

usage() {
  cat <<'EOF'
usage: vuna-compiler-perf [options]

在仓库根目录运行（需要 PATH 里的 vuna 或 --compiler）。

options:
  --runs N               计时重复次数（默认 3）
  --warmup N             计时前预热次数（默认 1）
  --only NAME            只跑一项（可重复）
  --compiler PATH        被测 vuna（默认 PATH 里的 vuna / $VUNA）
  --json FILE            写出 JSON 报告
  --check                与 bench/compiler-baseline.txt 对比，超过 --threshold% 打 WARN
  --save-baseline        把本次中位数写回 bench/compiler-baseline.txt
  --threshold N          回退阈值，百分比（默认 20）
  -h, --help             显示帮助

benchmark 名: check-all check-compiler build-compiler map-cold map-hot fmt-check
EOF
}

die() { printf 'vuna-compiler-perf: %s\n' "$*" >&2; exit 2; }

while [ $# -gt 0 ]; do
  case $1 in
    --runs) [ $# -ge 2 ] || die "--runs needs a value"; RUNS=$2; shift 2 ;;
    --runs=*) RUNS=${1#*=}; shift ;;
    --warmup) [ $# -ge 2 ] || die "--warmup needs a value"; WARMUP=$2; shift 2 ;;
    --warmup=*) WARMUP=${1#*=}; shift ;;
    --only) [ $# -ge 2 ] || die "--only needs a value"; ONLY="$ONLY $2"; shift 2 ;;
    --only=*) ONLY="$ONLY ${1#*=}"; shift ;;
    --compiler) VUNA_BIN=$2; shift 2 ;;
    --compiler=*) VUNA_BIN=${1#*=}; shift ;;
    --json) [ $# -ge 2 ] || die "--json needs a value"; JSON_OUT=$2; shift 2 ;;
    --json=*) JSON_OUT=${1#*=}; shift ;;
    --check) CHECK=1; shift ;;
    --save-baseline) SAVE=1; shift ;;
    --threshold) [ $# -ge 2 ] || die "--threshold needs a value"; THRESHOLD=$2; shift 2 ;;
    --threshold=*) THRESHOLD=${1#*=}; shift ;;
    -h|--help) usage; exit 0 ;;
    *) die "unknown argument: $1 (try --help)" ;;
  esac
done

case $RUNS in ''|*[!0-9]*|0) die "--runs must be a positive integer" ;; esac

NAMES="check-all check-compiler build-compiler map-cold map-hot fmt-check"
if [ -n "$ONLY" ]; then
  for n in $ONLY; do
    case " $NAMES " in *" $n "*) ;; *) die "unknown benchmark: $n" ;; esac
  done
  NAMES=$ONLY
fi

# 单项一次（成功才输出 ms；失败时打印错误并退出）。
run_once() {
  local name=$1 t0 t1 rc
  case $name in
    check-all) t0=$(date +%s%3N); (cd "$ROOT" && "$VUNA_BIN" check . >/dev/null 2>&1); rc=$?; t1=$(date +%s%3N) ;;
    check-compiler) t0=$(date +%s%3N); (cd "$ROOT" && "$VUNA_BIN" check compiler >/dev/null 2>&1); rc=$?; t1=$(date +%s%3N) ;;
    build-compiler) t0=$(date +%s%3N); (cd "$ROOT" && "$VUNA_BIN" build --no-compile --out "$WORK/build" compiler >/dev/null 2>&1); rc=$?; t1=$(date +%s%3N) ;;
    map-cold) rm -rf "$ROOT/.local/index"; t0=$(date +%s%3N); (cd "$ROOT" && "$VUNA_BIN" map >/dev/null 2>&1); rc=$?; t1=$(date +%s%3N) ;;
    map-hot) t0=$(date +%s%3N); (cd "$ROOT" && "$VUNA_BIN" map >/dev/null 2>&1); rc=$?; t1=$(date +%s%3N) ;;
    fmt-check) t0=$(date +%s%3N); (cd "$ROOT" && "$VUNA_BIN" fmt --check >/dev/null 2>&1); rc=$?; t1=$(date +%s%3N) ;;
    *) die "unknown benchmark: $name" ;;
  esac
  [ "$rc" -eq 0 ] || { printf 'vuna-compiler-perf: %s failed (exit %s)\n' "$name" "$rc" >&2; return 1; }
  echo $((t1 - t0))
}

median() { printf '%s\n' "$@" | sort -n | awk '{a[NR]=$1} END { if (NR%2) print a[(NR+1)/2]; else print int((a[NR/2]+a[NR/2+1])/2) }'; }

declare -A MED
printf '%-18s %10s\n' benchmark ms
for name in $NAMES; do
  [ "$name" = map-cold ] || :
  for _ in $(seq 1 "$WARMUP"); do run_once "$name" >/dev/null || exit 1; done
  times=""
  for _ in $(seq 1 "$RUNS"); do
    t=$(run_once "$name") || exit 1
    times="$times $t"
  done
  med=$(median $times)
  MED[$name]=$med
  printf '%-18s %10s\n' "$name" "$med"
done

if [ -n "$JSON_OUT" ]; then
  {
    printf '{"generated":"%s","runs":%d,"results":{' "$(date -u +%Y-%m-%dT%H:%M:%SZ)" "$RUNS"
    first=1
    for name in $NAMES; do
      [ $first -eq 1 ] && first=0 || printf ','
      printf '"%s":%s' "$name" "${MED[$name]}"
    done
    printf '}}\n'
  } > "$JSON_OUT"
  echo "json: $JSON_OUT"
fi

if [ "$SAVE" -eq 1 ]; then
  : > "$BASELINE"
  for name in $NAMES; do printf '%s %s\n' "$name" "${MED[$name]}" >> "$BASELINE"; done
  echo "baseline: $BASELINE"
fi

if [ "$CHECK" -eq 1 ]; then
  [ -f "$BASELINE" ] || die "baseline missing: $BASELINE (run --save-baseline first)"
  echo ""
  echo "== 对比基线 =="
  echo "baseline: $BASELINE"
  echo "threshold: ${THRESHOLD}%"
  printf '%-18s %10s %10s %8s  %s\n' benchmark cur_ms base_ms delta result
  bad=0
  while read -r bname bms; do
    [ -n "$bname" ] || continue
    cur=${MED[$bname]:-}
    [ -n "$cur" ] || continue
    if [ "$bms" -eq 0 ]; then delta=0; else delta=$(( (cur - bms) * 100 / bms )); fi
    if [ "$delta" -gt "$THRESHOLD" ]; then result=WARN; bad=1; else result=ok; fi
    printf '%-18s %10s %10s %7s%%  %s\n' "$bname" "$cur" "$bms" "$delta" "$result"
  done < "$BASELINE"
  if [ "$bad" -eq 1 ]; then echo "COMPILER-PERF-WARN"; else echo "COMPILER-PERF-OK"; fi
fi