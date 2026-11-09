# Layer 2/3：高阶/作用域、线性续延、调度器与 IO 标签

> 本文是 [effects.md](effects.md) §8.5/§8.6 的展开页：W6 高阶 scoped handler、
> W7 线性续延/一次性闭包/`bracket`（含 abort cleanup）、W9 单线程调度器、W10 IO 标签迁移。Layer 1
> 核心（行/`Eff`/`Member`/运行时）见 [effects.md](effects.md) §8。

### 8.5 Layer 2/3（已落地的最小实现）

**Layer 2（作用域/高阶组合）**：

- `Base.Eff.Reader.local`：先 `ask` 取外层 env，在临时 handler 中回答 Ask，再用
  `weaken` 把结果行扩宽回 `Cons e r`；外层 handler 仍在，所以 local 之后该效应仍可用。
- `Base.EffError`：`throw`/`handleError`/`runError` + `catch`。catch 在 comp 内安装临时
  Error handler；Throw 丢弃一次性续延并返回 `Result`；fallback 在 handler **之外**执行，
  因此嵌套 catch 的 fallback 抛错可被外层 catch 捕获。
- 夹具 `dt_base/20_eff_local`（877）、`21_eff_catch`（4207）。

**W6 高阶操作 / scoped handler**：

- `Base.EffExn`：`ExnOp.Try` 携带一个 `Eff` 子计算；`handleExn` 的 op handler 用
  `runEff (runExn sub)` 在**嵌套 handler** 下运行子计算，外层运行时 handler 继续处理
  子计算里的其它效应；`catchExn` 在 `tryWith` 上组合。
- `runEff` 是信任边界内的作用域运行入口，普通用户用 `runPure`/`runIOEff`。
- 夹具 `dt_base/23_eff_scoped`（107：子计算里的 Reader 由外层 handler 处理）；
  负例 `dt_err/74_try_row_mismatch`（`tryWith` 要求行首 `Exn n`）。

**Layer 3（并发/async）**：

- `Base.EffAsync`（legacy，最小 Domain 实现）：`Task`/`async`/`await`，基于 OCaml 5
  `Domain`；`async : Eff Nil a -> IO (Task a)` 要求任务体行已处理干净（效果在任务内
  处理），`await` join 对应 Domain 并返回值。运行时 `dtp_async_fork`/`dtp_async_await`
  （句柄表）；隐藏 intrinsic `prim_asyncFork`/`prim_asyncAwait`。夹具
  `dt_base/22_eff_async`（42）。它**不是** W9 的调度器实现：不参与结构化作用域，
  只允许 main 域调用。W10/W11 视迁移情况决定保留或删除。

- 负例 `dt_err/71_catch_row_mismatch`、`72_local_row_mismatch`、`73_async_row_not_nil`：
  catch/local 要求行首是对应效应，async 只接受 `Eff Nil`。

**W9 单线程 fiber 调度器（`Base.EffSched`）**：

表示与运行模型：

- **纤程 = OCaml 5 一次性续延**。每个被调度的任务体在运行时用一个自己的
  `Effect.Deep.match_with` 根 handler 执行；根 handler 只拦截**调度器私有效应**
  （`SchedYield` / `SchedAwait` / `SchedWaitScope` / `SchedWaitScopeTimeout`，均为
  `Vuna_runtime` 内部 `Effect.t` 构造子，不进语言层），把续延交给纤程外部的调度循环。
- **调度循环**在 `dtp_sched_main` 里：main 动作本身是纤程 0（生成钩子改为
  `dtp_sched_main (fun () -> v_main 0)`），循环从就绪队列取任务跑一步（运行到下一个
  挂起点或结束），再按等待关系唤醒。任务之间不共享 handler 栈：用户 `Perform` 效应
  只在任务自己的纤程里被 handler 处理。
- 调度器原语是隐藏 intrinsic `prim_sched*`（实现 `dtp_sched_*`，要求 `unsafe`，只供
  `Base.EffSched` 包装；普通用户经 `Base.EffSched` 的 API）。它们**不是行里的效应**：
  行 `Nil` 的任务也能 fork/yield/await。

