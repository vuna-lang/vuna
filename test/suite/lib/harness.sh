#!/bin/sh
# vuna 原生测试：只用 vuna / vuna-seed 驱动。
#
# M24 起只有一条 DT 路径（HM 检查器与 codegen 已删除，`--dt` 开关已移除）：
#   * 夹具检查/生成用 `check` / `compile`；`vuna interp` = DT 精化 + 核心求值；
#   * `interp` 是纯求值器（不执行效果），`main` 只展示 Int/String/Bool；
#     效果/不可归约夹具带 `<file>.vuna.nointerp` 标记 → 跳过 interp，只做 compile + 运行；
#   * 负例的 `.err` 是 DT 实际诊断的稳定片段（个别命令文案不同时用 `.cerr` 给 compile 用）；
#   * 包/构建段（28/29/33/34d）用 DT 的 `build` / `build --no-compile` / `compile`；
#   * DT 的 main 钩子会打印 main 的返回值：纯值 main 打印值；`main : IO a` 先执行效果，
#     再打印效果后的返回值（夹具用 `exit 0` 收尾，让 golden 只含业务输出）。
#
# M26：**包上下文取代 `--root`**。每个源文件的可见性由「最近的 vuna.toml + 依赖闭包」
# 决定；`test/corpus/vuna.toml` 是单文件夹具的包上下文（只依赖 vuna-base），目录型夹具
# 各有自己的 vuna.toml。无 manifest 的文件（如本脚本写进 $tmp 的临时夹具）只有
# base-only 上下文，base 位置来自 `VUNA_BASE`（默认 ../base，相对 test/）或可执行文件相对布局。
#
# M26 的 compile 是**目录式**：`compile [--no-print] (<entry.vuna>|<pkg-dir>) OUTDIR`
# （OUTDIR 必填、成功静默），产物是 `OUTDIR/{Vuna_runtime.ml,<Module>.ml,Main.ml,build.sh}`；
# `build [--no-compile] [--out DIR] [PKG]` 默认写 `.output` 并链接 `.output/bin/<pkg>`。
#
# 环境变量（默认取 PATH 中的同名命令）：
#   VUNA        当前编译器（stage 1）
#   VUNA_SEED   种子编译器（stage 0，多文件 seed/ 构建）
#   OCAMLOPT    OCaml 编译器，默认 ocamlopt
#   VUNA_BASE   base 包目录（无 manifest 文件的 base-only 上下文用；默认 ../base）
set -u

cd "${VUNA_SUITE_ROOT:?}/test"

: "${VUNA:=vuna}"
: "${VUNA_SEED:=vuna-seed}"
: "${OCAMLOPT:=ocamlopt}"
export OCAMLOPT
# M26：单文件/无 manifest 夹具的 base 定位（corpus 自己有 vuna.toml，因此这里主要
# 服务于 $tmp 里的临时夹具与 ad-hoc 单文件）。
: "${VUNA_BASE:=$PWD/../base}"
export VUNA_BASE
# 工具链绝对入口：章节可被 --only 单独挑选，不能依赖前面章节的局部变量。
summ_vuna=$(command -v "$VUNA" 2>/dev/null || true)
[ -n "$summ_vuna" ] || summ_vuna="$VUNA"

# 临时根必须位于**任何 vuna.toml 之外**：第 39 段要验证「无 manifest → base-only」，
# 若 $tmp 落在包内（nix 沙箱里 TMPDIR=/build 就是工作树根），向上找 manifest 会命中仓库
# 根包，上下文语义就悄悄变了（本地 /tmp 与沙箱行为不一致）。先在候选根里挑一个祖先
# 链上没有 vuna.toml 的目录；两个候选都不可用就明确失败，不静默降级。
has_manifest_ancestor() { # dir
  d=$1
  while :; do
    [ -f "$d/vuna.toml" ] && return 0
    [ "$d" = "/" ] && return 1
    d=$(dirname "$d")
  done
}

tmpbase=
for cand in "${TMPDIR:-/tmp}" /tmp; do
  [ -d "$cand" ] || continue
  if ! has_manifest_ancestor "$cand"; then
    tmpbase=$cand
    break
  fi
