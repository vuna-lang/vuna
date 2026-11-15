#!/bin/sh
# vuna-compiler-growth-incremental：**包路径增量 check** 的增长率门槛。
#
# 背景：`compiler-growth.sh` 只测单文件 `vuna check <file>`，走的是全量精化路径，
# 覆盖不到「包级 check 的增量收尾」（`dtFinishPackageScoped` 的 globals 去重、写接口、
# 终止性 own 判定）——这些路径容易退化成 O(n²)：N=4000 的增量 check 会比冷 check 还慢
# （1.58s vs 0.49s），而单文件探针完全看不出来。
#
# 口径：合成「可执行包」= lib/Mod.vuna（N 个同形 `fi : Int` 定义）+ app/Main.vuna。
# 每档每轮：新建**独立空 `VUNA_STORE`** → 预热依赖接口（`vuna check base`）→ 冷跑一次探针包
# → **改一个定义**（让本模块缓存失效）→ 计时这次 check。三次取小。
#
# 为什么不能直接计时「无改动的第二次 check」（2026-11 复核）：那样子单元全命中，读数只有
# ~20 ms 且与 N 无关（实测 N=1000/2000/4000 都是 20 ms），门槛永远绿、什么也守不住。
# 改一行定义后缓存失效、本模块重精化 + 收尾重跑，读数恢复成随 N 增长的真实路径
# （同二进制实测 N=1000/2000/4000/8000 = 215/430/1120/3100 ms，逐档 ×2.0/×2.6/×2.8）；
# 这一段的上界仍是已知边界（接口哈希的插入排序，见 docs/reference/performance.md §4/§5.2）。
#
# 阈值默认 3.3×/翻倍（比单文件门槛的 2.5 宽；实测 N=4000 为 2.49、N=8000 为 3.14）：
# 增量 check 里有与 N 无关的固定成本
# （接口读取/写回、依赖摘要校验），N 小时比值噪声更大；O(n²) 回归在 N=8000 档
# 会远超 3.3，仍会被挡住。可用 `VUNA_GROWTH_MAX_RATIO_MILLI`（千分比）临时覆盖。
#
# 为什么显式隔离 `VUNA_STORE`：`TMPDIR` 只影响 AST 族，接口与单元对象都在 `VUNA_STORE`；
# devShell 里本地跑时它是已预热的 `.local/store`，各档共享 ⇒ 读数被磨平。CI 的 mkCheck
# 没有 `VUNA_STORE`、`HOME=/homeless-shelter`，天然落 `$TMPDIR/vuna-store`。
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

# 依赖包（vuna-base）的接口必须先落盘：否则探针因「依赖接口缺失」走全量路径，
# 测的就变成冷精化而不是增量收尾（本门槛要守的正是后者）。接口对象在 `VUNA_STORE`，
# 所以这份预热**必须落在本次计时用的那个 store 里**。
warm_dep() { # store dir
  VUNA_STORE="$1" TMPDIR="$2" "$VUNA" check "$BASE" >/dev/null 2>&1 || {
    echo "compiler-growth-pkg: dependency check failed for $BASE" >&2
    exit 1
  }
}

# 让 `f1` 的定义体变成另一个合法表达式（内容变、形状不变），使本模块缓存失效。
touch_def() { # dir value
  sed "s/^f1 = .*/f1 = $2/" "$1/lib/Mod.vuna" >"$1/lib/Mod.vuna.new"
  mv "$1/lib/Mod.vuna.new" "$1/lib/Mod.vuna"
}

mk_probe() { # n dir
  n=$1 dir=$2
  mkdir -p "$dir/lib" "$dir/app"
  printf '[package]\nname = "growth-pkg-%s"\n\n[export]\nmodules = ["Mod"]\n\n[dependencies]\nvuna-base = "%s"\n' \
    "$n" "$BASE" >"$dir/vuna.toml"
  gen_mod "$n" "$dir/lib/Mod.vuna"
  printf 'import Mod\n\nmain : Int\nmain = f1\n' >"$dir/app/Main.vuna"
}

time_incremental() { # dir -> ms
  dir=$1
  best=999999
  k=1
  while [ "$k" -le 3 ]; do
    cache=$(mktemp -d "$work/cache.XXXXXX")
    warm_dep "$cache/store" "$cache"
    # 先冷跑一次：建立包对象 + 单元/接口缓存（下一次才是增量路径）。
    VUNA_STORE="$cache/store" TMPDIR="$cache" "$VUNA" check "$dir" >/dev/null 2>&1 || {
      echo "compiler-growth-pkg: cold check failed for $dir" >&2
      exit 1
    }
    # 改一行 → 本模块缓存失效，计时的是「重精化本模块 + 收尾」，而不是全命中。
    touch_def "$dir" "$((k + 1))"
    t0=$(date +%s%3N)
    VUNA_STORE="$cache/store" TMPDIR="$cache" "$VUNA" check "$dir" >/dev/null 2>&1 || {
      echo "compiler-growth-pkg: incremental check failed for $dir" >&2
      exit 1
    }
    t1=$(date +%s%3N)
    rm -rf "$cache"
    ms=$((t1 - t0))
    [ "$ms" -lt "$best" ] && best=$ms
    k=$((k + 1))
  done
  touch_def "$dir" 1
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
