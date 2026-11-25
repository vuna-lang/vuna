# 架构：子系统地图与数据流

本文是 vuna 仓库的**子系统地图**：回答“改一个功能要在哪些模块动手、该跑哪段测试”。逐模块
职责见 [compiler.md](reference/compiler.md)，Core / 精化器见 [core.md](reference/core.md)，
语义见 [language.md](reference/language.md) / [type-system.md](reference/type-system.md) / [qtt.md](reference/qtt.md)，
自举 / 内建原语与宿主层见 [bootstrap.md](reference/bootstrap.md) / [primitives.md](reference/primitives.md)，
模块级接口缓存与输入寻址对象库存取见 [cache.md](reference/cache.md)（对象族 / 命中判据 /
roots 与 GC / 工具产物来源；排障用 `VUNA_IFACE_AUDIT=1` 双路径对拍）。

> 本页是**现状**地图；终态方向、不变量与非目标见
> [architecture-target.md](architecture-target.md)。

## 仓库分层

```text
packages/compiler-base/lib/Vuna/Compiler/Base/   （独立包 vuna-compiler-base：IR 与编译器共用的最低层）
├─ Source Common Diag{,.Format,.Codec} Bytes Hash Version Store Obs Intrinsics
│               Diagnostics.vuna Diagnostics/{Common,Ic,Cg,Pkg,Rn,Sink,Warning,Tc,Frontend,Loader}
│                             位置/诊断模型、编码原语、摘要与身份、落盘层、内建真源
packages/ir/lib/Vuna/Ir/              （独立包 vuna-ir：擦除后的中间表示，后端插件的唯一输入面）
├─ Model Analysis Runtime Validate Represent Anf Cps Dispatch Tail Kinds Layout
│  Alias Synthetic Codec     形状 / SCC / 运行时契约 / 校验 / 表示选择 / 变换 /
│                             kind 与布局 / 跨进程编码
packages/target-ocaml/lib/Vuna/Target/Ocaml/  （独立包 vuna-target-ocaml：OCaml 后端，仍在种子闭包内）
├─ Decl Term Assembly Model Render Runtime   IR→OCaml 文本（不 import Core / Elab / Intrinsics）
packages/target-native/lib/Vuna/Target/Native/  （独立包 vuna-target-native 插件：native 后端，不在种子内）
├─ Abi Gc Model Module Render Runtime Audit Pal Repr Select Plugin   IR→x86-64 汇编文本
│                            （不 import Core / Elab）
packages/target-wasm/lib/Vuna/Target/Wasm/      （独立包 vuna-target-wasm 插件：wasm 后端，不在种子内）
├─ Instr Model Module Render Runtime Types Plugin    IR→WAT 文本
packages/compiler/lib/Vuna/Compiler/   （目录即层：层名 = 模块前缀；依赖方向由 packages/compiler/vuna.toml
                                的 [layers] 执行，见 reference/packages.md「层约束」）
├─ Frontend/    Ast Lexer Cst Parser Parser/Support Toml Manifest Reserved
│               Canonical/{Ast,Pkg} Packages/{Pkg,Source} Rast{,.Bridge,.Name}
│                             词法（含无损 CST）/ 语法 / vuna.toml / 规范编码 / 包图
├─ Loader/      Modules Resolve Flatten Expand Fixity Addr Fingerprint Layers
│                             模块图 / 名字解析 / flatten / fixity / 地址与身份 / 层约束
├─ Core/        Term Eval Conv Canonical      Core TT / NbE / 定义性相等 / 规范编码
├─ Elab/        Sig Types Meta MetaSpans Case Dict Term{,.Impl,.Support} Data Trait
│               InstName InstCoherence Driver Termination{,.ElabInput,.Measure,.Scc}
│               Prelude Match Records Derive Coverage Representation Usage Canonical   双向精化
├─ Lowering/    Program Env Ty Entry Erased Checks    Core→IR 唯一入口（程序级表/类型表面/入口形态）+ 擦除视图 + Core 侧检查
└─ Driver/      Dt Compile Cache Iface Owner PerfCache ToolPayload CompilerCli
                Split SplitGen Target TargetCache                   输出模型 / facade / 后端驱动 / CLI
产品 CLI 包 vuna（模块根 packages/cli/lib/，入口 packages/cli/app/Main.vuna）：Cli（+子模块 Spec/Help/Args/
  Err/Suggest/Test/Fmt/Index/Repl/Suite/Dev，命令表与分发，见 [reference/cli.md](reference/cli.md)）、
  Interp/Fmt/Lint/Index（门面+子模块）、
  Obs（+子模块 Types/Read/Validate/Summarize/Run；可观测性工具链，见
  [reference/observability.md](reference/observability.md)）、
  Repl/Run/Doc（+子模块）/Search（+子模块）/Sig/Lsp/Json/TestRunner/Files；开发/维护命令（suite / obs /
  错误码文档 / IR dump）在独立插件 `packages/dev`（二进制 `vuna-dev`，`vuna dev …`）。
依赖图：vuna → vuna-compiler → {vuna-ir, vuna-compiler-base, vuna-target-ocaml} → vuna-base（vuna 也直接依赖 base）；
  vuna-target-native / vuna-target-wasm 只依赖 base + compiler-base + ir，由编译器按 `--target` 起进程。
中立库 vuna-http（模块根 packages/http/lib/）：Http.{Header,Request,Response,Parse,Render}，
  HTTP/1.1 消息编解码、严格解析规则与传输无关连接层；依赖 vuna-base，不进 seed
  （见 [reference/http.md](reference/http.md)）；依赖图 vuna-http → vuna-base。
生态层 vuna-web（模块根 packages/web/lib/）：Web.{View,Route,Server,App,Main}，HTML 视图 +
  路由匹配 + 应用值 + 服务端根；依赖 vuna-base / vuna-http，不进 seed（见 [reference/web.md](reference/web.md)）。
编排工具 vuna-web-cli（模块根 packages/web-cli/lib/，二进制 vuna-web-cli）：读应用包上下文、
  生成适配包、复用 Driver.CompilerCli 构出服务端二进制；依赖编译器包，不进 seed，不属于产品 CLI。
  产品入口经 `vuna-web` 插件（`packages/plugin-web`）暴露同一实现：`vuna web build|check|version`。
```

