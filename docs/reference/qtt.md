# QTT：量词化类型论与线性数据

本文定义 vuna 的 quantity 体系（QTT 核心）与线性数据类型子集。它取代旧文档中
「擦除只按域判、不做整程序使用分析」的口径；旧的 `Rig` 三值预留在这里成为真正的
语义，而不是 codegen 的表示层标记。

实现入口：`Core/Term.vuna`（Rig 代数）、`Elab/Meta.vuna`（binder 用量判定）、
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

在 `Elab/Meta` 集中实现，所有 binder 构造点（`inferPi`、`checkLam`、`checkBinders`、
`inferArgsGo`、`TCon` 构造、case 分支、记录投影、eta、`let`）都走同一入口：

1. 隐式或类型层域 ⇒ 0；显式非 0 标注报 `TC_MultiplicityImplicit` /
   `TC_MultiplicityTypeDomain`。
2. 域是线性类型 ⇒ 1；显式 0/ω 报 `TC_LinearTypeNeedsOne`。
3. 其它 ⇒ 标注 0/1；未标注 ω。
4. `let` binder：值类型线性 ⇒ 1，否则 ω。

线性值传给非 1 形参报 `TC_LinearValueNeedsLinearBinder`；顶层定义本身是线性类型报
`TC_LinearTopLevel`（全局值可被任意复制）。

## 4. 用量判断

对每个**运行时** `DtDef` 的 body 做一次结构遍历（类型层定义跳过）：

- 变量出现 1 次；`TPi`/类型位置不产生运行时用量；`TApp`/`TCon` 的实参用量按该实参的
  Rig `rigScale`；case 的 scrutinee 一次，分支外层用量 `rigJoin`，分支 binder 各自精确检查。
- λ 不额外放大外层用量（闭包复制由 let/application 的实参 scaling 负责）；但捕获线性值的
  λ 有额外逃逸规则（§6）。
- `TInt/TStr/TBool/TGlobal/TType/TMeta` 为 0；`TMeta` 在运行时位置不应残留。

错误：`TC_LinearUnused`（1 未用）、`TC_LinearOverused`（1 用多于一次）、
`TC_ErasedBinderUsed`（0 在运行时使用）。

## 5. 线性数据类型

- `linear data` / `linear record` 的族名进入 `DtData.dtDataLinear`；`isLinearType` 查头，
  只看族头；不通过类型实参传播（避免把 `IO (Ref r a)` 误判为线性）。
- 线性值不能进泛型容器（`Maybe Ref` 构造时字段 binder 是 ω，被 application-site 检查拒绝）；
  需要时使用专用线性记录。
- 线性值的 case：`_` 丢弃因分支 binder 用量为 0 报 `TC_LinearUnused`；as-pattern 别名
  暂未单独区分（同样会落成未用/多次用）。变量模式正常绑定。
- 本阶段**没有**依赖 multiplicity / multiplicity 多态 / 线性箭头；线性多态与泛型容器
  归后续（debt）。

## 6. 线性捕获（本阶段的健全性边界）

捕获线性 binder 的 λ 只能被**立即消费**：

- 作为函数位置被应用、作为 quantity 1 的实参传入、或放进 quantity 1 的字段；
- 不能从函数返回、不能绑定到 ω binder、不能进 ω 字段。

实现上由 `Usage` 的「捕获标记」承担：`TApp` 函数位置清除标记，实参按 Rig 缩放/消费；
`TCon` 实参同理；顶层仍有标记则 `TC_LinearCaptureEscapes`。

因此线性函数请写成单参数/线性记录风格；curried 多参数线性函数在本阶段不支持。

## 7. 擦除

- 0 binder 的 λ 形参、应用实参、构造子字段、case binder 都不进入运行时表示；1/ω 保留。
- codegen 的 `rigIsErased` 是唯一读取点；`Codegen/Erase` 的运行时使用检查保留为第二道
  防御。`(0 p : Int)` 在生成的 OCaml 中不应出现对应参数。
- `TPi` 类型层项不参与用量；把值类型写成 0 现在是显式、可检查的擦除手段（旧 M16 的
  索引擦除诊断仍保留为提示）。

## 8. 线性 ST 子集

`Base.ST` 的 `Ref`、`SArray` 是线性记录（`ST` 动作本身沿用 IO 的可复制语义）：

- `newRef`/`newArray` 返回线性 action/value；
- `readRef`/`writeRef` 等按“消费并返回”的线程化风格（返回值放在线性结果记录里，例如
  `RefPair`/`RefWrite`），避免 curried λ 捕获句柄；
- `bindST1` 供线性结果穿过 continuation（continuation 的参数 binder 为 1）；`runST` 执行一次；
- 低层 `IORef`/`MArray`/`Buffer` 仍是非线性内建，但字段不导出，只能经线性包装使用。

## 9. 边界

- 无依赖 multiplicity、multiplicity 变量/多态。
- 无线性箭头/线性闭包类型；无借用（`&`）、region 推断、一次性续延。
- 线性 IO 世界令牌 / per-module `unsafe` 未做（debt D28）。
- 运行时不做所有权检查；线性是静态纪律。

## 10. 与其它文档

- 类型系统与擦除：[type-system.md](type-system.md)
- Core 表示/NbE：[core.md](core.md)
- 效应与 ST：[effects.md](effects.md)
- 已知边界：[limits.md](limits.md)、[debt.md](debt.md)