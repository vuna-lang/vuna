# 效应：IO 内建效应类型、效应栈与通用 Eff 的边界

**状态（2026-11，M37 / M39）**：`IO` 已从 base 的普通 `data`（`MkIO (Int -> a)`）升格为
**编译器内建效应类型**（kind `Type -> Type`，运行时裸 thunk `int -> 'a`，无构造器），
构造/绑定/执行是内建代数 `prim_pureIO` / `prim_bindIO` / `prim_runIO`。在此之上：
`Base.Effect.MonadIO` + `StateT` / `ReaderT` / `ErrorT`（以 IO 为基座的效应栈），
`Base.ST` 改为包 `IO`。**M39 落定 D27 的「表示轴」最小实现**（§5）：异构结果类型的
CPS `Eff`（`res op` 在运行时位置不可命名）已可编译并运行；通用 `Eff` 库、行（含 `[Fetch]` 语法糖）、命名实例与 handler 已落地（§8）；
能力行仍归 F3。
**2026-11（`runtime-effects` 分支）**：Layer 1–3 的运行时效应核心已落地（§8）：OCaml 5
一次性 delimited continuations + 开放行 + 命名实例 + 一阶效应（`Base.Eff` / Reader /
State / Fs）；`Member` 行约束（W3）、L2 的 `local`/`catch`/scoped `Exn`、W7 线性续延与
一次性闭包（`mkCont`/`resumeCont`）、通用 `bracket`（含非 `Exn` abort cleanup）、
W9 单线程 fiber 调度器（`Base.EffSched`：`forkTask`/`awaitTask`/
`yieldNow`/`cancelTask`/`cancelScope`/结构化 `withScope` + 步数超时）均已落地；
W10 的 IO 标签迁移也已在库层落地（§8.6）：`Base.EffFs` 扩到完整 fs 面，新增
`Base.EffConsole`/`EffClock`/`EffEnv`/`EffProcess`（命名实例 + IO-backed handler）；
`IO` 仍保留为运行时基座/逃逸口。W10 收尾（`w10-io2`）再补：编译器原生
`prim_sleep`（`Base.EffClock` 真实 handler 已用；`Base.IO.sleepMicros` 待 rotation 后切换）、
fs 命名实例 `F1`/`F2`（mock/real 可并存）、可控 `Exit`（`handleProcessIOWith`/`…Observed`）、
工具链 `vuna version` 的 console 标签路径。`do` 的 base 内建实例与 W11 收尾（seed rotation）
仍待后续。学习路径：想用现有
效应写程序看 §2–§4；想知道 `Eff` 表示层怎么打通读 §5；想评估后续路线读 §6。

## 1. 范围

- **本页覆盖**：IO 的内建化与其代数、`MonadIO` 与 IO 基座 transformer、ST/region 的可变
  数据、base 的 `unsafe` 信任点、通用 Eff 的阻塞证据与 F3 路线。
- **不覆盖**：原语/能力的逐条语义（[primitives.md](primitives.md) §7）；纯效应 monad
  （`Base.State` / `Reader` / `Error`，它们不碰 IO，见 [stdlib.md](stdlib.md)）；
  并行/多核与 Domain 内存模型（W9 只做单线程调度器，见 §8.5）；完整 QTT（研究储备）。

## 2. IO 是内建效应类型

### 2.1 身份与表示

| 项 | 值 |
| --- | --- |
| 类型名 | `IO`（与 `Int` / `String` 同级的语言内建类型，恒可见） |
| kind | `Type -> Type`；参数是**类型层 binder**，`Rig0` 擦除——`a` 只出现在 OCaml 类型位置 `int -> 'a`，不产生运行时字段 |
| 运行时表示 | 裸 thunk `int -> 'a`（`int` 是世界令牌，`main` 用 `0`） |
| 构造器 | **没有**；`MkIO` 已删除 |

- `Intrinsics.ioFamilyName = ioTypeName = "IO"`；`IIO` 的签名形状映射到 `TGlobal "IO"`。
- `IO` 在 prelude 类型层放行、并进「禁止重定义」名单：ad-hoc 入口写 `data IO` 报
  `TC_CannotRedefineBuiltin`。模块内写 `data IO` 与 `data Bool` 同规则（mangle 成
  `<Module>.IO`，是该模块自己的类型，不遮蔽内建 `IO`）。
