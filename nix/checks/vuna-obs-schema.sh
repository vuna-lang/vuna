#!/bin/sh
# checks.vuna-obs-schema：可观测性的**结构**门禁（`docs/reference/observability.md` §9）。
#
# 断言（任一失败即失败）：
#   1. 关闭口径不产 trace：`VUNA_OBS=0` 的 check 不写任何 trace 文件；
#   2. 打开后 `VUNA_OBS=2` 的 `check compiler` / `check base` 各产出合法 trace：
#      `vuna obs validate` 退出码 0、事件数 > 0、元数据 schema 正确；
#   3. `vuna obs summarize --json` 输出单行 JSON 且含 `spans` / `wallUs`；
#   4. 编译器自观测至少产出 `vuna.elab` + `vuna.codegen.check` 两个阶段跨度
#      （证明插桩没有被搬掉；名字是规范 §3.3 词汇表条目）。
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
run_with_obs() { # level pkg store-suffix trace-suffix
  level=$1
  pkg=$2
  store="$OUT/store-$3"
  dir="$trace_root/$4"
  rm -rf "$store" "$dir"
  # `VUNA_ELAB_FULL=1`：`check base` 等库包默认走「依赖序覆盖」捷径跳过精化，
  # 那样不产生任何阶段跨度；门禁要验的是「打开观测后确实有跨度」，因此强制全量。
  VUNA_STORE="$store" VUNA_ELAB_FULL=1 VUNA_OBS="$level" VUNA_OBS_DIR="$dir" \
    "$VUNA" check "$pkg" >"$OUT/check-$4.out" 2>&1 || {
    echo "vuna-obs-schema: check $pkg failed (level $level)" >&2
    cat "$OUT/check-$4.out" >&2
    exit 1
  }
  echo "$dir"
}

# ---------------------------------------------------------------- 1) 关闭口径
off_dir=$(run_with_obs 0 compiler off off)
if [ -n "$(find "$off_dir" -name '*.jsonl' -type f 2>/dev/null)" ]; then
  find "$off_dir" -name '*.jsonl' -type f >&2
  fail "observation is off (VUNA_OBS=0) but a trace file was written"
fi

# ---------------------------------------------------------------- 2) 打开：结构 + 校验
for case in compiler base; do
  if [ "$case" = compiler ]; then suffix=c2; else suffix=b2; fi
  dir=$(run_with_obs 2 "$case" "$suffix" "$suffix")
  trace=$(find "$dir" -name '*.jsonl' -type f | head -1)
  [ -n "$trace" ] || fail "no trace file produced for check $case at level 2"
  "$VUNA" obs validate "$trace" >"$OUT/validate-$suffix.out" 2>&1 || {
    cat "$OUT/validate-$suffix.out" >&2
    fail "vuna obs validate rejected the trace from check $case"
  }
  lines=$(wc -l <"$trace" | tr -d ' ')
  [ "$lines" -ge 2 ] || fail "trace from check $case has only $lines line(s)"
  # 元数据必须是首行且 schema 正确（validate 已查，这里再独立断言一次）。
  head -1 "$trace" | grep -q '"ph":"M"' || fail "first trace line is not metadata"
  head -1 "$trace" | grep -q '"schema":"vuna-obs 1"' || fail "metadata schema is not vuna-obs 1"

  # -------------------------------------------------------------- 3) summarize --json
  "$VUNA" obs summarize --json "$trace" >"$OUT/summary-$suffix.json" 2>"$OUT/summary-$suffix.err" || {
    cat "$OUT/summary-$suffix.err" >&2
    fail "vuna obs summarize --json failed for check $case"
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

echo "vuna-obs-schema: ok (traces in $OUT/traces)"
