# IR 参考：擦除后的中间表示与运行时契约

本文描述三层：`Vuna.Ir.*`（IR 数据定义、纯分析与校验）、`Vuna.Ir.Runtime`
（IR ↔ 运行时**契约**）与 `Vuna.Compiler.Lowering.Program`（Core → IR 的唯一入口）、
`Vuna.Target.Ocaml.Runtime`（契约的 OCaml 实现）。

子系统位置见 [architecture.md](../architecture.md)，
终态方向与「为什么先做 IR」见 [architecture-target.md](../architecture-target.md)
（门禁表），codegen 输出模型见 [compiler.md](compiler.md)。

## 位置与形状

```text
Loader → Elab → Core ──Lowering──> IR ──Vuna.Target.Ocaml.{Decl,Term,Assembly}──> OCaml 文本
                          │
                          └── Ir.Runtime：运行时符号契约（符号名 + 桥接标记）
                              Vuna.Target.Ocaml.Runtime：符号 → OCaml 运行时表达式
```

- **IR 是后端唯一的输入面**：OCaml 后端不 import `Core` / `Elab` / `Intrinsics`，
  因此「后端要理解类型论」这个耦合被切断；wasm / native 只对接 IR。
  native 的支持面、ABI 与运行时子集见 [native.md](native.md)。
  三个后端都是 `Model` + `Render` 两层：OCaml 的模型是 `Vuna.Target.Ocaml.{Model,Render}`
  （运行时模板与内联内建展开是显式的 `ORaw`），wasm / native 各自有自己的模型。
- **Lowering 是 Core 唯一的消费者**：擦除、表示决策、入口分类都发生在这一步，
  后端只做文本（名字编码、跨单元限定、fresh 名字、布局、`let rec` 分组、运行时模板）。
- **ANF（wasm 前置）**：`Ir.Anf` 把每条非简单表达式绑定到 `let`，binder 用单调
  `next` 编号（不是路径深度）；它保持求值顺序与作用域，给效应 thunk 的 CPS/Step 变换提供
  一阶输入。wasm 在 codegen 前跑一次 ANF。
- **派发 id（Lowering 内）**：`Ir.Dispatch` 在 lowering 之后把 `sendCore` / `performCore` /
  `handleCore*` / `handleWith*` 的调用换成 `*Id` 变体，并把路由串 `(key, name)` 的
  `effectId` 实参插进去（字面量在编译期折成整数，其余留给运行时）。机器与 OCaml
  运行时的 handler 匹配因此只比整数；源码层入口仍是 String。
- **CPS lowering（native / wasm）**：`Ir.Cps` 是 `Ir -> Ir` 的后端内变换（不改变 Lowering 产物）：
  只把 `MkEff` / `MkScoped` / `IrEffThunk` 的 thunk 改成显式 `k`，并把
  `prim_effect*` 换成 `@ir@cps@*`。纯代码与调用约定不变；详见
  [effect-machine.md](effect-machine.md)。
- **尾位置标记（`Ir.Tail`）**：`Ir.Cps.cpsDefsMachine` 末尾跑一次纯 pass，把结果位置的调用
  包成 `IrTail`。native / wasm 只消费标记并发射各自的尾调用指令；标记是语义提示，后端
  能力不足时回退普通调用。详见下文「尾位置标记」。
- 门禁：IR 路径的产物逐字节确定，且与
  [architecture-target.md](../architecture-target.md) 门禁表里的差分口径一致。

## 三条硬边界

