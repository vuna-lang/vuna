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
# Main.ml 引用 Vuna.Hello / Dep 的值与 Base.IO 的构造子，三者定义单元不同，正好覆盖
# 值 / 构造子两类跨单元引用；同时断言产物里存在 `Module.C_ctor` 形态（旧产物为零）。
main_ml=$split_dir/Main.ml
check_contains "package split qualified value (Vuna.Hello)" "$(cat "$main_ml")" "Vuna_dHello.v_Vuna_dHello_dhello"
check_contains "package split qualified value (Dep)" "$(cat "$main_ml")" "Dep.v_Dep_ddepText"
check_contains "package split qualified constructor (Base.IO)" "$(cat "$main_ml")" "Base_dIO.C_Base_dIO_dIO_Base_dIO_dMkIO"
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
if grep -qE '(^|[^A-Za-z0-9_.])C_Base_dIO_dIO_Base_dIO_dMkIO' "$main_ml"; then
  bad "package split no bare cross-unit constructor" "无未限定 C_Base_dIO_dIO_Base_dIO_dMkIO" "$(grep -nE '(^|[^A-Za-z0-9_.])C_Base_dIO_dIO_Base_dIO_dMkIO' "$main_ml" | sed -n '1p')"
else
  ok
fi

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

# 44a) 依赖闭包自底向上预热：base（无依赖）→ dep（库包，消费 base 摘要）→ root。
if TMPDIR="$summ_cache" "$summ_vuna" check "$VUNA_BASE" >/dev/null 2>&1; then
  ok
else
  bad "summary base check exit" "0" "failed"
fi
if TMPDIR="$summ_cache" "$summ_vuna" check "$summ_pkg/dep" >"$tmp/summ-dep.log" 2>&1; then
  ok
else
  bad "summary dep check exit" "0" "$(tail -3 "$tmp/summ-dep.log")"
fi

# 44b) 根包：依赖摘要命中 ⇒ 摘要路径；check 通过。
summ_root=$(TMPDIR="$summ_cache" "$summ_vuna" check "$summ_pkg/root" --debug-perf 2>&1)
summ_root_code=$?
check_eq "summary root check exit" "0" "$summ_root_code"
check_contains "summary path used" "$summ_root" "cache-path=summary deps=2"

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

if [ "$fail" -ne 0 ]; then
  printf '%s passed, %s failed\n' "$pass" "$fail"
  exit 1
fi
printf 'vuna tests passed (%s checks)\n' "$pass"
