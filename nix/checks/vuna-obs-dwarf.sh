#!/bin/sh
# checks.vuna-obs-dwarf：`#line` 注入让 DWARF 直指 `.vuna` 源（规范 §5 / §9）。
#
# 断言（任一失败即失败）：
#   1. split 产物里每个绑定前都有 `# <line> "<包相对路径>"` 指令，且路径以 `.vuna` 结尾、
#      **不是**绝对路径（跨机器可复现）；
#   2. 用产物 build.sh 编出的可执行文件，`readelf --debug-dump=decodedline` 至少出现
#      一个 `.vuna` 文件（DWARF 行表真的指向 vuna 源，而不是生成的 `.ml`）；
#   3. `ocamlopt -g` 编出的 `.debug_line` 里该文件的行号 > 0。
#
# 需要 `readelf`（nixpkgs binutils/elfutils），不需要 gdb/perf（CI 里不保证有）。
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

pkg=$OUT/pkg
mkdir -p "$pkg/app"
cat >"$pkg/vuna.toml" <<EOF
[package]
name = "obs-dwarf"

[dependencies]
vuna-base = "${VUNA_BASE:?VUNA_BASE 未设置}"
EOF

# 夹具刻意分成两个模块：`#line` 必须按**每个绑定**写，而不是每个单元写一次。
cat >"$pkg/app/Main.vuna" <<'EOF'
import Helper

main : Int
main = twice 21 + triple 3
EOF
mkdir -p "$pkg/lib"
cat >"$pkg/lib/Helper.vuna" <<'EOF'
module Helper where

export twice : Int -> Int
twice n = n * 2

export triple : Int -> Int
triple n = n * 3
EOF

fail() {
  echo "vuna-obs-dwarf: $*" >&2
  exit 1
}

"$VUNA" build --out "$OUT/out" "$pkg" >"$OUT/build.out" 2>&1 || {
  cat "$OUT/build.out" >&2
  fail "build failed"
}

# ---------------------------------------------------------------- 1) 产物里的指令
directives=$(find "$OUT/out" -maxdepth 1 -name '*.ml' -type f | head -20)
[ -n "$directives" ] || fail "no .ml split output produced"

count=$(grep -hE '^# [0-9]+ "' "$OUT/out"/*.ml 2>/dev/null | wc -l | tr -d ' ')
bad_abs=$(grep -hE '^# [0-9]+ "' "$OUT/out"/*.ml | grep -cE '"(/|[.][.]/)' || true)

[ "$bad_abs" = "0" ] || fail "$bad_abs #line directive(s) use absolute or ../ paths (must be package-relative)"

bad_ext=$(grep -hE '^# [0-9]+ "' "$OUT/out"/*.ml | grep -cvE '"[^"]*\.vuna"' || true)
[ "$bad_ext" = "0" ] || fail "$bad_ext #line directive(s) do not point at a .vuna file"

grep -qE '^# [0-9]+ "app/Main.vuna"' "$OUT/out/Main.ml" || fail 'Main.ml misses `# <line> "app/Main.vuna"`'
grep -qE '^# [0-9]+ "Helper\.vuna"' "$OUT/out/Helper.ml" || fail 'Helper.ml misses `# <line> "Helper.vuna"`'

# ---------------------------------------------------------------- 2) DWARF 行表
bin=$OUT/out/bin/obs-dwarf
[ -x "$bin" ] || fail "expected executable at $OUT/out/bin/obs-dwarf"

readelf --debug-dump=decodedline "$bin" >"$OUT/decoded-line.txt" 2>/dev/null || {
  fail "readelf --debug-dump=decodedline failed (binary may not carry DWARF: build.sh must pass -g)"
}

if ! grep -q 'Main.vuna' "$OUT/decoded-line.txt"; then
  grep -E '\.ml|CU:' "$OUT/decoded-line.txt" | head -20 >&2
  fail "DWARF line table has no Main.vuna entry (engine still points at generated .ml)"
fi

# ---------------------------------------------------------------- 3) 行号 > 0
line_no=$(grep -E 'Main\.vuna[[:space:]]+' "$OUT/decoded-line.txt" | awk '{ for (i = 1; i <= NF; i++) if ($i ~ /^[0-9]+$/ && $i > 0) { print $i; exit } }')
[ -n "$line_no" ] || fail "Main.vuna appears in DWARF line table but without a positive line number"
[ "$line_no" -gt 0 ] || fail "Main.vuna line number is not positive ($line_no)"

echo "vuna-obs-dwarf: ok (Main.vuna first line $line_no; $count #line directives)"
