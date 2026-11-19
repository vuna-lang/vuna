# 编译器实现债审计（分层）

本页是编译器各层「补丁 / 临时绕过 / 能力缺口降级 / 近似 / 结构妥协」的分层清单。
与 [debt.md](debt.md) 的分工：`debt.md` 是**可关闭的单条债务**（每条给可复现证据、
带编号）；本页是**全层视图**（同一处的多个近似合并成一行），用来判断某一层还欠什么。

分类：**A** 补丁/绕过 · **B** 能力缺口降级 · **C** 近似（启发式/硬编码/只覆盖某形状）·
**D** 结构妥协（多真源、手工同步）。⚠️ 标记表示后果是**静默错误**而不是保守误拒。

ID 是稳定引用（`层前缀-序号`），改动时保留编号，删掉实现即把状态改成「已清」。

## 前端（Frontend/）

| ID | 位置 | 类 | 现象 → 后果 | 状态 |
| --- | --- | --- | --- | --- |
| FE-01 | `Packages/Source.vuna` 的 `collectDirFiles` | ⚠️C | fuel 耗尽 `pure []`：文件集合被静默截断，摘要据此判「内容一致」 | 已清（耗尽报 `IC_FuelExhausted`；预算按深度计） |
| FE-02 | `Packages/Source.vuna` 的 `collectNames` / `walkName` | ⚠️C | 同上（同族另一口径 `Pkg.loadPackageWalk` 是 `icFuel`） | 已清（同 FE-01） |
| FE-03 | `Frontend/Parser.vuna` 的 `parseModDecl` | ⚠️B | 显式导出列表从不解析，`modDeclHasExportList` 恒 False，但 Ast/Canonical/Fmt/LSP 都在读 | 开放 |
| FE-04 | `Parser.vuna` 的 `exportMarkerFollows` | A | 两个分支同值，`export x = 1` 被当成导出标记 | 已清 |
| FE-05 | `Parser/Support.vuna` 的 `binderHead` | C | binder 组上限 64 名，超出静默退化成普通括号表达式 | 已清（名字串沿 token 列表结构扫描，无 64 上限） |
| FE-06 | `Manifest.vuna` 的 `layerHasCycle` | ⚠️C | fuel 只按「层数+1」，队列更宽时环路漏检 | 开放 |
| FE-07 | `Manifest.vuna` 的 schema 编码 | D | 注释 / `checkOneEntry` / `buildManifest` 三处手工同步 | 开放 |
| FE-08 | `Toml.vuna` 的 `parseIntegerDigits` | C | 整数累加无溢出检查（词法器对源码字面量有 `IntLiteralOutOfRange`） | 已清（按 `Lexer.maxIntLiteral` 判界，报 `PKG_TomlSyntax`） |
| FE-09 | `Toml.vuna` 的 `flatten*` / `nodeValue` | D | `fuel` 是 SCT 的测度、从不检查；越界不可达靠调用方论证 | 开放 |
| FE-10 | `Toml.vuna` 的 `nodeFields` | C | 表数组元素不是表时静默给空表 | 开放 |
| FE-11 | `Cst.vuna` 的 `closeBlocks` / `buildCst` | ⚠️C | 4096 / `tokCount*4+64` 估算上界，耗尽静默留下未闭合节点 | 已清（`closeBlocks`/`closeDecls` fuel = 栈长，`buildCst` fuel = token 数） |
| FE-12 | `Cst.vuna` 的 `scanStringEnd` / `scanDigitsEnd` | D | 为还原原文二次扫描，规则与 lexer 手工一致 | 开放 |
| FE-13 | `Lexer.isOpChar` + `Parser.parseAtomBase` 的限定符号分支 | C | `.` 并入运算符 token，`A.+` 形状不可达（分支已删；限定运算符引用不存在） | 已清 |
| FE-14 | `Parser.vuna` 的 `parseDoStmt` | A | 任何模式错误都被吞掉、改按表达式重试 | 开放 |
| FE-15 | `Parser/Support.vuna` 的 `stateFuel` | C | 估算上界 + 手写「零 token 链 ≤16」证明，不在门禁里 | 开放 |
| FE-16 | `Rast.vuna` + `Rast/Bridge.vuna` | D | 四份平行 AST + 手写双向搬运，漏改不报错 | 开放 |
| FE-17 | `Canonical/Ast.vuna` 的 tag 编码 | C | tag = 构造子声明顺序，中间插一个即整体位移且解码仍成功 | 开放 |
| FE-18 | `Pkg.vuna` 的 `locateBase` | A | 假 `Int` 形参（为绕「零参顶层值是值」） | 已清（改 `Unit`） |
| FE-19 | `Packages/Source.vuna` 的 `skipSourceDir` | D | 忽略目录黑名单与 `Compile` 构建扫描各一份 | 开放 |
| FE-20 | `Pkg.vuna` 的 `DepGit` url/rev | C | store 查找只用 `hash`，url/rev 只进 `depSourceText`，不校验仓库出处 | 开放 |

