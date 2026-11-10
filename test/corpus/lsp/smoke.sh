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
#                              codeAction(codeActionKinds=["quickfix","refactor.rewrite"]) /
#                              executeCommand(vuna.fixAllLint)）
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
#      title 带规则短名、内嵌完整诊断（range/severity/source/code/message）、0-based
#      整行替换 range、newText 是 case 形式、全文档 "fix all lint findings"（C38 起是
#      Command 形式）；context.only 不含 quickfix 或 range 与可修复 finding 不相交时回空数组。
#
# E. C38 codeAction 高 ROI（case split + command 形式）
#  30. 洞 + 上下文 data / record binder → `refactor.rewrite` 的 `case split on <name>`：
#      构造子顺序/参数通配（Box _）/隐式构造子参数不进模式（MkH => _）/分支缩进 =
#      洞行缩进 + 2；base 类型经 Prelude 解析（Bool → False/True）；函数类型 binder、
#      无洞行、context.only 不含 refactor 时不给动作；record 单分支（record 模式、字段全
#      `_`，本模块 / 参数化 record）；多参数 data 的应用类型文本（`Either Int Bool`，
#      show 成左结合全括号）也能解析。
#  31. fix all 的 Command 形式：codeAction 带 `command`、initialize 声明
#      executeCommandProvider；workspace/executeCommand("vuna.fixAllLint") 回 result
#      null 并发 workspace/applyEdit 整文档替换；未知 command → -32602。
#  32. case split 的限定 import（构造子/record 类型名写 `Dep.`）与命名洞 `?goal`（编辑
#      range 覆盖整个 token）；axiom（不透明、无右侧可展开）与索引族（parse 级不知道索引
#      约束，枚举会生成不可达分支）不给动作（安全降级）。
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
{"jsonrpc":"2.0","id":11,"method":"textDocument/diagnostic","params":{"textDocument":{"uri":"$linty_uri"}}}
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
check_eq "帧数（8 通知 + 10 响应 + 1 pull）" "19" "$frames"

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
check_contains "initialize 声明 renameProvider(prepareProvider)" "$init" '"renameProvider":{"prepareProvider":true}'
check_contains "initialize 声明 documentSymbolProvider" "$init" '"documentSymbolProvider":true'
check_contains "initialize 声明 documentFormattingProvider" "$init" '"documentFormattingProvider":true'
check_contains "initialize 声明 workspaceSymbolProvider" "$init" '"workspaceSymbolProvider":true'
check_contains "initialize 声明 codeActionProvider(codeActionKinds=[quickfix,refactor.rewrite])" "$init" '"codeActionProvider":{"codeActionKinds":["quickfix","refactor.rewrite"]}'
check_contains "initialize 声明 executeCommandProvider(vuna.fixAllLint)" "$init" '"executeCommandProvider":{"commands":["vuna.fixAllLint"]}'
check_contains "initialize 声明 diagnosticProvider(pull)" "$init" '"diagnosticProvider"'

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
check_contains "shutdown 响应 id 10" "$shutdown_frame" '"id":10'

# ---- 14b) pull diagnostics（LSP 3.17）：full report，与 push 同源 ----
pull_frame=$(frame_at 19)
check_contains "pull 回 id 11" "$pull_frame" '"id":11'
check_contains "pull kind=full" "$pull_frame" '"kind":"full"'
check_contains "pull items 带诊断 code" "$pull_frame" '"code":"LN_LiteralIfChain"'
check_contains "pull 带 0-based range" "$pull_frame" '"range":{"start":{"line":'

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

# ---- 21) codeAction：lint quick fix（M38 P1c；C38 起 fix all 走 Command 形式）----
# Linty.vuna 的 literal-if-chain：Edit 行范围 1-based 4..7（整行替换；if 分派直接提升成 clause）。
# 请求 range 用 LSP 的 0-based 4..6，与 Edit 相交 → 1 条单条 quickfix + 1 条 fix all
# （`Command`，不带内嵌 edit）。断言 0-based 整行替换 range = (3,0)..(7,0)
# （末端是下一行行首，不吞第 8 行）。
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
# C38 收窄：内嵌诊断从「只带 code」升级为完整诊断（与 publishDiagnostics 同一条 JSON：
# range / severity / source / code / message），客户端仍可按 code 关联。
check_contains "codeAction 内嵌诊断带 0-based range" "$ca_out" '"diagnostics":[{"range":'
check_contains "codeAction 内嵌诊断带 severity/source/code/message" "$ca_out" \
  '"severity":2,"source":"vuna","code":"LN_LiteralIfChain","message":"if dispatch on'
