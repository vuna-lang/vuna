# 显式效应机器（目标态）

> 状态：**设计已定，wasm 先行**。替代「每个后端各自实现续延运行时」的路线；
> 选择性 CPS 继续只负责把效应 thunk / handler 降成协议调用，执行语义由本机器的
> 一组 IR 原语定义，三端实现同一组原语。

## 1. 目标与非目标

**目标**

- 一套 **target-neutral** 的效应执行语义：wasm / OCaml / native 只实现同一组
  `@ir@m@*` 原语，不再各自维护 handler 帧与续延约定。
- 顺序 perform 的栈深为常量（trampoline），不随 perform 次数增长。
- 宿主 handler（answer row 是 `Eff`）与用户 handler 用同一套帧/续延规则。
- one-shot 续延：重复 resume 在机器层拒绝。

**非目标**

- 全片段 CPS：`Eff` 仍是数据，普通函数仍是直接风格。
- multi-shot、宿主异步、跨后端序列化续延。

## 2. 机器状态

运行时状态（每端用本地表示，语义相同）：

```text
Machine = (Control, HandlerStack, ContStack)

Control  = Done value
         | Perform key name op
         | Handle key name ret opH comp unit
         | Resume cont value

HandlerFrame = { key, name, ret, opH, kOuter, prev, answerMode }

ContFrame    = { k, prompt }   -- prompt = 所属 handler frame（delimited）
```

- **HandlerStack**：动态 handler 帧，`prev` 链。
- **ContStack**：显式续延栈；`prompt` 标记续延属于哪个 handler。
  resume 一个续延只恢复到它的 prompt，不越过该 handler。
- `answerMode`：`opH` 返回 `Eff`（answer row）时置位；该 handler 的 frame 要活到
  answer 计算完成为止。

## 3. 协议原语（IR 契约）

选择性 CPS lowering 只发射这些符号；各端实现语义，不共享文本：

```text
@ir@m@perform  key name op          -> 把当前续延压栈，Control = Perform ...
@ir@m@handle   key name ret opH comp unit
@ir@m@resume   cont value           -> 恢复 cont 到其 prompt
@ir@m@done     value
@ir@m@run      control              -> 驱动到 Done，返回 value
```

- `@ir@m@perform` 不再把续延作为普通参数传递，而是压入 ContStack；
- `@ir@m@handle` 压 HandlerFrame，运行 `comp unit`；
- `@ir@m@resume` 只在 prompt 内恢复，越过 prompt 的结果交回 handler；
- 所有原语返回 `Control`，由 `@ir@m@run` 单层循环消费（常量栈）。

## 4. 关键语义

**正常返回**

- `comp unit` 得到 `Done v` → 弹 HandlerFrame → `ret v` → `kOuter`。

**Perform**

- 找最内层 key/name 匹配的 HandlerFrame `f`；
- 把 perform 点的续延压入 ContStack，prompt = `f`；
- `opH op kDone`，其中 `kDone` 把 handler 结果直接交 `f.kOuter`（不经过 ret）；
- handler 内调用 resumption：`@ir@m@resume cont v`，恢复后正常结束的值先交回
  当前 handler 的 `kDone`，而不是直接交 `kOuter`。
- lowering 约定：resumption 一律**饱和**成 `k v kRest`；handler 体内部嵌的 lambda
  （如 `>>=` 的实参 `\n -> k n`）若用到 resumption，会多接一个 continuation 参数
  （`Ir.Cps.usesResumption`），否则 `k v` 的半应用会作为值泄漏出去。

**Answer row（宿主 handler）**

- `opH` 返回 `Eff` 时，不把它当裸值：
  - `answerMode = true`；
  - 在 frame 仍安装时运行该 Eff；
  - answer 完成后得到最终值，才允许弹 frame 并交 `kOuter`。
- 因此 `joinEff (handleXHost ...)` 的后续 `Console`/`Fs` perform 仍能命中同一 frame，
  不再出现 `unhandled effect`。

