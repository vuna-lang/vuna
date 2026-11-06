#!/bin/sh
# vuna 原生测试：只用 vuna / vuna-seed 驱动。
#
# M24 起只有一条 DT 路径（HM 检查器与 codegen 已删除，`--dt` 开关已移除）：
#   * 夹具检查/生成用 `check` / `compile`；`vuna interp` = DT 精化 + 核心求值；
#   * `interp` 是纯求值器（不执行效果），`main` 只展示 Int/String/Bool；
#     效果/不可归约夹具带 `<file>.vuna.nointerp` 标记 → 跳过 interp，只做 compile + 运行；
#   * 负例的 `.err` 是 DT 实际诊断的稳定片段（个别命令文案不同时用 `.cerr` 给 compile 用）；
#   * 包/构建段（28/29/33/34d）用 DT 的 `build` / `build --no-compile` / `compile`；
#   * DT 的 main 钩子会打印 main 的返回值：纯值 main 打印值；`main : IO a` 先执行效果，
#     再打印效果后的返回值（夹具用 `exit 0` 收尾，让 golden 只含业务输出）。
#
# M26：**包上下文取代 `--root`**。每个源文件的可见性由「最近的 vuna.toml + 依赖闭包」
# 决定；`test/corpus/vuna.toml` 是单文件夹具的包上下文（只依赖 vuna-base），目录型夹具
# 各有自己的 vuna.toml。无 manifest 的文件（如本脚本写进 $tmp 的临时夹具）只有
# base-only 上下文，base 位置来自 `VUNA_BASE`（默认 ../base，相对 test/）或可执行文件相对布局。
#
# M26 的 compile 是**目录式**：`compile [--no-print] (<entry.vuna>|<pkg-dir>) OUTDIR`
# （OUTDIR 必填、成功静默），产物是 `OUTDIR/{Vuna_runtime.ml,<Module>.ml,Main.ml,build.sh}`；
# `build [--no-compile] [--out DIR] [PKG]` 默认写 `.output` 并链接 `.output/bin/<pkg>`。
#
# 环境变量（默认取 PATH 中的同名命令）：
#   VUNA        当前编译器（stage 1）
#   VUNA_SEED   种子编译器（stage 0，多文件 seed/ 构建）
#   OCAMLOPT    OCaml 编译器，默认 ocamlopt
#   VUNA_BASE   base 包目录（无 manifest 文件的 base-only 上下文用；默认 ../base）
set -u

cd "$(dirname "$0")"

: "${VUNA:=vuna}"
: "${VUNA_SEED:=vuna-seed}"
: "${OCAMLOPT:=ocamlopt}"
# M26：单文件/无 manifest 夹具的 base 定位（corpus 自己有 vuna.toml，因此这里主要
# 服务于 $tmp 里的临时夹具与 ad-hoc 单文件）。
: "${VUNA_BASE:=$PWD/../base}"
export VUNA_BASE

# 临时根必须位于**任何 vuna.toml 之外**：第 39 段要验证「无 manifest → base-only」，
# 若 $tmp 落在包内（nix 沙箱里 TMPDIR=/build 就是工作树根），向上找 manifest 会命中仓库
# 根包，上下文语义就悄悄变了（本地 /tmp 与沙箱行为不一致）。先在候选根里挑一个祖先
# 链上没有 vuna.toml 的目录；两个候选都不可用就明确失败，不静默降级。
has_manifest_ancestor() { # dir
  d=$1
  while :; do
    [ -f "$d/vuna.toml" ] && return 0
    [ "$d" = "/" ] && return 1
    d=$(dirname "$d")
  done
}

tmpbase=
for cand in "${TMPDIR:-/tmp}" /tmp; do
  [ -d "$cand" ] || continue
  if ! has_manifest_ancestor "$cand"; then
    tmpbase=$cand
    break
  fi
done
if [ -z "$tmpbase" ]; then
  printf 'FAIL: 找不到包外的临时目录（TMPDIR=%s；无 manifest 用例需要它）\n' "${TMPDIR:-/tmp}" >&2
  exit 1
fi
export TMPDIR="$tmpbase"
tmp=$(mktemp -d "$tmpbase/vuna-tests.XXXXXX") || exit 1
trap 'rm -rf "$tmp"' EXIT INT TERM
# REPL 历史默认写 $HOME（测试不能污染用户目录）；统一指到临时目录。
export VUNA_REPL_HISTORY="$tmp/repl-history"

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

# ---------------------------------------------------------------- 目录式 compile
# M26：compile 的产物是「目录 + build.sh」，不再有单文件 .ml。成功时 compile 静默；
# build.sh 用 `sh build.sh <OUT>` 把产物链接成可执行文件（OUT 相对 OUTDIR）。
compile_seq=0
CD_BIN=""

compile_dir_bin() { # name compiler entry [compile flags...]；成功时设置 CD_BIN
  name=$1
  compiler=$2
  entry=$3
  shift 3
  compile_seq=$((compile_seq + 1))
  outdir="$tmp/compiled-$compile_seq"
  rm -rf "$outdir"
  if ! compile_msg=$("$compiler" compile "$@" "$entry" "$outdir" 2>&1); then
    bad "$name compile" "exit 0" "$compile_msg"
    return 1
  fi
  if [ -n "$compile_msg" ]; then
    bad "$name compile output" "" "$compile_msg"
    return 1
  fi
  if ! ( cd "$outdir" && OCAMLOPT="$OCAMLOPT" sh build.sh prog ) >"$tmp/build-$compile_seq.log" 2>&1; then
    bad "$name build.sh" "exit 0" "$(tail -3 "$tmp/build-$compile_seq.log")"
    return 1
  fi
  CD_BIN="$outdir/prog"
  return 0
}

compile_dir_and_run() { # name compiler entry expected [compile flags...]
  run_name=$1
  run_compiler=$2
  run_entry=$3
  run_expected=$4
  shift 4
  if compile_dir_bin "$run_name" "$run_compiler" "$run_entry" "$@"; then
    check_eq "$run_name run" "$run_expected" "$("$CD_BIN" 2>&1)"
  fi
}

# 单文件负例：interp（DT）与 compile 都要报错、含片段、且不写输出目录。
expect_dt_error() { # name file
  name=$1
  file=$2
  base=${file%.vuna}
  fragment=$(cat "$base.err")
  compile_fragment=$fragment
  if [ -f "$base.cerr" ]; then compile_fragment=$(cat "$base.cerr"); fi

  actual=$("$VUNA" interp "$file" 2>&1)
  code=$?
  check_contains "$name (interp error)" "$actual" "$fragment"
  if [ "$code" -ne 0 ]; then ok; else bad "$name (interp error exit)" "non-zero" "$code"; fi

  compile_seq=$((compile_seq + 1))
  outdir="$tmp/neg-$compile_seq"
  rm -rf "$outdir"
  actual=$("$VUNA" compile "$file" "$outdir" 2>&1)
  code=$?
  check_contains "$name (compile error)" "$actual" "$compile_fragment"
  if [ "$code" -ne 0 ]; then ok; else bad "$name (compile error exit)" "non-zero" "$code"; fi
  if [ -e "$outdir" ]; then
    bad "$name (compile no output dir)" "absent" "present"
  else
    ok
  fi
}

# 目录型负例：同上，entry 是 <dir>/app/Main.vuna，片段来自 <dir>/expected.err。
expect_dt_dir_error() { # name dir
  name=$1
  dir=$2
  fragment=$(cat "$dir/expected.err")
  entry="$dir/app/Main.vuna"

  actual=$("$VUNA" interp "$entry" 2>&1)
  code=$?
  check_contains "$name (interp error)" "$actual" "$fragment"
  if [ "$code" -ne 0 ]; then ok; else bad "$name (interp error exit)" "non-zero" "$code"; fi

  compile_seq=$((compile_seq + 1))
  outdir="$tmp/neg-dir-$compile_seq"
  rm -rf "$outdir"
  actual=$("$VUNA" compile "$dir" "$outdir" 2>&1)
  code=$?
  check_contains "$name (compile error)" "$actual" "$fragment"
  if [ "$code" -ne 0 ]; then ok; else bad "$name (compile error exit)" "non-zero" "$code"; fi
  if [ -e "$outdir" ]; then
    bad "$name (compile no output dir)" "absent" "present"
  else
    ok
  fi
}

# 1) corpus/run：interp（DT 核心求值）vs golden；compile → build.sh → 运行 vs golden。
#    .nointerp 夹具（效果/不可归约）只跑编译产物。
for file in corpus/run/*.vuna; do
  base=${file%.vuna}
  expected=$(cat "$base.out")
  if [ ! -f "$file.nointerp" ]; then
    actual=$("$VUNA" interp "$file" 2>&1)
    check_eq "$file (interp)" "$expected" "$actual"
  fi
  compile_dir_and_run "$file (compiler)" "$VUNA" "$file" "$expected"
done

# 2) 模块夹具：DT 精化后核心求值 + compile 都要读取模块并得到 expected.out（正例 01–39）
#    M26：每个夹具目录有独立 vuna.toml（只依赖 base），入口 app/Main.vuna 的 import
#    从同包 lib/ 模块根解析（09_package_modules 覆盖「同包模块根」语义）。
for dir in corpus/modules/[0-3][0-9]_*; do
  expected=$(cat "$dir/expected.out")
  actual=$("$VUNA" interp "$dir/app/Main.vuna" 2>&1)
  check_eq "$dir (interp)" "$expected" "$actual"
  compile_dir_and_run "$dir (compiler)" "$VUNA" "$dir/app/Main.vuna" "$expected"
done

# 3) 模块错误：DT interp / compile 都要因同一原因失败、给出含片段的错误，
#    且不写输出目录（错误例 70–99）
for dir in corpus/modules/[789][0-9]_*; do
  expect_dt_dir_error "$dir" "$dir"
done

# 4) 解析错误：vuna interp 输出含片段（解析层 Parser/Lexer，与检查/生成共用）
for file in corpus/err/*.vuna; do
  fragment=$(cat "${file%.vuna}.err")
  actual=$("$VUNA" interp "$file" 2>&1)
  check_contains "$file (parse error)" "$actual" "$fragment"
done

# 5) 求值/编译错误：DT interp 与 compile 都要给出含片段的错误
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
if compile_dir_bin "$div (compile)" "$VUNA" "$div"; then
  div_run=$("$CD_BIN" 2>&1)
  div_code=$?
  check_contains "$div (runtime error)" "$div_run" "$div_frag"
  if [ "$div_code" -ne 0 ]; then ok; else bad "$div (runtime error exit)" "non-zero" "$div_code"; fi
fi

# 7) 类型检查通过的程序：check + compile + 运行比对 golden
for file in corpus/type_ok/*.vuna; do
  base=${file%.vuna}
  "$VUNA" check "$file" >/dev/null 2>&1
  check_eq "$file (check exit)" "0" "$?"
  compile_dir_and_run "$file (compile)" "$VUNA" "$file" "$(cat "$base.out")"
done

# 8) 类型错误：check 与 compile 都必须报含片段的错误，且不写输出目录
for file in corpus/type_err/*.vuna; do
  fragment=$(cat "${file%.vuna}.err")
  actual=$("$VUNA" check "$file" 2>&1)
  check_contains "$file (check error)" "$actual" "$fragment"
  "$VUNA" check "$file" >/dev/null 2>&1
  code=$?
  if [ "$code" -ne 0 ]; then ok; else bad "$file (check error exit)" "non-zero" "$code"; fi
  compile_seq=$((compile_seq + 1))
  outdir="$tmp/type-err-$compile_seq"
  rm -rf "$outdir"
  actual=$("$VUNA" compile "$file" "$outdir" 2>&1)
  check_contains "$file (compile error)" "$actual" "$fragment"
  "$VUNA" compile "$file" "$outdir" >/dev/null 2>&1
  code=$?
  if [ "$code" -ne 0 ]; then ok; else bad "$file (compile error exit)" "non-zero" "$code"; fi
  if [ -e "$outdir" ]; then
    bad "$file (no output dir)" "absent" "present"
  else
    ok
  fi
done

# 9) 跨模块类型检查正例：导入模块后用其类型与构造器（check + compile + 运行）
for dir in corpus/type_modules/0*; do
  case "$dir" in
    *.vuna) continue ;;
  esac
  "$VUNA" check "$dir/app/Main.vuna" >/dev/null 2>&1
  check_eq "$dir (module check exit)" "0" "$?"
  compile_dir_and_run "$dir (module compile)" "$VUNA" "$dir/app/Main.vuna" "$(cat "$dir/expected.out")"
done

# 10) 跨模块类型错误：check / compile 都要含片段、非 0、不写输出目录
for dir in corpus/type_modules/9*; do
  case "$dir" in
    *.vuna) continue ;;
  esac
  fragment=$(cat "$dir/expected.err")
  actual=$("$VUNA" check "$dir/app/Main.vuna" 2>&1)
  check_contains "$dir (module check error)" "$actual" "$fragment"
  "$VUNA" check "$dir/app/Main.vuna" >/dev/null 2>&1
  code=$?
  if [ "$code" -ne 0 ]; then ok; else bad "$dir (module check error exit)" "non-zero" "$code"; fi
  compile_seq=$((compile_seq + 1))
  outdir="$tmp/tm-err-$compile_seq"
  rm -rf "$outdir"
  actual=$("$VUNA" compile "$dir/app/Main.vuna" "$outdir" 2>&1)
  check_contains "$dir (module compile error)" "$actual" "$fragment"
  "$VUNA" compile "$dir/app/Main.vuna" "$outdir" >/dev/null 2>&1
  code=$?
  if [ "$code" -ne 0 ]; then ok; else bad "$dir (module compile error exit)" "non-zero" "$code"; fi
  if [ -e "$outdir" ]; then
    bad "$dir (no output dir)" "absent" "present"
  else
    ok
  fi
done

# 11) typed codegen（M8a）夹具：check + compile（DT 擦除 codegen）+ 运行比对 golden
#     （与段 7 的 type_ok 覆盖点部分重复，M24 可合并；M23 保留）
for file in corpus/typed_ok/*.vuna; do
  base=${file%.vuna}
  "$VUNA" check "$file" >/dev/null 2>&1
  check_eq "$file (check exit)" "0" "$?"
  compile_dir_and_run "$file (compile)" "$VUNA" "$file" "$(cat "$base.out")"
done

# （原第 12 段 M23 删除）跨模块 typed codegen 与段 2 重复：段 2 已改为 compile + 运行，覆盖同一路径。

# 13) 种子冒烟：vuna-seed（提交入库的信任锚点，M24 起由 DT split 生成）编译并运行一个程序。
fact=corpus/run/12_fact.vuna
compile_dir_and_run "$fact (vuna-seed)" "$VUNA_SEED" "$fact" "$(cat "${fact%.vuna}.out")"

# 14) 统一 CLI：help、退出码、子命令要求、已删除参数（M24：DT 是唯一路径，`--dt` 全删；
#     M26：`--root` / `--split` / `seed` 子命令删除）。
help_out=$("$VUNA" help 2>&1)
check_contains "vuna help" "$help_out" "usage:"
"$VUNA" >/dev/null 2>&1
check_eq "vuna no args exit" "2" "$?"
rm -rf "$tmp/cli-ok"
"$VUNA" compile corpus/run/01_arithmetic.vuna "$tmp/cli-ok" >/dev/null 2>&1
check_eq "vuna compile exit" "0" "$?"
rm -rf "$tmp/cli-err"
"$VUNA" compile corpus/err/01_case_indent.vuna "$tmp/cli-err" >/dev/null 2>&1
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
# M24：`--dt` 不再属于任何命令（DT 是唯一路径），与 `compile --package` 一并报 removed。
for dt_cmd in compile check build interp; do
  dt_msg=$("$VUNA" "$dt_cmd" --dt 2>&1)
  dt_code=$?
  check_contains "vuna $dt_cmd removed --dt" "$dt_msg" "removed"
  check_eq "vuna $dt_cmd removed --dt exit" "2" "$dt_code"
done
old_pkg=$("$VUNA" compile --package corpus/run/01_arithmetic.vuna 2>&1)
pkg_code=$?
check_contains "vuna removed compile --package" "$old_pkg" "error"
if [ "$pkg_code" -ne 0 ]; then ok; else bad "vuna removed compile --package exit" "non-zero" "$pkg_code"; fi
# M26：removed hint（--root / --split / seed）都必须是 exit 2 + 明确提示。
for removed_cmd in \
  "compile --root lib corpus/run/01_arithmetic.vuna $tmp/removed-1" \
  "interp --root lib corpus/run/01_arithmetic.vuna" \
  "check --root lib corpus/run/01_arithmetic.vuna" \
  "compile --split $tmp/removed-2 corpus/dt_pkg/01_exec" \
  "build --split $tmp/removed-3 corpus/dt_pkg/01_exec" \
  "seed $tmp/removed-4 corpus/dt_pkg/01_exec" \
  "seed"; do
  # shellcheck disable=SC2086
  removed_msg=$("$VUNA" $removed_cmd 2>&1)
  removed_code=$?
  check_contains "vuna removed: $removed_cmd" "$removed_msg" "removed"
  check_eq "vuna removed exit: $removed_cmd" "2" "$removed_code"
done
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

# 17) M9 诊断：穷尽性/模式诊断与退出码（M24 起 interp 与 check/compile 共用 DT 静态诊断）
#     M26：$tmp 里的临时夹具没有 manifest → base-only 上下文，base 位置由 VUNA_BASE 给出。
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
# M24：DT 只有静态穷尽性诊断（HM 的运行时 `no matching clause` 位置随 HM codegen 删除），
# 因此 compile 也必须在此报同一静态错误、且不写输出目录。
rm -rf "$tmp/m9/loc-out"
loc_c=$("$VUNA" compile "$tmp/m9/loc.vuna" "$tmp/m9/loc-out" 2>&1)
loc_code=$?
check_contains "m9 compile non-exhaustive" "$loc_c" "case is not exhaustive"
if [ "$loc_code" -ne 0 ]; then ok; else bad "m9 compile non-exhaustive exit" "non-zero" "$loc_code"; fi
if [ -e "$tmp/m9/loc-out" ]; then
  bad "m9 compile non-exhaustive no output" "absent" "present"
else
  ok
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
check_contains "m9 non-exhaustive case" "$ne" "case is not exhaustive"

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
check_contains "m9 non-exhaustive function" "$nef" "case is not exhaustive"

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
# DT 的模式诊断：catch-all 之后还有分支 → 静态报错（HM 的 redundant pattern 警告已随 HM 删除）。
rd=$("$VUNA" check "$tmp/m9/red.vuna" 2>&1)
check_contains "m9 catch-all not last" "$rd" "catch-all branch must be the last one"

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
rm -rf "$tmp/m9/type_err-out"
"$VUNA" compile "$tmp/m9/type_err.vuna" "$tmp/m9/type_err-out" >/dev/null 2>&1
m9_compile_code=$?
if [ "$m9_compile_code" -ne 0 ]; then ok; else bad "m9 compile type err exit" "non-zero" "$m9_compile_code"; fi

# 18) 记录正例（M10.5 Phase R）：interp（DT）+ compile
for file in corpus/records/0*.vuna; do
  base=${file%.vuna}
  expected=$(cat "$base.out")
  if [ ! -f "$file.nointerp" ]; then
    actual=$("$VUNA" interp "$file" 2>&1)
    check_eq "$file (record interp)" "$expected" "$actual"
  fi
  compile_dir_and_run "$file (record compile)" "$VUNA" "$file" "$expected"
done

# 19) 记录错误（M10.5 Phase R）：DT interp / compile 都失败、含片段、不写输出目录
for file in corpus/records/9*.vuna; do
  expect_dt_error "$file" "$file"
done

# 20) 跨模块记录正例：导出 Point(..) 可构造/模式匹配；导出 Point 保持抽象（interp + compile）
for dir in corpus/records/0*_*/; do
  dir=${dir%/}
  expected=$(cat "$dir/expected.out")
  actual=$("$VUNA" interp "$dir/app/Main.vuna" 2>&1)
  check_eq "$dir (record module interp)" "$expected" "$actual"
  compile_dir_and_run "$dir (record module compile)" "$VUNA" "$dir/app/Main.vuna" "$expected"
