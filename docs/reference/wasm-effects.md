# wasm 效应 handler（CPS lowering）

> 状态：**纯用户 handler 默认走选择性 CPS + Step driver（mode 5，值语义 resumption）；
> 宿主+用户组合仍走旧路径（debt D105）**。终态机器见 [effect-machine.md](effect-machine.md)（显式帧/续延栈，三端共用协议）。路线是
> 「选择性 CPS + Step trampoline」：只 CPS 化效应 thunk 与 handler clause，
> `Eff` 仍是数据；全片段 CPS 不是路线（相关代码已删除）。带内建宿主 handler 行、同时又出现
> 用户 handler 的程序仍回落到 stack switching（见 §4）。

## 0. 当前路线与目标（选择性 CPS）

**目标**：把现有 `Ir.Cps` 的 handler 控制流从 wasm 异常/`try_table` 改成显式 Step
trampoline——纯用户 handler 与宿主+用户组合都走同一套 driver，栈深回到常量级，删除
stack-switching 回落。

**不做什么**：全片段 CPS、改 `Eff` 的 `MkEff` 数据表示、multi-shot、宿主异步。

阶段（每阶段独立可验收）：

1. **handler clause 显式 CPS（已完成）**
   - 识别 `@vuna@handle@o` / `@vuna@handle@ret` binder；
   - `opH: \o k -> body` 改成 `\o k kDone -> body'`：`k v` 是 resumption（直接返回
     Step，不追加 k），其余结果/控制流交给 `kDone`；`ret` 保持原样（driver 先 `ret`
     再 `kOuter`）；
   - 入口是 `Ir.Cps.cpsDefsStep`，默认不切换，先锁 IR 形状与编译自检。
2. **Step 选择性模式（effMode = 5，纯用户 handler 已完成）**
   - `@ir@cps@perform` / `@ir@cps@handle` 与 Step 构造器同 arity（4 / 7），直接映射；
   - trampoline：`runPure = stepRun (runThunk e unit stepDone)`；
   - driver：Perform 用 `opH op k kDone`（`k` 为 perform 点续延），Handle 用
     `comp u handleDone`，Done / Abort 复用；
   - 最小复现（`perform` + `>>=` + 纯用户 handler）通过后，跑 `pure_cross` 全组。
3. **常量栈验收（D103，部分）**
   - `effdepth` 的 2000 次顺序 perform 在很小的 `-W max-wasm-stack` 下通过；
   - 纯用户 handler 用例默认切到 mode 5，旧 mode 3 保留为回滚路径。
4. **宿主+用户组合（D102）**
   - 入口行同时含宿主 handler 与用户 handler 时不再走 `directable` / stack switching；
     宿主原语同步完成，按 driver 的宿主分支返回 Done；
   - Fs / Process / Net / Console 组合进 wasm 三端矩阵，Node/Chromium 默认引擎 smoke
     覆盖 `114` / `115`。
5. **收敛与清理**
   - 删除 `$rt_cps*`（`$abort` + `try_table`）与 `effMode = 2` 的 stack-switching 回落；
   - 更新本文与 debt D102 / D103，按需轮换 seed，全量 suite + CI 门禁验收。

**验收口径**：纯用户 handler 产物不含 `try_table` / `$abort`；顺序 perform 栈深常量；
宿主+用户组合与纯用户 handler 语义一致；不引入新的 `Eff` 表示。

## 1. CPS 协议

`Ir.Cps` 只改写 `Eff` / `Scoped` 的 thunk，纯代码仍是直接风格：

- thunk 从 `\u => e` 变成 `\u k => ⟦e⟧ k`；`k` 是普通闭包；
- thunk 运行点（`case e of MkEff f => f u`、`runThunk e u`）追加 `k`；
- `prim_effectPerform` / `prim_effectHandle` / `prim_effectSelf` 换成
  `@ir@cps@perform` / `@ir@cps@handle` / `@ir@cps@self`；
