# 性能工程（vuna 命令耗时）

本文覆盖：**怎么量**（探针设施与测量规程）、**当前读数**、**热点在哪**。规模不变量与安全
边界见 [limits.md](limits.md)，测试 / CI 口径见 [testing.md](testing.md)，方法论规程见技能
`.agents/skills/perf-debug/SKILL.md`。

## 1. 现状读数

`./result/bin/vuna`（`nix build .#vuna` 产物，16 核开发机，单进程、无并行；读数随机器与
版本变化）：

| 命令 | 当前 |
| --- | --- |
| `check base` | ~26 ms |
| `check compiler` | ~3.1 s |
| `check .` | ~8.1 s（workspace 检查所有成员） |
| `build . --no-compile` | ~9.3 s |
| `build .` | ~16.9 s |
| `fmt --check`（全仓） | ~0.3 s |
| `lint` / `doc` / `map` / `gen-errors` | 均 <1 s |

所有命令都在 10 s 以内；增长率见 §5。构建口径必须一致：同一份源码在逐模块 split 产物下
测量；`compile` / `build` / seed 只有这一种产物，不再有单文件 `main.ml` 口径。

## 2. 探针设施：`Vuna.Compiler.Debug`

开关是 CLI 参数（`Vuna.Cli.runCli` 会剥掉它再分发，任何子命令后都能加）：

```console
vuna check compiler --debug-perf
```

打开后 stderr/stdout 上出现两类行：

- `PERF <label> <epoch-ms>`：时间戳。**相邻两行相减 = 阶段耗时**；
- `DEBUG <text>`：任意诊断文本（表规模、计数等）。

设施（`compiler/lib/Vuna/Compiler/Debug.vuna`）：

| 函数 | 语义 | 何时用 |
| --- | --- | --- |
| `stamp label` | 打一个毫秒时间戳 | 阶段边界（十几处，代价可忽略） |
| `stampSample key label` | 仅当 `sampleKey key`（1/64，确定性哈希）命中 | 逐定义 / 逐条目：采样后仍能看出「成本随规模 / 位置增长」的趋势 |
| `stampSampleHot key label` | 1/2048 命中 | 热路径（conv / force 级别） |
| `note` / `noteInt` | 打 `DEBUG` 文本 | 表规模、元变量数、字典目标数 |

**关键纪律**：每次打点都要 fork 一个 `sh -c date`（毫秒时间源，约 3–7 ms）。所以逐条目
打点必须采样，否则打点本身成为主成本；单次 <5 ms 的条目用 `PERF` 差值分不出真假（噪声与
fork 抖动同量级），要判断趋势请用「同形规模的合成探针」对比总时间，而不是对比相邻两行。
关闭开关时：`stamp` 只花一次 `getArgs`（微秒级），`stampSample` 只花一次字符串哈希。

## 3. 查找表：`HashTbl`

`compiler/lib/Vuna/Compiler/Common.vuna` 提供 1024 桶（两层 32 叉）的持久哈希表：

```text
tblEmpty / tblInsert k v / tblLookup k / tblFromList pairs / tblInsertAll pairs
```

单次查找 ≈ 64 步列表遍历 + 桶内 1–2 次字符串比较；桶内前插，「新值优先」与旧关联表一致。
`Base.Map` **不是**可用的替代：它是关联列表（assoc list），换过去复杂度不变。

索引点（都在 `Ec` 里，作为可重建的缓存；**真相永远是列表**）：

| 字段 | 索引什么 | 维护方式 |
| --- | --- | --- |
| `ecDefTbl` | 定义体（`force` 的 delta 展开） | `ecAddDef` 增量插入 |
| `ecGlobalsTbl` | 全局签名（含构造子 / 族名） | `elabBodies` 前用当时 `globals` 建一次；每精化一个定义插入其提升后的类型 |
| `ecSolTbl` | 解表（元变量 → 值） | `ecPutSols` 只插入本次新增的解（`solsDelta`） |

不变量：索引与列表可能短暂不同步（例如建表前的数据族 / trait / 签名阶段），因此热路径入口
`globalsLookup` **先查索引、未命中回落线性扫列表**；语义永远以列表为准。

## 4. 仍然存在的热点

