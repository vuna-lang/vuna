# 性能工程（vuna 命令耗时）

本文覆盖：**怎么量**（探针设施与测量规程）、**当前读数**、**热点在哪**。规模不变量与安全
边界见 [type-system.md](type-system.md)（fuel / measure 站点）与 [primitives.md](primitives.md)
（原语与运行时语义），测试 / CI 口径见 [testing.md](testing.md)，方法论规程见技能
`.agents/skills/perf-debug/SKILL.md`。

## 1. 现状读数

`nix build .#vuna` 产物，16 核开发机，单次冷启动、机器空闲口径（同一时刻只跑一个测量
进程；`vuna build` 读数**包含** `build.sh` 按直接依赖分层的层内并行，`check` / `compile`
读数不含编译并行——workspace check 的成员并行见下文；读数随机器与版本变化）。

下表是**热 store** 口径（默认根 `~/.vuna/store` 已预热，即日常迭代实际感知的耗时）；**空
`VUNA_STORE` 的冷读数差一个数量级，见紧接着的小节**。当前读数（已含本节末尾的四处
修复）：

| 命令 | 当前（热 store） |
| --- | --- |
| `check packages/base` | ~19 ms |
| `check packages/compiler` | ~36 ms |
| `check .` | ~58 ms（workspace 检查所有成员） |
| `build --no-compile`（workspace） | ~5.2 s |
| `build .`（含链接；单元缓存默认开） | ~7 s（其中 ocamlopt/链接 ~28 s CPU，16 路并行） |
| `fmt --check`（各包 + examples） | ~1.4 s |
| `map`（热缓存命中） | ~0.13 s |
| `map` 冷启动全量重建 | ~2.1 s（清 query store 后整仓重扫 + 编码/SHA-256） |
| `lint`（workspace，冷 / 结果缓存热） | ~1.9 s / ~1.2 s（本机；`--no-cache` 强制冷路径；4000 条合成 finding ~5 s） |
| `doc` / `api` / `gen-errors` | 均 <1 s |
| LSP 单次编辑（会话热，重文件） | ~0.12 s（compiler 最大文件）/ ~0.02 s（cli 包普通文件） |
| LSP 首次请求（建会话 + 首轮增量） | ~1.1–1.5 s |
| LSP hover 非洞行（`bench/lsp-probe.py`，cli 包 1124 行文件） | ~60–80 ms（冷进程首次含 Index 构建 ~0.2–2.5 s） |
| LSP hover 洞上（会话热，同文件） | 首次 ~0.45 s（只精化入口模块），同内容重复 ~1 ms；无会话时走单文件精化 ~0.4 s |
| LSP codeAction quickfix（同文件） | 首次 ~1.7 s，同内容重复 ~0.3 s |
| LSP pull 诊断（同文件） | 首次 ~0.45 s，同内容重复 0 ms |
| cli 包（入口包）`check .` | 冷 ~14 s（含 base/compiler 闭包）/ 热 ~0.1 s（模块接口与导出面同口径落对象库） |
| REPL 重 import（4 次求值） | ~4.2 s |

`fmt --check` 省略 PATH 会扫 `test/suite/fixtures` 并因夹具缺 manifest 退出 2（不是格式
漂移）；CI 的 `nix/checks/vuna-fmt.sh` 只查各包 + `examples`。

更早的读数在 git 历史；当前读数须与
[`bench/compiler-baseline.txt`](../../bench/compiler-baseline.txt) 的
同机口径比较；跨机器只比 §5 的增长率。**该基线是旧口径，尚未按本轮修复重标。**

### 冷 / 热必须分开报

§1 的「典型值」是**热 store** 口径（默认根 `~/.vuna/store` 已预热），同一源码在**空
`VUNA_STORE`** 上会差一个数量级。同机（16 核，`nix build .#vuna` 产物，单进程，
无 `--debug-perf`、`VUNA_OBS=0`）：

| 命令 | 冷（空 store，修前） | 冷（空 store，修后） | 热（同 store 第二遍） |
| --- | --- | --- | --- |
| `check packages/base` | ~0.40 s | ~0.40 s | ~19 ms |
| `check packages/compiler` | **21.6–23.6 s** | **11.4–13.4 s** | ~51 ms |
| `check .` | 18.3 s → 6.1 s → 6.1 s（三段收敛） | 同左 | 58 ms |
| `map` | 2.2–2.5 s | 2.2–2.5 s | 0.16–0.17 s |
| `build --no-compile compiler` | ~12–28 s（见下） | ~13 s | ~150 ms |

空 store 复核（导出面判据 + 去两处死扫描 + 阶段探针）：同机空 store 冷
`check packages/compiler` 13.0–14.2 s、热 47 ms；`collectSigs-done` = 1、`iface-write=107/107`、
`check-lib-skip covered=88`。绝对读数只作同机同窗口参考。

`check .` 不是「冷/热」两档：第一遍冷精化、第二遍重写接口/单元、第三遍才全命中
（实测 18269 → 6141 → 6092 → 57 ms），只报其中一个数会误导。冷 `check packages/compiler` 修前
~22 s 里约**一半是重复精化**：入口闭包没覆盖 `[export]` 的全部模块
（`iface-skip partial ... missing=Vuna.Compiler.Frontend.Canonical.Ast,
Vuna.Compiler.Driver.ToolPayload`），于是每轮都补一遍 lib check（`collectSigs-done` 出现
两次，两遍各 ~11–12 s）。**已修**（见下），冷 `check packages/compiler` 降到 ~12 s。

冷 `build --no-compile compiler` 的墙钟读数**极不稳定**（同机同源码实测 12.5 / 15.9 /
28.0 / 38.1 s）：它按直接依赖分层并行，与宿主负载强相关，且 `TMPDIR` 里的临时候选产物
会让同一 `--out` 目录的第二次调用假快。**只报 user+sys 或同时报 loadavg。**

### 四个「同一份工作做两遍 / 按名线性查表」热点

同一 worktree、同一 HEAD、同机、同窗口交替、空 `VUNA_STORE`（独立进程；这些改动全部
**不改变 codegen 产物**，整仓 `build --no-compile` 逐字节一致）：

| 命令 | 修前 | 修后 | 变化 |
| --- | --- | --- | --- |
| 冷 `check packages/compiler`（真实包） | 21.6–23.6 s | 11.4–13.4 s | **-45%** |
| 冷 `check packages/compiler` 的 `collectSigs-done` 次数 | 2（逐 def 两次，共 10933 行） | 1（5470 行） | 精化遍数减半 |
| 合成单文件 N=8000（`vuna-compiler-growth`） | 2321 ms | 397 ms | -83% |
| 未使用告警探针 N=16000（入口 check） | 7693 ms | 744 ms | -90% |
| 脏模块增量探针 N=8000（`-growth-incremental`） | 4233 ms | 3116 ms | -26% |
| 冷 `check packages/compiler` 的 iface 写 | `iface-skip partial` | `iface-write=107/107` + `check-lib-skip covered=88` | 单遍收尾 |

