# 性能热点（查找表与仍存在的开销）

本页是 [performance.md](performance.md) 的另一半：那里讲**怎么量**（探针设施、测量规程）、
**当前读数**与**增长率 / 阶段构成**，这里讲**开销落在哪**——容器与索引的形状（§1），以及冷
`check` / `build` 各阶段仍然存在的开销与处置（§2）。口径、机器条件与冷 / 热分档同
[performance.md](performance.md) §1。

## 1. 查找表：泛型 `Base.Container.HashMap k v`

容器在标准库（`packages/base/lib/Base/HashMap.vuna`）：键与值都泛型的 1024 桶（两层 32 叉）持久哈希表、桶内前插、同键新值优先。键需 `Eq` + `Hashable`：String 走 `strHash`，Int 走恒等哈希 + 归一化，元变量编号这类稠密小整数几乎不冲突。String/Int 共用这一个 `HashMap k v`，编译器没有私有 `HashTbl`、也没有 `IntMap`。

```text
HashMap.fromList / insert / insertAll / lookup / member / toList / size / ofNames
```

单次查找 ≈ 32 步列表遍历 + 桶内 1–2 次比较；泛型容器的键比较与哈希经 `Eq` / `Hashable` 字典（具体 String/Int 类型下是静态派发）。`Base.Container.Map` **不是**可用的替代：它是关联列表（assoc list），换过去复杂度不变。

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

## 2. 仍然存在的热点

冷 `check packages/compiler` ~10 s（修后）的阶段构成（`VUNA_LOG=debug` 时间戳相减，单次采样）：
load/parse 前缀 + iface 摘要 **~2.6 s** → 逐定义精化（`collectSigs-done` → `bodies-done`）
**~4.6 s** → 实例体/终止性 **~0.4 s** → codegen 检查 + iface 影子写 **~3.2 s**
（其中 compute 1.09 s + write 0.48 s，单遍 `iface-write=118/118`）。

1. **iface 影子写（缓存开启的增量构建）**：`ownSourceInfos`（逐源文件内容哈希，闭包扫描已
   给出）+ `ifaceOfPackage`（逐模块 `cachedOfProgram` zonk 与 7 张表的规范化哈希）+ 写回。
   同包干净模块（`cmAddr` 上已有接口）现在记录原样复用、只编码脏模块：单模块增量
   `compute` 410 → 53 ms、`write` 366 → 26 ms（68 个模块里 67 个干净）。自举 / CI 的每级
   一次性对象库里接口写完之后不会再被读，`VUNA_IFACE_WRITE=0` 直接跳过：冷
   `build --no-compile packages/compiler` user 4.49–4.54 s → 3.70–3.74 s。接口哈希的
   「排序规范化」已改为混合归并（O(d log d)），单模块数千项时不再二次退化
   （[performance.md](performance.md) §5.2 的 8000 档 3116 → 1067 ms）。
2. **load/parse 前缀 ~4.0 s（冷 store，含 iface 摘要读取）**：`check packages/compiler` 的闭包要
   解析 181 个模块；冷 TMPDIR 还含 lex 载荷写。前端本身（lex + 语法分析）在 `VUNA_OBS=1`
   下可单独归因：冷 `check packages/compiler` = `vuna.parse.lex` 335 次 / **212 ms** +
   `vuna.parse.syntax` 335 次 / **105 ms**（≈0.32 s，见 [performance.md](performance.md) §6.1）。剩下的前缀耗时在 iface
   摘要、地址计算与 flatten，不在词法/语法。
3. **冷 build 的 elab bodies**：`build --package vuna .` 的 6159 def 约 3.1 s
   （`VUNA_LOG=debug` 口径），集中在 `conv`/`force`/`infer` 的项重算与分配
   （`Term/Impl`、`Core/Eval|Conv`）。每 def 的定义值记忆化已否决（安全前置检查比命中收益
   更贵，A/B -2~3%）；更深的共享需要参数相关记忆化，未做。
