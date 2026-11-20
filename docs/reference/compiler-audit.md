# 编译器实现债审计（分层）

本页是编译器各层**仍未关闭**的「补丁 / 临时绕过 / 能力缺口降级 / 近似 / 结构妥协」清单。
与 [debt.md](debt.md) 的分工：`debt.md` 是**可关闭的单条债务**（每条给可复现证据、
带编号）；本页是**全层视图**（同一处的多个近似合并成一行），用来判断某一层还欠什么。

分类：**A** 补丁/绕过 · **B** 能力缺口降级 · **C** 近似（启发式/硬编码/只覆盖某形状）·
**D** 结构妥协（多真源、手工同步）。⚠️ 标记表示后果是**静默错误**而不是保守误拒；
标「有意」的条目是已定取舍，不是待办。

ID 是稳定引用（`层前缀-序号`）：条目关闭即删除该行（历史在 git），ID 不复用，新条目续号。

## 前端（Frontend/）

| ID | 位置 | 类 | 现象 → 后果 | 状态 |
| --- | --- | --- | --- | --- |
| FE-07 | `Manifest.vuna` 的 schema 编码 | D | 注释 / `isDepSourceKey` / `checkOneEntry` / `applyDepEntry` / `buildManifest` 多处手工同步，没有表驱动 | 开放 |
| FE-09 | `Toml.vuna` 的 `flatten*` / `nodeValue` | D | `fuel` 是 SCT 的测度、从不检查；越界不可达靠调用方论证 | 开放 |
| FE-12 | `Cst.vuna` 的 `scanStringEnd` / `scanDigitsEnd` | D | 为还原原文二次扫描，规则与 lexer 手工一致 | 开放 |
| FE-14 | `Parser.vuna` 的 `parseDoStmt` | A | 任何模式错误都被吞掉、改按表达式重试 | 开放 |
| FE-15 | `Parser/Support.vuna` 的 `stateFuel` | C | 估算上界 + 手写「零 token 链 ≤16」证明，不在门禁里 | 开放 |
| FE-16 | `Rast.vuna` + `Rast/Bridge.vuna` | D | 四份平行 AST + 手写双向搬运，漏改不报错 | 开放 |
| FE-17 | `Canonical/Ast.vuna` 的 tag 编码 | C | tag = 构造子声明顺序，中间插一个即整体位移且解码仍成功 | 开放 |
| FE-19 | `Packages/Source.vuna` 的 `skipSourceDir` | D | 跳过名单在工具链另有 `Files.skipGenerated` / `Clean.skipCleanDir` / `Index.Scan` 三份，且与 `Source` 的名单不一致 | 开放 |
| FE-20 | `Pkg.vuna` 的 `DepGit` url/rev | C | store 查找只用 `hash`，url/rev 只进 `depSourceText`，不校验仓库出处 | 开放 |

## Loader

| ID | 位置 | 类 | 现象 → 后果 | 状态 |
| --- | --- | --- | --- | --- |
| LD-07 | `Flatten.vuna` 的 unused-import 判定 | C | 判据只认导出 target，漏「只为 fixity 而 import」；删除 span 假设独占一行 | 已清（判据加 fixity / 本模块声明的运算符 / 实例模块 / `export import` 前缀条目；删除编辑只在 import 独占一行时给出；`check -W packages/base` 从 20 条降到 0；夹具 `warn_err/03`、`cli/steps/51`） |

| LD-10 | `Resolve.vuna` 的解析特判 | C | `Nil/Cons/::` 特判、`>>=`→`bind` 双名回落、`Type` 头不解析实参、隐式 binder 只认 String 域 | 开放 |
| LD-11 | `Resolve.vuna` 的内部名旁路 | B | `@vuna@…` 与「属于编译器包」直接放行 | 开放 |
| LD-12 | `Fixity.vuna` 的 `reorderDecl` | C | 实例体里非 `DSig`/`DFun` 声明原样放行 → 延后成 internal error | 开放 |
| LD-15 | `Addr.vuna` 的模块摘要 | C | 无条件并入 Prelude 摘要（过近似） | 开放 |
| LD-16 | `Fingerprint.vuna` | C | 无 build-id 时身份退化为「路径+大小+mtime」 | 开放 |
| LD-17 | `Expand.vuna` 的宏入口 | B | 只在表达式位置、只认裸 `EVar` 应用头 | 开放 |

## Elab：签名 / 终止性 / 覆盖率

| ID | 位置 | 类 | 现象 → 后果 | 状态 |
| --- | --- | --- | --- | --- |
| EL-16 | `Derive.vuna` 的 `boolTrue`/`boolFalse` | A | 用 `1 == 1` / `0 == 1` 造 Bool（派生实例不依赖源码 Bool 构造子） | 已清（直接引用 canonical `Base.Data.Bool.Bool.True/False`，精化成 `TBool`；夹具 `dt/101`、`steps/118`） |
| EL-19 | `Data.vuna` 的 record 字段类型 | C | `shift 0 (0-i)` 硬假设字段类型不引用前序字段 | 已清（`recordFieldIndependent` 在构造 `DtData` 时断言，`Driver.Cache` 按族参数校验字段类型；夹具 `dt_err/114`、`records/14`、`RecordFieldScope`） |
| EL-20 | `Termination/Measure.vuna` 的 `funDeclsOf` | ⚠️B | 只收顶层 `DFun`：`DInstance` 里的方法体完全不进终止性分析（`f x = f x` 的实例可通过 `check`） | 已清（方法体并入分组，按短名在包内保守合并；派生实例同时纳入） |

