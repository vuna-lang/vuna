# 可观测性（observability）

本页是 **vuna 全语言层**的性能/资源观测规范：编译器与**任何 vuna 应用**共用同一套事件
模型、同一套开关、同一套格式。落地范围：编译器自身的内建探针、`Base.Obs` 库层、
隐藏原语与生成运行时、`vuna obs` 工具链、DWARF 行号、以及与外部生态的换算。

读数方法学（怎么量、量什么、否决过的优化）在 [performance.md](performance.md)；本页只管
**观测装置本身**：事件长什么样、开关怎么开、代价是多少、怎么接进外部工具。

## 0. 一句话

生成代码里带一个**零成本默认**的观测运行时：打开 `VUNA_OBS=1..3` 或 `--obs` 后，它把
span / 计数 / 日志 / 采样栈写成 **Chrome Trace Event JSONL**；关闭时每个探针只付一次
`Lazy.force` + 一个布尔分支。

## 1. 设计决策（推翻时改这里，不静默改实现）

| # | 决策 | 理由 / 代价 |
| --- | --- | --- |
| O1 | **规范格式 = Chrome Trace Event JSONL**（schema `vuna-obs 1`）；`.cpuprofile` / speedscope / folded / HTML 都是它的**换算** | Perfetto / `chrome://tracing` 原生可开；每行一事件，崩溃可截断容忍 |
| O2 | 观测是**运行时契约的一部分**（隐藏原语 `@vuna@obs@*`），不是工具链私有 hack | 与 `dbg!` 同策略：纯函数可调用（深部纯核心探针不需要把签名 effect 化，见 debt D68）、`vuna interp` 归约 no-op、任何包可用 |
| O3 | **默认关闭**，显式打开（`VUNA_OBS=1..3` / `--obs` / `--obs-level N`） | 绝对性能读数必须来自关闭口径；关闭路径 = 一次 `Lazy.force` |
| O4 | 分级：`0` 关；`1` 阶段 span + 计数；`2` 逐定义 span + 日志；`3` 采样（CPU/内存） | 每级成本有上界，见 §6 |
| O5 | trace 是**普通文件**，绝不进对象库 / 缓存载荷 / 包产物 | 时间戳使产物非确定性；进缓存会污染命中 |
| O6 | 生成单元默认注入 `# <line> "<包相对路径>"`（**唯一默认开启的产物变化**） | 让 `gdb` / `perf` / 异常回栈原生产生 `.vuna` 位置；代价是产物文本变化（基线/快照/seed rotation） |
| O7 | `#line` 路径一律**包相对**且规范化 | 跨机器、跨目录逐字节可复现（绝对路径会破坏 determinism 与快照） |
| O8 | `dbg!` 的 stderr 文本协议**逐字节不变**（`DEBUG <epoch-us> <text>`），实现改为「日志事件 + 同一行 stderr」 | 11 个 suite 段与人的习惯不变，同时拿到结构化事件 |
| O9 | 采样只在主 domain（`ITIMER_PROF` + `SIGPROF`），只计 CPU 时间 | 多 domain 采样未做（debt D41）；阻塞 I/O 的归因靠 span 墙钟，不靠采样 |
| O10 | 内存观测 = `Gc` 计数器差（便宜、确定）+ 可选的 `Gc.Memprof` 分配栈（level 3） | OCaml 5.5 的 `Unix` 没有 `getrusage`；RSS 只做 `statm`（debt D81） |
| O11 | CDP 只做 **Profiler 子集**，传输沿用 `Content-Length` JSON-RPC（同 REPL server）；Chrome UI 需要的 WebSocket 由工具侧 Node 桥接 | vuna 语言层没有 SHA-1/base64/WebSocket，不为一个桥在 TCB 里造密码学 |
| O12 | wasm / native 后端只提供**叶子原语**的 no-op 桩；`obsSpan` 在这两个目标上编译期显式拒绝 | 两个后端今天都不支持闭包；诚实失败优于假成功 |
| O13 | `--obs` 系旗标由**运行时读原始 argv**（同 `--debug-perf`），`Vuna.Cli` 只剥离；跨进程只认 env（`VUNA_OBS`） | 与 debt D67 同型的已知分散点；子进程由 `vuna obs run` 负责设 env |

## 2. 开关与级别

| 开关 | 作用域 | 语义 |
| --- | --- | --- |
| `--obs` | 运行时 argv | 等同 `--obs-level 2` |
| `--obs-level N` / `--obs-level=N` | 运行时 argv | 显式级别 0..3（0 = 关，覆盖 env） |
| `VUNA_OBS=N` | env | 默认级别（缺省 0） |
| `VUNA_OBS_FILE` | env | 精确输出文件（单进程场景） |
| `VUNA_OBS_DIR` | env | 目录；缺省 `${TMPDIR:-/tmp}/vuna-obs`；文件名 `vuna-<pid>.jsonl` |
| `VUNA_OBS_INTERVAL` | env | 采样间隔 µs（缺省 1000） |
| `VUNA_OBS_SAMPLE` | env | 采样种类 `cpu` / `mem` / `both`（缺省 `cpu`）：运行时在 `sampleStart` 的 `mode` 为空串时读它；`vuna obs run --sample` 把它写进子进程 env |
| `--debug-perf` / `VUNA_DEBUG_PERF=1` | 运行时 argv/env | 既有 `dbg!` 输出开关，**独立**且优先：它只控制 stderr 行 |

级别含义与成本（关闭 = `Lazy.force` + 分支）：