- `runPure` / `runEff` / `runMain` / `handleScoped` 是 trampoline 边界，传 identity。

变换只看 `MkEff` / `MkScoped` / `IrEffThunk` 三个构造点。用户代码只构造 `Eff` 值，
不直接跑 thunk，因此不需要全程序 CPS。

## 2. 运行时结构

- `$hframe`：`key / name / ret / opH / kOuter / prev / cleanDepth / selfPrev`；
  `$g_handlers` 是当前 handler 栈顶。
- `$cpsK`：一次性 continuation 包装 `{k, used}`；第二次 resume 走
  `$rt_resumeTwice`，文本仍是 `vuna: runtime error: continuation already resumed`。
- `@ir@cps@perform key name op k`：找最内层匹配 frame，调用 `opH(op, k')`；
  `opH` 返回后把结果包成 `$abortMsg` 抛给匹配的 handle。
- `@ir@cps@handle key name ret opH comp u k`：push frame，运行 `comp(u, kComp)`；
  `kComp` 对正常结果应用 `ret`。abort 用 wasm 异常（`$abort` + `try_table`）：
  目标是自己则执行 cleanup、交 `kOuter`；否则 cleanup 后重抛给外层。
- `@ir@cps@self th k`：复制当前 opH 的 frame（`kOuter = k`），重跑 scoped 子计算。
- cleanup 用 `$g_cleanups` + `$g_cleanDepth` 的 LIFO 栈；handler frame 记录进入时的
  深度，abort 时退到该深度并逐项执行。

## 3. 后端接入

- `Wasm.Module.build` 在「入口行没有内建宿主 handler」且需要 handler 时调用
  `Ir.Cps.cpsDefs`，以 `effMode = 3` 发射 CPS 运行时；产物不含 `cont` / `tag $eff` /
  `suspend` / `resume`。
- 入口行只有内建宿主效应、没有用户 handler 时仍走原有的 send 直连（`effMode = 0`）。
- 入口行有内建宿主 handler、同时有用户 handler 时暂走 stack switching（`effMode = 2`）。
- `106` 的 pure handler 用例不再需要 `-W stack-switching=y`；`114` / `115` 的 Node、
  Chromium 默认引擎探针改为期望用户 handler 产物可编译/运行。

## 4. 剩余限制

- **嵌套 opH 的宿主效应**：用户 handler 的 `opH` 里再调用宿主 `Eff` 时，外层 handler
  的处理会穿过内层 handler 的 `try_table`；当前实现会提前弹出内层 frame。这类程序
  （Fs / Console 的 named + entry host 组合）暂回落到 stack switching，直到 CPS
  driver 支持「opH 内的外层 perform 返回后继续内层 opH」。
- **栈深**：CPS 的每次 resume 会保留 `perform` / `opH` 调用帧；2000 次顺序 perform
  需要约 4 MiB 的 wasm 栈（`106` 的 `effdepth` 用 `-W max-wasm-stack=4194304`）。
  这是当前 naive CPS 的已知代价，driver/trampoline 落地后再回到常量栈。
- one-shot：重复 resume trap；multi-shot 不做。
- 宿主效应面（Fs / Process / Net / Stdin 的运行期 trap、Net 的生成期拒绝）与
  stack-switching 路径相同，见 [wasm.md](wasm.md) §5/§8。

## 5. 相关阅读

- [wasm.md](wasm.md)：wasm 后端现状、浏览器能力范围、宿主符号与栈口径。
- [native-effects.md](native-effects.md)：native 的栈拷贝续延实现。
- [effect-machine.md](effect-machine.md)：目标态的显式效应机器（三端协议、answer row、常量栈）。
- [effects.md](effects.md)：效应语义与 one-shot 约束。
- `Ir.Cps`：`packages/compiler/lib/Vuna/Compiler/Ir/Cps.vuna`；wasm 运行时：
  `packages/compiler/lib/Vuna/Compiler/Wasm/Runtime.vuna`。