4. **冷 build 的 load/parse ~2.6 s + codegen split ~0.6 s**（`VUNA_LOG=debug` 单次采样）：
   `cg-splitmeta` 61 ms、位置表 23 ms、逐单元 lowering ~0.5 s、`validateUnit` ~70 ms、
   类型声明 2 ms、正文文本 ~0.17 s，余下是程序级擦除 / 归属检查与首单元。逐单元的定义与
   数据来自**归属桶**（一次 `O(def)` 分桶），不在每个单元重扫全程序；类型渲染与注解的
   数据族判定走 `LwEnv.lwDataTbl`（按名 O(1)），不再对全部运行时族线性扫（采样为
   ~52 万次判定：`renderTyGlobal` 37 万、`annotHeadTy` 5.6 万、`annotCalleeTy` 4.6 万、
   `annotGlobalTy` 2 万、字段渲染 2.1 万；lowering 588 → 514 ms）。单元缓存的 key
   （模块身份 + import 链 + `pr`）只在缓存启用时计算——自举 / CI 的一次性对象库里它
   不可能命中，构建脚本直接 `VUNA_UNIT_CACHE=0`。模块身份直接用闭包扫描的接口地址
   `cmAddr`（包环境 + 源摘要 + 直接依赖源摘要），不再逐模块编码整棵声明 AST。
   同机 A/B（空 store、同窗口交替，取最小，基线 = 本轮改动前的主干二进制）：
   冷 `build --no-compile packages/compiler` user **4.49–4.54 s → 3.70–3.74 s**（含
   `VUNA_IFACE_WRITE=0`）；缓存开启的单模块增量构建 user **4.27–4.36 s → 3.88–3.93 s**
   （接口 compute/write 见第 1 条）。`groupRuntimeDefs` 已表化，`dtDefLocTable` 的右嵌套
   `++` 已改 `strConcatMany`。
5. **终止性 ~0.3 s（冷 build）**：`anyOwn` 的 O(n²) 已修；剩余是逐组 measure/SCT 与
   usage/callGraph 的真实工作。冷 `check packages/compiler` 的 `VUNA_OBS=1` 读数：
   `vuna.term`（两处调用）共 ~0.92 s，其中 `vuna.term.sct` 52 次共 ~15 ms、单次最大
   1.6 ms；SCT 规模上界：SCC ≤ 8 个函数、站点 ≤ 37、初始图 ≤ 19、闭包后图 ≤ 196/对、
   闭包轮数 ≤ 3。512 图 / 240 轮的上限离触发很远，表结构重写的上限收益 ~15 ms，不做；
   这条线的收益在判据精度（别名 / HOF / 投影），不在吞吐。
6. **`genGroups`**：OCaml 文本生成，没有一眼可去的 O(n²)；codegen 并行的**逐单元可并
   部分只有 ~7–8%**，fork+序列化 DtProgram 的净收益 ~6–7%（不划算，不做；
   `build.sh` 的层内并行已覆盖链接侧）。
7. **分配（累计量，不是内存占用）**：冷 `check packages/compiler` 单进程 `minor_words`
   **1.17e9 words（×8 B ≈ 9.3 GB 累计分配）**、`major_words`（晋升）74M words（590 MB）、
   `top_heap_words`（堆高水位）37M words（294 MB）、maxRSS 437 MB；同一次 check 精化
   7157 个定义 ⇒ **每定义 163k words ≈ 1.3 MB**（其中 `vuna.def.elab` span 自身均值
   325 KB / 中位 189 KB），分配速率 ~160M words/s（≈1.3 GB/s）。
   **阶段份额**（同一份冷跑，互不重叠的四段）：精化 `vuna.elab` 3.5 GB（37%）、
   codegen 检查 1.15 GB（12%）、`vuna.parse.lex` 0.89 GB（9%）、`vuna.parse.syntax`
   0.43 GB（4.6%）；余下 ~37% 落在没有 span 的 load/resolve/iface 编码落盘上。精化内部
   最大单项是 `vuna.elab.term.body`（逐表达式正文检查）1.5 GB——term 重写（`conv`/
   `force`/`quote`/`applySpine`）是分配的大头之一，但**不是九成**；分配份额 ≠ 墙钟份额
   （词法分配多但快，term 重写在判等逻辑本身）。
   计数（level 3、冷 `check packages/compiler`）：`eval` 1.59e6、`conv` 1.8e5（失配 3.2e4，
   18%）、`meta.zonk` 7.5e3、**delta 展开 1.4e4（≈`eval` 的 1%）**。⇒ 按定义缓存 delta
   求值的上限就是这 1%，与既有 A/B 的 −2~3% 一致。
   **三个 1.x e9 不同口径**：本节 1.1–1.2e9 是单包单进程；第 11 条的 1.63e9 是 `check .`
   全树；cli 成员的 1.55e9 是子进程合计。复现：
   `VN_PERF_STATS=1 VUNA_STORE=$(mktemp -d) ./result/bin/vuna check packages/compiler`
   （结束在 stderr 打 `VN_PERF minor_words=… major_words=… minor_collections=… top_heap_words=…
   allocated_words=…`）。**分辨率**：`minor_words` 只在 minor GC 边界推进，分辨率为
   minor heap（16M words ≈ 整跑的 1.4%），小于它的改动在这行上看不出来；跨轮比较小改动
   用同一行的 `allocated_words`（`Gc.allocated_bytes ()`，精确到 words）。
   hash-consing 需要全局 intern 表、改变 Marshal 布局、与纯精化/元变量/摘要三处不变量
   冲突；预计收益 2–4%，不做。
   注：span 的 `args.allocWords` 是 `Gc.allocated_bytes ()` 的差值（精确到 words）；
   不要用 `minor_words + major_words` 求差——`minor_words` 只在 minor GC 边界推进，
   minor heap 16M words 下会量化到 134 MB/格（见 [observability.md](observability.md)）。
