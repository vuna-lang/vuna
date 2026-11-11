# 架构：子系统地图与数据流

本文是 vuna 仓库的**子系统地图**：回答“改一个功能要在哪些模块动手、该跑哪段测试”。逐模块
职责见 [compiler.md](reference/compiler.md)，Core / 精化器见 [core.md](reference/core.md)，
语义见 [language.md](reference/language.md) / [type-system.md](reference/type-system.md) / [qtt.md](reference/qtt.md)，
自举 / 内建原语能力见 [bootstrap.md](reference/bootstrap.md) / [primitives.md](reference/primitives.md)，
模块级接口缓存见 [cache.md](reference/cache.md)（失效判据 / 包级环境指纹 / 工具产物来源 /
镜像内容寻址；排障用 `VUNA_IFACE_AUDIT=1`，CI 建议加 `VUNA_IFACE_SELFTEST=1`）。

> 本页是**现状**地图；终态方向、不变量与非目标见
> [architecture-target.md](architecture-target.md)。

## 仓库分层

```text
compiler/lib/Vuna/Compiler/   （67 个模块：63 个导出 + 4 个内部模块；目录即层：
                                Frontend → Packages → Loader → Core → Elab → Codegen → Driver）
├─ Source.vuna                底层位置/路径工具（Pos/Span，无 Result）
├─ Diag.vuna                  结构化诊断模型 + Check 结果通道（ErrC Diagnostic）
├─ Common.vuna                编译器门面（Source + Diag；bind/step/traverse）
├─ Intrinsics.vuna            内建声明唯一真源（名字/签名/arity/能力/runtime/可见性）
├─ Hash.vuna                  内容寻址原语：确定性编码 + 248-bit 摘要（v0）
├─ Query.vuna                 查询图骨架：记忆化 / 依赖快照 / early cutoff / trace
├─ Frontend/                  Ast Lexer Parser Cst Parser/Support Toml Manifest  词法（含无损 CST）/ 语法 / vuna.toml
├─ Packages/                  Pkg                              包图与模块根
├─ Loader.vuna + Loader/      Modules Resolve Flatten          模块图 / 名字解析 / flatten
├─ Core.vuna + Core/          Term Eval Conv                   Core TT / NbE / 定义性相等
├─ Elab.vuna + Elab/          Sig Types Meta Case Dict Term
│                             Data Trait InstName Driver Termination
│                             Prelude Match Records Derive     双向精化
├─ Codegen.vuna + Codegen/    Decl Erase Term Assembly Split  擦除检查 + OCaml 生成
└─ Driver/                    Split Dt Compile CompilerCli      输出模型 / facade / 编译入口 / CLI
  PerfCache                          codegen 单元缓存（S5）
                              Owner Iface Cache                 归属表 / 模块接口 / 包级摘要
根包 vuna（模块根 lib/，入口 app/Main.vuna）：Cli/Interp/Fmt/Lint/Index（门面+子模块）、
  Repl/Run/Doc（+子模块）/Search（+子模块）/Sig/Lsp/Json/TestRunner/Files；suite 执行器在 Test/{Suite,Run}
依赖图：vuna → vuna-compiler → vuna-base（根包也直接依赖 base）
```

**目录即层**：目录 = 依赖层次，上层可 import 下层、反向禁止。**门面模式**：`X.vuna` 只
import 子模块并选择性重导出（对外名字面不变），实现只在叶子；**数据定义只在叶子**
（`Core.Term`、`Elab.Types` 等）。目标每模块 ≤~800 行（当前最大 `Elab/Trait.vuna`，约 1.2k）。
`compiler/` 是 seed 唯一来源（`compiler/app/Main.vuna` 的 import 闭包，数量以 `seed/` 与
`nix/seed-count.txt` / `nix/seed-files.txt` 为准）；`lib/` 工具链与 `app/` 在 TCB 之外；`base/` 模块名即 API。

## 1. 编译链：Frontend → Loader → Elab → Codegen

**何时该看这里**：改语法、import / 模块解析、DT 精化规则、索引 unification、擦除 codegen。

