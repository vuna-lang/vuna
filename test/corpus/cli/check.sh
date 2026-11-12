#!/bin/sh
# test/corpus/cli/check.sh：M30 CLI 错误层 / 参数模型 / doc [export] 自检。
#
# 用法: sh corpus/cli/check.sh <vuna>
#
# 覆盖（全部在临时目录里跑，不依赖仓库自身状态）：
#   - fmt：非 workspace / 不存在路径 / workspace 无源码 → 可读错误 + exit 2；
#         无 PATH 时默认识别 workspace 并格式化/--check；
#   - map/api：非 workspace → 可读错误 + exit 2；
#   - doc：--with-comments 已删提示；目录/源文件校验；[export].modules 过滤（按
#         manifest 顺序、缺模块报错）；默认 OUT=DIR/docs/api.html；输出父目录递归创建；
#   - gen-errors：ROOT 必须存在且是目录；docs/.generated 递归创建；
#   - test/interp/goal/lint：不存在路径或目录输入给可读错误；
#   - 参数模型：未知/重复/缺值 flag 给可读错误 + exit 2（不再吞掉或抛宿主异常）。
#
# 注意：vuna 的诊断走 stdout（prim_print，没有独立 stderr 原语），断言统一用 2>&1。
set -u

VUNA=${1:?usage: check.sh <vuna>}
case "$VUNA" in
  /*) : ;;
  */*) VUNA=$(cd "$(dirname "$VUNA")" && pwd)/$(basename "$VUNA") ;;
esac

here=$(cd "$(dirname "$0")" && pwd)
export_fixture="$here/../doc/01_export"

tmp=$(mktemp -d "${TMPDIR:-/tmp}/vuna-cli-check.XXXXXX") || exit 1
trap 'rm -rf "$tmp"' EXIT INT TERM

pass=0
fail=0
ok() { pass=$((pass + 1)); }
bad() {
  fail=$((fail + 1))
  printf 'FAIL: %s\n' "$1" >&2
}
check_eq() {
  if [ "$2" = "$3" ]; then ok; else bad "$1 (expected [$2] got [$3])"; fi
}
check_contains() {
  case "$2" in
    *"$3"*) ok ;;
    *) bad "$1 (missing [$3] in [$2])" ;;
  esac
}
check_absent() {
  case "$2" in
    *"$3"*) bad "$1 (unexpected [$3] in [$2])" ;;
    *) ok ;;
  esac
}

# run <label> <workdir> <args...>：捕获合并输出与退出码到 $out/$code。
run() {
  label=$1
  dir=$2
  shift 2
  out=$(cd "$dir" && "$VUNA" "$@" 2>&1)
  code=$?
  printf '### %s | exit=%s\n%s\n' "$label" "$code" "$out" >&2
}

# ---------------------------------------------------------------
# 1) fmt：非 workspace / 不存在路径 / workspace 无源码
# ---------------------------------------------------------------
mkdir -p "$tmp/notws" "$tmp/nosrc" "$tmp/afile"
printf '[package]\nname = "nosrc"\n' >"$tmp/nosrc/vuna.toml"
printf 'not a directory\n' >"$tmp/afile/plain.txt"

run "fmt outside workspace" "$tmp/notws" fmt
check_eq "fmt outside workspace exit" "2" "$code"
check_contains "fmt outside workspace error" "$out" "not inside a vuna workspace"

run "fmt missing path" "$tmp" fmt "$tmp/no-such-file.vuna"
check_eq "fmt missing path exit" "2" "$code"
check_contains "fmt missing path error" "$out" "no such file"

run "fmt workspace without sources" "$tmp/nosrc" fmt
check_eq "fmt no-sources exit" "2" "$code"
check_contains "fmt no-sources error" "$out" "no vuna sources found"

