# 生成程序基准

`vuna-perf` 测**生成程序**的运行时（编译器 / 工具链自身墙钟见
[compiler-benchmarks.md](compiler-benchmarks.md)，命令耗时与编译热点也都在那里）。后端实现见
[native.md](native.md)、[wasm.md](wasm.md)。

## 1. `vuna-perf` 读数

`nix run .#vuna-perf`（逻辑在 `bench/run.sh`）测**生成程序运行时**：每个 benchmark 是一组
同算法实现（`bench/programs/t<N>/<name>/<name>.vuna`、同目录 `<name>.ml` 手写 OCaml、
`<name>.c` 手写 C），`t<N>` 是机制分层（见
[`bench/programs/TIERS.md`](../../bench/programs/TIERS.md)）；先校验各侧输出与 golden 一致，
再 warmup + 多次采样。**五个列 × 三个指标**：`ocaml_ref` / `c_ref` / `vuna_ocaml` / `native` /
`wasm` 各测墙钟、CPU（user+sys）、峰值 RSS，三者在同一次运行里由 `bench/lib/timestat`
采出；每个后端对两个对照组各给一套比值（`wall` / `cpu` / `rss` × 手写 OCaml / 手写 C）。
跨机器只比 ratio（绝对 ms / KB 不可比）；宿主繁忙时墙钟整体抬升，回归判断先看 `cpu` 行。

C 对照的存在让「vuna 相对最优手写实现」有了第二条参照；`vuna Int` 是 63 位补码（同 OCaml），
输出依赖回绕的用例在 C 侧按 63 位模拟。

口径与基线维护见 `bench/README.md`；基线统一在 `bench/baselines/`：`programs.json` 一份
（全部生成程序 × ocaml/native/wasm × 三指标），`--check` 只比本次实际跑的 target / benchmark。
与 `bench/bootstrap.sh` 的分工：后者测构建 / 编译墙钟与产物尺寸，本设施测运行期。

三口径读数（`--target all --runs 5 --warmup 2`，x86_64 / 16 核 / 生成时 `meta.loadavg ≈ 2.8`；
ratio 对手写 OCaml，wasm 用 net；`bench/baselines/programs.json` 里的全部用例、
native / wasm 列与对手写 C 的对照见该文件；t3 行取 2026-11-26 native 优化后的
同窗口读数（多 worktree 并行，绝对 ms 偏高；比值同窗口）：

| benchmark | 场景 | wall | cpu | rss | vs_c (w/c/r) |
| --- | --- | --- | --- | --- | --- |
| arith | Int 算术 + 尾递归 | 1.25 | 1.23 | 1.82 | 1.76/1.77/2.75 |
| string_ops | 字符串拼接 / repeat / substring | 1.97 | 2.05 | 1.64 | 2.65/2.68/2.92 |
| hashmap | 持久哈希表 + 字典派发 | 3.38 | 3.54 | 2.64 | 4.83/5.06/4.88 |
| list_recursion | List 非尾递归 / fold / append | 0.66 | 0.67 | 1.25 | 1.02/1.02/1.17 |
| gc_pressure | 分配压力（字符串 churn） | 1.24 | 1.25 | 3.06 | 4.43/4.50/19.65 |
| array | 不可变 Array（get / set / length） | 0.94 | 0.94 | 1.30 | 6.05/6.20/4.23 |
| records | record 更新 + variant 分派 | 2.52 | 2.56 | 4.89 | 5.07/5.16/12.67 |
| closures | 高阶函数 / 每次迭代新建闭包 | 1.51 | 1.52 | 1.56 | 9.22/10.22/8.19 |
| micro_apply_dyn | 运行期选闭包后的动态应用 | 0.89 | 0.88 | 1.80 | 1.59/1.58/2.93 |
| micro_partial | 部分应用 shim（每轮分配） | 1.61 | 1.65 | 4.51 | 2.89/2.93/12.60 |
| micro_overapply | 过度应用（一次给足两层） | 0.95 | 0.95 | 4.50 | 3.62/3.68/12.58 |
| micro_capture | 捕获闭包 + 每轮分配 | 1.26 | 1.24 | 4.48 | 2.96/2.93/12.56 |
| micro_closure8 | 8 参闭包（第 6~8 实参走栈） | 1.46 | 1.47 | 1.78 | 1.72/1.76/2.94 |
| micro_args8 | 非尾 8 参直调（栈实参） | 1.06 | 1.06 | 1.88 | 1.01/1.02/3.00 |
| micro_record_dispatch | record 字段里的闭包派发 | 1.25 | 1.25 | 1.80 | 1.22/1.22/2.93 |
| closure_pipeline | 闭包表逐轮 fold 派发 | 1.31 | 1.30 | 1.79 | 1.96/1.97/2.97 |
| sorting | 归并排序（List + Pair 拆半） | 1.22 | 1.21 | 3.72 | 0.63/0.63/0.86 |
| float_math | Float 算术 / sqrt / abs / 转换 | 2.38 | 2.39 | 4.30 | 3.28/3.33/10.98 |
| text_scan | 逐字节 `strAt` 扫描 | 1.73 | 1.75 | 1.91 | 2.66/2.76/3.54 |
| nat_bits | Nat 饱和算术 + 63-bit 位运算 | 2.07 | 2.07 | 1.78 | 3.29/3.38/2.75 |
| tco_mutual | 互递归（`even`/`odd`） | 1.09 | 1.08 | 1.82 | 3.34/3.37/2.73 |
| tco_wide | 9 参数尾递归（3 个栈参数） | 1.25 | 1.25 | 1.83 | 3.04/3.13/2.76 |
| micro_tco | 最小自递归尾调用 | 1.10 | 1.11 | 1.79 | 2.06/2.08/2.75 |
| tco_args | 交叉依赖实参的尾递归 | 1.13 | 1.13 | 1.83 | 1.31/1.30/2.75 |
| tco_unrotated | 双支自调用 / `&&` 条件 | 0.87 | 0.87 | 1.78 | 1.57/1.60/2.65 |
| tco_arity6 | 6 参尾递归（全走寄存器） | 1.09 | 1.09 | 1.80 | 2.12/2.13/2.88 |
| tco_narrow_wide | 2 参 ↔ 10 参窄调宽 | 1.26 | 1.30 | 1.79 | 7.93/8.76/2.77 |
| tco_nat | Nat 结构递归尾调用 | 1.53 | 1.54 | 1.79 | 2.90/2.92/2.75 |
| state_machine | 9 状态 Int 分支链 | 1.72 | 1.73 | 1.79 | 6.43/6.56/2.77 |
| gc_low_live | 低存活集、大累计分配 | 0.82 | 0.82 | 1.36 | 2.34/2.35/188.93 |
| gc_array_churn | 大对象 churn（Array COW） | 1.59 | 1.59 | 2.56 | 1.86/1.85/119.17 |
| gc_retain | 高存活集（live ~19 MB）+ 等量 churn | 2.09 | 2.11 | 5.64 | 1.06/1.07/5.50 |

