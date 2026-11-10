# 记录、trait 与 do/Monad

本文覆盖建立在核心类型系统之上的语言机制：记录、trait / 实例 / `deriving`、`do` 与
Monad / Functor。宇宙、索引族、依赖匹配、相等证据与擦除规则见
[type-system.md](type-system.md)；基础语法与模块系统见 [language.md](language.md)；
标准库模块清单见 [stdlib.md](stdlib.md)。

## 记录

```vuna
record Point where
  x : Int
  y : Int

p : Point
p = Point { y = 2, x = 1 }         -- 字段顺序任意，但必须给全

q : Point
q = { p | x = 3 }                  -- 字段更新，可一次更新多个字段

sum : Point -> Int
sum p = case p of
  Point { x = a, y = b } => a + b  -- 可省略字段（省略 = 通配）

onlyX : Point -> Int
onlyX p = case p of
  Point { x } => x                 -- pun：等价于 Point { x = x }
```

- 记录可以参数化（`record Pair a b where`）；记录类型名同时是它的构造器名。
- 字段访问写作 `p.x`，支持链式（如 `s.start.x`）。
- **字段访问按 base 类型消歧**：`EField` / `ERecUpdate` 在精化期按 base 类型的
  单构造子 data / telescope 找字段，不再要求字段名全局唯一；两个 record 可以有同名字段
  （字段类型可以不同），按标注的 base 类型选择。
- 编译器/stdlib 内部单构造器产品类型用 `record` + 字段访问取代「data + 位置访问器」；
  只有需要作为函数值传递（`map acc`）或参与终止性投影（递归实参）的投影才保留为访问器，
  因为无签名 lambda 没有参数类型推断、字段访问在其中不可类型化。
- 导出遵循模块规则：`T` 只导出记录类型（构造器隐藏，跨模块不能构造 / 模式匹配，即
  抽象），`T(..)` 才公开记录构造器。
- 实现上记录在精化前降级为单构造子 `data`（`Elab.Records`）；构造 / 模式匹配仍是构造器
  应用，字段访问 / 更新在精化期按 base 类型生成内联 `case`，核心求值器与 codegen 行为一致。
- **R2 起字段身份是结构化元数据**（见下节）：构造子字段 binder 只带位置信息
  （`@vuna@record@arg<i>`），字段名 / 序号 / 类型由 `RecordMeta`（iface）与
  `DtData.dtDataFields`（Core）承载；精化期按表查字段，不再反推 binder 名。
- 字段访问 / 更新的 base 类型必须可推断；具体类型由基类型确定；推断不出（刚性类型变量）
  时字段访问走 `HasField` 约束（见下），更新则报错提示补类型。
- 错误：缺字段 / 重复字段 / 未知字段 / 非记录类型；记录支持 `deriving (Show, Eq, Ord, Hashable)`。

### 字段表结构化（R2）

`record` 声明抽取成 `RecordMeta`（`Elab.Records`）：名字 / 参数 / 字段表
（`RecordFieldMeta` = 名字 + 类型 + 声明序号）/ 派生 / 表示档位 / 构造子 / 线性标记。
它进 `ModuleIface.miRecords`（`vuna-iface 12`），并参与 `miIfaceHash`：字段重排、改名、
序号变化都会让依赖者失效；字段类型由 `hashDatas`（`DtData` 的 Marshal）覆盖。

Core 侧每个 record 族的 `DtData.dtDataFields : List DtFieldMeta` 存（名字、序号、外层
字段类型）；字段类型在精化 data 体时取构造子 telescope 的域项并用 `shift 0 (-i)` 去掉
前序字段 binder 槽位，因此投影只需 `eval (reverse idxs) dtFieldType`——旧的
`@vuna@record@dep` 中性占位值随之删除。`EField` / `ERecUpdate` 在精化期消歧后，解析计划
`FieldAccessPlan` / `UpdateAccessPlan` 显式携带（记录名，字段序号 / 被改字段序号）标注，
供 R3 的 `TProj` 原语直接消费；AST 形状保持不变（R2 是纯行为保持步骤）。

