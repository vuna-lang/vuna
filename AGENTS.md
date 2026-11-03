# AGENTS.md — vuna 仓库的 AI agent 入口

本文件是仓库里**唯一固定的必读入口**。目标：用最少上下文定位到该改的地方，而不是通读全仓。

## 项目前提：没有兼容义务

**vuna 尚未发布任何版本**：没有外部用户、下游生态与历史包袱，全部源码都在本仓库内。
因此**任何设计、接口、命令、实现、哲学都允许被推翻**（包括本文件与 roadmap 已写下的
决策）；「保留兼容层」「以后可能有人依赖」不构成保留理由——评估一个遗留物只看一条：
**它在终态里还成立吗**。推翻旧决策时不要静默改写历史，在 roadmap 的「决策变更」表记
一行、里程碑记录进 `docs/history.md`（实现细节在 git 历史）。当前路线由此确定：**终态是单一 DT 路径，已在 M24 落地**
（唯一检查器与 codegen，roadmap「终态」与「阶段状态总览」）。

## 阅读顺序

1. `AGENTS.md`（本文件）——不变量、纪律、常用命令；
2. [`docs/architecture.md`](docs/architecture.md)——子系统地图：哪条链路、入口符号、连带改动、测试标签；
3. 需要时再下钻：[`docs/reference/`](docs/reference/)（language / type-system / stdlib / packages /
   compiler / bootstrap / testing / limits / dt）、[roadmap](docs/roadmap.md)、[dt-core](docs/dt-core.md)、[history](docs/history.md)。

**定位符号**用 `vuna map --find` / `--impact` / `vuna api`（用法见技能
`.agents/skills/repo-navigation/SKILL.md`）。**不要做的事**：通读全仓；读 `seed/` 或
`docs/api.md`（生成物）。

## 编译器选取规则

1. **优先**本地 `./result/bin/vuna`（`nix build .#vuna --out-link result` 的产物）；
2. 本地不存在或编译不过：**一律** `nix run vuna -- <subcommand>`（`nix registry list` 里的
   别名 `flake:vuna github:vuna-lang/vuna`，即远端稳定版）；
3. 测试：`nix run .#vuna-run-tests`（`nix/run-tests.nix`；`--list` / `--only <章节>` 过滤，
   无参数等价 `sh test/run-tests.sh`）。

`vuna-seed`（stage 0）来自 `nix build .#vuna-seed`，stage 1 是 `nix build .#vuna-compiler`；
测试需要 PATH 里有 `ocamlopt`（`nix develop` 提供）。

## 硬不变量（改坏了必须自己发现）

1. **当前 seed 必须能编译当前源码，且与源码同步**（compiler/base 改动必须 rotation）——`seed/` 是提交入库的信任锚点；
2. **seed rotation 后 stage1 == stage2**（文件集逐字节一致，fixed point）；
3. **`seed/` 只含 compiler 包入口闭包**（`compiler/app/Main.vuna` 的 import 闭包）；
4. **工具链不进 TCB**：`fmt`/`lint`/`repl`/`doc`/`test`/`Index`/`LSP`（以及未来的
   package manager）永不进入 seed 闭包；黑名单见 `nix/tcb-forbidden.txt`；
5. **效果内建按包 allowlist**：只有 `vuna` / `vuna-compiler` / `vuna-base` 可直接调用
   effectful 内建（`print`/`readFile`/`exit`/`prim_*` 等），其余包必须经 `Base.IO`
   （`Vuna.Compiler.Loader.Resolve.packageAllowsEffects`）；
6. **唯一路径**：语言夹具、`vuna interp`、包构建与 seed 全部走 DT（精化 + 擦除
   codegen，`vuna check .` 也是 DT 自检）；没有可切换的检查器，也没有第二套 codegen；
7. 编译器自检通过：`vuna check .` 必须能检查自身源码（`checks.vuna-typecheck`）。

## 纪律

- **禁止手改 `seed/`**：它是生成物；只能通过 seed rotation 更新
  （`sh nix/seed-rotate.sh ./result/bin/vuna`）。
- 允许 `git add` / `git commit`；`git checkout` / `git reset` 会丢工作树改动，执行前先确认。
  提交信息沿用仓库风格（`type(scope): 描述`）。
