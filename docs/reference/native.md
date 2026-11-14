# native 后端（M2）

> 状态：**M1 + M2 已端到端工作**（x86-64 Linux）。M1 覆盖 Int / Nat / Bool 纯值；
> M2 加入 `String`（字面量、`++` / `strConcatMany`、`strFromInt`、`strLength`、`strAt`、
> `strSubstring`、`strHash`、`strShow`、`bi_eq_str` / `bi_neq_str`、String 入口）与
> **bump 堆**（无 GC/RC）。用户 data / record / 通用 case、闭包值、Float、Effect、FFI
> 仍被明确拒绝（`NativeUnsupported`）。实现入口：
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
- M2 不接对象库/增量缓存；每次重编。

## 2. 平台与值表示

- 目标：x86-64 Linux（SysV AMD64），静态、无 libc；入口 `_start` 走 Linux syscall
  (`write` / `exit`)。不支持 aarch64 / macOS / Windows。
- `Int` / `Nat`：63-bit 有符号（与 OCaml `int` 同域），`+ - *` wrap，`/` 向零截断、
  除零 trap；`natAdd/natSub/natMul` 饱和，`natSucc` 饱和到 `max_int`。
- `Bool`：0/1（不是变体）。
- `String`：**指向长度头的指针**。堆对象布局 = `[0..7]` 字节数（i64）+ `[8..]` 字节；
  字符串不可变，任何构造（`++` / `strFromInt` / `strSubstring` / `strShow`）都分配新
  对象。字符是字节（UTF-8 字面量按字节存放，`strLength` 返回**字节数**，与 OCaml
  `String.length` 一致）。
- **堆**：`.bss` 里 1 MiB 缓冲（`rt_heap`）+ bump 指针 `rt_heap_ptr`（`_start` 初始化
  为缓冲起点）。无 GC、无 RC、无复用；分配 = 指针前推，越过 `rt_heap_end` 就
  trap `vuna: runtime error: out of memory\n` + `exit(2)`。
- 入口打印：`Int`/`Nat` 十进制 + `\n`，`Bool` 为 `True`/`False`，`String` 走
  `show`（`strShow` 带引号 + 转义）再打印，全部与 OCaml 入口钩子的
  `print_endline (show main)` 逐字一致。
- 运行时 trap（除零 / 堆耗尽）：向 stderr 写 `vuna: runtime error: ...\n`，`exit(2)`。
  无位置表/backtrace。

## 3. ABI 与栈帧

- 参数寄存器按序：`rdi, rsi, rdx, rcx, r8, r9`；返回值 `rax`。最多 6 个参数，更多参数
  拒绝（栈传参留 M3）。
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
- **单出口**：带栈帧的运行时函数体内出现的 `IRet` 由 `Native.Runtime.rtFunc` 统一改写
  成跳到函数尾标签（`mov rsp, rbp; pop rbp; ret`）；只有无栈帧的入口/陷阱（`rtRawFunc`）
  直接写 `ret`。手写分支因此不会「提前 ret 把 rsp 留在 frame 里」，不会崩在返回地址上。
- 入口 `_start`：初始化堆指针 → `and rsp, -16` → `call vuna_main` → 按入口 show
  打印 → `exit(0)`；不解析 argv，无栈溢出检查。
- 递归使用机器栈直接 `call`；M2 不做尾调用优化。

## 4. IR 支持面（M2）

从 `IrEntry.irEntryMain` 沿 `irDefDeps` 收集**可达**定义，只生成可达函数；不可达的
base 定义即使含不支持构造也不拒绝（与 wasm M1 的 `collectNeeded` 同策略）。

| IR 节点 | M2 | 说明 |
| --- | --- | --- |
| `IrVar` / `IrInt` / `IrBool` / `IrCast` | 支持 | `IrInt` 检查 63-bit 范围 |
| `IrStr` | 支持 | `.rodata` 里 `{.quad len; .ascii bytes}`，求值成 `lea`（内容去重，首现顺序编号） |
| `IrGlobal` | 支持（零参引用） | 生成 `call vuna_<name>`；作为函数值传递则拒绝 |
| `IrLet` | 支持（≤1 运行时 binder） | 多运行时 binder（boxed case 降级）拒绝 |
| `IrApp` | 支持饱和顶层调用、单参立即 lambda 应用、运行时常量函数值饱和应用 | 部分应用/高阶拒绝 |
| `IrIf` | 支持 | 条件按 0/1 判 |
| `IrRtApp` | 支持白名单 | 参数左→右；`&&`/`||` 短路 |
| `IrConcatMany` | 支持 | 左→右两两 `++`（Lowering 对 ≥3 项的 `++` 链发此节点） |
| `IrNatCase` | 支持 | `if sc == 0 then zero else succ`；succ binder = `sc-1`，catch binder = `sc` |
| `IrLam` | 仅顶层函数体 / 单参立即应用 | 嵌套、作为值 → 拒绝 |
| `IrRt` | `@ir@natSucc`（调用 head）与入口 show | 其他拒绝 |
| Float / 构造子 / record / 通用 `case` / Effect / extern | 拒绝 | `native target: ... not supported yet` |

