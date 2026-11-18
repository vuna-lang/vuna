- **只有 `HashMap` 移除了 `empty`**：空表统一写 `fromList []`。原因是空表在 OCaml 侧用
  `Array.make` 构造会引入弱类型变量（`'_weak`），跨模块使用时会被固定；`fromList []` 走
  `HashMap arrayEmpty`（`[||]` 字面量，non-expansive）可正常泛化。`HashSet.empty` 仍在；- **只有 `HashMap` 移除了 `empty`**：空表统一写 `fromList []`。原因是空表在 OCaml 侧用
  `Array.make` 构造会引入弱类型变量（`'_weak`），跨模块使用时会被固定；`fromList []` 走
  `HashMap arrayEmpty`（`[||]` 字面量，non-expansive）可正常泛化。`HashSet.empty` 仍在
  （`HashSet` 本身是泛型，但 `empty` 有签名约束、调用点总带具体类型）；# 标准库（vuna-base）

标准库是独立成员包 `vuna-base`（模块 `Base.*`，模块根 `packages/base/lib/`）。编译器是它的第一个
用户：`packages/compiler/lib/Vuna/Compiler/Base/Common.vuna` 只是门面（整模块重导出 `Base.Data.Pair` /
`Base.Data.Bool` / `Base.Data.List` / `Base.Data.Maybe` / `Base.Data.Result` / `Base.Data.String` + 保留编译器的
`Pos` / `Span`、模块路径与诊断工具），编译器不再私自重复定义 `Maybe` / `List` 等类型。
包名 `vuna-base` 与模块命名空间 `Base.*` 是两回事（包名 ≠ 模块名）。