R3 起 Core 侧有记录原语（行为保持：codegen 展开回原 `case`/构造子，产物逐字节一致）：
`TProj base ctor fieldTele absIdx fieldIdx`（字段访问，`VProj` 是卡住形态，`force` 会先
force base 再取字段）、`TRecUpd base ctor fieldTele updatedIdxs rebuiltBody`（更新，语义 =
单分支 `TCase`）、`TMk ctor args`（记录构造，语义 = `TCon`）。`TRecord` 类型前导留到
record 不再是 `data` 的 R4。

字段表随 `miCached.cachedDatas` 跨包流动（普通 `data` 为空表），所以抽象记录
（`07_export_abstract`）仍能字段访问 / 更新；工具面（`vuna api` / LSP hover）后续按
`miRecords` 渲染，不再依赖前缀约定。§1.6 的语法层消歧死代码
（`desugarRecUpdate` / `recordsWithField` / `fieldAccessExpr` / `checkProvidedFields` 等）
与 `fieldBinderName` 前缀一并删除。

### 零成本表示（声明档位 + 推断回落）

记录可以**声明**自己的运行时表示档位（三档）：

| 写法 | 档位 | 语义 |
| --- | --- | --- |
| `transparent record R where ...` | `ReprTransparent` | 透明别名：构造 / 投影是定义性恒等；**要求擦除后恰好一个运行时字段**，否则 `[TC_ReprTransparentInvalid]` |
| `record R where ...`（无前缀） | `ReprAuto` | 未声明：回落到自动去装箱推断（R1 过渡档；终态删除推断） |
| `opaque record R where ...` | `ReprOpaque` | 强制装箱（FFI / ABI 稳定）：即使形状满足去装箱判据也保留运行时包装 |

档位进 `DtData` 与 iface（`recordHash` 参与失效判定），下游包与 codegen 看到的是
**同一个**声明结论，不再各自推断。`transparent` / `opaque` 只适用于 `record`
（`transparent data` 是语法错误）；`lin` 可与档位组合（`transparent lin record`）。

`ReprAuto` 的推断判据（`Elab.Representation.unboxedCandidateOfData`，由擦除后的
构造子形状决定，`ctorKeepFlags`）：

1. 恰好一个构造子；
2. 恰好一个**运行时保留**的字段（索引位 = 数据参数之后；类型参数、隐式参数、
   `(0 _)` 参数不算）；
3. 该字段类型可被 OCaml 表示；函数 / Pi 字段与不透明 / 未知名字段保持装箱（OCaml 值限制与可命名性）；
4. 候选之间无递归环（单字段自引用包装仍装箱）；
5. `Bool` / `Nat` / 内建特殊族不参与。

```vuna
transparent record UserId where
  uid : Int

record Wrap where
  w : Int

opaque record Handle where
  h : Int

-- UserId / Wrap 去装箱（后者靠推断回落）：OCaml 里就是 int；
-- Handle 保持装箱（声明优先于推断）。
getUser : UserId -> Int
getUser u = u.uid
```

类型参数个数不影响判定：`record EitherStr a where runEitherStr : Result a`
同样只保留 `Result a`。**多字段 record 生成真正的 OCaml record**
（`type t_Point = { f_Point_x : int; f_Point_y : int }`，字段标签按 record 名前缀避免撞车），
构造是 `{ f_Point_x = 1; f_Point_y = 2 }`、投影是 `p.f_Point_x`、更新是
`{ p with f_Point_x = 40 }`、模式是 `{ f_Point_x = x; f_Point_y = y }`；跨单元时标签按
`Unit.f_...` 限定。普通 `data` 仍是 OCaml 变体，两者可以共存；零运行时字段的 record
（以及去装箱的单字段 record）沿用变体 / 类型别名。
判定是**声明级**的，不改变语义、类型检查或 `deriving` 的结果；它只改变运行时表示。

### `deriving via field`

`record` 和 `data` 都可以写 `deriving via field (C1, C2, ...)`：合法性**只看声明档位**
（R1）：`transparent` 直接成立；未声明（`ReprAuto`）按自动去装箱推断判定；
`opaque` 恒为装箱，直接拒绝。实例不是逐方法生成的，而是在实例搜索期做 **字典委托**（GND）：

