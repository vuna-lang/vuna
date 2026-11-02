# 编译器参考：模块职责、codegen 表示与优化

本文覆盖 `compiler/` 包（`vuna-compiler`，模块 `Vuna.Compiler.*`）的模块职责与 codegen
实现要点。子系统的数据流与“改哪里”速查见 [architecture.md](../architecture.md)，
种子与自举链见 [bootstrap.md](bootstrap.md)。

## 模块地图

`compiler/` 是编译器包（seed 的唯一来源）。入口 `compiler/app/Main.vuna` 的
import 闭包就是 `seed/` 的内容；工具链（fmt/lint/repl/doc/test）在根包 `lib/`，
不在闭包里。

| 模块 | 职责 | 关键入口 |
| --- | --- | --- |
| `Vuna.Compiler.Common` | 编译器门面：整模块重导出 `Base.Pair`/`Bool`/`List`/`Maybe`/`Result`/`String`，并保留 `Pos`/`Span`、模块路径与诊断工具 | `showSpanLoc`、`suggest`、`splitPath` |
| `Vuna.Compiler.Ast` | 语法类型与 AST helper（`Expr`/`Decl`/`Pat`/`Ctor`/`Import`/`ModDecl`） | `clausesFor`、`funArity`、`declNames` |
| `Vuna.Compiler.Lexer` | 字符游标、token 与位置；注释单独 lex 出来供 formatter 使用 | `lexSource`、`lexComments` |
| `Vuna.Compiler.Parser` | offside layout parser → AST + imports | `parseSource`、`parseExpressionSource` |
| `Vuna.Compiler.Builtins` | 内建函数名字与元数（供 Loader/Eval 共用） | `builtinArity` |
| `Vuna.Compiler.Toml` | TOML 子集解析器 | `parseToml`、`lookupEntry` |
| `Vuna.Compiler.Manifest` | `vuna.toml` 的语义模型与结构校验（不做 I/O） | `parseManifest`、`validateManifest` |
| `Vuna.Compiler.Pkg` | 包 / workspace 解析层：manifest 图、依赖 DAG、模块根（不碰 Loader / CLI） | `loadPackage`、`workspacePackages`、`packageRoots` |
| `Vuna.Compiler.Loader` | import 图、模块根与 `[export]` 可见性、名字解析、`Prelude` 自动导入、flatten；effectful 内建的包级限制 | `loadProject`、`resolveProject`、`loadProgram` |
| `Vuna.Compiler.Typecheck` | HM 类型检查（记录/trait/高阶 kind/字典穿参、穷尽性警告） | `checkProgramInfoElab`、`checkProgramInfoElabOwners`、`exhaustiveWarningsFor` |
| `Vuna.Compiler.TypedCodegen` | 原生 OCaml typed codegen（单文件 + 分离编译）；runtime 前导代码 | `generateProgramTyped`、`generateProgramTypedExec`、`generateSplitProgram` |
| `Vuna.Compiler.Split` | 分离编译输出模型：`SplitFile`、模块顺序、`build.sh` 生成 | `writeSplitFiles`、`splitCompileOrder`、`buildScript` |
| `Vuna.Compiler.SplitCli` | 包模式分离编译入口（`build --split` / `seed` / `compile --package`） | `buildSplit`、`seedSplit`、`compilePackage` |
| `Vuna.Compiler.Process` | 工具链进程执行入口（受包级 allowlist 限制，不进 `[export]`） | `runIn` |
| `Vuna.Compiler.Compile` | 编译入口：默认模块根、typed 编译/检查、包级检查、DT 单文件路径 | `effectiveRoots`、`compileFileTyped`、`checkFile`、`checkFileIn`、`compileFileDt` |
| `Vuna.Compiler.CompilerCli` | 编译器自己的 CLI（`vuna-compiler`） | `runCompilerCli`、`compilerUsageLines` |
| `Vuna.Compiler.Core` | DT core 类型论表示、NbE 求值与定义性相等 | `eval`、`quote`、`conv`、`normalize`、`defaultFuel` |
| `Vuna.Compiler.Elab` | DT 双向精化器（一阶元变量、类型级隐式插入、M14 索引族） | `elabProgram` |
| `Vuna.Compiler.DtMatch` | 多 clause 模式矩阵降级：构造子列 → `case`、字面量列 → `if` 链（纯 Ast→Ast 变换，从 Elab 拆出守模块预算） | `multiToExpr`、`buildColumnExpr` |
| `Vuna.Compiler.CoreCodegen` | DT 擦除检查与 OCaml 生成 | `checkDtProgram`、`generateDtProgram` |
| `Vuna.Compiler.Dt` | DT 单文件 facade（供 `Compile` / `CompilerCli` / `Interp` 使用） | `dtCheckFile`、`dtCompileFile`、`dtEvalFile` |

`compiler/vuna.toml` 的 `[export]` 只列编译器模块；`Process` 刻意不导出。

## 根包工具链模块（`lib/`，不进 seed）

