# vuna

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="docs/assets/logo/vuna-wordmark-reversed.svg">
    <img src="docs/assets/logo/vuna-wordmark.svg" alt="vuna" width="240">
  </picture>
</p>

vuna 是一个函数式编程语言，本仓库是它的编译器与工具链。

> **vuna 尚未发布任何版本**：没有外部用户、下游生态与历史包袱，全部源码都在本仓库内，
> **任何设计、接口、命令、实现、哲学都允许被推翻**。终态是**单一依赖类型路径**（唯一
> 检查器与 codegen）。

编译器完全用 vuna 自己写：成员包 `packages/compiler/`（`vuna-compiler`，模块 `Vuna.Compiler.*`）
+ 成员包 `packages/cli/`（产品 CLI 与工具链 fmt/lint/repl/doc/test/lsp，包名 `vuna`）+ 成员包
`packages/base/`（`vuna-base`）。`seed/` 只由 compiler 包的入口闭包生成——**可固化成种子的部分与
产品工具链明确分开**；仓库通过提交入库的 OCaml 种子自举，不依赖外部编译器。

> **AI agent 请先读 [AGENTS.md](AGENTS.md)**；架构与改动定位见
> [docs/architecture.md](docs/architecture.md)。本 README 只保留定位、上手、目录、
> 硬约束与文档导航。

## 30 秒上手

```console
nix develop                                    # OCaml 工具链 + vuna-seed
nix run .#vuna -- help                         # 产品 CLI（stage 1，按当前源码构建）

# ad-hoc 单文件：无 manifest 时只有 base 上下文，自动注入 Prelude
cat > hello.vuna <<'EOF'
main : Int
main = 1 + 2 * 3
EOF
nix run .#vuna -- check hello.vuna               # 类型检查
nix run .#vuna -- compile hello.vuna hello-out   # 逐模块 .ml + build.sh 写到 hello-out/
sh hello-out/build.sh hello && ./hello-out/hello # -> 7

# 包模式：入口 main : Eff [] a，构建产出 DIR/bin/<包名>
nix run .#vuna -- build examples/multi         # 现成的多包示例（根包 + greet + base 依赖）
examples/multi/.output/bin/multi               # -> hi hi hi|n2 n1（--out 可覆盖输出目录）
nix run .#vuna -- check examples/multi         # 包级类型检查
nix run .#vuna -- test examples/multi          # 纯 String/Int/Bool 走核心求值；main : Eff [] ... 走 compile+运行

# 测试 / 格式化 / 文档
nix run .#vuna-run-tests                            # 原生 suite（vuna dev suite --all）
nix run .#vuna-run-tests -- --list                  # 列出章节/case（--only <章节>/--filter PAT）
nix run .#backend-check -- --compiler native --scope parity  # 自举编译器跑 parity（CI 同款；见 testing.md）
nix run .#vuna -- fmt --check examples/multi   # 格式化检查（也可逐个给文件/目录）
nix run .#vuna -- lint packages/compiler/lib/Vuna/Compiler/Elab/Term.vuna   # 风格检查（文件或目录）
nix run .#vuna -- doc                          # 生成 docs/api.html（gitignored）
```

自己新建包：`vuna.toml` + `app/Main.vuna`，入口 `main : Eff [] a`，效果 API 来自 `Base.Effect.Core`（宿主层直调 `prim_eff_*`，别名模块已删，任何包都可直调）。
格式见 [packages.md](docs/reference/packages.md)，示例见 `examples/multi/`。

编译器选取：默认 `nix run .#vuna -- <subcommand>`（按当前源码构建）；需要固定二进制时先
`nix build .#vuna --out-link result`，再用 `./result/bin/vuna`（`result` 是共享 out-link，可能
指向别的产物或旧二进制）；远端稳定版是 `nix run vuna -- <subcommand>`（注册表别名）。

## 工具与自举链

| 工具 | 作用 |
| --- | --- |
| `vuna-seed` | stage 0：从多文件种子 `seed/`（`seed/build.sh` + ocamlopt）构建的种子编译器 |
| `vuna-compiler` | stage 1 编译器（从 `packages/compiler/` 做 DT 逐模块 codegen + ocamlopt）：`compile/check/build` |
| `vuna` | 产品 CLI：工具链 + 编译器命令（in-process 调用 compiler 库） |

自举链：`seed/` →（`seed/build.sh` + ocamlopt）→ `vuna-seed` →（`build --no-compile --out s1 compiler`）
→ stage1 →（`build --no-compile --out s2 compiler`）→ 两级文件集逐字节相等即 fixed point；
stage1 的 `vuna-compiler build .` 产出 `.output/bin/vuna`。流程见 [bootstrap.md](docs/reference/bootstrap.md)。

