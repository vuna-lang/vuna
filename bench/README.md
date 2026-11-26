# bench：生成程序与运行时基准

本目录是生成程序、工具链与产物的测量设施。各脚本分工：

| 设施 | 测什么 | 入口 |
| --- | --- | --- |
| `bench/bootstrap.sh` | 编译器**构建/编译**墙钟、OCaml 文本尺寸、codegen 计数 | `nix run .#vuna-bench` |
| `bench/run.sh` | **生成程序运行时**（vuna 产物 vs 手写 OCaml）；target = ocaml / native / wasm / both / all；另记每个后端的产物文件数/二进制大小/构建耗时 | `nix run .#vuna-perf` |
| `bench/artifact.sh` | **三端产物基线**：`.ml` / `.s` / `.wat` 的文件树、字节、行数，最终二进制大小，分段构建时间；按 `minimal` / `hello` / `defs-N` / `mods-N` / `self` 分档 | `nix run .#vuna-artifacts` |
| `bench/compiler.sh` | **工具链命令**墙钟（check/build/map/fmt，冷/热） | `sh bench/compiler.sh` |
| `bench/native.sh` | 编译器编到 **native** 后的端到端（`check packages/base` / `--full` 加 compiler） | `sh bench/native.sh`（需 `result-native`） |

## 口径

- 每个 benchmark 是一组**同算法**实现：`programs/t<N>/<name>/<name>.vuna`（vuna 源码）、
  同目录 `<name>.ml`（手写 OCaml 对照）与 `<name>.c`（手写 C 对照）；`t<N>` 是机制分层，
  见 [`programs/TIERS.md`](programs/TIERS.md)。库基准（如 `hashmap`）的 OCaml / C 对照都用
  同档手写结构（标准库 Hashtbl、AVL、环形队列等），文件头注释会说明；这测的是
  「vuna 库/表示与手写最优实现的差距」。
- **五个列 × 三个指标**：`ocaml_ref` / `c_ref` / `vuna_ocaml` / `native` / `wasm` 各自测
  墙钟、CPU（user+sys）、峰值 RSS；每个后端对两个对照组各给一套 ratio
  （`vs_handwritten` 对手写 OCaml，`vs_c` 对手写 C），三个指标各一组。
- C 对照用 `-O2` 编译，N 从 argv 读（sidecar 的 `n=`，可含多个参数），避免 GCC 把常量
  循环折成闭式；vuna / OCaml 侧用字面量 N。`vuna Int` 是 **63 位**补码（同 OCaml），
  输出依赖回绕的用例在 C 侧按 63 位模拟并配 `cc_flags=-fwrapv`。
- `--target ocaml|native|wasm|both|all` 选择被测后端（默认 `ocaml`）；`--no-c-ref` 关闭 C 对照
  （`--c-ref on` 则要求每个用例都有 `<name>.c`）。
- 超时用于**首次 golden 校验**：`timeout_x × t_ref + 200ms`，夹在 `--timeout-min-ms`
  （1000）与 `--timeout-max-ms`（30000）之间；`t_ref` 取两个参照里**较慢**的那个（C 普遍比
  OCaml 快，取最快参照会把正常后端判成超时）。`timeout_x` 缺省按 tier（t5/t6/t10 为 5，其余 3），
  sidecar 的 `timeout_x=` / `timeout_ms=` 覆盖。超时记 `skip_reason=timeout`，是硬失败而不是慢。
  同一二进制、同一 N 通过校验之后，计时与采样跑裸程序（C 对照直接以 `n=` 作 argv，
  不经 shim；wrapper 的 fork 会污染小项与 RSS）。
- `--tier t1` 只跑某一层（可重复）；`--list` 的输出带 tier 列。
- tier 从 t0 到 t12；深栈 / 线程 / Fs / FFI 用例用 `targets=` 显式声明非 wasm 目标，
  不要让 wasm 在 golden 校验阶段静默 `run_ok=false`（清单见 [`programs/TIERS.md`](programs/TIERS.md)）。
