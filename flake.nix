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

          # 归档的 stage 0 外部编译器（OCaml）。自举链已不再依赖它：
          # 种子由 vuna-boot 轮换生成，默认构建只经过 bootstrap/ → vuna-boot →
          # vuna。保留它仅用于历史/审计/从零重建参考，不再随新特性更新，也不进
          # checks；用 `nix build .#vunax` 可显式构建。
          vunax = ocamlPackages.buildDunePackage {
            pname = "vunax";
            version = "0.1.0";

            # 本地构建的包不会出现在任何 binary cache 里，标记为不接受
            # 替代：Nix 不再为它的输出向 substituter 发 narinfo 查询，
            # 直接本地构建；依赖（ocaml、dune 等）仍照常走缓存替换。
            allowSubstitutes = false;

            # 归档后不再需要 lib/ 与 app/（那是 vuna-facing 测试的输入）；
            # 只保留 vunax 自身源码，保证归档实现可独立构建。
            src = lib.fileset.toSource {
              root = ./.;
              fileset = lib.fileset.unions [
                ./dune-workspace
                ./vunax
              ];
            };

            # 冻结：不再与 vuna 语法同步，测试不进入构建/检查路径。
            doCheck = false;
            checkInputs = [ ocamlPackages.alcotest ];

            meta = {
              description = "vunax — archived stage 0 compiler (frozen, not used by bootstrap)";
              license = lib.licenses.mit;
              mainProgram = "vunax";
            };
          };

          # stage 1：提交入库的种子（bootstrap/stage1.ml），直接 ocamlopt 构建。
          # 种子由上一版 vuna-boot 轮换生成（seed rotation），不再经过 vunax；
          # 日常不随源码更新，不变量是它能编译当前源码。
          vuna-boot =
            pkgs.runCommand "vuna-boot-0.1.0"
              {
                nativeBuildInputs = [
                  pkgs.ocaml
                  pkgs.binutils
                  pkgs.gcc
                ];
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
                ocamlopt -w -a -o "$out/bin/vuna-boot" stage1.ml
              '';

          # stage 2：用入库种子编译当前 lib/ + app/compile.vuna 得到的当前编译器。
          vuna =
            pkgs.runCommand "vuna-0.1.0"
              {
                nativeBuildInputs = [
                  pkgs.ocaml
                  pkgs.binutils
                  pkgs.gcc
                ];
                allowSubstitutes = false;

                meta = {
                  description = "vuna compiler (stage 2, built by the seed)";
                  license = lib.licenses.mit;
                  mainProgram = "vuna";
                };
              }
              ''
                mkdir -p "$out/bin" app
                cp -r ${./lib} lib
                cp ${./app/compile.vuna} app/compile.vuna
                ${vuna-boot}/bin/vuna-boot --root lib --no-print app/compile.vuna stage2.ml
                ocamlopt -w -a -o "$out/bin/vuna" stage2.ml
              '';

          # 解释器（自解释器编译产物）：读 .vuna 文件解释执行，用于差分测试。
          # 用 vuna（stage 2）构建，不再经过 vunax。
          vuna-interp =
            pkgs.runCommand "vuna-interp-0.1.0"
              {
                nativeBuildInputs = [
                  pkgs.ocaml
                  pkgs.binutils
                  pkgs.gcc
                ];
                allowSubstitutes = false;

                meta = {
                  description = "vuna interpreter compiled to OCaml";
                  license = lib.licenses.mit;
                  mainProgram = "vuna-interp";
                };
              }
              ''
                mkdir -p "$out/bin" app
                cp -r ${./lib} lib
                cp ${./app/interp.vuna} app/interp.vuna
                ${vuna}/bin/vuna --no-print --root lib app/interp.vuna program.ml
                ocamlopt -w -a -o "$out/bin/vuna-interp" program.ml
              '';
        in
        {
          default = vuna;
          inherit vunax vuna-boot vuna-interp;
          vuna = vuna;
        }
      );

      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          ocamlPackages = pkgs.ocamlPackages;

          # devShell 只需要能运行 vunax / vuna-boot，不需要每次进入都跑包测试；
          # 测试由 nix build / nix flake check 负责。这样也避免
          # “测试失败 → devShell 构建失败 → 无法进 shell 调试”的死循环。
          vunax-dev = self.packages.${system}.vunax.overrideAttrs (_: {
            doCheck = false;
          });

          # vuna-boot 是从入库 bootstrap/stage1.ml 固定构建的，不依赖当前源码
          # 能否编译、也不跑测试，放进 devShell 很便宜。stage2 的 vuna 不进
          # devShell：种子失效时也要能进 shell 调试。
          vuna-boot = self.packages.${system}.vuna-boot;
        in
        {
          default = pkgs.mkShell {
            # 复用包构建里的 OCaml / dune / findlib。
            inputsFrom = [ self.packages.${system}.vunax ];

            packages = [
              # 把 vunax 本身暴露到 devShell 里，直接可用 `vunax` 命令。
              vunax-dev
              # 种子编译器：手动检查“当前种子能编译当前源码”。
              vuna-boot
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

      checks = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          inherit (self.packages.${system}) vuna-boot;
          bootstrap-selfhost =
            pkgs.runCommand "vuna-bootstrap-selfhost"
              {
                nativeBuildInputs = [
                  pkgs.ocaml
                  pkgs.binutils
                  pkgs.gcc
                ];
              }
              ''
                mkdir -p app
                cp -r ${./lib} lib
                cp ${./app/compile.vuna} app/compile.vuna
                # 种子编译当前源码 → stage 2（当前编译器）
                ${vuna-boot}/bin/vuna-boot --root lib --no-print app/compile.vuna stage2.ml
                ocamlopt -w -a -o stage2 stage2.ml
                # stage 2 再编译同一份源码 → stage 3；两者必须字节一致
                ./stage2 --root lib --no-print app/compile.vuna stage3.ml
                cmp stage2.ml stage3.ml
                # 行为抽查：当前编译器编译并运行一个程序
                cp ${./vunax/test/corpus/run/12_fact.vuna} fact.vuna
                ./stage2 --root lib fact.vuna fact.ml
                ocamlopt -w -a -o fact fact.ml
                test "$(./fact)" = "120"
                touch "$out"
              '';
        in
        {
          # vunax 已冻结归档，不再进入 checks；构建/自举链只用种子与 vuna。
          inherit (self.packages.${system}) vuna vuna-interp;
          bootstrap-selfhost = bootstrap-selfhost;
          fixed-point = bootstrap-selfhost;
        }
      );

      # nixfmt-tree 让不带参数的 `nix fmt` 也能格式化整个目录
      # （裸 nixfmt 在 Nix ≥ 2.34 下不带参数会读 stdin 并报错）。
      formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.nixfmt-tree);
    };
}
