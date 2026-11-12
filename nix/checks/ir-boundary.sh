#!/bin/sh
# checks.ir-boundary：IR 边界的**结构**守卫（Track A 第一步的长期不变量）。
#
# 目标链路：`Core --Codegen.Lower--> IR --Codegen.{Decl,Term,Assembly}--> OCaml 文本`
#           `Codegen.Split` 只做「归属表 + 按归属过滤 + 分文件」，每个单元都经
#           `Codegen.Lower` 出 `IrUnit` 再交给 `Codegen.Assembly` 装配。
#
# 四条规则（违反即失败）：
#   1. `Vuna.Compiler.Ir*`（IR 模型与分析）不得依赖任何上游/目标侧模块：
#      不许 import `Vuna.Compiler.Core*`、`Vuna.Compiler.Elab*`、`Vuna.Compiler.Intrinsics`、
#      `Vuna.Compiler.Codegen*`。IR 只认「源码名 + 已决策的表示形状」。
#   2. **文本生成层**（`Codegen.{Decl,Term,Assembly}`）不得 import
#      `Vuna.Compiler.Core*` / `Vuna.Compiler.Elab*` / `Vuna.Compiler.Intrinsics`：
#      它们只吃 IR。这条保证「后端只有一个输入面 = IR」，删掉直连 Core 的路径后
#      无法悄悄复活。
#   3. 正向断言：`Codegen/Lower.vuna` 存在且 import 了 `Core`/`Elab`（Core → IR 的
#      唯一入口；防止「删了直连路径也删了 lowering」）。
#   4. 正向断言：`Codegen.Split` 经 `Codegen.Lower` 出 IR（而不是自己拿 `DtDef` 拼文本）。
#      Split 需要 `DtProgram`（归属表与按单元过滤都以声明为单位），所以它是这条链上
#      唯一允许 import `Elab` 的后端模块；但它必须路由到 Lower。
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
  compiler/lib/Vuna/Compiler/Codegen/Assembly.vuna
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

# 规则 4：Split 必须路由到 Lowering。
SPLIT=compiler/lib/Vuna/Compiler/Codegen/Split.vuna
if [ -f "$SPLIT" ]; then
  if ! imports_of "$SPLIT" | grep -qE '^Vuna\.Compiler\.Codegen\.Lower$'; then
    echo "ir-boundary: $SPLIT does not import Vuna.Compiler.Codegen.Lower (must lower per unit)"
    fail=$((fail + 1))
  fi
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

if [ "$fail" -ne 0 ]; then
  echo "ir-boundary: FAIL ($fail violation(s))"
  exit 1
fi
echo "ir-boundary: OK"
