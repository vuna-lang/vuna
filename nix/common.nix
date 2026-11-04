# 构建图公共部分：支持的系统、按系统取 pkgs、工具集与版本号。
# 这里只放纯函数/常量，不放任何派生（packages/checks/devShells 各自负责）。
{ nixpkgs }:
let
  inherit (nixpkgs) lib;

  systems = [
    "x86_64-linux"
    "aarch64-linux"
  ];

  # OCaml 工具链：构建种子/阶段产物只需要 ocamlopt、汇编与链接。
  ocamlTools = pkgs: [
    pkgs.ocaml
    pkgs.binutils
    pkgs.gcc
  ];

  # 测试/基准 runner 的 PATH：OCaml 工具链 + 脚本用到的 coreutils 系。
  # jq 供 bench.sh 解析基线 JSON（--baseline / --check），不再用 sed 解析。
  # 顺序与历史列表保持一致（makeBinPath 的输出会进入派生，顺序影响哈希）。
  shellTools =
    pkgs:
    ocamlTools pkgs
    ++ [
      pkgs.bash
      pkgs.coreutils
      pkgs.diffutils
      pkgs.findutils
      pkgs.gawk
      pkgs.gnugrep
      pkgs.gnused
      pkgs.jq
    ];
in
{
  inherit systems ocamlTools shellTools;

  forAllSystems = lib.genAttrs systems;

  pkgsFor = system: nixpkgs.legacyPackages.${system};

  # 版本号：包名与 meta 使用；vuna.toml 里的版本保持独立（不解析 TOML）。
  version = "0.1.0";
}