done

# 21) 跨模块记录错误：抽象记录的构造器不可见（interp 与 compile 都失败、含片段、不写输出目录）
for dir in corpus/records/9*_*/; do
  dir=${dir%/}
  expect_dt_dir_error "$dir" "$dir"
done

# 22) trait 正例（M10.5b）：interp（DT）+ compile
for file in corpus/traits/[01][0-9]_*.vuna; do
  base=${file%.vuna}
  expected=$(cat "$base.out")
  if [ ! -f "$file.nointerp" ]; then
    actual=$("$VUNA" interp "$file" 2>&1)
    check_eq "$file (trait interp)" "$expected" "$actual"
  fi
  compile_dir_and_run "$file (trait compile)" "$VUNA" "$file" "$expected"
done

# 23) trait 错误（M10.5b）：DT interp / compile 都失败、含片段、不写输出目录
for file in corpus/traits/9[0-9]_*.vuna; do
  expect_dt_error "$file" "$file"
done

# 24) 跨模块 trait 正例：无头模块全导出 / header 显式 Trait(..)（interp + compile）
for dir in corpus/traits/[01][0-9]_*/; do
  dir=${dir%/}
  expected=$(cat "$dir/expected.out")
  actual=$("$VUNA" interp "$dir/app/Main.vuna" 2>&1)
  check_eq "$dir (trait module interp)" "$expected" "$actual"
  compile_dir_and_run "$dir (trait module compile)" "$VUNA" "$dir/app/Main.vuna" "$expected"
done

# 25) 跨模块 trait 错误：显式导出只写 Trait 不写 (..) → app 用方法 unbound（interp 与 compile）
for dir in corpus/traits/9[0-9]_*/; do
  dir=${dir%/}
  expect_dt_dir_error "$dir" "$dir"
done

# 26) do / Monad / 高阶 kind（M11）：正例 check + interp + compile；
#     错误例都失败、含片段、不写输出目录。
#     `.nointerp`：核心求值不执行效果/不归约 → 跳过 interp（M30 第 43 段补负向断言）。
for file in corpus/monad/[01][0-9]_*.vuna; do
  base=${file%.vuna}
  expected=$(cat "$base.out")
  "$VUNA" check "$file" >/dev/null 2>&1
  check_eq "$file (monad check exit)" "0" "$?"
  if [ ! -f "$file.nointerp" ]; then
    actual=$("$VUNA" interp "$file" 2>&1)
    check_eq "$file (monad interp)" "$expected" "$actual"
  fi
  compile_dir_and_run "$file (monad compile)" "$VUNA" "$file" "$expected"
done

for file in corpus/monad/9[0-9]_*.vuna; do
  expect_dt_error "$file" "$file"
done

# 27) stdlib（M11）：正例（interp + compile，base 经 corpus 包上下文的 vuna-base 依赖可见；
#     .nointerp 跳过 interp）；错误例都失败、含片段、不写输出目录。
for file in corpus/stdlib/[01][0-9]_*.vuna; do
  base=${file%.vuna}
  expected=$(cat "$base.out")
  if [ ! -f "$file.nointerp" ]; then
    actual=$("$VUNA" interp "$file" 2>&1)
    check_eq "$file (stdlib interp)" "$expected" "$actual"
  fi
  compile_dir_and_run "$file (stdlib compile)" "$VUNA" "$file" "$expected"
done

for file in corpus/stdlib/9[0-9]_*.vuna; do
  expect_dt_error "$file" "$file"
done

# 28) 包模式（M11.5/M12.8/M24/M26）：workspace + 依赖包 + [export] + app/Main.vuna 入口。
#     正例：`vuna build` 走 DT split → .output/{<Module>.ml,Main.ml,build.sh} + bin/<pkg>；
#     `vuna check` / `vuna test` 也已是 DT（包 check = DT 精化；test = DT 核心求值）。
#     E14（M26）：入口里声明的 data 必须发进产物 Main.ml（05_entry_data / 06_entry_trait）。
for dir in corpus/packages/[01][0-9]_*/; do
  dir=${dir%/}
  expected=$(cat "$dir/expected.out")
  rm -rf "$dir/.output"
  if ! pkg_out=$("$VUNA" build "$dir" 2>&1); then
    bad "$dir (package build)" "exit 0" "$pkg_out"
  elif [ ! -f "$dir/.output/Main.ml" ] || [ ! -f "$dir/.output/build.sh" ]; then
    bad "$dir (package layout)" "Main.ml+build.sh" "missing"
  else
    case "$dir" in
      *05_entry_data|*06_entry_trait)
        check_contains "$dir (entry data in Main.ml)" "$(cat "$dir/.output/Main.ml")" "C_Color_Red"
        ;;
    esac
    pkg_bin=
    for b in "$dir"/.output/bin/*; do
      if [ -x "$b" ]; then pkg_bin=$b; fi
    done
    if [ -z "$pkg_bin" ]; then
      bad "$dir (package bin)" "executable under .output/bin" "missing"
    else
      actual=$("$pkg_bin" 2>&1)
      check_eq "$dir (package run)" "$expected" "$actual"
    fi
  fi
  "$VUNA" check "$dir" >/dev/null 2>&1
  check_eq "$dir (package check)" "0" "$?"
  test_out=$("$VUNA" test "$dir" 2>&1)
  check_contains "$dir (package test)" "$test_out" "1 passed, 0 failed"
  rm -rf "$dir/.output"
done

# 29) 包模式错误：缺依赖 / 依赖环 / 隐藏模块（[export] 限制）/ 依赖包歧义 → 非 0、含片段、
#     不写产物。`vuna build` 在写 .output 前就做包解析与 DT 精化，失败不得留下任何产物。
#     95_cross_dep 是两包方向性实验（父目录本身不是包），见段 39。
for dir in corpus/packages/9[0-9]_*/ corpus/packages/m31_*/; do
  [ -d "$dir" ] || continue
  dir=${dir%/}
  case "$dir" in
    *95_cross_dep) continue ;;
  esac
  fragment=$(cat "$dir/expected.err")
  rm -rf "$dir/.output"
  actual=$("$VUNA" build "$dir" 2>&1)
  pkg_code=$?
  check_contains "$dir (package error)" "$actual" "$fragment"
  if [ "$pkg_code" -ne 0 ]; then ok; else bad "$dir (package error exit)" "non-zero" "$pkg_code"; fi
  if [ -e "$dir/.output" ]; then
    bad "$dir (package no output files)" "absent" "present"
  else
    ok
  fi
  rm -rf "$dir/.output"
done

# 30) fmt（M11.5/M11.6）：格式化后仍可解释（DT 语义）且输出不变；fmt 幂等。
#     M26：格式化副本放进一个带 manifest 的临时包（= corpus 包同样的 base 上下文），
#     这样 interp 看到的可见性与原文件一致（无 manifest 时是 base-only 上下文）。
mkdir -p "$tmp/fmt-pkg"
cat > "$tmp/fmt-pkg/vuna.toml" <<EOF
[package]
name = "fmt-roundtrip"

[dependencies]
vuna-base = "$VUNA_BASE"
EOF
for file in corpus/run/01_arithmetic.vuna corpus/run/03_data_case.vuna corpus/fmt/run/07_wrap.vuna corpus/monad/01_do_maybe.vuna corpus/traits/03_deriving_show_eq_enum.vuna; do
  expected=$(cat "${file%.vuna}.out")
  cp "$file" "$tmp/fmt-pkg/src.vuna"
  chmod u+w "$tmp/fmt-pkg/src.vuna"
  "$VUNA" fmt "$tmp/fmt-pkg/src.vuna" >/dev/null 2>&1
  actual=$("$VUNA" interp "$tmp/fmt-pkg/src.vuna" 2>&1)
  check_eq "$file (fmt interp)" "$expected" "$actual"
  "$VUNA" fmt --check "$tmp/fmt-pkg/src.vuna" >/dev/null 2>&1
  fmt_code=$?
  check_eq "$file (fmt idempotent)" "0" "$fmt_code"
done

# 31) doc / repl 冒烟（M23：Repl 已切 DT，顶层定义必须先输签名行；裸表达式可直接求值）
"$VUNA" doc corpus/packages/01_workspace "$tmp/api.html" >/dev/null 2>&1
check_eq "vuna doc exit" "0" "$?"
check_contains "vuna doc content" "$(cat "$tmp/api.html" 2>/dev/null)" "Vuna.Hello"
sh corpus/doc/check.sh "$VUNA" >"$tmp/doc_check.log" 2>&1
if [ "$?" -eq 0 ]; then ok; else bad "doc check" "exit 0" "$(tail -5 "$tmp/doc_check.log")"; fi
repl_out=$(printf 'x : Int\nx = 1 + 1\nx + 40\n:q\n' | "$VUNA" repl 2>&1)
check_contains "vuna repl eval" "$repl_out" "42"
printf ':q\n' | "$VUNA" repl >/dev/null 2>&1
check_eq "vuna repl exit" "0" "$?"

# 32) fmt golden 自测（test/corpus/fmt/check.sh：把工具链/编译器/base 合成为临时包编译探针；interp 已随 DT）
VUNA="$VUNA" OCAMLOPT="$OCAMLOPT" VUNA_BASE="$VUNA_BASE" sh corpus/fmt/check.sh >"$tmp/fmt_check.log" 2>&1
fmt_code=$?
if [ "$fmt_code" -eq 0 ]; then ok; else bad "fmt corpus" "exit 0" "$(tail -3 "$tmp/fmt_check.log")"; fi

