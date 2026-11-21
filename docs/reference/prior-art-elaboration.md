# 外部先例：Idris 2 与 Yaffle 的编译流水线与精化器

本文是对两个外部依赖类型语言实现的**只读调研**，用于对照 vuna 的 Core / Elab / IR 分层，
并为「哪些设计值得采纳、哪些差距是结构性的」提供证据。它不是 vuna 的设计文档：
vuna 的现状见 [compiler.md](compiler.md) / [core.md](core.md)，终态决策见
[architecture-target.md](../architecture-target.md)，未关闭缺口见 [debt.md](debt.md)。

## 1. 快照与方法

| 仓库 | 快照 | 说明 |
| --- | --- | --- |
| `idris-lang/Idris2` | `95c980fc52d0`（2026-11-20） | 稳定实现，含完整的 `TTImp` / `Core.Case` / 多后端 |
| `edwinb/Yaffle` | `05df1e82477e`（2025-02-19） | 新核心的实验仓库：自述「core 还有大量工作，暂不接受一般贡献」 |

调研方式：克隆到临时目录逐模块读（`Core/TT`、`Core/Unify*`、`Core/Case*`、`TTImp/*`、
`Compiler/*`），不依赖二手描述；§9 给出可复现命令。**外部快照会过时**：引用它们的结论时
以本节的两个 commit 为准，不要当作「上游现在的样子」。

## 2. Idris 2 的流水线

```text
.idr 源
 → Idris/Parser                 offside layout → PTerm（语法糖仍在）
 → Idris/Desugar                do / let / with / record / interface 糖 → TTImp
 → TTImp                        TT + 隐式参数 + 局部定义 + case 块 + as 模式 + 限定名 + proof search
 → Elaboration                  TTImp/Elab/*：check-infer + Core.Unify 合一批 → Core TT
 → Core TT                      Core/TT/Term.idr；CaseTree 由 Core/Case/CaseBuilder.idr 单独构造
 → CompileExpr                  Core/CompileExpr.idr：类型已擦除、显式 case tree 的 CExp
 → 后端流水线                   Compiler/Common.idr：Inline → LambdaLift → ANF → VMCode，按 UsePhase 截断
 → Chez / Racket / Gambit / RefC / Node / JS / VM 解释器
```

三处结构性决定值得记住：

1. **中间语言是独立语言**：`TTImp` 有自己的构造函数集合（`IPi` / `ILam` / `ICase` /
   `IImplicitApp` / `IPrimVal` / `IType` …），不是「AST 加几个字段」。前端只负责把表面语法
   降到它；`Core` 不知道前端存在。
2. **case tree 是独立数据类型**（`Core/Case/CaseTree.idr`）：`Case / STerm / Unmatched /
   Impossible`，且 **A-normal form**（只对变量 dispatch）。`STerm` 带 clause id 与 forced
   equality，因此「覆盖了哪条子句」「哪个分支不可达」都能从树上读出来。
3. **两棵 case tree**：`PMDef pi args ct rt pats`（`Core/Context.idr`）。compile-time 树保留
   0-quantity 参数供类型检查；run-time 树是 `Core/LinearCheck` + `Core/Check/Erase` 处理过的
   版本（`TTImp/ProcessDef.idr` 的 `getPMDef fc (CompileTime mult)` 与 `RunTime` 两次构造）。
   擦除不是 codegen 的附属，而是**模式匹配的一等阶段**。

后端侧另有两点：`UsePhase = Cases | Lifted | ANF | VMCode` 让「只要类型检查」与「要跑」共用
一条链；`ContextEntry = Coded ns bin | Decoded def` 让 TTC 接口**首次查找才解码**。

## 3. Idris 2 的精化流程

一句话：**双向检查 + 可推迟的合一 + 按失败原因分级重试的延迟精化**。逐项展开：

