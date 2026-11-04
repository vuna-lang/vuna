# DT 与 HM 的能力落差（dt-parity）

本文是**历史证据表**，不是计划：记录「要让 DT 取代 HM，DT 还缺什么」，是
[docs/roadmap.md](../roadmap.md) 的阶段证据；**当前阶段状态与阻碍以 roadmap 的「阶段状态总览」为准**。计划见 roadmap，DT 语义见
[dt.md](dt.md)，设计边界见 [docs/dt-core.md](../dt-core.md)。

**口径**：vuna 无发布、无外部用户，全部源码都在本仓库内，所以每项都是「**取代时必须在新
路径里等价提供的能力**」，不是「为兼容旧用户而保留的负担」。「用量」既是「DT 要写自己时
必须能吃的量」，也是「不改语言就得改写的量」。统计对象 `compiler/lib`（20 文件 11347 行）、
`base/lib`（12/485）、`lib`（13/4565），口径与脚本见 `.local/audit-a/stats/stats.sh`
（awk/grep，近似值；`.local/` 被 gitignore，审计产物只在本地工作区，不在仓库内）。

## 1. 缺口总表（按阻断度排序）

| # | 能力缺口 | 当前行为 / 错误文案 | compiler/lib | base/lib | lib | 归属 |
|---|---|---|---|---|---|---|
| 1 | ~~lambda 形参无条件擦除~~（含 lambda 体与 `case` 分支里的闭包） | **M18.5 已修复**：统一判据 `Elab.erasedBinder`——隐式 binder 恒擦除，显式 binder 仅宇宙域擦除；反例 `07_lambda` / `09_runtime_type` / `18_lam_type_used` | 739（691 含具名参数） | 18 | 104 | M18.5（已完成） |
| 2 | 无签名顶层定义 | `Elab.elabBodies`：`DT: expected a type signature for <name>` | 1083 / 1649 defs | 0 / 85 | 574 / 710 | M23（签名工具） |
| 3 | ~~多 clause 函数~~ | **M19 已实现**：合成单个 lambda + case 表达式树（标准模式矩阵） | 399 名 / 978 行 | 24 / 51 | 123 / 266 | M19（已完成） |
| 4 | ~~方程左端模式~~（构造子/字面量/列表） | **M19 已实现**：随多 clause 一起，模式矩阵展开 | 832 defs（单 clause 433） | 36 | 302 | M19（已完成） |
| 5 | ~~`let` 表达式~~（`where` 块 desugar 成 `ELet`） | **M19 已实现**：脱糖为 `(\\x => body) e` | 296 | 4 | 189 | M19（已完成） |
| 6 | ~~`case` 在推断位~~ | **M19 已实现**：元变量作期望类型 | 132 | 2 | 29 | M19（已完成） |
| 7 | ~~`case` 嵌套构造子模式~~ | **M19 已实现**：改写成内层 case | 410 alts | 1 | 91 | M19（已完成） |
| 8 | DT prelude 的容器与 IO 原语 | `DT: unknown name <name>` | List 1064、Pair 1845、Maybe 65、Result 175；print 42、readFile 13、exit 9 | 79/30/17/18；5/5/5/5 | 132/286/27/21；48/11/8 | **M22.2**（`str*`/`prim_*` 已进 prelude；容器来自 base，`String`/`Map`/`Sort` 探针仍失败） |
| 9 | ~~`==` / `/=` 只对 Int~~ | **M19 已实现**：隐式类型参数 + 精化期按实参类型特化（`bi_eq_str` 等）；**M29 收口为证据驱动**——只有 Int/String 内建特化或 `Eq` 证据（字典/`deriving`/约束实例），删除泛型结构比较兜底，无实例/函数相等在 check 期报错 | 155 处字符串比较 | 0 | 52 | M19 + M29（已完成） |
| 10 | ~~`case` 只接受归纳族~~ | **M19 已实现**：Bool 降级 if，Int/String 降级 if 链（需兜底） | 4（Bool 分支） | 0 | 0 | M19（已完成） |
| 11 | 非结构递归（算术递减 / fuel 式） | `Elab.Termination.checkTermBody`：`DT: cannot prove termination of <f> ...` | 41（`Elab` 14、`Core` 13、`Loader` 5、余 9） | 3 | 20 | M19 风险项 |
| 12 | ~~单文件~~：无 `import` / `--root` / `data Foo a` | **M20 已实现**：复用 Loader（`loadProgramRaw`）、参数化 `data`、签名类型变量隐式量化。剩余包目录归 M22.1 | 20 模块头 / 64 import | 12 / 33 | 13 / 64 | M20（已完成） |
| 13 | `main` 只能是 Int/String/Bool，无 `main : IO a` | `Codegen.Term.mainShowErr`（原 `CoreCodegen`）：`DT: main must return Int, String or Bool (M13 limitation)` | 两入口均 `main : IO Int` | — | — | M21（部分：已落地） |
| 14 | ~~`record` 声明 / 字段访问 / 更新 / 模式~~ | **M19 已实现**：精化前统一降级成单构造子 data（`Elab/Records.vuna`，原 `DtRecords`），构造子名 `Mk<R>` | 1 声明、14 构造、4 字段读取（另有 `fmt/` 夹具） | 0 | 0 | M19（已完成） |
| 15 | ~~`deriving`~~ | **M19 已实现**：展开成等价 instance（`Elab/Derive.vuna`，原 `DtDerive`），生成 Show/Eq/Ord 方法体 | 1（`Loader.ExportEntry`）+ `traits/` 13 个夹具 | 0 | 0 | M19（已完成） |
| 16 | `do` 块 | `Elab.Term.inferE` EDo：`DT: do blocks are not supported yet (M19)` | 0（`compiler/app/Main.vuna` 1 处） | 0 | 1（`app/Main.vuna`） | M21（部分：本阶段的投影工作） |
| 17 | ~~隐式索引 binder 一律擦除~~ | **M18.5 已修复**：隐式 binder 仍恒擦除（这是正确语义——隐式实参由精化器插入），但**显式索引 binder** 恢复参与运行时表示 | — | — | — | M18.5（已完成） |

