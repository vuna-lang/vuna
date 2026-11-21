# 编译器参考：模块职责、codegen 表示与输出模型

本文覆盖 `packages/compiler/` 包（`vuna-compiler`，模块 `Vuna.Compiler.*`）的模块职责与 codegen
实现要点。子系统的数据流与「改哪里」速查见 [architecture.md](../architecture.md)，Core /
精化器内部规则见 [core.md](core.md)，种子与自举链见 [bootstrap.md](bootstrap.md)。

## 模块地图

`packages/compiler/` 是编译器包（seed 的唯一来源）。入口 `packages/compiler/app/Main.vuna` 的 import 闭包
就是 `seed/` 的内容（规模以 `seed/` 与 `nix/seed/files.txt` 为准）；工具链
（fmt/lint/repl/doc/test/lsp）在 `packages/cli/lib/`，不在闭包里。
代码按**目录即层**组织：`Base → Frontend → Loader → Core → Elab → Ir`，`Codegen` /
`Lowering` / `Native` / `Wasm` 各自独立成层，`Driver` 在最上；依赖方向由
`packages/compiler/vuna.toml` 的 `[layers]` 声明、由 loader 强制（语义见
[packages.md](packages.md)「层约束」）。全包 **115 个模块，全部在 `[export]` 里**——
没有内部模块，纯门面模块（原 `Core.vuna` / `Elab.vuna` / `Loader.vuna` / `Codegen.vuna`；
`Ir` 的校验入口拆到 `Ir.Validate`）已删除，
消费方直接 import 具体子模块；`Elab` 的选择性重导出也一并消失，子模块即公开面
（见 [debt.md](debt.md) 的封装债务）。目标每模块 ≤~800 行（`Elab.Trait` / `Codegen.Term` /
`Lowering.Program` / `Driver.Dt` 等已超目标，约 1.1–1.5k 行）。

### Base（位置、诊断、编码、摘要、落盘）

| 模块 | 职责 | 关键入口 |
| --- | --- | --- |
| `Base.Source` | 底层位置/路径层（无 `Result`）：`Pos`/`Span`、路径拼接、近似名建议 | `showSpanLoc`、`suggest`、`splitPath` |
| `Base.Diag` | 结构化诊断模型（severity/phase/category/label/field/trace/ICE）与结果通道 `Check`（`ErrC Diagnostic`）；`diagText` 是 short 渲染 | `Check`、`Diagnostic`、`diagText`、`icFuel`、`withFallbackSpan` |
| `Base.Diag.Format` | 诊断渲染唯一入口：short/human/JSON | `renderShort`、`renderHuman`、`renderJsonList` |
| `Base.Diag.Codec` | `Diagnostic` / 检查结果的规范字节编码（`Base.Store` 对象载荷） | `encDiagnostics`、`decDiagnostics`、`encCheckOutcome`、`checkResultCodec` |
| `Base.Common` | 编译器门面：重导出 `Base.Source` + `Base.Diag`，并保留固定类型的 `bind`/`step`/`traverse` | `bind`、`showSpanLoc`、`suggest`、`splitPath` |
| `Base.Diagnostics`（门面） | 错误码体系入口：重导出 `Base.Diagnostics.Tc`/`Cg`/`Ic`、`Base.Common` 与 `Base.Data.Nat`/`Vec` | `tcErr0`、`cgErr0`、`icFuel`、`tcAll`、`cgAll` |
| `Base.Diagnostics.Tc` / `Cg` | `TcErr : Nat -> Type` / `CgErr : Nat -> Type` 域枚举（构造子携带模板、arity 由索引锁定）；`tcAll`/`cgAll` 按 arity 分块（避免单行巨表） | `tcCode`、`tcTemplate`、`cgCode`、`cgTemplate` |
| `Base.Diagnostics.{Rn,Pkg,Loader,Frontend,Warning,Sink,Ic,Common}` | 各阶段错误码域（`RN_` / `PKG_` / `LD_` / `LX_` / `UN_` / `IC_`）与告警去重入口 | `rnCode`、`pkgCode`、`ldCode`、`dedupeWarnings` |
| `Base.Bytes` | 规范字节编码的原子层：自定界文法 `#tag;` / `i<n>;` / `s<len>:<bytes>` / `b0\|b1` / `[<n>:…]` / `0\|1…`，累积器编码 + 游标解码器（`Cur` = 原串 + 偏移，避免 `strUnpack` 整串拷贝） | `encConcat`、`encTag`、`encInt`、`encStr`、`encMaybe`、`decStr`、`curOf`、`thenPair` |
| `Base.Hash` | 内容寻址摘要原语：**SHA-256**（用 `Base.Data.Bits` 的 32-bit 包装在语言内实现：OCaml / wasm / 核心求值同摘要）；`digestHex`（64 位十六进制）/ `digestInt`（63-bit 派生键）/ `prehashOfString`（MB 级载荷折叠）/ `contentKey`·`contentAddress`（大输入：预折叠 + SHA，缓存 key 与内容地址） | `digestOfString`、`digestHex`、`digestIntOf`、`contentKey`、`contentAddress`、`prehashOfString` |
| `Base.Ignore` | `.gitignore` 规则解析与匹配（`!` 取反、尾部 `/` 目录专用、含 `/` 锚定、`**` 跨段）；从 git 根逐层加载规则，扫描根不在仓库时只读本层及更深层 | `parseGitignore`、`ignoreContextEff`、`loadIgnoreFile`、`isIgnored` |
| `Base.Walk` | `.gitignore` 感知的目录遍历骨架（fmt / lint / doc / test / index / lsp 共用）；调用方传目录跳过谓词与文件名保留谓词 | `collectFilesEff` |
| `Base.Version` | 版本号唯一真源；产品 CLI / `vuna-compiler` / build meta / VSCode 探测共用 | `vunaVersion` |
| `Base.Store` | **唯一**缓存载荷落盘层：`vuna-cache-frame 2\|<tag>\|<codec>\|<len>\|<内容地址>\n<payload>` 的编解码（纯）、读侧三层校验（framing → 头内内容地址 → 调用方语义自证）、原子写、去抖写、缓存根探测、对象族读写（`objects/<kind>/`）、roots 与视图锁 | `storeEncode`、`storeDecode`、`storeReadEff`、`storeReadAsEff`、`storeWriteEff`、`storeWriteIfChangedEff`、`storeObjectWriteEff`、`storeRootAppendEff`、`storeCacheBaseEff` |
| `Base.Data.Obs` | 观测插桩适配层（`obsCheck` / `obsDefCheck` / `obsMarkEff`；规范见 [observability.md](observability.md)） | `obsCheck`、`obsDefCheck`、`obsMarkEff` |
| `Base.Intrinsics` | **内建语义唯一真源**：名字/签名形状（`IType`）/arity/归约标签（`IntrinsicOp`）/用户可见性（没有 `Capability` 能力位）；运行时文本不在本模块（`Ir.Runtime` 契约 + `Codegen.Runtime` 实现）；内置身份按声明 symbol（`Base.Data.Bool.Bool` / `Base.Data.List.List` / `Base.Data.Nat.Nat`） | `findIntrinsic`、`intrinsicName`、`intrinsicArity` |

