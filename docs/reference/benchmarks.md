# 生成程序基准

`vuna-perf` 测**生成程序**的运行时（编译器 / 工具链自身墙钟见
[performance.md](performance.md) §9，命令耗时与编译热点也都在那里）。后端实现见
[native.md](native.md)、[wasm.md](wasm.md)。

## 1. `vuna-perf` 读数

`nix run .#vuna-perf`（逻辑在 `bench/run.sh`）测**生成程序运行时**：每个 benchmark 是一对
同算法实现（`bench/programs/<name>.vuna` vs `<name>.ml` 手写 OCaml），先校验两侧输出与
golden 一致，再 warmup + 多次取中位数；`--target ocaml|native|both` 选择被测后端，峰值内存
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
| tco_mutual | 互递归（`even`/`odd`） | ~1.0x | 尾调用在 OCaml 侧直接复用栈帧 |
| tco_wide | 9 参数尾递归（3 个栈参数） | ~1.3x | 尾调用与栈传参 ABI 由 ocamlopt 处理 |
| gc_low_live | 低存活集、大累计分配 | ~0.8x | OCaml GC 回收；vuna 侧只有 bump 分配 |
| gc_array_churn | 大对象 churn（Array COW） | ~1.7x | `Array.set` COW 与手写 `Array.copy` 对齐 |

场景覆盖：数值 / 字符串 / 容器 / 分配 / 数组 / 记录与变体 / 高阶函数 / 算法 / 浮点 /
逐字节文本 / Nat 与位运算 / TCO / GC。新增场景对应 `bench/programs/{records,closures,
sorting,float_math,text_scan,nat_bits,tco_mutual,tco_wide,gc_low_live,gc_array_churn}.vuna`。

关键设计决策与改动（`Codegen/Term.vuna`、`Base.Intrinsics` / `Elab.Prelude` / `Codegen.Decl` 与
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
- native 不做尾调用：16 个基准里 11 个在默认 8 MiB 栈上 exit 139（只有 `string_ops` /
  `hashmap` / `sorting` / `gc_low_live` / `gc_array_churn` 能过），所以所有 native 进程统一在
  `ulimit -s unlimited` 下运行（JSON `meta.stack_policy` 记录该口径）；每个 native 项另记
  `default_stack_ok`（8 MiB soft limit 下能否正常退出，探针不参与计时）；
- native 有**保守标记-清扫 GC**（[native.md](native.md) §5.2），峰值 RSS = 栈页 + live 堆；
  `--rss-passes 3` 取最大值，与墙钟分开采样；
- `--runs 5 --warmup 2` 取中位数；基线记录生成时的 `meta.loadavg`，跨机器只比 ratio。

本机一档（16 核，生成时 `loadavg ≈ 4.2`，同一窗口）：

| benchmark | native ms | OCaml 后端 ms | 手写 OCaml ms | native/手写 | native/OCaml 后端 | native RSS | 手写 RSS | RSS 比 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| arith | 47 | 5 | 5 | 9.4x | 9.4x | 4.2 MiB | 2.5 MiB | 1.7x |
| string_ops | 5 | 4 | 3 | 1.7x | 1.3x | 4.3 MiB | 3.2 MiB | 1.3x |
| hashmap | 13 | 7 | 4 | 3.3x | 1.9x | 4.1 MiB | 3.9 MiB | 1.1x |
| list_recursion | 76 | 10 | 13 | 5.9x | 7.6x | 49.5 MiB | 11.3 MiB | 4.4x |
| gc_pressure | 86 | 31 | 26 | 3.3x | 2.8x | 49.9 MiB | 11.1 MiB | 4.5x |
| array | 40 | 16 | 16 | 2.5x | 2.5x | 42.6 MiB | 15.6 MiB | 2.7x |
| records | 52 | 14 | 7 | 7.4x | 3.7x | 4.2 MiB | 4.7 MiB | 0.9x |
| closures | 103 | 11 | 9 | 11.4x | 9.4x | 48 MiB | 8.7 MiB | 5.5x |
| sorting | 49 | 24 | 18 | 2.7x | 2.0x | 18.1 MiB | 9.5 MiB | 1.9x |
| float_math | 256 | 13 | 7 | 36.6x | 19.7x | 251 MiB | 4.5 MiB | 56.0x |
| text_scan | 52 | 6 | 4 | 13.0x | 8.7x | 60.4 MiB | 3.4 MiB | 17.8x |
| nat_bits | 62 | 5 | 4 | 15.5x | 12.4x | 85.4 MiB | 2.6 MiB | 33.5x |
| tco_mutual | 27 | 5 | 4 | 6.7x | 5.4x | 4.2 MiB | 2.5 MiB | 1.7x |
| tco_wide | 31 | 4 | 3 | 10.3x | 7.8x | 4.2 MiB | 2.5 MiB | 1.6x |
| gc_low_live | 322 | 281 | 339 | 0.95x | 1.15x | 5.4 MiB | 244 MiB | 0.02x |
| gc_array_churn | 1443 | 191 | 115 | 12.6x | 7.6x | 223 MiB | 82 MiB | 2.7x |

