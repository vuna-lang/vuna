# vuna

vuna 是一个函数式编程语言，本仓库是它的编译器与工具链。

> **vuna 尚未发布任何版本**：没有外部用户、下游生态与历史包袱，全部源码都在本仓库内，
> **任何设计、接口、命令、实现、哲学都允许被推翻**。终态是**单一依赖类型路径**（唯一
> 检查器与 codegen），见 [docs/roadmap.md](docs/roadmap.md)。

编译器完全用 vuna 自己写：编译器包 `compiler/`（`vuna-compiler`，模块 `Vuna.Compiler.*`）
+ 根包 `vuna`（产品 CLI 与工具链 fmt/lint/repl/doc/test/lsp）+ 成员包 `base/`（`vuna-base`）。
`seed/` 只由 compiler 包的入口闭包生成——**可固化成种子的部分与产品工具链明确分开**；
仓库通过提交入库的 OCaml 种子自举，不依赖外部编译器。

> **AI agent 请先读 [AGENTS.md](AGENTS.md)**；架构与改动定位见
> [docs/architecture.md](docs/architecture.md)。本 README 只保留定位、上手、目录、
> 硬约束与文档导航。

## 30 秒上手

```console
nix develop                                    # OCaml 工具链 + vuna-seed
nix build .#vuna --out-link result             # 产品 CLI（stage 1）
./result/bin/vuna help

# ad-hoc 单文件：无 manifest 时只有 base 上下文，自动注入 Prelude
cat > hello.vuna <<'EOF'
main : Int
main = 1 + 2 * 3
EOF
./result/bin/vuna check hello.vuna               # 类型检查
./result/bin/vuna interp hello.vuna              # -> 7
./result/bin/vuna compile hello.vuna hello-out   # 逐模块 .ml + build.sh 写到 hello-out/
sh hello-out/build.sh hello && ./hello-out/hello # -> 7

# 包模式：入口 main : IO a，构建产出 DIR/bin/<包名>
./result/bin/vuna build examples/multi         # 现成的多包示例（根包 + greet + base 依赖）
examples/multi/.output/bin/multi               # -> hi hi hi|n2 n1（--out 可覆盖输出目录）
./result/bin/vuna check examples/multi         # 包级类型检查
./result/bin/vuna test examples/multi          # 纯 String/Int/Bool 走 interp；main : IO ... 走 compile+运行

# 测试 / 格式化 / 文档
nix run .#vuna-run-tests                            # 原生测试（= sh test/run-tests.sh）
nix run .#vuna-run-tests -- --list                  # 列出章节（--only <章节> 只跑某段）
./result/bin/vuna fmt --check examples/multi   # 格式化检查（也可逐个给文件/目录）
./result/bin/vuna lint compiler/lib/Vuna/Compiler/Elab/Term.vuna   # 风格检查（必须给路径）
./result/bin/vuna doc                          # 生成 docs/api.html（gitignored）
```

自己新建包：`vuna.toml` + `app/Main.vuna`，入口 `main : IO a`，效果 API 来自 `Base.IO`。
格式见 [packages.md](docs/reference/packages.md)，示例见 `examples/multi/`。

