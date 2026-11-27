# 效应：Eff 统一动作、handler 与宿主层

**现状**：用户面唯一动作类型是 `Eff r a`（`Base.Effect.Core`，构造子不导出；`MkEff` 是内部表示），
入口是 `main : Eff r a`（行里的内建宿主标签由 entry 预装 handler），执行入口分两个：
`Base.Effect.Core.runPure : Eff [] a -> a`（纯动作）与不导出的 `runMain`（entry 折叠完 handler
之后的动作，行里带 `HostOp`）。宿主层原语是隐藏的 `@vuna@prim_eff_*` / `@vuna@host@*`
（源码写不出），类型固定为 `Eff [HostOp] a`（`Base.Effect.Host`）；用户面只有
`Base.Effect.*` 标签 + handler 这一条路径；Int/Nat 归一化只留在 handler 的结果索引
（`Print`、`WriteFile`/`FileSize` 返回 `Nat`）。宿主 handler 的 op 解释在自己的
`Eff [HostOp]` 行里跑原语（错误收口族用 `hostSync` 放回带 typed-error 的行），入口组合是
`runX = joinEff (handleXHost …)`，结果行尾接宿主行。

**`Eff []` 就是纯**：求值不观察也不改变外部世界（发散与不变式破坏不计）。确定性的内部可变
状态经 `Base.Effect.Mut.MutOp` 标记行表达（空 data、无操作 / 无 handler，`with*` 在作用域
结束时关闭它），所以 `Eff []` 里读不到任何可变句柄。唯一能拿到
`Eff [HostOp]` 值的入口是隐藏宿主原语；关闭它的只有
`Base.Effect.Host.runHost`（裸值，供直连 opH）与 `hostSync`（放回任意行），`rowRem` 不对
`HostOp` 归约，所以源码层没有第二条移除路径。

运行时核心（§8）：OCaml 5 一次性 delimited continuations + 开放行 + 命名实例 +
一阶效应（`Base.Effect.Core` / Reader / State / Fs / Console / Clock / Env / Process / Stdin /
Args / Exit）；`Member` 行约束、`local`/`catch`/scoped `Exn`、线性续延与一次性闭包
（`mkCont`/`resumeCont`）、通用 `bracket`（含非 `Exn` abort cleanup）。单线程 fiber
调度器库面已删除（gh#100）。学习路径：写程序看 §2–§3；表示层看 §5；
运行时核心看 §8。

## 1. 范围

- **本页覆盖**：`Eff` 统一动作的表示/执行、handler 与 `Eff []` answer、宿主层（隐藏原语 + 标签/handler）、
  宿主层纪律、通用 Eff 的边界。
- **不覆盖**：原语/宿主层的逐条语义（[primitives.md](primitives.md) §7）；纯效应 monad
  （`Base.Effect.Pure.State` / `Reader` / `Error`，它们不碰宿主，见 [stdlib.md](stdlib.md)）；
  并行/多核与 Domain 内存模型（`Base.Thread`，见 [primitives.md](primitives.md) §6.2）；完整 QTT。

## 2. 动作类型与宿主层

### 2.1 身份与表示

| 项 | 值 |
| --- | --- |
| 用户面动作类型 | `Eff : Row -> Type -> Type`（`Base.Effect.Core` 的 data；行是 Type-1 擦除索引） |
| 表示 | 运行时就是 thunk：`MkEff : (EffUnit -> a) -> Eff r a` 不分配包装（OCaml 侧直接是 `Obj.t`，native / wasm 的构造子与 `case` 按恒等展开）；`MkEff` 不导出，用户经 `pure`/`do`/`>>=`/handler 构造与消解 |
| main 入口 | `main : Eff r a`（内建宿主标签由 entry 预装 handler）；钩子 `dtp_sched_main (fun () -> <runMain> (handlers… v_main))` |
| 执行 | `runPure : Eff [] a -> a`（纯动作，行必须 Nil）；不导出的 `runMain` 执行折叠后带 `HostOp` 的动作。两者运行时都是 `runThunk` 应用 dummy 令牌 |
| 行 | `Row` / `(::)` / `Nil` + `Member`；实例名并进标签 `Named`；handler 用 `rowRem` 删行（`HostOp` 不归约），运行时按 `(key, name)` 路由 |

