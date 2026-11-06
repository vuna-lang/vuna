# 性能工程（vuna 命令耗时）

本文覆盖：**怎么量**（探针设施与测量规程）、**当前读数**、**热点在哪**。规模不变量与安全
边界见 [type-system.md](type-system.md)（fuel / measure 站点）与 [primitives.md](primitives.md)
（原语与运行时语义），测试 / CI 口径见 [testing.md](testing.md)，方法论规程见技能
`.agents/skills/perf-debug/SKILL.md`。

## 1. 现状读数

`nix build .#vuna` 产物，16 核开发机，单次冷启动、机器空闲口径（同一时刻只跑一个测量
进程；`vuna build` 读数**包含** `build.sh` 按直接依赖分层的层内并行，`check` / `compile`
读数不含编译并行——workspace check 的成员并行见下文；读数随机器与版本变化）。M34.6
（2026-11）收尾后的典型值：

| 命令 | 当前 |
| --- | --- |
| `check base` | ~0.12 s |
| `check compiler` | ~2.2 s |
| `check .` | ~3.3 s（workspace 检查所有成员） |
| `build --no-compile`（workspace） | ~5.4 s |
| `build .`（含链接；单元缓存默认开） | ~6.6 s |
| `fmt --check`（全仓） | ~0.55 s |
| `map`（热缓存命中） | ~0.5 s |
| `map` 冷启动全量重建 | ~0.7–0.9 s（索引缓存失效后整仓重扫；C34 的 O(n²) 已修） |
| `lint` / `doc` / `api` / `gen-errors` | 均 <1 s |
| LSP 单次编辑（会话热，重文件） | ~0.12 s（compiler 最大文件）/ ~0.02 s（根包普通文件） |
| LSP 首次请求（建会话 + 首轮增量） | ~1.1–1.5 s |
| REPL 重 import（4 次求值） | ~4.2 s |

M34.6 之前的同一套命令在 HEAD `e640010` 上是 `check compiler` ~12 s、`check .` ~23.6 s、
`build --no-compile` workspace ~36.7 s、LSP 单次编辑 3–8 s；差异主要来自清理遗留诊断探针、
终止性/检查链表化、iface 影子写与 codegen 串行侧的 O(n²)、以及工具链单文件增量与会话缓存
（见 §9）。读数须与 [`bench/compiler-baseline.txt`](../../bench/compiler-baseline.txt) 的
同机口径比较；跨机器只比 §5 的增长率。

容器改造（私有 `HashTbl` → `Base.HashMap`，元变量解表 → `Base.IntMap`）的实测对比：
同一 worktree、同一份源码、独立进程各 3 次取中位数（本机绝对值与上表历史读数不可直接
比较；改造前 = 编译器内部哈希表 + 解表 String 键，改造后 = 标准库容器 + Int 键索引）：

| 命令 | 改造前 | 改造后 | 变化 |
| --- | --- | --- | --- |
| `check compiler` | ~4.87 s | ~4.18 s | -14% |
| `check .` | ~13.4 s | ~11.3 s | -15% |

除 `map` 冷启动全量重建（C34 已修）外，所有命令都在 10 s 以内；增长率见 §5。构建口径必须
一致：同一份源码在逐模块 split 产物下测量；`compile` / `build` / seed 只有这一种产物，不再有
单文件 `main.ml` 口径。

## 2. 探针设施：`Vuna.Compiler.Debug`

开关是 CLI 参数（`Vuna.Cli.runCli` 会剥掉它再分发，任何子命令后都能加）：

```console
vuna check compiler --debug-perf
```

打开后 stderr/stdout 上出现两类行：

- `PERF <label> <epoch-us>`：微秒时间戳（`timeUs`，无 fork）。**相邻两行相减 = 阶段耗时**；
- `DEBUG <text>`：任意诊断文本（表规模、计数等）。

设施（`compiler/lib/Vuna/Compiler/Debug.vuna`）：

| 函数 | 语义 | 何时用 |
| --- | --- | --- |
| `stamp label` | 打一个微秒时间戳 | 阶段边界（十几处，代价可忽略） |
| `stampSample key label` | 仅当 `sampleKey key`（1/64，确定性哈希）命中 | 逐定义 / 逐条目：采样后仍能看出「成本随规模 / 位置增长」的趋势 |
| `note` / `noteInt` | 打 `DEBUG` 文本 | 表规模、元变量数、字典目标数 |

