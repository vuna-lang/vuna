# 工具链：goal、LSP、doc 与错误码

本文覆盖 DT 路径的**工具链**：洞目标显示、LSP server、`vuna doc`，以及诊断错误码体系。
语言语义见 [language.md](language.md) / [type-system.md](type-system.md)，实现边界见
[core.md](core.md)，模块与 TCB 边界见 [architecture.md](../architecture.md)。

## 1. `vuna goal`：洞目标与上下文

DT 里 `_` 是一个洞（hole）。`vuna goal` 列出文件里每个洞的位置、目标类型与上下文：

```console
$ vuna goal test/corpus/dt/15_goal.vuna
test/corpus/dt/15_goal.vuna:7:11: goal Type
```

- 位置是 `文件:行:列`，与所有其他诊断一致（**1-based**）。
- 目标类型是精化后 zonk（代入已解元变量）再打印的。
- 若文件里没有洞，输出 `<file>: no holes`。
- 被**解出**的洞不会出现在列表里（`main = id _ 7` 里那个 `_` 由实参 `7` 定成 `Int`，
  因此 `goal` 只报真正未解的洞）。未解的洞在 `check` / `compile` 时由 `TC_UnsolvedHole`
  报出（带位置与目标类型）。

实现入口：`Vuna.Compiler.Elab.Driver.goalsOfProgram`（返回 `List DtGoalInfo`，含 span、
目标类型文本与上下文条目），CLI 侧在 `Vuna.Cli.goalArgs`。

## 2. LSP server（`vuna lsp`）

`vuna lsp` 是一个 **JSON-RPC 2.0 over stdio** 的语言服务：从 stdin 读帧、向 stdout 写帧，
日志一律走 stderr。它是根包工具链模块（`lib/Vuna/Lsp.vuna` + `Lsp.Protocol` /
`Lsp.Diagnostics` / `Lsp.Query`），**永不进入 seed 闭包**。

### 帧格式

```text
Content-Length: <字节数>\r\n
\r\n
<JSON 正文>
```

接收端同时容忍以 `\n` 结尾的 header 行（部分客户端 / 编辑器会发裸 `\n`）。
`Content-Length` 按**字节**计，不是字符数。

**读取必须是字节级的**（`prim_readBytes` → `Vuna.Lsp.Protocol.readChunk` + 缓冲）：body
后面**没有尾随换行**，而交互式客户端（`initialize` / hover / definition 等请求）在拿到
响应之前不会再写任何字节。若用 `prim_readLine` 按行切 body，服务器会阻塞在「等 body 的
换行」，客户端阻塞在「等响应」——`initialize` 就永久挂起，编辑器表现为「LSP 进程起来了但
什么功能都没有」。回归测试见 smoke 第 18 项。

### 已实现的方法

| 方法 | 行为 |
| --- | --- |
| `initialize` | capabilities：Full 同步、hover、completion（`.` 触发）、definition、references、documentSymbol、documentFormatting、workspaceSymbol；`serverInfo` |
| `initialized` | 通知，无响应 |
| `textDocument/didOpen` / `didChange` / `didClose` | 内存维护打开文档表（Full 同步） |
| `textDocument/publishDiagnostics` | 包上下文解析 / DT 精化 / 覆盖性诊断 + lint 诊断 |
| `textDocument/hover` | DT 洞 `_` 的目标类型与上下文（文本里没有独立 `_` 时跳过精化）；否则标识符签名 / 文档注释。`range` 落在**光标 token** 上（不是符号定义位置）——客户端用它判断 hover 何时失效 |
| `textDocument/formatting` | `Vuna.Fmt.formatSourceWith` 全文替换 TextEdit（fixity 取程序级可见闭包）（解析失败返回空） |
| `textDocument/documentSymbol` | AST 声明树（data/record/trait 带子节点） |
| `textDocument/definition` / `references` | Index：token → 符号 → 定义位置；references 用 `Ref` 的精确行 / 列 |
| `textDocument/completion` | 关键字 + 当前缓冲顶层符号 + Index 符号；`.` 后按模块过滤 |
| `textDocument/codeAction` | 返回空动作列表（占位，尚无 code action） |
| `workspace/symbol` | Index 符号过滤（有上限） |
| `shutdown` / `exit` | 正常退出语义：收到 shutdown 后 exit 退 0，否则退 1 |

### 诊断的来源与边界

- **走与 CLI 相同的包上下文**（`Pkg.contextForFile`）：有 `module` 头的文件用
  `Loader.loadModuleSource`（模块按库模块加载），无头的入口文件用 `loadProjectSource`；
  随后 `Dt.dtCheckSource` 做 `elabProgramFull`。**含 `import` 的文件同样做类型检查**。
- 错误串 `<file>:<line>:<col>: message` 转成 LSP 的 0-based range；依赖模块的错误按
  `spanFile` 过滤（只发当前文件），无位置的错误归当前文件。
- lint findings 合并进同一 `publishDiagnostics`：severity 2、`code` 为 `LN_*` 规则码、
  `source: "vuna"`。
- 已知边界（模块头注释同步记录）：`didChange` 全量重新精化（大文件可能滞后，编辑器端应
  去抖）；依赖的未保存改动读盘；Index 每进程一次、不随编辑刷新；首次索引查找可能触发
  `.local/index/` 全量重建（仓库级秒级，期间请求排队）；没有洞的文件 hover 不跑精化，
  含洞的文件每次 hover 会重跑一次整模块精化；多根 workspace 取首个文档；一次只发首个编译
  错误。
