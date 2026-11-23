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
| `lint`（workspace） | ~1.9 s（本机；无结果缓存；4000 条合成 finding ~5 s） |
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
[`bench/baselines/compiler.txt`](../../bench/baselines/compiler.txt) 的
同机口径比较；跨机器只比 §5 的增长率。**该基线是旧口径，尚未按本轮修复重标。**

### 产物规模（三端，`bench/artifact.sh`）

`nix run .#vuna-artifacts -- --json bench/baselines/artifacts.json` 用固定输入测三端产物，
基线在 [`bench/baselines/artifacts.json`](../../bench/baselines/artifacts.json)。用例按规模分档：
`hello`（最小 hello world）、`defs-{10,100,1000}`（单文件顶层定义数）、`mods-{10,100}`
（包内模块数）、`self`（`packages/compiler`；wasm 后端不支持编译器目标，基线里记 `skip_reason`）。

口径：

- 中间文本：`.ml`（ocaml）/ `.s`（native）/ `main.wat`（wasm）的**文件树**、文件数、字节、行数；
- 最终二进制：`prog`（ocaml / native）与 `main.wasm` 的字节；
- 构建：`codegen` = `vuna compile`，`toolchain` = `ocamlopt` / `cc` / `wasm-tools parse`，
  `postprocess` = `wasm-opt`（非 wasm 目标为 0），`toolchain_warm` = `build.sh` 的实际顺序；
  括号里的三段依次是 `codegen_ms` / `toolchain_cpu_ms` / `postprocess_cpu_ms`（user+sys
  CPU 毫秒，墙钟另记在 JSON，宿主负载波动时只看 CPU）。wasm 的两段外部工具是
  `wasm-tools parse`（汇编）+ `wasm-opt`（binaryen 优化）；JSON 里另记
  `build.postprocess_ms` / `build.postprocess_cpu_ms` 与 `build.toolchain_warm_*`，
  meta 记 `wasm_opt`（汇编工具版本在 `wasm_tools`）。

生成物不含绝对路径/时间戳，工具链由 flake 固定，所以**尺寸与二进制大小跨机器可比**
（5% WARN / 20% FAIL，FAIL 退出 1）；**时间只同机可比**（20% / 50%，软判定：只报告，
基线 <100ms 的行不判定）。下表是同机一次读数（16 核，`--runs 1`，基线 meta 的 loadavg = 5；全量矩阵见 JSON）：

| 用例 | 后端 | 文件数 | 文本字节 | 行数 | 二进制字节 | CPU ms（codegen/toolchain/postprocess） |
| --- | --- | --- | --- | --- | --- | --- |
| minimal | ocaml | 33 | 184,791 | 3,259 | 2,804,048 | 258 / 1,526 / 0 |
| minimal | native | 2 | 124,738 | 6,771 | 49,808 | 223 / 63 / 0 |
| minimal | wasm | 1 | 382,446 | 15,176 | 485 | 244 / 10 / 39 |
| hello | ocaml | 34 | 188,638 | 3,297 | 2,826,816 | 257 / 1,536 / 0 |
| hello | native | 10 | 304,484 | 14,741 | 92,968 | 240 / 90 / 0 |
| hello | wasm | 1 | 406,037 | 16,129 | 2,698 | 244 / 9 / 58 |
| defs-1000 | ocaml | 33 | 338,147 | 7,259 | 3,817,280 | 216 / 1,682 / 0 |
| defs-1000 | native | 2 | 517,982 | 28,767 | 197,416 | 388 / 81 / 0 |
| defs-1000 | wasm | 1 | 592,523 | 24,167 | 37,930 | 345 / 13 / 7,870 |
| mods-100 | ocaml | 133 | 199,287 | 3,659 | 3,049,032 | 431 / 4,614 / 0 |
| mods-100 | native | 102 | 184,381 | 9,267 | 68,784 | 218 / 260 / 0 |
| mods-100 | wasm | 1 | 408,617 | 16,067 | 5,807 | 237 / 9 / 364 |
| self | ocaml | 162 | 6,028,075 | 57,071 | 19,331,352 | 5,314 / 18,252 / 0 |
| self | native | 139 | 21,906,723 | 916,076 | 5,262,176 | 9,052 / 1,588 / 0 |