优化手段（数字见上表；`vs_c` 是同一窗对手写 C 的 wall/cpu/rss 比）：

| benchmark | 场景 | 优化手段 |
| --- | --- | --- |
| arith | Int 算术 + 尾递归 | 饱和内联 + 多参数 lambda 链 |
| string_ops | 字符串拼接 / repeat / substring | `++` 链 / `strPack` 批拼为一次 `String.concat`；`strSubstring` + `repeat` 一次 `strConcatMany` |
| hashmap | 持久哈希表 + 字典派发 | 桶改 `Array`（`Array.get` O(1) + copy-on-write） |
| list_recursion | List 非尾递归 / fold / append | 已达标 |
| gc_pressure | 分配压力（字符串 churn） | 已达标 |
| array | 不可变 Array（get / set / length） | 不可变 `Array` 与手写 OCaml 持平 |
| records | record 更新 + variant 分派 | record 直接映射 OCaml record；多字段更新无额外分配 |
| closures | 高阶函数 / 每次迭代新建闭包 | 多参数 lambda 链 + 饱和调用直调 |
| micro_apply_dyn | 运行期选闭包后动态应用 | 解析不出的 head 走 `rt_apply` 饱和快路径 |
| micro_partial | 每轮部分应用 shim | 已知 arity 的 shim 调用；shim 仍逐轮分配 |
| micro_overapply | 一次给足两层实参 | `rt_apply` 过度应用路径；首参闭包捕获 |
| micro_capture | maker 返回捕获闭包 | 堆环境 + 每轮分配（D129 的剩余慢路径） |
| micro_closure8 | 8 参闭包饱和应用 | 闭包 ABI：5 个寄存器 + 3 个栈实参 |
| micro_args8 | 非尾 8 参直调 | 标准 ABI：6 个寄存器 + 2 个栈实参，返回后回收 |
| micro_record_dispatch | 投影字段 head | 不参与去虚拟化，走 `rt_apply` |
| closure_pipeline | 部分应用闭包表 | 列表元素构造为 shim，fold 里动态应用 |
| sorting | 归并排序（List + Pair 拆半） | List 单元与模式匹配与手写一致 |
| float_math | Float 算术 / sqrt / abs / 转换 | 浮点内建；盒装表示与 OCaml 相同 |
| text_scan | 逐字节 `strAt` 扫描 | `strAt` 直调原语，不经 List 桥接 |
| nat_bits | Nat 饱和算术 + 63-bit 位运算 | Nat 运行时即 Int；位运算内建 |
| tco_mutual | 互递归（`even`/`odd`） | 尾调用在 OCaml 侧直接复用栈帧 |
| tco_wide | 9 参数尾递归（3 个栈参数） | 尾调用与栈传参 ABI 由 ocamlopt 处理 |
| micro_tco | 最小自递归尾调用 | 旋转后的 loop header + 比较直发分支 |
| tco_args | 交叉依赖实参的尾递归 | 实参按需落临时槽 + 统一写回 |
| tco_unrotated | 双支自调用 / `&&` 条件 | 不旋转时回退整帧 `jmp` |
| tco_arity6 | 6 参尾递归（全走寄存器） | 5 个热标量槽提升 |
| tco_narrow_wide | 2 参 ↔ 10 参窄调宽 | 尾位置内联折叠成自循环（见 §1.2） |
| tco_nat | Nat 结构递归尾调用 | `IrNatCase` 尾位置传播 + 前驱就地更新；饱和加法分支化 |
| state_machine | 9 状态 Int 分支链 | 跳转表 + 回边直连（臂尾只剩 `add` / `sub` / `jle`） |
| gc_low_live | 低存活集、大累计分配 | OCaml GC 回收；vuna 侧只有 bump 分配 |
| gc_array_churn | 大对象 churn（Array COW） | `Array.set` COW 与手写 `Array.copy` 对齐 |
| gc_retain | 高存活集（live ~19 MB）+ 等量 churn | 整堆回收要重扫整个存活集；整堆触发策略的测量项 |


场景覆盖：数值 / 字符串 / 容器 / 分配 / 数组 / 记录与变体 / 高阶函数与闭包 / 调用约定 /
算法 / 浮点 / 逐字节文本 / Nat 与位运算 / 尾调用与分支链 / GC / 线程与同步。新增场景按机制归入 `bench/programs/t<N>/`，
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
   `strConcatMany`；可变数据（`MutRef` 等值句柄）经 `MutOp` 标记隔离，不引入线性
   类型（见 [qtt.md](qtt.md) / [effects.md](effects.md) 与 debt D22）。
3. **容器与表示**：
   1. **内建类型构造子** `Array`（类型层，恒可见；OCaml 表示 `'a array`），
      签名支持隐式 `{a : Type}`。
   2. **Array 原语与库**（见 [primitives.md](primitives.md) §6.1、
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
- native 有**两代标记-清扫 GC**（[native-runtime.md](native-runtime.md) §1.2），峰值 RSS = 已触碰的栈页 + live 堆
  （自带栈未触碰的虚拟页不提交）；每个样本都同时给墙钟 / CPU / RSS，RSS 取样本最大值；
- `--runs 5 --warmup 2`：墙钟与 CPU 取中位数；基线记录生成时的 `meta.loadavg`，跨机器只比 ratio。

本机一档（16 核，`--target all --runs 5 --warmup 2`，生成时 `meta.loadavg ≈ 2.8`，同一窗口；
数值取 `programs.json`）：

