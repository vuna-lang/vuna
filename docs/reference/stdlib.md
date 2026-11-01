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
| `Base.IO` | 抽象 `IO a` 与 IO 组合子（实例 + print/readFile/writeFile/getArgs/exit） |
| `Base` | 包门面：整模块重导出以上模块（`import Base` 即可用） |
| `Prelude` | 顶层模块（`base/lib/Prelude.vuna`）：重导出 `Base.Pair` / `Bool` / `List` / `Maybe` / `Result` / `String` / `Monad`，**包模式自动导入**；刻意不含 `Base.IO` 的效果函数（`print`/`readFile` 等与编译器直接使用的内建同名），需要 IO 时显式 `import Base.IO`；`--root` 原始模式不自动导入 |

跨包使用时只可见 `base/vuna.toml` `[export]` 列出的模块；抽象类型（`Map`、`IO`）
的构造器保持私有。`Map` / `Sort` 不在 `Prelude` 里，需要显式 import。

模块导出清单（`base/lib/*.vuna`、`base/lib/Base/*.vuna` 的模块头）：

```vuna
module Base (module Base.Pair, module Base.Bool, module Base.List, module Base.Maybe,
             module Base.Result, module Base.String, module Base.Sort, module Base.Map,
             module Base.Monad, module Base.IO) where
module Base.Bool (Bool(..), not, and, or, xor, bool) where
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
- `Prelude` 是唯一自动注入的模块，只在包模式生效；原始 `--root` 模式（自举、夹具）
  保持显式 import 语义；
- `Base.IO` 刻意不在 `Prelude` 中：`print` / `readFile` 等名字与编译器直接使用的
  effectful 内建同名，自动导入会让编译器源码产生歧义。

## 已知边界

- `Map` 是关联表（assoc list）实现的抽象类型，无平衡树；
- `Result` 暂无 `Functor` / `Monad` 实例；
- 抽象类型（`Map`、`IO`）跨包不可构造、不可模式匹配，只能经 API 使用。

## 相关阅读

- 记录、trait、do/Monad 语义：[type-system.md](type-system.md)
- 包与 workspace 机制、工具链命令：[packages.md](packages.md)
- 编译器门面与 seed 闭包：[compiler.md](compiler.md)、[bootstrap.md](bootstrap.md)