| 机制 | 落点 | 要点 |
| --- | --- | --- |
| 项按作用域索引 | `Core/TT/Term.idr` 的 `Term : Scoped` | 局部变量是 de Bruijn index **加擦除的合法性证明**（`IsVar`），越界引用是类型错而不是哨兵 |
| `Glued` 惰性对 | `Core/Normalise/Eval.idr` 的 `MkGlue fromTerm (Core Term) (Core NF)` | 精化返回「项或范式」，按需取；避免每次 quote |
| 合一 | `Core/Unify.idr` 顶层 `unify : UnifyInfo -> FC -> Env -> tm -> tm -> Core UnifyResult` | `Unify` 是 interface：`Term` / `NF` / `Closure` 都能合一；pattern unification |
| 推迟 | `Core/UnifyState.idr` 的 `MkConstraint FC withLazy env x y` | 约束记录 **blocking metavariables**，只有相关 meta 被解才重试 |
| guarded constant | `Def` 的 `Guess tm envb constraints` | 只在约束解掉后才升格为函数；未解时诊断能直接报「CantSolveEq」 |
| dot 约束 | `addDot` / `checkDots` | `IMustUnify` 的位置先造洞再加约束，收尾统一校验 |
| 延迟精化 | `TTImp/Elab/Delayed.idr` | 失败且错误可恢复 → 造洞并记下整个 elaborator 闭包；`DelayReason` 的 `Ord` 按「最可能给出有用报错」排序 |
| 推测与回滚 | `Core/Core.idr` 的 `branch` / `commit`，`processFailing` | 一个候选 = 一次 branch；失败就 `put` 回整份 Ctxt/UST/Syn/MD |
| 隐式 | `TTImp/Elab/App.idr`、`TTImp/Implicit.getToBind` | `_` 造 meta；`?` 与 `_` 的差别在「推断失败时是否退化成新绑定名」；unbound implicits 按依赖序绑定 |
| auto implicit | `Core/AutoSearch.idr` | 只有 goal 的 determining arguments 全定义时才敢搜，避免过早提交 |
| 线性 | `Core/LinearCheck.idr` | 精化后单独一遍，并**回头更新洞的类型**以反映用量；case block 的 multiplicity 交给这一遍 |
| 局部定义 / case block | `TTImp/ProcessDef.idr` | 都提升到顶层；1-quantity 传进局部定义时降为 0 |
| 全性 | `Core/Termination/*` + `Core/Coverage.idr` | 终止性（CallGraph / SizeChange=SCT / **Positivity**）与覆盖率分开记录；正性**在所有模式下都检查**（后续定义可能依赖它） |
| 求值 | `Core/Normalise*`（默认 CBN）+ 可选 `Core/SchemeEval` | scheme-eval 只是加速，不可用时回落 |

对 vuna 最关键的一条是**推迟**：它把「等式暂时判不出来」从错误变成状态，于是 dot pattern、
`rewrite`、record 更新、歧义消解、case block 都能共用同一套收尾机制，而不是各写一条绕过路径。

## 4. Yaffle 相对 Idris 2 改了什么

| 维度 | Idris 2 | Yaffle |
| --- | --- | --- |
| `App` | `App : FC -> fn -> arg -> Term` | `App : FC -> fn -> RigCount -> arg -> Term`（注释：`fn : (q x : a) -> t` 时 `q`） |
| case | 顶层 pattern-matching 定义 + 独立 `CaseTree` | **case 表达式进 core**：`Case : FC -> CaseType -> RigCount -> sc -> scTy -> List CaseAlt -> Term`；`CaseType = PatMatch \| CaseBlock Name`（区分来源是为了知道何时因「卡住的顶层函数」停止归约） |
| case scope | `ConCase tag (args : List Name) tree` | `CaseScope = RHS forced rhs \| Arg rig x (CaseScope (vars :< x))`，逐个绑定，注释说明「与 `Bind` 绑参数的方式一致、求值更自然」 |
| 中间层 | — | `Core/Case/Tree.idr` 的 `TCase / STerm / TUnmatched / TImpossible`，仍保留 clause id 与 forced equality，再 `mkTerm` 落进 `Term` |
| 擦除 | 用 `GlobalDef.multiplicity` + 两棵 tree | 用 `App` 节点上的 rig 递归 `rigMult`，`Meta` 的 spine 也逐个擦 |
| 值 | `NF` + `Glued`（`fromTerm` 布尔） | `Value : Form -> SnocList Name -> Type`，`Form = Glue \| Normal`（phantom index），`SpineEntry` 是 record（`loc` / `multiplicity` / `value : Core (Glued vars)`） |
| 定义形态 | `PMDef pi args ct rt pats` | `Function pi (compileTime : Term) (runTime : Term) (Maybe (List Clause))`——两棵**Term**，因为 case 已在 core |
| 独立检查器 | 无 | 有 `Core/Check/Typecheck.idr`（raw TT 的 `check` / `infer`），定位是「调试与将来从零复检精化产物」 |
| 分层契约 | 无正式禁令 | `CONVENTIONS.md`：`Core.*` 不得 import `TTImp/Idris/Compiler`；`TTImp.*` 不得 import `Idris/Compiler`；目标「`ttimp` 独立成包」 |
| 其它约定 | — | no `mutual`、一律前置声明；缩进保证 alpha 换名可做简单替换；`parameters` 块消除样板（暴露 bug 就修 bug）；`RigCount` 暂不 first-class；**目标增量检查而非批检查** |

