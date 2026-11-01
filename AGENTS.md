# AGENTS.md — vuna 仓库的 AI agent 入口

本文件是仓库里**唯一固定的必读入口**。目标：用最少上下文定位到该改的地方，而不是通读全仓。

## 项目前提：没有兼容义务

**vuna 尚未发布任何版本**：没有外部用户、下游生态与历史包袱，全部源码都在本仓库内。
因此**任何设计、接口、命令、实现、哲学都允许被推翻**（包括本文件与 roadmap 已写下的
决策）；「两条路径并存」「保留兼容层」「以后可能有人依赖」都不构成保留理由——评估一个
遗留物只看一条：**它在终态里还成立吗**。推翻旧决策时不要静默改写历史，在 roadmap 的
「决策变更」表记一行、细节进 `docs/history.md`。当前路线由此确定：**终态是单一 DT
路径，HM 检查器与 codegen 将被删除**（roadmap「终态」与 M18.5–M24）。

## 阅读顺序

1. `AGENTS.md`（本文件）——不变量、纪律、常用命令；
2. [`docs/architecture.md`](docs/architecture.md)——子系统地图：哪条链路、入口符号、连带改动、测试标签；
3. 需要时再下钻：[`docs/reference/`](docs/reference/)（language / type-system / stdlib / packages /
   compiler / bootstrap / testing / limits / dt）、[`docs/roadmap.md`](docs/roadmap.md)、
   [`docs/dt-core.md`](docs/dt-core.md)、[`docs/history.md`](docs/history.md)。

**定位符号**用 `vuna map --find` / `--impact` / `vuna api`（用法见技能
`.agents/skills/repo-navigation/SKILL.md`）。**不要做的事**：通读全仓；读 `seed/` 或
`docs/api.md`（生成物）。

## 编译器选取规则

1. **优先**本地 `./result/bin/vuna`（`nix build .#vuna --out-link result` 的产物）；
2. 本地不存在或编译不过：**一律** `nix run vuna -- <subcommand>`（`nix registry list` 里的
   别名 `flake:vuna github:vuna-lang/vuna`，即远端稳定版）；
3. 测试：`nix run .#run-tests`（`nix/run-tests.nix`；`--list` / `--only <章节>` 过滤，
   无参数等价 `sh test/run-tests.sh`）。

`vuna-seed`（stage 0）来自 `nix build .#vuna-seed`，stage 1 是 `nix build .#vuna-compiler`；
测试需要 PATH 里有 `ocamlopt`（`nix develop` 提供）。

## 硬不变量（改坏了必须自己发现）

1. **当前 seed 必须能编译当前源码**——`seed/` 是提交入库的信任锚点；
2. **seed rotation 后 stage1 == stage2**（文件集逐字节一致，fixed point）；
3. **`seed/` 只含 compiler 包入口闭包**（`compiler/app/Main.vuna` 的 import 闭包）；
4. **工具链不进 TCB**：`fmt`/`lint`/`repl`/`doc`/`test`/`Index`（以及未来的 LSP、
   package manager）永不进入 seed 闭包；blacklist 见 `nix/seed-rotate.sh` 与 `flake.nix`
   的 `forbidden` 清单：`Cli Fmt Lint Doc Repl TestRunner Files Eval Interp Process Codegen Index Lsp Json`；
5. **效果内建按包 allowlist**：只有 `vuna` / `vuna-compiler` / `vuna-base` 可直接调用
   effectful 内建（`print`/`readFile`/`exit`/`prim_*` 等），其余包必须经 `Base.IO`
   （`Vuna.Compiler.Loader.packageAllowsEffects`）；
6. **迁移期双路径零回归，终态单路径**：M18.5–M23 期间 HM（interp + typed + split）与
   DT（core evaluator + 擦除 codegen）都必须保持通过；**M24 之后 HM 模块删除**，
   `--dt` 开关消失，只剩一条路径。当前处于迁移期，先按双路径守门；
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
nix flake check                      # tests/package/metrics/typecheck/lint/seed-selfhost
nix run .#run-tests [-- --list | --only dt]   # 原生测试；nix run .#bench -- --quick 性能基准
vuna check .                         # 包级类型检查（自检）；vuna build . → .output/bin/<包名>
vuna fmt --check <PATH>...           # 格式化检查（务必显式给路径）；vuna lint <file>...
vuna doc [DIR [OUT]]                 # API 文档（默认 DIR/docs/api.md，gitignored）
vuna interp <file.vuna>              # 解释执行（调试语义）
vuna seed seed compiler              # 重新生成 seed（正式流程用 nix/seed-rotate.sh）
```

## 目录速览

`compiler/` = 编译器包（模块 `Vuna.Compiler.*`，入口 `app/Main.vuna`，**进 seed**）；
`base/` = 标准库 `vuna-base`（`Base.*` + `Prelude`，**进 seed**）；`lib/` = 根包工具链
（Cli/Interp/Eval/Files/Fmt/Lint/Repl/Doc/Index/TestRunner，**不进 seed**）；`app/` = 产品
CLI 入口；`seed/` = 提交入库的多文件 OCaml 信任锚点（生成物，禁止手改、别读）；`test/` =
`run-tests.sh` + `corpus/` 夹具；`nix/` = rotate/metrics/bench/run-tests；`docs/` = 分层文档。

## 文档导航

- 子系统地图、改动定位：[`docs/architecture.md`](docs/architecture.md)
- 语言语义：[language.md](docs/reference/language.md)、[type-system.md](docs/reference/type-system.md)、
  [stdlib.md](docs/reference/stdlib.md)、[packages.md](docs/reference/packages.md)、
  [dt.md](docs/reference/dt.md)、[dt-parity.md](docs/reference/dt-parity.md)（DT 取代 HM 的落差证据）
- 编译器实现与 codegen：[compiler.md](docs/reference/compiler.md)；DT 工具链（洞目标、LSP、
  错误索引）：[dt-tooling.md](docs/reference/dt-tooling.md)
- 仓库探索（按场景选工具、探索后落盘）：技能 `.agents/skills/repo-navigation/SKILL.md`
- 自举与种子：[bootstrap.md](docs/reference/bootstrap.md)；测试与 CI：[testing.md](docs/reference/testing.md)；
  已知边界：[limits.md](docs/reference/limits.md)
- 路线图 / 历史：[docs/roadmap.md](docs/roadmap.md)、[docs/history.md](docs/history.md)、
  [docs/dt-core.md](docs/dt-core.md)

> 文档分层规则：`README.md` 只保留定位/上手/目录/硬约束/导航；细节在 `docs/reference/`；
> roadmap 的「已完成」只保留一句话摘要，历史细节在 `docs/history.md`。
