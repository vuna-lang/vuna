#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

# 33) M26 包级 split：`vuna compile <pkg> OUTDIR` 走 DT 逐模块 codegen
#     → OUTDIR/<Module>.ml... + Main.ml + build.sh；build.sh 增量编译（无改动不重编；
#     touch 模块只重编受影响者）。E14：入口 data 也在产物 Main.ml 里。
#     C35：每单元只 `open Vuna_runtime`（无 open 链），跨单元引用全限定（`Unit.name`）；
#     build.sh 的 compile_mod 只列直接依赖，层内并行、每模块 stamp 只含直接依赖。
require_files "§33 corpus/packages split" corpus/packages/[01][0-9]_*/
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
  ( cd "$split_dir" && run_bin sh build.sh bin/prog ) >"$tmp/split_build.log" 2>&1
  check_eq "$pkg (package split build exit)" "0" "$?"
  actual=$(run_bin "$split_dir/bin/prog" 2>&1)
  check_eq "$pkg (package split run)" "$(cat "$pkg/expected.out")" "$actual"
done

# 增量构建行为用 01_workspace 验证（DT split 的编译单元 = sanitizeName 后的模块名）。
split_dir=$tmp/split-01_workspace
( cd "$split_dir" && run_bin sh build.sh bin/prog ) >"$tmp/split_noop.log" 2>&1
if grep -q '^compile ' "$tmp/split_noop.log"; then
  bad "package split incremental noop" "no compile lines" "$(cat "$tmp/split_noop.log")"
else
  ok
fi
# M30：增量判定改内容哈希——touch 不再触发重编；改内容才触发。
printf '\n(* M30 incremental probe *)\n' >>"$split_dir/Vuna_dHello.ml"
( cd "$split_dir" && run_bin sh build.sh bin/prog ) >"$tmp/split_inc.log" 2>&1
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
check_contains "package split qualified constructor (Dep)" "$(cat "$main_ml")" "Dep.C_Dep_dDepTag_DepTagA"
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
if grep -qE '(^|[^A-Za-z0-9_.])C_Dep_dDepTag_DepTagA' "$main_ml"; then
  bad "package split no bare cross-unit constructor" "无未限定 C_Dep_dDepTag_DepTagA" "$(grep -nE '(^|[^A-Za-z0-9_.])C_Dep_dDepTag_DepTagA' "$main_ml" | sed -n 1p)"
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



finish
