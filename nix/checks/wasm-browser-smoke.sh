#!/bin/sh
# 「浏览器可跑面」门禁（nix check，cwd = 仓库根）：
#   1) 纯程序 / 内建宿主效应 / 宿主效应 + 用户 handler 三种形态的产物，在默认特性
#      （关掉 stack switching）下都必须 validate 通过——效应统一由显式效应机器执行，
#      产物不再依赖 stack switching；
#   2) 有 Chromium 时：headless Chromium（CDP）实跑宿主效应产物并比对 stdout。
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
build_pkg "$tmp/host" "host" 'import Base.Effect.Core
import Base.Effect.Console
import Base.Data.Nat

main : Eff [ConsoleOp] Nat
main = consolePrint "hi"
'
build_pkg "$tmp/mixed" "mixed" 'import Base.Effect.Core
import Base.Effect.Console
import Base.Data.Nat

data POp : Type -> Type where
  P : Int -> POp Int

main : Eff [ConsoleOp] Int
main = do
  r <- handle (perform P 3) {
    P n k -> k (n + 1)
  }
  _ <- consolePrint "done"
  pure r
'

# 2) 默认特性下三种形态都必须 validate 通过：浏览器可跑面不依赖 stack switching。
for shape in pure host mixed; do
  if ! wasm-tools validate --features=-stack-switching "$tmp/$shape/out/main.wasm" >"$tmp/$shape.err" 2>&1; then
    echo "FAIL $shape 产物在关闭 stack switching 后 validate 失败（浏览器可跑面应不需要它）："
    sed 's/^/     /' "$tmp/$shape.err"
    exit 1
  fi
done

# 3) 浏览器冒烟（Playwright 驱动；未配置 `VUNA_PLAYWRIGHT` 时 SKIP，与 108 的 Node SKIP 同风格）。
if [ -n "${VUNA_PLAYWRIGHT:-}" ]; then
  # 用命令替换收集输出（`>file` 重定向下 Playwright 的 chromium 包装脚本会挂住）。
  browser_log=""
  if browser_log="$(node test/suite/fixtures/wasm_js_host/browser.mjs \
    "$tmp/host/out/main.wasm" --expect 'hi2
' 2>&1)"; then
    printf '%s\n' "$browser_log" | sed 's/^/     /'
    if browser_log="$(node test/suite/fixtures/wasm_js_host/browser.mjs \
      "$tmp/mixed/out/main.wasm" --expect 'done4
' 2>&1)"; then
      printf '%s\n' "$browser_log" | sed 's/^/     /'
    else
      printf '%s\n' "$browser_log" | sed 's/^/     /'
      exit 1
    fi
  else
    case "$browser_log" in
      *"exited early"* | *"endpoint timeout"* | *"ENOENT"* | *"spawn"* | *"Executable doesn't exist"*)
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
  echo "SKIP browser not configured (VUNA_PLAYWRIGHT)"
fi

echo "wasm browser smoke: ok"
