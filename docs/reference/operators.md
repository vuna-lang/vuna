# 操作符与名字

本文是运算符语义的**唯一权威**：运算符与函数的关系、`Eq` / `Ord` / `Num` 的真源、fixity 声明的唯一
来源、可见闭包与去重、实例落点规则、内建特化、反引号 / section / 用户符号名，以及系统边界。
语言语法见 [language.md](language.md)，trait / 字典见 [type-system.md](type-system.md)，原语见
[primitives.md](primitives.md)。

## 终态模型

**运算符 = 有 fixity 的普通名字**：`a op b` 与 `op a b` 同义；`` a `f` b `` 与 `f a b` 同义。
运算符不拥有独立语义，也不存在「只有编译器能定义运算符」的第二套命名空间。

比较 / 相等 `==` `/=` `<` `<=` `>` `>=` **就是** `Base.Trait.Eq` / `Base.Trait.Ord` 的方法名；
算术 `+` / `-` / `*` / `/` **就是** `Base.Trait.Num` 的方法名（内建四则对用户不可见，
codegen / 核心求值仍按 runtime 映射；用户实现 `Num` 配 `FromInt` 即可重载）。
trait 方法、instance 方法与 data 构造子都可以用符号名声明。

**声明位带括号，使用位裸写**：`(==) : a -> a -> Bool`、`(<+>) x y = ...`、
`(::) : a -> List a -> List a`；使用时写中缀 `a == b`，把运算符当值/前缀应用时写
`(==)` / `(==) a b`。fmt 以带括号为规范形式。

一元负号：前缀 `-` 在数字字面量上直接成为负字面量（`-1`，`(-1)` 与 `(- 1)` 按
`-` 与数字是否紧邻区分）；其它表达式展开成 `negate e`，`negate` 是独立的
`Base.Trait.Neg` trait（`Int` / `Float` 有实例）。`Nat` 没有加法逆元，`-x : Nat` 是类型错误；
`f - 1` 仍是二分减法。

## 机制（`Vuna.Compiler.Loader.Fixity`）

1. **parser 不做优先级**：任意中缀符号链收成右嵌套的 `EInfix` / `EBacktick`，括号收成
   `EParen`（保留分组边界）；`::` 在 pattern 里也保留符号原形。
2. **Loader 在名字解析之前重排**：按模块可见 fixity 表做 precedence climbing，把链重排成
   `EApp` / `EPi`；同一步完成**别名替换**（库内别名）与
   **section 展开**。
3. **重排后 AST 里没有 `EInfix` / `EBacktick` / `ESect*` / `EParen`**：Elab / codegen 看到的是
   普通应用；`Resolve` 对残留节点报 internal error（不静默透传）。
4. **fixity 唯一来源 = 源码里的 `infixl` / `infixr` / `infix` 声明**（库或用户）；
   base 侧的全部声明集中在 `Base.Internal.Operator`（定义模块 import 它），用户模块仍就地声明。
   编译器只为内建符号（`->`、`&&`、`||`）提供固定声明
   （`Loader.Fixity.builtinFixityDecls`），用户对它们声明 fixity 会报 `RN_BuiltinFixity`。
5. **未知运算符 = 报错**：符号运算符用于中缀、但可见表里没有声明 ⇒
   `unknown fixity for operator <op> (declare it with infixl/infixr/infix)`，check / compile
   非 0。**不静默默认优先级**——否则漏声明时 `a + b * c` 会静默变成 `(a + b) * c`。
   只有反引号名字没有声明时按 9 左结合（与 Haskell 一致）。
6. **fixity 全程序唯一**：一个运算符在加载闭包里只能有一处声明；重复声明报
   `RN_DuplicateFixity`（指向后一处）。`Module` 只存本模块自己的声明，加载完成后拼成
   一张全程序表参与每个模块的重排——import 到定义模块即全局生效，不再有「本模块优先」。
   base 把声明集中在 `Base.Internal.Operator`，因此 import 任一引用它的 base 模块都会让整张
   base 表进入闭包；代价是用户自定义同名运算符的冲突面变宽（这是有意的取舍）。
7. **fmt 用同一张表**：`Loader.Flatten.fixitiesForSource` 给出程序级声明表；重复/内建冲突
   在 fmt 路径同样报错，不静默按第一处处理。

