# CI 门禁分组：唯一事实来源。
#
# 每项是一个 installable 引用：
#   check:<name>   → .#checks.<system>.<name>
#   package:<name> → .#packages.<system>.<name>
#
# `pr` 是 push / PR 上的最小档；`deep` 是完整的便宜门禁（含 `pr`）；`suite` /
# `browser` 是长尾，在定时、手动或带对应标签的 PR 上跑。PR 的增量检查由
# `nix/checks/pr-gates.nix` 按 type + pkg/area 选择；`slices` 是 PR 用的 area 切片，
# `gate` 是 main push 的完整 suite 层。`backends` / `native` 只在 CI 的定时 / 手动
# 与本地 `nix run .#ci -- backends|native` 跑。组成员在构建期展开进 `nix run .#ci`，
# 运行时不再枚举 flake；新增 check 必须被 `deep` / `suite` / `gate` / `slices` /
# `backends` 之一覆盖，否则 `nix/checks/default.nix` 求值失败。
let
  pr = [
    "check:vuna-fmt"
    "check:vuna-lint"
    "check:vuna-typecheck"
  ];
in
{
  inherit pr;

  # 完整 suite gate（fast+integration）+ 包内单测：main push 与本地全量。
  gate = [
    "check:vuna-tests-gate"
    "check:vuna-tests-units"
  ];

  # 包内单测独立成 job（`ci.yml` 的 units）：不随 suite shard 重复。
  units = [ "check:vuna-tests-units" ];

  # PR 增量 suite 切片（`nix/checks/slices.nix`）：按 area 组合选择器，PR 计划器只
  # 构建命中的那几个；`nix run .#ci -- slices` 一次跑全部。
  slices = [
    "check:vuna-tests-frontend"
    "check:vuna-tests-core"
    "check:vuna-tests-ir"
    "check:vuna-tests-ocaml"
    "check:vuna-tests-runtime"
    "check:vuna-tests-base"
    "check:vuna-tests-toolchain"
  ];

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
    "check:vuna-native-codegen-budget"
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
    "check:vuna-tests-units"
    "check:vuna-tests-e2e"
  ];

  # 非默认后端矩阵（wasm / native）。
  backends = [
    "check:vuna-tests-wasm"
    "check:vuna-tests-native"
  ];

  # native 自举 conformance（package：构建即运行，不在 flake check 里）。
  native = [ "package:vuna-native-conformance" ];

  # 浏览器可跑面实跑（package，不在 flake check 里）。
  browser = [ "package:vuna-wasm-browser-smoke" ];
}
# CI 分片组：每个名字对应 `nix/checks/default.nix` 里的一个 shard check。
# GitHub workflow 用 matrix 并行调用；本地 `nix run .#ci -- gate-shard-0` 可单跑一片。
// builtins.listToAttrs (
  map (i: {
    name = "gate-shard-${toString i}";
    value = [ "check:vuna-tests-gate-shard-${toString i}" ];
  }) (builtins.genList (i: i) 4)
)
// builtins.listToAttrs (
  map (i: {
    name = "e2e-shard-${toString i}";
    value = [ "check:vuna-tests-e2e-shard-${toString i}" ];
  }) (builtins.genList (i: i) 8)
)
