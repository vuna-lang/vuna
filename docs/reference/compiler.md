# 编译器参考：模块职责、codegen 表示与优化

本文覆盖 `compiler/` 包（`vuna-compiler`，模块 `Vuna.Compiler.*`）的模块职责与 codegen
实现要点。子系统的数据流与“改哪里”速查见 [architecture.md](../architecture.md)，
种子与自举链见 [bootstrap.md](bootstrap.md)。

## 模块地图

`compiler/` 是编译器包（seed 的唯一来源）。入口 `compiler/app/Main.vuna` 的 import 闭包
就是 `seed/` 的内容（当前 66 个 `.ml`，文件集 67 个含 `build.sh`，以 `seed/` 与
`nix/seed-count.txt` 为准）；工具链
（fmt/lint/repl/doc/test/lsp）在根包 `lib/`，不在闭包里。代码按**目录即层**组织：Frontend
→ Packages → Loader → Core → Elab → Codegen → Driver，同层模块可互相 import，上层只能
依赖下层。每层 `X.vuna` 是**门面**：只 import 子模块并选择性重导出（对外名字面与拆分前
逐项一致），实现与数据定义都在 `X/` 的叶子模块。全包 50 个模块（49 个导出 + 内部
`Debug`），目标每模块 ≤~800 行（当前最大 811：根包 `Lint/Rules`；compiler 最大 797：
`Elab/Term/Impl`）。

