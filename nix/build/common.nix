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

  # wasm 目标的外部工具：`wasm-tools parse` 汇编 WAT，`wasm-opt`（binaryen）对 `.wasm`
  # 做指令级优化；`.wasm` 由 Node/V8 宿主执行（`wasm-host/run.mjs`，nodejs 在 e2eTools
  # 里）。两者都是**构建期/测试期工具**，不进 TCB、不进 seed（与 native 侧的 cc 同构）。
  wasmTools = pkgs: [
    pkgs.wasm-tools
    pkgs.binaryen
  ];

  # CI e2e / 本地 `nix run .#vuna-run-tests` 的 PATH：两个后端的外部工具
  # （native 的 cc/as/ld、wasm 的 wasm-tools / Node）加上脚本用到的 git/jq。
  # devShell 与 checks 共用这一份，避免「本地能跑、CI 缺工具」。
  e2eTools =
    pkgs:
    ocamlTools pkgs
    ++ wasmTools pkgs
    ++ [
      pkgs.util-linux
      # 105c 的进程组断言用 `ps -o pgid=` 读自己的 pgid（e2e 沙箱必须能解析到 ps）。
      pkgs.procps
      pkgs.git
      pkgs.jq
      # wasm 产物的执行宿主（`wasm-host/run.mjs`）与 `108_obs_cdp` 的 CDP 冒烟都用 Node。
      pkgs.nodejs
    ];

  # 测试/基准 runner 的 PATH：OCaml 工具链 + 脚本用到的 coreutils 系。
  # jq 供 bench.sh 解析基线 JSON（--baseline / --check）；sed 抠 JSON 字段不可靠。
  # 顺序与历史列表保持一致（makeBinPath 的输出会进入派生，顺序影响哈希）。
  shellTools =
    pkgs:
    ocamlTools pkgs
    ++ wasmTools pkgs
    ++ [
      pkgs.bash
      pkgs.coreutils
      pkgs.diffutils
      pkgs.findutils
      pkgs.gawk
      pkgs.gnugrep
      pkgs.gnused
      pkgs.jq
      pkgs.util-linux
      pkgs.git
    ];
in
{
  inherit
    systems
    ocamlTools
    shellTools
    wasmTools
    e2eTools
    ;

  forAllSystems = lib.genAttrs systems;

  pkgsFor = system: nixpkgs.legacyPackages.${system};

  # 版本号：包名与 meta 使用；vuna.toml 里的版本保持独立（不解析 TOML）。
  version = "0.1.0";
}