**one-shot**

- ContFrame 带 `used` 位；第二次 `@ir@m@resume` 触发
  `vuna: runtime error: continuation already resumed`。

## 5. 迁移阶段

1. **wasm 先行**：
   - 1a（已落地，休眠）：`Ir.Cps.cpsDefsMachine` 把 handler clause 改成
     `\o k kDone -> ...`，resumption 调用追加 `kRest`；
   - 1b（已落地，纯行）：wasm 的 `@ir@m@*` 原语、`Return`/`Resume`、`$g_mctx`
     续延上下文与 `$rt_mRun` 已接通，纯用户 handler 默认走 mode 6；
   - 1c（待做）：宿主+用户组合（answer row 的 frame 生命周期）与常量栈
     （当前 CPS 续延仍在 wasm 调用栈上，2000 次 perform 需 1 MiB）。
     - 已能工作：Console 宿主行（裸值 `opH`）、`opH` 执行效应后返回 **Eff answer**
       （answer 里不含 resumption）。
     - 未通：`opH` 在 answer 里 **resume**（`do { s <- op; k s }`，Fs 语料即此形状）。
       `@ir@m@resume` 返回的是 resumed 段的 `Control`（Step），而该值周围的 CPS 代码
       把它当 answer 值（`Eff`）继续 `case`，于是 cast 失败。
     - 试过并在 `41/42/48`、`26_eff_console` 上验证不可行：resume 用嵌套
       `@ir@m@run` 驱动到值（每次 resume 一层 wasm 帧 → 栈耗尽）。因此
       「resume 返回值」与「常量栈」是同一件事：**先把续延做成显式控制栈（trampoline），
       再让 resume 直接返回 answer 值**，然后再转 Fs 及其余宿主家族。
2. **native**：实现同一组原语（显式帧 + 续延栈，替代栈拷贝路径的 handler 部分）；
   用 `effect-common` 三端矩阵验收。
3. **OCaml**：用同一协议映射到 `Effect.Deep` 或显式 trampoline；验收同矩阵。
4. **删除旧运行时**：wasm 的 `$rt_cps*` / stack switching、native/OCaml 的旧 handler
   帧实现；更新 D102/D103/D105 与 seed。

## 6. 验收

- 宿主+用户组合在 wasm 默认引擎、native、OCaml 全部通过；
- `106` 的顺序 perform 用默认栈通过（`-W max-wasm-stack` 不再需要放大）；
- `efftwice` 仍报 continuation already resumed；
- 三端 `effect-common` 输出一致，浏览器 smoke `114` / `115` 通过。

## 7. 采用方案 A：控制栈 + 统一 `Control` 返回

> 决策：放弃「续延是闭包、但调用约定各不相同」的半 CPS，改成**机器独占控制流**。
> 一次性续延在 `Eff` 仍是 thunk 的前提下已经天然是堆上闭包，因此 A 的实质不是
> 「把续延搬到堆上」，而是**让每一处续延调用都变成一次机器转移**：

```text
Continuation  = value -> Control        -- 堆上闭包，永远只返回 Control
Control       = Done value
              | Apply cont value        -- 唯一的续延调用形态
              | Perform key name op cont
              | Handle key name ret opH comp unit cont
```

- 续延**不再返回值**：任何 `k v` 都是 `Apply k v`，由机器循环派发（一次循环迭代 = 一次
  wasm 调用，返回后立刻回到循环）。这是常量栈的充分条件。
- `mCps` 里所有 `IrApp k …`（k 是 CPS 续延）改写为 `@ir@m@apply k …`；thunk 运行点
  `f u k` 改写为 `@ir@m@runThunk f u k`。两者都只出现在尾位置，由 `mCps` 的结构保证。
- 这条约定必须在**整条 lowering 链**上成立：`cpsExpr`（`>>=` / `pure` / `fmap` 等
  组合子的 thunk 体）也要按 Step 续延生成，否则库代码里会留下「返回值」的续延。
  实现上给 CPS 变换加一个 `machine` 开关，mode 6 走 Step 约定，mode 2/3/5 保持原样。