读法：

- **arith 曾是 67.6x / 412 MiB**：300 万层递归帧不回收，时间花在栈页 fault 而不是指令质量。
  它的递归主体是**直接饱和尾调用**，TCO 后为 47 ms / 4.2 MiB（9.4x，§1.2）。
- **native/OCaml 后端 1.3–2.8x 的一档**：`string_ops` / `hashmap` / `array` / `sorting` /
  `gc_pressure`；`list_recursion`（7.6x）与 `closures`（9.4x）的差距来自闭包/对象表示、
  非尾递归与「所有中间值占栈槽」的朴素 codegen（闭包调用不在尾调用覆盖面内，
  见 [native.md](native.md) §3）。
- **10x 以上的一档各有明确的单一来源**：`text_scan` 是逐字节 `strAt` 运行时调用；
  `records` 曾是 80 万层尾递归帧 + 每步 record 分配 + 闭包-per-`let`（TCO 后 52 ms /
  4.2 MiB）；`nat_bits` 是每轮 Nat 模式匹配；`float_math` 是每次浮点运算的装箱对象。
- `tco_mutual` / `tco_wide` 曾经几乎全是**栈帧成本**（RSS 与墙钟随递归深度线性增长、
  `default_stack_ok=false`）；TCO 后 27 / 31 ms、4.2 MiB、`true`（§1.2）。
- **GC 的主判据已达成**：`gc_low_live`（低存活集、大累计分配）322 ms / 5.4 MiB，手写侧
  339 ms / 244 MiB——墙钟持平、RSS 降到 0.02x；`gc_pressure` 的 RSS 也从 59 MiB 降到
  50 MiB。`gc_array_churn` 是 GC 相关的最差项（1443 ms / 223 MiB）：每轮 `Array.of_list`
  + COW 复制产生大量复制块，回收时机由阈值决定，墙钟比手写高 12.6x。
- 峰值 RSS 的语义：OCaml 侧是 GC 后高水位，native 侧是栈页 + live 堆；两者只作量级参考。
- 这组数不是 CI 门槛：跨机器、跨负载不可比；回归判断用 `--target native --check` 对
  `bench/baselines/programs.json` 的 ratio、rss_ratio、artifact 与 `default_stack_ok` 变化做提示。

### 1.2 TCO / GC 验证项

native 的 TCO / GC 验证项。**GC 与 TCO 均已落地**；下表「前」列取 §1.1 的 TCO 前快照，
「后」列是 `--target both --runs 5 --warmup 2 --only <name>` 的实测（与 §1.1 同口径）：

| 用例 | TCO 前 | TCO 后实测 | 判定列 |
| --- | --- | --- | --- |
| `tco_mutual` | 189 ms / 244 MiB / `default_stack_ok=false` | 27 ms / 4.2 MiB / `true` | wall, rss, stack |
| `tco_wide` | 343 ms / 442 MiB / `false` | 31 ms / 4.2 MiB / `true` | wall, rss, stack |
| `arith` | 338 ms / 412 MiB / `false` | 47 ms / 4.2 MiB / `true` | wall, rss, stack |
| `records` | 151 ms / 151 MiB / `false` | 52 ms / 4.2 MiB / `true` | wall, rss, stack |

- **TCO**：判据是 `default_stack_ok` 由 false 翻为 true，且 RSS 从百 MB 降到进程基线
  （~4.2 MiB）；上表四项都满足。`arith` / `records` 也翻真，说明它们的递归主体同样是
  **直接饱和尾调用**；`tco_wide` 覆盖 9 参（3 个栈实参）的自递归。
