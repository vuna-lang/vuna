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

- 每个 benchmark 是一对**同算法**实现：`programs/<name>.vuna`（vuna 源码）与
  `programs/<name>.ml`（手写 OCaml 对照）。库基准（如 `hashmap`）的对照用标准库上限，
  文件头注释会说明；这测的是「vuna 库/表示与手写最优实现的差距」。
- `--target ocaml|native|wasm|both|all` 选择被测后端（默认 `ocaml`）。`both` 在同一窗口内
  同时测 OCaml 后端与 native，`all` 再加上 wasm，用来给出跨后端的比值。
- wasm 产物由仓库自带的宿主执行（`wasm-host/run.mjs`，Node/V8，与浏览器同一套
  `WebAssembly` API 与 host 层）。`meta` 记录 `node` / `node_startup_ms` /
  `wasm_host_runner`。
- V8 的 wasm 栈约 1 MB 且无开关：非尾深递归的程序会以 `Maximum call stack size exceeded`
  收口，JSON 记 `"run_ok": false`（浏览器路径的真实边界，不是测量设施的限制）。
  wasm 的 RSS 是 node 进程量级（~55 MB 起），只作量级参考，不与 native/OCaml 的峰值口径比较。
- `programs/<name>.out` 是 golden：**每个被测产物与手写 OCaml 都必须输出它**，脚本会在计时
  前各校验一次，输出不一致直接失败（不会拿错误程序刷基线）。
- 每项先 `--warmup` 次预热，再跑 `--runs` 次取**中位数**；峰值内存用 GNU time 的 max RSS，
  计时结束后单独跑 `--rss-passes` 次取**最大值**（不参与计时）。
- native 只有**直接饱和尾调用**复用栈帧（[native.md](../docs/reference/native.md) §3），
  非尾深递归仍会耗尽默认栈。native 进程统一在 `ulimit -s unlimited` 下运行，JSON
  `meta.stack_policy` 记录该口径；栈页计入峰值 RSS。
- wasm 的计时包含 node 启动 + 模块实例化（`meta.node_startup_ms`，本机 ~18 ms）；
  小项先减地板再看。
- native 每个 benchmark 另记 `default_stack_ok`：固定 8 MiB soft limit 跑一次、记录能否正常
  退出（探针不参与计时）。直接饱和尾调用的项（`tco_mutual` / `tco_wide` / `arith` /
  `records`）应为 true，非尾深递归项仍为 false。
- 跨机器只比较 `ratio = <backend>_median / ocaml_median` 与
  `rss_ratio = <backend>_max_rss / ocaml_max_rss`；绝对 ms/KB 不可比。`--check` 默认读
  对应基线，对超过 `--threshold`（默认 20%）的项打 `PERF-CHECK-WARN`（软告警、退出 0），
  并额外提示 `default_stack_ok` 的变化。
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
nix run .#vuna-perf -- --check --strict                # WARN 也 exit 1
nix run .#vuna-perf -- --target all --runs 5 --warmup 2 \
  --json bench/baselines/programs.json                 # 重新生成唯一一份程序基线
```

本地已有固定二进制时可直接复用（先 `nix build .#vuna --out-link result`；`result` 是共享
out-link，可能指向旧二进制或别的产物，基准读数要求同一二进制、同一口径）：

```console
VUNA=$PWD/result/bin/vuna ./bench/run.sh --runs 3
```

## 基线维护

- 基线统一在 `bench/baselines/`：`programs.json`（全部生成程序 × 三端）、`bootstrap.json`、
  `compiler.txt`、`artifacts.json`、`native.json`。每个 family 只有一份，不再按 target 拆文件。
- `programs.json` 用 `--target all --runs 5 --warmup 2` 生成；`--check` 只比本次实际跑的
  target / benchmark（`--only eff_*` 就是效应子集）。wasm 另有 `net_median_ms`
  （减 `meta.node_startup_ms`）。
- 统一重标：`nix build .#vuna --out-link result && sh bench/update-baselines.sh`
  （`--only programs|bootstrap|compiler|artifacts|native` 可单跑）。
- 基线是**软门槛**：默认 WARN；`--strict` 把 WARN 变 exit 1，`--fail-threshold`（默认 50%）
  直接失败。不为跨机器/环境差异改阈值，只有确认是生成程序质量的真实变化才重标。
