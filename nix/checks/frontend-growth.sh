#!/bin/sh
# vuna-frontend-growth：前端（词法 / 语法分析 / trivia + 格式化）的**增长率**门槛。
#
# 合成「N 个同形定义」的单文件探针，每档用独立进程、独立空 `VUNA_STORE` 跑两次：
#   1. `vuna check` + `VUNA_OBS=1`：从 trace 里取 `vuna.parse.lex` / `vuna.parse.syntax`
#      的 `totalUs`（`docs/reference/observability.md` §3.3 的插桩点）；
#   2. `vuna fmt --check`：覆盖第二条词法通道（注释）与渲染，是工具侧真实路径。
#
# 断言：相邻档（N→2N）的比值不超过阈值（默认 2.5，同 compiler-growth 的噪声余量）。
# 绝对时间跨机器不可比，增长率可比；线性路径比值 ≈2，出现 n²（例如「每个 token 都从
# 行首扫一遍」这类退化）会明显越界。可用 `VUNA_FRONTEND_MAX_RATIO_MILLI` 覆盖。
#
# 为什么单独一条：`compiler-growth` 看的是整条 check 的墙钟，前端只占其中几个百分点，
# n² 的前端会被精化的固定成本掩盖；这里把 lex / syntax / fmt 的读数直接拿出来比。
set -eu
out=${1:?usage: frontend-growth.sh OUT}
: "${VUNA:?VUNA 未设置}"

MAX_RATIO_MILLI=${VUNA_FRONTEND_MAX_RATIO_MILLI:-2500}
BASE=$PWD/packages/base
work=$(mktemp -d "${TMPDIR:-/tmp}/vuna-frontend-growth.XXXXXX")
trap 'rm -rf "$work"' EXIT INT TERM
mkdir -p "$out"
out=$(CDPATH= cd -- "$out" && pwd)

# 探针自带 manifest：否则会按 cwd 的 /build/vuna.toml（workspace）解析，沙箱里
# 缺少 workspace 成员目录时会报 PKG_MissingManifest（与 compiler-growth 同一做法）。
probe="$work/probe"
mkdir -p "$probe"
printf '[package]\nname = "frontend-probe"\n\n[dependencies]\nvuna-base = "%s"\n' "$BASE" >"$probe/vuna.toml"

gen_probe() { # n file
  n=$1 file=$2
  : >"$file"
  i=1
  while [ "$i" -le "$n" ]; do
    # 顶层声明之间 fmt 要求一个空行；文件末尾不留空行（否则 --check 会要重排）。
    if [ "$i" -gt 1 ]; then printf '\n' >>"$file"; fi
    printf 'f%s : Int\nf%s = %s\n' "$i" "$i" "$i" >>"$file"
    i=$((i + 1))
  done
}

span_us() { # summary-json span-name -> µs（缺失输出空串）
  grep -o "{\"name\":\"$2\"[^}]*}" "$1" | sed -n 's/.*"totalUs":\([0-9][0-9]*\).*/\1/p' | head -1
}

best_us() { # file -> "lex syntax"（两次独立冷跑取最小）
  f=$1
  lex_best=999999999
  syn_best=999999999
  k=0
  while [ "$k" -lt 2 ]; do
    cache=$(mktemp -d "$work/cache.XXXXXX")
    dir="$cache/trace"
    VUNA_STORE="$cache/store" TMPDIR="$cache" VUNA_OBS=1 VUNA_OBS_DIR="$dir" \
      "$VUNA" check "$f" >"$cache/check.out" 2>&1 || {
      echo "frontend-growth: check failed for $f" >&2
      cat "$cache/check.out" >&2
      exit 1
    }
    trace=$(find "$dir" -name '*.jsonl' -type f | head -1)
    [ -n "$trace" ] || {
      echo "frontend-growth: no trace produced for $f" >&2
      exit 1
    }
    "$VUNA" obs summarize --json "$trace" >"$cache/summary.json" 2>"$cache/summary.err" || {
      echo "frontend-growth: obs summarize --json failed for $f" >&2
      cat "$cache/summary.err" >&2
      exit 1
    }
    lex=$(span_us "$cache/summary.json" vuna.parse.lex)
    syn=$(span_us "$cache/summary.json" vuna.parse.syntax)
    [ -n "$lex" ] && [ -n "$syn" ] || {
      echo "frontend-growth: trace misses vuna.parse.lex / vuna.parse.syntax spans" >&2
      exit 1
    }
    [ "$lex" -lt "$lex_best" ] && lex_best=$lex
    [ "$syn" -lt "$syn_best" ] && syn_best=$syn
    rm -rf "$cache"
    k=$((k + 1))
  done
  printf '%s %s\n' "$lex_best" "$syn_best"
}

best_fmt_ms() { # file -> ms（两次独立冷跑取最小；fmt --check 只做「是否已格式化」判定）
  f=$1
  best=999999
  k=0
  while [ "$k" -lt 2 ]; do
    cache=$(mktemp -d "$work/cache.XXXXXX")
    t0=$(date +%s%3N)
    VUNA_STORE="$cache/store" TMPDIR="$cache" "$VUNA" fmt --check "$f" >"$cache/fmt.out" 2>&1 || {
      echo "frontend-growth: fmt --check failed for $f (probe should be canonical)" >&2
      cat "$cache/fmt.out" >&2
      exit 1
    }
    t1=$(date +%s%3N)
    ms=$((t1 - t0))
    [ "$ms" -lt "$best" ] && best=$ms
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
    echo "frontend-growth: $label grew $prev -> $cur (ratio $((cur * 100)) / 100, max $((MAX_RATIO_MILLI / 1000)).$((MAX_RATIO_MILLI % 1000 / 100))x)" >&2
    return 1
  fi
  return 0
}

report="$out/frontend-growth.txt"
: >"$report"
prev_n=0
prev_lex=0
prev_syn=0
prev_fmt=0
for n in 2000 4000 8000; do
  f="$probe/p$n.vuna"
  gen_probe "$n" "$f"
  read -r lex syn <<EOF
$(best_us "$f")
EOF
  fmt_ms=$(best_fmt_ms "$f")
  printf 'n=%-5s lex=%sus syntax=%sus fmt-check=%sms\n' "$n" "$lex" "$syn" "$fmt_ms" | tee -a "$report"
  if [ "$prev_n" -gt 0 ]; then
    check_ratio "parse.lex (n=$prev_n -> $n)" "$prev_lex" "$lex" || exit 1
    check_ratio "parse.syntax (n=$prev_n -> $n)" "$prev_syn" "$syn" || exit 1
    check_ratio "fmt --check (n=$prev_n -> $n)" "$prev_fmt" "$fmt_ms" || exit 1
  fi
  prev_n=$n
  prev_lex=$lex
  prev_syn=$syn
  prev_fmt=$fmt_ms
done

echo "frontend-growth: ok (max ratio $((MAX_RATIO_MILLI / 1000)).$((MAX_RATIO_MILLI % 1000 / 100))x, report in $report)"
