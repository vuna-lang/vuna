# native 运行时（符号 / GC / 边界）

本页是 [native.md](native.md) 的另一半：那里讲产物与工具链、平台与值表示、ABI 与栈帧、
IR 支持面；这里讲生成物**跑起来**依赖的那一层——运行时符号与资源限制（§1）、模块布局与
确定性（§2）、验证（§3）、已知边界（§4）、对象表示与 List 桥接（§5）、相关阅读与插件
形态（§6 / §7）。

## 1. 运行时符号

`Native.Runtime` 按 `Ir.Runtime` 契约的**符号名**实现子集；语义参考实现是
`Vuna.Target.Ocaml.Term` 的 `bi_*` / `dt_show_*` / `dtp_*` 模板，不重新定义语义：

- `Int`：`add/sub/mul/div`（63-bit wrap；除零 trap）；`bit_and/bit_or/bit_xor/bit_not/
  bit_shl/bit_shr`（63-bit 语义；移位计数 `n < 0 || n >= 63` → 0，`bit_shr` 保留 bit 62）；比较返回 0/1。
- `Nat`：饱和加法/乘法、下溢到 0 的减法、除零 trap、`natToInt` / `natFromInt` / `natSucc`。
- `String`：`str_alloc`（bump 分配，含长度头）、`str_concat`、`str_eq` / `str_neq`
  （先比长度，再走 `bytes_eq`：8 字节字比较 + 字节尾部）、`str_compare`（公共前缀按 `min(len)`
  走 `bytes_cmp`，相同再比长度；不能按较长串的长度读短串块外）、`str_length`、`str_at`（越界 -1，与 `dtp_strAt` 一致）、
  `str_substring`（`start`/`len` 夹取到 `[0, n]`，与 `dtp_substring` 一致）、
  `str_hash`（`((h*33)+c) land 1023`，与 `dtp_strHash` 一致）、`str_from_int`（含负号）、
  `show_str`（引号 + `\"` `\\` `\n` `\t` `\r` 转义，与 `dt_show_string` 一致）。
- 调试/失败：`debug_on`（恒 0 = 关闭）、`debug_line`（1 参返回 0）、`assert`（成功返回
  value，失败走 `trap_assert`）、`prim_fail` / `todo`、`trap_msg` / `trap_assert` /
  `trap_todo`。失败路径**不分配**：前缀是 `.rodata` 裸文本，msg 是带长度头的字符串，
  逐段 `write` 到 stderr 后 exit 2。
- 入口打印：`print_int` / `print_bool` / `print_str`（栈上 itoa / 原样字节 + 换行）。
- 对象与分配：`alloc`（`rdi` = payload 字节数 → `rax` = 对象地址；尺寸类空闲链 → bump →
  新段，越界 trap OOM）；`alloc_leaf`（字符串 / Float）在块头上打 `leaf` 标志。变体对象
  `[0]`=tag、`[8]` 起字段；record 对象 `[0]` 起就是字段；字段按最大 arity 补齐（补 0）。
  `trap_impossible` 是 case 无匹配臂时的兜底 trap（与 OCaml 的 `DT: impossible branch` 同义）。
- 效应叶子：`@vuna@prim_mrefNew` / `@vuna@prim_mrefRead` / `@vuna@prim_mrefWrite`
  （`@vuna@Cell`，单槽对象；运行时 `mref_new` / `mref_read` / `mref_write`）、
  `@vuna@prim_eff_print` / `_eprint`（写 fd 后返回字节数）、`@vuna@prim_eff_exit`；预装宿主 handler
  用到的 `@vuna@host@*` / `@vuna@prim_eff_*_host` 名字映射到同一批叶子。
- 进程入参与环境：`_start` 从初始栈拷 `argc` / `argv` / `envp` 到 `.bss`；`@vuna@prim_eff_getArgs`
  （List 桥接，不含 `argv[0]`）、`@vuna@host@getenv`（扫 `envp` 的 `KEY=`）、`@vuna@host@getcwd`（syscall 79）、
  `@vuna@host@execPath`（`readlink /proc/self/exe`，syscall 89）失败时返回空串 / `"."`。
- 时钟与 tty：`effTimeUs`（`clock_gettime`，syscall 228）、`@vuna@prim_eff_sleep`（`nanosleep`，
  syscall 35）、`@vuna@host@isTty`（`ioctl(1, TCGETS)`，stdout，与 OCaml 侧一致）、
  `@vuna@prim_eff_hostStatus`（读 线程 TCB 的宿主状态槽；fs / process 的 `try*` 后续写入）。
