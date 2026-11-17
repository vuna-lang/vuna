#!/bin/sh
# 「浏览器可跑面」门禁（nix check，cwd = 仓库根）：
#   1) 纯程序 / 只有内建宿主效应的程序：产物在默认特性（关掉 stack switching）下 validate 通过；
#   2) 用户自定义 handler：产物必须仍然要求 stack switching（validate 失败）；
#   3) 有 Chromium 时：headless Chromium（CDP）实跑宿主效应产物并比对 stdout。
#
# 用法：sh wasm-browser-smoke.sh <out-dir>（nix runCommand 传入 $out；本脚本不使用它）
set -eu

tmp=$(mktemp -d "${TMPDIR:-/tmp}/wasmbr.XXXXXX")
trap 'rm -rf "$tmp"' EXIT

build_pkg() {
  d=$1
  mkdir -p "$d/app"
  printf '[package]\nname = "%s"\n\n[dependencies]\nvuna-base = "%s"\n' "$2" "${VUNA_BASE:-$PWD/base}" >"$d/vuna.toml"
  printf '%s' "$3" >"$d/app/Main.vuna"
  (cd "$d" && "$VUNA" build --target wasm --out "$d/out" . >/dev/null)
}

# 1) 三份产物
build_pkg "$tmp/pure" "pure" 'main : Int
main = 42
'
build_pkg "$tmp/host" "host" 'import Base.Eff
import Base.EffConsole
import Base.Nat

main : Eff [ConsoleOp] Nat
main = consolePrint "hi"
'
build_pkg "$tmp/user" "user" 'import Base.Eff

data POp : Type -> Type where
  P : Int -> POp Int

main : Int
main = runPure (handle (perform P 3) {
  P n k -> k (n + 1)
}
)
'

# 2) 默认特性下的 validate：浏览器可跑面必须过，用户 handler 必须不过。
wasm-tools validate --features=-stack-switching "$tmp/pure/out/main.wasm"
wasm-tools validate --features=-stack-switching "$tmp/host/out/main.wasm"

if wasm-tools validate --features=-stack-switching "$tmp/user/out/main.wasm" >"$tmp/user.err" 2>&1; then
  echo "FAIL 用户 handler 的产物在关闭 stack switching 后仍然 validate 通过（应被拒绝）"
  exit 1
fi
if ! grep -q "stack switching" "$tmp/user.err"; then
  echo "FAIL 用户 handler 的产物被拒，但原因不是 stack switching："
  sed 's/^/     /' "$tmp/user.err"
  exit 1
fi

# 3) headless Chromium 冒烟（缺浏览器时 SKIP，与 108 的 Node SKIP 同风格）。
CHROME=${VUNA_CHROMIUM:-}
if [ -n "$CHROME" ] && [ -x "$CHROME" ]; then
  # 用命令替换收集输出（`>file` 重定向下 Playwright 的 chromium 包装脚本会挂住）。
  browser_log=""
  if browser_log="$(VUNA_CHROMIUM="$CHROME" node test/suite/fixtures/wasm_js_host/browser.mjs \
    "$tmp/host/out/main.wasm" --expect 'hi2
' 2>&1)"; then
    printf '%s\n' "$browser_log" | sed 's/^/     /'
  else
    case "$browser_log" in
      *"exited early"* | *"endpoint timeout"* | *"ENOENT"* | *"spawn"*)
        # 构建沙箱里浏览器可能起不来（缺 /dev/shm、seccomp 等）：按 SKIP 处理，
        # validate 那一半仍然是硬门。
        echo "SKIP chromium cannot start in this environment:"
        printf '%s\n' "$browser_log" | sed 's/^/     /' | head -14
        ;;
      *)
        printf '%s\n' "$browser_log" | sed 's/^/     /'
        exit 1
        ;;
    esac
  fi
else
  echo "SKIP chromium not found"
fi

echo "wasm browser smoke: ok"