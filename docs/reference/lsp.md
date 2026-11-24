# LSP server（`vuna lsp`）

> 本文从 [tooling.md](tooling.md) 拆出，避免工具链入口页超过上下文预算；LSP 的
> 帧格式、方法、模块解析、诊断来源与编辑器冒烟都在这里。


`vuna lsp` 是一个 **JSON-RPC 2.0 over stdio** 的语言服务：从 stdin 读帧、向 stdout 写帧，
日志一律走 stderr。它是产品 CLI 工具链模块（`packages/toolchain/lib/Vuna/Lsp.vuna` + `Lsp.Protocol` /
`Lsp.Diagnostics` / `Lsp.Query` / `Lsp.Bindings`），**永不进入 seed 闭包**。

启动参数只有 `--stdio`（空操作）：LSP 客户端惯例会把它加进 argv（例如
vscode-languageclient 在 `transport = stdio` 时无条件追加）。**stdout 只放协议帧**，启动日志
与参数错误都写 stderr（直接写 fd 2，stderr 是管道时也不会丢）。

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
| `initialize` | capabilities：Full 同步、hover、completion（`.` 触发）、definition、references、documentSymbol、documentFormatting、documentHighlight、foldingRange、semanticTokens（full；legend 见下）、workspaceSymbol、codeAction（`quickfix` + `refactor.rewrite`）、rename（`prepareProvider: true`）、executeCommand（`vuna.fixAllLint`）、diagnosticProvider（pull）；`serverInfo` |
| `initialized` | 通知，无响应 |
| `textDocument/didOpen` / `didChange` / `didClose` | 内存维护打开文档表（Full 同步）；声明 pull 能力的客户端只更新文档表，不触发 push |
| `textDocument/publishDiagnostics` | 包上下文解析 / DT 精化 / 覆盖性诊断 + lint 诊断（**仅**未声明 pull 能力的客户端；声明了 pull 的客户端只走 `textDocument/diagnostic`，否则客户端 push/pull 两个诊断集合会让同一条诊断显示两遍） |
| `textDocument/diagnostic` | **pull diagnostics**（LSP 3.17）：`{kind:"full", items:[...]}`，与 push 同一条诊断链与 JSON 字段；不额外发通知。pull 客户端（`initialize.params.capabilities.textDocument.diagnostic` 为对象）的唯一诊断通道 |
| `textDocument/hover` | 洞（`_` / `?name`）的目标类型与上下文（容错查询；文本里没有洞 token 时跳过精化）→ 模块引用（`import` / 导出项 `module B` / 模块头 / 限定名前缀；带模块 docstring）→ 局部绑定（参数 / λ / `let` / `where` / `case` / `do` / `as` / 模式；语法级类型与值）→ 标识符签名 + `-- |` docstring（多行保留）。普通注释不进入 hover。`range` 落在**光标 token** 上（不是符号定义位置）——客户端用它判断 hover 何时失效 |
| `textDocument/formatting` | `Vuna.Fmt.formatSourceWith` 全文替换 TextEdit（fixity 取程序级可见闭包）（解析失败返回空） |
| `textDocument/documentSymbol` | AST 声明树（data/record/trait 带子节点）；每个节点带 `detail`（与 `vuna api` 同源的签名文本，如 `fn : Int -> Int` / `data Wrap a`，成员节点是自己的类型），客户端大纲/面包屑据此显示签名 |
| `textDocument/semanticTokens/full` | 语义 token（delta 编码 `[deltaLine, deltaStartChar, length, tokenType, modifiers]`）：`Vuna.Lsp.Semantic` 用 **CST 词法流**（`Frontend.Cst.lexCst`）+ 当前文件**声明表**（data/record/trait 名 → type、构造子 → enumMember、record 字段 → property、函数/axiom/extern → function、trait 方法 → method、顶层子句参数 → parameter、模块前缀 → namespace、`name!` → macro、`?name` → variable + `hole` modifier）。字符串、注释与运算符**不产出**语义 token（会覆盖 TextMate 的插值/转义分层）。结果按 `(uri, 内容哈希)` 缓存在 `DocCache.dcTokens` |
| `textDocument/documentHighlight` | 光标符号的当前文件出现位置（`{range, kind:1}`）：局部绑定复用 `Bindings.bindingRenameOccurrences`（作用域精确，与 rename/hover 同源）；顶层符号退化为同名 `ident` token（CST 流，跳过注释/字符串）；关键字 / `_` / 软关键字回空数组 |
| `textDocument/foldingRange` | 按行首缩进的 offside 块（`Vuna.Lsp.Folding`）：缩进变深开块、回到同级/更浅关闭；空行不参与、不计入块尾；只发 ≥2 行的块（`kind: "region"`） |
| `textDocument/definition` | 模块引用 → 目标模块文件的 `module` 头名字；局部绑定 → 当前缓冲 binder 名字；否则 Index 符号 → 同文件兜底 |
| `textDocument/references` | Index：token → 符号；references 用 `Ref` 的精确行 / 列 |
| `textDocument/prepareRename` | 光标 token 的 range + placeholder；关键字 / base 标准库（`Int` 等）/ 未知符号 / 洞 / 非法新名 → `result: null`，不崩溃 |
| `textDocument/rename` | 局部绑定（参数 / λ / `let` / `where` / `case` / `do` / `as` / 记录字段 binder，当前文档）+ 顶层符号（函数/类型/构造子/记录字段/trait 方法/axiom/extern，含导出列表）；跨文件按 Index refs 跟进直接 import 目标模块的候选模块；返回 `WorkspaceEdit {changes}`，去重、cap 1000。边界：运算符/deriving/fixity/模块名不改，类型名在其它模块**签名**里的跨文件使用不跟进 |
| `textDocument/completion` | 关键字 + 当前缓冲顶层符号 + Index 符号；`.` 后按模块过滤；Index 项带 `detail`（签名）与 `documentation`（Markdown docstring，文本来源与 hover 一致：打开中的缓冲 > 磁盘），`label` 去重时 Index 优先 |
| `textDocument/codeAction` | 两类动作（cap 20，case split 在前、fix all 占最后一格）：<br>(1) lint finding 的 **quick fix**：只对可自动修复（`findingEdit`）且行范围与请求 range 相交的 finding 生成 `{title:"fix: <rule>", kind:"quickfix", diagnostics:[<diagnostic>], edit:{changes}}`；内嵌诊断复用 `Vuna.Lsp.Diagnostics` 的 finding→diagnostic 转换（与 `publishDiagnostics` 同一条 JSON：`range` / `severity` / `source` / `code` / `message`），客户端可按 `code` 关联到已有诊断；另给 `fix all lint findings`（**`Command` 形式**：`{kind:"quickfix", command:{command:"vuna.fixAllLint", arguments:[uri]}}`，不内嵌 edit）。<br>(2) **case split**（核心）：光标在洞（`_` / `?name`）上时，对洞上下文里**类型头可解析到非索引 data / record** 的每个 binder 生成 `{title:"case split on <name>", kind:"refactor.rewrite", edit}`：非索引 data 的 newText 为 `case <name> of` + 每构造子一行 `<Ctor> _... => _`（构造子参数用 `_` 占位；隐式构造子参数不进模式）；record 是单构造器（构造器名 = 类型名），只生成**一条** record 模式分支 `<Type> { <field> = _, ... } => _`（字段写全）。分支缩进 = 洞所在行行首缩进 + 2。构造子来源是 parse 级：当前缓冲 AST + 按包上下文模块根读依赖模块（`import qualified` 时写限定名 `Mod.Ctor` / `Mod.Type`，open import / 经 Prelude 重导出的 base 类型写短名）；类型头的应用文本按精化器 show 的左结合全括号递归剥括号（多参数 data 的 `((Base.Data.Pair.Pair Int) Bool)` 也能解析）。<br>`context.only`：quickfix 只在未限制或含 `quickfix` 时给；case split 只在未限制或含 `refactor` / `refactor.rewrite` 时给；不含对应 kind → 空数组。 |
| `workspace/executeCommand` | `vuna.fixAllLint`（arguments = `[uri]`）：按当前缓冲重算 lint + `Lint.Fix.fixLoop`，回 `result: null` 并发一条**服务器 → 客户端**的 `workspace/applyEdit` 请求（整文档替换 `WorkspaceEdit`；客户端应用，服务器不写文件、不等响应）。无改动时只回 null；未知 command → `-32602`。 |
| `workspace/symbol` | Index 符号过滤（有上限） |
| `shutdown` / `exit` | 正常退出语义：收到 shutdown 后 exit 退 0，否则退 1 |