- 三个指标由 `bench/lib/timestat.c` 在**同一次运行**里采：墙钟 `CLOCK_MONOTONIC`、
  CPU `wait4` 的 `ru_utime+ru_stime`（微秒级）、峰值 RSS `ru_maxrss`。GNU time 的 `%U/%S`
  只有 10ms 量化、bash 内建 time 是 1ms，5ms 量级的项不够用，所以自带一个 80 行的小工具；
  `nix run .#vuna-perf` 的 PATH 里已有 cc。
- wasm 产物由仓库自带的宿主执行（`wasm-host/run.mjs`，Node/V8，与浏览器同一套
  `WebAssembly` API 与 host 层）。`meta` 记录 `node` / `node_startup_ms` /
  `node_startup_cpu_ms` / `node_rss_kb`（空 node 进程的固定地板）以及
  `wasm_host_runner` / `wasm_opt`。
- wasm 的 `.wasm` 有两段外部工具：`wasm-tools parse` 汇编，然后 `wasm-opt -O3` 优化。
  `--target wasm` 的构建时间分三段记录（`toolchain` / `postprocess` / `toolchain_warm`）。
  产物大小与运行时间都按优化后的 `.wasm` 口径；`main.wat` 仍是 canonical 文本。
- V8 的 wasm 栈约 1 MB 且无开关：非尾深递归的程序会以 `Maximum call stack size exceeded`
  收口，JSON 记 `"run_ok": false`（浏览器路径的真实边界，不是测量设施的限制）。
  wasm 的三个指标先减固定地板（`net_median_ms` / `net_cpu_ms` / `net_rss_kb`），
  `ratio` 一律用 net；另外仍记 wasm 线性内存 `memory_bytes`（GC 堆的真实口径）。
  wasm 的 `rss_kb` 是 node 进程量级（~55 MB 起），减地板后才是可比部分。
- `programs/<name>.out` 是 golden：**每个被测产物、手写 OCaml 与手写 C 都必须输出它**，
  脚本会在计时前各校验一次，输出不一致直接失败（不会拿错误程序刷基线）。
- `programs/<name>.bench` 的 `ops=N` 声明该程序一次运行的**代表性操作数**（算术步、字节、
  分配、`perform` 等，单位写在程序头注释里）。声明后表格与 JSON 都给出
  `ns_per_op = median_ms * 1e6 / N` 与 `cpu_ns_per_op`，同一项在不同后端、不同规模之间
  就有了可比的单位；没有声明则显示 `-`。
- 每项先 `--warmup` 次预热，再跑 `--runs` 个样本：墙钟与 CPU 取**中位数**，峰值 RSS 取
  **最大值**；每个样本都同时产三个指标，GC 诊断行来自同一样本。
- native 只有**直接饱和尾调用**复用栈帧（[native.md](../docs/reference/native.md) §3），
  非尾深递归吃入口自带栈：`_start` 默认 mmap 512 MiB 虚拟栈（`VUNA_NATIVE_STACK_MB`），
  与 `ulimit -s` 无关，JSON `meta.stack_policy` 记为 `self-managed`；栈页计入峰值 RSS
  （未触碰的虚拟部分不提交、不计 RSS）。
- native 每个 benchmark 另记 `default_stack_ok`：固定 8 MiB soft limit 跑一次、记录能否正常
  退出（探针不参与计时）。自带栈生效时这项应恒为 true；false 说明栈初始化回落到了进程栈。
- 跨机器只比较 ratio（`wall` / `cpu` / `rss` 各一组）；绝对 ms/KB 不可比。`--check` 默认读
  对应基线，三个指标都参与判定：超过 `--threshold`（默认 20%）打 `PERF-CHECK-WARN`
  （软告警、退出 0），超过 `--fail-threshold`（默认 50%）直接失败；同机器另比 `wall` / `cpu` /
  `rss` 的绝对值，并提示 `default_stack_ok` 的变化。wasm 的净耗时不到地板两倍时（启动成本
  主导）绝对值行只作参考。宿主负载只污染墙钟，CPU 与 RSS 的口径不受影响，机器繁忙时以
  `cpu` 行为准。
