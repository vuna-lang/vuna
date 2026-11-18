# CI 门槛定义。源集合按目录命名后组合，mkCheck 用 fileset 暂存成最小工作树，
# 然后执行 nix/checks/<name>.sh（主体脚本），并由 Nix 注入工具路径。
#
# 约定：脚本以 cwd = 仓库根布局运行，$1 是输出目录；需要 vuna 二进制的 check 用
# vunaCheck（默认注入 $VUNA），纯静态扫描用 mkCheck。
{
  pkgs,
  packages,
  ocamlTools,
  e2eTools,
}:
let
  inherit (pkgs) lib;

  inherit (packages)
    vuna
    vuna-seed
    vuna-compiler
    ;

  repo = ../..;

  # 可复用的源集合；check 处只组合，不重复写路径。
  src = {
    seed = ../../seed;
    compiler = ../../packages/compiler;
    base = ../../packages/base;
    cli = ../../packages/cli;
    http = ../../packages/http;
    test = ../../test;
    examples = ../../examples;
    docs = ../../docs;
    corpus = ../../test/corpus;
    codegenCorpus = ../../test/corpus/codegen;
    steps = ../../test/suite/steps;
    processBound = ../../test/suite/process-bound.txt;
    manifest = ../../vuna.toml;
    agents = ../../AGENTS.md;
    readme = ../../README.md;
    seedFiles = ../../nix/seed/files.txt;
    seedRotation = ../../nix/seed/rotation.txt;
  };

  workspace = [
    src.base
    src.compiler
    src.cli
    src.http
    src.manifest
  ];

  testTree = workspace ++ [
    src.test
    src.examples
    # 83_vscode_grammar 的 keyword/soft-keyword 同源对拍需要这两份源文件
    # （steps 的 cwd 是 test/，路径走 $VUNA_SUITE_ROOT）。
    ../../vscode/scripts
    ../../vscode/syntaxes
  ];

  vscodeSrcs = [
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

  # 需要 vuna 二进制的 check：默认注入 $VUNA，其余环境按需追加。
  vunaCheck =
    {
      name,
      srcs,
      script,
      env ? { },
      nativeBuildInputs ? [ ],
    }:
    mkCheck {
      inherit
        name
        srcs
        script
        nativeBuildInputs
        ;
      env = {
        VUNA = "${vuna}/bin/vuna";
      }
      // env;
    };

  # seed → stage0 → stage1 → stage2，逐字节 fixed point（alias 已并入 seed-selfhost）。
  # rotation 按需：seed 落后于源码只报告滞后，不失败；元数据在 nix/seed/rotation.txt。
  seed-selfhost = mkCheck {
    name = "vuna-seed-selfhost";
    srcs = [
      src.seed
      src.compiler
      src.base
      src.cli
      src.manifest
      ../../test/corpus/run/12_fact.vuna
      ../../test/corpus/dt/01_id.vuna
      ../../nix/seed/tcb-check.sh
      ../../nix/seed/tcb-allowlist.sh
      ../../nix/seed/forbidden.txt
      src.seedFiles
      src.seedRotation
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

  # 测试分两层：gate 只跑 fast+integration，e2e（steps/长 case）单独一个 derivation。
  # 两层可并行（CI 用 --max-jobs 2 --cores 8），每层内部仍共享一个私有对象库。
  vuna-tests-gate = vunaCheck {
    name = "vuna-tests-gate";
    srcs = testTree;
    env = {
      VUNA_SEED = "${vuna-seed}/bin/vuna-seed";
      VUNA_TEST_TIERS = "fast integration";
    };
    nativeBuildInputs = e2eTools;
    script = ./vuna-tests.sh;
  };

  vuna-tests-e2e = vunaCheck {
    name = "vuna-tests-e2e";
    srcs = testTree;
    env = {
      VUNA_SEED = "${vuna-seed}/bin/vuna-seed";
      VUNA_TEST_TIERS = "e2e";
    };
    nativeBuildInputs = e2eTools;
    script = ./vuna-tests.sh;
  };

  # 后端矩阵：同一份 suite 在两个非默认目标上跑它声明允许的用例
  # （`matrix = pure-cross / effect-common / effect-wasm`，见 testing.md）。
  # ocaml 由 gate 覆盖；这里只跑 fast+integration，e2e/steps 仍由 ocaml 承担。
  vuna-tests-wasm = vunaCheck {
    name = "vuna-tests-wasm";
    srcs = testTree;
    env = {
      VUNA_SEED = "${vuna-seed}/bin/vuna-seed";
      VUNA_TEST_TIERS = "fast integration";
      VUNA_TEST_BACKENDS = "wasm";
    };
    nativeBuildInputs = e2eTools;
    script = ./vuna-tests.sh;
  };

  # JS 宿主（V8）跑 wasm 后端矩阵：浏览器可跑面的行为门禁。
  # 参考通道独有用例（用户自定义 handler）在 allowlist 里按 skip 计。
  vuna-tests-wasm-js = vunaCheck {
    name = "vuna-tests-wasm-js";
    srcs = testTree;
    env = {
      VUNA_SEED = "${vuna-seed}/bin/vuna-seed";
      VUNA_TEST_TIERS = "fast integration";
      VUNA_TEST_BACKENDS = "wasm";
      VUNA_WASM_HOST = "js";
      VUNA_TEST_ALLOW_FAIL = "test/suite/wasm-js-allow-fail.txt";
    };
    nativeBuildInputs = e2eTools;
    script = ./vuna-tests.sh;
  };

  # 浏览器可跑面：默认特性 validate 是硬门。Chromium 冒烟故意**不进** derivation：
  # `pkgs.chromium` 的闭包约 336 个路径 / 1.8 GB（命中 cache.nixos.org，但会进入每个
  # check 的输入闭包与构建期沙箱），普通 check 不背这个体积。
  # 需要跑浏览器冒烟时按 testing.md 里的命令显式给 `VUNA_CHROMIUM`（本地/夜间）。
  vuna-wasm-browser = mkCheck {
    name = "vuna-wasm-browser";
    srcs = testTree;
    env = {
      VUNA = "${vuna}/bin/vuna";
    };
    nativeBuildInputs = e2eTools;
    script = ./wasm-browser-smoke.sh;
  };

  vuna-tests-native = vunaCheck {
    name = "vuna-tests-native";
    srcs = testTree;
    env = {
      VUNA_SEED = "${vuna-seed}/bin/vuna-seed";
      VUNA_TEST_TIERS = "fast integration";
      VUNA_TEST_BACKENDS = "native";
    };
    nativeBuildInputs = e2eTools;
    script = ./vuna-tests.sh;
  };

  vuna-metrics = vunaCheck {
    name = "vuna-metrics";
    srcs = [
      src.codegenCorpus
      src.base
      ../../nix/tools/metrics.sh
      ../../nix/checks/data/codegen.baseline
    ];
    script = ./vuna-metrics.sh;
  };

  # 编译器增长率门槛（合成 N 个同形定义，相邻档墙钟比有上界）。
  # 绝对时间不可跨机器比；增长率可比，用来挡「某次改动把线性路径退化成 n²」。
  vuna-compiler-growth = vunaCheck {
    name = "vuna-compiler-growth";
    srcs = [
      src.base
      src.manifest
    ];
    script = ./compiler-growth.sh;
  };

  # 构造子密集 + 反向依赖探针：挡「构造子/类型参数表按名字线性查」与组间定序退化。
  vuna-compiler-growth-ctor = vunaCheck {
    name = "vuna-compiler-growth-ctor";
    srcs = [
      src.base
      src.manifest
    ];
    script = ./compiler-growth-ctor.sh;
  };

  # 包路径**增量** check 的增长率门槛：单文件探针走全量精化，覆盖不到包级增量收尾
  # （globals 去重 / 写接口 / 终止性 own 判定）的 O(n²) 回归。
  vuna-compiler-growth-incremental = vunaCheck {
    name = "vuna-compiler-growth-incremental";
    srcs = [
      src.base
      src.manifest
    ];
    script = ./compiler-growth-pkg.sh;
  };

  # 前端增长率门槛：合成 2000/4000/8000 个同形定义，相邻档的
  # `vuna.parse.lex` / `vuna.parse.syntax`（来自 trace）与 `fmt --check` 墙钟比有上界。
  # 与 compiler-growth 互补：那边看整条 check（前端只占几个百分点），这边直接看前端读数。
  vuna-frontend-growth = vunaCheck {
    name = "vuna-frontend-growth";
    srcs = [
      src.base
      src.manifest
    ];
    script = ./frontend-growth.sh;
  };

  vuna-typecheck = vunaCheck {
    name = "vuna-typecheck";
    srcs = workspace;
    script = ./vuna-typecheck.sh;
  };

  vuna-lint = vunaCheck {
    name = "vuna-lint";
    srcs = workspace;
    script = ./vuna-lint.sh;
  };

  vuna-fmt = vunaCheck {
    name = "vuna-fmt";
    srcs = workspace ++ [ src.examples ];
    script = ./vuna-fmt.sh;
  };

  context-budget = mkCheck {
    name = "vuna-context-budget";
    srcs = workspace ++ [
      src.docs
      src.agents
      src.readme
      ../../nix/tools/context-budget.sh
      ../../nix/checks/data/context.budget
    ];
    script = ./context-budget.sh;
  };

  # VSCode 扩展的离线自检。srcs 显式列出扩展的提交文件，避免把 dev 用
  # node_modules 带进 Nix store；只校验已构建的 dist/（重新构建见 vscode/README）。
  vscode-ext = mkCheck {
    name = "vuna-vscode-ext";
    srcs = vscodeSrcs;
    nativeBuildInputs = [ pkgs.nodejs ];
    script = ./vscode-ext.sh;
  };

  # 诊断策略三件套（码覆盖 / 位置 / 文案）；实现见 nix/checks/lib/。
  vuna-diag = vunaCheck {
    name = "vuna-diag";
    srcs = [
      src.corpus
      src.steps
      ./lib
      ../../nix/checks/data/diag-coverage-allow.txt
      ../../nix/checks/data/diag-coverage.min
      ../../nix/checks/data/diag-unreachable.txt
      ../../nix/checks/data/diag-located.allow
      ../../nix/checks/data/diag-style-allow.txt
    ];
    nativeBuildInputs = [
      pkgs.findutils
      pkgs.gnugrep
      pkgs.jq
    ];
    script = ./diag.sh;
  };

  # 静态结构守卫（诊断码 / IR 边界 / 进程绑定岛 / 隐藏效果）；实现见 nix/checks/lib/。
  vuna-static = mkCheck {
    name = "vuna-static";
    srcs = [
      src.compiler
      src.cli
      src.steps
      src.processBound
      ./lib
      ../../nix/checks/data/eff-boundary.allowlist
      ../../nix/checks/data/steps-inproc.max
    ];
    nativeBuildInputs = [
      pkgs.gnugrep
      pkgs.gnused
    ];
    script = ./static.sh;
  };

  # 可观测性结构门禁（`docs/reference/observability.md` §9）：关闭不产 trace；`VUNA_OBS=2`
  # 的 check 产出可被 `vuna dev obs validate` 接受的 trace；`summarize --json` 单行且结构化；
  # 编译器自观测必须仍产出 `vuna.elab` / `vuna.codegen.check` 两个阶段跨度。
  vuna-obs-schema = vunaCheck {
    name = "vuna-obs-schema";
    srcs = [
      src.compiler
      src.base
    ];
    nativeBuildInputs = [
      pkgs.findutils
      pkgs.gnugrep
    ];
    script = ./vuna-obs-schema.sh;
  };

  # `#line` 注入门禁（规范 §5）：split 产物的指令是包相对 `.vuna` 路径，且 `-g` 编出的
  # 可执行文件在 DWARF `.debug_line` 里真的指向 `.vuna`（不需要 gdb/perf）。
  vuna-obs-dwarf = vunaCheck {
    name = "vuna-obs-dwarf";
    srcs = [ src.codegenCorpus ];
    env = {
      VUNA_BASE = "${repo}/packages/base";
    };
    nativeBuildInputs = ocamlTools ++ [
      pkgs.binutils
      pkgs.findutils
      pkgs.gnugrep
    ];
    script = ./vuna-obs-dwarf.sh;
  };

  # 关闭口径门禁（规范 §6）：`VUNA_OBS=0` 与不设观测的产物逐字节一致、关闭时不写 trace
  # 文件、生成运行时的 obs 入口都以关闭快速路径开头（不在关闭路径读时钟/分配）。
  vuna-obs-overhead = vunaCheck {
    name = "vuna-obs-overhead";
    srcs = [
      src.codegenCorpus
      src.base
    ];
    env = {
      VUNA_BASE = "${repo}/packages/base";
    };
    nativeBuildInputs = ocamlTools ++ [
      pkgs.findutils
      pkgs.gnugrep
    ];
    script = ./vuna-obs-overhead.sh;
  };

  # flake.nix 与 nix/ 的 Nix 文件必须与 nixfmt 输出一致。
  vuna-nix-fmt = mkCheck {
    name = "vuna-nix-fmt";
    srcs = [
      ../../flake.nix
      ../../nix
    ];
    nativeBuildInputs = [ pkgs.nixfmt ];
    script = ./nix-fmt.sh;
  };

  # 顶层 nix/checks/*.sh 与 default.nix 的登记必须一一对应，防止 orphan 脚本。
  vuna-checks-inventory = mkCheck {
    name = "vuna-checks-inventory";
    srcs = [ ./. ];
    nativeBuildInputs = [ pkgs.gnugrep ];
    script = ./inventory.sh;
  };
}