| benchmark | native ms | OCaml 后端 ms | 手写 OCaml ms | native/手写 | native/OCaml 后端 | native RSS | 手写 RSS | RSS 比 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| arith | 1.7 | 3.4 | 2.7 | 0.63x | 0.50x | 0.9 MiB | 2.7 MiB | 0.35x |
| string_ops | 1.2 | 2.5 | 1.3 | 0.89x | 0.45x | 0.9 MiB | 3.3 MiB | 0.29x |
| hashmap | 8.4 | 6.8 | 2.0 | 4.18x | 1.24x | 3.9 MiB | 4.1 MiB | 0.95x |
| list_recursion | 25.3 | 9.2 | 13.9 | 1.82x | 2.77x | 19.9 MiB | 11.4 MiB | 1.74x |
| gc_pressure | 41.3 | 32.9 | 26.5 | 1.56x | 1.25x | 32.8 MiB | 11.3 MiB | 2.90x |
| array | 20.5 | 13.9 | 14.8 | 1.38x | 1.47x | 27.4 MiB | 15.5 MiB | 1.77x |
| records | 19.3 | 13.7 | 5.4 | 3.57x | 1.41x | 1.0 MiB | 4.7 MiB | 0.21x |
| closures | 19.4 | 8.9 | 7.1 | 2.74x | 2.17x | 24.4 MiB | 8.8 MiB | 2.78x |
| micro_apply | 2.0 | 8.5 | 7.2 | 0.27x | 0.23x | 0.9 MiB | 2.7 MiB | 0.32x |
| micro_apply_dyn | 5.1 | 9.2 | 10.4 | 0.49x | 0.55x | 0.9 MiB | 2.7 MiB | 0.32x |
| micro_partial | 4.9 | 18.3 | 11.4 | 0.43x | 0.27x | 0.9 MiB | 4.6 MiB | 0.19x |
| micro_overapply | 6.1 | 22.8 | 24.0 | 0.25x | 0.27x | 0.9 MiB | 4.6 MiB | 0.19x |
| micro_capture | 4.8 | 19.1 | 15.2 | 0.32x | 0.25x | 1.0 MiB | 4.6 MiB | 0.21x |
| micro_closure8 | 0.7 | 3.2 | 2.2 | 0.32x | 0.22x | 0.9 MiB | 2.7 MiB | 0.32x |
| micro_args8 | 2.6 | 10.8 | 10.2 | 0.26x | 0.24x | 0.9 MiB | 2.6 MiB | 0.33x |
| micro_record_dispatch | 14.5 | 8.0 | 6.4 | 2.27x | 1.81x | 0.9 MiB | 2.7 MiB | 0.32x |
| closure_pipeline | 10.6 | 4.5 | 3.5 | 3.06x | 2.34x | 0.9 MiB | 2.8 MiB | 0.32x |
| closures | 18.3 | 10.1 | 6.7 | 2.73x | 1.81x | 24.4 MiB | 8.7 MiB | 2.81x |
| sorting | 38.5 | 19.1 | 15.7 | 2.45x | 2.01x | 16.3 MiB | 9.5 MiB | 1.71x |
| float_math | 3.9 | 13.0 | 5.5 | 0.72x | 0.30x | 0.9 MiB | 4.7 MiB | 0.20x |
| text_scan | 3.5 | 4.1 | 2.4 | 1.47x | 0.85x | 3.4 MiB | 3.6 MiB | 0.94x |
| nat_bits | 1.4 | 3.9 | 1.9 | 0.72x | 0.35x | 0.9 MiB | 2.7 MiB | 0.35x |
| tco_mutual | 7.2 | 10.8 | 10.0 | 0.73x | 0.67x | 0.9 MiB | 2.7 MiB | 0.35x |
| tco_wide | 4.0 | 5.5 | 4.4 | 0.90x | 0.72x | 0.9 MiB | 2.7 MiB | 0.35x |
| gc_low_live | 247.2 | 335.2 | 408.8 | 0.60x | 0.74x | 2.8 MiB | 244.5 MiB | 0.01x |
| gc_array_churn | 161.0 | 214.6 | 134.8 | 1.19x | 0.75x | 3.1 MiB | 82.3 MiB | 0.04x |
| gc_retain | 185.0 | 85.9 | 41.2 | 4.49x | 2.15x | 55.4 MiB | 19.5 MiB | 2.84x |


读法：

- **arith 曾是 67.6x / 412 MiB**：300 万层递归帧不回收，时间花在栈页 fault 而不是指令质量。
  它的递归主体是**直接饱和尾调用**；标量内联、常数除法展开与条件直发分支把循环体压成
  `cmp` / `jg` + 全内联算术：当前 1.7 ms / 0.9 MiB（手写 2.7 ms，0.63x；§1.2）。
- **native/OCaml 后端 0.3–2.8x 的一档**：`string_ops` / `hashmap` / `list_recursion` / `gc_pressure` / `array` / `records` / `closures` / `sorting` / `text_scan` / `nat_bits`；`closures`（2.17x）与 `records`
  （1.41x）的差距来自闭包/对象表示、非尾递归与「所有中间值占栈槽」的朴素 codegen
  （闭包调用不在尾调用覆盖面内，见 [native.md](native.md) §3）。
- **相对手写对照 2.5x 以上的一档各有明确的单一来源**：`records` 曾是 80 万层尾递归帧 +
  每步 record 分配 + 闭包-per-`let`（TCO 后 19 ms / 1.0 MiB，3.57x）；`closures`
  19 ms（2.74x）是函数参数只能在运行时按 arity 分派；`gc_retain` 在 GC 侧（整堆重扫
  存活集，见下）。浮点曾是每次运算的装箱对象（11.43x）：字面量常量化 + 表达式树在
  `xmm` 上算完、根只装盒一次之后 3.9 ms（0.72x）。
- `tco_mutual` / `tco_wide` 曾经几乎全是**栈帧成本**（RSS 与墙钟随递归深度线性增长、
  `default_stack_ok=false`）；TCO 后 7 / 4 ms、0.9 MiB、`true`（§1.2）。
- 零参别名直调（`Nat.plus` / `Nat.mult` / `Nat.toInt` …）、闭包只捕获自由变量与调用点
  去虚拟化之后，`nat_bits` 的 native / 手写 OCaml 是 0.72x（对 C 仍 3.29x）；剩余差距
  是函数参数这种只能在运行时按 arity 分派的调用面。
- **GC 的主判据已成立**：逐帧保守扫根会把帧内**已死**的指针槽当成根（`gc_low_live` 的
  `churn` 每帧用完 `xs` / `s` 之后递归），`Native.Live` 在递归 / 带回边的函数里对指针槽
  在最后一次读之后写 0（[native.md](native.md) §3），死对象当轮即可回收：
  `gc_low_live` 247 ms / 2.8 MiB、`gc_array_churn` 161 ms / 3.1 MiB（手写侧 244.5 / 82.3 MiB）；
  对照「按精确槽集扫描」时期的 231 / 3.6 与 138 / 3.9 MiB，墙钟只差一点、RSS 落回存活集量级。
  `gc_pressure` 32.8 MiB 与 `gc_retain` 55.4 MiB（live 单调上升到 ~19 MB）仍符合预期，
  是 `VUNA_NATIVE_GC_LOG` 里 `gen=` 分布的测量项（[native-runtime.md](native-runtime.md) §1.2）。
- 峰值 RSS 的语义：OCaml 侧是 GC 后高水位，native 侧是栈页 + live 堆，C 侧是 malloc 高水位
  （t5 用显式 free，比到 C 就是 GC 元数据与高水位的代价）；wasm 减掉 node 地板后才进入比较。
  三者都只作量级参考，判定以 ratio 为主。
- 这组数不是 CI 门槛：跨机器、跨负载不可比；回归判断用 `--target native --check` 对
  `bench/baselines/programs.json` 的 ratio、rss_ratio、artifact 与 `default_stack_ok` 变化做提示。

### 1.2 TCO / GC 验证项

native 的 TCO / GC 验证项。**GC 与 TCO 均已落地**；下表「前」列取 §1.1 的 TCO 前快照，
「后」列是 `--target both --runs 5 --warmup 2 --only <name>` 的实测（与 §1.1 同口径）：