# 33) M26 包级 split：`vuna compile <pkg> OUTDIR` 走 DT 逐模块 codegen
#     → OUTDIR/<Module>.ml... + Main.ml + build.sh；build.sh 增量编译（无改动不重编；
#     touch 模块只重编受影响者）。E14：入口 data 也在产物 Main.ml 里。
#     C35：每单元只 `open Vuna_runtime`（无 open 链），跨单元引用全限定（`Unit.name`）；
#     build.sh 的 compile_mod 只列直接依赖，层内并行、每模块 stamp 只含直接依赖。
for pkg in corpus/packages/[01][0-9]_*/; do
  pkg=${pkg%/}
  split_dir=$tmp/split-$(basename "$pkg")
  rm -rf "$split_dir"
  if ! split_out=$("$VUNA" compile "$pkg" "$split_dir" 2>&1); then
    bad "$pkg (package split)" "exit 0" "$split_out"
    continue
  fi
  if [ ! -f "$split_dir/build.sh" ] || [ ! -f "$split_dir/Main.ml" ]; then
    bad "$pkg (package split layout)" "Main.ml+build.sh" "missing"
    continue
  fi
  ok
  case "$pkg" in
    *05_entry_data|*06_entry_trait)
      check_contains "$pkg (entry data in split Main.ml)" "$(cat "$split_dir/Main.ml")" "C_Color_Red"
      ;;
  esac
  # C35 回归：除 Vuna_runtime.ml 外，任何生成单元的 `open` 只允许 `open Vuna_runtime`
  #（旧模型 emit `[runtime] ++ 所有前序单元` 的 open 链，这里必须失败）。
  split_bad_open=$(for ml in "$split_dir"/*.ml; do
    case "$(basename "$ml")" in
      Vuna_runtime.ml) continue ;;
    esac
    grep -H '^open ' "$ml" 2>/dev/null | grep -v 'open Vuna_runtime$'
  done | sed -n '1,3p')
  if [ -n "$split_bad_open" ]; then
    bad "$pkg (split opens only runtime)" "只允许 open Vuna_runtime" "$split_bad_open"
  else
    ok
  fi
  mkdir -p "$split_dir/bin"
  ( cd "$split_dir" && OCAMLOPT="$OCAMLOPT" sh build.sh bin/prog ) >"$tmp/split_build.log" 2>&1
  check_eq "$pkg (package split build exit)" "0" "$?"
  actual=$("$split_dir/bin/prog" 2>&1)
  check_eq "$pkg (package split run)" "$(cat "$pkg/expected.out")" "$actual"
done

# 增量构建行为用 01_workspace 验证（DT split 的编译单元 = sanitizeName 后的模块名）。
split_dir=$tmp/split-01_workspace
( cd "$split_dir" && OCAMLOPT="$OCAMLOPT" sh build.sh bin/prog ) >"$tmp/split_noop.log" 2>&1
if grep -q '^compile ' "$tmp/split_noop.log"; then
  bad "package split incremental noop" "no compile lines" "$(cat "$tmp/split_noop.log")"
else
  ok
fi
# M30：增量判定改内容哈希——touch 不再触发重编；改内容才触发。
printf '\n(* M30 incremental probe *)\n' >>"$split_dir/Vuna_dHello.ml"
( cd "$split_dir" && OCAMLOPT="$OCAMLOPT" sh build.sh bin/prog ) >"$tmp/split_inc.log" 2>&1
check_contains "package split incremental module" "$(cat "$tmp/split_inc.log")" "compile Vuna_dHello"
if grep -q '^compile Vuna_runtime' "$tmp/split_inc.log"; then
  bad "package split incremental runtime untouched" "no runtime compile" "$(cat "$tmp/split_inc.log")"
else
  ok
fi
# C35：stamp 只含直接依赖——改 Vuna.Hello 只应重编它自身与依赖它的单元（Main），
# 不应波及 Dep / Base_* / Prelude（旧模型的全序 open 链会连带重编所有后续单元）。
if grep -qE '^compile (Dep|Prelude|Base_dIO)$' "$tmp/split_inc.log"; then
  bad "package split incremental direct deps only" "只重编 Vuna_dHello 与其依赖者" "$(cat "$tmp/split_inc.log")"
else
  ok
fi

# C35：跨单元引用必须是 OCaml 限定名 `Unit.name`（旧模型靠 open 链写裸名）。
# Main.ml 引用 Vuna.Hello / Dep 的值与 Dep 的构造子，三者定义单元不同，正好覆盖
# 值 / 构造子两类跨单元引用；同时断言产物里存在 `Module.C_ctor` 形态（旧产物为零）。
# M37：IO 升格后没有构造子，main 钩子是 `v_main 0`（不再 match MkIO）。
main_ml=$split_dir/Main.ml
check_contains "package split qualified value (Vuna.Hello)" "$(cat "$main_ml")" "Vuna_dHello.v_Vuna_dHello_dhello"
check_contains "package split qualified value (Dep)" "$(cat "$main_ml")" "Dep.v_Dep_ddepText"
check_contains "package split qualified constructor (Dep)" "$(cat "$main_ml")" "Dep.C_Dep_dDepTag_Dep_dDepTagA"
split_qual_ctors=$(grep -hoE '[A-Z][A-Za-z0-9_]*\.C_[A-Za-z0-9_]+' "$split_dir"/*.ml 2>/dev/null | sed -n '1,3p')
if [ -n "$split_qual_ctors" ]; then
  ok
else
  bad "package split qualified constructors" "至少一处 Module.C_ctor" "missing"
fi
if grep -qE '(^|[^A-Za-z0-9_.])v_Vuna_dHello_dhello' "$main_ml"; then
  bad "package split no bare cross-unit value" "无未限定 v_Vuna_dHello_dhello" "$(grep -nE '(^|[^A-Za-z0-9_.])v_Vuna_dHello_dhello' "$main_ml" | sed -n '1p')"
else
  ok
fi
if grep -qE '(^|[^A-Za-z0-9_.])C_Dep_dDepTag_Dep_dDepTagA' "$main_ml"; then
  bad "package split no bare cross-unit constructor" "无未限定 C_Dep_dDepTag_Dep_dDepTagA" "$(grep -nE '(^|[^A-Za-z0-9_.])C_Dep_dDepTag_Dep_dDepTagA' "$main_ml" | sed -n 1p)"
else
  ok
fi
check_contains "package split main hook (IO intrinsic)" "$(cat "$main_ml")" "v_main 0"

# C35：build.sh 增量路径按**直接依赖**分层。01_workspace 里 Vuna.Hello 不 import 任何
# 模块（只定义 String 常量），其 compile_mod 行只应列 Vuna_runtime；旧模型会列全部前序
# 单元（Prelude/Base_* 等）。同时校验每模块一次 compile_mod 调用、多单元层用 `&`+`wait`。
split_bs=$split_dir/build.sh
split_hello_line=$(grep -E '^compile_mod Vuna_dHello( |$)' "$split_bs" | sed -n '1p')
split_hello_deps=$(printf '%s\n' "$split_hello_line" | sed -e 's/^compile_mod Vuna_dHello//' -e 's/[[:space:]]*&[[:space:]]*$//' -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
check_eq "package split direct deps Vuna_dHello" "Vuna_runtime" "$split_hello_deps"
split_modules=$(ls "$split_dir"/*.ml | wc -l | tr -d ' ')
split_compile_lines=$(grep -c '^compile_mod ' "$split_bs")
check_eq "package split compile_mod per module" "$split_modules" "$split_compile_lines"
if grep -qE '^compile_mod .* &$' "$split_bs"; then
  ok
else
  bad "package split parallel layer (&)" "compile_mod ... &" "missing"
fi
if grep -v '^[[:space:]]*#' "$split_bs" | grep -qE '(^|[^A-Za-z0-9_])wait([[:space:]]|$)'; then
  ok
else
  bad "package split parallel layer (wait)" "wait（层间串行收尾）" "missing"
fi


# 34) DT 核心路径（M13）：interp（DT 精化 + 核心求值）/ compile（DT codegen）与 golden 一致
#
# M18.5 追加：核心求值器与 codegen 必须语义一致——同一夹具 `interp` 的输出
# 与 `compile`+build.sh 产物的输出逐字节相同（不依赖 golden，直接对拍 interp 与 codegen）。
# M24：DT 是唯一路径（`--dt` 已删）；`main : IO a` 的夹具（核心求值器不执行效果）
# 带 `.nointerp` 标记，跳过 interp 只做 check+compile+run。
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
  "$VUNA" check "$file" >/dev/null 2>&1
  check_eq "$file (dt check exit)" "0" "$?"
  if compile_dir_bin "$file (dt compile)" "$VUNA" "$file"; then
    actual=$("$CD_BIN" 2>&1)
    check_eq "$file (dt run)" "$expected" "$actual"
    if [ "$have_interp" -eq 1 ]; then
      check_eq "$file (dt interp == run)" "$interp_out" "$actual"
    fi
  fi
done

# M34.7：Nat 零开销表示断言——产物里不得出现 Nat 变体类型/构造子，算术走 bi_nat*。
nat_repr_dir="$tmp/nat-repr"
rm -rf "$nat_repr_dir"
if nat_repr_out=$("$VUNA" compile corpus/dt/73_nat_repr.vuna "$nat_repr_dir" 2>&1); then
  ok
  if grep -qE 't_Base_dNat_dNat|C_Base_dNat_dNat' "$nat_repr_dir"/*.ml 2>/dev/null; then
    bad "nat runtime representation" "no Nat variant type/constructor" "$(grep -hE 't_Base_dNat_dNat|C_Base_dNat_dNat' "$nat_repr_dir"/*.ml | head -2)"
  else
    ok
  fi
  if grep -q 'bi_natAdd' "$nat_repr_dir/Main.ml"; then ok; else bad "nat runtime representation" "bi_natAdd in Main.ml" "missing"; fi
else
  bad "nat runtime representation compile" "exit 0" "$nat_repr_out"
fi

# DT 错误：check 与 compile 都失败、含片段、不写输出目录
for file in corpus/dt_err/*.vuna; do
  fragment=$(cat "${file%.vuna}.err")
  actual=$("$VUNA" check "$file" 2>&1)
  dt_code=$?
  check_contains "$file (dt error)" "$actual" "$fragment"
  if [ "$dt_code" -ne 0 ]; then ok; else bad "$file (dt error exit)" "non-zero" "$dt_code"; fi
  compile_seq=$((compile_seq + 1))
  outdir="$tmp/dt-err-$compile_seq"
  rm -rf "$outdir"
  actual=$("$VUNA" compile "$file" "$outdir" 2>&1)
  dt_code=$?
  check_contains "$file (dt compile error)" "$actual" "$fragment"
  if [ "$dt_code" -ne 0 ]; then ok; else bad "$file (dt compile error exit)" "non-zero" "$dt_code"; fi
  if [ -e "$outdir" ]; then
    bad "$file (dt no output dir)" "absent" "present"
  else
    ok
  fi
done

# 33b) 受限 FFI（M33 W5）：`extern name "c_symbol" : 基本类型` + 包根 `ffi/*.c`，
#      由生成的 build.sh 编译并链接；运行输出与 expected.out 一致。
for dir in corpus/ffi/*/; do
  dir=${dir%/}
  expected=$(cat "$dir/expected.out")
  rm -rf "$dir/.output"
  if ! ffi_out=$("$VUNA" build "$dir" 2>&1); then
    bad "$dir (ffi build)" "exit 0" "$ffi_out"
    continue
  fi
  actual=$("$dir/.output/bin/ffi-add" 2>&1)
  check_eq "$dir (ffi run)" "$expected" "$actual"
done

# 34a) DT + Base 库（M21）：包上下文（vuna-base 依赖）下 import Base.* 的三路一致性。
# 全部夹具都是纯计算（core evaluator 不执行效果），因此可保留 interp == run 对拍。
# 例外：带 `.nointerp` 标记的夹具（如 strUnpack/strPack 桥接尚不可归约）只要求
# check + compile + run。
for file in corpus/dt_base/*.vuna; do
  base=${file%.vuna}
  expected=$(cat "$base.out")
  "$VUNA" check "$file" >/dev/null 2>&1
  check_eq "$file (dt base check exit)" "0" "$?"
  interp_out=""
  have_interp=0
  if [ ! -f "$file.nointerp" ]; then
    interp_out=$("$VUNA" interp "$file" 2>&1)
    check_eq "$file (dt base interp)" "$expected" "$interp_out"
    have_interp=1
  fi
  if compile_dir_bin "$file (dt base compile)" "$VUNA" "$file"; then
    actual=$("$CD_BIN" 2>&1)
    check_eq "$file (dt base run)" "$expected" "$actual"
    if [ "$have_interp" -eq 1 ]; then
      check_eq "$file (dt base interp == run)" "$interp_out" "$actual"
    fi
  fi
done

# 34b) DT 效果（M21）：`main : IO a` 的编译产物真正执行 Base.IO 效果。
# core evaluator 是纯求值器（不跑效果），所以效果夹具只要求「编译产物输出 == golden」，
# 并额外要求 `check` 通过。
for file in corpus/dt_io/*.vuna; do
  base=${file%.vuna}
  expected=$(cat "$base.out")
  "$VUNA" check "$file" >/dev/null 2>&1
  check_eq "$file (dt io check exit)" "0" "$?"
  compile_dir_and_run "$file (dt io compile)" "$VUNA" "$file" "$expected"
done

# 34c) DT 包目录（M22.1）：check / compile 接受包目录（包上下文 + resolveProject）
exec_pkg=corpus/dt_pkg/01_exec
"$VUNA" check "$exec_pkg" >/dev/null 2>&1
check_eq "$exec_pkg (dt pkg check exit)" "0" "$?"
compile_dir_and_run "$exec_pkg (dt pkg compile)" "$VUNA" "$exec_pkg" "$(cat "$exec_pkg/expected.out")"

# 库包：check 通过；compile 清晰报错（非崩溃），且不写输出目录
lib_pkg=corpus/dt_pkg/02_lib
"$VUNA" check "$lib_pkg" >/dev/null 2>&1
check_eq "$lib_pkg (dt lib check exit)" "0" "$?"
rm -rf "$tmp/dt_lib"
lib_err=$("$VUNA" compile "$lib_pkg" "$tmp/dt_lib" 2>&1)
lib_code=$?
check_contains "$lib_pkg (dt lib compile error)" "$lib_err" "library package"
if [ "$lib_code" -ne 0 ]; then ok; else bad "$lib_pkg (dt lib compile exit)" "non-zero" "$lib_code"; fi
if [ -e "$tmp/dt_lib" ]; then
  bad "$lib_pkg (dt lib no output)" "absent" "present"
else
  ok
fi

# 非法目录 / 不存在的路径：清晰错误而非 Fatal error
bad_pkg=corpus/dt_pkg/03_bad
bad_err=$("$VUNA" check "$bad_pkg" 2>&1)
bad_code=$?
check_contains "$bad_pkg (dt bad dir error)" "$bad_err" "missing vuna.toml"
if [ "$bad_code" -ne 0 ]; then ok; else bad "$bad_pkg (dt bad dir exit)" "non-zero" "$bad_code"; fi
missing_err=$("$VUNA" check corpus/dt_pkg/99_missing 2>&1)
check_contains "dt pkg missing path error" "$missing_err" "no such file or package directory"
check_contains "dt pkg missing path no fatal" "$missing_err" "error:"

# interp 只接受单文件：包目录给出清晰错误（M22.1）。
interp_err=$("$VUNA" interp "$exec_pkg" 2>&1)
check_contains "dt interp package dir error" "$interp_err" "single file"
# M24：check/compile 默认就是 DT；help 不再宣传 `--dt`。
help_out=$("$VUNA" help 2>&1)
case "$help_out" in
  *--dt*) bad "dt help no --dt" "absent" "help still mentions --dt" ;;
  *) ok ;;
esac
# M26：包内 ad-hoc 单文件入口（包根 Main.vuna + 同包 lib/ 模块，见 corpus/dt_ad_hoc）。
dt_ad_hoc=corpus/dt_ad_hoc/Main.vuna
dt_multi_out=$("$VUNA" interp "$dt_ad_hoc" 2>&1)
dt_multi_code=$?
check_eq "dt interp package ad-hoc exit" "0" "$dt_multi_code"
check_eq "dt interp package ad-hoc output" "42" "$dt_multi_out"

# 34d) 构建入口（M22.3a / M24 / M26）：`build` 产可执行 bin；`build --no-compile` 与
#      `compile <pkg> OUTDIR` 是**同一套 split 产物**（.output / OUTDIR 布局一致）。
dt_src=corpus/dt_pkg/01_exec
dt_pkg=$tmp/dt-build-pkg
rm -rf "$dt_pkg"
cp -R "$dt_src" "$dt_pkg"
dt_expected=$(cat "$dt_src/expected.out")

if ! dt_build_out=$("$VUNA" build "$dt_pkg" 2>&1); then
  bad "$dt_src (build)" "exit 0" "$dt_build_out"
elif [ ! -x "$dt_pkg/.output/bin/dtpkg-exec" ]; then
  bad "$dt_src (build bin)" "executable" "missing"
else
  check_eq "$dt_src (build run)" "$dt_expected" "$("$dt_pkg/.output/bin/dtpkg-exec" 2>&1)"
fi

rm -rf "$dt_pkg/.output"
"$VUNA" build --no-compile "$dt_pkg" >/dev/null 2>&1
check_eq "$dt_src (build --no-compile exit)" "0" "$?"
if [ -e "$dt_pkg/.output/Main.ml" ] && [ -e "$dt_pkg/.output/build.sh" ] && [ ! -e "$dt_pkg/.output/bin" ]; then
  ok
else
  bad "$dt_src (build --no-compile layout)" "Main.ml+build.sh, no bin" "unexpected"
fi

dt_split=$tmp/dt-split
rm -rf "$dt_split"
if ! dt_split_out=$("$VUNA" compile "$dt_pkg" "$dt_split" 2>&1); then
  bad "$dt_src (compile OUTDIR)" "exit 0" "$dt_split_out"
elif [ ! -f "$dt_split/build.sh" ] || [ ! -f "$dt_split/Main.ml" ]; then
  bad "$dt_src (compile OUTDIR layout)" "Main.ml+build.sh" "missing"
elif ! ( cd "$dt_split" && OCAMLOPT="$OCAMLOPT" sh build.sh prog ) >"$tmp/dt_split.log" 2>&1; then
  bad "$dt_src (compile OUTDIR build.sh)" "exit 0" "$(cat "$tmp/dt_split.log")"
else
  check_eq "$dt_src (compile OUTDIR run)" "$dt_expected" "$("$dt_split/prog" 2>&1)"
fi

dt_lib_err=$("$VUNA" build corpus/dt_pkg/02_lib 2>&1)
dt_lib_code=$?
check_contains "$dt_src (build library error)" "$dt_lib_err" "library package"
if [ "$dt_lib_code" -ne 0 ]; then ok; else bad "$dt_src (build library exit)" "non-zero" "$dt_lib_code"; fi

# DT fmt round-trip：Pi 语法格式化后仍解析为同一程序且幂等
# 自己准备包上下文（不依赖第 30 段留下的 $tmp/fmt-pkg），这样 `--only 34` 与
# 并行跑章节（nix/run-tests.sh --jobs）都能独立通过。
mkdir -p "$tmp/fmt-pkg"
cat > "$tmp/fmt-pkg/vuna.toml" <<EOF
[package]
name = "fmt-roundtrip"

[dependencies]
vuna-base = "$VUNA_BASE"
EOF
cp corpus/dt/03_compose.vuna "$tmp/fmt-pkg/dt_fmt.vuna"
chmod u+w "$tmp/fmt-pkg/dt_fmt.vuna"
"$VUNA" fmt "$tmp/fmt-pkg/dt_fmt.vuna" >/dev/null 2>&1
actual=$("$VUNA" interp "$tmp/fmt-pkg/dt_fmt.vuna" 2>&1)
check_eq "dt fmt interp" "41" "$actual"
"$VUNA" fmt --check "$tmp/fmt-pkg/dt_fmt.vuna" >/dev/null 2>&1
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

# 36) 错误码文档：`vuna gen-errors` 从 docstring 生成（M3），分区 + 幂等（M4）
# 沙箱里源码树只读，gen-errors 写 ROOT/docs/.generated/——用 tmp 根：软链 compiler +
# 复制 Rules（readDir 跟随软链），再写 $errroot/docs/.generated/errors.md。
errroot="$tmp/errroot"
mkdir -p "$errroot/lib/Vuna/Lint" "$errroot/docs"
ln -s "$PWD/../compiler" "$errroot/compiler"
cp ../lib/Vuna/Lint/Rules.vuna "$errroot/lib/Vuna/Lint/Rules.vuna"
"$VUNA" gen-errors "$errroot" >/dev/null 2>&1
check_eq "gen-errors exit" "0" "$?"
errs_doc="$errroot/docs/.generated/errors.md"
errs_content=$(cat "$errs_doc")
check_contains "gen-errors tc section" "$errs_content" "## 类型检查 / 精化（TC_）"
check_contains "gen-errors cg section" "$errs_content" "## 代码生成（CG_）"
check_contains "gen-errors ln section" "$errs_content" "## Lint 规则（LN_）"
check_contains "gen-errors fx section" "$errs_content" "## 修复规则（FX_）"
check_contains "gen-errors tc code" "$errs_content" "TC_NotExhaustive"
check_contains "gen-errors cg code" "$errs_content" "CG_NoMain"
check_contains "gen-errors lint code" "$errs_content" "LN_LiteralIfChain"
check_contains "gen-errors fix code" "$errs_content" "FX_literalifchain"
cp "$errs_doc" "$tmp/errs1.md"
"$VUNA" gen-errors "$errroot" >/dev/null 2>&1
diff "$tmp/errs1.md" "$errs_doc" >/dev/null 2>&1
check_eq "gen-errors idempotent" "0" "$?"

# 37) M25.2a 终止性检查：遍历补全（EApp 实参 / ELet 绑定 / where）+ 调用图/SCC。
#     正例：check 通过（含结构下降、嵌套构造子、构造子包装、互递归、多 clause）；
#     负例：check 非 0 且含诊断片段（HOF 递归 / where 外层递归 / Cons 实参隐藏递归在
#     M25.2a 前是静默通过的，这些夹具锁住遍历补全的回归）。
for file in corpus/term/*.vuna; do
  term_out=$("$VUNA" check "$file" 2>&1)
  term_code=$?
  if [ "$term_code" -eq 0 ]; then ok; else bad "$file (term ok)" "exit 0" "$term_out"; fi
done
for file in corpus/term_err/*.vuna; do
  fragment=$(cat "${file%.vuna}.err")
  actual=$("$VUNA" check "$file" 2>&1)
  term_code=$?
  check_contains "$file (term error)" "$actual" "$fragment"
  if [ "$term_code" -ne 0 ]; then ok; else bad "$file (term error exit)" "non-zero" "$term_code"; fi
done

# 38) M26 API/产物快照：exports（导出面）/ modules（模块面）/ split 产物布局与逐文件
#     `type t_`/`let v_` 名字清单。快照由 `sh test/snapshots/update.sh` 生成并提交；
#     这里现场重生成到 $tmp 再逐文件 diff（失败提示重生成命令）。
snapdir=snapshots
snap_tmp="$tmp/snapshots"
mkdir -p "$snap_tmp"
if ! VUNA="$VUNA" VUNA_BASE="$VUNA_BASE" sh "$snapdir/update.sh" "$snap_tmp" >"$tmp/snap-update.log" 2>&1; then
  bad "snapshots generate" "exit 0" "$(tail -5 "$tmp/snap-update.log")"
else
  for snap_file in exports.txt modules.txt split-05_entry_data.txt split-06_entry_trait.txt split-dt_ad_hoc.txt; do
    if [ ! -f "$snapdir/$snap_file" ]; then
      bad "snapshot $snap_file" "committed file" "missing (sh test/snapshots/update.sh)"
    elif diff -u "$snapdir/$snap_file" "$snap_tmp/$snap_file" >"$tmp/snap-$snap_file.diff" 2>&1; then
      ok
    else
      bad "snapshot $snap_file" "identical" "$(head -20 "$tmp/snap-$snap_file.diff") (sh test/snapshots/update.sh)"
    fi
  done
fi

# 39) M26 上下文回归：包上下文/无 manifest 语义、效果边界、base 定位与已删路径。
ctx="$tmp/ctx"
mkdir -p "$ctx"

# 39a) 无 manifest → base-only 上下文：import Base.* 可用（base 经 VUNA_BASE 定位）。
cat > "$ctx/use_base.vuna" <<'EOF'
import Base.Nat

main : Int
main = case Succ Zero of
  Zero => 0
  Succ _ => 42
EOF
ctx_base=$("$VUNA" check "$ctx/use_base.vuna" 2>&1)
check_eq "context base-only base import" "" "$ctx_base"

# 39b) 同一上下文 import 编译器模块 → LD_ModuleNotFound（不再有全局 roots）。
cat > "$ctx/use_compiler.vuna" <<'EOF'
import Vuna.Compiler.Common

main : Int
main = 1
EOF
ctx_comp=$("$VUNA" check "$ctx/use_compiler.vuna" 2>&1)
check_contains "context compiler not visible" "$ctx_comp" "LD_ModuleNotFound"

# 39c) 效应边界（M27）：能力必须显式声明；无 manifest 的 ad-hoc 上下文没有能力，
# 直接调 effectful 内建（只有 prim_* 名）被拒，必须经 Base.IO 或声明能力。
cat > "$ctx/effect.vuna" <<'EOF'
main : Int
main = prim_print "x"
EOF
ctx_effect=$("$VUNA" check "$ctx/effect.vuna" 2>&1)
check_contains "context effect rejected" "$ctx_effect" "requires capability"

# 39d) 纯值程序在 base-only 上下文通过。
cat > "$ctx/simple.vuna" <<'EOF'
main : Int
main = 1
EOF
ctx_simple=$("$VUNA" check "$ctx/simple.vuna" 2>&1)
check_eq "context simple ok" "" "$ctx_simple"

# 39e) VUNA_BASE 指向不存在的目录：明确报错（列出尝试路径），不是静默失败。
ctx_badbase=$(VUNA_BASE=/nonexistent "$VUNA" check "$ctx/simple.vuna" 2>&1)
ctx_badbase_code=$?
if [ "$ctx_badbase_code" -ne 0 ]; then ok; else bad "context bad VUNA_BASE exit" "non-zero" "$ctx_badbase_code"; fi
check_contains "context bad VUNA_BASE message" "$ctx_badbase" "/nonexistent"

# 39f) 包内 ad-hoc 入口（corpus/dt_ad_hoc：包根 Main.vuna + 同包 lib/ 模块）。
ctx_adhoc=$("$VUNA" interp corpus/dt_ad_hoc/Main.vuna 2>&1)
check_eq "context package ad-hoc interp" "42" "$ctx_adhoc"

# 39g) 两包方向性：依赖包 b 不能 import 消费包 a 的模块 → build/check/compile 三入口都拒；
#      consumer a 本身正常 build 并运行（依赖方向由包上下文决定，不靠 roots 过滤）。
cross=corpus/packages/95_cross_dep
cross_frag=$(cat "$cross/expected.err")
for cross_cmd in "build $cross/b" "check $cross/b" "compile $cross/b $tmp/cross-out"; do
  # shellcheck disable=SC2086
  cross_msg=$("$VUNA" $cross_cmd 2>&1)
  cross_code=$?
  check_contains "context cross-dep rejected: $cross_cmd" "$cross_msg" "$cross_frag"
  if [ "$cross_code" -ne 0 ]; then ok; else bad "context cross-dep exit: $cross_cmd" "non-zero" "$cross_code"; fi
done
rm -rf "$cross/b/.output" "$tmp/cross-out"
rm -rf "$cross/a/.output"
if ! cross_build_out=$("$VUNA" build "$cross/a" 2>&1); then
  bad "context cross-dep consumer build" "exit 0" "$cross_build_out"
elif [ ! -x "$cross/a/.output/bin/consumer-a" ]; then
  bad "context cross-dep consumer bin" "executable" "missing"
else
  check_eq "context cross-dep consumer run" "$(cat "$cross/a/expected.out")" "$("$cross/a/.output/bin/consumer-a" 2>&1)"
fi
rm -rf "$cross/a/.output"

# 39h) help 不再宣传已删路径（--root / --split / seed 子命令）。
help26=$("$VUNA" help 2>&1)
case "$help26" in
  *--root*) bad "context help no --root" "absent" "help still mentions --root" ;;
  *) ok ;;
esac
case "$help26" in
  *--split*) bad "context help no --split" "absent" "help still mentions --split" ;;
  *) ok ;;
esac
case "$help26" in
  *seed*) bad "context help no seed" "absent" "help still mentions seed" ;;
  *) ok ;;
esac

# 40) M30 工具链回归：CLI 错误矩阵 + Index v3 自检 + doc [export] + search
#     三个 check.sh 是独立 POSIX 脚本（内部 mktemp 隔离，不碰仓库缓存）。
sh corpus/cli/check.sh "$VUNA" >"$tmp/cli_m30.log" 2>&1
if [ "$?" -eq 0 ]; then ok; else bad "cli m30" "exit 0" "$(tail -8 "$tmp/cli_m30.log")"; fi
sh corpus/index/check.sh "$VUNA" >"$tmp/index_m30.log" 2>&1
if [ "$?" -eq 0 ]; then ok; else bad "index m30" "exit 0" "$(tail -8 "$tmp/index_m30.log")"; fi
sh corpus/search/check.sh "$VUNA" >"$tmp/search_check.log" 2>&1
if [ "$?" -eq 0 ]; then ok; else bad "search check" "exit 0" "$(tail -5 "$tmp/search_check.log")"; fi

doc_m30_out="$tmp/doc-m30/api.html"
doc_m30=$("$VUNA" doc corpus/doc/01_export "$doc_m30_out" 2>&1)
doc_m30_code=$?
if [ "$doc_m30_code" -ne 0 ]; then
  bad "doc m30 exit" "0" "$doc_m30"
elif [ ! -f "$doc_m30_out" ]; then
  bad "doc m30 output" "writes $doc_m30_out" "missing"
else
  doc_m30_text=$(cat "$doc_m30_out")
  check_contains "doc [export] includes Visible" "$doc_m30_text" "id='visible'"
  case "$doc_m30_text" in
    *"## Hidden"*) bad "doc [export] excludes Hidden" "absent" "Hidden still documented" ;;
    *) ok ;;
  esac
fi

# 41) M30 workspace 检查/构建单元 + 确定性/增量构建
# 41a) 成员错误不能再被根 check 忽略。
member_err=$("$VUNA" check corpus/packages/m30_ws_member_error 2>&1)
member_code=$?
if [ "$member_code" -ne 0 ]; then ok; else bad "workspace member check exit" "non-zero" "$member_code"; fi
check_contains "workspace member check names package" "$member_err" "[bad]"

# 41b) workspace build：根包构建、库成员跳过；产物可运行。
ws_pkg=corpus/packages/m30_ws_build
ws_out1="$tmp/ws-build-1"
ws_out2="$tmp/ws-build-2"
if ! ws_build=$("$VUNA" build --out "$ws_out1" "$ws_pkg" 2>&1); then
  bad "workspace build" "exit 0" "$ws_build"
else
  check_contains "workspace build skips library member" "$ws_build" "skipped (library): member"
  if [ -x "$ws_out1/ws-build/bin/ws-build" ]; then
    check_eq "workspace build binary runs" "\"hello from member\"" "$("$ws_out1/ws-build/bin/ws-build" 2>&1)"
  else
    bad "workspace build binary" "executable" "missing"
  fi
  # 41c) 同哈希跳过。
  ws_build2=$("$VUNA" build --out "$ws_out1" "$ws_pkg" 2>&1)
  check_contains "workspace build up to date" "$ws_build2" "up to date:"
  # 41d) --package 只建指定包（库成员只 check/skip）。
  ws_pkg_build=$("$VUNA" build --package member --out "$tmp/ws-build-pkg" "$ws_pkg" 2>&1)
  ws_pkg_code=$?
  if [ "$ws_pkg_code" -eq 0 ]; then ok; else bad "workspace build --package" "exit 0" "$ws_pkg_build"; fi
  check_contains "workspace build --package library skip" "$ws_pkg_build" "skipped (library): member"
  # 41e) 确定性：同源两次 build 的 .ml/build.sh/meta 逐字节一致。
  if ! "$VUNA" build --out "$ws_out2" "$ws_pkg" >/dev/null 2>&1; then
    bad "workspace build second" "exit 0" "failed"
  else
    det_ok=1
    for f in "$ws_out1/ws-build"/*.ml "$ws_out1/ws-build/build.sh" "$ws_out1/ws-build/build-meta.json"; do
      base=$(basename "$f")
      if ! cmp -s "$f" "$ws_out2/ws-build/$base"; then
        det_ok=0
        bad "workspace build deterministic: $base" "identical" "differs"
      fi
    done
    [ "$det_ok" -eq 1 ] && ok
  fi
fi

# 42) M30 P3：REPL 多行/效果 + TestRunner 效果/workspace 聚合
# REPL：多行定义（`=` 续行 + 缩进 + 空行提交）与纯表达式
repl_multi=$(printf 'f : Int -> Int\nf x =\n  x + 1\n\nf 41\n:q\n' | "$VUNA" repl 2>&1)
check_contains "vuna repl multiline def" "$repl_multi" "42"
# REPL：IO 表达式走临时包编译+运行（效果输出直接到终端）
repl_io=$(printf 'import Base.IO\nprint "hi"\n:q\n' | "$VUNA" repl 2>&1)
check_contains "vuna repl io effect" "$repl_io" "hi"
# REPL：不完整输入 + 空行 → 报错丢弃但继续
repl_bad=$(printf 'x =\n\n:q\n' | "$VUNA" repl 2>&1)
check_contains "vuna repl incomplete input" "$repl_bad" "输入不完整"

# TestRunner：workspace 聚合（根包 3 纯 + 1 IO，成员 1 纯）
test_ws=$("$VUNA" test corpus/test-m30 2>&1)
test_ws_code=$?
check_eq "vuna test workspace exit" "0" "$test_ws_code"
check_contains "vuna test workspace summary" "$test_ws" "workspace: 5 passed, 0 failed"
check_contains "vuna test workspace io test" "$test_ws" "ok   IoPass.vuna"
check_contains "vuna test member group" "$test_ws" "-- test-m30-member --"
# 失败路径：纯失败 / 效果失败（退出码非 0）/ 不支持的 main 类型 / 聚合失败
"$VUNA" test corpus/test-m30/bad-pure >/dev/null 2>&1
check_eq "vuna test pure fail exit" "1" "$?"
"$VUNA" test corpus/test-m30/bad-io >/dev/null 2>&1
check_eq "vuna test io fail exit" "1" "$?"
"$VUNA" test corpus/test-m30/bad-other >/dev/null 2>&1
check_eq "vuna test other main exit" "1" "$?"
"$VUNA" test corpus/test-m30/ws-fail >/dev/null 2>&1
check_eq "vuna test workspace fail exit" "1" "$?"
# 单包行为不变：没有 test/ 仍是输入错误（exit 2）
"$VUNA" test ../base >/dev/null 2>&1
check_eq "vuna test missing dir exit" "2" "$?"

# 43) E10：`.nointerp` 不再是「静默跳过」——每个标记夹具必须能被 interp 明确拒绝
#     （效果不可执行 / 不归约为值），不得返回 0 或 golden。
for mark in $(find corpus -name '*.vuna.nointerp' | LC_ALL=C sort); do
  nointerp_file=${mark%.nointerp}
  nointerp_out=$("$VUNA" interp "$nointerp_file" 2>&1)
  nointerp_code=$?
  if [ "$nointerp_code" -ne 0 ]; then
    ok
  else
    bad "$nointerp_file (.nointerp must be rejected by interp)" "non-zero" "$nointerp_out"
  fi
done

# 44) M34.5 接口摘要（TTC 式模块化精化）：依赖包缓存预热后，根包只精化本包 decls。
#     正向：摘要路径命中（cache-path=summary）且 check 通过、产物正确；
#     负向：注入类型错误时摘要路径与全量路径（VUNA_ELAB_FULL=1）诊断逐字节一致；
#     回归：仓库自身 check . 在摘要路径下通过（C37 的 Eq Type 假歧义）。
summ_pkg=corpus/packages/m34_summary
summ_cache="$tmp/summary-cache"
mkdir -p "$summ_cache"
summ_vuna=$(command -v "$VUNA" 2>/dev/null || true)
[ -n "$summ_vuna" ] || summ_vuna="$VUNA"

# 44a) 依赖闭包自底向上预热：base（无依赖）→ dep（库包，消费 base 接口）→ root。
#      `VUNA_IFACE_SELFTEST=1` 让写侧读回校验（Marshal 稳定性 / 包接口 / 模块名集合）。
if TMPDIR="$summ_cache" VUNA_IFACE_SELFTEST=1 "$summ_vuna" check "$VUNA_BASE" --debug-perf >"$tmp/summ-base.log" 2>&1; then
  ok
else
  bad "summary base check exit" "0" "$(tail -3 "$tmp/summ-base.log")"
fi
check_contains "summary base iface selftest" "$(cat "$tmp/summ-base.log")" "iface-selftest=ok"
if TMPDIR="$summ_cache" VUNA_IFACE_SELFTEST=1 "$summ_vuna" check "$summ_pkg/dep" --debug-perf >"$tmp/summ-dep.log" 2>&1; then
  ok
else
  bad "summary dep check exit" "0" "$(tail -3 "$tmp/summ-dep.log")"
fi
check_contains "summary dep iface selftest" "$(cat "$tmp/summ-dep.log")" "iface-selftest=ok"

# 44a-2) per-module 布局：manifest + 每模块一个 iface 文件；删掉 check 缓存后重算但接口
#        未变 ⇒ 写侧只重写 manifest（`iface-write=0/`）。
summ_iface_dir=$(ls -d "$summ_cache"/vuna-cache/iface-* 2>/dev/null | head -1)
if [ -n "$summ_iface_dir" ] && [ -f "$summ_iface_dir/manifest" ] && ls "$summ_iface_dir"/*.iface >/dev/null 2>&1; then
  ok
else
  bad "summary per-module iface files" "manifest + *.iface" "missing under $summ_iface_dir"
fi
find "$summ_cache"/vuna-cache -type d -name check -prune -exec rm -rf {} + 2>/dev/null || true
if TMPDIR="$summ_cache" VUNA_IFACE_SELFTEST=1 "$summ_vuna" check "$VUNA_BASE" --debug-perf >"$tmp/summ-base2.log" 2>&1; then
  check_contains "summary per-module rewrite skip" "$(cat "$tmp/summ-base2.log")" "iface-write=0/"
else
  bad "summary per-module rewrite recheck" "0" "$(tail -3 "$tmp/summ-base2.log")"
fi

# 44a-3) 损坏的模块接口文件：读侧按自描述头拒绝 ⇒ 回退全量；写侧强制全量重写并修复
#        （不会因为「manifest 说哈希没变」而永久跳过损坏文件）。
corrupt_file=$(ls "$summ_iface_dir"/*.iface 2>/dev/null | head -1)
printf 'not-a-valid-iface' > "$corrupt_file"
rm -rf "$summ_cache"/vuna-cache/*/check
if TMPDIR="$summ_cache" VUNA_IFACE_SELFTEST=1 "$summ_vuna" check "$VUNA_BASE" --debug-perf >"$tmp/summ-corrupt.log" 2>&1; then
  check_contains "summary corrupt iface falls back" "$(cat "$tmp/summ-corrupt.log")" "cache-path=summary deps=0"
  check_contains "summary corrupt iface repaired" "$(cat "$tmp/summ-corrupt.log")" "iface-selftest=ok"
  check_contains "summary corrupt iface rewritten" "$(head -c 40 "$corrupt_file")" "vuna-iface-file 1"
else
  bad "summary corrupt iface check" "0" "$(tail -3 "$tmp/summ-corrupt.log")"
fi

# 44b) 根包（入口-only 包，没有 lib 模块接口可写）：依赖接口命中 ⇒ 摘要路径；依赖模块
#     **不再 parse 源码**；check 通过。
summ_root=$(TMPDIR="$summ_cache" VUNA_IFACE_SELFTEST=1 "$summ_vuna" check "$summ_pkg/root" --debug-perf 2>&1)
summ_root_code=$?
check_eq "summary root check exit" "0" "$summ_root_code"
check_contains "summary path used" "$summ_root" "cache-path=summary deps=2"
if printf '%s' "$summ_root" | grep -q "parse-module=Dep"; then
  bad "summary dep module not parsed" "absent" "found parse-module=Dep"
else
  ok
fi


# 44b-2) mtime 快路径：独立缓存里以 `VUNA_CACHE_MTIME=1` 预热 base/dep 后，根包仍命中摘要
#        路径（读侧用 mtime+size 快判；写侧仍存内容哈希）。
summ_mt_cache="$tmp/summary-mtime-cache"
mkdir -p "$summ_mt_cache"
TMPDIR="$summ_mt_cache" VUNA_CACHE_MTIME=1 "$summ_vuna" check "$VUNA_BASE" >/dev/null 2>&1
TMPDIR="$summ_mt_cache" VUNA_CACHE_MTIME=1 "$summ_vuna" check "$summ_pkg/dep" >/dev/null 2>&1
summ_root_mt=$(TMPDIR="$summ_mt_cache" VUNA_CACHE_MTIME=1 "$summ_vuna" check "$summ_pkg/root" --debug-perf 2>&1)
check_contains "summary mtime fast path" "$summ_root_mt" "cache-path=summary deps=2"

# 44c) 同一份源码全量路径也通过；构建产物正确（摘要只服务 check，codegen 仍全量）。
if TMPDIR="$tmp/summary-full-cache" VUNA_ELAB_FULL=1 "$summ_vuna" check "$summ_pkg/root" >/dev/null 2>&1; then ok; else bad "summary full-path check exit" "0" "$?"; fi
rm -rf "$tmp/summary-out"
if ! "$summ_vuna" build --out "$tmp/summary-out" "$summ_pkg/root" >/dev/null 2>&1; then
  bad "summary build exit" "0" "failed"
else
  check_eq "summary build runs" "42" "$("$tmp/summary-out/bin/summary-root" 2>&1)"
fi

# 44d) 负例：摘要路径不得漏检；与全量路径诊断逐字节一致。
summ_bad="$tmp/summary-bad"
mkdir -p "$summ_bad/app"
cp "$summ_pkg/root/app/Main.vuna" "$summ_bad/app/Main.vuna"
printf '\nbroken : Int\nbroken = "x"\n' >> "$summ_bad/app/Main.vuna"
sed "s|\.\./dep|$PWD/$summ_pkg/dep|; s|\.\./\.\./\.\./\.\./\.\./base|$VUNA_BASE|" "$summ_pkg/root/vuna.toml" > "$summ_bad/vuna.toml"
summ_bad_out=$(TMPDIR="$summ_cache" "$summ_vuna" check "$summ_bad" 2>&1)
summ_bad_code=$?
if [ "$summ_bad_code" -ne 0 ]; then ok; else bad "summary negative check exit" "non-zero" "$summ_bad_code"; fi
check_contains "summary negative diagnostic" "$summ_bad_out" "TC_TypeMismatch"

# 44c-2) 模块接口构建路径与全量构建路径的 codegen 产物逐字节一致（只 codegen、不链接）。
rm -rf "$tmp/summary-gen-iface" "$tmp/summary-gen-full"
mkdir -p "$tmp/summary-gen-cache-iface" "$tmp/summary-gen-cache-full"
if TMPDIR="$tmp/summary-gen-cache-iface" "$summ_vuna" compile "$summ_pkg/root" "$tmp/summary-gen-iface" >/dev/null 2>&1 \
  && TMPDIR="$tmp/summary-gen-cache-full" VUNA_ELAB_FULL=1 "$summ_vuna" compile "$summ_pkg/root" "$tmp/summary-gen-full" >/dev/null 2>&1; then
  if diff -r "$tmp/summary-gen-iface" "$tmp/summary-gen-full" >"$tmp/summary-gen.diff" 2>&1; then
    ok
  else
    bad "summary codegen iface/full identical" "identical" "$(head -10 "$tmp/summary-gen.diff")"
  fi
else
  bad "summary codegen iface/full build" "exit 0" "failed"
fi

summ_bad_full=$(TMPDIR="$tmp/summary-bad-full" VUNA_ELAB_FULL=1 "$summ_vuna" check "$summ_bad" 2>&1)
summ_bad_full_code=$?
if [ "$summ_bad_full_code" -ne 0 ]; then ok; else bad "summary negative full-path exit" "non-zero" "$summ_bad_full_code"; fi
check_eq "summary/full diagnostics identical" "$summ_bad_full" "$summ_bad_out"

# 44e) 仓库自身：预热 base/compiler 缓存后 check . 走摘要路径且通过（Interp.vuna:71 回归）。
repo_cache="$tmp/summary-repo-cache"
mkdir -p "$repo_cache"
if ! ( cd .. && TMPDIR="$repo_cache" "$summ_vuna" check base >/dev/null 2>&1 && TMPDIR="$repo_cache" "$summ_vuna" check compiler >/dev/null 2>&1 ); then
  bad "summary repo dep check" "0" "base/compiler check failed"
else
  repo_summ=$( cd .. && TMPDIR="$repo_cache" "$summ_vuna" check . --debug-perf 2>&1 )
  repo_summ_code=$?
  check_eq "summary repo check exit" "0" "$repo_summ_code"
  check_contains "summary repo path used" "$repo_summ" "cache-path=summary deps=2"
fi

# 45) M38 运行时错误报告：未捕获异常 → "vuna: runtime error: ..." + vuna 位置帧 + exit 2。
#     `.err` 的既有断言（片段 "division by zero"）仍成立；这里额外锁定新格式，
#     并确认不再泄漏 OCaml 的 `Fatal error: exception ...`。纯 main（模块初始化期求值）
#     与 IO main（main 钩子 thunk 执行期）两条路径都覆盖。
m38_rt="$tmp/m38-rt"
mkdir -p "$m38_rt/app"
printf '[package]\nname = "m38-rt"\n\n[dependencies]\nvuna-base = "%s"\n' "$VUNA_BASE" >"$m38_rt/vuna.toml"
printf 'main : Int\nmain = 10 / 0\n' >"$m38_rt/app/Main.vuna"
if ! "$VUNA" build "$m38_rt" >"$tmp/m38-rt-build.log" 2>&1; then
  bad "m38 runtime build" "exit 0" "$(tail -3 "$tmp/m38-rt-build.log")"
else
  m38_rt_err=$("$m38_rt/.output/bin/m38-rt" 2>&1 >/dev/null)
  m38_rt_code=$?
  check_contains "m38 runtime error message" "$m38_rt_err" "vuna: runtime error: division by zero"
  check_contains "m38 runtime error frame" "$m38_rt_err" "  at main ("
  check_contains "m38 runtime error location" "$m38_rt_err" "app/Main.vuna:"
  check_eq "m38 runtime error exit" "2" "$m38_rt_code"
  case "$m38_rt_err" in
    *"Fatal error"*) bad "m38 runtime error no Fatal" "no Fatal error" "$m38_rt_err" ;;
    *) ok ;;
  esac