- `Base.IO` **不再声明** `IO`，只导出 API 与实例；`IO` 类型本身无需 import。
- 类型渲染：`IO a` → `(int -> a)`。世界令牌必须显式标注 `int`（`fun (_ : int) -> …`），
  否则 OCaml 值限制会把动作值推成不可泛化的弱类型变量。

### 2.2 代数与执行

| 原语 | 签名 | 说明 |
| --- | --- | --- |
| `prim_pureIO` | `{a : Type} -> a -> IO a` | 构造动作（忽略令牌） |
| `prim_bindIO` | `{a b : Type} -> IO a -> (a -> IO b) -> IO b` | 串行动作，令牌贯穿 |
| `prim_runIO` | `{a : Type} -> IO a -> a` | 唯一 main 外执行入口，需能力 `unsafe` |

- `Base.IO`：`runIO = prim_runIO`；`print = prim_print` 等 API 仍是 `prim_*` 别名；
  `Functor` / `Monad IO` 实例经 `prim_pureIO` / `prim_bindIO`。
- **执行边界不变**：动作只在 `main` 由运行时执行；`main : IO a` 的产物钩子是
  `v_main 0`（不再 match 构造子）。`runIO` 与直接引用 `prim_runIO` 都受 `unsafe` 门控。
- `vuna interp` 是纯核心求值器：遇到 `main : IO a` 一律报
  `[CG_InterpCannotExecuteEffects]`，既不执行也不丢弃效果（逐条归约边界见
  [primitives.md](primitives.md) §9）；效果程序只走 `compile` + 运行产物。
- 没有异常 / handler 层：语言没有 `try` / `catch`、没有 effect handler；未捕获的宿主异常
  由生成的 main 钩子统一报告为 `vuna: runtime error: ...` + 位置帧 + exit 2（见
  [debugging.md](debugging.md)）。`Base.Debug.trace` / `traceShow` 是调试专用逃逸（base 的
  `unsafe` `runIO`），不构成效应系统的一部分。
- **能力边界不变**：效果原语只有 `prim_*` 名，是否可直调由 manifest
  `[capabilities].effects` 决定；`Base.IO` 的别名不需要调用方有额外能力。IO 升格**没有**
  把能力搬进类型（类型级能力行仍归 F3）。

## 3. 效应栈：IO 作为基座

### 3.1 `MonadIO`

```vuna
trait MonadIO m where
  liftIO : IO a -> m a

instance MonadIO IO where
  liftIO io = io
```

`MonadIO` 是「该 monad 能承载 IO 动作」的接口；`Base.Effect` 导出它，`Base` 门面重导出
（`Prelude` **不**自动注入，效果面仍显式 import）。

### 3.2 transformer（以 IO 为基座）

| 模块 | 表示 | handler | 实例 |
| --- | --- | --- | --- |
| `Base.StateT` | `record StateT s a where stateTRun : s -> IO (Pair a s)` | `runStateT` / `evalStateT` / `execStateT` | `Functor` / `Monad` / `MonadIO (StateT s)` |
| `Base.ReaderT` | `record ReaderT e a where readerTRun : e -> IO a` | `runReaderT`；`ask` / `local` | `Functor` / `Monad` / `MonadIO (ReaderT e)` |
| `Base.ErrorT` | `record ErrorT e a where errorTRun : IO (Error e a)` | `runErrorT`；`throwError` / `catchError` | `Functor` / `Monad` / `MonadIO (ErrorT e)` |

- 三者都在 `do` 块里与 `liftIO` 组合；handler 返回 `IO …`，由 `main`/`runIO` 执行。
- **边界（已登记 debt D32）**：transformer 固定以 IO 为基座，不是
  `StateT s m a` 式的任意 monad 泛化。原因：vuna 的 record 参数统一按 `Type` kind 降级，
  且顶层签名里的自由隐式变量 kind 仍从「被应用次数」推断、不会从构造子 kind 反推
  （实例 tele 已改为从实参的构造子 kind 反推，但那只覆盖实例头；trait 类参数
  本身仍写不出 `Type -> … -> Type` 以外的 kind）。泛化需要先做
  「隐式参数 / record 参数 kind 从构造子 kind 推断」的编译器改进。
