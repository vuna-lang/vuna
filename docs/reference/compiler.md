# 编译器参考：模块职责、codegen 表示与优化

本文覆盖 `compiler/` 包（`vuna-compiler`，模块 `Vuna.Compiler.*`）的模块职责与 codegen
实现要点。子系统的数据流与“改哪里”速查见 [architecture.md](../architecture.md)，
种子与自举链见 [bootstrap.md](bootstrap.md)。

## 模块地图

`compiler/` 是编译器包（seed 的唯一来源）。入口 `compiler/app/Main.vuna` 的
import 闭包就是 `seed/` 的内容；工具链（fmt/lint/repl/doc/test/lsp）在根包 `lib/`，
不在闭包里。

| 模块 | 职责 | 关键入口 |
| --- | --- | --- |
| `Vuna.Compiler.Common` | 编译器门面：整模块重导出 `Base.Pair`/`Bool`/`List`/`Maybe`/`Result`/`String`，并保留 `Pos`/`Span`、模块路径与诊断工具 | `showSpanLoc`、`suggest`、`splitPath` |
| `Vuna.Compiler.Ast` | 语法类型与 AST helper（`Expr`/`Decl`/`Pat`/`Ctor`/`Import`/`ModDecl`） | `clausesFor`、`funArity`、`declNames` |
| `Vuna.Compiler.Lexer` | 字符游标、token 与位置；注释单独 lex 出来供 formatter 使用 | `lexSource`、`lexComments` |
| `Vuna.Compiler.Parser` | offside layout parser → AST + imports；`where` 块与绑定签名行 | `parseSource`、`parseExpressionSource` |
| `Vuna.Compiler.Builtins` | 内建函数名字与元数（供 Loader 识别内建名） | `builtinArity` |
| `Vuna.Compiler.Toml` | TOML 子集解析器 | `parseToml`、`lookupEntry` |
| `Vuna.Compiler.Manifest` | `vuna.toml` 的语义模型与结构校验（不做 I/O） | `parseManifest`、`validateManifest` |
| `Vuna.Compiler.Pkg` | 包 / workspace 解析层：manifest 图、依赖 DAG、模块根（不碰 Loader / CLI） | `loadPackage`、`workspacePackages`、`packageRoots` |
| `Vuna.Compiler.Loader` | import 图、模块根与 `[export]` 可见性、名字解析、`Prelude` 自动导入、flatten；effectful 内建的包级限制 | `loadProject`、`resolveProject`、`loadProgram` |
| `Vuna.Compiler.Split` | split 输出模型：`SplitFile`、模块顺序、`build.sh` 生成 | `writeSplitFiles`、`splitCompileOrder`、`buildScript` |
| `Vuna.Compiler.SplitCli` | 包模式 split 入口（`build --split` / `seed`） | `buildSplit`、`seedSplit` |
| `Vuna.Compiler.Process` | 工具链进程执行入口（受包级 allowlist 限制，不进 `[export]`） | `runIn` |
| `Vuna.Compiler.Compile` | 编译入口：默认模块根、单文件 / 包目录 / 包级检查与编译、单文件输出形状 | `checkFileDt`、`compileFileDt`、`checkProjectDt`、`compileProjectDt`、`dtMainFile` / `dtBuildScriptName` |
| `Vuna.Compiler.CompilerCli` | 编译器自己的 CLI（`vuna-compiler`） | `runCompilerCli`、`compilerUsageLines` |
| `Vuna.Compiler.Core` | DT core 类型论表示、NbE 求值与定义性相等 | `eval`、`quote`、`conv`、`normalize`、`defaultFuel` |
| `Vuna.Compiler.Elab` | DT 双向精化器（一阶元变量、类型级隐式插入、索引族、洞目标） | `elabProgramFull`、`goalsOfProgram` |
| `Vuna.Compiler.DtKind` / `DtTerm` / `DtPrelude` / `DtQuant` | DT 支撑模块：trait 类参数 kind 推断、终止性检查（surface AST）、内建类型与实例名、签名自由类型变量量化 | `methodArgRigsOf`、`checkTerminationDecls`、`quantifyTopSig` |
| `Vuna.Compiler.DtMatch` | 多 clause 模式矩阵降级：构造子列 → `case`、字面量列 → `if` 链（纯 Ast→Ast 变换，从 Elab 拆出守模块预算） | `multiToExpr`、`buildColumnExpr` |
| `Vuna.Compiler.DtRecords` / `DtDerive` | `record` / `deriving` 的 DT 降级（单构造器 `data`、派生实例）；在 `Elab` 前跑 | — |
| `Vuna.Compiler.CoreCodegen` | 擦除检查 + OCaml 生成：单文件路径与逐模块 split（runtime prelude 在 `dtRuntime`） | `checkDtProgram`、`generateDtProgram`、`generateDtSplitProgram` |
| `Vuna.Compiler.Dt` | DT facade（供 `Compile` / `CompilerCli` / `Vuna.Interp` / `Vuna.Repl` 使用） | `dtCheckProject`、`dtCompileProject`、`dtSplitProject`、`dtEvalFile`、`dtEvalExpr` |