done
if [ -z "$tmpbase" ]; then
  printf 'FAIL: 找不到包外的临时目录（TMPDIR=%s；无 manifest 用例需要它）\n' "${TMPDIR:-/tmp}" >&2
  exit 1
fi
export TMPDIR="$tmpbase"
tmp=$(mktemp -d "$tmpbase/vuna-tests.XXXXXX") || exit 1
trap 'rm -rf "$tmp"' EXIT INT TERM
# REPL 历史默认写 $HOME（测试不能污染用户目录）；统一指到临时目录。
export VUNA_REPL_HISTORY="$tmp/repl-history"
# iface 默认与源码同布局；测试统一走临时镜像根（VUNA_IFACE_DIR），避免往仓库工作树写
# 缓存。默认（源码旁）布局由 §57 用临时副本单独验证。
export VUNA_IFACE_DIR="$tmp/iface"

# iface 镜像目录（VUNA_IFACE_DIR 模式 = <根>/<包绝对目录去掉前导 />）；用于布局断言。
abs_norm_dir() { ( cd "$1" 2>/dev/null && pwd ) || printf '%s' "$1"; }
mirror_under() {
  _r=$1
  _d=$(abs_norm_dir "$2")
  printf '%s/%s' "$_r" "${_d#/}"
}
iface_mirror_dir() { mirror_under "$VUNA_IFACE_DIR" "$1"; }

# ---------------------------------------------------------------- 命令超时（W1）
# vuna / vuna-seed 经包装脚本统一加超时（默认 300s，VUNA_TEST_CMD_TIMEOUT 覆盖，0 = 关闭）；
# 编译产物与 build.sh（ocamlopt 链接）经 run_bin 包装。语义：
#   - 成功路径退出码/输出逐字不变（只是中间多一层 timeout）；
#   - 超时打印明确 FAIL 行（stderr），命令退出码 124 → 调用点原有断言失败，脚本继续；
#   - 最终统计再补一条 "command timeout"，保证有超时一定整体失败；
#   - 没有 timeout 命令时优雅降级为直跑（不算 FAIL，也不崩）。
cmd_timeout=${VUNA_TEST_CMD_TIMEOUT:-300}
case "$cmd_timeout" in
  '' | *[!0-9]*) cmd_timeout=300 ;;
esac
has_timeout_cmd=0
if command -v timeout >/dev/null 2>&1; then has_timeout_cmd=1; fi
timeout_mark="$tmp/command-timeouts"
: >"$timeout_mark"
mkdir -p "$tmp/timeout-bin"
VUNA_REAL=$VUNA
VUNA_SEED_REAL=$VUNA_SEED

# 生成工具包装脚本：真实可执行文件 + timeout；超时打印 FAIL 并记录到 timeout_mark。
# 注意：heredoc body 是**未引用**的（$2 / $cmd_timeout 要在生成期展开），因此 body 里
# 不能出现裸反引号或 $(...)——它们会在生成脚本时被当前 shell 当命令替换执行。需要在
# body 里写注释时用「」而不是反引号。
# `timeout` 一律带 `--foreground`：默认它会为子进程新建进程组，REPL 的 pty 用例
# （script -qec 起 vuna repl）里新 pgroup 不是控制终端的前台组，vuna 一读 tty 就吃
# SIGTTIN 停住 → 会话挂死（§54 pty 全挂 + 章节超时）。--foreground 保留调用方进程组。
write_tool_wrapper() { # wrapper-path real-path
  cat >"$1" <<WRAPPER
#!/bin/sh
secs=\${VUNA_TEST_CMD_TIMEOUT:-$cmd_timeout}
case "\$secs" in '' | *[!0-9]*) secs=$cmd_timeout ;; esac
if [ "\$secs" -gt 0 ] && command -v timeout >/dev/null 2>&1; then
  timeout --foreground -s TERM -k 10 "\$secs" "$2" "\$@"
  rc=\$?
  if [ "\$rc" -eq 124 ] || [ "\$rc" -eq 137 ]; then
    printf 'FAIL: command timed out after %ss: %s %s\n' "\$secs" "$2" "\$*" >&2
    printf '%s %s\n' "$2" "\$*" >>"$timeout_mark"
  fi
  exit \$rc
