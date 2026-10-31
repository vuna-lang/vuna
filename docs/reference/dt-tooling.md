# DT 工具链与证明工程（M17）

本文记录 M17 阶段 DT 路径的**工具链**：洞目标显示、LSP server、`vuna doc` 对接口与
隐式签名的支持，以及 DT 的错误索引。语言语义本身见 [dt.md](dt.md)，设计与实现边界见
[docs/dt-core.md](../dt-core.md)。

M17 的定位是「让 DT 日常可用」：M13/M14/M15/M16 解决了**能不能写**（Core TT、索引族、
隐式与接口、终止性），M17 解决**写起来顺不顺手**。

## 1. `vuna goal`：洞目标与上下文

DT 里 `_` 是一个洞（hole）。`vuna goal` 列出文件里每个洞的位置、目标类型与上下文：

```console
$ vuna goal test/corpus/dt/15_goal.vuna
test/corpus/dt/15_goal.vuna:7:11: goal Type
```

- 位置是 `文件:行:列`，与所有其他诊断一致（**1-based**）。
- 目标类型是精化后 zonk（代入已解元变量）再打印的。
- 若文件里没有洞，输出 `<file>: no holes`。
- 只对 DT 文件有意义：HM 路径没有洞的概念。

被**解出**的洞不会出现在列表里（`main = id _ 7` 里那个 `_` 由实参 `7` 定成 `Int`，
因此 `goal` 只报真正未解的洞）。未解的洞在 `check` / `compile` 时报：

```
DT: unsolved hole <文件>:<行>:<列> with goal <目标类型>
```

实现入口：`Vuna.Compiler.Elab.goalsOfProgram`（返回 `List DtGoalInfo`，含 span、
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

### 已实现的方法

| 方法 | 行为 |
| --- | --- |
| `initialize` | 返回 capabilities（`textDocumentSync` 用 Full=1、`hoverProvider=true`）与 `serverInfo` |
| `initialized` | 通知，无响应 |
| `textDocument/didOpen` / `didChange` / `didClose` | 内存维护打开文档表（Full 同步） |
| `textDocument/publishDiagnostics` | 服务端 → 客户端：解析 / 类型检查 / 穷尽性诊断 |
| `textDocument/hover` | 落在 DT 洞 `_` 上时返回目标类型（markdown 代码块）与上下文 |
| `shutdown` | 返回 `result: null` |
| `exit` | 进程以 0 退出 |

`workspace/symbol`、`textDocument/completion` / `definition` / `references` /
`documentSymbol` / `formatting` / `codeAction` 等**显式返回空结果**，避免客户端报错。

### 诊断的已知边界

LSP 第一版**不做包解析**：

1. `parseSource` 失败 ⇒ 只发一条 parse 诊断；
2. 解析成功 ⇒ 走 HM 检查（`checkProgramInfoElab` + `exhaustiveWarningsFor`），
   把 `<file>:<line>:<col>: message` 转成 LSP range（**0-based**，所以行列各减 1）；
3. **含 `import` 的文件跳过类型检查**（缺 import 解析），只保留 parse 诊断。

### 编辑器冒烟

`test/corpus/lsp/smoke.sh` 是自包含脚本（只依赖 POSIX sh + 传入的 vuna），
真的把帧从 stdin 喂给 `vuna lsp` 并断言 stdout 上的 JSON：

```console
sh test/corpus/lsp/smoke.sh ./result/bin/vuna
```

它覆盖：initialize capabilities、`didOpen` 后收到类型错误诊断、`didChange` 修正后诊断
清空、hover 命中洞返回 `Type`、`shutdown` 返回 null、`exit` 退出码 0，并校验
stdout 只含协议帧、每帧 `Content-Length` 与正文长度一致。

`test/run-tests.sh` 第 35 段调用它。

## 3. `vuna doc` 与接口 / 隐式签名

`vuna doc` 现在能正确渲染 DT 的声明面：

- `trait Pretty a where` 渲染为 `trait Pretty a where` 与其方法签名；
- 隐式 Pi 渲染成 `{a : Type} -> ...`（`Vuna.Doc` 的 `EPi` 分支按 `implicit` 决定花括号）。