## Loader

| ID | 位置 | 类 | 现象 → 后果 | 状态 |
| --- | --- | --- | --- | --- |
| LD-01 | `Flatten.vuna` 的 `loadModule` | ⚠️A | `findModule` 命中即跳过 `rootAllows` → `[export]` 边界与同名歧义只在首次加载生效 | 开放 |
| LD-02 | `Flatten.visibleFixitiesOf` + `Fixity.dedupeFixities` | ⚠️D | fixity 是程序全局表；iface 路径 span 全空 ⇒ 跨模块同名声明被静默去重 | 开放 |
| LD-03 | `Layers.vuna` 的 `checkImports` | ⚠️A | import 目标不在模块表就跳过该边（`preloaded` 装配时越层不检查） | 开放 |
| LD-04 | `Layers.vuna` 的 `closureGo` | C | fuel 耗尽静默返回已累积集合 | 开放 |
| LD-05 | `Expand.internalRef` + `Resolve` 的 `!` 前缀 | A | 隐藏原语走「非法标识符」通道 | 已清（剥前缀后校验 `findIntrinsic`） |
| LD-06 | `Flatten.vuna` 的模块加载 | A | 生产路径残留 `dbg!` 探针 | 已清 |
| LD-07 | `Flatten.vuna` 的 unused-import 判定 | C | 判据只认导出 target，漏「只为 fixity 而 import」；删除 span 假设独占一行 | 开放 |
| LD-08 | `Resolve.vuna` 的 `ctorPairTargets` | A | 构造子候选非空时整组丢弃值条目 | 开放 |
| LD-09 | `Modules.vuna` 的 `unifyEntryPairs` | A | 用户可见歧义被报成 `icInternal` | 开放 |
| LD-10 | `Resolve.vuna` 的解析特判 | C | `Nil/Cons/::` 特判、`>>=`→`bind` 双名回落、`Type` 头不解析实参、隐式 binder 只认 String 域 | 开放 |
| LD-11 | `Resolve.vuna` 的内部名旁路 | B | `@vuna@…` 与「属于编译器包」直接放行 | 开放 |
| LD-12 | `Fixity.vuna` 的 `reorderDecl` | C | 实例体里非 `DSig`/`DFun` 声明原样放行 → 延后成 internal error | 开放 |
| LD-13 | `Fixity.vuna` 的模式别名 | C | 只对 `::` 做别名替换，其它中缀构造子不查表 | 开放 |
| LD-14 | `Addr.vuna` 的 `topoVisit` | ⚠️C | fuel 耗尽静默返回部分序 → 依赖地址退化 `ext:`，iface 永不命中 | 开放 |
| LD-15 | `Addr.vuna` 的模块摘要 | C | 无条件并入 Prelude 摘要（过近似） | 开放 |
| LD-16 | `Fingerprint.vuna` | C | 无 build-id 时身份退化为「路径+大小+mtime」 | 开放 |
| LD-17 | `Expand.vuna` 的宏入口 | B | 只在表达式位置、只认裸 `EVar` 应用头 | 开放 |

