# PR gate 计划：由 type + area 选出一批检查。
#
# 这里只放“按改动面追加”的检查；`pr` 组（fmt / lint / typecheck）由 ci.yml 的
# 必需 job 单独承担。`nix run .#ci -- plan <labels...>` 打印选择结果，
# `--run-plan` 只构建这些检查。
#
# 选择规则：
#   1. area 标签优先；没有 area 时用 pkg 标签映射到 area；都没有则 fallback。
#   2. type:perf 使用 area 的 perf 子集；其他 type 使用 area.default + type 的附加检查。
#   3. 多个 area / type 取并集并去重。
let
  repoDefault = [
    "check:vuna-static"
    "check:vuna-nix-fmt"
    "check:vuna-checks-inventory"
    "check:context-budget"
  ];
in
{
  types = {
    bug = [
      "check:vuna-diag"
      "check:vuna-tests-gate"
    ];
    feature = [ ];
    refactor = [
      "check:vuna-static"
      "check:vuna-single-pass"
      "check:vuna-iface-selftest"
    ];
    perf = [ ];
    test = [
      "check:vuna-tests-gate"
      "check:vuna-tests-e2e"
    ];
    docs = [
      "check:context-budget"
    ];
    chore = [ ];
    epic = [ ];
  };

  areas = {
    compiler-frontend = {
      default = [
        "check:vuna-diag"
        "check:vuna-single-pass"
        "check:vuna-frontend-growth"
        "check:vuna-resolve-chain-growth"
        "check:vuna-tests-gate"
      ];
      perf = [
        "check:vuna-frontend-growth"
        "check:vuna-resolve-chain-growth"
      ];
    };

    compiler-core = {
      default = [
        "check:vuna-diag"
        "check:vuna-single-pass"
        "check:vuna-iface-selftest"
        "check:vuna-compiler-growth"
        "check:vuna-compiler-growth-ctor"
        "check:vuna-compiler-growth-incremental"
        "check:vuna-tests-gate"
      ];
      perf = [
        "check:vuna-compiler-growth"
        "check:vuna-compiler-growth-ctor"
        "check:vuna-compiler-growth-incremental"
      ];
    };

    ir = {
      default = [
        "check:vuna-static"
        "check:vuna-single-pass"
        "check:vuna-iface-selftest"
      ];
      perf = [
        "check:vuna-single-pass"
        "check:vuna-iface-selftest"
      ];
    };

    codegen-ocaml = {
      default = [
        "check:vuna-metrics"
        "check:vuna-tests-gate"
      ];
      perf = [
        "check:vuna-metrics"
      ];
    };

    codegen-native = {
      default = [
        "check:vuna-native-surface"
        "check:vuna-native-artifact"
        "check:vuna-native-codegen-growth"
      ];
      perf = [
        "check:vuna-native-artifact"
        "check:vuna-native-codegen-growth"
      ];
    };

    codegen-wasm = {
      default = [
        "check:vuna-wasm-browser"
      ];
      perf = [
        "check:vuna-wasm-browser"
      ];
    };

    base = {
      default = [
        "check:vuna-container-growth"
        "check:vuna-effect-machine-growth"
        "check:vuna-tests-gate"
      ];
      perf = [
        "check:vuna-container-growth"
        "check:vuna-effect-machine-growth"
      ];
    };

    runtime = {
      default = [
        "check:vuna-effect-machine-growth"
        "check:vuna-tests-gate"
      ];
      perf = [
        "check:vuna-effect-machine-growth"
      ];
    };

    toolchain = {
      default = [
        "check:vuna-tests-gate"
      ];
      perf = [
        "check:vuna-tests-gate"
      ];
    };

    obs = {
      default = [
        "check:vuna-obs-schema"
        "check:vuna-obs-dwarf"
        "check:vuna-obs-overhead"
      ];
      perf = [
        "check:vuna-obs-overhead"
      ];
    };

    editor = {
      default = [
        "check:vscode-ext"
      ];
      perf = [
        "check:vscode-ext"
      ];
    };

    ci = {
      default = [
        "check:vuna-nix-fmt"
        "check:vuna-checks-inventory"
      ];
      perf = [
        "check:vuna-nix-fmt"
        "check:vuna-checks-inventory"
      ];
    };

    docs = {
      default = [
        "check:context-budget"
      ];
      perf = [
        "check:context-budget"
      ];
    };

    seed = {
      default = [
        "check:seed-selfhost"
      ];
      perf = [
        "check:seed-selfhost"
      ];
    };

    web = {
      default = [
        "check:vuna-wasm-browser"
      ];
      perf = [
        "check:vuna-wasm-browser"
      ];
    };

    tests = {
      default = [
        "check:vuna-tests-gate"
      ];
      perf = [
        "check:vuna-tests-gate"
      ];
    };

    repo = {
      default = repoDefault;
      perf = repoDefault;
    };
  };

  pkgs = {
    compiler = [
      "compiler-frontend"
      "compiler-core"
    ];
    compiler-base = [ "compiler-core" ];
    ir = [ "ir" ];
    target-ocaml = [ "codegen-ocaml" ];
    target-native = [ "codegen-native" ];
    target-wasm = [ "codegen-wasm" ];
    plugin-web = [ "web" ];
    dev = [ "toolchain" ];
    base = [ "base" ];
    plugin-kit = [ "toolchain" ];
    toolchain = [ "toolchain" ];
    cli = [ "toolchain" ];
    http = [ "runtime" ];
    web = [ "web" ];
    web-cli = [ "web" ];
    obs = [ "obs" ];
  };

  fallback = "repo";
}