### Frontend（词法、语法、manifest、包图、规范编码）

| 模块 | 职责 | 关键入口 |
| --- | --- | --- |
| `Frontend.Ast` | 语法类型与 AST helper（`Expr`/`Decl`/`Pat`/`Ctor`/`Import`/`ModDecl`/`TraitMethod`） | `clausesFor`、`funArity`、`declNames` |
| `Frontend.Lexer` | 字符游标、token 与位置。token 路径（`lexChars`，不分配注释）与注释路径（`lexSourceWithComments`：一次扫描同时给 token 与注释）分开；注释正文规则（`collectLineBody` / `collectBlockBody`）只有一份 | `lexSource`、`lexSourceWithComments`、`lexComments` |
| `Frontend.Cst` | 无损 CST 词法层：token 携带前置 trivia（空白 / 行注释 / 块注释）与 span，`renderCst` 逐字节还原源码；位置由一条**单调前进**的行/列游标给出（O(bytes)，不再按 token 走行表）。`lexTokensOf` 由已完成的词法（token + 注释）纯组装 trivia 流，工具路径不重复词法 | `lexCst`、`lexTokensOf`、`renderCst`、`roundtripOk` |
| `Frontend.Parser` | offside layout parser → AST + imports；`where` 块与绑定签名行；方法签名带 span；顶层签名可带约束 ctx（`C a =>`）。需要注释与原文的工具用 `parseSourceDetailed`（**一次**词法同时给出 AST / 注释表 / token 流）；`ParseMode` 分档：编译器路径 `PmStrict` 拒绝非线性格（重复 binder），只读工具 `PmTool` 只报语法、把语义留给诊断 | `parseSource`、`parseSourceWithComments`、`parseSourceDetailed`、`parseExpressionSource` |
| `Frontend.Parser.Support` | parser 的状态与 token 小工具（`PState` 游标、span、期望符号、`ParseMode`）；运算符表不在 parser：fixity 由 `Loader.Fixity` 按可见表重排 | `mkState`、`spanOf`、`expectSym`、`ParseMode` |
| `Frontend.Reserved` | 保留 / 合成名的唯一编码：`?hole`、`@vuna@...` 标记（ctor / value / list / tuple / ascribe / perform / handle / row / app / inst-arg / macro / do）与编译器合成的 `#...` 名（`#section` / `#dict…` / `#eta…` / `#tele` / `#ov…`）。`Frontend.Ast` 与 `Frontend.Rast` 都重导出它——两套 AST 形状各自独立，只共享这一层名字编码 | `internalNamePrefix`、`macroSyntaxName`、`sectionBinderName`、`isSynthName` |
| `Frontend.Rast` | 解析后语法：形状与 `Ast` 同构，但变量 / 构造子 / 记录类型等**引用**名是 `RName`（局部 / 全局(module,name) / 内建 / 宏 / 洞），binder 与声明名仍是短名；`Elab` 只读这一层。名字层 `Frontend.Rast.Name`（`classifyName` 是唯一按前缀分类的入口，`Elab` / `Loader` 不得自行按包名前缀判别）；`Frontend.Rast.Bridge` 提供边界转换（`toRastDecls` 给 Elab，`toAstDecls`/`toAstExpr` 给仍以 Ast 为输入的 iface / 哈希 / 工具） | `RName`、`classifyName`、`rnameKey`、`isCompilerModulePrefix`、`ofDecls`、`toRastDecls`、`toAstDecls` |
| `Frontend.Toml` | TOML 子集解析器 | `parseToml`、`lookupEntry` |
| `Frontend.Manifest` | `vuna.toml` 的语义模型与结构校验（`[package]` 只有 `name`；`[layers]` 的键/值形状；不做 I/O） | `parseManifest`、`validateManifest` |
| `Frontend.Packages.Pkg` | 包 / workspace 解析层：manifest 图、依赖 DAG、**每个文件的包上下文**（最近 manifest + 依赖闭包）、base 定位（不碰 Loader / CLI） | `loadPackage`、`workspacePackages`、`contextForFile`、`contextForDir`、`locateBase` |
| `Frontend.Packages.Source` | 包内容收集与摘要：`vuna.toml` + `lib/`/`app/`/`test/` 源文件 → `PackageSource` → 内容摘要 / 语义身份 | `packageSourceEff`、`contentHashOf`、`identityHashOf`、`skipSourceDir` |
| `Frontend.Canonical.Ast` | Frontend `Expr` / `Pat` / `Decl` / `SourceFile` 的规范编码 / 解析（**全部 span 丢弃**：它只服务 iface 哈希输入、codegen 单元 key 与 roundtrip 自检；**不要**拿它当缓存载荷，缓存命中会丢诊断位置） | `encExpr`、`encDecl`、`encDecls`、`encSourceFile`、`decDeclsComplete`、`decSourceFileComplete` |
| `Frontend.Canonical.Pkg` | 包内容编码（codec `pkg-source 1`）：文件集合 → 规范字节，服务内容摘要与语义身份 | `encPackageContent`、`decPackageContent`、`identityOfSource`、`encPackageIdentity` |

### Loader（模块图、名字解析、地址、层约束）

