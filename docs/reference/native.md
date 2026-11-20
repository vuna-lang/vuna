# native 后端

> 状态：**x86-64 Linux 上端到端工作**。支持面 = Int / Nat / Bool 纯值 + `String`
> （字面量、`++` 及其 `IrConcatMany` 展平、`strFromInt`、`strLength`、`strAt`、
> `strSubstring`、`strHash`、`strShow`、`bi_eq_str` / `bi_neq_str`、String 入口）+
> 六种位运算、`assert` / `todo` / `prim_fail`（统一错误报告）、`dbg!` 的
> `@vuna@debug@on` / `@vuna@debug@line`、**栈传参**（arity > 6）+ 用户 `data`（变体 tag
> 分派）、record 构造/投影/更新与通用 `case` + List 桥接（`strUnpack` / `strPack` /
> `strConcatMany` / `strSubstTemplate`）+ 闭包与高阶应用 + Float（算术/比较/转换/展示）。
> 堆是段链表 + 尺寸类复用 + **保守标记-清扫 GC**（非移动）；对象布局见 §2，回收契约见 §5.2。
> `main : Eff r a`（含带行的宿主效应，
> 入口自动预装 `runXHost`）与 `IORef` 可用；`perform` / `handle` 走**库机器**
> （`Control` 循环 + trampoline）实现一次性续延（§3.4）。FFI / extern 仍被明确拒绝（`NativeUnsupported`）。
> 实现入口：`Vuna.Target.Native.{Model,Abi,Pal,Gc,Runtime,Module,Render}`，
> 插件入口 `Vuna.Target.Native.Plugin`。边界见 §8。

## 1. 产物与工具链

- **canonical 产物是按模块切分的 Intel 语法汇编文件集**：`runtime.s`（运行时常量 / `.bss` /
  `rt_*` 函数）加每模块一个 `<Module/Path>.s`（`Main.s` 是入口模块，含 `_start`）。
  文本可审查、可 diff，不嵌入时间戳/绝对路径；同一 IR 的文件集逐字节确定。
- `vuna compile <ENTRY|PKG> <OUT> --target native` → 写出上述 `.s` 文件集（不产 `build.sh`）。
- `vuna build <PKG> --target native [--out OUT] [--no-compile]`：
  - 默认 `OUT = <pkg>/.output`；显式 `--out` 且在 workspace（多包）时按 `<OUT>/<pkg>`；
  - 写 `.s` 文件集 + `<OUT>/build.sh`，并调用 `build.sh`（系统 `cc`）产出 `<OUT>/bin/<pkg>`；
  - `--no-compile` 只写 `.s` 文件集 + `build.sh`，不链接。
- `build.sh` 逐文件 `cc -c` 到 `build/`，再链接（对象顺序由生成的文件列表固定）；按内容哈希
  （`cksum`）判增量，内容没变的 `.s` 不重编：
  ```sh
  sh build.sh                      # native-build: compiled 143 of 143
  sh build.sh                      # native-build: compiled 0 of 143（只链接）
  ```
  依赖 `cc` / `as` / `ld`（Nix devShell 与测试环境的 `ocamlTools` 已提供）。它们是
  **构建期外部工具，不进 TCB、不进 seed**，与 wasm 侧 `wasm-tools parse` 同构。
- ELF 字节依赖链接工具版本，只保证**行为**；`.s` 文件集保证字节确定。
- 不接对象库：每次重新生成 `.s` 文件集，只有 `cc` 层按内容哈希增量。

## 2. 平台与值表示

- 目标：x86-64 Linux（SysV AMD64），静态、无 libc；入口 `_start` 走 Linux syscall
  (`write` / `exit`)。不支持 aarch64 / macOS / Windows。平台知识（syscall 号、`stat` /
  `dirent` 布局、errno 码表、`PATH_MAX`）全在 `Native.Pal` 一张表里；架构约定（寄存器、
  栈槽、对象头）在 `Native.Abi`。
- `Int` / `Nat`：63-bit 有符号（与 OCaml `int` 同域），`+ - *` wrap，`/` 向零截断、
  除零 trap；`natAdd/natSub/natMul` 饱和，`natSucc` 饱和到 `max_int`。
- `Bool`：0/1（不是变体）。
- `String`：**指向长度头的指针**。堆对象布局 = `[0..7]` 字节数（i64）+ `[8..]` 字节；
  字符串不可变，任何构造（`++` / `strFromInt` / `strSubstring` / `strShow`）都分配新
  对象。字符是字节（UTF-8 字面量按字节存放，`strLength` 返回**字节数**，与 OCaml
  `String.length` 一致）。
