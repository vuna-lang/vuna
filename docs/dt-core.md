# DT 核心类型论与精化器设计（M13–M14）

本文是 M13/M14 的设计稿与实现边界说明。M13 在 HM 路径之外新增一条**独立、显式
opt-in** 的依赖类型（DT）子集路径：Core TT + NbE + 双向精化器 + 擦除型 codegen；
M14 在同一路径上加入索引归纳族与依赖模式匹配（见 §11）。HM 路径（interp / typed /
split）语义与产物保持不变。

## 1. 范围

- 新增模块：`compiler/lib/Vuna/Compiler/Core.vuna`（core 语法/值/NbE/转换）、
  `compiler/lib/Vuna/Compiler/Elab.vuna`（双向精化器）、
  `compiler/lib/Vuna/Compiler/CoreCodegen.vuna`（擦除 + OCaml 生成）、
  `compiler/lib/Vuna/Compiler/Dt.vuna`（单文件 facade）。
- 入口：`vuna compile --dt` / `vuna check --dt` / `vuna interp --dt`。
- 只支持单文件：不经过 Loader、不支持 `import`、不支持包模式、不接入
  `build` / `split` / `seed`（M17 前 roadmap 允许 split 回退）。

**非目标（M13 不做）**：cumulativity / universe polymorphism、索引归纳族与依赖模式
匹配（M14 已落地，见 §11）、接口/实例搜索/洞目标显示（M15）、终止性与覆盖性（M16）、
完整擦除分析（M16）、IO/effects（M19）、跨模块 import、`rewrite` / `with`。

## 2. Surface 子集

```vuna
-- 类型
Type            -- Type 0
Type 1          -- 任意非负字面量层级；EApp (EVar "Type") [EInt n]
A -> B          -- 匿名显式 Pi（沿用现有 `->` 中缀编码）
(x : A) -> B    -- 显式命名 Pi
{x : A} -> B    -- 隐式 Pi

-- 项
x | 42 | "s" | \x => e | f a b | if c then t else e | _

-- M14 追加
data F : <kind> where      -- 索引归纳族；kind 的箭头个数 = 族参数 arity
  C : {x : A} -> ... -> F i j
case e of                  -- 依赖模式匹配；只在 check 位置
  C x y => body
  _     => body
```

- 定义必须有签名：`f : T` 紧跟 `f p1 ... pn = body`；`pi` 只能是变量（`_` 视为
  不使用的变量）。无签名、多子句、非变量模式都报错（多 clause 仍是限制，见 §19）。
- 洞 `_` 只在 check 位置合法；最终仍有未解元变量则报错。
- M13 只支持上面的子集；M14 追加 `data F : <kind> where ...`（带索引族）与
  `case e of alt...`，详见 §12。`let` / `where` / `do` / 记录 / trait 仍不支持，
  诊断里写明后续阶段。

## 3. Core TT

```vuna
data Term where
  TVar    : String -> Int -> Term      -- 名字（打印/生成用）+ de Bruijn index
  TMeta   : Int -> Term
  TGlobal : String -> Term
  TType   : Int -> Term
  TPi     : String -> Bool -> Term -> Term -> Term  -- 名字、是否隐式、域、余域
  TLam    : String -> Bool -> Term -> Term          -- 名字、是否擦除、体
  TApp    : Term -> Term -> Bool -> Term            -- 函数、实参、实参是否擦除
  TInt / TStr / TBool / TIf
```

- 绑定是否擦除由精化器按「绑定域的值是不是宇宙」决定：`a : Type` 擦除，
  `x : a` 保留。codegen 只读标志，不再需要类型信息。
- 值：`VType` / `VPi` / `VLam`（带 `Closure`）/ `VNeutral` / `VMeta m spine` /
  字面量 / `VIf`；neutral 头是 `NVar name level spine` 或 `NGlobal name spine`。
- **M14 扩展**：`Term` 增加 `TCon` / `TCase`（+ `CaseAlt`），`Value` 增加
  `VCon` / `VCase`（+ `VCaseAlt`），`force` / `quote` / `conv` 等同步覆盖；
  详见 §13。

## 4. NbE 与定义性相等

- `eval`：call-by-name（closure + 环境），全局保持 opaque neutral。
- `force`：展开已解元变量，并按需 **delta 展开**有定义的全局（步数上限 512，
  到限返回 stuck，不 panic）；这样类型别名与 `main = id Int 42` 能归约。
  M14 起同一 fuel 也用于推进卡住的 `VCase`（§15），并因此允许递归定义。
- `conv`：结构比较 + Pi/Lam 的 eta（fresh var）+ neutral spine 逐项比较；
  元变量求解满足：一阶（只接受空 spine）、闭合解（解中不含局部绑定变量）、
  occurs check。失败返回 `type mismatch: expected X, got Y`。
- 明确限制：带局部变量的解与高阶元变量在 M13/M14 报错，M15 引入 metavariable
  context 后补齐。
- 宇宙规则：非累积。`Type i : Type (i+1)`；Pi formation 取 `max(i, j)`；
  `Type i` 与 `Type j`（i≠j）不相等，因此 `Type 0 : Type 1` 合法而
  `bad : Type; bad = Type` 报类型不匹配。

## 5. 精化器规则

