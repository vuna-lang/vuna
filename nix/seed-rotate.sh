#!/bin/sh
# seed rotation（M12）：用当前编译器从当前源码生成 seed/ 多文件文件集。
#
# 前提：当前 seed 能编译当前源码（nix flake check 通过）。
# 用法: sh nix/seed-rotate.sh [VUNA]
#   VUNA  当前 stage 1 编译器，默认 ./result/bin/vuna
#
# 轮换后：nix flake check 应通过（seed-selfhost 校验 stage1 == stage2 文件集、
# 增量构建、行为抽查）；检查 git diff seed/ 的变化可解释后提交。
set -eu
cd "$(dirname "$0")/.."
VUNA=${1:-./result/bin/vuna}
[ -x "$VUNA" ] || {
  echo "seed-rotate: 找不到可执行编译器 $VUNA（先 nix build .#vuna --out-link result）" >&2
  exit 1
}
[ -f vuna.toml ] || { echo "seed-rotate: 当前目录不是 vuna 包（缺 vuna.toml）" >&2; exit 1; }

tmp=$(mktemp -d "${TMPDIR:-/tmp}/vuna-seed-rotate.XXXXXX") || exit 1
trap 'rm -rf "$tmp"' EXIT INT TERM

rm -rf seed
mkdir -p seed
"$VUNA" seed seed .
echo "seed-rotate: 已生成 seed/（$(ls seed | wc -l | tr -d ' ') 个文件）"

# 用种子源码构建 vuna-seed，并验证它能逐字节重生成同一文件集。
cp -r seed "$tmp/seed"
sh "$tmp/seed/build.sh" "$tmp/vuna-seed"
mkdir -p "$tmp/regen"
# 从仓库根以包目录 "." 生成，保证嵌入的文件路径与 seed/ 一致。
"$tmp/vuna-seed" build --split "$tmp/regen" .
if diff -r seed "$tmp/regen" >/dev/null 2>&1; then
  echo "seed-rotate: 种子自生成 fixed point 通过（文件集逐字节一致）"
else
  echo "seed-rotate: 错误：种子重生成的文件集与 seed/ 不一致" >&2
  diff -r seed "$tmp/regen" | head -20 >&2
  exit 1
fi
