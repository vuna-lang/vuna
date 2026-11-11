# 编译器参考：模块职责、codegen 表示与输出模型

本文覆盖 `compiler/` 包（`vuna-compiler`，模块 `Vuna.Compiler.*`）的模块职责与 codegen
实现要点。子系统的数据流与「改哪里」速查见 [architecture.md](../architecture.md)，Core /
精化器内部规则见 [core.md](core.md)，种子与自举链见 [bootstrap.md](bootstrap.md)。

## 模块地图

`compiler/` 是编译器包（seed 的唯一来源）。入口 `compiler/app/Main.vuna` 的 import 闭包
就是 `seed/` 的内容（规模以 `seed/` 与 `nix/seed-count.txt` 为准）；工具链
（fmt/lint/repl/doc/test/lsp）在根包 `lib/`，不在闭包里。
代码按**目录即层**组织：Frontend → Packages → Loader → Core → Elab → Codegen → Driver，
同层模块可互相 import，上层只能依赖下层。每层 `X.vuna` 是**门面**：只 import 子模块并选择性
重导出，实现与数据定义都在 `X/` 的叶子模块。全包 **72 个模块**（68 个导出 + 内部
`Debug` / `CacheFormat` / `Driver.Iface` / `Driver.Owner`）；目标每模块 ≤~800 行
（`Codegen.Term` / `Driver.Dt` / `Elab.Trait` 等已超目标，约 1.1–1.2k 行）。

