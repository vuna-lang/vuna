#!/bin/sh
# vuna 原生测试：只用 vuna / vuna-seed 驱动。
#
# M23 起语言夹具与解释器只走 DT 路径：
#   * 夹具检查/生成用 `check --dt` / `compile --dt`；`vuna interp` = DT 精化 + 核心求值；
#   * `interp` 是纯求值器（不执行效果），`main` 只展示 Int/String/Bool；
#     效果/不可归约夹具带 `<file>.vuna.nointerp` 标记 → 跳过 interp，只做 compile --dt + 运行；
#   * 负例的 `.err` 是 DT 实际诊断的稳定片段（个别命令文案不同时用 `.cerr` 给 compile 用）；
#   * HM 只保留在源码自检与包 HM 构建段（28/29/33、34d 的零回归），M24 删除。
#
# 环境变量（默认取 PATH 中的同名命令）：
#   VUNA        当前编译器（stage 1）
#   VUNA_SEED   种子编译器（stage 0，多文件 seed/ 构建）
#   OCAMLOPT    OCaml 编译器，默认 ocamlopt
set -u

cd "$(dirname "$0")"

: "${VUNA:=vuna}"
: "${VUNA_SEED:=vuna-seed}"
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

compile_and_run_roots() { # name compiler flags entry expected root...
  name=$1
  compiler=$2
  flags=$3
  entry=$4
  expected=$5
  shift 5
  out="$tmp/prog.ml"
  exe="$tmp/prog.exe"
  rm -f "$out" "$exe"

  if ! compile_output=$("$compiler" compile $flags "$@" "$entry" "$out" 2>&1); then
    bad "$name compile" "exit 0" "$compile_output"
    return
  fi
  if [ -n "$compile_output" ]; then
    bad "$name compile output" "" "$compile_output"
    return
  fi
  if ! "$OCAMLOPT" -w -a -I +unix -o "$exe" unix.cmxa "$out" >"$tmp/ocamlopt.log" 2>&1; then
    bad "$name ocamlopt" "" "$(cat "$tmp/ocamlopt.log")"
    return
  fi
  actual=$("$exe" 2>&1)
  check_eq "$name run" "$expected" "$actual"
}

compile_and_run() { # name compiler root entry expected（DT 路径：compile --dt）
  compile_and_run_roots "$1" "$2" "--dt" "$4" "$5" --root "$3"
}

# 单文件负例：interp（DT）与 compile --dt 都要报错、含片段、且不写输出文件。
expect_dt_error() { # name file root...
  name=$1
  file=$2
  shift 2
  base=${file%.vuna}
  fragment=$(cat "$base.err")
  compile_fragment=$fragment
  if [ -f "$base.cerr" ]; then compile_fragment=$(cat "$base.cerr"); fi

  actual=$("$VUNA" interp "$@" "$file" 2>&1)
  code=$?
  check_contains "$name (interp error)" "$actual" "$fragment"
  if [ "$code" -ne 0 ]; then ok; else bad "$name (interp error exit)" "non-zero" "$code"; fi

  rm -f "$tmp/neg_compile.ml"
  actual=$("$VUNA" compile --dt "$@" "$file" "$tmp/neg_compile.ml" 2>&1)
  code=$?
  check_contains "$name (compile error)" "$actual" "$compile_fragment"
  if [ "$code" -ne 0 ]; then ok; else bad "$name (compile error exit)" "non-zero" "$code"; fi
  if [ -e "$tmp/neg_compile.ml" ]; then
    bad "$name (compile no output file)" "absent" "present"
  else
    ok
  fi
}

# 目录型负例：同上，entry 是 <dir>/app/Main.vuna，片段来自 <dir>/expected.err。
expect_dt_dir_error() { # name dir root...
  name=$1
  dir=$2
  shift 2
  fragment=$(cat "$dir/expected.err")
  entry="$dir/app/Main.vuna"

  actual=$("$VUNA" interp "$@" "$entry" 2>&1)
  code=$?
  check_contains "$name (interp error)" "$actual" "$fragment"
  if [ "$code" -ne 0 ]; then ok; else bad "$name (interp error exit)" "non-zero" "$code"; fi

  rm -f "$tmp/neg_dir_compile.ml"
  actual=$("$VUNA" compile --dt "$@" "$entry" "$tmp/neg_dir_compile.ml" 2>&1)
  code=$?
  check_contains "$name (compile error)" "$actual" "$fragment"
  if [ "$code" -ne 0 ]; then ok; else bad "$name (compile error exit)" "non-zero" "$code"; fi
  if [ -e "$tmp/neg_dir_compile.ml" ]; then
    bad "$name (compile no output file)" "absent" "present"
  else
    ok
  fi
}

