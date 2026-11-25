# 效应：Eff 统一动作、handler 与宿主层

**现状**：用户面唯一动作类型是 `Eff r a`（`Base.Effect.Core`，构造子不导出；`MkEff` 是内部表示），
入口是 `main : Eff [] a`（行必须为 `Nil`），执行入口是 `Base.Effect.Core.runPure`。宿主原语只有
`prim_eff_*`（`Eff []`）；宿主层就是直接调用这些原语（任何包都可直调），
Int/Nat 归一化只留在 `Base.Effect.Core.*` handler 的结果索引（`Print`、`WriteFile`/`FileSize` 返回
`Nat`，直接调用原语得到 `Int`）。所有宿主 handler 的 answer 是 `Eff []`，入口组合是
`runX = joinEff (handleXHost …)`。用户面
执行一个已处理干净的动作用 `runPure`；`IORef` 的实现也是 `Eff []`。

运行时核心（§8）：OCaml 5 一次性 delimited continuations + 开放行 + 命名实例 +
一阶效应（`Base.Effect.Core` / Reader / State / Fs / Console / Clock / Env / Process / Stdin /
Args / Exit）；`Member` 行约束、`local`/`catch`/scoped `Exn`、线性续延与一次性闭包
（`mkCont`/`resumeCont`）、通用 `bracket`（含非 `Exn` abort cleanup）、单线程 fiber
调度器（`Base.EffSched`：`forkTask`/`awaitTask`/`yieldNow`/`cancelTask`/`cancelScope`/
结构化 `withScope` + 步数超时）。学习路径：写程序看 §2–§3；表示层看 §5；
运行时核心看 §8。

## 1. 范围

- **本页覆盖**：`Eff` 统一动作的表示/执行、handler 与 `Eff []` answer、宿主层（直接调用 `prim_eff_*`）、
  宿主层直调纪律、通用 Eff 的边界。
- **不覆盖**：原语/宿主层的逐条语义（[primitives.md](primitives.md) §7）；纯效应 monad
  （`Base.Effect.Pure.State` / `Reader` / `Error`，它们不碰宿主，见 [stdlib.md](stdlib.md)）；
  并行/多核与 Domain 内存模型（只有单线程调度器，见 §8.5）；完整 QTT。

## 2. 动作类型与宿主层

### 2.1 身份与表示

| 项 | 值 |
| --- | --- |
| 用户面动作类型 | `Eff : Row -> Type -> Type`（`Base.Effect.Core` 的 data；行是 Type-1 擦除索引） |
| 表示 | 装箱 data：`MkEff : (EffUnit -> a) -> Eff r a`；`MkEff` 不导出，用户经 `pure`/`do`/`>>=`/handler 构造与消解 |
| main 入口 | `main : Eff [] a`；钩子 `dtp_sched_main (fun () -> Base.Effect.Core.runPure v_main)` |
| 执行 | `runPure : Eff [] a -> a`（行必须 Nil；运行时 `runThunk` 应用 dummy 令牌） |
| 行 | `Row` / `(::)` / `Nil` + `Member`；实例名并进标签 `Named`；handler 用 `rowRem` 删行，运行时按 `(key, name)` 路由 |

- `main : Eff [] a` 的**行检查在类型期**：entry 处仍有未处理行报
  `TC_UnhandledEffects`；核心求值路径遇到动作入口报
  `[CG_InterpCannotExecuteEffects]`（纯核心求值器只跑纯 main）。
- **入口只认默认实例**：entry 预装的 `runXHost` 只删除 `Named "default" …` 条目，所以 `main`
  行里留命名实例（`Eff [ConsoleOp@mock] Int`）报 `TC_EntryInstanceNotDefault`，不拖到运行期
  `unhandled effect`。命名实例必须在进 main 之前被 handler 消掉（夹具
  `dt_err/112_entry_instance_not_default`、`dt_base/93_eff_named_row_handled`）。
- `Eff []` 不表示「无副作用」：它表示「无未处理的行效应」；宿主层构造的叶子里可以
  有真实宿主操作。宿主副作用没有 manifest 能力/特权门控；用户面应经
  `Base.Effect.Core.*` 标签 + handler 使用效果（纪律/文档约定，见 §8.6）。
- **动作入口**：`IEffRow`/`IRowCons`/`IGlobal` 行 IType、隐藏
  `Base.Effect.Core.runMain`、`rowAppend` 行拼接与 `joinEff` 泛化、`builtinEffects` 表、entry
  按 main 行自动嵌套 `runXHost`；Console/Fs/Clock/Env/Process/Exit/Stdin/Args/Net 有带行
  handler（Net 另带 `net-error` 收口），Ref 只允许行、不需要 handler（`beImpl=""`）。
  表项同时带直连分类（`HostClass`：`HostHandled` / `HostDirect` / `HostAbort`），
  entry 预装与 wasm 的静态直连改读同一张表；夹具 90–94。`runPure` 只收 Nil
  （纯性负例：`runPure (consolePrint ...)` → `TC_UnhandledEffects`）。
- **编译器与工具链的 IO 走 labeled 效应**：叶子统一用 `Base.Effect.Core.*` labeled sender
  （`consolePrint` / `fsReadFile` / `processSpawn` / `clockNow` / `envGetEnv` …），签名按
  实际用到的标签写 `Member nX XOp r`（`nX` 可省略，由精化器补隐式实例名）；纯逻辑保持纯，
  `Eff []` 只用于确需空行的动作，`main` 写具体行字面量（`Eff [FsOp, ConsoleOp, …] Int`）。
  `forkTask` 行泛化、任务体 `runEff` 执行（Sched 仍是 `Eff []`）。`Base.Effect.Types` 只重导出
  类型面（`Eff` / `Row` / `Named` / `Member` / `EffUnit`，不含 `Row(..)` 构造子），避开与
  `List` 的 `(::)` 重载；`Base.Effect.Pure.IORef` 是行多态的本地可变存储（调用方不需要额外的行约束）。
- **宿主原语**：`@vuna@prim_eff_*`（隐藏，`visible = False` + Lexer 的 `@vuna@` 内部名规则，
  源码写不出可见名），eff-boundary 守卫检查「可见宿主原语名不得出现在源码」。

| 层 | 类型/入口 | 说明 |
| --- | --- | --- |
| 用户面 | `Eff r a` + `Base.Effect.Core.*` 标签/handler | 用户包与 ad-hoc 的唯一动作类型；`main : Eff [] a` |
| handler 层 | entry 自动预装的行 handler（`@vuna@` 内部名） | 用户面写不出 handler 名字；`main` 行有内建标签时由编译器嵌套预装 |
| 宿主层 | `@vuna@prim_eff_*`（隐藏 intrinsic，源码写不出） | 直接调用即得 `Eff []` 动作；Int/Nat 归一化只在 Eff handler 的结果索引；没有 manifest 能力/信任门控 |

- **代数**：`Monad (Eff r)` / `Applicative` / `Functor` 实例已内建；用户用 `pure` / `do` /
  `>>=` / `fmap`，动作的构造入口只有这些实例方法。
