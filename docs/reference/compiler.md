# 编译器参考：模块职责、codegen 表示与优化

本文覆盖 `compiler/` 包（`vuna-compiler`，模块 `Vuna.Compiler.*`）的模块职责与 codegen
实现要点。子系统的数据流与“改哪里”速查见 [architecture.md](../architecture.md)，
种子与自举链见 [bootstrap.md](bootstrap.md)。

## 模块地图

`compiler/` 是编译器包（seed 的唯一来源）。入口 `compiler/app/Main.vuna` 的 import 闭包
就是 `seed/` 的内容（55 个 `.ml`，文件集 56 个含 `build.sh`）；工具链（fmt/lint/repl/doc/test/lsp）在根包 `lib/`，
不在闭包里。代码按**目录即层**组织：Frontend → Packages → Loader → Core → Elab →
Codegen → Driver，同层模块可互相 import，上层只能依赖下层。每层 `X.vuna` 是**门面**：
只 import 子模块并选择性重导出（对外名字面与拆分前逐项一致），实现与数据定义都在
`X/` 的叶子模块。全包 40 个模块，目标每模块 ≤~800 行（当前最大 `Frontend.Parser` 823）。

| 模块 | 职责 | 关键入口 |
| --- | --- | --- |
| `Common` | 编译器门面：整模块重导出 `Base.Pair`/`Bool`/`List`/`Maybe`/`Result`/`String`，并保留 `Pos`/`Span`、模块路径与诊断工具 | `showSpanLoc`、`suggest`、`splitPath` |
| `Frontend.Ast` | 语法类型与 AST helper（`Expr`/`Decl`/`Pat`/`Ctor`/`Import`/`ModDecl`） | `clausesFor`、`funArity`、`declNames` |
| `Frontend.Lexer` | 字符游标、token 与位置；注释单独 lex 出来供 formatter 使用 | `lexSource`、`lexComments` |
| `Frontend.Parser` | offside layout parser → AST + imports；`where` 块与绑定签名行 | `parseSource`、`parseExpressionSource` |
| `Frontend.Toml` | TOML 子集解析器 | `parseToml`、`lookupEntry` |
| `Frontend.Manifest` | `vuna.toml` 的语义模型与结构校验（不做 I/O） | `parseManifest`、`validateManifest` |
| `Packages.Pkg` | 包 / workspace 解析层：manifest 图、依赖 DAG、模块根（不碰 Loader / CLI） | `loadPackage`、`workspacePackages`、`packageRoots` |
| `Loader`（门面） | 模块加载、名字解析与 flatten 的稳定入口；对外导出 `Project` / `Module` / `ExportEntry` 与 `load*` / `resolve*` | `loadProject`、`resolveProject`、`loadProgram`（`Loader.Flatten`） |
| `Loader.Modules` | 加载器的数据与模块图（叶子，无跨 Loader 子模块依赖）：模块根、import 边、导出表结构 | `collectModuleFiles`、`moduleAllImportsOf` |
| `Loader.Resolve` | 名字解析：把 parse 后声明/表达式解析成带模块前缀的名字；**合并原 `Builtins`** 的内建元数与 effectful 包级 allowlist | `resolveProgram`、`builtinArity`、`packageAllowsEffects` |
| `Loader.Flatten` | 模块导出表计算、加载流程与 flatten（`Prelude` 自动导入、`[export]` 可见性） | `loadProgram`、`loadProjectModules` |
| `Core`（门面） | core 类型论表示、NbE 求值与定义性相等等公开面 | `Core.Eval.eval`、`quote`、`normalize`、`Core.Conv.conv`、`Core.Term.defaultFuel` |
| `Core.Term` | `Term`/`Value`/`Neutral`/`Closure`/`Rig`/`Level` 等数据（唯一真源）与 `shift`/`substVarAt`/显示等纯项变换 | `shift`、`substVarAt`、`rigIsErased` |
| `Core.Eval` | beta 求值、delta 展开、prelude 原语归约、深度正规化与 quote | `eval`、`force`、`applyClosure`、`normalize`、`quote` |
| `Core.Conv` | 定义性相等（beta + delta + eta）与一阶元变量求解 | `conv`、`convBoth`、`solveMeta` |
| `Elab`（门面） | DT 精化器稳定入口；按 `Elab.*` 前缀选择重导出 `Types`/`Meta`/`Data`/`Trait`/`Driver` 的公开名 | `Elab.Driver.elabProgramFull`、`goalsOfProgram` |
| `Elab.Sig` | 签名工具：trait 类参数 kind 推断 + 顶层签名自由名量化（**合并原 `DtKind` + `DtQuant`**） | `quantifyTopSig`、`classParamKind`、`methodArgRigsOf` |
| `Elab.Types` | Elab 的数据定义与共享状态：`DtDef`/`DtCtor`/`DtData`/`DtGoal`/`DtClass`/`DtInst`/`DtProgram` 与 `Ctx` | `dtDataName`、`dtDefType`、`dtProgDefs` |
| `Elab.Meta` | 共享工具层：值/构造子引用、`convEc`、元变量解的作用域复核、零参构造子与 Bool 专用表示 | `convEc`、`checkScopedFrom`、`dictTypeName` |
| `Elab.Case` | case 精化基础设施：索引合一（`unifyIdx`）、scrutinee 反射、可达性/空族判定、分支辅助 | `unifyIdx`、`reflectScrutinee`、`branchReachable` |
| `Elab.Dict` | 字典编码的表示与实例搜索：字典类型/实例头识别、`conv` 头匹配、实例选择、比较运算符泛化 | `searchInstance`、`dictFamilyNameOf`、`cmpRuntimeName`、`deferEqDict` |
| `Elab.Term` | 项的双向检查（与 case 规则互递归的核心）：`inferE`/`checkE`/应用/隐式插入/类型检查 | `inferE`、`checkE`、`checkApp`、`checkType` |
| `Elab.Data` | `data` 声明与构造子/索引擦除：`elabCtor`、`elabDataHead(s)`、`elabDataBodies`、擦除候选 | `elabDatas`、`ctorFieldTerms` |
| `Elab.Trait` | trait/instance 声明与实例体：类参数 kind、方法投影、实例头检查（重复/命名）、方法体精化 | `checkInstanceHeads`、`elabInstanceBodies`、`instanceName` |
| `Elab.Driver` | 精化入口与程序组装：签名 → data/trait/instance → 定义体 → zonk/终止性检查 → `DtProgram`；洞目标 | `Elab.Driver.elabProgramFull`、`goalsOfProgram`、`dtEvalExprIn` |
| `Elab.Termination` | DT 终止性检查（M16）：只分析自递归函数，结构递归/真子项判据 | `checkTerminationDecls` |
| `Elab.Prelude` | DT 的内置定义表（原 `DtPrelude`）：prelude 名字/签名、Int/String 原语与运算符特化辅助 | `preludeGlobals`、`builtinTyName`、`cmpBuiltinTyName` |
| `Elab.Match` | 多 clause 模式矩阵降级：构造子列 → `case`、字面量列 → `if` 链（纯 Ast→Ast） | `multiToExpr`、`buildColumnExpr` |
| `Elab.Records` | `record` 的语法降级：记录 → 单构造器 `data`、字段访问/更新/recode（纯 Ast→Ast） | `desugarRecords`、`RecordInfo` |
| `Elab.Derive` | `deriving` 的实例生成（展开成等价 `instance`，交给既有实例精化） | `expandDerivings` |
| `Codegen`（门面） | DT 擦除 codegen 的稳定入口；重导出 `Codegen.Program` 与 `Codegen.Split` | `checkDtProgram`、`generateDtProgram`、`generateDtSplitProgram` |
| `Codegen.Decl` | OCaml 名字编码（sanitize/前缀/保留字）+ 变体类型声明；构造子字段形状 keep flags 的实际消费点 | `ctorOcamlName`、`genTypeDecls`、`ctorKeepFlags` |
| `Codegen.Erase` | 擦除检查、de Bruijn 作用域/名字护栏、依赖分析与 SCC 分组 | `checkAllErasure`、`checkAllDefScopes`、`ensureUniqueOcamlNames` |
| `Codegen.Term` | 项 → OCaml（擦除驱动）+ DT 运行时前缀（`bi_*`、`dtp_*`、IO 桥接） | `dtRuntime`、`genDtHook`、`genGroups` |
| `Codegen.Program` | 单文件产物装配与两个检查/生成入口（共用 `prepareDtProgram`） | `checkDtProgram`、`generateDtProgram` |
| `Codegen.Split` | 逐模块 split 的声明归属表与分文件装配（`build --split` / `seed` 输出模型） | `generateDtSplitProgram` |
| `Driver.Split` | 分离编译的输出文件模型与构建脚本生成：`SplitFile`、依赖序、增量 `build.sh` | `SplitFile`、`buildScript`、`writeSplitFiles` |
| `Driver.Dt` | DT 路径 facade（供 `Compile` / `CompilerCli` / `Interp` 使用）：单文件/`--root` 与包目录两种加载形状 | `dtCheckProject`、`dtCompileProject`、`dtSplitProject`、`dtEvalFile` |
| `Driver.Compile` | 编译入口：默认模块根、单文件 / 包目录 / 包级检查与编译；**合并原 `SplitCli`** 的 `buildSplit`/`seedSplit` | `checkFileDt`、`compileProjectDt`、`buildSplit`、`seedSplit` |
| `Driver.CompilerCli` | 编译器自己的 CLI（`vuna-compiler`）；**合并原 `Process`** 的 `runIn`（`prim_runIn`，受 allowlist 限制） | `runCompilerCli`、`compilerUsageLines`、`runIn` |

