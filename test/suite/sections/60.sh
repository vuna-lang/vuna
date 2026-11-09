#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

# 60) M42：零成本表示（自动去装箱）与 `deriving via field` 的 codegen 形状。
check_absent() { # 名字 片段 文本
  case "$3" in
    *"$2"*) bad "$1" "absent" "found: $2" ;;
    *) ok ;;
  esac
}

shape_dir="$tmp/unbox-shape"
mkdir -p "$shape_dir"
cat > "$shape_dir/Main.vuna" <<'VUNA'
record UserId where
  uid : Int
deriving (Show)

data Wrap : Type where
  MkWrap : Int -> Wrap

data Tag a : Type where
  MkTag : Int -> Tag a

record Pair2 a b where
  first : a
  second : b

getUser : UserId -> Int
getUser u = u.uid

getWrap : Wrap -> Int
getWrap w = case w of
  MkWrap n => n

main : Int
main = getUser (UserId { uid = 40 }) + getWrap (MkWrap 2)
VUNA
if "$VUNA" compile --no-print "$shape_dir/Main.vuna" "$shape_dir/out" >/dev/null 2>&1; then
  ok
else
  bad "unbox shape compile" "ok" "failed"
fi
ml="$shape_dir/out/Main.ml"
if [ -f "$ml" ]; then ok; else bad "unbox shape Main.ml" "present" "missing"; fi
body=$(cat "$ml" 2>/dev/null || printf '')
check_contains "unbox record type alias" "$body" "type t_UserId = int"
check_contains "unbox data type alias" "$body" "and t_Wrap = int"
check_contains "unbox erased-param alias" "$body" "and t_Tag = int"
check_absent "unbox record has no ctor pattern" "C_UserId" "$body"
check_absent "unbox data has no ctor pattern" "C_Wrap_MkWrap" "$body"
check_absent "unbox data has no match" "match w with" "$body"
check_contains "boxed multi-field record keeps variant" "$body" "t_Pair2 = C_Pair2_Pair2 of"
check_contains "boxed multi-field ctor kept" "$body" "C_Pair2_Pair2"

# `deriving via field`：生成实例，但方法体委托到底层字段的实例。
cat > "$shape_dir/Deleg.vuna" <<'VUNA'
record UserId where
  uid : Int
deriving via field (Show, Eq)

u : UserId
u = UserId { uid = 3 }

main : String
main = show u ++ (if u == u then "/eq" else "/ne")
VUNA
if "$VUNA" compile --no-print "$shape_dir/Deleg.vuna" "$shape_dir/deleg" >/dev/null 2>&1; then
  ok
else
  bad "deriving via field compile" "ok" "failed"
fi
deleg_ml="$shape_dir/deleg/Main.ml"
deleg=$(cat "$deleg_ml" 2>/dev/null || printf '')
check_contains "deriving via field show delegate" "$deleg" "v_Base_dShow_dshow"
check_contains "deriving via field eq delegate" "$deleg" "v_Base_dEq_deq"

finish
