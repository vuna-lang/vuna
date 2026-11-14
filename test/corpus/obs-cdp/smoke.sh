#!/bin/sh
# `vuna obs serve --cdp` + `nix/obs-cdp-bridge.mjs` 的冒烟（suite e2e tier 用）。
#
# 用法：sh test/corpus/obs-cdp/smoke.sh <path-to-vuna>
#   可选环境：VUNA_BASE（vuna-base 目录，默认 <repo>/base）；SKIP_BRIDGE=1 只测 serve。
#
# 覆盖：
#   1) 造一份带 `vuna.sample.cpu` 的 trace（小包 + obsSample + VUNA_OBS=3）；
#   2) `serve --cdp unix:PATH`：就绪行、六条请求（getIsolateId/enable/setSamplingInterval/
#      start/stop/未知方法）、`Profiler.stop` 的 `samples` 数 == trace 里的 cpu 采样数、
#      未知方法 `-32601`、退出时删 socket；
#   3) 同一 trace 两次独立 serve 的 `profile` 逐字节一致（CAPTURE_DIR + cmp）；
#   4) 内容性失败（没 start 就 stop / 无 cpu 采样的 trace）= `-32000` + 退出码 1；
#      参数错误（缺 `--cdp`、坏 ADDR、TRACE 不存在）= 退出码 2；
#   5) 有 Node 时：桥的 `/json/version` `/json/list` + WS 握手 + 三条 Profiler 方法 +
#      ping/pong（`ws-client.mjs` 独立算 `Sec-WebSocket-Accept` 并校验）。
#      没有 Node 就打印 SKIP（与 `56_repl_server.steps` 的 TCP 沙箱 SKIP 同风格）。
#
# 为什么不进 `nix flake check`：需要 Node + 端口（沙箱不保证）；serve 本身无外部依赖，
# 由 suite 的 e2e tier 覆盖。
set -u

[ "$#" -ge 1 ] || {
  echo "usage: sh test/corpus/obs-cdp/smoke.sh <path-to-vuna>" >&2
  exit 2
}
VUNA=$1
[ -x "$VUNA" ] || {
  echo "smoke: not an executable vuna: $VUNA" >&2
  exit 2
}
HERE=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
REPO=$(CDPATH= cd -- "$HERE/../../.." && pwd)
VUNA_BASE=${VUNA_BASE:-$REPO/base}
BRIDGE=$REPO/nix/obs-cdp-bridge.mjs

# socket 路径要短（sun_path 上限 108 字节）。
tmp=$(mktemp -d "${TMPDIR:-/tmp}/ocdp.XXXXXX") || exit 1
sock=$tmp/cdp.sock
pass=0
fail=0
srv_pid=''

cleanup() {
  if [ -n "$srv_pid" ]; then kill "$srv_pid" 2>/dev/null || true; fi
  if [ "${KEEP_TMP:-0}" = "1" ]; then echo "tmp kept: $tmp"; else rm -rf "$tmp"; fi
}
trap cleanup EXIT INT TERM

ok() {
  pass=$((pass + 1))
  printf 'ok   %s\n' "$1"
}
no() {
  fail=$((fail + 1))
  printf 'FAIL %s\n' "$1"
  if [ "$#" -gt 1 ]; then shift; printf '%s\n' "$*" | head -8; fi
}

wait_ready() { # logfile timeout_ticks
  i=0
  while [ "$i" -lt "$2" ]; do
    grep -q '^listening ' "$1" 2>/dev/null && return 0
    i=$((i + 1))
    sleep 0.05
  done
  return 1
}

start_serve() { # trace log -> sets srv_pid, prints addr-less; returns 0/1
  sv_trace=$1
  log=$2
  : >"$log"
  "$VUNA" obs serve --cdp "unix:$sock" "$sv_trace" >"$log" 2>"$log.err" &
  srv_pid=$!
  wait_ready "$log" 400 && return 0
  printf 'serve did not print a readiness line\n' >&2
  cat "$log.err" >&2 2>/dev/null || true
  return 1
}

stop_serve() {
  if [ -n "$srv_pid" ]; then
    kill "$srv_pid" 2>/dev/null || true
    wait "$srv_pid" 2>/dev/null || true
    srv_pid=''
  fi
}

