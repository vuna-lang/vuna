# 语言参考：core-v0（语法与模块系统）

本文是 vuna 语言 core-v0 的语法与模块系统参考。类型规则（宇宙、索引族、依赖匹配、相等、
擦除）见 [type-system.md](type-system.md)；记录 / trait / `do` 见
[records-traits.md](records-traits.md)；包管理与工具链命令见 [packages.md](packages.md)。

## core-v0 语法

- 类型：`Int` / `String`（语言 primitive 类型）、`data` 声明的代数数据类型、函数；
  类型签名参与精化，运行时是否保留由擦除判据（`Rig`）决定；
- 语法：Idris2 风格 `data ... where`、多子句函数、顶层 `axiom` 声明（无体 / 不透明）、
  `case ... of`、`let ... in`（绑定块可选签名行）、lambda、`if then else`、`do` 块、
  整数 / 字符串 / 浮点字面量（`digits.digits`；见 [floats.md](floats.md)）、`[..]` 与 `x :: xs` 列表糖、中缀 / 反引号中缀 / section / 用户符号名运算符；
- **类型表达式里的字面量**：签名、族 kind、构造子索引里可以用 `Int` / `String` 字面量
  （`Vec 3 a`、`Reader "books" Int`）；只放行这两种（其它字面量，包括浮点，报
  `invalid type expression`）。规则见 [type-system.md](type-system.md)。
- **列表字面量（运行时效应用法）**：`[Fetch]` / `[Fetch, Log]` / `[]` 在**期望 kind
  为 `Row`** 的位置分别展开为 `Base.Eff.Row.Cons Fetch Nil` /
  `Cons Fetch (Cons Log Nil)` / `Nil`；普通列表字面量（期望 `List a`）走同一套按族
  展开的规则。例：`String -> Eff [Fetch] String`。构造数据时优先写 `[..]`：
  `vuna lint --fix` 的 `list-literal` 规则会把表达式/类型位置的闭合 `::` / `Cons` 链
  与裸 `Nil` 归一为列表字面量；模式匹配里的 `::` / `Cons` 保持原样。
- **模板字符串与多行字面量**："hi ${name}" 插值、"""...""" 多行（内容逐字，
  只丢开引号后的一个换行）；洞降级成 `Base.Interp.interp` 调用，转换语义由 `Interp`
  实例决定。规则、转义 `\$`、边界见 [templates.md](templates.md)；
- **运算符 = 有 fixity 的普通名字**：`a op b` 与 `op a b` 同义，`` a `f` b `` 与 `f a b` 同义，
  运算符不拥有独立语义；parser 不做优先级（中缀链收成右嵌套中间节点），`Loader.Fixity` 按
  模块可见 fixity 表重排。fixity / 别名的**唯一来源**是 `infixl N op` / `infixr N op` /
  `infix N op` 声明（可选 `= 目标名`，如 `infixl 4 == = eq`），优先级 0–9。没有内建运算符表：
  符号运算符用于中缀却无声明是**错误**；`->` 是语法，由 Loader 语法表恒可见。库声明表、
  可见闭包去重与 fmt 程序级 fixity 见 [operators.md](operators.md)；
- **`record` / `data` 派生**：都可跟 `deriving (C...)` 或 `deriving via field (C...)`。
  后者要求包装是自动去装箱的单字段类型，并在实例搜索期把 `Dict_C Wrapper` 委托给
  `Dict_C Field`；class 集合是开放的，由底层类型有没有该实例决定，不限于 Show/Eq/Ord。
  `record` 在精化前降级为单构造器 `data`。详细语法、记录更新 / 模式与委托边界见
  [records-traits.md](records-traits.md)；
- **自动去装箱**：单字段 record / 单构造器单运行时字段的 data 在 codegen 中表示为
  字段类型的 OCaml 类型别名（没有构造子、没有变体）；这是声明级表示选择，不改变类型检查
  与 `deriving` 语义。判据与边界见 [records-traits.md](records-traits.md) §零成本表示；
- layout：offside 规则；顶层声明、`data` 构造器块、`case` 分支、`let` 绑定按块列对齐，
  表达式跨行必须缩进超过所在块列；