第 1 项曾是该表唯一的 **bug**，M18.5 已修、第 17 项随之收敛；**M19 完成第 3–7、9、10、14、15 项**。第 2 项是**迁移工作量**而非语言缺陷（§5 ②）；第 8/13/16 项是「编译器本体不可能用 DT 写」的硬边界——effectful 内建与 `main : IO a` 已在 M21 落地，`do` 的 trait 投影归 M21，容器 / `String` / `Sort` 归 M22.2。第 14/15 项**保留并补齐**——它们有 `fmt/` 与 `traits/` 夹具覆盖（决策见 roadmap「决策变更」）。

**M18.6 的表示层改动不在本表内**：它不加能力、不改行为，只把 `erased : Bool` 换成三值
`Rig`、`TType : Int` 换成不透明 `Level`（见 [dt-core.md](../dt-core.md) §24）。

## 2. 「不可绕」与「可绕」

决定阶段排序的不是缺口数量，而是**能否不改语言、只改写源码绕过**。

- **不可绕**（必须补语言或 codegen）：`lambda 形参擦除`（1）——既报错又静默错编译，捕获
  上游状态的闭包**没有替代语法**，顶层命名函数只能救无捕获的少数；`let` + 推断位 `case` +
  嵌套模式（5/6/7）——覆盖最主流的三类写法（296 / 132 / 410），是书写风格本身；多 clause +
  方程模式（3/4）——改写成 `case` 是纯机械操作，但改写量与「重写编译器」同量级，故终态
  决策是**保留语法并实现**；内建容器与字符串/IO 原语（8/9/13/16）——连 `strFromInt` 都要
  自带，等价于用 DT 重写 `base/`，且没有 IO 就无法表达入口的 `main : IO Int`；fuel 式
  递归（11）——`Core.force` 是编译器心脏，41 处算术递减过不了结构递归检查，属 M19 风险项。
