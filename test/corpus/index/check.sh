#!/bin/sh
# test/corpus/index/check.sh：Vuna.Index 缓存 v2 自检（M30 · C11/D13）。
#
# 用法: sh corpus/index/check.sh <vuna>
#
# 在一个临时 workspace 里验证（不依赖仓库自身缓存，避免并行测试互相干扰）：
#   1) manifest v2 首行 `vuna-index 2`，条目 path<TAB>bytes<TAB>hash（3 字段）；
#   2) refs.txt 记录引用位置（module<TAB>name<TAB>line<TAB>col，4 字段）；
#   3) 第二次 map 命中缓存：manifest 内容与 mtime 都不变，无 cache.lock 残留；
#   4) 同 size + 同 mtime 的内容变更必须使缓存失效（内容哈希，而非 mtime+size）；
#   5) 过期锁（>=60s）被清理并重建缓存；新鲜锁（<60s）跳过写缓存但 map 仍成功；
#   6) 并发两个 map：都成功且不残留 cache.lock；
#   7) 非 workspace 的 map 给出可读错误并非 0（C12）。
set -u

VUNA=${1:?usage: check.sh <vuna>}
case "$VUNA" in
  /*) : ;;
  */*) VUNA=$(cd "$(dirname "$VUNA")" && pwd)/$(basename "$VUNA") ;;
esac

tmp=$(mktemp -d "${TMPDIR:-/tmp}/vuna-index-check.XXXXXX") || exit 1
trap 'rm -rf "$tmp"' EXIT INT TERM

pass=0
fail=0
ok() { pass=$((pass + 1)); }
bad() {
  fail=$((fail + 1))
  printf 'FAIL: %s\n' "$1" >&2
}
check_eq() {
  if [ "$2" = "$3" ]; then ok; else bad "$1 (expected [$2] got [$3])"; fi
}
check_contains() {
  case "$2" in
    *"$3"*) ok ;;
    *) bad "$1 (missing [$3] in [$2])" ;;
  esac
}

ws="$tmp/ws"
mkdir -p "$ws/lib/Demo"
cat >"$ws/vuna.toml" <<'EOF'
[package]
name = "index-ws"
EOF
cat >"$ws/lib/Demo/A.vuna" <<'EOF'
module Demo.A (one) where

-- doc for one
one : Int
one = 1
EOF
cat >"$ws/lib/Demo/B.vuna" <<'EOF'
module Demo.B (two) where

import Demo.A

-- M31.3（B26）：临时 workspace 无 base 依赖，`+` 需本地 fixity 声明。
infixl 6 +

two : Int
two = one + one
EOF

manifest="$ws/.local/index/manifest.txt"
refscache="$ws/.local/index/refs.txt"

# 1) 首次构建：v2 格式 + 无锁残留。
( cd "$ws" && "$VUNA" map >/dev/null 2>&1 )
check_eq "index first map exit" "0" "$?"
check_eq "index manifest v2 header" "vuna-index 2" "$(head -1 "$manifest" 2>/dev/null)"
check_eq "index manifest 3 fields" "3" "$(grep 'Demo/A.vuna' "$manifest" 2>/dev/null | awk -F'\t' '{print NF}')"
case "$(grep 'Demo/A.vuna' "$manifest" 2>/dev/null | awk -F'\t' '{print $3}')" in
  [0-9]*-[0-9]*) ok ;;
  *) bad "index manifest hash is not the v2 combined hash" ;;
esac
if [ -e "$ws/.local/index/cache.lock" ]; then bad "index lock leaked after first map"; else ok; fi
check_eq "index refs 4 fields" "4" "$(grep -m1 '^Demo.B	' "$refscache" 2>/dev/null | awk -F'\t' '{print NF}')"
check_contains "index refs record position" "$(cat "$refscache" 2>/dev/null)" "Demo.B	one	9	"

# 2) 第二次 map 命中缓存：manifest 内容/mtime 不变。
before=$(cat "$manifest")
before_mtime=$(stat -c %Y "$manifest")
sleep 1
( cd "$ws" && "$VUNA" map >/dev/null 2>&1 )
check_eq "index second map exit" "0" "$?"
check_eq "index cache hit keeps manifest" "$before" "$(cat "$manifest")"
check_eq "index cache hit keeps mtime" "$before_mtime" "$(stat -c %Y "$manifest")"
if [ -e "$ws/.local/index/cache.lock" ]; then bad "index lock leaked after cache hit"; else ok; fi

# 2b) 缓存命中时过期残留锁也会被清理（崩溃残留不能永久挡住写缓存）。
mkdir -p "$ws/.local/index/cache.lock"
touch -d "2 hours ago" "$ws/.local/index/cache.lock"
( cd "$ws" && "$VUNA" map >/dev/null 2>&1 )
check_eq "index stale-lock cache-hit exit" "0" "$?"
if [ -e "$ws/.local/index/cache.lock" ]; then bad "index stale lock survived a cache hit"; else ok; fi
check_eq "index stale-lock cache-hit keeps manifest" "$before" "$(cat "$manifest")"

