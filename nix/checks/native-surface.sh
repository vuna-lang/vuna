#!/bin/sh
# checks.vuna-native-surface：native 后端「平台面」的结构基线。
#
# 目的：这个后端不依赖 libc，平台知识（syscall 号、`.bss` 宿主缓冲、内核路径）就长在
# `Runtime.vuna` 里。基线把这张表**逐行摊平**，让任何平台面变化在 diff 里显形，而不是
# 淹没在 1700 行汇编模板里；改基线本身就是一次需要复核的动作。
#
# 抽三组（都与行号无关，纯重构不动基线）：
#   1. 每个 syscall 站点所在函数 + 给 `rax` 的 syscall 号（P1 之后是 `sysNr "name"`）；
#   2. `nativeBss` 里的宿主缓冲尺寸（路径/读/目录/栈下界等上限）；
#   3. 内核路径与 `VUNA_NATIVE_*` env 键（`/proc/self/exe`、`/bin/sh`、cgroup 等）。
#
# 由 nix/checks/default.nix 的 mkCheck 调用：cwd 是已暂存的工作树，$1 是输出目录。
set -eu

OUT=${1:?usage: vuna-native-surface.sh OUT}
SRC=packages/target-native/lib/Vuna/Target/Native/Runtime.vuna
BASE=nix/checks/data/native-surface.baseline

[ -f "$SRC" ] || { echo "native-surface: 缺少 $SRC" >&2; exit 1; }

gen() {
  echo "# syscall sites（函数名: 该站点的 syscall 号）"
  awk '
    /^[A-Za-z][A-Za-z0-9]* : / { def = $1 }
    {
      # 单遍扫描：`rax` 的赋值与 syscall 站点按出现顺序消费（多站点行必须保序）。
      line = $0
      while (match(line, /IMov \(OpReg Rax\) \(OpImm (\(sysNr "[A-Za-z0-9_]+"\)|-?[0-9]+)\)|IBinReg "xor" Rax \(OpReg Rax\)|ISyscall/)) {
        start = RSTART
        len = RLENGTH
        seg = substr(line, start, len)
        line = substr(line, start + len)
        if (seg == "ISyscall") {
          sites[def] = sites[def] (sites[def] == "" ? "" : " ") (rax == "" ? "?" : rax)
          rax = ""
        } else if (seg == "IBinReg \"xor\" Rax (OpReg Rax)") {
          rax = "0"
        } else if (match(seg, /sysNr "[A-Za-z0-9_]+"/)) {
          rax = substr(seg, RSTART, RLENGTH)
          sub(/^sysNr /, "", rax)
        } else {
          rax = seg
          sub(/.*\(OpImm /, "", rax)
          sub(/\)$/, "", rax)
        }
      }
    }
    END {
      for (d in sites) printf "%-32s %s\n", d, sites[d]
    }
  ' "$SRC" | sort

  echo "# bss buffers（标签 字节数）"
  awk '
    /^nativeBss =/ { grab = 1 }
    grab {
      line = $0
      while (match(line, /NativeBss [A-Za-z0-9_]+ [0-9]+/)) {
        seg = substr(line, RSTART, RLENGTH)
        sub(/^NativeBss /, "", seg)
        print seg
        line = substr(line, RSTART + RLENGTH)
      }
      if ($0 ~ /nativeGcBss/) grab = 0
    }
  ' "$SRC" | sort

  echo "# 内核路径 / env 键"
  grep -o '"[^"]*"' "$SRC" \
    | sed 's/^"//; s/"$//' \
    | grep -E '^(/.+|VUNA_NATIVE_.*)' \
    | sort -u
}

mkdir -p "$OUT"
gen > "$OUT/actual"

if diff -u "$BASE" "$OUT/actual" > "$OUT/diff"; then
  echo "native-surface: ok"
else
  cat "$OUT/diff" >&2
  echo "native-surface: 平台面基线漂移（确认改动后更新 $BASE）" >&2
  exit 1
fi