# 效应（effects）：M35.1 已实现子集与通用效应系统的边界

**状态（2026-11）**：M35.1 的**已实现子集**是「参数化效应 monad（`Base.State` /
`Base.Reader` / `Base.Error`，带 `Functor`/`Monad` 实例与 `do`）+ `Base.ST` 的
region 隔离可变数据」，前置是三个编译器缺口修复（见 §5）。
**通用签名索引代数效应（用户自定义 op + 深 handler + 行/重排）未实现**：它卡在擦除后端
（§3），归 F3。学习路径：想用现有效应写程序看 §2；想知道为什么没有 `Eff` 读 §3；
想评估后续路线读 §6。

## 1. 范围

- **本页覆盖**：效应 monad 与 handler 的语义、ST/region 的可变数据整合、`base` 的
  `unsafe` 信任点、通用 Eff 的阻塞证据与 F3 路线。
- **不覆盖**：`IO` 本身的表示（仍是 `MkIO (Int -> a)` thunk，只在 `main` 执行，见
  [primitives.md](primitives.md) §7）；并发/async（M35.2）；完整 QTT（研究储备）。
- 当前用户可见边界另见 [limits.md](limits.md)，标准库模块清单见
  [stdlib.md](stdlib.md)。

## 2. 已实现子集

### 2.1 参数化效应 monad + `do`

| 模块 | 表示 | handler | 实例 |
| --- | --- | --- | --- |
| `Base.State` | `State s a = MkState (s -> Pair a s)` | `runState` / `evalState` / `execState` | `Functor (State s)`、`Monad (State s)` |
| `Base.Reader` | `Reader e a = MkReader (e -> a)` | `runReader`（`local` 改局部环境） | `Functor (Reader e)`、`Monad (Reader e)` |
| `Base.Error` | `Error e a = MkOk a \| MkErr e` | `runError`（`catchError` 恢复） | `Functor (Error e)`、`Monad (Error e)` |

- 三个模块都是**纯函数表示**：没有语言级效应，`do` 走 `Base.Monad` 的 `bind`/`pure`，
  因此 `vuna interp` 能直接归约（`test/corpus/stdlib/16_state.vuna` / `17_reader.vuna` /
  `18_error.vuna`）。
- **M35.1 是破坏性变更**：M33 W6 落地的手写组合子（`bindState` / `pureState` /
  `mapState`、`bindReader` / `pureReader` / `mapReader`、`bindError` / `pureError` /
  `mapError`）已删除——它们与 trait 方法重复，终态不保留兼容层。
- 参数化实例要求编译器先修两处（§5）：实例头按**类参数 kind** 检查、刚性类参数的
  **泛型实例**搜索。`test/corpus/dt/76_param_monad.vuna`（`State Int` + `do`）与
  `test/corpus/dt/79_generic_monad.vuna`（`{s : Type} -> State s Int` + `do`）锁定。

### 2.2 `Base.ST`：region 隔离的可变数据

类型（构造函数不导出）：

```vuna
data Ref    : Type -> Type -> Type   -- Ref r a      （包 IORef a）
data SArray : Type -> Type -> Type   -- SArray r a    （包 MArray a）
data ST     : Type -> Type -> Type   -- ST r a        （Int -> a 世界令牌 thunk）

runST : {a : Type} -> ((r : Type) -> ST r a) -> a
```

- **安全规则**：`r` 是 region 索引（类型级、擦除）。调用方用**显式**类型 binder 进入
  region（`runST (\r => ...)`），`r` 在库外不可命名；`a` 在进入 region 之前由期望类型
  确定，因此 `Ref r a` 型的句柄作为结果会要求 `a ≡ Ref r a`，与刚性 `r` 冲突——句柄
  不能逃逸。负例：`test/corpus/dt_err/56_st_escape.vuna`（`type mismatch: expected Int, got r`）。
- **运行时**：`ST r a` 是 `Int -> a` 的世界令牌 thunk；`newRef` / `writeRef` / `readRef` /
  `newArray` / … 经 `Base.IO.runIO` 执行真实的 `IORef` / `MArray`，`runST` 立即求值 thunk
  （token 传 0）。因此 ST 动作**不进 interp**（`test/corpus/dt_base/10_st_ref.vuna` 带
  `.nointerp`，只 `compile` + 运行）。
