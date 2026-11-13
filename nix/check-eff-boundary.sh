#!/bin/sh
# 隐藏效果守卫：compiler/lib 与 lib 不得用 `runPure` 在纯签名里隐藏 Eff 执行。
#
# 用户面已统一到 Eff（main : Eff [] a，由运行时执行）。本脚本统计两个目录下每个 .vuna
# 文件中 `runPure` 后接 `(` 的调用点数，与基线 nix/eff-boundary.allowlist 比较：
#   - allowlist 里没有的文件出现调用点 → 失败（基线当前为空，即零容忍）；
#   - 某文件调用点数超过基线 → 失败；
#   - 基线里的文件调用点变少 → 提示更新基线（不失败）；
#   - 跨行调用也计数（fmt 可能把 `runPure` 与 `(` 拆成两行）；
#   - nix/eff-boundary.exceptions（若存在）里的文件是显式 sanctioned 例外；当前为零例外。
#
# 用法：sh nix/check-eff-boundary.sh [--update]
set -eu
root=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
if [ ! -d "$root/compiler/lib" ]; then root=$(pwd); fi
allow="$root/nix/eff-boundary.allowlist"
exc="$root/nix/eff-boundary.exceptions"
tmp="${TMPDIR:-/tmp}/eff-boundary.$$"
excTmp="${tmp}.exc"
trap 'rm -f "$tmp" "$excTmp"' EXIT
: >"$tmp"
: >"$excTmp"
# 显式例外：设计上保留的 tracing/调试通道（nix/eff-boundary.exceptions，每行一个路径；当前不存在）。
is_exempt() { [ -f "$exc" ] && grep -qxF -- "$1" "$exc"; }
for f in $(cd "$root" && find compiler/lib lib -name '*.vuna' 2>/dev/null | sort); do
  # 跨行也算：`runPure` 与 `(` 被 fmt 拆成两行时，逐行 grep 会漏计。
  n=$(tr '\n' ' ' <"$root/$f" | grep -oE '\brunPure[[:space:]]*\(' | wc -l | tr -d ' ')
  if is_exempt "$f"; then
    if [ "$n" -gt 0 ]; then printf '%s %s\n' "$f" "$n" >>"$excTmp"; fi
    continue
  fi
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

# 阶段 5 D：宿主原语的**可见名**不得出现在源码里——base/compiler/lib 一律用
# `@vuna@prim_eff_*` 内部名（`Intrinsics.vuna` 是定义真源，豁免）。用户源码写不出
# 这些名字（词法只认 `@vuna@` 前缀的完整内部名，且隐藏 intrinsic 不进用户可见名单）。
oldNames=$(cd "$root" && grep -rn '\bprim_eff_' compiler/lib lib --include='*.vuna' 2>/dev/null | grep -v '@vuna@' | grep -v 'Vuna/Compiler/Intrinsics.vuna' || true)
if [ -n "$oldNames" ]; then
  echo "eff-boundary: 发现可见宿主原语名（应改成 @vuna@ 内部名）：" >&2
  printf '%s\n' "$oldNames" | head -10 | sed 's/^/  /' >&2
  fail=1
fi
if [ -s "$excTmp" ]; then
  echo "eff-boundary: sanctioned exceptions（不计入基线）："
  sed 's/^/  /' "$excTmp"
fi
if [ "$fail" -ne 0 ]; then
  echo "eff-boundary: 失败（基线见 nix/eff-boundary.allowlist）" >&2
  exit 1
fi
echo "eff-boundary: ok（基线 $(wc -l <"$allow") 个文件，例外 $(wc -l <"$excTmp") 个文件）"
