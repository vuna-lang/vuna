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
- **字段名在 flatten 后的整个程序里必须唯一**：`EField` 按字段名查记录（`recordsWithField`），
  同名多声明报 `ambiguous field`；新增 record 的字段名请带类型前缀。
- 编译器/stdlib 内部单构造器产品类型用 `record` + 字段访问取代「data + 位置访问器」；
  只有需要作为函数值传递（`map acc`）或参与终止性投影（递归实参）的投影才保留为访问器，
  因为无签名 lambda 没有参数类型推断、字段访问在其中不可类型化。
- 导出遵循模块规则：`T` 只导出记录类型（构造器隐藏，跨模块不能构造 / 模式匹配，即
  抽象），`T(..)` 才公开记录构造器。
- 实现上记录在精化前降级为单构造器 `data`（`Elab.Records`）：构造 = 构造器应用，
  字段访问 / 更新 = 内联 `case`，所以核心求值器与 codegen 行为一致。
- 字段访问 / 更新的 base 类型必须可推断；推断不出时报
  `cannot resolve record type ... add a type signature`，给函数参数补类型签名即可。
- 错误：缺字段 / 重复字段 / 未知字段 / 非记录类型；记录支持 `deriving (Show, Eq, Ord)`。

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
  默认方法、父类、关联类型归 F4（[roadmap.md](../roadmap.md)）。
  每个参数的 kind 可显式写：`trait C (a : Type) (r : Row) where ...`；未写时从方法签名
  推断（参数被应用 k 次即 `Type -> ... -> Type`，否则 `Type`）。空参数表报
  `[TC_InterfaceNoParam]`。非 Type 类参数（如 `Row`）的实例搜索已支持；但**头可合一的重叠实例
  仍被 coherence 拒绝**（`Member e (Cons e r)` 与 `Member e r => Member e (Cons x r)`），
  因此 trait 版 `Member e r` 仍不可用（见 debt D39）。
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
- **blanket 实例是 fallback（M36）**：head 实参是裸类参数（全部 tele 都是类参数）的实例
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

- **参数化 `deriving (Show, Eq, Ord)`**：按 data 的每个类型参数生成 ctx（形态是约束
  实例 `instance Eq a => Eq (F a)`）；`Show` 要求字段可 show。`mem (Box 1) [...]`
  这类需要 `Dict_Eq (Box Int)` 的用法因此可用。
- **顶层函数签名也可以写约束（M32）**：`f : Eq a, Show a => a -> String`。约束是定义体的
  字典假设（隐式字典参数，`Rig` 是 `RigOmega`，运行时保留），body 的方法调用优先命中
  它；调用点仍按实例搜索补字典。
  不写约束的形态仍按推断提升（`{a} -> {d : Dict_Eq a} -> ...`）；三包源码自本轮起
  统一写显式约束，不再依赖该旧形态。语法与边界见 [language.md](language.md) §签名的 trait 约束。
- **`Show` / `Eq` / `Ord` 是库里的普通 trait（M31.1 起声明与实例分离）**：声明在
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

### 签名的 trait 约束（M32）

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
  `[PS_ConstraintUnsupportedHere]`（trait 方法约束是父类语义，归 F4）。未声明接口头报
  `unknown interface <name>`；实参个数与 trait 参数个数不符报 `[TC_ConstraintNotDict]`；
  kind 不符报 `[TC_TypeMismatch]`。

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

- `Functor`（`fmap`）与 `Monad`（`bind` / `pure`）在 `base/lib/Base/Monad.vuna`；
  `Maybe` / `List` / `IO` 各有 `Functor` / `Monad` 实例。`Monad m` 的 `m` 是
  kind `* -> *`：trait 声明的类型参数可以当类型构造器应用（`m a`），实例 head 是
  类型构造器本身（`instance Monad Maybe`），kind 不符（如 `instance Monad Int`）在
  声明期报错。
- **`IO`** 是 `base/lib/Base/IO.vuna` 的抽象类型（构造器私有）；组合统一用
  `Functor` / `Monad` trait 的 `fmap` / `bind` / `pure`、`>>=` 与 `do`。IO 动作只在 `main`
  执行；`Base.IO.runIO` 是唯一的 main 外入口、需要能力 `unsafe`（工具链与 `Base.ST` 用）。
  参数化效应 monad（`Base.State` / `Base.Reader` / `Base.Error`）与 ST 见
  [effects.md](effects.md)。
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