- **堆**：段链表（`.bss` 里的 1 MiB 起始段 + 按需 `mmap` 的新段，段按 2 的幂增长）。
  每个块前有 8 字节块头 `[size | flags]`（标志：mark / free / leaf / pin），对象指针指向
  块头之后。空闲块按 2 的幂尺寸类复用；**保守标记-清扫 GC**（非移动）见 §5.2。
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
  `rbp`，不碰 `rbx/r12-r15`，因此无需保存 callee-saved（生成代码与运行时都不使用它们）。
- **单出口**：带栈帧的运行时函数体内出现的 `IRet` 由 `Native.Runtime.rtFunc` 统一改写
  成跳到函数尾标签（`mov rsp, rbp; pop rbp; ret`）；只有无栈帧的入口/陷阱（`rtRawFunc`）
  直接写 `ret`。手写分支因此不会「提前 ret 把 rsp 留在 frame 里」，不会崩在返回地址上。
- 入口 `_start`：初始化堆指针 → `and rsp, -16` → `call vuna_main` → 按入口 show
  打印 → `exit(0)`；不解析 argv，无栈溢出检查。
- **尾调用**：结果位置由 `Ir.Tail` 标记（`cpsDefsMachine` 之后）。native 的覆盖面：
  1. **自递归**：饱和自调用写回形参槽后 `jmp` 到函数内的 loop header，不拆帧/不重建帧，
     也不受来参区限制；
  2. **直调**：饱和 `IrGlobal` 把实参写回**调用者的来参区** `[rbp+16...]`，装参数寄存器后
     `mov rsp, rbp; pop rbp; jmp 目标`。空间判据 `8 × 栈实参个数 <= nativeTailRoomBytes`；
     不满足回退普通 `call`（窄调宽）；
  3. **饱和闭包**：快路径 `jmp [clo]`（闭包 ABI：`rdi` + `rsi..r9`，第 6 个起写回来参区）；
     慢路径（部分 / 过度应用）仍走 `call rt_apply`；
  4. **函数值 wrapper**：wrapper 把闭包实参搬进本帧槽后直接 `jmp` 目标；函数值递归不会
     每轮累积 wrapper 帧；
  5. **runtime 符号**：饱和 `IrRtApp` / `IrRt` / `genRtValueCall` / `nat_succ` 发 `jmp rt_*`。
  源级 `let` 的立即 lambda 在 native codegen 内联成 `IrLet` 形态，不再分配闭包；`let`
  循环走普通直调尾跳（或上面的自递归 loop）。仍不回退为尾调用的情况：窄调宽、`rt_apply`
  慢路径、非尾递归。

### 3.4 效应 handler 与一次性续延

native 与 wasm 跑同一份**库机器**（`Base.Effect.Core.Control` 循环，设计与能力矩阵见
[effect-machine.md](effect-machine.md)）：lowering 的机器 pass 把 `perform` / `handle`
改写成 `MkPerform` / `MkHandle` 等 `Control` 步骤，`machineRun` 的 trampoline 驱动。

- 生成的代码只构造 `Control` 值；handler 帧（`MkFrame`）与机器状态是普通堆对象，
  不使用 `.bss` 的 handler 链、不拷贝/迁移宿主栈。
- `MkPerform` 按 `(keyId, nameId)` 在 `msFrames` 链上找最内层帧；`MkResume` 把续延
  交回；`unwind` / `finish` 负责弹帧与按深度跑 cleanup。
- **常量栈**：每次转移都是一次循环迭代（`step` 返回 `Pair MSt Control`，`runGo` 立即
  消费），续延链不占宿主栈；顺序 perform 的深度不随次数增长。
- **one-shot**：续延槽 → epoch 表（`MSt.msUsed`）拒绝重放；尾 resume 复用 `tailSlot`。
- 宿主 handler 与用户 handler 走同一套 `MkHandle`，没有「宿主直连」旁路。
- 旧栈拷贝实现（`rt_eff_*`、`rt_handlers`、捕获缓冲与迁移栈段、`rt_next_host` 标记）
  已删除；GC 的保守根集只有当前栈区间（`rt_stack_top`）与 `rt_cleanups`。

