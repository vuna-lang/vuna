#!/bin/sh
# 诊断门禁：compiler 内的源码诊断不得再走裸字符串 `err "..."`。
#
# 允许的残留（工具/构建/清单错误，无源码 span、exit 2）：
#   CompilerCli.vuna / Compile.vuna / Pkg.vuna / Dt.vuna / Manifest.vuna
# 其它 compiler 模块出现 `err "` 即失败：新增源码诊断必须走域码
# （TC_/CG_/RN_/LD_/IC_...），位置放 Label。
set -eu

root=$(CDPATH= cd -- "$(dirname -- "$0")/../.." && pwd) || exit 1
cd "$root"

allowed='CompilerCli\.vuna|Compile\.vuna|Pkg\.vuna|Dt\.vuna|Manifest\.vuna'

bad=$(grep -rn 'err "' --include='*.vuna' compiler/lib 2>/dev/null | grep -Ev "/(${allowed}):" || true)
if [ -n "$bad" ]; then
  echo "diag-raw: compiler source diagnostics must be coded (use a domain code):" >&2
  printf '%s\n' "$bad" >&2
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

echo "diag-raw: ok (no raw source diagnostics; positions rendered in Diag.Format only)"
