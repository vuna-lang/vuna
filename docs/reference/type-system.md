# 类型系统（依赖类型）

vuna 只有一套类型检查器：依赖类型（DT）的双向精化 + NbE 定义性相等。没有可切换的
检查器，也没有「DT 子集」开关；所有命令（`check` / `compile` / `build` / `interp` /
LSP / 测试夹具）都走它。本文是类型规则的语义页；语法与模块系统见
[language.md](language.md)，记录 / trait / `do` 见 [records-traits.md](records-traits.md)，
quantity/线性规则见 [qtt.md](qtt.md)；Core 表示与合一实现见 [core.md](core.md)，当前边界清单见 [limits.md](limits.md)。

## 宇宙与 kind

- **严格分层、非累积**：`Type i : Type (i+1)`；Pi formation 取 `max(i, j)`；
  `Type i` 与 `Type j`（`i ≠ j`）**不相等**；没有一般 subtyping / cumulativity（唯一的隐式提升是 M34.7 的 Nat → Int，见下），
  `Type : Type` 被拒绝。唯一的层级流动是显式写更小的宇宙：`Type 0` 可以赋给
  `Type 1` 的签名（因为 `Type 0` 的类型就是 `Type 1`），反过来不行。
- **data kind**：`data F : <kind>` 的 kind 必须是「Pi 链 → `Type l`」，`l ≥ 0`；
  族层级就是末尾的 `l`（`data Vec : Type -> Nat -> Type` 的族层级是 0）；kind 里每个
  binder 的域必须是类型。不以宇宙收尾的 kind 报 `TC_DataKindArrows`。
- **构造子字段层级**：构造子类型 `... -> F r1..rk` 的前 `arity` 个 binder 是族参数 /
  索引（不受层级限制），其余是字段；每个字段 binder 的域 sort 必须 `≤` 族层级，
  违反报 `TC_CtorError`。检查在表面类型表达式上逐段做（带 binder 进入 `Ctx`），
  依赖字段按正确上下文计算。
- **没有宇宙多态**：族参数按 `Type 0` 落地，索引可以用更大层级的类型。层级显示不带
  level（`Type 0` 与 `Type 1` 都打印成 `Type`），所以非累积的类型不匹配文案可能是
  `expected Type, got Type`——拒绝正确，显示待补（见 [limits.md](limits.md)）。
- 实现：`Elab/Meta.kindWellFormed`（kind 形状 / 层级）、`Elab/Data.elabCtor` +
  `checkCtorFieldSorts`（字段层级）。

## Nat → Int 隐式提升（M34.7）

- `Nat` 是 `Int` 的数值子集；精化器只在**检查点**（函数实参、返回、构造子字段、`if`
  分支汇合、`==`/比较、算术特化）把 `Nat` 项包装成 `natToInt` 当 `Int` 用。运行时
  `natToInt` 恒等，类型规则仍是定义性相等（`Nat` 与 `Int` 不相等，包装后的项才是 `Int`）。
- 反向没有隐式：`Int → Nat` 必须显式 `Base.Nat.fromInt`（负数 clamp 0）或 `fromIntMaybe`。
- 这与宇宙/一般子类型无关：`Vec Nat` 与 `Vec Int` 仍不相等。

## data 与索引归纳族

- 声明形式是 `data F : <kind> where` 加缩进的构造子表。kind 的**箭头个数 = 族的
  参数 / 索引个数（arity）**，域依次对应族应用的位置；`data Vec : Type -> Nat -> Type`
  就是 `Vec a n`。族参数不写圆括号，构造子用**完整 telescope** 重新绑定：前 `arity`
  个 binder 对应族参数 / 索引，其余是字段，结果索引写在类型里。
- 构造子应用要写全**显式**族参数 / 索引（`Cons Int Zero 1 (Nil Int)`）；隐式索引
  （`{n : Nat}`）由调用点或期望类型反推。推断仍是一阶的：没有期望类型、又需要解出
  带局部变量的解时可能报 `TC_UnsolvedMetavar`。
- 族的类型级应用（`Vec a n`）保持中性（`TGlobal` / `NGlobal` spine），只在 unification
  时按定义性相等比较，不做类型级求值。
- 没有内置的归纳相等族 `Eq`（DT 用来做证明的 `data Eq`）；`Base.Eq` 是 trait。`Nat` / `Vec` /
  `Fin` 也是用户（或 `Base.Nat`、`Base.Vec`）声明的普通族。`Bool` / `List` / `IO` 的
  canonical 身份见 [primitives.md](primitives.md)。
- 索引 binder 的擦除：隐式索引无运行时字段，显式索引保留运行时字段（`Vec a n` 的
  `(n : Nat)` 可被读回）；想擦除索引就把它写成隐式 binder，代价是分支体读不到它。
- 实现：`Elab/Data`、`Elab/Types`；unification 见 [core.md](core.md)。

