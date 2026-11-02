#!/bin/sh
# TCB 黑名单断言：检查给定目录里是否出现禁止进入 seed 闭包的模块。
#
# 用法: sh nix/tcb-check.sh LIST DIR...
#   LIST  黑名单文件（每行一个模块名，忽略空行与 # 注释）
#   DIR   要检查的目录（如 seed、s1、s2）
#
# `checks.seed-selfhost` 与 `nix/seed-rotate.sh` 共用本脚本与同一份 LIST。
set -eu

if [ "$#" -lt 2 ]; then
  echo "usage: tcb-check.sh LIST DIR..." >&2
  exit 2
fi

list=$1
shift

if [ ! -f "$list" ]; then
  echo "tcb-check.sh: 找不到黑名单文件：$list" >&2
  exit 1
fi

fail=0
while IFS= read -r module || [ -n "$module" ]; do
  case $module in
    '' | '#'*) continue ;;
  esac
  for dir in "$@"; do
    if [ -e "$dir/Vuna_d$module.ml" ]; then
      printf 'tcb-check: %s 包含禁止进入 seed 闭包的模块 Vuna.%s\n' "$dir" "$module" >&2
      fail=1
    fi
  done
done <"$list"

if [ "$fail" -ne 0 ]; then
  echo "tcb-check: TCB 边界被破坏（见 $list）" >&2
  exit 1
fi