| 模块 | 职责 | 关键入口 |
| --- | --- | --- |
| `Source` | 底层位置/路径层（无 `Result`）：`Pos`/`Span`、路径拼接、近似名建议 | `showSpanLoc`、`suggest`、`splitPath` |
| `Diag` | 结构化诊断模型（severity/phase/category/label/field/trace/ICE）与结果通道 `Check`（`ErrC Diagnostic`）；`diagText` 是过渡期 short 渲染 | `Check`、`Diagnostic`、`diagText`、`icFuel`、`withFallbackSpan` |
| `Diag.Format` | 诊断渲染唯一入口：short/human/JSON | `renderShort`、`renderHuman`、`renderJsonList` |
| `Common` | 编译器门面：重导出 `Source` + `Diag`，并保留固定类型的 `bind`/`step`/`traverse` | `bind`、`showSpanLoc`、`suggest`、`splitPath` |
| `Diagnostics`（门面） | 错误码体系入口：重导出 `Diagnostics.Tc`/`Cg`/`Ic`/`Common` 与 `Base.Nat`/`Vec` | `tcErr0`、`cgErr0`、`icFuel`、`tcAll`、`cgAll` |
| `Diagnostics.Tc` / `Cg` | `TcErr : Nat -> Type` / `CgErr : Nat -> Type` 域枚举（构造子携带模板、arity 由索引锁定）；`tcAll`/`cgAll` 按 arity 分块（避免单行巨表） | `tcCode`、`tcTemplate`、`cgCode`、`cgTemplate` |
| `Intrinsics` | **内建声明唯一真源**：名字/签名形状（`IType`）/arity/归约标签（`IntrinsicOp`）/能力（`Capability`）/runtime 名/用户可见性；内置身份按声明 symbol（`IO` 内建；`Base.Bool.Bool` / `Base.List.List` / `Base.Nat.Nat`） | `findIntrinsic`、`intrinsicRuntime`、`intrinsicCapability`、`parseCapability` |
| `Hash` | 内容寻址摘要原语：**SHA-256**（用 `Base.Bits` 的 32-bit 包装在语言内实现：OCaml / 未来 wasm / interp 同摘要）；`digestHex`（64 位十六进制）/ `digestInt`（63-bit 派生键，取代旧 10-bit `strHash` 与 6-lane 盐）/ `prehashOfString`（MB 级载荷折叠）/ `contentKey`·`contentAddress`（大输入：预折叠 + SHA，缓存 key 与内容地址） | `digestOfString`、`digestHex`、`digestIntOf`、`contentKey`、`contentAddress`、`prehashOfString` |
| `Canonical`（门面） | 规范字节编码（D5 / C32 哈希输入侧）：自定界原子文法 `#tag;` / `i<n>;` / `s<len>:<bytes>` / `b0\|b1` / `[<n>:…]` / `0\|1…`，累积器编码 + 对应解码器（roundtrip） | `encConcat`、`encTag`、`encInt`、`encStr`、`encMaybe`、`decStr`、`thenPair` |
| `Canonical.Term` | Core `Term` 的规范编码 / 解析（tag = 构造子声明序；`TVar` 的 span 丢弃） | `encTerm`、`encTermBytes`、`decTermComplete` |
| `Canonical.Ast` | Frontend `Expr` / `Pat` / `Decl` 的规范编码 / 解析（全部 span 丢弃；codegen 单元 key 与 roundtrip 用） | `encExpr`、`encDecl`、`encDecls`、`decDeclsComplete` |
| `Canonical.Elab` | 接口哈希输入域：`DtDef` / `DtData` / `DtInst` / `DtClass` / `RecordMeta` / `ExportEntry` / `FixityDecl` / `Import`（span 丢弃、字段全覆盖） | `encDtDef`、`encDtData`、`encExportEntry`、`encRecordMeta`、`encFixity` |
| `Query` | 查询图骨架：按 key 记忆化、依赖摘要快照、early cutoff（重算后摘要不变则下游仍命中）、可观测 trace；并行 / 取消留给后续 | `query`、`dbEmpty`、`dbTrace`、`digestOfVal` |
| `Frontend.Ast` | 语法类型与 AST helper（`Expr`/`Decl`/`Pat`/`Ctor`/`Import`/`ModDecl`/`TraitMethod`） | `clausesFor`、`funArity`、`declNames` |
| `Frontend.Lexer` | 字符游标、token 与位置；注释单独 lex 出来供 formatter 使用 | `lexSource`、`lexComments` |
| `Frontend.Cst` | 无损 CST 词法层：token 携带前置 trivia（空白 / 行注释 / 块注释）与 span，`renderCst` 逐字节还原源码；宏 / 格式化 / LSP 的 span 映射基础 | `lexCst`、`renderCst`、`roundtripOk` |
| `Frontend.Parser` | offside layout parser → AST + imports；`where` 块与绑定签名行；方法签名带 span；顶层签名可带约束 ctx（`C a =>`） | `parseSource`、`parseExpressionSource` |
| `Frontend.Toml` | TOML 子集解析器 | `parseToml`、`lookupEntry` |
| `Frontend.Manifest` | `vuna.toml` 的语义模型与结构校验（`[package]` 只有 `name`；不做 I/O） | `parseManifest`、`validateManifest` |
| `Packages.Pkg` | 包 / workspace 解析层：manifest 图、依赖 DAG、**每个文件的包上下文**（最近 manifest + 依赖闭包）、base 定位（不碰 Loader / CLI） | `loadPackage`、`workspacePackages`、`contextForFile`、`contextForDir`、`locateBase` |
| `Loader`（门面） | 模块加载、名字解析与 flatten 的稳定入口；对外导出 `Project` / `Module` / `ExportEntry` 与 `loadProject*` / `resolveProject` | `loadProject`、`loadProjectModules`、`resolveProject` |
| `Loader.Modules` | 加载器的数据与模块图（叶子）：模块根、import 边、导出表结构 | `collectModuleFiles`、`moduleAllImportsOf` |
| `Loader.Resolve` | 名字解析 + 效应能力检查：把 parse 后声明/表达式解析成带模块前缀的名字；内建 arity/prelude 放行/能力检查都消费 `Intrinsics` | `resolveProgram`、`checkEffectsBuiltins` |
| `Loader.Flatten` | 模块导出表计算、加载流程与 flatten（`Prelude` 自动导入——含 ad-hoc 单文件、`[export]` 可见性）；内存源码的**库模块**入口（LSP）；AST 缓存 `parseFileWithPath`（key = SHA-256(`astCacheSchema` + 路径 + 源内容) + payload 回读校验 + `prim_writeFileAtomic` 原子写；不含编译器指纹，**改 `Frontend.Ast` 布局要 bump schema**，见 debt C48） | `loadProject`、`loadProjectModules`、`loadProjectSource`、`loadModuleSource`、`visibleFixitiesOf` / `dedupeFixities`、`fixitiesForSource` / `fixitiesForSourceIn`（fmt/LSP/lint 的程序级 fixity） |
| `Core`（门面） | core 类型论表示、NbE 求值与定义性相等等公开面；细节见 [core.md](core.md) | `Core.Eval.eval`、`quote`、`normalize`、`Core.Conv.conv`、`Core.Term.defaultFuel` |
| `Core.Term` | `Term`/`Value`/`Neutral`/`Closure`/`Rig`/`Level`/`Sols` 等数据（唯一真源）与 `shift`/`substVarAt`/显示等纯项变换 | `shift`、`substVarAt`、`rigIsErased` |
| `Core.Eval` | beta 求值、delta 展开、prelude 原语归约、深度正规化与 quote | `eval`、`force`、`applyClosure`、`normalize`、`quote` |
| `Core.Conv` | 定义性相等（beta + delta + eta）与元变量求解（Miller pattern + 创建深度就地检查；非 pattern 报 `TC_CannotSolveHigherOrder`） | `conv`、`convBoth`、`solveMeta` |
| `Elab`（门面） | DT 精化器稳定入口；按 `Elab.*` 前缀选择重导出 `Types`/`Meta`/`Data`/`Trait`/`Driver` 的公开名 | `Elab.Driver.elabProgramFull`、`goalsOfProgram` |
| `Elab.Sig` | 签名工具：trait 类参数 kind 推断 + 顶层签名自由名量化（约束 ctx 与类型一起参与自由名扫描与 kind 推断）；量化 banned 集按模块作用域计算，`qualifiedBannedTbl` 一次建表 + per-sig O(1) 查 | `quantifyTopSig`、`quantifyTopSigCtxCached`、`qualifiedBannedTbl`、`classParamKind` |
| `Elab.Types` | Elab 的数据定义与共享状态：`DtDef`/`DtAxiom`/`DtCtor`/`DtData`/`DtGoal`/`DtClass`/`DtInst`/`DtProgram` 与 `Ctx`；`Ec` 带 ctor/defVal 索引缓存，`DtProgram` 带 `defVals`。**`Ec.deftbl` 的语义是「名字 → 定义体」**（delta 展开的唯一来源） | `dtDataName`、`dtDefType`、`dtDefBody`、`dtProgDefs`、`dtProgDefVals` |
| `Elab.Meta` | 共享工具层：值/构造子引用、`convEc`、元变量创建深度与统一 `zonkTerm`、擦除判据（`isTypeDomain`/`binderRig`）、命名空间查询（`typeLookup`/`valueLookup`）、canonical Bool 的 `TBool` 表示 | `convEc`、`zonkTerm`、`binderRig`、`typeLookup`、`dictTypeName` |
| `Elab.Case` | case 规范形：索引合一（`unifyIdx`）、scrutinee 反射、单一可达性判据（`BranchVerdict`/`allCtorsUnsatisfiable`）、空族与冗余/不可达诊断 | `unifyIdx`、`reflectScrutinee`、`checkCoverage`、`isEmptyFamilyValue` |
| `Elab.Dict` | 字典编码的表示与实例搜索：字典类型/实例头识别、`conv` 头匹配、实例搜索（递归解 ctx / 约束实例）、`==`/比较运算符特化（Int/String 内建或 Eq/Ord 字典；无泛型结构比较兜底） | `searchInstance`、`dictFamilyNameOf`、`cmpRuntimeName`、`deferEqDict` |
| `Elab.Term` | 项的双向检查（与 case 规则互递归的核心）：`inferE`/`checkE`/应用/隐式插入/类型检查 | `inferE`、`checkE`、`checkApp`、`checkType` |
| `Elab.Data` | `data` 声明与构造子/索引擦除：`elabCtor`、`elabDataHead(s)`、`elabDataBodies`、擦除候选；校验 kind 结果层级与构造子字段 sort | `elabDatas`、`ctorFieldTerms`、`checkCtorFieldSorts` |
| `Elab.Trait` | trait/instance 声明与实例体：类参数 kind、方法投影、实例头检查（重复/相干性；无命名实例、支持约束实例 ctx）、方法体精化；实例 ctx 与顶层签名 ctx 共用 `elabConstraintDomains`（含类参数 kind 校验），隐式字典 binder 按 RigΩ 绑定（运行时保留、可多次使用）；方法签名带 span，实例名=单类前缀+完整 head 名 | `checkInstanceHeads`、`elabInstanceBodies`、`elabConstraintDomains`、`instanceName` |
| `Elab.InstName` | 实例名生成规则（单类前缀 + 完整 head 名）的唯一实现 | `instanceName` |
| `Elab.Driver` | 精化入口与程序组装：签名（约束 ctx → 隐式字典 binder）→ data/trait/instance → 定义体（声明的字典目标先解到 ctx binder，剩余才提升）→ zonk/终止性检查 → `DtProgram`；洞目标（含洞名）。`goalsOfProgramTolerant` 与严格收尾拆开：只读 core 的 goals，未解洞也能给目标+上下文（供 `vuna goal` / LSP）。接口摘要路径用 `elabProgramFullWithAux`（起始 Ec 由依赖摘要注入；termAux 只喂终止性分析） | `Elab.Driver.elabProgramFull`、`elabProgramFullWithAux`、`goalsOfProgram`、`goalsOfProgramTolerant`、`dtEvalExprIn` |
| `Elab.Termination` | 终止性检查：调用图 + SCC，结构下降/守卫 Int 判据（无包级豁免）。`checkTerminationDeclsWith` 允许把依赖包声明只作为 SCT 上下文、只报告本包函数的失败 | `checkTerminationDecls`、`checkTerminationDeclsWith` |
| `Elab.Prelude` | 把 `Intrinsics` 表翻译成 DT prelude globals（签名）；没有第二份名字/签名表 | `preludeGlobals`、`builtinTyName`、`cmpBuiltinTyName` |
| `Elab.Match` | 多 clause 模式矩阵降级：构造子列 → `case`、字面量列 → `if` 链（纯 Ast→Ast） | `multiToExpr`、`buildColumnExpr` |
| `Elab.Records` | `record` 的语法与结构化元数据：收集 `RecordMeta`、把 record 表达式/模式降级成**合成位置构造子**的引用（不再降级成 `DData`）；`prepareDecls*` 返回的 decls 保留 `DRecord` | `desugarRecords`、`recordsOfDecls`、`prepareDecls` |
| `Elab.Derive` | `deriving (Show, Eq, Ord, Hashable)` 的实例生成（展开成等价 `instance`，交给既有实例精化；`Hashable` 的字段哈希用 `Base.Hashable.hashCombine`） | `expandDerivings` |
| `Codegen`（门面） | DT 擦除 codegen 的稳定入口；重导出 `Codegen.Assembly` 与 `Codegen.Split` | `checkDtProgram`、`generateDtSplitProgram` |
| `Codegen.Decl` | OCaml 名字编码（sanitize/前缀/保留字）+ 跨单元引用限定（`Unit.name`）+ 变体类型声明；构造子字段形状 keep flags 与不透明字段 flags（`ctorOpaqueFlagsOf`）的实际消费点；内置身份按完整符号（canonical Bool 族不进运行时变体） | `ctorOcamlName`、`qualValueText`、`qualCtorText`、`qualTypeText`、`genTypeDecls`、`ctorKeepFlags`、`ctorOpaqueFlagsOf` |
| `Codegen.Erase` | 擦除检查、de Bruijn 作用域/名字护栏、依赖分析与 SCC 分组；axiom 强制进类型级分区，运行时使用报 `CG_AxiomAtRuntime` | `checkAllErasure`、`checkAllDefScopes`、`ensureUniqueOcamlNames`、`checkNoAxiomRuntime` |
| `Codegen.Term` | 项 → OCaml（擦除驱动）+ DT 运行时前缀（`bi_*`、`dtp_*`、IO 桥接）+ 定义位置表/异常报告器；全局名 → runtime 映射消费 `Intrinsics` | `dtRuntime`、`dtRuntimeWith`、`dtDefLocTable`、`genDtHook`、`genGroups` |
| `Codegen.Assembly` | 同一份 `DtProgram` 的装配与检查入口 | `prepareDtProgram`、`genUnitText`、`mainHook`、`checkDtProgram` |
| `Codegen.Split` | **唯一** codegen 生成器：逐模块 split 的声明归属表与分文件装配 | `generateDtSplitProgram` |
| `Driver.Split` | 输出文件模型与构建脚本生成：`SplitFile`、依赖序、按内容哈希增量的 `build.sh` | `SplitFile`、`buildScript`、`writeSplitFiles`、`writeSplitFilesIfChanged` |
| `Driver.Owner` | **声明归属表**（从 `Codegen.Split` 抽出）：声明名 / 实例名 / 派生实例名 / trait 投影名 / `Dict_` → 模块；codegen 与接口切分共用 | `splitMetaOf`、`splitOwnerEntriesOfModules`、`splitDefOwnerOf` |
| `Driver.Cache` | 接口摘要载体（TTC 思路）：`CachedProgram` = 闭合 datas / defs（含 body）/ globals / insts / classes（**不含 sols/next**）；写侧按出现点深度 zonk（class 字段类型的深度 = 类参数个数，多参数 trait 不是固定 1），读侧 `cachedProgramValid` 校验（无 meta/负索引/自由变量；body 擦除位置的未解 meta 允许并按包段重编号） | `cachedOfProgram`、`cachedProgramValid`、`shiftCachedProgram`、`summaryMetaSegment` |
| `Driver.Iface` | **模块级接口**（TTC 思路）：`ModuleIface`（闭合产物 + 已解析 decls + exports/fixities/imports + `miIfaceHash`/`miDepHashes`/`miSource`）、per-module 文件（与源码同布局，默认在源文件旁）+ `PackageManifest`（模块名→相对路径/源信息/接口哈希，写进包级 `.vuna-iface`）；按归属把 `DtProgram` 切成每模块摘要、SHA-256 内容摘要、原子读写 | `ifaceOfPackage`、`readPackageIface`、`writePackageIface`、`packageIfaceValid` |
| `Driver.Dt` | DT 路径 facade（供 `Compile` / `CompilerCli` / `Interp` / LSP 使用）：单一 `PackageContext` 加载形状；内存源码检查/洞目标、`dtMainKind`、`dtEvalExprInfo`；接口摘要路径的起始 Ec 组装（`depStartOf`）与接口/预置模块入口 | `dtCheck`、`dtCheckWithProgramParts`、`dtCheckPackageWithIfacesParts`、`dtSplitProjectParts`、`dtSplitProjectWithIfaces`、`CheckedPackage` |
| `Driver.Compile` | 编译入口：`PackageContext` 检查/编译、目录式 codegen、构建脚本执行；build meta 与递归建目录；check 缓存 + 依赖接口校验（`depIfacesOf`）+ 接口影子写（`writeIfaceShadow`）；`VUNA_ELAB_FULL=1` 强制全量 | `checkPackage`、`compileToDir`、`depIfacesOf`、`buildMetaText`、`metaUpToDate`、`writeBuildMeta` |
| `Driver.CompilerCli` | 编译器自己的 CLI（`vuna-compiler`）；含受限进程执行入口 `runIn`；workspace check/build 单元、`build --package`、`version` | `runCompilerCli`、`compilerUsageLines`、`runIn` |
| `Version` | 版本号唯一真源；产品 CLI / `vuna-compiler` / build meta / VSCode 探测共用 | `vunaVersion` |

