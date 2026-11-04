# 性能工程（vuna 命令耗时）

本文覆盖：**怎么量**（探针设施与测量规程）、**为什么慢过**（已修的复杂度回退与查找表索引）、
**还慢在哪**（剩余热点与下一步）。规模不变量与安全边界见 [limits.md](limits.md)，测试/CI 口径
见 [testing.md](testing.md)，方法论规程见技能 `.agents/skills/perf-debug/SKILL.md`。

## 1. 现状读数

`./result/bin/vuna`（`nix build .#vuna` 产物，16 核开发机，单进程、无并行）：

| 命令 | 原始 | 第 1 轮（去超线性） | 最终（M29） | M30 后（user CPU） |
| --- | --- | --- | --- | --- |
| `check base` | 47 ms | 49 ms | **69 ms**（构成见 §7） | **26 ms** |
| `check compiler` | 76.8 s | 14.4 s | **2.5 s** | **3.1 s**（M29 后回归到 16.0 s 已修，见 §5） |
| `check .` | ~117 s | 22.3 s | **3.7 s** | **8.1 s**（M30 起 workspace 检查所有成员，口径变化） |
| `build . --no-compile` | 135.1 s | 24.5 s | **3.7 s** | **—**（未重测；codegen 路径未改） |
| `build .` | ~152 s | 27.1 s | **6.3 s** | **—** |
| `fmt --check`（全仓） | 0.6 s | 0.6 s | **0.3 s** | **0.3 s** |
| `lint` / `doc` / `map` / `gen-errors` | 10–900 ms | — | **均 <1 s** | **均 <1 s**（Index v2 多读内容算哈希，仍 <1 s） |

中间轮次（合入 diag-enums 后的回退与逐项修复：HashTbl 索引、诊断消息构造搬运行时、
primReduce 预筛、字典收敛短路、名字/邻接表哈希化）的逐轮读数保留在 git 历史里。
**所有命令已在 10 s 以内**；增长率见 §8。

> **M30 观测**：M28/C29 的 `Sig.bannedForModule` 把 banned 集改成 per-signature 现场扫全程序
> defined 名，使 `collectSigs` 退化成 O(n²)：`check compiler` 从 2.5 s 级回到 16.0 s 级。
> M30 改为一次性 qualified 表 + per-sig O(1) 查后，`check compiler` 16.0 s → **3.1 s**
> （collectSigs 相位 14.33 s → 35.6 ms），synthetic collectSigs 曲线从
> 238/752/3088/12887/54622 ms（n=500→8000）降到 8/13.6/26.9/30.6/31.1 ms。
> `check .` 8.1 s 包含 M30 新语义「workspace 检查所有成员」（compiler + base + root），
> 不是同口径回退。D18 的 NbE 值共享（`Sols.defVals` + 安全前缀记忆化）按设计落地，但采样
> 显示收益≈0（DFun 的 WHNF 是 `VLam`，`eval [] body` 已是 O(1)；force 的 NGlobal 绝大多数
> 是数据族/内建），因此保留零成本骨架、不夸大收益。ctor 索引已加（可重建缓存 + 线性回落）。

> **M29 观测（非基准口径）**：相等收口删掉的是 interp 侧的 `valueEqDeep` /
> `genericEqPrim` 与编译产物里的 `bi_eq_generic` / `bi_neq_generic` 两个 helper——都不在
> check/build 的主成本路径（§5 的 `elabBodies` / conv / force）上，未观察到退化。
> M29 开发期间本机 `vuna check .` 单次约 21 s，但那是**多任务并行构建/测试时的墙钟**
> （同机有其他 `nix build` 与全量测试在跑），不能与 §1 的 3.7 s 基线直接比；正式基线由
> Lead 在空闲机器上用 `nix run .#vuna-bench` 重测。C05（字典 binder 位置）修复只改
> 字典构造顺序、不改变实例搜索复杂度；`monad/04_kind_generic` 去标记后
> check/interp/compile+运行全过，无性能回退迹象。

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
| `stampSample key label` | 仅当 `sampleKey key`（1/64，确定性哈希）命中 | 逐定义/逐条目：采样后仍能看出「成本随规模/位置增长」的趋势 |
| `stampSampleHot key label` | 1/2048 命中 | 热路径（conv/force 级别） |
| `note` / `noteInt` | 打 `DEBUG` 文本 | 表规模、元变量数、字典目标数 |

