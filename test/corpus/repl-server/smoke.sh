#!/bin/sh
# REPL server / client 冒烟（JSON-RPC over Content-Length，Unix socket 为主）。
#
# 用法：sh test/corpus/repl-server/smoke.sh <path-to-vuna>
#
# 覆盖：
#   - `--listen` 就绪行 / 退出时清理 unix socket；stdout 只用于就绪行，协议走 socket；
#   - `eval` 一次多行、`close` 续行语义、求值/解析错误进 `result.error`；
#   - **跨进程会话状态保留**：两个独立的 `--client` 进程之间定义仍然有效；
#   - `:type` / `:load` / `:reload` / `:defs`；
#   - server 模式拒绝 `:!` 与效果表达式（阶段 1 限制）；
#   - JSON-RPC 错误码：未知方法 -32601、坏 JSON -32700（且连接与服务继续）；
#   - `shutdown` 正常退出；`--client` 连不上 / 地址非法时退出码 2；
#   - TCP loopback（`tcp:127.0.0.1:0` 临时端口）——沙箱里不可用时打印 SKIP。
set -u

[ "$#" -ge 1 ] || {
  echo "用法: sh test/corpus/repl-server/smoke.sh <path-to-vuna>" >&2
  exit 2
}
VUNA=$1
[ -x "$VUNA" ] || {
  echo "smoke: 找不到可执行的 vuna: $VUNA" >&2
  exit 2
}

# 工作目录必须**短**：Unix domain socket 的 `sun_path` 上限是 108 字节（含结尾 NUL），
# 而这里要在它下面放 `repl.sock`。suite 的 steps 用例把 `TMPDIR` 指到
# `$TMPDIR/vuna-suite-<stamp>-suite/c-<hash>`（本身就 55+ 字符），若再拼
# `vuna-repl-server.XXXXXX/repl.sock` 就会超过上限 ⇒ `bind` 失败、server 不打印就绪行、
# `wait_log` 空转到 10s 超时（症状：用例"随机"失败且耗时恒为 ~11s）。
# 所以优先用短目录，过长就退到 `/tmp` 下的短前缀目录（socket 的隔离要求比源码副本低）。
make_short_tmp() { # base1 base2 ... -> 打印目录
  for base in "$@"; do
    [ -n "$base" ] || continue
    d=$(mktemp -d "$base/vrs.XXXXXX" 2>/dev/null) || continue
    # 余量：`/repl.sock`（10）+ `/nonexistent.sock`（17）都要塞得下。
    if [ ${#d} -le 88 ]; then
      printf '%s' "$d"
      return 0
    fi
    rm -rf "$d"
  done
  return 1
}

tmp=$(make_short_tmp "${TMPDIR:-/tmp}" /tmp) || exit 1

pass=0
fail=0
ok() { pass=$((pass + 1)); }
bad() {
  fail=$((fail + 1))
  printf 'FAIL: %s\n' "$1"
}
check_contains() { # name haystack needle
  case "$2" in
    *"$3"*) ok ;;
    *)
      bad "$1"
      printf '  want substring: %s\n  actual: %s\n' "$3" "$2"
      ;;
  esac
}
check_not_contains() { # name haystack needle
  case "$2" in
    *"$3"*)
      bad "$1"
      printf '  unexpected substring: %s\n' "$3"
      ;;
    *) ok ;;
  esac
}
check_eq() { # name expected actual
  if [ "$2" = "$3" ]; then
    ok
  else
    bad "$1"
    printf '  expected: %s\n  actual:   %s\n' "$2" "$3"
  fi
}

sock=$tmp/repl.sock
srv=
cleanup() {
  [ -n "$srv" ] && kill "$srv" 2>/dev/null
  rm -rf "$tmp"
}
trap cleanup EXIT INT TERM

wait_log() { # file needle
  i=0
  while ! grep -q "$2" "$1" 2>/dev/null; do
    i=$((i + 1))
    [ "$i" -gt 100 ] && return 1
    sleep 0.1
  done
  return 0
}

req() { # body -> stdout 的响应 body
  printf '%s' "$1" | "$VUNA" repl --client "unix:$sock"
}

# 夹具：`:load` 用的入口式源码（无 module 头）。
cat >"$tmp/loaded.vuna" <<'VEOF'
answer : Int
answer = 42
VEOF