## `Eq` / `Ord` 的唯一真源

- 方法名是唯一真源：`Base.Trait.Eq` 的 `(==)` / `(/=)`，`Base.Trait.Ord` 的 `(<)` / `(<=)` /
  `(>)` / `(>=)`。
- `Elab` 的运算符特化按「名字是否为 Eq/Ord 类的方法投影」判定
  （`Elab.Dict.isEqMethod` / `isCmpMethod`，从类表取投影名，不硬编码模块前缀）；
  投影名最后一段是运算符名（`Base.Trait.Eq.==` → `==`）；`Elab.Dict.opShortOf` 同时认
  旧式标识符拼写（`eq` / `lt` 等），实例与派生体用哪种写法都能命中。
- Int / String / Float 上的特化（`bi_eq_int` / `bi_eq_str` / `bi_eq_float` / `bi_*_int` /
  `bi_*_float` / `bi_*_str` / `bi_*_bool`）是 **内建实例实现**，不是运算符的独立语义：它可以发生在
  方法投影的饱和应用上，因此手写实例、`deriving` 生成的比较都命中同一条规则；
  特化优先于字典搜索，实例体里写 `==` 不会递归。
- 无 `Eq` 证据（具体类型无实例、`Eq` 类不在作用域）仍在 check 期报错；没有结构比较兜底。

## `Num` 的唯一真源

- 方法名是唯一真源：`Base.Trait.Num` 的 `(+)` / `(-)` / `(*)` / `(/)`（fixity 也在该模块）。
- `Elab` 的算术特化按「名字是否为 `Num` 类的方法投影」判定（`Elab.Dict.numMethodOpName`，
  从类表取投影名、不硬编码模块前缀），把投影映射回运算符名后复用
  `Elab/Term/Impl.specializeArithCheck/AppFuel`；实例体里写 `x + y` 不会自递归。
- Int / Nat / Float 的 `Num` 实现在类型模块（`Base.Data.Int` / `Base.Data.Nat` / `Base.Data.Float`），
  精化器把它们特化回 `bi_*` / `nat*` 内建原语；其它类型回落到普通 trait 方法应用
  （`Num a =>` 泛型代码）。
- **用户类型可重载四则**：实现 `Num`（并配 `FromInt` 让字面量在期望类型位置降级）后
  `1 + 2 : MyNum` 可用；期望结果类型经 hint 先解出类参数，实参字面量再按该类型 check
  （夹具 `test/corpus/traits/53_user_num`）。推断位置（没有期望类型）仍按 Int 字面量，
  与既有「字面量默认 Int」一致。
- 终止性检查的 fuel 递减规则认 `-` 与 `Base.Trait.Num.-` 投影
  （`Elab/Termination/Measure.isSubOpName`）。
- 算术运算符来自 `Base.Trait.Num`（fixity 声明在该模块）：**不依赖 vuna-base 的包
  没有这套运算符**，与 `Eq` / `Ord` 等方法一样必须在作用域里（无 base 上下文不能写
  `+ - * /`；base 包内模块则按需 `import Base.Trait.Num`）。

## 库声明表

用 `infixl N op` / `infixr N op` / `infix N op`（可选 `= 目标名`）；声明位置是模块头与
import 之后、第一个声明之前（fmt 的规范位置），每条一行。base 包的全部源码级 fixity 声明
集中在 `Base.Internal.Operator`（引用这些运算符的模块 import 它）；`->` / `&&` / `||` 的 fixity 由
编译器固定（`Loader.Fixity.builtinFixityDecls`），不在 `Base.Internal.Operator` 里。