延迟 answer（`opH` 返回函数、`resume` 发生在 `MkHandle` 返回之后）仍不支持，见
[debt.md](debt.md) D101。

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
| `IrGlobal` | 支持 | 零参引用生成 `call vuna_<name>`（结果位置时 `jmp`，§3）；作为函数值传递时生成闭包（wrapper） |
| `IrLet` | 支持（≤1 运行时 binder） | 多运行时 binder（boxed case 降级）拒绝；body 按结果位置生成 |
| `IrApp` | 支持 | 饱和顶层直调；结果位置且来参区够用时走尾调用（§3）；部分 / 过度应用、动态 head 与运行时目标走 `rt_apply` |
| `IrIf` | 支持 | 条件按 0/1 判 |
| `IrRtApp` | 支持白名单 | 参数左→右；`&&`/`||` 短路 |
| `IrConcatMany` | 支持 | 左→右两两 `++`（Lowering 对 ≥3 项的 `++` 链发此节点） |
| `IrNatCase` | 支持 | `if sc == 0 then zero else succ`；succ binder = `sc-1`，catch binder = `sc` |
| `IrLam` | 支持 | 作为值 → 闭包对象 `[code][arity][捕获...]`；应用统一走 `rt_apply` |
| `IrCtor` / `IrRecord` / `IrProj` / `IrRecUpd` / `IrCase` | 支持 | 对象头 + 字段；§5 的「对象表示」 |
| `IrEffThunk` | 支持 | 生成 `MkEff (fun _ => prim args)`；效应原语作为值出现时用 |
| `IrEffBind` | 拒绝 | 只服务 `prim_eff_bind1`，base 不用 |
| `IrRt` | 支持白名单值形态 | `@ir@natSucc`（调用 head）与入口 show 由 Module 特化；作为值同样生成 wrapper 闭包 |
| Float | 支持 | 堆对象 `[f64]`；比较按 OCaml 语义；展示走 `Base.Data.Float.floatRender` |
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
`Vuna.Target.Ocaml.Term` 的 `bi_*` / `dt_show_*` / `dtp_*` 模板，不重新定义语义：

- `Int`：`add/sub/mul/div`（63-bit wrap；除零 trap）；`bit_and/bit_or/bit_xor/bit_not/
  bit_shl/bit_shr`（63-bit 语义；移位计数 `n < 0 || n >= 63` → 0，`bit_shr` 保留 bit 62）；比较返回 0/1。
- `Nat`：饱和加法/乘法、下溢到 0 的减法、除零 trap、`natToInt` / `natFromInt` / `natSucc`。
- `String`：`str_alloc`（bump 分配，含长度头）、`str_concat`、`str_eq` / `str_neq`
  （先比长度，再走 `bytes_eq`：8 字节字比较 + 字节尾部）、`str_compare`（先走 `bytes_cmp`
  比公共前缀，再比长度）、`str_length`、`str_at`（越界 -1，与 `dtp_strAt` 一致）、
  `str_substring`（`start`/`len` 夹取到 `[0, n]`，与 `dtp_substring` 一致）、
  `str_hash`（`((h*33)+c) land 1023`，与 `dtp_strHash` 一致）、`str_from_int`（含负号）、
  `show_str`（引号 + `\"` `\\` `\n` `\t` `\r` 转义，与 `dt_show_string` 一致）。
- 调试/失败：`debug_on`（恒 0 = 关闭）、`debug_line`（1 参返回 0）、`assert`（成功返回
  value，失败走 `trap_assert`）、`prim_fail` / `todo`、`trap_msg` / `trap_assert` /
  `trap_todo`。失败路径**不分配**：前缀是 `.rodata` 裸文本，msg 是带长度头的字符串，
  逐段 `write` 到 stderr 后 exit 2。
- 入口打印：`print_int` / `print_bool` / `print_str`（栈上 itoa / 原样字节 + 换行）。
- 对象与分配：`alloc`（`rdi` = payload 字节数 → `rax` = 对象地址；尺寸类空闲链 → bump →
  新段，越界 trap OOM）；`alloc_leaf`（字符串 / Float）与 `alloc_pinned`（续延捕获缓冲）
  在块头上打对应标志。变体对象
  `[0]`=tag、`[8]` 起字段；record 对象 `[0]` 起就是字段；字段按最大 arity 补齐（补 0）。
  `trap_impossible` 是 case 无匹配臂时的兜底 trap（与 OCaml 的 `DT: impossible branch` 同义）。
- 效应叶子：`prim_eff_newRef` / `readRef` / `writeRef`（`IORef`，单槽对象）、
  `prim_eff_print` / `eprint`（写 fd 后返回字节数）、`prim_eff_exit`；预装宿主 handler
  用到的 `@vuna@host@*` / `prim_eff_*_host` 名字映射到同一批叶子。