check_contains "codeAction 编辑按 uri 分组" "$ca_out" '"changes":{"'"$linty_uri"'":[{'
check_contains "codeAction 是 0-based 整行替换 range（3..7）" "$ca_out" \
  '"range":{"start":{"line":3,"character":0},"end":{"line":7,"character":0}}'
check_contains "codeAction newText 提升为 clause" "$ca_out" 'nameArity \"+\" = 2'
check_contains "codeAction 含全文档 fix all" "$ca_out" '"title":"fix all lint findings"'
check_contains "fix all 走 Command 形式（无内嵌 edit）" "$ca_out" \
  '"command":{"title":"fix all lint findings","command":"vuna.fixAllLint"'
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

# ---- 33) C45 Pi / 类型级 binder hover：顶层签名里的 `(f : A) -> B` binder 返回 domain 类型 ----
# 回归点：Pi 类型住在签名里，而 hover 局部绑定原先只 walk pats + body、从不 walk 签名类型表达式，
# 所以签名 Pi binder 是死代码（hover 返回 null）。修法：`findDeclBind` 先把 `DSig` 的完整签名
# （`declSigType`，非 `arrowDomains`——后者丢 binder 名）喂给 `walkExpr`，其 `EPi` 分支按
# `piNamePos` 命中 binder 名、类型取 domain。这里 hover 签名 binder 本体 + 带 `where` 的签名。
mkdir -p "$tmp/piws/lib"
printf '[package]\nname = "piws"\n\n[dependencies]\nvuna-base = "%s/base"\n' "$repo" >"$tmp/piws/vuna.toml"
cat >"$tmp/piws/lib/PiTest.vuna" <<'VEOF'
module PiTest where

apply : (f : Int -> Int) -> Int
apply f = f 0

apply2 : (fn : Int -> Int) -> Int
apply2 fn = fn 0
  where zero = 0
VEOF
pi_uri="file://$tmp/piws/lib/PiTest.vuna"
pi_text='module PiTest where\n\napply : (f : Int -> Int) -> Int\napply f = f 0\n\napply2 : (fn : Int -> Int) -> Int\napply2 fn = fn 0\n  where zero = 0\n'
{
  frame_line '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"capabilities":{}}}'
  frame_line '{"jsonrpc":"2.0","method":"textDocument/didOpen","params":{"textDocument":{"uri":"'"$pi_uri"'","languageId":"vuna","version":1,"text":"'"$pi_text"'"}}}'
  # line2 char9 = `apply` 签名 `(f : Int -> Int)` 的 binder `f`（单字符名，紧跟 `(`）
  frame_line '{"jsonrpc":"2.0","id":2,"method":"textDocument/hover","params":{"textDocument":{"uri":"'"$pi_uri"'"},"position":{"line":2,"character":9}}}'
  # line5 char10 = `apply2`（带 where）签名 binder `fn`（两字符名，起点在 `(` 后一位）
  frame_line '{"jsonrpc":"2.0","id":3,"method":"textDocument/hover","params":{"textDocument":{"uri":"'"$pi_uri"'"},"position":{"line":5,"character":10}}}'
  frame_line '{"jsonrpc":"2.0","id":9,"method":"shutdown","params":null}'
  frame_line '{"jsonrpc":"2.0","method":"exit","params":null}'
} | "$VUNA" lsp >"$tmp/pihover.out" 2>/dev/null
pi_out=$(tr -d '\r' <"$tmp/pihover.out")
check_contains "Pi binder hover 回 id 2" "$pi_out" '"id":2'
check_contains "Pi binder hover 给 domain 类型" "$pi_out" 'f : Int -> Int'
check_contains "Pi binder hover 标种类" "$pi_out" 'local binding (Pi)'
check_contains "Pi binder hover range 落在 binder f" "$pi_out" \
  '"range":{"start":{"line":2,"character":9},"end":{"line":2,"character":10}}'
check_contains "带 where 的签名 Pi binder hover（fn）" "$pi_out" 'fn : Int -> Int'

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