### Core→IR 段的二次项（已修）

- **SCC 组间定序**（`Ir.Analysis.orderGroups`）：旧实现每产出一组就重扫剩余组并重算
  `groupDeps`，源码序与依赖序相反的探针（`f0 = f1 + 1 …`）是 O(V²)。改成入度 + 反向边
  + 最小下标优先出队（与旧输出逐项一致）后，同一探针的 codegen 段
  **N=4000：1265 ms → 37 ms**（N=2000：22 ms）。构造子 / 类型参数 / record 字段查表
  从逐次线性扫改成 `LwEnv` 里的哈希索引；程序级不动点与 `unboxedInfo` 只在建环境时算一次
  （原先 split 路径每单元重算一次）。
- 回退护栏：`nix/checks/compiler-growth-ctor.sh`（构造子密集 + 反向依赖探针）。它只作
  粗粒度护栏（阈值 3.5）：该形状里 elab / 前端占主导，codegen 单次 <1 ms，精确读数仍以
  `bench/compiler.sh` 与本页的 A/B 为准。

1. **入口闭包漏两个导出模块 ⇒ 每轮重复精化**（`packages/compiler/app/Main.vuna`）：`compiler`
   的 `[export].modules` 含 `Vuna.Compiler.Frontend.Canonical.Ast` 与 `Vuna.Compiler.Driver.ToolPayload`，
   但入口没有 import 它们 ⇒ `writeIfaceShadow` 判 `iface-skip partial`（不写包接口）⇒
   `Compile.checkPackage` 的 `check-lib-skip` 永不成立，每轮都补一遍 lib check。补两个
   import 后 `collectSigs-done` 从 2 次降到 1 次。**规则**：入口 import 集合必须覆盖
   `[export]` 全部模块，见该文件顶部注释。
   **判据收口**：完整性判据从「lib 根下全部 `.vuna`」改为
   **`[export].modules`**（`Compile.exportedOwnOf`），读侧 `goPkgs` 同口径
   （`exportedDepModsOf`：导出面 ⊆ 写侧顺序即可）。这样未导出的内部模块既不参与写侧
   判据、也不阻塞依赖方复用；代价是不变量从「入口 == lib 根」放宽成「入口 ⊇ 导出面」，
   仍然是硬约束（少一个导出模块，冷 check 会退回两遍，日志可见 `iface-skip partial
   ... required=88`）。同轮删掉两处死计算：`summaryCheckExeParts` / `summaryCheckLibParts`
   原先为 `ownCleanModules` 算一遍 `depIfaceHashTable`，而 `ownCleanInfo` 忽略该参数——
   每次 check 白跑一遍整闭包源扫描（`ifaceModsEff`）。
2. **codegen 分组按 SCC 线性过滤全体定义**（`Lowering.Program.appendGroups`）：每个单点 SCC
   都 `filter (memList …) env.lwDefs` ⇒ O(n²)。改为「环境里一次建 `lwDefTbl`、组内按成员名
   查表」；`recOkOfIn`/`spanOfIn` 同为逐名 `findDtDef` 线性扫，改成同一张表。
   合成探针的 codegen 段（`termination-done → cg-typedecls-done`）修前 89/284/1083 ms
   （N=2000/4000/8000，逐档 ×3.2/×3.8），修后随 N 线性。
3. **告警去重 O(n²)**（`Base.Diagnostics.Sink.dedupeWarnings`）：`containsDiag` 对新诊断逐个
   线性扫历史；`UN_UnusedDefinition` 一次上千条时退化（N=16000 探针这部分占 ~3 s）。改为
   按 `sameDiag` 的等价类建一次键表（码 + 消息 + 严重度 + 全部 label 的 span 序列，长度
   前缀拼接），O(n) 且**告警输出逐字节不变**（已对三个探针对拍）。
4. **未使用定义扫描按名线性查「是否被引用」**（`Driver/Dt.warnUnusedDefsGo`）：同为
   O(n²)。入口 `HashMap.ofNames used` 一次建表后逐项 `member`，输出顺序不变。

这四处都不改语义：唯一可观察变化是「不再有第二轮精化」与「同样的告警以同样的顺序打印」。

### 包级增量收尾的三处 O(n²)

同一 worktree、同一 HEAD、同机 A/B（独立进程；check/build 用 `bench/compiler.sh` 口径，
`--runs 2` 取中位；冷构建用仓库副本 + 独立空 TMPDIR）：

| 命令 | 修前 | 修后 | 变化 |
| --- | --- | --- | --- |
| `check packages/compiler` | 2242 ms | 785 ms | -65% |
| `check .` | 3711 ms | 1430 ms | -61% |
| `build packages/compiler --no-compile` | 3261 ms | 1769 ms | -46% |
| `build . --no-compile`（workspace，bench build-all） | 8793 ms | 5186 ms | -41% |
| 增量 `build --package vuna .`（接口热） | 5.62 s | 3.53 s | -37% |
| 冷 `build --package vuna .`（全新副本，codegen） | 8.53 s | 8.21 s | -4% |

三处根因都是「按名字线性扫全表」的 O(n²)，且都在**包级增量收尾**（单文件探针测不到，
见 §5 的新门槛）：

1. **`Dt.dedupGlobals` 及同族去重**：`memName (key x) (map key rest)` 对每个元素重建剩余
   表；增量收尾的 globals 表达上万项（16k 项实测 17.6 s）。改为从右往左一次走 +
   `HashMap String Bool` 记已见名（保持 last-wins 与「最后一次出现」的相对顺序）⇒ O(n)：
   `check packages/compiler` 的收尾段（`termination-done → cg-partition-done`）872 → 2.4 ms。
2. **`Elab.Termination.anyOwn`**：每个 SCC 用 `memName` 线性扫 `own`（n 个单点 SCC
   ⇒ n²/2 次比较；16k 项 1313 ms）。改为入口建一次 `HashMap.ofNames own`、逐 SCC
   `member` ⇒ 冷构建 termination 566 → 299 ms，合成 16k 档约 1313 → 25 ms。
3. **写接口把包接口读两遍**：`Driver.Compile` 的 check 前段已为干净模块判定读过整包接口，
   `writeIfaceShadow` 又读一遍，`writePackageIface` 再读一遍解码全部模块文件。合并为一次
   `ownCleanInfo` 读取（同时给出 clean 与「旧接口可读」标志），把标志传给
   `writePackageIface` ⇒ `check packages/compiler` 的 iface-write 244 → 16 ms。

冷构建（全量精化 + codegen + ocamlopt）不走增量收尾，收益主要来自 (2) 与 (3)，见上表。

容器改造（私有 `HashTbl` → `Base.HashMap`；元变量解表合并为 `HashMap Int`）的实测对比：
同一 worktree、同一份源码、独立进程各 3 次取中位数（本机绝对值与上表读数不可直接
比较；改造前 = 编译器内部哈希表 + 解表 String 键，改造后 = 标准库容器 + Int 键索引）：

