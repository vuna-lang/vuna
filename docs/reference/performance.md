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
| `map`（热缓存命中） | ~0.46 s |
| `map` 冷启动全量重建 | ~31–33 s（索引缓存失效后整仓重扫；原因见 C34：`refsInExpr` 的左结合 `append` 呈 O(n²)） |
| `lint` / `doc` / `api` / `gen-errors` | 均 <1 s |

容器改造（私有 `HashTbl` → `Base.HashMap`，元变量解表 → `Base.IntMap`）的实测对比：
同一 worktree、同一份源码、独立进程各 3 次取中位数（本机绝对值与上表历史读数不可直接
比较；改造前 = 编译器内部哈希表 + 解表 String 键，改造后 = 标准库容器 + Int 键索引）：

| 命令 | 改造前 | 改造后 | 变化 |
| --- | --- | --- | --- |
| `check compiler` | ~4.87 s | ~4.18 s | -14% |
| `check .` | ~13.4 s | ~11.3 s | -15% |

除 `map` 冷启动全量重建（C34）外，所有命令都在 10 s 以内；增长率见 §5。构建口径必须一致：
同一份源码在逐模块 split 产物下测量；`compile` / `build` / seed 只有这一种产物，不再有
单文件 `main.ml` 口径。

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

## 3. 查找表：`Base.HashMap` / `Base.IntMap`

容器在标准库（`base/lib/Base/HashMap.vuna` / `base/lib/Base/IntMap.vuna`）：1024 桶
（两层 32 叉）的持久哈希表、桶内前插、同键新值优先。编译器不再有私有 `HashTbl`。

```text
HashMap.empty / insert / insertAll / lookup / member / fromList / ofNames
IntMap.empty  / insert / insertAll / lookup / member / fromList
```

单次查找 ≈ 32 步列表遍历 + 桶内 1–2 次比较；`IntMap` 的键是 `Int`，没有
`strFromInt` 编码与字符串哈希开销（元变量编号这类稠密小整数几乎不冲突）。
`Base.Map` **不是**可用的替代：它是关联列表（assoc list），换过去复杂度不变。

`Sols` 里有两张表：解表（`solsTbl`）与元变量创建深度表（`solsDepth`），键都是元变量
编号，均用 `IntMap`；`metaLookup` 查 `ecSolTbl`（O(1)），`metaLookupList` 只保留给
「只有解表 list、没有索引」的少量纯 list 场景。

索引点（都在 `Ec` 里，作为可重建的缓存；**真相永远是列表**）：

| 字段 | 容器 / 索引什么 | 维护方式 |
| --- | --- | --- |
| `ecDefTbl` | `HashMap`：定义体（`force` 的 delta 展开） | `ecAddDef` 增量插入 |
| `ecGlobalsTbl` | `HashMap`：全局签名（含构造子 / 族名） | `elabBodies` 前用当时 `globals` 建一次；每精化一个定义插入其提升后的类型 |
| `ecSolTbl` | `IntMap`：解表（元变量编号 → 值） | `ecPutSols` 只插入本次新增的解（`solsDelta`） |
| `ecDepthTbl` | `IntMap`：元变量创建深度（编号 → Int） | `newMeta` / `newHoleMeta` 增量插入 |
| `ecCtorTbl` / `ecClausesTbl` / `ecDefVals` | `HashMap`：构造子、clause 表、定义体值缓存 | `ctorTblOfDatas` / `elabBodies` 增量插入 |

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
4. **元变量解表已表化**：`Ec`/`Sols` 的解表与创建深度表改成 `IntMap`（键 = 元变量
   编号），`metaLookup` 走索引、不再对 `ecSols` 线性扫；`ecPutSols` 不再逐解
   `strFromInt`。剩余热点集中在 `applySpine` / `quote` 的分配与 `conv` 的重算。
5. **仍可做的下一步**：conv 的「同 head 同 spine 直接成功」快速路径（`fastSame` 已覆盖
   原子形态）、减少 `applySpine` / `quote` 的分配、termination 准备阶段的 list 实现，
   以及 `check .` 在 workspace 单元下的并行 / 增量检查。
