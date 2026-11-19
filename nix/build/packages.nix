# 自举链的三级构建产物与两个开发 runner：
#   seed/ → vuna-seed（stage 0）→ vuna-compiler（stage 1）→ vuna（产品 CLI）
#   vuna-run-tests / vuna-bench / vuna-perf / vuna-artifacts 是开发用包装
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
      nativeBuildInputs = ocamlTools;
      # 本仓库没有二进制缓存：不向 substituter 查询，避免离线构建被无意义地阻塞。
      allowSubstitutes = false;

      meta = {
        inherit description mainProgram;
        license = lib.licenses.mit;
      };
    } build;

  # stage 0：提交入库的多文件信任锚点种子，用 seed/build.sh 构建。
  # base 与可执行文件按「可执行文件相对布局」安装（$out/base），无 manifest 的
  # 单文件由 vuna-seed 直接编译时能找到 base。
  vuna-seed = mkStage {
    name = "vuna-seed-${version}";
    description = "vuna seed compiler (stage 0, multi-file seed)";
    mainProgram = "vuna-seed";
    build = ''
      mkdir -p "$out/bin"
      cp -r ${../../seed} seed
      cp -r ${../../packages/base} "$out/base"
      chmod -R u+w seed
      cd seed
      sh build.sh "$out/bin/vuna-seed"
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
      mkdir -p "$out/bin" packages
      cp -r ${../../packages/compiler} packages/compiler
      cp -r ${../../packages/compiler-base} packages/compiler-base
      cp -r ${../../packages/ir} packages/ir
      cp -r ${../../packages/target-ocaml} packages/target-ocaml
      cp -r ${../../packages/target-native} packages/target-native
      cp -r ${../../packages/target-wasm} packages/target-wasm
      cp -r ${../../packages/base} packages/base
      chmod -R u+w .
      ${vuna-seed}/bin/vuna-seed build --no-compile --out stage1 packages/compiler
      sh stage1/build.sh "$out/bin/vuna-compiler"
      cp -r packages/base "$out/base"
      if [ -f stage1/build-id ]; then cp stage1/build-id "$out/build-id"; fi
    '';
  };

  # 产品 CLI：由 stage 1 编译器构建 cli 包（compiler + 工具链）。
  vuna = mkStage {
    name = "vuna-${version}";
    description = "vuna CLI (stage 1, tools + compiler library)";
    mainProgram = "vuna";
    build = ''
      mkdir -p "$out/bin"
      cp -r ${../../packages} packages
      cp ${../../vuna.toml} vuna.toml
      chmod -R u+w .
      export VUNA_STORE="$TMPDIR/vuna-store"
      ${vuna-compiler}/bin/vuna-compiler build --package vuna .
      cp packages/cli/.output/bin/vuna "$out/bin/vuna"
      ${vuna-compiler}/bin/vuna-compiler build --package vuna-toolchain .
      cp packages/toolchain/.output/bin/vuna-toolchain "$out/bin/vuna-toolchain"
      ${vuna-compiler}/bin/vuna-compiler build --package vuna-target-native .
      cp packages/target-native/.output/bin/vuna-target-native "$out/bin/vuna-target-native"
      ${vuna-compiler}/bin/vuna-compiler build --package vuna-target-wasm .
      cp packages/target-wasm/.output/bin/vuna-target-wasm "$out/bin/vuna-target-wasm"
      ${vuna-compiler}/bin/vuna-compiler build --package vuna-plugin-web .
      cp packages/plugin-web/.output/bin/vuna-plugin-web "$out/bin/vuna-web"
      # 编译器命令走独立插件（同一个 stage-1 产物，安装名即插件名）。
      cp ${vuna-compiler}/bin/vuna-compiler "$out/bin/vuna-compiler"
      cp -r packages/base "$out/base"
      # `vuna run --target wasm` 的执行宿主（Node/V8，`Vuna.Run.wasmRunner` 按此布局查找）。
      mkdir -p "$out/share/vuna"
      cp -r ${../../wasm-host} "$out/share/vuna/wasm-host"
      if [ -f packages/cli/.output/build-id ]; then cp packages/cli/.output/build-id "$out/build-id"; fi
    '';
  };

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
      meta.description = "生成程序与运行时性能基准（ocaml / native 产物 vs 手写 OCaml）";
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
      cp -r ${../../packages} packages
      cp ${../../vuna.toml} vuna.toml
      chmod -R u+w .
      export VUNA_STORE="$TMPDIR/vuna-store"
      ${vuna-compiler}/bin/vuna-compiler build --package vuna-web-cli .
      cp packages/web-cli/.output/bin/vuna-web-cli "$out/bin/vuna-web-cli"
      cp -r packages/base "$out/base"
      cp -r packages/http "$out/http"
      cp -r packages/web "$out/web"
      if [ -f packages/web-cli/.output/build-id ]; then cp packages/web-cli/.output/build-id "$out/build-id"; fi
    '';
  };

  # 自举后端编译器：由 stage 1 编译器把自己的源码编到 native。
  # 它是开发 / CI 产物（不进 seed、不进 TCB），口径见 docs/reference/testing.md。
  #
  # native：产物直接是原生可执行文件；身份写 `$out/build-id`（Loader.Fingerprint 读它）。
  vuna-native =
    pkgs.runCommand "vuna-native-${version}"
      {
        nativeBuildInputs = ocamlTools ++ [ vuna-compiler ];
        allowSubstitutes = false;
        meta = {
          description = "vuna compiler built for x86-64 native (self-host checks)";
          mainProgram = "vuna-native";
          license = lib.licenses.mit;
        };
      }
      ''
        mkdir -p packages
        cp -r ${../../packages/compiler} packages/compiler
        cp -r ${../../packages/base} packages/base
        cp ${../../vuna.toml} vuna.toml
        chmod -R u+w .
        export VUNA_STORE="$TMPDIR/store"
        ${vuna-compiler}/bin/vuna-compiler build packages/compiler --target native --out "$out/out"
        mkdir -p "$out/bin"
        cp "$out/out/bin/vuna-compiler" "$out/bin/vuna-native"
        cp -r packages/base "$out/base"
        printf '%s' "vuna-native-$(sha256sum "$out/bin/vuna-native" | cut -d' ' -f1)" > "$out/build-id"
      '';

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
in
{
  default = vuna;

  inherit
    vuna
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
    ;
}