fi
printf 'import Base.IO\n\nmain : IO Int\nmain = do\n  println "m38-start"\n  exit (10 / 0)\n' >"$m38_rt/app/Main.vuna"
if ! "$VUNA" build "$m38_rt" >"$tmp/m38-rt-io-build.log" 2>&1; then
  bad "m38 runtime io build" "exit 0" "$(tail -3 "$tmp/m38-rt-io-build.log")"
else
  m38_rt_io_out=$("$m38_rt/.output/bin/m38-rt" 2>"$tmp/m38-rt-io.err")
  m38_rt_io_code=$?
  m38_rt_io_err=$(cat "$tmp/m38-rt-io.err")
  check_contains "m38 runtime io stdout" "$m38_rt_io_out" "m38-start"
  check_contains "m38 runtime io frame" "$m38_rt_io_err" "  at main ("
  check_eq "m38 runtime io exit" "2" "$m38_rt_io_code"
fi

# 46) M38 Base.Debug：trace/traceShow 走 stderr 且返回值不变；assert/todo 失败走
#     运行时报告器（exit 2、帧指向 Base.Debug）。
m38_dbg="$tmp/m38-dbg"
mkdir -p "$m38_dbg/app"
printf '[package]\nname = "m38-dbg"\n\n[dependencies]\nvuna-base = "%s"\n' "$VUNA_BASE" >"$m38_dbg/vuna.toml"
printf 'import Base.Debug\n\nmain : Int\nmain = trace "m38-trace" (traceShow 42)\n' >"$m38_dbg/app/Main.vuna"
if ! "$VUNA" build "$m38_dbg" >"$tmp/m38-dbg-build.log" 2>&1; then
  bad "m38 debug build" "exit 0" "$(tail -3 "$tmp/m38-dbg-build.log")"