| 命令 | 改造前 | 改造后 | 变化 |
| --- | --- | --- | --- |
| `check packages/compiler` | ~4.87 s | ~4.18 s | -14% |
| `check .` | ~13.4 s | ~11.3 s | -15% |

除 `map` 冷启动全量重建外，所有命令都在 10 s 以内；增长率见 §5。构建口径必须
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
VUNA_OBS=2 VUNA_OBS_DIR=$PWD/trace vuna check packages/compiler      # 阶段跨度 + 逐定义
VUNA_OBS=3 vuna build --no-compile --out OUT compiler       # + CPU/内存采样
vuna obs summarize trace/vuna-*.jsonl                       # 阶段自用/总用时表
vuna obs run --level 2 -- vuna check packages/compiler                # 一步到位
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
关闭时每个探针只做一次 `Lazy.force`。逐定义探针照常打印，冷 build 的 DEBUG 输出量约
15.8 万行（全量精化），实测冷 build 墙钟膨胀 ~60%：
阶段比例可用，**绝对读数必须用无 `--debug-perf` / `VUNA_OBS=0` 口径**（§7）。
`vuna interp` 不执行 tracing / 观测（原语归约为 no-op），输出只发生在 compile+run 的 runtime。

结构化观测的成本纪律（关闭路径、事件缓冲、采样开销的实测口径）在
[observability.md](observability.md) §6；那里也有 `#line` 让 `perf`/`gdb` 直接看到
`.vuna` 的配方（本仓库的 `perf`/`gdb` 不进 devShell，属于手动验证路径）。

## 3. 查找表：泛型 `Base.HashMap k v`

容器在标准库（`packages/base/lib/Base/HashMap.vuna`）：键与值都泛型的 1024 桶（两层 32 叉）持久哈希表、桶内前插、同键新值优先。键需 `Eq` + `Hashable`：String 走 `strHash`，Int 走恒等哈希 + 归一化，元变量编号这类稠密小整数几乎不冲突。String/Int 共用这一个 `HashMap k v`，编译器没有私有 `HashTbl`、也没有 `IntMap`。

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

冷 `check packages/compiler` ~13 s（修后）的阶段构成（`--debug-perf` 时间戳相减，单次采样）：
load/parse 前缀 + iface 摘要 **~4.0 s** → 逐定义精化（`collectSigs-done` → `bodies-done`）
**~5.9 s** → 实例体/终止性 **~0.5 s** → codegen 检查（lowering + 分组 + 文本）**~1.4 s** →
iface 影子写 **~1.2 s**（compute 0.78 s + write 0.35 s，单遍 `iface-write=107/107`）。

1. **iface 影子写 ~1.2 s**：`ownSourceInfos`（逐源文件内容哈希）+ `ifaceOfPackage`
   （逐模块 `cachedOfProgram` zonk 与 7 张表的规范化哈希）。写回侧已合并为单次读取
   （旧 §1 第 3 条）。接口哈希的「排序规范化」仍是插入排序 O(d²)，单模块数千项时会退化
   （见 §9「已量化否决」）。这也是**增量探针剩下的 2.5–2.8×/翻倍**的来源（§5.2）。
2. **load/parse 前缀 ~4.0 s（冷 store，含 iface 摘要读取）**：`check packages/compiler` 的闭包要
   解析 107 个模块；冷 TMPDIR 还含 lex 载荷写。前端本身（lex + 语法分析）在 `VUNA_OBS=1`
   下可单独归因：冷 `check packages/compiler` = `vuna.parse.lex` 165 次 / **135 ms** +
   `vuna.parse.syntax` 461 次 / **158 ms**（≈0.3 s，见 §6.1）。剩下的前缀耗时在 iface
   摘要、地址计算与 flatten，不在词法/语法。
3. **冷 build 的 elab bodies**：`build --package vuna .` 的 6159 def 约 3.1 s
   （`--debug-perf` 口径），集中在 `conv`/`force`/`infer` 的项重算与分配
   （`Term/Impl`、`Core/Eval|Conv`）。每 def 的定义值记忆化已否决（安全前置检查比命中收益
   更贵，A/B -2~3%）；更深的共享需要参数相关记忆化，未做。
4. **冷 build 的 load/parse ~2.6 s + codegen split ~1.2–1.5 s**（`cg-groups` SCC ~0.27 s、
   `cg-erasure` ~0.10 s、逐单元 typedecls/genGroups ~0.5–1 s）。`groupRuntimeDefs` 已表化，
   `dtDefLocTable` 的右嵌套 `++` 已改 `strConcatMany`。
5. **终止性 ~0.3 s（冷 build）**：`anyOwn` 的 O(n²) 已修；剩余是逐组 measure/SCT 与
   usage/callGraph 的真实工作。
6. **`genGroups`**：OCaml 文本生成，没有一眼可去的 O(n²)；codegen 并行的**逐单元可并
   部分只有 ~7–8%**，fork+序列化 DtProgram 的净收益 ~6–7%（不划算，不做；
   `build.sh` 的层内并行已覆盖链接侧）。
7. **分配**：冷 `check packages/compiler` minor_words ≈1.1e9、cli 包子进程 ≈1.55e9；elab 占分配
   ~92%，活数据仅 ~2.5MB，瓶颈是 `quote`/`zonk`/`applySpine` 的瞬时 churn，不是表示重复。
   hash-consing 需要全局 intern 表、改变 Marshal 布局、与纯精化/元变量/摘要三处不变量
   冲突；预计收益 2–4%，不做。
8. 已修热点（不要重复排查，读数见 §1）：**`Dt.dedup*` 的 O(n²)、`Termination.anyOwn` 的
   O(n²)、写接口的包接口双读**；`Elab.Usage` 全程序扫描（实测
   10–13 ms）、实例体/方法子句查找（13.5 ms）、`refsOfDef`（12–16 ms）、签名 banned 集、
   ctor/解表索引、`unsolvedFrom` 全解表扫描。

### 4.1 elab 内部的结构性开销（当前处置与读数）

精化器本身的耗时集中在 `conv`/`force`/`infer`，但有几处「与规模相乘的结构开销」不在这条
热路径上，单独处置（都不改语义，诊断逐字节不变）：

| 位置 | 原状 | 处置 |
| --- | --- | --- |
| `Sols.defVals` / `Ec.ecDefVals` / `DtProgram.dtProgDefVals` | 字段恒空（无写入点），`force` 每次 delta 展开多付一次 HashMap miss | 删除字段与查表 |
| `Ctx.ctxDepth` | `length ctxItems`，每次变量引用/分支/隐式实参都读 | 绑定点维护 `ctxDepthF` |
| `Elab.Data.elabCtor` | 每个构造子两次从索引表重建 globals 列表 | 每趟算一次 |
| `Elab.Data.checkViaDataDecls` | 每条声明重算去装箱候选集（含环检测） | 每趟算一次 |
| `Ctx` 求值环境 | `evalCtx`/`varTypeValue` 每次用 `ctxEnvAt` 重建整份环境 | 绑定点前插维护（level 绝对编号 ⇒ 已有 binder 的 level 不变） |