```text
搜索 Dict_C Wrapper
  → 如果没有 Wrapper 的显式实例，搜索 Dict_C Field
  → 复用底层类型的同一份字典
```

因此能委托的 trait **完全由底层字段类型有没有该实例决定**，不是固定列表：`Show` /
`Eq` / `Ord` 只是常见例子，用户自定义 class 同样可用。括号里的类名是允许委托的集合
（`via field ()` 表示不委托任何类）。

```vuna
record UserId where
  uid : Int
deriving via field (Show, Eq)

data Wrap : Type where
  MkWrap : Int -> Wrap
deriving via field (Show)

trait Pretty a where
  pretty : a -> String

instance Pretty Int where
  pretty n = strFromInt n

record Tagged where
  tag : Int
deriving via field (Pretty)

main : String
main = show (UserId { uid = 3 }) ++ "/" ++ show (MkWrap 5) ++ "/" ++ pretty (Tagged { tag = 7 })
```

- `data` / `record` 同等；包装必须实际去装箱（`transparent` 声明，或未声明且形状满足
  单字段判据），否则报 `[TC_DerivingViaUnboxedRequired]`（多字段、多构造子、函数 / Pi 字段、
  递归包装、未知名 / 不透明字段、`opaque` 声明都不满足）。
- 委托是**表示级**的：只有 wrapper 与 field 运行时表示完全一致时才成立；当前这等价于
  自动去装箱判据。因此函数 / Pi 字段包装（`Eff` / `Reader` / 续延）暂时不能用
  `deriving via field`（它们保持装箱，见 debt D50）。
- 显式实例优先：如果 wrapper 自己声明了 `instance C Wrapper`，不会被委托覆盖。
- 参数化包装的字段类型会代入 wrapper 的实参；多参数 class 中 wrapper 出现在任一参数位置
  时也可以委托。
- 目前只处理 class 参数**头部**是 wrapper 的委托；`C (List (Wrapper a))` 这种嵌套在容器里的
  包装不会自动回溯到 `C (List (Field a))`（见 debt D50）。
- 没有 `newtype` / `type` 关键字：`record` 提供名义类型，`transparent` / 缺省推断负责表示，
  `deriving via field` 负责实例；结构 `deriving` 保持逐字段比较 / 展示。
- 实现：`Elab.Dict.searchInstFuel` 的 `tryViaDict` 在实例搜索期替换类参数；
  `Elab.Data.checkViaDataDecls` 校验表示条件。因为 `interp` 是纯 Core 求值器（不做
  codegen 去装箱），`vuna interp` 对依赖表示委托的 `show` 等程序不适用；这些夹具用
  compile + run 验证。

### `HasField`：nominal 记录的泛型读访问（`Base.Record`）

行类型记录没有落地；只读的泛型字段访问用类型类约束表达，对任意 nominal record 都成立，
且与字段位置无关：

```vuna
import Base.Record

getId : HasField (Field "id") a String => a -> String
getId p = p.id

getCreated : HasField (Field "created") a Timestamp => a -> Timestamp
getCreated p = p.created
```

- `Field` 是**类型级**标签（`Field "id"`，见 `Base.Field`）；`HasField (l : Type) (a : Type) (t : Type)` 是
  trait，方法 `getField : a -> t`。标签做成类型 `Field "id"` 而不是 `String` 值索引：
  隐式参数不能是 `String` 值，类型级标签可以正常参与字典匹配。
- 编译器为导入了 `Base.Record` 的模块中的 record 字段自动生成实例；显式 `instance HasField ...` 也可用，两者混用时自动生成会跳过。
- 具体 record 的 `p.f` 仍是内联投影（零字典）；只有 base 类型是刚性类型变量时，`p.f`
  使用签名里的 `HasField` 约束字典（调用点由自动生成或显式实例填充）。
