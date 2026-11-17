# native 后端

> 状态：**x86-64 Linux 上端到端工作**。支持面 = Int / Nat / Bool 纯值 + `String`
> （字面量、`++` 及其 `IrConcatMany` 展平、`strFromInt`、`strLength`、`strAt`、
> `strSubstring`、`strHash`、`strShow`、`bi_eq_str` / `bi_neq_str`、String 入口）+
> 六种位运算、`assert` / `todo` / `prim_fail`（统一错误报告）、`dbg!` 的
> `@vuna@debug@on` / `@vuna@debug@line`、**栈传参**（arity > 6）+ 用户 `data`（变体 tag
> 分派）、record 构造/投影/更新与通用 `case` + List 桥接（`strUnpack` / `strPack` /
> `strConcatMany` / `strSubstTemplate`）+ 闭包与高阶应用 + Float（算术/比较/转换/展示）。
> 堆是可增长 arena（`mmap` 新段，不做 RC/复用）。`main : Eff r a`（含带行的宿主效应，
> 入口自动预装 `runXHost`）与 `IORef` 可用；`perform` / `handle` 用**栈拷贝 + 续延栈迁移**
> 实现一次性续延（§3.4）。FFI / extern 仍被明确拒绝（`NativeUnsupported`）。
> 实现入口：`Vuna.Compiler.Native.{Model,Abi,Runtime,Module,Render}`，
> 驱动 `Vuna.Compiler.Driver.Native`。边界见 §8。

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
- 不接对象库/增量缓存；每次重编。

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
- **堆**：`.bss` 里 1 MiB 起始段 + bump 指针 `rt_heap_ptr`（`_start` 初始化为段起点）；
  当前段不够时 `mmap` 新段并更新 `rt_arena_end`，旧段不回收。无 GC、无 RC、无复用。
- 入口打印：`Int`/`Nat` 十进制 + `\n`，`Bool` 为 `True`/`False`，`String` 走
  `show`（`strShow` 带引号 + 转义）再打印，全部与 OCaml 入口钩子的
  `print_endline (show main)` 逐字一致。
- `Float`：IEEE-754 double，堆对象 `[f64]`；运算在 `xmm` 上做，比较按 OCaml 语义
  （NaN 参与时有序比较为 false、`!=` 为 true）。
- `Array`：**不可变数组**，堆对象布局 = `[0]` 长度（i64）+ `[8]` 起元素，每个元素一个
  机器字（Int 未装箱；String / 对象 / 闭包是指针）。`arraySet` copy-on-write：复制整块
  再写，原数组不变。越界（读 / 写）trap `Invalid_argument("index out of bounds")` + exit 2。
- 运行时 trap（除零 / 堆耗尽 / 数组越界）：向 stderr 写 `vuna: runtime error: ...\n`，
  `exit(2)`。无位置表/backtrace（OCaml 报告器多一行 `at ...`，这里没有）。

## 3. ABI 与栈帧

- 参数寄存器按序：`rdi, rsi, rdx, rcx, r8, r9`；返回值 `rax`。**第 7 个起走栈**
  （SysV AMD64：被调用方在 `[rbp+16]`、`[rbp+24]`… 读；调用方按逆序压栈）。
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
- 调用点：按 CBV 从左到右把实参求值到槽；前 6 个装入参数寄存器，其余**逆序压栈**
  （最后一个实参先压，第 7 个最终在 `[rbp+16]`）。栈参数个数为奇数时先 `sub rsp, 8`
  补空洞，保证 `call` 时 `rsp` 16 字节对齐（prologue 的 `push rbp` + 16 倍数 frame 是
  另一处保证）；返回后一次性 `add rsp, 8*k + pad` 回收。
- **闭包**：布局 `[0]`=code、`[8]`=arity（运行时 binder 数）、`[16..]`=捕获值。
  调用时 `rdi` = 闭包自身，实参从 `rsi` 起（`rsi/rdx/rcx/r8/r9`，第 6 个实参起压栈）。
  闭包函数入口先把捕获值拷进本帧槽，再按常规绑定形参。
