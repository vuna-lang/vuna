# 编译器参考：模块职责、codegen 表示与输出模型

本文覆盖 `compiler/` 包（`vuna-compiler`，模块 `Vuna.Compiler.*`）的模块职责与 codegen
实现要点。子系统的数据流与「改哪里」速查见 [architecture.md](../architecture.md)，Core /
精化器内部规则见 [core.md](core.md)，种子与自举链见 [bootstrap.md](bootstrap.md)。

## 模块地图

`compiler/` 是编译器包（seed 的唯一来源）。入口 `compiler/app/Main.vuna` 的 import 闭包
就是 `seed/` 的内容（当前 **75 个 `.ml` / 76 个文件**，以 `seed/` 与
`nix/seed-count.txt` 为准）；工具链（fmt/lint/repl/doc/test/lsp）在根包 `lib/`，不在闭包里。
代码按**目录即层**组织：Frontend → Packages → Loader → Core → Elab → Codegen → Driver，
同层模块可互相 import，上层只能依赖下层。每层 `X.vuna` 是**门面**：只 import 子模块并选择性
重导出，实现与数据定义都在 `X/` 的叶子模块。全包 **55 个模块**（54 个导出 + 内部 `Debug`）；
目标每模块 ≤~800 行（当前超过目标的最大模块是 `Elab/Trait.vuna`，约 1.2k 行）。

