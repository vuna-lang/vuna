#!/bin/sh
# seed rotation（M12）：用当前编译器从当前源码生成 seed/ 文件集（多文件）。
#
# 前提：当前 seed 能编译当前源码（nix flake check 通过）。
# 用法: sh nix/seed-rotate.sh [VUNA]
#   VUNA  当前 stage 1 编译器，默认 ./result/bin/vuna
#
# 轮换后：sh seed/build.sh 应能构建出 vuna-seed；nix flake check 应通过；
# 检查 git diff seed/ 的变化可解释后提交。
set -eu
cd "$(dirname "$0")/.."
VUNA=${1:-./result/bin/vuna}
[ -x "$VUNA" ] || {
  echo "seed-rotate: 找不到可执行编译器 $VUNA（先 nix build .#vuna --out-link result）" >&2
  exit 1
}
[ -f vuna.toml ] || { echo "seed-rotate: 当前目录不是 vuna 包（缺 vuna.toml）" >&2; exit 1; }
rm -rf seed
mkdir -p seed
"$VUNA" seed seed .
echo "seed-rotate: 已生成 seed/（$(ls seed | wc -l | tr -d ' ') 个文件）"
sh seed/build.sh seed/vuna-seed
echo "seed-rotate: seed/build.sh 构建通过"