- **动态应用**：生成代码不直接 `call [rdi]`，统一走运行时 `rt_apply(闭包, n, 实参数组)`
  （实参数组升序，arg i 在 `[argp+8i]`）：饱和 → `rt_apply_exact` 按闭包 ABI 装寄存器 /
  压栈后调用；不足 → 分配部分应用闭包（`rt_apply_shim` 在真正饱和时把「已捕获 + 收到」
  拼成实参数组）；过多 → 先吃掉前 arity 个实参，再把返回值当闭包继续应用剩余实参。
  顶层函数 / 运行时符号**当值**时生成静态 wrapper（闭包 ABI → 标准 ABI）作为 code，
  arity 取定义参数个数 / `nativeRtValueArity` / `irInlineArity`。
- 生成代码只使用 caller-saved 寄存器（`rax, rdi, rsi, rdx, rcx, r8-r11`）与帧指针
  `rbp`，不碰 `rbx/r12-r15`，因此无需保存 callee-saved。运行时只有续延恢复用 `r15`
  暂存续延记录（§3.4），生成代码不碰它。
- **单出口**：带栈帧的运行时函数体内出现的 `IRet` 由 `Native.Runtime.rtFunc` 统一改写
  成跳到函数尾标签（`mov rsp, rbp; pop rbp; ret`）；只有无栈帧的入口/陷阱（`rtRawFunc`）
  直接写 `ret`。手写分支因此不会「提前 ret 把 rsp 留在 frame 里」，不会崩在返回地址上。
- 入口 `_start`：初始化堆指针 → `and rsp, -16` → `call vuna_main` → 按入口 show
  打印 → `exit(0)`；不解析 argv，无栈溢出检查。
- 递归使用机器栈直接 `call`；不做尾调用优化。

### 3.4 效应 handler 与一次性续延

运行时表示（`Native.Runtime`）：

- **handler 链**：`.bss` 的 `rt_handlers` 指向最内层节点。节点 64 B：
  `[0]=key [8]=name [16]=ret [24]=opH [32]=当前 comp 栈顶（base_rsp）`
  `[40]=prev [48]=base_rbp [56]=当前 resume 记录（0 = 无；`perform` 调 `opH` 期间暂存在帧内）`。
- **续延记录** 88 B：`[0]=捕获字节 [8]=字节数 [16]=perform 的 rbp [24]=used`
  `[32]=节点 [40]=perform 时的链顶 [48..72]=resume 调用者的 rbp/rsp/ret/r15`
  `[80]=恢复值 v`。
- **续延闭包** 24 B：`[0]=rt_eff_resume [8]=arity(1) [16]=记录`；调用约定与普通闭包一致。

`perform`：按 `(key, name)` 扫链；找到后把节点弹出（`rt_handlers = node.prev`），把
`[perform_rbp, rt_stack_top)` 的**整段栈**（含所有外层 handler 的挂起帧）拷到堆，
分配记录与续延闭包，然后**在当前栈上**调用 `opH(op, k)`（不切到 handler 帧，避免 opH
帧落进捕获区）。调用 `opH` 前先把 `node[56]` 摘到本帧槽位并清零：同一个节点可以在它自己
的续延里再次 `perform`（续延副本里 handler 帧仍在），内层 `resume` 会覆盖该槽；不摘走的话，
外层 `perform` 在 `opH` 返回时会拿到内层的记录，把 answer 交给一个已经放弃的栈段。
`opH` 返回时：
- 若节点出现新的 resume 记录（`node[56] != 0`，说明本次 `opH` 发起的续延还在运行），把
  返回值当作答案交回该 resume 的调用点；
- 否则把先前摘下的记录写回 `node[56]`（外层 `kdone` 还要靠它配对），走
  `rt_eff_handle_end`，返回值就是 handler answer，`ret` 不再应用。

`resume`（`k v`）：检查 one-shot；保存调用者的 rbp/rsp/ret/r15 到记录；把捕获的整段栈
拷到**新栈段**（预留 `nativeSegSlackBytes = 32 MiB` 向下空间，向下增长留在段内），把 rbp 链和所有活动
handler 节点的 `base_rsp` / 同源 `base_rbp` 平移 `delta`，把匹配 handler 的顶部返回地址
改成 `rt_eff_kdone`；`rt_stack_top` 指向新栈顶，从 perform 的返回点继续执行。