| 边界 | 规则 | 守护 |
| --- | --- | --- |
| 依赖方向 | `Vuna.Ir.*` 是独立包 `vuna-ir`，只依赖 `vuna-base` 与 `vuna-compiler-base`（位置 / 诊断 / 内建符号表）；跨包可见性由 `[export]` 管，包内没有 web 式层表。`packages/target-ocaml` 只吃 IR；上游的唯一消费者是 `Lowering.Program`（Core → IR）与 `Lowering.Checks`（Core 侧检查）。声明归属切分与分文件装配在 `Driver.SplitGen`（Driver 层，允许 import `Elab` 的声明表，但必须路由到 `Lowering.Program`、不得自己消费 `Core` / `Intrinsics`） | `checks.ir-boundary`（正向断言与 IR 形状） + `packages/ir/vuna.toml` 的 `[dependencies]` |
| 名字 | IR 节点里只有**源码名**与**契约里的运行时符号**（`IrRt` / `IrRtApp`；节点里没有目标文本）；`v_` / `t_` / `C_` / `f_` 前缀、转义、`Unit.` 限定、运行时表达式都属于后端 | 同上 + review |
| 数据 | IR 只有确定性纯数据（`String` / `Int` / `Bool` / `List` / `Pair` / `Maybe` / `Span`）：不含闭包、`HashMap`、`Value`、`Term` | `Vuna.Ir.Model` 的 import 面 |
| 编码 | 跨进程边界只用 `Vuna.Ir.Codec`（`Vuna.Compiler.Base.Bytes` 的规范字节文法）；`encode`/`decode` 必须往返（`packages/ir/test/Codec.vuna`） | `vuna test packages/ir` |

## 数据模型（`Vuna.Ir.Model`）

### 节点 `Ir`

只保留运行时形状；被擦除的实参不产生节点。

| 节点 | 含义 | 备注 |
| --- | --- | --- |
| `IrVar binder` | 运行时 binder 引用 | 携带 binder **身份**（Lowering 已解析 de Bruijn 下标）；擦除 binder 不进 IR |
| `IrGlobal name` | 顶层运行时定义引用 | 跨单元限定时由后端加前缀并记依赖 |
| `IrCtor family ctor typeArgs args` | 构造子应用 | `typeArgs` 是族的运行时类型实参（未知时 `Nothing`）；实参已按 keep 形状对齐；不可命名字段已包 `IrCast` |
| `IrRecord family resultTy fields` | record 构造 | `resultTy` 是 record 族的运行时类型（未知时 `Nothing`）；`(源码字段名, 值)`，按运行时字段顺序 |
| `IrProj base family field resultTy` | record 投影 | `resultTy` 是字段的运行时类型（未知时 `Nothing`）；非 record 族的投影由 Lowering 降成 `IrCase` |
| `IrRecUpd base family fields resultTy` | record 更新 | `resultTy` 是更新结果的运行时类型（未知时 `Nothing`）；只含被改字段 |
| `IrRt sym` | 运行时符号引用 | 符号必须在 `Ir.Runtime` 契约里；目标文本由后端映射（不记依赖） |
| `IrRtApp sym args` | 运行时符号的饱和应用 | 内建名 + 实参；OCaml 运算符模板在后端；arity 由 `irInlineArity` 定 |
| `IrCast from to ir` | 表现层转换 | 表示改变、运行时不产生操作；`from` / `to` 是可选运行时类型（未知时 `Nothing`），后端渲染成自己的转换形式 |
| `IrInt` / `IrStr` / `IrBool` / `IrFloatLit` | 字面量 | `IrInt` 也承载折叠后的 Nat 字面量；`IrStr` 未转义 |
| `IrLet binders e body` | `let` | unboxed case 降级用；binder 表是完整 telescope（含擦除占位） |
| `IrLam binders resultTy body` | lambda 链 | 擦除 binder 占位不渲染；无运行时 binder 时退化成体；`resultTy` 是体的运行时类型（未知时 `Nothing`） |
| `IrApp ty f a` | 应用 | `ty` 是函数类型与结果类型（`Pair`；未知时 `Nothing`）；擦除实参已丢弃 |
| `IrTail inner` | 尾位置标记 | 求值与 inner 相同；只用于结果位置的调用（`IrApp` / `IrRtApp` / `IrRt` / 零参 `IrGlobal`）；后端可回退 |
| `IrIf c t e` | `if` | |
| `IrCase scrutTy resultTy scrut alts` | 通用 `match` | `scrutTy` / `resultTy` 是 scrutinee 与结果的运行时类型（未知时 `Nothing`）；分支 binder 带按构造子字段实例化的类型；无 catch-all 时后端补不可达兜底臂 |
| `IrNatCase scrut fresh zero succ catch` | Nat case 降级 | Nat 运行时是 `int`，不能生成变体 match；`fresh` 是 `dtnat__<n>` 的编号 |
| `IrConcatMany parts` | `++` 链展平 | `String.concat "" [a; b; c]` |
| `IrEffThunk family ctor unitTy arity prim` | 装箱动作构造 | 原语运行时仍是 eager 函数，结果包成 `MkEff` |
| `IrEffBind family ctor unitTy` | `prim_eff_bind1` 的装箱实现 | 当前无库调用方 |

