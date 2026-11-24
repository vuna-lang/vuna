#!/usr/bin/env bash
# 手写 C 对照的批量校验：按 run.sh 的口径编译（-O2 + sidecar 的 cc_flags）、按 `n=` 运行、
# 与 golden 做与 run.sh 相同的比较（命令替换，忽略行尾换行）。
#
# 用法（仓库根）：sh bench/lib/verify-c-refs.sh [bench/programs]
# 退出码：0 = 全部通过；1 = 有编译失败或输出不符。
set -uo pipefail

ROOT=$(cd "$(dirname "$0")/../.." && pwd)
PROGRAMS=${1:-$ROOT/bench/programs}
WORK=$(mktemp -d "${TMPDIR:-/tmp}/vuna-c-refs.XXXXXX")
trap 'rm -rf "$WORK"' EXIT INT TERM

fail=0
for d in "$PROGRAMS"/t*/*/; do
  name=$(basename "$d")
  src=$d$name.c
  bench=$d$name.bench
  if [ ! -f "$src" ]; then
    echo "MISSING-C $name"
    fail=1
    continue
  fi
  n=$(sed -n 's/^n=//p' "$bench" 2>/dev/null | tail -1)
  flags=$(sed -n 's/^cc_flags=//p' "$bench" 2>/dev/null | tail -1)
  # shellcheck disable=SC2086  # cc_flags / n 是 sidecar 里的参数串
  if ! cc -O2 -Wall -Wextra -Werror $flags -o "$WORK/$name" "$src" 2>"$WORK/$name.cc.log"; then
    echo "CC-FAIL $name"
    sed -n 1,5p "$WORK/$name.cc.log"
    fail=1
    continue
  fi
  # shellcheck disable=SC2086
  got=$("$WORK/$name" $n 2>"$WORK/$name.run.log")
  want=$(cat "$d$name.out")
  if [ "$got" != "$want" ]; then
    echo "OUT-MISMATCH $name (n=$n flags=$flags)"
    printf '%s\n' "$got" | diff -u "$d$name.out" - | head -6
    fail=1
  fi
done
[ "$fail" -eq 0 ] && echo "c-refs ok: $(find "$PROGRAMS" -mindepth 3 -maxdepth 3 -name '*.c' | wc -l | tr -d ' ') files"
exit "$fail"