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

## 7. 与 HM 路径的边界

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

- M14（**已实现**）：`data F : <kind> where` 的索引归纳族、带显式 `{...}` telescope
  的构造器、依赖模式匹配。Core 增加了 `TCon` / `TCase`（值域 `VCon` / `VCase`），
  精化器增加 `unifyIdx` 索引 unification 与覆盖率判定，递归定义限制同时解除。
  实现细节见 §11–§23。
- M15：metavariable context、隐式搜索/接口、洞目标显示；替换 M13/M14 的一阶求解
  限制（包括隐式索引推断）。
- M16：终止性/覆盖性 + 真正擦除分析（替代 M13 的 codegen 期擦除检查与 M14 的
  fuel 兜底）。

## 10. 基准（本机参考，非 CI 门槛）

`nix run .#bench -- --quick` 新增 `dt_elab` 项：对
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
kind 的箭头个数表示 arity；构造子的参数/索引全靠签名里显式的 `{...} ->` binder。

```vuna
data Nat : Type where
  Zero : Nat
  Succ : Nat -> Nat

data Vec : Type -> Nat -> Type where
  Nil  : {a : Type} -> Vec a Zero
  Cons : {a : Type} -> {n : Nat} -> a -> Vec a n -> Vec a (Succ n)

data Fin : Nat -> Type where
  FZero : {n : Nat} -> Fin (Succ n)
  FSucc : {n : Nat} -> Fin n -> Fin (Succ n)

data Eq : Type -> Type -> Type where
  Refl : {a : Type} -> Eq a a
```

要点：

- 族头是 `data F : <kind> where`；kind 的**箭头个数 = 族参数个数（arity）**，
  域依次对应族的参数/索引位置（`Vec : Type -> Nat -> Type` 即 `Vec a n`）。
  `data Vec (a : Type) (n : Nat) : Type where` 这种圆括号 binder 形式**M14 不支持**。
- 构造子写法仍是 `C : T`，`T` 里用显式 `{...} ->` binder 重绑族参数（`{a : Type}`、
  `{n : Nat}`）；构造子表缩进对齐。
- 构造子 telescope 的**前 arity 个 binder** 必须与 kind 的域一一对应（族参数/索引），
  其余 binder 是「字段」，会成为 `case` 分支的绑定变量。
- 构造子应用在源码里**不写**族参数/索引（`Cons x xs`、`Nil`），它们由构造子签名里的
  隐式 binder 自动绑定。
- 族的类型级应用（`Vec a n`）保持**中性** `TGlobal "Vec" [..]`，不做类型级求值；
  只比较索引项是否定义性相等 / 可统一。
- 注意 `Nil` / `Cons` 同时是 HM 的 list 语法糖：写 `[]` / `x :: xs` 与写
  `Nil` / `Cons x xs` 解析成同一个 `PCon`，`vuna fmt` 会按 HM 语法糖渲染成前者；
  文档示例保留构造子名以突出“这就是用户声明的族”。

`case`：

```vuna
vlength : {a : Type} -> {n : Nat} -> Vec a n -> Nat
vlength xs = case xs of
  Nil       => Zero
  Cons _ ys => Succ (vlength ys)

vhead : {a : Type} -> {n : Nat} -> Vec a (Succ n) -> a
vhead xs = case xs of
  Cons x rest => x
```

- `case <scrut> of` 后跟缩进对齐的分支 `<构造子名> <变量...> => body` 或 `_ => body`。
- 分支**只写字段绑定**，不写族参数/索引：`Cons x rest` 绑 `x : a`、`rest : Vec a n`。
- `vhead` 只写 `Cons` 是合法的：`Nil` 的结果索引 `Vec a Zero` 与 scrutinee 的
  `Vec a (Succ n)` 不可统一 ⇒ 该分支不可达，覆盖率检查合法跳过（M14 的核心卖点）。
- 兜底 `_ => ...`（或变量模式，等价）只能放最后，没有绑定变量。
- 只支持**顶层构造子模式**；嵌套模式（`Cons x Nil`）报
  `DT: nested patterns are not supported yet (M14 limitation)`。
