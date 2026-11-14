# wasm 后端（M1）

> 状态：**M1 最小切片已端到端工作**（`main` 为 Int / Nat / String / Bool，
> 支持 let / if / 内建饱和应用 / 顶层零参值依赖）。闭包、用户数据、case、Float、
> Effect、FFI 仍被明确拒绝（`WasmUnsupported`）。实现入口：
> `Vuna.Compiler.Wasm.{Model,Instr,Types,Runtime,Module,Render}`，
> 驱动 `Vuna.Compiler.Driver.Wasm`。

## 1. 产物与工具链

- **canonical 产物是 WAT 文本**（`main.wat`）；`.wasm` 不手写、不进 Git，由
  `wasm-tools parse main.wat -o main.wasm` 生成（版本由 Nix 固定）。
- `vuna compile <PKG> <OUT> --target wasm` → `<OUT>/main.wat`。
- `vuna build <PKG> --target wasm --out <OUT>` → `<OUT>/main.wat` + `<OUT>/build.sh`
  （`build.sh` 调 `wasm-tools parse`）；`--no-compile` 只写 WAT。
- 运行（本地 wasmtime 41 需要显式开 GC 与 function references；≥47 默认开 GC）：
  `wasmtime run -W gc=y -W function-references=y main.wasm`。

## 2. 数据表示（WasmGC）

统一值类型 `anyref`，不做类型特化：

| Vuna | wasm |
| --- | --- |
| Int / Nat | `(struct (field i64))`，63 位语义（wrap / 逻辑移位 / 除零 trap） |
| Bool | `i31`（`ref.i31`） |
| String | `(array (mut i8))`；字面量 `array.new_data $str $d0` |
| 数组 | `(array (mut anyref))` |
| 变体 / record | `(struct (field i32 tag) (field anyref ...))` / 纯字段 struct |
| 闭包 | `(struct (field (ref $ft)) (field anyref env))`，`$ft = (func anyref anyref (result anyref))` |

`$env` 为捕获数组；函数引用通过 `ref.func` + `call_ref`（`$ft`）。M1 的 Runtime
已经包含 `rt_apply`、字符串/整数/布尔/位运算/比较、`fd_write`/`proc_exit` 等
函数；未使用的路径只在测试中覆盖。

## 3. 模块布局（稳定 diff）

- 名字稳定：`$t_<watName family>`、`$f_<watName>`、`$g_<watName>`、`$d_<N>`，
  由 Vuna 全限定名派生，**不按位置编号**；`$d_` 只用于数据段。
- 固定顺序：types（基础类型 → 按声明序的族）→ imports → memory → globals
  （按定义序）→ functions（Runtime → 生成的闭包 → `_start`）→ elements →
  data → exports。
- 缩进固定 2 空格、一条指令一行；行宽上限 100 列，超长字符串按 24 字节分块
  为相邻字面量。
- 同一 IR 的 WAT 字节确定；`.wasm` 只保证行为（字节依赖工具版本，由 Nix 固定）。

## 4. M1 边界与已知限制

支持：

- `main : Int` / `Nat` / `String` / `Bool`（纯值），`let`（单运行时 binder）、
  `if`、内建饱和应用（`+`、`-`、`*`、位运算、比较、`show` 等）、顶层零参值
  的依赖闭包初始化。

明确拒绝（编译期 `WasmUnsupported`，CLI exit 1）：

- lambda/闭包值、一般 `IrApp`；用户 `data` / record / `case` / `Nat` case；
  `Float` 字面量、Effect thunk、FFI/extern；自定义 `Show` 入口。
- 动作入口（`main : Eff ...`）。

M1 不处理多模块链接、WAT 缓存、wasm seed、Component Model / WASI 0.2/0.3；
这些在后续阶段评估（见 [architecture-target.md](../architecture-target.md) D7/D16）。

native 后端（M1+M2）采用同一「文本 canonical + 外部工具」策略（汇编 `main.s` + 系统
`cc`），切片、ABI、字符串表示与 bump 堆见 [native.md](native.md)。

## 5. 实现约束

- `Wasm` 子模块只 import `Base.*`、`Ir`、`Wasm.*`；驱动只经
  `Driver.Dt.dtCheckWithProgramParts` + `Codegen.Lower.lowerProgramOf`，不 import
  Core/Elab/Intrinsics。
- `Module.build` 是纯函数；`Driver.Wasm.compileWasm` 负责写文件（`Eff hostRow`）。
- 生成器带 fuel（`genExpr` 等），越界返回 `WasmInternal`，不 panic。