| 模块 | 职责 | 关键入口 |
| --- | --- | --- |
| `Common` | 编译器门面：整模块重导出 `Base.Pair`/`Bool`/`List`/`Maybe`/`Result`/`String`，并保留 `Pos`/`Span`、模块路径与诊断工具 | `showSpanLoc`、`suggest`、`splitPath` |
| `Intrinsics` | **内建声明唯一真源（M27）**：名字/签名形状（`IType`）/arity/归约标签（`IntrinsicOp`）/能力（`Capability`）/runtime 名/用户可见性；内置身份按声明 symbol（`Base.Bool.Bool` / `Base.List.List` / `Base.IO.IO`） | `findIntrinsic`、`intrinsicRuntime`、`intrinsicCapability`、`parseCapability` |
| `Frontend.Ast` | 语法类型与 AST helper（`Expr`/`Decl`/`Pat`/`Ctor`/`Import`/`ModDecl`） | `clausesFor`、`funArity`、`declNames` |
| `Frontend.Lexer` | 字符游标、token 与位置；注释单独 lex 出来供 formatter 使用 | `lexSource`、`lexComments` |
| `Frontend.Parser` | offside layout parser → AST + imports；`where` 块与绑定签名行 | `parseSource`、`parseExpressionSource` |
| `Frontend.Toml` | TOML 子集解析器 | `parseToml`、`lookupEntry` |
| `Frontend.Manifest` | `vuna.toml` 的语义模型与结构校验（不做 I/O） | `parseManifest`、`validateManifest` |
| `Packages.Pkg` | 包 / workspace 解析层：manifest 图、依赖 DAG、**每个文件的包上下文**（最近 manifest + 依赖闭包）、base 定位（不碰 Loader / CLI） | `loadPackage`、`workspacePackages`、`contextForFile`、`contextForDir`、`locateBase` |
| `Loader`（门面） | 模块加载、名字解析与 flatten 的稳定入口；对外导出 `Project` / `Module` / `ExportEntry` 与 `loadProject*` / `resolveProject` | `loadProject`、`loadProjectModules`、`resolveProject` |
| `Loader.Modules` | 加载器的数据与模块图（叶子，无跨 Loader 子模块依赖）：模块根、import 边、导出表结构 | `collectModuleFiles`、`moduleAllImportsOf` |
| `Loader.Resolve` | 名字解析 + 效应能力检查：把 parse 后声明/表达式解析成带模块前缀的名字；内建 arity/prelude 放行/能力检查都消费 `Intrinsics`（不再有手写内建表） | `resolveProgram`、`checkEffectsBuiltins` |
| `Loader.Flatten` | 模块导出表计算、加载流程与 flatten（`Prelude` 自动导入——含 ad-hoc 单文件、`[export]` 可见性） | `loadProject`、`loadProjectModules`、`loadProjectSource` |
| `Core`（门面） | core 类型论表示、NbE 求值与定义性相等等公开面 | `Core.Eval.eval`、`quote`、`normalize`、`Core.Conv.conv`、`Core.Term.defaultFuel` |
| `Core.Term` | `Term`/`Value`/`Neutral`/`Closure`/`Rig`/`Level` 等数据（唯一真源）与 `shift`/`substVarAt`/显示等纯项变换 | `shift`、`substVarAt`、`rigIsErased` |
| `Core.Eval` | beta 求值、delta 展开、prelude 原语归约、深度正规化与 quote | `eval`、`force`、`applyClosure`、`normalize`、`quote` |
| `Core.Conv` | 定义性相等（beta + delta + eta）与元变量求解（M28：Miller pattern + 创建深度就地检查；非 pattern 形状保守 head 提取） | `conv`、`convBoth`、`solveMeta` |
| `Elab`（门面） | DT 精化器稳定入口；按 `Elab.*` 前缀选择重导出 `Types`/`Meta`/`Data`/`Trait`/`Driver` 的公开名 | `Elab.Driver.elabProgramFull`、`goalsOfProgram` |
| `Elab.Sig` | 签名工具：trait 类参数 kind 推断 + 顶层签名自由名量化（**合并原 `DtKind` + `DtQuant`**）；M28 起量化 banned 集按模块作用域计算（C29，`bannedForModule`） | `quantifyTopSig`、`classParamKind`、`methodArgRigsOf`、`bannedForModule` |
| `Elab.Types` | Elab 的数据定义与共享状态：`DtDef`/`DtAxiom`（无体/不透明顶层）/`DtCtor`/`DtData`/`DtGoal`/`DtClass`/`DtInst`/`DtProgram` 与 `Ctx`；`dtDefBody` 返回 `Maybe Term` | `dtDataName`、`dtDefType`、`dtDefBody`、`dtProgDefs` |
| `Elab.Meta` | 共享工具层：值/构造子引用、`convEc`、元变量创建深度与统一 `zonkTerm`、擦除判据（`isTypeDomain`/`binderRig`）、命名空间查询（`typeLookup`/`valueLookup`）、canonical Bool 的 `TBool` 表示 | `convEc`、`zonkTerm`、`binderRig`、`typeLookup`、`dictTypeName` |
| `Elab.Case` | case 规范形（M28）：索引合一（`unifyIdx`）、scrutinee 反射、单一可达性判据（`BranchVerdict`/`allCtorsUnsatisfiable`）、空族与冗余/不可达诊断 | `unifyIdx`、`reflectScrutinee`、`checkCoverage`、`isEmptyFamilyValue` |
| `Elab.Dict` | 字典编码的表示与实例搜索：字典类型/实例头识别、`conv` 头匹配、实例搜索（M29 起递归解 ctx / 约束实例）、`==`/比较运算符特化（Int/String 内建或 Eq/Ord 字典；**无泛型结构比较兜底**） | `searchInstance`、`dictFamilyNameOf`、`cmpRuntimeName`、`deferEqDict` |
| `Elab.Term` | 项的双向检查（与 case 规则互递归的核心）：`inferE`/`checkE`/应用/隐式插入/类型检查 | `inferE`、`checkE`、`checkApp`、`checkType` |
| `Elab.Data` | `data` 声明与构造子/索引擦除：`elabCtor`、`elabDataHead(s)`、`elabDataBodies`、擦除候选；M28 起校验 kind 结果层级与构造子字段 sort | `elabDatas`、`ctorFieldTerms`、`checkCtorFieldSorts` |
| `Elab.Trait` | trait/instance 声明与实例体：类参数 kind、方法投影、实例头检查（重复 / 相干性；M29 删除命名实例、支持约束实例 ctx）、方法体精化 | `checkInstanceHeads`、`elabInstanceBodies`、`instanceName` |
| `Elab.Driver` | 精化入口与程序组装：签名 → data/trait/instance → 定义体 → zonk/终止性检查 → `DtProgram`；洞目标 | `Elab.Driver.elabProgramFull`、`goalsOfProgram`、`dtEvalExprIn` |
| `Elab.Termination` | DT 终止性检查（M16/M25）：调用图 + SCC，结构下降/守卫 Int 判据（无包级豁免） | `checkTerminationDecls` |
| `Elab.Prelude` | 把 `Intrinsics` 表翻译成 DT prelude globals（签名）；不再有第二份名字/签名表（原 `DtPrelude`） | `preludeGlobals`、`builtinTyName`、`cmpBuiltinTyName` |
| `Elab.Match` | 多 clause 模式矩阵降级：构造子列 → `case`、字面量列 → `if` 链（纯 Ast→Ast） | `multiToExpr`、`buildColumnExpr` |
| `Elab.Records` | `record` 的语法降级：记录 → 单构造器 `data`、字段访问/更新/recode（纯 Ast→Ast） | `desugarRecords`、`RecordInfo` |
| `Elab.Derive` | `deriving` 的实例生成（展开成等价 `instance`，交给既有实例精化） | `expandDerivings` |
| `Codegen`（门面） | DT 擦除 codegen 的稳定入口；重导出 `Codegen.Assembly` 与 `Codegen.Split` | `checkDtProgram`、`generateDtSplitProgram` |
| `Codegen.Decl` | OCaml 名字编码（sanitize/前缀/保留字）+ 变体类型声明；构造子字段形状 keep flags 的实际消费点；内置身份按完整符号（canonical Bool 族不进运行时变体） | `ctorOcamlName`、`genTypeDecls`、`ctorKeepFlags` |
| `Codegen.Erase` | 擦除检查、de Bruijn 作用域/名字护栏、依赖分析与 SCC 分组；M28 起 axiom 强制进类型级分区，运行时使用报 `CG_AxiomAtRuntime` | `checkAllErasure`、`checkAllDefScopes`、`ensureUniqueOcamlNames`、`checkNoAxiomRuntime` |
| `Codegen.Term` | 项 → OCaml（擦除驱动）+ DT 运行时前缀（`bi_*`、`dtp_*`、IO 桥接）；全局名 → runtime 映射消费 `Intrinsics` | `dtRuntime`、`genDtHook`、`genGroups` |
| `Codegen.Assembly` | 同一份 `DtProgram` 的装配与检查入口（M26 由 `Codegen.Program` 改名；单文件产物生成器删除） | `prepareDtProgram`、`genUnitText`、`mainHook`、`checkDtProgram` |
| `Codegen.Split` | **唯一** codegen 生成器：逐模块 split 的声明归属表与分文件装配 | `generateDtSplitProgram` |
| `Driver.Split` | 输出文件模型与构建脚本生成：`SplitFile`、依赖序、增量 `build.sh` | `SplitFile`、`buildScript`、`writeSplitFiles` |
| `Driver.Dt` | DT 路径 facade（供 `Compile` / `CompilerCli` / `Interp` 使用）：单一 `PackageContext` 加载形状 | `dtCheck`、`dtCheckLibrary`、`dtSplitProject`、`dtEvalFile` |
| `Driver.Compile` | 编译入口：`PackageContext` 检查/编译、目录式 codegen 与构建脚本执行 | `checkPackage`、`compileToDir`、`buildSplit`、`runBuildScript` |
| `Driver.CompilerCli` | 编译器自己的 CLI（`vuna-compiler`）；**合并原 `Process`** 的 `runIn`（`prim_runIn`，需要 `process` 能力） | `runCompilerCli`、`compilerUsageLines`、`runIn` |