# 1) corpus/run：interp（DT 核心求值）vs golden；compile --dt → ocamlopt → 运行 vs golden。
#    .nointerp 夹具（效果/不可归约）只跑编译产物。
for file in corpus/run/*.vuna; do
  base=${file%.vuna}
  expected=$(cat "$base.out")
  extra=""
  case "$file" in
    *16_file_exists*) extra="--root ../base/lib" ;;
    *17_file_meta*) extra="--root ../base/lib" ;;
  esac
  if [ ! -f "$file.nointerp" ]; then
    actual=$("$VUNA" interp $extra "$file" 2>&1)
    check_eq "$file (interp)" "$expected" "$actual"
  fi
  if [ -n "$extra" ]; then
    compile_and_run_roots "$file (compiler)" "$VUNA" "--dt" "$file" "$expected" $extra --root .
  else
    compile_and_run "$file (compiler)" "$VUNA" "." "$file" "$expected"
  fi
done

# 2) 模块夹具：DT 精化后核心求值 + compile --dt 都要读取模块并得到 expected.out（正例 01–29）
for dir in corpus/modules/[012][0-9]_*; do
  expected=$(cat "$dir/expected.out")
  actual=$("$VUNA" interp --root "$dir/lib" --root "$dir/app" "$dir/app/Main.vuna" 2>&1)
  check_eq "$dir (interp)" "$expected" "$actual"
  compile_and_run_roots "$dir (compiler)" "$VUNA" "--dt" "$dir/app/Main.vuna" "$expected" --root "$dir/lib" --root "$dir/app"
done

# 3) 模块错误：DT interp / compile --dt 两条路径都要因同一原因失败、给出含片段的错误，
#    且不写输出文件（错误例 70–99）
for dir in corpus/modules/[789][0-9]_*; do
  expect_dt_dir_error "$dir" "$dir" --root "$dir/lib" --root "$dir/app"
done

# 4) 解析错误：vuna interp 输出含片段（解析层 HM/DT 共用）
for file in corpus/err/*.vuna; do
  fragment=$(cat "${file%.vuna}.err")
  actual=$("$VUNA" interp "$file" 2>&1)
  check_contains "$file (parse error)" "$actual" "$fragment"
done

# 5) 求值/编译错误：DT interp 与 compile --dt 都要给出含片段的错误
#    （run_err/03_div_zero 是产物运行期负例，单独在段 6 处理）
for file in corpus/run_err/*.vuna; do
  case "$file" in
    *03_div_zero*) continue ;;
  esac
  expect_dt_error "$file" "$file"
done

# 6) 除法零是产物运行期负例：DT 语言层不报错（interp 不归约），编译产物运行时 Failure。
#    注：core evaluator 的 `/0` 不归约，interp 只有 "main does not reduce to a value"。
div=corpus/run_err/03_div_zero.vuna
div_frag=$(cat "${div%.vuna}.err")
rm -f "$tmp/div.ml" "$tmp/div.exe"
if ! div_out=$("$VUNA" compile --dt "$div" "$tmp/div.ml" 2>&1); then
  bad "$div (compile)" "exit 0" "$div_out"
elif ! "$OCAMLOPT" -w -a -I +unix -o "$tmp/div.exe" unix.cmxa "$tmp/div.ml" >"$tmp/div.log" 2>&1; then
  bad "$div (ocamlopt)" "" "$(cat "$tmp/div.log")"
else
  div_run=$("$tmp/div.exe" 2>&1)
  div_code=$?
  check_contains "$div (runtime error)" "$div_run" "$div_frag"
  if [ "$div_code" -ne 0 ]; then ok; else bad "$div (runtime error exit)" "non-zero" "$div_code"; fi
fi

# 7) 类型检查通过的程序：check --dt + compile --dt + 运行比对 golden
for file in corpus/type_ok/*.vuna; do
  base=${file%.vuna}
  "$VUNA" check --dt "$file" >/dev/null 2>&1
  check_eq "$file (check --dt exit)" "0" "$?"
  rm -f "$tmp/typed.ml" "$tmp/typed.exe"
  if ! type_out=$("$VUNA" compile --dt "$file" "$tmp/typed.ml" 2>&1); then
    bad "$file (compile --dt)" "exit 0" "$type_out"
  elif [ -n "$type_out" ]; then
    bad "$file (compile --dt output)" "" "$type_out"
  elif ! "$OCAMLOPT" -w -a -I +unix -o "$tmp/typed.exe" unix.cmxa "$tmp/typed.ml" >"$tmp/typed.log" 2>&1; then
    bad "$file (compile --dt ocamlopt)" "" "$(cat "$tmp/typed.log")"
  else
    actual=$("$tmp/typed.exe" 2>&1)
    check_eq "$file (compile --dt run)" "$(cat "$base.out")" "$actual"
  fi
done

# 8) 类型错误：check --dt 与 compile --dt 都必须报含片段的错误，且不写输出文件
for file in corpus/type_err/*.vuna; do
  fragment=$(cat "${file%.vuna}.err")
  actual=$("$VUNA" check --dt "$file" 2>&1)
  check_contains "$file (check --dt error)" "$actual" "$fragment"
  "$VUNA" check --dt "$file" >/dev/null 2>&1
  code=$?
  if [ "$code" -ne 0 ]; then ok; else bad "$file (check --dt error exit)" "non-zero" "$code"; fi
  rm -f "$tmp/type_err.ml"
  actual=$("$VUNA" compile --dt "$file" "$tmp/type_err.ml" 2>&1)
  check_contains "$file (compile --dt error)" "$actual" "$fragment"
  "$VUNA" compile --dt "$file" "$tmp/type_err.ml" >/dev/null 2>&1
  code=$?
  if [ "$code" -ne 0 ]; then ok; else bad "$file (compile --dt error exit)" "non-zero" "$code"; fi
  if [ -e "$tmp/type_err.ml" ]; then
    bad "$file (no output file)" "absent" "present"
  else
    ok
  fi
done

# 9) 跨模块类型检查正例：导入模块后用其类型与构造器（check --dt + compile --dt + 运行）
for dir in corpus/type_modules/0*; do
  "$VUNA" check --dt --root "$dir/lib" "$dir/app/Main.vuna" >/dev/null 2>&1
  check_eq "$dir (module check --dt exit)" "0" "$?"
  rm -f "$tmp/tm.ml" "$tmp/tm.exe"
  if ! tm_out=$("$VUNA" compile --dt --root "$dir/lib" "$dir/app/Main.vuna" "$tmp/tm.ml" 2>&1); then
    bad "$dir (module compile --dt)" "exit 0" "$tm_out"
  elif [ -n "$tm_out" ]; then
    bad "$dir (module compile --dt output)" "" "$tm_out"
  elif ! "$OCAMLOPT" -w -a -I +unix -o "$tmp/tm.exe" unix.cmxa "$tmp/tm.ml" >"$tmp/tm.log" 2>&1; then
    bad "$dir (module compile --dt ocamlopt)" "" "$(cat "$tmp/tm.log")"
  else
    actual=$("$tmp/tm.exe" 2>&1)
    check_eq "$dir (module compile --dt run)" "$(cat "$dir/expected.out")" "$actual"
  fi
done

# 10) 跨模块类型错误：check --dt / compile --dt 都要含片段、非 0、不写输出文件
for dir in corpus/type_modules/9*; do
  fragment=$(cat "$dir/expected.err")
  actual=$("$VUNA" check --dt --root "$dir/lib" "$dir/app/Main.vuna" 2>&1)
  check_contains "$dir (module check --dt error)" "$actual" "$fragment"
  "$VUNA" check --dt --root "$dir/lib" "$dir/app/Main.vuna" >/dev/null 2>&1
  code=$?
  if [ "$code" -ne 0 ]; then ok; else bad "$dir (module check --dt error exit)" "non-zero" "$code"; fi
  rm -f "$tmp/tm_err.ml"
  actual=$("$VUNA" compile --dt --root "$dir/lib" "$dir/app/Main.vuna" "$tmp/tm_err.ml" 2>&1)
  check_contains "$dir (module compile --dt error)" "$actual" "$fragment"
  "$VUNA" compile --dt --root "$dir/lib" "$dir/app/Main.vuna" "$tmp/tm_err.ml" >/dev/null 2>&1
  code=$?
  if [ "$code" -ne 0 ]; then ok; else bad "$dir (module compile --dt error exit)" "non-zero" "$code"; fi
  if [ -e "$tmp/tm_err.ml" ]; then
    bad "$dir (no output file)" "absent" "present"
  else
    ok
  fi
done

# 11) typed codegen（M8a）夹具：check --dt + compile --dt（DT 擦除 codegen）+ 运行比对 golden
#     （与段 7 的 type_ok 覆盖点部分重复，M24 可合并；M23 保留）
for file in corpus/typed_ok/*.vuna; do
  base=${file%.vuna}
  "$VUNA" check --dt "$file" >/dev/null 2>&1
  check_eq "$file (check --dt exit)" "0" "$?"
  rm -f "$tmp/typedgen.ml" "$tmp/typedgen.exe"
  if ! typed_out=$("$VUNA" compile --dt "$file" "$tmp/typedgen.ml" 2>&1); then
    bad "$file (compile --dt)" "exit 0" "$typed_out"
  elif [ -n "$typed_out" ]; then
    bad "$file (compile --dt output)" "" "$typed_out"
  elif ! "$OCAMLOPT" -w -a -I +unix -o "$tmp/typedgen.exe" unix.cmxa "$tmp/typedgen.ml" >"$tmp/typedgen.log" 2>&1; then
    bad "$file (compile --dt ocamlopt)" "" "$(cat "$tmp/typedgen.log")"
  else
    actual=$("$tmp/typedgen.exe" 2>&1)
    check_eq "$file (compile --dt run)" "$(cat "$base.out")" "$actual"
  fi
done

# （原第 12 段 M23 删除）跨模块 typed codegen 与段 2 重复：段 2 已改为 compile --dt + 运行，覆盖同一路径。

# 13) 种子冒烟：vuna-seed 编译一个程序并运行（seed 仍是 HM 产物，M24 随 seed 切换）
fact=corpus/run/12_fact.vuna
compile_and_run_roots "$fact (vuna-seed)" "$VUNA_SEED" "" "$fact" "$(cat "${fact%.vuna}.out")" --root .

# 14) 统一 CLI：help、退出码、子命令要求、已删除参数
help_out=$("$VUNA" help 2>&1)
check_contains "vuna help" "$help_out" "usage:"
"$VUNA" >/dev/null 2>&1
check_eq "vuna no args exit" "2" "$?"
"$VUNA" compile --root lib corpus/run/01_arithmetic.vuna >/dev/null 2>&1
check_eq "vuna compile exit" "0" "$?"
"$VUNA" compile --root lib corpus/err/01_case_indent.vuna "$tmp/cli_err.ml" >/dev/null 2>&1
cli_code=$?
if [ "$cli_code" -ne 0 ]; then ok; else bad "vuna compile error exit" "non-zero" "$cli_code"; fi
"$VUNA" corpus/run/01_arithmetic.vuna >/dev/null 2>&1
cli_code=$?
if [ "$cli_code" -ne 0 ]; then ok; else bad "vuna bare command exit" "non-zero" "$cli_code"; fi
bare_msg=$("$VUNA" corpus/run/01_arithmetic.vuna 2>&1)
check_contains "vuna bare command hint" "$bare_msg" "unknown command"
old_nt=$("$VUNA" compile --no-typecheck corpus/run/01_arithmetic.vuna 2>&1)
check_contains "vuna removed --no-typecheck" "$old_nt" "has been removed"
old_ty=$("$VUNA" --typed corpus/run/01_arithmetic.vuna 2>&1)
check_contains "vuna removed --typed" "$old_ty" "has been removed"
"$VUNA" interp /no/such/file.vuna >/dev/null 2>&1
check_eq "vuna interp missing exit" "2" "$?"
# M23：interp 不再接受 --dt（DT 是唯一解释器语义）
old_dt=$("$VUNA" interp --dt corpus/run/01_arithmetic.vuna 2>&1)
check_contains "vuna interp removed --dt" "$old_dt" "no longer takes --dt"
"$VUNA" interp --dt corpus/run/01_arithmetic.vuna >/dev/null 2>&1
check_eq "vuna interp removed --dt exit" "2" "$?"
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

# 17) M9 诊断：运行时错误位置（interp 已切 DT → 非穷尽在静态报错）、穷尽性/冗余、退出码
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
check_contains "m9 interp non-exhaustive" "$loc_i" "case is not exhaustive"
"$VUNA" interp "$tmp/m9/loc.vuna" >/dev/null 2>&1
m9_interp_code=$?
if [ "$m9_interp_code" -ne 0 ]; then ok; else bad "m9 interp non-exhaustive exit" "non-zero" "$m9_interp_code"; fi
# HM 路径的诊断仍由 HM codegen 覆盖到 M24 删除（运行时位置）
rm -f "$tmp/m9/loc.ml" "$tmp/m9/loc.exe"
if ! "$VUNA" compile "$tmp/m9/loc.vuna" "$tmp/m9/loc.ml" >/dev/null 2>&1; then
  bad "m9 typed codegen" "exit 0" "compile failed"
elif ! "$OCAMLOPT" -w -a -I +unix -o "$tmp/m9/loc.exe" unix.cmxa "$tmp/m9/loc.ml" >/dev/null 2>&1; then
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
"$VUNA" compile "$tmp/m9/type_err.vuna" "$tmp/m9/type_err.ml" >/dev/null 2>&1
m9_compile_code=$?
if [ "$m9_compile_code" -ne 0 ]; then ok; else bad "m9 compile type err exit" "non-zero" "$m9_compile_code"; fi

# 18) 记录正例（M10.5 Phase R）：interp（DT）+ compile --dt 两条路径
for file in corpus/records/0*.vuna; do
  base=${file%.vuna}
  expected=$(cat "$base.out")
  if [ ! -f "$file.nointerp" ]; then
    actual=$("$VUNA" interp "$file" 2>&1)
    check_eq "$file (record interp)" "$expected" "$actual"
  fi
  rm -f "$tmp/rec_typed.ml" "$tmp/rec_typed.exe"
  if ! rec_out=$("$VUNA" compile --dt "$file" "$tmp/rec_typed.ml" 2>&1); then
    bad "$file (record compile --dt)" "exit 0" "$rec_out"
  elif [ -n "$rec_out" ]; then
    bad "$file (record compile --dt output)" "" "$rec_out"
  elif ! "$OCAMLOPT" -w -a -I +unix -o "$tmp/rec_typed.exe" unix.cmxa "$tmp/rec_typed.ml" >"$tmp/rec_typed.log" 2>&1; then
    bad "$file (record compile --dt ocamlopt)" "" "$(cat "$tmp/rec_typed.log")"
  else
    actual=$("$tmp/rec_typed.exe" 2>&1)
    check_eq "$file (record compile --dt run)" "$expected" "$actual"
  fi
done

# 19) 记录错误（M10.5 Phase R）：DT interp / compile --dt 都失败、含片段、不写输出文件
for file in corpus/records/9*.vuna; do
  expect_dt_error "$file" "$file"
done

# 20) 跨模块记录正例：导出 Point(..) 可构造/模式匹配；导出 Point 保持抽象（两条路径）
for dir in corpus/records/0*_*/; do
  dir=${dir%/}
  expected=$(cat "$dir/expected.out")
  actual=$("$VUNA" interp --root "$dir/lib" --root "$dir/app" "$dir/app/Main.vuna" 2>&1)
  check_eq "$dir (record module interp)" "$expected" "$actual"
  compile_and_run_roots "$dir (record module compile --dt)" "$VUNA" "--dt" "$dir/app/Main.vuna" "$expected" --root "$dir/lib" --root "$dir/app"
