# IR 参考：擦除后的中间表示（Track A 第一步）

本文描述 `Vuna.Compiler.Ir.*`（IR 的数据定义与纯分析）与 `Vuna.Compiler.Codegen.Lower`
（Core → IR 的唯一入口）构成的这一层。子系统位置见 [architecture.md](../architecture.md)，
终态方向与「为什么先做 IR」见 [architecture-target.md](../architecture-target.md)
（轨道 A / 门禁表），codegen 输出模型见 [compiler.md](compiler.md)。

## 位置与形状

```text
Loader → Elab → Core ──Lower──> IR ──Codegen.{Decl,Term,Assembly,Split}──> OCaml 文本
```

- **IR 是后端唯一的输入面**：OCaml 后端不再 import `Core` / `Elab` / `Intrinsics`，
  因此「后端要理解类型论」这个耦合被切断；wasm / native 后端将来只对接 IR。
- **Lowering 是 Core 唯一的消费者**：擦除、表示决策、入口分类都发生在这一步，
  后端只做文本（名字编码、跨单元限定、fresh 名字、布局、`let rec` 分组、运行时模板）。
- 门禁：`OCaml-via-IR` 的产物与迁移前直连 Core 的产物**逐字节一致**
  （[architecture-target.md](../architecture-target.md) 的门禁表）。

## 三条硬边界

| 边界 | 规则 | 守护 |
| --- | --- | --- |
| 依赖方向 | `Ir*` 不 import `Core` / `Elab` / `Intrinsics` / `Codegen`；文本生成层（`Codegen` 门面与 `Decl`/`Term`/`Assembly`）不 import `Core` / `Elab` / `Intrinsics`，唯一的上游消费者是 `Codegen/Lower.vuna`。`Codegen/Split.vuna` 按声明归属切分，因此允许 import `Elab`（`DtProgram`/`DtDef`/`DtData` 是切分单位），但 `Core` / `Intrinsics` 一律不许，且必须路由到 `Codegen.Lower` | `checks.ir-boundary`（`nix/checks/ir-boundary.sh`） |
| 名字 | IR 节点里只有**源码名**与已确定的运行时符号（`IrRuntime` / `IrBridge`）；`v_` / `t_` / `C_` / `f_` 前缀、转义、`Unit.` 限定都属于后端 | 同上 + review |
| 数据 | IR 只有确定性纯数据（`String` / `Int` / `Bool` / `List` / `Pair` / `Maybe` / `Span`）：不含闭包、`HashMap`、`Value`、`Term` | `Ir.Model` 的 import 面 |

## 数据模型（`Vuna.Compiler.Ir.Model`）

### 节点 `Ir`

只保留运行时形状；被擦除的实参不产生节点。

| 节点 | 含义 | 备注 |
| --- | --- | --- |
| `IrVar binder` | 运行时 binder 引用 | 携带 binder **身份**（Lowering 已解析 de Bruijn 下标）；擦除 binder 不进 IR |
| `IrGlobal name` | 顶层运行时定义引用 | 跨单元限定时由后端加前缀并记依赖 |
| `IrCtor family ctor args` | 构造子应用 | 实参已按 keep 形状对齐；不可命名字段已包 `IrCast` |
| `IrRecord family fields` | record 构造 | `(源码字段名, 值)`，按运行时字段顺序 |
| `IrProj base family field` | record 投影 | 非 record 族的投影由 Lowering 降成 `IrCase` |
| `IrRecUpd base family fields` | record 更新 | 只含被改字段 |
| `IrRuntime text` | 运行时符号 / 表达式 | 如 `bi_add`、`string_of_int`、`Obj.magic`；原样输出、不记依赖 |
| `IrBridge text` | List 桥接 runtime 文本 | `dtp_unpack` 等；helper 名要按 List 族归属单元限定 |
| `IrCast ir` | 表现层转换 | `Obj.magic` |
| `IrInt` / `IrStr` / `IrBool` / `IrFloatLit` | 字面量 | `IrInt` 也承载折叠后的 Nat 字面量；`IrStr` 未转义 |
| `IrLet binders e body` | `let` | unboxed case 降级用；binder 表是完整 telescope（含擦除占位） |
| `IrLam binders body` | lambda 链 | 擦除 binder 占位不渲染；无运行时 binder 时退化成体 |
| `IrApp f a` | 应用 | 擦除实参已丢弃 |
| `IrIf c t e` | `if` | |
| `IrCase scrut alts` | 通用 `match` | 无 catch-all 时后端补不可达兜底臂 |
| `IrNatCase scrut fresh zero succ catch` | Nat case 降级 | Nat 运行时是 `int`，不能生成变体 match；`fresh` 是 `dtnat__<n>` 的编号 |
| `IrInline name args` | 内建饱和应用 | OCaml 运算符模板表在后端 |
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

`irBinderErased = True` 只占 de Bruijn 槽位、不进 pattern / 参数表。

### 类型表面 `IrTy`

签名级运行时类型：`IrTyVar i`（族参数槽）、`IrTyInt` / `IrTyStr` / `IrTyBool` /
`IrTyFloat`、`IrTyOpaque`（`Obj.t`）、`IrTyArray` / `IrTyRef`（内建类型构造子）、
`IrTyData name args`（程序数据族）、`IrTyFun dom cod`（显式函数；隐式 Pi 已剥掉）。
隐式 Pi / 索引 / telescope 在 Lowering 消解，不进 IR。

