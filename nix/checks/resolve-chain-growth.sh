#!/bin/sh
# vuna-resolve-chain-growth：名字收集对**长中缀链**的增长率门槛。
#
# 重排后的左结合链是左嵌套（`((a+b)+c)+…`）。`unusedImportWarnings` 的引用名收集如果
# 按层 `append (左子结果) …`，复制量随链深度平方增长；合成 `g = 1 + 1 + …`（N 项）的
# 单文件探针，从 trace 取 `vuna.resolve.warn` 的 `totalUs`，相邻档（N→2N）比值有上界
# （默认 2.5，与其它增长率门槛同一噪声余量）。
#
# 为什么单独一条：这项成本只在长链上显形，真实源码受 100 列格式化约束、链很短，
# `compiler-growth` 那类「N 个同形定义」的探针看不见它。可用
# `VUNA_RESOLVE_CHAIN_MAX_RATIO_MILLI` 覆盖阈值。
set -eu
out=${1:?usage: resolve-chain-growth.sh OUT}
: "${VUNA:?VUNA 未设置}"

MAX_RATIO_MILLI=${VUNA_RESOLVE_CHAIN_MAX_RATIO_MILLI:-2500}
BASE=$PWD/packages/base
work=$(mktemp -d "${TMPDIR:-/tmp}/vuna-resolve-chain.XXXXXX")
trap 'rm -rf "$work"' EXIT INT TERM
mkdir -p "$out"
out=$(CDPATH= cd -- "$out" && pwd)

# 探针自带 manifest：否则会按 cwd 的 workspace manifest 解析，沙箱里缺成员目录会
# 报 PKG_MissingManifest（与 compiler-growth / frontend-growth 同一做法）。
probe="$work/probe"
mkdir -p "$probe"
printf '[package]\nname = "chain-probe"\n\n[dependencies]\nvuna-base = "%s"\n' "$BASE" >"$probe/vuna.toml"

gen_probe() { # n file
  n=$1 file=$2
  printf 'g : Int\ng = 1' >"$file"
  i=1
  while [ "$i" -lt "$n" ]; do
    printf ' + 1' >>"$file"
    i=$((i + 1))
  done
  printf '\n' >>"$file"
}

span_us() { # summary-json span-name -> µs（缺失输出空串）
  grep -o "{\"name\":\"$2\"[^}]*}" "$1" | sed -n 's/.*"totalUs":\([0-9][0-9]*\).*/\1/p' | head -1
}

best_us() { # file -> `vuna.resolve.warn` µs（两次独立冷跑取最小）
  f=$1
  best=999999999
  k=0
  while [ "$k" -lt 2 ]; do
    cache=$(mktemp -d "$work/cache.XXXXXX")
    dir="$cache/trace"
    VUNA_STORE="$cache/store" TMPDIR="$cache" VUNA_OBS=1 VUNA_OBS_DIR="$dir" \
      "$VUNA" check "$f" >"$cache/check.out" 2>&1 || {
      echo "resolve-chain-growth: check failed for $f" >&2
      cat "$cache/check.out" >&2
      exit 1
    }
    trace=$(find "$dir" -name '*.jsonl' -type f | head -1)
    [ -n "$trace" ] || {
      echo "resolve-chain-growth: no trace produced for $f" >&2
      exit 1
    }
    "$VUNA" dev obs summarize --json "$trace" >"$cache/summary.json" 2>"$cache/summary.err" || {
      echo "resolve-chain-growth: obs summarize --json failed for $f" >&2
      cat "$cache/summary.err" >&2
      exit 1
    }
    us=$(span_us "$cache/summary.json" vuna.resolve.warn)
    [ -n "$us" ] || {
      echo "resolve-chain-growth: trace misses the vuna.resolve.warn span" >&2
      exit 1
    }
    [ "$us" -lt "$best" ] && best=$us
    rm -rf "$cache"
    k=$((k + 1))
  done
  printf '%s\n' "$best"
}

# 相邻档比值（避免浮点：a/b ≤ MAX/1000）。
check_ratio() { # label prev cur
  label=$1 prev=$2 cur=$3
  [ "$prev" -gt 0 ] || return 0
  if [ $((cur * 1000)) -gt $((prev * MAX_RATIO_MILLI)) ]; then
    echo "resolve-chain-growth: $label grew $prev -> $cur (ratio $((cur * 100)) / 100, max $((MAX_RATIO_MILLI / 1000)).$((MAX_RATIO_MILLI % 1000 / 100))x)" >&2
    return 1
  fi
  return 0
}

report="$out/resolve-chain-growth.txt"
: >"$report"
prev_n=0
prev_us=0
for n in 2000 4000 8000; do
  f="$probe/p$n.vuna"
  gen_probe "$n" "$f"
  us=$(best_us "$f")
  printf 'n=%-5s resolve.warn=%sus\n' "$n" "$us" | tee -a "$report"
  if [ "$prev_n" -gt 0 ]; then
    check_ratio "vuna.resolve.warn (n=$prev_n -> $n)" "$prev_us" "$us" || exit 1
  fi
  prev_n=$n
  prev_us=$us
done

echo "resolve-chain-growth: ok (max ratio $((MAX_RATIO_MILLI / 1000)).$((MAX_RATIO_MILLI % 1000 / 100))x, report in $report)"