else
  m38_dbg_out=$("$m38_dbg/.output/bin/m38-dbg" 2>"$tmp/m38-dbg.err")
  m38_dbg_code=$?
  m38_dbg_err=$(cat "$tmp/m38-dbg.err")
  check_eq "m38 debug trace stdout" "42" "$m38_dbg_out"
  check_eq "m38 debug trace exit" "0" "$m38_dbg_code"
  check_contains "m38 debug trace stderr" "$m38_dbg_err" "m38-trace"
  check_contains "m38 debug traceshow stderr" "$m38_dbg_err" "42"
fi
printf 'import Base.Debug\n\nmain : Int\nmain = assert False "m38 assert" 7\n' >"$m38_dbg/app/Main.vuna"
if ! "$VUNA" build "$m38_dbg" >"$tmp/m38-assert-build.log" 2>&1; then
  bad "m38 assert build" "exit 0" "$(tail -3 "$tmp/m38-assert-build.log")"
else
  "$m38_dbg/.output/bin/m38-dbg" >/dev/null 2>"$tmp/m38-assert.err"
  m38_assert_code=$?
  m38_assert_err=$(cat "$tmp/m38-assert.err")
  check_contains "m38 assert message" "$m38_assert_err" "assertion failed: m38 assert"
  check_contains "m38 assert frame" "$m38_assert_err" "  at Base.Debug.assert ("
  check_eq "m38 assert exit" "2" "$m38_assert_code"
fi
printf 'import Base.Debug\n\nmain : Int\nmain = todo "m38 todo"\n' >"$m38_dbg/app/Main.vuna"
if ! "$VUNA" build "$m38_dbg" >"$tmp/m38-todo-build.log" 2>&1; then
  bad "m38 todo build" "exit 0" "$(tail -3 "$tmp/m38-todo-build.log")"
else
  "$m38_dbg/.output/bin/m38-dbg" >/dev/null 2>"$tmp/m38-todo.err"
  m38_todo_code=$?
  if grep -q "TODO: m38 todo" "$tmp/m38-todo.err"; then ok; else bad "m38 todo message" "TODO: m38 todo" "$(cat "$tmp/m38-todo.err")"; fi
  check_eq "m38 todo exit" "2" "$m38_todo_code"
fi

# 47) M38 vuna test 选项：--list / --filter（可重复）/ --verbose / --fail-fast；
#     默认输出与退出码不变（第 42 段已锁默认输出，这里锁新开关的行为）。
m38_tlist=$("$VUNA" test corpus/test-m30 --list 2>&1)
check_contains "m38 test list root group" "$m38_tlist" "-- test-m30 --"
check_contains "m38 test list file" "$m38_tlist" "PureInt.vuna"
check_contains "m38 test list member group" "$m38_tlist" "-- test-m30-member --"
m38_tfilter=$("$VUNA" test corpus/test-m30 --filter Pure 2>&1)
check_contains "m38 test filter run" "$m38_tfilter" "workspace: 4 passed, 0 failed"
case "$m38_tfilter" in
  *"IoPass.vuna"*) bad "m38 test filter excludes" "IoPass.vuna not run" "$m38_tfilter" ;;
  *) ok ;;
esac
m38_tmulti=$("$VUNA" test corpus/test-m30 --filter IoPass --filter member 2>&1)
check_contains "m38 test filter repeated" "$m38_tmulti" "workspace: 2 passed, 0 failed"
m38_tnone=$("$VUNA" test corpus/test-m30 --filter zzz-nomatch 2>&1)
m38_tnone_code=$?
check_contains "m38 test filter no match" "$m38_tnone" "workspace: 0 passed, 0 failed"
check_eq "m38 test filter no match exit" "0" "$m38_tnone_code"
m38_tverbose=$("$VUNA" test corpus/test-m30 --filter IoPass --verbose 2>&1)
check_contains "m38 test verbose per-file ms" "$m38_tverbose" "ok   IoPass.vuna ("
check_contains "m38 test verbose total" "$m38_tverbose" "total: "
"$VUNA" test corpus/test-m30 --filter >/dev/null 2>&1
check_eq "m38 test filter missing value" "2" "$?"
# fail-fast：root 组失败、member 组通过；默认会跑到 member，fail-fast 不会。
m38_ff="$tmp/m38-ff"
mkdir -p "$m38_ff/app" "$m38_ff/test" "$m38_ff/member/app" "$m38_ff/member/test"
printf '[package]\nname = "m38-ff"\n\n[workspace]\nmembers = ["member"]\n\n[dependencies]\nvuna-base = "%s"\n' "$VUNA_BASE" >"$m38_ff/vuna.toml"
printf '[package]\nname = "m38-ff-member"\n\n[dependencies]\nvuna-base = "%s"\n' "$VUNA_BASE" >"$m38_ff/member/vuna.toml"
printf 'main : Int\nmain = 0\n' >"$m38_ff/app/Main.vuna"
printf 'main : Int\nmain = 0\n' >"$m38_ff/member/app/Main.vuna"
printf 'main : Int\nmain = 1\n' >"$m38_ff/test/Fail.vuna"
printf 'main : Int\nmain = 0\n' >"$m38_ff/member/test/Pass.vuna"
m38_ff_all=$("$VUNA" test "$m38_ff" 2>&1)
m38_ff_all_code=$?
check_contains "m38 test fail-fast baseline member" "$m38_ff_all" "-- m38-ff-member --"
check_contains "m38 test fail-fast baseline summary" "$m38_ff_all" "workspace: 1 passed, 1 failed"
check_eq "m38 test fail-fast baseline exit" "1" "$m38_ff_all_code"
m38_ff_stop=$("$VUNA" test "$m38_ff" --fail-fast 2>&1)
m38_ff_stop_code=$?
check_contains "m38 test fail-fast summary" "$m38_ff_stop" "workspace: 0 passed, 1 failed"
check_eq "m38 test fail-fast exit" "1" "$m38_ff_stop_code"
case "$m38_ff_stop" in
  *"-- m38-ff-member --"*) bad "m38 test fail-fast stops" "member group skipped" "$m38_ff_stop" ;;
  *) ok ;;
esac

# 48) M38 vuna run：增量 build + 执行 + 参数透传 + 退出码；--no-build / 缺 bin / 库包。
"$VUNA" build corpus/packages/11_run_args >/dev/null 2>&1
m38_run_out=$("$VUNA" run corpus/packages/11_run_args 2>&1)
m38_run_code=$?
check_contains "m38 run default output" "$m38_run_out" "no args"
check_eq "m38 run exit" "0" "$m38_run_code"
m38_run_args=$("$VUNA" run corpus/packages/11_run_args --no-build -- alpha beta 2>&1)
check_eq "m38 run args passthrough" "alpha" "$m38_run_args"
m38_run_exit="$tmp/m38-run-exit"
mkdir -p "$m38_run_exit/app"
printf '[package]\nname = "m38-run-exit"\n\n[dependencies]\nvuna-base = "%s"\n' "$VUNA_BASE" >"$m38_run_exit/vuna.toml"
printf 'import Base.IO\n\nmain : IO Int\nmain = exit 7\n' >"$m38_run_exit/app/Main.vuna"
if "$VUNA" build "$m38_run_exit" >"$tmp/m38-run-exit-build.log" 2>&1; then
  "$VUNA" run "$m38_run_exit" --no-build >/dev/null 2>&1
  check_eq "m38 run child exit passthrough" "7" "$?"
else
  bad "m38 run child exit build" "exit 0" "$(tail -3 "$tmp/m38-run-exit-build.log")"
fi
m38_run_nobin="$tmp/m38-run-nobin"
mkdir -p "$m38_run_nobin/app"
printf '[package]\nname = "m38-run-nobin"\n\n[dependencies]\nvuna-base = "%s"\n' "$VUNA_BASE" >"$m38_run_nobin/vuna.toml"
printf 'main : Int\nmain = 0\n' >"$m38_run_nobin/app/Main.vuna"
m38_run_nobin_out=$("$VUNA" run "$m38_run_nobin" --no-build 2>&1)
m38_run_nobin_code=$?
check_contains "m38 run missing binary" "$m38_run_nobin_out" "binary not found"
check_eq "m38 run missing binary exit" "2" "$m38_run_nobin_code"
m38_run_lib_out=$("$VUNA" run ../base 2>&1)
m38_run_lib_code=$?
check_contains "m38 run library package" "$m38_run_lib_out" "no executable entry"
check_eq "m38 run library package exit" "2" "$m38_run_lib_code"

# 49) M38 REPL 调试命令：:type / :load / :reload / :browse + 错误路径。
m38_repl_ty=$(printf ':type 1 + 1\n:q\n' | "$VUNA" repl 2>&1)
check_contains "m38 repl :type" "$m38_repl_ty" "1 + 1 : Int"
m38_repl_ty_usage=$(printf ':type\n:q\n' | "$VUNA" repl 2>&1)
check_contains "m38 repl :type usage" "$m38_repl_ty_usage" "用法: :type"
m38_scratch="$tmp/m38-scratch.vuna"
printf 'answer : Int\nanswer = 42\n' >"$m38_scratch"
m38_repl_load=$(printf ':load %s\nanswer\n:reload\nanswer\n:q\n' "$m38_scratch" | "$VUNA" repl 2>&1)
check_contains "m38 repl :load" "$m38_repl_load" "已加载"
check_contains "m38 repl :reload" "$m38_repl_load" "已重新加载"
check_contains "m38 repl loaded value" "$m38_repl_load" "42"
m38_repl_mod=$(printf ':load %s/../lib/Vuna/Repl.vuna\n:q\n' "$VUNA_BASE" | "$VUNA" repl 2>&1)
check_contains "m38 repl :load rejects module" "$m38_repl_mod" "是模块文件"
m38_repl_noload=$(printf ':reload\n:q\n' | "$VUNA" repl 2>&1)
check_contains "m38 repl :reload without load" "$m38_repl_noload" "还没有 :load"
m38_repl_unknown=$(printf ':frobnicate\n:q\n' | "$VUNA" repl 2>&1)
check_contains "m38 repl unknown command" "$m38_repl_unknown" "未知命令"
m38_bws="$tmp/m38-browse"
mkdir -p "$m38_bws/lib"
printf '[package]\nname = "m38-browse"\n\n[dependencies]\nvuna-base = "%s"\n' "$VUNA_BASE" >"$m38_bws/vuna.toml"
printf 'module Foo where\n\ngreeting : String\ngreeting = "hi"\n' >"$m38_bws/lib/Foo.vuna"
m38_browse=$( ( cd "$m38_bws" && printf ':browse Foo\n:q\n' | "$VUNA" repl 2>&1 ) )
check_contains "m38 repl :browse header" "$m38_browse" "## Foo"
check_contains "m38 repl :browse symbol" "$m38_browse" "greeting : String"

# 50) M38 CLI 诊断片段：`-->` + 源码行 + 插入符；无位置错误保持单行；退出码不变。
m38_diag="$tmp/m38-diag-pkg"
mkdir -p "$m38_diag/app"
printf '[package]\nname = "m38-diag-pkg"\n\n[dependencies]\nvuna-base = "%s"\n' "$VUNA_BASE" >"$m38_diag/vuna.toml"
printf 'main : Int\nmain = "boom"\n' >"$m38_diag/app/Main.vuna"
m38_diag_out=$("$VUNA" check "$m38_diag" 2>&1)
m38_diag_code=$?
check_contains "m38 diag snippet arrow" "$m38_diag_out" "  --> "
check_contains "m38 diag snippet location" "$m38_diag_out" "app/Main.vuna:2:8"
check_contains "m38 diag snippet source line" "$m38_diag_out" 'main = "boom"'
check_contains "m38 diag snippet caret" "$m38_diag_out" "^"
check_eq "m38 diag snippet exit" "1" "$m38_diag_code"
m38_noloc=$("$VUNA" check "$tmp/m38-no-such-entry.vuna" 2>&1)
m38_noloc_code=$?
check_contains "m38 diag no-location message" "$m38_noloc" "no such file"
check_eq "m38 diag no-location exit" "1" "$m38_noloc_code"
case "$m38_noloc" in
  *"-->"*) bad "m38 diag no-location single line" "no snippet" "$m38_noloc" ;;
  *) ok ;;
esac
# 44f) 包内逐模块增量（S4）：复制 base，改一个叶子模块后重算——其余模块复用、只 parse
#      改动模块、第二次运行收敛（全部干净、零重写）、manifest 与全量路径逐字节一致，
#      注入类型错误后增量与全量诊断逐字节一致。
incr_base="$tmp/incr-base"
incr_cache="$tmp/incr-cache"
cp -r "$VUNA_BASE" "$incr_base"
if ! TMPDIR="$incr_cache" "$summ_vuna" check "$incr_base" >/dev/null 2>&1; then
  bad "summary incremental cold check" "0" "cold base copy failed"
