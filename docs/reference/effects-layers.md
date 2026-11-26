# Layer 2/3：高阶/作用域、线性续延与效应标签

> 本文是 [effects.md](effects.md) §8.5/§8.6 的展开页：高阶 scoped handler、
> 线性续延/一次性闭包/`bracket`（含 abort cleanup）、效应标签。Layer 1
> 核心（行/`Eff`/`Member`/运行时）见 [effects.md](effects.md) §8。
### 8.5 Layer 2/3

**Layer 2（作用域/高阶组合）**：

- `Base.Effect.Reader.local`：先 `ask` 取外层 env，在临时 handler 中回答 Ask，再用
  `weaken` 把结果行扩宽回 `e :: r`；外层 handler 仍在，所以 local 之后该效应仍可用。
- `Base.Effect.Error`：`throw`/`handleError`/`runError` + `catch`。catch 在 comp 内安装临时
  Error handler；Throw 丢弃一次性续延并返回 `Result`；fallback 在 handler **之外**执行，
  因此嵌套 catch 的 fallback 抛错可被外层 catch 捕获。
- 夹具 `dt_base/20_eff_local`（877）、`21_eff_catch`（4207）。

**高阶操作 / scoped handler**：

- `Base.Effect.Exn`：`ExnOp.Try` 携带一个 `Eff` 子计算；`handleExn` 的 op handler 用
  `runEff (runExn sub)` 在**嵌套 handler** 下运行子计算，外层运行时 handler 继续处理
  子计算里的其它效应；`catchExn` 在 `tryWith` 上组合。
- `runEff` 是信任边界内的作用域运行入口（任意行；仅供库内 handler 实现使用）；普通用户用
  `runPure`——只接受纯动作（`Eff []`，入口处未处理效应是类型错误）。
- 宿主交互只能出现在 `HostOp` 行里（`Base.Effect.Host`）：宿主原语类型固定为
  `Eff [HostOp] a`，关闭器是 `runHost`（裸值，给直连 opH）与 `hostSync`（放回任意行，
  给带 typed-error 的收口族）。`rowRem` 不对 `HostOp` 归约，源码层没有第二条删除路径。
- 夹具 `dt_base/23_eff_scoped`（107：子计算里的 Reader 由外层 handler 处理）；
  负例 `dt_err/74_try_row_mismatch`（`tryWith` 要求行首 `Exn n`）。

**Layer 3（并发/async）**

- 负例 `dt_err/71_catch_row_mismatch`、`72_local_row_mismatch`、`73_async_row_not_nil`：
  catch/local 要求行首是对应效应，async 只接受 `Eff Nil`。

**单线程 fiber 调度器**：

`Base.EffSched` / `Base.EffMutex` / `Base.EffChannel` 已作为死代码删除（commit `1c90517`）；
`prim_sched*` 与本文旧描述的清理由 gh#100 跟踪。当前多线程走 `Base.Thread`
（`spawn`/`join` / `Mutex` / `Condvar` / `Atomic`），见 [primitives.md](primitives.md) §6.2。

### 8.6 效应标签（库层 + 一条工具链真实路径）

用户面 API 走效应标签，handler 内部用 `@vuna@prim_eff_*` / `@vuna@host@*` 实现。