```text
源文件
 → Frontend.Lexer.lexSource      （token + Pos/Span；lexComments 供 fmt）
 → Frontend.Parser.parseSource   （offside layout → AST + imports）
 → Packages.Pkg.contextForFile   （最近 vuna.toml + 依赖闭包 → PackageContext；无则 base-only）
 → Loader.Flatten.loadProject    （import 图 → 名字解析 → flatten；ad-hoc 自动注入 Prelude）
 → Elab.Driver.elabProgramFull   （Records/Derive 展开 → 精化；record 不再降级）
 → Codegen.Assembly              （DtProgram 的 unit 划分/文本/main 钩子）
 → Codegen.Split.generateDtSplitProgram  （唯一生成器：runtime + 各模块 + Main，带直接依赖）
 → sh build.sh                   （Driver.Split：层内并行；ocamlopt 链接）
```

**唯一装配**：`check` / `compile` / `build` 与语言夹具共用这条链；ad-hoc 单文件只是换包
上下文（最近 manifest，无则 base-only），flatten / 精化 / 逐模块 codegen 与包内模块完全
相同——没有第二套加载语义。

**运行时错误报告**：`Vuna_runtime.ml` 由 `Codegen.Term.dtRuntimeWith` 生成 =
运行时常量 + `dt_def_locs`（定义位置表：mangled 值名 → `定义名 (相对路径:行)`，路径按
`PackageContext` 的模块根/包目录归一）+ `dt_report_exn`（未捕获异常报告器）。
`Codegen.Assembly` 的 main 钩子在入口动作外包 `try`；入口零参 `main` 的初始化期绑定也套
同一报告器，`Main.ml` 首行开 `Printexc.record_backtrace`。详见
[debugging.md](reference/debugging.md)。

**名字解析三命名空间**：`Loader.Resolve` 的解析期状态是三个**分开**的表
（`Loader.Modules.Namespaces`：值 `nsValues` / 构造子 `nsCtors` / 类型 `nsTypes`，与导出
`kind` 的 `val` / `ctor` / `type` 一一对应）。类型位置只查类型表（退化：索引构造子 →
本模块类型层 def），值位置查值表（def → ctor → 导入值 / ctor → **类型作为项**的两级退路：
本模块类型名，再到导入模块导出的类型名）。
语义与边界见 [language.md 的「type / value 双命名空间」](reference/language.md)。

**运算符与 fixity**：parser 只产出 `EInfix` / `EBacktick` / `ESect*` / `EParen` 中间节点；
`Loader.Flatten` 按每模块可见表（`Module.fixities`，`dedupeFixities` 首现去重）在名字解析前调
`Loader.Fixity.reorderProgram` 重排 / 换别名 / 展开 section。表来源 = 源码 `infix*` 声明
（`->` 由 `syntaxFixityDecls` 恒可见；未知符号运算符报错）；fmt / LSP / lint 用
`fixitiesForSource(In)` 取程序级闭包。详见 [operators.md](reference/operators.md)。

**模板字符串**：lexer 产出 `TTmpl`（洞内 token 原位保留），parser 组成 `EInterp`；
`Loader.Resolve` 在名字解析后**降级**成 `Base.Interp.interp` 调用 + `++` 链（纯语法糖，
Elab/codegen 看不到模板）。fmt/lint/index/doc 只 parse，仍按 `EInterp` 处理。详见
[templates.md](reference/templates.md)。

**擦除 / 合一 / 定义形式**：擦除只有单一判据链（`Elab.Meta.isTypeDomain` →
`binderRig` → `Core.rigOfBinder`，读取侧统一 `Core.rigIsErased`）；运行时类型不可命名时
（卡住的类型族应用）另走「不透明擦除值 + 恒等 cast」表示（见 [effects.md](reference/effects.md) §5）；元变量求解在
`Core.Conv.solveMeta`（created-depth 随 `Sols` 就地检查，非空 spine 走 Miller pattern）；
已解元变量进项只经 `Elab.Meta.zonkTerm`；`axiom` 是无体擦除定义（`DtAxiom`，运行时使用由
`Codegen.Erase.checkNoAxiomRuntime` 拒绝），定义参数少于签名时按剩余 Pi η 展开。细节见
[core.md](reference/core.md)。

