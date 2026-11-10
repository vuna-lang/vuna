- **只有 `HashMap` 移除了 `empty`**：空表统一写 `fromList []`。原因是空表在 OCaml 侧用
  `Array.make` 构造会引入弱类型变量（`'_weak`），跨模块使用时会被固定；`fromList []` 走
  `HashMap arrayEmpty`（`[||]` 字面量，non-expansive）可正常泛化。`HashSet.empty` 仍在；- **只有 `HashMap` 移除了 `empty`**：空表统一写 `fromList []`。原因是空表在 OCaml 侧用
  `Array.make` 构造会引入弱类型变量（`'_weak`），跨模块使用时会被固定；`fromList []` 走
  `HashMap arrayEmpty`（`[||]` 字面量，non-expansive）可正常泛化。`HashSet.empty` 仍在
  （`HashSet` 本身是泛型，但 `empty` 有签名约束、调用点总带具体类型）；# 标准库（vuna-base）

标准库是独立成员包 `vuna-base`（模块 `Base.*`，模块根 `base/lib/`）。编译器是它的第一个
用户：`compiler/lib/Vuna/Compiler/Common.vuna` 只是门面（整模块重导出 `Base.Pair` /
`Base.Bool` / `Base.List` / `Base.Maybe` / `Base.Result` / `Base.String` + 保留编译器的
`Pos` / `Span`、模块路径与诊断工具），编译器不再私自重复定义 `Maybe` / `List` 等类型。
包名 `vuna-base` 与模块命名空间 `Base.*` 是两回事（包名 ≠ 模块名）。

