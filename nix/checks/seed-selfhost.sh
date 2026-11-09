#!/bin/sh
# checks.seed-selfhost：提交入库的 seed → stage0 → stage1 → stage2 的完整自举验证。
#
# 由 nix/checks/default.nix 的 mkCheck 调用：cwd 是已按 fileset 暂存的工作树，
# $1 是输出目录，$VUNA_SEED 是 packages.vuna-seed 的二进制（由 Nix 注入）。
#
# 覆盖：seed TCB 断言、stage1 == stage2（文件集逐字节）、增量构建、两个行为抽查。
#
# rotation 是按需事件（触发条件见 docs/reference/bootstrap.md）：seed 落后于当前源码
# 不是失败，只输出滞后报告；唯一硬要求是旧 seed 能编译当前源码。
set -eu

OUT=${1:?usage: seed-selfhost.sh OUT}
: "${VUNA_SEED:?VUNA_SEED 未设置}"
# M26：包上下文取代 `--root`；由种子构建的 stage1 在仓库根，base 由 VUNA_BASE 显式给出。
export VUNA_BASE="$PWD/base"

# 提交入库的 seed 只能含 compiler 闭包（工具链与 dynamic codegen 都不在 TCB 里）。
sh nix/tcb-check.sh nix/tcb-forbidden.txt seed
# 完整 allowlist：seed/ 的文件集必须与 nix/seed-files.txt 逐项一致（多/少/换文件都报错）。
sh nix/tcb-allowlist.sh nix/seed-files.txt seed

# 闭包数量断言：只靠黑名单时 seed 静默缩水（漏模块）仍会绿；数量来自
# `nix/seed-count.txt`，由 seed rotation 自动更新（见 nix/seed-rotate.sh）。
EXPECTED_SEED_ML=$(sed -n '1p' nix/seed-count.txt)
ACTUAL_SEED_ML=$(find seed -maxdepth 1 -type f -name '*.ml' | wc -l | tr -d ' ')
if [ "$ACTUAL_SEED_ML" != "$EXPECTED_SEED_ML" ]; then
  echo "seed-selfhost: seed 闭包 .ml 数量 $ACTUAL_SEED_ML != 期望 $EXPECTED_SEED_ML（seed 缩水或 seed-count.txt 过期；重新 rotation）" >&2
  exit 1
fi

# 种子对 compiler 包分离编译 → stage1 源码集。
# M26：与 nix/seed-rotate.sh 用同一入口（只 codegen、不链接），保证 seed/ 与 s1 可比。
"$VUNA_SEED" build --no-compile --out s1 compiler
sh nix/tcb-check.sh nix/tcb-forbidden.txt s1

# rotation 按需：seed 与当前源码的生成结果可以不同（信任锚点允许滞后）。
# 这里只报告差异规模，供判断何时 rotation；不同步不阻塞。
# fixed point（下面的 s1 == s2）仍然证明当前源码被旧 seed 编译后自洽。
total_seed_files=$(find seed -maxdepth 1 -type f | wc -l | tr -d ' ')
lag_lines=$(LC_ALL=C diff -rq seed s1 2>/dev/null | wc -l | tr -d ' ')
if [ "$lag_lines" = "0" ]; then
  printf 'seed-selfhost: seed 与当前源码生成结果一致\n'
else
  printf 'seed-selfhost: seed 滞后：%s/%s 个文件与当前源码生成结果不同（rotation 按需，不阻塞；见 docs/reference/bootstrap.md）\n' \
    "$lag_lines" "$total_seed_files"
fi
{
  printf 'seed_total_files=%s\n' "$total_seed_files"
  printf 'seed_lag_lines=%s\n' "$lag_lines"
  if [ -f nix/seed-rotation.txt ]; then
    printf 'rotation_meta=present\n'
    sed -n -e 's/^rotated_at=/rotated_at=/p' -e 's/^source_digest=/source_digest=/p' -e 's/^git_commit=/git_commit=/p' nix/seed-rotation.txt
  else
    printf 'rotation_meta=missing\n'
  fi
} >"$OUT/seed-lag.txt"

# 在副本里构建 stage1，避免构建产物污染文件集比较。
cp -r s1 b1
( cd b1 && sh build.sh ../vuna-stage1 )

# stage1 再生成 → stage2 源码集；两者逐字节一致。
./vuna-stage1 build --no-compile --out s2 compiler
diff -r s1 s2
sh nix/tcb-check.sh nix/tcb-forbidden.txt s2

# 行为抽查：stage1 编译器（DT split codegen）编译并运行一个程序。
# M26：compile 产目录（Main.ml + build.sh），用 build.sh 链接出可执行文件。
cp test/corpus/run/12_fact.vuna fact.vuna
./vuna-stage1 compile fact.vuna "$OUT/fact"
sh "$OUT/fact/build.sh" fact
test "$("$OUT/fact/fact")" = "120"

# DT 行为抽查：Pi 类型与擦除 codegen（M24 起是唯一 codegen）在 seed 构建的 stage1 上可用。
cp test/corpus/dt/01_id.vuna dt_id.vuna
./vuna-stage1 compile dt_id.vuna "$OUT/dt_id"
sh "$OUT/dt_id/build.sh" dt_id
test "$("$OUT/dt_id/dt_id")" = "42"

# 增量构建：无改动时 build.sh 不重编任何模块（只链接）；touch 一个模块只重编它。
( cd b1 && sh build.sh ../vuna-stage1 ) >build2.log
! grep -q '^compile ' build2.log
# M30：build.sh 按内容哈希（不是 mtime）判增量——touch 不再触发重编，改内容才触发。
printf "\n(* seed-selfhost incremental probe *)\n" >> b1/Base_dList.ml
( cd b1 && sh build.sh ../vuna-stage1 ) >build3.log
grep -q '^compile Base_dList' build3.log
! grep -q '^compile Vuna_runtime' build3.log