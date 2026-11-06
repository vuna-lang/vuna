# 技术债务与未实现能力（debt）

本文件只登记**当前仍未关闭**的债务、缺陷与能力缺口。关闭即删除（历史在 git）；已落地决策
与已修复缺陷不在此维护。每条给**当前证据**与**归属**（阶段编号见
[roadmap.md](../roadmap.md)）；无法归属的标「待定」。

维护规则：新增项必须能给出可复现证据（命令或 file:line）与归属；同义项合并为一行；不保留
「部分修复」的模糊措辞——要么当前仍成立，要么删除。

## 语言与精化器

| ID | 摘要 | 当前证据 | 归属 |
| --- | --- | --- | --- |
| B07 | 完整高阶合一未实现：只支持空 spine 与 Miller pattern；非 pattern 形状明确报错 | `Core/Conv.solveMeta`；`TC_CannotSolveHigherOrder` | 研究储备 |
| B09/D08 | 隐式模式 `{p}` 与 `auto` / 隐式等式搜索未实现；隐式**值**参数 `{x : a}` 已可用 | parser pattern 语法无 `{p}`；`Elab/Meta.isImplicitDomain` 只放行值参数 | F4 |
| B11/D11 | trait 只支持单参数；多参数 trait、默认方法、父类、关联类型未实现 | `Elab/Trait` 的「exactly one parameter」；约束实例与参数化 deriving 已可用 | F4 |
| B13/D20 | 泛型 Σ 的值级构造仍不可表达（字段类型不能依赖运行时值） | `dt_err/45_generic_sigma_runtime`；Tarski 式存在式是当前替代（`dt/62`/`dt/63`） | F4 |
| B18 | 同模块 `data T` 与 `def T` 同名仍不支持（Elab globals 需按命名空间拆表） | `Elab.Term` 的类型层 def 退化路径只查同名值定义 | F1 |
| B23 | 孤儿实例规则曾写进 `limits.md` / `type-system.md` / `records-traits.md`（「trait 与类型都不在本模块定义时被拒」），但实现从未强制；M31.1 起 primitive 类型的实例（`Base.Int` / `Base.String`）按落点规则放在「没有类型声明」的模块里，不能靠孤儿规则 | `Elab/Trait.elabInstanceSig`；`docs/reference/limits.md`、`records-traits.md` | M31.1：文档改为**实例落点规则**（[operators.md](operators.md)），删除「孤儿实例被拒」表述；是否补实现检查待定 |
| B24 | `Show` 的实例仍全部堆在 `Base.Show`（`Int` / `String` / `Bool`），与 M31.1 的「实例跟类型模块走」规则不一致（`show : a -> String` 的返回类型是 `String`，String 实例应留 trait 模块，Bool / Int 可迁类型模块） | `base/lib/Base/Show.vuna`；[operators.md](operators.md) | 另立项（M31.3 未处理） |
| B25 | `Int` / `String` 是 primitive（无 `data` 声明、无类型声明文件）；是否引入 `primitive type` 声明把类型身份搬进库（canonical 名、字面量/覆盖性/codegen 全链路）待评估；M31.1 保持 primitive，只把实例放 `Base.Int` / `Base.String` | `Intrinsics.typeIntrinsicNames`；`Elab/Prelude`；`Codegen` | F/研究（M31.3 已收尾，可评估） |
| B28 | 工具链 `Lint` / `Index` 对 `Expr` 的穷尽 case 仍有兜底分支（`_ => []`；`EInfix` / `EParen` / M31.3 的 `EBacktick` / `ESect*` 正常在 Loader 重排后不存在，M31.3 已给新节点补显式递归）；若将来新增 AST 节点或前端入口绕过重排，兜底会**静默丢子树**（Elab / Resolve 是显式 internal error，Fmt / Doc 显式处理，工具链是空值） | `lib/Vuna/{Lint,Index}`；`Loader/Resolve`、`Elab/*` | 后续：统一改显式 internal error 或断言 |
| B29 | M32 的显式 trait 约束只支持顶层签名；`where` / `let` 绑定、`axiom`、trait 方法、构造子 / 记录字段上的 `C a =>` 都不支持（trait 方法约束是父类语义，归 F4） | `Parser.rejectCtxSuffix` / `PS_ConstraintUnsupportedHere`；`test/corpus/traits/99_explicit_*_rejected` | F4（父类 / 局部约束） |
| B30 | 标准库容器仍缺：泛型 `Hashable`（trait 仅单参数、无 `deriving Hash`）、有序持久容器（TreeMap/TreeSet）。不可变 `Array`、IO 内 `IORef` / `MArray` / `Buffer` 与 `HashMap`/`IntMap` 的 `Array` 桶已落地（M33 W3）；编译器热点由 `HashMap`/`IntMap` 覆盖 | `base/lib/Base/{HashMap,HashSet,IntMap,Array,IORef,MArray,Buffer}.vuna`；[stdlib.md](stdlib.md) 的容器边界 | F4（容器） |
| B31 | 容器 `Show` / `Interp` 实例暂缓：给 `List`/`Maybe`/`Pair`/`Result` 加 `deriving (Show)` 后，**依赖包摘要/冷启动路径**上精化这些泛型实例体极慢（单个实例 ~20s，`vuna check compiler` 11.9s→70s），慢点在 `Elab.Trait.elabInstanceBodies` → 实例 ctx 字典查找/实例搜索；模板迁移用 primitive 快捷路径（`Elab.Term.Impl.specializeInterpPrimApp`）避免每个洞建字典。修好实例体路径后再把容器实例按落点规则放进类型模块 | 实测：base 加 4 个 `deriving (Show)` 后 `vuna check compiler` 11.9s→70s（旧基线）；`elabInstanceBodies` 单实例 20s | 后续（阻塞容器实例与 `${xs}` 开箱可用） |
| C07 | 擦除位的作用域护栏按约定跳过，未对擦除位置做完整 de Bruijn 校验 | `Codegen/Erase.checkAllDefScopes`：跳过擦除实参 | 待定 |
| D12 | 证明 ergonomics 进阶未实现：absurd / 空族消去语法、`rewrite` / `with`；隐式模式与 `auto` 见 B09/D08 | `limits.md` 的证明 ergonomics 边界；`tooling.md` §6 | F4 |
| D19 | 类型级部分应用不可用（如把 `Vec Int` 当类型参数传给 `Sigma Nat`） | `checkAppUnderTypeFuel` 报 `expected Nat, got Int` | F4 |
| D21 | 完整 FFI 未做：受限 FFI（`Int` / `String` / `Bool` / `Array Int|String|Bool` 显式参数 + C 纯函数，包根 `ffi/*.c`）已落地（M33 W5）；仍无回调 / GC root / pin、无 C 头文件解析、无字符串双向可变共享 | [primitives.md](primitives.md) §10；[limits.md](limits.md) | 后续 / M35 |
| D22 | QTT 核心已落地（M38：quantity 0/1/ω、用量检查、`linear data`/`linear record`、`Ref`/`SArray` 线性化）；仍无依赖 multiplicity、multiplicity 多态、线性箭头/借用、一次性续延，`ST` 动作本身仍可复制（无线性箭头线程化动作内部值），因此动作复制可产生同一底层 IORef 的多个句柄 | `compiler/lib/Vuna/Compiler/Elab/Usage.vuna`、`base/lib/Base/ST.vuna`；[qtt.md](qtt.md)、[effects.md](effects.md) §4 | 后续：线性箭头/多态 / F3 |
| D23 | `+ - * /` 只有 Int/Nat 的类型定向特化，没有通用 `Num`/`FromInteger` 类；用户自定义数值类型不能重载字面量与算术 | `Elab/Term/Impl.specializeArith*`；[operators.md](operators.md) | F4 / 后续 |
| D24 | Nat 字面量在**编译期**展开成 Zero/Succ 链（无惰性 `TNat`），超大 Nat 字面量有编译期节点成本；`case n of 0 =>` 字面量模式未支持 | `Elab/Term/Impl.natLitTerm`；[limits.md](limits.md) | 后续 |
| D25 | Int→Nat 全库迁移只覆盖 Base 公开度量与必要消费点；`compiler/` 内部 level/meta/fuel/span/arity 与工具链多数内部字节计数仍保留 Int（按 M34.7 边界），`Base.IO.print/writeFile` 返回值也仍 Int | `docs/reference/limits.md` 的 Nat/Int 边界；`lib/` 中剩余 `strLength` | 后续（按性能/语义逐点） |
| D27 | 擦除依赖续延的运行时表示缺失：签名索引 `Eff`（CPS 版）的续延域 `res op` 在 OCaml 里不可命名（codegen 渲染成 `unit`，与真实续延类型冲突）；数据版 free monad 的 `bind` 触发终止性检查；Type-1 行编码 codegen 损坏。三条路线：QTT（不解决该表示轴）/ 后端不透明擦除值 / 运行时类型码 | [effects.md](effects.md) §5、§6 | F3 |
| D28 | `base` 声明了 `unsafe`（使用点：`Base.IO.runIO = prim_runIO` 别名定义、`Base.ST.runST`），但没有机制约束「仅这些信任点使用」；收紧需要 per-module 能力或 QTT 线性 | `base/vuna.toml`；`base/lib/Base/{IO,ST}.vuna` | 后续（F3 / QTT） |
| D32 | transformer 固定以 `IO` 为基座（`StateT s a` 而非 `StateT s m a`）：record 参数统一按 `Type` kind 降级，且顶层签名/实例头里的自由隐式变量 kind 只按「被应用次数」推断、不会从构造子 kind 反推，`m : Type -> Type` 在实参位置会被误判成 `Type`。泛化需要「隐式参数 kind 从构造子 kind 推断」（签名 `quantifyTopSig` + 实例头 `instanceTeleOf` 两处） | `base/lib/Base/{StateT,ReaderT,ErrorT}.vuna`；`Elab/Sig.vuna`、`Elab/Trait.vuna` | M37 后续（F3 前置） |
| D29 | 类型检索是 parse 级：不做实例/隐式参数/依赖相等/类型别名展开；语义级（DT 精化后比较）只保留内部 `TypeMode.Semantic` 接口，CLI 不暴露 `--semantic` | `lib/Vuna/Search/Query.vuna`；[api-docs.md](api-docs.md) §3.2 | 后续（性能/精度权衡） |
| D30 | docstring 覆盖未全仓化：当前仅试点 `base/` 部分模块；`vuna doc --check` 为 opt-in，未接 `nix flake check`；`-- ^` 尾随 doc、成员级 `--check`、多页/HTML 站点未做 | `lib/Vuna/Doc/*`；`docs/reference/api-docs.md` | 后续（按模块迁移） |
| D31 | 类型名解析是语法级：短名歧义回退源码短名；不按 import 闭包把类型名规范化为 canonical 身份 | `Vuna.Search.Query.typeNameMap` / `canonName` | 后续（与 Loader 共享名字解析） |