- `--gate-ratio N` 是**绝对门禁**（与基线无关）：逐个 case 用 **CPU 中位数**（`rusage`
  user+sys，**含进程启动**）除对手写 OCaml，超过 N 即 `PERF-GATE-FAIL` 并 exit 1；阈值
  下方 `--gate-slack`（默认 0.05）以内记为 `near`，只提示加 `--runs` 复核，不改退出码。
  短用例（参照 1–5 ms）的进程启动占比高：`repeat=` 放大的是采样内耗时，不改变启动地板。
- 采样顺序按轮交替（偶数轮先跑参照、奇数轮先跑被测）：参照与被测在同一次测量里交错，
  避免宿主负载的单调漂移系统性偏向先跑的一方。
- **对象库默认隔离**：每次运行把 `VUNA_STORE` 指到 `$WORK/store` 的独立空库。热
  `~/.vuna/store` 可能留着旧编译器生成的模块接口 / split 产物，跨编译器改动后会被
  复用（runtime 文本、GC 参数都是旧的），读数不可比；要快速迭代用 `--shared-store`。
  `meta.store_mode` 记录本次口径。
- 编译器侧基准（`check compiler` / `check .` / `compile .`）与 runtime 基准共用同一脚本与
  JSON 结构；当前先由 `bench/bootstrap.sh` 记录编译墙钟，`bench/run.sh` 的 runtime 段不重复测量
  编译（含 `VN_PERF_STATS` 的分配/GC 读数）。

## 运行

```console
# 仓库根；nix runner 会带上 vuna / ocamlopt / cc / jq / GNU time
nix run .#vuna-perf
nix run .#vuna-perf -- --list                          # 自动发现的基准 + sidecar（repeat/targets/c）
nix run .#vuna-perf -- --runs 5 --only string_ops
nix run .#vuna-perf -- --target native                 # 只测 native 后端
nix run .#vuna-perf -- --target wasm                   # 只测 wasm（JS 宿主 / Node）
nix run .#vuna-perf -- --target all --check            # 与 baselines/programs.json 比
nix run .#vuna-perf -- --only eff_tick --only eff_deep --only eff_bracket --check  # 效应子集
nix run .#vuna-perf -- --only micro_apply --only micro_concat --target both --runs 5  # 原语级（ns/op）
nix run .#vuna-perf -- --check --strict                # WARN 也 exit 1
nix run .#vuna-perf -- --shared-store --only arith     # 复用热 store（快；跨编译器改动时读数可能失真）
nix run .#vuna-perf -- --target ocaml --runs 9 --warmup 3 --gate-ratio 1.2  # 1.2x 绝对门禁
nix run .#vuna-perf -- --target all --runs 5 --warmup 2 \
  --json bench/baselines/programs.json                 # 重新生成唯一一份程序基线
```

本地已有固定二进制时可直接复用（先 `nix build .#vuna --out-link result`；`result` 是共享
out-link，可能指向旧二进制或别的产物，基准读数要求同一二进制、同一口径）：

```console
VUNA=$PWD/result/bin/vuna ./bench/run.sh --runs 3
```

## 基线维护

- 基线统一在 `bench/baselines/`：`programs.json`（全部生成程序 × 三端 × 三指标）、`bootstrap.json`、
  `compiler.txt`、`artifacts.json`、`native.json`。每个 family 只有一份，不再按 target 拆文件。
- `programs.json` 用 `--target all --runs 5 --warmup 2` 生成；`--check` 只比本次实际跑的
  target / benchmark（`--only eff_*` 就是效应子集）。wasm 一律比 `net_*`（减
  `meta.node_startup_{ms,cpu_ms}` 与 `meta.node_rss_kb`）。
- 统一重标：`nix build .#vuna --out-link result && sh bench/update-baselines.sh`
  （`--only programs|bootstrap|compiler|artifacts|native` 可单跑）。
- 基线是**软门槛**：默认 WARN；`--strict` 把 WARN 变 exit 1，`--fail-threshold`（默认 50%）
  直接失败。不为跨机器/环境差异改阈值，只有确认是生成程序质量的真实变化才重标。
  三个指标都可 FAIL；宿主繁忙时墙钟会整体抬升，先看 `cpu` 行确认是否是真实回退。
