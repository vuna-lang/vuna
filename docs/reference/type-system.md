# 类型系统（依赖类型）

vuna 只有一套类型检查器：依赖类型（DT）的双向精化 + NbE 定义性相等。没有可切换的
检查器，也没有「DT 子集」开关；所有命令（`check` / `compile` / `build` / `interp` /
LSP / 测试夹具）都走它。本文是类型规则的语义页；语法与模块系统见
[language.md](language.md)，记录 / trait / `do` 见 [records-traits.md](records-traits.md)，
quantity / 线性规则见 [qtt.md](qtt.md)（quantity 与擦除口径以该页为准）；Core 表示与
合一实现见 [core.md](core.md)，未关闭的债务见 [debt.md](debt.md)。

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
- **没有宇宙多态**：族参数按 `Type 0` 落地，索引可以用更大层级的类型。层级显示区分
  0 层与更高层：`Type 0` 打印成 `Type`，`Type n`（n > 0）打印成 `Type n`
  （`Core/Eval.showValueAt`），所以非累积的类型不匹配文案是
  `expected Type, got Type 1` 这类可定位的形式。显示是诊断约定，不改变相等判定。
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
- **元变量求解**：局部变量 spine 优先走 Miller pattern（提取成 λ 抽象）；Miller pattern
  之外保留 M13 的「头一致就提取」近似（`Core/Conv.solveMetaHoLegacyFuel`），能提取就
  提取，提取不到才报 `TC_CannotSolveHigherOrder`。完整高阶合一是研究储备（debt B07）。
- 族的类型级应用（`Vec a n`）保持中性（`TGlobal` / `NGlobal` spine），只在 unification
  时按定义性相等比较，不做类型级求值。
- 没有内置的归纳相等族 `Eq`（DT 用来做证明的 `data Eq`）；`Base.Eq` 是 trait。`Nat` / `Vec` /
  `Fin` 也是用户（或 `Base.Nat`、`Base.Vec`）声明的普通族。`Bool` / `List` / `IO` 的
  canonical 身份见 [primitives.md](primitives.md)。
- 索引 binder 的擦除：隐式索引恒擦除（无运行时字段）；显式索引未标注时是 `RigOmega`，
  保留运行时字段（`Vec a n` 的 `(n : Nat)` 可被读回）；要擦除显式索引就写
  `(0 n : Nat)`（quantity 规则见 [qtt.md](qtt.md)），代价是分支体读不到它。擦除只按
  binder 的 quantity 判定，不做整程序使用分析。
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
- **延迟字典目标的诊断**：只有立即搜索失败报 `TC_NoInstanceFound`；延迟目标在收尾时
  仍未回填（类参数未解、或已解但实例搜索失败导致目标被保留）统一报
  `unsolved metavariable`，措辞不区分这两种成因。
- **type-as-value**：不引入 type codes。Type 级等式走**擦除的 `Eq` 证据 + `cast`
  组合子**；把类型放到**运行时位置**仍被擦除检查拒（`CG_TypeUsedAtRuntime` /
  `CG_TypeLevelBindingRuntime` / `CG_TypeLevelNameRuntime`）。显式 `Type` binder 按
  擦除规则处理，因此「类型当显式实参」（`Refl2 Int`）可行，但它不是 type-as-value。

## 证明与索引

- **隐式值参数 `{x : a}`**：域是类型 / 索引 / 证明域时可用；隐式 binder 恒擦除（`Rig0`），
  值只参与类型 / 索引 / 证明，子句体不能按名字引用。
- **构造子的 η**：构造子的未饱和引用 / 应用按 η 展开参与 `conv`，因此
  `cong ... Succ ...`、裸构造子当值传递后再应用都可用。
- **Tarski 式存在式**：依赖索引取值用运行时类型码 `Ty` + 指标族 `Tm : Ty -> Type` +
  存在式 `Some` 表达，让 `Ctx n -> Fin n -> Some` 这类 lookup 写成普通函数（构造存在式
  的值时给出类型码与指标）。泛型 Σ 的值级构造（字段类型依赖运行时值）归 F4
  （[roadmap.md](../roadmap.md) / [debt.md](debt.md)）。
