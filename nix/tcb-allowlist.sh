#!/bin/sh
# TCB 完整 allowlist 断言：seed/ 的文件集必须与提交入库的清单逐项一致。
#
# 用法: sh nix/tcb-allowlist.sh ALLOWLIST DIR
#   ALLOWLIST  允许出现在 seed/ 的文件名清单（nix/seed-files.txt，由 rotation 自动更新）
#   DIR        要检查的目录（通常 seed）
#
# 黑名单（nix/tcb-check.sh）只防「已知危险模块」；数量断言（nix/seed-count.txt）只防
# 缩水。本脚本保证「多一个/少一个/换一个文件」都能被发现，且清单变更进入 review。
set -eu

if [ "$#" -ne 2 ]; then
  echo "usage: tcb-allowlist.sh ALLOWLIST DIR" >&2
  exit 2
fi

list=$1
dir=$2
if [ ! -f "$list" ]; then
  echo "tcb-allowlist: 找不到 allowlist：$list" >&2
  exit 1
fi
if [ ! -d "$dir" ]; then
  echo "tcb-allowlist: 找不到目录：$dir" >&2
  exit 1
fi

tmp=$(mktemp)
trap 'rm -f "$tmp"' EXIT INT TERM
find "$dir" -maxdepth 1 -type f -exec basename {} \; | LC_ALL=C sort >"$tmp"

if ! diff -u "$list" "$tmp" >&2; then
  echo "tcb-allowlist: $dir 的文件集与 $list 不一致；seed/ 只能经 rotation 更新（清单由 rotation 同步）" >&2
  exit 1
fi
