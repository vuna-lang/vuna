# 语言参考：core-v0（语法与模块系统）

本文是 vuna 语言 core-v0 的**语义**与模块系统参考。类型规则（宇宙、索引族、依赖匹配、相等、
擦除）见 [type-system.md](type-system.md)；记录 / trait / `do` 见
[records-traits.md](records-traits.md)；包管理与工具链命令见 [packages.md](packages.md)；
**表面语法的完整形式清单（词法、表达式、模式、类型、声明、导入导出）见
[frontend-syntax.md](frontend-syntax.md)**——本文不重复列举写法，只写语义规则。

## core-v0 语义要点

- 类型：`Int` / `String` 是语言 primitive 类型；`Bool` / `List` / `Nat` 等是 base 的普通
  `data` 声明；`data` / `record` 声明的类型与函数构成其余类型。类型签名参与精化，运行时
  是否保留由擦除判据（`Rig`）决定。
- **类型表达式里的字面量**：签名、族 kind、构造子索引里只放行 `Int` / `String` 字面量
  （`Vec 3 a`、用户 data 的 String 索引如 `Box "books"`）；其它字面量（包括浮点）报
  `invalid type expression`。规则见 [type-system.md](type-system.md)。
- **列表 / 行字面量与模板串**：列表字面量按**期望族**展开（`List` / `Vec` / `Row` / 用户同形族），
  行位置的元素补默认实例名或 `@name`；模板串降级成 `Base.Trait.Interp.interp` 调用。语义见
  [effects.md](effects.md) 与 [templates.md](templates.md)，形式与降级表见
  [frontend-syntax.md](frontend-syntax.md)。
- **`record` 不降级成 `data`**：`Elab.Data` 直接精化 `DRecord`，内部保留合成位置构造子服务
  构造 / 模式 / 字段投影。详细语义、记录更新 / 模式与委托边界见
  [records-traits.md](records-traits.md)；
- **自动去装箱**：单字段 record / 单构造器单运行时字段的 data 在 codegen 中表示为
  字段类型的 OCaml 类型别名（没有构造子、没有变体）；这是声明级表示选择，不改变类型检查
  与 `deriving` 语义。判据与边界见 [records-traits.md](records-traits.md) §零成本表示；
- `main` 必须是零参数定义；展示由编译器钩子完成（`Int` / `Nat` → 十进制、`String` →
  `strShow`、`Bool` → `True` / `False`）。`show` 是 `Base.Trait.Show` 的 trait 方法，不是 `main`
  的展示钩子。核心求值路径只展示 `Int` / `Nat` / `String` / `Bool` 的 `main` 值
  （精化后的纯核心求值，归约边界见 [primitives.md](primitives.md)）；
- 内建值（`Vuna.Compiler.Base.Intrinsics.allIntrinsics` 里用户可见的项）：`+ - * /`、
  `&& ||`、`++`、`strFromInt` / `strUnpack` / `strPack` /
  `strLength` / `strConcatMany` / `strSubstTemplate` / `strHash` / `strAt` / `strShow`、
  `timeUs`。宽度、编码、转义与核心求值边界见 [primitives.md](primitives.md)；
- **运算符 = 方法名**：`==` / `/=` / `<` / `<=` / `>` / `>=` 不是内建值，
  而是 `Base.Trait.Eq` / `Base.Trait.Ord` 的方法（方法名就是 `(==)` / `(/=)` / `(<)` 等）。
  `a == b` 与 `(==) a b` 同义，Int / String 上由内建实例特化，其它类型走 `Eq` / `Ord`
  字典。trait 声明与实例的落点规则见 [operators.md](operators.md)；
- 效果入口**只有 `Base.Effect.*` 的标签 + handler**（`consolePrint` / `fsReadFile` /
  `envGetEnv` / `exitWith` …）：宿主层原语是隐藏的 `@vuna@prim_eff_*` / `@vuna@host@*`
  （源码写不出，只由 base 的 handler 与编译器/工具链内部使用）；`effTimeUs` 是唯一可见的
  效果内建（`Eff [] Int`）。没有 manifest 门控；见 [primitives.md](primitives.md) 的
  效果原语与宿主层一节；