`rt_eff_kdone`：comp 正常结束后按需弹掉节点、应用 `ret`，再**撤销**节点地址平移、
恢复 `rt_stack_top`，把答案交回 `k` 的调用点。abort（opH 不调用 `k`）不经过 `kdone`，
直接把 opH 返回值当作 answer。

因为捕获/迁移的是**整段栈**，内层续延恢复后触发外层 handler 也能正确穿过已挂起的内层
handler 帧（节点地址随段平移，返回时再撤销）。

捕获缓冲与迁移栈段各有一条 free list（`rt_cap_free` / `rt_seg_free`），块大小向上取整到
2 的幂：`perform` 的捕获块在 `resume` 拷走后立即归还，`kdone` / abort 归还栈段，因此
顺序 effect 只复用固定的几档块，不会每次新 `mmap`。每个 resume 预留 32 MiB 向下空间
（页惰性提交：没有真正用到的页不计 RSS；段大小 `pow2_ceil(len + 32 MiB + 16)`）；函数
prologue 比较 `rt_stack_limit`，越过段基址 trap `continuation stack overflow` 而不是踩堆。
栈段从**专用高地址区间**（`0x2000_0000_0000` 起、`MAP_FIXED_NOREPLACE`）分配：resume 的
重定位是保守扫描，落在 `(perform_rbp, stack_top)` 里的字一律当栈指针平移，堆/arena 指针
如果也在这个区间里就会被误平移——固定区间让两者不相交。

嵌套 effect 的总开销仍随深度增长：每次 resume 复制当前整段栈并保留自己的栈段（外层
handler 帧还在上面），所以 N 层顺序 perform 是 O(N²) 拷贝 / 内存（500 次约 22 ms、
2000 次约 260 ms / 500 MiB、5000 次约 1.4 s / 3 GiB）。

约束：续延一次性（`used` 标记，resume 两次 trap）；每次 resume 复制整段栈；只支持
one-shot，不做 multi-shot；`ret`/`opH` 允许在 `k` 返回后继续计算。宿主 handler 的
「先做宿主操作再 `k`」写法（`consoleOpHIOHost` 等）与用户 `handle` 走同一条路径。

## 4. IR 支持面

从 `IrEntry.irEntryMain` 沿 `irDefDeps` 收集**可达**定义，只生成可达函数；不可达的
base 定义即使含不支持构造也不拒绝（与 wasm 的 `collectNeeded` 同策略）。

生成失败时，诊断后面附一次静态审计（`Native.Audit`）：把可达定义里**全部**不支持的
构造按种类计数（缺失符号、运行时符号当值、runtime app arity、多 binder `let`、
effect bind、extern），每类给计数与最多三个例子，避免「一次只报一个 unsupported」的
串行试错。