### 声明、定义与单元

- `IrTyDecl`：`IrVariantDecl`（变体族）/ `IrRecordDecl`（OCaml record）/ `IrUnboxedDecl`
  （去装箱别名）。参数槽分配、不透明字段、record 字段表都在 Lowering 定好。
- `IrDef`：`IrDef name arity deps body recOk initGuard span`（运行时定义）或
  `IrExternDef name ty cSym span`（受限 FFI）。`irDefDeps` 是运行时引用到的顶层定义
  （Core 遍历顺序的去重表），SCC 分组吃它。
- `IrGroup`：`irGroupIsRec` + 成员（SCC 序）。
- `IrUnit`：类型声明 + 分组 + `hasListFamily` + `typeRefs` + 可选 `IrEntry`。
- `IrProgram`：`IrShared` + 一个 `IrUnit`（check 路径的整程序装配）。
- `IrShared`：record 运行时字段表、canonical List 族、`usesFloat` / `usesTrace`、
  构造子 → (族, keep flags)、构造子 → 不透明 flags、去装箱族集合、族 → 类型参数槽、
  定义位置行。它原来是后端 `GenSt` 的程序级表，是「表示决策的结果」，所以搬进 IR。

## 分析与分组（`Vuna.Compiler.Ir.Analysis`）

从迁移前的 `Codegen.Erase` 原样搬来（Kosaraju：完成序 → 反向图收集 → 依赖就绪排序），
语义与顺序保持不变（分组顺序决定 `let` / `let rec ... and ...` 的落盘顺序）：

- `groupNames : List (Pair String (List String)) -> List String -> Check (List (List String))`
  —— 纯名字级分组；依赖里不属于本单元的名字被忽略。
- `assembleGroupNames` —— 同一个分组算法但在**生成体之前**跑（名字 + 「右值形状合法」
  回调），因为 fresh binder 编号是单元内全局递增的，生成顺序必须等于分组顺序。
- `groupNeedsRec` —— 单函数 SCC 且不引用自身 → `let`；自递归 / 互递归 → `let rec`。
- `assembleGroups` —— 按分组序列落成 `IrGroup`，并对递归组里零参定义的右值形状做
  护栏（`CG_RecursiveValueDefinition`；判据由 Lowering 放进 `irDefRecValueOk`）。
- `checkUniqueDefNames` —— 单元内定义名去重（IR 层按源码名，后端再按渲染名）。

## 责任分界（D-A6）

| 决策 | 归属 |
| --- | --- |
| 只有运行时定义进 IR；类型级定义 / axiom 分区 | Lowering（复用 Core 侧分区与擦除检查） |
| 擦除（binder / 实参 / 分支 binder）、de Bruijn 槽位占位 | Lowering |
| Nat 链折叠、Nat case 降级 | Lowering（`IrInt` / `IrNatCase`） |
| record 表示 / 构造 / 投影 / 更新 / pattern | Lowering（决策） + 后端（record 语法文本） |
| 构造子实参对齐、不透明 cast | Lowering |
| 内建饱和内联、`++` 链展平 | Lowering 判定（`IrInline` / `IrConcatMany`），模板文本在后端 |
| 入口分类（动作 vs 值）、展示函数、handler 列表 | Lowering（`IrEntry`） |
| SCC 分组 | `Ir.Analysis`（Lowering 调用） |
| 名字编码 / 保留字 / 跨单元限定 / fresh 编号前缀 | 后端 |
| 布局 / 括号 / `let rec` 文本 / 运行时模板 | 后端 |

## 校验入口

- `Ir.validateUnit` / `Ir.validateProgram`：定义名唯一 + 分组可完成（成环报
  `CG_DependencyCycle`）+ 入口引用的 `main` 存在。
- 擦除检查、作用域护栏、axiom 运行时护栏**仍在 Core 侧**（`Codegen.Erase`，由 Lowering
  调用），保证诊断文本与顺序不变（D-A9）。

## 固定 fuel 的退场

迁移前后端用固定 512 步的 `genTermFuel` 驱动「项 → 文本」，深层嵌套的单定义体（约
128 层嵌套应用）会误报 `IC_FuelExhausted (codegen)` 而没有真实问题（[debt.md](debt.md)
D24 的另一半）。IR 之后**后端没有预算**（每个节点一次结构递归），Lowering 的预算按项规模
派生（`lowerBudgetFor size = 8 * size + 512`，只防项本身有病），这条误报路径随之消失。

回归夹具：`test/corpus/dt_deep`（150 层嵌套应用）。它在旧路径上必失败、在新路径上必须
通过；由 `test/suite/steps/103_ir_lowering.steps` 与 `checks.ir-boundary` 一起守住。

## 已知边界 / 刻意未做

- IR 没有类型标注、没有类型检查器：它承载的是**已验证**的运行时形状（D-A5）。
- IR 没有 fuel：需要「结构上限」的地方改成按项规模派生（与 `Core.termSize` 同思路）。
- IR 尚未内容寻址（`Canonical.Ir`）：等节点集稳定后再做，避免每次加节点都要迁移哈希。
- 只有 OCaml 一个消费者；wasm / native 是后续轨道，IR 的 target-neutral 性由
  `checks.ir-boundary`（不许 import 上游、不许在后端出现 Core 类型）与「节点里没有
  OCaml 名字」两条守住。