### binder 身份 `IrBName`

binder 的**身份**在 Lowering 分配，前缀与编号渲染属后端：

| 构造子 | 渲染 | 用途 |
| --- | --- | --- |
| `IrBUser name` | 源码名转义（保留字加 `_`） | lambda 参数 |
| `IrBArm n` | `dtb__<n>` | case 分支 binder（按生成顺序编号） |
| `IrBNat n` | `dtnat__<n>` | Nat case 的 scrutinee binder |
| `IrBWild` | `_` | 丢弃 |

`IrBName` 只负责渲染；binder 的**身份**是 `IrBinder` 的 `irBinderId`
（`sameBinderId` 只比这个值，名字与类型不参与比较）：

| id 区间 | 分配者 | 说明 |
| --- | --- | --- |
| `1..` | Lowering（`LwSt.lwBinder`） | 每单元单调递增，跨定义不复用 |
| `-1` | 类型注解遍历 | 不进 IR 的临时 binder 哨兵 |
| `-(kind*10^15 + fuel*10^6 + i)` | CPS | kind 区分 fresh 前缀；fuel 沿作用域链严格递减 |
| `-(10^17 + n)` | ANF | `__anf<n>` |
| `-(2*10^17 + n)` | native / wasm 合成 | `effArg` / `eta` / 宿主包装 |
| `0` | 全仓共享 | 擦除占位（不进运行时，`IrVar` 不得引用） |

id 只需沿作用域链唯一，不同定义 / 单元可复用。Pass 里的合成 binder 区间互不相交，
因此与 Lowering 的正数 id 不会误判相等。`Ir.Validate` 校验运行时 binder 的 id 非 0、
同一 telescope 内不重复。

`irBinderErased = True` 只占 de Bruijn 槽位、不进 pattern / 参数表。
`irBinderTy` 是可选的运行时类型（`IrTy`）：Lowering 只在外层 binder 与类型实参都能
落到可命名的运行时类型时填入，擦除占位与类型参数保持 `Nothing`；后端渲染成
`fun (x : ty)` 的参数注解。`IrLam` 另带体的结果类型（`Maybe IrTy`），由 Core 的 λ
类型槽下传；`Ir.Validate` 校验「擦除 binder 不带注解」、`IrTyData` 的实参个数（本单元
声明的族）、以及 `IrLam` 结果类型与 `IrDef` 签名。没有注解的 binder 仍照旧渲染。

### 类型表面 `IrTy`

签名级运行时类型：`IrTyVar i`（族参数槽）、`IrTyInt` / `IrTyStr` / `IrTyBool` /
`IrTyFloat`、`IrTyOpaque`（`Obj.t`）、`IrTyArray` / `IrTyRef`（内建类型构造子）、
`IrTyData name args`（程序数据族）、`IrTyFun dom cod`（显式函数；隐式 Pi 已剥掉）。
隐式 Pi / 索引 / telescope 在 Lowering 消解，不进 IR。

### 声明、定义与单元

- `IrTyDecl`：`IrVariantDecl`（变体族）/ `IrRecordDecl`（OCaml record）/ `IrUnboxedDecl`
  （去装箱别名）。参数槽分配、不透明字段、record 字段表都在 Lowering 定好。