| 表面形式 | 规则 |
| --- | --- |
| `EVar x` | 局部：`TVar`（类型取上下文）；全局：`TGlobal`（签名域）；找不到报 unknown name |
| `_` | check：新建元变量；infer：报错 |
| 字面量 | `Int` / `String` / `Bool` |
| `\x => e` | 只支持 check：逐层消费显式 Pi；遇到隐式 Pi 自动绑定 |
| `f a b` | 推断 `f`，每个显式实参前插入隐式元变量，实参按域 check |
| `if c then t else e` | `c` check `Bool`，分支 check 期望类型 |
| `A -> B` / `(x:A) -> B` / `{x:A} -> B` | Pi formation：域/余域必须是类型；返回 `Type (max i j)` |
| `Type` / `Type n` | `TType 0` / `TType n`，类型是 `Type (n+1)` |
| `C a b`（构造子） | M14：按构造子 telescope 插入隐式族参数/索引，显式实参按字段域 check，生成 `TCon` |
| `case e of alt...` | M14：只在 check 位置；scrutinee 必须是归纳族应用，分支按索引 unification 精化（§16–§18） |

定义精化顺序：按源顺序精化全部签名（加入全局环境）→ 按源顺序 check 定义体
（已精化的定义体进入 delta 表）→ 检查未解元变量。因此前向引用的**类型别名**
暂不可用（签名阶段未见其定义），文档与测试按此约定。

## 6. 擦除与 codegen

**擦除判据（M18.5 起全仓唯一入口）**：`Elab.erasedBinder implicit dom = implicit || isTypeValue dom`。
隐式 binder 恒擦除（隐式实参由精化器插入，运行时不传）；显式 binder **只有域是宇宙
（`Type`）才擦除**，索引域（`{n : Nat}` 这类归纳族）保留运行时表示——它们可能被当递归
参数读回来（`vlen`），安全擦除需要整程序使用分析（M22.3 只接判据入口，不做分析）。
六处判据点 `teleOf` / `checkBinders` / `bindOnePattern` / `checkLam` / `inferArgs` /
`bindCtorBinder` 一律走它；M24.6 第一级要把「字段数 / telescope 长度 / 绑定数」的三重
一致性升级成类型保证。M18.5 之前 `checkLam` 无条件写 `erased = True`，导致 lambda 形参
被当类型级变量：被使用时硬报错，未被使用时**静默少生成一层 `fun`**（能 check 不能 compile）；
单元夹具 `test/corpus/dt/19_lam.vuna` 与反例 `dt_err/18_lam_type_used.vuna` 固化该规则。

1. 按「类型 force 后是否为 `VType _`」区分类型级定义与运行时定义；类型级定义
   不生成运行时代码（如 `Endo`、`f : (a:Type) -> Type`）。
2. 擦除检查：运行时项引用被擦除绑定 / 类型级定义 / `TPi` 时报错
   （`check --dt` 与 `compile --dt` 都跑）。
3. 运行时定义按 `TGlobal` 依赖拓扑排序；M13 里有环 = 递归 → 报错；M14 起改为
   SCC 分组并用 `let rec ... and ...` 生成（见 §20）。
4. 生成逻辑：擦除绑定不生成参数、擦除实参不生成参数；`TGlobal` → `v_<name>`；
   prelude 运算符映射到 `bi_add` / `bi_eq_int` / `bi_concat` 等既有运行时名字；
   输出自包含的最小 DT runtime（`bi_*` + `dt_show_string` / `dt_show_bool`），
   不依赖 `TypedCodegen`。
5. `main` 必须是 `Int` / `String` / `Bool`；`--no-print` 时只 `ignore`。

## 7. 与 HM 路径的边界（迁移期；M24 后 HM 删除）

- 只共享 `Vuna.Compiler.Ast` / `Vuna.Compiler.Parser` / `Vuna.Fmt` 与 `Base.*`；
  `EPi` 在 HM 的 loader 里报 `dependent function type requires --dt`。
- `Vuna.Compiler.Dt` 是唯一对外 facade（`compiler/vuna.toml` 的 `[export]`）；
  核心求值器通过 `vuna interp --dt` 暴露，用于与 codegen 结果做一致性测试。
- M13/M14 的 DT 不进入 `build` / `seed` / `split`；seed 仍只由 HM typed codegen 生成
  （DT 模块是普通 HM 源码，随 compiler 闭包进入 TCB）。
- M14 的 `data` / `case` 走同一套 `Ast` / `Parser`（`DData` 新增 kind 字段、`ECase`
  复用 HM 的 case 语法），因此 HM 路径的解析行为不变；HM 的 `case` 仍是原有语义。

## 8. 诊断

所有精化诊断带 `文件:行:列` 前缀；关键消息见实现与测试夹具
（`test/corpus/dt_err/*.err`）。codegen 阶段错误（运行时使用类型级绑定等）
不带 span，M16 擦除分析再补位置。M14 的 `data` / `case` / 索引错误仍是精化期
诊断，带 span；消息清单见 §19。

## 9. 后续阶段接口

- M14（**已实现**）：`data F : <kind> where` 的索引归纳族、带显式 telescope 的构造器
  （`(a : Type) -> (n : Nat) -> ...`）、依赖模式匹配。Core 增加了 `TCon` / `TCase`
  （值域 `VCon` / `VCase`），精化器增加 `unifyIdx` 索引 unification 与覆盖率判定，
  递归定义限制同时解除。实现细节见 §11–§23。
- M15：metavariable context、隐式搜索/接口、洞目标显示；替换 M13/M14 的一阶求解
  限制（包括隐式索引推断）。
- M16：终止性/覆盖性 + 真正擦除分析（替代 M13 的 codegen 期擦除检查与 M14 的
  fuel 兜底）。

## 10. 基准（本机参考，非 CI 门槛）