```console
$ vuna doc <dir> <out.md>
```

注意输出文件的**父目录必须已存在**（`doc` 不创建目录）。

## 4. DT 错误索引

| 消息 | 阶段 | 触发条件 | 阶段 |
| --- | --- | --- | --- |
| `DT: cannot infer the type of a hole; give it an expected type` | 精化 | `_` 出现在推断位置 | M13 |
| `DT: unsolved hole <loc> with goal <ty>` | 精化 | 洞最终未被求解（带目标） | M15 |
| `DT: unsolved metavariable ?k` | 精化 | 非洞的元变量未解 | M13 |
| `DT: cannot solve metavariable ?k (occurs check)` | 精化 | 解里出现自身 | M13 |
| `DT: cannot solve metavariable ?k (solution would escape its scope)` | 精化 | 解引用了创建之后才绑定的局部变量 | M15 |
| `DT: cannot solve higher-order metavariable ?k (M15 limitation)` | 精化 | 带 spine 的元变量 | M15 |
| `DT: no instance found for <dict type>` | 精化 | 接口字典找不到实例 | M15 |
| `DT: ambiguous instance for <dict type> (candidates: ...)` | 精化 | 多个实例头部都能统一 | M15 |
| `DT: unknown interface <C> in instance head` | 精化 | instance 头不是已声明接口 | M15 |
| `DT: instance head must be an interface application (e.g. Show Int)` | 精化 | instance 头形态不合法 | M15 |
| `DT: instance is missing an implementation of <m>` | 精化 | 实例漏实现方法 | M15 |
| `DT: interfaces must have exactly one parameter (M15 limitation)` | 精化 | 多参数接口 | M15 |
| `DT: cannot prove termination of <f> (recursive call does not structurally decrease)` | 终止性 | 自递归调用的实参没有变小 | M16 |
| `DT: case is not exhaustive: missing <C>` | 覆盖性 | 漏写可达分支 | M14 |
| `DT: this branch is impossible (index constraints are unsatisfiable)` | 覆盖性 | 写了不可达分支 | M14 |
| `DT: case scrutinee is not an inductive family` | 精化 | 对非归纳族做 case | M14 |
| `DT: unknown constructor <C> in case` | 精化 | 分支构造子不属于该族 | M14 |
| `DT: constructor <C> does not return <F>` | 精化 | 构造子结果族不符 | M14 |
| `DT: nested patterns are not supported yet (M14 limitation)` | 精化 | 嵌套构造子模式 | M14 |
| `DT: multiple clauses are not supported yet (use a single equation; M16)` | 精化 | 多 clause 函数 | M14 |
| `DT: imports are not supported yet (single-file mode)` | 加载 | DT 单文件里写 `import` | M13 |
| `DT: module header is not allowed in entry file` | 加载 | DT 单文件里写模块头 | M13 |
| `DT: type-level binding <x> is used at runtime (M13 limitation)` | codegen | 运行时用到被擦除绑定 | M13 |
| `DT: a type is used at runtime (M13 limitation)` | codegen | 运行时出现类型项 | M13 |
| `DT: main must return Int, String or Bool (M13 limitation)` | codegen | `main` 返回类型不支持 | M13 |

## 5. 尚未实现（M17 之后）

- **case splitting**：按洞的目标类型自动展开 `case` 分支（需要与编辑器协议配合）。
- **DT 与包/模块集成**：DT 仍是单文件 `--dt` opt-in，`build` / `split` / `seed` 不接受
  `--dt`（留 M18）。
- **完整擦除**：索引仍保留运行时表示（见 [dt.md](dt.md) 与 M16 的记录）。
- `rewrite` / `with` 等证明工程 ergonomics：研究储备，未排期。

## 相关阅读

- DT 语言参考：[dt.md](dt.md)
- DT 设计与实现边界：[docs/dt-core.md](../dt-core.md)
- 工具链与 TCB 边界：[architecture.md](../architecture.md)
- 路线图：[docs/roadmap.md](../roadmap.md)
