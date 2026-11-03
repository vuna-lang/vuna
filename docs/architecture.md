# 架构：子系统地图与数据流

本文是 vuna 仓库的**子系统地图**：回答“改一个功能要在哪些模块动手、该跑哪段测试”。
阅读顺序：本文 → 命中的子系统 `docs/reference/*` → 源码；不要通读全仓。逐模块职责与
codegen 要点见 [compiler.md](reference/compiler.md)，语义见 [language.md](reference/language.md)，
自举见 [bootstrap.md](reference/bootstrap.md)。

## 仓库分层

```text
compiler/lib/Vuna/Compiler/   （45 个模块；目录即层：Frontend → Packages → Loader → Core → Elab → Codegen → Driver）
├─ Common.vuna                公共门面（Base 类型 + Pos/Span/诊断）
├─ Frontend/                  Ast Lexer Parser Parser/Support Toml Manifest   词法 / 语法 / vuna.toml
├─ Packages/                  Pkg                              包图与模块根
├─ Loader.vuna + Loader/      Modules Resolve Flatten          模块图 / 名字解析 / flatten
├─ Core.vuna + Core/          Term Eval Conv                   Core TT / NbE / 定义性相等
├─ Elab.vuna + Elab/          Sig Types Meta Case Dict Term
│                             Data Trait Driver Termination
│                             Prelude Match Records Derive     双向精化
├─ Codegen.vuna + Codegen/    Decl Erase Term Program Split    擦除检查 + OCaml 生成
└─ Driver/                    Split Dt Compile CompilerCli     输出模型 / facade / 编译入口 / CLI
根包 vuna（模块根 lib/，入口 app/Main.vuna）：Cli/Interp/Fmt/Lint/Index（各门面+子模块）、
  Repl/Doc/Lsp/Json/TestRunner/Files
成员包 vuna-base（模块根 base/lib/）：Base.*（15 个公开模块）+ Prelude
依赖图：vuna → vuna-compiler → vuna-base，根包也直接依赖 vuna-base
```

**目录即层**：目录 = 依赖层次，上层可 import 下层、反向禁止（根上的 `Common` 被各层共享，不是一层）。**门面模式**：`X.vuna` 只
import 子模块并选择性重导出（对外名字面与拆分前一致），实现只在叶子；**数据定义只在叶子**
（`Core.Term`、`Elab.Types` 等），门面不定义数据。控制流模块按 SCC 内聚、不硬拆；目标每
模块 ≤~800 行（当前最大 `Elab.Termination` 811）。`compiler/` 是 seed 唯一来源（入口
`compiler/app/Main.vuna` 的 import 闭包，60 个 `.ml`）；`lib/` 工具链与 `app/` 在 TCB 之外；
`base/` 的模块名就是公开 API，保持 15 个不变。

## 1. 编译链：Frontend → Loader → Elab → Codegen

**何时该看这里**：改语法、import/模块解析、DT 精化规则、索引 unification、擦除 codegen。

```text
源文件
 → Frontend.Lexer.lexSource      （token + Pos/Span；lexComments 供 fmt）
 → Frontend.Parser.parseSource   （offside layout → AST + imports）
 → Loader.Flatten.loadProgram*   （模块根 → import 图 → 名字解析 → flatten）
 → Elab.Driver.elabProgramFull   （Elab.{Records,Derive} 降级 → Elab.Driver 精化；
      body 内走 Elab.Match.multiToExpr 与 Core 的 NbE / 索引合一 / 实例搜索）
 → Codegen.Program.generateDtProgram（单文件）
   / Codegen.Split.generateDtSplitProgram（逐模块）
 → ocamlopt                      （单文件直接编；逐模块走生成的 build.sh）
```

擦除检查由 `Codegen.Program.checkDtProgram` 负责（判据 `Core.rigIsErased`）。`vuna interp` 走同一
精化链后由 `Driver.Dt.dtEvalFile` 求 `main`（纯求值：只展示 `Int`/`String`/`Bool`，任何
`main : IO a` 报错并提示 `compile`）。

