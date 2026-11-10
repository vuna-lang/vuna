# Core TT、NbE 与精化器实现

本文是编译器内部实现参考：Core 类型论的表示、NbE / 定义性相等、双向精化器的规则、
擦除与 case 可达性的实现，以及 codegen 侧的护栏。**用户可见的类型规则**见
[type-system.md](type-system.md)（quantity/线性见 [qtt.md](qtt.md)）；模块职责与输出模型见
[compiler.md](compiler.md)。

## 1. Core 表示

`Vuna.Compiler.Core.Term` 是表示层的唯一真源：

```vuna
data Term where
  TVar    : String -> Int -> Term          -- 名字（显示用）+ de Bruijn index
  TMeta   : Int -> Term
  TGlobal : String -> Term
  TType   : Level -> Term
  TPi     : String -> Bool -> Rig -> Term -> Term -> Term
  TLam    : String -> Rig -> Term -> Term
  TApp    : Term -> Term -> Rig -> Term
  TCon    : String -> List (Pair Term Rig) -> Term   -- 构造子应用（实参自携 Rig）
  TCase   : Term -> List CaseAlt -> Term
  TInt / TStr / TBool / TIf
```

- `CaseAlt` 是「构造子名 + 绑定子（名字 / `Rig`）+ 体」；`VCaseAlt` 把体换成闭包。
- 值：`VType` / `VPi` / `VLam`（闭包）/ `VNeutral` / `VMeta` / `VCon` / `VCase` /
  `VApp`（卡住的应用，禁止静默丢实参）/ 字面量 / `VIf`；neutral 头是
  `NVar name level spine` 或 `NGlobal name spine`。
- `Rig` 是三值格子（`Rig0` / `Rig1` / `RigOmega`），三值都由精化器产生（显式未标注
  binder 默认 ω）；组合走 `Core.Term` 的 `rigAdd` / `rigScale` / `rigJoin`（唯一实现，
  规则见 [qtt.md](qtt.md) §2）。**读取判据只有 `rigIsErased`**，默认构造入口是
  `rigOfBinder`（带源码 quantity 的路径走精化器的 `rigForPi`），`Core` 之外不得模式匹配
  `Rig`。
- `Level` 不透明：内部是 `Level Int`（字段 `levelToInt`），外部只能经 `levelZero` / `levelSucc` /
  `levelMax` / `levelToInt` / `levelEq` / `levelLt` 访问，不得自行做 Int 算术。
- `Sols` 携带解表（list 权威 + 哈希索引）、元变量创建深度索引与定义值缓存
  （`defVals`）；缓存是可重建的，未命中回落 `force` 的 delta 展开，不影响语义。`Ec.deftbl`
  的语义是「名字 → **定义体**」：签名项绝不能进 deftbl，否则 `force` 会把 primitive 类型
  归约成 `Type`（接口摘要路径的 C37 根因，见 [compiler.md](compiler.md) §接口摘要）。

## 2. NbE

- `eval : List Value -> Term -> Value`：call-by-name（闭包 + 环境），全局保持 opaque
  neutral；`applyClosure` 把实参压入闭包环境。
- `force`：展开已解元变量，并按需 **delta 展开**有定义的全局；步数上限
  `defaultFuel = 512`，到限返回 stuck（不 panic）。`primReduce` 在 force 内做内建归约
  （`IntrinsicOp` 分派）。定义值缓存 `Sols.defVals` 在安全前缀检查后写入。delta 只认
  deftbl 里的定义体（签名表 `ecGlobalsTbl` 不参与展开）。
- `quote` / `normalize`：值 → 项；深度正规化用于显示与终止性检查。
- 类型级 `Vec n a` 是 `VNeutral (NGlobal "Vec" ...)`，因此两个族应用相等当且仅当参数
  定义性相等或可被元变量统一——这就是索引 unification 的用武之地。

## 3. 定义性相等与元变量求解

`Core.Conv.conv` 做 beta + delta + eta 的结构比较：