API（`base/lib/Base/EffSched.vuna`）：

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
| `liftIOEff` | `IO a -> Eff r a` | 在纤程里执行 IO（信任边界；打印/文件等），任务间仍单线程 |
| `newScope` | `Eff r Scope` | 新建作用域（一般经 `withScope`） |

语义与边界：

- **协作式**：任务只在 `yieldNow`/`awaitTask`/`scopeWait*` 挂起点让出；纯计算循环
  不能被抢占（取消只在挂起点生效）。
- **取消**：`cancelTask`/`cancelScope` 给未结束任务置取消位；已挂起的任务在挂起点
  恢复并收到取消状态（`yieldNow` 返回 1、`awaitTask` 返回 `Err "cancelled"`），
  任务可跑清理后返回；未开始的任务直接取消（不执行）。取消后有 **64 步清理宽限**，
  超时后调度器硬中止该纤程（丢弃续延）。取消是**协作**语义：任务自己决定在哪些
  检查点查询取消状态并清理。bracket 与取消组合：任务在挂起点恢复后 use 正常返回时，库层 `bracket` 在带内执行 release（夹具 `dt_base/43`）；硬中止路径由调度器尽力执行 W7 cleanup 栈（无 handler 栈，只能无效应清理）。
- **结构化**：`withScope` 在 body 返回后等待 scope 内任务全部结束；
  子任务失败会取消同范围其余任务并把首个失败消息记为 scope 失败。`scopeWait` 本身只
  保证「全部结束」——子任务的取消/失败结果用 `awaitTask` 观察（`withScope` 会把未观察
  到的 scope 失败作为 `Err` 返回，避免监督信息被吞掉）。
- **超时**：W9 的超时是**调度器逻辑步数**（循环迭代次数；不依赖真实时钟/sleep）。
  `withScopeTimeout n` 表示「开始等待后的 n 个调度步内清空」；预算耗尽 → 取消范围 →
  子任务清理 → 返回 `Err "timeout"`。
- **任务行限制**：任务体必须是 `Eff Nil a`（任务内用户效应必须由任务自己的 handler
  处理干净）；不能用外层 handler 的行。负例 `dt_err/76_sched_row_not_nil`。
  需要 IO 副作用时用 `liftIOEff`（同纤程、单线程）。任务体本身可以返回任意 `a`
  （包括 `Result`）；若任务体内再用 `withScope`，`awaitTask` 得到的是嵌套
  `Result (Result …)`，由调用方显式展平（库不做隐式 flatten）。
- **句柄**：`Task`/`Scope`（legacy）不是线性数据；重复 `await` 幂等。新增线性
  `TaskLin`：`awaitTaskLin`/`cancelTaskLin` 各消费一次，二次使用在用量检查拒绝
  （夹具 `dt_base/38`、负例 `dt_err/77`）。
- **Mutex/Semaphore**：`Base.EffMutex` 用 IORef + yield 忙等；`acquire/release`、
  `newSemaphore/semWait/semSignal`；夹具 `dt_base/37`（2）。

夹具（均 `.nointerp`，只 `check` + `compile` + 运行）：

- `dt_base/42_eff_bracket_abort`：自定义 Abort handler 丢弃续延，`Base.Eff.bracket` 的 release 写入被外层 State handler 看到（4207）。
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

**边界（W9 之后仍开放）**：Mutex/Semaphore/Channel 都是 cooperative 忙等实现（无阻塞原语）；
线性 TaskLin 只保证 handle 恰好一次 await/cancel，不保证资源释放；effect-aware 并发：新增 `forkTaskWith` 用显式 handler 把 effectful task 收成 Nil
再 fork（handler 状态为任务局部）；仍无法继承父 fiber 的动态 handler 栈（D44）；
取消只在挂起点生效，硬中止会丢弃未执行清理的纤程；`withScope` 的 body 若以非返回方式
中止（abort/未捕获运行时异常），scope 的等待不会执行，残留任务由 `dtp_sched_main` 在
main 结束时统一取消清理（最外层兜底）；跨域 handler / Domain 并行不在 W9 范围；
`Base.EffAsync`（Domain）与新的调度器互不集成。

