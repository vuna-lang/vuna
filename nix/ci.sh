#!/bin/sh
# 仓库 CI 单一入口：在仓库根跑全量 Nix checks。
#
# 用法:
#   sh nix/ci.sh              # 等价于下方命令
#   sh nix/ci.sh --keep-going # 额外参数透传给 nix flake check
#
# 固定两件事，避免本地/CI 口径漂移：
#   - 关闭 eval cache：并行/多 worktree 下 eval-cache 可能返回旧求值结果；
#   - --keep-going：一个 check 失败不阻断其它 check，失败面一次看全。
set -eu
cd "$(dirname "$0")/.."
exec env NIX_CONFIG="eval-cache = false" nix flake check --keep-going "$@"