| IR 节点 | 当前 | 说明 |
| --- | --- | --- |
| `IrVar` / `IrInt` / `IrBool` / `IrCast` | 支持 | `IrInt` 检查 63-bit 范围 |
| `IrStr` | 支持 | `.rodata` 里 `{.quad len; .ascii bytes}`，求值成 `lea`（内容去重，首现顺序编号） |
| `IrGlobal` | 支持 | 零参引用生成 `call vuna_<name>`；作为函数值传递时生成闭包（wrapper） |
| `IrLet` | 支持（≤1 运行时 binder） | 多运行时 binder（boxed case 降级）拒绝 |
| `IrApp` | 支持 | 饱和顶层/运行时调用直调；部分 / 过度应用与动态 head 走 `rt_apply` |
| `IrIf` | 支持 | 条件按 0/1 判 |
| `IrRtApp` | 支持白名单 | 参数左→右；`&&`/`||` 短路 |
| `IrConcatMany` | 支持 | 左→右两两 `++`（Lowering 对 ≥3 项的 `++` 链发此节点） |
| `IrNatCase` | 支持 | `if sc == 0 then zero else succ`；succ binder = `sc-1`，catch binder = `sc` |
| `IrLam` | 支持 | 作为值 → 闭包对象 `[code][arity][捕获...]`；应用统一走 `rt_apply` |
| `IrCtor` / `IrRecord` / `IrProj` / `IrRecUpd` / `IrCase` | 支持 | 对象头 + 字段；§5 的「对象表示」 |
| `IrEffThunk` | 支持 | 生成 `MkEff (fun _ => prim args)`；效应原语作为值出现时用 |
| `IrEffBind` | 拒绝 | 只服务 `prim_eff_bind1`，base 不用 |
| `IrRt` | 支持白名单值形态 | `@ir@natSucc`（调用 head）与入口 show 由 Module 特化；作为值同样生成 wrapper 闭包 |
| Float | 支持 | 堆对象 `[f64]`；比较按 OCaml 语义；展示走 `Base.Float.floatRender` |
| Effect handler | 支持 | `perform` / `handle` 的一次性续延；§3.4 |
| extern / 其余宿主原语 | 拒绝 | `native target: ... not supported yet` |

- 白名单（`Native.Runtime.nativeRtTarget`）：`+ - * /`、六种位运算（`bitAnd` / `bitOr` /
  `bitXor` / `bitNot` / `bitShl` / `bitShr`）、`++`、`bi_eq_int` /
  `bi_neq_int` / `bi_lt_int` / `bi_le_int` / `bi_gt_int` / `bi_ge_int`、
  `bi_eq_str` / `bi_neq_str` / `bi_lt_str` / `bi_le_str` / `bi_gt_str` / `bi_ge_str`、
  `bi_lt_bool` / `bi_le_bool` / `bi_gt_bool` / `bi_ge_bool`、
  `strFromInt` / `strLength` / `strAt` / `strSubstring` /
  `strHash` / `strShow`、`natAdd` / `natSub` / `natMul` / `natDiv` / `natToInt` /
  `natFromInt`、`assert` / `todo` / `prim_fail`、`@vuna@debug@on` / `@vuna@debug@line`、
  可观测性叶子桩。其余 `IrRtApp` 符号拒绝。
- **两种调用形态**都要覆盖：内建饱和应用走 `IrRtApp sym args`（`irInlineArity`）；
  `strAt` / `strSubstring` / `assert` / `todo` / `prim_fail` 这类**多参函数值**在 IR 里是
  `IrApp (IrRt sym) args`（`irInlineArity = 0`），由
  `Native.Runtime.nativeRtValueArity` 给出 arity；饱和直调，部分/过度应用与作为值都
  生成 wrapper 闭包。
- 位运算是 `IrRtApp`（`irInlineArity` 用内建名 `bitAnd`…，与 `+` 同一形态决策）；63-bit
  语义与 `Codegen.Term.bi_bit*` 一致（`bitShr` 是保留 bit 62 的逻辑右移）。
- 运行时错误报告统一为 `vuna: runtime error: <msg>\n`（stderr，exit 2），与 OCaml
  报告器 `dt_report_exn` 的第一行一致；`assert` / `todo` 分别加 `assertion failed: ` /
  `TODO: ` 前缀。
- List 桥接符号（`strUnpack` / `strPack` / `strConcatMany` / `strSubstTemplate`）支持：
  函数体在 `Native.Module` 按 List 族的 tag 生成，复用对象表示（`head` 是未装箱 Int；
  两遍扫描：先算长度，再分配填充）。
- **零参顶层定义**编成零参函数，每次引用都 `call`。零参定义必须保持纯值语义（重复求值
  等价）；带副作用的值要走 `Eff` 动作，不能藏在零参定义里。
- 入口 `main` 必须是零参值；`main : Eff r a` 支持：入口先按 `irEntryHandlersOf` 预装宿主
  handler（`runConsoleHost` / `runExitHost` / …），再用 `runMain` 执行，最后按 `a` 展示。
  入口 show 只接受 `@ir@showInt` /
  `@ir@showNat` / `@ir@showBool` / `@ir@showStr` / `@ir@showFloat`；其它自定义 Show 拒绝。
  `--no-print` 不打印，但仍计算并 exit 0。