`compiler/vuna.toml` 的 `[export]` 列出全部 68 个导出模块（内部 `Debug` / `CacheFormat` /
`Driver.Iface` / `Driver.Owner` 不在内）；`[capabilities] effects` 声明六个能力（编译器直接
使用 `prim_*`）。工具链模块不在此包。

## 根包工具链模块（`lib/`，不进 seed）

| 模块 | 职责 |
| --- | --- |
| `Vuna.Cli` | 产品 CLI：工具命令分发 + in-process 调 compiler 命令（`runCli`） |
| `Vuna.Interp` | 解释器 facade（DT 精化 + 核心求值，调 `Driver.Dt.dtEvalFile`；工具链侧） |
| `Vuna.Files` | 目录遍历小工具（fmt/doc/test/Index 共用，`collectVunaFiles`） |
| `Vuna.Fmt`（+ `Fmt.Comment`/`Decl`/`Expr`/`Util`） | 源码格式化器（`vuna fmt`，parse → 规范打印；门面只导出 `formatSourceWith`） |
| `Vuna.Lint`（+ `Lint.Rules`/`Fix`/`Diagnostics`） | 风格检查与自动修复（`vuna lint`）；规则见 [lint.md](lint.md) |
| `Vuna.Repl` | 交互式 REPL（`vuna repl`；定义自动签名、行编辑/Ctrl-R、`:load` 文件/目录/模块；表达式经 DT 求值） |
| `Vuna.Doc`（+ `Doc.Types`/`Comments`/`Model`/`Prose`/`Html`/`Run`） | docstring 提取 + 单文件交互 HTML（`vuna doc`）；见 [api-docs.md](api-docs.md) |
| `Vuna.Sig` | 语法级类型打印单一真源（api / doc / search 共用） |
| `Vuna.Search`（+ `Search.Types`/`Query`/`Run`） | 名称 / docstring / 类型检索（`vuna search`） |
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
- `Elab.Driver.elabProgramFull` 做 DT 双向精化（record 声明由 `Elab.Data` 直接精化、
  `deriving` 由 `Elab.Derive` 从字段表展开，多 clause 由 `Elab.Match` 展开），产出
  `DtProgram`（datas / defs / classes / insts）；