- 文件系统：15 个 `@vuna@host@*` 叶子（`tryReadFile` / `tryReadFileRange` / `tryWriteFile` / `tryWriteFileAtomic` /
  `tryReadDir` / `tryIsDirectory` / `tryMakeDir` / `tryMakeDirExclusive` / `tryRemoveFile` /
  `tryRemoveTree` / `tryRename` / `trySymlink` / `fileExists` / `fileMtime` / `fileSize`）
  走 `openat` / `read` / `write` / `lseek` / `fstat` / `getdents64` / `mkdirat` / `unlinkat` /
  `rmdir` / `rename` / `symlinkat`；`tryReadFileRange` 用 `openat` + `lseek(SEEK_SET)` + 定长
  `read` 循环，单次 `length` 截到 8 MiB 读缓冲上界；失败写 线程 TCB 的宿主状态槽（errno → 码表与 `dtp_hostCode` 一致：
  ENOENT=1、EACCES/EPERM=2、ENOSPC=3、ENOTDIR=4、EISDIR=5、EEXIST=6、其它=9）。
  `tryReadDir` 返回**字典序** `List String`；`tryRemoveTree` 递归删除时每层用自己的
  8 KiB `getdents64` 缓冲，并在分配帧后检查栈下界（`rt_stack_top - 4 MiB`）——越界 trap
  `directory tree too deep` 而不是 SIGSEGV；
  路径拷贝按容量上界检查，超出 trap `path too long`；`tryWriteFileAtomic` 写
  `<path>.<pid>.tmp` 再 `rename`。
- **失败面只有 try 家族**：契约里没有 strict 非 try 叶子——`@vuna@prim_eff_readFile` /
  `readFileRange` / `writeFile` / `writeFileAtomic` / `readDir` / `isDirectory` / `makeDir` /
  `removeFile` 这组名字（连同它们的 `@vuna@host@*` 形式）已删除，源码也没有入口。`try_*` 叶子
  跑同一批 syscall，失败时把 errno 映射成状态码写进 线程 TCB 的宿主状态槽并返回默认值（原始 errno
  另记在 `rt_host_errno`）；库层 `Base.Effect.Fs` 读 `@vuna@prim_eff_hostStatus`，把失败收成
  typed `FsError`，entry 打印 `vuna: fs: <op> …` 并以退出码 1 结束。
- 进程：`@vuna@prim_eff_runIn` / `@vuna@host@tryRunIn`（`chdir` + `fork` + `execve("/bin/sh", ["-c", cmd])` + `wait4`
  + 恢复 cwd；实参按 shell 单引号转义）、`@vuna@prim_eff_spawn`（`fork` + `execve("/proc/self/exe", argv)`，
  argv[0] 是本进程路径）、`@vuna@prim_eff_wait`（`wait4` 取退出码，被信号杀死按 1）、`@vuna@host@exitOp`。
- 未实现的宿主面：stdin 的 `@vuna@host@readLine` / `readBytes`（编译器闭包不可达）与 net。
- 续延：`perform` / `handle` 由库机器（`Base.Effect.Core` 的 `Control` 循环）执行，见
  [native.md](native.md) §3.4；宿主原语（`@vuna@prim_eff_*` / `@vuna@host@*`）的实现面以 `Native.Runtime` 的符号映射为准，未列出的符号由
  `RuntimeTable` 测试登记为缺口。
- 浮点：`float_from_int` / `int_from_float`（截断）/ `float_abs` / `float_sqrt`、
  `float_add/sub/mul/div`、`float_eq/neq/lt/le/gt/ge`；展示不是运行时符号，
  走 `Base.Data.Float.floatRender`（Vuna 实现，三端共用）。浮点**字面量**不进运行期运算：
  每个模块一份 `.rodata` 的 `.double <源码文本>` 常量池（与 wasm 的 `f64.const` 同一判据，
  见 `Ir.FloatLit`），使用点是 `lea`（[native.md](native.md) §2）。
- 数组：`array_length` / `array_get` / `array_set`（COW）/ `array_make`，以及
  `array_from_list` / `array_to_list`（走 canonical `List` 族，与 List 桥接同一批生成）。