- **段边界**：`ContCtx = { prompt, kRest, mark }`，`mark` 是 resume 时的控制深度。
  `Return(f, v)` 命中 `prompt` 时刻即段边界 → `Apply kRest (ret v)`，仍然只返回
  Control，所以不需要嵌套 `@ir@m@run`，也不需要「返回值」。
- answer row（`opH` 的 `b = Eff`）不再是特例：`opH` 返回的 Eff 由 `Apply` 走正常
  求值路径，resume 在其中的段边界仍然成立。
- 一次性：`Cont` 带 `used` 位，重复 resume 在机器层拒绝。

**迁移顺序（每步单独验收）**

1. 给 CPS 变换加 `machine` 开关，mode 6 全链走 Step 约定；让现有 mode 6 用例
   （纯行 + Console）继续绿（wasm 322）；
2. `48_eff_many` / `106` 在**默认栈**下通过（验证常量栈）；
3. Fs 宿主家族（`18` / `40`）；
4. Clock / Env / Args / Stdin / Exit / Process / Net；
5. 删除 wasm 的 `$rt_cps*`、`$rt_eff*` 与 stack switching，`effModeOf`/mode 2；
6. native / OCaml 按同一 `Control` 协议重写 handler 部分，跑三端矩阵。

**不变量（防回退）**

- mode 6 产物里不存在「把续延当普通函数调用」的 `IrApp`（只有 `@ir@m@apply`）；
- 不存在嵌套 `@ir@m@run`（只有入口一次）；
- 栈深与 perform 次数无关：`106` 默认栈即可。

### 7.1 进度（现状）

已落地（wasm）：

- `@ir@m@apply`（`$rt_mApply`，`$step` tag 4）：mode 6 的 continuation 调用一律
  返回 `Control`，机器循环单层派发；
- `rtMRes2` 改成转移；`rtMKDone` 在 resume 期间把 answer 交回最内层 `kRest`；
  若 frame 已被 `kDone` 弹出（answer 是 `Eff`），resume 时按 `$rt_mInChain` 判断
  重新装回，段结束时按 mctx 记下的链还原；
- do 块续延 λ 由**精化期标记**识别（`@vuna@effK…`），降成「返回一个 Eff，其 thunk
  以 `(u, K)` 运行」（`mEffContLambda`）；`prim_erase` 包一层的 resumption 调用由
  `mStripErase` 剥壳；
- `handleScoped`：`@ir@m@self` 把当前最内层 handler 帧重新装到子计算上跑
  （复用 `Handle` 步骤），值语义边界降成 `run (self th doneCont)`；
- handler clause 收集改成**按 arity 判定**（≥ 2 个运行时参数），`runExn`/`handleExn`
  这类包装层里的 opH 也能被机器化；
- 门控只保留 **mode 6 / 直连（mode 0）**：`effTypes`、`selfNodeType`、`cpsTypes`、
  `$eff`/`$abort` tag、`$rt_eff*`、`$rt_cps*`、`$rt_sel*` 与 mode 2/3/5 的选择逻辑
  全部删除——**wasm 不再有 stack switching**；
- `106` 的 2000 次顺序 perform 用**引擎默认栈**（此前依次是 4 MiB → 1 MiB → 256 KiB）。

- **`bracket`/`finally`** 的 `prim_cleanupPush/Pop` 已在机器帧上实现：帧安装时记下
  cleanup 深度（`hframe` 第 7 个字段），弹帧前（`kDone` 与 `Return` 两条路径）跑该深度
  之上的 cleanup；正常路径仍由 `bracket` 带内 pop，所以不会重复执行（夹具
  `pure_cross/52`、`53` 锁 abort 与「恰好一次」）。

仍然成立的限制：

1. **栈仍随 perform 次数线性增长**（约 96 B/次）：组合子的 CPS 管道里还有普通
   `IrApp` 在同一条链上层层返回；默认栈足够跑 `106`，但还不是常量栈。
