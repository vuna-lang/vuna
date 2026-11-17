#!/bin/sh
# JS 宿主（Node / V8）的冒烟：同一份 .wasm 在 `test/suite/fixtures/wasm_js_host/run.mjs` 上跑。
#
# 用法：sh smoke.sh <path-to-vuna>
#   环境：VUNA_BASE（vuna-base 目录，默认 <repo>/base）
#
# 覆盖：
#   1) 纯程序（无 `cont`）：宿主 stdout 与 wasmtime 同口径；
#   2) 入口行只有内建宿主效应（无用户 handler）：send 直接降成宿主调用，同样无 `cont`；
#   3) 用户自定义 handler：CPS lowering 后默认引擎可直接运行；
#   4) 运行时失败经 `$rt_failStr` 走 guest 自己的文本 + exit 2（宿主不重写）。
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

# 2) 入口行只有内建宿主效应：send 直连宿主原语，产物无续延，默认引擎可跑。
build_pkg "$tmp/host" "host" 'import Base.Eff
import Base.EffConsole
import Base.Nat

main : Eff [ConsoleOp] Nat
main = consolePrint "hi"
' || bad "build(host)" "$(cat "$tmp/host/build.log")"
out=$(node "$RUNNER" "$tmp/host/out/main.wasm" 2>&1)
code=$?
expect_output "host/stdout" 'hi2' "$out"
expect_output "host/exit" "0" "$code"
if grep -q 'cont \$cft' "$tmp/host/out/main.wat"; then
  bad "host/no-cont" "产物仍含续延类型"
else
  ok "host/no-cont"
fi

# 3) 用户自定义 handler：仍需要 stack switching，默认引擎拒绝编译。
build_pkg "$tmp/user" "user" 'import Base.Eff

data POp : Type -> Type where
  P : Int -> POp Int

main : Int
main = runPure (handle (perform P 3) {
  P n k -> k (n + 1)
}
)
' || bad "build(user)" "$(cat "$tmp/user/build.log")"
out=$(node "$RUNNER" "$tmp/user/out/main.wasm" 2>&1)
code=$?
expect_output "user/stdout" "4" "$out"
expect_output "user/exit" "0" "$code"
if grep -q 'cont \$cft' "$tmp/user/out/main.wat"; then
  bad "user/no-cont" "产物仍含续延类型"
else
  ok "user/no-cont"
fi

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