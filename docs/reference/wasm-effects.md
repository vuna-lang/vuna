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

运行时只用一个泛型 tag，result 是 resume 时传回 `perform` 的值：

```wat
(tag $eff (param anyref) (result anyref))
```

payload 是 `$arr [key, name, op]`（key / name 是字符串，op 是操作值）。

comp thunk 是 `EffUnit -> a` 的闭包；运行期闭包 code 的类型是 `$ft`，continuation
用 `$cft` / `$ct`：

```wat
(type $ft (func (param anyref) (param anyref) (result anyref)))  ;; (env, arg) -> result
(type $cft (func (param anyref) (result anyref)))                ;; cont payload -> result
(type $ct (cont $cft))
```

- `prim_effectPerform key name op` → 构造 payload，`suspend $eff payload`；
- `prim_effectHandle key name ret opH comp` → 在 `resume $ct (on $eff $on) unit
  (cont.new $ct comp)` 里跑 comp，并循环处理 `$on`：
  - 正常返回：把结果交给 `ret`（wasm 函数引用/闭包）；
  - `(payload, k)` 且 key/name 匹配：调用 `opH(op, k)`；`k` 用给定值在同一 handler
    循环下 resume 捕获的 continuation；
  - key/name 不匹配：`suspend $eff payload` 转发给外层；外层 resume 回来后，用返回值
    resume `k` 并继续循环（探针验证的正是这条路径）。
- 一次性：续延上下文 `$effK` 带 `used` 标记；第二次 resume 走 `$rt_resumeTwice`，
  以 `vuna: runtime error: continuation already resumed` 退出（exit 2），
  `106` 第 13 个 case 锁这段文本。
- `ret` / `opH` / `k` 都是运行时函数值，统一经 `$rt_apply` 调用。

## 3. 运行时实现

- **Wat 模型/渲染**：`WatType.WatContType`、`WatTag`、`wmTags` 与 tag section；
  `cont.new` / `resume` / `suspend` 以 `IPlain` 文本指令生成，标签/标签 clause 走固定
  名字（`$eff` / `$on`）。
- **`Wasm.Runtime`**：
  - payload = `$arr [key, name, op]`，泛型 tag `$eff : [anyref] -> [anyref]`；
  - `$rt_effPerform` = 构造 payload 后 `suspend $eff`；
  - `$rt_effHandle` = `cont.new $ct (ref.func $rt_effThunk)` + `$rt_handleLoop`；
  - `$rt_effSelf` = 用 `$g_self` 链顶的 `(key,name,ret,opH)` 重跑 `$rt_handleLoop`
    （`prim_effectSelf` / `Base.Eff.handleScoped`）；`$rt_handleLoop` 调 opH 前压链、返回后弹链；
  - `$rt_handleLoop`：`resume` 的 `(on $eff $on)` 块；正常返回走 `ret`，匹配时
    调 `opH(op, k)`，不匹配时再次 `suspend $eff` 转发给外层，外层 resume 后继续恢复
    自己的 continuation；
  - `$rt_effResumeClo` 把 captured continuation + ret/opH/key/name 包成 `$clo`，供
    `opH` 的 `k` 调用（经 `$rt_apply`）；
  - handler 运行时全部走尾调用：`$rt_apply` 用 `return_call_ref $ft`，`$rt_handleLoop` /
    `$rt_effResumeClo` / `$rt_effThunk` 用 `return_call`，因此每次 `perform` 的
    handleLoop / apply / resumeClo 帧在下一次 effect 前让位，不在调用栈上累积。
- **`Wasm.Module`**：`prim_effectPerform` / `prim_effectHandle` / `prim_effectSelf` 接进 `rtImplOf`；
  入口按 `irEntryHandlersOf` 预装 base 内建效应的 `run*Host`（清单见
  `Vuna.Compiler.Base.Intrinsics.builtinEffects`）；具体操作能否落地取决于 wasm
  符号表（见 §4）。
- **分支臂顺序生成**：`IrIf` 与 `IrNatCase` 的两臂按 then→else / zero→succ **顺序**
  生成；`resumeArm` 只把后一臂的作用域回到基线，`gsNextLam` 与函数表继续累加。
  这样两臂各自的 lambda 不会撞同一个 `$lamN`，`ref.func` 不会指向另一臂的函数体
  （细节见 [wasm.md](wasm.md) §6）。