| 模块 | 内容 |
| --- | --- |
| `Base.Data.Pair` / `Base.Data.Bool` / `Base.Data.List` / `Base.Data.Maybe` / `Base.Data.Result` | 核心代数数据类型与常用 helper（append/reverse/map/filter/foldl/foldr/traverse/step/...）；`List` 另有候选选择组合子 `firstJust`（首个 `Just`）与 `firstSuccess`（顺序尝试动作，命中即停）；`Result` / `Maybe` / `List` 带 `Functor`/`Applicative`/`Monad` 实例（`do` 可用）；容器带约束 `Show`，代数容器另带 `Eq`（List/Maybe/Pair 还有 `Ord`），容器 `Show` 的插值经 blanket `Interp` 复用 |
| `Base.Trait.Field` / `Base.Trait.Record` | `Field` 类型级字段标签（`Field "id"`）+ `HasField` trait：nominal record 的泛型读访问；`Base.Trait.Record` 重导出 `Base.Trait.Field`；实例由编译器按 record 字段自动生成（仅导入 Base.Trait.Record 的模块）。见 [records-traits.md](records-traits.md)「HasField」 |
| `Base.Data.String` | split/join/lines/unlines/trim/contains/startsWith/endsWith/repeat/substring；`byteLength : String -> Nat` |
| `Base.Data.Sort` | 稳定排序 `mergeSort` / `sortBy`（当前实现是插入排序：稳定、O(n²)，适合小表） |
| `Base.Container.Map` | 关联表实现的抽象 Map（empty/insert/lookup/remove/keys/values/size/...）；小表用 |
| `Base.Container.HashMap` | 键与值都泛型的持久哈希映射（1024 桶；insert/insertAll/lookup/member/fromList/toList/size/ofNames；键需 `Eq` + `Hashable`；空表写 `fromList []`）；大表、构造后频繁查找 |
| `Base.Container.HashSet` | 键泛型的集合（内部 `HashMap a Bool`；empty/insert/member/fromList/toList/size；键需 `Eq` + `Hashable`） |
| `Base.Data.Unit` | 单元素类型 `Unit(..)`（`MkUnit`）+ `Eq` / `Ord` / `Show` / `Semigroup` / `Monoid` / `Hashable` 实例 |
| `Base.Trait.Hashable` | 通用哈希 trait：`hash : a -> Int`、`hashStr`（String 的 0..1023 哈希）、`hashCombine`；`String`/`Int`/`Bool`/`Nat`/`Unit`/`List`/`Maybe`/`Pair`/`Result`/`Ordering` 实例，用户类型可 `deriving (Hashable)` |
| `Base.Data.Bits` | 位运算命名库 + 32-bit 固定宽度包装：`band` / `bor` / `bxor` / `bnot` / `shl` / `shr`（63-bit 语义，移位越界 = 0）+ `mask8` / `mask32` / `shl32` / `shr32` / `add32` / `rotr32` / `rol32`；SHA-256 / 编码类算法使用 |
| `Base.Container.Array` | 不可变数组（内建类型构造子 `Array`；`fromList` / `toList` / `length` / `get` / `set` / `make`，长度与下标是 `Nat`；`set` 返回新数组） |
| `Base.Effect.Pure.IORef` | 可变引用（`newRef` / `readRef` / `writeRef` / `modifyRef`，公开操作与实现都是 `Eff []`） |
| `Base.Effect.Pure.State` / `Base.Effect.Pure.Reader` / `Base.Effect.Pure.Error` | 库级效应 monad：纯函数表示 + `Functor`/`Applicative`/`Monad` 实例（`do` 可用）；`State` 是 `s -> Pair a s`、`Reader` 是 `e -> a`、`Error` 是泛型 `Ok`/`Err` 和；handler 是 `runState` / `evalState` / `execState`、`runReader` / `ask` / `local`、`runError` / `throwError` / `catchError`。通用运行时效应见 `Base.Effect.Core`（[effects.md](effects.md) §8） |
| `Base.Data.Nat` | 非负整数（`Zero` / `Succ`）；运行时是 OCaml `int`。`plus` / `minus` / `mult` / `toInt` / `fromInt` / `fromIntMaybe` / `pred` / `isZero` + `Num`（除法经 `Num.div` / `/`）+ `Eq` / `Ord` / `Show` / `Hashable` / `Semigroup` / `Monoid` 实例 |
| `Base.Trait.Num` | 数值算术 trait：`add` / `sub` / `mul` / `div`；`+` / `-` / `*` / `/` 是它们的中缀别名（fixity 与别名声明在本模块）。`Int` / `Nat` / `Float` 实例在类型模块并由精化器特化回内建原语；用户类型实现 `Num`（配 `FromInt`）即可重载四则（见 [operators.md](operators.md)） |
| `Base.Data.Vec` | `Vec(..)` 与 `substTemplate` / `vhead` / `vlen` / `vtail` |
| `Base.Trait.Monad` | `Monad` trait（只有 `bind`；父类 `Applicative`）；重导出 `Base.Trait.Applicative`（进而重导出 `Base.Trait.Functor`），路径 `import Base.Trait.Monad as Monad` 与扁平 `import Base.Trait` 都能看到 `fmap` / `pure` / `liftA2` / `ap` |
| `Base.Trait.Applicative` | `Applicative` trait（`pure` / `ap` / `liftA2` 三个方法，各实例显式实现；父类 `Functor`，重导出 `Base.Trait.Functor`）；`Maybe` / `List` / `Result` / `State` / `Reader` / `Error` / `Eff` 实例 |
| `Base.Trait.Functor` | `Functor` trait（`fmap`）；`Applicative` 的父类 |
| `Base.Trait.Monoid` | `Semigroup`（`mappend`）与 `Monoid`（`mempty`）trait（无父类，泛型代码同时约束两者）；`List` / `String` / `Maybe` / `Nat` / `Unit` 实例 |
| `Base.Trait.Foldable` | `Foldable` trait（方法 `fold`）+ 顶层 `foldMap : Foldable t, Monoid m, Semigroup m => ...`；`List` / `Maybe` / `Result` 实例 |
| `Base.Trait.Traversable` | `Traversable t f`（双参数：容器 + Applicative）与方法 `mapM : (a -> f b) -> t a -> f (t b)`；`List` / `Maybe` / `Result` 实例 |
| `Base.Trait.Show` | `Show` trait（`show : a -> String`）+ `String` 实例；`DebugShow` trait（`debugShow : a -> String`，blanket `instance Show a => DebugShow a`，所有 `Show` 实例自动获得）与 `dbgShow : DebugShow a => a -> a`（打印后返回原值）；`Show Int` / `Show Bool` 随类型模块（`Base.Data.Int` / `Base.Data.Bool`），`Show String` 因 String 经 Interp 依赖 Show 留在本模块 |
| `Base.Trait.Interp` | 模板插值的转换 trait：`Interp a` + blanket `Show a => Interp a`（默认 = `show`）+ 具体 `Interp String`（原样输出）；插值降级与规则见 [templates.md](templates.md) |
| `Base.Trait.Eq` | `Eq` trait（`eq` / `neq : a -> a -> Bool`）+ `Bool` 实例（Bool 是 `Eq` 返回类型，实例随 trait） |
| `Base.Trait.Ord` | `Ord` trait（`lt` / `le` / `gt` / `ge : a -> a -> Bool`）+ `Bool` 实例；另含 `Ordering(..)`（`LT`/`EQ`/`GT`，带 `Eq`/`Ord`/`Show`/`Hashable` 实例）与 `compare` / `min` / `max` |
| `Base.Data.Int` | `Int` 的 `Eq` / `Ord` / `Show` / `Hashable` / `Num` 实例宿主（`Int` 是 primitive 类型；实例跟类型模块走；`Num Int` 的方法体由精化器特化回 `bi_*` 原语） |
| `Base.Data.Float` | `Float` primitive 类型模块（**随 `Prelude` 自动导出**）：`FromFloat` trait + `abs` / `sqrt` / `intToFloat` / `floatToInt` + `Eq` / `Ord` / `Show` / `Num` 实例；字面量、算术/比较、`main : Float`、模板插值本来就不需要 import。Prelude 闭包包含本模块，所有程序的 runtime 都带浮点 helper（[floats.md](floats.md)） |
| `Base.Trait.FromString` / `Base.Trait.FromInt` | 字面量转换 trait（`fromString` / `fromInt`）与 `String` / `Int` 恒等实例；`Prelude` 导出，`deriving (FromString)` / `(FromInt)` 为单字段包装类型自动派生（见 [floats.md](floats.md)） |
| `Base.Data.Bool` | `Bool` 类型与逻辑 helper + `Show` / `Hashable` 实例（`if` 输出 `True` / `False`）；`Eq` / `Ord` 实例因 Bool 是方法返回类型随 trait 留在 `Base.Trait.Eq` / `Base.Trait.Ord` |
| `Base.Effect.Core` | 通用运行时效应核心（Layer 1）：开放行 `Row`（`Nil` / `(::)`）、`Named` 命名标签、抽象动作 `Eff`（无世界令牌）、`Member` 行成员证明/`rowRem`、`weaken`、线性 `Cont`/`resumeCont`/`handleCoreLin`、内建 `Functor`/`Applicative`/`Monad (Eff r)`（`do`/`>>=`；不提供 `bindEff`/`pureEff`）、`sendCore`/`handleCore`、`runPure`/`joinEff`/`raise`（`runPure`/`joinEff` 要求行已处理干净，入口处未处理效应是类型错误）；OCaml 5 一次性续延；见 [effects.md](effects.md) §8 |
| `Base.Effect.Reader` | 标签 `ReaderOp s` + `Ask`（实例名并进标签，如 `Named "counter" (ReaderOp Int)`）：`ask`/`handleReader`/`handleReaderLin`/`local`（作用域问答） |
| `Base.Effect.State` | 标签 `StateOp s` + `Get`/`Put`（实例名并进标签，如 `Named "counter" (StateOp Nat)`）：`get`/`put`/`handleState`（answer `s -> Pair a s` 线程状态） |
| `Base.Effect.Fs` | 宿主-backed Fs 效应（完整 fs 面；标签 `FsOp`（实例名并进标签，如 `FsOp@mock`/`FsOp@real`，即 `Named "mock" FsOp`））：`ReadFile`/`WriteFile`/`WriteFileAtomic`/`ReadDir`/`IsDirectory`/`MakeDir`/`RemoveFile`/`FileExists`/`FileMtime`/`FileSize` + `fsReadFile`/`fsWriteFile`/…（默认名；显式 `@name`；`handleFs n`/`handleFsHost n` 的 handler 仍显式 n）；`WriteFile` 的结果是 `Nat`（`WriteFileAtomic` 仍 `Int`）；`fsFileSize`/`fsFileMtime` 返回 `Maybe`（取不到 = 无值）；真实 handler 用 `@vuna@host@try*` 原语，宿主失败抛 `FsErrorOp`（`FsError`：missing/denied/no-space/not-dir/is-dir/exists/io，`fsErrorText` 渲染）；`runFsError n` 把失败收成 `Result`，entry 预装的 `runFsErrorHost` 打印 `vuna: fs: …` 并 exit 1；mock（纯 answer）与 real handler 可并存（`dt_base/37`、`dt_base/85`） |
| `Base.Effect.Error` | 一阶 Error 效应 + 作用域 `catch`：`throw`/`handleError`/`runError`/`catch` |
| `Base.Effect.Exn` | 高阶/作用域 Error：`Try` 操作携带 `Eff` 子计算，`handleExn`/`runExn`/`catchExn`/`bracketExn`；scoped handler |
| `Base.EffSched` | 单线程 fiber 调度器：不透明 `Task`/`Scope`，`forkTask`/`awaitTask`/`yieldNow`/`isCancelled`/`cancelTask`/`cancelScope`/`scopeWait`/`scopeWaitTimeout`/`withScope`/`withScopeTimeout`/`raise`/`forkTaskWith`/线性 `TaskLin`；协作式取消（含清理宽限）、结构化作用域、逻辑步数超时；任务体 `Eff Nil a`；见 [effects.md](effects.md) §8.5 |
| `Base.EffChannel` | cooperative channel：`send`/`tryRecv`/`recvWait`（忙等 yield，无 Mutex/信号量）；生产者-消费者夹具 `dt_base/36` |
| `Base.EffMutex` | cooperative Mutex/Semaphore（IORef + yield 忙等；无阻塞原语）；`acquire`/`release`/`semWait`/`semSignal` |
| `Base.Effect.Console` | console 标签 `ConsoleOp`（实例名并进标签，如 `ConsoleOp@mock`/`ConsoleOp@real`）：`Print`/`EPrint`；`consolePrint`（结果 `Nat`）/`consoleEprint`（仍 `Int`）/`handleConsole`/`handleConsoleHost`（真实 handler 用 `prim_eff_print`/`prim_eff_eprint`，`Print` 在 result 族转 `Nat`）；`runConsole n`（`handleConsoleHost` + `joinEff` 单效应入口） |
| `Base.Effect.Clock` | clock 标签 `ClockOp`：`Now`（微秒）/`SleepMicros`；`clockNow`/`clockSleepMicros`/`handleClock`/`handleClockHost`；`runClock n`（单效应入口）（真实 handler 用 `effTimeUs` 与原生 `prim_eff_sleep`） |
| `Base.Effect.Env` | env 标签 `EnvOp`：`GetEnv`/`GetCwd`/`ExecPath`；`envGetEnv`/`envGetEnvNonEmpty`（未设置或空串 ⇒ `Nothing`）/`envGetCwd`/`envExecPath`/`handleEnv`/`handleEnvHost`（真实 handler 用 `prim_eff_getenv`/`prim_eff_getcwd`/`prim_eff_execPath`） |
| `Base.Effect.Args` | 参数标签 `ArgsOp`：`GetArgs`；`argsGetArgs`/`handleArgs`/`handleArgsHost`（真实 handler 用 `prim_eff_getArgs`）；`runArgs n` 单效应入口 |
| `Base.Effect.Stdin` | 标准输入标签 `StdinOp`：`ReadLine`/`ReadBytes`；`stdinReadLine`/`stdinReadBytes`（返回 `Maybe String`，EOF = `Nothing`）/`handleStdin`/`handleStdinHost`（真实 handler 用 `prim_eff_readLine`/`prim_eff_readBytes`）；`runStdin n` |
| `Base.Effect.Exit` | 退出标签：`ExitWith`；`exitWith`/`handleExit`/`handleExitHost`（真实 handler 用 `prim_eff_exit`）；`runExit n` |
| `Base.Effect.Process` | process 标签（命名实例，如 `"mock"`/`"real"`）：`Args`/`Exit`/`RunIn`；`processArgs`/`processExit`/`processRunIn`/`handleProcess`/`handleProcessHost`（真实 handler 用 `prim_eff_getArgs`/`prim_eff_exit`/`prim_eff_runIn`）/`handleProcessHostWith`（自定义 `onExit`）/`handleProcessHostObserved`（`Exit` 可观察、不退出）；启动失败（cwd 不存在 / 权限）抛 `ProcessErrorOp`（`ProcessError`，`processErrorText` 渲染），`runProcessError n` 收成 `Result`，entry 预装的 `runProcessErrorHost` 打印 `vuna: process: …` 并 exit 1；**子进程非零退出码仍是值** |
| `Base.Data` | 数据门面：扁平重导出 `Pair` / `Bool` / `List` / `Maybe` / `Result` / `String` / `Unit` / `Vec` / `Nat` / `Int` / `Float` / `Bits` / `Sort` / `Obs` / `Obs.Span`；也可写路径（`import Base.Data.List as List`）。叶子模块本身不跨包导出 |
| `Base.Trait` | trait 门面：扁平重导出 `Eq` / `Ord` / `Show` / `Interp` / `Hashable` / `Monoid` / `Foldable` / `Traversable` / `Monad`（含 `Applicative` / `Functor`）/ `Record`（含 `Field`）/ `Num` / `Neg` / `FromInt` / `FromString`；也可写路径（`import Base.Trait.Monad as Monad`） |
| `Base.Container` | 容器门面（只提供路径）：`import Base.Container.Map as Map` / `...HashMap` / `...HashSet` / `...Array` / `...Sort`，用路径区分 `insert` / `fromList` / `toList` / `size` 等同名操作 |
| `Base.Effect` | 效应门面（只提供路径）：`Core`（运行时核心）/ `Types`（类型面）/ `State` / `Reader` / `Error` / `Exn` / `Ref` / `Fs` / `Console` / `Clock` / `Env` / `Args` / `Stdin` / `Exit` / `Net` / `Process`，以及 `Pure` 子树 |
| `Base.Effect.Pure` | 纯效应表示门面（只提供路径，无运行时 handler）：`Base.Effect.Pure.State` / `Reader` / `Error` / `IORef` |
| `Base` | 包门面：整模块重导出核心模块（含 `Base.Data.Nat` / `Base.Trait.Num` / `Base.Data.Unit` / `Base.Trait.Applicative`(经 Monad) / `Base.Trait.Monoid` / `Base.Trait.Foldable` / `Base.Trait.Traversable` / `Base.Trait.Hashable`；不含 `Vec` 与哈希容器；`import Base` 即可用） |
| `Prelude` | 顶层模块（`packages/base/lib/Prelude.vuna`）：重导出 `Base.Data.Pair` / `Base.Data.Bool` / `Base.Trait.Eq` / `Base.Trait.Ord` / `Base.Trait.Num` / `Base.Trait.Show` / `Base.Trait.Interp` / `Base.Data.List` / `Base.Data.Maybe` / `Base.Data.Result` / `Base.Data.String` / `Base.Trait.Monad`（含 `Applicative`）/ `Base.Data.Unit` / `Base.Trait.Monoid` / `Base.Trait.Foldable` / `Base.Trait.Traversable` / `Base.Trait.Hashable`，按包上下文自动导入（规则见下节「Prelude 自动导入」）；显式 `import` 时不再重复注入；刻意不重导出 `Base.Effect.Core`（效果 API 需显式 import；Prelude 仅 import 加载）与 `Base.Data.Nat` |

