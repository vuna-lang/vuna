# 前端语法：表面形式、降级与边界

本文是 vuna **表面语法**的唯一清单：每种写法长什么样、解析后降级成什么、工具面怎么处理、
哪些形式**不支持**以及为什么。语义规则不放这里——每张表的「语义」列指向对应主题页。

阅读顺序：

- 想知道「这个写法是什么意思」→ [language.md](language.md) / [type-system.md](type-system.md)
  / [qtt.md](qtt.md) / [records-traits.md](records-traits.md) / [operators.md](operators.md)
  / [templates.md](templates.md) / [effects.md](effects.md)；
- 想知道「新增一个写法要动哪里、值不值得」→ §10 成本模型；
- 想知道「为什么不支持 X」→ §11 未支持与已决边界。

## 0. 分层约定

```text
源码文本 → Lexer → Parser/Ast（surface，含糖）→ Loader（fixity/section/do/模板/宏）
        → Rast（名字已解析，糖已消失）→ Elab → Core → IR → 后端
```

- **表面语法只活到 `Frontend.Ast`**：括号 / 中缀 / section 在 parser 里就降级成普通
  `EVar` / `EApp` / 单 binder λ；section 的书写形态记在 `Frontend.Cst.surfaceSections`，
  `Loader.Fixity` 只按 fixity 重排并折叠立即应用，`Rast` 里没有 section 构造子。
- **纯书写形式不建 AST 节点**：括号（层数）与「哪些 token 是括号」由 parser 的建树事件
  按节点 id 记录在 `Frontend.Cst` 里（`(e)` / `((e))` / `(f x) y` / `f (a)` 都覆盖；
  模板洞里由洞的子解析交回自己的条目）；反引号链步同理（名字是普通标识符，形状认不出）。
  Fmt 打印与 fixity 重排的括号边界都读这份表面形状。
- 部分糖**不新增 AST 构造子**，而用保留名编码（`@vuna@list@*` / `@vuna@handle` /
  `@vuna@macro@*` / `@vuna@tuple@*` / `@vuna@ascribe` / `@vuna@do@*` / `?hole`）：列表字面量、
  `perform` / `handle`、`f@name`、行条目、元组 / unit、类型标注、do 链、洞、内置宏都走这条路。
  新增形式优先考虑这条路径（§10）。所有前缀常量与编解码都在 `Frontend.Reserved`
  （唯一真源，`Frontend.Ast` / `Frontend.Rast` 只重导出）。
- **工具面看的是 `Frontend.Ast` 原形**：`Fmt` 按源码顺序打印、`Index`/`Lsp` 扫 binder 与引用、
  `Lint` 做归一化建议。任何表面形式都必须在这三处有明确处理，否则工具会漂移。

表格约定：

- 「入口」写 `模块.符号`（不写行号，行号会漂；定位用 `vuna map find`）；
- 状态只有三种：**支持** / **不支持（决定）** / **待评估**。

## 1. 词法

