#!/bin/sh
# M26 API / 产物快照生成器。
#
# 用法（任意目录；第一个参数是输出目录，默认本目录）：
#   sh test/snapshots/update.sh                 # 刷新并提交前三个/五个快照文件
#   sh test/snapshots/update.sh /tmp/snapshots  # suite 的 §38 现场生成后与提交版 diff
#
# 环境变量：
#   VUNA        编译器（默认 PATH 中的 vuna；suite runner 会传绝对路径）
#   VUNA_BASE   base 包目录（默认 <repo>/base）
#
# 产物（全部是规范化后的文本，逐字节比较）：
#   exports.txt              每个源文件的 `module X (...) where` 导出面（导出项排序；
#                            无 header / 无导出列表记 `(implicit)`）。覆盖
#                            lib/Vuna/**、compiler/lib/Vuna/**、base/lib/**。
#   modules.txt              `vuna map --modules` 在仓库根 / compiler / base 的模块面。
#   split-05_entry_data.txt  `vuna compile <pkg> OUTDIR` 的产物文件列表 + 每个 .ml 里
#   split-06_entry_trait.txt `^type t_` / `^let v_` 的名字清单（排序），锁住 split 产物的
#   split-dt_ad_hoc.txt      模块/入口归属与零参定义形态（M26/A05/A13/C08 的回归面）。
set -eu

HERE=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd) || exit 1
REPO=$(CDPATH= cd -- "$HERE/../.." && pwd) || exit 1
OUT=${1:-$HERE}

: "${VUNA:=vuna}"
: "${VUNA_BASE:=$REPO/base}"
export VUNA_BASE

tmp=$(mktemp -d "${TMPDIR:-/tmp}/vuna-snapshots.XXXXXX") || exit 1
trap 'chmod -R u+w "$tmp" 2>/dev/null; rm -rf "$tmp" 2>/dev/null' EXIT INT TERM

mkdir -p "$OUT"
cd "$REPO"

# ---------------------------------------------------------------- exports.txt
# 模块头导出面：`module X ( a, B(..), module M, C.d ) where`。
# 规范化：去注释 → 取括号内 → 逗号切项 → 去空白/空项 → 排序去重 → ", " 连接。
# （逐文件处理：awk/sed 只负责抽 header，没有 header 的文件记 `(implicit)`。）
export_items() { # header-file
  header=$(cat "$1")
  # 去行注释与单行块注释；源码头不含跨行块注释。
  header=$(printf '%s\n' "$header" | sed -e 's/--.*$//' -e 's/{-[^-]*-}//g' -e 's/{-.*-}//g')
  case "$header" in
    *\(*)
      # 拼接后的 header 形如 " module X ( a, B(..), module M ) where"：
      # 取第一个 "(" 之后 → 去尾部空白 → 去末尾 " where" → 去最后一个 ")"。
      body=${header#*(}
      body=$(printf '%s' "$body" | sed -e 's/[[:blank:]]*$//')
      body=${body% where}
      body=${body%)}
      printf '%s' "$body" | tr ',' '\n' \
        | sed -e 's/^[[:blank:]]*//' -e 's/[[:blank:]]*$//' \
        | grep -v '^$' | LC_ALL=C sort -u | paste -sd ',' - | sed 's/,/, /g'
      ;;
    *) printf '(implicit)' ;;
  esac
}

{
  echo "# M26 导出面快照（module X (...) where 的项，排序规范化；无 header => (implicit)）"
  for f in $(find lib/Vuna compiler/lib/Vuna base/lib -name '*.vuna' | LC_ALL=C sort); do
    header=$(awk '/^module[ \t]/{f=1} f{print} f&&/ where[ \t]*$/{exit}' "$f")
    if [ -z "$header" ]; then
      printf '%s: (implicit)\n' "$f"
    else
      printf '%s\n' "$header" >"$tmp/one-header"
      items=$(export_items "$tmp/one-header")
      printf '%s: %s\n' "$f" "$items"
    fi
  done
} >"$tmp/exports.txt"

mv "$tmp/exports.txt" "$OUT/exports.txt"

# ---------------------------------------------------------------- modules.txt
# 模块面：仓库根（工具链 + app）、compiler 包、base 包。
{
  echo "# M26 模块面快照（vuna map --modules）"
  echo ""
  echo "## root（工具链 + 产品 CLI）"
  "$VUNA" map --modules
  echo ""
  echo "## compiler（vuna-compiler）"
  ( cd compiler && "$VUNA" map --modules )
  echo ""
  echo "## base（vuna-base）"
  ( cd base && "$VUNA" map --modules )
} >"$tmp/modules.txt"

mv "$tmp/modules.txt" "$OUT/modules.txt"

# ---------------------------------------------------------------- split-*.txt
# 一次 compile <entry|pkg> OUTDIR 的产物快照：
#   文件清单（排序）+ 每个 .ml 的 `^type t_` / `^let v_` 名单（排序）。
split_snapshot() { # snapshot-name entry-or-pkg
  snap_name=$1
  entry=$2
  outdir="$tmp/split-$snap_name"
  rm -rf "$outdir"
  "$VUNA" compile "$entry" "$outdir" >"$tmp/split-$snap_name.log" 2>&1 || {
    echo "snapshots: compile failed: $entry" >&2
    cat "$tmp/split-$snap_name.log" >&2
    exit 1
  }
  {
    printf '# M26 split 产物快照：%s\n' "$entry"
    printf '# files（排序，相对 OUTDIR）\n'
    ( cd "$outdir" && find . -type f | sed 's|^\./||' | LC_ALL=C sort )
    printf '\n# names（每个 .ml 的 ^type t_ / ^let v_，排序）\n'
    for ml in $( cd "$outdir" && find . -maxdepth 1 -type f -name '*.ml' | sed 's|^\./||' | LC_ALL=C sort ); do
      printf '\n== %s\n' "$ml"
      grep -E '^(type t_|let v_)' "$outdir/$ml" | awk '{ print $1 " " $2 }' | LC_ALL=C sort || true
    done
  } >"$tmp/split-$snap_name.txt"
  mv "$tmp/split-$snap_name.txt" "$OUT/split-$snap_name.txt"
}

split_snapshot 05_entry_data test/corpus/packages/05_entry_data
split_snapshot 06_entry_trait test/corpus/packages/06_entry_trait
split_snapshot dt_ad_hoc test/corpus/dt_ad_hoc/Main.vuna

printf 'snapshots: wrote %s\n' "$OUT"