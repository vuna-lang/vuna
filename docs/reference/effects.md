# 效应：Eff 统一动作、handler 与宿主层

**现状**：用户面唯一动作类型是 `Eff r a`（`Base.Eff`，构造子不导出；`MkEff` 是内部表示），
入口是 `main : Eff [] a`（行必须为 `Nil`），执行入口是 `Base.Eff.runPure`。宿主原语只剩
`prim_eff_*`（`Eff []`）；宿主层就是直接调用这些原语（原宿主别名模块已删除，任何包都可直调），
Int/Nat 归一化只留在 `Base.Eff.*` handler 的 result 族（`Print`、`WriteFile`/`FileSize` 返回
`Nat`，直接调用原语得到 `Int`）。所有宿主 handler 的 answer 是 `Eff []`，入口组合是
`runX = joinEff (handleXHost …)`。用户面
执行一个已处理干净的动作用 `runPure`；`IORef` 的实现也是 `Eff []`。

运行时效应核心已落地（§8）：OCaml 5 一次性 delimited continuations + 开放行 + 命名实例 +
一阶效应（`Base.Eff` / Reader / State / Fs / Console / Clock / Env / Process / Stdin /
Args / Exit）；`Member` 行约束、`local`/`catch`/scoped `Exn`、线性续延与一次性闭包
（`mkCont`/`resumeCont`）、通用 `bracket`（含非 `Exn` abort cleanup）、单线程 fiber
调度器（`Base.EffSched`：`forkTask`/`awaitTask`/`yieldNow`/`cancelTask`/`cancelScope`/
结构化 `withScope` + 步数超时）均已落地。学习路径：写程序看 §2–§3；表示层看 §5；
运行时核心看 §8。

## 1. 范围

- **本页覆盖**：`Eff` 统一动作的表示/执行、handler 与 `Eff []` answer、宿主层（直接调用 `prim_eff_*`）、
  宿主层直调纪律、通用 Eff 的边界。
- **不覆盖**：原语/宿主层的逐条语义（[primitives.md](primitives.md) §7）；纯效应 monad
  （`Base.State` / `Reader` / `Error`，它们不碰宿主，见 [stdlib.md](stdlib.md)）；
  并行/多核与 Domain 内存模型（只有单线程调度器，见 §8.5）；完整 QTT。

## 2. 动作类型与宿主层（当前实现）

### 2.1 身份与表示

| 项 | 值 |
| --- | --- |
| 用户面动作类型 | `Eff : Row -> Type -> Type`（`Base.Eff` 的 data；行是 Type-1 擦除索引） |
| 表示 | 装箱 data：`MkEff : (EffUnit -> a) -> Eff r a`；`MkEff` 不导出，用户经 `pure`/`do`/`>>=`/handler 构造与消解 |
| main 入口 | `main : Eff [] a`；钩子 `dtp_sched_main (fun () -> Base.Eff.runPure v_main)` |
| 执行 | `runPure : Eff [] a -> a`（行必须 Nil；运行时 `runThunk` 应用 dummy 令牌） |
| 行 | `Row` / `Cons` / `Nil` + `Member`；handler 用 `rowRem` 删行，运行时按 `(key, name)` 路由 |

- `main : Eff [] a` 的**行检查在类型期**：entry 处仍有未处理行报
  `TC_UnhandledEffects`；`vuna interp` 遇到动作入口报
  `[CG_InterpCannotExecuteEffects]`（纯核心求值器只跑纯 main）。
- `Eff []` 不表示「无副作用」：它表示「无未处理的行效应」；宿主层构造的叶子里可以
  有真实宿主操作。宿主副作用**不再由 manifest 能力/特权门控**把关；用户面应经
  `Base.Eff.*` 标签 + handler 使用效果（纪律/文档约定，见 §8.6）。
- **阶段 0–4（已完成）**：`IEffRow`/`IRowCons`/`IGlobal` 行 IType、隐藏
  `Base.Eff.runMain`、`rowAppend` 行拼接与 `joinEff` 泛化、`builtinEffects` 表、entry
  按 main 行自动嵌套 `runXHost`；Console/Fs/Clock/Env/Process/Exit/Stdin/Args 有带行
  handler，Ref/Net 直调带行原语（`beRunHost=""`）；夹具 90–94。`runPure` 仍只收 Nil
  （纯性负例：`runPure (consolePrint ...)` → `TC_UnhandledEffects`）。
