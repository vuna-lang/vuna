# 架构：子系统地图与数据流

本文是 vuna 仓库的**子系统地图**：回答“改一个功能要在哪些模块动手、该跑哪段测试”。
阅读顺序：本文 → 命中的子系统 `docs/reference/*` → 源码；不要通读全仓。逐模块职责与
codegen 要点见 [compiler.md](reference/compiler.md)，语言语义见 [language.md](reference/language.md)，
自举链见 [bootstrap.md](reference/bootstrap.md)。

## 仓库分层

```text
根包 vuna（产品 CLI + 工具链，模块根 lib/，入口 app/Main.vuna）
 ├─ 成员包 vuna-compiler（模块根 compiler/lib/，入口 compiler/app/Main.vuna）→ seed/ 的唯一来源
 └─ 成员包 vuna-base（模块根 base/lib/，标准库 Base.* + Prelude）
依赖图：vuna → vuna-compiler → vuna-base，根包也直接依赖 vuna-base
```

- `compiler/`：编译器（所有 `Vuna.Compiler.*`），其入口闭包 = `seed/`；
- `lib/`：根包工具链（`Vuna.Cli` / `Vuna.Interp` / `Vuna.Eval` / `Vuna.Fmt` /
  `Vuna.Lint` / `Vuna.Repl` / `Vuna.Doc` / `Vuna.TestRunner` / `Vuna.Files` /
  `Vuna.Process`）；
- `base/`：标准库（`Base.*` + 顶层 `Prelude`）；
- `app/Main.vuna`：`main = exit (runCli (getArgs))`，只做分发。

**TCB 边界**：`seed/` 只由 `compiler/app/Main.vuna` 的 import 闭包生成；`lib/`（工具链）
与 `app/` 都在 TCB 之外。判断“某模块会不会进 seed”：看它是否被 `Vuna.Compiler.*`
传递 import，以及是否在 `compiler/vuna.toml` 的 `[export]` 里。

## 1. HM 主路径：Lexer → Parser → Loader → Typecheck → TypedCodegen

**何时该看这里**：改语法、import/模块解析、类型检查规则、OCaml 代码生成；
绝大多数日常改动落在这条链上。

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

**入口符号**：
- `Vuna.Compiler.Compile.compileFileTyped` / `compileFileTypedIn` / `compileFileTypedExec`
  （单文件 typed 编译）；`Compile.checkFile` / `checkFileIn` / `checkPackageIn`（只检查）
- `Vuna.Compiler.Loader.loadProgram` / `loadProject` / `resolveProject`（`loadProgramRaw` 是 `--root` 原始模式）
- `Vuna.Compiler.Typecheck.checkProgramInfoElab` / `checkProgramInfoElabOwners` / `exhaustiveWarningsFor`
- `Vuna.Compiler.TypedCodegen.generateProgramTyped` / `generateSplitProgram` / `generateSplitLibraryProgram`

**解释器侧（不在 seed 内）**：`Vuna.Interp.interpretFile` 复用同一 Loader + Typecheck，
求值走 `Vuna.Eval.runDecls`；`vuna interp` 需要降级（record/trait/deriving）时先检查再求值。

**通常连带改动**：
| 改动 | 需要一起改 |
| --- | --- |
| 新 token / 新语法 | `Lexer` + `Parser` + `Ast`（`Expr`/`Decl` 构造子）+ `Typecheck` + `TypedCodegen` + `Fmt`（打印/幂等）+ `Eval`（interp 路径） |
| 名字解析 / 导出规则 | `Loader`（`Project`/`ExportEntry`）+ `Ast`（`ModDecl`）+ `Typecheck`（env 构建） |
| 类型规则 / 降级 | `Typecheck` + `TypedCodegen` + `Vuna.Eval`（降级后的语义必须一致） |
| 诊断信息 | `Ast`/`Common`（`Span`、`showSpanLoc`）+ 各阶段 `Result` 错误 + 测试 golden |

**建议测试标签**：`test/run-tests.sh` 第 1 段（`corpus/run`）、第 4–5 段（解析/求值
错误）、第 6 段（arity）、第 7–10 段（类型检查正反例、跨模块）、第 11–12 段（typed
codegen 单文件/跨模块）、第 18–27 段（记录、trait、do/Monad、stdlib）。

## 2. DT 路径：Core → Elab → CoreCodegen（+ Dt facade）

**何时该看这里**：改 `--dt` 相关语法、精化规则、索引 unification、擦除 codegen；
HM 路径的任何改动都不应该需要动这里，反之亦然。