| 用例 | TCO 前（旧 N） | TCO 后实测（当前 N） | 判定列 |
| --- | --- | --- | --- |
| `tco_mutual`（N=20M） | 189 ms / 244 MiB / `default_stack_ok=false` | 7 ms / 0.9 MiB / `true` | wall, rss, stack |
| `tco_wide`（N=5M） | 343 ms / 442 MiB / `false` | 4 ms / 0.9 MiB / `true` | wall, rss, stack |
| `arith` | 338 ms / 412 MiB / `false` | 2 ms / 0.9 MiB / `true` | wall, rss, stack |
| `records` | 151 ms / 151 MiB / `false` | 19 ms / 1.0 MiB / `true` | wall, rss, stack |

「TCO 前」是旧 N 的历史快照；`tco_mutual` / `tco_wide` 的 N 已抬到 20M / 5M，
「后」列与当前 fixture 同 N。

- **TCO**：判据是 `default_stack_ok` 由 false 翻为 true，且 RSS 从百 MB 降到进程基线
  （~0.9 MiB）；上表前四项都满足。`arith` / `records` 也翻真，说明它们的递归主体同样是
  **直接饱和尾调用**；`tco_wide` 覆盖 9 参（3 个栈实参）的自递归。`tco_narrow_wide`
  现在被尾位置内联折叠成 `acc += 36` 的自循环：它锁内联后的形状，不再量窄调宽回退。
  回退本身仍保留在未被内联消除的 SCC 上（见 [native.md](native.md) §3）。
- **T2 覆盖矩阵**（每项锁一条生成路径；`micro_tco` 是层内基线）：

  | 用例 | 形状 | 锁住的生成路径 / 判定 |
  | --- | --- | --- |
  | `micro_tco` | 单函数自递归 + 标量比较 | 旋转后的 loop header、自递归实参写回 |
  | `tco_mutual` | `even` / `odd` 互递归 | 尾位置内联后的自递归 loop（互递归直调不再命中） |
  | `tco_wide` | 9 参（3 个栈实参） | 来参区搬运；`arity > 6` 不提升 |
  | `tco_args` | 交叉依赖实参 | 临时槽 + `copyBacks` 的写回顺序（golden） |
  | `tco_unrotated` | 两支自调用 / `&&` 条件 | 不旋转时回退整帧 `jmp` |
  | `tco_arity6` | 6 参全部循环携带 | 5 个热标量槽提升的上限 |
  | `tco_narrow_wide` | 2 参 ↔ 10 参互递归 | 尾位置内联折叠成自循环；不再覆盖回退路径 |
  | `tco_nat` | Nat `zero` / `Succ` | `IrNatCase` 尾位置传播 + 前驱就地更新；饱和加法分支化 |
  | `state_machine` | 9 状态 Int 分派 | 跳转表 + 回边直连（§1.6.4） |
- **GC**：主判据是 RSS 落在存活集量级，四项都满足——`gc_low_live` 247 ms / 2.8 MiB、
  `gc_array_churn` 161 ms / 3.1 MiB、`gc_pressure` 32.8 MiB、`gc_retain` 55.4 MiB。
  `gc_low_live` / `gc_array_churn` 此前的不满足来自逐帧保守扫根把陈旧栈槽里的死对象一并留住；
  `Native.Live` 的死槽清零（[native.md](native.md) §3）把两项拉回存活集量级。
  `VUNA_NATIVE_GC_LOG=1` 可逐次看 `live` / `gen`。两代回收里年轻代只扫根集与脏卡片、
  整堆回收按计数轮换（见 [native-runtime.md](native-runtime.md) §1.2）；阈值取 `max(GC_MIN, live/8, 栈跨度)`
  （年轻代）与 `max(GC_MIN, 2 × live, 栈跨度)`（整堆）摊销扫栈成本；栈帧整段保守扫。
- 重标基线时 `default_stack_ok` 是布尔快照：自带栈生效时所有项都应为 true（包括非尾深
  递归）；false 说明 `init_stack` 回落到了进程栈。非尾深递归的栈帧成本仍体现在 RSS 与
  墙钟上——未被尾位置内联消除的窄调宽与 `rt_apply` 慢路径仍回退普通调用。

### 1.3 wasm 后端（浏览器路径：JS 宿主 / V8）

wasm 产物由仓库自带的宿主执行（`wasm-host/run.mjs`，Node/V8；与浏览器同一套
`WebAssembly` API 和 host 层）。`--target wasm`（或 `--target all`）跑同一批程序
（另有 9 个效应基准与 `startup` / `traits` 见 §1.4）。

> **读数来源**：`bench/baselines/programs.json`（`--target all --runs 5 --warmup 2`；
> node v24.21.0、wasm-opt 133）。wasm ms 是绝对 `median_ms`（含 ~22 ms 宿主启动），
> `wasm/手写` 列是减掉 `meta.node_startup_ms` 后的 net 比值；cpu / rss 的绝对量与 net
> 值都在 JSON（`wasm.net_cpu_ms` / `wasm.net_rss_kb`）。

本机一档（绝对 ms / RSS 只作同机对比；每行取同一窗口的 `programs.json`）：

