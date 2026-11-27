#!/bin/sh
# 回归（issue #36）：路由层 `vuna` 被 kill 后，它起的插件子进程（`vuna-dev`）必须一起退出。
#
# 用法：sh test/corpus/plugin-kill/smoke.sh <path-to-vuna>
#
# 做法：起一个长驻插件命令（`vuna dev obs serve --cdp unix:PATH`，不带 trace 也保持监听），
# 在路由层的后代里找到真正在跑的 `vuna-dev`，`kill -TERM` 路由层，断言插件在宽限窗口内
# 退出（僵尸态也算退出：容器里的 init 未必回收）。
#
# 插件子进程留在前台进程组（交互插件读终端才不会被 SIGTTIN 停住），因此这里不用
# `timeout` / `setsid` 这类进程组包装——它们会掩盖「信号没有转发到插件」这种回归。
set -u

[ "$#" -ge 1 ] || {
  echo "usage: sh test/corpus/plugin-kill/smoke.sh <path-to-vuna>" >&2
  exit 2
}
VUNA=$1
[ -x "$VUNA" ] || {
  echo "smoke: not an executable vuna: $VUNA" >&2
  exit 2
}

tmp=$(mktemp -d "${TMPDIR:-/tmp}/pkill.XXXXXX") || exit 1
# socket 路径里带空格与单引号：路由层把 argv 拼进 `sh -c` 的命令行，引号转义写错会在这里
# 直接暴露（插件收不到正确的 `--cdp` 地址，就绪行不会出现）。
mkdir -p "$tmp/it's dir" || exit 1
sock="$tmp/it's dir/s.sock"
router=''
pass=0
fail=0

cleanup() {
  if [ -n "$router" ]; then
    kill -KILL "$router" 2>/dev/null || true
    wait "$router" 2>/dev/null || true
  fi
  rm -rf "$tmp"
}
trap cleanup EXIT INT TERM

ok() { pass=$((pass + 1)); printf 'ok   %s\n' "$1"; }
no() {
  fail=$((fail + 1))
  printf 'FAIL %s\n' "$1"
  if [ "$#" -gt 1 ]; then shift; printf '%s\n' "$*" | head -8; fi
}

children_of() { cat "/proc/$1/task/$1/children" 2>/dev/null || true; }

# 进程状态字符；进程不在（或读不到）给 gone。僵尸也算已退出（Z）。
state_of() {
  if [ -r "/proc/$1/stat" ]; then
    sed 's/.*) \(.\).*/\1/' "/proc/$1/stat" 2>/dev/null || echo gone
  else
    echo gone
  fi
}

alive_of() {
  case $(state_of "$1") in
    gone | Z) return 1 ;;
    *) return 0 ;;
  esac
}

cmdline_of() { tr '\0' ' ' <"/proc/$1/cmdline" 2>/dev/null || true; }

# 后代里第一个 `vuna-dev dev obs serve`（深度优先）。
find_plugin() {
  for p in $(children_of "$1"); do
    case $(cmdline_of "$p") in
      *vuna-dev\ dev\ obs\ serve*) echo "$p"; return 0 ;;
    esac
    got=$(find_plugin "$p")
    if [ -n "$got" ]; then
      echo "$got"
      return 0
    fi
  done
  return 1
}

"$VUNA" dev obs serve --cdp "unix:$sock" >"$tmp/router.log" 2>"$tmp/router.err" &
router=$!

i=0
while [ "$i" -lt 200 ]; do
  grep -q '^listening ' "$tmp/router.log" 2>/dev/null && break
  alive_of "$router" || break
  i=$((i + 1))
  sleep 0.05
done

if ! grep -q '^listening ' "$tmp/router.log" 2>/dev/null; then
  no "router: obs serve became ready" "$(cat "$tmp/router.log" "$tmp/router.err" 2>/dev/null | head -8)"
else
  ok "router: obs serve became ready"

  child=$(find_plugin "$router")
  if [ -z "$child" ]; then
    no "router: plugin child (vuna-dev) found" "$(cmdline_of "$router")"
  else
    ok "router: plugin child (vuna-dev) found (pid $child)"

    kill -TERM "$router" 2>/dev/null
    i=0
    while [ "$i" -lt 100 ] && alive_of "$child"; do
      i=$((i + 1))
      sleep 0.05
    done
    if alive_of "$child"; then
      no "kill router -> plugin child exits" "still running: $(cmdline_of "$child")"
    else
      ok "kill router -> plugin child exits"
    fi

    i=0
    while [ "$i" -lt 100 ] && alive_of "$router"; do
      i=$((i + 1))
      sleep 0.05
    done
    if alive_of "$router"; then
      no "kill router -> router exits"
    else
      ok "kill router -> router exits"
    fi
    wait "$router" 2>/dev/null || true
    router=''
  fi
fi

printf '\n%s passed, %s failed\n' "$pass" "$fail"
[ "$fail" = "0" ] || exit 1
exit 0