命令一览（每个命令都必须显式书写，不再支持“无子命令 = compile”的旧式回退）：

```console
vuna compile [--no-print] (<entry.vuna> | <package-dir>) OUTDIR  # 逐模块 codegen 到目录；成功静默
vuna check (<entry.vuna> | <package-dir>)
vuna build [--no-compile] [--out DIR] [PKG-DIR]  # 默认 `<PKG-DIR>/.output`；跑 build.sh → 输出目录/bin/<包名>
vuna lint [--fix] [--format text|json|github|sarif] [PATH]...
vuna test [DIR] [--list|--filter PAT|--verbose|--fail-fast]  # 运行 test/*.vuna（main : String 空串通过）
vuna run [DIR] [--package NAME] [--no-build] [--release] [-- ARGS...]    # 增量 build + 执行 .output/bin/<包名>
vuna fmt [--check] [PATH]...
vuna repl [FILE|DIR|MODULE]               # 自动签名 / 行编辑（方向键/Ctrl-R）/ 颜色 / :load 文件|目录|模块
vuna repl serve --listen ADDR [FILE|DIR|MODULE] # 常驻 REPL server（tcp:127.0.0.1:PORT | unix:PATH；stdout 就绪行）
vuna repl client --addr ADDR                   # 每次调用一发一收（stdin 的 JSON-RPC body → 响应 body）
vuna doc [--check] [--package NAME] [DIR [OUT]]  # 默认 DIR/docs/api.html
vuna search [--type|--name|--doc] [--module PFX] [--limit N] [--json] <query...>
vuna map [...] | vuna api <Module.name>  # 模块总览 / 定位符号 / 改动影响面 / 签名面
vuna help, -h
```

`vuna-compiler` 是同一套编译器命令的独立 CLI（seed 的来源），参数与 `vuna` 的同名命令一致。
`vuna` 的编译命令直接调用 `Vuna.Compiler.Driver.CompilerCli` 的库实现（in-process 调库，不
fork `vuna-compiler`）；`vuna build` 在 codegen 后执行生成的 `build.sh`（经受限进程执行内建
`prim_eff_runIn` 调 `ocamlopt`）产出 `DIR/bin/<包名>`，无额外运行时依赖。

**包上下文是唯一的加载语义**：每个源文件向上找最近的 `vuna.toml`（该包 + 依赖闭包解析
import）；无 manifest 时只有 base 上下文（`VUNA_BASE` 覆盖，否则按可执行文件相对布局
探测），ad-hoc 单文件自动注入 `Prelude`。目录入口（`check/build <dir>`）只认该目录自己的
manifest，不向上找。命令语义与包格式
见 [packages.md](docs/reference/packages.md)，语言语义见
[language.md](docs/reference/language.md)。

## 目录结构

```text
.
├── packages/  # workspace 成员包
│   ├── compiler/  # 编译器包 vuna-compiler（seed 唯一来源）：app/Main.vuna + lib/Vuna/Compiler/
│   ├── base/      # 标准库包 vuna-base：lib/Base.*、Prelude.vuna
│   ├── cli/       # 产品 CLI 包 vuna：lib/Vuna.*（工具链）+ app/Main.vuna（入口）
│   ├── http/      # 中立 HTTP/1.1 库 vuna-http：消息编解码 + 传输无关连接层
│   ├── web/       # 生态层 vuna-web：HTML 视图 + 路由 + 串行服务驱动
│   └── web-cli/   # vuna-web-cli：全栈应用的服务端产物编排（依赖编译器，不进 seed）
├── seed/      # compiler 闭包的多文件自举信任锚点（生成物，禁止手改）
├── wasm-host/ # wasm 产物的 WASI preview1 宿主（Node / 浏览器共用）+ Node loader
├── test/      # suite driver 清单 + runner 夹具/全局名单（各包 test/ 有自己的 suite）
├── bench/     # 生成程序与编译器基准（nix run .#vuna-bench / .#vuna-perf）
├── examples/  # 多包示例
├── .agents/   # AI 规则（rules/）与场景技能（skills/）
├── vscode/    # VSCode 扩展（语法高亮 + LSP 客户端 + lint/fmt/check/build；提交 dist/）
├── nix/       # 构建图（build/）+ CI 门禁（checks/）+ seed 工具 + 开发工具
├── docs/      # 分层文档（见 AGENTS.md 导航）
├── vuna.toml  # workspace 根（只有 [workspace] + [lint]）；members: packages/{compiler,base,cli,http,web,web-cli}
└── flake.nix  # 输入与 outputs 委托（构建图在 nix/）
```