`compiler/vuna.toml` 的 `[export]` 列出全部 49 个导出模块（内部 `Debug` 不在内）；
`[capabilities] effects` 声明五个能力（编译器直接使用 `prim_*`）。工具链模块不在此包。
原 `Driver.Process` 与根包 `Vuna.Process` 均已删除（`runIn` 并入 `Driver.CompilerCli`）。
M26 删除 `Codegen.Program`（装配逻辑收敛到 `Codegen.Assembly`）、`Driver.Split` 的 HM
`lib+app` 布局生成器与零调用 writer，以及 Loader 门面里 HM 时代的零调用导出。
M27 新增 `Intrinsics` 并把内建名字/签名/arity/能力/runtime 映射/归约标签收成一份表：
`Loader.Resolve`、`Elab.Prelude`、`Core.Eval`、`Codegen.Term` 都消费它；`Bool`/`List`/`IO`
是 base 普通 data（canonical 完整符号），短名/`lastName` 判据删除。

## 根包工具链模块（`lib/`，不进 seed）

| 模块 | 职责 |
| --- | --- |
| `Vuna.Cli` | 产品 CLI：工具命令分发 + in-process 调 compiler 命令（`runCli`） |
| `Vuna.Interp` | 解释器 facade（DT 精化 + 核心求值，调 `Driver.Dt.dtEvalFile`；工具链侧） |
| `Vuna.Files` | 目录遍历小工具（fmt/doc/test/Index 共用，`collectVunaFiles`） |
| `Vuna.Fmt`（+ `Fmt.Comment`/`Decl`/`Expr`/`Util`） | 源码格式化器（`vuna fmt`，parse → 规范打印；门面只导出 `formatSource`） |
| `Vuna.Lint`（+ `Lint.Rules`/`Fix`） | 风格检查与自动修复（`vuna lint`） |
| `Vuna.Repl` | 交互式 REPL（`vuna repl`；表达式经 DT 求值，顶层定义需先写签名） |
| `Vuna.Doc` | API 文档生成（`vuna doc`，扫描 `lib/` 输出 Markdown） |
| `Vuna.Index`（+ `Index.Types`/`Scan`/`Query`/`Render`） | 源码符号索引（`vuna map` / `vuna api`；parse 级，缓存在 `.local/index/`） |
| `Vuna.Lsp` | LSP 服务端（诊断 = parse + DT 精化错误，hover = 洞目标；JSON-RPC over stdio） |
| `Vuna.Json` | 最小 JSON 读写（LSP 用） |
| `Vuna.TestRunner` | 包内测试运行器（`vuna test`，经 `Vuna.Interp` 走 DT 核心求值） |

