#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

# 55) M35.3 net 原语：Unix domain socket echo / TCP 临时端口 / stale socket 重绑 / 错误路径。
#     说明：TCP loopback 在部分 Nix 沙箱不可用（用 unix socket 覆盖协议面），此时打印 SKIP。
net_pkg=corpus/net/01_echo
rm -rf "$net_pkg/.output"
if "$VUNA" build "$net_pkg" >/dev/null 2>&1; then ok; else bad "net fixture build" "exit 0" "build failed"; fi
net_bin=$net_pkg/.output/bin/net-echo
net_sock=$tmp/net-echo.sock
rm -f "$net_sock"
: >"$tmp/net-serve.log"
run_bin "$net_bin" serve "unix:$net_sock" >"$tmp/net-serve.log" 2>&1 &
net_srv=$!
net_i=0
while ! grep -q '^ready' "$tmp/net-serve.log" 2>/dev/null && [ "$net_i" -lt 100 ]; do
  net_i=$((net_i + 1))
  sleep 0.1
done
net_out=$(run_bin "$net_bin" client "unix:$net_sock" 2>&1)
check_contains "net unix echo" "$net_out" "echo:ping"
wait "$net_srv"
check_eq "net unix server exit" "0" "$?"

: >"$tmp/net-tcp.log"
run_bin "$net_bin" serve-tcp >"$tmp/net-tcp.log" 2>&1 &
net_tcp_srv=$!
net_i=0
while ! grep -q '^port:' "$tmp/net-tcp.log" 2>/dev/null && [ "$net_i" -lt 100 ]; do
  net_i=$((net_i + 1))
  sleep 0.1
done
net_port=$(sed -n 's/^port://p' "$tmp/net-tcp.log" | head -1)
if [ -z "$net_port" ]; then
  kill "$net_tcp_srv" 2>/dev/null
  printf 'SKIP: net tcp loopback unavailable in this sandbox\n' >&2
else
  net_out=$(run_bin "$net_bin" client "tcp:127.0.0.1:$net_port" 2>&1)
  check_contains "net tcp echo" "$net_out" "echo:ping"
  wait "$net_tcp_srv"
  check_eq "net tcp server exit" "0" "$?"
fi

# stale socket：上一个 server 退出后路径仍在 → listen 前 unlink 并重绑。
: >"$tmp/net-stale.log"
run_bin "$net_bin" serve "unix:$net_sock" >"$tmp/net-stale.log" 2>&1 &
net_srv2=$!
net_i=0
while ! grep -q '^ready' "$tmp/net-stale.log" 2>/dev/null && [ "$net_i" -lt 100 ]; do
  net_i=$((net_i + 1))
  sleep 0.1
done
net_out=$(run_bin "$net_bin" client "unix:$net_sock" 2>&1)
check_contains "net stale socket rebind" "$net_out" "echo:ping"
wait "$net_srv2"
check_eq "net stale server exit" "0" "$?"

run_bin "$net_bin" client "bogus:" >"$tmp/net-bad.log" 2>&1
check_eq "net invalid address exit" "2" "$?"
check_contains "net invalid address message" "$(cat "$tmp/net-bad.log")" "net: invalid address"
rm -rf "$net_pkg/.output"


finish