6. **GC 仍占可观测比例**：runtime 设 16MB minor heap（`Gc.set`，
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

## 8. 生成程序基准（M33）

`nix run .#vuna-perf`（逻辑在 `bench/run.sh`）测**生成程序运行时**：每个 benchmark 是一对
同算法实现（`bench/programs/<name>.vuna` vs `<name>.ml` 手写 OCaml），先校验两侧输出与
golden 一致，再 warmup + 多次取中位数；RSS 用 GNU time 的 max RSS。跨机器只比
`ratio = vuna/ocaml`（绝对 ms 不可比）。

口径与基线维护见 `bench/README.md`；基线 `bench/baseline.json` 入库，`--check` 对超阈值项
软告警。与 `nix/bench.sh` 的分工：后者测构建 / 编译墙钟与产物尺寸，本设施测运行期。

M33 起点 / W2 / W3 / W4 后读数（`--runs 3 --warmup 1`，x86_64 / 16 核 / ocamlopt 5.5.1
非 flambda；绝对 ms 随机器变化，只比较 ratio）：

| benchmark | 起点 | W2 后 | W3 后 | W4 后 | 首要成本 / 处理 |
| --- | --- | --- | --- | --- | --- |
| arith | ~11.6x | ~1.2x | ~1.0x | ~1.2x | 内建跨模块调用、curried 递归闭包 → 饱和内联 + 多参数 lambda 链 |
| string_ops | ~28.9x | ~3.6x | ~3.4x | ~1.0x | `++` 链 / `strPack` → `String.concat` 批拼；W4 `strSubstring` + `repeat` 一次 `strConcatMany` |
| hashmap | ~9.5x | ~3.0x | ~2.0x | ~2.0x | W2 codegen；W3 桶改 `Array`（`Array.get` O(1) + copy-on-write） |
| list_recursion | ~2.1x | ~0.8x | ~0.7x | ~0.8x | 已达标 |
| gc_pressure | ~1.3x | ~1.0x | ~1.0x | ~1.1x | 已达标 |
| array | — | — | ~0.9x | ~0.9x | W3 新增：不可变 `Array` 与手写 OCaml 持平 |

W4（可变数据边界 / 字符串补齐）：

1. **`strSubstring` 原语**（runtime `String.sub` + clamp 语义；interp 也归约
   `OpStrSubstring`），`Base.String.substring` 不再走 List 桥接；
2. **`Base.String.repeat`** 改一次 `strConcatMany`，消除逐级 `++` 的 O(n²) 拷贝；
3. **线性 / ST 裁剪**：可变数据（`IORef` / `MArray` / `Buffer`）保持 IO 隔离，不引入线性
   类型与 ST/region（见 [limits.md](limits.md) 的「容器与可变数据」与 debt D22）。
   string_ops 3.4x → 1.0x；全部基准进入 2× 手写 OCaml（M33 退出标准）。

W2 落地的 codegen / 运行时改进（都在 `Codegen/Term.vuna` 与 `base/`）：

1. **内建饱和应用内联**：`+ - * /`、比较 / 相等特化、`&& ||`、`++` 直接生成 OCaml
   运算符表达式；部分应用 / 高阶引用仍走 runtime 函数。
2. **多参数 lambda 链**：连续 `TLam` 合并成 `(fun x y -> body)`，擦除 binder 只占 de Bruijn
   位置；消除 curried 递归的每轮闭包分配（arith 的主因）。
3. **`++` 链展平**：`a ++ b ++ c` 生成 `(String.concat "" [a; b; c])`；`strPack` / `dtp_pack`
   改 `Array.of_list`；`Base.List.concatMap` 改尾递归 accumulator；`Base.String.join` /
   `unlines` 改一次 `strConcatMany`。
4. **GC 统计**：生成 runtime 支持 `VN_PERF_STATS=1`（退出打印 `Gc.quick_stat` 的
   minor/major words、collections、top_heap_words），`bench/run.sh` 采集进 JSON。

