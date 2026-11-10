# bench：生成程序与运行时基准

本目录是「生成程序 vs 手写 OCaml」的测量设施。它与 `nix/bench.sh` 分工：

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
  编译（含 `VN_PERF_STATS` 的分配/GC 读数）。

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
  `--json bench/baseline.json`，并在提交信息里写明原因。
- 基线是**软门槛**：不为跨机器/环境差异改写基线；只有确认是生成程序质量的真实变化才更新。

## 当前基线

`--runs 3 --warmup 1`，x86_64 / 16 核 / ocamlopt 5.5.1（非 flambda）。读数见
[docs/reference/performance.md §8](../docs/reference/performance.md)：

| benchmark | ratio |
| --- | --- |
| arith | ~1.2x |
| string_ops | ~1.0x |
| hashmap | ~2.0x |
| list_recursion | ~0.8x |
| gc_pressure | ~1.1x |
| array | ~0.9x |

全部基准在 2× 手写 OCaml 内。分配 / GC 统计由生成 runtime 的 `VN_PERF_STATS=1` 输出，
`bench/run.sh` 采集进 JSON 的 `vuna.gc` 字段。

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