2. **cleanup 自身的效应/异常**走当前 handler 链（不吞）；native / OCaml 的旧实现是
   「release 只能访问外层 handler、自身异常被吞」，两边口径不同（debt D42）。
3. `hframe` 的 cleanup 深度按「安装时的 `$g_cleanDepth`」记录：跨 resume 重装帧时沿用
   原值，因此 resume 段里新登记的 cleanup 仍归该帧。

native / OCaml 仍走各自的 handler 实现（native 是栈拷贝，O(N²) 见 D89）；
三端统一到同一 `Control` 协议是后续工作。

## 9. 方案 B：把机器下沉为库代码（三端统一）

> 现状：`Ir.Cps` 只被 `Wasm/Module.vuna` 引用——**只有 wasm 走 CPS + 显式机器**；
> OCaml 直接用 `Effect.Deep.match_with/continue`，native 用栈拷贝
> （`effAllocCapture`/`effResume`，O(N²) 见 debt D89）。handler 语义因此有**三份实现**。

目标：机器只实现一次（用 vuna 写在 base 里），三端只提供「闭包应用 + 分配」。

### 9.1 前置：一个「任意值」载体

机器帧要装异质值（任意 `a`、续延、opH、ret），所以需要源码级的不透明值类型：

```vuna
-- base：运行时类型不可命名 => IrTyOpaque（wasm anyref / OCaml Obj.t / native boxed）
axiom Obj : Type

-- 信任边界原语（identity；仅机器模块使用）
@vuna@prim@toObj   : {a : Type} -> a -> Obj
@vuna@prim@fromObj : {a : Type} -> Obj -> a
```

落地清单（一轮内完成，逐项可验收）：

1. `Base/Intrinsics.vuna`：`IType` 增 `IObj`（追加在末尾，保持既有 tag 顺序），
   两个 intrinsic 条目；
2. `Lowering/Ty.vuna` 的 `renderTyIntrinsic`：`IObj -> IrTyOpaque`；
3. wasm：`RtFunc 1 "$rt_erase"`（identity）；OCaml：`Obj.repr` / `Obj.obj`；
   native：identity（现有 `eraseFn`）；
4. 夹具：一个把 `Int`/`闭包`/数据值经 `Obj` 往返的程序，三端输出一致
   （`pure_cross/54_obj_roundtrip`）。

写机器时会撞到的两条语言侧约束（都已验证）：

1. 把**隐式多态值**（如 `fromObj : {a} -> Obj -> a`）实例化到**函数类型**时必须有期望
   类型（实参位置或注解）；否则 `fromObj o x` 在 `?a` 未解前先按「非函数」报
   `TC_TooManyArgs`。把拆箱放在实参位置即可。
2. **`axiom` 类型不能直接作构造子字段类型**（`data Box where MkBox : Obj -> Box` 报
   `TC_UnknownName`，同模块 axiom 也一样）。绕法：机器类型**参数化**并在签名里实例化
   —— `data Control v : Type where MkDone : v -> Control v …`，用到处写 `Control Obj`。
   已在 native 上用 `Ctl Eff.Obj` + Apply 循环验证跑通。

### 9.2 机器的库实现（`Base/Effect/Machine.vuna`）

```text
Control = Done Obj
        | Apply (Obj -> Control) Obj
        | Perform String String Obj (Obj -> Control)
        | Handle String String (Obj -> Obj) OpH (Obj -> Control) (Obj -> Control)

HandlerFrame = { key, name, ret, opH, kOuter, base }      -- base = cleanup 深度
ContCtx      = { prompt, kRest, prev }

run : Control -> Obj
```

`run` 是一层 `while` 循环：

- `Done v` → 返回；
- `Apply k v` → `k v`（一次调用，单帧）；
- `Perform` → 找帧、`opH op k kDone`；
- `Handle` → 装帧、跑 comp；
- `Return(f, v)`（由 `kOuter` 表达）→ 弹帧前跑 `base` 之上的 cleanup，`ret v` 交 `kOuter`。