这些模块永不进入 seed（见 [bootstrap.md](bootstrap.md) 的 TCB 边界）。

## 编译链

只有一条链：`Loader → Elab → Codegen`，由 `Vuna.Compiler.Driver.Compile` 的
`checkPackage` / `compileToDir` 组合：

- `Pkg.contextForFile` / `contextForDir` 给出唯一 `PackageContext`（最近 manifest +
  依赖闭包；无 manifest 为 base-only）；
- `Loader.Flatten.loadProject` / `loadProjectModules` / `loadProjectSource` 解析 import
  图并 flatten（内部名字带模块前缀；ad-hoc 单文件自动注入 `Prelude`）；
- `Loader.Resolve` 的内建 arity/prelude 放行与效应能力检查、`Elab.Prelude` 的签名全部来自
  `Vuna.Compiler.Intrinsics`（M27 唯一真源）；能力按包 manifest 的
  `[capabilities].effects` 判定，错误带 `requires capability ...`；
- `Elab.Driver.elabProgramFull` 做 DT 双向精化（记录/deriving 先由 `Elab.Records` /
  `Elab.Derive` 降级，多 clause 由 `Elab.Match` 展开），产出 `DtProgram`（datas / defs /
  classes / insts）；
- `Codegen.Assembly` 对同一 `DtProgram` 装配运行时 / 模块 / `Main` 的 unit 计划与文本
  （`prepareDtProgram` / `genUnitText` / `mainHook`）；
- `Codegen.Split.generateDtSplitProgram` 按 loader 模块序切成逐模块 `SplitFile`
  （**唯一输出模型**；`compile` 与 `build` 都走它）。

`check` 只做精化 + 擦除检查并返回警告，不生成代码；包级检查：有 `app/Main.vuna` 的可执行
包检查该入口，库包以 `[export].modules` 为根。

## codegen 的表示

擦除型 codegen 用 `Core` 的 `Term` 视图生成原生 OCaml：用户 `data` 编译成 OCaml
变体（每个族一个 `type 'a t_F = ...`）；`Int`/`String` 是语言 primitive（OCaml
`int`/`string`），`Bool`/`List`/`IO` 是 base 的普通 data：canonical `Base.Bool.Bool`
精化成 OCaml `bool`（`TBool`），`List`/`IO` 按完整符号生成普通变体；`case` 编译成 OCaml
`match`、构造器直接构造变体。运行时表示只由 `Core.rigIsErased` 判定（隐式 binder 与
`Type` 域擦除，显式值 / 显式索引保留），不做整程序使用分析。运行时前导代码
（`bi_*`、`dtp_*`、IO 桥接等）在 `Codegen.Term.dtRuntime`，无条件依赖 Unix
（`Unix.stat` / `gettimeofday` / `readlink`）——原语语义见 [primitives.md](primitives.md)。

只用 OCaml 标准库 + Unix（运行时前导代码），不依赖解释循环。代码质量要点：

- **依赖分组**：用 Kosaraju SCC 求函数依赖分量（`Codegen.Erase.groupRuntimeDefs`），
  自/互递归分量才用 `let rec ... and ...`，非自递归单函数用 `let`；
- **比较运算符特化**：精化期按实参类型把 `==` `/=` `<` `<=` `>` `>=` 重写为
  `bi_eq_int` / `bi_eq_str` 等单态 helper（M29 删除泛型结构比较兜底，`bi_eq_generic`
  与 interp 的 `valueEqDeep` 双实现已不存在）；其它类型走 `Eq`/`Ord` 字典参数；
