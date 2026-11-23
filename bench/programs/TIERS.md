# 基准用例的机制分层

每个用例放在某个 `t<N>/` 层下，`t<N>` 就是它的 tier。tier 是**累积**的：一个用例
所需的最高机制决定它的层级，所以诊断从 T0 往上走，第一个不达标的 tier 就是问题
所在。每个用例本身是 `t<N>/<name>/` 子目录；目录名同时是用例名与基线 JSON 的键，
tier 取它的父目录名。

```
bench/programs/
  vuna.toml            # 全部用例共用的独立包上下文（只依赖 vuna-base）
  t0/ ... t12/         # 每层一个目录；层内每个用例一个 <name>/ 子目录
  t0/startup/          # <name>.vuna / .ml / .out / .bench（可选 .c）
```

## 层级

| tier | 机制 | 参照 | 用例 |
| --- | --- | --- | --- |
| t0 | 地板与入口 | 手写 OCaml / 裸 syscall C | `startup` |
| t1 | 标量算术与循环 | 手写 OCaml / C | `arith` `nat_bits` `float_math` `scalar_xor` `scalar_muladd` `scalar_divconst` `scalar_idiv` `scalar_divsigned` `scalar_cmp` `scalar_bit` `scalar_ilp` |
| t2 | 控制流与尾调用 | 手写 OCaml / C | `micro_tco` `tco_mutual` `tco_wide` `tco_args` `tco_unrotated` `tco_arity6` `tco_narrow_wide` `tco_nat` `state_machine` |
| t3 | 调用约定与闭包 | 手写 OCaml / C | `closures` `micro_apply` `micro_apply_dyn` `micro_capture` `micro_partial` `micro_overapply` `micro_args8` `micro_closure8` `micro_record_dispatch` `closure_pipeline` |
| t4 | 数据表示（record / variant / array / Vec） | 手写 OCaml / C | `records` `array` `micro_alias_record` `micro_boxed_record` `variants_payload` `micro_variant_wide` `micro_vec` |
| t5 | 分配与 GC（年轻代 / 晋升 / 大对象 / 存活集） | 手写 OCaml / C | `gc_low_live` `gc_pressure` `gc_retain` `gc_array_churn` `gc_promote` `gc_large_obj` `gc_large_live` |
| t6 | 容器与算法 | 手写 OCaml / C | `list_recursion` `list_hof` `hashmap` `hashmap_remove` `hashmap_collide` `hashset` `treemap` `treeset` `map_assoc` `queue` `priority_queue` `stream` `sorting` `sort_lib` `graph_bfs` |
| t7 | 文本（扫描 / 切分 / 解析 / 编码 / 插值） | 手写 OCaml / C | `micro_concat` `string_ops` `text_scan` `text_split` `text_parse` `text_base64` `micro_interp` |
| t8 | 效应机器 | 手写 OCaml / C | `eff_tick` `eff_deep` `eff_deepseq` `eff_bracket` `eff_nested` `eff_host` `eff_abort` `eff_install` `eff_entry_host` `eff_linear` `eff_exn` `eff_named` `eff_payload` |
| t9 | 类型类与多态 | 手写 OCaml / 单态对照 | `traits` `trait_derive` `trait_via_field` `trait_hkt` `trait_num` `trait_hasfield` |
| t10 | 可变状态与原地容器 | 手写 OCaml / C | `micro_mut_ref` `mut_array` `mut_barrier` `mut_dyn` `mut_buffer` `mut_vec` |
| t11 | 并发（线程 / 同步原语 / 并行组合子） | 手写 OCaml `Domain` / C `pthread` | `thread_spawn_join` `thread_mutex_counter` `thread_atomic_counter` `thread_parallel_sum` `thread_par_map` `thread_condvar` `thread_cas` `thread_trylock` `thread_par_fold` `thread_par_map_eff` `thread_nested` |
| t12 | 宿主边界（IO / FFI） | 手写 OCaml / C syscall / C FFI | `host_clock` `host_env` `fs_roundtrip` `fs_cursor` `ffi_arith` |

