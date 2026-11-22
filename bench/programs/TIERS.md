# 基准用例的机制分层

每个用例归到一个 `t<N>/` 目录，目录名就是它的 tier。tier 是**累积**的：一个用例
所需的最高机制决定它的层级，所以诊断从 T0 往上走，第一个不达标的 tier 就是问题
所在。基线 JSON 的键仍然是用例的 basename，目录只决定分级。

```
bench/programs/
  vuna.toml            # 全部用例共用的独立包上下文（只依赖 vuna-base）
  t0/ ... t9/          # 每层一套用例；<name>.vuna / .ml / .out / .bench
```

## 层级

| tier | 机制 | 参照 | 用例 |
| --- | --- | --- | --- |
| t0 | 地板与入口 | 手写 OCaml / 裸 syscall C | `startup` `entry_pure` `entry_effect` |
| t1 | 标量算术与循环 | 手写 OCaml / C | `arith` `nat_bits` `float_math` `scalar_xor` `scalar_muladd` `scalar_divconst` |
| t2 | 控制流与尾调用 | 手写 OCaml / C | `tco_mutual` `tco_wide` |
| t3 | 调用约定与闭包 | 手写 OCaml / C | `closures` `micro_apply` |
| t4 | 数据表示（record / variant / array） | 手写 OCaml / C | `records` `array` |
| t5 | 分配与 GC | 手写 OCaml / C | `gc_low_live` `gc_pressure` `gc_retain` `gc_array_churn` |
| t6 | 容器与算法 | 手写 OCaml / C | `list_recursion` `hashmap` `hashmap_remove` `treemap` `queue` `priority_queue` `sorting` `sort_lib` |
| t7 | 文本 | 手写 OCaml / C | `text_scan` `string_ops` `micro_concat` |
| t8 | 效应机器 | 手写 OCaml | `eff_tick` `eff_deep` `eff_deepseq` `eff_bracket` `eff_nested` `eff_host` `eff_abort` `eff_install` `eff_entry_host` |
| t9 | 类型类与多态 | 手写 OCaml / 单态对照 | `traits` |

## 用例类型

- `micro_*`：只激活本层机制的最小形状，用于算**本层相对上一层**的增量。
- 其余：真实程序，也压到下层机制，用于验收。
- 判定：先看 micro 的增量定位机制，再看 real 的绝对值判定整体。

## 新增用例

一个用例需要同目录下的：

| 文件 | 作用 | 必需 |
| --- | --- | --- |
| `<name>.vuna` | vuna 实现 | 是 |
| `<name>.ml` | 手写 OCaml 对照 | 是 |
| `<name>.out` | golden（各端输出必须逐字节一致） | 是 |
| `<name>.bench` | `ops=` / `repeat=` / `targets=` 等 sidecar 元数据 | 是 |
| `<name>.c` | 手写 C 对照（N 从 argv 读，sidecar 写 `n=`） | 否 |
| `<name>.bench` 键 | 作用 | 必需 |
| `ops=N` | 每操作数（报 ns/op） | 否 |
| `n=N` | 传给 C 对照的 argv | 有 `.c` 时 |
| `repeat=N` | 单次采样内重复次数（小项用） | 否 |
| `targets=a,b` | 只在这些后端上跑 | 否 |
| `timeout_x=N` | 超时 = N × 参照耗时 | 否 |
| `timeout_ms=N` | 绝对超时（优先于 `timeout_x`） | 否 |
| `cc_flags=...` | 额外 cc 参数（如 T0 的 `-nostdlib`） | 否 |

约束：

1. 一个屏幕能读完；2. 有 `ops=` 单位；3. 各端输出与同一份 golden 逐字节一致；
4. 计时必须随 N 增长（不能被常量折叠成空循环）。

加用例不需要改 `bench/run.sh`：发现逻辑按 `t*/*.vuna` 自动收集，同名用例出现在
两个目录下会直接报错（会撞基线键）。