done

# 21) 跨模块记录错误：抽象记录的构造器不可见（两条路径都失败、含片段、不写输出文件）
for dir in corpus/records/9*_*/; do
  dir=${dir%/}
  expect_dt_dir_error "$dir" "$dir" --root "$dir/lib" --root "$dir/app"
done

# 22) trait 正例（M10.5b）：interp（DT）+ compile --dt 两条路径
for file in corpus/traits/[01][0-9]_*.vuna; do
  base=${file%.vuna}
  expected=$(cat "$base.out")
  if [ ! -f "$file.nointerp" ]; then
    actual=$("$VUNA" interp "$file" 2>&1)
    check_eq "$file (trait interp)" "$expected" "$actual"
  fi
  rm -f "$tmp/tr_typed.ml" "$tmp/tr_typed.exe"
  if ! tr_out=$("$VUNA" compile --dt "$file" "$tmp/tr_typed.ml" 2>&1); then
    bad "$file (trait compile --dt)" "exit 0" "$tr_out"
  elif [ -n "$tr_out" ]; then
    bad "$file (trait compile --dt output)" "" "$tr_out"
  elif ! "$OCAMLOPT" -w -a -I +unix -o "$tmp/tr_typed.exe" unix.cmxa "$tmp/tr_typed.ml" >"$tmp/tr_typed.log" 2>&1; then
    bad "$file (trait compile --dt ocamlopt)" "" "$(cat "$tmp/tr_typed.log")"
  else
    actual=$("$tmp/tr_typed.exe" 2>&1)
    check_eq "$file (trait compile --dt run)" "$expected" "$actual"
  fi