| benchmark | wasm ms | native ms | OCaml 后端 ms | 手写 ms | wasm/手写（net） | native/手写 |
| --- | --- | --- | --- | --- | --- | --- |
| arith | 31.7 | 1.7 | 3.4 | 2.7 | 3.57x | 0.63x |
| float_math | 41.2 | 3.9 | 13.0 | 5.5 | 3.52x | 0.72x |
| hashmap | 52.9 | 8.4 | 6.8 | 2.0 | 15.48x | 4.18x |
| hashmap_remove | 109.5 | 116.1 | 37.3 | 3.8 | 23.29x | 30.89x |
| micro_apply | 59.3 | 1.8 | 7.4 | 7.3 | 5.12x | 0.25x |
| micro_apply | 49.0 | 2.0 | 8.5 | 7.2 | 3.73x | 0.27x |
| micro_apply_dyn | 93.6 | 5.1 | 9.2 | 10.4 | 6.88x | 0.49x |
| micro_partial | 38.5 | 4.9 | 18.3 | 11.4 | 1.45x | 0.43x |
| micro_overapply | 101.3 | 6.1 | 22.8 | 24.0 | 3.30x | 0.25x |
| micro_capture | 38.7 | 4.8 | 19.1 | 15.2 | 1.09x | 0.32x |
| micro_closure8 | 85.6 | 0.7 | 3.2 | 2.2 | 28.82x | 0.32x |
| micro_args8 | 45.9 | 2.6 | 10.8 | 10.2 | 2.35x | 0.26x |
| micro_record_dispatch | 52.3 | 14.5 | 8.0 | 6.4 | 4.73x | 2.27x |
| closure_pipeline | 47.3 | 10.6 | 4.5 | 3.5 | 7.29x | 3.06x |
| micro_concat | 80.1 | 16.7 | 27.7 | 14.0 | 4.17x | 1.19x |
| nat_bits | 36.2 | 1.4 | 3.9 | 1.9 | 7.57x | 0.72x |
| priority_queue | 69.1 | 34.5 | 17.4 | 8.4 | 5.59x | 4.08x |
| queue | 55.6 | 8.3 | 5.8 | 1.8 | 18.61x | 4.59x |
| records | 75.8 | 19.3 | 13.7 | 5.4 | 9.96x | 3.57x |
| sort_lib | 65.7 | 19.3 | 16.5 | 4.3 | 10.25x | 4.51x |
| string_ops | 31.7 | 1.2 | 2.5 | 1.3 | 7.59x | 0.89x |
| micro_tco | 56.9 | 5.6 | 10.8 | 9.8 | 3.58x | 0.58x |
| tco_mutual | 64.4 | 7.2 | 10.8 | 10.0 | 4.26x | 0.73x |
| tco_wide | 41.8 | 4.0 | 5.5 | 4.4 | 4.50x | 0.90x |
| tco_args | 46.2 | 16.0 | 17.4 | 15.4 | 1.58x | 1.03x |
| tco_unrotated | 64.3 | 8.0 | 7.3 | 8.3 | 5.08x | 0.96x |
| tco_arity6 | 41.6 | 4.9 | 8.2 | 7.5 | 2.61x | 0.65x |
| tco_narrow_wide | 43.2 | 0.7 | 3.9 | 3.1 | 6.80x | 0.22x |
| tco_nat | 41.2 | 5.2 | 8.4 | 5.5 | 3.51x | 0.94x |
| state_machine | 45.4 | 4.9 | 10.1 | 5.9 | 4.01x | 0.84x |
| treemap | 106.1 | 41.9 | 25.4 | 8.8 | 9.52x | 4.74x |
| gc_retain | 382.6 | 185.0 | 85.9 | 41.2 | 8.76x | 4.49x |
| array / closures / list_recursion / sorting / text_scan / gc_pressure / gc_array_churn / gc_low_live | `run_ok=false` | 20.5 / 19.4 / 25.3 / 38.5 / 3.5 / 41.3 / 161.0 / 247.2 | 13.9 / 8.9 / 9.2 / 19.1 / 4.1 / 32.9 / 214.6 / 335.2 | 14.8 / 7.1 / 13.9 / 15.7 / 2.4 / 26.5 / 134.8 / 408.8 | — | — |


口径（读数前先看）：

- `net_median_ms` 只减掉 node 空启动，**不含**模块读/编译/实例化：`VN_PERF_STATS=1`
  另报 `read_ms` / `compile_ms` / `instantiate_ms` / `start_ms`（JSON 的 `startup` 字段），
  `start_ms` 是程序本体（`_start` 到退出），其余是固定成本。
- **V8 默认的 wasm 栈约 1 MB**：Node 下 `--stack-size` 会按比例放大这个上限（`sorting` 在
  默认栈 trap，`--stack-size=5000` 跑过），但浏览器没有对应开关，所以基线按默认上限采集。
  上表八个非尾深递归程序以 `Maximum call stack size exceeded` 收口，JSON 记
  `"run_ok": false, "skip_reason": "run"`。`wasm-opt` 不改变这一点——优化后这 8 项仍然 trap
  （栈深问题，不是性能问题）。这是浏览器路径的实际执行边界，不是测量设施的限制。
- **RSS 口径**：wasm 先减空 node 进程的固定地板（`meta.node_rss_kb`，JSON `net_rss_kb`），
  减完才是与 OCaml「GC 高水位」、native「栈页 + live 堆」可比的量；wasm 线性内存
  （`memory_bytes`）是 GC 堆的真实大小，单独记录。node 进程的绝对 `rss_kb`（~55 MB 起）
  只作宿主开销参考。
- **引擎/宿主版本是一阶变量**：基线只与 `meta.node` + `meta.wasm_host_runner` 同版本
  可比；换 Node 版本要重标基线。

读法：`hashmap_remove` 接近；`tco_args` 两侧已落在同一量级（见 §1.2）。其余跑得动的项
native 领先。差异来源与 native 的既有缺口一致：native 无寄存器分配、每个算术 / 比较
都是一次运行时调用，而 V8 有优化编译器；native 赢在「调用少、字符串 / 栈传参多」的形状
（[performance-hotspots.md](performance-hotspots.md) §2）。

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

### 1.6 机制分层（T0–T12）

用例按机制归到 `bench/programs/t<N>/`，清单与新增规则见
[`bench/programs/TIERS.md`](../../bench/programs/TIERS.md)。tier 是累积的：诊断从 T0 往上走，
**第一个不达标的 tier 就是问题所在**。T4–T12 的机制覆盖与目标矩阵见
[`bench/programs/TIERS.md`](../../bench/programs/TIERS.md)；深栈 / 线程 / Fs / FFI 的
target 例外在 sidecar 里显式登记，不再用 wasm 静默 `run_ok=false` 代替。三端同窗口：`vuna`（native）、`vuna_ocaml`
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
    指针，整棵树仍只装箱一次；当时的剩余差距是 `sqrt` 与装盒 / 搬运（后续两档把它们
    收掉了，见 §1.6.3）。
- **常量除法与 Nat 库调用已收口**：
  - `scalar_idiv` native 1.39x c：非 2 幂常量除法改走 magic 乘法（`imul` 高半）+
    符号修正，不再 `cqo` + `idiv`；`d = 3` / 负常量仍回退 `idiv` / 运行时。
  - `nat_bits` native 0.79x c / 1.03x ml：`Nat.plus` / `Nat.mult` / `Nat.fromIntClamp` 的零参
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

- **`IrNatCase` 的 0 / 后继事实**：给 `nat_bits` 这类结构递归补范围；
- **未引用 `.bss` 缓冲**：可达性裁剪只裁了函数，8 MiB 的 `rt_read_buf` 等仍进产物。
- **周期展开（未做）**：默认 C 会把确定性状态循环/k 步递推整段展开（`tco_mutual` 的 C
  折成 `subq $2; jne`）。§1.6.4 的仿射累加折叠已经把退出表达式仿射的循环收成累加器
  （`tco_wide` / `tco_arity6`），但周期展开与二阶归纳仍没有做；同形 C（关掉这些 loop
  pass）下 native 与 C 已在同一量级。
- **通用 if-conversion（未做）**：`tco_unrotated` 的 guard 循环已用「尾位置 if 合并 +
  `BoolStep`」变成 `acc + select(1, 2)` 的无分支更新，但 `step` 两臂仍是 `acc+n` /
  `acc-n` 的两条尾调用；C 用 `cmov` 把 `flag ? n : -n` 合成一条。把任意标量选择落成
  `cmov` 需要值位置的 if-conversion，不在当前 pass 的覆盖内。

#### 1.6.2 入口初始化裁剪

