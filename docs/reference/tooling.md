# 工具链：goal、LSP、doc、fmt 与错误码

本文覆盖 DT 路径的**工具链**：洞目标显示、LSP server、`vuna doc`、`vuna fmt`，以及
`vuna run` / `vuna interp` / REPL 的命令语义、诊断错误码与 CLI 退出码。
语言语义见 [language.md](language.md) / [type-system.md](type-system.md)，实现边界见
[core.md](core.md)，模块与 TCB 边界见 [architecture.md](../architecture.md)。

## 1. `vuna goal`：洞目标与上下文

DT 里 `_` 是匿名洞，`?name` 是命名洞（`?` 与标识符紧邻）。`vuna goal` 列出文件里
每个洞的位置、目标类型与上下文：

```console
$ vuna goal test/corpus/dt/15_goal.vuna
test/corpus/dt/15_goal.vuna:7:11: goal Type

$ vuna goal Holes.vuna        # 未解洞同样列出（容错查询）
Holes.vuna:6:6: goal Int
  m : Int
  n : Int

$ vuna goal Named.vuna        # 命名洞带名字
Named.vuna:6:6: goal ?goal : Int
  m : Int
  n : Int
```

- 位置是 `文件:行:列`，与所有其他诊断一致（**1-based**）。
- 目标类型是精化后 zonk（代入已解元变量）再打印的。
- 上下文是洞建立时精化上下文快照里的**全部可见绑定**（名字 : 类型，最内层在前）。
- 若文件里没有洞，输出 `<file>: no holes`。
- 所有记录的洞都会列出（已解 / 未解都算 goal）。**未解洞不让 `goal` 直接失败**：
  查询走容错入口 `goalsOfProgramTolerant`；`check` / `compile` / `build` 仍在严格收尾处报
  `TC_UnsolvedHole`（命名洞的诊断带洞名）。精化中途有硬错误（未绑定名 / 类型不匹配等）时
  仍返回错误。
- 旧描述「被解出的洞不会出现在列表里」是错的（已解的类型实参洞仍会列出），已纠正。

实现入口：`Vuna.Compiler.Elab.Driver.goalsOfProgramTolerant`（返回 `List DtGoalInfo`，含
span、目标类型文本、上下文条目与洞名），CLI 侧在 `Vuna.Cli.goalArgs`。

## 2. LSP server（`vuna lsp`）

LSP 细节（帧格式、已实现方法、模块解析、诊断来源、编辑器冒烟）见
[lsp.md](lsp.md)。

## 2. `vuna doc`

`vuna doc` 生成**单文件交互 HTML**（docstring + 搜索框 + TOC）：

- 默认输出 `DIR/docs/api.html`（`DIR=.` 时 `docs/api.html`）；父目录逐级创建；
- workspace 根渲染所有成员包，单包目录只渲染该包；尊重每包的 `[export].modules`；
- `--check` 报告缺失 docstring 的顶层导出项（exit 1，不写文件）；
- docstring 语法、HTML 搜索框、类型检索与边界见 [api-docs.md](api-docs.md)。

```console
$ vuna doc <dir> [out.html]
$ vuna doc --check <dir>
$ vuna search --type "a -> a"
```

旧的 `docs/api.md` Markdown 工作流已删除；生成物改为 `docs/api.html`（gitignored）。

## 3. 错误码体系

> 诊断的数据模型、结构化通道、渲染视图、LSP 映射与迁移状态见
> [diagnostics.md](diagnostics.md)；本节只保留 CLI 侧的码/退出码语义。

诊断输出带**错误码**：Elab/Codegen 为 `文件:行:列: [CODE] 消息`（Codegen 无位置则无
`行:列:`），lint 为 `路径:行:列: [CODE] 规则: 消息`。域前缀：