- **GC**：主判据是 RSS 从「累计分配」降到「存活集」——`gc_low_live` 现在 5.4 MiB
  （GC 前只有 bump 分配时 289 MiB；GC 上线但未清死槽时一度 319 MiB）；
  `VUNA_NATIVE_GC_LOG=1` 可逐次看 `live`。墙钟由两件事决定：清扫/标记 live
  与**保守扫活栈**，所以阈值取 `max(GC_MIN, 2×live, 本次扫到的栈字节数)`（见
  [native.md](native.md) §5.1）；死槽清零（调用点实参槽 + 文本最后读取后清零）让活帧
  不再留住已消费的临时对象，是 `gc_low_live` RSS 能降到 5 MiB 的原因。
- 重标基线时 `default_stack_ok` 是布尔快照：直接饱和尾调用的项应为 true；非尾深递归项
  （如 `list_recursion` 的拆半递归）仍为 false，那不是 TCO 漏覆盖——闭包调用、
  `rt_apply`、`rt_*` 与源级 `let`（降级成 lambda 应用）都不在覆盖面内。

### 1.3 wasm 后端（浏览器路径：JS 宿主 / V8）

wasm 产物由仓库自带的宿主执行（`wasm-host/run.mjs`，Node/V8；与浏览器同一套
`WebAssembly` API 和 host 层）。`--target wasm`（或 `--target all`）跑同一批程序
（另有 8 个效应基准与 `startup` / `traits` 见 §1.4）。

本机一档（`--target all --runs 5 --warmup 2`，同窗口；绝对 ms / RSS 只作同机对比）：

| benchmark | wasm ms | native ms | OCaml 后端 ms | 手写 ms | wasm/手写 | native/手写 |
| --- | --- | --- | --- | --- | --- | --- |
| arith | 88 | 48 | 6 | 5 | 17.6x | 9.6x |
| string_ops | 26 | 5 | 4 | 3 | 8.7x | 1.7x |
| hashmap | 36 | 14 | 7 | 3 | 12.0x | 4.7x |
| records | 67 | 50 | 14 | 7 | 9.6x | 7.1x |
| float_math | 55 | 85 | 14 | 8 | 6.9x | 10.6x |
| nat_bits | 40 | 17 | 5 | 4 | 10.0x | 4.3x |
| tco_mutual | 34 | 27 | 5 | 5 | 6.8x | 5.4x |
| tco_wide | 61 | 31 | 4 | 4 | 15.3x | 7.8x |
| gc_low_live | 858 | 323 | 295 | 346 | 2.5x | 0.9x |
| gc_array_churn | 467 | 1399 | 200 | 131 | 3.6x | 10.7x |
| list_recursion / gc_pressure / array / closures / sorting / text_scan | `run_ok=false` | 71 / 96 / 34 / 92 / 48 / 33 | 11 / 32 / 15 / 12 / 26 / 6 | 13 / 27 / 16 / 9 / 19 / 5 | — | — |

口径（读数前先看）：

- **宿主启动地板**：每项都含 node 启动 + 模块实例化，JSON `meta.node_startup_ms`
  （本机 ~18 ms）。小项先减地板再看：`tco_mutual` 34 − 18 ≈ 16 ms、`string_ops` ≈ 8 ms。
- **V8 的 wasm 栈约 1 MB 且没有开关**（`node --stack-size` 不改变 wasm 栈，开大直接
  SIGSEGV）：上表六个非尾深递归程序以 `Maximum call stack size exceeded` 收口，JSON 记
  `"run_ok": false, "skip_reason": "run"`。浏览器同此——这是浏览器路径的实际执行边界，
  不是测量设施的限制。
- **RSS 不可比**：wasm 列是 node 进程量级（~55 MB 起），`gc_low_live` 的 ~800 MB 是 wasm 侧
  只增不减的线性内存；与 native「栈页 + live 堆」、OCaml「GC 高水位」不是一个口径。
- **引擎/宿主版本是一阶变量**：基线只与 `meta.node` + `meta.wasm_host_runner` 同版本
  可比；换 Node 版本要重标基线。