T0 达标之后，`_start` 不再无条件初始化全部子系统：只按程序实际用到的部分发调用，
并按 `_start` 的标签可达性裁剪运行时函数（规则见 [native-runtime.md](native-runtime.md) §1.1）。
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

#### 1.6.3 T1 标量 / 浮点收口（2026-11-25）

§1.6.1 列出的「复制合并 / `lea` / 32-bit 窄化」三条已落地，同一轮还做了浮点形参拆箱与
有符号常量除法的符号修正改写（实现见 [native.md](native.md) §2 / §4）：

| 用例 | 改动前 vs c | 改动后 vs c | 机制 |
| --- | --- | --- | --- |
| `scalar_cmp` | 1.98x | **1.00x** | 比较改 `xor rax, rax; cmp; setcc`，切断 `setcc al` 对上一轮 `rax` 的部分寄存器依赖 |
| `scalar_ilp` | 1.54x | **0.99x** | `d = d*5+7` 折成 `lea d, [d+d*4+7]`（1 拍替 3 拍 `imul`），`a += n*3` 也走 `lea` |
| `scalar_muladd` | 1.24x | **0.96x** | `& 0xFFFF_FFFF` 折成 `mov r32, r32`（零扩展），省掉一次 scratch 装掩码 |
| `scalar_divsigned` | 1.72x | **1.00x** | 负被除数的 63-bit wrap + `/ 2^k` 先融成 `lea x+x+c` + `shl` + `cmovns` + `sar k+1`；§1.6.4 的形参区间证明被除数已归一化后省掉 `shl`，`cmovs` 直接吃 `sub` 留下的符号位（3 跳链） |
| `float_math` | 2.5x | **~1.0x** | 浮点形参常驻 xmm8（前一档）＋ `if <浮点比较> then <字面量> else <字面量>` 改掩码选择（`cmpltsd` + `andpd`，14 条降到 4 条） |

读数在同一台机器（Ryzen 7 7840HS）同一会话内交替测得，loadavg 3–5，绝对 ms 只作方向
参考；「默认 C」= GCC 16 `-O2`。`float_math` 现在与默认 C 同档（4.6ms → ~3.0ms，
C ~3.1ms）：剩下的差别只有 `movapd` 往返与常量装填。掩码选择只在**两支都是字面量**时用；
一般原子仍走 `ucomisd` + `cmov` 选指针——那种形态要用三条按位指令拼掩码，会把树的标量
运算挤到已饱和的 FP 端口上（实测慢 25–40%）。按位那侧只用 `andpd`：`andnpd` 在 Zen 4 上
明显更慢（同一循环 4.7ms vs 3.0ms），能换反向谓词的都换。

`scalar_divsigned` 剩余 1.19x：C 只发 `sub` + `lea` + `cmovs` + `sar`（7 条 / 4 拍），
我们多两条 `mov` 搬运（`mov rax, r12` / `mov r12, r11`）。把除法链直接写进槽提升的
目标寄存器还能再省 1–2 条（实测 10.3ms → 9.6ms，与 C 同档），但那要做一次链式目标
改写，留作单独一档。

#### 1.6.4 T2 回边直连、循环代数化与守卫复用（2026-11-25/26）

T2 的控制流 / 尾调用 / 循环体差距里，大部分来自「每轮重新分派、重复守卫测试、把整组
形参都留在循环里」，不是调用约定本身。`Native.Regs.optimizeDispatch`
（[native.md](native.md) §3.13）、`Native.Affine`（§3.14）、`Native.Inline.mergeTailIfs`
（§3.15）与 `Native.Params`（§3.16）落地这些机制：

1. **稠密分派回边直连**：臂在回边前把 scrutinee 写成常量时，回边直接接到目标臂；臂尾的
   `sub n, 1` 同时给守卫提供标志位。`state_machine` 每步从「间接跳转 + 守卫测试」降到
   `add` / `sub` / `jle`（臂尾不再有 `jmp`）。
2. **0/1 状态回边**：`s = xor(setcc, 1)` 的 default 臂走 `test s, s; je 臂0; jmp 臂1`，
   不再回跳转表。
3. **常量守卫**：回边处守卫测的寄存器是常量时直接判方向（`tco_unrotated` 的 `flag`）。
4. **两级守卫旋转**：`tco_mutual` 内联后的 `if n <= 0 … else if n <= 1 … else loop (n-2)`
   先测内层守卫，快路径每轮只剩 `sub` / `cmp` / `jg`。
5. **自递归循环的守卫标志复用**：体尾 `sub` 直接给回边 `jg` 提供标志位，每轮少一条
   `test`（`micro_tco` / `tco_arity6` / `tco_args` / `tco_wide`）。
6. **标量三元选择与帧槽中转折叠**：饱和加法两端的 `mov d, rax` 收成直接写 `d`；只出现
   两次的帧槽往返换成寄存器搬运。
7. **循环形参留在来参寄存器**：`tco_wide` 的 `a`–`f` 不再逐轮 load / store，
   `state_machine` 的 `s` / `acc` / `n` 省掉 push/pop（[native.md](native.md) §3.7）。
8. **仿射累加折叠 + 常量项移位**：`tco_wide` 的 8 个常量累加与 `tco_arity6` 的参数旋转
   折叠成一个累加器（`s += n; n -= 1`），常量项再挪进 wrapper 初值（§3.14）。
9. **饱和求和拆分**：`tco_nat` 的入口计数有界时走普通 `+` 的快循环，越界才走保留饱和的
   慢循环（§3.14）。
10. **尾位置 if 合并 + `BoolStep` 选择**：`tco_unrotated` 的 guard 循环把 `acc + 1` /
    `acc + 2` 合成 `acc + select(1, 2)`，选择落成 `xor` + `add`，不再每轮条件分支（§3.15）。
11. **提升后的短循环对齐**：槽提升 / 折叠之后按最终指令数再补 `.p2align 4`（T1 的
    `scalar_bit` / `scalar_divsigned` 与各 T2 环都受益）。
12. **形参区间不动点 + 归一化被除数除法**：`Native.Params`（§3.16）给循环形参补上整程序
    区间（入口调用的常量实参 + 守卫下的自调用实参），于是 `acc - n` 可证明不溢出，
    `Native.Module.normOf` 认定被除数已归一化，常量的有符号除法不再需要 `shl` 回罩：
    `sub S, B; lea T, [S+C]; cmovs S, T; sar S, k`。`scalar_divsigned` 的循环体从 8 条
    指令、4 跳关键路径（`sub → shl → cmov → sar`）降到 7 条、3 跳（`sub → cmovs → sar`），
    与手写 C 同形。`Range.divRange` 同时补上负被除数的对称幅值界，不动点才能收敛。

