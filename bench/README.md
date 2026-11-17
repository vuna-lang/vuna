# bench：生成程序与运行时基准

本目录是「生成程序 vs 手写 OCaml」的测量设施。它与 `bench/bootstrap.sh` 分工：

| 设施 | 测什么 | 入口 |
| --- | --- | --- |
| `bench/bootstrap.sh` | 编译器**构建/编译**墙钟、产物尺寸、codegen 计数 | `nix run .#vuna-bench` |
| `bench/run.sh` | **生成程序运行时**（vuna 产物 vs 手写 OCaml）、`check`/`compile` 运行期负载；可选 ocaml / native 后端 | `nix run .#vuna-perf` |

## 口径

- 每个 benchmark 是一对**同算法**实现：`programs/<name>.vuna`（vuna 源码）与
  `programs/<name>.ml`（手写 OCaml 对照）。库基准（如 `hashmap`）的对照用标准库上限，
  文件头注释会说明；这测的是「vuna 库/表示与手写最优实现的差距」。
- `--target ocaml|native|both` 选择被测后端（默认 `ocaml`）。`both` 在同一窗口内同时测
  OCaml 后端与 native，用来给出「native vs OCaml 后端」的比值。
- `programs/<name>.out` 是 golden：**每个被测产物与手写 OCaml 都必须输出它**，脚本会在计时
  前各校验一次，输出不一致直接失败（不会拿错误程序刷基线）。
- 每项先 `--warmup` 次预热，再跑 `--runs` 次取**中位数**；峰值内存用 GNU time 的 max RSS，
  计时结束后单独跑 `--rss-passes` 次取**最大值**（不参与计时）。
- native 不做尾调用优化，深递归基准在默认 8 MiB 栈上会崩溃。native 进程统一在
  `ulimit -s unlimited` 下运行，JSON `meta.stack_policy` 记录该口径；栈页计入峰值 RSS。
- 跨机器只比较 `ratio = <backend>_median / ocaml_median` 与
  `rss_ratio = <backend>_max_rss / ocaml_max_rss`；绝对 ms/KB 不可比。`--check` 默认读
  对应基线，对超过 `--threshold`（默认 20%）的项打 `PERF-CHECK-WARN`（软告警、退出 0）。
- 编译器侧基准（`check compiler` / `check .` / `compile .`）与 runtime 基准共用同一脚本与
  JSON 结构；当前先由 `bench/bootstrap.sh` 记录编译墙钟，`bench/run.sh` 的 runtime 段不重复测量
  编译（含 `VN_PERF_STATS` 的分配/GC 读数）。

## 运行

```console
# 仓库根；nix runner 会带上 vuna / ocamlopt / cc / jq / GNU time
nix run .#vuna-perf
nix run .#vuna-perf -- --runs 5 --only string_ops
nix run .#vuna-perf -- --target native                 # 只测 native 后端
nix run .#vuna-perf -- --target both --check           # 两个后端同窗口对比
nix run .#vuna-perf -- --check                         # 软对比基线
nix run .#vuna-perf -- --json bench/baseline.json      # 重新生成 OCaml 基线（提交入库）
nix run .#vuna-perf -- --target both --runs 5 --warmup 2 \
  --json bench/native-baseline.json                    # 重新生成 native 基线（提交入库）
```

本地已有 `./result/bin/vuna` 时可直接：

```console
VUNA=$PWD/result/bin/vuna ./bench/run.sh --runs 3
```

## 基线维护

- `baseline.json`（OCaml 后端）与 `native-baseline.json`（native + OCaml 后端同窗口）分别入库；
  更新基线的唯一方式是用**同一机器、同一口径**（target/runs/warmup/rss-passes）重跑对应命令，
  并在提交信息里写明原因。
- `native-baseline.json` 用 `--target both --runs 5 --warmup 2` 生成；生成后检查 `meta` 的
  `target` / `stack_policy` / `rss_passes` 是否符合预期。
- 基线是**软门槛**：不为跨机器/环境差异改写基线；只有确认是生成程序质量的真实变化才更新。

## 当前基线

`--runs 3 --warmup 1`（native 列用 `--runs 5 --warmup 2`），x86_64 / 16 核 / ocamlopt 5.5.1
（非 flambda）。读数见 [docs/reference/performance.md §8](../docs/reference/performance.md)：

| benchmark | OCaml 后端 ratio | native ratio |
| --- | --- | --- |
| arith | ~1.2x | ~85x（深非尾递归；见 §8.1 口径） |
| string_ops | ~1.0x | ~1.3x |
| hashmap | ~2.0x | ~3x |
| list_recursion | ~0.8x | ~4x |
| gc_pressure | ~1.1x | ~2x |
| array | ~0.9x | ~3x |

OCaml 后端全部基准在 2× 手写 OCaml 内；native 的绝对值与峰值内存见
[performance.md §8](../docs/reference/performance.md)。分配 / GC 统计由 OCaml 后端生成
runtime 的 `VN_PERF_STATS=1` 输出，`bench/run.sh` 采集进 JSON 的 `gc` 字段；native 无 GC
统计，只记峰值 RSS。

## 编译器基准

`bench/compiler.sh` 测编译器 / 工具链自身墙钟：`check .`、`check compiler`、`build --no-compile`
（workspace 全部 / 仅 compiler 包）、`vuna map` 冷 / 热、`fmt --check`，并内置冷 / 热两种
口径（清缓存后测 vs 预热后测）。**范围不同不可直接互比**：`check-all` 是 workspace 根包 +
成员并行，`build-all` 是 workspace 全部串行（≈ check 全部 + codegen），`*-compiler` 只覆盖
compiler 包。基线 `bench/compiler-baseline.txt`（机器相关，仅同机回归对比）；`--check` 超
`--threshold`%（默认 20）打 WARN、超 `--fail-threshold`%（默认 50）exit 1（硬门槛），
`--save-baseline` 重写基线，`--alloc` 额外打印冷 `check .` 的 GC 分配统计（`VN_PERF_STATS=1`）。
跨机器/跨输入规模的可比口径是 `nix/checks/compiler-growth.sh`（合成 500/1000/2000/4000 同形
定义，相邻档墙钟比 ≤2.3；进 `nix flake check`）。用法与读数见
[performance.md §9](../docs/reference/performance.md)。
