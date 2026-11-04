# vuna-perf：`nix run .#vuna-perf` 的包装（测量逻辑在 bench/run.sh）。
#
# 与 vuna-bench 的分工：vuna-bench 测编译器构建/编译墙钟；vuna-perf 测生成程序运行时
# （vuna 产物 vs 手写 OCaml）。请在仓库根目录运行。
{
  pkgs,
  tools,
  vuna,
}:
let
  inherit (pkgs) lib;

  drv = pkgs.writeShellScriptBin "vuna-perf" ''
    export PATH="${lib.makeBinPath ([ vuna ] ++ tools ++ [ pkgs.time ])}:$PATH"
    exec ${pkgs.bash}/bin/bash ${./../bench/run.sh} "$@"
  '';
in
drv
// {
  meta = drv.meta // {
    description = "生成程序与运行时性能基准（vuna 产物 vs 手写 OCaml）";
  };
}