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
两者现在都通过：`selfhost` scope（逐成员 `check`，§4.1）16/16 通过、0 error，整仓 `check .`
（文本格式，成员逐进程）也 0 error。

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
- 编译器自身的 native 产物（`bench/baselines/artifacts.json` 的 `self` 用例；
  `nix run .#vuna-artifacts -- --target native --only self --check` 按基线判定尺寸漂移）：

  | 指标 | 读数（12 核，冷对象库） |
  | --- | --- |
  | `.s` 文件集 | 142 个文件 / 42.66 MB（含 `build.sh` 与对象目录）/ 1,905,169 行 |
  | codegen（`build --no-compile`） | 15.7 s；同机 OCaml 目标 8.9 s ⇒ **1.77×** |
  | `cc` 工具链 | 1.6 s |

  codegen 的判据是**同机比值**而不是绝对秒数：`checks.vuna-native-codegen-budget` 在同一个
  driver 二进制下各跑一次 `--target native` / `--target ocaml`，比值 ≤3 才算通过。
  逐段的 pass 读数用 `VUNA_OBS=1 vuna build --no-compile --target native packages/compiler`
  ＋ `vuna dev obs summarize`：`native.emit` 2.3 s、`native.init` 1.2 s、`native.specialize`
  0.64 s、两遍 `native.inline` 各 0.39 s，其余各段 <0.2 s。插件的 pass 链也可以脱离整条
  编译命令单独重跑（`VUNA_KEEP_PLUGIN_IR=1` 保留载荷后直接调 `vuna-target-native`）。

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

codegen（后端插件）的读数不必每次重建整条链：`VUNA_KEEP_PLUGIN_IR=1` 让编译器保留
`<out>/.vuna-ir-<target>` 载荷，之后直接跑插件就能复现插件侧的全部耗时与产物：

```console
VUNA_KEEP_PLUGIN_IR=1 vuna build --no-compile --target native packages/compiler --out OUT
VUNA_OBS=1 vuna-target-native --ir OUT/.vuna-ir-native --out OUT2 --print
vuna dev obs summarize <VUNA_OBS_DIR>/vuna-*.jsonl
```

`VUNA_OBS=1` 下每条 `vuna.pass.native.*` 是一段：16 步变换之外，可达性收尾
（`native.reach`）、形参区间不动点（`native.params`）、作用域校验（`native.validate`）、
代码发射（`native.emit`）与入口装配（`native.init`）各占一段，所以份额能闭合到墙钟。
校验缺省只跑首末两步；`VUNA_STAGE_CHECK=all` 打开全量（每步之后都跑 scoped 校验）。
CI 的 PR 增量档（`checks.vuna-native-conformance-pr`）设 `all`：在编译器自身的 codegen 上
全量比缺省只多约 2–3 % 墙钟（`vuna.pass.native.validate` 从 ~40 ms 涨到 ~230 ms，
`VUNA_OBS=1` 下插件整段 6.11 s → 6.28 s；插件进程墙钟 8.69 s → 8.90 s），
换来每一步的形状回归都当场报出来。

内存与回收形状用运行时的诊断开关观察（[native-runtime.md](native-runtime.md) §1.1）：
`VUNA_NATIVE_GC_LOG=1` 逐次打印 `live` / `gen`，以及归因用的 `span`（本次扫的栈字节）、
`segs` / `mapped`（段数与段区总字节）、`objs`（live 对象数）、`gcus`（累计回收微秒）；
`VUNA_NATIVE_MEM_LIMIT` 显式设成硬上限（整仓实验必须设，缺省会随 live 自动抬高）。

## 4. 当前读数

口径：12 核 / 27 GiB Linux，**全冷**（每项独立 `VUNA_STORE` + 独立 `VUNA_PKG_STATE`，
`VUNA_OBS=0`、`VUNA_LOG` 未设）；native 列取自 `.#vuna-native`（`vuna-native check <pkg>`），
OCaml 列取自同源码的 `.#vuna`（`vuna check <pkg>`）。两列**同一窗口交替**测量，
单独进程、无并行。绝对值随机器与源码规模变化，**跨机器只比 native / OCaml 比值**。

`VUNA_PKG_STATE` 不隔离时读数会低一大截：包内的 `.vuna/iface` 留着依赖包的接口，
`check` 于是只精化本包（`toolchain` 从 86 s 落到 13 s），那是另一种口径，不要混。

**读数必须绑定当轮二进制。** `result-native` 是共享 out-link，可能指向上游旧产物：
本轮开工时它已经跑不动当前源码（`Base/Thread/Par.vuna` 报 `RN_UnknownConstructor`）。
`.#vuna-native` 的源码输入还要带上后端插件的依赖闭包（`target-native` / `target-wasm` 的
`vuna-obs` 这类路径依赖），否则插件找不到自己的依赖。

### 4.1 整仓

逐成员形态（`selfhost` scope，`VUNA_BACKEND_SELFHOST_JOBS=2`，冷 store）：

