# DT 工具链与证明工程

本文记录 DT 路径的**工具链**：洞目标显示、LSP server、`vuna doc` 对接口与隐式签名的
支持，以及 DT 的错误索引。语言语义本身见 [dt.md](dt.md)，设计与实现边界见
[docs/dt-core.md](../dt-core.md)。

DT 工具链解决「写起来顺不顺手」：`goal` 列洞、`lsp` 在编辑器里给诊断与 hover、
`doc` 渲染接口面、错误索引把诊断归到阶段。

## 1. `vuna goal`：洞目标与上下文

DT 里 `_` 是一个洞（hole）。`vuna goal` 列出文件里每个洞的位置、目标类型与上下文：

```console
$ vuna goal test/corpus/dt/15_goal.vuna
test/corpus/dt/15_goal.vuna:7:11: goal Type
```

- 位置是 `文件:行:列`，与所有其他诊断一致（**1-based**）。
- 目标类型是精化后 zonk（代入已解元变量）再打印的。
- 若文件里没有洞，输出 `<file>: no holes`。

被**解出**的洞不会出现在列表里（`main = id _ 7` 里那个 `_` 由实参 `7` 定成 `Int`，
因此 `goal` 只报真正未解的洞）。未解的洞在 `check` / `compile` 时报：

```
DT: unsolved hole <文件>:<行>:<列> with goal <目标类型>
```

实现入口：`Vuna.Compiler.Elab.Driver.goalsOfProgram`（返回 `List DtGoalInfo`，含 span、
目标类型文本与上下文条目），CLI 侧在 `Vuna.Cli.goalArgs`。

## 2. LSP server（`vuna lsp`）

`vuna lsp` 是一个 **JSON-RPC 2.0 over stdio** 的语言服务：从 stdin 读帧、向 stdout
写帧，日志一律走 stderr。它是根包工具链模块（`lib/Vuna/Lsp.vuna`），**永不进入
seed 闭包**。

### 帧格式

```text
Content-Length: <字节数>\r\n
\r\n
<JSON 正文>
```

接收端同时容忍以 `\n` 结尾的 header 行（部分客户端/编辑器会发裸 `\n`）。
`Content-Length` 按**字节**计，不是字符数。

### 已实现的方法（M30）

| 方法 | 行为 |
| --- | --- |
| `initialize` | capabilities：Full 同步、hover、completion（`.` 触发）、definition、references、documentSymbol、documentFormatting、workspaceSymbol；`serverInfo` |
| `initialized` | 通知，无响应 |
| `textDocument/didOpen` / `didChange` / `didClose` | 内存维护打开文档表（Full 同步） |
| `textDocument/publishDiagnostics` | 包上下文解析 / DT 精化 / 覆盖性诊断 + lint 诊断 |
| `textDocument/hover` | DT 洞 `_` 的目标类型与上下文；否则标识符签名/文档注释 |
| `textDocument/formatting` | `Vuna.Fmt.formatSource` 全文替换 TextEdit（解析失败返回空） |
| `textDocument/documentSymbol` | AST 声明树（data/record/trait 带子节点） |
| `textDocument/definition` / `references` | Index：token → 符号 → 定义位置；references 用 `Ref` 的精确行/列 |
| `textDocument/completion` | 关键字 + 当前缓冲顶层符号 + Index 符号；`.` 后按模块过滤 |
| `workspace/symbol` | Index 符号过滤（有上限） |
| `shutdown` / `exit` | 正常退出语义：收到 shutdown 后 exit 退 0，否则退 1 |

### 诊断的来源与边界

- **走与 CLI 相同的包上下文**（`Pkg.contextForFile`）：有 `module` 头的文件用
  `Loader.loadModuleSource`（模块按库模块加载），无头的入口文件用
  `loadProjectSource`；随后 `Dt.dtCheckSource` 做 `elabProgramFull`。**含 `import` 的
  文件不再跳过类型检查**（D13 已修）。
- 错误串 `<file>:<line>:<col>: message` 转成 LSP 的 0-based range；依赖模块的错误
  按 `spanFile` 过滤（只发当前文件），无位置的错误归当前文件。