**关键纪律**：`note` 的字符串参数是**严格求值**的，`note ("x=" ++ showTerm t)` 在 debug
关闭时也会先算（`showTerm` 可能极贵，甚至扫全表）——诊断构造必须写成
`if debugOn then note (...) else 0`。`stamp` 自身已判 `debugOn`。逐条目打点用 `stampSample`
避免打点成为主成本；单次 <50 µs 的条目用差值不可靠，判断趋势请用「同形规模的合成探针」
对比总时间。关闭开关时：`stamp` 只判一次全局 Bool，`stampSample` 多一次字符串哈希。

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

`check compiler` ~2.2 s 的构成（`--debug-perf`，典型量级）：

1. **`elabFunDef`（逐定义精化）仍是最大单项**：~0.9 s/3000 def，集中在 `conv`/`force`/
   `infer` 的项重算与分配（`Term/Impl`、`Core/Eval|Conv`）。M34.6 已删除每 def 的
   `defVals` 记忆化（安全前置检查比命中收益更贵，A/B -2~3%）；更深的共享需要参数相关
   记忆化，未做。
2. **load/parse 前缀 ~0.5 s**（冷 TMPDIR 含 AST cache 写 ~0.35 s；`astStrongHash` 已改单次
   遍历）。解析本身是真实工作量。
3. **codegen 自检 ~0.3 s**（`check` 总是跑擦除/名字/构造子护栏）；`groupRuntimeDefs` 已
   表化，`dtDefLocTable` 的右嵌套 `++` 已改 `strConcatMany`（O(n²)→线性，build 侧 -0.34 s）。
4. **iface 影子写 ~0.22 s**：`ifaceOfPackage` 已单遍按 owner 分桶、排序键只算一次、
   coverage 用 `HashMap`；剩余是逐模块 `cachedOfProgram` zonk（整包 sols 只建一次）与写盘
   ~45 ms。
5. **`genGroups` ~0.17 s**：OCaml 文本生成，没有一眼可去的 O(n²)；codegen 并行的
   **逐单元可并部分只有 ~7–8%**，fork+序列化 DtProgram 的净收益 ~6–7%（已用 spike 量化，
   不做；`build.sh` 的层内并行已覆盖链接侧）。
6. **分配**：冷 `check compiler` minor_words ≈1.1e9、根包子进程 ≈1.55e9（M34.6 起点分别是
   4.6e9 / 10e9）；elab 占分配 ~92%，活数据仅 ~2.5MB，瓶颈是 `quote`/`zonk`/`applySpine`
   的瞬时 churn，不是表示重复。hash-consing 需要全局 intern 表、改变 Marshal 布局、与
   纯精化/元变量/摘要三处不变量冲突，spike 结论：收益 2–4%，不做。
7. 已关闭的历史热点（不要重复排查）：`Elab.Usage` 全程序扫描（实测 10–13 ms，无门槛）、
   实例体/方法子句查找（13.5 ms）、`refsOfDef`（12–16 ms）、签名 banned 集、ctor/解表
   索引、`unsolvedFrom` 全解表扫描。

## 5. 增长率（合成包）

同一形状定义（`fi : Int` / `fi = i`，包上下文只依赖 `vuna-base`）随定义数 n 的墙钟
（M34.6 收尾，`nix/checks/compiler-growth.sh` 口径：每档独立进程 + 独立空 TMPDIR，2 次取小）：

| n | 现在 | 现在 / 翻倍 |
| --- | --- | --- |
| 500 | 74 ms | — |
| 1000 | 100 ms | 1.35× |
| 2000 | 140 ms | 1.40× |
| 4000 | 233 ms | 1.66× |

M34.6 起点（HEAD `e640010`）同一探针为 23/49/118/346/1032 ms（每翻倍 2.13/2.41/2.93/2.98×，
后面 8000 档仍超线性）；收益来自终止性 facts O(n²) 修复、`checkAllDefined` 表化、defVals
移除与 owner/codegen 串行侧表化。`vuna-compiler-growth` 门槛按每翻倍 ≤2.3× 卡回归。

## 6. `check base` 的阶段构成

一次采样的量级（M34.6 收尾，具体 ms 随版本 / 机器变化，用于定位优先序）：

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
   类型与 ST/region（见 [qtt.md](qtt.md) / [effects.md](effects.md) 与 debt D22）。
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

`sh bench/compiler.sh`（仓库根；`--runs N` / `--check` / `--save-baseline` / `--alloc`）测
编译器 / 工具链自身墙钟。基线 `bench/compiler-baseline.txt`（机器相关，只做同机回归对比）；
`--check` 超过 `--threshold`%（默认 20）打 WARN、超过 `--fail-threshold`%（默认 50）exit 1。
跨机器/跨输入规模的可比口径是 `nix/checks/compiler-growth.sh` 的增长率门槛（§5）。

