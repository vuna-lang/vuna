#!/bin/sh
# checks.doc-coverage：docstring 覆盖 ratchet 门禁（D30）。
#
# `vuna doc --check` 判定「顶层符号缺 docstring」，但目前对全仓仍是 opt-in，
# 公开面缺失项很多（base/ 已全量；compiler/lib/app 在按模块补）。本门禁把
# **受管辖包的缺失总数**钉在一个提交入库的基线 `nix/doc-coverage.baseline` 上：
#   - 缺失数 **> 基线** → 失败（挡住回归：新增公开符号必须带 docstring）；
#   - 缺失数 **<= 基线** → 通过（低于基线时提示下调基线，ratchet 往下压）。
# 补齐公开面后把基线调低；压到 0 时可把本门禁直接换成 `"$VUNA" doc --check`。
#
# 管辖范围：本门禁只统计 PACKAGES 里列出的**稳定包**（编译器 + 标准库）。根包 `vuna`
# 的 lib/（Repl/Index/Lsp 等）正在并行改造，把它纳入会让基线成为移动靶，故暂不纳入；
# 那部分待并行改动合并、补齐 docstring 后再加进 PACKAGES 并下调基线。
#
# 用 `doc --check` 的退出码不行（有缺失恒为 1，会让初始基线阶段直接红），所以这里
# 解析它的计数行再与基线比。由 nix/checks/default.nix 的 mkCheck 调用：cwd 是已暂存的
# 工作树，$1 是输出目录，$VUNA 由 Nix 注入。
set -eu

OUT=${1:?usage: doc-coverage.sh OUT}
: "${VUNA:?VUNA 未设置}"
BASELINE=nix/doc-coverage.baseline
PACKAGES="vuna-compiler vuna-base"

[ -f "$BASELINE" ] || { echo "doc-coverage: baseline file missing: $BASELINE" >&2; exit 1; }
# 基线文件允许 `#` 注释与空行；取第一条有效整数行。
baseline=$(sed -n 's/^[[:space:]]*\([0-9]\{1,\}\)[[:space:]]*$/\1/p' "$BASELINE" | head -1)
if [ -z "$baseline" ]; then
  echo "doc-coverage: baseline file has no integer line: $BASELINE" >&2
  exit 1
fi

# doc --check 有缺失时 exit 1；这里只取它的计数，不让 set -e 中断。
# 输出可能很大（数千行缺失项），逐包写成临时文件再取末行，避免把巨串当 argv 传给
# printf/tail 触发 E2BIG。各包计数相加得受管辖包的缺失总数。
tmp=$(mktemp "${TMPDIR:-/tmp}/vuna-doc-coverage.XXXXXX") || exit 1
trap 'rm -f "$tmp"' EXIT INT TERM

missing=0
for pkg in $PACKAGES; do
  "$VUNA" doc --check --package "$pkg" >"$tmp" 2>&1 || true
  last=$(tail -1 "$tmp")
  n=$(printf '%s\n' "$last" | sed -n 's/^\([0-9]\{1,\}\) missing docstring(s)$/\1/p')
  if [ -z "$n" ]; then
    case "$last" in
      "docstrings ok"*) n=0 ;;
      *) echo "doc-coverage: unexpected 'doc --check --package $pkg' tail: $last" >&2; exit 1 ;;
    esac
  fi
  printf '  %-16s %s missing\n' "$pkg" "$n"
  missing=$((missing + n))
done

printf 'doc-coverage: %s missing docstring(s), baseline %s\n' "$missing" "$baseline"
if [ "$missing" -gt "$baseline" ]; then
  printf 'doc-coverage: FAILED — missing %s > baseline %s\n' "$missing" "$baseline" >&2
  printf '  新增的顶层导出项要补 docstring（前置 "-- |" 或同行尾随 "-- ^"）；\n' >&2
  printf '  或补齐公开面后把 %s 下调到当前值。\n' "$BASELINE" >&2
  printf '  逐包定位: %s doc --check --package <NAME>\n' "$VUNA" >&2
  exit 1
fi
if [ "$missing" -lt "$baseline" ]; then
  printf 'doc-coverage: coverage improved — please lower %s to %s (ratchet down).\n' "$BASELINE" "$missing"
fi
printf 'doc-coverage: ok\n'