- 没有运行时按标签查找；没有行类型 / 结构子类型 / 字段重排。自动实例只生成在定义 record 的模块且该模块需 `import Base.Record`；其他模块的 record 需要显式实例。
- **状态**：具体 record 的 `p.f`、泛型函数体里的约束字典、自动生成实例在 interp 与 compile 路径都可用；归属表按 record 声明为生成的实例补了模块归属，`10_has_field` 已回到 `records_files`（compile + interp 对比）。限制：自动实例只覆盖定义 record 且 `import Base.Record` 的模块；显式实例存在时跳过自动生成；仍未支持行类型 / 跨包自动实例。
- `{ p | f = ... }` 更新仍要求具体 record 类型（未知行的更新没有 `SetField` 支持）。


## trait 与实例

```vuna
trait Pretty a where
  pretty : a -> String

data Color : Type where
  Red : Color
  Blue : Color
  deriving (Show, Eq)

instance Pretty Color where          -- 实例按 head 唯一（无命名实例）
  pretty c = case c of
    Red => "red"
    Blue => "blue"

main : String
main = pretty Red ++ "/" ++ show Red
```

- **trait 支持 N>=1 个参数**：字典类型是 `Dict_C p1 .. pn`，构造子字段仍是方法；
  默认方法、父类、关联类型未实现（见 [debt.md](debt.md)）。
  每个参数的 kind 可显式写：`trait C (a : Type) (r : Row) where ...`；未写时从方法签名
  推断（参数被应用 k 次即 `Type -> ... -> Type`，否则 `Type`；显式 kind 里的中缀如 `Type -> Type` 也会被 Loader 重排）。空参数表报
  `[TC_InterfaceNoParam]`。非 Type 类参数（如 `Row`）的实例搜索已支持；但**头可合一的重叠实例
  仍被 coherence 拒绝**（`Member e (Cons e r)` 与 `Member e r => Member e (Cons x r)`），
  因此 trait 版 `Member e r` 不可用。**这不是待修债务**：行成员约束用 Type-1 归纳族
  `Base.Eff.Member` 实现（精化器按行结构构造 `Here`/`There`），不需要 trait 重叠实例。
  实例头的 tele 变量 kind 按实参推断：裸变量取对应类参数的 kind，嵌套变量从
  构造子的参数 kind 反推（`instance Pretty (T n)` 配 `T : N -> Type` ⇒ `n : N`，
  `instance Monad (Eff r)` 配 `Eff : Row -> Type -> Type` ⇒ `r : Row`）；
  都解不出时回退「被应用次数」启发式。
  ```vuna
  trait Convert a b where
    convert : a -> b
    convertBack : b -> a

  instance Convert Int String where
    convert n = strFromInt n
    convertBack _ = 0

  idConvert : {a b : Type} -> Convert a b => a -> b
  idConvert x = convert x
  ```
  签名约束、实例头与实例 ctx 的实参个数必须与 trait 的参数个数一致；实例搜索按完整的
  `Dict_C a1 .. an` 头统一（不是只看第一个参数）。
- **实例按 head 全局唯一**：同一 head 的重复 / 重叠实例报 `duplicate instance` /
  `overlapping instance`（含 `deriving` 生成的实例）。**没有命名实例**：不存在
  `instance C T as name` 或 `@name` 选择，相干性只靠「同一 head 唯一」。
- **blanket 实例是 fallback**：head 实参是裸类参数（全部 tele 都是类参数）的实例
  是兜底，例如 base 的 `instance Show a => Interp a`；搜索分两阶段——具体实例先匹配，匹配
  不到才试 blanket。**具体实例覆盖 blanket**（`instance Interp String` 赢过 blanket），
  具体实例之间仍禁止重叠；两个 blanket 仍报 `TC_DuplicateInstance`（见 [templates.md](templates.md)）。
- **实例落点**：实例跟类型模块走；trait 签名直接依赖该类型、放类型模块会成 import 环时
  例外（`Eq` / `Ord` 的 `eq : a -> a -> Bool` 返回 Bool，Bool 实例随 trait 留在 `Base.Eq` /
  `Base.Ord`；`Show String` 留在 `Base.Show`，因为 String 经 Interp 依赖 Show。`Show Bool`
  的签名不依赖 Bool，按规则放 `Base.Bool`）。精化器**强制孤儿检查**（B23）：实例必须声明在
  定义 trait 的文件，或定义 head 类型（任一类型参数）的文件；`Int` / `String` / `IO` 是
  全局可见的内建类型，允许在任意模块声明实例（如 `Show Int`）。违反报 `TC_OrphanInstance`。
  规则与理由见 [operators.md](operators.md)。