## 机制覆盖矩阵

每个机制至少有一个用例；`micro_*` 只激活本层机制的最小形状，用于算**本层相对上一层**
的增量；其余是真实程序，也压到下层机制，用于验收。

| tier | 机制 | 用例 |
| --- | --- | --- |
| t4 | 多字段 record / 更新 / 投影 | `records` |
| t4 | `alias` / 自动去装箱 / `boxed` 表示档位 | `micro_alias_record` `micro_boxed_record` |
| t4 | 带 payload 的递归 variant / tag 分派 | `variants_payload` `micro_variant_wide` |
| t4 | 不可变 Array（COW set / get / length） | `array` |
| t4 | `Vec` / `Fin`（索引运行时擦除） | `micro_vec` |
| t5 | 低存活集、年轻代分配 | `gc_low_live` `gc_pressure` |
| t5 | 高存活集 / major 回收 | `gc_retain` |
| t5 | 大对象 churn | `gc_array_churn` `gc_large_obj` |
| t5 | 晋升 / 老化 | `gc_promote` |
| t6 | List 递归与高阶组合 | `list_recursion` `list_hof` |
| t6 | HashMap / HashSet / 哈希碰撞 | `hashmap` `hashmap_remove` `hashmap_collide` `hashset` |
| t6 | TreeMap / TreeSet / 有序遍历 | `treemap` `treeset` |
| t6 | assoc Map / Queue / PriorityQueue | `map_assoc` `queue` `priority_queue` |
| t6 | Stream 拉式流 | `stream` |
| t6 | 排序 | `sorting` `sort_lib` |
| t6 | 容器组合的真实算法 | `graph_bfs` |
| t7 | 拼接 / repeat / substring | `micro_concat` `string_ops` |
| t7 | 逐字节扫描 | `text_scan` |
| t7 | split / join / lines / trim / search | `text_split` |
| t7 | parseInt / parseNat / strFromInt | `text_parse` |
| t7 | Base64 编解码 | `text_base64` |
| t7 | 模板插值降级 | `micro_interp` |
| t8 | 浅续延 perform / resume | `eff_tick` |
| t8 | 深续延捕获 / 顺序 perform | `eff_deep` `eff_deepseq` |
| t8 | bracket / cleanup / abort | `eff_bracket` `eff_abort` |
| t8 | handler 嵌套 / answer row / 入口宿主 | `eff_nested` `eff_host` `eff_entry_host` |
| t8 | 每轮安装 handler | `eff_install` |
| t8 | 线性续延 | `eff_linear` |
| t8 | scoped `Try` / catch / bracketExn | `eff_exn` |
| t8 | 命名实例路由 | `eff_named` |
| t8 | 带 payload 的 op | `eff_payload` |
| t9 | 约束多态 / 多方法字典 | `traits` |
| t9 | `deriving` 生成实例 | `trait_derive` |
| t9 | `deriving via field` | `trait_via_field` |
| t9 | HKT / 父类约束 / 单子管线 | `trait_hkt` |
| t9 | 自定义 `Num` / `FromInt` | `trait_num` |
| t9 | `HasField` 泛型字段访问 | `trait_hasfield` |
| t10 | `MutRef` | `micro_mut_ref` |
| t10 | `MutArray` / 原地写 / 写屏障 | `mut_array` `mut_barrier` |
| t10 | `MutDynArray` 容量增长 | `mut_dyn` |
| t10 | `MutBuffer` 字节构建 | `mut_buffer` |
| t10 | `MutVec` / `Fin` | `mut_vec` |
| t11 | spawn / join | `thread_spawn_join` `thread_nested` |
| t11 | Mutex / tryLock / Condvar | `thread_mutex_counter` `thread_trylock` `thread_condvar` |
| t11 | Atomic load/store/fetchAdd/exchange/CAS | `thread_atomic_counter` `thread_cas` |
| t11 | 并行 map / fold | `thread_parallel_sum` `thread_par_map` `thread_par_fold` `thread_par_map_eff` |
| t12 | Clock 宿主效应 | `host_clock` |
| t12 | Env 宿主效应 | `host_env` |
| t12 | Fs 读写 / 删除 | `fs_roundtrip` |
| t12 | Fs 分块游标（`Cursor`） | `fs_cursor` |
| t12 | 受限 FFI（`extern`） | `ffi_arith` |

