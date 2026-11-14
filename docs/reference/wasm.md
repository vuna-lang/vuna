# wasm 后端（M2）

> 状态：**M2 切片已端到端工作**（`main` 为 Int / Nat / String / Bool；支持 `let` / `if` /
> 顶层饱和调用 / 立即 lambda 应用 / Nat 结构递归 / `++` 链 / 内建饱和应用 / 入口打印）。
> 用户 `data` / record / 通用 `case` / 闭包值 / `Float` / Effect / FFI 仍被明确拒绝
> （`WasmUnsupported`）。实现入口：
> `Vuna.Compiler.Wasm.{Model,Instr,Types,Runtime,Module,Render}`，
> 驱动 `Vuna.Compiler.Driver.Wasm`。

## 1. 产物与工具链

- **canonical 产物是 WAT 文本**（`main.wat`）；`.wasm` 不手写、不进 Git，由
  `wasm-tools parse main.wat -o main.wasm` 生成（版本由 Nix 固定）。
- `vuna compile <PKG> <OUT> --target wasm` → `<OUT>/main.wat`。
- `vuna build <PKG> --target wasm --out <OUT>`：写 `<OUT>/main.wat` + `<OUT>/build.sh`，
  并直接调用 `wasm-tools parse` 产出 `<OUT>/main.wasm`（工具缺失/失败即 exit 1，
  不静默留半成品）；`--no-compile` 只写 WAT + `build.sh`。
- `--target` 取值校验在 CLI 解析层（`ocaml|wasm|native`），未知目标是用法错误（exit 2），
  不再静默回落到 OCaml。
- 运行时（本地 nixpkgs 是 wasmtime 50 / wasm-tools 1.262；旧版 41 需要显式开 GC）：
  `wasmtime run main.wasm`（50 默认开 WasmGC）。跨版本写法：
  `wasmtime run -W gc=y -W function-references=y main.wasm`。
- 工具链是**构建期/测试期外部工具**，不进 TCB、不进 seed（与 native 侧 `cc` 同构）：
  `nix/common.nix` 的 `wasmTools`（devShell、`vuna-run-tests`、`vuna-tests-*` 的 PATH）。

## 2. 数据表示（WasmGC）

统一值类型 `anyref`，不做类型特化：

| Vuna | wasm |
| --- | --- |
| Int / Nat | `(struct (field i64))`，63 位语义（wrap / 逻辑移位 / 除零 trap） |
| Bool | `i31`（`ref.i31`） |
| String | `(array (mut i8))`；字面量 `array.new_data $str $d0` |
| 数组 | `(array (mut anyref))`（M2 无运行时对象，仅类型表预留） |
| 变体 / record | `(struct (field i32 tag) (field anyref ...))` / 纯字段 struct（M3） |
| 闭包 | `(struct (field (ref $ft)) (field anyref env))`，`$ft = (func anyref anyref (result anyref))`（M3） |

## 3. 模块布局（稳定 diff）

- 名字稳定：`$t_<watName family>`、`$f_<watName>`、`$g_<watName>`、`$d_<N>`，
  由 Vuna 全限定名派生，**不按位置编号**；`$d_` 只用于数据段；运行时函数 `$rt_*`。
- 固定顺序：types（基础类型 → 按声明序的族）→ imports → memory → globals
  （按定义序，**只含零参定义**）→ functions（Runtime → 用户函数（定义序）→ `_start`）
  → elements → data → exports。
- 缩进固定 2 空格、一条指令一行；行宽上限 100 列，超长字符串按 24 字节分块
  为相邻字面量。
- 同一 IR 的 WAT 字节确定；`.wasm` 只保证行为（字节依赖工具版本，由 Nix 固定）。
- 局部变量编号只在**函数内**递增（`$l<n>`）；每个函数生成前局部表清零，
  结束后恢复外层状态。

## 4. IR 支持面（M2）

从 `IrEntry.irEntryMain` 沿 `irDefDeps` 收集**可达**定义，只生成可达函数与可达全局；
不可达定义即使含不支持构造也不拒绝（与 native 同策略）。

| IR 节点 | M2 | 说明 |
| --- | --- | --- |
| `IrVar` / `IrInt` / `IrBool` / `IrCast` / `IrStr` | 支持 | 字符串字面量进 `$d0` 池，空串走 `array.new_default` |
| `IrGlobal` | 支持（零参引用） | arity > 0 当值引用 → 拒绝（函数值） |
| `IrLet` | 支持（≤1 运行时 binder） | 多运行时 binder（boxed case 降级）拒绝 |
| `IrIf` | 支持 | 条件 `ref.cast i31` + `i31.get_u`；两臂局部表合并 |
| `IrApp` | 支持饱和顶层调用、单参立即 lambda 应用 | 后者覆盖 `let` 的脱糖；部分应用/高阶/函数值拒绝 |
| `IrLam` | 仅作函数体 / 单参立即应用 | 嵌套、作为值 → 拒绝 |
| `IrNatCase` | 支持 | `sc == 0` 二选一；succ binder = `sc - 1`（重新装箱），catch binder = `sc` |
| `IrRtApp` | 支持白名单 | 参数左→右；`&&`/`||` 短路在 Lowering 已降成 `IrIf` |
| `IrConcatMany` | 支持 | 左折叠到 `$rt_strConcat` |
| `IrRt` | 仅 `@ir@natSucc`（调用 head）与入口 show | 其它 → 拒绝（函数值） |
| 用户 `data` / record / 通用 `case` / `IrCtor` / `IrProj` / `IrRecUpd` / Float / Effect / extern | 拒绝 | `wasm target: ... not supported yet` |