- URI：`file://` + `%XX` 解码；非 file / 不存在的路径用 cwd 包上下文，不崩溃。

### 编辑器冒烟

`test/corpus/lsp/smoke.sh` 是自包含脚本（只依赖 POSIX sh + 传入的 vuna），真的把帧从 stdin
喂给 `vuna lsp` 并断言 stdout 上的 JSON；覆盖两模块临时包、含 import 的类型错误、
formatting、documentSymbol、definition、references、completion、lint 诊断、URI 解码与
退出码：

```console
sh test/corpus/lsp/smoke.sh ./result/bin/vuna
```

它校验：stdout 只含协议帧、每帧 `Content-Length` 与正文长度一致、诊断范围 0-based、
shutdown/exit 退出码，以及**交互式帧读取**（第 18 项：body 后无换行时 `initialize` 也必须
立刻响应）和**符号 hover 的 range 落点**（第 19 项）。`test/run-tests.sh` 的 LSP 段调用它。

## 3. `vuna doc`

`vuna doc` 渲染声明面：

- `trait Pretty a where` 渲染为 `trait Pretty a where` 与其方法签名；
- 隐式 Pi 渲染成 `{a : Type} -> ...`（`Vuna.Doc` 的 `EPi` 分支按 `implicit` 决定花括号）；
- 尊重 `[export].modules`：目录是含 `[export]` 的包时只输出导出模块。

```console
$ vuna doc <dir> <out.md>
```

输出文件的**父目录必须已存在**（`doc` 不创建目录）。

## 4. 错误码体系

诊断输出带**错误码**：Elab/Codegen 为 `文件:行:列: [CODE] 消息`（Codegen 无位置则无
`行:列:`），lint 为 `路径:行:列: [CODE] 规则: 消息`。域前缀：

| 域 | 含义 | 真源 |
| --- | --- | --- |
| `TC_` | Elab 精化 / 终止性 / 覆盖性诊断 | `compiler/lib/Vuna/Compiler/Diagnostics/Tc.vuna` |
| `CG_` | Codegen / Driver / Dt 诊断 | `Diagnostics/Cg.vuna` |
| `LX_` | 词法诊断 | `Frontend/Diagnostics.vuna` |
| `PS_` | 语法诊断 | 同上 |
| `LD_` | Loader / 包 / 能力诊断 | `Loader/Diagnostics.vuna` |
| `LN_` | lint 规则 | `lib/Vuna/Lint/Diagnostics.vuna` |
| `FX_` | 错误修复规则（从可修复 `LN_` 推导，`FX_` + 规则名去 `-`） | `lib/Vuna/Lint/Diagnostics.vuna` |

约定：符号**语义稳定、只增不删**；同语义消息**共享**一个符号；**一个码只承载一种语义**。

不分配符号的三类（仍走裸字符串）：`DT: internal:`（编译器内部不变量）、**错误包装器**
（给下层错误加上下文，如 `in \`<def>\`: <inner>`、`json: <inner>`）、**工具链 CLI 错误**
（`no such symbol` / `file not found` / `json: ...` 等，不属编译器诊断）。

**真源是域枚举**：`Diagnostics.Tc` / `Diagnostics.Cg` 的 `TcErr` / `CgErr` 是 `Nat` 索引
族，构造子携带消息模板（`<0>` / `<1>` 为插值），**arity 由类型索引在编译期锁定**；
`tcAll` / `cgAll` 是文档遍历源。报错点统一用 `tcErr0/1/2`、`cgErr0/1`、`lexErr0`、
`psErr0/1` 抛出。

**完整清单**由 `vuna gen-errors [ROOT]` 遍历上述枚举表生成到
`ROOT/docs/.generated/errors.md`（默认 ROOT=`.`）。生成物 gitignored、**勿手改**；重跑幂等。

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
| `TC_ConstraintNotDict` | 精化 | 约束项不是单参数 trait 应用 |
| `TC_InstanceMissingMethod` | 精化 | 实例漏实现方法 |
| `TC_CannotProveTermination` | 终止性 | 递归调用没有结构下降 |
| `TC_NotExhaustive` | 覆盖性 | 漏写可达分支 |
| `TC_ImpossibleBranchIndex` | 覆盖性 | 写了索引不可达分支 |
| `TC_NotInductiveFamily` | 精化 | 对非归纳族做 case |
| `TC_UnknownConstructorInCase` | 精化 | 分支构造子不属于该族 |
| `TC_CtorDoesNotReturn` | 精化 | 构造子结果族不符 |
| `CG_TypeLevelBindingRuntime` | codegen | 运行时用到被擦除绑定 |
| `CG_TypeUsedAtRuntime` | codegen | 运行时出现类型项 |
| `CG_AxiomAtRuntime` | codegen | 运行时使用 axiom |
| `CG_MainReturnType` | codegen | `main` 返回类型不支持 |

## 5. 尚未实现（工具链自身缺口）

- **case splitting**：按洞的目标类型自动展开 `case` 分支（需要与编辑器协议配合）。
- `rewrite` / `with` 等证明工程 ergonomics：研究储备，未排期。
- **语义索引**：Index 仍是 parse 级（签名必填 ⇒ 语法索引即语义面，不另建语义索引）。

阶段与债务归属见 [roadmap.md](../roadmap.md) / [debt.md](debt.md)；测试入口见
[testing.md](testing.md)。
