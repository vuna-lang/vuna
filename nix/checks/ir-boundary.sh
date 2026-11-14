#!/bin/sh
# checks.ir-boundary：IR 边界的**结构**守卫（Track A 第一步的长期不变量）。
#
# 目标链路：`Core --Codegen.Lower--> IR --Codegen.{Decl,Term,Assembly}--> OCaml 文本`
#           `Codegen.Split` 只做「归属表 + 按归属过滤 + 分文件」，每个单元都经
#           `Codegen.Lower` 出 `IrUnit` 再交给 `Codegen.Assembly` 装配。
#
# 九条规则（违反即失败）：
#   1. `Vuna.Compiler.Ir*`（IR 模型与分析）不得依赖任何上游/目标侧模块：
#      不许 import `Vuna.Compiler.Core*`、`Vuna.Compiler.Elab*`、`Vuna.Compiler.Intrinsics`、
#      `Vuna.Compiler.Codegen*`。IR 只认「源码名 + 已决策的表示形状 + 运行时符号契约」。
#   2. **文本生成层**（`Codegen.{Decl,Term,Assembly}`）不得 import
#      `Vuna.Compiler.Core*` / `Vuna.Compiler.Elab*` / `Vuna.Compiler.Intrinsics`：
#      它们只吃 IR。这条保证「后端只有一个输入面 = IR」，删掉直连 Core 的路径后
#      无法悄悄复活。
#   3. 正向断言：`Codegen/Lower.vuna` 存在且 import 了 `Core`/`Elab`（Core → IR 的
#      唯一入口；防止「删了直连路径也删了 lowering」）。
#   4. 正向断言：`Codegen.Split` 经 `Codegen.Lower` 出 IR（而不是自己拿 `DtDef` 拼文本）。
#      Split 仍要按声明归属切分，所以它是这条链上唯一允许 import `Elab` 的后端模块
#      （`DtProgram` / `DtDef` / `DtData` 是切分单位）；但 `Core` / `Intrinsics` 一律不许
#      ——擦除判据与 runtime 名映射都在 Lowering。
#   5. 正向断言：文本生成层都消费 IR（避免留下未迁移的死路径）。
#   9. native 后端（`Vuna.Compiler.Native*` 与 `Driver/Native`）只吃 IR：不得 import
#      `Core` / `Elab` / `Intrinsics` / `Codegen` / `Wasm`；`Native.Module` 必须 import IR。
#  10. wasm 后端（`Vuna.Compiler.Wasm*` 与 `Driver/Wasm`）只吃 IR：不得 import
#      `Core` / `Elab` / `Intrinsics` / `Codegen` / `Native`；`Wasm.Module` 必须 import IR。
#
# 只扫 `import` / `export import` 行（vuna 的模块依赖面就是这些行）。
set -eu
export LC_ALL=C

# 脚本以 cwd = 仓库根布局运行（本地 `sh nix/checks/ir-boundary.sh` 与 nix check 都是）。
cd "$(pwd)"

fail=0

# 收集一个文件里 import 到的模块名（含 `export import` 形式）。
imports_of() {
  sed -n -e 's/^export import[[:space:]]\+\([A-Za-z0-9_.]*\).*/\1/p' \
    -e 's/^import[[:space:]]\+\([A-Za-z0-9_.]*\).*/\1/p' "$1"
}

check_forbidden() {
  file=$1
  shift
  hit=$(imports_of "$file" | grep -E "$1" || true)
  if [ -n "$hit" ]; then
    echo "ir-boundary: $file imports forbidden module(s):"
    printf '  %s\n' $hit
    fail=$((fail + 1))
  fi
}

