# 架构：子系统地图与数据流

本文是 vuna 仓库的**子系统地图**：回答“改一个功能要在哪些模块动手、该跑哪段测试”。
阅读顺序：本文 → 命中的子系统 `docs/reference/*` → 源码；不要通读全仓。逐模块职责与
codegen 要点见 [compiler.md](reference/compiler.md)，语言语义见 [language.md](reference/language.md)，
自举链见 [bootstrap.md](reference/bootstrap.md)。

> **终态已落地（M24）**：一套表面语言、一个类型检查器（DT）、一条擦除 codegen、
> 一个 seed。检查器与 codegen 都没有可选开关；被取代的实现已从仓库删除（历史对照见
> [history.md](history.md)，能力落差证据作为历史保留在 [dt-parity.md](reference/dt-parity.md)）。

## 仓库分层

```text
根包 vuna（产品 CLI + 工具链，模块根 lib/，入口 app/Main.vuna）
 ├─ 成员包 vuna-compiler（模块根 compiler/lib/，入口 compiler/app/Main.vuna）→ seed/ 的唯一来源
 └─ 成员包 vuna-base（模块根 base/lib/，标准库 Base.* + Prelude）
依赖图：vuna → vuna-compiler → vuna-base，根包也直接依赖 vuna-base
```

- `compiler/`：编译器（所有 `Vuna.Compiler.*`），其入口闭包 = `seed/`；
- `lib/`：根包工具链（`Vuna.Cli/Interp/Fmt/Lint/Repl/Doc/Index/Lsp/TestRunner/Files/Process`）；
- `base/`：标准库（`Base.*` + 顶层 `Prelude`）；
- `app/Main.vuna`：`main = exit (runCli (getArgs))`，只做分发。

**TCB 边界**：`seed/` 只由 `compiler/app/Main.vuna` 的 import 闭包生成；`lib/`（工具链）
与 `app/` 都在 TCB 之外。判断“某模块会不会进 seed”：看它是否被 `Vuna.Compiler.*`
传递 import，以及是否在 `compiler/vuna.toml` 的 `[export]` 里。

## 1. 编译链：Lexer → Parser → Loader → Elab → 擦除 codegen

**何时该看这里**：改语法、import/模块解析、DT 精化规则、索引 unification、擦除 codegen。

**数据流**：
```text
源文件
 → Vuna.Compiler.Lexer.lexSource             （token + Pos/Span；lexComments 单独供 fmt）
 → Vuna.Compiler.Parser.parseSource           （offside layout → AST + imports）
 → Vuna.Compiler.Loader.loadProgram*          （模块根 → import 图 → 名字解析 → flatten）
 → Vuna.Compiler.Elab.elabProgramFull         （DtRecords → DtDerive → 双向精化 → DtProgram；
      body 内走 DtMatch.multiToExpr 与 Core 的 NbE / 索引合一 / 实例搜索）
 → CoreCodegen.generateDtProgram（单文件）
   / CoreCodegen.generateDtSplitProgram（逐模块 split 输出模型）
 → ocamlopt                                   （单文件直接编；逐模块走生成的 build.sh）
```

精化与 codegen 前的擦除检查由 `CoreCodegen.checkDtProgram` 负责（判据 `Core.rigIsErased`）。
`vuna interp` 走同一条精化链后由 `Dt.dtEvalFile` 求 `main` 的值（纯求值：只展示
`Int`/`String`/`Bool`，任何 `main : IO a` 一律报错并提示 `compile`）。

**入口符号**：`Dt.dtCheckProject` / `dtCompileProject` / `dtSplitProject` / `dtEvalFile` /
`dtEvalExpr`（REPL）；
`Loader.loadProgram` / `loadProject` / `resolveProject`（`loadProgramRaw` 是 `--root` 原始模式）；
`Elab.elabProgramFull`（洞目标 `goalsOfProgram`）、`DtTerm.checkTerminationDecls`；
`DtMatch.multiToExpr` / `buildColumnExpr`；`Core.eval` / `quote` / `conv` / `normalize`；
`CoreCodegen.checkDtProgram` / `generateDtProgram`（单文件）/ `generateDtSplitProgram`
（逐模块）；`Dt.dtSplitProject`（包级 split facade）；`Split.SplitFile` / `buildScript`
（输出模型与 `build.sh` 生成）。CLI 侧经 `Compile.checkFileDt` / `compileFileDt`（单文件）
与 `checkProjectDt` / `compileProjectDt`（包目录 / 包级）同 `CompilerCli` 接线。

