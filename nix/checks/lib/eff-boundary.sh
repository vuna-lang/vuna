#!/bin/sh
# 隐藏效果守卫：编译器 / IR / 工具链 / 入口的 lib 不得用 `runPure` 在纯签名里隐藏 Eff 执行。
#
# 用户面已统一到 Eff（main : Eff [] a，由运行时执行）。本脚本统计两个目录下每个 .vuna
# 文件中 `runPure` 后接 `(` 的调用点数，与基线 nix/checks/data/eff-boundary.allowlist 比较：
#   - allowlist 里没有的文件出现调用点 → 失败（基线当前为空，即零容忍）；
#   - 某文件调用点数超过基线 → 失败；
#   - 基线里的文件调用点变少 → 提示更新基线（不失败）；
#   - 跨行调用也计数（fmt 可能把 `runPure` 与 `(` 拆成两行）；
#   - nix/eff-boundary.exceptions（若存在）里的文件是显式 sanctioned 例外；当前为零例外。
#
# 用法：sh nix/checks/lib/eff-boundary.sh [--update]
set -eu
root=$(CDPATH= cd -- "$(dirname -- "$0")/../../.." && pwd)
if [ ! -d "$root/packages/compiler/lib" ]; then root=$(pwd); fi
allow="$root/nix/checks/data/eff-boundary.allowlist"
exc="$root/nix/eff-boundary.exceptions"
tmp="${TMPDIR:-/tmp}/eff-boundary.$$"
excTmp="${tmp}.exc"
trap 'rm -f "$tmp" "$excTmp"' EXIT
: >"$tmp"
: >"$excTmp"
# 显式例外：设计上保留的 tracing/调试通道（nix/eff-boundary.exceptions，每行一个路径；当前不存在）。
is_exempt() { [ -f "$exc" ] && grep -qxF -- "$1" "$exc"; }
for f in $(cd "$root" && find packages/compiler/lib packages/compiler-base/lib packages/ir/lib packages/target-ocaml/lib packages/target-native/lib packages/target-wasm/lib packages/plugin-web/lib packages/dev/lib packages/cli/lib packages/toolchain/lib packages/plugin-kit/lib -name '*.vuna' 2>/dev/null | sort); do
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
    echo "eff-boundary: $f 已减少到 $n 处（基线 $base）：请运行 sh nix/checks/lib/eff-boundary.sh --update" >&2
  fi
done <"$tmp"
if [ -f "$allow" ]; then
  while read -r f n; do
    [ -n "$f" ] || continue
    if ! grep -q "^$f " "$tmp"; then
      echo "eff-boundary: $f 已无隐藏效果调用点：请运行 sh nix/checks/lib/eff-boundary.sh --update" >&2
    fi
  done <"$allow"
fi

# 宿主原语的**可见名**不得出现在**代码位置**——编译器 / IR / 工具链一律用
# `@vuna@prim_eff_*` 内部名（`Intrinsics.vuna` 是定义真源）。
# 内建表、运行时契约（`Ir/Runtime.vuna` 与各后端的 `Runtime.vuna`）和 kind 判据表
# （`Ir/Kinds.vuna`）里的 `prim_eff_*` 是字符串里的契约数据 / 目标符号，不是源码调用。
# 判定口径：逐文件剥掉双引号字符串字面量与 `--` 行注释，剩下的代码位置出现裸名即违规；
# `@vuna@` 内部名不算（源码写不出，见 `Frontend/Lexer.vuna` 的 `@vuna@` 规则）。
# 近似：不解析模板字面量里的插值，也不跨行跟踪字符串/注释；出现这类形态时再收紧。
oldNames=$(
  cd "$root" || exit 1
  find \
    packages/compiler/lib packages/compiler-base/lib packages/ir/lib \
    packages/target-ocaml/lib packages/target-native/lib packages/target-wasm/lib \
    packages/plugin-web/lib packages/dev/lib packages/cli/lib packages/toolchain/lib \
    packages/plugin-kit/lib \
    -name '*.vuna' 2>/dev/null | sort | while read -r f; do
    sed -E 's/"([^"\\]|\\.)*"//g; s/--.*$//' "$f" |
      grep -nE '(^|[^@[:alnum:]_])prim_eff_' |
      sed "s|^|$f:|"
  done
)
if [ -n "$oldNames" ]; then
  echo "eff-boundary: 发现可见宿主原语名（应改成 @vuna@ 内部名）：" >&2
  printf '%s\n' "$oldNames" | head -10 | sed 's/^/  /' >&2
  fail=1
fi

# 宿主层只能在 base 里关闭：`runHost` / `hostSync` / `@vuna@host@_*` / `@vuna@prim_eff_*`
# 出现在 base 之外的 lib 代码位置即违规。允许的口子是正常效应（`Base.Effect.*` 标签 + handler），
# 不是就地关闭宿主行——否则 `Eff []` 会重新出现“类型说纯、实际摸宿主”。
# 判定口径同上（剥字符串与行注释）；诊断旁路 `@vuna@obs@*` 不在其中。
hostClosers=$(
  cd "$root" || exit 1
  find \
    packages/compiler/lib packages/compiler-base/lib packages/ir/lib \
    packages/target-ocaml/lib packages/target-native/lib packages/target-wasm/lib \
    packages/plugin-web/lib packages/dev/lib packages/cli/lib packages/toolchain/lib \
    packages/plugin-kit/lib \
    -name '*.vuna' 2>/dev/null | sort | while read -r f; do
    sed -E 's/"([^"\\]|\\.)*"//g; s/--.*$//' "$f" |
      grep -nE '(^|[^@[:alnum:]_])(runHost|hostSync)([^[:alnum:]_]|$)|@vuna@(host|prim_eff)[@_]' |
      sed "s|^|$f:|"
  done
)
if [ -n "$hostClosers" ]; then
  echo "eff-boundary: base 之外出现宿主层入口（应改成 Base.Effect.* 标签 + handler）：" >&2
  printf '%s\n' "$hostClosers" | head -10 | sed 's/^/  /' >&2
  fail=1
fi
if [ -s "$excTmp" ]; then
  echo "eff-boundary: sanctioned exceptions（不计入基线）："
  sed 's/^/  /' "$excTmp"
fi
if [ "$fail" -ne 0 ]; then
  echo "eff-boundary: 失败（基线见 nix/checks/data/eff-boundary.allowlist）" >&2
  exit 1
fi
echo "eff-boundary: ok（基线 $(wc -l <"$allow") 个文件，例外 $(wc -l <"$excTmp") 个文件）"