**相等 / 实例 / 证明**：`==` / 比较是证据驱动的（Int/String 内建或 `Eq` / `Ord` 字典，
无泛型兜底）；约束实例与参数化 `deriving` 可用，命名实例不存在；隐式值参数 `{x : a}` 与
构造子 η 展开在 `Elab.Meta`；`DtDef` 带来源 span。trait / 实例语义见
[records-traits.md](reference/records-traits.md)。

**内建单一真源**：`Vuna.Compiler.Intrinsics` 是名字 / 签名 / arity / 归约 / 能力 / runtime /
可见性的唯一真源；`Loader.Resolve`（arity、放行、能力）、`Elab.Prelude`（签名）、
`Core.Eval`（归约）、`Codegen.Term`（runtime）都消费它。内置身份按声明 symbol 判定：`IO` 是内建效应类型；`Bool` / `List` / `Nat` 是 base 普通
data（`Base.Bool.Bool` / `Base.List.List` / `Base.Nat.Nat`），不按短名。

擦除检查由 `Codegen.Assembly.checkDtProgram` 负责（判据 `Core.rigIsErased`）；不透明字段
走后端表示（判据 `Codegen.Decl.ctorOpaqueFlagsOf`）。`vuna interp`
走同一精化链后由 `Driver.Dt.dtEvalFile` 求 `main`（纯求值：只展示 `Int`/`String`/`Bool`，
任何 `main : IO a` 报错并提示 `compile`）。

**入口符号**：`Driver.Dt.dtCheck` / `dtCheckWithProgramParts` / `dtCheckPackageWithIfacesParts` / `dtSplitProjectParts` / `dtEvalFile` /
`dtEvalExpr`；`Loader.Flatten.loadProject*` / `resolveProject`；`Elab.Driver.elabProgramFull`
（洞目标 `goalsOfProgram`）、`Elab.Termination.checkTerminationDecls`、`Elab.Match.multiToExpr`、
`Core.Eval` / `Core.Conv`；`Intrinsics.findIntrinsic`、`Loader.Resolve.checkEffectsBuiltins`；
`Codegen.Assembly.*`；`Codegen.Split.generateDtSplitProgram`；
`Driver.Split.SplitFile` / `buildScript`；CLI 经 `Driver.Compile.*` 接 `Driver.CompilerCli`。

**通常连带改动**：语法 = `Frontend.{Lexer,Parser,Ast}` + `Fmt` + `Elab.Term` / `Elab.Match` +
`Codegen`；名字解析 = `Loader.{Modules,Resolve,Flatten}`；类型规则 = `Elab.*` +
`Elab.{Records,Derive}` + `Codegen`；split = `Codegen.Split` + `Driver.Split`；诊断 =
`Diag` / `Source` + 各阶段 `Diagnostic` + golden（模型与迁移见
[diagnostics.md](reference/diagnostics.md)）。测试标签：第 1–11、13–27、30、34 段
（见 [testing.md](reference/testing.md)）；包构建 / split 见第 28/29/33/34 段；快照与上下文回归见第 38/39 段。

## 2. 包与 workspace

**何时该看这里**：改 `vuna.toml`、workspace 成员、依赖 DAG、`[export]` 可见性、包上下文。

```text
vuna.toml → Frontend.{Toml.parseToml, Manifest.parseManifest/validateManifest}
 → Packages.Pkg.loadPackage / workspacePackages（DAG、模块根）
 → contextForFile（最近 manifest + 依赖闭包）| contextForDir（工具/REPL 从 cwd）
   | locateBase（无 manifest → base-only：`VUNA_BASE` 或 exe 相对布局，失败报错）
 → Loader.loadProject（PackageContext → Project；`[capabilities].effects` 随上下文传递）
```

**入口符号**：`Pkg.loadPackage` / `workspacePackages` / `findManifestDirMaybe` /
`contextForFile` / `contextForDir` / `locateBase` / `contextCapabilities`
（`PackageContext` 抽象 + `contextPackage` / `contextRoots` / `contextDir`）；
`Manifest.manifestCapabilities`、`Loader.Flatten.loadProject*` / `resolveProject`；CLI 在
`Driver.Compile.checkPackage` / `compileToDir`。

