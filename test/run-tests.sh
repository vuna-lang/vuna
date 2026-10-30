#!/bin/sh
# vuna 原生测试：只用 vuna-interp / vuna / vuna-boot 驱动。
#
# 环境变量（默认取 PATH 中的同名命令）：
#   VUNA        当前编译器（stage 2）
#   VUNA_BOOT   种子编译器（stage 1）
#   VUNA_INTERP 解释器
#   OCAMLOPT    OCaml 编译器，默认 ocamlopt
set -u

cd "$(dirname "$0")"

: "${VUNA:=vuna}"
: "${VUNA_BOOT:=vuna-boot}"
: "${VUNA_INTERP:=vuna-interp}"
: "${OCAMLOPT:=ocamlopt}"

tmp=$(mktemp -d "${TMPDIR:-/tmp}/vuna-tests.XXXXXX") || exit 1
trap 'rm -rf "$tmp"' EXIT INT TERM

pass=0
fail=0

ok() { pass=$((pass + 1)); }

bad() {
  fail=$((fail + 1))
  printf 'FAIL: %s\n' "$1"
  if [ "$#" -ge 3 ]; then
    printf '  expected: %s\n' "$2"
    printf '  actual:   %s\n' "$3"
  fi
}

check_eq() { # name expected actual
  if [ "$2" = "$3" ]; then ok; else bad "$1" "$2" "$3"; fi
}

check_contains() { # name haystack needle
  case "$2" in
    *"$3"*) ok ;;
    *) bad "$1" "(contains) $3" "$2" ;;
  esac
}

compile_and_run() { # name compiler root entry expected
  name=$1
  compiler=$2
  root=$3
  entry=$4
  expected=$5
  out="$tmp/prog.ml"
  exe="$tmp/prog.exe"
  rm -f "$out" "$exe"

  if ! compile_output=$("$compiler" --root "$root" "$entry" "$out" 2>&1); then
    bad "$name compile" "exit 0" "$compile_output"
    return
  fi
  if [ -n "$compile_output" ]; then
    bad "$name compile output" "" "$compile_output"
    return
  fi
  if ! "$OCAMLOPT" -w -a -o "$exe" "$out" >"$tmp/ocamlopt.log" 2>&1; then
    bad "$name ocamlopt" "" "$(cat "$tmp/ocamlopt.log")"
    return
  fi
  actual=$("$exe" 2>&1)
  check_eq "$name run" "$expected" "$actual"
}