`nix run .#vuna-bench -- --quick` 新增 `dt_elab` 项：对
`test/corpus/dt/03_compose.vuna`（Pi + 3 个类型参数擦除 + compose）跑
`compile --dt --no-print`（精化 + 擦除检查 + codegen）的耗时。

- 本机（M13 完成时）：`dt_elab` ≈ **2 ms**；对照同一报告的
  `compiler_self_compile` ≈ **2.8 s**、`seed_build` ≈ **1.5 s**、
  `corpus_compile`（16 个 HM 夹具批量编译）≈ **0.5 s**。
- 时间依赖机器，只用于回归对比（`--baseline` / `--json`），不进入
  `nix flake check`；机器无关指标仍由 `nix/metrics.budget` 约束 seed 闭包的
  HM codegen 产物（M13 后 bytes 867732 / lines 9049）。
- M14 后 DT 夹具从 8 个增加到 12 个（新增 `09_nat` / `10_vec` / `11_fin` /
  `12_eq`），精化与 codegen 的路径也变了（构造子/变体/match）：`dt_elab` 的
  M14 新数字**待重新基准**（由 Lead 在合并后补测）。

## 11. M14 范围

M14 在 M13 的 Core TT 上加入**索引归纳族**（indexed inductive families）与**依赖模式
匹配**（`case`）。这是 DT 主线从“只能写依赖函数”跨到“能表达类型级不变量”的一步：

- `data` 声明：`data F : <kind> where`，kind 的箭头个数 = 族参数 arity（如
  `Vec : Type -> Nat -> Type`）；构造子带 telescope，前 `arity` 个 binder 对应族参数/
  索引，其余是字段；参数擦除规则与函数 binder 一致；
- `case` 表达式：按构造子分支，对索引做 unification，判定分支可达性并做覆盖率检查；
- 递归/互递归定义随之解禁（M13 的 "recursive (not supported until M14/M16)" 错误
  删除），靠已有的 delta 展开 fuel 保证终止；
- 代码生成：运行时族 → OCaml 变体类型，`TCon` → 构造子应用，`TCase` → `match`。

M14 仍不做：隐式索引推断、case 出现在推断位置、高阶/开放元变量、`let` / record /
trait / `do` / 嵌套模式 / 多 clause 函数、DT 的多文件与工具链集成（M17）。

## 12. Surface 语法

M14 **没有新增语法**（满足「新增语法先以旧种子可编译的形式落地」的硬约束）：
`data` 复用已有的 `data Name params : kind where` 形式，族参数**不放圆括号**，而是用
kind 的箭头个数表示 arity；构造子的参数/索引在签名里逐个 binder 重新绑定。

**M14 的索引 binder 一律写显式形式**（`(a : Type)`、`(n : Nat)`），这也是全部夹具的
写法：

```vuna
data Nat : Type where
  Zero : Nat
  Succ : Nat -> Nat

data Vec : Type -> Nat -> Type where
  Nil  : (a : Type) -> Vec a Zero
  Cons : (a : Type) -> (n : Nat) -> a -> Vec a n -> Vec a (Succ n)

data Fin : Nat -> Type where
  FZero : (n : Nat) -> Fin (Succ n)
  FSucc : (n : Nat) -> Fin n -> Fin (Succ n)

data Eq : Type -> Type -> Type where
  Refl : (a : Type) -> Eq a a
```

要点：

- 族头是 `data F : <kind> where`；kind 的**箭头个数 = 族的参数/索引个数（arity）**，
  域依次对应族应用 `F a n` 的位置（`Vec : Type -> Nat -> Type` 即 `Vec a n`）。
  `data Vec (a : Type) (n : Nat) : Type where` 这种圆括号 binder 形式**M14 不支持**。
- 构造子写法仍是 `C : T`；`T` 是**完整 Pi 链**，前 `arity` 个 binder 对应族的参数/
  索引（与 kind 的域一一对应），其余 binder 是字段。构造子表缩进对齐。
- **隐式索引推断 M14 不做（M15）**：`{n : Nat} -> ...` 配合调用点自动求解（例如
  `FSucc FZero` 让精化器倒推出 `n`）不在 M14 的能力范围内。用 `{...}` 写构造子时，
  只有期望类型已经**完全确定**索引（闭合解）的场合才可能碰巧通过，这不是受支持的
  用法；需要从调用点反推索引或解中出现局部变量时，会报
  `DT: unsolved metavariable ?k` 或 `type mismatch`。
- 构造子应用要**写全**族参数/索引（显式 binder 不会被省略）：`Cons Int Zero 1 (Nil Int)`。
- 族的类型级应用（`Vec a n`）保持**中性** `TGlobal "Vec" [..]`，不做类型级求值；
  索引只在 unification 时按定义性相等比较。
- 注意 `Nil` / `Cons` 同时是 HM 的 list 语法糖：写 `[]` / `x :: xs` 与写
  `Nil` / `Cons x xs` 解析成同一个 `PCon`，`vuna fmt` 会按 HM 语法糖渲染成前者；
  文档示例保留构造子名以突出“这就是用户声明的族”。

`case`：

```vuna
vlength : (a : Type) -> (n : Nat) -> Vec a n -> Nat
vlength a n xs = case xs of
  Nil b         => Zero
  Cons b m y ys => Succ (vlength b m ys)

vhead : (a : Type) -> (n : Nat) -> Vec a (Succ n) -> a
vhead a n xs = case xs of
  Cons b m x rest => x
```