wasm 的 `.wasm` 是两段工具的产物（`wasm-tools parse` → `wasm-opt -O3`），多数形状比汇编后小
一个数量级（`minimal` 46,939 → 485 B、`hello` 50,393 → 2,698 B、`mods-100` 52,138 → 5,807 B），
但 `defs-1000` 只从 86,913 降到 37,930 B——单个巨型 `_start` 的收益小得多。`main.wat` 文本列
不受优化影响。`postprocess` 一列是 `wasm-opt` 的 CPU 耗时：`minimal` 39 ms、`hello` 58 ms、
`defs-10` 40 ms、`mods-10` 42 ms；`defs-100` 360 ms、`mods-100` 364 ms；`defs-1000`
（1000 个顶层零参定义 + 单个巨型 `_start`）要 **7.87 s**——`-O3` 在这里多轮跑
`precompute-propagate` / `optimize-instructions` / 内联。需要绕开时用 `--wasm-opt 2`
（同一模块 0.14 s，产物 28,973 B；`-O3` 是 37,930 B）。

native 的纯程序不再带机器（D110 已关闭）：`minimal` 2 个 `.s` / 121 KB、`defs-1000`
2 个 / 505 KB、`mods-100` 102 个 / 179 KB；`hello`（最小效应程序，带 Console handler）
是 10 个 `.s` / 297 KB。

读法：

- `minimal` 是**绝对地板**（最小可执行程序，纯 Int）：runtime + 最小 base 闭包，
  ocaml 33 个 `.ml` / 185 KB、native 2 个 `.s` / 121 KB、wasm 382 KB WAT（`.wasm` 是
  `-O3` 输出，485 B）。
- `hello` 是**最小效应程序**（一次 Console 打印）：多一层 `Base.Effect.Core` 的 handler 面
  （`Fs`/`Net`/`Process`/`Clock` …）⇒ ocaml 34 个 `.ml` / 189 KB、10 个 `.s` / 297 KB、
  wasm 397 KB（WAT，优化后 2,698 B）——比 `minimal` 多 8 个 `.s` / 176 KB 而源码只多 6 行：
  产物大小由闭包决定。
- `defs-*` / `mods-*` 分别加顶层定义与包内模块：ocaml 文件数 33（定义不变）、43→133（模块），
  文本随规模线性（defs 186→199→338 KB，native 128→175→505 KB）；wasm 始终单文件。
- `self` 是真实最大负载：ocaml 162 个 `.ml` / 6.0 MB / 5.7 万行 → 19.3 MB 可执行
  （`-g`，含调试信息）；native 139 个 `.s` / 21.9 MB / 91.6 万行 → 5.0 MB 静态 ELF。
  逐帧保守扫根替掉逐 call 栈图后产物减半；闭包面的改动在同一基线上再把文本 23.9 → 21.9 MB
  （`call rt_apply` 604 → 484、静态闭包 495 → 942）。
  tree-shaking 已由 `Ir.Analysis.reachableDefs` 做完（编译器自身只有 13 个函数 / 240 行未被引用）；
  标量算术的指令选择与窥孔已落地（`Native.Select`），零参别名已在调用点直调，闭包只捕获
  自由变量且调用点能静态解析的不再走 `rt_apply`；闭合函数值实参已做高阶参数特化
  （[native.md](native.md) §3.5），已知小函数的调用点已内联（§3.6），标量表达式延时
  wrap（§3.8），循环携带的标量槽提到 callee-saved 寄存器（§3.7），守卫推导的区间事实
  省掉可证明多余的 wrap 与非负常量除法的符号修正（§3.10）；剩余体积/墙钟空间在带捕获
  的高阶参数、分配与复制合并 / 32-bit 窄化（[debt.md](debt.md) D129）。产物作为自举锚点的取舍见
  [bootstrap.md](bootstrap.md)「锚点演进」。

OCaml 二进制里的调试信息记录的是**相对**源码名（`build.sh` 先 `cd` 到产物目录、用相对模块名
编译、输出名固定），因此二进制字节不随构建目录漂移；native ELF 依赖链接工具版本，但
`cc`/`ld` 由 flake 固定，同 arch 内可比。

### wasm：`wasm-opt -O3` 前后的运行时间

13 个可跑 wasm benchmark 的运行时变化（Node 24，7 次取中位数，产物输出与基线逐字节一致，
`wasm-tools validate --features=gc,bulk-memory,tail-call,reference-types,multi-value` 全部通过；
明细表见 [wasm.md](wasm.md) §1.1）：

- **有增益**：arith −45%、hashmap −25%、nat_bits −20%、treemap −18%、eff_tick −18%、
  records −5%、queue ~0%、string_ops / traits / eff_deep / eff_bracket 0..−8%；