推荐入口层：应用默认依赖自动 `Prelude`（或显式 `import Base`）；数据用 `Base.Data.X`、
trait 用 `Base.Trait.X`、容器用 `Base.Container.X`、效应用 `Base.Effect.X`，统一写
`import <门面>.<路径> as <别名>`。别名 import 同时绑定限定名与非限定名。

目录树（模块名 = 门面路径）：

```text
packages/base/lib/
  Base.vuna                  Prelude.vuna
  Base/Data.vuna             Base/Trait.vuna
  Base/Container.vuna        Base/Effect.vuna
  Base/Data/{Pair,Bool,List,Maybe,Result,String,Unit,Vec,Nat,Int,Float,Bits,Sort,Obs}.vuna
  Base/Data/Obs/Span.vuna
  Base/Trait/{Eq,Ord,Show,Interp,Hashable,Monoid,Foldable,Traversable,
              Functor,Applicative,Monad,Record,Field,Num,Neg,FromInt,FromString}.vuna
  Base/Container/{Map,HashMap,HashSet,Array}.vuna
  Base/Effect/{Core,Types,State,Reader,Error,Exn,Ref,Fs,Console,Clock,
               Env,Args,Stdin,Exit,Net,Process}.vuna
  Base/Effect/Pure.vuna      Base/Effect/Pure/{State,Reader,Error,IORef}.vuna
  Base/Internal/Operator.vuna
```

