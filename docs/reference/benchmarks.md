# 生成程序基准

`vuna-perf` 测**生成程序**的运行时（编译器 / 工具链自身墙钟见
[compiler-benchmarks.md](compiler-benchmarks.md)，命令耗时与编译热点也都在那里）。后端实现见
[native.md](native.md)、[wasm.md](wasm.md)。

## 1. `vuna-perf` 读数

`nix run .#vuna-perf`（逻辑在 `bench/run.sh`）测**生成程序运行时**：每个 benchmark 是一对
同算法实现（`bench/programs/t<N>/<name>/<name>.vuna` vs 同目录 `<name>.ml` 手写 OCaml），
`t<N>` 是机制分层（见 [`bench/programs/TIERS.md`](../../bench/programs/TIERS.md)）；先校验
两侧输出与 golden 一致，再 warmup + 多次取中位数；`--target ocaml|native|both` 选择被测后端，峰值内存
用 GNU time 的 max RSS。跨机器只比 `ratio = <backend>/ocaml` 与 `rss_ratio`
（绝对 ms / KB 不可比）。

口径与基线维护见 `bench/README.md`；基线统一在 `bench/baselines/`：`programs.json` 一份
（全部生成程序 × ocaml/native/wasm），`--check` 只比本次实际跑的 target / benchmark。
与 `bench/bootstrap.sh` 的分工：后者测构建 / 编译墙钟与产物尺寸，本设施测运行期。

当前读数（`--runs 3 --warmup 1`，x86_64 / 16 核 / ocamlopt 5.5.1 非 flambda；绝对 ms 随
机器变化，只比较 ratio）：

| benchmark | 场景 | ratio | 优化手段 |
| --- | --- | --- | --- |
| arith | Int 算术 + 尾递归 | ~1.2x | 饱和内联 + 多参数 lambda 链 |
| string_ops | 字符串拼接 / repeat / substring | ~1.3x | `++` 链 / `strPack` 批拼为一次 `String.concat`；`strSubstring` + `repeat` 一次 `strConcatMany` |
| hashmap | 持久哈希表 + 字典派发 | ~2.0x | 桶改 `Array`（`Array.get` O(1) + copy-on-write） |
| list_recursion | List 非尾递归 / fold / append | ~0.8x | 已达标 |
| gc_pressure | 分配压力（字符串 churn） | ~1.2x | 已达标 |
| array | 不可变 Array（get / set / length） | ~0.9x | 不可变 `Array` 与手写 OCaml 持平 |
| records | record 更新 + variant 分派 | ~2.1x | record 直接映射 OCaml record；多字段更新无额外分配 |
| closures | 高阶函数 / 每次迭代新建闭包 | ~1.4x | 多参数 lambda 链 + 饱和调用直调 |
| sorting | 归并排序（List + Pair 拆半） | ~1.5x | List 单元与模式匹配与手写一致 |
| float_math | Float 算术 / sqrt / abs / 转换 | ~1.9x | 浮点内建；盒装表示与 OCaml 相同 |
| text_scan | 逐字节 `strAt` 扫描 | ~1.5x | `strAt` 直调原语，不经 List 桥接 |
| nat_bits | Nat 饱和算术 + 63-bit 位运算 | ~1.3x | Nat 运行时即 Int；位运算内建 |
| tco_mutual | 互递归（`even`/`odd`） | ~1.1x | 尾调用在 OCaml 侧直接复用栈帧 |
| tco_wide | 9 参数尾递归（3 个栈参数） | ~1.0x | 尾调用与栈传参 ABI 由 ocamlopt 处理 |
| micro_tco | 最小自递归尾调用 | ~1.0x | 旋转后的 loop header + 比较直发分支 |
| tco_args | 交叉依赖实参的尾递归 | ~1.1x | 实参按需落临时槽 + 统一写回 |
| tco_unrotated | 双支自调用 / `&&` 条件 | ~1.0x | 不旋转时回退整帧 `jmp` |
| tco_arity6 | 6 参尾递归（全走寄存器） | ~1.1x | 5 个热标量槽提升 |
| tco_narrow_wide | 2 参 ↔ 10 参窄调宽 | ~1.1x | native 回退普通 `call`（已知缺口，见 §1.2） |
| tco_nat | Nat 结构递归尾调用 | ~1.6x | `IrNatCase` 的尾位置传播 |
| state_machine | 9 状态 Int 分支链 | ~1.4x | 线性比较链 + `_` 兜底臂 |
| gc_low_live | 低存活集、大累计分配 | ~0.8x | OCaml GC 回收；vuna 侧只有 bump 分配 |
| gc_array_churn | 大对象 churn（Array COW） | ~1.7x | `Array.set` COW 与手写 `Array.copy` 对齐 |
| gc_retain | 高存活集（live ~19 MB）+ 等量 churn | ~1.9x | 整堆回收要重扫整个存活集；整堆触发策略的测量项 |

场景覆盖：数值 / 字符串 / 容器 / 分配 / 数组 / 记录与变体 / 高阶函数 / 算法 / 浮点 /
逐字节文本 / Nat 与位运算 / 尾调用与分支链 / GC。新增场景按机制归入 `bench/programs/t<N>/`，
清单见 [`bench/programs/TIERS.md`](../../bench/programs/TIERS.md)。

关键设计决策与改动（`packages/target-ocaml/lib/Vuna/Target/Ocaml/Term.vuna`、`Base.Intrinsics` / `Elab.Prelude` / `Target.Ocaml.Decl` 与
`packages/base/`）：

1. **codegen / 运行时改进**：
   1. **内建饱和应用内联**：`+ - * /`、比较 / 相等特化、`&& ||`、`++` 直接生成 OCaml
      运算符表达式；部分应用 / 高阶引用仍走 runtime 函数。
   2. **多参数 lambda 链**：连续 `TLam` 合并成 `(fun x y -> body)`，擦除 binder 只占 de Bruijn
      位置；消除 curried 递归的每轮闭包分配。
   3. **`++` 链展平**：`a ++ b ++ c` 生成 `(String.concat "" [a; b; c])`；`strPack` / `dtp_pack`
      改 `Array.of_list`；`Base.Data.List.concatMap` 改尾递归 accumulator；`Base.Data.String.join` /
      `unlines` 改一次 `strConcatMany`。
   4. **GC 统计**：生成 runtime 支持 `VN_PERF_STATS=1`（退出打印 `Gc.quick_stat` 的
      minor/major words、collections、top_heap_words），`bench/run.sh` 采集进 JSON。