- 白名单（`Native.Runtime.nativeRtTarget`）：`+ - * /`、`++`、`bi_eq_int` /
  `bi_neq_int` / `bi_lt_int` / `bi_le_int` / `bi_gt_int` / `bi_ge_int`、
  `bi_eq_str` / `bi_neq_str`、`strFromInt` / `strLength` / `strAt` / `strSubstring` /
  `strHash` / `strShow`、`natAdd` / `natSub` / `natMul` / `natDiv` / `natToInt` /
  `natFromInt`。其余 `IrRtApp` 符号拒绝。
- **两种调用形态**都要覆盖：内建饱和应用走 `IrRtApp sym args`（`irInlineArity`）；
  `strAt` / `strSubstring` 这类**多参函数值**在 IR 里是 `IrApp (IrRt sym) args` 的
  饱和应用（`irInlineArity = 0`），由 `Native.Runtime.nativeRtValueArity` 给出 arity，
  饱和才生成 `call`（部分应用拒绝）。
- 位运算当前在 IR 里走普通应用（`irInlineArity` 没有对应项），M2 仍拒绝。
- **零参顶层定义**编成零参函数，每次引用都 `call`。M2 仍是纯语言（无 Effect），重复
  求值语义安全；引入副作用/Effect 之前必须改成初始化 + memo。
- 入口 `main` 必须是零参值；`main : Eff` 拒绝。入口 show 只接受 `@ir@showInt` /
  `@ir@showNat` / `@ir@showBool` / `@ir@showStr`；`showFloat` / 自定义 Show 拒绝。
  `--no-print` 不打印，但仍计算并 exit 0。

## 5. 运行时符号

`Native.Runtime` 按 `Ir.Runtime` 契约的**符号名**实现子集；语义参考实现是
`Vuna.Compiler.Codegen.Term` 的 `bi_*` / `dt_show_*` / `dtp_*` 模板，不重新定义语义：

- `Int`：`add/sub/mul/div`（63-bit wrap；除零 trap）；比较返回 0/1。
- `Nat`：饱和加法/乘法、下溢到 0 的减法、除零 trap、`natToInt` / `natFromInt` / `natSucc`。
- `String`：`str_alloc`（bump 分配，含长度头）、`str_concat`、`str_eq` / `str_neq`
  （先比长度，再 `repe cmpsb`）、`str_length`、`str_at`（越界 -1，与 `dtp_strAt` 一致）、
  `str_substring`（`start`/`len` 夹取到 `[0, n]`，与 `dtp_substring` 一致）、
  `str_hash`（`((h*33)+c) land 1023`，与 `dtp_strHash` 一致）、`str_from_int`（含负号）、
  `show_str`（引号 + `\"` `\\` `\n` `\t` `\r` 转义，与 `dt_show_string` 一致）。
- 入口打印：`print_int` / `print_bool` / `print_str`（栈上 itoa / 原样字节 + 换行）。
- 只读数据：`True` / `False` / 换行 / 除零信息 / OOM 信息；由 `Native.Runtime.nativeRodata`
  提供。字符串字面量由 `Native.Module` 收集成 `NativeStrLit`（`npStrLits`）。

运行时函数随程序生成在同一个 `main.s` 中（不加载外部 runtime 库），因此单个文件可审计。

## 6. 模块布局与确定性

- `Native.Model`：寄存器/操作数/指令/函数/程序 + `NativeErr`；M2 增加 `OpMemX`
  （`[base+index]` 字节访问）、`OpRip`、字节读写、`rep movsb` / `repe cmpsb`、
  `NativeStrLit` / `NativeBss`。
- `Native.Abi`：参数寄存器、栈槽偏移、frame 对齐、字符串头大小、堆大小与标签、
  prologue/epilogue、稳定命名（函数 / 运行时 / 字面量 / 内部 label / 数据标签）。