逐模块职责见 [docs/architecture.md](docs/architecture.md)。仓库本身是一个 workspace
（虚拟根：根目录只有 `[workspace]`，不是包）：成员包 `vuna`（模块根 `packages/cli/lib/`）、
`vuna-compiler`（模块根 `packages/compiler/lib/`）、`vuna-base`（模块根 `packages/base/lib/`）、
`vuna-http`（模块根 `packages/http/lib/`，中立 HTTP/1.1 库）、`vuna-web`（模块根
`packages/web/lib/`，生态层：视图 + 路由 + 服务驱动）与 `vuna-web-cli`（模块根
`packages/web-cli/lib/`，编排工具：生成适配包并复用编译器构建）。六者都是
vuna 模块根，不是 OCaml 库目录；`packages/cli/app/`、`packages/compiler/app/` 是纯入口目录。仓库里没有任何
dune/OCaml 项目，只用 `ocamlopt` 编译生成的种子和程序。

## 硬约束（改坏了 CI 会失败）

1. **当前 seed 必须能编译当前源码**，rotation 后 stage1 == stage2（fixed point）；
2. **`seed/` 只含 compiler 包入口闭包**：工具链不进 TCB（`nix/seed/forbidden.txt`）；
3. **效果原语返回 `Eff []` 动作**：effectful `prim_*`（含 `prim_eff_*`）没有 manifest
   门控——任何包都可直接调用 `prim_*` / `prim_eff_*`；用户面**应**经 `Base.Effect.Core` +
   handler 使用效果（约定，非强制）。动作只在 `main` 执行（唯一动作类型 `Eff r a`，
   入口 `main : Eff [] a`）；
4. **唯一路径**：语言夹具、纯测试求值、包构建与 seed 全部走 DT；没有第二套
   checker/codegen；
5. 编译器自检通过（`vuna check .`）；`seed/` 是生成物，禁止手改。

完整不变量、纪律与种子轮换流程见 [AGENTS.md](AGENTS.md) 与
[docs/reference/bootstrap.md](docs/reference/bootstrap.md)。

## 文档导航