- **宿主层边界（无 manifest 门控）**：`vuna.toml` 没有 `[capabilities]` / `[trust]` /
  `[privileged]`；任何包（用户包、ad-hoc 文件）都可以直接调用
  `prim_*` / `prim_eff_*`（`Eff []` 叶子）。用户面**应**经 `Base.Effect.Core.*` 标签 + handler 使用
  效果——这是纪律/文档约定，不是编译器强制。`prim_*` / `prim_eff_*` 是宿主层/底层原语，
  base 的 Eff handler、编译器与根工具链内部直接使用它们。显式接受的损失见 §8.6
  （登记在 [debt.md](debt.md) D62）。
- **错误报告**：没有异常 / handler 层之外的语言级异常；未捕获的宿主异常由生成的 main 钩子
  统一报告为 `vuna: runtime error: ...` + 位置帧 + exit 2（见 [debugging.md](debugging.md)）。
  `log!` / `dbgShow` / `assert` / `todo` 是语言级调试构造，不参与效应系统。

## 3. 没有 transformer 栈

状态 / 环境 / 错误用 `Base.Effect.State` / `Base.Effect.Reader` / `Base.Effect.Error`（高阶作用域错误
用 `Base.Effect.Exn`）；没有 `MonadIO` 式的 `Base.Effect` 能力类、
`Base.StateT` / `Base.ReaderT` / `Base.ErrorT`，也没有 `Base.EffAsync`。纯表示版本
`Base.Effect.Pure.State` / `.Reader` / `.Error` 与 handler 版并存，二者不互相派生。

## 4. 局部可变：命名句柄，没有 region/ST

`Base.ST`（region 隔离的局部可变、`ST r a` / `Ref` / `SArray`）不存在：局部可变走
`Base.Effect.{MutableRef,MutArray,MutBuffer}` 的**命名句柄**（编译期名字绑定，
见 §8.8–§8.10），没有可逃逸的 region 令牌。语言保留 `linear record` / `linear data` 与 QTT 规则。

## 5. 表示轴：不透明擦除值

当前表示是**结果索引的效应行**：`Eff r a` 只是擦除后的 thunk；op 族以结果类型为最后
索引（`ConsoleOp : Type -> Type`），`perform o` 的结果 = `o` 的索引；handler 形如
`(i : Type) -> (o : f i) -> (resIdx i o -> b) -> b`。

- **为什么还需要 `resIdx`**：handler 对每个构造子要拿到不同的续延域（`Print` 是 `Nat`、
  `EPrint` 是 `Int`）。直接写 `i -> b` 时，OCaml 会把同一个 `k` 单态化成第一个分支的
  `i`（普通 variant 没有 GADT 收窄），生成的 `.ml` 在其它分支类型错。
- **做法**：`resIdx i o`（`resIdx i o = i`）在类型层可归约到分支索引，但它的类型头是
  类型族定义 → codegen 按「不可命名的运行时类型」处理，续延域渲染成 `Obj.t`/恒等 cast。
  这与旧 `res` 族的表示机制相同，只是现在只有一个索引投影，不再每个效应写一份结果族。

| 位置 | 表示 | 机制 |
| --- | --- | --- |
| data 构造子字段（声明位置） | `Obj.t` | 字段类型里出现「不可命名的运行时类型」时，整个字段渲染成不透明值 |
| 构造子实参 | `(Obj.magic arg)` | `Lowering.Program` 在 kept 位置插 `IrCast`，`Target.Ocaml.Render` 渲染成 `Obj.magic` |
| binder 使用（表达式位置） | `prim_erase`（隐藏 intrinsic，运行时 `%identity`） | 精化器在每个使用点包 cast；求值期 `OpIdentity` / `applyValueFuel` 直接消去 |

**判据（elab 与 codegen 同源，`Elab.Meta.valueOpaqueScoped`）**：运行时类型不可命名 ⇔
类型头不可表示：
- 全局类型头既不是数据族、也不是 `Int` / `String` / `Array` / `IORef`
  （即类型族定义 / axiom / 未知全局；`resIdx`、`sigOf` 属于这一类）；
- 或**类型族参数**：kind 的 Pi 链里出现非宇宙域（`m : Type -> Type` 这类普通类型构造子
  参数**不算**，所以字典方法字段 / base 泛型代码不受影响）；
- 数据族的**索引值实参**（`Vec (Succ n) a` 的 `Succ n`）是擦除后的索引，不参与判定；
- 已知边界：精化期未解的元变量按可表示处理（可能漏 cast）；trait 自动生成的 λ
  （方法投影 / 实例 tele）不在插入点覆盖范围内（[debt.md](debt.md) D27）。

**注意这不是 QTT 能解决的**：续延是**真的运行时函数**（要被 handler 以真实值调用），
`resIdx i o` 是类型级、按擦除纪律 0 用量、在 OCaml 里不可命名；QTT 只把 0/1/ω 用量写精确，
不会让 OCaml 写出它的静态类型。表示轴用「不透明值 + 恒等 cast」绕开它。

依赖擦除类型的旧 CPS 编码仍由 `packages/compiler/test/corpus/dt/82_eff_cps.vuna` / `83_eff_cps_two_instances.vuna` /
`84_eff_cps_result.vuna` 覆盖；它们验证同一套不透明值机制。

**结论**：表示层的阻塞已消除；剩余边界见 §9 与 [debt.md](debt.md)。

## 6. 通用效应系统的三条路线

| 路线 | 解决什么 | 不解决 / 代价 |
| --- | --- | --- |
| **完整 QTT**（依赖 multiplicity、线性/唯一） | 线性 record 的「句柄不复制/恰好用一次」、一次性续延（取消/超时）、线性世界令牌 | **不解决**擦除依赖续延的运行时表示（§5）；类型理论 + 编译器 + base + 语法面全量改动 |
| **后端不透明擦除值**（`Obj.t` 类 + codegen 转换/cast） | 让 `resIdx i o` 这类「擦除依赖」位置有统一运行时表示，秩二 handler 续延才可编译 | 声明位置 `Obj.t`、表达式位置恒等 cast（§5）；残留边界见 [debt.md](debt.md) D27 |
| **运行时类型码**（Tarski `Ty`/`Tm` 上移为通用机制） | 显式携带类型信息，彻底绕开「不可命名」 | 语言层引入 type codes（当前明确不在终态）、运行时开销、与擦除判据整合 |

- 三者不是互斥：QTT 解决**作用/线性**轴，后两者解决**表示**轴。
- 当前采用「表示」轴的不透明擦除值；QTT 的线性/一次性缺口见 [debt.md](debt.md) D22。

## 7. 设计规则

1. **Eff 是唯一动作类型 + 内建代数**：`pure`/`do`/`>>=` 来自 `Functor`/`Applicative`/`Monad (Eff r)` 实例；
   用户面动作由实例方法构造；`joinEff` 展平 handler answer，`runPure` 执行。