抽象类型（`Map`、`HashMap`、`HashSet`）的构造器保持私有。`Map` / `Sort` / `HashMap` / `HashSet` 都不在 `Prelude` 里；`Base` 门面重导出 `Base.Container.Map` / `Base.Data.Sort`，但**不**含 HashMap / HashSet——它们与 `Map` 在 `insert` / `fromList` / `toList` / `size` 上同名（`HashMap` 还有 `lookup` / `member`，`HashSet` 有 `member` 与 `empty`），同时重导出会让 `insert` 等名字在使用点产生歧义（同名条目允许共存，按候选集解析）。
用哈希容器时显式 `import Base.Container.HashMap as HashMap` / `...HashSet as HashSet`；同文件使用多个容器时写完整限定名（`HashMap.insert` / `HashSet.member`）。

`packages/base/vuna.toml` 的 `[export]` 只列门面；叶子模块（`Base.Effect.Fs` / `Base.Container.HashMap` / …）
不跨包可见，跨包 `import Base.Effect.Fs` 会报 `LD_ModuleNotFound`。包内模块之间仍按真实模块名互相 import。

模块导出清单（`packages/base/vuna.toml`）：

```toml
[export]
modules = [
  "Base",
  "Base.Data",
  "Base.Trait",
  "Base.Container",
  "Base.Effect",
  "Base.Effect.Core",
  "Base.Effect.Pure",
  "Prelude"
]
```

