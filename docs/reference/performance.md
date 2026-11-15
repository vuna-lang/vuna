# 性能工程（vuna 命令耗时）

本文覆盖：**怎么量**（探针设施与测量规程）、**当前读数**、**热点在哪**。规模不变量与安全
边界见 [type-system.md](type-system.md)（fuel / measure 站点）与 [primitives.md](primitives.md)
（原语与运行时语义），测试 / CI 口径见 [testing.md](testing.md)，方法论规程见技能
`.agents/skills/perf-debug/SKILL.md`。

## 1. 现状读数

`nix build .#vuna` 产物，16 核开发机，单次冷启动、机器空闲口径（同一时刻只跑一个测量
进程；`vuna build` 读数**包含** `build.sh` 按直接依赖分层的层内并行，`check` / `compile`
读数不含编译并行——workspace check 的成员并行见下文；读数随机器与版本变化）。

下表是**热 store** 口径（`.local/store` 已预热，即日常迭代实际感知的耗时）；**空
`VUNA_STORE` 的冷读数差两个数量级，见紧接着的小节**。典型值（2026-11，已含本节末尾的
四处修复）：

| 命令 | 当前（热 store） |
| --- | --- |
| `check base` | ~19 ms |
| `check compiler` | ~36 ms |
| `check .` | ~58 ms（workspace 检查所有成员） |
| `build --no-compile`（workspace） | ~5.2 s |
| `build .`（含链接；单元缓存默认开） | ~7 s（其中 ocamlopt/链接 ~28 s CPU，16 路并行） |
| `fmt --check`（各包 + examples） | ~1.4 s |
| `map`（热缓存命中） | ~0.13 s |
| `map` 冷启动全量重建 | ~2.1 s（清 query store 后整仓重扫 + 编码/SHA-256；C34 的 O(n²) 已修） |
| `lint` / `doc` / `api` / `gen-errors` | 均 <1 s |
| LSP 单次编辑（会话热，重文件） | ~0.12 s（compiler 最大文件）/ ~0.02 s（根包普通文件） |
| LSP 首次请求（建会话 + 首轮增量） | ~1.1–1.5 s |
| REPL 重 import（4 次求值） | ~4.2 s |

`fmt --check` 省略 PATH 会扫 `test/suite/fixtures` 并因夹具缺 manifest 退出 2（不是格式
漂移）；CI 的 `nix/checks/vuna-fmt.sh` 只查各包 + `examples`。

更早的读数在 git 历史；当前读数须与
[`bench/compiler-baseline.txt`](../../bench/compiler-baseline.txt) 的
同机口径比较；跨机器只比 §5 的增长率。**该基线是旧口径，尚未按本轮修复重标。**

### 2026-11：冷 / 热要分开报（out-of-tree 复核）

`main` 的「典型值」是**热 store** 口径（`.local/store` 已预热），同一源码在**空
`VUNA_STORE`** 上会差两个数量级。同机（16 核，`nix build .#vuna` 产物，单进程，
无 `--debug-perf`、`VUNA_OBS=0`）：

| 命令 | 冷（空 store，修前） | 冷（空 store，修后） | 热（同 store 第二遍） |
| --- | --- | --- | --- |
| `check base` | ~0.40 s | ~0.40 s | ~19 ms |
| `check compiler` | **21.6–23.6 s** | **11.4–13.4 s** | ~51 ms |
| `check .` | 18.3 s → 6.1 s → 6.1 s（三段收敛） | 同左 | 58 ms |
| `map` | 2.2–2.5 s | 2.2–2.5 s | 0.16–0.17 s |
| `build --no-compile compiler` | ~12–28 s（见下） | ~13 s | ~150 ms |

2026-11 复核（本轮：导出面判据 + 去两处死扫描 + 阶段探针）：同机空 store 冷
`check compiler` 13.0–14.2 s、热 47 ms；`collectSigs-done` = 1、`iface-write=107/107`、
`check-lib-skip covered=88`。绝对读数只作同机同窗口参考。

`check .` 不是「冷/热」两档：第一遍冷精化、第二遍重写接口/单元、第三遍才全命中
（实测 18269 → 6141 → 6092 → 57 ms），只报其中一个数会误导。冷 `check compiler` 修前
~22 s 里约**一半是重复精化**：入口闭包没覆盖 `[export]` 的全部模块
（`iface-skip partial ... missing=Vuna.Compiler.Canonical,
Vuna.Compiler.Driver.ToolPayload`），于是每轮都补一遍 lib check（`collectSigs-done` 出现
两次，两遍各 ~11–12 s）。**已修**（见下），冷 `check compiler` 降到 ~12 s。

冷 `build --no-compile compiler` 的墙钟读数**极不稳定**（同机同源码实测 12.5 / 15.9 /
28.0 / 38.1 s）：它按直接依赖分层并行，与宿主负载强相关，且 `TMPDIR` 里的临时候选产物
会让同一 `--out` 目录的第二次调用假快。**只报 user+sys 或同时报 loadavg。**

### 2026-11：四个「同一份工作做两遍 / 按名线性查表」热点（已修）

