# 操作符与名字（M31）

本文是运算符语义的**唯一权威**：运算符与函数的关系、`Eq` / `Ord` 的真源、fixity 声明的唯一
来源、可见闭包与去重、实例落点规则、内建特化、反引号 / section / 用户符号名，以及系统边界。
语言语法见 [language.md](language.md)，trait / 字典见 [type-system.md](type-system.md)，原语见
[primitives.md](primitives.md)。

## 终态模型

**运算符 = 有 fixity 的普通名字**：`a op b` 与 `op a b` 同义；`` a `f` b `` 与 `f a b` 同义。
运算符不拥有独立语义，也不存在「只有编译器能定义运算符」的第二套命名空间。

| 阶段 | 内容 | 状态 |
| --- | --- | --- |
| M31.1 | `==` `/=` `<` `<=` `>` `>=` 变成 Eq/Ord **方法名的解析期别名**；trait 声明与实例分离；Int/String 内建特化 | 已落地 |
| M31.2 | parser 只产出 `EInfix`/`EParen`；fixity 与别名声明由 `Loader.Fixity` 在 resolve 前重排消费；删除 parser 的固定优先级表；`::` / `>>=` / `>>` 离开 parser | 已落地 |
| M31.3 | 反引号中缀、section、用户符号名；库内 `infix*` 声明成为 fixity 的**唯一来源**（编译器兜底表删除）；fmt 感知程序级 fixity 并打印声明；可见闭包去重 | 已落地 |

## 机制（`Vuna.Compiler.Loader.Fixity`）

1. **parser 不做优先级**：任意中缀符号链收成右嵌套的 `EInfix` / `EBacktick`，括号收成
   `EParen`（保留分组边界）；`::` 在 pattern 里也保留符号原形。
2. **Loader 在名字解析之前重排**：按模块可见 fixity 表做 precedence climbing，把链重排成
   `EApp` / `EPi`；同一步完成**别名替换**（`==`→`eq`、`::`→`Cons`、`>>=`→`bind`）与
   **section 展开**。
3. **重排后 AST 不再含 `EInfix` / `EBacktick` / `ESect*` / `EParen`**：Elab / codegen 看到的是
   普通应用；`Resolve` 对残留节点报 internal error（不静默透传）。
4. **fixity 唯一来源 = 源码里的 `infixl` / `infixr` / `infix` 声明**（库或用户），没有编译器
   内建运算符表。`->` 是语法而不是用户运算符，由 `Loader.Fixity.syntaxFixityDecls` 恒可见
   （不看也不受库声明影响）。
5. **未知运算符 = 报错**：符号运算符用于中缀、但可见表里没有声明 ⇒
   `unknown fixity for operator <op> (declare it with infixl/infixr/infix)`，check / compile /
   interp 非 0。**不静默默认优先级**——否则漏声明时 `a + b * c` 会静默变成 `(a + b) * c`。
   只有反引号名字没有声明时按 9 左结合（与 Haskell 一致）。
6. **可见 fixity 闭包去重**：每个模块的 visible 表按运算符**首现去重**（本模块声明优先，其次
   import 顺序）。import 图里的 diamond 会让「本模块 ++ import 闭包」的重复拼接按路径数指数
   增长；去重后每个模块的可见表只含不同运算符（`Flatten.dedupeFixities`）。查找本来就用
   「第一处匹配」，去重不改变语义。
7. **fixity 是程序级属性**：同一个运算符在 A 模块的优先级可能来自它 import 的库模块，因此
   fmt 需要调用方给出「程序可见闭包」（`Loader.Flatten.fixitiesForSource`）。

## `Eq` / `Ord` 的唯一真源

- 方法名是唯一真源：`Base.Eq` 的 `eq` / `neq`，`Base.Ord` 的 `lt` / `le` / `gt` / `ge`。
  运算符只是它们的中缀写法。
- `Elab` 的运算符特化按「名字是否为 Eq/Ord 类的方法投影」判定
  （`Elab.Dict.isEqMethod` / `isCmpMethod`，从类表取投影名，不硬编码模块前缀）；
  `==` 与 `eq`、`<` 与 `lt` 走完全相同的路径。
- Int / String 上的特化（`bi_eq_int` / `bi_eq_str` / `bi_*_int` / `bi_*_generic`）是
  **内建实例实现**，不是运算符的独立语义：它可以发生在方法投影的饱和应用上，因此
  `eq` / `==` / deriving 生成的比较都命中同一条规则；特化优先于字典搜索，实例体里写
  `==` 不会递归。
- 无 `Eq` 证据（具体类型无实例、`Eq` 类不在作用域）仍在 check 期报错；没有结构比较兜底。

## 库声明表（M31.3）

声明写在各库模块里，用 `infixl N op` / `infixr N op` / `infix N op`（可选 `= 目标名`）；
声明位置是模块头与 import 之后、第一个声明之前（fmt 的规范位置），每条一行。

