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

## 工具、构建与验证

| ID | 摘要 | 当前证据 | 归属 |
| --- | --- | --- | --- |
| C23 | `test/run-tests.sh` 无按章节 timeout，夹具 / 段数守卫仍靠脚本自律 | `test/run-tests.sh`；42 个章节 | 待定 |
| E01 | 无托管 CI：只有本地 `nix/ci.sh` 封装 flake check | 仓库无 `.github/` 等 CI 配置 | 待定 |
| E03 | `result*` out-link 可过期（手工指向某次构建），文档只能提示重建 | `nix build ... --out-link` 的语义 | 待定 |
| E04 | TCB 只有黑名单 + 闭包数量断言，没有完整 allowlist | `nix/tcb-check.sh` + `nix/seed-count.txt` | 待定 |
| E06 | seed rotation 替换步骤非原子：校验通过后 `rm -rf seed && cp -r` | `nix/seed-rotate.sh` | 待定 |
| C30 | `vuna build` 的 build meta 不含 manifest 摘要：改 `vuna.toml` 能力声明后 `build` 报 "up to date"、跳过重检查与重编（`vuna check` 仍全量） | `Driver/Compile.buildMetaText` / `metaUpToDate` | 待定 |
| C32 | 无单文件 / 模块级 elab 缓存与序列化格式（只有 build 产物级增量） | `Driver/Compile.buildMetaText`；无 Core Term / DtProgram 序列化 | M34 |
| C33 | 无性能 CI 门槛与分配 / GC 统计：bench 仅手动、`--check` 软对比 | `nix/bench.sh` 非 check；`performance.md` §2 只有时间戳打点 | M34 |
| C34 | `vuna map` 冷启动全量重建 ~31 s：索引缓存的内容哈希失效后整仓重扫，且 `refsInExpr` 把子树引用列表用左结合 `append` 拼接，嵌套表达式 / 应用 spine 呈 O(n²) | 冷启动 `./result/bin/vuna map` ~32.5 s、热缓存 ~0.46 s（`.local/index/` 命中）；`lib/Vuna/Index/Scan.vuna:324` `refsInExpr` | M34 |

## 未来能力（F1–F4）

| ID | 摘要 | 归属 |
| --- | --- | --- |
| D01 | 模块系统无签名 / 接口、无 functor / 嵌套 / 局部模块、import 仅文件顶部、无选择性 import | F1 |
| D02 | 运行时 / 后端未定型：GC、后端无关 IR、Wasm/JS（当前绑 OCaml runtime） | F2（M33 表示 / 运行时；自研 GC / 后端不做，Wasm / JS 暂缓） |
| D03 | 无通用效应系统 / 并发 / async；`IO` 仍是 thunk + IO 化的 `prim_*`（M31：动作只在 `main`，`runIO` 是能力门控逃逸） | F3（M33 最小效应接口、M35 并发 / async） |
| D04 | 包生态：registry、版本解析、lockfile、文档托管、DT 验证库（Vec/Fin/Map/Set）；容器部分已落地（M33 W3，残留见 B30） | F4（生态） |
| D06 | 完整依赖 kind / CoC 依赖消除（当前只检查 kind 形状与层级） | 研究储备 |
| D17 | `main` 的展示仍限 `Int` / `String` / `Bool`；任意类型展示需要运行时 `Show` 证据 | F3 |

## 相关阅读

- 阶段与未来轨道：[roadmap.md](../roadmap.md)
- 当前边界（用户可见）：[limits.md](limits.md)
- 语言规则：[type-system.md](type-system.md)；Core 实现：[core.md](core.md)
