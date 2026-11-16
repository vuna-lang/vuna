# 技术债务与未实现能力（debt）

本文件只登记**当前仍未关闭**的债务、缺陷与能力缺口；关闭即删除（历史在 git）。每条给
**可复现证据**（命令或 file:line）。

分工（避免重复）：**规则与语义、已落地的事实**都在各主题参考页
（[type-system.md](type-system.md)、[primitives.md](primitives.md)、[effects.md](effects.md)、
[tooling.md](tooling.md) 等），本文件不复述。摘要只陈述**仍未成立的那个事实**，不写
「部分修复」；同义项合并为一行。

## 语言与精化器

| ID | 仍未成立的事实 | 证据 | 归属 |
| --- | --- | --- | --- |
| B07 | 高阶合一只有空 spine 与 Miller pattern 是完整的，其余走「头一致就提取」的近似，提取不到才报错 | `Core/Conv.vuna` 的 `solveMetaFuel` / `solveMetaHoLegacyFuel`；`TC_CannotSolveHigherOrder` | 后续 |
| B29 | `where` / `let` 局部签名不接受 `C a =>`（需 scope-aware 局部签名解析 + 局部泛化）；trait 方法上的约束属 supertrait 语义，未实现；`axiom` / `extern` / 构造子 / record 字段上的约束不计划 | `Frontend/Parser.rejectCtxSuffix`；夹具 `99_explicit_where_rejected`、`99_explicit_trait_method_rejected` | 后续（trait 方法约束不计划） |
| B30 | 无有序持久容器（TreeMap/TreeSet）；哈希容器固定 1024 桶、无 remove | `base/lib/Base/{HashMap,HashSet}.vuna`；[stdlib.md](stdlib.md) 的容器边界 | 后续 |
| D21 | 完整 FFI 未做：无回调 / GC root / pin、无 C 头文件解析、无字符串双向可变共享 | [primitives.md](primitives.md) §10「受限 FFI」 | 后续 |
| D22 | 无依赖 multiplicity / 线性箭头 / 借用 / 一次性续延；线性值传给 ω 形参的通用函数被 `TC_LinearOverused` 拒绝（保守近似只误拒不误放） | `Elab/Usage.vuna`；[qtt.md](qtt.md) | 后续 |
| D63 | 局部可变/region 安全：`Base.ST` 随未使用代码清理删除，当前没有安全的局部可变入口；重建前必须先定「纯签名如何执行局部效果」（不得沿用「宿主 `IORef` + `runPure`」的旧捷径，否则重复 `Eff []` 不纯问题），与显式 `Host` 行/IO 模型一起设计 | `Base.ST`（历史）；[effects.md](effects.md) §4；[qtt.md](qtt.md) §8 | 后续 |
| D64 | 可变数组/可变字符串缓冲：`Base.MArray` / `Base.Buffer` 与内建类型构造子、8 个原语一并删除；需要时按新架构重建（先定表示与 `Eff []` 纯度模型） | `base/lib/Base/{MArray,Buffer}.vuna`（历史）；[primitives.md](primitives.md) §6 | 后续 |
| D24 | Nat 字面量编译期展开为 `Zero`/`Succ` 链（Core / iface 载荷随字面量大小线性增长）；codegen 侧无固定步数预算（`Codegen.Lower` 按项规模派生预算，`Codegen.Term` 无预算），剩余问题只有字面量本身的展开成本 | `Elab/Term/Impl.natLitTerm`；[primitives.md](primitives.md) §3.1 | 后续 |
| D27 | 精化期未解 meta 按「可表示」处理会漏插 cast（终解后才知道类型不可表示） | `Elab/Meta.vuna` 的未解 meta 判据；[effects.md](effects.md) §5 | 后续 |
| D62 | manifest 门控已删除（显式接受的损失）：任意包可直调 `prim_*` / `prim_eff_*`；没有每包原语白名单、`unsafe` 定义级审计，网络原语对任何包可见 | `compiler/lib/Vuna/Compiler/Intrinsics.vuna`、`base/lib/Base/Eff*.vuna`；[effects.md](effects.md) §8.6 | 后续（表示层权限或新模型） |
| D66 | 宿主效应内建化（策略见 [effects.md](effects.md) §2.1）：行 IType（`IEffRow`/`IRowCons`/`IGlobal`）、隐藏 `Base.Eff.runMain`、`rowAppend` 行拼接（编译器 `appendReduce`）与 `joinEff` 泛化、`builtinEffects` 表、通用 entry 自动预装（`Codegen.Lower` 按 main 行收集 handler 名进 `IrEntry`，后端嵌套 `runXHost`）；带行 handler + `_host` 原语：Console/Fs/Clock/Env/Process/Exit/Stdin/Args；新建 `Base.EffRef`/`Base.EffNet`（直调带行原语，`beRunHost=""` 无需 handler）；夹具 90–94。剩余：Sched（`forkTask` 携带子计算、不是一阶 op，需要单独的带行类型面设计；`EffSched` 仍 `Eff []`）、旧 `handleXHost`/`runX` 迁移到带行 + 工具链自身 IO（`Cli.consoleLine`/`CompilerCli`）、`prim_eff_*` 全部改 `@vuna@` 隐藏、eff-boundary 守卫改写 | `compiler/lib/Vuna/Compiler/{Intrinsics,Core/Eval,Elab/Prelude,Elab/Driver,Codegen/Lower,Codegen/Term}.vuna`、`base/lib/Base/Eff*.vuna`；[effects.md](effects.md) §2.1 | 后续 |
| D32 | 顶层签名的自由隐式变量 kind 只按应用次数推断（不从构造子 kind 反推）；头可合一的重叠实例被拒 | `Elab/Sig.quantifyTopKinds`、`Elab/Trait.{instanceTeleMetas,classParamKindOf}` | 后续 |
| D37 | `runEff` 内部信任入口仍接受任意行；运行时 `unhandled effect` 兜底仍服务库内部路径 | `base/lib/Base/Eff.vuna`（`runEff`）；`compiler/lib/Vuna/Compiler/Elab/Term/Impl.vuna`（`unhandledEffectLabel`）；[effects.md](effects.md) §8.4/§8.6 | 后续 |
| D41 | 无 Domain 并行、父 fiber handler 继承 | `Base.EffSched`；[effects.md](effects.md) §8.5 | 后续 |
| D42 | 无通用线性箭头类型 / multiplicity 多态；`bracket` 的 cleanup 只能访问外层 handler、自身异常被吞、调度器硬中止路径无 handler 栈；线性值可经非线性 data 字段被复制 | `Base.Eff`（`Cont`/`bracket`/`finally`）、`Intrinsics.vuna`（`prim_cleanupPush/Pop`）；[effects-layers.md](effects-layers.md) | 后续 |
| D44 | 协作式取消只在挂起点生效；超时硬中止丢弃续延、未执行的清理不跑；超时是逻辑步数（无真实时钟）；任务体只能 `Eff Nil a`、无法继承父 handler 栈；Mutex/Semaphore/Channel 是忙等实现 | `Base.EffSched`；`compiler/lib/Vuna/Compiler/Codegen/Term.vuna`（`dtSchedRuntime`）；[effects.md](effects.md) §8.5 | 后续 |
| D52 | 生成的字典/方法投影无类型标注：OCaml 侧会把 `f a` 与 `f (a -> b)` 错误统一（`Applicative.liftA2` 从 `ap` 派生即失败），只能逐实例手写；codegen 加类型标注后才能恢复派生 | `compiler/lib/Vuna/Compiler/Codegen/{Decl,Term}.vuna` | 后续 |
| D54 | `handle`/`perform` 语法支持一阶 op 族（参数化族 State/Reader 的 `k = 1` 也行，按 op 族 kind 的宇宙域与 res 族 arity 校验）；**作用域/高阶 op 族 Exn**（`ExnOp` 的第一个显式参数域是 `Row` 而非宇宙、res 族名 `exnRes` 也不合 `<res><族>` 约定）仍只能手写 handler（`TC_HandleFamilyUnsupported`）。真正的修复要等效应表示收敛（op 携带 Row/子计算需要高阶效应类型） | `compiler/lib/Vuna/Compiler/Elab/Term/Impl.vuna`（`handleFamilyArityOf`/`handleOpArity`/`handleCallExprWith`）、`base/lib/Base/Eff.vuna`（`handleWith`/`handleWithAt`）；夹具 `dt_err/100_eff_handle_family_unsupported`；[native-effects.md](native-effects.md) §9 | 后续 |
| D57 | `handle` 语法与 base 的手写 wrapper（`get`/`put`/`ask`/`runConsole`…）**key 不配对**：语法降级的 key 是 op 族规范名，wrapper 手写 `"state"`/`"console"` 等；语法程序只能用 `perform` 写、wrapper 程序只能手写 handler | `compiler/lib/Vuna/Compiler/Elab/Term/Impl.vuna`（`performCallExpr`/`handleCallExprWith`）、`base/lib/Base/Eff*.vuna`；[native-effects.md](native-effects.md) §9 第 5 条 | 后续（统一 key） |
| D60 | `perform`/`handle` 语法本身仍没有显式实例名：多实例行上裸标签必然 `TC_AmbiguousInstance`；**wrapper 调用**已支持 `f@name`（`Member n e r =>` 签名糖 + 隐式 String 名），但语法内联的 `perform`/`handle` 仍只能用行解/默认名，指定实例需用 wrapper 或 `sendCore`/`handleCore` | `compiler/lib/Vuna/Compiler/Elab/Term/Impl.vuna`（`performCallExpr`/`handleCall`）、`base/lib/Base/Eff*.vuna`；夹具 `dt_base/82`、`dt_err/108`、`dt_err/109`；[native-effects.md](native-effects.md) §9/§10 | 后续（若语法内联也需要，加 `perform @name`） |
| D61 | 高阶入口（如 `Bool -> Check PackageContext`）上使用 `pure (case ...)`/`fmap` 时，实例字典元变量可能被解成类型级名字（生成 `pure v_Int` 或 `CG_TypeLevelNameRuntime`） | 在工具链 CLI 的上下文选择处用显式 `case` 分支规避；未改 Elab/codegen | 后续若再遇，修字典解元或登记更精确限制 |
| D65 | 只有内置宏：没有用户自定义宏 / 模式宏 / 宏生成宏；宏名是全局内置名（不参与模块作用域，不能遮蔽），实参只做 AST 替换（无 hygiene 重命名、无 typed macro / reflection） | `compiler/lib/Vuna/Compiler/Loader/Expand.vuna`（`expandMacro`）、`Frontend/Ast.vuna`（`macroSyntaxName`）；[language.md](language.md)「内置宏」 | 终局见 architecture-target D4（typed macro 之前的 AST→AST 阶段） |
| D66 | 宏展开只有调用点 span：展开出的节点共享 `name!` 的 span，没有 per-展开节点的 source map；LSP 不能 goto 宏定义 / 展开视图，fmt / lint / index 只按调用形式处理 | `Loader/Expand.vuna` 的 span 约定；`lib/Vuna/Fmt/Expr.vuna`（标记回渲染）、`lib/Vuna/Index/Scan.vuna`（标记过滤） | 后续（与 D4 / LSP 语义化一起做） |

