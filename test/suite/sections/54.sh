#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

# 54) REPL v2：自动签名 / 泛化 / 重定义 / 块输入 / 加载矩阵 / 命令面 / 颜色 / 历史 /
#     pty 行编辑（方向键、Ctrl-R、Ctrl-C、Ctrl-D、Tab）。
check_absent() { # 名字 片段 文本
  case "$3" in
    *"$2"*) bad "$1" "absent" "found: $2" ;;
    *) ok ;;
  esac
}

repl_v2_defs=$(printf 'x = 1 + 1\nx + 40\nf y = x + y\nf 40\nid z = z\nid 41\n:q\n' | "$VUNA" repl 2>&1)
check_contains "repl v2 auto sig value" "$repl_v2_defs" "42"
check_contains "repl v2 auto sig function" "$repl_v2_defs" "41"

repl_v2_poly=$(printf 'id z = z\n:type id\n:q\n' | "$VUNA" repl 2>&1)
check_contains "repl v2 generalization" "$repl_v2_poly" "id : {t0 : Type} -> t0 -> t0"

repl_v2_bad=$(printf 'f 0 = 1\n1 + 1\n:q\n' | "$VUNA" repl 2>&1)
check_contains "repl v2 infer failure hint" "$repl_v2_bad" "请先写类型签名"
check_contains "repl v2 infer failure rollback" "$repl_v2_bad" "2"

repl_v2_redef=$(printf 'x = 1\nx = 2\nx\n:delete x\nx\n:q\n' | "$VUNA" repl 2>&1)
check_contains "repl v2 redefinition" "$repl_v2_redef" "已删除 x"
check_contains "repl v2 delete then unbound" "$repl_v2_redef" "unbound variable x"

repl_v2_block=$(printf ':{\n  x = 1 + 1\n  f y = x + y\n:}\nf 40\n:q\n' | "$VUNA" repl 2>&1)
check_contains "repl v2 block def" "$repl_v2_block" "42"

repl_v2_defs_cmd=$(printf 'x = 1\nf y = x + y\n:defs\n:imports\nimport Base.IO\n:imports\n:q\n' | "$VUNA" repl 2>&1)
check_contains "repl v2 :defs type" "$repl_v2_defs_cmd" "x : Int"
check_contains "repl v2 :defs fn type" "$repl_v2_defs_cmd" "f : Int -> Int"
check_contains "repl v2 :imports" "$repl_v2_defs_cmd" "import Base.IO"

# B1 回归：显式隐式 binder 不再被重复量化；B3 回归：类型文本 zonk。
repl_v2_ty=$(printf 'm : {a : Type} -> a -> a\nm x = x\n:type m\n:type [1, 2, 3]\nid z = z\n:type id 1\n:q\n' | "$VUNA" repl 2>&1)
check_contains "repl v2 no duplicate implicit binder" "$repl_v2_ty" "m : {a : Type} -> a -> a"
check_absent "repl v2 duplicate implicit binder absent" "{a : Type} -> {a : Type}" "$repl_v2_ty"
check_contains "repl v2 type zonk list" "$repl_v2_ty" "List Int"
check_contains "repl v2 type infer app" "$repl_v2_ty" "id 1 : Int"

# v2.1：隐式 Prelude 可见；导入模块的类型名可作为项（`:type` 给 kind）。
repl_v2_kind=$(printf ':type Maybe\n:type Maybe Int\n:type Bool\n:type List\n:imports\n:q\n' | "$VUNA" repl 2>&1)
check_contains "repl v2 :type data kind" "$repl_v2_kind" "Maybe : (a : Type) -> Type"
check_contains "repl v2 :type data kind applied" "$repl_v2_kind" "Maybe Int : Type"
check_contains "repl v2 :type Bool" "$repl_v2_kind" "Bool : Type"
check_contains "repl v2 :type List via prelude" "$repl_v2_kind" "List : (a : Type) -> Type"
check_contains "repl v2 :imports implicit prelude" "$repl_v2_kind" "import Prelude"
check_contains "repl v2 :imports implicit marker" "$repl_v2_kind" "隐式自动导入"