- **代码改动后跑 `vuna fmt <改动的文件/目录>`**：源码应与 fmt 输出一致（`--check` 省略
  PATH 时自动扫全部包的 `lib/app/test`；`test/corpus/` 夹具跳过）。
- **改 `compiler/` 后先验证“旧种子能编译新源码”**：`nix build .#vuna-seed` 或
  `nix flake check`（至少 `checks.seed-selfhost`）。要用的新语法先以旧语法落地 → rotate
  → 再用新语法。
- 不要为自测跑 `nix build` / `nix flake check`（慢，通常由 Lead/CI 负责）；改完优先用
  本地 `./result/bin/vuna` 做小范围验证。
- **探索按场景选工具**（规程见技能 `.agents/skills/repo-navigation/SKILL.md`）：要改的
  模块整篇 `read`；不改只引用的用 `vuna map` / `vuna api`，**不要 grep**（拿多拿少又没签名）。
- **探索完必须落盘**：数据流 / 不变量 / 边界写进 `docs/` 并接进导航，别只留在会话里。

## 常用命令速查

```console
nix build .#vuna --out-link result   # 产品 CLI；.#vuna-compiler / .#vuna-seed 同理
nix flake check                      # 12 项：3 packages + 9 checks
nix run .#vuna-run-tests [-- --list | --only dt]   # 原生测试；nix run .#vuna-bench -- --quick
vuna check .                         # 包级类型检查（自检）；vuna build . → .output/bin/<包名>
vuna fmt --check <PATH>...           # 格式化检查（务必显式给路径）；vuna lint <file>...
vuna doc [DIR [OUT]] | gen-errors [ROOT]  # API 文档 / 错误码文档（默认 docs/api.md / docs/.generated/errors.md，gitignored）
vuna interp <file.vuna>              # DT 精化 + 核心求值（纯；只展示 Int/String/Bool）
vuna seed <OUT> compiler             # 逐模块 DT split（必须显式 OUT；正式流程用 nix/seed-rotate.sh）
```

## 目录速览

`compiler/` = 编译器包（模块 `Vuna.Compiler.*`，入口 `app/Main.vuna`，**进 seed**）；
`base/` = 标准库 `vuna-base`（`Base.*` + `Prelude`，**进 seed**）；`lib/` = 根包工具链
（Cli/Interp/Files/Fmt/Lint/Repl/Doc/Index/Lsp/TestRunner，**不进 seed**）；`app/` = 产品
CLI 入口；`seed/` = 提交入库的多文件 OCaml 信任锚点（生成物，禁止手改、别读）；`test/` =
`run-tests.sh` + `corpus/` 夹具；`nix/` = 构建图（packages/checks）+ rotate/metrics/bench；`docs/` = 分层文档。

## 文档导航

- 子系统地图、改动定位：[`docs/architecture.md`](docs/architecture.md)
- 语言语义：[language.md](docs/reference/language.md)、[type-system.md](docs/reference/type-system.md)、
  [stdlib.md](docs/reference/stdlib.md)、[packages.md](docs/reference/packages.md)、
  [dt.md](docs/reference/dt.md)、[dt-parity.md](docs/reference/dt-parity.md)（历史证据）
- 编译器实现与 codegen：[compiler.md](docs/reference/compiler.md)；DT 工具链（洞目标、LSP、
  错误码体系与错误索引；`vuna gen-errors` 生成 `docs/.generated/errors.md`）：[dt-tooling.md](docs/reference/dt-tooling.md)
- 仓库探索（按场景选工具、探索后落盘）：技能 `.agents/skills/repo-navigation/SKILL.md`
- 自举与种子：[bootstrap.md](docs/reference/bootstrap.md)；测试与 CI：[testing.md](docs/reference/testing.md)；
  已知边界：[limits.md](docs/reference/limits.md)
- 技术债务与缺陷登记：[debt.md](docs/reference/debt.md)（M25–M30 关闭清单，A/B/C/D/E 五类）
- 路线图 / 历史 / DT 状态：[docs/roadmap.md](docs/roadmap.md)（「阶段状态总览」）、
  [docs/history.md](docs/history.md)、[docs/dt-core.md](docs/dt-core.md)

> 文档分层规则：`README.md` 只保留定位/上手/目录/硬约束/导航；细节在 `docs/reference/`；
> roadmap 的「已完成」只保留一句话摘要，里程碑历史在 `docs/history.md`（实现细节在 git 历史）。
