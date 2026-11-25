# 技术债务与未实现能力（debt）

本文件是仓库**唯一的债务清单**（原 `compiler-audit.md` 已并入）。只登记**当前仍未关闭**的
事实；关闭即删除（历史在 git）。每条给可复现证据（命令或 file:line）。语义规则与已落地
事实不放这里——见 [type-system.md](type-system.md)、[core.md](core.md)、[effects.md](effects.md)、
[ir.md](ir.md)、[compiler.md](compiler.md) 等主题页。

分类：**A** 补丁/绕过 · **B** 能力缺口降级 · **C** 近似（启发式/硬编码/只覆盖某形状）·
**D** 结构妥协（多真源、手工同步）。⚠️ 表示后果是**静默错误**而不是保守误拒。
标「有意」的条目是已定取舍，统一放在末节「已决取舍」，不算待办。

ID 是稳定引用（`层前缀-序号`）：条目关闭即删除该行，ID 不复用，新条目续号。

## 语言与精化器

| ID · 类 | 仍未成立的事实 | 证据 | 归属 |
| --- | --- | --- | --- |
| B07 · B | 高阶合一只有空 spine 与 Miller pattern 是完整的，其余走「头一致就提取」的近似，提取不到才报错 | `Core/Conv.vuna` 的 `solveMetaFuel` / `solveMetaHoLegacyFuel`；`TC_CannotSolveHigherOrder` | 后续 |
| B29 · B | `where` / `let` 局部签名不接受 `C a =>`（需 scope-aware 局部签名解析 + 局部泛化）；trait **方法签名**上的约束（方法级）未实现；trait 头的父类约束已支持；`axiom` / `extern` / 构造子 / record 字段上的约束不计划 | `Frontend/Parser.rejectCtxSuffix`；夹具 `99_explicit_where_rejected`、`99_explicit_trait_method_rejected` | 后续（trait 方法约束不计划） |
| B30 · B | 无有序持久容器（TreeMap/TreeSet）；哈希容器固定 1024 桶、无 remove | `packages/base/lib/Base/Container/{HashMap,HashSet}.vuna`；[stdlib.md](stdlib.md) 的容器边界 | 后续 |
| D21 · B | 完整 FFI 未做：无回调 / GC root / pin、无 C 头文件解析、无字符串双向可变共享 | [primitives.md](primitives.md) §10「受限 FFI」 | 后续 |
| D22 · B | 无依赖 multiplicity / 线性箭头 / 借用 / 一次性续延；线性值传给 ω 形参的通用函数被 `TC_LinearOverused` 拒绝（保守近似只误拒不误放） | `Elab/Usage.vuna`；[qtt.md](qtt.md) | 后续 |
| D24 · C | Nat 字面量编译期展开为 `Zero`/`Succ` 链（Core / iface 载荷随字面量大小线性增长）；codegen 侧无固定步数预算（`Lowering` 按项规模派生预算，`Target.Ocaml.Term` 无预算），剩余问题只有字面量本身的展开成本 | `Elab/Term/Impl.natLitTerm`；[primitives.md](primitives.md) §3.1 | 后续 |
| D27 · C | 精化期未解 meta 按「可表示」处理会漏插 cast（终解后才知道类型不可表示）；handler 续延域的 `resIdx i o` 走不透明值 + 恒等 cast | `Elab/Meta.vuna` 的未解 meta 判据；[effects.md](effects.md) §5 | 后续 |
| D32 · C | 顶层签名的自由隐式变量 kind：按应用次数 + 类型构造子实参位置的参数 kind 推断（`Box f` 已可用）；**头可合一的重叠实例仍被拒**（设计如此，见 [records-traits.md](records-traits.md)） | `Elab/Sig.quantifyTopKinds`/`quantifyTopSigCtxCachedKinds`、`Elab/Trait.{instanceTeleMetas,classParamKindOf}` | 细节 |
| D37 · B | `runEff` 内部信任入口仍接受任意行；运行时 `unhandled effect` 兜底仍服务库内部路径 | `packages/base/lib/Base/Effect/Core.vuna`（`runEff`）；`Elab/Term/Impl.vuna`（`unhandledEffectLabel`）；[effects.md](effects.md) §8.4/§8.6 | 后续 |
| D41 · B | 父 fiber handler 继承仍未解决；单线程 fiber 调度器没有库面（`prim_sched*` 完整、`Base.EffSched` 不存在）；多线程走独立的 `Base.Thread`（OS 线程 / Domain），不复用调度器 | `Base/Intrinsics.vuna`（`prim_sched*`）、`Base/Thread.vuna`；[effects.md](effects.md) §8.5 | 后续 |
| D135 · B | **native 线程的宿主态**：线程 / 同步原语与 STW GC 已实现（`clone` + futex；TCB 在 `%fs`；safepoint 停车 + 全线程栈根扫描 + 逐线程 cleanup 链；并行区正常回收）。宿主态按线程隔离：状态槽与 cleanup 链头在 TCB，路径 / stat / getdents / 命令行 / spawn arena / 8 MiB 读缓冲 / timespec / termios / affinity / 子进程 envp 在每线程 mmap scratch（仅当可达代码用得到宿主叶子；`join` 随栈 munmap）；阻塞的宿主 syscall（read / write / wait4 / nanosleep / getdents64）在有子线程时发布停车标记；worker 用 `runFsHost` 装真实 handler 后并行 fs 可用（夹具 `effect/common/105`）。剩余：子进程 pid 表仍是进程级（`child_push` / `child_drop` 用一把 futex 锁串行，`sigalrm` 遍历它）；线程表固定 1024 槽 | `packages/target-native/lib/Vuna/Target/Native/{Runtime,Gc,Abi}.vuna`（`thread_*` / `safepoint` / `block_*` / `scratch*Off` / `gc_collect` 的线程表扫描）；`packages/compiler/test/steps/105d_native_gc.steps`（9ab）、`corpus/effect/native/95_eff_thread_bracket`、`corpus/effect/common/105`；[primitives.md](primitives.md) §6.2、[native.md](native.md) §8 | 后续（线程表扩容；pid 表按线程或全局锁面收口） |
| D136 · C | **并行工具层只有纯函数组合子**：`Base.Thread.Par` 提供 `parMap` / `parMapWith` / `parFoldMap`；`Chan`（有界 MPMC 队列）、线程池 / 动态任务队列、timed condvar wait、取消 token 未实现。触发条件：多连接服务器、输入不能全进内存的流水线、实测静态分块长尾明显、需要中断发散 worker。wasm 只有调度子集（spawn / join / yield / id / parallelism）的顺序退化，同步原语仍拒绝 | `packages/base/lib/Base/Thread/Par.vuna`；[primitives.md](primitives.md) §6.2、[wasm.md](wasm.md) §8 | 后续（按触发条件） |
| D42 · B | 无通用线性箭头类型 / multiplicity 多态；`bracket` 的 cleanup 只能访问外层 handler、自身异常被吞、调度器硬中止路径无 handler 栈；线性值可经非线性 data 字段被复制 | `Base.Effect.Core`（`Cont`/`bracket`/`finally`）、`Base/Intrinsics.vuna`（`prim_cleanupPush/Pop`）；[effects-layers.md](effects-layers.md) | 后续 |
| D54 · B | `handle`/`perform` 语法支持结果索引族，包括 scope 族；**剩余限制**：显式参数不是类型的族（如 `Boom : Row -> Type -> Type`）仍报 `TC_HandleFamilyUnsupported`；完整高阶效应类型（对子计算的行/answer 做 rank-2 量化、multi-shot）不做 | `Elab/Term/Impl.vuna`（`opFamilyArityOf`/`handleOpArity`）、`Base/Effect/Core.vuna`（`Scoped`/`scope`/`handleScoped`/`EffSig`）；夹具 `dt_err/100_eff_handle_family_unsupported`、`pure_cross/08_scoped_exn`；[native-effects.md](native-effects.md) §9 | 剩余仅非类型参数族（无当前用例） |
| D57 · B | `handle` 语法与 base 的手写 wrapper（`get`/`put`/`ask`/`runConsole`…）**key 不配对**：语法降级的 key 是 op 族规范名，wrapper 手写 `"state"`/`"console"` 等；语法程序只能用 `perform` 写、wrapper 程序只能手写 handler | `Elab/Term/Impl.vuna`（`performCallExpr`/`handleCallExprWith`）、`Base/Effect/*.vuna`；[native-effects.md](native-effects.md) §9 | 后续（统一 key） |
| D60 · B | `perform`/`handle` 语法本身仍没有显式实例名：多实例行上裸标签必然 `TC_AmbiguousInstance`；wrapper 调用支持 `f@name`，语法内联的 `perform`/`handle` 仍只能用行解/默认名 | `Elab/Term/Impl.vuna`（`performCallExpr`/`handleCall`）；夹具 `dt_base/82`、`dt_err/108`、`dt_err/109` | 后续（若需要加 `perform @name`） |
| D61 · C | 高阶入口（如 `Bool -> Check PackageContext`）上使用 `pure (case ...)`/`fmap` 时，实例字典元变量可能被解成类型级名字（生成 `pure v_Int` 或 `CG_TypeLevelNameRuntime`） | 工具链 CLI 的上下文选择处用显式 `case` 分支规避；未改 Elab/codegen | 后续若再遇，修字典解元 |
| D62 · B | manifest 门控已删除（显式接受的损失）：`prim_*`（纯原语）任意包可直调；宿主效应原语是隐藏名、源码写不出，且类型固定为 `Eff [HostOp]`（`Base.Effect.Host`）。剩余缺口只剩一条：`@vuna@` 名字在词法层可写，所以「`Eff []` 是纯」的保证前提是不手写内部名；`checks.eff-boundary` 已把 `runPure` 与「base 之外的 `runHost`/`hostSync`/宿主原语」都压到基线 0 | `Base/Intrinsics.vuna`、`Base/Effect/*.vuna`、`nix/checks/lib/eff-boundary.sh`；[effects.md](effects.md) §8.6 | 后续（表示层权限或新模型） |
| D63 · B | 值句柄可变容器：`Base.Container.MutRef` / `MutArray` / `MutVec` / `MutDynArray` / `MutBuffer` 提供可逃逸的一等句柄（`with*` / 读写 / 追加，三端原语），分配与读写要求 `MutOp` 标记；剩余缺口：句柄逃逸是 GC 所有权，没有类型级生命周期/别名约束（严格禁止逃逸需要线性句柄）、`Base.Effect.Core` 的库级 handler（2 参 opH）在 wasm/native 的机器路径上不可用（只能走 `handle` 语法或 entry 静态直连） | `packages/base/lib/Base/Container/Mut*.vuna`、`Base/Effect/Mut.vuna`、`Elab/Dict.vuna`（重复标记取头部）；[effects.md](effects.md) §8.8；夹具 `effect/common/61..101`、`dt_err/136` | 后续（线性句柄 / 跨后端 handler 约定） |
| D65 · B | 只有内置宏：没有用户自定义宏 / 模式宏 / 宏生成宏；宏名是全局内置名（不参与模块作用域，不能遮蔽），实参只做 AST 替换（无 hygiene 重命名、无 typed macro / reflection） | `Loader/Expand.vuna`（`expandMacro`）、`Frontend/Ast.vuna`（`macroSyntaxName`）；[language.md](language.md)「内置宏」 | 终局见 architecture-target D4 |
| D66 · B | 宿主效应内建化的剩余项：Sched（`forkTask` 携带子计算、不是一阶 op，`EffSched` 仍 `Eff []`）、旧 `handleXHost`/`runX` 迁移、工具链自身 IO（`Cli.consoleLine`/`CompilerCli`） | `Base/Intrinsics.vuna`、`Elab/Prelude.vuna`、`Elab/Driver.vuna`、`Lowering/Program.vuna`、`packages/target-ocaml/lib/Vuna/Target/Ocaml/Term.vuna`、`Base/Effect/*.vuna`；[effects.md](effects.md) §2.1 | 后续 |
| D104 · B | 有界计数器（升序 `i + 1` 配 `i >= n` 上界）没有判定规则：升序一律报 `TC_CannotProveTermination` | `Elab/Termination/Measure.vuna`（`arithMinusBase` / `isAddOpName`）；夹具 `term_err/08_up_counter.vuna` | 后续（需要上界推理） |
| D113 · C | 转发器已按定义性归约参与判据；剩余：回调实参不是纯形参（`k (g x)`）、转发器被部分应用后再调用、跨实例字典派发（需要类型信息） | `Elab/Termination/Measure.vuna`（`forwardersOf` / `expandForwarders`）；夹具 `term/20_forwarder.vuna`、`term_err/23_forwarder_equal.vuna` | 后续 |
| D115 · C | 宏展开只有调用点 span：展开出的节点共享 `name!` 的 span，没有 per-展开节点的 source map；LSP 不能 goto 宏定义 / 展开视图，fmt / lint / index 只按调用形式处理 | `Loader/Expand.vuna` 的 span 约定；`Vuna.Fmt.Expr`、`Vuna.Index.Scan` | 后续（与 D65 一起做） |
| D120 · C | 未选中的 `if` 分支在纯求值器里也被弱头求值：`TIf` 落成 `evalIf (eval c) (eval th) (eval el)`，`VIf` 只存 `Value`；`normalize` / codegen 只处理选中支 | `Core/Eval.vuna`（`TIf`、`evalIf`、`normalizeIfFuel`）；[language.md](language.md)「`&&`/`\|\|` 短路」 | 后续（把 `VIf` 两支改成 `Closure`） |

