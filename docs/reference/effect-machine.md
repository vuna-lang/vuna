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
   - 1b（待做）：`Wasm` 内实现 `@ir@m@*` 原语、显式 ContStack 与单层 trampoline，
     并改发 `@ir@m@*`。先用 `26_eff_console` / `18_eff_fs_io` / `40_eff_fs_named`
     的宿主组合验收，再跑 `106` 的常量栈（去掉大栈旗标）。
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