| 域 | 含义 | 真源 |
| --- | --- | --- |
| `TC_` | Elab 精化 / 终止性 / 覆盖性诊断 | `compiler/lib/Vuna/Compiler/Diagnostics/Tc.vuna` |
| `CG_` | Codegen / Driver / Dt 诊断 | `Diagnostics/Cg.vuna` |
| `LX_` | 词法诊断 | `Frontend/Diagnostics.vuna` |
| `PS_` | 语法诊断 | 同上 |
| `RN_` | 名字解析（import/export/限定名/构造子/类型名） | `Diagnostics/Rn.vuna` |
| `PKG_` | `vuna.toml` 清单解析/校验、包图 | `Diagnostics/Pkg.vuna` |
| `LD_` | Loader / 包 / 加载诊断 | `Loader/Diagnostics.vuna` |
| `IC_` | 编译器内部错误（不变量/燃料耗尽；internal compiler error，exit 2） | `Diagnostics/Ic.vuna` |
| `UN_` | 告警（未使用/冗余/遮蔽；severity = warning） | `Diagnostics/Warning.vuna` |
| `LN_` | lint 规则 | `lib/Vuna/Lint/Diagnostics.vuna` |
| `FX_` | 错误修复规则（从可修复 `LN_` 推导，`FX_` + 规则名去 `-`） | `lib/Vuna/Lint/Diagnostics.vuna` |

约定：符号**语义稳定**；同语义消息**共享**一个符号；**一个码只承载一种语义**。没有
「诊断码只增不删」约定：vuna 未发布、无兼容义务，预发布阶段允许删除/重命名码（同步目录
与夹具，历史在 git；本次删除 manifest 能力/信任机制即移除 11 个码）。

内部不变量已收进 `IC_`（`icFuel`/`icInternal`）；**工具/构建/清单错误**仍用 `err`（phase = Tool，exit 2，不进目录）。**错误包装器**
（给下层错误加上下文，如 `in \`<def>\`: <inner>`、`json: <inner>`）、**工具链 CLI 错误**
（`no such symbol` / `file not found` / `json: ...` 等，不属编译器诊断）。

**真源是域枚举**：`Diagnostics.Tc` / `Diagnostics.Cg` 的 `TcErr` / `CgErr` 是 `Nat` 索引
族，构造子携带消息模板（`<0>` / `<1>` 为插值），**arity 由类型索引在编译期锁定**；
`tcAll` / `cgAll` 是文档遍历源。报错点统一用 `tcErr0/1/2`、`cgErr0/1`、`lexErr0`、
`psErr0/1` 抛出。

**完整清单**由 `vuna gen-errors [ROOT]` 遍历上述枚举表生成到
`ROOT/docs/.generated/errors.md` 与同源目录 JSON `ROOT/docs/.generated/errors.json`
（code/severity/phase/category/message/desc；默认 ROOT=`.`）。生成物 gitignored、
**勿手改**；重跑幂等。

### 退出码

CLI 统一使用 0 / 1 / 2 三档：

| 退出码 | 含义 | 典型来源 |
| --- | --- | --- |
| 0 | 成功 | 命令完成；`--check` 无差异；lint 无 finding；测试全过 |
| 1 | 源码 / 诊断错误 | `check` / `compile` / `build` 的一切失败（解析、精化、覆盖性、终止性、codegen，以及入口路径不存在；**解析错误也是 1**）；`lint` 有 finding；`fmt --check` 有需重排文件；`doc --check` 缺 docstring；`test` 有失败 |
| 2 | 用法 / 工具错误 | 未知命令或 flag、缺值、参数个数不对；工具命令的宿主操作 / 上下文错误（`lint` / `fmt` / `interp` / `test` / `goal` / `doc` 的路径不存在、非 workspace、包或依赖加载失败、取不到程序级 fixity 上下文） |

约定之外：`vuna check` 的 warning（`UN_` 域）默认静默：`-W`/`--warnings` 打开显示，`--deny-warnings` 显示并把退出码提升为 1（源码检查本身仍成功）。warning 只报当前检查单元自己的文件（依赖包不重复刷屏）。**warning 不持久化**，所以 `-W` / `--deny-warnings`（以及 manifest `[diagnostics] warnings/deny-warnings`）会跳过 check 结果缓存、并让**本包**模块全部重新精化（依赖包仍复用接口摘要）——热缓存下告警仍然完整，代价是该次 check 从「缓存命中 ~ms」回到「本包精化秒级」。普通 `vuna check` 仍走缓存/干净模块（不显示 warning）。