- `main : Eff [] a` 的**行检查在类型期**：entry 处仍有未处理行报
  `TC_UnhandledEffects`；核心求值路径遇到动作入口报
  `[CG_InterpCannotExecuteEffects]`（纯核心求值器只跑纯 main）。
- **入口只认默认实例**：entry 预装的 `runXHost` 只删除 `Named "default" …` 条目，所以 `main`
  行里留命名实例（`Eff [ConsoleOp@mock] Int`）报 `TC_EntryInstanceNotDefault`，不拖到运行期
  `unhandled effect`。命名实例必须在进 main 之前被 handler 消掉（夹具
  `dt_err/112_entry_instance_not_default`、`dt_base/93_eff_named_row_handled`）。
- `Eff []` 表示**纯**：求值不观察也不改变外部世界（发散与不变式破坏不计）。宿主交互只能出现在
  `HostOp` 行里（`Base.Effect.Host`），宿主原语的类型固定为 `Eff [HostOp] a`，`rowRem` 不对
  `HostOp` 归约；确定性的内部可变状态经 `MutOp` 标记行表达（`with*` 关闭），所以 `Eff []`
  里读不到任何可变句柄。宿主副作用没有 manifest 能力/特权门控；用户面应经
  `Base.Effect.Core.*` 标签 + handler 使用效果（纪律/文档约定，见 §8.6）。
- **动作入口**：`IEffRow`/`IRowCons`/`IGlobal` 行 IType、`IEffHost`（宿主原语类型 =
  `Eff [HostOp] a`）、隐藏
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
`List` 的 `(::)` 重载；局部可变走 `Base.Container.Mut*` 的值句柄 + `MutOp` 标记（见 §8.8）。
- **宿主原语**：`@vuna@prim_eff_*` / `@vuna@host@*`（隐藏，源码写不出；见 `Frontend/Lexer` 的
  `@vuna@` 规则），用户面经 `Base.Effect.*` 标签 + handler 使用；eff-boundary 守卫检查
  「可见宿主原语名不得出现在源码」。

| 层 | 类型/入口 | 说明 |
| --- | --- | --- |
| 用户面 | `Eff r a` + `Base.Effect.*` 标签/handler | 用户包与 ad-hoc 的唯一动作类型；`main : Eff r a` |
| handler 层 | entry 自动预装的行 handler（`@vuna@` 内部名） | 用户面写不出 handler 名字；`main` 行有内建标签时由编译器嵌套预装 |
| 宿主层 | `@vuna@prim_eff_*` / `@vuna@host@*`（隐藏 intrinsic，源码写不出） | 只由 base 的 handler 与编译器内部调用；Int/Nat 归一化只在 Eff handler 的结果索引；没有 manifest 能力/信任门控 |

- **代数**：`Monad (Eff r)` / `Applicative` / `Functor` 实例已内建；用户用 `pure` / `do` /
  `>>=` / `fmap`，动作的构造入口只有这些实例方法。
- **宿主层边界（无 manifest 门控）**：`vuna.toml` 没有 `[capabilities]` / `[trust]` /
  `[privileged]`；`prim_*`（纯原语）任何包（用户包、ad-hoc 文件）都可直调。
  宿主效应原语是隐藏名，源码写不出：唯一路径是 `Base.Effect.*` 标签 + handler。
  显式接受的损失见 §8.6（登记在 gh#104）。
- **错误报告**：没有异常 / handler 层之外的语言级异常；未捕获的宿主异常由生成的 main 钩子
  统一报告为 `vuna: runtime error: ...` + 位置帧 + exit 2（见 [debugging.md](debugging.md)）。
  `log!` / `dbgShow` / `assert` / `todo` 是语言级调试构造，不参与效应系统。

## 3. 没有 transformer 栈

状态 / 环境 / 错误用 `Base.Effect.State` / `Base.Effect.Reader` / `Base.Effect.Error`（高阶作用域错误
用 `Base.Effect.Exn`）；没有 `MonadIO` 式的 `Base.Effect` 能力类、
`Base.StateT` / `Base.ReaderT` / `Base.ErrorT`，也没有 `Base.EffAsync`。纯表示版本
`Base.Effect.Pure.State` / `.Reader` / `.Error` 与 handler 版并存，二者不互相派生。

## 4. 局部可变：值句柄，没有 region/ST

