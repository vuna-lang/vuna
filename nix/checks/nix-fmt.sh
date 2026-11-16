#!/bin/sh
# checks.vuna-nix-fmt：flake.nix 与 nix/ 下的 Nix 文件必须与 nixfmt 输出一致。
set -eu

find nix -name '*.nix' -print0 | xargs -0 -r nixfmt --check
nixfmt --check flake.nix
