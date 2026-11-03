# 语言参考：记录、trait 与 do/Monad

本文覆盖 core-v0 之上的表达力：记录类型、trait 与实例、`do` 与 `Monad` / `Functor`。
基础语法与模块系统见 [language.md](language.md)，标准库模块清单见 [stdlib.md](stdlib.md)。

## 宇宙与 kind（M28 已定：严格分层、非累积）

- **规则**（决策见 [roadmap](../roadmap.md) M28）：严格分层、非累积。
  `Type i : Type (i+1)`；Pi formation 取 `max(i, j)`；`Type i` 与 `Type j`（`i ≠ j`）
  **不相等**；**没有** subtyping / cumulativity（不做 `Type i ≤ Type j` 的自动提升），
  `Type : Type` 仍被拒绝。唯一的层级流动是「显式写出更小的宇宙」：`Type 0` 可以赋给
  `Type 1` 的签名（因为 `Type 0` 的**类型**就是 `Type 1`），反过来不行。
- **data kind**：`data F : <kind>` 的 kind 必须是「Pi 链 → `Type l`」，`l ≥ 0`；
  族层级就是 kind 末尾的 `l`（如 `data Vec : Type -> Nat -> Type` 的族层级是 0）。
  kind 里每个 binder 的域必须是**类型**（宇宙、索引归纳族、类型变量、Pi 链等）。
  不以宇宙收尾的 kind 报 `TC_DataKindArrows`。
- **构造子字段**：构造子类型 `... -> F r1..rk` 的 binder 里，**前 arity 个**是族参数 /
  索引（不受层级限制，**大参数合法**），其余是字段。每个字段 binder 的域 sort 必须
  `≤ 族层级`（`Type i : Type (i+1)`，字段比族大就是宇宙不一致）；违反报
  `TC_CtorError`：`field #k: its type sorts into Type i, above the family level Type l`。
  检查在**表面类型表达式**上逐段做（`checkType` 取每个域的 sort，带 binder 进入
  `Ctx`，依赖字段因此按正确上下文计算）。
- 正/反例：

  ```vuna
  -- 合法：字段 `Type` 的 sort 是 1，族住在 Type 1
  data D : Type 1 where
    Mk : Type -> D

  -- 合法：普通字段的 sort 都是 0，族住在 Type 0
  data Holder : Type where
    MkH : Int -> String -> Holder

  -- 合法：`a : Type 1` 是族参数（arity 内），不受字段层级限制
  data Big : Type 1 -> Type where
    MkBig : (a : Type 1) -> Int -> Big a

  -- 非法：字段 `Type` 的 sort 1 > 族层级 0
  data Bad : Type where
    MkBad : Type -> Bad        -- TC_CtorError（`Type 0` 同样被拒）

  -- 非法：kind 不以宇宙收尾
  data Bad2 : Type -> Int where
    MkBad2 : Bad2              -- TC_DataKindArrows
  ```

  这三个反例分别锁定在 `test/corpus/dt_err/40_universe_{field,field0,kind}`，
  正例在 `test/corpus/dt/57_universe`；非累积由
  `test/corpus/dt_err/40_universe_cumulativity`（`bad : Type; bad = Type 0` 被拒）锁定。
- **既有夹具的调整**：`test/corpus/dt/45_ctor_shape` 原来用
  `data Proxy : Type where MkProxy : (t : Type) -> Proxy` 覆盖「显式宇宙域字段（擦除）」；
  该声明按严格分层不成立（`Type` 的 sort 是 1），夹具改成 `data Proxy : Type 1`，
  覆盖点与输出不变。显式宇宙域字段本身仍然合法，只要族的层级住得下。
- **已知边界**：`Type i` 的显示不带 level（`Type 0` 与 `Type 1` 都打印成 `Type`），
  所以非累积的 `TC_TypeMismatch` 文案目前是 `expected Type, got Type`——拒绝正确、
  文案待 Core 的显示层补层级（不阻塞本阶段规则）。没有宇宙多态：族参数按
  `Type 0` 落地（`data List a : Type` 的 `a`），索引可用更大层级的类型。
- 实现位置：`Elab/Meta.kindWellFormed`（kind 形状 / 层级）、`Elab/Data.elabCtor` +
  `checkCtorFieldSorts`（字段层级）。

## 记录类型（M10.5）

- 声明：`record Point where` 后跟缩进的字段列表，字段写作 `x : Int`；记录可以参数化
  （`record Pair a b where`），记录类型名同时是它的构造器名；
