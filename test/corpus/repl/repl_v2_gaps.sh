#!/bin/sh
# REPL v2 剩余缺口回归（W2 / debt D35）：
#   * 多行单元的历史持久化（v2 编码；旧 v1 文件仍可读，写回升级）；
#   * 括号粘贴：`\e[200~` … `\e[201~` 一次进缓冲、换行不触发提交、`:load` 参数位不触发补全；
#   * 窗口 resize 重绘（空闲轮询，非忙等；非 tty 行为不变）；
#   * `:load` / `:browse` 参数位的模块名与文件路径补全。
#
# 用法：sh test/corpus/repl/repl_v2_gaps.sh <path-to-vuna>
#
# 分层（CI 沙箱只有 util-linux 的 script，没有 python）：
#   * 纯函数断言：`vuna run test/corpus/repl`（app/Main.vuna，main = 失败计数）——始终执行；
#   * 非 pty 断言：管道驱动 REPL 的历史文件编码/兼容性——始终执行；
#   * pty 断言：`script -qec` 伪造终端——`script` 或 /dev/pts 不可用时打印 SKIP，不影响通过；
#     resize 用 /dev/tty + `stty cols` 改宽度（不支持时同样 SKIP）。
set -u

[ "$#" -ge 1 ] || {
  echo "用法: sh test/corpus/repl/repl_v2_gaps.sh <path-to-vuna>" >&2
  exit 2
}
VUNA=$1
[ -x "$VUNA" ] || {
  echo "repl-v2-gaps: 找不到可执行的 vuna: $VUNA" >&2
  exit 2
}
# 规范化成绝对路径：pty 用例会 `cd` 到临时 workspace（`:browse` / `:load` 的包上下文），
# 相对路径在那边会找不到。
case "$VUNA" in
  /*) ;;
  *) VUNA=$(CDPATH= cd -- "$(dirname -- "$VUNA")" && pwd)/$(basename -- "$VUNA") ;;
esac

HERE=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd) || exit 1
REPO=$(CDPATH= cd -- "$HERE/../../.." && pwd) || exit 1
: "${VUNA_BASE:=$REPO/base}"
export VUNA_BASE

tmp=$(mktemp -d "${TMPDIR:-/tmp}/vuna-repl-gaps.XXXXXX") || exit 1
cleanup() {
  rm -rf "$tmp"
  rm -rf "$HERE/.output"
}
trap cleanup EXIT INT TERM

pass=0
fail=0
skips=0
ok() { pass=$((pass + 1)); }
bad() {
  fail=$((fail + 1))
  printf 'FAIL: %s\n' "$1"
}
skip() {
  skips=$((skips + 1))
  printf 'SKIP: %s\n' "$1"
}
check_contains() { # name haystack needle
  case "$2" in
    *"$3"*) ok ;;
    *)
      bad "$1"
      printf '  want substring: %s\n' "$3"
      printf '  actual (tail): %s\n' "$(printf '%s' "$2" | tail -c 300 | tr '\n' ' ')"
      ;;
  esac
}
check_absent() { # name haystack needle
  case "$2" in
    *"$3"*)
      bad "$1"
      printf '  unexpected substring: %s\n' "$3"
      ;;
    *) ok ;;
  esac
}
check_eq() { # name expected actual
  if [ "$2" = "$3" ]; then ok; else bad "$1"; printf '  expected: %s\n  actual:   %s\n' "$2" "$3"; fi
}

# 伪终端会话：stdin 由调用方的输入生成器喂入；输出合并 stderr 后由调用方裁掉 \r。
run_pty() { # dir history-file
  ( cd "$1" && NO_COLOR=1 VUNA_REPL_HISTORY="$2" script -qec "$VUNA repl" /dev/null 2>&1 )
}

# ---------------------------------------------------------------- 纯函数夹具（vuna test）
# 历史编码/解码、粘贴状态机、补全候选判定（不依赖 pty）：test/ReplPure.vuna 经
# `vuna test` 的核心求值/编译执行，失败 exit 1；断言集在 lib/ReplGapsPure.vuna。
pure_out=$("$VUNA" test "$HERE" 2>&1)
pure_code=$?
check_eq "pure: vuna test 退出码" "0" "$pure_code"
check_contains "pure: 纯函数断言全过" "$pure_out" "1 passed, 0 failed"
check_contains "pure: 用例可见" "$pure_out" "ReplPure.vuna"
rm -rf "$HERE/.output"

# ---------------------------------------------------------------- 非 pty：历史持久化
hist=$tmp/hist-multiline
out=$(printf 'f : Int -> Int\nf x =\n  x + 1\n\nf 41\n:q\n' |
  VUNA_REPL_HISTORY="$hist" "$VUNA" repl 2>&1)
check_contains "history: 多行定义可用" "$out" "42"
check_contains "history: v2 文件头" "$(cat "$hist" 2>/dev/null)" "vuna-repl-history 2"
check_contains "history: 多行单元编码为一行" "$(cat "$hist" 2>/dev/null)" 'f x =\n  x + 1'

hist2=$tmp/hist-restore
printf 'vuna-repl-history 2\nx = 1 + 1\\ny = x + 40\n' >"$hist2"
out=$(printf ':history\n:q\n' | VUNA_REPL_HISTORY="$hist2" "$VUNA" repl 2>&1)
check_contains "history: 多行单元恢复为一条" "$out" "x = 1 + 1 …"

# v1（旧格式）兼容：无头纯文本仍可读；会话后升级为 v2，字面 `\n` 不被误解码。
hist3=$tmp/hist-v1
printf '7 + 1\nx = "a\\nb"\n' >"$hist3"
out=$(printf ':history\n2 + 2\n:q\n' | VUNA_REPL_HISTORY="$hist3" "$VUNA" repl 2>&1)
check_contains "history: v1 旧文件可读" "$out" "7 + 1"
check_contains "history: v1 字面反斜杠不解码" "$out" 'x = "a\nb"'
check_contains "history: v1 会话后升级 v2" "$(cat "$hist3" 2>/dev/null)" "vuna-repl-history 2"
check_contains "history: 升级后保留旧条目" "$(cat "$hist3" 2>/dev/null)" '7 + 1'

# 历史目录不可写：静默降级（REPL 仍求值），不崩。
out=$(printf '1 + 1\n:q\n' | VUNA_REPL_HISTORY=/proc/vuna-repl-gaps/hist "$VUNA" repl 2>&1)
check_contains "history: 不可写目录静默降级" "$out" "2"

# 非 tty 行为不变：不输出括号粘贴开关序列。
out=$(printf '1 + 1\n:q\n' | VUNA_REPL_HISTORY="$tmp/hist-notty" "$VUNA" repl 2>&1)
check_absent "non-tty: 无括号粘贴序列" "$out" "$(printf '\033')[?2004"

# ---------------------------------------------------------------- pty 断言
pty_ok=0
if command -v script >/dev/null 2>&1 && [ -d /dev/pts ]; then
  if printf ':q\n' | NO_COLOR=1 VUNA_REPL_HISTORY="$tmp/pty-probe" script -qec "$VUNA repl" /dev/null >/dev/null 2>&1; then
    pty_ok=1
  fi
fi
if [ "$pty_ok" -eq 0 ]; then
  skip "pty 断言（script / /dev/pts 不可用）"
else
  # 1) 单行括号粘贴：一次进缓冲，提交后正常求值；开/关序列都输出。
  out=$( (sleep 0.8; printf '\033[200~x = 1 + 1\033[201~'; sleep 0.5; printf '\n'; sleep 0.4; printf 'x\n'; sleep 0.3; printf ':q\n') |
    run_pty "$REPO" "$tmp/pty-paste1" | tr -d '\r')
  check_contains "pty paste: 单行粘贴求值" "$out" "2"
  check_contains "pty paste: 启用括号粘贴" "$out" "$(printf '\033')[?2004h"
  check_contains "pty paste: 退出时关闭括号粘贴" "$out" "$(printf '\033')[?2004l"

  # 2) 多行粘贴：一次单元提交（换行不逐行提交），渲染把换行显示为 ↵。
  out=$( (sleep 0.8; printf '\033[200~f : Int -> Int\nf y =\n  y + 1\033[201~'; sleep 0.5; printf '\n'; sleep 0.4; printf 'f 41\n'; sleep 0.3; printf ':q\n') |
    run_pty "$REPO" "$tmp/pty-paste2" | tr -d '\r')
  check_contains "pty paste: 多行粘贴一次提交" "$out" "42"
  check_contains "pty paste: 换行渲染标记" "$out" "↵"

  # 3) 参数位补全：模块名（仓库上下文里 base 经 workspace 可见）与文件路径。
  out=$( (sleep 0.8; printf ':load Base.May\t'; sleep 0.4; printf '\n'; sleep 0.3; printf ':q\n') |
    run_pty "$REPO" "$tmp/pty-comp-mod" | tr -d '\r')
  check_contains "pty complete: :load 模块名补全" "$out" "已导入模块 Base.Maybe"

  ws=$tmp/ws
  mkdir -p "$ws/lib/Sub"
  printf '[package]\nname = "replgaps"\n\n[dependencies]\nvuna-base = "%s"\n' "$VUNA_BASE" >"$ws/vuna.toml"
  printf 'module Foo (greeting) where\n\ngreeting : String\ngreeting = "hi"\n' >"$ws/lib/Foo.vuna"
  printf 'module Sub.Bar (barVal) where\n\nbarVal : Int\nbarVal = 7\n' >"$ws/lib/Sub/Bar.vuna"
  printf 'answer : Int\nanswer = 42\n' >"$ws/snippet.vuna"

  out=$( (sleep 0.8; printf ':browse F\t'; sleep 0.4; printf '\n'; sleep 0.3; printf ':q\n') |
    run_pty "$ws" "$tmp/pty-comp-browse" | tr -d '\r')
  check_contains "pty complete: :browse 模块补全" "$out" "## Foo"

  out=$( (sleep 0.8; printf ':load Sub\t'; sleep 0.4; printf '\n'; sleep 0.3; printf ':q\n') |
    run_pty "$ws" "$tmp/pty-comp-dep" | tr -d '\r')
  check_contains "pty complete: 模块名含子模块" "$out" "已导入模块 Sub.Bar"

  out=$( (sleep 0.8; printf ':load snip\t'; sleep 0.4; printf '\n'; sleep 0.3; printf ':q\n') |
    run_pty "$ws" "$tmp/pty-comp-file" | tr -d '\r')
  check_contains "pty complete: 文件路径补全" "$out" "已加载 snippet.vuna"

  # 4) ↑ 恢复多行历史单元（渲染 ↵，Enter 后整段重新提交）。
  hist_up=$tmp/pty-hist-up
  printf 'vuna-repl-history 2\nx = 1 + 1\\ny = x + 40\n' >"$hist_up"
  out=$( (sleep 0.8; printf '\033[A'; sleep 0.5; printf '\n'; sleep 0.5; printf 'y\n'; sleep 0.3; printf ':q\n') |
    run_pty "$REPO" "$hist_up" | tr -d '\r')
  check_contains "pty history: 多行单元 ↑ 恢复" "$out" "42"
  check_contains "pty history: 多行恢复渲染标记" "$out" "↵"

  # 5) resize 重绘：空闲时轮询 stty size（不忙等），宽度变化后按新宽度重画当前行。
  cat >"$tmp/resize-wrap.sh" <<'WRAP'
#!/bin/sh
(
  sleep 2
  if stty cols 20 </dev/tty 2>/dev/null; then
    printf 'RESIZEMARK' >/dev/tty
  else
    printf 'RESIZESKIP' >/dev/tty
  fi
  sleep 2
) &
exec "$VUNA" repl
WRAP
  out=$( (sleep 1; printf '0123456789abcdefghij'; sleep 2.3; printf '\003'; sleep 0.4; printf ':q\n') |
    VUNA="$VUNA" NO_COLOR=1 VUNA_REPL_HISTORY="$tmp/pty-resize" \
      script -qec "sh $tmp/resize-wrap.sh" /dev/null 2>&1 | tr -d '\r')
  case "$out" in
    *RESIZESKIP*)
      skip "pty resize: /dev/tty 不可用"
      ;;
    *RESIZEMARK*)
      tail_after=${out#*RESIZEMARK}
      # 20 列 - 提示符 6 列 = 14 列窗口：20 字符的行只显示尾部 14 字符。
      check_contains "pty resize: 按新宽度重绘尾部窗口" "$tail_after" "6789abcdefghij"
      check_absent "pty resize: 重绘后不再输出整行" "$tail_after" "0123456789abcdefghij"
      ;;
    *)
      skip "pty resize: 未观察到 resize 标记"
      ;;
  esac

  # 6) 空闲 CPU：0.1s 轮询不能变成忙等（/proc 不可用时 SKIP）。
  cat >"$tmp/cpu-wrap.sh" <<'WRAP'
#!/bin/sh
if [ -r "/proc/$$/stat" ]; then
  (
    sleep 1
    a=$(set -- $(cat "/proc/$$/stat"); echo "$(( ${14} + ${15} ))")
    sleep 3
    b=$(set -- $(cat "/proc/$$/stat"); echo "$(( ${14} + ${15} ))")
    printf 'CPUTICKS:%s:%s' "$a" "$b" >"$CPULOG"
  ) &
fi
exec "$VUNA" repl
WRAP
  cpulog=$tmp/cpu.log
  (sleep 1; sleep 4; printf ':q\n') |
    VUNA="$VUNA" CPULOG="$cpulog" NO_COLOR=1 VUNA_REPL_HISTORY="$tmp/pty-cpu" \
      script -qec "sh $tmp/cpu-wrap.sh" /dev/null >/dev/null 2>&1
  if [ -r "$cpulog" ]; then
    ticks=$(sed -n 's/^CPUTICKS:\([0-9]*\):\([0-9]*\)$/\1 \2/p' "$cpulog")
    if [ -n "$ticks" ]; then
      set -- $ticks
      used=$(( $2 - $1 ))
      # 3 秒空闲 < 0.3s CPU（100 tick/s 口径下 30 tick）；远超它即忙等。
      if [ "$used" -le 30 ]; then ok; else bad "pty cpu: 空闲 CPU 过高 (${used} ticks / 3s)"; fi
    else
      skip "pty cpu: 未拿到 CPU 采样"
    fi
  else
    skip "pty cpu: /proc 不可用"
  fi
fi

printf 'repl-v2-gaps: %d passed, %d failed, %d skipped\n' "$pass" "$fail" "$skips"
[ "$fail" -eq 0 ] && echo "repl-v2-gaps passed"
[ "$fail" -eq 0 ]