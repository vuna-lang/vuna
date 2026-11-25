#!/bin/sh
# vuna-container-growth：**容器增长率**门槛。
#
# 每个容器一族合成探针，按 N 与 2N 编译成 OCaml 后端产物，只测**运行 CPU**（编译时间不计）；
# 相邻档的比值必须落在阈值内。绝对时间跨机器不可比，增长率可比：
# 线性路径（N 次 O(1)/O(log n) 操作）比值 ≈2，排序 ≈2.1；出现 n² 退化时 ≈4。
# 用 CPU 而不是墙钟：`nix flake check` 会并发构建其他 check，墙钟会把「等 CPU」算进
# 探针耗时，导致同一份代码在不同负载下报出假回归；user+sys 只随真实工作量增长。
#
# 覆盖的回归形状：
#   - HashMap 的 insert/remove/size 被改回「按名线性扫桶」或 size 退回 O(n)；
#   - Queue 用 append 追加到队尾（旋转语义退化成 O(n)）；
#   - PriorityQueue/TreeMap 丢掉平衡（或每次操作重建整棵树）；
#   - Sort 退回插入排序（sortBy 的短表分支被误判）。
#
# 只跑 OCaml 后端：native/wasm 的运行时性能由 `vuna-perf --target all` 的 ratio 基线
# （软告警）覆盖，进 CI 会让 ocamlopt/cc/node 一起上关键路径。`VUNA_CONTAINER_MAX_RATIO_MILLI`
# 可临时覆盖阈值（千分比）。
set -eu
out=${1:?usage: container-growth.sh OUT}
: "${VUNA:?VUNA 未设置}"

MAX_RATIO_MILLI=${VUNA_CONTAINER_MAX_RATIO_MILLI:-3000}
BASE=$PWD/packages/base
work=$(mktemp -d "${TMPDIR:-/tmp}/vuna-container-growth.XXXXXX")
trap 'rm -rf "$work"' EXIT INT TERM
mkdir -p "$out"

probe="$work/probe"
mkdir -p "$probe"
printf '[package]\nname = "container-growth-probe"\n\n[dependencies]\nvuna-base = "%s"\n' "$BASE" >"$probe/vuna.toml"

# 探针共用同一份 store：这里只比较**运行**时间，编译缓存不影响读数。
STORE="$work/store"
mkdir -p "$STORE"

gen_probe() { # family n file
  family=$1
  n=$2
  file=$3
  case "$family" in
    sort)
      cat >"$file" <<EOF
import Base.Data.Int as Int
import Base.Data.List as List
import Base.Data.Nat as Nat
import Base.Data.Sort as Sort

scramble : Int -> Int
scramble i =
  let
    x = i * 7919
  in x - x / 100003 * 100003

gen : Int -> List Int -> List Int
gen k acc = if k <= 0 then acc else gen (k - 1) (scramble k :: acc)

main : Int
main =
  let
    xs = gen $n []
    ys = Sort.sortBy (\a, b => a <= b) xs
  in List.foldl (\acc, x => acc * 31 + x) 0 ys
EOF
      ;;
    treemap)
      cat >"$file" <<EOF
import Base.Container.TreeMap as TreeMap
import Base.Data.Int as Int
import Base.Data.List as List
import Base.Data.Nat as Nat
import Base.Data.Maybe as Maybe
import Base.Data.Pair as Pair

scramble : Int -> Int
scramble i =
  let
    x = i * 7919
  in x - x / 100003 * 100003

build : Int -> TreeMap Int Int -> TreeMap Int Int
build k t = if k <= 0 then t else build (k - 1) (TreeMap.insert (scramble k) k t)

lookupSum : Int -> TreeMap Int Int -> Int -> Int
lookupSum k t acc =
  if k <= 0 then acc
  else case TreeMap.lookup (scramble k) t of
    Nothing => lookupSum (k - 1) t acc
    Just v => lookupSum (k - 1) t (acc * 31 + v)

ascSum : List (Pair Int Int) -> Int
ascSum xs = List.foldl (\acc, p => acc * 31 + firstOf p) 0 xs

main : Int
main =
  let
    t = build $n TreeMap.empty
  in lookupSum $n t 0 + ascSum (TreeMap.toAscList t) + natToInt (TreeMap.size t)
EOF
      ;;
    queue)
      cat >"$file" <<EOF
import Base.Container.Queue as Queue
import Base.Data.Int as Int
import Base.Data.Maybe as Maybe
import Base.Data.Nat as Nat
import Base.Data.Pair as Pair

pushAll : Int -> Queue Int -> Queue Int
pushAll k q = if k <= 0 then q else pushAll (k - 1) (Queue.push (k * 3 - 7) q)

popSum : Int -> Queue Int -> Int -> Int
popSum k q acc =
  if k <= 0 then acc
  else case Queue.pop q of
    Nothing => acc
    Just (Pair x rest) => popSum (k - 1) rest (acc * 31 + x)

main : Int
main =
  let
    q = pushAll $n Queue.empty
  in popSum $n q 0 + natToInt (Queue.size q)
EOF
      ;;
    priority_queue)
      cat >"$file" <<EOF
import Base.Container.PriorityQueue as PQ
import Base.Data.Int as Int
import Base.Data.Maybe as Maybe
import Base.Data.Nat as Nat
import Base.Data.Pair as Pair

