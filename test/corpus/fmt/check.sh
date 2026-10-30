#!/bin/sh
# vuna fmt 格式化器自测。
#
# 结构（本目录）：
#   *.vuna + *.fmt          —— 格式化 golden：format 结果与 .fmt 逐字节一致，
#                              且 format→parse→format 幂等（probe check）。
#   run/*.vuna + *.out      —— 可解释程序：格式化前后 `vuna interp` 输出一致且等于 golden。
#   typed/*.vuna + *.out    —— typed codegen 程序（覆盖 where 等解释器不支持的构造）：
#                              格式化前后 --typed 生成、ocamlopt 编译、运行输出一致且等于 golden。
#   _probe.vuna             —— 探针源码（下划线开头，不当作输入），由本脚本用 VUNA 编译。
#
# 环境变量：
#   VUNA       验证编译器，默认 <repo>/.local/m11/vuna
#   OCAMLOPT   OCaml 编译器，默认 ocamlopt
set -u

HERE=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd) || exit 1
REPO=$(CDPATH= cd -- "$HERE/../../.." && pwd) || exit 1

: "${VUNA:=$REPO/.local/m11/vuna}"
: "${OCAMLOPT:=ocamlopt}"

tmp=$(mktemp -d "${TMPDIR:-/tmp}/vuna-fmt.XXXXXX") || exit 1
trap 'chmod -R u+w "$tmp" 2>/dev/null; rm -rf "$tmp" 2>/dev/null' EXIT INT TERM

pass=0
fail=0

ok() { pass=$((pass + 1)); }

bad() {
  fail=$((fail + 1))
  printf 'FAIL: %s\n' "$1"
}

check_eq() { # name expected actual
  if [ "$2" = "$3" ]; then ok; else bad "$1"; printf '  expected: %s\n  actual:   %s\n' "$2" "$3"; fi
}

