# AGENTS.md — vuna 仓库的 AI agent 入口

本文件是仓库里**唯一固定的必读入口**。目标：用最少上下文定位到该改的地方，而不是通读全仓。

## 项目前提：没有兼容义务

**vuna 尚未发布任何版本**：没有外部用户、下游生态与历史包袱，全部源码都在本仓库内。
因此**任何设计、接口、命令、实现、哲学都允许被推翻**（包括本文件写下的
决策）；「保留兼容层」「以后可能有人依赖」不构成保留理由——评估一个遗留物只看一条：
**它在终态里还成立吗**。推翻旧决策时在提交信息与对应主题页说明，不静默改写；已完成阶段
与历史细节在 git 历史。当前路线：**单一 DT 路径**（唯一检查器与 codegen）。

当前基线一句话：自举链（`seed/` → rotation → stage1 == stage2）与全工具链都已工作，
编译器自身用 vuna 写成；性能读数见 [performance.md](docs/reference/performance.md)，
未关闭的债务见 [debt.md](docs/reference/debt.md)。

## 阅读顺序

1. `AGENTS.md`（本文件）——不变量、纪律、常用命令；
2. [`docs/architecture.md`](docs/architecture.md)——子系统地图：哪条链路、入口符号、连带改动、测试标签；
3. 需要时再下钻：[`docs/reference/`](docs/reference/)（类型系统 / Core / 编译器 / 包 / 工具 / 测试参考页）、
   [debt](docs/reference/debt.md)。

**定位符号**用 `vuna map --find` / `--impact` / `vuna api`（规程见 repo-navigation 技能）；**不要做的事**：通读全仓、读 `seed/` 或 `docs/api.html`（生成物）。

## 编译器选取规则

1. **优先**本地 `./result/bin/vuna`（`nix build .#vuna --out-link result` 的产物）；
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
4. **工具链不进 TCB**：`fmt`/`lint`/`repl`/`doc`/`test`/`Index`/`LSP`（以及 package
   manager）永不进入 seed 闭包；黑名单见 `nix/tcb-forbidden.txt`；
5. **IO 是内建效应类型**：动作由 `prim_pureIO`/`prim_bindIO` 构造，只在 `main`（`v_main 0`）
   或 `runIO`/`prim_runIO`（需 `unsafe`）执行；效果原语 `prim_*` 需 `[capabilities] effects`；
   **特权边界**：`[capabilities]`/`[trust]` 与宿主层模块 `Base.IO.Host` 只允许
   `[package] privileged = true` 的包；用户包/ad-hoc 只能经 `Eff` + handler（见
   [effects.md](docs/reference/effects.md) §8.6）；
   **用户面效果只经 `Eff`**：运行入口只接受行已处理干净的动作（`runIOEff : Eff [] a -> IO a`，
   入口处未处理效应是类型错误，见 [effects.md](docs/reference/effects.md) §8.4/§8.6）；
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
- **Monad/Functor 组合**：类型有实例时统一用 `do` / `>>=` / `bind` / `pure` / `fmap` /
  `liftA2` / `ap` / `foldMap` / `mapM`（`pure` 在 `Base.Applicative`，`Base.Monad` 重导出），
  不新增 `pureX` / `bindX` / `andThen` 这类重复入口；例外（ST 线性 bind、编译器内部
  `Vuna.Compiler.Common.bind`（限定名调用））与长 do 链性能边界见 `docs/reference/records-traits.md`、
  [effects.md](docs/reference/effects.md) §8.4 与各主题页的已知边界。
- **探索完必须落盘**：数据流 / 不变量 / 边界写进 `docs/` 并接进导航，别只留在会话里；**git 线性历史**：优先 ff-only merge / rebase / cherry-pick / 挤压提交

## 常用命令速查