**入口符号**：`Driver.Dt.dtCheckProject` / `dtCompileProject` / `dtSplitProject` /
`dtEvalFile` / `dtEvalExpr`；`Loader.Flatten.loadProgram` / `loadProject` / `resolveProject`
（`loadProgramRaw` 是 `--root` 原始模式）；`Elab.Driver.elabProgramFull`（洞目标
`Elab.Driver.goalsOfProgram`）、`Elab.Termination.checkTerminationDecls`、
`Elab.Match.multiToExpr`；`Core.Eval.eval` / `quote` / `normalize`、`Core.Conv.conv`；
`Codegen.Program.checkDtProgram` / `generateDtProgram` / `Codegen.Split.generateDtSplitProgram`；
`Driver.Split.SplitFile` / `buildScript`；CLI 经 `Driver.Compile.checkFileDt` /
`compileFileDt`（单文件）与 `checkProjectDt` / `compileProjectDt`（包级）接
`Driver.CompilerCli`。

**输出模型**：`vuna compile` 产单个 `.ml`；`vuna build` 产 `.output/{main.ml,build.sh,bin/<包名>}`；
`build --split` / `seed` 产逐模块 `.ml` + `build.sh`（依赖序、无 `.mli`）；单文件路径同时是
split 的回归基线。

**通常连带改动**：语法 = `Frontend.{Lexer,Parser,Ast}` + `Fmt` + `Elab.Term`/`Elab.Match` +
`Codegen`；名字解析 = `Loader.{Modules,Resolve,Flatten}`；类型规则 = `Elab.*` +
`Elab.{Records,Derive}` + `Codegen`；split 划分 = `Codegen.Split.generateDtSplitProgram` +
`Driver.Split`；诊断 = `Frontend.Ast`/`Common` + 各阶段 `Result` 错误 + golden。

**建议测试标签**：第 1–11、13–27、30、34 段（见 [testing.md](reference/testing.md)）；
包构建与 split/seed 见第 28/29/33/34 段。

## 2. 包与 workspace：Frontend.Toml → Frontend.Manifest → Packages.Pkg → Loader

**何时该看这里**：改 `vuna.toml`、workspace 成员、依赖 DAG、`[export]` 可见性、模块根。

```text
vuna.toml → Frontend.Toml.parseToml（TOML 子集，带行号）
 → Frontend.Manifest.parseManifest / validateManifest（语义模型，不做 I/O）
 → Packages.Pkg.loadPackage / workspacePackages / packageRoots（DAG、模块根）
 → Loader.loadProject（Root 列表：本包 lib/ + 依赖包 lib/）
```

**入口符号**：`Manifest.parseManifest` / `validateManifest`；`Pkg.loadPackage` /
`workspacePackages` / `packageRoots` / `packageEntry` / `packageExports`；
`Loader.Flatten.loadProject` / `loadProjectModules` / `resolveProject`；CLI 组合在
`Driver.Compile.buildSplit` / `seedSplit`。

**约束**：`Toml`/`Manifest` 不做文件 I/O；`Pkg` 只做 lexical 路径规范化；跨包只认依赖包
`[export]`，隐藏模块报 `is not exported by package ...`；依赖图是 DAG、包名唯一（同名同
目录 diamond 合法）。测试：第 28–29、33 段 + `checks.vuna-package`。

## 3. 根包工具链与 TCB 边界

**何时该看这里**：改 `vuna` 子命令、fmt/lint/repl/doc/test/map、解释器 facade。

- `Vuna.Cli.runCli` 分发；`Vuna.Interp.interpretFile` / `interpretFileIn`（DT facade，实际
  入口 `Driver.Dt.dtEvalFile`）；`Vuna.Fmt.formatSource`（+ `Fmt.{Comment,Decl,Expr,Util}`）、
  `Vuna.Lint.runLint`（+ `Lint.{Rules,Fix}`）、`Vuna.Repl.runRepl`、`Vuna.Doc.runDoc`、
  `Vuna.TestRunner.runTests`、`Vuna.Files.collectVunaFiles`。