# 规则 1：IR 层不得向上/向下依赖。
for f in compiler/lib/Vuna/Compiler/Ir.vuna compiler/lib/Vuna/Compiler/Ir/*.vuna; do
  [ -f "$f" ] || continue
  check_forbidden "$f" '^(Vuna\.Compiler\.(Core|Elab|Intrinsics|Codegen)(\.|$))'
done

# 规则 2：文本生成层只吃 IR。
for f in \
  compiler/lib/Vuna/Compiler/Codegen.vuna \
  compiler/lib/Vuna/Compiler/Codegen/Decl.vuna \
  compiler/lib/Vuna/Compiler/Codegen/Term.vuna \
  compiler/lib/Vuna/Compiler/Codegen/Assembly.vuna \
  compiler/lib/Vuna/Compiler/Codegen/Runtime.vuna
do
  [ -f "$f" ] || continue
  check_forbidden "$f" '^(Vuna\.Compiler\.(Core|Elab|Intrinsics)(\.|$))'
done

# 规则 3：Lowering 存在且是唯一的 Core 消费者。
LOWER=compiler/lib/Vuna/Compiler/Codegen/Lower.vuna
if [ ! -f "$LOWER" ]; then
  echo "ir-boundary: missing $LOWER (Core -> IR lowering must exist)"
  fail=$((fail + 1))
else
  if ! imports_of "$LOWER" | grep -qE '^Vuna\.Compiler\.(Core|Elab)(\.|$)'; then
    echo "ir-boundary: $LOWER does not import Core/Elab (it must be the only Core consumer)"
    fail=$((fail + 1))
  fi
fi

# 规则 4：Split 必须路由到 Lowering，且不得自己消费 Core / Intrinsics。
SPLIT=compiler/lib/Vuna/Compiler/Codegen/Split.vuna
if [ -f "$SPLIT" ]; then
  if ! imports_of "$SPLIT" | grep -qE '^Vuna\.Compiler\.Codegen\.Lower$'; then
    echo "ir-boundary: $SPLIT does not import Vuna.Compiler.Codegen.Lower (must lower per unit)"
    fail=$((fail + 1))
  fi
  check_forbidden "$SPLIT" '^(Vuna\.Compiler\.(Core|Intrinsics)(\.|$))'
fi

# 规则 5（正向断言）：文本生成层都消费 IR（避免留下未迁移的死路径）。
for f in \
  compiler/lib/Vuna/Compiler/Codegen/Decl.vuna \
  compiler/lib/Vuna/Compiler/Codegen/Term.vuna \
  compiler/lib/Vuna/Compiler/Codegen/Assembly.vuna
do
  [ -f "$f" ] || continue
  if ! imports_of "$f" | grep -qE '^Vuna\.Compiler\.Ir(\.|$)'; then
    echo "ir-boundary: $f does not import Vuna.Compiler.Ir (backend must consume IR)"
    fail=$((fail + 1))
  fi
done

# 规则 6（Track A 第二步）：已删除的 IR 目标文本节点不得复活——IR 只认符号契约。
if grep -nE '\bIrRuntime\b|\bIrBridge\b' \
  compiler/lib/Vuna/Compiler/Ir/Model.vuna \
  compiler/lib/Vuna/Compiler/Ir/Runtime.vuna \
  compiler/lib/Vuna/Compiler/Codegen/Lower.vuna \
  compiler/lib/Vuna/Compiler/Codegen/Term.vuna
then
  echo "ir-boundary: removed IR runtime-text nodes reappeared (IrRuntime / IrBridge)"
  fail=$((fail + 1))
fi

# 规则 7：IR 数据模块里的字面量只能是符号名（不含空格 / 括号 / 花括号），
# 防止把目标表达式重新塞回 IR。
if grep -nE '"[^"]*[ (){}][^"]*"' \
  compiler/lib/Vuna/Compiler/Ir/Model.vuna \
  compiler/lib/Vuna/Compiler/Ir/Runtime.vuna
then
  echo "ir-boundary: IR data module contains a text literal with spaces/brackets (target text?)"
  fail=$((fail + 1))
fi

# 规则 8（正向断言）：契约与 OCaml 符号表存在，且 Lower 用后端表做一致性检查。
for f in compiler/lib/Vuna/Compiler/Ir/Runtime.vuna compiler/lib/Vuna/Compiler/Codegen/Runtime.vuna; do
  if [ ! -f "$f" ]; then
    echo "ir-boundary: missing $f (IR runtime contract)"
    fail=$((fail + 1))
  fi
done
TABLE=compiler/lib/Vuna/Compiler/Codegen/Runtime.vuna
if [ -f "$TABLE" ] && ! imports_of "$TABLE" | grep -qE '^Vuna\.Compiler\.Ir$'; then
  echo "ir-boundary: $TABLE does not import Vuna.Compiler.Ir (table must be keyed by the contract)"
  fail=$((fail + 1))
fi
if [ -f "$LOWER" ] && ! imports_of "$LOWER" | grep -qE '^Vuna\.Compiler\.Codegen\.Runtime$'; then
  echo "ir-boundary: $LOWER does not import Codegen.Runtime (contract conformance check must run)"
  fail=$((fail + 1))
fi

# 规则 9（native 后端）：只吃 IR；不 import 上游或其它后端。
for f in compiler/lib/Vuna/Compiler/Native/*.vuna; do
  [ -f "$f" ] || continue
  check_forbidden "$f" '^(Vuna\.Compiler\.(Core|Elab|Intrinsics|Codegen|Wasm)(\.|$))'
done
NATIVE_DRIVER=compiler/lib/Vuna/Compiler/Driver/Native.vuna
if [ -f "$NATIVE_DRIVER" ]; then
  check_forbidden "$NATIVE_DRIVER" '^(Vuna\.Compiler\.(Core|Elab|Intrinsics)(\.|$))'
fi
NATIVE_MODULE=compiler/lib/Vuna/Compiler/Native/Module.vuna
if [ -f "$NATIVE_MODULE" ]; then
  if ! imports_of "$NATIVE_MODULE" | grep -qE '^Vuna\.Compiler\.Ir$'; then
    echo "ir-boundary: $NATIVE_MODULE does not import Vuna.Compiler.Ir (native backend must consume IR)"
    fail=$((fail + 1))
  fi
fi

# 规则 10（wasm 后端）：只吃 IR；不 import 上游或其它后端。
for f in compiler/lib/Vuna/Compiler/Wasm/*.vuna; do
  [ -f "$f" ] || continue
  check_forbidden "$f" '^(Vuna\.Compiler\.(Core|Elab|Intrinsics|Codegen|Native)(\.|$))'
done
WASM_DRIVER=compiler/lib/Vuna/Compiler/Driver/Wasm.vuna
if [ -f "$WASM_DRIVER" ]; then
  check_forbidden "$WASM_DRIVER" '^(Vuna\.Compiler\.(Core|Elab|Intrinsics)(\.|$))'
fi
WASM_MODULE=compiler/lib/Vuna/Compiler/Wasm/Module.vuna
if [ -f "$WASM_MODULE" ]; then
  if ! imports_of "$WASM_MODULE" | grep -qE '^Vuna\.Compiler\.Ir$'; then
    echo "ir-boundary: $WASM_MODULE does not import Vuna.Compiler.Ir (wasm backend must consume IR)"
    fail=$((fail + 1))
  fi
fi

if [ "$fail" -ne 0 ]; then
  echo "ir-boundary: FAIL ($fail violation(s))"
  exit 1
fi
echo "ir-boundary: OK"
