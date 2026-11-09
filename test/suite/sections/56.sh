#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

# 56) M35.3 REPL server / client：JSON-RPC over Content-Length（Unix socket 为主；TCP 临时端口
#     沙箱不可用时 smoke 打印 SKIP）。覆盖跨进程会话状态、错误码、阶段 1 限制、shutdown 清理。
sh corpus/repl-server/smoke.sh "$VUNA" >/dev/null 2>&1
check_eq "repl server smoke" "0" "$?"


finish