# ---------------------------------------------------------------- 1) 造采样 trace
pkg=$tmp/app
mkdir -p "$pkg/app"
printf '[package]\nname = "cdpapp"\n\n[dependencies]\nvuna-base = "%s"\n' "$VUNA_BASE" >"$pkg/vuna.toml"
printf 'import Base.List\nimport Base.Obs.Span\n\nwork : List Int -> Int\nwork Nil = 0\nwork (Cons x xs) = x * 3 + work xs\n\nmain : Int\nmain = obsSample "cpu" 1000 (\\_ => work (range 0 400000))\n' >"$pkg/app/Main.vuna"
if ! "$VUNA" build --out "$tmp/app-out" "$pkg" >"$tmp/build.log" 2>&1; then
  cat "$tmp/build.log" >&2
  echo "smoke: build failed" >&2
  exit 2
fi
VUNA_OBS=3 VUNA_OBS_SAMPLE=cpu VUNA_OBS_DIR="$tmp/trace" "$tmp/app-out/bin/cdpapp" >/dev/null 2>&1 || {
  echo "smoke: sampled run failed" >&2
  exit 2
}
trace=$(find "$tmp/trace" -name '*.jsonl' -type f | head -1)
[ -n "$trace" ] || {
  echo "smoke: no trace produced" >&2
  exit 2
}
cpu=$(grep -c '"name":"vuna.sample.cpu"' "$trace" || true)
[ "$cpu" -gt 0 ] || {
  echo "smoke: trace has no cpu samples (workload too short?)" >&2
  exit 2
}
echo "cpu samples in trace: $cpu"
pid=$(sed -n 's/.*"pid":\([0-9][0-9]*\).*/\1/p' "$trace" | head -1)

# ---------------------------------------------------------------- 2) serve 正常路径
mkdir -p "$tmp/cap-a"
if start_serve "$trace" "$tmp/serve-a.log"; then
  if node "$HERE/cdp-client.mjs" "unix:$sock" "$HERE/requests.json" "$tmp/cap-a" >"$tmp/client-a.log" 2>&1; then
    ok "serve: six CDP requests"
  else
    no "serve: six CDP requests" "$(cat "$tmp/client-a.log")"
  fi
  grep -q "result={\"id\":\"vuna-$pid\"}" "$tmp/client-a.log" && ok "serve: getIsolateId = trace pid" \
    || no "serve: getIsolateId = trace pid" "$(cat "$tmp/client-a.log")"
  grep -q 'result.profile' "$tmp/client-a.log" && ok "serve: Profiler.stop returned a profile" \
    || no "serve: Profiler.stop returned a profile"
  grep -q 'error code=-32601' "$tmp/client-a.log" && ok "serve: unknown method -> -32601" \
    || no "serve: unknown method -> -32601"
  samples=$(sed -n 's/.*result.profile nodes=[0-9]* samples=\([0-9]*\).*/\1/p' "$tmp/client-a.log" | head -1)
  [ "$samples" = "$cpu" ] && ok "serve: profile samples == cpu samples ($cpu)" \
    || no "serve: profile samples == cpu samples" "expected $cpu, got $samples"
  stop_serve
  [ -e "$sock" ] && no "serve: unix socket removed on exit" || ok "serve: unix socket removed on exit"
else
  no "serve: startup"
fi

# ---------------------------------------------------------------- 3) 确定性
mkdir -p "$tmp/cap-b"
if start_serve "$trace" "$tmp/serve-b.log"; then
  node "$HERE/cdp-client.mjs" "unix:$sock" "$HERE/requests.json" "$tmp/cap-b" >"$tmp/client-b.log" 2>&1 || true
  stop_serve
  a=$tmp/cap-a/frame-4.json
  b=$tmp/cap-b/frame-4.json
  if [ -f "$a" ] && [ -f "$b" ] && cmp -s "$a" "$b"; then
    ok "serve: profile is deterministic across processes"
  else
    no "serve: profile is deterministic across processes"
  fi
else
  no "serve: startup (determinism)"
fi

# 与 `convert --to cpuprofile` 同一构造点 ⇒ 逐字节一致。
if "$VUNA" obs convert --to cpuprofile --out "$tmp/convert.json" "$trace" >/dev/null 2>&1 && [ -f "$tmp/cap-a/frame-4.json" ]; then
  cmp -s "$tmp/convert.json" "$tmp/cap-a/frame-4.json" && ok "serve: profile == convert --to cpuprofile" \
    || no "serve: profile == convert --to cpuprofile"
else
  no "serve: profile == convert --to cpuprofile" "convert failed"
fi

