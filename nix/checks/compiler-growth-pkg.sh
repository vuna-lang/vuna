#!/bin/sh
# vuna-compiler-growth-incremental：**包路径增量 check** 的增长率门槛。
#
# 背景：`compiler-growth.sh` 只测单文件 `vuna check <file>`，走的是全量精化路径，
# 覆盖不到「包级 check 的增量收尾」（`dtFinishPackageScoped` 的 globals 去重、写接口、
# 终止性 own 判定）——这些曾经是 O(n²)：N=4000 的增量 check 比冷 check 还慢（1.58s vs
# 0.49s），而单文件探针完全看不出来。
#
# 口径：合成「可执行包」= lib/Mod.vuna（N 个同形 `fi : Int` 定义）+ app/Main.vuna。
# 每档先用独立空 TMPDIR 跑一次 `vuna check <pkg>` 建接口缓存，再用**独立进程 + 独立
# TMPDIR** 计时第二次（增量路径），两次取小。相邻档（N→2N）墙钟比不得超过阈值。
# 绝对时间跨机器不可比，增长率可比；这是对 `bench/compiler.sh --check` 的补充。
#
# 阈值默认 3.3×/翻倍（比单文件门槛的 2.5 宽；2026-11-13 实测 N=4000 2.49、N=8000 3.14，
# 且同一探针本二进制 4.5s vs 旧基线 9.2s）：增量 check 里有与 N 无关的固定成本
# （接口读取/写回、依赖摘要校验），N 小时比值噪声更大；O(n²) 回归在 N=8000 档
# 会远超 3.3，仍会被挡住。可用 `VUNA_GROWTH_MAX_RATIO_MILLI`（千分比）临时覆盖。
set -eu
out=${1:?usage: compiler-growth-pkg.sh OUT}
: "${VUNA:?VUNA 未设置}"

MAX_RATIO_MILLI=${VUNA_GROWTH_MAX_RATIO_MILLI:-3300}
BASE=$PWD/base
work=$(mktemp -d "${TMPDIR:-/tmp}/vuna-growth-pkg.XXXXXX")
trap 'rm -rf "$work"' EXIT INT TERM

gen_mod() { # n file
  n=$1 file=$2
  : >"$file"
  i=1
  while [ "$i" -le "$n" ]; do
    printf 'export f%s : Int\nf%s = %s\n' "$i" "$i" "$i" >>"$file"
    i=$((i + 1))
  done
}

# 依赖包（vuna-base）的接口必须先落盘：否则每档探针都因「依赖接口缺失」走全量路径，
# 测的就变成冷精化而不是增量收尾（本门槛要守的正是后者）。
dep_cache=$(mktemp -d "$work/cache.XXXXXX")
TMPDIR="$dep_cache" "$VUNA" check "$BASE" >/dev/null 2>&1 || {
  echo "compiler-growth-pkg: dependency check failed for $BASE" >&2
  exit 1
}
rm -rf "$dep_cache"

mk_probe() { # n dir
  n=$1 dir=$2
  mkdir -p "$dir/lib" "$dir/app"
  printf '[package]\nname = "growth-pkg-%s"\n\n[export]\nmodules = ["Mod"]\n\n[dependencies]\nvuna-base = "%s"\n' \
    "$n" "$BASE" >"$dir/vuna.toml"
  gen_mod "$n" "$dir/lib/Mod.vuna"
  printf 'import Mod\n\nmain : Int\nmain = f1\n' >"$dir/app/Main.vuna"
}

# 冷跑一次（建 iface 缓存）后，独立进程计时两次取小。
time_incremental() { # dir -> ms
  dir=$1
  cache=$(mktemp -d "$work/cache.XXXXXX")
  TMPDIR="$cache" "$VUNA" check "$dir" >/dev/null 2>&1 || {
    echo "compiler-growth-pkg: cold check failed for $dir" >&2
    exit 1
  }
  rm -rf "$cache"
  best=999999
  k=0
  while [ "$k" -lt 3 ]; do
    cache=$(mktemp -d "$work/cache.XXXXXX")
    t0=$(date +%s%3N)
    TMPDIR="$cache" "$VUNA" check "$dir" >/dev/null 2>&1 || {
      echo "compiler-growth-pkg: incremental check failed for $dir" >&2
      exit 1
    }
    t1=$(date +%s%3N)
    rm -rf "$cache"
    ms=$((t1 - t0))
    [ "$ms" -lt "$best" ] && best=$ms
    k=$((k + 1))
  done
  printf '%s\n' "$best"
}

n=1000
prev=""
printf 'compiler-growth-pkg: max ratio %s.%03s\n' "$((MAX_RATIO_MILLI / 1000))" "$((MAX_RATIO_MILLI % 1000))"
while [ "$n" -le 8000 ]; do
  dir="$work/probe$n"
  mk_probe "$n" "$dir"
  ms=$(time_incremental "$dir")
  if [ -n "$prev" ]; then
    # ratio 用千分比避免浮点：ratio*1000 = ms*1000/prev
    ratio_milli=$((ms * 1000 / prev))
    printf '  N=%-5s %6s ms  (x%s.%03d)\n' "$n" "$ms" "$((ratio_milli / 1000))" "$((ratio_milli % 1000))"
    if [ "$ratio_milli" -gt "$MAX_RATIO_MILLI" ]; then
      echo "FAIL: incremental growth ratio $((ratio_milli / 1000)).$(printf '%03d' $((ratio_milli % 1000))) > $((MAX_RATIO_MILLI / 1000)).$(printf '%03d' $((MAX_RATIO_MILLI % 1000))) at N=$n (prev=${prev}ms, cur=${ms}ms)" >&2
      exit 1
    fi
  else
    printf '  N=%-5s %6s ms  (base)\n' "$n" "$ms"
  fi
  prev=$ms
  n=$((n * 2))
done

touch "$out/ok"