- `IrDef`：`IrDef name arity deps sig body recOk initGuard span`（运行时定义）或
  `IrExternDef name ty cSym span`（受限 FFI）。`sig` 是 `renderPiTy` 产出的运行时签名
  （隐式/擦除 binder 已剥掉，不可命名的部分落 `IrTyOpaque`）；`arity` 仍是调用约定里的
  运行时参数个数。`irDefDeps` 是运行时引用到的顶层定义（Core 遍历顺序的去重表），
  SCC 分组吃它。
- `IrGroup`：`irGroupIsRec` + 成员（SCC 序）。
- `IrUnit`：类型声明 + 分组 + `hasListFamily` + `typeRefs` + 可选 `IrEntry`。
- `IrProgram`：`IrShared` + 一个 `IrUnit`（check 路径的整程序装配）。
- `IrShared`：record 运行时字段表、canonical List 族、`usesFloat` / `usesTrace`（文本日志
  runtime）/ `usesObs`、定义位置行。它只承载**后端渲染要消费**的表示决策结果；构造子形状、去装箱
  集合、类型参数槽是 Lowering 内部的查表输入，不进 IR。

## 运行时契约（`Vuna.Ir.Runtime`）

**IR 里没有目标文本**：`IrRt sym` / `IrRtApp sym args` 只引用符号名，符号必须在本契约里
声明；OCaml 表达式在 `Vuna.Target.Ocaml.Runtime`（后端表）。这是「一份 IR 驱动所有
后端，后端之间只差运行时契约」（[architecture-target.md](../architecture-target.md) 不变量 6）
的可检查形式，也是 wasm / native 后端开工前的唯一前置。

`irRtContract` 的组成（254 条，`Ir.Runtime` 是唯一真源）：

| 类别 | 条数 | 说明 |
| --- | --- | --- |
| 普通内建名 | 223 | 名字 = `Base.Intrinsics.intrinsicName`；`prim_eff_bind1` 除外（走 `IrEffBind` 专用节点） |
| 桥接内建名 | 25 | 运行时模板引用 canonical List 族的 `dtp_*` helper：缺 List 族报 `CG_ListBridgeRequired`，跨单元按 List 族单元限定；`irRtSymBridgesList = True` |
| 合成符号 | 6 | `@ir@natSucc`、`@ir@show{Int,Nat,Str,Float,Bool}`（入口展示 / Nat 后继，不对应内建） |

后端义务（OCaml 是参考实现；wasm / native 按同一契约实现子集）：

1. **全覆盖**：契约里每个符号都要有该目标的实现。OCaml 侧 `ocamlRtText` 必须 total
   （`rtTextGaps` 空），且不得有契约外的条目（`rtTextExtras` 空）。
2. **桥接**：`irRtBridgesList` 为真的符号，其模板里的 `dtp_*` helper 要按 List 族归属单元
   限定并把该单元记成直接依赖（机制在 `Vuna.Target.Ocaml.Term.genBridgeRef`）。非 OCaml 后端要在
   自己的对象表示上重建这套 helper（native 侧的设计约束见
   [native.md](native.md) §9——桥接是对象表示落地后的验收目标，不是独立切片）。
3. **语义参考实现**：运行时库本身（`bi_*` / `dt_*` / `dtp_*` 的定义）仍是 `Vuna.Target.Ocaml.Term`
   的 runtime 模板。契约只固定「符号面」（名字 + 桥接标记；arity 由 `irInlineArity` 定），
   不固定实现；新后端要按同一组语义重实现这套符号。

校验（不是文档约定；`Ir.Validate` 只在 build 路径跑，见「校验入口」）：

- `Ir.Validate.validateUnit` / `validateProgram`：IR 里每个符号必须已声明；`IrRtApp` 的实参个数必须
  等于 `irInlineArity`（违反即 `IC_InvariantViolated`）。
- `Lowering.Program.checkRuntimeContract`（挂在 `checkProgramOf`）：`Base.Intrinsics` ↔ 契约名字集
  相等 + 后端表对契约双向全覆盖。三处任一漂移都是内部错，不新增用户诊断码。