| 形式 | 写法 / 规则 | 入口 |
| --- | --- | --- |
| 行注释 | `--` 到行尾 | `Frontend.Lexer` |
| 块注释 | `{- ... -}`，可嵌套 | `Frontend.Lexer` |
| 标识符 | `[A-Za-z_][A-Za-z0-9_']*`，允许尾随 `'` | `Frontend.Lexer` |
| 点号并 token | `.` 后接标识符时并入同一个 token（`p.x`、`A.B.c` 都是单 token）；Loader 再拆成字段链 / 模块路径。代价：限定运算符 `A.+` 不可达 | `Frontend.Lexer`、`Loader.Resolve` |
| 内部名 | `@vuna@...`：parser / loader 合成的标记；`Base.*` / `Vuna.*` 源码也可显式引用，其它包被 `Loader.Resolve` 拒绝。`#...` 是编译器合成名，源码写不出（`#` 不是标识符字符） | `Frontend.Reserved`、`Frontend.Lexer`、`Loader.Resolve` |
| 整数 | 纯十进制，上限 63-bit | `Frontend.Lexer` |
| 浮点 | 只有 `digits.digits`；无指数、无 `1.`、无前导 `.` | `Frontend.Lexer`、[floats.md](floats.md) |
| 负号 | 不是字面量的一部分：`-1` 由 parser 折成负字面量，`-e` 展开成 `negate e` | `Frontend.Parser` |
| 十六进制 / 下划线数字 | **不支持** | — |
| 单行字符串 | `"..."` | `Frontend.Lexer` |
| 多行字符串 | `"""..."""`，内容逐字，只丢开引号后的一个换行；不做 dedent | `Frontend.Lexer`、[templates.md](templates.md) |
| 转义 | 仅 `\n \t \r \" \\ \' \$`；未知转义报错；无 raw string / `\u` | `Frontend.Lexer` |
| 插值 | `"hi ${expr}"`，洞内是完整表达式 token 流 | `Frontend.Lexer`、`Loader.Resolve`、[templates.md](templates.md) |
| 运算符字符集 | `! $ % & * + - . / < = > ? @ \ ^ \| ~ :` 连续成一个符号 token | `Frontend.Lexer.isOpChar` |
| 保留语法符号 | `->` `=` `\|` `,` `\` `=>` `:` `.` `` ` `` 与括号 / 方括号 / 花括号；不能当可定义名 | `Frontend.Parser.Support.isSyntaxSym` |
| layout | offside：顶层声明、`data` 构造子块、`case` 分支、`let`/`where` 绑定按块列对齐；跨行表达式必须缩进超过所在块列 | `Frontend.Parser` |
| 关键字 | 硬关键字表见 `Frontend.Lexer.isKeyword`；`alias` / `boxed` / `export` 是软关键字（只在声明位置特定上下文生效） | `Frontend.Lexer` |
| 私有构造子约定 | `_` 紧邻大写字母的标识符在模式里按构造子解析（`_C`）；单独 `_` 仍是通配，`_x` 是变量 | `Frontend.Parser.Support` |

## 2. 表达式

