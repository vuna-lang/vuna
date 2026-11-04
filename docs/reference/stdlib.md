# 标准库（vuna-base）

标准库是独立成员包 `vuna-base`（模块 `Base.*`，模块根 `base/lib/`）。编译器是它的第一个
用户：`compiler/lib/Vuna/Compiler/Common.vuna` 只是门面（整模块重导出 `Base.Pair` /
`Base.Bool` / `Base.List` / `Base.Maybe` / `Base.Result` / `Base.String` + 保留编译器的
`Pos` / `Span`、模块路径与诊断工具），编译器不再私自重复定义 `Maybe` / `List` 等类型。
包名 `vuna-base` 与模块命名空间 `Base.*` 是两回事（包名 ≠ 模块名）。

| 模块 | 内容 |
| --- | --- |
| `Base.Pair` / `Base.Bool` / `Base.List` / `Base.Maybe` / `Base.Result` | 核心代数数据类型与常用 helper（append/reverse/map/filter/foldl/foldr/traverse/andThen/step/...） |
| `Base.String` | split/join/lines/unlines/trim/contains/startsWith/endsWith/repeat/substring |
| `Base.Sort` | 稳定归并排序 `mergeSort` / `sortBy` |
| `Base.Map` | 关联表实现的抽象 Map（empty/insert/lookup/remove/keys/values/size/...） |
| `Base.Nat` | `Nat(..)`（`Zero` / `Succ`）；DT 夹具与错误码表使用 |
| `Base.Vec` | `Vec(..)` 与 `substTemplate` / `vhead` / `vlen` / `vtail` |
| `Base.Monad` | `Functor` / `Monad` trait |
| `Base.Show` | `Show` trait（`show : a -> String`）+ `Int` / `String` / `Bool` 实例 |
| `Base.Eq` | `Eq` trait（`eq` / `neq : a -> a -> Bool`）+ `Int` / `String` / `Bool` 实例 |
| `Base.Ord` | `Ord` trait（`lt` / `le` / `gt` / `ge : a -> a -> Bool`）+ `Int` / `String` / `Bool` 实例 |
| `Base.IO` | 抽象 `IO a` 与 IO 组合子（实例 + print/readFile/writeFile/getArgs/exit，内部包装 `prim_*` 效果原语） |
| `Base` | 包门面：整模块重导出核心模块（不含 `Nat` / `Vec`；`import Base` 即可用） |
| `Prelude` | 顶层模块（`base/lib/Prelude.vuna`）：重导出 `Base.Pair` / `Bool` / `Eq` / `Ord` / `Show` / `List` / `Maybe` / `Result` / `String` / `Monad`，**包上下文内所有源文件（含无 manifest 的 ad-hoc 单文件）自动导入**；显式 `import` 时不再重复注入；刻意不含 `Base.IO`（效果 API 需显式 import，效果面不进入自动注入） |