- 构造、访问、更新与模式：

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

  字段访问写作 `p.x`，支持链式（如 `s.start.x`）；
- 实现上记录在类型检查阶段降级为单构造器 `data`（DT 路径由 `Elab.Records`（原
  `DtRecords`）做同样的降级，M23 起含 record update 与参数化 record）：构造 = 构造器
  应用，字段访问/更新 = 内联 `case`，所以核心求值器与 codegen 行为一致；
- 字段访问/更新的 base 类型必须可推断；推断不出时报
  `cannot resolve record type ... add a type signature`，给函数参数补类型签名即可；
- 导出遵循模块规则：`T` 只导出记录类型（构造器隐藏，跨模块不能构造/模式匹配，即抽象），
  `T(..)` 才公开记录构造器；
- 错误：缺字段（`missing field`）、重复字段（`duplicate field`）、未知字段
  （`unknown field`）、对非记录做字段访问/更新（`not a record type`）；
- 记录支持 `deriving (Show, Eq)`（`Show` 要求非参数化记录且字段可 show，`Eq` 支持
  参数化记录）；记录字段访问/更新在 base 类型未定时报错。

## trait 与实例（M10.5）

- 语法：

  ```vuna
  trait Pretty a where
    pretty : a -> String

  data Color : Type where
    Red : Color
    Blue : Color
  deriving (Show, Eq)

  instance Pretty Color where          -- 未命名实例 = default（相干默认）
    pretty c = case c of
      Red => "red"
      Blue => "blue"

  instance Pretty Color as fancy where -- 命名实例
    pretty c = "fancy"

  main : String
  main = pretty Red ++ "/" ++ pretty @fancy Blue ++ "/" ++ show Red
  ```

- 上面的 `main : String` 是 `vuna test` / 纯 `vuna interp` 的调试约定；可执行包
  （`vuna build`）要求 `main : IO a`（M12.6）。`vuna interp` 走 DT 核心
  求值，任何 `main : IO a` 一律报错（见 [limits.md](limits.md)）。
- trait 只支持单参数；default 实例按 (trait, 类型) 全局唯一（重复报
  `duplicate instance`，含 `deriving` 生成的实例）；
  命名实例不自动参与解析，只能用 `@name` 选择（可 `@M.name`，M 需已导入）；
  trait 与类型都不在本模块定义时禁止写 default，必须命名（孤儿规则）；
- `deriving (Show, Eq, Ord)` 生成 default 实例：`Show` 只支持非参数化类型且字段可
  show，`Eq` 支持参数化类型，`Ord` 支持可比较类型；derive 与手写同名 default 冲突报
  `duplicate instance`；实例里出现 trait 未声明的方法报
  （`instance has unknown method`）；
- **`Show` / `Eq` / `Ord` 是库里的普通 trait（M24.7）**：声明、方法投影与
  `Int` / `String` / `Bool` 实例都在 `Base.Show` / `Base.Eq` / `Base.Ord`，包上下文内所有
  源文件（含 ad-hoc 单文件）随自动注入的 `Prelude` 可用；显式 `import` 仍可覆盖/补充。
  `show` / `eq` / `lt` 等短名不再由编译器放行，必须经
  import 解析。`deriving` 的展开用 Loader 解析后的完整类名（如 `Base.Show.Show`）。
- **结构回退**：`==` / `/=` 在**具体类型**且没有可用 `Eq` 实例时退回运行时结构比较
  （`bi_eq_generic`，核心求值器/擦除 codegen 同一语义）；程序里没有 `Eq` 类可见
  （只可能发生在显式绕开 `Prelude` 的上下文）时同样退回。比较发生在**刚性类型变量**上时保持 M22 语义——
  搜不到实例时提升成隐式字典参数（`deferEqDict`），实例（含 `deriving (Eq)` 生成的）
  仍优先。`<` / `<=` / `>` / `>=` 对 `Int` 做运行时特化、`String`/`Bool` 走泛型
  运行时，其它具体类型（含用户 `data`）走 `Ord` 字典、无 `Ord` 类时退回泛型比较。
  `deriving (Eq)` 的行为不变。
