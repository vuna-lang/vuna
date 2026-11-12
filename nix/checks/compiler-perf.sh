#!/bin/sh
# M34.6：编译器缓存有效性的 CI 门槛。
#
# 同一沙箱内先清缓存跑一次 `vuna check .`（冷，写缓存），再跑一次（热，应命中）。
# 只看比例不看绝对时间（跨机器不可比）：热必须显著快于冷的一半；缓存 key/路径一旦
# 每次都 miss，热≈冷 ⇒ 这个 check 失败。并行子进程的 spawn 也在此被覆盖（check . 是
# workspace 并行路径）。
#
# 另两条（M34.6）：
#   - **包内增量**：改一个叶子模块后 `check .` 必须明显快于冷路径（否则逐模块增量失效）；
#   - **工具链接口路径**：REPL 默认应走 `query-source=repl`，不应回退全量。
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

# 包内逐模块增量：改一个叶子模块后重查；语义断言比时间更稳——干净模块必须被复用
# （cache-own-clean ≈ 包内模块数的大半），只 parse 少数脏模块（叶子 + 传递依赖者）。
# 时间读数只打印，不设绝对门槛（各机器/负载差异大；端到端读数在 bench/compiler.sh）。
printf '\n-- vuna-compiler-perf incremental probe\n' >>lib/Vuna/Json.vuna
incr0=$(date +%s%3N)
incr_log=$(TMPDIR="${TMPDIR:-/tmp}" "$vuna" check . --debug-perf 2>&1)
incr1=$(date +%s%3N)
incr=$((incr1 - incr0))
echo "check . incremental=${incr}ms"
incr_clean=$(printf '%s\n' "$incr_log" | sed -n 's/.*cache-own-clean=\([0-9][0-9]*\).*/\1/p' | head -1)
incr_parses=$(printf '%s\n' "$incr_log" | grep -c 'parse-module=' || true)
echo "check . incremental: clean=${incr_clean:-?} parsed=${incr_parses}"
if [ -z "$incr_clean" ] || [ "$incr_clean" -lt 10 ]; then
  echo "FAIL: per-module increment did not reuse clean modules (cache-own-clean=${incr_clean:-missing})" >&2
  exit 1
fi
if [ "$incr_parses" -gt 20 ]; then
  echo "FAIL: per-module increment parsed too many modules (${incr_parses} > 20)" >&2
  exit 1
fi

# 工具链接口路径默认开启：REPL 一次求值应命中 iface 路径，且结果正确；如果回退全量
# （iface-fallback）或根本没走接口（无 query-source=repl），说明默认开关/闭包/安全阀坏了。
repl_out=$(printf 'import Base.List\nlength [1, 2, 3]\n:q\n' | TMPDIR="${TMPDIR:-/tmp}" VUNA_DEBUG_PERF=1 "$vuna" repl 2>&1)
echo "$repl_out" | grep -qE '(^| )3$' || {
  echo "FAIL: REPL iface evaluation produced wrong result" >&2
  echo "$repl_out" | tail -5 >&2
  exit 1
}
echo "$repl_out" | grep -q 'query-source=repl' || {
  echo "FAIL: REPL did not use the interface path (default-on broken)" >&2
  exit 1
}
if echo "$repl_out" | grep -q 'iface-fallback=repl'; then
  echo "FAIL: REPL iface path fell back to full on a trivial import" >&2
  exit 1
fi

touch "$out/ok"