| level | 打开什么 | 主要成本 |
| --- | --- | --- |
| 0 | 无 | 每次探针一次 `Lazy.force`（无分配、无 I/O） |
| 1 | 阶段 span + 计数器 | 每 span 两次时钟读 + 一行 JSON |
| 2 | + 逐定义 span + `dbg!` 日志事件 | 每定义两次时钟读（compiler 实测 10933 条 `vuna.def.elab` / 5470 个定义） |
| 3 | + CPU/内存采样 | 采样 1%/默认 1 ms、固定 8192 槽环形数组 |

级差是**探针侧**的（`VUNA_OBS` 只被运行时读一次）：level 1 不发逐定义事件、level 1/2 不
启采样。步数计数（`vuna.counter.steps`）**尚未实现**，见 §10。
## 3. 事件模型（规范）

每行一个 JSON 对象（JSONL），第一个事件是元数据。字段契约由 `vuna obs validate` 检查。

### 3.1 元数据事件（必为文件首行）

```json
{"ph":"M","name":"vuna.obs.schema","pid":123,"tid":0,"args":{"schema":"vuna-obs 1","version":"0.1.0","level":2,"exec":"/abs/bin/vuna","argv":["check","compiler"],"t0":1794624080641857}}
```

### 3.2 事件字段

| 字段 | 必填 | 约束 |
| --- | --- | --- |
| `ph` | 是 | `M` / `X` / `C` / `i` |
| `ts` | `X`/`C`/`i` | epoch 微秒（整数）；**同一 `pid`/`tid` 内单调不减**，唯一例外是**嵌套 span**（见下） |
| `dur` | `X` | 微秒；`ts + dur` 不得倒挂同一 `tid` 的后续 `ts`（允许重叠嵌套） |
| `pid` / `tid` | 是 | `pid` = `Unix.getpid`；`tid` = fiber id（无调度器时 0） |
| `name` | 是 | `vuna.*`，小写点分；见 §3.3 词汇表 |
| `cat` | 否 | `vuna.phase` / `vuna.def` / `vuna.cache` / `vuna.io` / `vuna.user` / `vuna.log` / `vuna.sample` |
| `args` | 否 | 扁平对象：`value`（计数器）、`text`（日志）、`stack`（采样，叶在前）、`error`（span 异常）、`def`/`module`/`file`/`line`（逐定义定位） |

**嵌套 span 的写序**：`dtp_obs_span` 在**完成时**写出事件（内层 span 先落盘），因此
内层 `ts` 可以早于前一条事件。`validate` 的时序检查据此放行「落在上一条 span 的
`[ts, ts+dur]` 区间内」的事件，其余倒挂仍是 error。

`ph:"X"`（完整跨度）是唯一 span 形态：`dtp_obs_span` 用 `Fun.protect` 语义保证异常路径也写出
（带 `args.error`），异常原样重抛。**不用** `B`/`E` 配对——少一类不闭合故障。

### 3.3 事件名（固定词汇表）

**已插桩**（本仓库代码真的会产出这些名字）：

- `vuna.elab`（整段精化的汇总跨度）、`vuna.codegen.check`（codegen 前置校验段）；
- `vuna.def.elab`（level ≥ 2，`args.def` = 定义名）；
- `vuna.log` / `vuna.mark.*` / `vuna.sample.cpu` / `vuna.sample.mem` / `vuna.obs.schema`。

**保留名**（在词汇表里、`vuna obs validate` 认，但**尚无插桩点**）：`vuna.load`、`vuna.parse`、
`vuna.resolve`、`vuna.elab.sigs`、`vuna.elab.datas`、`vuna.elab.traits`、`vuna.elab.instheads`、
`vuna.elab.bodies`、`vuna.elab.instbodies`、`vuna.elab.tail`、`vuna.iface.compute`、
`vuna.iface.write`、`vuna.codegen.split`、`vuna.codegen.unit`、`vuna.cache.lookup`、
`vuna.cache.write`、`vuna.check`、`vuna.build`、`vuna.link`、`vuna.def.lower`、`vuna.def.text`、
`vuna.counter.*`（全部计数名）。加插桩时**不要**改名（工具/看板按名字聚合）。

- 档次读数（在 `ph:"X"` 的 `args` 上，**不是**独立 count 事件）：`args.allocWords` /
  `args.heapWords`（整数，span 期间分配/堆字数增量）；`validate` 只校验它们是整数，
  不对 `vuna.counter.alloc.words` / `vuna.counter.heap.words` 做存在性断言（这两个名字
  已从词汇表移除）；
- 采样（`ph:"i"`，`args.stack`）：`vuna.sample.cpu`、`vuna.sample.mem`；
- 日志（`ph:"i"`，`args.text`）：`vuna.log`（`dbg!` 与库层 `obsLog` 共用）；
- 标记（`ph:"i"`）：用户/编译器自定义名字（`vuna.mark.*` 前缀可选）。

用户程序的事件名不加 `vuna.` 前缀限制：写 `app.render` 之类即可（`validate` 只查 `vuna.*`
事件的词汇表）。

## 4. 语言层 API

### 4.1 隐藏原语（`Intrinsics` / `Ir.Runtime` / `Codegen.Runtime` 三处对齐）