- **测试**：效果夹具 `35_eff_*`–`48_eff_*` 与分支闭包夹具 `49_if_branch_closures` /
  `50_nat_branch_closures`（各 `11110`）都由 `109_backend_parity` 对拍三端；
  `106` 保留 stack-switching 工具链探针。所有 wasm 运行统一带
  `-W stack-switching=y -W gc=y -W function-references=y`。

## 4. 剩余限制

- **运行参数**：产物运行时函数总是包含 stack-switching 指令，wasmtime 必须显式开
  `-W stack-switching=y`。
- **one-shot**：重复 resume 由 `used` 标记拦下，输出
  `vuna: runtime error: continuation already resumed` 并 exit 2；续延仍是一次性的。
- **宿主效应面**：entry 预装的 `run*Host` 覆盖 Console / Fs / Clock / Env / Process /
  Exit / Stdin / Args / Net（清单见 `Intrinsics.builtinEffects`）；`Ref` 不是 handler
  家族，`refNew` / `refRead` / `refWrite` 直调 `@vuna@host@*Ref`。每个操作能否落地取决于
  wasm 符号表：
  - 直连实现的：Console（`print` / `eprint`）、Exit（`exitOp` → `proc_exit`）、
    Args（`getArgs`）、Fs（`tryReadFile` / `tryWriteFile` / `tryWriteFileAtomic` /
    `tryReadDir` / `tryIsDirectory` / `tryMakeDir` / `tryMakeDirExclusive` /
    `tryRemoveFile` / `tryRemoveTree` / `tryRename` / `trySymlink`、`fileExists` /
    `fileMtime` / `fileSize`）、Env（`getenv` / `getcwd` / `execPath`）、Clock
    （`effTimeUs_host` / `@vuna@host@sleep`）、Ref（`newRef` / `readRef` / `writeRef`）。
    `execPath` 返回空串；`tryRemoveTree` 只 unlink 文件或删空目录，不递归。
  - 运行期失败（`$rt_hostTrap*`，文本 `vuna: runtime error: wasm host operation is not
    implemented`，exit 2）：Stdin（`readLine` / `readBytes`）与 Process 的 `runIn` /
    `spawn` / `wait` / `exit_process_host`。
  - 生成期拒绝（符号表外，`WasmUnsupported`）：Net 的 `@vuna@host@tryNet*`。
- **直接调用 `@vuna@prim_eff_*`**：`readDir` / `getArgs` / `getenv` / `getcwd` /
  `execPath` / `sleep` / `print` / `eprint` / `exit` / `newRef` / `readRef` /
  `writeRef` / `hostStatus` 直连真实实现；`readFile` / `writeFile` /
  `writeFileAtomic` / `isDirectory` / `makeDir` / `removeFile` / `fileExists` /
  `fileMtime` / `fileSize` / `readLine` / `readBytes` / `spawn` / `wait` 是运行期
  trap。base 的 `FsOp` handler 走 `@vuna@host@try*`，不经过这些 trap 原语。
- **进程派生**：WASI preview1 没有 `fork` / `exec`，所以多包 workspace 的文本格式
  `check`（成员包 `processSpawn` + `processWait`）在 wasm 上会以运行期错误退出；
  机器格式 `--error-format json` 走进程内顺序检查。
- **栈深度**：effect 次数本身不占调用栈（handler 运行时是尾调用）；能用多少次 effect
  由被处理计算自己的递归深度决定——默认 `max-wasm-stack`（512K）下 2000 次 perform 正常
  （`106` 的 `effdepth` 用例锁 2000 次）。编译器级输入还要考虑长列表的**非尾**辅助
  （`map` / `append` 这类 `1 + f rest` 形态）：它们按输入规模吃栈，需要把
  `max-wasm-stack` 提到与 OCaml 默认 8 MiB 栈同量级；词法主循环 `Lexer.lexChars` /
  `lexCharsWith` 是尾递归（逆序累积 + 一次 reverse），不按 token 数吃栈。
- **性能**：每个 effect 至少一次 suspend/resume；符合 one-shot 语义。

## 5. 相关阅读

- [wasm.md](wasm.md)：wasm 后端现状、浏览器能力范围、宿主符号总表与栈口径。
- [native-effects.md](native-effects.md)：native 的栈拷贝续延实现。
- [effects.md](effects.md)：效应语义与 one-shot 约束。
- 探针：`test/suite/fixtures/wasm_stack_switch/forward.wat`；
  `test/suite/steps/106_wasm_backend.steps` 第 11 case（转发）、第 12 case（2000 次
  perform）与第 13 case（重复 resume 的 trap 文本）。