### 模块名与局部绑定的解析

`hover` / `definition` 在洞与 Index 之间插了一步 `Vuna.Lsp.Bindings`（**parse 级**、不触发
索引构建；Index 查询失败或未命中就退回原路径）：

- **模块引用**：`import` 的模块名 / alias、导出项 `module B`（全名或 alias）、模块头自身、
  限定名的模块前缀（`Base.Data.List.map` 光标落在 `List` ⇒ 模块 `Base.Data.List`；落在 `map` ⇒ 不命中）。
  token 本身也作为候选（`Base.Data.Maybe Int` 这种「token 就是模块名」的类型/值写法，光标落在
  `Maybe` 也命中 `Base.Data.Maybe`）；但名字**外侧**的一格（`.` / 空格）不算模块名的一部分。
  模块名 → 文件按**包上下文模块根**探测（`Pkg.contextForFile` 的 roots：本包 `lib/` 在前、
  依赖闭包在后，workspace 外的依赖包也能定位）；模块 docstring 走 `Doc.Comments.docTableOf`，
  文本来源是**打开中的缓冲 > 磁盘**——服务器把 didOpen/didChange 维护的文档表交给 Bindings，
  所以同一个模块的 docstring 在它自己的文件与引用它的文件里是同一版本；符号 hover 也按同一条
  口径覆盖 Index 的 `symDoc`（Index 本身仍是磁盘快照）。找不到路径时 hover 只给
  `module <全名>`，definition 为空。
