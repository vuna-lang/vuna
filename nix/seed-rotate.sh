#!/bin/sh
# seed rotation（M12）：用当前编译器从 compiler 包生成 seed/ 多文件文件集。
#
# 前提：当前 seed 能编译当前源码（nix flake check 通过）。
# 用法: sh nix/seed-rotate.sh [VUNA]
#   VUNA  当前 stage 1 产品 CLI（vuna），默认 ./result/bin/vuna
#
# seed 只覆盖 compiler 包（compiler/app/Main.vuna 的 import 闭包），
# 工具链（fmt/lint/repl/doc/test）不在种子里。
#
# 生成与校验全部在临时目录完成：只有 TCB 断言与 fixed point 都通过后才替换 seed/，
# 因此失败不会破坏工作树里的信任锚点。
set -eu
cd "$(dirname "$0")/.."
VUNA=${1:-./result/bin/vuna}
[ -x "$VUNA" ] || {
  echo "seed-rotate: 找不到可执行编译器 $VUNA（先 nix build .#vuna --out-link result）" >&2
  exit 1
}
[ -f vuna.toml ] || { echo "seed-rotate: 当前目录不是 vuna workspace（缺 vuna.toml）" >&2; exit 1; }
[ -d compiler ] || { echo "seed-rotate: 找不到 compiler/（seed 来源必须是 compiler 包）" >&2; exit 1; }

tmp=$(mktemp -d "${TMPDIR:-/tmp}/vuna-seed-rotate.XXXXXX") || exit 1
trap 'rm -rf "$tmp"' EXIT INT TERM

# 从仓库根以包目录 "compiler" 生成，保证嵌入的文件路径与提交后的 seed/ 一致。
# M26：包级输出只有 split 一种模型；`--out` 只 codegen、不链接。
"$VUNA" build --no-compile --out "$tmp/seed" compiler

# 种子必须只含 compiler 闭包：工具模块与旧 dynamic codegen 一旦出现都算错误。
sh nix/tcb-check.sh nix/tcb-forbidden.txt "$tmp/seed"

# 用生成的种子构建（在副本里构建，避免 .cmi/.cmx 污染待比较的文件集），
# 并验证它能逐字节重生成同一文件集（fixed point）。
cp -r "$tmp/seed" "$tmp/build-seed"
sh "$tmp/build-seed/build.sh" "$tmp/vuna-seed"
"$tmp/vuna-seed" build --no-compile --out "$tmp/regen" compiler
if ! diff -r "$tmp/seed" "$tmp/regen" >/dev/null 2>&1; then
  echo "seed-rotate: 错误：种子重生成的文件集与生成结果不一致" >&2
  diff -r "$tmp/seed" "$tmp/regen" | head -20 >&2
  exit 1
fi

# 全部校验通过后再替换仓库里的 seed/。
rm -rf seed
cp -r "$tmp/seed" seed
# 闭包数量断言由 checks.seed-selfhost 读取；rotation 时自动同步，避免清单腐化。
find seed -maxdepth 1 -type f -name '*.ml' | wc -l | tr -d ' ' >nix/seed-count.txt
echo "seed-rotate: 已生成 seed/（$(ls seed | wc -l | tr -d ' ') 个文件），fixed point 通过"