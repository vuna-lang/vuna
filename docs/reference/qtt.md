# QTT：量词化类型论与线性数据

本文定义 vuna 的 quantity 体系（QTT 核心）与线性数据类型子集。`Rig` 三值
（0 / 1 / ω）由 binder 的 quantity 在精化期决定，同时是擦除表示与用量检查的依据。

实现入口：`Core/Term.vuna`（Rig 代数）、`Elab/Meta.vuna`（binder quantity → Rig 判定）、
`Elab/Usage.vuna`（用量检查）、`Elab/Driver.vuna`（在 `DtProgram` 组装前调用）、
`Codegen/Erase.vuna`（擦除防御）。语法与工具链入口见 `Frontend/{Ast,Lexer,Parser}`。

## 1. 语法

```vuna
-- 显式 quantity 前缀；不写 = ω
f : (0 n : Nat) -> (1 x : Int) -> Int
f n x = x

-- 线性数据类型/记录
linear record Ref r a where
  refSlot : IORef a

linear data Token : Type where
  MkToken : (1 h : Int) -> Token
```

- `(0 x : A)`：运行时零次使用；binder 整体擦除。
- `(1 x : A)`：运行时恰好一次。
- `(x : A)`：ω，运行时任意次（含 0 次），但**类型线性时自动取 1**。
- 隐式 binder `{x : A}` 与类型层域（`Type`/高阶 kind）恒为 0；写 `{1 ...}` 报错。
  例外：隐式 String 实例名（effect wrapper 的 `{n : String}`）按 `RigOmega` 保留（见
  [type-system.md](type-system.md) 证明与索引）；`Member n e r =>` 生成 `Rig0` 证明 binder。
- `linear data` / `linear record` 把族标记为线性；该族的值只能被 quantity 1 的 binder 绑定。

## 2. Rig 代数

`Rig = Rig0 | Rig1 | RigOmega`，三值格：

| 运算 | 规则 |
| --- | --- |
| `rigAdd`（同一变量多次出现/顺序组合） | `0+x=x`；`1+1=ω`；`ω+x=ω` |
| `rigScale`（按 binder quantity 放大一段用量） | `0·x=0`；`1·x=x`；`ω·0=0`；`ω·1=ω`；`ω·ω=ω` |
| `rigJoin`（分支合并） | `0∨0=0`；`1∨1=1`；`0∨1=ω`；`ω∨x=ω` |
| 精确检查 | declared 0 ⇒ 0；declared 1 ⇒ 1；ω ⇒ 任意 |

`Core/Term.vuna` 是唯一实现；其它模块不自己写三值分支。`rigIsErased` 仍是
「0 ⇒ 擦除」的唯一读取入口。

## 3. binder quantity 判定

在 `Elab/Meta` 集中实现：`rigOfQty` 是「源码 quantity → `Rig`」的唯一映射，`binderRig`
是未带标注时的默认入口（隐式 / 类型层域 ⇒ 0，显式未标注 ⇒ ω）。所有 binder 构造点
（`inferPi`、`checkLam`、`checkBinders`、`inferArgsGo`、`TCon` 构造、case 分支、
记录投影、eta、`let`）都走同一入口：

1. 隐式或类型层域 ⇒ 0；显式非 0 标注报 `TC_MultiplicityImplicit` /
   `TC_MultiplicityTypeDomain`。
2. 域是线性类型 ⇒ 1；显式 0/ω 报 `TC_LinearTypeNeedsOne`。
3. 其它 ⇒ 标注 0/1；未标注 ω。
4. `let` binder：值类型线性 ⇒ 1，否则 ω。

线性值传给非 1 形参报 `TC_LinearValueNeedsLinearBinder`；顶层定义本身是线性类型报
`TC_LinearTopLevel`（全局值可被任意复制）。

## 4. 用量判断

精化完成后、组装 `DtProgram` 之前，对每个**运行时** `DtDef` 的 body 做一次结构遍历
（类型层定义跳过；入口在 `Elab/Driver`，实现在 `Elab/Usage`）：

- 变量出现 1 次；`TPi`/类型位置不产生运行时用量；`TApp`/`TCon` 的实参用量按该实参的
  Rig `rigScale`；case 的 scrutinee 一次，分支外层用量 `rigJoin`，分支 binder 各自精确检查。
- λ 不额外放大外层用量（闭包复制由 let/application 的实参 scaling 负责）；但捕获线性值的
  λ 有额外逃逸规则（§6）。
- `TInt/TStr/TBool/TGlobal/TType/TMeta` 为 0；`TMeta` 在运行时位置不应残留。

错误：`TC_LinearUnused`（1 未用）、`TC_LinearOverused`（1 用多于一次）、
`TC_ErasedBinderUsed`（0 在运行时使用）。

## 5. 线性数据类型

- `linear data` / `linear record` 的族名进入 `DtData.dtDataLinear`；`isLinearType` 查头，
  只看族头；不通过类型实参传播（避免把 `Eff [] (Ref r a)` 误判为线性）。
- 线性值不能进泛型容器（`Maybe Ref` 构造时字段 binder 是 ω，被 application-site 检查拒绝）；
  需要时使用专用线性记录。
- 线性值的 case：`_` 丢弃因分支 binder 用量为 0 报 `TC_LinearUnused`；as-pattern 别名
  暂未单独区分（同样会落成未用/多次用）。变量模式正常绑定。
