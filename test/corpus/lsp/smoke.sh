#!/bin/sh
# M30 P2：LSP 全功能冒烟（JSON-RPC over stdio）。
#
# 用法（独立可运行，不依赖环境变量）：
#   sh test/corpus/lsp/smoke.sh <path-to-vuna>
#
# 真的把 LSP 帧从 stdin 喂给 `vuna lsp`，断言 stdout 上的 JSON 帧：
#
# A. 协议/生命周期（M17 起保留的全部断言）
#   1. initialize            → capabilities 全套（textDocumentSync Full / hover /
#                              completion(trigger ".") / definition / references /
#                              documentSymbol / formatting / workspaceSymbol /
#                              codeAction(codeActionKinds=["quickfix"])）
#   2. didOpen（有类型错误） → publishDiagnostics severity=1，range 0-based
#   3. didChange（改成正确） → 同 uri 的 diagnostics 变成空数组
#   4. hover（未解洞 `_`）   → 返回目标类型 Type
#   5. shutdown → result null；exit → 进程退出码 0
#   6. stdout 只含协议帧（无日志混入、无残留 CR），每帧正文长度与 Content-Length 一致
#
# B. M30 新增功能（临时两模块包 + 入口文本）
#   7. 含 import 的模块类型错误**不再跳过**：Main 里 depHelper "oops" 报出来
#   8. lint 诊断合并：if/else-if 字面量链 → LN_LiteralIfChain（severity 2）
#   9. textDocument/formatting → 全文 TextEdit（newText 里 `x : Int`）
#  10. textDocument/documentSymbol → AST 声明树（data/record/trait 子节点）
#  11. textDocument/definition → 跳到 Dep.vuna 的 depHelper
#  12. textDocument/references → 定义位置 + Main 里的引用位置
#  13. textDocument/completion → 索引符号 depHelper
#  14. workspace/symbol → depHelper 的 SymbolInformation
#  15. %XX URI 解码（带空格的路径）不崩溃且诊断归位（空诊断）
#  16. 非 file URI（untitled:）不崩溃
#  17. 未知方法返回 JSON-RPC method not found（-32601）
#
# C. 传输/查询回归（交互式客户端；帧一次性批式喂入是抓不到的）
#  18. 交互式帧读取：body 后没有换行时 initialize 也必须立刻有响应
#      （回归点：读取层曾按行读 body → initialize 互等死锁）
#  19. 符号 hover：返回签名，且 range 落在**光标 token**（不是符号定义位置）
#
# D. M38 P1c：lint quick fix（textDocument/codeAction）
#  20. docstring hover（只显示 `-- |`，普通注释不显示，多行保留）
#  21. 触发 LN_LiteralIfChain 的文本 + 光标 range → CodeAction：kind=quickfix、
#      title 带规则短名、diagnostics.code 关联、0-based 整行替换 range、newText 是
#      case 形式、全文档 "fix all lint findings"；context.only 不含 quickfix 或
#      range 与可修复 finding 不相交时回空数组。
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
repo=$PWD
[ -x "$VUNA" ] || { echo "smoke: 找不到可执行的 vuna: $VUNA" >&2; exit 2; }

# 无 manifest 的临时夹具需要 base 定位；显式给仓库 base（不依赖 exe 相对布局）。
: "${VUNA_BASE:=$repo/base}"
export VUNA_BASE

# 临时包必须落在**任何 vuna.toml 之外**：否则向上找 manifest 会命中仓库根包，
# 夹具的包上下文就悄悄变了。优先 TMPDIR，其次 /tmp。
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
  echo "smoke: 找不到包外的临时目录（TMPDIR 在 workspace 内）" >&2
  exit 2
fi

tmp=$(mktemp -d "$tmpbase/vuna-lsp.XXXXXX") || exit 1
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

# ---------------------------------------------------------------
# 夹具：两模块包（vuna.toml 新格式：无 version/edition）
#   lib/Dep.vuna    —— data/record/trait + depHelper 定义
#   lib/Main.vuna   —— import Dep，使用 depHelper
#   lib/Main2.vuna  —— 只写了一半的引用（completion 用）
#   lib/Linty.vuna  —— 触发 LN_LiteralIfChain
#   lib/sp ace.vuna —— %XX URI 解码
# ---------------------------------------------------------------
pkg="$tmp/fixture"
mkdir -p "$pkg/lib"

cat >"$pkg/vuna.toml" <<TOML
[package]
name = "lsp-fixture"

[dependencies]
vuna-base = "$repo/base"
TOML

cat >"$pkg/lib/Dep.vuna" <<'VUNA'
module Dep where

depHelper : Int -> Int
depHelper n = n

data Box a : Type where
  Box : a -> Box a

record Point where
  px : Int
  py : Int

trait Shape a where
  area : a -> Int
VUNA

cat >"$pkg/lib/Main.vuna" <<'VUNA'
module Main where

import Dep

useDep : Int
useDep = depHelper 41
VUNA

cat >"$pkg/lib/Main2.vuna" <<'VUNA'
module Main2 where

import Dep

other : Int
other = depHe
VUNA

cat >"$pkg/lib/Linty.vuna" <<'VUNA'
module Linty where

nameArity : String -> Int
nameArity name =
  if name == "+" then 2
  else if name == "-" then 2
  else 0
VUNA

cat >"$pkg/lib/sp ace.vuna" <<'VUNA'
module Spaced where

