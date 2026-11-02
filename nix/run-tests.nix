# vuna 原生测试 runner：`nix run .#vuna-run-tests`。
#
# 主体在 nix/run-tests.sh；本文件只注入 PATH 与构建期回退模板（见脚本内注释）。
# 编译器（VUNA / VUNA_SEED）在运行时解析：环境变量优先，否则运行时
# `nix build --no-link --print-out-paths <flake>#vuna`（--vuna stable 用注册表别名 vuna）。
{ pkgs, tools }:
let
  inherit (pkgs) lib;

  drv = pkgs.writeShellScriptBin "vuna-run-tests" ''
    export PATH="${lib.makeBinPath tools}:$PATH"
    # 找不到本地工作树时，--list 退回构建期的 test/run-tests.sh 副本（仅够列章节标题）。
    export VUNA_RUN_TESTS_TEMPLATE="${../test/run-tests.sh}"
    exec ${pkgs.bash}/bin/bash ${./run-tests.sh} "$@"
  '';
in
drv
// {
  meta = drv.meta // {
    description = "vuna 原生测试（包装 test/run-tests.sh，支持 --list / --only）";
  };
}