2. **handler 是解释器**：`runPure` 是唯一的执行入口；`runConsole` / `runFs` 等是
   handler（answer 为 `Eff []`，由 `joinEff` 组装），本身不执行动作；没有「隐式生效的
   handler 栈」。
3. **可变数据边界**：`IORef` 的公开操作与实现都是 `Eff []`；没有局部可变的 region 形式
   （重建约束见 [debt.md](debt.md) D63）。
4. **宿主层是底层原语面，不是类型豁免**：`prim_effectPerformId` / `prim_effectHandleId` /
   cleanup/sched 是宿主层原语，常规用户面经 `Base.Effect.Core.*` 标签 + handler 使用效果；没有
   `unsafe` 能力位或 `[trust]` 定义级清单（[debt.md](debt.md) D62）。
5. **效应组合显式**：transformer 的 handler 必须显式调用；没有自动 lift 到任意深度。
6. **不透明擦除值的表示与 cast 由同一份判据驱动**：`Elab.Meta.valueOpaqueScoped` 与
   `Lowering.Env` 的 `isTypeHeadOpaqueDatas` / `ctorOpaqueFlagsOf` 必须同步；
   `Obj.t` 字段 ↔ `prim_erase` / `Obj.magic` 两侧缺一就会在 `ocamlopt` 处错配。
7. **cast 对语义透明**：`prim_erase` 求值期归约为实参本身（`OpIdentity` +
   `applyValueFuel` 的恒等消去），对定义性相等 / 正规化 / 核心求值不可见；用量检查里
   cast 应用记 `Rig1`，不放大线性值的使用。

## 8. 运行时效应核心

**OCaml 5 运行时续延 +
开放行 + 命名实例 + 一阶效应**。它不使用 CPS 编码，`Eff` 只是抽象动作；控制由
`Effect.Deep` 捕获。

### 8.1 表示

- `Row` 是 Type-1 数据，条目是**效应标签类型**：`Nil` 是空行，`(::) : Type -> Row -> Row`
  是「标签 + 尾行」。行只是擦除索引，不进入运行时值。
- **实例名并进标签**：`Named : String -> Type -> Type`，行条目就是 `Named n e`
  （`Named "audit" ConsoleOp`）。
- **列表字面量通用展开**：parser 把 `[]` / `[e1, e2]` 解析成保留名
  `@vuna@list@nil` / `@vuna@list@cons`（不是构造子名字解析）；精化器按**期望族**的短名
  `Nil` / `(::)` 展开（`List`、`Vec`、`Base.Effect.Core.Row` 与用户自定义同形族都走这一条），
  期望族未知时默认 `Base.Data.List.List`。因此在**期望 kind 为 `Row`** 的位置 `[Fetch]` 展开为
  `Named "default" Fetch :: Nil`（裸标签补默认名），`[]` 展开为
  `Base.Effect.Core.Row.Nil`；`Vec n a` / 用户自定义的 `Nil`/`(::)` 族同样适用。模式
  `[]` / `[a, b]` 按 scrutinee 族逐层展开（`Elab/Term/Impl` 的
  `listLitElems`/`expandListLit` 与模式解析器），parser/AST 不需要区分类型/项位置。
  夹具 `dt_base/45_eff_row_sugar`、`dt_base/54_list_literal_families`。
- **标签 = op 族应用**（D2）：`ConsoleOp`、`StateOp Nat`、`ReaderOp Int`、`FsOp`…；
  没有闭合的 `data EffectLabel`，新增效应不需要改中央表。scope 族的 `Try` 字段是 `Scoped a`（标签仍是普通 `Named n ExnOp`）。
- **实例名是标签里的 String**：行条目 `Named "counter" (ReaderOp Int)`；运行时按
  `(key, name)` 的字符串相等找 handler（name 仍作为隐式 String 传给 send/handle）。
  库不定义固定实例名枚举，使用方自选名字（同一效应族同时安装的实例名必须互不相同）。
  裸标签 = 默认名 `"default"`；显式名用 `[Op@audit]`、`Named "audit" Op`，列表字面量里
  也可直接写 `[Named "audit" Op]`（条目已是 `Named` 时不再套默认名）。
- `Eff r a` 构造子不导出；内部是私有 dummy thunk（`EffUnit -> a`），
  **没有世界令牌**；dummy 只为延迟执行。
- `Member : Type -> Row -> Type 1` 是归纳族（`Here`/`There`），索引是**行条目**（标签，
  可为 `Named n e`）。effect wrapper 用 `Member n e r =>` 签名糖（内部为
  `Member (Named n e) r`，生成隐式 String 名 + `Rig0` 证明 binder）；精化器按行结构构造证明
  （定义级 ctx 收尾），调用点默认名 / `@name` 覆盖。
- `rowRem : Type -> Row -> Row` 去掉一个标签条目（`rowRem (Named "audit" ConsoleOp) r`）；
  它不是类型族，由编译器按标签类型值结构相等归约（重复绑定名/非线性格不受支持：parser 直接报
  `PS_RepeatedPatternBinder`，见 language.md）。归约前对条目（含 `Named` 的名字与标签一层
  spine 实参）做一次 `force`：解表不改写已构造好的 value，已解 meta 在结果行里仍是
  `VMeta` 节点（`handle` 语法依赖这条才让结果行归约掉）。

### 8.2 运行时

- `Vuna_runtime` 声明 `type _ Effect.t += Perform : int * int * string * string * Obj.t -> Obj.t Effect.t`（前两个字段是派发 id，后两个是展示名）。
- 隐藏 intrinsic `prim_effectPerformId` / `prim_effectHandleId` / `prim_effectSelf`（宿主层原语，常规只由
  `Base.Effect.Core` 包装使用；没有 `unsafe` 门控）：
  - `perform` → `Effect.perform`；
  - `handle` → `Vuna_runtime.dtp_effect_handle`：`Effect.Deep.match_with`，按
    `(keyId, nameId)` 过滤（`effectId` 折叠/哈希出整数）；不匹配返回 `None` 交给外层 handler；`retc` 应用 handler 的
    `ret`；`continue` 一次。handler 退出（正常 / 异常 / abort 丢弃续延）时执行该
    extent 内未弹出的 bracket cleanup。
  - `self` → `Vuna_runtime.dtp_effect_self`：在 opH 执行期间把当前
    `(key, name, ret, opH)` 压进 Domain 局部的 self 栈；它用同一 handler 重跑子计算。
    `Base.Effect.Core.Scoped a` 是 op 里的一等子计算值（行只在 `scope` 处检查一次，之后擦除），
    handler 用 `handleScoped` 运行它（`handleSelf` 是 `handleScoped ∘ scope` 的便捷形式）。
    三端同语义（OCaml/WASM/Native）。
- cleanup 机制：`prim_cleanupPush` / `prim_cleanupPop`（隐藏）登记/
  弹出每纤程 cleanup 栈（`dtp_cleanup_*`）；`Base.Effect.Core.bracket`/`finally` 用它保证
  非 `Exn` abort 也跑 release（细节见 [effects-layers.md](effects-layers.md)）。