done

# 23) trait 错误（M10.5b）：DT interp / compile --dt 都失败、含片段、不写输出文件
for file in corpus/traits/9[0-9]_*.vuna; do
  expect_dt_error "$file" "$file"
done

# 24) 跨模块 trait 正例：无头模块全导出（含命名实例）/ header 显式 Trait(..) 两条路径
for dir in corpus/traits/[01][0-9]_*/; do
  dir=${dir%/}
  expected=$(cat "$dir/expected.out")
  actual=$("$VUNA" interp --root "$dir/lib" --root "$dir/app" "$dir/app/Main.vuna" 2>&1)
  check_eq "$dir (trait module interp)" "$expected" "$actual"
  compile_and_run_roots "$dir (trait module compile --dt)" "$VUNA" "--dt" "$dir/app/Main.vuna" "$expected" --root "$dir/lib" --root "$dir/app"
done

# 25) 跨模块 trait 错误：显式导出只写 Trait 不写 (..) → app 用方法 unbound（两条路径）
for dir in corpus/traits/9[0-9]_*/; do
  dir=${dir%/}
  expect_dt_dir_error "$dir" "$dir" --root "$dir/lib" --root "$dir/app"
done

# 26) do / Monad / 高阶 kind（M11）：正例 check --dt + interp + compile --dt 两条路径；
#     错误例两条路径都失败、含片段、不写输出文件。
#     `.nointerp`：核心求值不执行效果/不归约 → 跳过 interp；
#     `.nocompile`：擦除 codegen 尚不支持（多隐式参数字典 binder）→ 只断言 check --dt。
for file in corpus/monad/[01][0-9]_*.vuna; do
  base=${file%.vuna}
  expected=$(cat "$base.out")
  "$VUNA" check --dt "$file" >/dev/null 2>&1
  check_eq "$file (monad check --dt exit)" "0" "$?"
  if [ -f "$file.nocompile" ]; then
    continue
  fi
  if [ ! -f "$file.nointerp" ]; then
    actual=$("$VUNA" interp "$file" 2>&1)
    check_eq "$file (monad interp)" "$expected" "$actual"
  fi
  rm -f "$tmp/monad_typed.ml" "$tmp/monad_typed.exe"
  if ! mon_out=$("$VUNA" compile --dt "$file" "$tmp/monad_typed.ml" 2>&1); then
    bad "$file (monad compile --dt)" "exit 0" "$mon_out"
  elif [ -n "$mon_out" ]; then
    bad "$file (monad compile --dt output)" "" "$mon_out"
  elif ! "$OCAMLOPT" -w -a -I +unix -o "$tmp/monad_typed.exe" unix.cmxa "$tmp/monad_typed.ml" >"$tmp/monad_typed.log" 2>&1; then
    bad "$file (monad compile --dt ocamlopt)" "" "$(cat "$tmp/monad_typed.log")"
  else
    actual=$("$tmp/monad_typed.exe" 2>&1)
    check_eq "$file (monad compile --dt run)" "$expected" "$actual"
  fi