**数据流**：
```text
单文件 .vuna + --dt
 → Vuna.Compiler.Parser.parseSource          （与 HM 共用 surface parser）
 → Vuna.Compiler.Elab.elabProgram            （双向精化 + 一阶元变量 + 索引族）
 → Vuna.Compiler.Core eval/quote/conv         （NbE、定义性相等、delta 展开 fuel）
 → Vuna.Compiler.CoreCodegen.checkDtProgram  （擦除检查）
 → Vuna.Compiler.CoreCodegen.generateDtProgram（擦除型 OCaml 生成）
 → ocamlopt
```

**入口符号**：
- `Vuna.Compiler.Dt.dtCheckFile` / `dtCompileFile` / `dtEvalFile`（单文件 facade）
- `Vuna.Compiler.Elab.elabProgram`
- `Vuna.Compiler.Core.eval` / `quote` / `conv` / `normalize` / `defaultFuel`
- `Vuna.Compiler.CoreCodegen.checkDtProgram` / `generateDtProgram`
- 经 `Vuna.Compiler.Compile.compileFileDt` / `checkFileDt` 与 `Vuna.Compiler.CompilerCli`
  暴露给 CLI（`compile --dt` / `check --dt` / `interp --dt`）

**边界**：DT 不经过 Loader，不支持 `import` / `--root` / 包模式，不进入 `build` /
`build --split` / `seed`。HM 路径（interp + typed + split）语义与产物必须不变。

**通常连带改动**：`Core`（Term/Value 构造子）→ `Elab`（精化/覆盖率）→
`CoreCodegen`（擦除与生成）三处必须同步；`docs/dt-core.md` 记录设计边界。

**建议测试标签**：第 34 段（`corpus/dt` 12 个正例、`corpus/dt_err` 15 个反例，
`interp --dt` / `check --dt` / `compile --dt` 三路）。

## 3. 包与 workspace：Toml → Manifest → Pkg → Loader

**何时该看这里**：改 `vuna.toml` 格式、workspace 成员、依赖 DAG、`[export]` 可见性、
模块根解析。

**数据流**：
```text
vuna.toml
 → Vuna.Compiler.Toml.parseToml              （TOML 子集 → List TomlEntry，带行号）
 → Vuna.Compiler.Manifest.parseManifest       （→ Manifest；validateManifest 做结构校验）
 → Vuna.Compiler.Pkg.loadPackage/workspacePackages （依赖 DAG、packageRoots、findManifestDir）
 → Vuna.Compiler.Loader.loadProject           （Root 列表：本包 lib/ + 依赖包 lib/）
```

**入口符号**：`Vuna.Compiler.Manifest.parseManifest` / `validateManifest`；
`Vuna.Compiler.Pkg.loadPackage` / `workspacePackages` / `packageRoots` / `packageEntry` /
`packageExports`；`Vuna.Compiler.Loader.loadProject` / `loadProjectModules` /
`resolveProject`。CLI 侧组合在 `Vuna.Compiler.SplitCli.compilePackage` /
`buildSplit` / `seedSplit`。

**约束**：`Toml` / `Manifest` 不做文件 I/O（调用方读入字符串）；`Pkg` 只做 lexical
路径规范化，不做 realpath；跨包只认依赖包 `[export]` 列表，隐藏模块报
`is not exported by package ...`；依赖图必须是 DAG。

**通常连带改动**：新增 manifest 字段 = `Manifest`（data + parse + validate + accessor）
+ `Pkg`（消费）+ `SplitCli`/`Cli`（CLI）+ `examples/multi` 与 `corpus/packages` 夹具。

**建议测试标签**：第 28–29 段（包模式正例/错误例）、第 33 段（包级 compile 与增量
构建）、`checks.vuna-package`。

## 4. 根包工具链与 TCB 边界

**何时该看这里**：改 `vuna` 子命令、fmt/lint/repl/doc/test/map、解释器与求值器。

**入口符号**：
- `Vuna.Cli.runCli`（产品 CLI 分发；`compilerUsageLines` + `toolUsageLines` 定义用法）
- `Vuna.Interp.interpretFile` / `interpretFileIn`、`Vuna.Eval.runDecls`
- `Vuna.Fmt.formatSource`、`Vuna.Lint.runLint`、`Vuna.Repl.runRepl`、
  `Vuna.Doc.runDoc`、`Vuna.TestRunner.runTests`、`Vuna.Files.collectVunaFiles`
- `Vuna.Index.buildIndex` / `loadOrBuild` / `findSymbol` / `impactOf` / `renderApi`
  （`vuna map` / `vuna api`；索引缓存在 `.local/index/`，parse 级、不进 seed）