- **中性到更差**：`float_math` 与 `tco_mutual`；
- **产物**：arith 47.1 → 0.55 KB、nat_bits 48.3 → 1.1 KB、hashmap 48.3 → 3.7 KB、
  eff_tick 55.3 → 15.3 KB（`.wasm`，`-O3` 后）。

**口径提醒**：增益几乎全来自 binaryen 的内联 + DCE，不是指令选择。关掉内联
（`--always-inline-max-function-size 0 --one-caller-inline-max-function-size 0`）后 arith
只剩 −4%，`float_math` +45%、`tco_mutual` +36%。所以本页的「后端表示 / codegen 优化」类
改动（如零参别名直调、[wasm.md](wasm.md) §2.1 的标量 ABI）必须以 `--wasm-opt 0` 或关内联
的变体作对照测量，否则 binaryen 会掩盖后端自身的效果。

上面报的是 `build.sh` 的**直接产物**（带 `-g`）。装进 store 的插件二进制在 nix 打包时
`strip`（去掉 `.symtab` / `.debug_*`，单文件小 ~25%，`vuna` 输出目录 102 MB → 77 MB）：
vuna 的运行时报错与回栈标签来自 `dt_def_locs` 数据表和 `-g` 编进 `.data` 的 frametable，
不依赖 ELF 符号表，剥离后仍打印 `名字 (文件:行)`；要 gdb 级调试就在源码树里自己重编。

### 槽 kind 分布（GC 根集模型的输入）

`nix run .#vuna -- dev ir dump --after repr|repr-cps <带入口的包>` 用
`Vuna.Target.Native.Repr` 把 binder 槽与值位置归到 ptr / static / scalar / unknown，
未知按来源（类型变量 / opaque / 缺类型 / 未归类符号）与绑定位置（lam / let / alt）拆开；
缺类型的 binder 按绑定点推断（`let` 的 scrutinee、`case` 构造子字段、Nat 分支）。
`packages/compiler`（`self` 负载）的读数：

| 形态 | binder 槽 | ptr | scalar | unknown（opaque / missing / var） | 需要清零 |
| --- | --- | --- | --- | --- | --- |
| lowering 后 | 44,895 | 32,518 | 4,530 | 7,847（3,865 / 3,982 / 0） | 89% |
| CPS 后 | 45,835 | 32,585 | 4,528 | 8,722（3,865 / 4,857 / 0） | 90% |

值位置（含实参临时槽）在 lowering 后 236,943 个、unknown 4.9%；CPS 后 239,448 个、
unknown 39%（其中 missing 89,339）——CPS 合成的节点不带宽类型槽。

CPS 后缺 kind 的 binder 按位置是 `lam=4,824 / let=0 / alt=33`：几乎全在 lambda 形参
（CPS 合成的续延/闭包参数），`let` binder 已能被绑定点推断覆盖。缺 kind 的值位置是
`var=6,392 / app=69,663 / other=13,284`。`packages/cli`（路由 CLI，不含编译器闭包）
的 binder unknown 是 55%（lam=1,690）。

读法：GC 沿 `rbp` 链整帧保守扫根（[native.md](native.md) §5.2），不按这里的 kind 过滤，
也不按活跃性裁剪：未装箱标量、实参临时槽、case scrutinee 都会被扫一遍。「已死槽」是例外：
`Native.Live` 在递归 / 带回边的函数里对**指针 kind** 的槽在最后一次读之后写 0（[native.md](native.md) §3），
所以死对象不再钉到帧返回；这份 kind 分类仍只由 `vuna dev ir dump` 报告，供移动/压缩
（需要区分「确定指针」与「保守候选」）评估；两代回收的边界由块头的老代位与写屏障决定，
不依赖槽 kind。
`IrTyVar` 在这两个程序里都是 0；CPS 合成的 lambda 形参（没有源码类型可必填）与 opaque
是 kind 不确定的主要来源。表的「需要清零」是历史统计，保留作 kind 分布的读数。

### 冷 / 热必须分开报

§1 的「典型值」是**热 store** 口径（默认根 `~/.vuna/store` 已预热），同一源码在**空
`VUNA_STORE`** 上会差一个数量级。同机（16 核，`nix build .#vuna` 产物，单进程，
无 `--debug-perf`、`VUNA_OBS=0`）：