- 语义是**一次性（one-shot）**：resume 两次抛 `Continuation_already_resumed`；
  多射续延不做。
- 未处理的 `Perform` 由 `main` 钩子的异常报告器兜底（`vuna: runtime error: ...`）。
- 核心求值路径是纯求值器，不执行运行时效应；效果程序只能 `check` + `compile` + run
  （测试夹具关闭 interp 阶段，只做 compile + run）。

### 8.3 效应模块

| 模块 | 内容 |
| --- | --- |
| `Base.Effect.Core` | `Row(..)`、`Named`、`Eff`、`Member(..)`/`rowRem`、内建 `Functor`/`Applicative`/`Monad (Eff r)`（`do`/`>>=`/`>>`，不提供 `bindEff`/`pureEff`）、`sendCore`/`handleCore`/`handleCoreLin`、`handleWith`/`handleWithAt` + `EffSig`/`sigFn`/`sigOf`/`resIdx`（`handle` 语法的两个降级目标：handler 类型显式、效应签名作擦除量；行首条目版用于 comp 行未具体化）、`Cont`/`mkCont`/`resumeCont`、`bracket`/`finally`、`weaken`、`joinEff`/`raise`、`runPure` |
| `Base.Effect.Reader` | `ReaderOp s` + `Ask`；`ask`/`handleReader`；实例名并进标签（`Named "counter" (ReaderOp Int)`） |
| `Base.Effect.State` | `StateOp s` + `Get`/`Put`；`get`/`put`/`handleState`（answer `s -> Pair a s` 线程状态） |
| `Base.Effect.MutRef` | 命名可变单元（原地读写，不是状态线程化）：行条目 `Named n (MutRefOp a)` 是唯一语言级表示；`withMutRef n init body` 引入单元、`withMutRefPure` 是纯端点；`read`/`write` 的实例名是隐式 `String`（`read@x` 消歧）。没有句柄值，单元只在编译期名字→运行时参数绑定里存在：精化器把调用改写成 `@vuna@mrefReadOp`/`@vuna@mrefWriteOp`，签名里出现具体 `MutRefOp` 条目时自动补 `{@vuna@cell@n : Cell a}` 参数（跨函数传递）。逃逸由 `Member` 约束挡住（闭包进更窄行 → 无实例），`withMutRef` 结果行删掉条目。见 §8.8 |
| `Base.Effect.Fs` | 宿主-backed Fs 效应（完整 fs 面；标签 `FsOp`，实例名并进标签，如 `Named "real" FsOp`）：`ReadFile`/`ReadFileRange`/`WriteFile`/`WriteFileAtomic`/`ReadDir`/`IsDirectory`/`MakeDir`/`RemoveFile`/`FileExists`/`FileMtime`/`FileSize`（结果索引在构造子上）；`fsReadFile n`/`fsReadFileRange n`/`fsWriteFile n`/…/`fsFileCursor`（按块读文件，配 `Base.Effect.Cursor`）/`handleFs n`（泛型）/`handleFsHost n`（answer `Eff []`，`runFs = joinEff ∘ handleFsHost`）；真实 handler 用 `@vuna@host@try*` 原语（`WriteFile` 的结果索引是 `Nat`），宿主失败抛 `FsErrorOp`，`runFsError` 可局部收成 `Result`；`fsFileSize`/`fsFileMtime` 返回 `Maybe`（取不到 = 无值，不是 0）；mock/real 可并存（`dt_base/40`） |
| `Base.Effect.Console` | console 标签 `ConsoleOp`（实例名并进标签，如 `ConsoleOp@mock`/`ConsoleOp@real`）：`Print`/`EPrint`；`consolePrint`/`consoleEprint`/`handleConsole`/`handleConsoleHost`（真实 handler 用 `prim_eff_print`/`prim_eff_eprint`，`Print` 的结果索引是 `Nat`）；写失败（EPIPE 等）返回 0、不崩进程 |
| `Base.Effect.Clock` | clock 标签 `ClockOp`：`Now`（微秒时间戳）/`SleepMicros`；`clockNow`/`clockSleepMicros`/`handleClock`/`handleClockHost`（真实 handler 用 `effTimeUs` 与编译器原生 `prim_eff_sleep`） |
| `Base.Effect.Env` | env 标签 `EnvOp`：`GetEnv`/`GetCwd`/`ExecPath`；`envGetEnv`/`envGetCwd`/`envExecPath`/`handleEnv`/`handleEnvHost`（真实 handler 用 `prim_eff_getenv`/`prim_eff_getcwd`/`prim_eff_execPath`） |
| `Base.Effect.Process` | process 标签 `ProcessOp`：`Args`/`Exit`/`RunIn`；`processArgs`/`processExit`/`processRunIn`/`handleProcess`/`handleProcessHost`（真实 handler 用 `prim_eff_getArgs`/`prim_eff_exit`/`prim_eff_runIn`）/`handleProcessHostWith`（自定义 `onExit`）/`handleProcessHostObserved`（`Exit` 可观察、不退出）；启动失败（cwd 不存在 / 权限）抛 `ProcessErrorOp`，`runProcessError` 可局部收成 `Result`；子进程非零退出码仍是**值** |
| `Base.Effect.Error` | `ErrorOp` + `throw`/`handleError`/`runError`/`catch`（作用域 catch） |
| `Base.Effect.Exn` | scoped Error：`ExnOp : Type -> Type`，`Try` 携带 `Scoped a`；`tryWith`/`runExn`/`catchExn`/`bracketExn`；`handle` 语法可直接写 Exn（`Try sub k -> k (handleScoped sub)`） |
| `Base.EffMutex` | Mutex/Semaphore（IORef + yield 忙等）：`acquire`/`release`/`semWait`/`semSignal` |
| `Base.EffChannel` | cooperative Channel：`send`/`tryRecv`/`recvWait` |
| `Base.EffSched` | 单线程 fiber 调度器：`Task`/`Scope`/`TaskLin` + `forkTask`/`forkTaskWith`/`forkTaskLin`/`awaitTask`/`awaitTaskLin`/`yieldNow`/`cancelTask`/`cancelTaskLin`/`cancelScope`/`scopeWait`/`scopeWaitTimeout`/`withScope`/`withScopeTimeout`/`isCancelled`/`raise`；任务行 `Nil`，超时按逻辑步数 |

夹具：`dt_base/16`（两个 Reader 实例嵌套 handler）、`17`（State 状态线程）、
`18`（宿主-backed Fs 真实读写，实例名 `"real"`）、`20–21`（local/catch）、`23`
（scoped handler）、`24–25`（线性续延 / bracketExn）、`26–30`（mock↔real 对拍）、
`31–36`（调度器：fork/await、取消、超时、监督、重复 await、Channel）、`37–39`
（Mutex、线性 TaskLin、effect-aware forkTaskWith）、`40–41`（fs 命名实例 /
process 可控 Exit）、`42–44`（通用 bracket abort cleanup、调度器 bracket、一次性闭包）、`45`（行语法糖）；
负例 `dt_err/70–81`；原语探针夹具 `packages/10_prim_io`（`prim_eff_sleep`）。
细节见 §8.6 与 [effects-layers.md](effects-layers.md)。