## 5. 运行时符号

`Native.Runtime` 按 `Ir.Runtime` 契约的**符号名**实现子集；语义参考实现是
`Vuna.Compiler.Codegen.Term` 的 `bi_*` / `dt_show_*` / `dtp_*` 模板，不重新定义语义：

- `Int`：`add/sub/mul/div`（63-bit wrap；除零 trap）；`bit_and/bit_or/bit_xor/bit_not/
  bit_shl/bit_shr`（63-bit 语义；移位计数 `n < 0 || n >= 63` → 0，`bit_shr` 保留 bit 62）；比较返回 0/1。
- `Nat`：饱和加法/乘法、下溢到 0 的减法、除零 trap、`natToInt` / `natFromInt` / `natSucc`。
- `String`：`str_alloc`（bump 分配，含长度头）、`str_concat`、`str_eq` / `str_neq`
  （先比长度，再 `repe cmpsb`）、`str_length`、`str_at`（越界 -1，与 `dtp_strAt` 一致）、
  `str_substring`（`start`/`len` 夹取到 `[0, n]`，与 `dtp_substring` 一致）、
  `str_hash`（`((h*33)+c) land 1023`，与 `dtp_strHash` 一致）、`str_from_int`（含负号）、
  `show_str`（引号 + `\"` `\\` `\n` `\t` `\r` 转义，与 `dt_show_string` 一致）。
- 调试/失败：`debug_on`（恒 0 = 关闭）、`debug_line`（1 参返回 0）、`assert`（成功返回
  value，失败走 `trap_assert`）、`prim_fail` / `todo`、`trap_msg` / `trap_assert` /
  `trap_todo`。失败路径**不分配**：前缀是 `.rodata` 裸文本，msg 是带长度头的字符串，
  逐段 `write` 到 stderr 后 exit 2。
- 入口打印：`print_int` / `print_bool` / `print_str`（栈上 itoa / 原样字节 + 换行）。
- 对象与分配：`alloc`（`rdi`=字节数 → `rax`，bump 堆，越界 trap OOM）；变体对象
  `[0]`=tag、`[8]` 起字段；record 对象 `[0]` 起就是字段；字段按最大 arity 补齐（补 0）。
  `trap_impossible` 是 case 无匹配臂时的兜底 trap（与 OCaml 的 `DT: impossible branch` 同义）。
- 效应叶子：`prim_eff_newRef` / `readRef` / `writeRef`（`IORef`，单槽对象）、
  `prim_eff_print` / `eprint`（写 fd 后返回字节数）、`prim_eff_exit`；预装宿主 handler
  用到的 `@vuna@host@*` / `prim_eff_*_host` 名字映射到同一批叶子。
- 进程入参与环境：`_start` 从初始栈拷 `argc` / `argv` / `envp` 到 `.bss`；`getArgs`
  （List 桥接，不含 `argv[0]`）、`getenv`（扫 `envp` 的 `KEY=`）、`getcwd`（syscall 79）、
  `execPath`（`readlink /proc/self/exe`，syscall 89）失败时返回空串 / `"."`。
- 时钟与 tty：`effTimeUs`（`clock_gettime`，syscall 228）、`prim_eff_sleep`（`nanosleep`，
  syscall 35）、`@vuna@host@isTty`（`ioctl(0, TCGETS)`）、`@vuna@prim_eff_hostStatus`
  （读 `rt_host_status` 槽；fs / process 的 `try*` 后续写入）。