- 只读数据：`True` / `False` / 换行 / 除零信息 / OOM 信息 / 错误报告前缀（`vuna: runtime
  error: `、`assertion failed: `、`TODO: `、`vuna: runtime error: impossible branch`）；由
  `Native.Runtime.nativeRodata` 提供。字符串 / 浮点字面量由 `Native.Module` 按模块收集成
  `NativeStrLit`（`npModuleLits`）/ `NativeFloatLit`（`npModuleFloats`）。
- 契约一致性：`irInlineArity` 声明的 arity 与未实现符号清理由
  `packages/target-native/test/RuntimeTable.vuna` 冻结（CI 的 `vuna test` 会跑）；关闭缺口
  时同步删掉登记项，否则测试报「listed as a gap but implemented」。

### 1.1 资源限制（栈 / 内存 / 核数 / 超时）

`_start` 在 `vuna_main` 之前按程序用到的子系统发初始化调用；配置全部来自 env，
**不进 codegen**（同一 IR 的产物逐字节确定）。判定只看已发射的指令：

| 初始化 | 何时发 |
| --- | --- |
| `init_stack`（自带栈） | 可达函数图里有**真递归**（`call` 边上的环）或间接调用/跳转（闭包调用、续延恢复）。尾调用是 `jmp`，不涨栈，不触发 |
| 堆起点 + `init_mem` + `init_gc` | 可达代码引用 `alloc` / `alloc_leaf`，或直接读写堆指针（内联 bump） |
| `init_cpus` | 可达代码引用子进程原语（`spawn` / `runIn` / `wait`）；子进程继承亲和性 |
| `init_timeout` | 总是发：`VUNA_NATIVE_TIMEOUT_MS` 对任何程序都成立 |

未用到的运行时函数同样不进产物（从 `_start` 做标签可达性裁剪）：纯算术程序的
`runtime.s` 只剩入口用到的打印 / 退出叶子，`text` 段约 2 KiB。因此
`VUNA_NATIVE_STACK_MB` 与 `VUNA_NATIVE_CPUS` 只在对应初始化发出时生效——不含递归 /
间接调用的程序沿用进程栈（`RLIMIT_STACK` 决定），不含子进程原语的程序不设亲和性。
解析失败一律回落缺省，不阻断启动。

| env | 缺省 | 语义 |
| --- | --- | --- |
| `VUNA_NATIVE_STACK_MB` | `512` | 自带栈容量（MiB）：启动时 mmap 的私有匿名区，与进程栈的 `RLIMIT_STACK` 无关；`MAP_NORESERVE`，RSS 只随实际递归深度增长。`0` = 不切换、沿用进程栈；mmap 失败也回落进程栈 |
| `VUNA_NATIVE_MEM_LIMIT` | 自动：`max(1 GiB, 2 × live + 256 MiB)`，每次回收后按 live 抬高 | **live 堆**上限：分配的预留超过它时先做一次整堆回收，GC 后 `live + 本次` 仍超限才 `memory limit exceeded` + exit 2。缺省只升不降——固定的 1 GiB 在 live 见顶后会让每次分配都触发一次整堆回收（死锁）；显式设置时是硬上限，`0` = 不限 |
| `VUNA_NATIVE_GC_MIN` | `1048576`（1 MiB） | 回收阈值的下限（也是新堆段的最小尺寸）：年轻代回收后阈值 = `max(GC_MIN, live/8, 上次扫到的栈字节数)`，整堆回收后 = `max(GC_MIN, 2 × live, 上次扫到的栈字节数)` |
| `VUNA_NATIVE_GC_LOG` | 关 | 存在即向 stderr 打诊断行 `gc n=<次数> live=<字节> alloc=<自上次 GC 起的分配字节> cards=<本次扫过的脏卡片数> gen=<minor 或 full>` |
| `VUNA_NATIVE_GC_STRESS` | 关 | 存在即每次分配前都做一次回收（年轻代 / 整堆按计数轮换；抓漏根与漏屏障的调试开关，不是运行模式） |
| `VUNA_NATIVE_CPUS` | `auto` | `auto` = min(`sched_getaffinity` 计数, cgroup v2 `cpu.max` 的 `ceil(quota/period)`)，下限 1；`N` = 取前 N 个可用核；`0` = 不动亲和性；只缩小不放大 |
| `VUNA_NATIVE_TIMEOUT_MS` | 不限 | wall-clock 总超时；`setitimer(ITIMER_REAL)` + SIGALRM（`SA_RESTORER` + `rt_sigreturn` 桩）；到点先收掉在跑的子进程组，再写 `vuna: runtime error: timeout exceeded` + exit 2；`0` = 不限 |