- case 表达式**需要已知的结果类型**（通常来自函数签名）：`inferE` 对 `ECase` 报错，
  所以 case 不能出现在推断位置。
- check 位置仍可用洞 `_`（例如把某个构造子的隐式索引实参交给元变量求解），但求解仍
  受 M13 的一阶/闭合限制。

函数定义仍只能**一个 clause**（模式参数只支持变量 / `_`），多 clause 报
`DT: multiple clauses are not supported yet (use case; M16)`。但**递归定义已解禁**
（M14 起 `vlength`、`plus` 都直接递归）。

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
  两个族参数 `a` / `n`），擦除标志按域是否为宇宙计算：`{a : Type}` 擦除、
  `{n : Nat}` 保留。
- `DtCtor` 的 telescope 是**完整的**：前 `arity` 个 binder 是族参数/索引（与 kind 的
  域一一对应），其余是字段；结果索引写在类型项里。类型项是闭合的 core 项
  （`TGlobal` 指族名）。
- 擦除规则与函数 binder 一致：**域是宇宙（`Type n`）的 binder 被擦除**；索引/证明
  参数保留运行时表示（`Vec` 的 `n`、`Fin` 的 `n` 都保留）。`Eq a b` 的构造子
  `Refl` 没有任何字段、两个族参数都是宇宙域，因此 `Eq a b` 在运行时是**零字段**变体。
- 构造子里族参数**一律隐式**：`Cons x xs` 不写 `Vec a n` 里的 `a` / `n`；精化器按
  telescope 顺序插入隐式实参并生成 `TCon`。
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

## 22. 已知限制（M14 之后）

- **仍无隐式索引推断**：函数签名里的隐式索引要在签名中显式写成 `{n : Nat}` 绑定，
  或在 case 的 scrutinee 里以能直接对照的项出现；M14 不做高阶/开放元变量，
  因此不能靠求解元变量“猜出”索引。构造子实参里的族参数/索引由构造子 signature 的
  隐式 binder 提供，不涉及推断。
- **case 不能出现在推断位置**：必须有已知的结果类型（通常来自函数签名）。
- 只有**一阶（闭合）元变量解**；高阶/开放解仍属 M15。
- 仍不支持 `let`、record、trait/instance、`do`、嵌套模式、多 clause 函数。
- DT 仍是**单文件、`--dt` opt-in**；无 import / 模块头 / 包 / `build` / `split` /
  `seed` 集成（留 M17；M14 只做单文件路径，split 回退仍按硬约束显式记录）。
- DT 代码生成的错误仍不带 span（M16 统一）。
- 递归终止性靠 delta 展开步数上限（`defaultFuel = 512`）保证不挂死，而不是终止性
  检查；超出即停下并报“无法归约”类错误。
- 类型级求值不专门做：族的类型级应用保持中性，只有 `force` 会按需 delta 展开。
- 无 cumulativity / universe polymorphism（M13 起未变）。

## 23. M14 测试夹具

正例 `test/corpus/dt/`：

- `09_nat.vuna`：`Nat` + 递归 `plus` / `toInt`，`main = 5`；
- `10_vec.vuna`：`Vec` 的 `vlength`（两分支都写）/ `vapp` / `vhead`（只写 `Cons`，
  `Nil` 分支因索引不可满足而合法省略）；
- `11_fin.vuna`：`Fin` + 安全取下标 `findex`（对 `Vec` 与 `Fin` 各做一次 case）；
- `12_eq.vuna`：`Eq` 的 `sym` / `trans`（都是 `case e of Refl => ...`；`Eq` 的构造子
  没有字段，运行时是零字段变体，typed codegen 里返回 `C_Eq_Refl`）。

反例 `test/corpus/dt_err/`：非穷尽 case、不可满足分支、scrutinee 非归纳族（对 `Int`
做 case）、嵌套模式、构造子返回值不是该族；`04_data` 被改造为「非穷尽 case」夹具。