| 形式 | 例子 | 降级 / 语义落点 | 入口 |
| --- | --- | --- | --- |
| 应用 | `f a b` | `EApp` | `Frontend.Parser` |
| 实例名覆盖（应用） | `f@audit x` | `f (@vuna@inst@arg audit) x`，在第一个隐式 String binder 处消费 | `Frontend.Parser`、`Elab.Term.Impl` |
| 行条目实例名（后置） | `e @audit` | `@vuna@row@at` 编码，行展开期使用 | `Frontend.Parser`、`Elab.Term.Impl` |
| 中缀 | `a + b` / `` a `f` b `` | parser 直接降级成 `EApp (EVar op) [l, r]`（源码顺序、右嵌套，反引号写法登记在 `Frontend.Cst`）；Loader 按可见 fixity 重排；未知符号运算符报错 | `Frontend.Parser`、`Loader.Fixity`、[operators.md](operators.md) |
| section | `(+)` / `(+ e)` / `(e +)` | `EVar op` / lambda；直接应用 `(+ e) a` 折叠成 `a + e`（不生成 lambda） | `Loader.Fixity` |
| `>>` | `a >> b` | `(>>=) a (\_ => b)`（用调用点可见的 `>>=`） | `Loader.Fixity.infixTerm` |
| 一元负号 | `-1` / `-e` | 负字面量 / `negate e` | `Frontend.Parser` |
| `if` | `if c then a else b` | `TIf`（三段必写） | `Elab.Term.Impl` |
| `case` | `case e of pat => body` | `Elab.Match` 模式矩阵；字面量分支降成 `if` 链；单 scrutinee | `Elab.Match`、[type-system.md](type-system.md) |
| `let` | `let` + 绑定块 + `in body` | 顺序 let：`TApp (TLam x body) value` | `Elab.Term.Impl`、[language.md](language.md) |
| `where` | `f x = e where` + 绑定块 | 函数体后的绑定块（每个绑定必须写签名） | `Frontend.Parser`、`Elab.Term.Support`、[language.md](language.md) |
| lambda | `\x, y => e` | `ELam`；参数只能是名字（逗号分隔，无 `->` 形式、无参数模式） | `Frontend.Parser` |
| `do` | `let pat = e` / `pat <- e` / 裸表达式 | do 链（`@vuna@do@bind@*` 标记）；**最后一条必须是裸表达式**；`let` 是纯绑定（对后续语句可见）；`pat <- e` 接受任意不可反驳模式，可反驳模式按普通 `case` 报穷尽性错误 | `Frontend.Parser`、`Loader.Resolve`、[records-traits.md](records-traits.md) |
| `perform` | `perform (Print s)` | `Base.Effect.Core.performCore` | `Elab.Term.Impl`、[native-effects.md](native-effects.md) |
| `handle` | `handle c { return x -> e`，随后每个 `C p k -> e` 一行，`}` 收尾 | `handleWith` / `handleWithAt` | `Elab.Term.Impl`、[native-effects.md](native-effects.md) |
| 记录构造 | `Point { y = 2, x = 1 }` | 合成位置构造子应用；字段必须写全、必须写 `=` | `Elab.Records`、[records-traits.md](records-traits.md) |
| 记录更新 | `{ p \| x = 3 }` | `TRecUpd`（语义 = 单分支 case） | `Elab.Term.Impl` |
| 字段访问 | `p.x` / `s.start.x` | `TProj`；刚性类型变量走 `HasField` | `Elab.Term.Impl`、[records-traits.md](records-traits.md) |
| 列表字面量 | `[]` / `[a, b]` | 保留名 `@vuna@list@nil` / `@vuna@list@cons`，按期望族展开成 `Nil` / `(::)` | `Elab.Term.Impl`、[language.md](language.md) |
| 行字面量 | `[Fetch]` / `[ConsoleOp@audit]` | 与列表同一语法；行位置的元素展开成 `Named "default"/"audit" ...` | `Elab.Term.Impl`、[effects.md](effects.md) |
| 模板字符串 | `"hi ${name}"` | `Base.Trait.Interp.interp e` + `++` 链 | `Loader.Resolve`、[templates.md](templates.md) |
| 洞 | `_` / `?name` | goal（check 位必须有期望类型） | `Elab.Term.Support`、[language.md](language.md) |
| 内置宏 | `log! "level" msg` / `mark! name` | `Loader.Expand` 展开成隐藏 runtime 原语 | `Loader.Expand`、[logging.md](logging.md)、[observability.md](observability.md) |
| 元组 | `(a, b, c)` | 右嵌套成 `Pair a (Pair b c)`；类型 / 值 / 模式同一套语法（要求 `Pair` 可见） | `Frontend.Parser`、`Loader.Resolve` |
| unit | `()` | 类型位置是 `Unit`，值 / 模式位置是 `MkUnit`（要求可见） | `Frontend.Parser`、`Loader.Resolve` |
| 类型标注 | `(e : T)` | parser 编码成 `@vuna@ascribe`，名字解析后由 `Rast.ofExpr` 合成 `EAnn`（按 `T` 检查 `e`） | `Frontend.Parser`、`Frontend.Rast`、`Elab.Term.Impl` |
| 低优先级应用 / 管道 | `f $ x` / `x \|> f` | 普通运算符：定义在 `Base.Data.Function`，fixity 在 `Base.Internal.Operator` | `Base.Data.Function`、[operators.md](operators.md) |
| **不支持** | guard、`\case`、range、comprehension | 见 §11 | — |

## 3. 模式

| 形式 | 例子 | 说明 | 入口 |
| --- | --- | --- | --- |
| 构造子 | `C p q`、`x :: xs`、`Just y` | 同名构造子按期望族 / scrutinee 族定向解析 | `Elab.Match`、[language.md](language.md) |
| 符号构造子 | `(<+>) p q`、`(::)` | 声明位带括号，使用位裸写 | `Frontend.Parser` |
| 字面量 | `42` / `"s"` | Nat 按 `Zero` / `Succ` 构造子模式展开（可与构造子混用）；`Int` / `String` 走字面量分支，必须带变量 / `_` 兜底 | `Elab.Match` |
| 变量 / 通配 | `x` / `_` | 兜底只能放最后一个分支 | `Elab.Match` |
| as-pattern | `x@pat` / `_@x` | 整个值绑定到 `x`；case 分支里降成 `let` | `Elab.Match`、`Elab.Records` |
| 记录模式 | `R { x = p, y }` | 可省略字段（= 通配）；`{ y }` 是 pun | `Elab.Records` |
| 列表模式 | `[]` / `[a, b]` / `x :: xs` | 按 scrutinee 族展开 | `Elab.Term.Impl` |
| 元组模式 | `(a, b)` / `(a, (b, c))` | 右嵌套到 `Pair`；`()` 是 `MkUnit` | `Elab.Match` |
| 重复 binder | `f x x = ...` | 拒绝（`PS_RepeatedPatternBinder`）；不实现相等约束 | `Frontend.Parser` |
| `let` / `where` 绑定左端 | `MkPoint x y = e` | 必须不可失败（穷尽）；绑定出的名字在后续绑定与 body 可见 | `Elab.Term.Impl` |
| **不支持** | guard、view pattern、pattern synonym、浮点字面量模式 | 见 §11 | — |