value : Int
value = 1
VUNA

dep_uri="file://$pkg/lib/Dep.vuna"
main_uri="file://$pkg/lib/Main.vuna"
main2_uri="file://$pkg/lib/Main2.vuna"
linty_uri="file://$pkg/lib/Linty.vuna"
spaced_uri="file://$pkg/lib/sp%20ace.vuna"
fmt_uri="file://$tmp/fmt.vuna"
hole_uri="file://$tmp/hole.vuna"

# JSON 文本里的换行必须是**转义序列**（\n 两个字符），不能是真换行。
main_bad='module Main where\n\nimport Dep\n\nuseDep : Int\nuseDep = depHelper \"oops\"\n'
main_good='module Main where\n\nimport Dep\n\nuseDep : Int\nuseDep = depHelper 41\n'

# 构造帧流：每行一个紧凑 JSON。length($0) 在 LC_ALL=C 下按字节计，与协议一致。
cat >"$tmp/in.jsonl" <<JSONL
{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"processId":null,"rootUri":null,"capabilities":{}}}
{"jsonrpc":"2.0","method":"initialized","params":{}}
{"jsonrpc":"2.0","method":"textDocument/didOpen","params":{"textDocument":{"uri":"$main_uri","languageId":"vuna","version":1,"text":"$main_bad"}}}
{"jsonrpc":"2.0","method":"textDocument/didChange","params":{"textDocument":{"uri":"$main_uri","version":2},"contentChanges":[{"text":"$main_good"}]}}
{"jsonrpc":"2.0","method":"textDocument/didOpen","params":{"textDocument":{"uri":"$linty_uri","languageId":"vuna","version":1,"text":"module Linty where\n\nnameArity : String -> Int\nnameArity name =\n  if name == \"+\" then 2\n  else if name == \"-\" then 2\n  else 0\n"}}}
{"jsonrpc":"2.0","method":"textDocument/didOpen","params":{"textDocument":{"uri":"$fmt_uri","languageId":"vuna","version":1,"text":"x:Int\nx = 1\n"}}}
{"jsonrpc":"2.0","method":"textDocument/didOpen","params":{"textDocument":{"uri":"$dep_uri","languageId":"vuna","version":1,"text":"module Dep where\n\ndepHelper : Int -> Int\ndepHelper n = n\n\ndata Box a : Type where\n  Box : a -> Box a\n\nrecord Point where\n  px : Int\n  py : Int\n\ntrait Shape a where\n  area : a -> Int\n"}}}
{"jsonrpc":"2.0","method":"textDocument/didOpen","params":{"textDocument":{"uri":"$spaced_uri","languageId":"vuna","version":1,"text":"module Spaced where\n\nvalue : Int\nvalue = 1\n"}}}
{"jsonrpc":"2.0","method":"textDocument/didOpen","params":{"textDocument":{"uri":"$hole_uri","languageId":"vuna","version":1,"text":"id : (a : Type) -> a -> a\nid a x = x\n\nmain : Int\nmain = id _ 7\n"}}}
{"jsonrpc":"2.0","method":"textDocument/didOpen","params":{"textDocument":{"uri":"$main2_uri","languageId":"vuna","version":1,"text":"module Main2 where\n\nimport Dep\n\nother : Int\nother = depHe\n"}}}
{"jsonrpc":"2.0","id":2,"method":"textDocument/hover","params":{"textDocument":{"uri":"$hole_uri"},"position":{"line":4,"character":10}}}
{"jsonrpc":"2.0","id":3,"method":"textDocument/formatting","params":{"textDocument":{"uri":"$fmt_uri"},"options":{"tabSize":2,"insertSpaces":true}}}
{"jsonrpc":"2.0","id":4,"method":"textDocument/documentSymbol","params":{"textDocument":{"uri":"$dep_uri"}}}
{"jsonrpc":"2.0","id":5,"method":"textDocument/definition","params":{"textDocument":{"uri":"$main_uri"},"position":{"line":5,"character":12}}}
{"jsonrpc":"2.0","id":6,"method":"textDocument/references","params":{"textDocument":{"uri":"$dep_uri"},"position":{"line":3,"character":2},"context":{"includeDeclaration":true}}}
{"jsonrpc":"2.0","id":7,"method":"textDocument/completion","params":{"textDocument":{"uri":"$main2_uri"},"position":{"line":5,"character":13}}}
{"jsonrpc":"2.0","id":8,"method":"workspace/symbol","params":{"query":"depHelper"}}
{"jsonrpc":"2.0","id":9,"method":"textDocument/unknownMethod","params":{"textDocument":{"uri":"$main_uri"}}}
{"jsonrpc":"2.0","id":10,"method":"shutdown","params":null}
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
err=$(cat "$tmp/err.txt" 2>/dev/null || true)

# ---- 0) stdout 只能有协议帧 ----
check_not_contains "stdout 无日志混入" "$out" "[vuna-lsp]"
check_not_contains "stdout 无残留 CR" "$out" "$(printf '\r')"
check_contains "stderr 有启动日志" "$err" "[vuna-lsp] starting"

# 帧与帧之间没有换行（协议就是紧挨着写的）。为了逐帧检查，在每个
# `Content-Length:` 前插一个换行，得到「header / 空行 / 正文」三行一帧。
sed 's/Content-Length: /\nContent-Length: /g' "$tmp/out.txt" | sed '1{/^$/d;}' >"$tmp/frames.txt"