2. **字符串与可变数据**：`strSubstring` 原语（runtime `String.sub` + clamp 语义；核心求值也
   归约 `OpStrSubstring`），`Base.Data.String.substring` 不走 List 桥接；`Base.Data.String.repeat` 改一次
   `strConcatMany`；可变数据（`IORef`）保持 `Eff []` 隔离，不引入线性
   类型（见 [qtt.md](qtt.md) / [effects.md](effects.md) 与 debt D22）。
3. **容器与表示**：
   1. **内建类型构造子** `Array` / `IORef`（类型层，恒可见；OCaml 表示 `'a array` / `'a ref`），
      签名支持隐式 `{a : Type}`。
   2. **Array / IORef 原语与库**（见 [primitives.md](primitives.md) §6.1、
      [stdlib.md](stdlib.md)）；`arrayEmpty` 用 non-expansive 的 `[||]` 让空表在 OCaml 侧可泛化。
   3. **HashMap 桶改造与泛型化**：`Array (Array (List ...))`；`HashMap k v` 统一 String/Int
      两套容器（无 `IntMap`），统一 `fromList []`。

优化后跑 `sh bench/update-baselines.sh --only programs` 重标并在这里记录。

### 1.1 native 后端（生成程序）

`nix run .#vuna-perf -- --target native`（或 `--target both`）把同一批基准编到 native
并测量；基线 `bench/baselines/programs.json`（同一份含三端）。口径：

- 同一份源码、同一 N；native、OCaml 后端与手写 OCaml 在同一窗口交替测量；
- native 只有**直接饱和尾调用**复用栈帧；非尾深递归吃入口自带栈（`_start` 默认 mmap
  512 MiB 虚拟栈，`VUNA_NATIVE_STACK_MB` 覆盖，与 `ulimit -s` 无关），JSON
  `meta.stack_policy` 记为 `self-managed`。每个 native 项另记 `default_stack_ok`
  （8 MiB soft limit 下能否正常退出，探针不参与计时；自带栈生效时应恒为 true）；
- native 有**两代标记-清扫 GC**（[native.md](native.md) §5.2），峰值 RSS = 已触碰的栈页 + live 堆
  （自带栈未触碰的虚拟页不提交）；
  `--rss-passes 3` 取最大值，与墙钟分开采样；
- `--runs 5 --warmup 2` 取中位数；基线记录生成时的 `meta.loadavg`，跨机器只比 ratio。

本机一档（16 核，`6117ce8`，生成时 `loadavg ≈ 0.36`，同一窗口）：

| benchmark | native ms | OCaml 后端 ms | 手写 OCaml ms | native/手写 | native/OCaml 后端 | native RSS | 手写 RSS | RSS 比 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| arith | 8 | 5 | 5 | 1.60x | 1.60x | 0.4 MiB | 2.5 MiB | 0.15x |
| string_ops | 3 | 4 | 3 | 1.00x | 0.75x | 0.8 MiB | 3.1 MiB | 0.24x |
| hashmap | 8 | 7 | 4 | 2.00x | 1.14x | 4.0 MiB | 4.0 MiB | 0.99x |
| list_recursion | 24 | 10 | 13 | 1.85x | 2.40x | 19.8 MiB | 11.3 MiB | 1.74x |
| gc_pressure | 39 | 30 | 26 | 1.50x | 1.30x | 32.8 MiB | 11.2 MiB | 2.93x |
| array | 21 | 15 | 16 | 1.31x | 1.40x | 27.4 MiB | 15.5 MiB | 1.77x |
| records | 20 | 14 | 7 | 2.86x | 1.43x | 1.0 MiB | 4.7 MiB | 0.21x |
| closures | 23 | 11 | 9 | 2.56x | 2.09x | 24.2 MiB | 8.6 MiB | 2.81x |
| sorting | 36 | 20 | 18 | 2.00x | 1.80x | 16.2 MiB | 9.4 MiB | 1.72x |
| float_math | 9 | 13 | 7 | 1.29x | 0.69x | 1.0 MiB | 4.5 MiB | 0.22x |
| text_scan | 5 | 5 | 4 | 1.25x | 1.00x | 3.4 MiB | 3.5 MiB | 0.98x |
| nat_bits | 6 | 6 | 4 | 1.50x | 1.00x | 0.4 MiB | 2.5 MiB | 0.15x |
| tco_mutual | 8 | 5 | 4 | 2.00x | 1.60x | 0.4 MiB | 2.4 MiB | 0.16x |
| tco_wide | 6 | 4 | 4 | 1.50x | 1.50x | 0.4 MiB | 2.6 MiB | 0.15x |
| gc_low_live | 218 | 285 | 339 | 0.64x | 0.76x | 2.8 MiB | 244.5 MiB | 0.01x |
| gc_array_churn | 140 | 183 | 112 | 1.25x | 0.77x | 3.1 MiB | 82.1 MiB | 0.04x |
| gc_retain | 160 | 75 | 38 | 4.21x | 2.13x | 55.2 MiB | 19.4 MiB | 2.85x |

读法：

- **arith 曾是 67.6x / 412 MiB**：300 万层递归帧不回收，时间花在栈页 fault 而不是指令质量。
  它的递归主体是**直接饱和尾调用**；标量内联、常数除法展开与条件直发分支把循环体压成
  `cmp` / `jg` + 全内联算术：当前 8 ms / 0.4 MiB（手写 5 ms，1.60x；§1.2）。
- **native/OCaml 后端 1.0–2.5x 的一档**：`string_ops` / `hashmap` / `list_recursion` / `gc_pressure` / `array` / `records` / `closures` / `sorting` / `text_scan` / `nat_bits`；`closures`（2.09x）与 `records`
  （1.43x）的差距来自闭包/对象表示、非尾递归与「所有中间值占栈槽」的朴素 codegen
  （闭包调用不在尾调用覆盖面内，见 [native.md](native.md) §3）。
- **相对手写对照 2.5x 以上的一档各有明确的单一来源**：`records` 曾是 80 万层尾递归帧 +
  每步 record 分配 + 闭包-per-`let`（TCO 后 20 ms / 1.0 MiB，2.86x）；`closures`
  23 ms（2.56x）是函数参数只能在运行时按 arity 分派；`gc_retain` 在 GC 侧（整堆重扫
  存活集，见下）。浮点曾是每次运算的装箱对象（11.43x）：字面量常量化 + 表达式树在
  `xmm` 上算完、根只装盒一次之后 9 ms（1.29x）。