## 依赖模式匹配与 case

- `case e of` 的 scrutinee 必须是归纳族应用；分支绑定构造子的**全部显式 telescope
  binder**（族参数、索引与字段各占一个位置），隐式 binder 不消费子模式。
- **索引精化**：每个分支把构造子结果索引与 scrutinee 索引做 unification，得到该分支的
  索引等式（`level ↦ value` 精化），分支体的期望类型随之精化。打在裸形参或包装族上时
  还会把 scrutinee 的值与构造子结果值再合一（scrutinee 反射）。
- **省略与写出共用同一判据**（`Elab.Case.BranchVerdict`）：
  - 构造子结果索引与 scrutinee 索引一阶合一失败 ⇒ 分支不可达（`TC_ImpossibleBranchIndex`）；
  - 分支上下文含空归纳族（如 `Fin Zero`）⇒ 不可达（`TC_ImpossibleBranchEmptyCtx`）；
  - 不可达分支**省略合法、写出报错**；可达分支必须写出，写出即接受。
  - 索引含中性项时无法证明空族，判据保守判「可能非空」：分支必须写出且会被接受。
- `case` 的**唯一规范形**：先做家族无关的源级校验（兜底位置、重复构造子、重复字面量），
  需要嵌套模式 / 同构造子多分支时经模式矩阵降级（每构造子一个分支 + 变量子模式），
  再按 scrutinee 家族降低（`Bool` → `if`，`Int` / `String` 字面量 → `if` 链，归纳族 →
  `TCase`）。多 clause 函数与源级 `case` 共用这套模式矩阵。
- **字面量 case 必须有变量 / 通配兜底**（`TC_IntStringCaseNeedsFallback`）；
  `Bool` 的 `case` 只认 `True` / `False` / 变量 / 通配（`TC_BoolCaseRestriction`）。
- **诊断**：重复构造子分支、重复字面量、兜底之后的分支分别是
  `TC_RedundantCtorBranch` / `TC_RedundantLiteralBranch` / `TC_BranchAfterCatchAll`；
  兜底不在最后报 `TC_CatchAllNotLast`；漏写可达分支报 `TC_NotExhaustive`。
  「需要矩阵消解的同构造子多分支」不是冗余——矩阵会让两条都可达。
- 语法与 as-pattern 的当前适用范围见 [language.md](language.md)；实现见
  `Elab/Case`、`Elab/Match`、[core.md](core.md)。

## 相等与比较

- **`==` / `/=` 是证据驱动的**，只有两条路径：
  1. `Int` / `String` 的内建特化（`bi_eq_int` / `bi_eq_str` / `bi_*_int` / `bi_*_generic`）；
  2. `Eq` 证据：手写实例、`deriving (Eq)` 生成的实例、约束实例。
  具体类型没有实例、函数类型相等、`Eq` 类不在作用域，都在 `check` 期报错
  （`TC_NoInstanceFound` / `TC_EqRequiresEvidence`）。**没有泛型结构比较兜底**，
  interp 与编译产物也没有第二套相等算法。
- **运算符是方法别名（M31.1）**：`==` / `/=` / `<` / `<=` / `>` / `>=` 不是独立的语义
  入口，Loader 把它们解析成 `eq` / `neq` / `lt` / `le` / `gt` / `ge`（M31.2 起统一在
  `Loader.Fixity` 的重排与别名表里）。`a == b`、`eq a b`、``a `eq` b`` 是同一个调用；
  Elab 的特化按「`Eq` / `Ord` 方法投影的饱和应用」判定（`Elab.Dict.isEqMethod` /
  `isCmpMethod`），不按运算符名。运算符不产生新的运行时名字。实例落点规则见
  [operators.md](operators.md)。
- **`<` / `<=` / `>` / `>=`**：`Int` 内建特化；`String` / `Bool` 保留泛型运行时；
  其它类型必须有 `Ord` 证据，无实例 / 无类在 `check` 期报错。
- 相等发生在**刚性类型变量**上时，搜不到实例会提升成隐式字典参数（延迟到调用点），
  实例（含 `deriving` 生成的）仍优先。`Eq` / `Ord` / `Show` 的**声明**在
  `Base.Eq` / `Base.Ord` / `Base.Show`；实例按**落点规则**分布（跟类型模块走，
  `Bool` 是方法返回类型，实例随 trait）：`Int` → `Base.Int`、`String` → `Base.String`、
  `Bool` → `Base.Eq` / `Base.Ord`。包上下文内所有源文件（含 ad-hoc 单文件）随自动注入的
  `Prelude` 可用（`Prelude` 显式 `import Base.Int` 以加载 Int 实例）；trait 与实例语义见
  [records-traits.md](records-traits.md)。