# ---- 合并模块根（lib/Vuna + stdlib 的 Vuna/*.vuna），编译探针 ----
# 只用一个 --root，兼容 CLI 的 --root 语义变化与 stdlib 包布局（stdlib/Vuna 或 stdlib/lib/Vuna）。
mkdir -p "$tmp/root"
cp -r "$REPO/lib/Vuna" "$tmp/root/Vuna"
if [ -d "$REPO/stdlib/lib/Vuna" ]; then
  cp "$REPO/stdlib/lib/Vuna"/*.vuna "$tmp/root/Vuna/"
elif [ -d "$REPO/stdlib/Vuna" ]; then
  cp "$REPO/stdlib/Vuna"/*.vuna "$tmp/root/Vuna/"
fi
chmod -R u+w "$tmp/root" 2>/dev/null || true
cp "$HERE/_probe.vuna" "$tmp/probe.vuna"
if ! ( cd "$REPO" && "$VUNA" --typecheck --no-print --root "$tmp/root" "$tmp/probe.vuna" "$tmp/probe.ml" ) >"$tmp/probe.log" 2>&1; then
  echo "fmt: probe compile failed:"
  cat "$tmp/probe.log"
  exit 1
fi
if ! "$OCAMLOPT" -w -a -o "$tmp/probe.exe" "$tmp/probe.ml" >"$tmp/probe.opt.log" 2>&1; then
  echo "fmt: probe ocamlopt failed:"
  cat "$tmp/probe.opt.log"
  exit 1
fi
probe="$tmp/probe.exe"

# ---- 1) 格式化 golden + 幂等 ----
for file in "$HERE"/*.vuna; do
  [ -f "$file" ] || continue
  name=$(basename "$file")
  case "$name" in
    _*) continue ;;
  esac
  base=${file%.vuna}
  expected="$base.fmt"
  if [ ! -f "$expected" ]; then
    bad "$name (missing $(basename "$expected"))"
    continue
  fi
  if ! "$probe" check "$file" >"$tmp/check.log" 2>&1; then
    bad "$name (idempotent/reparse)"
    cat "$tmp/check.log"
  else
    ok
  fi
  if "$probe" fmt "$file" >"$tmp/fmt.out" 2>"$tmp/fmt.err"; then
    if cmp -s "$expected" "$tmp/fmt.out"; then
      ok
    else
      bad "$name (golden)"
      diff -u "$expected" "$tmp/fmt.out" | head -60
    fi
  else
    bad "$name (format)"
    cat "$tmp/fmt.err"
  fi
done

# ---- 2) 解释器语义：格式化前后 interp 输出一致 ----
for file in "$HERE"/run/*.vuna; do
  [ -f "$file" ] || continue
  name=$(basename "$file")
  base=${file%.vuna}
  expected="$base.out"
  formatted="$tmp/run_$name"
  if ! "$probe" write "$file" "$formatted" >"$tmp/write.log" 2>&1; then
    bad "$name (format)"
    cat "$tmp/write.log"
    continue
  fi
  if ! "$probe" check "$file" >"$tmp/check.log" 2>&1; then
    bad "$name (idempotent/reparse)"
    cat "$tmp/check.log"
  else
    ok
  fi
  before=$(cd "$REPO" && "$VUNA" interp "$file" 2>&1)
  after=$(cd "$REPO" && "$VUNA" interp "$formatted" 2>&1)
  expected_text=$(cat "$expected")
  check_eq "$name (interp golden)" "$expected_text" "$before"
  check_eq "$name (interp after format)" "$before" "$after"
done

# ---- 3) typed codegen 语义：格式化前后编译运行输出一致 ----
for file in "$HERE"/typed/*.vuna; do
  [ -f "$file" ] || continue
  name=$(basename "$file")
  base=${file%.vuna}
  expected="$base.out"
  formatted="$tmp/typed_$name"
  if ! "$probe" write "$file" "$formatted" >"$tmp/write.log" 2>&1; then
    bad "$name (format)"
    cat "$tmp/write.log"
    continue
  fi
  if ! "$probe" check "$file" >"$tmp/check.log" 2>&1; then
    bad "$name (idempotent/reparse)"
    cat "$tmp/check.log"
  else
    ok
  fi
  expected_text=$(cat "$expected")
  # 原文件
  rm -f "$tmp/t1.ml" "$tmp/t1.exe"
  if ! ( cd "$REPO" && "$VUNA" --typed "$file" "$tmp/t1.ml" ) >"$tmp/t1.log" 2>&1; then
    bad "$name (typed compile)"
    cat "$tmp/t1.log"
    continue
  fi
  if ! "$OCAMLOPT" -w -a -o "$tmp/t1.exe" "$tmp/t1.ml" >"$tmp/t1.opt.log" 2>&1; then
    bad "$name (typed ocamlopt)"
    cat "$tmp/t1.opt.log"
    continue
  fi
  before=$("$tmp/t1.exe" 2>&1)
  check_eq "$name (typed golden)" "$expected_text" "$before"
  # 格式化后的文件
  rm -f "$tmp/t2.ml" "$tmp/t2.exe"
  if ! ( cd "$REPO" && "$VUNA" --typed "$formatted" "$tmp/t2.ml" ) >"$tmp/t2.log" 2>&1; then
    bad "$name (typed compile after format)"
    cat "$tmp/t2.log"
    continue
  fi
  if ! "$OCAMLOPT" -w -a -o "$tmp/t2.exe" "$tmp/t2.ml" >"$tmp/t2.opt.log" 2>&1; then
    bad "$name (typed ocamlopt after format)"
    cat "$tmp/t2.opt.log"
    continue
  fi
  after=$("$tmp/t2.exe" 2>&1)
  check_eq "$name (typed run after format)" "$before" "$after"
done

printf 'fmt: %d passed, %d failed\n' "$pass" "$fail"
[ "$fail" -eq 0 ]