### 8.4 已知边界

- **行成员约束**：`Base.Effect.Core.Member` 是 Type-1 归纳族（`Member e r`，索引 `e` 是行条目，
  可为 `Named n e0`）；effect wrapper 可用 `Member n e r =>` 签名糖（内部即
  `Member (Named n e) r`；定义里也可写显式 `{w : Member (Named n e) r}`）；精化器在应用处按行结构构造 `Here`/`There`，无法当场判定的目标
  延迟到**定义体结束**、用定义级 ctx 收尾（可命中 wrapper 的局部证明 binder），缺效应
  报 `TC_NoInstanceFound`（负例 `dt_err/70_effect_missing`）。
  不走 trait 重叠实例（trait 版 `Member` 需要头可合一的重叠实例，已决定不计划；
  行成员约束也不需要它）；`sendCore`/
  `handleCore` 本身不带证明，属于信任边界内的核心原语。
- **自动行 lift**：`checkByInferFuel` 在 conv 失配时调用独立 `tryEffLift`：
  期望形如 `Eff (label :: tail) a`、实际结果行与 `tail` 相等时，直接合成
  `Base.Effect.Core.weaken {label}{r}{a}` 应用（不 re-check，避免与 `checkByInferFuel` 形成 SCT
  互递归）；`weaken` 不在作用域或期望是 `Eff []` 时不触发（后者仍报 `TC_UnhandledEffects`）。
  夹具 `dt_base/72_eff_auto_lift`。只在 check 方向；不会自动重排/合并行。
- **行删除**：`rowRem` 是公理 + 编译器按标签类型值结构相等归约；
  不能写成类型族（重复绑定名的模式会被 parser 以 `PS_RepeatedPatternBinder` 拒绝，
  见 language.md）。归约前对条目（含 `Named` 的名字与 label 一层 spine 实参）先 `force`，
  让已解 meta 参与比较；未解 meta 仍卡住（`Core/Eval.rowRemReduce`）。
- **`Monad (Eff r)`**：`Base.Effect.Core` 声明 `instance Monad (Eff r)`，实例方法直接构造
  私有 `MkEff`（实例 tele `r : Row` 由 `Eff` 构造子 kind 推断）；import `Base.Effect.Core` 后可直接用
  `do` / `>>=` / `>>`，不提供 `bindEff` / `pureEff` 专用组合子。`do` 在行 `r` 上单子化，
  handler 仍显式解释；纯行用 `runPure` 收尾（夹具 `dt_base/19_eff_monad` 覆盖
  `do`/`>>=`/`>>`/`bind`）。行多态实现（`bracket`/`withScope`）同样用 `do`：延迟字典目标
  在 `resolveRowGoalsCtx`（带 ctx 的收尾点）里、行成员解出后重新搜索实例，因此静态字典
  在定义体结束时即可求出（见 type-system.md「延迟字典目标」）。
- **长 do 链**：程序级字典目标求解是单趟 worklist（`Dict.resolveDictGoals` 每个目标
  每趟只处理一次），指数已消除：20 步纯 `Eff []` do 约 100ms、10 层 `Result >>=` 约 77ms、
  20 层 `>>=` 约 77ms（`packages/compiler/test/corpus/elab_perf/` 夹具）。期望结果类型定向走前导隐式前缀后
  early solve 残余结果；do 块按块共享一个 monad/字典。编译器内部用限定 `Base.Common.bind`
  （固定类型的内部选择，不是兼容层）。行多态 `Eff r` 的 `do` 不受影响。
- **一阶效应核**：普通 send op 不含子计算；`Base.Effect.Exn.Try` 支持携带子计算，
  `bracketExn` 提供 Exn 路径的 cleanup；通用 `Base.Effect.Core.bracket`/`finally` 用运行时
  cleanup 栈覆盖**任意效应 abort**（handler 丢弃续延），见 §8.5 与 effects-layers.md。
- **并发/async**：单线程调度器见 `Base.EffSched`（§8.5）：协作式
  `forkTask`/`awaitTask`/`yieldNow`、取消（含清理宽限）、结构化 `withScope`、步数超时；
  并行/多核（Domain）不是本层目标（[debt.md](debt.md) D41）。
- **未处理效应诊断**：入口在类型层收紧——`runPure : Eff [] a -> a`；
  `load` 处 `joinEff`/`runPure` 要求行 `Nil`，因此入口处的未处理效应是**类型错误**，并报专门的
  `TC_UnhandledEffects`（列出具体标签；负例 `dt_err/82_unhandled_effect_entry`）。
  运行时兜底保留：main 钩子识别 `Effect.Unhandled (Perform (key,name,_))`，报告
  `unhandled effect key (instance name)`（`name` 是 String 实例名；`packages/compiler/test/corpus/run_err/04_unhandled_effect`）；任务内
  的未处理效应经 `awaitTask` 的 `Err` 返回同一条消息。剩余：`runEff` 内部信任入口
  （库内路径）接受任意行（[debt.md](debt.md) D37）。

### 8.5 高阶 / 调度器

高阶/作用域误差、线性续延/一次性闭包/`bracket`、单线程调度器与效应标签的语义见
[effects-layers.md](effects-layers.md)。核心边界：`Try` 子计算 + scoped
handler；`Cont` resume-once（`mkCont`）+ `bracket` 的 abort cleanup；
fork/await/yield/cancel/结构化 scope；console/clock/env/process/fs 标签（库层）。


### 8.6 效果进类型

行只描述、不授权：没有类型级能力行；宿主层对任何包可见，用户面经 handler（约定）。
续延是一次性（one-shot）。

- **协议集中**：`Base.Effect.Core.{Row,Nil,(::),Named,Member,Here,There,rowRem}` 的名字集中在
  `Vuna.Compiler.Base.Intrinsics` 的效果协议常量（`effRowFamilyName` / `effNamedName` /
  `effMemberFamilyName` 等）；`Core/Eval`、
  `Elab/Dict` 的行删除归约与 `Member` 证明构造只引用常量，不再各自硬编码名字。
- **入口收紧**：`runPure : Eff [] a -> a`（行必须 `Nil`）——入口处的未处理效应是类型错误
  （负例 `dt_err/82_unhandled_effect_entry`），运行时 `unhandled effect` 兜底只服务
  库内部路径。
- **专门诊断**：`Elab/Term/Impl.checkByInferFuel` 在「期望行 `Nil`、实际行具体非空」时报
  `TC_UnhandledEffects` 并列出标签，而不是裸 `TC_TypeMismatch`。
- **宿主层无门控（显式接受的损失）**：没有 `[capabilities]` / `[trust]` / `[privileged]`
  与宿主模块 import 门控——任何包（用户包、ad-hoc 文件）都可以直调
  `prim_*` / `prim_eff_*`；没有每包原语白名单、`unsafe` 定义级审计，也没有
  REPL `--privileged`。用户面仍**应**经 `Base.Effect.Core.*` 标签 + handler（`runX =
  joinEff (handleXHost …)`）；这是纪律/文档约定，不是强制门控。缺口见
  [debt.md](debt.md) D62。
