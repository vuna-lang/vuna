#!/bin/sh
# test/corpus/index/check.sh：Vuna.Index 缓存自检（查询图节点 + blob）。
#
# 用法: sh corpus/index/check.sh <vuna>
#
# 缓存形状：
#   `index:<dir>` 节点（会话索引落在 `$VUNA_STORE/objects/tool/<输入摘要>`，codec
#   `query-index 1`），值 = 载荷内容地址（`QRef`）；载荷 = `Index.Codec.encIndex` 的规范
#   字节，落同一个 `objects/tool/<输入摘要>`（codec `index-payload 1`，`Store` framing）。
#
# 在一个临时 workspace 里验证（不依赖仓库自身缓存，避免并行测试互相干扰）：
#   1) 首次 map：exit 0、blob 的 framing tag/codec 正确；
#   2) 第二次 map：图节点命中（`index-path=cache`），blob 集合不变；
#   3) 同 size + 同 mtime 的内容变更必须失效（安全窗内回落内容哈希，而非 mtime+size）；
#   4) blob 被截断（framing 校验失败）⇒ 重算并重写合法 framing；
#   5) 并发两个 map：都成功且缓存可读；
#   6) 非 workspace 的 map 给出可读错误并非 0（C12）。
set -u

VUNA=${1:?usage: check.sh <vuna>}
case "$VUNA" in
  /*) : ;;
  */*) VUNA=$(cd "$(dirname "$VUNA")" && pwd)/$(basename "$VUNA") ;;
esac

tmp=$(mktemp -d "${TMPDIR:-/tmp}/vuna-index-check.XXXXXX") || exit 1
trap 'rm -rf "$tmp"' EXIT INT TERM
# 独立缓存根，避免与仓库自身的 store 互相干扰。
export TMPDIR="$tmp/cache"
export VUNA_STORE="${VUNA_STORE:-$TMPDIR/vuna-store}"
mkdir -p "$TMPDIR"

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
check_ne() {
  if [ "$2" != "$3" ]; then ok; else bad "$1 (unexpected [$2])"; fi
}
blobs() { find "$VUNA_STORE/objects/tool" -type f 2>/dev/null; }

ws="$tmp/ws"
mkdir -p "$ws/lib/Demo"
cat >"$ws/vuna.toml" <<'EOF'
[package]
name = "index-ws"
EOF
cat >"$ws/lib/Demo/A.vuna" <<'EOF'
module Demo.A where

-- | doc for one
export one : Int
one = 1

-- | first doc line
-- | second doc line
two : Int
two = 2
EOF
cat >"$ws/lib/Demo/B.vuna" <<'EOF'
module Demo.B where

import Demo.A

-- M31.3（B26）：临时 workspace 无 base 依赖，`+` 需本地 fixity 声明。
infixl 6 +

export two : Int
two = one + one
EOF

# 1) 首次构建：图节点未命中 → 建索引、写 blob。
first=$( cd "$ws" && VUNA_DEBUG_PERF=1 "$VUNA" map 2>&1 )
check_eq "index first map exit" "0" "$?"
check_contains "index first map builds" "$first" "index-path=build"
check_contains "index map output" "$first" "Demo.A"
blob=$(blobs | head -1)
if [ -n "$blob" ]; then ok; else bad "index blob missing"; fi
check_eq "index blob framing magic" "vuna-cache-frame 2" "$(head -c 18 "$blob" 2>/dev/null)"
check_eq "index blob codec" "index-payload 1" "$(head -1 "$blob" 2>/dev/null | cut -d'|' -f3)"
api_out=$(cd "$ws" && "$VUNA" api Demo.A 2>&1)
check_contains "api multi-line doc" "$api_out" "second doc line"