# ---- 29) C38 rename：顶层函数 / 局部绑定（遮蔽）/ 记录字段 / prepareRename / 拒绝 ----
# 夹具覆盖三条路径：
#   - topFn：签名行 + 定义子句 + 使用点（顶层函数，同一文件）；
#   - shadow n：参数改名时只动参数 binder 与 let 值里的 n，**不碰** let binder / body n；
#   - Point.px：字段声明 + `p.px` 字段访问 + 记录字面量标签。
# 另验证 prepareRename（顶层 / 局部）、关键字与 base 标准库（Int）改名回 null。
mkdir -p "$tmp/renamews/lib"
printf '[package]\nname = "renamews"\n\n[dependencies]\nvuna-base = "%s/base"\n' "$repo" >"$tmp/renamews/vuna.toml"
cat >"$tmp/renamews/lib/Rename.vuna" <<'VEOF'
module Rename where

topFn : Int -> Int
topFn n = n + 1

useTop : Int
useTop = topFn 1

shadow : Int -> Int
shadow n =
  let n = n + 1
  in n

record Point where
  px : Int
  py : Int

moveX : Point -> Int
moveX p = p.px

mk : Int -> Point
mk v = Point { px = v, py = 0 }
VEOF
rename_uri="file://$tmp/renamews/lib/Rename.vuna"
rename_text='module Rename where\n\ntopFn : Int -> Int\ntopFn n = n + 1\n\nuseTop : Int\nuseTop = topFn 1\n\nshadow : Int -> Int\nshadow n =\n  let n = n + 1\n  in n\n\nrecord Point where\n  px : Int\n  py : Int\n\nmoveX : Point -> Int\nmoveX p = p.px\n\nmk : Int -> Point\nmk v = Point { px = v, py = 0 }\n'
{
  frame_line '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"capabilities":{}}}'
  frame_line '{"jsonrpc":"2.0","method":"textDocument/didOpen","params":{"textDocument":{"uri":"'"$rename_uri"'","languageId":"vuna","version":1,"text":"'"$rename_text"'"}}}'
  frame_line '{"jsonrpc":"2.0","id":2,"method":"textDocument/rename","params":{"textDocument":{"uri":"'"$rename_uri"'"},"position":{"line":2,"character":0},"newName":"renamedTop"}}'
  frame_line '{"jsonrpc":"2.0","id":3,"method":"textDocument/rename","params":{"textDocument":{"uri":"'"$rename_uri"'"},"position":{"line":9,"character":7},"newName":"m"}}'
  frame_line '{"jsonrpc":"2.0","id":4,"method":"textDocument/rename","params":{"textDocument":{"uri":"'"$rename_uri"'"},"position":{"line":14,"character":2},"newName":"xcoord"}}'
  frame_line '{"jsonrpc":"2.0","id":5,"method":"textDocument/prepareRename","params":{"textDocument":{"uri":"'"$rename_uri"'"},"position":{"line":2,"character":0}}}'
  frame_line '{"jsonrpc":"2.0","id":6,"method":"textDocument/rename","params":{"textDocument":{"uri":"'"$rename_uri"'"},"position":{"line":0,"character":16},"newName":"x"}}'
  frame_line '{"jsonrpc":"2.0","id":7,"method":"textDocument/rename","params":{"textDocument":{"uri":"'"$rename_uri"'"},"position":{"line":2,"character":8},"newName":"x"}}'
  frame_line '{"jsonrpc":"2.0","id":8,"method":"textDocument/prepareRename","params":{"textDocument":{"uri":"'"$rename_uri"'"},"position":{"line":9,"character":7}}}'
  frame_line '{"jsonrpc":"2.0","id":9,"method":"shutdown","params":null}'
  frame_line '{"jsonrpc":"2.0","method":"exit","params":null}'
} | "$VUNA" lsp >"$tmp/rename.out" 2>/dev/null
rename_code=$?
rename_out=$(tr -d '\r' <"$tmp/rename.out")
check_eq "rename 会话退出码 0" "0" "$rename_code"
check_contains "rename 回 id 2" "$rename_out" '"id":2'
check_contains "rename 结果是 WorkspaceEdit（changes 按 uri 分组）" "$rename_out" \
  '"result":{"changes":{"'"$rename_uri"'":[{'
check_contains "顶层函数 rename：签名行" "$rename_out" \
  '{"range":{"start":{"line":2,"character":0},"end":{"line":2,"character":5}},"newText":"renamedTop"}'
check_contains "顶层函数 rename：定义子句" "$rename_out" \
  '{"range":{"start":{"line":3,"character":0},"end":{"line":3,"character":5}},"newText":"renamedTop"}'
check_contains "顶层函数 rename：使用点" "$rename_out" \
  '{"range":{"start":{"line":6,"character":9},"end":{"line":6,"character":14}},"newText":"renamedTop"}'
