# AGENTS.md — vuna 仓库的 AI agent 入口

本文件是仓库里**唯一固定的必读入口**。目标：用最少上下文定位到该改的地方，而不是通读全仓。
规则细则与场景技能见 [`.agents/README.md`](.agents/README.md)（规则 `rules/`、技能 `skills/`）。

## 项目前提：没有兼容义务

**vuna 尚未发布任何版本**：没有外部用户、下游生态与历史包袱，全部源码都在本仓库内。
因此**任何设计、接口、命令、实现、哲学都允许被推翻**（包括本文件写下的决策）；
「保留兼容层」「以后可能有人依赖」不构成保留理由——评估一个遗留物只看一条：
**它在终态里还成立吗**。推翻旧决策时在提交信息与对应主题页说明，不静默改写；已完成阶段
与历史细节在 git 历史。当前路线：**单一 DT 路径**（唯一检查器与 codegen）。

当前基线：自举链（`seed/` → rotation → stage1 == stage2）与全工具链都已工作，编译器自身用
vuna 写成；性能读数见 [performance.md](docs/reference/performance.md)，未关闭的债务见 [债务清单](https://github.com/vuna-lang/vuna/issues?q=label%3Adebt)。

## 阅读顺序

1. `AGENTS.md`（本文件）——前提、不变量、纪律红线、高频命令；
2. [`.agents/README.md`](.agents/README.md)——规则与技能索引（**按场景取用**，不要通读）；
3. [`docs/architecture.md`](docs/architecture.md)——子系统地图：哪条链路、入口符号、连带改动、测试标签，以及「改一处 → 跑什么」；
4. 需要时下钻 `docs/reference/`（语言 / 类型 / Core / 编译器 / 包 / 工具 / 测试参考页）与
   [债务清单](https://github.com/vuna-lang/vuna/issues?q=label%3Adebt)。

人类贡献者从 [CONTRIBUTING.md](CONTRIBUTING.md) 开始：分支、提交整理、PR 标签门禁与合并方式。

**定位符号**用 `vuna map find` / `vuna map impact` / `vuna api`（规程见技能 `repo-navigation`）；
**不要做的事**：通读全仓、读 `seed/` 或 `docs/api.html`（生成物）。

## 编译器选取规则

1. **默认**用 `nix run .#vuna -- <subcommand>`：按当前 worktree 的源码构建（store 缓存命中时很快），
   永远对应你手里的代码；
2. `./result/bin/vuna` 只在刚跑过 `nix build .#vuna --out-link result` 之后用；`result` 是共享
   out-link，可能指向别的产物或旧二进制，需要固定二进制时先显式重建；
3. 远端稳定版（`nix registry list` 的别名）：`nix run vuna -- <subcommand>`；
4. 测试：`nix run .#vuna-run-tests`（`nix/run-tests.nix`；`--list` / `--only <owner/family>` 过滤，
   无参数等价 `vuna dev suite test/suite.toml`；`--jobs auto` 用全部可用核）；
5. 改**工具链 / 插件**（`packages/{cli,toolchain,dev,target-*}`）时有两种循环：`nix build .#vuna`
   已按插件拆分派生（只重建改动的插件 + 安装拷贝）；要绕开 Nix、直接用宿主对象库时用
   `nix/tools/dev-loop.sh`。口径与读数见 [tooling.md §0](docs/reference/tooling.md)。

`vuna-seed`（stage 0）来自 `nix build .#vuna-seed`，stage 1 是 `nix build .#vuna-compiler`；
测试需要 PATH 里有 `ocamlopt`（`nix develop` 提供）。

## 硬不变量（改坏了必须自己发现）

1. **当前 seed 必须能编译当前源码**（rotation 按需，触发条件见 bootstrap.md）——`seed/` 是提交入库的信任锚点；
2. **seed rotation 后 stage1 == stage2**（文件集逐字节一致，fixed point）；
3. **`seed/` 只含编译器入口闭包**（`packages/compiler/app/Main.vuna` 的 import 闭包，
   含它依赖的 `vuna-ir` / `vuna-compiler-base` / `vuna-target-ocaml` 模块；native/wasm 后端插件不在 seed）；
4. **工具链不进 TCB**：整个 `packages/cli/` 永不进入 seed 闭包（fmt/lint/repl/doc/test/Index/LSP/
   obs/package manager 等都在 `packages/cli/lib/`）；黑名单与断言见 `nix/seed/forbidden.txt`；
5. **动作入口与宿主层**：唯一动作类型是 `Eff r a`；用户面入口是 `main : Eff r a`（行里的内建宿主标签由
   entry 预装 handler；自定义效应必须在入口前 handle 成 `Nil`，未处理效应是类型错误）。
   执行入口两个：`Base.Effect.Core.runPure : Eff [] a -> a`（纯动作）与不导出的 `runMain`
   （entry 折完 handler、行里带 `HostOp` 的动作）。
   **`Eff []` 就是纯**（不观察也不改变外部世界；发散与不变式破坏不计）。确定性的内部可变状态经
   `Base.Effect.Mut.MutOp` 标记行表达（空 data、无操作 / 无 handler，`with*` 在作用域结束时
   关闭），所以 `Eff []` 里读不到任何可变句柄；调度器原语不占行。
   宿主层原语是隐藏的 `@vuna@prim_eff_*` / `@vuna@host@*`（源码写不出，只由 base 的 handler 与
   编译器/工具链内部使用），类型固定为 `Eff [HostOp] a`；关闭它的只有 `Base.Effect.Host` 的
   `runHost` / `hostSync`，`rowRem` 不对 `HostOp` 归约。用户面只有 `Base.Effect.Core.*`
   标签 + handler 这一条路径（`consolePrint` / `fsReadFile` / `envGetEnv` / `exitWith` …）。
   Int/Nat 归一化只在 handler 的结果索引（`Print`/`WriteFile`/`FileSize` 返回 `Nat`）。
   可变单元的隐藏原语（`@vuna@prim_mref*` 等）实现全是 `Eff []`。
   **无 manifest 门控**：没有能力/特权/信任机制；`prim_*`（纯原语）任何包（含 ad-hoc 文件）都可直调。
   **隐藏效果守卫**：编译器/工具链不得用 `runPure` 在纯签名里隐藏 Eff 执行，也不得在 base
   之外用 `runHost` / `hostSync` / 宿主原语就地关闭宿主行（宿主探测要补成正常效应族，如
   `Base.Effect.Tty`）；`checks.eff-boundary` 两项基线都为 0
   （`nix/checks/data/eff-boundary.allowlist` 为空），无例外；tracing 走隐藏 runtime 原语。
6. **唯一路径**：语言夹具、纯测试求值、包构建与 seed 全部走 DT（精化 + 擦除
   codegen，`vuna check .` 也是 DT 自检）；没有可切换的检查器，也没有第二套 codegen；
7. 编译器自检通过：`vuna check .` 必须能检查自身源码（`checks.vuna-typecheck`）。
8. **包内层方向**：`packages/compiler/` 的层依赖由 `packages/compiler/vuna.toml` 的 `[layers]` 声明、由 loader
   在 import 时强制（越层报 `LD_LayerViolation`，语义见
   [packages.md](docs/reference/packages.md)「层约束」）；`checks.ir-boundary` 只保留
   「必须 import 某模块」的正向断言与 IR 形状断言。

## 纪律红线

细则见 `.agents/rules/`；下面每条都在对应文件里有完整口径。

- **`main` 只读，所有改动走 PR**：issue 可选（PR-only 改动加 `no-issue` 标签；需要追踪的
  复杂工作再按技能 `vuna-issue` 建/领）；`git fetch origin` → 从 `origin/main` 切
  `<type>/<slug>` 分支；开 PR 前用
  `git rebase -i origin/main` 整理提交；`main` 只接受 **rebase merge**，默认全绿后进合并队列。
  禁止直推 `main` / `master`，禁止对 `main` force push
  （[workflow.md](.agents/rules/workflow.md)、技能 `vuna-pr`）。
- **改动只在副 worktree 进行**：所有源码 / 文档改动都在独立 worktree
  （`~/.local/share/opencode/worktree/…` 或 `.local/worktrees/…`）内完成，主工作区只用于读取与
  `git pull --ff-only`；收尾改为 push 分支 → 开 PR → 合并 → teardown，**不再 cherry-pick 回主仓**
  （[workflow.md](.agents/rules/workflow.md)）。
- **大任务拆 phase 用 stacked PR**：2 dev 槽、每 stack ≤3 层、远端写归 orchestrator；
  细节见技能 `vuna-phase`（冻结即开工下一层，不等 merged）。
- **禁止手改 `seed/`**：只能 `sh nix/seed/rotate.sh ./result/bin/vuna` 轮换（先用
  `nix build .#vuna --out-link result` 固定二进制），且独立成
  `chore(seed): ...` 提交；含 seed 的 PR 加 `seed` 标签并优先合并
  （[workflow.md](.agents/rules/workflow.md)）。
- **改完代码跑 `nix run .#vuna -- fmt <改动的文件/目录>`**；验证按改动面选，别为自测跑全量
  `nix build` / `nix flake check`（[verification.md](.agents/rules/verification.md)）。
- **改 `packages/compiler/` 后先验证「旧种子能编译新源码」**（`nix build .#vuna-seed` 或 CI 的
  `checks.seed-selfhost`）；要用的新语法先以旧语法落地 → rotate → 再用新语法
  （[verification.md](.agents/rules/verification.md)）。
- **探索按场景选工具**：要改的模块整篇 `read`；只引用的用 `vuna map` / `vuna api`，
  **不要 grep**；探索完把结论落盘（技能 `repo-navigation` + [docs.md](.agents/rules/docs.md)）。
- **Monad/Functor 组合**：类型有实例时统一用 `do` / `>>=` / `bind` / `pure` / `fmap` /
  `liftA2` / `ap` / `foldMap` / `mapM`（`pure` 在 `Base.Trait.Applicative`，`Base.Trait.Monad` 重导出），
  不新增 `pureX` / `bindX` / `andThen` 这类重复入口；例外与长 do 链性能边界见
  [records-traits.md](docs/reference/records-traits.md)、[effects.md](docs/reference/effects.md) §8.4。
- **注释与说明文字只写当下**：源码 / 夹具 / 脚本 / 主题页的注释不写阶段编号、里程碑、
  实现史（「旧实现如何」）与未来计划；能靠测试锁行为就不靠注释叙述
  （[comments.md](.agents/rules/comments.md)）。
- **跨后端原语/运行时变更必须三端同步**：新增或修改 `prim_*` / 运行时语义时，按
  **OCaml →（需要时）rotate seed → WASM → Native** 的顺序在同一轮内全部实现并验收；
  不允许只落一个后端再留 TODO（[verification.md](.agents/rules/verification.md)）。
- **提交信息**用 `type(scope): 中文描述`（技能 `vuna-commits`）；一次提交只做一件事。
- **提交前门禁**：`.githooks/pre-commit` 跑全仓库 `fmt --check`、`lint --max-warnings 0`、
  `check .`；devShell / direnv 自动设置 `core.hooksPath`。不要用 `--no-verify` 掩盖失败；
  `chore(seed):` 轮换等刚重建过整链的提交用 `VUNA_SKIP_HOOKS=1` 明示跳过。
- 允许 `git add` / `git commit`；`git checkout` / `git reset` 会丢工作树改动，执行前先确认。

## 高频命令

```console
nix run .#vuna -- check .                 # 包级类型检查（自检）；check <pkg> 只查该包闭包
nix run .#vuna -- fmt <改动的文件/目录>     # 格式化；--check 只检查
nix run .#vuna -- run <pkg> -- ARGS...    # 增量 build + 执行入口（透传参数/退出码）
nix/tools/dev-loop.sh -p toolchain -- fmt --check . # 树内增量循环（改工具/插件；tooling.md §0）
nix run .#vuna-run-tests -- --only <owner/family> # 按 owner/family 跑 suite（--list 看 id；用 ~/.vuna/test-store）
nix run .#vuna-run-tests -- --area compiler-frontend --tier fast # 只跑一个 area 影响面（PR 切片同口径）
nix run .#vuna-run-tests -- --backend wasm # 后端矩阵：只跑 matrix 允许 wasm 的 case
nix build .#vuna --out-link result        # 需要固定二进制时才构建（result 可能指向别的产物）
sh nix/seed/rotate.sh ./result/bin/vuna   # 仅当需要轮换 seed；上面那条先跑过
nix run .#vuna -- store gc --dry-run      # 缓存族 GC：先裁剪已消失的项目根，再按 roots+宽限淘汰
                                          # 对象库是单一根（默认 ~/.vuna/store，VUNA_STORE 覆盖）
nix run .#ci -- pr                        # push / PR 的最小门禁（fmt + lint + 自检）
nix run .#ci -- deep                      # 本地完整便宜门禁（与 CI 的 deep 同一条命令）
nix run .#ci -- --list                    # 门禁分组：pr / gate / units / gate-shard-* / e2e-shard-* / slices / deep / suite / backends / native / browser
nix flake check                           # 本地全量兜底（CI 不再用；清单见 testing-checks.md）
git config core.hooksPath .githooks       # 启用 pre-commit / pre-push（devShell/direnv 自动设置）
git switch -c <type>/<slug> origin/main   # 从 main 切分支（副 worktree 内）
gh issue list --search 'status:todo'       # 可开工 issue；流程见技能 vuna-issue
gh pr create --base main --title ...      # 开 PR；描述含 Closes #N
gh pr checks <n>                          # PR 自己的检查（队列状态见下一条）
nix/tools/merge-queue.sh status           # 合并队列位置 / 状态 / ETA
gh stack view --short                     # stack 层 / PR / 顺序（sync / arm 见技能 vuna-phase）
nix/tools/merge-queue.sh sweep            # stack 绿后整条入队；普通 PR 由 automerge arm
gh pr merge <n> --rebase                  # 仅 break-glass；不适用于 stack
git pull --ff-only                        # 主仓同步
nix/tools/github-branch-protection.sh     # 应用 main 的 ruleset（幂等；见技能 vuna-pr）
nix run .#vuna -- map find <Module.name> # 定位符号；另有 map impact / api
```

全部命令与 flag 以 `nix run .#vuna -- help` 为准；完整清单见
[README.md](README.md) 的「工具与自举链」、[tooling.md](docs/reference/tooling.md)、
[packages.md](docs/reference/packages.md)。编译后端用 `compile/build --target ocaml|wasm|native`。

## 目录速览

`packages/compiler/` = 编译器包（`Vuna.Compiler.*`，入口 `app/Main.vuna`，**进 seed**）；`packages/compiler-base/` =
编译器与 IR 共用的最低层（`Vuna.Compiler.Base.*`：位置 / 诊断 / 编码原语 / 摘要 / 落盘 / 内建符号表，**进 seed**）；
`packages/ir/` = 擦除后 IR 库 `vuna-ir`（`Vuna.Ir.*`：形状 / SCC / 运行时契约 / 校验 / 表示 / 变换 / **跨进程 codec**，
**进 seed**；编译器与后端插件都依赖它）；`packages/target-ocaml/` = OCaml 后端 `vuna-target-ocaml`
（`Vuna.Target.Ocaml.*`：IR→OCaml 文本，**进 seed**——编译器用它把自身编译成 OCaml）；
`packages/target-native/` / `packages/target-wasm/` = native / wasm 后端插件
（`Vuna.Target.{Native,Wasm}.*`，**不进 seed**：编译器按 `--target` 把 IR 编码后起子进程，
见 [cli.md](docs/reference/cli.md)「后端插件协议」）；`packages/plugin-web/` = web 应用插件
（二进制 `vuna-web`，复用 `vuna-web-cli` 的实现，提供 `vuna web …`）；`packages/dev/` = 开发/维护插件
（二进制 `vuna-dev`，提供 `vuna dev …`；suite / obs / 错误码文档 / IR dump，**不进 seed**）；`packages/base/` =
标准库 `vuna-base`（`Base.*` + `Prelude`，**进 seed**；跨包可见全部 `Base.*` 模块，
门面 `Base` / `Base.Data` / `Base.Trait` / `Base.Container` / `Base.Effect(.Core/.Pure)` /
`Prelude` 是推荐入口）；`packages/obs/` = 应用面观测库 `vuna-obs`（模块 `Obs`，生态包，
**不进 seed**，显式依赖后使用）；`packages/cli/` = 产品 CLI 包
`vuna`（工具链 Cli/Interp/Files/Fmt/Lint/Repl/Run/Doc/Index/Lsp/TestRunner 在 `packages/toolchain/lib/`，
入口 `packages/cli/app/Main.vuna`；**不进 seed**，二进制 `vuna` 只做发现与路由）；
`packages/toolchain/` = 产品工具链实现与命令接线表（二进制 `vuna-toolchain`）；
`packages/plugin-kit/` = 命令面数据模型、纯参数解析与 describe 协议（编译器与产品入口共用，只依赖 base）；
`packages/compiler/app/Main.vuna` 同时是 `vuna-compiler` 插件入口（与自举 stage-1 同一产物，`--vuna-describe` 供入口收集命令面）；
`seed/` = 提交入库的 OCaml 信任锚点（生成物，禁止手改、别读）；`wasm-host/` = wasm 产物的
WASI preview1 宿主（Node / 浏览器共用）与 Node loader（`vuna run --target wasm`、suite、bench 共用）；
`test/` = driver 清单
（`suite.toml`）+ runner 夹具/全局名单（`suite/`）；各包 `test/` = 独立 suite（`suite.toml` +
`corpus/` + `steps/`）与 `vuna test` 单元测试；`bench/`（仓库根）= 生成程序与编译器基准；
`examples/` = 多包示例；`.agents/` = AI 规则与技能；`vscode/` = VSCode 扩展（高亮 + LSP +
lint/fmt/check/build，`dist/` 提交）；`nix/` = 构建图（`build/`）+ CI 门禁（`checks/`）+
seed 工具（`seed/`）+ 开发工具（`tools/`）；`docs/` = 分层文档。

## 文档导航

- 子系统地图、改动定位、验证矩阵：[`docs/architecture.md`](docs/architecture.md)
- 终态方向、不变量与非目标：[`docs/architecture-target.md`](docs/architecture-target.md)
  （判断"某需求该不该进核心"先读它；现状见 architecture.md）
- 语言 / 类型 / 效应 / 标准库 / 包：[`docs/reference/`](docs/reference/)——逐页说明见
  [README 文档导航](README.md#文档导航)：frontend-syntax、language、type-system、qtt、records-traits、
  effects、stdlib、packages、package-store、primitives、operators
- 编译器实现：compiler、core、ir、diagnostics、wasm、native（运行时与边界见
  native-runtime，自举读数见 native-selfhost）、cache（同在 `docs/reference/`）
- 工具链 / 测试 / 自举：tooling、testing（门禁与基准见 testing-checks）、
  test-architecture、bootstrap（同在 `docs/reference/`）
- 性能与观测：[performance.md](docs/reference/performance.md)（量什么/读数；
  热点见 [performance-hotspots.md](docs/reference/performance-hotspots.md)）、
  [observability.md](docs/reference/observability.md)（`VUNA_OBS` 分级 / `vuna-obs` 的 `Obs` / `vuna dev obs` / `#line` → DWARF）、
  [logging.md](docs/reference/logging.md)（`log!` / `VUNA_LOG` / scope 过滤 / text·jsonl 输出）
- AI 规则与技能：[`.agents/README.md`](.agents/README.md)（规则 `rules/`、技能 `skills/`）
- 债务 / 已知缺口：[债务清单](https://github.com/vuna-lang/vuna/issues?q=label%3Adebt)（唯一清单，只含开放项、带证据；文档引用写 `gh#N`）
- 已决取舍：[`decisions.md`](docs/reference/decisions.md)（不再作为待办的设计决策）
- 外部先例与精化器对照：[`prior-art-elaboration.md`](docs/reference/prior-art-elaboration.md)
  （Idris 2 / Yaffle 的流水线、可推迟的合一、case tree、分层契约；vuna 的差距与候选调整）

> 文档分层规则：`README.md` 只保留定位/上手/目录/硬约束/导航；细节在 `docs/reference/`；
> AI 规则与场景技能在 `.agents/`；已完成阶段 / 已落地决策 / 历史在 git 历史。
