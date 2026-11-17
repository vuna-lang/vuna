#!/bin/sh
# 引擎支持矩阵探针（suite steps 用）。
#
# 用法：sh probe.sh <path-to-vuna>
#   环境：VUNA_BASE（vuna-base 目录，默认 <repo>/base）
#
# 事实口径：wasm 产物无条件带 stack-switching 类型（`$ct` / `$eff`），所以默认配置的
# 引擎（Node / 浏览器）拒绝编译；这是「浏览器能不能跑」的唯一版本闸门。
# 本脚本断言这条事实，并把「开给 V8 的实验特性后走到哪一步」作为报告打印（不参与判定，
# 因为引擎侧进展与 Node 版本相关）。
#
# 缺 Node 时打印 SKIP，摘要行照常输出（与 108 的桥接冒烟同风格）。

set -u

[ "$#" -ge 1 ] || {
  echo "usage: sh probe.sh <path-to-vuna>" >&2
  exit 2
}
abs_path() {
  case "$1" in
    /*) printf '%s' "$1" ;;
    *) printf '%s/%s' "$(CDPATH= cd -- "$(dirname -- "$1")" && pwd)" "$(basename -- "$1")" ;;
  esac
}

VUNA=$(abs_path "$1")
[ -x "$VUNA" ] || {
  echo "probe: not an executable vuna: $VUNA" >&2
  exit 2
}

HERE=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
REPO=$(CDPATH= cd -- "$HERE/../../../.." && pwd)
VUNA_BASE=${VUNA_BASE:-$REPO/base}
VUNA_BASE=$(abs_path "$VUNA_BASE")

tmp=$(mktemp -d "${TMPDIR:-/tmp}/wprobe.XXXXXX") || exit 1
trap 'rm -rf "$tmp"' EXIT INT HUP TERM

pass=0
fail=0

ok() {
  pass=$((pass + 1))
  printf 'ok   %s\n' "$1"
}

bad() {
  fail=$((fail + 1))
  printf 'FAIL %s\n     %s\n' "$1" "$2"
}

# expect_contains <label> <text> <needle>
expect_contains() {
  case "$2" in
    *"$3"*) ok "$1" ;;
    *) bad "$1" "期望包含「$3」，实际：
$(printf '%s' "$2" | sed 's/^/     /')" ;;
  esac
}

# build_pkg <dir> <name> <main-source>
build_pkg() {
  d=$1
  mkdir -p "$d/app" || return 1
  printf '[package]\nname = "%s"\n\n[dependencies]\nvuna-base = "%s"\n' "$2" "$VUNA_BASE" >"$d/vuna.toml"
  printf '%s' "$3" >"$d/app/Main.vuna"
  (cd "$d" && "$VUNA" build --target wasm --out "$d/out" . >"$d/build.log" 2>&1)
}

build_pkg "$tmp/pure" "pure" 'main : Int
main = 42
' || {
  echo "FAIL build(pure)"
  sed 's/^/     /' "$tmp/pure/build.log"
  fail=$((fail + 1))
}

build_pkg "$tmp/console" "console" 'import Base.Eff
import Base.EffConsole
import Base.Nat

main : Eff [ConsoleOp] Nat
main = consolePrint "hello"
' || {
  echo "FAIL build(console)"
  sed 's/^/     /' "$tmp/console/build.log"
  fail=$((fail + 1))
}

PURE_WASM=$tmp/pure/out/main.wasm
CONSOLE_WASM=$tmp/console/out/main.wasm

if ! command -v node >/dev/null 2>&1; then
  echo "SKIP: node not found"
else
  # 默认配置：两个产物都必须被拒绝（stack switching 未启用）。
  for w in "$PURE_WASM" "$CONSOLE_WASM"; do
    [ -f "$w" ] || {
      bad "default($w)" "产物缺失"
      continue
    }
    out=$(node --no-warnings "$HERE/probe.mjs" "$w" 2>&1)
    expect_contains "default($w)" "$out" "validate=false compile=error"
    printf '     %s\n' "$out"
  done

  # 开 V8 实验特性：只报告，不判定（引擎侧进展与 Node 版本相关）。
  report='flagged=unavailable'
  if node --no-warnings --experimental-wasm-wasmfx -e '1' >/dev/null 2>&1; then
    report=$(node --no-warnings --experimental-wasm-wasmfx "$HERE/probe.mjs" "$PURE_WASM" "$CONSOLE_WASM" 2>&1)
  fi
  printf 'report: %s\n' "$(printf '%s' "$report" | tr '\n' '|' | sed 's/| *$//')"
fi

printf '%d passed, %d failed\n' "$pass" "$fail"
[ "$fail" -eq 0 ]