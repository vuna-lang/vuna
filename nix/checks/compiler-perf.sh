#!/bin/sh
# M34.6：编译器缓存有效性的 CI 门槛。
#
# 同一沙箱内先清缓存跑一次 `vuna check .`（冷，写缓存），再跑一次（热，应命中）。
# 只看比例不看绝对时间（跨机器不可比）：热必须显著快于冷的一半；缓存 key/路径一旦
# 每次都 miss，热≈冷 ⇒ 这个 check 失败。并行子进程的 spawn 也在此被覆盖（check . 是
# workspace 并行路径）。
set -eu
out=$1
vuna=${VUNA:?}
rm -rf "${TMPDIR:-/tmp}/vuna-cache"
cold0=$(date +%s%3N)
"$vuna" check . >/dev/null 2>&1
cold1=$(date +%s%3N)
"$vuna" check . >/dev/null 2>&1
warm1=$(date +%s%3N)
cold=$((cold1 - cold0))
warm=$((warm1 - cold1))
echo "check . cold=${cold}ms warm=${warm}ms"
if [ "$cold" -le 0 ]; then
  echo "FAIL: cold measurement is not positive (${cold}ms)"
  exit 1
fi
if [ "$warm" -ge $((cold / 2)) ]; then
  echo "FAIL: elab cache ineffective: warm ${warm}ms >= cold/2 (${cold}ms/2)"
  exit 1
fi
touch "$out/ok"