约定之外：`vuna interp` 把任何检查 / 求值失败报成 2（输出以 `error:` 开头）；`vuna
search` 无命中为 1（用法 / 查询解析 / 非 workspace 仍为 2）；`vuna run` 透传子进程退出
码；`vuna repl` 的启动目标既不存在也不是模块名时为 1、加载失败为 2。（ICE 的独立退出码为 70，见 [diagnostics.md](diagnostics.md) §7。）

产物运行期未捕获
异常由运行时报告器以 2 退出（见 [debugging.md](debugging.md) §2）。

### 代表性诊断

下表只列常用码；完整清单见生成物。

| code | 阶段 | 触发条件 |
| --- | --- | --- |
| `TC_HoleNoExpectedType` | 精化 | `_` 出现在推断位置 |
| `TC_UnsolvedHole` | 精化 | 洞最终未被求解（带目标） |
| `TC_UnsolvedMetavar` | 精化 | 非洞的元变量未解 |
| `TC_CannotSolveOccurs` | 精化 | 解里出现自身 |
| `TC_CannotSolveHigherOrder` | 精化 | 非 Miller pattern 的元变量应用 |
| `TC_NoInstanceFound` | 精化 | 接口字典找不到实例 |
| `TC_AmbiguousInstance` | 精化 | 多个实例头部都能统一 |
| `TC_UnknownInterface` | 精化 | instance 头 / 签名约束头能解析成名字但不是已声明接口 |
| `TC_InstanceHeadNotApp` | 精化 | instance 头形态不合法 |
| `TC_ConstraintNotDict` | 精化 | 约束项不是 trait 应用或参数个数不符 |
| `TC_InstanceMissingMethod` | 精化 | 实例漏实现方法 |
| `TC_CannotProveTermination` | 终止性 | 递归调用没有结构下降 |
| `TC_NotExhaustive` | 覆盖性 | 漏写可达分支 |
| `TC_ImpossibleBranchIndex` | 覆盖性 | 写了索引不可达分支 |
| `TC_NotInductiveFamily` | 精化 | 对非归纳族做 case |
| `TC_UnknownConstructorInCase` | 精化 | 分支构造子不属于该族 |
| `TC_CtorDoesNotReturn` | 精化 | 构造子结果族不符 |
| `TC_MainArity` | 精化 | `main` 带参数（入口必须零参） |
| `CG_TypeLevelBindingRuntime` | codegen | 运行时用到被擦除绑定 |
| `CG_TypeUsedAtRuntime` | codegen | 运行时出现类型项 |
| `CG_AxiomAtRuntime` | codegen | 运行时使用 axiom |
| `CG_InterpCannotExecuteEffects` | codegen | `vuna interp` 遇到 `main : Eff [] a` |

## 4. `vuna run` 与 REPL 调试命令

`vuna run [DIR] [--package NAME] [--no-build] [--release] [--out DIR] [-- ARGS...]`：in-process 走与 `vuna build`
同一条增量构建，然后执行 `<包目录>/.output/bin/<包名>`；`--out DIR` 时构建到 `DIR/bin/<包名>`
并从该处执行（相对 DIR 按调用方 cwd 解析），`--no-build` 直接使用现有产物；`--` 之后的参数
原样透传，子进程退出码原样返回。目标包选择：`--package` → workspace 根包（可执行时）→ 唯一可执行成员 →
否则列出候选并 exit 2；库包 / 缺产物 / 构建失败都给出可操作错误。实现入口
`Vuna.Run.runRun`。

`vuna interp <file.vuna>` 走同一条 DT 精化后再做**纯核心求值**，不执行效果：任何
`main : Eff [] a` / `main : Eff [] a` 一律报 `[CG_InterpCannotExecuteEffects]`，消息是
`interp cannot execute effects (main : Eff [] a / Eff [] a); compile and run the program instead`
（exit 2）；纯 `main` 只展示 `Int` / `Nat` / `String` / `Bool`，需要效果或其它展示时用
`compile` + 运行产物。

