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
| B29 | `where` / `let` 局部签名不接受 `C a =>`（需 scope-aware 局部签名解析 + 局部泛化）；trait **方法签名**上的约束（方法级）未实现；trait 头的父类约束已支持（`trait Functor f => Applicative f`）；`axiom` / `extern` / 构造子 / record 字段上的约束不计划 | `Frontend/Parser.rejectCtxSuffix`；夹具 `99_explicit_where_rejected`、`99_explicit_trait_method_rejected` | 后续（trait 方法约束不计划） |
| B30 | 无有序持久容器（TreeMap/TreeSet）；哈希容器固定 1024 桶、无 remove | `packages/base/lib/Base/Container/{HashMap,HashSet}.vuna`；[stdlib.md](stdlib.md) 的容器边界 | 后续 |
| D21 | 完整 FFI 未做：无回调 / GC root / pin、无 C 头文件解析、无字符串双向可变共享 | [primitives.md](primitives.md) §10「受限 FFI」 | 后续 |
| D22 | 无依赖 multiplicity / 线性箭头 / 借用 / 一次性续延；线性值传给 ω 形参的通用函数被 `TC_LinearOverused` 拒绝（保守近似只误拒不误放） | `Elab/Usage.vuna`；[qtt.md](qtt.md) | 后续 |
| D63 | 局部可变/region 安全：`Base.ST` 随未使用代码清理删除，当前没有安全的局部可变入口；重建前必须先定「纯签名如何执行局部效果」（不得沿用「宿主 `IORef` + `runPure`」的旧捷径，否则重复 `Eff []` 不纯问题），与显式 `Host` 行/IO 模型一起设计 | `Base.ST`（历史）；[effects.md](effects.md) §4；[qtt.md](qtt.md) §8 | 后续 |
| D64 | 可变数组/可变字符串缓冲：`Base.MArray` / `Base.Buffer` 与内建类型构造子、8 个原语一并删除；需要时按新架构重建（先定表示与 `Eff []` 纯度模型） | `packages/base/lib/Base/{MArray,Buffer}.vuna`（历史）；[primitives.md](primitives.md) §6 | 后续 |
| D24 | Nat 字面量编译期展开为 `Zero`/`Succ` 链（Core / iface 载荷随字面量大小线性增长）；codegen 侧无固定步数预算（`Lowering` 按项规模派生预算，`Codegen.Term` 无预算），剩余问题只有字面量本身的展开成本 | `Elab/Term/Impl.natLitTerm`；[primitives.md](primitives.md) §3.1 | 后续 |
| D27 | 精化期未解 meta 按「可表示」处理会漏插 cast（终解后才知道类型不可表示）；handler 续延域的 `resIdx i o` 走不透明值 + 恒等 cast | `Elab/Meta.vuna` 的未解 meta 判据；[effects.md](effects.md) §5 | 后续 |
| D62 | manifest 门控已删除（显式接受的损失）：任意包可直调 `prim_*` / `prim_eff_*`；没有每包原语白名单、`unsafe` 定义级审计，网络原语对任何包可见 | `packages/compiler/lib/Vuna/Compiler/Base/Intrinsics.vuna`、`packages/base/lib/Base/Effect/*.vuna`；[effects.md](effects.md) §8.6 | 后续（表示层权限或新模型） |
| D66 | 宿主效应内建化（策略见 [effects.md](effects.md) §2.1）：行 IType（`IEffRow`/`IRowCons`/`IGlobal`）、隐藏 `Base.Effect.Core.runMain`、`rowAppend` 行拼接（编译器 `appendReduce`）与 `joinEff` 泛化、`builtinEffects` 表、通用 entry 自动预装（`Lowering` 按 main 行收集 handler 名进 `IrEntry`，后端嵌套 `runXHost`）；带行 handler + `_host` 原语：Console/Fs/Clock/Env/Process/Exit/Stdin/Args；新建 `Base.Effect.Ref`/`Base.Effect.Net`（Net 另有 `net-error` 收口；Ref 只允许行、不需要 handler）；夹具 90–94。剩余：Sched（`forkTask` 携带子计算、不是一阶 op，需要单独的带行类型面设计；`EffSched` 仍 `Eff []`）、旧 `handleXHost`/`runX` 迁移到带行 + 工具链自身 IO（`Cli.consoleLine`/`CompilerCli`）、`prim_eff_*` 全部改 `@vuna@` 隐藏、eff-boundary 守卫改写 | `packages/compiler/lib/Vuna/Compiler/{Base/Intrinsics,Core/Eval,Elab/Prelude,Elab/Driver,Lowering/Program,Codegen/Term}.vuna`、`packages/base/lib/Base/Effect/*.vuna`；[effects.md](effects.md) §2.1 | 后续 |
| D32 | 顶层签名的自由隐式变量 kind：按应用次数 + 类型构造子实参位置的参数 kind 推断（`Box f` 已可用）；**头可合一的重叠实例仍被拒**（设计如此，见 [records-traits.md](records-traits.md)） | `Elab/Sig.quantifyTopKinds`/`quantifyTopSigCtxCachedKinds`、`Elab/Trait.{instanceTeleMetas,classParamKindOf}` | 细节 |
| D37 | `runEff` 内部信任入口仍接受任意行；运行时 `unhandled effect` 兜底仍服务库内部路径 | `packages/base/lib/Base/Effect/Core.vuna`（`runEff`）；`packages/compiler/lib/Vuna/Compiler/Elab/Term/Impl.vuna`（`unhandledEffectLabel`）；[effects.md](effects.md) §8.4/§8.6 | 后续 |
| D41 | 无 Domain 并行、父 fiber handler 继承 | `Base.EffSched`；[effects.md](effects.md) §8.5 | 后续 |
| D42 | 无通用线性箭头类型 / multiplicity 多态；`bracket` 的 cleanup 只能访问外层 handler、自身异常被吞、调度器硬中止路径无 handler 栈；线性值可经非线性 data 字段被复制 | `Base.Effect.Core`（`Cont`/`bracket`/`finally`）、`Base/Intrinsics.vuna`（`prim_cleanupPush/Pop`）；[effects-layers.md](effects-layers.md) | wasm 侧已在机器帧上实现退出钩子：弹帧（`kDone`/`Return`）前跑该帧 base 之上的 cleanup，正常路径仍由 `bracket` 带内 pop；release 自身的效应/异常走当前 handler 链（不吞），与 native/OCaml 的「吞掉」不同口径。其余限制见左 | 后续 |
| D44 | 协作式取消只在挂起点生效；超时硬中止丢弃续延、未执行的清理不跑；超时是逻辑步数（无真实时钟）；任务体只能 `Eff Nil a`、无法继承父 handler 栈；Mutex/Semaphore/Channel 是忙等实现 | `Base.EffSched`；`packages/target-ocaml/lib/Vuna/Target/Ocaml/Term.vuna`（`dtSchedRuntime`）；[effects.md](effects.md) §8.5 | 后续 |
| D54 | `handle`/`perform` 语法支持结果索引族（`<Op> : params… -> Type -> Type`），包括 scope 族：`ExnOp : Type -> Type` + `Scoped a` 字段，`handle` 块可直接写 `Try sub k -> k (handleScoped sub)`。**剩余限制**：显式参数不是类型的族（如 `Boom : Row -> Type -> Type`）仍报 `TC_HandleFamilyUnsupported`；完整高阶效应类型（对子计算的行/answer 做 rank-2 量化、multi-shot）不做，scope 子计算的行在 `scope` 构造点检查、之后擦除 | `packages/compiler/lib/Vuna/Compiler/Elab/Term/Impl.vuna`（`opFamilyArityOf`/`handleOpArity`/`handleCallExprWith`）、`packages/base/lib/Base/Effect/Core.vuna`（`Scoped`/`scope`/`handleScoped`/`EffSig`）、`packages/base/lib/Base/Effect/Exn.vuna`；夹具 `dt_err/100_eff_handle_family_unsupported`、`pure_cross/08_scoped_exn`、`pure_cross/09_handle_exn`；[native-effects.md](native-effects.md) §9 | 剩余仅非类型参数族（无当前用例）；完整高阶类型另行设计 |
| D57 | `handle` 语法与 base 的手写 wrapper（`get`/`put`/`ask`/`runConsole`…）**key 不配对**：语法降级的 key 是 op 族规范名，wrapper 手写 `"state"`/`"console"` 等；语法程序只能用 `perform` 写、wrapper 程序只能手写 handler | `packages/compiler/lib/Vuna/Compiler/Elab/Term/Impl.vuna`（`performCallExpr`/`handleCallExprWith`）、`packages/base/lib/Base/Effect/*.vuna`；[native-effects.md](native-effects.md) §9 第 5 条 | 后续（统一 key） |
| D60 | `perform`/`handle` 语法本身仍没有显式实例名：多实例行上裸标签（条目 `Named ?n Op` 的名字 meta）必然 `TC_AmbiguousInstance`；**wrapper 调用**支持 `f@name`（`Member n e r =>` 签名糖展开成 `Member (Named n e) r` + 隐式 String 名），但语法内联的 `perform`/`handle` 仍只能用行解/默认名，指定实例需用 wrapper 或 `sendCore`/`handleCore` | `packages/compiler/lib/Vuna/Compiler/Elab/Term/Impl.vuna`（`performCallExpr`/`handleCall`）、`packages/base/lib/Base/Effect/*.vuna`；夹具 `dt_base/82`、`dt_err/108`、`dt_err/109`；[native-effects.md](native-effects.md) §9/§10 | 后续（若语法内联也需要，加 `perform @name`） |
| D61 | 高阶入口（如 `Bool -> Check PackageContext`）上使用 `pure (case ...)`/`fmap` 时，实例字典元变量可能被解成类型级名字（生成 `pure v_Int` 或 `CG_TypeLevelNameRuntime`） | 在工具链 CLI 的上下文选择处用显式 `case` 分支规避；未改 Elab/codegen | 后续若再遇，修字典解元或登记更精确限制 |
| D65 | 只有内置宏：没有用户自定义宏 / 模式宏 / 宏生成宏；宏名是全局内置名（不参与模块作用域，不能遮蔽），实参只做 AST 替换（无 hygiene 重命名、无 typed macro / reflection） | `packages/compiler/lib/Vuna/Compiler/Loader/Expand.vuna`（`expandMacro`）、`Frontend/Ast.vuna`（`macroSyntaxName`）；[language.md](language.md)「内置宏」 | 终局见 architecture-target D4（typed macro 之前的 AST→AST 阶段） |
| D115 | 宏展开只有调用点 span：展开出的节点共享 `name!` 的 span，没有 per-展开节点的 source map；LSP 不能 goto 宏定义 / 展开视图，fmt / lint / index 只按调用形式处理 | `Loader/Expand.vuna` 的 span 约定；`packages/toolchain/lib/Vuna/Fmt/Expr.vuna`（标记回渲染）、`packages/toolchain/lib/Vuna/Index/Scan.vuna`（标记过滤） | 后续（与 D4 / LSP 语义化一起做） |
| D104 | 有界计数器（升序 `i + 1` 配 `i >= n` 上界）没有判定规则：只有递减构成长度证据，升序一律报 `TC_CannotProveTermination`（诊断写明「ascending counters are not supported」）；同形态只能改写成显式递减 fuel 或显式上界 | `packages/compiler/lib/Vuna/Compiler/Elab/Termination/Measure.vuna`（`arithMinusBase` / `isAddOpName`）；`packages/compiler/test/corpus/term_err/08_up_counter.vuna`；[type-system.md](type-system.md)「定义与终止性」 | 后续（需要上界推理，不是局部规则） |
| D113 | 经函数参数 / 高阶值转发的调用仍看不到实参位置（`apply f x` 只落全弱边并报「SCT 未识别调用」）；`let g = f` 这类指向组内函数的直别名已在站点收集前解析替换 | `packages/compiler/lib/Vuna/Compiler/Elab/Termination/Scc.vuna`（`inlineAliases` / `siteBlind` / `blindEdges`）；`packages/compiler/test/corpus/term_err/14_blind_value.vuna` | 后续（需要把 HOF 实参与形参的调用关系纳入分析，且不能引入新站点形状） |