## 前端（Frontend）

| ID · 类 | 仍未成立的事实 | 证据 | 归属 |
| --- | --- | --- | --- |
| FE-07 · D | `Manifest.vuna` 的 schema 编码：注释 / `isDepSourceKey` / `checkOneEntry` / `applyDepEntry` / `buildManifest` 多处手工同步，没有表驱动 | `Frontend/Manifest.vuna` | 后续 |
| FE-09 · D | `Toml.vuna` 的 `flatten*` / `nodeValue`：`fuel` 是 SCT 的测度、从不检查；越界不可达靠调用方论证 | `Frontend/Toml.vuna` | 后续 |
| FE-12 · D | `Cst.vuna` 的 `scanStringEnd` / `scanDigitsEnd`：为还原原文二次扫描，规则与 lexer 手工一致 | `Frontend/Cst.vuna` | 后续 |
| FE-14 · A | `Parser.vuna` 的 `parseDoStmt`：任何模式错误都被吞掉、改按表达式重试 | `Frontend/Parser.vuna` | 后续 |
| FE-15 · C | `Parser/Support.vuna` 的 `stateFuel`：估算上界 + 手写「零 token 链 ≤16」证明，不在门禁里 | `Frontend/Parser/Support.vuna` | 后续 |
| FE-16 · D | `Rast.vuna` + `Rast/Bridge.vuna`：多份同构 AST + 手写双向搬运，漏改不报错 | `Frontend/{Ast,Rast,Rast/Bridge,Canonical/Ast}.vuna` | 后续 |
| FE-17 · C | `Canonical/Ast.vuna` 的 tag 编码：tag = 构造子声明顺序，中间插一个即整体位移且解码仍成功 | `Frontend/Canonical/Ast.vuna` | 后续 |
| FE-19 · D | `Packages/Source.vuna` 的 `skipSourceDir`：跳过名单在工具链另有 `Files.skipGenerated` / `Clean.skipCleanDir` / `Index.Scan` 三份，且不一致 | `Frontend/Packages/Source.vuna` | 后续 |
| FE-20 · C | `Pkg.vuna` 的 `DepGit` url/rev：store 查找只用 `hash`，url/rev 只进 `depSourceText`，不校验仓库出处 | `Frontend/Packages/Pkg.vuna` | 后续 |
| FE-21 · A | Parser 的错误恢复只到顶层声明粒度：声明内部首个错误直接冒泡；`parseSourceFile` 末尾 `isEof` 失败会把已收集的 `errs` 整批丢掉；`recoverDecl` 只按列跳，可能落在多行表达式中间造出假声明 | `Frontend/Parser.vuna`（`parseDecls` / `parseSourceFile` / `recoverDecl` / `skipToDeclLine`） | 后续 |
| FE-22 · A | `do` 里第二处「吞掉真错、按表达式重解」：`parseLetBindings` 失败后从原始状态把同一段 token 再解析成表达式，`let` 块内的缩进 / 签名错误被替换成无关诊断 | `Frontend/Parser.vuna`（`doLetOrExpr`） | 后续 |
| FE-23 · C | `case` 之后的缩进判定靠 5 个 token 的白名单（`)`/`]`/`,`/`else`/`in`/`then`）：case 结果上的后缀 / 深层 `where` 被误杀，新语法不改表就误判 | `Frontend/Parser/Support.vuna`（`terminatesExpression` / `badCaseIndent`） | 后续 |
| FE-24 · D | offside 布局没有 layout 栈：`canContinue` 只有「同行 or 列 > 调用方手里的 blockCol」，括号内部不重置；`blockCol = 0` 当「关掉布局」的哨兵；`sameLineState` 伪造 `Pos line 0 0 0` | `Frontend/Parser/Support.vuna`、`Frontend/Parser.vuna` | 后续 |
| FE-26 · C | token 宽度 / 原文仍有三个来源（lexer 的 `posEndOffset`、Cst 组装时的贪心重扫、`?`/`-`/`!` 的列相邻判定）。AST 与 CST 的 span 约定已统一为「覆盖到最后一个 token 之后」，但 `TTmpl` 的 `endP` 仍是结束引号起点，多行字面量的 span 比 CST 少一个字节；列的単位仍是 UTF-8 字节（LSP 需要 UTF-16 由消费方换算） | `Frontend/Lexer.vuna`、`Frontend/Cst.vuna`、`Frontend/Parser/Support.vuna`、`Vuna.Lsp.Semantic` | 后续 |
| FE-27 · C | `.` 一个语法被切在 lexer / parser / loader 三层：`a.b` 先合成单 token，parser 的字段后缀只处理独立点，loader 再拆；字段访问没有单一产生点，两条路径的 span / 诊断不同 | `Frontend/Lexer.vuna`（`collectIdent`）、`Frontend/Parser.vuna`（`parseFieldSuffix`）、`Loader/Resolve.vuna` | 后续 |
| FE-28 · D | `Rast` 是 `Ast` 的整份复制：约 250 行名字分类 / 访问器工具各两份，`ExportItem`/`Import`/`FixityDecl` 又直接 re-export `Ast`；同模块里共享类型与影子类型混用，改一份不会让另一份编译失败 | `Frontend/Rast.vuna`、`Frontend/Ast.vuna` | 后续 |
| FE-29 · D | `Canonical/Ast` 的 `Import` / `FixityDecl` 有两份编码器（为绕 import 环，靠一条断言保持逐字节一致）；`ExportItem` 的 tag 已违反本模块「tag = 构造子声明顺序」的规则 | `Frontend/Canonical/Ast.vuna`（`encImportLike` / `encFixityLike` / `encExportItem`） | 后续 |
| FE-30 · D | 依赖路径归一化两个口径：`Pkg.joinPath` 走 `normalizeDir`，`Manifest.resolveManifestPath` 只拼字符串；`./`、`a/../b`、尾 `/` 会产生两个字符串，而 store / 缓存键 / 循环检测都按字符串比较 | `Frontend/Manifest.vuna`、`Frontend/Packages/Pkg.vuna` | 后续 |
| FE-31 · A | `exportMarkerFollows` 的 `TIdent` 分支两种结果都是 `True`（死分支）：手写 token lookahead 没有测试覆盖 | `Frontend/Parser.vuna` | 后续 |