- **阶段 5 迁移策略（未开始）**：编译器/工具链仍用 1089 处 `Eff []`（`compiler/lib`
  47+ 模块 + `lib` 工具链 + 两个 `main`），它们都是真实 IO。迁移按批：
  ① 引入行别名 `Base.HostRow.hostRow`（一个 `Row` 值，便于签名书写），先迁两个入口
  （`app/Main`、`compiler/app/Main` → `Eff [ArgsOp, ExitOp]`），内部模块暂用
  `raise : Eff [] a -> Eff r a` 桥接；
  ② 按模块把 IO 叶子改成带行（`Files`/`Host` 调用点），每批 `vuna check .` + 相关夹具 +
  rotation；
  ③ Sched 随 `Vuna.Compiler.Query.Run` 的并行波次一起带行（`forkTask` 的子计算行与父体一致）；
  ④ 最后删旧 `prim_eff_*`/旧 `handleXHost`，把宿主原语改 `@vuna@` 隐藏，并改写
  eff-boundary 守卫（从「数 `runPure`」改为「禁止宿主原语出现在公开面」）。
  规模决定它是独立批次：不要与语言/类型改动混做，也不要试图一次性改完。

### 2.2 四层边界（当前）

| 层 | 类型/入口 | 说明 |
| --- | --- | --- |
| 用户面 | `Eff r a` + `Base.Eff.*` 标签/handler | 用户包与 ad-hoc 的唯一动作类型；`main : Eff [] a` |
| handler 层 | `handleXHost` → `Eff r (Eff [] a)`，`runX = joinEff …` | 宿主 handler 的 answer 是已处理干净的 `Eff []` 动作；`joinEff` 展平 |
| 宿主层 | `prim_eff_*`（外加 `effTimeUs`） | 直接调用即得 `Eff []` 动作；任何包都可直调；Int/Nat 归一化只在 Eff handler 的 result 族；不再有 manifest 能力/信任门控 |

- **代数**：`Monad (Eff r)` / `Applicative` / `Functor` 实例已内建；用户用 `pure` / `do` /
  `>>=` / `fmap`，动作的构造入口只有这些实例方法。
- **宿主层边界（manifest 门控已删除）**：`vuna.toml` 不再有 `[capabilities]` / `[trust]` /
  `[privileged]`；任何包（用户包、ad-hoc 文件）都可以直接调用
  `prim_*` / `prim_eff_*`（`Eff []` 叶子）。用户面**应**经 `Base.Eff.*` 标签 + handler 使用
  效果——这是纪律/文档约定，不是编译器强制。`prim_*` / `prim_eff_*` 是宿主层/底层原语，
  base 的 Eff handler、编译器与根工具链内部仍直接使用它们。旧门控与相关诊断码（`PKG_NonPrivileged`、
  `LD_HostModulePrivileged`、`RN_UnknownCapability`、`PKG_EffectCapabilityRequired` 等）已
  删除，历史见 git；显式接受的损失与后续方向见 §8.6。
- **错误报告**：没有异常 / handler 层之外的语言级异常；未捕获的宿主异常由生成的 main 钩子
  统一报告为 `vuna: runtime error: ...` + 位置帧 + exit 2（见 [debugging.md](debugging.md)）。
  `dbg!` / `dbgShow` / `assert` / `todo` 是语言级调试构造，不参与效应系统。

## 3. 历史效应栈（已删除）

`Base.Effect`（`MonadIO`）、`Base.StateT` / `Base.ReaderT` / `Base.ErrorT` 与
`Base.EffAsync` 已删除：状态 / 环境 / 错误改用 `Base.EffState` / `Base.Eff.Reader` /
`Base.EffError`（+ `Base.EffExn`），并发改用 `Base.EffSched`。旧实现的树形语义与边界见
git 历史；QTT 的 `D32`（transformer 无法泛化到任意 monad）随实现删除而关闭。

## 4. 局部可变与 region（已删除）

`Base.ST`（region 隔离的局部可变、`ST r a` / `Ref` / `SArray`）随未使用代码清理删除：
生产代码零使用，夹具一并移除。语言仍保留 `linear record` / `linear data` 与 QTT 规则；
局部可变的重建约束见 [debt.md](debt.md)（D22 与新增条目）。

## 5. D27 表示轴：不透明擦除值（已落地的最小实现）

## 5. D27 表示轴：不透明擦除值（已落地的最小实现）

目标设计是**签名索引的效应 monad**：
`Eff (f : Type) (res : f -> Type) (ans : Type) (a : Type)`，op 是 `f` 的值、每个 op 的
结果类型由 `res` 族给出，handler 是深代数 `(op : f) -> (res op -> ans) -> ans`。

早期的候选路线曾卡在**擦除后端**，不在类型检查——CPS 版生成的
`.ml` 里续延域 `res op` 被渲染成 `unit`，而 handler 里的续延是 `int -> …` →
`ocamlopt` 类型错误（`C_Eff_MkEff of ((('a2) -> 'a1) -> (('a0) -> ((unit) -> 'a1) -> 'a1) -> 'a1)`）。

