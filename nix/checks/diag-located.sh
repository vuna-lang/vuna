#!/bin/sh
# 诊断位置门禁：每条结构化诊断（test/corpus/**/*.diag.json）必须有主 span；
# 没有主 span 的必须带显式 `absent` 理由，且该码登记在 nix/diag-located.allow
# （逐码审计，只减不增）。
#
# 数据源是 `vuna test --suite ... --bless-diag` 生成的结构化夹具，所以门禁与
# 用户实际看到的 JSON 同源，不维护第二份期望。
set -eu

root=$(pwd)
cd "$root"

: "${VUNA:?VUNA must point to the vuna binary}"

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

# 无主 span 的诊断：(code, absent 理由)。有 span 的 judged located。
find test/corpus -name '*.diag.json' -print0 \
  | xargs -0 -r jq -r '
      .diagnostics[]?
      | select(([.labels[]? | select(.span != null)] | length) == 0)
      | [(.code // "<missing-code>"), (.absent // "<none>")] | @tsv' \
  | sort > "$tmp/unlocated.txt" 2>/dev/null || true

# 没带 absent 理由的无位置诊断：这类是「忘记带位置」，不允许进入 allowlist。
awk -F '\t' '$2 == "<none>" { print $1 }' "$tmp/unlocated.txt" | sort -u > "$tmp/noreason.txt" || true
if [ -s "$tmp/noreason.txt" ]; then
  echo "diag-located: diagnostics without a source span must carry an explicit 'absent' reason:" >&2
  printf '  %s\n' $(cat "$tmp/noreason.txt") >&2
  exit 1
fi

cut -f1 "$tmp/unlocated.txt" | sort -u > "$tmp/codes.txt" || true

# located / unlocated 计数，给日志一个可追踪的分母。
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

bad=$(comm -23 "$tmp/codes.txt" "$tmp/allow.txt" || true)
if [ -n "$bad" ]; then
  echo "diag-located: these diagnostic codes have no location and are not allowlisted:" >&2
  printf '  %s\n' $bad >&2
  echo "Fix the emission site (attach a Span) or add a documented line to $allow." >&2
  cat "$tmp/counts.txt" >&2 || true
  exit 1
fi

reasons=$(cut -f2 "$tmp/unlocated.txt" | sort | uniq -c | tr '\n' ' ')
echo "diag-located: ok ($(tr '\n' ' ' < "$tmp/counts.txt"); absent reasons: ${reasons})"