- **约束实例**：ctx 写在 head 前，搜索时递归求解：

  ```vuna
  data Box a : Type where
    MkBox : a -> Box a

  instance Eq a => Eq (Box a) where  -- 字典 def 带隐式类型参数 + ctx 字典参数
    eq x y = case x of
      MkBox a => case y of
        MkBox b => a == b
  ```

- **参数化 `deriving (Show, Eq, Ord, Hashable)`**：按 data 的每个类型参数生成 ctx（形态是约束
  实例 `instance Eq a => Eq (F a)`）；`Show` 要求字段可 show。`mem (Box 1) [...]`
  这类需要 `Dict_Eq (Box Int)` 的用法因此可用。
- **顶层函数签名也可以写约束**：`f : Eq a, Show a => a -> String`。约束是定义体的
  字典假设（隐式字典参数，`Rig` 是 `RigOmega`，运行时保留），body 的方法调用优先命中
  它；调用点仍按实例搜索补字典。
  不写约束的形态仍按推断提升（`{a} -> {d : Dict_Eq a} -> ...`）；三包源码
  统一写显式约束，不再依赖该旧形态。语法与边界见 [language.md](language.md) §签名的 trait 约束。
- **`Show` / `Eq` / `Ord` 是库里的普通 trait（声明与实例分离）**：声明在
  `Base.Show` / `Base.Eq` / `Base.Ord`；实例按**落点规则**分布：`Int` → `Base.Int`、
  `String` 的 Eq/Ord → `Base.String`、`Show String` → `Base.Show`、`Show Bool` →
  `Base.Bool`、`Eq/Ord Bool` → `Base.Eq` / `Base.Ord`；容器 `Show` 实例在各自类型模块。
  运算符 `==` / `/=` / `<` 等是这些方法的解析期别名（见 [type-system.md](type-system.md)）。
  包上下文内所有源文件
  （含 ad-hoc 单文件）随自动注入的 `Prelude` 可用（`Prelude` 显式 `import Base.Int`
  以加载 Int 实例）；`show` / `eq` / `lt` 等短名不由编译器放行，必须经 import 解析。
  `deriving` 的展开使用 Loader 解析后的完整类名（如 `Base.Show.Show`）。详见
  [operators.md](operators.md)。
- **没有结构性自动回退**：`List a` / `Box a` 这类要能比较 / 展示，必须有约束实例或
  具体实例；Base 带 `Int` / `String` / `Bool` 与 `List` / `Maybe` / `Pair` / `Result` 的
  `Show` 实例。字符串展示只有 `strShow` 一个实现。
- 实现：字典按 trait 方法扁平化（`data Dict_C` + 方法投影 + 实例搜索）。具体类型的
  调用点走静态派发；方法调用点类型是**裸类型变量**时做方法级字典穿参（类型检查给该
  函数增加方法函数参数），支持跨函数传播、前向引用与递归。高阶 kind 与一般约束泛化
  可用（如 `Monad m` 的 `m a`）。
- 命名空间与导出：trait 名在类型命名空间、方法名在值命名空间；无模块头 = 全部导出
  （含方法），显式导出列表需 `Trait(..)` 才导出方法；实例按整个程序（flatten）参与
  搜索。
- 相等 / 比较的规则（证据驱动、无泛型兜底）见 [type-system.md](type-system.md)。

### 签名的 trait 约束

顶层签名可以写约束前缀（逗号分隔，与 instance 头 ctx 同一套语法）：

```vuna
describe : Show a, Eq a => a -> a -> String
describe x y = if x == y then show x else show x ++ "/" ++ show y
```

- `C a` 里的 `a` 不是新参数：它是签名自由小写名的隐式类型参数（见
  [type-system.md](type-system.md)）；约束另外生成隐式**字典参数**
  `{_ctx0 : Dict_C a}`（`Rig` 为 `RigOmega`，运行时保留），插在类型参数之后、显式参数之前。
