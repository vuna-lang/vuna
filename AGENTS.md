# AGENTS.md — vuna 仓库的 AI agent 入口

本文件是仓库里**唯一固定的必读入口**。目标：用最少上下文定位到该改的地方，而不是通读全仓。
规则细则与场景技能见 [`.agents/README.md`](.agents/README.md)（规则 `rules/`、技能 `skills/`）。

## 项目前提：没有兼容义务

**vuna 尚未发布任何版本**：没有外部用户、下游生态与历史包袱，全部源码都在本仓库内。
因此**任何设计、接口、命令、实现、哲学都允许被推翻**（包括本文件写下的决策）；
「保留兼容层」「以后可能有人依赖」不构成保留理由——评估一个遗留物只看一条：
**它在终态里还成立吗**。推翻旧决策时在提交信息与对应主题页说明，不静默改写；已完成阶段
与历史细节在 git 历史。当前路线：**单一 DT 路径**（唯一检查器与 codegen）。

当前基线一句话：自举链（`seed/` → rotation → stage1 == stage2）与全工具链都已工作，
编译器自身用 vuna 写成；性能读数见 [performance.md](docs/reference/performance.md)，
未关闭的债务见 [debt.md](docs/reference/debt.md)。

## 阅读顺序

1. `AGENTS.md`（本文件）——前提、不变量、纪律红线、高频命令；
2. [`.agents/README.md`](.agents/README.md)——规则与技能索引（**按场景取用**，不要通读）；
3. [`docs/architecture.md`](docs/architecture.md)——子系统地图：哪条链路、入口符号、连带改动、测试标签，以及「改一处 → 跑什么」；
4. 需要时再下钻：`docs/reference/`（语言 / 类型 / Core / 编译器 / 包 / 工具 / 测试参考页）、
   [debt](docs/reference/debt.md)。

**定位符号**用 `vuna map --find` / `--impact` / `vuna api`（规程见技能 `repo-navigation`）；
**不要做的事**：通读全仓、读 `seed/` 或 `docs/api.html`（生成物）。

## 编译器选取规则

1. **优先**本地当前 worktree 的 `./result/bin/vuna`（`nix build .#vuna --out-link result` 的产物）；
2. 本地不存在或编译不过：**一律** `nix run vuna -- <subcommand>`（`nix registry list`
   里的别名，即远端稳定版）；
3. 测试：`nix run .#vuna-run-tests`（`nix/run-tests.nix`；`--list` / `--only <章节>` 过滤，
   无参数等价 `vuna test --suite test/suite.toml`；`--jobs auto` 用全部可用核）。

`vuna-seed`（stage 0）来自 `nix build .#vuna-seed`，stage 1 是 `nix build .#vuna-compiler`；
测试需要 PATH 里有 `ocamlopt`（`nix develop` 提供）。

## 硬不变量（改坏了必须自己发现）

1. **当前 seed 必须能编译当前源码**（rotation 按需，触发条件见 bootstrap.md）——`seed/` 是提交入库的信任锚点；
2. **seed rotation 后 stage1 == stage2**（文件集逐字节一致，fixed point）；
3. **`seed/` 只含 compiler 包入口闭包**（`compiler/app/Main.vuna` 的 import 闭包）；
4. **工具链不进 TCB**：整个 `lib/` 与 `app/` 永不进入 seed 闭包（fmt/lint/repl/doc/test/Index/LSP/
   obs/package manager 等都在 `lib/`）；黑名单与断言见 `nix/tcb-forbidden.txt`；
5. **动作入口与宿主层**：唯一动作类型是 `Eff r a`；用户面入口是 `main : Eff [] a`（行必须
   Nil，入口处未处理效应是类型错误；也允许内建宿主效应行，见 debt D65），
   执行入口是 `Base.Eff.runPure : Eff [] a -> a`。
   宿主层 = 直接调用 `prim_eff_*`（`Base.Host` 已删除）；Int/Nat 归一化只在
   `Base.Eff.*` handler 的 result 族（`Print`/`WriteFile`/`FileSize` 返回 `Nat`）。
   `IORef` 实现全是 `Eff []`。
   **无 manifest 门控**：没有能力/特权/信任机制；任何包（含 ad-hoc 文件）都可直调
   `prim_*` / `prim_eff_*`。用户面**应**仍经 `Base.Eff.*` 标签 + handler（纪律，不是门控，
   见 [effects.md](docs/reference/effects.md) §8.6）。
   **隐藏效果守卫**：编译器/工具链不得用 `runPure` 在纯签名里隐藏 Eff 执行；
   `checks.eff-boundary` 基线为 0（`nix/eff-boundary.allowlist` 为空），无例外；
   tracing 走隐藏 runtime 原语。
6. **唯一路径**：语言夹具、`vuna interp`、包构建与 seed 全部走 DT（精化 + 擦除
   codegen，`vuna check .` 也是 DT 自检）；没有可切换的检查器，也没有第二套 codegen；
7. 编译器自检通过：`vuna check .` 必须能检查自身源码（`checks.vuna-typecheck`）。

## 纪律红线

细则见 `.agents/rules/`；下面每条都在对应文件里有完整口径。

- **每轮开工先 rebase 主分支**（`git fetch origin main` → `git rebase main`），历史保持线性
  （[workflow.md](.agents/rules/workflow.md)）。
- **禁止手改 `seed/`**：只能 `sh nix/seed-rotate.sh ./result/bin/vuna` 轮换，且独立成
  `chore(seed): ...` 提交（[workflow.md](.agents/rules/workflow.md)）。
