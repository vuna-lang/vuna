# vuna

vuna 是一个函数式编程语言，本仓库是它的编译器与工具链。

> **vuna 尚未发布任何版本**：没有外部用户、下游生态与历史包袱，全部源码都在本仓库内，
> **任何设计、接口、命令、实现、哲学都允许被推翻**。终态是**单一依赖类型路径**（唯一
> 检查器与 codegen），见 [docs/roadmap.md](docs/roadmap.md)。

编译器完全用 vuna 自己写：编译器包 `compiler/`（`vuna-compiler`，模块 `Vuna.Compiler.*`）
+ 根包 `vuna`（产品 CLI 与工具链 fmt/lint/repl/doc/test/lsp）+ 成员包 `base/`（`vuna-base`，
模块根 `base/lib/`）。`seed/` 只由 compiler 包的入口闭包生成——**可固化成种子的部分与产品
工具链明确分开**。仓库通过提交入库的 OCaml 种子自举，构建、测试和语言演进都不依赖外部
编译器；早期启动用的 OCaml 实现 `vunax` 已在 M6 后删除（历史见 git log）。

> **AI agent 请先读 [AGENTS.md](AGENTS.md)**；架构与改动定位见
> [docs/architecture.md](docs/architecture.md)。本 README 只保留定位、上手、目录、
> 硬约束与文档导航。

## 30 秒上手

```console
nix develop                                    # OCaml 工具链 + vuna-seed
nix build .#vuna --out-link result             # 产品 CLI（stage 1）
./result/bin/vuna help

# ad-hoc 单文件：无 manifest 时自动用 base 上下文并注入 Prelude
cat > hello.vuna <<'EOF'
main : Int
main = 1 + 2 * 3
EOF
./result/bin/vuna check hello.vuna               # 类型检查
./result/bin/vuna interp hello.vuna              # -> 7
./result/bin/vuna compile hello.vuna hello-out   # 逐模块 .ml + build.sh 写到 hello-out/
sh hello-out/build.sh hello && ./hello-out/hello # -> 7

# 包模式：目录入口只认该目录自己的 vuna.toml；可执行入口 main : IO a，构建产出 DIR/bin/<包名>
./result/bin/vuna build examples/multi         # 现成的多包示例（根包 + greet + base 依赖）
examples/multi/.output/bin/multi               # -> hi hi hi|n2 n1（--out 可覆盖输出目录）
./result/bin/vuna check examples/multi         # 包级类型检查
./result/bin/vuna test examples/multi          # 跑包内 test/*.vuna（main : String，空串通过）

# 测试 / 格式化 / 文档
nix run .#vuna-run-tests                            # 原生测试（= sh test/run-tests.sh）
nix run .#vuna-run-tests -- --list                  # 列出章节（--only <章节> 只跑某段）
./result/bin/vuna fmt --check examples/multi   # 格式化检查（也可逐个给文件/目录）
./result/bin/vuna lint compiler/lib/Vuna/Compiler/Elab/Term.vuna   # 风格检查（必须给路径）
./result/bin/vuna doc                          # 生成 docs/api.md（gitignored）
```

自己新建包：`vuna.toml` + `app/Main.vuna`，入口 `main : IO a`；效果 API 来自 `Base.IO`
（需依赖 `vuna-base`）。格式见 [packages.md](docs/reference/packages.md)，示例见 `examples/multi/`。

不知道用哪个编译器时：优先本地 `./result/bin/vuna`；本地没有或编译不过，一律
`nix run vuna -- <subcommand>`（注册表别名指向 `github:vuna-lang/vuna`）。

## 工具与自举链

| 工具 | 作用 |
| --- | --- |
| `vuna-seed` | stage 0：从多文件种子 `seed/`（`seed/build.sh` + ocamlopt）构建的种子编译器 |
| `vuna-compiler` | stage 1 编译器（从 `compiler/` 做 DT 逐模块 codegen + ocamlopt）：`compile/check/build` |
| `vuna` | 产品 CLI：工具链 + 编译器命令（in-process 调用 compiler 库） |

自举链：`seed/` →（`seed/build.sh` + ocamlopt）→ `vuna-seed` →（`build --no-compile --out s1 compiler`）
→ stage1 →（`build --no-compile --out s2 compiler`）→ 两级文件集逐字节相等即 fixed point；
stage1 的 `vuna-compiler build .` 产出 `.output/bin/vuna`。流程见 [bootstrap.md](docs/reference/bootstrap.md)。