## Loader

| ID · 类 | 仍未成立的事实 | 证据 | 归属 |
| --- | --- | --- | --- |
| LD-10 · C | `Resolve.vuna` 的解析特判：`Nil/Cons/::` 特判、`>>=`→`bind` 双名回落、`Type` 头不解析实参、隐式 binder 只认 String 域 | `Loader/Resolve.vuna` | 后续 |
| LD-11 · B | `Resolve.vuna` 的内部名旁路：`@vuna@…` 按 `classify` 认出的形态 + `isParserSurface` 白名单放行（重载候选 / 宏 / do 标记只在编译器包内可见），编译器包整包放行 | `Loader/Resolve.vuna` | 后续 |
| LD-12 · C | `Fixity.vuna` 的 `reorderDecl`：实例体里非 `DSig`/`DFun` 声明原样放行 → 延后成 internal error | `Loader/Fixity.vuna` | 后续 |
| LD-15 · C | `Addr.vuna` 的模块摘要：无条件并入 Prelude 摘要（过近似） | `Loader/Addr.vuna` | 后续 |
| LD-16 · C | `Fingerprint.vuna`：无 build-id 时身份退化为「路径+大小+mtime」 | `Loader/Fingerprint.vuna` | 后续 |
| LD-17 · B | `Expand.vuna` 的宏入口：只在表达式位置、只认裸 `EVar` 应用头 | `Loader/Expand.vuna` | 后续 |
| LD-19 · D | fixity 有两套可见性真源：重排吃 `dedupeFixitiesOf` 汇总的**全部已加载模块**声明，unused-import 判据只看**直接 import** 并宣称 import 是唯一手段；`Module.moduleFixitiesOf` 的注释与实现相反。工具链的 `FixityEnv` 又把**已加载 union** 跨文件推进，同一文件单独 lint 与在目录里 lint 可能看到不同的可见表（重复声明 / unknown fixity 随文件顺序变化） | `Loader/Fixity.vuna`、`Loader/Flatten.vuna`（`dedupeFixitiesOf` / `importProvidesUsedFixity`）、`Loader/Modules.vuna`、`Vuna/FixityEnv.vuna` | 后续 |
| LD-20 · D | 同一 AST 形状有四份手写遍历（Fixity / Expand / Resolve / Flatten）：Fixity 用 catch-all `icInternal`，新增节点只在这条链「编译期不报错」；Flatten 的 `declRefNames` 漏节点会静默影响 unused-import | `Loader/{Fixity,Expand,Resolve,Flatten}.vuna` | 后续 |
| LD-21 · D | Loader 的 prelude 名单与 `Elab.Sig` 不同：`Resolve.dtPreludeNames` 含内建类型构造子，`Sig.topPreludeNames` 不含；值位置的裸 `Array` / `@vuna@Cell` 在两层得到不同结论 | `Loader/Resolve.vuna`、`Elab/Sig.vuna`、`Base/Intrinsics.vuna` | 后续 |
| LD-22 · ⚠️C | `Layers.vuna` 的层闭包靠手算上界，`closureGo` 耗尽**返回部分闭包不报错** ⇒ 越层 import 可被静默放过；`LayerViolation` 的字段先塞空串再由 `ldErr4` 另带参数；`checkProjectLayers` 的计数被调用方丢弃 | `Loader/Layers.vuna`、`Loader/Flatten.vuna` | 后续 |
| LD-23 · ⚠️C | 缓存身份回落：`cacheTagEff` 无 `cache-tag` 时回落到源码闭包身份（同一源码由不同 seed 构建的二进制会共享缓存键）；`projectIdAddrOf` 只做词法绝对化（symlink / 未规范化路径得到两个 project id） | `Loader/Fingerprint.vuna`、`Loader/Addr.vuna`、`Frontend/Packages/Pkg.vuna` | 后续 |
| LD-24 · D | 导出表索引只迁移了一半：`modulesExporting*In` 用索引，其余限定名 / 命名空间路径仍 `exportsOf` 后线性扫；`namespacesOfWith` 每个模块重建整张 module 表（O(n²)），列表版与索引版两套实现需同步修 | `Loader/Modules.vuna`、`Loader/Resolve.vuna` | 后续 |
| LD-25 · C | unused-import 的删除编辑：`importStartsLine` 用 `spanStartCol == 8 或 18` 判断，缩进 / tab 下静默不给 quickfix；`importRemovalSpan` 的 `endOffset` 指向本行行首而非下一行行首，offset 与 line/col 不自洽 | `Loader/Flatten.vuna` | 后续 |
| LD-26 · D | 加载流程残留：`providers = []` 参与 re-export 拼接、`modules1 = modules` / `imports1` 原样透传（已删机制的脚手架）；`fixitiesForSourceIn` 的 `hdr` 两分支同构；`1048576` 在 6 个入口各写一份 | `Loader/Flatten.vuna` | 后续 |
| LD-27 · A | `Resolve.resolveGlobal` 的构造子回退分支是死代码（`modulesExportingValueIn` 已含 `kind="ctor"`）；`pickCtorOrOver` 空表回 `overCtorName … []`，`pickValueOrOver` 空表回裸短名，同一个「没找到」两种内部形态 | `Loader/Resolve.vuna`、`Loader/Modules.vuna` | 后续 |

## Elab：声明 / 终止性 / 覆盖率

