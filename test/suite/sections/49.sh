#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

# 49) M38 REPL 调试命令：:type / :load / :reload / :browse + 错误路径。
m38_repl_ty=$(printf ':type 1 + 1\n:q\n' | "$VUNA" repl 2>&1)
check_contains "m38 repl :type" "$m38_repl_ty" "1 + 1 : Int"
m38_repl_ty_usage=$(printf ':type\n:q\n' | "$VUNA" repl 2>&1)
check_contains "m38 repl :type usage" "$m38_repl_ty_usage" "用法: :type"
m38_scratch="$tmp/m38-scratch.vuna"
printf 'answer : Int\nanswer = 42\n' >"$m38_scratch"
m38_repl_load=$(printf ':load %s\nanswer\n:reload\nanswer\n:q\n' "$m38_scratch" | "$VUNA" repl 2>&1)
check_contains "m38 repl :load" "$m38_repl_load" "已加载"
check_contains "m38 repl :reload" "$m38_repl_load" "已重新加载"
check_contains "m38 repl loaded value" "$m38_repl_load" "42"
m38_repl_mod=$(printf ':load %s/../lib/Vuna/Repl.vuna\n:q\n' "$VUNA_BASE" | "$VUNA" repl 2>&1)
check_contains "m38 repl :load rejects module" "$m38_repl_mod" "是模块文件"
m38_repl_noload=$(printf ':reload\n:q\n' | "$VUNA" repl 2>&1)
check_contains "m38 repl :reload without load" "$m38_repl_noload" "还没有 :load"
m38_repl_unknown=$(printf ':frobnicate\n:q\n' | "$VUNA" repl 2>&1)
check_contains "m38 repl unknown command" "$m38_repl_unknown" "未知命令"
m38_bws="$tmp/m38-browse"
mkdir -p "$m38_bws/lib"
printf '[package]\nname = "m38-browse"\n\n[dependencies]\nvuna-base = "%s"\n' "$VUNA_BASE" >"$m38_bws/vuna.toml"
printf 'module Foo where\n\ngreeting : String\ngreeting = "hi"\n' >"$m38_bws/lib/Foo.vuna"
m38_browse=$( ( cd "$m38_bws" && printf ':browse Foo\n:q\n' | "$VUNA" repl 2>&1 ) )
check_contains "m38 repl :browse header" "$m38_browse" "## Foo"
check_contains "m38 repl :browse symbol" "$m38_browse" "greeting : String"


finish
