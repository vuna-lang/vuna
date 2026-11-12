# 性能工程（vuna 命令耗时）

本文覆盖：**怎么量**（探针设施与测量规程）、**当前读数**、**热点在哪**。规模不变量与安全
边界见 [type-system.md](type-system.md)（fuel / measure 站点）与 [primitives.md](primitives.md)
（原语与运行时语义），测试 / CI 口径见 [testing.md](testing.md)，方法论规程见技能
`.agents/skills/perf-debug/SKILL.md`。

## 1. 现状读数

`nix build .#vuna` 产物，16 核开发机，单次冷启动、机器空闲口径（同一时刻只跑一个测量
进程；`vuna build` 读数**包含** `build.sh` 按直接依赖分层的层内并行，`check` / `compile`
读数不含编译并行——workspace check 的成员并行见下文；读数随机器与版本变化）。典型值
（2026-11）：

| 命令 | 当前 |
| --- | --- |
| `check base` | ~0.1 s |
| `check compiler` | ~0.79 s |
| `check .` | ~1.43 s（workspace 检查所有成员） |
| `build --no-compile`（workspace） | ~5.2 s |
| `build .`（含链接；单元缓存默认开） | ~7 s（其中 ocamlopt/链接 ~28 s CPU，16 路并行） |
| `fmt --check`（全仓） | ~0.80 s |
| `map`（热缓存命中） | ~0.75 s |
| `map` 冷启动全量重建 | ~1.07 s（索引缓存失效后整仓重扫；C34 的 O(n²) 已修） |
| `lint` / `doc` / `api` / `gen-errors` | 均 <1 s |
| LSP 单次编辑（会话热，重文件） | ~0.12 s（compiler 最大文件）/ ~0.02 s（根包普通文件） |
| LSP 首次请求（建会话 + 首轮增量） | ~1.1–1.5 s |
| REPL 重 import（4 次求值） | ~4.2 s |

更早的读数在 git 历史；当前读数须与
[`bench/compiler-baseline.txt`](../../bench/compiler-baseline.txt) 的
同机口径比较；跨机器只比 §5 的增长率。

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

## 2. 探针设施：内置宏 `perfNote!` / `perfStamp!` / `perfSample!`

开关是 CLI 参数（`Vuna.Cli.runCli` 会剥掉它再分发，任何子命令后都能加）：

```console
vuna check compiler --debug-perf
```

打开后 stdout 上出现两类行：

- `PERF <label> <epoch-us>`：微秒时间戳（`effTimeUs`，无 fork）。**相邻两行相减 = 阶段耗时**；
- `DEBUG <text>`：任意诊断文本（表规模、计数等）。

调用点只写**内置宏**（展开规则见 [language.md](language.md) 的「内置宏」；运行时后端在
`compiler/lib/Vuna/Compiler/Debug.vuna`）：

| 宏 | 语义 | 何时用 |
| --- | --- | --- |
| `perfStamp! label` | 打一个微秒时间戳 | 阶段边界（十几处，代价可忽略） |
| `perfSample! key label` | 仅当 1/64 确定性采样命中该 key | 逐定义 / 逐条目：采样后仍能看出「成本随规模 / 位置增长」的趋势 |
| `perfNote! text` | 打 `DEBUG` 文本 | 表规模、元变量数、字典目标数 |

**关键纪律（宏已承担）**：守卫在展开里，`perfNote! ("x=" ++ showTerm t)` 在关闭时
**不会**先算字符串（旧的严格求值 `note` + 手写 `if debugOn then ... else 0` 纪律已删除）。
探针返回 `Unit`，不再用 `0` 哨兵；开关是共享 CAF（`Debug.perfEnabled` /
`Debug.releaseBuild`），关闭时每个探针只判一次 Bool，`perfSample!` 连采样哈希都不算。
后端 `debugLine` / `perfMark` / `sampled` 是**无守卫原语**，只供宏展开引用，不要直接调用。
逐条目打点用 `perfSample!` 避免打点成为主成本；单次 <50 µs 的条目用差值不可靠，判断趋势
请用「同形规模的合成探针」对比总时间。另注意**冷 build 的 DEBUG 输出量**：全量精化会逐条
打印 conv 诊断（约 15 万行），实测让冷 build 墙钟膨胀 ~60%——阶段比例可用，绝对读数必须用
无 `--debug-perf` 口径（§7）。

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

`check compiler` ~0.79 s 的构成（`--debug-perf`，典型量级）：**iface 影子写是当前最大
单项**（compute ~300 ms + write ~16 ms ≈ 40%），其余是 load/parse 前缀；收尾段已从
872 ms 降到 2.4 ms（§1）。

1. **iface 影子写 ~0.32 s**：`ownSourceInfos`（逐源文件内容哈希）+ `ifaceOfPackage`
   （逐模块 `cachedOfProgram` zonk 与 7 张表的规范化哈希）。写回侧已合并为单次读取
   （§1 第 3 条）。接口哈希的「排序规范化」仍是插入排序 O(d²)，单模块数千项时会退化
   （见 §9「已量化否决」）。
2. **load/parse 前缀 ~0.5–1.1 s**（冷 TMPDIR 含 AST cache 写；`check compiler` 的闭包
   要解析 65 个模块）。解析本身是真实工作量。
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

