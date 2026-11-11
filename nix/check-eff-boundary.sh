#!/bin/sh
# M4 守卫：编译器/工具链的「隐藏效果」不得新增。
#
# 用户面已统一到 Eff（main : Eff [] a、runPure 执行）；但 compiler/lib 与 lib 里仍有
# 历史遗留的 `runPure (...)` / `runIO (...)` 在纯签名内执行宿主动作（D59）。在 M4 迁移
# 完成前，本脚本把当前调用点作为**基线**（nix/eff-boundary.allowlist），只允许减少、
# 不允许新增：
#   - allowlist 里没有的文件出现调用点 → 失败；
#   - 某文件调用点数超过基线 → 失败；
#   - 基线里的文件调用点变少 → 提示更新基线（不失败）。
#
# 用法：sh nix/check-eff-boundary.sh [--update]
set -eu
root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
if [ ! -d "$root/compiler/lib" ]; then root=$(pwd); fi
allow="$root/nix/eff-boundary.allowlist"
tmp="${TMPDIR:-/tmp}/eff-boundary.$$"
trap 'rm -f "$tmp"' EXIT
: >"$tmp"
for f in $(cd "$root" && find compiler/lib lib -name '*.vuna' 2>/dev/null | sort); do
  # 跨行也算：`runPure` 与 `(` 被 fmt 拆成两行时，逐行 grep 会漏计。
  n=$(tr '\n' ' ' <"$root/$f" | grep -oE '\brun(Pure|IO)[[:space:]]*\(' | wc -l | tr -d ' ')
  if [ "$n" -gt 0 ]; then printf '%s %s\n' "$f" "$n" >>"$tmp"; fi
done
if [ "${1:-}" = "--update" ]; then
  cp "$tmp" "$allow"
  echo "eff-boundary: 已更新基线（$(wc -l <"$allow") 个文件）"
  exit 0
fi
fail=0
while read -r f n; do
  [ -n "$f" ] || continue
  base=$(awk -v f="$f" '$1 == f { print $2 }' "$allow" 2>/dev/null || true)
  if [ -z "$base" ]; then
    echo "eff-boundary: 新增隐藏效果调用点：$f（$n 处）——请改成显式 Eff/EffCheck" >&2
    fail=1
  elif [ "$n" -gt "$base" ]; then
    echo "eff-boundary: $f 基线 $base 处，实际 $n 处：不允许新增隐藏效果" >&2
    fail=1
  elif [ "$n" -lt "$base" ]; then
    echo "eff-boundary: $f 已减少到 $n 处（基线 $base）：请运行 sh nix/check-eff-boundary.sh --update" >&2
  fi
done <"$tmp"
if [ -f "$allow" ]; then
  while read -r f n; do
    [ -n "$f" ] || continue
    if ! grep -q "^$f " "$tmp"; then
      echo "eff-boundary: $f 已无隐藏效果调用点：请运行 sh nix/check-eff-boundary.sh --update" >&2
    fi
  done <"$allow"
fi
if [ "$fail" -ne 0 ]; then
  echo "eff-boundary: 失败（基线见 nix/eff-boundary.allowlist）" >&2
  exit 1
fi
echo "eff-boundary: ok（基线 $(wc -l <"$allow") 个文件）"