- `case <scrut> of` 后跟缩进对齐的分支 `<构造子名> <变量...> => body` 或 `_ => body`。
- **分支要绑定构造子的全部显式 telescope binder**：族参数与索引各占一个位置，即使
  分支体不用。`Cons b m y ys` 依次绑 `a`、`n`、字段 `a`、`Vec a m`；只写
  `Cons x rest` 会报 `DT: case branch has too few arguments for its constructor`。
  隐式 binder 不消费子模式（`bindCtorTele` 里 `implicit` 分支直接压栈）。
- `vhead` 只写 `Cons` 是合法的：`Nil` 的结果索引 `Vec a Zero` 与 scrutinee 的
  `Vec a (Succ n)` 不可统一 ⇒ 该分支不可达，覆盖率检查合法跳过（M14 的核心卖点）。
- 兜底 `_ => ...`（或变量模式，等价）只能放最后，没有绑定变量。
- 只支持**顶层构造子模式**；嵌套模式（`Succ (Succ k)`）报
  `DT: nested patterns are not supported yet (M14 limitation)`。
- case 表达式**需要已知的结果类型**（通常来自函数签名）：`inferE` 对 `ECase` 报错，
  所以 case 不能出现在推断位置。
- check 位置仍可用洞 `_`，但求解仍受 M13 的一阶/闭合限制。

函数定义仍只能**一个 clause**（模式参数只支持变量 / `_`），多 clause 报
`DT: multiple clauses are not supported yet (use a single equation; M16)`。但
**递归定义已解禁**（M14 起 `vlength`、`plus` 都直接递归）。

## 13. Core 表示：TCon / TCase / VCon / VCase

```vuna
-- compiler/lib/Vuna/Compiler/Core.vuna（M14 新增）
data Term where
  ...
  TCon  : String -> List (Pair Term Bool) -> Term            -- 构造子名 + 实参（自携擦除标志）
  TCase : Term -> List CaseAlt -> Term                      -- scrutinee + 分支

data CaseAlt : Type where
  CaseAlt : String -> List (Pair String Bool) -> Term -> CaseAlt
  -- 构造子名（空串 = 兜底）+ 绑定子（名字/擦除）+ 分支体

data Value where
  ...
  VCon  : String -> List Value -> Value
  VCase : Value -> List VCaseAlt -> Value

data VCaseAlt : Type where
  VCaseAlt : String -> List (Pair String Bool) -> Closure -> VCaseAlt
```

- `TCon` 的每个实参自携擦除标志，与 `TApp` 一致；codegen 只读标志。
- `TCase` 的分支**按构造子名匹配**。分支体在命中后把构造子载荷**按序**绑进闭包环境
  （`applyCaseAlt`：`eval (append (reverse args) env) body`，与 `ctxBind` 的 de Bruijn
  约定一致）。
- 没有内置 `Nat`：`Nat` / `Zero` / `Succ` 都是用户用 `data` 声明的族。
- `force` 会推进卡住的 `VCase`：scrutinee 归约到 `VCon` 就选分支，否则继续卡住；
  `quote` / `conv` / `shift` / `hasFreeVar` / `hasMeta` / `normalize` / `showTerm`
  都覆盖新节点（`conv` 逐分支比较名字、绑定子与体）。

## 14. 声明表示：DtData / DtCtor

```vuna
-- compiler/lib/Vuna/Compiler/Elab.vuna
data DtCtor : Type where
  DtCtor : String -> String -> List (Pair String Bool) -> Term -> DtCtor
  -- 构造子名 + 所属族 + 完整 telescope（含族参数）+ 闭合类型项

data DtData : Type where
  DtData : String -> List (Pair String Bool) -> List DtCtor -> DtData
  -- 族名 + 族参数 telescope + 构造子表
```

- 族参数 telescope 由 **kind 的箭头个数**确定（`data Vec : Type -> Nat -> Type` 得到
  两个参数 `a` / `n`），擦除标志按域是否为宇宙计算：`(a : Type)` 擦除、
  `(n : Nat)` **保留**（索引保留运行时表示）。
- `DtCtor` 的 telescope 是**完整的**：前 `arity` 个 binder 是族参数/索引（与 kind 的
  域一一对应），其余是字段；结果索引写在类型项里。类型项是闭合的 core 项
  （`TGlobal` 指族名）。
- 擦除规则与函数 binder 一致（`teleOf`：`erased = implicit || isTypeValue dom`）：
  **域是宇宙（`Type n`）的 binder 被擦除**；域是归纳族的索引 binder（如 `(n : Nat)`）
  **保留运行时表示**——`Vec a n` 的值在 OCaml 里带长度索引字段（`C_Vec_Cons of
  'a t_Nat * 'a * 'a t_Vec`），索引不是零成本抽象，完整擦除分析属 M16。`Eq a b` 的
  构造子 `Refl` 只有宇宙域 binder、没有字段，因此 `Eq a b` 在运行时是**零字段**变体。
- 构造子应用**必须写全**族参数/索引（显式 binder 不省略）：`Cons Int Zero 1 (Nil Int)`；
  精化器按 telescope 顺序逐个消费实参，饱和后生成 `TCon`（未饱和保持 `TApp`）。
- 构造子名在 Core 里保持全局唯一（`Cons`、`Nil`），跨族重名由精化器在收集阶段报错；
  codegen 侧再加族前缀（§21）。

## 15. 求值与定义性相等

- `eval` 对 `TCon` → `VCon`、`TCase` → `evalCase`；`evalCase` 在 scrutinee 是
  `VCon c args` 时按名字找第一个匹配分支，把 `args` 逆序拼到闭包环境前再 `eval`。
- `force` 对 `VCase`：先 force scrutinee；若得到 `VCon` 则推进到分支体（并按需递归
  force），否则保留卡住的 `VCase`；`force` 的 fuel 与 delta 展开共用。