| 模块 | 内容 |
| --- | --- |
| `Base.Pair` / `Base.Bool` / `Base.List` / `Base.Maybe` / `Base.Result` | 核心代数数据类型与常用 helper（append/reverse/map/filter/foldl/foldr/traverse/step/...）；`Result` / `Maybe` / `List` 带 `Functor`/`Applicative`/`Monad` 实例（`do` 可用）；容器带约束 `Show`，代数容器另带 `Eq`（List/Maybe/Pair 还有 `Ord`），容器 `Show` 的插值经 blanket `Interp` 复用 |
| `Base.Field` / `Base.Record` | `Field` 类型级字段标签（`Field "id"`）+ `HasField` trait：nominal record 的泛型读访问；`Base.Record` 重导出 `Base.Field`；实例由编译器按 record 字段自动生成（仅导入 Base.Record 的模块）。见 [records-traits.md](records-traits.md)「HasField」 |
| `Base.String` | split/join/lines/unlines/trim/contains/startsWith/endsWith/repeat/substring；`byteLength : String -> Nat` |
| `Base.Sort` | 稳定排序 `mergeSort` / `sortBy`（当前实现是插入排序：稳定、O(n²)，适合小表） |
| `Base.Map` | 关联表实现的抽象 Map（empty/insert/lookup/remove/keys/values/size/...）；小表用 |
| `Base.HashMap` | 键与值都泛型的持久哈希映射（1024 桶；insert/insertAll/lookup/member/fromList/toList/size/ofNames；键需 `Eq` + `Hashable`；空表写 `fromList []`）；大表、构造后频繁查找 |
| `Base.HashSet` | 键泛型的集合（内部 `HashMap a Bool`；empty/insert/member/fromList/toList/size；键需 `Eq` + `Hashable`） |
| `Base.Unit` | 单元素类型 `Unit(..)`（`MkUnit`）+ `Eq` / `Ord` / `Show` / `Semigroup` / `Monoid` / `Hashable` 实例 |
| `Base.Hashable` | 通用哈希 trait：`hash : a -> Int`、`hashStr`（String 的 0..1023 哈希）、`hashCombine`；`String`/`Int`/`Bool`/`Nat`/`Unit`/`List`/`Maybe`/`Pair`/`Result`/`Ordering` 实例，用户类型可 `deriving (Hashable)` |
| `Base.Array` | 不可变数组（内建类型构造子 `Array`；`fromList` / `toList` / `length` / `get` / `set` / `make`，长度与下标是 `Nat`；`set` 返回新数组） |
| `Base.IORef` | IO 内的可变引用（`newRef` / `readRef` / `writeRef` / `modifyRef`，全部 `IO`） |
| `Base.MArray` | IO 内的可变数组（`new` / `read` / `write` / `length`，全部 `IO`） |
| `Base.Buffer` | 可变字符串缓冲（`new` / `push` / `contents` / `length`，全部 `IO`；D23 把 `add` 改名为 `push`，避免与 `Num.add` 方法短名冲突） |
| `Base.ST` | region 隔离的局部可变数据（改建在 IO 上）：`ST r a`（包 `IO a`）+ `runST`（显式 region binder，句柄不逃逸）+ `Ref r a` / `SArray r a` + 显式组合子 `bindST` / `bindST1` / `pureST` / `fmapST`；`Ref`/`SArray` 为 linear record（消费式 API，结果记录 `RefPair` 等），`bindST1` 线程化线性结果；不声明 `Functor`/`Monad` 实例，`runST` 入口执行一次 `runIO` |
| `Base.State` / `Base.Reader` / `Base.Error` | 库级效应 monad：纯函数表示 + `Functor`/`Applicative`/`Monad` 实例（`do` 可用）；`State` 是 `s -> Pair a s`、`Reader` 是 `e -> a`、`Error` 是泛型 `Ok`/`Err` 和；handler 是 `runState` / `evalState` / `execState`、`runReader` / `ask` / `local`、`runError` / `throwError` / `catchError`。通用运行时效应见 `Base.Eff`（[effects.md](effects.md) §8） |
| `Base.Nat` | 非负整数（`Zero` / `Succ`）；运行时是 OCaml `int`。`plus` / `minus` / `mult` / `toInt` / `fromInt` / `fromIntMaybe` / `pred` / `isZero` + `Num`（除法经 `Num.div` / `/`）+ `Eq` / `Ord` / `Show` / `Hashable` / `Semigroup` / `Monoid` 实例 |
| `Base.Num` | 数值算术 trait（D23）：`add` / `sub` / `mul` / `div`；`+` / `-` / `*` / `/` 是它们的中缀别名（fixity 与别名声明在本模块）。`Int` / `Nat` / `Float` 实例在类型模块并由精化器特化回内建原语；用户类型实现 `Num`（配 `FromInt`）即可重载四则（见 [operators.md](operators.md)） |
| `Base.Vec` | `Vec(..)` 与 `substTemplate` / `vhead` / `vlen` / `vtail` |
| `Base.Monad` | `Functor` / `Monad` trait（`Monad` 只有 `bind`）；为兼容既有 `import Base.Monad`，本模块重导出 `Base.Applicative`（`pure` / `liftA2` / `ap`） |
| `Base.Applicative` | `Applicative` trait（`pure` / `ap` / `liftA2` 三个方法，各实例显式实现；`liftA2` 暂不作派生）；`Maybe` / `List` / `Result` / `IO` / `State` / `Reader` / `Error` / `Eff` / `StateT` / `ReaderT` / `ErrorT` 实例 |
| `Base.Monoid` | `Semigroup`（`mappend`）与 `Monoid`（`mempty`）trait（无父类，泛型代码同时约束两者）；`List` / `String` / `Maybe` / `Nat` / `Unit` 实例 |
| `Base.Foldable` | `Foldable` trait（方法 `fold`）+ 顶层 `foldMap : Foldable t, Monoid m, Semigroup m => ...`；`List` / `Maybe` / `Result` 实例 |
| `Base.Traversable` | `Traversable t f`（双参数：容器 + Applicative）与方法 `mapM : (a -> f b) -> t a -> f (t b)`；`List` / `Maybe` / `Result` 实例 |
| `Base.Show` | `Show` trait（`show : a -> String`）+ `String` 实例；`DebugShow` trait（`debugShow : a -> String`，blanket `instance Show a => DebugShow a`，所有 `Show` 实例自动获得）与 `dbgShow : DebugShow a => a -> a`（打印后返回原值）；`Show Int` / `Show Bool` 随类型模块（`Base.Int` / `Base.Bool`），`Show String` 因 String 经 Interp 依赖 Show 留在本模块 |
| `Base.Interp` | 模板插值的转换 trait：`Interp a` + blanket `Show a => Interp a`（默认 = `show`）+ 具体 `Interp String`（原样输出）；插值降级与规则见 [templates.md](templates.md) |
| `Base.Eq` | `Eq` trait（`eq` / `neq : a -> a -> Bool`）+ `Bool` 实例（Bool 是 `Eq` 返回类型，实例随 trait） |
| `Base.Ord` | `Ord` trait（`lt` / `le` / `gt` / `ge : a -> a -> Bool`）+ `Bool` 实例；另含 `Ordering(..)`（`LT`/`EQ`/`GT`，带 `Eq`/`Ord`/`Show`/`Hashable` 实例）与 `compare` / `min` / `max` |
| `Base.Int` | `Int` 的 `Eq` / `Ord` / `Show` / `Hashable` / `Num` 实例宿主（`Int` 是 primitive 类型；实例跟类型模块走；`Num Int` 的方法体由精化器特化回 `bi_*` 原语） |
| `Base.Float` | `Float` primitive 类型模块（**随 `Prelude` 自动导出**，2026-11 rotation 后提升）：`FromFloat` trait + `abs` / `sqrt` / `intToFloat` / `floatToInt` + `Eq` / `Ord` / `Show` / `Num` 实例；字面量、算术/比较、`main : Float`、模板插值本来就不需要 import。Prelude 闭包包含本模块后，所有程序的 runtime 都带浮点 helper（[floats.md](floats.md)） |
| `Base.FromString` / `Base.FromInt` | 字面量转换 trait（`fromString` / `fromInt`）与 `String` / `Int` 恒等实例；`Prelude` 导出，`deriving (FromString)` / `(FromInt)` 为单字段包装类型自动派生（见 [floats.md](floats.md)） |
| `Base.Bool` | `Bool` 类型与逻辑 helper + `Show` / `Hashable` 实例（`if` 输出 `True` / `False`）；`Eq` / `Ord` 实例因 Bool 是方法返回类型随 trait 留在 `Base.Eq` / `Base.Ord` |
| `Base.IO` | `IO` 的**公开代数**：`Functor`/`Applicative`/`Monad IO` 实例经 `prim_pureIO`/`prim_bindIO`；面向 `main : IO a`、`IORef`/`MArray`/`Buffer`/`ST` 的进程内 IO。宿主 API 不在本模块 |
| `Base.IO.Host` | **特权宿主层**：`runIO : IO a -> a` = `prim_runIO`（`unsafe`，门控在 `Loader.Resolve`）+ 宿主别名 print/eprint/readFile/writeFile/getArgs/exit 与 env/clock 别名（`getEnv`/`getCwd`/`execPath`/`nowMicros`/`sleepMicros`）；`print` / `println` / `writeFile` / `fileSize` 的度量为 `IO Nat`（`eprint` 仍 `IO Int`）；只有 `[package] privileged = true` 的包可 import（base handler、编译器、根工具链），并 re-export `Base.IO` |
| `Base.Effect` | `MonadIO` trait（`liftIO : IO a -> m a`）+ `MonadIO IO` 实例 |
| `Base.Eff` | 通用运行时效应核心（Layer 1）：开放行 `Row`、抽象动作 `Eff`（无世界令牌）、`Member` 行成员证明/`rowRem`、`weaken`、线性 `Cont`/`resumeCont`/`handleCoreLin`、内建 `Functor`/`Applicative`/`Monad (Eff r)`（`do`/`>>=`；不提供 `bindEff`/`pureEff`）、`sendCore`/`handleCore`、`runPure`/`runIOEff`/`runIOAnswer`（三个运行入口都要求行已处理干净——`runIOEff : Eff [] a -> IO a`，入口处未处理效应是类型错误）；OCaml 5 一次性续延；见 [effects.md](effects.md) §8 |
| `Base.Eff.Reader` | 命名 Reader 实例（`Reader n s` + `Ask`，`n` 是 String 实例名）：`ask`/`handleReader`/`handleReaderLin`/`local`（L2 作用域） |
| `Base.EffState` | 命名 State 实例（`State n s` + `Get`/`Put`）：`get`/`put`/`handleState`（answer `s -> Pair a s` 线程状态） |
| `Base.EffFs` | IO-backed Fs 效应（完整 fs 面；命名实例 `Fs n`，如 `"mock"`/`"real"`）：`ReadFile`/`WriteFile`/`WriteFileAtomic`/`ReadDir`/`IsDirectory`/`MakeDir`/`RemoveFile`/`FileExists`/`FileMtime`/`FileSize` + `fsReadFile n`/`fsWriteFile n`/…/`handleFs n`/`handleFsIO n`；`WriteFile` / `FileSize` 的结果是 `Nat`（`WriteFileAtomic` 仍 `Int`）；handler 用 `Base.IO` 实现；mock（纯 answer）与 real handler 可并存（`dt_base/37`） |
| `Base.EffError` | 一阶 Error 效应 + 作用域 `catch`（L2）：`throw`/`handleError`/`runError`/`catch` |
| `Base.EffExn` | W6/W7 高阶/作用域 Error：`Try` 操作携带 `Eff` 子计算，`handleExn`/`runExn`/`catchExn`/`bracketExn`；scoped handler |
| `Base.EffAsync` | 最小 Domain 并发（L3 legacy）：`Task`/`async`/`await`，基于 OCaml 5 `Domain`；任务行必须是 `Eff Nil`；不算 W9 调度器（见 `Base.EffSched`） |
| `Base.EffSched` | W9 单线程 fiber 调度器（L3）：不透明 `Task`/`Scope`，`forkTask`/`awaitTask`/`yieldNow`/`isCancelled`/`cancelTask`/`cancelScope`/`scopeWait`/`scopeWaitTimeout`/`withScope`/`withScopeTimeout`/`liftIOEff`/`forkTaskWith`/线性 `TaskLin`；协作式取消（含清理宽限）、结构化作用域、逻辑步数超时；任务体 `Eff Nil a`；见 [effects.md](effects.md) §8.5 |
| `Base.EffChannel` | W9 cooperative channel：`send`/`tryRecv`/`recvWait`（忙等 yield，无 Mutex/信号量）；生产者-消费者夹具 `dt_base/36` |
| `Base.EffMutex` | W9 cooperative Mutex/Semaphore（IORef + yield 忙等；无阻塞原语）；`acquire`/`release`/`semWait`/`semSignal` |
| `Base.EffConsole` | W10 console 标签（命名实例，如 `"mock"`/`"real"`）：`Print`/`EPrint`；`consolePrint`（结果 `Nat`，D25）/`consoleEprint`（仍 `Int`）/`handleConsole`/`handleConsoleIO`（真实 handler 用 `Base.IO.Host.print`/`eprint`）；`runConsole n`（`handleConsoleIO` + `runIOAnswer` 单效应入口） |
| `Base.EffClock` | W10 clock 标签（命名实例，如 `"mock"`/`"real"`）：`Now`（微秒）/`SleepMicros`；`clockNow`/`clockSleepMicros`/`handleClock`/`handleClockIO`；`runClock n`（单效应入口）（真实 handler 用 `Base.IO.Host.nowMicros` 与原生 `prim_sleep`） |
| `Base.EffEnv` | W10 env 标签（命名实例，如 `"mock"`/`"real"`）：`GetEnv`/`GetCwd`/`ExecPath`；`envGetEnv`/`envGetCwd`/`envExecPath`/`handleEnv`/`handleEnvIO`（真实 handler 用 `Base.IO.getEnv`/`getCwd`/`execPath`） |
| `Base.EffArgs` | P2c 参数标签：`GetArgs`；`argsGetArgs`/`handleArgs`/`handleArgsIO`（真实 handler 用 `Base.IO.Host.getArgs`）；`runArgs n` 单效应入口 |
| `Base.EffStdin` | P2c 标准输入标签：`ReadLine`/`ReadBytes`；`stdinReadLine`/`stdinReadBytes`/`handleStdin`/`handleStdinIO`（真实 handler 用 `Base.IO.Host.readLine`/`readBytes`）；`runStdin n` |
| `Base.EffExit` | 退出标签：`ExitWith`；`exitWith`/`handleExit`/`handleExitIO`（真实 handler 用 `Base.IO.Host.exit`）；`runExit n` |
| `Base.EffProcess` | process 标签（命名实例，如 `"mock"`/`"real"`）：`Args`/`Exit`/`RunIn`；`processArgs`/`processExit`/`processRunIn`/`handleProcess`/`handleProcessIO`（真实 handler 用 `prim_getArgs`/`prim_exit`/`prim_runIn`）/`handleProcessIOWith`（自定义 `onExit`）/`handleProcessIOObserved`（`Exit` 可观察、不退出） |
| `Base.StateT` / `Base.ReaderT` / `Base.ErrorT` | IO 基座的效应栈：`StateT s a` = `s -> IO (Pair a s)`、`ReaderT e a` = `e -> IO a`、`ErrorT e a` = `IO (Error e a)`；各带 handler、`Functor`/`Applicative`/`Monad`/`MonadIO` 实例；固定以 IO 为基座（泛化到任意 monad 需要隐式参数 kind 推断，见 debt） |
| `Base` | 包门面：整模块重导出核心模块（含 `Base.Nat` / `Base.Num` / `Base.Unit` / `Base.Applicative`(经 Monad) / `Base.Monoid` / `Base.Foldable` / `Base.Traversable` / `Base.Hashable`；不含 `Vec` 与哈希容器；`import Base` 即可用） |
| `Prelude` | 顶层模块（`base/lib/Prelude.vuna`）：重导出 `Base.Pair` / `Bool` / `Eq` / `Ord` / `Num` / `Show` / `Interp` / `List` / `Maybe` / `Result` / `String` / `Monad`(含 `Applicative`) / `Unit` / `Monoid` / `Foldable` / `Traversable` / `Hashable`，按包上下文自动导入（规则见下节「Prelude 自动导入」）；显式 `import` 时不再重复注入；刻意不含 `Base.IO`（效果 API 需显式 import）与 `Base.Nat` |