- `Codegen.Assembly` 对同一 `DtProgram` 装配运行时 / 模块 / `Main` 的 unit 计划与文本
  （`prepareDtProgram` / `genUnitText` / `mainHook`）；
- `Codegen.Split.generateDtSplitProgram` 按 loader 模块序与声明归属切成逐模块 `SplitFile`
  （含每单元的直接依赖；**唯一输出模型**；`compile` 与 `build` 都走它）。

`check` 只做精化 + 擦除检查并返回警告，不生成代码；包级检查：有 `app/Main.vuna` 的可执行包
检查该入口，库包以 `[export].modules` 为根。

单文件夹具没有单独的加载路径：它按最近 `vuna.toml` 取包上下文（无 manifest 为 base-only），
之后与包内模块走同一 flatten / 精化 / codegen——只有包上下文不同，没有第二套加载语义。

## 接口摘要（TTC 式模块化精化）

`vuna check` / `build` / `compile` 可以**只精化本包声明**：依赖包的模块产物被压缩成闭合的
接口摘要，根包从接口重建精化起始状态。模型参考 Idris2 的 TTC：**摘要只含闭合结果，不携带
elab 状态**（没有跨包 `sols` / `next` / dict goals）。

粒度分两层：

- **包级摘要**：`Driver.Cache.CachedProgram`，一个包一份 datas / defs / globals /
  insts / classes；