**目录即层，方向由 manifest 声明**：层 = 模块前缀（目录），`packages/compiler/vuna.toml` 的
`[layers]` 声明哪些层只允许直接依赖哪些层，由 loader 在 import 时强制（见
[packages.md](reference/packages.md) 的「层约束」）；`checks.ir-boundary` 只留
「必须 import 某模块」的正向断言与 IR 形状断言。未声明层的包不受约束。
`Core` / `Elab` / `Loader` 的纯门面已删除（OCaml 后端的 `Codegen` 门面随包迁到
`packages/target-ocaml`），消费方直接 import 具体子模块
（如 `Core.Term` / `Core.Eval` / `Core.Conv`、`Loader.Flatten` / `Loader.Modules`、
`Target.Ocaml.Assembly`、`Elab.*`）；`Ir` 的校验入口在 `Ir.Validate`。数据定义只在叶子
（`Core.Term`、`Elab.Types` 等）。目标每模块 ≤~800 行；实际超标的集中在
`Frontend/Parser.vuna`（2.6k）、`Driver/Compile.vuna`（2.7k）、`Driver/Dt.vuna`（2.2k）、
`Elab/Trait.vuna`（1.7k）、`Elab/Term/Impl.vuna`（3.8k）。
`packages/compiler/` 的入口闭包是 seed 唯一来源（`packages/compiler/app/Main.vuna` 的 import 闭包，跨 `vuna-ir` / `vuna-compiler-base` / `vuna-target-ocaml`；数量以 `seed/` 与
`nix/seed/files.txt` 与 `nix/seed/rotation.txt` 为准）；`packages/cli/` 工具链与 `vuna-target-native` / `vuna-target-wasm` 在 TCB 之外；`packages/base/` 模块名即 API。

## 1. 编译链：Frontend → Loader → Elab → Codegen

