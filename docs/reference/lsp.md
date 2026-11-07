# LSP server（`vuna lsp`）

> 本文从 [tooling.md](tooling.md) 拆出，避免工具链入口页超过上下文预算；LSP 的
> 帧格式、方法、模块解析、诊断来源与编辑器冒烟都在这里。


`vuna lsp` 是一个 **JSON-RPC 2.0 over stdio** 的语言服务：从 stdin 读帧、向 stdout 写帧，
日志一律走 stderr。它是根包工具链模块（`lib/Vuna/Lsp.vuna` + `Lsp.Protocol` /
`Lsp.Diagnostics` / `Lsp.Query` / `Lsp.Bindings`），**永不进入 seed 闭包**。

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
| `initialize` | capabilities：Full 同步、hover、completion（`.` 触发）、definition、references、documentSymbol、documentFormatting、workspaceSymbol、codeAction（只声明 `quickfix`）；`serverInfo` |
| `initialized` | 通知，无响应 |
| `textDocument/didOpen` / `didChange` / `didClose` | 内存维护打开文档表（Full 同步） |
| `textDocument/publishDiagnostics` | 包上下文解析 / DT 精化 / 覆盖性诊断 + lint 诊断 |
| `textDocument/hover` | 洞（`_` / `?name`）的目标类型与上下文（容错查询；文本里没有洞 token 时跳过精化）→ 模块引用（`import` / 导出项 `module B` / 模块头 / 限定名前缀；带模块 docstring）→ 局部绑定（参数 / λ / `let` / `where` / `case` / `do` / `as` / 模式；语法级类型与值）→ 标识符签名 + `-- |` docstring（多行保留）。普通注释不进入 hover。`range` 落在**光标 token** 上（不是符号定义位置）——客户端用它判断 hover 何时失效 |
| `textDocument/formatting` | `Vuna.Fmt.formatSourceWith` 全文替换 TextEdit（fixity 取程序级可见闭包）（解析失败返回空） |
| `textDocument/documentSymbol` | AST 声明树（data/record/trait 带子节点） |
| `textDocument/definition` | 模块引用 → 目标模块文件的 `module` 头名字；局部绑定 → 当前缓冲 binder 名字；否则 Index 符号 → 同文件兜底 |
| `textDocument/references` | Index：token → 符号；references 用 `Ref` 的精确行 / 列 |
| `textDocument/completion` | 关键字 + 当前缓冲顶层符号 + Index 符号；`.` 后按模块过滤 |
| `textDocument/codeAction` | lint finding 的 **quick fix**（M38）：只对可自动修复（`findingEdit`）且行范围与请求 range 相交的 finding 生成 `{title:"fix: <rule>", kind:"quickfix", diagnostics:[{code}], edit:{changes}}`；另给 `fix all lint findings`（`Lint.Fix.fixLoop` 的整文档替换）；cap 20；`context.only` 不含 `quickfix` → 空数组 |
| `workspace/symbol` | Index 符号过滤（有上限） |
| `shutdown` / `exit` | 正常退出语义：收到 shutdown 后 exit 退 0，否则退 1 |

### 模块名与局部绑定的解析（M40）

`hover` / `definition` 在洞与 Index 之间插了一步 `Vuna.Lsp.Bindings`（**parse 级**、不触发
`.local/index/` 构建；解析失败或未命中就退回原路径）：

- **模块引用**：`import` 的模块名 / alias、导出项 `module B`（全名或 alias）、模块头自身、
  限定名的模块前缀（`Base.List.map` 光标落在 `List` ⇒ 模块 `Base.List`；落在 `map` ⇒ 不命中）。
  模块名 → 文件按**包上下文模块根**探测（`Pkg.contextForFile` 的 roots：本包 `lib/` 在前、
  依赖闭包在后，workspace 外的依赖包也能定位）；模块 docstring 走 `Doc.Comments.docTableOf`
  （当前文件用缓冲，其他模块读盘）。找不到路径时 hover 只给 `module <全名>`，definition 为空。
- **局部绑定**：顶层函数参数（类型按同名签名的箭头链）、λ 参数、`let` / `where`（签名行
  `EAnn` 给出类型；值能单行打印时同时显示 `= 值`）、`case` 分支模式、`do` 绑定、`as` 模式、
  记录模式字段。作用域是**顺序**的（后续绑定可见前面、不互递归，与精化器一致），最内层优先；
  局部名优先于同名顶层符号。
- **语言层边界**：局部绑定**没有推断类型**（`Ctx` 不记录位置，精化器没有「位置 → 局部类型」
  入口；类型只取语法可得来源）；λ 参数位置由 λ 头部文本按序推导、`as` 名按 `@` 定位、记录 pun
  用字段名起点；Pi / 类型级 binder 不解析；`references` 对局部名仍按名字全局匹配。

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
  错误；`codeAction` 每次重算 fixity + lint（无进程内缓存），只产出 `quickfix`。
- M40 新增边界：模块 hover 每次读目标文件（未保存改动不反映，与依赖诊断一致，无进程内缓存）；
  局部绑定没有推断类型、Pi 名字不解析、`references` 不识别局部名；洞查询用容错入口，
  跳过用量/终止性校验（只影响 hover / `goal`，不影响 `check`）；同名 `?name` 不共享求解。
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
立刻响应）、**符号 hover 的 range 落点**（第 19 项）与 **codeAction quick fix**（第 21 项：
`kind`/`title`/`newText`/0-based range、fix all、`context.only` 过滤）。`test/run-tests.sh`
的 LSP 段调用它。

M40 起还覆盖（第 26–28 项）：模块名 hover/definition（import 名字、导出项 `module B`、
模块头、模块 docstring）、局部绑定 hover/definition（参数类型、λ、`let` 值、遮蔽：
body 指向 `let` binder / 值指向函数参数）、未解 `_` 洞的目标+上下文（容错查询）、
命名洞 `?goal` 的名字/目标/上下文与 range 覆盖；传输层边界（坏 JSON 帧 / 无
`Content-Length` / 超大帧声明 / 半帧 EOF）在第 22–25 项。CLI 侧的目标查询与 `?name` 的
fmt/lint/check 行为在 `test/run-tests.sh` 第 35b 段。

