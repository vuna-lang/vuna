# Layer 2/3：高阶/作用域、线性续延、调度器与效应标签

> 本文是 [effects.md](effects.md) §8.5/§8.6 的展开页：高阶 scoped handler、
> 线性续延/一次性闭包/`bracket`（含 abort cleanup）、单线程调度器、效应标签。Layer 1
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

**单线程 fiber 调度器（`Base.EffSched`）**：

表示与运行模型：

- **纤程 = OCaml 5 一次性续延**。每个被调度的任务体在运行时用一个自己的
  `Effect.Deep.match_with` 根 handler 执行；根 handler 只拦截**调度器私有效应**
  （`SchedYield` / `SchedAwait` / `SchedWaitScope` / `SchedWaitScopeTimeout`，均为
  `Vuna_runtime` 内部 `Effect.t` 构造子，不进语言层），把续延交给纤程外部的调度循环。
- **调度循环**在 `dtp_sched_main` 里：main 动作本身是纤程 0（生成钩子是
  `dtp_sched_main (fun () -> v_main 0)`），循环从就绪队列取任务跑一步（运行到下一个
  挂起点或结束），再按等待关系唤醒。任务之间不共享 handler 栈：用户 `Perform` 效应
  只在任务自己的纤程里被 handler 处理。
- 调度器原语是隐藏 intrinsic `prim_sched*`（实现 `dtp_sched_*`，常规只供
  `Base.EffSched` 包装；普通用户经 `Base.EffSched` 的 API）。它们**不是行里的效应**：
  行 `Nil` 的任务也能 fork/yield/await。

API（`packages/base/lib/Base/EffSched.vuna`）：

| 名称 | 签名 | 语义 |
| --- | --- | --- |
| `forkTask` | `Scope -> Eff Nil a -> Eff r (Task a)` | 子任务入队；父纤程下一次挂起/结束等待时才跑 |
| `awaitTask` | `Task a -> Eff r (Result a)` | `Ok a` / `Err "cancelled"` / `Err <失败消息>`；可重复 await（幂等） |
| `yieldNow` | `Eff r Int` | 让出一次调度；返回 0 正常、1 = 已请求取消 |
| `isCancelled` | `Eff r Int` | 查询当前纤程的取消位 |
| `cancelTask` / `cancelScope` | 句柄 -> `Eff r Int` | 请求取消（幂等；已完成任务为 no-op） |
| `scopeWait` | `Scope -> Eff r (Result Int)` | 等范围内任务全部结束；`Ok 完成数` / `Err 失败消息` |
| `scopeWaitTimeout` | `Int -> Scope -> Eff r (Result Int)` | 带**逻辑步数**预算的 `scopeWait`；预算耗尽先取消范围再等清理 |
| `withScope` | `(Scope -> Eff r (Result a)) -> Eff r (Result a)` | 结构化作用域；body 的 `Result` 与 scope 的结果合并；body `Err` 时先取消子任务再等干净 |
| `withScopeTimeout` | `Int -> (Scope -> Eff r (Result a)) -> Eff r (Result a)` | 同上 + 步数超时 |
| `newScope` | `Eff r Scope` | 新建作用域（一般经 `withScope`） |

语义与边界：

- **协作式**：任务只在 `yieldNow`/`awaitTask`/`scopeWait*` 挂起点让出；纯计算循环
  不能被抢占（取消只在挂起点生效）。
- **取消**：`cancelTask`/`cancelScope` 给未结束任务置取消位；已挂起的任务在挂起点
  恢复并收到取消状态（`yieldNow` 返回 1、`awaitTask` 返回 `Err "cancelled"`），
  任务可跑清理后返回；未开始的任务直接取消（不执行）。取消后有 **64 步清理宽限**，
  超时后调度器硬中止该纤程（丢弃续延）。取消是**协作**语义：任务自己决定在哪些
  检查点查询取消状态并清理。bracket 与取消组合：任务在挂起点恢复后 use 正常返回时，库层 `bracket` 在带内执行 release（夹具 `dt_base/43`）；硬中止路径由调度器尽力执行 cleanup 栈（无 handler 栈，只能无效应清理）。
- **结构化**：`withScope` 在 body 返回后等待 scope 内任务全部结束；
  子任务失败会取消同范围其余任务并把首个失败消息记为 scope 失败。`scopeWait` 本身只
  保证「全部结束」——子任务的取消/失败结果用 `awaitTask` 观察（`withScope` 会把未观察
  到的 scope 失败作为 `Err` 返回，避免监督信息被吞掉）。
- **超时**：超时是**调度器逻辑步数**（循环迭代次数；不依赖真实时钟/sleep）。
  `withScopeTimeout n` 表示「开始等待后的 n 个调度步内清空」；预算耗尽 → 取消范围 →
  子任务清理 → 返回 `Err "timeout"`。
