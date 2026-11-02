#!/bin/sh
# checks.vuna-package：包管理链路冒烟（多包示例、包内测试、fmt/doc、根包构建）。
#
# 由 nix/checks/default.nix 的 mkCheck 调用：cwd 是已暂存的工作树，
# $VUNA / $VUNA_COMPILER 由 Nix 注入。
set -eu

OUT=${1:?usage: vuna-package.sh OUT}
: "${VUNA:?VUNA 未设置}"
: "${VUNA_COMPILER:?VUNA_COMPILER 未设置}"

# 编译器 CLI 独立可用。
"$VUNA_COMPILER" help | grep -q "vuna-compiler compile"

# 多包示例：workspace 根包 + 成员依赖包 + base 路径依赖。
"$VUNA" build examples/multi
test "$(examples/multi/.output/bin/multi)" = 'hi hi hi|n2 n1'

# 包内测试运行器。
"$VUNA" test examples/multi >"$OUT/test.log"
grep -q "1 passed, 0 failed" "$OUT/test.log"

# 格式化检查与文档生成。
"$VUNA" fmt --check examples/multi
"$VUNA" doc examples/multi/greet "$OUT/api.md"
grep -q "## Greet" "$OUT/api.md"

# 仓库自身（根包）也走 package 模式构建。
"$VUNA" build .
./.output/bin/vuna help | grep -q usage