# 标准库（vuna-base）

标准库是独立成员包 `vuna-base`（模块 `Base.*`，模块根 `base/lib/`）。编译器是它的第一个
用户：`compiler/lib/Vuna/Compiler/Common.vuna` 只是门面（整模块重导出 `Base.Pair` /
`Base.Bool` / `Base.List` / `Base.Maybe` / `Base.Result` / `Base.String` + 保留编译器的
`Pos` / `Span`、模块路径与诊断工具），编译器不再私自重复定义 `Maybe` / `List` 等类型。
包名 `vuna-base` 与模块命名空间 `Base.*` 是两回事（包名 ≠ 模块名）。

| 模块 | 内容 |
| --- | --- |
| `Base.Pair` / `Base.Bool` / `Base.List` / `Base.Maybe` / `Base.Result` | 核心代数数据类型与常用 helper（append/reverse/map/filter/foldl/foldr/traverse/andThen/step/...） |
| `Base.String` | split/join/lines/unlines/trim/contains/startsWith/endsWith/repeat/substring；`byteLength : String -> Nat` |
| `Base.Sort` | 稳定归并排序 `mergeSort` / `sortBy` |
| `Base.Map` | 关联表实现的抽象 Map（empty/insert/lookup/remove/keys/values/size/...）；小表用 |
| `Base.HashMap` | `String` 键、值泛型的持久哈希映射（1024 桶；empty/insert/insertAll/lookup/member/fromList/toList/size/ofNames、公开 `hashStr`）；大表、构造后频繁查找 |
| `Base.HashSet` | `String` 集合（内部 `HashMap Bool`；empty/insert/member/fromList/toList/size） |
| `Base.IntMap` | `Int` 键、值泛型的持久哈希映射（同 1024 桶结构；整数键免字符串编码） |
| `Base.Array` | 不可变数组（内建类型构造子 `Array`；`fromList` / `toList` / `length` / `get` / `set` / `make`，长度与下标是 `Nat`；`set` 返回新数组） |
| `Base.IORef` | IO 内的可变引用（`newRef` / `readRef` / `writeRef` / `modifyRef`，全部 `IO`） |
| `Base.MArray` | IO 内的可变数组（`new` / `read` / `write` / `length`，全部 `IO`） |
| `Base.Buffer` | 可变字符串缓冲（`new` / `add` / `contents` / `length`，全部 `IO`） |
| `Base.ST` | region 隔离的局部可变数据（M35.1；M37 改建在 IO 上）：`ST r a`（包 `IO a`）+ `runST`（显式 region binder，句柄不逃逸）+ `Ref r a` / `SArray r a` + 显式组合子 `bindST` / `bindST1` / `pureST` / `fmapST`；`Ref`/`SArray` 为 linear record（消费式 API，结果记录 `RefPair` 等），`bindST1` 线程化线性结果；不声明 `Functor`/`Monad` 实例，`runST` 入口执行一次 `runIO` |
| `Base.State` / `Base.Reader` / `Base.Error` | 库级效应 monad（M35.1）：纯函数表示 + `Functor`/`Monad` 实例（`do` 可用）；`State` 是 `s -> Pair a s`、`Reader` 是 `e -> a`、`Error` 是泛型 `Ok`/`Err` 和；handler 是 `runState` / `evalState` / `execState`、`runReader` / `ask` / `local`、`runError` / `throwError` / `catchError`；M33 的手写组合子（`bindState` 等）已删除。通用签名索引效应（通用 `Eff`）未实现，见 [effects.md](effects.md) |
| `Base.Nat` | 非负整数（`Zero` / `Succ`）；运行时是 OCaml `int`。`plus` / `minus` / `mult` / `div` / `toInt` / `fromInt` / `fromIntMaybe` / `pred` / `isZero` + `Eq` / `Ord` / `Show` 实例 |
| `Base.Vec` | `Vec(..)` 与 `substTemplate` / `vhead` / `vlen` / `vtail` |
| `Base.Monad` | `Functor` / `Monad` trait |
| `Base.Show` | `Show` trait（`show : a -> String`）+ `Int` / `String` / `Bool` 实例 |
| `Base.Interp` | 模板插值的转换 trait（M36）：`Interp a` + blanket `Show a => Interp a`（默认 = `show`）+ 具体 `Interp String`（原样输出）；插值降级与规则见 [templates.md](templates.md) |
| `Base.Eq` | `Eq` trait（`eq` / `neq : a -> a -> Bool`）+ `Bool` 实例（Bool 是 `Eq` 返回类型，实例随 trait） |
| `Base.Ord` | `Ord` trait（`lt` / `le` / `gt` / `ge : a -> a -> Bool`）+ `Bool` 实例 |
| `Base.Int` | `Int` 的 `Eq` / `Ord` 实例宿主（`Int` 是 primitive 类型；实例跟类型模块走） |
| `Base.IO` | `IO` 的公开 API 与实例（`IO` 本身是内建类型，不再由本模块声明）：print/readFile/writeFile/getArgs/exit 直接别名到 `prim_*`，`Functor`/`Monad IO` 经 `prim_pureIO`/`prim_bindIO`；`runIO : IO a -> a` = `prim_runIO`（要求 `unsafe` 能力） |
| `Base.Debug` | 调试工具（M38，**显式 import**，不进 `Prelude`/`Base` 门面）：`trace` / `traceShow` 写 stderr 后返回原值，`assert` / `todo` 失败走 `prim_fail` → 运行时报告器；见 [debugging.md](debugging.md) |
| `Base.Effect` | `MonadIO` trait（`liftIO : IO a -> m a`）+ `MonadIO IO` 实例 |
| `Base.StateT` / `Base.ReaderT` / `Base.ErrorT` | IO 基座的效应栈（M37）：`StateT s a` = `s -> IO (Pair a s)`、`ReaderT e a` = `e -> IO a`、`ErrorT e a` = `IO (Error e a)`；各带 handler、`Functor`/`Monad`/`MonadIO` 实例；固定以 IO 为基座（泛化到任意 monad 需要隐式参数 kind 推断，见 debt） |
| `Base` | 包门面：整模块重导出核心模块（含 `Base.Nat`，不含 `Vec`；`import Base` 即可用） |
| `Prelude` | 顶层模块（`base/lib/Prelude.vuna`）：重导出 `Base.Pair` / `Bool` / `Eq` / `Ord` / `Show` / `Interp` / `List` / `Maybe` / `Result` / `String` / `Monad`，**包上下文内所有源文件（含无 manifest 的 ad-hoc 单文件）自动导入**；显式 `import` 时不再重复注入；刻意不含 `Base.IO`（效果 API 需显式 import，效果面不进入自动注入） |

