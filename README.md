# vuna

vuna 是一个函数式编程语言，本仓库是它的编译器与工具链。

> **vuna 尚未发布任何版本**：没有外部用户、没有下游生态、没有历史包袱。全部源码都在
> 本仓库内，**任何设计、接口、命令、实现、哲学都允许被推翻**。终态是**单一依赖类型路径**
> （HM 检查器与 codegen 将被删除），见 [docs/roadmap.md](docs/roadmap.md)。

编译器完全用 vuna 自己写：编译器包 `compiler/`（`vuna-compiler`，模块 `Vuna.Compiler.*`，
含 Ast/Lexer/Parser/Loader/Typecheck/TypedCodegen/Core/Elab 与编译器驱动）+ 根包 `vuna`
（产品 CLI 与工具链 fmt/lint/repl/doc/test），标准库在独立的成员包 `base/`
（`vuna-base`，模块 `Base.*`，模块根 `base/lib/`）。`seed/` 只由 compiler 包的入口闭包
生成——**可固化成种子的部分与产品工具链明确分开**。仓库通过提交入库的 OCaml 种子自举，
构建、测试和语言演进都不依赖外部编译器。早期用于启动自举的 OCaml 实现 `vunax` 已在
M6 完成后删除；需要查看历史可从 git log 找到。

> **AI agent 请先读 [AGENTS.md](AGENTS.md)**；架构与改动定位见
> [docs/architecture.md](docs/architecture.md)。本 README 只保留定位、上手、目录、
> 硬约束与文档导航。

## 30 秒上手

```console
nix develop                                    # OCaml 工具链 + vuna-seed
nix build .#vuna --out-link result             # 产品 CLI（stage 1）
./result/bin/vuna help

# 单文件：写、查、解释执行、生成 OCaml 并编译运行
cat > hello.vuna <<'EOF'
main : Int
main = 1 + 2 * 3
EOF
./result/bin/vuna check hello.vuna             # 类型检查
./result/bin/vuna interp hello.vuna            # -> 7
./result/bin/vuna compile hello.vuna hello.ml  # 生成 OCaml
ocamlopt -o hello hello.ml && ./hello          # -> 7

# 包模式：可执行入口 main : IO a（IO 来自 vuna-base 依赖），构建产出 .output/bin/<包名>
./result/bin/vuna build examples/multi         # 现成的多包示例（根包 + greet + base 依赖）
examples/multi/.output/bin/multi               # -> hi hi hi|n2 n1
./result/bin/vuna check examples/multi         # 包级类型检查
./result/bin/vuna test examples/multi          # 跑包内 test/*.vuna（main : String，空串通过）

# 测试 / 格式化 / 文档
nix run .#vuna-run-tests                            # 原生测试（= sh test/run-tests.sh）
nix run .#vuna-run-tests -- --list                  # 列出章节（--only <章节> 只跑某段）
./result/bin/vuna fmt --check examples/multi   # 格式化检查（也可逐个给文件/目录）
./result/bin/vuna lint compiler/lib/Vuna/Compiler/*.vuna   # 风格检查（必须给路径）
./result/bin/vuna doc                          # 生成 docs/api.md（gitignored）
```

自己新建一个包时：`vuna.toml`（`[package]` + `[dependencies]`）加 `app/Main.vuna`，
入口写 `main : IO a`；`println` / `readFile` 等效果 API 来自 `Base.IO`
（`import Base.IO`，包需依赖 `vuna-base`）。完整包格式见
[docs/reference/packages.md](docs/reference/packages.md)，示例见 `examples/multi/`。

不知道用哪个编译器时：优先本地 `./result/bin/vuna`；本地没有或编译不过，一律
`nix run vuna -- <subcommand>`（注册表别名指向 `github:vuna-lang/vuna`）。

## 工具与自举链

| 工具 | 作用 |
| --- | --- |
| `vuna-seed` | stage 0：从多文件种子 `seed/`（`seed/build.sh` + ocamlopt）构建的种子编译器 |
| `vuna-compiler` | stage 1 编译器（从 `compiler/` 包级 codegen + ocamlopt）：`compile/check/build[--split]/seed` + `compile --package` |
| `vuna` | 产品 CLI：工具链 + 编译器命令（in-process 调用 compiler 库） |

自举链：`seed/` →（`seed/build.sh` + ocamlopt）→ `vuna-seed` →（`compile --package`）→
`vuna-compiler` →（`build .`）→ `vuna`；再用 `build --split` 生成两级文件集，
逐字节相等即 fixed point。链条图、rotation 流程与不变量见
[bootstrap.md](docs/reference/bootstrap.md)。

命令一览（每个命令都必须显式书写，不再支持“无子命令 = compile”的旧式回退）：

