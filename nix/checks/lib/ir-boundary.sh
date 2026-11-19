#!/bin/sh
# checks.ir-boundary：IR 边界的**结构**守卫（长期不变量）。
#
# 目标链路：`Core --Lowering--> IR --Codegen.{Decl,Term,Assembly}--> OCaml 文本`
#           `Driver.SplitGen` 只做「归属表 + 按归属过滤 + 分文件」，每个单元都经
#           `Lowering` 出 `IrUnit` 再交给 `Codegen.Assembly` 装配。
#
# 依赖**方向**由 `packages/compiler/vuna.toml` 的 `[layers]` 声明、由 loader 在 import 时
# 强制（例如 `Ir` 只能依赖 `Base`、`Codegen` 不能依赖 `Core`/`Elab`）。本脚本只留
# **正向断言与形状断言**——声明式层表表达不了「必须 import 某个模块」和「IR 里不许
# 出现目标文本」这两类规则。
#
# 规则：
#   3. `Lowering/Program.vuna` 存在且 import `Core`/`Elab`（Core → IR 的唯一入口）。
#   3b. `Codegen/` 只放 IR→文本；Core→IR、Core 侧检查、归属切分不得搬回来。
#   4. `Driver.SplitGen` 必须路由到 `Lowering`，且不得自己消费 `Core` / `Intrinsics`。
#   5. 文本生成层都消费 IR（不允许残留只吃 `DtDef`、绕过 IR 的路径）。
#   6. `IrRuntime` / `IrBridge` 这类目标文本节点不得出现。
#   7. IR 数据模块里的字面量只能是符号名（不含空格 / 括号 / 花括号）。
#   8. 运行时契约与 OCaml 符号表存在；表按契约取键，Lowering 跑一致性检查。
#   9. native 后端：`Native.Module` 必须消费 IR。
#  10. wasm 后端：`Wasm.Module` 必须消费 IR。
#
# 只扫 `import` / `export import` 行（vuna 的模块依赖面就是这些行）。
set -eu
export LC_ALL=C

# 脚本以 cwd = 仓库根布局运行（本地 `sh nix/checks/lib/ir-boundary.sh` 与 nix check 都是）。
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

# 规则 3：Lowering 存在且是唯一的 Core 消费者。
LOWER=packages/compiler/lib/Vuna/Compiler/Lowering/Program.vuna
if [ ! -f "$LOWER" ]; then
  echo "ir-boundary: missing $LOWER (Core -> IR lowering must exist)"
  fail=$((fail + 1))
else
  if ! imports_of "$LOWER" | grep -qE '^Vuna\.Compiler\.(Core|Elab)(\.|$)'; then
    echo "ir-boundary: $LOWER does not import Core/Elab (it must be the only Core consumer)"
    fail=$((fail + 1))
  fi
fi

# 规则 3b：`Codegen/` 目录只放 IR→文本；Core→IR、Core 侧检查与归属切分不得再搬回来。
for gone in packages/compiler/lib/Vuna/Compiler/Codegen/Lower.vuna packages/compiler/lib/Vuna/Compiler/Codegen/Erase.vuna packages/compiler/lib/Vuna/Compiler/Codegen/Split.vuna; do
  if [ -f "$gone" ]; then
    echo "ir-boundary: $gone must live outside Codegen/ (Codegen is IR -> text only)"
    fail=$((fail + 1))
  fi
done

# 规则 4：SplitGen（声明归属 + 分文件装配，属 Driver 层）必须路由到 Lowering，
# 且不得自己消费 Core / Intrinsics。
SPLIT=packages/compiler/lib/Vuna/Compiler/Driver/SplitGen.vuna
if [ -f "$SPLIT" ]; then
  if ! imports_of "$SPLIT" | grep -qE '^Vuna\.Compiler\.Lowering\.Program$'; then
    echo "ir-boundary: $SPLIT does not import Vuna.Compiler.Lowering.Program (must lower per unit)"
    fail=$((fail + 1))
  fi
  check_forbidden "$SPLIT" '^(Vuna\.Compiler\.(Core|Base\.Intrinsics)(\.|$))'
fi

# 规则 5（正向断言）：文本生成层都消费 IR（不允许残留只吃 `DtDef`、绕过 IR 的路径）。
for f in \
  packages/compiler/lib/Vuna/Compiler/Codegen/Decl.vuna \
  packages/compiler/lib/Vuna/Compiler/Codegen/Term.vuna \
  packages/compiler/lib/Vuna/Compiler/Codegen/Assembly.vuna
do
  [ -f "$f" ] || continue
  if ! imports_of "$f" | grep -qE '^Vuna\.Ir(\.|$)'; then
    echo "ir-boundary: $f does not import Vuna.Ir (backend must consume IR)"
    fail=$((fail + 1))
  fi
