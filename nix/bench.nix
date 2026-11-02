# vuna-bench：`nix run .#vuna-bench` 的包装（测量逻辑在 nix/bench.sh）。
#
# 不是 CI check；请在仓库根目录运行（脚本会检查 seed/、app/ 等路径）。
{ pkgs, tools }:
let
  inherit (pkgs) lib;

  drv = pkgs.writeShellScriptBin "vuna-bench" ''
    export PATH="${lib.makeBinPath tools}:$PATH"
    exec ${pkgs.bash}/bin/bash ${./bench.sh} "$@"
  '';
in
drv
// {
  meta = drv.meta // {
    description = "手动 vuna 性能基准（构建/编译/产物尺寸）";
  };
}