跨包使用时只可见 `base/vuna.toml` `[export]` 列出的模块；抽象类型（`Map`、`HashMap`、
`HashSet`、`IntMap`、`IO`）的构造器保持私有。`Map` / `Sort` / `HashMap` / `HashSet` /
`IntMap` 都不在 `Prelude` 里，需要显式 import；也**不进 `Base` 门面**——`Base` 门面整模块
重导出 `Base.Map`，而 `HashMap` / `IntMap` 与它同名导出 `empty`/`insert`/`lookup`/
`fromList`/`toList`/`size`，同时重导出会触发 `duplicate export` 硬错误。同文件使用多个
容器时写完整限定名（`HashMap.insert` / `IntMap.lookup` / `HashSet.member`）。

模块导出清单（`base/lib/*.vuna`、`base/lib/Base/*.vuna` 的模块头）：

```vuna
module Base (module Base.Pair, module Base.Bool, module Base.List, module Base.Maybe,
             module Base.Result, module Base.String, module Base.Sort, module Base.Map,
             module Base.Monad, module Base.Effect, module Base.IO, module Base.Show, module Base.Eq,
             module Base.Interp,
             module Base.Ord, module Base.Nat) where
module Base.Bool (Bool(..), not, and, or, xor, bool) where
module Base.Show (Show(..)) where
module Base.Interp (Interp(..)) where
module Base.Eq (Eq(..)) where
module Base.Ord (Ord(..)) where
module Base.Int where
module Base.List (List(..), append, reverse, length, map, filter, foldl, foldr, concatMap,
                  flatMap, mem, memName, lookupPair, zip, take, drop, range, mapMaybe) where
module Base.Maybe (Maybe(..), fromMaybe, isJust, isNothing, maybe, mapJust) where
module Base.Pair (Pair(..), firstOf, secondOf) where
module Base.Result (Result(..), traverse, andThen, step, mapResult, mapError, withDefault) where
module Base.String (split, join, lines, unlines, trim, trimLeft, trimRight, contains,
                    startsWith, endsWith, repeat, substring, byteLength) where
module Base.Sort (mergeSort, sortBy) where
module Base.Map (Map, empty, insert, lookup, remove, keys, values, size, fromList, toList) where
module Base.HashMap (HashMap, empty, fromList, hashStr, insert, insertAll, lookup, member,
                     ofNames, size, toList) where
module Base.HashSet (HashSet, empty, fromList, insert, member, size, toList) where
module Base.IntMap (IntMap, empty, fromList, insert, insertAll, lookup, member, size, toList) where
module Base.Nat (Nat(..), plus, minus, mult, div, toInt, fromInt, fromIntMaybe,
                 pred, isZero) where
module Base.Vec (Vec(..), substTemplate, vhead, vlen, vtail) where
module Base.Monad (Functor(..), Monad(..)) where
module Base.IO (print, println, readFile, writeFile, readLine, readDir, ...) where
module Base.Error (Error, catchError, ok, runError, throwError) where
module Base.Effect (MonadIO(..)) where
module Base.StateT (StateT, get, put, modify, runStateT, evalStateT, execStateT) where
module Base.ReaderT (ReaderT, ask, local, runReaderT) where
module Base.ErrorT (ErrorT, throwError, catchError, runErrorT) where
```