- 进程入参与环境：`_start` 从初始栈拷 `argc` / `argv` / `envp` 到 `.bss`；`getArgs`
  （List 桥接，不含 `argv[0]`）、`getenv`（扫 `envp` 的 `KEY=`）、`getcwd`（syscall 79）、
  `execPath`（`readlink /proc/self/exe`，syscall 89）失败时返回空串 / `"."`。
- 时钟与 tty：`effTimeUs`（`clock_gettime`，syscall 228）、`prim_eff_sleep`（`nanosleep`，
  syscall 35）、`@vuna@host@isTty`（`ioctl(1, TCGETS)`，stdout，与 OCaml 侧一致）、`@vuna@prim_eff_hostStatus`
  （读 `rt_host_status` 槽；fs / process 的 `try*` 后续写入）。
- 文件系统：14 个叶子（`tryReadFile` / `tryWriteFile` / `tryWriteFileAtomic` /
  `tryReadDir` / `tryIsDirectory` / `tryMakeDir` / `tryMakeDirExclusive` / `tryRemoveFile` /
  `tryRemoveTree` / `tryRename` / `trySymlink` / `fileExists` / `fileMtime` / `fileSize`）
  走 `openat` / `read` / `write` / `fstat` / `getdents64` / `mkdirat` / `unlinkat` / `rmdir` /
  `rename` / `symlinkat`；失败写 `rt_host_status`（errno → 码表与 `dtp_hostCode` 一致：
  ENOENT=1、EACCES/EPERM=2、ENOSPC=3、ENOTDIR=4、EISDIR=5、EEXIST=6、其它=9）。
  `tryReadDir` 返回**字典序** `List String`；`tryRemoveTree` 递归删除时每层用自己的
  8 KiB `getdents64` 缓冲，并在分配帧后检查栈下界（主栈取 `rt_stack_top - 4 MiB`，
  迁移栈取 `rt_stack_limit`）——越界 trap `directory tree too deep` 而不是 SIGSEGV；
  路径拷贝按容量上界检查，超出 trap `path too long`；`tryWriteFileAtomic` 写
  `<path>.<pid>.tmp` 再 `rename`。
- 进程：`runIn` / `tryRunIn`（`chdir` + `fork` + `execve("/bin/sh", ["-c", cmd])` + `wait4`
  + 恢复 cwd；实参按 shell 单引号转义）、`spawn`（`fork` + `execve("/proc/self/exe", argv)`，
  argv[0] 是本进程路径）、`wait`（`wait4` 取退出码，被信号杀死按 1）、`exit_process_host`。
- 未实现的宿主面：stdin 的 `readLine` / `readBytes`（编译器闭包不可达）与 net。
- 续延：`perform` / `handle` 由库机器（`Base.Effect.Core` 的 `Control` 循环）执行，见 §3.4；
  旧的 `rt_eff_*` 栈拷贝实现已删除。其余 `prim_eff_*` 宿主原语仍未实现。
- 浮点：`float_from_int` / `int_from_float`（截断）/ `float_abs` / `float_sqrt`、
  `float_add/sub/mul/div`、`float_eq/neq/lt/le/gt/ge`；展示不是运行时符号，
  走 `Base.Data.Float.floatRender`（Vuna 实现，三端共用）。
- 数组：`array_length` / `array_get` / `array_set`（COW）/ `array_make`，以及
  `array_from_list` / `array_to_list`（走 canonical `List` 族，与 List 桥接同一批生成）。
- 只读数据：`True` / `False` / 换行 / 除零信息 / OOM 信息 / 错误报告前缀（`vuna: runtime
  error: `、`assertion failed: `、`TODO: `、`vuna: runtime error: impossible branch`）；由
  `Native.Runtime.nativeRodata` 提供。字符串字面量由 `Native.Module` 收集成
  `NativeStrLit`（`npStrLits`）。
- 契约一致性：`irInlineArity` 声明的 arity 与未实现符号清理由
  `packages/target-native/test/RuntimeTable.vuna` 冻结（CI 的 `vuna test` 会跑）；关闭缺口
  时同步删掉登记项，否则测试报「listed as a gap but implemented」。

### 5.1 资源限制（内存 / 核数 / 超时）