`compiler/vuna.toml` 的 `[export]` 列出全部 40 个模块；工具链模块不在此包。
原 `Driver.Process` 与根包 `Vuna.Process` 均已删除（`runIn` 并入 `Driver.CompilerCli`）。

## 根包工具链模块（`lib/`，不进 seed）

| 模块 | 职责 |
| --- | --- |
| `Vuna.Cli` | 产品 CLI：工具命令分发 + in-process 调 compiler 命令（`runCli`） |
| `Vuna.Interp` | 解释器 facade（DT 精化 + 核心求值，调 `Driver.Dt.dtEvalFile`；工具链侧） |
| `Vuna.Files` | 目录遍历小工具（fmt/doc/test/Index 共用，`collectVunaFiles`） |
| `Vuna.Fmt`（+ `Fmt.Comment`/`Decl`/`Expr`/`Util`） | 源码格式化器（`vuna fmt`，parse → 规范打印；门面只导出 `formatSource`） |
| `Vuna.Lint`（+ `Lint.Rules`/`Fix`） | 风格检查与自动修复（`vuna lint`） |
| `Vuna.Repl` | 交互式 REPL（`vuna repl`；表达式经 DT 求值，顶层定义需先写签名） |
| `Vuna.Doc` | API 文档生成（`vuna doc`，扫描 `lib/` 输出 Markdown） |
| `Vuna.Index`（+ `Index.Types`/`Scan`/`Query`/`Render`） | 源码符号索引（`vuna map` / `vuna api`；parse 级，缓存在 `.local/index/`） |
| `Vuna.Lsp` | LSP 服务端（诊断 = parse + DT 精化错误，hover = 洞目标；JSON-RPC over stdio） |
| `Vuna.Json` | 最小 JSON 读写（LSP 用） |
| `Vuna.TestRunner` | 包内测试运行器（`vuna test`，经 `Vuna.Interp` 走 DT 核心求值） |