- `main` 必须是零参数定义；展示由编译器钩子完成（`Int` / `Nat` → 十进制、`String` →
  `strShow`、`Bool` → `True` / `False`）。`show` 是 `Base.Show` 的 trait 方法，不是 `main`
  的展示钩子。`vuna interp` 只展示 `Int` / `Nat` / `String` / `Bool` 的 `main` 值（interp
  是精化后的纯核心求值，归约边界见 [primitives.md](primitives.md)）；
- 内建值（`Vuna.Compiler.Intrinsics.allIntrinsics` 里用户可见的项）：`+ - * /`、
  `&& ||`、`++`、`strFromInt` / `strUnpack` / `strPack` /
  `strLength` / `strConcatMany` / `strSubstTemplate` / `strHash` / `strAt` / `strShow`、
  `timeUs`。宽度、编码、转义与 interp 边界见 [primitives.md](primitives.md)；
- **运算符 = 方法别名**：`==` / `/=` / `<` / `<=` / `>` / `>=` 不是内建值，
  而是 `Base.Eq` / `Base.Ord` 的方法（`eq` / `neq` / `lt` / `le` / `gt` / `ge`）的
  **别名**（fixity 与别名由库模块里的 `infixl ... = ...` 声明提供，`Loader.Fixity` 在重排时
  替换）。`a == b` 与 `eq a b` 同义，Int / String 上由内建实例特化，其它类型走 `Eq` / `Ord`
  字典。trait 声明与实例的落点规则见 [operators.md](operators.md)；
- 效果原语**只有 `prim_*` 名**（`prim_print` / `prim_readFile` / `prim_getArgs` /
  `prim_getenv` / …）：用户经 `Base.Host` 的 IO 动作使用，或在 `vuna.toml` 用
  `[capabilities].effects` 声明能力后直接调用；见 [primitives.md](primitives.md) 的
  效果原语与能力一节；
- `&&` / `||` 短路求值：先求左操作数，左侧能决定结果时不求值右侧（核心求值器与 codegen
  一致）；
- `where` 子句：函数体后可跟缩进的 `where` 块；绑定块（`let` 与 `where` 同一套模型）是
  **顺序作用域 + 可选签名**，其中 `where` 块要求每个绑定写显式签名；见下节；
- 类型身份：`Int` / `String` 是语言 primitive 类型；`IO` 是语言内建效应类型（
  kind `Type -> Type`，无构造器）；`Bool` / `List` / `Nat` 是 base 的普通 `data` 声明
  （canonical 身份 `Base.Bool.Bool` / `Base.List.List` / `Base.Nat.Nat`，经自动注入的
  `Prelude` 可见）。用户写同名 `data` 是普通声明，不与 canonical 冲突（`IO` 例外：
  ad-hoc 入口重定义报错）。
  `True` / `False` / `Cons` / `Nil` 与其他构造子一样**按声明身份**解析，没有「内建全局
  构造子放行」；身份规则见 [primitives.md](primitives.md)。

## `let` / `where` 绑定块与显式签名

`let` 与 `where` 共用同一套**绑定块**模型（顺序作用域 + 可选签名），实现只有一份
（parser 的 `parseBindingItemsAt` / `bindingItemsToBinds`，Elab 的 `checkBindingSigs`）：

```vuna
f : Int -> Int
f x = g x where
  h : Int -> Int
  h y = y * 2

  g : Int -> Int
  g y = h y + 1

g : Int
g =
  let
    k : Int
    k = 3

    addK : Int -> Int
    addK x = k + x
  in addK 4
```

- 两种记法只差一条约束：**`where` 块每个绑定必须写签名行**（缺签名报
  `[TC_WhereNeedsSig] where binding ... needs a type signature`）；`let` 块的签名行可选，
  但**只有值 / 通配 / 模式绑定（`pat = expr`）可以省**——函数子句（含多子句模式匹配）
  没有签名时落成待推断的 lambda，没有可检查的期望类型，精化期报
  `[TC_LambdaNoSignature]`，因此函数子句要写完整签名；
