# 技术债务与未实现能力（debt）

本文件只登记**当前仍未关闭**的债务、缺陷与能力缺口；关闭即删除（历史在 git）。每条给
**可复现证据**与**归属**（阶段 / 轨道编号见 [roadmap.md](../roadmap.md)）。

分工（避免与其他文档重复）：

- **方向 / 终态 / 阶段范围 / F1–F4 / 研究储备只在 roadmap**——本文件不复述方向，归属列只写
  轨道或阶段编号；
- **已落地的事实**在 roadmap 的「当前基线」与各主题参考页——本文件不写「已落地什么」；
- **用户可见边界**在 [limits.md](limits.md)——本文件只给证据与关闭条件，不复述规则文本。

维护规则：新增项必须能给出可复现证据（命令或 file:line）；同义项合并为一行；摘要只陈述
**仍未成立的那个事实**，不写「部分修复」。新增前先查 roadmap：若某方向已被 F1–F4 / 研究储备
逐条列明且没有 roadmap 之外的证据，不在此另立条目。

## 语言与精化器

| ID | 仍未成立的事实 | 证据 | 归属 |
| --- | --- | --- | --- |
| B07 | 高阶合一只覆盖空 spine 与 Miller pattern；其余仅剩 M13 遗留的「头一致就提取」近似，提取不到才报错 | `Core/Conv.vuna` 的 `solveMetaFuel` / `solveMetaHoLegacyFuel`；`TC_CannotSolveHigherOrder` | 研究储备 |
| B18 | 同模块 `data T` 与值 `T` 同名仍不可靠：globals 是 name→Term 单表，类型头与值签名互相覆盖（类型位置会取到值签名） | `Elab/Driver.vuna` 的 globals 构造；`Elab/Data.vuna` 以同名追加 data kind | F1 |
| B23 | 实例落点规则无静态强制（孤儿实例检查从未实现，文档已按落点规则改写）；是否补检查待定 | `Elab/Trait.vuna` 的 `elabInstanceSig`（无来源模块判定） | 待定 |
| B24 | `Show` 的 `Int` / `Bool` 实例仍在 `Base.Show`（`Nat` 已按落点迁入 `Base.Nat`；`String` 按规则留 trait 模块） | `base/lib/Base/Show.vuna`；`base/lib/Base/Nat.vuna` | 后续 |
| B25 | `Int` / `String` 的类型身份仍由编译器内建表提供（`Base.Int` 存在但不声明类型；无 `primitive type` 声明） | `Intrinsics.typeIntrinsicNames`；`Elab/Prelude`；`Codegen` | 研究（是否上移） |
| B29 | 显式 trait 约束只支持顶层签名（`where` / `let`、`axiom`、trait 方法、构造子 / 记录字段都不接受 `C a =>`） | `Frontend/Parser.rejectCtxSuffix`；`test/corpus/traits/99_explicit_*_rejected` | F4 |
| B30 | 无泛型 `Hashable` / `deriving Hash`；无有序持久容器（`HashMap` / `HashSet` 只覆盖 `String`，`IntMap` 只覆盖 `Int`） | `base/lib/Base/{HashMap,HashSet,IntMap}.vuna`；[stdlib.md](stdlib.md) 的容器边界 | F4（容器） |
| B31 | 容器 `Show` / `Interp` 实例未内置（`${xs}` 需先有实例）；原「实例体精化慢」的阻塞 2026-11 复测已不可复现（List/Maybe/Pair/Result 加 `deriving` 与基线同），现在只差补实例 | `base/lib/Base/{List,Maybe,Pair,Result}.vuna`；`Elab/Trait.elabInstanceBodies` | 后续 |
| C07 | 擦除位的作用域护栏按约定跳过擦除实参，未对擦除位置做完整 de Bruijn 校验 | `Codegen/Erase.checkAllDefScopes`（`TApp` 的擦除实参只查函数位） | 待定 |
| D17 | `main` 的展示只覆盖 `Int` / `Nat` / `String` / `Bool`；任意类型展示需要运行时 `Show` 证据 | `Codegen/Term.mainShowForName`；[limits.md](limits.md)「main 与 IO」 | F3 |
| D21 | 完整 FFI 未做：无回调 / GC root / pin、无 C 头文件解析、无字符串双向可变共享 | [primitives.md](primitives.md) §10；[limits.md](limits.md)「受限 FFI」 | M35 |
| D22 | 无依赖 multiplicity / multiplicity 多态 / 线性箭头 / 借用 / 一次性续延；`ST` 动作本身仍可复制（无线性箭头线程化动作内部值） | `Elab/Usage.vuna`；`base/lib/Base/ST.vuna`；[qtt.md](qtt.md) | 后续 / F3 |
| D23 | `+ - * /` 只有 Int/Nat 的类型定向特化，无通用 `Num` / `FromInteger`；用户自定义数值类型不能重载字面量与算术 | `Elab/Term/Impl.specializeArith*`；[operators.md](operators.md) | F4 / 后续 |
| D24 | Nat 字面量在编译期展开成 `Zero` / `Succ` 链（无惰性 `TNat`）；**Nat** 字面量模式（`case n of 0 =>`）不支持（Int/String 字面量模式已支持） | `Elab/Term/Impl.natLitTerm`；[limits.md](limits.md)「Nat 与 Int」 | 后续 |
| D25 | Int→Nat 迁移只覆盖 Base 公开度量与必要消费点；`compiler/` 内部 level/meta/fuel/span/arity 与工具链多数内部字节计数仍 Int，`Base.IO.print` / `writeFile` 返回值也仍 Int | [limits.md](limits.md)「Nat 与 Int」；`lib/` 中剩余的 `strLength` 计数 | 后续 |
| D27 | 擦除依赖续延的运行时表示缺失：签名索引 `Eff` 的续延域 `res op` 在 OCaml 里不可命名（codegen 渲染成 `unit`），数据版 free monad 的 `bind` 触发终止性检查，Type-1 行编码 codegen 损坏 | [effects.md](effects.md) §5、§6 | F3 |
| D28 | `base` 声明了 `unsafe`，但没有机制约束「仅信任点（`Base.IO.runIO`、`Base.ST.runST`）使用」 | `base/vuna.toml`；`base/lib/Base/{IO,ST}.vuna` | 后续（F3 / QTT） |
| D32 | transformer 固定以 `IO` 为基座（`StateT s a` 而非 `StateT s m a`）：record 参数统一按 `Type` kind 降级；顶层签名 / 实例头里的自由隐式变量 kind 只按「被应用次数」推断，不从构造子 kind 反推 | `Elab/Sig.quantifyTopKinds`、`Elab/Trait.instanceTeleOf`；[effects.md](effects.md) §3.2 | M37 后续（F3 前置） |