一次性续延用 `Cont`（已有线性类型）或 `selK` 式的 used 位。

### 9.2.1 进度（现状）

- `Base/Effect/Machine.vuna` 已有：`Control v`（Done/Apply/Perform/Handle/Return/
  KDone/Resume）+ `Frame`/`Ctx` + **纯函数式**状态（`MSt`，不依赖 IORef）+ `run`；
  一次性约束用 used id 列表，遍历都带 fuel。夹具 `pure_cross/56_machine_skeleton`
  手搭 `handle (perform) {k 2}`，三端 6 checks 绿。
- lowering 侧已写好「机器步骤 → 库构造函数」的改写（`Ir.Cps.mSteps`）并验证会触发：
  接上流水线后 wasm codegen 报 ``unknown data family `Base.Effect.Machine.Control` ``，
  即改写确实生效、`@ir@m@*` 已被替换成 `Machine.*` 构造子。
- **卡点**：机器模块不在程序的「已加载 + DCE 可达」集合里（没有任何源码引用它，
  只有 lowering 生成引用），所以它的 `Control/Frame/Ctx` 声明和 `run` 等定义进不了
  IR unit。两条路：
  1. 把机器搬进 `Base.Effect.Core`（`Eff` 所在模块必然被加载；再把 `run` 加进各后端
     的可达根，一行）；
  2. 让 base 的公开面 import 机器模块，并在 lowering 里给 IR unit 补上它的 tyDecls。
  取 1（无循环依赖：Core 已经 import 了需要的 Data/Trait 模块）。
- **下一个缺口（0 元字典定义不发射）**：接上 `mStepsDef` 后 wasm 走到组装阶段报
  `unknown func: failed to find name $f_Applicative_Base_Effect_Core_Eff_r`。IR dump 里这个
  `def Applicative_Base_Effect_Core_Eff_r` 是存在的，说明不是 DCE 漏名（把它加进两个可达
  根后错误依旧），而是「0 元 dict 定义 vs 调用点写成 `call $f_…`」的形状不匹配——很可能是
  机器锥里某个定义把 dict 当函数应用（擦除实参残留）。下一步：在 IR 里 grep 该名字的
  `IrApp` 出现点，确认是哪个定义发的，再决定是补发射还是消掉那次应用。

- **下一步缺口（编译已通，运行时 trap）**：修掉「0 元定义被应用」的 codegen 缺陷后
  （提交 8cc1bb4：先 `global.get` 再逐个 `rt_apply`），`mSteps` 接线的产物**能组装**；
  `wasmtime` 跑起来在 `_start → rt_apply` 处 cast failure，说明入口/续延交接处还有一处
  形状不匹配（`runMain` 被改写成 `machineRun` 之后，入口仍按旧约定把某值当闭包应用）。

### 9.2.2 进度（机器已驱动 wasm 的 329/334 检查，仍有 3 个缺口）

把 `cpsDefsMachine` 临时接上 `mStepsDef` 后，wasm 后端**确实跑在库机器上**：334 个
checks 里 329 个通过，只有下面 3 类共 5 个 case 红（08/09/52/53/106）。修掉的协议
问题（都是库机器与旧 wat 语义不一致，与 lowering 无关）：

1. **`MkKDone` 也要走 ctx 回退**：旧实现直接 `finish`（弹帧交 kOuter）。wat 的
   `$rt_mKDone` 在 ctx 命中同一帧时先弹 ctx 再交该次 resume 的 `kRest`；否则外层
   handler 的日志/handler 链会丢一层（`effect/common/26_eff_console` 的
   `out:hello` 整条丢失）。现在 `MkReturn`/`MkKDone` 共用 `unwind`。
