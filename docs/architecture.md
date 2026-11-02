# 架构：子系统地图与数据流

本文是 vuna 仓库的**子系统地图**：回答“改一个功能要在哪些模块动手、该跑哪段测试”。
阅读顺序：本文 → 命中的子系统 `docs/reference/*` → 源码；不要通读全仓。逐模块职责与
codegen 要点见 [compiler.md](reference/compiler.md)，语言语义见 [language.md](reference/language.md)，
自举链见 [bootstrap.md](reference/bootstrap.md)。

> **迁移期提示（2026-11，M23 起）**：语言夹具与解释器已切到 DT（`vuna interp` = DT 精化 +
> 核心求值；夹具走 `check --dt` / `compile --dt`）。HM 主路径（`Typecheck` / `TypedCodegen` /
> `Split`）作为代码路径保留到 M24（产品自检与 HM 包构建仍守门），之后删除；新增能力只加 DT。
> 计划见 [docs/roadmap.md](roadmap.md)，历史证据见 [dt-parity.md](reference/dt-parity.md)。

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

## 1. HM 主路径：Lexer → Parser → Loader → Typecheck → TypedCodegen

> **迁移期模块，终态删除**（M24）。新能力不要加在这里，加到第 2 节。

**何时该看这里**：改语法、import/模块解析、HM 类型检查与 typed codegen；HM 仍是产品 CLI
自检与包构建（M24 前）的检查器，解释器与语言夹具已不走这条链（见第 2 节）。

**数据流**：
```text
源文件
 → Vuna.Compiler.Lexer.lexSource            （token + Pos/Span；lexComments 单独供 fmt）
 → Vuna.Compiler.Parser.parseSource          （offside layout → AST + imports）
 → Vuna.Compiler.Loader.loadProgram          （模块根 → import 图 → 名字解析 → flatten）
 → Vuna.Compiler.Typecheck.checkProgramInfoElab  （HM 检查 + 记录/trait 降级 → (globals, elabDecls)）
 → Vuna.Compiler.TypedCodegen.generateProgramTyped（原生 OCaml；分离编译用 generateSplitProgram）
 → ocamlopt                                  （单文件直接编；分离编译走生成的 build.sh）
```

**入口符号**：`Compile.compileFileTyped*`（单文件 typed 编译）/ `checkFile*` /
`checkPackageIn`（只检查）；`Loader.loadProgram` / `loadProject` / `resolveProject`
（`loadProgramRaw` 是 `--root` 原始模式）；`Typecheck.checkProgramInfoElab*` /
`exhaustiveWarningsFor`；`TypedCodegen.generateProgramTyped` / `generateSplitProgram` /
`generateSplitLibraryProgram`。

**解释器侧（不在 seed 内）**：`vuna interp` 经 `Vuna.Interp` 调 `Dt.dtEvalFile`（见第 2 节），
不再走 HM；`vuna test` / `vuna repl` 同此，旧的 `Vuna.Eval` 已删除。

**通常连带改动**：新 token/语法 = `Lexer` + `Parser` + `Ast` + `Fmt` + `Typecheck` +
`TypedCodegen`（HM，M24 删除）+ `Elab`/`DtMatch`/`CoreCodegen`（DT）；名字解析/导出 =
`Loader`（`Project`/`ExportEntry`）+ `Ast`（`ModDecl`）+ `Typecheck`（env）；类型规则/降级 =
`Typecheck` + `TypedCodegen` + `DtRecords`/`DtDerive`/`Elab`（两条路径语义必须一致）；诊断 =
`Ast`/`Common`（`Span`、`showSpanLoc`）+ 各阶段 `Result` 错误 + 测试 golden。

**建议测试标签**：第 1–11、13–27、30、34 段（语言夹具已切 DT，见
[testing.md](reference/testing.md)）；第 28/29/33 段为 HM 包构建（M24 前保留）。

## 2. DT 路径：Loader → Elab → CoreCodegen

> **终态唯一路径**（M21–M24.7 补齐效应 / codegen / 包入口 / 库化，最终接管 seed；阶段状态见
> [docs/roadmap.md](roadmap.md)）。

**何时该看这里**：改 DT 精化规则、索引 unification、擦除 codegen，或 `vuna interp` 的
核心求值（interp 已默认走这条路径，不再有 `--dt` 开关）。

**数据流**：
```text
.vuna + --dt（M20 起 import / --root；M22.1 起包目录；interp 自 M23 起无需 --dt）
 → Parser.parseSource                  （与 HM 共用 parser）
 → Loader.loadProgramRaw / Ordered      （入口 + 依赖模块声明，按依赖序拼接）
 → Elab.elabProgramFull                 （DtRecords → DtDerive → elabProgramGo；
     body 内走 DtMatch.multiToExpr 与 Core 的 NbE / 索引合一 / 实例搜索）
 → CoreCodegen.checkDtProgram / generateDtProgram（擦除检查 + 擦除型 OCaml 生成）
 → ocamlopt
```