- **局部绑定**：顶层函数参数（类型按同名签名的箭头链）、λ 参数、`let` / `where`（签名行
  `Binding.bindSig` 给出类型；值能单行打印时同时显示 `= 值`）、`case` 分支模式、`do` 绑定、`as` 模式、
  记录模式字段。作用域是**顺序**的（之后的绑定可见前面的、不互递归，与精化器一致），最内层优先；
  局部名优先于同名顶层符号。
- **语言层边界**：局部绑定**没有推断类型**（`Ctx` 不记录位置，精化器没有「位置 → 局部类型」
  入口；类型只取语法可得来源——签名 `Binding.bindSig` / 函数签名箭头链 / Pi domain）；λ 参数位置由 λ 头部
  文本按序推导、`as` 名按 `@` 定位、记录 pun 用字段名起点。Pi / 类型级 binder **已可解析**、
  `references` **已识别局部名**（见下）。复用容错精化（`goalsOfProgramTolerant`）给 binder 补
  推断类型的路径已实测否决：它只返回洞位置的名字→类型快照（无位置信息）、只覆盖洞作用域内可见
  的 binder、hole-free 文件无洞可依、同名遮蔽无法区分（按 name 匹配会给错类型）；且让 binder
  hover 走精化会把 hole-containing 文件的每次 binder hover 从 ~5ms 拖到 ~54ms（实测），拖慢
  整文件其它 hover——推断类型需精化器的「位置 → 局部类型」入口，保持 parse 级边界。
- **Pi / 类型级 binder**：`walkExpr` 的 `EPi` 分支在光标落在 binder 名上时把该 binder 当
  局部绑定返回，类型取 domain 的语法类型（`renderType dom`）；binder 名位置靠文本推导（Pi 的
  span 覆盖整个表达式，不落在名字上，故从 domain 起点向左回扫跳过空格 / `:` 再比对名字，
  `piNamePos` / `piNameStart`）。匿名箭头（`A -> B`，名字是 `_`）回落到 domain/codomain 遍历。
  **可达性**：Pi 类型住在**签名 / 类型注解**里，而 `walkExpr` 只 walk 值 / 表达式位置——所以顶层
  签名由 `findDeclBind` 额外把 `DSig` 的完整签名类型（`declSigType`，区别于丢 binder 名的
  `arrowDomains`）经 `sigPiBind` 喂给 `walkExpr`，光标在签名 binder 上即命中（含带 `where` 的
  签名）。**仍未覆盖**：`let` / `where` 局部绑定的类型注解里的 Pi binder（走 `walkBinds` /
  `walkBindValue`，其 `arrowDomains` 不递归进 Pi binder 名），这类 hover 仍为 null。
- **`references` 识别局部名**：光标落在局部绑定上时，返回该 binder 在当前文档作用域内的
  全部出现位置（定义 + 使用，遮蔽同源，复用 rename 的 `bindingRenameOccurrences`），而不是按
  名字全局匹配（那会把同名顶层符号 / 其它作用域的同名局部混进来）；局部未命中才回落 Index refs。