Yaffle 当前缺口（同一份 `CONTRIBUTING.md`）：宇宙约束求解器未实现（`Core/TT/Universes.idr`
的 `checkConstraints = pure ()`）、`Core.mapTermM`、TTC 实例、type-directed conversion checker、
case block 的覆盖率检查、termination 测试、编译器层级收尾，自举列为「bonus」。

## 5. 三方对照

| 阶段 | Idris 2 | Yaffle | vuna（证据见 §6） |
| --- | --- | --- | --- |
| 前端 | `Idris/Parser` → `Idris/Desugar` | 同（近移植） | `Frontend/{Lexer,Cst,Parser}` → `Loader.{Fixity,Expand,Resolve}` → `Frontend.Rast.Bridge` |
| 精化输入 | TTImp（独立语言，糖已消失） | 同 | `Frontend.Rast`——**糖仍在**：pattern / record / where / do / 模板串 / 多 clause 都由 Elab 处理 |
| core | TT + 独立 CaseTree | TT 含 case 表达式 | `Core.Term`（含 `TCase`、`TMk` / `TProj` / `TRecUpd` / `TRecord`） |
| 擦除 | 独立 pass + 两棵 tree | 同（用 App rig） | `Lowering.Erased`（**同一 Term 类型的视图**：运行期下标归一 + `validateErased`） |
| 优化 / 决策 | `Compiler/{Inline,LambdaLift,ANF,VMCode}`，按 `UsePhase` 截断 | 同 | 全在 `Lowering.Program`（擦除、表示、内建内联、`++` 展平、Nat 降级、入口分类、SCC）+ `Ir.{Represent,Anf,Cps,Tail}` |
| IR | `CompileExpr`（CExp / NamedCExp） | 同 | `Vuna.Ir.*`：显式、带类型、well-scoped、无 meta，后端唯一输入，带 `Ir.Validate` 与 `Ir.Codec` |
| 后端 | `Codegen` record + `incCompileFile` | 同 | OCaml（`vuna-target-ocaml`，在种子闭包内）/ native / wasm **独立包**，经 `Driver.Target` 起 `vuna-target-<t>` 子进程 |
| 接口 / 缓存 | TTC（惰性解码） | 同 | `Driver.Iface` / `Driver.Cache`（比 TTC 多带源码 decls） |
| 自举 | 无冻结锚点（boot 版编译自身） | 列为 bonus | `seed/`（OCaml 生成物）+ rotation + stage1 == stage2 |

## 6. vuna 侧的差距（按结构性问题排序）

所有条目都能在本仓库里核实；`debt.md` 里已有编号的直接引用，不重复描述。

1. **等式不可推迟**。`Core.Conv.conv : HashMap String Term -> Sols -> Int -> Value -> Value ->
   Check Sols`：要么成功，要么立刻 `type mismatch`。字典 / 行成员目标另有 FIFO 队列 + epoch
   重试（`Elab.Types.ConstraintStore`，收敛固定 8 轮，见 EC-28），但**等式本身不排队**。
   后果是债务 B07（高阶合一只有空 spine 与 Miller pattern 完整）、CO-07（卡住 case 相等
   可能烧尽 conv 预算）、EC-40（索引精化不下钻 `VCase` / `VProj`）。
2. **没有 case tree 中间层**。多 clause 在语法层被 `Elab.Match.multiToExpr` 拆成
   `case` / `if` 链，可反驳性的「证据」没有结构化载体：覆盖率 / 可达性散在五处
   （`Elab.Case.BranchVerdict`、`Elab.Coverage.clauseCover`、`Elab.Match.familyCovered`、
   `Elab.Coverage.familyCtors`、`Elab.Term.Impl` 的 Bool/Nat/Int/String 专用路径），即 EL-24。
3. **精化状态是单体**。`Ec` 22 字段、解表三份真源（`ecSols` / `ecSolTbl` / `csSolsCount`）、
   15 处 setter 按位置重列字段（EC-31）；`ConstraintStore` 一个 record 兼待处理队列 /
   id 分配 / 重试表 / 解表计数 / 构造子索引完整性（EC-32）；
   `Elab/Term/Impl.vuna` 3.8k 行、签名带十几个参数与 fuel。