- **base 宿主层直接使用点（安全审计参考，不是强制约束）**：13 处——
  `Base.Effect.Core.sendCore`、`Base.Effect.Core.handleCore`、`Base.Effect.Core.bracket`、
  `Base.EffSched.yieldNow`、`Base.EffSched.isCancelled`、`Base.EffSched.newScope`、
  `Base.EffSched.forkTask`、`Base.EffSched.awaitTask`、`Base.EffSched.cancelTask`、
  `Base.EffSched.cancelScope`、`Base.EffSched.scopeWait`、`Base.EffSched.scopeWaitTimeout`、
  `Base.EffSched.forkTaskLin`。
- **单效应组合子与自动 lift**：`runConsole`/`runFs`/`runEnv`/`runClock`/`runProcess`
  组合子；check 方向的自动 lift 见 §8.4（`tryEffLift`）。

高阶效应类型是非目标（见 §10）。语言级 `perform`/`handle` 语法在
`Base.Effect.Core.performCore` / `handleWith`/`handleWithAt`（参数化 op 族 State/Reader 两种语法
都支持），语法与边界见 [native-effects.md](native-effects.md)。

### 8.7 宿主失败：typed error + 入口收口

宿主操作会失败，失败分四类，**落点不同**：

| 语义 | 载体 | 例子 |
| --- | --- | --- |
| 正常值 | `a` | 读到的文件内容、子进程退出码 |
| 无值（正常流程的一部分） | `Maybe a` / `Bool` | `fsFileExists`、`envGetEnvNonEmpty`、`fsFileSize`/`fsFileMtime`、stdin 的 EOF |
| 可恢复的失败（控制流） | **行里的 typed error**（`FsErrorOp` / `ProcessErrorOp`） | 文件不存在、权限不足、磁盘满、cwd 不存在 |
| 不变式破坏（bug） | 崩溃（exit 2 + 报告器） | 越界、未处理效应、内部句柄非法 |

机制（三段）：

1. **运行时**：`@vuna@host@try*` 原语不抛宿主异常，而是把失败码写进 Domain 局部的
   状态槽（`@vuna@prim_eff_hostStatus`，0 = 成功），返回默认值。异步任务跨 Domain，
   所以用 `Domain.DLS` 而不是全局 ref。
2. **base handler**：真实 handler 读状态槽，失败时 `fsFail` / `processFail` 往行里抛
   `FsErrorOp` / `ProcessErrorOp`（abort 语义，不恢复续延）。**调用点签名不变**：
   `fsReadFile p : Eff r String` 不需要解包，只有想恢复的地方才在签名里加
   `Member n FsErrorOp r` 并 `runFsError n` / `catch`。
3. **entry 收口**：`Lowering` 在内建 family handler 之后追加
   `runFsErrorHost` / `runProcessErrorHost` / `runNetErrorHost`（左折 → 最外层），打印
   `vuna: <family>: <op> <上下文>: <原因>`（例如 `vuna: fs: writeFile /x: permission denied`）
   并以**退出码 1** 结束（可恢复失败）；exit 2 留给不变式破坏与未处理效应。
   错误载荷带操作名与路径 / 句柄，所以文本能定位「哪个操作、哪个对象」。

   **为什么没有源码位置帧**：typed error 在 effect handler 里抛，用户函数编译成 `Eff`
   闭包并由调度器经尾调用重的 bind/joinEff 链执行——`get_callstack` / 异常 backtrace
   都只剩运行时与 base 帧（用户 def 的帧不进栈）。要给出调用点只能给每次宿主操作付
   栈捕获的代价，且仍拿不到用户帧；因此收口只给操作上下文。崩溃路径（`dt_report_exn`）
   仍有源码帧，因为它走普通异常栈。
`collectBuiltinRowTags` 不需要认识错误标签：错误只出现在 family handler 的
answer 行里（`[FsErrorOp]`），entry 靠 family 标签决定装哪些收口 handler。

「无值」永远进 `Maybe`，不进错误通道：`fsFileSize` / `fsFileMtime` 取不到给 `Nothing`，
stdin 的 `stdinReadLine` / `stdinReadBytes` 到 EOF 也给 `Nothing`（空行是 `Just ""`）。
console 的写失败（典型 EPIPE：`vuna … | head`）不是宿主错误：原语返回 0 并停止输出，
不崩进程。

夹具：`dt_base/85_fs_error`（mock 抛 → `runFsError` 收成 `Result`）、
`steps/111_host_error`（真实 handler：fs 缺失 / process cwd 缺失 → exit 1 + 诊断；
`false` 的非零退出码仍是值）。

net 走同一套：`Base.Effect.Net` 的 `NetOp` 是普通命名实例效应（可 mock、entry 预装
`runNetHost`），失败抛 `NetErrorOp`（`NetRefused/Timeout/Closed/AddrInUse/BadAddr/Io`），
`runNetError n` 可局部收成 `Result`；`netRecv` 的对端关闭是 `Nothing`（无值）。

net 的阻塞操作有对应的超时变体：`netAcceptWithin` / `netRecvWithin` / `netSendWithin`
返回 `NetStep a`（`StepOk` / `StepClosed` / `StepTimeout`），宿主侧用 `select` 实现。
句柄失效（重复 close / 伪造句柄）也是 typed `NetBadHandle`（exit 1），不再是崩溃。

剩余边界：没有异步/多连接/TLS（非目标）；超时只覆盖单次 accept/read/write，
没有全局 deadline——见 [debt.md](debt.md) D90。

### 8.8 局部可变：`Base.Effect.MutRef`

`Eff []` 不是「无副作用」的许可证，但也不是局部可变的唯一落点。`MutRef` 提供
**命名单元的原地读写**，外部签名仍然纯：

```vuna
count : Eff [] Int
count =
  MutRef.withMutRefPure "acc" 0 (
      do
        MutRef.write 41
        x <- MutRef.read
        MutRef.write (x + 1)
        MutRef.read
    )                                  -- 42
```

形状：

```vuna
data MutRefOp : Type -> Type -> Type where
  Read  : {a : Type} -> MutRefOp a a
  Write : {a : Type} -> a -> MutRefOp a Unit     -- 结果索引 Unit

read  : {n : String} -> ... -> Eff r a
write : {n : String} -> ... -> a -> Eff r Unit
withMutRef     : (n : String) -> a -> Eff (Named n (MutRefOp a) :: r) b -> Eff r b
withMutRefPure : (n : String) -> a -> Eff [Named n (MutRefOp a)] b -> b
```

- **行条目就是表示**：`Named n (MutRefOp a)` 同时带实例名与载荷类型；没有
  `Cell a` 这样的句柄值，所以没有东西能带着单元逃出作用域。
