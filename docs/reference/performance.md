# 性能工程（vuna 命令耗时）

本文覆盖：**怎么量**（探针设施与测量规程）、**当前读数**、**增长率与阶段构成**。查找表与
仍然存在的热点在 [performance-hotspots.md](performance-hotspots.md)。规模不变量与安全边界见
[type-system.md](type-system.md)（fuel / measure 站点）与 [primitives.md](primitives.md)
（原语与运行时语义），测试 / CI 口径见 [testing-checks.md](testing-checks.md)，方法论规程见技能
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
| `lint`（workspace，365 文件） | ~1.8–2.0 s（8 worker；无结果缓存） |
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

`lint` 的并行口径：父线程按目录解析包上下文、按 `contextDir` 分组，按源字节数（每上下文
再加固定开销）装箱到最多 8 个 worker，输出顺序按输入位置恢复（见 [lint.md](lint.md) §1.4）。
同机 5 轮配对（load ~5，热 store）：workspace 365 文件墙钟 4.1–4.4 s → 1.8–2.0 s，
user 3.7–4.4 s → 5.7–6.2 s；`lint .`（467 文件）3.7–4.2 s → 1.8–1.9 s。user 上升来自
每个 worker 的模块图上下文加载与并行 GC；worker 超过 8 路后收益被这些开销抵消。

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

读法：GC 沿 `rbp` 链整帧保守扫根（[native-runtime.md](native-runtime.md) §1.2），不按这里的 kind 过滤，
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
`VUNA_LOG=off`、`VUNA_OBS=0`）：

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

`check .` 的成员按依赖分层跑（见 [performance-hotspots.md](performance-hotspots.md) §2 第 10 条），因此冷跑之后**第二遍就全命中**
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
## 2. 探针设施：`log!` 文本行 + `VUNA_OBS` 结构化观测

分两层，**两套独立开关**；绝对读数只用「都关闭」的口径：

| 层 | 开关 | 输出 | 形态 |
| --- | --- | --- | --- |
| 日志行 | `VUNA_LOG=debug`（缺省 `warn`，`off` 关闭） | stderr | `<epoch-us> DEBUG <scope> <text>`，相邻两行相减 = 阶段耗时 |
| 结构化观测 | `VUNA_OBS=1..3` / `--obs` / `--obs-level N` | Chrome Trace Event JSONL | `ph:"X"` 跨度（自带 `dur` 与 `args.allocWords`）、`ph:"C"` 计数、`ph:"i"` 标记与采样栈 |

结构化观测是**运行时层**能力：应用通过生态包 `vuna-obs`（模块 `Obs`）使用，完整规范见
[observability.md](observability.md)；本页只讲「用它来量编译器」：

```console
VUNA_OBS=2 VUNA_OBS_DIR=$PWD/trace vuna check packages/compiler      # 阶段跨度 + 逐定义
VUNA_OBS=3 vuna build --no-compile --out OUT compiler       # + CPU/内存采样
vuna dev obs summarize trace/vuna-*.jsonl                       # 阶段自用/总用时表
vuna dev obs run --level 2 -- vuna check packages/compiler                # 一步到位
vuna dev obs convert --to folded --out f.folded trace/*.jsonl   # 火焰图
```

`log!` 仍是**阶段边界的低成本日志**（展开规则见 [language.md](language.md) 的「内置宏」；
后端是隐藏 runtime 原语 `@vuna@log@on` / `@vuna@log@emit`，见 [logging.md](logging.md)）：

| 用法 | 语义 | 何时用 |
| --- | --- | --- |
| `log! "debug" label` | 阶段边界的时间戳行 | 阶段边界 |
| `log! "debug" ("x=" ++ showTerm t)` | 任意诊断文本行 | 表规模、元变量数、字典目标数 |
| `obsCheck name (\_ => ...)` / `obsMarkEff name` | 结构化跨度 / 标记 | 需要归因表、嵌套、跨模块聚合时 |

