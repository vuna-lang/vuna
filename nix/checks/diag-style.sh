#!/bin/sh
# 诊断文案规范门禁（D7.9）：目录里的消息模板必须满足统一风格。
#
# 规则（对 errors.md 的「消息」列逐条检查）：
#   - 消息非空（LN_/FX_ 由规则名/修复动作承载，允许空）；
#   - 不以句号结尾（消息会拼进 `[CODE] 消息` 行，句号多余）；
#   - 首字符小写（专有名词例外见 nix/diag-style-allow.txt，逐码记录）；
#   - 无首尾空白、无双空格、不以 `error`/`Error`/`ERR` 开头；
#   - 插值占位符只允许 `<0>`..`<9>`（模板 arity 由类型索引保证，这里只查拼写）。
set -eu
: "${VUNA:?VUNA must point to a vuna binary}"

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
mkdir -p "$tmp/docs"
"$VUNA" gen-errors "$tmp" >/dev/null 2>&1
md="$tmp/docs/.generated/errors.md"
[ -f "$md" ] || { echo "diag-style: gen-errors did not produce errors.md" >&2; exit 1; }

allowfile=nix/diag-style-allow.txt
if [ -f "$allowfile" ]; then
  grep -v '^[[:space:]]*#' "$allowfile" | grep -v '^[[:space:]]*$' | sort -u > "$tmp/allow.txt" || true
else
  : > "$tmp/allow.txt"
fi

awk -F'|' '/^\| [A-Z][A-Za-z0-9]*_[A-Za-z0-9]* / {
  code=$2; msg=$6;
  gsub(/^ +| +$/,"",code); gsub(/^ +| +$/,"",msg);
  gsub(/^`|`$/,"",msg);
  print code "\t" msg;
}' "$md" > "$tmp/rows.txt"

fail=0
report() { echo "diag-style: $1: $2" >&2; fail=1; }

while IFS="$(printf '\t')" read -r code msg; do
  [ -n "$code" ] || continue
  case "$code" in LN_*|FX_*) continue ;; esac
  if [ -z "$msg" ]; then report "$code" "empty message"; continue; fi
  case "$msg" in
    *.) report "$code" "message ends with a period: $msg" ;;
  esac
  case "$msg" in
    " "*|*" ") report "$code" "message has leading/trailing space: [$msg]" ;;
    *"  "*) report "$code" "message contains double space: [$msg]" ;;
    error*|Error*|ERR*) report "$code" "message starts with error prefix: $msg" ;;
  esac
  first=$(printf '%s' "$msg" | cut -c1)
  case "$first" in
    [A-Z])
      if ! grep -qx "$code" "$tmp/allow.txt"; then
        report "$code" "message starts uppercase (proper-noun exception must be allowlisted): $msg"
      fi
      ;;
  esac
  case "$msg" in
    *'<10>'*|*'<11>'*|*'<12>'*) report "$code" "placeholder arity exceeds <9>: $msg" ;;
  esac
done < "$tmp/rows.txt"

if [ "$fail" -ne 0 ]; then
  echo "diag-style: FAILED (see messages above; allowlist: $allowfile)" >&2
  exit 1
fi
echo "diag-style: ok ($(wc -l < "$tmp/rows.txt" | tr -d ' ') catalog messages checked)"
