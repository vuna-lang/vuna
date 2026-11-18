# vuna 原生测试 runner：`nix run .#vuna-run-tests`。
#
# 没有 shell 编排层：直接调用仓库里刚构建出的 `vuna test --suite test/suite.toml`。
# 编译器固定为同一个 Nix 构建产物（stage 1），种子通过 VUNA_SEED 注入；case 的
# 并行度由 runner 的 `--jobs auto` 探测全部可用核。
{
  pkgs,
  tools,
  vuna,
  vuna-seed,
}:
let
  inherit (pkgs) lib;
in
pkgs.writeShellScriptBin "vuna-run-tests" ''
  set -eu
  export PATH="${lib.makeBinPath tools}:$PATH"
  repo=$PWD
  while [ ! -f "$repo/test/suite.toml" ]; do
    if [ "$repo" = "/" ]; then
      echo "vuna-run-tests: 找不到 test/suite.toml（请从 vuna 仓库内运行）" >&2
      exit 2
    fi
    repo=$(dirname "$repo")
  done
  export VUNA_BASE="$repo/packages/base"
  export VUNA_SEED="${vuna-seed}/bin/vuna-seed"
  export VUNA_OCAML_ID="''${VUNA_OCAML_ID:-$(ocamlopt -version 2>/dev/null || echo none)}"
  # suite 用**独立**对象库：`52_cache_framing` 会故意截断 store 里的 blob/lex 对象，
  # 与开发缓存共用会把所有 worktree 的重建成本一次性打回冷态。持久根保证
  # `--only <章节>` 反复跑仍有命中；`VUNA_STORE` 已设置时尊重调用方。
  export VUNA_STORE="''${VUNA_STORE:-$HOME/.vuna/test-store}"
  mkdir -p "$VUNA_STORE"
  exec "${vuna}/bin/vuna" test --suite "$repo/test/suite.toml" "$@"
''
// {
  meta = {
    description = "vuna 原生测试（vuna test --suite，原生 case 级并行）";
  };
}