| 模块 | 职责 | 关键入口 |
| --- | --- | --- |
| `Common` | 编译器门面：整模块重导出 `Base.Pair`/`Bool`/`List`/`Maybe`/`Result`/`String`，并保留 `Pos`/`Span`、模块路径与诊断工具 | `showSpanLoc`、`suggest`、`splitPath` |
| `Diagnostics`（门面） | 错误码体系入口：整模块重导出 `Diagnostics.Tc`/`Cg`/`Common` 与 `Base.Nat`/`Vec`，调用点名字集合不变 | `tcErr0`、`cgErr0`、`tcAll`、`cgAll` |
| `Diagnostics.Tc` / `Cg` | `TcErr : Nat -> Type` / `CgErr : Nat -> Type` 域枚举（构造子携带模板、arity 由索引锁定）；`tcAll`/`cgAll` 按 arity 分块（避免单行巨表） | `tcCode`、`tcTemplate`、`cgCode`、`cgTemplate` |
| `Intrinsics` | **内建声明唯一真源**：名字/签名形状（`IType`）/arity/归约标签（`IntrinsicOp`）/能力（`Capability`）/runtime 名/用户可见性；内置身份按声明 symbol（`Base.Bool.Bool` / `Base.List.List` / `Base.IO.IO`） | `findIntrinsic`、`intrinsicRuntime`、`intrinsicCapability`、`parseCapability` |
| `Frontend.Ast` | 语法类型与 AST helper（`Expr`/`Decl`/`Pat`/`Ctor`/`Import`/`ModDecl`/`TraitMethod`） | `clausesFor`、`funArity`、`declNames` |
| `Frontend.Lexer` | 字符游标、token 与位置；注释单独 lex 出来供 formatter 使用 | `lexSource`、`lexComments` |
| `Frontend.Parser` | offside layout parser → AST + imports；`where` 块与绑定签名行；方法签名带 span；M32 起顶层签名可带约束 ctx（`C a =>`） | `parseSource`、`parseExpressionSource` |
| `Frontend.Toml` | TOML 子集解析器 | `parseToml`、`lookupEntry` |
| `Frontend.Manifest` | `vuna.toml` 的语义模型与结构校验（`[package]` 只有 `name`；不做 I/O） | `parseManifest`、`validateManifest` |
| `Packages.Pkg` | 包 / workspace 解析层：manifest 图、依赖 DAG、**每个文件的包上下文**（最近 manifest + 依赖闭包）、base 定位（不碰 Loader / CLI） | `loadPackage`、`workspacePackages`、`contextForFile`、`contextForDir`、`locateBase` |
| `Loader`（门面） | 模块加载、名字解析与 flatten 的稳定入口；对外导出 `Project` / `Module` / `ExportEntry` 与 `loadProject*` / `resolveProject` | `loadProject`、`loadProjectModules`、`resolveProject` |
| `Loader.Modules` | 加载器的数据与模块图（叶子）：模块根、import 边、导出表结构 | `collectModuleFiles`、`moduleAllImportsOf` |
| `Loader.Resolve` | 名字解析 + 效应能力检查：把 parse 后声明/表达式解析成带模块前缀的名字；内建 arity/prelude 放行/能力检查都消费 `Intrinsics` | `resolveProgram`、`checkEffectsBuiltins` |
| `Loader.Flatten` | 模块导出表计算、加载流程与 flatten（`Prelude` 自动导入——含 ad-hoc 单文件、`[export]` 可见性）；内存源码的**库模块**入口（LSP） | `loadProject`、`loadProjectModules`、`loadProjectSource`、`loadModuleSource`、`visibleFixitiesOf` / `dedupeFixities`、`fixitiesForSource` / `fixitiesForSourceIn`（fmt/LSP/lint 的程序级 fixity） |
| `Core`（门面） | core 类型论表示、NbE 求值与定义性相等等公开面；细节见 [core.md](core.md) | `Core.Eval.eval`、`quote`、`normalize`、`Core.Conv.conv`、`Core.Term.defaultFuel` |
| `Core.Term` | `Term`/`Value`/`Neutral`/`Closure`/`Rig`/`Level`/`Sols` 等数据（唯一真源）与 `shift`/`substVarAt`/显示等纯项变换 | `shift`、`substVarAt`、`rigIsErased` |
| `Core.Eval` | beta 求值、delta 展开、prelude 原语归约、深度正规化与 quote | `eval`、`force`、`applyClosure`、`normalize`、`quote` |
| `Core.Conv` | 定义性相等（beta + delta + eta）与元变量求解（Miller pattern + 创建深度就地检查；非 pattern 报 `TC_CannotSolveHigherOrder`） | `conv`、`convBoth`、`solveMeta` |
| `Elab`（门面） | DT 精化器稳定入口；按 `Elab.*` 前缀选择重导出 `Types`/`Meta`/`Data`/`Trait`/`Driver` 的公开名 | `Elab.Driver.elabProgramFull`、`goalsOfProgram` |
| `Elab.Sig` | 签名工具：trait 类参数 kind 推断 + 顶层签名自由名量化（M32：约束 ctx 与类型一起参与自由名扫描与 kind 推断）；量化 banned 集按模块作用域计算，`qualifiedBannedTbl` 一次建表 + per-sig O(1) 查 | `quantifyTopSig`、`quantifyTopSigCtxCached`、`qualifiedBannedTbl`、`classParamKind` |
| `Elab.Types` | Elab 的数据定义与共享状态：`DtDef`/`DtAxiom`/`DtCtor`/`DtData`/`DtGoal`/`DtClass`/`DtInst`/`DtProgram` 与 `Ctx`；`Ec` 带 ctor/defVal 索引缓存，`DtProgram` 带 `defVals` | `dtDataName`、`dtDefType`、`dtDefBody`、`dtProgDefs`、`dtProgDefVals` |
| `Elab.Meta` | 共享工具层：值/构造子引用、`convEc`、元变量创建深度与统一 `zonkTerm`、擦除判据（`isTypeDomain`/`binderRig`）、命名空间查询（`typeLookup`/`valueLookup`）、canonical Bool 的 `TBool` 表示 | `convEc`、`zonkTerm`、`binderRig`、`typeLookup`、`dictTypeName` |
| `Elab.Case` | case 规范形：索引合一（`unifyIdx`）、scrutinee 反射、单一可达性判据（`BranchVerdict`/`allCtorsUnsatisfiable`）、空族与冗余/不可达诊断 | `unifyIdx`、`reflectScrutinee`、`checkCoverage`、`isEmptyFamilyValue` |
| `Elab.Dict` | 字典编码的表示与实例搜索：字典类型/实例头识别、`conv` 头匹配、实例搜索（递归解 ctx / 约束实例）、`==`/比较运算符特化（Int/String 内建或 Eq/Ord 字典；无泛型结构比较兜底） | `searchInstance`、`dictFamilyNameOf`、`cmpRuntimeName`、`deferEqDict` |
| `Elab.Term` | 项的双向检查（与 case 规则互递归的核心）：`inferE`/`checkE`/应用/隐式插入/类型检查 | `inferE`、`checkE`、`checkApp`、`checkType` |
| `Elab.Data` | `data` 声明与构造子/索引擦除：`elabCtor`、`elabDataHead(s)`、`elabDataBodies`、擦除候选；校验 kind 结果层级与构造子字段 sort | `elabDatas`、`ctorFieldTerms`、`checkCtorFieldSorts` |
| `Elab.Trait` | trait/instance 声明与实例体：类参数 kind、方法投影、实例头检查（重复/相干性；无命名实例、支持约束实例 ctx）、方法体精化；M32 起实例 ctx 与顶层签名 ctx 共用 `elabConstraintDomains`（含类参数 kind 校验），隐式字典 binder 按 Rig1 绑定；方法签名带 span，实例名=单类前缀+完整 head 名 | `checkInstanceHeads`、`elabInstanceBodies`、`elabConstraintDomains`、`instanceName` |
| `Elab.InstName` | 实例名生成规则（单类前缀 + 完整 head 名）的唯一实现 | `instanceName` |
| `Elab.Driver` | 精化入口与程序组装：签名（M32：约束 ctx → 隐式字典 binder）→ data/trait/instance → 定义体（声明的字典目标先解到 ctx binder，剩余才提升）→ zonk/终止性检查 → `DtProgram`；洞目标 | `Elab.Driver.elabProgramFull`、`goalsOfProgram`、`dtEvalExprIn` |
| `Elab.Termination` | 终止性检查：调用图 + SCC，结构下降/守卫 Int 判据（无包级豁免） | `checkTerminationDecls` |
| `Elab.Prelude` | 把 `Intrinsics` 表翻译成 DT prelude globals（签名）；没有第二份名字/签名表 | `preludeGlobals`、`builtinTyName`、`cmpBuiltinTyName` |
| `Elab.Match` | 多 clause 模式矩阵降级：构造子列 → `case`、字面量列 → `if` 链（纯 Ast→Ast） | `multiToExpr`、`buildColumnExpr` |
| `Elab.Records` | `record` 的语法降级：记录 → 单构造器 `data`、字段访问/更新（纯 Ast→Ast） | `desugarRecords`、`RecordInfo` |
| `Elab.Derive` | `deriving` 的实例生成（展开成等价 `instance`，交给既有实例精化） | `expandDerivings` |
| `Codegen`（门面） | DT 擦除 codegen 的稳定入口；重导出 `Codegen.Assembly` 与 `Codegen.Split` | `checkDtProgram`、`generateDtSplitProgram` |
| `Codegen.Decl` | OCaml 名字编码（sanitize/前缀/保留字）+ 变体类型声明；构造子字段形状 keep flags 的实际消费点；内置身份按完整符号（canonical Bool 族不进运行时变体） | `ctorOcamlName`、`genTypeDecls`、`ctorKeepFlags` |
| `Codegen.Erase` | 擦除检查、de Bruijn 作用域/名字护栏、依赖分析与 SCC 分组；axiom 强制进类型级分区，运行时使用报 `CG_AxiomAtRuntime` | `checkAllErasure`、`checkAllDefScopes`、`ensureUniqueOcamlNames`、`checkNoAxiomRuntime` |
| `Codegen.Term` | 项 → OCaml（擦除驱动）+ DT 运行时前缀（`bi_*`、`dtp_*`、IO 桥接）；全局名 → runtime 映射消费 `Intrinsics` | `dtRuntime`、`genDtHook`、`genGroups` |
| `Codegen.Assembly` | 同一份 `DtProgram` 的装配与检查入口 | `prepareDtProgram`、`genUnitText`、`mainHook`、`checkDtProgram` |
| `Codegen.Split` | **唯一** codegen 生成器：逐模块 split 的声明归属表与分文件装配 | `generateDtSplitProgram` |
| `Driver.Split` | 输出文件模型与构建脚本生成：`SplitFile`、依赖序、按内容哈希增量的 `build.sh` | `SplitFile`、`buildScript`、`writeSplitFiles`、`writeSplitFilesIfChanged` |
| `Driver.Dt` | DT 路径 facade（供 `Compile` / `CompilerCli` / `Interp` / LSP 使用）：单一 `PackageContext` 加载形状；内存源码检查/洞目标、`dtMainKind`、`dtEvalExprInfo` | `dtCheck`、`dtCheckLibrary`、`dtCheckSource`、`dtGoalsSource`、`dtSplitProject`、`dtEvalFile`、`dtMainKind` |
| `Driver.Compile` | 编译入口：`PackageContext` 检查/编译、目录式 codegen、构建脚本执行；build meta（确定性/依赖闭包哈希/同哈希跳过）与递归建目录 | `checkPackage`、`compileToDir`、`buildMetaText`、`metaUpToDate`、`writeBuildMeta` |
| `Driver.CompilerCli` | 编译器自己的 CLI（`vuna-compiler`）；含受限进程执行入口 `runIn`；workspace check/build 单元、`build --package`、`version` | `runCompilerCli`、`compilerUsageLines`、`runIn` |
| `Version` | 版本号唯一真源；产品 CLI / `vuna-compiler` / build meta / VSCode 探测共用 | `vunaVersion` |