- lint findings 合并进同一 `publishDiagnostics`：severity 2、`code` 为 `LN_*` 规则码、
  `source: "vuna"`。
- 已知边界（模块头注释同步记录）：`didChange` 全量重新精化（大文件可能滞后，编辑器
  端应去抖）；依赖的未保存改动读盘；Index 每进程一次、不随编辑刷新；多根 workspace
  取首个文档；一次只发首个编译错误。
- URI：`file://` + `%XX` 解码；非 file / 不存在的路径用 cwd 包上下文，不崩溃。

### 编辑器冒烟

`test/corpus/lsp/smoke.sh` 是自包含脚本（只依赖 POSIX sh + 传入的 vuna），真的把帧从
stdin 喂给 `vuna lsp` 并断言 stdout 上的 JSON；M30 起覆盖两模块临时包、含 import 的
类型错误、formatting、documentSymbol、definition、references、completion、lint 诊断、
URI 解码与退出码：

```console
sh test/corpus/lsp/smoke.sh ./result/bin/vuna
```

它校验：stdout 只含协议帧、每帧 `Content-Length` 与正文长度一致、诊断范围 0-based、
shutdown/exit 退出码。`test/run-tests.sh` 的 LSP 段调用它。

## 3. `vuna doc` 与接口 / 隐式签名

`vuna doc` 渲染 DT 的声明面：

- `trait Pretty a where` 渲染为 `trait Pretty a where` 与其方法签名；
- 隐式 Pi 渲染成 `{a : Type} -> ...`（`Vuna.Doc` 的 `EPi` 分支按 `implicit` 决定花括号）。

```console
$ vuna doc <dir> <out.md>
```

注意输出文件的**父目录必须已存在**（`doc` 不创建目录）。

## 4. 错误码体系（M3 / M4 / M30）

诊断输出带**错误码**：Elab/Codegen 为 `文件:行:列: [CODE] 消息`（Codegen 无位置则无
`行:列:`），lint 为 `路径:行:列: [CODE] 规则: 消息`。域前缀：

| 域 | 含义 |
| --- | --- |
| `TC_` | Elab 精化 / 终止性 / 覆盖性诊断 |
| `CG_` | Codegen / Driver / Dt 诊断 |
| `LX_` | 词法诊断 |
| `PS_` | 语法诊断 |
| `LN_` | lint 规则 |
| `FX_` | 错误修复规则（从可修复 `LN_` 推导，`FX_` + 规则名去 `-`） |

约定：符号**语义稳定、只增不删**；同语义消息**共享**一个符号；**一个码只承载一种语义**
（历史上混了两种消息的 `TC_OpOnlyIntString` / `TC_CtorError` 已按下文拆开）。

不分配符号的三类（仍走裸字符串）：`DT: internal:`（编译器内部不变量）、**错误包装器**
（给下层错误加上下文，如 `in \`<def>\`: <inner>`、`json: <inner>`）、**工具链 CLI 错误**
（`no such symbol` / `file not found` / `json: ...` 等，不属编译器诊断）。

**真源是域枚举，不是注释**（M30 起删除全部 `-- @code` docstring）：

- `compiler/lib/Vuna/Compiler/Diagnostics.vuna`：`TcErr`/`CgErr` 是 `Nat` 索引族，
  构造子携带消息模板（`<0>`/`<1>` 为插值），**arity 由类型索引在编译期锁定**——
  `tcErr1 sp (UnknownName a) a` 的插值个数写错即编译失败；`tcAll`/`cgAll` 是文档遍历源。
- `compiler/lib/Vuna/Compiler/Frontend/Diagnostics.vuna`：`LexDiag`/`PsDiag`（LX_/PS_）。
- `lib/Vuna/Lint/Diagnostics.vuna`：`LintRule`（LN_），code 与 rule 短名一处声明，
  消除旧 `@code` + `@rule` 手写两遍的漂移。

报错点统一用 `tcErr0/1/2`、`cgErr0/1`、`lexErr0`、`psErr0/1` 抛出。

**完整清单**由 `vuna gen-errors [ROOT]` 遍历上述枚举表生成到
`ROOT/docs/.generated/errors.md`（默认 ROOT=`.`）。生成物 gitignored、**勿手改**；重跑幂等。