## Elab：Term / Meta / Conv / Dict / Trait

| ID | 位置 | 类 | 现象 → 后果 | 状态 |
| --- | --- | --- | --- | --- |
| EC-03 | `Core/Conv.vuna` 的 `metaCreatedDepth` | C | 未登记时回退当前深度 | 开放 |
| EC-04 | `Core/Conv.vuna` 的 `VPi`/`VLam` | C | 定义性相等不比 `rig`（`rig` 是运行时擦除格子，不比是有意取舍） | 开放（有意） |
| EC-06 | `Core/Conv.vuna` 的 Nat 折算 | C | 长度超过 `natChainMaxValue` 的 Nat 链饱和成相等 | 开放（有意；预算按 `convFuelBase + 4*depth` 派生、`convFuelMax` 封顶） |
| EC-09 | `Dict.vuna` 的 `matchInstances` | C | 上一候选的解表污染下一候选（无候选快照） | 开放 |
| EC-10 | `Dict.vuna` 的 `ctxMemberProofTermGo` | C | 用 `showTerm` 文本比较找同型证明 binder | 开放 |
| EC-11 | `Dict.vuna` 的刚性快路径 | C | `rigidSearchFast` 按族 vs `allInstancesMono` 按全表，两份判据 | 开放 |
| EC-12 | `Dict.vuna` 的方法判定 | D | `isEqMethod` / `isCmpMethod` / `numMethodOpName` / `cmpRuntimeName` 四处手写短名分支 | 开放 |
| EC-13 | `Elab/Term/Impl.vuna` 的 `bindShapeOf` | D | do 块语义靠对 `bind` 签名项做硬编码 de Bruijn 索引匹配 | 开放 |
| EC-14 | `Impl.vuna` 的 `perform`/`handle` | A | 三候选试错（`handleWithAt` → `…Hole` → `handleWith`），顺序由「是不是裸变量」决定 | 开放 |
| EC-15 | `Impl.vuna` 的 `specializeInterpPrimApp` | A | `Interp` 实例语义硬编码进编译器 | 开放 |
| EC-16 | `Impl.vuna` 的效果协议名字 | D | 字面串绕过 `Intrinsics` 的单一真源 | 开放 |
| EC-17 | `Impl.vuna` 的 `sameLabelValue` | C | 行标签包含关系用 `showTerm (quote 0 …)` 文本判等 | 开放 |
| EC-20 | `Meta.vuna` 的 `ctorRefTerm*` | D | Ec 版与全局版两份实现 | 开放 |
| EC-21 | `Trait.vuna` 的 `instArgAt` | A | 实参取尽时伪造 `TGlobal "Int"`（调用点已被长度条件挡住，是不可达的兜底） | 开放 |
| EC-23 | `Trait.vuna` 的 `methodClausesNamed` | C | 实例方法按短名收集（跨类同名方法会被并进来） | 开放 |
| EC-24 | `Trait.vuna` 的 `checkBodyAtEndFuel` | A | 剩余 Pi 静默 η 展开，`TC_DefFewerParams` 永不触发 | 已清（不再合成 `\_arityN` 参数：body 类型须与剩余 Pi η-收缩相容，否则 `TC_TypeMismatch`；`TC_DefFewerParams` 本就不存在于错误表；夹具 `dt/100`、`dt_err/113`） |
| EC-25 | `Trait.vuna` 的 `applyCtxSubstsTo` | A | 注释的索引算术与实现不符 | 已清（q = nTele + k + 1，与注释一致） |
| EC-26 | `InstName.vuna` 的 `exprNameFor`/`argNameOf` | A | 非 `EVar`/`EApp`/`EInt`/`EStr` 头伪造 `"X"` 名；`argNameOf` 的唯一消费者 `instanceHeadTerm` 无调用方 | 已清（命名 Pi 与匿名箭头同名 `Pi_dom_cod`；其余形状按规范编码 `?<hex>` 定址；删死码 `argNameOf`/`instanceHeadTerm`；夹具 `traits/97`、`98`、`dt_err/41`） |
| EC-27 | `Prelude.vuna` 的 `ityToTermEnv` | A | `IVar` 查不到回退 `TGlobal`（拼错变全局引用） | 已清（`checkRuntimeContract` 自证每个 `IVar` 都被 `IPi` 绑定，否则 ICE；回退分支不可达） |
| EC-28 | `Elab/Driver.vuna` 的 `resolveDictGoalsFix` | C | 字典收敛固定 8 轮 | 开放 |
| EC-29 | `Elab/Driver.vuna` 的实例索引自检 | D | 只在 `--debug-perf` 下跑 | 开放 |
| EC-30 | `Impl.vuna` 的 check 位 `if` | A | 分支检查失败后整体重推断（位置/期望类型信息丢失） | 开放 |