**D27 表示轴的最小实现**：采用 §6 的路线 2「后端不透明擦除值」，异构结果类型的
CPS `Eff` 已经可 `check` + `compile` + 运行，且 interp 与产物逐字节一致（夹具
`test/corpus/dt/82_eff_cps.vuna` / `83_eff_cps_two_instances.vuna` /
`84_eff_cps_result.vuna`）：

| 位置 | 表示 | 机制 |
| --- | --- | --- |
| data 构造子字段（声明位置） | `Obj.t` | 字段类型里出现「不可命名的运行时类型」时，整个字段渲染成不透明值 |
| 构造子实参 | `(Obj.magic arg)` | `Codegen.Term` 按 `ctorOpaqueFlagsOf` 的 kept 位置插入 |
| binder 使用（表达式位置） | `prim_erase`（隐藏 intrinsic，运行时 `%identity`） | 精化器在每个使用点包 cast；求值期 `OpIdentity` / `applyValueFuel` 直接消去 |

**判据（elab 与 codegen 同源，`Elab.Meta.valueOpaqueScoped`）**：运行时类型不可命名 ⇔
类型头不可表示：
- 全局类型头既不是数据族、也不是 `Int` / `String` / `Array` / `IORef`
  （即类型族定义 / axiom / 未知全局）；
- 或**类型族参数**：kind 的 Pi 链里出现非宇宙域（`res : f -> Type`；`m : Type -> Type`
  这类普通类型构造子参数**不算**，所以字典方法字段 / base 泛型代码不受影响）；
- 数据族的**索引值实参**（`Vec (Succ n) a` 的 `Succ n`）是擦除后的索引，不参与判定；
- 已知边界：精化期未解的元变量按可表示处理（可能漏 cast，见 D27 残留）；trait 自动
  生成的 λ（方法投影 / 实例 tele）不在插入点覆盖范围内。

**注意这不是 QTT 能解决的**：续延是**真的运行时函数**（要被 handler 以真实值调用），
`res op` 是类型级、按擦除纪律 0 用量、在 OCaml 里不可命名；QTT 只把 0/1/ω 用量写精确，
不会让 OCaml 写出 `res op` 的静态类型。表示轴用「不透明值 + 恒等 cast」绕开它。

**结论**：D27 的表示层阻塞已消除；剩余边界见 §9 与 [debt.md](debt.md)。

## 6. 通用效应系统的三条路线

| 路线 | 解决什么 | 不解决 / 代价 |
| --- | --- | --- |
| **完整 QTT**（依赖 multiplicity、线性/唯一） | 线性 record 的「句柄不复制/恰好用一次」、一次性续延（取消/超时）、线性世界令牌 | **不解决**擦除依赖续延的运行时表示（§5）；类型理论 + 编译器 + base + 语法面全量改动，独立阶段 |
| **后端不透明擦除值**（`Obj.t` 类 + codegen 转换/cast） | 让 `res op` 这类「擦除依赖」位置有统一运行时表示，通用 `Eff` 才可编译 | **最小实现已落地（§5）**：声明位置 `Obj.t`、表达式位置恒等 cast；残留边界见 D27 |
| **运行时类型码**（Tarski `Ty`/`Tm` 上移为通用机制） | 显式携带类型信息，彻底绕开「不可命名」 | 语言层引入 type codes（当前明确不在终态）、运行时开销、与擦除判据整合 |

- 三者不是互斥：QTT 解决**作用/线性**轴，后两者解决**表示**轴。
- 顺序：「表示」轴的最小实现（不透明擦除值）已落地，再用
  QTT 收线性/一次性；两者的残余边界清完后，才轮到用户级 `Eff` 与自定义效应。

## 7. 设计规则（已实现部分）

1. **Eff 是唯一动作类型 + 内建代数**：`pure`/`do`/`>>=` 来自 `Functor`/`Applicative`/`Monad (Eff r)` 实例；
   用户面动作由实例方法构造；`joinEff` 展平 handler answer，`runPure` 执行。
2. **handler 是解释器**：`runPure` 是唯一的执行入口；`runConsole` / `runFs` 等是
   handler（answer 为 `Eff []`，由 `joinEff` 组装），本身不执行动作；没有「隐式生效的
   handler 栈」。
3. **可变数据边界**：`IORef` 的公开操作与实现都是 `Eff []`；局部可变的 region 形式
   已随 ST 删除（重建约束见 [debt.md](debt.md)）。
4. **宿主层是底层原语面，不是类型豁免**：`prim_effectPerform` / `prim_effectHandle` /
   cleanup/sched 是宿主层原语，常规用户面经 `Base.Eff.*` 标签 + handler 使用效果；不再有
   `unsafe` 能力位或 `[trust]` 定义级清单（机制已删除，历史见 git）。
