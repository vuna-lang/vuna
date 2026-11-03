#!/bin/sh
# 机器无关的 codegen 指标（M12 回归门槛）。
# 用法: sh nix/metrics.sh <SRC> [BUDGET]
#   SRC     单个 .ml 文件，或按分离编译布局的目录（聚合其中所有 .ml）
#   BUDGET  可选的 budget 文件（每行 "<metric> <max>"）；省略则只打印指标。
# 输出稳定、与机器无关（不含时间）；超出 budget 时以非 0 退出。
set -eu

SRC=${1:?usage: metrics.sh <src> [budget]}
BUDGET=${2:-}

tmp=$(mktemp -d "${TMPDIR:-/tmp}/vuna-metrics.XXXXXX") || exit 1
trap 'rm -rf "$tmp"' EXIT INT TERM
ALL=$tmp/all.ml

if [ -d "$SRC" ]; then
  files=$(find "$SRC" -name '*.ml' -type f | LC_ALL=C sort)
  [ -n "$files" ] || { echo "metrics: no .ml files under $SRC" >&2; exit 1; }
  : >"$ALL"
  for f in $files; do awk '{ print }' "$f" >>"$ALL"; done
  # 逐文件规范化换行：直接用 cat 拼接会让「无尾换行」的末行与下一文件首行粘成一行，
  # 导致 lines/maxline/grep 计数失真。awk 按记录输出，等价于给缺失的尾换行补上。
  fcount=$(printf '%s\n' "$files" | wc -l | tr -d ' ')
else
  cp "$SRC" "$ALL"
  fcount=1
fi

bytes=$(wc -c <"$ALL" | tr -d ' ')
lines=$(wc -l <"$ALL" | tr -d ' ')
maxline=$(awk '{ if (length($0) > m) m = length($0) } END { print m + 0 }' "$ALL")
longlines=$(awk 'length($0) > 100' "$ALL" | wc -l | tr -d ' ')
letrec=$(grep -c 'let rec ' "$ALL" 2>/dev/null || true)
strcat=$(grep -c 'String.concat ""' "$ALL" 2>/dev/null || true)
eqint=$(grep -c 'bi_eq_int' "$ALL" 2>/dev/null || true)
zeroarg=$(grep -c 'fun () ->' "$ALL" 2>/dev/null || true)
ctorcount=$(grep -c '^  | C_' "$ALL" 2>/dev/null || true)

say() { printf '%s %s\n' "$1" "$2"; }

printf 'metrics for %s (%s .ml file(s))\n' "$SRC" "$fcount"
say files "$fcount"
say bytes "$bytes"
say lines "$lines"
say maxline "$maxline"
say longlines "$longlines"
say letrec "$letrec"
say strcat "$strcat"
say eqint "$eqint"
say zeroarg "$zeroarg"
say ctorcount "$ctorcount"

[ -n "$BUDGET" ] || exit 0
[ -f "$BUDGET" ] || { echo "metrics: budget file not found: $BUDGET" >&2; exit 1; }

fail=0
while read -r name max; do
  case "$name" in ''|\#*) continue ;; esac
  case "$name" in
    files) v=$fcount ;;
    bytes) v=$bytes ;;
    lines) v=$lines ;;
    maxline) v=$maxline ;;
    longlines) v=$longlines ;;
    letrec) v=$letrec ;;
    strcat) v=$strcat ;;
    eqint) v=$eqint ;;
    zeroarg) v=$zeroarg ;;
    ctorcount) v=$ctorcount ;;
    *) echo "metrics: unknown budget metric $name" >&2; exit 1 ;;
  esac
  if [ "$v" -gt "$max" ]; then
    printf 'REGRESSION %s: %s > budget %s\n' "$name" "$v" "$max" >&2
    fail=1
  fi
done <"$BUDGET"
if [ "$fail" -ne 0 ]; then
  echo "metrics: budget exceeded (nix/metrics.budget)" >&2
  exit 1
fi
echo "metrics: within budget"