4. **擦除后 Core 只是视图**。`Lowering.Erased.eraseTerm : … -> Check Term` 返回仍是 `Term`，
   下游无法靠类型禁止「还有 meta」「还指向 Rig0」。`WhyErased` 那种「擦除原因」标记不存在，
   于是 C37（擦除位未解 meta 跨包段重编号）与 D27（未解 meta 漏插 cast）只能靠段号/启发式补。
5. **`check` 没有阶段上限**。`Driver.Dt.checkDtProgramOf` = `lowerProgramOf` + `checkUnitParts`；
   已不拼文本，但 lowering 与装配校验本身仍在 check 路径上（C49 记为「后续」）；
   同模块一次 check 被 parse 约两次（D88）。
6. **候选级快照缺失**。已有「单遍逐定义恢复」（`Elab.Driver.elabProgramErrors`，只有 body 阶段
   可恢复），但没有 per-candidate 的回滚：EC-09 明确记「上一候选的解表污染下一候选」；
   `perform` / `handle` 现在是三候选试错、失败抛第一个错（EC-14）。
7. **没有严格正性检查**（本文档调查中实测）。`Elab.Data.elabCtor` 只校验构造子结果头是本族、
   索引个数、字段的宇宙层级（`checkCtorFieldSorts`）；仓库内没有 positivity 标记或文档章节。
   见 `debt.md` 的 EL-26 与 §9 的探针。

## 7. 值得采纳的设计（分级）

### 7.1 架构级（会改到 Core / Elab 的契约）

1. **等式推迟（constraint + blocker + guarded constant）**。把 `conv` 的「判不出来」从错误变成
   状态：`conv` 返回 `(Sols, List Equation)`，`Equation` 带 env / lhs / rhs / blockers / span /
   收尾深度；收尾只对「确实没有进展」的等式报错，并优先报最早 / 最有解释力的一条。
   dot 约束作为同队列的一个 kind 一并进来。
   **消掉** B07 / CO-07 / EC-40 的近似，并为 dot pattern 与 `rewrite` 打开门（当前
   `frontend-syntax.md` 两者都是「等具体痛点」）。
2. **dispatch-only case tree 中间层**。`TCase` 只 dispatch 变量、`STerm` 带 clause id 与
   forced equality、`TUnmatched` / `TImpossible` 显式。由 `Elab.Match` 与 `Elab.Case` 共同产出，
   覆盖率 / 可达性 / 终止性 / 擦除分支形状读同一结构。
   **消掉** EL-24 的多口径；不可达分支第一次有可检查的载体。
3. **擦除后的 Core 变成一层类型**（newtype + 构造时校验），而不是返回同一个 `Term`。
   顺带引入 `WhyErased = Placeholder | Impossible | Dotted` 这样的原因位，
   **把** C37 / D27 的补丁换成语义位。
4. **`Stage` 枚举**（`Cases | Anamed | Ir | Text`）接在 `Driver.Dt` / `Driver.Compile` 上，
   `check` 停在 `Ir` 校验。**消掉** C49 与 D88 的一半。

### 7.2 实现级（局部、可独立落地）

- **`App` 一律二元 + spine**：vuna 已有 `TApp` 的 rig，但 `TCon` / `TMk` / `TRecord` 用
  `List (Term, Rig)`，另有 `flattenTermAppGo` 在补形状；统一后 evaluator / conv / erasure /
  codegen 都不必为 n 元节点写第二套。
- **TTC 式惰性解码**：`ModuleIface` 现在一读就全解码；惰性解码对 `vuna goal` / LSP 单文件
  路径是直接收益。
- **诊断的延迟优先级排序**：把 §3 的 `DelayReason` Ord 思路用到等式队列的错误选择上
  （歧义 > 记录更新 > case > rewrite），最可能的真实原因先报。
- **`CONVENTIONS.md` 式的层禁令**：`Core` 不 import `Elab` 我们已有（`[layers]`）；但 `Elab`
  层 26 个模块里有 22 个直接 import `Frontend.Rast`（连 `Elab.Types` / `Elab.Meta` 这类叶子也
  直接读 `Rast.Name`），这条禁令不成立。它不是洁癖：它决定「能否有第二种前端」。照 Yaffle 的
  方向，中间语言（已解析、糖已消失、名字是身份）应该是 Elab 的唯一输入。

### 7.3 明确不采纳

- `assert_total` / `partial` 逃生舱：`architecture-target.md` D1 已定不做。
- `Type : Type` / 一般 cumulativity：vuna 严格分层非累积（[type-system.md](type-system.md) §宇宙），
  Idris2 的 boot README 自己把 cumulativity 列为未完成。