frames=$(grep -c '^Content-Length: ' "$tmp/frames.txt" 2>/dev/null || echo 0)
# 服务端实际发出的帧：8 条 publishDiagnostics（didOpen×7 + didChange×1）+
# 10 个响应（initialize/hover/formatting/documentSymbol/definition/references/
# completion/workspace-symbol/未知方法错误/shutdown）= 18。
check_eq "帧数（8 通知 + 10 响应）" "18" "$frames"

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

# ---- 1) initialize：capabilities 全套 ----
init=$(frame_at 1)
check_contains "initialize 回 id 1" "$init" '"id":1'
check_contains "initialize 声明 textDocumentSync" "$init" '"textDocumentSync"'
check_contains "initialize 声明 Full 同步（change=1）" "$init" '"change":1'
check_contains "initialize 声明 openClose" "$init" '"openClose":true'
check_contains "initialize 声明 hoverProvider" "$init" '"hoverProvider":true'
check_contains "initialize 声明 completionProvider" "$init" '"completionProvider"'
check_contains 'completion triggerCharacters = ["."]' "$init" '"triggerCharacters":["."]'
check_contains "initialize 声明 definitionProvider" "$init" '"definitionProvider":true'
check_contains "initialize 声明 referencesProvider" "$init" '"referencesProvider":true'
check_contains "initialize 声明 documentSymbolProvider" "$init" '"documentSymbolProvider":true'
check_contains "initialize 声明 documentFormattingProvider" "$init" '"documentFormattingProvider":true'
check_contains "initialize 声明 workspaceSymbolProvider" "$init" '"workspaceSymbolProvider":true'
check_contains "initialize 声明 codeActionProvider(codeActionKinds=[quickfix])" "$init" '"codeActionProvider":{"codeActionKinds":["quickfix"]}'

# ---- 2) 含 import 的模块类型错误诊断（不再跳过）+ 0-based 范围 ----
diag_open=$(frame_at 2)
check_contains "didOpen(Main) 推 publishDiagnostics" "$diag_open" '"method":"textDocument/publishDiagnostics"'
check_contains "诊断 uri 是当前文件" "$diag_open" "\"uri\":\"$main_uri\""
check_contains "诊断 severity=1（Error）" "$diag_open" '"severity":1'
check_contains "诊断消息含 type mismatch" "$diag_open" 'type mismatch'
check_contains "诊断 range 行 0-based（line=5）" "$diag_open" '"line":5'
check_not_contains "依赖文件（Dep.vuna）不推诊断" "$diag_open" "\"uri\":\"$dep_uri\""

# ---- 3) didChange 清空诊断 ----
diag_change=$(frame_at 3)
check_contains "didChange 推 version=2" "$diag_change" '"version":2'
check_contains "didChange 清空诊断" "$diag_change" '"diagnostics":[]'

# ---- 4) lint 诊断合并（severity 2，code = LN_ 规则码）----
diag_lint=$(frame_at 4)
check_contains "lint 推 publishDiagnostics" "$diag_lint" "\"uri\":\"$linty_uri\""
check_contains "lint 带 LN_LiteralIfChain 规则码" "$diag_lint" 'LN_LiteralIfChain'
check_contains "lint severity=2（Warning）" "$diag_lint" '"severity":2'

# ---- 5) formatting：全文 TextEdit ----
fmt_frame=$(frame_at 11)
check_contains "formatting 回 id 3" "$fmt_frame" '"id":3'
check_contains "formatting 返回 TextEdit（newText）" "$fmt_frame" '"newText"'
check_contains "formatting 输出规范化 x : Int" "$fmt_frame" 'x : Int'

# ---- 6) documentSymbol：AST 声明树（data/record/trait 子节点）----
sym_frame=$(frame_at 12)
check_contains "documentSymbol 回 id 4" "$sym_frame" '"id":4'
check_contains "documentSymbol 含函数 depHelper" "$sym_frame" '"name":"depHelper"'
check_contains "documentSymbol 含构造子 Box" "$sym_frame" '"name":"Box"'
check_contains "documentSymbol 含 record Point" "$sym_frame" '"name":"Point"'
check_contains "documentSymbol 含 trait Shape" "$sym_frame" '"name":"Shape"'
check_contains "documentSymbol 含 record 字段 px" "$sym_frame" '"name":"px"'
check_contains "documentSymbol 含 trait 方法 area" "$sym_frame" '"name":"area"'
check_contains "documentSymbol 有 children 子树" "$sym_frame" '"children"'

# ---- 7) definition：光标 depHelper → Dep.vuna 定义 ----
def_frame=$(frame_at 13)
check_contains "definition 回 id 5" "$def_frame" '"id":5'
check_contains "definition 指向 Dep.vuna" "$def_frame" "\"uri\":\"$dep_uri\""
check_contains "definition 是 Location 数组" "$def_frame" '"result":[{'

# ---- 8) references：定义位置 + Main 里的引用位置 ----
refs_frame=$(frame_at 14)
check_contains "references 回 id 6" "$refs_frame" '"id":6'
check_contains "references 含定义文件 Dep.vuna" "$refs_frame" "\"uri\":\"$dep_uri\""
check_contains "references 含引用文件 Main.vuna" "$refs_frame" "\"uri\":\"$main_uri\""