5. **效应组合显式**：transformer 的 handler 必须显式调用；没有自动 lift 到任意深度。
6. **不透明擦除值的表示与 cast 由同一份判据驱动**：`Elab.Meta.valueOpaqueScoped` 与
   `Codegen.Decl` 的 `isTypeHeadOpaqueDatas` / `ctorOpaqueFlagsOf` 必须同步；
   `Obj.t` 字段 ↔ `prim_erase` / `Obj.magic` 两侧缺一就会在 `ocamlopt` 处错配。
7. **cast 对语义透明**：`prim_erase` 求值期归约为实参本身（`OpIdentity` +
   `applyValueFuel` 的恒等消去），对定义性相等 / 正规化 / interp 不可见；用量检查里
   cast 应用记 `Rig1`，不放大线性值的使用。

## 8. 运行时效应核心

**OCaml 5 运行时续延 +
开放行 + 命名实例 + 一阶效应**。它不使用 CPS 编码，`Eff` 只是抽象动作；控制由
`Effect.Deep` 捕获。

### 8.1 表示

- `Row` 是 Type-1 数据，存放**效应标签类型**（`Cons : String -> Type -> Row -> Row`：实例名 + 标签 + 尾行）；
- **列表字面量通用展开**：parser 把 `[]` / `[e1, e2]` 解析成保留名
  `@vuna@list@nil` / `@vuna@list@cons`（不是构造子名字解析）；精化器按**期望族**的短名
  `Nil`/`Cons` 展开，期望族未知时默认 `Base.List.List`。因此在**期望 kind 为 `Row`** 的
  位置 `[Fetch]` 展开为 `Cons "default" Fetch Nil`（裸标签补默认名），`[]` 展开为
  `Base.Eff.Row.Nil`；`Vec n a` / 用户自定义的 `Nil`/`Cons` 族同样适用。模式
  `[]` / `[a, b]` 按 scrutinee 族逐层展开（`Elab/Term/Impl` 的
  `listLitElems`/`expandListLit` 与模式解析器），parser/AST 不需要区分类型/项位置。
  夹具 `dt_base/45_eff_row_sugar`、`dt_base/54_list_literal_families`。
  行只是擦除索引，不进入运行时值。
- **标签 = op 族应用**（D2）：`ConsoleOp`、`StateOp Nat`、`ReaderOp Int`、`FsOp`…；
  没有闭合的 `data EffectLabel`，新增效应不需要改中央表。`Exn` 是无参标记类型。
- **实例名是 Row 里的 String**：行条目 `Cons "counter" (ReaderOp Int) rest`；
  运行时按 `(key, name)` 的字符串相等找 handler。库不定义固定实例名枚举，使用方自选名字
  （同一效应族同时安装的实例名必须互不相同）。裸标签 = 默认名 `"default"`；显式名用
  `[Op]` 或 `Cons n Op r`。
- `Eff r a` 构造子不导出；内部是私有 dummy thunk（`EffUnit -> a`），
  **没有世界令牌**；dummy 只为延迟执行。
- `Member n e r` 是 Type-1 归纳族（`Here`/`There`），effect wrapper 用隐式证明参数；
  精化器按行结构构造证明（定义级 ctx 收尾）。
- `rowRem : Type -> Row -> Row` 去掉一个标签；它不是类型族，由编译器按标签类型值
  结构相等归约（重复绑定名/非线性格不受支持：parser 直接报 `PS_RepeatedPatternBinder`，
  见 language.md）。归约前对 name/label 做一次 `force`：解表不改写已构造好的 value，
  已解 meta 在结果行里仍是 `VMeta` 节点（`handle` 语法依赖这条才让结果行归约掉）。

### 8.2 运行时

- `Vuna_runtime` 声明 `type _ Effect.t += Perform : string * string * Obj.t -> Obj.t Effect.t`。
- 隐藏 intrinsic `prim_effectPerform` / `prim_effectHandle`（宿主层原语，常规只由
  `Base.Eff` 包装使用；不再有 `unsafe` 门控）：
  - `perform` → `Effect.perform`；
  - `handle` → `Vuna_runtime.dtp_effect_handle`：`Effect.Deep.match_with`，按
    `(key, name)` 过滤；不匹配返回 `None` 交给外层 handler；`retc` 应用 handler 的
    `ret`；`continue` 一次。handler 退出（正常 / 异常 / abort 丢弃续延）时执行该
    extent 内未弹出的 bracket cleanup。
