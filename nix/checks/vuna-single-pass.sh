#!/bin/sh
# checks.vuna-single-pass：编译器包必须**一遍**精化就写全导出面的包接口。
#
# 背景：`checkPackage` 在入口闭包覆盖导出面时跳过补做的 lib check；
# 覆盖不全时 `writeIfaceShadow` 判 `iface-skip partial`（不写包接口），于是同一份源码
# 再精化一遍，并且依赖方读不到导出面、只能整体回退全量。两者都**不报错**——只在
# `--debug-perf` 里留一行，所以用这条门禁把它变成会红的事实。
#
# 判据（本次 check 用独立空对象库，避免热 store 把读数与路径都磨平）：
#   * 不出现 `iface-skip`；
#   * `collectSigs-done` 恰好 1 次（2 次 = 补了一遍 lib check）；
#   * `iface-write=c/r` 的 covered == required。
set -eu

OUT=${1:?usage: vuna-single-pass.sh OUT}
: "${VUNA:?VUNA 未设置}"

mkdir -p "$OUT"
work=$(mktemp -d "$OUT/single-pass.XXXXXX")
export VUNA_STORE="$work/store"
export TMPDIR="$work/tmp"
mkdir -p "$TMPDIR"

if ! VUNA_DEBUG_PERF=1 "$VUNA" check packages/compiler >"$work/stdout" 2>"$work/stderr"; then
  echo "single-pass: check packages/compiler 失败" >&2
  tail -40 "$work/stdout" "$work/stderr" >&2
  exit 1
fi

fail=0
report() {
  echo "single-pass: $1" >&2
  fail=1
}

if grep -q 'iface-skip' "$work/stderr"; then
  grep 'iface-skip' "$work/stderr" >&2
  report "导出模块没被入口闭包覆盖：新增 [export] 模块时同步补 app/Main.vuna 的 import"
fi

passes=$(grep -c 'collectSigs-done' "$work/stderr" || true)
[ "$passes" = "1" ] || report "collectSigs-done=$passes（应为 1）"

iface=$(grep -o 'iface-write=[0-9]*/[0-9]*' "$work/stderr" | head -1)
case "$iface" in
  iface-write=*)
    counts=${iface#iface-write=}
    covered=${counts%%/*}
    required=${counts##*/}
    [ "$covered" = "$required" ] || report "$iface（covered 必须等于 required）"
    ;;
  *)
    report "没有 iface-write 行：包接口没有被写出"
    ;;
esac

[ "$fail" -eq 0 ] || exit 1
echo "single-pass: ok（$iface，collectSigs-done=1）"