| 命令 | 冷（空 store，修前） | 冷（空 store，修后） | 热（同 store 第二遍） |
| --- | --- | --- | --- |
| `check packages/base` | ~0.40 s | ~0.40 s | ~19 ms |
| `check packages/compiler` | **21.6–23.6 s** | **11.4–13.4 s** | ~51 ms |
| `check .` | 冷 21.8 s → 0.23 s（两段收敛） | 同左 | 58 ms |
| `map` | 2.2–2.5 s | 2.2–2.5 s | 0.16–0.17 s |
| `build --no-compile compiler` | ~12–28 s（见下） | ~13 s | ~150 ms |

空 store 复核（导出面判据 + 去两处死扫描 + 阶段探针）：同机空 store 冷
`check packages/compiler` 13.0–14.2 s、热 47 ms；`collectSigs-done` = 1、`iface-write=107/107`、
`check-lib-skip covered=88`。绝对读数只作同机同窗口参考。

`check .` 的成员按依赖分层跑（见 §4 第 10 条），因此冷跑之后**第二遍就全命中**
（实测 21.8 s → 0.23 s，只两段）。冷 `check packages/compiler` 修前 ~22 s 里约**一半是重复精化**：
入口闭包没覆盖 `[export]` 的全部模块
（`iface-skip partial ... missing=Vuna.Compiler.Frontend.Canonical.Ast,
Vuna.Compiler.Driver.ToolPayload`），于是每轮都补一遍 lib check（`collectSigs-done` 出现
两次，两遍各 ~11–12 s）。**已修**（见下），冷 `check packages/compiler` 降到 ~12 s；后又修了
同一类的第二处（`IrDump` / `Ir.Render` 搬进 cli 包），当前 ~10.8 s，门禁
`checks.vuna-single-pass`。

冷 `build --no-compile compiler` 的墙钟**极不稳定**（同机同源码实测 12.5–38.1 s：按直接依赖
分层并行，且 `TMPDIR` 里的临时候选产物会让同一 `--out` 的第二次调用假快）：只报 user+sys，或同时报 loadavg。

### 重复工作与按名线性扫表（已消除）

冷 `check packages/compiler` 21.6→11.4 s、合成探针 2321→397 ms、未使用告警探针
7693→744 ms、脏模块增量探针 4233→3116 ms，产物逐字节不变。这类开销只有两个形状：
同一份工作做两遍（精化、包接口、告警扫描），和按名线性扫表——后者统一成「入口一次建
哈希索引 + 逐项 `member`」：

- SCC 组间定序（`Ir.Analysis.orderGroups`）与 codegen 分组（`Lowering.Program` 的 `lwDefTbl`）；
- `recOkOfIn` / `spanOfIn`、`Dt.dedupGlobals`、`Elab.Termination.anyOwn`、告警去重与未使用
  定义扫描（`Diagnostics.Sink` 的 `sameDiag` 键表、`Dt.warnUnusedDefsGo`）；
- 包接口只读一遍（`ownCleanInfo` 传给 `writePackageIface`）。

入口 import 必须覆盖 `[export]` 全部模块（否则 `iface-skip partial`、每轮补一遍 lib check）；
回退护栏是 `nix/checks/compiler-growth*.sh` 的相邻档增长率门槛，绝对读数与分段构成见 §5 / §6。
## 2. 探针设施：`dbg!` 日志行 + `VUNA_OBS` 结构化观测

分两层，**两套独立开关**；绝对读数只用「都关闭」的口径（见 §7）：

| 层 | 开关 | 输出 | 形态 |
| --- | --- | --- | --- |
| 日志行 | `--debug-perf` / `VUNA_DEBUG_PERF=1` | stderr | `DEBUG <epoch-us> <text>`，相邻两行相减 = 阶段耗时 |
| 结构化观测 | `VUNA_OBS=1..3` / `--obs` / `--obs-level N` | Chrome Trace Event JSONL | `ph:"X"` 跨度（自带 `dur` 与 `args.allocWords`）、`ph:"C"` 计数、`ph:"i"` 日志与采样栈 |

结构化观测是**语言层**能力（任何 vuna 应用可用），完整规范见
[observability.md](observability.md)；本页只讲「用它来量编译器」：