## Elab：签名 / 终止性 / 覆盖率

| ID | 位置 | 类 | 现象 → 后果 | 状态 |
| --- | --- | --- | --- | --- |
| EL-01 | `Termination/Scc.vuna` 的 `fuelEdgesGo` | ⚠️A | 穿线失败（`ok=False`）的站点被从图里删掉，剩余严格自环即可判通过 → 接受非终止程序 | 已清（未识别站点按弱边计入；fuel 按守卫形参定位） |
| EL-02 | `Termination.vuna` 的 SCC/DFS | ⚠️C | fuel 耗尽静默返回部分结果 → 整函数跳过终止性检查 | 已清（DFS/SCC 显式 `ok`，耗尽报 `IC_FuelExhausted`） |
| EL-03 | `Termination.vuna` 的 STR | ⚠️C | 硬编码 100000、耗尽静默；三套遍历已漂移（`posWalk` 缺 `ELocalFun`） | 已清（预算按表达式规模派生；STR 耗尽保守拒绝；`posWalk` 补 `ELocalFun`） |
| EL-04 | `Measure.vuna` 的 `weakReach` | ⚠️C | 耗尽返回 `False`=无环（方向是放过） | 已清（耗尽按有环处理） |
| EL-05 | `Measure.vuna` 的正性守卫 | C | 只认 `x <= 0` / `0 >= x` / `x < 1` | 已清（补 `n > 0` / `n >= 1` / `0 < n` / `1 <= n` 的 then 区事实；`n /= 0` 在 Int 上不 sound，仍拒绝） |
| EL-06 | `Measure.vuna` 的 `isMapLike` | C | 按点后短名硬编码 `map/traverse/…` | 开放 |
| EL-07 | `Case.vuna` 的 `unifyIdxList` | C | 耗尽走 `TC_ImpossibleBranchIndex`（误导性错误码） | 已清（耗尽报 `TC_IndexFuel`） |
| EL-08 | `Case.vuna` 的 `occursLevel` | ⚠️C | 耗尽返回 `False`=无 occurs | 已清（耗尽按保守方向 `True`） |
| EL-09 | `Case.vuna` 的 `bindCtorTele` | C | 失败/残参时直接当可达分支 | 已清（绑定失败报 ICE；IndexFuel 保守判可达） |
| EL-10 | `Case.vuna` 的 `hasCatchAll` | A | 任何非 `PCon` 头（含 `PInt`/`PStr`/`PRecord`）都算兜底 → 跳过穷尽检查 | 已清（只认 `PVar`/`PWild`） |
| EL-11 | `Records.vuna` 的 `desugarPatternFuel` | ⚠️A | 耗尽 `OkC pat` 静默返回半降级模式（对照组 `desugarExprFuel` 是 `icFuel`） | 已清（耗尽报 `icFuel`） |
| EL-12 | `Match.vuna` 的 `familyCovered` | C | 缺族信息时补 `_` 兜底 → 注释自认会报假 `missing` | 开放 |
| EL-13 | `Coverage.vuna` 的见证搜索 | C | fuel 耗尽 `Nothing`（少报见证） | 已清（燃料按矩阵节点数派生） |
| EL-14 | `Data.vuna` 的 `eraseIndexMask` | B | 索引擦除只有分析，无消费者（死 API） | 开放 |
| EL-15 | `Records.vuna` 的 `HasField` 注入 | C | 生成实例硬编码 base 具体名字（`Field`/`HasField`/`getField`） | 开放 |
| EL-16 | `Derive.vuna` 的 `boolTrue`/`boolFalse` | A | 用 `1 == 1` / `0 == 1` 造 Bool（派生实例不依赖源码 Bool 构造子） | 开放（有意） |
| EL-17 | `Usage.vuna` 的捕获检查 | C | 上限后 `icInternal`（应保守拒绝） | 已清（报 `TC_CaptureFuel`，保守拒绝） |
| EL-18 | `Representation.vuna` 的 `termIsFunction` | C | 只看顶层 `TPi`，别名展开的函数类型逃过判据 | 已清（沿单字段 record/alias 头展开到 `TPi`） |
| EL-19 | `Data.vuna` 的 record 字段类型 | C | `shift 0 (0-i)` 硬假设字段类型不引用前序字段 | 开放 |

