#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

# 17) M9 诊断：穷尽性/模式诊断与退出码（M24 起 interp 与 check/compile 共用 DT 静态诊断）
#     M26：$tmp 里的临时夹具没有 manifest → base-only 上下文，base 位置由 VUNA_BASE 给出。
mkdir -p "$tmp/m9"
cat > "$tmp/m9/loc.vuna" <<'EOF'
data Maybe : Type where
  Just : Int -> Maybe
  Nothing : Maybe

f : Maybe -> Int
f (Just x) = x

main : Int
main = f Nothing
EOF
loc_i=$("$VUNA" interp "$tmp/m9/loc.vuna" 2>&1)
check_contains "m9 interp non-exhaustive" "$loc_i" "case is not exhaustive"
"$VUNA" interp "$tmp/m9/loc.vuna" >/dev/null 2>&1
m9_interp_code=$?
if [ "$m9_interp_code" -ne 0 ]; then ok; else bad "m9 interp non-exhaustive exit" "non-zero" "$m9_interp_code"; fi
# M24：DT 只有静态穷尽性诊断（HM 的运行时 `no matching clause` 位置随 HM codegen 删除），
# 因此 compile 也必须在此报同一静态错误、且不写输出目录。
rm -rf "$tmp/m9/loc-out"
loc_c=$("$VUNA" compile "$tmp/m9/loc.vuna" "$tmp/m9/loc-out" 2>&1)
loc_code=$?
check_contains "m9 compile non-exhaustive" "$loc_c" "case is not exhaustive"
if [ "$loc_code" -ne 0 ]; then ok; else bad "m9 compile non-exhaustive exit" "non-zero" "$loc_code"; fi
if [ -e "$tmp/m9/loc-out" ]; then
  bad "m9 compile non-exhaustive no output" "absent" "present"
else
  ok
fi

cat > "$tmp/m9/ne_case.vuna" <<'EOF'
data Maybe : Type where
  Just : Int -> Maybe
  Nothing : Maybe

g : Maybe -> Int
g x = case x of
  Just a => a

main : Int
main = g Nothing
EOF
ne=$("$VUNA" check "$tmp/m9/ne_case.vuna" 2>&1)
check_contains "m9 non-exhaustive case" "$ne" "case is not exhaustive"

cat > "$tmp/m9/ne_fun.vuna" <<'EOF'
data Maybe : Type where
  Just : Int -> Maybe
  Nothing : Maybe

f : Maybe -> Int
f (Just x) = x

main : Int
main = f Nothing
EOF
nef=$("$VUNA" check "$tmp/m9/ne_fun.vuna" 2>&1)
check_contains "m9 non-exhaustive function" "$nef" "case is not exhaustive"

cat > "$tmp/m9/red.vuna" <<'EOF'
data B : Type where
  T : B
  F : B

g : B -> Int
g x = case x of
  T => 1
  _ => 0
  F => 2

main : Int
main = g T
EOF
# DT 的模式诊断：catch-all 之后还有分支 → 静态报错（HM 的 redundant pattern 警告已随 HM 删除）。
rd=$("$VUNA" check "$tmp/m9/red.vuna" 2>&1)
check_contains "m9 catch-all not last" "$rd" "catch-all branch must be the last one"

cat > "$tmp/m9/ok.vuna" <<'EOF'
data Maybe : Type where
  Just : Int -> Maybe
  Nothing : Maybe

g : Maybe -> Int
g x = case x of
  Just a => a
  Nothing => 0

main : Int
main = g Nothing
EOF
okw=$("$VUNA" check "$tmp/m9/ok.vuna" 2>&1)
check_eq "m9 exhaustive clean" "" "$okw"

cat > "$tmp/m9/type_err.vuna" <<'EOF'
main : Int
main = "oops"
EOF
"$VUNA" check "$tmp/m9/type_err.vuna" >/dev/null 2>&1
m9_check_code=$?
if [ "$m9_check_code" -ne 0 ]; then ok; else bad "m9 check type err exit" "non-zero" "$m9_check_code"; fi
rm -rf "$tmp/m9/type_err-out"
"$VUNA" compile "$tmp/m9/type_err.vuna" "$tmp/m9/type_err-out" >/dev/null 2>&1
m9_compile_code=$?
if [ "$m9_compile_code" -ne 0 ]; then ok; else bad "m9 compile type err exit" "non-zero" "$m9_compile_code"; fi


finish