- `tco_mutual` / `tco_wide` 曾经几乎全是**栈帧成本**（RSS 与墙钟随递归深度线性增长、
  `default_stack_ok=false`）；TCO 后 8 / 6 ms、0.4 MiB、`true`（§1.2）。
- 零参别名直调（`Nat.plus` / `Nat.mult` / `Nat.toInt` …）、闭包只捕获自由变量与调用点
  去虚拟化之后，`nat_bits` 的 native / 手写 OCaml 是 1.50x；剩余差距是函数参数这种
  只能在运行时按 arity 分派的调用面。
- **GC 的主判据已成立**：逐帧保守扫根会把帧内**已死**的指针槽当成根（`gc_low_live` 的
  `churn` 每帧用完 `xs` / `s` 之后递归），`Native.Live` 在递归 / 带回边的函数里对指针槽
  在最后一次读之后写 0（[native.md](native.md) §3），死对象当轮即可回收：
  `gc_low_live` 218 ms / 2.8 MiB、`gc_array_churn` 140 ms / 3.1 MiB（手写侧 244.1 / 82.2 MiB）；
  对照「按精确槽集扫描」时期的 231 / 3.6 与 138 / 3.9 MiB，墙钟只差一点、RSS 落回存活集量级。
  `gc_pressure` 32.8 MiB 与 `gc_retain` 55.2 MiB（live 单调上升到 ~19 MB）仍符合预期，
  是 `VUNA_NATIVE_GC_LOG` 里 `gen=` 分布的测量项（[native.md](native.md) §5.2）。
- 峰值 RSS 的语义：OCaml 侧是 GC 后高水位，native 侧是栈页 + live 堆；两者只作量级参考。
- 这组数不是 CI 门槛：跨机器、跨负载不可比；回归判断用 `--target native --check` 对
  `bench/baselines/programs.json` 的 ratio、rss_ratio、artifact 与 `default_stack_ok` 变化做提示。

### 1.2 TCO / GC 验证项

native 的 TCO / GC 验证项。**GC 与 TCO 均已落地**；下表「前」列取 §1.1 的 TCO 前快照，
「后」列是 `--target both --runs 5 --warmup 2 --only <name>` 的实测（与 §1.1 同口径）：

| 用例 | TCO 前（旧 N） | TCO 后实测（当前 N） | 判定列 |
| --- | --- | --- | --- |
| `tco_mutual`（N=20M） | 189 ms / 244 MiB / `default_stack_ok=false` | 30 ms / 0.4 MiB / `true` | wall, rss, stack |
| `tco_wide`（N=5M） | 343 ms / 442 MiB / `false` | 13 ms / 0.4 MiB / `true` | wall, rss, stack |
| `arith` | 338 ms / 412 MiB / `false` | 8 ms / 0.4 MiB / `true` | wall, rss, stack |
| `records` | 151 ms / 151 MiB / `false` | 20 ms / 1.0 MiB / `true` | wall, rss, stack |
| `tco_narrow_wide`（N=1M） | — | 136 ms / 150 MiB / `true` | rss, wall（窄调宽回退） |

「TCO 前」是旧 N 的历史快照；`tco_mutual` / `tco_wide` 的 N 已抬到 20M / 5M，
「后」列与当前 fixture 同 N。

- **TCO**：判据是 `default_stack_ok` 由 false 翻为 true，且 RSS 从百 MB 降到进程基线
  （~0.4 MiB）；上表前四项都满足。`arith` / `records` 也翻真，说明它们的递归主体同样是
  **直接饱和尾调用**；`tco_wide` 覆盖 9 参（3 个栈实参）的自递归。`tco_narrow_wide`
  是反向对照：`default_stack_ok` 仍为 true（自带栈生效），但窄调宽的调用回退成普通
  `call`，RSS 随层数线性涨（1M 层 ~150 MiB）——这是待消掉的 native 优化缺口，不是栈策略
  失效。
- **T2 覆盖矩阵**（每项锁一条生成路径；`micro_tco` 是层内基线）：

  | 用例 | 形状 | 锁住的生成路径 / 判定 |
  | --- | --- | --- |
  | `micro_tco` | 单函数自递归 + 标量比较 | 旋转后的 loop header、自递归实参写回 |
  | `tco_mutual` | `even` / `odd` 互递归 | 全局饱和直调（不旋转） |
  | `tco_wide` | 9 参（3 个栈实参） | 来参区搬运；`arity > 6` 不提升 |
  | `tco_args` | 交叉依赖实参 | 临时槽 + `copyBacks` 的写回顺序（golden） |
  | `tco_unrotated` | 两支自调用 / `&&` 条件 | 不旋转时回退整帧 `jmp` |
  | `tco_arity6` | 6 参全部循环携带 | 5 个热标量槽提升的上限 |
  | `tco_narrow_wide` | 2 参 ↔ 10 参互递归 | 窄调宽回退普通 `call`（native 1M 层 RSS ~150 MiB） |
  | `tco_nat` | Nat `zero` / `Succ` | `IrNatCase` 的尾位置传播 |
  | `state_machine` | 9 状态 Int 分派 | 线性比较链 + `_` 兜底臂 |
- **GC**：主判据是 RSS 落在存活集量级，四项都满足——`gc_low_live` 218 ms / 2.8 MiB、
  `gc_array_churn` 140 ms / 3.1 MiB、`gc_pressure` 32.8 MiB、`gc_retain` 55.2 MiB。
  `gc_low_live` / `gc_array_churn` 此前的不满足来自逐帧保守扫根把陈旧栈槽里的死对象一并留住；
  `Native.Live` 的死槽清零（[native.md](native.md) §3）把两项拉回存活集量级。
  `VUNA_NATIVE_GC_LOG=1` 可逐次看 `live` / `gen`。两代回收里年轻代只扫根集与脏卡片、
  整堆回收按计数轮换（见 [native.md](native.md) §5.2）；阈值取 `max(GC_MIN, live/8, 栈跨度)`
  （年轻代）与 `max(GC_MIN, 2 × live, 栈跨度)`（整堆）摊销扫栈成本；栈帧整段保守扫。
