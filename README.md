# vuna

vuna 是一个函数式编程语言，本仓库是它的编译器与工具链。

> **vuna 尚未发布任何版本**：没有外部用户、下游生态与历史包袱，全部源码都在本仓库内，
> **任何设计、接口、命令、实现、哲学都允许被推翻**。终态是**单一依赖类型路径**（唯一
> 检查器与 codegen）。

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

# 包模式：入口 main : Eff [] a，构建产出 DIR/bin/<包名>
./result/bin/vuna build examples/multi         # 现成的多包示例（根包 + greet + base 依赖）
examples/multi/.output/bin/multi               # -> hi hi hi|n2 n1（--out 可覆盖输出目录）
./result/bin/vuna check examples/multi         # 包级类型检查
./result/bin/vuna test examples/multi          # 纯 String/Int/Bool 走 interp；main : Eff [] ... 走 compile+运行

# 测试 / 格式化 / 文档
nix run .#vuna-run-tests                            # 原生 suite（vuna test --suite test/suite.toml）
nix run .#vuna-run-tests -- --list                  # 列出章节/case（--only <章节>/--filter PAT）
./result/bin/vuna fmt --check examples/multi   # 格式化检查（也可逐个给文件/目录）
./result/bin/vuna lint compiler/lib/Vuna/Compiler/Elab/Term.vuna   # 风格检查（必须给路径）
./result/bin/vuna doc                          # 生成 docs/api.html（gitignored）
```

自己新建包：`vuna.toml` + `app/Main.vuna`，入口 `main : Eff [] a`，效果 API 来自 `Base.Eff`（宿主层直调 `prim_eff_*`，别名模块已删，任何包都可直调）。
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
vuna run [DIR] [--package NAME] [--no-build] [--release] [-- ARGS...]    # 增量 build + 执行 .output/bin/<包名>
vuna fmt [--check] [PATH]...
vuna repl [FILE|DIR|MODULE]               # 自动签名 / 行编辑（方向键/Ctrl-R）/ 颜色 / :load 文件|目录|模块
vuna repl --listen ADDR [FILE|DIR|MODULE] # 常驻 REPL server（tcp:127.0.0.1:PORT | unix:PATH；stdout 就绪行）
vuna repl --client ADDR                   # 每次调用一发一收（stdin 的 JSON-RPC body → 响应 body）
vuna doc [--check] [--package NAME] [DIR [OUT]]  # 默认 DIR/docs/api.html
vuna search [--type|--name|--doc] [--module PFX] [--limit N] [--json] <query...>
vuna map [...] | vuna api <Module.name>  # 模块总览 / 定位符号 / 改动影响面 / 签名面
vuna help, -h
```

`vuna-compiler` 是同一套编译器命令的独立 CLI（seed 的来源），参数与 `vuna` 的同名命令一致。
`vuna` 的编译命令直接调用 `Vuna.Compiler.Driver.CompilerCli` 的库实现（in-process 调库，不
fork `vuna-compiler`）；`vuna build` 在 codegen 后执行生成的 `build.sh`（经受限进程执行内建
`prim_eff_runIn` 调 `ocamlopt`）产出 `DIR/bin/<包名>`，无额外运行时依赖。`vuna interp` 是
**DT 精化 + 核心求值**：先按 DT 检查再求 `main` 的值，只展示 `Int`/`String`/`Bool`；任何
`main : Eff [] a` 一律明确报错（核心求值器不执行效果），请改用 `compile` + 运行产物。

**包上下文是唯一的加载语义**：每个源文件向上找最近的 `vuna.toml`（该包 + 依赖闭包解析
import）；无 manifest 时只有 base 上下文（`VUNA_BASE` 覆盖，否则按可执行文件相对布局
探测），ad-hoc 单文件自动注入 `Prelude`。目录入口（`check/build <dir>`）只认该目录自己的
manifest，不向上找。命令语义与包格式
见 [packages.md](docs/reference/packages.md)，语言语义见
[language.md](docs/reference/language.md)。

## 目录结构