- 进程执行只在 `Driver.CompilerCli.runIn`（`prim_runIn`，受包级 allowlist 限制）。
- **TCB 边界**：工具链永不进入 seed；`compiler/app/Main.vuna` 的 import 闭包不含任何
  `Vuna.*` 工具模块。`nix/tcb-forbidden.txt` 是唯一黑名单（`nix/tcb-check.sh` 断言）。
- **效应 allowlist**：`Loader.Resolve.packageAllowsEffects` 只放行
  `vuna` / `vuna-compiler` / `vuna-base`，其余包必须经 `Base.IO`。

## 4. LSP 与索引（工具链侧，不进 seed）

- `Vuna.Lsp.runLsp`：JSON-RPC over stdio；诊断 = `Frontend.Parser` 错误 + DT 精化
  （`Elab.Driver.elabProgramWith`）错误；hover = `Elab.Driver.goalsOfProgram` 的洞目标。
  含 `import` 的文件跳过类型检查（LSP 不做包解析）。
- `Vuna.Index`（+ `Index.{Types,Scan,Query,Render}`）：parse 级源码索引，`vuna map` /
  `vuna api` 用，缓存 `.local/index/`。

## 5. 自举链：seed → vuna-seed → vuna-compiler → vuna

**何时该看这里**：改 `compiler/` 后怀疑种子失效、要 rotate seed、改 Nix 构建图。

```text
seed/（compiler 包入口闭包；seed/build.sh + ocamlopt）→ vuna-seed（stage 0）
 → vuna-seed build --split s1 compiler && sh s1/build.sh → s1（DT split）
 → ./vuna-stage1 build --split s2 compiler → diff -r s1 s2（fixed point）
 → vuna-compiler build . → .output/bin/vuna（产品 CLI）
```

命令/入口：`vuna seed`（`Driver.Compile.seedSplit` → `Driver.Dt.dtSplitProject` →
`Codegen.Split.generateDtSplitProgram`）、`build --split`（`buildSplit`）、`nix/seed-rotate.sh`、
`nix/packages.nix`、`checks.seed-selfhost`。**硬不变量**：当前 seed 必须能编译当前源码；
rotation 后 stage1 == stage2；seed 只含 compiler 包入口闭包。改 `compiler/` 先验证“旧种子
能编译新源码”（`nix build .#vuna-seed`），新语法先以旧语法落地再 rotate。测试：第 13 段、
`checks.seed-selfhost`。详见 [bootstrap.md](reference/bootstrap.md)。

## 改一处 → 跑什么（速查）

| 你改了什么 | 最小验证 |
| --- | --- |
| 只改 `lib/` 工具链 | `vuna fmt --check <文件>` + `vuna lint lib/Vuna/Cli.vuna` + 第 14–16、30–32 段 |
| 改 `base/` 标准库 | 第 26–27 段（monad / stdlib）+ `vuna check .` |
| 改 `compiler/` 任一模块 | 全量 `test/run-tests.sh` + `nix flake check`（至少 seed-selfhost） |
| 改语法/类型规则 | 第 1–11、13–27、30、34 段 + 全量测试 + 编译器自检 |
| 改 DT 精化 / 擦除 codegen | 第 1–11、13–27、30、34 段 + 全量测试 + 编译器自检 |
| 改 split / seed 输出 | 第 33/34 段 + `diff -r` 对拍 + `checks.seed-selfhost` |
| 改 `vuna.toml` 机制 | 第 28–29、33 段 + `checks.vuna-package` |
| 改 Nix | `nix flake check`（`checks.*` 全绿）+ `nix build .#vuna` |

## 相关阅读

[compiler.md](reference/compiler.md)（模块职责与 codegen）、[bootstrap.md](reference/bootstrap.md)
（种子与 rotation）、[testing.md](reference/testing.md)（测试与 nix checks）、
[language.md](reference/language.md) / [type-system.md](reference/type-system.md) /
[dt.md](reference/dt.md)（语言语义）、[dt-tooling.md](reference/dt-tooling.md)（洞目标 / LSP / 错误索引）、
[roadmap.md](roadmap.md) 与 [dt-core.md](dt-core.md)（路线与 DT 设计）。