# native 后端

> 状态：**x86-64 Linux 上端到端工作**。支持面 = Int / Nat / Bool 纯值 + `String`
> （字面量、`++` 及其 `IrConcatMany` 展平、`strFromInt`、`strLength`、`strAt`、
> `strSubstring`、`strHash`、`strShow`、`bi_eq_str` / `bi_neq_str`、String 入口）+
> 六种位运算、`assert` / `todo` / `prim_fail`（统一错误报告）、`log!` 的
> `@vuna@log@on`（恒 `False`）/ `@vuna@log@emit`（恒 `0`）、**栈传参**（arity > 6）+ 用户 `data`（变体 tag
> 分派）、record 构造/投影/更新与通用 `case` + List 桥接（`strUnpack` / `strPack` /
> `strConcatMany` / `strSubstTemplate`）+ 闭包与高阶应用 + Float（算术/比较/转换/展示）。
> 堆是段链表 + 尺寸类复用 + **两代标记-清扫 GC**（非移动；沿 `rbp` 链逐帧保守扫根，
> 老代靠写屏障标记的卡片）；对象布局见 §2，回收契约见 [native-runtime.md](native-runtime.md) §1.2。
> `main : Eff r a`（含带行的宿主效应，
> 入口自动预装 `runXHost`）与值句柄可变容器（`Base.Container.Mut*`）可用；`perform` / `handle` 走**库机器**
> （`Control` 循环 + trampoline）实现一次性续延（§3.4）。FFI / extern 仍被明确拒绝（`NativeUnsupported`）。
> 实现入口：`Vuna.Target.Native.{Model,Abi,Pal,Gc,Runtime,Module,Render}`，
> 插件入口 `Vuna.Target.Native.Plugin`。运行时符号、GC 与边界见 [native-runtime.md](native-runtime.md)。

## 1. 产物与工具链

- **canonical 产物是按模块切分的 Intel 语法汇编文件集**：`runtime.s`（运行时常量 / `.bss` /
  `rt_*` 函数）加每模块一个 `<Module/Path>.s`（`Main.s` 是入口模块，含 `_start`）。
  文本可审查、可 diff，不嵌入时间戳/绝对路径；同一 IR 的文件集逐字节确定。
- 可达根 = 入口 `main` + 入口预装的 handler（动作入口再加 `runMain`）。`Base.Effect.Core.machineRun`
  只在程序里出现 handler 组合子 / `runThunk` 跳板时才进根集（`Ir.Cps.usesMachineLoop`），
  纯程序不带机器。
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
  **构建期外部工具，不进 TCB、不进 seed**，与 wasm 侧的 `wasm-tools parse` / `wasm-opt`
  同构。
- ELF 字节依赖链接工具版本，只保证**行为**；`.s` 文件集保证字节确定。
- 不接对象库：每次重新生成 `.s` 文件集，只有 `cc` 层按内容哈希增量。

## 2. 平台与值表示

- 目标：x86-64 Linux（SysV AMD64），静态、无 libc；入口 `_start` 走 Linux syscall
  (`write` / `exit`)。不支持 aarch64 / macOS / Windows。平台知识（syscall 号、`stat` /
  `dirent` 布局、errno 码表、`PATH_MAX`）全在 `Native.Pal` 一张表里；架构约定（寄存器、
  栈槽、对象头）在 `Native.Abi`。
- `Int` / `Nat`：63-bit 有符号（与 OCaml `int` 同域），`+ - *` wrap，`/` 向零截断、
  除零 trap；`natAdd/natSub/natMul` 饱和，`natSucc` 饱和到 `max_int`。机器里的 `Int`
  值始终保持 63-bit 符号扩展：`band` / `bor` / `bxor` / `bnot` 对规范化封闭（按位结果
  不会越界），所以不再跟 `shl; sar` 的 wrap；`int_from_float` 也把结果规范化一次。
- `Bool`：0/1（不是变体）。
- `String`：**指向长度头的指针**。堆对象布局 = `[0..7]` 字节数（i64）+ `[8..]` 字节；
  字符串不可变，任何构造（`++` / `strFromInt` / `strSubstring` / `strShow`）都分配新
  对象。字符是字节（UTF-8 字面量按字节存放，`strLength` 返回**字节数**，与 OCaml
  `String.length` 一致）。
- **堆**：段链表（`.bss` 里的 1 MiB 起始段 + 按需 `mmap` 的新段，段按 2 的幂增长）。
  每个块前有 8 字节块头 `[size | flags]`（标志：mark / free / leaf / old），对象指针指向
  块头之后。空闲块按 2 的幂尺寸类复用；**两代标记-清扫 GC**（非移动）见
  [native-runtime.md](native-runtime.md) §1.2。
- 入口打印：`Int`/`Nat` 十进制 + `\n`，`Bool` 为 `True`/`False`，`String` 走
  `show`（`strShow` 带引号 + 转义）再打印，全部与 OCaml 入口钩子的
  `print_endline (show main)` 逐字一致。
