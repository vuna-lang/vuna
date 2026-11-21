#!/usr/bin/env bash
# vuna-native：把编译器本身编到 native 后的端到端基准（构建产物 + check 墙钟）。
#
# 这是唯一以「真实大效应程序」为负载的基准：编译器自己跑在库机器上。
# 与 vuna-perf / compiler.sh 的分工：
#   * vuna-perf 测生成程序；compiler.sh 测 OCaml 后端的 CLI；
#   * 本脚本测 native 后端的编译器（`nix build .#vuna-native --out-link result-native`）。
#
# 用法（仓库根目录）：
#   sh bench/native.sh                                  # check packages/base 冷/热
#   sh bench/native.sh --full                           # 再加 check packages/compiler
#   sh bench/native.sh --json bench/baselines/native.json
#   sh bench/native.sh --check                          # 与基线比绝对值
set -euo pipefail

ROOT=$(cd "$(dirname "$0")/.." && pwd)
cd "$ROOT"

RUNS=1
FULL=0
JSON_OUT=""
BASELINE=""
CHECK=0
THRESHOLD=20
FAIL_THRESHOLD=50
VUNA_NATIVE=${VUNA_NATIVE:-$ROOT/result-native/bin/vuna-native}

usage() {
  cat <<'EOF'
usage: vuna-native [options]

options:
  --compiler PATH   native 编译器（默认 $VUNA_NATIVE 或 ./result-native/bin/vuna-native）
  --runs N          每档冷/热重复次数（默认 1）
  --full            额外测 check packages/compiler
  --json FILE|-     写出 JSON 报告
  --baseline FILE   基线 JSON（默认 bench/baselines/native.json）
  --check           与基线比绝对值（同机器）
  --threshold N     WARN 阈值，百分比（默认 20）
  --fail-threshold N FAIL 阈值，百分比（默认 50）
  -h, --help        显示帮助

前置：nix build .#vuna-native --out-link result-native
EOF
}

die() { printf 'vuna-native: %s\n' "$*" >&2; exit 2; }
note() {
  if [ "$JSON_OUT" = "-" ]; then printf '%s\n' "$*" >&2; else printf '%s\n' "$*"; fi
}

while [ $# -gt 0 ]; do
  case $1 in
    --compiler) [ $# -ge 2 ] || die "--compiler needs a value"; VUNA_NATIVE=$2; shift 2 ;;
    --compiler=*) VUNA_NATIVE=${1#*=}; shift ;;
    --runs) [ $# -ge 2 ] || die "--runs needs a value"; RUNS=$2; shift 2 ;;
    --runs=*) RUNS=${1#*=}; shift ;;
    --full) FULL=1; shift ;;
    --json) [ $# -ge 2 ] || die "--json needs a value"; JSON_OUT=$2; shift 2 ;;
    --json=*) JSON_OUT=${1#*=}; shift ;;
    --baseline) [ $# -ge 2 ] || die "--baseline needs a value"; BASELINE=$2; shift 2 ;;
    --baseline=*) BASELINE=${1#*=}; shift ;;
    --check) CHECK=1; shift ;;
    --threshold) [ $# -ge 2 ] || die "--threshold needs a value"; THRESHOLD=$2; shift 2 ;;
    --threshold=*) THRESHOLD=${1#*=}; shift ;;
    --fail-threshold) [ $# -ge 2 ] || die "--fail-threshold needs a value"; FAIL_THRESHOLD=$2; shift 2 ;;
    --fail-threshold=*) FAIL_THRESHOLD=${1#*=}; shift ;;
    -h|--help) usage; exit 0 ;;
    *) die "unknown argument: $1 (try --help)" ;;
  esac
done

case $RUNS in ''|*[!0-9]*|0) die "--runs must be a positive integer" ;; esac
case $THRESHOLD in ''|*[!0-9]*|0) die "--threshold must be a positive integer (percent)" ;; esac
case $FAIL_THRESHOLD in ''|*[!0-9]*|0) die "--fail-threshold must be a positive integer (percent)" ;; esac
[ "$FAIL_THRESHOLD" -ge "$THRESHOLD" ] || die "--fail-threshold must be >= --threshold"

[ -x "$VUNA_NATIVE" ] || die "native compiler not found: $VUNA_NATIVE（先 nix build .#vuna-native --out-link result-native）"
command -v jq >/dev/null 2>&1 || die "jq not found"
if [ "$CHECK" = 1 ] && [ -z "$BASELINE" ]; then BASELINE=$ROOT/bench/baselines/native.json; fi
if [ -n "$BASELINE" ] && [ "$CHECK" = 1 ]; then
  [ -f "$BASELINE" ] || die "baseline not found: $BASELINE"
  jq -e . "$BASELINE" >/dev/null 2>&1 || die "baseline is not valid JSON: $BASELINE"