8. 已修热点（不要重复排查，读数见 [performance.md](performance.md) §1）：**`Dt.dedup*` 的 O(n²)、`Termination.anyOwn` 的
   O(n²)、写接口的包接口双读、build 的重复闭包扫描**；`Elab.Usage` 全程序扫描（实测
   10–13 ms）、实例体/方法子句查找（13.5 ms）、`refsOfDef`（12–16 ms）、签名 banned 集、
   ctor/解表索引、`unsolvedFrom` 全解表扫描、iface/impl 双摘要共享子哈希
   （`defs` / `decls` 不再各编码一遍：冷 `check packages/compiler` 分配
   **1.187e9 → 1.131e9 words（−4.7%）**、CPU **4.76 s → 4.52 s（−5.2%）**）。

   build 的重复闭包扫描：view 地址、快 key 与重建三处各自跑一遍 `ifaceModsEff`（整包源扫描 +
   逐模块头解析 + 地址分配）与依赖接口读，冷 `build --no-compile compiler` 因此扫两遍。
   `Driver.Compile.SplitInputs`（`splitInputsOf`）把闭包 / 依赖接口 / 输入摘要一次算好，
   由 `compileToDirGiven` / `buildViewAddrOf` 复用。同机同窗口 A/B 对 main：热
   `build --no-compile compiler` **0.424–0.429 → 0.290–0.310 s**、冷
   `build --no-compile compiler` 5.7–6.0 s → 5.6–5.8 s（噪声内）、产物树 `diff -r`
   逐字节一致；`check` 路径不变（本来就只扫一遍）。

   模块头缓存：闭包扫描原先对每个模块 `lex + parse` 一遍，只为拿 import 边算接口地址
   （整包 183 个模块约 125 ms）。import 名单是源字节的纯函数，现在按源内容地址落在
   `objects/module-header`（`Loader.Header`，键与编译器身份无关），命中只读一个小对象：
   闭包扫描 **125 ms → 34 ms**、`build` up-to-date **0.42–0.44 → 0.34–0.40 s**；
   同一份源码冷 / 热两次构建的产物树 `diff -r` 逐字节一致（命中不改变产物）。

   **`sort_lib` 的 3.9× 不是排序算法**：`Base.Data.Sort.sortBy` 的 20k 排序在同进程
   循环里约 3.9 ms（与手写 OCaml 同量级），bench 的 wall 里主要是分配与 minor heap
   （单次排序分配 ~3.3M words ≈ 27 MB）。`dtRuntime` 曾把 `minor_heap_size` 设成
   16M words = 128 MB，低存活程序把页逐个触进 RSS；改回文档写明的 2M words = 16 MB 后
   同窗口交替：RSS `gc_retain` −69% / `gc_array_churn` −50% / `sort_lib` −30%，
   CPU `gc_retain` −47% / `gc_array_churn` −19% / `sort_lib` −16%。**不要**为此把
   `sortBy` 改成 `MutArray` 双缓冲归并：每次 `get`/`set` 是 Eff 步，分配不比 cons 少，
   同进程测量里不占优。

   口径：接口载荷里的**依赖表值是模块对象地址 `cmAddr`（含编译器标签）**，不是 iface
   哈希——跨编译器比较 payload 会看到依赖项整体变化，那不代表哈希漂移；判定哈希是否变了
   要比 `miIfaceHash` / `miImplHash` 本身，或用 `checks.vuna-iface-selftest`。