REPL（`vuna repl [FILE|DIR|MODULE]`，实现入口 `Vuna.Repl.runRepl`；行编辑在
`Vuna.Repl.Edit` / 终端层在 `Vuna.Repl.Term`；server / 客户端在 `Vuna.Repl.Server` /
`Vuna.Repl.Client`。工具链模块都不进 seed 闭包）：

| 命令 | 行为 |
| --- | --- |
| `:type EXPR` | 精化表达式或类型表达式并打印 zonk 后的类型（类型构造子打印 kind；不求值、不执行效果；类型文本按 token 着色） |
| `:typeinfo EXPR` | 主行只显示显式类型，隐式 binder 单独列出；工作区内附 docstring（别名 `:ti`） |
| `:info NAME` | 先查 REPL 缓冲（精化后的类型），再查 `Vuna.Index`：全名 / kind / 签名 / 文档 / 位置 |
| `:search [--type\|--name\|--doc] QUERY` | 复用 `vuna search` 的检索；含 `->` / `=>` 自动类型检索；最多 20 条 |
| `:load TARGET` | 见下方加载矩阵；成功才改变状态，失败保持缓冲 |
| `:reload` | 上次是文件则重读；是模块则重新校验导入；都没有给可操作提示 |
| `:browse [MODULE]` | 惰性构建 `Vuna.Index`（`loadOrBuildCheap`：`index-cheap:<dir>` 查询图节点，依赖表 = stat 键 + 安全窗内内容哈希；命中从 blob 解码，未命中重建并写回）后打印模块接口；无参列出模块。会话内后续 `:browse`/`:info`/`:search` 直接用 `stateBrowseIndex` 的内存索引，不再逐条比较；跨进程新鲜度由查询图承担。索引只覆盖 workspace 内源码，非 workspace 的外部依赖模块用 `:load <模块名>` 导入（`:browse` 查不到） |
| `:defs` | 缓冲区定义的名字 + zonk 后类型；`:load` 文件来源标 `(文件)` |
| `:imports` | 当前显式 import 行 + 隐式自动导入的 Prelude（标「隐式自动导入」） |
| `:delete NAME` | 删除 REPL 内定义（含同名签名块）；文件来源报错，提示改文件后 `:reload` |
| `:set …` | `+t/-t`（求值后打印类型）、`+s/-s`（耗时）、`editing auto\|on\|off`、`color auto\|on\|off`、`prompt TEXT`（保留尾随空格）；无参列出 |
| `:history` / `:again N` | 编号列出历史 / 把第 N 条完整输入重新提交（命令与定义都可以） |
| `:! CMD` | `sh -c` 执行；非 0 打印退出码 |
| `:abandon` | 放弃当前待续输入 / `:{ ... :}` 块 |
| `:{` … `:}` | 多行块输入：原样收集、块内空行保留、提交前去掉公共缩进 |
| `:reset` / `:quit` / `:help` | `:reset` 清缓冲与加载目标（保留设置/历史）；`:quit` 同 Ctrl-D |

**名字作用域**：REPL 与普通源文件共用同一套 Loader 语义——Prelude **隐式自动导入**
（`:imports` 会标为隐式，显式 `import Prelude` 时不再重复）；`:type` 直接走表达式精化，
而导入模块的类型名与本地 `data` 名一样可以作为项，所以 `:type Maybe` 打印 kind
（`Maybe : (a : Type) -> Type`）、`:type Maybe Int` 打印 `Type`；限定名需先 import
（`:load Base.Maybe` 后 `:type Base.Maybe.Maybe`）。裸运算符会按值形式自动补括号
（`:type +` ≡ `:type (+)`）；`>>` 是 do 派生语法、不是值，`:type >>` / `:type (>>)`
会给出提示。

**输入单元**：一次提交是一条完整表达式或一条定义。括号 / 字符串 / 块注释未闭合，或行尾
停在 `=` / `->` / `where` / `do` / `then` / `else` / `of` / `in` / `case` / `let` / `|`
/ `,` / `<-` / `=>` 时自动进入续行（`... ` 提示）；`:{` … `:}` 走显式多行块。