## Core / IR / Lowering

| ID | 位置 | 类 | 现象 → 后果 | 状态 |
| --- | --- | --- | --- | --- |
| IR-08 | `Ir/Cps.vuna` 的 `transformDef` | D | 直接风格 pass（`transformDirect` / `transformDef` / `selfBody`）与 def 签名已保留；机器 pass（`mHandlers` / `mSyms` / `mApplys` / `mMarked` / `mSteps`）仍属类型改变型，节点类型槽继续置空。handler clause 的收集已改读 CPS 前的 defs，但这不改变机器 pass 本身的类型改变面 | 开放（部分） |
| IR-20 | `Ir/Anf.vuna` 的 `__anf` 编号 | D | 二次 ANF 靠 `startsWith "__anf"` 计数避撞名（D111）；CPS 的 `freshV`/`freshK` 同样按 fuel 拼名 | 开放 |
| IR-21 | `Core/Canonical.vuna` | C | 规范化编码含 binder 名 ⇒ 重命名即换 iface 哈希 | 开放 |

## Driver / 编译器 Base

| ID | 位置 | 类 | 现象 → 后果 | 状态 |
| --- | --- | --- | --- | --- |
| DR-01 | `Compile.vuna` 的 `splitModsOf` / `summarySplitParts` | ⚠️D | `mode=s/f` 进 split key：产物是「输入 + store 热度」的函数（D112 疑源） | 开放 |
| DR-02 | `Dt.dtProjectDecls` vs codegen 的 `topoModules` | D | 两套模块排序；起点键还是模块名哈希 | 开放 |
| DR-04 | `CompilerCli.vuna` 的 `stdoutIsTty` | A | 走隐藏原语，绕过 `ConsoleOp` 行 | 开放 |
| DR-05 | `CompilerCli.vuna` + `Capabilities.vuna` | B | native 目标没有 entry 能力检查 | 开放 |
| DR-11 | `app/Main.vuna` 的导出 import | D | 人肉同步；漏一个 ⇒ `iface-skip partial` ⇒ 同一源码精化两遍 | 开放 |
| DR-12 | `Dt.vuna` / `Compile.vuna` 的体量 | D | 单模块横跨 6+ 阶段 | 开放 |
| DR-13 | `CompilerCli.vuna` 的 `build` | D | 五条实现路径，缓存/告警/清理各不相同 | 开放 |
| DR-14 | `Compile.vuna` 的哈希折叠 | C | `acc*1000003+h`、63-bit 相加与 SHA 口径并存 | 开放 |
| DR-15 | `Compile.vuna` 的 `toolchainIdEff` | C | 取不到就回落常量 `"none"` | 开放 |

## 跨层根因

1. **名字即身份 / 名字即接口**：`IrBinder` 无唯一 id、`bindShapeOf` 的索引模式匹配、
   `__anf`/`__cps` 编号借 fuel、`showTerm` 当相等判据（EC-10 / EC-17 / EC-26）。
2. **fuel 仍是主要的终止性证书**：多数路径已改成「预算按输入规模派生 + 耗尽 `icFuel`」，
   残留两类——只有 SCT 测度、从不检查的 fuel（FE-09），以及「派生预算不可达」仅靠注释
   论证的静默兜底（`Core/Eval` 的 `VType` / 空表、`Ir/Anf` / `Ir/Cps` 的半变换）。
3. **多真源手工同步**：内建名字（`Intrinsics` vs `Impl` 字面串，EC-16）、运算符别名
   （`Fixity` / `Dict` / `Prelude`）、能力矩阵（DR-05）、覆盖率三套口径、
   `Ast`/`Rast`/`Canonical` 三份结构知识（FE-16 / FE-17）。
4. **类型信息在 pass 之间丢失**：Lowering 填槽 → Cps 机器 pass 主动清空 → 后端按 arity/名字猜
   handler clause（IR-08）。CPS 的直接风格路径已保留节点类型与 def 签名，handler 分类也已改为
   类型判据 + 核心组合子 allowlist。
5. **缓存口径分裂**：`mode=s/f` 进 key（DR-01）、两套模块排序（DR-02）、
   `acc*1000003+h` 与 SHA-256 两种哈希口径并存（DR-14）。

## 相关阅读

- [compiler.md](compiler.md)：模块地图与入口符号。
- [core.md](core.md) / [ir.md](ir.md)：精化器与 IR 的语义边界。
- [native.md](native.md)：native 后端与三端语义差异总览（§8.1）；
  [wasm.md](wasm.md) / [effect-machine.md](effect-machine.md)：wasm 运行时与效应机器。
- [debt.md](debt.md)：可关闭单条债务（与本页交叉引用）。