top_edits=$(printf '%s' "$rename_out" | grep -o '"newText":"renamedTop"' | wc -l | tr -d ' ')
check_eq "顶层函数 rename 恰好 3 条 TextEdit" "3" "$top_edits"
check_contains "局部 rename 回 id 3" "$rename_out" '"id":3'
check_contains "局部 rename：参数 binder" "$rename_out" \
  '{"range":{"start":{"line":9,"character":7},"end":{"line":9,"character":8}},"newText":"m"}'
check_contains "局部 rename：let 值里的 n（参数）" "$rename_out" \
  '{"range":{"start":{"line":10,"character":10},"end":{"line":10,"character":11}},"newText":"m"}'
local_edits=$(printf '%s' "$rename_out" | grep -o '"newText":"m"' | wc -l | tr -d ' ')
check_eq "局部 rename 只含参数两处（不碰 let binder / body）" "2" "$local_edits"
check_not_contains "局部 rename 不改 let binder" "$rename_out" \
  '{"range":{"start":{"line":10,"character":6},"end":{"line":10,"character":7}},"newText":"m"}'
check_not_contains "局部 rename 不改 body n" "$rename_out" \
  '{"range":{"start":{"line":11,"character":5},"end":{"line":11,"character":6}},"newText":"m"}'
check_contains "记录字段 rename 回 id 4" "$rename_out" '"id":4'
check_contains "记录字段 rename：字段声明" "$rename_out" \
  '{"range":{"start":{"line":14,"character":2},"end":{"line":14,"character":4}},"newText":"xcoord"}'
check_contains "记录字段 rename：字段访问 p.px" "$rename_out" \
  '{"range":{"start":{"line":18,"character":12},"end":{"line":18,"character":14}},"newText":"xcoord"}'
check_contains "记录字段 rename：记录字面量标签" "$rename_out" \
  '{"range":{"start":{"line":21,"character":15},"end":{"line":21,"character":17}},"newText":"xcoord"}'
field_edits=$(printf '%s' "$rename_out" | grep -o '"newText":"xcoord"' | wc -l | tr -d ' ')
check_eq "记录字段 rename 恰好 3 条 TextEdit（同名 py 不动）" "3" "$field_edits"
check_contains "prepareRename 回 id 5" "$rename_out" '"id":5'
check_contains "prepareRename 给光标 token 范围与占位名" "$rename_out" \
  '"id":5,"result":{"range":{"start":{"line":2,"character":0},"end":{"line":2,"character":5}},"placeholder":"topFn"}'
check_contains "prepareRename 也支持局部绑定" "$rename_out" \
  '"id":8,"result":{"range":{"start":{"line":9,"character":7},"end":{"line":9,"character":8}},"placeholder":"n"}'
check_contains "rename 关键字 → result null" "$rename_out" '"id":6,"result":null'
check_contains "rename base 标准库（Int）→ result null" "$rename_out" '"id":7,"result":null'

# ---- 30) C38 case split：光标在洞上 + 上下文 data / record binder → refactor.rewrite 动作 ----
# 夹具覆盖：本模块 data（Color 三分支 / Box 带参数 / H 隐式构造子参数）、record（Pt 单
# 分支、Pairing 参数化单分支）、多参数 data（Either：应用类型文本在 show 里是左结合全括号
# `((Either Int) Bool)`）、base 类型（Bool → False/True，经隐式 Prelude 重导出）、洞在缩进
# 行（分支缩进 = 行缩进 + 2）、函数类型 binder 不给动作、无洞行不给动作、context.only 过滤。
# 位置均为 LSP 0-based：pick 洞 line 14 char 11、unbox line 17 char 11、wrap line 21
# char 2、apply line 24 char 10、hval line 27 char 9、still line 30 char 11；
# rgb line 45 char 8、either line 48 char 11、pairof line 51 char 11。
mkdir -p "$tmp/splitws/lib"
printf '[package]\nname = "splitws"\n\n[dependencies]\nvuna-base = "%s/base"\n' "$repo" >"$tmp/splitws/vuna.toml"
cat >"$tmp/splitws/lib/Split.vuna" <<'VEOF'
module Split where

data Color : Type where
  Red : Color
  Green : Color
  Blue : Color

data Box a : Type where
  Box : a -> Box a

data H : Type where
  MkH : {n : Int} -> H

pick : Color -> Bool -> Int
pick c b = _

unbox : Box Int -> Int
unbox bx = _

wrap : Color -> Int
wrap c =
  _

apply : (Int -> Int) -> Int
apply f = _

