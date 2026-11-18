#!/bin/sh
# vuna fmt 格式化器自测。
#
# 结构（本目录）：
#   *.vuna + *.fmt          —— 格式化 golden：format 结果与 .fmt 逐字节一致，
#                              且 format→parse→format 幂等（fmt --check）。
#   run/*.vuna + *.out      —— 纯程序：格式化前后 compile（目录式 + build.sh）产物运行输出一致且等于 golden。
#   typed/*.vuna + *.out    —— 编译期语义程序（辅助函数 / 自递归，定义都在顶层）：
#                              格式化前后 compile（目录式 + build.sh）产物运行输出一致且等于 golden。
#
# 环境变量：
#   VUNA       验证编译器，默认 <repo>/.local/m11/vuna
#   OCAMLOPT   OCaml 编译器，默认 ocamlopt
#   VUNA_BASE  base 包目录（本脚本的临时包与无 manifest 文件用它定位 base）
set -u
# 行宽按字节计数（与 fmt 的 strWidth 一致）；固定 locale，避免本地 UTF-8 与 CI
# POSIX 下 awk 的 length 一个按字符、一个按字节。
LC_ALL=C
export LC_ALL

HERE=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd) || exit 1
REPO=$(CDPATH= cd -- "$HERE/../../../../.." && pwd) || exit 1

: "${VUNA:=$REPO/.local/m11/vuna}"
: "${OCAMLOPT:=ocamlopt}"
# base 位置经 VUNA_BASE 交给无 manifest 的文件；包上下文下不需要 `--root`。
: "${VUNA_BASE:=$REPO/base}"
export VUNA_BASE

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

# ---- 直接用产品 CLI ----
# 三个动作分别映射为：复制+fmt、fmt --check、fmt 后读回。
# 这样格式化器自测不必冷编译整棵工具链。
fmt_write() { # src dst
  cp "$1" "$2" || return 1
  "$VUNA" fmt "$2" >/dev/null 2>&1
}
fmt_check() {
  local out="$tmp/fmt-check.vuna"
  cp "$1" "$out" || return 1
  "$VUNA" fmt "$out" >/dev/null 2>&1 || return 1
  "$VUNA" fmt --check "$out" >/dev/null 2>&1
}
fmt_text() { # src
  local out="$tmp/fmt-text.vuna"
  cp "$1" "$out" || return 1
  "$VUNA" fmt "$out" >/dev/null 2>&1 || return 1
  cat "$out"
}
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
  if ! fmt_check "$file" >"$tmp/check.log" 2>&1; then
    bad "$name (idempotent/reparse)"
    cat "$tmp/check.log"
  else
    ok
  fi
  if fmt_text "$file" >"$tmp/fmt.out" 2>"$tmp/fmt.err"; then
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