- `&&` / `||` 短路求值：先求左操作数，左侧能决定结果时不求值右侧（核心求值器与 codegen
  一致）；
- `where` 子句：函数体后的绑定块与 `let` 共用同一套模型（顺序作用域 + 可选签名），其中
  `where` 块要求每个绑定写显式签名；见下节；
- 类型身份：`Int` / `String` 是语言 primitive 类型；`Bool` / `List` / `Nat` 是 base 的
  普通 `data` 声明（canonical 身份 `Base.Data.Bool.Bool` / `Base.Data.List.List` / `Base.Data.Nat.Nat`，
  经自动注入的 `Prelude` 可见）。用户写同名 `data` 是普通声明，不与 canonical 冲突。
  `True` / `False` / `(::)` / `Nil` 与其他构造子一样**按声明身份**解析，没有「内建全局
  构造子放行」；身份规则见 [primitives.md](primitives.md)。

## `let` / `where` 绑定块与显式签名

`let` 与 `where` 共用同一套**绑定块**模型（顺序作用域 + 可选签名），实现只有一份
（parser 的 `parseBindingItemsAt` / `bindingItemsToBinds`，Elab 的 `checkBindingSigs`）；
形式与降级表见 [frontend-syntax.md](frontend-syntax.md) §2。

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

- **`let` 模式解构**：`let` 绑定左端可以是构造子 / 记录 / 字面量模式（不只简单名 /
  通配）。语义等价单分支 `case`：模式必须不可失败（穷尽），否则报
  `[TC_NotExhaustive] case is not exhaustive: missing ...`；模式绑定出的变量在之后的绑定与
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
  [PS_WhereSigNoDef] binding signature for g has no definition
  [PS_WhereSigDuplicate] duplicate binding signature for g
  [PS_WhereSigBeforeClause] binding signature for g must come before its clause
  [PS_WhereSigMultiClause] binding g has more than one clause (a signature can annotate only one)
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
- axiom 是普通顶层声明：名字自动 mangle、默认不导出、`export` 后可进模块导出表；同一名字不能再
  有定义体（`[TC_AxiomWithDefinition]`），也不能重复声明；
- `axiom` 是保留关键字；当前编译器自身不用 axiom（seed 必须能编译当前源码）。

## `opaque` / `transparent` 定义

`opaque` 标记一个定义“对外不展开”，`transparent` 显式声明普通（默认）行为：

```vuna
export opaque N : Type
N = Int

export transparent M : Type
M = Int
```

- opaque 定义体在**下游模块**的 deftbl 中不出现：跨包接口路径不会 delta 展开它，
  `ifaceHash` 只含名字 + 类型，`implHash` 才含体；
- 定义模块自身仍需要体来检查/生成代码；`transparent` 是显式默认，等价于不写；
- `abstract` 已可解析（`abstract f : T` / `export abstract f : T`）：定义体在**本模块内**也
  不可展开（seal）；`opaque` 只对下游隐藏，定义模块仍可展开。
- 包 check/build（含增量路径）、单文件 `dtCheckSource`、REPL/表达式求值与 `dtEvalFile`
  均使用模块边界 seal；goal/tolerant 查询仍不复用模块过滤（只影响工具查询）。
- 记录表示的档位前缀只有 `boxed record` / `alias record` / 裸 `record`（见
  [records-traits.md](records-traits.md)）；没有 `opaque record` 前缀。

## 签名的 trait 约束

顶层签名可写约束前缀（`f : Eq a, Show a => a -> String`）；语义、绑定顺序、诊断与边界见
[records-traits.md](records-traits.md)。约束只允许在顶层签名上（以及 trait 头的父类前缀
`trait Functor f => Applicative f where`），其它位置写 `=>` 报
`[PS_ConstraintUnsupportedHere]`。