- **任务行限制**：任务体必须是 `Eff Nil a`（任务内用户效应必须由任务自己的 handler
  处理干净）；不能用外层 handler 的行。负例 `dt_err/76_sched_row_not_nil`。
  任务体内不能再有未处理干净的宿主行效应。任务体本身可以返回任意 `a`
  （包括 `Result`）；若任务体内再用 `withScope`，`awaitTask` 得到的是嵌套
  `Result (Result …)`，由调用方显式展平（库不做隐式 flatten）。
- **句柄**：`Task`/`Scope` 不是线性数据；重复 `await` 幂等。线性 `TaskLin`：
  `awaitTaskLin`/`cancelTaskLin` 各消费一次，二次使用在用量检查拒绝
  （夹具 `dt_base/38`、负例 `dt_err/77`）。
- **Mutex/Semaphore**：`Base.EffMutex` 用可变单元 + yield 忙等；`acquire/release`、
  `newSemaphore/semWait/semSignal`；夹具 `dt_base/37`（2）。

夹具（均关闭 interp 阶段，只 `check` + `compile` + 运行）：

- `dt_base/42_eff_bracket_abort`：自定义 Abort handler 丢弃续延，`Base.Effect.Core.bracket` 的 release 写入被外层 State handler 看到（4207）。
- `dt_base/43_eff_sched_bracket`：调度器取消后 `use` 正常返回，带内 release（`acquire/release/3`）。
- `dt_base/44_eff_linear_fn`：线性资源被一次性闭包捕获、装进 `Cont` rig-1 字段、resume 一次（13）。
- 负例 `dt_err/79_linear_closure_escape`、`80_linear_nonlinear_field`、`81_linear_cont_twice`。

- `dt_base/31_eff_sched`：fork/await 顺序与结构化 scope（`forked, a1, b1, a2, b2, 30`）。
- `dt_base/32_eff_sched_cancel`：取消清理（挂起点收到取消 → cleanup → `scopeWait` 等
  干净；`awaitTask` 观察 `Err "cancelled"`）。
- `dt_base/33_eff_sched_timeout`：步数超时（4 步预算 → 取消 → cleanup → `Err "timeout"`）。
- `dt_base/34_eff_sched_supervise`：子任务失败 → 同范围兄弟被取消（可观察清理）、
  `Err` 携带 `unhandled effect boom (instance 0)`；body 返回 `Err` 后 scope 仍等干净。
- `dt_base/35_eff_sched_reawait`：重复 await 幂等、对已完成任务 cancel 是 no-op。
- `dt_base/36_eff_sched_channel`：生产者-消费者；`Base.EffChannel` 的 `send`/`recvWait`
  用 `yieldNow` 忙等轮询（无阻塞原语），fork 的 producer 在父纤程 yield 时入队，输出 42。

**边界（仍开放）**：Mutex/Semaphore/Channel 都是 cooperative 忙等实现（无阻塞原语）；
线性 TaskLin 只保证 handle 恰好一次 await/cancel，不保证资源释放；effect-aware 并发：
`forkTaskWith` 用显式 handler 把 effectful task 收成 Nil
再 fork（handler 状态为任务局部）；仍无法继承父 fiber 的动态 handler 栈
（[debt.md](debt.md) D44）；
取消只在挂起点生效，硬中止会丢弃未执行清理的纤程；`withScope` 的 body 若以非返回方式
中止（abort/未捕获运行时异常），scope 的等待不会执行，残留任务由 `dtp_sched_main` 在
main 结束时统一取消清理（最外层兜底）；跨域 handler / Domain 并行不在范围（调度器是
唯一并发路径）。

### 8.6 效应标签（库层 + 一条工具链真实路径）

用户面 API 走效应标签，handler 内部用 `@vuna@prim_eff_*` / `@vuna@host@*` 实现。