- `checks.ir-boundary`：方向由包依赖（`vuna-ir` 只依赖 base / compiler-base）保证；脚本只留形状断言——规则 6（`IrRuntime` / `IrBridge`
  不得复活）、规则 7（IR 数据模块的
  字面量只能是符号名，不含空格 / 括号）、规则 8（契约与后端表存在、`Lowering.Program` 用后端表做一致性
  检查）。

改动规则：新增内建要同步三处——`Base.Intrinsics`（语义）+ `Ir.Runtime`（契约名字 / 桥接标记）+
`Vuna.Target.Ocaml.Runtime`（OCaml 文本）。漏任一处会在下一次 `vuna check` 直接报内部错，不会静默
生成坏代码。

## 表示选择（`Vuna.Ir.Represent`）

去装箱族的**项形态**由单独的 pass 决定：`Lowering` 对它们只生成装箱形态（`IrCtor`、
`IrCase`），`representUnit` 再按 `IrShared.irSharedUnboxed`（族 → 构造子 + 字段号）与
`irSharedCtorShapes`（构造子 → 族 + keep flags）改写成「直接返回字段」/`IrLet`。
类型声明侧仍在 `Lowering.Ty`（字段类型与 arity 需要 Elab 的 telescope 信息），
因此这一步只动项、不碰声明；产物与 pass 之前逐字节一致。

## 运行时 kind（`Vuna.Ir.Kinds`）

IR 的类型槽是选择性填充的，因此「这条 binder / 这个值位置落在哪种机器表示」需要一层
显式判据。`Ir.Kinds` 是**唯一**的一份：

| 判据 | 入口 | 说明 |
| --- | --- | --- |
| 运行时类型 → kind | `irKindOfTy` | 走 `IrTy`；`IrTyData` 落在去装箱族时按保留字段继续递归 |
| 运行时符号 → 结果 kind | `irRtKind` / `irRtKindToValue` | 符号名只说「调什么」，这张表补「回什么」（契约缺的那一列） |
| 值位置 → kind | `irKindOfValue` | 读节点自带类型槽；`IrVar` 缺类型时回落到 binder 环境 |
| binder → kind | `irBinderKind` | 声明类型优先，缺类型时用绑定点的推断值 |
| case 分支 binder → kind | `irAltBinderKindFallback` | 按构造子字段类型（代入 scrutinee 的运行时类型实参） |

kind 是**目标中立**的：`KInt` / `KFloat` / `KBool` / `KStr` / `KRef`，加四个互不合并的
未知类——`KOpaque`（`IrTyOpaque`）、`KMissing`（类型槽缺失且推不出来）、`KVar`（类型参数
或结果随实参而定的符号）、`KSymbol`（符号没登记结果 kind）。合并它们会把「缺类型」误记成
「不可命名」，而 native 的换根集评估正需要这个区分。

`irKindIsScalar` 只认 `KInt` / `KBool`：**Float 不在其中**——native 把 Float 装箱在堆上，
wasm 用原始 `f64`，这是各后端的表示决策，不写进共享判据。native 侧由
`Target.Native.Repr` 的 `nClsOfKind` 把 kind 映成自己的槽分类（`KFloat` → `Ptr`），并把
「`IrRt sym` 作为值是 `.rodata` 静态闭包」这条 native 独有的事实留在 `nValueCls`。

消费方：native 的槽 kind 表（GC 栈图输入）、wasm 的 local 值类型选择、以及
`vuna dev ir dump --after repr|repr-cps` 的槽 kind 统计（[performance.md](performance.md)
「槽 kind 分布」）。


## 尾位置标记（`Vuna.Ir.Tail`）

`Ir.Tail` 是 CPS 之后的共享 pass，输出仍是同一个 `Ir`，只多一层注解：

- 规则：`IrDef` body、每个 `IrLam` body 是尾位置；`IrLet` body、`IrIf` 两支、
  `IrCase` / `IrNatCase` 各臂、`IrCast` 内层继承外层；实参、构造字段、record 字段、
  scrutinee、`IrConcatMany` parts 都不是。