`Base.IO` 完整导出见 `base/lib/Base/IO.vuna` 的模块头；`Prelude` 的导出列表见
`base/lib/Prelude.vuna`。

## 度量与 Nat（M34.7）

- **公开度量用 Nat**：`List.length`、`Array.length/get/set/make`、`MArray.new/read/write/length`、
  `Buffer.add/length`、`String.byteLength/substring/repeat`、`IO.fileSize/readBytes`、
  `Map.size`、`HashMap.size`、`IntMap.size`、`Vec.vlen`。
- **低层原语仍是 Int**：`strLength` / `arrayLength` / `prim_*Length` 等保持 Int 签名；
  Base 在边界用 `natFromInt` / `natToInt`（运行时恒等或单分支）转换。这样避免了
  seed 阶段改 intrinsic 签名的自举死锁。
- **有符号 / 算法内部量保留 Int**：源码位置/span、行/列、fuel/终止性度量、de Bruijn
  level、meta id、哈希、退出码/状态、时间、`-1` 哨兵、`List.take/drop/range` 的计数参数。
- `String.byteLength` 而非 `String.length`：`Base` / `Prelude` 同时重导出 `Base.List`，
  同名 `length` 会触发 `duplicate export` 硬错误。
- `Nat` 可隐式提升为 `Int`（`natToInt`）；反向必须显式 `fromInt`/`fromIntMaybe`。
  算术与模式匹配规则见 [primitives.md](primitives.md) / [operators.md](operators.md)。

## 标准库与自举的关系

- `base/lib/` 是 vuna 模块根，不是 OCaml 库目录；
- `Prelude` 是唯一自动注入的模块：包上下文内所有源文件（含无 manifest 的 ad-hoc 单文件）
  都自动导入；没有第二套加载模式；
- `Base.IO` 刻意不在 `Prelude` 中：`IO` 类型是内建、恒可见，但效果 API 与 `Monad IO`
  实例仍需要显式 `import Base.IO`，效果面不随自动注入进入每个源文件；
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
- **`List` 也是 base 的普通 `data` 声明**：canonical 身份 `Base.List.List`。返回或接收
  `List` 的原语（`strUnpack` / `strPack` / `prim_readDir` / `prim_getArgs`）经 List 桥接
  helper（`dtp_unpack` / `dtp_pack` / `dtp_listOf`）落地，桥接只为 canonical
  `Base.List.List` 生成；`Prelude` 自动注入 `Base.List`，所以正常上下文里总可用。
- **`IO` 是语言内建效应类型（M37）**：kind `Type -> Type`，运行时裸 thunk
  `int -> 'a`，无构造器；`Base.IO` 只提供 API 与实例。细节见
  [effects.md](effects.md) §2。
- **`Show` / `Eq` / `Ord` 在库（M31.1 起声明与实例分离）**：`Base.Show` / `Base.Eq` /
  `Base.Ord` 承载 trait 声明；实例按**落点规则**分布（见 [operators.md](operators.md)）：
  `Int` → `Base.Int`、`String` → `Base.String`、`Bool` → `Base.Eq` / `Base.Ord`
  （Bool 是方法返回类型，放 `Base.Bool` 会成 import 环）。实例随 `Prelude` 自动导入
  （`Prelude` 显式 `import Base.Int` 加载 Int 实例）。编译器只保留**机制**：
  `deriving (Show, Eq, Ord)` 的展开、`eq` / `lt` 等的 `Int` / `String` 运行时特化、
  `if` / 字面量等语法。**M31.1 起运算符是方法别名**：`==` / `/=` / `<` / `<=` / `>` / `>=`
  在 Loader 被解析成 `eq` / `neq` / `lt` / `le` / `gt` / `ge`（M31.1 起由 Loader 解析，
  M31.3 起 fixity 与别名全部来自库模块里的 `infix*` 声明），因此 `a == b` 与 `eq a b`
  是同一条路径。**M29 起相等证据驱动**：`eq`（含运算符写法）只有 Int/String 内建特化或 `Eq` 证据
  （实例 / `deriving` / 约束实例），无实例与函数相等在 check 期报错；参数化类型的
  `deriving` 展开成约束实例（`instance Eq a => Eq (F a)`），库里可写的容器实例也按这个
  形态声明。字符串展示只有一个实现 `strShow`——`Base.Show` 的 `String` 实例是
  `show s = strShow s`，库不再另写一套转义；`Show Bool` 用 `if` 输出 `True` / `False`；
  `Eq Bool` / `Ord Bool` 用模式匹配穷尽（不依赖 `==` / `<`，避免实例体自引用）。