- **可绕改写**（不需补语言，改写成本可控）：`do`（16）→ 手写 `bind` / `>>=`（2 处入口）；
  隐式索引擦除（17）→ 改显式 `(n : Nat)` binder（实测通过，但索引会变成运行时字段）。
  `record`（14）与 `deriving`（15）**不在此列**：它们是终态保留的语言特性，DT 侧必须补齐
  （`deriving` 在 DT 的自然形态是生成 instance，复用 M15 的实例搜索）。

## 6. 索引精化的能力边界（M24.5 实测更新）

要判断「编译器本体能否用 DT 重写」，关键不是 DT 有多少语法，而是**精化器能在多大范围内
给出索引等式**。本节是 2026-11（M24.5）的实测结论，每行都有可复现夹具；**M29 更新了
依赖索引取值 / 隐式值参数 / 构造子部分应用三项**（见 §6.1 末行与 §6.3）。

### 6.1 能力表（M24.5 后；依赖索引行按 M29 更新）

| 形态 | M24.5 前 | M24.5 后 | 说明 / 夹具 |
| --- | --- | --- | --- |
| `wkVar : Var n -> Var (Succ n)` | ✅ | ✅ | 弱化，索引只往后推一位 |
| `wkTerm : Term n -> Term (Succ n)`（穿过 binder） | ✅ | ✅ | 递归时上下文变 `Succ (Succ n)`，goal 仍单一形参 |
| `subst : Term (Succ n) -> Term n -> Term n`（穿过 binder 时 lift 目标项） | ✅ | ✅ | `interp` 可求值；这是「DT 能写编译器」的关键正面证据 |
| `vhead : Vec a (Succ n) -> a` / `idv : Vec a n -> Vec a n` | ✅ | ✅ | `case` 打在被索引族本身，goal 索引随分支精化 |
| `get : Env n -> Fin n -> Nat` | ✅ | ✅ | 取出**不依赖索引**的值 |
| `rep : (k : Nat) -> a -> Vec a k` | ❌ `expected k, got (Zero)` | ✅ | **scrutinee 反射**：`case` 打在裸 `Nat` 形参上时，把 scrutinee 的值与构造子结果值合一（`dt/46_rep`） |
| `lookupEnv : Env n -> Fin n -> a`（只写 `ECons` 分支） | ❌ `missing ENil` | ✅ | **不可达分支按上下文省略**：进 `ENil` 分支时 `n ↦ Zero`，于是 `i : Fin Zero` 是空族，分支不可达；覆盖率允许省略（`dt/47_lookup_env`） |
| `plusZero : (n) -> Eq (plus Zero n) n` | 未测 | ✅ | **定义性相等**：`plus Zero n` 经 delta + case 归约到 `n`，一个 `Refl` 收尾（`dt/48_eq_defeq`） |
| `plusZeroR : (n) -> Eq n (plus n Zero)`（归纳 + `cong`） | ❌ | ✅ | 反射把 `Succ k` 分支的 goal 精化成 `Eq (Succ k) (Succ (plus k Zero))`，再用归纳假设 + `cong`（`dt/49_eq_induction`） |
| 值级 `Eq` 的 `sym` / `trans` / `subst` | 部分 | ✅ | 全部靠 `case Refl` 的索引合一（`dt/50_eq_transport`） |
| Type 级 `cast : Eq a b -> a -> b` / 索引级 `castLen` | ✅ | ✅ | `Eq` 的隐式族参数解成 `Type` 时即类型之间的等式（`dt/50_eq_transport`） |
| `append : Vec a n -> Vec a m -> Vec a (plus n m)` | ❌ `expected (Zero), got m` | ✅ | **旧文档的 ❌ 是错的**：分支精化 + `plus` 的定义性相等已经足够（`case xs of Nil => ys; Cons x rest => Cons x (app rest ys)`） |
| 取出**依赖索引**的值（`Ctx n -> Fin n -> Tm n` 形态） | ❌ | ❌ | M29 前：递归步拿到的是 `Ctx n'`（不是 `Ctx (Succ _)`），要「按位置变化的类型族」。**M29：✅ 用 Tarski 式存在式**（`data Ty` 运行时类型码 + `Tm : Ty -> Type` + `data Some where MkSome : (t : Ty) -> Tm t -> Some`，lookup 返回 `Some`）——`dt/63_dep_lookup`；无存在式的负例 `dt_err/46_lookup_no_sigma`。泛型 Σ 的值级构造仍 ❌（F4，`dt_err/45_generic_sigma_runtime`） |

