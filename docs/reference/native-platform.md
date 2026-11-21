# native 平台层：自维护 syscall 垫片 vs libc

> 本文回答一个决策问题：native 后端不依赖 libc，代价与收益各是什么，什么时候该改回去。
> 现状事实见 [native.md](native.md)；本页只放判据与实测读数。

## 1. 它实际依赖内核的什么

平台面（`Native.Pal`）一共 **33 个 syscall 号、48 个站点**，摊平在
`nix/checks/data/native-surface.baseline` 里，可直接读：

| 族 | syscall |
| --- | --- |
| 进程与入口 | `exit` `fork` `execve` `wait4` `kill` `setpgid` `getpgid` `getpid` |
| 文件系统 | `openat` `read` `write` `close` `newfstatat` `getdents64` `mkdirat` `unlinkat` `rename` `rmdir` `symlinkat` `readlink` |
| 进程环境 | `getcwd` `chdir` |
| 内存与时钟 | `mmap` `clock_gettime` `nanosleep` |
| 终端与信号 | `ioctl`(`TCGETS`) `rt_sigaction` `rt_sigprocmask` `rt_sigreturn` `setitimer` `sched_getaffinity` `sched_setaffinity` |

外加内核**布局**知识：`struct stat`（144 B，`st_mode`@24 / `st_size`@48 / `st_mtim`@88）、
`dirent64`、`PATH_MAX`（4096）、`cpu_set_t`（128 B）、`timespec` / `termios` / `itimerval`，
以及 errno 码表。

## 2. 它等价于哪一块 libc

| libc 面 | 本仓 |
| --- | --- |
| syscall 包装（`unistd.h` / `sys/stat.h` / `dirent.h` / `signal.h`） | `Native.Runtime` 的宿主层（约 320 行汇编模板） |
| `malloc` / `free` | **不存在**，换成了段链表 + 尺寸类复用 + 两代标记-清扫（表示层，本来就不属于 libc） |
| `stdio` 缓冲 / `printf` 格式引擎 | **不存在**，裸 `write` + 自己 itoa |
| `errno` + 返回值 | 换成 `rt_host_status` 状态槽 + `try*` 返回默认值 |
| `memcpy` / `memcmp` | `rep movsb` / `repe cmpsb` |
| `abort()` | 分类 trap：`vuna: runtime error: ...` + exit 2 |

所以它不是「重写 libc」，而是**一个 nolibc 级的垫片**：34 个 syscall + 一个分配器 +
几个字符串例程。缺的 libc 面很大（`printf` 格式引擎、locale/宽字符、浮点格式化、完整
math、`dlopen`、pthread/TLS、`getaddrinfo`），而且**不需要**——Vuna 的值表示由 codegen
定义，格式化在 `Base.Data.*` 库里。

## 3. 买到的

1. **表示权归编译器**：63-bit Int、长度头字符串、闭包布局、块头 + 段链表、保守 GC 的
   死槽清零，全部由 codegen 与运行时决定，不经过任何宿主分配器。
2. **静态零依赖单文件 ELF**（`cc -static -nostdlib -no-pie`）：无 loader、无
   `LD_PRELOAD`、无 glibc 版本约束。
3. **TCB 收窄**：信任面 = 内核 + 生成的 `.s`。
4. **产物可审查**：`.s` 文件集逐字节确定，这是三端对拍与自举 fixed point 的前提。

## 4. 付的

1. **平台矩阵自己承担**：glibc 存在的全部意义就是消化 (arch, 内核版本) 这张矩阵；
   现在只消化了一个格子（x86-64 Linux）。
2. **错误契约在包装层被重新决定**：这是最容易静默分歧的地方，典型例子是历史上
   非 try 的 FS 原语在 native 上落到 `try_*`、失败静默变成 `""`/`0`/`False`，而
   OCaml 抛错、wasm trap。
3. **安全边界手写**：读缓冲上界、目录项上限、路径长度、递归深度、argv 拼装、shell
   转义——每一处都要显式检查。
