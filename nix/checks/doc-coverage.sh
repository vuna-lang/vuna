#!/bin/sh
# checks.doc-coverage：docstring 覆盖 ratchet 门禁的 Nix 入口。
#
# 主体在 nix/doc-coverage.sh（与 context-budget 同样的分工：nix/ 下放可本地复跑的
# 脚本，nix/checks/ 下放只做转发的 Nix check 入口）。由 nix/checks/default.nix 的
# mkCheck 调用：cwd 是已暂存的工作树，$1 是输出目录，$VUNA 由 Nix 注入。
set -eu

OUT=${1:?usage: doc-coverage.sh OUT}
sh nix/doc-coverage.sh "$OUT"