hval : H -> Int
hval h = _

still : Color -> Int
still c = 0

record Pt where
  ptX : Int
  ptY : Bool

record Pairing a b where
  left : a
  right : b

data Either a b : Type where
  Left : a -> Either a b
  Right : b -> Either a b

rgb : Pt -> Int
rgb r = _

either : Either Int Bool -> Int
either e = _

pairof : Pairing Int Bool -> Int
pairof p = _
VEOF
split_uri="file://$tmp/splitws/lib/Split.vuna"
split_text='module Split where\n\ndata Color : Type where\n  Red : Color\n  Green : Color\n  Blue : Color\n\ndata Box a : Type where\n  Box : a -> Box a\n\ndata H : Type where\n  MkH : {n : Int} -> H\n\npick : Color -> Bool -> Int\npick c b = _\n\nunbox : Box Int -> Int\nunbox bx = _\n\nwrap : Color -> Int\nwrap c =\n  _\n\napply : (Int -> Int) -> Int\napply f = _\n\nhval : H -> Int\nhval h = _\n\nstill : Color -> Int\nstill c = 0\n\nrecord Pt where\n  ptX : Int\n  ptY : Bool\n\nrecord Pairing a b where\n  left : a\n  right : b\n\ndata Either a b : Type where\n  Left : a -> Either a b\n  Right : b -> Either a b\n\nrgb : Pt -> Int\nrgb r = _\n\neither : Either Int Bool -> Int\neither e = _\n\npairof : Pairing Int Bool -> Int\npairof p = _\n'

# 从会话输出里取指定 id 的响应帧（正文是单行 JSON）。
lsp_frame_id() { # file id
  tr -d '\r' <"$1" | sed 's/Content-Length: /\nContent-Length: /g' | grep -F "\"id\":$2," | head -n 1
}

{
  frame_line '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"capabilities":{}}}'
  frame_line '{"jsonrpc":"2.0","method":"textDocument/didOpen","params":{"textDocument":{"uri":"'"$split_uri"'","languageId":"vuna","version":1,"text":"'"$split_text"'"}}}'
  frame_line '{"jsonrpc":"2.0","id":2,"method":"textDocument/codeAction","params":{"textDocument":{"uri":"'"$split_uri"'"},"range":{"start":{"line":14,"character":11},"end":{"line":14,"character":11}},"context":{"diagnostics":[]}}}'
  frame_line '{"jsonrpc":"2.0","id":3,"method":"textDocument/codeAction","params":{"textDocument":{"uri":"'"$split_uri"'"},"range":{"start":{"line":17,"character":11},"end":{"line":17,"character":11}},"context":{"diagnostics":[]}}}'
  frame_line '{"jsonrpc":"2.0","id":4,"method":"textDocument/codeAction","params":{"textDocument":{"uri":"'"$split_uri"'"},"range":{"start":{"line":21,"character":2},"end":{"line":21,"character":2}},"context":{"diagnostics":[]}}}'
  frame_line '{"jsonrpc":"2.0","id":5,"method":"textDocument/codeAction","params":{"textDocument":{"uri":"'"$split_uri"'"},"range":{"start":{"line":24,"character":10},"end":{"line":24,"character":10}},"context":{"diagnostics":[]}}}'
  frame_line '{"jsonrpc":"2.0","id":6,"method":"textDocument/codeAction","params":{"textDocument":{"uri":"'"$split_uri"'"},"range":{"start":{"line":27,"character":9},"end":{"line":27,"character":9}},"context":{"diagnostics":[]}}}'
  frame_line '{"jsonrpc":"2.0","id":7,"method":"textDocument/codeAction","params":{"textDocument":{"uri":"'"$split_uri"'"},"range":{"start":{"line":30,"character":11},"end":{"line":30,"character":11}},"context":{"diagnostics":[]}}}'
  frame_line '{"jsonrpc":"2.0","id":8,"method":"textDocument/codeAction","params":{"textDocument":{"uri":"'"$split_uri"'"},"range":{"start":{"line":14,"character":11},"end":{"line":14,"character":11}},"context":{"diagnostics":[],"only":["refactor"]}}}'
  frame_line '{"jsonrpc":"2.0","id":9,"method":"textDocument/codeAction","params":{"textDocument":{"uri":"'"$split_uri"'"},"range":{"start":{"line":14,"character":11},"end":{"line":14,"character":11}},"context":{"diagnostics":[],"only":["source.organizeImports"]}}}'
  frame_line '{"jsonrpc":"2.0","id":10,"method":"textDocument/codeAction","params":{"textDocument":{"uri":"'"$split_uri"'"},"range":{"start":{"line":14,"character":11},"end":{"line":14,"character":11}},"context":{"diagnostics":[],"only":["quickfix"]}}}'
  frame_line '{"jsonrpc":"2.0","id":12,"method":"textDocument/codeAction","params":{"textDocument":{"uri":"'"$split_uri"'"},"range":{"start":{"line":45,"character":8},"end":{"line":45,"character":8}},"context":{"diagnostics":[]}}}'
  frame_line '{"jsonrpc":"2.0","id":13,"method":"textDocument/codeAction","params":{"textDocument":{"uri":"'"$split_uri"'"},"range":{"start":{"line":48,"character":11},"end":{"line":48,"character":11}},"context":{"diagnostics":[]}}}'
  frame_line '{"jsonrpc":"2.0","id":14,"method":"textDocument/codeAction","params":{"textDocument":{"uri":"'"$split_uri"'"},"range":{"start":{"line":51,"character":11},"end":{"line":51,"character":11}},"context":{"diagnostics":[]}}}'
  frame_line '{"jsonrpc":"2.0","id":11,"method":"shutdown","params":null}'
  frame_line '{"jsonrpc":"2.0","method":"exit","params":null}'
} | "$VUNA" lsp >"$tmp/split.out" 2>/dev/null
split_code=$?
check_eq "case split 会话退出码 0" "0" "$split_code"