`vuna interp` 走同一精化链后由 `Dt.dtEvalFile` 求 `main` 值（纯求值：只展示
`Int`/`String`/`Bool`，任何 `main : IO a` 一律报错并提示 `compile`）。

**入口符号**：`Dt.dtCheckFile` / `dtCompileFile` / `dtEvalFile` / `dtEvalExpr`（REPL）；
`Loader.loadProgram*`；`Elab.elabProgramFull`（洞目标 `goalsOfProgram`）、
`DtTerm.checkTerminationDecls`；`DtMatch.multiToExpr` / `buildColumnExpr`；
`Core.eval` / `quote` / `conv` / `normalize`；`CoreCodegen.checkDtProgram` /
`generateDtProgram`；CLI 经 `Compile.compileFileDt` / `CompilerCli`（`--dt` 只在
`check` / `compile` / `build` / `seed` 上保留到 M24）。

**边界**：`--dt` 支持 `import`/`--root`（M20）与包目录（M22.1）；`main : IO a`/`do`/
`Base.IO` 可用（M21）；`build --dt` / `seed --dt` 产整程序单文件（M22.3，逐模块切分留
M24）。M23 起 `vuna interp` 默认 DT 核心求值（record update / 参数化 record / `@inst` /
实例与派生诊断可用；`where` 语法终态不保留）；擦除判据收敛到 `Core.rigIsErased`。细节见
[limits.md](reference/limits.md) 与 [dt-core.md](dt-core.md)。

**通常连带改动**：`Core` → `Elab` → `CoreCodegen` 三处同步（见 [dt-core.md](dt-core.md)）；
测试见 [testing.md](reference/testing.md)。

## 3. 包与 workspace：Toml → Manifest → Pkg → Loader

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
`loadProjectModules` / `resolveProject`；CLI 侧组合在 `SplitCli.compilePackage` / `buildSplit` /
`seedSplit`（模块前缀均为 `Vuna.Compiler.`）。

**约束**：`Toml`/`Manifest` 不做文件 I/O；`Pkg` 只做 lexical 路径规范化；跨包只认依赖包
`[export]` 列表，隐藏模块报 `is not exported by package ...`；依赖图必须是 DAG。

**通常连带改动**：新增 manifest 字段 = `Manifest`（data+parse+validate+accessor）+
`Pkg`（消费）+ `SplitCli`/`Cli` + `examples/multi` 与 `corpus/packages` 夹具；测试第
28–29 段、第 33 段、`checks.vuna-package`。

## 4. 根包工具链与 TCB 边界

**何时该看这里**：改 `vuna` 子命令、fmt/lint/repl/doc/test/map、解释器 facade。

**入口符号**：
- `Vuna.Cli.runCli`（产品 CLI 分发；`compilerUsageLines` + `toolUsageLines` 定义用法）
- `Vuna.Interp.interpretFile` / `interpretFileIn`（DT facade）；`Dt.dtEvalFile` 是实际入口
- `Vuna.Fmt.formatSource`、`Vuna.Lint.runLint`、`Vuna.Repl.runRepl`、`Vuna.Doc.runDoc`、
  `Vuna.TestRunner.runTests`、`Vuna.Files.collectVunaFiles`
- `Vuna.Index.buildIndex` / `loadOrBuild` / `findSymbol` / `impactOf` / `renderApi`
  （`vuna map` / `vuna api`；索引缓存在 `.local/index/`，parse 级、不进 seed）
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

## 5. 自举链：seed → vuna-seed → vuna-compiler → vuna

**何时该看这里**：改 `compiler/` 后怀疑种子失效、要 rotate seed、或改 Nix 构建图。

```text
seed/（提交入库，compiler 包入口闭包；seed/build.sh + ocamlopt）→ vuna-seed（stage 0）
 → vuna-seed compile --package --out stage1 compiler && sh stage1/build.sh → vuna-compiler
 → vuna-compiler build . → .output/bin/vuna（产品 CLI）
 → vuna-compiler build --split s1/s2 compiler → diff -r s1 s2（fixed point）
```
**入口符号 / 命令**：`vuna seed`（`SplitCli.seedSplit`）、`build --split`（`buildSplit`）、
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
| 改 DT 路径 / `--dt` | 第 1–11、13–27、30、34 段 + HM 代码路径零回归（全量测试） |
| 改 `vuna.toml` 机制 | 第 28–29、33 段 + `checks.vuna-package` |
| 改 Nix | `nix flake check`（`checks.*` 全绿）+ `nix build .#vuna` |

## 相关阅读

[compiler.md](reference/compiler.md)（模块职责与 codegen）、[bootstrap.md](reference/bootstrap.md)
（种子与 rotation）、[testing.md](reference/testing.md)（测试与 nix checks）、
[language.md](reference/language.md) / [type-system.md](reference/type-system.md) /
[dt.md](reference/dt.md)（语言语义）、[roadmap.md](roadmap.md) 与 [dt-core.md](dt-core.md)（路线与 DT 设计）。