else
  printf '\nincrProbe : Int\nincrProbe = 1\n' >> "$incr_base/lib/Base/Error.vuna"
  incr_log=$(TMPDIR="$incr_cache" "$summ_vuna" check "$incr_base" --debug-perf 2>&1)
  incr_code=$?
  check_eq "summary incremental check exit" "0" "$incr_code"
  incr_total=$(find "$incr_cache"/vuna-cache/iface-* -name "*.iface" 2>/dev/null | wc -l)
  incr_clean=$(printf %s "$incr_log" | sed -n "s/.*cache-own-clean=\([0-9][0-9]*\).*/\1/p")
  if [ -n "$incr_clean" ] && [ "$incr_total" -gt 0 ] && [ "$incr_clean" -lt "$incr_total" ]; then ok; else bad "summary incremental reuses clean modules" "0 < clean < $incr_total" "clean=$incr_clean total=$incr_total"; fi
  incr_parse=$(printf %s "$incr_log" | grep -c "parse-module=Base\." || true)
  check_eq "summary incremental parses only dirty modules" "$((incr_total - incr_clean))" "$incr_parse"
  incr_writes=$(printf %s "$incr_log" | grep -o "iface-write=[0-9]*" | head -1 | cut -d= -f2)
  if [ -n "$incr_writes" ] && [ "$incr_writes" -ge 1 ]; then ok; else bad "summary incremental writes changed module" ">=1" "writes=$incr_writes"; fi
  rm -rf "$incr_cache"/vuna-cache/*/check
  incr_log2=$(TMPDIR="$incr_cache" "$summ_vuna" check "$incr_base" --debug-perf 2>&1)
  check_contains "summary incremental converged clean" "$incr_log2" "cache-own-clean=$incr_total"
  check_contains "summary incremental converged writes" "$incr_log2" "iface-write=0/"
  printf '\nbadProbe : Int\nbadProbe = "x"\n' >> "$incr_base/lib/Base/Error.vuna"
  TMPDIR="$incr_cache" "$summ_vuna" check "$incr_base" >"$tmp/incr-bad.log" 2>&1
  incr_bad=$(grep -vE "^(DEBUG|PERF) " "$tmp/incr-bad.log")
  TMPDIR="$tmp/incr-bad-full" VUNA_ELAB_FULL=1 "$summ_vuna" check "$incr_base" >"$tmp/incr-bad-full.log" 2>&1
  full_bad=$(grep -vE "^(DEBUG|PERF) " "$tmp/incr-bad-full.log")
  check_contains "summary incremental negative diagnostic" "$incr_bad" "TC_TypeMismatch"
  check_eq "summary incremental/full diagnostics identical" "$full_bad" "$incr_bad"
fi

# 44g) LSP/REPL 消费依赖接口（`VUNA_IFACE_TOOL=1`，默认关闭）：预热依赖接口后，
#      REPL 求值走接口路径（`iface-source=repl`），LSP 诊断链仍全部通过；默认路径不变。
repo_iface_repl=$( cd .. && TMPDIR="$repo_cache" VUNA_IFACE_TOOL=1 VUNA_DEBUG_PERF=1 sh -c 'printf "x : Int\nx = 1 + 1\nx + 40\n:q\n" | "$0" repl' "$summ_vuna" 2>&1 )
check_contains "summary repl consumes dep ifaces" "$repo_iface_repl" "iface-source=repl modules="
check_contains "summary repl iface eval" "$repo_iface_repl" "42"
repo_iface_mods=$(printf %s "$repo_iface_repl" | grep -o "iface-tool-lazy modules=[0-9]*" | head -1 | sed "s/.*=//")
if [ -n "$repo_iface_mods" ] && [ "$repo_iface_mods" -lt 60 ]; then ok; else bad "summary repl lazy iface closure" "<60 modules" "modules=$repo_iface_mods"; fi
if ( cd .. && TMPDIR="$repo_cache" VUNA_IFACE_TOOL=1 sh test/corpus/lsp/smoke.sh "$summ_vuna" >/dev/null 2>&1 ); then
  ok
else
  bad "summary lsp consumes dep ifaces" "0" "smoke failed"
fi

# 44h) codegen 单元级缓存（S5）：改入口后重建——依赖单元命中缓存，产物与干净重建逐字节一致。
unit_pkg="$tmp/unit-pkg"
cp -r "$summ_pkg" "$unit_pkg"
sed -i "s|\.\./\.\./\.\./\.\./\.\./base|$VUNA_BASE|" "$unit_pkg/root/vuna.toml"
sed -i "s|\.\./\.\./\.\./\.\./\.\./base|$VUNA_BASE|" "$unit_pkg/dep/vuna.toml" 2>/dev/null || true
unit_cache="$tmp/unit-cache"
rm -rf "$tmp/unit-gen1" "$tmp/unit-gen2"
if TMPDIR="$unit_cache" VUNA_UNIT_CACHE=1 "$summ_vuna" build --no-compile --out "$tmp/unit-gen1" "$unit_pkg/root" >/dev/null 2>&1; then
  printf '\nunitProbe : Int\nunitProbe = 1\n' >> "$unit_pkg/root/app/Main.vuna"
  unit_log=$(TMPDIR="$unit_cache" VUNA_UNIT_CACHE=1 VUNA_DEBUG_PERF=1 "$summ_vuna" build --no-compile --out "$tmp/unit-gen1" "$unit_pkg/root" 2>&1)
  check_contains "summary unit cache hit" "$unit_log" "unit-cache-hit "
  TMPDIR="$tmp/unit-fresh-cache" VUNA_UNIT_CACHE=1 "$summ_vuna" build --no-compile --out "$tmp/unit-gen2" "$unit_pkg/root" >/dev/null 2>&1
  if diff -r "$tmp/unit-gen1" "$tmp/unit-gen2" >"$tmp/unit-gen.diff" 2>&1; then
    ok
  else
    bad "summary unit cache output identical" "identical" "$(head -5 "$tmp/unit-gen.diff")"
  fi
else
  bad "summary unit cache cold build" "0" "failed"
fi

# 44i) 依赖可见性收敛（S6）：dep 的实例在**未被 import** 的模块里时，摘要路径与全量路径
#      必须一致地拒绝（不能把整包实例并入视图）；import 后两条路径都必须接受。
vis_base="$tmp/vis-base"
cp -r "$VUNA_BASE" "$vis_base"
vis_pkgdir="$tmp/vis-pkg"
rm -rf "$vis_pkgdir"
cp -r corpus/packages/vis_scope/. "$vis_pkgdir/"
sed -i "s|\.\./\.\./\.\./\.\./\.\./base|$vis_base|" "$vis_pkgdir/dep/vuna.toml" "$vis_pkgdir/root/vuna.toml" "$vis_pkgdir/root2/vuna.toml"
vis_cache="$tmp/vis-cache"
if TMPDIR="$vis_cache" "$VUNA" check "$vis_base" >/dev/null 2>&1 && TMPDIR="$vis_cache" "$VUNA" check "$vis_pkgdir/dep" >/dev/null 2>&1; then
  vis_root_sum=$(TMPDIR="$vis_cache" "$VUNA" build --no-compile --out "$tmp/vis-root-out" "$vis_pkgdir/root" 2>&1); vis_root_sum_exit=$?
  vis_root_full=$(TMPDIR="$vis_cache" VUNA_ELAB_FULL=1 "$VUNA" build --no-compile --out "$tmp/vis-root-out-full" "$vis_pkgdir/root" 2>&1); vis_root_full_exit=$?
  if [ "$vis_root_sum_exit" -ne 0 ] && [ "$vis_root_full_exit" -ne 0 ]; then ok; else bad "summary vis root rejected" "nonzero/nonzero" "summary=$vis_root_sum_exit full=$vis_root_full_exit"; fi
  check_contains "summary vis root error code" "$vis_root_sum" "TC_"
  vis_root2_sum=$(TMPDIR="$vis_cache" "$VUNA" build --no-compile --out "$tmp/vis-root2-out" "$vis_pkgdir/root2" 2>&1); vis_root2_sum_exit=$?
  vis_root2_full=$(TMPDIR="$vis_cache" VUNA_ELAB_FULL=1 "$VUNA" build --no-compile --out "$tmp/vis-root2-out-full" "$vis_pkgdir/root2" 2>&1); vis_root2_full_exit=$?
  check_eq "summary vis root2 accepted (summary)" "0" "$vis_root2_sum_exit"
  check_eq "summary vis root2 accepted (full)" "0" "$vis_root2_full_exit"
else
  bad "summary vis fixture warmup" "0" "base/dep check failed"
fi

# 44j) 单元缓存按 entry 分桶 + GC（S7）：同一包上下文里不同入口文件各占一个桶；切换入口
#      时旧桶被 GC 清掉，同一入口（路径不变、内容变了）重建仍能命中单元缓存。
uj_pkg="$tmp/unit-entry-pkg"
mkdir -p "$uj_pkg"
printf '[package]\nname = "unit-entry-pkg"\n\n[dependencies]\nvuna-base = "%s"\n' "$VUNA_BASE" >"$uj_pkg/vuna.toml"
printf 'main : Int\nmain = 1\n' >"$uj_pkg/A.vuna"
printf 'main : Int\nmain = 2\n' >"$uj_pkg/B.vuna"
uj_cache="$tmp/unit-cache-j"
rm -rf "$uj_cache" "$tmp/unit-j1" "$tmp/unit-j2"
if TMPDIR="$uj_cache" VUNA_UNIT_CACHE=1 "$summ_vuna" compile "$uj_pkg/A.vuna" "$tmp/unit-j1" >/dev/null 2>&1; then
  printf '\n-- probe\n' >>"$uj_pkg/A.vuna"
  uj_log=$(TMPDIR="$uj_cache" VUNA_UNIT_CACHE=1 VUNA_DEBUG_PERF=1 "$summ_vuna" compile "$uj_pkg/A.vuna" "$tmp/unit-j1" 2>&1)
  uj_hits=$(printf %s "$uj_log" | grep -c "unit-cache-hit" || true)
  if [ "$uj_hits" -ge 1 ]; then ok; else bad "summary unit cache same-entry hits" ">=1" "hits=$uj_hits"; fi
  if TMPDIR="$uj_cache" VUNA_UNIT_CACHE=1 "$summ_vuna" compile "$uj_pkg/B.vuna" "$tmp/unit-j2" >/dev/null 2>&1; then
    uj_buckets=$(find "$uj_cache"/vuna-cache -path "*split-units/e-*" -name "*.unit" 2>/dev/null | xargs -r -n1 dirname | sort -u | wc -l)
    check_eq "summary unit cache one entry bucket" "1" "$uj_buckets"
  else
    bad "summary unit cache entry B compile" "0" "failed"
  fi
else
  bad "summary unit cache entry A compile" "0" "failed"
fi

# 44k) M34.6 工具链惰性闭包完整性（默认开启）：同包模块自己 import 的依赖包模块必须
#      进闭包（否则 Loader 从源码加载它们却没有 artifact，假报 TC_UnknownName）；本包
#      manifest 缺失/新增模块时安全阀回退全量，诊断仍正确。
kk_root="$tmp/iface-k-root"
kk_dep="$tmp/iface-k-dep"
kk_cache="$tmp/iface-k-cache"
mkdir -p "$kk_dep/lib" "$kk_root/lib" "$kk_root/app"
printf '[package]\nname = "iface-k-dep"\n\n[export]\nmodules = ["KDep"]\n\n[dependencies]\nvuna-base = "%s"\n' "$VUNA_BASE" >"$kk_dep/vuna.toml"
printf 'module KDep (kdepVal, KBox(..), unKBox) where\n\ndata KBox : Type where\n  MkKBox : Int -> KBox\n\nunKBox : KBox -> Int\nunKBox (MkKBox n) = n\n\nkdepVal : Int\nkdepVal = 42\n' >"$kk_dep/lib/KDep.vuna"
printf '[package]\nname = "iface-k-root"\n\n[dependencies]\niface-k-dep = "%s"\nvuna-base = "%s"\n' "$kk_dep" "$VUNA_BASE" >"$kk_root/vuna.toml"
printf 'module KInner (innerVal) where\n\nimport KDep\n\ninnerVal : Int\ninnerVal = kdepVal\n' >"$kk_root/lib/KInner.vuna"
printf 'module KOuter (outerVal) where\n\nimport KInner\n\nouterVal : Int\nouterVal = innerVal + 1\n' >"$kk_root/lib/KOuter.vuna"
printf 'import KOuter\n\nmain : Int\nmain = outerVal\n' >"$kk_root/app/Main.vuna"
if TMPDIR="$kk_cache" "$summ_vuna" check "$VUNA_BASE" >/dev/null 2>&1 && TMPDIR="$kk_cache" "$summ_vuna" check "$kk_dep" >/dev/null 2>&1 && TMPDIR="$kk_cache" "$summ_vuna" check "$kk_root" >/dev/null 2>&1; then
  kk_repl_default=$( cd "$kk_root" && TMPDIR="$kk_cache" VUNA_DEBUG_PERF=1 sh -c 'printf "import KOuter\nouterVal\n:q\n" | "$0" repl' "$summ_vuna" 2>&1 )
  check_contains "tool iface default lazy closure" "$kk_repl_default" "iface-tool-lazy modules="
  check_contains "tool iface default eval" "$kk_repl_default" "43"
  case "$kk_repl_default" in
    *TC_UnknownName*) bad "tool iface closure has no false unknown-name" "no TC_UnknownName" "$kk_repl_default" ;;
    *) ok ;;
  esac
  kk_repl_full=$( cd "$kk_root" && TMPDIR="$kk_cache" VUNA_IFACE_TOOL=0 sh -c 'printf "import KOuter\nouterVal\n:q\n" | "$0" repl' "$summ_vuna" 2>&1 )
  check_contains "tool iface full path eval" "$kk_repl_full" "43"
  # 依赖包的 data/ctor 在接口路径下必须能被 REPL 表达式求值看到（S7 组装 DtProgram 时
  # 漏补依赖 datas ⇒ `[1,2,3]`/构造子报假 TC_UnknownName）。
  kk_repl_ctor=$( cd "$kk_root" && TMPDIR="$kk_cache" sh -c 'printf "import KDep\nunKBox (MkKBox 7)\n:q\n" | "$0" repl' "$summ_vuna" 2>&1 )
  check_contains "tool iface repl dep ctor eval" "$kk_repl_ctor" "7"
  case "$kk_repl_ctor" in
    *TC_UnknownName*) bad "tool iface repl dep ctor no false unknown-name" "no TC_UnknownName" "$kk_repl_ctor" ;;
    *) ok ;;
  esac
  # 安全阀：新增一个不在本包 manifest 里的模块，它的依赖无法从 manifest 闭包推出；
  # 加载后必须回退全量（iface-fallback=repl）且结果仍正确。
  printf 'module KNew (newVal) where\n\nimport KDep\n\nnewVal : Int\nnewVal = kdepVal + 1\n' >"$kk_root/lib/KNew.vuna"
  kk_repl_new=$( cd "$kk_root" && TMPDIR="$kk_cache" VUNA_DEBUG_PERF=1 sh -c 'printf "import KNew\nnewVal\n:q\n" | "$0" repl' "$summ_vuna" 2>&1 )
  check_contains "tool iface safety valve fallback" "$kk_repl_new" "iface-fallback=repl missing="
  check_contains "tool iface safety valve eval" "$kk_repl_new" "43"
else
  bad "tool iface closure fixture warmup" "0" "dep/root check failed"
fi

# 44l) M34.6（5a/5c）LSP 单文件增量精化 + 会话缓存：
#      - LSP-only 会话（依赖已 check、本包未 check）didOpen 成功后写回当前模块接口；
#      - 接口路径与全量路径（VUNA_IFACE_TOOL=0）对同一 buffer 的诊断逐字节一致；
#      - 外部修改同包依赖模块后，**同一 LSP 进程**的下一次请求必须失效并重报；
#      - 大闭包文件（仓库根包 lib/）的 LSP 诊断在接口路径与全量路径一致；
#      - REPL 同进程多次求值复用 termAux 缓存，结果不变。
#
# LSP 帧驱动：Content-Length 精确字节（body 后没有换行）；didOpen/didChange 都是 Full 同步。
lsp_inc_json_escape() { # file -> 单行 JSON 字符串内容（只处理换行；夹具源码不含引号/反斜杠）
  sed -e 's/$/\\n/' "$1" | tr -d '\n'
}

lsp_inc_frame() { # body -> 完整帧
  printf 'Content-Length: %s\r\n\r\n%s' "$(printf '%s' "$1" | wc -c)" "$1"
}

lsp_inc_last_diags() { # 日志 -> 最后一条 publishDiagnostics 的 diagnostics 数组
  grep -o '"diagnostics":\[[^]]*\]' "$1" | tail -1 | sed 's/^"diagnostics"://'
}

lsp_inc_single() { # $1=iface(1|0) $2=cache $3=cwd $4=uri $5=textfile $6=log
  _init=$(printf '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"processId":null,"rootUri":"file://%s","capabilities":{}}}' "$3")
  _open=$(printf '{"jsonrpc":"2.0","method":"textDocument/didOpen","params":{"textDocument":{"uri":"%s","languageId":"vuna","version":1,"text":"%s"}}}' "$4" "$(lsp_inc_json_escape "$5")")
  _shut='{"jsonrpc":"2.0","id":9,"method":"shutdown","params":null}'
  _exit='{"jsonrpc":"2.0","method":"exit","params":null}'
  {
    lsp_inc_frame "$_init"
    lsp_inc_frame '{"jsonrpc":"2.0","method":"initialized","params":{}}'
    lsp_inc_frame "$_open"
    sleep 0.3
    lsp_inc_frame "$_shut"
    lsp_inc_frame "$_exit"
  } | ( cd "$3" && TMPDIR="$2" VUNA_IFACE_TOOL="$1" "$summ_vuna" lsp >"$6" 2>/dev/null )
  lsp_inc_last_diags "$6"
}

# A) LSP-only 写回：依赖接口预热、本包不 check；didOpen 后 manifest 里出现当前模块接口。
lsp_wb="$tmp/lsp-inc-wb"
lsp_wb_cache="$tmp/lsp-inc-wb-cache"
mkdir -p "$lsp_wb/app" "$lsp_wb/lib"
printf '[package]\nname = "lsp-inc-wb"\n\n[dependencies]\nvuna-base = "%s"\n' "$VUNA_BASE" >"$lsp_wb/vuna.toml"
printf 'module WInner (innerVal) where\n\ninnerVal : Int\ninnerVal = 41\n' >"$lsp_wb/lib/WInner.vuna"
printf 'module WOuter (outerVal) where\n\nimport WInner\n\nouterVal : Int\nouterVal = innerVal + 1\n' >"$lsp_wb/lib/WOuter.vuna"
printf 'import WOuter\n\nmain : Int\nmain = outerVal\n' >"$lsp_wb/app/Main.vuna"
if TMPDIR="$lsp_wb_cache" "$summ_vuna" check "$VUNA_BASE" >/dev/null 2>&1; then
  lsp_wb_uri="file://$lsp_wb/lib/WOuter.vuna"
  lsp_wb_diags=$(lsp_inc_single 1 "$lsp_wb_cache" "$lsp_wb" "$lsp_wb_uri" "$lsp_wb/lib/WOuter.vuna" "$tmp/lsp-inc-wb.log")
  check_eq "lsp incremental cold clean diagnostics" "[]" "$lsp_wb_diags"
  if find "$lsp_wb_cache"/vuna-cache/iface-* -name 'WOuter.iface' 2>/dev/null | grep -q .; then ok; else bad "lsp incremental writes back module iface" "WOuter.iface" "missing"; fi
else
  bad "lsp incremental writeback warmup base" "0" "base check failed"
fi

# B) 会话失效：warm 包（Inner/Outer 都有接口）里，外部把 Inner 改成 Bool——
#    同一 LSP 进程的下一次请求必须重读并报出 Outer 的类型错误（不能复用陈旧接口）。
lsp_s="$tmp/lsp-inc-sess"
lsp_s_cache="$tmp/lsp-inc-sess-cache"
mkdir -p "$lsp_s/app" "$lsp_s/lib"
printf '[package]\nname = "lsp-inc-sess"\n\n[dependencies]\nvuna-base = "%s"\n' "$VUNA_BASE" >"$lsp_s/vuna.toml"
printf 'module SInner (innerVal) where\n\ninnerVal : Int\ninnerVal = 41\n' >"$lsp_s/lib/SInner.vuna"
printf 'module SOuter (outerVal) where\n\nimport SInner\n\nouterVal : Int\nouterVal = innerVal + 1\n' >"$lsp_s/lib/SOuter.vuna"
printf 'import SOuter\n\nmain : Int\nmain = outerVal\n' >"$lsp_s/app/Main.vuna"
if TMPDIR="$lsp_s_cache" "$summ_vuna" check "$VUNA_BASE" >/dev/null 2>&1 && TMPDIR="$lsp_s_cache" "$summ_vuna" check "$lsp_s" >/dev/null 2>&1; then
  # 诊断一致性：错误 buffer 下接口路径与全量路径逐字节一致。
  printf 'module SOuter (outerVal) where\n\nimport SInner\n\nouterVal : Int\nouterVal = innerVal + True\n' >"$tmp/lsp-inc-err.vuna"
  lsp_s_uri="file://$lsp_s/lib/SOuter.vuna"
  lsp_s_iface=$(lsp_inc_single 1 "$lsp_s_cache" "$lsp_s" "$lsp_s_uri" "$tmp/lsp-inc-err.vuna" "$tmp/lsp-inc-iface.log")
  lsp_s_full=$(lsp_inc_single 0 "$tmp/lsp-inc-full-cache" "$lsp_s" "$lsp_s_uri" "$tmp/lsp-inc-err.vuna" "$tmp/lsp-inc-full.log")
  check_contains "lsp incremental error diagnostic" "$lsp_s_iface" "TC_"
  check_eq "lsp incremental/full diagnostics identical" "$lsp_s_full" "$lsp_s_iface"

  # 同一进程：先 didOpen（无错），外部改 SInner 后 didChange（无错文本 + 注释）⇒ 报错。
  lsp_s_out="$tmp/lsp-inc-sess.out"
  lsp_s_in="$tmp/lsp-inc-sess.in"
  rm -f "$lsp_s_in" "$lsp_s_out"
  mkfifo "$lsp_s_in"
  ( cd "$lsp_s" && TMPDIR="$lsp_s_cache" "$summ_vuna" lsp <"$lsp_s_in" >"$lsp_s_out" 2>"$tmp/lsp-inc-sess.err" ) &
  lsp_s_pid=$!
  exec 8>"$lsp_s_in"
  lsp_s_send() { lsp_inc_frame "$1" >&8; }
  lsp_s_init=$(printf '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"processId":null,"rootUri":"file://%s","capabilities":{}}}' "$lsp_s")
  lsp_s_open=$(printf '{"jsonrpc":"2.0","method":"textDocument/didOpen","params":{"textDocument":{"uri":"%s","languageId":"vuna","version":1,"text":"%s"}}}' "$lsp_s_uri" "$(lsp_inc_json_escape "$lsp_s/lib/SOuter.vuna")")
  lsp_s_send "$lsp_s_init"
  lsp_s_send '{"jsonrpc":"2.0","method":"initialized","params":{}}'
  lsp_s_send "$lsp_s_open"
  lsp_s_wait() { # $1=expected diag count
    _i=0
    while [ "$_i" -lt 400 ]; do
      _c=$(grep -o '"method":"textDocument/publishDiagnostics"' "$lsp_s_out" 2>/dev/null | wc -l)
      [ "$_c" -ge "$1" ] && return 0
      sleep 0.05
      _i=$((_i + 1))
    done
    return 1
  }
  if lsp_s_wait 1; then ok; else bad "lsp session first diagnostics" "1" "timeout"; fi
  check_eq "lsp session first diagnostics empty" "[]" "$(grep -o '"diagnostics":\[[^]]*\]' "$lsp_s_out" | sed -n '1p' | sed 's/^"diagnostics"://')"
  # 外部修改依赖模块（类型从 Int 变 Bool）。
  printf 'module SInner (innerVal) where\n\ninnerVal : Bool\ninnerVal = True\n' >"$lsp_s/lib/SInner.vuna"
  # didChange 的 buffer 文本必须变化（否则命中进程内诊断帧缓存）：在磁盘文本后加一行注释。
  cp "$lsp_s/lib/SOuter.vuna" "$tmp/lsp-inc-sess-change.vuna"
  printf '\n-- lsp session touch\n' >>"$tmp/lsp-inc-sess-change.vuna"
  lsp_s_change=$(printf '{"jsonrpc":"2.0","method":"textDocument/didChange","params":{"textDocument":{"uri":"%s","version":2},"contentChanges":[{"text":"%s"}]}}' "$lsp_s_uri" "$(lsp_inc_json_escape "$tmp/lsp-inc-sess-change.vuna")")
  lsp_s_send "$lsp_s_change"
  if lsp_s_wait 2; then ok; else bad "lsp session external-change diagnostics" "2" "timeout"; fi
  lsp_s_second=$(grep -o '"diagnostics":\[[^]]*\]' "$lsp_s_out" | sed -n '2p' | sed 's/^"diagnostics"://')
  case "$lsp_s_second" in
    *TC_*) ok ;;
    *) bad "lsp session invalidates on external change" "TC_ diagnostic" "$lsp_s_second" ;;
  esac
  lsp_s_send '{"jsonrpc":"2.0","id":9,"method":"shutdown","params":null}'
  lsp_s_send '{"jsonrpc":"2.0","method":"exit","params":null}'
  exec 8>&-
  wait "$lsp_s_pid" 2>/dev/null || true
  rm -f "$lsp_s_in"
else
  bad "lsp session fixture warmup" "0" "base/pkg check failed"
fi

# C) 大闭包文件：仓库根包 lib/ 文件的 LSP 诊断在接口路径与全量路径一致（用 44e 的 repo 缓存）。
if TMPDIR="$repo_cache" "$summ_vuna" check "$VUNA_BASE" >/dev/null 2>&1; then
  lsp_big_uri="file://$(cd .. && pwd)/lib/Vuna/Interp.vuna"
  lsp_big_iface=$(lsp_inc_single 1 "$repo_cache" ".." "$lsp_big_uri" "../lib/Vuna/Interp.vuna" "$tmp/lsp-big-iface.log")
  lsp_big_full=$(lsp_inc_single 0 "$tmp/lsp-big-full-cache" ".." "$lsp_big_uri" "../lib/Vuna/Interp.vuna" "$tmp/lsp-big-full.log")
  check_eq "lsp big-closure incremental/full diagnostics identical" "$lsp_big_full" "$lsp_big_iface"
else
  bad "lsp big-closure warmup" "0" "base check failed"
fi

# D) REPL：同进程多次求值复用 termAux 缓存（依赖接口路径），结果不变。
repl_inc=$( cd .. && printf 'import Vuna.Compiler.Driver.Dt\n1 + 1\n2 + 2\n3 + 3\n:q\n' | TMPDIR="$repo_cache" "$summ_vuna" repl 2>&1 )
check_contains "repl aux cache first eval" "$repl_inc" "vuna> 2"
check_contains "repl aux cache second eval" "$repl_inc" "vuna> 4"
check_contains "repl aux cache third eval" "$repl_inc" "vuna> 6"
case "$repl_inc" in
  *TC_*) bad "repl aux cache no diagnostics" "no TC_" "$repl_inc" ;;
  *) ok ;;
esac
repl_inc_reset=$( cd .. && printf 'import Vuna.Compiler.Driver.Dt\n1 + 1\n:reset\n2 + 2\n:q\n' | TMPDIR="$repo_cache" "$summ_vuna" repl 2>&1 )
check_contains "repl reset clears cache state" "$repl_inc_reset" "vuna> 4"

# 51) mtime 快路径安全窗（`VUNA_CACHE_MTIME=1`）：`prim_fileMtime` 只有秒精度，
#     「同秒 + 同大小」的编辑不能靠 mtime+size 判未变。安全窗（5s）内一律回落内容哈希，
#     所以刚写出的接口即使 mtime/size 都没变也必须被判定失效（回退全量、报出真实错误）。
#     确定性做法：编辑后把 mtime 显式 touch 回记录的秒值（模拟同一秒内两次写）。
mt_cache="$tmp/mtime-window-cache"
mt_dep="$tmp/mtime-window-dep"
mt_root="$tmp/mtime-window-root"
rm -rf "$mt_cache" "$mt_dep" "$mt_root"
mkdir -p "$mt_dep/lib" "$mt_root/app"
printf '[package]\nname = "mtime-window-dep"\n\n[export]\nmodules = ["MDep"]\n\n[dependencies]\nvuna-base = "%s"\n' "$VUNA_BASE" >"$mt_dep/vuna.toml"
printf 'module MDep (mVal) where\n\nmVal : Int\nmVal = 1\n' >"$mt_dep/lib/MDep.vuna"
printf '[package]\nname = "mtime-window-root"\n\n[dependencies]\nmtime-window-dep = "%s"\nvuna-base = "%s"\n' "$mt_dep" "$VUNA_BASE" >"$mt_root/vuna.toml"
printf 'import MDep\n\nmain : Int\nmain = mVal\n' >"$mt_root/app/Main.vuna"
if TMPDIR="$mt_cache" VUNA_CACHE_MTIME=1 "$VUNA" check "$VUNA_BASE" >/dev/null 2>&1 \
  && TMPDIR="$mt_cache" VUNA_CACHE_MTIME=1 "$VUNA" check "$mt_dep" >/dev/null 2>&1 \
  && TMPDIR="$mt_cache" VUNA_CACHE_MTIME=1 "$VUNA" check "$mt_root" >/dev/null 2>&1; then
  mt_file="$mt_dep/lib/MDep.vuna"
  mt_sec=$(stat -c %Y "$mt_file")
  mt_size=$(stat -c %s "$mt_file")
  # 同字节长度改内容：Int → Bnt（未知类型名；mtime 秒值与大小都不变）。
  sed -i 's/mVal : Int/mVal : Bnt/' "$mt_file"
  touch -d "@$mt_sec" "$mt_file"
  mt_now=$(date +%s)
  if [ "$(stat -c %Y "$mt_file")" = "$mt_sec" ] && [ "$(stat -c %s "$mt_file")" = "$mt_size" ] && [ $((mt_now - mt_sec)) -lt 5 ]; then
    mt_out=$(TMPDIR="$mt_cache" VUNA_CACHE_MTIME=1 "$VUNA" check "$mt_root" 2>&1)
    mt_code=$?
    if [ "$mt_code" -ne 0 ]; then ok; else bad "mtime window same-second edit invalidated" "non-zero" "check passed with stale iface"; fi
    check_contains "mtime window diagnostic" "$mt_out" "Bnt"
  else
    bad "mtime window fixture" "same mtime/size within 5s" "sec=$mt_sec size=$mt_size now=$mt_now"
  fi
else
  bad "mtime window warmup" "0" "base/dep/root check failed"
fi

# 52) C32 最小硬化：check / split / ast 缓存载荷统一 framing（magic|tag|长度|校验和）。
#     截断（长度不符）、篡改（校验和不符）都必须被读侧拒绝 ⇒ 回退重算、不崩，且缓存文件
#     被重写成合法 framing。单字节篡改用 dd 打在载荷中部（不是头部，避免只靠 magic 就过）。
c32_pkg="$tmp/c32-pkg"
c32_cache="$tmp/c32-cache"
c32_clean="$tmp/c32-clean"
c32_out2="$tmp/c32-out2"
rm -rf "$c32_pkg" "$c32_cache" "$c32_clean" "$c32_out2"
cp -r corpus/packages/m34_summary "$c32_pkg"
sed -i "s|\.\./\.\./\.\./\.\./\.\./base|$VUNA_BASE|" "$c32_pkg/root/vuna.toml"
sed -i "s|\.\./\.\./\.\./\.\./\.\./base|$VUNA_BASE|" "$c32_pkg/dep/vuna.toml" 2>/dev/null || true
if TMPDIR="$c32_cache" "$VUNA" build --no-compile --out "$c32_clean" "$c32_pkg/root" >/dev/null 2>&1; then
  c32_split=$(find "$c32_cache"/vuna-cache -path '*split*' -type f 2>/dev/null | head -1)
  if [ -n "$c32_split" ]; then
    # 52a) 截断：头行完整、载荷少一截（长度校验必须拒绝）。
    head -c 4096 "$c32_split" > "$c32_split.part"
    mv "$c32_split.part" "$c32_split"
    c32_rc=0
    TMPDIR="$c32_cache" "$VUNA" build --no-compile --out "$c32_out2" "$c32_pkg/root" >/dev/null 2>&1 || c32_rc=$?
    check_eq "c32 truncated split cache rebuild exit" "0" "$c32_rc"
    if diff -r "$c32_clean" "$c32_out2" >/dev/null 2>&1; then ok; else bad "c32 truncated split cache output" "identical" "diff"; fi
    check_eq "c32 truncated split cache rewritten" "vuna-cache-frame 1" "$(head -c 18 "$c32_split")"
    # 52b) 篡改：在载荷中部改一个字节（长度不变，校验和必须拒绝）。
    c32_off=$(( $(stat -c %s "$c32_split") / 2 ))
    printf 'X' | dd of="$c32_split" bs=1 seek="$c32_off" conv=notrunc 2>/dev/null
    c32_rc=0
    TMPDIR="$c32_cache" "$VUNA" build --no-compile --out "$c32_out2" "$c32_pkg/root" >/dev/null 2>&1 || c32_rc=$?
    check_eq "c32 tampered split cache rebuild exit" "0" "$c32_rc"
    if diff -r "$c32_clean" "$c32_out2" >/dev/null 2>&1; then ok; else bad "c32 tampered split cache output" "identical" "diff"; fi
  else
    bad "c32 split cache fixture" "split cache file" "none"
  fi
else
  bad "c32 clean build" "0" "failed"
fi

# 52c) check 缓存：截断后必须视为未命中（重算并覆盖），不能静默当成功。
c32_cc="$tmp/c32-check-cache"
rm -rf "$c32_cc"
TMPDIR="$c32_cc" "$VUNA" check "$c32_pkg/dep" >/dev/null 2>&1
TMPDIR="$c32_cc" "$VUNA" check "$c32_pkg/root" >/dev/null 2>&1
c32_check=$(find "$c32_cc"/vuna-cache -path '*/check/*' -type f 2>/dev/null | head -1)
if [ -n "$c32_check" ]; then
  # 把**全部** check 缓存文件截断：只挑一个可能挑到 dep 的缓存，root check 仍命中自己的
  # 合法缓存 ⇒ 没有 cache-path 日志（Nix 沙箱与本地目录顺序不同，曾因此假失败）。
  for c32_f in $(find "$c32_cc"/vuna-cache -path '*/check/*' -type f 2>/dev/null); do
    head -c 200 "$c32_f" > "$c32_f.part"
    mv "$c32_f.part" "$c32_f"
  done
  c32_log=$(TMPDIR="$c32_cc" VUNA_DEBUG_PERF=1 "$VUNA" check "$c32_pkg/root" 2>&1)
  c32_code=$?
  check_eq "c32 corrupt check cache exit" "0" "$c32_code"
  check_contains "c32 corrupt check cache recomputed" "$c32_log" "cache-path="
  c32_reframed=1
  for c32_f in $(find "$c32_cc"/vuna-cache -path '*/check/*' -type f 2>/dev/null); do
    [ "$(head -c 18 "$c32_f")" = "vuna-cache-frame 1" ] || c32_reframed=0
  done
  check_eq "c32 corrupt check cache rewritten" "1" "$c32_reframed"
else
  bad "c32 check cache fixture" "check cache file" "none"
fi

# 52d) AST 缓存：全部截断后照常 parse 并重写（原实现会 Marshal.from_string 崩溃）。
c32_ac="$tmp/c32-ast-cache"
rm -rf "$c32_ac"
TMPDIR="$c32_ac" "$VUNA" check "$c32_pkg/root" >/dev/null 2>&1
TMPDIR="$c32_ac" "$VUNA" check "$c32_pkg/root" >/dev/null 2>&1
c32_ast_list=$(find "$c32_ac/vuna-cache/ast" -type f 2>/dev/null)
if [ -n "$c32_ast_list" ]; then
  c32_ast_count=$(printf '%s\n' "$c32_ast_list" | wc -l | tr -d ' ')
  for f in $c32_ast_list; do
    head -c 8 "$f" > "$f.part"
    mv "$f.part" "$f"
  done
  # 删掉 check 缓存强制重算（否则 check 命中根本不会 parse，也就不会读 AST 缓存）。
  rm -rf "$c32_ac"/vuna-cache/*/check
  c32_rc=0
  TMPDIR="$c32_ac" "$VUNA" check "$c32_pkg/root" >/dev/null 2>&1 || c32_rc=$?
  check_eq "c32 truncated ast cache recheck exit" "0" "$c32_rc"
  c32_framed=0
  for f in $(find "$c32_ac/vuna-cache/ast" -type f 2>/dev/null); do
    [ "$(head -c 18 "$f")" = "vuna-cache-frame 1" ] && c32_framed=$((c32_framed + 1))
  done
  check_eq "c32 truncated ast cache rewritten" "$c32_ast_count" "$c32_framed"