- **没有效应多态类**：trait 无父类 / 关联类型（多参数 trait 已支持；父类归
  [roadmap.md](../roadmap.md) F4），所以没有
  `MonadState s m` / `MonadReader e m` 这类类；效应多态代码用具体 transformer +
  显式签名约束。`MonadIO` 也没有 `Monad` 父类：`do` 仍需要单独的 `Monad` 字典。

### 3.3 与纯效应 monad 的关系

`Base.State` / `Base.Reader` / `Base.Error` 仍是**纯函数表示**（§stdlib.md），`vuna
interp` 能直接归约；它们是「不需要 IO 的状态/环境/错误」。要在一个程序里同时做 IO 与
这些效应，用 §3.2 的 IO 基座 transformer（或把纯 monad 嵌在 IO 动作的返回值里）。

## 4. `Base.ST`：IO 派生的 region 效应

- `ST r a` = 单构造子 data（运行时 `IO a` 的 thunk）；`r` 是 region 索引（类型级、擦除）。
- `Ref`/`SArray` 自 M38 起是 **linear record**：读/写/释放消费句柄并返回新句柄；
  线性结果用 `bindST1` 线程化（QTT 规则见 [qtt.md](qtt.md)）。
- `Ref r a` / `SArray r a` 是 region 句柄，字段不导出，只能由 ST 动作创建。
- 安全规则不变：`runST : ((r : Type) -> ST r a) -> a`；region 由调用方显式 binder 进入，
  库外不可命名；句柄不能逃逸（负例 `test/corpus/dt_err/56_st_escape.vuna`）。
- 操作直接构造 IO 动作（`newRef` / `readRef` / …），`runST` 在入口执行**一次**
  `runIO`；region 内没有其它特权执行点。
- 不声明 `Functor/Monad (ST r)`（region 的显式 binder 与字典提升顺序冲突，见 §2.2
  old note），region 多态代码用 `bindST` / `pureST` / `fmapST`。
- 当前边界：`ST` 动作本身沿用 IO 的可复制语义（无线性箭头在动作内部线程化线性值）；
  `Ref`/`SArray` 的“恰好一次”已由 QTT 类型化（D22）。

## 5. D27 表示轴：不透明擦除值（已落地的最小实现）

目标设计（M35.1 原意）仍是**签名索引的效应 monad**：
`Eff (f : Type) (res : f -> Type) (ans : Type) (a : Type)`，op 是 `f` 的值、每个 op 的
结果类型由 `res` 族给出，handler 是深代数 `(op : f) -> (res op -> ans) -> ans`。

历史结论（M37 实测）：四条候选路线都卡在**擦除后端**，不在类型检查——CPS 版生成的
`.ml` 里续延域 `res op` 被渲染成 `unit`，而 handler 里的续延是 `int -> …` →
`ocamlopt` 类型错误（`C_Eff_MkEff of ((('a2) -> 'a1) -> (('a0) -> ((unit) -> 'a1) -> 'a1) -> 'a1)`）。

**M39（D27 表示轴的最小实现）**：采用 §6 的路线 2「后端不透明擦除值」，异构结果类型的
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
- 全局类型头既不是数据族、也不是 `Int` / `String` / `IO` / `Array` / `IORef` /
  `MArray` / `Buffer`（即类型族定义 / axiom / 未知全局）；
- 或**类型族参数**：kind 的 Pi 链里出现非宇宙域（`res : f -> Type`；`m : Type -> Type`
  这类普通类型构造子参数**不算**，所以字典方法字段 / base 泛型代码不受影响）；
- 数据族的**索引值实参**（`Vec a (Succ n)` 的 `Succ n`）是擦除后的索引，不参与判定；
- 已知边界：精化期未解的元变量按可表示处理（可能漏 cast，见 D27 残留）；trait 自动
  生成的 λ（方法投影 / 实例 tele）不在插入点覆盖范围内。