**关键纪律**：每次打点都要 fork 一个 `sh -c date`（毫秒时间源，约 3–7 ms）。所以

- 逐条目打点必须采样，否则打点本身成为主成本；
- 单次 <5 ms 的条目用 `PERF` 差值分不出真假（噪声与 fork 抖动同量级），要判断趋势请用
  「同形规模的合成探针」对比总时间，而不是对比相邻两行。

关闭开关时：`stamp` 只花一次 `getArgs`（微秒级），`stampSample` 只花一次字符串哈希。

## 3. 查找表：`HashTbl`

`compiler/lib/Vuna/Compiler/Common.vuna` 提供 1024 桶（两层 32 叉）的持久哈希表：

```
tblEmpty / tblInsert k v / tblLookup k / tblFromList pairs / tblInsertAll pairs
```

单次查找 ≈ 64 步列表遍历 + 桶内 1–2 次字符串比较；桶内前插，「新值优先」与旧关联表一致。
`Base.Map` **不是**可用的替代：它是关联列表（assoc list），换过去复杂度不变。

索引点（都在 `Ec` 里，作为可重建的缓存；**真相永远是列表**）：

| 字段 | 索引什么 | 维护方式 |
| --- | --- | --- |
| `ecDefTbl` | 定义体（`force` 的 delta 展开） | `ecAddDef` 增量插入 |
| `ecGlobalsTbl` | 全局签名（含构造子/族名） | `elabBodies` 前用当时 `globals` 建一次；每精化一个定义插入其提升后的类型 |
| `ecSolTbl` | 解表（元变量 → 值） | `ecPutSols` 只插入本次新增的解（`solsDelta`） |

不变量：索引与列表可能短暂不同步（例如建表前的数据族/trait/签名阶段），因此热路径入口
`globalsLookup` **先查索引、未命中回落线性扫列表**；语义永远以列表为准。

## 4. 已修的复杂度回退