同一 worktree、同一 HEAD、同机、同窗口交替、空 `VUNA_STORE`（独立进程；这些改动全部
**不改变 codegen 产物**，整仓 `build --no-compile` 逐字节一致）：

| 命令 | 修前 | 修后 | 变化 |
| --- | --- | --- | --- |
| 冷 `check compiler`（真实包） | 21.6–23.6 s | 11.4–13.4 s | **-45%** |
| 冷 `check compiler` 的 `collectSigs-done` 次数 | 2（逐 def 两次，共 10933 行） | 1（5470 行） | 精化遍数减半 |
| 合成单文件 N=8000（`vuna-compiler-growth`） | 2321 ms | 397 ms | -83% |
| 未使用告警探针 N=16000（入口 check） | 7693 ms | 744 ms | -90% |
| 脏模块增量探针 N=8000（`-growth-incremental`） | 4233 ms | 3116 ms | -26% |
| 冷 `check compiler` 的 iface 写 | `iface-skip partial` | `iface-write=107/107` + `check-lib-skip covered=88` | 单遍收尾 |

1. **入口闭包漏两个导出模块 ⇒ 每轮重复精化**（`compiler/app/Main.vuna`）：`compiler`
   的 `[export].modules` 含 `Vuna.Compiler.Canonical` 与 `Vuna.Compiler.Driver.ToolPayload`，
   但入口没有 import 它们 ⇒ `writeIfaceShadow` 判 `iface-skip partial`（不写包接口）⇒
   `Compile.checkPackage` 的 `check-lib-skip` 永不成立，每轮都补一遍 lib check。补两个
   import 后 `collectSigs-done` 从 2 次降到 1 次。**规则**：入口 import 集合必须覆盖
   `[export]` 全部模块，见该文件顶部注释。
   **2026-11 追加（判据收口）**：完整性判据从「lib 根下全部 `.vuna`」改为
   **`[export].modules`**（`Compile.exportedOwnOf`），读侧 `goPkgs` 同口径
   （`exportedDepModsOf`：导出面 ⊆ 写侧顺序即可）。这样未导出的内部模块既不参与写侧
   判据、也不阻塞依赖方复用；代价是不变量从「入口 == lib 根」放宽成「入口 ⊇ 导出面」，
   仍然是硬约束（少一个导出模块，冷 check 会退回两遍，日志可见 `iface-skip partial
   ... required=88`）。同轮删掉两处死计算：`summaryCheckExeParts` / `summaryCheckLibParts`
   原先为 `ownCleanModules` 算一遍 `depIfaceHashTable`，而 `ownCleanInfo` 忽略该参数——
   每次 check 白跑一遍整闭包源扫描（`ifaceModsEff`）。
2. **codegen 分组按 SCC 线性过滤全体定义**（`Codegen/Lower.appendGroups`）：每个单点 SCC
   都 `filter (memList …) env.lwDefs` ⇒ O(n²)。改为「环境里一次建 `lwDefTbl`、组内按成员名
   查表」；`recOkOfIn`/`spanOfIn` 同为逐名 `findDtDef` 线性扫，改成同一张表。
   合成探针的 codegen 段（`termination-done → cg-typedecls-done`）修前 89/284/1083 ms
   （N=2000/4000/8000，逐档 ×3.2/×3.8），修后随 N 线性。
3. **告警去重 O(n²)**（`Diagnostics/Sink.dedupeWarnings`）：`containsDiag` 对新诊断逐个
   线性扫历史；`UN_UnusedDefinition` 一次上千条时退化（N=16000 探针这部分占 ~3 s）。改为
   按 `sameDiag` 的等价类建一次键表（码 + 消息 + 严重度 + 全部 label 的 span 序列，长度
   前缀拼接），O(n) 且**告警输出逐字节不变**（已对三个探针对拍）。
4. **未使用定义扫描按名线性查「是否被引用」**（`Driver/Dt.warnUnusedDefsGo`）：同为
   O(n²)。入口 `HashMap.ofNames used` 一次建表后逐项 `member`，输出顺序不变。

这四处都不改语义：唯一可观察变化是「不再有第二轮精化」与「同样的告警以同样的顺序打印」。

### 2026-11：包级增量收尾的三处 O(n²)（已修）

同一 worktree、同一 HEAD、同机 A/B（独立进程；check/build 用 `bench/compiler.sh` 口径，
`--runs 2` 取中位；冷构建用仓库副本 + 独立空 TMPDIR）：

| 命令 | 修前 | 修后 | 变化 |
| --- | --- | --- | --- |
| `check compiler` | 2242 ms | 785 ms | -65% |
| `check .` | 3711 ms | 1430 ms | -61% |
| `build compiler --no-compile` | 3261 ms | 1769 ms | -46% |
| `build . --no-compile`（workspace，bench build-all） | 8793 ms | 5186 ms | -41% |
| 增量 `build --package vuna .`（接口热） | 5.62 s | 3.53 s | -37% |
| 冷 `build --package vuna .`（全新副本，codegen） | 8.53 s | 8.21 s | -4% |

三处根因都是「按名字线性扫全表」的 O(n²)，且都在**包级增量收尾**（单文件探针测不到，
见 §5 的新门槛）：