**何时该看这里**：改语法、import / 模块解析、DT 精化规则、索引 unification、擦除 codegen。

```text
源文件
 → Frontend.Lexer.lexSource      （token + Pos/Span；lexSourceWithComments 一次给 token + 注释）
 → Frontend.Parser.parseSource   （offside layout → AST + imports；工具用 parseSourceWithComments）
 → Frontend.Packages.Pkg.contextForFile   （最近 vuna.toml + 依赖闭包 → PackageContext；无则 base-only）
 → Loader.Flatten.loadProject    （import 图 → 名字解析 → flatten；ad-hoc 自动注入 Prelude；随后 `Loader.Expand` 展开内置宏）
 → Frontend.Rast.Bridge.toRastDecls （解析后的 Ast → RAst：引用名换成 RName；Elab 的唯一输入层）
 → Elab.Driver.elabProgramFull   （只读 RAst；Records/Derive 展开 → 精化）
 → Lowering.Erased                （运行时 TVar 下标归一化 + 校验；类型面保留）
 → Lowering.Program               （Core → Ir：表示/形态/入口分类，程序级检查）
 → Target.Ocaml.Assembly              （IrUnit 的装配：open 头/类型/桥接/正文/依赖表）
 → Driver.SplitGen.generateDtSplitProgram  （唯一生成器：runtime + 各模块 + Main，带直接依赖）
 → sh build.sh                   （Driver.Split：层内并行；ocamlopt 链接）
```

**唯一装配**：`check` / `compile` / `build` 与语言夹具共用这条链；ad-hoc 单文件只是换包
上下文（最近 manifest，无则 base-only），flatten / 精化 / codegen 与包内模块相同——无第二套
加载语义。

**native / wasm 的 IR 后段**：`Lowering.Program` 之后走 `Ir.Represent`（去装箱）→
`Ir.Cps.cpsDefsMachine`（效应机器）→ `Ir.Tail`（尾位置标记）→ `Native.Module` / `Wasm.Module`。
`Ir.Tail` 是两端共享的判定；发射仍是各自后端（native `jmp`，wasm `return_call`）。

**运行时错误报告**：`Vuna_runtime.ml` 由 `Target.Ocaml.Term.dtRuntimeWith` 生成 =
运行时常量 + `dt_def_locs`（定义位置表：mangled 值名 → `定义名 (相对路径:行)`，路径按
`PackageContext` 的模块根/包目录归一）+ `dt_report_exn`（未捕获异常报告器）。
`Target.Ocaml.Term.genEntryHook` 的 main 钩子在入口动作外包 `try`；入口零参 `main` 的初始化期
绑定也套同一报告器（Lowering 在 `IrDef` 上标 `irDefInitGuard`），`Main.ml` 首行开
`Printexc.record_backtrace`。详见
[debugging.md](reference/debugging.md)。

**名字解析三命名空间**：`Loader.Resolve` 的解析期状态是三个**分开**的表
（`Loader.Modules.Namespaces`：值 `nsValues` / 构造子 `nsCtors` / 类型 `nsTypes`，与导出
`kind` 的 `val` / `ctor` / `type` 一一对应）。类型位置只查类型表（退化：索引构造子 →
本模块类型层 def），值位置查值表（def → ctor → 导入值 / ctor → **类型作为项**的两级退路：
本模块类型名，再到导入模块导出的类型名）。
语义与边界见 [language.md 的「type / value 双命名空间」](reference/language.md)。

**运算符与 fixity**：parser 把中缀链直接降级成普通应用 `EApp (EVar op) [l, r]`（源码顺序、
右嵌套；括号、反引号与 section 写法来自树的表面形状 `Frontend.Cst`），section 由 parser
降级成 `EVar` / 单 binder λ，Loader 只折叠立即应用；
`Loader.Flatten` 按每模块可见表（`Module.fixities`，`dedupeFixities` 首现去重）在名字解析前调
`Loader.Fixity.reorderProgram` 重排 / 换别名 / 展开 section。表来源 = 源码 `infix*` 声明
（`->` 由 `syntaxFixityDecls` 恒可见；未知符号运算符报错）；fmt / LSP / lint 用
`fixitiesForSource(In)` 取程序级闭包。详见 [operators.md](reference/operators.md)。