## 中间表示

| ID | 仍未成立的事实 | 证据 | 归属 |
| --- | --- | --- | --- |
| D109 | **擦除后 IR 的类型信息是选择性填充的**：λ binder、`IrLam` 结果、`IrDef` 签名、`IrCast` 两端、`IrCtor` 类型实参、`IrApp` 函数/结果、`IrCase` scrutinee/结果、分支 binder、record / projection / update 结果都有类型槽；binder 类型按「保留结构 + 不透明洞」的总口径写入（OCaml 注解另由 `irTyAnnotatable` 过滤，不固定多态性），顶层 λ 链优先按签名域回填，`IrLam` 结果取体节点类型，`IrApp` 依次尝试 Core 侧解析与已降低 callee 的节点类型（含 `let` 脱糖出的内联 lambda），全局定义 / trait 方法选择子的部分应用按擦除实参实例化，运行时原语签名取自 `lwGlobals`，但没有 IR 级类型检查器；仍保持 `Nothing` 的是体类型未知的 lambda、`prim_erase`（依赖换型 cast）与 binder 类型完全未记录的局部变量（非目标是不做第二套精化器） | `Ir/Model.vuna`（节点类型槽、`irResultTyOf`、`irTyAnnotatable`）、`Ir/Validate.vuna`（签名、注解、节点类型 arity、构造子值实参个数、`arity ≤ 签名箭头数`）、`Lowering/Env.vuna`（`lwGlobals`）、`Lowering/Ty.vuna`（`annotTyOf` / `annotTyOfTotal` / `annotGlobalTy` / `ctorKeptFieldTys`）、`Lowering/Program.vuna`（签名回填、分支 binder 回填、`IrLam` 结果与 app 类型兜底）、`Codegen/Term.vuna`（注解过滤）；[ir.md](ir.md)「已知边界」 | 后续（`prim_erase` 与完全未记录 binder 类型的情形；结构校验按需补充） |
| D111 | **ANF 不是幂等规范化**：二次 ANF 会给已经 `let` 绑定的非简单右值再插一层 `let`（`__anf<n>` 编号递增），结构因此变化；wasm 的 CPS 路径恰好依赖「二次 ANF 从更高编号开始」来避免撞名，所以幂等门禁不成立 | `Ir/Anf.vuna`（`anfProgramDefs` / `next` 计数）；复现：`vuna dev ir dump --after anf` 与 `--after anf2` 的首个定义不同 | 后续（若要幂等：已 ANF 的右值不再 hoist，或把二次 ANF 换成显式命名空间） |