同窗口（`--target native --runs 15`，loadavg 2–6；绝对值不可与旧基线直接比，CPU 比值
按同窗口自洽）：**t0 0.89x / t1 0.99x / t2 0.95x C**（t2 基线 1.70x），T0 一档全部
< 0.9x，T1 最大 1.13x（`nat_bits`）、T2 最大 1.16x（`state_machine`）。逐项：
`state_machine` 2.8x → 1.16x、`tco_nat` 1.66x → 0.96x、`tco_wide` 2.1x → 0.84x、
`tco_arity6` 1.37x → 0.69x、`tco_mutual` 2.2x → 0.92x、`tco_args` 1.14x、
`tco_unrotated` 2.0x → 1.07x、`micro_tco` 0.93x、`tco_narrow_wide` 0.96x；T1 的
`scalar_bit` 1.94x → 1.12x、`scalar_divsigned` 1.72x → 1.00x。剩余差距集中在默认 C 的
**周期展开**：`state_machine` 的 9 状态链被 C 直接串成直线、`tco_mutual` / `tco_wide`
的闭环被折成 `subq $2; jne`；vuna 侧只有「回边直连 + 仿射折叠」，还没做周期展开与
二阶归纳。

基线尚未重标：`bench/baselines/programs.json` 仍是旧口径，重标用
`sh bench/update-baselines.sh --only programs`。

#### 1.6.5 T3 覆盖矩阵

t3 的每条用例锁一条调用约定 / 闭包生成路径；`micro_apply` 是层内基线（特化后的直调），
其余 micro 把 `rt_apply`、部分应用 shim、过度应用、捕获闭包与栈实参分别拆开，
`closures` / `closure_pipeline` 是真实程序验收：

| 用例 | 形状 | 锁住的生成路径 |
| --- | --- | --- |
| `micro_apply` | 顶层函数作为实参传入循环 | 高阶参数特化后的直调 |
| `micro_apply_dyn` | 运行期在闭包之间选择 | `rt_apply` 饱和快路径 |
| `micro_partial` | 每轮 `add k` 后再饱和 | 部分应用 shim 分配 + 已知 arity 闭包调用 |
| `micro_overapply` | 一次给足两层实参 | `rt_apply` 过度应用 |
| `micro_capture` | maker 每轮返回捕获闭包 | 堆环境 + 闭包分配 |
| `micro_closure8` | 8 参闭包饱和应用 | 闭包 ABI 第 6~8 个实参走栈 |
| `micro_args8` | 非尾直调 8 参函数 | 标准 ABI 栈实参 + 返回后回收 |
| `micro_record_dispatch` | record 字段里的闭包 | 投影 head 的 `rt_apply` |
| `closures` | 高阶函数 / 每次迭代新建闭包 | 真实程序验收 |
| `closure_pipeline` | `List (Int -> Int)` 逐轮 fold | 表内闭包派发的真实程序验收 |

本机一档（`--target all --runs 5 --warmup 2`，2026-11-26，loadavg ≈ 2.3；
`ns/op = median_ms × 1e6 / ops`，绝对 ms 只同机可比）：

| 用例 | native ms | native ns/op | native vs c | native vs ml | vuna_ocaml vs c | vuna_ocaml vs ml |
| --- | --- | --- | --- | --- | --- | --- |
| micro_apply | 1.97 | 0.39 | 0.28x | 0.27x | 1.22x | 1.18x |
| micro_apply_dyn | 5.06 | 1.01 | 0.88x | 0.49x | 1.59x | 0.89x |
| micro_partial | 4.93 | 0.99 | 0.78x | 0.43x | 2.89x | 1.61x |
| micro_overapply | 6.13 | 1.23 | 0.97x | 0.25x | 3.62x | 0.95x |
| micro_capture | 4.83 | 0.97 | 0.75x | 0.32x | 2.96x | 1.26x |
| micro_closure8 | 0.70 | 1.39 | 0.37x | 0.32x | 1.72x | 1.46x |
| micro_args8 | 2.62 | 0.53 | 0.25x | 0.26x | 1.01x | 1.06x |
| micro_record_dispatch | 14.52 | 2.90 | 2.21x | 2.27x | 1.22x | 1.25x |
| closures | 18.31 | 91.56 | 16.66x | 2.73x | 9.22x | 1.51x |
| closure_pipeline | 10.61 | 13.26 | 4.58x | 3.06x | 1.96x | 1.31x |

- 层的基线是 `micro_apply`：特化把高阶参数换成直调后，native 0.28 ns/op，低于手写 C。
- 闭包路径已收口到 1.2x C 以内的 6 条：`micro_apply` / `micro_apply_dyn` /
  `micro_args8` / `micro_partial` / `micro_capture` / `micro_closure8`（0.18–0.90x C）。
  同机 A/B 见 §1.6.6。
- `micro_overapply` 2.08x、`micro_record_dispatch` 2.60x：前者每轮把同一个
  `n - n/1000*1000` 求值两次（还没有标量 CSE），后者每轮一次投影 + arity 检查 +
  间接调用（C 只有一次间接调用）。
- `closures` / `closure_pipeline` 的 vs-C 列不是同形状对照：C 对照直接循环 / 栈上闭包数组，
  vuna 侧要建 List 并逐节点 fold；它们的 native/手写 OCaml 是 2.63x / 3.32x。

#### 1.6.6 T3 调用约定 / 闭包优化（2026-11-26）

T3 读数里的大头是「高阶参数在调用点只被当成未知闭包」：`apply1 (mk k) acc` 被拆成
部分应用 shim + `rt_apply`，`micro_args8` 的 8 参函数体超过内联阈值，`micro_apply_dyn`
把条件选出的函数值又交给 `rt_apply`。本轮在 native 前端（`Native.Specialize` /
`Native.Inline`，[native.md](native.md) §3.5–§3.6）做四组收口：

1. **闭合部分应用参与特化**：`loop (mk8 3)` / `apply1 (mk 3) x` 克隆被调，把形参换成
   `mk 3`，`(mk k) x` 由 `flattenApp` 合回 `mk k x` 后直调；
2. **同作用域应用内联**：实参可以是已知定义的（部分 / 饱和）应用，代入后仍在调用方
   作用域；链式内联继续改写内联结果，复制多次的非平凡实参先绑 `let`；
3. **过度应用 / `if` head 拆分**：按运行时 arity 拆「饱和一段 + 剩余应用」，`(if …) x`
   和标量调用的 `if` 实参都先分到两支；立即 lambda 在体化简成标量树后 β 归约；
4. **纯标量体放宽内联**：全由变量 / 字面量 / 白名单标量叶子组成的体上限 16 → 64
   （`mix8` / `mk8` 这类多参算术直接展开，不再走 8 参调用与栈实参）；
5. **let 外提 + 循环内标量 CSE**：内联/β 归约留在实参位置的 `let` 回到语句位置，
   同一次迭代里重复的纯标量树只算一次（`micro_overapply` 的两次取模只做一次）。

同机 A/B（`--target native --runs 5 --warmup 2`，比值对同一窗口的手写 C）：