### 诊断的来源与边界

- **走与 CLI 相同的包上下文**（`Pkg.contextForFile`）：有 `module` 头的文件用
  `Loader.loadModuleSource`（模块按库模块加载），无头的入口文件用 `loadProjectSource`；
  随后 `Dt.dtCheckSourceIncremental`（会话/接口可用时）或 `Dt.dtCheckSourceChecked`
  做精化与 codegen 检查。**含 `import` 的文件同样做类型检查**。
- **push / pull 按客户端能力二选一**：`initialize` 里客户端声明
  `capabilities.textDocument.diagnostic` 时服务器只响应 `textDocument/diagnostic`，
  didOpen/didChange/didClose 不发 `publishDiagnostics`；未声明的客户端（含
  `capabilities: {}` 的冒烟脚本）继续走 push。`serverCapabilities` 始终声明
  `diagnosticProvider`（客户端据此决定用哪条通道）。回归测试：
  `packages/cli/test/steps/64_lsp_pull.steps`（pull 客户端 0 条 push）与
  `packages/cli/test/steps/44l1_lsp_inc.steps`（push 客户端）。
- 错误串 `<file>:<line>:<col>: message` 转成 LSP 的 0-based range；依赖模块的错误按
  `spanFile` 过滤（只发当前文件），无位置的错误归当前文件。
- lint findings 合并进同一 `publishDiagnostics`：severity 按 `vuna.toml [lint]` 的有效规则
  （error→1 / warn→2）、range 使用 finding 的起止位置（UTF-16 换算）、`code` 为 `LN_*`
  规则码、`source: "vuna"`；源码 `vuna-lint:` 抑制与 CLI 同一条 `lintSourceWithConfig` 路径。
  `codeAction` quick fix 内嵌的 `diagnostics` 复用**同一条**
  `Diag`→JSON 转换（`Vuna.Lsp.Diagnostics.findingDiagJson`），所以字段集合与已发布诊断
  一致（range / severity / source / code / message），客户端按 `code` 直接关联。
- 已知边界（模块头注释同步记录）：`didChange` 全量重新精化（大文件可能滞后，编辑器端应
  去抖）；依赖的未保存改动读盘；Index 每进程一次、不随编辑刷新；首次索引查找可能触发
  索引节点全量重建（仓库级秒级，期间请求排队）；多根 workspace 取首个文档；一次只发首个编译
  错误；`codeAction` 每次重算 fixity + lint（诊断 suggestion 按内容缓存），并产出 quickfix /
  `refactor.rewrite` case split / `vuna.fixAllLint` command；`rename` 的跨文件范围基于 Index（磁盘内容），未保存的其它模块改动不反映，且不跟进类型名在其它模块签名里的使用。
- semantic tokens / documentHighlight 边界：声明表按**名字**匹配，不做作用域区分（同名遮蔽、
  跨模块同名符号按名字归类；局部 binder 的精确作用域只在 documentHighlight 的
  `bindingRenameOccurrences` 路径上）；宏 `name!` 只覆盖紧邻 `!` 的调用形态；词法失败时
  返回空数组，编辑器继续用 TextMate 语法。语义 token 是**叠加**层：legend 改动必须同步
  `vscode/package.json` 的 `semanticTokenScopes`，否则非默认主题会退化成默认色。
- case split 边界：只在请求 range 的行文本里有洞 token 时才取洞目标（目标按 (uri, 文本内容)
  缓存，hover 与 codeAction 共用；同行有洞就会触发，列位置再由 goal span 精确判定）；构造子
  信息是 parse
  级，依赖模块每次读盘（未保存改动不反映）；枚举**非索引 `data`（多分支）与 `record`
  （单分支，record 模式）**；索引族仍不枚举——索引约束在 parse 级不可知，枚举全部构造子会
  写出精化器以 `TC_ImpossibleBranchIndex` 拒绝的不可达分支（实测 `Vec (Succ n) a` 的
  `Nil` 分支就是这样被拒的）；`axiom` / 函数类型 / Pi binder 没有可枚举的构造子，同样不给
  动作（安全降级，不报错）。**没有可展开的类型别名**：类型文本是精化器 show 的规范全名
  （`Dep.Point` / `B.Local`），`infix ... = x` 只是值层运算符别名（不产生类型声明），
  `axiom` 是不透明类型（无右侧）；`import ... as` 的模块别名也不会出现在类型文本里。
  构造子名 / record 类型名按作用域选短名 / `Mod.` 限定名，两者都不成立（类型只经函数签名
  间接可见）也不给动作；隐式构造子参数（`{a: Type} ->`）不写进模式；record 分支字段全写
  `_`；洞在**类型位置**时生成的 `case` 不是合法表达式（goal API 不区分表达式/类型位置，
  action 只是建议）。`fix all` 的 command 形式依赖客户端支持 `workspace/applyEdit`
  （不支持的客户端不会应用修正）。