- **type-as-value**：不引入 type codes。Type 级等式走**擦除的 `Eq` 证据 + `cast`
  组合子**；把类型放到**运行时位置**仍被擦除检查拒（`CG_TypeUsedAtRuntime` /
  `CG_TypeLevelBindingRuntime` / `CG_TypeLevelNameRuntime`）。显式 `Type` binder 按
  擦除规则处理，因此「类型当显式实参」（`Refl2 Int`）可行，但它不是 type-as-value。
- **依赖索引取值**用 **Tarski 式存在式**表达：运行时类型码 `Ty` + 指标族
  `Tm : Ty -> Type` + 存在式 `Some`，让 `Ctx n -> Fin n -> Some` 这类 lookup 可写成
  普通函数。泛型 Σ 的值级构造（字段类型依赖运行时值）仍是边界，归 F4
  （[limits.md](limits.md) / [debt.md](debt.md)）。
- **隐式值参数 `{x : a}`**：域是类型 / 索引 / 证明域时可用；隐式 binder 恒擦除，值只
  参与类型 / 索引 / 证明，子句体不能按名字引用。构造子的未饱和引用 / 应用按 η 展开
  （`cong ... Succ ...`、裸构造子当值传递后再应用都可用）。隐式模式 `{p}` 与
  `auto` / 隐式等式搜索未实现（F4）。

## 擦除与运行时表示

- **唯一判据**：`Elab.Meta.binderRig` 构造 `Rig`，`Core.rigIsErased` 读取；
  隐式 binder 恒 `Rig0`；显式 binder 仅当域在类型层（宇宙，或域全为类型层的 Pi 链）才
  `Rig0`；其余 `Rig1`。**例外**：编译器为 trait 约束生成的隐式**字典** binder 是 `Rig1`
  （字典是运行时值；`f : Eq a => τ` 与推断提升的 `{d : Dict_Eq a}` 同形）。
- `Rig0` binder 不进运行时表示（不生成参数、不算字段）；`Rig1` 保留。**不做整程序
  使用分析**：想擦除的索引写成隐式 binder。
- **类型族**（结果以 `Type` 收尾的 Pi 链，如 `sel : Nat -> Type`）整体擦除，不生成运行时
  定义；在运行时定义里把擦除参数当值用报错。
- `axiom name : Ty` 是无运行时定义的擦除 / 类型层声明；运行时（非擦除位置）使用报
  `CG_AxiomAtRuntime`。
- 擦除相关实现与 codegen 不变量（构造子字段形状 keep flags、作用域护栏、唯一名字）见
  [core.md](core.md)；codegen 输出见 [compiler.md](compiler.md)。

## 定义与终止性

- 顶层定义必须有类型签名；签名里的自由小写名量化为隐式类型参数（量化 banned 集按
  模块作用域计算）。M32 起签名可带 trait 约束 `C a =>`：`a` 照常量化，约束另外生成
  隐式字典参数（`{_ctx0 : Dict_C a}`，插在类型参数之后、显式参数之前）；只出现在约束里的
  变量也参与量化。定义子句参数少于签名时按剩余 Pi 链 **η 展开**；多于签名报
  `TC_DefMoreParams`。
- **终止性**：递归（含互递归）必须能证明下降——每个循环至少一条结构下降边（实参是同一
  形参的真子项，含嵌套模式、`case` 分支、`f v` 形式的单 clause 投影），或带守卫的 Int
  （`n - k` 且能证明 `n > 0`）。检查按调用图 + SCC 进行，每个环都要有严格下降边；
  没有按包名的检查豁免。无守卫的 `n - 1`、升序 `i + 1`、无下降的互递归报
  `TC_CannotProveTermination`。measure 站点表与边界见 [limits.md](limits.md)。
- **零参顶层定义求值一次**：生成 `let v_x = body`；递归组里的零参非构造子 RHS 报
  `CG_RecursiveValueDefinition`。
- **`main`**：`check` 不要求 `main`，`compile` / `build` 要求；`main` 可为
  `Int` / `String` / `Bool` 或 `IO a`（`IO` 是内建效应类型，M37）。
  `vuna interp` 是纯核心求值，只展示 `Int` / `String` / `Bool`，任何 `main : IO a`
  一律明确报错。
- 洞 `_` 未解时报 `TC_UnsolvedHole`（带位置与目标类型）；`vuna goal` 列出全部洞
  （[tooling.md](tooling.md)）。

## 与其它页的分工

- 语法、`let` / `where`、模块与命名空间：[language.md](language.md)
- 记录、trait / 实例 / `deriving`、`do` / Monad：[records-traits.md](records-traits.md)
- Core 表示、NbE、合一、精化器、擦除 codegen 不变量：[core.md](core.md)
- 原语身份、Int / String 语义、效果能力：[primitives.md](primitives.md)
- 当前限制与未来能力归属：[limits.md](limits.md)、[debt.md](debt.md)