9. **导出面落在入口闭包外（已修，同一类的第二个实例）**：`Driver.IrDump` / `Ir.Render` 被列进
   compiler 的 `[export]`，但入口 `app/Main.vuna` 没 import ⇒ `iface-skip partial`（covered=118/120）
   ⇒ 每轮补一遍 lib check、包接口写不出去（依赖方只能回退全量）。冷 `check packages/compiler`
   **19.8 s → 10.8 s（-45%）**、`collectSigs-done` 2 → 1、`iface-write=118/118`；冷 `check .`
   CPU **55.3 s → 39.3 s**（wall 22.8 s → 16.5 s）。处置：两个模块搬进 cli 包
   （`Vuna.Cli.IrDump` / `Vuna.Cli.IrRender`，seed 不变），门禁 `checks.vuna-single-pass`。
   注：`build` 不走这条 lib 补做路径，读数不变（`build . --no-compile` 仍 ~41 s）。
10. **workspace 成员一次全起 ⇒ 依赖包被重复精化（已修）**：`check .` 的成员子进程过去同时
    spawn，`cli` 成员的 `depIfacesOf` 缺兄弟包（`vuna-http` 等）接口 ⇒ `cache-path=full`，
    把 compiler 闭包又精化一遍（`bodies-done defs=10744` = compiler 7157 + cli 3587）。
    改为**按依赖分层**（同层并行、跨层等接口）：同一份源码 `check .` 冷跑 A/B
    （同窗口交替、空 store）**CPU 40.1–42.4 s → 20.1–20.7 s（-51%）**，冷 wall **16.6–17.6 s →
    19.8–20.9 s（+22%）**；4 核（`taskset -c 0-3`）冷 wall **16.8 s → 20.2 s（+20%）**。
    代价是 wall 走依赖关键路径（base → compiler → cli），换来的是不重复精化；同一 store
    的第二遍也因此从 6.1 s 降到 0.23 s（**两段收敛**，见 [performance.md](performance.md) §1）。成员依赖来自
    `Package.packageDependencies`（`checkMembersByLevel`）。
11. **字符串当字符表 + 名字重复解析（已修两轮）**：冷 `check packages/compiler` 用工具链自采样
    （`VUNA_OBS=3 VUNA_OBS_SAMPLE=cpu VUNA_OBS_INTERVAL=2000`，取 `args.stack[1]`）归因，
    当时 5383 个样本里 **string↔`List Int` 20.9% + 容器/List 15.6%**：`strUnpack` 把整串摊成
    cons cell，`splitOnDot`/`lastSeg`/`startsWith` 每次调用各摊一遍；`openModuleNames` 逐层
    `nubNames` 是 O(n²) 叠加（实际 O(n³)）；`resolveModuleName` 同一名字切/拼两遍。
    两轮处置（都不改语义、诊断与编码逐字节不变）：
    - `splitOnDot`/`splitOnChar`/`containsDot`/`lastSeg`/`startsWith`/`endsWith` 改成
      `strAt`/`strSubstring` 的索引扫描，只分配结果；`openModuleNames` 收集完再 `nubNames` 一次；
      `resolveModuleName`/`resolvePathModule` 各自只算一次 `splitOnDot` / `joinDots`；
    - `Base.Bytes` 的 `encTag`/`encInt`/`encStr`/`encList` 不再对每个原子做一次插值拼接，
      改成分片直接 cons 进 difference list（顶层仍是一次 `strConcatMany`）。
    读数（同机、空 store、3 轮、user）：**10.0 s → 7.1 s（-29%）**；冷 `check .` **20.5 s →
    15.1 s（-26%）**；`minor_words` **6.42e9 → 1.63e9（-75%，51 GB → 13 GB）**
    （`check .` 全树口径，含成员子进程；与 §2 第 7 条的单包 1.1e9 不可直接比）。
    本轮的测试面：`compiler` 全章 + `cli/steps_native` 通过（另修了 `depIfacesForToolSourceDetailed`
    缺 `tool-closure` 探针导致的两条既有失败）。
    下一轮剩下的顶部（同一份采样）：`Iface`/`Canonical` 的 `String.concat` 6.3%、`dtp_strHash` 6.2%、
    `exportIndexOfModule`+`resolveModuleName` 7.7%（每次查导出现在都重解析模块名，没有按名字的
    解析缓存）、`Lowering.Ty.renderTyGlobal` 3.0%、`Core.Eval.quote` 2.6%。
    后续那次把编码原子、`joinDots`、`mangle`/`ctorCanonical` 的名字比较都改成零分配形式，
    冷 `check packages/compiler` **7.10 s → 7.02 s（噪声级）**：剩下的 `String.concat` 已经不是
    逐节点拼接，而是**每个哈希输入那一次** `strConcatMany`（整包载荷 ~MB 级），要再降必须把
    `contentAddress`/`sha256` 改成对分片流增量计算（`sha256OfParts`，纯 vuna、摘要不变可对拍），
    名字解析则仍需要一张按名字的表。