**注意这不是 QTT 能解决的**：续延是**真的运行时函数**（要被 handler 以真实值调用），
`res op` 是类型级、按擦除纪律 0 用量、在 OCaml 里不可命名；QTT 只把 0/1/ω 用量写精确，
不会让 OCaml 写出 `res op` 的静态类型。表示轴用「不透明值 + 恒等 cast」绕开它。

**结论**：D27 的表示层阻塞已消除；**用户可见的 `Eff` 库 / handler 语法 / 行与重排 /
能力行仍未实现**（§9），归 F3。

## 6. F3：通用效应系统的三条路线

| 路线 | 解决什么 | 不解决 / 代价 |
| --- | --- | --- |
| **完整 QTT**（依赖 multiplicity、线性/唯一） | ST 的「句柄不复制/恰好用一次」、一次性续延（取消/超时）、线性世界令牌 | **不解决**擦除依赖续延的运行时表示（§5）；类型理论 + 编译器 + base + 语法面全量改动，独立阶段 |
| **后端不透明擦除值**（`Obj.t` 类 + codegen 转换/cast） | 让 `res op` 这类「擦除依赖」位置有统一运行时表示，通用 `Eff` 才可编译 | **M39 已落地最小实现（§5）**：声明位置 `Obj.t`、表达式位置恒等 cast；残留边界见 D27 |
| **运行时类型码**（Tarski `Ty`/`Tm` 上移为通用机制） | 显式携带类型信息，彻底绕开「不可命名」 | 语言层引入 type codes（当前明确不在终态）、运行时开销、与擦除判据整合 |

- 三者不是互斥：QTT 解决**作用/线性**轴，后两者解决**表示**轴。
- 顺序（F3 已按此开工）：先做「表示」轴的最小实验（不透明擦除值，M39 已落地），再用
  QTT 收线性/一次性；两者的残余边界清完后，用户级 `Eff` 与自定义效应才进入排期（D03）。

## 7. 设计规则（已实现部分）

1. **IO 是内建效应类型 + 内建代数**：`prim_pureIO` / `prim_bindIO` / `prim_runIO`；
   `Base.IO` 只做公面与实例，没有第二套构造/绑定实现。
2. **handler 是解释器**：`runIO` / `runStateT` / `runReaderT` / `runErrorT` / `runST`
   是唯一执行入口；没有「隐式生效的 handler 栈」。
3. **可变数据两条边界**：`IORef` / `MArray` / `Buffer` 只能在 `IO` 动作里用；
   `Ref` / `SArray` 只能在 `ST r` 里用，且不能逃出 `runST`。两者表示同构、类型隔离。
4. **能力是权限层，不是类型豁免**：`runIO` / `prim_runIO` 使用点必须声明 `unsafe`；
   base 因此声明 `unsafe`（§8、[primitives.md](primitives.md) §7）。
5. **效应组合显式**：transformer 的 handler 必须显式调用；没有自动 lift 到任意深度。
6. **不透明擦除值的表示与 cast 由同一份判据驱动**：`Elab.Meta.valueOpaqueScoped` 与
   `Codegen.Decl` 的 `isTypeHeadOpaqueDatas` / `ctorOpaqueFlagsOf` 必须同步；
   `Obj.t` 字段 ↔ `prim_erase` / `Obj.magic` 两侧缺一就会在 `ocamlopt` 处错配。
7. **cast 对语义透明**：`prim_erase` 求值期归约为实参本身（`OpIdentity` +
   `applyValueFuel` 的恒等消去），对定义性相等 / 正规化 / interp 不可见；用量检查里
   cast 应用记 `Rig1`，不放大线性值的使用。

__EFF_SECTION__
## 8. Layer 1 运行时效应（已落地部分）

2026-11，`runtime-effects` 分支落地了 Layer 1 的核心切片：**OCaml 5 运行时续延 +
开放行 + 命名实例 + 一阶效应**。它不使用 CPS 编码，`Eff` 只是抽象动作；控制由
`Effect.Deep` 捕获。

### 8.1 表示