| 文档 | 内容 |
| --- | --- |
| [AGENTS.md](AGENTS.md) | AI agent 唯一固定入口：阅读顺序、不变量、纪律红线、命令速查 |
| [.agents/README.md](.agents/README.md) | AI 规则与场景技能索引（worktree、提交、探索、性能调试） |
| [docs/architecture.md](docs/architecture.md) | 子系统地图：五条链路、入口符号、连带改动、测试标签 |
| [docs/architecture-target.md](docs/architecture-target.md) | 终态架构：大方向、不变量、已决决策与非目标 |
| [docs/reference/language.md](docs/reference/language.md) | core-v0 语法、模块系统、import 与导出规则 |
| [docs/reference/type-system.md](docs/reference/type-system.md) | 类型系统：宇宙/kind、索引归纳族、依赖匹配、相等证据、擦除、终止性 |
| [docs/reference/qtt.md](docs/reference/qtt.md) | QTT：quantity 0/1/ω、用量检查、线性数据/记录、线性 ST 子集 |
| [docs/reference/records-traits.md](docs/reference/records-traits.md) | 记录、trait / 实例 / `deriving`、`do` / Monad / 动作 |
| [docs/reference/effects.md](docs/reference/effects.md) | 效应：Eff 统一动作与行/命名/一次性续延、ST/region、宿主 handler |
| [docs/reference/stdlib.md](docs/reference/stdlib.md) | 标准库 `vuna-base` 模块清单与 `Prelude` 自动导入 |
| [docs/reference/operators.md](docs/reference/operators.md) | 运算符=方法别名、`Eq`/`Ord` 真源、实例落点规则 |
| [docs/reference/floats.md](docs/reference/floats.md) | `Float` 原语、字面量转换 trait（FromString/FromInt/FromFloat）、`deriving`、Prelude/产物影响与核心求值限制 |
| [docs/reference/primitives.md](docs/reference/primitives.md) | 内建/原语唯一声明面、Int/String 语义、宿主层原语与推荐的 `Base.Effect.Core.*` handler 用法 |
| [docs/reference/cli.md](docs/reference/cli.md) | CLI 命令树、flag 词汇、帮助与建议、退出码、产品面与 `vuna dev` 的边界 |
| [docs/reference/packages.md](docs/reference/packages.md) | `vuna.toml` 包格式（含依赖声明）、workspace / 依赖 DAG、工具链命令一览 |
| [docs/reference/http.md](docs/reference/http.md) | 中立库 `vuna-http`：HTTP/1.1 消息模型、严格解析规则（走私防御/上限）、渲染与 duplex 传输接缝 |
| [docs/reference/web.md](docs/reference/web.md) | 生态层 `vuna-web`：HTML 视图（默认转义/void/属性过滤）、路由（静态段 + `:param`、405 的 `Allow`、HEAD）、串行服务驱动与并发限制 |
| [docs/reference/package-store.md](docs/reference/package-store.md) | 持久包 store、`vuna deps fetch` / `store clean --packages`、内容摘要与语义身份 |
| [docs/reference/core.md](docs/reference/core.md) | Core TT / NbE / 合一 / 精化器 / 擦除 / codegen 护栏的实现参考 |
| [docs/reference/api-docs.md](docs/reference/api-docs.md) | API 文档：docstring、单文件 HTML、`vuna search` / 类型检索 |
| [docs/reference/observability.md](docs/reference/observability.md) | 可观测性（语言层，任何 vuna 应用可用）：事件模型（Chrome Trace Event JSONL `vuna-obs 1`）、`VUNA_OBS=0..3` 分级与关闭快速路径、`Base.Data.Obs` / `Base.Data.Obs.Span` 与 `obs!`/`mark!` 宏、生成运行时（span/计数/日志/CPU 采样/分配栈）、`#line` → DWARF、`vuna dev obs run/summarize/validate/convert/render/merge/symbols`、成本纪律与门禁 |
| [docs/reference/tooling.md](docs/reference/tooling.md) | 工具链：`vuna goal`、LSP（含 codeAction quick fix）、`vuna doc`（单文件 HTML）、`vuna run` / REPL 调试命令、**REPL server / client（`repl serve --listen` / `repl client --addr`，JSON-RPC over socket）**、错误码体系与代表性错误索引 |
| [docs/reference/debugging.md](docs/reference/debugging.md) | 调试：诊断源码片段、运行时错误报告（`vuna: runtime error` + 定义级帧 + exit 2）、语言级调试构造（`dbg!`/`dbgShow`/`assert`/`todo`）、`vuna run` / `test --verbose` / REPL `:type` |
| [docs/reference/diagnostics.md](docs/reference/diagnostics.md) | 诊断系统：结构化 `Diagnostic`/`Check` 通道、错误码域、short/human/JSON 渲染、LSP 映射 |
| [docs/reference/compiler.md](docs/reference/compiler.md) | 编译器模块职责、codegen 表示与输出模型、接口摘要（TTC 式模块化精化）、夹具指标 |
| [docs/reference/ir.md](docs/reference/ir.md) | 擦除后的中间表示（Track A）：IR 节点与边界、Core → IR 的决策划分、`Ir.Runtime` 运行时契约与 `checks.ir-boundary` |
| [docs/reference/wasm.md](docs/reference/wasm.md) | wasm 后端（WAT）：WasmGC 表示、WAT 布局、IR 支持面、运行时符号覆盖、`--target wasm` 边界 |
| [docs/reference/native.md](docs/reference/native.md) | native 后端（x86-64 汇编）：产物/ABI、值表示（含字符串对象与 bump 堆）、栈帧、运行时符号、IR 支持面与边界 |
| [docs/reference/cache.md](docs/reference/cache.md) | 输入寻址对象库：对象族、命名（contentHash/ifaceHash/implHash）、命中判据、roots 与 store gc、观测标签、已知边界 |
| [docs/reference/bootstrap.md](docs/reference/bootstrap.md) | 种子策略、rotation 流程、fixed point、TCB 边界 |
| [docs/reference/testing.md](docs/reference/testing.md) | 测试体系、corpus 分类、nix checks 清单、性能基准 |
| [docs/reference/test-architecture.md](docs/reference/test-architecture.md) | 测试体系设计：共享对象库、store-isolated、verdict 对象、tier 与预算 |
| [docs/reference/lint.md](docs/reference/lint.md) | lint 规则、`vuna.toml [lint]` 配置、源码抑制与门禁 |
| [docs/reference/debt.md](docs/reference/debt.md) | 仍未关闭的债务、缺陷与未实现能力（按语言 / 工具分组，带证据） |
| [docs/reference/compiler-audit.md](docs/reference/compiler-audit.md) | 编译器分层实现债：每层的补丁 / 降级 / 近似 / 结构妥协清单（按 ID 引用） |

文档分层规则：README 只保留定位/上手/目录/硬约束/导航；细节在 `docs/reference/`；
历史与里程碑在 git 历史；已知边界并入各主题参考页
（见上表），未关闭的缺陷与缺口归 `debt.md`。

## 许可

MIT（见 [LICENSE](LICENSE)）。