## Elab：Term / Meta / Conv / Dict / Trait

| ID | 位置 | 类 | 现象 → 后果 | 状态 |
| --- | --- | --- | --- | --- |
| EC-01 | `Core/Conv.vuna` 的 `termScopedTo` | ⚠️A | `i < extra` 把负索引当本地 binder 放行；`Eval.varIndex` 越界拍成 `-1`，于是越界解一律通过 | 开放（收紧会打断整链，见下） |
| EC-02 | `Core/Eval.vuna` 的 `varIndex` | ⚠️A | 越界返回 `-1` 哨兵，下游按 `i <= 0` 取最内层变量 → 静默错指 | 开放 |
| EC-03 | `Core/Conv.vuna` 的 `metaCreatedDepth` | C | 未登记时回退当前深度 | 开放 |
| EC-04 | `Core/Conv.vuna` 的 `VPi`/`VLam` | C | 定义性相等不比 `rig`（`rig` 是运行时擦除格子，不比是有意取舍） | 开放（有意） |
| EC-05 | `Core/Conv.vuna` 的 `patternSolution []` | C | 不可达分支伪造 `VType` | 开放 |
| EC-06 | `Core/Conv.vuna` 的 Nat 折算 | C | 饱和成相等；`convNatFuel` 用幻数推预算 | 开放 |
| EC-07 | `Elab/Dict.vuna` 的 `tryResolveDictGoal` | ⚠️A | 程序级求解用空 ctx + `Span ""` + depth 0，与收尾路径不等价 | 开放 |
| EC-08 | `Dict`/`Trait`/`Driver` 的 `solveMeta … 0` | C | 一批延迟求解点传 depth 0，等于跳过作用域检查 | 已清（传 `ctxDepth` 与约束的 `cdepth`） |
| EC-09 | `Dict.vuna` 的 `matchInstances` | C | 上一候选的解表污染下一候选（无候选快照） | 开放 |
| EC-10 | `Dict.vuna` 的 `ctxMemberProofTermGo` | C | 用 `showTerm` 文本比较找同型证明 binder | 开放 |
| EC-11 | `Dict.vuna` 的刚性快路径 | C | `rigidSearchFast` 按族 vs `allInstancesMono` 按全表，两份判据 | 开放 |
| EC-12 | `Dict.vuna` 的方法别名 | D | 别名表 / `isEqMethod` / `cmpRuntimeName` 三处手写 | 开放 |
| EC-13 | `Elab/Term/Impl.vuna` 的 `bindShapeOf` | D | do 块语义靠对 `bind` 签名项做硬编码 de Bruijn 索引匹配 | 开放 |
| EC-14 | `Impl.vuna` 的 `perform`/`handle` | A | 三候选试错（`handleWithAt` → `…Hole` → `handleWith`），顺序由「是不是裸变量」决定 | 开放 |
| EC-15 | `Impl.vuna` 的 `specializeInterpPrimApp` | A | `Interp` 实例语义硬编码进编译器 | 开放 |
| EC-16 | `Impl.vuna` 的效果协议名字 | D | 字面串绕过 `Intrinsics` 的单一真源 | 开放 |
| EC-17 | `Impl.vuna` 的 `sameLabelValue` | C | 行标签包含关系用 `showTerm (quote 0 …)` 文本判等 | 开放 |
| EC-18 | `Meta.vuna` 的 `outerScan` | ⚠️A | 漏 `TProj`/`TRecord`/`TRecUpd` → 线性捕获检查漏报 | 已清 |
| EC-19 | `Meta.vuna` 的 `zonkTermFuel` | C | 固定 64、耗尽原样返回（错误推迟到 codegen） | 开放 |
| EC-20 | `Meta.vuna` 的 `ctorRefTerm*` | D | Ec 版与全局版两份实现 | 开放 |
| EC-21 | `Trait.vuna` 的 `instArgAt` | A | 实参取尽时伪造 `TGlobal "Int"` | 开放 |
| EC-22 | `Trait.vuna` 的 `resolveRigidGoalsGo` | A | `solveMeta` 失败仍把替换记进 acc | 开放 |
| EC-23 | `Trait.vuna` 的 `methodClausesNamed` | C | 实例方法按短名收集（跨类同名方法会被并进来） | 开放 |
| EC-24 | `Trait.vuna` 的 `checkBodyAtEndFuel` | A | 剩余 Pi 静默 η 展开，`TC_DefFewerParams` 永不触发 | 开放 |
| EC-25 | `Trait.vuna` 的 `applyCtxSubstsTo` | A | 注释的索引算术与实现不符 | 开放 |
| EC-26 | `InstName.vuna` 的 `exprNameFor`/`argNameOf` | A | 未知形状伪造 `"X"`/`"Int"` 名 | 开放 |
| EC-27 | `Prelude.vuna` 的 `ityToTermEnv` | A | `IVar` 查不到回退 `TGlobal`（拼错变全局引用） | 开放 |
| EC-28 | `Elab/Driver.vuna` 的 `resolveDictGoalsFix` | C | 字典收敛固定 8 轮 | 开放 |
| EC-29 | `Elab/Driver.vuna` 的实例索引自检 | D | 只在 `--debug-perf` 下跑 | 开放 |
| EC-30 | `Impl.vuna` 的 check 位 `if` | A | 分支检查失败后整体重推断（位置/期望类型信息丢失） | 开放 |