`compiler/vuna.toml` 的 `[export]` 列出全部 54 个导出模块（内部 `Debug` 不在内）；
`[capabilities] effects` 声明五个能力（编译器直接使用 `prim_*`）。工具链模块不在此包。

## 根包工具链模块（`lib/`，不进 seed）

| 模块 | 职责 |
| --- | --- |
| `Vuna.Cli` | 产品 CLI：工具命令分发 + in-process 调 compiler 命令（`runCli`） |
| `Vuna.Interp` | 解释器 facade（DT 精化 + 核心求值，调 `Driver.Dt.dtEvalFile`；工具链侧） |
| `Vuna.Files` | 目录遍历小工具（fmt/doc/test/Index 共用，`collectVunaFiles`） |
| `Vuna.Fmt`（+ `Fmt.Comment`/`Decl`/`Expr`/`Util`） | 源码格式化器（`vuna fmt`，parse → 规范打印；门面只导出 `formatSourceWith`） |
| `Vuna.Lint`（+ `Lint.Rules`/`Fix`/`Diagnostics`） | 风格检查与自动修复（`vuna lint`）；规则见 [lint.md](lint.md) |
| `Vuna.Repl` | 交互式 REPL（`vuna repl`；表达式经 DT 求值，顶层定义需先写签名） |
| `Vuna.Doc` | API 文档生成（`vuna doc`，扫描 `lib/` 输出 Markdown） |
| `Vuna.Index`（+ `Index.Types`/`Scan`/`Query`/`Render`） | 源码符号索引（`vuna map` / `vuna api`；parse 级，缓存在 `.local/index/`） |
| `Vuna.Lsp`（+ `Lsp.Protocol`/`Diagnostics`/`Query`） | LSP 服务端（JSON-RPC over stdio；方法见 [tooling.md](tooling.md)） |
| `Vuna.Json` | 最小 JSON 读写（LSP 用） |
| `Vuna.TestRunner` | 包内测试运行器（`vuna test`） |

