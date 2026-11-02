#!/usr/bin/env bash
# vuna 原生测试 runner：包装 test/run-tests.sh，提供 --list / --only / --vuna。
# 主体脚本；由 nix/run-tests.nix 注入 PATH 与构建期模板（`nix run .#vuna-run-tests`）。
#
# 用法：
#   nix run .#vuna-run-tests                          全量测试（等价于 sh test/run-tests.sh）
#   nix run .#vuna-run-tests -- --list                列出全部章节（序号 + 标题），不跑测试
#   nix run .#vuna-run-tests -- --only PATTERN        只跑标题匹配的章节（可重复 / 逗号分隔）
#   nix run .#vuna-run-tests -- --only 34             数字按章节序号匹配（--only 3* → 3、30–34）
#   nix run .#vuna-run-tests -- --vuna stable         编译器改用注册表别名 vuna（远端稳定版）
#
# 选项：
#   --only PATTERN   章节过滤模式。含非数字字符时按标题子串匹配（大小写不敏感）；
#                    纯数字 / 通配时只按序号匹配（34 → 34；3* → 3、30–34）。
#                    可重复，也可用逗号分隔：--only 'fmt,DT'。
#   --list           打印全部章节（序号 + 标题）后退出 0。
#   --vuna MODE      local（默认，用本仓库 nix build .#vuna / .#vuna-seed）
#                    或 stable（用注册表别名 vuna#vuna / vuna#vuna-seed）。
#   -h, --help       显示本帮助。
#
# 编译器解析（运行时，不在 Nix 构建期绑定）：
#   VUNA / VUNA_SEED 已设置时直接使用，不调用 nix；
#   否则运行时 nix build --no-link --print-out-paths <仓库>#vuna（及 vuna-seed）。
#   仓库根 = 当前目录向上第一个同时含 flake.nix 与 test/run-tests.sh 的目录，
#   也可用 VUNA_REPO 显式指定。
#
# 无参数时直接 exec 原脚本，行为与 sh test/run-tests.sh 等价；--only 时把脚本按
# `^# N)` 章节标记切成「preamble + 选中章节 + 原结尾 summary」，不改动原脚本。
set -u

PROG=vuna-run-tests

# Nix 构建期注入：test/run-tests.sh 的 store 副本（仅在找不到本地树时用于 --list）。
TEMPLATE_SCRIPT=${VUNA_RUN_TESTS_TEMPLATE:-}

WORK_TMP=
cleanup() {
  if [ -n "$WORK_TMP" ]; then
    rm -rf "$WORK_TMP"
  fi
}
trap cleanup EXIT INT TERM

die() {
  printf '%s: %s\n' "$PROG" "$*" >&2
  exit 1
}

warn() {
  printf '%s: %s\n' "$PROG" "$*" >&2
}

usage() {
  cat <<'EOF'
用法：
  nix run .#vuna-run-tests                          全量测试（等价于 sh test/run-tests.sh）
  nix run .#vuna-run-tests -- --list                列出全部章节（序号 + 标题），不跑测试
  nix run .#vuna-run-tests -- --only PATTERN        只跑标题匹配的章节（可重复 / 逗号分隔）
  nix run .#vuna-run-tests -- --only 34             数字按章节序号匹配（--only 3* → 3、30–34）
  nix run .#vuna-run-tests -- --vuna stable         编译器改用注册表别名 vuna（远端稳定版）

选项：
  --only PATTERN   章节过滤模式。含非数字字符时按标题子串匹配（大小写不敏感）；
                   纯数字 / 通配时只按序号匹配（34 → 34；3* → 3、30–34）。
                   可重复，也可用逗号分隔：--only 'fmt,DT'。
  --list           打印全部章节（序号 + 标题）后退出 0。
  --vuna MODE      local（默认，用本仓库 nix build .#vuna / .#vuna-seed）
                   或 stable（用注册表别名 vuna#vuna / vuna#vuna-seed）。
  -h, --help       显示本帮助。

编译器解析：
  VUNA / VUNA_SEED 已设置时直接使用，不调用 nix；
  否则运行时 nix build --no-link --print-out-paths <仓库>#vuna（及 vuna-seed）。
  仓库根 = 当前目录向上第一个同时含 flake.nix 与 test/run-tests.sh 的目录，
  也可用 VUNA_REPO 显式指定。

无参数时直接 exec test/run-tests.sh，行为与 sh test/run-tests.sh 等价。
EOF
}