`_start` 在 `vuna_main` 之前调用 `init_mem` / `init_gc` / `init_cpus` / `init_timeout`；配置全部来自
env，**不进 codegen**（同一 IR 的产物逐字节确定）。解析失败一律回落缺省，不阻断启动。

| env | 缺省 | 语义 |
| --- | --- | --- |
| `VUNA_NATIVE_MEM_LIMIT` | `1073741824`（1 GiB） | **live 堆**上限（含被钉住的续延捕获缓冲）：分配的预留超过它时先做一次完整 GC，GC 后 `live + 本次` 仍超限才 `memory limit exceeded` + exit 2；`0` = 不限 |
| `VUNA_NATIVE_GC_MIN` | `1048576`（1 MiB） | 触发阈值下限（也是新堆段的最小尺寸）：阈值 = `max(GC_MIN, 2 × live, 上次 GC 扫到的栈字节数)` |
| `VUNA_NATIVE_GC_LOG` | 关 | 存在即向 stderr 打诊断行 `gc n=<次数> live=<字节> alloc=<自上次 GC 起的分配字节>` |
| `VUNA_NATIVE_GC_STRESS` | 关 | 存在即每次分配前都做一次完整 GC（抓漏根的调试开关，不是运行模式） |
| `VUNA_NATIVE_CPUS` | `auto` | `auto` = min(`sched_getaffinity` 计数, cgroup v2 `cpu.max` 的 `ceil(quota/period)`)，下限 1；`N` = 取前 N 个可用核；`0` = 不动亲和性；只缩小不放大 |
| `VUNA_NATIVE_TIMEOUT_MS` | 不限 | wall-clock 总超时；`setitimer(ITIMER_REAL)` + SIGALRM（`SA_RESTORER` + `rt_sigreturn` 桩）；到点先收掉在跑的子进程组，再写 `vuna: runtime error: timeout exceeded` + exit 2；`0` = 不限 |

- 预算检查在 `alloc` 里分配之前（`live + 已分配 + 本次 > limit` → 先 GC；GC 后仍超才 trap）；
  `live` 由清扫阶段累计（见 §5.2）。
- 亲和性是进程级：`fork` / `execve` 后子进程继承；`spawn` / `runIn` 的 env 默认**剔除**
  `VUNA_NATIVE_*`（`VUNA_NATIVE_INHERIT=1` 时原样传），避免子进程继承父进程的预算。
- 超时生效（定时器已装）时，`runIn` / `spawn` 的子进程在 `execve` 前 `setpgid(0, 0)` 自成
  一组，父进程把它的 pid 记进 pid 槽表（`rt_child_pids`，`rt_child_count` 个在用；
  `wait` 返回后按 pid 摘掉自己那一槽——并发 spawn 的其它组不受影响）。到点时 SIGALRM
  handler 遍历槽表，只在 `getpgid(child)` 等于该 pid（确认子进程真的成了组首）时
  `kill(-child, SIGKILL)` 收整组，否则只 `kill(child, SIGKILL)`：`setpgid` 没生效时子进程与
  父进程同组，按组发信号会把父进程自己一起杀掉。handler 只用 async-signal-safe 的
  `getpgid` / `kill` / `write` / `exit_group`，不分配。
- fork 到子进程 `setpgid` 之间的窗口也关掉了：父进程 fork 前用 `rt_sigprocmask` 屏蔽
  SIGALRM（`rt_sigalrm_set` 是 SIGALRM 的位），父进程 `setpgid(child, child)` 入表之后才解除
  屏蔽，子进程在 `execve` 前自己 `setpgid(0, 0)` 并解除屏蔽（屏蔽字跨 `execve` 保留）。
  所以 handler 跑起来时每组的组首必然已经成立。
- 未装定时器时子进程留在父进程组，Ctrl-C / 终端作业控制语义不变。
- 职责边界：产物内的自超时只在 native 上做。OCaml 侧没有产物内定时器，`vuna run --timeout`
  额外包一层 coreutils `timeout -s TERM -k 5`（管它的直接子进程，见 [tooling.md](tooling.md) §4）；
  wasm 没有子进程。
- 口径边界：核数限制**不是 CPU 配额**（不限制单核跑多久，要限速用超时）；cgroup 只读 v2
  挂载根的 `cpu.max`（v1 或读不到时退化为 `sched_getaffinity` 计数）；超时是启动快照。

### 5.2 GC（保守标记-清扫，非移动）

实现在 `Native.Gc`，由 `Native.Runtime.alloc` 在预算或阈值处调用 `rt_gc_collect`。