显式隐式 binder 可以写在约束之前（`{a b : Type} -> Convert a b => a -> b`）：同一
binder 组内的多个名字展开成嵌套 Pi，解析器把这段 Pi 前缀搬到返回类型上，约束本身仍是
`C a b`。多名字 binder 同样适用于普通 `(x y : T) -> ...` / `{x y : T} -> ...` 形态。

## 成员约束与实例名（effect wrapper）

`Member n e r => ...` 是签名糖，不是 trait：它展开成 `Member (Named n e) r`（`Member` 本身
是 2 个索引的归纳族：行条目 + 行）。编译器生成隐式 `{_member : Member (Named n e) r}` 证明
binder（`Rig0`），并把 `n`/`r` 的域分别量化为 `String`/`Row`；标签 `e` 的其它自由名仍按
kind 规则量化。签名例子：

```vuna
consolePrint : Member n ConsoleOp r => String -> Eff r Nat
consolePrint s = sendCore (Named n ConsoleOp) "console" n (Print s)
```

- 隐式 `String` 实例名按 `RigOmega` 运行（见 [qtt.md](qtt.md)），定义体可按名字引用；
  resolver 只把 String 域隐式名与 `Member` ctx 的自由小写名加进子句作用域。
- 调用点不写实例名：裸标签行取默认 `"default"`，命名行按行解；多实例行用 `f@name`
  显式选（裸标识符是名字字面量）。实例名是静态的（行解或字面量），`@` 是可选的隐式实参
  覆盖，不参与位置实参。
- `Member` 仍是 `Base.Effect.Core` 的 Type-1 data family（`Member e r`，`e` 是行条目，可为
  `Named n e0`）；约束只允许在顶层签名。

## 源码写法惯例（现代形态）

vuna/base/compiler 三包源码统一按当前语言能力书写，新增/修改代码沿用：

- **签名不写可量化的类型参数**：自由小写名由精化器量化为隐式参数（`vhead : Vec n a -> a`
  等价 `{a : Type} -> ...`）；纯索引写 `{n : Nat} ->`，子句与调用点不手写该参数；
- **trait 约束显式**：泛型函数依赖 Eq/Ord/Show 字典时在顶层签名写 `Eq a =>`，
  不依赖 body 里 `==` 的隐式字典提升；
- **Bool 不做字面量搬运**：`if c then True else False` 写 `c`，`if c then e else False` 写
  `c && e`，`not (a == b)` 写 `a /= b`；单簇 helper 用 `Base.Data.Bool.not`；
- **单构造器类型用 `record` + 字段访问**：需要一等函数形态时用生成的字段选择器
  （`map Point.x`）或限定名 `R.x`，不再手写位置访问器；
- **导出有两种互斥写法**：模块头导出列表（`module M (x, T(..)) where`）或逐定义
  `export`；同一模块不能同时写（报 `RN_DuplicateExport`），不写列表时模块默认私有
  （见 [frontend-syntax.md](frontend-syntax.md) §6）。

## 函数定义与 η 收缩

定义子句的参数可以少于签名：剩余 Pi 与 body 的类型按 `conv` 做 **η 收缩**相容检查，
所以 `f : Int -> Int` 配 `f = inc` 合法（body 本身就是函数值）。精化**不合成** `\_arityN`
参数；body 不是函数值时按普通类型不匹配（`TC_TypeMismatch`）报错。参数**多于**签名仍报
`[TC_DefMoreParams]`。多 clause 与 where 绑定共用同一条精化路径，行为一致。
定义形式本身见 [frontend-syntax.md](frontend-syntax.md) §5。

### 子句块

顶层同名子句必须组成**连续块**：

- 块 = 可选的 1 行签名 + 1 条及以上同名子句；块内只允许空行与注释。别的声明、别的函数的
  签名、`infixl` 之类的 fixity 行、逐定义 `export` 行都会结束当前块；同名子句在其后再次
  出现报 `[PS_ClauseNotAdjacent]`（`PmTool` 与 `PmStrict` 同判：这是语法形状，不是语义推断）；