- 两种子句形态都支持：`pat = expr` 与函数子句 `name pats = expr`；
- **局部多 clause 函数**：同一名字的**相邻**多条子句合并成一个局部函数（`where` 与
  `let` 都支持），参数是任意模式（构造子 / 字面量 / 记录 / 变量），匹配语义与顶层函数
  子句一致（编译期走 `Elab.Match` 的模式矩阵，穷尽性同 `case`）；
  - 一条签名行覆盖该名字的**全部**子句（签名写在第一条子句之前）；非相邻的同名子句仍报
    `[PS_WhereSigMultiClause]`；
  - 局部函数仍是**顺序作用域**：不能自递归 / 互递归；需要递归时放到顶层定义组。

  ```vuna
  main : Int
  main = pick (Succ Zero) Zero where
    pick : Nat -> Nat -> Int
    pick Zero _ = 1
    pick (Succ _) Zero = 2
    pick (Succ _) (Succ _) = 3
  ```

- **`let` 模式解构**：`let` 绑定左端可以是构造子 / 记录 / 字面量模式（不再只允许简单名 /
  通配）。语义等价单分支 `case`：模式必须不可失败（穷尽），否则报
  `[TC_NotExhaustive] case is not exhaustive: missing ...`；模式绑定出的变量在后续绑定与
  `in` body 中可见。

  ```vuna
  main : Int
  main =
    let
      MkPoint x y = MkPoint 40 2
    in x + y
  ```

- 签名写在同名子句**之前**；悬空签名 / 重复签名 / 缩进越界都是 `PS_` 前缀的明确诊断：

  ```text
  [PS_WhereSigNoDef] binding signature for `g` has no definition
  [PS_WhereSigDuplicate] duplicate binding signature for `g`
  [PS_WhereSigBeforeClause] binding signature for `g` must come before its clause
  [PS_WhereSigMultiClause] binding `g` has more than one clause; a signature can annotate only one
  [PS_UnexpectedIndentInBinding] unexpected indentation in a let/where binding block
  ```

  （`PS_WhereSigMultiClause` 只对**非相邻**同名子句报；相邻子句合并成局部多 clause 函数。）

- 有签名的绑定按签名以 checking 模式精化（先检查签名是合法类型，再按该类型检查值），
  因此不需要推断无签名 lambda 的类型；无签名绑定走推断；
- 绑定块是**顺序作用域**：每个绑定只能引用它**之前**的绑定，不支持前向引用、自递归或
  互递归（递归放进顶层定义组，顶层定义组支持互递归 / 自递归 / 前向引用）；
- `where` 绑定的名字只在该函数体内可见（不导出、不参与模块导出列表），与顶层定义同名时
  以局部绑定为准；`let` 绑定同理只在该表达式内可见；
- `vuna fmt` 保留签名行并按「签名行 + 子句」输出（let 与 where 都幂等），缩进 2 空格。

## `axiom` 声明

`axiom name : Ty` 声明一个**无体 / 不透明**顶层：

```vuna
axiom t : Type
axiom step : t -> t

idT : t -> t
idT x = x
```

- axiom 是**擦除 / 类型层**定义：只参与类型检查与类型层计算，codegen 不生成运行时定义
  （`DtAxiom`，没有定义体）；
- 类型层引用合法（上面的 `t` 作类型常量、`step` 作类型层值）；签名里的自由小写名与普通
  签名一样量化为隐式类型参数（`axiom anyEq : a -> a` 等价 `{a : Type} -> a -> a`）；
- 运行时位置使用 axiom 是硬错误（`check` 与 `compile` 同一条诊断）：
  `[CG_AxiomAtRuntime] axiom ... cannot be used at runtime (it has no runtime definition)`；
- axiom 是普通顶层声明：名字自动 mangle、`_` 前缀私有、可进模块导出表；同一名字不能再
  有定义体（`[TC_AxiomWithDefinition]`），也不能重复声明；
- `axiom` 是保留关键字；当前编译器自身不用 axiom（旧 seed 必须能编译新源码）。

## 签名的 trait 约束

顶层签名可写约束前缀（`f : Eq a, Show a => a -> String`）；语义、绑定顺序、诊断与边界见
[records-traits.md](records-traits.md)。约束只允许在顶层签名上，其它位置写 `=>` 报
`[PS_ConstraintUnsupportedHere]`。