| 符号 | 优先级 / 结合 | 别名 | 声明所在模块 | 说明 |
| --- | --- | --- | --- | --- |
| `==` | 4 左 | `eq` | `Base.Eq` | `Eq` 方法 |
| `/=` | 4 左 | `neq` | `Base.Eq` | `Eq` 方法 |
| `<` `<=` `>` `>=` | 4 左 | `lt` `le` `gt` `ge` | `Base.Ord` | `Ord` 方法 |
| `&&` `\|\|` | 3 / 2 左 | — | `Base.Bool` | 短路内建（不是 trait 方法） |
| `+` `-` | 6 左 | — | `Base.Int` | Int 内建值 |
| `*` `/` | 7 左 | — | `Base.Int` | Int 内建值 |
| `++` | 5 右 | — | `Base.String` | String 内建值 |
| `::` | 5 右 | `Cons` | `Base.List` | 表达式与 pattern 都走这条声明 |
| `>>=` | 1 右 | `bind` | `Base.Monad` | `Monad` 方法 |
| `>>` | 1 左 | —（do 派生） | `Base.Monad` | `a >> b` ≡ `bind a (\_ -> b)`，由 Loader 展开（不是普通别名） |

`>>` 不走别名表：它需要「丢弃第一个结果」的适配，且必须用**调用点可见**的 `bind`（模块内自定义 Monad trait 时也要绑对），所以留在 Loader 的 do 派生里；`Base.Monad` 只提供它的 fixity
声明与 `>>=` → `bind` 别名。base 包模块**不**自动注入 Prelude，因此每个模块用到的运算符
必须由本模块声明或 import 闭包可见（审计清单见 git 历史）。

## 反引号中缀、section、用户符号名（M31.3）

- **反引号中缀**：`` a `f` b `` ≡ `f a b`。`f` 可以是标识符或符号名；fixity 按名字查表，
  没有声明时按 9 左结合（Haskell 默认），**不报错**（前缀形式本身无歧义）。
- **section**（语法糖，Loader 在名字解析前展开）：
  - `(+)` ≡ 运算符作为值（canonical 名：`(==)`→`eq`、`(::)`→`Cons`、`(>>=)`→`bind`）；
  - `(+ e)` ≡ `\vuna_section => vuna_section + e`；
  - `(e +)` ≡ `\vuna_section => e + vuna_section`。
  - section 不要求运算符有 fixity 声明（`(+)` 是无歧义的前缀使用）。
  - 展开产物是 **lambda**，因此「直接应用」section（`(+ 3) 4`）会命中既有的 lambda 推断边界
    `TC_LambdaNoSignature`（普通 `(\x => x) 5` 同样报错）；把 section 传给带签名的参数
    （`inc : Int -> Int`、`inc = (+ 3)`）正常。见 [limits.md](limits.md)。
- **用户符号名**：`<+> a b = ...` 与 `<+> : Int -> Int -> Int` 允许符号名 def / signature，
  可出现在中缀（需 `infix*` 声明）、反引号、section、导出列表；`->`、反引号与语法符号是保留
  集合，不能当可定义名。codegen 把非 `[A-Za-z0-9]` 字符转义成 `_x<code>_`
  （`<+>` → `_x60__x43__x62_`），`ensureUniqueOcamlNames` 仍是单射性护栏。

## fmt 与程序级 fixity（M31.3）

- `Vuna.Fmt.formatSourceWith : List FixityDecl -> String -> Result String`：第一个参数是调用方
  给的**程序可见** fixity 闭包；fmt 内部把本文件的本地声明放最前（本地优先）。
- 打印用 **keep 表**（`tableOfKeepOps`）：不替换别名、保留反引号 / section 原形；未知符号运算符
  与 check 路径同样**报错**（fmt 宁可拒绝格式化，也不按错优先级重排改变语义）。
- fmt 会**打印 `infix*` 声明**（imports 之后、源码顺序，每条一行），声明的 span 参与注释锚点。
- 调用方（`vuna fmt` CLI 与 LSP formatting）用 `Loader.Flatten.fixitiesForSource` 取闭包；
  取不到（上下文/依赖加载失败）时 fmt 报错并**不格式化**该文件，不静默按默认优先级处理。

## 算术运算符的 Int/Nat 特化（M34.7）

`+ - * /` 仍是**内建值**（不是 trait 方法）；精化器按期望类型/实参类型把它们特化：

- 期望类型或两侧都是 Nat（含 Nat + 整数字面量）→ `natAdd/natSub/natMul/natDiv`，结果 Nat；
- 任一操作数是真正的 `Int` → 保持 Int intrinsic，Nat 一侧插入 `natToInt`（隐式提升）；
- 期望 Int 而表达式推出 Nat → 整个表达式提升；期望 Nat 而操作数是 Int（非字面量）→ 类型错误；
- 只有 Int/Nat 有这种特化，用户自定义数值类型不能重载 `+ - * /`（通用 `Num` 是 debt）。