1. **`Dt.dedupGlobals` 及同族去重**：`memName (key x) (map key rest)` 对每个元素重建剩余
   表；增量收尾的 globals 表达上万项（16k 项实测 17.6 s）。改为从右往左一次走 +
   `HashMap String Bool` 记已见名（保持 last-wins 与「最后一次出现」的相对顺序）⇒ O(n)：
   `check compiler` 的收尾段（`termination-done → cg-partition-done`）872 → 2.4 ms。
2. **`Elab.Termination.anyOwn`**：每个 SCC 用 `memName` 线性扫 `own`（n 个单点 SCC
   ⇒ n²/2 次比较；16k 项 1313 ms）。改为入口建一次 `HashMap.ofNames own`、逐 SCC
   `member` ⇒ 冷构建 termination 566 → 299 ms，合成 16k 档约 1313 → 25 ms。
3. **写接口把包接口读两遍**：`Driver.Compile` 的 check 前段已为干净模块判定读过整包接口，
   `writeIfaceShadow` 又读一遍，`writePackageIface` 再读一遍解码全部模块文件。合并为一次
   `ownCleanInfo` 读取（同时给出 clean 与「旧接口可读」标志），把标志传给
   `writePackageIface` ⇒ `check compiler` 的 iface-write 244 → 16 ms。

冷构建（全量精化 + codegen + ocamlopt）不走增量收尾，收益主要来自 (2) 与 (3)，见上表。

容器改造（私有 `HashTbl` → `Base.HashMap`；元变量解表合并为 `HashMap Int`）的实测对比：
同一 worktree、同一份源码、独立进程各 3 次取中位数（本机绝对值与上表历史读数不可直接
比较；改造前 = 编译器内部哈希表 + 解表 String 键，改造后 = 标准库容器 + Int 键索引）：

| 命令 | 改造前 | 改造后 | 变化 |
| --- | --- | --- | --- |
| `check compiler` | ~4.87 s | ~4.18 s | -14% |
| `check .` | ~13.4 s | ~11.3 s | -15% |

除 `map` 冷启动全量重建（C34 已修）外，所有命令都在 10 s 以内；增长率见 §5。构建口径必须
一致：同一份源码在逐模块 split 产物下测量；`compile` / `build` / seed 只有这一种产物，不再有
单文件 `main.ml` 口径。

## 2. 探针设施：`dbg!` 日志行 + `VUNA_OBS` 结构化观测

分两层，**两套独立开关**；绝对读数只用「都关闭」的口径（见 §7）：

| 层 | 开关 | 输出 | 形态 |
| --- | --- | --- | --- |
| 日志行 | `--debug-perf` / `VUNA_DEBUG_PERF=1` | stderr | `DEBUG <epoch-us> <text>`，相邻两行相减 = 阶段耗时 |
| 结构化观测 | `VUNA_OBS=1..3` / `--obs` / `--obs-level N` | Chrome Trace Event JSONL | `ph:"X"` 跨度（自带 `dur` 与 `args.allocWords`/`heapWords`）、`ph:"C"` 计数、`ph:"i"` 日志与采样栈 |

结构化观测是**语言层**能力（任何 vuna 应用可用），完整规范见
[observability.md](observability.md)；本页只讲「用它来量编译器」：

```console
VUNA_OBS=2 VUNA_OBS_DIR=$PWD/trace vuna check compiler      # 阶段跨度 + 逐定义
VUNA_OBS=3 vuna build --no-compile --out OUT compiler       # + CPU/内存采样
vuna obs summarize trace/vuna-*.jsonl                       # 阶段自用/总用时表
vuna obs run --level 2 -- vuna check compiler                # 一步到位
vuna obs convert --to folded --out f.folded trace/*.jsonl   # 火焰图
```

`dbg!` 仍是**阶段边界的低成本日志**（展开规则见 [language.md](language.md) 的「内置宏」；
后端是隐藏 runtime 原语 `@vuna@debug@on` / `@vuna@debug@line`）：

| 用法 | 语义 | 何时用 |
| --- | --- | --- |
| `dbg! label` | 阶段边界的时间戳行 | 阶段边界 |
| `dbg! ("x=" ++ showTerm t)` | 任意诊断文本行 | 表规模、元变量数、字典目标数 |
| `obsCheck name (\_ => ...)` / `obsMarkEff name` | 结构化跨度 / 标记 | 需要归因表、嵌套、跨模块聚合时 |

**关键纪律（宏已承担）**：守卫在展开里，`dbg! ("x=" ++ showTerm t)` 在关闭时**不会**
先算字符串。表达式返回 `Int 0`，调用点写 `_ = dbg! ...`；开关是 runtime 里的 lazy CAF，
关闭时每个探针只做一次 `Lazy.force`。**1/64 采样已删除**（逐定义探针照常打印），因此
冷 build 的 DEBUG 输出量比旧版略增（全量精化约 15.8 万行），实测冷 build 墙钟膨胀 ~60%：
阶段比例可用，**绝对读数必须用无 `--debug-perf` / `VUNA_OBS=0` 口径**（§7）。
`vuna interp` 不执行 tracing / 观测（原语归约为 no-op），输出只发生在 compile+run 的 runtime。