| 模块 | 职责 | 关键入口 |
| --- | --- | --- |
| `Loader.Modules` | 加载器的数据与模块图（叶子）：模块根、import 边、导出表结构；模块名查找与按名查导出各有一张表（`moduleTblOf` / `moduleExportIndexOf`），解析期不再线性扫模块表或导出表 | `collectModuleFiles`、`moduleAllImportsOf`、`moduleTblOf`、`exportIndexOfModuleIn` |
| `Loader.Resolve` | 名字解析：把 parse 后声明/表达式解析成带模块前缀的名字；内建 arity / prelude 放行消费 `Base.Intrinsics` | `resolveProgram` |
| `Loader.Flatten` | 模块导出表计算、加载流程与 flatten（`Prelude` 自动导入——含 ad-hoc 单文件、`[export]` 可见性）；内存源码的**库模块**入口（LSP）；`parseFileWithPath` 每次从源文本 lex + 语法分析（不做 token/AST 缓存）；加载完成后调 `Loader.Layers` 跑一次层约束检查 | `loadProject`、`loadProjectModules`、`loadProjectSource`、`loadModuleSource`、`visibleFixitiesOf` / `dedupeFixities`、`fixitiesForSource` / `fixitiesForSourceIn`（lint/index/doc 的程序级 fixity） |
| `Loader.Expand` | 内置宏展开 pass：parser 把 `name!` 编码成保留名 `@vuna@macro@name`，这里在 fixity 重排后、名字解析前做 AST→AST 展开（内置宏 `dbg!` / `obs!` / `mark!`，展开到隐藏 runtime 原语；插入节点 span = 调用点） | `expandDecls` |
| `Loader.Fixity` | 按每模块可见表重排中缀 / 换别名 / 展开 section（`->` 恒可见；未知符号运算符报错） | `reorderProgram` |
| `Loader.Addr` | **输入摘要（地址）唯一构造器**：`addrOf`（域分隔 + 规范编码 + SHA-256）、模块头抽取 `headerOfSource`、项目身份 `projectIdAddrOf`；所有对象路径都由这里的纯函数决定 | `addrOf`、`headerOfSource`、`projectIdAddrOf` |
| `Loader.Header` | 模块头（import 名单）的输入寻址缓存：键 = 源内容地址（与编译器身份无关），命中即不 parse；未命中现 parse 一次并写回。只缓存成功解析的模块 | `headerImportsEff`、`headerObjKey` |
| `Loader.Fingerprint` | 编译器身份的唯一来源：**身份属于编译器闭包**——本包模块含 `Vuna.Compiler.Loader.Fingerprint` 时按源闭包 + 依赖身份定址（`compilerIdOf`，`build-id` 由构建写入产物目录），其余包继承构建它的编译器身份；运行时读 `VUNA_COMPILER_TAG` → 可执行文件旁 `build-id` → 路径+大小+mtime 兜底。iface 分桶、lex/check/split/unit 的 key 与 framing tag 共用；缓存键另用 `cacheTagEff`（`$out/cache-tag` = 二进制 sha256，回退 `build-id`），同源不同 seed 的二进制不共享缓存 | `compilerIdOf`、`compilerTagEff`、`compilerFingerprintEff`、`buildIdFileName`、`textHashOf` |
| `Loader.Layers` | `[layers]` 的执行者：模块属于所有匹配的层前缀，import 合法 ⇔ 对每个匹配层目标落在自身子树或 `closure(uses)` 的层子树；只看直接 import 边，依赖包恒放行 | `checkProjectLayers`、`labelOf` |

### Core（类型论、求值、相等、Core 编码）

| 模块 | 职责 | 关键入口 |
| --- | --- | --- |
| `Core.Term` | `Term`/`Value`/`Neutral`/`Closure`/`Rig`/`Level`/`Sols` 等数据（唯一真源）与 `shift`/`substVarAt`/显示等纯项变换 | `shift`、`substVarAt`、`rigIsErased` |
| `Core.Eval` | beta 求值、delta 展开、prelude 原语归约、深度正规化与 quote | `eval`、`force`、`applyClosure`、`normalize`、`quote` |
| `Core.Conv` | 定义性相等（beta + delta + eta）与元变量求解（Miller pattern + 创建深度就地检查；非 pattern 报 `TC_CannotSolveHigherOrder`） | `conv`、`convBoth`、`solveMeta` |
| `Core.Canonical` | Core `Term` 的规范编码 / 解析（tag = 构造子声明序；`TVar` / `TLam` / `Binder` 的 span 丢弃） | `encTerm`、`encTermBytes`、`decTermComplete` |

### Elab（双向精化）

| 模块 | 职责 | 关键入口 |
| --- | --- | --- |
| `Elab.Sig` | 签名工具：trait 类参数 kind 推断 + 顶层签名自由名量化（约束 ctx 与类型一起参与自由名扫描与 kind 推断）；量化 banned 集按模块作用域计算，`qualifiedBannedTbl` 一次建表 + per-sig O(1) 查 | `quantifyTopSig`、`quantifyTopSigCtxCached`、`qualifiedBannedTbl`、`classParamKind` |
| `Elab.Types` | Elab 的数据定义与共享状态：`DtDef`/`DtAxiom`/`DtCtor`/`DtData`/`DtGoal`/`DtClass`/`DtInst`/`DtProgram` 与 `Ctx`；`Ec` 带 ctor 索引缓存。**`Ec.deftbl` 的语义是「名字 → 定义体」**（delta 展开的唯一来源） | `dtDataName`、`dtDefType`、`dtDefBody`、`dtProgDefs` |
| `Elab.Meta` | 共享工具层：值/构造子引用、`convEc`、元变量创建深度与统一 `zonkTerm`、擦除判据（`isTypeDomain`/`binderRig`）、命名空间查询（`typeLookup`/`valueLookup`）、canonical Bool 的 `TBool` 表示 | `convEc`、`zonkTerm`、`binderRig`、`typeLookup`、`dictTypeName` |
| `Elab.MetaSpans` | 元变量 / 洞的创建点 span 登记（诊断与 LSP 洞目标用） | `recordMetaSpan`、`metaSpanOf`、`newHoleMeta` |
| `Elab.Case` | case 规范形：索引合一（`unifyIdx`）、scrutinee 反射、单一可达性判据（`BranchVerdict`/`allCtorsUnsatisfiable`）、空族与冗余/不可达诊断 | `unifyIdx`、`reflectScrutinee`、`checkCoverage`、`isEmptyFamilyValue` |
| `Elab.Dict` | 字典编码的表示与实例搜索：字典类型/实例头识别、`conv` 头匹配、实例搜索（递归解 ctx / 约束实例）、`==`/比较运算符特化（Int/String 内建或 Eq/Ord 字典；无泛型结构比较兜底）；Eq / Ord / Num 的方法判定与 runtime 名都查同一张 `BuiltinOp` 表 | `searchInstance`、`dictFamilyNameOf`、`builtinOpOf`、`numMethodOpName`、`deferEqDict` |
| `Elab.Term` | 项的双向检查（与 case 规则互递归的核心）：`inferE`/`checkE`/应用/隐式插入/类型检查 | `inferE`、`checkE`、`checkApp`、`checkType` |
| `Elab.Data` | `data` 声明与构造子精化：`elabCtor`、`elabDataHead(s)`、`elabDataBodies`；校验 kind 结果层级与构造子字段 sort | `elabDatas`、`checkCtorFieldSorts` |
| `Elab.Representation` | 运行时表示判定：去装箱族候选（`unboxedInfoOf`）、构造子字段形状、字段可表示性 | `unboxedInfoOf`、`ctorKeepFlags`、`unboxedFamilySet` |
| `Elab.Trait` | trait/instance 声明与实例体：类参数 kind、方法投影、实例头检查（重复/相干性；无命名实例、支持约束实例 ctx）、方法体精化；实例 ctx 与顶层签名 ctx 共用 `elabConstraintDomains`（含类参数 kind 校验），隐式字典 binder 按 RigΩ 绑定（运行时保留、可多次使用）；方法签名带 span，实例名=单类前缀+完整 head 名 | `checkInstanceHeads`、`elabInstanceBodies`、`elabConstraintDomains`、`instanceName` |
| `Elab.InstName` | 实例名生成规则（单类前缀 + 完整 head 名）的唯一实现 | `instanceName` |
| `Elab.InstCoherence` | 实例相干性检查（重叠头判据） | `findInstanceClash`、`headsOverlap` |
| `Elab.Driver` | 精化入口与程序组装：签名（约束 ctx → 隐式字典 binder）→ data/trait/instance → 定义体（声明的字典目标先解到 ctx binder，剩余才提升）→ zonk/终止性检查 → `DtProgram`；洞目标（含洞名）。`goalsOfProgramTolerant` 与严格收尾拆开：只读 core 的 goals，未解洞也能给目标+上下文（供 `vuna goal` / LSP）。接口摘要路径用 `elabProgramFullWithAux`（起始 Ec 由依赖摘要注入；termAux 只喂 record 头与终止性的依赖上下文） | `elabProgramFull`、`elabProgramFullWithAux`、`goalsOfProgram`、`goalsOfProgramTolerant`、`dtEvalExprIn` |
| `Elab.Termination` | 终止性检查：调用图 + SCC，结构下降/守卫 Int 判据（无包级豁免）。输入是**精化后**的定义组（见 `Elab.Termination.ElabInput`）；`checkTerminationGroups` 只报告本包组名的失败，依赖包声明只作 SCT 上下文 | `checkTerminationGroups`、`checkTerminationDecls` |
| `Elab.Termination.ElabInput` | 从 `DtProgram` 构造分析组：普通定义一组；实例字典按字段拆成 `<字典符号>#<方法>` 一组；`Term` → 分析表达式（丢弃擦除实参、`case` 分支转构造子模式）；「投影 + 已知字典值」的调用点改写成语义分组名，跨实例同名方法因此不会误报自递归 | `elabTermInput`、`dictGroupKey` |
| `Elab.Prelude` | 把 `Base.Intrinsics` 表翻译成 DT prelude globals（签名）；没有第二份名字/签名表 | `preludeGlobals`、`builtinTyName`、`cmpBuiltinTyName` |
| `Elab.Match` | 多 clause 模式矩阵降级：构造子列 → `case`、字面量列 → `if` 链（纯 Ast→Ast）；降级前先做子句可达性检查（`TC_ClauseUnreachable`） | `multiToExpr`、`checkReachable`、`buildColumnExpr` |
| `Elab.Records` | `record` 的语法与结构化元数据：收集 `RecordMeta`、把 record 表达式/模式降级成**合成位置构造子**的引用（不降级成 `DData`）；`prepareDecls*` 返回的 decls 保留 `DRecord` | `desugarRecords`、`recordsOfDecls`、`prepareDecls` |
| `Elab.Derive` | `deriving (Show, Eq, Ord, Hashable)` 的实例生成（展开成等价 `instance`，交给既有实例精化；派生规则按**完整类名**匹配，用户模块里同短名的 trait 不会被当成内建类；`Hashable` 的字段哈希用 `Base.Trait.Hashable.hashCombine`；Eq/Ord 的 Bool 结果引用 canonical `Base.Data.Bool.Bool.True/False`） | `expandDerivings` |
| `Elab.Coverage` | 覆盖性见证构造（缺失模式 / 冗余分支）、子句可达性（usefulness）与诊断渲染 | `improveExhaustive`、`coverageWitness`、`clauseCover`、`renderWitness` |
| `Elab.Usage` | 整程序用量检查（QTT 0/1/ω，见 [qtt.md](qtt.md)） | `checkProgramUsage`、`checkDefUsage` |
| `Elab.Canonical` | 接口载荷与哈希输入域：`DtDef` / `DtData` / `DtInst` / `DtClass` / `RecordMeta` / `ExportEntry` / `FixityDecl` / `Import`（span 丢弃、字段全覆盖；`DtCtor` 随 `DtData` 编码） | `encDtDef`、`encDtData`、`encDtInst`、`encDtClass`、`encExportEntry`、`encRecordMeta`、`encFixity`、`encImport` |