- **不声明 `Functor`/`Monad (ST r)` 实例**（实测）：region 以显式 binder 穿过 `runST`，
  字典提升会把字典 binder 插到显式参数之前，`runST prog` 处留下 unsolved metavar。
  region 多态代码用显式组合子 `bindST` / `pureST` / `fmapST`；`do` 留给 §2.1 的三个 monad。
- **样本**：`test/corpus/dt_base/10_st_ref.vuna`（ref + 数组，读写后求和 = 74）。

### 2.3 组合

效应组合仍是**手写**：把 `State`/`Reader`/`Error` 嵌到 `State s (Reader e a)` 这类
结构里，用各自的 handler 逐层解释；没有自动 lift、没有行/重排（§3 的阻塞）。这是
F3 之前的上限，不属于「未登记」的临时层（登记在 debt D03 / D27）。

## 3. 为什么没有通用 `Eff`（实测证据）

目标设计（`docs/roadmap.md` 的 M35.1 原意）是**签名索引的效应 monad**：
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

**结论**：M35.1 落地上表最后一列之外的可行子集（§2）；通用 `Eff` 归 F3，先答 §6 的
路线问题。

## 4. 设计规则（已实现部分）

1. **效应 = 普通 monad + handler 函数**，不引入语言级 `handle`/`perform` 语法；`do`
   只依赖 `Base.Monad` 的实例（`bind` / `pure`），Loaders 的 `do` 解糖没有第二套。
2. **handler 是解释器**：`runState` / `runReader` / `runError` / `runST` 是唯一执行入口；
   没有「隐式生效的 handler 栈」。
3. **可变数据两条边界**：`IORef` / `MArray` / `Buffer` 只能在 `IO` 动作里用；
   `Ref` / `SArray` 只能在 `ST r` 里用，且不能逃出 `runST`。两者表示同构、类型隔离。
4. **能力是权限层，不是类型豁免**：ST 的 `runIO` 使用点必须在声明了 `unsafe` 的包里；
   `base` 因此声明 `unsafe`（§6、[primitives.md](primitives.md) §7）。

## 5. 前置的编译器修复（本阶段落地）

| # | 修复 | 位置 | 回归夹具 |
| --- | --- | --- | --- |
| 1 | 检查方向构造子应用的**族参数反推**：先把期望类型 `F r1..rk` 喂进 telescope 的隐式族 binder，再检查字段（只对恒等结果索引生效，`Vec` 这类非恒等索引仍走旧路径） | `Elab/Term/Impl.vuna`（`checkAppCtorFuel` / `ctorFamilyArgs`） | `test/corpus/dt/74_ctor_check_index.vuna` |
| 2 | 实例头按**类参数 kind** 检查（旧路径 `checkType` 会拒绝 `State s : Type -> Type` 这样的头实参） | `Elab/Trait.vuna`（`elabInstanceConstrained`）+ `Elab/Term.Impl.checkTypeAtKind` | `test/corpus/dt/76_param_monad.vuna` |
| 2b | 实例头实参强制走**类型命名空间**：值位置优先查构造子，而 `record` 的构造子与类型同名（M23），`Monad (State s)` 的 `State` 会被当构造子应用（kind 错位）；`checkTypeAtKind` 在期望 kind 上应用「类型名 + 实参」，宇宙 kind 仍走 `checkType` | `Elab/Term.Impl.checkTypeAtKind` + `Elab/Term.vuna` 导出 | `test/corpus/stdlib/16_state.vuna` / `17_reader.vuna`（record 版 `Base.State`/`Base.Reader` + `do`） |
| 3 | 刚性类参数不再**无条件**跳过实例搜索：存在泛型实例（实例头自带 tele）时先搜；只有当全部实例单态时才走快速判缺失 | `Elab/Dict.vuna`（`resolveDictGoals`） | `test/corpus/dt/79_generic_monad.vuna` |