### 2.1 elab 内部的结构性开销（当前处置与读数）

精化器本身的耗时集中在 `conv`/`force`/`infer`，但有几处「与规模相乘的结构开销」不在这条
热路径上，单独处置（都不改语义，诊断逐字节不变）：

| 位置 | 原状 | 处置 |
| --- | --- | --- |
| `Sols.defVals` / `Ec.ecDefVals` / `DtProgram.dtProgDefVals` | 字段恒空（无写入点），`force` 每次 delta 展开多付一次 HashMap miss | 删除字段与查表 |
| `Ctx.ctxDepth` | `length ctxItems`，每次变量引用/分支/隐式实参都读 | 绑定点维护 `ctxDepthF` |
| `Elab.Data.elabCtor` | 每个构造子两次从索引表重建 globals 列表 | 每趟算一次 |
| `Elab.Data.checkViaDataDecls` | 每条声明重算去装箱候选集（含环检测） | 每趟算一次 |
| `Ctx` 求值环境 | `evalCtx`/`varTypeValue` 每次用 `ctxEnvAt` 重建整份环境 | 绑定点前插维护（level 绝对编号 ⇒ 已有 binder 的 level 不变） |
| `Impl.vuna` 的 `ctorIdentitySpine` | 无字段构造子（`Nothing` / `Nil`）的等长恒等脊被排除，每个实例先建元变量再整树 conv | `length args <= k`，族参数直接取自期望类型（构造子密集探针 750 → 710 ms） |

读数（16 核、空 store、与「处置前源码」构建的编译器同窗口交替、各 8 次最小）：

| | 冷 `check packages/compiler` 墙钟 | user | 热 `check packages/compiler` |
| --- | --- | --- | --- |
| 处置前 | 14.31 s | 14.03 s | 49 ms |
| 处置后 | 14.24 s | 13.96 s | 49 ms |

**净效果 ≈0.5%，在噪声内**（同窗口抖动 ±0.3 s）。热路径与处置前一致；早期用更旧的
编译器做基线时看到的「热路径 +4 ms」来自 main 自己的提交，不是这些改动。

结论要写清：分配的最大单项是 `vuna.elab.term.body`（1.5 GB / 全跑 16%，见 §2 第 7 条），
`Ctx` 记账、零向量、族名判定这类结构开销只有千分之几，**不值得继续投入**。
试过又撤掉 / 不能去的改动（连同原因）：
- 用量零向量按 depth 共享：`HashMap.insert` 是 copy-on-write（两次 32 元素数组复制），
  比建 5–10 条 cons 贵一个量级，而收益只是省几条 cons，撤（**不是**「查」慢：查是
  hash + 两次 `Array.get` + 桶内线性扫，Int 键在小桶里比建 cons 便宜）；
- `isDictFamily` 加 `Dict_` 前缀预筛：`startsWith` 会把**两个串都** `strUnpack` 成
  `List Int`（按整串长度分配），与原「扫 17 个类名」同量级，撤；
- 桶数 1024 → 4096（64×64，只为 Int 键降碰撞）：同窗口 6 次交替最小 14.10 s vs
  14.05 s，**≈0.3%，噪声量级**，撤。容器真正的上限在「固定 1024 桶 + 桶内链表」：
  27k 条解表平均桶长 ~26，`toList`/`size` 还是 O(n·桶长)。要动就得换 HAMT（稀疏节点 +
  完整哈希位）或加宽 `strHash`（intrinsic，涉及核心求值/native/wasm 三份实现 + 主题页），
  并重新 rotation；按当前读数不值得。
- 把 binder 类型在绑定点求值成 Value 直接复用（省 `shift`+`eval`）：会改变不透明/擦除
  决策（`isOpaqueRuntimeTyIn` 按**当前**精化重算类型），属语义改动，撤，并把该不变式
  写进 [core.md](core.md) §5。`Ctx` 只保留「求值环境前插维护」这一处结构简化。
- **判定器用静默 `conv`**（失败不构造诊断，供 `ctxDictDomEqual` / `domainsEqual` 这类
  「试一下相等吗」的调用点用）：把 `mismatchAt` 换成常量文案的上界 A/B 是 **0.32% 分配**
  （3.98M words/check），时间在噪声内（±1%）；代价是给 13 个互递归函数各穿一个 `quiet`
  参数，撤。