**模板字符串**：lexer 产出 `TTmpl`（洞内 token 原位保留），parser 组成 `EInterp`；`"""` 写法
记在 `Frontend.Cst.surfaceInterps`，AST 只保留语义分段。`Loader.Resolve` 在名字解析后
**降级**成 `Base.Trait.Interp.interp` 调用 + `++` 链（纯语法糖，Elab/codegen 看不到模板）。
fmt/lint/index/doc 只 parse，仍按 `EInterp` 处理。详见
[templates.md](reference/templates.md)。

**擦除 / 合一 / 定义形式**：擦除只有单一判据链（`Elab.Meta.isTypeDomain` →
`binderRig` → `Core.rigOfBinder`，读取侧统一 `Core.rigIsErased`）；运行时类型不可命名时
（卡住的类型族应用）另走「不透明擦除值 + 恒等 cast」表示（见 [effects.md](reference/effects.md) §5）；元变量求解在
`Core.Conv.solveMeta`（created-depth 随 `Sols` 就地检查，非空 spine 走 Miller pattern）；
已解元变量进项只经 `Elab.Meta.zonkTerm`；`axiom` 是无体擦除定义（`DtAxiom`，运行时使用由
`Lowering.Checks.checkNoAxiomRuntime` 拒绝），定义参数少于签名时 body 的类型须与剩余 Pi
η-收缩相容（不合成额外 λ）。细节见 [core.md](reference/core.md)。

**相等 / 实例 / 证明**：`==` / 比较是证据驱动的（Int/String 内建或 `Eq` / `Ord` 字典，
无泛型兜底）；约束实例与参数化 `deriving` 可用，命名实例不存在；隐式值参数 `{x : a}` 与
构造子 η 展开在 `Elab.Meta`；`DtDef` 带来源 span。trait / 实例语义见
[records-traits.md](reference/records-traits.md)。

**内建语义单一真源**：`Vuna.Compiler.Base.Intrinsics` 是名字 / 签名 / arity / 归约 /
可见性的唯一真源；`Loader.Resolve`（arity、放行）、`Elab.Prelude`（签名）、
`Core.Eval`（归约）、`Lowering.Program`（名字 → IR 符号）都消费它；OCaml 运行时文本在
`Target.Ocaml.Runtime`（契约 `Ir.Runtime` 的唯一 OCaml 实现）。内置身份按声明 symbol 判定：`Bool` / `List` / `Nat` 是 base 普通
data（`Base.Data.Bool.Bool` / `Base.Data.List.List` / `Base.Data.Nat.Nat`），不按短名。

擦除检查由 `Lowering.Program.checkProgramOf` 负责（判据 `Core.rigIsErased`）；不透明字段的
判定也在 Lowering（`ctorOpaqueFlagsOf`），后端只把 `IrTyOpaque` / `IrCast` 渲染成
`Obj.t` / `Obj.magic`。核心求值路径（`vuna test` 纯测试 / REPL 的纯表达式）
走同一精化链后由 `Driver.Dt.dtEvalFile` 求 `main`（纯求值：只展示 `Int`/`String`/`Bool`，
任何 `main : Eff ...` 报错并提示 `compile`）。

**入口符号**：`Driver.Dt.dtCheck` / `dtCheckWithProgramParts` / `dtCheckPackageWithIfacesParts` / `dtSplitProjectParts` / `dtEvalFile` /
`dtEvalExpr`；`Loader.Flatten.loadProject*` / `resolveProject`；`Elab.Driver.elabProgramFull`
（洞目标 `goalsOfProgram`）、`Elab.Termination.checkTerminationDecls`、`Elab.Match.multiToExpr`、
`Core.Eval` / `Core.Conv`；`Base.Intrinsics.findIntrinsic`；
`Lowering.Program.*`（Core→IR）、`Target.Ocaml.Assembly.*`、`Target.Ocaml.Term.*`；
`Driver.SplitGen.generateDtSplitProgram`；
`Driver.Split.SplitFile` / `buildScript`；CLI 经 `Driver.Compile.*` 接 `Driver.CompilerCli`。

