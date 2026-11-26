#!/usr/bin/env bash
# 按改动路径派生 PR 的 pkg/area 标签。
#
# 用法:
#   git diff --name-only origin/main...HEAD | nix/tools/pr-labels.sh
#   nix/tools/pr-labels.sh packages/compiler/lib/Vuna/Compiler/Frontend/Parser.vuna
#
# 输出一行一个标签，已排序去重。gate 计划器只读 pkg/area；type 由 PR 标题或
# 关联 issue 决定，seed 是 seed 轮换的优先级标签。
set -euo pipefail

usage() {
  sed -n '2,10p' "$0" | sed 's/^# \{0,1\}//'
}

if [ "${1:-}" = "-h" ] || [ "${1:-}" = "--help" ]; then
  usage
  exit 0
fi

declare -A seen=()
add() {
  [ -n "${1:-}" ] || return 0
  seen["$1"]=1
}

while IFS= read -r file; do
  [ -n "$file" ] || continue

  case "$file" in
    .github/*|.githooks/*|nix/*|flake.nix|flake.lock|vuna.toml)
      add area:ci
      ;;
    seed/*)
      add area:seed
      add seed
      ;;
    docs/*|README.md|AGENTS.md|CONTRIBUTING.md|.agents/*)
      add area:docs
      ;;
    vscode/*)
      add area:editor
      ;;
    wasm-host/*)
      add area:web
      ;;
    test/*|bench/*|examples/*)
      add area:tests
      ;;
    packages/*/test/*)
      pkg=${file#packages/}
      pkg=${pkg%%/*}
      add "pkg:$pkg"
      add area:tests
      ;;
    packages/compiler/lib/Vuna/Compiler/Frontend/*)
      add pkg:compiler
      add area:compiler-frontend
      ;;
    packages/compiler/lib/Vuna/Compiler/Elab/*|packages/compiler/lib/Vuna/Compiler/Core/*|packages/compiler/lib/Vuna/Compiler/Loader/*|packages/compiler/lib/Vuna/Compiler/Lowering/*)
      add pkg:compiler
      add area:compiler-core
      ;;
    packages/compiler/*)
      add pkg:compiler
      add area:compiler-core
      ;;
    packages/compiler-base/*)
      add pkg:compiler-base
      add area:compiler-core
      ;;
    packages/ir/*)
      add pkg:ir
      ;;
    packages/base/*)
      add pkg:base
      ;;
    packages/target-ocaml/*)
      add pkg:target-ocaml
      add area:codegen-ocaml
      ;;
    packages/target-native/*)
      add pkg:target-native
      add area:codegen-native
      ;;
    packages/target-wasm/*)
      add pkg:target-wasm
      add area:codegen-wasm
      ;;
    packages/toolchain/*)
      add pkg:toolchain
      ;;
    packages/cli/*)
      add pkg:cli
      ;;
    packages/dev/*)
      add pkg:dev
      ;;
    packages/plugin-kit/*)
      add pkg:plugin-kit
      ;;
    packages/obs/*)
      add pkg:obs
      ;;
    packages/http/*)
      add pkg:http
      add area:runtime
      ;;
    packages/plugin-web/*)
      add pkg:plugin-web
      add area:web
      ;;
    packages/web/*)
      add pkg:web
      add area:web
      ;;
    packages/web-cli/*)
      add pkg:web-cli
      add area:web
      ;;
    packages/*)
      pkg=${file#packages/}
      pkg=${pkg%%/*}
      add "pkg:$pkg"
      ;;
    *)
      add area:repo
      ;;
  esac
done < <(if [ $# -gt 0 ]; then printf '%s\n' "$@"; else cat; fi)

if [ "${#seen[@]}" -eq 0 ]; then
  echo area:repo
  exit 0
fi

printf '%s\n' "${!seen[@]}" | sort