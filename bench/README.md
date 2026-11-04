# bench：M33 生成程序与运行时基准

本目录是 M33「语言能写高性能系统程序」的测量设施。它与 `nix/bench.sh` 分工：

| 设施 | 测什么 | 入口 |
| --- | --- | --- |
| `nix/bench.sh` | 编译器**构建/编译**墙钟、产物尺寸、codegen 计数 | `nix run .#vuna-bench` |
| `bench/run.sh` | **生成程序运行时**（vuna 产物 vs 手写 OCaml）、`check`/`compile` 运行期负载 | `nix run .#vuna-perf` |

## 口径

- 每个 benchmark 是一对**同算法**实现：`programs/<name>.vuna`（vuna 源码）与
  `programs/<name>.ml`（手写 OCaml 对照）。库基准（如 `hashmap`）的对照用标准库上限，
  文件头注释会说明；这测的是「vuna 库/表示与手写最优实现的差距」。
- `programs/<name>.out` 是 golden：**vuna 产物与手写 OCaml 都必须输出它**，脚本会在计时前
  各校验一次，输出不一致直接失败（不会拿错误程序刷基线）。
- 每项先 `--warmup` 次预热，再跑 `--runs` 次取**中位数**；RSS 用 GNU time 的 max RSS
  （单次测量）。
- 跨机器只比较 `ratio = vuna_median / ocaml_median`；绝对 ms 不可比。`--check` 默认读
  `baseline.json`，对 ratio 超过 `--threshold`（默认 20%）的项打 `PERF-CHECK-WARN`
  （软告警、退出 0）。
- 编译器侧基准（`check compiler` / `check .` / `compile .`）与 runtime 基准共用同一脚本与
  JSON 结构；当前先由 `nix/bench.sh` 记录编译墙钟，`bench/run.sh` 的 runtime 段不重复测量
  编译（W2 起加入 `VN_PERF_STATS` 的分配/GC 读数）。

## 运行

```console
# 仓库根；nix runner 会带上 vuna / ocamlopt / jq / GNU time
nix run .#vuna-perf
nix run .#vuna-perf -- --runs 5 --only string_ops
nix run .#vuna-perf -- --check          # 软对比基线
nix run .#vuna-perf -- --json bench/baseline.json   # 重新生成基线（提交入库）
```

本地已有 `./result/bin/vuna` 时可直接：

```console
VUNA=$PWD/result/bin/vuna ./bench/run.sh --runs 3
```

## 基线维护

- `baseline.json` 入库；更新基线的唯一方式是用**同一机器、同一口径**（runs/warmup）重跑
  `--json bench/baseline.json`，并在提交信息里写明原因（例如 M33 某波次落地后的预期变化）。
- 基线是**软门槛**：不为跨机器/环境差异改写基线；只有确认是生成程序质量的真实变化才更新。

## 当前基线（M33 W4 后）

`--runs 3 --warmup 1`，x86_64 / 16 核 / ocamlopt 5.5.1（非 flambda）。起点（W1）到 W4 后的
ratio 对比见 [docs/reference/performance.md §8](../docs/reference/performance.md)：

| benchmark | 起点 | W2 后 | W3 后 | W4 后 |
| --- | --- | --- | --- | --- |
| arith | ~11.6x | ~1.2x | ~1.0x | ~1.2x |
| string_ops | ~28.9x | ~3.6x | ~3.4x | ~1.0x |
| hashmap | ~9.5x | ~3.0x | ~2.0x | ~2.0x |
| list_recursion | ~2.1x | ~0.8x | ~0.7x | ~0.8x |
| gc_pressure | ~1.3x | ~1.0x | ~1.0x | ~1.1x |
| array | — | — | ~0.9x | ~0.9x |

W2 的三项 codegen 改进（内建饱和内联、多参数 lambda 链、`++` 链 `String.concat`）把前三项
拉到接近手写 OCaml；W3 的内建类型构造子 + `Array` 桶把 hashmap 从 3.0x 降到 2.0x，并新增
array 基准；W4 的 `strSubstring` + `repeat` 批拼把 string_ops 拉到 1.0x——全部基准进入
2× 手写 OCaml 内（M33 退出标准）。分配 / GC 统计由生成 runtime 的 `VN_PERF_STATS=1` 输出，
`bench/run.sh` 采集进 JSON 的 `vuna.gc` 字段。