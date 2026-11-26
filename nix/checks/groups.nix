# CI 门禁分组：唯一事实来源。
#
# 每项是一个 installable 引用：
#   check:<name>   → .#checks.<system>.<name>
#   package:<name> → .#packages.<system>.<name>
#
# `pr` 是 push / PR 上的最小档；`deep` 是完整的便宜门禁（含 `pr`）；`suite` /
# `backends` / `native` / `browser` 是长尾，只在定时、手动或带对应标签的 PR 上跑。
# 组成员在构建期展开进 `nix run .#ci`，运行时不再枚举 flake；新增 check 必须被
# `deep` / `suite` / `backends` 之一覆盖，否则 `nix/checks/default.nix` 求值失败。
let
  pr = [
    "check:vuna-fmt"
    "check:vuna-lint"
    "check:vuna-typecheck"
  ];
in
{
  inherit pr;

  deep = pr ++ [
    "check:vuna-static"
    "check:vuna-nix-fmt"
    "check:vuna-checks-inventory"
    "check:vuna-diag"
    "check:vuna-single-pass"
    "check:vuna-iface-selftest"
    "check:context-budget"
    "check:vscode-ext"
    "check:vuna-obs-schema"
    "check:vuna-obs-dwarf"
    "check:vuna-obs-overhead"
    "check:vuna-wasm-browser"
    "check:vuna-metrics"
    "check:vuna-native-surface"
    "check:vuna-native-artifact"
    "check:vuna-native-codegen-growth"
    "check:vuna-compiler-growth"
    "check:vuna-compiler-growth-ctor"
    "check:vuna-compiler-growth-incremental"
    "check:vuna-frontend-growth"
    "check:vuna-resolve-chain-growth"
    "check:vuna-container-growth"
    "check:vuna-effect-machine-growth"
    "check:seed-selfhost"
  ];

  # ocaml suite：fast + integration（gate）与 steps/e2e。
  suite = [
    "check:vuna-tests-gate"
    "check:vuna-tests-e2e"
  ];

  # 非默认后端矩阵（wasm / native）。
  backends = [
    "check:vuna-tests-wasm"
    "check:vuna-tests-native"
  ];

  # native 自举 conformance（package，不在 flake check 里）。
  native = [ "package:backend-check" ];

  # 浏览器可跑面实跑（package，不在 flake check 里）。
  browser = [ "package:vuna-wasm-browser-smoke" ];
}