- **零参定义只能有一条子句**：`f = 1` 之后再写 `f = 2` 报 `[PS_DefinitionDuplicate]`；
- 子句**不得被前面的子句覆盖**：`f _ = 0` 之后再写任何 `f ...` 报 `[PS_ClauseShadowed]`
  （语法蕴含：变量 / `_` 顶，构造子同名同元数逐位，字面量同值，record 字段逐名）；
  并集覆盖（`f True` / `f False` 之后再写 `f _`）在精化期由模式矩阵判，报
  `[TC_ClauseUnreachable]`；
- 判据只对**参数个数相同**的子句生效（arity 不同由 `[TC_DefMoreParams]` 单独报），
  列数不一致的定义组（`where` / `let` 里允许少模式的 catch-all）不做覆盖性判定；
- 未知构造子族 / 重载构造子 / 覆盖性搜索耗尽燃料时不报（不能证明不可达就不报）。

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

## 内置宏（`name!`）

标识符后**紧邻**的 `!` 是一次内置宏调用：`log! "debug" "x"`。`!` 与名字之间不能有空格；
带空格的 `a ! b` 仍是普通中缀运算符（`!` 也可以被 `infix` 声明），`!=` / `!!` 不触发。

- **参数按原子贪婪**：`log! "debug" "phase"` 是一个调用；`f log! "debug" x` 解析为
  `f (log! "debug" x)`（宏调用先吞掉自己的原子实参）；块实参用括号。
- **只出现在表达式位置**：模式位置不解析 `!`；宏也不能当函数值传递。
- **展开时机**：`Loader` 在 fixity 重排之后、名字解析之前做 AST→AST 展开（`Loader.Expand`），
  Elab / 后端 / 接口缓存都只会看到普通表达式；parser 用保留名
  `@vuna@macro@<name>` 编码调用，Fmt 反向渲染回 `name!`，Index 不把标记当引用。
- **卫生性**：展开结果只引用隐藏 runtime 原语（`@vuna@log@*` / `@vuna@obs@*`，见
  [primitives.md](primitives.md)），不依赖库模块、不捕获调用方局部名字；宏名不能被局部
  绑定遮蔽；每个实参只出现一次。
- **span**：展开出的节点继承调用点 span（实参保留自身 span），诊断可回溯到 `name!`。
- **内置宏**：`log! "level" msg`（`if @vuna@log@on level scope then @vuna@log@emit level scope msg else 0`，
  `scope` 是所在模块名、展开期烘入）、`mark! name`（瞬时标记事件）。它们在任何包可用、不需要
  import；`log!` 的 `level` 必须是 `error|warn|info|debug|trace` 字面量，关闭或被 scope
  过滤时 `msg` **不求值**，表达式返回 `Int 0`；完整开关与输出格式见
  [logging.md](logging.md)，`mark!` 的 schema 见 [observability.md](observability.md) §4.3。
- **错误**：未知宏 `[RN_UnknownMacro]`、参数个数不符 `[RN_MacroArity]`、`log!` 级别非法
  `[RN_LogLevelUnknown]` / 非字面量 `[RN_LogLevelNotLiteral]`，都带调用点 span。
- **边界**：暂不支持用户自定义宏 / 模式宏 / 宏生成宏；宏名是全局内置名，不参与模块作用域
  （见 [debt.md](debt.md)）。

## `case` 分支与模式

模式的形式清单（含 as-pattern / 记录 pun / 列表模式）见
[frontend-syntax.md](frontend-syntax.md) §3；本节写匹配语义与穷尽性。

`case e of` 的每个分支左端是模式：构造子模式（可嵌套，如 `x :: (y :: ys)`）、
`Int` / `String` 字面量模式、Nat 字面量模式（按 `Zero` / `Succ` 构造子展开）、变量或通配。
分支按书写顺序匹配，因此：

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
  字面量分支降级成嵌套 `if` 链；Nat 字面量模式按 `Zero` / `Succ` 构造子模式参与矩阵，
  可与构造子模式混用，穷尽性由矩阵判定（`case n of 0 => a; Succ k => b` 即穷尽）；