结构化观测的成本纪律（关闭路径、事件缓冲、采样开销的实测口径）在
[observability.md](observability.md) §6；那里也有 `#line` 让 `perf`/`gdb` 直接看到
`.vuna` 的配方（本仓库的 `perf`/`gdb` 不进 devShell，属于手动验证路径）。

## 3. 查找表：泛型 `Base.HashMap k v`

容器在标准库（`base/lib/Base/HashMap.vuna`）：键与值都泛型的 1024 桶（两层 32 叉）持久哈希表、桶内前插、同键新值优先。键需 `Eq` + `Hashable`：String 走 `strHash`，Int 走恒等哈希 + 归一化，元变量编号这类稠密小整数几乎不冲突。原先的 String/Int 两套容器已合并为一个 `HashMap k v`，编译器没有私有 `HashTbl`、也没有 `IntMap`。

```text
HashMap.fromList / insert / insertAll / lookup / member / toList / size / ofNames
```

单次查找 ≈ 32 步列表遍历 + 桶内 1–2 次比较；泛型容器的键比较与哈希经 `Eq` / `Hashable` 字典（具体 String/Int 类型下是静态派发）。`Base.Map` **不是**可用的替代：它是关联列表（assoc list），换过去复杂度不变。

`Sols` 里有两张表：解表（`solsTbl`）与元变量创建深度表（`solsDepth`），键都是元变量
编号，均用 `HashMap Int`；`metaLookup` 查 `ecSolTbl`（O(1)），`metaLookupList` 只保留给
「只有解表 list、没有索引」的少量纯 list 场景。

索引点（都在 `Ec` 里，作为可重建的缓存；**真相永远是列表**）：

| 字段 | 容器 / 索引什么 | 维护方式 |
| --- | --- | --- |
| `ecDefTbl` | `HashMap`：定义体（`force` 的 delta 展开） | `ecAddDef` 增量插入 |
| `ecGlobalsTbl` | `HashMap`：全局签名（含构造子 / 族名） | `elabBodies` 前用当时 `globals` 建一次；每精化一个定义插入其提升后的类型 |
| `ecSolTbl` | `HashMap Int`：解表（元变量编号 → 值） | `ecPutSols` 只插入本次新增的解（`solsDelta`） |
| `ecDepthTbl` | `HashMap Int`：元变量创建深度（编号 → Int） | `newMeta` / `newHoleMeta` 增量插入 |
| `ecCtorTbl` / `ecClausesTbl` / `ecDefVals` | `HashMap`：构造子、clause 表、定义体值缓存 | `ctorTblOfDatas` / `elabBodies` 增量插入 |

不变量：索引与列表可能短暂不同步（例如建表前的数据族 / trait / 签名阶段），因此热路径入口
`globalsLookup` **先查索引、未命中回落线性扫列表**；语义永远以列表为准。

## 4. 仍然存在的热点

冷 `check compiler` ~13 s（修后）的阶段构成（`--debug-perf` 时间戳相减，单次采样）：
load/parse 前缀 + iface 摘要 **~4.0 s** → 逐定义精化（`collectSigs-done` → `bodies-done`）
**~5.9 s** → 实例体/终止性 **~0.5 s** → codegen 检查（lowering + 分组 + 文本）**~1.4 s** →
iface 影子写 **~1.2 s**（compute 0.78 s + write 0.35 s，单遍 `iface-write=107/107`）。

1. **iface 影子写 ~1.2 s**：`ownSourceInfos`（逐源文件内容哈希）+ `ifaceOfPackage`
   （逐模块 `cachedOfProgram` zonk 与 7 张表的规范化哈希）。写回侧已合并为单次读取
   （旧 §1 第 3 条）。接口哈希的「排序规范化」仍是插入排序 O(d²)，单模块数千项时会退化
   （见 §9「已量化否决」）。这也是**增量探针剩下的 2.5–2.8×/翻倍**的来源（§5.2）。
2. **load/parse 前缀 ~4.0 s（冷 store，含 iface 摘要读取）**：`check compiler` 的闭包要
   解析 107 个模块；冷 TMPDIR 还含 AST cache 写。这一段在 `--debug-perf` 里没有细分
   阶段（`iface-mods-phases` 只覆盖 373 ms 的 header 扫描），解析本身是真实工作量。
3. **冷 build 的 elab bodies**：`build --package vuna .` 的 6159 def 约 3.1 s
   （`--debug-perf` 口径），集中在 `conv`/`force`/`infer` 的项重算与分配
   （`Term/Impl`、`Core/Eval|Conv`）。每 def 的 `defVals` 记忆化（安全前置检查比命中收益
   更贵，A/B -2~3%）；更深的共享需要参数相关记忆化，未做。
4. **冷 build 的 load/parse ~2.6 s + codegen split ~1.2–1.5 s**（`cg-groups` SCC ~0.27 s、
   `cg-erasure` ~0.10 s、逐单元 typedecls/genGroups ~0.5–1 s）。`groupRuntimeDefs` 已表化，
   `dtDefLocTable` 的右嵌套 `++` 已改 `strConcatMany`。
