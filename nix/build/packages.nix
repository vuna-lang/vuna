# 自举链的构建产物与按需 / 开发用包装：
#   seed/ → vuna-seed（stage 0）→ vuna-compiler（stage 1）
#   → vuna-store（依赖包的接口预热）→ 每插件一个派生 → vuna（拷贝式安装）
#   每个插件派生只构建自己的包，改哪个插件只重建哪个派生；vuna-native = stage 1 把编译器
#   源码编到 native 的自举产物（后端 conformance 用）
#   vuna-web-cli / vuna-wasm-browser-smoke 按需构建；vuna-run-tests / vuna-bench /
#   vuna-perf / vuna-artifacts / backend-check / vuna-native-conformance 是开发用包装
#   （nix run .#vuna-run-tests / .#vuna-bench / .#vuna-perf / .#vuna-artifacts）。
{
  pkgs,
  ocamlTools,
  shellTools,
  e2eTools,
  version,
}:
let
  inherit (pkgs) lib;

  # CI 门禁分组与 PR gate 计划。
  groups = import ../checks/groups.nix;
  prGates = import ../checks/pr-gates.nix;

  # 安装时剥符号表：vuna 的运行时报错/回栈标签来自 `dt_def_locs`（`.data` 里的
  # 数据表）+ frametable（`-g` 编进去的 `.data`），不依赖 ELF 的 `.symtab` / `.debug_*`
  # ——剥离后的二进制作过回栈验证，仍打印 `名字 (文件:行)`。单个二进制小 ~25%。
  # 需要 gdb / DWARF 级调试时在源码树里自己重编（`-g` 仍在 build.sh 里）。
  stripBins = ''
    for f in "$out"/bin/*; do
      if [ -f "$f" ]; then
        chmod u+w "$f"
        ${pkgs.binutils}/bin/strip "$f"
      fi
    done
  '';

  # 所有 stage 产物共享的派生形状；build 脚本内容决定 drvPath，改动会改变
  # vuna-seed / vuna-compiler / vuna 的派生哈希。
  mkStage =
    {
      name,
      description,
      mainProgram,
      build,
    }:
    pkgs.runCommand name {
      nativeBuildInputs = ocamlTools ++ [ pkgs.binutils ];
      # 本仓库没有二进制缓存：不向 substituter 查询，避免离线构建被无意义地阻塞。
      allowSubstitutes = false;

      meta = {
        inherit description mainProgram;
        license = lib.licenses.mit;
      };
    } (build + stripBins);

  # 每个包的传递依赖闭包（用于源码输入过滤）。构建走目录入口（`build packages/<pkg>`），
  # 只认该目录的 manifest，不依赖 workspace 根。
  pkgDeps = {
    base = [ "base" ];
    obs = [
      "base"
      "obs"
    ];
    compiler-base = [
      "base"
      "compiler-base"
    ];
    ir = [
      "base"
      "compiler-base"
      "ir"
    ];
    target-ocaml = [
      "base"
      "compiler-base"
      "ir"
      "target-ocaml"
    ];
    compiler = [
      "base"
      "compiler-base"
      "ir"
      "target-ocaml"
      "compiler"
    ];
    plugin-kit = [
      "base"
      "plugin-kit"
    ];
    http = [
      "base"
      "http"
    ];
    web = [
      "base"
      "http"
      "web"
    ];
    web-cli = [
      "base"
      "http"
      "web"
      "compiler-base"
      "ir"
      "target-ocaml"
      "compiler"
      "web-cli"
    ];
    toolchain = [
      "base"
      "obs"
      "http"
      "plugin-kit"
      "compiler-base"
      "ir"
      "target-ocaml"
      "compiler"
      "toolchain"
    ];
    cli = [
      "base"
      "obs"
      "http"
      "plugin-kit"
      "compiler-base"
      "ir"
      "target-ocaml"
      "compiler"
      "cli"
    ];
    target-native = [
      "base"
      "obs"
      "compiler-base"
      "ir"
      "target-native"
    ];
    target-wasm = [
      "base"
      "obs"
      "compiler-base"
      "ir"
      "target-wasm"
    ];
    plugin-web = [
      "base"
      "http"
      "plugin-kit"
      "web"
      "compiler-base"
      "ir"
      "target-ocaml"
      "compiler"
      "web-cli"
      "plugin-web"
    ];
    dev = [
      "base"
      "obs"
      "http"
      "plugin-kit"
      "compiler-base"
      "ir"
      "target-ocaml"
      "compiler"
      "target-native"
      "toolchain"
      "dev"
    ];
  };

  # 预热 store 覆盖的包：所有「插件构建会当依赖读、但不作为插件单独构建」的库包。
  storeDeps = [
    "base"
    "obs"
    "compiler-base"
    "ir"
    "target-ocaml"
    "compiler"
    "plugin-kit"
    "http"
    "web"
    "web-cli"
  ];

  # 源码输入过滤：flake 的 `self` 是整棵树，`${../../packages/x}` 会让任何改动都失效。
  # 每个派生只拿「本包 + 传递依赖」的 lib / app / vuna.toml，各自得到独立的 store 路径：
  # 改一个包只失效引用它的派生（改 wasm 后端不再连带 stage1 与其它插件）。
  srcFor =
    name: deps:
    builtins.path {
      name = "vuna-src-${name}";
      path = ../..;
      filter =
        p: _type:
        let
          isRoot = toString p == toString ../..;
          rel = lib.removePrefix (toString ../.. + "/") (toString p);
          segs = if isRoot then [ ] else lib.splitString "/" rel;
          n = builtins.length segs;
        in
        if n == 0 then
          true
        else if n == 1 then
          lib.elem (lib.head segs) [ "packages" ]
        else if lib.head segs != "packages" then
          false
        else if n == 2 then
          lib.elem (lib.elemAt segs 1) deps
        else if n == 3 then
          lib.elem (lib.elemAt segs 2) [
            "lib"
            "app"
            "vuna.toml"
          ]
        else
          true;
    };

  # 单目录源码（seed / base / wasm-host / 运行时安装的包源码）：同样避免整棵树进输入。
  dirSrc = name: path: builtins.path { inherit name path; };

  baseSrc = dirSrc "vuna-base-src" ../../packages/base;
  obsSrc = dirSrc "vuna-obs-src" ../../packages/obs;
  httpSrc = dirSrc "vuna-http-src" ../../packages/http;
  webSrc = dirSrc "vuna-web-src" ../../packages/web;
  seedSrc = dirSrc "vuna-seed-src" ../../seed;
  wasmHostSrc = dirSrc "vuna-wasm-host-src" ../../wasm-host;

  # stage 0：提交入库的多文件信任锚点种子，用 seed/build.sh 构建。
  # base 与可执行文件按「可执行文件相对布局」安装（$out/base），无 manifest 的
  # 单文件由 vuna-seed 直接编译时能找到 base。
  vuna-seed = mkStage {
    name = "vuna-seed-${version}";
    description = "vuna seed compiler (stage 0, multi-file seed)";
    mainProgram = "vuna-seed";
    build = ''
      mkdir -p "$out/bin"
      cp -r ${seedSrc} seed
      cp -r ${baseSrc} "$out/base"
      chmod -R u+w seed
      cd seed
      sh build.sh "$out/bin/vuna-seed"
      sha256sum "$out/bin/vuna-seed" | cut -d' ' -f1 > "$out/cache-tag"
      # 编译器身份随产物安装（`Fingerprint` 读 `$out/build-id`）。
      if [ -f build-id ]; then cp build-id "$out/build-id"; fi
    '';
  };

  # stage 1 编译器：种子对 compiler 包做逐模块 codegen，用生成的 build.sh 构建。
  vuna-compiler = mkStage {
    name = "vuna-compiler-${version}";
    description = "vuna compiler (stage 1, split-compiled from compiler/)";
    mainProgram = "vuna-compiler";
    build = ''
      mkdir -p "$out/bin"
      cp -r ${srcFor "compiler" pkgDeps.compiler}/packages packages
      chmod -R u+w .
      # 接口影子写完后这个 store 不会再被读，接口计算与落盘是纯开销。
      export VUNA_IFACE_WRITE=0
      ${vuna-seed}/bin/vuna-seed build --no-compile --out stage1 packages/compiler
      sh stage1/build.sh "$out/bin/vuna-compiler"
      sha256sum "$out/bin/vuna-compiler" | cut -d' ' -f1 > "$out/cache-tag"
      cp -r packages/base "$out/base"
      if [ -f stage1/build-id ]; then cp stage1/build-id "$out/build-id"; fi
    '';
  };

  # 预热对象库：对「插件构建会当依赖读」的包逐个 check，写出接口 / 模块顺序 / 包身份。
  # 插件派生把这份 store 拷进自己的 $TMPDIR 再构建；没有预热时每个插件都会把同一份依赖
  # 闭包重新精化一遍（同机实测：toolchain 冷构建 71 s → 预热后 36 s）。对象按输入摘要
  # 寻址，跨派生复用不需要额外身份；缺对象只影响命中率。
  vuna-store =
    pkgs.runCommand "vuna-store-${version}"
      {
        nativeBuildInputs = ocamlTools;
        allowSubstitutes = false;
        meta.description = "vuna object store prewarm (interfaces for plugin builds)";
      }
      ''
        mkdir -p "$out"
        cp -r ${srcFor "store" storeDeps}/packages packages
        chmod -R u+w packages
        export VUNA_STORE="$out/store"
        # 依赖在前：后面的 check 读得到前面的接口与模块顺序。
        for pkg in ${lib.concatStringsSep " " storeDeps}; do
          ${vuna-compiler}/bin/vuna-compiler check "packages/$pkg"
        done
      '';

  # 单个插件派生：拷贝工作树 + 预热 store，只构建一个包，安装成 `$out/bin/<installAs>`。
  # `propagateStore` 把构建后的 store（预热 + 本包写的接口）留在 `$out/store`，供依赖它的
  # 插件派生复用（`extraStores`）。
  mkPlugin =
    {
      name,
      pkg,
      dir,
      deps,
      installAs ? pkg,
      description,
      store ? vuna-store,
      extraStores ? [ ],
      propagateStore ? false,
    }:
    mkStage {
      inherit name description;
      mainProgram = installAs;
      build = ''
        mkdir -p "$out/bin"
        cp -r ${srcFor pkg deps}/packages packages
        chmod -R u+w packages
        cp -a --reflink=auto ${store}/store "$TMPDIR/vuna-store"
        chmod -R u+w "$TMPDIR/vuna-store"
        ${lib.concatMapStringsSep "\n" (
          s: ''cp -a --reflink=auto --no-preserve=mode ${s}/store/. "$TMPDIR/vuna-store/"''
        ) extraStores}
        chmod -R u+w "$TMPDIR/vuna-store"
        export VUNA_STORE="$TMPDIR/vuna-store"
        ${vuna-compiler}/bin/vuna-compiler build "packages/${dir}" --out "$TMPDIR/vuna-out"
        cp "$TMPDIR/vuna-out/bin/${pkg}" "$out/bin/${installAs}"
        # 插件进程里的工具链读可执行文件旁的编译器身份：与 stage 1 对齐，否则它写出的
        # 接口/产物与编译器插件各命中一套 key。
        cp ${vuna-compiler}/cache-tag "$out/cache-tag"
        if [ -f ${vuna-compiler}/build-id ]; then cp ${vuna-compiler}/build-id "$out/build-id"; fi
        ${lib.optionalString propagateStore ''
          cp -a --reflink=auto "$TMPDIR/vuna-store" "$out/store"
        ''}
      '';
    };

  vuna-cli = mkPlugin {
    name = "vuna-cli-${version}";
    pkg = "vuna";
    dir = "cli";
    deps = pkgDeps.cli;
    installAs = "vuna";
    description = "vuna CLI entry (plugin discovery + routing)";
  };

  vuna-toolchain = mkPlugin {
    name = "vuna-toolchain-${version}";
    pkg = "vuna-toolchain";
    dir = "toolchain";
    deps = pkgDeps.toolchain;
    description = "vuna product toolchain plugin";
    propagateStore = true;
  };

  vuna-target-native = mkPlugin {
    name = "vuna-target-native-${version}";
    pkg = "vuna-target-native";
    dir = "target-native";
    deps = pkgDeps.target-native;
    description = "vuna native backend plugin";
    propagateStore = true;
  };

  vuna-target-wasm = mkPlugin {
    name = "vuna-target-wasm-${version}";
    pkg = "vuna-target-wasm";
    dir = "target-wasm";
    deps = pkgDeps.target-wasm;
    description = "vuna wasm backend plugin";
  };

  vuna-plugin-web = mkPlugin {
    name = "vuna-plugin-web-${version}";
    pkg = "vuna-plugin-web";
    dir = "plugin-web";
    deps = pkgDeps.plugin-web;
    installAs = "vuna-web";
    description = "vuna web application plugin";
  };

  vuna-dev = mkPlugin {
    name = "vuna-dev-${version}";
    pkg = "vuna-dev";
    dir = "dev";
    deps = pkgDeps.dev;
    description = "vuna repository-only dev plugin";
    extraStores = [
      vuna-toolchain
      vuna-target-native
    ];
  };

  # 产品安装：插件二进制 + base / wasm-host / 身份文件装进同一个 bin 目录。
  # 必须**拷贝**而不是符号链接：入口用可执行文件自身位置（/proc/self/exe）定位
  # `<exeDir>` 做插件发现，链接会让 exeDir 指回插件派生的 bin（那里只有它自己）。
  vuna =
    pkgs.runCommand "vuna-${version}"
      {
        allowSubstitutes = false;
        meta = {
          description = "vuna CLI (stage 1, plugins + compiler)";
          mainProgram = "vuna";
          license = lib.licenses.mit;
        };
      }
      ''
        mkdir -p "$out/bin" "$out/share/vuna"
        cp ${vuna-cli}/bin/vuna "$out/bin/vuna"
        cp ${vuna-toolchain}/bin/vuna-toolchain "$out/bin/vuna-toolchain"
        cp ${vuna-dev}/bin/vuna-dev "$out/bin/vuna-dev"
        cp ${vuna-target-native}/bin/vuna-target-native "$out/bin/vuna-target-native"
        cp ${vuna-target-wasm}/bin/vuna-target-wasm "$out/bin/vuna-target-wasm"
        cp ${vuna-plugin-web}/bin/vuna-web "$out/bin/vuna-web"
        cp ${vuna-compiler}/bin/vuna-compiler "$out/bin/vuna-compiler"
        cp ${vuna-compiler}/cache-tag "$out/cache-tag"
        cp -r ${baseSrc} "$out/base"
        # 应用面观测库是生态包：随产品安装源码，用户显式写路径依赖后使用。
        cp -r ${obsSrc} "$out/obs"
        # `vuna run --target wasm` 的执行宿主（Node/V8，`Vuna.Run.wasmRunner` 按此布局查找）。
        cp -r ${wasmHostSrc} "$out/share/vuna/wasm-host"
        if [ -f ${vuna-cli}/build-id ]; then cp ${vuna-cli}/build-id "$out/build-id"; fi
      '';

  # 手动性能基准与原生测试 runner；编译器在运行时解析，不在构建期绑定。
  vuna-bench =
    (pkgs.writeShellScriptBin "vuna-bench" ''
      export PATH="${lib.makeBinPath shellTools}:$PATH"
      exec ${pkgs.bash}/bin/bash ${../../bench/bootstrap.sh} "$@"
    '')
    // {
      meta.description = "手动 vuna 性能基准（构建/编译/产物尺寸）";
    };

  # 产物基线（bench/artifact.sh）：中间文本文件树 / 最终二进制 / 分段构建时间。
  vuna-artifacts =
    (pkgs.writeShellScriptBin "vuna-artifacts" ''
      export PATH="${lib.makeBinPath ([ vuna ] ++ e2eTools ++ shellTools ++ [ pkgs.stdenv.cc ])}:$PATH"
      exec ${pkgs.bash}/bin/bash ${../../bench/artifact.sh} "$@"
    '')
    // {
      meta.description = "三端产物基线（文本文件树 / 二进制大小 / 构建时间）";
    };

  # 生成程序运行时基准（bench/run.sh；vuna 用 nix 构建的产物）。
  vuna-perf =
    (pkgs.writeShellScriptBin "vuna-perf" ''
      export PATH="${
        lib.makeBinPath (
          [ vuna ]
          ++ shellTools
          ++ [
            pkgs.time
            pkgs.stdenv.cc
          ]
        )
      }:$PATH"
      exec ${pkgs.bash}/bin/bash ${../../bench/run.sh} "$@"
    '')
    // {
      meta.description = "生成程序与运行时性能基准（ocaml / native / wasm 产物 vs 手写 OCaml / 手写 C；wall / CPU / RSS 三口径）";
    };

  vuna-run-tests = import ./run-tests.nix {
    inherit
      pkgs
      vuna
      vuna-seed
      vuna-web-cli
      ;
    # 与 checks 的 e2e 同一份 PATH：wasm-tools/cc/node 都在。
    tools = e2eTools;
  };

  # vuna-web 的编排工具（生态层，不进 seed）：把应用包接到 Web.Main 上，
  # 复用同一个 stage 1 编译器构建产物；运行期需要 base / http / web 的源码做适配包依赖。
  vuna-web-cli = mkStage {
    name = "vuna-web-cli-${version}";
    description = "vuna-web full-stack build orchestrator (server artifacts)";
    mainProgram = "vuna-web-cli";
    build = ''
      mkdir -p "$out/bin"
      cp -r ${srcFor "web-cli" pkgDeps.web-cli}/packages packages
      chmod -R u+w packages
      export VUNA_STORE="$TMPDIR/vuna-store"
      ${vuna-compiler}/bin/vuna-compiler build packages/web-cli --out "$TMPDIR/webcli"
      cp "$TMPDIR/webcli/bin/vuna-web-cli" "$out/bin/vuna-web-cli"
      cp -r ${baseSrc} "$out/base"
      cp -r ${httpSrc} "$out/http"
      cp -r ${webSrc} "$out/web"
      if [ -f "$TMPDIR/webcli/build-id" ]; then cp "$TMPDIR/webcli/build-id" "$out/build-id"; fi
    '';
  };

  # 自举后端编译器：由 stage 1 编译器把自己的源码编到 native。
  # 它是开发 / CI 产物（不进 seed、不进 TCB），口径见 docs/reference/testing.md。
  #
  # 产物与产品 CLI 同构：`bin/` 里是自举出的 `vuna-native` 加上它编译非 OCaml 目标时
  # 需要的后端插件（`vuna-target-native` / `vuna-target-wasm`，插件按 `<exeDir>` 发现）；
  # `build-id` 是编译器源码闭包身份（沿用同源码 stage 1 的身份），`cache-tag` 是二进制摘要
  # （Loader.Fingerprint 分别读它们）。
  vuna-native = mkStage {
    name = "vuna-native-${version}";
    description = "vuna compiler built for x86-64 native (self-host checks)";
    mainProgram = "vuna-native";
    build = ''
      mkdir -p "$out/bin"
      cp -r ${
        srcFor "native" (pkgDeps.compiler ++ pkgDeps.target-native ++ pkgDeps.target-wasm)
      }/packages packages
      chmod -R u+w packages
      export VUNA_STORE="$TMPDIR/vuna-store"
      # 自举这一步的 codegen 量随编译器源码增长；插件缺省 300 s 超时会在慢机上误杀。
      # 构建时长由 Nix 的 build 超时兜底，这里不再叠一层插件超时。
      export VUNA_PLUGIN_TIMEOUT=0
      # 后端插件先用 stage 1 编译器建好：parity / corpus 用 `vuna-native` 编到
      # native 与 wasm，插件必须与它同目录（`<exeDir>` 优先于 `$VUNA_EXEC_PATH`）。
      ${vuna-compiler}/bin/vuna-compiler build packages/target-native --out "$TMPDIR/tnative"
      cp "$TMPDIR/tnative/bin/vuna-target-native" "$out/bin/vuna-target-native"
      ${vuna-compiler}/bin/vuna-compiler build packages/target-wasm --out "$TMPDIR/twasm"
      cp "$TMPDIR/twasm/bin/vuna-target-wasm" "$out/bin/vuna-target-wasm"
      # 自举这一步本身就经插件边界：把刚建好的插件目录交给 stage 1 编译器。
      export VUNA_EXEC_PATH="$out/bin"
      ${vuna-compiler}/bin/vuna-compiler build packages/compiler --target native --out "$TMPDIR/native"
      cp "$TMPDIR/native/bin/vuna-compiler" "$out/bin/vuna-native"
      # 身份分工与其它 stage 一致：`build-id` = 编译器源码闭包（与 stage 1 同一个
      # `packages/compiler` 闭包，目标后端不参与身份），`cache-tag` = 二进制摘要
      # （同一闭包由不同 seed 编出的二进制不共享缓存）。
      cp ${vuna-compiler}/build-id "$out/build-id"
      sha256sum "$out/bin/vuna-native" | cut -d' ' -f1 > "$out/cache-tag"
      cp -r packages/base "$out/base"
    '';
  };

  # 浏览器可跑面冒烟（e2e / 按需；**不进 `nix flake check`**）：Playwright 驱动
  # `pkgs.playwright-driver` 的 chromium（revision 与 `pkgs.playwright` 对齐），
  # 在构建里跑默认特性 validate + headless 实跑（`chromium.launch` + `page.evaluate`）。
  vuna-wasm-browser-smoke =
    pkgs.runCommand "vuna-wasm-browser-smoke"
      {
        nativeBuildInputs = [ vuna ] ++ e2eTools ++ [ pkgs.playwright-driver.browsers-chromium ];
        VUNA = "${vuna}/bin/vuna";
        VUNA_BASE = "${../../packages/base}";
        VUNA_PLAYWRIGHT = "${pkgs.playwright}";
        PLAYWRIGHT_BROWSERS_PATH = "${pkgs.playwright-driver.browsers-chromium}";
        allowSubstitutes = false;
        meta.description = "浏览器可跑面冒烟（默认特性 validate + Playwright chromium 实跑）";
      }
      ''
        cp -r ${../../.} repo
        cd repo
        chmod -R u+w .
        export VUNA_CHROMIUM="$(ls -d ${pkgs.playwright-driver.browsers-chromium}/chromium-*/chrome-linux64/chrome)"
        export TMPDIR="$PWD/.tmp"
        # 浏览器需要可写的 HOME/XDG：崩溃上报器（crashpad）没有 database 目录会 SIGTRAP。
        export HOME="$PWD/.home"
        export XDG_CONFIG_HOME="$HOME/.config"
        export XDG_CACHE_HOME="$HOME/.cache"
        export VUNA_STORE="$PWD/.store"
        mkdir -p "$TMPDIR" "$VUNA_STORE" "$XDG_CONFIG_HOME" "$XDG_CACHE_HOME"
        sh nix/checks/wasm-browser-smoke.sh "$PWD/out"
        touch "$out"
      '';

  # CI 门禁分组 runner：本地与 CI 共用 `nix run .#ci -- <group>`。
  # 组成员在构建期从 nix/checks/groups.nix 展开成 installable，运行时不再枚举 flake；
  # `--list` 打印每组包含的 installable。CI_TOKENS（默认 nproc）/ CI_JOBS（默认 2）
  # / CI_CORES 决定 nix build 的并行度。
  ci =
    let
      groupNames = builtins.attrNames groups;
      system = pkgs.stdenv.hostPlatform.system;
      attrOf =
        ref:
        let
          m = builtins.match "(check|package):(.*)" ref;
        in
        if m == null then
          throw "nix/checks/pr-gates.nix: 引用必须是 check:<name> 或 package:<name>：${ref}"
        else if builtins.head m == "check" then
          ".#checks.${system}.${builtins.elemAt m 1}"
        else
          ".#packages.${system}.${builtins.elemAt m 1}";
      attrsOf = g: lib.concatStringsSep " " (map attrOf groups.${g});
      groupCase = g: "    ${g}) attrs='${attrsOf g}' ;;";
      listCase = g: ''
        echo "${g}:"
        for a in ${attrsOf g}; do echo "  $a"; done'';
      prGatesJson = builtins.toJSON prGates;
      groupDefsJson = builtins.toJSON groups;
    in
    (pkgs.writeShellScriptBin "ci" ''
      set -eu
      export PATH="${
        lib.makeBinPath [
          pkgs.coreutils
          pkgs.jq
        ]
      }:$PATH"
      groups="${lib.concatStringsSep " " groupNames}"
      pr_gates_json='${prGatesJson}'
      group_defs_json='${groupDefsJson}'

      usage() {
        echo "usage: ci <group> [nix build args...]" >&2
        echo "groups: $groups" >&2
        echo "       ci --list" >&2
        echo "       ci --plan <type:... pkg:... area:...>" >&2
        echo "       ci --run-plan <type:... pkg:... area:...>" >&2
      }

      attr_of() {
        case "$1" in
          check:*) echo ".#checks.${system}.''${1#check:}" ;;
          package:*) echo ".#packages.${system}.''${1#package:}" ;;
          *) echo "ci: 未知引用 $1" >&2; exit 2 ;;
        esac
      }

      plan_refs() {
        if [ "$#" -eq 0 ]; then
          echo "ci: --plan/--run-plan 需要至少一个 type:/pkg:/area: 标签" >&2
          return 2
        fi
        jq -rn --argjson gates "$pr_gates_json" --argjson group_defs "$group_defs_json" --args '
          ($ARGS.positional) as $labels
          | ($labels | map(select(startswith("type:")) | .[5:])) as $types
          | ($labels | map(select(startswith("area:")) | .[5:])) as $area_labels
          | ($labels | map(select(startswith("pkg:")) | .[4:])) as $pkg_labels
          | (if ($types | length) == 0 then error("缺少 type:* 标签") else . end)
          | (if ($area_labels | length) > 0 then $area_labels
             elif ($pkg_labels | length) > 0 then ([$pkg_labels[] as $p | $gates.pkgs[$p] // empty] | add // [])
             else [$gates.fallback] end) as $areas0
          | (if ($areas0 | length) == 0 then [$gates.fallback] else $areas0 end) as $areas
          | ([$areas[] as $a | select($gates.areas[$a] == null) | $a]) as $bad_areas
          | if ($bad_areas | length) > 0 then error("未知 area: " + ($bad_areas | join(","))) else . end
          | ([$types[] as $t | select($gates.types[$t] == null) | $t]) as $bad_types
          | if ($bad_types | length) > 0 then error("未知 type: " + ($bad_types | join(","))) else . end
          | ([$types[] as $t | $gates.types[$t]] | add // []) as $type_refs
          | ([$areas[] as $a
              | (if ($types | index("perf")) != null
                 then ($gates.areas[$a].perf // $gates.areas[$a].default)
                 else $gates.areas[$a].default end)] | add // []) as $area_refs
          | ([$labels[] | select(. == "deep" or . == "suite" or . == "browser")] ) as $forced
          | ([$forced[] | $group_defs[.]] | add // []) as $forced_refs
          | ($area_refs + $type_refs + $forced_refs) | unique as $refs0
          # 完整 gate 在计划里时，area 切片被它覆盖，去掉重复构建。
          | (if ($refs0 | index("check:vuna-tests-gate")) != null
             then [$refs0[] as $r | select(($group_defs.slices | index($r)) == null) | $r]
             else $refs0 end) | .[]
        ' "$@"
      }

      plan() {
        echo "ci: plan labels=$*" >&2
        refs=$(plan_refs "$@")
        if [ -z "$refs" ]; then
          echo "(no extra checks)"
        else
          printf '%s\n' "$refs"
        fi
      }

      build() {
        group=$1
        attrs=$2
        shift 2
        TOKENS=''${CI_TOKENS:-$(getconf _NPROCESSORS_ONLN 2>/dev/null || nproc 2>/dev/null || echo 8)}
        case "$TOKENS" in ""|*[!0-9]*) TOKENS=8 ;; esac
        JOBS=''${CI_JOBS:-2}
        case "$JOBS" in ""|*[!0-9]*) JOBS=2 ;; esac
        [ "$JOBS" -ge 1 ] || JOBS=1
        [ "$JOBS" -le "$TOKENS" ] || JOBS=$TOKENS
        CORES=''${CI_CORES:-$((TOKENS / JOBS))}
        [ "$CORES" -ge 1 ] || CORES=1
        echo "ci: group=$group jobs=$JOBS cores=$CORES"
        # out-link 让本次产物成为 GC root：save 前 GC 只回收上一代遗留，不会把本次
        # 刚构建的路径当垃圾删掉（`--no-link` 的产物不是 root）。
        mkdir -p .ci
        exec env NIX_CONFIG='eval-cache = false
      log-lines = 5000' nix build --keep-going --max-jobs "$JOBS" --cores "$CORES" --out-link .ci/result $attrs "$@"
      }

      case "''${1:-}" in
        --list|-l)
          ${lib.concatMapStringsSep "\n" listCase groupNames}
          exit 0
          ;;
        --plan|plan)
          shift
          plan "$@"
          exit 0
          ;;
        --run-plan|run-plan)
          shift
          refs=$(plan_refs "$@")
          if [ -z "$refs" ]; then
            echo "ci: no extra checks"
            exit 0
          fi
          attrs=""
          for ref in $refs; do
            attrs="$attrs $(attr_of "$ref")"
          done
          echo "ci: selected checks:" >&2
          printf '%s\n' "$refs" | sed 's/^/  /' >&2
          build run-plan "$attrs"
          exit 0
          ;;
        "")
          usage
          exit 2
          ;;
      esac

      group=$1
      shift
      case " $groups " in
        *" $group "*) ;;
        *) echo "ci: 未知分组 $group" >&2; usage; exit 2 ;;
      esac
      case "$group" in
      ${lib.concatStringsSep "\n" (map groupCase groupNames)}
      esac
      build "$group" "$attrs" "$@"
    '')
    // {
      meta.description = "CI 门禁 runner（分组或 type/area gate 计划）";
    };

  # 跨编译器 conformance runner：在 native 自举编译器上跑 selfhost / parity / corpus。
  backend-check =
    (pkgs.writeShellScriptBin "backend-check" ''
      export PATH="${
        lib.makeBinPath (
          shellTools
          ++ e2eTools
          ++ [
            pkgs.bash
            pkgs.coreutils
            vuna-native
          ]
        )
      }:$PATH"
      export VUNA_ALT_NATIVE="${vuna-native}/bin/vuna-native"
      exec ${pkgs.bash}/bin/bash ${../../nix/tools/backend-check.sh} "$@"
    '')
    // {
      meta.description = "跨编译器 conformance（native 自举；CI 与本地按需）";
    };

  # native 自举 conformance 的 CI 派生：构建即运行 `backend-check --scope all`。
  # 放在 packages 而不是 checks：`nix flake check` 不跑它（整轮成本高），
  # `nix run .#ci -- native` 构建它。
  vuna-native-conformance =
    pkgs.runCommand "vuna-native-conformance"
      {
        nativeBuildInputs =
          shellTools
          ++ e2eTools
          ++ [
            pkgs.bash
            pkgs.coreutils
            vuna-native
          ];
        VUNA_ALT_NATIVE = "${vuna-native}/bin/vuna-native";
        # 编译器整体坏掉时跑完几百条夹具没有额外信息，20 条失败足以给出清单。
        VUNA_BACKEND_MAX_FAILS = "20";
        # 每成员一个编译器进程（峰值 5–6 GiB），runner 16 GiB 跑 2 路。
        VUNA_BACKEND_SELFHOST_JOBS = "2";
        allowSubstitutes = false;
        meta.description = "native 自举 conformance（selfhost + parity + corpus）";
      }
      ''
        cp -r ${../../.} repo
        cd repo
        chmod -R u+w .
        export TMPDIR="$PWD/.tmp"
        mkdir -p "$TMPDIR"
        bash nix/tools/backend-check.sh --compiler native --scope all --jobs 8
        touch "$out"
      '';
in
{
  default = vuna;

  inherit
    vuna
    vuna-store
    vuna-cli
    vuna-toolchain
    vuna-dev
    vuna-target-native
    vuna-target-wasm
    vuna-plugin-web
    vuna-seed
    vuna-compiler
    vuna-bench
    vuna-artifacts
    vuna-perf
    vuna-run-tests
    vuna-web-cli
    vuna-native
    vuna-wasm-browser-smoke
    backend-check
    vuna-native-conformance
    ci
    ;
}
