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
也没有独立的 native 种子轮换路径（[debt.md](debt.md) D106，前提见
[bootstrap.md](bootstrap.md)「锚点演进」）。

## 2. 产物与平台前提

- `vuna-native` 派生（`nix/build/packages.nix`）：stage 1 先用 OCaml 编译器建后端插件
  `vuna-target-native` / `vuna-target-wasm`，再把 `packages/compiler` 编到 native，产出
  `bin/vuna-native` 加两个插件。`build-id` 是编译器源码闭包身份，`cache-tag` 是二进制摘要。
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

## 3. 复现

```console
nix build .#vuna-native --out-link result-native
nix run .#backend-check -- --compiler native --scope selfhost
nix run .#backend-check -- --compiler native --scope parity --target ocaml,native --jobs 8
nix run .#backend-check -- --compiler native --scope corpus --jobs 8
```

单条外部命令默认 240 s 上限（`VUNA_BACKEND_TIMEOUT`，`0` = 不限），超时按失败计。
已有二进制时可以直接跑 runner，不必经 `nix run`：

```console
VUNA_ALT_NATIVE=<out>/bin/vuna-native bash nix/tools/backend-check.sh --compiler native --scope selfhost
```

内存与回收形状用运行时的诊断开关观察（[native-runtime.md](native-runtime.md) §1.1）：
`VUNA_NATIVE_GC_LOG=1` 逐次打印 `live` / `gen`；`VUNA_NATIVE_MEM_LIMIT` 显式设成硬上限。

## 4. 当前读数

口径：16 核 Linux，对象库冷（每项独立 `VUNA_STORE`），编译器取自当轮 `main`
（`1346340` → `b8d783b`）的 `.#vuna-native`；这三个提交不触及 `target-native` 与运行时。
绝对值随机器变化，跨机器只比同一轮的 native / OCaml 比值。

| 检查 | 结果 | 读数 |
| --- | --- | --- |
| `selfhost`（整仓 `check .`） | 未通过 | 默认 240 s 预算内超时（exit 124）；放宽到 20 min 仍未完成，RSS 峰值 21.4 GB，对象库对象写到 643 个（同一整仓用 OCaml 编译器写 755 个）；在 `b8d783b` 上复核 300 s 仍未完成 |
| `parity`（89 个 `pure_cross` × ocaml+native） | 通过 | 178 / 178，8 路并行 5m36s |
| `corpus` | 1 条失败 | 892 passed / 1 failed / 57 skipped（跳过的工具链 / packages 家族按 scope 口径不计）；失败项是 `effect/native/92_eff_thread_mutex_cond` 在 240 s 内未完成 |

对照：同一整仓 `check . --error-format json` 用产品 CLI（OCaml 后端）是 **90 s / 峰值 726 MB / 0 error**。

逐包 `check`（每个包独立对象库，即检查该包闭包；`dev` / `toolchain` 是在依赖已检查过的
同一 store 上仍跑不完的读数）：

| 包 | native | OCaml |
| --- | --- | --- |
| `base` | 4 s | 0.8 s |
| `target-native` | 49 s | 5 s |
| `compiler` | 73 s | 11 s |
| `plugin-web` | 180 s | 7 s |
| `dev` | >400 s（未完成） | 36 s |
| `toolchain` | >400 s（未完成） | 29 s |

`92_eff_thread_mutex_cond` 的失败可以在编译器侧复现：用 `vuna-native build --target native`
构建该夹具 3.5 min 未结束（RSS 1.4 GB）；同一个夹具用 OCaml 编译器构建后连跑 5 次全部通过，
所以不是夹具或 native 运行时的死锁，而是 native 编译这条构建路径上的成本。

## 5. 成本落在哪里

两层放大叠加在同一个进程里：

1. **单进程整仓检查**：`--error-format json` 按进程内顺序检查、不分包（文本格式才按成员包
   `processSpawn`），所有包的接口与中间态留在同一个堆里。逐包检查都通过，说明不是算错，
   而是堆的规模。
2. **GC 预算随 live 抬高**：缺省 `VUNA_NATIVE_MEM_LIMIT = max(1 GiB, 2 × live + 256 MiB)`，
   回收阈值是 `max(GC_MIN, 2 × live, 栈跨度)`（[native-runtime.md](native-runtime.md) §1.1 / §1.2）。
   live 越大，每次整堆回收扫的堆越大；回收又是非移动、逐帧保守扫根，已死对象只要还被栈槽
   指着就留在 live 里。

`VUNA_NATIVE_GC_LOG=1 check packages/base` 的形状：`live` 单调爬升（约 117 → 146 MB），
minor 回收频繁、整堆周期把 live 再抬一档。整仓 RSS 到 21 GB 时，单次整堆回收要扫的存活集
随之变大，时间与内存就这样互相锁住。

## 6. 门禁地位

- `vuna-native` 与 `backend-check` **不在 `nix flake check` 里**：整轮成本远高于日常门禁。
- CI 只在每夜定时、手动 dispatch、带 `backend` 标签的 PR 上跑 `--scope all`，且 job 是
  `continue-on-error`（`.github/workflows/ci.yml` 的 `backend-native`）。
- push 路径上的 native 覆盖由 `vuna-tests-native` 承担：suite 的 native 矩阵，181 个 case
  （对照：ocaml 1073、wasm 170）。
- `checks.seed-selfhost` 只读 OCaml `seed/`，与 native 产物无关。

所以 `selfhost` 失败不会挡住日常提交，也不会出现在 push 的 CI 结论里。§4 的读数要按 §3 的命令复测。

## 7. 已知边界

- **效应**：续延是一次性（multi-shot 不做）；延迟 answer 的 handler 在机器路径不工作
  （native `impossible branch`，[debt.md](debt.md) D101）；`handleState` 这类 answer 类型是
  函数的库 handler 三端不一致（D114）。
- **多线程**：`clone` + futex 与 STW GC 可用；宿主持有态按线程隔离（状态槽 / cleanup 链在 TCB，
  路径等固定缓冲在每线程 scratch），阻塞的宿主 syscall 也发布停车标记；线程体仍是
  `Eff []`，宿主效应族要在 worker 体内显式装 handler（`runFsHost`，见
  [primitives.md](primitives.md) §6.2）。
- **能力面**：FFI / extern、stdin 的 `readLine` / `readBytes`、net 不在支持面；native 目标
  没有 entry 能力检查（DR-05）。
- **优化边界**：带捕获的高阶参数、部分应用 shim、逐点 `alloc` 调用仍按慢路径走（D129）；
  死槽清零给 `self` 产物带来约 1.5 MB 的文本体积成本（D133）。
- **oracle**：OCaml 后端退役后没有独立的语义 oracle，跨后端差分要靠 suite + wasm 交叉（D107）。

## 8. 相关页

- 门禁清单、scope 表与运行方式：[testing-checks.md](testing-checks.md)「后端自举 conformance」
- 种子策略、rotation、fixed point 与锚点前提：[bootstrap.md](bootstrap.md)
- 后端实现（IR 支持面、ABI、栈帧、优化 pass）：[native.md](native.md)
- 运行时（符号表、资源限制、两代 GC、已知边界）：[native-runtime.md](native-runtime.md)
- 未关闭的缺陷与缺口：[debt.md](debt.md)