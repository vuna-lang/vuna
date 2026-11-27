# native 自举（native selfhost）

本页是 native 自举的**可执行口径与读数**：`vuna-native`（把编译器自身编到 native 的产物）怎么产生、
它现在通过哪些检查、成本落在哪里。门禁清单与 scope 语义在
[testing-checks.md](testing-checks.md)「后端自举 conformance」；信任锚点与 rotation 在
[bootstrap.md](bootstrap.md)；后端实现与运行时见 [native.md](native.md) / [native-runtime.md](native-runtime.md)。

## 1. 两个层次

| 层次 | 判据 | 入口 |
| --- | --- | --- |
| 产物自举 | 编译器源码由同一套 DT 检查器与 codegen 编到 native，链接出自带运行时的二进制，能启动并执行编译器命令 | `nix build .#vuna-native` |
| conformance 自举 | 该二进制能自检整个 workspace，并在对拍 / 夹具上与 OCaml 编译器给出相同结果 | `nix run .#backend-check -- --compiler native` |

产物自举只证明「编译器能被 native 目标编出来并启动」；conformance 才证明「它能承担编译器的工作」。
两者当前不同步：产物自举通过，`selfhost` scope（整仓 `check .`）未通过（§4）。

信任锚点仍是 OCaml `seed/`：native 产物（`.s` 文件集）还没有参与 `stage1 == stage2`，
也没有独立的 native 种子轮换路径（gh#144，前提见
[bootstrap.md](bootstrap.md)「锚点演进」）。

## 2. 产物与平台前提

- `vuna-native` 派生（`nix/build/packages.nix`）：stage 1 先用 OCaml 编译器建后端插件
  `vuna-target-native` / `vuna-target-wasm`，再把 `packages/compiler` 编到 native，产出
  `bin/vuna-native` 加两个插件。源码输入取 `pkgDeps.compiler ++ pkgDeps.target-native ++
  pkgDeps.target-wasm`：插件的路径依赖（如 `vuna-obs`）必须随输入一起拷进去。
  `build-id` 是编译器源码闭包身份，`cache-tag` 是二进制摘要。
- 平台是 x86-64 Linux（SysV AMD64），静态链接、无 libc。构建期只需要 `cc` / `as` / `ld`；
  它们与 wasm 侧的 `wasm-tools` / `wasm-opt` 同属**构建期外部工具，不进 TCB、不进 seed**。
- 同一 IR 的 `.s` 文件集逐字节确定；ELF 字节只保证行为（依赖链接工具版本）。
- 编译器自身的 native 产物（`bench/baselines/artifacts.json` 的 `self` 用例，2026-11-22 基线；
  `nix run .#vuna-artifacts -- --target native --only self --check` 按基线判定漂移）：

  | 指标 | 读数 |
  | --- | --- |
  | `.s` 文件集 | 138 个文件 / 23.97 MB / 975,735 行 |
  | codegen | 12.4 s |
  | `cc` 工具链 | 1.6 s |

  2026-11-26 在同一命令形状上复测（`build --no-compile --target native packages/compiler`，
  冷对象库）：`.s` 仍是 **138 个文件 / 23.77 MB / 964,716 行**，codegen 用了 **648 s**。
  产物规模没变而耗时放大 ~50×，且插件进程全程单核满载——指向插件里新增的 IR 变换
  （`Inline` / `Specialize` / CSE）在编译器自身规模上的复杂度回退。648 s 已超过插件缺省
  300 s 超时，所以 `.#vuna-native` 派生显式设 `VUNA_PLUGIN_TIMEOUT=0`。

## 3. 复现

```console
nix build .#vuna-native --out-link result-native
nix run .#backend-check -- --compiler native --scope selfhost
nix run .#backend-check -- --compiler native --scope selfhost-stress
nix run .#backend-check -- --compiler native --scope parity --target ocaml,native --jobs 8
nix run .#backend-check -- --compiler native --scope corpus --jobs 8
```

`selfhost` 按成员逐包检查（进程隔离，`VUNA_BACKEND_SELFHOST_JOBS` 默认 1；
单成员 `VUNA_BACKEND_SELFHOST_TIMEOUT` 默认 1200 s，`0` = 不限）。`selfhost-stress` 是整仓
单进程的**成本读数**：超时 / 无 json 记 skip，不阻塞。parity / corpus 的单条命令仍是
`VUNA_BACKEND_TIMEOUT`（默认 240 s，`0` = 不限），超时按失败计。
已有二进制时可以直接跑 runner，不必经 `nix run`：

