# CI store 缓存的锚点：只装「跨 commit 稳定」的第三方工具闭包。
#
# 为什么单独一个派生：Nix 是内容寻址的，本仓库的 vuna-seed / vuna-compiler / 插件
# 全部由源码过滤后的 `build.sh` 现场编译，改一行就换一批 store path，上一代产物对
# 新 commit 一定是垃圾。而 ocaml / gcc / binutils / node 这些第三方闭包只由
# flake.lock 与 common.nix 的工具集决定，跨 commit 完全不变 —— 它们是唯一值得缓存
# 的东西（本地实测 ~1.1G nar 的构建闭包里，第三方占 0.84G，vuna 自己的产物 0.28G）。
#
# 用法（见 `.github/workflows/_check.yml`）：CI 只把这个闭包登记成 GC root，save 前
# 的 `nix store gc --max <目标大小>` 于是把本 commit 的 vuna 产物全部收走，存档里
# 只剩一份可以给下一个 commit 直接用的依赖。
{ nixpkgs }:
let
  common = import ./common.nix { inherit nixpkgs; };
in
{
  ciDeps =
    system:
    let
      pkgs = common.pkgsFor system;
      # 构建期（ocaml + 汇编 + 链接）与测试期（wasm-tools / node / git / jq …）的全部
      # 外部工具，正好是 common.nix 里那三份列表的并集。
      tools = common.ocamlTools pkgs ++ common.shellTools pkgs ++ common.e2eTools pkgs;
    in
    pkgs.buildEnv {
      name = "vuna-ci-deps";
      paths = pkgs.lib.unique tools;
      # 工具集之间 bin/ 有重叠（coreutils / findutils / gnused …），这里只要把路径
      # 汇总成一个 GC root 并让闭包带上它们，不需要 buildEnv 的 PATH 合并语义。
      pathsToLink = [ "/bin" ];
      ignoreCollisions = true;
    };
}