# 1) corpus：解释器输出 vs golden；编译器生成→ocamlopt→运行 vs golden
for file in corpus/run/*.vuna; do
  base=${file%.vuna}
  expected=$(cat "$base.out")
  actual=$("$VUNA_INTERP" "$file" 2>&1)
  check_eq "$file (interp)" "$expected" "$actual"
  compile_and_run "$file (compiler)" "$VUNA" "." "$file" "$expected"
done

# 2) 模块夹具：解释器与编译器都要读取模块并得到 expected.out
for dir in corpus/modules/0*; do
  expected=$(cat "$dir/expected.out")
  actual=$("$VUNA_INTERP" --root "$dir/lib" "$dir/app/Main.vuna" 2>&1)
  check_eq "$dir (interp)" "$expected" "$actual"
  compile_and_run "$dir (compiler)" "$VUNA" "$dir/lib" "$dir/app/Main.vuna" "$expected"
done

# 3) 模块错误：解释器与编译器都要给出含片段的错误，且不写输出文件
for dir in corpus/modules/9*; do
  fragment=$(cat "$dir/expected.err")
  actual=$("$VUNA_INTERP" --root "$dir/lib" "$dir/app/Main.vuna" 2>&1)
  check_contains "$dir (interp error)" "$actual" "$fragment"
  rm -f "$tmp/error.ml"
  actual=$("$VUNA" --root "$dir/lib" "$dir/app/Main.vuna" "$tmp/error.ml" 2>&1 || true)
  check_contains "$dir (compiler error)" "$actual" "$fragment"
  if [ -e "$tmp/error.ml" ]; then
    bad "$dir (no output file)" "absent" "present"
  else
    ok
  fi
done

# 4) 解析错误：vuna-interp 输出含片段
for file in corpus/err/*.vuna; do
  fragment=$(cat "${file%.vuna}.err")
  actual=$("$VUNA_INTERP" "$file" 2>&1)
  check_contains "$file (parse error)" "$actual" "$fragment"
done

# 5) 求值/编译错误：解释器与编译器要给出含片段的错误
for file in corpus/run_err/*.vuna; do
  case "$file" in
    *08_clause_arity*) continue ;;
  esac
  fragment=$(cat "${file%.vuna}.err")
  actual=$("$VUNA_INTERP" "$file" 2>&1)
  check_contains "$file (interp error)" "$actual" "$fragment"
done

# 6) 编译器专属错误：clause 元数不一致（解释器不检查，编译器要报）
arity_out=$("$VUNA" --no-typecheck corpus/run_err/08_clause_arity.vuna "$tmp/arity.ml" 2>&1 || true)
check_contains "08_clause_arity (compiler error)" "$arity_out" "clauses for f have different arities"

# 7) 类型检查通过的程序：--typecheck 编译、运行、比对 golden
for file in corpus/type_ok/*.vuna; do
  base=${file%.vuna}
  rm -f "$tmp/typed.ml" "$tmp/typed.exe"
  if ! type_out=$("$VUNA" --typecheck "$file" "$tmp/typed.ml" 2>&1); then
    bad "$file (typecheck)" "exit 0" "$type_out"
  elif [ -n "$type_out" ]; then
    bad "$file (typecheck output)" "" "$type_out"
  elif ! "$OCAMLOPT" -w -a -o "$tmp/typed.exe" "$tmp/typed.ml" >"$tmp/typed.log" 2>&1; then
    bad "$file (typed ocamlopt)" "" "$(cat "$tmp/typed.log")"
  else
    actual=$("$tmp/typed.exe" 2>&1)
    check_eq "$file (typed run)" "$(cat "$base.out")" "$actual"
  fi
done

# 8) 类型错误：--typecheck 必须报含片段的错误，且不写输出文件
for file in corpus/type_err/*.vuna; do
  fragment=$(cat "${file%.vuna}.err")
  rm -f "$tmp/type_err.ml"
  actual=$("$VUNA" --typecheck "$file" "$tmp/type_err.ml" 2>&1 || true)
  check_contains "$file (type error)" "$actual" "$fragment"
  if [ -e "$tmp/type_err.ml" ]; then
    bad "$file (no output file)" "absent" "present"
  else
    ok
  fi
done

# 9) 跨模块类型检查正例：导入模块后用其类型与构造器
for dir in corpus/type_modules/0*; do
  rm -f "$tmp/tm.ml" "$tmp/tm.exe"
  if ! tm_out=$("$VUNA" --typecheck --root "$dir/lib" "$dir/app/Main.vuna" "$tmp/tm.ml" 2>&1); then
    bad "$dir (module typecheck)" "exit 0" "$tm_out"
  elif [ -n "$tm_out" ]; then
    bad "$dir (module typecheck output)" "" "$tm_out"
  elif ! "$OCAMLOPT" -w -a -o "$tmp/tm.exe" "$tmp/tm.ml" >"$tmp/tm.log" 2>&1; then
    bad "$dir (module typed ocamlopt)" "" "$(cat "$tmp/tm.log")"
  else
    actual=$("$tmp/tm.exe" 2>&1)
    check_eq "$dir (module typed run)" "$(cat "$dir/expected.out")" "$actual"
  fi
done

# 10) 跨模块类型错误
for dir in corpus/type_modules/9*; do
  fragment=$(cat "$dir/expected.err")
  rm -f "$tmp/tm_err.ml"
  actual=$("$VUNA" --typecheck --root "$dir/lib" "$dir/app/Main.vuna" "$tmp/tm_err.ml" 2>&1 || true)
  check_contains "$dir (module type error)" "$actual" "$fragment"
  if [ -e "$tmp/tm_err.ml" ]; then
    bad "$dir (no output file)" "absent" "present"
  else
    ok
  fi
done

# 11) typed codegen（M8a）：--typed 生成原生 OCaml，编译运行并比对 golden
for file in corpus/typed_ok/*.vuna; do
  base=${file%.vuna}
  rm -f "$tmp/typedgen.ml" "$tmp/typedgen.exe"
  if ! typed_out=$("$VUNA" --typed "$file" "$tmp/typedgen.ml" 2>&1); then
    bad "$file (typed codegen)" "exit 0" "$typed_out"
  elif [ -n "$typed_out" ]; then
    bad "$file (typed codegen output)" "" "$typed_out"
  elif ! "$OCAMLOPT" -w -a -o "$tmp/typedgen.exe" "$tmp/typedgen.ml" >"$tmp/typedgen.log" 2>&1; then
    bad "$file (typed ocamlopt)" "" "$(cat "$tmp/typedgen.log")"
  else
    actual=$("$tmp/typedgen.exe" 2>&1)
    check_eq "$file (typed run)" "$(cat "$base.out")" "$actual"
  fi
done

# 12) 跨模块 typed codegen：--typed --root lib 生成并运行
for dir in corpus/modules/0*; do
  [ -f "$dir/app/Main.vuna" ] || continue
  rm -f "$tmp/typedmod.ml" "$tmp/typedmod.exe"
  if ! typed_out=$("$VUNA" --typed --root "$dir/lib" "$dir/app/Main.vuna" "$tmp/typedmod.ml" 2>&1); then
    bad "$dir (typed module codegen)" "exit 0" "$typed_out"
  elif [ -n "$typed_out" ]; then
    bad "$dir (typed module codegen output)" "" "$typed_out"
  elif ! "$OCAMLOPT" -w -a -o "$tmp/typedmod.exe" "$tmp/typedmod.ml" >"$tmp/typedmod.log" 2>&1; then
    bad "$dir (typed module ocamlopt)" "" "$(cat "$tmp/typedmod.log")"
  else
    actual=$("$tmp/typedmod.exe" 2>&1)
    check_eq "$dir (typed module run)" "$(cat "$dir/expected.out")" "$actual"
  fi
done

# 13) 种子冒烟：vuna-boot 编译一个程序并运行
fact=corpus/run/12_fact.vuna
compile_and_run "$fact (vuna-boot)" "$VUNA_BOOT" "." "$fact" "$(cat "${fact%.vuna}.out")"

if [ "$fail" -ne 0 ]; then
  printf '%s passed, %s failed\n' "$pass" "$fail"
  exit 1
fi
printf 'vuna tests passed (%s checks)\n' "$pass"