| 用例 | 优化前 vs C | 优化后 vs C | native 变化 |
| --- | --- | --- | --- |
| `micro_apply` | 0.28x | 0.28x | 1.8 → 2.0 ms |
| `micro_apply_dyn` | 4.10x | 0.88x | 23.6 → 5.1 ms |
| `micro_args8` | 2.63x | 0.25x | 26.2 → 2.6 ms |
| `micro_partial` | 16.71x | 0.78x | 106.6 → 4.9 ms |
| `micro_capture` | 14.15x | 0.75x | 104.0 → 4.8 ms |
| `micro_closure8` | 6.59x | 0.37x | 13.0 → 0.70 ms |
| `micro_overapply` | 18.83x | 0.97x | 117.3 → 6.1 ms |
| `micro_record_dispatch` | 2.54x | 2.21x | 15.5 → 14.5 ms |
| `closures` / `closure_pipeline` | 18.4x / 5.9x | 16.7x / 4.6x | 19.0 → 18.3 / 10.5 → 10.6 ms |

T3 的 9 条非基线用例里 6 条进入 1.2x C 以内。剩余：`micro_record_dispatch` 的投影
head 仍是动态应用（2.2x）、`closure_pipeline` 的闭包表逐轮 fold（4.6x）、`closures`
要建 200k 的 List 而 C 对照直接循环（16.7x，vs-C 不是同形状对照）。

### 1.7 T11 线程 / 同步

t11 的线程用例各开 4 个线程（原有五个 + Condvar / CAS / tryLock / 并行 fold / effectful parMap / 嵌套 spawn）：`thread_atomic_counter`（atomic fetchAdd）、
`thread_mutex_counter`（mutex + atomic load/store）、`thread_parallel_sum`（4 段纯累加）、
`thread_par_map`（`Base.Thread.Par.parMap` 按输入分块）、`thread_spawn_join`（2000 次
spawn/join）。手写 OCaml 对照用 `Domain`，C 对照用 `pthread`；线程原语与 Condvar / CAS /
tryLock / 嵌套 spawn 只开 `ocaml,native`，三条并行组合子（`thread_par_map` /
`thread_par_fold` / `thread_par_map_eff`）另跑 wasm（wasm 的 `Base.Thread` 顺序退化）。

本机一档（`--target all --runs 5 --warmup 2`，x86_64 / 16 核，loadavg ≈ 3–5；`ns/op` 与完整
三指标见 `programs.json`；ratio 对手写 OCaml，wasm 用 net）：

| 用例 | ml ms | vuna_ocaml ms | native ms | native vs ml (w/c) | wasm net ms |
| --- | --- | --- | --- | --- | --- |
| thread_atomic_counter | 2.60 | 5.40 | 118.53 | 45.52/80.53 | skipped |
| thread_cas | 5.22 | 21.15 | 454.02 | 86.89/97.37 | skipped |
| thread_condvar | 81.70 | 92.17 | 286.37 | 3.51/4.5 | skipped |
| thread_mutex_counter | 7.86 | 40.85 | 368.54 | 46.91/34.1 | skipped |
| thread_nested | 3.85 | 3.98 | 1.60 | 0.42/0.19 | skipped |
| thread_parallel_sum | 3.33 | 3.75 | 2.87 | 0.86/1.26 | skipped |
| thread_par_fold | 2.85 | 4.28 | 2.54 | 0.89/2.05 | 15.64 |
| thread_par_map | 2.64 | 4.15 | 3.23 | 1.22/1.71 | 12.86 |
| thread_par_map_eff | 2.93 | 3.99 | 2.49 | 0.85/1.27 | 14.51 |
| thread_spawn_join | 133.28 | 126.83 | 66.21 | 0.5/0.36 | skipped |
| thread_trylock | 7.65 | 11.04 | 594.85 | 77.74/83.97 | skipped |

读法：

- **同步计数器是唯一不在同一量级的一档**：native 的 `thread_atomic_counter` /
  `thread_mutex_counter` 墙钟约 46x / 47x，CAS / tryLock 约 87x / 78x。成本不在同步原语
  本身，而在
  **分配**：每轮 `atomicFetchAdd` / `withMutex` 都要分配 Eff 帧，native 在有子线程时每次
  `alloc` 拿 futex 堆锁（[primitives.md](primitives.md) §6.2），
  4 个线程争用同一把锁把 20 万次操作推到 0.42–0.75 s CPU。C 对照只做 `atomic_fetch_add` /
  `pthread_mutex_lock`，没有分配。
- **纯计算并行与手写对照同档**：`thread_parallel_sum` 0.86x、`thread_par_map` 1.22x、
  `thread_par_fold` 0.89x、`thread_par_map_eff` 0.85x、`thread_nested` 0.42x 墙钟；
  循环体不分配，`clone` + 固定栈没有额外成本。`thread_spawn_join` native 0.50x
  （`clone` 比 `Domain.spawn` 便宜），vuna_ocaml 与手写 Domain 持平（0.95x）。
- **RSS 侧 native 是 0.96 MiB（0.28–0.31x）**：固定 64 MiB 线程栈只提交触碰的页；
  OCaml 侧每个 Domain 的堆 / 栈是 3 MiB 量级。
- **wasm 只有并行组合子**：`Par.parMap` / `parFoldMap` / `parMapEff` 在 wasm 上顺序执行
  （单线程），net 12.9 / 15.6 / 14.5 ms 分别对手写 4×Domain 的 2.6 / 2.9 / 2.9 ms
  （约 4.9x / 5.5x / 5.0x）；差距主要是少了 4 路并行，不是同步开销。

### 1.8 T10 可变状态 / T12 宿主边界

T10 覆盖 `Base.Container.Mut*`：`micro_mut_ref`（MutRef 读改写）、`mut_array`（定长原地写）、
`mut_barrier`（老数组写入年轻对象，触发 old→young 写屏障）、`mut_dyn`（MutDynArray 容量增长）、
`mut_buffer`（MutBuffer 字节构建）、`mut_vec`（MutVec + Fin）。`micro_mut_ref` / `mut_array` /
`mut_barrier` / `mut_dyn` / `mut_buffer` 三端都跑；`mut_vec` 的 native
codegen 对动态 `Fin` 结果错误，只开 `ocaml,wasm`。native 的 pure 包装 CAF 初始化顺序问题
已在用例源码用 `runPure (…with… )` 绕过。

T12 覆盖宿主层：`host_clock`（Clock.Now）、`host_env`（Env.GetEnv）三端都跑；
`fs_roundtrip` / `fs_cursor` 用 `${TMPDIR:-/tmp}` 下的临时文件，只开 `ocaml,native`
（bench 的 wasm 宿主 preopen 当前工作目录，绝对 TMPDIR 路径在 preopen 外）；
`ffi_arith` 用受限 `extern` + case 私有 `vuna.toml` / `ffi/*.c`，只开 `ocaml`。
宿主 IO 的墙钟受 OS 调度影响，判定先看 CPU；FFI 的 C 对照是直接加法，比值含调用边界成本。