`Base.ST`（region 隔离的局部可变、`ST r a` / `Ref` / `SArray`）不存在：局部可变是
`Base.Container.Mut*` 的**值句柄**（`MutRef` / `MutArray` / `MutVec` / `MutDynArray` /
`MutBuffer`，见 §8.8）；分配与读写要求 `MutOp` 标记，作用域入口 `with*` 关闭它。
没有 region 令牌；句柄本身是普通值，可以逃逸（GC 所有权）。语言保留 `linear record` /
`linear data` 与 QTT 规则，线性句柄是将来收紧逃逸的路径（gh#105）。

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
- 全局类型头既不是数据族、也不是 `Int` / `String` / `Array`
  （即类型族定义 / axiom / 未知全局；`resIdx`、`sigOf` 属于这一类）；
- 或**类型族参数**：kind 的 Pi 链里出现非宇宙域（`m : Type -> Type` 这类普通类型构造子
  参数**不算**，所以字典方法字段 / base 泛型代码不受影响）；
- 数据族的**索引值实参**（`Vec (Succ n) a` 的 `Succ n`）是擦除后的索引，不参与判定；
- 已知边界：精化期未解的元变量按可表示处理（可能漏 cast）；trait 自动生成的 λ
  （方法投影 / 实例 tele）不在插入点覆盖范围内（gh#39）。

**注意这不是 QTT 能解决的**：续延是**真的运行时函数**（要被 handler 以真实值调用），
`resIdx i o` 是类型级、按擦除纪律 0 用量、在 OCaml 里不可命名；QTT 只把 0/1/ω 用量写精确，
不会让 OCaml 写出它的静态类型。表示轴用「不透明值 + 恒等 cast」绕开它。

依赖擦除类型的旧 CPS 编码仍由 `packages/compiler/test/corpus/dt/82_eff_cps.vuna` / `83_eff_cps_two_instances.vuna` /
`84_eff_cps_result.vuna` 覆盖；它们验证同一套不透明值机制。

