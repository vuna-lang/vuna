#!/bin/sh
# vuna-compiler-growth-ctor：**构造子密集 + 反向依赖**探针的增长率门槛。
#
# 单形 `fi : Int` 探针（compiler-growth.sh）测不到两件事：
#   1. 构造子 / 类型参数表的查找随族数增长（每个定义按名字找构造子形状）；
#   2. 组间定序的最坏形状——源码序与依赖序相反（`f0` 依赖 `f1`…）。
# 本探针是一个**类型链**：`data Di where Ci : D(i+1) -> Di`，定义 `fi = Ci f(i+1)`。
# 构造子表大小 = N、依赖方向与源码序相反（`f0` 依赖 `f1`…），同时覆盖两件事。
#
# 阈值放宽到 3.5：这条路径上 elab / 前端占比高（codegen check 单次 <1 ms），
# 500→1000→2000 实测相邻档 1.7–2.6×（机器负载敏感），它只作**粗粒度**回退护栏；
# 精确的 codegen 读数走 `bench/compiler.sh` 与 docs/reference/performance.md。
# 口径同 compiler-growth.sh：独立进程、独立空 `VUNA_STORE`、相邻档（N→2N）墙钟比
# 有上界；绝对时间跨机器不可比。可用 `VUNA_GROWTH_MAX_RATIO_MILLI` 临时覆盖阈值。
set -eu
out=${1:?usage: compiler-growth-ctor.sh OUT}
mkdir -p "$out"
: "${VUNA:?VUNA 未设置}"

MAX_RATIO_MILLI=${VUNA_GROWTH_MAX_RATIO_MILLI:-3500}
BASE=$PWD/base
work=$(mktemp -d "${TMPDIR:-/tmp}/vuna-growth-ctor.XXXXXX")
trap 'rm -rf "$work"' EXIT INT TERM

probe="$work/probe"
mkdir -p "$probe"
printf '[package]\nname = "growth-ctor"\n\n[dependencies]\nvuna-base = "%s"\n' "$BASE" >"$probe/vuna.toml"

gen_probe() { # n file
  n=$1 file=$2
  : >"$file"
  printf 'import Prelude\n\n' >>"$file"
  i=0
  while [ "$i" -lt "$n" ]; do
    next=$((i + 1))
    printf 'data D%s : Type where\n  C%s : D%s -> D%s\n' "$i" "$i" "$next" "$i" >>"$file"
    i=$next
  done
  printf 'data D%s : Type where\n  C%s : Int -> D%s\n\n' "$n" "$n" "$n" >>"$file"
  i=0
  while [ "$i" -lt "$n" ]; do
    next=$((i + 1))
    printf 'f%s : D%s\nf%s = C%s f%s\n' "$i" "$i" "$i" "$i" "$next" >>"$file"
    i=$next
  done
  printf 'f%s : D%s\nf%s = C%s 0\n' "$n" "$n" "$n" "$n" >>"$file"
}

time_check() { # file -> ms (min of 2 independent cold runs)
  f=$1
  best=999999
  k=0
  while [ "$k" -lt 2 ]; do
    cache=$(mktemp -d "$work/cache.XXXXXX")
    t0=$(date +%s%3N)
    VUNA_STORE="$cache/store" TMPDIR="$cache" "$VUNA" check "$f" >/dev/null 2>&1 || {
      echo "compiler-growth-ctor: check failed for $f" >&2
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
printf 'compiler-growth-ctor: max ratio %d.%03d\n' "$((MAX_RATIO_MILLI / 1000))" "$((MAX_RATIO_MILLI % 1000))"
while [ "$n" -le 2000 ]; do
  f="$probe/p$n.vuna"
  gen_probe "$n" "$f"
  ms=$(time_check "$f")
  if [ -n "$prev" ]; then
    ratio_milli=$((ms * 1000 / prev))
    printf '  N=%-5s %6s ms  (x%d.%03d)\n' "$n" "$ms" "$((ratio_milli / 1000))" "$((ratio_milli % 1000))"
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