- 模块 hover / 符号 hover 的 docstring 以**打开中的缓冲**为准，未打开的目标才读盘；判定仍然
  是每次请求重算（无进程内缓存）。Index 本身不随 didChange 刷新，所以「打开文件之外」的符号
  文档仍是磁盘版本；
  局部绑定没有推断类型（Pi binder 的类型取 domain 语法类型，λ / `let` / `case` 仍无推断类型）；
  洞查询用容错入口，跳过用量/终止性校验（只影响 hover / `goal`，不影响 `check`）；同名 `?name`
  不共享求解。Pi binder 解析与 `references` 局部名识别已支持（见上）。
- URI：`file://` + `%XX` 解码；非 file / 不存在的路径用 cwd 包上下文，不崩溃。

### 请求延迟与缓存

主循环严格串行（一次一帧），所以**任何单请求的长耗时都会被后面的请求排队放大**。目标是把
编辑器高频请求（hover / codeAction / documentSymbol 的重复触发）压到毫秒级：

- **hover 的洞门控按光标行**：只有光标所在行出现 `_` / `?name` 才取洞目标；文件别处有洞
  不触发精化。没有洞的行走 Bindings / Index（毫秒级）。
- **洞目标三级来源**（`Lsp.Diagnostics.goalsForDoc`）：
  1. 增量装配（依赖包接口 + 本包干净模块预置，`Dt.dtGoalsSourceIncremental`）——语义最完整，
     需要本机 iface 对象可用；
  2. 只精化当前 buffer（与 `vuna goal` 同源）：分钟级 store 失效时仍可用，导入类型的签名
     解不开时不产出目标（hover 退化到符号查询）；
  3. 整包从源码加载（`dtGoalsSourceTolerant`）只在 **codeAction case split** 需要完整洞上下文
     时才用作最后回退。
- **内容缓存**（`LspState.DocCache`，key = uri + 文本内容哈希，上限 8）：洞目标与诊断
  suggestion 各缓存一份；同一 buffer 的重复 hover / codeAction 是毫秒级，文本一变即失效。
  pull 诊断另有帧缓存（`stateDiagCache`，上限 32），重复 `textDocument/diagnostic` 直接重放。
- **会话（`DiagCache`）**：诊断 / codeAction 会建立（或复用）工具会话；hover **不**主动建会话
  （建会话要算依赖接口闭包，冷 store 上秒级），已有会话时直接复用。
- **本包干净模块**（增量的预置集合）：`[export]` 为空的入口包也会写模块接口（模块面 =
  入口闭包），所以产品包不需要 `[export]` 就能复用。判定分两步：逐模块自身判据（接口自证 /
  源新鲜 / 缓存程序可用 / 无缺失依赖）→ 依赖链**定点**（本包模块的依赖必须命中依赖表或已收
  干净模块；枚举顺序不保证拓扑序，单遍会连锁误判）。缺一个模块的接口只跳过它自己，不让整组
  作废。每个请求还会对本包干净模块做 stat/内容校验，外部改同包模块后同一进程下次请求即失效。
- **会话要求 iface 与当前编译器 tag 匹配**：换了编译器二进制后旧 iface 失配，`vuna check <pkg>`
  / `vuna build` 用同一个二进制跑一次即可恢复；失配时观测里能看到
  `vuna.tool.iface.miss.<模块>` 与 `vuna.lsp.session.unavailable`。
- **取消**：`$/cancelRequest` 记 id（上限 64），派发前发现已取消就直接回 `-32800`
  （RequestCancelled），不执行。阻塞式读 stdin 下无法打断**已开始**的精化。