- `Float`：IEEE-754 double，堆对象 `[f64]`；运算在 `xmm` 上做，比较按 OCaml 语义
  （NaN 参与时有序比较为 false、`!=` 为 true）。**字面量不进运行期运算**：每个模块一份
  `.rodata` 的 `.double <源码文本>` 常量池（`.Lflt_<n>`），使用点只发一条 `lea`；
  十进制 → double 的舍入由汇编器按 IEEE 完成，`-0.0` 直接得到负零，超出 double 范围的
  字面量由 `Ir.FloatLit` 改写成 `inf`（与 OCaml 的读数一致）。常量与堆上装箱叶子同一形状
  （都是指向 8 字节 double 的指针），消费方不区分来源。
  **函数形参里的 Float 拆箱**：形参槽存 raw `f64` 位（不是指针），来参落位时就地
  `movsd` 解引用一次；循环里不再每轮 `alloc_leaf` 装盒。每个浮点形参**常驻一个 xmm**
  （`xmm8` 起，最多 8 个；树用 0–3、条件用 4/5，生成器与运行时都不碰 8+）：浮点运算读点
  是 `movapd xmm, xmm8`，回边写回是 `movapd xmm8, xmm`，循环里没有「存帧槽再读回」的
  往返。帧槽仍是**权威副本**（每次写回同时写槽），因为 SysV 里 xmm 全是 caller-saved：
  每个 `call` 之前把常驻寄存器溢出到槽、之后重载回来（这段在 `clearDeadSlots` 之前插入，
  所以槽在调用点是活的、不会被当死槽清零）。逃逸点（返回值、实参、字段、运行时调用）
  先 `alloc_leaf` 装盒再当指针用，值从常驻寄存器取。槽仍按指针槽登记，GC 保守扫描
  对它无害（位模式过不了 `gc_try` 的块头校验）。
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
  sub rsp, <frame>      ; frame = align16(8 * (slots + 1))
  mov qword ptr [rbp-8], 0   ; 帧头保留槽（GC 不用；保留布局）
  mov qword ptr [rbp-N], 0   ; 从不写的槽（死存储删掉后的洞），见下
  <body>                ; 结果在 rax
  mov rsp, rbp
  pop rbp
  ret
  ```
- **入口栈**：`_start` 先从初始栈取 `argc` / `argv` / `envp`；程序含真递归（或间接调用）
  时才调 `init_stack` mmap 一块 512 MiB 的私有匿名栈（`MAP_NORESERVE`，按需提交；底部一页
  `PROT_NONE` 作溢出护栏）并切换 `rsp`。深非尾递归因此不依赖进程栈上限
  （`RLIMIT_STACK`，常见 8 MiB），只受自带栈容量约束；`VUNA_NATIVE_STACK_MB` 覆盖容量，
  `0` = 沿用进程栈（[native-runtime.md](native-runtime.md) §1.1）。初始栈保留：argv/envp 字符串仍在那里，`getArgs` /
  `env_lookup` 继续读。
- **帧槽 + 标量槽提升**：binder 和中间值默认都分配 `[rbp - 8*(slot+2)]` 栈槽（`[rbp-8]`
  是帧头保留槽）；临时槽不回收，frame 取该函数的最大使用量，求值顺序因此显式、稳定。
  有回边的函数里最热的标量槽提到 callee-saved 寄存器（§3.7），指针槽留在帧里给保守扫根。
- **死槽清零**（`Native.Live`）：帧会被再次进入的函数（递归 SCC，或函数内有回边）在
  槽的**最后一次读**之后写 0，让已死对象当轮可回收（[native-runtime.md](native-runtime.md) §1.2）；「写了但整函数不读」的槽
  直接删掉。清哪些槽由按基本块的后向活跃性不动点给出，`use`/`def` 取整块并集，
  只会高估活跃性——不动点没收敛时整函数退回不清，漏清最多是多留垃圾。
- **帧洞清零**（`unwrittenSlots`）：死存储删掉后，某些槽整函数从不写；这些洞里的陈旧值
  仍会被保守扫根当指针（深递归 + 分配会把它当成常驻根）。prologue 把这些槽也清 0。
  只对**传递闭包里可能分配**（`allocatingDefNames`）且**帧会再次进入**（`frameReused`）
  的函数发：GC 只在分配点发生，不分配的闭包其帧永远不会被扫到；非递归帧随返回消失。
  名单之外一律按「可能分配」处理，判错方向是多清零，不会漏。
- **栈帧与根**：GC 沿 `rbp` 链逐帧保守扫 `[上一帧 rbp + 16, rbp + 16)`，帧内每个机器字
  都按候选指针判断。不生成逐 call 的栈图，也不按活跃性或运行时 kind 过滤槽：漏一个根会
  收掉仍在用的对象，多扫一个字只多留一点垃圾。调用的动态实参数组（`rt_apply` 慢路径）
  在调用方帧的实参槽里有同一份值，随整帧扫描保活。
- 调用点：按 CBV 从左到右把实参求值到槽；前 6 个装入参数寄存器，其余**逆序压栈**
  （最后一个实参先压，第 7 个最终在 `[rbp+16]`）。栈参数个数为奇数时先 `sub rsp, 8`
  补空洞，保证 `call` 时 `rsp` 16 字节对齐（prologue 的 `push rbp` + 16 倍数 frame 是
  另一处保证）；返回后一次性 `add rsp, 8*k + pad` 回收。
- **闭包**：布局 `[0]`=code、`[8]`=arity（运行时 binder 数）、`[16..]`=捕获值。
  调用时 `rdi` = 闭包自身，实参从 `rsi` 起（`rsi/rdx/rcx/r8/r9`，第 6 个实参起压栈）。
  闭包函数入口先把捕获值拷进本帧槽，再按常规绑定形参。捕获只包含 body 真正引用到的
  binder（含嵌套 lambda 递归可见的那些），按作用域顺序排列；**没有捕获时闭包是只读
  常量** `vuna_static_<lam>_<arity>`（`.rodata` 里的 `[code][arity]`），创建点是 `lea`，
  不进堆、不参与 GC。
- **动态应用**：生成代码不直接 `call [rdi]`，统一走运行时 `rt_apply(闭包, n, 实参数组)`
  （实参数组升序，arg i 在 `[argp+8i]`）：饱和 → `rt_apply_exact` 按闭包 ABI 装寄存器 /
  压栈后调用；不足 → 分配部分应用闭包（`rt_apply_shim` 在真正饱和时把「已捕获 + 收到」
  拼成实参数组）；过多 → 先吃掉前 arity 个实参，再把返回值当闭包继续应用剩余实参。
  顶层函数 / 运行时符号**当值**时生成静态 wrapper（闭包 ABI → 标准 ABI）作为 code，
  arity 取定义参数个数 / `nativeRtValueArity` / `irInlineArity`。
- **调用点去虚拟化**：head 的被调用者能从构造点静态确定时（经 `IrGlobal` / `IrRt` /
  立即 lambda / 部分应用解析，含 let 绑定与跨闭包捕获的传递），饱和调用不再发
  `rt_apply`：已知标准 ABI 目标（顶层函数、运行时叶子）直接 `call`/尾 `jmp`，连闭包值
  都不用构造；已知 arity 的闭包（lambda、CAF lambda、部分应用 shim）直接从槽取闭包
  走闭包 ABI，跳过 `[clo+8]` 的 arity 检查与回退分支。解析不出的 head（函数参数、
  case / 投影字段、未知 binder）仍走上面的统一动态应用。arity 不能从静态类型的箭头数
  推：η-收缩定义当值时 wrapper 的 arity 是定义参数个数，可以小于类型的箭头数。
- 生成代码的普通值位置只使用 caller-saved 寄存器（`rax, rdi, rsi, rdx, rcx, r8-r11`）
  与帧指针 `rbp`；热点循环的标量槽由 `Native.Regs` 提升到 callee-saved
  `rbx/r12-r15`（函数自己的 prologue / epilogue 保存），运行时不用这些寄存器。
- **单出口**：带栈帧的运行时函数体内出现的 `IRet` 由 `Native.Runtime.rtFunc` 统一改写
  成跳到函数尾标签（`mov rsp, rbp; pop rbp; ret`）；只有无栈帧的入口/陷阱（`rtRawFunc`）
  直接写 `ret`。`Native.Module` 的桥接函数同理：体内有 `IRet` 的必须走 `bridgeFnExits`
  （`bridgeFn` 只负责 prologue/epilogue，直接 `ret` 会在 frame 里弹出返回地址）。
  手写分支因此不会「提前 ret 把 rsp 留在 frame 里」，不会崩在返回地址上。
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
  源级 `let` 的立即 lambda 在 native codegen 内联成 `IrLet` 形态（单/多 binder 一致），
  值位置的无捕获 lambda 直接静态化，两者都不再分配闭包；`let`
  循环走普通直调尾跳（或上面的自递归 loop）。仍不回退为尾调用的情况：未被尾位置内联
  消掉的窄调宽、`rt_apply` 慢路径、非尾递归。

- **尾位置内联**：`Native.Inline.inlineTailDefs` 把互递归 SCC 沿定义序单向展开——只在
  尾位置、只把体代进 SCC 的入口成员。`even -> odd` / `narrow -> wide` 被代进来后，回边
  变成自调用，走上面的自递归 loop 与槽提升，不再每轮重建对方帧。
- **延迟 63-bit 归一化**：`Native.Dirty` 对自递归循环的 Int 形参做 may-dirty 不动点；
  循环守卫里的计数器保持 clean，其余参数允许带未归一化值跨迭代。只有**纯标量实参链**
  能带未归一化值求值：`+` / `-` / `*`（mod 2^63）、位运算（逐位）、常量除数 `/`（自己先
  归一化被除数）。实参里出现调用 / 构造 / 投影 / 分支（条件会被 `cmp` 读高位）/ 非常量
  除数时，整条实参照常按归一化值生成；`genArgs` 还在调用与堆字段边界统一清掉 dirty，
  防止标量选码回退到运行时调用时把未归一化值交出去。比较 / 返回在使用点补 `shl/sar`，
  循环结束只归一化一次。
- **有栈实参的槽提升**：prologue 的 callee-saved push 会把来参区整体上移；提升后把
  所有正偏移（栈实参读 / 尾调用来参区写）统一加 `saveBytes`，arity > 6 的循环也能把
  最热的 5 个标量槽放进寄存器；循环体不写 `r10`/`r11` 时再把最多两个槽放进这两个
  caller-saved scratch（它们不在来参寄存器里，函数内有 call/div/syscall 会自动放弃）。
- **稠密 Int 分派**：同一 scrutinee 上连续 4 个以上的 `bi_eq_int` 链改发跳转表
  （`.quad` 表项 + `jmp qword ptr [table + idx*8]`），兜底臂处理越界与缺失 tag。
  产物固定 no-pie 链接，表项可以直接用绝对地址。

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
- GC 沿帧保守扫根（[native-runtime.md](native-runtime.md) §1.2）；handler 帧与续延都在堆上，随栈槽与 cleanup 链可达。

延迟 answer（`opH` 返回函数、`resume` 发生在 `MkHandle` 返回之后）仍不支持，见
[debt.md](debt.md) D101。

### 3.5 高阶参数特化

CPS 之后的整程序 IR 在手里时，`Native.Specialize` 在调用点 `IrApp (IrGlobal g) args`
上做一次参数特化：若 `g` 的某个形参是函数类型、对应实参是**闭合**函数值（顶层函数、
`IrRt` 叶子、或自由变量为空的 `IrLam`），就克隆 `g` 并把该形参的引用替换成这个函数值，
同时把克隆体里**传同一个函数**的自调用改指克隆。于是 `twice f x = f (f x)`、`foldl`
这类循环里的 `f` 变成直调，不再每次按闭包 arity 分派。

- 克隆名 `<原定义>$s<n>`；按（被调名、形参序号、实参指纹）去重，每个定义最多 8 个克隆、
  整程序最多 64 个，超出的调用点保持原样（只丢优化，语义不变）。
- 被特化的形参已替换进克隆体，因此克隆**不再接收**它：克隆 arity 减一，调用点丢掉那个
  实参（它是静态函数值，求值无副作用）。嵌套克隆 `a$s1$s2` 的原定义仍按首个 `$s` 取。
- 带自由变量的 lambda 不特化（搬进被调体会丢捕获）。闭合 lambda 直接内联进克隆体，
  由既有 `genLamApp` 生成直调代码；克隆的递归性与原定义一致，死槽清零（§3）也覆盖克隆。
- 特化只改 IR 定义表，不碰 ABI、运行时或栈帧布局；不特化时产物与之前逐字节相同。

### 3.6 小函数内联

`Native.Inline` 在特化之后做一次调用点内联：被调是**非递归**顶层定义、体是 lambda、
体节点数 ≤ 16、所有实参都可重复求值时，把体按 binder 身份代进调用点，并丢掉体的结果
位置标记（`IrTail` 只对原定义成立）。「可重复求值」= 平凡值（变量 / 字面量 / 运行时
叶子 / 顶层函数），或不分配、不产生效应、不会失败的小标量表达式（加减乘 / 位运算 /
比较 / 非零常量除法）；体内用到两次也只是重算几条指令。整程序上限 400 次。体里带
lambda 的定义不内联：把闭包体拖进调用者既复制代码，也放大调用者的帧（而 GC 阈值跟
栈跨度走）。

内联会留下一批没人引用的定义，所以发生内联后按「体里真正出现的 `IrGlobal`」重算一次
可达性（不跟 `irDefDeps`：那是源码级 term-use 依赖，含已擦除的引用，会把刚内联掉的
被调重新钉住）。没有可内联点时定义表原样返回。

### 3.7 标量槽提升

有回边的函数（尾递归循环 / 普通循环）里，`Native.Regs` 把访问次数最多的标量槽
（`NClsScalar`：`Int` / `Bool`）提到 callee-saved 寄存器（`rbx` / `r12`–`r15`，最多 5 个），
整个函数都不再碰这些槽的内存位置——来参落位、循环回边、尾调用搬运、返回值都跟着走，所以
循环边界上不需要插入拷贝。指针槽必须留在帧里：GC 只扫栈帧，寄存器里的指针会被漏扫。

提升后 `Native.Regs` 再做一次直线段内的寄存器合并：`mov rax, rS; <只操作 rax / 有限
scratch 的链>; mov rD, rax` 直接以 `rD` 为目标（`rS == rD` 时连首条 `mov` 一起删），
`r10/r11` 的中转拷贝只被下一条指令读一次时折掉。两种改写都不跨标签 / 跳转 / 调用；
链改向会丢掉首条 `mov`，所以还要求链之后 `rax` 在同一块内不被先读（块边界视为死，
生成器不在块之间保留 scratch）。

槽提升之后 `Native.Select.cleanup` 先跑一趟复制传播：`mov d, s` 紧跟的那条指令只读 `d`
（不写 `d` 也不写 `s`）、且 `d` 在这条之后到被重写前不再被读时，读点改成 `s` 并删掉搬运。
只对生成器的 scratch（`rax` / `r10` / `r11`）动手——跨块携带的值一律走帧槽，所以
`jmp` / `ret` / 标签处即可当作死；**`jcc` 不算**：跳转表分派
`mov rax, r; cmp rax, k; jcc; lea r11, [table]; jmp [r11+rax*8]` 的索引仍读 `rax`。

接着折纯拷贝：`mov rax, r; cmp rax, k` 直接比较 `r`，
`mov rax, <立即数|槽>; mov rD, rax` 直接写 `rD`。后一种会丢 `rax` 的旧值，所以先按
`raxSafeAfter` 确认后续没有再读它（常数除法的符号修正就是 `add rax, s`）；不满足时保留装载。
同一段还会删 `test r, r`（前一条 `add`/`sub`/逻辑运算已按结果设了标志位），前提是中间
那个标签不是跳转目标（别的路径跳进来时上一条指令没执行过）且 jcc 读的位一致：`add`/`sub`
的 OF 与 `test`（恒 0）不同，只有 `je`/`jne`/`jz`/`jnz`/`js`/`jns` 能复用；逻辑运算清 OF，
有符号条件都可以。

同一趟里还做两类强度削减：`mov d, s; imul d, k`（k ∈ 2/3/5/9）合成一条
`lea d, [s + s*(k-1)]`，紧跟的 `add d, c` 再并进位移——把 3 拍延迟的 `imul` 换成 1 拍的
`lea`，对循环携带的乘法链（`d = d*5+7`）直接缩短关键路径；`and r, 0xFFFF_FFFF` 折成
`mov r32, r32`（写低 32 位并零扩展，`and` 的立即数编码不了 4G-1）。

只提升**循环携带**的槽（循环头的 `live_in`，按「块内先读后写」的精确活跃性算）：
迭代内定义、迭代内用完的临时值留在槽里更好，提升它们只多出两次寄存器搬运，反而加长
关键路径。取访问次数最多的 4 个槽，够用即可；直线函数不动，不为一次调用付 push/pop
的账。**有栈实参的函数（arity > 6）也不提升**：prologue 多压的寄存器会把来参区整体
上移，`[rbp+16]` 不再指向第一个栈实参。

prologue 保存用到的寄存器（奇数个补 8 字节，保持 `call` 前 16 字节对齐），epilogue 与
尾调用（含闭包尾调用 `jmp reg`）在 `pop rbp` 之后恢复。帧大小与槽偏移保持不变，被提升
的槽变成帧洞，按 §3 的洞规则清零。

### 3.8 延时 wrap

`Int` 的 `+ - *` 是 mod 2^63 的运算，同一棵标量表达式树里的中间值不必逐层 wrap：
`acc * 1103515245 + 12345` 只在根位置 wrap 一次。标量树选择把「这棵子树要不要 wrap」
传下去：

- 加减乘的子表达式不 wrap——父算子会保住 mod 2^63 语义；
- `band x m`（`0 ≤ m ≤ max_int`）的操作数不 wrap、结果也不需要 wrap：掩码只保留低位，
  高位怎么绕都不影响结果；
- 其它算子（除法、比较、`bor` / `bxor` / `bnot`）的操作数必须已 wrap：它们看高位。

`band` / `bor` / `bxor` / `bnot` 自身对规范化封闭（§2），所以也不跟 `shl; sar`。

### 3.9 自递归尾调用的实参

自递归尾调用的实参原本逐个求值到中转槽，再统一搬回形参槽。现在若目标形参槽不会被
**后面的实参**读到（按 binder 引用判断），求值完就立即写回形参槽：`loop (f acc n) (n - 1)`
这类热点循环因此少掉每次迭代的两次槽往返。会被后面实参读到的实参仍走中转槽，全部
求值完再统一搬，求值顺序不变。

### 3.10 范围信息

`Native.Range` 在 `Int` 域内做区间上近似（`[-2^62, 2^62-1]`，饱和算术），只用来**证明**
某次 wrap 或符号修正移位是多余的：

- 事实来源只有 `IrIf` 的标量比较（`x < / <= / > / >= / == 常量`）：then / else 各取
  补集并与已有事实求交，常量在左时翻转比较方向。事实只注入被守卫支配的子树；`else`
  分支从**外层**环境派生（不继承 then 的事实），离开分支恢复。
- 消费点两处：
  * `+ - *` 的结果区间可证明落在 `Int` 域内 → 省掉 63-bit wrap。此时值仍然规范化，
    所以对任何消费者（`cmp`、除法、返回值）都安全——和 §3.8 的「上下文消除」不是一回事；
  * 常量除法的被除数非负 → `x / 2^k` 发一条 `shr`，不再走 `sar r,63; and; add; sar`。
  * 常量除法的被除数为负时，wrap 与符号修正融成一条 `lea` + `cmovns`（§3.7）：这条序列
    直接吃**未规范化**的被除数——`shl` 只看低 63 位、`lea` 的进位落在 bit 64 被丢掉，
    所以「bit 63 是垃圾」的 dirty 值也成立，不需要先补一次 `shl 1; sar 1`。
- 「不知道」就是全域；界太大、未知节点、饱和一律退回全域，只会少优化、不会错优化。
  编译器自己的区间算术也用 `satAdd` / `satSub` / `satMul` 夹取（它自身也是 63-bit）。
- 只处理 `IrIf`；`IrNatCase` 的 0 / 后继事实与 `let` 传播等有读数需求时再加。

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
| `IrGlobal` | 支持 | 零参定义是 **CAF**：`_start` 求值一次写进 `.bss` 缓存槽，引用只读槽（`rt_caf_<name>`）；作为函数值传递时生成闭包（wrapper） |
| `IrLet` | 支持（≤1 运行时 binder） | 多运行时 binder（boxed case 降级）拒绝；body 按结果位置生成 |
| `IrApp` | 支持 | 饱和顶层直调；结果位置且来参区够用时走尾调用（§3）。零参别名（`Nat.plus = natAdd` 这类 η-收缩定义）沿 `IrRt` / `IrGlobal` 链解析到目标后直调（标量叶子内联）；**构造点已知**的 head（let 绑定、跨捕获传递、部分应用）饱和时直调或走已知 arity 的闭包调用，不发 `rt_apply`；部分 / 过度应用与解析不出的动态 head 仍走 `rt_apply` |
| `IrIf` | 支持 | 条件按 0/1 判 |
| `IrRtApp` | 支持白名单 | 参数左→右；`&&`/`||` 短路 |
| `IrConcatMany` | 支持 | 左→右两两 `++`（Lowering 对 ≥3 项的 `++` 链发此节点） |
| `IrNatCase` | 支持 | `if sc == 0 then zero else succ`；succ binder = `sc-1`，catch binder = `sc` |
| `IrLam` | 支持 | 作为值 → 闭包对象 `[code][arity][自由变量...]`（无自由变量时静态化，不分配）；立即应用的 lambda 内联成体；其余应用按调用点已知 arity 直调或走 `rt_apply` |
| `IrCtor` / `IrRecord` / `IrProj` / `IrRecUpd` / `IrCase` | 支持 | 对象头 + 字段；[native-runtime.md](native-runtime.md) §5 的「对象表示」 |
| `IrEffThunk` | 支持 | 生成 `MkEff (fun _ => prim args)`；效应原语作为值出现时用 |
| `IrEffBind` | 拒绝 | 只服务 `@vuna@prim_eff_bind1`，base 不用 |
| `IrRt` | 支持白名单值形态 | `@ir@natSucc`（调用 head）与入口 show 由 Module 特化；作为值同样生成 wrapper 闭包 |
| Float | 支持 | 堆对象 `[f64]`；字面量是 `.rodata` 的 `.double` 常量（`lea`）；比较按 OCaml 语义；展示走 `Base.Data.Float.floatRender` |
| Effect handler | 支持 | `perform` / `handle` 的一次性续延；§3.4 |
| extern / 其余宿主原语 | 拒绝 | `native target: ... not supported yet` |
| 多线程原语 | 拒绝 | `prim_eff_thread*` / `mutex*` / `condvar*` / `atomic*` 登记在 `packages/target-native/test/RuntimeTable.vuna` 的 `runtimeGaps`；线程运行时见 [debt.md](debt.md) D135 |

- 白名单（`Native.Runtime.nativeRtTarget`）：`+ - * /`、六种位运算（`bitAnd` / `bitOr` /
  `bitXor` / `bitNot` / `bitShl` / `bitShr`）、`++`、`bi_eq_int` /
  `bi_neq_int` / `bi_lt_int` / `bi_le_int` / `bi_gt_int` / `bi_ge_int`、
  `bi_eq_str` / `bi_neq_str` / `bi_lt_str` / `bi_le_str` / `bi_gt_str` / `bi_ge_str`、
  `bi_lt_bool` / `bi_le_bool` / `bi_gt_bool` / `bi_ge_bool`、
  `strFromInt` / `strLength` / `strAt` / `strSubstring` /
  `strHash` / `strShow`、`natAdd` / `natSub` / `natMul` / `natDiv` / `natToInt` /
  `natFromInt`、`assert` / `todo` / `prim_fail`、`@vuna@log@on` / `@vuna@log@emit`（恒 `False` / `0`）、
  可观测性叶子桩。其余 `IrRtApp` 符号拒绝。
- **两种调用形态**都要覆盖：内建饱和应用走 `IrRtApp sym args`（`irInlineArity`）；
  `strAt` / `strSubstring` / `assert` / `todo` / `prim_fail` 这类**多参函数值**在 IR 里是
  `IrApp (IrRt sym) args`（`irInlineArity = 0`），由
  `Native.Runtime.nativeRtValueArity` 给出 arity；饱和直调，部分/过度应用与作为值都
  生成 wrapper 闭包。
- 位运算是 `IrRtApp`（`irInlineArity` 用内建名 `bitAnd`…，与 `+` 同一形态决策）；63-bit
  语义与 `Target.Ocaml.Term.bi_bit*` 一致（`bitShr` 是保留 bit 62 的逻辑右移）。
- 运行时错误报告统一为 `vuna: runtime error: <msg>\n`（stderr，exit 2），与 OCaml
  报告器 `dt_report_exn` 的第一行一致；`assert` / `todo` 分别加 `assertion failed: ` /
  `TODO: ` 前缀。
- List 桥接符号（`strUnpack` / `strPack` / `strConcatMany` / `strSubstTemplate`）支持：
  函数体在 `Native.Module` 按 List 族的 tag 生成，复用对象表示（`head` 是未装箱 Int；
  两遍扫描：先算长度，再分配填充）。
- **指令选择**（`Native.Select`）：白名单里无分配、无 GC 的标量叶子在调用点展开成寄存器
  序列，不走 `call rt_*`：`+ - *`、`bitAnd` / `bitOr` / `bitXor` / `bitNot`、
  `bi_*_int` / `bi_*_bool`、`natAdd` / `natSub` / `natFromInt` / `natToInt` 与
  调试 / 可观测性零参桩。符号词表只有一份（`scalarPlanOf`），`RuntimeTable` 单测校验
  它与 `nativeRtTarget` 指向同一实现。
  - 63-bit wrap 仍是 `shl 1 / sar 1`；Nat 饱和 / 夹取用 `cmov`；比较结果固定在 `rax`
    （先 `xor rax, rax` 清零再 `cmp` + `setcc`，省掉 `movzx`，也切断 `setcc al` 对上一轮
    `rax` 的部分寄存器依赖）。除零、移位计数越界与 `natDiv` 仍走运行时；`natMul` 用
    `imul` + `cmov`（64-bit 溢出与 63-bit max 两级夹取）内联。
  - **除以编译期常量**（`Select.divPlanOf`）在调用点展开：`d` 是 2 的幂时用符号修正
    移位——非负被除数是单条 `shr`；可能为负时把 63-bit wrap 和移位融成
    `lea d, [x+x+2^(k+1)-2]` + `shl x, 1` + `cmovns` + `sar k+1`：`wrap(x) = (x<<1)>>1`，
    `shl` 之后的符号位就是 63-bit 值的符号，`w ≥ 0` 取 `2x`、`w < 0` 取 `2x + 2^(k+1) - 2`
    再右移 `k+1`，正好是向零截断的 `w / 2^k`。两条指令就把 wrap 与符号修正都收掉，
    关键路径从 6 拍降到 4 拍（被除数可以是未规范化的值，见 §3.10）；
    其余常量走 magic 乘法（`ceil(2^64/d)`，
    `imul` 取 64-bit 高半后按余数修正符号），不再 `cqo` + `idiv`。`d = 3`（magic 超出
    63-bit）、负常量与 `d = 0` / `-1` 仍走 `idiv` / `rt_div`——除零 trap 与
    `min_int / -1` 的语义留在运行时。需要 `rax` 的形状会被挑到「实参顺序」上：
    第二个实参要 `rax` 时，第一个实参先拿非 `rax` 的寄存器。
  - **零参运行时别名**（`Alias.irAliasTargetOf` + `Module.resolveDefAliases`）：
    `Nat.plus = natAdd` / `Nat.mult = natMul` / `Nat.toInt = natToInt` 这类定义在应用位置
    直接改写成 `IrRtApp`，参数顺序不变；标量树因此能看到运行时叶子，嵌套在实参里的
    `Nat.mult` / `Nat.fromIntClamp` 也能继续内联。
  - **条件直发分支**（`Select.branchInverse`）：`IrIf` 的条件是标量比较时，直接发
    `cmp` + 反向 `jcc`，不再物化 0/1 再 `test`；比较的左侧可以是任意可内联的标量树，
    右侧是字面量或槽变量。
  - **自递归循环体旋转**（`Module.genLoopBody`）：`if cond then exit else self-call`
    的体放到条件检查之前，入口跳检查，回边就是条件分支本身——每轮省掉末尾的
    无条件 `jmp`；条件推导的区间事实仍分别作用于体 / 退出两侧。
  - **Bool 槽选择**（`Module.boolSelectModeOf`）：`if b then 1 else 0` 就是 `b`
    （Bool 表示即 0/1），`if b then 0 else 1` 只发一条 `xor 1`；值位置与标量实参都
    不再发 `test` + 两次 `mov` 的分支。
  - **浮点比较**（`Select.floatCompareInstrs`）：操作数是原子（槽 / 浮点字面量）时，
    直接装进 `xmm` 并用 `ucomisd` + `setnp` / `setcc` 物化 0/1；NaN 语义与运行时模板
    一致（有序比较在 PF 时取 false，`!=` 在 NaN 时取 true）。`IrIf` 条件与值位置都
    不再 `call rt_float_lt`，也不装箱；非原子实参回退运行时。
  - **字符串叶子内联**：`strLength` 变成一次 `mov rax, [s]`；`strAt` 展开成
    「长度头比较 + `movzx` 一个字节」，越界（`i < 0` 或 `i >= len`）走冷分支返回 -1
    （与 `rt_str_at` 同义）。实参不是原子（槽变量 / 字面量）时整棵回退运行时调用。
  - **浮点表达式树**（`Module.floatTree`）：一棵只由「槽里的 Float（装箱叶子指针，
    拆箱形参的 raw 位，或常驻形参的 `xmm8+`）/ 浮点字面量 / `floatFromInt` 的整数原子 /
    `sqrt` / `abs` /
    `bi_*_float` / `if <浮点比较> then <浮点原子> else <浮点原子>`」组成的树整棵在
    `xmm0..3` 上算完，**只有根装盒一次**（装盒放在树计算之前：`alloc_leaf` 可能触发 GC，
    此时实参指针还只在槽里；之后树内没有 `call`，`xmm` 与装盒对象都不需要是根）。
    右操作数是字面量时直接发内存操作数（`mulsd xmm1, qword ptr [rip + .Lflt_n]`），
    不再单独 `movsd` 装填。条件选择分两种形态：

    * **两支都是字面量** → 掩码选择：`cmpltsd` / `cmplesd` / `cmpgtsd` / `cmpgesd` /
      `cmpneqsd` 给出「条件成立」的全 1 掩码（`then` 是 `+0.0` 时改用反向谓词
      `cmpn…sd` 选 `else`），再用一条 `andpd` 与常量取交集——`else` 为 `+0.0` 时这正是
      `cond ? t : 0.0`。临界路径只有 `movapd` + `cmp` + `andpd`，`float_math` 里那段
      0/1 选择从 14 条降到 4 条。两侧都不是零时补 `andpd` + `andnpd` + `orpd`。
      NaN 参与时有序谓词为假（取 `else`），与 IEEE 一致。
    * **一般原子** → `cmov` 选分支指针后再 `movsd`，没有分支与调用：一般原子要
      `andpd`/`andnpd`/`orpd` 三条按位指令才拼得出 `(m & t) | (~m & e)`，把树的标量运算
      挤到已经饱和的 FP 端口上（实测慢 25–40%），而 `cmov` + 指针解引用走整数 / 访存
      端口，能和 `sqrt`/`divsd` 并行。另外按位那一侧只用 `andpd`：`andnpd` 在 Zen 4 上
      明显更慢（同一循环 4.7ms vs 3.0ms），所以能换反向谓词的都换。

    `sqrt` /
    `abs` / `intToFloat` 是 η-收缩的零参别名，调用点上先解析到运行时叶子。`abs` 的操作数
    是 `intToFloat e` 且 `e` 的区间下界 ≥ 0（守卫推出）时，`abs` 是恒等，整条省掉——
    `sqrt (abs (intToFloat n))` 只剩一次 `cvtsi2sd`。外形超出这几类
    （调用结果、记录字段、高阶）整棵回退到逐运算的运行时调用。
  - 实参只接受**原子标量**（字面量、槽变量、标量 cast）；任何非标量子树整体回退
    `call rt_*`，不重排求值。寄存器池是 `rax` / `r11` / `r10` / `r8` / `r9`；序列内
    没有 `call`，因此不产生新的 GC 点。
  - 生成的函数体在 annotation 之前跑 `Native.Select.peephole`：写槽后立刻读回、
    `jmp` 到下一条标签、scratch 立即数只被下一条二元 / 比较消费时合并；窥孔不改槽编号
    与帧大小（GC 逐帧保守扫根，不依赖逐 call 的栈图）。手写运行时 / 桥接体不参与窥孔。
- **零参顶层定义**是 CAF：`_start` 按 SCC 序（被依赖者在前）求值一次，结果写进连续的
  `.bss` 缓存槽 `rt_caf_<name>`；引用只读槽。槽区间 `[rt_caf_begin, rt_caf_end)` 由 GC
  当根扫描（GC 非移动，值一次写入后稳定）。零参定义仍必须是纯值：程序启动即求值，
  带副作用的值要走 `Eff` 动作。body 是 `IrRt` / `IrGlobal` 的零参别名在调用点直接解析
  到目标（不进 `rt_apply`）；CAF 槽仍按启动序求值一次，作用只剩「函数值」引用。
- 入口 `main` 必须是零参值；`main : Eff r a` 支持：入口先按 `irEntryHandlersOf` 预装宿主
  handler（`runConsoleHost` / `runExitHost` / …），再用 `runMain` 执行，最后按 `a` 展示。
  入口 show 只接受 `@ir@showInt` /
  `@ir@showNat` / `@ir@showBool` / `@ir@showStr` / `@ir@showFloat`；其它自定义 Show 拒绝。
  `--no-print` 不打印，但仍计算并 exit 0。

运行时符号、资源限制（栈 / 内存 / 核数 / 超时）、GC、模块布局与确定性、验证、已知边界与
相关阅读见 [native-runtime.md](native-runtime.md)。