- 入口：`main` 必须是零参值；`main : Eff` 拒绝。入口 show 只接受
  `@ir@showInt` / `@ir@showNat` / `@ir@showBool` / `@ir@showStr`；
  `showFloat` / 自定义 Show 拒绝。`--no-print` 不打印，仍求值。
- **零参定义**在 `_start` 里按依赖序初始化进全局（每次引用读全局，不重算）；
  **饱和函数**（arity > 0）生成 `$f_<name>` 并被 `call`。

## 5. 运行时符号

`Wasm.Runtime` 按 `Ir.Runtime` 契约的**符号名**实现子集；语义参考实现是
`Vuna.Compiler.Codegen.Term` 的 `bi_*` / `dtp_*` 模板，不重新定义语义：

| 组 | 已实现 |
| --- | --- |
| Int | `+ - * /`（63-bit wrap；除零 → `$rt_failStr` + `unreachable`）、`bitAnd/Or/Xor/Not/Shl/Shr`、`bi_eq_int` / `bi_neq_int` / `bi_lt_int` / `bi_le_int` / `bi_gt_int` / `bi_ge_int`、`&&` / `\|\|` |
| Nat | `@ir@natSucc`（饱和）、`natAdd` / `natSub` / `natMul` / `natDiv`（饱和与截断语义）、`natToInt`（恒等）/ `natFromInt`（负数钳 0） |
| String | `++`（`array.copy`）、`strFromInt`、`strShow`、`strLength`、`strAt`（越界 `-1`）、`strSubstring(start, len, s)`（钳位后复制）、`strHash`（`(h*33+byte)&1023`）、`bi_eq_str` / `bi_neq_str` |
| 入口 / 诊断 | `@ir@showInt` / `showNat` / `showBool` / `showStr`、`prim_erase`、`assert`、`prim_fail`、`todo` |
| 其它 | `arrayEmpty`（空数组值）；`@vuna@debug@on` / `@vuna@debug@line` 走常量折叠 |

**明确拒绝**（`RtUnsupported` → 引用点 `WasmUnsupported`，带符号名）：
`arrayGet` / `arraySet` / `arrayMake` / `arrayLength`（`Base.Array`，M3）、
`bi_lt_generic` 等结构化 `compare` 家族、Float 全部符号、
`prim_effectPerform` / `prim_effectHandle` / `prim_cleanupPush/Pop`、Sched 家族、
`prim_eff_*` 宿主层原语、List 桥接 `dtp_*`。

运行时函数随程序生成在同一个 `main.wat` 中（不加载外部 runtime 库），因此单个文件可审计。

## 6. 实现约束

- `Wasm` 子模块只 import `Base.*`、`Ir`、`Wasm.*`；驱动只经
  `Driver.Dt.dtCheckWithProgramParts` + `Codegen.Lower.lowerProgramOf`，不 import
  Core/Elab/Intrinsics（`checks.ir-boundary` 规则 10 守护）。
- `Module.build` 是纯函数；`Driver.Wasm.compileWasm` 负责写文件（`Eff hostRow`）。
- 生成器带 fuel（`genExpr` 等），越界返回 `wasm codegen fuel exhausted`（内部错），不 panic。
- 错误分类：`wasm target:` 前缀 = 能力限制（`WasmUnsupported`）；其余 = 生成器内部错
  （`WasmInternal`，前缀 `internal wasm backend error`）。
- 任何新表都必须按定义序/固定顺序构造（禁止 HashMap 迭代），否则 WAT 不确定。

## 7. 验证

- `test/suite/steps/106_wasm_backend.steps`（section 90 / `steps_native`，e2e）：
  工具链探针、最小可执行、算术/let/遮蔽/if、顶层函数、Nat 递归 fact、字符串
  （`++` / strLength / strSubstring / 相等）、Bool 短路、63-bit 边界、除零 trap、
  确定性 + 行宽、`--no-compile`、拒绝面、`--target` 取值校验。
- 每个正例都做**差分**：`wasmtime run` 的输出与 `vuna run`（OCaml 后端）逐字比较，
  OCaml 始终是语义 oracle。

## 8. 已知边界（M2 明确不做）

- 闭包值 / 高阶函数 / 部分应用（闭包表示要 `(elem declare func ...)`，已验证无 element
  段时 wasmtime 报 `undeclared function reference`）。
- 用户 `data` / record / 通用 `case` / 构造子 / 投影 / 更新、`Array` 运行时。
- Float、Effect / 一次性续延、FFI / extern、宿主 syscalls 的通用面（只有 write/exit）。
- 多单元链接、WAT 缓存、`vuna run --target`、wasm seed（D7）、
  Component Model / WASI 0.2/0.3（D16 的终端未决部分）。

## 9. 后续路线（只写方向，不写排期）

- **M3**：用户 `data` / record / 通用 `case`（变体 tag 分派 + 字段 struct），
  闭包表示（`$clo` + `elem declare`）与高阶调用，`Array` 运行时。
- **M4**：Float（`$float` struct + f64 运算）、字符串与数组的更多原语。
- **M5**：Effect 一次性续延 + 宿主层（WASI 0.2 接口）、FFI、wasm seed、增量缓存。

## 10. 相关阅读

- [ir.md](ir.md)：IR 节点、运行时契约、后端义务。
- [native.md](native.md)：另一个产品后端的 M1+M2 切片（同样的「文本 canonical + 外部工具」策略；
  M2 加入字符串与 bump 堆）。
- [architecture.md](../architecture.md)：子系统地图与改动定位。