- 重标基线时 `default_stack_ok` 是布尔快照：自带栈生效时所有项都应为 true（包括非尾深
  递归）；false 说明 `init_stack` 回落到了进程栈。非尾深递归的栈帧成本仍体现在 RSS 与
  墙钟上——窄调宽与 `rt_apply` 慢路径仍回退普通调用。

### 1.3 wasm 后端（浏览器路径：JS 宿主 / V8）

wasm 产物由仓库自带的宿主执行（`wasm-host/run.mjs`，Node/V8；与浏览器同一套
`WebAssembly` API 和 host 层）。`--target wasm`（或 `--target all`）跑同一批程序
（另有 9 个效应基准与 `startup` / `traits` 见 §1.4）。

> **读数来源**：`bench/baselines/programs.json`（`--target all --runs 5 --warmup 2`；
> node v24.21.0、wasm-opt 133）。t2 行按当前基线，其余行沿用上一轮快照。
> wasm 列是 `median_ms`（含 ~22 ms 宿主启动）；减掉 `meta.node_startup_ms` 的净耗时见
> JSON 的 `wasm.net_median_ms`。

本机一档（绝对 ms / RSS 只作同机对比）：

| benchmark | wasm ms | native ms | OCaml 后端 ms | 手写 ms | wasm/手写 | native/手写 |
| --- | --- | --- | --- | --- | --- | --- |
| arith | 37 | 16 | 6 | 5 | 7.4x | 3.2x |
| float_math | 36 | 66 | 13 | 7 | 5.1x | 9.4x |
| hashmap | 52 | 11 | 9 | 5 | 10.4x | 2.2x |
| hashmap_remove | 106 | 102 | 35 | 5 | 21.2x | 20.4x |
| micro_apply | 51 | 28 | 9 | 8 | 6.4x | 3.5x |
| micro_concat | 97 | 23 | 33 | 16 | 6.1x | 1.4x |
| nat_bits | 33 | 7 | 5 | 4 | 8.2x | 1.8x |
| priority_queue | 56 | 28 | 18 | 10 | 5.6x | 2.8x |
| queue | 51 | 10 | 8 | 4 | 12.8x | 2.5x |
| records | 69 | 32 | 15 | 8 | 8.6x | 4.0x |
| sort_lib | 78 | 25 | 20 | 7 | 11.1x | 3.6x |
| string_ops | 28 | 3 | 3 | 3 | 9.3x | 1.0x |
| micro_tco | 59 | 17 | 14 | 13 | 4.5x | 1.3x |
| tco_mutual | 69 | 30 | 14 | 13 | 5.4x | 2.3x |
| tco_wide | 50 | 13 | 9 | 9 | 5.8x | 1.5x |
| tco_args | 51 | 31 | 19 | 17 | 3.0x | 1.8x |
| tco_unrotated | 72 | 12 | 11 | 12 | 6.0x | 1.0x |
| tco_arity6 | 44 | 9 | 12 | 10 | 4.2x | 0.9x |
| tco_narrow_wide | 42 | 136 | 7 | 6 | 6.6x | 22x |
| tco_nat | 47 | 10 | 13 | 9 | 5.5x | 1.1x |
| state_machine | 48 | 11 | 12 | 9 | 5.6x | 1.3x |
| treemap | 82 | 31 | 20 | 9 | 9.1x | 3.4x |
| gc_retain | 362 | 168 | 81 | 41 | 8.8x | 4.1x |
| array / closures / list_recursion / sorting / text_scan / gc_pressure / gc_array_churn / gc_low_live | `run_ok=false` | 22 / 25 / 29 / 40 / 7 / 68 / 517 / 473 | 15 / 11 / 12 / 22 / 6 / 31 / 190 / 310 | 15 / 8 / 15 / 18 / 5 / 28 / 118 / 367 | — | — |

口径（读数前先看）：

- `net_median_ms` 只减掉 node 空启动，**不含**模块读/编译/实例化：`VN_PERF_STATS=1`
  另报 `read_ms` / `compile_ms` / `instantiate_ms` / `start_ms`（JSON 的 `startup` 字段），
  `start_ms` 是程序本体（`_start` 到退出），其余是固定成本。
- **V8 默认的 wasm 栈约 1 MB**：Node 下 `--stack-size` 会按比例放大这个上限（`sorting` 在
  默认栈 trap，`--stack-size=5000` 跑过），但浏览器没有对应开关，所以基线按默认上限采集。
  上表八个非尾深递归程序以 `Maximum call stack size exceeded` 收口，JSON 记
  `"run_ok": false, "skip_reason": "run"`。`wasm-opt` 不改变这一点——优化后这 8 项仍然 trap
  （栈深问题，不是性能问题）。这是浏览器路径的实际执行边界，不是测量设施的限制。
- **RSS 不可比**：wasm 列是 node 进程量级（~55 MB 起），内存只增不减的是 wasm 线性内存；
  与 native「栈页 + live 堆」、OCaml「GC 高水位」不是一个口径。
- **引擎/宿主版本是一阶变量**：基线只与 `meta.node` + `meta.wasm_host_runner` 同版本
  可比；换 Node 版本要重标基线。

读法（减掉 ~22 ms 地板）：**V8 在 `float_math`（net 14 vs native 66）与 `hashmap_remove`
（net 84 vs 102）上快过 native**，`arith` 基本持平（net 15 vs 16）；其余跑得动的项 native
领先（`records` net 47 vs 32、`gc_retain` 340 vs 168、`hashmap` 30 vs 11、`tco_wide` 9 vs 6、
`nat_bits` 11 vs 7）。差异来源与 native 的既有缺口一致：native 无寄存器分配、每个算术/比较
都是一次运行时调用，而 V8 有优化编译器；native 赢在「调用少、字符串/栈传参多」的形状
（[performance.md](performance.md) §3）。`tco_narrow_wide` 是反向的一档：wasm 42 /
native 136——wasm 两侧都发 `return_call`，native 的窄调宽回退成普通 `call`（§1.2）。

`wasm-opt -O3` 的内联会**掩盖**后端 codegen 的成本：binaryen 把闭包调用链与装箱/拆箱
内联掉后，`call $rt_apply`、`struct.new $int` 这些开销不再直接体现在读数里。所以量后端
自身的表示 / 调用形状（零参别名直调、[wasm.md](wasm.md) §2.1 的标量 ABI、浮点字面量）
必须用 `--wasm-opt 0`（或 `-O3` + 关内联）做对照，否则测到的是 binaryen 的收益。