## 工具、构建与验证

| ID | 摘要 | 当前证据 | 归属 |
| --- | --- | --- | --- |
| C23 | `test/run-tests.sh` 无按章节 timeout，夹具 / 段数守卫仍靠脚本自律 | `test/run-tests.sh`；42 个章节 | 待定 |
| E01 | 无托管 CI：只有本地 `nix/ci.sh` 封装 flake check | 仓库无 `.github/` 等 CI 配置 | 待定 |
| E03 | `result*` out-link 可过期（手工指向某次构建），文档只能提示重建 | `nix build ... --out-link` 的语义 | 待定 |
| E04 | TCB 只有黑名单 + 闭包数量断言，没有完整 allowlist | `nix/tcb-check.sh` + `nix/seed-count.txt` | 待定 |
| E06 | seed rotation 替换步骤非原子：校验通过后 `rm -rf seed && cp -r` | `nix/seed-rotate.sh` | 待定 |
| C32 | 接口摘要**包级 + 模块级已落地**，缓存载荷已有统一 framing（magic|tag|len|校验和）+ 损坏回退 + schema/编译器指纹拒绝（M34.6）；仍缺：**显式自描述编码格式**（载荷仍是 OCaml Marshal，同长同校验和的构造性损坏仍可能抛异常）、elab 级磁盘缓存（单文件/模块级精化产物落盘，当前只有 iface/split/AST 缓存）、`VUNA_CACHE_MTIME` 默认关（带 5s 安全窗，收益 <5%） | `Driver/CacheFormat`、`Driver/Iface`、`Driver/Compile`；[cache.md](cache.md) | 后续（序列化格式 / elab 磁盘缓存） |
| C36 | 泛型函数体内对 `Int` 的比较/算术（`<=` / `+` / `-`）走方法别名的隐式实例搜索，其隐式变量与函数泛型类型变量同名合并——泛型函数里混用「Int 辅助逻辑 + 泛型数据」时，`fuel <= 0` 会把泛型 `a` 统一成 `Int`（归并排序 `sortByFuel` 复现）；目前只能拆独立函数或显式类型规避，且数值递减的 SCT 判定被包裹函数阻断 | `Base/Sort.vuna` 注释；`Elab/Trait` 实例解糖 | M34.3（后续） |
| C37 | 接口摘要（TTC 式模块化精化）**包级 + 模块级 + 工具链消费全部落地**：依赖模块零 parse/resolve、包内逐模块增量（S4）、codegen 单元缓存默认开（S5/S7）、LSP/REPL 惰性闭包 + 会话缓存 + 单文件增量 + 单模块写回（默认开，§44l）、依赖可见性收敛（S6）、`defVals` 记忆化已删除。**剩余**：① 擦除位置残留未解 meta 仍靠包段 `(idx+1)<<30` 重编号；② LSP-only 冷启动写回的单模块 iface 哈希与整包 check 可能略有差异，靠「整包 check 首次重写该模块+依赖者」自愈；③ REPL 每条表达式仍重读 manifest/iface（termAux/起始状态已缓存） | `Driver/Iface`、`Driver/Compile`、`Driver/Dt`、`Loader/Flatten`；[cache.md](cache.md) | M34.6（收尾；①②③ 归后续） |