5. **终止性 ~0.3 s（冷 build）**：`anyOwn` 的 O(n²) 已修；剩余是逐组 measure/SCT 与
   usage/callGraph 的真实工作。
6. **`genGroups`**：OCaml 文本生成，没有一眼可去的 O(n²)；codegen 并行的**逐单元可并
   部分只有 ~7–8%**，fork+序列化 DtProgram 的净收益 ~6–7%（已用 spike 量化，不做；
   `build.sh` 的层内并行已覆盖链接侧）。
7. **分配**：冷 `check compiler` minor_words ≈1.1e9、根包子进程 ≈1.55e9；elab 占分配
   ~92%，活数据仅 ~2.5MB，瓶颈是 `quote`/`zonk`/`applySpine` 的瞬时 churn，不是表示重复。
   hash-consing 需要全局 intern 表、改变 Marshal 布局、与纯精化/元变量/摘要三处不变量
   冲突，spike 结论：收益 2–4%，不做。
8. 已关闭的历史热点（不要重复排查）：**`Dt.dedup*` 的 O(n²)、`Termination.anyOwn` 的
   O(n²)、写接口的包接口双读**（2026-11，见 §1）；`Elab.Usage` 全程序扫描（实测
   10–13 ms）、实例体/方法子句查找（13.5 ms）、`refsOfDef`（12–16 ms）、签名 banned 集、
   ctor/解表索引、`unsolvedFrom` 全解表扫描。

## 5. 增长率（合成包）

### 5.1 单文件 `check`（全量精化路径）

同一形状定义（`fi : Int` / `fi = i`，包上下文只依赖 `vuna-base`）随定义数 n 的墙钟。
口径必须在**每档独立空 store**上量（`VUNA_STORE=$(mktemp -d)`；入库的
`compiler-growth.sh` 现已自己隔离 store，但本地手测仍要显式给，见 §7）：

| n | 修前（空 store，2 次取小） | 修后 | 修后 / 翻倍 |
| --- | --- | --- | --- |
| 500 | 163 ms | 154 ms | — |
| 1000 | 197 ms | 164 ms | 1.06× |
| 2000 | 318 ms | 187 ms | 1.14× |
| 4000 | 735 ms | 254 ms | 1.36× |
| 8000 | 2230 ms | 397 ms | 1.56× |

修前 8000 档是 3.03×（越过 2.5× 门槛），修后同一档 1.56×：`Lower.appendGroups` 的
O(n²) 已去掉（§1）。门槛脚本的上限已提到 N=8000，因此这一类回归现在会被挡住。

### 5.2 包路径增量 `check`（增量收尾路径）

合成「可执行包」（`lib/Mod.vuna` N 个同形 def + `app/Main.vuna`），每档：独立空 store →
预热依赖接口（`check base`）→ 冷跑一次探针包 → **改一个定义**（让本模块缓存失效）→
计时这次 check，三次取小：

| n | 修前（同探针） | 修后 | 修后 / 翻倍 |
| --- | --- | --- | --- |
| 1000 | 237 ms | 231 ms | — |
| 2000 | 504 ms | 435 ms | 1.88× |
| 4000 | 1395 ms | 1115 ms | 2.56× |
| 8000 | 4233 ms | 3116 ms | 2.79× |

**为什么必须改一行再计时**（2026-11 复核）：上一版门槛计时的是「无改动的第二次 check」，
那样子单元全命中，读数只有 ~20 ms 且与 N 全无关（N=1000/2000/4000 都是 20 ms），门槛
永远绿、什么也守不住。改一行后读数恢复成随 N 增长的真实增量路径（上面这张表）；剩下的
2.5–2.8×/翻倍是**接口哈希的插入排序**（`Driver.Iface.insertByText`，DT 只接受结构递归，
归并版不满足），属已知边界（§9「已量化否决」）。

门槛阈值仍按每翻倍 ≤3.3×（比单文件 2.5× 宽：增量路径有与 N 无关的固定成本，小 N 噪声更大）。

## 6. `check base` 的阶段构成

一次采样的量级（具体 ms 随版本 / 机器变化，用于定位优先序）：

| 阶段 | 用时 |
| --- | --- |
| 进程启动 + load/resolve 前缀 | ~20 ms |
| collectSigs + datas + traits + instheads + sigs-elab | ~44 ms |
| bodies（逐定义精化，209 def） | ~43 ms |
| instbodies / extradefs | ~12 ms |
| termination（含 Usage） | ~2 ms |
| codegen 自检（partition / names / erasure / groups / typedecls / genGroups） | ~5 ms |
| iface 影子写（compute + write） | ~6 ms |

残差来自 base 自身变大、check 现在**总是**跑终止性检查与 codegen 自检、以及每份源码都要建
defs / globals / sols 三张索引表。要继续压，先看 bodies（逐定义精化）与 load（解析）：两者
都是真实工作量，不是退化。

## 7. 测量规程

- **探针必须隔离**：每个探针包一套自己的 `vuna.toml` + `lib/...`。常见事故：两个并行脚本
  共用同一探针目录，`vuna.toml` 被覆盖成「整编译器」的 export 列表，读数整体作废，而且
  看起来像「固定 45s 的神秘成本」。