这些模块永不进入 seed（见 [bootstrap.md](bootstrap.md) 的 TCB 边界）。

## 编译链

只有一条链：`Loader → Elab → Codegen`，由 `Vuna.Compiler.Driver.Compile` 的
`checkPackage` / `compileToDir` 组合：

- `Pkg.contextForFile` / `contextForDir` 给出唯一 `PackageContext`（最近 manifest + 依赖
  闭包；无 manifest 为 base-only）；
- `Loader.Flatten.loadProject` / `loadProjectModules` / `loadProjectSource` 解析 import 图并
  flatten（内部名字带模块前缀；ad-hoc 单文件自动注入 `Prelude`）；
- `Loader.Resolve` 的内建 arity/prelude 放行与效应能力检查、`Elab.Prelude` 的签名全部来自
  `Vuna.Compiler.Intrinsics`；能力按包 manifest 的 `[capabilities].effects` 判定，错误带
  `requires capability ...`；
- `Elab.Driver.elabProgramFull` 做 DT 双向精化（记录/deriving 先由 `Elab.Records` /
  `Elab.Derive` 降级，多 clause 由 `Elab.Match` 展开），产出 `DtProgram`（datas / defs /
  classes / insts）；
- `Codegen.Assembly` 对同一 `DtProgram` 装配运行时 / 模块 / `Main` 的 unit 计划与文本
  （`prepareDtProgram` / `genUnitText` / `mainHook`）；
