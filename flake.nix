{
  description = "vuna — 函数式编程语言 vuna 的编译器";

  # 使用 nixos-unstable channel 的官方 tarball 作为 nixpkgs 输入。
  # 原因：当前网络下 github.com 的 archive 端点不可达，而 channels.nixos.org 可用。
  # 若能正常访问 GitHub，可改为 "github:NixOS/nixpkgs/nixos-unstable"。
  inputs.nixpkgs.url = "tarball+https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";

  outputs =
    { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];

      forAllSystems = nixpkgs.lib.genAttrs systems;

      ocamlToolsFn =
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        [
          pkgs.ocaml
          pkgs.binutils
          pkgs.gcc
        ];
    in
    {
      # 自举链（完全由 vuna 自己维持，没有外部编译器）：
      #   bootstrap/stage1.ml（提交入库的 OCaml 种子）
      #     → ocamlopt → vuna-boot（stage 1）
      #     → vuna-boot 编译当前 lib/ + app/Main.vuna → stage2.ml
      #     → ocamlopt → vuna（stage 2，当前编译器）
      #     → vuna 再编译同一份源码 → stage3.ml；stage2 == stage3 即 fixed point
      #
      # 种子通过 seed rotation 更新：
      #   vuna-boot --root lib --root app --no-print app/Main.vuna bootstrap/stage1.ml
      # 不变量：当前入库种子必须能编译当前源码（checks.bootstrap-selfhost 守）。
      packages = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          inherit (pkgs) lib;

          ocamlTools = ocamlToolsFn (system);

          # 手动性能基准（`nix run .#bench`）；不进 checks。
          vuna-bench = import ./nix/bench.nix { inherit pkgs ocamlTools; };

          # stage 1：提交入库的种子，直接 ocamlopt 构建。
          vuna-boot =
            pkgs.runCommand "vuna-boot-0.1.0"
              {
                nativeBuildInputs = ocamlTools;
                allowSubstitutes = false;

                meta = {
                  description = "vuna boot compiler (stage 1 seed)";
                  license = lib.licenses.mit;
                  mainProgram = "vuna-boot";
                };
              }
              ''
                mkdir -p "$out/bin"
                cp ${./bootstrap/stage1.ml} stage1.ml
                ocamlopt -g -w -a+39 -warn-error +39 -o "$out/bin/vuna-boot" stage1.ml
              '';

          # stage 2：用入库种子编译当前源码得到的当前编译器。
          vuna =
            pkgs.runCommand "vuna-0.1.0"
              {
                nativeBuildInputs = ocamlTools;
                allowSubstitutes = false;

                meta = {
                  description = "vuna compiler (stage 2, built by the seed)";
                  license = lib.licenses.mit;
                  mainProgram = "vuna";
                };
              }
              ''
                mkdir -p "$out/bin"
                cp -r ${./lib} lib
                cp -r ${./app} app
                ${vuna-boot}/bin/vuna-boot --root lib --root app --no-print app/Main.vuna stage2.ml
                ocamlopt -g -w -a+39 -warn-error +39 -o "$out/bin/vuna" stage2.ml
              '';

        in
        {
          default = vuna;
          inherit vuna-boot vuna-bench;
          vuna = vuna;
        }
      );

      apps = forAllSystems (system: {
        # 手动性能基准：nix run .#bench -- [--compiler boot] [--runs N] ...
        bench = {
          type = "app";
          program = "${self.packages.${system}.vuna-bench}/bin/vuna-bench";
          meta = {
            description = "手动 vuna 性能基准（构建/编译/产物尺寸）";
          };
        };
      });

      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.mkShell {
            packages = ocamlToolsFn system ++ [
              # 种子编译器：手动检查“当前种子能编译当前源码”。
              self.packages.${system}.vuna-boot
              # 手动性能基准（等价于 nix run .#bench）。
              self.packages.${system}.vuna-bench
            ];

            shellHook = ''
              echo "vuna dev shell — OCaml $(ocaml -version)"
            '';
          };
        }
      );

      checks = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          inherit (self.packages.${system}) vuna-boot vuna;

          bootstrap-selfhost =
            pkgs.runCommand "vuna-bootstrap-selfhost"
              {
                allowSubstitutes = false;
                nativeBuildInputs = ocamlToolsFn system;
              }
              ''
                cp -r ${./lib} lib
                cp -r ${./app} app
                # 种子编译当前源码 → stage 2（当前编译器）
                ${vuna-boot}/bin/vuna-boot --root lib --root app --no-print app/Main.vuna stage2.ml
                ocamlopt -g -w -a+39 -warn-error +39 -o stage2 stage2.ml
                # stage 2 再编译同一份源码 → stage 3；两者必须字节一致
                ./stage2 --root lib --root app --no-print app/Main.vuna stage3.ml
                cmp stage2.ml stage3.ml
                # 行为抽查：当前编译器编译并运行一个程序
                cp ${./test/corpus/run/12_fact.vuna} fact.vuna
                ./stage2 --root lib fact.vuna fact.ml
                ocamlopt -g -w -a+39 -warn-error +39 -o fact fact.ml
                test "$(./fact)" = "120"
                touch "$out"
              '';

          # 类型检查自检：当前编译器必须能类型检查自己的源码。
          vuna-typecheck =
            pkgs.runCommand "vuna-typecheck"
              {
                allowSubstitutes = false;
              }
              ''
                mkdir -p "$out"
                ${vuna}/bin/vuna --typecheck --no-print --root ${./lib} --root ${./app} ${./app/Main.vuna} "$out/self.ml"
                touch "$out/ok"
              '';

          # lint 自检：当前源码必须零 finding。
          vuna-lint =
            pkgs.runCommand "vuna-lint"
              {
                allowSubstitutes = false;
              }
              ''
                mkdir -p "$out"
                ${vuna}/bin/vuna lint ${./lib/Vuna}/*.vuna ${./app}/*.vuna
                touch "$out/ok"
              '';

          # 原生测试：只用种子与 vuna。
          vuna-tests =
            pkgs.runCommand "vuna-tests"
              {
                allowSubstitutes = false;
                nativeBuildInputs = ocamlToolsFn system;
              }
              ''
                cp -r ${./test} test
                cd test
                VUNA=${vuna}/bin/vuna \
                VUNA_BOOT=${vuna-boot}/bin/vuna-boot \
                sh run-tests.sh
                touch "$out"
              '';
        in
        {
          inherit vuna vuna-boot;
          bootstrap-selfhost = bootstrap-selfhost;
          fixed-point = bootstrap-selfhost;
          vuna-tests = vuna-tests;
          vuna-typecheck = vuna-typecheck;
          vuna-lint = vuna-lint;
        }
      );

      # nixfmt-tree 让不带参数的 `nix fmt` 也能格式化整个目录
      # （裸 nixfmt 在 Nix ≥ 2.34 下不带参数会读 stdin 并报错）。
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt-tree);
    };
}