### Ir（擦除后 IR）

| 模块 | 职责 | 关键入口 |
| --- | --- | --- |
| `Ir.Model` | IR 数据模型（纯数据，无 `Term`/`Value`/`DtDef`）：节点、binder、分支、类型声明、定义/分组、入口形态、共享元数据、内联 arity 表 | `Ir`、`IrBinder`、`IrTy`、`IrTyDecl`、`IrDef`、`IrShared`、`IrUnit`、`IrEntry` |
| `Ir.Analysis` | SCC 分组（Kosaraju、依赖就绪排序、递归值形状护栏、覆盖自证）+ 入口可达性（native / wasm 共用） | `assembleGroups`、`assembleGroupNames`、`groupNames`、`reachableDefs` |
| `Ir.Represent` | 表示选择 pass：按 `IrShared.irSharedUnboxed` / `irSharedCtorShapes` 把去装箱族的构造子应用改写为直接返回字段、单构造子 `IrCase` 改写为 `IrLet`；Lowering 对去装箱族只生成装箱形态，类型声明侧仍在 `Lowering.Ty` | `representUnit` |
| `Ir.Runtime` | **IR ↔ 运行时契约**（唯一真源）：符号清单（普通内建名/桥接内建名/`@ir@*` 合成符号）+ 桥接标记 + `Ir` 项符号遍历；IR 节点里没有目标文本 | `irRtContract`、`irRtNames`、`irRtLookup`、`irRtBridgesList`、`irSymbolsOfUnit` |
| `Ir.Validate` | 单元 / 程序级校验：定义名唯一、分组自洽、入口 `main` 存在、符号已声明且 arity 一致、每个 `IrVar` 在作用域内且不引用擦除占位 | `validateUnit`、`validateProgram`、`checkScopedUnit` |

### Codegen / Lowering / 两个后端

