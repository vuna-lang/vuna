#!/bin/sh
# 冷启动上下文预算（CI check）：约束 AI agent「首次进入仓库」必须读的字节数。
#
# 动机：agent 的改动成本 ≈ 必须读进上下文的字节数。代码按需读（vuna map --find +
# span 区间），但入口文档每轮都要读，所以单独设预算，只降不升。
#
# 用法: sh nix/context-budget.sh [REPO] [BUDGET]
#   REPO    仓库根，默认当前目录
#   BUDGET  预算文件，默认 <repo>/nix/context.budget
#
# 指标：
#   coldstart_bytes  AGENTS.md + docs/architecture.md + README.md 的字节数之和
#   agents_lines     AGENTS.md 行数
#   arch_lines       docs/architecture.md 行数
#   readme_lines     README.md 行数
#   max_ref_lines    单篇 docs/reference/*.md 的最大行数
#   max_module_lines 单个 .vuna 源模块的最大行数（单点最大阅读成本）
#
# 有意改动文档结构后，用本脚本复测并更新 nix/context.budget（附注释说明原因）。
set -eu

REPO=${1:-.}
BUDGET=${2:-$REPO/nix/context.budget}

cd "$REPO"

bytes_of() { wc -c <"$1" 2>/dev/null | tr -d ' '; }

lines_of() { wc -l <"$1" 2>/dev/null | tr -d ' '; }

have() { [ -f "$1" ]; }

# ---- coldstart_bytes：三个入口文件之和（缺失按 0 计） ----
coldstart=0
for f in AGENTS.md docs/architecture.md README.md; do
  if have "$f"; then
    n=$(bytes_of "$f")
    coldstart=$((coldstart + n))
  fi
done

agents_lines=0
have AGENTS.md && agents_lines=$(lines_of AGENTS.md)

arch_lines=0
have docs/architecture.md && arch_lines=$(lines_of docs/architecture.md)

readme_lines=0
have README.md && readme_lines=$(lines_of README.md)

# ---- max_ref_lines：docs/reference/*.md 单篇最大行数 ----
max_ref_lines=0
for f in docs/reference/*.md; do
  [ -f "$f" ] || continue
  n=$(lines_of "$f")
  if [ "$n" -gt "$max_ref_lines" ]; then max_ref_lines=$n; fi
done

# ---- max_module_lines：源码模块最大行数（只统计 lib/、compiler/lib/、base/lib/） ----
max_module_lines=0
max_module_path=""
for f in $(find lib/Vuna compiler/lib/Vuna base/lib -name "*.vuna" | sort); do
  [ -f "$f" ] || continue
  n=$(lines_of "$f")
  if [ "$n" -gt "$max_module_lines" ]; then
    max_module_lines=$n
    max_module_path=$f
  fi
done

say() { printf '%s %s\n' "$1" "$2"; }

printf 'context budget for %s\n' "$REPO"
say coldstart_bytes "$coldstart"
say agents_lines "$agents_lines"
say arch_lines "$arch_lines"
say readme_lines "$readme_lines"
say max_ref_lines "$max_ref_lines"
say max_module_lines "$max_module_lines"
[ -n "$max_module_path" ] && printf 'max module: %s\n' "$max_module_path"

[ -n "$BUDGET" ] || exit 0
[ -f "$BUDGET" ] || { echo "context-budget: budget file not found: $BUDGET" >&2; exit 1; }

fail=0
while read -r name max; do
  case "$name" in ''|\#*) continue ;; esac
  case "$name" in
    coldstart_bytes) v=$coldstart ;;
    agents_lines) v=$agents_lines ;;
    arch_lines) v=$arch_lines ;;
    readme_lines) v=$readme_lines ;;
    max_ref_lines) v=$max_ref_lines ;;
    max_module_lines) v=$max_module_lines ;;
    *) echo "context-budget: unknown metric $name" >&2; exit 1 ;;
  esac
  if [ "$v" -gt "$max" ]; then
    printf 'REGRESSION %s: %s > budget %s\n' "$name" "$v" "$max" >&2
    fail=1
  fi
done <"$BUDGET"
if [ "$fail" -ne 0 ]; then
  echo "context-budget: exceeded (nix/context.budget)" >&2
  exit 1
fi
echo "context-budget: within budget"