这些模块永不进入 seed（见 [bootstrap.md](bootstrap.md) 的 TCB 边界）。

## 编译链

只有一条链：`Loader → Elab → Codegen`，由 `Vuna.Compiler.Driver.Compile` 的
`checkFileDt` / `compileFileDt` / `checkProjectDt` / `compileProjectDt` 组合：

- `Loader.Flatten.loadProject` / `loadProgram` 解析 import 图并 flatten（内部名字带模块前缀）；
- `Elab.Driver.elabProgramFull` 做 DT 双向精化（记录/deriving 先由 `Elab.Records` /
  `Elab.Derive` 降级，多 clause 由 `Elab.Match` 展开），产出 `DtProgram`（datas / defs /
  classes / insts）；
- `Codegen.Program.generateDtProgram` 生成单文件 OCaml（`compile` / `build`）；
- `Codegen.Split.generateDtSplitProgram` 按 loader 模块序把同一 `DtProgram` 切成逐模块
  `SplitFile`（`build --split` / `seed`）。

`check` 只做精化 + 擦除检查并返回警告，不生成代码；包级检查以 `[export].modules`
为根，不经过 `app/Main.vuna`。

## codegen 的表示

擦除型 codegen 用 `Core` 的 `Term` 视图生成原生 OCaml：用户 `data` 编译成 OCaml
变体（每个族一个 `type 'a t_F = ...`）、`Int/String/Bool` 映射到原生类型、`case`
编译成 OCaml `match`、构造器直接构造变体；运行时表示只由 `Core.rigIsErased` 判定
（隐式 binder 与 `Type` 域擦除，显式值 / 显式索引保留），不做整程序使用分析。
运行时前导代码（`bi_*`、`dtp_*`、IO 桥接等）在 `Codegen.Term.dtRuntime`。

