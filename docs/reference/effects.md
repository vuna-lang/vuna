# 效应：IO 内建效应类型、效应栈与通用 Eff 的边界

**状态（2026-11，M37）**：`IO` 已从 base 的普通 `data`（`MkIO (Int -> a)`）升格为
**编译器内建效应类型**（kind `Type -> Type`，运行时裸 thunk `int -> 'a`，无构造器），
构造/绑定/执行是内建代数 `prim_pureIO` / `prim_bindIO` / `prim_runIO`。在此之上：
`Base.Effect.MonadIO` + `StateT` / `ReaderT` / `ErrorT`（以 IO 为基座的效应栈），
`Base.ST` 改为包 `IO`。**通用签名索引效应（用户自定义 op + 深 handler + 行/重排）仍未
实现**，卡在擦除后端（§5），归 F3。学习路径：想用现有效应写程序看 §2–§4；想知道为什么
没有 `Eff` 读 §5；想评估后续路线读 §6。

## 1. 范围

- **本页覆盖**：IO 的内建化与其代数、`MonadIO` 与 IO 基座 transformer、ST/region 的可变
  数据、base 的 `unsafe` 信任点、通用 Eff 的阻塞证据与 F3 路线。
- **不覆盖**：原语/能力的逐条语义（[primitives.md](primitives.md) §7）；纯效应 monad
  （`Base.State` / `Reader` / `Error`，它们不碰 IO，见 [stdlib.md](stdlib.md)）；
  并发/async（M35.2）；完整 QTT（研究储备）。
- 当前用户可见边界另见 [limits.md](limits.md)。

## 2. IO 是内建效应类型

### 2.1 身份与表示

| 项 | 值 |
| --- | --- |
| 类型名 | `IO`（与 `Int` / `String` 同级的语言内建类型，恒可见） |
| kind | `Type -> Type`（参数 binder `Rig1`，运行时用到） |
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

## 5. 为什么没有通用 `Eff`（实测证据）

目标设计（M35.1 原意）是**签名索引的效应 monad**：
`Eff (f : Type) (res : f -> Type) (ans : Type) (a : Type)`，op 是 `f` 的值、每个 op 的
结果类型由 `res` 族给出，handler 是深代数 `(op : f) -> (res op -> ans) -> ans`。
四条候选路线都实测过，结论是**卡在擦除后端，不在类型检查**：

| 路线 | 结果 | 证据 |
| --- | --- | --- |
| CPS/Church 版 `Eff`（含 `res` 参数） | `check` / `interp` 通过；`compile` 生成的 `.ml` 里续延域 `res op` 被渲染成 `unit`，而 handler 里的续延是 `int -> …` → `ocamlopt` 类型错误 | 反例：`C_Eff_MkEff of ((('a2) -> 'a1) -> (('a0) -> ((unit) -> 'a1) -> 'a1) -> 'a1)`；`v_counterAlg has type … (int -> int -> 'a) … but expected … (unit -> 'b) -> 'b` |
| 数据版 free monad（`Pure` / `Send`） | `TC_CannotProveTermination`：`bind` 在续延 `k r` 上递归 | `[SCT 无下降环: bindE{1->1}]` |
| Type-1「行里存类型」（`data Eff : Row -> Type -> Type 1`） | codegen 损坏（类型参数 arity 与 `TApp` 不一致、类型值字段擦成 `unit`） | 见 debt D27 的探针记录 |
| 闭宇宙 + `Res` 码（op 结果编码成 data 族） | 可编译，但只能写**单态**效应（`State Int` 而非 `State s`），等价于手写 operational monad | 设计推演 |

**根因**：续延的类型是 `res op -> ans`，`res` 是类型级、按擦除纪律 0 用量、在 OCaml 里
不可命名；而续延是**真的运行时函数**（要被 handler 以真实值调用）。「擦除依赖类型的
运行时表示」在后端还没有答案。注意这**不是 QTT 能解决的**：QTT 只把 0/1/ω 用量写精确，
不会让 OCaml 写出 `res op` 的静态类型。

**结论**：M37 在内建 IO + 效应栈上落地可行部分；通用 `Eff` 归 F3，先答 §6 的路线问题。

## 6. F3：通用效应系统的三条路线

| 路线 | 解决什么 | 不解决 / 代价 |
| --- | --- | --- |
| **完整 QTT**（依赖 multiplicity、线性/唯一） | ST 的「句柄不复制/恰好用一次」、一次性续延（取消/超时）、线性世界令牌 | **不解决**擦除依赖续延的运行时表示（§5）；类型理论 + 编译器 + base + 语法面全量改动，独立阶段 |
| **后端不透明擦除值**（`Obj.t` 类 + codegen 转换/cast） | 让 `res op` 这类「擦除依赖」位置有统一运行时表示，通用 `Eff` 才可编译 | 需要擦除纪律的运行时桥接与 cast 插入；是 codegen/runtime 工程，风险与基准重定标 |
| **运行时类型码**（Tarski `Ty`/`Tm` 上移为通用机制） | 显式携带类型信息，彻底绕开「不可命名」 | 语言层引入 type codes（当前明确不在终态）、运行时开销、与擦除判据整合 |

- 三者不是互斥：QTT 解决**作用/线性**轴，后两者解决**表示**轴。
- 建议顺序（F3 立项时决策）：先做「表示」轴的最小实验（不透明擦除值），再用 QTT 收
  线性/一次性；两者都落地后，`Eff` 与用户自定义效应才可能进入排期。

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

## 8. 债务映射

| debt | 内容 | 归属 |
| --- | --- | --- |
| D22 | QTT 核心已落地（M38）；剩余：线性箭头/多态、一次性续延，`ST` 动作本身仍可复制；ST 无 `Monad` 实例 | 后续 / F3 |
| D27 | 擦除依赖续延的运行时表示缺失（§5），三条路线见 §6 | F3 |
| D28 | `base` 的 `unsafe` 授权没有机制约束使用点（`Base.IO.runIO` 别名 + `Base.ST.runST` + `Base.Debug.trace/traceShow` 的调试逃逸） | 后续收紧 |
| D32 | transformer 无任意 monad 泛化（隐式参数 kind 推断缺口，§3.2） | M37 后续（F3 前置） |

## 9. 非目标（本阶段明确不做）

- 语言级 `handle` / `perform` 语法、行多态、自动 lift、多射续延、用户自定义效应。
- 类型级能力行（`IO [caps] a`）。
- ST 的线性箭头/动作线性语义（`Ref`/`SArray` 已是线性记录）；ST 的 `Monad` 实例。
- 并发/async（M35.2）、网络/服务端框架（M35.3–M35.4）。

## 相关阅读

- 当前边界（用户可见）：[limits.md](limits.md)；标准库模块：[stdlib.md](stdlib.md)；量化/线性规则：[qtt.md](qtt.md)
- 原语与能力（`prim_*`、`runIO`、效果原语）：[primitives.md](primitives.md) §7
- 记录 / trait / `do` 与 `Monad`：[records-traits.md](records-traits.md)
- 类型系统（擦除判据、宇宙）：[type-system.md](type-system.md)；Core 实现：[core.md](core.md)
- 自举与 rotation：[bootstrap.md](bootstrap.md)；测试标签：[testing.md](testing.md)