## 4. 类型表达式

| 形式 | 例子 | 说明 | 入口 |
| --- | --- | --- | --- |
| 宇宙 | `Type` | `Type : Type` 被拒绝；无累积性 | [type-system.md](type-system.md) |
| Pi binder | `(x : T) -> U` / `{x : T} -> U` | 显式 / 隐式；同一组多名字展开成嵌套 Pi（`(x y : T) ->`） | `Frontend.Parser.parsePiBinder` |
| QTT 量词 | `(0 x : T) -> U` / `(1 x : T) -> U` | 0 = 擦除，1 = 线性，缺省 = ω；没有依赖 multiplicity / multiplicity 多态 | [qtt.md](qtt.md) |
| 自由小写名 | `vhead : Vec n a -> a` | 自动量化为隐式参数（`{a : Type}` 等），不需要显式 `forall` | `Elab.Driver`、[type-system.md](type-system.md) |
| 约束前缀 | `f : Eq a, Show a => a -> String` | 只允许顶层签名与 trait 头；其它位置报 `PS_ConstraintUnsupportedHere` | [records-traits.md](records-traits.md) |
| `Member` 签名糖 | `Member n ConsoleOp r => ...` | 展开成 `Member (Named n e) r` + 隐式 `Rig0` 证明 binder | `Elab.Driver`、[native-effects.md](native-effects.md) |
| 类型层字面量 | `Vec 3 a`、`Box "books"` | 只放行 `Int` / `String`；其它（含浮点）报 invalid type expression | [type-system.md](type-system.md) |
| 索引族应用 | `Vec (Succ n) a` | 索引构造子按名字解析 | [type-system.md](type-system.md) |
| 元组类型 | `(Int, String)` / `(Int, Int, Int)` | `Pair Int String`；右嵌套（fmt 展平成 `(Int, Int, Int)`） | `Frontend.Parser`、`Loader.Resolve` |
| unit 类型 | `()` | `Unit` | `Frontend.Parser`、`Loader.Resolve` |
| **不支持** | 类型层 lambda `\n => ...`、类型位置 `_` 洞、`f {e}` 隐式实参、`@T` 类型应用、`(n ** p)` | §11；`Sigma (\n => ...)` 因类型 lambda 缺失写不出来 | — |

## 5. 声明

| 形式 | 例子 | 说明 | 入口 |
| --- | --- | --- | --- |
| `data` | `data Vec : Nat -> Type -> Type where VCons : ...` | 参数是裸名字（不能写 kind 注解）；构造子逐行 `C : Ty`；Type-1 族合法 | `Elab.Data`、[type-system.md](type-system.md) |
| `record` | `record Pair a b where first : a` | 名义类型 + 合成位置构造子；字段访问 / 更新 / 模式都按字段表 | `Elab.Records`、[records-traits.md](records-traits.md) |
| 表示档位前缀 | `alias record R` / `boxed record R` / `linear record R` | 声明级表示选择，不改类型检查 | [records-traits.md](records-traits.md) |
| 派生 | `deriving (Show, Eq)` / `deriving via field (Show)` | `Elab.Derive` 展开；`via field` 走字典委托 | `Elab.Derive` |
| `trait` / `instance` | `trait Eq a where (==) : ...` | 无默认方法、无关联类型、无命名实例 | [records-traits.md](records-traits.md) |
| `axiom` | `axiom t : Type` | 无体 / 类型层；运行时使用报 `CG_AxiomAtRuntime` | `Elab.Data` |
| `extern` | `extern f "c_name" : T` | 绑定宿主符号 | `Elab.Data` |
| 抽象修饰 | `opaque` / `transparent` / `abstract` | 对下游隐藏 / 显式默认 / 本模块 seal | `Frontend.Parser`、[language.md](language.md) |
| 签名 | `f : C a => A -> B` | 可带约束前缀；η 收缩：子句参数少于签名时 body 须已是函数值 | `Elab.Trait`、[language.md](language.md) |
| 子句块 | `f 0 = ...` 紧接 `f n = ...` | 同名子句必须相邻成块（块内只有空行 / 注释）；零参定义只能一条；子句不得被前面的子句覆盖 | `Frontend.Parser`（`PS_ClauseNotAdjacent` / `PS_DefinitionDuplicate` / `PS_ClauseShadowed`）、`Elab.Match`（`TC_ClauseUnreachable`）、[language.md](language.md) |
| fixity | `infixl 6 +` / `infixr 5 ::` / `infix 4 ==` | 声明位在 imports 之后、第一个声明之前；**不接受 `= target` 别名** | `Frontend.Parser.parseFixityDecl`、[operators.md](operators.md) |
| 运算符定义 | `(<+>) : Int -> Int -> Int` + `(<+>) = add` | 符号名与标识符同等；声明位带括号 | `Frontend.Parser`、[operators.md](operators.md) |
| **不支持** | `newtype` / `type` 关键字、`data T = A \| B`、`mutual`、`syntax` / `notation` 用户宏 | §11 | — |