2. **resume 要重装被弹掉的帧**：pure answer 的 handler（如
   `joinEff (handleFs "real" …)`）先把答案（一个 Eff）交给 kOuter、帧被弹掉，之后
   才 resume；wat 用 `$rt_mInChain` + 重装帧处理这条路径。缺了它，`fs / real`
   在其后变成 `unhandled effect`（`effect/common/18_eff_fs_io`、`40_eff_fs_named`）。
3. **one-shot 集合用 HashMap**：`List Int` 线性查在 2000 次顺序 perform 下把
   wasm 默认栈打爆（递归 `memInt`）；`MSt.msUsed` 改成 `HashMap Int Bool`。
4. 顺带：`prim_fail` 自带 `vuna: runtime error: ` 前缀，机器里的文本改为裸消息
   （`106` 的 `continuation already resumed` 曾双前缀）。

lowering 侧同时修了 `mSteps` 的**应用脊重建**：`runThunk e u k` 之前被折成
`runThunk ((e u) k)`（多参调用把实参塞成单个实参，`_start` 处 cast failure 的直接
原因），现在用 `foldAppMap` 保持左结合。

剩余 3 个缺口（都已在同一轮里定位到机制，不是猜测）：

- ~~**`handleScoped` / `handleSelf`（08、09）**~~：已按「opH 第四个参数」落地——`Frame`/
  `MkPerform` 的 opH 多一个 `runScoped : Scoped ((v -> Control v) -> Control v) -> v`，
  `step` 派发时传入 `machineScoped`（当前 `MSt`/帧上跑嵌套循环，ctx 从空开始，
  used/next 沿用）；夹具 56 手搭的 opH 也带上并忽略该参数。lowering 侧的一版实现
  （clause 增第 4 个 binder + 把 `handleScoped`/`handleSelf` 调用改写过去）在接线状态
  下让 08、09 在库机器上通过，但**与 `mSteps` 接线是一体**（wat 路径的 clause 仍是 3 参），
  所以先不落地；接上机器时同批打开。
- **cleanup（52、53）**：`bracket` 用 `prim_cleanupPush/Pop` 维护宿主 LIFO，
  机器弹帧时按帧深度跑 cleanup。库机器需要 `MSt` 带 cleanup 栈 + 帧深度，并把这两个
  原语在 CPS 里降成 `Control` 步骤（现在的 `prim_fail` 文本/宿主栈都在 wat runtime）。
- **栈深度（106 的 effdepth）**：2000 次顺序 perform 在引擎默认栈下仍
  `call stack exhausted`；回溯是 `step → 续延闭包 → step` 的嵌套（wat 的
  `$rt_mRun` 是循环，resume 链不占 wasm 帧）。需要在机器里把「续延转移」做成
  tail 路径（显式 work item / 队列），否则只能靠 `return_call_ref` 级别的改造。

在 3 个缺口关闭前，wasm 仍走 `Wasm/Step.vuna` 的 wat 机器（`$rt_m*`），
`cpsDefsMachine` 里的 `map mStepsDef` 保持关闭；上面 4 条协议修复与 lowering 的应用脊
修复都已在库里，接入时直接生效。
- **cleanup（52、53）**：已进 base——`MSt` 带 cleanup 栈 + 深度，`Frame` 记安装时
  深度；`Control.MkPushCleanup`/`MkPopCleanup` 直接改状态，`finish` 弹帧前用
  `dropCleanups` 按深度跑（thunk 宿主直调、结果丢弃）；`bracket` 改走
  `pushCleanup`/`popCleanup`（类型层仍是宿主原语，机器 lowering 里按名字改写成上述
  Control 步骤，代码已就位、随接线启用）。手搭夹具 `pure_cross/57_machine_cleanup`
  覆盖「push → 帧退出 → cleanup 执行」，三端 6 checks 绿。接线状态下 52、53 通过。