| ID · 类 | 仍未成立的事实 | 证据 | 归属 |
| --- | --- | --- | --- |
| EL-22 · D | 终止性有三份几乎同构的手写遍历（`posWalk` / `strWalk` / `siteWalkC`），工作在「分析表达式」层（由 `Termination.ElabInput` 从精化产物翻译；实例身份已按字典分组，类型信息仍在翻译时丢弃），HOF 识别是 `Base.Data.List.{map,filter,concatMap,mapMaybe,foldl,foldr}` / `Result.traverse` / `Common.traverse` 的 canonical 模块名白名单；三处对 `EInterp` 的覆盖各不相同 | `Elab/Termination.vuna`、`Elab/Termination/{Measure,Scc}.vuna` | 后续 |
| EL-23 · C | 终止性判据的容量兜底把「放弃」渲染成「证明失败」：`tableGraphCap = 512`、`sctClosureFuel = 240`、正性不动点 1024、弱可达 100000 耗尽一律判失败；`blindSitesOf` 把「没分析到」落成全弱边，错误码与真正的非终止相同 | `Elab/Termination/Scc.vuna`、`Elab/Termination.vuna`、`Elab/Termination/Measure.vuna` | 后续 |
| EL-24 · ⚠️C | 覆盖率 / 可达性有五处口径：`Case.BranchVerdict`、`Coverage.clauseCover`、`Match.familyCovered`、`Coverage.familyCtors`、`Impl` 的 Bool/Nat/Int/String 专用路径；索引族与未知族一律按「已覆盖」静默放行 | `Elab/{Case,Coverage,Match}.vuna`、`Elab/Term/Impl.vuna` | 后续 |
| EL-26 · B | **没有严格正性检查**：`Elab.Data.elabCtor` 只校验构造子结果头是本族、索引个数与字段宇宙层级，构造子字段可以出现「本族在 Pi 定义域」这类非严格正的出现 ⇒ 能构造空类型的居民（`data Void` + `data D` / `MkD : (D -> Void) -> D` 被接受）。Idris 2 / Yaffle 都有 `Core.Termination.Positivity` 且在所有模式下检查 | `Elab/Data.vuna`（`elabCtor` / `checkCtorFieldSorts`）；探针与先例对照见 [prior-art-elaboration.md](prior-art-elaboration.md) §9 | 后续 |
| EL-25 · D | `Sig.vuna` 里四份手写 AST 遍历（`exprMaxAppArity` / `exprLowerVars` / `memberDomainOverridesOne` / `Trait.exprFreeLower`）覆盖的构造子集合各不相同且都不完整；`methodArgRigsOf` 的 `rigOf` 参数从未被调用，却对每个域白做一次 `eval` | `Elab/Sig.vuna`、`Elab/Trait.vuna` | 后续 |

## Elab：状态 / 项 / 元变量 / 字典 / trait

| ID · 类 | 仍未成立的事实 | 证据 | 归属 |
| --- | --- | --- | --- |
| EC-03 · C | `Core/Conv.vuna` 的 `metaCreatedDepth`：未登记时回退当前深度 | `Core/Conv.vuna` | 后续 |
| EC-09 · C | `Dict.vuna` 的 `matchInstances`：上一候选的解表污染下一候选（无候选快照） | `Elab/Dict.vuna` | 后续 |
| EC-11 · C | `Dict.vuna` 的刚性快路径：`rigidSearchFast` 按族 vs `allInstancesMono` 按全表，两份判据 | `Elab/Dict.vuna` | 后续 |
| EC-13 · D | `Impl.vuna` 的 `bindShapeOf`：do 块语义靠对 `bind` 签名项做硬编码 de Bruijn 索引匹配（`imD/imE/imM/imR` 与两套 `iaE/iaL/ibL/ibR`） | `Elab/Term/Impl.vuna` | 后续 |
| EC-14 · A | `Impl.vuna` 的 `perform`/`handle`：三候选试错（`handleWithAt` → `…Hole` → `handleWith`），顺序由「是不是裸变量」决定，最后一个失败时抛第一个错误 | `Elab/Term/Impl.vuna` | 后续 |
| EC-15 · A | `Impl.vuna` 的 `specializeInterpPrimApp`：`Interp` 实例语义硬编码进编译器（与 base 实例双真源） | `Elab/Term/Impl.vuna` | 后续 |
| EC-20 · D | `Meta.vuna` 的 `ctorRefTerm*`：Ec 版与全局版两份实现 | `Elab/Meta.vuna` | 后续 |
| EC-21 · A | `Trait.vuna` 的 `instArgAt`：实参取尽时伪造 `TGlobal "Int"`（不可达兜底） | `Elab/Trait.vuna` | 后续 |
| EC-28 · C | `Elab/Driver.vuna` 的 `resolveDictGoalsFix`：字典收敛固定 8 轮（三处调用点） | `Elab/Driver.vuna` | 后续 |
| EC-29 · D | `Elab/Driver.vuna` 的实例索引自检：只在 `VUNA_LOG=debug` 下跑 | `Elab/Driver.vuna` | 后续 |
| EC-30 · A | `Impl.vuna` 的 check 位 `if`：分支检查失败后整体重推断（位置 / 期望类型信息丢失，回退用原 `ec`） | `Elab/Term/Impl.vuna` | 后续 |
| EC-31 · ⚠️D | `Ec` 是 22 字段巨型状态：每个 setter 按位置重列全部字段（15 处），漏一处即静默串字段；解表有三份真源（`ecSols` 列表 / `ecSolTbl` 哈希 / `csSolsCount`），靠「新解必须前插」这条隐式不变量同步 | `Elab/Types.vuna`（`Ec`、`ecPut*`、`solsDelta`） | 后续 |
| EC-32 · D | `ConstraintStore` 一个记录兼任 5 种无关状态：待处理队列、id 分配、重试表、解表计数、**构造子索引是否完整**；`ecPutCtorTbl` 也会改它 | `Elab/Types.vuna`、`Elab/Meta.vuna` | 后续 |
| EC-34 · ⚠️C | 实例搜索把「递归深度」和「候选 / via 预算」压进同一个固定 `16`（`searchInstanceIn`），耗尽报 `TC_NoInstanceFound`：合法的深 ctx / via 链被报成「缺实例」 | `Elab/Dict.vuna`（`searchInstFuel` / `tryViaDict`） | 后续 |
| EC-35 · C | 行标签的**诊断展示**用 `showValueAt 6`（深度 6 截断）：匹配本身走 `conv`，但歧义 / 缺实例的候选列表可能显示相同文本，难以区分 | `Elab/Dict.vuna`（`labelCandText` / `labelScan`） | 后续（展示层） |
| EC-39 · ⚠️D | 「类型层 / 擦除」有五份判据且会互相矛盾：`Usage.isTypeForming`（只沿 cod）认为 `Int -> Type` 是类型层，`Meta.isTypeLayerValue`（每个域都须是类型层）认为不是；另有 `isTypeDomain` / `isKindWithCtx` / `isFamilyKindValue` / `rigIsErased` 重复实现 | `Elab/Usage.vuna`、`Elab/Meta.vuna`、`Elab/Term/Impl.vuna` | 后续 |
| EC-40 · C | `Elab/Types.vuna` 的 `refineValue` 不下钻 `VCase` 分支体、不处理 `VProj`（`_ => v`）⇒ 索引精化在卡住的 case / 投影里静默丢失 | `Elab/Types.vuna` | 后续 |

## Core / 中间表示 / 擦除

> `EC-03` / `EC-04` / `EC-06` 是历史上按 EC 编号的 `Core.Conv` 条目，编号保持不变；
> 新增 Core 条目用 `CO-`。

