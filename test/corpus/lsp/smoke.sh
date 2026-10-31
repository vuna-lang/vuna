#!/bin/sh
# M17：LSP 编辑器冒烟（JSON-RPC over stdio）。
#
# 用法（独立可运行，不依赖环境变量）：
#   sh test/corpus/lsp/smoke.sh <path-to-vuna>
#
# 真的把 LSP 帧从 stdin 喂给 `vuna lsp`，断言 stdout 上的 JSON 帧：
#   1. initialize            → capabilities 含 textDocumentSync（Full 同步）/ hoverProvider
#   2. didOpen（有类型错误） → publishDiagnostics 带 severity=1 诊断，
#                              range 是 0-based（第 2 行第 7 列 → line=1, character=6）
#   3. didChange（改成正确） → 同 uri 的 diagnostics 变成空数组
#   4. hover（未解洞 `_`）   → 返回目标类型 Type
#   5. shutdown              → result 为 null
#   6. exit                  → 进程退出码 0
#
# 另外校验分流层：stdout 只含协议帧（没有日志混入），且每帧正文长度与
# Content-Length 完全一致。
#
# 只依赖 POSIX sh / awk / sed 与传入的 vuna 可执行文件。
set -u

if [ "$#" -lt 1 ]; then
  echo "usage: sh test/corpus/lsp/smoke.sh <path-to-vuna>" >&2
  exit 2
fi