```console
VUNA_OBS=2 VUNA_OBS_DIR=$PWD/trace vuna check packages/compiler      # 阶段跨度 + 逐定义
VUNA_OBS=3 vuna build --no-compile --out OUT compiler       # + CPU/内存采样
vuna dev obs summarize trace/vuna-*.jsonl                       # 阶段自用/总用时表
vuna dev obs run --level 2 -- vuna check packages/compiler                # 一步到位
vuna dev obs convert --to folded --out f.folded trace/*.jsonl   # 火焰图
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
核心求值不执行 tracing / 观测（原语归约为 no-op），输出只发生在 compile+run 的 runtime。

结构化观测的成本纪律（关闭路径、事件缓冲、采样开销的实测口径）在
[observability.md](observability.md) §6；那里也有 `#line` 让 `perf`/`gdb` 直接看到
`.vuna` 的配方（本仓库的 `perf`/`gdb` 不进 devShell，属于手动验证路径）。

## 3. 查找表：泛型 `Base.Container.HashMap k v`

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

## 4. 仍然存在的热点

冷 `check packages/compiler` ~10 s（修后）的阶段构成（`--debug-perf` 时间戳相减，单次采样）：
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
   （§5.2 的 8000 档 3116 → 1067 ms）。
2. **load/parse 前缀 ~4.0 s（冷 store，含 iface 摘要读取）**：`check packages/compiler` 的闭包要
   解析 181 个模块；冷 TMPDIR 还含 lex 载荷写。前端本身（lex + 语法分析）在 `VUNA_OBS=1`
   下可单独归因：冷 `check packages/compiler` = `vuna.parse.lex` 335 次 / **212 ms** +
   `vuna.parse.syntax` 335 次 / **105 ms**（≈0.32 s，见 §6.1）。剩下的前缀耗时在 iface
   摘要、地址计算与 flatten，不在词法/语法。
3. **冷 build 的 elab bodies**：`build --package vuna .` 的 6159 def 约 3.1 s
   （`--debug-perf` 口径），集中在 `conv`/`force`/`infer` 的项重算与分配
   （`Term/Impl`、`Core/Eval|Conv`）。每 def 的定义值记忆化已否决（安全前置检查比命中收益
   更贵，A/B -2~3%）；更深的共享需要参数相关记忆化，未做。
4. **冷 build 的 load/parse ~2.6 s + codegen split ~0.6 s**（`--debug-perf` 单次采样）：
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
8. 已修热点（不要重复排查，读数见 §1）：**`Dt.dedup*` 的 O(n²)、`Termination.anyOwn` 的
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
   的第二遍也因此从 6.1 s 降到 0.23 s（**两段收敛**，见 §1）。成员依赖来自
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
   （`check .` 全树口径，含成员子进程；与 §4 第 7 条的单包 1.1e9 不可直接比）。
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
| `Impl.vuna` 的 `ctorIdentitySpine` | 无字段构造子（`Nothing` / `Nil`）的等长恒等脊被排除，每个实例先建元变量再整树 conv | `length args <= k`，族参数直接取自期望类型（构造子密集探针 750 → 710 ms） |

读数（16 核、空 store、与「处置前源码」构建的编译器同窗口交替、各 8 次最小）：

| | 冷 `check packages/compiler` 墙钟 | user | 热 `check packages/compiler` |
| --- | --- | --- | --- |
| 处置前 | 14.31 s | 14.03 s | 49 ms |
| 处置后 | 14.24 s | 13.96 s | 49 ms |

**净效果 ≈0.5%，在噪声内**（同窗口抖动 ±0.3 s）。热路径与处置前一致；早期用更旧的
编译器做基线时看到的「热路径 +4 ms」来自 main 自己的提交，不是这些改动。

结论要写清：分配的最大单项是 `vuna.elab.term.body`（1.5 GB / 全跑 16%，见第 7 条），
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


### 4.1 逐定义精化与 codegen 检查的分段（span 口径）

`VUNA_OBS=1`、空 `VUNA_STORE`、单进程冷跑 `check packages/compiler`（整跑 5.9 s；绝对数随
机器负载浮动，看份额即可）。`vuna.elab` 的账已闭合到毫秒级残差：下表各段之和等于
`vuna.elab`（2193 ms 对 2200 ms），`vuna.codegen.check` 是它的**兄弟**跨度，不再被算进精化：

| span | 耗时 | 占 `vuna.elab` | 说明 |
| --- | --- | --- | --- |
| `vuna.elab` | 2.20 s | 100% | 整段精化 |
| `vuna.elab.bodies` | 1.49 s | 68% | 逐定义精化（`vuna.def.elab` 6326 次；其子跨度 `vuna.elab.term` 正文检查 ~1.3 s） |
| `vuna.elab.tail` | 0.32 s | 15% | 收尾：`vuna.term` 0.24 s、`usage` 0.049 s、`rezonk` 0.008 s、`extra`/`main.show` ~0.004 s |
| `vuna.elab.rast` | 0.149 s | 7% | `toRastDecls`（AST → RAST） |
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