scramble : Int -> Int
scramble i =
  let
    x = i * 7919
  in x - x / 100003 * 100003

pushAll : Int -> PriorityQueue Int -> PriorityQueue Int
pushAll k q = if k <= 0 then q else pushAll (k - 1) (PQ.push (scramble k) q)

popSum : Int -> PriorityQueue Int -> Int -> Int
popSum k q acc =
  if k <= 0 then acc
  else case PQ.pop q of
    Nothing => acc
    Just (Pair x rest) => popSum (k - 1) rest (acc * 31 + x)

main : Int
main =
  let
    q = pushAll $n PQ.empty
  in popSum $n q 0 + natToInt (PQ.size q)
EOF
      ;;
    hashmap)
      cat >"$file" <<EOF
import Base.Container.HashMap as HashMap
import Base.Data.Int as Int
import Base.Data.List as List
import Base.Data.Maybe as Maybe
import Base.Data.Nat as Nat

scramble : Int -> Int
scramble i =
  let
    x = i * 7919
  in x - x / 100003 * 100003

insertAll : Int -> HashMap Int Int -> HashMap Int Int
insertAll k t = if k <= 0 then t else insertAll (k - 1) (HashMap.insert (scramble k) k t)

removeHalf : Int -> HashMap Int Int -> HashMap Int Int
removeHalf k t = if k <= 0 then t else removeHalf (k - 1) (HashMap.remove (scramble (k * 2)) t)

lookupSum : Int -> HashMap Int Int -> Int -> Int
lookupSum k t acc =
  if k <= 0 then acc
  else case HashMap.lookup (scramble k) t of
    Nothing => lookupSum (k - 1) t acc
    Just v => lookupSum (k - 1) t (acc * 31 + v)

main : Int
main =
  let
    t0 = insertAll $n (HashMap.fromList [])
    t1 = removeHalf ($n / 2) t0
  in lookupSum $n t1 0 + natToInt (HashMap.size t1)
EOF
      ;;
    *)
      echo "container-growth: unknown family $family" >&2
      exit 1
      ;;
  esac
}

build_probe() { # file dir
  f=$1
  dir=$2
  mkdir -p "$dir"
  if ! VUNA_STORE="$STORE" "$VUNA" compile "$f" "$dir" --target ocaml >"$dir/codegen.log" 2>&1; then
    echo "container-growth: codegen failed for $f" >&2
    sed -n '1,20p' "$dir/codegen.log" >&2
    exit 1
  fi
  if ! ( cd "$dir" && sh build.sh prog ) >"$dir/build.log" 2>&1; then
    echo "container-growth: build failed for $f" >&2
    sed -n '1,20p' "$dir/build.log" >&2
    exit 1
  fi
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

run_ms() { # dir -> best-of-5 CPU ms（先跑一次预热，不计时）
  "$1/prog" >/dev/null 2>&1 || {
    echo "container-growth: probe run failed ($1)" >&2
    exit 1
  }
  best=999999
  k=0
  while [ "$k" -lt 5 ]; do
    stamp_times "$1/.times-before"
    if ! "$1/prog" >/dev/null 2>&1; then
      echo "container-growth: probe run failed ($1)" >&2
      exit 1
    fi
    stamp_times "$1/.times-after"
    ms=$(($(child_cpu_ms "$1/.times-after") - $(child_cpu_ms "$1/.times-before")))
    [ "$ms" -lt "$best" ] && best=$ms
    k=$((k + 1))
  done
  printf '%s\n' "$best"
}

grow() { # family n0 n1 n2
  family=$1
  prev=""
  for n in "$2" "$3" "$4"; do
    f="$probe/$family-$n.vuna"
    dir="$work/$family-$n"
    gen_probe "$family" "$n" "$f"
    build_probe "$f" "$dir"
    ms=$(run_ms "$dir")
    if [ -n "$prev" ]; then
      ratio_milli=$((ms * 1000 / prev))
      printf '  %-15s N=%-7s %6s ms  (x%s.%03d)\n' "$family" "$n" "$ms" \
        "$((ratio_milli / 1000))" "$((ratio_milli % 1000))"
      if [ "$ratio_milli" -gt "$MAX_RATIO_MILLI" ]; then
        echo "FAIL: $family growth ratio $((ratio_milli / 1000)).$((ratio_milli % 1000)) > $((MAX_RATIO_MILLI / 1000)).$((MAX_RATIO_MILLI % 1000)) at N=$n (prev=${prev}ms, cur=${ms}ms)" >&2
        exit 1
      fi
    else
      printf '  %-15s N=%-7s %6s ms  (base)\n' "$family" "$n" "$ms"
    fi
    prev=$ms
  done
}

printf 'container-growth: max ratio %s.%03d\n' "$((MAX_RATIO_MILLI / 1000))" "$((MAX_RATIO_MILLI % 1000))"
# 各族的规模按「最低档 ≥ ~50 ms（进程启动与缓存效应占比小）」选取。
grow sort 50000 100000 200000
grow treemap 50000 100000 200000
grow queue 200000 400000 800000
grow priority_queue 50000 100000 200000
grow hashmap 100000 200000 400000

touch "$out/ok"