**定义体验**：`x = 1 + 1` / `f y = x + y` 可直接输入，缺签名时 REPL 调
`Interp.inferDefTypes` 自动推断（编译器元变量 telescope + 定义边界泛化），写回后
`checkProgram` 复查，失败回滚并提示手写签名。带模式匹配（`f 0 = …`）、trait 约束
（`x == x`）、高阶参数的定义需要显式签名（消息里给提示）；宇宙级定义同样不需要先写
签名，`u = Type 1` 自动推断为 `u : Type 2`。同名 `DFun` 再次输入即重定义
（文本替换语义：后续定义重新绑定到新定义，不是 shadowing）。

**效果表达式**：动作表达式放进临时包走 `compile` + 运行，效果输出直接到终端、按进程
退出码判定，因此需要 PATH 里有 `ocamlopt`。包上下文取最近 `vuna.toml` 的本地依赖闭包
（不在包内时 base-only）。

**加载矩阵**（`:load` 与 CLI 位置参数同一套解析）：

| 目标 | 行为 | 输出片段 |
| --- | --- | --- |
| `path/to/entry.vuna` | 整段源码替换 imports/defs（旧语义） | `已加载 …（N 个定义）` |
| `path/to/module.vuna`（含 `module` 头） | 拒绝，提示用模块名 | `是模块文件` |
| `Base.Nat`（模块名） | 立即校验后追加 `import` | `已导入模块 Base.Nat` |
| `path/to/pkg`（目录） | 切换包上下文并重置缓冲/索引（保留设置/历史） | `已切换包 …` |
| `vuna repl FILE` / `vuna repl DIR` / `vuna repl MODULE` | 启动即加载 / 切换上下文 / 导入；加载失败报错退出（exit 2） | 同上 |

**行编辑（tty）**：←/→ 码点移动、Home/End、Backspace/Delete、↑/↓ 历史（多行单元
原样回填，换行显示为 `↵`）、Ctrl-R 反向增量历史搜索（再按 Ctrl-R 找更早、Enter 接受、
Esc/Ctrl-C 取消）、Ctrl-A/E/K/U/W、Ctrl-L 清屏、Ctrl-P/N/B/F、Ctrl-C 取消当前输入、
Ctrl-D 空行退出。超宽行按水平窗口只显示尾部，宽度来自 `stty size`（取不到时按 80）；
**窗口 resize** 在空闲时轮询检测（`stty min 0 time 1` 每 0.1s 醒一次、每 20 tick（≈2s）
查一次宽度，变化后按新宽度重绘当前行；不忙等。2s 是权衡：每次查询要起 `sh` + `stty`
两个进程，2s 的 resize 反应延迟可接受且常驻开销低）。若进程在编辑中被硬杀（SIGKILL），
终端可能停在 raw，执行 `stty sane` 恢复。

**Tab 补全**：普通位置补命令名与当前缓冲绑定名；`:load` 的参数位补**模块名 + 文件路径**，
`:browse` / `import` 的参数位只补模块名。模块名来自包上下文模块根（自身 `lib` + 依赖
闭包，相对路径 `/`→`.`；不按 `[export]` 过滤，越权模块在 `:load` 时被 Loader 拒绝），
文件路径按 token 最后一个 `/` 拆目录/末段后列举（目录补尾随 `/`）。候选只在按下 Tab 时
枚举（读行不做目录访问）；唯一匹配直接补全、多个匹配补最长公共前缀，语义不变。

**括号粘贴**：tty 下开启 bracketed paste（`\e[?2004h`，退出时 `\e[?2004l`）。
`\e[200~` … `\e[201~` 之间的内容**原样**进编辑缓冲（Tab 不触发补全、换行不触发提交，
`\r` 规范化为 `\n`）；按 Enter 才把整段作为一个输入单元（或按续行规则并入 pending）
提交。不支持该模式的终端不会发送这两个序列，行为与旧版一致；非 tty 路径不进入编辑器。

