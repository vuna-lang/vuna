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
    vuna-web-cli
    ;

  repo = ../..;

  # PR 增量 suite 切片（area → 选择器）；area 词表以 pr-gates 的 area 名为准，
  # 注入给 suite runner 做 `audit/areas` 一致性检查。
  slices = import ./slices.nix;
  prGates = import ./pr-gates.nix;
  knownAreas = lib.concatStringsSep " " (builtins.attrNames prGates.areas);

  # 可复用的源集合；check 处只组合，不重复写路径。
  src = {
    seed = ../../seed;
    compiler = ../../packages/compiler;
    compilerBase = ../../packages/compiler-base;
    ir = ../../packages/ir;
    targetOcaml = ../../packages/target-ocaml;
    targetNative = ../../packages/target-native;
    targetWasm = ../../packages/target-wasm;
    pluginWeb = ../../packages/plugin-web;
    dev = ../../packages/dev;
    base = ../../packages/base;
    obs = ../../packages/obs;
    pluginKit = ../../packages/plugin-kit;
    toolchain = ../../packages/toolchain;
    cli = ../../packages/cli;
    http = ../../packages/http;
    web = ../../packages/web;
    webCli = ../../packages/web-cli;
    test = ../../test;
    examples = ../../examples;
    docs = ../../docs;
    corpus = ../../packages/compiler/test/corpus;
    corpusBase = ../../packages/base/test/corpus;
    corpusCli = ../../packages/cli/test/corpus;
    corpusWebCli = ../../packages/web-cli/test/corpus;
    codegenCorpus = ../../packages/compiler/test/corpus/codegen;
    stepsCli = ../../packages/cli/test/steps;
    stepsCompiler = ../../packages/compiler/test/steps;
    stepsWebCli = ../../packages/web-cli/test/steps;
    processBound = ../../test/suite/process-bound.txt;
    manifest = ../../vuna.toml;
    agents = ../../AGENTS.md;
    readme = ../../README.md;
    seedFiles = ../../nix/seed/files.txt;
    seedRotation = ../../nix/seed/rotation.txt;
  };

  workspace = [
    src.base
    src.obs
    src.compiler
    src.compilerBase
    src.ir
    src.targetOcaml
    src.targetNative
    src.targetWasm
    src.pluginWeb
    src.dev
    src.pluginKit
    src.toolchain
    src.cli
    src.http
    src.web
    src.webCli
    src.manifest
  ];

  testTree = workspace ++ [
    src.test
    src.examples
    # wasm 后端的执行宿主（跨后端 matrix 与 steps 通过 `$VUNA_SUITE_ROOT/wasm-host` 调用）。
    ../../wasm-host
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

  # PR 增量切片：按 area 组合选择器跑同一份 suite（`slices.nix`）。
  # `VUNA_SUITE_AREAS` 是 runner `audit/areas` 的词表（area 名 ⊆ pr-gates 的 area 名）。
  sliceCheck =
    name: spec:
    vunaCheck {
      name = "vuna-tests-${name}";
      srcs = testTree;
      env = {
        VUNA_SEED = "${vuna-seed}/bin/vuna-seed";
        VUNA_TEST_AREAS = lib.concatStringsSep " " spec.areas;
        VUNA_TEST_TIERS = lib.concatStringsSep " " spec.tiers;
        VUNA_TEST_MIN_CASES = toString spec.minCases;
        VUNA_TEST_UNIT_PKGS = lib.concatStringsSep " " spec.unitTests;
        VUNA_SUITE_AREAS = knownAreas;
      };
      nativeBuildInputs = e2eTools;
      script = ./vuna-tests.sh;
    };

  # seed → stage0 → stage1 → stage2，逐字节 fixed point（alias 已并入 seed-selfhost）。
  # rotation 按需：seed 落后于源码只报告滞后，不失败；元数据在 nix/seed/rotation.txt。
  seed-selfhost = mkCheck {
    name = "vuna-seed-selfhost";
    srcs = [
      src.seed
      src.compiler
      src.compilerBase
      src.ir
      src.targetOcaml
      src.targetNative
      src.targetWasm
      src.pluginWeb
      src.dev
      src.base
      src.obs
      src.cli
      src.pluginKit
      src.toolchain
      # 行为抽查在仓库根编译：根清单是 workspace，成员清单必须齐全。
      src.http
      src.web
      src.webCli
      src.manifest
      ../../packages/compiler/test/corpus/run/12_fact.vuna
      ../../packages/compiler/test/corpus/dt/01_id.vuna
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
  # CI 里两层各拆成 4 个 shard（matrix 并行）；本地 `nix run .#ci -- gate|suite` 跑未分片形态。
  vuna-tests-gate = vunaCheck {
    name = "vuna-tests-gate";
    srcs = testTree;
    env = {
      VUNA_SEED = "${vuna-seed}/bin/vuna-seed";
      VUNA_TEST_TIERS = "fast integration";
      VUNA_SUITE_AREAS = knownAreas;
      # 包内单测是独立 check，不挂在 gate 的尾巴上串行。
      VUNA_TEST_UNIT_PKGS = "";
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
      VUNA_SUITE_AREAS = knownAreas;
      VUNA_TEST_UNIT_PKGS = "";
      # 109_web_static 的 smoke 需要 web-cli 产物；`nix run .#vuna-run-tests` 已注入，
      # 派生环境必须同样提供，否则 step 拿到空路径。
      VUNA_WEB_CLI = "${vuna-web-cli}/bin/vuna-web-cli";
    };
    nativeBuildInputs = e2eTools;
    script = ./vuna-tests.sh;
  };

  # 包内单测：与 suite 解耦成独立 derivation（不随 shard 重复、不挂在 gate 尾部）。
  vuna-tests-units = vunaCheck {
    name = "vuna-tests-units";
    srcs = testTree;
    env = {
      VUNA_SEED = "${vuna-seed}/bin/vuna-seed";
    };
    nativeBuildInputs = e2eTools;
    script = ./vuna-units.sh;
  };

  # 后端矩阵：同一份 suite 在两个非默认目标上跑它声明允许的用例
  # （`matrix = pure-cross / effect-common / effect-wasm`，见 testing.md）。
  # ocaml 由 gate 覆盖；这里只跑 fast+integration，e2e/steps 仍由 ocaml 承担。
  # wasm 的执行宿主是 Node/V8（`wasm-host/run.mjs`），即「浏览器可跑面」的行为门禁；
  # allowlist 里的条目命中且失败按 `allow` 计（不算 skip，`--strict-skips` 不抓）。
  vuna-tests-wasm = vunaCheck {
    name = "vuna-tests-wasm";
    srcs = testTree;
    env = {
      VUNA_SEED = "${vuna-seed}/bin/vuna-seed";
      VUNA_TEST_TIERS = "fast integration";
      VUNA_SUITE_AREAS = knownAreas;
      VUNA_TEST_BACKENDS = "wasm";
      VUNA_TEST_ALLOW_FAIL = "test/suite/wasm-allow-fail.txt";
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
      VUNA_SUITE_AREAS = knownAreas;
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

  # native 平台面（syscall 号 / 宿主缓冲上限 / 内核路径）的结构基线：这张表长在
  # `Runtime.vuna` 里，摊平成基线后任何平台面变化都在 diff 里显形（见 native.md §2）。
  vuna-native-surface = mkCheck {
    name = "vuna-native-surface";
    srcs = [
      src.targetNative
      ../../nix/checks/data/native-surface.baseline
    ];
    nativeBuildInputs = [
      pkgs.gawk
      pkgs.gnugrep
    ];
    script = ./native-surface.sh;
  };

  # native 产物（`.s` 文件集）逐字节基线：`runtime.s` 与程序无关，覆盖全部运行时
  # 函数与 syscall 站点，是纯重构（平台表数据化、符号别名归一）的零行为变化判据。
  vuna-native-artifact = vunaCheck {
    name = "vuna-native-artifact";
    srcs = [
      src.base
      ../../nix/checks/data/native-artifact.sha
    ];
    script = ./native-artifact.sh;
  };

  # native codegen 的增长率门槛：右深标量链与多顶层闭包各 100/400/800 档，
  # 每档在硬上限内完成且相邻档墙钟 ≤6×+5s（挡这两类形状的指数级回溯）。
  vuna-native-codegen-growth = vunaCheck {
    name = "vuna-native-codegen-growth";
    srcs = [
      src.base
      src.manifest
    ];
    nativeBuildInputs = e2eTools;
    script = ./native-codegen-growth.sh;
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

  # 前端增长率门槛：合成 2000/4000/8000 个同形定义。`fmt --check` 的 CPU 时间按相邻档
  # ≤2.5×；trace 的 `vuna.parse.lex` / `vuna.parse.syntax` 聚合了整个 base 闭包的解析
  # （固定成本 + 16MB minor heap 的回收台阶），只断言 2000→8000 的 4x 窗口 ≤8×。
  # 与 compiler-growth 互补：那边看整条 check（前端只占几个百分点），这边直接看前端读数。
  vuna-frontend-growth = vunaCheck {
    name = "vuna-frontend-growth";
    srcs = [
      src.base
      src.manifest
    ];
    nativeBuildInputs = [ pkgs.gawk ];
    script = ./frontend-growth.sh;
  };

  # 名字收集对**长中缀链**的增长率门槛：重排后的左结合链是左嵌套
  # （`((a+b)+c)+…`），按层 `append (左子结果) …` 是 O(n²)。合成 `g = 1 + 1 + …`，
  # 按 N→2N 看 `vuna.resolve.warn`（来自 trace）；真实源码链短，别的探针看不见它。
  vuna-resolve-chain-growth = vunaCheck {
    name = "vuna-resolve-chain-growth";
    srcs = [
      src.base
      src.manifest
    ];
    script = ./resolve-chain-growth.sh;
  };

  # 容器增长率门槛：HashMap / Queue / TreeMap / PriorityQueue / Sort 的合成探针，
  # 按 N→2N 只测**运行 CPU**（借 ocamlopt 出产物，不测编译）。挡「O(1)/O(log n)
  # 退化成线性/二次」（size 退回 O(n)、队列用 append、平衡树丢平衡、排序退回插入）。
  vuna-container-growth = vunaCheck {
    name = "vuna-container-growth";
    srcs = [
      src.base
      src.manifest
    ];
    script = ./container-growth.sh;
    nativeBuildInputs = e2eTools ++ [ pkgs.gawk ];
  };

  # 效应机器的**深度**增长率门槛：frames（嵌套 handler 帧 + 非尾 resume，OCaml，
  # 100k/200k/400k，相邻档 ≤3.0×）与 answer-row（handler 的答案再派发，native，
  # N=40000 单档 10s 上限）。只测运行墙钟（编译不计），挡 msUsed / 帧链一类按深度退化的
  # 形状（小尺寸版本是 effect/perf/51_eff_nested）。
  vuna-effect-machine-growth = vunaCheck {
    name = "vuna-effect-machine-growth";
    srcs = [
      src.base
      src.manifest
    ];
    script = ./effect-machine-growth.sh;
    nativeBuildInputs = e2eTools;
  };

  vuna-typecheck = vunaCheck {
    name = "vuna-typecheck";
    srcs = workspace;
    script = ./vuna-typecheck.sh;
  };

  # 带导出面的包必须一遍精化写全包接口（否则 check 静默跑两遍，依赖方回退全量）。
  vuna-single-pass = vunaCheck {
    name = "vuna-single-pass";
    srcs = [
      src.compiler
      src.compilerBase
      src.ir
      src.targetOcaml
      src.targetNative
      src.targetWasm
      src.pluginWeb
      src.dev
      src.base
      src.obs
      src.pluginKit
      src.toolchain
      src.http
      src.manifest
    ];
    script = ./vuna-single-pass.sh;
  };

  # 接口载荷必须能重算出记录里的 iface 哈希（写侧自证；漂移会让增量复用错接口）。
  vuna-iface-selftest = vunaCheck {
    name = "vuna-iface-selftest";
    srcs = [
      src.compiler
      src.compilerBase
      src.ir
      src.targetOcaml
      src.targetNative
      src.targetWasm
      src.pluginWeb
      src.dev
      src.base
      src.obs
      src.pluginKit
      src.toolchain
      src.http
      src.manifest
    ];
    script = ./vuna-iface-selftest.sh;
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
      src.corpusBase
      src.corpusCli
      src.corpusWebCli
      src.stepsCli
      src.stepsCompiler
      src.stepsWebCli
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
      src.compilerBase
      src.ir
      src.targetOcaml
      src.targetNative
      src.targetWasm
      src.pluginWeb
      src.dev
      src.cli
      src.base
      src.pluginKit
      src.toolchain
      src.webCli
      src.stepsCli
      src.stepsCompiler
      src.stepsWebCli
      src.processBound
      ../../test/suite.toml
      ../../packages/compiler/test/suite.toml
      ../../packages/base/test/suite.toml
      ../../packages/cli/test/suite.toml
      ../../packages/web-cli/test/suite.toml
      ./lib
      ../../nix/checks/data/eff-boundary.allowlist
      ../../nix/checks/data/steps-inproc.max
      ../../nix/checks/data/store-domains.txt
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
      src.compilerBase
      src.ir
      src.targetOcaml
      src.targetNative
      src.targetWasm
      src.pluginWeb
      src.dev
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
      src.obs
    ];
    env = {
      VUNA_BASE = "${repo}/packages/base";
      VUNA_OBS_PKG = "${repo}/packages/obs";
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
// lib.mapAttrs' (name: spec: lib.nameValuePair "vuna-tests-${name}" (sliceCheck name spec)) slices
# CI 分片：每个 shard 是独立 derivation，job 之间并行；`--shard i/N` 在 runner 内按耗时
# 把选中 case 均分成 N 份，每份仍跑完整 case 集合的一部分（不是采样）。分片数量与
# 每片下限同 `nix/checks/vuna-tests.sh` 的 `VUNA_TEST_SHARD` / `VUNA_TEST_MIN_CASES`。
// builtins.listToAttrs (
  map (
    i:
    lib.nameValuePair "vuna-tests-gate-shard-${toString i}" (vunaCheck {
      name = "vuna-tests-gate-shard-${toString i}";
      srcs = testTree;
      env = {
        VUNA_SEED = "${vuna-seed}/bin/vuna-seed";
        VUNA_TEST_TIERS = "fast integration";
        VUNA_SUITE_AREAS = knownAreas;
        VUNA_TEST_SHARD = "${toString i}/4";
        VUNA_TEST_MIN_CASES = "150";
        VUNA_TEST_UNIT_PKGS = "";
      };
      nativeBuildInputs = e2eTools;
      script = ./vuna-tests.sh;
    })
  ) (lib.range 0 3)
)
// builtins.listToAttrs (
  map (
    i:
    lib.nameValuePair "vuna-tests-e2e-shard-${toString i}" (vunaCheck {
      name = "vuna-tests-e2e-shard-${toString i}";
      srcs = testTree;
      env = {
        VUNA_SEED = "${vuna-seed}/bin/vuna-seed";
        VUNA_TEST_TIERS = "e2e";
        VUNA_SUITE_AREAS = knownAreas;
        VUNA_TEST_SHARD = "${toString i}/4";
        VUNA_TEST_MIN_CASES = "12";
        VUNA_TEST_UNIT_PKGS = "";
        VUNA_WEB_CLI = "${vuna-web-cli}/bin/vuna-web-cli";
      };
      nativeBuildInputs = e2eTools;
      script = ./vuna-tests.sh;
    })
  ) (lib.range 0 3)
)