**通常连带改动**：语法 = `Frontend.{Lexer,Parser,Ast}` + `Fmt` + `Elab.Term` / `Elab.Match` +
`Codegen`；名字解析 = `Loader.{Modules,Resolve,Flatten,Expand}`；类型规则 = `Elab.*` +
`Elab.{Records,Derive}` + `Codegen`；split = `Driver.SplitGen` + `Driver.Split`；诊断 =
`Base.Diag` / `Base.Source` + 各阶段 `Diagnostic` + golden（模型见
[diagnostics.md](reference/diagnostics.md)）。测试标签：第 1–11、13–27、30、34 段
（见 [testing.md](reference/testing.md)）；包构建 / split 见第 28/29/33/34 段；上下文回归见第 39 段。

**native 后端**：`IR --Native.Module.build--> NativeProgram --Native.Render--> runtime.s + <Module/Path>.s`
再由 `vuna-target-native` 插件落盘、CLI 的 `build` 分支调 `cc` 链接成静态 ELF；
编译器侧驱动是 `Vuna.Compiler.Driver.Target.compileBackend`（编码 IR → 起
`vuna-target-<t>` 子进程）。覆盖 Int/Nat/Bool 纯值 + String
（字面量 / `++` / `strFromInt` / `strLength` / `strAt` / `strSubstring` / `strHash` /
`strShow` / 字符串相等 / String 入口）与堆段 + 尺寸类复用 + 两代标记-清扫 GC；支持面、
ABI 与值表示见 [native.md](reference/native.md)，运行时符号、GC、验证与边界见
[native-runtime.md](reference/native-runtime.md)，native 自举的读数与成本形状见
[native-selfhost.md](reference/native-selfhost.md)。

**wasm 后端**：`IR --Wasm.Module.build--> WasmModule --Wasm.Render.renderModule-->
main.wat`，再由 CLI 的 `build` 分支跑 `build.sh`：`wasm-tools parse` 汇编成 `main.wasm`，
再经 `wasm-opt`（binaryen）优化（`--wasm-opt N`，0..3，默认 3）；编译器侧驱动同样是
`Vuna.Compiler.Driver.Target.compileBackend`，落盘在 `vuna-target-wasm` 插件里。支持 Int/Nat/String/Bool 纯值、`let`/`if`、
顶层饱和调用、Nat 结构递归与 `++` 链；WasmGC 表示、WAT 稳定布局与运行时符号覆盖见
[wasm.md](reference/wasm.md)。

## 2. 包与 workspace

**何时该看这里**：改 `vuna.toml`、workspace 成员、依赖 DAG、`[export]` 可见性、包上下文。

```text
vuna.toml → Frontend.{Toml.parseToml, Manifest.parseManifest/validateManifest}
 → Frontend.Packages.Pkg.loadPackage / workspacePackages（DAG、模块根）
 → contextForFile（最近 manifest + 依赖闭包）| contextForDir（工具/REPL 从 cwd）
   | locateBase（无 manifest → base-only：`VUNA_BASE` 或 exe 相对布局，失败报错）
 → Loader.loadProject（PackageContext → Project）
```

**入口符号**：`Frontend.Packages.Pkg.loadPackage` / `workspacePackages` / `findManifestDirMaybe` /
`contextForFile` / `contextForDir` / `locateBase`
（`PackageContext` 抽象 + `contextPackage` / `contextRoots` / `contextDir`）；
`Loader.Flatten.loadProject*` / `resolveProject`；CLI 在
`Driver.Compile.checkPackage` / `compileToDir`。

**约束**：Toml/Manifest 不碰 I/O，Pkg 只做 lexical 规范化；**每个源文件唯一包上下文**，
目录入口 `check/build <dir>` 直接 `loadPackage` 只认该目录 manifest（不向上找）；跨包只认
依赖包 `[export]`，隐藏模块报错；依赖图 DAG、包名唯一；`[package]` 只接受 `name`
（本仓库没有 `[capabilities]` / `[trust]` / `[privileged]` 段）。
**依赖定位**：`path` 依赖 = 工作树目录（可变输入）；`git`/`url` 依赖 = 持久 store 的物化视图
`$VUNA_STORE/pkgs/<内容摘要>`（`vuna deps fetch` 写入，check/build 只读）。摘要规则与 store
布局见 [package-store.md](reference/package-store.md)，决策见 D12–D15。
测试：第 28–29、33、39 段 + steps §67/§68。