- body 的方法调用优先命中声明的假设；签名没覆盖的刚性需求仍按旧规则提升成额外隐式
  参数（与不写约束的签名同一条推断路径，`mem : a -> L a -> Bool` 因此不变）。
- 调用点没有新语法：类型实参由统一解出，字典实参按实例搜索填充。
- 只支持顶层签名：`where` / `let`、`axiom`、trait 方法、构造子 / 记录字段写 `=>` 报
  `[PS_ConstraintUnsupportedHere]`（trait 方法约束是父类语义，未实现）。未声明接口头报
  `unknown interface <name>`；实参个数与 trait 参数个数不符报 `[TC_ConstraintNotDict]`；
  kind 不符报 `[TC_TypeMismatch]`。

## 字面量转换 trait（FromString / FromInt / FromFloat）

checking 位置的 `"..."` / `42` / `1.5` 在期望类型不是对应内建类型（`String` / `Int` /
`Float`；`Nat` 字面量仍展开成 `Zero`/`Succ` 链）时，会搜索 `FromString` / `FromInt` /
`FromFloat` 实例，命中就把字面量降级成 `fromString "..."` / `fromInt 42` /
`fromFloat 1.5`（找不到则回退，报通常的类型错误）。三者都是单方法 trait，且都随
`Prelude` 自动可见（`FromFloat` 由 `Base.Float` 导出）。

```vuna
data Email : Type where
  MkEmail : String -> Email
deriving (FromString)          -- 单构造子单字段、字段类型 String

main : String
main = case (MkEmail "x@y") of MkEmail s => s
```

`deriving` 只接受单构造子、单字段、字段类型正好是 `String` / `Int` / `Float` 的包装
类型（记录降级后同样适用）；多构造子/多字段/字段不匹配都报可解释错误。跨类型语义需手写
实例。完整语义与 interp/REPL 限制见 [floats.md](floats.md)。

## do、Monad 与 Functor

- 语法：`do` 块，语句是 `pat <- expr`（pat 只支持变量或 `_`）或裸表达式，最后一条
  必须是裸表达式；`a >>= f` 等价 `bind a f`，`a >> b` 等价
  `bind a (\_ -> b)`（顺序执行）。
- `do` 在 Loader 里 desugar 成 `bind` / lambda（Parser 保留 `EDo`，formatter 因此能
  还原 do 语法）：

  ```vuna
  import Base.Monad
  import Base.Maybe

  safeDiv : Int -> Int -> Maybe Int
  safeDiv a b = if b == 0 then Nothing else Just (a / b)

  main : Maybe Int
  main = do
    x <- safeDiv 10 2
    y <- safeDiv x 0
    pure (x + y)
  ```

- `Functor`（`fmap`）与 `Monad`（`bind`）在 `base/lib/Base/Monad.vuna`；`pure` / `liftA2` / `ap`
  在 `Base.Applicative`（`Base.Monad` 为兼容重导出它）。`Maybe` / `List` / `Result` / `IO` /
  `State` / `Reader` / `Error` 各有 `Functor` / `Applicative` / `Monad` 三个实例
  （`Eff r` 也有，见 [effects.md](effects.md) §8）。`Monad m` 的 `m` 是
  kind `* -> *`：trait 声明的类型参数可以当类型构造器应用（`m a`），实例 head 是
  类型构造器本身（`instance Monad Maybe`），kind 不符（如 `instance Monad Int`）在
  声明期报错。没有父类：`Monad` 不自动提供 `Applicative`，每个 monad 类型要写全三个实例。
- **`IO`** 是 `base/lib/Base/IO.vuna` 的抽象类型（构造器私有）；组合统一用
  `Functor` / `Applicative` / `Monad` trait 的 `fmap` / `bind` / `pure` / `liftA2`、`>>=` 与 `do`。IO 动作只在 `main`
  执行；`Base.IO.Host.runIO` 是唯一的 main 外入口、需要能力 `unsafe`（工具链与 `Base.ST` 用）。
  参数化效应 monad（`Base.State` / `Base.Reader` / `Base.Error`）与 ST 见
  [effects.md](effects.md)。