| 模块 | 标签（行条目） | 操作 | 真实 handler | mock 方式 |
| --- | --- | --- | --- | --- |
| `Base.Effect.Console` | `ConsoleOp`（实例名并进标签，如 `ConsoleOp@mock`/`ConsoleOp@real`） | `Print String` / `EPrint String` | `handleConsoleHost` → `@vuna@prim_eff_print`/`@vuna@prim_eff_eprint`（`Print` 在 result 族转 `Nat`） | 自定义 `handleConsole`（如收集日志） |
| `Base.Effect.Clock` | `ClockOp`（实例名并进标签，`Named "mock" ClockOp :: r`） | `Now`（微秒）/`SleepMicros Int` | `handleClockHost` → `effTimeUs` + **原生 `@vuna@prim_eff_sleep`** | 固定时间戳 / 忽略 sleep |
| `Base.Effect.Env` | `EnvOp`（实例名并进标签） | `GetEnv String`/`GetCwd`/`ExecPath` | `handleEnvHost` → `@vuna@prim_eff_getenv`/`@vuna@prim_eff_getcwd`/`@vuna@prim_eff_execPath` | 固定字符串 |
| `Base.Effect.Process` | `ProcessOp`（实例名并进标签） | `Args`/`Exit Int`/`RunIn String (List String)` | `handleProcessHost`（真实退出）/ `handleProcessHostWith`（自定义 onExit）/ `handleProcessHostObserved`（观察退出码） | 自定义 `handleProcess`（`Exit c` 作为操作结果） |
| `Base.Effect.Fs` | `FsOp`（实例名并进标签，如 `FsOp@mock`/`FsOp@real`） | `ReadFile`/`WriteFile`/`WriteFileAtomic`/`ReadDir`/`IsDirectory`/`MakeDir`/`RemoveFile`/`FileExists`/`FileMtime`/`FileSize` | `handleFsHost n` → `@vuna@host@try*` + 状态槽（`WriteFile`/`FileSize` 在 result 族转 `Nat`） | 自定义 `handleFs n`（纯 answer 内存表） |

 - **命名实例**：console/clock/env/process/fs 的标签都是 op 族应用（`ConsoleOp`/`FsOp`…），
  实例名并进标签（`Named "mock" FsOp` 与 `Named "real" FsOp` 是不同条目），因此同一个
  程序可以同时装 mock 与真实 handler（或两个 mock）；send/handler 用同一对 `(key, name)`
  字符串。实例名由使用方自选，同一效应族同时安装的实例名必须互不相同。fs 的 API 是带
  实例名的形态（`fsReadFile n path`、`handleFsHost n`），夹具 `dt_base/18`/`29`/`40`。
- **宿主 handler 的形态**：`handleXHost` 接受行首为对应标签的 `Eff (e :: r) a`，返回
  `Eff r (Eff [HostOp] a)`（错误收口族返回 `Eff r (Eff [Err] a)`，原语经 `hostSync` 同步执行），
  由 `joinEff` 执行；非错误族的结果行尾是宿主行 `[HostOp]`。
- **原生 sleep**：编译器原语 `@vuna@host@sleep : Int -> Eff [HostOp] Int`（微秒；运行时
  `dtp_sleep` 用 `Unix.sleepf`，阻塞睡眠；`OpNone`，核心求值不归约）。
  `Base.Effect.Clock` 的 `SleepMicros` 直接走它；探针用的 `effTimeUs` /
  `@vuna@prim_eff_sleep` 同样是宿主行类型。
- **可控 `Exit`**：`handleProcessHost` 保留真实语义（`onExit = @vuna@prim_eff_exit`，调用即
  结束进程）；`handleProcessHostWith n onExit` 让调用方替换退出行为，`handleProcessHostObserved n`
  是现成实例：`Exit c` 不退出、把 `c` 交给续延，程序继续执行。mock handler 本来就能
  观察 `Exit`。真实路径的夹具（`dt_base/30`）仍只覆盖 `Args`/`RunIn`，避免测试进程退出；
  观察路径见 `dt_base/41`。
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
  - `dt_base/26_eff_console`：同一 `prog n` 在 `ConsoleOp@mock`（mock，纯 answer 收集日志）
    与 `ConsoleOp@real`（real，`@vuna@prim_eff_print`/`@vuna@prim_eff_eprint`）下各跑一次；
  - `dt_base/27_eff_clock`：mock 固定时间 → elapsed 0；real 断言 sleep 后时间推进
    （真实 handler 走 `@vuna@prim_eff_sleep`）；
  - `dt_base/28_eff_env`：mock 与 real 对「缺失变量为空 / cwd 非空 / execPath 非空」打分；
  - `dt_base/29_eff_fs_ext`：真实 fs 读写 + 原子写 + 元数据 + 目录 + 删除（`handleFsHost "real"`）；
  - `dt_base/30_eff_process`：mock 固定 args/退出码；real 用 `@vuna@prim_eff_getArgs`（不含 argv[0]）
    与 `@vuna@prim_eff_runIn "true"`；
  - `dt_base/40_eff_fs_named`：fs 命名实例 mock（`"mock"`）/ real（`"real"`）并存对拍；
  - `dt_base/41_eff_process_exit`：`Exit` 在 mock（`"mock"`）与观察 handler（`"observed"`）下可观察、不退出；
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
  - **`Exit` 的真实语义保留**：`handleProcessHost` 仍会结束进程；「不退出」只在 mock /
    `onExit` 参数 / `handleProcessHostObserved` 下成立；
  - 入口未处理效应是类型错误（`TC_UnhandledEffects`）；运行时 `unhandled effect` 兜底
    仍服务库内部路径；行擦除、运行时字符串 key 等既有边界不变。