- 预算检查在 `alloc` 里分配之前（`live + 已分配 + 本次 > limit` → 先强制整堆回收；GC 后仍超才 trap）；
  `live` 由清扫阶段累计（见 §1.2）。
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

### 1.2 GC（两代、逐帧保守扫根，非移动）

实现在 `Native.Gc`，由 `Native.Runtime.alloc` 在预算或阈值处调用 `rt_gc_collect`。

- **块头**：8 字节 `[size | flags]` 放在 payload 之前；`size` 16 对齐，低 4 位是
  `mark` / `free` / `leaf` / `old`。对象指针 = 块头 + 8，因此 payload 布局
  （`[0]=len/tag`、`[8]=字段`）不变。新分配（含复用空闲块）的块不带 `old`，
  晋升或整堆回收存活时置位。
- **段**：段头 48 字节 `[next][end][bump][kind][cards]`，块区从段头之后开始；`rt_segs`
  串起全部段，`rt_cur_seg` 是当前 bump 段。`cards` 是本段的卡片表（每 512 字节堆区一格，
  字节置 1 = 脏）：初始段用 `.bss` 里的静态表，新段在 `alloc` 里随段一起 `mmap`。
  清扫按段线性走块头（空闲块保留自己的块头）。
- **尺寸类**：块大小向上取整到 2 的幂（16 B … 64 MiB），清扫把死块挂回对应类的链表，
  分配先弹表再 bump。大于 64 MiB 的块单独占一个段，死块进 `rt_huge_free` 首次适配链。
- **根集**：
  1. **栈帧**：沿 `rbp` 链逐帧扫 `[上一帧 rbp + 16, rbp + 16)`，帧内每个机器字都按
     候选指针保守判断；入口 `rbp = 0` 终止。GC 自己的帧也按整帧扫，入口先把通用寄存器
     （含 `r15`）溢进自己的帧。
  2. `.bss`：cleanup 链头 `rt_cleanups` 与 CAF 求值区 `[rt_caf_begin, rt_caf_end)`。
  3. **线程模式**（程序用了线程原语，`rt_threaded = 1`）：根集改为 STW——置 `rt_gc_requested`
     等全部 live 线程在 safepoint / `block_begin` 停车，扫本线程 `[rsp, stack_top)`，再按线程表
     逐个扫未结束线程的 `[saved_rsp, stack_top)`（见 [primitives.md](primitives.md) §6.2）。
  handler 帧与续延是 `Base.Effect.Core` 的普通堆对象，随上面的根可达。
  寄存器不是根：跨调用的活值都在调用方的栈槽里（`alloc` 也按同一约定，不保存调用方
  的 caller-saved 寄存器）。
- **候选判据**：字必须指向某个已注册堆段内、块头 16 对齐且合法、非空闲的 payload 起点
  （块头 + 8）。`Int` / 字节型偶然形似指针只会多留对象（非移动，不会失效）；`.rodata`
  字面量不进堆，天然忽略。帧内**已死**的槽本来也会被当成根；`Native.Live` 在槽的最后
  一次读之后写 0（只对递归 / 带回边的函数），所以 `gc_low_live` 这类「每帧分配后立即
  丢弃」的形状不再把死对象钉到帧返回（[native.md](native.md) §3）。注意扫描跨度是**从 `rsp` 到最外层 `rbp`**：
  已经返回的帧内存仍可能在跨度内，所以「这个函数后面没有 call 了」不能作为省略清零的
  理由（实测省掉会让 `gc_array_churn` 的 RSS 从 3.0 MiB 涨回 300 MiB）。从不写的槽
  （帧洞）同样会被扫到，见 [native.md](native.md) §3 的帧洞清零。`rt_apply` 慢路径的实参是例外：那批实参的
  根就是调用方槽，含这类调用的基本块整块不清。
- **段索引**：`gc_try` 对每个候选字都要定位所在段，线性走 `rt_segs` 的代价是每字一次
  链表遍历（大堆上是缓存缺失的主要来源），所以段按块区起点排成有序数组 `rt_seg_idx`
  （每项 `{start, seg}` 16 字节），`rt_seg_find` 二分查找 O(log n)。`alloc` 每次建段
  （bump 扩容 / 超大块）调用 `rt_seg_index_add` 插入；`_start` 建好初始段后调
  `rt_seg_index_init` 重建。写屏障定位段走同一个函数。
