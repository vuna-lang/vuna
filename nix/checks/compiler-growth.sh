#!/bin/sh
# vuna-compiler-growth：编译器**增长率**门槛。
#
# 合成「N 个同形定义」的探针，分别用独立进程、**独立空 `VUNA_STORE`** 跑 `vuna check`；
# 断言相邻档（N→2N）的墙钟比不超过阈值。绝对时间跨机器不可比，但**增长率**可比：
# 线性路径的比值 ≈2；出现 n²/n³ 或逐档翻倍时会明显越界。这是对
# `bench/compiler.sh --check`（同机绝对基线，软/硬阈值）的补充，进 `nix flake check`。
#
# 为什么显式隔离 `VUNA_STORE`：`TMPDIR` 只影响 AST/单元缓存，**接口与单元对象在
# `VUNA_STORE`**；devShell 里本地跑时 `VUNA_STORE` 是已预热的 `.local/store`，于是各档
# 共享热 store，读数被磨平（同一二进制在 N=8000 上是 400 ms 还是 2.2 s 完全取决于这一点）。
# CI 的 mkCheck 没有 `VUNA_STORE`、`HOME=/homeless-shelter`，天然落在
# `$TMPDIR/vuna-store`；本地必须显式喂空目录才能复现同一口径。
#
# 上限取 N=8000：n² 段（codegen 分组）在 4000 档还只是 2.3×，到 8000 才越过门槛
# （500/1000/2000/4000/8000 = 163/197/318/735/2230 ms，8000 档 3.03×）。
# 阈值留了噪声余量（短探针里进程启动 + 固定加载占相当比例；串行 flake 实测同一二进制
# 在 2.30–2.40 间抖动，故取 2.5）；校准依据见
# docs/reference/performance.md §5。可用 `VUNA_GROWTH_MAX_RATIO_MILLI`（千分比）临时覆盖。
set -eu
out=${1:?usage: compiler-growth.sh OUT}
: "${VUNA:?VUNA 未设置}"

MAX_RATIO_MILLI=${VUNA_GROWTH_MAX_RATIO_MILLI:-2500}
BASE=$PWD/packages/base
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

gen_deep_probe() { # depth file —— `x : Maybe (Maybe … Int)`，层数 = depth
  depth=$1 file=$2
  ty=Int
  i=0
  while [ "$i" -lt "$depth" ]; do
    ty="Maybe ($ty)"
    i=$((i + 1))
  done
  printf 'x : %s\nx = Nothing\n' "$ty" >"$file"
}

time_check() { # file -> ms (min of 2 independent cold runs)
  f=$1
  best=999999
  k=0
  while [ "$k" -lt 2 ]; do
    cache=$(mktemp -d "$work/cache.XXXXXX")
    t0=$(date +%s%3N)
    rc=0
    VUNA_STORE="$cache/store" TMPDIR="$cache" timeout "${VUNA_GROWTH_TIMEOUT:-120}" "$VUNA" check "$f" >"$cache/check.log" 2>&1 || rc=$?
    if [ "$rc" -ne 0 ]; then
      echo "compiler-growth: check failed for $f (rc=$rc, 超时上限 ${VUNA_GROWTH_TIMEOUT:-120}s)" >&2
      sed -n '1,20p' "$cache/check.log" >&2
      exit 1
    fi
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
while [ "$n" -le 8000 ]; do
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

# 嵌套类型构造子：运行时类型渲染必须随层数线性。渲染器若先把族实参渲染成表交给
# intrinsic 探测、非 intrinsic 族再丢弃这份结果重渲染，每层乘 2（depth 32 就会越过超时）。
deep_prev=""
for depth in 32 64; do
  f="$probe/deep$depth.vuna"
  gen_deep_probe "$depth" "$f"
  ms=$(time_check "$f")
  if [ -n "$deep_prev" ]; then
    ratio_milli=$((ms * 1000 / deep_prev))
    printf '  depth=%-3s %6s ms  (x%s.%03s)\n' "$depth" "$ms" "$((ratio_milli / 1000))" "$((ratio_milli % 1000))"
    if [ "$ratio_milli" -gt "$MAX_RATIO_MILLI" ]; then
      echo "FAIL: 嵌套类型构造子 growth ratio $((ratio_milli / 1000)).$((ratio_milli % 1000)) > $((MAX_RATIO_MILLI / 1000)).$((MAX_RATIO_MILLI % 1000)) at depth=$depth (prev=${deep_prev}ms, cur=${ms}ms)" >&2
      exit 1
    fi
  else
    printf '  depth=%-3s %6s ms  (base)\n' "$depth" "$ms"
  fi
  deep_prev=$ms
done

touch "$out/ok"
