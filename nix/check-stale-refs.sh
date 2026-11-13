#!/bin/sh
# nix/check-stale-refs.sh：批量检查「已删除概念」与「断言标签」的残留引用。
#
# 动机：缓存架构换过几代，debug 标签 / 路径布局 / 模块名都会变；用例断言与 runner 注入
# 若没跟着改，失败只显示「missing fragment」，要人肉回溯是哪一代的写法。本脚本把这类
# 不一致变成一次性报告（换架构后跑一次，比逐个用例失败再回头查快得多）。
#
# 两类检查：
#   1) 已删除概念：**代码里的字面量**（环境变量/路径/符号）与**用例里的旧路径**。
#      注释与文档不扫（历史说明允许保留）；确需保留的写法在行尾加 `stale-ref-ok`。
#   2) 断言标签：`out-contains:` / `out-equals:` / `out-not-contains:` 首 token 若是
#      `xxx=` 形状，必须能在代码的 `dbg!` 字面量里找到同名标签。
#
# 用法：sh nix/check-stale-refs.sh     （无输出 = 通过；有问题打印 `path:line: 说明`，退出码 1）
set -eu
cd "$(dirname "$0")/.."

fail=0
flag() {
  printf '%s\n' "$2" | while IFS= read -r line; do
    printf '%s: %s\n' "$line" "$1"
  done
  fail=1
}

# ---------------------------------------------------------------
# 1a) 代码里的已删除字面量（注释行跳过：以 `--` / `//` 开头的行）
# ---------------------------------------------------------------
code_hits() {
  grep -rnF --include='*.vuna' -- "$1" compiler/lib compiler/app lib app 2>/dev/null |
    grep -v ': *--' | grep -v 'stale-ref-ok' || true
}

for pair in \
  'VUNA_IFACE_DIR|树内接口镜像已删除（接口在 objects/iface）' \
  'VUNA_CACHE_DIR|缓存根已统一为 $VUNA_STORE' \
  'vuna-cache/|临时缓存根已删除（统一到 $VUNA_STORE）' \
  '.vuna-iface"|包级 manifest 已删除' \
  '/split-units|split-unit 缓存改到 $VUNA_STORE/units' \
  'runCachedNode|查询图已删除' \
  'queryResolve|查询图已删除' \
  'QMarker|查询图已删除'; do
  entry=$(printf '%s' "$pair" | cut -d'|' -f1)
  why=$(printf '%s' "$pair" | cut -d'|' -f2)
  hits=$(code_hits "$entry")
  [ -n "$hits" ] && flag "残留「${entry}」—— ${why}" "$hits"
done

# ---------------------------------------------------------------
# 1b) 用例里的旧路径（负例断言允许：`-name "*.iface"` 这类“不应存在”的检查是有效用法）
# ---------------------------------------------------------------
for pair in \
  'TMPDIR/vuna-cache|临时缓存根已删除（统一到 $VUNA_STORE）' \
  '/split-units|split-unit 目录改到 $VUNA_STORE/units'; do
  entry=$(printf '%s' "$pair" | cut -d'|' -f1)
  why=$(printf '%s' "$pair" | cut -d'|' -f2)
  hits=$(grep -rnF --include='*.steps' --include='*.sh' -- "$entry" test 2>/dev/null |
    grep -v 'stale-ref-ok' || true)
  [ -n "$hits" ] && flag "残留「${entry}」—— ${why}" "$hits"
done

# ---------------------------------------------------------------
# 1c) 文档里的已删除概念（历史说明在行尾加 `stale-ref-ok`）。
# 文档最容易在缓存/存储换代后失真；这里只扫**具名**旧概念，不扫「查询图」这类叙述词。
# ---------------------------------------------------------------
for pair in \
  'Query.Run|查询图已删除' \
  'Driver.Graph|查询图已删除' \
  'VUNA_CACHE_DIR|缓存根已统一为 $VUNA_STORE' \
  'TMPDIR/vuna-cache|临时缓存根已删除' \
  '.vuna-iface|包级 manifest 已删除' \
  'VUNA_IFACE_DIR|树内接口镜像已删除' \
  'clean --iface|--iface 已删除' \
  '.output/iface|树内接口缓存已删除'; do
  entry=$(printf '%s' "$pair" | cut -d'|' -f1)
  why=$(printf '%s' "$pair" | cut -d'|' -f2)
  hits=$(grep -rnF --include='*.md' -- "$entry" docs README.md AGENTS.md 2>/dev/null |
    grep -v 'stale-ref-ok' || true)
  [ -n "$hits" ] && flag "残留「${entry}」—— ${why}" "$hits"
done

# ---------------------------------------------------------------
# 2) 断言标签 ↔ 代码 dbg! 标签
# ---------------------------------------------------------------
# 标签可能在下一行：`dbg!` 独占一行、字符串是下一行的字面量（`dbg!\n  "iface-write=…"`）。
code_labels=$( {
  grep -rho 'dbg! "[^"]*"' --include='*.vuna' compiler/lib lib 2>/dev/null |
    sed 's/.*dbg! "//' |
    sed -n 's/^\([a-z][a-z0-9-]*\)=.*/\1/p'
  grep -rho '^[[:space:]]*"[a-z][a-z0-9-]*=' --include='*.vuna' compiler/lib lib 2>/dev/null |
    sed 's/^[[:space:]]*"//' |
    sed -n 's/^\([a-z][a-z0-9-]*\)=.*/\1/p'
} | sort -u)

step_labels=$(grep -rh '^out-contains:\|^out-equals:\|^out-not-contains:' \
  test/suite/steps/*.steps 2>/dev/null |
  sed 's/^out-[a-z-]*: *//' |
  sed -n 's/^\([a-z][a-z0-9-]*\)=.*/\1/p' | sort -u)

for label in $step_labels; do
  if ! printf '%s\n' "$code_labels" | grep -qxF -- "$label"; then
    hits=$(grep -rn "^out-[a-z-]*: *${label}=" test/suite/steps/*.steps 2>/dev/null || true)
    [ -n "$hits" ] && flag "断言标签「${label}=」在代码 dbg! 里不存在（可能已改名）" "$hits"
  fi
done

exit "$fail"