```console
nix build .#vuna --out-link result   # 产品 CLI；.#vuna-compiler / .#vuna-seed 同理
nix flake check                      # 17 项：3 packages + 14 checks（含 vscode-ext）
nix run .#vuna-run-tests [-- --list | --only dt]   # 原生 suite（vuna test --suite）；bench：.#vuna-bench --quick / .#vuna-perf --check
vuna check .                         # 包级类型检查（自检）；vuna build . → .output/bin/<包名>
vuna fmt --check <PATH>...           # 格式化检查（省略 PATH = workspace 各包 lib/app/test）；vuna lint <file>...
vuna doc [--check] [--package NAME] [DIR [OUT]]  # 生成单文件交互 HTML API 文档（默认 DIR/docs/api.html）
vuna gen-errors [ROOT]               # 从枚举真源生成错误码文档（默认 ROOT/docs/.generated/errors.md）
vuna clean-iface [--dry-run] [DIR]   # 批量删除 iface 缓存（默认源码旁生成：*.iface / .vuna-iface；DIR 默认 .）
vuna interp <file.vuna>              # DT 精化 + 核心求值（纯；只展示 Int/Nat/String/Bool）
vuna test [DIR] [--list|--filter PAT|--verbose|--fail-fast|--jobs N]  # 包内测试（--jobs N 文件级并行）；默认输出不变
vuna run [DIR] [--package NAME] [--no-build] [-- ARGS...]    # 增量 build + 执行入口（透传参数/退出码）
vuna repl [FILE|DIR|MODULE]          # 自动签名 / 行编辑（方向键/Ctrl-R）/ 颜色 / :type/:info/:search/:load/:reload/:browse
vuna repl --listen ADDR [TARGET]     # 常驻 REPL server（tcp:127.0.0.1:PORT | unix:PATH；JSON-RPC over Content-Length）
vuna repl --client ADDR              # 每次调用一发一收（stdin 的 JSON-RPC body → 响应 body）
vuna build --no-compile --out <OUT> compiler   # 逐模块 DT codegen 到目录（= vuna compile compiler <OUT>；rotation 用 nix/seed-rotate.sh）
vuna search [--type|--name|--doc] [--module PFX] [--limit N] [--json] <query...>  # 名称/docstring/类型检索
vuna map [...] | vuna api <Module.name>  # 模块总览 / 定位符号 / 改动影响面 / 签名面
```
## 目录速览

`compiler/` = 编译器包（`Vuna.Compiler.*`，入口 `app/Main.vuna`，**进 seed**）；`base/` =
标准库 `vuna-base`（`Base.*` + `Prelude`，**进 seed**）；`lib/` = 根包工具链（Cli/Interp/
Files/Fmt/Lint/Repl/Run/Doc/Index/Lsp/TestRunner，**不进 seed**）；`app/` = 产品 CLI 入口；
`seed/` = 提交入库的 OCaml 信任锚点（生成物，禁止手改、别读）；`test/` = `suite.toml` + `suite/`（原生 runner + steps 用例）+ `corpus/` 夹具 + `bench/` 生成程序基准；`vscode/` = VSCode 扩展（高亮 + LSP + lint/fmt/check/
build，`dist/` 提交）；`nix/` = 构建图 + rotate/metrics/bench；`docs/` = 分层文档。

## 文档导航

- 子系统地图、改动定位：[`docs/architecture.md`](docs/architecture.md)
- 语言与类型：[language.md](docs/reference/language.md)（语法/模块）、
  [type-system.md](docs/reference/type-system.md)（宇宙/索引族/依赖匹配/相等/擦除）、
  [qtt.md](docs/reference/qtt.md)（quantity/用量检查/线性数据）、
  [records-traits.md](docs/reference/records-traits.md)（记录/trait/do）、
  [effects.md](docs/reference/effects.md)（IO 内建效应/效应栈/运行时效应）、
  [stdlib.md](docs/reference/stdlib.md)、[packages.md](docs/reference/packages.md)、
  [primitives.md](docs/reference/primitives.md)（内建/原语/能力）、
  [operators.md](docs/reference/operators.md)（运算符=方法别名、实例落点规则）
- 编译器实现：[compiler.md](docs/reference/compiler.md)（模块与输出模型、接口摘要）、
  [diagnostics.md](docs/reference/diagnostics.md)（诊断模型/错误码/渲染/LSP/迁移状态）、
  [core.md](docs/reference/core.md)（Core TT / NbE / 精化器）；
  模块级缓存：[cache.md](docs/reference/cache.md)（TTC 式接口、失效判定、已知边界）
- 工具链（`goal` / LSP / `doc` / `search` / 错误码；`vuna gen-errors` 生成
  `docs/.generated/errors.md`）：[tooling.md](docs/reference/tooling.md)；API 文档与检索：
  [api-docs.md](docs/reference/api-docs.md)；lint：[lint.md](docs/reference/lint.md)；
  调试与运行时错误：[debugging.md](docs/reference/debugging.md)（片段/运行时报告/`dbg`/`assert`/`vuna run`/REPL）
- 仓库探索（按场景选工具、探索后落盘）：技能 `.agents/skills/repo-navigation/SKILL.md`
- 自举与种子：[bootstrap.md](docs/reference/bootstrap.md)；测试与 CI：[testing.md](docs/reference/testing.md)；
  性能：[performance.md](docs/reference/performance.md)
- 债务 / 能力缺口：[debt.md](docs/reference/debt.md)（只含开放项，带证据）

> 文档分层规则：`README.md` 只保留定位/上手/目录/硬约束/导航；细节在 `docs/reference/`；
> 已完成阶段 / 已落地决策 / 历史在 git 历史。
