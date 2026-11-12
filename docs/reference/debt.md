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
| D24 | Nat 字面量编译期展开为 `Zero`/`Succ` 链（Core / iface 载荷随字面量大小线性增长）；`Codegen/Term.genTerm` 的 512 fuel 在 Vec 索引 ≥128 时可耗尽 | `Elab/Term/Impl.natLitTerm`；`Codegen/Term.genTerm`；[primitives.md](primitives.md) §3.1 | 后续 |
| D27 | 精化期未解 meta 按「可表示」处理会漏插 cast（终解后才知道类型不可表示） | `Elab/Meta.vuna` 的未解 meta 判据；[effects.md](effects.md) §5 | 后续 |
| D62 | manifest 门控已删除（显式接受的损失）：任意包可直调 `prim_*` / `prim_eff_*`；没有每包原语白名单、`unsafe` 定义级审计，网络原语对任何包可见 | `compiler/lib/Vuna/Compiler/Intrinsics.vuna`、`base/lib/Base/Eff*.vuna`；[effects.md](effects.md) §8.6 | 后续（表示层权限 N2/N3 或新模型） |
| D32 | 顶层签名的自由隐式变量 kind 只按应用次数推断（不从构造子 kind 反推）；头可合一的重叠实例被拒 | `Elab/Sig.quantifyTopKinds`、`Elab/Trait.{instanceTeleMetas,classParamKindOf}` | 后续 |
| D37 | `runEff` 内部信任入口仍接受任意行；运行时 `unhandled effect` 兜底仍服务库内部路径 | `base/lib/Base/Eff.vuna`（`runEff`）；`compiler/lib/Vuna/Compiler/Elab/Term/Impl.vuna`（`unhandledEffectLabel`）；[effects.md](effects.md) §8.4/§8.6 | 后续 |
| D41 | 无 Domain 并行、父 fiber handler 继承 | `Base.EffSched`；[effects.md](effects.md) §8.5 | 后续 |
| D42 | 无通用线性箭头类型 / multiplicity 多态；`bracket` 的 cleanup 只能访问外层 handler、自身异常被吞、调度器硬中止路径无 handler 栈；线性值可经非线性 data 字段被复制 | `Base.Eff`（`Cont`/`bracket`/`finally`）、`Intrinsics.vuna`（`prim_cleanupPush/Pop`）；[effects-layers.md](effects-layers.md) | 后续 |
| D44 | 协作式取消只在挂起点生效；超时硬中止丢弃续延、未执行的清理不跑；超时是逻辑步数（无真实时钟）；任务体只能 `Eff Nil a`、无法继承父 handler 栈；Mutex/Semaphore/Channel 是忙等实现 | `Base.EffSched`；`compiler/lib/Vuna/Compiler/Codegen/Term.vuna`（`dtSchedRuntime`）；[effects.md](effects.md) §8.5 | 后续 |
| D52 | 生成的字典/方法投影无类型标注：OCaml 侧会把 `f a` 与 `f (a -> b)` 错误统一（`Applicative.liftA2` 从 `ap` 派生即失败），只能逐实例手写；codegen 加类型标注后才能恢复派生 | `compiler/lib/Vuna/Compiler/Codegen/{Decl,Term}.vuna` | 后续 |
| D53 | 同一 `case` 里深度不同的两个 `Cons` 分支：深分支部分匹配失败回退到浅分支时，浅分支变量错误绑到深分支的部分绑定；`fmt` 把 `a :: b :: []` 改写成 `[a, b]` 后还会误报 `TC_RedundantCtorBranch` | 最小复现：`pickA : List (List Int) -> Nat; pickA sp = case sp of n :: e :: r :: _ => 0 \| e :: r :: _ => length e \| _ => 99`，对 `[[7], [8,9]]` 编译运行得 `2`（正确 `1`）；`vuna interp` 不复现，是 codegen 匹配器；规避见 `Core/Eval.rowRemReduceDispatch` 注释、[native-effects.md](native-effects.md) §9 | 后续 |
| D54 | `handle`/`perform` 语法支持一阶 op 族（参数化族 State/Reader 的 `k = 1` 也行，按 op 族 kind 的宇宙域与 res 族 arity 校验）；**作用域/高阶 op 族 Exn**（`ExnOp` 的第一个显式参数域是 `Row` 而非宇宙、res 族名 `exnRes` 也不合 `<res><族>` 约定）仍只能手写 handler（`TC_HandleFamilyUnsupported`）。真正的修复要等 N3 的效应表示收敛（op 携带 Row/子计算需要高阶效应类型） | `compiler/lib/Vuna/Compiler/Elab/Term/Impl.vuna`（`handleFamilyArityOf`/`handleOpArity`/`handleCallExprWith`）、`base/lib/Base/Eff.vuna`（`handleWith`/`handleWithAt`）；夹具 `dt_err/100_eff_handle_family_unsupported`；[native-effects.md](native-effects.md) §9 | 后续（N3） |
| D57 | `handle` 语法与 base 的手写 wrapper（`get`/`put`/`ask`/`runConsole`…）**key 不配对**：语法降级的 key 是 op 族规范名（ND8），wrapper 手写 `"state"`/`"console"` 等；过渡期语法程序只能用 `perform` 写、wrapper 程序只能手写 handler | `compiler/lib/Vuna/Compiler/Elab/Term/Impl.vuna`（`performCallExpr`/`handleCallExprWith`）、`base/lib/Base/Eff*.vuna`；[native-effects.md](native-effects.md) §9 第 5 条 | 后续（N2/N3 统一 key） |
| D60 | `perform`/`handle` 语法没有显式实例名：多实例行上裸标签必然 `TC_AmbiguousInstance`，指定实例只能用带 `(n : String)` 的 wrapper（`consolePrint n`/`handleConsole n`）或 `sendCore`/`handleCore` | `compiler/lib/Vuna/Compiler/Elab/Term/Impl.vuna`（`performCallExpr`/`handleCall`）、`base/lib/Base/Eff*.vuna`；夹具 `dt_base/82`、`dt_err/108`、`dt_err/109`；[native-effects.md](native-effects.md) §9 | 后续（若多实例语法成为刚需，再加 `perform @name`） |
| D61 | 高阶入口（如 `Bool -> Check PackageContext`）上使用 `pure (case ...)`/`fmap` 时，实例字典元变量可能被解成类型级名字（生成 `pure v_Int` 或 `CG_TypeLevelNameRuntime`） | M4 收尾时在工具链 CLI 的上下文选择处（原 `maybePrivilegedCtx`，已随特权上下文删除）用显式 `case` 分支规避；未改 Elab/codegen | 后续若再遇，修字典解元或登记更精确限制 |
| D65 | 只有内置宏：没有用户自定义宏 / 模式宏 / 宏生成宏；宏名是全局内置名（不参与模块作用域，不能遮蔽），实参只做 AST 替换（无 hygiene 重命名、无 typed macro / reflection） | `compiler/lib/Vuna/Compiler/Loader/Expand.vuna`（`expandMacro`）、`Frontend/Ast.vuna`（`macroSyntaxName`）；[language.md](language.md)「内置宏」 | 终局见 architecture-target D4（typed macro 之前的 AST→AST 阶段） |
| D66 | 宏展开只有调用点 span：展开出的节点共享 `name!` 的 span，没有 per-展开节点的 source map；LSP 不能 goto 宏定义 / 展开视图，fmt / lint / index 只按调用形式处理 | `Loader/Expand.vuna` 的 span 约定；`lib/Vuna/Fmt/Expr.vuna`（标记回渲染）、`lib/Vuna/Index/Scan.vuna`（标记过滤） | 后续（与 D4 / LSP 语义化一起做） |