- W7 的 cleanup 机制：`prim_cleanupPush` / `prim_cleanupPop`（隐藏）登记/
  弹出每纤程 cleanup 栈（`dtp_cleanup_*`）；`Base.Eff.bracket`/`finally` 用它保证
  非 `Exn` abort 也跑 release（细节见 [effects-layers.md](effects-layers.md) §8.5）。
- 语义是**一次性（one-shot）**：resume 两次抛 `Continuation_already_resumed`；
  多射续延不做。
- 未处理的 `Perform` 由 `main` 钩子的异常报告器兜底（`vuna: runtime error: ...`）。
- `vuna interp` 是纯求值器，不执行运行时效应；效果程序只能 `check` + `compile` + run
  （夹具带 `.nointerp`）。

### 8.3 已落地的模块

| 模块 | 内容 |
| --- | --- |
| `Base.Eff` | `Row(..)`、`Eff`、`Member(..)`/`rowRem`、内建 `Functor`/`Applicative`/`Monad (Eff r)`（`do`/`>>=`/`>>`，不提供 `bindEff`/`pureEff`）、`sendCore`/`handleCore`/`handleCoreLin`、`handleWith`/`handleWithAt` + `ResFn(..)`/`resFn`/`resOf`（`handle` 语法的两个降级目标：handler 类型显式、结果族作擦除量；行首条目版用于 comp 行未具体化）、`Cont`/`mkCont`/`resumeCont`、`bracket`/`finally`、`weaken`、`joinEff`/`raise`、`runPure` |
| `Base.Eff.Reader` | `ReaderOp s` + `Ask`；`ask`/`handleReader`；实例名在行条目（`Cons "counter" (ReaderOp Int) r`） |
| `Base.EffState` | `StateOp s` + `Get`/`Put`；`get`/`put`/`handleState`（answer `s -> Pair a s` 线程状态） |
| `Base.EffFs` | 宿主-backed Fs 效应（完整 fs 面；标签 `FsOp`，实例名在行条目，如 `Cons "real" FsOp r`）：`ReadFile`/`WriteFile`/`WriteFileAtomic`/`ReadDir`/`IsDirectory`/`MakeDir`/`RemoveFile`/`FileExists`/`FileMtime`/`FileSize` + `resFs`；`fsReadFile n`/`fsWriteFile n`/…/`handleFs n`（泛型）/`handleFsHost n`（answer `Eff []`，`runFs = joinEff ∘ handleFsHost`）；真实 handler 直接调用对应 `prim_eff_*`（`WriteFile`/`FileSize` 在 result 族转 `Nat`）。mock/real 可并存（`dt_base/40`） |
| `Base.EffConsole` | W10 console 标签 `ConsoleOp`（实例名在行条目，如 `ConsoleOp@mock`/`ConsoleOp@real`）：`Print`/`EPrint`；`consolePrint`/`consoleEprint`/`handleConsole`/`handleConsoleHost`（真实 handler 用 `prim_eff_print`/`prim_eff_eprint`，`Print` 在 result 族转 `Nat`） |
| `Base.EffClock` | W10 clock 标签 `ClockOp`：`Now`（微秒时间戳）/`SleepMicros`；`clockNow`/`clockSleepMicros`/`handleClock`/`handleClockHost`（真实 handler 用 `effTimeUs` 与编译器原生 `prim_eff_sleep`） |
| `Base.EffEnv` | W10 env 标签 `EnvOp`：`GetEnv`/`GetCwd`/`ExecPath`；`envGetEnv`/`envGetCwd`/`envExecPath`/`handleEnv`/`handleEnvHost`（真实 handler 用 `prim_eff_getenv`/`prim_eff_getcwd`/`prim_eff_execPath`） |
| `Base.EffProcess` | W10 process 标签 `ProcessOp`：`Args`/`Exit`/`RunIn`；`processArgs`/`processExit`/`processRunIn`/`handleProcess`/`handleProcessHost`（真实 handler 用 `prim_eff_getArgs`/`prim_eff_exit`/`prim_eff_runIn`）/`handleProcessHostWith`（自定义 `onExit`）/`handleProcessHostObserved`（`Exit` 可观察、不退出） |
| `Base.EffError` | `ErrorOp` + `throw`/`handleError`/`runError`/`catch`（L2 作用域 catch） |
| `Base.EffExn` | W6 高阶 scoped Error：标签为无参标记 `Exn`，`ExnOp` 的 `Try` 携带子计算；`tryWith`/`runExn`/`catchExn`/`bracketExn` |
| `Base.EffMutex` | W9 Mutex/Semaphore（IORef + yield 忙等）：`acquire`/`release`/`semWait`/`semSignal` |
| `Base.EffChannel` | W9 cooperative Channel：`send`/`tryRecv`/`recvWait` |
| `Base.EffSched` | W9 单线程 fiber 调度器（L3）：`Task`/`Scope`/`TaskLin` + `forkTask`/`forkTaskWith`/`forkTaskLin`/`awaitTask`/`awaitTaskLin`/`yieldNow`/`cancelTask`/`cancelTaskLin`/`cancelScope`/`scopeWait`/`scopeWaitTimeout`/`withScope`/`withScopeTimeout`/`isCancelled`/`raise`；任务行 `Nil`，超时按逻辑步数 |