`EC-01` 的事实（收紧即断链）：把 `i < 0` 显式判 False 后，`packages/base` 自身在
`Base/Data/String.vuna` 的 `lines` 上报 `TC_NoInstanceFound`——说明正常编译链**依赖**
负索引被放行，因此它不是一行可改的补丁，必须与 `varIndex` 的表示（越界即错误，
或在 quote 处产生正当的本地 binder）一起改。

## Core / IR / Lowering

| ID | 位置 | 类 | 现象 → 后果 | 状态 |
| --- | --- | --- | --- | --- |
| IR-01 | `Core/Eval.vuna` 的 `quote*` | ⚠️C | 固定 fuel 64，耗尽静默返回 `TType 0`，而 `substSolvedMetas` 用它把解写回程序 | 已清（预算 262144） |
| IR-02 | `Core/Eval.vuna` 的 `hasUnsolvedMeta*` | ⚠️C | 同 64 上限，耗尽返回 `False`（深值判成干净） | 已清（预算派生，耗尽按保守方向 True） |
| IR-03 | `Core/Term.vuna` 的 `substVarAt` | ⚠️A | `TRecUpd` 分支用 `idx - length tele`，与 `shift` 的 `depth + length tele` 相反 | 已清 |
| IR-04 | `Ir/Anf.vuna` | ⚠️C | 燃料耗尽静默返回未变换子项，`anfProgramDefs` 恒 `Ok` | 已清（预算按程序规模派生） |
| IR-05 | `Ir/Cps.vuna` | ⚠️C | 20+ 处 `if fuel <= 0 then e` 返回半 CPS 形态 | 已清（各 pass 预算按项规模派生） |
| IR-06 | `Ir/Cps.vuna` 的 `mCpsApply` | A | 耗尽返回 `IrGlobal "?"` 占位 | 已清（耗尽退化成直接应用，不再占位） |
| IR-07 | `Ir/Cps.vuna` 的 `mStepsDef` | A | 注入的 `machineRun` 全局不在 `irDefDeps` → SCC/可达性看不见 | 已清（`mStepsDef` 把注入的 `machineRun` 记进 deps） |
| IR-08 | `Ir/Cps.vuna` 的 `transformDef` | D | 直接风格 pass（`transformDirect` / `transformDef` / `selfBody`）与 def 签名已保留；机器 pass（`mHandlers` / `mSyms` / `mApplys` / `mMarked` / `mSteps`）仍属类型改变型，节点类型槽继续置空 | 开放（部分） |
| IR-09 | `Ir/Cps.vuna` 的 `isHandleCombinator` | C | handler 组合子按类型判据（结果 `Eff` + clause 参数）；opH 为裸类型变量的核心组合子（`handleCore` / `handleCoreAt` / `handleCoreLin` / `handleWith` / `handleWithAt`）用显式 allowlist，不再用字符串启发式 | 已清 |
| IR-10 | `Ir/Cps.vuna` 的 `isEffResultTy` 注释 | C | 曾与 `Lowering.effResultTyOf` 的实参口径不符 | 已清（对齐注释） |
| IR-11 | `Ir/Validate.vuna` 的 `ctorFieldCountOf` | C | 查不到构造子当 0 字段（跨单元表不全） | 已清（构造子 arity 走程序级 `IrShared` 形状表） |
| IR-12 | `Ir/Validate.vuna` 的 `IrTyVar` | C | 只查 `i >= 0`，不查族 arity | 已清（声明体槽按本声明 arity 校验） |
| IR-13 | `Lowering/Ty.vuna` 的 `renderFieldTy` | C | 解析不到字段类型时凭空分配 `IrTyVar slot`，抬高声明 arity | 已清（解析不到报 ICE；arity 计入额外槽） |
| IR-14 | `Lowering/Env.vuna` 的 `usedTableFix` | C | 64 轮未收敛静默取近似 | 已清（轮数 = 1 + 各族槽总数） |
| IR-15 | `Lowering/Env.vuna` 的 `defTblOf`/`findDtDef` | C | 同键「后插优先」vs「首匹配」，重名时口径不同 | 已清（语义一致：重复名取靠前的一条；注释纠正） |
| IR-16 | `Lowering/Program.vuna` 的 `zipFieldNames` | C | 字段表与实参表长度不一静默截断 | 已清（长度不等报 ICE） |
| IR-17 | `Lowering/Program.vuna` 的 `lookupRtPositionsIn` | C | 找不到运行时位置就静默丢字段更新 | 已清（找不到运行时位置报 ICE） |
| IR-18 | `Lowering/Entry.vuna` 的 `mainShowIr` | A | 用空 def 表 `force`，别名一律退到 `@vuna@main_show` | 已清（force 表与 Elab 收尾同源） |
| IR-19 | `Lowering/Checks.vuna` 的 `checkErasure` | A | 命中 Nat 链就 `OkC 0`，整条链跳过擦除/作用域检查 | 已清（每个节点折回 Nat 链，长字面量嵌在大项里也不吃 fuel） |
| IR-20 | `Ir/Anf.vuna` 的 `__anf` 编号 | D | 二次 ANF 靠 `startsWith "__anf"` 计数避撞名（D111） | 开放 |
| IR-21 | `Core/Canonical.vuna` | C | 规范化编码含 binder 名 ⇒ 重命名即换 iface 哈希 | 开放 |