实现入口：`Elab/Term/Impl.specializeArithCheck/AppFuel`（与 `==`/比较特化同一层）；
Codegen 对 Int 路径继续用内联运算符，对 Nat 路径用 `bi_nat*` helper。

## 系统边界

- **语法性符号**仍由编译器处理：`->`（Pi）、`=`（定义/绑定）、`|`、`,`、`\`、`=>`、反引号
  定界符，以及括号 / 分隔符（`(` `)` `[` `]` `{` `}`）、`.`（字段选择）——它们出现在表达式
  位置时 parser 立即停止中缀链，不是可声明的值名。
- **内部生成名**：`Elab.Derive`（deriving 展开）与 `Elab.Match`（字面量模式降级）在 Elab 内部
  直接构造 `EVar "=="` / `EVar "<"`，不经过 Loader 重排；`Elab.Dict` 的
  `isEqMethod` / `isCmpMethod` 显式接受这些内部名并把它们映射到方法短名。用户源码的 `==`
  一律在 Loader 重排里变成 `eq`，因此内部名不会泄漏到用户语义。
- **parser 固定表已删除**：`Frontend/Parser/Support.vuna` 没有 `infixInfo`；`::` / `>>=` /
  `>>` 都由声明表的别名处理。`[]` / `[a, b]` 列表字面量与 pattern 仍以 `Cons`/`Nil`
  折叠（语法糖，不是运算符）。
- **`&&` / `||`** 仍是短路内建（不是 trait 方法），fixity 来自 `Base.Bool` 声明。
- **`+` / `-` / `*` / `/` / `++`** 仍是内建值（Int/String 原语；数值 trait 归 F4），fixity 来自
  `Base.Int` / `Base.String` 声明。

## 实例落点规则

**实例优先放类型模块**（类型模块 import trait 模块，依赖单向）；**仅当 trait 签名直接
依赖该类型、放类型模块会成环时，才放 trait 模块**。

| 类型 | 实例落点 | 原因 |
| --- | --- | --- |
| `Bool` | `Base.Eq` / `Base.Ord` | `eq : a -> a -> Bool` 的返回类型是 Bool；放 `Base.Bool` 会形成 `Base.Bool ↔ Base.Eq` 的 import 环（Loader 报 `ImportCycle`） |
| `Int` | `Base.Int` | primitive 类型模块；实例体走 Int 内建特化 |
| `String` | `Base.String` | primitive 类型模块；实例体走 String 内建特化 |
| `List` / `Maybe` / `Pair` / `Result` | 各自模块（按需） | 容器实例当前不内置，将来按同一规则声明 |

实例实现：data 类型用模式匹配（`Bool` 按 `True`/`False` 穷尽；`deriving (Eq)` 生成
同形实例）；primitive 没有构造子，`Int`/`String` 的实例体写 `==` / `<`，命中内建特化，
不自递归。实例必须被加载才参与搜索：`Base.vuna` / `Prelude.vuna` 显式
`import Base.Int`（Bool 实例随 `Base.Eq` / `Base.Ord` 加载）。

## 实现落点

| 关注点 | 位置 |
| --- | --- |
| 中缀重排 / 别名替换 / section 展开 / 严格/保留模式 | `Loader.Fixity`（`reorderProgram` / `lookupFixity` / `lookupFixityDecl` / `syntaxFixityDecls` / `tableOf` / `tableOfKeepOps` / `symbolOfTargetIn`） |
| fixity 声明语法与收集 | `Frontend.Parser`（`parseFixityDecl` / `parseSectionAtom` / `parseInfix`）+ `Frontend.Ast`（`FixityDecl` / `Source.fixities`） |
| 模块可见 fixity 闭包与去重 | `Loader.Modules.Module.fixities` + `Loader.Flatten.visibleFixitiesOf` / `dedupeFixities` |
| 程序级 fixity（fmt / LSP） | `Loader.Flatten.fixitiesForSource` + `Vuna.Fmt.formatSourceWith` |
| 方法投影判定 / 特化 | `Elab.Dict.isEqMethod` / `isCmpMethod` / `specializeEqTy` / `specializeCmpTy` |
| 内建 runtime 名 | `Vuna.Compiler.Intrinsics.allIntrinsics`（`bi_*` 仅内部可见） |
| trait 声明 / 库声明表 | `base/lib/Base/{Eq,Ord,Bool,Int,String,List,Monad}.vuna` |
| `>>` 的展开 | `Loader.Fixity.infixTerm`（`bind a (\_ -> b)`）；fixity 声明在 `base/lib/Base/Monad.vuna` |
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
- `nix run .#vuna-run-tests` 全量；`sh nix/seed-rotate.sh <vuna>` 验证自举 fixed point。