```console
VUNA_ALT_NATIVE=<out>/bin/vuna-native bash nix/tools/backend-check.sh --compiler native --scope selfhost
```

内存与回收形状用运行时的诊断开关观察（[native-runtime.md](native-runtime.md) §1.1）：
`VUNA_NATIVE_GC_LOG=1` 逐次打印 `live` / `gen`，以及归因用的 `span`（本次扫的栈字节）、
`segs` / `mapped`（段数与段区总字节）、`objs`（live 对象数）、`gcus`（累计回收微秒）；
`VUNA_NATIVE_MEM_LIMIT` 显式设成硬上限（整仓实验必须设，缺省会随 live 自动抬高）。

## 4. 当前读数

口径：12 核 / 27 GiB Linux；对象库冷（每项独立 `VUNA_STORE`）；下表的 native 读数取自
`43874ad` 重建的 `.#vuna-native`（`/nix/store/h5sp…`）。本页合入时 main 已前进到 `a4aa9ad`
（native codegen 的 T3 / 内联提交）；同机复测 `check packages/base` 为 2.3–2.7 s，与本表一致，
其余行未逐项复测。native 列不含 `VUNA_NATIVE_GC_LOG`，带诊断的读数在 §4.3 单独列。绝对值随
机器变化，跨机器只比同一轮的 native / OCaml 比值。

**读数必须绑定当轮二进制。** `result-native` 是共享 out-link：本轮开工时旧产物已经跑不动当前
源码（`Base/Thread/Par.vuna` 报 `RN_UnknownConstructor`）。`.#vuna-native` 的源码输入还要带上
后端插件包的依赖闭包（`target-native` / `target-wasm` 的 `vuna-obs` 这类路径依赖）。

### 4.1 整仓

| 运行 | 结果 | 墙钟 | 峰值 RSS | 形状 |
| --- | --- | --- | --- | --- |
| native `check . --error-format json`（单进程） | 未完成 | 902 s（超时） | 13.5 GB | live 11.4 GB / mapped 14.8 GB / 237 M live 对象 / 148 次回收 |
| native `check .`（文本格式，成员逐进程） | 通过，0 error | 402 s | 20 MB（父进程） | 15 个成员各自一个子进程 |
| OCaml `check . --error-format json` | 通过，0 error | 76 s | 640 MB | — |

逐成员形态（`selfhost` scope，`VUNA_BACKEND_SELFHOST_JOBS=2`，冷 store，`adbf25a` 的二进制）：
16 个成员合计 **655 s**（`toolchain` 543 s 与 `dev` 503 s 并发），单成员峰值 RSS 见 §4.2 的
5–6 GiB 档。
单进程未完成不是算错：同一份源码逐包与文本格式都 0 error。它是**单堆规模**——所有成员的接口与
中间态留在同一个堆里，后段 live 稳定在 10–11 GB（237 M 个对象，约 48 B/个），每次整堆回收都要
重扫这张堆；148 次回收累计 749 s，占墙钟 83%（§4.3）。门禁的 `selfhost` scope 用的是逐成员
进程形态（与文本格式同构），单进程那一行只作为 `selfhost-stress` 的读数保留。

### 4.2 逐包（冷 store）

OCaml 的峰值按**进程树**计（`vuna` 把命令派给 `vuna-toolchain` 子进程，只看路由进程会漏）。

| 包 | native ms | native 峰值 MiB | OCaml ms | OCaml 峰值 MiB | native / OCaml |
| --- | --- | --- | --- | --- | --- |
| `base` | 2678 | 456 | 414 | 176 | 6.5× |
| `compiler-base` | 3498 | 615 | 622 | 190 | 5.6× |
| `ir` | 4321 | 737 | 2270 | 186 | 1.9× |
| `target-ocaml` | 3290 | 659 | 619 | 11 | 5.3× |
| `obs` | 1027 | 193 | 418 | 15 | 2.5× |
| `plugin-kit` | 1237 | 211 | 416 | 11 | 3.0× |
| `http` | 1241 | 250 | 414 | 11 | 3.0× |
| `web` | 1441 | 317 | 414 | 11 | 3.5× |
| `target-native` | 13373 | 1637 | 3294 | 282 | 4.1× |
| `compiler` | 71587 | 6016 | 12973 | 406 | 5.5× |
| `web-cli` | 34366 | 3163 | 5959 | 344 | 5.8× |
| `plugin-web` | 34785 | 3317 | 6161 | 345 | 5.6× |
| `cli` | 4737 | 962 | 617 | 177 | 7.7× |
| `toolchain` | 473834 | 6398 | 24083 | 669 | 19.7× |
| `dev` | 511104 | 5837 | 22075 | 599 | 23.1× |