## 工具、构建与验证

| ID | 仍未成立的事实 | 证据 | 归属 |
| --- | --- | --- | --- |
| C37 | 擦除位置残留未解 meta 仍靠跨包段重编号共享（**A 已修**：`shiftTerm` 覆盖全部 Term 构造子、fuel 用尽报可检测内部错误而非静默漏移；dep 段号按模块名排序后的名次分配、与 iface 列表顺序无关。**仍未做**：语义方案 B——在精化收尾冻结擦除位未解 meta，需用户拍板「依赖方不再能替别的模块解洞」） | `Driver/Cache`（`shiftTerm`/`shiftCachedProgram`）、`Driver/Dt`（`shiftedDepPrograms`）、`test/suite/steps/66_meta_shift.steps`；[cache.md](cache.md) | 后续（B 待决策） |
| C38 | LSP case split：不检查依赖模块导出面；构造子 / record 解析是 parse 级；每请求重跑容错精化（无进程内缓存）；洞在类型位置仍可能生成非法 `case`；索引族 case split 需要精化器暴露可达构造子（研究，非债务） | `lib/Vuna/Lsp/Query.caseSplitActions`、`lib/Vuna/Lsp/Bindings`；`test/corpus/lsp/smoke.sh`；[lsp.md](lsp.md) | 后续 |
| C45 | LSP 缺局部绑定推断类型：λ / `as` / 记录 pun 等无语法标注的 binder 只能给文本推导位置/类型；同名 `?name` 不共享求解 | `lib/Vuna/Lsp/Bindings.vuna`、`Elab/Driver.goalsOfProgramTolerant`；[lsp.md](lsp.md) | 后续 |
| C46 | `vuna test` 的 main 通过判据只认 `Int`/`Nat`/`String`/`Bool` 与 `Eff [] a`（动作 main 只按退出码 0，不比较返回值） | `lib/Vuna/Test/Run.vuna`（`dtMainKind`）；[primitives.md](primitives.md) §5 | 后续 |
| D29/D31 | 检索与类型名解析是 parse 级：不做实例 / 隐式参数 / 依赖相等 / 类型别名展开，无语义级检索；短名歧义回退源码短名，不按 import 闭包规范化 | `lib/Vuna/Search/Query`（`typeNameMap` / `canonName`）；[api-docs.md](api-docs.md) | 后续 |
| D30 | docstring 覆盖未全仓化：`vuna doc --check` 受管辖包仍是 compiler+base，root `lib/`、`app/` 未被收集；门禁是 ratchet 而非零缺失；多页 HTML 与零缺失不计划（内部符号为主、单文件可直接打开） | `lib/Vuna/Doc/*`、`nix/doc-coverage.sh`；[api-docs.md](api-docs.md) | 后续（多页/零缺失不计划） |
| D33 | 运行时错误只有定义级位置：无表达式级 span、局部变量值、断点（无 DAP）；`ocamlopt` 单元内联会把抛错点归到调用者帧；非入口单元顶层初始化的异常不在捕获范围 | `Codegen/Term`（`dtDefLocTable` / `dtRuntimeWith`）；[debugging.md](debugging.md) §2 | 后续 |
| D67 | 全局旗标字面量仍分散：`Vuna.Cli.stripPerfFlags` 匹配 `--debug-perf`，生成的 runtime 文本里匹配 `--debug-perf` / `VUNA_DEBUG_PERF`；`--release` 在 `Vuna.Cli`、`Vuna.Run`、`CompilerCli` 与 `VUNA_RELEASE` 读取处各有一份 | `lib/Vuna/Cli.vuna`、`lib/Vuna/Run.vuna`、`compiler/lib/Vuna/Compiler/Driver/CompilerCli.vuna`、`compiler/lib/Vuna/Compiler/Codegen/Term.vuna` | 后续（统一成旗标门面；不影响行为） |
| D68 | 编译器 trace 开关是**运行时原语**（`@vuna@debug@on` 读 argv/env），不是显式传参：深部探针在 `Elab`/`Conv`/`Codegen` 的纯函数里，传 trace 能力会把整条纯核心 effect 化 | `compiler/lib/Vuna/Compiler/Intrinsics.vuna`、`Codegen/Term.vuna`（`dtTraceRuntime`）、`Loader/Expand.vuna` | 终局若要求零 ambient 配置，只能删深部探针或引入显式 trace 效应（与 D4 一起评估） |
| D35 | REPL 的 resize 重绘靠空闲轮询（tty 关闭退化为空闲轮询，接受为限制）；Index 只覆盖 workspace 源码（外部依赖模块只能 `:load` 不能 `:browse`） | `lib/Vuna/Repl/Edit.vuna`、`lib/Vuna/Index/*`；[tooling.md](tooling.md) §4 | 后续 |

## 效应统一（Eff 已贯通）

| ID | 仍未成立的事实 | 证据 | 归属 |
| --- | --- | --- | --- |

## 相关阅读

- 规则与语义：各主题参考页（见 `AGENTS.md` 的「文档导航」）