fi
exec "$2" "\$@"
WRAPPER
  chmod +x "$1"
}
write_tool_wrapper "$tmp/timeout-bin/vuna" "$VUNA_REAL"
write_tool_wrapper "$tmp/timeout-bin/vuna-seed" "$VUNA_SEED_REAL"
VUNA="$tmp/timeout-bin/vuna"
VUNA_SEED="$tmp/timeout-bin/vuna-seed"

pass=0
fail=0

ok() { pass=$((pass + 1)); }

bad() {
  fail=$((fail + 1))
  printf 'FAIL: %s\n' "$1"
  if [ "$#" -ge 3 ]; then
    printf '  expected: %s\n' "$2"
    printf '  actual:   %s\n' "$3"
  fi
}

check_eq() { # name expected actual
  if [ "$2" = "$3" ]; then ok; else bad "$1" "$2" "$3"; fi
}

check_contains() { # name haystack needle
  case "$2" in
    *"$3"*) ok ;;
    *) bad "$1" "(contains) $3" "$2" ;;
  esac
}

# 编译产物 / build.sh 的统一超时包装（与工具 wrapper 同语义；超时 return 124）。
run_bin() { # cmd [args...]
  if [ "$cmd_timeout" -gt 0 ] && [ "$has_timeout_cmd" -eq 1 ]; then
    timeout -s TERM -k 10 "$cmd_timeout" "$@"
    rb_rc=$?
    if [ "$rb_rc" -eq 124 ] || [ "$rb_rc" -eq 137 ]; then
      printf 'FAIL: command timed out after %ss: %s\n' "$cmd_timeout" "$*" >&2
      printf '%s\n' "$*" >>"$timeout_mark"
    fi
    return "$rb_rc"
  fi
  "$@"
}

# 覆盖断言：靠 glob 枚举的章节先断言「至少匹配一个夹具」，夹具消失/改名前缀时不再静默漏跑。
require_files() { # label first-match（未匹配时是字面量 glob，不是存在的路径）
  if [ ! -e "$2" ]; then
    bad "$1 (coverage)" ">=1 fixture matched" "glob matched nothing: $2"
  fi
}

# 通过数下限：section_begin 记本段起点，assert_min_section_checks 断言本段新增 check 数。
section_pass0=0
section_begin() { section_pass0=$pass; }
assert_min_section_checks() { # label min
  _smc=$((pass - section_pass0))
  if [ "$_smc" -ge "$2" ]; then
    ok
  else
    bad "$1 (checks floor)" ">= $2 passed checks" "$_smc"
  fi
}

# 汇总阶段调用（在结尾 tail 里）：任何命令超时都让本次运行失败。
check_command_timeouts() {
  if [ -s "$timeout_mark" ]; then
    _tmo_n=$(wc -l <"$timeout_mark" | tr -d ' ')
    bad "command timeout" "no command timed out" "${_tmo_n} timed out (VUNA_TEST_CMD_TIMEOUT=${cmd_timeout}s; see FAIL lines above)"
  fi
}

# ---------------------------------------------------------------- 目录式 compile
# M26：compile 的产物是「目录 + build.sh」，不再有单文件 .ml。成功时 compile 静默；
# build.sh 用 `sh build.sh <OUT>` 把产物链接成可执行文件（OUT 相对 OUTDIR）。
compile_seq=0
CD_BIN=""

