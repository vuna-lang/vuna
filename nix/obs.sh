#!/bin/sh
# 观测的外部生态配方（`docs/reference/observability.md` §8）：把 trace 与 DWARF 接到
# Chrome / Perfetto / speedscope / 火焰图 / Linux perf / gdb。
#
# 用法（在仓库根或任意目录）：
#   sh nix/obs.sh trace   -- <cmd...>       用 VUNA_OBS=2 跑命令，打印 trace 路径
#   sh nix/obs.sh flame   <trace...>        转 folded 栈（有 flamegraph.pl 时顺带出 SVG）
#   sh nix/obs.sh speed   <trace...>        转 speedscope JSON（可直接拖进 speedscope.app）
#   sh nix/obs.sh cpuprof <trace...>        转 .cpuprofile（Chrome DevTools 的 Performance 面板）
#   sh nix/obs.sh dwarf   [OUTDIR]          readelf 断言 DWARF 行表指向 `.vuna`（默认 .output）
#   sh nix/obs.sh perf    -- <cmd...>       perf record -g 跑命令并还原 `.vuna` 帧（需 perf + 权限）
#
# 工具缺失时给可操作提示而不是 127：`perf` / `gdb` / `flamegraph.pl` 都**不在**默认
# devShell（避免构建图变重）；按需 `nix shell nixpkgs#perf nixpkgs#FlameGraph`。
#
# 设计约束（规范 §8）：
#   * 本脚本**不进** `nix flake check`：`perf record` 需要 `perf_event_paranoid` 权限，
#     Nix 沙箱与 CI 常拒（`perf_event_open` denied）；
#   * 不重写任何 vuna 逻辑：trace 生成靠运行时（`VUNA_OBS*`），换算靠 `vuna obs convert`，
#     DWARF 靠 `ocamlopt -g` + `#line` 注入；
#   * 输出路径一律显式打印，便于与 `vuna obs summarize` 串起来。
set -eu

VUNA=${VUNA:-}

here=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd) || exit 1

find_vuna() {
  if [ -n "$VUNA" ]; then
    printf '%s\n' "$VUNA"
  elif [ -x "$here/result/bin/vuna" ]; then
    printf '%s\n' "$here/result/bin/vuna"
  elif command -v vuna >/dev/null 2>&1; then
    command -v vuna
  else
    echo "obs: cannot find vuna (build it with 'nix build .#vuna --out-link result')" >&2
    exit 2
  fi
}

need() { # tool hint
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "obs: '$1' is not on PATH. $2" >&2
    exit 2
  fi
}

split_args() { # sets $CMD (1) when '--' is present
  saw_sep=0
  for a in "$@"; do
    if [ "$a" = "--" ]; then
      saw_sep=1
      continue
    fi
    if [ "$saw_sep" = "1" ]; then
      CMD="${CMD:-}${CMD:+ }$a"
    fi
  done
}

usage() {
  sed -n '2,20p' "$0" | sed 's/^# \{0,1\}//'
  exit 2
}

mode=${1:-}
[ -n "$mode" ] || usage
shift || true

case "$mode" in
  trace)
    split_args "$@"
    [ -n "${CMD:-}" ] || usage
    bin=$(find_vuna)
    # 每次用全新 trace 目录，避免把上一轮的文件算进来。
    dir=${VUNA_OBS_DIR:-"$(mktemp -d "${TMPDIR:-/tmp}/vuna-obs-sh.XXXXXX")"}
    VUNA_OBS=${VUNA_OBS:-2} VUNA_OBS_DIR="$dir" sh -c "exec $bin $CMD" || rc=$?
    find "$dir" -name '*.jsonl' -type f -print 2>/dev/null || true
    exit ${rc:-0}
    ;;

  flame|speed|cpuprof)
    bin=$(find_vuna)
    [ "$#" -gt 0 ] || usage
    fmt=folded
    [ "$mode" = "speed" ] && fmt=speedscope
    [ "$mode" = "cpuprof" ] && fmt=cpuprofile
    out=${OUT:-"$(pwd)/vuna-obs-$fmt.out"}
    "$bin" obs convert --to "$fmt" --out "$out" "$@" || exit $?
    printf 'wrote %s\n' "$out"
    if [ "$mode" = "flame" ] && command -v flamegraph.pl >/dev/null 2>&1; then
      flamegraph.pl "$out" > "${out%.out}.svg" 2>/dev/null && printf 'wrote %s\n' "${out%.out}.svg"
    elif [ "$mode" = "flame" ]; then
      echo "obs: 'flamegraph.pl' not on PATH; folded stacks are in $out (nix shell nixpkgs#FlameGraph)" >&2
    fi
    ;;

  dwarf)
    outdir=${1:-.output}
    [ -d "$outdir" ] || { echo "obs: no such directory: $outdir" >&2; exit 2; }
    need readelf "Install binutils (it is in the default devShell)."
    bins=$(find "$outdir" -type f -perm -u+x -maxdepth 3 2>/dev/null | head -3 || true)
    if [ -z "$bins" ]; then
      # `--no-compile` 不再产出可执行文件：退化成检查产物里的 `#line` 指令。
      mls=$(find "$outdir" -maxdepth 1 -name '*.ml' -type f | head -20)
      [ -n "$mls" ] || { echo "obs: no executable or .ml under $outdir (run 'vuna build' first)" >&2; exit 2; }
      grep -hE '^# [0-9]+ "' $mls | head -20
      echo "obs: no executable found; showing #line directives instead (build without --no-compile for DWARF)"
      exit 0
    fi
    rc=0
    for b in $bins; do
      printf '== %s\n' "$b"
      readelf --debug-dump=decodedline "$b" 2>/dev/null | grep -E '\.vuna' | head -10 || {
        echo "obs: no .vuna lines in $b (was it built with -g and a compiler that injects #line?)" >&2
        rc=1
      }
    done
    exit "$rc"
    ;;

  perf)
    split_args "$@"
    [ -n "${CMD:-}" ] || usage
    need perf "perf needs privileges: 'nix shell nixpkgs#perf' (and lower perf_event_paranoid / run as root); Nix sandbox usually denies perf_event_open."
    need perf
    bin=$(find_vuna)
    data=${PERF_DATA:-"$(pwd)/vuna-perf.data"}
    # shellcheck disable=SC2086
    perf record -g -o "$data" -- "$bin" $CMD
    echo "--- hot lines (perf script, .vuna frames first) ---"
    perf script -i "$data" 2>/dev/null | grep -oE '[A-Za-z0-9_./-]+\.vuna:[0-9]+' | sort | uniq -c | sort -rn | head -20
    printf 'perf data: %s (perf report -i %s for the full view)\n' "$data" "$data"
    ;;

  *)
    usage
    ;;
esac