- **空族判定**：索引含中性项时无法证明族为空，判据保守判「可能非空」（细节见
  「依赖模式匹配与 case」）；隐式模式 `{p}` 与 `auto` / 隐式等式搜索归 F4。

## 擦除与运行时表示

- **唯一判据**：`Elab.Meta.rigOfQty` 按 binder 的 quantity 算出 `Rig`（隐式 / 类型层域
  ⇒ `Rig0`；显式 `(0 x)` ⇒ `Rig0`；显式 `(1 x)` ⇒ `Rig1`；显式未标注 ⇒ `RigOmega`；
  线性域自动 `Rig1`），`Core.rigIsErased` 是唯一读取点。quantity 语义与完整判定规则见
  [qtt.md](qtt.md)，这里只列与运行时表示相关的结论。
- `Rig0` binder 不进运行时表示（不生成参数、不算字段）；`Rig1` / `RigOmega` 都保留，
  区别在用量纪律（`Rig1` 恰好一次，`RigOmega` 任意次）。**不做整程序使用分析**：要擦除
  的值写 `(0 x)`，要擦除的索引写隐式 binder 或 `(0 n)`。
- **例外**：编译器为 trait 约束生成的隐式**字典** binder 是 `RigOmega`（字典是运行时值，
  `f : Eq a => τ` 与推断提升的 `{d : Dict_Eq a}` 同形），不适用「隐式 ⇒ `Rig0`」。
- **用量检查**在 `Elab/Usage`：精化后、`DtProgram` 组装前对运行时定义体做一次结构遍历；
  rig 只由精化决定，codegen 不再推导。
- **类型族**（结果以 `Type` 收尾的 Pi 链，如 `sel : Nat -> Type`）整体擦除，不生成运行时
  定义；在运行时定义里把擦除参数当值用报错。
- **擦除依赖类型的运行时表示（M39，D27 表示轴）**：类型族应用出现在**运行时位置**时
  （典型是续延的参数类型 `res op -> ans`），OCaml 侧无法命名该类型，按「不透明擦除值」
  处理：data 构造子字段渲染成 `Obj.t`，构造子实参插 `Obj.magic`，binder 的每个使用点
  插隐藏 cast `prim_erase`（求值期恒等消去）。判据与 codegen 同源（`valueOpaqueScoped`）：
  不可表示的全局类型头，或 kind 的 Pi 链含非宇宙域的**类型族参数**（`res : f -> Type`）；
  普通类型构造子参数（`m : Type -> Type`）与数据族的索引值实参不算。细节与边界见
  [effects.md](effects.md) §5。
- `axiom name : Ty` 是无运行时定义的擦除 / 类型层声明；运行时（非擦除位置）使用报
  `CG_AxiomAtRuntime`。
- 擦除相关实现与 codegen 不变量（构造子字段形状 keep flags、作用域护栏、唯一名字）见
  [core.md](core.md)；codegen 输出见 [compiler.md](compiler.md)。

## 定义与终止性

- 顶层定义必须有类型签名（缺签名报 `[TC_ExpectedSignature] expected a type signature for <name>`）；签名里的
  自由小写名量化为隐式类型参数（量化 banned 集按模块作用域计算）。M32 起签名可带 trait
  约束 `C a =>`：`a` 照常量化，约束另外生成隐式字典参数（`{_ctx0 : Dict_C a}`，插在类型
  参数之后、显式参数之前）；只出现在约束里的变量也参与量化。定义子句参数少于签名时按
  剩余 Pi 链 **η 展开**；多于签名报 `TC_DefMoreParams`。
