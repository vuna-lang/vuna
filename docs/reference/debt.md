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
| C07 | 擦除位的作用域护栏按约定跳过，未对擦除位置做完整 de Bruijn 校验 | `Codegen/Erase.checkAllDefScopes`：跳过擦除实参 | 待定 |
| D12 | 证明 ergonomics 进阶未实现：absurd / 空族消去语法、`rewrite` / `with`；隐式模式与 `auto` 见 B09/D08 | `limits.md` 的证明 ergonomics 边界；`tooling.md` §5 | F4 |
| D19 | 类型级部分应用不可用（如把 `Vec Int` 当类型参数传给 `Sigma Nat`） | `checkAppUnderTypeFuel` 报 `expected Nat, got Int` | F4 |
| D21 | 完整 FFI 未做：受限 FFI（`Int` / `String` / `Bool` / `Array Int|String|Bool` 显式参数 + C 纯函数，包根 `ffi/*.c`）已落地（M33 W5）；仍无回调 / GC root / pin、无 C 头文件解析、无字符串双向可变共享 | [primitives.md](primitives.md) §10；[limits.md](limits.md) | 后续 / M35 |
| D22 | 无线性 / 唯一性类型与 ST / region：可变数据（`IORef` / `MArray` / `Buffer`）已按 IO 隔离落地（M33 W3），但类型上无法表达「句柄不逃逸」，`runST` 仍无法类型安全表达 | `limits.md` 的「容器与可变数据」；[primitives.md](primitives.md) §6.1 | 研究储备（线性类型）/ M33 后续 |
| D23 | `+ - * /` 只有 Int/Nat 的类型定向特化，没有通用 `Num`/`FromInteger` 类；用户自定义数值类型不能重载字面量与算术 | `Elab/Term/Impl.specializeArith*`；[operators.md](operators.md) | F4 / 后续 |
| D24 | Nat 字面量在**编译期**展开成 Zero/Succ 链（无惰性 `TNat`），超大 Nat 字面量有编译期节点成本；`case n of 0 =>` 字面量模式未支持 | `Elab/Term/Impl.natLitTerm`；[limits.md](limits.md) | 后续 |
| D25 | Int→Nat 全库迁移只覆盖 Base 公开度量与必要消费点；`compiler/` 内部 level/meta/fuel/span/arity 与工具链多数内部字节计数仍保留 Int（按 M34.7 边界），`Base.IO.print/writeFile` 返回值也仍 Int | `docs/reference/limits.md` 的 Nat/Int 边界；`lib/` 中剩余 `strLength` | 后续（按性能/语义逐点） |
| D26 | `Base.IO` 仍是 `data IO a where MkIO : ...`：canonical 构造子身份写死在 `Intrinsics.ioMkIoCtor`，改名为 record 需要「先放宽接受 MkIO/IO 两种 → rotation → 再改 Base.IO → rotation」两阶段过渡；字段访问收益小，本轮未做 | `base/lib/Base/IO.vuna`；`Elab.Term.Impl`/`Intrinsics.ioMkIoCtor` | 后续 |

## 工具、构建与验证