- 不可达分支是**错误**：重复构造子分支、重复字面量、兜底之后的分支分别报
  `TC_RedundantCtorBranch` / `TC_RedundantLiteralBranch` / `TC_BranchAfterCatchAll`；
  被索引排除的分支与分支上下文含空归纳族的分支可以**省略**，写出来报
  `TC_ImpossibleBranchIndex` / `TC_ImpossibleBranchEmptyCtx`（省略与写出走同一套
  `allCtorsUnsatisfiable` 判据；索引含中性项时保守判可达）；
- 嵌套模式与同一构造子的多个分支由模式矩阵降级（规范形：每构造子一个分支 + 变量子模式），
  语义与手写嵌套 `case` 一致；依赖索引的细化细节见 [type-system.md](type-system.md) 的
  「依赖模式匹配与 case」。

## 模块系统

import / 导出的形式表见 [frontend-syntax.md](frontend-syntax.md) §6；本节写加载、名字解析与
导出语义。

- **文件 = 模块**，加载语义由**包上下文**唯一决定：文件向上找最近的 `vuna.toml`，可用
  模块根 = 该包 `lib/` + 依赖闭包各包的 `lib/`，`packages/compiler/lib/Vuna/Compiler/Frontend/Parser.vuna`
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
  跨包只看得见依赖包 `[export]` 里的模块）；`app/` 是纯入口目录，不是模块根；
  包内每个模块（入口文件除外）**自动导入 `Prelude`**（依赖包 `base` 的顶层模块），
  显式 `import Prelude` 时不重复注入，Prelude 自身不注入；
- `import` 只能在文件顶部，是**直接依赖**；循环导入是硬错误。重复 import 合并；重复 alias
  或 alias 与模块名同名不再在 import 期报错，而是形成限定名候选集，只在**使用点**无法
  唯一确定时报歧义；
- import 的四种形式：

  ```vuna
  import Vuna.Compiler.Frontend.Ast              -- 依赖 + 自动 open：EVar 可直接用
  import qualified Vuna.Compiler.Frontend.Ast    -- 只依赖：必须写 Vuna.Compiler.Frontend.Ast.EVar
  import Vuna.Compiler.Frontend.Parser as P      -- 依赖 + open，并可用 P.parseSource
  import qualified Vuna.Compiler.Frontend.Lexer as L  -- 只依赖，并可用 L.PTok
  ```

  每个 import 产生四种引用形式：裸名（非 `qualified`）、最后一段短名（弱限定，`as` 不抑制）、
  显式 alias（强限定）、完整模块名（强限定）。强限定优先；多个弱候选里只有一个模块导出该
  成员时才解析，否则在使用点报歧义。未使用的 import 不参与冲突判定；alias 必须是单个大写段。
  例：`import Base.Container.Map as Map` 后 `insert` / `Map.insert` 都可用。
  同名的多个值候选会保留到精化：有期望类型时按类型选唯一可检查者（`x : Int; x = foo`），
  无期望类型或仍不唯一时报 `TC_AmbiguousName`。

  命名空间路径也可以直接作为 import：`import A.X as Y`（必须写 `as`）等价于按 A 导出的
  命名空间路径 X 找到目标模块并以 Y 限定使用；目标模块可以不在依赖包的 `[export]` 里。
- **逐定义导出**：模块默认 **module-private**，只有 `export` 标在定义前的
  名字对下游可见。

  ```vuna
  module Vuna.Math where

  export three : Int
  export data Nat(..) : Type where
    Z : Nat
    S : Nat -> Nat
  export record UserId(..) where
    raw : Int
  export trait Show a(..) where
    show : a -> String

  export module Vuna.Compiler.Base.Common       -- 导入 + 整模块重导出
  export import B (x, T(..))              -- 选择性重导出
  export module Base.Container.Map                  -- 导入 + 平铺重导出 Base.Container.Map 的全部导出项
  export module Base.Container.Map as Map           -- 导入 + 只导出命名空间路径 Map（A.Map.* / A.Base.Map.*）
  ```

  `export data T` 只导出类型（抽象，构造器不可见）；`T(..)` 导出全部公开构造器，
  `T(A, B)` 只导出子集；record / trait 同理（`R(..)` / `C(m1, m2)`）。`export` 可写在
  `opaque` / `transparent` 之前或之后；`export import` / `export module` 直接替换同模块的
  普通 `import`，不会重复导入。导出项顺序不是语义，`vuna fmt` 会规范化。

  `export module C` 与 `export module C as X` 是两种模式：不带 alias 时把 C 的导出项
  **平铺**进本模块（下游 `A.insert` / 裸名）；带 alias 时**只导出命名空间路径**
  （下游 `A.X.insert`，同时保留完整路径 `A.C.insert`），不平铺。路径条目按最长点号前缀
  匹配；符号的 canonical 身份仍是定义处（`A.X.insert` 的 target 是 `C.insert`）。