# ---- 0) 启动 server（Unix socket），就绪行不混协议 ----
"$VUNA" repl --listen "unix:$sock" >"$tmp/srv.log" 2>"$tmp/srv.err" &
srv=$!
if wait_log "$tmp/srv.log" '^listening unix:'; then ok; else bad "--listen 就绪行"; fi
check_contains "就绪行给出 unix 地址" "$(cat "$tmp/srv.log")" "listening unix:$sock"
check_not_contains "stdout 不含协议帧" "$(cat "$tmp/srv.log")" "Content-Length"

# ---- 1) ping / eval / 类型错误 ----
ping_out=$(req '{"jsonrpc":"2.0","id":1,"method":"ping","params":{}}')
check_contains "ping 回 status ok" "$ping_out" '"status":"ok"'
check_contains "ping 带版本" "$ping_out" 'vuna 0.1.0'

eval_out=$(req '{"jsonrpc":"2.0","id":2,"method":"eval","params":{"code":"1 + 1"}}')
check_contains "eval 1+1 = 2" "$eval_out" '"output":"2\n"'
check_contains "eval ok=true" "$eval_out" '"ok":true'

def_out=$(req '{"jsonrpc":"2.0","id":3,"method":"eval","params":{"code":"x = 1 + 1"}}')
check_contains "定义无输出且成功" "$def_out" '"output":"","error":""'
# 关键：这是**另一个**客户端进程；会话状态必须保留。
use_out=$(req '{"jsonrpc":"2.0","id":4,"method":"eval","params":{"code":"x + 40"}}')
check_contains "跨客户端会话状态保留（x + 40）" "$use_out" '"output":"42\n"'

err_out=$(req '{"jsonrpc":"2.0","id":5,"method":"eval","params":{"code":"1 + \"a\""}}')
check_contains "类型错误 ok=false" "$err_out" '"ok":false'
check_contains "类型错误进 error 通道" "$err_out" '错误'
check_contains "错误后会话仍可用（类型错误回 id 5）" "$err_out" '"id":5'

# ---- 2) :type / 多行定义 / close 续行 ----
ty_out=$(req '{"jsonrpc":"2.0","id":6,"method":"eval","params":{"code":":type 1 + 1"}}')
check_contains ":type 输出" "$ty_out" '1 + 1 : Int'

multi_out=$(req '{"jsonrpc":"2.0","id":7,"method":"eval","params":{"code":"g : Int -> Int\ng y =\n  y + 1"}}')
check_contains "多行定义 + close=true 成功" "$multi_out" '"ok":true'
g_out=$(req '{"jsonrpc":"2.0","id":8,"method":"eval","params":{"code":"g 41"}}')
check_contains "多行定义可用（g 41）" "$g_out" '"output":"42\n"'

inc_out=$(req '{"jsonrpc":"2.0","id":9,"method":"eval","params":{"code":"f : Int -> Int\nf y =","close":false}}')
check_contains "未闭合输入 status=incomplete" "$inc_out" '"status":"incomplete"'
cont_out=$(req '{"jsonrpc":"2.0","id":10,"method":"eval","params":{"code":"  y + 1","close":true}}')
check_contains "续行收尾成功" "$cont_out" '"status":"ok"'
f_out=$(req '{"jsonrpc":"2.0","id":11,"method":"eval","params":{"code":"f 41"}}')
check_contains "续行定义可用（f 41）" "$f_out" '"output":"42\n"'

# ---- 3) :load / :reload / :defs ----
load_out=$(req '{"jsonrpc":"2.0","id":12,"method":"eval","params":{"code":":load '"$tmp"'/loaded.vuna"}}')
check_contains ":load 已加载" "$load_out" '已加载'
ans_out=$(req '{"jsonrpc":"2.0","id":13,"method":"eval","params":{"code":"answer"}}')
check_contains ":load 后定义可用" "$ans_out" '"output":"42\n"'
reload_out=$(req '{"jsonrpc":"2.0","id":14,"method":"eval","params":{"code":":reload"}}')
check_contains ":reload" "$reload_out" '已重新加载'
defs_out=$(req '{"jsonrpc":"2.0","id":15,"method":"eval","params":{"code":":defs"}}')
check_contains ":defs 列出 answer" "$defs_out" 'answer'