- `Row` 是 Type-1 数据，存放**效应标签类型**（`RCons : Type -> Row -> Row`）；
- **行字面量语法糖**：`[e1, e2]` 在**期望 kind 为 `Row`** 的位置展开为
  `RCons e1 (RCons e2 RNil)`，`[]` 展开为 `RNil`；普通列表字面量（期望 `List a`）
  不变。例：`String -> Eff [Fetch] String` 等价于
  `String -> Eff (RCons Fetch RNil) String`。实现是 expected-kind-directed：精化器在
  `checkEFuel` / 参数检查里识别 Loader 产生的 `Base.List.Cons`/`Nil` 形状并重写成
  `RCons`/`RNil`（`Elab/Term/Impl` 的 `rowListElems`/`rowExprFromElems`），parser 与 AST
  不需要区分类型/项位置（`[...]` 仍是列表字面量）。夹具 `dt_base/45_eff_row_sugar`。
  行只是擦除索引，不进入运行时值。
- 标签是用户/库声明的数据类型（如 `Reader Cnt1 Int`、`State S1 Int`、`Fs`），
  没有闭合的 `data EffectLabel`；新增效应/实例不需要改中央表。
- `Eff r a` 构造子不导出；内部是私有 dummy thunk（`EffUnit -> a`），
  **没有世界令牌**；dummy 只为延迟执行。
- `Member e r` 是 Type-1 归纳族（`Here`/`There`），effect wrapper 用隐式证明参数；
  精化器按行结构构造证明（定义级 ctx 收尾）。
- `rowRem : Type -> Row -> Row` 去掉一个标签；它不是类型族，由编译器按标签类型值
  结构相等归约（类型族的重复变量模式不强制相等，见 D40）。

### 8.2 运行时

- `Vuna_runtime` 声明 `type _ Effect.t += Perform : string * int * Obj.t -> Obj.t Effect.t`。
- 隐藏 intrinsic `prim_effectPerform` / `prim_effectHandle`（要求 `unsafe`，只供
  `Base.Eff` 包装）：
  - `perform` → `Effect.perform`；
  - `handle` → `Vuna_runtime.dtp_effect_handle`：`Effect.Deep.match_with`，按
    `(key, name)` 过滤；不匹配返回 `None` 交给外层 handler；`retc` 应用 handler 的
    `ret`；`continue` 一次。handler 退出（正常 / 异常 / abort 丢弃续延）时执行该
    extent 内未弹出的 bracket cleanup。
- W7 的 cleanup 机制：`prim_cleanupPush` / `prim_cleanupPop`（隐藏、`unsafe`）登记/
  弹出每纤程 cleanup 栈（`dtp_cleanup_*`）；`Base.Eff.bracket`/`finally` 用它保证
  非 `Exn` abort 也跑 release（细节见 [effects-layers.md](effects-layers.md) §8.5）。
- 语义是**一次性（one-shot）**：resume 两次抛 `Continuation_already_resumed`；
  多射续延不做（未来若需要，单独立运行时项目）。
- 未处理的 `Perform` 由 `main` 钩子的异常报告器兜底（`vuna: runtime error: ...`）。
- `vuna interp` 是纯求值器，不执行运行时效应；效果程序只能 `check` + `compile` + run
  （夹具带 `.nointerp`）。

### 8.3 已落地的模块