**约束**：Toml/Manifest 不碰 I/O，Pkg 只做 lexical 规范化；**每个源文件唯一包上下文**，
目录入口 `check/build <dir>` 直接 `loadPackage` 只认该目录 manifest（不向上找）；跨包只认
依赖包 `[export]`，隐藏模块报错；依赖图 DAG、包名唯一；`[capabilities]` 名由 Loader 校验。
测试：第 28–29、33、39 段 + `checks.vuna-package`。

## 3. 根包工具链与 TCB 边界

**何时该看这里**：改 `vuna` 子命令、fmt/lint/repl/doc/test/map、解释器 facade。

- `Vuna.Cli.runCli` 分发；`Vuna.Interp.interpretFile/interpretExpr`（`PackageContext` 入参，
  实际 `Driver.Dt.dtEvalFile`）、`Vuna.Repl.runRepl`（`:type/:load/:reload/:browse`）、
  `Vuna.Repl.Server.runReplServer` / `Vuna.Repl.Client.runReplClient`（`--listen` / `--client`；
  协议与 agent 配方见 [tooling.md](reference/tooling.md) §5）、
  `Vuna.Run.runRun`（`vuna run`）、`Vuna.TestRunner.runTests`（`TestOpts`：filter/list/verbose/
  fail-fast）、`Vuna.Doc.runDoc`（docstring -> 单文件 HTML；`Vuna.Doc.{Comments,Model,Prose,Html,Run}`）、
  `Vuna.Search.runSearch`、`Vuna.Files.collectVunaFiles`；fmt/lint 见 `Fmt.formatSourceWith` /
  `Lint.runLint`；诊断渲染（short/human/JSON）见 `Diag.Format`（模型见
  [diagnostics.md](reference/diagnostics.md)）；API 文档与检索见
  [api-docs.md](reference/api-docs.md)，调试工作流见 [debugging.md](reference/debugging.md)。
- 进程执行只在 `Driver.CompilerCli.runIn`（`prim_runIn`，需要 `process`；工具链经 `runIO`）。
- **stdio / socket server 公共层**（工具链，不进 seed）：`Vuna.Json.Frame`（字节级
  `Content-Length` 帧 + 16 MiB 上界）、`Vuna.Json.Rpc`（JSON-RPC 信封与错误码）、
  `Vuna.Json.Server.serveConnection`（读帧 → 分发 → 发帧的连接循环）；LSP 与 REPL server
  共用这一层，传输与退出策略由各自传入。
- 网络原语：`net` 能力（`prim_netListen/Accept/Recv/Send/Close/Port/Connect`，
  句柄是 Int、运行时映射 `Unix.file_descr`），见 [primitives.md](reference/primitives.md) §7。
  当前已落地 loopback TCP 与 Unix domain socket（异步/取消/TLS/HTTP 为非目标，见
  [tooling.md](reference/tooling.md) §5）。
- **运行时效应（Layer 1–3，`runtime-effects` 分支）**：`prim_effectPerform` / `prim_effectHandle`
  （`unsafe`）把 OCaml 5 一次性续延接入 `Base.Eff`（开放行 + 命名实例 + 一阶效应）；
  `Vuna_runtime` 声明通用 `Perform (key, name, payload)`（key/name 都是 String），handler 按 key/name 过滤并
  `continue` 一次；W7 起 handler 壳是 `dtp_effect_handle`，它在 handler 退出时执行
  每纤程 cleanup 栈（`prim_cleanupPush`/`prim_cleanupPop` → `dtp_cleanup_*`），
  `Base.Eff.bracket`/`finally` 的 release 因此在非 `Exn` abort（续延被丢弃）时也会跑；
  W9 起运行时还包含单线程 fiber 调度器 `dtSchedRuntime`（隐藏
  `prim_sched*`；`Base.EffSched` 的 fork/yield/await/取消/结构化 scope/步数超时，main
  钩子经 `dtp_sched_main` 把 main 跑成纤程 0）；`vuna interp` 不执行运行时效应（见
  [effects.md](reference/effects.md) §8）。