- **效果原语只有 `prim_*` 名，且返回 `IO` 动作（M31）**：`Base.IO` 是默认用户面
  （`print` / `readFile` / … 直接别名到 `prim_*`，类型形如 `… -> IO a`），并在
  `base/vuna.toml` 声明 `[capabilities].effects = ["console", "fs", "process"]`；动作只在
  `main` 执行（产物钩子 `v_main 0`），`runIO`/`prim_runIO` 是唯一的 main 外入口、需
  `unsafe`。能力是**权限声明**，不是检查豁免（`Loader.Resolve.checkEffectsBuiltins`）。
  声明了能力的包可以直接用 `prim_*` 而不 import `Base.IO`（`IO` 类型是内建的）。
- **ad-hoc 单文件与包内模块一致**：`Prelude` 自动注入，`Show` / `Eq` / `Ord` 及其实例开箱
  可用；诊断在缺少显式 import 时仍会提示加对应 import。ad-hoc 文件没有能力，效果只能经
  `Base.IO`。
- split 输出（`compile` / `build` 目录）的编译单元只有 `Vuna_runtime` + 各源码模块 +
  `Main`；文件集以 `seed/` 与 `nix/seed-count.txt` 为准。

## 已知边界

- `Map` 是关联表（assoc list）实现的抽象类型，无平衡树；适合小表；
- `HashMap` / `IntMap` 是 1024 桶的持久哈希表：无 `remove`、无 resize；`toList` 按桶序
  展开（不保证插入序）；`size` 是 O(n)（没有计数字段）；M33 W3 起桶结构是
  `Array (Array (List ...))`（`Array.get` O(1)，`insert` 两次 32 元素 copy-on-write）；
- **`empty` 已移除**：`HashMap` / `IntMap` 的空表统一写 `fromList []`。原因是空表在
  OCaml 侧用 `Array.make` 构造会引入弱类型变量（`'_weak`），跨模块使用时被固定成某个
  `a`；`fromList []` 走 `HashMap arrayEmpty`（`[||]` 字面量，non-expansive）可正常泛化；
- **`fromList` 与 `insertAll` 的冲突语义不同**：`fromList` 列表**前面**的条目优先（与
  `Base.Map.fromList` 的查找语义一致），`insertAll` **后面**的条目覆盖前面的。两者都是
  编译器历史 API 的语义，不要合并或用错；
- 键只覆盖 `String`（`HashMap`/`HashSet`）与 `Int`（`IntMap`）：没有泛型 `Hashable`
  trait（trait 仅单参数、无 `deriving Hash`），也没有有序持久容器（TreeMap/TreeSet）；
  需要有序时用 `Base.Sort`，大表查找用哈希容器；
- **容器与可变数据（M33 W3 / M35.1 ST）**：不可变 `Base.Array`、IO 内 `IORef` / `MArray` /
  `Buffer`、ST 内 `Base.ST` 的 `Ref` / `SArray` 已落地；`Array.get` / `MArray.read` 越界是
  宿主 `Invalid_argument`；`Array.set` 返回新数组；IO 句柄只经 `IO` 动作使用，ST 句柄
  只经 `ST r` 使用且不能逃出 `runST`（见 [effects.md](effects.md)）；M38 起
  `Ref`/`SArray` 是 linear record（恰好一次、不可复制），ST 动作本身仍可复制；
- **库级效应（M35.1）**：`State` / `Reader` / `Error` 是带 `Functor`/`Monad` 实例的纯函数
  monad（**不进入 `Prelude` / `Base` 门面**，显式 import）；`do` 可用；`Base.ST` 的 region
  隔离与「不声明 `Monad` 实例」的原因见 [effects.md](effects.md)；通用签名索引效应
  （用户自定义 op + 深 handler + 行/重排）未实现（debt D03 / D26）；没有语言级并发 / async
  （M35.2）；
- `Result` 暂无 `Functor` / `Monad` 实例；
- 抽象类型（`Map`、`IO`）跨包不可构造、不可模式匹配，只能经 API 使用。

## 相关阅读

- 记录、trait、do/Monad 语义：[records-traits.md](records-traits.md)
- 效应 monad / ST / 通用 Eff 的边界：[effects.md](effects.md)
- 包与 workspace 机制、工具链命令：[packages.md](packages.md)
- 编译器门面与 seed 闭包：[compiler.md](compiler.md)、[bootstrap.md](bootstrap.md)