| 位置 | 原复杂度 | 修法 |
| --- | --- | --- |
| `Core/Eval.force` 的 `defLookup`（每个 conv 节点两侧各一次） | O(#defs) 每次（miss 必扫满） | `HashTbl`（`ecDefTbl`） |
| `force` 的 `metaLookup`（`substSolvedMetas`/`rezonkDefs` 里逐元变量） | O(#sols) 每次 | `substSolvedMetasTbl` + `ecSolTbl` |
| Elab 热路径的 `globalLookup`（每变量/类型/应用节点） | O(#globals) 每次 | `ecGlobalsTbl` + `globalsLookup`（带回落） |
| `Loader/Flatten` 显式导出表（`explicitExports`） | O(k⁴)：每项重查剩余列表 + 每项整体去重 + 内层重拼 `"bare:"++n` | 重复检查整表一次、条目去重一次（哈希）、键只算一遍 ⇒ 近线性 |
| `Elab/Termination.transpose` 的 `addEdge` | 每次插入对已累积依赖表 `dedup` ⇒ 高扇入时 O(k³) | 去重挪到 transpose 末尾统一做 |
| `Codegen/Program.checkDtProgram` | 还拼接整篇产物文本（千级定义 O(n²) 字节拷贝） | `genProgramBody False`：只走生成器判定，不拼文本 |
| `Codegen/Erase.isTypeLevelDef` | 每个定义都 `tblFromList table`（O(n²)） | 建一次传入 |
| 生成的 OCaml 运行时 | 默认 minor heap 256KB，分配密集 ⇒ 20–30% 时间在 GC | 运行时前缀设 `minor_heap_size = 32MB`、`space_overhead = 200` |
| 诊断消息构造（`Vec.substTemplate`） | vuna 层 char-list 扫描（strUnpack + append + reverse + strPack），每次 ~5–10µs；消息在「试探-回退」路径上构造后即丢弃 ⇒ check 的一半以上 | 新增内建 `strSubstTemplate`（运行时 OCaml `Buffer` 单遍），`Vec.substTemplate` 只做 Vec→List：33.4s → 16.0s |
| 字典收敛的实例搜索空转 | checkByInferFuel **每个节点**都调 resolveDictGoals，对每个 pending 目标跑 searchInstance（#实例 次 conv + 丢弃的诊断）；类参数是刚性变量时永远匹配不上（check base 里占 bodies 46.3/51.5 ms） | searchInstance 前用 isRigidDictArg/isRigidClassArg 短路：check compiler 8.8 → 3.2 s、check . 12.8 → 4.8 s |
| 诊断消息格式化（`mismatchAt`） | 计数：单次 `check .` 调用 **608 万次**，每次把两侧值各 `showValueAt` **两次** ⇒ 4 次 quote+showTerm，构造后即被回退路径丢弃 | 各算一次复用 + `showValueAt` 原子快速路径：9.6 s → 8.8 s（`check .` 14.0 → 12.6 s） |
| `primReduce` 的线性字符串分派 | force 对**每个**中性全局头都调 primReduce（单次 check 1500 万次，绝大多数是数据族名），原实现 40 个字符串分支顺序比较，判空要几百纳秒 | 新内建 `strAt` 取首字符先筛（数据族名首字母大写且非 T/F）⇒ 判空 2–3 次整数比较：10.4 s → 9.7 s |
| `globalsLookup` 未命中回落 | 16k 次/单次 check 回落线性扫 ~2500 globals（未命中全是数据族名） | Ec 加 `globalsComplete` 标记，bodies 阶段未命中直接 Nothing |
| 解表查找的线性兜底 | `solsLookup` 未命中时回落到线性扫全解表；**未解**元变量在推断期是高频查询，miss 每次扫 ~9k | 索引与 list 同步维护（每次前插都插表）⇒ miss 即未解，去掉兜底：13.4 s → 12.1 s |
| 索引键哈希的字符链表分配 | `hashStr = hashChars (strUnpack s)`：每次查表都 `strUnpack` 一条字符链表（force 每次 delta 展开都查 defs 表） | 新增运行时内建 `strHash`（OCaml 单遍、无分配）：12.1 s → 10.8 s |
| 元变量创建深度的线性查找 | `metaDepthOf` 线性扫 `ecDepthOfMeta`（~9k） | Ec 新增 `dptbl`（`HashTbl Int`），查找 O(1) |
| 解表线性查找（`metaLookup`） | 每次 force/conv/hasUnsolved 线性扫解表；签名期元变量在 bodies 阶段反复查，逐定义成本随解表增长（0.9 → 17.5 ms/def） | `Sols`（HashTbl 索引 + list 权威）沿 force/conv/normalize/primReduce/hasUnsolvedMeta* 传递，查找 O(1)：21.6s → 13.3s（同口径单文件产物） |
| 探针时钟（`Debug.stamp`） | 每次 fork `sh -c date` ≈ 5 ms，只能 1/64 采样，无法做逐定义增长分析 | 新内建 `timeUs`（`Unix.gettimeofday` µs，~1µs/次）：可逐定义打点 |
| 产物文本拼接（`Codegen.Decl.joinWith`） | `x ++ sep ++ joinWith sep rest`：千级片段 O(n²) 字节拷贝 | `interpose` + 新内建 `strConcatMany`（`String.concat`）：build 52.6s → 24.7s |

合成探针的验证（`vuna check <探针包>`，每档独立进程）：模块头导出名数 k 从 1 拉到 400，
修前 74 ms → 16.1 s（≈k⁴），修后近线性；同一批「N 个同形定义」曲线从 ≈n³ 回到 ≈n² 以下。

## 5. 仍然存在的热点（下一步）

`check compiler` 的 3.1 s 里 `elabBodies`（逐定义精化）仍是主要部分，但 M30 已确认
**逐定义成本不是整表扫描**，此前的 16.0 s 是 C29 签名阶段 O(n²) 造成的：

1. **已修：签名 banned 集 O(n²)**（M30）：`Sig.qualifiedBannedTbl` 一次建表 +
   `quantifyTopSigCached` per-sig O(1)；collectSigs 14.33 s → 35.6 ms。这是本轮唯一
   量级收益。
2. **NbE 值共享收益≈0**（M30 实测）：`Sols.defVals` + 安全前缀记忆化已落地（骨架），但
   DFun 的 WHNF 是 `VLam`（`eval [] body` O(1)），force 的 NGlobal 绝大多数是数据族/内建；
   采样显示单次 check 定义展开仅 ~700 次 vs force NGlobal ~5M 次。真正要降需要参数相关
   共享或减少 conv 的 force 调用量（不可行于纯 NbE 的部分已如实记录）。
3. **ctor 索引已加**（M30）：`Ec` 里 `dtCtorLookupEc` 先查表、未命中回落线性扫。
4. **仍可做的下一步**：conv 的「同 head 同 spine 直接成功」快速路径（`fastSame` 已覆盖
   原子形态）、减少 `applySpine`/`quote` 的分配、termination 的 list→表化（§8 的合成曲线
   在 n=4000 仍有小常数超线性）、以及 `check .` 在 workspace 单元下的并行/增量检查。
5. **GC 仍占可观测比例**：32MB minor heap 之后仍有约 15–20% 时间在 GC；减少分配比继续
   调参更有效。
6. check/build 的 10s 目标已满足（M30 后 check compiler 3.1 s；check . 8.1 s 含 workspace
   全成员检查）；继续优化应针对 alloc/conv 调用量，而不是找整表扫描。

**构建口径必须一致（踩到的坑）**：同一份源码，`vuna build .`（M26 前的单文件
`main.ml` 产物）产出的编译器比 `nix build .#vuna`（seed 多文件 split 编译）慢约 35%
（21.6s vs 16.0s，同一版本源码）。原因在 OCaml 侧：17k 行单编译单元与 66 个小模块的
优化/inlining 结果不同。所以「修前/修后」必须在同一口径下比；发现存量与 `result` 读数
对不上时，先确认测的是哪种产物。**M26 起这条差异已消失**：`compile`/`build`/seed 只有
逐模块 split 一种产物，下面保留的读数是历史口径。

## 6. 测量规程（在技能之外补充）

- **探针必须隔离**：每个探针包一套自己的 `vuna.toml` + `lib/...`。历史事故：两个并行脚本
  共用同一探针目录，`vuna.toml` 被覆盖成「整编译器」的 export 列表，读数整体作废，
  而且看起来像「固定 45s 的神秘成本」。
- **（M26 前）单文件模式 vs 包模式**不是同一条路径：包模式走 `loadProjectModules`/`resolveProject`
  与导出表，单文件模式下模块头根本不允许。两者读数不可互推；M26 起只有包上下文
  一条路径，此条仅用于解释历史读数。
- 用 `OCAMLRUNPARAM=s=...` 快速判断 GC 敏感性（注意：产物里 `Gc.set` 会覆盖环境变量，
  要比较不同 minor heap 大小得改代码重建）。
- 阶段定位优先用 `stamp`；per-def/热路径趋势用 `stampSample`；不要用「等大 case 跑完」定位。

## 7. `check base` 的构成（66 ms 花在哪）

| 阶段 | 用时 |
| --- | --- |
| 进程启动 + 运行时初始化 | ~4 ms |
| load（解析 14 个模块） | ~9 ms |
| resolve | ~3 ms |
| collectSigs + sigs-elab | ~6 ms |
| bodies（102 个定义） | ~26 ms（其中 `resolveDictGoals` ~7 ms） |
| instbodies / extradefs | ~5 ms |
| termination | ~5 ms |
| codegen 检查（partition / erasure / groups / typedecls） | ~7 ms |

相对最早的 47 ms，残差来自：base 自身变大（`Base.Nat` / `Base.Vec` + `substTemplate` 重写）、
check 现在**总是**跑终止性检查与 codegen 自检、以及每份源码都要建 defs / globals / sols
三张索引表。要继续压，先看 bodies（逐定义精化）与 load（解析）：两者都是真实工作量，
不是退化。

## 8. 增长率（合成包，最终二进制）

同一形状定义（`fi : Int` / `fi = g0`）随定义数 n 的墙钟（`result` 产物）：

| n | 改前 | 现在 | 现在/翻倍 |
| --- | --- | --- | --- |
| 500 | — | 139 ms | — |
| 1000 | 302 ms | 188 ms | 1.35× |
| 2000 | 792 ms | 320 ms | 1.70× |
| 4000 | 2692 ms | 586 ms | 1.83× |
| 8000 | — | 1561 ms | 2.66× |

原始曲线是 ≈n^1.9（1000→2000 就已 3.9×/翻倍，最长链条是 Loader 导出表 O(k⁴)、终止性
star-graph 与字典收敛的实例搜索空转）。现在 n ≤ 4000 时每翻倍 1.35–1.83×（≈线性或更好），
8000 时 2.66× 说明仍有小常数 O(n log n)/O(n²) 残余，但真实仓库（~2400 定义）离拐点很远。

### 已换掉的「循环里 append 单元素」

| 位置 | 旧做法 | 改法 | n=4000 时 |
| --- | --- | --- | --- |
| `collectSigsInto` | 重复签名检测 `memSig acc`（每次 O(#sigs)） | 哈希名字集合 `tblMem` | 220 → 9 ms |
| `quantifyTopSig` | 每个签名对 4000 项 list 两次线性扫描 | 哈希排除集合 `topQuantBanned`/`keepOutTbl` | |
| `elabSigs` | 逐签名 `append globals [sig]` | 前插累积 + 末尾一次 reverse；签名阶段维护 globals 表 | 54 → 17 ms |
| 逐定义 `clausesFor` | 每个定义扫全部剩余声明 | 名字 → clause 表建一次 | |
| 逐定义 `memDefName` | 线性扫已完成定义 | 用 Ec 的 defs 表判定 | bodies 324 → 234 ms |
| `ecAddDef` | `append defs [d]` | 前插 + 读出时 reverse | |
| codegen 依赖图（DFS/SCC/排序/查找） | 邻接、visited、分量、已发射、def 查找全是 list 线性扫 | 全部换哈希表 + 单成员分量快路径 | cg-groups 883 → 50 ms、cg-erasure 41 → 5 ms |

合成包（同形状定义）随 n 的墙钟：1000 = 181 ms、2000 = 437 ms、4000 = 1387 ms
（改前 1000 = 302、2000 = 792、4000 = 2692）。**剩余超线性集中在**
`termination`（n=4000 时 403 ms，准备阶段的 `callGraph`/`transpose`/`postOrder`/`sccOf`
仍是 list 实现）与 loader `resolve`（162 ms），下一轮继续表化；真实仓库（~2400 定义）
当前 check 4.4 s / build 7.1 s，仍有 2 倍以上余量。

## 10. 第 9 轮：M26–M30 之后的回退（build.sh 哈希 / split 归属表 / 并行测试）

M26–M30 的包上下文、split codegen、工具链与并行测试让「每定义成本」之外又冒出三处
整程序级回退。读数（`nix build .#vuna` 产物，三次平均或单次独立进程）：

| 命令 | 回退后 | 修复后 | 说明 |
| --- | --- | --- | --- |
| `build .`（干净） | 51.4 s | **16.9 s** | 扣掉 build.sh 的 O(n²) 哈希后只剩两次 ocamlopt |
| `build . --no-compile` | 12.3 s | **9.3 s** | split 归属表 + usedTable 提升 |
| `check .` | 8.6 s | 8.6 s | 精化主导（bodies 2.4 s / termination 1.5 s / cg-groups 0.93 s，见 §4） |
| `run-tests`（串行） | 166 s | **136 s** | 每个 compile 夹具的 build.sh 742 → 419 ms |
| `run-tests --jobs 8` | — | **58 s** | 1448 checks，与串行同结果 |

三处根因：

1. **build.sh 的 stamp 是 O(n²) 次 `sha256sum` fork**：每个模块的 stamp 都对「自身
   .ml/.mli + 全部依赖的 .cmi/.cmx」重新哈希 ⇒ 99 模块要 fork 近 1 万次（干净构建 39 s）。
   改成 **Merkle**：stamp = hash(自身 .ml/.mli + 依赖的 .stamp)，单 `sha256sum` 一次算完
   （`Driver/Split.vuna` 的 `hash_of`/`stamp_want`）。内容哈希语义不变。
2. **split codegen 的归属查找是线性扫**：`datasInUnit`/`defsInUnit` 对每个模块把全部
   def/data 逐个 `mapOwnerOf`（扫 pairs）⇒ O(#模块 × #def × #pairs)；`genTypeDeclsOf`
   每个模块重算 `usedTableFix`（族参数不动点，只依赖全体 datas）。改为一次建
   `HashTbl` 归属表 + `usedTableOf` 算一次传入（`Codegen/Split.vuna`、`Codegen/Decl.vuna`、
   `Codegen/Assembly.vuna`）；逐模块 codegen 26 ms → 1.2 ms。
3. **测试第 34 段复用第 30 段的 `$tmp/fmt-pkg`**：`--only 34` 与并行跑章节都会缺文件。
   第 34 段自己准备包上下文（`test/run-tests.sh`），章节从此相互独立。

并行测试：`nix run .#vuna-run-tests -- --jobs N`（`nix/run-tests.sh`）把 42 个章节按
「preamble + 章节 + summary」切片后并发跑，日志按章节顺序回放、汇总 pass/fail；
默认 `--jobs 1` 等价原脚本。CI 的 `checks.vuna-tests` 仍是串行全量（权威口径）。

**nix check 与 run-tests 的重叠**：`checks.vuna-tests` 跑全量 run-tests；其余 check 与
它重叠的部分是

| check | 内容 | 与 run-tests 重叠 |
| --- | --- | --- |
| `vuna-package` | `build examples/multi` / `test` / `fmt` / `doc` / **`build .`** | §28 包模式、§31 doc、§41 build |
| `vuna-fmt` | 全仓 `fmt --check` | §30/§32 只查 `test/corpus/` 夹具（文件不同，成本小） |
| `vuna-lint` | 全仓 `lint` | §15/§16 只查 `corpus/lint/` 夹具 |
| `vuna-index` | Index 自检 + `nix/index-check.sh` | §40 的 Index v2 自检 |
| `seed-selfhost` | seed → stage1 → stage2 逐字节 fixed point | §13 种子冒烟（只跑一个程序） |
| `vuna-typecheck` / `vuna-metrics` | `check .` / 代码体积预算 | 无（各自独立面） |

可省的重复：`vuna-package` 的 `vuna build .`（~17 s，根包产品 CLI）与 `vuna-typecheck`
的 `vuna check .`（~8.6 s）跑的是同一批源码的相近阶段；若 CI 时间吃紧，可把根包
`build .` 只留在 `seed-selfhost`/本地，或让 `vuna-package` 复用 `check .` 的产物。