VUNA=$1
# 裸命令名（如 `vuna`）先按 PATH 解析，否则会被下面的 dirname 当成相对路径。
case "$VUNA" in
  */*) ;;
  *) VUNA=$(command -v "$VUNA" 2>/dev/null || echo "$VUNA") ;;
esac
# 相对路径按「调用者当前目录」解析成绝对路径，再切到仓库根
# （本段由 Lead 提供：保证从仓库根和 test/ 两个目录都能跑）。
case "$VUNA" in
  /*) ;;
  *) VUNA=$(cd "$(dirname "$VUNA")" && pwd)/$(basename "$VUNA") ;;
esac
cd "$(dirname "$0")/../../.." || exit 1
[ -x "$VUNA" ] || { echo "smoke: 找不到可执行的 vuna: $VUNA" >&2; exit 2; }

tmp=$(mktemp -d "${TMPDIR:-/tmp}/vuna-lsp.XXXXXX") || exit 1
trap 'rm -rf "$tmp"' EXIT INT TERM

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
      printf '  want substring: %s\n' "$3"
      printf '  in frame:       %s\n' "$2"
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

# 构造帧流：每行一个紧凑 JSON。length($0) 在 LC_ALL=C 下按字节计，与协议一致。
cat >"$tmp/in.jsonl" <<'JSONL'
{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"processId":null,"rootUri":null,"capabilities":{}}}
{"jsonrpc":"2.0","method":"initialized","params":{}}
{"jsonrpc":"2.0","method":"textDocument/didOpen","params":{"textDocument":{"uri":"file:///lsp-smoke.vuna","languageId":"vuna","version":1,"text":"bad : Int\nbad = \"oops\"\n"}}}
{"jsonrpc":"2.0","method":"textDocument/didChange","params":{"textDocument":{"uri":"file:///lsp-smoke.vuna","version":2},"contentChanges":[{"text":"good : Int\ngood = 1\n"}]}}
{"jsonrpc":"2.0","method":"textDocument/didOpen","params":{"textDocument":{"uri":"file:///lsp-hole.vuna","languageId":"vuna","version":1,"text":"id : (a : Type) -> a -> a\nid a x = x\n\nmain : Int\nmain = id _ 7\n"}}}
{"jsonrpc":"2.0","id":2,"method":"textDocument/hover","params":{"textDocument":{"uri":"file:///lsp-hole.vuna"},"position":{"line":4,"character":10}}}
{"jsonrpc":"2.0","id":3,"method":"shutdown","params":null}
{"jsonrpc":"2.0","method":"exit","params":null}
JSONL

LC_ALL=C awk '{ printf "Content-Length: %d\r\n\r\n%s", length($0), $0 }' "$tmp/in.jsonl" >"$tmp/frames.bin"

if ! "$VUNA" lsp <"$tmp/frames.bin" >"$tmp/out.bin" 2>"$tmp/err.txt"; then
  echo "smoke: \`vuna lsp\` 退出码非 0" >&2
  echo "--- stderr:" >&2
  cat "$tmp/err.txt" >&2
  exit 1
fi

tr -d '\r' <"$tmp/out.bin" >"$tmp/out.txt"
out=$(cat "$tmp/out.txt")

# ---- 0) stdout 只能有协议帧 ----
check_not_contains "stdout 无日志混入" "$out" "[vuna-lsp]"
check_not_contains "stdout 无残留 CR" "$out" "$(printf '\r')"

# 帧与帧之间没有换行（协议就是紧挨着写的）。为了逐帧检查，在每个
# `Content-Length:` 前插一个换行，得到「header / 空行 / 正文」三行一帧。
sed 's/Content-Length: /\nContent-Length: /g' "$tmp/out.txt" | sed '1{/^$/d;}' >"$tmp/frames.txt"

frames=$(grep -c '^Content-Length: ' "$tmp/frames.txt" 2>/dev/null || echo 0)
# 服务端实际发出的帧：initialize 响应 + didOpen 诊断 + didChange 诊断 +
# 第二个 didOpen 诊断（lsp-hole.vuna）+ hover 响应 + shutdown 响应 = 6。
# `initialized` 是通知，不产生帧；exit 之后进程立即退出，也不再产生帧。
check_eq "帧数（initialize + 3 条诊断 + hover + shutdown）" "6" "$frames"

# 每帧正文长度必须与 Content-Length 一致，且 header 与正文之间必须是空行。
if LC_ALL=C awk '
  NR % 3 == 1 {
    if ($1 != "Content-Length:") { printf "BAD header line %d: %s\n", NR, $0; bad = 1 }
    want = $2 + 0
  }
  NR % 3 == 2 { if ($0 != "") { printf "BAD blank line %d: [%s]\n", NR, $0; bad = 1 } }
  NR % 3 == 0 {
    if (length($0) != want) { printf "BAD frame: body=%d header=%d\n", length($0), want; bad = 1 }
    n++
  }
  END { if (n == 0) { print "NOFRAME"; exit 1 } if (bad) exit 1 }
' "$tmp/frames.txt" >"$tmp/frames.check" 2>&1
then
  ok
else
  bad "每帧正文长度 == Content-Length"
  cat "$tmp/frames.check"
fi

# frame_at N：取第 N 帧的正文（1-based）。
frame_at() { sed -n "$((($1 - 1) * 3 + 3))p" "$tmp/frames.txt"; }

# ---- 1) initialize ----
init=$(frame_at 1)
check_contains "initialize 回 id 1" "$init" '"id":1'
check_contains "initialize 声明 textDocumentSync" "$init" '"textDocumentSync"'
check_contains "initialize 声明 Full 同步（change=1）" "$init" '"change":1'
check_contains "initialize 声明 openClose" "$init" '"openClose":true'
check_contains "initialize 声明 hoverProvider" "$init" '"hoverProvider":true'

# ---- 2) didOpen 推出类型错误诊断（0-based 范围）----
diag_open=$(grep -F '"uri":"file:///lsp-smoke.vuna","version":1' "$tmp/frames.txt")
check_contains "didOpen 推 publishDiagnostics" "$diag_open" '"method":"textDocument/publishDiagnostics"'
check_contains "诊断 severity=1（Error）" "$diag_open" '"severity":1'
check_contains "诊断消息含 type mismatch" "$diag_open" 'type mismatch'
check_contains "诊断 range 行 0-based（line=1）" "$diag_open" '"line":1'
check_contains "诊断 range 列 0-based（character=6）" "$diag_open" '"character":6'
check_not_contains "诊断没有 1-based 行号 2" "$diag_open" '"line":2'

# ---- 3) didChange 清空诊断 ----
diag_change=$(grep -F '"uri":"file:///lsp-smoke.vuna","version":2' "$tmp/frames.txt")
check_contains "didChange 推 version=2" "$diag_change" '"version":2'
check_contains "didChange 清空诊断" "$diag_change" '"diagnostics":[]'

# ---- 4) hover 命中未解洞（第 5 帧）----
# 洞的 span 是 1-based 的 `main = id _ 7` 第 11 列，LSP 请求用 0-based (line 4,
# character 10)；落点必须正好在洞上，否则服务端返回 result:null。
hover=$(frame_at 5)
check_contains "hover 返回 contents" "$hover" '"contents"'
check_contains "hover 给出目标类型 Type" "$hover" 'Type'
check_contains "hover 标出洞的范围" "$hover" '"range"'

# ---- 5) shutdown（第 6 帧）----
shutdown_frame=$(frame_at 6)
check_contains "shutdown 返回 result:null" "$shutdown_frame" '"result":null'

# ---- 6) 最后一帧是 shutdown 响应（exit 不产生输出）----
check_contains "最后一帧是 shutdown 响应" "$(frame_at 6)" '"id":3'

# ---- 7) 帧分隔符兼容：只用 LF（`\n\n`）的 header 也必须能解析 ----
# 规范写的是 `\r\n`，但部分客户端/手写测试用纯 `\n`。回归点：空行在行式读入
# 下与 EOF 长得一样，容易被误判成输入结束。
{
  printf 'Content-Length: 75\n\n{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"capabilities":{}}}'
  printf 'Content-Length: 44\r\n\r\n{"jsonrpc":"2.0","id":2,"method":"shutdown"}'
  printf 'Content-Length: 47\r\n\r\n{"jsonrpc":"2.0","method":"exit","params":null}'
} >"$tmp/lf.bin"
lf_out=$("$VUNA" lsp <"$tmp/lf.bin" 2>/dev/null | tr -d '\r')
check_contains "LF-only header 能解析出 initialize" "$lf_out" '"id":1'
check_contains "LF-only 之后能继续读 CRLF 帧" "$lf_out" '"id":2'

# ---- 8) 退出码 ----
# LSP 约定：收到 shutdown 再 exit 退 0；EOF/未 shutdown 就退出算异常，退 1。
# 回归点：EOF 路径曾把 flushLogs 的「写入字节数」当退出码。
{
  printf 'Content-Length: 44\r\n\r\n{"jsonrpc":"2.0","id":1,"method":"shutdown"}'
  printf 'Content-Length: 47\r\n\r\n{"jsonrpc":"2.0","method":"exit","params":null}'
} >"$tmp/ok.bin"
"$VUNA" lsp <"$tmp/ok.bin" >/dev/null 2>&1
check_eq "shutdown→exit 退出码 0" "0" "$?"

"$VUNA" lsp </dev/null >/dev/null 2>&1
check_eq "空 stdin 退出码 1" "1" "$?"

printf 'Content-Length: 44\r\n\r\n{"jsonrpc":"2.0","id":1,"method":"shutdown"}' >"$tmp/eof.bin"
"$VUNA" lsp <"$tmp/eof.bin" >/dev/null 2>&1
check_eq "收到 shutdown 但无 exit（EOF）退出码 1" "1" "$?"

printf 'lsp: %d passed, %d failed\n' "$pass" "$fail"
[ "$fail" -eq 0 ] && echo "lsp smoke passed"
[ "$fail" -eq 0 ]
