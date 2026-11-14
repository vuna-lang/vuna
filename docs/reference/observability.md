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
| 2 | + 逐定义 span + `dbg!` 日志事件 | 每定义两次时钟读（compiler 约 6k def） |
| 3 | + CPU/内存采样 + 步数计数 | 采样 1%/默认 1 ms；步数计数按 §6 实测决定档位 |

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

- 编译链：`vuna.load`、`vuna.parse`、`vuna.resolve`、**`vuna.elab`**（整段精化的汇总跨度）、
  `vuna.elab.sigs`、`vuna.elab.datas`、`vuna.elab.traits`、`vuna.elab.instheads`、
  `vuna.elab.bodies`、`vuna.elab.instbodies`、`vuna.elab.tail`、`vuna.iface.compute`、
  `vuna.iface.write`、**`vuna.codegen.check`**（codegen 前置校验段）、`vuna.codegen.split`、
  `vuna.codegen.unit`、`vuna.cache.lookup`、`vuna.cache.write`、`vuna.check`、`vuna.build`、`vuna.link`；

- 逐定义：`vuna.def.elab`、`vuna.def.lower`、`vuna.def.text`（`args.def/module/file/line`）；
- 计数（`ph:"C"`，`args.value`）：`vuna.counter.core.reduce`、`vuna.counter.core.force`、
  `vuna.counter.meta.solve`、`vuna.counter.cache.hit`、`vuna.counter.cache.miss`、
  `vuna.counter.steps`；
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
- `OUTDIR/vuna-symbols.json`（仅 `compile` / `build` 写）：`{schema:"vuna-symbols 1","defs":[{"def","ocaml","file","line"}]}`，
  给无 DWARF 场景做符号映射（`perf script` 后处理 / 外部采样器）。

## 6. 成本纪律

- 关闭路径：`dtp_obs_level` 是 lazy CAF；`dtp_obs_span` 关闭时只 `f 0`；`counter/log/mark`
  关闭时直接 `0`。都不分配、不读时钟、不碰文件。
- 打开时事件走 `Buffer`（256 事件或 `sampleStop` / `at_exit` flush），写失败只警告一次并降级
  丢事件（**不中止程序**、不改退出码）。
- 采样：`SIGPROF` handler 只 `Printexc.get_callstack 32` + 存进固定 8192 槽环形数组，停止时
  批量序列化（handler 里不做 I/O、不做格式化）。环形满即丢弃后续样本。
- 步数计数（`vuna.counter.steps`，level 3）只在 `Core.Eval` 的 `force`/`primReduce` 入口自增：
  代价实测 >25% 墙钟时降级为「按定义聚合的一次性计数」并把数字写回本页。
- **绝对读数只用 `VUNA_OBS=0`**；obs 只用于归因与相对比较（同 [performance.md](performance.md) §2 纪律）。

## 7. 工具链 `vuna obs`