读法（减掉 ~18 ms 地板）：**V8 在 `float_math`（37 vs native 85）、`gc_array_churn`
（449 vs 1399）与 `tco_mutual`（16 vs 27）上快过 native，`records` 基本持平**；native 领先
`arith`（70 vs 48）、`string_ops`、`hashmap`、`tco_wide`、`gc_low_live`。差异来源与 native 的
既有缺口一致：native 无寄存器分配、每个算术/比较都是一次运行时调用，而 V8 有优化编译器；
native 赢在「调用少、字符串/栈传参多」的形状（[performance.md](performance.md) §3）。

### 1.4 效应机器（CPS）

`eff_tick` / `eff_deep` / `eff_deepseq` / `eff_bracket` / `eff_nested` / `eff_host` /
`eff_abort` / `eff_install` 覆盖 handler 派发与续延：

- `eff_tick`：尾递归里 20000 次顺序 `perform` + `resume`（浅续延吞吐）；
- `eff_deep`：非尾递归到深度 2000 才 `perform` 一次（单次捕获深度）；
- `eff_deepseq`：非尾递归每层都 `perform`（深度 2000→1，D89 的原始形状）；
- `eff_bracket`：10000 轮 `bracket` + `perform`（cleanup 的 push/pop）；
- `eff_nested`：2000 层 handler 嵌套，内层完成后再在外层 perform（帧链 / 回退）；
- `eff_host`：Console handler 的 answer 是 `Eff`（answer row），每轮额外发一个 Tick；
- `eff_abort`：2000 轮 `bracket` 的 use 都 abort（cleanup 恰好一次）；
- `eff_install`：10000 轮独立安装 handler + perform + 拆掉（`MkHandle`/`finish` 固定成本）。

另有 `startup`（`repeat=20` 的进程/运行时初始化地板）与 `traits`（约束多态的字典派发）。
手写 OCaml 对照在同名 `.ml`（`Effect.Deep` 或直接内联）。`handleState` 这种 answer 是
函数的库 handler 仍不可用（D111），没有进基准。

三端同窗口（HEAD `c6586e7`，`--target all --runs 5 --warmup 2`，loadavg ≈3.3；
ratio 相对手写 OCaml，wasm 含 `meta.node_startup_ms` = 25 ms）：

| benchmark | 手写 ms | OCaml 后端 | native | wasm |
| --- | --- | --- | --- | --- |
| eff_tick（20000 次 perform） | 4 | 10（2.5x） | 212（53.0x） | 189（47.3x） |
| eff_deep（深度 2000 捕获一次） | 3 | 3（1.0x） | 5（1.7x） | 37（12.3x） |
| eff_bracket（10000 轮 bracket） | 3 | 14（4.7x） | 320（106.7x） | 194（64.7x） |

**CPS 前后**（wasm：`445315d` 的 wat 机器 → HEAD 的库机器；native：`e663921` 的栈拷贝 →
HEAD 的库机器；`--runs 3 --warmup 1`，源码与 harness 都是 HEAD）：

| benchmark | native 前 | native 后 | wasm 前 | wasm 后 |
| --- | --- | --- | --- | --- |
| eff_tick（20000） | 25587 ms / 21.4 GB | 214 ms / 57 MB | 栈溢出（`Maximum call stack size exceeded`） | 184 ms |
| eff_bracket（10000） | 8955 ms / 12.6 GB | 268 ms / 51 MB | 栈溢出 | 174 ms |
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
保守 GC 反复扫描随 perform 增长的活数据（一次性续延集合只增不减，见 debt D109）；wasm 不回收，
时间随 N 近线性、内存同样线性增长（20k ≈ 159 MB）。

**产物**（`compile`，空 store；native 列是全部 `.s` 的合计）：

| 程序 | wasm 前 | wasm 后 | native 前 | native 后 |
| --- | --- | --- | --- | --- |
| eff_tick | 458 KB / 19199 行 | 429 KB / 17838 行 | 149 KB / 7643 行 | 338 KB / 15821 行 |
| eff_bracket | 728 KB / 32591 行 | 448 KB / 18681 行 | 167 KB / 8411 行 | 364 KB / 16914 行 |
| arith（纯程序） | 391 KB / 16016 行 | 377 KB / 15394 行 | 119 KB / 6286 行 | 274 KB / 12930 行 |

wasm 删掉 wat 机器后连纯程序也小了 ~4%；native 相反：`machineRun` 是无条件可达根，
纯程序也从 2 个 `.s` 变成 7 个（多出 `Base/Effect/Core.s`，见 debt D110）。编译时间三档都在
0.16–0.25 s，无可测差异。

