{
  description = "vuna — 函数式编程语言 vuna 的编译器";

  # 使用 nixos-unstable channel 的官方 tarball 作为 nixpkgs 输入。
  # 原因：当前网络下 github.com 的 archive 端点不可达，而 channels.nixos.org 可用。
  # 若能正常访问 GitHub，可改为 "github:NixOS/nixpkgs/nixos-unstable"。
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  # 构建图按职责拆在 nix/ 下：
  #   common.nix   —— 系统列表、工具集、版本号
  #   packages.nix —— 自举链（vuna-seed → vuna-compiler → vuna）与开发 runner
  #   checks/      —— CI 门槛（定义在 checks/default.nix，主体是 checks/*.sh）
  #   outputs.nix  —— 组装 packages / checks / devShells / formatter
  outputs =
    { nixpkgs, ... }:
    import ./nix/outputs.nix { inherit nixpkgs; };
}