| 名字 | 签名 | 语义（OCaml 运行时） |
| --- | --- | --- |
| `@vuna@obs@level` | `Int -> Int` | 当前级别 0..3（哑 `Int` 实参，避免「纯值读进程配置」形态） |
| `@vuna@obs@span` | `String -> String -> (Int -> a) -> a` | 名字 + 分类的高阶跨度；关闭时直接 `f 0` |
| `@vuna@obs@log` | `String -> Int` | 日志事件（+ 若开 `--debug-perf` 则同一行 stderr） |
| `@vuna@obs@counter` | `String -> Int -> Int` | 计数器事件（`args.value`） |
| `@vuna@obs@mark` | `String -> Int` | 瞬时标记（`ph:"i"`） |
| `@vuna@obs@sampleStart` | `String -> Int -> Int` | `"cpu"`/`"mem"`/`"both"` + 间隔 µs |
| `@vuna@obs@sampleStop` | `Int -> Int` | 停止采样并 flush |

`vuna interp`（`Core.Eval`）把 `level`/`counter`/`log`/`mark`/`sampleStart`/`sampleStop` 归约成
`VInt 0`，`span` 归约成「把 thunk 应用到 0」——interp 永远静默（同 `dbg!`）。wasm/native
后端：叶子原语为 no-op，`span` 编译期 `unsupported`（O12）。

### 4.2 库层 `Base.Obs`（所有 vuna 应用）

```text
obsLevel      : Int -> Int
obsOn         : Int -> Bool
obsSpan       : String -> String -> (Int -> a) -> a
obsSpanP      : String -> (Int -> a) -> a          -- cat = "vuna.user"
obsLog        : String -> Int
obsCounter    : String -> Int -> Int
obsMark       : String -> Int
obsSampleStart : String -> Int -> Int
obsSampleStop  : Int -> Int
```

薄包装（无 `Eff`、无 `runPure`，满足隐藏效果守卫）；`Base.Show` 的 `dbgShow` 走同一日志原语
（stderr 文本协议不变）。

### 4.3 内置宏（无需 import）

| 宏 | 展开 | 用途 |
| --- | --- | --- |
| `dbg! msg` | 既有：`if @vuna@debug@on 0 then @vuna@debug@line msg else 0` | 保持逐字节兼容（stderr `DEBUG …`） |
| `obs! msg` | `@vuna@obs@log msg` | 一条日志事件（level ≥ 1） |
| `mark! name` | `@vuna@obs@mark name` | 一个瞬时标记 |

## 5. `#line` 注入与 DWARF

- `Codegen.Term.genGroup` 在每个 `let` / `let rec` 绑定、每个 `and` 绑定、每个单定义 `let`
  前写一行 `# <起始行> "<包相对路径>"`（单行内不插指令，避免破坏布局）。
- 路径由 `Codegen.Split.splitLocPath roots contextDir` 归一（与 `dt_def_locs` 位置表同一函数），
  因此产物**只含包相对路径**（O7）。check 路径（`noQual`）归一为恒等，但文本被丢弃。
- 效果：`ocamlopt -g` 的 `.debug_line` 直接指向 `.vuna` 文件（`gdb` / `perf` / 异常回栈原生可用）；
  `dt_report_exn` 的 `dt_def_locs` 位置表**保留**（无 DWARF 的裁剪产物仍需可读上报）。
- 边界（写进 [debugging.md](debugging.md)）：`#line` 是「文件 + 行」粒度，同一 `#line` 后连续
  生成的代码都归到同一起始行；表达式级定位不存在（debt D33 / D80）。`ocamlopt` 内联仍可能
  把帧归到调用者。
- `OUTDIR/vuna-symbols.json`：由 **`vuna obs symbols [--out FILE] [OUTDIR]`** 从 split 产物
  的 `.ml` **纯文本抽取**生成（不需要 DWARF、不需要编译）：
  `{schema:"vuna-symbols 1","defs":[{"ocaml","unit","file","line"}]}`，给无 DWARF 场景做
  符号映射（`perf script` 后处理 / 外部采样器）。`compile` / `build` 本身**不写**这个文件
  （产物目录里的 `.ml` 是唯一输入；抽取规则见 §7 `symbols`）。

## 6. 成本纪律

- 关闭路径：`dtp_obs_level` 是 lazy CAF；`dtp_obs_span` 关闭时只 `f 0`；`counter/log/mark`
  关闭时直接 `0`。都不分配、不读时钟、不碰文件。
- 打开时事件走 `Buffer`（256 事件或 `sampleStop` / `at_exit` flush），写失败只警告一次并降级
  丢事件（**不中止程序**、不改退出码）。
- 采样：`SIGPROF` handler 只 `Printexc.get_callstack 32` + 存进固定 8192 槽环形数组，停止时
  批量序列化（handler 里不做 I/O、不做格式化）。环形满即丢弃后续样本。
- **关闭路径的实测口径**是 `nix/checks/vuna-obs-overhead.sh`：`VUNA_OBS=0` 与不设观测的产物
  逐字节一致 + 关闭时不写 trace + 生成运行时的入口都以关闭快速路径开头。**不设墙钟阈值**
  （绝对性能不可跨机器比）。
- level 2 的真实成本：`check compiler` 10933 条 `vuna.def.elab`、trace 约 2.1 MB
  （`docs/reference/performance.md` §2 的读数纪律：绝对读数用两者都关的口径）。
- **绝对读数只用 `VUNA_OBS=0`**；obs 只用于归因与相对比较（同 [performance.md](performance.md) §2 纪律）。

## 7. 工具链 `vuna obs`