## 工具、构建与验证

| ID | 仍未成立的事实 | 证据 | 归属 |
| --- | --- | --- | --- |
| C37 | 擦除位置残留未解 meta 仍靠跨包段重编号共享（**A 已修**：`shiftTerm` 覆盖全部 Term 构造子、fuel 用尽报可检测内部错误而非静默漏移；dep 段号按模块名排序后的名次分配、与 iface 列表顺序无关。**仍未做**：语义方案 B——在精化收尾冻结擦除位未解 meta，需用户拍板「依赖方不再能替别的模块解洞」） | `Driver/Cache`（`shiftTerm`/`shiftCachedProgram`）、`Driver/Dt`（`shiftedDepPrograms`）、`test/suite/steps/66_meta_shift.steps`；[cache.md](cache.md) | 后续（B 待决策） |
| C38 | LSP case split：不检查依赖模块导出面；构造子 / record 解析是 parse 级；每请求重跑容错精化（无进程内缓存）；洞在类型位置仍可能生成非法 `case`；索引族 case split 需要精化器暴露可达构造子（研究，非债务） | `lib/Vuna/Lsp/Query.caseSplitActions`、`lib/Vuna/Lsp/Bindings`；`test/corpus/lsp/smoke.sh`；[lsp.md](lsp.md) | 后续 |
| C45 | LSP 缺局部绑定推断类型：λ / `as` / 记录 pun 等无语法标注的 binder 只能给文本推导位置/类型；同名 `?name` 不共享求解 | `lib/Vuna/Lsp/Bindings.vuna`、`Elab/Driver.goalsOfProgramTolerant`；[lsp.md](lsp.md) | 后续 |
| C46 | `vuna test` 的 main 通过判据只认 `Int`/`Nat`/`String`/`Bool` 与 `Eff [] a`（动作 main 只按退出码 0，不比较返回值） | `lib/Vuna/Test/Run.vuna`（`dtMainKind`）；[primitives.md](primitives.md) §5 | 后续 |
| C47 | 增量会话（`Dt.dtIncrementalCheckedCore`）只汇总 loader + `dtProgWarnings`，**不跑**全量尾部的 `warnUnusedDefsIn`：未使用定义 / 遮蔽类 warning 在会话路径上不可得。runner 因此让 fixture 负例一律走全量；若将来要求正例也断言 warning，得把 `warnUnusedDefsIn` 接进增量尾部 | `compiler/lib/Vuna/Compiler/Driver/Dt.vuna`（`dtIncrementalCheckedCore` 与 `checkDeclsWithWarns` 的差异）；`lib/Vuna/Test/InProc.vuna`（`checkFileSessioned` 的注释）；[testing.md](testing.md)「进程内断言」 | 后续 |
| C48 | steps 里仍有 82 个文件 spawn `vuna` 子进程（进程绑定岛）：PTY / stdio 帧 / 产物执行 / 多进程 store / CLI 渲染文本这几类是构造性的，但没有逐个做到「只断状态的步骤」的极限压缩，ratchet 上限 `nix/checks/data/steps-inproc.max` 只降不增 | `test/suite/process-bound.txt`；`nix/checks/lib/steps-inproc.sh`；[testing.md](testing.md)「进程绑定岛」 | 后续（按需逐条迁移） |
| D30 | docstring 覆盖未全仓化：`vuna doc --check` 受管辖包仍是 compiler+base，root `lib/`、`app/` 未被收集；无 CI 门禁（ratchet 门禁已移除，只在本地按需跑）；多页 HTML 与零缺失不计划（内部符号为主、单文件可直接打开） | `lib/Vuna/Doc/*`；[api-docs.md](api-docs.md) | 后续（多页/零缺失不计划） |
| D33 | 运行时错误只有定义级位置：无表达式级 span、局部变量值、断点（无 DAP）；`ocamlopt` 单元内联会把抛错点归到调用者帧；非入口单元顶层初始化的异常不在捕获范围 | `Codegen/Term`（`dtDefLocTable` / `dtRuntimeWith`）；[debugging.md](debugging.md) §2 | 后续 |
| D67 | 全局旗标字面量仍分散：`Vuna.Cli.stripPerfFlags` 匹配 `--debug-perf`，生成的 runtime 文本里匹配 `--debug-perf` / `VUNA_DEBUG_PERF`；`--release` 在 `Vuna.Cli`、`Vuna.Run`、`CompilerCli` 与 `VUNA_RELEASE` 读取处各有一份 | `lib/Vuna/Cli.vuna`、`lib/Vuna/Run.vuna`、`compiler/lib/Vuna/Compiler/Driver/CompilerCli.vuna`、`compiler/lib/Vuna/Compiler/Codegen/Term.vuna` | 后续（统一成旗标门面；不影响行为） |
| D68 | 编译器 trace 开关是**运行时原语**（`@vuna@debug@on` 读 argv/env），不是显式传参：深部探针在 `Elab`/`Conv`/`Codegen` 的纯函数里，传 trace 能力会把整条纯核心 effect 化 | `compiler/lib/Vuna/Compiler/Intrinsics.vuna`、`Codegen/Term.vuna`（`dtTraceRuntime`）、`Loader/Expand.vuna` | 终局若要求零 ambient 配置，只能删深部探针或引入显式 trace 效应（与 D4 一起评估） |
| D80 | 表达式级 / 分支级观测定位不存在：Core `Term` 只有 `TVar` 带 span（其余节点擦除时丢失位置），所以探针只能到「定义级 + 采样」；要表达式级归因须给 Core 全部节点补 span，并同步 `Canonical.CoreTerm` 与全部缓存 codec | `compiler/lib/Vuna/Compiler/Core/Term.vuna`（`TVar` 唯一的 span）、`Codegen/Term.lineDirectiveOf`（只按定义起始行写 `#line`）；[observability.md](observability.md) §5/§10 | 后续（与 D33 一起做） |
| D81 | 进程 RSS / 峰值内存不可测：OCaml 5.5 的 `Unix` 没有 `getrusage`，`Gc.quick_stat` 只给堆字数；`top_heap_words` 是**高水位且不回落**，因此 span 的 `args.heapWords` 是「至此的峰值」而不是该段增量（分配量用 `minor_words + major_words` 差，准确） | `compiler/lib/Vuna/Compiler/Codegen/Term.vuna`（`dtObsRuntime` 的 `dtp_obs_span`）；[observability.md](observability.md) §6/§10 | 后续（RSS 只能 `/proc/self/statm` 轮询或外部 `time`） |
| D82 | 观测只覆盖主 domain：`ITIMER_PROF`/`SIGPROF` 是进程级单定时器，fiber 全在主 domain 上跑所以够用；多 domain 采样要每 domain 独立 timer + 合并（`Runtime_events` 的 GC/调度事件也没接） | `Codegen/Term.vuna`（`dtp_obs_cpu_tick`）；[observability.md](observability.md) §1 O9 | 后续（与 D41 一起） |
| D83 | `vuna obs serve --cdp` 只做 Content-Length JSON-RPC，Chrome DevTools 需要的 WebSocket 握手在工具侧 Node 桥 `test/corpus/obs-cdp/bridge.mjs`（`Sec-WebSocket-Accept` = SHA-1 + base64，vuna 语言层不做）；桥的限制是不支持分片续帧、每个 WS 连接起一个 serve 进程（serve 本身单连接）、不随 `nix flake check` 跑（需 Node + 端口），且 serve 是**离线**的（profile 来自已有 trace，非 live 采样） | `lib/Vuna/Obs/Serve.vuna`、`lib/Vuna/Json/Server.vuna`、`test/corpus/obs-cdp/bridge.mjs`；[observability.md](observability.md) §1 O11/§7/§8 | 已落地（桥已加；剩余限制见左） |
| D35 | REPL 的 resize 重绘靠空闲轮询（tty 关闭退化为空闲轮询，接受为限制）；Index 只覆盖 workspace 源码（外部依赖模块只能 `:load` 不能 `:browse`） | `lib/Vuna/Repl/Edit.vuna`、`lib/Vuna/Index/*`；[tooling.md](tooling.md) §4 | 后续 |
| D79 | 记录更新 `{ r | f = v }` 直接作函数实参时精化器报 `TC_ErasedBinderUsed a#fam`（内部构造子字段 binder 被当运行时使用）；只能先在 `let`/函数体里位构造绕开 | `compiler/lib/Vuna/Compiler/Elab/Term/Impl.vuna`（record update 降级）、`Elab/Records` | 后续 |
| C48 | `vuna check` 仍会生成整套 codegen 文本再丢弃（`Driver.Dt.checkDtProgramOf` = lowering + `genUnitParts`），冷 `check compiler` 的 codegen 段约 1.4 s 里相当一部分是纯文本拼接 | `compiler/lib/Vuna/Compiler/Driver/Dt.vuna`（`checkDtProgramOf` / `dtCheckScoped`）、`Codegen/Assembly.vuna`（`genUnitParts` 注释「check 路径并丢弃文本」） | 后续（拆「校验 pass / 文本生成 pass」，需先列清哪些诊断确实来自文本生成段） |
| C49 | 干净模块判定不复验依赖哈希链：`ownCleanInfo` 忽略依赖表参数，真正做 `moduleDepsOk` 的 `cleanModulesGo` **无调用点**（死代码）；依赖包接口变化时本包干净模块的缓存程序不做链校验，靠包级 check 缓存 key（依赖身份摘要）兜底 | `compiler/lib/Vuna/Compiler/Driver/Compile.vuna`（`ownCleanInfo` / `cleanModulesGo`） | 后续（要么删死代码并把链校验前移到 `ownCleanInfo`，要么明确「包级 key 已是唯一判据」） |
| D85 | 模块顺序对象只按包名寻址（`addrOf ["order", pkgKey]`，`pkgKey` = 包名，不含源码/编译器身份），编译器重建或包源码变化后缓存里的「精化顺序」可能与新建 iface 的依赖边不一致，split 串接报 `IC_InvariantViolated: split dependency is not in topological order`；兜底只在 order 缺失时回退全量，不校验顺序本身是否仍与依赖图相容。本地规避是 `vuna clean --store` | `compiler/lib/Vuna/Compiler/Driver/Compile.vuna`（`writeOrderEff` / `readOrderEff` / `depModsByOrderEff`）、`Codegen/Split.vuna`（`canonicalTopo` 断言） | 后续（读侧按依赖图校验，不相容即回退全量） |
| D86 | 前端位置模型只有（行,列）：`PTok` / `Span` 不带字节偏移，CST 用单调游标、Lint 用自建行表反算，LSP 拿不到 token 级偏移。要做 `token = kind + [start,end)` 与 `Span {file,start,end}` + 行索引，才能删掉这些换算并让 AST 缓存带位置（P2 之后 `Canonical.Ast` 丢 span 已不再是缓存阻塞项，缺的是编码面） | `compiler/lib/Vuna/Compiler/Frontend/Lexer.vuna`（`PTok`）、`Frontend/Cst.vuna`（`LineCur`）、`lib/Vuna/Lint/Rules.vuna`（行表切 span 文本）、`Loader/Flatten.vuna`（不做 AST 缓存的理由） | 后续（触发条件：LSP 要做语义高亮/真增量，或 Lint 要摆脱自建行表；代价是 ~150 处 `PTok` 模式与 `Span` 全链改写） |
| D87 | lexer 仍是 `List Int` 游标：入口 `strUnpack` 整串，每字节至少分配 `Chars` + `Pos` + cons 各一次；词法诊断/扫描器 fuel 用 `4*len+64` 估算而不是天生递减。仓内已有「原串 + 偏移」先例（`Canonical/Bytes.Cur`，注释实测 5 MB `strUnpack` ≈990 ms vs 光标 12 MB ≈19 ms）；改成索引游标后 `PTok` 语义不变，但收益上限受前端占比约束（冷 `check compiler` 的 lex ≈135 ms，见 [performance.md](performance.md) §6.1） | `compiler/lib/Vuna/Compiler/Frontend/Lexer.vuna`（`Chars` / `sourceFuel`）、`Canonical/Bytes.vuna` §光标 | 后续（触发条件：冷 check 的 lex 超过 ~0.5 s，或 lexer 要进 wasm/native 运行时；当前 135 ms / 全量 13 s，见 §6.1） |
| D88 | 同一模块在一次 `check` 里被语法分析约 **2.8 次**（冷 `check compiler`：`vuna.parse.syntax` 461 次 / 164 个模块）：加载、fixity 表、header 扫描各走一遍 `parseFileWithPath`，只有 lex 有磁盘缓存，解析结果（含 span）不复用。减少**次数**比加快单次更值，但需要进程内 `SourceUnit`（源串+token+AST+诊断）与 `Eff` 行的会话状态 | `vuna.parse.syntax` 计数（`VUNA_OBS=1` + `vuna obs summarize`）；`Loader/Flatten.parseFileWithPath`；[performance.md](performance.md) §6.1 | 后续（触发条件：工具侧解析次数成为体感瓶颈——LSP 已靠 `parseSourceWithComments` 从 2–6 次降到 1 次；编译器内复用需要带 span 的 AST 缓存） |
| D90 | 覆盖性见证只判「单列矩阵 + 顶层缺失构造子」：多列/嵌套列要判完整，需要每个构造子的**显式**参数个数与族归属，而构造子清单（名字/类型）不随接口摘要跨包传递（依赖包的 `ecDatas` 里 ctor 列表为空），重载构造子（`@vuna@ctor@…` 一名挂多族）也无法从名字唯一确定族。因此嵌套模式的漏分支仍由降级后的既有检查报在合成代码位置上，只有顶层缺失构造子能拿到源模式的见证 | `compiler/lib/Vuna/Compiler/Elab/Coverage.vuna`（模块头）、`Elab/Meta.vuna`（`ctorFamilyTable`）、`Driver/Iface.vuna` | 后续（触发条件：嵌套模式漏分支的报错位置被用户或工具反馈为不可用；修法是 iface 携带 ctor 清单 + 重载名消歧） |
| D91 | 在 `let ... in case <对递归组的调用>`（以及某些嵌套 `case` 分支内的 `let` 绑定）位置调用递归函数会被误报 `TC_TooManyArgs: too many arguments (not a function)`，而同一调用移出 `let`/`case` 就正常。最小复现：`f table fuel qs = if fuel <= 0 then Nothing else case qs of [] => Nothing; x :: rest => g (fuel - 1) table qs`，`g` 反向调用 `f`，`f` 在 `let ... in case f table (fuel - 1) qs of` 处报错；去掉 `let` 即消失。已把调用先绑成 `let deeper = ... in case deeper of` 作为绕开手段（`Elab/Coverage.vuna` 的注释里也记了这条），但触发条件还没收敛成 5 行规则 | 复现文件见本轮记录（`minimal2.vuna` / `minimalB.vuna`：3～5 参数 + 互递归/嵌套 case）；`compiler/lib/Vuna/Compiler/Elab/Term/Impl.vuna`（应用脊椎的 arity 判定） | 后续（先把触发条件收敛成最小用例，再查 `inferArgs` 对 let/case 下应用脊椎的 arity 计算） |

## 效应统一（Eff 已贯通）

| ID | 仍未成立的事实 | 证据 | 归属 |
| --- | --- | --- | --- |
| D89 | native 续延每次 resume 复制 `[perform_rbp, rt_stack_top)` 整段栈并固定留 512 KiB slack（约 5k 个常见帧，超出会越过段界）；迁移后的旧栈段不回收，深递归 + 大量 resume 会持续消耗 arena；续延仍只 one-shot | `compiler/lib/Vuna/Compiler/Native/Runtime.vuna`（`effPerformFn` / `effResumeFn` / `effUnrelocateFn`）；[native.md](native.md) §3.4；105 的 `effdeep` / `effmany` 用例 | 后续（栈段回收/按需 slack；multi-shot 不做） |

## 相关阅读

- 规则与语义：各主题参考页（见 `AGENTS.md` 的「文档导航」）
