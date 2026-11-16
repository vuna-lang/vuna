{
  description = "vuna — 函数式编程语言 vuna 的编译器";

  # 使用 nixos-unstable channel 的官方 tarball 作为 nixpkgs 输入。
  # 原因：当前网络下 github.com 的 archive 端点不可达，而 channels.nixos.org 可用。
  # 若能正常访问 GitHub，可改为 "github:NixOS/nixpkgs/nixos-unstable"。
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  # 构建图按职责拆在 nix/ 下：
  #   build/   —— flake outputs：common / packages / run-tests / outputs
  #   checks/  —— CI 门槛（default.nix + 入口脚本 + lib/ 实现 + data/ 基线）
  #   seed/    —— seed rotation 与 TCB 断言
  #   tools/   —— 独立开发工具（metrics / context-budget / obs）
  outputs =
    { nixpkgs, ... }:
    import ./nix/build/outputs.nix { inherit nixpkgs; };
}