fi

WORK=$(mktemp -d "${TMPDIR:-/tmp}/vuna-native.XXXXXX")
trap 'rm -rf "$WORK"' EXIT INT TERM

now_ns() { date +%s%N; }
median_of() {
  printf '%s\n' "$@" | sort -n | awk '{ a[NR] = $1 } END { if (NR % 2) print a[(NR + 1) / 2]; else print int((a[NR / 2] + a[NR / 2 + 1]) / 2) }'
}
ratio_of() { awk -v a="$1" -v b="$2" 'BEGIN { if (b + 0 <= 0) print "0"; else printf "%.2f", (a - b) / b * 100 }'; }

TIMESTAMP=$(date -u +%Y-%m-%dT%H:%M:%SZ)
ARCH=$(uname -m)
NPROC=$(getconf _NPROCESSORS_ONLN 2>/dev/null || printf 'unknown')
LOADAVG=$(cut -d' ' -f1 /proc/loadavg 2>/dev/null || printf 'unknown')
VUNA_VERSION=$("$VUNA_NATIVE" --version 2>/dev/null || printf 'unknown')
GIT_HEAD=unknown
GIT_DIRTY=false
if command -v git >/dev/null 2>&1 && git rev-parse --git-dir >/dev/null 2>&1; then
  GIT_HEAD=$(git rev-parse HEAD 2>/dev/null || printf 'unknown')
  # 基线文件本身是本次输出，不计入 dirty（否则重标每次都记 git_dirty=true）。
  STATUS=$(git status --porcelain 2>/dev/null || true)
  if [ -n "$JSON_OUT" ] && [ "$JSON_OUT" != "-" ]; then
    REL=$(realpath --relative-to="$ROOT" "$JSON_OUT" 2>/dev/null || printf '%s' "$JSON_OUT")
    STATUS=$(printf '%s\n' "$STATUS" | grep -v -F -- "$REL" || true)
  fi
  [ -n "$STATUS" ] && GIT_DIRTY=true
fi
SIZE_BYTES=$(wc -c <"$VUNA_NATIVE" | tr -d ' ')
COMPILER_SHA=$(sha256sum "$VUNA_NATIVE" | cut -d' ' -f1)

