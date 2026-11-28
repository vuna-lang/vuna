#!/bin/sh
# checks.vuna-native-codegen-budget：native codegen 的**绝对预算**，按同机 OCaml 比值判。
#
# codegen 的成本随编译器源码增长，绝对秒数不可跨机器比；但同一台机器上 native 与
# OCaml 目标走同一条 DT 检查 + Lowering，差别只在后端（OCaml 拼 `.ml` 文本、native 跑
# 16 步 IR 变换 + 汇编发射 + 插件进程）。所以判据取**比值**：native ≤ 3× OCaml。
#
# 两次测量用**同一个** driver 二进制（`$VUNA`）：换成 native 自举的编译器会把前端
# （DT 检查 + Lowering）也换成 native 运行时，量到的就是运行时差距而不是后端差距。
#
# 这条守的是「后端自身不再引入超线性」：`native.inline` 的改写预算曾按路径复制，
# 单个 2.6k 节点的定义被访问 2.4 亿次，codegen 从 12 s 涨到 648 s 而产物规模不变
# （`docs/reference/native-selfhost.md`）。产物规模的漂移由 `native-artifact` 守。
#
# 每档独立空 `VUNA_STORE` + 独立 `VUNA_PKG_STATE`：宿主热库会把接口与 split 产物
# 直接复用，读数变成缓存命中时间。`VUNA_CODEGEN_BUDGET_RATIO`（毫秒整数，默认 3000）
# 与 `VUNA_CODEGEN_BUDGET_TIMEOUT`（秒，默认 300）可覆盖。
set -eu
out=${1:?usage: native-codegen-budget.sh OUT}
: "${VUNA:?VUNA 未设置}"

RATIO_MILLI=${VUNA_CODEGEN_BUDGET_RATIO:-3000}
LIMIT=${VUNA_CODEGEN_BUDGET_TIMEOUT:-300}
PKG=${VUNA_CODEGEN_BUDGET_PKG:-packages/compiler}

mkdir -p "$out"
work=$(mktemp -d "${TMPDIR:-/tmp}/vuna-native-budget.XXXXXX")
trap 'rm -rf "$work"' EXIT INT TERM

# 一次 `build --no-compile <target> <pkg>` 的墙钟（毫秒）；独立 store 与 pkg state。
measure() { # bin target dest tag -> ms
  bin=$1 target=$2 dest=$3 tag=$4
  d=$(mktemp -d "$work/m.XXXXXX")
  t0=$(date +%s%3N)
  rc=0
  VUNA_PKG_STATE="$d/pkg" VUNA_STORE="$d/store" TMPDIR="$d" timeout "$LIMIT" \
    "$bin" build --no-compile --target "$target" --out "$dest" "$PKG" \
    >"$d/build.log" 2>&1 || rc=$?
  t1=$(date +%s%3N)
  if [ "$rc" -ne 0 ]; then
    if [ "$rc" -eq 124 ]; then
      echo "check: native-codegen-budget 超时：$tag 在 ${LIMIT}s 上限内未返回" >&2
    else
      echo "check: native-codegen-budget 构建失败：$tag rc=$rc" >&2
    fi
    sed -n '1,40p' "$d/build.log" >&2
    exit 1
  fi
  printf '%s\n' "$((t1 - t0))"
}

native_ms=$(measure "$VUNA" native "$work/out-native" native)
ocaml_ms=$(measure "$VUNA" ocaml "$work/out-ocaml" ocaml)
printf 'native-codegen-budget: pkg=%s native=%s ms ocaml=%s ms\n' "$PKG" "$native_ms" "$ocaml_ms"

if [ "$ocaml_ms" -le 0 ]; then
  echo "check: native-codegen-budget 的 OCaml 参照读了 0 ms，探针失效" >&2
  exit 1
fi
if [ "$native_ms" -gt 0 ] && [ "$((native_ms * 1000 / ocaml_ms))" -gt "$RATIO_MILLI" ]; then
  echo "check: native-codegen-budget 超界：native ${native_ms}ms > ${RATIO_MILLI}‰ × ocaml ${ocaml_ms}ms（native/ocaml ≈ $(awk -v n="$native_ms" -v o="$ocaml_ms" 'BEGIN{printf "%.2f", n/o}')）" >&2
  exit 1
fi

echo "native-codegen-budget: ok"
touch "$out/ok"