repl_v2_kind_qual=$(printf ':load Base.Maybe\n:type Base.Maybe.Maybe\n:q\n' | "$VUNA" repl 2>&1)
check_contains "repl v2 :type qualified type name" "$repl_v2_kind_qual" "Base.Maybe.Maybe : (a : Type) -> Type"

repl_v2_kind_load=$(printf ':load Base\n:type Maybe\n:q\n' | "$VUNA" repl 2>&1)
check_contains "repl v2 :type after :load" "$repl_v2_kind_load" "Maybe : (a : Type) -> Type"

# v2.2：`:typeinfo`（`:ti`）单独列隐式参数 + 文档；裸运算符自动补括号；`>>` 给 do 派生提示。
repl_v2_typeinfo=$(printf 'id z = z\n:typeinfo id\n:ti id\n:type +\n:type >>\n:type (>>)\n:typeinfo Maybe\n:q\n' | "$VUNA" repl 2>&1)
check_contains "repl v2 :typeinfo implicit header" "$repl_v2_typeinfo" "隐式参数"
check_contains "repl v2 :typeinfo implicit binder" "$repl_v2_typeinfo" "{t0 : Type}"
check_contains "repl v2 :typeinfo explicit line" "$repl_v2_typeinfo" "id : t0 -> t0"
check_contains "repl v2 :ti alias" "$repl_v2_typeinfo" "id : t0 -> t0"
# D23：`+` 是 Base.Num.add 的方法别名，`:type` 显示 Num 约束（不再是 Int 内建值）。
check_contains "repl v2 :type bare operator" "$repl_v2_typeinfo" "+ : {a : Type} -> (Dict_Base.Num.Num a) -> a -> a -> a"
check_contains "repl v2 :type do-derived hint" "$repl_v2_typeinfo" "do 派生"
check_contains "repl v2 :typeinfo docstring" "$repl_v2_typeinfo" "可选值"
repl_v2_typeinfo_usage=$(printf ':typeinfo\n:q\n' | "$VUNA" repl 2>&1)
check_contains "repl v2 :typeinfo usage" "$repl_v2_typeinfo_usage" "用法: :typeinfo"

# v2.3：`:type` 的类型文本按 token 类别着色（universe / 箭头 / 全局名）。
repl_v2_type_color=$(printf ':set color on\n:type Just\n:q\n' | "$VUNA" repl 2>&1)
check_contains "repl v2 type universe color" "$repl_v2_type_color" "$(printf '\033')[1;35mType"
check_contains "repl v2 type arrow color" "$repl_v2_type_color" "$(printf '\033')[34m->"
check_contains "repl v2 type global color" "$repl_v2_type_color" "$(printf '\033')[36mBase.Maybe.Maybe"

# 值显示：列表 / 元组 / Maybe / 函数 / 构造子短名。
repl_v2_show=$(printf ':load Base.Nat\nSucc Zero\nimport Base.List\nimport Base.Maybe\nimport Base.Pair\n[1, 2, 3]\nJust 1\nPair 1 2\nfun x = x\nfun\n:q\n' | "$VUNA" repl 2>&1)
check_contains "repl v2 show list" "$repl_v2_show" "[1, 2, 3]"
check_contains "repl v2 show maybe" "$repl_v2_show" "Just 1"
check_contains "repl v2 show pair" "$repl_v2_show" "(1, 2)"
check_contains "repl v2 show function" "$repl_v2_show" "<函数>"
check_contains "repl v2 show nat numeric" "$repl_v2_show" "1"

# :set / 历史 / :again / :abandon / 未知命令建议。
repl_v2_set=$(printf ':set +t\n1 + 1\n:set +s\n1 + 1\n:set prompt X> \n:q\n' | "$VUNA" repl 2>&1)
check_contains "repl v2 :set +t" "$repl_v2_set" ":: Int"
check_contains "repl v2 :set +s" "$repl_v2_set" " ms]"
check_contains "repl v2 :set prompt" "$repl_v2_set" "prompt = X> "