## 工具、构建与验证

| ID | 仍未成立的事实 | 证据 | 归属 |
| --- | --- | --- | --- |
| C37 | 擦除位置残留未解 meta 仍靠跨包段重编号共享（**A 已修**：`shiftTerm` 覆盖全部 Term 构造子、fuel 用尽报可检测内部错误而非静默漏移；dep 段号按模块名排序后的名次分配、与 iface 列表顺序无关。**仍未做**：语义方案 B——在精化收尾冻结擦除位未解 meta，需用户拍板「依赖方不再能替别的模块解洞」） | `Driver/Cache`（`shiftTerm`/`shiftCachedProgram`）、`Driver/Dt`（`shiftedDepPrograms`）、`packages/compiler/test/steps/66_meta_shift.steps`；[cache.md](cache.md) | 后续（B 待决策） |
| C38 | LSP case split：不检查依赖模块导出面；构造子 / record 解析是 parse 级；洞在类型位置仍可能生成非法 `case`；索引族 case split 需要精化器暴露可达构造子（研究，非债务）。洞目标本身按 (uri, 文本内容) 缓存，且优先走增量装配（`Dt.dtGoalsSourceIncremental`）；整包从源码加载只作 case split 的最后回退 | `packages/toolchain/lib/Vuna/Lsp/Query.caseSplitActions`、`packages/toolchain/lib/Vuna/Lsp/Diagnostics.goalsForDoc`、`packages/toolchain/lib/Vuna/Lsp/Bindings`；`packages/cli/test/corpus/lsp/smoke.sh`；[lsp.md](lsp.md) | 后续 |
| C45 | LSP 缺局部绑定推断类型：λ / `as` / 记录 pun 等无语法标注的 binder 只能给文本推导位置/类型；同名 `?name` 不共享求解 | `packages/toolchain/lib/Vuna/Lsp/Bindings.vuna`、`Elab/Driver.goalsOfProgramTolerant`；[lsp.md](lsp.md) | 后续 |
| C46 | `vuna test` 的 main 通过判据只认 `Int`/`Nat`/`String`/`Bool` 与 `Eff [] a`（动作 main 只按退出码 0，不比较返回值） | `packages/toolchain/lib/Vuna/Test/Run.vuna`（`dtMainKind`）；[primitives.md](primitives.md) §5 | 后续 |
| C47 | 增量会话（`Dt.dtIncrementalCheckedCore`）只汇总 loader + `dtProgWarnings`，**不跑**全量尾部的 `warnUnusedDefsIn`：未使用定义 / 遮蔽类 warning 在会话路径上不可得。runner 因此让 fixture 负例一律走全量；若将来要求正例也断言 warning，得把 `warnUnusedDefsIn` 接进增量尾部 | `packages/compiler/lib/Vuna/Compiler/Driver/Dt.vuna`（`dtIncrementalCheckedCore` 与 `checkDeclsWithWarns` 的差异）；`packages/toolchain/lib/Vuna/Test/InProc.vuna`（`checkFileSessioned` 的注释）；[testing.md](testing.md)「进程内断言」 | 后续 |
| C48 | steps 里仍有 82 个文件 spawn `vuna` 子进程（进程绑定岛）：PTY / stdio 帧 / 产物执行 / 多进程 store / CLI 渲染文本这几类是构造性的，但没有逐个做到「只断状态的步骤」的极限压缩，ratchet 上限 `nix/checks/data/steps-inproc.max` 只降不增 | `test/suite/process-bound.txt`；`nix/checks/lib/steps-inproc.sh`；[testing.md](testing.md)「进程绑定岛」 | 后续（按需逐条迁移） |
| C50 | iface 对象与编译器 tag 绑定：换编译器二进制后旧 iface 失配，LSP 工具会话退化为全量检查，直到用**同一个**二进制跑一次 `vuna check <pkg>` / `vuna build`。LSP 不自动重建（只观测 `vuna.tool.iface.miss:<模块>`），失败也不记忆（每条新内容仍会尝试一次建会话） | `Compiler/Driver/Compile.depIfacesForToolSourceDetailed`、`Lsp.Diagnostics.buildSession`；`bench/lsp-probe.py`；[lsp.md](lsp.md) | 后续（候选：`check` 在 tag 失配时补写 iface；LSP 侧记住「会话不可用」） |
| D30 | docstring 覆盖未全仓化：`vuna doc --check` 受管辖包仍是 compiler+base，`packages/cli/lib/`、`packages/cli/app/` 未被收集；无 CI 门禁（ratchet 门禁已移除，只在本地按需跑）；多页 HTML 与零缺失不计划（内部符号为主、单文件可直接打开） | `packages/toolchain/lib/Vuna/Doc/*`；[api-docs.md](api-docs.md) | 后续（多页/零缺失不计划） |
| D33 | 运行时错误只有定义级位置：无表达式级 span、局部变量值、断点（无 DAP）；`ocamlopt` 单元内联会把抛错点归到调用者帧；非入口单元顶层初始化的异常不在捕获范围 | `Codegen/Term`（`dtDefLocTable` / `dtRuntimeWith`）；[debugging.md](debugging.md) §2 | 后续 |
| D67 | 隐藏旗标仍有两处原生读点：`--debug-perf` 在入口 `Vuna.Cli.withoutPerfFlag` / 插件 `Vuna.Cli.Registry.withoutPerfFlag` 与生成的 runtime 文本里各匹配一次（入口转发、插件摘掉、runtime 读原始 argv），仍无单一常量真源；`--release` 的 argv 解析在编译器包（`CompilerCli`）与 `VUNA_RELEASE` 读取处，工具命令的 `--release` 由 `Vuna.Cli.Spec` 声明 | `packages/cli/lib/Vuna/Cli.vuna`、`packages/compiler/lib/Vuna/Compiler/Driver/CompilerCli.vuna`、`packages/target-ocaml/lib/Vuna/Target/Ocaml/Term.vuna`；[cli.md](cli.md) §2 | 后续（不影响行为） |
| D68 | 编译器 trace 开关是**运行时原语**（`@vuna@debug@on` 读 argv/env），不是显式传参：深部探针在 `Elab`/`Conv`/`Codegen` 的纯函数里，传 trace 能力会把整条纯核心 effect 化 | `packages/compiler/lib/Vuna/Compiler/Base/Intrinsics.vuna`、`Codegen/Term.vuna`（`dtTraceRuntime`）、`Loader/Expand.vuna` | 终局若要求零 ambient 配置，只能删深部探针或引入显式 trace 效应（与 D4 一起评估） |
| D80 | 表达式级 / 分支级观测定位不存在：Core `Term` 里 `TVar` 与 binder（`TLam` / `CaseAlt` 的 `Binder`）带 span，其余节点（应用 / 构造子 / `if` / 记录原语）擦除时仍丢失位置，所以探针只能到「定义级 + 采样」；要表达式级归因须给 Core 全部节点补 span，并同步 `Core.Canonical` 与全部缓存 codec | `packages/compiler/lib/Vuna/Compiler/Core/Term.vuna`（`TVar` / `TLam` / `Binder` 带 span）、`Codegen/Term.lineDirectiveOf`（只按定义起始行写 `#line`）；[observability.md](observability.md) §5/§10 | 后续（与 D33 一起做） |
| D81 | 进程 RSS / 峰值内存不可测：OCaml 5.5 的 `Unix` 没有 `getrusage`，`Gc.quick_stat` 只给堆字数；`top_heap_words` 是**高水位且不回落**，因此 span 的 `args.heapWords` 是「至此的峰值」而不是该段增量（分配量用 `minor_words + major_words` 差，准确） | `packages/target-ocaml/lib/Vuna/Target/Ocaml/Term.vuna`（`dtObsRuntime` 的 `dtp_obs_span`）；[observability.md](observability.md) §6/§10 | 后续（RSS 只能 `/proc/self/statm` 轮询或外部 `time`） |
| D82 | 观测只覆盖主 domain：`ITIMER_PROF`/`SIGPROF` 是进程级单定时器，fiber 全在主 domain 上跑所以够用；多 domain 采样要每 domain 独立 timer + 合并（`Runtime_events` 的 GC/调度事件也没接） | `Codegen/Term.vuna`（`dtp_obs_cpu_tick`）；[observability.md](observability.md) §1 O9 | 后续（与 D41 一起） |
| D35 | REPL 的 resize 重绘靠空闲轮询（tty 关闭退化为空闲轮询，接受为限制）；Index 只覆盖 workspace 源码（外部依赖模块只能 `:load` 不能 `:browse`） | `packages/toolchain/lib/Vuna/Repl/Edit.vuna`、`packages/toolchain/lib/Vuna/Index/*`；[tooling.md](tooling.md) §4 | 后续 |
| D79 | 记录更新 `{ r | f = v }` 直接作函数实参时精化器报 `TC_ErasedBinderUsed a#fam`（内部构造子字段 binder 被当运行时使用）；只能先在 `let`/函数体里位构造绕开 | `packages/compiler/lib/Vuna/Compiler/Elab/Term/Impl.vuna`（record update 降级）、`Elab/Records` | 后续 |
| C49 | `vuna check` 仍会生成整套 codegen 文本再丢弃（`Driver.Dt.checkDtProgramOf` = lowering + `genUnitParts`），冷 `check packages/compiler` 的 codegen 段约 1.4 s 里相当一部分是纯文本拼接 | `packages/compiler/lib/Vuna/Compiler/Driver/Dt.vuna`（`checkDtProgramOf` / `dtCheckScoped`）、`Codegen/Assembly.vuna`（`genUnitParts` 注释「check 路径并丢弃文本」） | 后续（拆「校验 pass / 文本生成 pass」，需先列清哪些诊断确实来自文本生成段） |
| D84 | `examples/multi` 的包管理冒烟没有 CI 门禁：原 `checks.vuna-package` 在 239f525 被 `vuna-tests-e2e` 取代后未迁移，`nix/checks/vuna-package.sh` 仍在但未登记；现有 gate/e2e/tools tier 与 steps 都不覆盖 `examples/multi` 的 build/test | `nix/checks/default.nix`（无 `vuna-package`）、`nix/checks/vuna-package.sh`（未登记）、`packages/cli/test/steps/28_packages.steps` | 后续（重新登记 check，或把冒烟迁成 steps） |
| D86 | token/`Span` 已带 `[start,end)` 字节偏移，lint 的表达式文本与 token 定位走字节偏移；模式文本仍因 parser pattern span 偏移不完整而回落到行/列路径 | `packages/toolchain/lib/Vuna/Lint/Rules.vuna`（`patText` / pattern span 产生点）；lex/elab/diag codec 已 bump | 后续（只剩 pattern span 偏移补全） |
| D87 | 词法扫描器的 fuel 初值仍是 `4*len+64` 的**估算上界**（主循环每 token 扣 1、各扫描器每字符扣 1，但初值不是从剩余长度天生递减）；字符游标已改成「原串 + 偏移」（D87 的分配部分已落地，冷 `check packages/compiler` 的 `vuna.parse.lex` 194 ms → 174 ms） | `packages/compiler/lib/Vuna/Compiler/Frontend/Lexer.vuna`（`sourceFuel` 与各 `collect*` / `skip*` 的 fuel 形参）；[performance.md](performance.md) §4.1 | 后续（低优先；耗尽即 internal 错误，当前无已知触发路径） |
| D88 | 同一模块在一次 `check` 里被语法分析约 **4 次**（冷 `check packages/compiler`：`vuna.parse.syntax` 496 次 / 114 个模块；加载、fixity 表、header 各走一遍 `parseFileWithPath`），但解析合计只有 ~0.31 s（`syntax` 220 ms + `lex` 92 ms），约占冷检查的 1.5%，进程内 `SourceUnit` 复用的收益上限就是这个量级 | `vuna.parse.syntax` 计数（`VUNA_OBS=1` + `vuna dev obs summarize`）；`Loader/Flatten.parseFileWithPath`、`Driver/Compile.loadHeaderEff`；[performance.md](performance.md) §6.1 | 后续（低优先；只有解析占比变大时才做进程内复用） |
| D91 | 互递归组的调用出现在 `let` / `case` 位置时，实参个数推断曾在部分形状上误报 `TC_TooManyArgs`（不是函数），把调用移出 `let`/`case` 即消失。当前编译器上以下形状都只报 `TC_CannotProveTermination`（正确路径）：自递归 + `let … in case <组调用> of`、互递归 3 参 + `let … in case <组调用> of`、`case` 直接作 let 绑定值、`where` + 递归调用；4 参以上互递归 + 嵌套 `case` 内的 `let` 仍在 `case` 上先撞 `TC_IntStringCaseRestriction`。原始触发用例未保留 | `packages/compiler/test/corpus/term/12_let_case_call.vuna`（互递归 + `let … in case` 的通过路径）；`packages/compiler/lib/Vuna/Compiler/Elab/Term/Impl.vuna`（应用脊椎的 `inferArgsGo` arity 判定） | 后续（需要原始用例；若确认不可复现则关闭） |
| D92 | 模式矩阵降级在个别**嵌套模式 alt** 上会报无位置的假错 `TC_BranchTooFewArgs`（`:0:0`），同一文件把该 alt 改写成层层 `case`（不用嵌套模式）就能通过。复现形态：case 的一个 alt 里同时嵌套「构造子 + 列表模式」，例如对 `EApp (EVar "->" _) (dom :: cod :: rest)` 直接模式匹配；拆成 `EApp fn args` 再 `case fn of` / `case args of` 后正常 | 触发于 `Elab/Match` 的矩阵降级（`ctorAltList`/`clausesForCtor` 对嵌套构造子子模式个数的假设）；对照写法见 `Elab/Sig.kindDomains` | 后续（先收敛最小用例，再查 `ctorSubPatCount` 与 `bindCtorTele` 的分支 arity 口径） |
| D93 | `Elab` 的选择性重导出门面已删除：子模块即公开面（`Elab.Types` / `Elab.Meta` / `Elab.Driver` 等对所有消费方可见），没有「门面只重导出部分公开名」的那层封装 | `packages/compiler/lib/Vuna/Compiler/Elab/*.vuna`（无 `Elab.vuna` 门面）、`packages/compiler/vuna.toml` 的 `[export]` 列全部模块；[compiler.md](compiler.md)「模块地图」 | 后续（要收紧时靠命名约定 / 文档，或重新引入显式重导出层） |
| D112 | **workspace 热缓存二次 check 与冷启动不一致**：同一个 `VUNA_STORE` 下，`vuna check .` 第一次（冷）通过，第二次（复用第一次写下的缓存）在 `Vuna.Obs.Serve.duplexOf` 报 `TC_TypeMismatch: expected Row, got Type`（`(Int -> Eff r (Maybe String))` 的隐式 `r` 被当成 `Type`）。单包 `check packages/cli` 连跑两次不触发；清空 store 后再跑一次又通过，说明是跨包增量缓存/接口复用问题，不是源码错误 | 复现：`VUNA_STORE=/tmp/st vuna check .`（0）→ 同 store 再跑（1，`packages/toolchain/lib/Vuna/Obs/Serve.vuna` 第 242 行）；包级 clean 判定见 `Driver/Compile.vuna` | 后续（先查包级 clean 判定与模块顺序对象在跨包场景下的失效条件；CI 每次新 store 不受影响） |
| D116 | `fmt` 在 `export import M (T(..), ...)` 上会重复展开导出项：每跑一次列表翻倍（实测 `Vuna.Cli.Spec` 的导出面从 1842 字节涨到 3650，再跑继续翻倍） | `packages/toolchain/lib/Vuna/Fmt/Decl.vuna`（import 渲染）；复现：给模块加一条含 `T(..)` 的 `export import`，连跑两次 `vuna fmt` | 后续（当前改成显式 `import` 规避） |
| D117 | 「薄包 + 大闭包」在工作区 check 的摘要路径上会 `IC_FuelExhausted`（meta-shift 燃尽）。实测：把 dev 命令挪进独立包、入口只 `import Vuna.Cli.Dev` 后，`vuna check .` 与单包 `check packages/dev` 都复现；把该 import 挪回工具链即消失。同样形状曾在 `packages/cli` import `Vuna.Cli.Registry`（18 个效应行 lambda 的接线表）时出现 | 复现：新建只依赖工具链的薄包并只留一个入口 import，`vuna check <dir>`；`Elab` 的 meta-shift fuel 上限 | 后续（先收敛最小复现；摘要路径下效应行 lambda 的实例化求解是嫌疑点） |