- 先走 `fastSame` 原子快速路径（同一类型常量、字面量、同层变量等，不做 delta）；
- `VPi` / `VLam` 做 eta（fresh var）；neutral 逐 spine 比较；`VCon` / `VCase` 逐
  构造子 / 分支比较；卡住的 `VCase` 与 `VCon` 不相等；
- 失败返回 `type mismatch: expected X, got Y`（带位置的版本 `mismatchAt`）。

元变量求解（`solveMeta`）：

1. **空 spine**：解 = rhs；就地检查 rhs 的自由变量都早于元变量创建深度（不会逃逸作用域）。
2. **Miller pattern**：spine 全是互不相同的局部中性变量 ⇒ 解 = `λx1..xn. body`，spine
   变量抽象成对应 λ 绑定，其余自由变量必须早于创建深度。
3. **非 pattern 形状的兜底**：先走「头一致」提取（`solveMetaHoLegacyFuel`，
   有 fuel 上限）——rhs 是 `VMeta`，或 `NVar` / `NGlobal` 中性头且实参数不少于 spine 时，
   先解元变量 / 把多出的实参拆给头部求解，再比较剩余 spine；这是保守近似，不是合一理论的
   一部分。提取不到才报 `TC_CannotSolveHigherOrder`。

元变量创建深度随 `Sols` 携带（`solsDepth`），求解点就地检查；已解元变量进项只有两个入口：
精化期 `Elab.Meta.zonkTerm`（深度感知）与序列化/摘要 `Core.Eval.substSolvedMetasAtTbl`
（按出现点深度 quote；`quote 0` 会把 binder 下的解拍成负/错位索引）。`occurs check` 失败报
`TC_CannotSolveOccurs`。

## 4. 精化规则（双向检查）

| 表面形式 | 规则 |
| --- | --- |
| `EVar x` | 局部：`TVar`（类型取上下文）；全局：`TGlobal`（取签名）；找不到报 `TC_UnknownName` |
| `_` | check：新建元变量；infer：报 `TC_HoleNoExpectedType` |
| 字面量 | `Int` / `String` / `Bool` |
| `\x => e` | 只支持 check：逐层消费显式 Pi；遇隐式 Pi 自动绑定；`Rig` 由 `binderRig` 决定 |
| `f a b` | 推断 `f`，每个显式实参前插入隐式元变量，实参按域 check |
| `if c then t else e` | `c` check `Bool`，分支 check 期望类型 |
| `A -> B` / `(x:A) -> B` / `{x:A} -> B` | Pi formation：域 / 余域必须是类型；返回 `Type (max i j)` |
| `Type` / `Type n` | `TType 0` / `TType n`，类型是 `Type (n+1)` |
| `C a b`（构造子） | 按构造子 telescope 插入隐式族参数 / 索引，显式实参按字段域 check，生成 `TCon` |
| `case e of alt...` | 见 `Elab.Case`：scrutinee 必须是归纳族应用，分支按索引 unification 精化 |

精化顺序：按源顺序精化全部签名（每个签名只对 `prelude` + 之前的签名可见；前向引用的
类型别名不可用）→ 按源顺序检查定义体（已检查的定义体进入 delta 表）→ 检查未解元变量。
记录 / `deriving` 在精化前降级（`Elab.Records` / `Elab.Derive`），多 clause 与嵌套模式
经 `Elab.Match` 的模式矩阵降级。

## 5. 擦除

- **唯一判据链**：quantity → `Rig`（`rigOfQty`）→ `Core.rigIsErased`（读取）。隐式 / 类型层 binder 恒 `Rig0`；
  显式 `(0 x : A)` 是 0、`(1 x : A)` 是 1、未标注显式 binder 是 ω；线性类型域强制 1。
  擦除仍只看 `Rig0`（0 与 1 都产生运行时字段，1 额外受恰好一次检查）；
  `Elab.Usage` 在精化后做整程序用量检查，不改变擦除判据。
- 精化器产出的项，其 lambda 链元数必须与该类型的 Pi 链逐 binder 对齐，`Rig0` 位置两侧
  都跳过；trait 投影 / 方法调用共用同一份 rigs（`methodArgRigsOf` / `methodArgLams`）。
