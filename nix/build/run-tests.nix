# vuna 原生测试 runner：`nix run .#vuna-run-tests`。
#
# 没有 shell 编排层：`vuna dev suite --all` 按 test/suite.toml 的 driver 清单逐个调用
# 各包独立 suite，共享同一个 VUNA_STORE。编译器固定为同一个 Nix 构建产物（stage 1），
# 种子通过 VUNA_SEED 注入；case 的并行度由 runner 的 `--jobs auto` 探测全部可用核。
{
  pkgs,
  tools,
  vuna,
  vuna-seed,
  vuna-web-cli,
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
  export VUNA_OBS_PKG="$repo/packages/obs"
  export VUNA_SEED="${vuna-seed}/bin/vuna-seed"
  export VUNA_WEB_CLI="${vuna-web-cli}/bin/vuna-web-cli"
  export VUNA_OCAML_ID="''${VUNA_OCAML_ID:-$(ocamlopt -version 2>/dev/null || echo none)}"
  # suite 用**独立**对象库：`52_cache_framing` 会故意截断 store 里的 blob/lex 对象，
  # 与开发缓存共用会把所有 worktree 的重建成本一次性打回冷态。持久根保证
  # `--only <owner/family>` 反复跑仍有命中；`VUNA_STORE` 已设置时尊重调用方。
  export VUNA_STORE="''${VUNA_STORE:-$HOME/.vuna/test-store}"
  mkdir -p "$VUNA_STORE"
  cd "$repo"
  # `--all` 读 test/suite.toml 的 driver 清单；清单只维护这一份。
  failed=0
  "${vuna}/bin/vuna" dev suite --all "$@" || failed=1
  # 包内单测（顶层 test/*.vuna）。
  for pkg in "$repo"/packages/*; do
    [ -d "$pkg/test" ] || continue
    set -- "$pkg"/test/*.vuna
    [ -e "$1" ] || continue
    "${vuna}/bin/vuna" test "$pkg" || failed=1
  done
  exit "$failed"
''
// {
  meta = {
    description = "vuna 原生测试（vuna dev suite，原生 case 级并行）";
  };
}