| 模块 | 职责 | 关键入口 |
| --- | --- | --- |
| `Lowering.Program` | **Core → IR 的唯一入口**：擦除决策（binder 占位、实参/分支丢弃）、表示决策（record 字段表、去装箱族、构造子对齐与不透明 cast、Nat 折回与 Nat case 降级）、形态判定（内建内联、`++` 展平、分支 binder 形状）、入口分类（动作/值、展示函数、宿主 handler）。程序级检查（分区/擦除/axiom/作用域/名字单射/SCC 递归值形状）也在这里；不产文本 | `lowerTerm`、`lowerUnitOf`、`lowerProgramOf`、`lowerEntryOf`、`mkLwEnv`、`checkProgramOf` |
| `Lowering.Env` | `LwEnv` / `LwSt`、表示判定、类型参数槽不动点、共享元数据、定义体使用事实（`termUseInto`） | `mkLwEnv`、`lwEnvWithUnit`、`termUseInto` |
| `Lowering.Ty` | 类型表面：`IrTy` 渲染与类型声明（纯函数，不进项） | `irTyOf`、`irTyDeclsOf` |
| `Lowering.Entry` | 入口形态：动作行 / 值入口分类、展示函数、宿主 handler 序列 | `lowerEntryOf`、`entryShapeOf` |
| `Lowering.Erased` | **擦除后 Core 的 typed view**：运行时 `TVar` 下标归一化 + 校验；类型面（binder 槽 / 类型实参 / telescope）保留 | `eraseTerm`、`validateErased` |
| `Lowering.Checks` | Core 侧检查（不产生 IR）：擦除检查、axiom 运行时使用检查、de Bruijn 作用域护栏、定义体事实（`termUseInto`：运行时依赖 + float/tracing/obs 旗标，一次遍历） | `checkAllErasure`、`checkAllDefScopes`、`checkNoAxiomRuntime`、`termUseInto`、`partitionDefs` |
| `Codegen.Decl` | 名字编码（sanitize/前缀/保留字）+ 跨单元引用限定（`Unit.name`）+ IR 类型/声明 → 后端模型 | `irTyText`、`irTypeDeclsText`、`ctorOcamlName`、`qualValueText` |
| `Codegen.Ocaml.Model` | OCaml 后端模型：类型面 `OTy` / `OCtor` / `ODecl`，项面 `OPat` / `OTerm` / `ODef`。**不含目标文本**（运行时模板与内联内建展开是显式的 `ORaw`）；名字编码、限定与括号在渲染侧 | `OTy`、`OTerm`、`OPat`、`ODef` |
| `Codegen.Ocaml.Render` | 后端模型的文本渲染：参数槽、构造子/字段布局、`type ... and ...` 块、模式的 `C (p1, p2)` 形态、表达式的括号策略 | `renderTy`、`renderDecls`、`renderTerm`、`renderPat` |
| `Codegen.Term` | IR → 后端模型（`OTerm` / `ODef`）+ DT 运行时模板（`bi_*`、`dtp_*`、宿主原语桥接）+ 定义位置表/异常报告器 + main 钩子模板；`IrRt` 的文本从 `Codegen.Runtime` 查表；**不感知 Core** | `dtRuntime`、`dtRuntimeWith`、`dtObsRuntime`、`dtDefLocTable`、`genIr`、`genGroups`、`genEntryHook`、`lineDirectiveOf`（`#line` 注入） |
| `Codegen.Runtime` | **契约的 OCaml 实现**：符号 → OCaml 运行时表达式（`ocamlRtText`）+ List 桥接 helper 名单；对 `Ir.Runtime` 契约双向全覆盖（gaps/extras），由 `Lowering.Program.checkRuntimeContract` 在 check 路径上断言 | `ocamlRtText`、`ocamlRtHelperNames`、`rtTextGaps`、`rtTextExtras` |
| `Codegen.Assembly` | `IrUnit` 装配：open 头 + 类型声明 + List 桥接 + 分组正文 + 直接依赖表 | `genUnitParts`、`genUnitText`、`unitPartsDeps` |
| `Native.{Abi,Model,Module,Render,Runtime}` | native 后端：`IrProgram` → `NativeProgram` → x86-64 汇编文本（支持面、ABI、运行时见 [native.md](native.md)） | `Native.Module.build`、`Native.Render.renderModule`、`Native.Runtime.*` |
| `Wasm.{Instr,Model,Module,Render,Runtime,Types}` | wasm 后端：`IrProgram` → `WasmModule` → WAT（WasmGC 表示与运行时见 [wasm.md](wasm.md)） | `Wasm.Module.build`、`Wasm.Render.renderModule`、`Wasm.Runtime.*` |

### Driver（输出模型、facade、后端驱动、CLI）

| 模块 | 职责 | 关键入口 |
| --- | --- | --- |
| `Driver.SplitGen` | **唯一** codegen 生成器：逐模块 split 的声明归属表与分文件装配（每单元经 `Lowering.Program` 出 `IrUnit`） | `generateDtSplitProgram` |
| `Driver.Split` | 输出文件模型与构建脚本生成：`SplitFile`、依赖序、按内容哈希增量的 `build.sh` | `SplitFile`、`buildScript`、`writeSplitFiles`、`writeSplitFilesIfChanged` |
| `Driver.Owner` | **声明归属表**（从 `Driver.SplitGen` 抽出）：声明名 / 实例名 / 派生实例名 / trait 投影名 / `Dict_` → 模块；codegen 与接口切分共用 | `splitMetaOf`、`splitOwnerEntriesOfModules`、`splitDefOwnerOf` |
| `Driver.Cache` | 接口摘要载体（TTC 思路）：`CachedProgram` = 闭合 datas / defs（含 body）/ globals / insts / classes（**不含 sols/next**）；写侧按出现点深度 zonk（class 字段类型的深度 = 类参数个数，多参数 trait 不是固定 1），读侧 `cachedProgramValid` 校验（无 meta/负索引/自由变量；body 擦除位置的未解 meta 允许并按包段重编号） | `cachedOfProgram`、`cachedProgramValid`、`shiftCachedProgram`、`summaryMetaSegment` |
| `Driver.Iface` | **模块级接口**（TTC 思路）：`ModuleIface`（闭合产物 + 已解析 decls + exports/fixities/imports + `miIfaceHash`/`miImplHash`/`miDepHashes`/`miSource`/`miDefLocs`），按地址写 `objects/module-iface/<addr>`（`Base.Store` framing、codec 见 `ifaceSchema`）；按归属把 `DtProgram` 切成每模块摘要 | `ifaceOfPackage`、`readIfaceAtEff`、`writeIfaceShadow`、`pkgIfaceHashOf`、`pkgImplHashOf` |
| `Driver.Dt` | DT 路径 facade（供 `Compile` / `CompilerCli` / `Interp` / LSP 使用）：单一 `PackageContext` 加载形状；内存源码检查/洞目标、`dtMainKind`、`dtEvalExprInfo`；接口摘要路径的起始 Ec 组装（`depStartOf`）与接口/预置模块入口 | `dtCheck`、`dtCheckWithProgramParts`、`dtCheckPackageWithIfacesParts`、`dtSplitProjectParts`、`dtSplitProjectWithIfaces`、`CheckedPackage` |
| `Driver.Compile` | 编译入口：`PackageContext` 检查/编译、目录式 codegen、构建脚本执行；包级 check 判定 = `objects/check-outcome/<checkIn>` 存在性，build 判定 = `objects/splitptr/<splitIn>` → `blobs/<splitIdentity>`（没有查询图/会话索引）；依赖接口按地址读（缺任一个 ⇒ 回退全量）、依赖身份取 `objects/pkg-iface`、接口影子写、`VUNA_ELAB_FULL=1` 强制全量、`VUNA_IFACE_AUDIT=1` 双路径对拍；`checkIn`/`splitIn`/`splitIdentity` 的输入见 [cache.md](cache.md) | `checkPackage`、`compileToDir`、`depIfacesOf`、`checkViaGraph`、`splitIdentityOf`、`buildMetaText`、`metaUpToDate` |
| `Driver.PerfCache` | codegen 单元缓存（按单元 key 复用生成的 `SplitFile`） | `unitCacheRead`、`unitCacheWrite`、`unitCacheCodec` |
| `Driver.ToolPayload` | 工具会话载荷编码：`ToolContext` → 规范字节（codec `tool-context 1`），落在 `objects/tool-context/<addr>`；字段顺序 = record 声明顺序，解码要求恰好消费完 | `encToolContext`、`decToolContext`、`toolContextSchema`、`toolContextCodec` |
| `Driver.CompilerCli` | 编译器自己的 CLI（`vuna-compiler`）；含受限进程执行入口 `runIn`；workspace check/build 单元、`build --package`、`version` | `runCompilerCli`、`compilerUsageLines`、`runIn` |
| `Driver.Native` / `Driver.Wasm` | 后端驱动：检查 + lowering + 写 `.s` 文件集 / `main.wat`；不 import Core/Elab/Intrinsics | `compileNative`、`compileWasm` |