**输出模型**：`vuna compile` 产单个 `.ml`；`vuna build` 产 `.output/{main.ml,build.sh,bin/<包名>}`；
`vuna build --split OUT` / `vuna seed OUT` 产逐模块 `.ml` + `build.sh`（依赖序、无 `.mli`）。
单文件路径同时是 split 重构的回归基线。

**通常连带改动**：新 token/语法 = `Lexer` + `Parser` + `Ast` + `Fmt` + `Elab`/`DtMatch`/`CoreCodegen`；
名字解析/导出 = `Loader`（`Project`/`ExportEntry`）+ `Ast`（`ModDecl`）+ `Elab`；
类型规则/降级 = `Elab` + `DtRecords`/`DtDerive` + `CoreCodegen`；split 文件划分 =
`CoreCodegen.generateDtSplitProgram` + `Split`；诊断 = `Ast`/`Common`（`Span`、`showSpanLoc`）
+ 各阶段 `Result` 错误 + 测试 golden。

**建议测试标签**：第 1–11、13–27、30、34 段（见 [testing.md](reference/testing.md)）；
包构建与 split/seed 见第 28/29/33/34 段。

## 2. 包与 workspace：Toml → Manifest → Pkg → Loader

**何时该看这里**：改 `vuna.toml` 格式、workspace 成员、依赖 DAG、`[export]` 可见性、模块根解析。

**数据流**：
```text
vuna.toml
 → Vuna.Compiler.Toml.parseToml              （TOML 子集 → List TomlEntry，带行号）
 → Vuna.Compiler.Manifest.parseManifest       （→ Manifest；validateManifest 做结构校验）
 → Vuna.Compiler.Pkg.loadPackage/workspacePackages （依赖 DAG、packageRoots、findManifestDir）
 → Vuna.Compiler.Loader.loadProject           （Root 列表：本包 lib/ + 依赖包 lib/）
```

**入口符号**：`Manifest.parseManifest` / `validateManifest`；`Pkg.loadPackage` /
`workspacePackages` / `packageRoots` / `packageEntry` / `packageExports`；`Loader.loadProject` /
`loadProjectModules` / `resolveProject`；CLI 侧组合在 `SplitCli.buildSplit` / `seedSplit`
（模块前缀均为 `Vuna.Compiler.`）。

**约束**：`Toml`/`Manifest` 不做文件 I/O；`Pkg` 只做 lexical 路径规范化；跨包只认依赖包
`[export]` 列表，隐藏模块报 `is not exported by package ...`；依赖图必须是 DAG。

**通常连带改动**：新增 manifest 字段 = `Manifest`（data+parse+validate+accessor）+
`Pkg`（消费）+ `SplitCli`/`Cli` + `examples/multi` 与 `corpus/packages` 夹具；测试第
28–29 段、第 33 段、`checks.vuna-package`。

## 3. 根包工具链与 TCB 边界

**何时该看这里**：改 `vuna` 子命令、fmt/lint/repl/doc/test/map、解释器 facade。

**入口符号**：
- `Vuna.Cli.runCli`（产品 CLI 分发；`compilerUsageLines` + `toolUsageLines` 定义用法）
- `Vuna.Interp.interpretFile` / `interpretFileIn`（DT facade）；`Dt.dtEvalFile` 是实际入口
- `Vuna.Fmt.formatSource`、`Vuna.Lint.runLint`、`Vuna.Repl.runRepl`（表达式经 DT 求值）、
  `Vuna.Doc.runDoc`、`Vuna.TestRunner.runTests`、`Vuna.Files.collectVunaFiles`