- **栈深度（106 的 effdepth）是唯一剩余缺口**：2000 次顺序 perform 在引擎默认栈下
  `call stack exhausted`；把 `max-wasm-stack` 提到 16 MiB 就能正常输出 `2000`，
  说明是**线性栈深度**而不是死循环。回溯是 `step → 续延闭包 → step` 每 perform 一轮：
  续延在 `step` 的实参位置被调用（`step … (k v)`），调用者的大帧（`step` 有上百个
  local）在续延求值期间一直被保留。wat 机器靠单层循环 + 「续延转移返回 step」规避；
  纯机器要等价，需要把转移做成尾路径（work item 队列 / `return_call_ref` 级别的改造），
  或让续延调用不再保留 `step` 帧。

- **106 继续收窄（栈深度）**：
  1. 机器改成**单层循环**：`step` 只做一次派发、返回 `Pair MSt Control`，`runGo` 用循环消费
     （之前的 `step → unwind → finish → step` 递归每 perform 留一帧）。接线实测：2000 次
     perform 的回溯里 `runGo` 只剩 2 帧（之前是上千帧），说明机器自身已经平坦。
  2. wasm codegen 的**尾位置闭包应用**改用 `return_call $rt_apply`（`genApplyArgs`），
     续延链（CPS 的 `\x => …` 转移）不再保留调用者帧。
  3. 仍然爆栈的那一段定位到：机器自身的**自引用被物化成柯里化闭包**再应用
     （`lam124 → lam125 → lam126 → return_call runGo`，即每个 perform 仍留一帧）。
     下一步查 `genGlobalCall` 为何把该自引用走 `genGlobalRef` 闭包路径（arity 在表里
     看起来是 0/偏小），修掉后 106 应可通过。

- **106 再收窄（call 帧）**：两处 codegen 缺陷修掉后，机器调用已从「柯里化闭包 +
  每实参一次 `rt_apply`」变成直接 `call $f_..._step` / `call $f_..._runGo`：
  1. `anf` 现在按 flatten 后的 (head, args) 整体处理，保持应用脊扁平（之前逐层
     `IrApp` 把中间节点绑成 let，头部变变量 → `genApplyValue` 的 eta 闭包路径）；
  2. `genRtApp` 对 `prim_erase` 恒等直通，保住尾位置（之前被当实参用 `noTail` 生成）。
  剩余：`runGo` 的自调用 wat 里仍是 `call runGo; set; get; set; get`（ANF 在递归调用
  外面留了 `let`，使调用不在尾位置），所以每 perform 仍留一帧。下一步让 ANF 不在
  **尾表达式**外包 let（或让 codegen 识别 `let x = e in x`），106 即可通过。

### 9.3 后端义务与迁移顺序

| 步 | 内容 | 验收 |
|---|---|---|
| 1 | `Obj` + 两个 coercion 三端打通 | 往返夹具三端一致 |
| 2 | `Eff.Machine` 写出来（vuna），先用 `Done/Apply` 跑一个手搭的 Control | native 上跑通 |
| 3 | **native** 接机器：`prim_effectPerform/Handle/Self` 改成构造 `Control`，入口跑一次 `run`；删栈拷贝路径 | `pure-cross` + `effect-common` 全绿；D89 的 O(N²) 读数消失 |
| 4 | **OCaml** 接机器（先保留 `Effect.Deep` 作为差分 oracle 跑同一组夹具，再切库机器） | 同上 |
| 5 | **wasm** 用机器替换 `Wasm/Step.vuna` 里的手写 wat 机器（`@ir@m@*` 变成对库函数的 `IrGlobal` 调用） | `106` 默认栈；`114/115` 冒烟 |

### 9.4 风险与边界

- `Obj` 放宽了擦除面：`toObj/fromObj` 是信任边界原语，只允许机器模块调用；
  加一条检查（或 allowlist）避免扩散到用户面。
- 机器的 `Control` 用闭包承载续延：与 wasm 现状同构，所以**常量栈**仍取决于
  「每次转移都是一次循环迭代」（`apply` 用尾调用），这一点在 native/OCaml 上更容易做到。
- 已完成的部分可直接复用：closure/CPS lowering（`mCps`、`mEffContLambda`、
  `mStripErase`）、cleanup 退出钩子、answer/frame 生命周期规则。