## 3. 产品 CLI 工具链（`packages/{cli,toolchain,plugin-kit}/`）与 TCB 边界

**何时该看这里**：改 `vuna` 子命令、fmt/lint/repl/doc/test/map、解释器 facade、插件发现。

- 入口二进制 `vuna`（`packages/cli/`）只做发现与路由：扫 `<exeDir>` / `$VUNA_EXEC_PATH` 上的
  `vuna-*` 插件，用 `--vuna-describe` 取回命令表，再把 argv 原样转交拥有该命令的插件进程。
  工具实现与 `Vuna.Cli.{Spec,Registry,Help}` 在 `packages/toolchain/`（二进制 `vuna-toolchain`），
  命令面数据模型与纯解析在 `packages/plugin-kit/`（协议见 [cli.md](reference/cli.md) §0）。
- `Vuna.Interp.interpretFile/evalExprInfoWithAux`（`PackageContext` 入参，
  实际 `Driver.Dt.dtEvalFile`）、`Vuna.Repl.runRepl`（`:type/:load/:reload/:browse`）、
  `Vuna.Repl.Server.runReplServer` / `Vuna.Repl.Client.runReplClient`（`vuna repl serve --listen` / `vuna repl client --addr`；
  协议与 agent 配方见 [tooling.md](reference/tooling.md) §5）、
  `Vuna.Run.runRun`（`vuna run`）、`Vuna.TestRunner.runTests`（`TestOpts`：filter/list/verbose/
  fail-fast）、`Vuna.Doc.runDoc`（docstring -> 单文件 HTML；`Vuna.Doc.{Comments,Model,Prose,Html,Run}`）、
  `Vuna.Search.runSearch`、`Vuna.Files.collectVunaFiles`；fmt/lint 见 `Fmt.formatSourceWith` /
  `Lint.runLint`；诊断渲染（short/human/JSON）见 `Base.Diag.Format`（模型见
  [diagnostics.md](reference/diagnostics.md)）；效果显式化：`packages/{cli,toolchain}/lib` 与 compiler 壳层
  都是显式 `Eff`——`runCompilerCliFor : … -> Eff [] Int`，`packages/cli/lib/Vuna/Cli.vuna`、
  `packages/toolchain/lib/Vuna/{Run,Repl,Lsp}.vuna` 与三个 `app/Main.vuna` 直接 bind；`Driver/CompilerCli` 的打印/诊断/子进程/recovery 全部显式，
  `CliOpts` 是显式参数；`Base.Diag.Format` 语言也是显式 `lang` 参数。
  API 文档与检索见
  [api-docs.md](reference/api-docs.md)，调试工作流见 [debugging.md](reference/debugging.md)。
- 进程执行只在 `Driver.CompilerCli.runIn`（`@vuna@prim_eff_runIn`）。
- **stdio / socket server 公共层**（工具链，不进 seed）：`Vuna.Json.Frame`（字节级
  `Content-Length` 帧 + 16 MiB 上界）、`Vuna.Json.Rpc`（JSON-RPC 信封与错误码）、
  `Vuna.Json.Server.serveConnection`（读帧 → 分发 → 发帧的连接循环）；LSP 与 REPL server
  共用这一层，传输与退出策略由各自传入。
- 网络：用户面是 `Base.Effect.Net` 的 `NetOp` 效应（命名实例、可 mock、entry 自动预装真实
  handler）；宿主失败抛 `NetErrorOp`（typed，`vuna: net: <op> …` + exit 1），`netRecv` 的
  对端关闭是 `Nothing`；`netAcceptWithin` / `netRecvWithin` / `netSendWithin` 用 `select`
  提供单次超时（`NetStep`：ok / closed / timeout）。底层 `net` 原语（`prim_netListen/Accept/Recv/Send/Close/Port/Connect`，
  句柄是 Int、运行时映射 `Unix.file_descr`）见 [primitives.md](reference/primitives.md) §7。
  当前已落地 loopback TCP 与 Unix domain socket（异步/取消/TLS/HTTP 为非目标，见
  [tooling.md](reference/tooling.md) §5）。
