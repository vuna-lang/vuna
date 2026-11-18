# IR 参考：擦除后的中间表示与运行时契约

本文描述三层：`Vuna.Compiler.Ir.*`（IR 数据定义、纯分析与校验）、`Vuna.Compiler.Ir.Runtime`
（IR ↔ 运行时**契约**）与 `Vuna.Compiler.Lowering.Program`（Core → IR 的唯一入口）、
`Vuna.Compiler.Codegen.Runtime`（契约的 OCaml 实现）。

子系统位置见 [architecture.md](../architecture.md)，
终态方向与「为什么先做 IR」见 [architecture-target.md](../architecture-target.md)
（门禁表），codegen 输出模型见 [compiler.md](compiler.md)。

## 位置与形状

```text
Loader → Elab → Core ──Lowering──> IR ──Codegen.{Decl,Term,Assembly}──> OCaml 文本
                          │
                          └── Ir.Runtime：运行时符号契约（符号名 + 桥接标记）
                              Codegen.Runtime：符号 → OCaml 运行时表达式
```

- **IR 是后端唯一的输入面**：OCaml 后端不 import `Core` / `Elab` / `Intrinsics`，
  因此「后端要理解类型论」这个耦合被切断；wasm / native 只对接 IR。
  native 的支持面、ABI 与运行时子集见 [native.md](native.md)。
- **Lowering 是 Core 唯一的消费者**：擦除、表示决策、入口分类都发生在这一步，
  后端只做文本（名字编码、跨单元限定、fresh 名字、布局、`let rec` 分组、运行时模板）。
- **ANF（wasm 前置）**：`Ir.Anf` 把每条非简单表达式绑定到 `let`，binder 用单调
  `next` 编号（不是路径深度）；它保持求值顺序与作用域，给效应 thunk 的 CPS/Step 变换提供
  一阶输入。wasm 在 codegen 前跑一次 ANF。
- **CPS lowering（wasm）**：`Ir.Cps` 是 `Ir -> Ir` 的后端内变换（不改变 Lowering 产物）：
  只把 `MkEff` / `MkScoped` / `IrEffThunk` 的 thunk 改成显式 `k`，并把
  `prim_effect*` 换成 `@ir@cps@*`。纯代码与调用约定不变；详见
  [wasm-effects.md](wasm-effects.md)。
- 门禁：IR 路径的产物逐字节确定，且与
  [architecture-target.md](../architecture-target.md) 门禁表里的差分口径一致。

## 三条硬边界

| 边界 | 规则 | 守护 |
| --- | --- | --- |
| 依赖方向 | `Ir.*` 只允许依赖 `Base.*`：方向由 `compiler/vuna.toml` 的 `[layers]` 声明、loader 在 import 时强制（`"Vuna.Compiler.Ir" = ["Vuna.Compiler.Base"]`，见 [packages.md](packages.md)「层约束」）。`Codegen/` 整目录只吃 IR；上游的唯一消费者是 `Lowering.Program`（Core → IR）与 `Lowering.Checks`（Core 侧检查）。声明归属切分与分文件装配在 `Driver.SplitGen`（Driver 层，允许 import `Elab` 的声明表，但必须路由到 `Lowering.Program`、不得自己消费 `Core` / `Intrinsics`） | `[layers]`（方向）+ `checks.ir-boundary`（正向断言与 IR 形状） |
| 名字 | IR 节点里只有**源码名**与**契约里的运行时符号**（`IrRt` / `IrRtApp`；节点里没有目标文本）；`v_` / `t_` / `C_` / `f_` 前缀、转义、`Unit.` 限定、运行时表达式都属于后端 | 同上 + review |
| 数据 | IR 只有确定性纯数据（`String` / `Int` / `Bool` / `List` / `Pair` / `Maybe` / `Span`）：不含闭包、`HashMap`、`Value`、`Term` | `Ir.Model` 的 import 面 + `[layers]` |

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
| `IrRt sym` | 运行时符号引用 | 符号必须在 `Ir.Runtime` 契约里；目标文本由后端映射（不记依赖） |
| `IrRtApp sym args` | 运行时符号的饱和应用 | 内建名 + 实参；OCaml 运算符模板在后端；arity 由 `irInlineArity` 定 |
| `IrCast ir` | 表现层转换 | 表示改变、运行时不产生操作；后端渲染成自己的转换形式 |
| `IrInt` / `IrStr` / `IrBool` / `IrFloatLit` | 字面量 | `IrInt` 也承载折叠后的 Nat 字面量；`IrStr` 未转义 |
| `IrLet binders e body` | `let` | unboxed case 降级用；binder 表是完整 telescope（含擦除占位） |
| `IrLam binders body` | lambda 链 | 擦除 binder 占位不渲染；无运行时 binder 时退化成体 |
| `IrApp f a` | 应用 | 擦除实参已丢弃 |
| `IrIf c t e` | `if` | |
| `IrCase scrut alts` | 通用 `match` | 无 catch-all 时后端补不可达兜底臂 |
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
- `IrShared`：record 运行时字段表、canonical List 族、`usesFloat` / `usesTrace` /
  `usesObs`、定义位置行。它只承载**后端渲染要消费**的表示决策结果；构造子形状、去装箱
  集合、类型参数槽是 Lowering 内部的查表输入，不进 IR。