跨包使用时只可见 `base/vuna.toml` `[export]` 列出的模块；抽象类型（`Map`、`IO`）的构造器
保持私有。`Map` / `Sort` 不在 `Prelude` 里，需要显式 import。

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
module Base.Nat (Nat(..)) where
module Base.Vec (Vec(..), substTemplate, vhead, vlen, vtail) where
module Base.Monad (Functor(..), Monad(..)) where
module Base.IO (IO, print, println, readFile, writeFile, readLine, readDir, ...) where
```

`Base.IO` 完整导出见 `base/lib/Base/IO.vuna` 的模块头；`Prelude` 的导出列表见
`base/lib/Prelude.vuna`。

## 标准库与自举的关系

- `base/lib/` 是 vuna 模块根，不是 OCaml 库目录；
- `Prelude` 是唯一自动注入的模块：包上下文内所有源文件（含无 manifest 的 ad-hoc 单文件）
  都自动导入；没有第二套加载模式；
- `Base.IO` 刻意不在 `Prelude` 中：效果 API 需要显式 `import Base.IO`，效果面不随自动注入
  进入每个源文件；
- `base/` 在 seed 闭包内：修改 seed 闭包内的源码需要 seed rotation，见
  [bootstrap.md](bootstrap.md)。

## 内建与库的边界

权威语义（宽度、编码、转义、错误行为、interp 边界）见 [primitives.md](primitives.md)；
这里只划「编译器提供什么、库提供什么」。

- **`Int` / `String` 是语言 primitive 类型**：没有 `data` 声明，字面量、算术与 `str*` 由
  编译器提供（唯一真源 `Vuna.Compiler.Intrinsics`）；`data Int` / `data String` 是重定义
  错误。`String` 是 UTF-8 字节串、`Int` 是固定的 63 位（见 primitives.md）。
- **`Bool` 归 `Base.Bool`**：`data Bool` 是唯一权威定义，canonical 身份 `Base.Bool.Bool`；
  `True` / `False` 精化为 `TBool`，codegen 表示是 OCaml `bool`，不生成变体。
  `if` / `case` / `main : Bool` 按 canonical 符号判定，没有短名判定或 prelude 桩。
  用户写同名 `data Bool` 是普通 data，不与 canonical 冲突。
- **`List` / `IO` 也是 base 的普通 `data` 声明**：canonical 身份 `Base.List.List` /
  `Base.IO.IO`。返回或接收 `List` 的原语（`strUnpack` / `strPack` / `prim_readDir` /
  `prim_getArgs`）经 List 桥接 helper（`dtp_unpack` / `dtp_pack` / `dtp_listOf`）落地，
  桥接只为 canonical `Base.List.List` 生成；`Prelude` 自动注入 `Base.List`，所以正常上下文
  里总可用。
- **`Show` / `Eq` / `Ord` 在库**：trait 声明、方法投影与 `Int` / `String` / `Bool` 实例全在
  `Base.Show` / `Base.Eq` / `Base.Ord`，随 `Prelude` 自动导入。编译器只保留**机制**：
  `deriving (Show, Eq, Ord)` 的展开、`==` / `/=` 与比较的 `Int` / `String` 运行时特化、
  `if` / 字面量等语法。相等是证据驱动的：`==` / `/=` 只有 Int/String 内建特化或 `Eq`
  证据（实例 / `deriving` / 约束实例），无实例与函数相等在 check 期报错；参数化类型的
  `deriving` 展开成约束实例。字符串展示只有一个实现 `strShow`——`Base.Show` 的 `String`
  实例是 `show s = strShow s`，库不再另写一套转义；`Show Bool` 用 `if` 输出
  `True` / `False`，`Eq Bool` 方法体用析取（不能自递归）。
- **效果原语只有 `prim_*` 名**：`Base.IO` 是默认用户面（把 `prim_*` 包成 `IO` 动作），并在
  `base/vuna.toml` 声明 `[capabilities].effects = ["console", "fs", "process"]`；普通包不
  声明能力就只能经 `Base.IO`，声明能力后可直接调用 `prim_*`。能力是**权限声明**，不是
  检查豁免（`Loader.Resolve.checkEffectsBuiltins`）。
- **ad-hoc 单文件与包内模块一致**：`Prelude` 自动注入，`Show` / `Eq` / `Ord` 及其实例开箱
  可用；诊断在缺少显式 import 时仍会提示加对应 import。ad-hoc 文件没有能力，效果只能经
  `Base.IO`。
- split 输出（`compile` / `build` 目录）的编译单元只有 `Vuna_runtime` + 各源码模块 +
  `Main`；文件集以 `seed/` 与 `nix/seed-count.txt` 为准。

## 已知边界

- `Map` 是关联表（assoc list）实现的抽象类型，无平衡树；
- `Result` 暂无 `Functor` / `Monad` 实例；
- 抽象类型（`Map`、`IO`）跨包不可构造、不可模式匹配，只能经 API 使用。

## 相关阅读

- 记录、trait、do/Monad 语义：[records-traits.md](records-traits.md)
- 包与 workspace 机制、工具链命令：[packages.md](packages.md)
- 编译器门面与 seed 闭包：[compiler.md](compiler.md)、[bootstrap.md](bootstrap.md)