- **运行时效应（Layer 1–3）**：`prim_effectPerformId` / `prim_effectHandleId`
  把 OCaml 5 一次性续延接入 `Base.Effect.Core`（开放行 + 命名实例 + 一阶效应）；
  `Vuna_runtime` 声明通用 `Perform (keyId, nameId, key, name, payload)`（路由用整数 id，
  key/name 只作展示），handler 按 id 过滤并 `continue` 一次；handler 壳是
  `dtp_effect_handle_id`，它在 handler 退出时执行
  每纤程 cleanup 栈（`prim_cleanupPush`/`prim_cleanupPop` → `dtp_cleanup_*`），
  `Base.Effect.Core.bracket`/`finally` 的 release 因此在非 `Exn` abort（续延被丢弃）时也会跑；
  运行时还包含单线程 fiber 调度器 `dtSchedRuntime`（隐藏
  `prim_sched*`；`Base.EffSched` 的 fork/yield/await/取消/结构化 scope/步数超时，main
  钩子经 `dtp_sched_main` 把 main 跑成纤程 0）；核心求值路径不执行运行时效应（见
  [effects.md](reference/effects.md) §8）。
- **TCB**：工具链永不进 seed（`packages/compiler/app/Main.vuna` 闭包不含 `Vuna.*` 工具模块；
  `nix/seed/forbidden.txt` 黑名单）；效应边界**不由 manifest 门控**：没有
  `[capabilities]` / `[trust]` / `[privileged]`，`prim_*`（纯原语）对任何包可见
  （用户包/ad-hoc 也可直调）。宿主层原语是隐藏的 `@vuna@prim_eff_*` / `@vuna@host@*`
  （源码写不出，只由 base 的 handler 与编译器/工具链内部使用）；用户面的唯一入口是
  `Base.Effect.Core.*` 标签 + handler。原语返回 `Eff []` 动作（只在 `main` 执行，
  钩子是 `v_main 0`）。显式接受的损失见 [effects.md](reference/effects.md) §8.6
  （缺口编号见 [debt.md](reference/debt.md) D62）。

## 4. LSP 与索引（工具链侧，不进 seed）

- `Vuna.Lsp.runLsp`：JSON-RPC over stdio；帧按字节读（`Vuna.Json.Frame` +
  `Vuna.Json.Server.serveConnection`，body 后无换行，见
  [tooling.md](reference/tooling.md) §2）；诊断走 `Pkg.contextForFile` + DT 精化；
  hover = 洞目标（容错查询，未解洞也给目标+上下文）→ `Vuna.Lsp.Bindings`（模块名 + 局部绑定，
  parse 级、不依赖 Index）→ Index 符号；definition 同序（模块名 → 目标文件 `module` 头 /
  局部 binder → Index）；另有 formatting / documentSymbol / references / completion /
  codeAction（lint quick fix）/ lint 诊断；`Vuna.Lsp.Semantic` 提供 semanticTokens/full
  （CST 词法流 + 声明表），`Vuna.Lsp.Highlight` / `Vuna.Lsp.Folding` 提供 documentHighlight
  与按缩进的 foldingRange。
- `Vuna.Index`：parse 级索引 v3（`vuna map` / `vuna api`，`symDoc` / `symType`，会话载荷
  落在 `objects/tool-context/`，按输入摘要判定）；`Vuna.Search` 消费它做名称/doc/类型检索。

## 5. 自举链：seed → vuna-seed → vuna-compiler → vuna

**何时该看这里**：改 `packages/compiler/` 后怀疑种子失效、要 rotate seed、改 Nix 构建图。

