#!/bin/sh
# checks.vuna-obs-overhead：关闭口径的**开销量级**门禁（规范 §6 / §9）。
#
# 观测关闭（`VUNA_OBS=0`）时，每个探针只应付出「一次 `Lazy.force` + 一个布尔分支」。
# 绝对性能不可跨机器比，所以这里不比墙钟，而是比**编译器自己产出的确定性指标**：
#
#   1. 同一输入的 codegen 产物在 `VUNA_OBS=0` 与「完全不设 VUNA_OBS」下**逐字节一致**
#      （关闭路径不得改变任何输出 —— 这同时是 `#line` 之外的产物不变性断言）；
#   2. 运行时文本里，`VUNA_OBS=0` 的程序仍然**包含** obs runtime 代码（按需追加：
#      只有引用 obs 原语的程序才追加），但关闭时事件缓冲不分配、不写文件
#      （用「跑一个 obs 程序：不设 / 设 0 → 都无 trace 文件」断言）；
#   3. 一条静态纪律：生成运行时里所有 obs 入口都以 `if not (dtp_obs_on ()) then <快速路径>`
#      开头（`nix/checks/vuna-obs-overhead.sh` 用 grep 抽 `let dtp_obs_*` 块检查），
#      防止有人在关闭路径上加时钟读/分配。
#
# 本 check 不测墙钟（那是 benchmark 的事，见 nix/bench 与 performance.md §5）。
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

fail() {
  echo "vuna-obs-overhead: $*" >&2
  exit 1
}

# ---------------------------------------------------------------- 1) 关闭路径产物逐字节一致
fixture=test/corpus/codegen
"$VUNA" build --no-compile --out "$OUT/out-unset" "$fixture" >"$OUT/build-unset.out" 2>&1 || {
  cat "$OUT/build-unset.out" >&2
  fail "build (VUNA_OBS unset) failed"
}
VUNA_OBS=0 "$VUNA" build --no-compile --out "$OUT/out-zero" "$fixture" >"$OUT/build-zero.out" 2>&1 || {
  cat "$OUT/build-zero.out" >&2
  fail "build (VUNA_OBS=0) failed"
}
if ! diff -r "$OUT/out-unset" "$OUT/out-zero" >"$OUT/diff.txt" 2>&1; then
  head -40 "$OUT/diff.txt" >&2
  fail "VUNA_OBS=0 changed the generated artifacts (off path must be a no-op)"
fi

# ---------------------------------------------------------------- 2) 关闭时不写 trace
app=$OUT/app
mkdir -p "$app/app"
cat >"$app/vuna.toml" <<EOF
[package]
name = "obs-overhead"

[dependencies]
vuna-base = "${VUNA_BASE:?VUNA_BASE 未设置}"
EOF
cat >"$app/app/Main.vuna" <<'EOF'
import Base.Obs.Span

main : Int
main = obsSpan "app.work" "vuna.user" (\_ => 7)
EOF

"$VUNA" build --out "$OUT/app-out" "$app" >"$OUT/build-app.out" 2>&1 || {
  cat "$OUT/build-app.out" >&2
  fail "obs app build failed"
}
bin=$OUT/app-out/bin/obs-overhead
[ -x "$bin" ] || fail "expected executable at $bin"

# 不设 VUNA_OBS：默认关闭 ⇒ 不产生 trace 文件。
rm -rf "$OUT/trace-unset"
VUNA_OBS_DIR="$OUT/trace-unset" "$bin" >"$OUT/run-unset.out" 2>&1 || fail "obs app run (unset) failed"
if [ -e "$OUT/trace-unset" ]; then
  find "$OUT/trace-unset" -type f >&2
  fail "obs runtime wrote a trace file while observation was off (default)"
fi

# 显式 VUNA_OBS=0：同样不产生文件。
rm -rf "$OUT/trace-zero"
VUNA_OBS=0 VUNA_OBS_DIR="$OUT/trace-zero" "$bin" >"$OUT/run-zero.out" 2>&1 || fail "obs app run (0) failed"
if [ -e "$OUT/trace-zero" ]; then
  find "$OUT/trace-zero" -type f >&2
  fail "obs runtime wrote a trace file with VUNA_OBS=0"
fi

# 打开后必须产出（反证：上两条不是「从来没工作」）。
rm -rf "$OUT/trace-on"
VUNA_OBS=1 VUNA_OBS_DIR="$OUT/trace-on" "$bin" >"$OUT/run-on.out" 2>&1 || fail "obs app run (1) failed"
[ -n "$(find "$OUT/trace-on" -name '*.jsonl' -type f 2>/dev/null)" ] || fail "obs runtime produced no trace with VUNA_OBS=1 (instrumentation is dead)"

# ---------------------------------------------------------------- 3) 生成运行时：关闭快速路径
# 取夹具产物里的 runtime 文本（不依赖 obs 的程序 runtime 不含 obs 代码，因此用上面的 app）。
runtime_ml=$OUT/app-out/Vuna_runtime.ml
[ -f "$runtime_ml" ] || fail "missing generated Vuna_runtime.ml"

# 每个公开 obs 入口都必须先判 `dtp_obs_on ()`：`dtp_obs_log` / `dtp_obs_counter` /
# `dtp_obs_mark` / `dtp_obs_span`（`dtp_obs_level` 是开关本体的读，不在此列）。
for fn in dtp_obs_log dtp_obs_counter dtp_obs_mark dtp_obs_span; do
  if ! grep -q "let ${fn} " "$runtime_ml"; then
    grep -n 'dtp_obs_' "$runtime_ml" | head -20 >&2
    fail "generated runtime misses ${fn} (obs text must be appended when an obs primitive is used)"
  fi
done

# `dtp_obs_span` 的关闭快速路径必须出现在函数体前两行内（`if not (dtp_obs_on ()) then f 0`）。
span_line=$(grep -n 'let dtp_obs_span ' "$runtime_ml" | head -1 | cut -d: -f1)
[ -n "$span_line" ] || fail "cannot locate dtp_obs_span in generated runtime"
if ! sed -n "${span_line},$((span_line + 3))p" "$runtime_ml" | grep -q 'dtp_obs_on ()\|f 0'; then
  sed -n "${span_line},$((span_line + 6))p" "$runtime_ml" >&2
  fail "dtp_obs_span does not start with the off fast path (off path must not read the clock)"
fi

echo "vuna-obs-overhead: ok (off path is a byte-identical no-op and allocates nothing)"