done

# 规则 6（IR 只认符号契约）：`IrRuntime` / `IrBridge` 这类目标文本节点不得出现。
if grep -nE '\bIrRuntime\b|\bIrBridge\b' \
  packages/ir/lib/Vuna/Ir/Model.vuna \
  packages/ir/lib/Vuna/Ir/Runtime.vuna \
  packages/compiler/lib/Vuna/Compiler/Lowering/Program.vuna \
  packages/compiler/lib/Vuna/Compiler/Codegen/Term.vuna
then
  echo "ir-boundary: removed IR runtime-text nodes reappeared (IrRuntime / IrBridge)"
  fail=$((fail + 1))
fi

# 规则 7：IR 数据模块里的字面量只能是符号名（不含空格 / 括号 / 花括号），
# 防止把目标表达式重新塞回 IR。
#
# 先 `-o` 逐个取出字面量再判字符：直接对整行匹配 `"[^"]*[ (){}][^"]*"` 会把
# 「两个相邻字面量之间的空格」当成字面量内容（`Pair "fs" "Base.X"` 的
# `" "` 就命中），对任何成对出现的字符串表都误报。
if grep -noE '"[^"]*"' \
  packages/ir/lib/Vuna/Ir/Model.vuna \
  packages/ir/lib/Vuna/Ir/Runtime.vuna |
  grep -E '[ (){}]'
then
  echo "ir-boundary: IR data module contains a text literal with spaces/brackets (target text?)"
  fail=$((fail + 1))
fi

# 规则 8（正向断言）：契约与 OCaml 符号表存在，且 Lowering 用后端表做一致性检查。
for f in packages/ir/lib/Vuna/Ir/Runtime.vuna packages/compiler/lib/Vuna/Compiler/Codegen/Runtime.vuna; do
  if [ ! -f "$f" ]; then
    echo "ir-boundary: missing $f (IR runtime contract)"
    fail=$((fail + 1))
  fi
done
TABLE=packages/compiler/lib/Vuna/Compiler/Codegen/Runtime.vuna
if [ -f "$TABLE" ] && ! imports_of "$TABLE" | grep -qE '^Vuna\.Ir(\.|$)'; then
  echo "ir-boundary: $TABLE does not import Vuna.Ir (table must be keyed by the contract)"
  fail=$((fail + 1))
fi
if [ -f "$LOWER" ] && ! imports_of "$LOWER" | grep -qE '^Vuna\.Compiler\.Codegen\.Runtime$'; then
  echo "ir-boundary: $LOWER does not import Codegen.Runtime (contract conformance check must run)"
  fail=$((fail + 1))
fi

# 规则 9（native 后端）：`Native.Module` 必须消费 IR。
NATIVE_MODULE=packages/compiler/lib/Vuna/Compiler/Native/Module.vuna
if [ -f "$NATIVE_MODULE" ]; then
  if ! imports_of "$NATIVE_MODULE" | grep -qE '^Vuna\.Ir(\.|$)'; then
    echo "ir-boundary: $NATIVE_MODULE does not import Vuna.Ir (native backend must consume IR)"
    fail=$((fail + 1))
  fi
fi

# 规则 11（后端模型层）：`Codegen/Ocaml/Model.vuna` 与 `Ir/Model.vuna` 的代码行（去注释）
# 不得出现目标文本前缀（`v_` / `t_` / `C_` / `f_` / `Unit.`）：模型只装形状。
for model in packages/compiler/lib/Vuna/Compiler/Codegen/Ocaml/Model.vuna packages/ir/lib/Vuna/Ir/Model.vuna; do
  [ -f "$model" ] || continue
  if sed -e "s/--.*//" "$model" | grep -qE "\"(v_|t_|C_|f_|Unit\.)"; then
    echo "ir-boundary: $model contains target text (model layer must stay shape-only)"
    fail=$((fail + 1))
  fi
done

# 规则 10（wasm 后端）：`Wasm.Module` 必须消费 IR。
WASM_MODULE=packages/compiler/lib/Vuna/Compiler/Wasm/Module.vuna
if [ -f "$WASM_MODULE" ]; then
  if ! imports_of "$WASM_MODULE" | grep -qE '^Vuna\.Ir(\.|$)'; then
    echo "ir-boundary: $WASM_MODULE does not import Vuna.Ir (wasm backend must consume IR)"
    fail=$((fail + 1))
  fi
fi

if [ "$fail" -ne 0 ]; then
  echo "ir-boundary: FAIL ($fail violation(s))"
  exit 1
fi
echo "ir-boundary: OK"