- **单元是编译期绑定**：`withMutRef "x" init body` 在精化期展开成
  `cellWith "x" init (\@vuna@cell@x => body)`；`read`/`write` 的调用点改写成
  `cellReadOp @x @vuna@cell@x` / `cellWriteOp @x @vuna@cell@x v`，
  运行时只剩三个隐藏原语（OCaml `ref` / wasm `$rt_*Ref` / native heap cell），
  **没有 handler 派发、没有名字查找**。
- **跨函数**：签名里出现具体 `MutRefOp` 条目的函数，精化器自动补
  `{@vuna@cell@x : @vuna@Cell a}` 参数（RigOmega 运行时值）；调用点按 binder 名从
  作用域取单元传进去。名字不匹配 → `TC_CellNotInScope`。
- **逃逸**：`read`/`write` 的改写仍带 `Member (Named n (MutRefOp a)) r` 约束，
  所以把写操作捕获进 `Eff []` 的闭包会因「找不到实例」被拒；`withMutRef` 的
  结果类型也不含该条目（`dropEffHead`）。
- **唯一性**：签名里的 concrete 行前缀按 `(族头, 实例名)` 查重
  （`TC_DuplicateInstance`）；`withMutRef` 嵌套同名也走同一条错误。
- **消歧**：同一作用域两个同载荷单元时，省略名字报 `TC_AmbiguousInstance`，
  用 `read@a` / `write@a` 指定。
- **依赖载荷**：句柄参数插在**前导隐式 binder 之后、第一个显式 binder 之前**（非擦除
  隐式保持前缀；插入点之后整体上移索引，载荷按后缀 binder 数下移）。因此
  `{a : Type} -> … Named "xs" (MutArrayOp a) …` 这类多态 helper 可以直接写。
- 名称必须是字符串字面量（`TC_CellNameNotLiteral`）。

夹具：`effect/common/60..62`（单单元、双单元 `@` + 跨函数、循环累加），
负例 `dt_err/117..121`。剩余限制（重复藏在行变量里、`Member` 诊断不够专用）
见 [debt.md](debt.md) D63。

### 8.9 定长原地数组：`Base.Effect.MutArray`

`MutArray a` 是**运行时定长**的原地数组：长度在引入时确定，`set` 写穿同一块存储，
不返回新数组（与不可变 `Array` 的 copy-on-write `set` 不同）：

```vuna
main : Int
main =
  MutArray.withMutArrayPure "xs" 3 0 (
      do
        MutArray.set 0 7
        MutArray.set 1 35
        v <- MutArray.get 1
        n <- MutArray.size
        pure (v * 100 + n)             -- 3503
    )
```

形状：

```vuna
data MutArrayOp : Type -> Type -> Type where
  Get  : {a : Type} -> Nat -> MutArrayOp a a
  Set  : {a : Type} -> Nat -> a -> MutArrayOp a Unit
  Size : {a : Type} -> MutArrayOp a Nat

get  : {n : String} -> ... -> Nat -> Eff r a
set  : {n : String} -> ... -> Nat -> a -> Eff r Unit
size : {n : String} -> ... -> Eff r Nat
withMutArray     : (n : String) -> Nat -> a -> Eff (Named n (MutArrayOp a) :: r) b -> Eff r b
withMutArrayPure : (n : String) -> Nat -> a -> Eff [Named n (MutArrayOp a)] b -> b
```

- **元素类型在行条目里**：`Named n (MutArrayOp a)` 同时带实例名与元素类型，因此
  `set` 与存储的元素类型绑定，不同元素类型的数组不是同一条目。
- 机制与 §8.8 完全同构：编译期名字绑定、跨函数补 `{@vuna@marr@x : @vuna@MArray a}`、
  `Member` 约束挡逃逸、concrete 前缀查重、`@x` 消歧、名字必须是字面量。
- **表示**：`@vuna@MArray a` 编译到普通数组（IR `IrTyArray a`）；`new/get/len` 直接
  复用 `arrayMake` / `arrayGet` / `arrayLength`，只有原地写 `@vuna@prim_marrSet` 是新的
  （三端都不复制；native 写后登记写屏障）。
- 越界是宿主 trap（与 `arrayGet` 一致）；`size` 是容量 = 长度。
- 需要「容量 + 逻辑长度」时，用 `MutArray` + 一个 `MutRef` 计数器组合；类型层定长用
  `MutVec n a`（`Fin n` 索引，见 §8.11）；可增长元素容器用 `MutDynArray a`（§8.12），
  见 [debt.md](debt.md)。

夹具：`effect/common/63..65`（原地读写、双数组 `@` + 跨函数、多态 helper），
负例 `dt_err/122/123/125`。

### 8.10 变长字节缓冲：`Base.Effect.MutBuffer`

`MutBuffer` 是**变长字节**缓冲（对标 OCaml `Buffer.t` / `StringBuilder`）：元素固定
为字节，所以操作族没有元素类型参数；追加原地进行，容量不足时按倍数增长，
`toString` 取一次快照：

```vuna
main : Int
main =
  MutBuffer.withMutBufferPure "out" (
      do
        MutBuffer.append "abc"
        MutBuffer.appendChar 100       -- 'd'
        n <- MutBuffer.length          -- 4
        s <- MutBuffer.toString        -- "abcd"
        pure (n * 100 + strAt s 3)     -- 500
    )
```

形状：

```vuna
data MutBufferOp : Type -> Type where
  Append     : String -> MutBufferOp Unit
  AppendChar : Int -> MutBufferOp Unit     -- 低 8 位
  Length     : MutBufferOp Nat
  Clear      : MutBufferOp Unit
  ToString   : MutBufferOp String

append / appendChar / length / clear / toString : {n : String} -> ...
withMutBuffer     : (n : String) -> Eff (Named n MutBufferOp :: r) b -> Eff r b
withMutBufferPure : (n : String) -> Eff [Named n MutBufferOp] b -> b
```

- 机制同 §8.8/§8.9，句柄是 `{@vuna@mbuf@x : @vuna@MBuffer}`（无载荷参数）。
- **表示**：OCaml `Buffer.t`；wasm `$buf { data: (mut (ref $str)), len, cap }`；native 句柄
  `[data][len][cap]`（地址稳定）+ 单独的 leaf 字节块，增长 = 2× 重分配 + 复制。
- `toString` 复制成新字符串，之后继续追加不影响已取出的串；`clear` 保留容量。
- `appendChar` 取低 8 位，不做 UTF-8 校验（按字节语义）。

夹具：`effect/common/66..67`（追加/长度/快照/清空、跨函数 + 格式化组合），
负例 `dt_err/124/126`。

### 8.11 类型层定长：`Base.Effect.MutVec`

`MutVec n a` 是 `Vec n a` 的可变搭档：长度 `n` 在类型层锁定，下标是 `Fin n`，越界在
编译期不可能，运行时没有边界检查。存储是定长数组，`set` 原地写：

