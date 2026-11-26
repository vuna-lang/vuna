# 按系统组装 flake outputs；flake.nix 只负责输入与委托。
{ nixpkgs }:
let
  common = import ./common.nix { inherit nixpkgs; };
  inherit (common) systems forAllSystems pkgsFor;

  # 每个系统一份完整输出；再按 flake 的输出类型转置。
  perSystem =
    system:
    let
      pkgs = pkgsFor system;
      ocamlTools = common.ocamlTools pkgs;
      wasmTools = common.wasmTools pkgs;
      e2eTools = common.e2eTools pkgs;
      packages = import ./packages.nix {
        inherit pkgs ocamlTools;
        shellTools = common.shellTools pkgs;
        e2eTools = common.e2eTools pkgs;
        inherit (common) version;
      };
      checks = import ../checks {
        inherit
          pkgs
          packages
          ocamlTools
          e2eTools
          ;
      };

      # 门禁分组覆盖（nix/checks/groups.nix）：分组引用必须存在，且每个 check 至少进
      # 一个门禁分组；`vuna` / `vuna-seed` / `vuna-compiler` 是构建产物，不要求分组。
      groups = import ../checks/groups.nix;
      refs = builtins.concatLists (
        map (g: groups.${g}) [
          "deep"
          "suite"
          "backends"
          "native"
          "browser"
        ]
      );
      parsed = map (ref: {
        inherit ref;
        m = builtins.match "(check|package):(.+)" ref;
      }) refs;
      malformed = map (x: x.ref) (builtins.filter (x: x.m == null) parsed);
      checkRefs = map (x: builtins.elemAt x.m 1) (
        builtins.filter (x: x.m != null && builtins.head x.m == "check") parsed
      );
      packageRefs = map (x: builtins.elemAt x.m 1) (
        builtins.filter (x: x.m != null && builtins.head x.m == "package") parsed
      );
      gateChecks = builtins.filter (
        n:
        !(builtins.elem n [
          "vuna"
          "vuna-seed"
          "vuna-compiler"
        ])
      ) (builtins.attrNames checks);
      missing = builtins.filter (n: !(builtins.elem n checkRefs)) gateChecks;
      unknownChecks = builtins.filter (n: !(builtins.elem n (builtins.attrNames checks))) checkRefs;
      unknownPackages = builtins.filter (n: !(builtins.elem n (builtins.attrNames packages))) packageRefs;
      groupError =
        if malformed != [ ] then
          "分组项必须是 check:<name> 或 package:<name>：${toString malformed}"
        else if unknownChecks != [ ] then
          "分组引用了不存在的 check：${toString unknownChecks}"
        else if unknownPackages != [ ] then
          "分组引用了不存在的 package：${toString unknownPackages}"
        else if missing != [ ] then
          "check 未进入任何门禁分组（deep/suite/backends）：${toString missing}"
        else
          null;
    in
    if groupError != null then
      throw "nix/checks/groups.nix: ${groupError}"
    else
      {
        inherit packages checks;

        # default 是全量开发环境；ocaml 只含工具链，不依赖仓库源码，
        # 种子重建/坏掉时仍可进入（direnv 默认用 default）。
        devShells = {
          default = pkgs.mkShell {
            packages = e2eTools ++ [ packages.vuna-seed ];
            # 单一 store 根：不再按 worktree 分 `.local/store`（默认 `~/.vuna/store`）。
            # 测试用独立根（`nix/build/run-tests.nix`），因为 suite 会故意破坏对象。
            shellHook = ''
              # 仓库内（含副 worktree）把 hooks 路径指向 .githooks：pre-commit 跑全仓库 fmt/lint/check。
              if git rev-parse --git-dir >/dev/null 2>&1 && [ "$(git config --get core.hooksPath || true)" != ".githooks" ]; then
                git config core.hooksPath .githooks
              fi
              # 横幅只在交互式终端出现：`nix develop --command` 之类调用（含 NIX_DEVSHELL_QUIET=1）保持静默。
              if [ -t 1 ] && [ -z "''${NIX_DEVSHELL_QUIET:-}" ]; then
                echo "vuna dev shell — OCaml $(ocaml -version)（VUNA_STORE=''${VUNA_STORE:-默认根 ~/.vuna/store}）"
              fi
            '';
          };

          ocaml = pkgs.mkShell {
            packages = ocamlTools ++ wasmTools;
            shellHook = ''
              if [ -t 1 ] && [ -z "''${NIX_DEVSHELL_QUIET:-}" ]; then
                echo "vuna OCaml shell — OCaml $(ocaml -version)（不含 vuna-seed；需要时用 nix develop .#default）"
              fi
            '';
          };
        };
      };

  all = forAllSystems perSystem;

  forEach = attr: forAllSystems (system: all.${system}.${attr});
in
{
  packages = forEach "packages";
  checks = forEach "checks";
  devShells = forEach "devShells";
  formatter = forAllSystems (system: (pkgsFor system).nixfmt-tree);
}
