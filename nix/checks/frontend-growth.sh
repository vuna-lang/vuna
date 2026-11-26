#!/bin/sh
# vuna-frontend-growth：前端（词法 / 语法分析 / trivia + 格式化）的**增长率**门槛。
#
# 合成「N 个同形定义」的单文件探针，每轮按档交错、各档用独立进程与独立空
# `VUNA_STORE` 跑五次（见文末采样循环）：
#   1. `vuna check` + `VUNA_OBS=1`：从 trace 里取 `vuna.parse.lex` / `vuna.parse.syntax`
#      的 `totalUs`（`docs/reference/observability.md` §3.3 的插桩点）；
#   2. `vuna fmt --check`：覆盖第二条词法通道（注释）与渲染，是工具侧真实路径。
#
# 断言（绝对时间跨机器不可比，增长率可比；线性路径比值 ≈2）：
#   - `fmt --check` CPU：相邻档（N→2N）≤ 2.5（同 compiler-growth 的噪声余量）；
#   - trace 的 lex / syntax：只作 N→4N 的窗口断言（≤ 8）。它们按 span 名聚合，
#     包含整个 base 闭包的解析，而 M 个基础模块是固定成本；编译器自身运行时的
#     16MB minor heap 在 2k→4k 还会跨过一次回收台阶，相邻档容易被固定成本与 GC
#     台阶拉成假超线性。4x 窗口里线性 ≈4、n² ≈16，仍能稳定区分。
# 可用 `VUNA_FRONTEND_MAX_RATIO_MILLI` / `VUNA_FRONTEND_MAX_OVERALL_MILLI` 覆盖。
#
# 计时口径是 **CPU**，不是墙钟：trace 里的 `totalUs` 是墙钟，`nix flake check` 并发构建
# 其他 check 时会把它拉长（越大越长的探针越容易撞上，产生假回归）。这里用同一进程窗口的
# `times` 子进程 CPU / 墙钟比例把 span 折算成 CPU 时间，`fmt --check` 也直接取 CPU 时间；
# CPU 只随真实工作量增长，增长率仍可比。
#
# 为什么单独一条：`compiler-growth` 看的是整条 check 的墙钟，前端只占其中几个百分点，
# n² 的前端会被精化的固定成本掩盖；这里把 lex / syntax / fmt 的读数直接拿出来比。
set -eu
out=${1:?usage: frontend-growth.sh OUT}
: "${VUNA:?VUNA 未设置}"

MAX_RATIO_MILLI=${VUNA_FRONTEND_MAX_RATIO_MILLI:-2500}
MAX_OVERALL_MILLI=${VUNA_FRONTEND_MAX_OVERALL_MILLI:-8000}
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

stamp_times() { # file —— 保存 shell 的子进程累计时间（第 2 行）
  times >"$1"
}

child_cpu_ms() { # file -> 子进程 user+sys 毫秒
  awk 'NR == 2 {
    ms = 0
    for (i = 1; i <= NF; i++) {
      split($i, p, "m")
      s = p[2]
      sub(/s$/, "", s)
      ms += p[1] * 60000 + s * 1000
    }
    printf "%d\n", ms
  }
  END { if (NR < 2) print 0 }' "$1"
}

