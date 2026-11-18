#!/bin/sh
# 引擎支持矩阵探针（suite steps 用）。
#
# 用法：sh probe.sh <path-to-vuna>
#   环境：VUNA_BASE（vuna-base 目录，默认 <repo>/base）
#
# 事实口径：产物用显式效应机器（`@ir@m@*`），不含 wasm stack-switching 类型与指令，
# 所以纯程序、内建宿主效应、用户自定义 handler 在引擎默认配置下都直接可编译。
# 本脚本断言这些面，并把「开给 V8 的实验特性后走到哪一步」作为报告打印（不参与判定，
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

build_pkg "$tmp/console" "console" 'import Base.Effect.Core as Eff
import Base.Effect.Console as EffConsole
import Base.Data.Nat as Nat

main : Eff [ConsoleOp] Nat
main = consolePrint "hello"
' || {
  echo "FAIL build(console)"
  sed 's/^/     /' "$tmp/console/build.log"
  fail=$((fail + 1))
}

build_pkg "$tmp/user" "user" 'import Base.Effect.Core as Eff

data POp : Type -> Type where
  P : Int -> POp Int

main : Int
main = runPure (handle (perform P 3) {
  P n k -> k (n + 1)
}
)
' || {
  echo "FAIL build(user)"
  sed 's/^/     /' "$tmp/user/build.log"
  fail=$((fail + 1))
}

PURE_WASM=$tmp/pure/out/main.wasm
CONSOLE_WASM=$tmp/console/out/main.wasm
USER_WASM=$tmp/user/out/main.wasm

if ! command -v node >/dev/null 2>&1; then
  echo "SKIP: node not found"
else
  # 默认配置：纯程序产物可直接编译；带 handler 的产物被拒绝（stack switching 未启用）。
  if [ -f "$PURE_WASM" ]; then
    out=$(node --no-warnings "$HERE/probe.mjs" "$PURE_WASM" 2>&1)
    expect_contains "default(pure)" "$out" "validate=true compile=ok"
    printf '     %s\n' "$out"
  else
    bad "default(pure)" "产物缺失"
  fi
  if [ -f "$CONSOLE_WASM" ]; then
    out=$(node --no-warnings "$HERE/probe.mjs" "$CONSOLE_WASM" 2>&1)
    expect_contains "default(console)" "$out" "validate=true compile=ok"
    printf '     %s\n' "$out"
  else
    bad "default(console)" "产物缺失"
  fi
  if [ -f "$USER_WASM" ]; then
    out=$(node --no-warnings "$HERE/probe.mjs" "$USER_WASM" 2>&1)
    expect_contains "default(user)" "$out" "validate=true compile=ok"
    printf '     %s\n' "$out"
  else
    bad "default(user)" "产物缺失"
  fi

  # 开 V8 实验特性：只报告，不判定（引擎侧进展与 Node 版本相关）。
  report='flagged=unavailable'
  if node --no-warnings --experimental-wasm-wasmfx -e '1' >/dev/null 2>&1; then
    report=$(node --no-warnings --experimental-wasm-wasmfx "$HERE/probe.mjs" "$PURE_WASM" "$CONSOLE_WASM" 2>&1)
  fi
  printf 'report: %s\n' "$(printf '%s' "$report" | tr '\n' '|' | sed 's/| *$//')"
fi

printf '%d passed, %d failed\n' "$pass" "$fail"
[ "$fail" -eq 0 ]