- **写接口前 `termHasAnyMeta` 早退**：上界 **0.41% 分配**（5.1M words/check；20,740 次
  `fixTerm` 里 20,711 次无元变量）。但要跳过 `substSolvedMetasAt*` 的整树重建，就得依赖
  「`TLam` slot 不会出现 `Just (Pair Nothing Nothing)`」这条未成文不变量（重建时 `lamTyOf`
  会把它归一化成 `Nothing`），换算成时间不足 0.1%，撤。
- **去掉最终组装前的第 4 遍 `rezonkDefs`**：它用的是实例体之后的新解表（`ec4`），不是
  重复遍历；能省的只有已被 `ec4` rezonk 过的 `instDefs`，收益是一次扫描的量级，撤。
- **codegen 的类型求值缓存**（按定义 / 构造子名缓存 `eval [] (dtCtorType / dtDefType)`）：
  `vuna.codegen.unit` 里的 57.6 万次 `eval` 有 **73% 来自类型渲染的 `applyClosure`**
  （`peelPiArgsTy` 16.3 万次调用、`annotTyOf` 5.1 万、`ctorTypeArgsOf` 3.3 万），
  按定义 / 构造子重复求值的只有 ~2 万次（`ctorOpaqueFlagsOf` 18.5k、`ctorArityNeed` 0.8k、
  `dataUsedLevels` 0.9k）——上限 ~0.3% 分配，撤。类型渲染本身是逐应用的真实工作。

### 2.2 逐定义精化与 codegen 检查的分段（span 口径）

`VUNA_OBS=1`、空 `VUNA_STORE`、单进程冷跑 `check packages/compiler`（整跑 5.9 s；绝对数随
机器负载浮动，看份额即可）。`vuna.elab` 的账已闭合到毫秒级残差：下表各段之和等于
`vuna.elab`（2193 ms 对 2200 ms），`vuna.codegen.check` 是它的**兄弟**跨度，不再被算进精化：

| span | 耗时 | 占 `vuna.elab` | 说明 |
| --- | --- | --- | --- |
| `vuna.elab` | 2.20 s | 100% | 整段精化 |
| `vuna.elab.bodies` | 1.49 s | 68% | 逐定义精化（`vuna.def.elab` 6326 次；其子跨度 `vuna.elab.term` 正文检查 ~1.3 s） |
| `vuna.elab.tail` | 0.32 s | 15% | 收尾：`vuna.term` 0.24 s、`usage` 0.049 s、`rezonk` 0.008 s、`extra`/`main.show` ~0.004 s |
| `vuna.elab.sigs` | 0.099 s | 4.5% | 签名精化 |
| `vuna.elab.collectsigs` | 0.037 s | 1.7% | 签名收集 |
| `vuna.elab.instbodies` | 0.037 s | 1.7% | 实例体 |
| `vuna.elab.datas` | 0.030 s | 1.3% | data 精化 |
| `vuna.elab.instheads` | 0.010 s | 0.4% | 实例头 |
| `vuna.elab.rezonk` | 0.008 s | 0.4% | 收尾 zonk（3 处） |
| `vuna.elab.prepare` | 0.008 s | 0.3% | record 降级（`deriving` 展开 <1 ms） |
| `vuna.elab.defined` | 0.007 s | 0.3% | 定义齐备性检查 |
| `vuna.elab.dictfix` | ~0 | — | `resolveDictGoalsFix`：收尾时 pending 已空 |
| `vuna.codegen.check` | 0.91 s | — | `.lower` 0.91 s（`.unit` 0.55 s）；`.gen` <1 ms |
| `vuna.parse.lex` / `.syntax` | 0.26 / 0.17 s | — | 512 / 512 次 |

codegen 检查的分段（同一次冷跑、互不重叠的独占值）：逐定义 lowering `lowerDefs` **351 ms**
（其中 `lowerDefBodyTerm` 307 ms / 412 MB）、`validateProgram` **210 ms**（`checkBinderTys`
160 ms）、SCC 分组 **151 ms** / 229 MB、`prepareProgram` 88 ms / 177 MB、`makeLwEnv` 48 ms、
`tyDeclsOf` / `representUnit` <10 ms。check 路径不再跑 `validateProgram`（那份 IR 只用于自检、随即丢弃）；程序级校验只在
后端插件路径（`lowerProgramCheckedOf`）与单单元 build（`lowerUnitCheckedFrom`）执行。