| D33 | 运行时错误只有**定义级**位置：无表达式级 span、无局部变量值、无断点（无 DAP）；`ocamlopt` 内联会把抛错点归到调用者帧；非入口单元顶层初始化的异常不在捕获范围 | `Codegen/Term.dtDefLocTable`/`dtRuntimeWith`；[debugging.md](debugging.md) §2 | 后续（真正调试器另立项） |
| D34 | `Base.Debug.trace/traceShow` 以 `unsafe` 的 `runIO`（`prim_eprint`）实现：纯代码里引入调试副作用，无类型/能力层约束 | `base/lib/Base/Debug.vuna`；[effects.md](effects.md) D28 | 后续（QTT / 正式 trace 效应） |
| D35 | `vuna run` 只执行默认 `.output/bin/<包名>`（无 `--out`；workspace 多可执行包须显式 `--package`）；REPL 无行编辑历史 / 补全；`:browse` 首次可能触发索引重建 | `lib/Vuna/{Run,Repl}.vuna` | 后续 |
| C38 | LSP codeAction 只有 lint quick fix：无 rename、无 case split、无 command 形式；`diagnostics` 只带 `code`（严格 LSP 还需 range/message） | `lib/Vuna/Lsp/Query.codeActionsFor`；[tooling.md](tooling.md) §2 | 后续 |
| C39 | `vuna test` 仍串行（`nix/run-tests.sh` 的 `--jobs` 只并行章节）、无单测超时（沿 C23） | `lib/Vuna/TestRunner.vuna`；[testing.md](testing.md) | 后续 |