显式隐式 binder 可以写在约束之前（`{a b : Type} -> Convert a b => a -> b`）：同一
binder 组内的多个名字展开成嵌套 Pi，解析器把这段 Pi 前缀搬到返回类型上，约束本身仍是
`C a b`。多名字 binder 同样适用于普通 `(x y : T) -> ...` / `{x y : T} -> ...` 形态。

## 源码写法惯例（现代形态）

vuna/base/compiler 三包源码统一按当前语言能力书写，新增/修改代码沿用：

- **签名不写可量化的类型参数**：自由小写名由精化器量化为隐式参数（`vhead : Vec n a -> a`
  等价 `{a : Type} -> ...`）；纯索引写 `{n : Nat} ->`，子句与调用点不再手写该参数；
- **trait 约束显式**：泛型函数依赖 Eq/Ord/Show 字典时在顶层签名写 `Eq a =>`，
  不依赖 body 里 `==` 的隐式字典提升；
- **Bool 不做字面量搬运**：`if c then True else False` 写 `c`，`if c then e else False` 写
  `c && e`，`not (a == b)` 写 `a /= b`；单簇 helper 用 `Base.Bool.not`，不再自建；
- **单构造器类型用 `record` + 字段访问**：位置访问器在有高阶使用（`map acc`）或终止性
  投影处保留为函数，其余调用点写 `x.field`；
- **模块头显式导出列表**：不写「省略 = 全导出」的 v0 形态（空导出写 `()`）。

## 函数定义与 η 展开

定义子句的参数可以少于签名：剩余 Pi 链按 **η 展开**自动补参数（`\_arityN`，body 应用到
这些新参数），所以 `f : Int -> Int` 配 `f = inc` 合法；参数**多于**签名仍报
`[TC_DefMoreParams]`。多 clause 与 where 绑定共用同一条精化路径，行为一致。

## 洞（`_` / `?name`）

表达式（check 位）可以留洞：匿名 `_`，或命名洞 `?name`（`?` 与标识符**紧邻**，不隔空格）。
洞在精化时变成目标（goal）；`vuna goal` / LSP hover 报位置、目标类型与作用域内可见的绑定
（名字 + 类型），未解的洞在 `check` / `compile` / `build` 时报 `TC_UnsolvedHole`
（命名洞的诊断带洞名）。

- 洞必须有**期望类型**（check 位）：`f = ?goal` 这类推断位报 `TC_HoleNoExpectedType`，
  与 `_` 一致；
- 洞只在表达式位置：模式位置报 `ExpectedPattern`，类型位置按未绑定名报错；
- 同一个 `?name` 出现多次是**互相独立的洞**（不按名字共享求解）；
- `?` 只有紧邻标识符时才是洞；要写 `?` 运算符的中缀 / section 用空格分隔
  （`a ? b`、`(? b)`），`(?h)` 是括号内的命名洞；
- 洞不进索引：`vuna map` / references 不把洞名当引用。

## `case` 分支与模式

`case e of` 的每个分支左端是模式：构造子模式（可嵌套，如 `Cons x (Cons y ys)`）、
`Int` / `String` 字面量模式、变量或通配。分支按书写顺序匹配，因此：

- **as-pattern**：`x@pat` 匹配 `pat` 并把整个匹配值绑定到 `x`（Idris2 风格；`_@x` 等价于
  `x@_`）。可用于顶层 / 局部函数子句的参数与嵌套模式位置，如
  `advance (PState file toks@(t :: rest) last count) = ...`；带参数的内层模式需括号
  （`x@(t :: rest)`），变量 / 字面量 / 0 元构造子不需要（`x@True`、`x@42`）。
  编译期由模式矩阵注入绑定（`Elab.Match`）；STR 把 as 绑定视为整个值（不改变结构下降）。
  `case` 分支左端也支持 as-pattern（`case xs of y@(t :: rest) => ...`），desugar 为
  `let` 绑定；scrutinee 是纯表达式，重复求值语义等价。
- **非线性格（重复绑定名）不支持**：同一个子句的全部参数模式之间、同一模式内部的嵌套子模式
  之间、as 名与内层模式之间（以及同一个 `case` 分支 / `let`(`where`) 绑定 / `do-bind` 的
  模式内部）同名 binder 只能绑定一次，重复报 `[PS_RepeatedPatternBinder]`（不实现相等约束）。
  不同子句 / 分支 / 绑定各自独立作用域，可复用同名 binder。