- **冷 / 热由 `VUNA_STORE` 决定，不由 `TMPDIR` 决定**。devShell 会
  `export VUNA_STORE="$root/.local/store"`（已预热）；换新 `TMPDIR` 对命中率没有影响
  （实测同一热 store 换 TMPDIR，`check compiler` 仍 73–75 ms）。要冷就显式给空目录：
  `d=$(mktemp -d); VUNA_STORE=$d/store TMPDIR=$d ./result/bin/vuna ...`。
  `VUNA_STORE` 未设/空串会回退 `~/.vuna/store`（回退链见 `Store.storeDataRootEff`），
  只读 HOME 下直接 `Sys_error ... Read-only file system`。
- **入库的增长率门禁只隔离 `TMPDIR`、复用调用方 `VUNA_STORE`**：devShell 里本地跑时各档
  共享热 store（对增长率影响小，但「每档 2 次取小」会吃掉第一档的固定成本、放大相邻比值）；
  CI 的 `mkCheck` 没有 `VUNA_STORE`、`HOME=/homeless-shelter` ⇒ 每档天然隔离。
  本地复现 CI 口径用 `VUNA_STORE=$(mktemp -d)` 显式喂空 store。
- 只有包上下文一条加载路径；单文件夹具也按最近 manifest 解析，不存在「单文件 vs 包」两套
  读数。
- **机器可能被其他负载占用**（loadavg 波动时 wall 不可比）：A/B 在同一时间窗交替跑，记录
  `time` 的 user+sys（单进程口径不受其他负载影响）；wall 只在机器空闲时引用。实测同一颗
  二进制、同一档探针：loadavg 1.6 时 N=500 168–176 ms，loadavg 15–18 时 512 ms 且
  `user+sys` 只 0.29 s ⇒ 多出来的是等待，不是算力。
- **包级增量路径要先把依赖包接口落盘**（`vuna check <dep>`，见 `compiler-growth-pkg.sh`）：
  否则探针每档都因「依赖接口缺失」走全量路径，测的就不是增量收尾。
- `--debug-perf` 在**冷 build** 上会逐条打印 conv 诊断（约 15.8 万行；`dbg!` 的实参在
  开关打开时才求值），实测让冷 build 墙钟膨胀 ~60%：定位用阶段**比例**，绝对读数
  一律用无 debug 口径；单次 <50 µs 的条目仍需「同形规模合成探针」对比总时间。
  注意冷 `check compiler` 的 debug 膨胀**不是常数**（同窗口交替实测 22.2 s → 45.3 s，
  下一轮却 42.5 s → 23.0 s，loadavg 15–17），负载与开关同样重要。
- **结构化观测的覆盖与盲区**：`VUNA_OBS=1` 现在有 `vuna.elab`（含子段
  `vuna.elab.bodies`）与 `vuna.codegen.check` 两个真实跨度，外加 `vuna.load` /
  `vuna.resolve` / `vuna.iface.compute` / `vuna.iface.write` / `vuna.codegen.split` /
  `vuna.cache.lookup` 六个 `Eff` 边界标记（`ph:"i"`，零宽度）与缓存三件套计数
  （`vuna.counter.cache.hit|miss|write`，`ph:"C"`）。`checks.vuna-obs-schema` 逐项断言
  这些名字（含计数至少一条）。**仍未接**：core 热路径计数（`vuna.counter.core.*` /
  `vuna.counter.steps`，要改 `Core.Eval` 热路径，先量代价）与 `VUNA_OBS=3` 的 CPU 采样
  调用点（`dtp_obs_sample_start` 在生成运行时里完整，但仓库内无人启动）。`Eff` 阶段的
  **耗时**仍只能靠 `--debug-perf` 文本行（`iface-mods-phases` / `iface-write=…` 等），
  trace 里只有顺序；冷 `check compiler` 的 debug 口径约 18.8 万行。
- 用 `OCAMLRUNPARAM=s=...` 快速判断 GC 敏感性（注意：产物里 `Gc.set` 会覆盖环境变量，要
  比较不同 minor heap 大小得改代码重建）。
- 阶段定位优先用阶段边界的 `dbg!`；逐定义观察直接看 `dbg!` 行；不要用「等大 case 跑完」
  定位。
- 基准入口：`nix run .#vuna-bench`（手动，非 CI check），基线文件与软告警见
  [testing.md](testing.md)。

## 8. 生成程序基准

`nix run .#vuna-perf`（逻辑在 `bench/run.sh`）测**生成程序运行时**：每个 benchmark 是一对
同算法实现（`bench/programs/<name>.vuna` vs `<name>.ml` 手写 OCaml），先校验两侧输出与
golden 一致，再 warmup + 多次取中位数；RSS 用 GNU time 的 max RSS。跨机器只比
`ratio = vuna/ocaml`（绝对 ms 不可比）。

口径与基线维护见 `bench/README.md`；基线 `bench/baseline.json` 入库，`--check` 对超阈值项
软告警。与 `nix/bench.sh` 的分工：后者测构建 / 编译墙钟与产物尺寸，本设施测运行期。

当前读数（`--runs 3 --warmup 1`，x86_64 / 16 核 / ocamlopt 5.5.1 非 flambda；绝对 ms 随
机器变化，只比较 ratio）：