else
  bad "c32 ast cache fixture" "ast cache files" "none"
fi

# 53) codegen 单元缓存**默认开启**（`VUNA_UNIT_CACHE=0` opt-out）+ 桶内 GC：
#     - 多模块包改叶子后默认路径必须命中未受影响单元（`unit-cache-hit`），产物与干净重建
#       逐字节一致；`VUNA_UNIT_CACHE=0` 必须完全不写/不用单元缓存。
#     - 同一入口反复编辑（entry key 每轮都变）后，桶内 `.unit` 文件数必须收敛到「本次单元
#       数」（= 产物 .ml 数），不能随编辑次数累积。
u53="$tmp/unit-default-pkg"
u53_cache="$tmp/unit-default-cache"
u53_out="$tmp/unit-default-out"
rm -rf "$u53" "$u53_cache" "$u53_out"
mkdir -p "$u53/lib" "$u53/app"
printf '[package]\nname = "unit-default-pkg"\n\n[dependencies]\nvuna-base = "%s"\n' "$VUNA_BASE" >"$u53/vuna.toml"
printf 'module Leaf (leafVal) where\n\nleafVal : Int\nleafVal = 1\n' >"$u53/lib/Leaf.vuna"
printf 'module Mid (midVal) where\n\nimport Leaf\n\nmidVal : Int\nmidVal = leafVal + 1\n' >"$u53/lib/Mid.vuna"
printf 'module Top (topVal) where\n\nimport Mid\n\ntopVal : Int\ntopVal = midVal + 1\n' >"$u53/lib/Top.vuna"
n=1
while [ "$n" -le 4 ]; do
  printf 'module Other%d (other%d) where\n\nother%d : Int\nother%d = %d\n' "$n" "$n" "$n" "$n" "$n" >"$u53/lib/Other$n.vuna"
  n=$((n + 1))
