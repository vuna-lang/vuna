#!/bin/sh
# checks.vuna-package：包管理链路冒烟（多包示例、包内测试、fmt/doc、根包构建）。
#
# 由 nix/checks/default.nix 的 mkCheck 调用：cwd 是已暂存的工作树，
# $VUNA / $VUNA_COMPILER 由 Nix 注入。
#
# M24：`build` 默认走 DT 单文件 codegen（.output/{main.ml,build.sh,bin/<pkg>}），
# examples/multi 的 main 用 `exit 0` 收尾，输出与 golden 一致。
set -eu

OUT=${1:?usage: vuna-package.sh OUT}
: "${VUNA:?VUNA 未设置}"
: "${VUNA_COMPILER:?VUNA_COMPILER 未设置}"

# 编译器 CLI 独立可用。
"$VUNA_COMPILER" help | grep -q "vuna-compiler compile"

# 多包示例：workspace 根包 + 成员依赖包 + base 路径依赖。
rm -rf examples/multi/.output
"$VUNA" build examples/multi
test "$(examples/multi/.output/bin/multi)" = 'hi hi hi|n2 n1'

# 包内测试运行器。
"$VUNA" test examples/multi >"$OUT/test.log"
grep -q "1 passed, 0 failed" "$OUT/test.log"

# 格式化检查与文档生成。
"$VUNA" fmt --check examples/multi
"$VUNA" doc examples/multi/greet "$OUT/api.html"
grep -q "Greet" "$OUT/api.html"

# 仓库自身（根包）也走 DT build（.output/bin/<包名> 仍须可用）。
rm -rf .output
"$VUNA" build .
./.output/bin/vuna help | grep -q usage