| benchmark | ratio | 优化手段 |
| --- | --- | --- |
| arith | ~1.2x | 饱和内联 + 多参数 lambda 链 |
| string_ops | ~1.0x | `++` 链 / `strPack` 批拼为一次 `String.concat`；`strSubstring` + `repeat` 一次 `strConcatMany` |
| hashmap | ~2.0x | 桶改 `Array`（`Array.get` O(1) + copy-on-write） |
| list_recursion | ~0.8x | 已达标 |
| gc_pressure | ~1.1x | 已达标 |
| array | ~0.9x | 不可变 `Array` 与手写 OCaml 持平 |

关键设计决策与改动（`Codegen/Term.vuna`、`Intrinsics` / `Elab.Prelude` / `Codegen.Decl` 与
`base/`）：

1. **codegen / 运行时改进**：
   1. **内建饱和应用内联**：`+ - * /`、比较 / 相等特化、`&& ||`、`++` 直接生成 OCaml
      运算符表达式；部分应用 / 高阶引用仍走 runtime 函数。
   2. **多参数 lambda 链**：连续 `TLam` 合并成 `(fun x y -> body)`，擦除 binder 只占 de Bruijn
      位置；消除 curried 递归的每轮闭包分配。
   3. **`++` 链展平**：`a ++ b ++ c` 生成 `(String.concat "" [a; b; c])`；`strPack` / `dtp_pack`
      改 `Array.of_list`；`Base.List.concatMap` 改尾递归 accumulator；`Base.String.join` /
      `unlines` 改一次 `strConcatMany`。
   4. **GC 统计**：生成 runtime 支持 `VN_PERF_STATS=1`（退出打印 `Gc.quick_stat` 的
      minor/major words、collections、top_heap_words），`bench/run.sh` 采集进 JSON。
2. **字符串与可变数据**：`strSubstring` 原语（runtime `String.sub` + clamp 语义；interp 也
   归约 `OpStrSubstring`），`Base.String.substring` 不走 List 桥接；`Base.String.repeat` 改一次
   `strConcatMany`；可变数据（`IORef`）保持 `Eff []` 隔离，不引入线性
   类型（见 [qtt.md](qtt.md) / [effects.md](effects.md) 与 debt D22）。
3. **容器与表示**：
   1. **内建类型构造子** `Array` / `IORef`（类型层，恒可见；OCaml 表示 `'a array` / `'a ref`），
      签名支持隐式 `{a : Type}`。
   2. **Array / IORef 原语与库**（见 [primitives.md](primitives.md) §6.1、
      [stdlib.md](stdlib.md)）；`arrayEmpty` 用 non-expansive 的 `[||]` 让空表在 OCaml 侧可泛化。
   3. **HashMap 桶改造与泛型化**：`Array (Array (List ...))`；`HashMap k v` 统一 String/Int
      两套容器（无 `IntMap`），统一 `fromList []`。

优化后重跑 `--json bench/baseline.json` 更新基线并在这里记录。

## 9. 编译器基准

`sh bench/compiler.sh`（仓库根；`--runs N` / `--check` / `--save-baseline` / `--alloc`）测
编译器 / 工具链自身墙钟。基线 `bench/compiler-baseline.txt`（机器相关，只做同机回归对比）；
`--check` 超过 `--threshold`%（默认 20）打 WARN、超过 `--fail-threshold`%（默认 50）exit 1。
跨机器/跨输入规模的可比口径是 `nix/checks/compiler-growth.sh`（单文件全量路径）与
`nix/checks/compiler-growth-pkg.sh`（包路径增量收尾）的增长率门槛（§5）。

当前读数（本机 16 核，`--runs 3` 中位数；2026-11 标定，build-warm 行于
2026-11-12 修复后重测）：

| benchmark | 当前 ms |
| --- | --- |
| check-all | 1314 |
| check-compiler | 1205 |
| check-warm | 53 |
| build-all | 8717 |
| build-compiler | 3469 |
| build-warm | 45 |
| map-cold | 2111 |
| map-hot | 130 |
| fmt-check | 1139 |

**2026-11 标定的成本来源（C32 的显性代价，不是查询图引入的）**：冷路径
（check-compiler / build-compiler / build-all）比旧基线慢，原因是缓存载荷从 OCaml Marshal
换成了**显式规范编码 + `Store` framing（含 SHA-256 内容地址）**：冷路径要为每个模块编码
payload 并算摘要（此前 Marshal 是 `Obj.magic` 级拷贝）。

**2026-11-12：build-warm 的归因修正与修复**。把 255 ms 归因于「MB 级 split 载荷解码」是
错的。同机 `VUNA_DEBUG_PERF=1` 分段实测（`compiler` 包、119 单元、4.4 MB blob）：