读数（16 核、空 store、与「处置前源码」构建的编译器同窗口交替、各 8 次最小）：

| | 冷 `check packages/compiler` 墙钟 | user | 热 `check packages/compiler` |
| --- | --- | --- | --- |
| 处置前 | 14.31 s | 14.03 s | 49 ms |
| 处置后 | 14.24 s | 13.96 s | 49 ms |

**净效果 ≈0.5%，在噪声内**（同窗口抖动 ±0.3 s）。热路径与处置前一致；早期用更旧的
编译器做基线时看到的「热路径 +4 ms」来自 main 自己的提交，不是这些改动。

结论要写清：elab 的瓶颈仍是 `conv`/`force`/`infer` 的项重算（分配 ~92%），
`Ctx` 记账、零向量、族名判定这类结构开销只有千分之几，**不值得继续投入**。
两项试过又撤掉的改动（连同原因）：
- 用量零向量按 depth 共享：`HashMap.insert` 是 copy-on-write（两次 32 元素数组复制），
  比建 5–10 条 cons 贵一个量级，而收益只是省几条 cons，撤（**不是**「查」慢：查是
  hash + 两次 `Array.get` + 桶内线性扫，Int 键在小桶里比建 cons 便宜）；
- `isDictFamily` 加 `Dict_` 前缀预筛：`startsWith` 会把**两个串都** `strUnpack` 成
  `List Int`（按整串长度分配），与原「扫 17 个类名」同量级，撤；
- 桶数 1024 → 4096（64×64，只为 Int 键降碰撞）：同窗口 6 次交替最小 14.10 s vs
  14.05 s，**≈0.3%，噪声量级**，撤。容器真正的上限在「固定 1024 桶 + 桶内链表」：
  27k 条解表平均桶长 ~26，`toList`/`size` 还是 O(n·桶长)。要动就得换 HAMT（稀疏节点 +
  完整哈希位）或加宽 `strHash`（intrinsic，涉及 interp/native/wasm 三份实现 + 主题页），
  并重新 rotation；按当前读数不值得。
- 把 binder 类型在绑定点求值成 Value 直接复用（省 `shift`+`eval`）：会改变不透明/擦除
  决策（`isOpaqueRuntimeTyIn` 按**当前**精化重算类型），属语义改动，撤，并把该不变式
  写进 [core.md](core.md) §5。`Ctx` 只保留「求值环境前插维护」这一处结构简化。

### 4.1 逐定义精化与 codegen 检查的分段（span 口径）

`VUNA_OBS=1`、空 `VUNA_STORE`、单进程冷跑 `check packages/compiler`（绝对数随机器负载浮动，
看份额即可）：

| span | 耗时 | 说明 |
| --- | --- | --- |
| `vuna.elab.bodies` | ~9.2 s | 逐定义精化（`vuna.def.elab` 5784 次） |
| `vuna.elab.term` / `.term.body` | ~9.0 s | `checkDefIn` 的正文检查 |
| `vuna.codegen.check` | ~1.4 s | `.lower` ~1.4 s（`.unit` ~1.0 s）；`.gen` <10 ms |
| `vuna.parse.syntax` / `.lex` | 0.14 s / 0.11 s | 315 / 166 次 |

按表达式形态归因 `vuna.elab.term.core`（level 2 逐节点 span 的自用时间）：`EApp` ~4.6 s、
`EVar` ~3.6 s，其余形态合计 <1 s。所以剩余成本是**每个表达式节点的推断/统一**，
不是可以整段跳过的阶段；再往下需要给工具链自身接 CPU 采样
（`@vuna@obs@sampleStart` 目前只接在用户程序运行时），用函数级栈定位 `conv` / `force`。

用工具链自采样（`observability.md` §6.1）看函数级热点，冷 `check packages/compiler` 的顶部是
**解析期的名字解析**（`Loader.Modules.isDataOrRecordCtorTarget` 与 `mangle` 的字符串拼接、
`lookupExport` 的线性扫描）、`Elab.Types.ecTriedAt` 的约束尝试记录、以及
`Elab.Meta.dtCtorLookup`；`Core.Eval.quote` 与 `List` 的 `unpack` 次之。

据此落地的两条改动：
- 局部 binder 的引用不再走运算符特化链（`+` / `==` / `Base.Num.*` 只可能是全局名）：
  `EVar` 自用时间 4.6 s → 3.6 s；
- check 路径用 `Codegen.Assembly.checkUnitParts` 只校验「运行时定义有体」，不拼产物文本
  （文本生成是纯渲染，`Codegen.Term` 唯一的 `ErrC` 已保留）：`codegen.check` 1.7 s → 1.4 s。
- `isDataOrRecordCtorTarget` 先按 canonical 的「数据前缀」筛族、再比构造子短名（不再为每个
  构造子拼一次 `${mname}.${dname}.${cname}`）；`ConstraintStore.csTried` 从关联表改成
  `HashMap Int Int`（否则尝试记录变长后每次 `ecTriedAt` 线性扫描）。
  冷 `check packages/compiler` 与上一版同一窗口交替对比快 17–20%（负载波动大，只作同机参考）。
- `Module` 增加 `moduleExportIndexOf`（公开名 → 导出条目，构造时建一次）：解析期按名字查
  导出不再线性扫整张导出表；`modulesExporting{Value,Ctor,Type}` 走索引。
  同窗口交替对比冷 `check packages/compiler` 再快 5–10%。

- 字典求解：`ConstraintStore` 记录解表条目数（`csSolsCount`，`ecPutSols` 增量维护）与上一轮
  结束时的 `(id, 解表数)`；没有新约束、解表也没增长的轮次整体跳过。epoch 比较改用 O(1)
  计数（原来每步 `length (ecSols ec)`，解表 2.8 万条时是 O(解表) × 约束步数）。冷
  `check packages/compiler` 的 `elab.dict.round` 55863 → 22359，同机 CPU 时间 −33%
  （`ru_utime+ru_stime`，负载波动大时只看这一项）。

- `dtp_unpack` / `dtp_pack` 改成直接循环（原来 `List.init` + `fold_right` 两趟、`dtp_pack`
  还经 `Array.of_list` + `String.init`）：每读一个文件少一趟中间列表，采样里
  `List.init` 与 unpack 闭包从 ~17% 降到 ~6%。
- 构造子查表命中失败时不再盲目线性扫族表：`ConstraintStore.csCtorIndexComplete` 记录索引
  是否覆盖全部 data（`ecPutCtorTbl` 后为真），覆盖后「查不到 = 不是构造子」直接返回。
  冷 `check packages/compiler` 实测 96k 次回落全部是「不是构造子」，现在不再各扫 285 个族；
  `ctorRefTerm` / `ctorAppTerm` 也改用 Ec 版本（查 `ecCtorTbl`）。