### 1.4 效应机器（CPS）

`eff_tick` / `eff_deep` / `eff_deepseq` / `eff_bracket` / `eff_nested` / `eff_host` /
`eff_abort` / `eff_install` / `eff_entry_host` 覆盖 handler 派发与续延：

- `eff_tick`：尾递归里 20000 次顺序 `perform` + `resume`（浅续延吞吐）；
- `eff_deep`：非尾递归到深度 2000 才 `perform` 一次（单次捕获深度）；
- `eff_deepseq`：非尾递归每层都 `perform`（深度 2000→1；旧栈拷贝路径下的原始形状，机器下是线性）；
- `eff_bracket`：10000 轮 `bracket` + `perform`（cleanup 的 push/pop）；
- `eff_nested`：2000 层 handler 嵌套，内层完成后再在外层 perform（帧链 / 回退）；
- `eff_host`：Console handler 的 answer 是 `Eff`（answer row），每轮额外发一个 Tick；
- `eff_abort`：2000 轮 `bracket` 的 use 都 abort（cleanup 恰好一次）；
- `eff_install`：10000 轮独立安装 handler + perform + 拆掉（`MkHandle`/`finish` 固定成本）；
- `eff_entry_host`：**入口宿主叶子**——`main : Eff [ConsoleOp] Int` 5000 次
  `consolePrint ""`，entry 只预装 `runConsoleHost`、没有用户 handler；每轮是 1 次零字节
  write + 一次机器转移（`MkPerform` → `opH`）。`opH` 里没有第二台机器：`runPure (MkEff leaf)`
  在 CPS 里折成对叶子的直接调用（见下面的 W5 负结果）。
  `.ml` 对照用 `output_string ""`（不产生 syscall），所以比值里含那 N 次 write 的常数。

另有 `startup`（`repeat=20` 的进程/运行时初始化地板）与 `traits`（约束多态的字典派发）。
手写 OCaml 对照在同名 `.ml`（`Effect.Deep` 或直接内联）。`handleState` 这种 answer 是
函数的库 handler 仍不可用（D114），没有进基准。

三端同窗口（HEAD `cf17a85`，`--target all --runs 5 --warmup 2`，node 24.21.0，loadavg ≈1.3；
ratio 相对手写 OCaml；wasm 括号里是减掉 `meta.node_startup_ms` = 22 ms 的 net）：

| benchmark | 手写 ms | OCaml 后端 | native | wasm |
| --- | --- | --- | --- | --- |
| eff_tick（20000 次 perform） | 4 | 10（2.5x） | 8（2.0x） | 49（12.3x；net 27 / 6.8x） |
| eff_deep（深度 2000 捕获一次） | 4 | 5（1.3x） | 4（1.0x） | 43（10.8x；net 21 / 5.3x） |
| eff_deepseq（深度 2000 每层 perform） | 4 | 5（1.3x） | 4（1.0x） | 45（11.3x；net 23 / 5.8x） |
| eff_bracket（10000 轮 bracket） | 4 | 12（3.0x） | 9（2.3x） | 54（13.5x；net 32 / 8.0x） |
| eff_nested（2000 层 handler） | 4 | 6（1.5x） | 6（1.5x） | 43（10.8x；net 21 / 5.3x） |
| eff_host（answer 是 Eff 的 Console） | 4 | 7（1.8x） | 15（3.8x） | 114（28.5x；net 92 / 23.0x） |
| eff_abort（abort 路径 cleanup） | 4 | 8（2.0x） | 5（1.3x） | 44（11.0x；net 22 / 5.5x） |
| eff_install（每轮安装 handler） | 5 | 9（1.8x） | 12（2.4x） | 57（11.4x；net 35 / 7.0x） |
| eff_entry_host（入口宿主叶子） | 4 | 6（1.5x） | 7（1.8x） | 37（9.3x；net 15 / 3.8x） |
| startup（repeat=20 的启动地板） | 3 | 2（0.7x） | 1（0.3x） | 26（8.7x；net 4 / 1.3x） |
| traits（约束多态字典派发） | 5 | 5（1.0x） | 8（1.6x） | 33（6.6x；net 11 / 2.2x） |

同一份数据在 `bench/baselines/programs.json`；`--only eff_*` 是效应面的快检子集。
`eff_bracket` 的 vuna 与 `.ml` 都是尾递归（`loop n acc`）；修正前 vuna 版本是非尾递归，
历史表里它的旧读数（90x / 57x）不可与修正后对照。

**派发 id（P1c）**：机器与 OCaml 运行时的 handler 匹配从 `(key, name)` 字符串改成
整数 id（`effectId`，字面量在 lowering 折叠）；三端 ratio 与改前同窗口一致
（`eff_tick` native 4.7x、`eff_install` 15.4x、`eff_host` 31.9x），没有可测收益——
原生 `str_eq` 只占单次 perform 的 ~1%（2 次比较 ≈7 ns / ~700 ns），这次改动是协议
收敛（派发只比整数），不是性能项。

**入口宿主叶子（W3.0 / W3.1）**：`eff_entry_host`（N=5000）的读数是上表的最后一行。
两个后端的形状不同：native 走库机器（`MkPerform` → opH），wasm 走直连改写
（`runMain (opH op pureK)`）；两条路都只跑**一台**机器——opH 里的 `runPure` 不算一台
（见下面的 W5 负结果）。

W3.1 之前，库 opH 的 resume 走 `MkRestCont`（CPS 只给语法 clause 的 `k` 发 `MkRestTail`），
每次 perform 压一层 `MkCtx`/续延槽，`live` 随次数线性增长（≈1.8 KB/叶），8k 之后进入
「每次全堆扫描」的 GC 悬崖：

| N（native，单次） | 2000 | 5000 | 8000 | 10000 | 16000 | 20000 |
| --- | --- | --- | --- | --- | --- | --- |
| 修复前墙钟 | 8–11 ms | 9–13 ms | 39–52 ms | 89 ms | 252 ms | 300–1000 ms |
| 修复前末次 GC `live` | — | 4.4 MB | 9.0 MB | 18.5 MB | 36.5 MB | 38.6 MB |

W3.1 把 opH / 全局 clause 的续延换成尾标记（`__mchTK`）：`mCps` 只沿尾位置传播它，尾位置
的 resume 发 `MkRestTail`（共享尾槽、不压 ctx），非尾位置仍走 `MkRestCont`。修复后同一
程序 20000 次的 `live` 稳定在 ~3 KB、墙钟 20 ms；N=5000 的 native 读数 29 → **9 ms**、
RSS 13 → 4 MB。基准固定在 N=5000。