- `conv` 对 `VCon` 逐实参比较（名字 + arity 必须一致）；对 `VCase` 逐分支比较前先
  比较 scrutinee。卡住的 `VCase` 与 `VCon` 不相等。
- 类型级 `Vec a n` 是 `VNeutral (NGlobal "Vec" [..])`，因此两个 `Vec a n` 相等当且仅当
  `a` / `n` 定义性相等或可被元变量统一——这正是索引 unification 的用武之地。

## 16. 索引 unification 与精化

上下文项 `Ctx` 的每个 entry 从「名字 + 类型」扩展为「名字 + 类型 + **可选精化项**」。
求值环境分**两遍**构造：先给所有 binder 造原始中性变量，再按绑定顺序把精化代入
（精化项按绑定时上下文存储，用时 shift）。

`unifyIdx lhs rhs` 的规则：

| 左 | 右 | 行为 |
| --- | --- | --- |
| 相同构造子 | 相同构造子 | 逐实参递归；名字或 arity 不同 ⇒ 不可满足 |
| 中性局部变量 | 任意 | 记录精化（该分支内变量 ↦ 项） |
| 相同全局中性头 | 同头 | 逐 spine 元素递归；不同头 ⇒ 不可满足 |
| 未解元变量 | 任意 | 走 M13 的 `solveMeta`（一阶、闭合解） |
| 其它 | 其它 | 不可满足 |

- 「不可满足」不立即报错：源码**省略**的分支合法（覆盖率跳过它）；源码**写了**的
  分支才报 `DT: this branch is impossible ...`。
- 精化只在该分支内有效（分支结束丢弃），因此不同分支可以用同一个变量名得到不同的
  索引等式；这正是依赖模式匹配的判别力来源。
- 精化项在 `Ctx` 里按绑定时的上下文保存，使用时 shift，避免捕获。
- 索引 unification 是**语法驱动**的（不拆 Pi、不做高阶统一）：匹配到不同构造子头就是
  不可满足，不做“先归约再比较”的搜索（需要归约的场合靠 `force` 已归约掉）。

## 17. 覆盖率与分支可达性

- `case` 的 scrutinee 类型必须是「归纳族的类型级应用」（`VNeutral` 头是某个
  `DtData` 的族名，spine 是索引实参），否则报 `DT: case scrutinee is not an
  inductive family`（例如对 `Int` 做 case）。
- 分支里的构造子必须属于该族，否则 `DT: unknown constructor <C> in case`。
- 合法分支 = 结果索引与 scrutinee 索引**可统一**的构造子；通过 `unifyIdx` 判定。
- 覆盖率：从合法分支里减去源码写出的分支，若仍有遗漏且可达 ⇒
  `DT: case is not exhaustive: missing <C>`（只报第一个缺失的构造子）；写了兜底
  分支时覆盖率直接通过。
- 源码写出的不可满足分支 ⇒ `DT: this branch is impossible (index constraints are
  unsatisfiable)`。
- 只支持顶层构造子模式；嵌套构造子模式（`Cons (Succ n) xs`）报
  `DT: nested patterns are not supported yet (M14 limitation)`。
- `_` / 变量模式只能作为**最后一个**兜底分支；兜底分支不参与可达性判定。
- 构造子的结果族必须就是被 case 的族，否则 `DT: constructor <C> does not return <F>`。

## 18. case 精化流程

1. `checkE (ECase scrut alts) expected`：先 check scrutinee 并用它确定族与索引
   （`case` 的 scrutinee 类型必须是 `Vec a n` 这类族应用）；
2. 按构造子 telescope 的前 `arity` 个 binder 与 scrutinee 索引跑 `unifyIdx`，得到该
   分支的索引精化并记录；其余 binder（字段）作为绑定变量压栈；分支体按 `expected`
   check；
3. 汇总所有分支，跑覆盖率/可达性判定（§17）；
4. 生成 `TCase scrut [CaseAlt c binders body ...]`；兜底分支是 `CaseAlt "" ...`。

分支里**只写字段绑定**：`Cons x rest` 对应字段 `x : a`、`rest : Vec a n`，族参数
`a` 与索引 `n` 由 `unifyIdx` 从精化上下文里取，不进入分支绑定子。

`inferE` 对 `ECase` **不做推理**，直接报 "cannot infer the type of a case expression;
add a signature"——依赖 case 的消除结果依赖索引等式，没有期望类型就无法确定。
所以实践上 case 总出现在有签名函数的体内、或作为别的已知类型的实参。

## 19. 错误信息

M14 新增/修改的错误（原文）：

| 消息 | 触发条件 |
| --- | --- |
| `DT: case scrutinee is not an inductive family` | 对非归纳族（如 `Int`）做 case |
| `DT: unknown constructor <C> in case` | 分支构造子不属于该族（或未声明） |
| `DT: case is not exhaustive: missing <C>` | 合法分支没写全且可达 |
| `DT: this branch is impossible (index constraints are unsatisfiable)` | 写出的分支索引不可满足 |
| `DT: nested patterns are not supported yet (M14 limitation)` | 嵌套构造子模式 |
| `DT: constructor <C> does not return <F>` | 构造子结果族与 case 的族不符 |
| `DT: multiple clauses are not supported yet (use case; M16)` | 多 clause 函数 |
| `DT: cannot infer the type of a case expression; add a signature` | case 出现在推断位置 |

M13 的 `data` / `case` / 递归不再报“不支持”；`record` / `trait` / `instance` /
`let` / `do` 的错误保留（后续阶段）。索引族相关错误都带 `文件:行:列`。