| ID · 类 | 仍未成立的事实 | 证据 | 归属 |
| --- | --- | --- | --- |
| EC-04 · C | `Core/Conv.vuna` 的 `VPi`/`VLam`：定义性相等不比 `rig`（`rig` 是运行时擦除格子，不比是有意取舍） | `Core/Conv.vuna`；[core.md](core.md) §3 | 有意（见末节） |
| EC-06 · C | `Core/Conv.vuna` 的 Nat 折算：长度超过 `natChainMaxValue` 的 Nat 链饱和成相等 | `Core/Conv.vuna`；[core.md](core.md) §3 | 有意（见末节） |
| CO-07 · C | 卡住 case 的相等仍可能耗尽 conv fuel：两边是不同递归函数在同一中性 scrutinee 上、分支体推进后又生成新的卡住应用时，`fastSameSols` 只能判等不能判不等，最终报 `IC_FuelExhausted`（保守失败，不是静默判等）；`f b`/`g b` 分支体静态不同（非递归）的负例已锁 | `Core/Conv.vuna`（`convOneAltFuel` / `fastSameSols`）；夹具 `dt_err/115_case_family_not_defeq` | 后续（按头与参数关系判停） |
| CO-08 · ⚠️C | interp 的浮点值以 `string_of_float` 的**12 位**规范文本为载荷：算术 / 比较先解析回宿主 `Float`，于是舍入后的值可能与后端（17 位 double）不同（如 `1.0 / 3.0 * 3.0`），只在「规范文本可表示」的精度内与产物一致；解析覆盖 `[-]digits[.digits][e±NN]`、`nan`、`inf`，超过 18 位有效数字的尾数按量级补偿后丢弃 | `Core/Eval.vuna`（`VFloat` / `showFloatRaw` / `floatOfRaw` / `floatMantissaGo`）；夹具 `float/11_negative_and_exponent` | 后续（加 `strToFloat` 原语，或浮点夹具改 run-only） |
| CO-03 · ⚠️D | `quote` 硬编码 `RigOmega`，值 → 项不可逆；`Dict` 只能另写一份按实例签名恢复 rig 的 quote。`rezonkDefs` / `substSolvedMetas*` 走裸 quote 时会把 `Rig0` 实参变回运行时实参；Lowering 的 `alignCtorArgs` / 分支 binder 形状又靠 rig 猜「全 telescope / 仅保留字段」两种约定 | `Core/Eval.vuna`（`quote` / `quoteArgValues`）、`Elab/Dict.vuna`（`dictTermOfValueAt`）、`Lowering/Program.vuna`（`alignCtorArgs`） | 后续 |
| CO-04 · ⚠️D | 三份元变量替换 walker 覆盖不一致：`substSolvedMetas` 覆盖 record 原语；`substSolvedMetasAtGo` 覆盖但 `TRecUpd` 深度不加 `tele`；`substSolvedMetasAtTblFuel` 对 `TMk/TRecord/TProj/TRecUpd` 直接 `_ => t`（残留 `TMeta` ⇒ iface 安全阀整份拒收 ⇒ 每次退回全量） | `Core/Eval.vuna`（三个 `substSolvedMetas*`） | 后续 |
| CO-05 · ⚠️C | 安全谓词有假阴性：`hasUnsolvedMetaCloFuel` 只看闭包 env 不看 body；`hasUnsolvedMetaValue` / `levelEscapes` 跳过 `VCase` 分支体与 `VProj` 的 tele | `Core/Term.vuna` | 后续 |
| CO-06 · ⚠️D | 表示 / 擦除判据有两份实现 + 两套上下文视图：`Elab.Meta.isOpaqueRuntimeTyIn` 用 `isTypeHeadOpaqueEc` + `nvarOpaqueCtx`，`Lowering.Env.ctorOpaqueFlagsOf` 用 `isTypeHeadOpaqueDatas` + `memOpaqueLevel`（已过滤 Bool/Nat）；`prim_erase` 在 Elab 插入、`IrCast` 在 Lowering 插入，靠注释对齐；`ctxEnv` / `ctxEnvRefined` 由每个调用点手选 | `Elab/Meta.vuna`、`Lowering/Env.vuna`、`Lowering/Program.vuna`、`Elab/Types.vuna`（`ctxEnv` / `ctxEnvRefined`） | 后续 |

## Driver / 缓存 / 编译入口

| ID · 类 | 仍未成立的事实 | 证据 | 归属 |
| --- | --- | --- | --- |
| DR-01 · ⚠️D | `Compile.vuna` 的 `splitModsOf` / `summarySplitParts`：`mode=s/f` 进 split key，产物是「输入 + store 热度」的函数（D112 疑源） | `Driver/Compile.vuna`（split 身份路径） | 后续（需设计） |
| DR-02 · D | `Dt.dtProjectDecls` vs codegen 的 `topoModules`：两套模块排序；起点键还是模块名哈希 | `Driver/Dt.vuna`、`Driver/SplitGen.vuna` | 后续 |
| DR-04 · A | `CompilerCli.vuna` 的 `stdoutIsTty`：走隐藏原语，绕过 `ConsoleOp` 行 | `Driver/CompilerCli.vuna` | 后续 |
| DR-05 · B | `CompilerCli.vuna` + `Capabilities.vuna`：native 目标没有 entry 能力检查 | `Driver/CompilerCli.vuna`、`Base/Capabilities.vuna` | 后续 |
| DR-11 · D | `app/Main.vuna` 的导出 import：人肉同步；漏一个 ⇒ `iface-skip partial` ⇒ 同一源码精化两遍 | `packages/compiler/app/Main.vuna` | 后续 |
| DR-12 · D | `Dt.vuna` / `Compile.vuna` 的体量：单模块横跨 6+ 阶段 | `Driver/{Dt,Compile}.vuna` | 后续 |
| DR-13 · D | `CompilerCli.vuna` 的 `build`：五条实现路径，缓存 / 告警 / 清理各不相同 | `Driver/CompilerCli.vuna` | 后续 |
| DR-14 · C | `Compile.vuna` 的哈希折叠：`acc*1000003+h`、63-bit 相加与 SHA 口径并存 | `Driver/Compile.vuna` | 后续 |
| DR-15 · C | `Compile.vuna` 的 `toolchainIdEff`：取不到就回落常量 `"none"` | `Driver/Compile.vuna` | 后续 |
| DR-16 · D | 模块接口必须携带 `miDecls`（已 Loader-resolved 的源码 AST）：record 语法降级仍工作在源码层，依赖方要这份上下文；接口无法瘦身，增量边界被语法耦合（终止性已改读精化产物，不再需要 `miDecls`） | `Driver/Iface.vuna`、`Driver/Cache.vuna`、`Elab/Records` | 后续 |
| A06 · ⚠️D | split 的 cache key 编入 `mode=s/f`：摘要路径与全量路径产出不同字节，产物是「输入 + store 热度」的函数 | 同 DR-01；`Driver/Compile.vuna` | 后续（需设计） |
| DR-17 · ⚠️D | 产物缓存 key 只含**编译器二进制**身份（`cache-tag`），不含后端插件（`vuna-target-native` / `vuna-target-wasm`）身份：只改后端插件时缓存命中，`vuna compile` 会静默复用旧后端生成的 `.s` / 二进制 | `Loader/Fingerprint.vuna`（`cacheTagEff` 读编译器可执行文件旁的 `cache-tag`）、`Driver/Compile.vuna`（`tag <- cacheTagEff`）；复现：只改 `packages/target-native` 后重建 `.#vuna`，再编译 `bench/programs/t1/scalar_cmp`，产物与换一个空 `VUNA_STORE` 的不同 | 后续（插件身份进 key） |

## 工具、构建与验证