- 每个 benchmark 可用同名 `.bench` sidecar 覆盖默认口径：`repeat=N`（一次采样内重复）、
  `targets=a,b`（限定后端）、`c=path`（参与链接的 C 源）、`skip=1`。

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
- 构建：`codegen_ms`（`vuna compile`）与 `toolchain_ms`（ocamlopt / cc / wasm-tools），
  各带 `*_cpu_ms`（user+sys），另有 `toolchain_warm_ms`（ocaml 走 build.sh 内容哈希、
  native 为重链、wasm 为重新汇编）；每次构建用独立空 `VUNA_STORE`（`<dir>.store`），
  codegen 冷热不随宿主缓存漂移；
- 生成物不含绝对路径/时间戳，工具链由 flake 固定，所以**尺寸与二进制大小跨机器可比**
  （默认 5% WARN / 20% FAIL，FAIL 退出 1）；**时间只同机可比**，负载波动时看 CPU 口径
  （20% / 50%，软判定：只报告，不影响退出码；基线 <100ms 的行不判定）。

读数与解读见 [performance.md §产物规模](../docs/reference/performance.md)。

## 当前基线

`--runs 3 --warmup 1`（native / wasm 列用 `--runs 5 --warmup 2`），x86_64 / 16 核 / ocamlopt 5.5.1
（非 flambda）。读数见 [benchmarks.md](../docs/reference/benchmarks.md)：

| benchmark | 场景 | OCaml 后端 ratio | native ratio | wasm ratio |
| --- | --- | --- | --- | --- |
| arith | Int 算术 + 尾递归 | ~1.2x | ~9.4x（尾调用后；见 §8.2） | 17.6x |
| string_ops | 字符串拼接 / repeat / substring | ~1.3x | ~1.7x | 8.7x |
| hashmap | 持久哈希表 + 字典派发 | ~2.0x | ~3.3x | 12.0x |
| list_recursion | List 非尾递归 / fold / append | ~0.8x | ~5.9x | skipped |
| gc_pressure | 分配压力（字符串 churn） | ~1.2x | ~3.3x | skipped |
| array | 不可变 Array | ~0.9x | ~2.5x | skipped |
| records | record 更新 + variant 分派 | ~2.1x | ~7.4x（尾调用后；见 §8.2） | 9.6x |
| closures | 高阶函数 / 每次迭代新建闭包 | ~1.4x | ~11.4x | skipped |
| sorting | 归并排序（List + Pair 拆半） | ~1.5x | ~2.7x | skipped |
| float_math | Float 算术 / sqrt / abs | ~1.9x | ~36.6x | 6.9x |
| text_scan | 逐字节 `strAt` 扫描 | ~1.5x | ~13.0x | skipped |
| nat_bits | Nat 饱和算术 + 位运算 | ~1.3x | ~15.5x | 10.0x |
| tco_mutual | 互递归尾调用 | ~1.0x | ~6.7x（尾调用复用栈帧） | 6.8x |
| tco_wide | 9 参数尾递归 | ~1.3x | ~10x（尾调用 + 栈实参重写） | 15.3x |
| gc_low_live | 低存活集、大累计分配 | ~0.8x | ~0.95x（RSS 0.02x；GC 主判据） | 2.5x |
| gc_array_churn | 大对象 churn（Array COW） | ~1.7x | ~12.6x（RSS 2.7x；COW 复制是主成本） | 3.6x |

wasm 列的 `skipped` 是 V8 的 wasm 栈上限（非尾深递归），浏览器路径同样如此；wasm 的
绝对 ms、宿主启动地板与 RSS 口径见 [benchmarks.md §1.3](../docs/reference/benchmarks.md)。
OCaml 后端全部基准在 ~2× 手写 OCaml 内（最高的 `records` 约 2.1×）；native 的绝对值、峰值内存
与 `default_stack_ok` 见 [benchmarks.md](../docs/reference/benchmarks.md)。分配 / GC 统计由
OCaml 后端生成 runtime 的 `VN_PERF_STATS=1` 输出，`bench/run.sh` 采集进 JSON 的 `gc` 字段；
native 侧 GC 已落地（保守 mark-sweep）但无统计输出，只记峰值 RSS 与默认栈探针。死槽清零后
`gc_low_live` 的 RSS 降到 5 MiB（0.02x 手写），`gc_array_churn` 仍是 GC 相关的最差项
（COW 数组复制）。TCO 已覆盖直调、自递归 loop、饱和闭包、wrapper 与 runtime 符号；
判定与读数见 [benchmarks.md §1.2](../docs/reference/benchmarks.md)。

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