## Codegen / 三后端

| ID | 位置 | 类 | 现象 → 后果 | 状态 |
| --- | --- | --- | --- | --- |
| CG-01 | `Native/Runtime.vuna` 的 `divFn` | ⚠️A | 无 `min_int / -1` 守卫 → `#DE`/SIGFPE，三端唯一进程崩溃 | 已清（守卫返回 min_int） |
| CG-02 | `Native/Runtime.vuna` 的 `prim_eff_*` | ⚠️B | 非 try 的 FS 原语全映射到 `try_*`：失败变默认真值 + status | 开放 |
| CG-03 | `Native/Runtime.vuna` 的 `try_read_file` | ⚠️A | 8 MiB 固定缓冲，读满即成功 → 静默截断大文件 | 已清（超上界报 io 错误） |
| CG-04 | `Native/Runtime.vuna` 的 `dir_names` | C | 目录项上限 4032，超出 skip | 已清（超上限报 io 错误） |
| CG-05 | `Native/Runtime.vuna` 的 `str_to_c` | ⚠️A | 无界 `rep movsb` 写 4096 `.bss` | 已清（超长 trap） |
| CG-06 | `Native/Runtime.vuna` 的 `strFromInt` | ⚠️C | 符号位存在易失寄存器 `r9`，跨 `str_alloc` 丢失（负数 / `min_int` 可能丢符号） | 已清（符号位存栈槽） |
| CG-07 | `Native/Runtime.vuna` 的 `remove_tree` | ⚠️C | 每层 40 KiB、无栈守卫、`c_strcpy` 无界 | 已清（8 KiB 帧 + 栈下界守卫 + 路径容量检查） |
| CG-08 | `Wasm/Runtime.vuna` 的 `rt_pathCopyRel` | ⚠️A | 无长度上限，覆盖 iov/scratch | 已清（按目标区容量 trap） |
| CG-09 | `Wasm/Runtime.vuna` 的原子写 | C | 临时名 `<path>.tmp` 无 pid（另两端有） | 已清（时间+序号） |
| CG-10 | `Wasm/Render.vuna` 的 `renderInstrFlat` | C | 复合指令返回 `""` → 静默抹掉 | 已清（复合指令复用结构化渲染压平） |
| CG-11 | `Wasm/Step.vuna` + `Module` 的 step 发射 | D | 整段死机器 + 9 类型/4 全局仍发射 + 注释与实现相反 | 已清（文件与发射已删） |
| CG-12 | `Codegen/Term.vuna` 的 cleanup 兜底 | C | 硬上限 256（另两端无） | 已清（预算 = 进入时待跑条数） |
| CG-13 | `Codegen/Term.vuna` 的 `isTty` | C | 看 stdout；native 看 stdin；wasm 恒 False | 已清（三端按 stdout；wasm 无 isatty，保守 False） |
| CG-14 | `Codegen/Decl.vuna` 的 `recordFieldsOf` | C | 字段名表与类型表长度不一静默截断 | 已清（字段名表与类型表长度不等报 ICE） |
| CG-15 | `Native/Module.vuna` 的 `genExprAt` | C | 定义体固定 100000 | 已清（预算按定义体 `irSize` 派生） |
| CG-16 | `Wasm/Runtime.vuna` 的 `fsRemoveTree` | B | 只 unlink / 删空目录 | 开放 |
| CG-17 | 运行时符号表 | D | `Ir/Runtime` / `Native/Module` / `Native/Runtime` / `Wasm/Runtime` / `Codegen/Runtime` 手写同步 | 开放 |