墙钟比多数包在 2–6×；`toolchain` / `dev` 是 19–23×。RSS 比更大（`compiler` 15×、
`toolchain` 9.6×），与 §4.3 的 live 集同向。`dev` 与本行的 `toolchain` 同量级，未单独复测。

### 4.3 GC 形状（`VUNA_NATIVE_GC_LOG=1`）

诊断行自身的开销只剩「段表遍历 + 一次 write」（`objs` 由清扫阶段顺带计数），与无诊断的墙钟差
在 5% 以内；`gcus` 是 `gc_collect` 内的累计时间，含这一次 write。

| 运行 | 墙钟 | 回收（full / minor） | live | mapped | live 对象 | 累计回收 | 占墙钟 | 栈跨度和 / 峰值 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `check packages/base` | 3.18 s | 22 / 68 | 138 MB | 481 MB | 2.53 M | 1.74 s | 55% | 1.4 MB / 210 KB |
| `check packages/compiler` | 72.6 s | 46 / 73 | 3.36 GB | 6.67 GB | 67.1 M | 43.6 s | 60% | 4.3 MB / 1.0 MB |
| `check packages/toolchain` | 450 s | 117 / 57 | 2.67 GB | 6.70 GB | 54.4 M | 360 s | 80% | 2.6 GB / 91 MB |
| 92 夹具 `compile --target native` | 572 s | 647 / 5,088 | 118 MB | 742 MB | 2.62 M | 415 s | 73% | **225 GB** / 147 MB |
| 整仓 `check . --error-format json` | 902 s（超时） | 74 / 74 | 11.4 GB | 14.8 GB | 237 M | 749 s | 83% | 2.0 GB / 91 MB |

平均对象 45–57 B。mapped/live 从整仓的 1.3× 到 92 夹具的 6.3×：回收时间跟着 live 与回收次数走，
不是按 mapped 走。

`92_eff_thread_mutex_cond` 的失败（corpus scope）在编译器侧复现：native 编译该夹具 572 s（无诊断
585 s）/ 912 MB，OCaml 42 s。它不靠大 live（只有 118 MB），而是 **5,735 次回收 × 平均 39 MB 栈跨度**
——累计保守扫栈 225 GB。深层递归的编译器阶段每次回收都按栈跨度保守扫描，这是 native 自举成本的主体。
- **多线程**：`clone` + futex 与 STW GC 可用；宿主持有态按线程隔离（状态槽 / cleanup 链在 TCB，
  路径等固定缓冲在每线程 scratch），阻塞的宿主 syscall 也发布停车标记；线程体仍是
  `Eff []`，宿主效应族要在 worker 体内显式装 handler（`runFsHost`，见
  [primitives.md](primitives.md) §6.2）。
- **能力面**：FFI / extern、stdin 的 `readLine` / `readBytes`、net 不在支持面；native 目标
  没有 entry 能力检查（gh#132）。
- **优化边界**：带捕获的高阶参数、部分应用 shim、逐点 `alloc` 调用仍按慢路径走（gh#92）；
  死槽清零给 `self` 产物带来约 1.5 MB 的文本体积成本（gh#90）。
- **oracle**：OCaml 后端退役后没有独立的语义 oracle，跨后端差分要靠 suite + wasm 交叉（gh#145）。

## 8. 相关页

- 门禁清单、scope 表与运行方式：[testing-checks.md](testing-checks.md)「后端自举 conformance」
- 种子策略、rotation、fixed point 与锚点前提：[bootstrap.md](bootstrap.md)
- 后端实现（IR 支持面、ABI、栈帧、优化 pass）：[native.md](native.md)
- 运行时（符号表、资源限制、两代 GC、已知边界）：[native-runtime.md](native-runtime.md)
- 未关闭的缺陷与缺口：[债务清单](https://github.com/vuna-lang/vuna/issues?q=label%3Adebt)