#!/bin/sh
# vuna-web 静态页面 + 路由的冒烟（suite e2e tier 用）。
#
# 用法：sh test/corpus/web/static-smoke.sh <path-to-vuna>
# 覆盖：build examples/web-static → 起 `tcp:127.0.0.1:0` → 用 curl 断言状态码、正文、
# Content-Type、405 的 Allow、HEAD、尾斜杠归一、百分号解码 + 文本转义。
# 没有 curl 时打印 SKIP（与 obs-cdp 缺 Node 时同风格）；端口在沙箱不保证，故不进 nix flake check。
set -u

[ "$#" -ge 1 ] || {
  echo "usage: sh test/corpus/web/static-smoke.sh <path-to-vuna>" >&2
  exit 2
}
VUNA=$1
[ -x "$VUNA" ] || {
  echo "smoke: not an executable vuna: $VUNA" >&2
  exit 2
}
HERE=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
REPO=$(CDPATH= cd -- "$HERE/../../.." && pwd)
APP=$REPO/examples/web-static

tmp=$(mktemp -d "${TMPDIR:-/tmp}/vweb.XXXXXX") || exit 1
srv_pid=''
pass=0
fail=0

cleanup() {
  if [ -n "$srv_pid" ]; then kill "$srv_pid" 2>/dev/null || true; fi
  rm -rf "$tmp"
}
trap cleanup EXIT INT TERM

ok() {
  pass=$((pass + 1))
  printf 'ok   %s\n' "$1"
}
no() {
  fail=$((fail + 1))
  printf 'FAIL %s\n' "$1"
  if [ "$#" -gt 1 ]; then shift; printf '%s\n' "$*" | head -6; fi
}

if ! "$VUNA" build --out "$tmp/out" "$APP" >"$tmp/build.log" 2>&1; then
  cat "$tmp/build.log" >&2
  echo "smoke: build failed" >&2
  exit 2
fi

"$tmp/out/bin/web-static" "tcp:127.0.0.1:0" >"$tmp/serve.log" 2>"$tmp/serve.err" &
srv_pid=$!
i=0
while [ "$i" -lt 400 ]; do
  grep -q '^listening ' "$tmp/serve.log" 2>/dev/null && break
  i=$((i + 1))
  sleep 0.05
done
addr=$(sed -n 's/^listening //p' "$tmp/serve.log" | head -1)
if [ -z "$addr" ]; then
  echo "smoke: serve did not become ready" >&2
  cat "$tmp/serve.err" >&2 2>/dev/null || true
  exit 2
fi
port=${addr##*:}
base="http://127.0.0.1:$port"

if ! command -v curl >/dev/null 2>&1; then
  echo "SKIP web e2e (curl not on PATH)"
else
  body=$(curl -sS "$base/" 2>/dev/null)
  printf '%s' "$body" | grep -q '<h1>Home</h1>' && ok "GET /" || no "GET /" "$body"

  body=$(curl -sS "$base/about" 2>/dev/null)
  printf '%s' "$body" | grep -q '<h1>About</h1>' && ok "GET /about" || no "GET /about" "$body"

  body=$(curl -sS "$base/users/42" 2>/dev/null)
  printf '%s' "$body" | grep -q 'user 42' && ok "GET /users/42" || no "GET /users/42" "$body"

  body=$(curl -sS "$base/users/42/" 2>/dev/null)
  printf '%s' "$body" | grep -q 'user 42' && ok "trailing slash normalized" || no "trailing slash normalized" "$body"

  code=$(curl -sS -o /dev/null -w '%{http_code}' "$base/nope" 2>/dev/null)
  [ "$code" = "404" ] && ok "unknown path -> 404" || no "unknown path -> 404" "got $code"

  headers=$(curl -sS -i -X DELETE "$base/users/42" 2>/dev/null)
  printf '%s' "$headers" | head -1 | grep -q ' 405 ' && ok "wrong method -> 405" || no "wrong method -> 405" "$headers"
  printf '%s' "$headers" | grep -qi '^allow:.*GET' && ok "405 carries Allow" || no "405 carries Allow" "$headers"

  code=$(curl -sS -I -o /dev/null -w '%{http_code}' "$base/" 2>/dev/null)
  [ "$code" = "200" ] && ok "HEAD /" || no "HEAD /" "got $code"
  length=$(curl -sS -I "$base/" 2>/dev/null | tr -d '\r' | sed -n 's/^[Cc]ontent-[Ll]ength: //p' | head -1)
  [ -n "$length" ] && [ "$length" -gt 0 ] && ok "HEAD keeps Content-Length" || no "HEAD keeps Content-Length" "got $length"

  headers=$(curl -sS -i "$base/" 2>/dev/null)
  printf '%s' "$headers" | grep -qi '^content-type: text/html; charset=utf-8' && ok "Content-Type" || no "Content-Type" "$headers"

  body=$(curl -sS "$base/echo/%3Cscript%3E" 2>/dev/null)
  printf '%s' "$body" | grep -q '&lt;script&gt;' && ok "percent-decode + escape" || no "percent-decode + escape" "$body"
fi

printf '\n%s passed, %s failed\n' "$pass" "$fail"
[ "$fail" = "0" ] || exit 1
exit 0