- 文件系统：14 个叶子（`tryReadFile` / `tryWriteFile` / `tryWriteFileAtomic` /
  `tryReadDir` / `tryIsDirectory` / `tryMakeDir` / `tryMakeDirExclusive` / `tryRemoveFile` /
  `tryRemoveTree` / `tryRename` / `trySymlink` / `fileExists` / `fileMtime` / `fileSize`）
  走 `openat` / `read` / `write` / `fstat` / `getdents64` / `mkdirat` / `unlinkat` / `rmdir` /
  `rename` / `symlinkat`；失败写 `rt_host_status`（errno → 码表与 `dtp_hostCode` 一致：
  ENOENT=1、EACCES/EPERM=2、ENOSPC=3、ENOTDIR=4、EISDIR=5、EEXIST=6、其它=9）。
  `tryReadDir` 返回**字典序** `List String`；`tryRemoveTree` 递归删除时每层用自己的
  32 KiB `getdents64` 缓冲；`tryWriteFileAtomic` 写 `<path>.<pid>.tmp` 再 `rename`。
- 进程：`runIn` / `tryRunIn`（`chdir` + `fork` + `execve("/bin/sh", ["-c", cmd])` + `wait4`
  + 恢复 cwd；实参按 shell 单引号转义）、`spawn`（`fork` + `execve("/proc/self/exe", argv)`，
  argv[0] 是本进程路径）、`wait`（`wait4` 取退出码，被信号杀死按 1）、`exit_process_host`。
- 未实现的宿主面：stdin 的 `readLine` / `readBytes`（编译器闭包不可达）与 net。
- 续延：`prim_effectPerform`（`rt_eff_perform`）、`prim_effectHandle`（`rt_eff_handle`）、
  `prim_effectSelf`（`rt_eff_self`：用 `rt_self` 记录的当前节点重装 handler）、
  `rt_eff_resume` / `rt_eff_kdone`；设计与限制见 §3.4。其余 `prim_eff_*` 宿主原语仍未实现。
- 浮点：`float_from_int` / `int_from_float`（截断）/ `float_abs` / `float_sqrt`、
  `float_add/sub/mul/div`、`float_eq/neq/lt/le/gt/ge`；展示不是运行时符号，
  走 `Base.Float.floatRender`（Vuna 实现，三端共用）。
- 数组：`array_length` / `array_get` / `array_set`（COW）/ `array_make`，以及
  `array_from_list` / `array_to_list`（走 canonical `List` 族，与 List 桥接同一批生成）。
- 只读数据：`True` / `False` / 换行 / 除零信息 / OOM 信息 / 错误报告前缀（`vuna: runtime
  error: `、`assertion failed: `、`TODO: `、`vuna: runtime error: impossible branch`）；由
  `Native.Runtime.nativeRodata` 提供。字符串字面量由 `Native.Module` 收集成
  `NativeStrLit`（`npStrLits`）。

### 5.1 资源限制（内存 / 核数 / 超时）

`_start` 在 `vuna_main` 之前调用 `init_mem` / `init_cpus` / `init_timeout`；配置全部来自
env，**不进 codegen**（同一 IR 的 `main.s` 逐字节确定）。解析失败一律回落缺省，不阻断启动。

| env | 缺省 | 语义 |
| --- | --- | --- |
| `VUNA_NATIVE_MEM_LIMIT` | `1073741824`（1 GiB） | `.bss` 堆的**累计**分配字节 + 续延捕获缓冲的**活跃**字节；超限 `memory limit exceeded` + exit 2；`0` = 不限 |
| `VUNA_NATIVE_CPUS` | `auto` | `auto` = min(`sched_getaffinity` 计数, cgroup v2 `cpu.max` 的 `ceil(quota/period)`)，下限 1；`N` = 取前 N 个可用核；`0` = 不动亲和性；只缩小不放大 |
| `VUNA_NATIVE_TIMEOUT_MS` | 不限 | wall-clock 总超时；`setitimer(ITIMER_REAL)` + SIGALRM（`SA_RESTORER` + `rt_sigreturn` 桩），handler 只 `write` + exit 2；`0` = 不限 |

- 预算检查在 `alloc` 的预留之前（1 条 `cmp`/`ja`，无限制时 0 开销之外只多一次 load）；
  捕获缓冲在分配时累加、`free_capture` 归还时递减。
- **续延栈段不计入预算**：`resume` 的段按 `pow2_ceil(len + 32 MiB + 16)` 预留（页惰性提交），
  按预留算会让 500 层嵌套一上来就爆；段耗尽仍由 `continuation stack overflow` / `mmap`
  失败（`out of memory`）单独收口。