抽象类型（`Map`、`HashMap`、`HashSet`、`IO`）的构造器保持私有。`Map` / `Sort` / `HashMap` / `HashSet` 都不在 `Prelude` 里；`Base` 门面重导出 `Base.Map` / `Base.Sort`，但**不**含 HashMap / HashSet——它们与 `Map` 在 `insert` / `fromList` / `toList` / `size` 上同名（`HashMap` 还有 `lookup` / `member`，`HashSet` 有 `member` 与 `empty`），同时重导出会触发 `duplicate export` 硬错误。
用哈希容器时显式 `import Base.HashMap` / `Base.HashSet`；同文件使用多个容器时写完整限定名（`HashMap.insert` / `HashSet.member`）。
跨包使用时只可见 `base/vuna.toml` `[export]` 列出的模块。

模块导出清单（`base/lib/*.vuna`、`base/lib/Base/*.vuna` 的模块头）：

```vuna
module Base (module Base.Pair, module Base.Bool, module Base.List, module Base.Maybe,
             module Base.Result, module Base.String, module Base.Sort, module Base.Map,
             module Base.Monad, module Base.Effect, module Base.IO, module Base.Show, module Base.Eq,
             module Base.Interp, module Base.Ord, module Base.Nat, module Base.Unit,
             module Base.Monoid, module Base.Foldable, module Base.Traversable,
             module Base.Hashable) where
module Base.Bool (Bool(..), not, and, or, xor, bool) where
module Base.Show (Show(..)) where
module Base.Interp (Interp(..)) where
module Base.Eq (Eq(..)) where
module Base.Ord (Ord(..), Ordering(..), compare, max, min) where
module Base.Int where
module Base.List (List(..), append, reverse, length, map, filter, foldl, foldr, concatMap,
                  mem, memName, lookupPair, zip, take, drop, range, mapMaybe) where
module Base.Maybe (Maybe(..), fromMaybe, isJust, isNothing, maybe) where
module Base.Pair (Pair(..), firstOf, secondOf) where
module Base.Field (Field(..)) where
module Base.Record (module Base.Field, HasField(..)) where
module Base.Result (Result(..), traverse, step, mapError, withDefault) where
module Base.String (split, join, lines, unlines, trim, trimLeft, trimRight, contains,
                    startsWith, endsWith, repeat, substring, byteLength) where
module Base.Sort (mergeSort, sortBy) where
module Base.Map (Map, empty, insert, lookup, remove, keys, values, size, fromList, toList) where
module Base.HashMap (HashMap, fromList, insert, insertAll, lookup, member, ofNames, size, toList) where
module Base.HashSet (HashSet, empty, fromList, insert, member, size, toList) where
module Base.Unit (Unit(..)) where
module Base.Hashable (Hashable(..), hashCombine, hashStr) where
module Base.Applicative (Applicative(..)) where
module Base.Monoid (Monoid(..), Semigroup(..)) where
module Base.Foldable (Foldable(..), foldMap) where
module Base.Traversable (Traversable(..)) where
module Base.Nat (Nat(..), plus, minus, mult, toInt, fromInt, fromIntMaybe,
                 pred, isZero) where
module Base.Num (Num(..)) where
module Base.Vec (Vec(..), substTemplate, vhead, vlen, vtail) where
module Base.Monad (Functor(..), Monad(..), module Base.Applicative) where
module Base.IO (print, println, readFile, writeFile, readLine, readDir, ...) where
module Base.Error (Error, catchError, ok, runError, throwError) where
module Base.Effect (MonadIO(..)) where
module Base.StateT (StateT, get, put, modify, runStateT, evalStateT, execStateT) where
module Base.ReaderT (ReaderT, ask, local, runReaderT) where
module Base.ErrorT (ErrorT, throwError, catchError, runErrorT) where
```