夹具：`dt_base/16`（两个 Reader 实例嵌套 handler）、`17`（State 状态线程）、
`18`（宿主-backed Fs 真实读写，实例名 `"real"`）、`20–21`（local/catch）、`23`
（scoped handler）、`24–25`（线性续延 / bracketExn）、`26–30`（mock↔real 对拍）、
`31–36`（调度器：fork/await、取消、超时、监督、重复 await、Channel）、`37–39`
（Mutex、线性 TaskLin、effect-aware forkTaskWith）、`40–41`（fs 命名实例 /
process 可控 Exit）、`42–44`（通用 bracket abort cleanup、调度器 bracket、一次性闭包）、`45`（行语法糖）；
负例 `dt_err/70–81`；原语探针夹具 `packages/10_prim_io`（`prim_eff_sleep`）。
细节见 §8.6 与 [effects-layers.md](effects-layers.md)。
### 8.4 已知边界（下一步）

- **W3 行成员约束已落地**：`Base.Eff.Member` 是 Type-1 归纳族，effect wrapper 带隐式
  `{w : Member n e r}`；精化器在应用处按行结构构造 `Here`/`There`，无法当场判定的目标
  延迟到**定义体结束**、用定义级 ctx 收尾（可命中 wrapper 的局部证明 binder），缺效应
  报 `TC_NoInstanceFound`（负例 `dt_err/70_effect_missing`）。
  不走 trait 重叠实例（trait 版 `Member` 需要头可合一的重叠实例，已决定不计划；
  行成员约束也不需要它）；`sendCore`/
  `handleCore` 本身不带证明，属于信任边界内的核心原语。
- **自动行 lift**：`checkByInferFuel` 在 conv 失配时调用独立 `tryEffLift`：
  期望形如 `Eff (Cons e tail) a`、实际结果行与 `tail` 相等时，直接合成
  `Base.Eff.weaken {e}{r}{a}` 应用（不 re-check，避免与 `checkByInferFuel` 形成 SCT
  互递归）；`weaken` 不在作用域或期望是 `Eff []` 时不触发（后者仍报 `TC_UnhandledEffects`）。
  夹具 `dt_base/72_eff_auto_lift`。剩余：只在 check 方向；不会自动重排/合并行。
- **行删除的表示层修复**：`rowRem` 改成公理 + 编译器按标签类型值结构相等归约；
  不能写成类型族（重复绑定名的模式会被 parser 以 `PS_RepeatedPatternBinder` 拒绝，
  见 language.md）。归约前对 name/label（含 label 一层 spine 实参）先 `force`，
  让已解 meta 参与比较；未解 meta 仍卡住（`Core/Eval.rowRemReduce`）。
- **`Monad (Eff r)` 已内建**：`Base.Eff` 声明 `instance Monad (Eff r)`，实例方法直接构造
  私有 `MkEff`（实例 tele `r : Row` 由 `Eff` 构造子 kind 推断）；import `Base.Eff` 后可直接用
  `do` / `>>=` / `>>`，不提供 `bindEff` / `pureEff` 专用组合子。`do` 在行 `r` 上单子化，
  handler 仍显式解释；纯行用 `runPure` 收尾（夹具 `dt_base/19_eff_monad` 覆盖
  `do`/`>>=`/`>>`/`bind`）。行多态实现（`bracket`/`withScope`）同样用 `do`：延迟字典目标
  在 `resolveRowGoalsCtx`（带 ctx 的收尾点）里、行成员解出后重新搜索实例，因此静态字典
  在定义体结束时即可求出（见 type-system.md「延迟字典目标」）。
- **长 do 链**：S1 把程序级字典目标求解改成单趟 worklist（`Dict.resolveDictGoals` 每个目标
  每趟只处理一次），指数已消除：20 步纯 `Eff []` do 约 100ms、10 层 `Result >>=` 约 77ms、
  20 层 `>>=` 约 77ms（`test/corpus/elab_perf/` 夹具）。期望结果类型定向已由 S2 落地（前导隐式前缀后 early solve 残余结果）；do 块已按块共享
  一个 monad/字典（S3b）。S2 已删除 `andThen`；编译器内部改用限定 `Common.bind`
  （固定类型的内部选择，不是兼容层）。
  行多态 `Eff r` 的 `do` 不受影响。