### 6.2 M24.5 修掉的实现缺陷

三处都在 `Elab`，夹具见 `test/corpus/dt/46..50` 与 `dt_err/36..38`：

1. **scrutinee 反射**（`elabConAlt` 新增 `reflectScrutinee`、`ctorValueIn`）：旧实现只把构造子的
   **结果索引**与 scrutinee 的索引合一；族没有索引（裸 `Nat`）或包装族时拿不到任何等式。现在
   在索引合一之后，把 `evalCtx ctx scrutTerm`（只对 `NVar` 且 spine 为空的中性变量）与
   构造子结果值 `VCon c [telescope 值]` 再合一一次，refs 同时喂 `refineValue expected` 与
   `ctxRefine`。Bool / Int / String 的 case 走各自专用降级路径，不受影响。
2. **分支可达性**（`checkCovered` 的 `branchReachable`）：两层判据——索引合一失败（M14 既有），
   或分支 telescope 绑定 + 合一后**分支上下文里有 binder 的类型是空归纳族**（如 `Fin Zero`）。
   任何一层判不可达都允许省略该分支。空族判定只在**索引全刚性**（构造子/字面量/宇宙）时生效，
   索引里出现中性项（`Fin (plus x Zero)`）时保守判非空、仍要求写分支。写出的不可达分支仍然
   报错：索引不可达给 `this branch is impossible (index constraints are unsatisfiable)`，
   上下文含空族给 `this branch is impossible (its context contains an empty inductive family)`。
3. **隐式族参数版 `Eq` 构造**（`inlineSolvedMetas`）：`data Eq : {a : Type} -> a -> a -> Type`
   配 `Refl : {a : Type} -> (x : a) -> Eq x x` 时，结果类型 `Eq x x` 里的隐式族参数由检查器插成
   元变量、检查期解成构造子自己的 `a`。旧实现把这个 level 形态的解留在 `dtCtorType` 里，使用点
   按另一份上下文求值就变成悬空变量（`constructor Refl: type mismatch: expected Nat, got a`）。
   现在构造子类型 / 族 kind / 签名在登记前都把**检查期已解**的元变量内联成具体项。

> 性能约束：可达性只在**没写出来的构造子**上计算（写出的分支直接跳过）。否则每个 case 的每个
> 构造子都要模拟一次分支，`vuna check .` 会从 ~90s 掉到 400s+。

### 6.3 剩余边界（M29 终态；未关闭项注明归属）

1. **隐式值参数（M29 已支持，B09 关闭）**：`{x : a}`（域是类型 / 索引 / 证明域）可用，
   隐式 binder 恒擦除（`Rig0`），值只进类型 / 索引 / 证明位置；**子句体不能按名字引用**
   隐式 binder，隐式模式 `{p}` 与 `auto` / 隐式等式搜索归 **F4**。证明辅助函数因此不再
   手写全部显式参数（`dt/61_implicit_values`）；负例 `dt_err/42_implicit_value_domain`、
   `dt_err/43_implicit_unnameable`。
2. **构造子部分应用（M29 已支持，D12 关闭）**：未饱和构造子引用/应用做 **η 展开**
   （`Elab.Meta.etaCtorTerm`），`cong ... Succ ...` 与「裸构造子当值传递后再应用」都
   可用（`dt/60_ctor_eta`）；不再需要 lambda / 包装函数绕过。
3. **空族判定的保守性**：见 §6.2 第 2 条，索引含中性项时不判空（M28 起判据收成
   `BranchVerdict`，行为不变）。