`Base.IO` 完整导出见 `base/lib/Base/IO.vuna` 的模块头；`Prelude` 的导出列表见
`base/lib/Prelude.vuna`。

## 度量与 Nat

- **公开度量用 Nat**：`List.length`、`Array.length/get/set/make`、`MArray.new/read/write/length`、
  `Buffer.push/length`、`String.byteLength/substring/repeat`、`IO.fileSize/readBytes`、
  `Map.size`、`HashMap.size`、`HashSet.size`、`Vec.vlen`。
- **D25 起宿主返回量也是 Nat**：`Base.IO.Host.print` / `println` / `writeFile` / `fileSize`
  返回 `IO Nat`（`prim_print` / `prim_writeFile` / `prim_fileSize` 的签名是 `IIO INat`），
  `Base.EffConsole` 的 `Print` 与 `Base.EffFs` 的 `WriteFile` / `FileSize` 结果同步为 `Nat`；
  `eprint` / `prim_eprint` / `prim_writeFileAtomic` 与内部状态码仍 `Int`。
- **低层原语仍是 Int**：`strLength` / `arrayLength` / `prim_*Length` 等保持 Int 签名；
  Base 在边界用 `natFromInt` / `natToInt`（运行时恒等或单分支）转换。这样避免了
  seed 阶段改 intrinsic 签名的自举死锁。
