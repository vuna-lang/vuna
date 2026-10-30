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
      #   seed/（提交入库的**多文件** OCaml 信任锚点：逐 vuna 模块的 .ml/.mli + build.sh）
      #     → seed/build.sh → ocamlopt 链接 → vuna-seed（stage 0）
      #     → vuna-seed build --split stage1 .（分离编译当前源码）
      #     → stage1/build.sh → ocamlopt → vuna（stage 1，当前编译器）
      #     → vuna 再生成 stage2 文件集；stage1 == stage2（文件集合逐字节）即 fixed point
      #
      # 种子通过 seed rotation 更新（nix/seed-rotate.sh）：
      #   vuna seed seed .
      # 不变量：当前入库种子必须能编译当前源码（checks.seed-selfhost 守）。
      packages = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          inherit (pkgs) lib;

          ocamlTools = ocamlToolsFn (system);

          # 手动性能基准（`nix run .#bench`）；不进 checks。
          vuna-bench = import ./nix/bench.nix { inherit pkgs ocamlTools; };

          # stage 0：提交入库的多文件信任锚点种子，用 seed/build.sh 构建。
          vuna-seed =
            pkgs.runCommand "vuna-seed-0.1.0"
              {
                nativeBuildInputs = ocamlTools;
                allowSubstitutes = false;

                meta = {
                  description = "vuna seed compiler (stage 0, multi-file seed)";
                  license = lib.licenses.mit;
                  mainProgram = "vuna-seed";
                };
              }
              ''
                mkdir -p "$out/bin"
                cp -r ${./seed} seed
                chmod -R u+w seed
                cd seed
                sh build.sh "$out/bin/vuna-seed"
              '';

          # stage 1：种子对当前源码做分离编译（逐模块 .ml/.mli），再用生成的 build.sh 构建。
          vuna =
            pkgs.runCommand "vuna-0.1.0"
              {
                nativeBuildInputs = ocamlTools;
                allowSubstitutes = false;

                meta = {
                  description = "vuna compiler (stage 1, split-compiled by the seed)";
                  license = lib.licenses.mit;
                  mainProgram = "vuna";
                };
              }
              ''
                mkdir -p "$out/bin"
                cp -r ${./lib} lib
                cp -r ${./stdlib} stdlib
                cp -r ${./app} app
                cp ${./vuna.toml} vuna.toml
                chmod -R u+w .
                ${vuna-seed}/bin/vuna-seed build --split stage1 .
                cd stage1
                sh build.sh "$out/bin/vuna"
              '';

        in
        {
          default = vuna;
          inherit vuna-seed vuna-bench;
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
              self.packages.${system}.vuna-seed
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
          inherit (self.packages.${system}) vuna-seed vuna;

          # M12：种子 → stage1（分离编译文件集）→ stage2 文件集，逐字节一致。
          seed-selfhost =
            pkgs.runCommand "vuna-seed-selfhost"
              {
                allowSubstitutes = false;
                nativeBuildInputs = ocamlToolsFn system;
              }
              ''
                cp -r ${./seed} seed
                cp -r ${./lib} lib
                cp -r ${./stdlib} stdlib
                cp -r ${./app} app
                cp ${./vuna.toml} vuna.toml
                chmod -R u+w .
                # 构建种子（stage 0）
                ( cd seed && sh build.sh ../vuna-seed )
                # 种子对当前源码分离编译 → stage1 源码集
                ./vuna-seed build --split s1 .
                # 在副本里构建 stage1，避免构建产物污染文件集比较
                cp -r s1 b1
                ( cd b1 && sh build.sh ../vuna-stage1 )
                # stage1 再生成 → stage2 源码集；两者逐字节一致
                ./vuna-stage1 build --split s2 .
                diff -r s1 s2
                # 行为抽查：当前编译器编译并运行一个程序
                cp ${./test/corpus/run/12_fact.vuna} fact.vuna
                ./vuna-stage1 --root lib fact.vuna fact.ml
                ocamlopt -g -w -a+39 -warn-error +39 -o fact fact.ml
                test "$(./fact)" = "120"
                # 增量构建：无改动时 build.sh 不重编任何模块（只链接）
                ( cd b1 && sh build.sh ../vuna-stage1 ) >build2.log
                ! grep -q '^compile ' build2.log
                touch b1/Vuna_dList.ml
                ( cd b1 && sh build.sh ../vuna-stage1 ) >build3.log
                grep -q '^compile Vuna_dList' build3.log
                ! grep -q '^compile Vuna_dRuntime' build3.log
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
                cp -r ${./lib} lib
                cp -r ${./stdlib} stdlib
                cp -r ${./app} app
                cp ${./vuna.toml} vuna.toml
                chmod -R u+w .
                ${vuna}/bin/vuna check .
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
                ${vuna}/bin/vuna lint ${./lib/Vuna}/*.vuna ${./stdlib/lib/Vuna}/*.vuna ${./stdlib/lib}/*.vuna ${./app}/*.vuna
                touch "$out/ok"
              '';

          # M12：机器无关的 codegen 指标门槛（bytes/lines/let rec/拼接/ctor 计数等）。
          vuna-metrics =
            pkgs.runCommand "vuna-metrics"
              {
                allowSubstitutes = false;
              }
              ''
                mkdir -p "$out"
                cp -r ${./lib} lib
                cp -r ${./stdlib} stdlib
                cp -r ${./app} app
                cp ${./vuna.toml} vuna.toml
                chmod -R u+w .
                ${vuna}/bin/vuna build --split "$out/self" .
                sh ${./nix/metrics.sh} "$out/self" ${./nix/metrics.budget} >"$out/metrics.txt"
                cat "$out/metrics.txt"
                touch "$out/ok"
              '';

          # M11.5 包管理：在 Nix 沙箱内用 package 模式构建多包示例并验证可复现。
          vuna-package =
            pkgs.runCommand "vuna-package"
              {
                allowSubstitutes = false;
                nativeBuildInputs = ocamlToolsFn system;
              }
              ''
                mkdir -p "$out"
                cp -r ${./lib} lib
                cp -r ${./stdlib} stdlib
                cp -r ${./app} app
                cp -r ${./examples} examples
                cp ${./vuna.toml} vuna.toml
                chmod -R u+w .
                # 多包示例：workspace 根包 + 成员依赖包 + stdlib 路径依赖
                ${vuna}/bin/vuna build examples/multi "$out/multi.ml"
                ocamlopt -g -w -a+39 -warn-error +39 -o "$out/multi" "$out/multi.ml"
                test "$("$out/multi")" = '"hi hi hi|n2 n1"'
                # 包内测试运行器
                ${vuna}/bin/vuna test examples/multi >"$out/test.log"
                grep -q "1 passed, 0 failed" "$out/test.log"
                # 格式化检查与文档生成
                ${vuna}/bin/vuna fmt --check examples/multi
                ${vuna}/bin/vuna doc examples/multi/greet "$out/api.md"
                grep -q "## Greet" "$out/api.md"
                # 仓库自身（编译器包）也走 package 模式构建
                ${vuna}/bin/vuna build . "$out/self.ml"
                ocamlopt -g -w -a+39 -warn-error +39 -o "$out/self" "$out/self.ml"
                "$out/self" help | grep -q usage
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
                cp -r ${./stdlib} stdlib
                cp -r ${./lib} lib
                cp -r ${./app} app
                cd test
                VUNA=${vuna}/bin/vuna \
                VUNA_SEED=${vuna-seed}/bin/vuna-seed \
                sh run-tests.sh
                touch "$out"
              '';
        in
        {
          inherit vuna vuna-seed;
          seed-selfhost = seed-selfhost;
          fixed-point = seed-selfhost;
          vuna-tests = vuna-tests;
          vuna-package = vuna-package;
          vuna-metrics = vuna-metrics;
          vuna-typecheck = vuna-typecheck;
          vuna-lint = vuna-lint;
        }
      );

      # nixfmt-tree 让不带参数的 `nix fmt` 也能格式化整个目录
      # （裸 nixfmt 在 Nix ≥ 2.34 下不带参数会读 stdin 并报错）。
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt-tree);
    };
}
