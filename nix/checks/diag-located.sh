#!/bin/sh
# 诊断位置门禁：每条结构化诊断（test/corpus/**/*.diag.json）必须带主 span；
# 确实没有源码可指的码只能显式登记在 nix/diag-located.allow（只减不增）。
#
# 数据源是 `vuna test --suite ... --bless-diag` 生成的结构化夹具，所以门禁与
# 用户实际看到的 JSON 同源，不维护第二份期望。
set -eu

root=$(pwd)
cd "$root"

: "${VUNA:?VUNA must point to the vuna binary}"

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

# 无主 span 且没有 absent 理由的诊断码（每条一行）。
find test/corpus -name '*.diag.json' -print0 \
  | xargs -0 -r jq -r '
      .diagnostics[]?
      | select(([.labels[]? | select(.span != null)] | length) == 0)
      | select((.absent // null) == null)
      | (.code // "<missing-code>")' \
  | sort -u > "$tmp/unlocated.txt" 2>/dev/null || true

# 有 span 的诊断数 / 总诊断数：给日志一个可追踪的分母。
find test/corpus -name '*.diag.json' -print0 \
  | xargs -0 -r jq -r '.diagnostics[]?
      | (if ([.labels[]? | select(.span != null)] | length) > 0 then "located" else "unlocated" end)' \
  | sort | uniq -c > "$tmp/counts.txt" 2>/dev/null || true

allow=nix/diag-located.allow
if [ -f "$allow" ]; then
  grep -v '^[[:space:]]*#' "$allow" 2>/dev/null | grep -v '^[[:space:]]*$' | sort -u > "$tmp/allow.txt" || true
else
  : > "$tmp/allow.txt"
fi

bad=$(comm -23 "$tmp/unlocated.txt" "$tmp/allow.txt" || true)
if [ -n "$bad" ]; then
  echo "diag-located: these diagnostic codes have no location and are not allowlisted:" >&2
  printf '  %s\n' $bad >&2
  echo "Fix the emission site (attach a Span) or add a documented line to $allow." >&2
  cat "$tmp/counts.txt" >&2 || true
  exit 1
fi

echo "diag-located: ok ($(tr '\n' ' ' < "$tmp/counts.txt"))"