- 实现（M10.5c）与限制：具体类型的调用点仍走**静态派发**；当方法调用点类型是
  **裸类型变量**时（如 `showIt x = show x`）做**方法级字典穿参**——类型检查给该函数
  增加方法函数参数（字典按 trait 方法扁平化），调用点静态传入具体实例方法或调用者的
  字典参数，支持跨函数传播、前向引用与递归；例如 `data Dummy deriving (Eq)` 加
  `showIt x = show x` 是合法程序（调用 `showIt 42` / `showIt "s"` 时分别传入对应
  `show` 实现）。`Eq` / `Ord` 在类型无法确定时（含 `List a` 等结构化泛型）仍回退到
  运行时结构比较；
  `Show` / 用户 trait 的结构化泛型（如 `show (List a)`）仍不支持（只有裸类型变量
  支持字典穿参）并报错；**高阶 kind**（`Ty.TApp` + kind 元数）与**一般约束泛化**
  （trait 参数本身是类型构造器变量，如 `Monad m` 的字典穿参）已在 M11 实现；
  default 实例的可见性按整个程序（flatten）计算，未做 import 图级细化；
- **求值与降级**：`vuna interp` 一律先经 DT 精化（`Elab.Records` / `Elab.Derive` 做
  记录、trait、deriving 降级；原 `DtRecords` / `DtDerive`），再用核心求值器求 `main`
  的值；类型/覆盖性错误在求值前报出。`vuna test` / `vuna repl` 与 `interp` 共用同一
  核心求值器；
- 命名空间与导出：trait 名在类型命名空间、方法名在值命名空间；无模块头 = 全部导出
  （含方法），显式导出列表需 `Trait(..)` 才导出方法；命名实例名按普通值名导出/限定
  （显式列表里可写 `fancy`，app 侧用 `@M.fancy` 选择）；
- 实现：`==` / `/=` / `<` / `<=` / `>` / `>=` 由 `Eq` / `Ord` trait 承担（删除旧的
  `specializeCmp` 特化）；trait 字典名与方法投影名从类表按短名取（M24.7 起不硬编码
  `Dict_Eq` / `eq`）。`deriving (Show)` 的展示体按构造子骨架生成（record 用源名、
  String 带引号），方法调用走库里的 `show` 投影。

## do、Monad 与 Functor（M11）

- 语法：`do` 块，语句是 `pat <- expr`（pat 只支持变量或 `_`）或裸表达式，
  最后一条必须是裸表达式；`a >>= f` 等价 `bind a f`，`a >> b` 等价
  `bind a (\_ -> b)`（顺序执行）。
- `do` 在 **loader** 里 desugar 成 `bind` / lambda（parser 保留 `EDo`，formatter
  因此能还原 do 语法）：

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
  `Maybe` / `List` / `IO` 各有 default 实例。`Monad m` 的 m 是 kind `* -> *`：
  trait 声明的类型参数可以当类型构造器应用（`m a`），实例 head 是类型构造器本身
  （`instance Monad Maybe`），kind 不符（如 `instance Monad Int`）在声明期报错。
- 一般约束泛化：签名里出现高阶类型变量（如 `bindPair : m a -> m b -> m (Pair a b)`）
  时，类型检查自动给函数加方法级字典参数；调用点按实际类型静态派发或继续穿参。
- `do` 对 `Maybe` / `List` / `IO` 都生效。`IO` 是 `base/lib/Base/IO.vuna` 的抽象类型
  （构造器私有）；组合统一用 `Functor` / `Monad` trait 的 `fmap` / `bind` / `pure`、
  `>>=` 与 `do`，不再导出 `bindIO` / `pureIO` / `fmapIO`。效果 API 直接返回 IO：
  `print` / `println` / `readFile` / `writeFile` / `readLine` / `readDir` /
  `isDirectory` / `makeDir` / `removeFile` / `fileExists` / `getArgs` / `exit`
  （例如 `getArgs : IO (List String)`、`print : String -> IO Int`）；
  内部实现用不导出的 `prim_*` 原语。
  **没有公开的 `runIO`/`unsafeRunIO`**：IO 动作只能由运行时在 `main` 处执行。
  可执行包/`vuna build` 要求 `main : IO a`；`vuna interp`/`vuna test` 保留
  “显示纯 main 结果”的调试约定，但 interp 是纯核心求值——效果不会真正执行，
  **任何 `main : IO a` 一律报错**（只展示 `Int`/`String`/`Bool`），需要效果时用
  `compile` + 运行产物；入口代码在**未声明能力**时不能直接调用 effectful 内建（声明
  `[capabilities] effects` 后可以，见 [primitives.md](primitives.md)）。