同一口径的计数（`VUNA_OBS=2` 出 10^5 级、`VUNA_OBS=3` 出 `eval`）：

| 计数 | 次数 | 读法 |
| --- | --- | --- |
| `vuna.counter.meta.solve` | ~3.6×10^3 | 元变量求解 |
| `vuna.counter.meta.zonk` | ~7.5×10^3 | `zonkTerm` 调用 |
| `vuna.counter.core.conv` | ~1.8×10^5 | conv 调用（level 3） |
| `vuna.counter.conv.mismatch` | ~3.2×10^4（18%） | conv 失配（level 3）；每次失配要付两次 `showValueAt`，这是「被丢弃的诊断」成本上界 |
| `vuna.counter.core.reduce` | ~1.59×10^6 | `eval` 调用（level 3） |
| `vuna.counter.core.delta` | ~1.4×10^4 | delta 展开次数（`eval` 的 1%） |

pending 队列规模分桶（`elab.dict.pending.b*`，走 `VUNA_LOG=debug` 的 `counters=` 行）：
0 规模 10,878 轮、1–4 1,953 轮、5–16 1,244 轮、17–64 263 轮、65+ 2 轮。即「一趟 worklist
要处理 >16 个目标」只有 265 轮，旋转语义的二次代价不在关键路径上。

按表达式形态看 `vuna.elab.term.core` 的事件**次数**（level 2 逐节点 span）：`EVar` ~8.0×10^4、
`EApp` ~5.5×10^4、`ECase` ~8.2×10^3、`ELam` ~7.3×10^3、`EIf` ~3.4×10^3、`ELet` ~1.8×10^3——
约 21 个节点/定义。所以剩余成本是**每个表达式节点的推断/统一**，不是可以整段跳过的阶段。

用工具链自采样（`observability.md` §6.1）看函数级热点，冷 `check packages/compiler` 的顶部是
**解析期的名字解析**（`Loader.Modules.isDataOrRecordCtorTarget` 与 `mangle` 的字符串拼接、
`lookupExport` 的线性扫描）、`Elab.Types.ecTriedAt` 的约束尝试记录、以及
`Elab.Meta.dtCtorLookup`；`Core.Eval.quote` 与 `List` 的 `unpack` 次之。

据此落地的两条改动：
- 局部 binder 的引用不再走运算符特化链（`+` / `==` / `Base.Trait.Num.*` 只可能是全局名）：
  `EVar` 自用时间 4.6 s → 3.6 s；
- check 路径用 `Target.Ocaml.Assembly.checkUnitParts` 只校验「运行时定义有体」，不拼产物文本
  （文本生成是纯渲染，`Target.Ocaml.Term` 唯一的 `ErrC` 已保留）：`codegen.check` 1.7 s → 1.4 s；
  当前冷 `check packages/compiler` 的 `vuna.codegen.check` 约 0.91 s，其中 `.gen` 已 <1 ms。
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

- 精化的三处「按次浪费」：`eval` / `zonkTerm` 的燃料改固定上限（原来每次调用按 `termSize`
  派生一遍，`eval` 1.6×10^6 次/检查）；`isMemberDomain` 直接看值头部，不再 `quote` 整个字典域；
  `Ctx` 在精化/绑定点缓存「已代入精化的求值环境」（`refineValue` 8.3×10^6 次/检查 → 分支内
  每次类型求值不再重建整个环境），并给 `refineValue []` 加恒等快路径。
  同一窗口 3 轮交替：冷 `check packages/compiler` 5.60 → 5.46 s（user 5.30 → 5.19，**−2.5%**）。

此时自采样的剩余热点：`dtp_unpack`（Canonical/Store 的字节处理）、`String.concat`
（Canonical/地址编码）、`dtp_strHash`、`nubNames`/`reverseOnto`、`Core.Eval.quote`；
求解器里还剩 `append pending [c]` 的 O(长度) 追加（旋转语义，改动要连语义一起重写）。

### 2.3 名字解析（`vuna.resolve` 窗口）的分段读数

冷 `check packages/compiler`（空 store、单进程、wall 5.1–5.3 s）的 `vuna.resolve` 标记到
`vuna.elab` 起点之间是 **0.76–0.80 s（≈15%）**，此前只有标记没有子跨度。按模块聚合的
子跨度（157 个模块，`VUNA_OBS=1`，处置前读数）：

