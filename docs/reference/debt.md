# 技术债务与未实现能力（debt）

本文件只登记**当前仍未关闭**的债务、缺陷与能力缺口；关闭即删除（历史在 git）。每条给
**可复现证据**与**归属**（阶段 / 轨道编号见 [roadmap.md](../roadmap.md)）。

分工（避免与其他文档重复）：

- **方向 / 终态 / 阶段范围 / F1–F4 / 研究储备只在 roadmap**——本文件不复述方向，归属列只写
  轨道或阶段编号；
- **已落地的事实**在 roadmap 的「当前基线」与各主题参考页——本文件不写「已落地什么」；
- **规则与语义**在各主题参考页（[type-system.md](type-system.md)、[primitives.md](primitives.md)、
  [effects.md](effects.md)、[tooling.md](tooling.md) 等）——本文件只给证据与关闭条件，不复述规则文本。

维护规则：新增项必须能给出可复现证据（命令或 file:line）；同义项合并为一行；摘要只陈述
**仍未成立的那个事实**，不写「部分修复」。新增前先查 roadmap：若某方向已被 F1–F4 / 研究储备
逐条列明且没有 roadmap 之外的证据，不在此另立条目。

## 语言与精化器

| ID | 仍未成立的事实 | 证据 | 归属 |
| --- | --- | --- | --- |
| B07 | 高阶合一只覆盖空 spine 与 Miller pattern；其余仅剩 M13 遗留的「头一致就提取」近似，提取不到才报错 | `Core/Conv.vuna` 的 `solveMetaFuel` / `solveMetaHoLegacyFuel`；`TC_CannotSolveHigherOrder` | 研究储备 |
| B25 | `Int` / `String` 的类型身份仍由编译器内建表提供（`Base.Int` 存在但不声明类型；无 `primitive type` 声明） | `Intrinsics.typeIntrinsicNames`；`Elab/Prelude`；`Codegen` | 研究（是否上移） |
| B29 | 显式 trait 约束只支持顶层签名（`where` / `let`、`axiom`、trait 方法、构造子 / 记录字段都不接受 `C a =>`） | `Frontend/Parser.rejectCtxSuffix`；`test/corpus/traits/99_explicit_*_rejected` | F4 |
| B30 | 无泛型 `Hashable` / `deriving Hash`；无有序持久容器（`HashMap` / `HashSet` 只覆盖 `String`，`IntMap` 只覆盖 `Int`） | `base/lib/Base/{HashMap,HashSet,IntMap}.vuna`；[stdlib.md](stdlib.md) 的容器边界 | F4（容器） |
| D17 | `main` 的展示只覆盖 `Int` / `Nat` / `String` / `Bool`；任意类型展示需要运行时 `Show` 证据 | `Codegen/Term.mainShowForName`；[primitives.md](primitives.md)「Show 与 main 展示」 | F3 |
| D21 | 完整 FFI 未做：无回调 / GC root / pin、无 C 头文件解析、无字符串双向可变共享 | [primitives.md](primitives.md) §10「受限 FFI」 | M35 |
| D22 | 无依赖 multiplicity / multiplicity 多态 / 线性箭头 / 借用 / 一次性续延；`ST` 动作本身仍可复制（无线性箭头线程化动作内部值） | `Elab/Usage.vuna`；`base/lib/Base/ST.vuna`；[qtt.md](qtt.md) | 后续 / F3 |
| D23 | `+ - * /` 只有 Int/Nat 的类型定向特化，无通用 `Num` / `FromInteger`；用户自定义数值类型不能重载字面量与算术 | `Elab/Term/Impl.specializeArith*`；[operators.md](operators.md) | F4 / 后续 |
| D24 | Nat 字面量在编译期展开成 `Zero` / `Succ` 链（无惰性 `TNat`） | `Elab/Term/Impl.natLitTerm`；[primitives.md](primitives.md) §3.1 | 后续 |
| D25 | Int→Nat 迁移只覆盖 Base 公开度量与必要消费点；`compiler/` 内部 level/meta/fuel/span/arity 与工具链多数内部字节计数仍 Int，`Base.IO.print` / `writeFile` 返回值也仍 Int | [primitives.md](primitives.md) §3.1；`lib/` 中剩余的 `strLength` 计数 | 后续 |
| D27 | 表示轴落地后的残留边界：精化期未解 meta 按「可表示」处理会漏插 cast；trait 自动生成的 λ（方法投影 / 实例 tele）不在 cast 插入点范围内；数据版 free monad 的 `bind` 仍触发终止性检查；Type-1 行编码 codegen 仍损坏 | [effects.md](effects.md) §5「已知边界」 | F3 |
| D28 | 定义级信任点只对 **opt-in** 包生效：base 已声明 `[trust] unsafe`（全部直接使用点可审计），root 与 compiler 仍只有包级 `unsafe` 门控（二者在 main 外调用 `Base.IO.runIO` 的面很大，暂未枚举）；入口 / REPL / LSP 等**部分加载**场景只校验已加载模块里的信任项，指向未加载模块的假项要到整包 check 才报 | `Frontend/Manifest.manifestTrustUnsafe`、`Loader/Resolve.checkTrustPoints`、`base/vuna.toml`；夹具 `packages/12_trust_points`；[packages.md](packages.md) | 后续（F3 / QTT 收窄到全部包） |
| D32 | transformer 固定以 `IO` 为基座（`StateT s a` 而非 `StateT s m a`）：record 参数统一按 `Type` kind 降级；**顶层签名**里的自由隐式变量 kind 仍只按「被应用次数」推断（不从构造子 kind 反推）。实例 tele 已修（多参数 trait 收尾：裸实参取类参数 kind、嵌套实参从构造子 kind 反推），trait 类参数可显式写 kind（`trait Member (e : Type) (r : Row)`）；未写时仍按方法签名应用次数推断（只能 `Type` / `Type -> … -> Type`）。非 Type 类参数的实例搜索已支持（D38）；头可合一的重叠实例仍被拒（D39） | `Elab/Sig.quantifyTopKinds`、`Elab/Trait.{instanceTeleMetas,classParamKindOf}`；[effects.md](effects.md) §3.2 | M37 后续（F3 前置） |
| D37 | 运行时效应的剩余缺口：Layer 1 `Member` 行约束（W3）、L2 `local`/`catch`、W7 线性续延/`bracketExn`、W9 单线程调度器（`Base.EffSched`）、内建 `Monad (Eff r)` 均已落地；仍缺未处理效应的编译期诊断 | `base/lib/Base/Eff*.vuna`；[effects.md](effects.md) §8.4/§8.5 | F3 |
| D39 | coherence 拒绝头可合一的重叠实例；`Member e r` 的 Here/There 两个实例因此不能共存，trait 版 W3 不可行；需带优先级的重叠实例或换编码（见 effects.md §8） | `compiler/lib/Vuna/Compiler/Elab/InstCoherence.vuna`、`Trait.vuna`；`traits/93_row_member_class_kind` | 后续（W3 决策点） |
| D41 | L2/L3 的边界：W6 已支持 op 携带子计算 + scoped handler（`Base.EffExn`；`runEff` 为信任入口）；W7 已有线性 `Cont` 续延与 `bracketExn`；W9 已落地单线程协作式调度器 `Base.EffSched` 与 `Base.EffChannel`（`forkTask`/`awaitTask`/`yieldNow`/取消/结构化 `withScope`/逻辑步数超时），任务行仍必须是 `Eff Nil`。剩余：Domain 并行、父 fiber handler 继承；旧 `Base.EffAsync`（Domain）保留但不算 W9、与调度器互不集成 | `Base.EffExn`、`Base.Eff.Reader.local`、`Base.EffError`、`Base.EffAsync`、`Base.EffSched`；`Intrinsics.vuna`（`prim_asyncFork`/`prim_asyncAwait`/`prim_sched*`）；[effects.md](effects.md) §8.5 | 后续（Layer 3 扩展） |
| D42 | W7 的剩余边界：一次性闭包只有 `Base.Eff.Cont` 库级包装（`mkCont`/`resumeCont`），没有通用线性箭头类型 / multiplicity 多态 / 依赖 multiplicity；`bracket` 的 cleanup 在 handler 退出点执行，只能访问**外层** handler、自身异常被吞掉，调度器**硬中止**路径没有 handler 栈（只能做无效应清理）；线性值仍可经非线性 data 的字段被复制（无所有权检查） | `Base.Eff`（`Cont`/`mkCont`/`bracket`/`finally`）、`Intrinsics.vuna`（`prim_cleanupPush`/`prim_cleanupPop`）、`Codegen/Term.vuna`（`dtPrimRuntime`/`dtp_sched_step`）；fixtures `dt_base/42–44`、`dt_err/79–81`；[effects-layers.md](effects-layers.md) §8.5 | 后续（W7 剩余） |
| D43 | W10 IO 标签迁移的剩余：`IO`/`Base.IO`/`prim_*` 仍可被包直接使用，没有编译器强制「只能经标签」（能力只有包级 manifest 声明；类型级能力行归 F3）；原生 `prim_sleep` 已落地，`Base.EffClock` 与 `Base.IO.sleepMicros` 均已改用它（seed 已 rotation）；工具链只迁了 `vuna version` 一条 console 路径（编译器不迁移）。fs 多实例（`F1`/`F2`）与可控 `Exit`（`handleProcessIOWith`/`…Observed`）已落地，不再是缺口 | `base/lib/Base/{IO,EffClock,EffFs,EffProcess}.vuna`、`lib/Vuna/Cli.vuna`、`compiler/lib/Vuna/Compiler/Intrinsics.vuna`（`prim_sleep`）；fixtures `dt_base/40`/`41`、`dt_err/78`、`packages/10_prim_io`；[effects.md](effects.md) §8.6 | 后续（工具链/编译器级强制迁移） |
| D44 | W9 调度器边界：协作式取消只在挂起点生效；取消后有 64 步清理宽限，超时硬中止（丢弃续延，未执行的清理不跑）；`Task`/`Scope` legacy 可复制；新增 TaskLin 提供恰好一次 await/cancel，但仍无资源释放保证；Mutex/Semaphore/Channel 都是 cooperative 忙等实现；超时是逻辑步数（无真实时钟）；任务体只能 `Eff Nil a`（`forkTaskWith` 可显式 handler，但无法继承父 fiber 的动态 handler 栈）；`withScope` 的 body 非返回式中止时由 `dtp_sched_main` 在 main 结束统一兜底清理；`Base.EffAsync`（Domain）与调度器互不集成 | `Base.EffSched`；`compiler/lib/Vuna/Compiler/Codegen/Term.vuna`（`dtSchedRuntime`）；`Intrinsics.vuna`（`prim_sched*`）；[effects.md](effects.md) §8.5 | W10/W11 |
| D45 | 推断位置把线性值传给通用运算符/trait 方法（形参 multiplicity 默认 ω）被 `TC_LinearOverused` 拒绝——需要具体期望类型触发 `bi_add` 等特化才能通过；保守近似只误拒、不误放，但写法受限 | `Elab/Usage.vuna`（`TApp`/`uScale`）、`Elab/Term/Impl.specializeArith*`；探针 `k : (1 y : Int) -> String; k y = show y`（`import Base.Show`） | W7 后续 |