## 20. 递归与 fuel

- M13 的「运行时有环 = 递归 → 报错」删除。M14 起 codegen 用 SCC 分组：非自递归的
  单函数生成 `let`，自递归/互递归分量生成 `let rec ... and ...`。
- 终止性**不在 M14 检查**：递归定义依赖 `force` 的 delta 展开步数上限
  （`defaultFuel = 512`）保证不挂死；超出即停下并报“无法归约”类错误。真正的
  termination 留 M16。
- 求值器（`interp --dt`）同样靠 fuel 收敛；类型级递归（如 `Plus` 用于索引）在
  `unifyIdx` 比较前已被 `force` 归约到构造子，因此常见用例不需要很大的 fuel。

## 21. 代码生成

`compiler/lib/Vuna/Compiler/CoreCodegen.vuna`：

1. **变体表示**：每个「运行时族」生成一个 OCaml 变体类型。只有**宇宙域**的族参数
   成为 OCaml 类型参数（如 `type 'a t_Vec = ...`）；非宇宙参数（如 `Nat` 索引）
   不作为类型参数、作为构造子字段保留（索引保留运行时表示）。
2. **名字**：构造子加族前缀避免跨族重名（`C_Vec_Cons`、`C_Fin_FZero`）；类型名
   加 `t_` 前缀（`t_Vec`）。
3. **构造**：`TCon` → OCaml 构造子应用，跳过擦除实参。
4. **匹配**：`TCase` → OCaml `match`；兜底分支补
   `| _ -> failwith "DT: impossible branch"`（源码省略的不可满足分支也走这条）。
5. **分组**：运行时定义先做 SCC 分组，按依赖顺序输出；`let rec` / `and` 只在真正
   自/互递归时使用。
6. **擦除检查**扩展到 `TCon` / `TCase`：运行时（非擦除位置）使用被擦除的 binder
   仍报错；类型级定义整体不生成代码。
7. DT codegen 的错误仍**不带 span**（M16 统一补位置）。

## 22. 当时的限制（M14 之后，历史快照）

> 本节是 M14 的边界记录，**不反映当前状态**。M19 已补齐 `let`、推断位 `case`、嵌套模式、
> 多 clause、`record`、`deriving` 与内建字面量模式；M20 已接入多文件 / `import` / `--root`；
> M20.5 已补更高阶统一与字典延迟。当前阶段状态与阻碍见 [docs/roadmap.md](roadmap.md)。

- M14 要求索引 binder 写成显式形式（隐式索引推断属 M15，已实现）；
- 索引值保留运行时表示（显式索引；完整擦除属 M22.3）；
- 一阶闭合元变量解；更高阶形态由 M20.5 的 `solveMetaHo` 覆盖常见情况；
- 当时不支持 `let` / record / trait / `do` / 嵌套模式 / 多 clause（均已实现）；
- 递归终止性靠 `force` 的 fuel 上限，而不是结构性检查（M16 起有检查）；
- 无 cumulativity / universe polymorphism（M13 起未变）。

## 23. M14 测试夹具（历史快照）

> **本节的数字是 M14 当时的快照。** 当前实测为 **21 正例 / 19 反例**（M15 追加
> `13_iface`/`14_solve`/`15_goal`，M16 追加 `16_total`/`17_erase` 与反例
> `16_nonterm`/`17_nested_total`，M18 追加 `18_ctx`，M18.5 追加正例 `19_lam` 与反例
> `18_lam_type_used`，M18.6 追加正例 `20_rig`/`21_level` 与反例 `19_rig_type_runtime`）；
> 完整清单见 [reference/dt.md](reference/dt.md)。

正例 `test/corpus/dt/` 共 12 个（M13 的 `01_id`–`08_if` + M14 的四个）；
数值是 `interp --dt` / `compile --dt` 的 golden：

- `09_nat.vuna`：`Nat` + 递归 `plus` / `toInt`，输出 `5`；
- `10_vec.vuna`：`Vec` 的 `vhead`（只写 `Cons`）/ `vtail` / `vlen`，输出 `4`；
- `11_fin.vuna`：`Fin` 安全取下标 `at`（`Vec a (Succ m)` 与 `Fin (Succ m)` 一起排除
  `Nil` / `FZero` 两个不可能分支），输出 `7`；
- `12_eq.vuna`：`Eq` 的 `sym` / `trans`（都是 `case e of Refl ... => ...`；`Eq` 的
  构造子没有字段，运行时是零字段变体，codegen 里是 `C_Eq_Refl`），输出 `7`。

负例 `test/corpus/dt_err/` 共 15 个，断言错误片段：

- M13：`01_universe`、`02_conv`、`03_hole`、`05_import`、`06_unknown`、`07_lambda`、
  `08_arity`、`09_runtime_type`、`11_implicit_non_type`；
- M14 新增/改名：`04_nonexhaustive`（漏写 `Succ` 分支，报
  `case is not exhaustive: missing Succ`）、`10_impossible`（写了不可达分支，报
  `this branch is impossible`）、`12_case_int`（case 打在 `Int` 上）、
  `13_unknown_ctor`（未知构造子）、`14_bad_ctor_result`（构造子结果不是所属族）、
  `15_nested_pat`（嵌套模式）。

## 24. 表示层定型与 QTT 预留（M18.6）

本节记录**核心类型论表示层**的定型决定：这些决定本身不增加用户可见能力，目的是让
QTT（量化类型理论）与宇宙多态在将来落地时只替换「判据」与「层级实现」，而不必重做
`Core` / `Elab` / `CoreCodegen` 的骨架。背景见 [docs/roadmap.md](roadmap.md) 的 M18.6
与 [reference/dt-parity.md](reference/dt-parity.md)。