4. **type-as-value（M29 已定：不引入 type codes）**：Type 级等式走**擦除的 `Eq` 证据 +
   `cast` 组合子**（`dt/50_eq_transport` 的 `cast` / `subst`）；把类型放到**运行时位置**
   仍被擦除检查拒（`CG_TypeUsedAtRuntime` / `CG_TypeLevelBindingRuntime` /
   `CG_TypeLevelNameRuntime`），负例沿用 `dt_err/45`。显式 `Type` binder 按
   `rigOfBinder` 擦除，所以「类型当显式实参」（如 `Refl2 Int`）可行，但它不是
   type-as-value。type codes 归 F4 研究项（决策记录见 roadmap「决策变更」）。
5. **没有隐式等式搜索（M29 未做）**：等式仍要显式传参（`Eq x y -> ...`），没有
   `auto` / `unify` 搜索——与隐式模式一起归 **F4**（M29 只做隐式值参数）。
6. **依赖索引值取回（M29 用 Tarski 式存在式关闭，B13）**：`Ctx n -> Fin n -> Tm n` 不再
   需要「按位置变化的类型族」——把「类型码 + 依赖值」藏进普通存在式 `Some`，lookup
   返回 `Some`（`dt/62_sigma_basic` / `dt/63_dep_lookup`）。**泛型 Σ 的值级构造仍是
   边界**（`Sigma : (a : Type) -> (a -> Type) -> Type` 的字段是类型族，类型不能依赖
   运行时值），归 **F4**；负例 `dt_err/45_generic_sigma_runtime`。
7. **类型级函数的 codegen 缺陷（M24.6 已修）**：`sel : Nat -> Type` 这类返回 `Type` 的
   函数曾因 `isTypeLevelDef` 只看裸 `Type` 被判成运行时定义，生成的 OCaml 出现未定义
   标识符（`v_Int` / `v_String`）。M24.6 改用 `isTypeForming`（`... -> Type` Pi 链整体
   擦除），正例 `dt/51`/`52`、负例 `dt_err/45`；细节见 [dt-core.md](../dt-core.md) §6.4。

### 6.4 对计划的含义（更新）

- **「用 DT 重写编译器」不是幻想，但也不是照抄**。弱化、替换、按族 case、`rep`/`lookupEnv`/
  `append`、归纳证明（`plusZeroR`）都已可写；不再是「卡在跨索引等式」。
- M24.6 第三级（`Env : Nat -> Type` + `Fin` total lookup）**M29 用 Tarski 式存在式关闭**
  （`data Ty` 运行时类型码 + `Tm : Ty -> Type` + `Some`）：lookup 返回存在式，不再需要
  「按位置变化的类型族」（`dt/63_dep_lookup`）。**泛型 Σ 的值级构造**仍归 F4——M29 决策
  不引入 type codes（§6.3 第 4/6 条），所以「类型依赖运行时值」不在此里程碑解决。
- **不要先动 Term 层**：实测收益集中在 `Env`/`lookup`/弱化/替换这一层，把 `Term` 的 Pi/Lam
  结构整体索引化成本极高且收益递减。
- 三个「看起来诱人但不划算」的项（拓扑序见证、元变量上下文索引化、终止性 `Acc` 见证）
  的记录见 [dt-core.md](../dt-core.md) §6.3。

> **口径提示**：§6.1 的结论来自 M24.5 的一轮实测：`test/corpus/dt/46..50`、`dt_err/36..38`
> 与 `_scratch/` 实验（`d_append`、`b_fin_ctx`、`l_rep` 等，原始审计在 `.local/audit-c/`，77 个
> 夹具）。早期报告里的 `append` ❌ 已在 M23/M24 修复但文档未更新——引用旧表前请先复核夹具。
> 另外，早期有一份报告认为「`subst` 也写不出来」，复核后发现是那份夹具漏了穿过 binder 时的
> `shift u`（`subst` 的目标项必须先弱化），修正后通过。
## 相关阅读

当前阶段状态与阻碍：[roadmap.md](../roadmap.md)（「阶段状态总览」）；DT 语义与设计：[dt.md](dt.md)、
[dt-core.md](../dt-core.md)；
限制与测试面：[limits.md](limits.md)、[testing.md](testing.md)；审计原始数据：
`.local/audit-a/REPORT.md`、`.local/audit-a/repro.sh`、`.local/audit-b/`。