### 三端语义不一致

| 语义 | OCaml | Native | WASM |
| --- | --- | --- | --- |
| `min_int / -1` | `min_int` | `min_int` | `min_int` |
| `strFromInt min_int` | 正确 | 错误文本 | 正确 |
| `fsReadFile` > 8 MiB | 全量 | io 错误（8 MiB 上界） | 全量 |
| 非 try FS 失败 | exit 2 | 静默默认值 | trap |
| `strPack` 越界 | 抛异常 | 截断低 8 位 | 截断低 8 位 |
| `isTty` | stdout | stdout | 恒 False（WASI 无 isatty，保守） |
| 零参顶层定义 | 初始化时求值 | 每次引用重新调用 | `_start` 一次 |
| 原子写临时名 | `<path>.<pid>.tmp` | `<path>.<pid>.tmp` | `<path>.tmp<µs><seq>` |

## Driver / 编译器 Base

| ID | 位置 | 类 | 现象 → 后果 | 状态 |
| --- | --- | --- | --- | --- |
| DR-01 | `Compile.vuna` 的 `splitModsOf` / `summarySplitParts` | ⚠️D | `mode=s/f` 进 split key：产物是「输入 + store 热度」的函数（D112 疑源） | 开放 |
| DR-02 | `Dt.dtProjectDecls` vs codegen 的 `topoModules` | D | 两套模块排序；起点键还是模块名哈希 | 开放 |
| DR-03 | `Dt.topoVisit` / `Compile.closureGo` / `importClosureGo` | ⚠️C | fuel 耗尽静默返回部分结果（同层 `shiftTerm` 是 `icFuel`） | 开放 |
| DR-04 | `CompilerCli.vuna` 的 `stdoutIsTty` | A | 走隐藏原语，绕过 `ConsoleOp` 行 | 开放 |
| DR-05 | `CompilerCli.vuna` + `Capabilities.vuna` | B | native 目标没有 entry 能力检查 | 开放 |
| DR-06 | `Store.vuna` 的 roots 布局 | D | 保留单文件 legacy 布局与一次性迁移 | 已清 |
| DR-07 | `Iface.vuna` + `Compile.vuna` 的 schema 面 | D | `PackageIface` / `ifaceCodec("module-iface 4")` 全仓无调用者 | 已清 |
| DR-08 | `Intrinsics.vuna` 的 `BuiltinEffect.beDefaultName` | D | 字段无读者（全仓恒 `"default"`） | 已清 |
| DR-09 | `CompilerCli.vuna` 的 `emitDiagRevSeq` | A | 诊断顺序依赖非语义求值顺序 | 已清（显式 reverse） |
| DR-10 | `Compile.vuna` 的 `ownCleanInfo` | D | 返回的 `Bool` 恒 True、`depTbl` 无人消费 | 已清 |
| DR-11 | `app/Main.vuna` 的导出 import | D | 人肉同步；漏一个 ⇒ `iface-skip partial` ⇒ 同一源码精化两遍 | 开放 |
| DR-12 | `Dt.vuna` / `Compile.vuna` 的体量 | D | 单模块横跨 6+ 阶段 | 开放 |
| DR-13 | `CompilerCli.vuna` 的 `build` | D | 五条实现路径，缓存/告警/清理各不相同 | 开放 |
| DR-14 | `Compile.vuna` 的哈希折叠 | C | `acc*1000003+h`、63-bit 相加与 SHA 口径并存 | 开放 |
| DR-15 | `Compile.vuna` 的 `toolchainIdEff` | C | 取不到就回落常量 `"none"` | 开放 |