- **不扫的块**：`leaf`（String / Float，payload 是字节或位型）。
- **两代**：
  - **年轻代回收**（minor）：`gc_try` 只接受不带 `old` 的块，所以只沿根集标记年轻代
    对象；`gc_sweep` 跳过老代块，把带 mark 的年轻代块晋升（置 `old`、保留 `leaf`、
    清 mark），未标记的按尺寸类回收。
  - **整堆回收**（full）：标记全部（含老代），清扫全部，存活的也晋升。
  - 触发：默认每 `gcMinorRunsLimit`（8）次年轻代回收做一次整堆；分配预算压线、或
    年轻代晋升量超过阈值一半时，下一次直接整堆。缺省的分配预算随 live 抬高
    （`max(1 GiB, 2 × live + 256 MiB)`，见 §1.1 的 env 表）。晋升压力触发的整堆在高存活率
    负载上会让大部分回收都是整堆：它重扫整个存活集，但能把「晋升后很快死掉」的对象
    清出 live——否则这部分一直计入 live，而年轻代阈值是 `live/8`，后续每次回收都会被
    一起放大。
  - 阈值：年轻代回收后 `max(GC_MIN, live/8, 栈跨度)`；整堆回收后
    `max(GC_MIN, 2 × live, 栈跨度)`（`live` 含老代；栈跨度 = `rt_stack_top - rsp`，
    是孤岛扫栈成本的上界，深递归按它摊还）。非移动、不压缩。
- **写屏障与卡片**：年轻代回收不扫老代，所以「老代对象字段指向年轻代对象」的引用必须
  单独记录。`rt_write_barrier`（`rdi` = 被写对象）在老代对象被写时，找到它所在的段、
  把 `[对象 - 块区起点] >> 9` 那一格卡片置脏（按段 `mmap` 的字节表，写 1 是幂等的）。
  年轻代回收在扫完普通根之后逐段遍历卡片表：脏卡片清 0，并把该卡片覆盖的 512 字节
  `[起点, 起点 + 512) ∩ [块区, 段尾)` 当额外根保守扫一遍。卡片按段分配、容量随段走，
  所以没有固定容量上限；死块/复用块留下的陈旧脏位只会多扫一格，不会漏根。
  可变点只有 `@vuna@prim_mrefWrite`（运行时 `mref_write`）与 `insert_sorted` / `sort_list` 的原地改接；
  构造器 / 闭包字段只在对象刚分配（年轻代）时写，数组是 COW、record 不可变，都不需要
  屏障。
- **动态实参**：`rt_apply` 慢路径把实参压成调用栈数组交给运行时；数组本身不在任何帧的
  槽位里，但同一批值在调用方的实参槽里各有一份，整帧保守扫会把它们留住。
- **标记栈**：首次 GC 时 `mmap` 1 MiB，溢出翻倍并拷贝；GC 内部只用 `mmap`，不走 `alloc`。

**可观测性**（规范见 [observability.md](observability.md)）：`@vuna@obs@level` /
`log` / `counter` / `mark` / `sampleStart` / `sampleStop` 是 **no-op 桩**（返回 `Int 0`）；
高阶的 `@vuna@obs@span` / `spanLab` 调 thunk（闭包，实参 `0`）后原样返回结果，不写事件。
因此 native 产物上 `VUNA_OBS` 不生效。

## 2. 模块布局与确定性

- `Native.Model`：寄存器/操作数/指令/函数/程序 + `NativeErr`；`OpMemX`
  （`[base+index]` 字节访问）、`OpRip`、字节读写、32 位/`lock cmpxchg`/`xchg` 原子指令、
  `rep movsb` / `repe cmpsb`、`NativeStrLit` / `NativeBss`。
- `Native.Abi`：参数寄存器、栈槽偏移、frame 对齐、字符串头大小、堆大小与标签、
  prologue/epilogue、稳定命名（函数 / 运行时 / 字面量 / 内部 label / 数据标签）。
- `Native.Pal`：**平台面**——x86-64 Linux syscall 号、syscall 参数常量（`AT_FDCWD`、
  `O_*`、权限位、`AT_SYMLINK_NOFOLLOW`、`TCGETS`）、内核结构布局（`stat` 字段偏移、
  `PATH_MAX`、`cpu_set_t` / `timespec` / `termios`）、errno 码表。与 `Abi` 的分界：
  Abi 是架构（换架构要改），Pal 是内核接口（换内核 ABI 只改这里）。