# 去首尾空白（含 --only 逗号列表里的空格）。
trim() {
  local s=$1
  s=${s#"${s%%[![:space:]]*}"}
  s=${s%"${s##*[![:space:]]}"}
  printf '%s\n' "$s"
}

add_patterns() { # raw：逗号分隔的模式串
  local raw=$1 part oldifs
  oldifs=$IFS
  IFS=,
  for part in $raw; do
    part=$(trim "$part")
    if [ -z "$part" ]; then
      IFS=$oldifs
      die "--only 的模式不能为空：$raw"
    fi
    only_patterns+=("$part")
  done
  IFS=$oldifs
}

only_patterns=()
want_list=0
vuna_mode=local

while [ "$#" -gt 0 ]; do
  case $1 in
    --list)
      want_list=1
      ;;
    --only)
      [ "$#" -ge 2 ] || die "--only 需要一个模式参数（例如 --only dt；用 --list 查看章节）"
      add_patterns "$2"
      shift
      ;;
    --only=*)
      add_patterns "${1#--only=}"
      ;;
    --vuna)
      [ "$#" -ge 2 ] || die "--vuna 需要 local 或 stable"
      vuna_mode=$2
      shift
      ;;
    --vuna=*)
      vuna_mode=${1#--vuna=}
      ;;
    -h | --help)
      usage
      exit 0
      ;;
    --)
      shift
      [ "$#" -eq 0 ] || die "多余的参数：$*（run-tests.sh 本身不接受参数）"
      break
      ;;
    *)
      die "未知参数：$1（见 --help）"
      ;;
  esac
  shift
done

case $vuna_mode in
  local | stable) ;;
  *) die "--vuna 只支持 local 或 stable：$vuna_mode" ;;
esac

if [ -n "${VUNA_REPO:-}" ] && [ ! -d "$VUNA_REPO" ]; then
  die "VUNA_REPO 不是目录：$VUNA_REPO"
fi

# 仓库根：VUNA_REPO 或从当前目录向上找（同时含 flake.nix 与 test/run-tests.sh）。
find_repo() {
  local dir parent
  if [ -n "${VUNA_REPO:-}" ]; then
    ( cd "$VUNA_REPO" && pwd -P )
    return 0
  fi
  dir=$(pwd -P) || return 1
  while :; do
    if [ -f "$dir/flake.nix" ] && [ -f "$dir/test/run-tests.sh" ]; then
      printf '%s\n' "$dir"
      return 0
    fi
    [ "$dir" = "/" ] && return 1
    parent=$(dirname "$dir")
    [ "$parent" = "$dir" ] && return 1
    dir=$parent
  done
}

repo=""
found_repo=$(find_repo) && repo=$found_repo

# --list 用的脚本：优先本地工作树（与源码同步）；否则退回构建期模板（只够列标题）。
pick_list_script() {
  if [ -n "$repo" ] && [ -f "$repo/test/run-tests.sh" ]; then
    printf '%s\n' "$repo/test/run-tests.sh"
    return 0
  fi
  if [ -n "$TEMPLATE_SCRIPT" ] && [ -f "$TEMPLATE_SCRIPT" ]; then
    printf '%s\n' "$TEMPLATE_SCRIPT"
    return 0
  fi
  return 1
}