- 亲和性是进程级：`fork` / `execve` 后子进程继承；`spawn` / `runIn` 的 env 默认**剔除**
  `VUNA_NATIVE_*`（`VUNA_NATIVE_INHERIT=1` 时原样传），避免子进程继承父进程的预算。
- 口径边界：核数限制**不是 CPU 配额**（不限制单核跑多久，要限速用超时）；cgroup 只读 v2
  挂载根的 `cpu.max`（v1 或读不到时退化为 `sched_getaffinity` 计数）；超时是启动快照。

**可观测性**（规范见 [observability.md](observability.md)）：`@vuna@obs@level` /
`log` / `counter` / `mark` / `sampleStart` / `sampleStop` 是 **no-op 桩**（返回 `Int 0`）；
高阶的 `@vuna@obs@span` / `spanLab` 调 thunk（闭包，实参 `0`）后原样返回结果，不写事件。
因此 native 产物上 `VUNA_OBS` 不生效。

## 6. 模块布局与确定性

- `Native.Model`：寄存器/操作数/指令/函数/程序 + `NativeErr`；`OpMemX`
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

依赖方向由 `compiler/vuna.toml` 的 `[layers]` 强制（`"Vuna.Compiler.Native" =
["Vuna.Compiler.Ir"]`，见 [packages.md](packages.md)「层约束」）：`Native.*` 不得 import
`Core` / `Elab` / `Intrinsics` / `Codegen` / `Wasm`；`Driver/Native` 不得 import
`Core` / `Elab` / `Intrinsics`。`checks.ir-boundary` 保留形状与正向断言
（`Native.Module` 必须 import `Ir`）。

## 7. 验证

- `test/suite/steps/105_native_backend.steps`（section 90 / `steps_native`，e2e）：
  native 机制——产物形状（`main.s` / `build.sh` / 链接）、多函数 label 不撞名、确定性、
  除零与 `assert` / `todo` / `prim_fail` 的错误文本、可增长 arena、arity > 6 的栈传参、
  效应入口 / 宿主 handler / 续延恢复 / abort、`--no-compile`。
- 宿主层（fs 写读/原子写/目录排序/stat/rename/symlink/递归删除、argv/env/cwd/execPath、
  clock/tty、bracket、runIn/spawn/wait）由 105 的 9o–9s 覆盖。
- 共享语义（算术 / 字符串 / data / record / List 桥接 / 闭包 / 高阶 API）由
  suite 的 `pure-cross` 分类（`test/corpus/pure_cross/`）对拍三端，OCaml 是语义 oracle。
- 效应语义（handler / resume / abort / 嵌套 / return 改类型 / 宿主 console / 深递归）
  已并入 suite `pure-cross` 分类的三端对拍。
- 工具链：`cc` 缺失时 steps 首步明确失败；e2e 的 `nativeBuildInputs` 含
  `ocamlTools`（gcc/binutils）。

## 8. 已知边界

- 变体分支的**嵌套深匹配**：case 只按 tag 做一次线性分派，不做多模式矩阵。
- 续延是**一次性**（one-shot）：resume 两次 trap；multi-shot 不做。每次 resume 把
  `[perform_rbp, rt_stack_top)` 整段栈拷到新栈段（32 MiB 预留，页惰性提交；
  越界 trap）；捕获块与栈段都按 2 的幂分档复用，但嵌套 resume 会同时保留多层栈段，
  因此 N 层顺序 effect 仍是 O(N²) 时间与内存（见 §3.4 的读数）。
- FFI / extern；stdin 的 `readLine` / `readBytes` 与 net。
- **自举运行**：`vuna build compiler --target native` 产出可链接的 `bin/vuna-compiler`
  （`version` / 帮助可用）；`check <小包>` 能跑完并给出正常诊断。冷 store 上
  `check test/corpus/packages/m34_summary/root` **整包通过**（exit 0）。
  大包尚未跑通：`check base` / `check examples/infra` 以 `continuation stack overflow`
  收口（不再是 SIGSEGV）——native 不做尾调用，深递归耗尽固定 32 MiB 续延窗口，是
  [debt.md](debt.md) D89 记录的已知限度（真正的解法是按需扩栈或尾调用）。
  CI 的 `nix run .#backend-check -- --compiler native` 因此是非阻塞任务（口径见
  [testing.md](testing.md)「后端自举 conformance」）；它的 `selfhost` scope 在整仓
  `check` 上以 `continuation stack overflow` 收口。