- **TCB**：工具链永不进 seed（`compiler/app/Main.vuna` 闭包不含 `Vuna.*` 工具模块；
  `nix/tcb-forbidden.txt` 黑名单）；效应边界是 manifest 显式能力
  （`[capabilities].effects` ∈ console/fs/process/env/clock/net/unsafe），
  `checkEffectsBuiltins` 按 `Intrinsics` 能力位检查；原语返回 `IO` 动作（只在 `main` 执行，
  钩子是 `v_main 0`），未声明能力的包只能经 `Base.IO`，`runIO`/`prim_runIO` 需
  `unsafe`；`base` 自身声明 `unsafe`（`Base.IO.runIO` 别名与 `Base.ST.runST`，见
  [effects.md](reference/effects.md)）。

## 4. LSP 与索引（工具链侧，不进 seed）

- `Vuna.Lsp.runLsp`：JSON-RPC over stdio；帧按字节读（`Vuna.Json.Frame` +
  `Vuna.Json.Server.serveConnection`，body 后无换行，见
  [tooling.md](reference/tooling.md) §2）；诊断走 `Pkg.contextForFile` + DT 精化；
  hover = 洞目标（容错查询，未解洞也给目标+上下文）→ `Vuna.Lsp.Bindings`（模块名 + 局部绑定，
  parse 级、不依赖 Index）→ Index 符号；definition 同序（模块名 → 目标文件 `module` 头 /
  局部 binder → Index）；另有 formatting / documentSymbol / references / completion /
  codeAction（lint quick fix）/ lint 诊断。
- `Vuna.Index`：parse 级索引 v3（`vuna map` / `vuna api`，`symDoc` / `symType`，缓存
  `.local/index/`，内容哈希判定新鲜度）；`Vuna.Search` 消费它做名称/doc/类型检索。

## 5. 自举链：seed → vuna-seed → vuna-compiler → vuna

**何时该看这里**：改 `compiler/` 后怀疑种子失效、要 rotate seed、改 Nix 构建图。

```text
seed/ →（seed/build.sh + ocamlopt）→ vuna-seed →（build --no-compile --out s1 compiler；
sh s1/build.sh）→ stage1 →（build --no-compile --out s2 compiler）→ diff -r s1 s2
 → vuna-compiler build . → .output/bin/vuna（同为逐模块输出）
```

命令 / 入口：`build --no-compile --out`（`compileToDir` → `dtSplitProjectParts` / `dtSplitProjectWithIfaces` →
`generateDtSplitProgram`）、`nix/seed-rotate.sh`、`checks.seed-selfhost`。**硬不变量**：
旧 seed 能编译新源码；rotation 按需（见 [bootstrap.md](reference/bootstrap.md)）；之后
stage1 == stage2；seed 只含 compiler 包入口闭包。
测试：第 13/38 段 + `checks.seed-selfhost`，详见 [bootstrap.md](reference/bootstrap.md)。

## 改一处 → 跑什么
| 你改了什么 | 最小验证 |
| --- | --- |
| `lib/` / `base/` | 第 14–16、26–27、30–32 段 + `vuna check .` |
| `base/` 的效应 monad / `Base.ST` / 调试构造（`dbg`/`assert`） | 第 27 段 + `dt` / `dt_base` / `dt_err` 夹具 + `vuna check .`（见 [effects.md](reference/effects.md)、[debugging.md](reference/debugging.md)） |
| `compiler/`（语法 / 类型 / 精化 / 擦除） | 全量测试 + `flake check`（至少 seed-selfhost） |
| codegen 运行时 / main 钩子 / 位置表 | 第 6、13、38 段 + 第 45–46 段 + seed rotation（[debugging.md](reference/debugging.md)） |
| CLI 工具（`run` / `test` 选项 / REPL / LSP） | 第 40、42、47–49 段 + `corpus/lsp/smoke.sh` + `vuna check .` |
| split 输出 / `vuna.toml` | 第 28–29、33–34、38–39 段 + `checks.vuna-package` |
| Nix | `nix flake check` + `nix build .#vuna` |