4. **入口协议被绑架**：`_start` 由 codegen 生成、自己从初始栈搬 `argc`/`argv`/`envp`，
   那是 `__libc_start_main` 的活。

## 5. 实测（本机 x86-64 Linux，AMD Ryzen 7 7840HS / Zen 4）

体积（`.bss` 不计入文件；两侧一样大）：

| 对象 | 未 strip | strip |
| --- | --- | --- |
| native 最小程序（`main = 42`） | 87.7 KB | 66.9 KB |
| 静态 glibc hello world | 789.3 KB | 704.6 KB |
| freestanding hello world | 9.1 KB | — |

→ 平台层改走**静态 glibc** 约 **+780 KB（≈10×）**；改走**静态 musl** 约 +30–40 KB（≈1.4×）。

性能：syscall 包装（几条指令 + 一次 `errno` 写）与启动（`__libc_start_main` 的 TLS /
IRELATIVE 初始化，约 100–300 µs）都在噪声级，且方向互相抵消。**唯一测得出的差距在内存
例程**，而它属于实现质量，不属于「有没有 libc」：

| 长度 | glibc `memcmp` | `repe cmpsb` | 倍率 |
| --- | --- | --- | --- |
| 8 B | 1.85 ns | 4.14 ns | 2.24× |
| 32 B | 1.86 ns | 10.84 ns | 5.82× |
| 64 B | 2.04 ns | 19.64 ns | 9.65× |
| 128 B | 2.25 ns | 20.95 ns | 9.31× |

| 长度 | glibc `memcpy` | `rep movsb` | 倍率 |
| --- | --- | --- | --- |
| 8 B | 5.24 ns | 6.07 ns | 1.16× |
| 64 B | 2.35 ns | 4.92 ns | 2.09× |
| 512 B | 7.65 ns | 34.62 ns | 4.53× |

（该 CPU 有 `erms` 但没有 `fsrm`，所以 `rep movsb` 在中小尺寸上吃亏；有 FSRM 的机器
差距会小一些。）同一段 SIMD 比较循环在 freestanding 运行时里同样能拿到 glibc 的水平，
所以这条**不构成选 libc 的理由**。

`str_eq` / `str_compare` 已改为 `bytes_eq` / `bytes_cmp`（8 字节字比较 + 字节尾部），
不再走 `repe cmpsb`；`str_concat` 等新分配目的的批量拷贝仍用 `rep movsb`（大块拷贝上
差距明显更小，且寄存器流是现成实现的承重假设）。

结论：**体积维度自维护完胜，性能维度不构成决策依据。**

## 6. 两个候选

| | B1 继续 freestanding + `Pal` 数据表 | B2 平台层改用 libc |
| --- | --- | --- |
| 表示层 | 不动 | 不动 |
| 触发条件 | 「把静态编译器二进制分发到任意 x86-64 Linux」是目标 | 目标只是自举 + 三端对拍 |
| 代价 | 新平台按 `Pal` 逐项实现；每个宿主叶子的错误路径要单独与 OCaml 对拍 | 入口协议重做（`_start` → libc `main`，或 `-nostartfiles` 自行提供 `_start`），`build.sh` 链接行改；ELF 不再自足 |
| 收获 | 零动态依赖、TCB 收窄、平台表可审查 | 错误契约与 oracle 同源（`Sys_error` / `strerror`），平台矩阵交还 libc |

判定依据只看一条：**「任意 Linux 上跑单文件编译器二进制」是不是目标**。是 → B1；否 → B2。
两者都不动表示层（alloc/GC/字符串/闭包/apply/show/trap 永远是自己的）。

## 7. 不变量

- 平台知识只允许出现在 `Native.Pal`；`Native.Runtime` 只按名字消费，不写字面量。
- 失败口径：`try*` 符号可以静默返回默认值 + 状态码；**其余宿主符号的失败必须显式可见**
  （OCaml 抛错、wasm trap、native 报告并 exit 2，形态各异但都不可静默）。
- `checks.vuna-native-surface` 与 `checks.vuna-native-artifact` 守这两条：
  前者让平台面变化显形，后者证明纯重构零行为变化。