- `Native.Gc`：两代标记-清扫 GC——块头判据、段索引（二分定位）、根集扫描（逐帧保守 /
  脏卡片）、写屏障与卡片表、年轻代 / 整堆回收的决定、标记栈（倍增 mmap）、
  清扫与尺寸类回收、`GC_LOG` 诊断行；`alloc` 在预算/阈值处调 `rt_gc_collect`。
  子线程存活（`rt_thread_count > 0`）时回收直接返回（并行区只增长）。
- `Native.Runtime`：`rt_*` 汇编模板、只读数据、`.bss` 布局、IR 符号 → 运行时标签白名单
  与值形态 arity；线程/同步原语（`clone` + futex）也在这里。
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

依赖方向：IR 是独立包 `vuna-ir`（`Native.*` 跨包 import 它），`packages/compiler/vuna.toml` 的 `[layers]` 不再约束 Native：`Target.Native.*` 不得 import
`Core` / `Elab` / `Intrinsics` / `Target.Wasm` / `Target.Ocaml`。`checks.ir-boundary` 保留形状与正向断言
（`Native.Module` 必须 import `Ir`）。

## 3. 验证

- `packages/compiler/test/steps/105*_native_*.steps`（`steps_native`，e2e）：按主题拆成六个 case——
  `105a_native_shape`（产物形状 / label / 确定性 / trap 文本 / arena / 栈传参）、
  `105b_native_effects`（动作入口 / 宿主 handler / 续延 / abort / `--no-compile`）、
  `105c_native_host`（宿主效应 / 进程边界 / 资源限制）、`105d_native_gc`（GC / 大块 / 卡片表）、
  `105e_native_tco`（尾调用 / 闭包 / 标量 / 浮点）、`105f_native_artifacts`（文件集 / 增量 / 失败面）。
- GC：9y 高 churn 低存活集在 1 MiB live 预算下跑完（GC 前后输出一致、`GC_LOG` 有诊断行）、
  9z `GC_STRESS` 下续延 + List + 字符串输出不变、9aa GC 的 env 开关不影响产物；
  9t 仍锁「live 超限才 trap」。
- 尾调用：9ab 互递归 400 万层、9ac 9 参自递归（3 个栈实参）100 万层、9ad `if` / `case` /
  `natCase` 三种尾位置各 30 万层，都在默认 8 MiB 栈上跑完；9ae 断言「来参区不够」时
  `Main.s` 里是 `call` 而不是 `jmp`（回退正确）；9af 续延 resume 后的尾递归循环在
  `GC_STRESS` 下输出一致；9ag 带尾调用的产物两次编译逐字节一致；9ah 闭包体按
  闭包 ABI（`rdi` 占掉一个寄存器）算来参区——8 参 lambda 尾调 10 参函数正好用满 32 字节
  （lambda 捕获一个值，避免被高阶参数特化改按标准 ABI 算来参区）。
- 宿主层（fs 写读/原子写/目录排序/stat/rename/symlink/递归删除、argv/env/cwd/execPath、
  clock/tty、bracket、runIn/spawn/wait）由 105 的 9o–9s 覆盖；宿主进程的超时收尾由
  9u–9u3（单组 / 不改 pgid）与 9u4（并发 spawn 的两组）覆盖；spawn 的多实参 argv 边界
  由 9u5 覆盖；部分应用的实参根（`rt_apply` 慢路径）由 9u6 覆盖。
- 浮点字面量：9ao 断言产物里有 `.double` 常量且三端读数一致（长字面量 + `-0.0`）；
  9ao2 断言超出 double 范围的整数部分改写成 `.double inf` 并打印 `inf`。
- 死槽清零（`packages/target-native/test/Live.vuna`）：锁住「最后一次读之后写 0」、
  回边上的读让槽保持活跃、非递归无回边的函数不付成本、含 `rt_apply` 的块整块不清、
  死存储被删；GC 一侧由 9y / 9z（`GC_STRESS`）与 `gc_low_live` / `gc_array_churn`
  的 RSS 读数兜住。
- 共享语义（算术 / 字符串 / data / record / List 桥接 / 闭包 / 高阶 API）由
  suite 的 `pure-cross` 分类（`packages/compiler/test/corpus/pure_cross/`）对拍三端，OCaml 是语义 oracle。