pending 队列规模分桶（`elab.dict.pending.b*`，走 `--debug-perf` 的 `counters=` 行）：
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

### 4.2 名字解析（`vuna.resolve` 窗口）的分段读数

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

| n | 修前（同探针） | 修后（插入排序） | 当前（混合归并） | 当前 / 翻倍 |
| --- | --- | --- | --- | --- |
| 1000 | 237 ms | 231 ms | 266 ms | — |
| 2000 | 504 ms | 435 ms | 329 ms | 1.24× |
| 4000 | 1395 ms | 1115 ms | 516 ms | 1.57× |
| 8000 | 4233 ms | 3116 ms | 1067 ms | 2.07× |

门槛计时必须**改一行再测**：无改动的第二次 check 只走缓存，读数只有 ~20 ms 且与 N
全无关（N=1000/2000/4000 都是 20 ms），门槛永远绿、什么也守不住。改一行后读数走真实
增量路径（上面这张表）。

剩下的 ~2.1×/翻倍来自与 N 无关的固定成本 + 接口哈希的规范化载荷（`shaText`/编码）随规模
线性增长；此前 2.5–2.8× 的来源是**接口哈希按语义键文本的插入排序**——`Base.Data.Sort.sortBy`
改成混合归并后消失（N=8000 档 3116 → 1067 ms，`check packages/compiler` 的冷读数同窗口
不变）。门槛仍按每翻倍 ≤3.3×（比单文件 2.5× 宽：增量路径有与 N 无关的固定成本，小 N 噪声更大）。

### 5.3 嵌套类型构造子（运行时类型渲染）

`x : Maybe (Maybe … Int)`（`x = Nothing`）与 `data W where MkW : <同深类型> -> W` 的
`check` 成本必须随嵌套层数线性。`Lowering.Ty` 的渲染器过去先把族实参渲染成 `List IrTy`
交给 intrinsic 探测（`Array` / `IORef`），非 intrinsic 族再把这份结果丢掉、由
`renderFamilyArgs` 重新渲染同一批实参 ⇒ 每层乘 2。改成按需渲染的探测
（`renderTyIntrinsicWith`）后，同一批次读数（`VUNA_OBS=2` 的 `vuna.codegen.unit`）：

| depth | 修前 | 修后 |
| --- | --- | --- |
| 16 | 14 ms | 7 ms |
| 18 | 38 ms | 7 ms |
| 20 | 143 ms | 5 ms |
| 22 | 430 ms | 5 ms |

冷 `check` 的总墙钟同口径：depth 30/40/80/100 = 270/262/196/194 ms（固定成本占主导）。

判据（防止再误判成精化期问题）：把同样的嵌套换成 intrinsic 族
`Array (Array … Int)`，成本本来就平（depth 22 ≈ 5 ms）——两者在精化期走同一条
`EApp` 类型名应用路径，差异只可能来自 lowering 的 intrinsic 探测。`axiom x : <深类型>`
不触发（axiom 不进 lowering），不能当对照。

门槛：`nix/checks/compiler-growth.sh` 的 `depth=32/64` 探针（每档独立空 store，
`VUNA_GROWTH_TIMEOUT` 兜超时）。回归时 depth 32 的 2^32 成本会直接超时失败。

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
全文词法（每次 check 都跑）、`vuna.parse.syntax` 是 token 流 → AST、`vuna.parse.cst`
是无损 CST 组装（工具侧）。

冷 store、`vuna dev obs summarize` 单次采样（`check packages/base` 总量小、噪声占比更高）：

| 目标 | `vuna.parse.lex` | `vuna.parse.syntax` | 参考：冷墙钟 |
| --- | --- | --- | --- |
| `check packages/base` | 142 次 / ~18 ms | 142 次 / ~9 ms | ~0.42 s |
| `check packages/compiler` | 335 次 / ~212 ms | 335 次 / ~105 ms | ~5.3 s（无 obs 口径；obs 口径 elab ~2.1 s） |

三条结论：