**结论**：表示层的阻塞已消除；剩余边界见 §9 与 [债务清单](https://github.com/vuna-lang/vuna/issues?q=label%3Adebt)。

## 6. 通用效应系统的三条路线

| 路线 | 解决什么 | 不解决 / 代价 |
| --- | --- | --- |
| **完整 QTT**（依赖 multiplicity、线性/唯一） | 线性 record 的「句柄不复制/恰好用一次」、一次性续延（取消/超时）、线性世界令牌 | **不解决**擦除依赖续延的运行时表示（§5）；类型理论 + 编译器 + base + 语法面全量改动 |
| **后端不透明擦除值**（`Obj.t` 类 + codegen 转换/cast） | 让 `resIdx i o` 这类「擦除依赖」位置有统一运行时表示，秩二 handler 续延才可编译 | 声明位置 `Obj.t`、表达式位置恒等 cast（§5）；残留边界见 gh#39 |
| **运行时类型码**（Tarski `Ty`/`Tm` 上移为通用机制） | 显式携带类型信息，彻底绕开「不可命名」 | 语言层引入 type codes（当前明确不在终态）、运行时开销、与擦除判据整合 |

- 三者不是互斥：QTT 解决**作用/线性**轴，后两者解决**表示**轴。
- 当前采用「表示」轴的不透明擦除值；QTT 的线性/一次性缺口见 gh#97。

## 7. 设计规则

1. **Eff 是唯一动作类型 + 内建代数**：`pure`/`do`/`>>=` 来自 `Functor`/`Applicative`/`Monad (Eff r)` 实例；
   用户面动作由实例方法构造；`joinEff` 展平 handler answer，`runPure` 执行。
2. **handler 是解释器**：`runPure` 是唯一的执行入口；`runConsole` / `runFs` 等是
   handler（answer 为 `Eff []`，由 `joinEff` 组装），本身不执行动作；没有「隐式生效的
   handler 栈」。
3. **可变数据边界**：用户面可变是 `Base.Container.Mut*` 的值句柄（`MutRef` / `MutArray` /
   `MutVec` / `MutDynArray` / `MutBuffer`，§8.8）；单元身份在值上，分配与读写要求 `MutOp`
   标记，`with*` 关闭。句柄可以逃逸（GC 所有权）；没有 region 形式，线性句柄是收紧路径
   （见 gh#105）。
4. **宿主层是底层原语面，不是类型豁免**：`prim_effectPerformId` / `prim_effectHandleId` /
   cleanup/sched 是宿主层原语，常规用户面经 `Base.Effect.Core.*` 标签 + handler 使用效果；没有
   `unsafe` 能力位或 `[trust]` 定义级清单（gh#104）。
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
| `Base.Effect.Host` | 宿主行标记 `HostOp : Type -> Type`（空 data，无操作/无 handler）与两个关闭器：`runHost : Eff [HostOp] a -> a`（直连 opH 的裸值答案）、`hostSync : Eff [HostOp] a -> Eff r a`（错误收口族把原语放回带 typed-error 的行；**必须留在动作里求值**，零参封装才不会被顶层 `let` 缓存） |
| `Base.Effect.Reader` | `ReaderOp s` + `Ask`；`ask`/`handleReader`；实例名并进标签（`Named "counter" (ReaderOp Int)`） |
| `Base.Effect.State` | `StateOp s` + `Get`/`Put`；`get`/`put`/`handleState`（answer `s -> Pair a s` 线程状态） |
| `Base.Effect.Mut` | 内部可变状态标记 `MutOp : Type`（空 data，无操作 / 无实例名 / 无 handler，与 `HostOp` 同构）；`with*` 在作用域结束时用 `dropEffHead` 关闭它 |
| `Base.Container.Mut*` | 值句柄可变容器（`MutRef` / `MutArray` / `MutVec` / `MutDynArray` / `MutBuffer`）：句柄是普通值，分配与读写要求 `Member MutOp r`；`with*` / `with*Pure` 打开并关闭标记。见 §8.8 |
| `Base.Effect.Fs` | 宿主-backed Fs 效应（完整 fs 面；标签 `FsOp`，实例名并进标签，如 `Named "real" FsOp`）：`ReadFile`/`ReadFileRange`/`WriteFile`/`WriteFileAtomic`/`ReadDir`/`IsDirectory`/`MakeDir`/`RemoveFile`/`FileExists`/`FileMtime`/`FileSize`（结果索引在构造子上）；`fsReadFile`/`fsReadFileRange`/`fsWriteFile`/…/`fsFileCursor`（按块读文件，配 `Base.Effect.Cursor`）/`handleFs n`（泛型）/`runFsHost`（entry 预装）；真实 handler 用 `@vuna@host@try*` 原语（`WriteFile` 的结果索引是 `Nat`），宿主失败抛 `FsErrorOp`，`runFsError` 可局部收成 `Result`，`runFsResult` 把默认 fs 行收成 `Eff [] (Result a)`（worker / 子计算用）；`fsFileSize`/`fsFileMtime` 返回 `Maybe`（取不到 = 无值，不是 0）；mock/real 可并存（`dt_base/40`） |
| `Base.Effect.Console` | console 标签 `ConsoleOp`（实例名并进标签，如 `ConsoleOp@mock`/`ConsoleOp@real`）：`Print`/`EPrint`；`consolePrint`/`consoleEprint`/`handleConsole`/`runConsoleHost`（entry 预装的真实 handler，用 `@vuna@prim_eff_print`/`@vuna@prim_eff_eprint`，`Print` 的结果索引是 `Nat`）/`runConsoleEff`（默认 console 行收成 `Eff []`，worker / 子计算用）；写失败（EPIPE 等）返回 0、不崩进程 |
| `Base.Effect.Tty` | 终端元数据标签 `TtyOp`：`IsTty`（stdout 是否连接终端，结果索引 `Bool`）；`ttyIsTty`/`handleTty`/`runTtyHost`（entry 预装的真实 handler，用 `@vuna@host@isTty`；wasm 的 WASI preview1 没有 isatty，恒 `False`）/`runTtyEff`（默认 tty 行收成 `Eff []`，worker / 子计算用）。诊断格式的默认值依赖它，所以它必须是正常效应——工具链不再用 `hostSync` 就地关闭宿主行 |
| `Base.Effect.Clock` | clock 标签 `ClockOp`：`Now`（微秒时间戳）/`SleepMicros`；`clockNow`/`clockSleepMicros`/`handleClock`/`runClockHost`（entry 预装的真实 handler，用 `effTimeUs` 与编译器原生 `@vuna@prim_eff_sleep`）/`runClockEff`（默认 clock 行收成 `Eff []`，worker / 子计算用） |
| `Base.Effect.Env` | env 标签 `EnvOp`：`GetEnv`/`GetCwd`/`ExecPath`；`envGetEnv`/`envGetCwd`/`envExecPath`/`handleEnv`/`runEnvHost`（entry 预装的真实 handler，用 `@vuna@prim_eff_getenv`/`@vuna@prim_eff_getcwd`/`@vuna@prim_eff_execPath`）/`runEnvEff`（默认 env 行收成 `Eff []`，worker / 子计算用） |
| `Base.Effect.Process` | process 标签 `ProcessOp`：`Args`/`Exit`/`RunIn`；`processArgs`/`processExit`/`processRunIn`/`handleProcess`/`handleProcessHostWith`（自定义 `onExit` 的宿主 handler）/`runProcessHost`（entry 预装：`Exit` 走真实退出）；启动失败（cwd 不存在 / 权限 / 并发子进程超上限）抛 `ProcessErrorOp`，`runProcessError` 可局部收成 `Result`，`runProcessResult` 把默认 process 行收成 `Eff [] (Result a)`（worker / 子计算用，`Exit` 仍真实退出）；子进程非零退出码仍是**值** |
| `Base.Effect.Error` | `ErrorOp` + `throw`/`handleError`/`runError`/`catch`（作用域 catch） |
| `Base.Effect.Exn` | scoped Error：`ExnOp : Type -> Type`，`Try` 携带 `Scoped a`；`tryWith`/`runExn`/`catchExn`/`bracketExn`；`handle` 语法可直接写 Exn（`Try sub k -> k (handleScoped sub)`） |
| ~~`Base.EffMutex` / `Base.EffChannel` / `Base.EffSched`~~ | 单线程 fiber 调度器库面已删除（commit `1c90517`）；`prim_sched*` 与文档清理见 gh#100。多线程走 `Base.Thread` |

夹具：`dt_base/16`（两个 Reader 实例嵌套 handler）、`17`（State 状态线程）、
`18`（宿主-backed Fs 真实读写，实例名 `"real"`）、`20–21`（local/catch）、`23`
（scoped handler）、`24–25`（线性续延 / bracketExn）、`26–30`（mock↔real 对拍）、
`40–41`（fs 命名实例 / process 可控 Exit）、`42` / `44`（通用 bracket abort cleanup /
一次性闭包）、`45`（行语法糖）；
负例 `dt_err/70–81`；原语探针夹具 `packages/10_prim_io`（`clockSleepMicros`，内部走 `@vuna@prim_eff_sleep`）。
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
- **并发/async**：单线程 fiber 调度器库面已删除（gh#100）；**多线程**是
  另一条轴：`Base.Thread` 用 OS 线程（OCaml 侧 `Domain`）提供 `spawn`/`join`、`Mutex`、
  `Condvar`、`Atomic`，线程体是 `Eff [] a`、续延不跨线程；宿主效应要在任务体内显式安装
  真实 handler（`runFsError "fs-error" (runFsHost comp)`，夹具 `effect/common/104`）。
  每个宿主效应模块都提供默认实例的闭合 runner：无 typed error 族是 `runConsoleEff` /
  `runClockEff` / `runEnvEff` / `runArgsEff` / `runStdinEff` / `runTtyEff` / `runExitEff`，
  把 `Eff [XOp] a` 收成 `Eff [] a`；Fs / Process / Net 是 `runFsResult` / `runProcessResult` /
  `runNetResult`，收成 `Eff [] (Result a)`。结构化并行入口是 `Base.Thread.Par`：
  纯 body 用 `parMap` / `parFoldMap`；effectful body 用 `parMapEff` / `parMapEffWith`，
  由上述 runner 在 worker 内收成 `Eff []`，见 [primitives.md](primitives.md) §6.2
  （夹具 `effect/common/106`、`107`，native / ocaml 的 `96` / `95`）。
- **未处理效应诊断**：入口在类型层收紧——`runPure : Eff [] a -> a`；
  `load` 处 `joinEff`/`runPure` 要求行 `Nil`，因此入口处的未处理效应是**类型错误**，并报专门的
  `TC_UnhandledEffects`（列出具体标签；负例 `dt_err/82_unhandled_effect_entry`）。
  运行时兜底保留：main 钩子识别 `Effect.Unhandled (Perform (key,name,_))`，报告
  `unhandled effect key (instance name)`（`name` 是 String 实例名；`packages/compiler/test/corpus/run_err/04_unhandled_effect`）；任务内
  的未处理效应经 `awaitTask` 的 `Err` 返回同一条消息。剩余：`runEff` 内部信任入口
  （库内路径）接受任意行（gh#99）。

### 8.5 高阶 / 效应标签

高阶/作用域误差、线性续延/一次性闭包/`bracket` 与效应标签的语义见
[effects-layers.md](effects-layers.md)。核心边界：`Try` 子计算 + scoped
handler；`Cont` resume-once（`mkCont`）+ `bracket` 的 abort cleanup；
console/clock/env/process/fs 标签（库层）。单线程 fiber 调度器库面已删除（gh#100）。


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
  与宿主模块 import 门控——`prim_*`（纯原语）任何包（用户包、ad-hoc 文件）都可以直调；
  宿主效应原语是隐藏名，源码写不出，**类型固定为 `Eff [HostOp] a`**，唯一路径是
  `Base.Effect.*` 标签 + handler（`runX = joinEff (handleXHost …)`）；关闭宿主行只有
  `Base.Effect.Host.runHost` / `hostSync`，且 `rowRem` 不对 `HostOp` 归约（负例
  `dt_err/134_host_row_not_removable`、`dt_err/135_runpure_host`）。没有每包原语白名单、
  `unsafe` 定义级审计，也没有 REPL `--privileged`。缺口见 gh#104：
  `@vuna@` 名字在词法层可写，所以保证的前提是不手写内部名。
- **base 宿主层直接使用点（安全审计参考，不是强制约束）**：3 处——
  `Base.Effect.Core.sendCore`、`Base.Effect.Core.handleCore`、`Base.Effect.Core.bracket`。
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
   闭包并由运行时经尾调用重的 bind/joinEff 链执行——`get_callstack` / 异常 backtrace
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
`runNetError n` 可局部收成 `Result`，`runNetResult` 把默认 net 行收成 `Eff [] (Result a)`
（worker / 子计算用）；`netRecv` 的对端关闭是 `Nothing`（无值）。

net 的阻塞操作有对应的超时变体：`netAcceptWithin` / `netRecvWithin` / `netSendWithin`
返回 `NetStep a`（`StepOk` / `StepClosed` / `StepTimeout`），宿主侧用 `select` 实现。
句柄失效（重复 close / 伪造句柄）也是 typed `NetBadHandle`（exit 1），不再是崩溃。

剩余边界：没有异步/多连接/TLS（非目标）；超时只覆盖单次 accept/read/write，
没有全局 deadline——见 gh#143。

### 8.8 可变数据：值句柄 + `MutOp` 标记

局部可变是**值**，不是行条目：`Base.Container.Mut{Ref,Array,Vec,DynArray,Buffer}` 提供
可逃逸的句柄；分配与读写要求行里有 `Base.Effect.Mut.MutOp`，`with*` 打开标记并在作用域
结束时关闭，`with*Pure` 是 `runPure` 端点。

```vuna
count : Eff [] Int
count =
  MutRef.withMutRefPure 0 (\acc =>
      do
        MutRef.write acc 41
        x <- MutRef.read acc
        MutRef.write acc (x + 1)
        MutRef.read acc
  )                                  -- 42
```

形状（以 `MutRef` 为例；其余四族同构）：

```vuna
export alias record MutRef a where
  cell : @vuna@Cell a

new   : Member MutOp r => a -> Eff r (MutRef a)
read  : Member MutOp r => MutRef a -> Eff r a
write : Member MutOp r => MutRef a -> a -> Eff r Unit
withMutRef     : a -> (MutRef a -> Eff (MutOp :: r) b) -> Eff r b
withMutRefPure : a -> (MutRef a -> Eff (MutOp :: Nil) b) -> b
```

- **身份在值上**：句柄是普通值（`alias record` 包住隐藏表示，构造/投影是定义性恒等；
  `MutVec n a` 是单构造子 data，用显式 kind 把 `n` 固定在类型层）。句柄可以存进 record、
  从函数返回、被闭包捕获。
- **`MutOp` 是标记**：空 data，无操作 / 无实例名 / 无 handler，与 `HostOp` 同构；`with*`
  用 `dropEffHead` 消掉它（标记消除，不是 handler 解释）。`Eff []` 里因此读不到任何句柄，
  §顶层与 §1 的纯度判据不变。
- **没有派发**：操作直接走隐藏原语（`@vuna@prim_mref*` / `marr*` / `dyn*` / `mbuf*`），
  没有名字查找、没有精化期句柄合成、没有 `Member (Named …)` 约束。
- **嵌套作用域**：重复的 `MutOp` 条目是同一标记，`Member` 取最近的头部（具体候选取头部
  规则，见 `Elab/Dict`）；不需要名字消歧。
- **逃逸**：允许（GC 所有权）。句柄离开 `with*` 后仍然存在，但任何读写都要求某个 `MutOp`
  作用域；要严格禁止逃逸需要线性句柄（gh#105）。
- **表示与操作**：

| 类型 | 表示 | 操作 |
| --- | --- | --- |
| `MutRef a` | `@vuna@Cell a`（OCaml `ref`） | `new` / `read` / `write` / `modify` |
| `MutArray a` | `@vuna@MArray a`（普通数组） | `new` / `get` / `set` / `size` |
| `MutVec n a` | 单构造子 data，字段 `@vuna@MArray a`；`Fin n` 下标 | `new` / `get` / `set` / `size` |
| `MutDynArray a` | `@vuna@MDynArray a`（`Obj.t ref`） | `new` / `get` / `set` / `push` / `size` / `clear` |
| `MutBuffer` | `@vuna@MBuffer`（`Obj.t ref`，OCaml `Buffer.t` 装箱） | `new` / `append` / `appendChar` / `size` / `clear` / `toString` |

夹具：`effect/common/61`（双单元 + 跨函数）、`62`（循环）、`65`（多态 helper）、
`66`（缓冲快照）、`68`（`Fin` 下标）、`71`（增长）、`91`（`Eff []` 里的单元）、`100`
（五族嵌套）、`101`（一等值：record / List / 跨函数）；负例 `dt_err/136`（缺 `MutOp`
→ 无行成员）。

## 9. 仍开放的边界

| 缺口 | 内容 | 入口 |
| --- | --- | --- |
| 线性 / 依赖 multiplicity | 多射续延不做；通用线性箭头与依赖 multiplicity 未做（线性值经 ω 形参通用函数被拒，库 API 需显式 `(1 x : …)`） | gh#97 |
| 表示轴残留 | handler 续延域的 `resIdx i o` 用不透明值 + 恒等 cast 编译；精化期未解 meta 的漏 cast 边界、trait 自动生成 λ 的插入点未覆盖 | gh#39 |
| 信任入口 | `runEff` 内部入口接受任意行；运行时 `unhandled effect` 兜底仍服务库内部路径 | gh#99 |
| 并行工具层 | 静态分块的长尾、无动态任务队列 / Channel / 取消 token | gh#101 |
| 调度器库面 | 单线程 fiber 调度器（`Base.EffSched` / `EffMutex` / `EffChannel`）已作为死代码删除；`prim_sched*` 与文档清理见 gh#100。多线程走 `Base.Thread` | gh#100 |

## 10. 非目标（明确不做）

- 多射续延：`perform`/`handle` 只有 one-shot 续延；`Cont` 的线性类型化见
  gh#102。
- 完整的**高阶效应类型**（对子计算的行/answer 做 rank-2 量化、multi-shot）不做：
  scope op 用 `Scoped a` 的一等擦除子计算 + `handleScoped`（行在 `scope` 处检查）；
  `handle` 语法支持结果索引族（含 scope 族），但显式参数不是类型的族仍报
  `TC_HandleFamilyUnsupported`（gh#103）。自动 lift 只在 check 方向
  （`tryEffLift`，见 §8.4）。
- 类型级能力行（`Eff [caps] r a`）。
- 并行/多核（OCaml `Domain` 并行、内存模型）：多线程走 `Base.Thread`（`spawn`/`join` /
  `Mutex` / `Condvar` / `Atomic`）；通道 / 动态任务队列见 gh#101，网络 / 服务端框架不在本层范围。

## 相关阅读

- 标准库模块：[stdlib.md](stdlib.md)；量化/线性规则：[qtt.md](qtt.md)
- 原语与宿主层（`prim_*`、效果原语）：[primitives.md](primitives.md) §7
- 记录 / trait / `do` 与 `Monad`：[records-traits.md](records-traits.md)
- 类型系统（擦除判据、宇宙）：[type-system.md](type-system.md)；Core 实现：[core.md](core.md)
- 自举与 rotation：[bootstrap.md](bootstrap.md)；测试标签：[testing.md](testing.md)

- 高阶 / 效应标签展开：[effects-layers.md](effects-layers.md)
- 效应系统内建化（`perform`/`handle` 语法、行求解规则、实例名）：
  [native-effects.md](native-effects.md)