`compiler/vuna.toml` 的 `[export]` 只列编译器模块；`Process` 刻意不导出。

## 根包工具链模块（`lib/`，不进 seed）

| 模块 | 职责 |
| --- | --- |
| `Vuna.Cli` | 产品 CLI：工具命令分发 + in-process 调 compiler 命令（`runCli`） |
| `Vuna.Interp` | 解释器 facade（DT 精化 + 核心求值，调 `Dt.dtEvalFile`；工具链侧，不进 seed 闭包） |
| `Vuna.Files` | 目录遍历小工具（fmt/doc/test 共用，`collectVunaFiles`） |
| `Vuna.Fmt` | 源码格式化器（`vuna fmt`，parse → 规范打印；保留 `where` 签名行） |
| `Vuna.Lint` | 风格检查与自动修复（`vuna lint`） |
| `Vuna.Repl` | 交互式 REPL（`vuna repl`；表达式经 DT 求值，顶层定义需先写签名） |
| `Vuna.Doc` | API 文档生成（`vuna doc`，扫描 `lib/` 输出 Markdown） |
| `Vuna.Index` | 源码符号索引（`vuna map` / `vuna api`；parse 级，缓存在 `.local/index/`） |
| `Vuna.Lsp` | LSP 服务端（诊断 = parse + DT 精化错误，hover = 洞目标；JSON-RPC over stdio） |
| `Vuna.Process` | 工具链侧进程执行入口（与 `Vuna.Compiler.Process.runIn` 同名） |
| `Vuna.TestRunner` | 包内测试运行器（`vuna test`，经 `Vuna.Interp` 走 DT 核心求值） |

这些模块永不进入 seed（见 [bootstrap.md](bootstrap.md) 的 TCB 边界）。

## 编译链

只有一条链：`Loader → Elab → CoreCodegen`，由 `Vuna.Compiler.Compile` 的
`checkFileDt` / `compileFileDt` / `checkProjectDt` / `compileProjectDt` 组合：

- `Loader.loadProject` / `loadProgram` 解析 import 图并 flatten（内部名字带模块前缀）；
- `Elab.elabProgramFull` 做 DT 双向精化（记录/trait/deriving 先由 `DtRecords` /
  `DtDerive` 降级，多 clause 由 `DtMatch` 展开），产出 `DtProgram`（datas / defs /
  classes / insts）；
- `CoreCodegen.generateDtProgram` 生成单文件 OCaml（`compile` / `build`）；
- `CoreCodegen.generateDtSplitProgram` 按 loader 模块序把同一 `DtProgram` 切成逐模块
  `SplitFile`（`build --split` / `seed`）。

`check` 只做精化 + 擦除检查并返回警告，不生成代码；包级检查以 `[export].modules`
为根，不经过 `app/Main.vuna`。

## codegen 的表示