| D116 | `fmt` 在 `export import M (T(..), ...)` 上会重复展开导出项：每跑一次列表翻倍（实测 `Vuna.Cli.Spec` 的导出面从 1842 字节涨到 3650，再跑继续翻倍） | `packages/toolchain/lib/Vuna/Fmt/Decl.vuna`（import 渲染）；复现：给模块加一条含 `T(..)` 的 `export import`，连跑两次 `vuna fmt` | 后续（当前改成显式 `import` 规避） |

## 效应统一（Eff 已贯通）

| ID | 仍未成立的事实 | 证据 | 归属 |
| --- | --- | --- | --- |
| D101 | **延迟 answer 的 handler 在机器上不工作**：`07_eff_main` 的 state handler 让 `opH` 返回「等待 state 的函数」，`resume` 发生在 handler 的 `MkHandle` 返回之后；库机器把续延槽 / frame 绑在 `MkPerform → opH` 的调用点上，`finish` 之后帧已失效（native `impossible branch`、wasm `illegal cast`；OCaml 正常，期望 84）。该夹具的 `matrix` 只跑 OCaml，effect-common 没覆盖到 | `Base/Effect/Core.vuna`（`step` 的 `MkPerform`/`MkResume`、`unwind`/`finish`）；`packages/compiler/test/corpus/effect/ocaml/07_eff_main.vuna`；复现：`--target native\|wasm` 后运行 | 后续（把 handler 帧寿命挂到答案上，或对延迟 answer 的 handler 走独立路径） |
| D114 | answer 类型是函数的库 handler（`handleState`：`s -> Pair a s`）在三端运行期不一致：native 报 `vuna: runtime error: impossible branch`、wasm 报 `illegal cast`，OCaml 后端正常。`dt_base/17_eff_state` 是 `matrix = pure`（只跑 OCaml），`effect` 家族的运行期用例没有覆盖这种高阶 `opH`，所以机器路径上没有夹具兜住。原因不在 `Ir.Cps` 的 pass 形状：把 `mCpsApply` 的 `parts` 拆成 head/args 形参后同一夹具行为不变，`--backend native` 全矩阵仍通过 | 最小复现：建一个只依赖 `vuna-base` 的包，`app/Main.vuna` 抄 `packages/compiler/test/corpus/dt_base/17_eff_state.vuna`，`vuna run <DIR> --target ocaml` 得 `8`，`--target native` 报 `vuna: runtime error: impossible branch`；`packages/base/lib/Base/Effect/State.vuna`（`handleState`） | 后续（lowering 对高阶 `opH` 的 clause 识别；补一条 `effect-common` 运行期夹具） |
| D90 | 宿主失败通道已完整：fs / process / net 都是 typed error 效应 + entry 收口（诊断 + exit 1），`runFsError`/`runProcessError`/`runNetError` 可局部收成 `Result`；无值统一走 `Maybe`；net 有单次超时变体（`NetStep`）与 `NetBadHandle`。**已知取舍**：(a) 收口文本只有操作上下文（`fs: writeFile /x: …`），没有源码位置帧——typed error 在 handler 里抛，用户 `Eff` 闭包经尾调用链执行，调用栈里没有用户 def 帧（崩溃路径仍有帧）；(b) net 仍是阻塞式单连接，无全局 deadline / 异步 / TLS（非目标）；(c) 事件循环在 accept/recv 上阻塞时无法同时服务其它连接 | `packages/base/lib/Base/Effect/{Fs,Process,Net}.vuna`；`packages/target-ocaml/lib/Vuna/Target/Ocaml/{Runtime,Term}.vuna` | 后续（源码帧需要 per-send 调用点元数据；并发/超时语义另立设计） |