one_us() { # file -> "lex syntax"（单次独立冷跑，span 折算成 CPU µs）
  f=$1
  cache=$(mktemp -d "$work/cache.XXXXXX")
  dir="$cache/trace"
  stamp_times "$cache/times-before"
  t0=$(date +%s%3N)
  VUNA_STORE="$cache/store" TMPDIR="$cache" VUNA_OBS=1 VUNA_OBS_DIR="$dir" \
    "$VUNA" check "$f" >"$cache/check.out" 2>&1 || {
    echo "frontend-growth: check failed for $f" >&2
    cat "$cache/check.out" >&2
    exit 1
  }
  t1=$(date +%s%3N)
  stamp_times "$cache/times-after"
  wall_ms=$((t1 - t0))
  cpu_ms=$(($(child_cpu_ms "$cache/times-after") - $(child_cpu_ms "$cache/times-before")))
  # 用这个进程窗口的 CPU 占比把墙钟 span 折算成 CPU 时间。CPU 不应超过墙钟；
  # 读数异常（时钟精度 / 子进程统计）时退回墙钟，宁可噪声也不除零。
  [ "$wall_ms" -le 0 ] && wall_ms=1
  if [ "$cpu_ms" -le 0 ] || [ "$cpu_ms" -gt "$wall_ms" ]; then
    cpu_ms=$wall_ms
  fi
  trace=$(find "$dir" -name '*.jsonl' -type f | head -1)
  [ -n "$trace" ] || {
    echo "frontend-growth: no trace produced for $f" >&2
    exit 1
  }
  "$VUNA" dev obs summarize --json "$trace" >"$cache/summary.json" 2>"$cache/summary.err" || {
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
  lex=$((lex * cpu_ms / wall_ms))
  syn=$((syn * cpu_ms / wall_ms))
  rm -rf "$cache"
  printf '%s %s\n' "$lex" "$syn"
}

one_fmt_ms() { # file -> CPU ms（单次独立冷跑；fmt --check 只做「是否已格式化」判定）
  f=$1
  cache=$(mktemp -d "$work/cache.XXXXXX")
  stamp_times "$cache/times-before"
  VUNA_STORE="$cache/store" TMPDIR="$cache" "$VUNA" fmt --check "$f" >"$cache/fmt.out" 2>&1 || {
    echo "frontend-growth: fmt --check failed for $f (probe should be canonical)" >&2
    cat "$cache/fmt.out" >&2
    exit 1
  }
  stamp_times "$cache/times-after"
  ms=$(($(child_cpu_ms "$cache/times-after") - $(child_cpu_ms "$cache/times-before")))
  rm -rf "$cache"
  printf '%s\n' "$ms"
}

update_min() { # file value
  cur=$(cat "$1")
  if [ "$2" -lt "$cur" ]; then printf '%s\n' "$2" >"$1"; fi
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

# N→4N 的窗口比值（避免浮点：a/b ≤ limit/1000）。
check_overall() { # label first last limit_milli
  label=$1 first=$2 last=$3 limit=$4
  [ "$first" -gt 0 ] || return 0
  if [ $((last * 1000)) -gt $((first * limit)) ]; then
    echo "frontend-growth: $label grew $first -> $last over 4x input (ratio $((last * 100 / first)) / 100, max $((limit / 1000)).$((limit % 1000 / 100))x)" >&2
    return 1
  fi
  return 0
}

report="$out/frontend-growth.txt"
: >"$report"

# 采样必须**按轮交错**：每轮依次跑 2000/4000/8000，再各档取多轮最小值。
# 若先把一档的五次跑完再跑下一档，宿主降频 / 负载漂移只会压慢后测的大档，
# 把相邻档比值拉成假超线性（本机实测 2000→4000 可到 3x，而原始 span 是线性的）。
ns="2000 4000 8000"
for n in $ns; do
  gen_probe "$n" "$probe/p$n.vuna"
  printf '%s\n' 999999999 >"$work/lex.$n"
  printf '%s\n' 999999999 >"$work/syn.$n"
  printf '%s\n' 999999 >"$work/fmt.$n"
done
k=0
while [ "$k" -lt 5 ]; do
  for n in $ns; do
    f="$probe/p$n.vuna"
    read -r lex syn <<EOF
$(one_us "$f")
EOF
    update_min "$work/lex.$n" "$lex"
    update_min "$work/syn.$n" "$syn"
    fmt_ms=$(one_fmt_ms "$f")
    update_min "$work/fmt.$n" "$fmt_ms"
  done
  k=$((k + 1))
done

prev_n=0
prev_fmt=0
first_n=0
first_lex=0
first_syn=0
last_lex=0
last_syn=0
for n in $ns; do
  lex=$(cat "$work/lex.$n")
  syn=$(cat "$work/syn.$n")
  fmt_ms=$(cat "$work/fmt.$n")
  printf 'n=%-5s lex=%sus syntax=%sus fmt-check=%sms\n' "$n" "$lex" "$syn" "$fmt_ms" | tee -a "$report"
  if [ "$prev_n" -gt 0 ]; then
    # parse span 的相邻档只用于诊断（见头注释）；硬门槛是下面的 4x 窗口与 fmt。
    check_ratio "fmt --check (n=$prev_n -> $n)" "$prev_fmt" "$fmt_ms" || exit 1
  else
    first_n=$n
    first_lex=$lex
    first_syn=$syn
  fi
  prev_n=$n
  prev_fmt=$fmt_ms
  last_lex=$lex
  last_syn=$syn
done
check_overall "parse.lex (n=$first_n -> $prev_n)" "$first_lex" "$last_lex" "$MAX_OVERALL_MILLI" || exit 1
check_overall "parse.syntax (n=$first_n -> $prev_n)" "$first_syn" "$last_syn" "$MAX_OVERALL_MILLI" || exit 1

echo "frontend-growth: ok (fmt adjacent max $((MAX_RATIO_MILLI / 1000)).$((MAX_RATIO_MILLI % 1000 / 100))x, parse 4x window max $((MAX_OVERALL_MILLI / 1000))x, report in $report)"