| ID · 类 | 仍未成立的事实 | 证据 | 归属 |
| --- | --- | --- | --- |
| C37 · C | 擦除位置残留未解 meta 仍靠跨包段重编号共享（A 已修：`shiftTerm` 覆盖全部构造子、dep 段号按模块名排序分配。仍未做：语义方案 B——精化收尾冻结擦除位未解 meta） | `Driver/Cache`（`shiftTerm`/`shiftCachedProgram`）、`Driver/Dt`（`shiftedDepPrograms`）、`compiler/test/steps/66_meta_shift.steps`；[cache.md](cache.md) | 后续（B 待决策） |
| C38 · C | LSP case split：不检查依赖模块导出面；构造子 / record 解析是 parse 级；洞在类型位置仍可能生成非法 `case`；索引族 case split 需要精化器暴露可达构造子 | `Vuna.Lsp.Query.caseSplitActions`、`Vuna.Lsp.Diagnostics.goalsForDoc`、`Vuna.Lsp.Bindings`；[lsp.md](lsp.md) | 后续 |
| C45 · C | LSP 缺局部绑定推断类型：λ / `as` / 记录 pun 等无语法标注的 binder 只能给文本推导位置 / 类型；同名 `?name` 不共享求解 | `Vuna.Lsp.Bindings`、`Elab/Driver.goalsOfProgramTolerant`；[lsp.md](lsp.md) | 后续 |
| C46 · C | `vuna test` 的 main 通过判据只认 `Int`/`Nat`/`String`/`Bool` 与 `Eff [] a`（动作 main 只按退出码 0，不比较返回值） | `packages/dev/lib/Vuna/Test/Run.vuna`（`dtMainKind`）；[primitives.md](primitives.md) §5 | 后续 |
| C47 · C | 增量会话（`Dt.dtIncrementalCheckedCore`）只汇总 loader + `dtProgWarnings`，不跑全量尾部的 `warnUnusedDefsIn`：未使用定义 / 遮蔽类 warning 在会话路径上不可得 | `Elab/Driver`/`Driver/Dt.vuna`（`dtIncrementalCheckedCore` 与 `checkDeclsWithWarns`）、`packages/dev`（`checkFileSessioned`）；[testing.md](testing.md)「进程内断言」 | 后续 |
| C48 · C | steps 里仍有 82 个文件 spawn `vuna` 子进程（进程绑定岛）：PTY / stdio / 产物执行 / 多进程 store / CLI 渲染文本这几类是构造性的，但未逐个压到「只断状态」；ratchet 上限 `nix/checks/data/steps-inproc.max` 只降不增 | `test/suite/process-bound.txt`、`nix/checks/lib/steps-inproc.sh`；[testing.md](testing.md) | 后续（按需迁移） |
| C49 · C | `vuna check` 仍会生成整套 codegen 文本再丢弃（`checkDtProgramOf` = lowering + `genUnitParts`），冷 `check packages/compiler` 的 codegen 段约 1.4 s | `Driver/Dt.vuna`、`packages/target-ocaml/lib/Vuna/Target/Ocaml/Assembly.vuna`（`genUnitParts` 注释） | 后续（拆校验 pass / 文本 pass；`checkUnitParts` 已经不拼文本，剩余成本在 lowering 与装配校验自身） |
| C50 · C | iface 对象与编译器 tag 绑定：换编译器二进制后旧 iface 失配，LSP 工具会话退化为全量检查，直到用同一个二进制跑一次 `vuna check` / `build`；LSP 不自动重建、失败也不记忆 | `Driver/Compile.depIfacesForToolSourceDetailed`、`Lsp.Diagnostics.buildSession`；[lsp.md](lsp.md) | 后续 |
| D30 · C | docstring 覆盖未全仓化：`vuna doc --check` 受管辖包仍是 compiler+base；无 CI 门禁；多页 HTML 与零缺失不计划 | `Vuna.Doc.*`；[api-docs.md](api-docs.md) | 后续 |
| D33 · C | 运行时错误只有定义级位置：无表达式级 span、局部变量值、断点（无 DAP）；`ocamlopt` 内联会把抛错点归到调用者帧 | `Target.Ocaml.Term`（`dtDefLocTable` / `dtRuntimeWith`）；[debugging.md](debugging.md) §2 | 后续 |
| D35 · C | REPL 的 resize 重绘靠空闲轮询；Index 只覆盖 workspace 源码（外部依赖模块只能 `:load` 不能 `:browse`） | `Vuna.Repl.Edit`、`Vuna.Index.*`；[tooling.md](tooling.md) §4 | 后续 |
| D67 · C | `--release` 仍有两个解析来源：编译器包的 flag 解析与 `VUNA_RELEASE` 读取处 | `Driver/CompilerCli.vuna`；[cli.md](cli.md) §2 | 后续（不影响行为） |
| D68 · C | 编译器日志 / 观测开关是运行时原语（`@vuna@log@on` / `@vuna@obs@level` 读 env），不是显式传参：深部探针在 `Elab`/`Conv`/`Codegen` 的纯函数里 | `Base/Intrinsics.vuna`、`packages/target-ocaml/lib/Vuna/Target/Ocaml/Term.vuna`、`Loader/Expand.vuna` | 终局若要求零 ambient 配置，只能删探针或引入显式 trace 效应 |
| D79 · ⚠️A | 记录更新 `{ r \| f = v }` 直接作函数实参时精化器报 `TC_ErasedBinderUsed a#fam`（内部构造子字段 binder 被当运行时使用）；只能先在 `let` / 函数体里位构造绕开 | `Elab/Term/Impl.vuna`（record update 降级）、`Elab/Records.vuna` | 后续 |
| D80 · C | 表达式级 / 分支级观测定位不存在：Core `Term` 里只有 `TVar` 与 `Binder` 带 span，其余节点擦除时丢位置；探针只能到「定义级 + 采样」 | `Core/Term.vuna`、`Target.Ocaml.Term.lineDirectiveOf`；[observability.md](observability.md) §5/§10 | 后续（与 D33 一起做） |
| D81 · C | 进程 RSS / 峰值内存不可测：OCaml 5.5 的 `Unix` 没有 `getrusage`，`Gc.quick_stat` 只给分配字数；峰值只能 `/proc/self/statm` 轮询或外部 `time` | `Target/Ocaml/Term.vuna`（`dtp_obs_span`）；[observability.md](observability.md) §6/§10 | 后续 |
| D82 · C | 观测只覆盖主 domain：`ITIMER_PROF`/`SIGPROF` 是进程级单定时器；多 domain 采样要每 domain 独立 timer + 合并 | `packages/target-ocaml/lib/Vuna/Target/Ocaml/Term.vuna`（`dtp_obs_cpu_tick`）；[observability.md](observability.md) §1 O9 | 后续（与 D41 一起） |
| D84 · C | `examples/multi` 的包管理冒烟没有 CI 门禁：原 `checks.vuna-package` 未登记，现有 gate/e2e/tools tier 与 steps 都不覆盖它的 build/test | `nix/checks/default.nix`、`nix/checks/vuna-package.sh`、`cli/test/steps/28_packages.steps` | 后续 |
| D87 · C | 词法扫描器的 fuel 初值仍是 `4*len+64` 的估算上界；字符游标已改成「原串 + 偏移」 | `Frontend/Lexer.vuna`（`sourceFuel`、`collect*` / `skip*`）；[performance-hotspots.md](performance-hotspots.md) §2.1 | 后续（低优先） |
| D88 · C | 同一模块在一次 `check` 里仍被语法分析约 2 次：加载一次 + `ifaceModsEff` 的 header 解析一次 | `Loader/Flatten.parseFileWithPath`、`Driver/Compile.loadHeaderEff`；[performance.md](performance.md) §6.1 | 后续（低优先） |
| D137 · C | 包加载没有 memo：一次 `contextForFile` 的 `loadPackage` 沿依赖 DAG 重复 `loadManifestAt`（单文件 lint 实测 39 次 `vuna.toml` 打开，`packages/base/vuna.toml` 18 次）；同一个依赖被多个父包各读一遍 | `Frontend/Packages/Pkg.vuna`（`loadPackageWalk` / `loadDependencyList`）、`Vuna/FixityEnv.contextForFile`；[performance.md](performance.md) §6.1 | 后续（按目录 memo；需显式包图或线程化缓存） |
| D91 · C | 互递归组的调用出现在 `let` / `case` 位置时，实参个数推断曾在部分形状上误报 `TC_TooManyArgs`；当前编译器上已知形状都走正确路径，原始触发用例未保留 | `compiler/test/corpus/term/12_let_case_call.vuna`、`Elab/Term/Impl.vuna`（应用脊椎的 `inferArgsGo`） | 后续（需要原始用例） |
| D92 · C | 模式矩阵降级在个别嵌套模式 alt 上报无位置的假错 `TC_BranchTooFewArgs`（`:0:0`）；改写成层层 `case` 即通过 | `Elab/Match`（`ctorAltList` / `clausesForCtor`）、`Elab/Sig.kindDomains` | 后续 |
| D93 · C | `Elab` 的选择性重导出门面已删除：子模块即公开面，没有「门面只重导出部分公开名」的封装 | `Elab/*.vuna`、`packages/compiler/vuna.toml` 的 `[export]`；[compiler.md](compiler.md) | 后续 |
| D116 · ⚠️C | `fmt` 在 `export import M (T(..), ...)` 上会重复展开导出项：每跑一次列表翻倍 | `Vuna.Fmt.Decl`（import 渲染）；复现：给模块加一条含 `T(..)` 的 `export import`，连跑两次 | 后续 |
| D126 · ⚠️B | `kill` 插件的命令只停路由层：`vuna dev …` / `vuna web …` 由产品入口发现插件后经 `processRunIn` 起子进程（`vuna-dev` / `vuna-web`），信号不转发——杀掉 `vuna` 会把真正在跑的插件进程留成孤儿（仍在 accept / 仍占 socket） | `packages/cli/lib/Vuna/Cli.vuna`（`dispatch` 的 `processRunIn`）；`packages/cli/test/corpus/obs-cdp/smoke.sh`（`spawn_serve`）；复现：起 `vuna dev obs serve --cdp unix:$PWD/s /tmp/t.jsonl` 后 `kill $!`，`pgrep -f "vuna-dev dev obs serve"` 仍在 | 后续（插件命令用 exec 替换进程，或路由层转发 SIGTERM/SIGINT） |
| D119 · ⚠️C | 记录模式（`Ctx items env refs d`）的子模式个数与字段数不一致时报 `TC_CaseBranchTooFewArgs` 且**没有 span**；记录模式降级后由 `bindCtorGo` 在 `subpats = []` 处抛错，丢记录名与缺的字段 | `Elab/Case.vuna`（`bindCtorGo` 的 `subpats` 空分支）、`Elab/Match.vuna`（记录模式降级） | 后续 |

