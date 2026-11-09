# 自举链的三级构建产物与两个开发 runner：
#   seed/ → vuna-seed（stage 0）→ vuna-compiler（stage 1）→ vuna（产品 CLI）
#   vuna-run-tests / vuna-bench 是开发用包装（nix run .#vuna-run-tests / .#vuna-bench）。
{
  pkgs,
  ocamlTools,
  shellTools,
  version,
}:
let
  inherit (pkgs) lib;

  # 所有 stage 产物共享的派生形状；build 脚本逐字保留旧的 runCommand 内容，
  # 以便 vuna-seed / vuna-compiler / vuna 的 drvPath 与重构前一致。
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
  # 单文件由 vuna-seed 直接编译时能找到 base（M26）。
  vuna-seed = mkStage {
    name = "vuna-seed-${version}";
    description = "vuna seed compiler (stage 0, multi-file seed)";
    mainProgram = "vuna-seed";
    build = ''
      mkdir -p "$out/bin"
      cp -r ${../seed} seed
      cp -r ${../base} "$out/base"
      chmod -R u+w seed
      cd seed
      sh build.sh "$out/bin/vuna-seed"
    '';
  };

  # stage 1 编译器：种子对 compiler 包做逐模块 codegen，用生成的 build.sh 构建。
  vuna-compiler = mkStage {
    name = "vuna-compiler-${version}";
    description = "vuna compiler (stage 1, split-compiled from compiler/)";
    mainProgram = "vuna-compiler";
    build = ''
      mkdir -p "$out/bin"
      cp -r ${../compiler} compiler
      cp -r ${../base} base
      chmod -R u+w .
      ${vuna-seed}/bin/vuna-seed build --no-compile --out stage1 compiler
      sh stage1/build.sh "$out/bin/vuna-compiler"
      cp -r base "$out/base"
    '';
  };

  # 产品 CLI：由 stage 1 编译器构建根包（compiler + 工具链）。
  vuna = mkStage {
    name = "vuna-${version}";
    description = "vuna CLI (stage 1, tools + compiler library)";
    mainProgram = "vuna";
    build = ''
      mkdir -p "$out/bin"
      cp -r ${../lib} lib
      cp -r ${../app} app
      cp -r ${../compiler} compiler
      cp -r ${../base} base
      cp ${../vuna.toml} vuna.toml
      chmod -R u+w .
      ${vuna-compiler}/bin/vuna-compiler build --package vuna .
      cp .output/bin/vuna "$out/bin/vuna"
      cp -r base "$out/base"
    '';
  };

  # 手动性能基准与原生测试 runner；编译器在运行时解析，不在构建期绑定。
  vuna-bench = import ./bench.nix {
    inherit pkgs;
    tools = shellTools;
  };

  # M33：生成程序运行时基准（bench/run.sh；vuna 用 nix 构建的产物）。
  vuna-perf = import ./perf.nix {
    inherit pkgs;
    tools = shellTools;
    inherit vuna;
  };

  vuna-run-tests = import ./run-tests.nix {
    inherit pkgs vuna vuna-seed;
    tools = shellTools;
  };
in
{
  default = vuna;

  inherit
    vuna
    vuna-seed
    vuna-compiler
    vuna-bench
    vuna-perf
    vuna-run-tests
    ;
}