r2=$(lsp_frame_id "$tmp/split.out" 2)
check_contains "case split 回 id 2" "$r2" '"id":2'
check_contains "case split: Color binder 一条动作" "$r2" '"title":"case split on c"'
check_contains "case split: Bool binder 一条动作" "$r2" '"title":"case split on b"'
check_contains "case split kind=refactor.rewrite" "$r2" '"kind":"refactor.rewrite"'
check_contains "case split: Color 三分支（源码顺序）+ 2 空格缩进" "$r2" \
  '"newText":"case c of\n  Red => _\n  Green => _\n  Blue => _"'
check_contains "case split: Bool 两分支（false/true 源码顺序）" "$r2" \
  '"newText":"case b of\n  False => _\n  True => _"'
check_contains "case split 编辑 range 精确覆盖洞 token" "$r2" \
  '"range":{"start":{"line":14,"character":11},"end":{"line":14,"character":12}}'
r3=$(lsp_frame_id "$tmp/split.out" 3)
check_contains "case split: Box 参数用 _ 占位" "$r3" '"newText":"case bx of\n  Box _ => _"'
r4=$(lsp_frame_id "$tmp/split.out" 4)
check_contains "case split: 洞在缩进行 → 分支 = 行缩进 + 2" "$r4" \
  '"newText":"case c of\n    Red => _\n    Green => _\n    Blue => _"'
r5=$(lsp_frame_id "$tmp/split.out" 5)
check_contains "函数类型 binder 不给 case split" "$r5" '"id":5,"result":[]'
r6=$(lsp_frame_id "$tmp/split.out" 6)
check_contains "case split: 隐式构造子参数不进模式（MkH => _）" "$r6" \
  '"newText":"case h of\n  MkH => _"'
r7=$(lsp_frame_id "$tmp/split.out" 7)
check_contains "无洞行不给 case split" "$r7" '"id":7,"result":[]'
r8=$(lsp_frame_id "$tmp/split.out" 8)
check_contains "context.only=[refactor] 仍给 case split" "$r8" '"title":"case split on c"'
check_not_contains "context.only=[refactor] 不混入 quickfix" "$r8" '"kind":"quickfix"'
r9=$(lsp_frame_id "$tmp/split.out" 9)
check_contains "context.only=[source.organizeImports] → 空数组" "$r9" '"id":9,"result":[]'
r10=$(lsp_frame_id "$tmp/split.out" 10)
check_contains "context.only=[quickfix] 不给 case split" "$r10" '"id":10,"result":[]'
# record 是单构造器：一条分支，模式用 record 形式（`Type { 字段 = _, ... }`，字段写全）。
r12=$(lsp_frame_id "$tmp/split.out" 12)
check_contains "case split: 本模块 record 单分支（record 模式、字段全 _）" "$r12" \
  '"newText":"case r of\n  Pt { ptX = _, ptY = _ } => _"'