| 模块 | 内容 |
| --- | --- |
| `Base.Eff` | `Row(..)`、`Eff`、`Member(..)`/`rowRem`、`bindEff`/`bindEff1`、`sendCore`/`handleCore`/`handleCoreLin`、`Cont`/`mkCont`/`resumeCont`、`bracket`/`finally`、`weaken`、`runPure`/`runIOEff`/`runIOAnswer` |
| `Base.Eff.Reader` | `Reader n s` + `Ask`；`ask`/`handleReader`；`Cnt1`/`Cnt2` 两个同名实例 |
| `Base.EffState` | `State n s` + `Get`/`Put`；`get`/`put`/`handleState`（answer `s -> Pair a s` 线程状态） |
| `Base.EffFs` | IO-backed Fs 效应（W10 扩到完整 fs 面；收尾改为**命名实例** `Fs n`，`F1`/`F2`）：`ReadFile`/`WriteFile`/`WriteFileAtomic`/`ReadDir`/`IsDirectory`/`MakeDir`/`RemoveFile`/`FileExists`/`FileMtime`/`FileSize` + `resFs`；`fsReadFile n`/`fsWriteFile n`/…/`handleFs n`（泛型）/`handleFsIO n`（IO-backed，可直接 `runIOAnswer`）；handler 用 `Base.IO` 实现。mock/real 可并存（`dt_base/37`） |
| `Base.EffConsole` | W10 console 标签（命名实例 C1/C2）：`Print`/`EPrint`；`consolePrint`/`consoleEprint`/`handleConsole`/`handleConsoleIO`（真实 handler 用 `Base.IO.print`/`eprint`） |
| `Base.EffClock` | W10 clock 标签（命名实例 K1/K2）：`Now`（微秒时间戳）/`SleepMicros`；`clockNow`/`clockSleepMicros`/`handleClock`/`handleClockIO`（真实 handler 用 `Base.IO.nowMicros` 与编译器原生 `prim_sleep`） |
| `Base.EffEnv` | W10 env 标签（命名实例 V1/V2）：`GetEnv`/`GetCwd`/`ExecPath`；`envGetEnv`/`envGetCwd`/`envExecPath`/`handleEnv`/`handleEnvIO`（真实 handler 用 `Base.IO.getEnv`/`getCwd`/`execPath`） |
| `Base.EffProcess` | W10 process 标签（命名实例 P1/P2）：`Args`/`Exit`/`RunIn`；`processArgs`/`processExit`/`processRunIn`/`handleProcess`/`handleProcessIO`（真实 handler 用 `prim_getArgs`/`prim_exit`/`prim_runIn`）/`handleProcessIOWith`（自定义 `onExit`）/`handleProcessIOObserved`（`Exit` 可观察、不退出） |
| `Base.EffError` | `Error`/`ErrorOp` + `throw`/`handleError`/`runError`/`catch`（L2 作用域 catch） |
| `Base.EffExn` | W6 高阶 scoped Error：`Try` 携带子计算；`tryWith`/`runExn`/`catchExn`/`bracketExn` |
| `Base.EffMutex` | W9 Mutex/Semaphore（IORef + yield 忙等）：`acquire`/`release`/`semWait`/`semSignal` |
| `Base.EffChannel` | W9 cooperative Channel：`send`/`tryRecv`/`recvWait` |
| `Base.EffAsync` | 最小并发（L3，**legacy**）：`Task`/`async`/`await`，基于 OCaml 5 `Domain`；任务行 `RNil`（W9 的调度器取代其定位，见 §8.5） |
| `Base.EffSched` | W9 单线程 fiber 调度器（L3）：`Task`/`Scope`/`TaskLin` + `forkTask`/`forkTaskWith`/`forkTaskLin`/`awaitTask`/`awaitTaskLin`/`yieldNow`/`cancelTask`/`cancelTaskLin`/`cancelScope`/`scopeWait`/`scopeWaitTimeout`/`withScope`/`withScopeTimeout`/`isCancelled`/`liftIOEff`；任务行 `RNil`，超时按逻辑步数 |

夹具：`dt_base/16`（两个 Reader 实例嵌套 handler）、`17`（State 状态线程）、
`18`（IO-backed Fs 真实读写，命名实例 F1）、`20–21`（W6 local/catch）、`23`（W6
scoped handler）、`24–25`（W7 线性续延 / bracketExn）、`26–30`（W10 mock↔real 对拍）、
`31–36`（W9 调度器：fork/await、取消、超时、监督、重复 await、Channel）、`37–39`
（W9 Mutex、线性 TaskLin、effect-aware forkTaskWith）、`40–41`（W10 fs 命名实例 /
process 可控 Exit）、`42–44`（W7 通用 bracket abort cleanup、调度器 bracket、一次性闭包）、`45`（行语法糖）；
负例 `dt_err/70–81`；能力包夹具 `packages/10_prim_io` 是 `prim_sleep` 原生探针。
细节见 §8.6 与 [effects-layers.md](effects-layers.md)。
### 8.4 已知边界（下一步）