```console
vuna obs run [--level N] [--sample cpu|mem|both] [--interval US] [--out FILE] [--] <cmd...>
vuna obs summarize [--json] [--baseline FILE] [--threshold PCT] [TRACE...]
vuna obs convert --to cpuprofile|speedscope|folded|jsonl [--out PATH] TRACE
vuna obs render --out FILE TRACE
vuna obs merge [--out FILE] TRACE...
vuna obs validate TRACE
vuna obs symbols [--out FILE] [OUTDIR]
vuna obs serve --cdp ADDR [--allow-slow] [TRACE...]
```

- `run`：经 `@vuna@prim_eff_runIn` 跑子命令，退出码原样返回；结束后打印 trace 路径。
  **env 注入用「`env` 前置命令」**（`["env", "VUNA_OBS=…", …]` ++ 用户 argv，与
  `Vuna.Test.Run.withEnv` 同一范式）：本仓库没有 `prim_eff_setenv` 原语，所以 `run` 不改
  自己的进程环境，只让子进程继承 `env` 设的那一组。规则：
  - `--level N`（缺省 **2**，`run` 的默认语义就是 level 2；`--level 0` 是关闭口径对照）
    → `VUNA_OBS`；`--sample cpu|mem|both` → `VUNA_OBS_SAMPLE`；`--interval US` →
    `VUNA_OBS_INTERVAL`；
  - `--out FILE` → `VUNA_OBS_FILE`（相对路径按调用方 cwd 绝对化，父目录先建）；否则本次
    运行给一个**全新**临时目录 `${TMPDIR:-/tmp}/vuna-obs-run-<epoch-us>` 作 `VUNA_OBS_DIR`，
    跑完列出其中的 `vuna-*.jsonl`；
  - 用户命令在 `--` 之后原样透传（不注入 argv、不拼 shell 片段）；`--obs` / `--obs-level`
    是运行时 argv，由子命令自己读，`run` 不代设。
  - **本批限制**：子进程没产出 trace（level 0、或它不读 `VUNA_OBS*`）不算错误——打印
    `no trace file produced` 并仍返回子命令退出码；`run` 不做 trace 后处理（不自动
    validate / summarize），需要时组合子命令。
- `summarize`：span 树折叠 → 自用/总用时、计数表、采样热点；`--json` 机器可读；`--baseline`
  与旧 trace 做差值（回归判定）；`--threshold` 超差退出 1。**折叠简化规则**（规范未规定树
  算法，这里定死一条，实现在 `Vuna.Obs.Summarize`）：
  - 只折叠 `ph:"X"`；按 `pid`/`tid` 分组、组内按 `ts` 稳定排序；新 span 完全落在栈顶
    `[ts, ts+dur]` 内 = 子 span，否则逐层弹出到包含它的那层；
  - `args.parent`（可选）优先于时间包含：先按名字在栈里找父；
  - `self = dur − 直接子 dur 之和`；按 `name` 聚合 `count` / `total` / `self`；
  - 数字**一律整数微秒**（不引入 Float，跨机器逐字节可比）；`wallUs` = 最晚结束 − 最早开始；
  - 采样热点按叶子帧 `name@file:line` 聚合，每个种类 top 20（count 降序、帧名升序）；
  - `%self` 整数百分比；`--threshold` 只比较阶段 `total`（含子）的差值百分比。
- `validate`：schema 版本、元数据首行、`ts` 同一 `pid`/`tid` 单调不减、`X` 的 `dur` 非负、
  `C` 的 `args.value` 是整数、采样有 `args.stack`（字符串数组）、`vuna.log` 有 `args.text`、
  `vuna.*` 名字在词汇表内（`vuna.mark.*` 前缀放行，非 `vuna.` 前缀一律放行）。
  截断容错：**中间行** JSON 坏 = error（文件被外部改坏不静默跳过）；**末行**半个 JSON 行 =
  先按括号平衡补全闭括号（补全成功仍 warning），失败则丢弃该行 + warning，绝不升级为 error。
- `convert`：`--to` 必填，缺/未知格式 = 退出码 2；`--out PATH` 省略时内容打到 **stdout**
  （可 `>` 重定向），给了 `--out` 则静默（只打印 `wrote <path>`）。**转换产物确定性**：
  固定键序、无时间戳、无绝对路径（元数据 `exec` 不进产物）⇒ 同一输入两次转换逐字节一致。
  采样来源只有 `vuna.sample.cpu`（`vuna.sample.mem` 是分配栈，语义与 CPU 时间轴不同，
  **不进任何换算产物**；`jsonl` 是自反格式，保留全部事件）。CPU 采样为空 = **退出码 1 +
  `no cpu samples` 消息**（不产出「成功但空」的文件）。帧字符串统一是运行时写的
  `Name@file:line`（第一个 `@` 前是函数名，其后按**最后一个** `:` 拆文件与行号；拆不出 =
  `url:""`、行号 −1）。四种格式（实现：`Vuna.Obs.Convert` + `Vuna.Obs.Flame`）：
  - `cpuprofile`（CDP/V8 `.cpuprofile`）：`nodes` + `startTime`/`endTime`（首/末采样 `ts`，
    整数微秒）+ `samples`（每条采样的**叶**节点 id）+ `timeDeltas`（相邻采样差、首个相对
    `startTime`，故 `timeDeltas[0] = 0`）。节点 1 = `(root)`，其余按去重帧
    `{functionName, scriptId:"0", url, lineNumber, columnNumber:-1}` 首次出现顺序编号，
    `children` 是**父链**（每条采样栈叶在前，按 root-first 插入）；`lineNumber` 是 CDP 的
    0-based（`.vuna` 行号 − 1）；
  - `speedscope`：`$schema` = speedscope 官方 schema URL，`shared.frames` 按首次出现去重，
    `profiles[0]` 是 `evented`（`unit:"microseconds"`、`startValue`/`endValue` = 首/末采样
    `ts`），`events` 是 O(采样数)：每个采样一条「进入叶帧」的 `O` 事件（不补 `C`，
    speedscope 对 evented profile 末尾自动收尾）；
  - `folded`（火焰图）：`frameA;frameB;leaf<TAB>count`，栈**根在前**（与采样事件的叶在前相反），
    同名栈合并计数、按栈名字典序排序；只含 CPU 采样；
  - `jsonl`：按文件顺序用 `Types.renderEventLine` 重写全部事件（键序固定），给 merge / 裁剪用。