# ---- 9) completion：索引符号 depHelper ----
comp_frame=$(frame_at 15)
check_contains "completion 回 id 7" "$comp_frame" '"id":7'
check_contains "completion 含 depHelper" "$comp_frame" 'depHelper'
check_contains "completion 是 CompletionItem 数组" "$comp_frame" '"label"'
check_contains "completion 带 kind" "$comp_frame" '"kind"'

# ---- 10) workspace/symbol ----
ws_frame=$(frame_at 16)
check_contains "workspace/symbol 回 id 8" "$ws_frame" '"id":8'
check_contains "workspace/symbol 含 depHelper" "$ws_frame" '"name":"depHelper"'
check_contains "workspace/symbol 带 location" "$ws_frame" '"location"'

# ---- 11) %XX URI 解码：带空格的路径不崩溃，诊断归位（空）----
diag_spaced=$(frame_at 7)
check_contains "spaced uri 推 publishDiagnostics" "$diag_spaced" "\"uri\":\"$spaced_uri\""
check_contains "spaced uri 诊断为空（解码成功）" "$diag_spaced" '"diagnostics":[]'

# ---- 12) hover（第 10 帧）----
hover=$(frame_at 10)
check_contains "hover 回 id 2" "$hover" '"id":2'
check_contains "hover 返回 contents" "$hover" '"contents"'
check_contains "hover 给出目标类型 Type" "$hover" 'Type'
check_contains "hover 标出洞的范围" "$hover" '"range"'

# ---- 13) 未知方法 → method not found ----
unknown=$(frame_at 17)
check_contains "未知方法回 id 9" "$unknown" '"id":9'
check_contains "未知方法有 error 对象" "$unknown" '"error"'
check_contains "未知方法错误码 -32601" "$unknown" '-32601'

# ---- 14) shutdown ----
shutdown_frame=$(frame_at 18)
check_contains "shutdown 返回 result:null" "$shutdown_frame" '"result":null'
check_contains "最后一帧是 shutdown 响应" "$shutdown_frame" '"id":10'

# ---- 15) 帧分隔符兼容：只用 LF（`\n\n`）的 header 也必须能解析 ----
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

# ---- 16) 非 file URI（untitled:）不崩溃：走 cwd 上下文，正常回 shutdown ----
{
  printf '%s\n' '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"capabilities":{}}}'
  printf '%s\n' '{"jsonrpc":"2.0","method":"textDocument/didOpen","params":{"textDocument":{"uri":"untitled:Untitled-1","languageId":"vuna","version":1,"text":"main : Int\nmain = 1\n"}}}'
  printf '%s\n' '{"jsonrpc":"2.0","id":2,"method":"shutdown","params":null}'
  printf '%s\n' '{"jsonrpc":"2.0","method":"exit","params":null}'
} | LC_ALL=C awk '{ printf "Content-Length: %d\r\n\r\n%s", length($0), $0 }' >"$tmp/untitled.bin"
"$VUNA" lsp <"$tmp/untitled.bin" >"$tmp/untitled.out" 2>/dev/null
untitled_code=$?
untitled_out=$(tr -d '\r' <"$tmp/untitled.out")
check_eq "untitled: URI 退出码 0" "0" "$untitled_code"
check_contains "untitled: URI 推 publishDiagnostics" "$untitled_out" '"method":"textDocument/publishDiagnostics"'
check_contains "untitled: URI 原样回传" "$untitled_out" '"uri":"untitled:Untitled-1"'
check_contains "untitled: URI 之后仍能 shutdown" "$untitled_out" '"id":2'

# ---- 17) 退出码 ----
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

# ---- 18) 交互式帧读取：body 后没有换行、客户端等响应时也必须立刻处理 ----
# 回归点：读取层曾用 `prim_readLine` 按行读 body；标准 LSP 帧的 body **不带换行**，
# 于是 initialize 的响应要等下一帧写入才出现（客户端在等响应，不会再写 → 永久挂起）。
# 这里只写 initialize，延迟 6s 才写 shutdown/exit，要求在 4s 内看到 initialize 响应。
#
# 注意：这条流水线不能用 `awk` 生成帧——awk 的 stdout 是块缓冲，帧会等到 awk 退出
# （6s 后）才到达服务器，测试就失去意义。用 shell 的 printf 直接写，立即可见。
frame_line() { LC_ALL=C printf 'Content-Length: %d\r\n\r\n%s' "${#1}" "$1"; }
{
  frame_line '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"capabilities":{}}}'
  sleep 6
  frame_line '{"jsonrpc":"2.0","id":2,"method":"shutdown","params":null}'
  frame_line '{"jsonrpc":"2.0","method":"exit","params":null}'
} | "$VUNA" lsp >"$tmp/interactive.out" 2>/dev/null &
interactive_pid=$!
interactive_ok=0
i=0
while [ "$i" -lt 4 ]; do
  if grep -q '"id":1,"result"' "$tmp/interactive.out" 2>/dev/null; then
    interactive_ok=1
    break
  fi
  sleep 1
  i=$((i + 1))
done
check_eq "交互式 initialize 在下一帧之前已响应（body 无换行）" "1" "$interactive_ok"
wait "$interactive_pid"
check_eq "交互式会话退出码 0" "0" "$?"