擦除型 codegen 用 `Core` 的 `Term` 视图生成原生 OCaml：用户 `data` 编译成 OCaml
变体（每个族一个 `type 'a t_F = ...`）、`Int/String/Bool` 映射到原生类型、`case`
编译成 OCaml `match`、构造器直接构造变体；运行时表示只由 `Core.rigIsErased` 判定
（隐式 binder 与 `Type` 域擦除，显式值 / 显式索引保留），不做整程序使用分析。
运行时前导代码（`bi_*`、`dtp_*`、IO 桥接等）在 `CoreCodegen.dtRuntime`。

只用 OCaml 标准库，不依赖解释循环。代码质量要点：

- **依赖分组**：用 Kosaraju SCC 求函数依赖分量（`groupRuntimeDefs`），
  自/互递归分量才用 `let rec ... and ...`，非自递归单函数用 `let`；
- **比较运算符特化**：精化期按实参类型把 `==` `/=` `<` `<=` `>` `>=` 重写为
  `bi_eq_int` / `bi_eq_str` 等单态 helper，避免多态 `caml_equal` / `caml_less_than`
  （多态函数里的比较仍保留通用 `bi_eq` / 字典）；
- **短路**：`a && b` / `a || b` 在精化期降成 `TIf`（`a && b` ⇒ `if a then b else False`），
  左侧能决定结果时不求值右侧；核心求值器读同一 `TIf`，语义一致；
- **字符串拼接**：`++` 走 `bi_concat`（OCaml `^`）；
- **零参 thunk**：零运行时参数的顶层定义包成 `fun () -> body`，引用处补 `()`，
  避免建表时执行初始化副作用（`main` 例外）；
- 生成结果仍是**单个 OCaml 文件**（loader 先 flatten）；split 模式下按
  模块（`generateDtSplitProgram` 的划分）拆成逐模块 `.ml`（**不生成 `.mli`**）。

编译产物为 OCaml 源码后由 `ocamlopt` 编译链接：`vuna compile` 只产源码（`.ml`），由
调用方自己编译；`vuna build` 直接调 `ocamlopt -w -a -I +unix -o .output/bin/<包名>
unix.cmxa .output/main.ml`；split 模式生成 `build.sh`（`Vuna.Compiler.Split.buildScript`，
flags `-g -w -a+39 -warn-error +39`）做模块级增量构建，最后按依赖序链接。

### split 输出模型

`CoreCodegen.generateDtSplitProgram`（包级入口 `Dt.dtSplitProject`）接收 loader 的模块序
（依赖在前）、entry decls 与完整
`DtProgram`，产出 `List SplitFile`：

1. `Vuna_runtime.ml`：`dtRuntime`；
2. `Vuna_builtins.ml`：内建类 `Dict_Show/Eq/Ord`、内建实例（`Show_Show_` / `Eq_Eq_` /
   `Ord_Ord_` 前缀）与内建类方法投影；
3. 每个源码模块一个 `<Module>.ml`（依赖序，文件头 `open` runtime / builtins 与更早
   模块）；`List` 桥接放在声明 `List` 族的模块文件里；
4. `Main.ml`：entry decls 的 defs + `main` 钩子；
5. `build.sh`：不在生成器内，由 CLI 侧（`SplitCli.buildSplit` / `seedSplit`）用
   `Split.buildScript` 写盘（干净构建 / 增量构建）。

文件划分只由源码顺序与名字决定，不依赖时间/环境（确定性）；无法归属的
`DtDef` / `DtData` 报清晰错误，不静默丢弃。

## 机器无关指标

`nix/metrics.sh` 聚合 seed 闭包（`vuna seed` 产物）的 `.ml`，统计
bytes / lines / maxline / longlines / `letrec` / `strcat` / `eqint` / `zeroarg` /
`ctorcount`，与 `nix/metrics.budget` 比较；`checks.vuna-metrics` 用它守 codegen
回归（有意改变 codegen 后需复测并更新预算文件）。

## 相关阅读

- 子系统数据流与改动定位：[architecture.md](../architecture.md)
- 种子策略与 rotation：[bootstrap.md](bootstrap.md)
- 测试体系与 nix checks：[testing.md](testing.md)
- DT 工具链（洞目标 / LSP / 错误索引）：[dt-tooling.md](dt-tooling.md)