各门面内部的模块清单以 `packages/base/lib/Base/{Data,Trait,Container,Effect,Effect/Core,Effect/Pure}.vuna`
与 `Prelude.vuna` 的模块头为真源。

宿主操作直接调用 `prim_eff_*`；`Eff` / `runPure` / `joinEff` / `raise` / `runEff`
从 `Base.Effect.Core`（或扁平门面 `Base.Effect.Core`）显式 import。
`Prelude` 的导出列表见 `packages/base/lib/Prelude.vuna`。

## 度量与 Nat

- **公开度量用 Nat**：`List.length`、`Array.length/get/set/make`、
  `String.byteLength/substring/repeat`、`Base.Effect.Fs.fsFileSize`、
  `Map.size`、`HashMap.size`、`HashSet.size`、`Vec.vlen`。
- **Nat 归一化只留在 Eff handler 的 result 族**：`Base.Effect.Console` 的 `Print` 与
  `Base.Effect.Fs` 的 `WriteFile` / `FileSize` 结果是 `Nat`（handler 在边界用 `natFromInt` 转）；
  直接调用 `prim_eff_print` / `prim_eff_writeFile` / `prim_eff_fileSize` 得到 `Eff [] Int`；
  `prim_eff_eprint` / `prim_eff_writeFileAtomic` 与内部状态码仍 `Int`。