`packages/compiler/vuna.toml` 的 `[export]` 列出全部 115 个模块（模块即公开面，没有内部模块）；
编译器直接使用 `prim_*`（无 manifest 能力/特权声明）。工具链模块不在此包。

## 产品 CLI 工具链模块（`packages/cli/lib/`，不进 seed）

| 模块 | 职责 |
| --- | --- |
| `Vuna.Cli` | 产品 CLI：工具命令分发 + in-process 调 compiler 命令（`runCli`） |
| `Vuna.Interp` | 解释器 facade（DT 精化 + 核心求值，调 `Driver.Dt.dtEvalFile`；工具链侧） |
| `Vuna.Files` | 目录遍历小工具（fmt/doc/test/Index 共用，`collectVunaFiles`；骨架在 `Vuna.Compiler.Base.Walk`，遵守 `.gitignore`） |
| `Vuna.Fmt`（+ `Fmt.Comment`/`Decl`/`Expr`/`Util`） | 源码格式化器（`vuna fmt`，parse → 规范打印；门面只导出 `formatSourceWith`） |
| `Vuna.Lint`（+ `Lint.Rules`/`Fix`/`Diagnostics`） | 风格检查与自动修复（`vuna lint`）；规则见 [lint.md](lint.md) |
| `Vuna.Repl` | 交互式 REPL（`vuna repl`；定义自动签名、行编辑/Ctrl-R、`:load` 文件/目录/模块；表达式经 DT 求值） |
| `Vuna.Doc`（+ `Doc.Types`/`Comments`/`Model`/`Prose`/`Html`/`Run`） | docstring 提取 + 单文件交互 HTML（`vuna doc`）；见 [api-docs.md](api-docs.md) |
| `Vuna.Sig` | 语法级类型打印单一真源（api / doc / search 共用） |
| `Vuna.Search`（+ `Search.Types`/`Query`/`Run`） | 名称 / docstring / 类型检索（`vuna search`） |
| `Vuna.Index`（+ `Index.Types`/`Scan`/`Query`/`Render`） | 源码符号索引（`vuna map` / `vuna api`；parse 级，会话载荷在 `objects/tool-context/`） |
| `Vuna.Lsp`（+ `Lsp.Protocol`/`Diagnostics`/`Query`） | LSP 服务端（JSON-RPC over stdio；方法见 [tooling.md](tooling.md)） |
| `Vuna.Json` | 最小 JSON 读写（LSP 用） |
| `Vuna.TestRunner` | 包内测试运行器（`vuna test`） |

这些模块永不进入 seed（见 [bootstrap.md](bootstrap.md) 的 TCB 边界）。

## 编译链

只有一条链：`Loader → Elab → Lowering.Program（Core → IR）→ Codegen.{Decl,Term,Assembly}`，
由 `Vuna.Compiler.Driver.Compile` 的 `checkPackage` / `compileToDir` 组合：

- `Pkg.contextForFile` / `contextForDir` 给出唯一 `PackageContext`（最近 manifest + 依赖
  闭包；无 manifest 为 base-only）；
- `Loader.Flatten.loadProject` / `loadProjectModules` / `loadProjectSource` 解析 import 图并
  flatten（内部名字带模块前缀；ad-hoc 单文件自动注入 `Prelude`），随后 `Loader.Expand`
  在名字解析前展开内置宏；
- `Loader.Resolve` 的内建 arity / prelude 放行、`Elab.Prelude` 的签名全部来自
  `Vuna.Compiler.Base.Intrinsics`；没有 manifest 能力/特权/信任检查；
- `Elab.Driver.elabProgramFull` 做 DT 双向精化（record 声明由 `Elab.Data` 直接精化、
  `deriving` 由 `Elab.Derive` 从字段表展开，多 clause 由 `Elab.Match` 展开），产出
  `DtProgram`（datas / defs / classes / insts）；
- `Lowering.Program` 把本次程序的 datas/defs 降成 `Ir`（`checkProgramOf` 跑程序级检查，
  `lowerUnitOf` 出 `IrUnit`，`lowerEntryOf` 出 `IrEntry`）——它是 **Core 的唯一消费者**；
- `Codegen.Assembly.genUnitParts` 把 `IrUnit` 装配成「open 头 + 类型 + 桥接 + 正文」；
  `Codegen.Term.genEntryHook` 渲染 main 钩子；
- `Driver.SplitGen.generateDtSplitProgram` 按 loader 模块序与声明归属切成逐模块 `SplitFile`
  （每单元经 `Lowering.Program` 出 `IrUnit`；含直接依赖；**唯一输出模型**；`compile` 与 `build` 都走它）。

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
- **模块级接口**：`Driver.Iface.ModuleIface`，每模块一个对象
  `objects/module-iface/<模块接口地址>`（Store framing，写侧只写内容变化的模块），依赖侧按地址
  装载、逐项校验；模块顺序单独存 `objects/module-order/<包摘要>`。设计、字段、失效判定与
  `ifaceHash`/`implHash` 口径见 [cache.md](cache.md)。

### 数据流

```text
check / build pkg
  ├─ 包级 check 缓存命中（key = 源哈希 + 依赖哈希 + manifest + 编译器指纹 + schema）→ Ok
  └─ 未命中
      ├─ VUNA_ELAB_FULL=1 → 全量：loadProject + elabProgramFull（整闭包）
      └─ depIfacesOf：逐依赖包按地址读 `objects/module-iface/`（缺任一模块 ⇒ 回退全量）
            ├─ schema/编译器/包名、模块源哈希、miDepHashes 链、源码模块集合 任一失败
            │     → 全量回退（并重写本包接口）
            └─ 全部可用 → 接口路径（无干净模块 = 包内全量；有干净模块 = 只精化脏模块）：
                  modulesOfIfaces + cleanModules → Loader.loadProjectWithPreloaded（依赖 + 干净模块零 parse）
                    → resolveProjectKeeping（种子模块已解析，跳过）
                    → depStartOf（起始 Ec + globals；依赖 artifacts 来自模块摘要）
                    → elabProgramFullWithAux（只喂脏模块 decls + 入口；干净/依赖 decls 只作终止性/record 上下文）
                    → checkDtProgram（擦除/名字护栏；datas = 依赖 datas + 本包 datas）
                    → 写本包 per-module 接口（ifaceOfPackage：按归属切分 + zonk + 接口哈希）
```