- `render`：单文件 HTML。**`--out` 强制**（HTML 体积大，省略时退出码 2 + 用法），写完打印
  `wrote <path>`。约定（沿 `Vuna.Doc.Html`）：
  - 数据只内嵌一次：`<script type="application/json" id="vuna-obs-data">`，内容是
    `renderJson` 的单行 JSON，`<` 经 `scriptSafe` 转成 `\u003c`（不会提前闭合 script）；
    页面其余文本先 HTML 转义；
  - **无外链**（产物里不出现任何 URL；`grep -c 'https\?://'` = 0）、**无时间戳/随机数** ⇒
    同一输入两次渲染逐字节一致；
  - 三个视图（纯内联 CSS/JS、无依赖）：① 瀑布（`spans` 按 `pid`/`tid` 分组、组内 `ts` 升序，
    `depth` 是嵌套深度，按 `ts/dur` 画横条）；② 火焰图（`flame` 是 folded 等价的根在前
    折叠栈，宽度 = 命中次数）；③ 计数器与采样热点表（`counters` 的 count/sum/last，
    `samples.cpu` / `samples.mem` 按叶子帧计数）；
  - 内嵌数据**不放** `exec`（主机绝对路径）与 `t0`（epoch 值）：页面是视图，保留绝对路径
    会把可复现产物变成绑定某台机器的产物；`argv` / `level` 保留。
- `merge`：多 trace（workspace 成员 / 每进程一份）合并成一份**能通过 `validate` 的 JSONL**。
  实现：`Vuna.Obs.Merge`。规则（本批定死）：
  - 输入按每份 trace 的 **`t0`** 稳定升序（元数据 `args.t0`；缺失取首个带 `ts` 的事件；
    再缺 = 0；`t0` 相同保持命令行顺序）；
  - 输出首行 = t0 最小的那份的元数据（**逐字保留**，schema 不变）；紧随其后是每份 trace 一条
    **成员行**：`ph:"i"`、`ts:0`、`name:"vuna.mark.merge-member"`、
    `args:{member, t0, pid, level, argv}`。成员行**不能是 `M`**（`validate` 只允许元数据出现在
    首行），`vuna.mark.*` 前缀是词汇表显式放行的；`ts:0` 让它们不干扰时序检查；
  - 事件按 **trace 分组**输出（组内保持文件顺序），组间按 t0 升序：跨机器/跨进程的 `ts`
    基准不可比，逐事件混排会造出假时间轴，分组保留「哪段属于哪个进程」；
  - `pid` **保留原值**（不重编号）；`member` = 元数据 `exec` 的 basename（缺 `exec` 用 pid），
    非首份 trace 的每个事件加 `args.member`（同一值），pid 撞车（不同机器同 pid）也能区分；
  - `--out` 省略 → stdout；输出无时间戳、键序固定 ⇒ 同一组输入两次 merge 逐字节一致。
- `symbols`：从 `OUTDIR`（缺省 `.output`，即 `vuna build` 默认产物目录；或 `--out DIR` 给的
  目录）的 split 产物 `.ml` **纯文本抽取**符号表，不依赖 DWARF、不需要编译。实现：
  `Vuna.Obs.Symbols`。抽取规则：
  - 只认**行首**的 `# <line> "<file>"` 指令，且只认**紧接其后**的第一条绑定行（中间隔了
    别的行就作废）；`type t_*` 数据声明组没有指令，不进符号表；
  - 绑定行取首个标识符：`let v_x =` / `let rec v_x =` / `and v_x =` / `external v_x :`；
  - `unit` = `.ml` 文件名去扩展名（`Main.ml` → `Main`），`ocaml` 是产物里的原始（mangling）
    绑定名（正是 `perf`/`gdb` 看到的名字），`file`/`line` 直接来自指令（包相对路径 + 1-based）；
  - 输出 `{"schema":"vuna-symbols 1","defs":[...]}`，按 `ocaml` 升序（同名再按
    `unit`/`file`/`line`）⇒ 两次运行逐字节一致；`--out` 省略 → stdout。