```console
vuna obs run [--level N] [--sample cpu|mem|both] [--interval US] [--out FILE] [--] <cmd...>
vuna obs summarize [--json] [--baseline FILE] [--threshold PCT] [TRACE...]
vuna obs convert --to cpuprofile|speedscope|folded|jsonl [--out PATH] TRACE
vuna obs render [--out FILE] TRACE
vuna obs merge [--out FILE] TRACE...
vuna obs validate TRACE
vuna obs symbols [--out FILE] [OUTDIR]
vuna obs serve --cdp ADDR [--allow-slow]
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
- `convert`：`cpuprofile`（CDP Profile：`nodes/startTime/endTime/samples/timeDeltas`，节点按
  `name@file:line` 去重）、`speedscope`（`$schema: "https://www.speedscope.app/file-format-schema.json"`
  evented profile）、`folded`（`name;name;name N` 火焰图折叠栈）、`jsonl`（重排/裁剪）。
- `render`：单文件 HTML（内嵌 JSON，无外链、无时间戳，两次渲染逐字节一致；瀑布条 + 火焰图 +
  计数器曲线 + 采样热点表），风格沿 `Vuna.Doc.Html` 的可复现约定。
- `merge`：多 trace（workspace 成员 / 每进程一份）按 `t0` 归并，`pid` 搬进 `args.member`。
- `serve --cdp`：`Profiler.enable/start/stop/getProfile` + `Runtime.getIsolateId` 子集，传输
  `Content-Length` JSON-RPC（同 `Vuna.Json.Server`）。Chrome DevTools 需要 WebSocket：
  `nix/obs-cdp-bridge.mjs`（Node，工具侧资产）做握手桥；**vuna 侧不实现 WS**（O11）。

## 8. 外部生态

| 生态 | 接入 | 状态 |
| --- | --- | --- |
| Chrome / Perfetto | `vuna obs run` 产出的 JSONL 直接拖入 | 规范格式 |
| `.cpuprofile` | `vuna obs convert --to cpuprofile` | 采样栈 → CDP Profile |
| speedscope | `vuna obs convert --to speedscope` | evented profile |
| 火焰图 | `--to folded` + `flamegraph.pl`（nixpkgs `FlameGraph`） | 手动 |
| Linux perf | `#line` → `.debug_line` 直接指向 `.vuna`；`vuna-symbols.json` 兜底 | 手动，见 `nix/obs.sh` |
| gdb | `#line` + `-g`：`list` / `bt` 给出 `.vuna` 行 | 手动 |
| OCaml `Runtime_events` | **不接**：GC/调度器事件与 vuna span 时间基准不同，先只做 `Gc` 计数器 | 非目标 |

`perf` / `gdb` / `valgrind` **不在**默认 devShell（避免构建图变重）；`nix/obs.sh` 在缺工具时
给出可操作提示，`perf record` 需要 `perf_event_open` 权限，Nix 沙箱常拒 ⇒ **perf 路径不进
`nix flake check`**，只做手动验证。

## 9. 门禁与测试

| 位置 | 断言 |
| --- | --- |
| `nix/checks/vuna-obs-schema.sh` | `VUNA_OBS=2 vuna check compiler` 与 `base` 各一次：`vuna obs validate` 通过 + `summarize --json` 结构非空 |
| `nix/checks/vuna-obs-dwarf.sh` | `build --no-compile --out` 后 `readelf --debug-dump=decodedline` 至少一个 `.vuna` 文件；`vuna-symbols.json` 可解析 |
| `nix/checks/vuna-obs-overhead.sh` | 关闭口径对未插桩基线 ≤3%（合成 500/1000/2000/4000 def，独立进程、每档 3 次中位）；1/2/3 级读数只打印不设硬门槛 |
| `checks.eff-boundary` | 新增探针全部走隐藏原语（`runPure` 基线仍为空） |
| suite `106_observability.steps` | 关闭零输出/产物逐字节不变、`dbg!` 协议不变、span 配对、逐定义事件、`#line` 产物与 DWARF、回栈 `.vuna`、CPU/内存采样、三种换算结构、渲染可复现、CDP 往返 |
| `checks.vuna-metrics` + `nix/codegen.baseline` | `#line` 后按实测重标定（精确基线） |

回归面（每次改动后）：`vuna fmt <改动>`、`vuna check .`、`sh nix/check-eff-boundary.sh`、
`sh nix/checks/ir-boundary.sh`、`nix run .#vuna-run-tests -- --only 106/34/46/65/33/38`、
`checks.vuna-metrics`；`#line` 定稿后**一次** seed rotation（`sh nix/seed-rotate.sh ./result/bin/vuna`）。

## 10. 已知边界（开放项）

- 表达式级 / 分支级 span：Core 只有 `TVar` 带 span（debt D80），当前只能到「定义级 + 采样」。
- 多 domain 采样（debt D41）、`Unix.getrusage`（OCaml 5.5 无，debt D81）。
- wasm/native 的 span 与采样（O12）。
- trace 与缓存：trace 永不进对象库（O5），因此「同一输入两次构建的 trace 不可比较字节」是设计
  而不是缺陷——比较用 `summarize --baseline`。