## 目标矩阵

默认 `targets=ocaml,native,wasm`；用例必须显式声明例外，不能依赖“wasm 跑挂了再静默
`run_ok=false`”。

| tier | all 目标 | 例外（显式 `targets=`） |
| --- | --- | --- |
| t3 | 除 `closures` | `closures` → `ocaml,native` |
| t4 | 全部 | — |
| t5 | `gc_retain` `gc_large_obj` `gc_promote` | `gc_low_live` `gc_array_churn` `gc_pressure` → `ocaml,native` |
| t6 | 除下列 | `list_recursion` `sorting` → `ocaml,native` |
| t7 | 全部 | — |
| t8 | 全部 | — |
| t9 | 全部 | — |
| t10 | `micro_mut_ref` `mut_array` `mut_barrier` `mut_dyn` `mut_buffer` | `mut_vec` → `ocaml,wasm` |
| t11 | `thread_par_map` `thread_par_fold` `thread_par_map_eff` | 其余线程用例 → `ocaml,native` |
| t12 | `host_clock` `host_env` | `fs_roundtrip` `fs_cursor` → `ocaml,native`；`ffi_arith` → `ocaml` |

规则：

- 每个 tier 至少保留 3 个 `all` 目标用例；新增用例默认先按 `all` 写，实测栈 / 构建
  限制后再降级并在本表登记。
- t5 的 `gc_low_live` / `gc_array_churn` / `gc_pressure` 保留非尾累加循环（机制本身），在
  V8 默认栈上 trap；同层的 `gc_retain` / `gc_large_obj` / `gc_promote` 已给 wasm 覆盖。
- t10 的 `mut_vec` 的 native codegen 对动态 `Fin` 结果错误，因此只开 `ocaml,wasm`；
  `Base.Container.MutDynArray` / `MutBuffer` 的 `dynGrow` / `mbufGrow` 在容量足够时
  早退（三端一致）。native 的 pure 包装 CAF 初始化顺序问题已在用例源码用
  `runPure (…with… )` 绕过（语料 `effect_common/66` / `71` 仍保留原形）。
- 非 wasm 用例必须在 `.bench` 写 `targets=`；`--check` 把它记成 `excluded`，不是
  `run_ok=false`。
- wasm 的 1 MB 栈是浏览器路径的真实边界：非尾递归的机制（如 `list_recursion` 的
  `1 + sum rest`、`sorting` 的归并）保留在 `ocaml,native`，不要为了凑 wasm 覆盖把
  机制改掉。

## 用例类型

- `micro_*`：只激活本层机制的最小形状，用于算**本层相对上一层**的增量。
- 其余：真实程序，也压到下层机制，用于验收。
- 判定：先看 micro 的增量定位机制，再看 real 的绝对值判定整体。

## 新增用例

一个用例需要一个 `t<N>/<name>/` 目录，目录内放：

