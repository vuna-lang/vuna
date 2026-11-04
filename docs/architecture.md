# 架构：子系统地图与数据流

本文是 vuna 仓库的**子系统地图**：回答“改一个功能要在哪些模块动手、该跑哪段测试”。
逐模块职责与 codegen 要点见 [compiler.md](reference/compiler.md)，Core / 精化器实现见
[core.md](reference/core.md)，语义见 [language.md](reference/language.md) /
[type-system.md](reference/type-system.md)，自举见
[bootstrap.md](reference/bootstrap.md)，内建 / 原语 / 能力见
[primitives.md](reference/primitives.md)。

## 仓库分层

```text
compiler/lib/Vuna/Compiler/   （55 个模块：54 个导出 + 内部 Debug；目录即层：
                                Frontend → Packages → Loader → Core → Elab → Codegen → Driver）
├─ Common.vuna                公共门面（Base 类型 + Pos/Span/诊断）
├─ Intrinsics.vuna            内建声明唯一真源（名字/签名/arity/能力/runtime/可见性）
├─ Frontend/                  Ast Lexer Parser Parser/Support Toml Manifest   词法 / 语法 / vuna.toml
├─ Packages/                  Pkg                              包图与模块根
├─ Loader.vuna + Loader/      Modules Resolve Flatten          模块图 / 名字解析 / flatten
├─ Core.vuna + Core/          Term Eval Conv                   Core TT / NbE / 定义性相等
├─ Elab.vuna + Elab/          Sig Types Meta Case Dict Term
│                             Data Trait InstName Driver Termination
│                             Prelude Match Records Derive     双向精化
├─ Codegen.vuna + Codegen/    Decl Erase Term Assembly Split  擦除检查 + OCaml 生成
└─ Driver/                    Split Dt Compile CompilerCli     输出模型 / facade / 编译入口 / CLI
根包 vuna（模块根 lib/，入口 app/Main.vuna）：Cli/Interp/Fmt/Lint/Index（门面+子模块）、
  Repl/Doc/Lsp/Json/TestRunner/Files
依赖图：vuna → vuna-compiler → vuna-base（根包也直接依赖 base）
```

**目录即层**：目录 = 依赖层次，上层可 import 下层、反向禁止。**门面模式**：`X.vuna` 只
import 子模块并选择性重导出（对外名字面不变），实现只在叶子；**数据定义只在叶子**
（`Core.Term`、`Elab.Types` 等）。目标每模块 ≤~800 行（当前最大 `Elab/Trait.vuna`，约 1.2k）。
`compiler/` 是 seed 唯一来源（`compiler/app/Main.vuna` 的 import 闭包，当前 71 `.ml` / 72
文件，以 `seed/` 与 `nix/seed-count.txt` 为准）；`lib/` 工具链与 `app/` 在 TCB 之外；
`base/` 模块名就是公开 API。

## 1. 编译链：Frontend → Loader → Elab → Codegen

**何时该看这里**：改语法、import / 模块解析、DT 精化规则、索引 unification、擦除 codegen。

```text
源文件
 → Frontend.Lexer.lexSource      （token + Pos/Span；lexComments 供 fmt）
 → Frontend.Parser.parseSource   （offside layout → AST + imports）
 → Packages.Pkg.contextForFile   （最近 vuna.toml + 依赖闭包 → PackageContext；无则 base-only）
 → Loader.Flatten.loadProject    （import 图 → 名字解析 → flatten；ad-hoc 自动注入 Prelude）
 → Elab.Driver.elabProgramFull   （Records/Derive 降级 → 精化；NbE / 索引合一 / 实例搜索）
 → Codegen.Assembly              （同一份 DtProgram 的 unit 划分 / 文本 / main 钩子）
 → Codegen.Split.generateDtSplitProgram  （唯一生成器：Vuna_runtime + 各模块 + Main + build.sh）
 → sh build.sh                   （ocamlopt 逐模块编译并链接）
```

**名字解析三命名空间**：`Loader.Resolve` 的解析期状态是三个**分开**的表
（`Loader.Modules.Namespaces`：值 `nsValues` / 构造子 `nsCtors` / 类型 `nsTypes`，与导出
`kind` 的 `val` / `ctor` / `type` 一一对应）。类型位置只查类型表（退化：索引构造子 →
本模块类型层 def），值位置查值表（def → ctor → 导入值 / ctor → **类型作为项**的最后退路）。
语义与边界见 [language.md 的「type / value 双命名空间」](reference/language.md)。