`check compiler` 的 ~3.1 s 里 `elabBodies`（逐定义精化）仍是主要部分：

1. **签名 banned 集已是一次建表 + per-sig O(1) 查**：`Sig.qualifiedBannedTbl` +
   `quantifyTopSigCached`；这是此前 O(n²) 的根修。
2. **NbE 值共享收益≈0**：`Sols.defVals` + 安全前缀记忆化已落地（零成本骨架），但 DFun 的
   WHNF 是 `VLam`（`eval [] body` O(1)），force 的 NGlobal 绝大多数是数据族 / 内建；继续
   降低需要参数相关共享或减少 conv 的 force 调用量。
3. **ctor 索引已加**：`Ec` 里 `dtCtorLookupEc` 先查表、未命中回落线性扫。
4. **仍可做的下一步**：conv 的「同 head 同 spine 直接成功」快速路径（`fastSame` 已覆盖
   原子形态）、减少 `applySpine` / `quote` 的分配、termination 的 list→表化、以及
   `check .` 在 workspace 单元下的并行 / 增量检查。
5. **GC 仍占可观测比例**：runtime 设 16MB minor heap（`Gc.set`，
   `space_overhead = 200`），之后仍有约 15–20% 时间在 GC；减少分配比继续调参更有效。

## 5. 增长率（合成包）

同一形状定义（`fi : Int` / `fi = g0`）随定义数 n 的墙钟（`result` 产物）：

| n | 现在 | 现在 / 翻倍 |
| --- | --- | --- |
| 500 | 139 ms | — |
| 1000 | 188 ms | 1.35× |
| 2000 | 320 ms | 1.70× |
| 4000 | 586 ms | 1.83× |
| 8000 | 1561 ms | 2.66× |

n ≤ 4000 时每翻倍 1.35–1.83×（≈线性或更好），8000 时 2.66× 说明仍有小常数
O(n log n) / O(n²) 残余；真实仓库（~2400 定义）离拐点很远。剩余超线性主要集中在
`termination` 的准备阶段（`callGraph` / `transpose` / `postOrder` / `sccOf` 仍是 list
实现）与 loader `resolve`。

## 6. `check base` 的阶段构成

一次采样的量级（具体 ms 随版本 / 机器变化，用于定位优先序）：

| 阶段 | 用时 |
| --- | --- |
| 进程启动 + 运行时初始化 | ~4 ms |
| load（解析模块） | ~9 ms |
| resolve | ~3 ms |
| collectSigs + sigs-elab | ~6 ms |
| bodies（逐定义精化） | ~26 ms（其中 `resolveDictGoals` ~7 ms） |
| instbodies / extradefs | ~5 ms |
| termination | ~5 ms |
| codegen 检查（partition / erasure / groups / typedecls） | ~7 ms |

残差来自 base 自身变大、check 现在**总是**跑终止性检查与 codegen 自检、以及每份源码都要建
defs / globals / sols 三张索引表。要继续压，先看 bodies（逐定义精化）与 load（解析）：两者
都是真实工作量，不是退化。

## 7. 测量规程

- **探针必须隔离**：每个探针包一套自己的 `vuna.toml` + `lib/...`。常见事故：两个并行脚本
  共用同一探针目录，`vuna.toml` 被覆盖成「整编译器」的 export 列表，读数整体作废，而且
  看起来像「固定 45s 的神秘成本」。
- 只有包上下文一条加载路径；单文件夹具也按最近 manifest 解析，不存在「单文件 vs 包」两套
  读数。
- 用 `OCAMLRUNPARAM=s=...` 快速判断 GC 敏感性（注意：产物里 `Gc.set` 会覆盖环境变量，要
  比较不同 minor heap 大小得改代码重建）。
- 阶段定位优先用 `stamp`；per-def / 热路径趋势用 `stampSample`；不要用「等大 case 跑完」
  定位。
- 基准入口：`nix run .#vuna-bench`（手动，非 CI check），基线文件与软告警见
  [testing.md](testing.md)。

## 相关阅读

- 规模不变量与边界：[limits.md](limits.md)
- 测试 / CI / bench：[testing.md](testing.md)
- 编译器结构：[compiler.md](compiler.md)、[core.md](core.md)
- 方法论技能：`.agents/skills/perf-debug/SKILL.md`