# 默认目标 = workspace 内各包 lib/app/test：临时 workspace 里应被格式化。
mkdir -p "$tmp/fmtws/lib"
printf '[package]\nname = "fmtws"\n' >"$tmp/fmtws/vuna.toml"
printf 'x : Int\nx   =   1\n' >"$tmp/fmtws/lib/A.vuna"
run "fmt default workspace" "$tmp/fmtws" fmt
check_eq "fmt default workspace exit" "0" "$code"
check_contains "fmt default formatted file" "$(cat "$tmp/fmtws/lib/A.vuna")" "x = 1"
run "fmt --check after format" "$tmp/fmtws" fmt --check
check_eq "fmt --check clean exit" "0" "$code"
printf 'y : Int\ny    =   2\n' >"$tmp/fmtws/lib/B.vuna"
run "fmt --check unformatted" "$tmp/fmtws" fmt --check
check_eq "fmt --check dirty exit" "1" "$code"
check_contains "fmt --check dirty report" "$out" "would reformat"

# ---------------------------------------------------------------
# 2) map / api：非 workspace
# ---------------------------------------------------------------
run "map outside workspace" "$tmp/notws" map
check_eq "map outside workspace exit" "2" "$code"
check_contains "map outside workspace error" "$out" "not inside a vuna workspace"
run "api outside workspace" "$tmp/notws" api Vuna.Cli
check_eq "api outside workspace exit" "2" "$code"
check_contains "api outside workspace error" "$out" "not inside a vuna workspace"

# ---------------------------------------------------------------
# 3) doc：已删 flag / 目录与源文件校验 / [export] / 默认 OUT
# ---------------------------------------------------------------
run "doc removed --with-comments" "$tmp" doc --with-comments
check_eq "doc --with-comments exit" "2" "$code"
check_contains "doc --with-comments removed" "$out" "has been removed"

run "doc missing dir" "$tmp" doc "$tmp/no-such-dir" "$tmp/out.md"
check_eq "doc missing dir exit" "2" "$code"
check_contains "doc missing dir error" "$out" "no such directory"

run "doc file as dir" "$tmp" doc "$tmp/afile/plain.txt" "$tmp/out.md"
check_eq "doc file input exit" "2" "$code"
check_contains "doc file input error" "$out" "not a directory"

run "doc empty source dir" "$tmp" doc "$tmp/notws" "$tmp/out.md"
check_eq "doc empty dir exit" "2" "$code"
check_contains "doc empty dir error" "$out" "no vuna sources found"

# [export] 过滤：只渲染导出模块，按 manifest 顺序。
mkdir -p "$tmp/docpkg/lib"
cp "$export_fixture/vuna.toml" "$tmp/docpkg/vuna.toml"
cp "$export_fixture/lib/"*.vuna "$tmp/docpkg/lib/"
run "doc [export] filter" "$tmp" doc "$tmp/docpkg" "$tmp/deep/nested/api.html"
check_eq "doc [export] exit" "0" "$code"
doc_text=$(cat "$tmp/deep/nested/api.html" 2>/dev/null)
check_contains "doc [export] renders exported module" "$doc_text" "id='visible'"
check_absent "doc [export] skips hidden module" "$doc_text" "id='hidden'"
check_contains "doc [export] counts rendered modules" "$out" "(1 modules)"

# 缺导出模块 → 错误。
mkdir -p "$tmp/badexport/lib"
printf '[package]\nname = "badexport"\n\n[export]\nmodules = ["Missing.One"]\n' >"$tmp/badexport/vuna.toml"
printf 'module Present where\n\nexport p : Int\np = 0\n' >"$tmp/badexport/lib/Present.vuna"
run "doc missing exported module" "$tmp" doc "$tmp/badexport" "$tmp/bad.md"
check_eq "doc missing export exit" "2" "$code"
check_contains "doc missing export error" "$out" "exported module not found"

# 默认 OUT：DIR/docs/api.html（父目录不存在也要能建）。
mkdir -p "$tmp/docpkg2/lib/Vuna"
printf '[package]\nname = "docpkg2"\n' >"$tmp/docpkg2/vuna.toml"
printf 'module Vuna.Only where\n\nexport x : Int\nx = 1\n' >"$tmp/docpkg2/lib/Vuna/Only.vuna"
run "doc default OUT" "$tmp/docpkg2" doc
check_eq "doc default OUT exit" "0" "$code"
if [ -f "$tmp/docpkg2/docs/api.html" ]; then ok; else bad "doc default OUT did not write DIR/docs/api.html"; fi
check_contains "doc default OUT default content" "$(cat "$tmp/docpkg2/docs/api.html" 2>/dev/null)" "Vuna.Only"

