#!/bin/sh
# 进程绑定岛门禁：steps 用例里仍然 spawn `vuna` 的文件必须逐个登记原因。
#
# 背景：fixture 用例（CGolden / CError / CCheck / CLint / CFix）全部进程内执行
# （直接调用编译器函数、断言返回值）。steps 里剩下的子进程都是**构造上不可进程内**的
# 场景（PTY、stdio 帧、产物执行、多进程 store 互斥、CLI 渲染文本）。
#
# 判据（两条）：
#   1. 出现 `"$VUNA"` 的文件必须出现在 `test/suite/process-bound.txt`；
#   2. 登记行按**进程绑定组**计数，不得超过 `nix/checks/data/steps-inproc.max`
#      （ratchet：只允许下降）。第 4 列是组名；省略时组名 = 文件名。把一个重 case
#      按主题拆成多个 steps 文件时，各文件共用原组名，计数不增长（子命令面没有变化）。
set -eu

root=$(pwd)
cd "$root"

registry=test/suite/process-bound.txt
maxfile=nix/checks/data/steps-inproc.max

[ -f "$registry" ] || {
  echo "steps-inproc: missing $registry" >&2
  exit 1
}

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

# 登记文件名（忽略注释/空行）。
awk -F'\t' '!/^#/ && NF > 0 { print $1 }' "$registry" | sort -u > "$tmp/registered.txt"

# 进程绑定组：第 4 列优先，缺省组名 = 文件名。拆文件共用组名 ⇒ 计数不变。
awk -F'\t' '!/^#/ && NF > 0 { g = ($4 != "" ? $4 : $1); print g }' "$registry" | sort -u > "$tmp/groups.txt"

# 实际仍 spawn `vuna` 的 steps 文件。
grep -l '"$VUNA"' packages/*/test/steps/*.steps 2>/dev/null | sed 's|.*/||' | sort -u > "$tmp/found.txt" || true

unregistered=$(comm -23 "$tmp/found.txt" "$tmp/registered.txt" || true)
if [ -n "$unregistered" ]; then
  echo "steps-inproc: these steps still spawn \$VUNA but are not registered in $registry:" >&2
  printf '  %s\n' $unregistered >&2
  echo "Register with '<file> TAB <subcommand> TAB <reason> [TAB <group>]', or move the step in-process." >&2
  exit 1
fi

stale=$(comm -13 "$tmp/found.txt" "$tmp/registered.txt" || true)
if [ -n "$stale" ]; then
  echo "steps-inproc: registered files no longer spawn \$VUNA (remove them from $registry):" >&2
  printf '  %s\n' $stale >&2
  exit 1
fi

registered_n=$(wc -l < "$tmp/groups.txt" | tr -d ' ')
limit=$(tr -d '[:space:]' < "$maxfile" 2>/dev/null || echo 0)
if [ "$limit" -gt 0 ] && [ "$registered_n" -gt "$limit" ]; then
  echo "steps-inproc: process-bound island grew to ${registered_n} group(s) > ratchet ${limit}" >&2
  exit 1
fi

echo "steps-inproc: ok (${registered_n} process-bound group(s), ratchet ${limit})"
