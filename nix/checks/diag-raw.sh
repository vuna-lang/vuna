#!/bin/sh
# 诊断门禁：compiler 内的源码/清单诊断不得再走裸字符串 `err`。
#
# 允许的残留（纯工具/构建错误，exit 2，无源码 span）：
#   CompilerCli.vuna / Compile.vuna / Dt.vuna
set -eu

root=$(pwd)
cd "$root"

allowed='CompilerCli\.vuna|Compile\.vuna|Dt\.vuna'

bad=$(grep -rn 'err "' --include='*.vuna' compiler/lib 2>/dev/null | grep -Ev "/(${allowed}):" || true)
if [ -n "$bad" ]; then
  echo "diag-raw: compiler diagnostics must be coded (use a domain code):" >&2
  printf '%s\n' "$bad" >&2
  exit 1
fi

bad2=$(grep -rnE 'err \(' --include='*.vuna' compiler/lib 2>/dev/null | grep -Ev "/(${allowed}):" || true)
if [ -n "$bad2" ]; then
  echo "diag-raw: compiler diagnostics must be coded (use a domain code):" >&2
  printf '%s\n' "$bad2" >&2
  exit 1
fi

# 多行形态：`err` 单独一行、字符串在下一行（grep -A1 的输出形如 file-line-content）。
bad3=$(grep -rn -A1 -E '^[[:space:]]*err$' --include='*.vuna' compiler/lib 2>/dev/null \
  | grep -E '^[^:]+-[0-9]+-[[:space:]]*"' \
  | grep -Ev "/(${allowed})\\.vuna-" || true)
if [ -n "$bad3" ]; then
  echo "diag-raw: compiler diagnostics must be coded (multi-line err):" >&2
  printf '%s\n' "$bad3" >&2
  exit 1
fi

# 位置渲染只允许出现在 Source / Diag / Format 与目标消息组装处。
badloc=$(grep -rn 'showSpanLoc' --include='*.vuna' compiler/lib 2>/dev/null \
  | grep -Ev '/(Source|Diag)\.vuna:|/Diag/Format\.vuna:|/Elab/Driver\.vuna:' || true)
if [ -n "$badloc" ]; then
  echo "diag-raw: showSpanLoc must not appear outside renderers/targets:" >&2
  printf '%s\n' "$badloc" >&2
  exit 1
fi

echo "diag-raw: ok (no raw diagnostics; positions rendered in Diag.Format only)"