## 效应统一（Eff 已贯通）

| ID · 类 | 仍未成立的事实 | 证据 | 归属 |
| --- | --- | --- | --- |
| D90 · C | 宿主失败通道已完整（fs / process / net 是 typed error 效应 + entry 收口）；已知取舍：(a) 收口文本没有源码位置帧；(b) net 仍阻塞式单连接，无全局 deadline / 异步 / TLS；(c) 事件循环在 accept/recv 上阻塞时无法同时服务其它连接 | `Base/Effect/{Fs,Process,Net}.vuna`、`Target/Ocaml/{Runtime,Term}` | 后续 |
| D94 · B | 类型定向重载值消歧只覆盖非应用位置；应用头歧义仍报 `TC_AmbiguousName`，没有候选应用回溯 | `Elab/Term/Impl.vuna`（`resolveOverValueTarget`）、`Loader/Resolve.vuna`（`pickValueOrOver`）；夹具 `modules/103`、`104` | 后续 |
| D101 · ⚠️B | 延迟 answer 的 handler 在机器上不工作（native `impossible branch`、wasm `illegal cast`；OCaml 正常）。这里的 answer 是函数 / 延迟求值，**不是** `b = Eff` 的 answer row（后者由 `effect/common/18`、`98`、`102`–`104` 覆盖）；`effect` 家族没覆盖到 | `Base/Effect/Core.vuna`（`step` / `unwind` / `finish`）；夹具 `effect/ocaml/07_eff_main.vuna` | 后续 |
| D114 · ⚠️B | answer 类型是函数的库 handler（`handleState`）在三端运行期不一致；`dt_base/17_eff_state` 是 `matrix = pure`，机器路径没有夹具兜住 | `Base/Effect/State.vuna`（`handleState`）；[native-effects.md](native-effects.md) §9 | 后续 |

## native 后端

| ID · 类 | 仍未成立的事实 | 证据 | 归属 |
| --- | --- | --- | --- |
| D139 · B | **`Native.Live` 的 CFG 不建模跳转表**：`isTerminator` 不含 `IJmpMem`，分派块靠 fallthrough 连到表数据块、再连到第一个 arm；arm≥2 在 CFG 里不可达，`live_out` 低估。当前被两层条件掩住：`switchOf` 只对 `IrVar` + `bi_eq_int` 建表（分派块只读标量 scrutinee），而清零点只对 `isPtrCls` 的槽生效。一旦分派块读到指针槽（或 arm≥2 独占的活值出现在分派块），`clearDeadSlots` 会在最后一次读之后写 0，臂读到 0。修复方向：`IJmpMem` 视为块尾，后续边取全函数 `IQuadLabel` 目标（过度近似，只减少清零）；不要只标成"无后继"，那会丢 arm1 的活值 | `packages/target-native/lib/Vuna/Target/Native/Live.vuna`（`isTerminator` / `succIndices` / `emitClears`）、`Module.genSwitch` 的跳转表布局；`Live` 单测无跳转表形状 | 后续（补 CFG 边 + 跳转表用例） |
| D106 | `.s` 文件集还没有承担自举锚点：native 自举尚未成为阻塞门禁，`seed-selfhost` 仍只认 OCaml 种子，也没有发布资产 + 哈希 pin 的获取路径。目标形态与前提见 [bootstrap.md](bootstrap.md)「锚点演进」 | `nix/checks/seed-selfhost.sh`（只读 `seed/`）；`nix/run-tests.nix` 的 backend-check 非阻塞；`vuna build --no-compile --target native` 产物 | 后续（前置：native selfhost 通过 + 平台锁定决策） |
| D107 | OCaml 后端退役后没有替代的独立语义 oracle：固定点只剩同一 codegen 的自洽回归，跨后端差分由 suite + wasm 交叉承担；退役前需要把这些覆盖写成可执行门禁 | [architecture-target.md](../architecture-target.md) D7、[bootstrap.md](bootstrap.md)「锚点演进」；`test/suite.toml` 的 `pure_cross` 与 `effect_native` 家族 | 后续（与 D106 同批决策） |
| D125 · C | **CPS 合成的 binder 不带宽类型槽**：compiler self 的 4,824 / 45,835 个 binder 槽与 3,865 个 `IrTyOpaque` 槽没有确定 kind（~19%）。当前 GC 逐帧保守扫根，不依赖 kind；这些统计只影响 `vuna dev ir dump` 与移动/压缩的可行性评估 | `packages/ir/lib/Vuna/Ir/Cps.vuna`（合成 binder 用 `mkBinder`，没有 binder 类型槽；节点类型槽已统一落 `IrTyOpaque`）；`vuna dev ir dump --after repr-cps packages/compiler`；[performance.md](performance.md)「槽 kind 分布」 | 后续（移动/压缩前给 CPS 合成 binder 标注类型） |
| D133 · C | **死槽清零的产物成本**：`Native.Live` 在递归 / 带回边的函数里对指针槽在最后一次读之后写 0，让已死对象当轮可回收（D132 已关闭：`gc_low_live` 211 ms / 2.9 MiB、`gc_array_churn` 142 ms / 3.1 MiB）。代价是产物变大：`self` 文本 22.1 → 23.6 MB、二进制 5.31 → 5.85 MB、codegen 9.8 → 10.7 s；`hello` +4%，`minimal` / `defs-*` / `mods-*` 不变。压缩方向：**「死亡点之后没有 call 就省略」不可行**——GC 扫的是从 `rsp` 到最外层 `rbp` 的整段栈跨度，已经返回的帧内存仍在跨度内，省掉那些清零会让 `gc_array_churn` 的 RSS 从 3.0 MiB 涨回 300 MiB（实测）；可行的方向是按 slot kind 精确扫（把帧大小记进帧头、逐帧只扫本帧槽的实试在基准 RSS 上没有可测差异，只减少扫描量） | `packages/target-native/lib/Vuna/Target/Native/Live.vuna`；`nix run .#vuna-artifacts -- --target native --only self --check`；[native.md](native.md) §3、[performance.md](performance.md)「产物规模」 | 后续（`.s` 作为自举锚点前评估，见 D106） |
| D138 · B | **效果程序执行缺 wasm / 测试侧 target**：`vuna test` 的 effect 测试固定走 `compileToDir` + `ocamlopt`；REPL 动作表达式（`Vuna.EffectRun`）按内部变量 `VUNA_EFFECT_TARGET` 支持 `ocaml` / `native`（产品面没有 flag；native 每次私有目录构建、不发布视图）。接 `--target wasm` 或把 target 开给 `vuna test` 的前置：(a) 包内测试没有「允许哪些后端」的声明位置（suite 用 `matrix` 表达，`vuna test` 没有），把后端选择推给调用方等于把 suite 的分层责任倒灌；(b) `views/effectbin` / `views/testbin` 是**最终链接产物**视图，digest 只含入口源码 + 编译器 / 链接工具链身份，开视图缓存时必须再混入后端插件身份（`backendVersionEff`）与驱动层外部工具（`wasm-tools` / `wasm-opt`）身份，否则插件换代仍命中旧二进制；(c) `compileBackend` 的插件超时依赖 coreutils `timeout`（缺它时退回无超时），effect 测试要沿用同一降级口径。产品面只在 `build` / `run` 暴露 `--target`，repl / test 不加 flag | `packages/toolchain/lib/Vuna/EffectRun.vuna`（`effectTargetEff` / `effectSourceDigest`）、`packages/toolchain/lib/Vuna/TestRunner.vuna`（`testBinDigest`）、`packages/compiler/lib/Vuna/Compiler/Driver/Target.vuna`；[cache.md](cache.md)、[testing.md](testing.md) | 后续（先定包内测试的能力声明） |
| D129 · C | **native 的闭包面已收窄到动态 / 高阶参数与分配**：零参别名（`Nat.plus = natAdd` 等）在调用点直调；闭包只捕获 body 真正引用的自由变量，无捕获时静态化为 `.rodata` 里的 `vuna_static_*`（不进堆、不参与 GC）；let 绑定 / 跨捕获传递 / 部分应用能静态解析到顶层函数、运行时叶子或 lambda 时，饱和调用不再发 `rt_apply`。同一基线上自举 native 产物的 `call rt_apply` 静态点 604 → 484、文本 23.9 → 21.9 MB、编译器二进制 5.69 → 5.26 MB，`check packages/base` 冷 ≈2.2–2.5 s（OCaml 同命令 ~0.4 s）。**闭合**函数值实参（顶层函数 / 无捕获 lambda / 运行时叶子）已做高阶参数特化（`Native.Specialize`，[native.md](native.md) §3.5）：克隆被调并把该形参换直调，同机 A/B `micro_apply` 15.9 → 13.3 ms（-16%）、`closures` 21.4 → 19.5 ms（-9%）、`sorting` 34.6 → 33.2 ms（-4%），其余基准在噪声内；克隆体内联 comparator 让 `Main.s` 文本变大（`sort_lib` 4.7 → 8.4 KB），ELF 体积 +0.5%。小函数调用点已内联（`Native.Inline`，[native.md](native.md) §3.6）：同机 A/B `micro_apply` 13.3 → 5.1 ms（-62%）、`traits` 6.7 → 5.6 ms（-17%）、`treemap` -8%、`closures` -5%，`records` / `queue` / `nat_bits` 等因递归帧的洞清零 +1~4%，其余在噪声内。标量表达式延时 wrap、位运算不 wrap（§3.8）与循环携带标量槽提升（`Native.Regs`，§3.7）让 T1 几何平均 vs C 从 2.39x 降到 1.37x（`scalar_muladd` 56.9 → 24.0 ms、`scalar_divconst` 53.0 → 18.2 ms）。剩余：**捕获了环境**的高阶函数参数（带自由变量的 lambda）仍按闭包 arity 分派；部分应用每次仍分配 shim；`alloc` 仍是逐点 `call`（已去掉 12 条调用方寄存器快照，bump 快路径未内联，21.2k 个静态调用点）；范围信息只覆盖 `IrIf` 守卫（`n - 1` 不再 wrap、非负 `n / 2` 只发一条 `shr`，[native.md](native.md) §3.10），`IrNatCase` 的 0 / 后继事实与 `let` 传播未做；物化比较（Bool 0/1 选择）与浮点比较（`ucomisd` + `cmov` 选分支指针）已在 `Module` 收口；非 2 幂常量除法改 magic 乘法（`d = 3` / 负常量仍回退 `idiv`），`Nat.*` 零参别名在调用点展开且饱和乘法内联，循环旋转与寄存器合并后 T1 几何平均 1.20x C / 1.01x ml；剩余差距是位运算的 63-bit wrap 与少量搬运（`scalar_bit` 1.44x C） | `Module.genApplyHead` / `genApplyCall` / `knownCalleeOf`、`Native/Runtime.apply*` 与 `alloc`；[performance.md](performance.md)「产物规模」、[benchmarks.md](benchmarks.md) §1.1 | 后续（带捕获的高阶参数 / 部分应用特化 / alloc 快路径） |

