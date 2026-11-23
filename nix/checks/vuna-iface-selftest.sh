#!/bin/sh
# checks.vuna-iface-selftest：接口载荷必须能重算出记录里的 `miIfaceHash`。
#
# 不变式：`miIfaceHash == hashOfIface` 对该模块载荷的结果。载荷里任何字段（含依赖表）
# 被改写而哈希没跟着变，都会让依赖方按过期接口复用——这类漂移不会报错，只会让增量
# 编译产出错的结果，所以在写侧把它变成会红的事实。
#
# 判据（`VUNA_IFACE_SELFTEST=1` 打开写侧自证）：
#   * check 退出码 0（自证失败时写侧跳过写并留 `iface-selftest=skip-write`）；
#   * stderr 不出现 `iface-hash-mismatch`。
# 每个包用同一个空对象库：第二个包会复用第一个包的接口，顺带覆盖「读回再重算」的路径。
set -eu

OUT=${1:?usage: vuna-iface-selftest.sh OUT}
: "${VUNA:?VUNA 未设置}"

work=$(mktemp -d "$OUT/iface-selftest.XXXXXX")
export VUNA_STORE="$work/store"
export TMPDIR="$work/tmp"
mkdir -p "$TMPDIR"

for pkg in packages/base packages/compiler; do
  if ! VUNA_IFACE_SELFTEST=1 VUNA_LOG=debug "$VUNA" check "$pkg" \
    >"$work/out" 2>"$work/err"; then
    echo "iface-selftest: check $pkg 失败（自证失败时写侧不写接口）" >&2
    tail -40 "$work/out" "$work/err" >&2
    exit 1
  fi

  if grep -q 'iface-hash-mismatch' "$work/err"; then
    echo "iface-selftest: $pkg 的载荷与记录哈希漂移：" >&2
    grep 'iface-hash-mismatch' "$work/err" >&2
    exit 1
  fi
done

echo "iface-selftest: ok（base + compiler 的模块载荷都能重算出记录哈希）" >&2