# 2) 第二次 map：节点命中（读 blob 解码），blob 集合与字节数不变。
before_count=$(blobs | wc -l | tr -d ' ')
before_size=$(wc -c < "$blob" | tr -d ' ')
second=$( cd "$ws" && VUNA_DEBUG_PERF=1 "$VUNA" map 2>&1 )
check_eq "index second map exit" "0" "$?"
check_contains "index cache hit" "$second" "index-path=cache"
check_eq "index cache hit keeps blob count" "$before_count" "$(blobs | wc -l | tr -d ' ')"
check_eq "index cache hit keeps blob bytes" "$before_size" "$(wc -c < "$blob" | tr -d ' ')"

# 3) 同 size + 同 mtime 的内容变更必须失效（安全窗内回落内容哈希）。
cp -p "$ws/lib/Demo/A.vuna" "$tmp/A.bak"
sed -i '3s/for/Xor/' "$ws/lib/Demo/A.vuna"
touch -r "$tmp/A.bak" "$ws/lib/Demo/A.vuna"
changed=$( cd "$ws" && VUNA_DEBUG_PERF=1 "$VUNA" map 2>&1 )
check_eq "index content-change map exit" "0" "$?"
check_contains "index content change rebuilds" "$changed" "index-path=build"
check_contains "index symbols updated with content" "$(cd "$ws" && "$VUNA" api Demo.A 2>&1)" "Xor"
cp -p "$tmp/A.bak" "$ws/lib/Demo/A.vuna"
restored=$( cd "$ws" && VUNA_DEBUG_PERF=1 "$VUNA" map 2>&1 )
check_eq "index restored content map exit" "0" "$?"
# 输入寻址：内容 A → B → A 时 A 的对象仍在（不随"最近一次"覆盖），恢复后直接命中。
check_contains "index restored content hits" "$restored" "index-path=cache"

# 4) blob 截断：framing（len/内容地址）校验失败 ⇒ 重算并重写合法 framing。
#    注意步骤 3 改内容会留下**孤儿 blob**（旧内容地址不会再有引用、也不会被重写），
#    所以不能按 `find` 顺序取 `head -1` 判断重写结果：readdir 顺序跨机器不同，CI 上
#    会取到那份孤儿，读到的是截断 64B 的头（症状 `index blob reframed codec: got
#    [index-payl]`）。改为按 codec 挑出被重写的那份 index-payload blob，并用一次
#    后续 map 验证节点仍能命中（命中路径会校验 framing）。
for f in $(blobs); do head -c 64 "$f" > "$f.part"; mv "$f.part" "$f"; done
rebuilt=$( cd "$ws" && VUNA_DEBUG_PERF=1 "$VUNA" map 2>&1 )
check_eq "index truncated-blob map exit" "0" "$?"
check_contains "index truncated blob rebuild" "$rebuilt" "index-path=build"
n_blob=$(for f in $(blobs); do [ "$(head -1 "$f" | cut -d'|' -f3)" = "index-payload 1" ] && printf '%s\n' "$f"; done | head -1)
if [ -n "$n_blob" ]; then ok; else bad "index truncated blob not reframed (no valid index-payload blob)"; fi
check_eq "index blob reframed magic" "vuna-cache-frame 2" "$(head -c 18 "$n_blob" 2>/dev/null)"
check_contains "index reframed blob reusable" "$( cd "$ws" && VUNA_DEBUG_PERF=1 "$VUNA" map 2>&1 )" "index-path=cache"

# 5) 并发两个 map：都成功，随后缓存可读。
( cd "$ws" && "$VUNA" map >/dev/null 2>&1; echo $? >"$tmp/c1" ) &
( cd "$ws" && "$VUNA" map >/dev/null 2>&1; echo $? >"$tmp/c2" ) &
wait
check_eq "index concurrent map 1 exit" "0" "$(cat "$tmp/c1" 2>/dev/null)"
check_eq "index concurrent map 2 exit" "0" "$(cat "$tmp/c2" 2>/dev/null)"
check_contains "index concurrent cache readable" "$( cd "$ws" && VUNA_DEBUG_PERF=1 "$VUNA" map 2>&1 )" "index-path=cache"

# 6) 非 workspace：可读错误 + 非 0。
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