- **一阶效应核**：普通 send op 不含子计算；W6 通过 `Base.EffExn.Try` 支持携带子计算，
  `bracketExn` 提供 Exn 路径的 cleanup；W7 的通用 `Base.Eff.bracket`/`finally` 用运行时
  cleanup 栈覆盖**任意效应 abort**（handler 丢弃续延），见 §8.5 与 effects-layers.md。
- **并发/async**：W9 单线程调度器已落地（`Base.EffSched`，见 §8.5）：协作式
  `forkTask`/`awaitTask`/`yieldNow`、取消（含清理宽限）、结构化 `withScope`、步数超时；
  并行/多核（Domain）仍不是本层目标；旧 Domain 实现（`Base.EffAsync`）已删除。
- **未处理效应诊断**：入口已在类型层收紧——`runPure : Eff [] a -> a`；
  `load` 处 `joinEff`/`runPure` 要求行 `Nil`，因此入口处的未处理效应是**类型错误**，并报专门的
  `TC_UnhandledEffects`（列出具体标签，P1c；负例 `dt_err/82_unhandled_effect_entry`）。
  运行时兜底仍保留：main 钩子识别 `Effect.Unhandled (Perform (key,name,_))`，报告
  `unhandled effect key (instance name)`（`name` 是 String 实例名；`test/corpus/run_err/04_unhandled_effect`）；任务内
  的未处理效应经 `awaitTask` 的 `Err` 返回同一条消息。剩余：`runEff` 内部信任入口
  （库内路径）仍接受任意行。

### 8.5 Layer 2/3（展开）

W6 高阶/作用域、W7 线性续延/一次性闭包/`bracket`、W9 单线程调度器与 W10 效应标签
迁移详见 [effects-layers.md](effects-layers.md)。核心边界：W6 `Try` 子计算 + scoped
handler；W7 `Cont` resume-once（`mkCont`）+ `bracket` 的 abort cleanup；W9
fork/await/yield/cancel/结构化 scope；W10 console/clock/env/process/fs 标签（库层）。

### 8.6 效果进类型

把已落地的库级行编码变成**编译器协议 + 用户面
约束**。仍然有效的边界决策：不做类型级能力行（行只描述、不授权，边界靠约定：宿主层
对任何包可见，用户面经 handler）；续延保持一次性（one-shot）。
已落地：

- **协议集中（D3）**：编译器原先散落在 `Core/Eval`、`Elab/Dict` 的
  `Base.Eff.{Row,Nil,Cons,Member,Here,There,rowRem}` 硬编码名字，集中到
  `Vuna.Compiler.Intrinsics` 的效果协议常量（`effRowFamilyName` 等）；行删除归约与
  `Member` 证明构造只引用常量。
- **入口收紧**：`runPure : Eff [] a -> a`（行必须 `Nil`）——入口处的未处理效应是类型错误
  （负例 `dt_err/82_unhandled_effect_entry`），运行时 `unhandled effect` 兜底只服务
  库内部路径。
- **专门诊断（P1c）**：`Elab/Term/Impl.checkByInferFuel` 在「期望行 `Nil`、实际行具体
  非空」时改报 `TC_UnhandledEffects` 并列出标签；不再只是裸 `TC_TypeMismatch`。
- **宿主层门控已删除（显式接受的损失）**：`[capabilities]` / `[trust]` / `[privileged]`
  与宿主模块 import 门控整体删除——任何包（用户包、ad-hoc 文件）都可以
  直调 `prim_*` / `prim_eff_*`；没有每包原语白名单、`unsafe` 定义级审计，也没有
  REPL `--privileged`。用户面仍**应**经 `Base.Eff.*` 标签 + handler（`runX =
  joinEff (handleXHost …)`）；这是纪律/文档约定，不是强制门控。后续用表示层权限
  （N2/N3）或新模型补；历史与旧诊断码（`PKG_NonPrivileged`、`LD_HostModulePrivileged`、
  `RN_UnknownCapability`、`PKG_EffectCapabilityRequired` 等）见 git。
- **base 宿主层直接使用点（只读说明，原 `[trust] unsafe` 清单）**：13 个真实使用点——
  `Base.Eff.sendCore`、`Base.Eff.handleCore`、`Base.Eff.bracket`、
  `Base.EffSched.yieldNow`、`Base.EffSched.isCancelled`、`Base.EffSched.newScope`、
  `Base.EffSched.forkTask`、`Base.EffSched.awaitTask`、`Base.EffSched.cancelTask`、
  `Base.EffSched.cancelScope`、`Base.EffSched.scopeWait`、`Base.EffSched.scopeWaitTimeout`、
  `Base.EffSched.forkTaskLin`。
  机制删除后这份清单不再是强制约束，只作安全审计参考。