**关键纪律（宏已承担）**：守卫在展开里，`log! "debug" ("x=" ++ showTerm t)` 在关闭时**不会**
先算字符串。表达式返回 `Int 0`，调用点写 `_ = log! ...`；开关是 runtime 里的 lazy CAF，
关闭时每个探针只做一次 `Lazy.force`。逐定义探针照常打印，冷 build 的 DEBUG 输出量约
15.8 万行（全量精化），实测冷 build 墙钟膨胀 ~60%：
阶段比例可用，**绝对读数必须用 `VUNA_LOG=off` / `VUNA_OBS=0` 口径**。
核心求值不执行 tracing / 观测（原语归约为 no-op），输出只发生在 compile+run 的 runtime。

结构化观测的成本纪律（关闭路径、事件缓冲、采样开销的实测口径）在
[observability.md](observability.md) §6；那里也有 `#line` 让 `perf`/`gdb` 直接看到
`.vuna` 的配方（本仓库的 `perf`/`gdb` 不进 devShell，属于手动验证路径）。

查找表（泛型 `Base.Container.HashMap k v` 与 `Ec` 里的索引）与仍然存在的热点见
[performance-hotspots.md](performance-hotspots.md)（§1 查找表 / §2 仍然存在的热点）。

## 5. 增长率（合成包）

### 5.1 单文件 `check`（全量精化路径）

同一形状定义（`fi : Int` / `fi = i`，包上下文只依赖 `vuna-base`）随定义数 n 的墙钟。
口径必须在**每档独立空 store**上量（`VUNA_STORE=$(mktemp -d)`；入库的
`compiler-growth.sh` 现已自己隔离 store，但本地手测仍要显式给，见 §1 的「冷 / 热必须分开报」）：

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
交给 intrinsic 探测（`Array` 等），非 intrinsic 族再把这份结果丢掉、由
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

### 5.4 效应机器深度（handler 帧 / answer row 的运行墙钟）

两个探针，分别对应两条会被「活续延数」拖垮的路径。口径一致：`vuna build --target …`
生成产物（**编译时间不计**），一次预热后 best-of-N 只测运行。

**`frames`（OCaml）**：每层装一个 handler、内层返回后在本层非尾 `perform`
（`effect/perf/51_eff_nested` 的放大版）：

| N（层） | 运行 |
| --- | --- |
| 100 000 | 96 ms |
| 200 000 | 231 ms（2.41×） |
| 400 000 | 491 ms（2.13×） |

层数翻倍的成本 ≈2.1–2.4×：多出来的部分是活续延与 used 表的内存增长，不是复杂度退化
（`MSt.msUsed` 是槽 → epoch 表：≤8 条走关联列表，超过阈值升级成 HashMap；`msCtx` 按槽回收）。
门槛 `checks.vuna-effect-machine-growth` 的 frames 三档是 `100k/200k/400k`、每档 30 s 硬上限、
相邻档 ≤3.0×。门槛没压到 2.0×，是因为内存增长本身就有约 1.1 的指数；3.0 才是能区分
n²（≈4×）的下界。

**`answer-row`（native）**：内层 handler 的 clause 先 `perform` 一次外层效应再 resume
（`bench/programs/t8/eff_host` 的形状），每轮多一次派发：

| N | native 运行 | OCaml 同程序 |
| --- | --- | --- |
| 20 000 | 155 ms | ~15 ms |
| 40 000 | 369 ms | — |
| 80 000 | 1184 ms | — |

同一程序在 OCaml 上快一个数量级以上，所以这条轴只在 native 上量。native 读数本身随规模
略超线性（2 万 → 8 万 ≈ 7.6×），比值门槛在这里分不清退化，门槛用 N=40000 单档的
**10 s 绝对上限**（本机读数的 ~27×）抓这一类：`MSt.msUsed` 退回按活续延线性扫描时，
同一形状的 native 读数从 0.37 s 级掉到分钟级。

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

表里是墙钟读数；门槛按 **CPU** 判定（trace span 用同一进程窗口的 CPU / 墙钟比折算，
`fmt --check` 直接取子进程 user+sys），避免并发构建时把等 CPU 的时间算进增长率。

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