- `Codegen.Split.generateDtSplitProgram` 按 loader 模块序切成逐模块 `SplitFile`
  （**唯一输出模型**；`compile` 与 `build` 都走它）。

`check` 只做精化 + 擦除检查并返回警告，不生成代码；包级检查：有 `app/Main.vuna` 的可执行包
检查该入口，库包以 `[export].modules` 为根。

## codegen 的表示

擦除型 codegen 用 `Core` 的 `Term` 视图生成原生 OCaml：用户 `data` 编译成 OCaml 变体
（每个族一个 `type 'a t_F = ...`）；`Int`/`String` 是语言 primitive（OCaml `int`/`string`），
`Bool`/`List`/`IO` 是 base 的普通 data：canonical `Base.Bool.Bool` 精化成 OCaml `bool`
（`TBool`），`List`/`IO` 按完整符号生成普通变体；`case` 编译成 OCaml `match`、构造器直接
构造变体。`Base.Nat.Nat` 同样不进运行时变体：零/后继、字面量与 `case` 降成 OCaml `int`
与 `if`/`let`（`Codegen.Decl.runtimeDatas` 过滤族；`Codegen.Term` 折叠 Succ 链、降级 Nat case），
算术走 `bi_nat*`。运行时表示只由 `Core.rigIsErased` 判定（隐式 binder 与 `Type` 域擦除，显式值 /
显式索引保留），不做整程序使用分析。运行时前导代码（`bi_*`、`dtp_*`、IO 桥接等）在
`Codegen.Term.dtRuntime`，无条件依赖 Unix（`Unix.stat` / `gettimeofday` / `readlink`）——
原语语义见 [primitives.md](primitives.md)。

只用 OCaml 标准库 + Unix（运行时前导代码），不依赖解释循环。代码质量要点：

- **依赖分组**：用 Kosaraju SCC 求函数依赖分量（`Codegen.Erase.groupRuntimeDefs`），
  自/互递归分量才用 `let rec ... and ...`，非自递归单函数用 `let`；
- **比较运算符特化**：精化期按实参类型把 `==` `/=` `<` `<=` `>` `>=` 重写为
  `bi_eq_int` / `bi_eq_str` 等单态 helper；其它类型走 `Eq`/`Ord` 字典参数；
- **短路**：`a && b` / `a || b` 在精化期降成 `TIf`，左侧能决定结果时不求值右侧；
- **字符串拼接**：`++` 走 `bi_concat`（OCaml `^`）；
- **零参定义求值一次**：零运行时参数的顶层定义直接生成 `let v_x = body`；递归组里零参
  非构造子 RHS 报 `CG_RecursiveValueDefinition`；