# ---- 4) 阶段 1 限制：`:!` 与效果表达式拒绝执行 ----
batch_out=$(req '{"jsonrpc":"2.0","id":16,"method":"eval","params":{"code":":! echo hi"}}')
check_contains "server 模式拒绝 :!" "$batch_out" '"ok":false'
check_contains ":! 提示指向外部 shell" "$batch_out" '外部 shell'
io_out=$(req '{"jsonrpc":"2.0","id":17,"method":"eval","params":{"code":"import Base.Host\nprint \"hi\""}}')
check_contains "server 模式拒绝效果表达式" "$io_out" '"ok":false'
check_contains "效果表达式提示指向 vuna run" "$io_out" 'vuna run'

# ---- 5) JSON-RPC 错误码：未知方法 / 坏 JSON 都不能杀死会话 ----
unk_out=$(req '{"jsonrpc":"2.0","id":18,"method":"nope","params":{}}')
check_contains "未知方法 -32601" "$unk_out" '"code":-32601'
bad_json_out=$(printf 'not json' | "$VUNA" repl --client "unix:$sock" 2>/dev/null)
check_contains "坏 JSON -32700" "$bad_json_out" '"code":-32700'
alive_out=$(req '{"jsonrpc":"2.0","id":19,"method":"ping","params":{}}')
check_contains "坏帧后服务仍存活" "$alive_out" '"status":"ok"'

# ---- 6) 非法地址 / 连不上的客户端 ----
"$VUNA" repl --listen "tcp:0.0.0.0:1" >"$tmp/badaddr.out" 2>"$tmp/badaddr.err"
check_eq "非法 --listen 地址退出码 2" "2" "$?"
check_contains "非法 --listen 地址给出原因" "$(cat "$tmp/badaddr.out" "$tmp/badaddr.err" 2>/dev/null)" "只允许本机"
printf '%s' '{"jsonrpc":"2.0","id":1,"method":"ping"}' |
  "$VUNA" repl --client "unix:$tmp/nonexistent.sock" >/dev/null 2>"$tmp/noserver.err"
check_eq "连不上的 --client 退出码 2" "2" "$?"
check_contains "连不上的 --client 有 stderr 诊断" "$(cat "$tmp/noserver.err")" "net: connect"

# ---- 7) TCP 临时端口（沙箱不可用则 SKIP）----
"$VUNA" repl --listen "tcp:127.0.0.1:0" >"$tmp/tcp.log" 2>"$tmp/tcp.err" &
tcp_srv=$!
if wait_log "$tmp/tcp.log" '^listening tcp:127.0.0.1:'; then
  tcp_addr=$(sed -n 's/^listening //p' "$tmp/tcp.log" | head -1)
  tcp_ping=$(printf '%s' '{"jsonrpc":"2.0","id":1,"method":"ping"}' | "$VUNA" repl --client "$tcp_addr" 2>&1)
  check_contains "TCP 客户端 ping" "$tcp_ping" '"status":"ok"'
  printf '%s' '{"jsonrpc":"2.0","id":2,"method":"shutdown"}' | "$VUNA" repl --client "$tcp_addr" >/dev/null 2>&1
  wait "$tcp_srv" 2>/dev/null
  check_eq "TCP server shutdown 退出码 0" "0" "$?"
else
  kill "$tcp_srv" 2>/dev/null
  printf 'SKIP: tcp loopback 在沙箱内不可用（Unix socket 用例已覆盖协议面）\n' >&2
fi

# ---- 8) shutdown：回响应后 exit 0，unix socket 被清理 ----
shut_out=$(req '{"jsonrpc":"2.0","id":20,"method":"shutdown","params":{}}')
check_contains "shutdown 回 result" "$shut_out" '"status":"ok"'
wait "$srv" 2>/dev/null
shut_code=$?
srv=
check_eq "shutdown 后 server 退出码 0" "0" "$shut_code"
if [ -e "$sock" ]; then
  bad "shutdown 后清理 unix socket"
else
  ok
fi

printf 'repl-server: %d passed, %d failed\n' "$pass" "$fail"
[ "$fail" -eq 0 ] && echo "repl-server smoke passed"
[ "$fail" -eq 0 ]