## 6. 模块、导入与导出

| 形式 | 例子 | 说明 | 入口 |
| --- | --- | --- | --- |
| 模块头 | `module A.B where` / `module A.B (x, T(..), module C) where` | 括号列表给出该模块的导出集；没有列表 = 不导出（模块默认私有） | `Frontend.Parser.parseModDecl` |
| import | `import M` / `import qualified M` / `import M as P` / `import qualified M as P` | 四种引用形态：裸名 / 弱限定短名 / 强 alias / 完整模块名 | `Loader.Modules`、[language.md](language.md) |
| 命名空间 import | `import A.X as Y` | 必须写 `as`；等价于按 A 导出的命名空间路径 X 找目标模块 | `Loader.Modules` |
| 逐定义导出 | `export f : T` / `export data T(..)` / `export T(A, B)` | 模块默认私有；`T` 只导出类型，`T(..)` 导出全部构造子 | `Loader.Modules`、[language.md](language.md) |
| 重导出 | `export import M (x, T(..))` / `export module M` / `export module M as X` | 平铺 vs 只导出命名空间路径 | `Loader.Modules` |
| 导出方式互斥 | 模块头导出列表与逐定义 `export` 不能同时出现 | 同时写报 `RN_DuplicateExport`（`module header`） | `Loader.Flatten.computeExports` |

## 7. 效应表面语法

| 形式 | 例子 | 说明 | 入口 |
| --- | --- | --- | --- |
| 行类型 | `Eff [ConsoleOp@audit, StateOp Nat@counter] Nat` | 行就是列表字面量，元素可带实例名 | [effects.md](effects.md) |
| 裸标签 | `Member n ConsoleOp r` | 实例名默认 `"default"` | [native-effects.md](native-effects.md) |
| 显式实例名 | `f@audit` / `[ConsoleOp@audit]` | 只允许行解或字面量；不参与位置实参 | `Elab.Term.Impl` |
| `perform` | `perform (Print s)` | 结果类型 = op 的索引 | `Elab.Term.Impl` |
| `handle` | `handle comp { return x -> pure x`，随后每个 `Print msg k -> ...` 一行，`}` 收尾 | 省略 `return` 时是 `\x => x` | `Elab.Term.Impl` |
| **不支持** | `consolePrintAt` 形式的具名调用、`Defaulted` / `:=` 默认参数、`a ->{r} b` 箭头效应 | 见 [native-effects.md](native-effects.md) 的非目标 | — |

## 8. 洞与内置宏

| 形式 | 规则 | 入口 |
| --- | --- | --- |
| 匿名洞 `_` | 只能在表达式 check 位；模式位报 `ExpectedPattern`，类型位按未绑定名报错 | `Elab.Term.Support` |
| 命名洞 `?name` | `?` 与标识符紧邻；同名多次是互相独立的洞；未解报 `TC_UnsolvedHole` | `Elab.Term.Support` |
| 宏调用 `name!` | `!` 与名字**紧邻**才算宏；`a ! b`（有空格）是普通中缀；`!=` / `!!` 不触发 | `Frontend.Parser.macroBangAt` |
| 参数贪婪 | `f log! "debug" x` 解析为 `f (log! "debug" x)`；块实参用括号 | `Frontend.Parser` |
| 内置宏集合 | `log!` / `mark!`；都展开成隐藏 runtime 原语，不需要 import | `Loader.Expand`、[logging.md](logging.md)、[observability.md](observability.md) |
| 用户自定义宏 | **不支持**（宏 / DSL 在 `architecture-target.md` 的独立轨道） | — |