# ---- 1b) 行宽契约：golden 的代码行都不超过 maxWidth（100 列）。
#      例外与 1a 同理，都是「fmt 不决定内容」的行：
#        - 长字符串字面量按约定保持单行（拆开会改变内容），带 `"` 的行不参与；
#        - 注释行：fmt 只重排缩进、不回折正文，CJK 注释按字节算很容易越过 100。
for file in "$HERE"/*.fmt; do
  [ -f "$file" ] || continue
  over=$(awk 'length($0) > 100 && index($0, "\"") == 0 && $0 !~ /^[[:space:]]*--/ { print NR; exit }' "$file")
  if [ -n "$over" ]; then
    bad "$(basename "$file") (line $over exceeds 100 columns)"
  else
    ok
  fi
done

# ---- 2) 纯程序语义：格式化前后编译运行输出一致 ----
for file in "$HERE"/run/*.vuna; do
  [ -f "$file" ] || continue
  name=$(basename "$file")
  base=${file%.vuna}
  expected="$base.out"
  formatted="$tmp/run_$name"
  if ! fmt_write "$file" "$formatted" >"$tmp/write.log" 2>&1; then
    bad "$name (format)"
    cat "$tmp/write.log"
    continue
  fi
  if ! fmt_check "$file" >"$tmp/check.log" 2>&1; then
    bad "$name (idempotent/reparse)"
    cat "$tmp/check.log"
  else
    ok
  fi
  expected_text=$(cat "$expected")
  rm -rf "$tmp/r1" "$tmp/r1.exe"
  if ! ( cd "$REPO" && "$VUNA" compile "$file" "$tmp/r1" ) >"$tmp/r1.log" 2>&1; then
    bad "$name (compile)"
    cat "$tmp/r1.log"
    continue
  fi
  if ! ( cd "$tmp/r1" && OCAMLOPT="$OCAMLOPT" sh build.sh "$tmp/r1.exe" ) >"$tmp/r1.opt.log" 2>&1; then
    bad "$name (ocamlopt)"
    cat "$tmp/r1.opt.log"
    continue
  fi
  before=$("$tmp/r1.exe" 2>&1)
  check_eq "$name (run golden)" "$expected_text" "$before"
  rm -rf "$tmp/r2" "$tmp/r2.exe"
  if ! ( cd "$REPO" && "$VUNA" compile "$formatted" "$tmp/r2" ) >"$tmp/r2.log" 2>&1; then
    bad "$name (compile after format)"
    cat "$tmp/r2.log"
    continue
  fi
  if ! ( cd "$tmp/r2" && OCAMLOPT="$OCAMLOPT" sh build.sh "$tmp/r2.exe" ) >"$tmp/r2.opt.log" 2>&1; then
    bad "$name (ocamlopt after format)"
    cat "$tmp/r2.opt.log"
    continue
  fi
  after=$("$tmp/r2.exe" 2>&1)
  check_eq "$name (run after format)" "$before" "$after"
done

# ---- 3) typed codegen 语义：格式化前后编译运行输出一致 ----
for file in "$HERE"/typed/*.vuna; do
  [ -f "$file" ] || continue
  name=$(basename "$file")
  base=${file%.vuna}
  expected="$base.out"
  formatted="$tmp/typed_$name"
  if ! fmt_write "$file" "$formatted" >"$tmp/write.log" 2>&1; then
    bad "$name (format)"
    cat "$tmp/write.log"
    continue
  fi
  if ! fmt_check "$file" >"$tmp/check.log" 2>&1; then
    bad "$name (idempotent/reparse)"
    cat "$tmp/check.log"
  else
    ok
  fi
  expected_text=$(cat "$expected")
  # 原文件（compile 产目录 + build.sh，不产单文件 .ml）
  rm -rf "$tmp/t1" "$tmp/t1.exe"
  if ! ( cd "$REPO" && "$VUNA" compile "$file" "$tmp/t1" ) >"$tmp/t1.log" 2>&1; then
    bad "$name (typed compile)"
    cat "$tmp/t1.log"
    continue
  fi
  if ! ( cd "$tmp/t1" && OCAMLOPT="$OCAMLOPT" sh build.sh "$tmp/t1.exe" ) >"$tmp/t1.opt.log" 2>&1; then
    bad "$name (typed ocamlopt)"
    cat "$tmp/t1.opt.log"
    continue
  fi
  before=$("$tmp/t1.exe" 2>&1)
  check_eq "$name (typed golden)" "$expected_text" "$before"
  # 格式化后的文件
  rm -rf "$tmp/t2" "$tmp/t2.exe"
  if ! ( cd "$REPO" && "$VUNA" compile "$formatted" "$tmp/t2" ) >"$tmp/t2.log" 2>&1; then
    bad "$name (typed compile after format)"
    cat "$tmp/t2.log"
    continue
  fi
  if ! ( cd "$tmp/t2" && OCAMLOPT="$OCAMLOPT" sh build.sh "$tmp/t2.exe" ) >"$tmp/t2.opt.log" 2>&1; then
    bad "$name (typed ocamlopt after format)"
    cat "$tmp/t2.opt.log"
    continue
  fi
  after=$("$tmp/t2.exe" 2>&1)
  check_eq "$name (typed run after format)" "$before" "$after"
done

printf 'fmt: %d passed, %d failed\n' "$pass" "$fail"
[ "$fail" -eq 0 ]
