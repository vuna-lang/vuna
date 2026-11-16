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
    in
    {
      inherit packages;

      checks = import ../checks {
        inherit
          pkgs
          packages
          ocamlTools
          e2eTools
          ;
      };

      # default 是全量开发环境；ocaml 只含工具链，不依赖仓库源码，
      # 种子重建/坏掉时仍可进入（direnv 默认用 default）。
      devShells = {
        default = pkgs.mkShell {
          packages = e2eTools ++ [ packages.vuna-seed ];
          # 单一 store 根：不再按 worktree 分 `.local/store`（默认 `~/.vuna/store`）。
          # 测试用独立根（`nix/build/run-tests.nix`），因为 suite 会故意破坏对象。
          shellHook = ''
            export VUNA_OCAML_ID="''${VUNA_OCAML_ID:-$(ocamlopt -version 2>/dev/null || echo none)}"
            echo "vuna dev shell — OCaml $(ocaml -version)（VUNA_STORE=''${VUNA_STORE:-默认根 ~/.vuna/store}；VUNA_OCAML_ID=$VUNA_OCAML_ID）"
          '';
        };

        ocaml = pkgs.mkShell {
          packages = ocamlTools ++ wasmTools;
          shellHook = ''
            echo "vuna OCaml shell — OCaml $(ocaml -version)（不含 vuna-seed；需要时用 nix develop .#default）"
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