# ---------------------------------------------------------------
# 4) gen-errors：ROOT 校验 + docs/.generated 递归创建
# ---------------------------------------------------------------
run "gen-errors missing root" "$tmp" gen-errors "$tmp/no-such-root"
check_eq "gen-errors missing root exit" "2" "$code"
check_contains "gen-errors missing root error" "$out" "no such directory"

run "gen-errors file root" "$tmp" gen-errors "$tmp/afile/plain.txt"
check_eq "gen-errors file root exit" "2" "$code"
check_contains "gen-errors file root error" "$out" "not a directory"

mkdir -p "$tmp/errroot"
run "gen-errors fresh root" "$tmp" gen-errors "$tmp/errroot"
check_eq "gen-errors fresh root exit" "0" "$code"
if [ -f "$tmp/errroot/docs/.generated/errors.md" ]; then ok; else bad "gen-errors did not create docs/.generated/errors.md"; fi
check_contains "gen-errors content" "$(cat "$tmp/errroot/docs/.generated/errors.md" 2>/dev/null)" "TC_"

# ---------------------------------------------------------------
# 5) test / interp / goal / lint：坏路径给可读错误
# ---------------------------------------------------------------
run "test missing dir" "$tmp" test "$tmp/no-such-dir"
check_eq "test missing dir exit" "2" "$code"
check_contains "test missing dir error" "$out" "no such directory"

run "interp missing file" "$tmp" interp "$tmp/no-such-file.vuna"
check_eq "interp missing file exit" "2" "$code"
check_contains "interp missing file error" "$out" "no such file"

run "interp directory" "$tmp" interp "$tmp/notws"
check_eq "interp directory exit" "2" "$code"
check_contains "interp directory error" "$out" "takes a single file"

run "goal missing file" "$tmp" goal "$tmp/no-such-file.vuna"
check_eq "goal missing file exit" "2" "$code"
check_contains "goal missing file error" "$out" "no such file"

run "lint missing file" "$tmp" lint "$tmp/no-such-file.vuna"
check_eq "lint missing file exit" "2" "$code"
check_contains "lint missing file error" "$out" "no such file"

# ---------------------------------------------------------------
# 6) 参数模型：未知 / 重复 / 缺值 / 已删 flag
# ---------------------------------------------------------------
run "duplicate flag" "$tmp" fmt --check --check "$tmp/fmtws/lib/A.vuna"
check_eq "duplicate flag exit" "2" "$code"
check_contains "duplicate flag error" "$out" "duplicate flag"

run "unknown flag" "$tmp" fmt --bogus "$tmp/fmtws/lib/A.vuna"
check_eq "unknown flag exit" "2" "$code"
check_contains "unknown flag error" "$out" "unknown flag"

run "unknown flag lint" "$tmp" lint --bogus "$tmp/fmtws/lib/A.vuna"
check_eq "unknown flag lint exit" "2" "$code"
check_contains "unknown flag lint error" "$out" "unknown flag"

run "value flag missing value" "$tmp" map --find
check_eq "value flag missing value exit" "2" "$code"
check_contains "value flag missing value error" "$out" "requires a value"

run "removed --dt" "$tmp" interp --dt "$tmp/fmtws/lib/A.vuna"
check_eq "removed --dt exit" "2" "$code"
check_contains "removed --dt hint" "$out" "has been removed"

run "removed --with-comments" "$tmp" doc --with-comments
check_eq "removed --with-comments exit 2" "2" "$code"
check_contains "removed --with-comments hint" "$out" "has been removed"

if [ "$fail" -ne 0 ]; then
  printf 'cli check: %s passed, %s failed\n' "$pass" "$fail"
  exit 1
fi
printf 'cli check passed (%s checks)\n' "$pass"