M34.6 收尾（本机 16 核，`--runs 3` 中位数）：

| benchmark | 当前 ms |
| --- | --- |
| check-all | 3305 |
| check-compiler | 2229 |
| check-warm | 36 |
| build-all | 5455 |
| build-compiler | 2387 |
| build-warm | 32 |
| map-cold | 691 |
| map-hot | 510 |
| fmt-check | 546 |

**M34 起点（HEAD `e640010`）→ 收尾**（同机、同口径）：

| benchmark | 起点 | 收尾 |
| --- | --- | --- |
| check-all | ~23.6 s | ~3.3 s |
| check-compiler | ~12.0 s | ~2.2 s |
| check base | ~1.0 s | ~0.12 s |
| build-all（--no-compile） | ~36.7 s | ~5.5 s |
| build-compiler（--no-compile） | ~11.6 s | ~2.4 s |
| LSP 单次编辑（compiler 最大文件） | ~3.1 s | ~0.12 s |
| LSP 单次编辑（根包普通文件） | ~2.0 s | ~0.02 s |
| REPL 重 import（4 次求值） | ~6.1 s | ~4.2 s |

M34.6 的改动（按波次；历史细节在 git）：

1. **清理 M34.5 遗留的急切诊断探针**：`Core/Conv.mismatchAt` 恢复为只渲染两侧 Value；
   每次比较失败不再对全部 defs 做 `showTerm` 扫描，也不再在 debug 关闭时构造诊断字符串。
   `check compiler` 冷 12 s→4.4 s、`check base` 1.0 s→0.14 s，分配同步下降。
2. **工具链惰性接口闭包正确性 + 默认开启**：闭包并入同包模块的 import；`Dt` 安全阀在缺
   artifact 时整条回退全量；修 REPL 接口路径的依赖 datas/defs 与同包模块 decls。
   `VUNA_IFACE_TOOL` 默认开（`=0` 关闭）。
3. **LSP 单文件增量精化 + 会话缓存**：依赖 iface + 干净同包模块预置，只精化当前 buffer；
   termAux/起始 Ec/shift 产物按 iface 哈希复用；LSP 会话按「编译器指纹 + 包名 + 闭包
   stat」失效（安全窗内容哈希兜底）；写回当前模块 iface。§44l 守住 iface/全量诊断逐字节
   一致、外部改依赖后失效、REPL 复用。
4. **冷路径 O(n²)**：终止性 `computePosFacts` 的标记去重/名字集合表化（单轮 563→26 ms）；
   `checkAllDefined` 预建哈希表；删除 per-def `defVals` 记忆化（A/B -2~3%）；`ifaceOfPackage`
   单遍按 owner 分桶 + 排序键缓存 + coverage 表化（iface 阶段 1.44 s→0.22 s）；
   `dtDefLocTable` 右嵌套 `++` 改 `strConcatMany`（-0.34 s）；owner 归属表化
   （build 侧 -0.29 s）；codegen `groupOf` 每名重建表改一次建。
5. **缓存默认与硬化**：单元缓存默认开 + 同 entry 桶内 GC（增量 build -10.4%，链接 build
   -6.0%）；split/check/ast/unit 载荷统一 framing（magic|tag|len|校验和）+ 读侧损坏回退
   （C32 最小硬化；ast schema 6→7）；`ifaceOfPackage` 整包 sols 只建一次；mtime 快路径
   保留 opt-in（`VUNA_CACHE_MTIME=1`，同秒同大小编辑必失效；默认路径实测 <5% 收益）。
6. **CI 门槛**：`bench/compiler.sh --check` 硬失败阈值；新增 `vuna-compiler-growth`
   （合成 500/1000/2000/4000，每翻倍 ≤2.3×）；`vuna-compiler-perf` 增加包内增量语义断言
   （clean≥10、parse≤20）与 REPL 默认走接口路径的断言。

**分配（M34.6 收尾，`bench/compiler.sh --alloc`）**：冷 `check .` 主进程 minor_words ≈
4.2e7、vuna-compiler 子进程 ≈1.09e9、根包子进程 ≈1.55e9；M34.6 起点分别为 5.4e8 / 4.6e9 /
9.99e9。elab 仍占分配 ~92%，瓶颈是 `quote`/`zonk`/`applySpine` 的瞬时 churn（活数据仅
~2.5 MB），不是表示重复。

**已量化否决的候选**（数据见 git 与 `_scratch` 探针，不要重复开题）：

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