- `Native.Runtime`：`rt_*` 汇编模板、只读数据、`.bss` 布局、IR 符号 → 运行时标签白名单
  与值形态 arity。
- `Native.Module`：`IrProgram` → `NativeProgram`（可达性、入口、栈槽、字面量池、
  **全程序唯一 label 编号**、fuel）。
- `Native.Render`：`NativeProgram` → `main.s`（固定段顺序、缩进、一条指令一行、八进制
  转义字节）。
- `Driver.Native`：检查 + lowering + 写 `main.s`；不 import Core/Elab/Intrinsics。

固定布局：`.intel_syntax noprefix` → `.rodata`（运行时常量 → 字符串字面量）→ `.bss`
（堆缓冲 → 堆尾 → 堆指针）→ `.text`（Runtime 函数 → 用户函数（按定义生成顺序）→
`_start`）→ `.note.GNU-stack`。名字由 Vuna 全限定名派生（`vuna_<escaped>`、
`rt_<name>`、`rt_lit_<n>`、`.L<n>`），不按位置编号；`.L<n>` 的编号**跨定义连续**，
因为每个函数都重新从 0 起会让两个函数撞名（汇编器报 `symbol .L0 is already defined`）。

`checks.ir-boundary` 的 native 规则（规则 9）守：`Native.*` 不得 import
`Core` / `Elab` / `Intrinsics` / `Codegen` / `Wasm`；`Driver/Native` 不得 import
`Core` / `Elab` / `Intrinsics`；`Native.Module` 必须 import `Ir`。

## 7. 验证

- `test/suite/steps/105_native_backend.steps`（section 90 / `steps_native`，e2e，89 checks）：
  M1 部分（最小可执行、算术/let/if、binder 遮蔽、多函数 label 不撞名、顶层函数、Nat 递归
  fact、Bool 入口与短路、63-bit 边界、除零 trap、确定性、`--no-compile`）与 M2 部分
  （String 入口、`++` / `strFromInt` / `strLength` / `strAt` / `strSubstring` / `strHash` /
  `strShow`、字符串相等、递归构造字符串、转义与 UTF-8 字节、bump 堆耗尽 trap、Float /
  data / 高阶拒绝）。
- 差分：同一程序的 native 输出与 `vuna run`（OCaml 后端）逐字比较（fact / String 用例）；
  后续加 native 专用差分 runner 时仍以 OCaml 为语义 oracle。
- 工具链：`cc` 缺失时 steps 首步明确失败；e2e 的 `nativeBuildInputs` 已含
  `ocamlTools`（gcc/binutils）。

## 8. 已知边界（M2 明确不做）

- 用户 `data` / record / 通用 `case` / 构造子；闭包值、高阶函数、部分应用；数组。
- `strUnpack` / `strPack` / `strConcatMany` / `strSubstTemplate`（需要 List 桥接）。
- Float、Effect / 一次性续延、FFI / extern、宿主 syscalls 的通用面（只有 write/exit）。
- 无 GC/RC：字符串只增不减；长生命周期程序会耗尽 1 MiB 堆（trap 而非静默）。
- `Int`/`Nat`/`Bool` 的 heap 布局、对象头/复用（M4 的 Perceus RC 前置）。
- 多文件目标链接/对象文件：IR 已经是整程序单单元；不需要独立目标文件。
- 对象库/增量缓存、`vuna run --target`、`--target native` 的 release 差异。
- aarch64 及非 Linux 平台；寄存器分配与优化；栈溢出检查；位置表/backtrace。
- 零参定义的重算优化（引入副作用前必须改）。

## 9. 后续路线（只写方向，不写排期）

- **M3**：用户 data / record / 通用 case、闭包表示（统一 closure 结构）与高阶调用、
  栈传参（>6 arity）、栈溢出检查。
- **M4**：Perceus 式 RC + 复用（对象头/布局冻结之后）、Float、数组。
- **M5**：Effect 一次性续延 + 宿主层 syscalls、FFI、aarch64、对象库/增量、native 自举。

## 10. 相关阅读

- [ir.md](ir.md)：IR 节点、运行时契约、后端义务。
- [architecture.md](../architecture.md)：子系统地图与改动定位。
- [wasm.md](wasm.md)：第二个产品后端的 M1 切片（同样的「文本 canonical + 外部工具」
  策略）。

