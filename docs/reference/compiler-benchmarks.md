# 编译器基准

`bench/compiler.sh` / `bench/native.sh` 的命令墙钟、编译热点与**已量化否决的候选**。
阶段跨度的构成与解读见 [performance.md](performance.md) §1 / §4 / §6；生成程序（运行时）
基准见 [benchmarks.md](benchmarks.md)。

`sh bench/compiler.sh`（仓库根；`--runs N` / `--check` / `--save-baseline` / `--alloc`）测
编译器 / 工具链自身墙钟。基线 `bench/baselines/compiler.txt`（机器相关，只做同机回归对比）；
`--check` 超过 `--threshold`%（默认 20）打 WARN、超过 `--fail-threshold`%（默认 50）exit 1。
**产物尺寸与产出它的构建时间**走 `sh bench/artifact.sh`（`nix run .#vuna-artifacts`）：
基线 `bench/baselines/artifacts.json`，尺寸跨机器可比（§1「产物规模」），
`--check` 的尺寸阈值默认 5% / 20%，耗时默认 20% / 50%（同机）。
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

**编译器自身编到 native**（`sh bench/native.sh`，基线 `bench/baselines/native.json`，只做同机
对比）：`70d7817` 的 `check packages/base` 冷（空 store）**24–25 s**、热 **39 ms**，
二进制 11,359,584 B。冷读数的 `user+sys` ≈ 23.8 s（99% CPU），是真实计算不是等待；
与 OCaml 产物的同命令（~0.4 s）相差约 60x，来源是 native 缺少指令选择/窥孔（D127）
与零参定义/闭包经由运行时的调用面。`check packages/compiler` 目前仍跑不完（D122），
所以基线只含 base 一档（`"full": false`）。

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

**容器复杂度契约**：`checks.vuna-container-growth`（HashMap / Queue / TreeMap /
PriorityQueue / Sort，三档合成探针，只测 OCaml 后端产物的运行墙钟，相邻档 ≤3.0×）与
`bench/programs` 的 `sort_lib` / `treemap` / `queue` / `priority_queue` / `hashmap_remove`
三端 ratio 基线共同锁住（契约表见 [stdlib.md](stdlib.md)）。Elab 的约束 worklist 已换成
`Base.Container.Queue`（FIFO）：`check packages/compiler` 冷读数与产物逐字节不变，
收益是去掉最坏情况 O(长度) 的尾部追加（实测中性，pending 峰值很小）。

**已量化否决的候选**（数据见 git 与 `_scratch` 探针，不要重复开题）：

- **增量摘要 / 分片哈希（`sha256OfParts`）与编码分片合并**：采样里 iface 阶段仍剩
  `String.concat` ~6%，看起来像"整包载荷 concat 太贵"，但微基准（200 MB、`time` 外壳）证伪：
  `strConcatMany` 200 MB 只要 **0.02 s user**（原生 memcpy），`prehashOfString` 200 MB =
  0.58 s user（≈345 MB/s），`contentAddress` 200 MB = 1.09 s user（≈180 MB/s）。也就是说钱花在
  **逐字节的预哈希/SHA** 与「百万级小分片」本身，不在拼接那一遍；把 `encTag`/`encInt`/`encStr`/
  `encList` 的分片**合并回单个原子串**反而从 7.02 s 变成 7.08 s（3 轮，user）。因此增量摘要
  不会省下可测的时间，不做；这条线要动就动"两次哈希"（`hashParts` 与 `implHashOfParts`
  对几乎相同的载荷各编码+各哈希一遍），那是缓存身份设计，不是局部优化。
- **提高 OCaml 优化级别 / 内联阈值**（`build.sh` 的 `FLAGS`）：本机 `ocamlopt` 的
  `-config` 是 `flambda: false`，`-O3` 因此是**空操作**——同一源码 `-O3` 与默认产物
  **逐字节相同**（25,458,312 B，编译 CPU 12.66 s vs 12.63 s）。`-inline 10` 让编译
  CPU +20%（12.63 → 15.12 s）、产物 +18%（29.99 MB），而冷 `check packages/compiler`
  三对交替 10.52/11.26/11.19 vs 11.41/10.60/10.41（user），在噪声内。`-g` 只影响体积
  （25.3 → 21.2 MB，-16%），编译 CPU 不变（12.83 → 12.92 s），保留（`#line` → DWARF 需要）。
- **flambda 工具链**（`pkgs.ocaml.override { flambdaSupport = true; }` →
  `ocaml+flambda-5.5.1`，configure 确认 5.5.1 仍支持 `--enable-flambda`）：用**同一份**
  生成的 `.ml`（compiler 包 183 个模块 / 61k 行）编译默认 / `-O2` / `-O3` 三颗二进制。
  冷 `check packages/compiler`（空 store，各 3 轮交替，user 秒）：
  10.08 / 9.92 / 10.01 → `-O2` 9.59 / 9.74 / 9.60（**-4.1%**）→ `-O3` 9.21 / 9.25 / 9.20
  （**-8.0%**）；`check packages/cli` 14.34 → 13.50（-5.9%），`check .` 19.0 → 17.6（-7.4%）。
  代价：编译 CPU 18.3 s → 30.9 s（`-O2`，+69%）/ 44.3 s（`-O3`，+142%），产物
  25.5 MB → 33.1 MB / 40.1 MB。**否决**：本仓库的日常回路是「改编译器 →
  `nix build .#vuna` → 测量」，编译翻倍的成本落在每一轮与每个 CI job（3 个 stage 各付一次），
  换来的是 6–8%；对照已否决的 codegen 并行（6–7%）与 hash-consing（2–4%），这笔交换不成立。
  唯一保留的可能性是**只给 elab 热点模块**（`Elab.Term.Impl` / `Elab.Trait` /
  `Core.Eval` / `Core.Conv` 等）加 `-O3` 的分模块标志，未测。
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
- **conv 失配不渲染**：每次检查 5.9×10^4 次失配、每次两次 `showValueAt`，看着像大头；把
  `mismatchAt` 换成不渲染的轻量错误（临时探针）在 `eval` 燃料修复之上只再省 ~0.1%
  （3 轮交替：整包 5.591 → 5.552 s，其中大部分是燃料修复的 0.6%）。失配两侧基本是变量 /
  常量，渲染就是一个短名字符串，不做。
- **全局 / 构造子类型值缓存**：`eval` 里 `env` 为空的只占 3.86×10^5 / 1.61×10^6（**24%**），
  且每次都是小项；缓存还要处理 `globals` 收尾重建（`liftFreeDictGoals` 换签名类型）后的
  失效，收益 <1%，不做。
- `zonkTerm` 燃料按项规模派生（7.4×10^3 次/检查）、pending 双队列旋转（一趟 >16 个目标只有
  265 轮）、`resolveDictGoalsFix`（收尾时 pending 已空，实测 1 µs）：量级都不够，不做。