rm -f "$tmp/repl-v2-again-hist"
repl_v2_again=$(printf ':set +t\n:set -t\n:again 1\n:q\n' | VUNA_REPL_HISTORY="$tmp/repl-v2-again-hist" "$VUNA" repl 2>&1)
again_hits=$(printf '%s\n' "$repl_v2_again" | grep -c "+t on" || true)
check_eq "repl v2 :again" "2" "$again_hits"

repl_v2_abandon=$(printf 'x =\n:abandon\n1 + 1\n:q\n' | "$VUNA" repl 2>&1)
check_contains "repl v2 :abandon" "$repl_v2_abandon" "已放弃当前输入"
check_contains "repl v2 :abandon continues" "$repl_v2_abandon" "2"

repl_v2_unknown=$(printf ':typ\n:q\n' | "$VUNA" repl 2>&1)
check_contains "repl v2 unknown suggestion" "$repl_v2_unknown" ":type"

# 模块加载 / 模块名错误 / 目录加载 / 模块文件拒绝。
repl_v2_mod=$(printf ':load Base.Nat\nZero\n:q\n' | "$VUNA" repl 2>&1)
check_contains "repl v2 :load module" "$repl_v2_mod" "已导入模块 Base.Nat"
check_contains "repl v2 :load module usable" "$repl_v2_mod" "0"

repl_v2_nomod=$(printf ':load Does.Not.Exist\n:q\n' | "$VUNA" repl 2>&1)
check_contains "repl v2 :load missing module" "$repl_v2_nomod" "找不到模块"

repl_ws="$tmp/repl-v2-ws"
mkdir -p "$repl_ws/lib"
printf '[package]\nname = "replws"\n\n[dependencies]\nvuna-base = "%s"\n' "$VUNA_BASE" >"$repl_ws/vuna.toml"
printf 'module Foo (greeting) where\n\ngreeting : String\ngreeting = "hi"\n' >"$repl_ws/lib/Foo.vuna"
repl_v2_dir=$(printf ':q\n' | "$VUNA" repl "$repl_ws" 2>&1)
check_contains "repl v2 cli DIR context" "$repl_v2_dir" "replws"
repl_v2_dirload=$(printf ':load %s\n:q\n' "$repl_ws" | "$VUNA" repl 2>&1)
check_contains "repl v2 :load DIR" "$repl_v2_dirload" "已切换包 replws"

repl_v2_ws=$( ( cd "$repl_ws" && printf ':browse Foo\n:info greeting\n:search greeting\n:browse\n:q\n' | "$VUNA" repl 2>&1 ) )
check_contains "repl v2 :browse module" "$repl_v2_ws" "## Foo"
check_contains "repl v2 :info symbol" "$repl_v2_ws" "Foo.greeting"
check_contains "repl v2 :search hit" "$repl_v2_ws" "greeting : String"
check_contains "repl v2 :browse list" "$repl_v2_ws" "Foo.vuna"

repl_entry="$tmp/repl-v2-entry.vuna"
printf 'answer : Int\nanswer = 42\n' >"$repl_entry"
repl_v2_file=$(printf 'answer\n:q\n' | "$VUNA" repl "$repl_entry" 2>&1)
check_contains "repl v2 cli FILE load" "$repl_v2_file" "已加载"
check_contains "repl v2 cli FILE usable" "$repl_v2_file" "42"
repl_v2_cli_mod=$(printf 'Zero\n:q\n' | "$VUNA" repl Base.Nat 2>&1)
check_contains "repl v2 cli MODULE" "$repl_v2_cli_mod" "已导入模块 Base.Nat"
printf ':q\n' | "$VUNA" repl Does.Not.Exist >/dev/null 2>&1
repl_v2_cli_bad_code=$?
check_eq "repl v2 cli bad module exit" "2" "$repl_v2_cli_bad_code"

# 颜色：管道默认关闭；`:set color on` 强制开启。
repl_v2_plain=$(printf '1 + 1\n:q\n' | "$VUNA" repl 2>&1)
check_absent "repl v2 no ansi in pipe" "$(printf '\033')" "$repl_v2_plain"
repl_v2_color=$(printf ':set color on\n1 + 1\n:q\n' | "$VUNA" repl 2>&1)
check_contains "repl v2 color on ansi" "$repl_v2_color" "$(printf '\033')["