## wasm 后端

| ID · 类 | 仍未成立的事实 | 证据 | 归属 |
| --- | --- | --- | --- |
| D96 · D | 能力矩阵是手写表，与三张运行时实现表的一致性靠人工同步；改 `rtImplOf` / `dtp_*` / `nativeRtTargetHost` 时必须同步改矩阵，没有自动校验 | `Base/Capabilities.vuna`；[wasm.md](wasm.md) §8 | 后续 |
| D97 · B | 入口行的不可用效应只能构建期告警 + 运行期 trap，不能构建期拒绝：`Base/Store.vuna` 的 `dirReady` 用 `processRunIn mkdir -p`，所以编译器入口行必须带 `ProcessOp` | `Base/Store.vuna`（`dirReady`）、`packages/compiler/app/Main.vuna`；[wasm.md](wasm.md) §8 | 后续（前置：改成 FsOp 建目录） |
| D130 · C | **`wasm-opt -O3` 之后剩余的体积与可跑面仍由后端 codegen 决定**：`.wasm` 字节与解码 / 加载路径现在由 binaryen 的输出主导（arith 47.1 → 0.55 KB、hashmap 48.3 → 3.7 KB），但后端自身的 codegen 仍朴素——Int/Nat 默认装箱（只有自递归且签名全 Int 的定义在 ABI 层换 `i64`，函数体内部仍装箱，见 [wasm.md](wasm.md) §2.1）、`case` 线性分派、闭包单参柯里化；8 个非尾深程序（`array` / `closures` / `list_recursion` / `sorting` / `text_scan` / `gc_pressure` / `gc_array_churn` / `gc_low_live`）在 V8 默认的 1 MB wasm 栈上仍 trap（Node 可用 `--stack-size` 放大，浏览器不可调，见 [wasm.md](wasm.md) §8）。优化器只修体积与内联，不修表示与栈深 | 体积与逐项增量见 [wasm.md](wasm.md) §1.1；数据表示 §2、codegen 形状 §8.4；栈边界 [wasm.md](wasm.md) §8；[benchmarks.md](benchmarks.md) §1.3 | 后续（表示层去装箱 / 栈深；量前先用 `--wasm-opt 0` 做对照） |

## 跨层根因

1. **名字即身份 / 名字即接口**：`RName` 是字符串、`Rast.Bridge` 用空作用域重分类、
   `bindShapeOf` 的索引模式匹配、`__anf`/`__cps` 编号借 fuel、`showTerm`/`showValueAt 6` 当相等判据
   （仅剩诊断展示 EC-35），以及把元数据编进名字（表面标记的载荷是 `Reserved` 构造子字段，
   只剩线上字符串编解码本身；`#…` 合成名已集中到 `Frontend.Reserved`，编号只用于定义内
   去重、不承担身份，也不再拿名字当列表容器）。
2. **fuel 仍是主要的终止性证书**：多数路径已改成「预算按输入规模派生 + 耗尽 `icFuel`」，
   残留「把固定容量上限当成语义结论」（EL-23、CO-07 的 conv 预算）、
   「只有 SCT 测度、从不检查的 fuel」（FE-09）、「派生预算不可达仅靠注释论证的静默兜底」
   （`Ir/Anf` / `Ir/Cps` 的半变换）、以及把容量上限当成语义结论（EL-23）。
3. **多真源手工同步**：prelude 名单（LD-21）、
   运算符别名（`Fixity` / `Dict` / `Prelude`）、能力矩阵（D96）、覆盖率五套口径（EL-24）、
   类型层 / 擦除五套判据（EC-39）、两套 layout（FE-24）、四份 AST 遍历（LD-20）、
   五份结构知识（FE-16 / FE-17 / FE-28 / FE-29）、三份解表真源（EC-31）、两份不透明判据（CO-06）。
4. **类型信息在 pass 之间丢失或只是注解**：`TLam` 的 `Maybe` 类型槽、`quote` 丢 rig（CO-03）、
   IR 类型槽选择性填充（D109）、CPS 机器级类型只有 `IrTyOpaque`（不再清空）。
5. **失败路径伪造值**：`EInt 0`（`Elab/Match.litPatExpr`）、部分闭包（LD-22）、
   `TC_NoInstanceFound` 掩盖预算耗尽（EC-34）。
6. **缓存口径分裂**：`mode=s/f` 进 key（DR-01 / A06）、两套模块排序（DR-02）、
   `acc*1000003+h` 与 SHA-256 两种哈希口径（DR-14）、cacheTag 回落（LD-23）、
   iface 必须携带源码 AST（DR-16）。

## 已决取舍（不是债务）

| ID | 取舍 | 位置 |
| --- | --- | --- |
| EC-04 | 定义性相等不比 `rig`（擦除格子不参与类型相等） | [core.md](core.md) §3 |
| EC-06 | 超过 `natChainMaxValue` 的 Nat 链饱和成相等（预算 `convFuelBase + 4*depth`、`convFuelMax` 封顶） | [core.md](core.md) §3 |
| 前端不支持清单 | guard / `\case` / 类型层 lambda / 用户宏等已决边界 | [frontend-syntax.md](frontend-syntax.md) §11 |
| 无 manifest 能力门控 | `prim_*`（纯原语）任意包可直调；宿主效应原语是隐藏名（保留为债务 D62 的已知损失） | [effects.md](effects.md) §8.6 |
| CPS 机器节点类型 | 机器级类型（`Control` / 续延 / `Step`）不进 `IrTy`，机器 pass 的节点类型槽统一 `IrTyOpaque`；空槽由 `Ir.Validate` 拒绝 | [ir.md](ir.md)「已知边界」 |

## 相关阅读

- 规则与语义：各主题参考页（见 `AGENTS.md` 的「文档导航」）
- 编译器模块地图：[compiler.md](compiler.md)
- Core / NbE / 精化器：[core.md](core.md) / [ir.md](ir.md)
- 性能读数：[performance.md](performance.md)；热点与已否决的优化：
  [performance-hotspots.md](performance-hotspots.md)