| 符号 | 优先级 / 结合 | 别名 | 定义所在模块 | 说明 |
| --- | --- | --- | --- | --- |
| `==` | 4 左 | — | `Base.Trait.Eq` | `Eq` 方法（`(==)`） |
| `/=` | 4 左 | — | `Base.Trait.Eq` | `Eq` 方法（`(/=)`） |
| `<` `<=` `>` `>=` | 4 左 | — | `Base.Trait.Ord` | `Ord` 方法（`(<)` 等） |
| `&&` `\|\|` | 3 / 2 左 | — | `Base.Data.Bool` | 短路内建（不是 trait 方法）；fixity 由编译器固定 |
| `+` `-` | 6 左 | — | `Base.Trait.Num` | `Num` 方法（`(+)` / `(-)`；实例由精化器特化回内建原语） |
| `*` `/` | 7 左 | — | `Base.Trait.Num` | `Num` 方法（`(*)` / `(/)`） |
| `++` | 5 右 | — | `Base.Data.String` | String 内建值 |
| `::` | 5 右 | — | `Base.Data.List` / `Base.Effect.Core.Row` | 两个族各自的 cons 构造子（同名，按期望族定向解析） |
| `>>=` | 1 右 | — | `Base.Trait.Monad` | `Monad` 方法（`(>>=)`） |
| `>>` | 1 左 | —（do 派生） | `Base.Trait.Monad` | `a >> b` 展开为 `(>>=) a (\_ => b)`（Loader 的 do 派生，用调用点可见的 `>>=`） |

`>>` 留在 Loader 的 do 派生里：它需要「丢弃第一个结果」的适配，且必须用**调用点可见**
的 `>>=`（模块内自定义 Monad trait 时也要绑对）；`Base.Trait.Monad` 提供它的 fixity 声明
以及 `(>>) : Monad m => m a -> m b -> m b` 的等价定义。base 包模块**不**自动注入 Prelude，因此每个模块用到的运算符
必须由本模块声明或 import 闭包可见。

`pure` 在 `Base.Trait.Applicative`（`Base.Trait.Monad` 重导出）；`Applicative` 的三个方法 `pure` / `ap` /
`liftA2` 都由实例显式实现（trait 没有默认实现）。把 `liftA2` 写成从 `ap` 派生的顶层函数
也可以：字典方法字段是不透明值，访问器在方法签名上 cast 一次，`pure` / `ap` 各自按调用点
实例化（见 [records-traits.md](records-traits.md)）。

## 反引号中缀、section、用户符号名

- **反引号中缀**：`` a `f` b `` ≡ `f a b`。`f` 可以是标识符或符号名；fixity 按名字查表，
  没有声明时按 9 左结合（Haskell 默认），**不报错**（前缀形式本身无歧义）。
- **section**（语法糖，Loader 在名字解析前展开）：
  - `(+)` ≡ 运算符作为值（canonical 名：`(==)`→`eq` 等库内别名；`(::)` / `(>>=)` 是构造子/方法本身）；
  - `(+ e)` ≡ `\vuna_section => vuna_section + e`；
  - `(e +)` ≡ `\vuna_section => e + vuna_section`。
  - section 不要求运算符有 fixity 声明（`(+)` 是无歧义的前缀使用）。
  - 展开产物是 **lambda**，因此「直接应用」section（`(+ 3) 4`）会命中既有的 lambda 推断边界
    `TC_LambdaNoSignature`（普通 `(\x => x) 5` 同样报错）；把 section 传给带签名的参数
    （`inc : Int -> Int`、`inc = (+ 3)`）正常。
- **用户符号名**：`<+> a b = ...` 与 `<+> : Int -> Int -> Int` 允许符号名 def / signature，
  可出现在中缀（需 `infix*` 声明）、反引号、section、导出列表；`->`、反引号与语法符号是保留
  集合，不能当可定义名。codegen 把非 `[A-Za-z0-9]` 字符转义成 `_x<code>_`
  （`<+>` → `_x60__x43__x62_`），`ensureUniqueOcamlNames` 仍是单射性护栏。

## fmt 与程序级 fixity

- `Vuna.Fmt.formatSourceWith : List FixityDecl -> String -> Result String`：第一个参数是调用方
  给的**程序可见** fixity 闭包；fmt 内部把本文件的本地声明放最前（本地优先）。
- 打印用 **keep 表**（`tableOfKeepOps`）：不替换别名、保留反引号 / section 原形；未知符号运算符
  与 check 路径同样**报错**（fmt 宁可拒绝格式化，也不按错优先级重排改变语义）。
- fmt 会**打印 `infix*` 声明**（imports 之后、源码顺序，每条一行），声明的 span 参与注释锚点。
- 调用方（`vuna fmt` CLI 与 LSP formatting）用 `Loader.Flatten.fixitiesForSource` 取闭包；
  取不到（上下文/依赖加载失败）时 fmt 报错并**不格式化**该文件，不静默按默认优先级处理。

## 算术运算符的特化