- 变量 / 通配兜底只能放**最后一个**分支，否则报 `TC_CatchAllNotLast`；
- `Bool` 的 `case` 只认 `True` / `False` / 变量 / 通配（`TC_BoolCaseRestriction`）；
- `Int` / `String` 的 `case` 必须有一个变量 / 通配兜底（`TC_IntStringCaseNeedsFallback`），
  字面量分支降级成嵌套 `if` 链；
- 不可达分支是**错误**：重复构造子分支、重复字面量、兜底之后的分支分别报
  `TC_RedundantCtorBranch` / `TC_RedundantLiteralBranch` / `TC_BranchAfterCatchAll`；
  被索引排除的分支与分支上下文含空归纳族的分支可以**省略**，写出来报
  `TC_ImpossibleBranchIndex` / `TC_ImpossibleBranchEmptyCtx`（省略与写出走同一套
  `allCtorsUnsatisfiable` 判据；索引含中性项时保守判可达）；
- 嵌套模式与同一构造子的多个分支由模式矩阵降级（规范形：每构造子一个分支 + 变量子模式），
  语义与手写嵌套 `case` 一致；依赖索引的细化细节见 [type-system.md](type-system.md) 的
  「依赖模式匹配与 case」。

## 模块系统

- **文件 = 模块**，加载语义由**包上下文**唯一决定：文件向上找最近的 `vuna.toml`，可用
  模块根 = 该包 `lib/` + 依赖闭包各包的 `lib/`，`compiler/lib/Vuna/Compiler/Frontend/Parser.vuna`
  ⇔ 模块 `Vuna.Compiler.Frontend.Parser`；
- **无 manifest 的文件只有 base 上下文**：base 由 `VUNA_BASE` 覆盖，否则按可执行文件
  相对布局探测 `<exeDir>/base`、`<exeDir>/../base`、`<exeDir>/../../base`、
  `<exeDir>/../../../base`，都找不到时明确报错；这类 ad-hoc 单文件与包内模块一样
  **自动导入 `Prelude`**（显式 `import` 仍可用）；
- 模块按可用根查找；同名模块出现在多个根时是硬错误（不静默覆盖）；
- 路径段必须匹配 `[A-Z][A-Za-z0-9_]*`，路径 / 文件名与模块名**精确一致**，没有大小写映射；
- 入口文件可以在模块根外（如 `app/Main.vuna`），它本身不是模块，不能写模块头；目录入口
  （`check/build <dir>`）只认该目录自己的 `vuna.toml`，**不向上找**；
- 包模式下模块根由 `vuna.toml` 解析：本包 `lib/` + 依赖包 `lib/`（按依赖 DAG 排序，
  跨包只看得见依赖包 `[export]` 里的模块）；`app/` 是纯入口目录，不再作为模块根；
  包内每个模块（入口文件除外）**自动导入 `Prelude`**（依赖包 `base` 的顶层模块），
  显式 `import Prelude` 时不再重复注入，Prelude 自身不注入；
- `import` 只能在文件顶部，是**直接依赖**；循环导入、重复 import、重复 alias 都是硬错误；
- import 的四种形式：

  ```vuna
  import Vuna.Compiler.Frontend.Ast              -- 依赖 + 自动 open：EVar 可直接用
  import qualified Vuna.Compiler.Frontend.Ast    -- 只依赖：必须写 Vuna.Compiler.Frontend.Ast.EVar
  import Vuna.Compiler.Frontend.Parser as P      -- 依赖 + open，并可用 P.parseSource
  import qualified Vuna.Compiler.Frontend.Lexer as L  -- 只依赖，并可用 L.PTok
  ```

  alias 只是额外的限定前缀，原全名仍然可用；alias 必须是单个大写段、全文件唯一，且不能
  与另一个被 import 的模块名冲突；
