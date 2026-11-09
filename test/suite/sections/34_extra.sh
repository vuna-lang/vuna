#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

# 34) DT 核心路径（M13）：interp（DT 精化 + 核心求值）/ compile（DT codegen）与 golden 一致
#
# M18.5 追加：核心求值器与 codegen 必须语义一致——同一夹具 `interp` 的输出
# 与 `compile`+build.sh 产物的输出逐字节相同（不依赖 golden，直接对拍 interp 与 codegen）。
# M24：DT 是唯一路径（`--dt` 已删）；`main : IO a` 的夹具（核心求值器不执行效果）
# 带 `.nointerp` 标记，跳过 interp 只做 check+compile+run。
section_begin
# M34.7：Nat 零开销表示断言——产物里不得出现 Nat 变体类型/构造子，算术走 bi_nat*。
nat_repr_dir="$tmp/nat-repr"
rm -rf "$nat_repr_dir"
if nat_repr_out=$("$VUNA" compile corpus/dt/73_nat_repr.vuna "$nat_repr_dir" 2>&1); then
  ok
  if grep -qE 't_Base_dNat_dNat|C_Base_dNat_dNat_' "$nat_repr_dir"/*.ml 2>/dev/null; then
    bad "nat runtime representation" "no Nat variant type/constructor" "$(grep -hE 't_Base_dNat_dNat|C_Base_dNat_dNat_' "$nat_repr_dir"/*.ml | head -2)"
  else
    ok
  fi
  if grep -q 'bi_natAdd' "$nat_repr_dir/Main.ml"; then ok; else bad "nat runtime representation" "bi_natAdd in Main.ml" "missing"; fi
else
  bad "nat runtime representation compile" "exit 0" "$nat_repr_out"
fi

# 34b) D27 表现层：含类型族（不可命名的擦除依赖）的程序必须生成不透明运行时值
#      （Obj.t 字段）+ 表现层 cast（Obj.magic）；不含类型族的程序两者都不得出现。
opaque_dir="$tmp/d27-opaque"
rm -rf "$opaque_dir"
if "$VUNA" compile corpus/dt/82_eff_cps.vuna "$opaque_dir" >/dev/null 2>&1; then
  ok
  if grep -q 'Obj.t' "$opaque_dir/Main.ml" && grep -q 'Obj.magic' "$opaque_dir/Main.ml"; then ok
  else bad "D27 opaque representation (eff)" "Obj.t + Obj.magic" "$(head -3 "$opaque_dir/Main.ml")"; fi
else
  bad "D27 opaque representation compile (eff)" "exit 0" "failed"
fi
plain_dir="$tmp/d27-plain"
rm -rf "$plain_dir"
if "$VUNA" compile corpus/dt/01_id.vuna "$plain_dir" >/dev/null 2>&1; then
  ok
  if grep -qE 'Obj\.magic|Obj\.t' "$plain_dir/Main.ml"; then
    bad "D27 opaque representation (plain)" "no Obj.t/Obj.magic" "$(grep -hE 'Obj\.magic|Obj\.t' "$plain_dir/Main.ml" | head -2)"
  else ok; fi
else
  bad "D27 opaque representation compile (plain)" "exit 0" "failed"
fi

# 33b) 受限 FFI（M33 W5）：`extern name "c_symbol" : 基本类型` + 包根 `ffi/*.c`，
#      由生成的 build.sh 编译并链接；运行输出与 expected.out 一致。
require_files "§33b corpus/ffi" corpus/ffi/*/
for dir in corpus/ffi/*/; do
  dir=${dir%/}
  expected=$(cat "$dir/expected.out")
  rm -rf "$dir/.output"
  if ! ffi_out=$("$VUNA" build "$dir" 2>&1); then
    bad "$dir (ffi build)" "exit 0" "$ffi_out"
    continue
  fi
  actual=$(run_bin "$dir/.output/bin/ffi-add" 2>&1)
  check_eq "$dir (ffi run)" "$expected" "$actual"
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
  check_eq "$dt_src (build run)" "$dt_expected" "$(run_bin "$dt_pkg/.output/bin/dtpkg-exec" 2>&1)"
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
elif ! ( cd "$dt_split" && run_bin sh build.sh prog ) >"$tmp/dt_split.log" 2>&1; then
  bad "$dt_src (compile OUTDIR build.sh)" "exit 0" "$(cat "$tmp/dt_split.log")"
else
  check_eq "$dt_src (compile OUTDIR run)" "$dt_expected" "$(run_bin "$dt_split/prog" 2>&1)"
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


finish