- `serve --cdp`：**CDP Profiler 子集的离线 server**。实现：`Vuna.Obs.Serve`。
  - **传输**是 `Content-Length` JSON-RPC over socket（复用 `Vuna.Json.Server.serveConnection`，
    与 REPL server / LSP 同一套帧层）。`ADDR` 只接受 `tcp:127.0.0.1:PORT`（loopback，`PORT=0`
    用临时端口 + 就绪行回填实际端口）或 `unix:PATH`（退出时删 socket 文件）；规则与
    `vuna repl --listen` 同一套（能连上端点 = 能驱动这个进程）。
    **vuna 侧不实现 WebSocket**：CDP 客户端要的握手由 `nix/obs-cdp-bridge.mjs`（Node，
    工具侧资产）做（O11 / debt D83）。
  - **离线性（必须诚实）**：数据源是命令行给的 `TRACE...`（`vuna-obs 1` JSONL，启动时一次
    读入），**不是**附加到运行中的进程做 live sampling（那需要 ptrace / 共享内存，本仓库没有）。
    `Profiler.start` 只记一个 `startTimestamp`（进程内记账，不进响应体）；`Profiler.stop`
    把整份 trace 的 `vuna.sample.cpu` 换算成 CDP Profile 回给客户端——与
    `vuna obs convert --to cpuprofile` 是**同一个构造点**（`Vuna.Obs.Convert.cpuProfileOf`），
    因此两者产物逐字节等价（确定性见下）。多份 trace 的采样按命令行顺序拼接；跨机器的
    `ts` 基准不可比（先 `merge` 再 serve，或分别起 serve）。
  - **方法表**（其余一律 JSON-RPC `-32601`；`Runtime.evaluate` / `Debugger` 等不在本期范围）：

    | 方法 | 响应 |
    | --- | --- |
    | `Profiler.enable` / `Profiler.disable` | `{}`（无状态；`disable` 顺带清 start 标记） |
    | `Profiler.start` | `{}`（记 `startTimestamp`；只记账） |
    | `Profiler.stop` | `{"profile": <cpuprofile 对象>}`（`nodes` / `startTime` / `endTime` / `samples` / `timeDeltas`，schema 同 §7 `convert`） |
    | `Profiler.setSamplingInterval` | `{}`（接受 `params.interval` 并**忽略**：离线换算用 trace 里已有的采样间隔，服务端不重采样） |
    | `Runtime.getIsolateId` | `{"id":"vuna-<pid>"}`，`<pid>` = trace 元数据的 `pid`（被剖析的进程；无 trace = 0） |

  - **错误分层**：未知方法 = `-32601`；坏帧 = `-32700`（stderr 一行诊断，客户端不会空等）；
    内容性失败（没 start 就 stop、trace 里没有 CPU 采样）= **`-32000`**（JSON-RPC 保留的
    server-error 区间）+ stderr 诊断。
  - **单连接、串行**（同 REPL server）：listen → stdout 一行 `listening <ADDR>` → accept **一个**
    连接 → 逐帧分发到客户端断开 / 传输层致命错误 → 关连接、关监听、清 unix socket → 退出。
    **不做并发连接**（要并发就起多个进程；桥按「每个 WS 连接一个 serve」组织）。
  - **退出码规则**（与 §7 其它子命令同一套分层，`serve` 的具体化）：

    | 退出码 | 含义 | 例子 |
    | --- | --- | --- |
    | 0 | 正常结束 | 客户端断开，且会话内没有内容性失败 |
    | 1 | **内容性失败**（与 `convert` 的「无 cpu 采样 = 1」同一口径） | 会话里 `Profiler.stop` 回过 `-32000`（trace 没有 CPU 采样 / 没 start 就 stop） |
    | 2 | 用法、参数、输入前提 | 未知/重复/缺值 flag；`--cdp` 缺失或 ADDR 格式错；TRACE 不存在 / 是目录 / 读不了 / 结构坏 / 空 trace；传输层致命错误（超大帧、fuel 耗尽） |

  - `--allow-slow` **接受但无效果**（当前没有墙钟阈值；离线换算一份 trace 的耗时由输入大小
    决定）。保留它只为固定命令行形状，文档明说它目前什么都不做。
  - **确定性**：同一 trace 两次 `Profiler.stop` 的 `profile` JSON **逐字节一致**（与
    `convert --to cpuprofile` 同一构造点；`startTime`/`endTime` 来自 trace 采样，不含墙钟）。
    与 `--out` 无关（serve 不写文件，profile 只出现在 JSON-RPC 响应里）。
  - **怎么从 Chrome 用**（可复现步骤，需要 Node；`nix shell nixpkgs#nodejs`）：

    ```sh
    # 1) 先产一份带 CPU 采样的 trace（level 3 + cpu 采样）；`obs run` 会打印 trace 路径
    ./result/bin/vuna obs run --level 3 --sample cpu -- out/bin/myprog
    #    （或者自己跑程序：VUNA_OBS=3 VUNA_OBS_DIR=/tmp/vt out/bin/myprog → /tmp/vt/vuna-<pid>.jsonl）
    # 2) 起 WS 桥（默认 127.0.0.1:9229；trace 是桥的数据源，可给多份）
    node nix/obs-cdp-bridge.mjs --port 9229 /tmp/vt/vuna-<pid>.jsonl
    # 3) 查询端点 / 接 DevTools
    curl -s http://127.0.0.1:9229/json/version
    curl -s http://127.0.0.1:9229/json/list
    #    把 webSocketDebuggerUrl 喂给 devtools frontend，或在 chrome://inspect 里
    #    Configure → 127.0.0.1:9229；Profiler 面板的 Start/Stop 即 start/stop。
    ```

    桥**不进** `nix flake check`（需要 Node + 端口，沙箱不保证）；缺 Node 时脚本自身会报
    `node: command not found`（提示装法见上）。手动验证脚本在 `_scratch/`（不提交）。

## 8. 外部生态