- 标记只包调用形状：`IrApp` / `IrRtApp` / `IrRt` / 零参 `IrGlobal`。
- native / wasm 在 `cpsDefsMachine` 之后消费标记：native 发 `jmp` / `jmp r11`，
  wasm 发 `return_call` / `return_call $rt_apply`。native 的来参区不够、闭包慢路径、
  wasm 的非法目标仍回退普通调用。wasm 的函数体还保留 blanket tail（效应机器的合成
  lambda 依赖它）；`IrTail` 与这套函数体语义一致，不额外放宽。
- wasm 的零参定义在 `_start` 里内联求值，因此 `genDefInit` 用 `stripTail` 去掉该上下文
  的标记；codegen 合成的效应 thunk / eta wrapper body 不标记（标记只来自 IR 里的
  `IrLam`，避免在效应机器里把普通返回误发成 `return_call`）。
- `IrTail` 不是 `MkRestTail`：后者是续延 resume 的语义标记，`Ir.Tail` 不改写它。

## 分析与分组（`Vuna.Ir.Analysis`）

从 `Lowering.Checks` 的同一套算法原样沿用（Kosaraju：完成序 → 反向图收集 → 依赖就绪
排序），语义与顺序不变（分组顺序决定 `let` / `let rec ... and ...` 的落盘顺序）：

- `groupNames : List (Pair String (List String)) -> List String -> Check (List (List String))`
  —— 纯名字级分组；依赖里不属于本单元的名字被忽略。
- `assembleGroupNames` —— 同一个分组算法但在**生成体之前**跑（名字 + 「右值形状合法」
  回调），因为 fresh binder 编号是单元内全局递增的，生成顺序必须等于分组顺序。
- `groupNeedsRec` —— 单函数 SCC 且不引用自身 → `let`；自递归 / 互递归 → `let rec`。
- `assembleGroups` —— 按分组序列落成 `IrGroup`，并对递归组里零参定义的右值形状做
  护栏（`CG_RecursiveValueDefinition`；判据由 Lowering 放进 `irDefRecValueOk`）。
- `checkUniqueDefNames` —— 单元内定义名去重（IR 层按源码名，后端再按渲染名）。
- `reachableDefs` —— 从入口种子出发的依赖闭包（名字表一次建好、预算 = 种子数 + 依赖边数），
  按程序顺序返回；native / wasm 共用，不再各自实现线性可达性扫描。
- `checkGroupsCover` —— 分组必须覆盖全部名字：DFS 预算耗尽或分组异常时报内部错，不让定义
  静默缺席。

## 责任分界

| 决策 | 归属 |
| --- | --- |
| 只有运行时定义进 IR；类型级定义 / axiom 分区 | Lowering（复用 Core 侧分区与擦除检查） |
| 擦除（binder / 实参 / 分支 binder）、de Bruijn 槽位占位 | Lowering |
| Nat 链折叠、Nat case 降级 | Lowering（`IrInt` / `IrNatCase`） |
| record 表示 / 构造 / 投影 / 更新 / pattern | Lowering（决策） + 后端（record 语法文本） |
| 构造子实参对齐、不透明 cast | Lowering |
| 内建饱和内联、`++` 链展平 | Lowering 判定（`IrRtApp` / `IrConcatMany`），模板文本在后端 |
| 入口分类（动作 vs 值）、展示函数、handler 列表 | Lowering（`IrEntry`） |
| SCC 分组 | `Ir.Analysis`（Lowering 调用） |
| 尾位置判定（CPS 之后） | `Ir.Tail`（native / wasm 共享） |
| 尾调用发射 / 回退 | 后端（native `jmp`，wasm `return_call`） |
| 名字编码 / 保留字 / 跨单元限定 / fresh 编号前缀 | 后端 |
| 布局 / 括号 / `let rec` 文本 / 运行时模板 | 后端 |

## 校验入口