同一形状定义（`fi : Int` / `fi = i`，包上下文只依赖 `vuna-base`）随定义数 n 的墙钟
（`nix/checks/compiler-growth.sh` 口径：每档独立进程 + 独立空 TMPDIR，2 次取小）：

| n | 现在 | 现在 / 翻倍 |
| --- | --- | --- |
| 500 | 109 ms | — |
| 1000 | 114 ms | 1.45× |
| 2000 | 133 ms | 1.17× |
| 4000 | 167 ms | 1.26× |

`vuna-compiler-growth` 门槛按每翻倍 ≤2.3× 卡回归。

### 5.2 包路径增量 `check`（增量收尾路径）

合成「可执行包」（`lib/Mod.vuna` N 个同形 def + `app/Main.vuna`），每档先冷跑一次建接口，
再以独立进程、独立空 TMPDIR 计时第二次（走 `dtFinishPackageScoped` 增量收尾）：

| n | 现在 | 现在 / 翻倍 | 修前（同探针） |
| --- | --- | --- | --- |
| 1000 | 150 ms | — | 264 ms |
| 2000 | 164 ms | 1.09× | 557 ms（2.11×） |
| 4000 | 231 ms | 1.41× | 1596 ms（2.87×） |
| 8000 | 415 ms | 1.80× | — |

修前 N=4000 档就超过 `vuna-compiler-growth-incremental` 的每翻倍 ≤2.6× 门槛（该门槛
故意比单文件 2.3× 宽：增量路径有与 N 无关的固定成本，小 N 噪声更大）。

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
- 只有包上下文一条加载路径；单文件夹具也按最近 manifest 解析，不存在「单文件 vs 包」两套
  读数。
- **机器可能被其他负载占用**（loadavg 波动时 wall 不可比）：A/B 在同一时间窗交替跑，记录
  `time` 的 user+sys（单进程口径不受其他负载影响）；wall 只在机器空闲时引用。
- **包级增量路径要先把依赖包接口落盘**（`vuna check <dep>`，见 `compiler-growth-pkg.sh`）：
  否则探针每档都因「依赖接口缺失」走全量路径，测的就不是增量收尾。
- `--debug-perf` 在**冷 build** 上会逐条打印 conv 诊断（约 15 万行；`perfNote!` 的实参在
  开关打开时才求值），实测让冷 build 墙钟膨胀 ~60%：定位用阶段**比例**，绝对读数
  一律用无 debug 口径；单次 <50 µs 的条目仍需「同形规模合成探针」对比总时间。
- 用 `OCAMLRUNPARAM=s=...` 快速判断 GC 敏感性（注意：产物里 `Gc.set` 会覆盖环境变量，要
  比较不同 minor heap 大小得改代码重建）。
- 阶段定位优先用 `perfStamp!`；per-def / 热路径趋势用 `perfSample!`；不要用「等大 case 跑完」
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

当前读数（本机 16 核，`--runs 3` 中位数；2026-11 再次标定，基线已更新）：

| benchmark | 当前 ms |
| --- | --- |
| check-all | 1314 |
| check-compiler | 1205 |
| check-warm | 53 |
| build-all | 8717 |
| build-compiler | 3469 |
| build-warm | 255 |
| map-cold | 1502 |
| map-hot | 878 |
| fmt-check | 1139 |

**2026-11 标定的成本来源（C32 的显性代价，不是查询图引入的）**：冷路径
（check-compiler / build-compiler / build-all）与热路径（build-warm）都比旧基线慢，原因是
缓存载荷从 OCaml Marshal 换成了**显式规范编码 + `Store` framing（含 SHA-256 内容地址）**：

- 冷路径要为每个模块编码 payload 并算摘要（此前 Marshal 是 `Obj.magic` 级拷贝）；
- `build-warm` 的 255 ms 主要是把 MB 级 split 载荷**解码**回 `List SplitFile`
  （41 ms 旧基线时 Marshal 解码几乎免费），文件本身因内容未变不重写。

这是 C32「自描述、跨编译器版本稳定、可校验完整性」的显性代价，用
`nix/checks/compiler-perf.sh` 的绝对门槛（warm check ≤43 ms、warm check . ≤78 ms 等）
兜住真正影响交互的部分；大载荷热路径的优化方向是「per-file 内容寻址 blob + 小 manifest」
（命中时直接 copy 字节、不做整体解码），记为后续项（见 [query-graph.md](query-graph.md) §6）。

`map-cold` / `fmt-check` 相对旧基线（691 / 546）的上涨来自 HEAD 源码增长与仓内路径差异，
与 2026-11 的修复无关（同一棵树、base/final 两个二进制的 A/B 读数一致），本轮未处理。

**CI 门槛**：`bench/compiler.sh --check` 硬失败阈值；`vuna-compiler-growth`
（合成 500/1000/2000/4000 单文件，每翻倍 ≤2.3×）；`vuna-compiler-growth-incremental`
（合成可执行包 1000/2000/4000/8000，**增量路径**，每翻倍 ≤2.6×）；`vuna-compiler-perf`
含包内增量语义断言（clean≥10、parse≤20）与 REPL 默认走接口路径的断言。

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