## 未来能力（F1–F4）

| ID | 摘要 | 归属 |
| --- | --- | --- |
| D01 | 模块系统无签名 / 接口、无 functor / 嵌套 / 局部模块、import 仅文件顶部、无选择性 import | F1 |
| D02 | 运行时 / 后端未定型：GC、后端无关 IR、Wasm/JS（当前绑 OCaml runtime） | F2（M33 表示 / 运行时；自研 GC / 后端不做，Wasm / JS 暂缓） |
| D03 | 通用签名索引效应（用户自定义 op、深 handler 组合、行 / 重排）未实现。M35.1 已落地参数化纯效应 monad（`Base.State` / `Reader` / `Error`）与 `Base.ST` region 隔离；M37 已把 `IO` 升格为内建效应类型（`prim_pureIO` / `prim_bindIO` / `prim_runIO`）并给出 IO 基座 `MonadIO` + transformer。剩余阻塞的技术根因见 D27 | [effects.md](effects.md) §3；[limits.md](limits.md) | F3 |
| D04 | 包生态：registry、版本解析、lockfile、文档托管、DT 验证库（Vec/Fin/Map/Set）；容器部分已落地（M33 W3，残留见 B30） | F4（生态） |
| D06 | 完整依赖 kind / CoC 依赖消除（当前只检查 kind 形状与层级） | 研究储备 |
| D17 | `main` 的展示只覆盖内建 `Int` / `Nat` / `String` / `Bool`；任意类型展示需要运行时 `Show` 证据 | F3 |

## 相关阅读

- 阶段与未来轨道：[roadmap.md](../roadmap.md)
- 当前边界（用户可见）：[limits.md](limits.md)
- 语言规则：[type-system.md](type-system.md)；Core 实现：[core.md](core.md)