### 24.1 已落地（M18.6 完成）

两项表示层改动已经在 `Core` 里定型，**行为与 M18.5 完全一致**——全部 DT 夹具的
`compile --dt` 产物与改前逐字节相同（`diff -r` 验证），`test/run-tests.sh` 742 checks 全绿。

| 改前 | 改后 | 映射 |
| --- | --- | --- |
| `Bool`（是否擦除） | `data Rig` = `Rig0` / `Rig1` / `RigOmega` | 隐式 binder、类型域 → `Rig0`；其余 → `Rig1`；`RigOmega` 暂不产生 |
| `TType : Int` / `VType : Int` | `TType : Level` / `VType : Level`（不透明） | 内部是 `MkLevel Int`，但只有 `Core` 可见 |
| 直接解构 | 经访问器 | 见 §24.2 |

改动面（实测）：`Core` / `Elab` / `CoreCodegen` 三文件 48 处 `Pair Term Bool` /
`Pair String Bool` 换成 `Rig`；`VType` / `TType` 的解构与构造共 20 余处改走 `Level`。

### 24.2 三个 accessor 层

- **构造入口**：`rigOfBinder implicit isTypeDom`（精化器唯一构造点）、`levelZero` / `levelSucc` /
  `levelMax` / `levelOfInt`（后者只给输入语法 `Type n` 用）。`Elab` **不写**
  `if ... then Rig0 else Rig1` 这类判断。
- **判定入口**：`rigIsErased`（codegen 与擦除检查）、`rigIsLinear` / `rigIsOmega`（QTT 预留）。
- **展示与比较入口**：`levelToInt`（只给 `showTerm`）、`levelEq` / `levelLt`（`conv` / `unifyIdx`）。

`RigOmega` 现在不产生，但**在类型里存在**——QTT 落地时精化器只需产出它，codegen 的下游
逻辑（判「是否擦除」）不变。

### 24.3 不变量（M18.6 起生效，后续阶段必须保持）

1. **`Core` 之外不得对 `Rig` / `Level` 做模式匹配**，只能用访问器与构造器；新增用法先补访问器。
   当前违反数为 0：`Elab` / `CoreCodegen` 只出现 `Rig0` / `Rig1` 构造与 `rigIsErased` 读。
2. **擦除判定只有一个入口**：`Elab.binderRig`（构造 Rig）与 `Core.rigIsErased`（读 Rig）。
   M22.3 会把它升级成可替换的 `eraseMask`，使「rig 驱动」与未来的「使用分析驱动」可互换。
3. `Level` 的算术（`succ` / `max`）只在 `Core` 内部实现；`Elab` 经 `checkType` 返回的
   `Level` 与访问器拿层级，不自己算。当前违反数为 0。
4. 破坏上述任一条时，须在本节记录例外与理由。

### 24.4 与 QTT 的衔接

QTT 落地的增量工作是：语法加 multiplicity 标注（`Parser` / `Ast` 加一个字段）、精化器
产出 `Rig`、擦除判据读 `Rig0`。**不需要**改动的：codegen 的变体/`match` 结构、SCC 分组、
模块系统、`Loader` / `Pkg`、seed 自举链。

注意 QTT 的判据与 M16 探索的「整程序使用分析」是**两套不同方案**：前者按 binder 的
multiplicity 静态擦除，后者按运行时是否读取判定。M22.3 因此只接判据入口，不投入实现
使用分析——这是 [docs/roadmap.md](roadmap.md) M22.3 与「决策变更」的记录内容。

### 24.5 擦除 binder 的运行时位置语义（M19 已统一）

M19 尝试补 `trait Functor f`（类参数是 `Type -> Type` 的高阶 kind）时，暴露出一条**尚未
统一**的语义：`Rig0` binder 在运行时到底占不占一个位置？

- `CoreCodegen.genTerm` 的 `TLam` 分支：`rigIsErased` ⇒ **不生成** OCaml 形参，但
  `binders` 里**保留**一个占位项（`Pair "" Rig0`），因此 `binderAt` 的 index 仍把它算进去；
- `Core.eval` / `applyValue`：`VLam` 不管 rig，**照样收一个实参**。

两者在普通场景下恰好自洽（擦除位既不生成形参、也不被运行时引用），但一旦擦除位夹在
运行时参数**中间**（`fmap : (a : Type) -> (b : Type) -> (a -> b) -> f a -> f b` 的投影），
「lambda 链里有没有这一层」在两条路径上就得到不同答案，实例投影因此错位。

**结论与修复**（M19 已落地）：根因不是「占不占位置」这个抽象问题，而是**精化器生成的项
本身不自洽**——`trait` 投影的 lambda 链与应用点一律写 `Rig1`，而方法签名里 `a : Type`
这类 binder 实际是 `Rig0`。实例方法体按真实 rig 生成，投影却按表面 arity 生成，两者的
运行时元数不同，于是「求值器照样消费一个实参」与「codegen 不生成形参」不再一致。

修法不是改求值器或 codegen（两者各自都对），而是让**精化器用同一份 rigs 生成两侧**：
`methodArgRigsOf` 从方法类型逐 binder 取 multiplicity，投影的 lambda 链
（`methodArgLams`）与调用点（`methodArgTerms`）都用它。同时收窄「类型层」判据：必须是
**域全为宇宙的 Pi 链**（`Type -> Type`）；值层函数类型 `a -> b` 的域是类型变量，不能被
误判（否则 `03_compose` / `04_apply` 直接崩）。

