#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

# 30) fmt（M11.5/M11.6）：格式化后仍可解释（DT 语义）且输出不变；fmt 幂等。
#     M26：格式化副本放进一个带 manifest 的临时包（= corpus 包同样的 base 上下文），
#     这样 interp 看到的可见性与原文件一致（无 manifest 时是 base-only 上下文）。
mkdir -p "$tmp/fmt-pkg"
cat > "$tmp/fmt-pkg/vuna.toml" <<EOF
[package]
name = "fmt-roundtrip"

[dependencies]
vuna-base = "$VUNA_BASE"
EOF
for file in corpus/run/01_arithmetic.vuna corpus/run/03_data_case.vuna corpus/fmt/run/07_wrap.vuna corpus/monad/01_do_maybe.vuna corpus/traits/03_deriving_show_eq_enum.vuna; do
  expected=$(cat "${file%.vuna}.out")
  cp "$file" "$tmp/fmt-pkg/src.vuna"
  chmod u+w "$tmp/fmt-pkg/src.vuna"
  "$VUNA" fmt "$tmp/fmt-pkg/src.vuna" >/dev/null 2>&1
  actual=$("$VUNA" interp "$tmp/fmt-pkg/src.vuna" 2>&1)
  check_eq "$file (fmt interp)" "$expected" "$actual"
  "$VUNA" fmt --check "$tmp/fmt-pkg/src.vuna" >/dev/null 2>&1
  fmt_code=$?
  check_eq "$file (fmt idempotent)" "0" "$fmt_code"
done


finish