# ---- 19) 符号 hover：返回签名，且 range 落在**光标 token**（不是定义位置）----
# 回归点：range 曾指向符号定义处，客户端会把使用点的 hover 当成失效而收起。
# 这里故意 hover 在**使用点**（第 6 行 useIt = depHelper 1），定义在第 3 行；
# range 必须是光标 token（line 6, char 8..17），不能是定义位置。
{
  printf '%s\n' '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"capabilities":{}}}'
  printf '%s\n' '{"jsonrpc":"2.0","method":"textDocument/didOpen","params":{"textDocument":{"uri":"'"$dep_uri"'","languageId":"vuna","version":1,"text":"module Dep where\n\ndepHelper : Int -> Int\ndepHelper n = n\n\nuseIt : Int\nuseIt = depHelper 1\n"}}}'
  printf '%s\n' '{"jsonrpc":"2.0","id":2,"method":"textDocument/hover","params":{"textDocument":{"uri":"'"$dep_uri"'"},"position":{"line":6,"character":10}}}'
  printf '%s\n' '{"jsonrpc":"2.0","id":3,"method":"shutdown","params":null}'
  printf '%s\n' '{"jsonrpc":"2.0","method":"exit","params":null}'
} | LC_ALL=C awk '{ printf "Content-Length: %d\r\n\r\n%s", length($0), $0 }' >"$tmp/symhover.bin"
"$VUNA" lsp <"$tmp/symhover.bin" >"$tmp/symhover.out" 2>/dev/null
symhover_out=$(tr -d '\r' <"$tmp/symhover.out")
check_contains "符号 hover 回 id 2" "$symhover_out" '"id":2'
check_contains "符号 hover 带签名" "$symhover_out" 'Int -> Int'
check_contains "hover range 落在光标 token（line 6, char 8..17）" "$symhover_out" \
  '"range":{"start":{"line":6,"character":8},"end":{"line":6,"character":17}}'


# ---- 20) docstring hover：只显示 `-- |`，普通注释不显示，多行保留 ----
mkdir -p "$tmp/docws/lib"
printf '[package]\nname = "docws"\n' >"$tmp/docws/vuna.toml"
cat >"$tmp/docws/lib/Doc.vuna" <<'VEOF'
module Doc where

-- | Helper docs.
-- | second line.
depHelper : Int -> Int
depHelper n = n

-- ordinary note
other : Int
other = 2

useIt : Int
useIt = depHelper 1
VEOF
doc_uri="file://$tmp/docws/lib/Doc.vuna"
doc_open='{"jsonrpc":"2.0","method":"textDocument/didOpen","params":{"textDocument":{"uri":"'"$doc_uri"'","languageId":"vuna","version":1,"text":"module Doc where\n\n-- | Helper docs.\n-- | second line.\ndepHelper : Int -> Int\ndepHelper n = n\n\n-- ordinary note\nother : Int\nother = 2\n\nuseIt : Int\nuseIt = depHelper 1\n"}}}'
{
  frame_line '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"capabilities":{}}}'
  frame_line "$doc_open"
  frame_line '{"jsonrpc":"2.0","id":2,"method":"textDocument/hover","params":{"textDocument":{"uri":"'"$doc_uri"'"},"position":{"line":12,"character":10}}}'
  frame_line '{"jsonrpc":"2.0","id":3,"method":"shutdown","params":null}'
  frame_line '{"jsonrpc":"2.0","method":"exit","params":null}'
} | "$VUNA" lsp >"$tmp/dochover.out" 2>/dev/null
dochover_out=$(tr -d '\r' <"$tmp/dochover.out")
check_contains "doc hover 回 id 2" "$dochover_out" '"id":2'
check_contains "doc hover 显示 docstring" "$dochover_out" "Helper docs"
check_contains "doc hover 保留多行" "$dochover_out" "second line"
check_not_contains "doc hover 不含普通注释" "$dochover_out" "ordinary note"

# ---- 21) codeAction：lint quick fix（M38 P1c）----
# Linty.vuna 的 literal-if-chain：Edit 行范围 1-based 5..7（整行替换）。
# 请求 range 用 LSP 的 0-based 4..6，与 Edit 相交 → 1 条单条 quickfix + 1 条 fix all。
# 断言 0-based 整行替换 range = (4,0)..(7,0)（末端是下一行行首，不吞第 8 行）。
ca_open='{"jsonrpc":"2.0","method":"textDocument/didOpen","params":{"textDocument":{"uri":"'"$linty_uri"'","languageId":"vuna","version":1,"text":"module Linty where\n\nnameArity : String -> Int\nnameArity name =\n  if name == \"+\" then 2\n  else if name == \"-\" then 2\n  else 0\n"}}}'
ca_req='{"jsonrpc":"2.0","id":2,"method":"textDocument/codeAction","params":{"textDocument":{"uri":"'"$linty_uri"'"},"range":{"start":{"line":4,"character":0},"end":{"line":6,"character":0}},"context":{"diagnostics":[]}}}'
ca_only='{"jsonrpc":"2.0","id":3,"method":"textDocument/codeAction","params":{"textDocument":{"uri":"'"$linty_uri"'"},"range":{"start":{"line":4,"character":0},"end":{"line":6,"character":0}},"context":{"diagnostics":[],"only":["source.organizeImports"]}}}'
ca_outside='{"jsonrpc":"2.0","id":4,"method":"textDocument/codeAction","params":{"textDocument":{"uri":"'"$linty_uri"'"},"range":{"start":{"line":0,"character":0},"end":{"line":0,"character":0}},"context":{"diagnostics":[]}}}'
{
  frame_line '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"capabilities":{}}}'
  frame_line "$ca_open"
  frame_line "$ca_req"
  frame_line "$ca_only"
  frame_line "$ca_outside"
  frame_line '{"jsonrpc":"2.0","id":5,"method":"shutdown","params":null}'
  frame_line '{"jsonrpc":"2.0","method":"exit","params":null}'
} | "$VUNA" lsp >"$tmp/codeaction.out" 2>/dev/null
ca_code=$?
ca_out=$(tr -d '\r' <"$tmp/codeaction.out")
check_eq "codeAction 会话退出码 0" "0" "$ca_code"
check_contains "codeAction 回 id 2" "$ca_out" '"id":2'
check_contains "codeAction kind=quickfix" "$ca_out" '"kind":"quickfix"'
check_contains "codeAction title 带规则短名" "$ca_out" '"title":"fix: literal-if-chain"'
check_contains "codeAction 关联诊断 code" "$ca_out" '"diagnostics":[{"code":"LN_LiteralIfChain"}]'
check_contains "codeAction 编辑按 uri 分组" "$ca_out" '"changes":{"'"$linty_uri"'":[{'
check_contains "codeAction 是 0-based 整行替换 range（4..7）" "$ca_out" \
  '"range":{"start":{"line":4,"character":0},"end":{"line":7,"character":0}}'
