#!/bin/sh
# vuna-compiler-growth：编译器**增长率**门槛（M34.6 C33）。
#
# 合成「N 个同形定义」的探针，分别用独立进程、独立空 TMPDIR 跑 `vuna check`；
# 断言相邻档（N→2N）的墙钟比不超过阈值。绝对时间跨机器不可比，但**增长率**可比：
# 线性路径的比值 ≈2；出现 n²/n³ 或逐档翻倍时会明显越界。这是对
# `bench/compiler.sh --check`（同机绝对基线，软/硬阈值）的补充，进 `nix flake check`。
#
# 阈值留了噪声余量（短探针里进程启动 + 固定加载占相当比例）；校准依据见
# docs/reference/performance.md §5。可用 `VUNA_GROWTH_MAX_RATIO_MILLI`（千分比）临时覆盖。
set -eu
out=${1:?usage: compiler-growth.sh OUT}
: "${VUNA:?VUNA 未设置}"

MAX_RATIO_MILLI=${VUNA_GROWTH_MAX_RATIO_MILLI:-2300}
BASE=$PWD/base
work=$(mktemp -d "${TMPDIR:-/tmp}/vuna-growth.XXXXXX")
trap 'rm -rf "$work"' EXIT INT TERM

probe="$work/probe"
mkdir -p "$probe"
printf '[package]\nname = "growth-probe"\n\n[dependencies]\nvuna-base = "%s"\n' "$BASE" >"$probe/vuna.toml"

gen_probe() { # n file
  n=$1 file=$2
  : >"$file"
  i=1
  while [ "$i" -le "$n" ]; do
    printf 'f%s : Int\nf%s = %s\n' "$i" "$i" "$i" >>"$file"
    i=$((i + 1))
  done
}

time_check() { # file -> ms (min of 2 independent cold runs)
  f=$1
  best=999999
  k=0
  while [ "$k" -lt 2 ]; do
    cache=$(mktemp -d "$work/cache.XXXXXX")
    t0=$(date +%s%3N)
    TMPDIR="$cache" "$VUNA" check "$f" >/dev/null 2>&1 || {
      echo "compiler-growth: check failed for $f" >&2
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

n=500
prev=""
printf 'compiler-growth: max ratio %s.%03s\n' "$((MAX_RATIO_MILLI / 1000))" "$((MAX_RATIO_MILLI % 1000))"
while [ "$n" -le 4000 ]; do
  f="$probe/p$n.vuna"
  gen_probe "$n" "$f"
  ms=$(time_check "$f")
  if [ -n "$prev" ]; then
    # ratio 用千分比避免浮点：ratio*1000 = ms*1000/prev
    ratio_milli=$((ms * 1000 / prev))
    printf '  N=%-5s %6s ms  (x%s.%s)\n' "$n" "$ms" "$((ratio_milli / 1000))" "$((ratio_milli % 1000))"
    if [ "$ratio_milli" -gt "$MAX_RATIO_MILLI" ]; then
      echo "FAIL: growth ratio $((ratio_milli / 1000)).$((ratio_milli % 1000)) > $((MAX_RATIO_MILLI / 1000)).$((MAX_RATIO_MILLI % 1000)) at N=$n (prev=${prev}ms, cur=${ms}ms)" >&2
      exit 1
    fi
  else
    printf '  N=%-5s %6s ms  (base)\n' "$n" "$ms"
  fi
  prev=$ms
  n=$((n * 2))
done

touch "$out/ok"