* lex : syntax ≈ 2:1，词法仍是前端里更贵的那一半（`src` 扫描 + token 构造）；
* `syntax` 次数 ≈ 模块数的 **2 倍**（base 142 / 71、compiler 335 / 181）：加载一次 +
  `ifaceModsEff` 的 header 解析一次。闭包扫描原先在「摘要判定」「写 iface 影子」
  「干净模块判定」各跑一遍，已全部合并到检查入口的那一次；
* 前端整体约占冷 `check` 的 **6%**（0.32 s / 5.3 s）：减少**次数**（债 D88 剩余的那一次
  复用）比加快单次解析收益更直接。

增长率门槛 `checks.vuna-frontend-growth`（合成 N 个同形定义，相邻档 ≤2.5×；本机）：

| N | `parse.lex` | `parse.syntax` | `fmt --check`（改前 → 改后） |
| --- | --- | --- | --- |
| 2000 | 11.9 ms | 7.9 ms | 77 → 70 ms |
| 4000 | 17.4 ms | 15.2 ms | 119 → 106 ms |
| 8000 | 25.7 ms | 18.3 ms | 168 → 154 ms |

**注释只扫一遍**：`Frontend.Lexer` 现在有两条入口——token 路径（`lexChars`，不分配注释）
与注释路径（`lexSourceWithComments`，一次扫描同时给出 token 与注释）。旧实现另有
`scanComments` 并行扫描器（自己再实现「字符串里不算注释」），fmt / index / doc / LSP 都要
`parse` + `lexComments` 两遍；现在走 `parseSourceDetailed`，只付一次词法（上表
`fmt --check` 的 ~8% 即来自这里）。token 路径保持零分配：把注释收集并进 token 路径（每个
token 一次 `Pair`）的初版实测让 `vuna.parse.lex` 慢 ~20%，已放弃。

**工具不等二遍词法**：lint / doc / index 曾为取 fixity 或按 token 边界切原文把同一份源码
再解析 / 再词法一遍。`parseSourceDetailed` 一次交出注释表与词法 token 流，
`Flatten.fixitiesFromParsed` / `FixityEnv.fixitiesForParsed` / `Lint.Rules.lintParsedWithConfig`
都吃这份产物；fmt 的 trivia 流由 `Cst.lexTokensOf` 纯组装（组装成本只由需要它的 fmt / LSP 付）。
本机热 store（workspace + examples，7 轮取最小）：`fmt --check` 966 → 704 ms、
`lint`（workspace）2778 → 2419 ms；单文件（`Elab/Term/Impl.vuna`）`fmt` 143 → 127 ms、
`lint` 234 → 204 ms。

**建树事件的价格**：`parseSourceDetailed` 现在同时带回建树事件（`PState.tokIndex` +
`pendEvents`，每个解析点两处 cons）。同一口径对照（新 / 旧二进制，9 轮取最小）：
`fmt --check .` 0.696 → 0.728 s、`fmt --check packages/compiler` 0.345 → 0.355 s、
单文件 fmt 0.113 → 0.115 s，`check packages/compiler` 不变（0.10 s，严格路径不读事件）。
约 1–4%，代价只在 `PmTool` 的解析里；`parseSourceDetailed` 的调用方（fmt / lint / doc /
index / LSP）都按需建树，纯 AST 消费者不受影响。

### 6.2 注释归属：树判据的等价性与价格

改 `Fmt.Comment` 之前先量了一件事：把「最内层条目」从扁平 span 启发式换成树的深度，
在真实代码上是否等价、是否更快。探针（一次性，不进仓库）对 `packages/` + `examples/` 的
**1530 个 `.vuna` / 30 350 条注释**逐条比对最终附件表（前置 / 行尾 / 文件末尾三种去向）：

| 指标 | 读数 |
| --- | --- |
| 归属结果不同 | **0** 条 |
| 实际走了「最内层容器」兜底的注释 | 139 条 |
| 这些兜底里两种判据给出不同容器 | **0** 条 |

顺带发现现在的 `innermostEnclosing`（`Comment.vuna`）文档写「起点最晚者（最内层）」，
实现里 `betterNext` 是严格 `<`，实际取的是**起点最早**（最外层）；因为兜底极少命中且命中时
容器都是声明本身，这个反了的判据一直没被观察到。树判据给出的是真正的「最深容器」。

价格（`fmt --check .`，同机交替）：不建树 0.72 s → 只换「最内层容器」0.84 s（**+16%**）；
再把锚点集合也搬到树（`treeAnchors` 按节点种类前序收集）**0.89 s（+24%）**，而整趟
注释归属（三条扫描 + trivia 提取）本身只值 ~0.18 s。两种接法的输出都**逐字节不变**
（1587 个文件的全量 fmt 结果摘要逐行相同）。

