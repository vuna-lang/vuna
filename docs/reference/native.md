# native 后端（M1）

> 状态：**M1 最小切片已端到端工作**（x86-64 Linux；`main` 为 Int / Nat / Bool，
> 支持 let / if / 内建饱和应用 / 顶层饱和函数 / Nat 结构递归 / 入口打印）。字符串、
> 用户 data / record / 通用 case、闭包值、Float、Effect、FFI 仍被明确拒绝
> （`NativeUnsupported`）。实现入口：
> `Vuna.Compiler.Native.{Model,Abi,Runtime,Module,Render}`，
> 驱动 `Vuna.Compiler.Driver.Native`。

## 1. 产物与工具链

- **canonical 产物是 Intel 语法汇编文本**（`main.s`）：可审查、可 diff，不嵌入时间戳/
  绝对路径；同一 IR 的 `main.s` 逐字节确定。
- `vuna compile <ENTRY|PKG> <OUT> --target native` → `<OUT>/main.s`（不产 `build.sh`）。
- `vuna build <PKG> --target native [--out OUT] [--no-compile]`：
  - 默认 `OUT = <pkg>/.output`；显式 `--out` 且在 workspace（多包）时按 `<OUT>/<pkg>`；
  - 写 `<OUT>/main.s` + `<OUT>/build.sh`，并调用系统 `cc` 产出 `<OUT>/bin/<pkg>`；
  - `--no-compile` 只写 `main.s` + `build.sh`，不链接。
- 链接命令（`build.sh` 与 CLI 同一条）：
  ```sh
  cc -static -nostdlib -no-pie -Wl,--build-id=none -o bin/<pkg> main.s
  ```
  依赖 `cc` / `as` / `ld`（Nix devShell 与测试环境的 `ocamlTools` 已提供）。它们是
  **构建期外部工具，不进 TCB、不进 seed**，与 wasm 侧 `wasm-tools parse` 同构。
- ELF 字节依赖链接工具版本，只保证**行为**；`main.s` 保证字节确定。
- M1 不接对象库/增量缓存；每次重编。

## 2. 平台与值表示

- 目标：x86-64 Linux（SysV AMD64），静态、无 libc；入口 `_start` 走 Linux syscall
  (`write` / `exit`)。M1 不支持 aarch64 / macOS / Windows。
- `Int` / `Nat`：63-bit 有符号（与 OCaml `int` 同域），`+ - *` wrap，`/` 向零截断、
  除零 trap；`natAdd/natSub/natMul` 饱和，`natSucc` 饱和到 `max_int`。
- `Bool`：0/1（不是变体）。
- 字符串、数组、闭包、用户数据：**M1 没有运行时对象**，因此没有堆、没有 GC/RC。
- 入口打印：`Int`/`Nat` 十进制 + `\n`，`Bool` 为 `True`/`False` + `\n`，与 OCaml
  入口钩子的 `print_endline (show main)` 一致。
- 运行时 trap（如除零）：向 stderr 写 `vuna: runtime error: division by zero\n`，
  `exit(2)`。M1 无位置表/backtrace。

## 3. ABI 与栈帧

- 参数寄存器按序：`rdi, rsi, rdx, rcx, r8, r9`；返回值 `rax`。M1 最多 6 个参数，
  更多参数拒绝（M2 再支持栈传参）。
- 每个函数固定形态：
  ```text
  push rbp
  mov rbp, rsp
  sub rsp, <frame>      ; frame = align16(8 * slots)
  <body>                ; 结果在 rax
  mov rsp, rbp
  pop rbp
  ret
  ```
- **不做寄存器分配**：binder 和中间值都分配 `[rbp - 8*(slot+1)]` 栈槽；临时槽不回收，
  frame 取该函数的最大使用量。求值顺序因此显式、稳定。
- 调用点：按 CBV 从左到右把实参求值到槽，再依次装入参数寄存器并 `call`；prologue
  的 `push rbp` + 16 倍数 frame 保证调用前 `rsp` 16 字节对齐。
- 生成代码只使用 caller-saved 寄存器（`rax, rdi, rsi, rdx, rcx, r8-r11`）与帧指针
  `rbp`，不碰 `rbx/r12-r15`，因此无需保存 callee-saved。
- 入口 `_start`：`and rsp, -16` → `call vuna_main` → 按入口 show 打印 → `exit(0)`；
  不解析 argv，无栈溢出检查。
- 递归使用机器栈直接 `call`；M1 不做尾调用优化。

## 4. IR 支持面（M1）

从 `IrEntry.irEntryMain` 沿 `irDefDeps` 收集**可达**定义，只生成可达函数；不可达的
base 定义即使含不支持构造也不拒绝（与 wasm M1 的 `collectNeeded` 同策略）。

| IR 节点 | M1 | 说明 |
| --- | --- | --- |
| `IrVar` / `IrInt` / `IrBool` / `IrCast` | 支持 | `IrInt` 检查 63-bit 范围 |
| `IrGlobal` | 支持（零参引用） | 生成 `call vuna_<name>`；作为函数值传递则拒绝 |
| `IrLet` | 支持（≤1 运行时 binder） | 多运行时 binder（boxed case 降级）拒绝 |
| `IrApp` | 支持饱和顶层调用、单参立即 lambda 应用 | 后者覆盖 `let` 的脱糖；部分应用/高阶拒绝 |
| `IrIf` | 支持 | 条件按 0/1 判 |
| `IrRtApp` | 支持白名单 | 参数左→右；`&&`/`||` 短路 |
| `IrNatCase` | 支持 | `if sc == 0 then zero else succ`；succ binder = `sc-1`，catch binder = `sc` |
| `IrLam` | 仅顶层函数体 / 单参立即应用 | 嵌套、作为值 → 拒绝 |
| `IrRt` | 仅 `@ir@natSucc`（调用 head）与入口 show | 其他拒绝 |
| 字符串 / Float / 构造子 / record / 通用 `case` / `++` / Effect / extern | 拒绝 | `native target: ... not supported yet` |

