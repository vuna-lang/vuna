#!/bin/sh
# checks.seed-selfhost：提交入库的 seed → stage0 → stage1 → stage2 的完整自举验证。
#
# 由 nix/checks/default.nix 的 mkCheck 调用：cwd 是已按 fileset 暂存的工作树，
# $1 是输出目录，$VUNA_SEED 是 packages.vuna-seed 的二进制（由 Nix 注入）。
#
# 覆盖：seed TCB 断言、stage1 == stage2（文件集逐字节）、增量构建、两个行为抽查。
set -eu

OUT=${1:?usage: seed-selfhost.sh OUT}
: "${VUNA_SEED:?VUNA_SEED 未设置}"

# 提交入库的 seed 只能含 compiler 闭包（工具链与 dynamic codegen 都不在 TCB 里）。
sh nix/tcb-check.sh nix/tcb-forbidden.txt seed

# 种子对 compiler 包分离编译 → stage1 源码集。
"$VUNA_SEED" build --split s1 compiler
sh nix/tcb-check.sh nix/tcb-forbidden.txt s1

# 在副本里构建 stage1，避免构建产物污染文件集比较。
cp -r s1 b1
( cd b1 && sh build.sh ../vuna-stage1 )

# stage1 再生成 → stage2 源码集；两者逐字节一致。
./vuna-stage1 build --split s2 compiler
diff -r s1 s2
sh nix/tcb-check.sh nix/tcb-forbidden.txt s2

# 行为抽查：stage1 编译器（DT 单文件 codegen）编译并运行一个程序。
cp test/corpus/run/12_fact.vuna fact.vuna
./vuna-stage1 compile --root compiler/lib fact.vuna fact.ml
ocamlopt -g -w -a+39 -warn-error +39 -I +unix -o fact unix.cmxa fact.ml
test "$(./fact)" = "120"

# DT 行为抽查：Pi 类型与擦除 codegen（M24 起是唯一 codegen）在 seed 构建的 stage1 上可用。
cp test/corpus/dt/01_id.vuna dt_id.vuna
./vuna-stage1 compile dt_id.vuna dt_id.ml
ocamlopt -g -w -a+39 -warn-error +39 -I +unix -o dt_id unix.cmxa dt_id.ml
test "$(./dt_id)" = "42"

# 增量构建：无改动时 build.sh 不重编任何模块（只链接）；touch 一个模块只重编它。
( cd b1 && sh build.sh ../vuna-stage1 ) >build2.log
! grep -q '^compile ' build2.log
touch b1/Base_dList.ml
( cd b1 && sh build.sh ../vuna-stage1 ) >build3.log
grep -q '^compile Base_dList' build3.log
! grep -q '^compile Vuna_runtime' build3.log