- **短路**：`a && b` / `a || b` 在精化期降成 `TIf`（`a && b` ⇒ `if a then b else False`），
  左侧能决定结果时不求值右侧；核心求值器读同一 `TIf`，语义一致；
- **字符串拼接**：`++` 走 `bi_concat`（OCaml `^`）；
- **零参定义求值一次**：零运行时参数的顶层定义直接生成 `let v_x = body`（M26 起不再
  包 `fun () -> body`，引用处也不补 `()`）；递归组里零参非构造子 RHS 报
  `CG_RecursiveValueDefinition`，不会生成会自引用的 `let rec`；
- 唯一输出模型是**逐模块**：`Codegen.Split` 把同一个 `DtProgram` 按模块切成
  `Vuna_runtime.ml` + 各源码模块 + `Main.ml`（**不生成 `.mli`**）；不再有单文件 `.ml`
  产物或可切换的 `--split` 输出。

编译产物为 OCaml 源码后由 `ocamlopt` 编译链接：`vuna compile` 只产源码目录，由调用方
执行生成的 `build.sh` 编译；`vuna build` 在 codegen 后直接执行 `build.sh`（`Driver.Split.buildScript`，
flags `-g -w -a+39 -warn-error +39`），做模块级增量构建并链接出 `DIR/bin/<包名>`。

### 输出模型（唯一：逐模块 split）

`Codegen.Split.generateDtSplitProgram`（包级入口 `Driver.Dt.dtSplitProject`）接收 loader 的模块序
（依赖在前）、entry decls 与完整
`DtProgram`，产出 `List SplitFile`：

1. `Vuna_runtime.ml`：`dtRuntime`；
2. 每个源码模块一个 `<Module>.ml`（OCaml 编译单元名 = 模块名点转 `_d`，如
   `Vuna_dCompiler_dFrontend_dParser.ml`；依赖序，文件头 `open` runtime 与更早
   模块）；`List` 桥接放在声明 `List` 族的模块文件里；
3. `Main.ml`：entry decls 的 datas + defs + `main` 钩子（M24.6：入口文件里的 `data`
   也必须发进来）；
4. `build.sh`：不在生成器内，由 `Driver.Compile.compileToDir` 用
   `Driver.Split.buildScript` 写盘（干净构建 / 增量构建）；`vuna build` 随后执行它。

M26 删除了空 `Vuna_builtins` 编译单元（A02）——seed 文件集因此从 66 个 `.ml` 收敛到
65 个；M27 新增 `Intrinsics` 后为 **66 个 `.ml` / 67 个文件**（含 `build.sh`）。文件划分只由源码顺序与名字决定，不依赖
时间/环境（确定性）；无法归属的
`DtDef` / `DtData` 报清晰错误，不静默丢弃。M24.6 起生成链还有三条护栏：构造子字段
形状以 telescope 的 keep flags 为**单一真源**（类型声明 / 构造子应用 / case 绑定三处
消费并校验）、`checkResolvedModules` 在 split 入口拒绝未带模块前缀的 parsed 声明，
M26 起同时校验 entryDecls（必须不带点、非空、不重复）与每个 `DtDef`/`DtData` 的归属
（C08）、`ensureUniqueOcamlNames` 对实际生成的 `v_*` / `t_*` / `C_*` 名字做族内去重。

## 机器无关指标

`nix/metrics.sh` 聚合 seed 闭包（`vuna build --no-compile --out` 产物）的 `.ml`，统计
bytes / lines / maxline / longlines / `letrec` / `strcat` / `eqint` / `zeroarg` /
`ctorcount`，与 `nix/metrics.budget` 比较；`checks.vuna-metrics` 用它守 codegen
回归（有意改变 codegen 后需复测并更新预算文件）。M27 后指标口径对应 66 个 `.ml`
seed；`nix/metrics.budget` 已按 M27 实测重新标定。

## 相关阅读

- 子系统数据流与改动定位：[architecture.md](../architecture.md)
- 内建声明面、原语语义与效应能力：[primitives.md](primitives.md)
- 种子策略与 rotation：[bootstrap.md](bootstrap.md)
- 测试体系与 nix checks：[testing.md](testing.md)
- DT 工具链（洞目标 / LSP / 错误索引）：[dt-tooling.md](dt-tooling.md)