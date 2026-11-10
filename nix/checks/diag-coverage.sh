#!/bin/sh
# 诊断码覆盖门禁：目录中的每个码至少有一个结构化夹具（或显式 allowlist 记录缺口），
# fixture 里出现的码必须在目录中；覆盖数不得低于基线。
#
# 数据源：
#   - 目录：`vuna explain --list`（与 `gen-errors` 同源）
#   - 夹具：test/corpus/**/*.diag.json（`vuna test --suite ... --bless-diag` 生成）
#   - lint 规则夹具：test/corpus/lint/*.out（LN_ 码在 lint 输出里逐条断言；
#     本门禁只要求「每个码至少有一个夹具」，不限定载体）
set -eu

# mkCheck 以「仓库根布局」为 cwd 执行脚本（源码已复制到当前目录）。
root=$(pwd)
cd "$root"

: "${VUNA:?VUNA must point to the vuna binary}"

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

"$VUNA" explain --list > "$tmp/codes.txt"
grep -E '^[A-Z][A-Za-z0-9]*_[A-Za-z0-9]+' "$tmp/codes.txt" | awk '{print $1}' | sort -u > "$tmp/catalog.txt"

grep -rho '"code":"[A-Z][A-Za-z0-9]*_[A-Za-z0-9]*"' test/corpus --include='*.diag.json' \
  | sed -E 's/.*"code":"([^"]+)"/\1/' | sort -u > "$tmp/covered.txt" || true

# lint 规则夹具：从 `[LN_xxx]` 前缀提取码（不加会让 LN_ 规则被误判成缺口）。
grep -rho '\[LN_[A-Za-z0-9]*\]' test/corpus/lint --include='*.out' 2>/dev/null \
  | sed -E 's/^\[([^]]+)\]$/\1/' >> "$tmp/covered.txt" || true
sort -u -o "$tmp/covered.txt" "$tmp/covered.txt"

allowfile=nix/diag-coverage-allow.txt
if [ -f "$allowfile" ]; then
  grep -v '^[[:space:]]*#' "$allowfile" | grep -v '^[[:space:]]*$' | sort -u > "$tmp/allow.txt" || true
else
  : > "$tmp/allow.txt"
fi

unknown=$(comm -13 "$tmp/catalog.txt" "$tmp/covered.txt")
if [ -n "$unknown" ]; then
  echo "diag-coverage: fixture codes not in catalog:" >&2
  printf '%s\n' "$unknown" >&2
  exit 1
fi

comm -23 "$tmp/catalog.txt" "$tmp/covered.txt" > "$tmp/uncovered.txt"
uncovered=$(cat "$tmp/uncovered.txt")
new_uncovered=$(comm -23 "$tmp/uncovered.txt" "$tmp/allow.txt")
if [ -n "$new_uncovered" ]; then
  echo "diag-coverage: codes without a structured fixture (add one or extend $allowfile):" >&2
  printf '%s\n' "$new_uncovered" >&2
  exit 1
fi

stale=$(comm -13 "$tmp/uncovered.txt" "$tmp/allow.txt")
if [ -n "$stale" ]; then
  echo "diag-coverage: allowlist entries are now covered; remove them from $allowfile:" >&2
  printf '%s\n' "$stale" >&2
  exit 1
fi

catalog_n=$(wc -l < "$tmp/catalog.txt" | tr -d ' ')
covered_n=$(wc -l < "$tmp/covered.txt" | tr -d ' ')
minfile=nix/diag-coverage.min
min=0
if [ -f "$minfile" ]; then min=$(tr -d '[:space:]' < "$minfile"); fi
if [ "$covered_n" -lt "$min" ]; then
  echo "diag-coverage: coverage regressed: ${covered_n}/${catalog_n} < baseline ${min}" >&2
  exit 1
fi

echo "diag-coverage: ok (${covered_n}/${catalog_n} codes covered, baseline ${min}, allowlisted $((catalog_n - covered_n)))"