- lexer 的字符游标从 `List Int` 改成「原串 + 偏移」（`Chars { source, offset, pos }`），
  扫描器按 `charsPeek` / `charsStep` 推进，不再整串 `strUnpack`。实测 `vuna.parse.lex`
  冷 `check packages/compiler` 194 ms → 174 ms（~10%），占整条冷检查不到 0.3%——**采样里剩下的
  `dtp_unpack` 主要来自 Canonical/Store/Hash 的字节编码，不是 lexer**。

此时自采样的剩余热点：`dtp_unpack`（Canonical/Store 的字节处理）、`String.concat`
（Canonical/地址编码）、`dtp_strHash`、`nubNames`/`reverseOnto`、`Core.Eval.quote`；
求解器里还剩 `append pending [c]` 的 O(长度) 追加（旋转语义，改动要连语义一起重写）。

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

修前 8000 档是 3.03×（越过 2.5× 门槛），修后同一档 1.56×：`Lowering.Program.appendGroups` 的
O(n²) 已去掉（§1）。门槛脚本的上限已提到 N=8000，因此这一类回归现在会被挡住。

### 5.2 包路径增量 `check`（增量收尾路径）

合成「可执行包」（`lib/Mod.vuna` N 个同形 def + `app/Main.vuna`），每档：独立空 store →
预热依赖接口（`check packages/base`）→ 冷跑一次探针包 → **改一个定义**（让本模块缓存失效）→
计时这次 check，三次取小：

| n | 修前（同探针） | 修后 | 修后 / 翻倍 |
| --- | --- | --- | --- |
| 1000 | 237 ms | 231 ms | — |
| 2000 | 504 ms | 435 ms | 1.88× |
| 4000 | 1395 ms | 1115 ms | 2.56× |
| 8000 | 4233 ms | 3116 ms | 2.79× |

门槛计时必须**改一行再测**：无改动的第二次 check 只走缓存，读数只有 ~20 ms 且与 N
全无关（N=1000/2000/4000 都是 20 ms），门槛永远绿、什么也守不住。改一行后读数走真实
增量路径（上面这张表）；剩下的
2.5–2.8×/翻倍是**接口哈希的插入排序**（`Driver.Iface.insertByText`，DT 只接受结构递归，
归并版不满足），属已知边界（§9「已量化否决」）。

门槛阈值仍按每翻倍 ≤3.3×（比单文件 2.5× 宽：增量路径有与 N 无关的固定成本，小 N 噪声更大）。

## 6. `check packages/base` 的阶段构成

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

### 6.1 前端（lex / 语法分析）的占比与增长率

`VUNA_OBS=1` 的三个 span 把前端拆开（`observability.md` §3.3）：`vuna.parse.lex` 是一次
全文词法（命中 lex 缓存时不出现）、`vuna.parse.syntax` 是 token 流 → AST、`vuna.parse.cst`
是无损 CST 组装（工具侧）。

冷 store、`VUNA_ELAB_FULL=1` 单次采样：

| 目标 | `vuna.parse.lex` | `vuna.parse.syntax` | 参考：elab |
| --- | --- | --- | --- |
| `check packages/base` | 57 次 / ~11 ms | 114 次 / ~4.6 ms | ~127 ms |
| `check packages/compiler` | 165 次 / ~135 ms | 461 次 / ~158 ms | ~19.7 s（全量口径） |

三条结论：

* lex : syntax ≈ 2:1（与「lex 占 parse 的 86%」的旧注释一致），词法是前端里值得优化的那一半；
* `syntax` 次数 = 模块数的 **2.8 倍**（461 / 164）：同一份源码在一次 check 里被反复
  `parseSourceRecoveringTokens`（加载、fixity 表、header 扫描各走一遍）。减少**次数**比加快
  单次解析收益更直接（债 D88）；
* 前端整体在冷 `check` 里只有 ~1.5%：lex/parse 不再是瓶颈，工具链（fmt / lint / map / LSP）
  才是它的主要消费者。

增长率门槛 `checks.vuna-frontend-growth`（合成 N 个同形定义，相邻档 ≤2.5×；本机）：

| N | `parse.lex` | `parse.syntax` | `fmt --check`（改前 → 改后） |
| --- | --- | --- | --- |
| 2000 | 11.9 ms | 7.9 ms | 77 → 70 ms |
| 4000 | 17.4 ms | 15.2 ms | 119 → 106 ms |
| 8000 | 25.7 ms | 18.3 ms | 168 → 154 ms |

**注释只扫一遍**：`Frontend.Lexer` 现在有两条入口——token 路径（`lexChars`，不分配注释）
与注释路径（`lexSourceWithComments`，一次扫描同时给出 token 与注释）。旧实现另有
`scanComments` 并行扫描器（自己再实现「字符串里不算注释」），fmt / index / doc / LSP 都要
`parse` + `lexComments` 两遍；现在走 `parseSourceWithComments`，只付一次词法（上表
`fmt --check` 的 ~8% 即来自这里）。token 路径保持零分配：把注释收集并进 token 路径（每个
token 一次 `Pair`）的初版实测让 `vuna.parse.lex` 慢 ~20%，已放弃。

## 7. 测量规程

- **探针必须隔离**：每个探针包一套自己的 `vuna.toml` + `lib/...`。常见事故：两个并行脚本
  共用同一探针目录，`vuna.toml` 被覆盖成「整编译器」的 export 列表，读数整体作废，而且
  看起来像「固定 45s 的神秘成本」。
- **冷 / 热由 `VUNA_STORE` 决定，不由 `TMPDIR` 决定**。devShell 会
  不再按 worktree 分 store（统一到默认根 `~/.vuna/store`，已预热）；换新 `TMPDIR` 对命中率没有影响
  （实测同一热 store 换 TMPDIR，`check packages/compiler` 仍 73–75 ms）。要冷就显式给空目录：
  `d=$(mktemp -d); VUNA_STORE=$d/store TMPDIR=$d ./result/bin/vuna ...`。这里固定用
  `./result/bin/vuna`，先 `nix build .#vuna --out-link result`；`result` 是共享 out-link，
  可能指向旧二进制或别的产物，测量前确认它对应本次构建。
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
  注意冷 `check packages/compiler` 的 debug 膨胀**不是常数**（同窗口交替实测 22.2 s → 45.3 s，
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
  trace 里只有顺序；冷 `check packages/compiler` 的 debug 口径约 18.8 万行。
- 用 `OCAMLRUNPARAM=s=...` 快速判断 GC 敏感性（注意：产物里 `Gc.set` 会覆盖环境变量，要
  比较不同 minor heap 大小得改代码重建）。
- 阶段定位优先用阶段边界的 `dbg!`；逐定义观察直接看 `dbg!` 行；不要用「等大 case 跑完」
  定位。
