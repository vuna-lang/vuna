# wasm 效应 handler（stack switching）

> 状态：**工具链已验证，运行时尚未实现**。本页记录 stack-switching 的可行性探针、与
> `Base.Eff` 语义的对应关系和实现切分；wasm 当前仍拒绝 `perform` / `handle`。

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

## 3. 实现切分

1. **Wat 模型/渲染**：确认/补齐 `tag`、`cont`、`cont.new`、`resume`、`suspend`、
   `(on $tag $label)` 与 `elem declare` 的文本构造；`wasm-tools` 已验证语法。
2. **`Wasm.Runtime`**：加泛型 tag、`$ft`/`$ct` 类型、`rt_eff_perform`、
   `rt_eff_handle`（含正常/匹配/转发三条路径）与 `ret` 调用。
3. **`Wasm.Module`**：把 `prim_effectPerform` / `prim_effectHandle` 接进 `rtImplOf`；
   入口按 `irEntryHandlersOf` 预装宿主 handler，移除
   `host effect handlers are not supported yet`。
4. **测试**：把 `110_effect_parity` 的夹具加 wasm 后并入 `109_backend_parity`；
   `106` 保留 double-resume/trap 等 wasm 机制用例。
5. **宿主效应**：`console` 等宿主叶子已经存在；先接 Console/Exit/Ref 的 entry handler，
   再按 native 的顺序扩 Fs/Clock/Env。

## 4. 风险与开放问题

- **Wat AST**：现有 `Wasm.Model` 是否把指令/标签作为结构化构造，还是直接字符串；
  若后者的自由度更高但确定性/校验弱，需要新增构造并锁 WAT 逐字节确定性。
- **值表示**：payload/结果统一 `anyref` 时，op 记录、字符串、闭包如何装箱；避免每次
  effect 都新建过多对象。
- **函数值调用**：`ret`/`opH`/`k` 的调用约定（闭包字段 vs typed funcref）要与现有
  单参闭包/`$rt_apply` 对齐。
- **key/name 路由**：外层转发后的结果类型必须与内层 comp 的 continuation 类型对齐；
  泛型 `$ct` 应足够。
- **性能**：每个 effect 至少一次 suspend/resume；one-shot、无 multi-shot，符合当前语义。

## 5. 相关阅读

- [wasm.md](wasm.md)：wasm 后端现状与已知边界。
- [native-effects.md](native-effects.md)：native 的栈拷贝续延实现。
- [effects.md](effects.md)：效应语义与 one-shot 约束。
- 探针：`test/suite/fixtures/wasm_stack_switch/forward.wat`；
  `test/suite/steps/106_wasm_backend.steps` 第 11 case。