- **私有性只看 `export`**：模块默认 module-private；`_` 前缀没有特殊私有含义，
  `export _helper` 是合法的。裸 `_` 仍不能作顶层名（它是通配符）；
- **抽象类型**：导出项 `T` 只导出类型、不导出构造器，跨模块既不能构造也不能模式匹配；
  要公开构造器必须写 `T(..)`；
- **模块路径不变式**：模块路径的最后一段是文件名、中间段是目录，目录本身不是模块。
  因此 `packages/base/lib/Base.vuna`（模块 `Base`）与 `packages/base/lib/Base/List.vuna`（模块
  `Base.Data.List`）能在同一个根下共存、没有歧义，包门面可以直接命名为
  `Base` 或 `Vuna`；
- 非限定名的查找顺序（值位置）：局部绑定 → 本模块值定义（定义 / 签名 / 实例名）→ 本模块
  构造子 → 内建（intrinsic）/ 精化器 prelude → 已自动 open 的 import 导出（先值项、再
  构造子）→ 本模块类型名 → import 模块导出的类型名（后两者是**类型作为项**的退路，
  见下节）。两个 open import 导出同名但指向不同定义时，裸名报歧义（指向同一定义的重复
  导出不算歧义，例如原模块与它的门面重导出）；写全名或 alias 即可消歧；import 只提供
  目标模块**导出集**中的名字（模块头导出列表或逐定义 `export`）；
- **构造子身份是「数据类型 + 构造子」**：data 构造子的 canonical 名是
  `Module.Data.Ctor`（entry 文件里是 `Data.Ctor`），record / trait 保持
  `Module.Name`。因此不同数据类型可以有同名构造子（`List.Nil` 与 `Vec.Nil`）；
  codegen 按族限定生成 OCaml 名，诊断显示族短名（`Vec.Nil`）。
- **构造子名重载**：裸构造子名在解析期收集候选（本模块 data/record 构造子 + 所有
  open import 的 data/record 构造子），多于一个候选时不立即报歧义，而是交给精化器按
  **期望类型 / scrutinee 族**选 canonical 构造子（值位置、应用实参、类型位置、`case`
  分支、多子句函数、实例方法、局部函数都参与）。期望族未知时，候选里含 `Base.Data.List`
  的 `Nil`/`(::)` 则默认 List（与 `[]`/`Nil` 的写法一致），否则报
  `[TC_AmbiguousCtor]`。显式 `Data.Ctor`（如 `Vec.Nil`）永远无歧义；与本地**类型名**
  同名的 record / 双命名空间构造子仍保持本地词法遮蔽。
- **列表字面量按族通用展开**：parser 把 `[]` / `[a, b]` 解析成保留名
  `@vuna@list@nil` / `@vuna@list@cons`，精化器按期望族的短名 `Nil` / `(::)` 展开
  （`List` / `Vec` / `Base.Effect.Core.Row` / 用户自定义同形族都可用）；期望未知时默认
  `Base.Data.List.List`。模式 `[]` / `[a, b]` 同样按 scrutinee 族展开。