```text
.
├── compiler/  # 编译器包 vuna-compiler（seed 唯一来源）：app/Main.vuna + lib/Vuna/Compiler/
├── base/      # 成员包 vuna-base：lib/Base.*、Prelude.vuna
├── lib/       # 产品 CLI 包 vuna 的模块根（工具链 Vuna.*）
├── app/       # 产品 CLI 入口 main : Eff [] Int
├── seed/      # compiler 闭包的多文件自举信任锚点（生成物，禁止手改）
├── test/      # suite.toml + suite/（原生 runner）+ corpus/ 夹具
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
3. **效果原语返回 `Eff []` 动作**：effectful `prim_*`（含 `prim_eff_*`）没有 manifest
   门控——任何包都可直接调用 `prim_*` / `prim_eff_*`；用户面**应**经 `Base.Eff` +
   handler 使用效果（约定，非强制）。动作只在 `main` 执行（唯一动作类型 `Eff r a`，
   入口 `main : Eff [] a`）；
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
| [docs/architecture-target.md](docs/architecture-target.md) | 终态架构：大方向、不变量、已决决策与非目标 |
| [docs/reference/language.md](docs/reference/language.md) | core-v0 语法、模块系统、import 与导出规则 |
| [docs/reference/type-system.md](docs/reference/type-system.md) | 类型系统：宇宙/kind、索引归纳族、依赖匹配、相等证据、擦除、终止性 |
| [docs/reference/qtt.md](docs/reference/qtt.md) | QTT：quantity 0/1/ω、用量检查、线性数据/记录、线性 ST 子集 |
| [docs/reference/records-traits.md](docs/reference/records-traits.md) | 记录、trait / 实例 / `deriving`、`do` / Monad / 动作 |
| [docs/reference/effects.md](docs/reference/effects.md) | 效应：Eff 统一动作与行/命名/一次性续延、ST/region、宿主 handler |
| [docs/reference/stdlib.md](docs/reference/stdlib.md) | 标准库 `vuna-base` 模块清单与 `Prelude` 自动导入 |
| [docs/reference/operators.md](docs/reference/operators.md) | 运算符=方法别名、`Eq`/`Ord` 真源、实例落点规则 |
| [docs/reference/floats.md](docs/reference/floats.md) | `Float` 原语、字面量转换 trait（FromString/FromInt/FromFloat）、`deriving`、Prelude/产物影响与 interp 限制 |
| [docs/reference/primitives.md](docs/reference/primitives.md) | 内建/原语唯一声明面、Int/String 语义、宿主层原语与推荐的 `Base.Eff.*` handler 用法 |
| [docs/reference/packages.md](docs/reference/packages.md) | `vuna.toml` 包格式（含依赖声明）、workspace / 依赖 DAG、工具链命令一览 |
| [docs/reference/package-store.md](docs/reference/package-store.md) | 持久包 store、`vuna fetch` / `clean --packages`、内容摘要与语义身份 |
| [docs/reference/core.md](docs/reference/core.md) | Core TT / NbE / 合一 / 精化器 / 擦除 / codegen 护栏的实现参考 |
| [docs/reference/api-docs.md](docs/reference/api-docs.md) | API 文档：docstring、单文件 HTML、`vuna search` / 类型检索 |
| [docs/reference/observability.md](docs/reference/observability.md) | 可观测性（语言层，任何 vuna 应用可用）：事件模型（Chrome Trace Event JSONL `vuna-obs 1`）、`VUNA_OBS=0..3` 分级与关闭快速路径、`Base.Obs` / `Base.Obs.Span` 与 `obs!`/`mark!` 宏、生成运行时（span/计数/日志/CPU 采样/分配栈）、`#line` → DWARF、`vuna obs run/summarize/validate/convert/render`、成本纪律与门禁 |
| [docs/reference/tooling.md](docs/reference/tooling.md) | 工具链：`vuna goal`、LSP（含 codeAction quick fix）、`vuna doc`（单文件 HTML）、`vuna run` / REPL 调试命令、**REPL server / client（`--listen`/`--client`，JSON-RPC over socket）**、错误码体系与代表性错误索引 |
| [docs/reference/debugging.md](docs/reference/debugging.md) | 调试：诊断源码片段、运行时错误报告（`vuna: runtime error` + 定义级帧 + exit 2）、语言级调试构造（`dbg!`/`dbgShow`/`assert`/`todo`）、`vuna run` / `test --verbose` / REPL `:type` |
| [docs/reference/diagnostics.md](docs/reference/diagnostics.md) | 诊断系统：结构化 `Diagnostic`/`Check` 通道、错误码域、short/human/JSON 渲染、LSP 映射、迁移状态与后续路线 |
| [docs/reference/compiler.md](docs/reference/compiler.md) | 编译器模块职责、codegen 表示与输出模型、接口摘要（TTC 式模块化精化）、夹具指标 |
| [docs/reference/ir.md](docs/reference/ir.md) | 擦除后的中间表示（Track A）：IR 节点与边界、Core → IR 的决策划分、`Ir.Runtime` 运行时契约与 `checks.ir-boundary` |
| [docs/reference/wasm.md](docs/reference/wasm.md) | wasm 后端（WAT M2）：WasmGC 表示、WAT 布局、IR 支持面、运行时符号覆盖、`--target wasm` 边界 |
| [docs/reference/native.md](docs/reference/native.md) | native 后端（x86-64 汇编 M1+M2）：产物/ABI、值表示（含字符串对象与 bump 堆）、栈帧、运行时符号、IR 支持面与边界 |
| [docs/reference/cache.md](docs/reference/cache.md) | 输入寻址对象库：对象族、命名（contentHash/ifaceHash/implHash）、命中判据、roots 与 store gc、观测标签、已知边界 |
| [docs/reference/bootstrap.md](docs/reference/bootstrap.md) | 种子策略、rotation 流程、fixed point、TCB 边界 |
| [docs/reference/testing.md](docs/reference/testing.md) | 测试体系、corpus 分类、nix checks 清单、性能基准 |
| [docs/reference/test-architecture.md](docs/reference/test-architecture.md) | 测试体系设计：共享对象库、store-isolated、verdict 对象、tier 与预算 |
| [docs/reference/lint.md](docs/reference/lint.md) | lint 规则（AST 驱动、`--fix` 与门禁） |
| [docs/reference/debt.md](docs/reference/debt.md) | 仍未关闭的债务、缺陷与未实现能力（按语言 / 工具分组，带证据） |

文档分层规则：README 只保留定位/上手/目录/硬约束/导航；细节在 `docs/reference/`；
历史与里程碑在 git 历史；已知边界并入各主题参考页
（见上表），未关闭的缺陷与缺口归 `debt.md`。

## 许可

MIT（见 [LICENSE](LICENSE)）。