- **模块级接口**：`Driver.Iface.ModuleIface`，每模块一个
  `<源文件相对路径>.iface`（默认就在源文件旁，与源码同布局）+ 包级 `.vuna-iface`
  （S3；写侧只重写接口哈希变化的模块），依赖侧按模块装载、逐项校验。`VUNA_IFACE_DIR`
  可把整棵树镜像到外部根。设计、字段、失效判定见 [cache.md](cache.md)。

### 数据流

```text
check / build pkg
  ├─ 包级 check 缓存命中（key = 源哈希 + 依赖哈希 + manifest + 编译器指纹 + schema）→ Ok
  └─ 未命中
      ├─ VUNA_ELAB_FULL=1 → 全量：loadProject + elabProgramFull（整闭包）
      └─ depIfacesOf：逐依赖包读该包的 `.vuna-iface`（S4：本包有干净模块时走增量）
            ├─ schema/编译器/包名、模块源哈希、miDepHashes 链、源码模块集合 任一失败
            │     → 全量回退（并重写本包接口）
            └─ 全部可用 → 接口路径（无干净模块 = 包内全量；S4 有干净模块 = 只精化脏模块）：
                  modulesOfIfaces + cleanModules → Loader.loadProjectWithPreloaded（依赖 + 干净模块零 parse）
                    → resolveProjectKeeping（种子模块已解析，跳过）
                    → depStartOf（起始 Ec + globals；依赖 artifacts 来自模块摘要）
                    → elabProgramFullWithAux（只喂脏模块 decls + 入口；干净/依赖 decls 只作终止性/record 上下文）
                    → checkDtProgram（擦除/名字护栏；datas = 依赖 datas + 本包 datas）
                    → 写本包 per-module 接口（ifaceOfPackage：按归属切分 + zonk + 接口哈希）
```