| D94 | 类型定向重载值消歧只覆盖非应用位置（`x : T; x = name`）：`check` 位比较候选签名与期望类型；应用头（`name arg`）本身歧义时仍报 `TC_AmbiguousName`，没有做候选应用回溯（在 `Elab/Term/Impl` 的互递归组里回溯会触发终止性检查爆炸） | `packages/compiler/lib/Vuna/Compiler/Elab/Term/Impl.vuna`（`resolveOverValueTarget`）、`Loader/Resolve.vuna`（`pickValueOrOver`）；`packages/compiler/test/corpus/modules/103_type_directed_value`、`104_ambiguous_value` | 后续（需要独立的候选应用检查入口，避免加入现有互递归组） |


## native 后端

| ID | 仍未成立的事实 | 证据 | 归属 |
| --- | --- | --- | --- |
| D106 | `.s` 文件集还没有承担自举锚点：native 自举尚未成为阻塞门禁，`seed-selfhost` 仍只认 OCaml 种子，也没有发布资产 + 哈希 pin 的获取路径。目标形态与前提见 [bootstrap.md](bootstrap.md)「锚点演进」 | `nix/checks/seed-selfhost.sh`（只读 `seed/`）；`nix/run-tests.nix` 的 backend-check 非阻塞；`vuna build --no-compile --target native` 产物 | 后续（前置：native selfhost 通过 + 平台锁定决策） |
| D107 | OCaml 后端退役后没有替代的独立语义 oracle：固定点只剩同一 codegen 的自洽回归，跨后端差分由 suite + wasm 交叉承担；退役前需要把这些覆盖写成可执行门禁 | [architecture-target.md](../architecture-target.md) D7、[bootstrap.md](bootstrap.md)「锚点演进」；`test/suite.toml` 的 `pure_cross` 与 `effect_native` 家族 | 后续（与 D106 同批决策） |
| D108 | native 产物的体量仍以**保守 GC 需要的槽清零**为主：裁剪掉多余清除后，编译器自身约 189 万行汇编，其中 `mov qword ptr [rbp-N], 0` 仍占 ~13%；剩余清除都是在 GC 点前真的需要清的死槽。再往下压需要换根集模型（精确定位栈图 / 槽复用），不是 peephole。除此之外没有指令选择/窥孔优化（例如整数算术走 `rt_add` 调用而非内联），lambda 体占 ~47% | `packages/compiler/lib/Vuna/Compiler/Native/Module.vuna`（`clearDeadSlots` / `pruneClears` / `clearSlotsInstrs`）、`Native/Render.vuna`；[performance.md](performance.md)「产物规模」 | 后续（精确栈图是设计变更，先不做） |
| D110 | `machineRun` 是无条件可达根（`Native/Module.build` 的 `seeds` 恒含 `Base.Effect.Core.machineRun`），所以**纯程序**也带一份机器：`arith` 的 native 产物从 2 个 `.s` / 119 KB 变成 7 个 / 274 KB（多出 `Base/Effect/Core.s`）。wasm 侧没有这个代价（机器代码仍经 DCE） | `packages/compiler/lib/Vuna/Compiler/Native/Module.vuna`（`seeds`）；[benchmarks.md](benchmarks.md) §1.4「产物」 | 后续（只有程序里出现 handler / 效应时才把机器加入根集） |

