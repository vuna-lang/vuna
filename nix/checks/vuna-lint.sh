#!/bin/sh
# checks.vuna-lint：workspace 各包的 lib/ 与 app/ 必须零 lint finding。
# 配置来自根 vuna.toml 的 [lint]；warning 也按失败处理（--max-warnings 0）。
set -eu

OUT=${1:?usage: vuna-lint.sh OUT}
: "${VUNA:?VUNA 未设置}"

"$VUNA" lint --max-warnings 0