- **模块头**：模块文件可以在 `import` 之前写一个模块头声明导出项（导出列表可以跨行；
  入口文件不能写）：

  ```vuna
  module Vuna.Math where           -- 省略导出列表 = 导出全部（v0 兼容）
  module Vuna.Math () where        -- 显式导出空集
  module Vuna.Math
    ( three
    , Nat(..)
    , module Vuna.Compiler.Common
    , Vuna.Compiler.Frontend.Lexer.lexSource
    ) where
  ```

  `vuna fmt` 会把显式导出列表规范为：导出项按字面文本的 ASCII 字典序排序（`module B`
  整模块重导出排最后）；单行超过 100 列或列表内含注释时逐项一行（逗号前置），否则保持
  单行。排序只影响书写顺序——导出仍是集合，语义不变。

  模块名必须与路径推导出的模块名一致（`lib/Vuna/Math.vuna` ⇔ `Vuna.Math`），不一致是
  硬错误。导出项按「类型名 / 值名」两套命名空间解析（`module B` 是整模块重导出，不属于
  单个名字）：

  - `name`：裸名，类型 / 值两套命名空间都解析，同名都导出（构造器名按值命名空间解析）；
    单独导出类型名时只导出类型本身（构造器不可见，即抽象类型）；
  - `Name(..)`：导出类型及全部非私有构造器（重导出已导入的类型时只公开源模块本来就
    公开的构造器，保持源的抽象性）；
  - `module B`：整模块重导出，B 必须是直接 import 的模块，保留 B 的抽象性；
  - `B.name`：从 B 选择性重导出，B 必须是直接 import 的模块；

  这里的 B 可以用模块全名或 import alias 引用。暂不支持重命名重导出（`foo = B.foo`）和
  构造器子集（`T(C1,C2)`）；同一 (kind, 名字) 重复导出（包括 `module B` 已覆盖的名字再
  单独写 `B.x`）是 `duplicate export` 硬错误；导出当前作用域不可见的名字也是硬错误；
- **`_` 前缀私有**：任何顶层名字（值 / 类型 / 构造器）以 `_` 开头即模块私有，不能导出；
  显式导出 `_` 名是硬错误（不是静默剔除），裸 `_` 也不能作顶层名；`(..)` 同样不会让
  `_` 构造器变公开；
- **抽象类型**：导出项 `T` 只导出类型、不导出构造器，跨模块既不能构造也不能模式匹配；
  要公开构造器必须写 `T(..)`；
- **模块路径不变式**：模块路径的最后一段是文件名、中间段是目录，目录本身不是模块。
  因此 `lib/Vuna.vuna`（模块 `Vuna`）与 `lib/Vuna/Compiler/Frontend/Parser.vuna`（模块
  `Vuna.Compiler.Frontend.Parser`）能在同一个根下共存、没有歧义，包门面可以直接命名为
  `Base` 或 `Vuna`；
- 非限定名的查找顺序（值位置）：局部绑定 → 本模块值定义（定义 / 签名 / 实例名）→ 本模块
  构造子 → 内建（intrinsic）/ 精化器 prelude → 已自动 open 的 import 导出（先值项、再
  构造子）→ 本模块类型名 → import 模块导出的类型名（后两者是**类型作为项**的退路，
  见下节）。两个 open import 导出同名但指向不同定义时，裸名报歧义（指向同一定义的重复
  导出不算歧义，例如原模块与它的门面重导出）；写全名或 alias 即可消歧；import 只提供
  目标模块**导出列表**中的名字（省略模块头 = 全部导出，`_` 前缀除外）；
- **构造子身份是「数据类型 + 构造子」**：data 构造子的 canonical 名是
  `Module.Data.Ctor`（entry 文件里是 `Data.Ctor`），record / trait 保持
  `Module.Name`。因此不同数据类型可以有同名构造子（`List.Nil` 与 `Vec.Nil`）；
  codegen 按族限定生成 OCaml 名，诊断显示族短名（`Vec.Nil`）。
- **构造子名重载**：裸构造子名在解析期收集候选（本模块 data/record 构造子 + 所有
  open import 的 data/record 构造子），多于一个候选时不立即报歧义，而是交给精化器按
  **期望类型 / scrutinee 族**选 canonical 构造子（值位置、应用实参、类型位置、`case`
  分支、多子句函数、实例方法、局部函数都参与）。期望族未知时，候选里含 `Base.List`
  的 `Nil`/`Cons` 则默认 List（保持 `[]`/`Nil` 旧体验），否则报
  `[TC_AmbiguousCtor]`。显式 `Data.Ctor`（如 `Vec.Nil`）永远无歧义；与本地**类型名**
  同名的 record / 双命名空间构造子仍保持本地词法遮蔽。