## wasm 后端

| ID | 仍未成立的事实 | 证据 | 归属 |
| --- | --- | --- | --- |
| D96 | 能力矩阵是手写表，与三张运行时实现表的一致性靠人工同步；改 `rtImplOf` / `dtp_*` / `nativeRtTargetHost` 时必须同步改矩阵，没有自动校验 | `packages/compiler/lib/Vuna/Compiler/Base/Capabilities.vuna`；[wasm.md](wasm.md) §8 | 后续（硬拒绝落地时补一致性测试） |
| D97 | 入口行的不可用效应只能构建期告警 + 运行期 trap，不能构建期拒绝：`Base/Store.vuna` 的 `dirReady` 用 `processRunIn mkdir -p` bootstrap 存储根，所以 `packages/compiler/app/Main.vuna` 的行必须带 `ProcessOp`，按符号生成期拒绝会把编译器自己拒掉 | `packages/compiler/lib/Vuna/Compiler/Base/Store.vuna`（`dirReady`）、`packages/compiler/app/Main.vuna`；[wasm.md](wasm.md) §8 | 后续（前置：该调用改成 FsOp 逐级建目录，并清理签名链上的 `Member nProcess ProcessOp r`） |

## 编译器实现债（⚠️ 静默错误项）

完整分层清单见 [compiler-audit.md](compiler-audit.md)（按 ID 引用）。本文件只登记其中
后果是**静默错误**、需要单独跟踪的条目：