- **有符号 / 算法内部量保留 Int**：源码位置/span、行/列、fuel/终止性度量、de Bruijn
  level、meta id、哈希、退出码/状态、时间、`-1` 哨兵、`List.take/drop/range` 的计数参数。
- `String.byteLength` 而非 `String.length`：`Base` / `Prelude` 同时重导出 `Base.List`，
  同名 `length` 会触发 `duplicate export` 硬错误。
- `Nat` 可隐式提升为 `Int`（`natToInt`）；反向必须显式 `fromInt`/`fromIntMaybe`。
  算术与模式匹配规则见 [primitives.md](primitives.md) / [operators.md](operators.md)。

## Prelude 自动导入

`Prelude` 是唯一自动注入的模块（`Loader.Flatten.implicitPrelude`），注入范围由**包上下文**
决定（最近的 `vuna.toml` + 它的依赖闭包；无 manifest 的文件是 base-only 上下文）：

- **注入**：依赖闭包里含 `vuna-base` 的包内所有源文件，以及无 manifest 的 ad-hoc 单文件。
  `Show` / `Eq` / `Ord` 及其实例、`Bool` / `List` / `Maybe` / `Result` / `String` 等开箱
  可用，`==` 等运算符的 fixity 也随同一注入可见。
- **不注入**：`base` 自身模块（注入方就是 `vuna-base`）、`Prelude` 自身（避免环），以及
  **没有 base 依赖的包**。后者连 `==` 的 fixity 都没有，会先报
  `unknown fixity for operator ==`（fixity 的唯一来源是库模块里的 `infixl` / `infixr` 声明）。