**擦除 / 合一 / 定义形式**：擦除只有单一判据链（`Elab.Meta.isTypeDomain` →
`binderRig` → `Core.rigOfBinder`，读取侧统一 `Core.rigIsErased`）；元变量求解在
`Core.Conv.solveMeta`（created-depth 随 `Sols` 就地检查，非空 spine 走 Miller pattern）；
已解元变量进项只经 `Elab.Meta.zonkTerm`；`axiom` 是无体擦除定义（`DtAxiom`，运行时使用由
`Codegen.Erase.checkNoAxiomRuntime` 拒绝），定义参数少于签名时按剩余 Pi η 展开。细节见
[core.md](reference/core.md)。

**相等 / 实例 / 证明**：`==` / 比较是证据驱动的（Int/String 内建或 `Eq` / `Ord` 字典，
无泛型兜底）；约束实例与参数化 `deriving` 可用，命名实例不存在；隐式值参数 `{x : a}` 与
构造子 η 展开在 `Elab.Meta`；`DtDef` 带来源 span。trait / 实例语义见
[records-traits.md](reference/records-traits.md)。

**内建单一真源**：`Vuna.Compiler.Intrinsics` 是名字 / 签名 / arity / 归约 / 能力 / runtime /
可见性的唯一真源；`Loader.Resolve`（arity、放行、能力）、`Elab.Prelude`（签名）、
`Core.Eval`（归约）、`Codegen.Term`（runtime）都消费它。内置身份按声明 symbol 判定：
`Bool` / `List` / `IO` 是 base 普通 data（`Base.Bool.Bool` / `Base.List.List` /
`Base.IO.IO`），不按短名 / `lastName`。

擦除检查由 `Codegen.Assembly.checkDtProgram` 负责（判据 `Core.rigIsErased`）。`vuna interp`
走同一精化链后由 `Driver.Dt.dtEvalFile` 求 `main`（纯求值：只展示 `Int`/`String`/`Bool`，
任何 `main : IO a` 报错并提示 `compile`）。

**入口符号**：`Driver.Dt.dtCheck` / `dtCheckLibrary` / `dtSplitProject` / `dtEvalFile` /
`dtEvalExpr`；`Loader.Flatten.loadProject*` / `resolveProject`；`Elab.Driver.elabProgramFull`
（洞目标 `goalsOfProgram`）、`Elab.Termination.checkTerminationDecls`、`Elab.Match.multiToExpr`、
`Core.Eval` / `Core.Conv`；`Intrinsics.findIntrinsic`、`Loader.Resolve.checkEffectsBuiltins`；
`Codegen.Assembly.*`；`Codegen.Split.generateDtSplitProgram`；
`Driver.Split.SplitFile` / `buildScript`；CLI 经 `Driver.Compile.*` 接 `Driver.CompilerCli`。

**通常连带改动**：语法 = `Frontend.{Lexer,Parser,Ast}` + `Fmt` + `Elab.Term` / `Elab.Match` +
`Codegen`；名字解析 = `Loader.{Modules,Resolve,Flatten}`；类型规则 = `Elab.*` +
`Elab.{Records,Derive}` + `Codegen`；split = `Codegen.Split` + `Driver.Split`；诊断 =
`Frontend.Ast` / `Common` + 各阶段 `Result` 错误 + golden。建议测试标签：第 1–11、13–27、
30、34 段（见 [testing.md](reference/testing.md)）；包构建 / split 见第 28/29/33/34 段；
快照与上下文回归见第 38/39 段。

## 2. 包与 workspace

**何时该看这里**：改 `vuna.toml`、workspace 成员、依赖 DAG、`[export]` 可见性、包上下文。

```text
vuna.toml → Frontend.{Toml.parseToml, Manifest.parseManifest/validateManifest}
 → Packages.Pkg.loadPackage / workspacePackages（DAG、模块根）
 → contextForFile（最近 manifest + 依赖闭包）| contextForDir（工具/REPL 从 cwd）
   | locateBase（无 manifest → base-only：`VUNA_BASE` 或 exe 相对布局，失败报错）
 → Loader.loadProject（PackageContext → Project；`[capabilities].effects` 随上下文传递）
```

**入口符号**：`Pkg.loadPackage` / `workspacePackages` / `findManifestDirMaybe` /
`contextForFile` / `contextForDir` / `locateBase` / `contextCapabilities`
（`PackageContext` 抽象 + `contextPackage` / `contextRoots` / `contextDir`）；
`Manifest.manifestCapabilities`、`Loader.Flatten.loadProject*` / `resolveProject`；CLI 在
`Driver.Compile.checkPackage` / `compileToDir`。