# 历史持久化：单行单元写入文件，下一次会话恢复。
printf '7 + 1\n:q\n' | VUNA_REPL_HISTORY="$tmp/repl-v2-hist" "$VUNA" repl >/dev/null 2>&1
check_contains "repl v2 history file" "$(cat "$tmp/repl-v2-hist" 2>/dev/null)" "7 + 1"
repl_v2_hist2=$(printf ':history\n:q\n' | VUNA_REPL_HISTORY="$tmp/repl-v2-hist" "$VUNA" repl 2>&1)
check_contains "repl v2 history restored" "$repl_v2_hist2" "7 + 1"

# pty 行编辑：方向键 / Ctrl-R / 退格 / Ctrl-C / Ctrl-D / Tab。
if command -v script >/dev/null 2>&1; then
  repl_pty_arrow=$( ( sleep 0.5; printf '1 + 1\n'; sleep 0.3; printf '\033[A\n'; sleep 0.3; printf ':q\n' ) \
    | NO_COLOR=1 VUNA_REPL_HISTORY="$tmp/repl-pty-a" script -qec "$VUNA repl" /dev/null 2>&1 | tr -d '\r' )
  repl_pty_arrow_n=$(printf '%s\n' "$repl_pty_arrow" | grep -c '^2$' || true)
  check_eq "repl v2 pty arrow-up" "2" "$repl_pty_arrow_n"

  repl_pty_cr=$( ( sleep 0.5; printf '1 + 1\n'; sleep 0.3; printf '\0221 + 1\r\r'; sleep 0.3; printf ':q\n' ) \
    | NO_COLOR=1 VUNA_REPL_HISTORY="$tmp/repl-pty-r" script -qec "$VUNA repl" /dev/null 2>&1 | tr -d '\r' )
  repl_pty_cr_n=$(printf '%s\n' "$repl_pty_cr" | grep -c '^2$' || true)
  check_eq "repl v2 pty ctrl-r" "2" "$repl_pty_cr_n"

  repl_pty_bs=$( ( sleep 0.5; printf '12\033[D\177\n'; sleep 0.3; printf ':q\n' ) \
    | NO_COLOR=1 VUNA_REPL_HISTORY="$tmp/repl-pty-b" script -qec "$VUNA repl" /dev/null 2>&1 | tr -d '\r' )
  repl_pty_bs_n=$(printf '%s\n' "$repl_pty_bs" | grep -c '^2$' || true)
  check_eq "repl v2 pty left+backspace" "1" "$repl_pty_bs_n"

  repl_pty_cc=$( ( sleep 0.5; printf '1 + 1\003'; sleep 0.3; printf '2 + 2\n'; sleep 0.3; printf ':q\n' ) \
    | NO_COLOR=1 VUNA_REPL_HISTORY="$tmp/repl-pty-c" script -qec "$VUNA repl" /dev/null 2>&1 | tr -d '\r' )
  repl_pty_cc_4=$(printf '%s\n' "$repl_pty_cc" | grep -c '^4$' || true)
  repl_pty_cc_2=$(printf '%s\n' "$repl_pty_cc" | grep -c '^2$' || true)
  check_eq "repl v2 pty ctrl-c cancels line" "0" "$repl_pty_cc_2"
  check_eq "repl v2 pty ctrl-c continues" "1" "$repl_pty_cc_4"

  ( sleep 0.5; printf '\004' ) | NO_COLOR=1 VUNA_REPL_HISTORY="$tmp/repl-pty-d" script -qec "$VUNA repl" /dev/null >/dev/null 2>&1
  check_eq "repl v2 pty ctrl-d exit" "0" "$?"

  repl_pty_tab=$( ( sleep 0.5; printf ':he\t\n'; sleep 0.3; printf ':q\n' ) \
    | NO_COLOR=1 VUNA_REPL_HISTORY="$tmp/repl-pty-t" script -qec "$VUNA repl" /dev/null 2>&1 | tr -d '\r' )
  check_contains "repl v2 pty tab completion" "$repl_pty_tab" "命令："
else
  bad "repl v2 pty tests" "script (util-linux) in PATH" "missing"
fi


finish