W3 落地的容器与表示（`Intrinsics` / `Elab.Prelude` / `Codegen.Decl` / `base/`）：

1. **内建类型构造子** `Array` / `IORef` / `MArray` / `Buffer`（类型层，恒可见；OCaml 表示
   `'a array` / `'a ref` / `'a array` / `Buffer.t`），签名支持隐式 `{a : Type}`。
2. **Array / IORef / MArray / Buffer 原语与库**（见 [primitives.md](primitives.md) §6.1、
   [stdlib.md](stdlib.md)）；`arrayEmpty` 用 non-expansive 的 `[||]` 让空表在 OCaml 侧可泛化。
3. **HashMap / IntMap 桶改造**：`Array (Array (List ...))`，`empty` 移除、统一 `fromList []`；
   hashmap 基准 3.0x → 2.0x。

优化后重跑 `--json bench/baseline.json` 更新基线并在这里记录。

## 9. 编译器基准（M34）

`sh bench/compiler.sh`（仓库根；`--runs N` / `--check` / `--save-baseline`）测编译器 / 工具链
自身墙钟：`check .`、`check compiler`、`build --no-compile compiler`、`vuna map` 冷 / 热、`fmt --check`。
基线 `bench/compiler-baseline.txt`（机器相关，只做同机回归对比；`--check` 超 20% 打 WARN，
软门槛，退出 0）。**M34 第一波（termination worklist / 表化 / 索引线性化）前后读数**：

| benchmark | 优化前 | 优化后 |
| --- | --- | --- |
| check . | ~10.8 s | ~7.2 s |
| check compiler | ~3.6 s | ~2.8 s |
| build --no-compile compiler | ~3.9 s | ~3.1 s |
| vuna map 冷启动 | ~0.64 s | ~0.61 s |
| vuna map 热缓存 | ~0.35 s | ~0.35 s |
| fmt --check | ~0.55 s | ~0.54 s |

主要改动（语义等价，全量夹具验证）：

1. `checkTerminationDecls` 的 `computePosFacts` 改 **worklist 不动点**：首轮只扫有出边的
   caller，之后只重扫「新 facts 的 callee 的 callers」，不再每轮全量 `posWalk` 所有 defs；
   facts 查找与集合操作（filter / 并集 / 相等）改 name→位置表；
2. `groupDefs`、`Elab/Trait.extraDefsOf` 的线性查找改 `Base.HashMap` 表；
3. `vuna map` 索引：`refsInExpr` 改累积器（O(n²)→O(n)），跨文件累积改逆序前插（消除每文件
   `append` 复制整个已累积列表）。

**M34.5 缓存（check/build）后**：

| benchmark | 冷（首次） | 热（缓存命中） |
| --- | --- | --- |
| check . | ~6.8 s | ~25 ms |
| check compiler | ~2.8 s | ~11 ms |
| build --no-compile compiler | ~2.9 s | ~18 ms |
| build compiler（完整链接） | ~6.7 s | ~16 ms |

缓存 key = 包闭包源哈希 + 依赖包哈希 + manifest 哈希 + 编译器二进制指纹 + schema 版本；
路径 `$TMPDIR/vuna-cache/<包路径哈希>/{check,split}`（Nix 构建的源树只读、沙箱 TMPDIR 每次新
⇒ 构建内不命中，无害）。check 只缓存成功结果（失败不缓存）；`List SplitFile` 是纯数据，用
`prim_marshal`/`prim_unmarshal`（OCaml Marshal）落盘——过渡实现，规范的自描述序列化格式
（C32）留后续。

**剩余（M34 后续）**：LSP 增量与单文件级缓存（需接口摘要 + 只精化本包模块）、workspace
并行 `check`、`check .` 对依赖包模块的重复精化（接口摘要后消除）。

## 相关阅读

- 规模不变量与边界：[limits.md](limits.md)
- 测试 / CI / bench：[testing.md](testing.md)
- 编译器结构：[compiler.md](compiler.md)、[core.md](core.md)
- 方法论技能：`.agents/skills/perf-debug/SKILL.md`