- 白名单（`Native.Runtime.nativeRtTarget`）：`+ - * /`、`bi_eq_int` / `bi_neq_int` /
  `bi_lt_int` / `bi_le_int` / `bi_gt_int` / `bi_ge_int`、`natAdd` / `natSub` /
  `natMul` / `natDiv` / `natToInt` / `natFromInt`。其余 `IrRtApp` 符号拒绝。
  位运算当前在 IR 里走普通应用（`irInlineArity` 没有对应项），M1 拒绝。
- **零参顶层定义**编成零参函数，每次引用都 `call`。M1 是纯语言，重复求值语义安全；
  引入副作用/Effect 之前必须改成初始化 + memo（M2+）。
- 入口 `main` 必须是零参值；`main : Eff` 拒绝。入口 show 只接受
  `@ir@showInt` / `@ir@showNat` / `@ir@showBool`；`showStr` / `showFloat` / 自定义
  Show 拒绝。`--no-print` 不打印，但仍计算并 exit 0。

## 5. 运行时符号

`Native.Runtime` 按 `Ir.Runtime` 契约的**符号名**实现子集；语义参考实现是
`Vuna.Compiler.Codegen.Term` 的 `bi_*` / `dt_show_*` 模板，不重新定义语义：

- `Int`：`add/sub/mul/div`（63-bit wrap；除零 trap）；比较返回 0/1。
- `Nat`：饱和加法/乘法、下溢到 0 的减法、除零 trap、`natToInt` / `natFromInt` / `natSucc`。
- 入口打印：`print_int`（栈上 itoa，含负号与 0）与 `print_bool`。
- 只读数据：`True` / `False` / 换行 / 除零信息；由 Runtime 的 `nativeRodata` 提供。

运行时函数随程序生成在同一个 `main.s` 中（不加载外部 runtime 库），因此单个文件可审计。

## 6. 模块布局与确定性

- `Native.Model`：寄存器/操作数/指令/函数/程序 + `NativeErr`。
- `Native.Abi`：参数寄存器、栈槽偏移、frame 对齐、prologue/epilogue、稳定命名。
- `Native.Runtime`：`rt_*` 汇编模板、只读数据、IR 符号 → 运行时标签白名单。
- `Native.Module`：`IrProgram` → `NativeProgram`（可达性、入口、栈槽、fuel）。
- `Native.Render`：`NativeProgram` → `main.s`（固定段顺序、缩进、一条指令一行）。
- `Driver.Native`：检查 + lowering + 写 `main.s`；不 import Core/Elab/Intrinsics。

固定布局：`.intel_syntax noprefix` → `.rodata` → `.text` → Runtime 函数 → 用户函数
（按定义生成顺序）→ `_start` → `.note.GNU-stack`。名字由 Vuna 全限定名派生
（`vuna_<escaped>`、`rt_<name>`、`.L<n>`），不按位置编号。

`checks.ir-boundary` 的 native 规则（规则 9）守：`Native.*` 不得 import
`Core` / `Elab` / `Intrinsics` / `Codegen` / `Wasm`；`Driver/Native` 不得 import
`Core` / `Elab` / `Intrinsics`；`Native.Module` 必须 import `Ir`。

## 7. 验证

- `test/suite/steps/105_native_backend.steps`（section 90 / `steps_native`，e2e）：
  最小可执行、算术/let/if、顶层函数、Nat 递归 fact、Bool 入口与短路、63-bit 边界、
  除零 trap、确定性（两次 `main.s` 相同）、字符串/高阶拒绝、`--no-compile`。
- 差分：同一程序的 native 输出与 `vuna run`（OCaml 后端）逐字比较（fact 等用例）；
  后续加 native 专用差分 runner 时仍以 OCaml 为语义 oracle。
- 工具链：`cc` 缺失时 steps 首步明确失败；e2e 的 `nativeBuildInputs` 已含
  `ocamlTools`（gcc/binutils）。

## 8. 已知边界（M1 明确不做）

- 字符串、`++`、`strFromInt` / `showStr`、数组、线性内存、堆分配。
- 用户 `data` / record / 通用 `case` / 构造子；闭包值、高阶函数、部分应用。
- Float、Effect / 一次性续延、FFI / extern、宿主 syscalls 的通用面（只有 write/exit）。
- 多文件目标链接/对象文件：IR 已经是整程序单单元；不需要独立目标文件。
- 对象库/增量缓存、`vuna run --target`、`--target native` 的 release 差异。
- aarch64 及非 Linux 平台；寄存器分配与优化；栈溢出检查；位置表/backtrace。
- 零参定义的重算优化（M2 引入副作用前必须改）。

## 9. 后续路线（只写方向，不写排期）

- **M2**：字符串与最小堆（bump allocator）、`showStr` / `++` / `strFromInt`，`String`
  入口；仍无 RC。
- **M3**：用户 data / record / 通用 case、闭包表示（统一 closure 结构）与高阶调用。
- **M4**：Perceus 式 RC + 复用（对象头/布局冻结之后）；Float。
- **M5**：Effect 一次性续延 + 宿主层 syscalls、FFI、aarch64、对象库/增量、native 自举。

## 10. 相关阅读

- [ir.md](ir.md)：IR 节点、运行时契约、后端义务。
- [architecture.md](../architecture.md)：子系统地图与改动定位。
- [wasm.md](wasm.md)：第二个产品后端的 M1 切片（同样的「文本 canonical + 外部工具」
  策略）。