- 显式 `import Prelude` 时不再重复注入；同一上下文出现多个候选 `Prelude` 报 ambiguous。
- `Base.Nat` **不在** `Prelude`：用 `Nat` 类型，或 `Eq` / `Ord` / `Show Nat` 实例，都要显式
  `import Base.Nat`（或经 `Base` 门面，它重导出 `Base.Nat`）。

## 标准库与自举的关系

- `base/lib/` 是 vuna 模块根，不是 OCaml 库目录；
- 自动注入只看包上下文（有 base 依赖才注入 `Prelude`），矩阵见上节；没有第二套加载模式；
- `Base.IO` 刻意不在 `Prelude` 中：`IO` 类型是内建、恒可见，但效果 API 与 `Monad IO`
  实例仍需要显式 `import Base.IO`，效果面不随自动注入进入每个源文件；
- `base/` 在 seed 闭包内：修改 seed 闭包内的源码需要 seed rotation，见
  [bootstrap.md](bootstrap.md)。

## 内建与库的边界

权威语义（宽度、编码、转义、错误行为、interp 边界）见 [primitives.md](primitives.md)；
这里只划「编译器提供什么、库提供什么」。

- **`Int` / `String` 是语言 primitive 类型**：没有 `data` 声明，字面量、`str*` 与**数值
  语义**由编译器提供（唯一真源 `Vuna.Compiler.Intrinsics`）；D23 起 `+ - * /` 的**方法面**
  在库（`Base.Num`），Int/Nat/Float 实例由精化器特化回内建原语。`data Int` / `data String`
  是重定义错误。`String` 是 UTF-8 字节串、`Int` 是固定的 63 位（见 primitives.md）。