- `Vuna.Process.runIn`（与 `Vuna.Compiler.Process.runIn` 同名，工具链侧实现）

**TCB 边界（硬约束）**：工具链永不进入 seed。`compiler/app/Main.vuna` 的 import 闭包
不含任何 `Vuna.*` 工具模块；`nix/seed-rotate.sh` 与 `flake.nix` 用同一 blacklist 断言：
`Cli Fmt Lint Doc Repl TestRunner Files Eval Interp Process Codegen Index`。新增工具模块
时必须同步这个清单，否则 `checks.seed-selfhost` 会在 TCB 泄漏时失败。

**效应内建的包级 allowlist**：`Vuna.Compiler.Loader.packageAllowsEffects` 只放行
`vuna` / `vuna-compiler` / `vuna-base` 三个包直接调用 effectful 内建；其余包必须经
`Base.IO`。

**通常连带改动**：新子命令 = `Vuna.Cli` 分发 + 对应工具模块 + `toolUsageLines` +
`test/run-tests.sh` 第 14 段（统一 CLI）+ 相关章节；若新模块可能被 compiler 闭包
import，先确认它不进 TCB。

**建议测试标签**：第 14–16 段（CLI / lint / lint --fix）、第 30–31 段（fmt 语义一致、
doc、repl）、第 32 段（fmt golden）、`checks.vuna-lint`。

## 5. 自举链：seed → vuna-seed → vuna-compiler → vuna

**何时该看这里**：改 `compiler/` 后怀疑种子失效、要 rotate seed、或改 Nix 构建图。

```text
seed/（提交入库，compiler 包入口闭包；seed/build.sh + ocamlopt）
 → vuna-seed（stage 0）
 → vuna-seed compile --package --out stage1 compiler && sh stage1/build.sh → vuna-compiler（stage 1）
 → vuna-compiler build . → .output/bin/vuna（产品 CLI）
 → vuna-compiler build --split s1 compiler / s2 compiler → diff -r s1 s2（fixed point）
```
**入口符号 / 命令**：`vuna seed [OUT [DIR]]`（`Vuna.Compiler.SplitCli.seedSplit`）、
`vuna-compiler build --split OUT [DIR]`（`buildSplit`）、`nix/seed-rotate.sh`、
`flake.nix` 的 `packages.vuna-seed` / `vuna-compiler` / `vuna` 与 `checks.seed-selfhost`。
**硬不变量**：当前 seed 必须能编译当前源码；rotation 后 stage1 == stage2（文件集逐字节）；
seed 只含 compiler 包入口闭包。

**通常连带改动**：改动 `compiler/` → 先验证“旧种子能编译新源码”（`nix flake check` 或
`nix build .#vuna-seed`）；需要新语法时先以旧语法落地 → rotate → 再用新语法。
详见 [docs/reference/bootstrap.md](reference/bootstrap.md)。

**建议测试标签**：`checks.seed-selfhost`（= `checks.fixed-point`）、第 13 段（种子冒烟
`vuna-seed` 编译 `12_fact`）。

## 改一处 → 跑什么（速查）

| 你改了什么 | 最小验证 |
| --- | --- |
| 只改 `lib/` 工具链 | `vuna fmt --check <改动的文件>` + `vuna lint lib/Vuna/*.vuna` + 第 14–16、30–32 段 |
| 改 `base/` 标准库 | 第 26–27 段（monad / stdlib）+ `vuna check .` |
| 改 `compiler/` 任一模块 | 全量 `test/run-tests.sh` + `nix flake check`（至少 seed-selfhost） |
| 改语法/类型规则 | 第 1、4–12、18–27 段 + 全量测试 + 编译器自检 |
| 改 `--dt` | 第 34 段 + HM 路径零回归（全量测试） |
| 改 `vuna.toml` 机制 | 第 28–29、33 段 + `checks.vuna-package` |
| 改 Nix | `nix flake check`（`checks.*` 全绿）+ `nix build .#vuna` |

## 相关阅读

- 模块职责、codegen 与 metrics：[compiler.md](reference/compiler.md)
- 种子策略与 rotation：[bootstrap.md](reference/bootstrap.md)
- 测试、corpus 分类与 nix checks：[testing.md](reference/testing.md)
- 语言语义：[language.md](reference/language.md)、[type-system.md](reference/type-system.md)、
  [dt.md](reference/dt.md)；路线图：[docs/roadmap.md](roadmap.md)；DT 设计：[docs/dt-core.md](dt-core.md)
