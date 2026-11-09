#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

# 39) M26 上下文回归：包上下文/无 manifest 语义、效果边界、base 定位与已删路径。
ctx="$tmp/ctx"
mkdir -p "$ctx"

# 39a) 无 manifest → base-only 上下文：import Base.* 可用（base 经 VUNA_BASE 定位）。
cat > "$ctx/use_base.vuna" <<'EOF'
import Base.Nat

main : Int
main = case Succ Zero of
  Zero => 0
  Succ _ => 42
EOF
ctx_base=$("$VUNA" check "$ctx/use_base.vuna" 2>&1)
check_eq "context base-only base import" "" "$ctx_base"

# 39b) 同一上下文 import 编译器模块 → LD_ModuleNotFound（不再有全局 roots）。
cat > "$ctx/use_compiler.vuna" <<'EOF'
import Vuna.Compiler.Common

main : Int
main = 1
EOF
ctx_comp=$("$VUNA" check "$ctx/use_compiler.vuna" 2>&1)
check_contains "context compiler not visible" "$ctx_comp" "LD_ModuleNotFound"

# 39c) 效应边界（M27）：能力必须显式声明；无 manifest 的 ad-hoc 上下文没有能力，
# 直接调 effectful 内建（只有 prim_* 名）被拒，必须经 Base.IO 或声明能力。
cat > "$ctx/effect.vuna" <<'EOF'
main : Int
main = prim_print "x"
EOF
ctx_effect=$("$VUNA" check "$ctx/effect.vuna" 2>&1)
check_contains "context effect rejected" "$ctx_effect" "requires capability"

# 39d) 纯值程序在 base-only 上下文通过。
cat > "$ctx/simple.vuna" <<'EOF'
main : Int
main = 1
EOF
ctx_simple=$("$VUNA" check "$ctx/simple.vuna" 2>&1)
check_eq "context simple ok" "" "$ctx_simple"

# 39e) VUNA_BASE 指向不存在的目录：明确报错（列出尝试路径），不是静默失败。
ctx_badbase=$(VUNA_BASE=/nonexistent "$VUNA" check "$ctx/simple.vuna" 2>&1)
ctx_badbase_code=$?
if [ "$ctx_badbase_code" -ne 0 ]; then ok; else bad "context bad VUNA_BASE exit" "non-zero" "$ctx_badbase_code"; fi
check_contains "context bad VUNA_BASE message" "$ctx_badbase" "/nonexistent"

# 39f) 包内 ad-hoc 入口（corpus/dt_ad_hoc：包根 Main.vuna + 同包 lib/ 模块）。
ctx_adhoc=$("$VUNA" interp corpus/dt_ad_hoc/Main.vuna 2>&1)
check_eq "context package ad-hoc interp" "42" "$ctx_adhoc"

# 39g) 两包方向性：依赖包 b 不能 import 消费包 a 的模块 → build/check/compile 三入口都拒；
#      consumer a 本身正常 build 并运行（依赖方向由包上下文决定，不靠 roots 过滤）。
cross=corpus/packages/95_cross_dep
cross_frag=$(cat "$cross/expected.err")
for cross_cmd in "build $cross/b" "check $cross/b" "compile $cross/b $tmp/cross-out"; do
  # shellcheck disable=SC2086
  cross_msg=$("$VUNA" $cross_cmd 2>&1)
  cross_code=$?
  check_contains "context cross-dep rejected: $cross_cmd" "$cross_msg" "$cross_frag"
  if [ "$cross_code" -ne 0 ]; then ok; else bad "context cross-dep exit: $cross_cmd" "non-zero" "$cross_code"; fi
done
rm -rf "$cross/b/.output" "$tmp/cross-out"
rm -rf "$cross/a/.output"
if ! cross_build_out=$("$VUNA" build "$cross/a" 2>&1); then
  bad "context cross-dep consumer build" "exit 0" "$cross_build_out"
elif [ ! -x "$cross/a/.output/bin/consumer-a" ]; then
  bad "context cross-dep consumer bin" "executable" "missing"
else
  check_eq "context cross-dep consumer run" "$(cat "$cross/a/expected.out")" "$(run_bin "$cross/a/.output/bin/consumer-a" 2>&1)"
fi
rm -rf "$cross/a/.output"

# 39h) help 不再宣传已删路径（--root / --split / seed 子命令）。
help26=$("$VUNA" help 2>&1)
case "$help26" in
  *--root*) bad "context help no --root" "absent" "help still mentions --root" ;;
  *) ok ;;
esac
case "$help26" in
  *--split*) bad "context help no --split" "absent" "help still mentions --split" ;;
  *) ok ;;
esac
case "$help26" in
  *seed*) bad "context help no seed" "absent" "help still mentions seed" ;;
  *) ok ;;
esac


finish