- 线性箭头 binder `(1 x : A) -> B` 是既有语法：`x` 在体内恰好用一次。它**不是**
  「函数值本身线性」的箭头类型；要让一个闭包只能被消费一次，用 `Base.Eff.Cont`
  （见 §6）。
- 本阶段**没有**依赖 multiplicity / multiplicity 多态；线性多态与泛型容器归后续（debt）。

## 6. 线性捕获与一次性闭包（已实现）

捕获线性值（线性数据类型）的 λ 是一个「线性闭包」：闭包被复制就等于复制它捕获的线性
值。因此它只能被**立即按 quantity 1 消费**：

- 作为应用函数位置（`(λ… ) a`，β 立即发生，闭包用一次）；
- 作为应用实参、且该位置的 multiplicity 是 `1`；
- 作为**线性数据**构造子的字段、且字段 multiplicity 是 `1`（例如 `Cont` 的
  `(1 k : a -> b)`）。

其它位置（定义体返回值、rig-ω 实参/字段、`if`/`case` 的普通位置）报
`TC_LinearCaptureEscapes`。

实现分两段（两处都在编译器源码里，改一处必须同步另一处）：

- `Elab/Term/Impl.checkLam`：捕获线性值的 λ 不再当场报错，而是给 binder 名打
  `#linclos…` 私有标记（`Elab/Meta.linClosureName`；`#` 不是源码标识符字符、codegen
  会 sanitize，用户不可见；名字里编入 span 与 ctx 深度以保证嵌套 λ 不撞名）；
- `Elab/Usage.checkDefCapture`：沿项结构检查标记 λ 的位置，只有上面三种「立即消费」
  放行；构造子字段还要求族本身是 `linear data`（否则族值可复制，一次性承诺不可靠）。

配套的库 API（`Base.Eff`）：`Cont a b` 是线性数据包装的**一次性闭包**
（`(1 k : a -> b)` 字段）；`mkCont : (1 k : a -> b) -> Cont a b` 装入，
`resumeCont : (1 c : Cont a b) -> a -> b` 消费一次。handler 续延 API
（`handleCoreLin`）就是用它表达 resume-once。

示例（`dt_base/39_eff_linear_fn`）：

```vuna
mkContI : (1 k : Int -> Int) -> Cont Int Int
mkContI k = mkCont k

mk : (1 t : Token) -> Cont Int Int
mk t = mkContI (\x => useToken t + x)   -- 捕获 t；rig-1 实参位置 → 允许
```

因此线性函数请写成单参数/线性记录风格；curried 多参数线性函数与「函数值线性」的
通用箭头类型在本阶段不支持。case 分支体是 λ 且结果类型未定时，精化器会合成
`ω` 的 Pi 元变量求解（B32）；合成的 binder multiplicity 固定为 ω，线性函数值仍受
上面的限制。

## 7. 擦除

- 0 binder 的 λ 形参、应用实参、构造子字段、case binder 都不进入运行时表示；1/ω 保留。
- codegen 的 `rigIsErased` 是唯一读取点；`Codegen/Erase` 的运行时使用检查保留为第二道
  防御。`(0 p : Int)` 在生成的 OCaml 中不应出现对应参数。
- `TPi` 类型层项不参与用量；把值类型写成 0 现在是显式、可检查的擦除手段（索引擦除
  诊断仍保留为提示）。

## 8. linear record 与线性子集

`linear record` / `linear data` 语法与 QTT 规则保留；当前 base 里有 `linear data Cont`
（一次性续延）与 `linear data TaskLin`（调度器线性任务）两个用例，没有库级线性 record
用例（`Base.ST` 已随未使用代码清理删除，重建约束见 [debt.md](debt.md)）。

## 9. 边界

- 无依赖 multiplicity、multiplicity 变量/多态：`Rig` 仍只有 `0 / 1 / ω` 三值，签名里
  写不出 multiplicity 变量（`(p : Qty) -> …` 不可写）。探针：`test/corpus/dt/80_qtt_usage`
  只覆盖三值；多态 multiplicity 需要 `Rig` 变成项层/类型层数据 + 依赖 Pi，属后续。
- 无「函数值线性」的通用箭头类型与借用（`&`）、region 推断；一次性闭包只有
  `Base.Eff.Cont` 这一种库级包装（`mkCont`/`resumeCont`），不是语言级箭头。
  线性箭头 binder `(1 x : A) -> B` 本身可用（§1）。
- 捕获规则是**保守近似**：只会出现「该放行的被拒」，不会出现「该拒的被放行」；
  嵌套/curried 线性闭包、`if`/`case` 里的捕获一律拒绝。
- 用量检查把 let 的 RHS 按单次求值计（应用 rig=1），线性值经 let 传递不再误报；
  但推断位置把线性值传给通用运算符/trait 方法仍被拒（形参默认 ω；期望类型触发
  `bi_add` 等特化才通过），见 debt D22（multiplicity 多态）。
- 线性世界令牌未做（per-module `unsafe` 门控已随 manifest 机制删除，D28 关闭）。
- 运行时不做所有权检查；线性是静态纪律（线性值仍可经非线性 data 的字段被复制，
  见 D42）。

## 10. 与其它文档

- 类型系统与擦除：[type-system.md](type-system.md)
- Core 表示/NbE：[core.md](core.md)
- 效应：[effects.md](effects.md)
- 未关闭的债务：[debt.md](debt.md)