done

for file in corpus/monad/9[0-9]_*.vuna; do
  expect_dt_error "$file" "$file"
done

# 27) stdlib（M11）：正例两条路径（--root ../base/lib，.nointerp 跳过 interp）；
#     错误例两条路径都失败、含片段、不写输出文件
for file in corpus/stdlib/[01][0-9]_*.vuna; do
  base=${file%.vuna}
  expected=$(cat "$base.out")
  if [ ! -f "$file.nointerp" ]; then
    actual=$("$VUNA" interp --root ../base/lib "$file" 2>&1)
    check_eq "$file (stdlib interp)" "$expected" "$actual"
  fi
  rm -f "$tmp/stdlib_typed.ml" "$tmp/stdlib_typed.exe"
  if ! std_out=$("$VUNA" compile --dt --root ../base/lib "$file" "$tmp/stdlib_typed.ml" 2>&1); then
    bad "$file (stdlib compile --dt)" "exit 0" "$std_out"
  elif [ -n "$std_out" ]; then
    bad "$file (stdlib compile --dt output)" "" "$std_out"
  elif ! "$OCAMLOPT" -w -a -I +unix -o "$tmp/stdlib_typed.exe" unix.cmxa "$tmp/stdlib_typed.ml" >"$tmp/stdlib_typed.log" 2>&1; then
    bad "$file (stdlib compile --dt ocamlopt)" "" "$(cat "$tmp/stdlib_typed.log")"
  else
    actual=$("$tmp/stdlib_typed.exe" 2>&1)
    check_eq "$file (stdlib compile --dt run)" "$expected" "$actual"
  fi
done

for file in corpus/stdlib/9[0-9]_*.vuna; do
  expect_dt_error "$file" "$file" --root ../base/lib
done

# 28) 包模式（M11.5/M12.8）：workspace + 依赖包 + [export] + app/Main.vuna 入口
#     正例：vuna compile --package 生成 .output → build.sh 链接 → 运行比对 golden
#     （包 HM 构建路径 M23 保留，M24 切 DT；`vuna test` 已随 interp 走 DT）
for dir in corpus/packages/[01][0-9]_*/; do
  dir=${dir%/}
  expected=$(cat "$dir/expected.out")
  pkg_out_dir=$tmp/pkg-out-$(basename "$dir")
  rm -rf "$pkg_out_dir"
  if ! pkg_out=$("$VUNA" compile --package --out "$pkg_out_dir" "$dir" 2>&1); then
    bad "$dir (package compile)" "exit 0" "$pkg_out"
  elif ! ( cd "$pkg_out_dir" && OCAMLOPT="$OCAMLOPT" sh build.sh bin/prog ) >"$tmp/pkg.log" 2>&1; then
    bad "$dir (package build)" "" "$(cat "$tmp/pkg.log")"
  else
    actual=$("$pkg_out_dir/bin/prog" 2>&1)
    check_eq "$dir (package run)" "$expected" "$actual"
  fi
  "$VUNA" check --dt "$dir" >/dev/null 2>&1
  check_eq "$dir (package check --dt)" "0" "$?"
  test_out=$("$VUNA" test "$dir" 2>&1)
  check_contains "$dir (package test)" "$test_out" "1 passed, 0 failed"
  "$VUNA" check "$dir" >/dev/null 2>&1
  check_eq "$dir (package check)" "0" "$?"
done

# 29) 包模式错误：缺依赖 / 依赖环 / 隐藏模块（[export] 限制）→ 非 0、含片段、不写产物
for dir in corpus/packages/9[0-9]_*/; do
  dir=${dir%/}
  fragment=$(cat "$dir/expected.err")
  pkg_err_dir=$tmp/pkg-err-out-$(basename "$dir")
  rm -rf "$pkg_err_dir"
  actual=$("$VUNA" compile --package --out "$pkg_err_dir" "$dir" 2>&1)
  pkg_code=$?
  check_contains "$dir (package error)" "$actual" "$fragment"
  if [ "$pkg_code" -ne 0 ]; then ok; else bad "$dir (package error exit)" "non-zero" "$pkg_code"; fi
  if [ -e "$pkg_err_dir/lib" ] || [ -e "$pkg_err_dir/app" ]; then
    bad "$dir (package no output files)" "absent" "present"
  else
    ok
  fi
done

# 30) fmt（M11.5/M11.6）：格式化后仍可解释（DT 语义）且输出不变；fmt 幂等
for file in corpus/run/01_arithmetic.vuna corpus/run/03_data_case.vuna corpus/fmt/run/07_wrap.vuna corpus/monad/01_do_maybe.vuna corpus/traits/03_deriving_show_eq_enum.vuna; do
  expected=$(cat "${file%.vuna}.out")
  cp "$file" "$tmp/fmt_src.vuna"
  chmod u+w "$tmp/fmt_src.vuna"
  "$VUNA" fmt "$tmp/fmt_src.vuna" >/dev/null 2>&1
  actual=$("$VUNA" interp "$tmp/fmt_src.vuna" 2>&1)
  check_eq "$file (fmt interp)" "$expected" "$actual"
  "$VUNA" fmt --check "$tmp/fmt_src.vuna" >/dev/null 2>&1
  fmt_code=$?
  check_eq "$file (fmt idempotent)" "0" "$fmt_code"
done

# 31) doc / repl 冒烟（M23：Repl 已切 DT，顶层定义必须先输签名行；裸表达式可直接求值）
"$VUNA" doc corpus/packages/01_workspace "$tmp/api.md" >/dev/null 2>&1
check_eq "vuna doc exit" "0" "$?"
check_contains "vuna doc content" "$(cat "$tmp/api.md" 2>/dev/null)" "## Vuna.Hello"
repl_out=$(printf 'x : Int\nx = 1 + 1\nx + 40\n:q\n' | "$VUNA" repl 2>&1)
check_contains "vuna repl eval" "$repl_out" "42"
printf ':q\n' | "$VUNA" repl >/dev/null 2>&1
check_eq "vuna repl exit" "0" "$?"