# 3) 同 size + 同 mtime 的内容变更必须失效。
cp -p "$ws/lib/Demo/A.vuna" "$tmp/A.bak"
sed -i '3s/for/Xor/' "$ws/lib/Demo/A.vuna"
touch -r "$tmp/A.bak" "$ws/lib/Demo/A.vuna"
( cd "$ws" && "$VUNA" map >/dev/null 2>&1 )
check_eq "index content-change map exit" "0" "$?"
after=$(cat "$manifest")
if [ "$before" = "$after" ]; then
  bad "index cache did not invalidate on same size+mtime content change"
else
  ok
fi
check_contains "index symbols updated with content" "$(cat "$ws/.local/index/symbols.txt" 2>/dev/null)" "Xor"
if [ -e "$ws/.local/index/cache.lock" ]; then bad "index lock leaked after content rebuild"; else ok; fi
# 恢复内容后再跑，manifest 回到原值（并且再次失效过）。
cp -p "$tmp/A.bak" "$ws/lib/Demo/A.vuna"
( cd "$ws" && "$VUNA" map >/dev/null 2>&1 )
check_eq "index restored content map exit" "0" "$?"
check_eq "index restored content manifest" "$before" "$(cat "$manifest")"

# 4) 过期锁：>=60s 的 cache.lock 被清理并重建。
sed -i '3s/for/Xor/' "$ws/lib/Demo/A.vuna"
touch -r "$tmp/A.bak" "$ws/lib/Demo/A.vuna"
mkdir -p "$ws/.local/index/cache.lock"
touch -d '2 hours ago' "$ws/.local/index/cache.lock"
( cd "$ws" && "$VUNA" map >/dev/null 2>&1 )
check_eq "index stale-lock map exit" "0" "$?"
if [ -e "$ws/.local/index/cache.lock" ]; then bad "index stale lock was not removed"; else ok; fi
check_contains "index stale-lock rebuild content" "$(cat "$ws/.local/index/symbols.txt" 2>/dev/null)" "Xor"
cp -p "$tmp/A.bak" "$ws/lib/Demo/A.vuna"
( cd "$ws" && "$VUNA" map >/dev/null 2>&1 )

# 5) 新鲜锁：跳过写缓存，但 map 仍成功；清锁后下一次 map 补写 manifest。
rm -f "$manifest"
mkdir -p "$ws/.local/index/cache.lock"
fresh=$(cd "$ws" && "$VUNA" map 2>/dev/null)
code=$?
check_eq "index fresh-lock map exit" "0" "$code"
check_contains "index fresh-lock output" "$fresh" "Demo.A"
if [ -e "$manifest" ]; then bad "index wrote cache while a fresh lock existed"; else ok; fi
rm -rf "$ws/.local/index/cache.lock"
( cd "$ws" && "$VUNA" map >/dev/null 2>&1 )
check_eq "index fresh-lock recovery map exit" "0" "$?"
if [ -e "$manifest" ]; then ok; else bad "index did not rewrite manifest after fresh lock cleared"; fi
if [ -e "$ws/.local/index/cache.lock" ]; then bad "index lock leaked after recovery"; else ok; fi

# 6) 并发两个 map：都成功、不残留锁。
rm -rf "$ws/.local/index"
( cd "$ws" && "$VUNA" map >/dev/null 2>&1; echo $? >"$tmp/c1" ) &
( cd "$ws" && "$VUNA" map >/dev/null 2>&1; echo $? >"$tmp/c2" ) &
wait
check_eq "index concurrent map 1 exit" "0" "$(cat "$tmp/c1" 2>/dev/null)"
check_eq "index concurrent map 2 exit" "0" "$(cat "$tmp/c2" 2>/dev/null)"
if [ -e "$ws/.local/index/cache.lock" ]; then bad "index lock leaked after concurrent maps"; else ok; fi
( cd "$ws" && "$VUNA" map >/dev/null 2>&1 )
check_contains "index concurrent cache readable" "$(cat "$ws/.local/index/manifest.txt" 2>/dev/null)" "Demo/B.vuna"

# 7) 非 workspace：可读错误 + 非 0。
mkdir -p "$tmp/empty"
( cd "$tmp/empty" && "$VUNA" map ) >"$tmp/map.err" 2>&1
code=$?
if [ "$code" -eq 0 ]; then
  bad "index map outside workspace should exit non-zero"
else
  ok
fi
check_contains "index map outside workspace readable error" "$(cat "$tmp/map.err" 2>/dev/null)" "vuna.toml"

if [ "$fail" -ne 0 ]; then
  printf 'index check: %s passed, %s failed\n' "$pass" "$fail"
  exit 1
fi
printf 'index check passed (%s checks)\n' "$pass"
