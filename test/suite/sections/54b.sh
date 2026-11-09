#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

# 54b) W2：REPL v2 缺口回归（多行历史 / 括号粘贴 / resize 重绘 / 参数位补全 / 纯断言）。
#      脚本自包含（`vuna test test/corpus/repl` + 管道历史断言 + pty 断言），
#      `script` / `/dev/pts` 不可用时 pty 段自降级 SKIP 且 exit 0。
sh corpus/repl/repl_v2_gaps.sh "$VUNA" >/dev/null 2>&1
check_eq "repl v2 gaps smoke" "0" "$?"

finish