## 跨层根因

1. **名字即身份 / 名字即接口**：`IrBinder` 无唯一 id、`bindShapeOf` 的索引模式匹配、
   `__anf`/`__cps` 编号借 fuel、span 编码进 binder 名、`showTerm` 当相等判据。
2. **「fuel 即终止性证书」，两种失败哲学并存**：一半路径 `icFuel` 硬报错
   （`shiftTerm`、`Data`、`Env`），另一半静默返回部分结果（`Anf`、`Cps`、`Termination`、
   `topoVisit`、`collectDirFiles`、`Cst`）。后者的方向都是「放过」。
3. **多真源手工同步**：内建名字（`Intrinsics` vs `Impl` 字面串）、运算符别名
   （`Fixity` / `Dict` / `Prelude`）、运行时表四份、能力矩阵、覆盖率三套口径、
   `Ast`/`Rast`/`Canonical` 三份结构知识。
4. **类型信息在 pass 之间丢失**：Lowering 填槽 → Anf/Cps 主动清空 → 后端按 arity/名字猜
   handler clause（debt D109 只覆盖前半段）。CPS 的直接风格路径已改为保留节点类型与 def
   签名，handler 分类也已改为类型判据 + 核心组合子 allowlist；机器 pass 仍清空。
5. **缓存口径分裂**：`mode=s/f` 进 key、两套模块排序、`ext:` 哨兵与源摘要并存。

## 相关阅读

- [compiler.md](compiler.md)：模块地图与入口符号。
- [core.md](core.md) / [ir.md](ir.md)：精化器与 IR 的语义边界。
- [native.md](native.md) / [wasm.md](wasm.md) / [effect-machine.md](effect-machine.md)：
  三端运行时与效应机器。
- [debt.md](debt.md)：可关闭单条债务（与本页交叉引用）。