# 按 `^# N) 标题` 章节标记流式打印序号与标题。
list_sections() {
  local script=$1 line num title count=0
  while IFS= read -r line || [ -n "$line" ]; do
    if [[ $line =~ ^#[[:space:]]+([0-9]+)\)[[:space:]]*(.*)$ ]]; then
      num=${BASH_REMATCH[1]}
      title=${BASH_REMATCH[2]}
      printf '%s) %s\n' "$num" "$title"
      count=$((count + 1))
    fi
  done <"$script"
  warn "共 $count 个章节"
  [ "$count" -gt 0 ] || die "在 $script 中没有找到形如 '# 1) 标题' 的章节标记"
}

if [ "$want_list" -eq 1 ]; then
  if ! list_script=$(pick_list_script); then
    die "找不到 test/run-tests.sh：请从 vuna 仓库内运行，或设置 VUNA_REPO=/path/to/vuna"
  fi
  list_sections "$list_script"
  exit 0
fi

# 实际执行必须有本地测试树（corpus/ 与 ../base/lib 都在工作树里）。
run_script=""
if [ -n "$repo" ] && [ -f "$repo/test/run-tests.sh" ]; then
  run_script=$repo/test/run-tests.sh
fi
if [ -z "$run_script" ]; then
  die "找不到本地 vuna 测试树（需要含 flake.nix 与 test/run-tests.sh 的目录）：请从仓库目录内运行，或设置 VUNA_REPO=/path/to/vuna"
fi

# 相对路径的 VUNA / VUNA_SEED 转绝对路径（corpus/fmt/check.sh 会先 cd 再调用）。
# 注意：这两个函数在 $(...) 里调用，失败用 return 1 而不是 die（die 只会退出子 shell）。
normalize_tool() {
  local t=$1 d b
  case $t in
    */*)
      case $t in
        /*)
          printf '%s\n' "$t"
          ;;
        *)
          d=${t%/*}
          b=${t##*/}
          [ -n "$d" ] || d=.
          if ! d=$(cd "$d" 2>/dev/null && pwd -P); then
            printf '%s: 路径不存在：%s\n' "$PROG" "$t" >&2
            return 1
          fi
          printf '%s/%s\n' "$d" "$b"
          ;;
      esac
      ;;
    *)
      printf '%s\n' "$t"
      ;;
  esac
}