**不变量**：精化器产出的项，其 lambda 链元数必须与该类型的 Pi 链逐 binder 对齐，
`Rig0` 位置两侧都跳过。这条不变量由 `methodArgRigsOf` 单点保证。

### 24.6 同 trait 多实例（M19 发现并修复）

这是在实现 M19 最后一项 `deriving (Show, Eq, Ord)` 时撞上的：`deriving` 本身不难
（展开成手写 `instance` 即可），但它需要「同一个 trait 有多个实例」，于是暴露出
**M15 实例编码的一条结构限制**——现在已修复。

最小复现（不需要 `deriving`）：

```vuna
trait Name a where
  nameOf : a -> String
instance Name A where
  nameOf x = "A"
instance Name B where
  nameOf x = "B"
main = nameOf MkA ++ "/" ++ nameOf MkB   -- 修复前：type mismatch: expected A, got B
```

**根因**：`inferArgsGo` 处理字典参数时，先让后续显式实参去约束 `Dict_C ?a` 里的 `?a`，
但紧随其后的 `searchInstance` 会拿**仍带元变量**的 `Dict_C ?a` 去匹配实例表。
`filterInstances` 用 `conv` 比较，`Dict_C ?a` 与第一个候选就能统一——`?a` 被顺手解成
该候选的参数，之后所有其它实例的调用都错。单实例一直正常，因为唯一候选就是正确答案。

**修复（两条不变量）**：

1. **实例搜索不得解决元变量**。`filterInstances` 只接受「比较没有新增解」的头匹配
   （`conv` 返回的 `sols` 与输入等长），实例搜索因此变成纯查找。它还需要以
   `ecSols ec` 作为初始解集，否则已解的元变量会被当成未解、误判为「新增解」。
2. **类参数的约束由 `constrainDictDom` 负责**，且要跳过类型实参（`firstOf2 Int ...`
   的 `Int` 与类参数无关，拿它统一会把 `?a` 解成 `Int`）；同时把实参类型收缩到
   **应用头部**（类参数只可能是构造器形态，高阶 kind 的实例头写的就是构造器本身，
   而实参类型常是 `Box Int` 这样的应用形态）。

**为什么重要**：这条缺陷会挡住 M23 全仓迁移（真实代码里到处是同 trait 多实例），也是
`deriving` 的前置。回归夹具：正例 `dt/29_multi_instance`（同 trait 两个实例、正序与
反序调用都对）、反例 `dt_err/25_no_instance`（缺实例必须报明确错误）。

## 已知缺口：多态族的构造子字段类型不被索引精化（2026-11 探明并修复）

`case` 分支里，构造子的字段 binder 按 `bindCtorTele` 绑定、再经 `unifyIdxList` 把
结果索引与 scrutinee 的索引统一，产出 `level ↦ value` 的 refs，分支体的期望类型
由 `refineValue refs` 精化。**当字段类型本身引用族参数时，这个精化落不到字段上**：

```vuna
data Wrap : Type -> Type where
  MkWrap : {a : Type} -> (a -> Int) -> Wrap a

run : Wrap Int -> Int
run w = case w of
  MkWrap f => f 41        -- 修复前: type mismatch: expected a, got Int
```

**根因（已确证）**：`Elab.refineValue` 的兜底分支是 `_ => v`，**`VPi` 与 `VLam` 都不
递归**。字段类型 `a -> Int` 求值后是 `VPi`，于是精化直接原样返回，refs 里的
`高层a ↦ Int` 永远替换不到它里面。纯变量字段（类型是 `NVar`）能精化成功，正因为它
走的是 `VNeutral / NVar` 分支——这也解释了为什么 `unwrap : Wrap a -> a` 能过而
`f 41` 不能。

**修法（已落地）**：不在**结果**上做 `refineValue`（对 `VPi`/`VLam` 的 `_ => v`
不递归），而是在**取用点**把精化代入**求值环境**再 `eval`——`Elab.varTypeValue` /
`Elab.evalCtx` 改为先 `map (refineValue refs) (ctxEnvAt ...)` 得到精化后的环境，再
`eval`。闭包（`Clos env body`）捕获的是**环境**，`applyClosure` 用 `v :: env` 求值，
因此精化后的环境自然被闭包携带：`VPi` 的**域**在 `eval` 时精化，**余域**在
`applyClosure` 时精化，嵌套函数类型递归成立。这避免了给 `refineValue` 加
`VPi`/`VLam` 分支（此前尝试 `refineClosureDown` + `freshVarValue`，因 `quote` 深度
错位让 `compose` 这类三层 Pi 的 `b`/`c` 错位，10 个既有夹具回归，已放弃）。

**不是 M20 引入的**：`data Wrap : Type -> Type` + 显式 `{a : Type}` 的写法在 M20 之前
就失败（M20 的参数化 `data Foo a` 只是让这种写法更常见）。

**为什么它是 M21 的硬前置**：`Base.IO` 的 `MkIO : (Int -> a) -> IO a` 正是这个形状，
`ioBind` / `ioFmap` 的 `case ... of MkIO g => ...` 全部踩同一个坑。

**回归夹具（已补）**：正例 `test/corpus/dt/33_poly_fn_field.vuna`（`Wrap Int` 里
`g 0` 得 `1`）；负例 `test/corpus/dt_err/27_poly_fn_field_err.vuna`（`Wrap Bool` 里
`g 0` 报 `expected Bool, got Int`，确保精化真的替换而非跳过）。全量
`test/run-tests.sh` 841 项通过。