- **W3 行成员约束已落地**：`Base.Eff.Member` 是 Type-1 归纳族，effect wrapper 带隐式
  `{w : Member e r}`；精化器在应用处按行结构构造 `Here`/`There`，无法当场判定的目标
  延迟到**定义体结束**、用定义级 ctx 收尾（可命中 wrapper 的局部证明 binder），缺效应
  报 `TC_NoInstanceFound`（负例 `dt_err/70_effect_missing`）。
  不走 trait 重叠实例（trait 版 `Member` 仍被 coherence 拒绝，D39）；`sendCore`/
  `handleCore` 本身不带证明，属于信任边界内的核心原语。
- **行删除的表示层修复**：`rowRem` 改成公理 + 编译器按标签类型值结构相等归约；
  不能写成类型族（重复变量模式不强制相等，D40）。
- **`Monad (Eff r)` 已内建**：`Base.Eff` 直接声明
  `instance Monad (Eff r) where pure = pureEff; bind = bindEff`（实例 tele `r : Row`
  由 `Eff` 构造子 kind 推断）；import `Base.Eff` 后可直接用 `do` / `>>=` / `>>`。
  `do` 在行 `r` 上单子化，handler 仍显式解释；纯行用 `runPure` 收尾
  （夹具 `dt_base/19_eff_monad`）。
- **一阶效应核**：普通 send op 不含子计算；W6 通过 `Base.EffExn.Try` 支持携带子计算，
  `bracketExn` 提供 Exn 路径的 cleanup；W7 的通用 `Base.Eff.bracket`/`finally` 用运行时
  cleanup 栈覆盖**任意效应 abort**（handler 丢弃续延），见 §8.5 与 effects-layers.md。
- **并发/async**：W9 单线程调度器已落地（`Base.EffSched`，见 §8.5）：协作式
  `forkTask`/`awaitTask`/`yieldNow`、取消（含清理宽限）、结构化 `withScope`、步数超时；
  并行/多核（Domain）仍不是本层目标。旧的 `Base.EffAsync`（Domain）保留但不算 W9。
- **未处理效应诊断**：main 兜底已识别 `Effect.Unhandled (Perform (key,name,_))`，报告
  `unhandled effect key (instance n)`（`test/corpus/run_err/04_unhandled_effect`）；任务内
  的未处理效应经 `awaitTask` 的 `Err` 返回同一条消息。

### 8.5 Layer 2/3（展开）

W6 高阶/作用域、W7 线性续延/一次性闭包/`bracket`、W9 单线程调度器与 W10 IO 标签
迁移详见 [effects-layers.md](effects-layers.md)。核心边界：W6 `Try` 子计算 + scoped
handler；W7 `Cont` resume-once（`mkCont`）+ `bracket` 的 abort cleanup；W9
fork/await/yield/cancel/结构化 scope；W10 console/clock/env/process/fs 标签（库层）。

## 9. 债务映射