- 基准入口：`nix run .#vuna-bench`（手动，非 CI check），基线文件与软告警见
  [testing.md](testing.md)。

## 8. 生成程序基准

`nix run .#vuna-perf`（逻辑在 `bench/run.sh`）测**生成程序运行时**：每个 benchmark 是一对
同算法实现（`bench/programs/<name>.vuna` vs `<name>.ml` 手写 OCaml），先校验两侧输出与
golden 一致，再 warmup + 多次取中位数；`--target ocaml|native|both` 选择被测后端，峰值内存
用 GNU time 的 max RSS。跨机器只比 `ratio = <backend>/ocaml` 与 `rss_ratio`
（绝对 ms / KB 不可比）。

口径与基线维护见 `bench/README.md`；基线 `bench/baseline.json`（OCaml 后端）与
`bench/native-baseline.json`（native，§8.1）入库，`--check` 对超阈值项软告警。与
`bench/bootstrap.sh` 的分工：后者测构建 / 编译墙钟与产物尺寸，本设施测运行期。

当前读数（`--runs 3 --warmup 1`，x86_64 / 16 核 / ocamlopt 5.5.1 非 flambda；绝对 ms 随
机器变化，只比较 ratio）：

| benchmark | 场景 | ratio | 优化手段 |
| --- | --- | --- | --- |
| arith | Int 算术 + 尾递归 | ~1.2x | 饱和内联 + 多参数 lambda 链 |
| string_ops | 字符串拼接 / repeat / substring | ~1.3x | `++` 链 / `strPack` 批拼为一次 `String.concat`；`strSubstring` + `repeat` 一次 `strConcatMany` |
| hashmap | 持久哈希表 + 字典派发 | ~2.0x | 桶改 `Array`（`Array.get` O(1) + copy-on-write） |
| list_recursion | List 非尾递归 / fold / append | ~0.8x | 已达标 |
| gc_pressure | 分配压力（字符串 churn） | ~1.2x | 已达标 |
| array | 不可变 Array（get / set / length） | ~0.9x | 不可变 `Array` 与手写 OCaml 持平 |
| records | record 更新 + variant 分派 | ~2.1x | record 直接映射 OCaml record；多字段更新无额外分配 |
| closures | 高阶函数 / 每次迭代新建闭包 | ~1.4x | 多参数 lambda 链 + 饱和调用直调 |
| sorting | 归并排序（List + Pair 拆半） | ~1.5x | List 单元与模式匹配与手写一致 |
| float_math | Float 算术 / sqrt / abs / 转换 | ~1.9x | 浮点内建；盒装表示与 OCaml 相同 |
| text_scan | 逐字节 `strAt` 扫描 | ~1.5x | `strAt` 直调原语，不经 List 桥接 |
| nat_bits | Nat 饱和算术 + 63-bit 位运算 | ~1.3x | Nat 运行时即 Int；位运算内建 |
| tco_mutual | 互递归（`even`/`odd`） | ~1.0x | 尾调用在 OCaml 侧直接复用栈帧 |
| tco_wide | 9 参数尾递归（3 个栈参数） | ~1.3x | 尾调用与栈传参 ABI 由 ocamlopt 处理 |
| gc_low_live | 低存活集、大累计分配 | ~0.8x | OCaml GC 回收；vuna 侧只有 bump 分配 |
| gc_array_churn | 大对象 churn（Array COW） | ~1.7x | `Array.set` COW 与手写 `Array.copy` 对齐 |

场景覆盖：数值 / 字符串 / 容器 / 分配 / 数组 / 记录与变体 / 高阶函数 / 算法 / 浮点 /
逐字节文本 / Nat 与位运算 / TCO / GC。新增场景对应 `bench/programs/{records,closures,
sorting,float_math,text_scan,nat_bits,tco_mutual,tco_wide,gc_low_live,gc_array_churn}.vuna`。

关键设计决策与改动（`Codegen/Term.vuna`、`Base.Intrinsics` / `Elab.Prelude` / `Codegen.Decl` 与
`packages/base/`）：

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

### 8.1 native 后端（生成程序）

`nix run .#vuna-perf -- --target native`（或 `--target both`）把同一批基准编到 native
并测量；基线 `bench/native-baseline.json`。口径：

- 同一份源码、同一 N；native、OCaml 后端与手写 OCaml 在同一窗口交替测量；
- native 不做尾调用：16 个基准里 11 个在默认 8 MiB 栈上 exit 139（只有 `string_ops` /
  `hashmap` / `sorting` / `gc_low_live` / `gc_array_churn` 能过），所以所有 native 进程统一在
  `ulimit -s unlimited` 下运行（JSON `meta.stack_policy` 记录该口径）；每个 native 项另记
  `default_stack_ok`（8 MiB soft limit 下能否正常退出，探针不参与计时）；
- native 有**保守标记-清扫 GC**（[native.md](native.md) §5.2），峰值 RSS = 栈页 + live 堆；
  `--rss-passes 3` 取最大值，与墙钟分开采样；
- `--runs 5 --warmup 2` 取中位数；基线记录生成时的 `meta.loadavg`，跨机器只比 ratio。

本机一档（16 核，生成时 `loadavg ≈ 4.2`，同一窗口）：

| benchmark | native ms | OCaml 后端 ms | 手写 OCaml ms | native/手写 | native/OCaml 后端 | native RSS | 手写 RSS | RSS 比 |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| arith | 47 | 5 | 5 | 9.4x | 9.4x | 4.2 MiB | 2.5 MiB | 1.7x |
| string_ops | 5 | 4 | 3 | 1.7x | 1.3x | 4.3 MiB | 3.2 MiB | 1.3x |
| hashmap | 13 | 7 | 4 | 3.3x | 1.9x | 4.1 MiB | 3.9 MiB | 1.1x |
| list_recursion | 76 | 10 | 13 | 5.9x | 7.6x | 49.5 MiB | 11.3 MiB | 4.4x |
| gc_pressure | 86 | 31 | 26 | 3.3x | 2.8x | 49.9 MiB | 11.1 MiB | 4.5x |
| array | 40 | 16 | 16 | 2.5x | 2.5x | 42.6 MiB | 15.6 MiB | 2.7x |
| records | 52 | 14 | 7 | 7.4x | 3.7x | 4.2 MiB | 4.7 MiB | 0.9x |
| closures | 103 | 11 | 9 | 11.4x | 9.4x | 48 MiB | 8.7 MiB | 5.5x |
| sorting | 49 | 24 | 18 | 2.7x | 2.0x | 18.1 MiB | 9.5 MiB | 1.9x |
| float_math | 256 | 13 | 7 | 36.6x | 19.7x | 251 MiB | 4.5 MiB | 56.0x |
| text_scan | 52 | 6 | 4 | 13.0x | 8.7x | 60.4 MiB | 3.4 MiB | 17.8x |
| nat_bits | 62 | 5 | 4 | 15.5x | 12.4x | 85.4 MiB | 2.6 MiB | 33.5x |
| tco_mutual | 27 | 5 | 4 | 6.7x | 5.4x | 4.2 MiB | 2.5 MiB | 1.7x |
| tco_wide | 31 | 4 | 3 | 10.3x | 7.8x | 4.2 MiB | 2.5 MiB | 1.6x |
| gc_low_live | 322 | 281 | 339 | 0.95x | 1.15x | 5.4 MiB | 244 MiB | 0.02x |
| gc_array_churn | 1443 | 191 | 115 | 12.6x | 7.6x | 223 MiB | 82 MiB | 2.7x |

