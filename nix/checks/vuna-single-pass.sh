#!/bin/sh
# checks.vuna-single-pass：带导出面的包必须**一遍**精化就写全包接口。
#
# 背景：`checkPackage` 在入口闭包覆盖导出面时跳过补做的 lib check；
# 覆盖不全时 `writeIfaceShadow` 判 `iface-skip partial`（不写包接口），于是同一份源码
# 再精化一遍，并且依赖方读不到导出面、只能整体回退全量。两者都**不报错**——只在
# `VUNA_LOG=debug` 里留一行，所以用这条门禁把它变成会红的事实。
#
# 判据（每个包用独立空对象库，避免热 store 把读数与路径都磨平）：
#   * 不出现 `iface-skip`；
#   * `collectSigs-done` 恰好 1 次（2 次 = 补了一遍 lib check）；
#   * `iface-write=c/r` 的 covered == required。
set -eu

OUT=${1:?usage: vuna-single-pass.sh OUT}
: "${VUNA:?VUNA 未设置}"

PACKAGES="packages/compiler packages/toolchain"

mkdir -p "$OUT"
fail=0
report() {
  echo "single-pass: $1" >&2
  fail=1
}

for pkg in $PACKAGES; do
  work=$(mktemp -d "$OUT/single-pass.XXXXXX")
  export VUNA_STORE="$work/store"
  export VUNA_PKG_STATE="$work/state"
  export TMPDIR="$work/tmp"
  mkdir -p "$TMPDIR"

  # 依赖先预热：递归构建会自己 check 依赖，collectSigs 行不能算到被测包头上。
  case "$pkg" in
    packages/compiler)
      deps="packages/base packages/compiler-base packages/ir packages/target-ocaml"
      ;;
    packages/toolchain)
      deps="packages/obs packages/target-ocaml packages/ir packages/compiler-base packages/base packages/compiler packages/http packages/plugin-kit"
      ;;
    *)
      deps=""
      ;;
  esac
  for d in $deps; do
    VUNA_LOG=off "$VUNA" check "$d" >/dev/null 2>&1 || { echo "single-pass: prewarm $d 失败" >&2; exit 1; }
  done

  if ! VUNA_LOG=debug "$VUNA" check "$pkg" >"$work/stdout" 2>"$work/stderr"; then
    echo "single-pass: check $pkg 失败" >&2
    tail -40 "$work/stdout" "$work/stderr" >&2
    exit 1
  fi

  if grep -q 'iface-skip' "$work/stderr"; then
    grep 'iface-skip' "$work/stderr" >&2
    report "$pkg：导出模块没被入口闭包覆盖（同步补入口 import，或把只服务 dev 的模块移出 [export]）"
  fi

  passes=$(grep -c 'collectSigs-done' "$work/stderr" || true)
  [ "$passes" = "1" ] || report "$pkg：collectSigs-done=$passes（应为 1）"

  iface=$(grep -o 'iface-write=[0-9]*/[0-9]*' "$work/stderr" | head -1)
  case "$iface" in
    iface-write=*)
      counts=${iface#iface-write=}
      covered=${counts%%/*}
      required=${counts##*/}
      [ "$covered" = "$required" ] || report "$pkg：$iface（covered 必须等于 required）"
      ;;
    *)
      report "$pkg：没有 iface-write 行（包接口没有被写出）"
      ;;
  esac
done

[ "$fail" -eq 0 ] || exit 1
echo "single-pass: ok（compiler + toolchain，各 collectSigs-done=1）"