摘要字段（每包只存**自己的声明**，依赖闭包由读方逐包合并）：`datas`（kind + 构造子类型）、
`defs`（type + body）、`globals`（签名面）、`insts`（tele / 约束 / 头）、`classes`（投影 /
字段类型）、`miDecls`（已解析源码声明，供 record 精化与终止性 SCT 使用）、exports /
fixities / imports / capabilities、`miSource`、`miIfaceHash`、`miDepHashes`。

### 硬不变量

1. **`Ec.deftbl` 只能装定义体**（`DtDef` 的 body）。签名项（尤其 `Int ↦ Type`、`String ↦ Type`
   这类内建类型 global）绝不能进 deftbl：`force` 会做 delta 展开，把 primitive 类型归约成
   `Type`，进而让 `Eq String` 的类参数变成 `Type`、所有内建实例头同归约，报出
   `TC_AmbiguousInstance (Eq Type)` 假歧义（C37 历史根因）。
2. 摘要项必须**闭合、无 `TMeta`、无负 de Bruijn 索引**；已解元变量按出现点深度 quote
   （`Core.Eval.substSolvedMetasAtTbl`，`quote 0` 会把 binder 下的解拍成负/错位索引，而
   `lookupEnv` 对 `i <= 0` 取最内层变量 ⇒ 静默取错 binder）。
3. 失败语义：摘要缺失/不闭合/校验失败 ⇒ 回退全量；**摘要路径的 `Err` 必须上报**（绝不回退，
   否则吞掉本包真实错误）。安全阀宁可慢，不静默漏检。
4. 精化器允许**擦除位置**的未解元变量：摘要里这类 meta 按包段 `(idx+1) << 30` 重编号，消费方
   当作新的未解元变量（只出现在不生成代码、不参与运行时比较的位置）。