| 模块 | 标签（行条目） | 操作 | 真实 handler | mock 方式 |
| --- | --- | --- | --- | --- |
| `Base.Effect.Console` | `ConsoleOp`（实例名并进标签，如 `ConsoleOp@mock`/`ConsoleOp@real`） | `Print String` / `EPrint String` | `runConsoleHost`（entry）→ `@vuna@prim_eff_print`/`@vuna@prim_eff_eprint`（`Print` 在 result 族转 `Nat`）；`runConsoleEff`（worker） | 自定义 `handleConsole`（如收集日志） |
| `Base.Effect.Clock` | `ClockOp`（实例名并进标签，`Named "mock" ClockOp :: r`） | `Now`（微秒）/`SleepMicros Int` | `runClockHost`（entry）→ `effTimeUs` + **原生 `@vuna@prim_eff_sleep`**；`runClockEff`（worker） | 固定时间戳 / 忽略 sleep |
| `Base.Effect.Env` | `EnvOp`（实例名并进标签） | `GetEnv String`/`GetCwd`/`ExecPath` | `runEnvHost`（entry）→ `@vuna@prim_eff_getenv`/`@vuna@prim_eff_getcwd`/`@vuna@prim_eff_execPath`；`runEnvEff`（worker） | 固定字符串 |
| `Base.Effect.Process` | `ProcessOp`（实例名并进标签） | `Args`/`Exit Int`/`RunIn String (List String)` | `runProcessHost`（entry，`Exit` 真实退出）/ `handleProcessHostWith`（自定义 onExit）/ `runProcessResult`（worker，启动失败收成 `Result`） | 自定义 `handleProcess`（`Exit c` 作为操作结果） |
| `Base.Effect.Fs` | `FsOp`（实例名并进标签，如 `FsOp@mock`/`FsOp@real`） | `ReadFile`/`WriteFile`/`WriteFileAtomic`/`ReadDir`/`IsDirectory`/`MakeDir`/`RemoveFile`/`FileExists`/`FileMtime`/`FileSize` | `runFsHost`（entry）→ `@vuna@host@try*` + 状态槽（`WriteFile`/`FileSize` 在 result 族转 `Nat`）；`runFsResult`（worker，失败收成 `Result`） | 自定义 `handleFs n`（纯 answer 内存表） |

 - **命名实例**：console/clock/env/process/fs 的标签都是 op 族应用（`ConsoleOp`/`FsOp`…），
  实例名并进标签（`Named "mock" FsOp` 与 `Named "real" FsOp` 是不同条目），因此同一个
  程序可以同时装 mock 与真实 handler（或两个 mock）；send/handler 用同一对 `(key, name)`
  字符串。实例名由使用方自选，同一效应族同时安装的实例名必须互不相同。fs 的默认实例入口是
  `fsReadFile path`，命名实例写 `fsReadFile@name path`，handler 用 `handleFs n`。
- **宿主 handler 的形态**：`runXHost`（entry 预装）接受行首为对应标签的 `Eff (e :: r) a`，返回
  `Eff (rowAppend r [HostOp]) a`（错误收口族把行尾接到 `Err` 标签，原语经 `hostSync` 同步执行），
  由 `joinEff` 执行；非错误族的结果行尾是宿主行 `[HostOp]`。
- **默认实例的闭合 runner**：`runXEff : Eff [XOp] a -> Eff [] a`（Console / Clock / Env / Args /
  Stdin / Tty / Exit）与 `runXResult : Eff [XOp] a -> Eff [] (Result a)`（Fs / Process / Net）
  把 entry 用的同一个真实 handler 装进 `Eff []` 的 worker / 子计算；`Process` 的 `Exit` 在这些
  runner 里仍是真实退出。
- **原生 sleep**：编译器原语 `@vuna@host@sleep : Int -> Eff [HostOp] Int`（微秒；运行时
  `dtp_sleep` 用 `Unix.sleepf`，阻塞睡眠；`OpNone`，核心求值不归约）。
  `Base.Effect.Clock` 的 `SleepMicros` 直接走它；探针用的 `effTimeUs` /
  `@vuna@prim_eff_sleep` 同样是宿主行类型。
- **可控 `Exit`**：`runProcessHost` 保留真实语义（`onExit = @vuna@prim_eff_exit_process_host`，
  调用即结束进程）；`handleProcessHostWith n onExit` 让调用方替换退出行为（传 `pure` 即可观察
  退出码、不结束进程）。mock handler 本来就能观察 `Exit`。真实路径的夹具
  （`effect/native/30`）仍只覆盖 `Args`/`RunIn`，避免测试进程退出；观察路径见
  `effect/native/41`。
