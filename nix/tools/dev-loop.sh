#!/usr/bin/env bash
# 树内开发循环：用同一个编译器（默认 stage 1）增量构建插件包，再把命令交给工作树里的 vuna 入口。
#
# 为什么不直接 `nix run .#vuna`：产品派生一次构建 7 个插件（十几秒到两分钟），而这里只重建
# 你指定的包；对象库沿用宿主 `~/.vuna/store`（`VUNA_STORE` 可覆盖），所以依赖包走接口复用。
# 同机读数与口径见 docs/reference/tooling.md「树内开发循环」。
#
# 用法:
#   nix/tools/dev-loop.sh [-p PKG]... [--all] [--no-build] [--print-env] [--compiler PATH] -- VUNA_ARGS...
#
#   -p, --pkg PKG    构建该包（可重复）。短名: cli / toolchain / dev / web / native / wasm / compiler
#       --all        构建全部插件（cli / toolchain / dev / web / native / wasm；不含 compiler）
#       --no-build   只组装环境，不构建
#       --print-env  打印 `export KEY=VALUE`（可 eval）后退出
#       --compiler P 指定构建/执行用的编译器；默认 stage 1（路径缓存在 .local/dev-loop/compiler）
#   --               之后的参数原样交给 vuna
#
# 例:
#   nix/tools/dev-loop.sh -p toolchain -- fmt --check packages/toolchain
#   nix/tools/dev-loop.sh -p wasm -- compile bench/programs/t1/arith/arith.vuna /tmp/out --target wasm
#   nix/tools/dev-loop.sh -p compiler -- version        # 构建工作树编译器
#   nix/tools/dev-loop.sh --compiler packages/compiler/.output/bin/vuna-compiler -- check .
#   nix/tools/dev-loop.sh --all -- version
#   eval "$(nix/tools/dev-loop.sh --print-env)"
#
# 构建与执行用同一个编译器（默认 stage 1，路径缓存在 .local/dev-loop/compiler）：
# 两处用不同身份会让对象库互相 miss。要试刚构建出的工作树编译器，用
# `--compiler packages/compiler/.output/bin/vuna-compiler`。
set -euo pipefail

ROOT=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/../.." && pwd)
ENTRY_REL=packages/cli/.output/bin/vuna
CORE_PKGS=(vuna vuna-toolchain vuna-dev vuna-plugin-web vuna-target-native vuna-target-wasm)
# 插件发现按目录顺序去重（同一域只取先出现的目录）；compiler 目录由 `--compiler` 决定。
PLUGIN_DIRS=(cli toolchain dev plugin-web target-native target-wasm)

log() { printf '[dev-loop] %s\n' "$*" >&2; }
die() { printf '[dev-loop] error: %s\n' "$*" >&2; exit 2; }

usage() {
  awk 'NR == 1 { next } /^#/ { sub(/^# ?/, ""); print; next } { exit }' "${BASH_SOURCE[0]}"
}

pkg_of_alias() {
  case $1 in
    compiler) printf 'vuna-compiler\n' ;;
    cli) printf 'vuna\n' ;;
    toolchain) printf 'vuna-toolchain\n' ;;
    dev) printf 'vuna-dev\n' ;;
    web) printf 'vuna-plugin-web\n' ;;
    native) printf 'vuna-target-native\n' ;;
    wasm) printf 'vuna-target-wasm\n' ;;
    *) printf '%s\n' "$1" ;;
  esac
}

dir_of_pkg() {
  case $1 in
    vuna-compiler) printf 'compiler\n' ;;
    vuna) printf 'cli\n' ;;
    vuna-toolchain) printf 'toolchain\n' ;;
    vuna-dev) printf 'dev\n' ;;
    vuna-plugin-web) printf 'plugin-web\n' ;;
    vuna-target-native) printf 'target-native\n' ;;
    vuna-target-wasm) printf 'target-wasm\n' ;;
    *) printf '' ;;
  esac
}

build_pkg() {
  local pkg=$1 start
  start=$SECONDS
  log "build $pkg"
  # 构建进度属于诊断输出：stdout 只留最终命令的数据（`--print-env` 会被 eval）。
  if "$COMPILER" build --package "$pkg" "$ROOT" >&2; then
    if [ $((SECONDS - start)) -le 0 ]; then
      log "build $pkg ok (<1s)"
    else
      log "build $pkg ok ($((SECONDS - start))s)"
    fi
  else
    log "build $pkg failed"
    log 'hint: 换分支/rebase 后编译器可能过旧；删掉 .local/dev-loop/compiler 再重试'
    exit 1
  fi
}

has_output() {
  local dir
  dir=$(dir_of_pkg "$1")
  [ -n "$dir" ] && [ -d "$ROOT/packages/$dir/.output" ]
}