# ---------------------------------------------------------------- 4) 错误路径
# 4a 没 start 就 stop → -32000 + 退出码 1。
printf '[{"method":"Profiler.stop","params":{}}]\n' >"$tmp/nostart.json"
if start_serve "$trace" "$tmp/serve-nostart.log"; then
  node "$HERE/cdp-client.mjs" "unix:$sock" "$tmp/nostart.json" >"$tmp/client-nostart.log" 2>&1
  node_rc=$?
  wait "$srv_pid" 2>/dev/null
  serve_rc=$?
  srv_pid=''
  grep -q 'error code=-32000' "$tmp/client-nostart.log" && ok "serve: stop without start -> -32000" \
    || no "serve: stop without start -> -32000" "$(cat "$tmp/client-nostart.log")"
  [ "$serve_rc" = "1" ] && ok "serve: content failure exits 1" || no "serve: content failure exits 1" "got $serve_rc"
else
  no "serve: startup (nostart)"
fi

# 4b 无 cpu 采样的 trace → -32000 + 退出码 1。
printf '{"ph":"M","name":"vuna.obs.schema","pid":1,"tid":0,"args":{"schema":"vuna-obs 1"}}\n{"ph":"X","ts":1,"pid":1,"tid":0,"name":"app.x","cat":"vuna.user","dur":1,"args":{}}\n' >"$tmp/nocpu.jsonl"
if start_serve "$tmp/nocpu.jsonl" "$tmp/serve-nocpu.log"; then
  node "$HERE/cdp-client.mjs" "unix:$sock" "$tmp/nostart.json" >"$tmp/client-nocpu.log" 2>&1
  wait "$srv_pid" 2>/dev/null
  serve_rc=$?
  srv_pid=''
  grep -q 'error code=-32000' "$tmp/client-nocpu.log" && ok "serve: no cpu samples -> -32000" \
    || no "serve: no cpu samples -> -32000" "$(cat "$tmp/client-nocpu.log")"
  [ "$serve_rc" = "1" ] && ok "serve: no cpu samples exits 1" || no "serve: no cpu samples exits 1" "got $serve_rc"
else
  no "serve: startup (nocpu)"
fi

# 4c 参数/前提错误 → 退出码 2。
"$VUNA" obs serve >"$tmp/arg1.log" 2>&1
[ "$?" = "2" ] && ok "serve: missing --cdp exits 2" || no "serve: missing --cdp exits 2"
"$VUNA" obs serve --cdp tcp:0.0.0.0:9229 "$trace" >"$tmp/arg2.log" 2>&1
[ "$?" = "2" ] && ok "serve: non-loopback ADDR exits 2" || no "serve: non-loopback ADDR exits 2"
"$VUNA" obs serve --cdp "unix:$sock" "$tmp/nope.jsonl" >"$tmp/arg3.log" 2>&1
[ "$?" = "2" ] && ok "serve: missing TRACE exits 2" || no "serve: missing TRACE exits 2"

# ---------------------------------------------------------------- 5) WS 桥（可选）
if [ "${SKIP_BRIDGE:-0}" = "1" ]; then
  echo "SKIP bridge (SKIP_BRIDGE=1)"
else
  if ! command -v node >/dev/null 2>&1; then
    echo "SKIP bridge (node not on PATH)"
  elif [ ! -f "$BRIDGE" ]; then
    echo "SKIP bridge (missing $BRIDGE)"
  else
    node "$BRIDGE" --port 0 "$trace" >"$tmp/bridge.log" 2>"$tmp/bridge.err" &
    bridge_pid=$!
    i=0
    while [ "$i" -lt 400 ]; do
      grep -q '^bridge listening ' "$tmp/bridge.log" 2>/dev/null && break
      i=$((i + 1))
      sleep 0.05
    done
    if grep -q '^bridge listening ' "$tmp/bridge.log" 2>/dev/null; then
      base=$(sed -n 's/^bridge listening \(http[^ ]*\).*/\1/p' "$tmp/bridge.log" | head -1)
      if node "$HERE/ws-client.mjs" "$base" "$tmp" >"$tmp/ws.log" 2>&1; then
        ok "bridge: WS handshake + Profiler.* + ping/pong"
      else
        no "bridge: WS handshake + Profiler.* + ping/pong" "$(cat "$tmp/ws.log")"
      fi
      if [ -f "$tmp/ws-profile.json" ] && [ -f "$tmp/cap-a/frame-4.json" ] && cmp -s "$tmp/ws-profile.json" "$tmp/cap-a/frame-4.json"; then
        ok "bridge: profile matches serve profile"
      else
        no "bridge: profile matches serve profile"
      fi
    else
      no "bridge: startup" "$(cat "$tmp/bridge.err" 2>/dev/null)"
    fi
    kill "$bridge_pid" 2>/dev/null || true
    wait "$bridge_pid" 2>/dev/null || true
  fi
fi

printf '\n%s passed, %s failed\n' "$pass" "$fail"
[ "$fail" = "0" ] || exit 1
exit 0