- **fs mock/real 并存**：`dt_base/40` 用同一个 `prog n` 在 `FsOp@mock`（纯 answer mock：固定
  内容/大小）与 `FsOp@real`（真实宿主 handler，真实目录读写）下各跑一次，mock 与 real handler
  在同一程序里并存。
- **工具链**：`packages/cli/lib/Vuna/Cli.vuna` 的 `vuna version` 输出走
  console 标签——`consoleLine` 用 `consolePrint msg`（默认实例名，`Member n ConsoleOp r =>`）
  走宿主行；宿主行只由 entry 关闭（`main` 有族标签时折完 handler 走 `runMain`，纯 main 走
  `runPure`）。工具链其余模块同样走
  `Base.Effect.*` 标签；宿主原语是隐藏名（源码写不出），没有可直调的入口。`prim_*`（纯原语）
  仍可直接调用。
- **对拍夹具**（关闭 interp 阶段，只 check + compile + run）：
  - `effect/common/26_eff_console`：同一 `prog n` 在 `ConsoleOp@mock`（mock，纯 answer 收集日志）
    与 `ConsoleOp@real`（real，`@vuna@prim_eff_print`/`@vuna@prim_eff_eprint`）下各跑一次；
  - `effect/native/27_eff_clock`：mock 固定时间 → elapsed 0；real 断言 sleep 后时间推进
    （真实 handler 走 `@vuna@prim_eff_sleep`）；
  - `effect/native/28_eff_env`：mock 与 real 对「缺失变量为空 / cwd 非空 / execPath 非空」打分；
  - `effect/common/29_eff_fs_ext`：真实 fs 读写 + 原子写 + 元数据 + 目录 + 删除（entry 预装 `runFsHost`）；
  - `effect/native/30_eff_process`：mock 固定 args/退出码；real 用 `@vuna@prim_eff_getArgs`（不含 argv[0]）
    与 `@vuna@prim_eff_runIn "true"`；
  - `effect/common/40_eff_fs_named`：fs 命名实例 mock（`"mock"`）/ real（`"real"`）并存对拍
    （`handleFs "mock"`）；
  - `effect/native/41_eff_process_exit`：`Exit` 在 mock（`"mock"`）与观察 handler（`"observed"`，
    `handleProcessHostWith`）下可观察、不退出；
  - 负例 `dt_err/78_eff_fs_instance_mismatch`：程序需要 `FsOp`、handler 处理 `FsOp`
    → `TC_TypeMismatch`（实例名必须一致）；
  - 原语探针夹具 `packages/cli/test/corpus/packages/10_prim_io`：`clockSleepMicros` 断言真实推进时间
    （真实 handler 内部走 `@vuna@prim_eff_sleep`）。
- **没有包级能力声明**：`[capabilities] effects` 这类声明不存在——`prim_*` 任何包都可直调；
  宿主效应原语是隐藏名（源码写不出），用户面只有标签 + handler，也没有类型级能力行
  （见 [effects.md](effects.md) §8.6）。
- **边界**（没有 manifest 门控）：
  - **宿主原语隐藏**：`@vuna@prim_eff_*` / `@vuna@host@*` 源码写不出，只由 base 的 handler 使用；
    用户面走 `Eff` + handler。
  - **内部使用**：`vuna-base` 的真实 handler 保留原语直调；编译器只产生 IR 符号（`IrRt` /
    `IrRtApp`），由后端的符号表映射到目标代码。
  - **`Exit` 的真实语义保留**：`runProcessHost` 仍会结束进程；「不退出」只在 mock /
    `handleProcessHostWith` 的 `onExit` 参数下成立；
  - 入口未处理效应是类型错误（`TC_UnhandledEffects`）；运行时 `unhandled effect` 兜底
    仍服务库内部路径；行擦除、运行时字符串 key 等既有边界不变。