- **终止性**：递归（含互递归组内调用）必须在某个固定测度位置上递减。测度可以是形参的
  真子项（含嵌套构造子模式、`case` 分支、`f v` 形式的单 clause 投影 / accessor），或
  **带守卫的 Int**：`n - k`（k > 0）且能证明 `n > 0`——证据来自 `if n <= 0` 的 else
  区，或 SCC 入口假设。检查按调用图 + SCC 进行，每个 SCC 的每个环都要有严格下降边。
  递减要求覆盖所有调用形态：HOF 递归、`where` 绑定体里调外层函数、`Cons x (f x)` 这类
  藏在实参里的递归同样检查。无守卫的 `n - 1`、升序 `i + 1`（有界计数器规则未实现）与
  无下降的互递归报 `TC_CannotProveTermination`。
- **没有包级豁免**：依赖模块、入口模块与编译器包共用同一套终止性 / 覆盖率判据，不按
  包名跳过检查。
- **零参顶层定义求值一次**：生成 `let v_x = body`；递归组里的零参非构造子 RHS 报
  `CG_RecursiveValueDefinition`。
- **`main`**：`check` 不要求 `main`，`compile` / `build` 要求；`main` 可为
  `Int` / `Nat` / `String` / `Bool` 或 `IO a`（`IO` 是内建效应类型，M37）。
  `vuna interp` 是纯核心求值，只展示 `Int` / `Nat` / `String` / `Bool`，任何
  `main : IO a` 一律明确报错。
- 洞 `_` / 命名洞 `?name` 未解时报 `TC_UnsolvedHole`（带位置与目标类型，命名洞带洞名）；
  `vuna goal` 与 LSP hover 用**容错**目标查询（`goalsOfProgramTolerant` / `dtGoalsSourceTolerant`），
  所以未解的洞也能列出目标与上下文（[tooling.md](tooling.md)）。

### 实现侧护栏（fuel / measure 站点）

终止性判据之外，前端与加载器的状态机（词法、语法、TOML / JSON、目录遍历）用输入规模
线性放大的显式 fuel 或可证明的结构递归；下表是各站点的真实上界。编译器、前端与加载器
的站点耗尽守卫时报明确的 internal 错误；工具链站点（Fmt / Files / Index / Repl / Lsp）
按不可达规模设置上界，正常输入不触发。深层 / 长输入夹具锁定合法规模不会耗尽守卫。

| 站点 | measure / 上界 |
| --- | --- |
| `Base.String.split` | `2*len(text)+len(sep)+2`；每步消费 1 字符或跳过 ≤`len(sep)` 字符 |
| `Frontend.Lexer` | `4*len(source)+64`；每个递归调用消费 ≥1 字符，trivia / token 不重叠 |
| `Frontend.Parser` | `128*剩余 token 数+1024`；每个循环至少消费 1 token（offside 状态机保留守卫） |
| `Frontend.Toml` | 逐字符状态机 `2*len+16`；逐行主循环 `4*lines+16` |
| `Loader.Resolve` | 显式 fuel 而非结构递归：每个子项重新播种 `1073741824`（1G），每步递减（守卫 Int 判据） |
| `Packages.Pkg` | `pkgFuelBound = 1048576`：每条依赖边 / 展开一个包目录消费 ≥1 步，`memStackDir` 防环 |
| `Vuna.Json` | `8*len+64`；互递归组返回剩余输入，SCT 不可见，用同参数位 `fuel - 1` |
| `Vuna.Fmt.Expr` | 固定预算 `formatFuelBound = 1073741824`（1G）；块级布局同时沿 AST 与缩进 / 模式前进 |
| `Vuna.Files` / `Index.Scan` | 目录树每下钻一层递减（起点 `1048576`）；上界 = 目录深度，符号链接环被截断 |
| `Vuna.Repl` / `Vuna.Lsp` | 交互 / 服务主循环保留 `1073741824`（1G）：非全函数，只防不可达死循环 |

## 与其它页的分工

- 语法、`let` / `where`、模块与命名空间：[language.md](language.md)
- 记录、trait / 实例 / `deriving`、`do` / Monad：[records-traits.md](records-traits.md)
- Core 表示、NbE、合一、精化器、擦除 codegen 不变量：[core.md](core.md)
- 原语身份、Int / String 语义、效果能力：[primitives.md](primitives.md)
- 未关闭的债务与未来能力归属：[debt.md](debt.md)、[roadmap.md](../roadmap.md)