```console
vuna compile [--dt] [--no-print] [--root DIR]... <entry.vuna> [out.ml]
vuna compile --package [--out OUT] [DIR]  # 包级 codegen（默认 OUT=DIR/.output）
vuna check [--dt] [--root DIR]... (<entry.vuna> | <package-dir>)
vuna build [--no-compile] [DIR]           # 包级 codegen + ocamlopt → .output/bin/<包名>
vuna build --split OUT [DIR]              # 扁平分离编译
vuna seed [OUT [DIR]]                     # 生成扁平多文件 seed 文件集
vuna lint [--fix] <file.vuna>...
vuna interp [--dt] [--root DIR]... <file.vuna>
vuna test [DIR]                           # 解释执行 test/*.vuna（main : String，空串通过）
vuna fmt [--check] [PATH]...
vuna repl [--root DIR]...
vuna doc [DIR [OUT]]                      # 默认 DIR/docs/api.md
vuna map [--modules]                      # 模块总览（索引缓存在 .local/index/）
vuna map --find <Module.name>             # 定位符号：定义位置 + 签名
vuna map --impact <Module.name>           # 改动影响面：引用者模块 + 建议测试
vuna api <Module.name>                    # 某模块的签名面（含注释与行号）
vuna help, -h
```

`vuna-compiler` 是同一套编译器命令的独立 CLI（seed 的来源），参数与 `vuna` 的同名命令一致。
`vuna` 的编译命令直接调用 `Vuna.Compiler.CompilerCli` 的库实现（in-process 调库，不 fork
`vuna-compiler`）；`vuna build` 通过受限的进程执行内建调用 `.output/build.sh`（ocamlopt），
除此之外无额外运行时依赖。`vuna interp` 保留“不检查执行”的调试语义（普通程序直接求值；
record / trait / deriving 程序会先类型检查并降级）。省略 `--root` 时使用当前目录包的模块根；
`--root` 用于原始文件模式（编译器自举、测试夹具）显式指定模块根。包模式会自动导入
`Prelude`。命令语义与包格式见 [packages.md](docs/reference/packages.md)，语言语义见
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
3. **`seed/` 只含 compiler 包入口闭包**：工具链（fmt/lint/repl/doc/test，以及未来的
   `Index` / LSP / package manager）不进 TCB；`checks.seed-selfhost` 按
   `nix/tcb-forbidden.txt` 断言；
4. **效果内建按包 allowlist**：只有 `vuna` / `vuna-compiler` / `vuna-base` 可直接调用
   effectful 内建，其余包必须经 `Base.IO`（`Vuna.Compiler.Loader.packageAllowsEffects`）；
5. **迁移期双路径零回归，终态单路径**：M18.5–M23 期间 HM（interp + typed + split）与 DT
   （core evaluator + 擦除 codegen）都必须保持通过；**M24 之后 HM 模块删除**、`--dt`
   开关消失，只剩一条路径。当前处于迁移期；
6. 编译器自检通过：`vuna check .` 能检查自身源码（`checks.vuna-typecheck`）；
7. `seed/` 下所有文件都是生成物，禁止手改；只能通过 seed rotation 更新。

完整不变量、纪律与种子轮换流程见 [AGENTS.md](AGENTS.md) 与
[docs/reference/bootstrap.md](docs/reference/bootstrap.md)。

## 文档导航

| 文档 | 内容 |
| --- | --- |
| [AGENTS.md](AGENTS.md) | AI agent 唯一固定入口：阅读顺序、不变量、纪律、命令速查 |
| [docs/architecture.md](docs/architecture.md) | 子系统地图：HM / DT / 包 / 工具链 / 自举五条链路，入口符号、连带改动、测试标签 |
| [docs/reference/language.md](docs/reference/language.md) | core-v0 语法、模块系统、import 与导出规则 |
| [docs/reference/type-system.md](docs/reference/type-system.md) | 记录类型、trait 与实例、`do` / Monad / Functor |
| [docs/reference/stdlib.md](docs/reference/stdlib.md) | 标准库 `vuna-base` 模块清单与 `Prelude` 自动导入 |
| [docs/reference/packages.md](docs/reference/packages.md) | `vuna.toml` 包格式、workspace / 依赖 DAG、工具链命令一览 |
| [docs/reference/dt.md](docs/reference/dt.md) | DT 子集（M14）：索引归纳族、依赖模式匹配、硬边界与夹具 |
| [docs/reference/dt-parity.md](docs/reference/dt-parity.md) | DT 取代 HM 的能力落差证据表（含 lambda 擦除缺陷与用量统计） |
| [docs/reference/compiler.md](docs/reference/compiler.md) | 编译器模块职责、codegen 表示与优化、机器无关指标 |
| [docs/reference/bootstrap.md](docs/reference/bootstrap.md) | 种子策略、rotation 流程、fixed point、TCB 边界 |
| [docs/reference/testing.md](docs/reference/testing.md) | 测试体系、corpus 分类、nix checks 清单、性能基准 |
| [docs/reference/limits.md](docs/reference/limits.md) | 当前限制与已知边界（编译模型 / IO / 工具链细节） |
| [docs/history.md](docs/history.md) | 里程碑历史与已完成阶段细节 |
| [docs/roadmap.md](docs/roadmap.md) | 路线图：终态（单一 DT 路径）+ M18.5–M28 规划 + 决策变更表 |
| [docs/dt-core.md](docs/dt-core.md) | DT 核心类型论与精化器设计稿（M13–M14） |

文档分层规则：README 只保留定位/上手/目录/硬约束/导航；细节在 `docs/reference/`；
roadmap 的「已完成」只保留一句话摘要，历史细节在 `docs/history.md`。

## 许可

MIT（见 [LICENSE](LICENSE)）。
