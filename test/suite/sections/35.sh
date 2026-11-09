#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

# 35) M17 工具链：`vuna goal` 洞目标显示 + LSP 编辑器冒烟
goal_out=$("$VUNA" goal corpus/dt/15_goal.vuna 2>&1)
check_contains "goal hole span" "$goal_out" "15_goal.vuna:7:11"
check_contains "goal hole type" "$goal_out" "goal Type"
"$VUNA" goal corpus/dt/15_goal.vuna >/dev/null 2>&1
check_eq "goal exit" "0" "$?"
no_hole_out=$("$VUNA" goal corpus/dt/01_id.vuna 2>&1)
check_contains "goal none" "$no_hole_out" "no holes"
"$VUNA" goal >/dev/null 2>&1
check_eq "goal no args exit" "2" "$?"
sh corpus/lsp/smoke.sh "$VUNA" >/dev/null 2>&1
check_eq "lsp smoke" "0" "$?"

# 35b) M40 洞：容错目标查询（未解洞也列出）+ 命名洞 `?goal` + fmt/lint/check
holepkg="$tmp/hole-pkg"
namedpkg="$tmp/named-hole-pkg"
mkdir -p "$holepkg/lib" "$namedpkg/lib"
cat >"$holepkg/vuna.toml" <<TOML
[package]
name = "hole-pkg"

[dependencies]
vuna-base = "$VUNA_BASE"

[export]
modules = ["Holes"]
TOML
cat >"$namedpkg/vuna.toml" <<TOML
[package]
name = "named-hole-pkg"

[dependencies]
vuna-base = "$VUNA_BASE"

[export]
modules = ["Named"]
TOML
cat >"$holepkg/lib/Holes.vuna" <<'VEOF'
module Holes where

g : Int -> Int
g n =
  let m = n + 1
  in _
VEOF
cat >"$namedpkg/lib/Named.vuna" <<'VEOF'
module Named where

g : Int -> Int
g n =
  let m = n + 1
  in ?goal
VEOF
hole_goal=$("$VUNA" goal "$holepkg/lib/Holes.vuna" 2>&1)
check_eq "goal 未解洞 exit" "0" "$?"
check_contains "goal 未解洞目标类型" "$hole_goal" ": goal Int"
check_contains "goal 未解洞上下文（let 绑定）" "$hole_goal" "m : Int"
check_contains "goal 未解洞上下文（参数）" "$hole_goal" "n : Int"
named_goal=$("$VUNA" goal "$namedpkg/lib/Named.vuna" 2>&1)
check_eq "goal 命名洞 exit" "0" "$?"
check_contains "goal 命名洞名字+目标" "$named_goal" ": goal ?goal : Int"
check_contains "goal 命名洞上下文" "$named_goal" "m : Int"
"$VUNA" check "$namedpkg" >"$tmp/named-check.log" 2>&1
check_eq "check 命名洞仍报错" "1" "$?"
named_err=$(cat "$tmp/named-check.log")
check_contains "check 命名洞错误码" "$named_err" "TC_UnsolvedHole"
check_contains "check 命名洞诊断带洞名" "$named_err" "?goal"
"$VUNA" fmt "$namedpkg/lib/Named.vuna" >/dev/null 2>&1
check_contains "fmt 保留命名洞" "$(cat "$namedpkg/lib/Named.vuna")" "?goal"
"$VUNA" fmt --check "$namedpkg/lib/Named.vuna" >/dev/null 2>&1
check_eq "fmt 命名洞幂等" "0" "$?"
"$VUNA" lint "$namedpkg/lib/Named.vuna" >/dev/null 2>&1
check_eq "lint 命名洞" "0" "$?"


finish