- 每个 benchmark 可用同名 `.bench` sidecar 覆盖默认口径：`repeat=N`（一次采样内重复）、
  `targets=a,b`（限定后端）、`c=path`（参与 OCaml 对照链接的 C 源；vuna 侧 FFI 走包根
  `ffi/*.c`）、`n=...`（C 对照的 argv）、`cc_flags=...`、`skip=1`。

## 产物基线

`bench/artifact.sh` 用固定输入测三端产物（中间文本 + 最终二进制 + 分段构建时间），
结构写进 `bench/baselines/artifacts.json`：

```console
nix run .#vuna-artifacts -- --list
nix run .#vuna-artifacts -- --only hello --check
nix run .#vuna-artifacts -- --json bench/baselines/artifacts.json   # 重标
```

用例：`minimal`（最小可执行程序：纯 Int，runtime + 最小 base 闭包）、`hello`（最小效应
程序：多一层 `Base.Effect.Core` 的 handler 面）、`defs-10/100/1000`（单文件顶层定义数；入口体是直连的
左嵌套加法链，同时钉住精化入口按表达式规模派生的预算）、`mods-10/100`（包内模块数）、
`self`（`packages/compiler`；wasm 不支持该目标）。

口径：

- 中间文本：`.ml`（ocaml）/ `.s`（native）/ `main.wat`（wasm）的文件树、文件数、字节、行数；
- 最终二进制：`prog`（ocaml / native）与 `main.wasm`；
- 构建：`codegen_ms`（`vuna compile`）、`toolchain_ms`（ocamlopt / cc / `wasm-tools parse`）
  与 `postprocess_ms`（`wasm-opt`；非 wasm 目标为 0），各带 `*_cpu_ms`（user+sys），
  另有 `toolchain_warm_ms`（ocaml 走 build.sh 内容哈希、native 为重链、wasm 为
  `build.sh` 的编译+优化两段）；每次构建用独立空 `VUNA_STORE`（`<dir>.store`），
  codegen 冷热不随宿主缓存漂移；
- 生成物不含绝对路径/时间戳，工具链由 flake 固定，所以**尺寸与二进制大小跨机器可比**
  （默认 5% WARN / 20% FAIL，FAIL 退出 1）；**时间只同机可比**，负载波动时看 CPU 口径
  （20% / 50%，软判定：只报告，不影响退出码；基线 <100ms 的行不判定）。

读数与解读见 [performance.md §产物规模](../docs/reference/performance.md)。

## 当前基线

`--target all --runs 5 --warmup 2`（生成时 `meta.loadavg ≈ 2.8`；t3 行取 2026-11-26 native 优化后的
同窗口，多 worktree 并行、绝对 ms 偏高），x86_64 / 16 核 / ocamlopt 5.5.1
（非 flambda）。每格是 **wall/cpu/rss 三口径的 ratio（对手写 OCaml）**，wasm 列已是减地板的
net；对手写 C 的对照与 `bench/baselines/programs.json` 里的全部用例见该文件，解读见
[benchmarks.md](../docs/reference/benchmarks.md)：