- **低层原语仍是 Int**：`strLength` / `arrayLength` / `prim_*Length` 等保持 Int 签名；
  Base 在边界用 `natFromInt` / `natToInt`（运行时恒等或单分支）转换。这样避免了
  seed 阶段改 intrinsic 签名的自举死锁。
- **有符号 / 算法内部量保留 Int**：源码位置/span、行/列、fuel/终止性度量、de Bruijn
  level、meta id、哈希、退出码/状态、时间、`-1` 哨兵、`List.take/drop/range` 的计数参数。
- `String.byteLength` 而非 `String.length`：`Base` / `Prelude` 同时重导出 `Base.Data.List`，
  同名 `length` 会让裸名解析产生歧义（`Base` 门面仍只平铺 `Base.Data.List` 一侧）。
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
- `Base.Data.Nat` **不在** `Prelude`：用 `Nat` 类型，或 `Eq` / `Ord` / `Show Nat` 实例，都要显式
  `import Base.Data.Nat as Nat`（或经 `Base` 门面，它重导出 `Base.Data.Nat`）。

## 标准库与自举的关系

- `packages/base/lib/` 是 vuna 模块根，不是 OCaml 库目录；
- 自动注入只看包上下文（有 base 依赖才注入 `Prelude`），矩阵见上节；没有第二套加载模式；
- `Base.Effect.Core` 刻意不重导出到 `Prelude`：动作类型与 handler 需要显式 `import Base.Effect.Core as Eff`（`Prelude` 只
  `import Base.Effect.Core` 以加载类型/原语闭包，不进自动导出面），效果面不随自动注入进入每个源文件；
- `packages/base/` 在 seed 闭包内：修改 seed 闭包内的源码需要 seed rotation，见
  [bootstrap.md](bootstrap.md)。

## 内建与库的边界

权威语义（宽度、编码、转义、错误行为、核心求值边界）见 [primitives.md](primitives.md)；
这里只划「编译器提供什么、库提供什么」。

- **`Int` / `String` 是语言 primitive 类型**：没有 `data` 声明，字面量、`str*` 与**数值
  语义**由编译器提供（唯一真源 `Vuna.Compiler.Base.Intrinsics`）；`+ - * /` 的**方法面**
  在库（`Base.Trait.Num`），Int/Nat/Float 实例由精化器特化回内建原语。`data Int` / `data String`
  是重定义错误。`String` 是 UTF-8 字节串、`Int` 是固定的 63 位（见 primitives.md）。
- **`Bool` 归 `Base.Data.Bool`**：`data Bool` 是唯一权威定义，canonical 身份 `Base.Data.Bool.Bool`；
  `True` / `False` 精化为 `TBool`，codegen 表示是 OCaml `bool`，不生成变体。
  `if` / `case` / `main : Bool` 按 canonical 符号判定，没有短名判定或 prelude 桩。
  用户写同名 `data Bool` 是普通 data，不与 canonical 冲突。