- **库内组合约定**：类型已有实例时，组合统一写 `do` / `>>=` / `>>` / `bind` / `pure` /
  `fmap` / `liftA2` / `ap` / `foldMap` / `mapM`，不再提供 `pureX` / `bindX` / `andThen` 这类重复入口
  （`Base.Result.andThen`/`mapResult`、`Base.Maybe.mapJust`、`Base.List.flatMap` 均已删除）。
  例外：`Base.ST` 因线性 bind 不声明 `Monad` 实例，保留 `bindST` / `bindST1` / `pureST` / `fmapST`；
  编译器内部 `Vuna.Compiler.Common.bind` 是固定类型的 `Result` 绑定（限定名调用，
  不是 base 公开 API；`andThen` 已删除，固定类型是内部实现选择）。`Eff` 的 `do` 已全面可用；长 do 链的精化指数
  已由单趟字典求解消除（20 步约 100ms）；期望类型定向与 do 块单 monad 均已落地。
### Applicative / Foldable / Traversable / Monoid / Hashable

- `Applicative`：三个方法 `pure : a -> f a`、`ap : f (a -> b) -> f a -> f b`、
  `liftA2 : (a -> b -> c) -> f a -> f b -> f c`，实例全部显式实现（vuna 无 default
  method）。B42 修复后实例方法体可以直接对 `f (a -> b)` 做 `case` / pattern match
  （此前误报 `TC_ImpossibleBranchIndex`，最小方法被迫用 `liftA2`、`ap` 只能派生）。
  `liftA2` 仍**不**作派生顶层函数：当前 codegen 的字典投影在 OCaml 侧没有类型标注
  （`dliftA2` 会被推断成 `('a, 'b -> 'c, 'c -> 'd -> 'c) t_Dict -> 'b -> 'd -> 'd -> 'c`
  这类签名），`pure` 的返回与 `ap` 的首参被错误统一，派生体在调用点直接 OCaml 类型错误；
  等投影带类型标注后再考虑。
  `Base.Monad` 重导出 `Base.Applicative`，`import Base.Monad` 仍能看到 `pure` / `ap` / `liftA2`。
- `Semigroup`（`mappend`）/ `Monoid`（`mempty`）：无父类，泛型代码同时写
  `Monoid m, Semigroup m =>`；方法名避开 `List.append` / `Map.empty`。
- `Foldable`（方法 `fold`）+ 顶层 `foldMap : Foldable t, Monoid m, Semigroup m => ...`；
  方法名不用 `foldr`，以免与自动注入的 `Base.List.foldr` 短名歧义。
- `Traversable t f`（双参数：容器 + Applicative）方法 `mapM : (a -> f b) -> t a -> f (t b)`；
  实例形如 `instance Applicative f => Traversable List f`。方法名不用 `traverse`，
  保留 `Base.Result.traverse`（List + Result 的具体组合子）。
- `Hashable`：`hash : a -> Int`，泛型 `HashMap` / `HashSet` 的键约束；用户类型可
  `deriving (Hashable)`（与 Show/Eq/Ord 同一套展开，复合字段用 `hashCombine`）。

- 效果 API 直接返回 IO：`print` / `println` / `readFile` / `writeFile` / `readLine` /
  `readDir` / `isDirectory` / `makeDir` / `removeFile` / `fileExists` / `getArgs` /
  `exit`（例如 `getArgs : IO (List String)`、`print : String -> IO Int`）；内部用
  不导出的 `prim_*` 原语。普通包只能经 `Base.IO` 使用效果；要在源码里直接调用
  `prim_*`，必须在 `vuna.toml` 声明 `[capabilities] effects`（见
  [primitives.md](primitives.md)）。
- 可执行包 / `vuna build` 要求 `main : IO a`；`vuna interp` 是纯核心求值，任何
  `main : IO a` 一律报错。`vuna test` 的纯 `String` / `Int` / `Bool` 测试走核心求值，
  `main : IO ...` 走 compile + 运行；REPL 的 IO 表达式经临时包 compile + 运行。
- 实现：`Elab/Dict`、`Elab/Trait`、`Elab/Derive`；降级与字典编码在
  [core.md](core.md)。