| ID | 摘要 | 当前证据 | 归属 |
| --- | --- | --- | --- |
| C23 | `test/run-tests.sh` 无按章节 timeout，夹具 / 段数守卫仍靠脚本自律 | `test/run-tests.sh`；42 个章节 | 待定 |
| E01 | 无托管 CI：只有本地 `nix/ci.sh` 封装 flake check | 仓库无 `.github/` 等 CI 配置 | 待定 |
| E03 | `result*` out-link 可过期（手工指向某次构建），文档只能提示重建 | `nix build ... --out-link` 的语义 | 待定 |
| E04 | TCB 只有黑名单 + 闭包数量断言，没有完整 allowlist | `nix/tcb-check.sh` + `nix/seed-count.txt` | 待定 |
| E06 | seed rotation 替换步骤非原子：校验通过后 `rm -rf seed && cp -r` | `nix/seed-rotate.sh` | 待定 |
| C32 | 单文件 / LSP 级 elab 缓存与接口摘要未做；已有 check/build 级 elab 缓存（`Compile` 的 check 结果缓存 + `List SplitFile` 缓存），但序列化用 OCaml Marshal（非自描述，靠编译器二进制指纹失效） | `Driver/Compile`（`checkCacheKey*`/`splitCacheKey`）；[performance.md](performance.md) §9 | M34（后续规范化） |
| C33 | 性能 CI 只有软对比（`bench/compiler.sh --check` 20% WARN）与缓存有效性门槛（`vuna-compiler-perf` 断言热 < 冷/2）；分配统计报告已可用（`bench/compiler.sh --alloc`，VN_PERF_STATS），但没有绝对性能回归门槛 | `bench/compiler.sh`；`nix/checks/compiler-perf.sh`；[performance.md](performance.md) §9 | M34（部分落地） |
| C36 | 泛型函数体内对 `Int` 的比较/算术（`<=` / `+` / `-`）走方法别名的隐式实例搜索，其隐式变量与函数泛型类型变量同名合并——泛型函数里混用「Int 辅助逻辑 + 泛型数据」时，`fuel <= 0` 会把泛型 `a` 统一成 `Int`（归并排序 `sortByFuel` 复现）；目前只能拆独立函数或显式类型规避，且数值递减的 SCT 判定被包裹函数阻断 | `Base/Sort.vuna` 注释；`Elab/Trait` 实例解糖 | M34.3（后续） |
| C37 | 接口摘要（check 期包级 TTC 式模块化精化）**已落地**：摘要 = 闭合结果（datas + defs 含 body + globals + insts + classes），不含 `sols`/`next`；`deftbl` 只装定义体（历史根因：签名项进 deftbl 会让 `force` 把 `Int`/`String` 归约成 `Type`，报 `TC_AmbiguousInstance (Eq Type)`）；写侧按出现点深度 zonk，读侧 `cachedProgramValid` 校验。**开放项**：① 接口粒度是**包**不是模块——依赖包未被根包 import 的实例/类也会进视图（过近似），模块级接口与模块级签名隔离是后续（roadmap 第 2 步）；② codegen 模块级缓存：C35 的依赖模型前提已就绪（直接依赖 + 全限定跨单元引用 + 分层并行构建），模块级复用/缓存本身待做；③ 依赖 `defVals` 未序列化（摘要路径 delta 现算 body，只影响速度）；④ 擦除位置残留未解 meta 仍靠包段 `(idx+1)<<30` 重编号，彻底方案是精化收尾消除残 meta；⑤ LSP 尚未消费接口摘要（仍全量精化）。历史根因链（4 层修复 + 最终定位）见 git 历史 M34.5 提交 | `Driver/Cache`、`Driver/Dt.depStartOf`、`Driver/Compile`、`Elab/Driver.elabProgramFullWithAux`；[compiler.md](compiler.md) §接口摘要 | M34.5（模块级/后续） |

## 未来能力（F1–F4）

| ID | 摘要 | 归属 |
| --- | --- | --- |
| D01 | 模块系统无签名 / 接口、无 functor / 嵌套 / 局部模块、import 仅文件顶部、无选择性 import | F1 |
| D02 | 运行时 / 后端未定型：GC、后端无关 IR、Wasm/JS（当前绑 OCaml runtime） | F2（M33 表示 / 运行时；自研 GC / 后端不做，Wasm / JS 暂缓） |
| D03 | 无通用效应系统 / 并发 / async；`IO` 仍是 thunk + IO 化的 `prim_*`（M31：动作只在 `main`，`runIO` 是能力门控逃逸）。**M33 的最小效应接口已落地为库级 `State` / `Reader` / `Error`**（纯函数、显式 import）；正式效应接口与并发留 M35 | [stdlib.md](stdlib.md)；[limits.md](limits.md) | F3（M35） |
| D04 | 包生态：registry、版本解析、lockfile、文档托管、DT 验证库（Vec/Fin/Map/Set）；容器部分已落地（M33 W3，残留见 B30） | F4（生态） |
| D06 | 完整依赖 kind / CoC 依赖消除（当前只检查 kind 形状与层级） | 研究储备 |
| D17 | `main` 的展示只覆盖内建 `Int` / `Nat` / `String` / `Bool`；任意类型展示需要运行时 `Show` 证据 | F3 |

## 相关阅读

- 阶段与未来轨道：[roadmap.md](../roadmap.md)
- 当前边界（用户可见）：[limits.md](limits.md)
- 语言规则：[type-system.md](type-system.md)；Core 实现：[core.md](core.md)