### 8.6 W10：IO 标签迁移（库层 + 一条工具链真实路径）

前提（计划 §2.3）：`IO` 保留为**运行时基座/逃逸口**（FFI、`main`、`unsafe`、未标签化
原语）；用户面 API 迁到效应标签，handler 内部用 `Base.IO` / `prim_*` 实现。W10 在**库层**
完成这层迁移；W10 收尾（`w10-io2`）补齐了原生 sleep 原语、fs 命名实例、可控 `Exit` 与
一条工具链真实路径。`IO` 内建代数、main 执行边界与编译器的 IO 类型都不变。

| 模块 | 标签（行条目） | 操作 | 真实 handler | mock 方式 |
| --- | --- | --- | --- | --- |
| `Base.EffConsole` | `Console n`（`n` 是 String 实例名，如 `"mock"`/`"real"`） | `Print String` / `EPrint String` | `handleConsoleIO` → `Base.IO.print`/`eprint` | 自定义 `handleConsole`（如收集日志） |
| `Base.EffClock` | `Clock n`（如 `"mock"`/`"real"`） | `Now`（微秒）/`SleepMicros Int` | `handleClockIO` → `Base.IO.nowMicros` + **原生 `prim_sleep`** | 固定时间戳 / 忽略 sleep |
| `Base.EffEnv` | `Env n`（如 `"mock"`/`"real"`） | `GetEnv String`/`GetCwd`/`ExecPath` | `handleEnvIO` → `Base.IO.getEnv`/`getCwd`/`execPath` | 固定字符串 |
| `Base.EffProcess` | `Process n`（如 `"mock"`/`"real"`） | `Args`/`Exit Int`/`RunIn String (List String)` | `handleProcessIO`（真实退出）/ `handleProcessIOWith`（自定义 onExit）/ `handleProcessIOObserved`（观察退出码） | 自定义 `handleProcess`（`Exit c` 作为操作结果） |
| `Base.EffFs` | `Fs n`（如 `"mock"`/`"real"`，W10 收尾起命名实例） | `ReadFile`/`WriteFile`/`WriteFileAtomic`/`ReadDir`/`IsDirectory`/`MakeDir`/`RemoveFile`/`FileExists`/`FileMtime`/`FileSize` | `handleFsIO n` → `Base.IO`/`prim_*` | 自定义 `handleFs n`（纯 answer 内存表） |

- **命名实例**：console/clock/env/process/fs 的标签都带 String 实例名参数（`Fs n`），
  行里 `Fs "mock"` 与 `Fs "real"` 是不同条目，因此同一个程序可以同时装 mock 与真实
  handler（或两个 mock）；send/handler 用同一对 `(key, name)` 字符串。实例名由使用方
  自选，同一效应族同时安装的实例名必须互不相同。fs 的早期单实例 API 已迁移
  （`fsReadFile n path`、`handleFsIO n`），夹具 `dt_base/18`/`29`/`40` 已更新。
- **IO-backed handler 的形态**：`handleXIO` 接受行首为对应标签的 `Eff (Cons e r) a`，
  返回 `Eff r (IO a)`，由 `runIOAnswer` 执行（真实 handler 的 op 解释返回 `IO` 动作）。
- **原生 sleep（W10 收尾）**：新增编译器原语 `prim_sleep : Int -> IO Int`（微秒；运行时
  `dtp_sleep` 用 `Unix.sleepf`，阻塞睡眠；能力 `clock`；`OpNone`，interp 不归约）。
  `Base.EffClock` 的 `SleepMicros` 与 `Base.IO.sleepMicros` 都已改用 `prim_sleep`
  （`spinMicros` 已删除；seed 已 rotation，旧 seed 认识 `prim_sleep`）。
- **可控 `Exit`（W10 收尾）**：`handleProcessIO` 保留真实语义（`onExit = exit`，调用即
  结束进程）；`handleProcessIOWith n onExit` 让调用方替换退出行为，`handleProcessIOObserved n`
  是现成实例：`Exit c` 不退出、把 `c` 交给续延，程序继续执行。mock handler 本来就能
  观察 `Exit`。真实路径的夹具（`dt_base/30`）仍只覆盖 `Args`/`RunIn`，避免测试进程退出；
  观察路径见 `dt_base/41`。