check_tool() { # name value
  case $2 in
    */*) [ -x "$2" ] || die "$1 不可执行：$2" ;;
    *) command -v "$2" >/dev/null 2>&1 || die "$1 不在 PATH 中：$2" ;;
  esac
}

flake_ref() {
  case $vuna_mode in
    stable)
      printf '%s\n' vuna
      ;;
    local)
      if [ -z "$repo" ]; then
        printf '%s: 无法定位仓库根：--vuna local 需要从仓库内运行，或设置 VUNA_REPO\n' "$PROG" >&2
        return 1
      fi
      printf '%s\n' "$repo"
      ;;
  esac
}

# 运行时 nix build 解析编译器（不在 Nix 构建期绑定，避免本地树坏了连 runner 都用不了）。
nix_build_tool() { # flake-ref attr
  local ref=$1 attr=$2 out err bin ln
  if ! command -v nix >/dev/null 2>&1; then
    printf '%s: 找不到 nix 命令，无法解析 %s：请显式设置 VUNA / VUNA_SEED，或先 nix build .#vuna --out-link result\n' \
      "$PROG" "$attr" >&2
    return 1
  fi
  if ! err=$(mktemp "${TMPDIR:-/tmp}/vuna-run-tests-nix.XXXXXX"); then
    printf '%s: mktemp 失败，无法解析 %s\n' "$PROG" "$attr" >&2
    return 1
  fi
  if ! out=$(nix build --no-link --print-out-paths "$ref#$attr" 2>"$err"); then
    {
      printf '%s: 解析编译器失败（%s）\n' "$PROG" "$attr"
      printf '  命令：nix build --no-link --print-out-paths %s#%s\n' "$ref" "$attr"
      if [ -s "$err" ]; then
        printf '  nix 输出：\n'
        while IFS= read -r ln || [ -n "$ln" ]; do
          printf '    %s\n' "$ln"
        done <"$err"
      fi
      printf '提示：\n'
      printf '  * 先在本仓库构建编译器：nix build .#vuna --out-link result（种子：nix build .#vuna-seed --out-link result-seed）\n'
      printf '  * 或改用注册表稳定版：nix run .#vuna-run-tests -- --vuna stable\n'
      printf '  * 或直接指定：VUNA=/abs/path/vuna VUNA_SEED=/abs/path/vuna-seed nix run .#vuna-run-tests\n'
    } >&2
    rm -f "$err"
    return 1
  fi
  rm -f "$err"
  out=$(printf '%s\n' "$out" | tail -n 1)
  if [ -z "$out" ]; then
    printf '%s: nix build 没有输出 store 路径（%s）\n' "$PROG" "$attr" >&2
    return 1
  fi
  bin=$out/bin/$attr
  if [ ! -x "$bin" ]; then
    printf '%s: 构建结果缺少可执行文件：%s\n' "$PROG" "$bin" >&2
    return 1
  fi
  printf '%s\n' "$bin"
}

resolve_tools() {
  local vuna_val=${VUNA:-} seed_val=${VUNA_SEED:-} ref=""
  if [ -n "$vuna_val" ]; then
    vuna_val=$(normalize_tool "$vuna_val") || return 1
    check_tool VUNA "$vuna_val"
  fi
  if [ -n "$seed_val" ]; then
    seed_val=$(normalize_tool "$seed_val") || return 1
    check_tool VUNA_SEED "$seed_val"
  fi
  # 两个都覆盖时不碰 nix；只缺一个时只解析缺的那个。
  if [ -z "$vuna_val" ] || [ -z "$seed_val" ]; then
    ref=$(flake_ref) || return 1
  fi
  if [ -z "$vuna_val" ]; then
    vuna_val=$(nix_build_tool "$ref" vuna) || return 1
  fi
  if [ -z "$seed_val" ]; then
    seed_val=$(nix_build_tool "$ref" vuna-seed) || return 1
  fi
  VUNA=$vuna_val
  VUNA_SEED=$seed_val
  export VUNA VUNA_SEED
}

resolve_tools || exit 1

if [ "${#only_patterns[@]}" -eq 0 ]; then
  # 无 --only：直接 exec 原脚本，行为与 sh test/run-tests.sh 等价。
  exec "${BASH:-bash}" "$run_script"
fi

# ---- --only：把脚本切成「preamble + 选中章节 + 原结尾 summary」 ----

SPLIT_COUNT=0

# 定位结尾的失败判定（原脚本最后几行），后续原样拼接，保证退出码语义不变。
split_script() { # script tmpdir
  local script=$1 tmpdir=$2 line tail_start=0 lineno=0 n=0 cur="" replaced_cd=0 test_dir
  while IFS= read -r line || [ -n "$line" ]; do
    lineno=$((lineno + 1))
    case $line in
      'if [ "$fail" -ne 0 ]; then') tail_start=$lineno ;;
    esac
  done <"$script"
  if [ "$tail_start" -le 0 ]; then
    die "无法在 $script 中定位结尾的失败判定（即 'if [ \"\$fail\" -ne 0 ]' 那一行），测试脚本结构可能已变"
  fi

  head -n "$((tail_start - 1))" "$script" >"$tmpdir/body.sh"
  tail -n "+$tail_start" "$script" >"$tmpdir/tail.sh"

  mkdir -p "$tmpdir/parts"
  : >"$tmpdir/index.tsv"
  : >"$tmpdir/preamble.sh"
  test_dir=$(dirname "$script")

  while IFS= read -r line || [ -n "$line" ]; do
    if [[ $line =~ ^#[[:space:]]+([0-9]+)\)[[:space:]]*(.*)$ ]]; then
      n=$((n + 1))
      printf '%s\t%s\n' "${BASH_REMATCH[1]}" "${BASH_REMATCH[2]}" >>"$tmpdir/index.tsv"
      cur=$tmpdir/parts/$n.sh
      printf '%s\n' "$line" >"$cur"
      continue
    fi
    if [ "$n" -eq 0 ]; then
      # preamble 里的 cd "$(dirname "$0")" 会被生成的临时脚本带偏，替换成绝对 test 目录。
      case $line in
        'cd "$(dirname "$0")"')
          printf 'cd %q\n' "$test_dir" >>"$tmpdir/preamble.sh"
          replaced_cd=1
          ;;
        *)
          printf '%s\n' "$line" >>"$tmpdir/preamble.sh"
          ;;
      esac
    else
      printf '%s\n' "$line" >>"$cur"
    fi
  done <"$tmpdir/body.sh"

  [ "$replaced_cd" -eq 1 ] || printf 'cd %q\n' "$test_dir" >>"$tmpdir/preamble.sh"
  SPLIT_COUNT=$n
}

# 匹配：纯数字/通配（如 34、3*）只按序号匹配；其他按标题子串匹配（大小写不敏感）。
pattern_matches() { # num title pattern
  local num=$1 title=$2 pat=$3 rc=1 old
  case $pat in
    *[!0-9*?]*)
      # 含非数字、非通配字符 → 按标题子串匹配。
      case $title in
        *"$pat"*) return 0 ;;
      esac
      old=$(shopt -p nocasematch 2>/dev/null || true)
      shopt -s nocasematch
      case $title in
        *"$pat"*) rc=0 ;;
      esac
      if [ -n "$old" ]; then eval "$old"; fi
      return $rc
      ;;
    *)
      # 数字/通配 → 只匹配序号：34 精确命中，3* 命中 3、30–34。
      case $num in
        $pat) return 0 ;;
        *) return 1 ;;
      esac
      ;;
  esac
}

selected=()
selected_labels=()

select_parts() { # tmpdir
  local tmpdir=$1 num title idx=0 pat matched
  while IFS=$'\t' read -r num title; do
    idx=$((idx + 1))
    matched=0
    for pat in "${only_patterns[@]}"; do
      if pattern_matches "$num" "$title" "$pat"; then
        matched=1
        break
      fi
    done
    if [ "$matched" -eq 1 ]; then
      selected+=("$idx")
      selected_labels+=("$num) $title")
    fi
  done <"$tmpdir/index.tsv"
}

compose_selected() { # tmpdir
  local tmpdir=$1 out=$1/selected.sh idx
  : >"$out"
  cat "$tmpdir/preamble.sh" >>"$out"
  for idx in "${selected[@]}"; do
    printf '\n' >>"$out"
    cat "$tmpdir/parts/$idx.sh" >>"$out"
  done
  printf '\n' >>"$out"
  cat "$tmpdir/tail.sh" >>"$out"
}

if ! WORK_TMP=$(mktemp -d "${TMPDIR:-/tmp}/vuna-run-tests.XXXXXX"); then
  die "mktemp -d 失败"
fi

split_script "$run_script" "$WORK_TMP"
select_parts "$WORK_TMP"

if [ "${#selected[@]}" -eq 0 ]; then
  die "没有章节匹配：${only_patterns[*]}（用 --list 查看全部章节）"
fi

compose_selected "$WORK_TMP"

warn "只运行 ${#selected[@]}/$SPLIT_COUNT 个章节："
for label in "${selected_labels[@]}"; do
  printf '  %s\n' "$label" >&2
done

test_dir=$(dirname "$run_script")
cd "$test_dir" || die "无法进入测试目录：$test_dir"
# 不用 exec：保留 trap，退出时清理临时脚本目录。
"${BASH:-bash}" "$WORK_TMP/selected.sh"
status=$?
exit "$status"