r13=$(lsp_frame_id "$tmp/split.out" 13)
check_contains "case split: 多参数 data 的应用类型文本也能解析（Either）" "$r13" \
  '"newText":"case e of\n  Left _ => _\n  Right _ => _"'
r14=$(lsp_frame_id "$tmp/split.out" 14)
check_contains "case split: 参数化 record 单分支" "$r14" \
  '"newText":"case p of\n  Pairing { left = _, right = _ } => _"'

# ---- 31) C38 command 形式：fix all → workspace/executeCommand → workspace/applyEdit ----
# 服务器不写文件：收到 `vuna.fixAllLint` 后回 executeCommand result null，并发一条
# `workspace/applyEdit` 请求（客户端应用整文档替换；客户端响应按无 method 帧忽略）。
{
  frame_line '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"capabilities":{}}}'
  frame_line "$ca_open"
  frame_line "$ca_req"
  frame_line '{"jsonrpc":"2.0","id":3,"method":"workspace/executeCommand","params":{"command":"vuna.fixAllLint","arguments":["'"$linty_uri"'"]}}'
  frame_line '{"jsonrpc":"2.0","id":4,"method":"workspace/executeCommand","params":{"command":"vuna.nope","arguments":[]}}'
  frame_line '{"jsonrpc":"2.0","id":5,"method":"shutdown","params":null}'
  frame_line '{"jsonrpc":"2.0","method":"exit","params":null}'
} | "$VUNA" lsp >"$tmp/fixcmd.out" 2>/dev/null
fixcmd_code=$?
fixcmd_out=$(tr -d '\r' <"$tmp/fixcmd.out")
check_eq "command 会话退出码 0" "0" "$fixcmd_code"
check_contains "fix all codeAction 带（且只带）command 字段" "$fixcmd_out" \
  '"command":{"title":"fix all lint findings","command":"vuna.fixAllLint","arguments":["'"$linty_uri"'"]}'
check_contains "executeCommand 回 id 3 result null" "$fixcmd_out" '"id":3,"result":null'
check_contains "服务器发 workspace/applyEdit 请求" "$fixcmd_out" '"method":"workspace/applyEdit"'
check_contains "applyEdit 请求 id 带 vuna-apply 前缀" "$fixcmd_out" '"id":"vuna-apply-'
check_contains "applyEdit 是整文档替换（0..7 行）" "$fixcmd_out" \
  '"range":{"start":{"line":0,"character":0},"end":{"line":7,"character":0}}'
check_contains "applyEdit newText 是 fixLoop 收敛结果" "$fixcmd_out" 'nameArity \"+\" = 2'
check_contains "未知 command → JSON-RPC -32602" "$fixcmd_out" '"code":-32602'
check_contains "未知 command 带命令名" "$fixcmd_out" 'unknown command: vuna.nope'

# ---- 32) C38 case split 的限定 import、命名洞与安全降级 ----
# `import qualified Dep` 时构造子 / record 类型名必须写限定名（Dep.Red / Dep.Point）；
# 命名洞 `?goal` 的编辑 range 覆盖整个 token（不是 `_` 的零宽 span）。
# 降级：axiom 是不透明类型（没有「别名右侧」可展开）→ 空数组；索引族的索引约束是 parse 级
# 拿不到的（枚举全部构造子会写出精化器拒绝的不可达分支）→ 跳过该 binder（同一个洞的其它
# 可分裂 binder，如 `n : Nat`，仍正常给动作）。
mkdir -p "$tmp/splitqws/lib"
printf '[package]\nname = "splitqws"\n\n[dependencies]\nvuna-base = "%s/base"\n' "$repo" >"$tmp/splitqws/vuna.toml"
cat >"$tmp/splitqws/lib/Dep.vuna" <<'VEOF'
module Dep where

data Color : Type where
  Red : Color
  Green : Color

record Point where
  px : Int
  py : Int
VEOF
cat >"$tmp/splitqws/lib/Q.vuna" <<'VEOF'
module Q where

import qualified Dep

pick : Dep.Color -> Int
pick c = _

named : Dep.Color -> Int
named c = ?goal

pickR : Dep.Point -> Int
pickR p = _

axiom Opaque : Type

opq : Opaque -> Int
opq o = _

data Nat : Type where
  Zero : Nat
  Succ : Nat -> Nat

data Vec : Type -> Nat -> Type where
  VNil : (a : Type) -> Vec a Zero
  VCons : (a : Type) -> (n : Nat) -> a -> Vec a n -> Vec a (Succ n)