命令一览（每个命令都必须显式书写，不再支持“无子命令 = compile”的旧式回退）：

```console
vuna compile [--no-print] (<entry.vuna> | <package-dir>) OUTDIR  # 逐模块 codegen 到目录；成功静默
vuna check (<entry.vuna> | <package-dir>)
vuna build [--no-compile] [--out DIR] [PKG-DIR]  # 默认 `<PKG-DIR>/.output`；跑 build.sh → 输出目录/bin/<包名>
vuna lint [--fix] <file.vuna>...
vuna interp <file.vuna>                   # 精化后核心求值（纯；不执行效果）
vuna test [DIR]                           # 运行 test/*.vuna（DT 核心求值，main : String 空串通过）
vuna fmt [--check] [PATH]...
vuna repl
vuna doc [DIR [OUT]]                      # 默认 DIR/docs/api.md
vuna map [...] | vuna api <Module.name>  # 模块总览 / 定位符号 / 改动影响面 / 签名面
vuna help, -h
```

`vuna-compiler` 是同一套编译器命令的独立 CLI（seed 的来源），参数与 `vuna` 的同名命令一致。
`vuna` 的编译命令直接调用 `Vuna.Compiler.Driver.CompilerCli` 的库实现（in-process 调库，不 fork
`vuna-compiler`）；`vuna build` 在 codegen 后执行生成的 `build.sh`（内部经受限的进程执行内建
`prim_runIn` 调 `ocamlopt`），产出 `DIR/bin/<包名>`，除此之外无额外运行时依赖。`vuna interp`
是**DT 精化 + 核心求值**：先按 DT 检查再求 `main` 的值，只展示 `Int`/`String`/`Bool`；任何
`main : IO a` 一律明确报错（核心求值器不执行效果），请改用 `compile` + 运行产物。

**包上下文是唯一的加载语义**：每个源文件向上找最近的 `vuna.toml`（该包 + 依赖闭包解析
import）；无 manifest 时只有 base 上下文（`VUNA_BASE` 覆盖，否则按可执行文件相对布局
`<exeDir>/base`、`../base`、`../../base`、`../../../base` 探测，失败明确报错），ad-hoc 单
文件与包内模块一样自动注入 `Prelude`。目录入口（`check/build <dir>`）只认该目录自己的
manifest，不向上找。环境根开关、raw 模式、`--split` 与 `seed` 均已删除（提示见上）。命令
语义与包格式见 [packages.md](docs/reference/packages.md)，语言语义见
[language.md](docs/reference/language.md)。

## 目录结构

```text
.
├── compiler/  # 编译器包 vuna-compiler（seed 唯一来源）：app/Main.vuna + lib/Vuna/Compiler/
├── base/      # 成员包 vuna-base：lib/Base.*、Prelude.vuna
├── lib/       # 产品 CLI 包 vuna 的模块根（工具链 Vuna.*）
├── app/       # 产品 CLI 入口 main : IO Int
├── seed/      # compiler 闭包的多文件自举信任锚点（生成物，禁止手改）
├── test/      # run-tests.sh + corpus/ 夹具
├── examples/  # 多包示例
├── nix/       # 构建图（packages/checks）+ rotate/metrics/bench
├── docs/      # 分层文档（见 AGENTS.md 导航）
├── vuna.toml  # workspace 根（同时是产品 CLI 包）；members: compiler/base
└── flake.nix  # 输入与 outputs 委托（构建图在 nix/）
```

逐模块职责见 [docs/architecture.md](docs/architecture.md)。仓库本身是一个 workspace
（Cargo 风格：根目录同时是包）：根包 `vuna` 依赖成员包 `vuna-compiler`（模块根
`compiler/lib/`）与 `vuna-base`（模块根 `base/lib/`）。三者都是 vuna 模块根，不是 OCaml
库目录；`app/` 是纯入口目录。仓库里没有任何 dune/OCaml 项目，只用 `ocamlopt` 编译生成的
种子和程序。

## 硬约束（改坏了 CI 会失败）

