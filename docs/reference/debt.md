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
| D22 | 无依赖 multiplicity / 线性箭头 / 借用 / 一次性续延；`ST` 动作本身可复制；线性值传给 ω 形参的通用函数被 `TC_LinearOverused` 拒绝（保守近似只误拒不误放） | `Elab/Usage.vuna`；`base/lib/Base/ST.vuna`；[qtt.md](qtt.md) | 后续 |
| D24 | Nat 字面量编译期展开为 `Zero`/`Succ` 链（Core / iface 载荷随字面量大小线性增长）；`Codegen/Term.genTerm` 的 512 fuel 在 Vec 索引 ≥128 时可耗尽 | `Elab/Term/Impl.natLitTerm`；`Codegen/Term.genTerm`；[primitives.md](primitives.md) §3.1 | 后续 |
| D27 | 精化期未解 meta 按「可表示」处理会漏插 cast（终解后才知道类型不可表示） | `Elab/Meta.vuna` 的未解 meta 判据；[effects.md](effects.md) §5 | 后续 |
| D28 | 定义级信任点只对 opt-in 包生效（base 已 opt-in；root 与 compiler 仍只有包级 `unsafe` 门控）；入口 / REPL / LSP 等部分加载场景只校验已加载模块的信任项 | `Frontend/Manifest.manifestTrustUnsafe`、`Loader/Resolve.checkTrustPoints`；夹具 `packages/12_trust_points`；[packages.md](packages.md) | 后续 |
| D32 | transformer 固定以 `IO` 为基座（无 `StateT s m a`）；顶层签名的自由隐式变量 kind 只按应用次数推断（不从构造子 kind 反推）；头可合一的重叠实例被拒 | `Elab/Sig.quantifyTopKinds`、`Elab/Trait.{instanceTeleMetas,classParamKindOf}`；[effects.md](effects.md) §3.2 | 后续 |
| D37 | `runEff` 内部信任入口仍接受任意行；运行时 `unhandled effect` 兜底仍服务特权/内部路径 | `base/lib/Base/Eff.vuna`（`runIOEff`）；`compiler/lib/Vuna/Compiler/Elab/Term/Impl.vuna`（`unhandledEffectLabel`）；[effects.md](effects.md) §8.4/§8.6 | 后续 |
| D41 | 无 Domain 并行、父 fiber handler 继承；`Base.EffAsync` 与调度器互不集成 | `Base.EffAsync`、`Base.EffSched`；[effects.md](effects.md) §8.5 | 后续 |
| D42 | 无通用线性箭头类型 / multiplicity 多态；`bracket` 的 cleanup 只能访问外层 handler、自身异常被吞、调度器硬中止路径无 handler 栈；线性值可经非线性 data 字段被复制 | `Base.Eff`（`Cont`/`bracket`/`finally`）、`Intrinsics.vuna`（`prim_cleanupPush/Pop`）；[effects-layers.md](effects-layers.md) | 后续 |
| D44 | 协作式取消只在挂起点生效；超时硬中止丢弃续延、未执行的清理不跑；超时是逻辑步数（无真实时钟）；任务体只能 `Eff Nil a`、无法继承父 handler 栈；Mutex/Semaphore/Channel 是忙等实现 | `Base.EffSched`；`compiler/lib/Vuna/Compiler/Codegen/Term.vuna`（`dtSchedRuntime`）；[effects.md](effects.md) §8.5 | 后续 |
| D49 | 特权包内效应检查是「每模块第一个 effectful builtin」的清单信号，非逐次授权 | `compiler/lib/Vuna/Compiler/Loader/Resolve.vuna`（`checkModuleEffects`）；[packages.md](packages.md)「效应能力」 | 后续 |
| D50 | 特权残留：`packages/11_run_args` 仍特权——缺「任意行位 IO handler + 多层 IO 展平」组合子 | `base/lib/Base/EffConsole.vuna`（`handleConsoleIO` 强绑行首）、`Base/Eff.vuna`（无 `joinIO`）；[effects.md](effects.md) §8.6 | 后续 |
| D52 | 生成的字典/方法投影无类型标注：OCaml 侧会把 `f a` 与 `f (a -> b)` 错误统一（`Applicative.liftA2` 从 `ap` 派生即失败），只能逐实例手写；codegen 加类型标注后才能恢复派生 | `compiler/lib/Vuna/Compiler/Codegen/{Decl,Term}.vuna` | 后续 |