| 阶段 | 修前 |
| --- | --- |
| 进程启动 + 源闭包哈希（check-warm 也付） | ≈ 32 ms |
| `sessionLoad` + blob 读/framing 校验/**解码** | 6.6 ms |
| 写产物文件（内容未变不重写） | 3.3 ms |
| **`canonicalTopo` + `splitGraph`** | **≈ 254 ms** |
| `copyFfiFiles` + `build.sh` 生成 | 2 ms |

`canonicalTopo` 旧实现三处叠加 O(n²)：迭代松弛每轮线性扫 memo 表、插入排序每次比较重算
SHA-256 的 tie key、排序结果按名线性找文件。修复分两层：

1. **载荷写侧规范化**：split 载荷 codec 升为 `split-files 2`，内容直接是规范拓扑序；
   命中路径按载荷顺序写产物，不再重算 `canonicalTopo`（旧 `split-files 1` 载荷因 codec
   不符自然 miss 一次并重写）。
2. **`canonicalTopo` 去 O(n²)**：HashMap memo 的迭代松弛（缺失键按 0）、graph 单元 +
   全部依赖去重后每个名字只算一次 tie key、文件名 `HashMap` 索引。未命中（冷）路径的
   这一步同样只做一次且从 O(n²) 降到近线性（冷路径总时长由 codegen 主导）；命中（热）
   路径为 0。

同机 A/B（同一源码、同一份 blob，冷/热产物 `diff -r` 逐字节一致；修复前二进制
`result` vs 修复后 `result-new`）：低负载窗口 build-warm **308 → 45 ms**；高负载窗口
（宿主 load ≈50）同窗口交替 **546–567 → 79–83 ms**（均 `--runs 5` 中位数）。两个窗口
的比值都约 6.8×，收益与负载无关。
4.4 MB 载荷解码只需 ~6.6 ms ⇒「per-file 内容寻址 blob + 小 manifest」不是当前瓶颈，
不再作为后续项（除非 blob 尺寸再上一个数量级；届时再按本节的阶段表复测）。

`fmt-check` 相对旧基线（546）的上涨来自 HEAD 源码增长与仓内路径差异，与 2026-11 的修复无关
（同一棵树、base/final 两个二进制的 A/B 读数一致），本轮未处理。`map-cold` 从旧基线 1502
重标定为 2111：旧基准的清理命令只删迁移前的缓存目录，在索引缓存迁到查询图后已是空操作，
实际测的是热路径；现在清 query store 后测真正的冷建索引（含 `Index.Codec` 编码 +
SHA-256 内容地址）。

**CI 门槛**：`bench/compiler.sh --check` 硬失败阈值；`vuna-compiler-growth`
（合成 500/1000/2000/4000 单文件，每翻倍 ≤2.5×；**脚本上限只到 4000，8000 档实测 3.03×
未被覆盖**）；`vuna-compiler-growth-incremental`（合成可执行包 1000/2000/4000/8000，
**增量路径**，每翻倍 ≤3.3×）；`vuna-compiler-perf` 含包内增量语义断言（clean≥10、parse≤20）
与 REPL 默认走接口路径的断言。

**已量化否决的候选**（数据见 git 与 `_scratch` 探针，不要重复开题）：

- **iface 哈希去排序（顺序无关折叠）**：把 `hashDefs`/`hashExports`/… 的「按名字插入
  排序 + 整表编码 + 摘要」改成逐项哈希的交换律折叠（双 lane Σh/Σh²）。
  （该实验的摘要是当时的 6-lane 强哈希，载荷是 Marshal；D5 起摘要换成 SHA-256、
  C32 哈希输入侧收口后载荷换成 `Canonical` 显式编码，但「排序 + 整表编码」的结构不变，
  结论仍按此条记录。）
  合成单模块 16k 项档 iface-compute 3.77 s → ~1.0 s，但真实包是「多模块、每模块几十项」：
  逐项 Marshal 的分配放大让 `check compiler` 的 iface-compute 119 → 318 ms（逐项强哈希）
  或冷 build 的 iface 阶段 90 → 518 ms（逐项单 lane），冷 build 反而 +4%。故保留插入排序
  口径，把「单模块数千项」记为已知边界（§4.1），由
  `vuna-compiler-growth-incremental` 兜住增量收尾的回归。
- codegen 并发生成：可并行的逐单元生成本身只占冷 build ~7–8%，fork+序列化 DtProgram 的
  净收益 ~6–7%，不做；`build.sh` 的层内并行已覆盖链接侧。
- hash-consing：Term 加 hash 字段要改 4 个 cache schema，Value 是 closure 不可 intern，
  与纯精化/元变量/摘要三处不变量冲突；预计收益 2–4%，不做。
- LSP 文件内按 def 增量：单文件耗时由 import 闭包主导，按 def 只吃 bodies（~40–60%），
  上限 1.5–1.8×，不做；模块级增量已把编辑降到 20–120 ms。
- `Elab.Usage` 全程序快速路径（实测 10–13 ms）、实例体/方法子句查找（13.5 ms）、
  `refsOfDef`（12–16 ms）、conv「同 head 同 spine 直通」（<2%）、模块级并行 codegen
  （1–2%）：均低于门槛，记录不做。
## 相关阅读

- 规模不变量与边界：[type-system.md](type-system.md)、[primitives.md](primitives.md)
- 测试 / CI / bench：[testing.md](testing.md)
- 编译器结构：[compiler.md](compiler.md)、[core.md](core.md)
- 方法论技能：`.agents/skills/perf-debug/SKILL.md`
