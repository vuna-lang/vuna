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
  # rotation 按需：seed 落后于源码只报告滞后，不失败；元数据在 nix/seed-rotation.txt。
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
      ../../nix/tcb-allowlist.sh
      ../../nix/tcb-forbidden.txt
      ../../nix/seed-count.txt
      ../../nix/seed-files.txt
      ../../nix/seed-rotation.txt
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
      # steps 用例直接跑仓库的 examples（如 64_infra 跑 examples/infra）。
      ../../examples
      ../../vuna.toml
    ];
    env = {
      VUNA = "${vuna}/bin/vuna";
      VUNA_SEED = "${vuna-seed}/bin/vuna-seed";
    };
    nativeBuildInputs = ocamlTools ++ [ pkgs.util-linux pkgs.git ];
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

  # M34.6：elab 缓存有效性（冷/热 `check .` 比例断言；缓存退化即失败）。
  vuna-compiler-perf = mkCheck {
    name = "vuna-compiler-perf";
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
    script = ./compiler-perf.sh;
  };

  # M34.6：编译器增长率门槛（合成 N 个同形定义，相邻档墙钟比有上界）。
  # 绝对时间不可跨机器比；增长率可比，用来挡「某次改动把线性路径退化成 n²」。
  vuna-compiler-growth = mkCheck {
    name = "vuna-compiler-growth";
    srcs = [
      ../../base
      ../../nix/checks/compiler-growth.sh
      ../../vuna.toml
    ];
    env = {
      VUNA = "${vuna}/bin/vuna";
    };
    nativeBuildInputs = [
      pkgs.bash
      pkgs.coreutils
    ];
    script = ./compiler-growth.sh;
  };

  # 包路径**增量** check 的增长率门槛：单文件探针走全量精化，覆盖不到包级增量收尾
  # （globals 去重 / 写接口 / 终止性 own 判定）的 O(n²) 回归。
  vuna-compiler-growth-incremental = mkCheck {
    name = "vuna-compiler-growth-incremental";
    srcs = [
      ../../base
      ../../nix/checks/compiler-growth-pkg.sh
      ../../vuna.toml
    ];
    env = {
      VUNA = "${vuna}/bin/vuna";
    };
    nativeBuildInputs = [
      pkgs.bash
      pkgs.coreutils
    ];
    script = ./compiler-growth-pkg.sh;
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
      ../../vuna.toml
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
  # 诊断码覆盖门禁：每个目录码至少有结构化夹具（或显式 allowlist）；覆盖数不低于基线。
  diag-coverage = mkCheck {
    name = "vuna-diag-coverage";
    srcs = [
      ../../test/corpus
      ../../nix/checks/diag-coverage.sh
      ../../nix/diag-coverage-allow.txt
      ../../nix/diag-coverage.min
      ../../nix/diag-unreachable.txt
    ];
    env = {
      VUNA = "${vuna}/bin/vuna";
    };
    nativeBuildInputs = [
      pkgs.bash
      pkgs.coreutils
      pkgs.gnugrep
    ];
    script = ./diag-coverage.sh;
  };


  # 诊断文案规范门禁（D7.9）：消息模板风格统一（句号/大小写/空白/占位符）。
  diag-style = mkCheck {
    name = "vuna-diag-style";
    srcs = [
      ../../nix/checks/diag-style.sh
      ../../nix/diag-style-allow.txt
    ];
    env = {
      VUNA = "${vuna}/bin/vuna";
    };
    nativeBuildInputs = [
      pkgs.bash
      pkgs.coreutils
      pkgs.gnugrep
    ];
    script = ./diag-style.sh;
  };

  # 隐藏效果守卫：`runPure` 调用点只降不增（基线 nix/eff-boundary.allowlist，当前为空）。
  eff-boundary = mkCheck {
    name = "vuna-eff-boundary";
    srcs = [
      ../../compiler/lib
      ../../lib
      ../../nix/check-eff-boundary.sh
      ../../nix/eff-boundary.allowlist
    ];
    nativeBuildInputs = [
      pkgs.bash
      pkgs.coreutils
      pkgs.gnugrep
    ];
    script = ../../nix/check-eff-boundary.sh;
  };

  # 诊断门禁：compiler 内源码诊断必须走域码（TC_/CG_/RN_/LD_/IC_...）；位置渲染只在
  # Diag.Format/Source。工具/构建/清单错误（exit 2）是显式白名单。
  diag-raw = mkCheck {
    name = "vuna-diag-raw";
    srcs = [
      ../../compiler
      ../../lib
      ../../nix/checks/diag-raw.sh
    ];
    nativeBuildInputs = [
      pkgs.bash
      pkgs.coreutils
    ];
    script = ./diag-raw.sh;
  };
}