**约束**：Toml/Manifest 不碰 I/O，Pkg 只做 lexical 规范化；**每个源文件唯一包上下文**，
目录入口 `check/build <dir>` 直接 `loadPackage` 只认该目录 manifest（不向上找）；跨包只认
依赖包 `[export]`，隐藏模块报错；依赖图 DAG、包名唯一（diamond 合法）；`[capabilities]`
能力名合法性由 Loader 校验。测试：第 28–29、33、39 段 + `checks.vuna-package`。

## 3. 根包工具链与 TCB 边界

**何时该看这里**：改 `vuna` 子命令、fmt/lint/repl/doc/test/map、解释器 facade。

- `Vuna.Cli.runCli` 分发；`Vuna.Interp.interpretFile/interpretExpr`（`PackageContext` 入参，
  实际 `Driver.Dt.dtEvalFile`）、`Vuna.Repl.runRepl`、`Vuna.TestRunner.runTests`、
  `Vuna.Doc.runDoc`、`Vuna.Files.collectVunaFiles`；fmt/lint 见 `Fmt.formatSource` /
  `Lint.runLint`（+ 子模块）。
- 进程执行只在 `Driver.CompilerCli.runIn`（`prim_runIn`，需要 `process`；工具链经 `runIO`）。
- **TCB**：工具链永不进 seed（`compiler/app/Main.vuna` 闭包不含 `Vuna.*` 工具模块；
  `nix/tcb-forbidden.txt` 黑名单）；效应边界是 manifest 显式能力
  （`[capabilities].effects` ∈ console/fs/process/env/clock/unsafe），
  `checkEffectsBuiltins` 按 `Intrinsics` 能力位检查；原语返回 `IO` 动作（只在 `main` 执行），
  未声明能力的包只能经 `Base.IO`，`runIO` 需 `unsafe`。

## 4. LSP 与索引（工具链侧，不进 seed）

- `Vuna.Lsp.runLsp`：JSON-RPC over stdio；帧按字节读（body 后无换行，见
  [tooling.md](reference/tooling.md) §2）；诊断走 `Pkg.contextForFile` + DT 精化（含 import
  的文件同样类型检查）；hover = 洞目标 + Index 符号；另有 formatting / documentSymbol /
  definition / references / completion / workspace symbol / lint 诊断。
- `Vuna.Index`：parse 级索引（`vuna map` / `vuna api`，缓存 `.local/index/`，内容哈希判定
  新鲜度）。

## 5. 自举链：seed → vuna-seed → vuna-compiler → vuna

**何时该看这里**：改 `compiler/` 后怀疑种子失效、要 rotate seed、改 Nix 构建图。

```text
seed/ →（seed/build.sh + ocamlopt）→ vuna-seed →（build --no-compile --out s1 compiler；
sh s1/build.sh）→ stage1 →（build --no-compile --out s2 compiler）→ diff -r s1 s2
 → vuna-compiler build . → .output/bin/vuna（同为逐模块输出）
```

命令 / 入口：`build --no-compile --out`（`compileToDir` → `dtSplitProject` →
`generateDtSplitProgram`）、`nix/seed-rotate.sh`、`checks.seed-selfhost`。**硬不变量**：
旧 seed 能编译新源码；rotation 后 stage1 == stage2；seed 只含 compiler 包入口闭包。
测试：第 13/38 段 + `checks.seed-selfhost`，详见 [bootstrap.md](reference/bootstrap.md)。

## 改一处 → 跑什么（速查）

| 你改了什么 | 最小验证 |
| --- | --- |
| 只改 `lib/` 工具链 | `vuna fmt --check <文件>` + `vuna lint lib/Vuna/Cli.vuna` + 第 14–16、30–32 段 |
| 改 `base/` 标准库 | 第 26–27 段（monad / stdlib）+ `vuna check .` |
| 改 `compiler/` 任一模块 | 全量 `test/run-tests.sh` + `nix flake check`（至少 seed-selfhost） |
| 改语法 / 类型规则 / DT 精化 / 擦除 codegen | 第 1–11、13–27、30、34 段 + 全量测试 + 编译器自检 |
| 改 split 输出 / `vuna.toml`（含 `[capabilities]`） | 第 28–29、33、34、38、39 段 + `vuna check` + `checks.vuna-package` / `seed-selfhost` |
| 改 Nix | `nix flake check`（`checks.*` 全绿）+ `nix build .#vuna` |
