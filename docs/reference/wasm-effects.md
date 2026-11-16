# wasm 效应 handler（stack switching）

> 状态：**已实现并接入三端对拍**。本页记录 stack-switching 的工具链验证、与
> `Base.Eff` 语义的对应关系、运行时实现与剩余限制。

## 1. 工具链结论

当前开发环境的工具链已经支持 typed continuations：

- `wasmtime 50.0.0`：`-W stack-switching=y` 可用；
- `wasm-tools 1.262.0`：`wasm-tools parse` 能解析 `cont` / `tag` / `cont.new` /
  `resume` / `suspend`，并交给 wasmtime 校验/执行。

探针 `test/suite/fixtures/wasm_stack_switch/forward.wat` 覆盖了实现深 handler 时最关键
的两点：

1. 内层 `resume` 的 `(on $eff $label)` 会拦截 effect；不匹配的 effect 通过再次
   `suspend $eff` 转发给外层 handler。
2. 外层 handler resume 后，内层 handler 继续用自己的 continuation 恢复 comp。

`106_wasm_backend.steps` 的第 11 个 case 用 wasmtime 跑该探针，输出 `101`。

## 2. 与 `Base.Eff` 的对应

建议只用一个泛型 tag：

```wat
(tag $eff (param anyref) (result anyref))
```

- payload 是 `{ key, name, op }` 记录（或三元数组）；
- result 是 resume 时传回 `perform` 的值。

comp thunk 是 `EffUnit -> a`，用 continuation 类型：

```wat
(type $ft (func (param anyref) (result anyref)))   ;; unit -> result
(type $ct (cont $ft))
```

- `prim_effectPerform key name op` → 构造 payload，`suspend $eff payload`；
- `prim_effectHandle key name ret opH comp` → 在 `resume $ct (on $eff $on) unit
  (cont.new $ct comp)` 里跑 comp，并循环处理 `$on`：
  - 正常返回：把结果交给 `ret`（wasm 函数引用/闭包）；
  - `(payload, k)` 且 key/name 匹配：调用 `opH(op, k)`；`k` 用给定值在同一 handler
    循环下 resume 捕获的 continuation；
  - key/name 不匹配：`suspend $eff payload` 转发给外层；外层 resume 回来后，用返回值
    resume `k` 并继续循环（探针验证的正是这条路径）。
- 一次性：wasm continuation 本身 one-shot（重复 resume trap）；需要把 trap 包成
  `.rodata` 风格的 `vuna: runtime error: continuation already resumed` 时加 `used` 标记。
- `ret` / `opH` / `k` 都是运行时函数值；wasm 后端已有闭包/函数引用表示，需确认任意
  `anyref` 调用路径。

## 3. 运行时实现

- **Wat 模型/渲染**：`WatType.WatContType`、`WatTag`、`wmTags` 与 tag section；
  `cont.new` / `resume` / `suspend` 以 `IPlain` 文本指令生成，标签/标签 clause 走固定
  名字（`$eff` / `$on`）。
- **`Wasm.Runtime`**：
  - payload = `$arr [key, name, op]`，泛型 tag `$eff : [anyref] -> [anyref]`；
  - `$rt_effPerform` = 构造 payload 后 `suspend $eff`；
  - `$rt_effHandle` = `cont.new $ct (ref.func $rt_effThunk)` + `$rt_handleLoop`；
  - `$rt_handleLoop`：`resume` 的 `(on $eff $on)` 块；正常返回走 `ret`，匹配时
    调 `opH(op, k)`，不匹配时再次 `suspend $eff` 转发给外层，外层 resume 后继续恢复
    自己的 continuation；
  - `$rt_effResumeClo` 把 captured continuation + ret/opH/key/name 包成 `$clo`，供
    `opH` 的 `k` 调用（经 `$rt_apply`）；
  - handler 运行时全部走尾调用：`$rt_apply` 用 `return_call_ref $ft`，`$rt_handleLoop` /
    `$rt_effResumeClo` / `$rt_effThunk` 用 `return_call`，因此每次 `perform` 的
    handleLoop / apply / resumeClo 帧在下一次 effect 前让位，不在调用栈上累积。
- **`Wasm.Module`**：`prim_effectPerform` / `prim_effectHandle` 接进 `rtImplOf`；
  入口按 `irEntryHandlersOf` 预装宿主 handler（`main : Eff r a` 已支持）；Console/Exit/Ref
  的宿主叶子映射补齐。
- **测试**：效果夹具已并入 `109_backend_parity`（`38_eff_*`–`47_eff_*`，三端对拍）；
  `106` 保留 stack-switching 工具链探针。所有 wasm 运行统一带
  `-W stack-switching=y -W gc=y -W function-references=y`。

## 4. 剩余限制

- **运行参数**：产物运行时函数总是包含 stack-switching 指令，wasmtime 必须显式开
  `-W stack-switching=y`。
- **one-shot trap 文本**：重复 resume 由 wasm 运行时 trap；尚未包装成 Vuna 路径的
  `continuation already resumed` 文本（三端对拍暂不覆盖 double resume）。
- **宿主效应广度**：Console/Exit/Ref 已接；Fs/Clock/Env/Process/Stdin 等未实现宿主叶子
  仍在 `rtImplOf` 处拒绝。
- **栈深度**：effect 次数本身不占调用栈（handler 运行时是尾调用）；能用多少次 effect
  由被处理计算自己的递归深度决定——默认 `max-wasm-stack`（512K）下 2000 次 perform 正常，
  同一栈深度的纯递归才是真正的上限（`106` 的 `effdepth` 用例锁 2000 次）。
- **性能**：每个 effect 至少一次 suspend/resume；符合 one-shot 语义。

## 5. 相关阅读

- [wasm.md](wasm.md)：wasm 后端现状与已知边界。
- [native-effects.md](native-effects.md)：native 的栈拷贝续延实现。
- [effects.md](effects.md)：效应语义与 one-shot 约束。
- 探针：`test/suite/fixtures/wasm_stack_switch/forward.wat`；
  `test/suite/steps/106_wasm_backend.steps` 第 11 case（转发）与第 12 case（2000 次 perform）。