摘要字段（每包只存**自己的声明**，依赖闭包由读方逐包合并）：`datas`（kind + 构造子类型）、
`defs`（type + body）、`globals`（签名面）、`insts`（tele / 约束 / 头）、`classes`（投影 /
字段类型）、`miDecls`（已解析源码声明，供 record 精化使用；终止性分析已改读精化产物）、exports /
fixities / imports、`miSource`、`miIfaceHash`、`miDepHashes`。

### 硬不变量

1. **`Ec.deftbl` 只能装定义体**（`DtDef` 的 body）。签名项（尤其 `Int ↦ Type`、`String ↦ Type`
   这类内建类型 global）绝不能进 deftbl：`force` 会做 delta 展开，把 primitive 类型归约成
   `Type`，进而让 `Eq String` 的类参数变成 `Type`、所有内建实例头同归约，报出
   `TC_AmbiguousInstance (Eq Type)` 假歧义。
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

- 接口物理单位是**模块**（per-module 文件 + manifest）；包内精化按模块增量（干净模块复用、脏性沿 import 保守传播）。
- 依赖包的实例/类仍全部并入视图（过近似，与包级摘要一致）；模块签名隔离另立项。
- codegen 按单元缓存（默认开）；纯代码生成仍整包跑（生成占冷 build ~10–20%，
  逐单元可并部分仅 7–8%，并行收益 <7%；见 [compiler-benchmarks.md](compiler-benchmarks.md)）。
- LSP / REPL 消费接口默认开启（`VUNA_IFACE_TOOL=0` 关闭）：惰性闭包 + 会话缓存 + 单文件
  增量 + 单模块写回；工具写回与整包产物按 `meOrigin` 结构性隔离。残留擦除位 meta
  靠**按模块名排序后的名次**分配段号重编号（`Driver/Cache.shiftTerm` / `Driver/Dt.shiftedDepPrograms`；
  覆盖与段确定性已修，彻底收尾需语义方案 B，见 [debt](debt.md) C37）。
- 源校验默认内容哈希；mtime+size 只用于同秒安全窗（`mtimeSafetyWindowSec`），不参与判等；缓存载荷是
  各模块的规范编码（`Base.Bytes` / `Frontend.Canonical.*` / `Core.Canonical` / `Elab.Canonical`）+ `Base.Store` framing（magic/tag/codec/len/内容地址），读侧坏条目
  即 miss 并覆盖写（见 [cache.md](cache.md)）。

## codegen 的表示

擦除型 codegen 用 `Core` 的 `Term` 视图生成原生 OCaml：用户 `data` 编译成 OCaml 变体
（每个族一个 `type 'a t_F = ...`）；`Int`/`String` 是语言 primitive（OCaml `int`/`string`），
`Bool`/`List` 是 base 的普通 data：canonical `Base.Data.Bool.Bool` 精化成 OCaml `bool`
（`TBool`），`List` 按完整符号生成普通变体；`case` 编译成 OCaml `match`、构造器直接
构造变体。`Base.Data.Nat.Nat` 同样不进运行时变体：零/后继、字面量与 `case` 降成 OCaml `int`
与 `if`/`let`（表示类别来自 `Base.Intrinsics.canonicalFamilies` 的 `FamilyRepr`；
`Lowering.Program` 过滤族、折叠 Succ 链、降级 Nat case，后端只渲染），
算术走 `bi_nat*`。运行时表示由 `Core.rigIsErased` 判定（0 擦除，1/ω 保留）；
**例外（`resIdx i o` 这类擦除依赖）**：运行时类型在 OCaml 里不可命名时（卡住的类型族应用）
整个字段用不透明值 `Obj.t`、构造子实参插 `Obj.magic`（判据 `ctorOpaqueFlagsOf`）；表达式
位置的 binder 使用由精化器插隐藏 cast `prim_erase`（求值期恒等消去）。见
[effects.md](effects.md) §5。`Elab.Usage` 另做整程序用量检查（QTT 0/1/ω，见
[qtt.md](qtt.md)），不依赖 multiplicity。运行时前导代码（`bi_*`、`dtp_*`、宿主原语桥接等）在
`Codegen.Term.dtRuntime` / `dtRuntimeWith`，无条件依赖 Unix（`Unix.stat` / `gettimeofday` /
`readlink`）——原语语义见 [primitives.md](primitives.md)。`dtRuntimeWith` 按程序级旗标
（`Ir.Shared` 的 `irSharedUsesFloat` / `irSharedUsesTrace` / `irSharedUsesObs`）**按需追加**
运行时段：不引用浮点 / tracing / 观测的程序，产物里根本没有那些代码（因此关闭口径下
产物逐字节不变）。观测段（`Codegen.Term.dtObsRuntime`，约 390 行 OCaml）提供 `dtp_obs_*`：
级别读取、span、计数、日志、CPU 采样（`ITIMER_PROF` + `SIGPROF`）、内存采样
（`Gc.Memprof`）与 `at_exit` flush；规范见 [observability.md](observability.md) §3/§6。

只用 OCaml 标准库 + Unix（运行时前导代码），不依赖解释循环。代码质量要点：

- **依赖分组**（函数级 SCC，与模块间依赖无关）：用 Kosaraju SCC 求函数依赖分量
  （`Lowering.Program` 用 `Ir.Analysis.assembleGroupNames`，分组结果带 `irGroupIsRec`），
  自/互递归分量才用 `let rec ... and ...`，非自递归
  单函数用 `let`；
- **比较运算符特化**：精化期按实参类型把 `==` `/=` `<` `<=` `>` `>=` 重写为
  `bi_eq_int` / `bi_eq_str` 等单态 helper；其它类型走 `Eq`/`Ord` 字典参数；
- **短路**：`a && b` / `a || b` 在精化期降成 `TIf`，左侧能决定结果时不求值右侧；
- **字符串拼接**：`++` 走 `bi_concat`（OCaml `^`）；
- **零参定义求值一次**：零运行时参数的顶层定义直接生成 `let v_x = body`；递归组里零参
  非构造子 RHS 报 `CG_RecursiveValueDefinition`；
- 唯一输出模型是**逐模块**：`Driver.SplitGen` 把同一个 `DtProgram` 按模块切成
  `Vuna_runtime.ml` + 各源码模块 + `Main.ml`（**不生成 `.mli`**）。

编译产物为 OCaml 源码后由 `ocamlopt` 编译链接：`vuna compile` 只产源码目录，由调用方执行
生成的 `build.sh` 编译；`vuna build` 在 codegen 后直接执行 `build.sh`
（`Driver.Split.buildScript`，flags `-g -w -a+39 -warn-error +39`），按直接依赖分层构建
（层内并行）、每模块精确增量并链接出 `DIR/bin/<包名>`。

### 输出模型（唯一：逐模块 split）