**历史持久化**：`VUNA_REPL_HISTORY` > `$XDG_STATE_HOME/vuna/repl_history` >
`$HOME/.vuna_repl_history`。文件格式 v2：首行 `vuna-repl-history 2`，其后每行一条单元
（单元内 `\`→`\\`、换行→`\n`），因此**多行单元也会持久化**；旧 v1（无首行头、纯文本
一行一条）仍可读，下次写入自动升级为 v2。目录不可写时静默跳过。

**非 tty / 无 stty 回退**：非交互管道、`:set editing off`、或无 POSIX `stty` 时退回
`prim_readLine`（没有方向键/Ctrl-R / 括号粘贴 / resize 重绘，其它命令语义一致；管道测试
走这条路径，pty 行为另有 `script` 伪造终端的用例）。

未知 `:命令` 给 `未知命令 ...（输入 :help 查看可用命令）` + 最近命令建议，不落到 parse
error。调试与运行时错误的整体工作流见 [debugging.md](debugging.md)。

### REPL server 与客户端（`--listen` / `--client`）

**为什么不是 stdio**：agent / 脚本的每次 bash 调用都是新 shell，进程结束时子进程会被清理，
所以「常驻 REPL」必须挂在 **OS 级端点**上。`vuna repl --listen ADDR` 起常驻 server
（会话状态跨连接保留），`vuna repl --client ADDR` 是每次调用的一发一收客户端。

**端点**（只允许本机，能连上 = 能在你的进程里执行任意 vuna 代码）：

| 形式 | 说明 |
| --- | --- |
| `unix:PATH` | Unix domain socket；进程退出时清理该路径（bind 前也会删除残留路径） |
| `tcp:127.0.0.1:PORT` | loopback TCP；`PORT=0` 用临时端口，就绪行给出实际地址 |

它**不是 stdio server**：协议帧走 socket，stdout 只输出一行就绪信息
`listening <ADDR>`（agent 用它/后台作业日志判断可用），诊断走 stderr（`[vuna-repl-server]`）。

**协议**：JSON-RPC 2.0 信封 + 与 LSP 相同的字节级帧
（`Content-Length: <body UTF-8 字节数>\r\n\r\n<body>`，body 后无换行；单帧/缓冲 16 MiB）。

请求：`{"jsonrpc":"2.0","id":N,"method":"eval","params":{"code":"…","close":true}}`
（`code` 必填，可多行；`close` 默认 true —— 末尾按「输入结束」收尾，等价交互式空行/Ctrl-D）。
响应载荷固定四个字段：

```json
{"jsonrpc":"2.0","id":1,"result":{"status":"ok","ok":true,"output":"42\n","error":""}}
```

| 字段 | 含义 |
| --- | --- |
| `status` | `ok` / `incomplete`（输入未闭合，可继续发 `eval`）/ `exit`（`:quit`，响应后进程退出） |
| `ok` | 本次输入是否成功（等价于 `error` 为空） |
| `output` / `error` | 普通输出 / 错误输出两个独立通道（REPL 内唯一输出汇分出） |

方法：`eval`（源码 / `:命令` / 多行单元）、`ping`（版本 + 包名，探活）、`shutdown`（回帧后 exit 0）。
协议错误用标准码：坏 JSON `-32700`（`id:null`，**连接与会话继续**）、缺 `code` `-32602`、
未知方法 `-32601`。求值失败**不是**传输错误：仍在 `result.ok=false` 里，会话继续。

**agent 驱动（跨进程、跨工具调用）**：

```console
# 1) 启动（DSH：bash 工具的 run_in_background；其它环境用 setsid/nohup/systemd/tmux）。
#    不要用普通 `&`：调用结束会被清理；/tmp 也可能每次调用隔离，socket 路径请放持久目录。
vuna repl --listen tcp:127.0.0.1:7878      # 就绪行：listening tcp:127.0.0.1:7878

# 2) 每次独立 bash 调用（客户端补 Content-Length，只输出响应 body）
printf '%s' '{"jsonrpc":"2.0","id":1,"method":"eval","params":{"code":"1 + 1"}}' \
  | vuna repl --client tcp:127.0.0.1:7878