resolve_compiler() {
  if [ -n "${compiler_arg:-}" ]; then
    [ -x "$compiler_arg" ] || die "--compiler 不可执行: $compiler_arg"
    printf '%s\n' "$compiler_arg"
    return 0
  fi
  if [ -n "${VUNA_COMPILER:-}" ]; then
    [ -x "$VUNA_COMPILER" ] || die "VUNA_COMPILER 不可执行: $VUNA_COMPILER"
    printf '%s\n' "$VUNA_COMPILER"
    return 0
  fi
  local memo="$ROOT/.local/dev-loop/compiler" memo_bin=
  if [ -z "${VUNA_DEV_LOOP_NO_CACHE:-}" ] && [ -s "$memo" ]; then
    memo_bin=$(cat "$memo")
    if [ -x "$memo_bin" ]; then
      printf '%s\n' "$memo_bin"
      return 0
    fi
  fi
  log 'resolving .#vuna-compiler (stage 1)'
  local out
  out=$(nix build --no-link --print-out-paths "$ROOT#vuna-compiler" | tail -n 1)
  [ -n "$out" ] || die 'nix build .#vuna-compiler 没有返回产物路径'
  mkdir -p "$(dirname -- "$memo")"
  printf '%s/bin/vuna-compiler\n' "$out" >"$memo"
  printf '%s/bin/vuna-compiler\n' "$out"
}

add_exec_dir() {
  local dir=$1
  [ -d "$dir" ] || return 0
  case ":${exec_path:-}:" in
    *":$dir:"*) return 0 ;;
  esac
  if [ -z "${exec_path:-}" ]; then
    exec_path=$dir
  else
    exec_path="$exec_path:$dir"
  fi
}

compiler_arg=
all=0
no_build=0
print_env=0
pkgs=()
args=()

while [ $# -gt 0 ]; do
  case $1 in
    -h | --help)
      usage
      exit 0
      ;;
    -p | --pkg)
      [ $# -ge 2 ] || die "$1 需要参数"
      pkgs+=("$(pkg_of_alias "$2")")
      shift 2
      ;;
    --pkg=*)
      pkgs+=("$(pkg_of_alias "${1#*=}")")
      shift
      ;;
    --all)
      all=1
      shift
      ;;
    --no-build)
      no_build=1
      shift
      ;;
    --print-env)
      print_env=1
      shift
      ;;
    --compiler)
      [ $# -ge 2 ] || die "$1 需要参数"
      compiler_arg=$2
      shift 2
      ;;
    --compiler=*)
      compiler_arg=${1#*=}
      shift
      ;;
    --)
      shift
      args=("$@")
      break
      ;;
    -*)
      die "未知选项 $1（vuna 参数请放在 -- 之后）"
      ;;
    *)
      die "多余参数 $1（包用 -p/--pkg；vuna 参数请放在 -- 之后）"
      ;;
  esac
done

COMPILER=$(resolve_compiler)
log "compiler: $COMPILER"

if [ "$no_build" -eq 0 ]; then
  if [ "$all" -eq 1 ]; then
    for pkg in "${CORE_PKGS[@]}"; do
      build_pkg "$pkg"
    done
  else
    for pkg in "${pkgs[@]}"; do
      build_pkg "$pkg"
    done
    if ! has_output vuna; then
      build_pkg vuna
    fi
    if [ ${#pkgs[@]} -eq 0 ] && ! has_output vuna-toolchain; then
      log 'in-tree toolchain not built yet; building it once'
      build_pkg vuna-toolchain
    fi
  fi
fi

ENTRY=$ROOT/$ENTRY_REL

exec_path=
add_exec_dir "$(dirname -- "$COMPILER")"
for dir in "${PLUGIN_DIRS[@]}"; do
  add_exec_dir "$ROOT/packages/$dir/.output/bin"
done

base_dir=$ROOT/packages/base
[ -f "$base_dir/vuna.toml" ] || die "找不到 base: $base_dir"

wasm_runner=${VUNA_WASM_RUNNER:-}
if [ -z "$wasm_runner" ] && [ -f "$ROOT/wasm-host/run.mjs" ]; then
  wasm_runner=$ROOT/wasm-host/run.mjs
fi

if [ "$print_env" -eq 1 ]; then
  printf 'export VUNA_BASE=%q\n' "$base_dir"
  printf 'export VUNA_EXEC_PATH=%q\n' "$exec_path"
  if [ -n "$wasm_runner" ]; then
    printf 'export VUNA_WASM_RUNNER=%q\n' "$wasm_runner"
  fi
  exit 0
fi

[ -x "$ENTRY" ] || die "找不到工作树入口 $ENTRY_REL；去掉 --no-build，或先 -p cli"

env_args=("VUNA_BASE=$base_dir" "VUNA_EXEC_PATH=$exec_path")
if [ -n "$wasm_runner" ]; then
  env_args+=("VUNA_WASM_RUNNER=$wasm_runner")
fi

exec env "${env_args[@]}" "$ENTRY" "${args[@]}"