- 1 是任何「字段依赖族参数的构造子」（含 `Eff` 的 CPS 字段）能**检查**的前置；2、3 是
  参数化效应 monad 能有 `Functor`/`Monad` 实例、且能在刚性上下文里解析的前置。
- 自举：三处都在 seed 闭包内 ⇒ seed rotation；验证见 [bootstrap.md](bootstrap.md)。

## 6. F3：通用效应系统的三条路线

| 路线 | 解决什么 | 不解决 / 代价 |
| --- | --- | --- |
| **完整 QTT**（依赖 multiplicity、线性/唯一） | ST 的「句柄不复制/恰好用一次」、一次性续延（取消/超时）、线性世界令牌（`IO` 升级为正式效应）、资源安全 | **不解决**擦除依赖续延的运行时表示（§3）；类型理论 + 编译器 + base + 语法面全量改动，独立阶段 |
| **后端不透明擦除值**（`Obj.t` 类 + codegen 转换/cast） | 让 `res op` 这类「擦除依赖」位置有统一运行时表示，通用 `Eff` 才可编译 | 需要擦除纪律的运行时桥接与 cast 插入；是 codegen/runtime 工程，风险与基准重定标 |
| **运行时类型码**（Tarski `Ty`/`Tm` 上移为通用机制） | 显式携带类型信息，彻底绕开「不可命名」 | 语言层引入 type codes（当前明确不在终态）、运行时开销、与擦除判据整合 |

- 三者不是互斥：QTT 解决**作用/线性**轴，后两者解决**表示**轴。
- 建议顺序（F3 立项时决策）：先做「表示」轴的最小实验（不透明擦除值），再用 QTT 收
  线性/一次性；两者都落地后，`Eff` 与 `IO` 升格才可能进入排期。

## 7. 与 IO / 能力的关系

- **IO 不变**：`IO a` 仍是 `MkIO (Int -> a)` thunk，只在 `main` 执行；M35.1 没有把 IO
  变成效应的一层（F3 议题，见 debt D03）。
- **能力**：manifest `[capabilities].effects` 仍是权限层。M35.1 唯一的权限变化是
  `base` 声明 `unsafe`——`Base.ST` 是 base 内唯一的 `runIO` 使用点（信任点，登记在
  [limits.md](limits.md) 与 debt D27）；用户包调用 `Base.ST.runST` 不需要自己的能力。

## 8. 缺口与 debt 映射

| debt | 内容 | 归属 |
| --- | --- | --- |
| D03 | 通用签名索引效应（用户自定义 op、行/重排、深 handler 的组合）未实现；IO 未升级为正式效应 | F3 |
| D22 | 无 QTT/线性：ST 句柄可复制、多次使用、「恰好一次」未类型化；ST 无 `Monad` 实例（§2.2） | 研究储备 / F3 |
| D27 | 擦除依赖续延的运行时表示缺失（§3），三条路线见 §6 | F3 |
| D28 | `base` 的 `unsafe` 授权没有机制约束「仅 `Base.ST` 使用」 | 后续收紧 |

## 9. 非目标（本阶段明确不做）

- 语言级 `handle` / `perform` 语法、行多态、自动 lift、多射续延、用户自定义效应。
- `IO` 的效应化改造（先出设计，见 §6/F3）。
- ST 的 QTT/线性语义；ST 的 `Monad` 实例（等字典提升顺序问题解决）。
- 并发/async（M35.2）、网络/服务端框架（M35.3–M35.4）。

## 相关阅读

- 当前边界（用户可见）：[limits.md](limits.md)；标准库模块：[stdlib.md](stdlib.md)
- 原语与能力（含 `unsafe` / `runIO` / 效果原语）：[primitives.md](primitives.md) §7
- 记录 / trait / `do` 与 `Monad`：[records-traits.md](records-traits.md)
- 类型系统（擦除判据、宇宙）：[type-system.md](type-system.md)；Core 实现：[core.md](core.md)
- 自举与 rotation：[bootstrap.md](bootstrap.md)；测试标签：[testing.md](testing.md)
