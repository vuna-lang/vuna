# 标准库（vuna-base）

标准库是独立成员包 `vuna-base`（模块 `Base.*`，模块根 `base/lib/`）。编译器是它的
第一个用户：`compiler/lib/Vuna/Compiler/Common.vuna` 只是门面（整模块重导出
`Base.Pair` / `Base.Bool` / `Base.List` / `Base.Maybe` / `Base.Result` / `Base.String`
+ 保留编译器的 `Pos`/`Span`、模块路径与诊断工具），编译器不再私自重复定义
`Maybe`/`List` 等类型。包名 `vuna-base` 与模块命名空间 `Base.*` 是两回事（包名 ≠ 模块名）。

| 模块 | 内容 |
| --- | --- |
| `Base.Pair` / `Base.Bool` / `Base.List` / `Base.Maybe` / `Base.Result` | 核心代数数据类型与常用 helper（append/reverse/map/filter/foldl/foldr/traverse/andThen/step/...） |
| `Base.String` | split/join/lines/unlines/trim/contains/startsWith/endsWith/repeat/substring |
| `Base.Sort` | 稳定归并排序 `mergeSort` / `sortBy` |
| `Base.Map` | 关联表实现的抽象 Map（empty/insert/lookup/remove/keys/values/size/...） |
| `Base.Monad` | `Functor` / `Monad` trait |
| `Base.Show` | `Show` trait（`show : a -> String`）+ `Int` / `String` / `Bool` 实例 |
| `Base.Eq` | `Eq` trait（`eq` / `neq : a -> a -> Bool`）+ `Int` / `String` / `Bool` 实例 |
| `Base.Ord` | `Ord` trait（`lt` / `le` / `gt` / `ge : a -> a -> Bool`）+ `Int` / `String` / `Bool` 实例 |
| `Base.IO` | 抽象 `IO a` 与 IO 组合子（实例 + print/readFile/writeFile/getArgs/exit） |
| `Base` | 包门面：整模块重导出以上模块（`import Base` 即可用） |
| `Prelude` | 顶层模块（`base/lib/Prelude.vuna`）：重导出 `Base.Pair` / `Bool` / `Eq` / `Ord` / `Show` / `List` / `Maybe` / `Result` / `String` / `Monad`，**包上下文内所有源文件（含无 manifest 的 ad-hoc 单文件）自动导入**；显式 `import` 时不再重复注入；刻意不含 `Base.IO` 的效果函数（`print`/`readFile` 等与编译器直接使用的内建同名），需要 IO 时显式 `import Base.IO` |

跨包使用时只可见 `base/vuna.toml` `[export]` 列出的模块；抽象类型（`Map`、`IO`）
的构造器保持私有。`Map` / `Sort` 不在 `Prelude` 里，需要显式 import。

模块导出清单（`base/lib/*.vuna`、`base/lib/Base/*.vuna` 的模块头）：

```vuna
module Base (module Base.Pair, module Base.Bool, module Base.List, module Base.Maybe,
             module Base.Result, module Base.String, module Base.Sort, module Base.Map,
             module Base.Monad, module Base.IO, module Base.Show, module Base.Eq,
             module Base.Ord) where
module Base.Bool (Bool(..), not, and, or, xor, bool) where
module Base.Show (Show(..)) where
module Base.Eq (Eq(..)) where
module Base.Ord (Ord(..)) where
module Base.List (List(..), append, reverse, length, map, filter, foldl, foldr, concatMap,
                  flatMap, mem, memName, lookupPair, zip, take, drop, range, mapMaybe) where
module Base.Maybe (Maybe(..), fromMaybe, isJust, isNothing, maybe, mapJust) where
module Base.Pair (Pair(..), firstOf, secondOf) where
module Base.Result (Result(..), traverse, andThen, step, mapResult, mapError, withDefault) where
module Base.String (split, join, lines, unlines, trim, trimLeft, trimRight, contains,
                    startsWith, endsWith, repeat, substring) where
module Base.Sort (mergeSort, sortBy) where
module Base.Map (Map, empty, insert, lookup, remove, keys, values, size, fromList, toList) where
module Base.Monad (Functor(..), Monad(..)) where
module Base.IO (IO, print, println, readFile, writeFile, readLine, readDir, ...) where
```

`Base.IO` 完整导出见 `base/lib/Base/IO.vuna` 的模块头；`Prelude` 的导出列表见
`base/lib/Prelude.vuna`。

## 标准库与自举的关系

- `base/lib/` 是 vuna 模块根，不是 OCaml 库目录；
- `Prelude` 是唯一自动注入的模块：包上下文内所有源文件（含无 manifest 的 ad-hoc 单文件）
  都自动导入；不需要也不再有第二套加载模式；
- `Base.IO` 刻意不在 `Prelude` 中：`print` / `readFile` 等名字与编译器直接使用的
  effectful 内建同名，自动导入会让编译器源码产生歧义。

## 内建与库的边界

- **`Bool` 归 `Base.Bool`**：`data Bool` 是唯一权威定义（DT 的 `if` / 字面量模式按
  「族短名 Bool」识别，不另存一份定义）。编译器的 DT prelude 桩（`Elab.Prelude`，原
  `DtPrelude` 的 `Bool` / `True` / `False`）随 **M22.2** 删除；包上下文（含 ad-hoc
  单文件）经自动注入的 `Prelude` 使用 `Base.Bool`，需要自定义语义时再自行声明
  `data Bool`。
- **`Int` / `String` 是语言原语**：没有 `data` 声明，字面量、算术与 `str*` 由编译器提供。
- **`Show` / `Eq` / `Ord` 在库（M24.7 完成）**：trait 声明、方法投影与
  `Int` / `String` / `Bool` 实例全部在 `Base.Show` / `Base.Eq` / `Base.Ord`，包模式下
  随 `Prelude` 自动导入。编译器只保留**机制**——`deriving (Show, Eq, Ord)` 的展开、
  `==` / `/=` 的 `Int`/`String` 运行时特化与 `<` / `<=` / `>` / `>=` 的 `Int` 特化
  （比较的 `String` / `Bool` 走泛型运行时）、以及 `if` / 字面量等语法；`Loader` 不再放行
  `show` / `eq` / `lt` 等
  短名，裸名必须经 import 的导出表解析。`Show Bool` 用 `if` 输出 `True` / `False`；
  `Eq Bool` 方法体用析取（`Bool == Bool` 会落到该实例，不能自递归）。
- **ad-hoc 单文件与包内模块一致（M26）**：`Prelude` 自动注入，`Show` / `Eq` / `Ord`
  及其实例开箱可用；诊断在缺少显式 import 时仍会提示加对应 import。不再有需要手动指定
  模块根的“原始文件模式”。
- split 输出（`compile` / `build` 目录）的编译单元只有 `Vuna_runtime` + 各源码模块 +
  `Main`：M26 删除了空 `Vuna_builtins` unit，seed 因此是 65 个 `.ml`。
- 阶段状态与当前阻碍见 [docs/roadmap.md](../roadmap.md) 的「阶段状态总览」。

## 已知边界

- `Map` 是关联表（assoc list）实现的抽象类型，无平衡树；
- `Result` 暂无 `Functor` / `Monad` 实例；
- 抽象类型（`Map`、`IO`）跨包不可构造、不可模式匹配，只能经 API 使用。

## 相关阅读

- 记录、trait、do/Monad 语义：[type-system.md](type-system.md)
- 包与 workspace 机制、工具链命令：[packages.md](packages.md)
- 编译器门面与 seed 闭包：[compiler.md](compiler.md)、[bootstrap.md](bootstrap.md)