- **块头**：8 字节 `[size | flags]` 放在 payload 之前；`size` 16 对齐，低 4 位是
  `mark` / `free` / `leaf` / `pin`。对象指针 = 块头 + 8，因此 payload 布局
  （`[0]=len/tag`、`[8]=字段`）不变。
- **段**：段头 32 字节 `[next][end][bump][kind]`，块区从段头之后开始；`rt_segs` 串起全部段，
  `rt_cur_seg` 是当前 bump 段。清扫按段线性走块头（空闲块保留自己的块头）。
- **尺寸类**：块大小向上取整到 2 的幂（16 B … 64 MiB），清扫把死块挂回对应类的链表，
  分配先弹表再 bump。大于 64 MiB 的块单独占一个段，死块进 `rt_huge_free` 首次适配链。
- **根集**（没有栈图，全部保守扫描）：
  1. 机器栈 `[rsp, rt_stack_top)`；GC 入口先把通用寄存器（含 `r15`）溢进自己的帧；
  2. `.bss` 白名单：`rt_cleanups`，以及 `alloc` 的调用方寄存器
     快照（`rt_alloc_save_rdi/rsi/r8/r9`：`alloc` 不建栈帧，这四个寄存器靠 `.bss` 保活）。
  3. 没有续延记录链：栈拷贝路径已删除，机器状态都是栈上的普通值，随第 1 项被扫到。
- **候选判据**：字必须指向某个已注册堆段内、16 对齐、块头合法且非空闲的 payload 起点。
  `Int` / 字节型偶然形似指针只会多留对象（非移动，不会失效）；`.rodata` 字面量不进堆，天然忽略。
- **不扫的块**：`leaf`（String / Float，payload 是字节或位型）与 `pin`（当前没有调用方；
  留给需要长期驻留的宿主缓冲）。
- **清扫**：清 mark、把未标记块按尺寸类回收、累计 `live`；之后
  `threshold = max(GC_MIN, 2 × live, 本次扫到的栈字节数)`（深递归按扫栈成本摊还）。
  非移动、不压缩，也没有分代/增量/并发。
- **死槽清零**（`Native.Module`）：调用点把实参装进寄存器/栈后立即清零实参槽；函数体
  在「文本上最后一次读」之后清零其余临时槽。生成的函数体没有回边，因此这一步是安全的，
  效果是活帧不再把已消费的临时对象留给保守扫描（`gc_low_live` 的 319 MiB → 5 MiB）。
  清除在 `clearDeadSlots` 里再裁一次：最后一次 `call` 之后的清除不会再有 GC 点（帧即将
  结束），同一基本块里已经清过且之后没被写入的槽不再重复清。清除只影响保留量，裁掉多余
  的不会漏根；编译器自身的清除指令因此减少约 38%。
- **标记栈**：首次 GC 时 `mmap` 1 MiB，溢出翻倍并拷贝；GC 内部只用 `mmap`，不走 `alloc`。

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
- `Native.Pal`：**平台面**——x86-64 Linux syscall 号、syscall 参数常量（`AT_FDCWD`、
  `O_*`、权限位、`AT_SYMLINK_NOFOLLOW`、`TCGETS`）、内核结构布局（`stat` 字段偏移、
  `PATH_MAX`、`cpu_set_t` / `timespec` / `termios`）、errno 码表。与 `Abi` 的分界：
  Abi 是架构（换架构要改），Pal 是内核接口（换内核 ABI 只改这里）。
- `Native.Gc`：标记-清扫 GC——块头判据、根集扫描、标记栈（倍增 mmap）、清扫与尺寸类
  回收、`GC_LOG` 诊断行；`alloc` 在预算/阈值处调 `rt_gc_collect`。
- `Native.Runtime`：`rt_*` 汇编模板、只读数据、`.bss` 布局、IR 符号 → 运行时标签白名单
  与值形态 arity。
- `Native.Module`：`IrProgram` → `NativeProgram`（可达性、入口、栈槽、**按模块切分的
  字面量池**、**模块内 `.L` label 编号**、fuel）。
- `Native.Render`：`NativeProgram` → `.s` 文件集（`runtime.s` + 每模块一个文件；固定段
  顺序、缩进、一条指令一行、八进制转义字节）。
- `Native.Plugin`：插件入口（IR codec → 检查 → lowering → 写 `.s` 文件集）；
  不 import Core/Elab/Intrinsics。