- **单效应组合子与自动 lift**：`runConsole`/`runFs`/`runEnv`/`runClock`/`runProcess`
  组合子；check 方向的自动 lift 见 §8.4（`tryEffLift`）。

剩余：高阶效应类型（见 §10 非目标）。语言级 `perform`/`handle` 语法已落地
（`Base.Eff.performCore` / `handleWith`/`handleWithAt`；参数化 op 族 State/Reader 两种
语法都支持，`handle` 的语法与边界见 [native-effects.md](native-effects.md)）。

## 9. 债务映射

| debt | 内容 | 归属 |
| --- | --- | --- |
| D22 | 线性捕获规则与一次性闭包（`Base.Eff.Cont`/`mkCont`）已有；剩余：multiplicity 多态/依赖 multiplicity、通用线性箭头类型。线性值经 ω 形参通用函数被拒（库 API 需显式 `(1 x : …)`）是同一根因 | 后续 |
| D27 | 表示轴已落地（§5）：CPS `Eff` 的 `res op` 用不透明值 + 恒等 cast 编译；残留：精化期未解 meta 的漏 cast 边界、trait 自动生成 λ 的插入点未覆盖、以及用户级 `Eff` API / 行 / 重排（D03） | 后续 |
| D32 | transformer 无任意 monad 泛化（隐式参数 kind 推断缺口，§3.2） | 后续 |
| D37 | 运行时效应的剩余缺口：高阶 scoped handler、线性续延/一次性闭包/`bracket`（含 abort cleanup）、单线程调度器、未处理效应诊断均已落地；Layer 3 扩展见 D41/D44 | `Base/Eff*`；§8.4 | 后续 |
| D41 | 已落地面：scoped handler、线性续延/一次性闭包/通用 `bracket`（abort cleanup）、`Base.EffSched`（单线程调度器，含 Mutex/Channel/线性 TaskLin/forkTaskWith）；剩余：Domain 并行、父 fiber handler 继承 | §8.5；D44 | 后续 |
| D44 | 调度器边界：取消只在挂起点生效、清理有 64 步宽限后硬中止；Task/Scope legacy 可复制；TaskLin 恰好一次 await/cancel；Mutex/Semaphore/Channel 均为 cooperative 忙等；超时是逻辑步数；任务体只能 `Eff Nil a`（forkTaskWith 显式 handler，但无法继承父 fiber handler 栈） | `Base.EffSched`、`Codegen/Term.vuna`（`dtSchedRuntime`）、`Intrinsics.vuna`（`prim_sched*`） | 后续 |

## 10. 非目标（明确不做）

- 多射续延（N1 的 `perform`/`handle` 已落地但只有 one-shot 续延；`Cont` 的线性类型化留
  N3/N4，见 [native-effects.md](native-effects.md)）；高阶效应类型（当前 `catch`/`local`/
  `bracket`/scoped `Exn` 是库层 + 行约束的组合）：**作用域/高阶 op 族（Exn，op 携带 Row）
  不能写 `handle` 块**，只能用手写 handler（`TC_HandleFamilyUnsupported`，D54）；
  自动 lift 只在 check 方向（`tryEffLift`，见 §8.4）。
- 高阶/作用域、一次性闭包与单线程调度器已落地；完整线性箭头、Domain 并行、父 fiber handler 继承仍属后续（见 D41/D44/D22）。
- 高阶/作用域效应的**类型系统**（当前 `catch`/`local`/`bracket`/scoped `Exn` 是库层 + 行约束的组合，未做语言级高阶效应类型）。
- 网络/服务端框架；只有最小 `async`/`await`（Domain，legacy）。
- 类型级能力行（`Eff [caps] r a`）。
- 并行/多核（OCaml `Domain` 并行、内存模型）：只有**单线程**调度器；通道/互斥量等
  并发数据结构、网络/服务端框架不在本阶段。

## 相关阅读

- 标准库模块：[stdlib.md](stdlib.md)；量化/线性规则：[qtt.md](qtt.md)
- 原语与宿主层（`prim_*`、效果原语）：[primitives.md](primitives.md) §7
- 记录 / trait / `do` 与 `Monad`：[records-traits.md](records-traits.md)
- 类型系统（擦除判据、宇宙）：[type-system.md](type-system.md)；Core 实现：[core.md](core.md)
- 自举与 rotation：[bootstrap.md](bootstrap.md)；测试标签：[testing.md](testing.md)

- Layer 2/3 展开：[effects-layers.md](effects-layers.md)
- Native effects（效应系统内建化：perform/handle 语法、效应行求解内建、双形状过渡与
  实施状态）：[native-effects.md](native-effects.md)
