#!/bin/sh
# vuna 原生测试：只用 vuna / vuna-boot 驱动。
#
# 环境变量（默认取 PATH 中的同名命令）：
#   VUNA        当前编译器（stage 1）
#   VUNA_BOOT   种子编译器（stage 0）
#   OCAMLOPT    OCaml 编译器，默认 ocamlopt
set -u

cd "$(dirname "$0")"

: "${VUNA:=vuna}"
: "${VUNA_BOOT:=vuna-boot}"
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

compile_and_run_roots() { # name compiler entry expected root...
  name=$1
  compiler=$2
  entry=$3
  expected=$4
  shift 4
  out="$tmp/prog.ml"
  exe="$tmp/prog.exe"
  rm -f "$out" "$exe"

  if ! compile_output=$("$compiler" "$@" "$entry" "$out" 2>&1); then
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

compile_and_run() { # name compiler root entry expected
  compile_and_run_roots "$1" "$2" "$4" "$5" --root "$3"
}

# 1) corpus：解释器输出 vs golden；编译器生成→ocamlopt→运行 vs golden
for file in corpus/run/*.vuna; do
  base=${file%.vuna}
  expected=$(cat "$base.out")
  actual=$("$VUNA" interp "$file" 2>&1)
  check_eq "$file (interp)" "$expected" "$actual"
  compile_and_run "$file (compiler)" "$VUNA" "." "$file" "$expected"
done

# 2) 模块夹具：解释器与动态 codegen 都要读取模块并得到 expected.out（正例 01–29；
#    typed codegen 由第 12 段单独覆盖）
for dir in corpus/modules/[012][0-9]_*; do
  expected=$(cat "$dir/expected.out")
  actual=$("$VUNA" interp --root "$dir/lib" --root "$dir/app" "$dir/app/Main.vuna" 2>&1)
  check_eq "$dir (interp)" "$expected" "$actual"
  compile_and_run_roots "$dir (compiler)" "$VUNA" "$dir/app/Main.vuna" "$expected" --no-typecheck --root "$dir/lib" --root "$dir/app"
done

# 3) 模块错误：解释器 / 动态 codegen / typed codegen 三条路径都要因同一原因失败、
#    给出含片段的错误，且不写输出文件（错误例 70–99）
for dir in corpus/modules/[789][0-9]_*; do
  fragment=$(cat "$dir/expected.err")
  actual=$("$VUNA" interp --root "$dir/lib" --root "$dir/app" "$dir/app/Main.vuna" 2>&1)
  check_contains "$dir (interp error)" "$actual" "$fragment"
  rm -f "$tmp/error.ml"
  actual=$("$VUNA" --no-typecheck --root "$dir/lib" --root "$dir/app" "$dir/app/Main.vuna" "$tmp/error.ml" 2>&1 || true)
  check_contains "$dir (dynamic compiler error)" "$actual" "$fragment"
  if [ -e "$tmp/error.ml" ]; then
    bad "$dir (dynamic no output file)" "absent" "present"
  else
    ok
  fi
  rm -f "$tmp/error_typed.ml"
  typed_err=$("$VUNA" --typed --root "$dir/lib" --root "$dir/app" "$dir/app/Main.vuna" "$tmp/error_typed.ml" 2>&1)
  typed_code=$?
  check_contains "$dir (typed error)" "$typed_err" "$fragment"
  if [ "$typed_code" -ne 0 ]; then ok; else bad "$dir (typed error exit)" "non-zero" "$typed_code"; fi
  if [ -e "$tmp/error_typed.ml" ]; then
    bad "$dir (typed no output file)" "absent" "present"
  else
    ok
  fi
done

# 4) 解析错误：vuna interp 输出含片段
for file in corpus/err/*.vuna; do
  fragment=$(cat "${file%.vuna}.err")
  actual=$("$VUNA" interp "$file" 2>&1)
  check_contains "$file (parse error)" "$actual" "$fragment"
done

# 5) 求值/编译错误：解释器与编译器要给出含片段的错误
for file in corpus/run_err/*.vuna; do
  case "$file" in
    *08_clause_arity*) continue ;;
  esac
  fragment=$(cat "${file%.vuna}.err")
  actual=$("$VUNA" interp "$file" 2>&1)
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
for dir in corpus/modules/[012][0-9]_*; do
  [ -f "$dir/app/Main.vuna" ] || continue
  rm -f "$tmp/typedmod.ml" "$tmp/typedmod.exe"
  if ! typed_out=$("$VUNA" --typed --root "$dir/lib" --root "$dir/app" "$dir/app/Main.vuna" "$tmp/typedmod.ml" 2>&1); then
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

# 14) 统一 CLI：help、退出码、旧式 compile 兼容
help_out=$("$VUNA" help 2>&1)
check_contains "vuna help" "$help_out" "usage:"
"$VUNA" >/dev/null 2>&1
check_eq "vuna no args exit" "2" "$?"
"$VUNA" --root lib corpus/run/01_arithmetic.vuna >/dev/null 2>&1
check_eq "vuna legacy compile exit" "0" "$?"
"$VUNA" --root lib corpus/err/01_case_indent.vuna "$tmp/cli_err.ml" >/dev/null 2>&1
cli_code=$?
if [ "$cli_code" -ne 0 ]; then ok; else bad "vuna compile error exit" "non-zero" "$cli_code"; fi
"$VUNA" interp /no/such/file.vuna >/dev/null 2>&1
check_eq "vuna interp missing exit" "2" "$?"
"$VUNA" lint >/dev/null 2>&1
check_eq "vuna lint no args exit" "2" "$?"

# 15) lint 检测 golden 与退出码
for file in corpus/lint/*.vuna; do
  base=${file%.vuna}
  expected=$(cat "$base.out")
  actual=$("$VUNA" lint "$file" 2>&1)
  check_eq "$file (lint)" "$expected" "$actual"
  "$VUNA" lint "$file" >/dev/null 2>&1
  lint_code=$?
  if [ -n "$expected" ]; then
    check_eq "$file (lint exit)" "1" "$lint_code"
  else
    check_eq "$file (lint exit)" "0" "$lint_code"
  fi
done

# 16) lint --fix golden、退出码与幂等
for file in corpus/fix/*.vuna; do
  base=${file%.vuna}
  name=$(basename "$base")
  expected=$(cat "$base.expected")
  work="$tmp/fix_$name.vuna"
  once="$tmp/fix_once_$name.vuna"
  cp "$file" "$work"
  chmod u+w "$work"
  "$VUNA" lint --fix "$work" >/dev/null 2>&1
  check_eq "$file (fix)" "$expected" "$(cat "$work")"
  cp "$work" "$once"
  "$VUNA" lint --fix "$work" >/dev/null 2>&1
  check_eq "$file (fix idempotent)" "$(cat "$once")" "$(cat "$work")"
done

# 17) M9 诊断：运行时错误位置（行号）、穷尽性/冗余、退出码
mkdir -p "$tmp/m9"
cat > "$tmp/m9/loc.vuna" <<'EOF'
data Maybe : Type where
  Just : Int -> Maybe
  Nothing : Maybe

f : Maybe -> Int
f (Just x) = x

main : Int
main = f Nothing
EOF
loc_i=$("$VUNA" interp "$tmp/m9/loc.vuna" 2>&1)
check_contains "m9 interp location" "$loc_i" "$tmp/m9/loc.vuna:9:8: no matching clause"
"$VUNA" interp "$tmp/m9/loc.vuna" >/dev/null 2>&1
m9_interp_code=$?
if [ "$m9_interp_code" -ne 0 ]; then ok; else bad "m9 interp runtime exit" "non-zero" "$m9_interp_code"; fi
rm -f "$tmp/m9/loc.ml" "$tmp/m9/loc.exe"
if ! "$VUNA" --typed "$tmp/m9/loc.vuna" "$tmp/m9/loc.ml" >/dev/null 2>&1; then
  bad "m9 typed codegen" "exit 0" "compile failed"
elif ! "$OCAMLOPT" -w -a -o "$tmp/m9/loc.exe" "$tmp/m9/loc.ml" >/dev/null 2>&1; then
  bad "m9 typed ocamlopt" "" "ocamlopt failed"
else
  loc_c=$("$tmp/m9/loc.exe" 2>&1)
  check_contains "m9 typed location" "$loc_c" "$tmp/m9/loc.vuna:6:1: no matching clause"
  "$tmp/m9/loc.exe" >/dev/null 2>&1
  m9_run_code=$?
  if [ "$m9_run_code" -ne 0 ]; then ok; else bad "m9 typed runtime exit" "non-zero" "$m9_run_code"; fi
fi

cat > "$tmp/m9/ne_case.vuna" <<'EOF'
data Maybe : Type where
  Just : Int -> Maybe
  Nothing : Maybe

g : Maybe -> Int
g x = case x of
  Just a => a

main : Int
main = g Nothing
EOF
ne=$("$VUNA" check "$tmp/m9/ne_case.vuna" 2>&1)
check_contains "m9 non-exhaustive case" "$ne" "non-exhaustive case"

cat > "$tmp/m9/ne_fun.vuna" <<'EOF'
data Maybe : Type where
  Just : Int -> Maybe
  Nothing : Maybe

f : Maybe -> Int
f (Just x) = x

main : Int
main = f Nothing
EOF
nef=$("$VUNA" check "$tmp/m9/ne_fun.vuna" 2>&1)
check_contains "m9 non-exhaustive function" "$nef" "non-exhaustive function clauses"

cat > "$tmp/m9/red.vuna" <<'EOF'
data B : Type where
  T : B
  F : B

g : B -> Int
g x = case x of
  T => 1
  _ => 0
  F => 2

main : Int
main = g T
EOF
rd=$("$VUNA" check "$tmp/m9/red.vuna" 2>&1)
check_contains "m9 redundant pattern" "$rd" "redundant pattern"

cat > "$tmp/m9/ok.vuna" <<'EOF'
data Maybe : Type where
  Just : Int -> Maybe
  Nothing : Maybe

g : Maybe -> Int
g x = case x of
  Just a => a
  Nothing => 0

main : Int
main = g Nothing
EOF
okw=$("$VUNA" check "$tmp/m9/ok.vuna" 2>&1)
check_eq "m9 exhaustive clean" "" "$okw"

cat > "$tmp/m9/type_err.vuna" <<'EOF'
main : Int
main = "oops"
EOF
"$VUNA" check "$tmp/m9/type_err.vuna" >/dev/null 2>&1
m9_check_code=$?
if [ "$m9_check_code" -ne 0 ]; then ok; else bad "m9 check type err exit" "non-zero" "$m9_check_code"; fi
"$VUNA" --typecheck "$tmp/m9/type_err.vuna" "$tmp/m9/type_err.ml" >/dev/null 2>&1
m9_compile_code=$?
if [ "$m9_compile_code" -ne 0 ]; then ok; else bad "m9 compile type err exit" "non-zero" "$m9_compile_code"; fi

# 18) 记录正例（M10.5 Phase R）：interp / 动态 codegen / typed codegen 三路径
for file in corpus/records/0*.vuna; do
  base=${file%.vuna}
  expected=$(cat "$base.out")
  actual=$("$VUNA" interp "$file" 2>&1)
  check_eq "$file (record interp)" "$expected" "$actual"
  rm -f "$tmp/rec_dyn.ml" "$tmp/rec_dyn.exe"
  if ! rec_out=$("$VUNA" --no-typecheck "$file" "$tmp/rec_dyn.ml" 2>&1); then
    bad "$file (record dynamic codegen)" "exit 0" "$rec_out"
  elif [ -n "$rec_out" ]; then
    bad "$file (record dynamic codegen output)" "" "$rec_out"
  elif ! "$OCAMLOPT" -w -a -o "$tmp/rec_dyn.exe" "$tmp/rec_dyn.ml" >"$tmp/rec_dyn.log" 2>&1; then
    bad "$file (record dynamic ocamlopt)" "" "$(cat "$tmp/rec_dyn.log")"
  else
    actual=$("$tmp/rec_dyn.exe" 2>&1)
    check_eq "$file (record dynamic run)" "$expected" "$actual"
  fi
  rm -f "$tmp/rec_typed.ml" "$tmp/rec_typed.exe"
  if ! rec_out=$("$VUNA" --typed "$file" "$tmp/rec_typed.ml" 2>&1); then
    bad "$file (record typed codegen)" "exit 0" "$rec_out"
  elif [ -n "$rec_out" ]; then
    bad "$file (record typed codegen output)" "" "$rec_out"
  elif ! "$OCAMLOPT" -w -a -o "$tmp/rec_typed.exe" "$tmp/rec_typed.ml" >"$tmp/rec_typed.log" 2>&1; then
    bad "$file (record typed ocamlopt)" "" "$(cat "$tmp/rec_typed.log")"
  else
    actual=$("$tmp/rec_typed.exe" 2>&1)
    check_eq "$file (record typed run)" "$expected" "$actual"
  fi
done

# 19) 记录错误（M10.5 Phase R）：interp / 动态 / typed 三路径都失败、含片段、不写输出文件
for file in corpus/records/9*.vuna; do
  fragment=$(cat "${file%.vuna}.err")
  actual=$("$VUNA" interp "$file" 2>&1)
  check_contains "$file (record interp error)" "$actual" "$fragment"
  "$VUNA" interp "$file" >/dev/null 2>&1
  rec_code=$?
  if [ "$rec_code" -ne 0 ]; then ok; else bad "$file (record interp error exit)" "non-zero" "$rec_code"; fi
  rm -f "$tmp/rec_err.ml"
  actual=$("$VUNA" --no-typecheck "$file" "$tmp/rec_err.ml" 2>&1)
  rec_code=$?
  check_contains "$file (record dynamic error)" "$actual" "$fragment"
  if [ "$rec_code" -ne 0 ]; then ok; else bad "$file (record dynamic error exit)" "non-zero" "$rec_code"; fi
  if [ -e "$tmp/rec_err.ml" ]; then
    bad "$file (record dynamic no output file)" "absent" "present"
  else
    ok
  fi
  rm -f "$tmp/rec_err_typed.ml"
  actual=$("$VUNA" --typed "$file" "$tmp/rec_err_typed.ml" 2>&1)
  rec_code=$?
  check_contains "$file (record typed error)" "$actual" "$fragment"
  if [ "$rec_code" -ne 0 ]; then ok; else bad "$file (record typed error exit)" "non-zero" "$rec_code"; fi
  if [ -e "$tmp/rec_err_typed.ml" ]; then
    bad "$file (record typed no output file)" "absent" "present"
  else
    ok
  fi
done

# 20) 跨模块记录正例：导出 Point(..) 可构造/模式匹配；导出 Point 保持抽象（三路径）
for dir in corpus/records/0*_*/; do
  dir=${dir%/}
  expected=$(cat "$dir/expected.out")
  actual=$("$VUNA" interp --root "$dir/lib" --root "$dir/app" "$dir/app/Main.vuna" 2>&1)
  check_eq "$dir (record module interp)" "$expected" "$actual"
  compile_and_run_roots "$dir (record module dynamic)" "$VUNA" "$dir/app/Main.vuna" "$expected" --no-typecheck --root "$dir/lib" --root "$dir/app"
  compile_and_run_roots "$dir (record module typed)" "$VUNA" "$dir/app/Main.vuna" "$expected" --typed --root "$dir/lib" --root "$dir/app"
done

# 21) 跨模块记录错误：抽象记录的构造器不可见（三路径都失败、含片段、不写输出文件）
for dir in corpus/records/9*_*/; do
  dir=${dir%/}
  fragment=$(cat "$dir/expected.err")
  actual=$("$VUNA" interp --root "$dir/lib" --root "$dir/app" "$dir/app/Main.vuna" 2>&1)
  check_contains "$dir (record module interp error)" "$actual" "$fragment"
  "$VUNA" interp --root "$dir/lib" --root "$dir/app" "$dir/app/Main.vuna" >/dev/null 2>&1
  rec_code=$?
  if [ "$rec_code" -ne 0 ]; then ok; else bad "$dir (record module interp error exit)" "non-zero" "$rec_code"; fi
  rm -f "$tmp/rec_mod_err.ml"
  actual=$("$VUNA" --no-typecheck --root "$dir/lib" --root "$dir/app" "$dir/app/Main.vuna" "$tmp/rec_mod_err.ml" 2>&1)
  rec_code=$?
  check_contains "$dir (record module dynamic error)" "$actual" "$fragment"
  if [ "$rec_code" -ne 0 ]; then ok; else bad "$dir (record module dynamic error exit)" "non-zero" "$rec_code"; fi
  if [ -e "$tmp/rec_mod_err.ml" ]; then
    bad "$dir (record module dynamic no output file)" "absent" "present"
  else
    ok
  fi
  rm -f "$tmp/rec_mod_err_typed.ml"
  actual=$("$VUNA" --typed --root "$dir/lib" --root "$dir/app" "$dir/app/Main.vuna" "$tmp/rec_mod_err_typed.ml" 2>&1)
  rec_code=$?
  check_contains "$dir (record module typed error)" "$actual" "$fragment"
  if [ "$rec_code" -ne 0 ]; then ok; else bad "$dir (record module typed error exit)" "non-zero" "$rec_code"; fi
  if [ -e "$tmp/rec_mod_err_typed.ml" ]; then
    bad "$dir (record module typed no output file)" "absent" "present"
  else
    ok
  fi
done

# 22) trait 正例（M10.5b）：interp / 动态 codegen / typed codegen 三路径
for file in corpus/traits/[01][0-9]_*.vuna; do
  base=${file%.vuna}
  expected=$(cat "$base.out")
  actual=$("$VUNA" interp "$file" 2>&1)
  check_eq "$file (trait interp)" "$expected" "$actual"
  rm -f "$tmp/tr_dyn.ml" "$tmp/tr_dyn.exe"
  if ! tr_out=$("$VUNA" --no-typecheck "$file" "$tmp/tr_dyn.ml" 2>&1); then
    bad "$file (trait dynamic codegen)" "exit 0" "$tr_out"
  elif [ -n "$tr_out" ]; then
    bad "$file (trait dynamic codegen output)" "" "$tr_out"
  elif ! "$OCAMLOPT" -w -a -o "$tmp/tr_dyn.exe" "$tmp/tr_dyn.ml" >"$tmp/tr_dyn.log" 2>&1; then
    bad "$file (trait dynamic ocamlopt)" "" "$(cat "$tmp/tr_dyn.log")"
  else
    actual=$("$tmp/tr_dyn.exe" 2>&1)
    check_eq "$file (trait dynamic run)" "$expected" "$actual"
  fi
  rm -f "$tmp/tr_typed.ml" "$tmp/tr_typed.exe"
  if ! tr_out=$("$VUNA" --typed "$file" "$tmp/tr_typed.ml" 2>&1); then
    bad "$file (trait typed codegen)" "exit 0" "$tr_out"
  elif [ -n "$tr_out" ]; then
    bad "$file (trait typed codegen output)" "" "$tr_out"
  elif ! "$OCAMLOPT" -w -a -o "$tmp/tr_typed.exe" "$tmp/tr_typed.ml" >"$tmp/tr_typed.log" 2>&1; then
    bad "$file (trait typed ocamlopt)" "" "$(cat "$tmp/tr_typed.log")"
  else
    actual=$("$tmp/tr_typed.exe" 2>&1)
    check_eq "$file (trait typed run)" "$expected" "$actual"
  fi
done

# 23) trait 错误（M10.5b）：interp / 动态 / typed 三路径都失败、含片段、不写输出文件
for file in corpus/traits/9[0-9]_*.vuna; do
  fragment=$(cat "${file%.vuna}.err")
  actual=$("$VUNA" interp "$file" 2>&1)
  check_contains "$file (trait interp error)" "$actual" "$fragment"
  "$VUNA" interp "$file" >/dev/null 2>&1
  tr_code=$?
  if [ "$tr_code" -ne 0 ]; then ok; else bad "$file (trait interp error exit)" "non-zero" "$tr_code"; fi
  rm -f "$tmp/tr_err.ml"
  actual=$("$VUNA" --no-typecheck "$file" "$tmp/tr_err.ml" 2>&1)
  tr_code=$?
  check_contains "$file (trait dynamic error)" "$actual" "$fragment"
  if [ "$tr_code" -ne 0 ]; then ok; else bad "$file (trait dynamic error exit)" "non-zero" "$tr_code"; fi
  if [ -e "$tmp/tr_err.ml" ]; then
    bad "$file (trait dynamic no output file)" "absent" "present"
  else
    ok
  fi
  rm -f "$tmp/tr_err_typed.ml"
  actual=$("$VUNA" --typed "$file" "$tmp/tr_err_typed.ml" 2>&1)
  tr_code=$?
  check_contains "$file (trait typed error)" "$actual" "$fragment"
  if [ "$tr_code" -ne 0 ]; then ok; else bad "$file (trait typed error exit)" "non-zero" "$tr_code"; fi
  if [ -e "$tmp/tr_err_typed.ml" ]; then
    bad "$file (trait typed no output file)" "absent" "present"
  else
    ok
  fi
done

# 24) 跨模块 trait 正例：无头模块全导出（含命名实例）/ header 显式 Trait(..) 三路径
for dir in corpus/traits/[01][0-9]_*/; do
  dir=${dir%/}
  expected=$(cat "$dir/expected.out")
  actual=$("$VUNA" interp --root "$dir/lib" --root "$dir/app" "$dir/app/Main.vuna" 2>&1)
  check_eq "$dir (trait module interp)" "$expected" "$actual"
  compile_and_run_roots "$dir (trait module dynamic)" "$VUNA" "$dir/app/Main.vuna" "$expected" --no-typecheck --root "$dir/lib" --root "$dir/app"
  compile_and_run_roots "$dir (trait module typed)" "$VUNA" "$dir/app/Main.vuna" "$expected" --typed --root "$dir/lib" --root "$dir/app"
done

# 25) 跨模块 trait 错误：显式导出只写 Trait 不写 (..) → app 用方法 unbound（三路径）
for dir in corpus/traits/9[0-9]_*/; do
  dir=${dir%/}
  fragment=$(cat "$dir/expected.err")
  actual=$("$VUNA" interp --root "$dir/lib" --root "$dir/app" "$dir/app/Main.vuna" 2>&1)
  check_contains "$dir (trait module interp error)" "$actual" "$fragment"
  "$VUNA" interp --root "$dir/lib" --root "$dir/app" "$dir/app/Main.vuna" >/dev/null 2>&1
  tr_code=$?
  if [ "$tr_code" -ne 0 ]; then ok; else bad "$dir (trait module interp error exit)" "non-zero" "$tr_code"; fi
  rm -f "$tmp/tr_mod_err.ml"
  actual=$("$VUNA" --no-typecheck --root "$dir/lib" --root "$dir/app" "$dir/app/Main.vuna" "$tmp/tr_mod_err.ml" 2>&1)
  tr_code=$?
  check_contains "$dir (trait module dynamic error)" "$actual" "$fragment"
  if [ "$tr_code" -ne 0 ]; then ok; else bad "$dir (trait module dynamic error exit)" "non-zero" "$tr_code"; fi
  if [ -e "$tmp/tr_mod_err.ml" ]; then
    bad "$dir (trait module dynamic no output file)" "absent" "present"
  else
    ok
  fi
  rm -f "$tmp/tr_mod_err_typed.ml"
  actual=$("$VUNA" --typed --root "$dir/lib" --root "$dir/app" "$dir/app/Main.vuna" "$tmp/tr_mod_err_typed.ml" 2>&1)
  tr_code=$?
  check_contains "$dir (trait module typed error)" "$actual" "$fragment"
  if [ "$tr_code" -ne 0 ]; then ok; else bad "$dir (trait module typed error exit)" "non-zero" "$tr_code"; fi
  if [ -e "$tmp/tr_mod_err_typed.ml" ]; then
    bad "$dir (trait module typed no output file)" "absent" "present"
  else
    ok
  fi
done

# 26) do / Monad / 高阶 kind（M11）：正例三路径；错误例三路径都失败、含片段、不写输出文件
for file in corpus/monad/[01][0-9]_*.vuna; do
  base=${file%.vuna}
  expected=$(cat "$base.out")
  actual=$("$VUNA" interp "$file" 2>&1)
  check_eq "$file (monad interp)" "$expected" "$actual"
  rm -f "$tmp/monad_dyn.ml" "$tmp/monad_dyn.exe"
  if ! mon_out=$("$VUNA" --no-typecheck "$file" "$tmp/monad_dyn.ml" 2>&1); then
    bad "$file (monad dynamic codegen)" "exit 0" "$mon_out"
  elif [ -n "$mon_out" ]; then
    bad "$file (monad dynamic codegen output)" "" "$mon_out"
  elif ! "$OCAMLOPT" -w -a -o "$tmp/monad_dyn.exe" "$tmp/monad_dyn.ml" >"$tmp/monad_dyn.log" 2>&1; then
    bad "$file (monad dynamic ocamlopt)" "" "$(cat "$tmp/monad_dyn.log")"
  else
    actual=$("$tmp/monad_dyn.exe" 2>&1)
    check_eq "$file (monad dynamic run)" "$expected" "$actual"
  fi
  rm -f "$tmp/monad_typed.ml" "$tmp/monad_typed.exe"
  if ! mon_out=$("$VUNA" --typed "$file" "$tmp/monad_typed.ml" 2>&1); then
    bad "$file (monad typed codegen)" "exit 0" "$mon_out"
  elif [ -n "$mon_out" ]; then
    bad "$file (monad typed codegen output)" "" "$mon_out"
  elif ! "$OCAMLOPT" -w -a -o "$tmp/monad_typed.exe" "$tmp/monad_typed.ml" >"$tmp/monad_typed.log" 2>&1; then
    bad "$file (monad typed ocamlopt)" "" "$(cat "$tmp/monad_typed.log")"
  else
    actual=$("$tmp/monad_typed.exe" 2>&1)
    check_eq "$file (monad typed run)" "$expected" "$actual"
  fi
done

for file in corpus/monad/9[0-9]_*.vuna; do
  fragment=$(cat "${file%.vuna}.err")
  actual=$("$VUNA" interp "$file" 2>&1)
  check_contains "$file (monad interp error)" "$actual" "$fragment"
  "$VUNA" interp "$file" >/dev/null 2>&1
  mon_code=$?
  if [ "$mon_code" -ne 0 ]; then ok; else bad "$file (monad interp error exit)" "non-zero" "$mon_code"; fi
  rm -f "$tmp/monad_err.ml"
  actual=$("$VUNA" --no-typecheck "$file" "$tmp/monad_err.ml" 2>&1)
  mon_code=$?
  check_contains "$file (monad dynamic error)" "$actual" "$fragment"
  if [ "$mon_code" -ne 0 ]; then ok; else bad "$file (monad dynamic error exit)" "non-zero" "$mon_code"; fi
  if [ -e "$tmp/monad_err.ml" ]; then
    bad "$file (monad dynamic no output file)" "absent" "present"
  else
    ok
  fi
  rm -f "$tmp/monad_err_typed.ml"
  actual=$("$VUNA" --typed "$file" "$tmp/monad_err_typed.ml" 2>&1)
  mon_code=$?
  check_contains "$file (monad typed error)" "$actual" "$fragment"
  if [ "$mon_code" -ne 0 ]; then ok; else bad "$file (monad typed error exit)" "non-zero" "$mon_code"; fi
  if [ -e "$tmp/monad_err_typed.ml" ]; then
    bad "$file (monad typed no output file)" "absent" "present"
  else
    ok
  fi
done

# 27) stdlib（M11）：正例三路径（--root ../stdlib）；错误例三路径都失败、含片段、不写输出文件
for file in corpus/stdlib/[01][0-9]_*.vuna; do
  base=${file%.vuna}
  expected=$(cat "$base.out")
  actual=$("$VUNA" interp --root ../stdlib/lib "$file" 2>&1)
  check_eq "$file (stdlib interp)" "$expected" "$actual"
  rm -f "$tmp/stdlib_dyn.ml" "$tmp/stdlib_dyn.exe"
  if ! std_out=$("$VUNA" --no-typecheck --root ../stdlib/lib "$file" "$tmp/stdlib_dyn.ml" 2>&1); then
    bad "$file (stdlib dynamic codegen)" "exit 0" "$std_out"
  elif [ -n "$std_out" ]; then
    bad "$file (stdlib dynamic codegen output)" "" "$std_out"
  elif ! "$OCAMLOPT" -w -a -o "$tmp/stdlib_dyn.exe" "$tmp/stdlib_dyn.ml" >"$tmp/stdlib_dyn.log" 2>&1; then
    bad "$file (stdlib dynamic ocamlopt)" "" "$(cat "$tmp/stdlib_dyn.log")"
  else
    actual=$("$tmp/stdlib_dyn.exe" 2>&1)
    check_eq "$file (stdlib dynamic run)" "$expected" "$actual"
  fi
  rm -f "$tmp/stdlib_typed.ml" "$tmp/stdlib_typed.exe"
  if ! std_out=$("$VUNA" --typed --root ../stdlib/lib "$file" "$tmp/stdlib_typed.ml" 2>&1); then
    bad "$file (stdlib typed codegen)" "exit 0" "$std_out"
  elif [ -n "$std_out" ]; then
    bad "$file (stdlib typed codegen output)" "" "$std_out"
  elif ! "$OCAMLOPT" -w -a -o "$tmp/stdlib_typed.exe" "$tmp/stdlib_typed.ml" >"$tmp/stdlib_typed.log" 2>&1; then
    bad "$file (stdlib typed ocamlopt)" "" "$(cat "$tmp/stdlib_typed.log")"
  else
    actual=$("$tmp/stdlib_typed.exe" 2>&1)
    check_eq "$file (stdlib typed run)" "$expected" "$actual"
  fi
done

for file in corpus/stdlib/9[0-9]_*.vuna; do
  fragment=$(cat "${file%.vuna}.err")
  actual=$("$VUNA" interp --root ../stdlib/lib "$file" 2>&1)
  check_contains "$file (stdlib interp error)" "$actual" "$fragment"
  "$VUNA" interp --root ../stdlib/lib "$file" >/dev/null 2>&1
  std_code=$?
  if [ "$std_code" -ne 0 ]; then ok; else bad "$file (stdlib interp error exit)" "non-zero" "$std_code"; fi
  rm -f "$tmp/stdlib_err.ml"
  actual=$("$VUNA" --no-typecheck --root ../stdlib/lib "$file" "$tmp/stdlib_err.ml" 2>&1)
  std_code=$?
  check_contains "$file (stdlib dynamic error)" "$actual" "$fragment"
  if [ "$std_code" -ne 0 ]; then ok; else bad "$file (stdlib dynamic error exit)" "non-zero" "$std_code"; fi
  if [ -e "$tmp/stdlib_err.ml" ]; then
    bad "$file (stdlib dynamic no output file)" "absent" "present"
  else
    ok
  fi
  rm -f "$tmp/stdlib_err_typed.ml"
  actual=$("$VUNA" --typed --root ../stdlib/lib "$file" "$tmp/stdlib_err_typed.ml" 2>&1)
  std_code=$?
  check_contains "$file (stdlib typed error)" "$actual" "$fragment"
  if [ "$std_code" -ne 0 ]; then ok; else bad "$file (stdlib typed error exit)" "non-zero" "$std_code"; fi
  if [ -e "$tmp/stdlib_err_typed.ml" ]; then
    bad "$file (stdlib typed no output file)" "absent" "present"
  else
    ok
  fi
done

# 28) 包模式（M11.5）：workspace + 依赖包 + [export] + app/Main.vuna 入口
#     正例：vuna build 生成 → ocamlopt → 运行比对 golden；vuna test 运行 test/*.vuna
for dir in corpus/packages/[01][0-9]_*/; do
  dir=${dir%/}
  expected=$(cat "$dir/expected.out")
  rm -f "$tmp/pkg.ml" "$tmp/pkg.exe"
  if ! pkg_out=$("$VUNA" build "$dir" "$tmp/pkg.ml" 2>&1); then
    bad "$dir (package build)" "exit 0" "$pkg_out"
  elif ! "$OCAMLOPT" -w -a -o "$tmp/pkg.exe" "$tmp/pkg.ml" >"$tmp/pkg.log" 2>&1; then
    bad "$dir (package ocamlopt)" "" "$(cat "$tmp/pkg.log")"
  else
    actual=$("$tmp/pkg.exe" 2>&1)
    check_eq "$dir (package run)" "$expected" "$actual"
  fi
  test_out=$("$VUNA" test "$dir" 2>&1)
  check_contains "$dir (package test)" "$test_out" "1 passed, 0 failed"
done

# 29) 包模式错误：缺依赖 / 依赖环 / 隐藏模块（[export] 限制）→ 非 0、含片段、不写产物
for dir in corpus/packages/9[0-9]_*/; do
  dir=${dir%/}
  fragment=$(cat "$dir/expected.err")
  rm -f "$tmp/pkg_err.ml"
  actual=$("$VUNA" build "$dir" "$tmp/pkg_err.ml" 2>&1)
  pkg_code=$?
  check_contains "$dir (package error)" "$actual" "$fragment"
  if [ "$pkg_code" -ne 0 ]; then ok; else bad "$dir (package error exit)" "non-zero" "$pkg_code"; fi
  if [ -e "$tmp/pkg_err.ml" ]; then
    bad "$dir (package no output file)" "absent" "present"
  else
    ok
  fi
done

# 30) fmt（M11.5）：格式化后仍可编译且输出不变；fmt 幂等
for file in corpus/run/01_arithmetic.vuna corpus/run/03_data_case.vuna corpus/monad/01_do_maybe.vuna corpus/traits/03_deriving_show_eq_enum.vuna; do
  expected=$(cat "${file%.vuna}.out")
  cp "$file" "$tmp/fmt_src.vuna"
  "$VUNA" fmt "$tmp/fmt_src.vuna" >/dev/null 2>&1
  actual=$("$VUNA" interp "$tmp/fmt_src.vuna" 2>&1)
  check_eq "$file (fmt interp)" "$expected" "$actual"
  "$VUNA" fmt --check "$tmp/fmt_src.vuna" >/dev/null 2>&1
  fmt_code=$?
  check_eq "$file (fmt idempotent)" "0" "$fmt_code"
done

# 31) doc / repl 冒烟
"$VUNA" doc corpus/packages/01_workspace "$tmp/api.md" >/dev/null 2>&1
check_eq "vuna doc exit" "0" "$?"
check_contains "vuna doc content" "$(cat "$tmp/api.md" 2>/dev/null)" "## Vuna.Hello"
repl_out=$(printf 'x = 1 + 1\nx + 40\n:q\n' | "$VUNA" repl 2>&1)
check_contains "vuna repl eval" "$repl_out" "42"
printf ':q\n' | "$VUNA" repl >/dev/null 2>&1
check_eq "vuna repl exit" "0" "$?"

# 32) fmt golden 自测（test/corpus/fmt/check.sh：54 checks，临时合并模块根）
VUNA="$VUNA" OCAMLOPT="$OCAMLOPT" sh corpus/fmt/check.sh >"$tmp/fmt_check.log" 2>&1
fmt_code=$?
if [ "$fmt_code" -eq 0 ]; then ok; else bad "fmt corpus" "exit 0" "$(tail -3 "$tmp/fmt_check.log")"; fi

if [ "$fail" -ne 0 ]; then
  printf '%s passed, %s failed\n' "$pass" "$fail"
  exit 1
fi
printf 'vuna tests passed (%s checks)\n' "$pass"
