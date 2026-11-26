# 按系统组装 flake outputs；flake.nix 只负责输入与委托。
{ nixpkgs }:
let
  common = import ./common.nix { inherit nixpkgs; };
  inherit (common) systems forAllSystems pkgsFor;

  # 每个系统一份完整输出；再按 flake 的输出类型转置。
  perSystem =
    system:
    let
      pkgs = pkgsFor system;
      ocamlTools = common.ocamlTools pkgs;
      wasmTools = common.wasmTools pkgs;
      e2eTools = common.e2eTools pkgs;
      packages = import ./packages.nix {
        inherit pkgs ocamlTools;
        shellTools = common.shellTools pkgs;
        e2eTools = common.e2eTools pkgs;
        inherit (common) version;
      };
      checks = import ../checks {
        inherit
          pkgs
          packages
          ocamlTools
          e2eTools
          ;
      };

      # 门禁分组覆盖（nix/checks/groups.nix）：分组引用必须存在，每个 check 至少进
      # 一个门禁分组，`.github/workflows/ci.yml` 的 group 输入必须是分组名；
      # `vuna` / `vuna-seed` / `vuna-compiler` 是构建产物，不要求分组。
      groups = import ../checks/groups.nix;
      groupNames = builtins.attrNames groups;
      prGates = import ../checks/pr-gates.nix;

      # `.github/workflows/ci.yml` 的 `with: group:` 原样传给 `nix run .#ci -- <group>`
      # （该文件不走 run-plan 分支），所以每个值都必须是 groups.nix 里的分组名；
      # matrix 生成的值（`gate-shard-${{ matrix.shard }}`）按去掉表达式后的前缀匹配。
      # 其它 workflow 的 `group:` 有的是 concurrency 名、有的配套 `gate-labels` 走
      # run-plan（如 `gates`），不属于这个约束，这里只读 ci.yml。
      ciWorkflowGroups = builtins.filter (m: m != null) (
        map (
          line:
          let
            m = builtins.match " {6,}group: +([^[:space:]]+)" line;
          in
          if m == null then null else builtins.head m
        ) (pkgs.lib.splitString "\n" (builtins.readFile ../../.github/workflows/ci.yml))
      );
      ciWorkflowUnknownGroups = builtins.filter (
        name:
        let
          prefix = builtins.head (pkgs.lib.splitString "\${" name);
        in
        !(builtins.any (g: g == name || (prefix != name && pkgs.lib.hasPrefix prefix g)) groupNames)
      ) ciWorkflowGroups;
      refs = builtins.concatLists (
        map (g: groups.${g}) (
          [
            "deep"
            "gate"
            "slices"
            "suite"
            "backends"
            "native"
            "browser"
          ]
          ++ builtins.filter (n: builtins.match "(gate|e2e)-shard-[0-9]+" n != null) (
            builtins.attrNames groups
          )
        )
      );
      prGateRefs =
        builtins.concatLists (builtins.attrValues prGates.types)
        ++ builtins.concatLists (map (a: a.default ++ a.perf) (builtins.attrValues prGates.areas));
      prGateParsed = map (ref: {
        inherit ref;
        m = builtins.match "(check|package):(.+)" ref;
      }) prGateRefs;
      prGateMalformed = map (x: x.ref) (builtins.filter (x: x.m == null) prGateParsed);
      prGateCheckRefs = map (x: builtins.elemAt x.m 1) (
        builtins.filter (x: x.m != null && builtins.head x.m == "check") prGateParsed
      );
      prGatePackageRefs = map (x: builtins.elemAt x.m 1) (
        builtins.filter (x: x.m != null && builtins.head x.m == "package") prGateParsed
      );
      prGateUnknownChecks = builtins.filter (
        n: !(builtins.elem n (builtins.attrNames checks))
      ) prGateCheckRefs;
      prGateUnknownPackages = builtins.filter (
        n: !(builtins.elem n (builtins.attrNames packages))
      ) prGatePackageRefs;
      prGateAreaNames = builtins.attrNames prGates.areas;
      prGateBadAreas = builtins.filter (
        name:
        let
          area = prGates.areas.${name};
        in
        area.default == [ ] || area.perf == [ ]
      ) prGateAreaNames;
      prGateBadPkgs = builtins.filter (
        name: builtins.any (area: !(builtins.elem area prGateAreaNames)) prGates.pkgs.${name}
      ) (builtins.attrNames prGates.pkgs);
      prGateBadFallback = !(builtins.elem prGates.fallback prGateAreaNames);
      parsed = map (ref: {
        inherit ref;
        m = builtins.match "(check|package):(.+)" ref;
      }) refs;
      malformed = map (x: x.ref) (builtins.filter (x: x.m == null) parsed);
      checkRefs = map (x: builtins.elemAt x.m 1) (
        builtins.filter (x: x.m != null && builtins.head x.m == "check") parsed
      );
      packageRefs = map (x: builtins.elemAt x.m 1) (
        builtins.filter (x: x.m != null && builtins.head x.m == "package") parsed
      );
      gateChecks = builtins.filter (
        n:
        !(builtins.elem n [
          "vuna"
          "vuna-seed"
          "vuna-compiler"
        ])
      ) (builtins.attrNames checks);
      missing = builtins.filter (n: !(builtins.elem n checkRefs)) gateChecks;
      unknownChecks = builtins.filter (n: !(builtins.elem n (builtins.attrNames checks))) checkRefs;
      unknownPackages = builtins.filter (n: !(builtins.elem n (builtins.attrNames packages))) packageRefs;
      groupError =
        if malformed != [ ] then
          "分组项必须是 check:<name> 或 package:<name>：${toString malformed}"
        else if unknownChecks != [ ] then
          "分组引用了不存在的 check：${toString unknownChecks}"
        else if unknownPackages != [ ] then
          "分组引用了不存在的 package：${toString unknownPackages}"
        else if missing != [ ] then
          "check 未进入任何门禁分组（deep/gate/slices/suite/backends）：${toString missing}"
        else if ciWorkflowUnknownGroups != [ ] then
          "ci.yml 引用了不存在的门禁分组：${toString ciWorkflowUnknownGroups}"
        else if prGateMalformed != [ ] then
          "pr-gates 项必须是 check:<name> 或 package:<name>：${toString prGateMalformed}"
        else if prGateUnknownChecks != [ ] then
          "pr-gates 引用了不存在的 check：${toString prGateUnknownChecks}"
        else if prGateUnknownPackages != [ ] then
          "pr-gates 引用了不存在的 package：${toString prGateUnknownPackages}"
        else if prGateBadAreas != [ ] then
          "pr-gates 的 area 缺少 default/perf：${toString prGateBadAreas}"
        else if prGateBadPkgs != [ ] then
          "pr-gates 的 pkg 映射到不存在的 area：${toString prGateBadPkgs}"
        else if prGateBadFallback then
          "pr-gates fallback 不是已存在的 area：${prGates.fallback}"
        else
          null;
    in
    if groupError != null then
      throw "nix/checks: ${groupError}"
    else
      {
        inherit packages checks;

        # default 是全量开发环境；ocaml 只含工具链，不依赖仓库源码，
        # 种子重建/坏掉时仍可进入（direnv 默认用 default）。
        devShells = {
          default = pkgs.mkShell {
            packages = e2eTools ++ [ packages.vuna-seed ];
            # 单一 store 根：不再按 worktree 分 `.local/store`（默认 `~/.vuna/store`）。
            # 测试用独立根（`nix/build/run-tests.nix`），因为 suite 会故意破坏对象。
            shellHook = ''
              # 仓库内（含副 worktree）把 hooks 路径指向 .githooks：pre-commit 跑全仓库 fmt/lint/check。
              if git rev-parse --git-dir >/dev/null 2>&1 && [ "$(git config --get core.hooksPath || true)" != ".githooks" ]; then
                git config core.hooksPath .githooks
              fi
              # 横幅只在交互式终端出现：`nix develop --command` 之类调用（含 NIX_DEVSHELL_QUIET=1）保持静默。
              if [ -t 1 ] && [ -z "''${NIX_DEVSHELL_QUIET:-}" ]; then
                echo "vuna dev shell — OCaml $(ocaml -version)（VUNA_STORE=''${VUNA_STORE:-默认根 ~/.vuna/store}）"
              fi
            '';
          };

          ocaml = pkgs.mkShell {
            packages = ocamlTools ++ wasmTools;
            shellHook = ''
              if [ -t 1 ] && [ -z "''${NIX_DEVSHELL_QUIET:-}" ]; then
                echo "vuna OCaml shell — OCaml $(ocaml -version)（不含 vuna-seed；需要时用 nix develop .#default）"
              fi
            '';
          };
        };
      };

  all = forAllSystems perSystem;

  forEach = attr: forAllSystems (system: all.${system}.${attr});
in
{
  packages = forEach "packages";
  checks = forEach "checks";
  devShells = forEach "devShells";
  formatter = forAllSystems (system: (pkgsFor system).nixfmt-tree);
}