`+ - * /` 是 `Base.Trait.Num` 的方法；`Base.Data.Int` / `Base.Data.Nat` / `Base.Data.Float` 的实例
方法体写内建运算符，精化器按期望类型/实参类型把它们特化回内建原语：

- 期望类型或两侧都是 Nat（含 Nat + 整数字面量）→ `natAdd/natSub/natMul/natDiv`，结果 Nat；
- 任一操作数是真正的 `Int` → 保持 Int intrinsic，Nat 一侧插入 `natToInt`（隐式提升）；
- 期望 Int 而表达式推出 Nat → 整个表达式提升；期望 Nat 而操作数是 Int（非字面量）→ 类型错误；
- 期望类型是其它类型（用户 `Num` 实例）→ 不特化，走普通 trait 方法应用；字面量实参按
  `FromInt` 在该类型下降级（期望结果类型 hint）；
- Float 的特化到 IEEE 语义（除零不失败，见 [floats.md](floats.md)），与 Int 的除零检查不同。

实现入口：`Elab/Dict.numMethodOpName` + `Elab/Term/Impl.specializeArith*`（与 `==`/比较
特化同一层）；Codegen 对 Int 路径继续用内联运算符，对 Nat 路径用 `bi_nat*` helper。

## 系统边界

- **语法性符号**仍由编译器处理：`->`（Pi）、`=`（定义/绑定）、`|`、`,`、`\`、`=>`、反引号
  定界符，以及括号 / 分隔符（`(` `)` `[` `]` `{` `}`）、`.`（字段选择）——它们出现在表达式
  位置时 parser 立即停止中缀链，不是可声明的值名。
- **内部生成名**：`Elab.Derive`（deriving 展开）与 `Elab.Match`（字面量模式降级）在 Elab 内部
  直接构造 `EVar "=="` / `EVar "<"`，不经过 Loader 重排；`Elab.Dict` 的
  `isEqMethod` / `isCmpMethod` 显式接受这些内部名并把它们映射到方法短名。用户源码的 `==`
  一律在 Loader 重排里变成 `eq`，因此内部名不会泄漏到用户语义。
- **parser 没有固定运算符表**：`Frontend/Parser/Support.vuna` 没有 `infixInfo`；`::` / `>>=` /
  `>>` 都由声明表的别名处理。`[]` / `[a, b]` 列表字面量与 pattern 仍以 `(::)`/`Nil`
  折叠（语法糖，不是运算符）。
- **`&&` / `||`** 是短路内建（不是 trait 方法），fixity 来自 `Base.Data.Bool` 声明。
- **`++`** 是 String 内建值，fixity 来自 `Base.Data.String` 声明；**`+` / `-` / `*` / `/`** 是
  `Base.Trait.Num` 方法（fixity 来自 `Base.Trait.Num` 声明），内建名只保留给 codegen / 核心求值
  的 runtime 映射（`intrinsicVisible=False`）。

## 实例落点规则

**实例优先放类型模块**（类型模块 import trait 模块，依赖单向）；**仅当 trait 签名直接
依赖该类型、放类型模块会成环时，才放 trait 模块**。

| 类型 | 实例落点 | 原因 |
| --- | --- | --- |
| `Bool` | `Show` → `Base.Data.Bool`；`Eq` / `Ord` → `Base.Trait.Eq` / `Base.Trait.Ord` | `Show` 方法签名不依赖 Bool，可放类型模块；`eq : a -> a -> Bool` 的返回类型是 Bool，放 `Base.Data.Bool` 会形成 `Base.Data.Bool ↔ Base.Trait.Eq` 的 import 环（Loader 报 `ImportCycle`） |
| `Int` | `Base.Data.Int` | primitive 类型模块；实例体走 Int 内建特化 |
| `Float` | `Base.Data.Float` | primitive 类型模块；实例体走 Float 内建特化；随 `Prelude` 自动加载 |
| `String` | `Eq` / `Ord` → `Base.Data.String`；`Show` → `Base.Trait.Show` | String 经 `Base.Trait.Interp` 依赖 `Base.Trait.Show`，把 `Show String` 放回 String 会成环 |
| `List` / `Maybe` / `Pair` / `Result` | 各自模块 | 约束 `Show`；另有 `Eq`（List/Maybe/Pair/Result）、`Ord`（List/Maybe/Pair）、`Hashable`、`Applicative` / `Foldable` / `Traversable` 实例 |
| `Ordering` / `Unit` | `Base.Trait.Ord` / `Base.Data.Unit` | `Ordering` 定义在 trait 模块 `Base.Trait.Ord`（`compare` 依赖它）；`Unit` 是普通 data，实例跟类型模块 |
| `Array` / `IORef` | 内建类型，实例可放任意模块（约定 `Base.Container.Array` 等） | 没有定义模块；孤儿规则对它们放行（`isGlobalHeadType` 对内建类型放行）。`Show` / `Eq (Array a)` 已落在 `Base.Container.Array`（实例体经 `toList` 复用 List） |
| `HashMap` / `HashSet` | 各自模块 | 抽象类型，构造器不导出；`Show` 实例经 `toList`（`HashMap` 的 `toList` 需要 `Eq k`） |

实例实现：data 类型用模式匹配（`Bool` 按 `True`/`False` 穷尽；`deriving (Eq)` 生成
同形实例）；primitive 没有构造子，`Int`/`String` 的实例体写 `==` / `<`，命中内建特化，
不自递归。实例必须被加载才参与搜索：`Base.vuna` / `Prelude.vuna` 显式
`import Base.Data.Int`；`Show Bool` 随 `Base.Data.Bool`、`Eq/Ord Bool` 随 `Base.Trait.Eq` / `Base.Trait.Ord` 加载。

## 实现落点

| 关注点 | 位置 |
| --- | --- |
| 中缀重排 / 别名替换 / section 展开 / 严格/保留模式 | `Loader.Fixity`（`reorderProgram` / `lookupFixity` / `lookupFixityDecl` / `syntaxFixityDecls` / `tableOf` / `tableOfKeepOps` / `symbolOfTargetIn`） |
| fixity 声明语法与收集 | `Frontend.Parser`（`parseFixityDecl` / `parseSectionAtom` / `parseInfix`）+ `Frontend.Ast`（`FixityDecl` / `Source.fixities`） |
| 模块可见 fixity 闭包与去重 | `Loader.Modules.Module.fixities` + `Loader.Flatten.visibleFixitiesOf` / `dedupeFixities` |
| 程序级 fixity（fmt / LSP） | `Loader.Flatten.fixitiesForSource` + `Vuna.Fmt.formatSourceWith` |
| 方法投影判定 / 特化 | `Elab.Dict.isEqMethod` / `isCmpMethod` / `specializeEqTy` / `specializeCmpTy` |
| 内建 runtime 名 | `Vuna.Compiler.Base.Intrinsics.allIntrinsics`（`bi_*` 仅内部可见） |
| trait 声明 / 库声明表 | `packages/base/lib/Base/{Eq,Ord,Bool,Int,String,List,Monad,Applicative,Monoid,Foldable,Traversable,Hashable}.vuna` |
| `>>` 的展开 | `Loader.Fixity.infixTerm`（`bind a (\_ -> b)`）；fixity 声明在 `packages/base/lib/Base/Monad.vuna` |
| 终止性守卫识别 | `Elab.Termination.Measure.guardPosVar`（按方法短名 `le`/`ge`/`lt`） |

## 测试

- `test/corpus/traits/16_eq_ord_alias.vuna`：`==` 与 `eq`、`<` 与 `lt` 一致；Int/String
  特化、Bool 模式匹配实例、`deriving (Eq, Ord)`、`mem` 的字典穿参。
- `test/corpus/dt/64_backtick_infix`：反引号中缀与默认 9 左结合、与 `+` / `*` 混排。
- `test/corpus/dt/65_section`：`(+)` / `(+ e)` / `(e +)`、`(::)` / `(==)` 别名、与普通括号混用。
- `test/corpus/dt/66_user_symbol_fn`：用户符号名定义 + `infixl` / `infixr` + 反引号 + section。
- `test/corpus/dt_err/53_unknown_fixity`：未知符号运算符报 `unknown fixity`。
- `test/corpus/fmt/23_fixity_decls` / `24_backtick_sections` / `25_custom_ops`：声明打印与
  fmt 新语法往返。
- `nix run .#vuna-run-tests` 全量；`sh nix/seed/rotate.sh <vuna>` 验证自举 fixed point。