| benchmark | 场景 | OCaml 后端 (w/c/r) | native (w/c/r) | wasm net (w/c/r) |
| --- | --- | --- | --- | --- |
| arith | Int 算术 + 尾递归 | 1.25/1.23/1.82 | 0.63/0.63/0.35 | 3.57/4.82/3.49 |
| string_ops | 字符串拼接 / repeat / substring | 1.97/2.05/1.64 | 0.89/0.92/0.29 | 7.59/9.76/2.51 |
| hashmap | 持久哈希表 + 字典派发 | 2.63/2.69/2.68 | 3.13/3.21/0.97 | 7.95/11.65/4.83 |
| list_recursion | List 非尾递归 / fold / append | 0.79/0.79/1.26 | 2.15/2.16/1.75 | skipped |
| gc_pressure | 分配压力（字符串 churn） | 1.24/1.25/3.06 | 1.56/1.56/2.90 | skipped |
| array | 不可变 Array | 0.98/0.97/1.62 | 0.90/0.90/0.93 | 3.78/4.23/3.73 |
| records | record 更新 + variant 分派 | 2.32/2.31/4.49 | 3.23/3.29/0.22 | 7.95/9.15/3.16 |
| closures | 高阶函数 / 每次迭代新建闭包 | 1.30/1.29/1.56 | 2.58/2.58/2.80 | skipped |
| micro_apply_dyn | 运行期选闭包后动态应用 | 0.89/0.88/1.80 | 0.49/0.48/0.32 | 6.88/7.42/5.54 |
| micro_partial | 每轮部分应用 shim | 1.61/1.65/4.51 | 0.43/0.44/0.19 | 1.45/1.71/2.58 |
| micro_overapply | 一次给足两层实参 | 0.95/0.95/4.50 | 0.25/0.25/0.19 | 3.30/3.51/3.16 |
| micro_capture | maker 返回捕获闭包 | 1.26/1.24/4.48 | 0.32/0.31/0.21 | 1.09/1.24/2.55 |
| micro_closure8 | 8 参闭包（3 个栈实参） | 1.46/1.47/1.78 | 0.32/0.31/0.32 | 28.82/31.77/5.36 |
| micro_args8 | 非尾 8 参直调（2 个栈实参） | 1.06/1.06/1.88 | 0.26/0.25/0.33 | 2.35/2.61/4.49 |
| micro_record_dispatch | record 字段闭包派发 | 1.25/1.25/1.80 | 2.27/2.28/0.32 | 4.73/4.97/5.36 |
| closure_pipeline | 闭包表逐轮 fold 派发 | 1.31/1.30/1.79 | 3.06/3.09/0.32 | 7.29/9.04/5.37 |
| sorting | 归并排序（List + Pair 拆半） | 0.89/0.89/2.50 | 2.24/2.25/1.69 | skipped |
| float_math | Float 算术 / sqrt / abs | 2.38/2.39/4.30 | 0.72/0.72/0.20 | 3.52/4.30/2.45 |
| text_scan | 逐字节 `strAt` 扫描 | 1.73/1.75/1.91 | 1.47/1.47/0.94 | skipped |
| nat_bits | Nat 饱和算术 + 位运算 | 2.07/2.07/1.78 | 0.72/0.69/0.35 | 7.57/10.29/4.26 |
| tco_mutual | 互递归尾调用 | 1.09/1.08/1.82 | 0.73/0.72/0.35 | 4.26/4.67/4.29 |
| tco_wide | 9 参数尾递归 | 1.25/1.25/1.83 | 0.90/0.89/0.35 | 4.50/5.28/3.53 |
| micro_tco | 最小自递归尾调用 | 1.10/1.11/1.79 | 0.58/0.57/0.35 | 3.58/4.02/3.44 |
| tco_args | 交叉依赖实参的尾递归 | 1.13/1.13/1.83 | 1.03/1.04/0.36 | 1.58/1.80/3.52 |
| tco_unrotated | 不旋转的尾调用 | 0.87/0.87/1.78 | 0.96/0.96/0.35 | 5.08/5.61/4.23 |
| tco_arity6 | 6 参尾递归 | 1.09/1.09/1.80 | 0.65/0.66/0.35 | 2.61/3.11/3.42 |
| tco_narrow_wide | 窄调宽内联 | 1.26/1.30/1.79 | 0.22/0.21/0.35 | 6.80/8.19/4.21 |
| tco_nat | Nat 结构递归尾调用 | 1.53/1.54/1.79 | 0.94/0.96/0.35 | 3.51/4.17/3.28 |
| state_machine | Int 分支链状态机 | 1.72/1.73/1.79 | 0.84/0.84/0.35 | 4.01/4.77/4.16 |
| gc_low_live | 低存活集、大累计分配 | 0.95/0.95/1.06 | 0.58/0.58/0.01 | skipped |
| gc_array_churn | 大对象 churn（Array COW） | 1.26/1.26/1.28 | 1.23/1.24/0.04 | skipped |
| gc_retain | 高存活集（live ~19 MB）+ 等量 churn | 2.09/2.11/5.64 | 4.49/4.55/2.84 | 8.76/9.83/5.73 |