## 9. 工具面对表面语法的约定

- **Fmt**：`parse → 规范打印`，按源码顺序与源码括号输出，不按 fixity 重排；因此不需要程序级
  fixity 闭包。新增表面形式必须能原样打印回可重新 parse 的源码（幂等）。元组是唯一例外：
  右嵌套的元组类型 / 值统一展平成 `(a, b, c)`（两者同型，展平是规范形）。
- **Lint**：`vuna lint --fix` 的 `list-literal` 规则把表达式 / 类型位置的闭合 `::` 链与裸 `Nil`
  归一成 `[..]`；模式里的 `::` 保持原样。`pair-sugar` 把表达式 / 类型 / 模式位置的显式
  `Pair a b` 应用归一成元组语法 `(a, b)`（右嵌套链展平），与 parser 的元组编码等价。
  `nat-literal` 把表达式 / 类型 / 模式位置的闭合 `Zero` / `Succ` 链归一成十进制字面量；
  开放链 `Succ n` 不动，模式位置依赖 Nat 字面量模式展开成构造子模式。
- **Index / Lsp**：洞名与宏标记不算引用；`@` 实例名是静态名字；任何引入新 binder 的形式
  （tuple 模式、类型层 binder 等）都要在绑定扫描与 rename 里有对应分支。
- **Parser 工具模式**：`PmTool` 跳过部分严格检查（如重复 binder），供 fmt / lint / index / doc / LSP
  在源码有错时仍能工作；编译器路径（`PmStrict`）仍然拒绝。**例外是子句块规则**
  （`PS_ClauseNotAdjacent` / `PS_DefinitionDuplicate` / `PS_ClauseShadowed`）：那是语法形状，
  两种模式同判——违规源码的「定义」边界本身有歧义，工具不应猜。

## 10. 成本模型：新增一个表面形式要动什么

实测一个**新 AST 节点**会落在约 18 个文件里（已删的 `ESect*` 曾是例子）：
`Frontend.Ast` + `Frontend.Canonical.Ast`（哈希编码 / 解码）+ `Frontend.Rast` 与 `Rast.Bridge`
+ `Frontend.Parser` + `Loader.{Fixity,Expand,Flatten,Resolve}` + `Elab.{Match,Term.Impl}`
+ `Fmt.{Expr,Comment}` + `Index.Scan` + `Lint.Rules` + `Lsp.{Bindings,Rename}` + `Sig`。

三条降低成本的路径：

1. **保留名编码**：parser 合成 `@vuna@...` 名字，Elab / Loader 解释，AST 不变
   （列表字面量、`perform` / `handle`、`f@name`、行条目、洞、宏）。
2. **只在 Parser 降级**：直接构造已有节点（如 `(+ e) a` → `a + e`），但 Fmt 仍要能打印原形。
3. **库层实现**：运算符只是普通名字 + fixity 声明，所以 `$` / `|>` / 组合子这类形式
   **零编译器改动**（只需要 `Base` 里有定义 + `infix*` 声明）。

另外两条硬约束：

- `packages/compiler` 的前端**在 seed 闭包里**：改 Parser/Ast 会让 seed 落后于源码
  （rotation 时机见 [bootstrap.md](bootstrap.md)），且新 seed 必须满足 stage1 == stage2；
  「只是语法」不等于「不进 TCB」。
- `packages/cli` 的 Fmt / Index / Lint / Lsp / Sig 不进 seed，但必须同轮更新，否则工具与编译器漂移。

## 11. 未支持与已决边界

记号：H = Haskell，I2 = Idris2，PS = PureScript。「决定」是当前结论，不是待办清单。