- 擦除检查在 `check` 与 `compile` 都跑：运行时位置引用被擦除绑定 / 类型级定义 / `TPi`
  报错。类型族（结果以 `Type` 收尾的 Pi 链）整体擦除；`axiom` 强制进类型级分区，运行时
  使用报 `CG_AxiomAtRuntime`。
- **表现层 cast（D27）**：`prim_erase` 是隐藏 intrinsic，`IntrinsicOp.OpIdentity`
  让求值期把它归约为唯一实参；`Core.Eval.applyValueFuel` 另外在**函数位置**直接消去，
  避免 `(prim_erase h) k` 累积成多实参中性项。因此 cast 对定义性相等 / 正规化 / interp
  完全透明，不改变 0/1/ω 判据（应用记 `Rig1`，不放大线性用量）。

## 6. case 规范形与可达性

源级 `case` 只有一条精化路径：

1. **源级校验**：兜底位置、重复构造子、重复字面量（`Elab.Case`）；
2. 需要嵌套模式或同构造子多分支时，经**模式矩阵**降级（`Elab.Match.multiToCaseExpr`）：
   每构造子一个分支 + 变量子模式，这是唯一规范形；
3. 按 scrutinee 家族降低：`Bool` → `if`；`Int` / `String` 字面量 → `if` 链（必须有
   兜底）；归纳族 → `TCase`。

分支可达性只有一个判据 `BranchVerdict`（`Elab.Case`）：索引一阶合一失败
（`BranchImpossibleIndex`）或分支上下文含空归纳族（`BranchImpossibleEmptyCtx`）⇒
不可达。省略与写出共用同一判据：省略合法、写出报错；可达分支必须写出。索引含中性项时
保守判「可能非空」。空族判定的唯一实现是 `isEmptyFamilyValue` → `allCtorsUnsatisfiable`；
可达性只对**没写出来**的构造子计算（写出的分支直接跳过，避免性能爆炸）。

## 7. codegen 侧不变量

- **构造子字段形状单一真源**：`Codegen.Decl.ctorKeepFlags` 从构造子 telescope 的 rig 算出
  keep flags；类型声明、构造子应用、case 分支绑定三处消费同一份并校验 rig。
- **不透明字段单一真源**：`Codegen.Decl.ctorOpaqueFlagsOf` 与 keep flags 逐位对齐，
  由「运行时类型是否不可命名」判据算出；类型声明的 `Obj.t`、arity/used-levels 计算、
  构造子实参 `Obj.magic` 三处共用。精化器侧的 binder cast 必须用同一判据
  （`Elab.Meta.valueOpaqueScoped`），两侧不一致就会在 `ocamlopt` 处报字段类型错配。
- **de Bruijn 作用域护栏**：`Core.varIndex` 越界返回 `-1`（不是静默 0）；
  `Codegen.Erase.checkAllDefScopes` 对运行时会生成的定义体做作用域校验，越界报内部错误。
- **名字护栏**：`ensureUniqueOcamlNames` 对实际生成的 `v_*` / `t_*` / `C_*` 做族内去重。
- **入口护栏**：`checkResolvedModules` 要求模块声明带模块前缀；入口声明必须不带点、非空、
  不重复；每个 `DtDef` / `DtData` 必须有归属。
- **依赖分组**：Kosaraju SCC（`Codegen.Erase.groupRuntimeDefs`），自 / 互递归才用
  `let rec ... and ...`；零参顶层定义生成 `let v_x = body`。

## 8. 实现入口

| 层 | 入口 |
| --- | --- |
| Core | `Core.Eval.eval` / `force` / `normalize` / `quote`；`Core.Conv.conv` / `solveMeta` |
| Elab | `Elab.Driver.elabProgramFull` / `goalsOfProgram`；`Elab.Term.inferE` / `checkE`；`Elab.Case` / `Elab.Match` / `Elab.Data` / `Elab.Trait` / `Elab.Termination` |
| Codegen | `Codegen.Assembly.checkDtProgram` / `prepareDtProgram`；`Codegen.Split.generateDtSplitProgram`；`Codegen.Erase.*` |

数据流与改动定位见 [architecture.md](../architecture.md)；测试标签见
[testing.md](testing.md)。