- **归因**：`VUNA_OBS=1` 时每个请求一个 `lsp.<method>` 跨度，洞目标路径有
  `vuna.lsp.goals.{incremental,local,full}` 标记与 `vuna.lsp.goals.{setup,elab}` 子跨度。
  `bench/lsp-probe.py` 是可重复探针（hover 非洞行 / 洞上 / 重复、codeAction、documentSymbol、
  pull 诊断），读数见 [performance.md](performance.md)。

### 编辑器冒烟

`packages/cli/test/corpus/lsp/smoke.sh` 是自包含脚本（只依赖 POSIX sh + 传入的 vuna），真的把帧从 stdin
喂给 `vuna lsp` 并断言 stdout 上的 JSON；覆盖两模块临时包、含 import 的类型错误、
formatting、documentSymbol、definition、references、completion、lint 诊断、URI 解码与
退出码。跑之前先构建固定的二进制（`result` 是共享 out-link，可能指向旧二进制或别的
产物），再调用脚本：

```console
nix build .#vuna --out-link result
sh packages/cli/test/corpus/lsp/smoke.sh ./result/bin/vuna
```

它校验：stdout 只含协议帧、每帧 `Content-Length` 与正文长度一致、诊断范围 0-based、
shutdown/exit 退出码，以及**交互式帧读取**（第 18 项：body 后无换行时 `initialize` 也必须
立刻响应）、**符号 hover 的 range 落点**（第 19 项）、**codeAction quick fix**（第 21 项：
`kind`/`title`/`newText`/0-based range、fix all 的 Command 形式、`context.only` 过滤）与
**rename/prepareRename**（第 29 项：顶层函数改名、遮蔽下的局部变量、记录字段、关键字/内建
拒绝）。`packages/cli/test/steps/35_goal_lsp.steps` 的 LSP 段调用它。

还覆盖：模块名 hover/definition（import 名字、导出项 `module B`、
模块头、模块 docstring；同一模块在引用处与自身文件里取**同一版本**的文档）、局部绑定
hover/definition（参数类型、λ、`let` 值、遮蔽：body 指向 `let` binder / 值指向函数参数）、
`documentSymbol` 的 `detail`（函数/类型头/ctor/field）与成员 hover 的 docstring、
`completion` 的 `documentation`（缓冲优先）与 `detail`、未解 `_` 洞的目标+上下文（容错查询）、
命名洞 `?goal` 的名字/目标/上下文与 range 覆盖；传输层边界（坏 JSON 帧 / 无
`Content-Length` / 超大帧声明 / 半帧 EOF）在第 22–25 项。CLI 侧的目标查询与 `?name` 的
fmt/lint/check 行为在 `packages/cli/test/steps/35_goal_lsp.steps` 的 35b 段。

再覆盖：**case split**（洞 + 上下文 data / record binder →
`refactor.rewrite`；构造子顺序 / `Box _` 参数通配 / 隐式构造子参数不进模式 / 分支缩进 =
洞行缩进 + 2 / base 类型经 Prelude 解析 `Bool → False/True` / 多参数 data 的左结合应用
类型文本 `Either Int Bool` / 函数类型 binder 与无洞行不给动作 / `context.only` 过滤 /
record 单分支：本模块 `Pt { ptX = _, ptY = _ }` 与参数化 `Pairing { left = _, right = _ }`）、
**command 形式**（codeAction 带 `command`、executeCommandProvider 声明、
`workspace/executeCommand` → `workspace/applyEdit` 整文档替换、未知 command `-32602`）、
**限定 import、命名洞与安全降级**（`Dep.Red` / `Dep.Point` 限定名、`?goal` 的编辑 range
覆盖整个 token、`axiom` 不透明类型不给动作、索引族 `xs : Vec ...` 跳过而同一洞的
`n : Nat` 仍给动作）；lint quick fix 的**内嵌完整诊断**（range / severity / source / code /
message）在第 21 项断言。

再覆盖：**高亮 / 折叠**（第 26g 项）——`semanticTokens/full` 的 5 元组长度、类型覆盖
（构造子 / 函数 / 字段 / 关键字 / 宏 / 洞 modifier）、`documentHighlight` 的局部 binder
定义 + 使用两处与关键字回空、`foldingRange` 的 `let` 块与顶层函数体范围。语义 token 的
legend 与 `vscode/package.json` 的 `contributes.semanticTokenScopes` 按名字对应；改 legend
顺序必须两边同步（`packages/cli/test/steps/83_vscode_grammar.steps` 锁关键字表同源，smoke 锁
legend 的形状与覆盖）。