done
printf 'import Top\nimport Other1\nimport Other2\nimport Other3\nimport Other4\n\nmain : Int\nmain = topVal + other1 + other2 + other3 + other4\n' >"$u53/app/Main.vuna"
if TMPDIR="$u53_cache" "$VUNA" build --no-compile --out "$u53_out" "$u53" >/dev/null 2>&1; then
  u53_units=$(find "$u53_out" -maxdepth 1 -name '*.ml' | wc -l | tr -d ' ')
  u53_bucket0=$(find "$u53_cache"/vuna-cache/*/split-units -name '*.unit' 2>/dev/null | wc -l | tr -d ' ')
  # 改叶子（Leaf/Mid/Top 三个单元失效；Other1..4 与 runtime/entry 中 runtime 仍可命中）。
  printf 'module Leaf (leafVal) where\n\nleafVal : Int\nleafVal = 2\n' >"$u53/lib/Leaf.vuna"
  u53_log=$(TMPDIR="$u53_cache" VUNA_DEBUG_PERF=1 "$VUNA" build --no-compile --out "$u53_out" "$u53" 2>&1)
  u53_code=$?
  check_eq "unit cache default build exit" "0" "$u53_code"
  if printf '%s' "$u53_log" | grep -q "unit-cache-hit "; then ok; else bad "unit cache default hits unaffected units" "unit-cache-hit" "none"; fi
  # 干净重建（独立缓存 + 显式关闭）→ 产物逐字节一致。
  rm -rf "$tmp/unit-default-fresh"
  if TMPDIR="$tmp/unit-default-fresh" VUNA_UNIT_CACHE=0 "$VUNA" build --no-compile --out "$tmp/unit-default-fresh-out" "$u53" >/dev/null 2>&1; then
    if diff -r "$u53_out" "$tmp/unit-default-fresh-out" >/dev/null 2>&1; then ok; else bad "unit cache default output identical" "identical" "diff"; fi
  else
    bad "unit cache fresh rebuild" "0" "failed"
  fi
  # opt-out：完全不使用单元缓存（无 hit 记录，也不产生 split-units 文件）。
  rm -rf "$tmp/unit-optout-cache"
  u53_off=$(TMPDIR="$tmp/unit-optout-cache" VUNA_UNIT_CACHE=0 VUNA_DEBUG_PERF=1 "$VUNA" build --no-compile --out "$tmp/unit-optout-out" "$u53" 2>&1)
  if printf '%s' "$u53_off" | grep -q "unit-cache-hit "; then bad "unit cache opt-out no hits" "no unit-cache-hit" "found hit"; else ok; fi
  if find "$tmp/unit-optout-cache" -name '*.unit' 2>/dev/null | grep -q .; then bad "unit cache opt-out writes nothing" "no .unit" "found .unit"; else ok; fi
  # 桶内 GC：连续编辑入口 6 轮，桶内文件数收敛到单元数。
  u53_i=1
  while [ "$u53_i" -le 6 ]; do
    printf 'import Top\nimport Other1\nimport Other2\nimport Other3\nimport Other4\n\nmain : Int\nmain = topVal + other1 + other2 + other3 + other4 + %d\n' "$u53_i" >"$u53/app/Main.vuna"
    TMPDIR="$u53_cache" "$VUNA" build --no-compile --out "$u53_out" "$u53" >/dev/null 2>&1 || bad "unit cache bucket edit $u53_i" "0" "build failed"
    u53_i=$((u53_i + 1))
  done
  u53_bucket_files=$(find "$u53_cache"/vuna-cache/*/split-units -name '*.unit' 2>/dev/null | wc -l | tr -d ' ')
  check_eq "unit cache bucket bounded" "$u53_bucket0" "$u53_bucket_files"
  if [ "$u53_units" -gt 0 ] && [ "$u53_bucket0" -gt 0 ] && [ "$u53_bucket0" -le "$u53_units" ]; then
    ok
  else
    bad "unit cache bucket unit count" "0 < bucket0 <= $u53_units" "bucket0=$u53_bucket0"
  fi
else
  bad "unit cache default warmup" "0" "build failed"
fi

# 54) REPL v2：自动签名 / 泛化 / 重定义 / 块输入 / 加载矩阵 / 命令面 / 颜色 / 历史 /
#     pty 行编辑（方向键、Ctrl-R、Ctrl-C、Ctrl-D、Tab）。
check_absent() { # 名字 片段 文本
  case "$3" in
    *"$2"*) bad "$1" "absent" "found: $2" ;;
    *) ok ;;
  esac
}

repl_v2_defs=$(printf 'x = 1 + 1\nx + 40\nf y = x + y\nf 40\nid z = z\nid 41\n:q\n' | "$VUNA" repl 2>&1)
check_contains "repl v2 auto sig value" "$repl_v2_defs" "42"
check_contains "repl v2 auto sig function" "$repl_v2_defs" "41"

repl_v2_poly=$(printf 'id z = z\n:type id\n:q\n' | "$VUNA" repl 2>&1)
check_contains "repl v2 generalization" "$repl_v2_poly" "id : {t0 : Type} -> t0 -> t0"

repl_v2_bad=$(printf 'f 0 = 1\n1 + 1\n:q\n' | "$VUNA" repl 2>&1)
check_contains "repl v2 infer failure hint" "$repl_v2_bad" "请先写类型签名"
check_contains "repl v2 infer failure rollback" "$repl_v2_bad" "2"

repl_v2_redef=$(printf 'x = 1\nx = 2\nx\n:delete x\nx\n:q\n' | "$VUNA" repl 2>&1)
check_contains "repl v2 redefinition" "$repl_v2_redef" "已删除 x"
check_contains "repl v2 delete then unbound" "$repl_v2_redef" "unbound variable x"

repl_v2_block=$(printf ':{\n  x = 1 + 1\n  f y = x + y\n:}\nf 40\n:q\n' | "$VUNA" repl 2>&1)
check_contains "repl v2 block def" "$repl_v2_block" "42"

repl_v2_defs_cmd=$(printf 'x = 1\nf y = x + y\n:defs\n:imports\nimport Base.IO\n:imports\n:q\n' | "$VUNA" repl 2>&1)
check_contains "repl v2 :defs type" "$repl_v2_defs_cmd" "x : Int"
check_contains "repl v2 :defs fn type" "$repl_v2_defs_cmd" "f : Int -> Int"
check_contains "repl v2 :imports" "$repl_v2_defs_cmd" "import Base.IO"

# B1 回归：显式隐式 binder 不再被重复量化；B3 回归：类型文本 zonk。
repl_v2_ty=$(printf 'm : {a : Type} -> a -> a\nm x = x\n:type m\n:type [1, 2, 3]\nid z = z\n:type id 1\n:q\n' | "$VUNA" repl 2>&1)
check_contains "repl v2 no duplicate implicit binder" "$repl_v2_ty" "m : {a : Type} -> a -> a"
check_absent "repl v2 duplicate implicit binder absent" "{a : Type} -> {a : Type}" "$repl_v2_ty"
check_contains "repl v2 type zonk list" "$repl_v2_ty" "List Int"
check_contains "repl v2 type infer app" "$repl_v2_ty" "id 1 : Int"

# 值显示：列表 / 元组 / Maybe / 函数 / 构造子短名。
repl_v2_show=$(printf ':load Base.Nat\nSucc Zero\nimport Base.List\nimport Base.Maybe\nimport Base.Pair\n[1, 2, 3]\nJust 1\nPair 1 2\nfun x = x\nfun\n:q\n' | "$VUNA" repl 2>&1)
check_contains "repl v2 show list" "$repl_v2_show" "[1, 2, 3]"
check_contains "repl v2 show maybe" "$repl_v2_show" "Just 1"
check_contains "repl v2 show pair" "$repl_v2_show" "(1, 2)"
check_contains "repl v2 show function" "$repl_v2_show" "<函数>"
check_contains "repl v2 show short ctor" "$repl_v2_show" "Succ Zero"

# :set / 历史 / :again / :abandon / 未知命令建议。
repl_v2_set=$(printf ':set +t\n1 + 1\n:set +s\n1 + 1\n:set prompt X> \n:q\n' | "$VUNA" repl 2>&1)
check_contains "repl v2 :set +t" "$repl_v2_set" ":: Int"
check_contains "repl v2 :set +s" "$repl_v2_set" " ms]"
check_contains "repl v2 :set prompt" "$repl_v2_set" "prompt = X> "

rm -f "$tmp/repl-v2-again-hist"
repl_v2_again=$(printf ':set +t\n:set -t\n:again 1\n:q\n' | VUNA_REPL_HISTORY="$tmp/repl-v2-again-hist" "$VUNA" repl 2>&1)
again_hits=$(printf '%s\n' "$repl_v2_again" | grep -c "+t on" || true)
check_eq "repl v2 :again" "2" "$again_hits"

repl_v2_abandon=$(printf 'x =\n:abandon\n1 + 1\n:q\n' | "$VUNA" repl 2>&1)
check_contains "repl v2 :abandon" "$repl_v2_abandon" "已放弃当前输入"
check_contains "repl v2 :abandon continues" "$repl_v2_abandon" "2"

repl_v2_unknown=$(printf ':typ\n:q\n' | "$VUNA" repl 2>&1)
check_contains "repl v2 unknown suggestion" "$repl_v2_unknown" ":type"

# 模块加载 / 模块名错误 / 目录加载 / 模块文件拒绝。
repl_v2_mod=$(printf ':load Base.Nat\nZero\n:q\n' | "$VUNA" repl 2>&1)
check_contains "repl v2 :load module" "$repl_v2_mod" "已导入模块 Base.Nat"
check_contains "repl v2 :load module usable" "$repl_v2_mod" "Zero"

repl_v2_nomod=$(printf ':load Does.Not.Exist\n:q\n' | "$VUNA" repl 2>&1)
check_contains "repl v2 :load missing module" "$repl_v2_nomod" "找不到模块"

repl_ws="$tmp/repl-v2-ws"
mkdir -p "$repl_ws/lib"
printf '[package]\nname = "replws"\n\n[dependencies]\nvuna-base = "%s"\n' "$VUNA_BASE" >"$repl_ws/vuna.toml"
printf 'module Foo (greeting) where\n\ngreeting : String\ngreeting = "hi"\n' >"$repl_ws/lib/Foo.vuna"
repl_v2_dir=$(printf ':q\n' | "$VUNA" repl "$repl_ws" 2>&1)
check_contains "repl v2 cli DIR context" "$repl_v2_dir" "replws"
repl_v2_dirload=$(printf ':load %s\n:q\n' "$repl_ws" | "$VUNA" repl 2>&1)
check_contains "repl v2 :load DIR" "$repl_v2_dirload" "已切换包 replws"

repl_v2_ws=$( ( cd "$repl_ws" && printf ':browse Foo\n:info greeting\n:search greeting\n:browse\n:q\n' | "$VUNA" repl 2>&1 ) )
check_contains "repl v2 :browse module" "$repl_v2_ws" "## Foo"
check_contains "repl v2 :info symbol" "$repl_v2_ws" "Foo.greeting"
check_contains "repl v2 :search hit" "$repl_v2_ws" "greeting : String"
check_contains "repl v2 :browse list" "$repl_v2_ws" "Foo.vuna"

repl_entry="$tmp/repl-v2-entry.vuna"
printf 'answer : Int\nanswer = 42\n' >"$repl_entry"
repl_v2_file=$(printf 'answer\n:q\n' | "$VUNA" repl "$repl_entry" 2>&1)
check_contains "repl v2 cli FILE load" "$repl_v2_file" "已加载"
check_contains "repl v2 cli FILE usable" "$repl_v2_file" "42"
repl_v2_cli_mod=$(printf 'Zero\n:q\n' | "$VUNA" repl Base.Nat 2>&1)
check_contains "repl v2 cli MODULE" "$repl_v2_cli_mod" "已导入模块 Base.Nat"
printf ':q\n' | "$VUNA" repl Does.Not.Exist >/dev/null 2>&1
repl_v2_cli_bad_code=$?
check_eq "repl v2 cli bad module exit" "2" "$repl_v2_cli_bad_code"

# 颜色：管道默认关闭；`:set color on` 强制开启。
repl_v2_plain=$(printf '1 + 1\n:q\n' | "$VUNA" repl 2>&1)
check_absent "repl v2 no ansi in pipe" "$(printf '\033')" "$repl_v2_plain"
repl_v2_color=$(printf ':set color on\n1 + 1\n:q\n' | "$VUNA" repl 2>&1)
check_contains "repl v2 color on ansi" "$repl_v2_color" "$(printf '\033')["

# 历史持久化：单行单元写入文件，下一次会话恢复。
printf '7 + 1\n:q\n' | VUNA_REPL_HISTORY="$tmp/repl-v2-hist" "$VUNA" repl >/dev/null 2>&1
check_contains "repl v2 history file" "$(cat "$tmp/repl-v2-hist" 2>/dev/null)" "7 + 1"
repl_v2_hist2=$(printf ':history\n:q\n' | VUNA_REPL_HISTORY="$tmp/repl-v2-hist" "$VUNA" repl 2>&1)
check_contains "repl v2 history restored" "$repl_v2_hist2" "7 + 1"

# pty 行编辑：方向键 / Ctrl-R / 退格 / Ctrl-C / Ctrl-D / Tab。
if command -v script >/dev/null 2>&1; then
  repl_pty_arrow=$( ( sleep 0.5; printf '1 + 1\n'; sleep 0.3; printf '\033[A\n'; sleep 0.3; printf ':q\n' ) \
    | NO_COLOR=1 VUNA_REPL_HISTORY="$tmp/repl-pty-a" script -qec "$VUNA repl" /dev/null 2>&1 | tr -d '\r' )
  repl_pty_arrow_n=$(printf '%s\n' "$repl_pty_arrow" | grep -c '^2$' || true)
  check_eq "repl v2 pty arrow-up" "2" "$repl_pty_arrow_n"

  repl_pty_cr=$( ( sleep 0.5; printf '1 + 1\n'; sleep 0.3; printf '\0221 + 1\r\r'; sleep 0.3; printf ':q\n' ) \
    | NO_COLOR=1 VUNA_REPL_HISTORY="$tmp/repl-pty-r" script -qec "$VUNA repl" /dev/null 2>&1 | tr -d '\r' )
  repl_pty_cr_n=$(printf '%s\n' "$repl_pty_cr" | grep -c '^2$' || true)
  check_eq "repl v2 pty ctrl-r" "2" "$repl_pty_cr_n"

  repl_pty_bs=$( ( sleep 0.5; printf '12\033[D\177\n'; sleep 0.3; printf ':q\n' ) \
    | NO_COLOR=1 VUNA_REPL_HISTORY="$tmp/repl-pty-b" script -qec "$VUNA repl" /dev/null 2>&1 | tr -d '\r' )
  repl_pty_bs_n=$(printf '%s\n' "$repl_pty_bs" | grep -c '^2$' || true)
  check_eq "repl v2 pty left+backspace" "1" "$repl_pty_bs_n"

  repl_pty_cc=$( ( sleep 0.5; printf '1 + 1\003'; sleep 0.3; printf '2 + 2\n'; sleep 0.3; printf ':q\n' ) \
    | NO_COLOR=1 VUNA_REPL_HISTORY="$tmp/repl-pty-c" script -qec "$VUNA repl" /dev/null 2>&1 | tr -d '\r' )
  repl_pty_cc_4=$(printf '%s\n' "$repl_pty_cc" | grep -c '^4$' || true)
  repl_pty_cc_2=$(printf '%s\n' "$repl_pty_cc" | grep -c '^2$' || true)
  check_eq "repl v2 pty ctrl-c cancels line" "0" "$repl_pty_cc_2"
  check_eq "repl v2 pty ctrl-c continues" "1" "$repl_pty_cc_4"

  ( sleep 0.5; printf '\004' ) | NO_COLOR=1 VUNA_REPL_HISTORY="$tmp/repl-pty-d" script -qec "$VUNA repl" /dev/null >/dev/null 2>&1
  check_eq "repl v2 pty ctrl-d exit" "0" "$?"

  repl_pty_tab=$( ( sleep 0.5; printf ':he\t\n'; sleep 0.3; printf ':q\n' ) \
    | NO_COLOR=1 VUNA_REPL_HISTORY="$tmp/repl-pty-t" script -qec "$VUNA repl" /dev/null 2>&1 | tr -d '\r' )
  check_contains "repl v2 pty tab completion" "$repl_pty_tab" "命令："
else
  bad "repl v2 pty tests" "script (util-linux) in PATH" "missing"
fi

if [ "$fail" -ne 0 ]; then
  printf '%s passed, %s failed\n' "$pass" "$fail"
  exit 1
fi
printf 'vuna tests passed (%s checks)\n' "$pass"