**W5 负结果（宿主叶子改裸值原语）**：原计划把三处 `runPure (@vuna@host@…)`
（`Console` 的 `Print` / `EPrint`、`Process` 的 `Exit`）改成裸值 intrinsic，理由是
「每次 print 再跑一台机器」。实测不成立：CPS 把 `runPure (MkEff leaf)` 折成对叶子的
直接调用，三端产物与裸值版**逐字节一致**（native `consoleOpHIOHost` 的 `.s` 函数体、
wasm `main.wat` 全文、OCaml `B_dEffect_dConsole.ml`），跑分在噪声内
（`eff_entry_host` native 28→27 ms、wasm 34→35 ms；`VUNA_NATIVE_GC_MIN=2G` 下 19→19）。
所以不新增裸值 intrinsic（同一运行时函数留两个调用面，只是把名字表撑大），真正要做的
是 W3.1 的 resume 尾路径 / ctx 回收。

**CPS 前后**（wasm：`445315d` 的 wat 机器 → HEAD 的库机器；native：`e663921` 的栈拷贝 →
HEAD 的库机器；`--runs 3 --warmup 1`，源码与 harness 都是 HEAD）：

| benchmark | native 前 | native 后 | wasm 前 | wasm 后 |
| --- | --- | --- | --- | --- |
| eff_tick（20000） | 25587 ms / 21.4 GB | 214 ms / 57 MB | 栈溢出（`Maximum call stack size exceeded`） | 184 ms |
| eff_bracket（10000，修正前非尾版本） | 8955 ms / 12.6 GB | 268 ms / 51 MB | 栈溢出 | 174 ms |
| eff_deep（2000） | 5 ms | 6 ms | 36 ms | 34 ms |

- native 的栈拷贝按「每次 perform 留一段栈」计费，20k 次顺序 perform 就要 21.4 GB；
  库机器把同一档压到 57 MB。`eff_deep` 只捕一次浅栈，两者相当。
- wasm 的 wat 机器栈深约 96 B/次，20000 次超过 V8 的 1 MB；库机器在同一档跑通。
  小档（4000 次，减 27 ms 地板）两者净耗时 6 ms vs 36 ms：库机器每次派发更贵，
  但栈是常量。
- OCaml 后端仍是 `Effect.Deep`，没有 after 列；同一批基准在 `445315d` / `e663921` /
  HEAD 三个二进制上都在 9–12 ms，切换不影响它。

`eff_tick` 的增长率（HEAD，单进程；wasm 含宿主地板，地板不随 N 增长）：

| N | native `user` | wasm wall |
| --- | --- | --- |
| 10000 | 0.06 s | 112 ms |
| 20000 | 0.17 s | 185 ms |
| 40000 | 0.52 s | 329 ms |
| 80000 | 5.33 s | 761 ms |

native 在 40k 之后出现台阶：`VUNA_NATIVE_GC_MIN=2G` 下同一 80k 档只要 0.42 s，说明台阶来自
保守 GC 反复扫描随 perform 增长的活数据（旧栈拷贝路径的捕获集合只增不减；该路径已删除）；wasm 不回收，
时间随 N 近线性、内存同样线性增长（20k ≈ 159 MB）。**这组台阶是续延槽复用落地前的读数**，
修复后 200k 仍线性（见下）。

**续延槽复用 / 尾 resume**

`Base.Effect.Core` 的 `MkResume` 现在区分 `MkRestTail`（handler clause 尾位置的 resume）与
`MkRestCont`：尾 resume 不压 `msCtx`，用共享槽 + epoch 做 one-shot；只有非尾 resume 才压 ctx。
`msUsed` 从 COW `HashMap` 换成按槽回收的 epoch 表，`msCtx` / `msUsed` 不再随 perform 次数增长。

同窗口（`--target all --runs 3 --warmup 1`，本机）：

| benchmark | native 前 | native 后 | wasm 前 | wasm 后 |
| --- | --- | --- | --- | --- |
| eff_tick（20000） | 207 ms / 57 MB | 17 ms / 4.2 MB | 178 ms / 158 MB | 56 ms / 63 MB |
| eff_bracket（10000，修正前非尾版本） | 263 ms / 51 MB | 151 ms / 27 MB | 175 ms / 156 MB | 100 ms / 94 MB |
| eff_deep（2000） | 6 ms | 6 ms | 35 ms | 37 ms |

- `eff_tick` 放大到 200k：native 0.18–0.34 s / 2.4–17 MB，`VUNA_NATIVE_GC_LOG` 的末次
  `live` ≤ 0.3 MB（不随 N 涨）；wasm 0.86 s（含 `nix run`/Node 启动，默认栈）。
- `eff_bracket` 的剩余成本在 CPS 管道步数（do / bind / cleanup），不在续延；下一档是
  `>>=` / `pure` 的 CPS 展开。修正为尾递归后当前读数是 native 35 ms / 4.2 MB、
  wasm 64 ms / 63 MB（见上方三端表）。

**产物**（`compile`，空 store；native 列是全部 `.s` 的合计；wasm 列是 `main.wat` 文本，
它不受 `wasm-opt` 影响）：

| 程序 | wasm 前 | wasm 后 | native 前 | native 后 |
| --- | --- | --- | --- | --- |
| eff_tick | 458 KB / 19199 行 | 429 KB / 17838 行 | 149 KB / 7643 行 | 338 KB / 15821 行 |
| eff_bracket | 728 KB / 32591 行 | 448 KB / 18681 行 | 167 KB / 8411 行 | 364 KB / 16914 行 |
| arith（纯程序） | 391 KB / 16016 行 | 377 KB / 15394 行 | 119 KB / 6286 行 | 274 KB / 12930 行 |

wasm 删掉 wat 机器后连纯程序也小了 ~4%。上表 native 两列是「机器无条件可达根」时期
的历史读数；该约束已解除：现在只有程序里出现 handler / `runThunk` 跳板时
`machineRun` 才进根集，纯程序（`arith`）的 native 产物回到 **2 个 `.s` / 119 KB**
（二进制 94.7 KB → 44.7 KB），效应程序与之前逐字节一致。编译时间三档都在 0.16–0.25 s，
无可测差异。