# 32) fmt golden 自测（test/corpus/fmt/check.sh：临时合并模块根；interp 已随 DT）
VUNA="$VUNA" OCAMLOPT="$OCAMLOPT" sh corpus/fmt/check.sh >"$tmp/fmt_check.log" 2>&1
fmt_code=$?
if [ "$fmt_code" -eq 0 ]; then ok; else bad "fmt corpus" "exit 0" "$(tail -3 "$tmp/fmt_check.log")"; fi

# 33) M12.8 包级 compile：.output/{lib,app} → build.sh 增量编译 → 输出一致
#     （HM Split 输出模型 M23 保留，M24 删除）
for pkg in corpus/packages/[01][0-9]_*/; do
  pkg=${pkg%/}
  split_dir=$tmp/split-$(basename "$pkg")
  rm -rf "$split_dir"
  mkdir -p "$split_dir"
  if ! split_out=$("$VUNA" compile --package --out "$split_dir" "$pkg" 2>&1); then
    bad "$pkg (package generate)" "exit 0" "$split_out"
    continue
  fi
  if [ ! -f "$split_dir/build.sh" ] || [ ! -f "$split_dir/app/Main.ml" ]; then
    bad "$pkg (package layout)" "lib+app+build.sh" "missing"
    continue
  fi
  ok
  ( cd "$split_dir" && OCAMLOPT="$OCAMLOPT" sh build.sh bin/prog ) >"$tmp/split_build.log" 2>&1
  check_eq "$pkg (package build exit)" "0" "$?"
  actual=$("$split_dir/bin/prog" 2>&1)
  check_eq "$pkg (package run)" "$(cat "$pkg/expected.out")" "$actual"
done

# 增量构建行为用 01_workspace 验证
split_dir=$tmp/split-01_workspace
( cd "$split_dir" && OCAMLOPT="$OCAMLOPT" sh build.sh bin/prog ) >"$tmp/split_noop.log" 2>&1
if grep -q '^compile ' "$tmp/split_noop.log"; then
  bad "package incremental noop" "no compile lines" "$(cat "$tmp/split_noop.log")"
else
  ok
fi
touch "$split_dir/lib/Vuna_dHello.ml"
( cd "$split_dir" && OCAMLOPT="$OCAMLOPT" sh build.sh bin/prog ) >"$tmp/split_inc.log" 2>&1
check_contains "package incremental module" "$(cat "$tmp/split_inc.log")" "compile Vuna_dHello"
if grep -q '^compile Vuna_runtime' "$tmp/split_inc.log"; then
  bad "package incremental runtime untouched" "no runtime compile" "$(cat "$tmp/split_inc.log")"
else
  ok
fi