- **`List` 也是 base 的普通 `data` 声明**：canonical 身份 `Base.Data.List.List`。返回或接收
  `List` 的 10 个原语（`strUnpack` / `strPack` / `strConcatMany` / `strSubstTemplate`、
  `prim_eff_getArgs` / `prim_eff_readDir` / `prim_eff_runIn` / `prim_eff_spawn`、`arrayFromList` /
  `arrayToList`）经 List 桥接 helper（`dtp_unpack` / `dtp_pack` / `dtp_listOf` 等）落地，
  桥接只为 canonical `Base.Data.List.List` 生成；包内没有该族时 codegen 报
  `CG_ListBridgeRequired`。`Prelude` 自动注入 `Base.Data.List`，所以正常上下文里总可用。
- **`Eff` 是唯一动作类型**：`Base.Effect.Core` 的装箱 data（行擦除索引），运行时是一次性续延 +
  handler 路由；入口 `main : Eff [] a`，执行 `runPure`；细节见
  [effects.md](effects.md) §2。
- **`Show` / `Eq` / `Ord` / `Hashable` 在库（声明与实例分离）**：`Base.Trait.Show` / `Base.Trait.Eq` /
  `Base.Trait.Ord` / `Base.Trait.Hashable` 承载 trait 声明；实例按**落点规则**分布（见 [operators.md](operators.md)）：
  `Int` → `Base.Data.Int`、`String` 的 Eq/Ord → `Base.Data.String`、`Show String` → `Base.Trait.Show`
  （String 经 Interp 依赖 Show）、`Show Bool` → `Base.Data.Bool`、`Eq/Ord Bool` → `Base.Trait.Eq` /
  `Base.Trait.Ord`（Bool 是方法返回类型）；容器 `Show` 实例在各自类型模块。实例随 `Prelude` 自动
  导入（`Prelude` 显式 `import Base.Data.Int` 加载 Int 实例）。编译器只保留**机制**：
  `deriving (Show, Eq, Ord, Hashable)` 的展开、`eq` / `lt` 等的 `Int` / `String` 运行时特化、
  `if` / 字面量等语法。**运算符是方法别名**：`==` / `/=` / `<` / `<=` / `>` / `>=`
  在 Loader 被解析成 `eq` / `neq` / `lt` / `le` / `gt` / `ge`（fixity 与别名全部来自库模块里的
  `infix*` 声明），因此 `a == b` 与 `eq a b`
  是同一条路径；**`+` / `-` / `*` / `/` 同样是 `Base.Trait.Num` 方法 `add` / `sub` / `mul` /
  `div` 的别名**（内建 `+ - * /` 只留给 codegen / 核心求值的 runtime 映射，对源码不可见）。
  **相等证据驱动**：`eq`（含运算符写法）只有 Int/String 内建特化或 `Eq` 证据
  （实例 / `deriving` / 约束实例），无实例与函数相等在 check 期报错；参数化类型的
  `deriving` 展开成约束实例（`instance Eq a => Eq (F a)`），库里可写的容器实例也按这个
  形态声明。字符串展示只有一个实现 `strShow`——`Base.Trait.Show` 的 `String` 实例是
  `show s = strShow s`，库不再另写一套转义；`Show Bool` 用 `if` 输出 `True` / `False`；
  `Eq Bool` / `Ord Bool` 用模式匹配穷尽（不依赖 `==` / `<`，避免实例体自引用）。
- **效果原语单表**：`prim_eff_*`（`Eff []`，外加 `effTimeUs`）就是宿主层，
  宿主操作直接调用这些原语，没有别名模块。没有 manifest 能力/特权声明：任何包都可直调
  `prim_*` / `prim_eff_*`。
  动作只在 `main` 执行（钩子 `dtp_sched_main (fun () -> runPure v_main)`）；`runPure` 是
  唯一 main 执行入口。Int/Nat 归一化只在 Eff handler 的 result 族。用户面**应**经 `Eff` + handler（纪律，非强制）。
- **ad-hoc 单文件与包内模块一致**：`Prelude` 自动注入，`Show` / `Eq` / `Ord` 及其实例开箱
  可用；诊断在缺少显式 import 时仍会提示加对应 import。ad-hoc 文件同样没有能力门控：
  既可经 `Base.Effect.Core` + handler，也可直接调用 `prim_*` / `prim_eff_*`（约定：用户面应经 handler）。
- split 输出（`compile` / `build` 目录）的编译单元只有 `Vuna_runtime` + 各源码模块 +
  `Main`；文件集以 `seed/` 与 `nix/seed/files.txt` 为准。

## 已知边界