平台面的守卫：`checks.vuna-native-surface` 把 `Runtime` 的 syscall 站点、`.bss` 宿主缓冲
尺寸与内核路径摊平成 `nix/checks/data/native-surface.baseline`；`checks.vuna-native-artifact`
锁定 `runtime.s` / `Main.s` 的逐字节基线。前者让平台知识的变化显形，后者证明纯重构
零行为变化（`runtime.s` 与程序无关，覆盖全部运行时函数）。

每个文件固定布局：`.intel_syntax noprefix` → `.rodata`（runtime：运行时常量；模块：自己的
字面量池）→ `.bss`（只在 runtime）→ `.text` → `.note.GNU-stack`。名字由 Vuna 全限定名派生
（`vuna_<escaped>`、`rt_<name>`、`vuna_<owner>_lam<n>`），不按位置编号；`.L<n>` 与
`.Llit_<n>` 是**文件局部**符号（GNU as 的 `.L` 前缀），编号在模块内累加——模块文件之间
可以重号，改动一个模块不会让其它模块的标签重编号。跨文件引用的函数/数据标签一律
`.globl`。

依赖方向：IR 是独立包 `vuna-ir`（`Native.*` 跨包 import 它），`packages/compiler/vuna.toml` 的 `[layers]` 不再约束 Native：`Native.*` 不得 import
`Core` / `Elab` / `Intrinsics` / `Codegen` / `Wasm`。`checks.ir-boundary` 保留形状与正向断言
（`Native.Module` 必须 import `Ir`）。

## 7. 验证

- `packages/compiler/test/steps/105_native_backend.steps`（`steps_native`，e2e）：
  native 机制——产物形状（`.s` 文件集 / `build.sh` / 链接）、多函数 label 不撞名、确定性、
  除零与 `assert` / `todo` / `prim_fail` 的错误文本、可增长 arena、arity > 6 的栈传参、
  效应入口 / 宿主 handler / 续延恢复 / abort、`--no-compile`。
- GC：9y 高 churn 低存活集在 1 MiB live 预算下跑完（GC 前后输出一致、`GC_LOG` 有诊断行）、
  9z `GC_STRESS` 下续延 + List + 字符串输出不变、9aa GC 的 env 开关不影响产物；
  9t 仍锁「live 超限才 trap」。
- 尾调用：9ab 互递归 400 万层、9ac 9 参自递归（3 个栈实参）100 万层、9ad `if` / `case` /
  `natCase` 三种尾位置各 30 万层，都在默认 8 MiB 栈上跑完；9ae 断言「来参区不够」时
  `Main.s` 里是 `call` 而不是 `jmp`（回退正确）；9af 续延 resume 后的尾递归循环在
  `GC_STRESS` 下输出一致；9ag 带尾调用的产物两次编译逐字节一致；9ah 闭包体按
  闭包 ABI（`rdi` 占掉一个寄存器）算来参区——8 参 lambda 尾调 10 参函数正好用满 32 字节。
- 宿主层（fs 写读/原子写/目录排序/stat/rename/symlink/递归删除、argv/env/cwd/execPath、
  clock/tty、bracket、runIn/spawn/wait）由 105 的 9o–9s 覆盖；宿主进程的超时收尾由
  9u–9u3（单组 / 不改 pgid）与 9u4（并发 spawn 的两组）覆盖。
- 共享语义（算术 / 字符串 / data / record / List 桥接 / 闭包 / 高阶 API）由
  suite 的 `pure-cross` 分类（`packages/compiler/test/corpus/pure_cross/`）对拍三端，OCaml 是语义 oracle。
- 效应语义（handler / resume / abort / 嵌套 / return 改类型 / 宿主 console / 深递归）
  已并入 suite `pure-cross` 分类的三端对拍。
- 工具链：`cc` 缺失时 steps 首步明确失败；e2e 的 `nativeBuildInputs` 含
  `ocamlTools`（gcc/binutils）。

## 8. 已知边界

- 变体分支的**嵌套深匹配**：case 只按 tag 做一次线性分派，不做多模式矩阵。
- 续延是**一次性**（one-shot）：resume 两次被 epoch 表拒绝；multi-shot 不做。顺序 effect
  的栈深是常量（trampoline），不随 perform 次数增长；延迟 answer 的 handler 仍不支持
  （[debt.md](debt.md) D101）。