# 34) DT（M13）：interp（DT 精化 + 核心求值）/ compile --dt（擦除 codegen）与 golden 一致
#
# M18.5 追加：核心求值器与擦除 codegen 必须语义一致——同一夹具 `interp` 的输出
# 与 `compile`+`ocamlopt` 产物的输出逐字节相同（不依赖 golden，直接对拍两条路径）。
# M23：interp 的 DT 语义成为唯一路径，`--dt` 从 interp 移除；`main : IO a` 的夹具
# （核心求值器不执行效果）带 `.nointerp` 标记，跳过 interp 只做 check+compile+run。
for file in corpus/dt/*.vuna; do
  base=${file%.vuna}
  expected=$(cat "$base.out")
  interp_out=""
  have_interp=0
  if [ ! -f "$file.nointerp" ]; then
    actual=$("$VUNA" interp "$file" 2>&1)
    check_eq "$file (dt interp)" "$expected" "$actual"
    interp_out=$actual
    have_interp=1
  fi
  "$VUNA" check --dt "$file" >/dev/null 2>&1
  check_eq "$file (dt check exit)" "0" "$?"
  rm -f "$tmp/dt.ml" "$tmp/dt.exe"
  if ! dt_out=$("$VUNA" compile --dt "$file" "$tmp/dt.ml" 2>&1); then
    bad "$file (dt compile)" "exit 0" "$dt_out"
  elif [ -n "$dt_out" ]; then
    bad "$file (dt compile output)" "" "$dt_out"
  elif ! "$OCAMLOPT" -w -a -I +unix -o "$tmp/dt.exe" unix.cmxa "$tmp/dt.ml" >"$tmp/dt.log" 2>&1; then
    bad "$file (dt ocamlopt)" "" "$(cat "$tmp/dt.log")"
  else
    actual=$("$tmp/dt.exe" 2>&1)
    check_eq "$file (dt run)" "$expected" "$actual"
    if [ "$have_interp" -eq 1 ]; then
      check_eq "$file (dt interp == run)" "$interp_out" "$actual"
    fi
  fi
done

# DT 错误：check --dt 与 compile --dt 都失败、含片段、不写输出文件
for file in corpus/dt_err/*.vuna; do
  fragment=$(cat "${file%.vuna}.err")
  actual=$("$VUNA" check --dt "$file" 2>&1)
  dt_code=$?
  check_contains "$file (dt error)" "$actual" "$fragment"
  if [ "$dt_code" -ne 0 ]; then ok; else bad "$file (dt error exit)" "non-zero" "$dt_code"; fi
  rm -f "$tmp/dt_err_compile.ml"
  actual=$("$VUNA" compile --dt "$file" "$tmp/dt_err_compile.ml" 2>&1)
  dt_code=$?
  check_contains "$file (dt compile error)" "$actual" "$fragment"
  if [ "$dt_code" -ne 0 ]; then ok; else bad "$file (dt compile error exit)" "non-zero" "$dt_code"; fi
  if [ -e "$tmp/dt_err_compile.ml" ]; then
    bad "$file (dt no output file)" "absent" "present"
  else
    ok
  fi
done

# 34a) DT + Base 库（M21）：`--root ../base/lib` 下 import Base.* 的三路一致性。
# 全部夹具都是纯计算（core evaluator 不执行效果），因此可保留 interp == run 对拍。
# 例外：带 `.nointerp` 标记的夹具（如 strUnpack/strPack 桥接尚不可归约）只要求
# check + compile + run。
for file in corpus/dt_base/*.vuna; do
  base=${file%.vuna}
  expected=$(cat "$base.out")
  "$VUNA" check --dt --root ../base/lib "$file" >/dev/null 2>&1
  check_eq "$file (dt base check exit)" "0" "$?"
  rm -f "$tmp/dt_base.ml" "$tmp/dt_base.exe"
  interp_out=""
  have_interp=0
  if [ ! -f "$file.nointerp" ]; then
    interp_out=$("$VUNA" interp --root ../base/lib "$file" 2>&1)
    check_eq "$file (dt base interp)" "$expected" "$interp_out"
    have_interp=1
  fi
  if ! dt_out=$("$VUNA" compile --dt --root ../base/lib "$file" "$tmp/dt_base.ml" 2>&1); then
    bad "$file (dt base compile)" "exit 0" "$dt_out"
  elif [ -n "$dt_out" ]; then
    bad "$file (dt base compile output)" "" "$dt_out"
  elif ! "$OCAMLOPT" -w -a -I +unix -o "$tmp/dt_base.exe" unix.cmxa "$tmp/dt_base.ml" >"$tmp/dt_base.log" 2>&1; then
    bad "$file (dt base ocamlopt)" "" "$(cat "$tmp/dt_base.log")"
  else
    actual=$("$tmp/dt_base.exe" 2>&1)
    check_eq "$file (dt base run)" "$expected" "$actual"
    if [ "$have_interp" -eq 1 ]; then
      check_eq "$file (dt base interp == run)" "$interp_out" "$actual"
    fi
  fi
done

# 34b) DT 效果（M21）：`main : IO a` 的编译产物真正执行 Base.IO 效果。
# core evaluator 是纯求值器（不跑效果），所以效果夹具只要求「编译产物输出 == golden」，
# 并额外要求 `check --dt` 通过。
for file in corpus/dt_io/*.vuna; do
  base=${file%.vuna}
  expected=$(cat "$base.out")
  "$VUNA" check --dt --root ../base/lib "$file" >/dev/null 2>&1
  check_eq "$file (dt io check exit)" "0" "$?"
  rm -f "$tmp/dt_io.ml" "$tmp/dt_io.exe"
  if ! dt_out=$("$VUNA" compile --dt --root ../base/lib "$file" "$tmp/dt_io.ml" 2>&1); then
    bad "$file (dt io compile)" "exit 0" "$dt_out"
  elif [ -n "$dt_out" ]; then
    bad "$file (dt io compile output)" "" "$dt_out"
  elif ! "$OCAMLOPT" -w -a -I +unix -o "$tmp/dt_io.exe" unix.cmxa "$tmp/dt_io.ml" >"$tmp/dt_io.log" 2>&1; then
    bad "$file (dt io ocamlopt)" "" "$(cat "$tmp/dt_io.log")"
  else
    actual=$("$tmp/dt_io.exe" 2>&1)
    check_eq "$file (dt io run)" "$expected" "$actual"
  fi
done

# 34c) DT 包目录（M22.1）：check --dt / compile --dt 接受包目录（loadProject + resolveProject）
exec_pkg=corpus/dt_pkg/01_exec
"$VUNA" check --dt "$exec_pkg" >/dev/null 2>&1
check_eq "$exec_pkg (dt pkg check exit)" "0" "$?"
rm -f "$tmp/dt_pkg.ml" "$tmp/dt_pkg.exe"
if ! dt_pkg_out=$("$VUNA" compile --dt "$exec_pkg" "$tmp/dt_pkg.ml" 2>&1); then
  bad "$exec_pkg (dt pkg compile)" "exit 0" "$dt_pkg_out"
elif [ -n "$dt_pkg_out" ]; then
  bad "$exec_pkg (dt pkg compile output)" "" "$dt_pkg_out"
elif ! "$OCAMLOPT" -w -a -I +unix -o "$tmp/dt_pkg.exe" unix.cmxa "$tmp/dt_pkg.ml" >"$tmp/dt_pkg.log" 2>&1; then
  bad "$exec_pkg (dt pkg ocamlopt)" "" "$(cat "$tmp/dt_pkg.log")"
else
  actual=$("$tmp/dt_pkg.exe" 2>&1)
  check_eq "$exec_pkg (dt pkg run)" "$(cat "$exec_pkg/expected.out")" "$actual"
fi

# 库包：check 通过；compile 清晰报错（非崩溃），且不写输出文件
lib_pkg=corpus/dt_pkg/02_lib
"$VUNA" check --dt "$lib_pkg" >/dev/null 2>&1
check_eq "$lib_pkg (dt lib check exit)" "0" "$?"
rm -f "$tmp/dt_lib.ml"
lib_err=$("$VUNA" compile --dt "$lib_pkg" "$tmp/dt_lib.ml" 2>&1)
lib_code=$?
check_contains "$lib_pkg (dt lib compile error)" "$lib_err" "library package"
if [ "$lib_code" -ne 0 ]; then ok; else bad "$lib_pkg (dt lib compile exit)" "non-zero" "$lib_code"; fi
if [ -e "$tmp/dt_lib.ml" ]; then
  bad "$lib_pkg (dt lib no output file)" "absent" "present"
else
  ok
fi

# 非法目录 / 不存在的路径：清晰错误而非 Fatal error
bad_pkg=corpus/dt_pkg/03_bad
bad_err=$("$VUNA" check --dt "$bad_pkg" 2>&1)
bad_code=$?
check_contains "$bad_pkg (dt bad dir error)" "$bad_err" "missing vuna.toml"
if [ "$bad_code" -ne 0 ]; then ok; else bad "$bad_pkg (dt bad dir exit)" "non-zero" "$bad_code"; fi
missing_err=$("$VUNA" check --dt corpus/dt_pkg/99_missing 2>&1)
check_contains "dt pkg missing path error" "$missing_err" "no such file or package directory"
check_contains "dt pkg missing path no fatal" "$missing_err" "error:"

# interp 只接受单文件：包目录给出清晰错误（M22.1）；M23 起不再有 `--dt`
interp_err=$("$VUNA" interp "$exec_pkg" 2>&1)
check_contains "dt interp package dir error" "$interp_err" "single file"
# DT CLI：M20 起 `--dt` 接受 --root（复用 Loader）；M22.1 起 check/compile 接受包目录；
# build/seed 的 --dt 入口见 34d（M22.3a）。
help_out=$("$VUNA" help 2>&1)
check_contains "dt help" "$help_out" "--dt"
dt_multi_out=$("$VUNA" interp --root corpus/dt_root corpus/dt_root/Main.vuna 2>&1)
check_eq "dt interp --root exit" "0" "$?"
check_eq "dt interp --root output" "42" "$dt_multi_out"
"$VUNA" seed --dt >/dev/null 2>&1
check_eq "dt seed requires OUT exit" "2" "$?"

# 34d) DT build / seed 入口（M22.3a）：build --dt 产可执行 bin；--split / seed --dt
#      产单文件 main.ml + build.sh；seed --dt 拒绝写 seed/；HM build 零回归。
dt_src=corpus/dt_pkg/01_exec
dt_pkg=$tmp/dt-build-pkg
rm -rf "$dt_pkg"
cp -R "$dt_src" "$dt_pkg"
dt_expected=$(cat "$dt_src/expected.out")

if ! dt_build_out=$("$VUNA" build --dt "$dt_pkg" 2>&1); then
  bad "$dt_src (dt build)" "exit 0" "$dt_build_out"
elif [ ! -x "$dt_pkg/.output/bin/dtpkg-exec" ]; then
  bad "$dt_src (dt build bin)" "executable" "missing"
else
  check_eq "$dt_src (dt build run)" "$dt_expected" "$("$dt_pkg/.output/bin/dtpkg-exec" 2>&1)"
fi

rm -rf "$dt_pkg/.output"
"$VUNA" build --dt --no-compile "$dt_pkg" >/dev/null 2>&1
check_eq "$dt_src (dt build --no-compile exit)" "0" "$?"
if [ -e "$dt_pkg/.output/main.ml" ] && [ -e "$dt_pkg/.output/build.sh" ] && [ ! -e "$dt_pkg/.output/bin" ]; then
  ok
else
  bad "$dt_src (dt build --no-compile layout)" "main.ml+build.sh, no bin" "unexpected"
fi

dt_split=$tmp/dt-split
rm -rf "$dt_split"
if ! dt_split_out=$("$VUNA" build --dt --split "$dt_split" "$dt_pkg" 2>&1); then
  bad "$dt_src (dt build --split)" "exit 0" "$dt_split_out"
elif ! ( cd "$dt_split" && sh build.sh ) >"$tmp/dt_split.log" 2>&1; then
  bad "$dt_src (dt build --split build.sh)" "exit 0" "$(cat "$tmp/dt_split.log")"
else
  check_eq "$dt_src (dt build --split run)" "$dt_expected" "$("$dt_split/main" 2>&1)"
fi

dt_seed=$tmp/dt-seed
rm -rf "$dt_seed"
if ! dt_seed_out=$("$VUNA" seed --dt "$dt_seed" "$dt_pkg" 2>&1); then
  bad "$dt_src (dt seed)" "exit 0" "$dt_seed_out"
elif ! ( cd "$dt_seed" && sh build.sh ) >"$tmp/dt_seed.log" 2>&1; then
  bad "$dt_src (dt seed build.sh)" "exit 0" "$(cat "$tmp/dt_seed.log")"
else
  check_eq "$dt_src (dt seed run)" "$dt_expected" "$("$dt_seed/main" 2>&1)"
fi

seed_refuse=$("$VUNA" seed --dt ../seed "$dt_pkg" 2>&1)
seed_refuse_code=$?
check_contains "$dt_src (dt seed refuses seed/)" "$seed_refuse" "refusing to write DT output"
if [ "$seed_refuse_code" -ne 0 ]; then ok; else bad "$dt_src (dt seed refuses seed/ exit)" "non-zero" "$seed_refuse_code"; fi
if [ -e ../seed/main.ml ]; then
  bad "$dt_src (dt seed no seed/ write)" "absent" "present"
else
  ok
fi

dt_lib_err=$("$VUNA" build --dt corpus/dt_pkg/02_lib 2>&1)
dt_lib_code=$?
check_contains "$dt_src (dt build library error)" "$dt_lib_err" "library package"
if [ "$dt_lib_code" -ne 0 ]; then ok; else bad "$dt_src (dt build library exit)" "non-zero" "$dt_lib_code"; fi

# HM build 零回归
hm_pkg=corpus/packages/01_workspace
rm -rf "$hm_pkg/.output"
"$VUNA" build "$hm_pkg" >/dev/null 2>&1
check_eq "$hm_pkg (hm build)" "0" "$?"
check_eq "$hm_pkg (hm build run)" "$(cat "$hm_pkg/expected.out")" "$("$hm_pkg/.output/bin/app" 2>&1)"
rm -rf "$hm_pkg/.output"

# DT fmt round-trip：Pi 语法格式化后仍解析为同一程序且幂等
cp corpus/dt/03_compose.vuna "$tmp/dt_fmt.vuna"
chmod u+w "$tmp/dt_fmt.vuna"
"$VUNA" fmt "$tmp/dt_fmt.vuna" >/dev/null 2>&1
actual=$("$VUNA" interp "$tmp/dt_fmt.vuna" 2>&1)
check_eq "dt fmt interp" "41" "$actual"
"$VUNA" fmt --check "$tmp/dt_fmt.vuna" >/dev/null 2>&1
check_eq "dt fmt idempotent" "0" "$?"

# 35) M17 工具链：`vuna goal` 洞目标显示 + LSP 编辑器冒烟
goal_out=$("$VUNA" goal corpus/dt/15_goal.vuna 2>&1)
check_contains "goal hole span" "$goal_out" "15_goal.vuna:7:11"
check_contains "goal hole type" "$goal_out" "goal Type"
"$VUNA" goal corpus/dt/15_goal.vuna >/dev/null 2>&1
check_eq "goal exit" "0" "$?"
no_hole_out=$("$VUNA" goal corpus/dt/01_id.vuna 2>&1)
check_contains "goal none" "$no_hole_out" "no holes"
"$VUNA" goal >/dev/null 2>&1
check_eq "goal no args exit" "2" "$?"
sh corpus/lsp/smoke.sh "$VUNA" >/dev/null 2>&1
check_eq "lsp smoke" "0" "$?"

if [ "$fail" -ne 0 ]; then
  printf '%s passed, %s failed\n' "$pass" "$fail"
  exit 1
fi
printf 'vuna tests passed (%s checks)\n' "$pass"