compile_dir_bin() { # name compiler entry [compile flags...]；成功时设置 CD_BIN
  name=$1
  compiler=$2
  entry=$3
  shift 3
  compile_seq=$((compile_seq + 1))
  outdir="$tmp/compiled-$compile_seq"
  rm -rf "$outdir"
  if ! compile_msg=$("$compiler" compile "$@" "$entry" "$outdir" 2>&1); then
    bad "$name compile" "exit 0" "$compile_msg"
    return 1
  fi
  if [ -n "$compile_msg" ]; then
    bad "$name compile output" "" "$compile_msg"
    return 1
  fi
  if ! ( cd "$outdir" && run_bin sh build.sh prog ) >"$tmp/build-$compile_seq.log" 2>&1; then
    bad "$name build.sh" "exit 0" "$(tail -3 "$tmp/build-$compile_seq.log")"
    return 1
  fi
  CD_BIN="$outdir/prog"
  return 0
}

compile_dir_and_run() { # name compiler entry expected [compile flags...]
  run_name=$1
  run_compiler=$2
  run_entry=$3
  run_expected=$4
  shift 4
  if compile_dir_bin "$run_name" "$run_compiler" "$run_entry" "$@"; then
    check_eq "$run_name run" "$run_expected" "$(run_bin "$CD_BIN" 2>&1)"
  fi
}

# 单文件负例：interp（DT）与 compile 都要报错、含片段、且不写输出目录。
expect_dt_error() { # name file
  name=$1
  file=$2
  base=${file%.vuna}
  fragment=$(cat "$base.err")
  compile_fragment=$fragment
  if [ -f "$base.cerr" ]; then compile_fragment=$(cat "$base.cerr"); fi

  actual=$("$VUNA" interp "$file" 2>&1)
  code=$?
  check_contains "$name (interp error)" "$actual" "$fragment"
  if [ "$code" -ne 0 ]; then ok; else bad "$name (interp error exit)" "non-zero" "$code"; fi

  compile_seq=$((compile_seq + 1))
  outdir="$tmp/neg-$compile_seq"
  rm -rf "$outdir"
  actual=$("$VUNA" compile "$file" "$outdir" 2>&1)
  code=$?
  check_contains "$name (compile error)" "$actual" "$compile_fragment"
  if [ "$code" -ne 0 ]; then ok; else bad "$name (compile error exit)" "non-zero" "$code"; fi
  if [ -e "$outdir" ]; then
    bad "$name (compile no output dir)" "absent" "present"
  else
    ok
  fi
}

# 目录型负例：同上，entry 是 <dir>/app/Main.vuna，片段来自 <dir>/expected.err。
expect_dt_dir_error() { # name dir
  name=$1
  dir=$2
  fragment=$(cat "$dir/expected.err")
  entry="$dir/app/Main.vuna"

  actual=$("$VUNA" interp "$entry" 2>&1)
  code=$?
  check_contains "$name (interp error)" "$actual" "$fragment"
  if [ "$code" -ne 0 ]; then ok; else bad "$name (interp error exit)" "non-zero" "$code"; fi

  compile_seq=$((compile_seq + 1))
  outdir="$tmp/neg-dir-$compile_seq"
  rm -rf "$outdir"
  actual=$("$VUNA" compile "$dir" "$outdir" 2>&1)
  code=$?
  check_contains "$name (compile error)" "$actual" "$fragment"
  if [ "$code" -ne 0 ]; then ok; else bad "$name (compile error exit)" "non-zero" "$code"; fi
  if [ -e "$outdir" ]; then
    bad "$name (compile no output dir)" "absent" "present"
  else
    ok
  fi
}


# ---------------------------------------------------------------- 章节收尾
# 每个章节脚本（test/suite/sections/NN.sh）最后调用；等价于原 test/run-tests.sh
# 从 `if [ "$fail" -ne 0 ]; then` 到文件末尾的汇总逻辑（含命令超时兜底）。
finish() {
  if [ "$fail" -ne 0 ]; then
    printf '%s passed, %s failed\n' "$pass" "$fail"
    exit 1
  fi
  # W1：命令超时也算失败（wrapper / run_bin 已逐条打印 FAIL；这里再兜底一条并改退出码）。
  check_command_timeouts
  case $fail in
    0) printf 'vuna tests passed (%s checks)\n' "$pass" ;;
    *)
      printf '%s passed, %s failed\n' "$pass" "$fail"
      exit 1
      ;;
  esac
}