check_contains "codeAction newText 改写为 case" "$ca_out" 'case name of'
check_contains "codeAction 含全文档 fix all" "$ca_out" '"title":"fix all lint findings"'
check_contains "context.only 不含 quickfix → 空数组" "$ca_out" '"id":3,"result":[]'
check_contains "range 无相交可修复 finding → 空数组" "$ca_out" '"id":4,"result":[]'

# ---- 22) 传输层边界：坏 JSON 帧丢弃后会话继续（`Vuna.Json.Server` 的 warn 路径）----
{
  printf 'Content-Length: 3\r\n\r\n{xx'
  frame_line '{"jsonrpc":"2.0","id":1,"method":"shutdown","params":null}'
  frame_line '{"jsonrpc":"2.0","method":"exit","params":null}'
} | "$VUNA" lsp >"$tmp/badjson.out" 2>"$tmp/badjson.err"
check_eq "坏 JSON 帧后 shutdown/exit 退出码 0" "0" "$?"
check_contains "坏 JSON 帧后仍回 shutdown 响应" "$(tr -d '\r' <"$tmp/badjson.out")" '"id":1,"result":null'
check_contains "坏 JSON 帧写 stderr 日志" "$(cat "$tmp/badjson.err")" "malformed frame"

# ---- 23) 传输层边界：无 Content-Length 的 header 丢弃后继续 ----
{
  printf 'X-Ignored: 1\r\n\r\n'
  frame_line '{"jsonrpc":"2.0","id":1,"method":"shutdown","params":null}'
  frame_line '{"jsonrpc":"2.0","method":"exit","params":null}'
} | "$VUNA" lsp >/dev/null 2>"$tmp/nolen.err"
check_eq "无 Content-Length 帧后退出码 0" "0" "$?"
check_contains "无 Content-Length 写 stderr 日志" "$(cat "$tmp/nolen.err")" "without Content-Length"

# ---- 24) 传输层边界：声明长度超过 16 MiB → 立即退 1（不尝试分配/等待 body）----
printf 'Content-Length: 20000000\r\n\r\n' | "$VUNA" lsp >/dev/null 2>"$tmp/big.err"
check_eq "超大帧声明退出码 1" "1" "$?"
check_contains "超大帧声明写 stderr 日志" "$(cat "$tmp/big.err")" "frame too large"

# ---- 25) 传输层边界：body 不足就 EOF → 非正常断开退 1 ----
printf 'Content-Length: 100\r\n\r\nshort' | "$VUNA" lsp >/dev/null 2>/dev/null
check_eq "半帧 EOF 退出码 1" "1" "$?"

# ---- 26) M40 模块名 hover：import / 导出项 `module B` / 模块头 + 模块 docstring ----
# 模块 docstring 写在 `module` 头之前（`-- | ...`），docstring 任一行都应出现在 hover 里。
mkdir -p "$tmp/modws/lib"
printf '[package]\nname = "modws"\n\n[dependencies]\nvuna-base = "%s/base"\n' "$repo" >"$tmp/modws/vuna.toml"
cat >"$tmp/modws/lib/ModDoc.vuna" <<'VEOF'
-- | ModDoc module docs.
-- | second line.
module ModDoc (helper2) where

helper2 : Int -> Int
helper2 n = n
VEOF
cat >"$tmp/modws/lib/Reexp.vuna" <<'VEOF'
module Reexp
  ( module ModDoc
  , useIt
  ) where

import ModDoc

