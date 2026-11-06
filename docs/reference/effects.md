# 效应：IO 内建效应类型、效应栈与通用 Eff 的边界

**状态（2026-11，M37 / M39）**：`IO` 已从 base 的普通 `data`（`MkIO (Int -> a)`）升格为
**编译器内建效应类型**（kind `Type -> Type`，运行时裸 thunk `int -> 'a`，无构造器），
构造/绑定/执行是内建代数 `prim_pureIO` / `prim_bindIO` / `prim_runIO`。在此之上：
`Base.Effect.MonadIO` + `StateT` / `ReaderT` / `ErrorT`（以 IO 为基座的效应栈），
`Base.ST` 改为包 `IO`。**M39 落定 D27 的「表示轴」最小实现**（§5）：异构结果类型的
CPS `Eff`（`res op` 在运行时位置不可命名）已可编译并运行；但**用户可见的通用签名索引
效应（`Eff` 库 / handler 语法 / 行与重排 / 能力行）仍未实现**，归 F3。学习路径：想用现有
效应写程序看 §2–§4；想知道 `Eff` 表示层怎么打通读 §5；想评估后续路线读 §6。

## 1. 范围

- **本页覆盖**：IO 的内建化与其代数、`MonadIO` 与 IO 基座 transformer、ST/region 的可变
  数据、base 的 `unsafe` 信任点、通用 Eff 的阻塞证据与 F3 路线。
- **不覆盖**：原语/能力的逐条语义（[primitives.md](primitives.md) §7）；纯效应 monad
  （`Base.State` / `Reader` / `Error`，它们不碰 IO，见 [stdlib.md](stdlib.md)）；
  并发/async（M35.2）；完整 QTT（研究储备）。

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
  且顶层签名/实例头里的自由隐式变量 kind 从「被应用次数」推断、不会从构造子 kind
  反推，`m : Type -> Type` 只在实参位置出现时会被误判成 `Type`。泛化需要先做
  「隐式参数 kind 从构造子 kind 推断」的编译器改进。
- **没有效应多态类**：trait 只支持单参数、无父类（见 [roadmap.md](../roadmap.md) F4），所以没有
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

## 8. 债务映射

| debt | 内容 | 归属 |
| --- | --- | --- |
| D22 | QTT 核心已落地（M38）；剩余：线性箭头/多态、一次性续延，`ST` 动作本身仍可复制；ST 无 `Monad` 实例 | 后续 / F3 |
| D27 | **M39 表示轴已落地**（§5）：CPS `Eff` 的 `res op` 用不透明值 + 恒等 cast 编译；残留：精化期未解 meta 的漏 cast 边界、trait 自动生成 λ 的插入点未覆盖、以及用户级 `Eff` API / 行 / 重排（D03） | F3 |
| D28 | `base` 的 `unsafe` 授权没有机制约束使用点（`Base.IO.runIO` 别名 + `Base.ST.runST` + `Base.Debug.trace/traceShow` 的调试逃逸） | 后续收紧 |
| D32 | transformer 无任意 monad 泛化（隐式参数 kind 推断缺口，§3.2） | M37 后续（F3 前置） |

## 9. 非目标（本阶段明确不做）

- 语言级 `handle` / `perform` 语法、行多态、自动 lift、多射续延、用户自定义效应。
- 类型级能力行（`IO [caps] a`）。
- ST 的线性箭头/动作线性语义（`Ref`/`SArray` 已是线性记录）；ST 的 `Monad` 实例。
- 并发/async（M35.2）、网络/服务端框架（M35.3–M35.4）。

## 相关阅读

- 标准库模块：[stdlib.md](stdlib.md)；量化/线性规则：[qtt.md](qtt.md)
- 原语与能力（`prim_*`、`runIO`、效果原语）：[primitives.md](primitives.md) §7
- 记录 / trait / `do` 与 `Monad`：[records-traits.md](records-traits.md)
- 类型系统（擦除判据、宇宙）：[type-system.md](type-system.md)；Core 实现：[core.md](core.md)
- 自举与 rotation：[bootstrap.md](bootstrap.md)；测试标签：[testing.md](testing.md)
