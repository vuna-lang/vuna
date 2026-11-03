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

# 2) 模块夹具：DT 精化后核心求值 + compile 都要读取模块并得到 expected.out（正例 01–29）
#    M26：每个夹具目录有独立 vuna.toml（只依赖 base），入口 app/Main.vuna 的 import
#    从同包 lib/ 模块根解析（09_package_modules 覆盖「同包模块根」语义）。
for dir in corpus/modules/[012][0-9]_*; do
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

# 24) 跨模块 trait 正例：无头模块全导出（含命名实例）/ header 显式 Trait(..)（interp + compile）
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
#     `.nointerp`：核心求值不执行效果/不归约 → 跳过 interp；
#     `.nocompile`：擦除 codegen 尚不支持（多隐式参数字典 binder）→ 只断言 check。
for file in corpus/monad/[01][0-9]_*.vuna; do
  base=${file%.vuna}
  expected=$(cat "$base.out")
  "$VUNA" check "$file" >/dev/null 2>&1
  check_eq "$file (monad check exit)" "0" "$?"
  if [ -f "$file.nocompile" ]; then
    continue
  fi
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
for dir in corpus/packages/9[0-9]_*/; do
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
version = "0.1.0"
edition = "2026"

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
"$VUNA" doc corpus/packages/01_workspace "$tmp/api.md" >/dev/null 2>&1
check_eq "vuna doc exit" "0" "$?"
check_contains "vuna doc content" "$(cat "$tmp/api.md" 2>/dev/null)" "## Vuna.Hello"
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
touch "$split_dir/Vuna_dHello.ml"
( cd "$split_dir" && OCAMLOPT="$OCAMLOPT" sh build.sh bin/prog ) >"$tmp/split_inc.log" 2>&1
check_contains "package split incremental module" "$(cat "$tmp/split_inc.log")" "compile Vuna_dHello"
if grep -q '^compile Vuna_runtime' "$tmp/split_inc.log"; then
  bad "package split incremental runtime untouched" "no runtime compile" "$(cat "$tmp/split_inc.log")"
else
  ok
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

if [ "$fail" -ne 0 ]; then
  printf '%s passed, %s failed\n' "$pass" "$fail"
  exit 1
fi
printf 'vuna tests passed (%s checks)\n' "$pass"