- **fs mock/real 并存**：`dt_base/40` 用同一个 `prog n` 在 `Fs "mock"`（纯 answer mock：固定
  内容/大小）与 `Fs "real"`（真实 IO handler，真实目录读写）下各跑一次，mock 与 real handler
  在同一程序里并存。
- **工具链真实路径（W10 收尾）**：`lib/Vuna/Cli.vuna` 的 `vuna version` 输出改走
  console 标签——`consoleLine` 用 `consolePrint "vuna"` + `handleConsoleIO "vuna"` + `runIOAnswer`，
  只在最外层 `runIO`（工具链入口仍是 `main : IO Int`）。这是工具链逐步迁移的样板，不是
  全量迁移（`lib/` 其余模块仍直接用 `Base.IO` / `runIO`）。**编译器级强制不可行**的
  具体位置：`Loader.Resolve.checkEffectsBuiltins` 只做**包级**能力声明检查（manifest），
  类型系统没有类型级能力行（F3），`IO`/`Base.IO`/`prim_*` 在任何包内都可用；编译器自身
  也在 seed 闭包里必须使用 IO（`Base.IO`、`Codegen`）。**最小下一步**：在 `vuna lint`
  增加一条模块级规则（如禁止 `lib/Vuna/**` 新增直接 `prim_*`/`Base.IO` 使用，白名单
  `Vuna.Cli.consoleLine` 一类的迁移点），而不是改类型检查器。
- **对拍夹具**（`.nointerp`，只 check + compile + run）：
  - `dt_base/26_eff_console`：同一 `prog n` 在 `Console "mock"`（mock，纯 answer 收集日志）
    与 `Console "real"`（real，`print`/`eprint`）下各跑一次；
  - `dt_base/27_eff_clock`：mock 固定时间 → elapsed 0；real 断言 sleep 后时间推进
    （真实 handler 现在走 `prim_sleep`）；
  - `dt_base/28_eff_env`：mock 与 real 对「缺失变量为空 / cwd 非空 / execPath 非空」打分；
  - `dt_base/29_eff_fs_ext`：真实 fs 读写 + 原子写 + 元数据 + 目录 + 删除（`handleFsIO "real"`）；
  - `dt_base/30_eff_process`：mock 固定 args/退出码；real 用 `prim_getArgs`（不含 argv[0]）
    与 `prim_runIn "true"`；
  - `dt_base/40_eff_fs_named`：fs 命名实例 mock（`"mock"`）/ real（`"real"`）并存对拍；
  - `dt_base/41_eff_process_exit`：`Exit` 在 mock（`"mock"`）与观察 handler（`"observed"`）下可观察、不退出；
  - 负例 `dt_err/78_eff_fs_instance_mismatch`：程序需要 `Fs "real"`、handler 处理 `Fs "mock"`
    → `TC_TypeMismatch`（实例名必须一致）；
  - 能力包夹具 `test/corpus/packages/10_prim_io`：声明 `clock` 后直调 `prim_sleep` 并断言
    真实推进时间（native sleep 的正向探针）。
- **能力**：`base` 的 `[capabilities] effects` 增加 `env`/`clock`（真实 handler 需要），
  仍是包级权限声明，不是类型级能力行。`Test/corpus` 单文件夹具包仍**不声明**能力，
  直接原语探针放在 `packages/` 里（沿用既有约定）。
- **边界**（见 debt D43）：
  - **库层迁移**：没有编译器强制「只能用标签」；`IO`、`Base.IO`、`prim_*` 仍可被包直接
    使用；工具链只迁了一条真实路径（`vuna version`），编译器不迁移；
  - **`Exit` 的真实语义保留**：`handleProcessIO` 仍会结束进程；「不退出」只在 mock /
    `onExit` 参数 / `handleProcessIOObserved` 下成立；
  - 未处理效应诊断仍是通用异常文本；行擦除、运行时字符串 key 等既有边界不变。