- 把外部 Scheme 求值器接进类型检查器：破坏确定性、产物可复现与 TCB 边界。
- 「名字即身份」的字符串方案：vuna 债务根因第 1 条；外部的 `Resolved i` + `Array` 上下文
  是可取的方向（确定性分配，不动内容寻址）。

## 8. 候选调整（未决）

本节是**决策输入**，不是计划。任何一条被采纳时：

1. 若是终态方向的改变 → 写进 [architecture-target.md](../architecture-target.md) 的已决决策表
   （含理由与代价），并在提交信息里说明；
2. 若是缺口 → 登记到 [debt.md](debt.md)，带可复现证据；
3. 未被采纳的条目留在本文档，作为先例对照；不要复制进其它主题页。

按「收益 / 风险」排序的三条：

| 候选 | 收益（消掉的债务） | 代价 / 风险 |
| --- | --- | --- |
| 严格正性检查 | 补一致性缺口（EL-26）；当前可构造空类型居民 | 低：纯加法，判据可整段照搬 Idris2 `Core/Termination/Positivity.idr` 的 `nameIn` 思路；需先扫 base 的自引用形状 |
| `Ec` / `ConstraintStore` 拆分 + 名字身份化 | EC-31 / EC-32；让 `branch` 式快照与按定义增量可行 | 中：面广，但可机械分步（先拆 record，再在 Core/Elab 边界引入确定性 id） |
| 等式推迟 | B07 / CO-07 / EC-40 + dot / rewrite 的前置 | 高：贯穿精化器；需要先写决策（契约、错误选择、与字典队列的关系） |

## 9. 证据与复现

外部快照与模块：

```console
git clone --depth 1 https://github.com/idris-lang/Idris2   # 95c980fc52d0
git clone --depth 1 https://github.com/edwinb/Yaffle       # 05df1e82477e
```

Idris 2 的关键文件：`src/Core/TT/Term.idr`（`Term : Scoped`）、`src/Core/Normalise/Eval.idr`
（`MkGlue`）、`src/Core/UnifyState.idr`（`MkConstraint` / `Guess` / `DelayReason`）、
`src/TTImp/Elab/Delayed.idr`（`delayOnFailure`）、`src/Core/Case/CaseTree.idr`、
`src/Core/Termination/Positivity.idr`、`src/Compiler/Common.idr`（`UsePhase`）。
Yaffle 的关键文件：`src/Core/TT/TT.idr`（`App` 带 rig、`Case` 在 core、`CaseScope`）、
`src/Core/Case/Tree.idr`（`TCase` / `STerm`）、`src/Core/Evaluate/Value.idr`（`Form` phantom）、
`src/Core/Check/Erase.idr`、`CONVENTIONS.md`、`CONTRIBUTING.md`。

vuna 侧的对照点：`Core/Conv.vuna` 的 `conv` / `solveMeta`；`Elab/Types.vuna` 的 `Ec` /
`ConstraintStore`；`Elab/Match.vuna` 的 `multiToExpr`；`Elab/Case.vuna` 的 `BranchVerdict`；
`Lowering/Erased.vuna`；`Driver/Dt.vuna` 的 `checkDtProgramOf`；`Driver/Target.vuna` 的
`compileBackend`。

**严格正性探针**（当前 `vuna check` 接受，说明缺口成立）：

```vuna
-- 非严格正性 + 空族：能构造出空类型的一个居民
data Void : Type where

data D : Type where
  MkD : (D -> Void) -> D

get : D -> Void
get d = case d of
  MkD f => f d

bad : Void
bad = get (MkD get)
```

```console
nix run .#vuna -- check probe.vuna   # 当前 exit 0
```

对照：同一份形状在 Idris 2 会被 `Positivity` 检查拒绝。

## 10. 导航

- 想知道「改精化器要动哪些模块」：[compiler.md](compiler.md) 的 Elab 表 + [architecture.md](../architecture.md) §1；
- 想知道「Core 表示与合一今天的规则」：[core.md](core.md)；
- 想知道「擦除、IR 与后端边界」：[ir.md](ir.md) / [compiler.md](compiler.md)；
- 想知道「哪些缺口仍开放」：[debt.md](debt.md)（B07 / CO-07 / EC-31 / EC-32 / EC-40 / EL-24 / EL-26 / C49 / D88）；
- 先例本身的入口按 §9 的文件清单读，读 `TTImp/Elab/*` 与 `Core/Case/*` 时要整篇读，
  不要按符号搜索。