| 形式 | H | I2 | PS | vuna 现状 | 决定 |
| --- | --- | --- | --- | --- | --- |
| `$` 低优先级应用 | ✓ | ✓ | ✓ | `Base.Data.Function.($)`，`infixr 0` | 已支持（库层） |
| 管道 `\|>` / `&` | `&` | — | `#` | `Base.Data.Function.(\|>)`，`infixl 1`（`&` / `#` 不做） | 已支持（库层） |
| 组合子 `id` / `const` / `flip` / `compose` | ✓ | ✓ | ✓ | `Base.Data.Function`，随 `Prelude` 可见 | 已支持 |
| `do` 内 `let` | ✓ | ✓ | ✓ | `let` + 绑定块（签名行 / 局部函数 / `let pat = e` 都可用） | 已支持（纯绑定） |
| `do` 模式绑定 | ✓ | ✓ | ✓ | 降级成 `bind e (\v -> case v of pat => 后续语句)` | 已支持（不可反驳模式；可反驳模式报 `TC_NotExhaustive`，无 `MonadFail`） |
| guards（函数 / case / let） | ✓ | ✓ | ✓ | 无 | 不做（穷尽性 + 模式矩阵成本高） |
| lambda 参数模式 | ✓ | ✓ | ✓ | 参数只能是名字 | 不做（无签名 lambda 无期望类型） |
| `\case` | ✓ | — | ✓ | 无 | 不做 |
| tuple / unit 语法 | ✓ | ✓ | ✓ | `(a, b, c)` 右嵌套到 `Pair`；`()` 按位置展开成 `Unit` / `MkUnit` | 已支持（要求 `Pair` / `Unit` / `MkUnit` 可见） |
| 表达式类型标注 `(e : T)` | ✓ | ✓ | ✓ | 解析后合成 `Rast.EAnn`（与 where 签名同一路径） | 已支持 |
| `case` 多 scrutinee | — | — | — | 无专用语法 | 不做（写 `case (a, b)`） |
| 多 binder 重复（非线性模式） | — | ✓ | — | 拒绝 | 不做（需要相等约束） |
| Sigma `(n ** p)` / 依赖对 | — | ✓ | — | 无 `Sigma`；`**` 只是未知运算符 | 阻塞于**类型层 lambda**（见下） |
| 类型层 lambda / 类型层 section | — | ✓ | — | 报 invalid type expression | 类型系统特性，优先级低 |
| `with` 记法 | — | ✓ | — | 无 | 等具体痛点 |
| `rewrite` / `sym` / `trans` 糖 | — | ✓ | — | 无 | 同上 |
| list range / comprehension | ✓ | ✓ | — | 无（`List.range` 是库函数） | 不做 |
| `RecordWildCards` `{..}` | ✓ | — | — | 无（模式 pun 已支持） | 不做 |
| `TypeApplications` `@T` | ✓ | `@{}` | — | `@` 已被实例名占用 | 不做（语义冲突） |
| `MultiWayIf` / `ado` / unicode 语法 | 部分 | — | 部分 | 无 | 不做 |
| 十六进制 / 下划线数字 / 指数 | ✓ | ✓ | ✓ | 无 | 不做 |
| `newtype` / `type` 关键字 | ✓ | ✓ | ✓ | 刻意不做（`record` + `alias` 表达） | 不做 |
| 命名实例 / 默认方法 / 关联类型 | 部分 | ✓ | — | 刻意不做 | 不做 |
| 用户宏 / `syntax` 规则 | — | ✓ | — | 只有内置 `name!` | 走宏 / DSL 轨道，不做一次性糖 |
| 模块头导出列表 | ✓ | ✓ | ✓ | 括号列表逐项解析；与逐定义 `export` 互斥 | 已实现 |

## 12. 与其它页面的边界

| 内容 | 归属 |
| --- | --- |
| 表面形式、降级目标、工具约定、支持矩阵 | **本文** |
| 语言语义：绑定块签名约束、case 穷尽性、模块解析顺序、导出语义、η 展开 | [language.md](language.md) |
| 类型规则：宇宙、索引族、依赖匹配、相等证据、擦除、终止性 | [type-system.md](type-system.md) |
| QTT 用量与线性 | [qtt.md](qtt.md) |
| 记录 / trait / deriving / do / Monad | [records-traits.md](records-traits.md) |
| 运算符语义、fixity 表、实例落点 | [operators.md](operators.md) |
| 模板字符串语义与转义边界 | [templates.md](templates.md) |
| 效应系统与 `perform` / `handle` 语义 | [effects.md](effects.md) / [native-effects.md](native-effects.md) |
| 诊断码与错误形态 | [diagnostics.md](diagnostics.md) |