5. **record 精化需要依赖包的 record 头**：字段访问 / record 更新 / record 模式在语法降级里
   依赖 `RecordMeta`，候选 record 来自**源码 decls**。接口路径把依赖模块的 `miDecls` 作为
   `termAux` 传入 `prepareDeclsWith`，只取 record 头参与降级、不精化它们——缺了它，依赖包
   类型上的字段访问会报 `unknown field`（如 `c.commentKind`）。
6. **接口哈希链必须闭合**：`miIfaceHash` 覆盖导出面 + 导出定义体（不含 span / 源路径）；
   `miDepHashes` 记录直接 import 的接口哈希，读侧逐项比对（包内模块也参与）。

### 已知边界

- 接口物理单位是**模块**（per-module 文件 + manifest）；包内精化已按模块增量（S4：干净模块复用、脏性沿 import 保守传播）。
- 依赖包的实例/类仍全部并入视图（过近似，与包级摘要一致）；模块签名隔离另立项。
- codegen 已按单元缓存（S5/S7，默认开）；纯代码生成仍整包跑（生成占冷 build ~10–20%，
  逐单元可并部分仅 7–8%，并行收益 <7%；见 [performance.md](performance.md) §9）。
- LSP / REPL 消费接口默认开启（`VUNA_IFACE_TOOL=0` 关闭）：惰性闭包 + 会话缓存 + 单文件
  增量 + 单模块写回已落地；残留擦除位 meta 依赖包段重编号、LSP-only 写回哈希由首次整包
  check 自愈。
- 快判默认内容哈希，`VUNA_CACHE_MTIME=1` 可开 mtime+size 快路径（5s 安全窗）；缓存载荷已有
  framing + 损坏回退，但仍是 OCaml Marshal（显式自描述格式归后续，见 debt C32）。

## codegen 的表示

擦除型 codegen 用 `Core` 的 `Term` 视图生成原生 OCaml：用户 `data` 编译成 OCaml 变体
（每个族一个 `type 'a t_F = ...`）；`Int`/`String` 是语言 primitive（OCaml `int`/`string`），
`Bool`/`List`/`IO` 是 base 的普通 data：canonical `Base.Bool.Bool` 精化成 OCaml `bool`
（`TBool`），`List`/`IO` 按完整符号生成普通变体；`case` 编译成 OCaml `match`、构造器直接
构造变体。`Base.Nat.Nat` 同样不进运行时变体：零/后继、字面量与 `case` 降成 OCaml `int`
与 `if`/`let`（`Codegen.Decl.runtimeDatas` 过滤族；`Codegen.Term` 折叠 Succ 链、降级 Nat case），
算术走 `bi_nat*`。运行时表示由 `Core.rigIsErased` 判定（0 擦除，1/ω 保留）；
**例外（D27）**：运行时类型在 OCaml 里不可命名时（卡住的类型族应用，如 `res op`）
整个字段用不透明值 `Obj.t`、构造子实参插 `Obj.magic`（判据 `ctorOpaqueFlagsOf`）；表达式
位置的 binder 使用由精化器插隐藏 cast `prim_erase`（求值期恒等消去）。见
[effects.md](effects.md) §5。`Elab.Usage` 另做整程序用量检查（QTT 0/1/ω，见
[qtt.md](qtt.md)），不依赖 multiplicity。运行时前导代码（`bi_*`、`dtp_*`、IO 桥接等）在
`Codegen.Term.dtRuntime`，无条件依赖 Unix（`Unix.stat` / `gettimeofday` / `readlink`）——
原语语义见 [primitives.md](primitives.md)。

只用 OCaml 标准库 + Unix（运行时前导代码），不依赖解释循环。代码质量要点：

- **依赖分组**（函数级 SCC，与模块间依赖无关）：用 Kosaraju SCC 求函数依赖分量
  （`Codegen.Erase.groupRuntimeDefs`），自/互递归分量才用 `let rec ... and ...`，非自递归
  单函数用 `let`；
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
（`Driver.Split.buildScript`，flags `-g -w -a+39 -warn-error +39`），按直接依赖分层构建
（层内并行）、每模块精确增量并链接出 `DIR/bin/<包名>`。

### 输出模型（唯一：逐模块 split）

`Codegen.Split.generateDtSplitProgram`（入口 `Driver.Dt.dtSplitProjectParts`（接口路径 `dtSplitProjectWithIfaces`））接收 loader 的
模块序（依赖在前）、entry decls 与完整 `DtProgram`，产出 `List SplitFile`；每个 `SplitFile`
= 文件名 + 文本 + **直接依赖单元列表**（含 `Vuna_runtime`、不含自身；runtime 单元依赖为空，
其余依赖只记实际引用到的单元，不是「所有前序单元」）：

