#!/bin/sh
# checks.context-budget：冷启动上下文预算（入口文档字节数 / 单模块行数；超预算失败，
# 达到 70% 只打印 WARN。预算按实测 ×1.5 留余量，策略见 nix/context.budget 头部）。
#
# 由 nix/checks/default.nix 的 mkCheck 调用：cwd 是已暂存的工作树，
# $1 是输出目录；预算文件与复测脚本从同一工作树的 nix/ 下读取。
set -eu

OUT=${1:?usage: context-budget.sh OUT}

sh nix/context-budget.sh . nix/context.budget