# 3) 收尾
printf '%s' '{"jsonrpc":"2.0","id":2,"method":"shutdown"}' | vuna repl --client tcp:127.0.0.1:7878
```

零依赖备选：bash 内建 `exec 3<>/dev/tcp/127.0.0.1/7878` 直接收发帧（HTTP 式 `nc -U` 亦可
连 Unix socket）。会话是**单客户端串行**的：一个连接处理完（或对端关闭）才 accept 下一个；
`--client` 一发一收后立即断开，因此多次调用天然串行。阻塞的 `accept`/`recv` **无超时**，
客户端崩溃会随连接关闭自动恢复，但**不要**在同一会话上并发发请求。

**阶段 1 限制**：server 模式下 `:!` 与效果表达式（`main : Eff [] a` 临时编译运行）**拒绝执行**
（子进程会写真实 stdout，污染协议通道）；需要跑程序时用 `vuna run` / `vuna build` 后直接
执行产物。`vuna test` 的效果测试路径不受影响。

## 5. `vuna fmt`

`vuna fmt [--check] [PATH]...` 把源码按规范形重排：PATH 可为文件或目录；省略 PATH 时
格式化 workspace 内各成员包的 `lib` / `app` / `test`。目录扫描跳过隐藏项、生成物与
`corpus` 夹具。`--check` 只报告差异（`would reformat: <path>`，exit 1）；不带 `--check`
时原地改写并打印 `formatted <path>`。非 workspace 且省略 PATH、路径不存在、取不到
程序级 fixity 上下文都是工具错误（exit 2）。

**基础排版**：2 空格缩进、顶层声明之间一个空行、文件末尾一个换行、无行尾空白；
`format(parse(x))` 可重新 parse，且格式化幂等（`format(format(x)) == format(x)`）。
行宽 100（按码点计）；行内放不下时在表达式内部折行，但**类型签名与字段类型不折行**
（避免 `->` 链被打断），超长字符串字面量也保持单行。


**注释**：单独成行的注释成为下一条目的前置注释，写在同一行末尾的注释成为该条目的行尾
注释；多行块注释只作前置注释。表达式内部的注释前移到最内层包含它的条目（没有则前移到
下一条目；文件末尾的注释保留在文件末尾）。

**`where` 与 `infix*`**：`where` 块的绑定按源码顺序输出，带签名的绑定先输出签名行；
`infix*` 声明打印在 imports 之后、第一个声明之前，保持源码顺序、每条一行
（`infixl 6 +` / `infixr 5 :: = Cons`）。fixity 是**程序级**属性：调用方传入程序可见
的 fixity 闭包（`Loader.Flatten.fixitiesForSource`：本文件声明 + import 闭包的去重
表）；取不到上下文（依赖加载失败）或遇到未知**符号**运算符时 fmt 报错并停止，不静默按
默认优先级重排；未知反引号名字按 9 左结合（Haskell 默认）。

**模板字面量**按 [templates.md](templates.md) 的规范形重写：`"""` 内容逐字（不
dedent，开引号后的首个换行由 lexer 丢弃、渲染时按需补回），文本里的 `$` 紧跟 `{` 写成
`\$`，`${...}` 内的注释丢弃（词法不进 AST）。

## 6. 尚未实现（工具链自身缺口）

- `rewrite` / `with` 等证明工程 ergonomics：未实现。
- **语义索引**：Index 仍是 parse 级（签名必填 ⇒ 语法索引即语义面，不另建语义索引）。
- LSP codeAction 的剩余缺口：case split 枚举非索引 `data` 与 record（单构造器 record 模式），
  不覆盖索引族（parse 级拿不到索引约束）与不透明 `axiom`；构造子是 parse 级解析（依赖模块
  读盘）；`fix all` 的 command 形式依赖客户端支持 `workspace/applyEdit`；rename 由
  `textDocument/rename` 提供（解析级，见 lsp.md）（见 [debt.md](debt.md) C38）。
- **REPL server（非目标，不是待修债务）**：无请求取消/超时、无并发连接、无断线重连；阶段 1
  不执行 `:!` 与效果表达式；没有 HTTP/TLS（端点只有 loopback TCP / Unix socket）。单会话
  状态机本质串行，超时/取消需要可中断求值原语；安全模型只允许 loopback，故不做并发连接与
  外部网络协议。

开放债务见 [debt.md](debt.md)；测试入口见
[testing.md](testing.md)。