- **列表字面量按族通用展开**：parser 把 `[]` / `[a, b]` 解析成保留名
  `@vuna@list@nil` / `@vuna@list@cons`，精化器按期望族的短名 `Nil`/`Cons` 展开
  （`List` / `Vec` / `Base.Eff.Row` / 用户自定义同形族都可用）；期望未知时默认
  `Base.List.List`。模式 `[]` / `[a, b]` 同样按 scrutinee 族展开。
- 限定名用**完整模块名**或 alias，永远不会歧义，但同样只解析目标模块的导出项；import
  只算直接依赖，**不传递**：A import B，C import A 看不到 B 的名字——除非 A 用
  `module B` / `B.name` 显式重导出；
- Loader 解析 import 图、做名字解析后 **flatten** 成一个 program（内部名字带模块前缀，
  如 `Vuna.Compiler.Frontend.Parser.parseSource`），解释器与 codegen 复用同一份实现；
  `show` 只显示最后一段，所以输出与包内程序一致。

## type / value 双命名空间

解析层有三个命名空间，与导出表的 kind 一一对应，**不存在一张拍平的总表**：

| 命名空间 | 内容 | 导出 kind |
| --- | --- | --- |
| 值 | 定义（DFun / 签名 / 实例名） | `val` |
| 构造子 | data 构造子、record 名、trait 方法 | `ctor` |
| 类型 | data / record / trait 的类型名 | `type` |

- **类型位置只查类型命名空间**：先本模块声明的类型名（**优先于内建名**——`Base.Bool` 重新
  声明 `Bool` 就靠这条），再内建类型名；小写名保持为隐式类型变量（未被本模块值定义占用
  时）。都没有再查 import 导出的类型。退化约定：非小写名找不到类型时按**索引构造子**解析
  （`Vec Zero a` 的 `Zero`），最后才退到本模块值定义（类型层 def，如 `sel : Nat -> Type`）。
- **值位置查值命名空间**：局部绑定 → 本模块值定义 → 本模块构造子 → 内建 → import 导出
  （值项、再构造子）→ **本模块类型名 → import 导出的类型名**（类型作为项的两级退路，
  与类型位置一样本模块优先）。因此
  `data Pair a b where Pair : a -> b -> Pair a b` 的 `Pair` 在类型位置是族、在值位置是
  构造子；显式 `(a : Type)` 参数处的族名（`firstTy Pair ...`）作为类型层实参可用，
  导入模块的类型名同样可用（例如 `:type Maybe` 打印 `Maybe` 的 kind）。
- **不同命名空间不互相遮蔽**：本模块声明的**类型**名不再抢走同名的导入**值**（
  `import Values (token)` + 本地 `data token : Type`：值位置的 `token` 是导入的 Int 值，
  类型位置的 `token` 是本地类型）；本模块的值定义也不进类型命名空间（除非走上面的类型层
  def 退化路径）。
- 导出侧仍按名字各自的命名空间解析（裸 `T` 导出类型、`T(..)` 导出构造子）；解析层的三张表
  与导出 kind 的 `val` / `ctor` / `type` 一一对应，解析器不再把三者拍平，精化器也不需要靠
  「kind 是不是宇宙」猜名字属于哪个命名空间。
- **跨模块类型层引用**：类型层 def 退化路径只看**本模块**同名值定义；跨模块类型层定义
  （含 `axiom t : Type`）只要在本模块 import 的导出面里，类型位置的裸小写名也会解析到它
  （值 → 构造子 → 类型顺序，与限定名 `M.t` 等价）。未导入/未绑定的小写名仍是隐式类型变量；
  显式 `{a : Type}` binder 会遮蔽同名 import。
- **同名声明**：三套命名空间互不遮蔽；同模块 `data T` 与值 `T` 同名也可用——类型位置取
  族 kind（`DtData.dtDataKind`），值位置取值签名，精化器的 globals 单表不再互相覆盖；
  与数据族同名的值定义不做 delta 展开，避免把类型位置的 `T` 归约成值。