```text
seed/ →（seed/build.sh + ocamlopt）→ vuna-seed →（build --no-compile --out s1 compiler；
sh s1/build.sh）→ stage1 →（build --no-compile --out s2 compiler）→ diff -r s1 s2
 → vuna-compiler build . → .output/bin/vuna（同为逐模块输出）
```

产品侧不是一次整包构建：`vuna-store` 先对依赖包逐个 `check`（写接口 / 模块顺序 / 包身份），
每个插件派生拷这份 store 后只构建自己的包（`vuna-cli` / `vuna-toolchain` / `vuna-target-*` /
`vuna-plugin-web` / `vuna-dev`），`vuna` 只把二进制拷进同一个 `bin/`——入口用可执行文件自身
位置做插件发现，所以是拷贝而不是链接。改一个插件只重建它的派生；编译器身份 `cache-tag`
随每个插件安装（见 [cache.md](reference/cache.md)「编译器身份」）。

命令 / 入口：`build --no-compile --out`（`compileToDir` → `dtSplitProjectParts` / `dtSplitProjectWithIfaces` →
`generateDtSplitProgram`）、`nix/seed/rotate.sh`、`checks.seed-selfhost`。**硬不变量**：
旧 seed 能编译新源码；rotation 按需（见 [bootstrap.md](reference/bootstrap.md)）；之后
stage1 == stage2；seed 只含 compiler 包入口闭包。
测试：第 13/38 段 + `checks.seed-selfhost`，详见 [bootstrap.md](reference/bootstrap.md)。

## 改一处 → 跑什么
| 你改了什么 | 最小验证 |
| --- | --- |
| `packages/cli/` / `packages/base/` | 第 14–16、26–27、30–32 段 + `vuna check .` |
| `packages/http/` | `vuna test packages/http` + `vuna check .`（[http.md](reference/http.md)） |
| `packages/web/` | `vuna test packages/web` + 第 109 段 steps + `vuna check .`（[web.md](reference/web.md)） |
| `packages/web-cli/` | `vuna-web-cli build examples/web-static` + 第 109 段 steps + `vuna check .`（[web.md](reference/web.md) §7） |
| `packages/base/` 的效应 monad / 调试构造（`log!`/`dbgShow`/`assert`） | 第 27 段 + `dt` / `dt_base` / `dt_err` 夹具 + `vuna check .`（见 [effects.md](reference/effects.md)、[debugging.md](reference/debugging.md)） |
| `packages/compiler/`（语法 / 类型 / 精化 / 擦除） | 全量测试 + `flake check`（至少 seed-selfhost） |
| codegen 运行时 / main 钩子 / 位置表 | 第 6、13、38 段 + 第 45–46 段 + seed rotation（[debugging.md](reference/debugging.md)） |
| 观测（`Target.Ocaml.Term.dtObsRuntime` / `#line` 注入 / `Vuna.Compiler.Base.Obs` / `vuna-obs` / `vuna dev obs`） | 第 107 段 + `checks.vuna-obs-schema` / `vuna-obs-dwarf` / `vuna-obs-overhead` + `vuna check .`（[observability.md](reference/observability.md)） |
| 多线程原语（`Base.Thread` / OCaml `Domain` / native `clone`+futex） | `--only compiler/effect_native`（`90_eff_threads`）+ `steps_native/105d_native_gc`（9ab）+ `vuna test packages/base` + `vuna check .` |
| 文本日志（`Base.Data.Log` / `log!` / `Target.Ocaml.Term.dtLogRuntime` / `VUNA_LOG*`） | 第 107 段的 `log!`/`mark!` 断言 + `vuna check .`（[logging.md](reference/logging.md)） |
| CLI 工具（`run` / `test` 选项 / REPL / LSP） | 第 40、42、47–49 段 + `corpus/lsp/smoke.sh` + `vuna check .` |
| 工具链 / 插件自身（fmt/lint/dev/后端） | `nix/tools/dev-loop.sh -p <pkg> -- <cmd>`（只重建改动的包；[tooling.md](reference/tooling.md) §0） |
| split 输出 / `vuna.toml` | 第 28–29、33–34、38–39 段 |
| Nix | `nix flake check` + `nix build .#vuna` |