- 无 GC/RC：字符串只增不减；堆是可增长 arena（初始 1 MiB，越界 `mmap` 新段），
  段不回收。
- **运行期性能与内存**：`nix run .#vuna-perf -- --target native`（或 `--target both`）
  在 16 个生成程序基准上测 native 产物；基线 `bench/native-baseline.json`，读数与口径见
  [performance.md](performance.md) §8.1。native 不做尾调用，16 个基准里 11 个在默认 8 MiB
  栈下会崩溃（exit 139），基准因此在 `ulimit -s unlimited` 下运行，JSON 的
  `meta.stack_policy` 记录该口径、每项另有 `default_stack_ok` 探针；峰值 RSS 计入栈页与
  只增不减的 arena，需与墙钟一起读（D98）。TCO / GC 落地时看 `tco_mutual` / `tco_wide` /
  `gc_low_live` / `gc_array_churn` 四组判定项（[performance.md](performance.md) §8.2）。
- **内存预算的口径依赖「arena 不回收」**：`VUNA_NATIVE_MEM_LIMIT` 现在是堆的累计分配 +
  捕获缓冲的活跃字节。引入 GC 后要收紧为 **live heap 上限 + GC 触发阈值**（完整一次回收
  后仍超限才 trap），否则高 churn、低存活集的程序会被误杀；同时 GC 需要一个核数口径与
  亲和性共用（§5.1 的 `auto` 结果），并且续延捕获栈的保守扫描要与 GC 的扫描约定合并。
  这三项是 GC 落地时必须一起改的接口，不是限制器单独能收的。
- 核数限制是**亲和性**，不是 CPU 配额：单核跑多久不管，长时间占用用
  `VUNA_NATIVE_TIMEOUT_MS`；cgroup 只读 v2 挂载根的 `cpu.max`。
- `Int`/`Nat`/`Bool` 的 heap 布局、对象头/复用（Perceus RC 依赖这一层）。
- 多文件目标链接/对象文件：IR 已经是整程序单单元；不需要独立目标文件。
- 对象库/增量缓存、`vuna run --target`、`--target native` 的 release 差异。
- aarch64 及非 Linux 平台；寄存器分配与优化；栈溢出检查；位置表/backtrace。
- 零参定义的重算优化（引入副作用前必须改）。

## 9. 对象表示与 List 桥接

List / record / 用户 `data` 共用同一套对象布局（`[tag]` + 8 字节字段，按该族最大 arity
补齐）；桥接的四个符号没有专用表示，它们只是这套对象上的生产/消费函数：

- 四个符号在 IR 里是 `IrApp (IrRt sym) args`（`irInlineArity = 0`），arity 由
  `Native.Runtime.nativeRtValueArity` 给出、标签由 `nativeRtTarget` 映射。
- `strUnpack` 每个字符一个 cons cell，`split` / `lines` 反复调用会快速消耗堆；因此堆是
  可增长 arena（越界 `mmap` 新段，旧段不回收，回收策略属于独立的 RC 设计）。
- 门禁在 Lowering（`CG_ListBridgeRequired`）：没有 canonical `List` 族的程序根本走不到
  桥接符号，后端不需要再判一次。

**不要用索引扫描（`strAt` + fuel）自写 native 文本函数绕过桥接**：那会与 `Base.String`
语义分叉，不进终态。

## 10. 相关阅读

- [ir.md](ir.md)：IR 节点、运行时契约、后端义务。
- [architecture.md](../architecture.md)：子系统地图与改动定位。
- [wasm.md](wasm.md)：第二个产品后端（同样的「文本 canonical + 外部工具」策略）。

