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

仍然成立的两条限制：

1. **栈仍随 perform 次数线性增长**（约 96 B/次）：组合子的 CPS 管道里还有普通
   `IrApp` 在同一条链上层层返回；默认栈足够跑 `106`，但还不是常量栈。
2. **`bracket`/`finally`**（`prim_cleanupPush/Pop`）的清理钩子还没有机器实现：
   wasm 侧**显式拒绝**并给出诊断，不再回落 stack switching（debt D42）。

native / OCaml 仍走各自的 handler 实现（native 是栈拷贝，O(N²) 见 D89）；
三端统一到同一 `Control` 协议是后续工作。
