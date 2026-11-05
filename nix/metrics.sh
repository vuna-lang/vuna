#!/bin/sh
# codegen 产物指标（固定夹具精确基线 / 手动上限）。
# 用法: sh nix/metrics.sh <SRC> [BUDGET]
#   SRC     单个 .ml 文件，或按分离编译布局的目录（聚合其中所有 .ml）
#   BUDGET  可选的基线文件（每行 "<metric> <max>" 或 "<metric> =<expected>"）；
#           省略则只打印指标。`<max>` 是上限（超了失败）；`=<expected>` 是精确基线
#           （不等即失败，用于固定输入）。
# 输出稳定、与机器无关（不含时间；强制 C locale）。
#
# 指标语义（都是生成代码的文本计数，不是语义计数）：
#   files      聚合的 .ml 文件数（夹具里锁模块面；seed 数由 seed-selfhost 断言）
#   bytes/lines/maxline/longlines  产物体积与行长（longlines = >100 列的行）
#   letrec     含 `let rec ` 的行数
#   strcat     `String.concat ""` 出现次数（运行时 dtp_concatMany 的标记）
#   eqint      `bi_eq_int` 出现次数（Int 相等快速路径的标记）
#   zeroarg    `fun () ->` 出现次数；内嵌 runtime 文本里的同串也计入
#   ctorcount  以构造子模式开头的 match 臂行数（`^  | C_` 或 C35 后的
#              `^  | <Unit>.C_` 全限定形态）；单行 `type t_ = C_ ...` 声明不计（名字是历史遗留）
set -eu
export LC_ALL=C

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
ctorcount=$(grep -cE '^  \| ([A-Z][A-Za-z0-9_]*\.)?C_' "$ALL" 2>/dev/null || true)

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
  case "$max" in
    =*)
      want=${max#=}
      if [ "$v" -ne "$want" ]; then
        printf 'DRIFT %s: %s != baseline %s\n' "$name" "$v" "$want" >&2
        fail=1
      fi
      ;;
    *)
      if [ "$v" -gt "$max" ]; then
        printf 'REGRESSION %s: %s > budget %s\n' "$name" "$v" "$max" >&2
        fail=1
      fi
      ;;
  esac
done <"$BUDGET"
if [ "$fail" -ne 0 ]; then
  echo "metrics: check failed ($BUDGET)" >&2
  exit 1
fi
echo "metrics: ok"