- `Map` 是关联表（assoc list）实现的抽象类型，无平衡树；适合小表；
- `HashMap k v` / `HashSet a` 是 1024 桶的持久哈希容器：键需 `Eq` + `Hashable`；无 `remove`、无 resize；
  `toList` 按桶序展开（不保证插入序）；`size` 是 O(n)（没有计数字段）；桶结构是
  `Array (Array (List ...))`（`Array.get` O(1)，`insert` 两次 32 元素 copy-on-write）；
- **只有 `HashMap` 移除了 `empty`**：空表统一写 `fromList []`。原因是空表在 OCaml 侧用
  `Array.make` 构造会引入弱类型变量（`'_weak`），跨模块使用时会被固定；`fromList []` 走
  `HashMap arrayEmpty`（`[||]` 字面量，non-expansive）可正常泛化。`HashSet.empty` 仍在；
- **`fromList` 与 `insertAll` 的冲突语义不同**：`fromList` 列表**前面**的条目优先（与
  `Base.Container.Map.fromList` 的查找语义一致），`insertAll` **后面**的条目覆盖前面的。两者都是
  既定 API 语义，不要合并或用错；
- 哈希容器的键由 `Eq` + `Hashable` 约束覆盖（没有 String/Int 专用容器）；`Hashable` 实例
  覆盖 primitive 与常用容器，用户类型可 `deriving (Hashable)`。仍**没有有序持久容器**
  （TreeMap/TreeSet）：需要有序时用 `Base.Data.Sort`，大表查找用哈希容器；
- **容器与可变数据**：不可变 `Base.Container.Array`、`Eff []` 内 `IORef`；`Array.get` 越界是
  宿主 `Invalid_argument`；`Array.set` 返回新数组；可变数据句柄只经 `Eff []` 动作使用
  （见 [effects.md](effects.md)）。没有局部可变入口（region/ST、可变数组、字符串缓冲），
  重建约束见 [debt.md](debt.md) D63 / D64；
- **库级效应**：`State` / `Reader` / `Error` 是带 `Functor`/`Monad` 实例的纯函数
  monad（**不进入 `Prelude` / `Base` 门面**，显式 import）；`do` 可用；语言级 `perform`/`handle`
  语法见 [native-effects.md](native-effects.md)，通用签名索引效应
  （用户自定义 op + 深 handler + 行/重排）未实现（见 [debt.md](debt.md) / [effects.md](effects.md)）；
  **效应标签在库层**：`Base.Effect.Fs` 是完整 fs 面并带命名实例（`Named "mock" FsOp` / `Named "real" FsOp`），
  `Base.Effect.Console`/`EffClock`/`EffEnv`/`EffProcess` 是命名实例 + 宿主 handler，宿主层仍可
  直接调用 `prim_eff_*`；原生 `prim_eff_sleep`（`Base.Effect.Clock` 与直接调用路径都用）、可控
  `Exit`（`handleProcessHostWith`/`…Observed`）与工具链一条 console 路径（`vuna version`）都在；
  见 [effects.md](effects.md) §8.6；
- 抽象类型（`Map`、`HashMap`、`HashSet`）跨包不可构造、不可模式匹配，只能经 API 使用；
- **`Applicative` 有 `pure` / `ap` / `liftA2` 三个方法**（vuna 无 default method，实例
  全部显式实现）：实例方法体可以直接对 `f (a -> b)` 做 `case` / pattern match；
  `liftA2` 不作派生顶层函数——codegen 的字典投影在 OCaml 侧无类型标注（`dliftA2` 推断出
  `('a, 'b -> 'c, 'c -> 'd -> 'c) t_Dict -> 'b -> 'd -> 'd -> 'c`），泛型派生体会破坏
  `f a` / `f (a -> b)` 的类型关系（见 [records-traits.md](records-traits.md)、
  [debt.md](debt.md) D52）；
- `Array` 的 `Show` / `Eq` 实例在 `Base.Container.Array`（`Array` 是内建类型构造子、没有
  定义模块；孤儿规则对 `Array` / `IORef` 放宽）。实例体经 `toList`
  复用 `List`：`show (fromList [1, 2, 3]) == "[1, 2, 3]"`；`Eq` 逐元素比较。

## 相关阅读

- 记录、trait、do/Monad 语义：[records-traits.md](records-traits.md)
- 效应 monad / 通用 Eff 的边界：[effects.md](effects.md)
- 包与 workspace 机制、工具链命令：[packages.md](packages.md)
- 编译器门面与 seed 闭包：[compiler.md](compiler.md)、[bootstrap.md](bootstrap.md)