## 工具、构建与验证

| ID | 仍未成立的事实 | 证据 | 归属 |
| --- | --- | --- | --- |
| C32 | 缓存载荷仍是 OCaml Marshal（无显式自描述编码格式）；无 elab 级磁盘缓存（现有 iface / check / split / split-units / AST）；`VUNA_CACHE_MTIME` 默认关 | `Vuna.Compiler.CacheFormat`、`Driver/Iface`、`Driver/Compile`；[cache.md](cache.md) | 后续（序列化格式 / elab 磁盘缓存） |
| C37 | 接口摘要的两个残余：① 擦除位置残留未解 meta 仍靠包段 `(idx+1)<<30` 重编号；② LSP-only 冷启动写回的单模块 iface 哈希与整包 check 可能略有差异，靠首次整包重写自愈（③ REPL 每条表达式重读 manifest / iface 已由会话内工具接口缓存关闭，见 [cache.md](cache.md)） | `Driver/Cache`、`Driver/Dt`、`Loader/Flatten`；[cache.md](cache.md) | M34.6（后续） |
| C38 | codeAction 的剩余：case split 不覆盖索引族（parse 级拿不到索引约束，枚举会生成精化器拒绝的不可达分支 `TC_ImpossibleBranchIndex`）与不透明 `axiom`；构造子 / record 解析是 parse 级（依赖模块每次读盘，未保存改动不反映）；每次请求重跑容错精化（无进程内缓存）；record / data split 不检查依赖模块导出面（类型只导出 `T` 而非 `T(..)` 时生成的模式会被精化器拒绝）；洞在类型位置仍可能生成非法 `case`；`vuna.fixAllLint` command 依赖客户端 `workspace/applyEdit` 能力（rename 已由 `textDocument/rename` 提供） | `lib/Vuna/Lsp/Query.caseSplitActions`、`lib/Vuna/Lsp.handleExecuteCommand`；`test/corpus/lsp/smoke.sh` §21/§30–32；[lsp.md](lsp.md) | 后续（索引族需精化器暴露可达构造子；导出面检查） |
| C45 | LSP 绑定解析仍缺**局部绑定推断类型**：`Ctx` 不记录位置、精化器没有「位置 → 局部类型」入口，λ / `let` / `case` 等无语法标注的 binder 只能给语法可得来源（Pi binder 已取 domain 语法类型）；λ / `as` / 记录 pun 的位置靠文本推导；`let` / `where` 局部绑定的类型注解里的 Pi binder 仍不可达（走 `walkBinds`，其 `arrowDomains` 不递归进 Pi binder 名）；模块 hover 每次读目标文件（无进程内缓存）；同名 `?name` 不共享求解；洞的容错查询跳过用量 / 终止性校验（只影响 hover / `goal`，不影响 `check`）。复用容错精化给 binder 补类型的路径已实测否决：`goalsOfProgramTolerant` 只返回洞位置的名字→类型快照（`dtGoalInfoCtx`，无位置信息）、只覆盖洞作用域内可见的 binder、hole-free 文件无洞可依、同名遮蔽无法区分（按 name 匹配会给错类型）；且让 binder hover 走精化会把 hole-containing 文件的每次 binder hover 从 ~5ms 拖到 ~54ms（实测 12 请求 59ms→652ms），拖慢整文件其它 hover | `lib/Vuna/Lsp/Bindings.vuna`、`lib/Vuna/Lsp/Query.referencesResult`、`Elab/Driver.goalsOfProgramTolerant`；[tooling.md](tooling.md) §2、[lsp.md](lsp.md) | 后续 |
| D29/D31 | 检索与类型名解析是 parse 级：不做实例 / 隐式参数 / 依赖相等 / 类型别名展开，无语义级检索（CLI 无 `--semantic`）；短名歧义回退源码短名，不按 import 闭包规范化 | `lib/Vuna/Search/Query`（`typeNameMap` / `canonName`）；[api-docs.md](api-docs.md) §3.2 / §3.3 | 后续 |
| D30 | docstring 覆盖未全仓化：`vuna doc --check` 仍非全仓硬失败——只对 `vuna-compiler`+`vuna-base` 生效且走 `nix/doc-coverage.baseline` ratchet（缺失数 > 基线才失败，非「零缺失」），根包 `lib/`/`app/` 尚未纳入门禁；成员级 `--check`、多页 / HTML 站点未做 | `lib/Vuna/Doc/*`、`nix/doc-coverage.sh`；[api-docs.md](api-docs.md) | 后续（把基线压到 0 并纳入全部包后，门禁可换成裸 `doc --check`） |
| D33 | 运行时错误只有定义级位置：无表达式级 span、无局部变量值、无断点（无 DAP）；`ocamlopt` 内联会把抛错点归到调用者帧；非入口单元顶层初始化的异常不在捕获范围 | `Codegen/Term`（`dtDefLocTable` / `dtRuntimeWith`）；[debugging.md](debugging.md) §2 | 后续（真正调试器另立项） |
| D34 | `Base.Debug.trace` / `traceShow` 以 `unsafe` 的 `runIO`（`prim_eprint`）实现：纯代码里引入调试副作用，无类型 / 能力层约束 | `base/lib/Base/Debug.vuna`；[effects.md](effects.md) §8 | 后续（QTT / 正式 trace 效应） |
| D35 | workspace 多可执行包须显式 `--package`；REPL 的 resize 重绘靠空闲轮询（`stty min 0 time 1`，读超时与 pty EOF 不可区分 → tty 关闭退化为空闲轮询，正常退出靠 Ctrl-D / `:quit`；每 ~2s 查一次宽度）（`:browse` 每进程首次的 `Vuna.Index` 新鲜度校验卡顿已由会话内 stat 快照关闭，见 [cache.md](cache.md)）；Index 只覆盖 workspace 源码（外部依赖模块只能 `:load` 不能 `:browse`） | `lib/Vuna/Run.vuna`、`lib/Vuna/Repl/Edit.vuna`、`lib/Vuna/Index/*`、`lib/Vuna/Repl.vuna`；[tooling.md](tooling.md) §4 | 后续 |
| D36 | REPL server（`--listen`/`--client`）缺并发与超时语义：连接串行 accept、阻塞 `accept`/`recv` 无超时、无请求取消 / 断线重连；阶段 1 server 模式不执行 `:!` 与效果表达式（子进程会污染协议通道）；网络原语只有 loopback TCP / Unix socket（无 DNS / TLS / 异步，HTTP 未做）；`net` 句柄表在 runtime 里是进程内 `Hashtbl`，无 fd 传递 | `lib/Vuna/Repl/Server.vuna`、`lib/Vuna/Repl/Client.vuna`、`lib/Vuna/Json/Server.vuna`；`Codegen/Term.dtPrimRuntime` 的 `dtp_net_*`；[tooling.md](tooling.md) §5 / §7 | M35.3（后续） |
| E03 | `result*` out-link 可过期（手工指向某次构建），文档只能提示重建 | `nix build ... --out-link` 的语义；[testing.md](testing.md) 的 `result*` 说明 | 待定 |

## 相关阅读

- 方向、阶段与未来轨道：[roadmap.md](../roadmap.md)
- 规则与语义：各主题参考页（见 `AGENTS.md` 的「文档导航」）
- 类型系统 / Core / 效应 / 缓存等实现参考：见 `AGENTS.md` 的「文档导航」