useIt : Int
useIt = helper2 7
VEOF
moddoc_uri="file://$tmp/modws/lib/ModDoc.vuna"
reexp_uri="file://$tmp/modws/lib/Reexp.vuna"
reexp_text='module Reexp\n  ( module ModDoc\n  , useIt\n  ) where\n\nimport ModDoc\n\nuseIt : Int\nuseIt = helper2 7\n'
{
  frame_line '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"capabilities":{}}}'
  frame_line '{"jsonrpc":"2.0","method":"textDocument/didOpen","params":{"textDocument":{"uri":"'"$reexp_uri"'","languageId":"vuna","version":1,"text":"'"$reexp_text"'"}}}'
  frame_line '{"jsonrpc":"2.0","id":2,"method":"textDocument/hover","params":{"textDocument":{"uri":"'"$reexp_uri"'"},"position":{"line":5,"character":9}}}'
  frame_line '{"jsonrpc":"2.0","id":3,"method":"textDocument/hover","params":{"textDocument":{"uri":"'"$reexp_uri"'"},"position":{"line":1,"character":13}}}'
  frame_line '{"jsonrpc":"2.0","id":4,"method":"textDocument/hover","params":{"textDocument":{"uri":"'"$reexp_uri"'"},"position":{"line":0,"character":8}}}'
  frame_line '{"jsonrpc":"2.0","id":5,"method":"textDocument/definition","params":{"textDocument":{"uri":"'"$reexp_uri"'"},"position":{"line":5,"character":9}}}'
  frame_line '{"jsonrpc":"2.0","id":6,"method":"shutdown","params":null}'
  frame_line '{"jsonrpc":"2.0","method":"exit","params":null}'
} | "$VUNA" lsp >"$tmp/modhover.out" 2>/dev/null
mod_out=$(tr -d '\r' <"$tmp/modhover.out")
check_contains "import 模块名 hover 回 id 2" "$mod_out" '"id":2'
check_contains "import 模块名 hover 出模块全名" "$mod_out" 'module ModDoc'
check_contains "模块 hover 带模块 docstring" "$mod_out" 'ModDoc module docs'
check_contains "模块 hover 保留多行 docstring" "$mod_out" 'second line'
check_contains "导出项 module B hover 回 id 3" "$mod_out" '"id":3'
check_contains "导出项 module B hover 出模块全名" "$mod_out" 'module ModDoc'
check_contains "模块头自身 hover 回 id 4" "$mod_out" '"id":4'
check_contains "模块头自身 hover 出模块名" "$mod_out" 'module Reexp'
check_contains "模块 definition 回 id 5" "$mod_out" '"id":5'
check_contains "模块 definition 跳到 ModDoc.vuna" "$mod_out" '/ModDoc.vuna'
check_contains "模块 definition 指向 module 头名字" "$mod_out" \
  '"range":{"start":{"line":2,"character":7},"end":{"line":2,"character":13}}'

# ---- 27) M40 局部绑定：hover（语法级类型/值）与 definition（binder 位置）----
mkdir -p "$tmp/localws/lib"
printf '[package]\nname = "localws"\n\n[dependencies]\nvuna-base = "%s/base"\n' "$repo" >"$tmp/localws/vuna.toml"
cat >"$tmp/localws/lib/Local.vuna" <<'VEOF'
module Local where

twice : Int -> Int
twice n = n + n

addBoth : Int -> Int -> Int
addBoth = \x, y => x + y

shadowing : Int -> Int
shadowing n =
  let n = n + 1
  in n

compute : Int
compute =
  let base = 10
  in twice (base + 1)
VEOF
local_uri="file://$tmp/localws/lib/Local.vuna"
local_text='module Local where\n\ntwice : Int -> Int\ntwice n = n + n\n\naddBoth : Int -> Int -> Int\naddBoth = \\x, y => x + y\n\nshadowing : Int -> Int\nshadowing n =\n  let n = n + 1\n  in n\n\ncompute : Int\ncompute =\n  let base = 10\n  in twice (base + 1)\n'
{
  frame_line '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"capabilities":{}}}'
  frame_line '{"jsonrpc":"2.0","method":"textDocument/didOpen","params":{"textDocument":{"uri":"'"$local_uri"'","languageId":"vuna","version":1,"text":"'"$local_text"'"}}}'
  frame_line '{"jsonrpc":"2.0","id":2,"method":"textDocument/hover","params":{"textDocument":{"uri":"'"$local_uri"'"},"position":{"line":3,"character":10}}}'
  frame_line '{"jsonrpc":"2.0","id":3,"method":"textDocument/hover","params":{"textDocument":{"uri":"'"$local_uri"'"},"position":{"line":6,"character":19}}}'
  frame_line '{"jsonrpc":"2.0","id":4,"method":"textDocument/hover","params":{"textDocument":{"uri":"'"$local_uri"'"},"position":{"line":16,"character":12}}}'
  frame_line '{"jsonrpc":"2.0","id":5,"method":"textDocument/hover","params":{"textDocument":{"uri":"'"$local_uri"'"},"position":{"line":16,"character":7}}}'
  frame_line '{"jsonrpc":"2.0","id":6,"method":"textDocument/definition","params":{"textDocument":{"uri":"'"$local_uri"'"},"position":{"line":3,"character":10}}}'
  frame_line '{"jsonrpc":"2.0","id":7,"method":"textDocument/definition","params":{"textDocument":{"uri":"'"$local_uri"'"},"position":{"line":16,"character":12}}}'
  frame_line '{"jsonrpc":"2.0","id":8,"method":"textDocument/definition","params":{"textDocument":{"uri":"'"$local_uri"'"},"position":{"line":6,"character":19}}}'
  frame_line '{"jsonrpc":"2.0","id":9,"method":"textDocument/definition","params":{"textDocument":{"uri":"'"$local_uri"'"},"position":{"line":11,"character":5}}}'
  frame_line '{"jsonrpc":"2.0","id":10,"method":"textDocument/definition","params":{"textDocument":{"uri":"'"$local_uri"'"},"position":{"line":10,"character":10}}}'
  frame_line '{"jsonrpc":"2.0","id":11,"method":"shutdown","params":null}'
  frame_line '{"jsonrpc":"2.0","method":"exit","params":null}'
} | "$VUNA" lsp >"$tmp/localhover.out" 2>/dev/null
local_out=$(tr -d '\r' <"$tmp/localhover.out")
check_contains "局部 hover 回 id 2" "$local_out" '"id":2'
check_contains "参数 hover 给语法类型" "$local_out" 'n : Int'
check_contains "参数 hover 标种类" "$local_out" 'local binding (parameter)'
check_contains "λ 参数 hover 标种类" "$local_out" 'local binding (lambda)'
check_contains "let 绑定 hover 给值" "$local_out" 'base = 10'
check_contains "let 绑定 hover 标种类" "$local_out" 'local binding (let)'
check_contains "顶层符号 hover 仍走 Index" "$local_out" 'Int -> Int'
check_contains "参数 definition 回 id 6" "$local_out" '"id":6'
check_contains "参数 definition 指向参数 n" "$local_out" \
  '"range":{"start":{"line":3,"character":6},"end":{"line":3,"character":7}}'
