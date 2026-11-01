# 语言参考：记录、trait 与 do/Monad

本文覆盖 core-v0 之上的表达力：记录类型、trait 与实例、`do` 与 `Monad` / `Functor`。
基础语法与模块系统见 [language.md](language.md)，标准库模块清单见 [stdlib.md](stdlib.md)。

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
- 实现上记录在类型检查阶段降级为单构造器 `data`：构造 = 构造器应用，字段访问/更新 =
  内联 `case`，所以解释器与 typed codegen 行为一致；
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

- 上面的 `main : String` 是 `vuna interp` / `vuna test` 的调试约定；可执行包
  （`vuna build` / `--split`）要求 `main : IO a`（M12.6）。
- trait 只支持单参数；default 实例按 (trait, 类型) 全局唯一（flatten 时检查，
  重复报 `duplicate instance`）；命名实例不自动参与解析，只能用 `@name` 选择
  （可 `@M.name`，M 需已导入）；trait 与类型都不在本模块定义时禁止写 default，
  必须命名（孤儿规则）；
- `deriving (Show, Eq)` 生成 default 实例：`Show` 只支持非参数化类型且字段可 show，
  `Eq` 支持参数化类型；derive 与手写同名 default 冲突报 `duplicate instance`；
- 内置 trait：`Show`（`show`）、`Eq`（`eq` / `neq` 对应 `==` / `/=`）、`Ord`
  （`lt` / `le` / `gt` / `ge` 对应 `<` / `<=` / `>` / `>=`）；运算符在类型确定时
  静态派发到实例方法。内建/结构回退：`Eq` 覆盖 data/record/`List`；`Show` 覆盖
  `Int` / `String` / `Bool` 与非参数化 data/record；`Ord` 的运行时内建回退只覆盖
  `Int` / `String` / `Bool`（`Int` 用原生比较，`String` / `Bool` 走运行时结构比较，
  typed 路径用 OCaml 结构比较），其它类型报 `no instance Ord ...`；
- 实现（M10.5c）与限制：具体类型的调用点仍走**静态派发**；当方法调用点类型是
  **裸类型变量**时（如 `showIt x = show x`）做**方法级字典穿参**——类型检查给该函数
  增加方法函数参数（字典按 trait 方法扁平化），调用点静态传入具体实例方法或调用者的
  字典参数，支持跨函数传播、前向引用与递归；例如 `data Dummy deriving (Eq)` 加
  `showIt x = show x` 是合法程序（调用 `showIt 42` / `showIt "s"` 时分别传入对应
  `show` 实现）。`Eq` / `Ord` 在类型无法确定时（含 `List a` 等结构化泛型）仍回退到
  运行时结构比较（typed 用 OCaml 结构比较，interp 用 value 结构比较）；
  `Show` / 用户 trait 的结构化泛型（如 `show (List a)`）仍不支持（只有裸类型变量
  支持字典穿参）并报错；**高阶 kind**（`Ty.TApp` + kind 元数）与**一般约束泛化**
  （trait 参数本身是类型构造器变量，如 `Monad m` 的字典穿参）已在 M11 实现；
  default 实例的可见性目前按整个程序（flatten）计算，未做 import 图级细化；
- 求值与降级触发：只有程序里出现 trait / instance / deriving 声明（或记录等需要降级
  的语法）时，`vuna interp` 才会先类型检查 + 降级；普通程序保持 legacy 直接求值
  （不检查，作为 `--no-typecheck` 删除后的调试入口）。typed 路径始终按 M10.5 规则
  检查（裸类型变量 `show` 可经字典穿参，结构化泛型 `show` 仍报错）；上面的
  `Eq` / `Ord` 结构回退同样只在触发降级后生效；
- 命名空间与导出：trait 名在类型命名空间、方法名在值命名空间；无模块头 = 全部导出
  （含方法），显式导出列表需 `Trait(..)` 才导出方法；命名实例名按普通值名导出/限定
  （显式列表里可写 `fancy`，app 侧用 `@M.fancy` 选择）；
- 迁移：`==` / `/=` / `<` / `<=` / `>` / `>=` 由 `Eq` / `Ord` trait 承担（删除旧的
  `specializeCmp` 特化）；Show 由 typed codegen 按程序 data 声明生成。

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
  可执行包/`vuna build` 要求 `main : IO a`；`vuna interp`/`vuna test` 仍保留
  “显示纯 main 结果”的调试约定，但入口代码里同样不能直接调用 effectful 内建。