- **`Bool` 归 `Base.Bool`**：`data Bool` 是唯一权威定义，canonical 身份 `Base.Bool.Bool`；
  `True` / `False` 精化为 `TBool`，codegen 表示是 OCaml `bool`，不生成变体。
  `if` / `case` / `main : Bool` 按 canonical 符号判定，没有短名判定或 prelude 桩。
  用户写同名 `data Bool` 是普通 data，不与 canonical 冲突。
- **`List` 也是 base 的普通 `data` 声明**：canonical 身份 `Base.List.List`。返回或接收
  `List` 的 10 个原语（`strUnpack` / `strPack` / `strConcatMany` / `strSubstTemplate`、
  `prim_getArgs` / `prim_readDir` / `prim_runIn` / `prim_spawn`、`arrayFromList` /
  `arrayToList`）经 List 桥接 helper（`dtp_unpack` / `dtp_pack` / `dtp_listOf` 等）落地，
  桥接只为 canonical `Base.List.List` 生成；包内没有该族时 codegen 报
  `CG_ListBridgeRequired`。`Prelude` 自动注入 `Base.List`，所以正常上下文里总可用。
- **`IO` 是语言内建效应类型**：kind `Type -> Type`，运行时裸 thunk
  `int -> 'a`，无构造器；`Base.IO` 只提供 API 与实例。细节见
  [effects.md](effects.md) §2。
- **`Show` / `Eq` / `Ord` / `Hashable` 在库（声明与实例分离）**：`Base.Show` / `Base.Eq` /
  `Base.Ord` / `Base.Hashable` 承载 trait 声明；实例按**落点规则**分布（见 [operators.md](operators.md)）：
  `Int` → `Base.Int`、`String` 的 Eq/Ord → `Base.String`、`Show String` → `Base.Show`
  （String 经 Interp 依赖 Show）、`Show Bool` → `Base.Bool`、`Eq/Ord Bool` → `Base.Eq` /
  `Base.Ord`（Bool 是方法返回类型）；容器 `Show` 实例在各自类型模块。实例随 `Prelude` 自动
  导入（`Prelude` 显式 `import Base.Int` 加载 Int 实例）。编译器只保留**机制**：
  `deriving (Show, Eq, Ord, Hashable)` 的展开、`eq` / `lt` 等的 `Int` / `String` 运行时特化、
  `if` / 字面量等语法。**运算符是方法别名**：`==` / `/=` / `<` / `<=` / `>` / `>=`
  在 Loader 被解析成 `eq` / `neq` / `lt` / `le` / `gt` / `ge`（fixity 与别名全部来自库模块里的
  `infix*` 声明），因此 `a == b` 与 `eq a b`
  是同一条路径；**`+` / `-` / `*` / `/` 同样是 `Base.Num` 方法 `add` / `sub` / `mul` /
  `div` 的别名**（内建 `+ - * /` 只留给 codegen / interp 的 runtime 映射，对源码不可见）。
  **相等证据驱动**：`eq`（含运算符写法）只有 Int/String 内建特化或 `Eq` 证据
  （实例 / `deriving` / 约束实例），无实例与函数相等在 check 期报错；参数化类型的
  `deriving` 展开成约束实例（`instance Eq a => Eq (F a)`），库里可写的容器实例也按这个
  形态声明。字符串展示只有一个实现 `strShow`——`Base.Show` 的 `String` 实例是
  `show s = strShow s`，库不再另写一套转义；`Show Bool` 用 `if` 输出 `True` / `False`；
  `Eq Bool` / `Ord Bool` 用模式匹配穷尽（不依赖 `==` / `<`，避免实例体自引用）。
- **效果原语只有 `prim_*` 名，且返回 `IO` 动作**：`Base.IO` 是默认用户面
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
- `HashMap k v` / `HashSet a` 是 1024 桶的持久哈希容器：键需 `Eq` + `Hashable`；无 `remove`、无 resize；
  `toList` 按桶序展开（不保证插入序）；`size` 是 O(n)（没有计数字段）；桶结构是
  `Array (Array (List ...))`（`Array.get` O(1)，`insert` 两次 32 元素 copy-on-write）；