## 工具、构建与验证

| ID | 仍未成立的事实 | 证据 | 归属 |
| --- | --- | --- | --- |
| B28 | `Lint` / `Index` 的 `Expr` 遍历保留兜底分支（Lint `_ => []` / `_ => False`，Index `_ => acc`）；新增 AST 节点若漏补递归会静默丢子树（M31.3 的反引号 / section、M36 的 `EInterp` 均已显式补） | `lib/Vuna/Lint/Rules.vuna`（`walkExpr` / `exprMentions`）；`lib/Vuna/Index/Scan.vuna`（`refsInExprGo`） | 后续 |
| C23/C39 | 测试无超时：`test/run-tests.sh` 无按章节 timeout、`vuna test` 无单测超时；`vuna test` 仍串行；夹具靠 glob 枚举、章节数只是注释，没有覆盖 / 计数断言 | `test/run-tests.sh`；`lib/Vuna/TestRunner.vuna` | 待定 |
| C32 | 缓存载荷仍是 OCaml Marshal（无显式自描述编码格式）；无 elab 级磁盘缓存（现有 iface / check / split / split-units / AST）；`VUNA_CACHE_MTIME` 默认关 | `Vuna.Compiler.CacheFormat`、`Driver/Iface`、`Driver/Compile`；[cache.md](cache.md) | 后续（序列化格式 / elab 磁盘缓存） |
| C37 | 接口摘要的三个残余：① 擦除位置残留未解 meta 仍靠包段 `(idx+1)<<30` 重编号；② LSP-only 冷启动写回的单模块 iface 哈希与整包 check 可能略有差异，靠首次整包重写自愈；③ REPL 每条表达式仍重读 manifest / iface | `Driver/Cache`、`Driver/Dt`、`Loader/Flatten`；[cache.md](cache.md) | M34.6（后续） |
| C38 | LSP codeAction 只有 lint quick fix：无 rename、无 case split、无 command 形式；codeAction 内嵌的 `diagnostics` 只带 `code` | `lib/Vuna/Lsp/Query.codeActionsFor`；[tooling.md](tooling.md) §2 | 后续 |
| D29/D31 | 检索与类型名解析是 parse 级：不做实例 / 隐式参数 / 依赖相等 / 类型别名展开，无语义级检索（CLI 无 `--semantic`）；短名歧义回退源码短名，不按 import 闭包规范化 | `lib/Vuna/Search/Query`（`typeNameMap` / `canonName`）；[api-docs.md](api-docs.md) §3.2 / §3.3 | 后续 |
| D30 | docstring 覆盖未全仓化（仅 `base/` 部分模块）；`vuna doc --check` 为 opt-in，未接 `nix flake check`；`-- ^` 尾随 doc、成员级 `--check`、多页 / HTML 站点未做 | `lib/Vuna/Doc/*`；[api-docs.md](api-docs.md) | 后续（按模块迁移） |
| D33 | 运行时错误只有定义级位置：无表达式级 span、无局部变量值、无断点（无 DAP）；`ocamlopt` 内联会把抛错点归到调用者帧；非入口单元顶层初始化的异常不在捕获范围 | `Codegen/Term`（`dtDefLocTable` / `dtRuntimeWith`）；[debugging.md](debugging.md) §2 | 后续（真正调试器另立项） |
| D34 | `Base.Debug.trace` / `traceShow` 以 `unsafe` 的 `runIO`（`prim_eprint`）实现：纯代码里引入调试副作用，无类型 / 能力层约束 | `base/lib/Base/Debug.vuna`；[effects.md](effects.md) §8 | 后续（QTT / 正式 trace 效应） |
| D35 | `vuna run` 只执行默认 `.output/bin/<包名>`（无 `--out`；workspace 多可执行包须显式 `--package`）；REPL 剩余缺口：文件 / 模块名补全、括号粘贴、窗口 resize 重绘、多行单元持久化历史、`:browse` 首次仍可能触发索引重建 | `lib/Vuna/{Run,Repl}.vuna`、`lib/Vuna/Repl/*.vuna` | 后续 |
| E01 | 无托管 CI：只有本地 `nix/ci.sh` 封装 flake check（仓库托管在 GitHub，但没有 Actions / 任何 CI 配置） | `nix/ci.sh`；仓库无 CI 配置文件 | 待定 |
| E03 | `result*` out-link 可过期（手工指向某次构建），文档只能提示重建 | `nix build ... --out-link` 的语义；[limits.md](limits.md)「编译模型与产物」 | 待定 |
| E04 | TCB 只有黑名单 + 闭包数量断言（`seed-count.txt`），没有完整 allowlist | `nix/tcb-check.sh`；`nix/seed-count.txt`；`nix/checks/seed-selfhost.sh` | 待定 |
| E06 | seed rotation 的替换步骤非原子：校验通过后 `rm -rf seed && cp -r` | `nix/seed-rotate.sh` | 待定 |

## 相关阅读

- 方向、阶段与未来轨道：[roadmap.md](../roadmap.md)
- 用户可见边界：[limits.md](limits.md)
- 类型系统 / Core / 效应 / 缓存等实现参考：见 `AGENTS.md` 的「文档导航」