这里的「产物」是相对历史二进制的 A/B；**系统性的三端产物基线**（文件树、字节、行数、
最终二进制、分段构建时间，按 hello / defs-N / mods-N / self 分档）由
`nix run .#vuna-artifacts` 测量，读数与口径见 [performance.md §产物规模](performance.md)，
基线 `bench/baselines/artifacts.json`。


### 1.5 容器族（三端）

`sort_lib` / `treemap` / `queue` / `priority_queue` / `hashmap_remove` 覆盖
`Base.Data.Sort`、`Base.Container.{TreeMap,Queue,PriorityQueue,HashMap}` 的典型操作。
每项是一对同算法实现：vuna 库 vs **手写 OCaml 上限**（`List.sort` / `Map` / `Queue` /
`Set` / `Hashtbl`），golden 用**顺序敏感**校验和（遍历/出队顺序错了就失配）；输入与
累加都用尾递归，三个后端都能跑完（wasm 1 MB 栈）。

同机一档（HEAD，`--target all --runs 5 --warmup 2`，loadavg ≈3.6；wasm 括号内是减掉
`meta.node_startup_ms` = 23 ms 的 net）：

> **口径**：wasm 列在 `wasm-opt` 阶段之前采集，已过期（`treemap` −18%、`queue` ~0%，
> 见 [wasm.md](wasm.md) §1.1）；重测前只作历史读数。

| benchmark | 规模 | 手写 ms | OCaml 后端 | native | wasm（net） |
| --- | --- | --- | --- | --- | --- |
| sort_lib（`Sort.sortBy` 排序） | 20000 Int | 7 | 19（2.71x） | 47（6.71x） | 81（58；8.29x） |
| treemap（insert + lookup + 升序遍历） | 20000 键 | 11 | 22（2.00x） | 48（4.36x） | 111（88；8.00x） |
| queue（push + pop + size） | 50000 次 | 5 | 8（1.60x） | 13（2.60x） | 58（35；7.00x） |
| priority_queue（push + pop） | 20000 次 | 11 | 20（1.82x） | 39（3.55x） | 69（46；4.18x） |
| hashmap_remove（insert + remove + lookup） | 20000 键 | 5 | 34（6.80x） | 144（28.80x） | 109（86；17.20x） |

读法：

- **比值口径是「库 vs 手写最优实现」**，不是后端之间的公平对照：OCaml 侧的 `Map`/`Set`
  也是树、`List.sort` 是特化排序，而 vuna 侧是泛型容器 + 字典派发；
- `hashmap_remove` 的常数最大（OCaml 后端 6.8x、native 29.6x）：持久 `HashMap` 每次
  `insert`/`remove` 都要 copy-on-write 两个 32 元素数组并做桶内去重，对手是可变
  `Hashtbl`。这是持久化的代价，不是复杂度退化（`checks.vuna-container-growth` 锁
  O(1)/O(log n) 的增长形状）；
- `sort_lib` 的 OCaml 后端 2.71x 来自泛型比较闭包与拆半/归并的分配；`Sort.sortBy` 对
  已有序输入直接返回原列表（编译器里的排序点大多命中这条）；
- wasm 的绝对 ms 含 node 启动地板；native/wasm 与 OCaml 后端的比值见
  `bench/baselines/programs.json` 的 `vs_ocaml_backend`。

重标：`VUNA=$PWD/result/bin/vuna ./bench/run.sh --target all --runs 5 --warmup 2 --json bench/baselines/programs.json`。
复杂度契约见 [stdlib.md](stdlib.md)「容器复杂度契约」；增长形状由
`checks.vuna-container-growth` 在 CI 里守（每翻倍 ≤3.0×）。

### 1.6 机制分层（T0–T9）

用例按机制归到 `bench/programs/t<N>/`，清单与新增规则见
[`bench/programs/TIERS.md`](../../bench/programs/TIERS.md)。tier 是累积的：诊断从 T0 往上走，
**第一个不达标的 tier 就是问题所在**。三端同窗口：`vuna`（native）、`vuna_ocaml`
（vuna 源码走 OCaml 后端）、`ml`（手写 OCaml）、`c`（手写 C，同形；N 从 argv 读）。

本机一档（`--target both --tier t1 --runs 7 --warmup 3`，loadavg ≈3.3；
`ns/op` 是 `median_ms × 1e6 / ops`，绝对 ms 只同机可比）：

| 用例 | tier | native ms | native ns/op | native vs c | native vs ml | vuna_ocaml vs c | vuna_ocaml vs ml |
| --- | --- | --- | --- | --- | --- | --- | --- |
| arith | t1 | 5.55 | 1.85 | 0.87x | 1.08x | 0.93x | 1.14x |
| float_math | t1 | 13.43 | - | 1.69x | 1.68x | 1.67x | 1.65x |
| nat_bits | t1 | 4.05 | - | 0.79x | 1.03x | 0.98x | 1.28x |
| scalar_xor | t1 | 11.85 | 0.59 | 1.13x | 0.94x | 1.30x | 1.08x |
| scalar_muladd | t1 | 24.75 | 1.24 | 1.06x | 0.97x | 1.12x | 1.03x |
| scalar_divconst | t1 | 11.70 | 0.59 | 1.18x | 0.69x | 1.73x | 1.01x |
| scalar_idiv | t1 | 15.01 | 1.50 | 1.39x | 1.25x | 1.17x | 1.05x |
| scalar_divsigned | t1 | 20.03 | 2.00 | 1.39x | 0.98x | 1.48x | 1.05x |
| scalar_cmp | t1 | 9.38 | 0.78 | 1.29x | 1.06x | 1.37x | 1.13x |
| scalar_bit | t1 | 15.79 | 0.79 | 1.44x | 0.84x | 1.74x | 1.02x |
| scalar_ilp | t1 | 15.28 | 1.53 | 1.29x | 0.91x | 1.51x | 1.06x |

几何平均：**t1 native 1.20x c / 1.01x ml；t1 vuna_ocaml 1.33x c / 1.12x ml**。
T0 仍是 0.36x c / 0.23x ml（§1.6.2 的裁剪不改变地板读数）。

读法：

- **地板不是问题**：T0 上 native 比手写 OCaml 快 4 倍、比裸 syscall 的 C 还快（`startup` 0.36x）。
  入口初始化与产物尺寸不在差距里。
