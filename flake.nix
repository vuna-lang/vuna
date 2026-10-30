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
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      # 自举链与种子策略：
      #   vunax（外部编译器，OCaml）编译 app/ lib/ test/ 里的 vuna 编译器源码
      #   → 生成 OCaml（bootstrap/，stage 1，自举种子）并提交入库；
      #   → Nix 直接构建入库的 bootstrap/ 得到 stage 1 种子编译器；
      #   → 种子编译当前源码得到 stage 2；stage 2 再编译同一份源码得到 stage 3；
      #     两者行为一致（fixed point）才算自举完成。
      # 种子是构建输入：日常改源码不重新生成，只在发版或兼容性变更时更新；
      # 不变量是「当前种子必须能编译当前源码」。后续加：
      #   packages.vuna             从 bootstrap/ 构建 stage 1
      #   checks.bootstrap-selfhost 种子编译当前源码 → stage 2 并运行（守不变量）
      #   checks.fixed-point        stage 2 与 stage 3 行为一致
      #   packages.vunax / checks.vunax-selfhost  外部编译器兜底（发版时重新生成种子）
      # 目前可构建 stage 0（vunax），以及 M4b 的 vuna-run（自解释器编译产物）。
      packages = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          inherit (pkgs) lib;
          ocamlPackages = pkgs.ocamlPackages;

          # 外部编译器（stage 0）：用 OCaml 写，把 vuna 源码编译成 OCaml。
          # 它本身不是自举种子。
          vunax = ocamlPackages.buildDunePackage {
            pname = "vunax";
            version = "0.1.0";

            # 本地构建的包不会出现在任何 binary cache 里，标记为不接受
            # 替代：Nix 不再为它的输出向 substituter 发 narinfo 查询，
            # 直接本地构建；依赖（ocaml、dune 等）仍照常走缓存替换。
            allowSubstitutes = false;

            # 只把 vunax 需要的文件拷进 Nix store：vunax 源码，以及测试要读取的
            # 自解释器源码 app/interp.vuna 与 CLI 驱动 app/run.vuna；app/、lib/、
            # test/ 里的其他 vuna 源码属于自举阶段，不是 vunax 的构建输入。
            src = lib.fileset.toSource {
              root = ./.;
              fileset = lib.fileset.unions [
                ./dune-workspace
                ./vunax
                ./app/interp.vuna
                ./app/run.vuna
              ];
            };

            doCheck = true;
            checkInputs = [ ocamlPackages.alcotest ];

            meta = {
              description = "vunax — external vuna compiler (written in OCaml)";
              license = lib.licenses.mit;
              mainProgram = "vunax";
            };
          };

          # M4b：把 vuna 自解释器（app/interp.vuna，去掉 demo main）与
          # app/run.vuna 的 CLI 入口拼接，用 vunax 编译成独立二进制。
          # 它从命令行读 .vuna 文件并解释执行。
          vuna-run =
            pkgs.runCommand "vuna-run-0.1.0"
              {
                nativeBuildInputs = [
                  pkgs.ocaml
                  pkgs.binutils
                  pkgs.gcc
                ];
                allowSubstitutes = false;

                meta = {
                  description = "vuna interpreter compiled to OCaml (M4b)";
                  license = lib.licenses.mit;
                  mainProgram = "vuna-run";
                };
              }
              ''
                mkdir -p "$out/bin"
                sed '/^main = interpret demo$/d' ${./app/interp.vuna} > program.vuna
                cat ${./app/run.vuna} >> program.vuna
                ${vunax}/bin/vunax compile --no-print program.vuna > program.ml
                ocamlopt -w -a -o "$out/bin/vuna-run" program.ml
              '';
        in
        {
          default = vunax;
          inherit vunax;
          vuna-run = vuna-run;
        }
      );

      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          ocamlPackages = pkgs.ocamlPackages;

          # devShell 只需要能运行 vunax，不需要每次进入都跑包测试；
          # 测试由 nix build / nix flake check 负责。这样也避免
          # “测试失败 → devShell 构建失败 → 无法进 shell 调试”的死循环。
          vunax-dev = self.packages.${system}.vunax.overrideAttrs (_: {
            doCheck = false;
          });
        in
        {
          default = pkgs.mkShell {
            # 复用包构建里的 OCaml / dune / findlib。
            inputsFrom = [ self.packages.${system}.vunax ];

            packages = [
              # 把 vunax 本身暴露到 devShell 里，直接可用 `vunax` 命令。
              vunax-dev
            ]
            ++ (with ocamlPackages; [
              alcotest
              merlin
              ocaml-lsp
              ocamlformat
              odoc
              utop
            ]);

            shellHook = ''
              echo "vuna dev shell — OCaml $(ocaml -version), Dune $(dune --version)"
            '';
          };
        }
      );

      checks = forAllSystems (system: {
        inherit (self.packages.${system}) vunax;
        vuna-run = self.packages.${system}.vuna-run;
      });

      # nixfmt-tree 让不带参数的 `nix fmt` 也能格式化整个目录
      # （裸 nixfmt 在 Nix ≥ 2.34 下不带参数会读 stdin 并报错）。
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt-tree);
    };
}