- `Ir.Validate.validateUnit` / `Ir.Validate.validateProgram`：定义名唯一 + 分组自洽（每个依赖只指向更早的组
  或同组，线性扫描，不重跑 SCC）+ 入口引用的 `main` 存在 + 运行时符号已声明且 arity 一致
  （见上节）。`vuna check` 不跑：它用 `lowerProgramOf` 得到的 IR 只做自检、随即丢弃。
  build 路径跑——split 经 `Lowering.Program.lowerUnitCheckedFrom` 逐单元一次（单元的定义
  / 数据由归属桶直接给出），后端插件经 `lowerProgramCheckedOf` 整程序一次。
- **类型形状**：`checkDefTy` 校验 `IrDef` 的运行时签名；`checkNodeBinderTys` 校验 λ binder
  注解、`IrLam` 结果、`IrCast` 源/目标、`IrApp` 函数/结果、`IrCase` scrutinee/结果、
  `IrCtor` 类型实参与值实参个数、record/projection/update 结果类型
  （`IrTyData` / 构造子族的实参个数按本单元声明核对）。`checkDefArityVsSig` 要求
  **运行时 arity ≤ 签名箭头数**（η-收缩的定义可以更少；签名不可命名时跳过）——
  它守「体里的运行时参数都在签名里」，trait 方法投影的字典参数正是靠这条不被漏掉。
  跨单元类型只做递归形状检查；这不是第二套精化器，只守 IR 的结构不变量。
- **作用域**：`checkScopedUnit` 逐节点检查每个 `IrVar` 指向语法作用域内的 binder，
  且擦除占位 binder 不得出现在变量位置（Lowering 的擦除判据漏一处就报内部错）；
  它把「well-scoped」从约定变成门禁。
- 擦除检查、作用域护栏、axiom 运行时护栏**仍在 Core 侧**（`Lowering.Checks`，由
  `Lowering.Program` 调用），因此诊断文本与顺序不变。

## 预算

- 后端没有固定步数预算：IR 上每个节点一次结构递归。
- Lowering 的预算按项规模派生（`lowerBudgetFor size = 8 * size + 512`，只防项本身有病），
  因此深层嵌套的单定义体（如 150 层嵌套应用）不会误报 `IC_FuelExhausted (codegen)`；
  字面量展开成本见 [debt.md](debt.md) D24。
- 回归夹具：`packages/compiler/test/corpus/dt_deep`（150 层嵌套应用），由
  `packages/compiler/test/steps/103_ir_lowering.steps`（深层项）与
  `packages/compiler/test/steps/104_ir_runtime_contract.steps`（符号 → 文本映射）以及
  `checks.ir-boundary` 一起守住。

## 已知边界 / 刻意未做

- IR 的类型信息仍是**选择性**的：λ binder、`IrLam` 结果、`IrDef` 签名、`IrCast` 两端、
  `IrCtor` 类型实参、`IrApp` 函数/结果、`IrCase` scrutinee/结果、分支 binder、record /
  projection / update 结果都已带类型槽；不可命名的部分落 `IrTyOpaque`，没有 IR 级类型检查器。
  `IrCast` 位点仍靠 Lowering 写对；结构化校验只查签名/注解/节点类型的形状、arity 与
  构造子实参数，不复刻精化器（见 [architecture-target.md](../architecture-target.md) 非目标）。
- **擦除后 Core 是 typed view**：`Lowering.Erased` 只把运行时位置的 `TVar` 下标
  归一化（只数运行时 binder），类型面（`TLam` 槽、`TApp` 的 `Rig0` 实参、`TCon`
  族参数、telescope）原样保留；Lowering 用 `runtimeBinderAt` 读运行时变量、
  用 `annotRunTyOf` / `annotRunCalleeTy` 读运行时项的类型，CPS 的 `isEffResultTy`
  因此仍有类型依据。擦除 binder / 类型实参**就是类型面**，有意保留；IR 侧
  `IrLam` 不再携带擦除占位，Lowering 的节点类型槽都填成 `Just`（未知落
  `IrTyOpaque`）。CPS 机器 pass 的节点类型是机器级（`Control` / 续延 / 步进），
  `IrTy` 无法命名，统一落 `IrTyOpaque`，不再清空；`Ir.Validate` 拒绝空的节点类型槽。