- 指令选择与窥孔：`packages/target-native/test/Select.vuna` 锁序列形状与边界
  （63-bit wrap、Nat 饱和、`cmov`、立即数折叠的保留条件、常数除法的展开判据与
  `IrIf` 的反向条件）；`RuntimeTable` 锁内联计划与
  `nativeRtTarget` 的标签一致；`pure_cross` 的 `62_nat_sat` / `63_nested_scalar` /
  `96_str_prefix` 覆盖饱和语义、嵌套标量表达式的寄存器分配与字符串前缀比较
  （公共前缀只比较 `min(len)`）。
- 效应语义（handler / resume / abort / 嵌套 / return 改类型 / 宿主 console / 深递归）
  已并入 suite `pure-cross` 分类的三端对拍。
- 工具链：`cc` 缺失时 steps 首步明确失败；e2e 的 `nativeBuildInputs` 含
  `ocamlTools`（gcc/binutils）。

## 4. 已知边界

- 变体分支的**嵌套深匹配**：case 只按 tag 做一次线性分派，不做多模式矩阵。
  tag 在链外读一次进标量槽，链上每个分支只发 `cmp qword ptr [tag-slot], imm`（臂体
  会改写所有 caller-saved 寄存器，不能把 tag 留在寄存器里）。
- 续延是**一次性**（one-shot）：resume 两次被 epoch 表拒绝；multi-shot 不做。顺序 effect
  的栈深是常量（trampoline），不随 perform 次数增长；延迟 answer 的 handler 仍不支持
  （[debt.md](debt.md) D101）。
- FFI / extern；stdin 的 `readLine` / `readBytes` 与 net。
- **多线程原语**：`clone` + futex 已实现（`thread_*` / `mutex*` / `condvar*` / `atomic*`），
  并行区用 **STW + safepoint** 回收（TCB 在 `%fs`、线程表、`saved_rsp` / park 协议、
  循环头 `rt_safepoint`、futex 等待的 `block_begin`/`block_end` 标记）。仍有边界：
  `bracket` cleanup 链与 fs/process 宿主戳记/缓冲仍是全局的（并发使用不安全）；阻塞在
  宿主 syscall 的线程没有停车标记（GC 等它返回）；线程栈固定 64 MiB，`threadId` 是
  `gettid`。见 [debt.md](debt.md) D135。
- **自举运行**：`vuna build packages/compiler --target native` 产出可链接的 `bin/vuna-compiler`
  （`version` / 帮助可用）；成员包 `processSpawn` 按 argv 边界逐项传参（105 的 9u5），GC 逐帧
  保守扫根，入口自带栈（105 的 9u7）：深递归不再依赖 `ulimit -s`，40 万层非尾递归由 9u7 锁定。
  整仓 `check .` 的成本与 selfhost / parity / corpus 读数见 [native-selfhost.md](native-selfhost.md)：
  尾调用（[native.md](native.md) §3）只覆盖
  **直接饱和直调**，非尾递归、被闭包包住的递归仍按帧吃自带栈；效应侧另有延迟 answer 的
  handler 缺口（[debt.md](debt.md) D101）。
  CI 的 `nix run .#backend-check -- --compiler native` 因此仍是非阻塞任务（口径见
  [testing-checks.md](testing-checks.md)「后端自举 conformance」）。
- **GC 的边界**：栈帧与卡片都按机器字保守判断；两代、非移动、不压缩。因此
  1. 帧内偶然形似指针的字（`.rodata` 字面量、复用过的临时值、已消费的参数）会多留对象；
  2. 老代引用靠写屏障：`writeRef` 与两处列表改接之外的写入路径（宿主缓冲、`prim_*`）
     不经过屏障，漏登记的引用在年轻代回收里会被当成死块；卡片粒度 512 字节，一个脏
     卡片整段重扫（见 [debt.md](debt.md)）；
  3. 非移动，指针不会失效；也没有压缩，碎片见下；
  4. 空闲块按 2 的幂尺寸类复用、不合并相邻空块，内部碎片最多约 2×；
  5. 超过 64 MiB 的块单独占段、死块进 `rt_huge_free` 首次适配链（可复用，不 `munmap`）；