## 工具、构建与验证

| ID | 仍未成立的事实 | 证据 | 归属 |
| --- | --- | --- | --- |
| C32 | 缓存载荷保留 OCaml Marshal（决策）；check 缓存命中路径仍写入 1–4MB `CachedProgram` 载荷（写放大）；校验和只有 10-bit `strHash`，碰撞面未收紧 | `Vuna.Compiler.CacheFormat`、`Driver/Compile`、`Driver/Iface`；[cache.md](cache.md) | 后续 |
| C37 | 擦除位置残留未解 meta 仍靠包段 `(idx+1)<<30` 重编号；LSP-only 冷启动写回的单模块 iface 哈希与整包 check 可能略有差异，靠首次整包重写自愈（已接受为边界） | `Driver/Compile`（单模块写回）、`Driver/Dt`（`shiftCachedProgram`）；[cache.md](cache.md) | 后续 |
| C38 | LSP case split：不检查依赖模块导出面；构造子 / record 解析是 parse 级；每请求重跑容错精化（无进程内缓存）；洞在类型位置仍可能生成非法 `case`；索引族 case split 需要精化器暴露可达构造子（研究，非债务） | `lib/Vuna/Lsp/Query.caseSplitActions`、`lib/Vuna/Lsp/Bindings`；`test/corpus/lsp/smoke.sh`；[lsp.md](lsp.md) | 后续 |
| C45 | LSP 缺局部绑定推断类型：λ / `as` / 记录 pun 等无语法标注的 binder 只能给文本推导位置/类型；同名 `?name` 不共享求解 | `lib/Vuna/Lsp/Bindings.vuna`、`Elab/Driver.goalsOfProgramTolerant`；[lsp.md](lsp.md) | 后续 |
| C46 | `vuna test` 的 main 通过判据只认 `Int`/`Nat`/`String`/`Bool` 与 `IO a`（退出码 0），其它类型报错 | `lib/Vuna/Test/Run.vuna`（`dtMainKind`）；[primitives.md](primitives.md) §5 | 后续 |
| D29/D31 | 检索与类型名解析是 parse 级：不做实例 / 隐式参数 / 依赖相等 / 类型别名展开，无语义级检索；短名歧义回退源码短名，不按 import 闭包规范化 | `lib/Vuna/Search/Query`（`typeNameMap` / `canonName`）；[api-docs.md](api-docs.md) | 后续 |
| D30 | docstring 覆盖未全仓化：`vuna doc --check` 受管辖包仍是 compiler+base，root `lib/`、`app/` 未被收集；门禁是 ratchet 而非零缺失；多页 HTML 与零缺失不计划（内部符号为主、单文件可直接打开） | `lib/Vuna/Doc/*`、`nix/doc-coverage.sh`；[api-docs.md](api-docs.md) | 后续（多页/零缺失不计划） |
| D33 | 运行时错误只有定义级位置：无表达式级 span、局部变量值、断点（无 DAP）；`ocamlopt` 单元内联会把抛错点归到调用者帧；非入口单元顶层初始化的异常不在捕获范围 | `Codegen/Term`（`dtDefLocTable` / `dtRuntimeWith`）；[debugging.md](debugging.md) §2 | 后续 |
| D35 | REPL 的 resize 重绘靠空闲轮询（tty 关闭退化为空闲轮询，接受为限制）；Index 只覆盖 workspace 源码（外部依赖模块只能 `:load` 不能 `:browse`） | `lib/Vuna/Repl/Edit.vuna`、`lib/Vuna/Index/*`；[tooling.md](tooling.md) §4 | 后续 |

## 相关阅读

- 规则与语义：各主题参考页（见 `AGENTS.md` 的「文档导航」）
