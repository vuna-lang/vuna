#!/bin/sh
# checks.vuna-native-codegen-growth：native codegen 对两类形状的**增长率**门槛。
#
# 探针在 `packages/target-native` 的 codegen 上有两个已知的退化形状：
#   - 右深标量链（`1 + (2 + (3 + … x))`）：`genScalarBinOrdered` 的匹配回溯按深度乘 3；
#   - 多顶层闭包（`g0 … gN`）：调用点内联后 `main` 是一条长加法链，同样撞上标量回溯。
# 两者都表现为「N 刚过几百就 >120 s 不返回」，所以门槛同时卡**绝对上限**（每档必须在
# `timeout` 内完成，超时即失败）与**增长率**（相邻档 `t(4N) <= 6*t(N) + 5s`；线性 ≈2×，
# 给进程启动与固定加载留噪声余量）。绝对时间不通机器比，增长率可比。
#
# 每档用**独立空 `VUNA_STORE`**：宿主若已有热 store，读数会被缓存稀释，指数级也可能被
# 磨平成常数（口径同 compiler-growth）。可用 `VUNA_NATIVE_GROWTH_TIMEOUT`（秒）覆盖上限。
set -eu
out=${1:?usage: native-codegen-growth.sh OUT}
: "${VUNA:?VUNA 未设置}"

BASE=${VUNA_BASE:-$PWD/packages/base}
LIMIT=${VUNA_NATIVE_GROWTH_TIMEOUT:-120}
RATIO_MAX=6
SLACK_MS=5000

mkdir -p "$out"
work=$(mktemp -d "${TMPDIR:-/tmp}/vuna-native-growth.XXXXXX")
trap 'rm -rf "$work"' EXIT INT TERM

gen_right_deep() { # n file —— f x = (1 + (2 + (… + x)))，括号右结合
  n=$1 file=$2
  expr=x
  i=$n
  while [ "$i" -ge 1 ]; do
    expr="($i + $expr)"
    i=$((i - 1))
  done
  printf 'f : Int -> Int\nf x = %s\n\nmain : Int\nmain = f 1\n' "$expr" >"$file"
}

gen_top_closures() { # n file —— g0 … gN 顶层闭包，main 逐个调用后求和
  n=$1 file=$2
  : >"$file"
  sum=""
  i=0
  while [ "$i" -le "$n" ]; do
    printf 'g%s : Int -> Int\ng%s = \\x => x + %s\n\n' "$i" "$i" "$i" >>"$file"
    if [ -z "$sum" ]; then
      sum="g$i 1"
    else
      sum="$sum + g$i 1"
    fi
    i=$((i + 1))
  done
  printf 'main : Int\nmain = %s\n' "$sum" >>"$file"
}

measure() { # probe pkg dest -> 墙钟 ms 到 stdout
  probe=$1 pkg=$2 dest=$3
  cache=$(mktemp -d "$work/cache.XXXXXX")
  t0=$(date +%s%3N)
  rc=0
  VUNA_STORE="$cache/store" TMPDIR="$cache" timeout "$LIMIT" \
    "$VUNA" build --target native --out "$dest" "$pkg" >"$cache/build.log" 2>&1 || rc=$?
  t1=$(date +%s%3N)
  if [ "$rc" -ne 0 ]; then
    if [ "$rc" -eq 124 ]; then
      echo "check: native-codegen-growth 超时：probe=$probe 在 ${LIMIT}s 上限内未返回" >&2
    else
      echo "check: native-codegen-growth 构建失败：probe=$probe rc=$rc" >&2
    fi
    sed -n '1,40p' "$cache/build.log" >&2
    exit 1
  fi
  printf '%s\n' "$((t1 - t0))"
}

for probe in right-deep top-closures; do
  prev=""
  for n in 100 400 800; do
    pkg="$work/$probe-$n"
    mkdir -p "$pkg/app"
    printf '[package]\nname = "native-growth-%s"\n\n[dependencies]\nvuna-base = "%s"\n' \
      "$probe" "$BASE" >"$pkg/vuna.toml"
    case $probe in
      right-deep) gen_right_deep "$n" "$pkg/app/Main.vuna" ;;
      top-closures) gen_top_closures "$n" "$pkg/app/Main.vuna" ;;
    esac

    ms=$(measure "$probe" "$pkg" "$work/out/$probe-$n")
    printf 'probe=%s N=%s %sms\n' "$probe" "$n" "$ms"

    if [ -n "$prev" ]; then
      bound=$((RATIO_MAX * prev + SLACK_MS))
      if [ "$ms" -gt "$bound" ]; then
        echo "check: native-codegen-growth 增长率超界：probe=$probe N=$n ${ms}ms > ${RATIO_MAX}*${prev}ms+${SLACK_MS}ms = ${bound}ms" >&2
        exit 1
      fi
    fi
    prev=$ms
  done
done

echo "native-codegen-growth: ok"
touch "$out/ok"