**配置与 fixity 上下文按目录缓存**：lint 的配置链（manifest 的 `[lint]` 与合并结果）与
`FixityEnv` 同形按目录缓存，一个 manifest 每进程只读/解析一次；LSP 复用调用方已拿到的
`ParsedSource`，fixity 与规则扫描共用一次词法。单文件 lint 的 `vuna.toml` 打开次数 41 → 39
（剩余来自包加载的依赖遍历，见 debt D137），每多一个文件不再增加 manifest 读（此前每文件 +2，
每个祖先 manifest 一次）。LSP 会话可用时 lint 配置随 `DiagCache` 复用，不再每请求重读；
无会话的回退路径没有可挂载的缓存，仍在每次请求重建一次。

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
节点身份也已落在树里（分支先序 id + `nodeIndex`）；所以下一步的替换是
让 AST **存 id**、span 从树查回，注释槽位直接以 id 为键，而不是再用一次行列比较。

结构上还有一个阻碍：注释锚点集合是**渲染器的挂载点**，不是纯语法种类。局部函数的
后续 clause 在树里同样是 `binding` 节点，但渲染器只给首条子句挂注释（其余子句没有
`attachAt` 调用点，挂上去就会丢注释）；签名行在树里也是 `binding`。所以
「按种类从树收集锚点」不能替换渲染器的锚点集合——AST 投影（`Frontend.AstView`）落地后
可以让渲染器直接用投影值的树节点 id：投影出来的值天然知道自己对应哪个树节点，
渲染器挂哪些值就用哪些 id，不需要再猜。

顺带落地的纯收益：注释附件槽从线性列表换成 `HashMap`（起点字节偏移为键），同机交替
15 轮配对均值 **-36 ms**（中位 0.814 → 0.780 s，约 **-4%**）；`fmt --check .` 与
`fmt --check examples` 逐字节不变。

接着把附件槽的键从「条目 span 起点偏移」换成**条目节点 id**（`Expr` / `Pat` / 声明与条目
节点的 `NodeRef`；签名行用 `Binding.bindSig.sigRef` 的 `binding` 节点，`ModDecl` / `ExportItem` 也补了
`NodeRef`）。渲染挂载点直接拿自己的 `NodeRef` 查表，不再依赖「渲染时能重建与锚点完全
相同的 span」。同机交替 15 轮（`fmt --check .`，1530 文件）：

| | 中位 | 最好 |
| --- | --- | --- |
| 偏移键（上一版） | 0.961 s | 0.855 s |
| 节点 id 键 | 0.962 s | 0.801 s |

配对差中位 **+17 ms**，在噪声内——这一步是**替换**（身份取代位置匹配），不是性能改动；
收益是后续单趟归属的前提。fmt 全量语料（`fmt --check .` / `examples` / `cli` 的 120 条
golden）逐字节不变。

再把归属本身从「每条注释扫全部锚点」改成**单趟**：锚点按起点排序，注释按源码顺序前进，
维护已打开锚点的栈（头 = 最内层）与「本行已结束的锚点」候选池，行尾 / 下一条 / 容器
回退都从栈顶与下一个锚点直接取。同时把「最内层容器」按栈顶取真正的**最内层**（旧实现
取起点最早 = 最外层）。同机交替 27 对（`fmt --check .`）：

| | 配对差中位 | 最好 |
| --- | --- | --- |
| 单趟归属 vs 扫描版 | **-57 ms / -81 ms**（两批，方向一致） | 0.733 s vs 0.806 s |

约为整趟的 **-6% ~ -9%**；`fmt --check .` / `examples` / 120 条 golden 仍逐字节不变，
说明「取真最内层」在全部真实语料上与旧判据给出的归属一致。

最后把锚点集合本身也换成**树口径**。树本来就是 parser 为表面形状建的产物
（`parseSourceDetailed` 直接交出 `parsedCst`），所以从树上按种类取条目节点
（`Cst.anchorRefsOfTree`）不再有额外的建树成本；`Fmt.Comment` 里那套遍历整个 AST 的
锚点收集（`exprAnchors` / `declAnchors` / …，约 170 行）被删除，注释归属不再依赖 AST；
129 条 fmt golden 与全量 `fmt --check` 逐字节不变。

条目节点种类（构造器 / 字段 / trait 方法 / case 分支 / 绑定 / 导出项）补进树本身在噪声内：
同机交替 11–15 轮取中位数，`fmt --check .` 0.775 / 0.777、`check .` 0.502 / 0.498、
`check packages/compiler` 0.121 / 0.121、`check packages/base` 0.048 / 0.047（前 / 后）。
树的结构不贵，贵的是**同一份信息存在两份**。

