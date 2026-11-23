#!/bin/sh
# checks.vuna-native-artifact：native 产物（`.s` 文件集）的逐字节基线。
#
# `runtime.s` 只剩 `_start` 可达的运行时函数（纯 `main = 42` 不分配、不 spawn），
# 但平台面数据（`.bss` 缓冲、errno 表、env 键、syscall 站点所在的叶子）都在，所以
# 这一个文件仍覆盖宿主缓冲布局与入口叶子。它的哈希不变即「平台面与这些叶子的行为
# 零变化」，是纯重构（Pal 数据化、别名归一）的硬判据。
#
# `Main.s` 用固定的最小程序单独守 `_start` 的形状（入口 / 栈对齐 / 自带栈 / 退出）。
#
# 由 nix/checks/default.nix 的 mkCheck 调用：cwd 是已暂存的工作树，$1 是输出目录；
# `--no-compile` 不需要 cc。基线更新必须与改动同提交（`--no-compile` 保证只比文本）。
set -eu

# 基线必须与宿主 locale 无关（排序 / 字符类）。
export LC_ALL=C

OUT=${1:?usage: vuna-native-artifact.sh OUT}
: "${VUNA:?VUNA 未设置}"
BASE=nix/checks/data/native-artifact.sha

pkg="$OUT/pkg"
mkdir -p "$pkg/app"
printf '[package]\nname = "native-artifact"\n\n[dependencies]\nvuna-base = "%s"\n' \
  "$(pwd)/packages/base" > "$pkg/vuna.toml"
printf 'main : Int\nmain = 42\n' > "$pkg/app/Main.vuna"

"$VUNA" build --no-compile --target native --out "$OUT/s" "$pkg" > "$OUT/build.log" 2>&1 || {
  cat "$OUT/build.log" >&2
  echo "native-artifact: 构建失败" >&2
  exit 1
}

for f in runtime.s Main.s; do
  [ -f "$OUT/s/$f" ] || { echo "native-artifact: 缺少 $f" >&2; exit 1; }
done

{
  printf 'runtime.s %s\n' "$(sha256sum "$OUT/s/runtime.s" | cut -d' ' -f1)"
  printf 'Main.s %s\n' "$(sha256sum "$OUT/s/Main.s" | cut -d' ' -f1)"
} > "$OUT/actual"

if diff -u "$BASE" "$OUT/actual" > "$OUT/diff"; then
  echo "native-artifact: ok"
else
  cat "$OUT/diff" >&2
  echo "native-artifact: 产物逐字节漂移（行为变更需与基线同提交）" >&2
  exit 1
fi