- **宿主缓冲与算术边界**（失败一律显式，不静默截断/越界写）：
  - `fsReadFile` 没有固定缓冲上界：先 `stat` 拿大小、按 `max(size, 64 KiB)` 一次分配字符串
    再读到 EOF，读满则容量加倍续读（数据搬一次）；`stat` 给 0 的伪文件（`/proc` 等）从 64 KiB
    起步。`@vuna@host@tryReadFileRange` 的单次 `length` 仍截到 8 MiB 读缓冲上界；
  - `@vuna@host@tryReadDir` 的名字数组上限 4032 项：超出报 io 错误；
  - 路径缓冲 4096 字节：超长路径 trap（`vuna: runtime error: path too long`，exit 2）；
  - `Int` 除法 `min_int / -1` 返回 `min_int`（与 OCaml / wasm 一致，不触发 x86 `#DE`）。
- **运行期性能与内存**：`nix run .#vuna-perf -- --target native`（或 `--target both`）
  在 `bench/programs/t*` 的生成程序基准上测 native 产物；基线 `bench/baselines/programs.json`，读数与口径见
[benchmarks.md](benchmarks.md) §1.1。非尾深递归吃入口自带栈（512 MiB 虚拟，独立于
  `ulimit -s`），JSON 的 `meta.stack_policy` 记为 `self-managed`、每项另有
  `default_stack_ok` 探针；峰值 RSS = 已触碰的栈页 + live 堆，需与墙钟一起读。TCO 由
  `IrTail` 标记驱动，覆盖直调、饱和闭包、函数值 wrapper、runtime 符号与自递归 loop；
  窄调宽（未被尾位置内联消除的 SCC）、`rt_apply` 慢路径与非尾递归仍吃帧。
  `tco_narrow_wide` 现在锁内联后的自循环，不再量回退成本（见
  [benchmarks.md](benchmarks.md) §1.2）；
  `tco_mutual` / `tco_wide` / `arith` / `records` 的判定与实测读数见
  [benchmarks.md](benchmarks.md) §1.2；§1.1 的 native 列是 TCO 前快照。
- 核数限制是**亲和性**，不是 CPU 配额：单核跑多久不管，长时间占用用
  `VUNA_NATIVE_TIMEOUT_MS`；cgroup 只读 v2 挂载根的 `cpu.max`。
- `Int`/`Nat`/`Bool` 的 heap 布局、对象头/复用（Perceus RC 依赖这一层）。
- 多文件目标链接/对象文件：IR 已经是整程序单单元；不需要独立目标文件。
- 对象库/增量缓存、`vuna run --target`、`--target native` 的 release 差异。
- aarch64 及非 Linux 平台；寄存器分配与优化；栈溢出检查；位置表/backtrace。

### 4.1 与 OCaml / wasm 的语义差异（总览）

逐项细节见上文条目；这里只列**有意保留**的差异（suite 的 `pure-cross` 对拍不覆盖它们）：

| 语义 | OCaml | Native | WASM |
| --- | --- | --- | --- |
| `strPack` 越界 | 抛异常 | 截断低 8 位 | 截断低 8 位 |
| `isTty` | stdout | stdout | 恒 False（WASI 无 isatty，保守） |
| 零参顶层定义 | 初始化时求值 | `_start` 一次（CAF 槽） | `_start` 一次 |
| 原子写临时名 | `<path>.<pid>.tmp` | `<path>.<pid>.tmp` | `<path>.tmp<µs><seq>` |

## 5. 对象表示与 List 桥接

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

## 6. 相关阅读

- [ir.md](ir.md)：IR 节点、运行时契约、后端义务。
- [native-platform.md](native-platform.md)：平台层（syscall 垫片 / libc）的判据与实测读数。
- [architecture.md](../architecture.md)：子系统地图与改动定位。
- [wasm.md](wasm.md)：第二个产品后端（同样的「文本 canonical + 外部工具」策略）。

## 7. 插件形态

native 后端在独立包 `packages/target-native`（二进制 `vuna-target-native`），不在 `seed/` 内。
编译器完成 DT 检查 + Lowering 后，把 `IrProgram` 用 `Vuna.Ir.Codec` 编码，以子进程调用：

```console
vuna-target-native --ir FILE --out DIR [--print] [--diag FILE] [--files FILE]
```

`--diag` 回传 `NativeErr` 诊断（`Vuna.Compiler.Base.Diag.Codec`），`--files` 回传产物清单
（编译器据此生成链接脚本）；链接仍由 CLI 调 `cc` 完成。协议细节见 [cli.md](cli.md)「后端插件协议」。