- **循环结构**：自递归循环体旋转后，入口跳到条件检查、回边就是条件分支本身，每轮只有
  一次分支；槽提升后又把 `mov rax, rS; ...; mov rD, rax` 合并成直接操作 `rD`，并把
  `r10/r11` 的中转拷贝折掉。`scalar_bit` 从 1.94x C 降到 1.44x C，循环体只剩
  `add / shl / sar / mov / xor / or / sub`。
- **物化比较与浮点比较已收口**：
  - `scalar_cmp`（六种比较物化）native 1.29x c / 1.06x ml：`if b then 1 else 0` 直接
    复用 0/1 槽（`if b then 0 else 1` 只发 `xor 1`），比较只发 `setcc` + `movzx`，
    累加回到内联 `add`。
  - `float_math` native 1.69x c：浮点比较在 `floatTree` 里用 `ucomisd` + `cmov` 选分支
    指针，整棵树仍只装箱一次；剩余差距在 `sqrt` 与装盒 / 搬运。
- **常量除法与 Nat 库调用已收口**：
  - `scalar_idiv` native 1.39x c：非 2 幂常量除法改走 magic 乘法（`imul` 高半）+
    符号修正，不再 `cqo` + `idiv`；`d = 3` / 负常量仍回退 `idiv` / 运行时。
  - `nat_bits` native 0.79x c / 1.03x ml：`Nat.plus` / `Nat.mult` / `Nat.fromInt` 的零参
    别名在调用点展开成 `IrRtApp`，饱和乘法用 `imul` + `cmov` 内联，热点循环里没有
    `call rt_nat_*`。
- **剩余固定成本**：`scalar_bit` 1.44x C（63-bit wrap 与剩余搬运）、
  `scalar_divsigned` 1.39x C（符号修正移位）。
- 结论按 tier 切断：T0 达标；T1 的标量算术已到 C 的量级，剩余是位运算的 wrap 与少量搬运。

#### 1.6.1 T1 优化（2026-11-23）

三轮改动（细节见 [native.md](native.md) §3.6–§3.10）：

1. **调用点内联放宽**：实参可以是可重复求值的小标量表达式（加减乘 / 位运算 / 非零常量
   除法），`bxor acc (n / 2)`、`band (acc * C + c) mask` 这类调用不再留下 `call`；
2. **延时 wrap**：同一棵标量表达式树只在根位置 wrap 一次；`band` 的掩码消费时整棵树
   都不 wrap（掩码只看低位）；`band` / `bor` / `bxor` / `bnot` 自身对规范化封闭，不再跟
   `shl; sar`；
3. **标量槽提升**：有回边的函数把循环携带的标量槽提到 `rbx` / `r12`–`r14`（只提升
   `NClsScalar`，指针槽留给保守扫根），自递归尾调用的实参在安全时直写形参槽；
4. **范围信息**：`IrIf` 的守卫推出区间事实，证明了的 `+ - *` 不再 wrap、非负常量除法
   只发一条 `shr`（`Native.Range`，§3.10）。

同一台机器上的三轮对照（`native ms`）：

| 用例 | 主分支原状 | 第一轮（1–3） | 第二轮（4） | C |
| --- | --- | --- | --- | --- |
| arith | 7.19 | 6.90 | **4.39** | 5.93 |
| float_math | 8.86 | 8.35 | **8.25** | - |
| nat_bits | 8.05 | 5.81 | **5.74** | - |
| scalar_xor | 19.52 | 15.16 | **10.97** | 8.71 |
| scalar_muladd | 56.94 | 24.01 | **23.64** | 21.93 |
| scalar_divconst | 52.98 | 18.16 | **11.27** | 9.87 |
| **几何平均（vs c）** | **2.39x** | **1.37x** | **1.04x** | 1.00x |

三轮的读数在不同 loadavg（1.12 / 1.57 / 0.88）下取得，C / OCaml 对照本身也有 ±10% 的
漂移，所以绝对 ms 只作方向参考；比值列在同一次运行内自洽。

下一步的顺序（都有明确的读数目标）：

- **复制合并**：`mov rax, rA; op rax, rB; mov rA, rax` 合成 `op rA, rB`，删掉
  `mov rax, rX; cmp rax, 0` 这类装载——对应 `scalar_xor` 的剩余 1.26x；
- **`lea` 取小常量乘**：`x * 3 / 5 / 9` 用 `lea`（1 周期）替 `imul`（3 周期）；
- **32-bit 窄化**：`band (acc * C + c) 0xFFFFFFFF` 用 32-bit 形式，`scalar_muladd` 再压两条；
- **`IrNatCase` 的 0 / 后继事实**：给 `nat_bits` 这类结构递归补范围；
- **未引用 `.bss` 缓冲**：可达性裁剪只裁了函数，8 MiB 的 `rt_read_buf` 等仍进产物。

#### 1.6.2 入口初始化裁剪

T0 达标之后，`_start` 不再无条件初始化全部子系统：只按程序实际用到的部分发调用，
并按 `_start` 的标签可达性裁剪运行时函数（规则见 [native.md](native.md) §5.1）。
同一 IR 的产物仍然逐字节确定。

| 用例 | `_start` 的 init 调用 | 产物 bytes | 进程启动墙钟（交替 A/B） |
| --- | --- | --- | --- |
| startup | stack / mem / gc / cpus / timeout → **timeout** | 49,640 → **15,576** | 211 → **190 µs**（n=2000 对的中位数） |
| arith | 同上 → **timeout** | 49,680 → **15,608** | 5.20 → 5.17 ms（计算占比 >99%，落在噪声内） |
| scalar_xor | 同上 → **timeout** | 49,736 → **15,672** | 49.0 → 49.0 ms（同上） |

A/B 用 C harness 直接 `fork`/`exec` 交替采样（绕开 bench 自身的 bash fork 与 `date` 采样）。
`startup` 的 -21 µs 就是 init 的全部成本：`init_stack`（512 MiB mmap + 保护页 mprotect）
约 4 µs、`init_cpus`（亲和性 + cgroup 读取）约 4 µs、堆 / GC / 超时约 1 µs，其余是页错误。

**结论**：`bench/run.sh` 里 T0 的 0.58–0.67 ms 由 bench 自身的 bash fork（~400 µs）与
exec（~200 µs）主导，init 只剩 10–20 µs。裁剪的收益在产物（-69% 字节、`text` 约 2 KiB）
与「不为未用子系统付启动账」，不是 T0 的时间读数。