- **改完代码跑 `./result/bin/vuna fmt <改动的文件/目录>`**；验证按改动面选，别为自测跑全量
  `nix build` / `nix flake check`（[verification.md](.agents/rules/verification.md)）。
- **改 `compiler/` 后先验证「旧种子能编译新源码」**（`nix build .#vuna-seed` 或 CI 的
  `checks.seed-selfhost`）；要用的新语法先以旧语法落地 → rotate → 再用新语法
  （[verification.md](.agents/rules/verification.md)）。
- **探索按场景选工具**：要改的模块整篇 `read`；只引用的用 `vuna map` / `vuna api`，
  **不要 grep**；探索完把结论落盘（技能 `repo-navigation` + [docs.md](.agents/rules/docs.md)）。
- **Monad/Functor 组合**：类型有实例时统一用 `do` / `>>=` / `bind` / `pure` / `fmap` /
  `liftA2` / `ap` / `foldMap` / `mapM`（`pure` 在 `Base.Applicative`，`Base.Monad` 重导出），
  不新增 `pureX` / `bindX` / `andThen` 这类重复入口；例外与长 do 链性能边界见
  [records-traits.md](docs/reference/records-traits.md)、[effects.md](docs/reference/effects.md) §8.4。
- **注释与说明文字只写当下**：源码 / 夹具 / 脚本 / 主题页的注释不写阶段编号、里程碑、
  实现史（「旧实现如何」）与未来计划；能靠测试锁行为就不靠注释叙述
  （[comments.md](.agents/rules/comments.md)）。
- **提交信息**用 `type(scope): 中文描述`（技能 `vuna-commits`）；一次提交只做一件事。
- 允许 `git add` / `git commit`；`git checkout` / `git reset` 会丢工作树改动，执行前先确认。

## 高频命令

```console
nix build .#vuna --out-link result        # 产品 CLI；.#vuna-compiler / .#vuna-seed 同理
./result/bin/vuna check .                 # 包级类型检查（自检）；check <pkg> 只查该包闭包
./result/bin/vuna fmt <改动的文件/目录>     # 格式化；--check 只检查
./result/bin/vuna run <pkg> -- ARGS...    # 增量 build + 执行入口（透传参数/退出码）
nix run .#vuna-run-tests -- --only <章节> # 按章节跑 suite（--list 看章节）
sh nix/seed-rotate.sh ./result/bin/vuna   # 仅当需要轮换 seed
nix flake check                           # 3 packages + 19 checks（清单见 testing.md）
./result/bin/vuna map --find <Module.name> # 定位符号；另有 --impact / api
```

全部命令与 flag 以 `./result/bin/vuna help` 为准；完整清单见
[README.md](README.md) 的「工具与自举链」、[tooling.md](docs/reference/tooling.md)、
[packages.md](docs/reference/packages.md)。编译后端用 `compile/build --target ocaml|wasm|native`。

## 目录速览

`compiler/` = 编译器包（`Vuna.Compiler.*`，入口 `app/Main.vuna`，**进 seed**）；`base/` =
标准库 `vuna-base`（`Base.*` + `Prelude`，**进 seed**）；`lib/` = 根包工具链（Cli/Interp/
Files/Fmt/Lint/Repl/Run/Doc/Index/Lsp/TestRunner/Obs 等，**不进 seed**）；`app/` = 产品 CLI 入口；
`seed/` = 提交入库的 OCaml 信任锚点（生成物，禁止手改、别读）；`test/` = `suite.toml` +
`suite/`（原生 runner + steps 用例）+ `corpus/` 夹具；`bench/`（仓库根）= 生成程序与编译器基准；
`examples/` = 多包示例；`.agents/` = AI 规则与技能；`vscode/` = VSCode 扩展（高亮 + LSP +
lint/fmt/check/build，`dist/` 提交）；`nix/` = 构建图 + CI 门禁 + rotate/metrics；`docs/` = 分层文档。

## 文档导航

- 子系统地图、改动定位、验证矩阵：[`docs/architecture.md`](docs/architecture.md)
- 终态方向、不变量与非目标：[`docs/architecture-target.md`](docs/architecture-target.md)
  （判断"某需求该不该进核心"先读它；现状见 architecture.md）
- 语言 / 类型 / 效应 / 标准库 / 包：[`docs/reference/`](docs/reference/)——逐页说明见
  [README 文档导航](README.md#文档导航)：language、type-system、qtt、records-traits、
  effects、stdlib、packages、package-store、primitives、operators
- 编译器实现：compiler、core、ir、diagnostics、wasm、native、cache（同在 `docs/reference/`）
- 工具链 / 测试 / 自举：tooling、testing、test-architecture、bootstrap（同在 `docs/reference/`）
- 性能与观测：[performance.md](docs/reference/performance.md)（量什么/读数）、
  [observability.md](docs/reference/observability.md)（`VUNA_OBS` 分级 / `Base.Obs` / `vuna obs` / `#line` → DWARF）
- AI 规则与技能：[`.agents/README.md`](.agents/README.md)（规则 `rules/`、技能 `skills/`）
- 债务 / 已知缺口：[debt.md](docs/reference/debt.md)（只含开放项，带证据）

> 文档分层规则：`README.md` 只保留定位/上手/目录/硬约束/导航；细节在 `docs/reference/`；
> AI 规则与场景技能在 `.agents/`；已完成阶段 / 已落地决策 / 历史在 git 历史。