| 文件 | 作用 | 必需 |
| --- | --- | --- |
| `<name>.vuna` | vuna 实现 | 是 |
| `<name>.ml` | 手写 OCaml 对照 | 是 |
| `<name>.c` | 手写 C 对照（N 从 argv 读，sidecar 写 `n=`） | 是 |
| `<name>.out` | golden（各端输出必须逐字节一致） | 是 |
| `<name>.bench` | `ops=` / `n=` / `repeat=` / `targets=` 等 sidecar 元数据 | 是 |
| `<name>.bench` 键 | 作用 | 必需 |
| `ops=N` | 每操作数（报 wall/cpu 的 ns/op） | 否 |
| `n=N` | 传给 C 对照的 argv（可含多个参数） | 是 |
| `repeat=N` | 单次采样内重复次数（小项用） | 否 |
| `targets=a,b` | 只在这些后端上跑 | 否 |
| `timeout_x=N` | 超时 = N × 参照耗时（取两个参照里较慢的） | 否 |
| `timeout_ms=N` | 绝对超时（优先于 `timeout_x`） | 否 |
| `cc_flags=...` | 额外 cc 参数（如 `-fwrapv`、T0 的 `-nostdlib`） | 否 |
| `c=path` | 额外参与 OCaml 对照链接的 C 源（相对用例目录）；vuna 侧 FFI 走用例私有 `vuna.toml` + 包根 `ffi/*.c` | 否 |

约束：

1. 一个屏幕能读完；2. 有 `ops=` 单位；3. 各端输出与同一份 golden 逐字节一致；
4. 计时必须随 N 增长（不能被常量折叠成空循环）；5. `n=` 必须让 C 对照产生同样的工作量，
   且 `vuna Int` 是 63 位补码——输出依赖回绕时按 63 位模拟并配 `cc_flags=-fwrapv`。

附加约束（本分层新增）：

6. **并发用例的 golden 只依赖顺序无关的校验和**（求和、计数、集合大小），不依赖线程
   交错；Condvar / 队列用例必须有超时或失败出口，避免基线采集死锁。
7. **派生 / 哈希类用例不要输出原始 hash 值**，只输出 `HashSet.size`、比较次数、
   `show` 长度这类稳定量，避免后端实现细节污染 golden。
8. **宿主 / FFI 用例**：Fs 路径放 `${TMPDIR:-/tmp}`，不写仓库；FFI 的 C 实现放用例目录
   并用 `c=` 只给本用例链接；宿主 IO 只比 CPU 行，墙钟受 OS 调度影响。
9. **每个新增用例都要有 `<name>.c`**（效应用例的 C 对照做等价循环 / 内联 handler，
   线程用例用 pthread）；`sh bench/lib/verify-c-refs.sh` 必须通过。

`--check` 对墙钟、CPU、RSS 三个指标都判定；宿主繁忙时墙钟会整体抬升，先看 CPU 行。
每个 `micro_*` 的「本层增量」对三个指标同样成立：先看 micro 的增量定位机制，再看 real 的
绝对值判定整体。

加用例不需要改 `bench/run.sh`：发现逻辑按 `t*/*/<name>.vuna` 自动收集（文件名 stem
必须与用例目录名一致；目录里的其他文件不参与发现），同名用例出现在两个目录下会直接
报错（会撞基线键）。写完 C 对照后先跑 `sh bench/lib/verify-c-refs.sh`：它按 `run.sh`
同样的口径（`-O2` + sidecar 的 `cc_flags`、`n=` 作 argv）全量编译并比对 golden。

## 已知未覆盖（有意）

- **单线程 fiber 调度器 / cooperative channel**：`Base.EffSched` / `Base.EffChannel` /
  `Base.EffMutex` 当前没有库面（debt D41），不给不存在的 API 建基准。
- **`handleState`**：answer 是函数的库 handler 在三端运行期不一致（debt D114），
  关闭前不加 `eff_state`。
- **Process / Stdin / Tty / Net / Exit**：耗时或输出由 OS / 终端 / 网络环境决定，runner
  没有 per-case stdin/env 隔离；Console 已由 t8 覆盖。
- **Fs 的 wasm 目标**：bench 的 wasm 宿主默认 preopen 当前工作目录（仓库根），绝对
  `${TMPDIR}` 路径在 preopen 之外；要上 wasm 需要给 runner 加 per-case cwd / `--dir`。