vhead : (a : Type) -> (n : Nat) -> Vec a (Succ n) -> Int
vhead a n xs = _
VEOF
q_uri="file://$tmp/splitqws/lib/Q.vuna"
q_text='module Q where\n\nimport qualified Dep\n\npick : Dep.Color -> Int\npick c = _\n\nnamed : Dep.Color -> Int\nnamed c = ?goal\n\npickR : Dep.Point -> Int\npickR p = _\n\naxiom Opaque : Type\n\nopq : Opaque -> Int\nopq o = _\n\ndata Nat : Type where\n  Zero : Nat\n  Succ : Nat -> Nat\n\ndata Vec : Type -> Nat -> Type where\n  VNil : (a : Type) -> Vec a Zero\n  VCons : (a : Type) -> (n : Nat) -> a -> Vec a n -> Vec a (Succ n)\n\nvhead : (a : Type) -> (n : Nat) -> Vec a (Succ n) -> Int\nvhead a n xs = _\n'
{
  frame_line '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"capabilities":{}}}'
  frame_line '{"jsonrpc":"2.0","method":"textDocument/didOpen","params":{"textDocument":{"uri":"'"$q_uri"'","languageId":"vuna","version":1,"text":"'"$q_text"'"}}}'
  frame_line '{"jsonrpc":"2.0","id":2,"method":"textDocument/codeAction","params":{"textDocument":{"uri":"'"$q_uri"'"},"range":{"start":{"line":5,"character":9},"end":{"line":5,"character":9}},"context":{"diagnostics":[]}}}'
  frame_line '{"jsonrpc":"2.0","id":3,"method":"textDocument/codeAction","params":{"textDocument":{"uri":"'"$q_uri"'"},"range":{"start":{"line":8,"character":10},"end":{"line":8,"character":10}},"context":{"diagnostics":[]}}}'
  frame_line '{"jsonrpc":"2.0","id":4,"method":"textDocument/codeAction","params":{"textDocument":{"uri":"'"$q_uri"'"},"range":{"start":{"line":11,"character":10},"end":{"line":11,"character":10}},"context":{"diagnostics":[]}}}'
  frame_line '{"jsonrpc":"2.0","id":5,"method":"textDocument/codeAction","params":{"textDocument":{"uri":"'"$q_uri"'"},"range":{"start":{"line":16,"character":8},"end":{"line":16,"character":8}},"context":{"diagnostics":[]}}}'
  frame_line '{"jsonrpc":"2.0","id":6,"method":"textDocument/codeAction","params":{"textDocument":{"uri":"'"$q_uri"'"},"range":{"start":{"line":27,"character":15},"end":{"line":27,"character":15}},"context":{"diagnostics":[]}}}'
  frame_line '{"jsonrpc":"2.0","id":7,"method":"shutdown","params":null}'
  frame_line '{"jsonrpc":"2.0","method":"exit","params":null}'
} | "$VUNA" lsp >"$tmp/splitq.out" 2>/dev/null
check_eq "限定 import case split 会话退出码 0" "0" "$?"
qr2=$(lsp_frame_id "$tmp/splitq.out" 2)
check_contains "限定 import：构造子写限定名（Dep.Red）" "$qr2" \
  '"newText":"case c of\n  Dep.Red => _\n  Dep.Green => _"'
qr3=$(lsp_frame_id "$tmp/splitq.out" 3)
check_contains "命名洞 case split 回 id 3" "$qr3" '"title":"case split on c"'
check_contains "命名洞编辑 range 覆盖整个 ?goal" "$qr3" \
  '"range":{"start":{"line":8,"character":10},"end":{"line":8,"character":15}}'
qr4=$(lsp_frame_id "$tmp/splitq.out" 4)
check_contains "限定 import：record 类型名写限定名（Dep.Point）" "$qr4" \
  '"newText":"case p of\n  Dep.Point { px = _, py = _ } => _"'
qr5=$(lsp_frame_id "$tmp/splitq.out" 5)
check_contains "axiom 不透明类型不给 case split" "$qr5" '"id":5,"result":[]'
qr6=$(lsp_frame_id "$tmp/splitq.out" 6)
check_contains "同洞的 Nat binder 仍给 case split" "$qr6" '"title":"case split on n"'
check_not_contains "索引族 binder（xs : Vec ...）不给 case split（不可达分支风险）" "$qr6" \
  '"title":"case split on xs"'

printf 'lsp: %d passed, %d failed\n' "$pass" "$fail"
[ "$fail" -eq 0 ] && echo "lsp smoke passed"
[ "$fail" -eq 0 ]
