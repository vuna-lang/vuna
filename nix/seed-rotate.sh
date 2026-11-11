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
# 因此失败不会破坏工作树里的信任锚点。替换后写入 nix/seed-rotation.txt（审计元数据）。
#
# rotation 按需触发（见 docs/reference/bootstrap.md），不是每次 compiler/base 改动都做。
set -eu
cd "$(dirname "$0")/.."
# 接口缓存默认开启后，`vuna build` 可能读/写源码旁 .iface：rotation 的第一遍（产品 CLI）
# 与第二遍（新 seed）若走不同缓存路径，runtime 位置表会不同，fixed point 假失败。
# rotation 一律强制全量精化，保证两遍走同一条路径。
export VUNA_IFACE_TOOL=0
export VUNA_ELAB_FULL=1
VUNA=${1:-./result/bin/vuna}
[ -x "$VUNA" ] || {
  echo "seed-rotate: 找不到可执行编译器 $VUNA（先 nix build .#vuna --out-link result）" >&2
  exit 1
}
[ -f vuna.toml ] || { echo "seed-rotate: 当前目录不是 vuna workspace（缺 vuna.toml）" >&2; exit 1; }
[ -d compiler ] || { echo "seed-rotate: 找不到 compiler/（seed 来源必须是 compiler 包）" >&2; exit 1; }
# 源码旁 .iface 缓存可能来自不同编译器版本：先清理，否则两遍生成走不同路径，
# fixed point 会假失败（见 C32/M4 收口时的实测）。
"$VUNA" clean-iface >/dev/null 2>&1 || true

tmp=$(mktemp -d "${TMPDIR:-/tmp}/vuna-seed-rotate.XXXXXX") || exit 1
# 分级替换用的临时名：复制到 seed.new.$$ 后再 rename，失败时用 seed.old.$$ 回滚。
# trap 兜底：若在「旧 seed 已移走、新 seed 尚未就位」的窗口里被信号打断，先把 old
# 移回 seed/，再清理临时路径，避免信任锚点缺失。
new_seed="seed.new.$$"
old_seed="seed.old.$$"
cleanup() {
  if [ ! -e seed ] && [ -e "$old_seed" ]; then
    mv "$old_seed" seed
  fi
  rm -rf "$tmp" "$new_seed" "$old_seed"
}
trap cleanup EXIT INT TERM

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

# 计算 rotation 元数据（审计用；CI 不因 seed 落后于源码而失败）。
# 在替换 seed/ 之前完成：任何计算失败都不会动信任锚点。
# 源码指纹 = compiler/ + base/ 下全部 .vuna 按路径排序后的内容哈希链。
source_files=$(find compiler base -type f -name '*.vuna' | wc -l | tr -d ' ')
source_digest=$(
  find compiler base -type f -name '*.vuna' -print |
    LC_ALL=C sort |
    while IFS= read -r f; do sha256sum "$f"; done |
    sha256sum | cut -d' ' -f1
)
seed_ml=$(find "$tmp/seed" -maxdepth 1 -type f -name '*.ml' | wc -l | tr -d ' ')
seed_files=$(find "$tmp/seed" -maxdepth 1 -type f | wc -l | tr -d ' ')
git_commit=$(git rev-parse HEAD 2>/dev/null || printf 'unknown')
rotated_at=$(date -u +%Y-%m-%dT%H:%M:%SZ)

# 全部校验通过后再替换仓库里的 seed/。分级替换：先完整复制到 seed.new.$$，再把旧
# seed/ rename 成 seed.old.$$，最后把新副本 rename 就位。这样任意时刻 seed/ 要么是
# 旧文件集、要么是新文件集，不会出现「删除后复制失败」的半空状态；就位失败则把旧
# seed 移回（回滚）并以非零退出。
rm -rf "$new_seed"
cp -r "$tmp/seed" "$new_seed"
if [ -e seed ]; then
  mv seed "$old_seed"
fi
if ! mv "$new_seed" seed; then
  if [ -e "$old_seed" ]; then
    mv "$old_seed" seed
  fi
  echo "seed-rotate: 错误：无法把新 seed 就位，已回滚旧 seed" >&2
  exit 1
fi
rm -rf "$old_seed"
# 闭包数量/完整文件清单由 checks.seed-selfhost 读取；rotation 时自动同步，避免清单腐化。
# 清单变更会进入 rotation 的 git diff，供 review 确认 TCB 边界。
find seed -maxdepth 1 -type f -name '*.ml' | wc -l | tr -d ' ' >nix/seed-count.txt
find seed -maxdepth 1 -type f -exec basename {} \; | LC_ALL=C sort >nix/seed-files.txt

# 写元数据（同目录临时文件 + mv，尽量原子；元数据只用于审计）。
meta_tmp="nix/seed-rotation.txt.tmp"
{
  printf '# 由 nix/seed-rotate.sh 生成。记录 seed/ 对应（rotation 时）的源码状态。\n'
  printf '# 仅供审计与滞后报告；CI 不因 seed 落后于源码而失败。\n'
  printf 'rotated_at=%s\n' "$rotated_at"
  printf 'source_digest=sha256:%s\n' "$source_digest"
  printf 'source_files=%s\n' "$source_files"
  printf 'seed_ml=%s\n' "$seed_ml"
  printf 'seed_files=%s\n' "$seed_files"
  printf 'git_commit=%s\n' "$git_commit"
} >"$meta_tmp"
mv "$meta_tmp" nix/seed-rotation.txt

echo "seed-rotate: 已生成 seed/（$(ls seed | wc -l | tr -d ' ') 个文件），fixed point 通过，元数据已写入 nix/seed-rotation.txt"