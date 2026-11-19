#!/usr/bin/env bash
# 统一重标 bench/baselines/ 下的基线。
#
# 用法（仓库根目录）：
#   sh bench/update-baselines.sh                 # programs + bootstrap + compiler + artifacts
#   sh bench/update-baselines.sh --only programs
#   sh bench/update-baselines.sh --quick         # programs 用 runs=1/warmup=0
#
# 需要固定的 vuna 二进制（默认 ./result/bin/vuna；先 `nix build .#vuna --out-link result`）。
set -euo pipefail

ROOT=$(cd "$(dirname "$0")/.." && pwd)
cd "$ROOT"

VUNA_BIN=${VUNA:-$ROOT/result/bin/vuna}
ONLY=""
QUICK=0

usage() {
  cat <<'EOF'
usage: update-baselines [options]

options:
  --vuna PATH      被测 vuna（默认 $VUNA 或 ./result/bin/vuna）
  --only NAME      只重标一项：programs / bootstrap / compiler / artifacts（可重复）
  --quick          programs 用 --runs 1 --warmup 0（只做冒烟）
  -h, --help       显示帮助
EOF
}

die() { printf 'update-baselines: %s\n' "$*" >&2; exit 2; }

while [ $# -gt 0 ]; do
  case $1 in
    --vuna) [ $# -ge 2 ] || die "--vuna needs a value"; VUNA_BIN=$2; shift 2 ;;
    --vuna=*) VUNA_BIN=${1#*=}; shift ;;
    --only) [ $# -ge 2 ] || die "--only needs a value"; ONLY="$ONLY $2"; shift 2 ;;
    --only=*) ONLY="$ONLY ${1#*=}"; shift ;;
    --quick) QUICK=1; shift ;;
    -h|--help) usage; exit 0 ;;
    *) die "unknown argument: $1 (try --help)" ;;
  esac
done

selected() {
  case " $ONLY " in
    *" $1 "*) return 0 ;;
    *) [ -z "$ONLY" ] && return 0 || return 1 ;;
  esac
}

[ -x "$VUNA_BIN" ] || die "vuna not found: $VUNA_BIN（先 nix build .#vuna --out-link result）"
VUNA_BIN=$(cd "$(dirname "$VUNA_BIN")" && pwd)/$(basename "$VUNA_BIN")
mkdir -p "$ROOT/bench/baselines"

if selected programs; then
  echo "== programs =="
  if [ "$QUICK" = 1 ]; then
    bash bench/run.sh --compiler "$VUNA_BIN" --target all --runs 1 --warmup 0 \
      --json bench/baselines/programs.json
  else
    bash bench/run.sh --compiler "$VUNA_BIN" --target all --runs 5 --warmup 2 \
      --json bench/baselines/programs.json
  fi
fi

if selected bootstrap; then
  echo "== bootstrap =="
  bash bench/bootstrap.sh --quick --json bench/baselines/bootstrap.json
fi

if selected compiler; then
  echo "== compiler =="
  bash bench/compiler.sh --compiler "$VUNA_BIN" --save-baseline \
    --baseline bench/baselines/compiler.txt
fi

if selected artifacts; then
  echo "== artifacts =="
  bash bench/artifact.sh --compiler "$VUNA_BIN" \
    --json bench/baselines/artifacts.json
fi

if selected native; then
  echo "== native =="
  if [ -x "${VUNA_NATIVE:-$ROOT/result-native/bin/vuna-native}" ]; then
    bash bench/native.sh --full --json bench/baselines/native.json
  else
    echo "skip native: 先 nix build .#vuna-native --out-link result-native"
  fi
fi

echo "== baselines =="
git status --short bench/baselines || true