因此树的收益只能来自**替换**而不是叠加：把 parser 的表层形式（括号 / 反引号 / 中缀链 /
section / 模板的 `"""` 标记）交给树，让 AST 变成纯投影（`architecture-target.md` D18 的
第 2、3 步）。`EFloat raw` 是字面量载荷而不是表层文本；`ELocalFun` 是带身份的子句组，
已收在 `BindingValue.BClauses`，降级点仍在 Elab。

### 6.3 括号表面形状（`Frontend.Cst`）

括号退出 AST 后，「哪些表达式被括号包着」由 `Frontend.Cst` 从建树事件 + 词法 token
派生（一趟线性扫描；模板洞是独立 token 子流，洞的子树挂在模板节点上）。价格分两块，读数同机交替
（同一棵工作树、9 轮配对取中位）：

| 口径 | 改前 | 改后 | 配对差 |
| --- | --- | --- | --- |
| `fmt --check` 单文件（`Elab/Term/Impl.vuna`，3791 行，两遍 parse） | 0.102 s | 0.103 s | 噪声 |
| `fmt --check packages/compiler`（~90 文件，冷） | 0.340 s | 0.378 s | **+33 ms（+11%）** |
| `fmt --check .`（全仓，冷） | 0.686 s | 0.745 s | **+60 ms（+9%）** |
| `fmt --check packages/base` | 0.099 s | 0.099 s | 噪声 |

派生本身很便宜（单文件口径 +1 ms 就是两遍派生）；贵的是**查询**：

| 表表示（同一单文件口径，当时基线） | 中位 |
| --- | --- |
| 条目用线性 `List (Int, Int)`（每个表达式节点扫一遍） | 0.265 s（+161 ms） |
| 条目用 `HashMap Int Int` | 0.107 s（+5 ms） |

Fmt 每渲染一个表达式节点都要问一次括号层数，`sourceInfixParts` 的链边界也要问，所以线性表
在真实代码上退化成 O(节点 × 括号条目)（`fmt --check packages/compiler` 会慢到分钟级）。
空 `HashMap` 字面量在 OCaml 侧会退化成弱类型变量（codegen 不写类型标注），实现用一条 `-1`
哨兵钉住类型再删掉它。

结论：派生按「每次 parse 一次线性扫描」计价；重复的代价来自**同一份源码被 parse 两次**
（format 一次 + 程序级 fixity 一次），不是派生自身。要再压就先合并这两次 parse。

### 6.4 中缀链退出 AST（形状判定取代按 id 登记）

中缀链在 parser 里降级成普通应用 `EApp (EVar op) [l, r]` 之后，消费者（Fmt 的源码顺序打印、
`Loader.Fixity` 的链重排）用**形状**认出链步：符号名作函数的 2 参应用只可能来自中缀降级
（前缀写法必须加括号，那是 section）。只有反引号写法（名字是普通标识符）按节点 id 记在
`Frontend.Cst` 的**小列表**里（一份源码通常个位数条）。同机交替 9 轮配对
（`fmt --check`）：

| 口径 | 改前 | 改后 |
| --- | --- | --- |
| 单文件（`Elab/Term/Impl.vuna`，3791 行） | 0.127 s | 0.127 s（配对 +1 ms） |
| `packages/compiler` | 0.429 s | 0.434 s（配对 −17 ms） |
| `.`（全仓） | 0.820 s | 0.806 s（配对 −5 ms） |

第一版实现给**每一个**表达式节点都做了一次「把链步登记从内层 id 挪到外层 id」的列表扫描
（`rekeyInfix`）：链表节点是 detached（id = −1）时也照扫不误，于是每份源码 O(节点²)、
`fmt --check .` 从 0.82 s 涨到 1.0 s 量级。callgrind 直接定位到 `rekeyInfixGo` 占 60%；
加一条 `from < 0` 的短路（detached 不需要挪）后回到基线。教训：**逐节点运行的辅助函数
必须在「没有事情可做」的路径上 O(1)**，否则它比它服务的那份表还贵。

反引号表用线性列表而不是哈希表也是同一口径：条目数是个位数，构造与查找都比哈希表便宜。