| debt | 内容 | 归属 |
| --- | --- | --- |
| D22 | QTT 核心已落地（M38）；W7 补了线性捕获规则与一次性闭包（`Base.Eff.Cont`/`mkCont`）；剩余：multiplicity 多态/依赖 multiplicity、通用线性箭头类型、`ST` 动作本身仍可复制；ST 无 `Monad` 实例（另见 D45） | 后续 / F3 |
| D27 | **M39 表示轴已落地**（§5）：CPS `Eff` 的 `res op` 用不透明值 + 恒等 cast 编译；残留：精化期未解 meta 的漏 cast 边界、trait 自动生成 λ 的插入点未覆盖、以及用户级 `Eff` API / 行 / 重排（D03） | F3 |
| D28 | `base` 的 `unsafe` 授权没有机制约束使用点（`Base.IO.runIO` 别名 + `Base.ST.runST` + `Base.Debug.trace/traceShow` 的调试逃逸） | 后续收紧 |
| D32 | transformer 无任意 monad 泛化（隐式参数 kind 推断缺口，§3.2） | M37 后续（F3 前置） |
| D37 | 运行时效应的剩余缺口：`Member`（W3）、W6 高阶 scoped handler、W7 线性续延/一次性闭包/`bracket`（含 abort cleanup）、W9 单线程调度器、W11 未处理效应诊断均已落地；L3 扩展见 D41/D44 | `Base/Eff*`；§8.4 | F3 |
| D41 | Layer 2/3 已落地面：W6 scoped handler、W7 线性续延/一次性闭包/通用 `bracket`（abort cleanup）、W9 `Base.EffSched`（单线程调度器，含 Mutex/Channel/线性 TaskLin/forkTaskWith）；剩余：Domain 并行、父 fiber handler 继承 | §8.5；D44 | 后续（Layer 3 扩展） |
| D43 | W10 的 IO 标签迁移只在**库层**（另有工具链一条真实路径）：`IO`/`Base.IO`/`prim_*` 仍可被包直接使用（无编译器强制）；原生 `prim_sleep` 已落地且 `Base.EffClock` 已用，但 `Base.IO` 在 seed 闭包内，`sleepMicros` 仍是忙等、切换需先 rotation；工具链仅 `vuna version` 一条 console 路径迁到标签，编译器不迁移 | `Base/Eff{Console,Clock,Env,Process,Fs}.vuna`、`Base/IO.vuna`、`lib/Vuna/Cli.vuna`、`base/vuna.toml`；fixtures `dt_base/26–30`/`37`/`38`、`dt_err/77`；§8.6 | 后续（W10 收尾 / seed rotation） |
| D44 | W9 调度器边界：取消只在挂起点生效、清理有 64 步宽限后硬中止；Task/Scope legacy 可复制；TaskLin 恰好一次 await/cancel；Mutex/Semaphore/Channel 均为 cooperative 忙等；超时是逻辑步数；任务体只能 `Eff RNil a`（forkTaskWith 显式 handler，但无法继承父 fiber handler 栈）；`Base.EffAsync`（Domain）与调度器互不集成 | `Base.EffSched`、`Codegen/Term.vuna`（`dtSchedRuntime`）、`Intrinsics.vuna`（`prim_sched*`） | W10/W11 |
| D45 | QTT 用量检查对 `let` 降级按 λ 应用缩放 RHS，线性值 `let z = y + 1 in z` 误报 `TC_LinearOverused`；推断位置把线性值传给通用运算符/trait 方法（形参默认 ω）同样被拒 | `Elab/Usage.vuna`、`Elab/Term/Impl.*`；探针见 qtt.md §9 | W7 后续 |

## 10. 非目标（本阶段明确不做）

- 语言级 `handle` / `perform` 语法、行多态、自动 lift、多射续延；用户自定义效应已可在库级声明（§8）。
- W6/W7/W9 已落地高阶/作用域、一次性闭包与单线程调度器；完整线性箭头、Domain 并行、父 fiber handler 继承仍属后续（见 D41/D44/D45）。
- 高阶/作用域效应的**类型系统**（当前 `catch`/`local`/`bracket`/scoped `Exn` 是库层 + W3 行约束的组合，未做语言级高阶效应类型）。
- 网络/服务端框架（M35.3–M35.4）目前只有最小 `async`/`await`（Domain，legacy）。
- 类型级能力行（`IO [caps] a`）。
- ST 的线性箭头/动作线性语义（`Ref`/`SArray` 已是线性记录）；ST 的 `Monad` 实例。
- 并行/多核（OCaml `Domain` 并行、内存模型）：W9 只做**单线程**调度器；通道/互斥量等
  并发数据结构、网络/服务端框架（M35.3–M35.4）不在本阶段。

## 相关阅读

- 标准库模块：[stdlib.md](stdlib.md)；量化/线性规则：[qtt.md](qtt.md)
- 原语与能力（`prim_*`、`runIO`、效果原语）：[primitives.md](primitives.md) §7
- 记录 / trait / `do` 与 `Monad`：[records-traits.md](records-traits.md)
- 类型系统（擦除判据、宇宙）：[type-system.md](type-system.md)；Core 实现：[core.md](core.md)
- 自举与 rotation：[bootstrap.md](bootstrap.md)；测试标签：[testing.md](testing.md)

- Layer 2/3 展开（W6/W7/W9/W10）：[effects-layers.md](effects-layers.md)
- 历史计划存档（W1–W11 交付清单）：[../plans/three-layer-effects.md](../plans/three-layer-effects.md)
