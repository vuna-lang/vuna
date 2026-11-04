# 操作符与名字（M31）

本文是运算符语义的**唯一权威**：运算符与函数的关系、`Eq`/`Ord` 的真源、实例落点规则、
内建特化与系统边界。语言语法见 [language.md](language.md)，trait/字典见
[type-system.md](type-system.md)，原语见 [primitives.md](primitives.md)。

## 终态模型

**运算符 = 有 fixity 的普通名字**：`a op b` 与 `op a b` 同义；`` a `f` b `` 与 `f a b` 同义。
运算符不拥有独立语义，也不存在「只有编译器能定义运算符」的第二套命名空间。

分阶段落地（M31）：

| 阶段 | 内容 | 状态 |
| --- | --- | --- |
| M31.1 | `==` `/=` `<` `<=` `>` `>=` 变成 Eq/Ord **方法名的解析期别名**；trait 声明与实例分离；Int/String 内建特化 | 已落地 |
| M31.2 | fixity / 别名声明进库与用户源码（`infixl 6 +`、`infix 4 == = eq`），删除 parser 与 fmt 的固定表；`::` / `>>=` / `>>` 离开 parser | 待做 |
| M31.3 | 反引号中缀、section `(+)` / `(+ 3)` / `(3 +)`、用户符号名函数 | 待做 |

M31.1 的别名表在 `Loader.Resolve.builtinOpAlias`（`==`→`eq`、`/=`→`neq`、`<`→`lt`、
`<=`→`le`、`>`→`gt`、`>=`→`ge`）；M31.2 会把它换成库里的 `infix ... = ...` 声明并删除
本表。别名是**解析期替换**：替换目标按正常 import 解析，不产生新的运行时名字。

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

## 系统边界

- **语法性符号**仍由编译器处理：`->`（Pi）、`=`（定义/绑定）、`|`、`,`、`\`、`=>`。
  它们不是可声明的值名。
- **内部生成名**：`Elab.Derive`（deriving 展开）与 `Elab.Match`（字面量模式降级）在
  Elab 内部直接构造 `EVar "=="` / `EVar "<"`，不经过 Loader 别名；`Elab.Dict`
  的 `isEqMethod` / `isCmpMethod` 显式接受这些内部名并把它们映射到方法短名。
  用户源码的 `==` 一律在 Loader 被别名成 `eq`，因此内部名不会泄漏到用户语义。
- **parser / fmt 固定表（M31.1 遗留）**：`Frontend/Parser/Support.vuna` 的
  `infixInfo`（优先级）与 `Fmt/Expr.vuna` 的 `infixPrec` 仍在；`::` / `>>=` 仍是 parser
  字符串改写（`Cons` / `bind`）。这些在 M31.2 移入库声明。
- **`&&` / `||`** 仍是短路内建（不是 trait 方法），不参与别名。
- **`+` / `-` / `*` / `/` / `++`** 仍是内建值（Int/String 原语；数值 trait 归 F4）。

## 实现落点

| 关注点 | 位置 |
| --- | --- |
| 运算符别名表（M31.1，M31.2 删除） | `Loader.Resolve.builtinOpAlias` |
| 方法投影判定 / 特化 | `Elab.Dict.isEqMethod` / `isCmpMethod` / `specializeEqTy` / `specializeCmpTy` |
| 内建 runtime 名 | `Vuna.Compiler.Intrinsics.allIntrinsics`（`bi_*` 仅内部可见） |
| trait 声明 | `base/lib/Base/Eq.vuna` / `base/lib/Base/Ord.vuna` |
| 类型模块实例 | `base/lib/Base/Int.vuna` / `base/lib/Base/String.vuna` |
| 终止性守卫识别 | `Elab.Termination.Measure.guardPosVar`（按方法短名 `le`/`ge`/`lt`） |

## 测试

- `test/corpus/traits/16_eq_ord_alias.vuna`：`==` 与 `eq`、`<` 与 `lt` 一致；Int/String
  特化、Bool 模式匹配实例、`deriving (Eq, Ord)`、`mem` 的字典穿参。
- `traits/14_constrained_instance`、`traits/05_deriving_parametric_eq`、
  `traits/07_multi_method_trait`、`stdlib` / `dt` 相关夹具覆盖实例搜索与字典路径。
- `nix run .#vuna-run-tests` 全量；`sh nix/seed-rotate.sh <vuna>` 验证自举 fixed point。