| ID | 仍未成立的事实 | 证据 | 归属 |
| --- | --- | --- | --- |
| A02 | 元变量作用域检查靠负索引放行：`Conv.termScopedTo` 的 `i < extra` 与 `Eval.varIndex` 的越界 `-1` 哨兵叠加，越界解一律通过；显式收紧会打断 base 自身（`String.lines` 报 `TC_NoInstanceFound`），需与表示一起改 | [compiler-audit.md](compiler-audit.md) EC-01/EC-02；`Core/Conv.vuna`、`Core/Eval.vuna` | 后续（需设计） |
| A05 | `Loader.Flatten.loadModule` 命中模块表即跳过可见性检查：依赖包未导出的模块、两个 root 的同名模块都按「先装入者」解析。**前置**：base 的 `[export]` 只列门面，而 compiler / cli 实际直接 import 26 / 24 个 base 内部模块（如 `Base.Data.String`、`Base.Container.HashMap`）；这条检查一落地就会全部报 `LD_ModuleNotExported`。所以它不是局部补丁：要么把 base 内部模块补进 `[export]`（推翻「跨包只有门面」的口径），要么把 compiler/cli 的 import 改成走门面 | [compiler-audit.md](compiler-audit.md) LD-01；`Loader/Flatten.vuna`、`packages/base/vuna.toml` | 后续（需先定跨包可见性政策） |
| A06 | split 的 cache key 编入 `mode=s/f`：摘要路径与全量路径产出不同字节，产物是「输入 + store 热度」的函数 | [compiler-audit.md](compiler-audit.md) DR-01；`Driver/Compile.vuna`（D112 疑源） | 后续（需设计） |
| A07 | 非 try 的 `prim_eff_*` FS 原语在 native 上映射到 `try_*`：失败变成 `""`/`0`/`False` + status，而 OCaml 抛错、wasm trap | [compiler-audit.md](compiler-audit.md) CG-02；`Native/Runtime.vuna` | 后续（与 typed error 通道一起定） |

## 相关阅读

- 规则与语义：各主题参考页（见 `AGENTS.md` 的「文档导航」）