| 模块 | 职责 |
| --- | --- |
| `Vuna.Cli` | 产品 CLI：工具命令分发 + in-process 调 compiler 命令（`runCli`） |
| `Vuna.Interp` | 解释器 facade（依赖 `Vuna.Eval`；工具链侧，不进 seed 闭包） |
| `Vuna.Eval` | 值表示、内建函数、求值器与 `show` |
| `Vuna.Files` | 目录遍历小工具（fmt/doc/test 共用，`collectVunaFiles`） |
| `Vuna.Fmt` | 源码格式化器（`vuna fmt`，parse → 规范打印） |
| `Vuna.Lint` | 风格检查与自动修复（`vuna lint`） |
| `Vuna.Repl` | 交互式 REPL（`vuna repl`） |
| `Vuna.Doc` | API 文档生成（`vuna doc`，扫描 `lib/` 输出 Markdown） |
| `Vuna.Index` | 源码符号索引（`vuna map` / `vuna api`；parse 级，缓存在 `.local/index/`） |
| `Vuna.Process` | 工具链侧进程执行入口（与 `Vuna.Compiler.Process.runIn` 同名） |
| `Vuna.TestRunner` | 包内测试运行器（`vuna test`，解释执行 `test/*.vuna`） |

这些模块永不进入 seed（见 [bootstrap.md](bootstrap.md) 的 TCB 边界）。

## HM 主路径

`loadProgram → checkProgramInfoElab → generateProgramTyped`，由
`Vuna.Compiler.Compile` 的 `compileFileTyped*` / `checkFile*` 组合：

- `loadProgram`（Loader）解析 import 图并 flatten（内部名字带模块前缀）；
- `checkProgramInfoElab` 返回 `(globals, elabDecls)`——名字到 `Scheme` 的环境 +
  降级后的声明（记录→单构造器 `data`，trait 方法→字典参数）；
- `generateProgramTyped`（TypedCodegen）用类型信息生成原生 OCaml。

`checkFile` 只做类型检查并返回穷尽性/冗余警告，不生成代码。包级检查用
`checkPackageIn`：以 `[export].modules` 为根，不经过 `app/Main.vuna`。

## codegen 的表示

只有一条 codegen（typed，M12.7 起 dynamic codegen 已删除）：

- `TypedCodegen`：用类型信息生成原生 OCaml 类型与代码——用户
  `data` 编译成 OCaml 变体、`Int/String/Bool/List` 映射到原生类型、`case` 编译成
  OCaml `match`、构造器直接构造变体，没有动态 `value` 包装。

typed codegen 只用 OCaml 标准库，不依赖解释循环。代码质量优化：

- **依赖分组**：用 Kosaraju SCC 一次正向 + 一次反向 DFS 求出函数依赖分量，
  `genTop` 复杂度从 O(V²·reach) 降到 O(V+E)（自举 codegen 从 ~12s 降到 ~0.2s）；
  非自递归单函数用 `let`，互递归分量才用 `let rec ... and ...`；
- **比较运算符特化**：`==` `/=` `<` `<=` `>` `>=` 按操作数类型改写为
  `bi_eq_int` / `bi_eq_str` / `bi_eq_bool` / `bi_*_int` 等单态 helper，
  避免多态 `caml_equal` / `caml_less_than`（多态函数里的比较仍保留通用 `bi_eq`）；
- **短路**：`a && b` / `a || b` 生成 OCaml `if`，左侧能决定结果时不求值右侧；
  解释器同样短路；
- **字符串拼接**：同层 `++` 链编译期折叠相邻字面量，3 段以上生成按序求值的
  `let` 绑定 + `String.concat "" [...]`（线性时间，不再是右嵌套 `^`）；
- **输出收尾**：单子句全变量模式直接生成 `fun x y -> ...`（省 match/元组）、
  原子实参省略括号、零参纯值 hoist 成普通 `let`（每次引用不再重建值）；
- **可读性**：生成代码经过轻量 pretty printer（按 `in`/`else`/行宽断行），
  长字符串按真实换行输出，避免几 KB 的单行；
- 生成结果仍是**单个 OCaml 文件**（loader 先 flatten）；分离编译时拆成逐模块
  `.ml/.mli`；runtime 前导代码在 `TypedCodegen.vuna` 的 `runtimeCodeTyped`。

编译产物为 OCaml 源码后由 `ocamlopt`（`-g -w -a+39 -warn-error +39`）编译链接：
单文件模式直接 `ocamlopt -o out file.ml`；分离编译模式生成 `build.sh`
（`Vuna.Compiler.Split.buildScript`）做模块级增量构建。

## DT 路径

`Core`（Core TT + NbE）→ `Elab`（双向精化）→ `CoreCodegen`（擦除 + OCaml 生成），
由 `Dt` facade 串起来（`dtCheckFile` / `dtCompileFile` / `dtEvalFile`）。这条路径
不经过 Loader，只支持单文件。详见 [dt.md](dt.md) 与 [docs/dt-core.md](../dt-core.md)。

## 机器无关指标

`nix/metrics.sh` 聚合 `vuna compile --package` 生成的 compiler 包闭包 `.ml`，统计
bytes / lines / maxline / longlines / `letrec` / `strcat` / `eqint` / `zeroarg` /
`ctorcount`，与 `nix/metrics.budget` 比较；`checks.vuna-metrics` 用它守 codegen
回归（有意改变 codegen 后需复测并更新预算文件）。

## 相关阅读

- 子系统数据流与改动定位：[architecture.md](../architecture.md)
- 种子策略与 rotation：[bootstrap.md](bootstrap.md)
- 测试体系与 nix checks：[testing.md](testing.md)
