# CI 门槛定义。每个 check 的源集合只在这里声明一次，mkCheck 用 fileset 暂存成
# 最小工作树，然后执行 nix/checks/<name>.sh（主体脚本），并由 Nix 注入工具路径。
#
# 约定：脚本以 cwd = 仓库根布局运行，$1 是输出目录；工具通过环境变量传入。
{
  pkgs,
  packages,
  ocamlTools,
}:
let
  inherit (pkgs) lib;

  inherit (packages)
    vuna
    vuna-seed
    vuna-compiler
    ;

  repo = ../..;

  sourceOf =
    srcs:
    lib.fileset.toSource {
      root = repo;
      fileset = lib.fileset.unions srcs;
    };

  exportEnv =
    env:
    lib.concatStringsSep "\n" (
      lib.mapAttrsToList (name: value: "export ${name}=${lib.escapeShellArg value}") env
    );

  mkCheck =
    {
      name,
      srcs,
      script,
      env ? { },
      nativeBuildInputs ? [ ],
    }:
    pkgs.runCommand name
      {
        inherit nativeBuildInputs;
        # 本仓库没有二进制缓存：不向 substituter 查询。
        allowSubstitutes = false;
      }
      ''
        mkdir -p "$out"
        cp -r ${sourceOf srcs}/. .
        chmod -R u+w .
        ${exportEnv env}
        sh ${script} "$out"
        touch "$out/ok"
      '';

  # seed → stage0 → stage1 → stage2，逐字节 fixed point（alias 已并入 seed-selfhost）。
  seed-selfhost = mkCheck {
    name = "vuna-seed-selfhost";
    srcs = [
      ../../seed
      ../../compiler
      ../../base
      ../../lib
      ../../app
      ../../vuna.toml
      ../../test/corpus/run/12_fact.vuna
      ../../test/corpus/dt/01_id.vuna
      ../../nix/tcb-check.sh
      ../../nix/tcb-forbidden.txt
      ../../nix/seed-count.txt
    ];
    env = {
      VUNA_SEED = "${vuna-seed}/bin/vuna-seed";
    };
    nativeBuildInputs = ocamlTools;
    script = ./seed-selfhost.sh;
  };
in
{
  # packages 同时暴露为 checks：`nix flake check` 会显式构建它们。
  inherit
    vuna
    vuna-seed
    vuna-compiler
    ;

  inherit seed-selfhost;

  vuna-tests = mkCheck {
    name = "vuna-tests";
    srcs = [
      ../../test
      ../../base
      ../../lib
      ../../compiler
      ../../app
      ../../vuna.toml
    ];
    env = {
      VUNA = "${vuna}/bin/vuna";
      VUNA_SEED = "${vuna-seed}/bin/vuna-seed";
    };
    nativeBuildInputs = ocamlTools;
    script = ./vuna-tests.sh;
  };

  vuna-package = mkCheck {
    name = "vuna-package";
    srcs = [
      ../../lib
      ../../compiler
      ../../base
      ../../app
      ../../examples
      ../../vuna.toml
    ];
    env = {
      VUNA = "${vuna}/bin/vuna";
      VUNA_COMPILER = "${vuna-compiler}/bin/vuna-compiler";
    };
    nativeBuildInputs = ocamlTools;
    script = ./vuna-package.sh;
  };

  vuna-metrics = mkCheck {
    name = "vuna-metrics";
    srcs = [
      ../../test/corpus/codegen
      ../../base
      ../../nix/metrics.sh
      ../../nix/codegen.baseline
    ];
    env = {
      VUNA = "${vuna}/bin/vuna";
    };
    script = ./vuna-metrics.sh;
  };

  vuna-typecheck = mkCheck {
    name = "vuna-typecheck";
    srcs = [
      ../../lib
      ../../compiler
      ../../base
      ../../app
      ../../vuna.toml
    ];
    env = {
      VUNA = "${vuna}/bin/vuna";
    };
    script = ./vuna-typecheck.sh;
  };

  vuna-lint = mkCheck {
    name = "vuna-lint";
    srcs = [
      ../../compiler
      ../../lib
      ../../base
      ../../app
    ];
    env = {
      VUNA = "${vuna}/bin/vuna";
    };
    script = ./vuna-lint.sh;
  };

  vuna-fmt = mkCheck {
    name = "vuna-fmt";
    srcs = [
      ../../compiler
      ../../base
      ../../lib
      ../../app
      ../../examples
      ../../vuna.toml
    ];
    env = {
      VUNA = "${vuna}/bin/vuna";
    };
    script = ./vuna-fmt.sh;
  };

  vuna-index = mkCheck {
    name = "vuna-index";
    srcs = [
      ../../compiler
      ../../base
      ../../lib
      ../../app
      ../../seed
      ../../vuna.toml
      ../../nix/index-check.sh
    ];
    env = {
      VUNA = "${vuna}/bin/vuna";
    };
    nativeBuildInputs = [
      pkgs.bash
      pkgs.coreutils
      pkgs.gnugrep
    ];
    script = ./vuna-index.sh;
  };

  context-budget = mkCheck {
    name = "vuna-context-budget";
    srcs = [
      ../../compiler
      ../../base
      ../../lib
      ../../app
      ../../docs
      ../../AGENTS.md
      ../../README.md
      ../../nix/context-budget.sh
      ../../nix/context.budget
    ];
    nativeBuildInputs = [
      pkgs.bash
      pkgs.coreutils
    ];
    script = ./context-budget.sh;
  };

  # M30：VSCode 扩展的离线自检。srcs 显式列出扩展的提交文件，避免把 dev 用
  # node_modules 带进 Nix store；只校验已构建的 dist/（重新构建见 vscode/README）。
  vscode-ext = mkCheck {
    name = "vuna-vscode-ext";
    srcs = [
      ../../vscode/package.json
      ../../vscode/package-lock.json
      ../../vscode/tsconfig.json
      ../../vscode/src
      ../../vscode/scripts
      ../../vscode/dist
      ../../vscode/syntaxes
      ../../vscode/language-configuration.json
      ../../vscode/snippets
      ../../vscode/README.md
      ../../vscode/LICENSE
      ../../vscode/.vscodeignore
      ../../vscode/check.sh
      ../../vscode/dev
    ];
    nativeBuildInputs = [
      pkgs.nodejs
      pkgs.bash
    ];
    script = ./vscode-ext.sh;
  };
}