| 生态 | 接入 | 状态 |
| --- | --- | --- |
| Chrome / Perfetto | `vuna obs run` 产出的 JSONL 直接拖入 | 规范格式 |
| Chrome DevTools | 经 `nix/obs-cdp-bridge.mjs` 的 WS 桥：`vuna obs serve --cdp tcp:127.0.0.1:<PORT>` 只做 Content-Length JSON-RPC，Node 桥补 `/json/version`、`/json/list` 与 `/devtools/page/<id>` 的 WS 握手/帧（vuna 侧不做 SHA-1/base64） | 已实现（CDP Profiler 子集：`enable/start/stop/setSamplingInterval` + `Runtime.getIsolateId`；**离线**，profile 来自已有 trace） |
| `.cpuprofile` | `vuna obs convert --to cpuprofile` → 拖进 Chrome DevTools / Perfetto 的 CPU Profile 视图 | 已实现（`nodes` 父链 + `samples`/`timeDeltas`，只吃 `vuna.sample.cpu`） |
| speedscope | `vuna obs convert --to speedscope` → <https://www.speedscope.app> 打开 | 已实现（evented profile，`unit:microseconds`） |
| 火焰图 | `--to folded` + `flamegraph.pl`（nixpkgs `FlameGraph`） | 已实现（根在前、同名栈合并、按栈名排序） |
| 单文件 HTML 报告 | `vuna obs render --out report.html` | 已实现（内嵌 JSON + 内联 CSS/JS，无外链、可复现） |
| 多进程 / workspace 合并 | `vuna obs merge [--out FILE] TRACE...` | 已实现（按 `t0` 分组 + `vuna.mark.merge-member` 成员行） |
| Linux perf | `#line` → `.debug_line` 直接指向 `.vuna`；`vuna-symbols.json`（由 `vuna obs symbols` 生成）兜底 | 手动，见 `nix/obs.sh` |
| gdb | `#line` + `-g`：`list` / `bt` 给出 `.vuna` 行 | 手动 |
| OCaml `Runtime_events` | **不接**：GC/调度器事件与 vuna span 时间基准不同，先只做 `Gc` 计数器 | 非目标 |

格式边界（本批实现定死的取舍，改实现时同步改这里）：

- **只换算 CPU 采样**：`vuna.sample.mem` 是 `Gc.Memprof` 的分配栈，语义上不是时间轴，
  混进 `.cpuprofile` / speedscope / folded 会把「分配量」与「CPU 时间」加在一起；要看内存
  分配用 `summarize` 的 `samples.mem` 热点表（`render` 的采样表也列它）。
- **`Name@file:line` 的拆法**：`Printexc.Slot.name` 与 `.location` 由运行时拼成
  `<name>@<file>:<line>`；CDP 的 `url` 是文件、`lineNumber` 是 **0-based**（vuna 侧 1-based，
  减 1）。拆不出来（无 `@` / 无 `:` / 行号非数字）⇒ `url:""`、`lineNumber:-1`。
- **`folded` 的行序**是栈名字典序（不是计数序），这是确定性要求；火焰图渲染器自己会按宽度
  排布，不依赖输入行序。
- **`merge` 不做逐事件混排**（上面 §7 已说明）：不同机器的 `ts` 基准不可比；合并产物是
  「合法 trace + 分组边界」，跨机器比较请分别 `summarize --json` 再比。
- **`symbols` 不读 DWARF、不跑 `build --no-compile` 的编译步骤**：直接扫产物目录里的 `.ml`，
  因此对任何能产出 split `.ml` 的目录都适用（含未知的旧产物）。
- **`serve --cdp` 的 profile 与 `convert --to cpuprofile` 逐字节等价**：两者都走
  `Vuna.Obs.Convert.cpuProfileOf`（一个构造点，不写第二套）。`startTime`/`endTime` 来自
  trace 采样的 `ts`（不含墙钟），因此同一 trace 两次 stop 的响应体逐字节一致。
- **`serve` 不做 live sampling**：CDP 客户端发 `Profiler.start` 后若期望「接下来这段时间
  的 CPU 采样」，本实现给的是**整份 trace 的**采样——时间轴是 trace 录制时的，不是客户端
  操作时的。要看新的时间段就重新录一份 trace 再起 serve（§10 也记了这条）。
- **`serve` 的多 trace 拼接不做 `merge` 的成员分组**：命令行的多份 trace 按顺序拼采样，
  `pid` 保留各事件原值；跨机器合并请先 `vuna obs merge` 再 serve（否则时间轴不可比）。

`perf` / `gdb` / `valgrind` **不在**默认 devShell（避免构建图变重）；`nix/obs.sh` 在缺工具时
给出可操作提示，`perf record` 需要 `perf_event_open` 权限，Nix 沙箱常拒 ⇒ **perf 路径不进
`nix flake check`**，只做手动验证。

## 9. 门禁与测试

