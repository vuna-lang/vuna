#!/bin/sh
# checks.vuna-effect-machine-growth：效应机器的**深度**增长率门槛。
#
# 两个探针，分别锁两条会被「活续延数」拖垮的轴：
#
#   frames（ocaml）：`layer` 递归，每层装一个 handler，内层返回后在本层 `perform`
#     （clause 以 `x + 1` 非尾 resume）。深度 = handler 帧数 = 嵌套 resume 次数；
#     夹具 `effect/perf/51_eff_nested` 就是它的小尺寸版本。`MSt.msUsed` / 帧链一类
#     「按活续延数线性扫描或重建整表」的退化在这里是二次的。
#
#   answer-row（native）：内层 handler 的 clause 先 `perform` 一次外层效应再 resume，
#     handler 的答案本身是 `Eff`（answer row）——每轮多一次派发。这条路径的退化只在
#     native 上可见（OCaml 后端同一程序快两个数量级），所以单独在 native 上卡绝对上限。
#
# 口径：只测**运行**墙钟（`vuna build` 的编译时间不计），预热一次后取 best-of-N。
#
# 判据：
#   - frames：三档 100k/200k/400k，每档在 30s 内完成（`VUNA_EFFECT_GROWTH_TIMEOUT`），
#     且相邻档 `t(2N) <= 3.0x t(N)`（`VUNA_EFFECT_GROWTH_RATIO_MILLI`）。本机约
#     96/231/491 ms：实测 2.1-2.4x（活续延与 used 表的内存增长带来约 1.1 的指数），
#     二次约 4x，所以 3.0x 能区分 n^2 又留噪声余量。
#   - answer-row：N=40000 单档，默认 10s 绝对上限（同上变量）。本机约 370 ms；answer-row
#     的 native 读数本身随规模略超线性（2 万 / 4 万 / 8 万 ≈ 155 / 369 / 1184 ms），
#     比值门槛在这里分不清退化，用「远高于正常读数的硬上限」来抓这一类。
#
# 绝对时间跨机器不可比，增长率可比；上限给的是数量级余量（本机读数的 25x 以上）。
set -eu
out=${1:?usage: effect-machine-growth.sh OUT}
: "${VUNA:?VUNA 未设置}"

RATIO_MILLI=${VUNA_EFFECT_GROWTH_RATIO_MILLI:-3000}
LIMIT=${VUNA_EFFECT_GROWTH_TIMEOUT:-30}
AR_LIMIT=${VUNA_EFFECT_GROWTH_ANSWER_ROW_TIMEOUT:-10}
BASE=${VUNA_BASE:-$PWD/packages/base}
work=$(mktemp -d "${TMPDIR:-/tmp}/vuna-effect-machine-growth.XXXXXX")
trap 'rm -rf "$work"' EXIT INT TERM
mkdir -p "$out"

pkg="$work/probe"
mkdir -p "$pkg/app"
printf '[package]\nname = "effect-machine-growth-probe"\n\n[dependencies]\nvuna-base = "%s"\n' "$BASE" >"$pkg/vuna.toml"

# 探针共用同一份 store：这里只比较**运行**时间，编译缓存不影响读数。
STORE="$work/store"
mkdir -p "$STORE"

gen_frames() { # n
  cat >"$pkg/app/Main.vuna" <<EOF
import Base.Effect.Core as Eff
import Base.Data.Nat as Nat

data POp : Type -> Type where
  P : Int -> POp Int

layer : Nat -> Eff [POp] Int
layer n =
  case n of
    Zero => pure 0
    Succ m =>
      weakenRow [POp] (
          handle (
            do
              x <- layer m
              perform (P x)
          ) {
            P x k -> k (x + 1)
          }
        )

main : Int
main =
  runPure (
      handle (layer (natFromInt $1)) {
        P v k -> k v
      }
    )
EOF
}