- **只有 `HashMap` 移除了 `empty`**：空表统一写 `fromList []`。原因是空表在 OCaml 侧用
  `Array.make` 构造会引入弱类型变量（`'_weak`），跨模块使用时会被固定；`fromList []` 走
  `HashMap arrayEmpty`（`[||]` 字面量，non-expansive）可正常泛化。`HashSet.empty` 仍在；
- **`fromList` 与 `insertAll` 的冲突语义不同**：`fromList` 列表**前面**的条目优先（与
  `Base.Map.fromList` 的查找语义一致），`insertAll` **后面**的条目覆盖前面的。两者都是
  编译器历史 API 的语义，不要合并或用错；
- 哈希容器的键由 `Eq` + `Hashable` 约束覆盖（不再有 String/Int 专用容器）；`Hashable` 实例
  覆盖 primitive 与常用容器，用户类型可 `deriving (Hashable)`。仍**没有有序持久容器**
  （TreeMap/TreeSet）：需要有序时用 `Base.Sort`，大表查找用哈希容器；
- **容器与可变数据**：不可变 `Base.Array`、IO 内 `IORef` / `MArray` /
  `Buffer`、ST 内 `Base.ST` 的 `Ref` / `SArray`；`Array.get` / `MArray.read` 越界是
  宿主 `Invalid_argument`；`Array.set` 返回新数组；IO 句柄只经 `IO` 动作使用，ST 句柄
  只经 `ST r` 使用且不能逃出 `runST`（见 [effects.md](effects.md)）；
  `Ref`/`SArray` 是 linear record（恰好一次、不可复制），ST 动作本身仍可复制；
- **库级效应**：`State` / `Reader` / `Error` 是带 `Functor`/`Monad` 实例的纯函数
  monad（**不进入 `Prelude` / `Base` 门面**，显式 import）；`do` 可用；`Base.ST` 的 region
  隔离与「不声明 `Monad` 实例」的原因见 [effects.md](effects.md)；通用签名索引效应
  （用户自定义 op + 深 handler + 行/重排）未实现（见 [debt.md](debt.md) / [effects.md](effects.md)）；没有语言级并发 / async；
  **IO 标签在库层完成**：`Base.EffFs` 扩到完整 fs 面并改为命名
  实例（如 `"mock"`/`"real"`），新增 `Base.EffConsole`/`EffClock`/`EffEnv`/`EffProcess`（命名实例 +
  IO-backed handler），`IO` 仍是运行时基座/逃逸口；收尾又补原生 `prim_sleep`
  （`Base.EffClock` 与 `Base.IO.Host.sleepMicros` 都已使用，`spinMicros` 已删除）、可控
  `Exit`（`handleProcessIOWith`/`…Observed`）与工具链一条 console 路径（`vuna version`）；
  见 [effects.md](effects.md) §8.6；
- 抽象类型（`Map`、`HashMap`、`HashSet`、`IO`）跨包不可构造、不可模式匹配，只能经 API 使用；
- **`Applicative` 有 `pure` / `ap` / `liftA2` 三个方法**（vuna 无 default method，实例
  全部显式实现）：B42 修复后实例方法体可以直接对 `f (a -> b)` 做 `case` / pattern
  match（此前误报 `TC_ImpossibleBranchIndex`）；`liftA2` 暂不作派生顶层函数——codegen
  的字典投影在 OCaml 侧无类型标注（`dliftA2` 推断出
  `('a, 'b -> 'c, 'c -> 'd -> 'c) t_Dict -> 'b -> 'd -> 'd -> 'c`），泛型派生体会破坏
  `f a` / `f (a -> b)` 的类型关系（见 [records-traits.md](records-traits.md)）；
- `Array` 的 `Show` / `Eq` 实例已落地在 `Base.Array`（`Array` 是内建类型构造子、没有
  定义模块；孤儿规则已放宽到 `Array` / `IORef` / `MArray` / `Buffer`）。实例体经 `toList`
  复用 `List`：`show (fromList [1, 2, 3]) == "[1, 2, 3]"`；`Eq` 逐元素比较。

## 相关阅读

- 记录、trait、do/Monad 语义：[records-traits.md](records-traits.md)
- 效应 monad / ST / 通用 Eff 的边界：[effects.md](effects.md)
- 包与 workspace 机制、工具链命令：[packages.md](packages.md)
- 编译器门面与 seed 闭包：[compiler.md](compiler.md)、[bootstrap.md](bootstrap.md)