wasm 列的 `skipped` 是 V8 的 wasm 栈上限（非尾深递归），浏览器路径同样如此；wasm 的
绝对 ms、宿主启动地板与 RSS 口径见 [benchmarks.md §1.3](../docs/reference/benchmarks.md)。
wasm 侧 `VN_PERF_STATS=1` 另报线性内存大小与启动四段（`read_ms` / `compile_ms` /
`instantiate_ms` / `start_ms`），JSON 记在每个 benchmark 的 `startup` 字段里——
`net_median_ms` 只减掉了 node 空启动，不区分这几段。
OCaml 后端大多数用例在 ~2× 手写 OCaml 内；例外是 `hashmap_remove`（~9.9×）与
`eff_bracket`（~11.7×），原因见 [benchmarks.md §1](../docs/reference/benchmarks.md)。native 的
绝对值、峰值内存与 `default_stack_ok` 也见该页。分配 / GC 统计由 OCaml 后端生成 runtime 的
`VN_PERF_STATS=1` 输出，`bench/run.sh` 采集进 JSON 的 `gc` 字段；native 侧由
`VUNA_NATIVE_GC_LOG=1` 的末次诊断行采集 `collections` / `live_bytes` / `alloc_bytes`
（两代 mark-sweep，见 [native-runtime.md](../docs/reference/native-runtime.md) §1.2），另记峰值 RSS 与默认栈探针。
`gc_low_live` 的 native RSS 落回进程基线（~2.8 MB，0.01× 手写 OCaml），C 对照是手工
malloc/free，RSS 比到 C 更能看出 GC 元数据与高水位的代价；`gc_array_churn` 仍是 GC 相关的
最差项（COW 数组复制）；`gc_retain` 是反向的一档——live 单调上升（~19 MB），整堆回收必须重扫
整个存活集，是 `gen=` 分布与整堆触发策略的测量项（低存活的 `gc_low_live` / `gc_pressure`
覆盖不到）。TCO 已覆盖直调、自递归 loop、饱和闭包、wrapper 与 runtime 符号；t2 的基准把
实参写回、非旋转尾调用、6/9 参边界、窄调宽内联与 Nat/Int 分支链各自单列，矩阵与读数见
[benchmarks.md §1.2](../docs/reference/benchmarks.md)。

效应基准（`eff_tick` / `eff_deep` / `eff_deepseq` / `eff_bracket` / `eff_nested` /
`eff_host` / `eff_abort` / `eff_install`）与 `startup`（sidecar `repeat=20`）、`traits`
都在默认集合与 `programs.json` 里；`vuna-perf --only eff_tick --only eff_deep --only eff_bracket --check`
是效应面的快检子集。三端读数、CPS 前后（历史二进制）与产物尺寸见
[benchmarks.md §1.4](../docs/reference/benchmarks.md)。

## 编译器基准

`bench/compiler.sh` 测编译器 / 工具链自身墙钟：`check .`、`check compiler`、`build --no-compile`
（workspace 全部 / 仅 compiler 包）、`vuna map` 冷 / 热、`fmt --check`，并内置冷 / 热两种
口径（清缓存后测 vs 预热后测）。**范围不同不可直接互比**：`check-all` 是 workspace 根包 +
成员并行，`build-all` 是 workspace 全部串行（≈ check 全部 + codegen），`*-compiler` 只覆盖
compiler 包。基线 `bench/baselines/compiler.txt`（机器相关，仅同机回归对比）；`--check` 超
`--threshold`%（默认 20）打 WARN、超 `--fail-threshold`%（默认 50）exit 1（硬门槛），
`--save-baseline` 重写基线，`--alloc` 额外打印冷 `check .` 的 GC 分配统计（`VN_PERF_STATS=1`）。
跨机器/跨输入规模的可比口径是 `nix/checks/compiler-growth.sh`（合成 500/1000/2000/4000 同形
定义，相邻档墙钟比 ≤2.3；进 `nix flake check`）。用法与读数见
[compiler-benchmarks.md](../docs/reference/compiler-benchmarks.md)。