| span | 耗时 | 说明 |
| --- | --- | --- |
| `vuna.resolve.module` | 663–680 ms | `resolveProgram`（逐模块名字解析本身） |
| `vuna.resolve.warn` | 141 → **68 ms** | 未用 import 判定；处置后见下 |
| `vuna.resolve.reorder` | 9–11 ms | fixity 重排（`reorderProgram`） |
| `vuna.resolve.expand` | 5–9 ms | 宏展开（`expandDecls`） |
| `vuna.resolve.ns` | 2–5 ms | 命名空间 / 模块表建表（`namespacesOfWith`） |
| `vuna.resolve.entry` | 0.8 ms | 入口声明解析 |

`vuna.resolve.warn` 内部（处置前）：`.names` 93 ms（`declGlobalNames` 走一遍**已解析** AST
+ `interpReferencedInSource` 走一遍源码 + `HashMap.ofNames` 全量引用名）、`.sources` 43 ms
（第二次走源码建全量引用名集合）、`.imports` 4 ms。同一棵源码 AST 被走两遍，且
`sourceNames` 只被 `anyNameIn sourceNames (fixityOpsOf …)` 使用——它只需要「源码里出现过的、
某个 import 提供的运算符」。处置：源码只走一遍，`sourceNames` 只保留可见 fixity 运算符
（全包 10^5 量级 → 个位数），`.warn` **141 → 68 ms**。

`.module` 的固定成本里最大一项是**按 import 名查模块的线性扫描**：`modulesExporting*` 对每个
import 调 `exportIndexOfModule` → `resolvedName` → `resolveModuleName` → `findModule`（扫整张
模块表，命中时还会重建 `Module` 记录）。采样（`VUNA_OBS=3` + `VUNA_OBS_SAMPLE=cpu`，
`args.stack`）里 `Loader.Modules.resolveModuleName` / `exportIndexOfModule` 是编译器侧出现
最多的两个叶帧。处置：`Namespaces` 增加 `nsModuleTbl`（`Modules.moduleTblOf` 一次建
「模块名 → 模块」表），解析期走 `exportIndexOfModuleIn` / `modulesExporting*In`；命名空间
路径的罕见回退按需把表展回列表。同一窗口 3 轮读数：

| | 处置前 | 处置后 |
| --- | --- | --- |
| `vuna.resolve` 窗口（标记 → `vuna.elab`） | 0.76–0.80 s | **0.52 s** |
| `vuna.resolve.module` | 663–680 ms | **426–447 ms** |
| `vuna.resolve.warn` | 141 ms | **68 ms** |
| 冷 `check packages/compiler` CPU（4 轮交替最小值） | 5.12 s | **4.87 s（−4.9%）** |

剩余 `.module` 仍是**逐节点成本**（合成探针：1 个引用/定义 ≈3.2 µs；4000 引用单表达式
≈1.2 µs/节点）：每个 `EVar` 付 `mangle` 拼接 + 3 个命名空间哈希查表 +
`modulesExporting*` 的 O(imports) 哈希查表 + `Check` 的 bind 闭包。再往下需要函数级采样
（`VUNA_OBS=3` + `VUNA_OBS_SAMPLE=cpu`，见 [observability.md](observability.md) §3.3）或把热
形态改写成直接风格；合成探针试过的两个方向读数：`scopeNamesOf` 的隐式作用域表在 2000 定义/
2000 表项时只多 3.5 ms，模块表长度在改成 O(1) 查表后已不是成本项，都不值得单独动。

**长链的二次行为在名字收集，不在 fixity**：parser 把中缀链收成**右嵌套**（`a + (b + c)`），
`Fixity.collectChain` 沿右脊展平、每层只 reorder 一个左操作数——实测 `vuna.resolve.reorder`
对 2000/4000/8000 项纯字面量链是 0.4/0.6/1.1 ms（线性）。二次项在 `unusedImportWarnings`
的名字收集：重排后的左结合链是**左嵌套** `((a+b)+c)+…`，`exprRefNames` 每一层
`append (左子结果) …` 会复制整段左子结果。`g = 1 + 1 + …` 的 `vuna.resolve.warn`
2000/4000/8000 项 = 30/105/433 ms；改成累加器（每个节点只 cons 一次，顺序未定义、
调用方都按集合消费）后 **1.7/2.1/3.1 ms**，门禁 `checks.vuna-resolve-chain-growth`。
真实源码受 100 列格式化约束、链很短，这一项在整包里只占 ~60–70 ms，因此本轮的收益是
复杂度（长链/生成代码），不是常数。