补一轮只测建树的读数（带节点 id 的树、交替 12 轮取中位）：**0.84 s → 1.00 s（+19%）**；
把整趟注释（归属 + 渲染）关掉则是 **0.84 s → 0.49 s**。树只要作为附加通道，就先吃掉
注释预算的三分之一，再谈替换。

结论：**树作为「附加通道」是净亏**——它在 AST 之外多付一次 O(tokens) 建树，只省掉
一到两条扁平扫描。AST 与树的 span 起点已经对齐（`import` / `export` 构造从修饰符起），
节点身份也已落在树里（分支先序 id + `nodeIndex` / `nodeIdAtOffset`）；所以下一步的替换是
让 AST **存 id**、span 从树查回，注释槽位直接以 id 为键，而不是再用一次行列比较。

结构上还有一个阻碍：注释锚点集合是**渲染器的挂载点**，不是纯语法种类。局部函数的
后续 clause 在树里同样是 `binding` 节点，但渲染器只给首条子句挂注释（其余子句没有
`attachAt` 调用点，挂上去就会丢注释）；`EAnn` 签名行在树里也是 `binding`。所以
「按种类从树收集锚点」不能替换 `anchorSpans`——要等 AST 投影：投影出来的值天然知道
自己对应哪个树节点，渲染器挂哪些值就用哪些 id，不需要再猜。

顺带落地的纯收益：注释附件槽从线性列表换成 `HashMap`（起点字节偏移为键），同机交替
15 轮配对均值 **-36 ms**（中位 0.814 → 0.780 s，约 **-4%**）；`fmt --check .` 与
`fmt --check examples` 逐字节不变。

条目节点种类（构造器 / 字段 / trait 方法 / case 分支 / 绑定 / 导出项）补进树本身在噪声内：
同机交替 11–15 轮取中位数，`fmt --check .` 0.775 / 0.777、`check .` 0.502 / 0.498、
`check packages/compiler` 0.121 / 0.121、`check packages/base` 0.048 / 0.047（前 / 后）。
树的结构不贵，贵的是**同一份信息存在两份**。

因此树的收益只能来自**替换**而不是叠加：把 AST 的表层构造子（括号 / 浮点原文 / 模板标记 /
`name!` / `[]` / `()` / 元组列表折叠 / 中缀与 section / `EAnn` / `ELocalFun`）交给树，
让 AST 变成纯投影（`architecture-target.md` D18 的第 2、3 步）。

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
- **产物尺寸与构建耗时分开报**：`bench/artifact.sh` 的尺寸（文本文件树/字节/行数、二进制）
  由 flake 固定的工具链生成、产物不含绝对路径与时间戳，因此**尺寸不需要冷/热口径、可跨机器比**；
  构建耗时仍只同机可比，宿主有负载时看 `*_cpu_ms`（user+sys）而不是墙钟。
- 用 `OCAMLRUNPARAM=s=...` 快速判断 GC 敏感性（注意：产物里 `Gc.set` 会覆盖环境变量，要
  比较不同 minor heap 大小得改代码重建）。
- 阶段定位优先用阶段边界的 `dbg!`；逐定义观察直接看 `dbg!` 行；不要用「等大 case 跑完」
  定位。
- 基准入口：`nix run .#vuna-bench`（手动，非 CI check），基线文件与软告警见
  [testing.md](testing.md)。

## 8. 其它基准

生成程序的**运行时**基准（`vuna-perf`：OCaml / native 同算法对拍、TCO 与 GC 验证项、
wasm 浏览器路径）见 [benchmarks.md](benchmarks.md)；编译器 / 工具链自身的**命令墙钟**、
编译热点与已量化否决的候选见 [compiler-benchmarks.md](compiler-benchmarks.md)。

## 相关阅读

- 规模不变量与边界：[type-system.md](type-system.md)、[primitives.md](primitives.md)
- 生成程序运行时基准：[benchmarks.md](benchmarks.md)
- 编译器 / 工具链基准：[compiler-benchmarks.md](compiler-benchmarks.md)
- 测试 / CI / bench：[testing.md](testing.md)
- 编译器结构：[compiler.md](compiler.md)、[core.md](core.md)
- 方法论技能：`.agents/skills/perf-debug/SKILL.md`