读法：

- **arith 曾是 67.6x / 412 MiB**：300 万层递归帧不回收，时间花在栈页 fault 而不是指令质量。
  它的递归主体是**直接饱和尾调用**，TCO 后为 47 ms / 4.2 MiB（9.4x，§8.2）。
- **native/OCaml 后端 1.3–2.8x 的一档**：`string_ops` / `hashmap` / `array` / `sorting` /
  `gc_pressure`；`list_recursion`（7.6x）与 `closures`（9.4x）的差距来自闭包/对象表示、
  非尾递归与「所有中间值占栈槽」的朴素 codegen（闭包调用不在尾调用覆盖面内，
  见 [native.md](native.md) §3）。
- **10x 以上的一档各有明确的单一来源**：`text_scan` 是逐字节 `strAt` 运行时调用；
  `records` 曾是 80 万层尾递归帧 + 每步 record 分配 + 闭包-per-`let`（TCO 后 52 ms /
  4.2 MiB）；`nat_bits` 是每轮 Nat 模式匹配；`float_math` 是每次浮点运算的装箱对象。
- `tco_mutual` / `tco_wide` 曾经几乎全是**栈帧成本**（RSS 与墙钟随递归深度线性增长、
  `default_stack_ok=false`）；TCO 后 27 / 31 ms、4.2 MiB、`true`（§8.2）。
- **GC 的主判据已达成**：`gc_low_live`（低存活集、大累计分配）322 ms / 5.4 MiB，手写侧
  339 ms / 244 MiB——墙钟持平、RSS 降到 0.02x；`gc_pressure` 的 RSS 也从 59 MiB 降到
  50 MiB。`gc_array_churn` 是 GC 相关的最差项（1443 ms / 223 MiB）：每轮 `Array.of_list`
  + COW 复制产生大量复制块，回收时机由阈值决定，墙钟比手写高 12.6x。
- 峰值 RSS 的语义：OCaml 侧是 GC 后高水位，native 侧是栈页 + live 堆；两者只作量级参考。
- 这组数不是 CI 门槛：跨机器、跨负载不可比；回归判断用 `--target native --check` 对
  `bench/native-baseline.json` 的 ratio、rss_ratio 与 `default_stack_ok` 变化做提示。

### 8.2 TCO / GC 验证项

native 的 TCO / GC 验证项。**GC 与 TCO 均已落地**；下表「前」列取 §8.1 的 TCO 前快照，
「后」列是 `--target both --runs 5 --warmup 2 --only <name>` 的实测（与 §8.1 同口径）：

| 用例 | TCO 前 | TCO 后实测 | 判定列 |
| --- | --- | --- | --- |
| `tco_mutual` | 189 ms / 244 MiB / `default_stack_ok=false` | 27 ms / 4.2 MiB / `true` | wall, rss, stack |
| `tco_wide` | 343 ms / 442 MiB / `false` | 31 ms / 4.2 MiB / `true` | wall, rss, stack |
| `arith` | 338 ms / 412 MiB / `false` | 47 ms / 4.2 MiB / `true` | wall, rss, stack |
| `records` | 151 ms / 151 MiB / `false` | 52 ms / 4.2 MiB / `true` | wall, rss, stack |

- **TCO**：判据是 `default_stack_ok` 由 false 翻为 true，且 RSS 从百 MB 降到进程基线
  （~4.2 MiB）；上表四项都满足。`arith` / `records` 也翻真，说明它们的递归主体同样是
  **直接饱和尾调用**；`tco_wide` 覆盖 9 参（3 个栈实参）的自递归。
- **GC**：主判据是 RSS 从「累计分配」降到「存活集」——`gc_low_live` 现在 5.4 MiB
  （GC 前只有 bump 分配时 289 MiB；GC 上线但未清死槽时一度 319 MiB）；
  `VUNA_NATIVE_GC_LOG=1` 可逐次看 `live`。墙钟由两件事决定：清扫/标记 live
  与**保守扫活栈**，所以阈值取 `max(GC_MIN, 2×live, 本次扫到的栈字节数)`（见
  [native.md](native.md) §5.1）；死槽清零（调用点实参槽 + 文本最后读取后清零）让活帧
  不再留住已消费的临时对象，是 `gc_low_live` RSS 能降到 5 MiB 的原因。
- 重标基线时 `default_stack_ok` 是布尔快照：直接饱和尾调用的项应为 true；非尾深递归项
  （如 `list_recursion` 的拆半递归）仍为 false，那不是 TCO 漏覆盖——闭包调用、
  `rt_apply`、`rt_*` 与源级 `let`（降级成 lambda 应用）都不在覆盖面内。

### 8.3 wasm 后端（浏览器路径：JS 宿主 / V8）

wasm 产物由仓库自带的 JS 宿主执行（`test/suite/fixtures/wasm_js_host/run.mjs`，Node/V8；
与浏览器同一套 `WebAssembly` API 和 host 层），不走 wasmtime——后者的删除条件见
[debt.md](debt.md) D102。`--target wasm`（或 `--target all`）跑同一批 16 个程序。

本机一档（`--target all --runs 5 --warmup 2`，同窗口；绝对 ms / RSS 只作同机对比）：

| benchmark | wasm ms | native ms | OCaml 后端 ms | 手写 ms | wasm/手写 | native/手写 |
| --- | --- | --- | --- | --- | --- | --- |
| arith | 88 | 48 | 6 | 5 | 17.6x | 9.6x |
| string_ops | 26 | 5 | 4 | 3 | 8.7x | 1.7x |
| hashmap | 36 | 14 | 7 | 3 | 12.0x | 4.7x |
| records | 67 | 50 | 14 | 7 | 9.6x | 7.1x |
| float_math | 55 | 85 | 14 | 8 | 6.9x | 10.6x |
| nat_bits | 40 | 17 | 5 | 4 | 10.0x | 4.3x |
| tco_mutual | 34 | 27 | 5 | 5 | 6.8x | 5.4x |
| tco_wide | 61 | 31 | 4 | 4 | 15.3x | 7.8x |
| gc_low_live | 858 | 323 | 295 | 346 | 2.5x | 0.9x |
| gc_array_churn | 467 | 1399 | 200 | 131 | 3.6x | 10.7x |
| list_recursion / gc_pressure / array / closures / sorting / text_scan | `run_ok=false` | 71 / 96 / 34 / 92 / 48 / 33 | 11 / 32 / 15 / 12 / 26 / 6 | 13 / 27 / 16 / 9 / 19 / 5 | — | — |