check_contains "let definition 指向 let binder" "$local_out" \
  '"range":{"start":{"line":15,"character":6},"end":{"line":15,"character":10}}'
check_contains "λ definition 指向 λ 参数" "$local_out" \
  '"range":{"start":{"line":6,"character":11},"end":{"line":6,"character":12}}'
check_contains "遮蔽：body n 指向 let binder" "$local_out" \
  '"id":9,"result":[{"uri":"file://'"$tmp"'/localws/lib/Local.vuna","range":{"start":{"line":10,"character":6}'
check_contains "遮蔽：值 n 指向函数参数" "$local_out" \
  '"id":10,"result":[{"uri":"file://'"$tmp"'/localws/lib/Local.vuna","range":{"start":{"line":9,"character":10}'

# ---- 28) M40 洞：未解 `_` 的目标+上下文；命名洞 `?name` 的名字/目标/上下文 ----
mkdir -p "$tmp/holews/lib"
printf '[package]\nname = "holews"\n\n[dependencies]\nvuna-base = "%s/base"\n' "$repo" >"$tmp/holews/vuna.toml"
cat >"$tmp/holews/lib/Holes.vuna" <<'VEOF'
module Holes where

g : Int -> Int
g n =
  let m = n + 1
  in _
VEOF
cat >"$tmp/holews/lib/Named.vuna" <<'VEOF'
module Named where

g : Int -> Int
g n =
  let m = n + 1
  in ?goal
VEOF
holes_uri="file://$tmp/holews/lib/Holes.vuna"
named_uri="file://$tmp/holews/lib/Named.vuna"
holes_text='module Holes where\n\ng : Int -> Int\ng n =\n  let m = n + 1\n  in _\n'
named_text='module Named where\n\ng : Int -> Int\ng n =\n  let m = n + 1\n  in ?goal\n'
{
  frame_line '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"capabilities":{}}}'
  frame_line '{"jsonrpc":"2.0","method":"textDocument/didOpen","params":{"textDocument":{"uri":"'"$holes_uri"'","languageId":"vuna","version":1,"text":"'"$holes_text"'"}}}'
  frame_line '{"jsonrpc":"2.0","method":"textDocument/didOpen","params":{"textDocument":{"uri":"'"$named_uri"'","languageId":"vuna","version":1,"text":"'"$named_text"'"}}}'
  frame_line '{"jsonrpc":"2.0","id":2,"method":"textDocument/hover","params":{"textDocument":{"uri":"'"$holes_uri"'"},"position":{"line":5,"character":5}}}'
  frame_line '{"jsonrpc":"2.0","id":3,"method":"textDocument/hover","params":{"textDocument":{"uri":"'"$named_uri"'"},"position":{"line":5,"character":8}}}'
  frame_line '{"jsonrpc":"2.0","id":4,"method":"shutdown","params":null}'
  frame_line '{"jsonrpc":"2.0","method":"exit","params":null}'
} | "$VUNA" lsp >"$tmp/holehover.out" 2>/dev/null
hole_out=$(tr -d '\r' <"$tmp/holehover.out")
check_contains "未解 _ 洞 hover 回 id 2" "$hole_out" '"id":2'
check_contains "未解 _ 洞 hover 给目标类型" "$hole_out" 'Int'
check_contains "未解 _ 洞 hover 给上下文标题" "$hole_out" 'Context:'
check_contains "未解 _ 洞 hover 列出 let 绑定 m" "$hole_out" '`m` : Int'
check_contains "未解 _ 洞 hover 列出参数 n" "$hole_out" '`n` : Int'
check_contains "命名洞 hover 回 id 3" "$hole_out" '"id":3'
check_contains "命名洞 hover 显示 ?goal : 目标" "$hole_out" '?goal : Int'
check_contains "命名洞 hover 给上下文" "$hole_out" '`m` : Int'
check_contains "命名洞 range 覆盖整个 ?goal" "$hole_out" \
  '"range":{"start":{"line":5,"character":5},"end":{"line":5,"character":10}}'

printf 'lsp: %d passed, %d failed\n' "$pass" "$fail"
[ "$fail" -eq 0 ] && echo "lsp smoke passed"
[ "$fail" -eq 0 ]