## 运行时契约（`Vuna.Compiler.Ir.Runtime`）

**IR 里没有目标文本**：`IrRt sym` / `IrRtApp sym args` 只引用符号名，符号必须在本契约里
声明；OCaml 表达式在 `Vuna.Compiler.Codegen.Runtime`（后端表）。这是「一份 IR 驱动所有
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
   限定并把该单元记成直接依赖（机制在 `Codegen.Term.genBridgeRef`）。非 OCaml 后端要在
   自己的对象表示上重建这套 helper（native 侧的设计约束见
   [native.md](native.md) §9——桥接是对象表示落地后的验收目标，不是独立切片）。
3. **语义参考实现**：运行时库本身（`bi_*` / `dt_*` / `dtp_*` 的定义）仍是 `Codegen.Term`
   的 runtime 模板。契约只固定「符号面」（名字 + 桥接标记；arity 由 `irInlineArity` 定），
   不固定实现；新后端要按同一组语义重实现这套符号。

校验（都在 check/build 路径上，不是文档约定）：

- `Ir.Validate.validateUnit` / `validateProgram`：IR 里每个符号必须已声明；`IrRtApp` 的实参个数必须
  等于 `irInlineArity`（违反即 `IC_InvariantViolated`）。
- `Lowering.Program.checkRuntimeContract`（挂在 `checkProgramOf`）：`Base.Intrinsics` ↔ 契约名字集
  相等 + 后端表对契约双向全覆盖。三处任一漂移都是内部错，不新增用户诊断码。
- `checks.ir-boundary`：方向交给 `[layers]`；脚本只留形状断言——规则 6（`IrRuntime` / `IrBridge`
  不得复活）、规则 7（IR 数据模块的
  字面量只能是符号名，不含空格 / 括号）、规则 8（契约与后端表存在、`Lowering.Program` 用后端表做一致性
  检查）。

改动规则：新增内建要同步三处——`Base.Intrinsics`（语义）+ `Ir.Runtime`（契约名字 / 桥接标记）+
`Codegen.Runtime`（OCaml 文本）。漏任一处会在下一次 `vuna check` 直接报内部错，不会静默
生成坏代码。

## 分析与分组（`Vuna.Compiler.Ir.Analysis`）

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
| 名字编码 / 保留字 / 跨单元限定 / fresh 编号前缀 | 后端 |
| 布局 / 括号 / `let rec` 文本 / 运行时模板 | 后端 |

## 校验入口

- `Ir.Validate.validateUnit` / `Ir.Validate.validateProgram`：定义名唯一 + 分组自洽（每个依赖只指向更早的组
  或同组，线性扫描，不重跑 SCC）+ 入口引用的 `main` 存在 + 运行时符号已声明且 arity 一致
  （见上节）。check 路径在 `lowerProgramOf` 末尾跑，split 路径经
  `Lowering.Program.lowerUnitChecked` 逐单元跑一次。
- 擦除检查、作用域护栏、axiom 运行时护栏**仍在 Core 侧**（`Lowering.Checks`，由
  `Lowering.Program` 调用），因此诊断文本与顺序不变。

## 预算

- 后端没有固定步数预算：IR 上每个节点一次结构递归。
- Lowering 的预算按项规模派生（`lowerBudgetFor size = 8 * size + 512`，只防项本身有病），
  因此深层嵌套的单定义体（如 150 层嵌套应用）不会误报 `IC_FuelExhausted (codegen)`；
  字面量展开成本见 [debt.md](debt.md) D24。
- 回归夹具：`test/corpus/dt_deep`（150 层嵌套应用），由
  `test/suite/steps/103_ir_lowering.steps`（深层项）与
  `test/suite/steps/104_ir_runtime_contract.steps`（符号 → 文本映射）以及
  `checks.ir-boundary` 一起守住。

## 已知边界 / 刻意未做

- IR 没有类型标注、没有类型检查器：它承载的是**已验证**的运行时形状。
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