编译器选取：优先本地 `./result/bin/vuna`；否则 `nix run vuna -- <subcommand>`（注册表别名）。

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
vuna test [DIR] [--list|--filter PAT|--verbose|--fail-fast]  # 运行 test/*.vuna（main : String 空串通过）
vuna run [DIR] [--package NAME] [--no-build] [-- ARGS...]    # 增量 build + 执行 .output/bin/<包名>
vuna fmt [--check] [PATH]...
vuna repl
vuna doc [--check] [--package NAME] [DIR [OUT]]  # 默认 DIR/docs/api.html
vuna search [--type|--name|--doc] [--module PFX] [--limit N] [--json] <query...>
vuna map [...] | vuna api <Module.name>  # 模块总览 / 定位符号 / 改动影响面 / 签名面
vuna help, -h
```

`vuna-compiler` 是同一套编译器命令的独立 CLI（seed 的来源），参数与 `vuna` 的同名命令一致。
`vuna` 的编译命令直接调用 `Vuna.Compiler.Driver.CompilerCli` 的库实现（in-process 调库，不
fork `vuna-compiler`）；`vuna build` 在 codegen 后执行生成的 `build.sh`（经受限进程执行内建
`prim_runIn` 调 `ocamlopt`）产出 `DIR/bin/<包名>`，无额外运行时依赖。`vuna interp` 是
**DT 精化 + 核心求值**：先按 DT 检查再求 `main` 的值，只展示 `Int`/`String`/`Bool`；任何
`main : IO a` 一律明确报错（核心求值器不执行效果），请改用 `compile` + 运行产物。

**包上下文是唯一的加载语义**：每个源文件向上找最近的 `vuna.toml`（该包 + 依赖闭包解析
import）；无 manifest 时只有 base 上下文（`VUNA_BASE` 覆盖，否则按可执行文件相对布局
探测），ad-hoc 单文件自动注入 `Prelude`。目录入口（`check/build <dir>`）只认该目录自己的
manifest，不向上找。命令语义与包格式
（含 `[capabilities]`）见 [packages.md](docs/reference/packages.md)，语言语义见
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
├── vscode/    # VSCode 扩展（语法高亮 + LSP 客户端 + lint/fmt/check/build；提交 dist/）
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

1. **当前 seed 必须能编译当前源码**，rotation 后 stage1 == stage2（fixed point）；
2. **`seed/` 只含 compiler 包入口闭包**：工具链不进 TCB（`nix/tcb-forbidden.txt`）；
3. **效果原语返回 `IO` 动作**：包在 `[capabilities] effects` 声明
   `console`/`fs`/`process`/`env`/`clock`/`unsafe` 后才能直接调用 effectful `prim_*`，
   否则经 `Base.IO`；动作只在 `main` 执行（`Intrinsics` + `checkEffectsBuiltins`，没有包名
   allowlist）；
4. **唯一路径**：语言夹具、`vuna interp`、包构建与 seed 全部走 DT；没有第二套
   checker/codegen；
5. 编译器自检通过（`vuna check .`）；`seed/` 是生成物，禁止手改。

完整不变量、纪律与种子轮换流程见 [AGENTS.md](AGENTS.md) 与
[docs/reference/bootstrap.md](docs/reference/bootstrap.md)。

## 文档导航

| 文档 | 内容 |
| --- | --- |
| [AGENTS.md](AGENTS.md) | AI agent 唯一固定入口：阅读顺序、不变量、纪律、命令速查 |
| [docs/architecture.md](docs/architecture.md) | 子系统地图：五条链路、入口符号、连带改动、测试标签 |
| [docs/reference/language.md](docs/reference/language.md) | core-v0 语法、模块系统、import 与导出规则 |
| [docs/reference/type-system.md](docs/reference/type-system.md) | 类型系统：宇宙/kind、索引归纳族、依赖匹配、相等证据、擦除、终止性 |
| [docs/reference/records-traits.md](docs/reference/records-traits.md) | 记录、trait / 实例 / `deriving`、`do` / Monad / IO |
| [docs/reference/effects.md](docs/reference/effects.md) | 效应：IO 内建效应类型、MonadIO + StateT/ReaderT/ErrorT、ST/region、通用 Eff 的阻塞与 F3 路线 |
| [docs/reference/stdlib.md](docs/reference/stdlib.md) | 标准库 `vuna-base` 模块清单与 `Prelude` 自动导入 |
| [docs/reference/operators.md](docs/reference/operators.md) | 运算符=方法别名、`Eq`/`Ord` 真源、实例落点规则 |
| [docs/reference/primitives.md](docs/reference/primitives.md) | 内建/原语唯一声明面、Int/String/IO 语义、效应能力（`[capabilities]`） |
| [docs/reference/packages.md](docs/reference/packages.md) | `vuna.toml` 包格式、workspace / 依赖 DAG、工具链命令一览 |
| [docs/reference/core.md](docs/reference/core.md) | Core TT / NbE / 合一 / 精化器 / 擦除 / codegen 护栏的实现参考 |
| [docs/reference/api-docs.md](docs/reference/api-docs.md) | API 文档：docstring、单文件 HTML、`vuna search` / 类型检索 |
| [docs/reference/tooling.md](docs/reference/tooling.md) | 工具链：`vuna goal`、LSP（含 codeAction quick fix）、`vuna doc`（单文件 HTML）、`vuna run` / REPL 调试命令、错误码体系与代表性错误索引 |
| [docs/reference/debugging.md](docs/reference/debugging.md) | 调试：诊断源码片段、运行时错误报告（`vuna: runtime error` + 定义级帧 + exit 2）、`Base.Debug`（trace/assert）、`vuna run` / `test --verbose` / REPL `:type` |
| [docs/reference/compiler.md](docs/reference/compiler.md) | 编译器模块职责、codegen 表示与输出模型、接口摘要（TTC 式模块化精化）、夹具指标 |
| [docs/reference/bootstrap.md](docs/reference/bootstrap.md) | 种子策略、rotation 流程、fixed point、TCB 边界 |
| [docs/reference/testing.md](docs/reference/testing.md) | 测试体系、corpus 分类、nix checks 清单、性能基准 |
| [docs/reference/lint.md](docs/reference/lint.md) | lint 规则（AST 驱动、`--fix` 与门禁） |
| [docs/reference/limits.md](docs/reference/limits.md) | 当前限制与已知边界（编译模型 / 类型系统 / IO / 工具链细节） |
| [docs/reference/debt.md](docs/reference/debt.md) | 仍未关闭的债务、缺陷与未实现能力（按语言 / 工具 / F1–F4 分组） |
| [docs/roadmap.md](docs/roadmap.md) | 当前基线、终态方向、下一阶段与不排期轨道（F1–F4） |

文档分层规则：README 只保留定位/上手/目录/硬约束/导航；细节在 `docs/reference/`；
roadmap 只保留当前基线与未来方向，里程碑历史在 git 历史；已知边界与开放债务分别归
`limits.md` 与 `debt.md`。

## 许可

MIT（见 [LICENSE](LICENSE)）。