- binder 类型走**两种口径**：`annotTyOfTotal` 保留结构（`a -> b` 是 `Opaque -> Opaque`，
  不是整体未知），写入 `IrBinder`；OCaml 的 lambda 注解另由 `irTyAnnotatable` 过滤，
  **含 `IrTyOpaque` / 类型变量槽的类型不写进 OCaml**（那会固定多态性），因此 IR 侧信息
  变多不改变产物文本。顶层 λ 链优先用定义签名的域回填，再按 Core 的类型槽（`annotTyOfTotal`）。
- 填充顺序：分支体先按构造子字段类型回填分支 binder，再 lower；case 结果依次取
  「已降低节点的类型槽（`irResultTyOf`）→ Core 注解」，`IrLam` 结果在 Core 注记缺失时
  取体节点类型；因此嵌套 case / `let` / `if` / 应用体的结果能连续传递。
- `IrApp` 的类型在可解析出函数类型时填写：全局定义（含部分应用；擦除实参用来实例化定义
  签名）、trait 方法选择子（投影签名带运行时字典参数，字典按隐式实参实例化）、运行时原语
  （`lwGlobals` 的签名表）、局部 binder 的 `IrTyFun` 链；Core 侧解析不出时回退到
  **已降低 callee 的节点类型**（内联 lambda / `let` 脱糖出来的 lambda），域未记录时标成
  `IrTyOpaque`、结果类型保持精确。节点类型槽由 `Ir.Validate` 强制为非空；
  仍保持 `Nothing` 的是 `prim_erase` 的换型 cast（运行时类型确实不可命名）与
  binder 类型未记录的局部变量。
  `IrCase` 的 scrutinee/分支 binder 类型受字段/类型实参可解析性限制；wasm / native 的
  case 族优先用 `IrCase` 的 scrutinee 类型，缺失时回退到分支构造子名。
- CPS 的续延判定按 `IrLam` 结果类型（`Eff`）；handler clause 收集按 `IrDef` 签名
  （结果是 `Eff` 且参数是 `op -> k -> b` 形状），签名不可用时回退到 arity。
- IR 没有 fuel：需要「结构上限」的地方改成按项规模派生（与 `Core.termSize` 同思路）。
- IR 不做内容寻址：`Canonical.Ir` 不存在，节点集变化不需要迁移哈希。
- 现在有三个消费者：OCaml（全量参考实现）、wasm、native。两个产品后端覆盖白名单子集
  （Int/Nat/Bool + String + 用户 data/record/通用 case；见 [wasm.md](wasm.md)、
  [native.md](native.md)），对未实现的符号在编译期报 `WasmUnsupported` /
  `NativeUnsupported`，不做 trap 兜底。IR 的 target-neutral 性由三条守：
  `Ir.Runtime` 契约（符号面）+ `[layers]`（依赖方向：`Ir` 只依赖 `Base`）+
  `checks.ir-boundary`（IR 数据形状、`Ir/` 里没有目标文本、`IrRuntime`/`IrBridge` 不得复活）。
- 运行时实现（GC / 字符串 / I/O / 一次性续延）只有 OCaml 参考实现是完整的；wasm 与 native
  各自重实现了纯子集。

## 跨进程编码（`Vuna.Ir.Codec`）

后端插件是独立进程，IR 必须能落成字节再读回（协议见 [cli.md](cli.md)「后端插件协议」）：

- `encodeProgram : IrProgram -> String` / `decodeProgram : Int -> String -> Maybe IrProgram`
  （`encodeUnit` / `decodeUnit` 用于单单元载荷）；
- 编码复用 `Vuna.Compiler.Base.Bytes` 的原子文法（`#tag` / `i<n>;` / `s<len>:` / `[<n>:`），
  字段顺序固定；解码吃节点预算并拒绝尾随字节；
- 往返夹具在 `packages/ir/test/Codec.vuna`（全部构造子 + 单元 + 截断拒绝）；
- 诊断走 `Vuna.Compiler.Base.Diag.Codec`，与 IR 载荷分离：编译器只解码诊断，
  不把后端的目标文本读回来。