| 位置 | 断言 |
| --- | --- |
| `nix/checks/vuna-obs-schema.sh` | `VUNA_OBS=0` 不产任何 trace；`VUNA_OBS=2` 的 `check compiler` 与 `check base` 各产出一份 trace：`vuna obs validate` 通过、首行是 `ph:"M"` + `schema:"vuna-obs 1"`、`summarize --json` 单行且含 `spans`/`wallUs`；编译器 trace 必须含 `vuna.elab` / `vuna.codegen.check` 两个阶段跨度（插桩被搬掉会失败） |
| `nix/checks/vuna-obs-dwarf.sh` | split 产物每个绑定前有 `# <行> "<包相对>.vuna"` 指令（不含绝对/`../` 路径）；`build` 出的可执行文件在 `readelf --debug-dump=decodedline` 里有 `.vuna` 文件且行号 > 0。**不依赖** gdb/perf（CI 里不保证有） |
| `nix/checks/vuna-obs-overhead.sh` | `VUNA_OBS=0` 与不设观测的产物**逐字节一致**（关闭路径不得改变任何输出）；关闭时不写 trace 文件；打开时必须产出（反证）；生成运行时的 `dtp_obs_log/counter/mark/span` 都以关闭快速路径开头（不在关闭路径读时钟/分配）。**不设墙钟门槛**——绝对性能不可跨机器比，那属于 benchmark |
| `checks.eff-boundary` | 新增探针全部走隐藏原语（`runPure` 基线仍为空） |
| 手动（本批，`obs serve --cdp` + 桥） | 起 `vuna obs serve --cdp tcp:127.0.0.1:0 TRACE`，用任意 Content-Length 客户端连：`Runtime.getIsolateId` / `Profiler.enable` / `Profiler.start` / `Profiler.stop` 都有合法响应、`profile.samples` 数 == trace 的 `vuna.sample.cpu` 数、未知方法回 `-32601`、同一 trace 两次 stop 的 profile JSON 逐字节一致、无 cpu 采样的 trace 在 stop 上回 `-32000` 且进程退出码 1、参数错误退出码 2；再起 `node nix/obs-cdp-bridge.mjs`，自造 WS 客户端（`node:crypto` 手写握手 + 帧）断言 `Sec-WebSocket-Accept` 正确、`Profile.nodes` 非空、ping/pong 通。**不进 `nix flake check`**（需要 Node + 端口，沙箱不保证） |
| 手动（本批，`obs convert/render/merge/symbols`） | 同一 trace 两次 `convert --to cpuprofile\|speedscope\|folded\|jsonl` 的 md5 相同；`--to jsonl` 产物过 `validate`；两次 `render --out` 的 HTML md5 相同且 `grep -c 'https?://'` = 0；`merge` 两份 trace 的产物过 `validate`；`symbols` 对 `build --no-compile --out` 的 compiler 产物抽出的 def 数 > 1000、两次运行 md5 相同。**不进 `nix flake check`**（需要 split 产物，成本高）；suite 覆盖见下一行 |
| `checks.vuna-metrics` + `nix/codegen.baseline` | `#line` 后按实测重标定（`bytes`/`lines`/`maxline`/`letrec` 精确基线） |
| suite `107_observability.steps` | 关闭零输出、`dbg!` stderr 协议逐字节不变而 `obs!`/`mark!` 走结构化事件、`validate` 拒绝倒挂、`#line` 包相对 + 产物可跑、DWARF 指向 `.vuna`、回栈落到 `.vuna` 行、`VUNA_OBS=3` 的 cpu/mem 采样、`summarize --json` 单行、非 OCaml 后端的桩与编译期拒绝、`convert`/`render` 的确定性 |
| suite `108_obs_cdp.steps` | `vuna obs serve --cdp`：就绪行、六条 CDP 请求、`getIsolateId`=trace pid、`profile.samples`==cpu 采样数、未知方法 `-32601`、跨进程 profile 逐字节一致、与 `convert --to cpuprofile` 逐字节等价、`-32000`+退出码 1、参数错误退出码 2、unix socket 清理；有 Node 时再验 `nix/obs-cdp-bridge.mjs` 的 WS 握手（独立算 `Sec-WebSocket-Accept`）+ `Profiler.*` + ping/pong（无 Node 打印 SKIP） |

回归面（每次改动后）：`vuna fmt <改动>`、`vuna check .`、`sh nix/check-eff-boundary.sh`、
`sh nix/checks/ir-boundary.sh`、`vuna test --suite test/suite.toml --only 90/steps_native/107_observability --only 90/steps_native/108_obs_cdp`、
`checks.vuna-metrics`；`#line` 定稿后**一次** seed rotation（`sh nix/seed-rotate.sh ./result/bin/vuna`）。

## 10. 已知边界（开放项）

- 表达式级 / 分支级 span：Core 只有 `TVar` 带 span（debt D80），当前只能到「定义级 + 采样」。
- **只有两个阶段跨度为真插桩**：`vuna.elab` / `vuna.codegen.check`（+ level 2 的
  `vuna.def.elab`）。`vuna.load` / `vuna.iface.*` / `vuna.codegen.split` / `vuna.cache.*` 等
  是保留名（§3.3），**没有探针点**：缓存命中判定与 split 都在 `Eff hostRow` 里，纯 `span`
  包不住执行（需 `obsMarkEff` 这类跨效应标记，尚未接）。
- **计数事件一个都没接**：`ph:"C"` 的构造与 `vuna obs` 的消费都就绪，但 `Core.Eval`
  的 `force`/`primReduce` 探针会显著改热路径，待做且要先量代价（`vuna.counter.steps` 同理）。
- 多 domain 采样（debt D41）、`Unix.getrusage`（OCaml 5.5 无，debt D81）。
- wasm/native 的 span 与采样（O12）。
- `serve --cdp` 是**离线**的：数据源是已有的 trace 文件，不是附加到运行中进程做 live 采样
  （实现 `Vuna.Obs.Serve`；Chrome 侧经 `nix/obs-cdp-bridge.mjs` 的 WS 桥，vuna 侧不实现 WS）。
  因此它不是 DAP/调试器，也没有 `Runtime.evaluate` / `Debugger.*`；CDP 只覆盖 Profiler 子集。
- trace 与缓存：trace 永不进对象库（O5），因此「同一输入两次构建的 trace 不可比较字节」是设计
  而不是缺陷——比较用 `summarize --baseline`。