只用 OCaml 标准库，不依赖解释循环。代码质量要点：

- **依赖分组**：用 Kosaraju SCC 求函数依赖分量（`Codegen.Erase.groupRuntimeDefs`），
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
unix.cmxa .output/main.ml`；split 模式生成 `build.sh`（`Driver.Split.buildScript`，
flags `-g -w -a+39 -warn-error +39`）做模块级增量构建，最后按依赖序链接。

### split 输出模型

`Codegen.Split.generateDtSplitProgram`（包级入口 `Driver.Dt.dtSplitProject`）接收 loader 的模块序
（依赖在前）、entry decls 与完整
`DtProgram`，产出 `List SplitFile`：

1. `Vuna_runtime.ml`：`dtRuntime`；
2. `Vuna_builtins.ml`：split 生成器保留的编译单元；M24.7 删除旧内建 trait/实例后为空
   （只 `open Vuna_runtime`），保留它是为了让文件集形状稳定；
3. 每个源码模块一个 `<Module>.ml`（OCaml 编译单元名 = 模块名点转 `_d`，如
   `Vuna_dCompiler_dFrontend_dParser.ml`；依赖序，文件头 `open` runtime / builtins 与更早
   模块）；`List` 桥接放在声明 `List` 族的模块文件里；
4. `Main.ml`：entry decls 的 datas + defs + `main` 钩子（M24.6：入口文件里的 `data`
   也必须发进来）；
5. `build.sh`：不在生成器内，由 CLI 侧（`Driver.Compile.buildSplit` / `seedSplit`）用
   `Driver.Split.buildScript` 写盘（干净构建 / 增量构建）。

文件划分只由源码顺序与名字决定，不依赖时间/环境（确定性）；无法归属的
`DtDef` / `DtData` 报清晰错误，不静默丢弃。M24.6 起生成链还有三条护栏：构造子字段
形状以 telescope 的 keep flags 为**单一真源**（类型声明 / 构造子应用 / case 绑定三处
消费并校验）、`checkResolvedModules` 在 split 入口拒绝未带模块前缀的 parsed 声明、
`ensureUniqueOcamlNames` 对实际生成的 `v_*` / `t_*` / `C_*` 名字做族内去重。

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