下节错误索引只列**代表性**诊断；完整清单见生成物 `docs/.generated/errors.md`。

## 5. DT 错误索引

| code | 消息 | 阶段 | 触发条件 |
| --- | --- | --- | --- |
| `TC_HoleNoExpectedType` | `cannot infer the type of a hole; give it an expected type` | 精化 | `_` 出现在推断位置 |
| `TC_UnsolvedHole` | `unsolved hole <loc> with goal <ty>` | 精化 | 洞最终未被求解（带目标） |
| `TC_UnsolvedMetavar` | `unsolved metavariable ?k` | 精化 | 非洞的元变量未解 |
| `TC_CannotSolveMetavar` | `cannot solve metavariable ?k (occurs check)` | 精化 | 解里出现自身 |
| `TC_CannotSolveMetavar` | `cannot solve metavariable ?k (solution would escape its scope)` | 精化 | 解引用了创建之后才绑定的局部变量 |
| `—` | `cannot solve higher-order metavariable ?k (M15 limitation)` | 精化 | 带 spine 的元变量（Core/Conv 未纳入错误码） |
| `TC_NoInstanceFound` | `no instance found for <dict type>` | 精化 | 接口字典找不到实例 |
| `TC_AmbiguousInstance` | `ambiguous instance for <dict type> (candidates: ...)` | 精化 | 多个实例头部都能统一 |
| `TC_UnknownInterface` | `unknown interface <C> in instance head` | 精化 | instance 头不是已声明接口 |
| `TC_InstanceHeadNotApp` | `instance head must be an interface application (e.g. Show Int)` | 精化 | instance 头形态不合法 |
| `TC_InstanceMissingMethod` | `instance is missing an implementation of <m>` | 精化 | 实例漏实现方法 |
| `TC_InterfaceOneParam` | `interfaces must have exactly one parameter (M15 limitation)` | 精化 | 多参数接口 |
| `TC_CannotProveTermination` | `cannot prove termination of <f> (recursive call does not structurally decrease)` | 终止性 | 自递归调用的实参没有变小 |
| `TC_NotExhaustive` | `case is not exhaustive: missing <C>` | 覆盖性 | 漏写可达分支 |
| `TC_ImpossibleBranchIndex` | `this branch is impossible (index constraints are unsatisfiable)` | 覆盖性 | 写了不可达分支 |
| `TC_NotInductiveFamily` | `case scrutinee is not an inductive family` | 精化 | 对非归纳族做 case |
| `TC_UnknownConstructorInCase` | `unknown constructor <C> in case` | 精化 | 分支构造子不属于该族 |
| `TC_CtorDoesNotReturn` | `constructor <C> does not return <F>` | 精化 | 构造子结果族不符 |
| `—` | `multiple clauses are not supported yet (use a single equation; M16)` | 精化 | 多 clause 函数（历史诊断，M16 已移除） |
| `CG_TypeLevelBindingRuntime` | `type-level binding <x> is used at runtime (M13 limitation)` | codegen | 运行时用到被擦除绑定 |
| `CG_TypeUsedAtRuntime` | `a type is used at runtime (M13 limitation)` | codegen | 运行时出现类型项 |
| `CG_MainReturnType` | `main must return Int, String or Bool (M13 limitation)` | codegen | `main` 返回类型不支持 |

## 6. 尚未实现（工具链自身缺口）

> 阶段状态与当前阻碍见 [docs/roadmap.md](../roadmap.md) 的「阶段状态总览」；这里只列
> 工具链自身缺口。

- **case splitting**：按洞的目标类型自动展开 `case` 分支（需要与编辑器协议配合）。
- `rewrite` / `with` 等证明工程 ergonomics：研究储备，未排期。
- LSP 的包解析（当前含 `import` 的文件跳过类型检查；D13/M30 接同一 `contextForFile`）。
- 更细的字典目标诊断（当前未解类参数报 `unsolved metavariable`）。

## 相关阅读

- DT 语言参考：[dt.md](dt.md)
- DT 设计与实现边界：[docs/dt-core.md](../dt-core.md)
- 工具链与 TCB 边界：[architecture.md](../architecture.md)
- 路线图：[docs/roadmap.md](../roadmap.md)