- 唯一输出模型是**逐模块**：`Codegen.Split` 把同一个 `DtProgram` 按模块切成
  `Vuna_runtime.ml` + 各源码模块 + `Main.ml`（**不生成 `.mli`**）。

编译产物为 OCaml 源码后由 `ocamlopt` 编译链接：`vuna compile` 只产源码目录，由调用方执行
生成的 `build.sh` 编译；`vuna build` 在 codegen 后直接执行 `build.sh`
（`Driver.Split.buildScript`，flags `-g -w -a+39 -warn-error +39`），做模块级增量构建并
链接出 `DIR/bin/<包名>`。

### 输出模型（唯一：逐模块 split）

`Codegen.Split.generateDtSplitProgram`（包级入口 `Driver.Dt.dtSplitProject`）接收 loader 的
模块序（依赖在前）、entry decls 与完整 `DtProgram`，产出 `List SplitFile`：

1. `Vuna_runtime.ml`：`dtRuntime`；
2. 每个源码模块一个 `<Module>.ml`（OCaml 编译单元名 = 模块名点转 `_d`，如
   `Vuna_dCompiler_dFrontend_dParser.ml`；依赖序，文件头 `open` runtime 与更早模块）；
   `List` 桥接放在声明 `List` 族的模块文件里；
3. `Main.ml`：entry decls 的 datas + defs + `main` 钩子（入口文件里的 `data` 也必须发进来）；
4. `build.sh`：不在生成器内，由 `Driver.Compile.compileToDir` 用 `Driver.Split.buildScript`
   写盘（干净构建 / 增量构建）；`vuna build` 随后执行它。

文件划分只由源码顺序与名字决定，不依赖时间 / 环境（确定性）；无法归属的 `DtDef` /
`DtData` 报清晰错误，不静默丢弃。生成链的护栏（构造子字段形状单一真源、
`checkResolvedModules`、entryDecls 与归属校验、`ensureUniqueOcamlNames`）见
[core.md](core.md) §7。

## codegen 夹具基线

codegen 健康由**固定夹具**度量：`test/corpus/codegen/` 是冻结的包（data/多构造子、case、
record、trait/instance/deriving、as-pattern、where/let 多 clause、List 结构递归、Int 相等、
零参定义、IO/do、`prim_*` 的 IO 包装、跨模块 split）。`checks.vuna-metrics` 用
`vuna build --no-compile` 生成它，剔除 `Base_*.ml` / `Prelude.ml` / `Vuna_runtime.ml` 后，
用 `nix/metrics.sh` 与 `nix/codegen.baseline` 做**精确基线**比较
（`<metric> =<expected>`，不等即失败）。

输入固定，所以任何漂移都是 codegen 输出变化，必须复核后更新基线；剔除 base/runtime 是
因为它们的尺寸随功能增长，纳入会重新引入「移动靶」。正常语言/检查器功能提交不改基线；
有意改 codegen、夹具或 base 接口时，重跑 `sh nix/checks/vuna-metrics.sh` 取新值并复核
diff。盲区：base/runtime 自身的 codegen 不在这条门禁里；尺寸也不等于耗时——耗时/内存看
`nix/bench.sh`。

**种子尺寸不设门槛**：`seed/` 的绝对 bytes/lines 随功能增长，没有可比性；bench 的
`sizes.seed_bytes` / `stage1_bytes` 只作参考，`nix/metrics.sh` 仍可手动量任意产物。

## 相关阅读

- 子系统数据流与改动定位：[architecture.md](../architecture.md)
- Core / NbE / 精化器内部规则：[core.md](core.md)
- 内建声明面、原语语义与效应能力：[primitives.md](primitives.md)
- 种子策略与 rotation：[bootstrap.md](bootstrap.md)
- 工具链（goal / LSP / 错误码）：[tooling.md](tooling.md)