- FFI / extern；stdin 的 `readLine` / `readBytes` 与 net。
- **自举运行**：`vuna build packages/compiler --target native` 产出可链接的 `bin/vuna-compiler`
  （`version` / 帮助可用）；`check <小包>` 能跑完并给出正常诊断。冷 store 上
  `check packages/cli/test/corpus/packages/m34_summary/root` **整包通过**（exit 0）。
  整仓 selfhost 的现状见 [testing.md](testing.md)「后端自举 conformance」：尾调用（§3）只覆盖
  **直接饱和直调**，非尾递归、被闭包包住的递归仍按帧吃宿主栈；效应侧另有延迟 answer 的
  handler 缺口（[debt.md](debt.md) D101）。
  CI 的 `nix run .#backend-check -- --compiler native` 因此仍是非阻塞任务（口径见
  [testing.md](testing.md)「后端自举 conformance」）。
- **GC 的边界**：保守、非移动、不分代、不压缩。因此
  1. 活帧里**尚未清零的栈槽**仍被保守扫描；调用点实参槽与文本最后读取后会清零，所以
     `gc_low_live` 这类「分配后用掉、再尾递归」的形状不再按栈深度累计保留（死槽清零前
     `GC_LOG` live 从 0.9 MB 涨到 320 MB、墙钟 0.31 s → 9.5 s；清零后 322 ms / 5.4 MiB，
     见 [benchmarks.md](benchmarks.md) §1.2）。仍在跨调用临时值里的对象会被多留；
  2. 形似指针的 `Int` 会多留对象；非移动所以不会让指针失效；
  3. 空闲块按 2 的幂尺寸类复用、不合并相邻空块，内部碎片最多约 2×；
  4. 超过 64 MiB 的块单独占段、死块进 `rt_huge_free` 首次适配链（可复用，不 `munmap`）；
- **宿主缓冲与算术边界**（失败一律显式，不静默截断/越界写）：
  - `fsReadFile` 的读缓冲 8 MiB：超过上界报 io 错误（`vuna: fs: readFile …: host I/O error`，
    exit 1）；OCaml / wasm 没有这个上界；
  - `readDir` 的名字数组上限 4032 项：超出报 io 错误；
  - 路径缓冲 4096 字节：超长路径 trap（`vuna: runtime error: path too long`，exit 2）；
  - `Int` 除法 `min_int / -1` 返回 `min_int`（与 OCaml / wasm 一致，不触发 x86 `#DE`）。
- **运行期性能与内存**：`nix run .#vuna-perf -- --target native`（或 `--target both`）
  在 16 个生成程序基准上测 native 产物；基线 `bench/baselines/programs.json`，读数与口径见
[benchmarks.md](benchmarks.md) §1.1。非尾深递归在默认 8 MiB 栈下仍会崩溃（exit 139），
  基准因此在 `ulimit -s unlimited` 下运行，JSON 的 `meta.stack_policy` 记录该口径、每项另有
  `default_stack_ok` 探针；峰值 RSS = 栈页 + live 堆，需与墙钟一起读。TCO 由 `IrTail`
  标记驱动，覆盖直调、饱和闭包、函数值 wrapper、runtime 符号与自递归 loop；窄调宽、
  `rt_apply` 慢路径与非尾递归仍吃帧。`tco_mutual` / `tco_wide` / `arith` / `records`
  的判定与实测读数见 [benchmarks.md](benchmarks.md) §1.2；§1.1 的 native 列是 TCO 前快照。
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

**不要用索引扫描（`strAt` + fuel）自写 native 文本函数绕过桥接**：那会与 `Base.Data.String`
语义分叉，不进终态。

## 10. 相关阅读

- [ir.md](ir.md)：IR 节点、运行时契约、后端义务。
- [native-platform.md](native-platform.md)：平台层（syscall 垫片 / libc）的判据与实测读数。
- [architecture.md](../architecture.md)：子系统地图与改动定位。
- [wasm.md](wasm.md)：第二个产品后端（同样的「文本 canonical + 外部工具」策略）。


## 插件形态

native 后端在独立包 `packages/target-native`（二进制 `vuna-target-native`），不在 `seed/` 内。
编译器完成 DT 检查 + Lowering 后，把 `IrProgram` 用 `Vuna.Ir.Codec` 编码，以子进程调用：

```console
vuna-target-native --ir FILE --out DIR [--print] [--diag FILE] [--files FILE]
```

`--diag` 回传 `NativeErr` 诊断（`Vuna.Compiler.Base.Diag.Codec`），`--files` 回传产物清单
（编译器据此生成链接脚本）；链接仍由 CLI 调 `cc` 完成。协议细节见 [cli.md](cli.md)「后端插件协议」。