gen_answer_row() { # n
  cat >"$pkg/app/Main.vuna" <<EOF
import Base.Effect.Core as Eff
import Base.Effect.Console as EffConsole
import Base.Data.Nat as Nat

data TickOp : Type -> Type where
  Tick : Int -> TickOp Int

loop : Nat -> Eff [ConsoleOp@mock] Int
loop 0 = pure 0
loop (Succ m) =
  do
    _ <- consolePrint@mock "x"
    y <- loop m
    pure (y + 1)

ret : Int -> Eff [TickOp] Int
ret a = pure a

opH : (i : Type) -> (o : ConsoleOp i) -> (Eff.resIdx i o -> Eff [TickOp] Int) -> Eff [TickOp] Int
opH i (Print s) k =
  do
    _ <- perform (Tick 1)
    k (natFromInt 0)
opH i (EPrint s) k =
  do
    _ <- perform (Tick 1)
    k 0

main : Int
main =
  runPure (
      handle (joinEffNilOuter (handleConsole "mock" ret opH (loop (natFromInt $1)))) {
        Tick n k -> k n
      }
    )
EOF
}

build_probe() { # target dir
  target=$1
  dir=$2
  mkdir -p "$dir"
  if ! VUNA_STORE="$STORE" "$VUNA" build --target "$target" --out "$dir" "$pkg" >"$dir/build.log" 2>&1; then
    echo "effect-machine-growth: build[$target] failed" >&2
    sed -n '1,20p' "$dir/build.log" >&2
    exit 1
  fi
}

run_ms() { # dir n limit runs -> best-of-N wall ms（先跑一次预热，不计时）
  dir=$1
  n=$2
  limit=$3
  runs=$4
  if ! got=$(timeout "$limit" "$dir/bin/effect-machine-growth-probe" 2>"$dir/run.err"); then
    echo "effect-machine-growth: 探针在 ${limit}s 上限内未正常返回（N=$n）" >&2
    sed -n '1,5p' "$dir/run.err" >&2
    exit 1
  fi
  if [ "$got" != "$n" ]; then
    echo "effect-machine-growth: 探针输出错（N=$n 期望 $n，实际 ${got}）" >&2
    exit 1
  fi
  best=999999
  k=0
  while [ "$k" -lt "$runs" ]; do
    t0=$(date +%s%3N)
    if ! timeout "$limit" "$dir/bin/effect-machine-growth-probe" >/dev/null 2>"$dir/run.err"; then
      echo "effect-machine-growth: 探针在 ${limit}s 上限内未正常返回（N=$n）" >&2
      sed -n '1,5p' "$dir/run.err" >&2
      exit 1
    fi
    t1=$(date +%s%3N)
    ms=$((t1 - t0))
    [ "$ms" -lt "$best" ] && best=$ms
    k=$((k + 1))
  done
  printf '%s\n' "$best"
}

printf 'effect-machine-growth: frames ratio %s.%03d / limit %ss; answer-row limit %ss\n' \
  "$((RATIO_MILLI / 1000))" "$((RATIO_MILLI % 1000))" "$LIMIT" "$AR_LIMIT"

prev=""
for n in 100000 200000 400000; do
  gen_frames "$n"
  build_probe ocaml "$work/frames-$n"
  ms=$(run_ms "$work/frames-$n" "$n" "$LIMIT" 5)
  if [ -n "$prev" ]; then
    ratio_milli=$((ms * 1000 / prev))
    printf '  frames     N=%-7s %6s ms  (x%s.%03d)\n' "$n" "$ms" \
      "$((ratio_milli / 1000))" "$((ratio_milli % 1000))"
    if [ "$ratio_milli" -gt "$RATIO_MILLI" ]; then
      echo "FAIL: frames growth ratio $((ratio_milli / 1000)).$((ratio_milli % 1000)) > $((RATIO_MILLI / 1000)).$((RATIO_MILLI % 1000)) at N=$n (prev=${prev}ms, cur=${ms}ms)" >&2
      exit 1
    fi
  else
    printf '  frames     N=%-7s %6s ms  (base)\n' "$n" "$ms"
  fi
  prev=$ms
done

gen_answer_row 40000
build_probe native "$work/answer-row-40000"
ms=$(run_ms "$work/answer-row-40000" 40000 "$AR_LIMIT" 3)
printf '  answer-row N=%-7s %6s ms  (native)\n' 40000 "$ms"

touch "$out/ok"