1. `Vuna_runtime.ml`：`dtRuntimeWith`（`Codegen.Term`）= 运行时常量 + `dt_def_locs`
   定义位置表（mangled 值名 → `定义名 (相对路径:行)`，路径已按模块根/包目录归一，
   保证同输入产物与 rotation 的确定性）+ `dt_report_exn` 未捕获异常报告器
   （见 [debugging.md](debugging.md)）；
2. 每个源码模块一个 `<Module>.ml`（OCaml 编译单元名 = 模块名点转 `_d`，如
   `Vuna_dCompiler_dFrontend_dParser.ml`；拓扑序）。文件头**只** `open Vuna_runtime`，
   没有 open 链；跨单元引用（值 `v_*` / 构造子 `C_*` / 类型 `t_*`）一律渲染成 OCaml
   限定名 `Unit.name`（`Unit` = 定义该名字的编译单元，如
   `Base_dList.C_Base_dList_dList_Cons`），同单元内仍是裸名；`List` 桥接放在声明 `List`
   族的模块文件里；
3. `Main.ml`：entry decls 的 datas + defs + `main` 钩子（入口文件里的 `data` 也必须发进来）；
   首行是 `Printexc.record_backtrace` 序言，钩子在 `try` 内执行入口动作；
4. `build.sh`：不在生成器内，由 `Driver.Compile.compileToDir` 用 `Driver.Split.buildScript`
   写盘；`vuna build` 随后执行它。

`build.sh` 两条路径都按 `SplitFile` 的直接依赖工作：干净构建（无 `.cmx`）一次 `ocamlopt`
编译全部源码；增量构建按依赖分层（`depth(u) = 1 + max(depth(dep))`，同层单元互不依赖），
单单元层前台、多单元层 `&` + `wait` 并行，每单元 stamp 只含自身 `.ml/.mli` 与**直接依赖**
的 `.stamp` 内容哈希——改一个单元只重编它的（直接/传递）依赖者。链接顺序 = 拓扑序
（依赖在前）。依赖图是精确 DAG，旧的「全序 open 链 / 文件顺序即依赖顺序」模型已不存在。

命令边界：`compile` 成功静默（不写 `build-meta.json`、不调 `ocamlopt`）；`build` 默认输出到
`<PKG-DIR>/.output`（`--out DIR` 覆盖），codegen 后执行 `build.sh` 链接，`build --no-compile`
只产源码。workspace 根是多包时 `--out DIR` 落在 `DIR/<包名>`，最终二进制是
`DIR/<包名>/bin/<包名>`（无 `--out` 时各成员仍写自己的 `<包目录>/.output`）。包根有
`ffi/*.c` 时 `compileToDir` 会把 C 源复制到 `<OUTDIR>/ffi/` 并写进 `build.sh` 参与编译链接；
没有 `ffi/` 的包产物不变。确定性、build meta 与增量语义见 [packages.md](packages.md) 的
「构建确定性与增量」。

文件划分只由源码顺序与名字决定，不依赖时间 / 环境（确定性）；无法归属的 `DtDef` /
`DtData` 报清晰错误，不静默丢弃。生成链的护栏（构造子字段形状单一真源、
`checkResolvedModules`、entryDecls 与归属校验、`ensureUniqueOcamlNames`）见
[core.md](core.md) §7。

**零成本表示**：`Codegen.Decl.genTypeDeclsWith` 对单构造子单运行时字段的族生成
OCaml 类型别名而不是变体（如 `type t_UserId = int`、`and t_Wrap = int`；字段不透明 /
函数 / 未知名字段保持装箱，类型参数与别名实参按字段实际引用的参数渲染）。对应的构造子
应用在 `Codegen.Term` 里生成恒等（`MkWrap 1` → `1`），构造子 `case` 生成 `let` 绑定
（单构造子分支之后的 catch-all 分支不可达，直接丢弃）。`Bool` / `Nat` / 内建特殊族、
多字段 / 多构造子族、递归候选仍走普通变体；判定在
`Elab.Representation.unboxedInfoOf`，字段形状同源（`ctorKeepFlags`），详见
[type-system.md](type-system.md) §擦除与运行时表示。`deriving via field` 的实例搜索
委托见 [records-traits.md](records-traits.md) §`deriving via field`。

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
- 包格式、build meta 与增量构建：[packages.md](packages.md)
- 种子策略与 rotation：[bootstrap.md](bootstrap.md)
- 工具链（goal / LSP / 错误码）：[tooling.md](tooling.md)
