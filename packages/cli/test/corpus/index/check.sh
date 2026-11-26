#!/bin/sh
# test/corpus/index/check.sh：Vuna.Index 构建与查询自检。
#
# 用法: sh corpus/index/check.sh <vuna>
#
# 索引每次调用从源重建（不持久化）。在一个临时 workspace 里验证：
#   1) 首次 map：exit 0、输出模块/符号；
#   2) 内容变更后 map/api 反映新内容；
#   3) 并发两个 map：都成功；
#   4) 非 workspace 的 map 给出可读错误并非 0。
set -u

VUNA=${1:?usage: check.sh <vuna>}
case "$VUNA" in
  /*) : ;;
  */*) VUNA=$(cd "$(dirname "$VUNA")" && pwd)/$(basename "$VUNA") ;;
esac

tmp=$(mktemp -d "${TMPDIR:-/tmp}/vuna-index-check.XXXXXX") || exit 1
trap 'rm -rf "$tmp"' EXIT INT TERM
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

ws="$tmp/ws"
mkdir -p "$ws/lib/Demo"
cat >"$ws/vuna.toml" <<'EOF'
[package]
name = "index-ws"
EOF
cat >"$ws/lib/Demo/A.vuna" <<'EOF'
-- | Demo.A module docs.
-- | second module doc line.
module Demo.A where

-- | doc for one
export one : Int
one = 1

-- | first doc line
-- | second doc line
two : Int
two = 2

data Alpha : Type where
  MkAlpha : Alpha
EOF
cat >"$ws/lib/Demo/B.vuna" <<'EOF'
module Demo.B where

import Demo.A

-- 临时 workspace 无 base 依赖，`+` 需本地 fixity 声明。
infixl 6 +

export two : Int
two = one + one
EOF
cat >"$ws/lib/Demo/C.vuna" <<'EOF'
module Demo.C where

import Demo.A

-- Alpha 只出现在签名里
onlySig : Alpha -> Int
onlySig _ = 0
EOF
cat >"$ws/lib/Demo/D.vuna" <<'EOF'
module Demo.D where

import Demo.A

-- Alpha 只出现在 axiom 的类型里
axiom ax : Alpha
EOF

# 1) 首次构建：建索引并输出模块/文档。
first=$( cd "$ws" && VUNA_LOG=debug "$VUNA" map 2>&1 )
check_eq "index first map exit" "0" "$?"
check_contains "index first map builds" "$first" "index-path=build"
check_contains "index map output" "$first" "Demo.A"
api_out=$(cd "$ws" && "$VUNA" api Demo.A 2>&1)
check_contains "api multi-line doc" "$api_out" "second doc line"
check_contains "api 模块 docstring（标题下）" "$api_out" "Demo.A module docs."
check_contains "api 模块 docstring 保留多行" "$api_out" "second module doc line."

# 2) 内容变更：下一次查询反映新内容。
sed -i 's/doc for one/doc for fortytwo/' "$ws/lib/Demo/A.vuna"
changed=$( cd "$ws" && VUNA_LOG=debug "$VUNA" map 2>&1 )
check_eq "index content-change map exit" "0" "$?"
check_contains "index content change rebuilds" "$changed" "index-path=build"
check_contains "index symbols updated with content" "$(cd "$ws" && "$VUNA" api Demo.A 2>&1)" "fortytwo"

# 3) 并发两个 map：都成功。
( cd "$ws" && "$VUNA" map >/dev/null 2>&1; echo $? >"$tmp/c1" ) &
( cd "$ws" && "$VUNA" map >/dev/null 2>&1; echo $? >"$tmp/c2" ) &
wait
check_eq "index concurrent map 1 exit" "0" "$(cat "$tmp/c1" 2>/dev/null)"
check_eq "index concurrent map 2 exit" "0" "$(cat "$tmp/c2" 2>/dev/null)"

# 4) 非 workspace：可读错误 + 非 0。
mkdir -p "$tmp/empty"
( cd "$tmp/empty" && "$VUNA" map ) >"$tmp/map.err" 2>&1
code=$?
if [ "$code" -eq 0 ]; then
  bad "index map outside workspace should exit non-zero"
else
  ok
fi
check_contains "index map outside workspace readable error" "$(cat "$tmp/map.err" 2>/dev/null)" "vuna.toml"

# 5) impact 收集签名与 axiom 里的类型引用（doc comment 之外的声明面）。
impact_a=$( cd "$ws" && "$VUNA" map impact Demo.A.Alpha 2>&1 )
check_eq "impact Alpha exit" "0" "$?"
check_contains "impact lists signature reader" "$impact_a" "Demo.C"
check_contains "impact lists axiom reader" "$impact_a" "Demo.D"
case "$impact_a" in
  *"Demo.B"*) bad "impact Alpha should not list Demo.B" ;;
  *) ok ;;
esac

if [ "$fail" -ne 0 ]; then
  printf 'index check: %s passed, %s failed\n' "$pass" "$fail"
  exit 1
fi
printf 'index check passed (%s checks)\n' "$pass"