```vuna
main : Int
main =
  MutVec.withMutVecPure "xs" (VCons 10 (VCons 20 (VCons 30 Nil))) (
      do
        MutVec.set FZero 7
        a <- MutVec.get FZero
        n <- MutVec.size
        pure (a * 100 + natToInt n)    -- 703
    )
```

形状：

```vuna
data MutVecOp : Nat -> Type -> Type -> Type where
  Get  : {n : Nat} -> {a : Type} -> Fin n -> MutVecOp n a a
  Set  : {n : Nat} -> {a : Type} -> Fin n -> a -> MutVecOp n a Unit
  Size : {n : Nat} -> {a : Type} -> MutVecOp n a Nat

get  : {name : String} -> ... -> Fin n -> Eff r a
set  : {name : String} -> ... -> Fin n -> a -> Eff r Unit
size : {name : String} -> ... -> Eff r Nat
withMutVec     : (name : String) -> Vec n a -> Eff (Named name (MutVecOp n a) :: r) b -> Eff r b
withMutVecPure : (name : String) -> Vec n a -> Eff [Named name (MutVecOp n a)] b -> b
```

- 行条目 `Named name (MutVecOp n a)` 同时带长度索引与元素类型；句柄载荷是**第二个**
  实参 `a`（`MutArrayOp` 的载荷是第一个），由家族表的 `mutFamPayloadIndex` 指定。
- **引入**：运行时长度来自种子 `Vec n a` 的构造子结构（`vecToList` → 数组），
  不需要把 Rig0 的长度索引再传一遍。
- **表示**：复用 ` a`（普通数组）+ `marrGet/Set/Len`，没有新原语；
  种子转换走 ``（三端映射到 `arrayFromList`）。
- 下标转换 `Fin n → Nat` 是构造子递归（`finToNat`），代价与下标值成正比；
  bounds 由类型排除，没有运行时检查。

夹具：`effect/common/68..70`（基本读写、双向量 `@` + 跨函数、多态 helper），
负例 `dt_err/127..130`。

### 8.12 可变长元素容器：`Base.Effect.MutDynArray`

`MutDynArray a` 是**运行时变长**的元素容器：`push` 原地追加，容量不足时按倍数增长；
下标是 `Nat`，越界是宿主 trap；`size` 是已用长度。与 `MutVec` 的区别是长度不在类型层。

```vuna
main : Int
main =
  MutDynArray.withMutDynArrayPure "xs" (
      do
        MutDynArray.push 1
        MutDynArray.push 2
        n <- MutDynArray.size          -- 2
        a <- MutDynArray.get 0         -- 1
        pure (a * 10 + natToInt n)     -- 12
    )
```

形状：

```vuna
data MutDynArrayOp : Type -> Type -> Type where
  Get   : {a : Type} -> Nat -> MutDynArrayOp a a
  Set   : {a : Type} -> Nat -> a -> MutDynArrayOp a Unit
  Push  : {a : Type} -> a -> MutDynArrayOp a Unit
  Size  : {a : Type} -> MutDynArrayOp a Nat
  Clear : {a : Type} -> MutDynArrayOp a Unit

get / set / push / size / clear : {name : String} -> ...
withMutDynArray     : (name : String) -> Eff (Named name (MutDynArrayOp a) :: r) b -> Eff r b
withMutDynArrayPure : (name : String) -> Eff [Named name (MutDynArrayOp a)] b -> b
```

- 机制同 §8.8：编译期名字绑定、跨函数补 `{@vuna@mdyn@x : @vuna@MDynArray a}`、
  `Member` 约束挡逃逸、concrete 前缀查重、`@x` 消歧。
- **表示**：OCaml `(Obj.t array * int) ref`（`dtp_dyn*`）；wasm
  `$dyn { data: (mut (ref $arr)), len, cap }`；native 稳定句柄 `[data][len][cap]` +
  独立数组块，增长 = 2× 复制。native 写元素与替换 `data` 都登记写屏障。
- `get`/`set` 按**已用长度**检查（越界 trap），`clear` 保留容量。

夹具：`effect/common/71..72`（增长到 32 的 push + 读写清空、双容器 `@` + 多态 helper），
负例 `dt_err/131..133`。

## 9. 仍开放的边界

| 缺口 | 内容 | 入口 |
| --- | --- | --- |
| 线性 / 依赖 multiplicity | 多射续延不做；通用线性箭头与依赖 multiplicity 未做（线性值经 ω 形参通用函数被拒，库 API 需显式 `(1 x : …)`） | [debt.md](debt.md) D22 |
| 表示轴残留 | handler 续延域的 `resIdx i o` 用不透明值 + 恒等 cast 编译；精化期未解 meta 的漏 cast 边界、trait 自动生成 λ 的插入点未覆盖 | [debt.md](debt.md) D27 |
| 信任入口 | `runEff` 内部入口接受任意行；运行时 `unhandled effect` 兜底仍服务库内部路径 | [debt.md](debt.md) D37 |
| 并行 | 无 Domain 并行、无父 fiber handler 继承 | [debt.md](debt.md) D41 |
| 调度器边界 | 取消只在挂起点生效、清理有 64 步宽限后硬中止；TaskLin 恰好一次 await/cancel；Mutex/Semaphore/Channel 为 cooperative 忙等；超时是逻辑步数；任务体只能 `Eff Nil a`（`forkTaskWith` 显式 handler，但无法继承父 fiber handler 栈） | [debt.md](debt.md) D44 |

## 10. 非目标（明确不做）

- 多射续延：`perform`/`handle` 只有 one-shot 续延；`Cont` 的线性类型化见
  [debt.md](debt.md) D42。
- 完整的**高阶效应类型**（对子计算的行/answer 做 rank-2 量化、multi-shot）不做：
  scope op 用 `Scoped a` 的一等擦除子计算 + `handleScoped`（行在 `scope` 处检查）；
  `handle` 语法支持结果索引族（含 scope 族），但显式参数不是类型的族仍报
  `TC_HandleFamilyUnsupported`（[debt.md](debt.md) D54）。自动 lift 只在 check 方向
  （`tryEffLift`，见 §8.4）。
- 类型级能力行（`Eff [caps] r a`）。
- 并行/多核（OCaml `Domain` 并行、内存模型）：只有**单线程**调度器；通道/互斥量等并发
  数据结构与网络/服务端框架不在本层范围（[debt.md](debt.md) D41）。

## 相关阅读

- 标准库模块：[stdlib.md](stdlib.md)；量化/线性规则：[qtt.md](qtt.md)
- 原语与宿主层（`prim_*`、效果原语）：[primitives.md](primitives.md) §7
- 记录 / trait / `do` 与 `Monad`：[records-traits.md](records-traits.md)
- 类型系统（擦除判据、宇宙）：[type-system.md](type-system.md)；Core 实现：[core.md](core.md)
- 自举与 rotation：[bootstrap.md](bootstrap.md)；测试标签：[testing.md](testing.md)

- 高阶 / 调度器展开：[effects-layers.md](effects-layers.md)
- 效应系统内建化（`perform`/`handle` 语法、行求解规则、实例名）：
  [native-effects.md](native-effects.md)