- `Vuna.Process.runIn`（与 `Vuna.Compiler.Process.runIn` 同名，工具链侧实现）

**TCB 边界（硬约束）**：工具链永不进入 seed。`compiler/app/Main.vuna` 的 import 闭包不含
任何 `Vuna.*` 工具模块；`nix/tcb-forbidden.txt` 是唯一黑名单（`nix/tcb-check.sh` 断言，
seed rotation 与 `checks.seed-selfhost` 共用）。新增工具模块时必须追加。

**效应内建的包级 allowlist**：`Vuna.Compiler.Loader.packageAllowsEffects` 只放行
`vuna` / `vuna-compiler` / `vuna-base`；其余包必须经 `Base.IO`。

**通常连带改动**：新子命令 = `Vuna.Cli` 分发 + 工具模块 + `toolUsageLines` + 第 14 段；
若新模块可能被 compiler 闭包 import，先确认它不进 TCB。

**建议测试标签**：第 14–16 段（CLI / lint）、第 30–32 段（fmt 语义一致、doc、repl）、
`checks.vuna-lint`。

## 4. LSP 与索引（工具链侧，不进 seed）

**何时该看这里**：改编辑器诊断 / hover、`vuna map` / `vuna api` 的符号索引。

- `Vuna.Lsp.runLsp`：JSON-RPC 2.0 over stdio；诊断 = `parseSource` 错误 + **DT 精化**
  （`Elab.elabProgramWith`）错误；hover 用同一精化链的 `Elab.goalsOfProgram` 取洞目标。
  含 `import` 的文件跳过类型检查（LSP 不做包解析），只保留 parse 诊断。**永不进入 seed**。
- `Vuna.Index.buildIndex` / `loadOrBuild` / `findSymbol` / `impactOf` / `renderApi`：
  parse 级源码索引，`vuna map` / `vuna api` 使用，缓存在 `.local/index/`；**永不进入 seed**。

**通常连带改动**：诊断来源 = `Elab` 的错误类型 + `Lsp` 的 `diagnosticsFor` + 第 35 段
`corpus/lsp/smoke.sh`；索引 = `Index` + `nix/checks/index.sh`。

## 5. 自举链：seed → vuna-seed → vuna-compiler → vuna

**何时该看这里**：改 `compiler/` 后怀疑种子失效、要 rotate seed、或改 Nix 构建图。

```text
seed/（提交入库，compiler 包入口闭包；seed/build.sh + ocamlopt）→ vuna-seed（stage 0）
 → vuna-seed seed stage1 compiler && sh stage1/build.sh → stage1 文件集（DT split）
 → vuna-compiler build . → .output/bin/vuna（产品 CLI）
 → vuna-compiler build --split s1/s2 compiler → diff -r s1 s2（fixed point）
```

seed 由 **DT split codegen** 生成（`vuna seed OUT compiler`；逐模块 `.ml` + `build.sh`，
无 `.mli`）。**入口符号 / 命令**：`vuna seed`（`SplitCli.seedSplit` → `Dt.dtSplitProject`
→ `CoreCodegen.generateDtSplitProgram`）、`build --split`（`buildSplit`）、
`nix/seed-rotate.sh`、`nix/packages.nix` 与 `nix/checks/`（`checks.seed-selfhost`）。
**硬不变量**：当前 seed 必须能编译当前源码；rotation 后 stage1 == stage2；seed 只含
compiler 包入口闭包。

**通常连带改动**：改动 `compiler/` → 先验证「旧种子能编译新源码」（`nix flake check`
或 `nix build .#vuna-seed`）；新语法先以旧语法落地 → rotate → 再用。详见
[bootstrap.md](reference/bootstrap.md)。测试：`checks.seed-selfhost`、第 13 段。

## 改一处 → 跑什么（速查）

| 你改了什么 | 最小验证 |
| --- | --- |
| 只改 `lib/` 工具链 | `vuna fmt --check <改动的文件>` + `vuna lint lib/Vuna/*.vuna` + 第 14–16、30–32 段 |
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