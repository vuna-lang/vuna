#!/bin/sh
# JS 宿主（Node / V8）的冒烟：同一份 .wasm 在 `test/suite/fixtures/wasm_js_host/run.mjs` 上跑。
#
# 用法：sh smoke.sh <path-to-vuna>
#   环境：VUNA_BASE（vuna-base 目录，默认 <repo>/base）
#
# 覆盖：
#   1) 不引用 handler 的产物（无 `cont`）：宿主 stdout 与 wasmtime 同口径；
#   2) 带 handler 的产物（入口行非空）：默认引擎拒绝编译，runner 以 exit 2 报同一原因；
#   3) 运行时失败经 `$rt_failStr` 走 guest 自己的文本 + exit 2（宿主不重写）。
#
# 缺 Node 时打印 SKIP，摘要行照常输出。

set -u

[ "$#" -ge 1 ] || {
  echo "usage: sh smoke.sh <path-to-vuna>" >&2
  exit 2
}
VUNA=$1
[ -x "$VUNA" ] || {
  echo "smoke: not an executable vuna: $VUNA" >&2
  exit 2
}

HERE=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
REPO=$(CDPATH= cd -- "$HERE/../../../.." && pwd)
VUNA_BASE=${VUNA_BASE:-$REPO/base}
RUNNER=$HERE/run.mjs

tmp=$(mktemp -d "${TMPDIR:-/tmp}/wjs.XXXXXX") || exit 1
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

# expect_output <label> <expected> <actual>
expect_output() {
  if [ "$2" = "$3" ]; then ok "$1"; else bad "$1" "期望:
$2
实际:
$3"; fi
}

build_pkg() {
  mkdir -p "$1/app" || return 1
  printf '[package]\nname = "%s"\n\n[dependencies]\nvuna-base = "%s"\n' "$2" "$VUNA_BASE" >"$1/vuna.toml"
  printf '%s' "$3" >"$1/app/Main.vuna"
  (cd "$1" && "$VUNA" build --target wasm --out "$1/out" . >"$1/build.log" 2>&1)
}

if ! command -v node >/dev/null 2>&1; then
  echo "SKIP: node not found"
  printf '%d passed, %d failed\n' "$pass" "$fail"
  exit 0
fi

WORK=$tmp/work

# 1) 纯程序：无续延运行时，V8 直接跑。
build_pkg "$tmp/pure" "pure" 'main : String
main = "js host " ++ "ok"
' || bad "build(pure)" "$(cat "$tmp/pure/build.log")"
out=$(node "$RUNNER" "$tmp/pure/out/main.wasm" 2>&1)
code=$?
expect_output "pure/stdout" '"js host ok"' "$out"
expect_output "pure/exit" "0" "$code"
if grep -q 'cont \$cft' "$tmp/pure/out/main.wat"; then
  bad "pure/no-cont" "产物仍含续延类型"
else
  ok "pure/no-cont"
fi

# 2) 入口行非空：产物带续延，默认引擎拒绝编译。
build_pkg "$tmp/effect" "effect" 'import Base.Eff
import Base.EffConsole
import Base.Nat

main : Eff [ConsoleOp] Nat
main = consolePrint "hi"
' || bad "build(effect)" "$(cat "$tmp/effect/build.log")"
out=$(node "$RUNNER" "$tmp/effect/out/main.wasm" 2>&1)
code=$?
case "$out" in
  *"stack switching not enabled"*) ok "effect/rejected" ;;
  *) bad "effect/rejected" "$out" ;;
esac
expect_output "effect/exit" "2" "$code"

# 3) guest 自己的失败文本 + exit 2。
build_pkg "$tmp/fail" "fail" 'main : Int
main = prim_fail "boom"
' || bad "build(fail)" "$(cat "$tmp/fail/build.log")"
out=$(node "$RUNNER" "$tmp/fail/out/main.wasm" 2>&1)
code=$?
expect_output "fail/stderr" "vuna: runtime error: boom" "$out"
expect_output "fail/exit" "2" "$code"

printf '%d passed, %d failed\n' "$pass" "$fail"
[ "$fail" -eq 0 ]