| 运行 | 结果 | 成员合计 | 最慢成员 |
| --- | --- | --- | --- |
| native `check <member> --error-format json` | 16/16 通过，0 error | **296 s** | `plugin-web` 101 s（`dev` 71 s、`compiler` 56 s 次之） |
| OCaml 同命令（同源码、`.#vuna`） | 通过，0 error | 约 115 s（16 成员逐包之和） | — |

单进程整仓（`selfhost-stress`）仍是**单堆规模**问题：所有成员的接口与中间态留在同一个堆里，
后段 live 到 10 GB 量级（237 M 个对象，约 48 B/个），每次整堆回收都要重扫这张堆。所以门禁的
`selfhost` scope 用逐成员进程形态（与文本格式同构），单进程那一行只作成本读数保留。

### 4.2 逐包（全冷，同窗口交替）

| 包 | native ms | OCaml ms | native / OCaml |
| --- | --- | --- | --- |
| `base` | 2406 | 360 | 6.7× |
| `compiler-base` | 5479 | 721 | 7.6× |
| `ir` | 15144 | 2575 | 5.9× |
| `target-ocaml` | 19382 | 2885 | 6.7× |
| `obs` | 2919 | 461 | 6.3× |
| `plugin-kit` | 3175 | 483 | 6.6× |
| `http` | 3264 | 498 | 6.6× |
| `web` | 4379 | 626 | 7.0× |
| `target-native` | 31122 | 4334 | 7.2× |
| `compiler` | 56558 | 7281 | 7.8× |
| `web-cli` | 68992 | 8738 | 7.9× |
| `plugin-web` | 80646 | 9927 | 8.1× |
| `cli` | 65676 | 9655 | 6.8× |
| `toolchain` | 85902 | 11223 | 7.7× |
| `dev` | 129180 | 15195 | 8.5× |

比值集中在 5.9–8.5×：小包是固定成本（进程启动 + 解析 + 接口摘要）之比，大包是「同一份
精化 + 同一份 codegen 检查」在 native 运行时上跑出来的比值。**指令质量不是主因**
（`benchmarks.md` §1.1 的生成程序基准里 native vs vuna-OCaml 后端是 1.2–2.8×），差距在
运行时：分配吞吐与 GC（§4.3）。

同一份口径下的历史读数（`adbf25a` 的二进制、`43874ad` 起的一轮）是 `toolchain` 473 s /
`dev` 511 s / `compiler` 72 s：本轮 codegen 与 GC 侧的改动把它压到 86 s / 129 s / 57 s。

### 4.3 GC 形状（`VUNA_NATIVE_GC_LOG=1`）

诊断行自身的开销只剩「段表遍历 + 一次 write」（`objs` 由清扫阶段顺带计数）；`gcus` 是
`gc_collect` 内的累计时间。全冷、单进程，与 §4.2 同一轮二进制：

| 运行 | 墙钟 | 回收（full / minor） | live | mapped | live 对象 | 累计回收 | 占墙钟 | 栈跨度和 / 峰值 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| `check packages/base` | 2.4 s | 18 / 81 | 126 MB | 403 MB | 1.95 M | 1.35 s | 56% | 0.5 MB / 24 KB |
| `check packages/compiler` | 56 s | 35 / 100 | 2.49 GB | 5.29 GB | 47.8 M | 30.4 s | 54% | 3.5 MB / 1.5 MB |
| `check packages/toolchain` | 87 s | 40 / 127 | 4.53 GB | 8.57 GB | 89.3 M | 52.2 s | 60% | 1.2 MB / 0.2 MB |

平均对象 50–57 B，mapped/live 1.9–2.1×。回收成本由三项组成，都是**同一份字级常数**乘上去的：

1. **标记与扫栈**：`gc_try` 对每个候选机器字付 ~12 次内存访问 + 一次 `seg_find` 二分；
   `gc_scan_words` 又把游标放在 `.bss`（每个字多 4 次访问 + 一次 call/ret）。full 回收要
   遍历 live 的全部 payload 字，所以 `full 次数 × live` 就是这条轴的总量。
2. **清扫与卡片**：`gc_sweep` 逐段逐**块头**前进（成本 ∝ mapped），死块还要按 `shl` 循环
   重算尺寸类再前插；minor 的卡片表逐段扫 `size/512` 字节。死块留在段里不回收 ⇒ mapped 只
   增不减 ⇒ 这两项一起被放大。
3. **span 不再是主因**：阈值里的 `span` 项（`max(gcMin, live/8, 栈跨度)`）会把深递归阶段的
   回收推稀，换来的是每次回收更贵；本轮的累计扫栈只有 MB 级。深递归 + 中等 live 的形状
   （`92_eff_thread_mutex_cond`：5735 次回收 × 39 MB 跨度和）仍然存在，属于这条轴的极端端。

## 7. 已知边界与优化边界



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