json_escape() {
  local s=$1
  s=${s//\\/\\\\}; s=${s//\"/\\\"}; s=${s//$'\n'/\\n}; s=${s//$'\t'/\\t}
  printf '%s' "$s"
}

declare -A MED
# 一次冷（空 store）+ 一次热（同 store）的墙钟；RUNS 次取中位数。
measure_pkg() { # key pkg
  local key=$1 pkg=$2 i s e d colds="" warms=""
  for ((i = 0; i < RUNS; i++)); do
    d=$(mktemp -d "$WORK/store.XXXXXX")
    s=$(now_ns)
    VUNA_STORE=$d/store TMPDIR=$d "$VUNA_NATIVE" check "$pkg" >"$WORK/$key.cold.log" 2>&1 || die "$key cold check failed: $pkg"
    e=$(now_ns)
    colds+=" $(((e - s + 500000) / 1000000))"
    s=$(now_ns)
    VUNA_STORE=$d/store TMPDIR=$d "$VUNA_NATIVE" check "$pkg" >"$WORK/$key.warm.log" 2>&1 || die "$key warm check failed: $pkg"
    e=$(now_ns)
    warms+=" $(((e - s + 500000) / 1000000))"
    rm -rf "$d"
  done
  MED["$key-cold"]=$(median_of ${colds})
  MED["$key-warm"]=$(median_of ${warms})
  note "  $key cold ${MED["$key-cold"]} ms  warm ${MED["$key-warm"]} ms"
}

note "== vuna-native =="
note "  compiler $VUNA_NATIVE ($SIZE_BYTES bytes)"
measure_pkg check-base packages/base
if [ "$FULL" = 1 ]; then measure_pkg check-compiler packages/compiler; fi

emit_json() {
  printf '{\n  "schema": 1,\n  "meta": {\n'
  printf '    "timestamp": "%s",\n' "$(json_escape "$TIMESTAMP")"
  printf '    "git_head": "%s",\n' "$(json_escape "$GIT_HEAD")"
  printf '    "git_dirty": %s,\n' "$GIT_DIRTY"
  printf '    "compiler": "%s",\n' "$(json_escape "$VUNA_VERSION")"
  printf '    "compiler_sha256": "%s",\n' "$(json_escape "$COMPILER_SHA")"
  printf '    "arch": "%s",\n' "$(json_escape "$ARCH")"
  printf '    "nproc": %s,\n' "$(case $NPROC in *[!0-9]*|'') printf 'null' ;; *) printf '%s' "$NPROC" ;; esac)"
  printf '    "loadavg": "%s",\n' "$(json_escape "$LOADAVG")"
  printf '    "runs": %s,\n' "$RUNS"
  printf '    "full": %s\n' "$([ "$FULL" = 1 ] && printf true || printf false)"
  printf '  },\n  "metrics": {\n'
  printf '    "size_bytes": %s,\n' "$SIZE_BYTES"
  printf '    "check_base_cold_ms": %s,\n' "${MED["check-base-cold"]}"
  printf '    "check_base_warm_ms": %s' "${MED["check-base-warm"]}"
  if [ "$FULL" = 1 ]; then
    printf ',\n    "check_compiler_cold_ms": %s,\n' "${MED["check-compiler-cold"]}"
    printf '    "check_compiler_warm_ms": %s\n' "${MED["check-compiler-warm"]}"
  else
    printf '\n'
  fi
  printf '  }\n}\n'
}

check_baseline() {
  local base_compiler base_arch base_nproc basev cur delta verdict warns=0 fails=0
  base_compiler=$(jq -r '.meta.compiler // "unknown"' "$BASELINE")
  base_arch=$(jq -r '.meta.arch // "unknown"' "$BASELINE")
  base_nproc=$(jq -r '.meta.nproc // "unknown"' "$BASELINE")
  note ""
  note "== 对比基线 =="
  note "baseline: $BASELINE"
  if [ "$base_arch" != "$ARCH" ] || [ "$base_nproc" != "$NPROC" ] || [ "$base_compiler" != "$VUNA_VERSION" ]; then
    note "跨口径基线（$base_arch/$base_nproc/$base_compiler）：只报告 delta，不计 WARN"
    return 0
  fi
  local key
  for key in size_bytes check_base_cold_ms check_base_warm_ms check_compiler_cold_ms check_compiler_warm_ms; do
    cur=""
    case $key in
      size_bytes) cur=$SIZE_BYTES ;;
      check_base_cold_ms) cur=${MED["check-base-cold"]:-} ;;
      check_base_warm_ms) cur=${MED["check-base-warm"]:-} ;;
      check_compiler_cold_ms) cur=${MED["check-compiler-cold"]:-} ;;
      check_compiler_warm_ms) cur=${MED["check-compiler-warm"]:-} ;;
    esac
    [ -n "$cur" ] || continue
    basev=$(jq -r --arg k "$key" '.metrics[$k] // empty' "$BASELINE")
    [ -n "$basev" ] || { note "  $key $cur（基线无此项）"; continue; }
    delta=$(ratio_of "$cur" "$basev")
    verdict=ok
    awk -v d="$delta" -v ft="$FAIL_THRESHOLD" 'BEGIN { exit !(d > ft) }' && verdict=FAIL
    [ "$verdict" = ok ] && awk -v d="$delta" -v th="$THRESHOLD" 'BEGIN { exit !(d > th) }' && verdict=WARN
    [ "$verdict" = WARN ] && warns=$((warns + 1))
    [ "$verdict" = FAIL ] && fails=$((fails + 1))
    note "  $key $cur vs $basev (${delta}%) $verdict"
  done
  if [ "$fails" -gt 0 ]; then note "PERF-CHECK-FAIL（$fails 项超过 ${FAIL_THRESHOLD}%）"; return 1; fi
  if [ "$warns" -gt 0 ]; then note "PERF-CHECK-WARN（$warns 项超过 ${THRESHOLD}%）"; return 0; fi
  note "PERF-CHECK-OK"
  return 0
}

if [ "$JSON_OUT" = "-" ]; then
  emit_json
  rc=0
  [ "$CHECK" = 1 ] && { check_baseline >&2 || rc=$?; }
  exit $rc
else
  if [ -n "$JSON_OUT" ]; then
    [ "$GIT_DIRTY" = true ] && note "warning: 工作树有未提交改动（git_dirty=true）" >&2
    emit_json >"$JSON_OUT"
    note "json: $JSON_OUT"
  fi
  rc=0
  [ "$CHECK" = 1 ] && { check_baseline || rc=$?; }
  exit $rc
fi