`Driver.SplitGen.generateDtSplitProgram`（入口 `Driver.Dt.dtSplitProjectParts`（接口路径 `dtSplitProjectWithIfaces`））接收 loader 的
模块序（依赖在前）、entry decls 与完整 `DtProgram`，产出 `List SplitFile`；每个 `SplitFile`
= 文件名 + 文本 + **直接依赖单元列表**（含 `Vuna_runtime`、不含自身；runtime 单元依赖为空，
其余依赖只记实际引用到的单元，不是「所有前序单元」）：

1. `Vuna_runtime.ml`：`dtRuntimeWith`（`Codegen.Term`）= 运行时常量 + `dt_def_locs`
   定义位置表（mangled 值名 → `定义名 (相对路径:行)`，路径来自 `IrShared.irSharedDefLocs`
   + 增量路径的 `extraDefLocs`，已按模块根/包目录归一，落盘前排序保证确定性）
   + `dt_report_exn` 未捕获异常报告器（见 [debugging.md](debugging.md)）；
2. 每个源码模块一个 `<Unit>.ml`（OCaml 编译单元名 = 模块路径去掉包前缀后点转 `_d`，如
   `Vuna.Compiler.Frontend.Parser` → `Frontend_dParser.ml`、`Base.Data.List` → `B_dData_dList.ml`；
   拓扑序）。文件头**只** `open Vuna_runtime`，
   没有 open 链；跨单元引用（值 `v_*` / 构造子 `C_*` / 类型 `t_*`）一律渲染成 OCaml
   限定名 `Unit.name`（`Unit` = 定义该名字的编译单元，如
   `B_dData_dList.C_List_Cons`），同单元内仍是裸名。名字只编码**本地段**：单元内的声明
   共享同一个模块前缀，所以 `A.B.foo` 写成 `v_foo` 而不是把整条路径背进标识符；`List` 桥接放在声明 `List`
   族的模块文件里；
3. `Main.ml`：entry decls 的 datas + defs + `main` 钩子（入口文件里的 `data` 也必须发进来）；
   首行是 `Printexc.record_backtrace` 序言，钩子在 `try` 内执行入口动作；
4. `build.sh`：不在生成器内，由 `Driver.Compile.compileToDir` 用 `Driver.Split.buildScript`
   写盘；`vuna build` 随后执行它。

`build.sh` 的内部只有一份单元表（`@` 分隔并行层，其余行 `单元 直接依赖...`，拓扑序），
编译调用、stamp 与链接顺序都从它派生。干净构建（无 `.cmx`）在 `JOBS<=1` 时一次 `ocamlopt`
编译全部源码，其余情况按依赖分层（`depth(u) = 1 + max(depth(dep))`，同层单元互不依赖），
层内 `&` + 层末 `wait` 并行；每单元 stamp 只含自身 `.ml/.mli` 与**直接依赖**
的 `.stamp` 内容哈希——改一个单元只重编它的（直接/传递）依赖者。链接顺序 = 拓扑序
（依赖在前）。依赖图是精确 DAG（没有「全序 open 链 / 文件顺序即依赖顺序」模型）。

命令边界：`compile` 成功静默（不写 `build-meta.json`、不调 `ocamlopt`）；`build` 默认输出到
`<PKG-DIR>/.output`（`--out DIR` 覆盖），codegen 后执行 `build.sh` 链接，`build --no-compile`
只产源码。workspace 根是多包时 `--out DIR` 落在 `DIR/<包名>`，最终二进制是
`DIR/<包名>/bin/<包名>`（无 `--out` 时各成员仍写自己的 `<包目录>/.output`）。包根有
`ffi/*.c` 时 `compileToDir` 会把 C 源复制到 `<OUTDIR>/ffi/` 并写进 `build.sh` 参与编译链接；
没有 `ffi/` 的包产物不变。确定性、build meta 与增量语义见 [packages.md](packages.md) 的
「构建确定性与增量」。

文件划分只由源码顺序与名字决定，不依赖时间 / 环境（确定性）；无法归属的 `DtDef` /
`DtData` 报清晰错误，不静默丢弃。生成链的护栏（构造子字段形状单一真源、
`checkResolvedModules`、entryDecls 与归属校验、`Lowering.Program.ensureUniqueOcamlNamesIn`）见
[core.md](core.md) §7。

**零成本表示**：`Lowering.Program` 对单构造子单运行时字段的族产出 `IrUnboxedDecl`
（后端渲染成 OCaml 类型别名而不是变体，如 `type t_UserId = int`、`and t_Wrap = int`；
字段不透明 / 函数 / 未知名字段保持装箱，类型参数与别名实参按字段实际引用的参数渲染）。
对应的构造子应用在 Lowering 里只保留单字段（物化为 `Ir` 的同一个节点，`MkWrap 1` → `1`），
构造子 `case` 降成 `IrLet`（单构造子分支之后的 catch-all 分支不可达，直接丢弃）。`Bool` / `Nat` / 内建特殊族、
多字段 / 多构造子族、递归候选仍走普通变体；判定在
`Elab.Representation.unboxedInfoOf`，字段形状同源（`ctorKeepFlags`），详见
[type-system.md](type-system.md) §擦除与运行时表示。`deriving via field` 的实例搜索
委托见 [records-traits.md](records-traits.md) §`deriving via field`。

## codegen 夹具基线

codegen 健康由**固定夹具**度量：`packages/compiler/test/corpus/codegen/` 是冻结的包（data/多构造子、case、
record、trait/instance/deriving、as-pattern、where/let 多 clause、List 结构递归、Int 相等、
零参定义、动作/do、`prim_*` 的 `Eff` 包装、跨模块 split）。`checks.vuna-metrics` 用
`vuna build --no-compile` 生成它，剔除 `B_d*.ml` / `Prelude.ml` / `Vuna_runtime.ml` 后，
用 `nix/tools/metrics.sh` 与 `nix/checks/data/codegen.baseline` 做**精确基线**比较
（`<metric> =<expected>`，不等即失败）。

输入固定，所以任何漂移都是 codegen 输出变化，必须复核后更新基线；剔除 base/runtime 是
因为它们的尺寸随功能增长，纳入会重新引入「移动靶」。正常语言/检查器功能提交不改基线；
有意改 codegen、夹具或 base 接口时，重跑 `sh nix/checks/vuna-metrics.sh` 取新值并复核
diff。盲区：base/runtime 自身的 codegen 不在这条门禁里；尺寸也不等于耗时——耗时/内存看
`bench/bootstrap.sh`。

**种子尺寸不设门槛**：`seed/` 的绝对 bytes/lines 随功能增长，没有可比性；bench 的
`sizes.seed_bytes` / `stage1_bytes` 只作参考，`nix/tools/metrics.sh` 仍可手动量任意产物。

## 相关阅读

- 子系统数据流与改动定位：[architecture.md](../architecture.md)
- Core / NbE / 精化器内部规则：[core.md](core.md)
- 内建声明面、原语语义与宿主层：[primitives.md](primitives.md)
- 包格式、build meta 与增量构建：[packages.md](packages.md)
- 种子策略与 rotation：[bootstrap.md](bootstrap.md)
- 工具链（goal / LSP / 错误码）：[tooling.md](tooling.md)
