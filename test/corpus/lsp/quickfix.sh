#!/bin/sh
# LSP 诊断建议 quick fix 集成测试：直接喂 JSON-RPC 帧，断言 codeAction 返回诊断 suggestions。
# 用法：sh quickfix.sh <path-to-vuna>
set -eu
VUNA=$1
case "$VUNA" in /*) ;; *) VUNA=$(cd "$(dirname "$VUNA")" && pwd)/$(basename "$VUNA") ;; esac
tmp=$(mktemp -d /tmp/vuna-qf.XXXXXX) || exit 1
trap 'rm -rf "$tmp"' EXIT INT TERM
pkg="$tmp/pkg"
mkdir -p "$pkg/lib"
cat > "$pkg/vuna.toml" <<'TOML'
[package]
name = "qf"
[export]
modules = ["Lib"]
TOML
cat > "$pkg/lib/Lib.vuna" <<'VUNA'
module Lib where

data T : Type where
  A : T
  B : T

h : T -> Int
h t = case t of
  A => 1
  A => 2
  B => 3

f : Int -> Int
f x = 1
VUNA
uri="file://$pkg/lib/Lib.vuna"
body='{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"processId":null,"rootUri":null,"capabilities":{}}}'
text='module Lib where\n\ndata T : Type where\n  A : T\n  B : T\n\nh : T -> Int\nh t = case t of\n  A => 1\n  A => 2\n  B => 3\n\nf : Int -> Int\nf x = 1\n'
open="{\"jsonrpc\":\"2.0\",\"method\":\"textDocument/didOpen\",\"params\":{\"textDocument\":{\"uri\":\"$uri\",\"languageId\":\"vuna\",\"version\":1,\"text\":\"$text\"}}}"
req="{\"jsonrpc\":\"2.0\",\"id\":2,\"method\":\"textDocument/codeAction\",\"params\":{\"textDocument\":{\"uri\":\"$uri\"},\"range\":{\"start\":{\"line\":0,\"character\":0},\"end\":{\"line\":20,\"character\":0}},\"context\":{\"diagnostics\":[],\"only\":[\"quickfix\"]}}}"
{
  printf 'Content-Length: %d\r\n\r\n%s' "${#body}" "$body"
  printf 'Content-Length: %d\r\n\r\n%s' "${#open}" "$open"
  printf 'Content-Length: %d\r\n\r\n%s' "${#req}" "$req"
} > "$tmp/in.bin"
out=$("$VUNA" lsp < "$tmp/in.bin" 2>/dev/null | tr -d '\r') || true
fail=0
for want in 'remove redundant constructor branch' 'rename unused binder `x` to `_x`'; do
  if ! printf '%s' "$out" | grep -qF "$want"; then
    echo "quickfix: missing action: $want" >&2
    fail=1
  fi
done
if [ "$fail" -ne 0 ]; then
  echo "quickfix: FAILED" >&2
  exit 1
fi
echo "quickfix: ok"