口径（读数前先看）：

- **宿主启动地板**：每项都含 node 启动 + 模块实例化，JSON `meta.node_startup_ms`
  （本机 ~18 ms）。小项先减地板再看：`tco_mutual` 34 − 18 ≈ 16 ms、`string_ops` ≈ 8 ms。
- **V8 的 wasm 栈约 1 MB 且没有开关**（`node --stack-size` 不改变 wasm 栈，开大直接
  SIGSEGV）：上表六个非尾深递归程序以 `Maximum call stack size exceeded` 收口，JSON 记
  `"run_ok": false, "skip_reason": "run"`。浏览器同此——这是浏览器路径的实际执行边界，
  不是测量设施的限制。
- **RSS 不可比**：wasm 列是 node 进程量级（~55 MB 起），`gc_low_live` 的 ~800 MB 是 wasm 侧
  只增不减的线性内存；与 native「栈页 + live 堆」、OCaml「GC 高水位」不是一个口径。
- **引擎/宿主版本是一阶变量**：同一份 `main.wasm` 的 `arith` 在 wasmtime 41.0.3 上是 2.1 s、
  50.0.0 上是 0.11 s。基线只与 `meta.node` + `meta.wasm_host_runner` 同版本可比。

读法（减掉 ~18 ms 地板）：**V8 在 `float_math`（37 vs native 85）、`gc_array_churn`
（449 vs 1399）与 `tco_mutual`（16 vs 27）上快过 native，`records` 基本持平**；native 领先
`arith`（70 vs 48）、`string_ops`、`hashmap`、`tco_wide`、`gc_low_live`。差异来源与 native 的
既有缺口一致：native 无寄存器分配、每个算术/比较都是一次运行时调用，而 V8 有优化编译器；
native 赢在「调用少、字符串/栈传参多」的形状（§3）。

## 9. 编译器基准

`sh bench/compiler.sh`（仓库根；`--runs N` / `--check` / `--save-baseline` / `--alloc`）测
编译器 / 工具链自身墙钟。基线 `bench/compiler-baseline.txt`（机器相关，只做同机回归对比）；
`--check` 超过 `--threshold`%（默认 20）打 WARN、超过 `--fail-threshold`%（默认 50）exit 1。
跨机器/跨输入规模的可比口径是 `nix/checks/compiler-growth.sh`（单文件全量路径）与
`nix/checks/compiler-growth-pkg.sh`（包路径增量收尾）的增长率门槛（§5）。

当前读数（本机 16 核，`--runs 3` 中位数）：

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

**冷路径的成本来源（显式编码与 `Base.Store` framing 的代价，不是查询图引入的）**：check-compiler /
build-compiler / build-all 要为每个模块把缓存载荷**显式规范编码 + `Base.Store` framing（含 SHA-256
内容地址）**并算摘要——逐项写字节，而不是 `Obj.magic` 级拷贝。

**build-warm 的归因：`canonicalTopo` + `splitGraph`**。同机 `VUNA_DEBUG_PERF=1` 分段实测
（`compiler` 包、119 单元、4.4 MB blob），拓扑序未进载荷时各段构成：

| 阶段 | 用时 |
| --- | --- |
| 进程启动 + 源闭包哈希（check-warm 也付） | ≈ 32 ms |
| `sessionLoad` + blob 读/framing 校验/**解码** | 6.6 ms |
| 写产物文件（内容未变不重写） | 3.3 ms |
| **`canonicalTopo` + `splitGraph`** | **≈ 254 ms** |
| `copyFfiFiles` + `build.sh` 生成 | 2 ms |

`canonicalTopo` 有三处 O(n²) 叠加：迭代松弛每轮线性扫 memo 表、插入排序每次比较重算
SHA-256 的 tie key、排序结果按名线性找文件。两条路径都已不付这笔：

1. **载荷写侧规范化**：split 载荷 codec 是 `split-files 2`，内容直接是规范拓扑序；
   命中路径按载荷顺序写产物，不再重算 `canonicalTopo`（codec 不符的旧载荷 miss 一次并重写）。
2. **`canonicalTopo` 去 O(n²)**：HashMap memo 的迭代松弛（缺失键按 0）、graph 单元 +
   全部依赖去重后每个名字只算一次 tie key、文件名 `HashMap` 索引。未命中（冷）路径的
   这一步同样只做一次且近线性（冷路径总时长由 codegen 主导）；命中（热）路径为 0。

同机 A/B（同一源码、同一份 blob，冷/热产物 `diff -r` 逐字节一致）：低负载窗口 build-warm
**308 → 45 ms**；高负载窗口（宿主 load ≈50）同窗口交替 **546–567 → 79–83 ms**（均
`--runs 5` 中位数）。两个窗口的比值都约 6.8×，收益与负载无关。
载荷解码只需 ~6.6 ms（4.4 MB blob）⇒「per-file 内容寻址 blob + 小 manifest」不是当前瓶颈。

`fmt-check`（1139）高于基线 546，来自源码规模增长与仓内路径差异（同一棵树、两个二进制的
A/B 读数一致）。`map-cold`（2111）必须清 query store 才算冷：基线里的 1502 只删索引缓存
目录，迁到查询图后已是空操作，测到的是热路径；冷路径的成本是 `Index.Codec` 编码 + SHA-256
内容地址。

**CI 门槛**：`bench/compiler.sh --check` 硬失败阈值；`vuna-compiler-growth`
（合成 500/1000/2000/4000 单文件，每翻倍 ≤2.5×；**脚本上限只到 4000，8000 档实测 3.03×
未被覆盖**）；`vuna-compiler-growth-incremental`（合成可执行包 1000/2000/4000/8000，
**增量路径**，每翻倍 ≤3.3×）；`vuna-compiler-perf` 含包内增量语义断言（clean≥10、parse≤20）
与 REPL 默认走接口路径的断言。

**已量化否决的候选**（数据见 git 与 `_scratch` 探针，不要重复开题）：

- **iface 哈希去排序（顺序无关折叠）**：把 `hashDefs`/`hashExports`/… 的「按名字插入
  排序 + 整表编码 + 摘要」改成逐项哈希的交换律折叠（双 lane Σh/Σh²）。
  （摘要用 SHA-256、载荷用 `Base.Bytes` 显式编码，「排序 + 整表编码」的结构不变，
  结论照此条记录。）
  合成单模块 16k 项档 iface-compute 3.77 s → ~1.0 s，但真实包是「多模块、每模块几十项」：
  逐项哈希的分配放大让 `check packages/compiler` 的 iface-compute 119 → 318 ms（逐项强哈希）
  或冷 build 的 iface 段 90 → 518 ms（逐项单 lane），冷 build 反而 +4%。故保留插入排序
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