- **`::` 的家族定向解析**：`::` 是普通构造子名，`List` 与 `Base.Effect.Core.Row` 都声明了它；
  写 `x :: xs` 时按期望族 / scrutinee 族选 canonical 构造子（`Row` 位置选 `Row.(::)`，
  `List` 位置选 `List.(::)`），期望族未知时默认 `List`，多候选且无法定向时报
  `[TC_AmbiguousCtor]`。这也是 `Eff [..]` 行字面量与普通列表字面量能共用同一套糖的原因。
- **`Named` 是普通类型构造子**：`Named : String -> Type -> Type`，在类型位置正常引用
  （`Named "audit" ConsoleOp`、`Named n Op`）；它只在行条目/`Member` 语境下被编译器当作
  「带实例名的标签」解读，不做特殊名字放行。
- 限定名用**完整模块名**或 alias，永远不会歧义，但同样只解析目标模块的导出项；import
  只算直接依赖，**不传递**：A import B，C import A 看不到 B 的名字——除非 A 用
  `export module B [as X]` / `export import B (x)` 显式重导出；
  `export module B as X` 导出的命名空间路径可以继续向下重导出，形成 `A.X.Y.name`。
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

- **类型位置只查类型命名空间**：先本模块声明的类型名（**优先于内建名**——`Base.Data.Bool` 重新
  声明 `Bool` 就靠这条），再内建类型名；小写名保持为隐式类型变量（未被本模块值定义占用
  时）。都没有再查 import 导出的类型。退化约定：非小写名找不到类型时按**索引构造子**解析
  （`Vec Zero a` 的 `Zero`），最后才退到本模块值定义（类型层 def，如 `sel : Nat -> Type`）。
- **值位置查值命名空间**：局部绑定 → 本模块值定义 → 本模块构造子 → 内建 → import 导出
  （值项、再构造子）→ **本模块类型名 → import 导出的类型名**（类型作为项的两级退路，
  与类型位置一样本模块优先）。因此
  `data Pair a b where Pair : a -> b -> Pair a b` 的 `Pair` 在类型位置是族、在值位置是
  构造子；显式 `(a : Type)` 参数处的族名（`firstTy Pair ...`）作为类型层实参可用，
  导入模块的类型名同样可用（例如 `:type Maybe` 打印 `Maybe` 的 kind）。
- **导入面的值与构造子同名**：两者都作为重载候选，使用点按期望类型选；应用头按**结果
  类型**选（`MkTag 1 : Int` 选返回 `Int` 的值，`: Tag` 选返回 `Tag` 的构造子）。只有
  构造子候选时仍按族定向（`Nil`/`Cons` 的 `List`/`Row` 消歧）。无法唯一命中时报
  `TC_AmbiguousName`（推断位置一律报歧义，不默认选一方）。
- **不同命名空间不互相遮蔽**：本模块声明的**类型**名不抢走同名的导入**值**（
  `import Values (token)` + 本地 `data token : Type`：值位置的 `token` 是导入的 Int 值，
  类型位置的 `token` 是本地类型）；本模块的值定义也不进类型命名空间（除非走上面的类型层
  def 退化路径）。
- 导出侧仍按名字各自的命名空间解析（裸 `T` 导出类型、`T(..)` 导出构造子）；解析层的三张表
  与导出 kind 的 `val` / `ctor` / `type` 一一对应，解析器不把三者拍平，精化器也不靠
  「kind 是不是宇宙」猜名字属于哪个命名空间。
- **跨模块类型层引用**：类型层 def 退化路径只看**本模块**同名值定义；跨模块类型层定义
  （含 `axiom t : Type`）只要在本模块 import 的导出面里，类型位置的裸小写名也会解析到它
  （值 → 构造子 → 类型顺序，与限定名 `M.t` 等价）。未导入/未绑定的小写名仍是隐式类型变量；
  显式 `{a : Type}` binder 会遮蔽同名 import。
- **同名声明**：三套命名空间互不遮蔽；同模块 `data T` 与值 `T` 同名也可用——类型位置取
  族 kind（`DtData.dtDataKind`），值位置取值签名，精化器的 globals 单表不互相覆盖；
  与数据族同名的值定义不做 delta 展开，避免把类型位置的 `T` 归约成值。
