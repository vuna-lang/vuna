#!/bin/sh
# checks.vuna-obs-schema：可观测性的**结构**门禁（`docs/reference/observability.md` §9）。
#
# 断言（任一失败即失败）：
#   1. 关闭口径不产 trace：`VUNA_OBS=0` 的 check 不写任何 trace 文件；
#   2. 打开后 `VUNA_OBS=2` 的 `check packages/compiler` / `check packages/base` 各产出合法 trace：
#      `vuna dev obs validate` 退出码 0、事件数 > 0、元数据 schema 正确；
#   3. `vuna dev obs summarize --json` 输出单行 JSON 且含 `spans` / `wallUs`；
#   4. 编译器自观测至少产出 `vuna.elab` + `vuna.codegen.check` 两个阶段跨度
#      （证明插桩没有被搬掉；名字是规范 §3.3 词汇表条目），以及前端的两段
#      `vuna.parse.lex` / `vuna.parse.syntax`（证明 lex 与语法分析可分别归因）。
#
# 由 nix/checks/default.nix 的 mkCheck 调用：cwd 是已暂存的工作树，$1 是输出目录，
# $VUNA 由 Nix 注入。
set -eu

OUT=${1:?usage: check.sh OUT}
# 输出目录可能是尚未存在的绝对路径（nix mkCheck 传的是 $out）：先建再取绝对形。
# 不能写成 `cd X && pwd || mkdir X && cd X && pwd`：`&&`/`||` 同优先级左结合，
# 会二次 `cd && pwd` 而打印两行，OUT 变成带换行的字符串（实测踩过）。
if [ ! -d "$OUT" ]; then
  mkdir -p "$OUT"
fi
OUT=$(CDPATH= cd -- "$OUT" && pwd)
: "${VUNA:?VUNA 未设置}"

trace_root=$OUT/traces
mkdir -p "$trace_root"

fail() {
  echo "vuna-obs-schema: $*" >&2
  exit 1
}

# 每次 run 用全新的对象库：否则 check 命中缓存直接返回，阶段跨度根本不会产生。
run_with_obs() { # level pkg store-suffix trace-suffix [full-elab]
  level=$1
  pkg=$2
  store="$OUT/store-$3"
  dir="$trace_root/$4"
  full=${5:-1}
  rm -rf "$store" "$dir"
  # `VUNA_ELAB_FULL=1`：`check packages/base` 等库包默认走「依赖序覆盖」捷径跳过精化，
  # 那样不产生任何阶段跨度；门禁要验的是「打开观测后确实有跨度」，因此默认强制全量。
  VUNA_STORE="$store" VUNA_ELAB_FULL="$full" VUNA_OBS="$level" VUNA_OBS_DIR="$dir" \
    "$VUNA" check "$pkg" >"$OUT/check-$4.out" 2>&1 || {
    echo "vuna-obs-schema: check $pkg failed (level $level)" >&2
    cat "$OUT/check-$4.out" >&2
    exit 1
  }
  echo "$dir"
}

# ---------------------------------------------------------------- 1) 关闭口径
off_dir=$(run_with_obs 0 packages/compiler off off)
if [ -n "$(find "$off_dir" -name '*.jsonl' -type f 2>/dev/null)" ]; then
  find "$off_dir" -name '*.jsonl' -type f >&2
  fail "observation is off (VUNA_OBS=0) but a trace file was written"
fi

# ---------------------------------------------------------------- 2) 打开：结构 + 校验
for case in compiler base; do
  if [ "$case" = compiler ]; then suffix=c2; else suffix=b2; fi
  dir=$(run_with_obs 2 "packages/$case" "$suffix" "$suffix")
  trace=$(find "$dir" -name '*.jsonl' -type f | head -1)
  [ -n "$trace" ] || fail "no trace file produced for check $case at level 2"
  "$VUNA" dev obs validate "$trace" >"$OUT/validate-$suffix.out" 2>&1 || {
    cat "$OUT/validate-$suffix.out" >&2
    fail "vuna dev obs validate rejected the trace from check $case"
  }
  lines=$(wc -l <"$trace" | tr -d ' ')
  [ "$lines" -ge 2 ] || fail "trace from check $case has only $lines line(s)"
  # 元数据必须是首行且 schema 正确（validate 已查，这里再独立断言一次）。
  head -1 "$trace" | grep -q '"ph":"M"' || fail "first trace line is not metadata"
  head -1 "$trace" | grep -q '"schema":"vuna-obs 1"' || fail "metadata schema is not vuna-obs 1"

  # -------------------------------------------------------------- 3) summarize --json
  "$VUNA" dev obs summarize --json "$trace" >"$OUT/summary-$suffix.json" 2>"$OUT/summary-$suffix.err" || {
    cat "$OUT/summary-$suffix.err" >&2
    fail "vuna dev obs summarize --json failed for check $case"
  }
  json_lines=$(wc -l <"$OUT/summary-$suffix.json" | tr -d ' ')
  [ "$json_lines" -eq 1 ] || fail "summarize --json is not a single line ($json_lines lines)"
  grep -q '"spans"' "$OUT/summary-$suffix.json" || fail "summarize --json misses \"spans\""
  grep -q '"wallUs"' "$OUT/summary-$suffix.json" || fail "summarize --json misses \"wallUs\""
done

# ---------------------------------------------------------------- 4) 编译器阶段跨度
compiler_trace=$(find "$trace_root/c2" -name '*.jsonl' -type f | head -1)
grep -q '"name":"vuna.elab"' "$compiler_trace" || fail "compiler trace misses the vuna.elab phase span"
grep -q '"name":"vuna.codegen.check"' "$compiler_trace" || fail "compiler trace misses the vuna.codegen.check phase span"
# 逐定义精化段（vuna.elab 的子区间）：冷全量精化必然产出。
grep -q '"name":"vuna.elab.bodies"' "$compiler_trace" || fail "compiler trace misses the vuna.elab.bodies span"
# 前端两段：冷 store 下每个模块都要过 lex + 语法分析。
grep -q '"name":"vuna.parse.lex"' "$compiler_trace" || fail "compiler trace misses the vuna.parse.lex span"
grep -q '"name":"vuna.parse.syntax"' "$compiler_trace" || fail "compiler trace misses the vuna.parse.syntax span"
# 名字解析的四段（reorder / expand / module / warn 都有逐模块调用，冷跑必然产出）。
for span in vuna.resolve.reorder vuna.resolve.expand vuna.resolve.module vuna.resolve.warn; do
  grep -q "\"name\":\"$span\"" "$compiler_trace" || fail "compiler trace misses the $span span"
done
# `Eff` 边界的零宽度标记（ph:"i"）：load / resolve / iface 计算与写回各一次。
for mark in vuna.load vuna.resolve vuna.iface.compute vuna.iface.write; do
  grep -q "\"ph\":\"i\",.*\"name\":\"$mark\"" "$compiler_trace" \
    || fail "compiler trace misses the $mark Eff-boundary mark"
done
# 计数器（ph:"C"）：全量口径照跑终止性分析，必然产出 `vuna.counter.term.*`。
grep -q '"ph":"C"' "$compiler_trace" || fail "compiler trace has no counter (ph:\"C\") events"
grep -q '"name":"vuna.counter.term.sites"' "$compiler_trace" \
  || fail "compiler trace misses vuna.counter.term.sites"

echo "vuna-obs-schema: ok (traces in $OUT/traces)"