1. **当前 seed 必须能编译当前源码**——`seed/` 是提交入库的信任锚点；
2. **seed rotation 后 stage1 == stage2**（文件集逐字节一致，fixed point）；
3. **`seed/` 只含 compiler 包入口闭包**：工具链（fmt/lint/repl/doc/test/Index/LSP，
   以及未来的 package manager）不进 TCB；`checks.seed-selfhost` 按
   `nix/tcb-forbidden.txt` 断言；
4. **效果内建按包 allowlist**：只有 `vuna` / `vuna-compiler` / `vuna-base` 可直接调用
   effectful 内建，其余包必须经 `Base.IO`（`Vuna.Compiler.Loader.Resolve.packageAllowsEffects`）；
5. **唯一路径**：语言夹具、`vuna interp`、包构建与 seed 全部走 DT（精化 + 擦除
   codegen，`vuna check .` 也是 DT 自检）；没有可切换的检查器，也没有第二套 codegen；
6. 编译器自检通过：`vuna check .` 能检查自身源码（`checks.vuna-typecheck`）；
7. `seed/` 下所有文件都是生成物，禁止手改；只能通过 seed rotation 更新。

完整不变量、纪律与种子轮换流程见 [AGENTS.md](AGENTS.md) 与
[docs/reference/bootstrap.md](docs/reference/bootstrap.md)。

## 文档导航

| 文档 | 内容 |
| --- | --- |
| [AGENTS.md](AGENTS.md) | AI agent 唯一固定入口：阅读顺序、不变量、纪律、命令速查 |
| [docs/architecture.md](docs/architecture.md) | 子系统地图：编译链（DT 精化 + 擦除 codegen）/ 包 / 工具链 / LSP / 自举，入口符号、连带改动、测试标签 |
| [docs/reference/language.md](docs/reference/language.md) | core-v0 语法、模块系统、import 与导出规则 |
| [docs/reference/type-system.md](docs/reference/type-system.md) | 记录类型、trait 与实例、`do` / Monad / Functor |
| [docs/reference/stdlib.md](docs/reference/stdlib.md) | 标准库 `vuna-base` 模块清单与 `Prelude` 自动导入 |
| [docs/reference/packages.md](docs/reference/packages.md) | `vuna.toml` 包格式、workspace / 依赖 DAG、工具链命令一览 |
| [docs/reference/dt.md](docs/reference/dt.md) | DT 子集：索引归纳族、依赖模式匹配、硬边界与夹具（当前状态见 roadmap 总览） |
| [docs/reference/dt-tooling.md](docs/reference/dt-tooling.md) | DT 工具链：`vuna goal` 洞目标、LSP、`vuna doc`、错误码体系（`vuna gen-errors` 生成 `docs/.generated/errors.md`）与错误索引 |
| [docs/reference/dt-parity.md](docs/reference/dt-parity.md) | DT 取代 HM 的历史证据表（含 lambda 擦除缺陷与用量统计；当前状态见 roadmap 总览） |
| [docs/reference/compiler.md](docs/reference/compiler.md) | 编译器模块职责、codegen 表示与优化、机器无关指标 |
| [docs/reference/bootstrap.md](docs/reference/bootstrap.md) | 种子策略、rotation 流程、fixed point、TCB 边界 |
| [docs/reference/testing.md](docs/reference/testing.md) | 测试体系、corpus 分类、nix checks 清单、性能基准；性能工程见 [performance.md](docs/reference/performance.md) |
| [docs/reference/limits.md](docs/reference/limits.md) | 当前限制与已知边界（编译模型 / IO / 工具链细节） |
| [docs/reference/debt.md](docs/reference/debt.md) | 技术债务与缺陷登记（A 旧架构 / B 临时决定 / C bug / D 未实现 / E 基建，按 M25–M30 关闭） |
| [docs/history.md](docs/history.md) | 里程碑历史（一览；实现细节在 git 历史） |
| [docs/roadmap.md](docs/roadmap.md) | 路线图：终态 + 正本清源阶段（M25–M30）+ 不排期轨道（F1–F4）+ 决策变更表 |
| [docs/dt-core.md](docs/dt-core.md) | DT 核心类型论与精化器设计稿（M13–M14） |

文档分层规则：README 只保留定位/上手/目录/硬约束/导航；细节在 `docs/reference/`；
roadmap 的「已完成」只保留一句话摘要，里程碑历史在 `docs/history.md`（实现细节在 git 历史）。

## 许可

MIT（见 [LICENSE](LICENSE)）。
