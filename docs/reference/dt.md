# 语言参考：DT 子集（M19，实验性）

`--dt` 打开与 HM 并存的依赖类型（DT）路径：Core TT + NbE + 双向精化器 +
擦除型 codegen。M14 在 M13（依赖函数 + 一阶元变量）之上加入**索引归纳族**与
**依赖模式匹配**（`data` + `case`），并因此解除了递归定义限制。DT 仍是
**单文件、自包含、显式 opt-in**：不经过模块 Loader，不支持 `import` / 包模式，
也不进入 `build` / `build --split` / `seed`；HM 路径（interp + typed + split）
语义与产物不变。设计与边界见 [docs/dt-core.md](../dt-core.md)。

```vuna
id : (a : Type) -> a -> a
id a x = x

-- 索引归纳族：Nat / Vec / Fin / Eq 都是用户声明的，没有内置 Nat
data Nat : Type where
  Zero : Nat
  Succ : Nat -> Nat

-- 族头只写 kind，箭头个数 = 族的参数/索引个数；构造子用完整 telescope 重绑它们,
-- 前 arity 个 binder 对应族的参数/索引，其余是字段。
-- 注意：M14 的索引 binder 一律写成**显式**（`(n : Nat)`）——隐式索引推断属于 M15。
data Vec : Type -> Nat -> Type where
  Nil  : (a : Type) -> Vec a Zero
  Cons : (a : Type) -> (n : Nat) -> a -> Vec a n -> Vec a (Succ n)

-- 递归定义在 M14 已解禁（靠 delta 展开 fuel 终止）
plus : Nat -> Nat -> Nat
plus a b = case a of
  Zero   => b
  Succ k => Succ (plus k b)

-- 构造子应用要写全族参数/索引（显式 binder 不会被省略）。
-- 「类型参数」域是宇宙（如 `a : Type`）⇒ 擦除；
-- 「索引」域是归纳族（如 `n : Nat`）⇒ 保留运行时表示，所以 Vec 的值带长度字段。
three : Vec Int (Succ (Succ (Succ Zero)))
three = Cons Int (Succ (Succ Zero)) 1 (Cons Int (Succ Zero) 2 (Cons Int Zero 3 (Nil Int)))

vlength : (a : Type) -> (n : Nat) -> Vec a n -> Nat
vlength a n xs = case xs of
  Nil b              => Zero
  Cons b m y ys      => Succ (vlength b m ys)
```

依赖模式匹配：`case` 对索引做 unification，只有可达分支才要求写出。

```vuna
-- vhead 只写 Cons：Nil 的结果索引 Vec a Zero 与 scrutinee 的 Vec a (Succ n)
-- 不可统一，因此该分支不可能，覆盖率检查合法地跳过它。
vhead : (a : Type) -> (n : Nat) -> Vec a (Succ n) -> a
vhead a n xs = case xs of
  Cons b m x rest => x
```

```vuna
-- Fin：上界索引让 FZero 只存在于 Succ n
data Fin : Nat -> Type where
  FZero : (n : Nat) -> Fin (Succ n)
  FSucc : (n : Nat) -> Fin n -> Fin (Succ n)

-- Vec a (Succ m) 与 Fin (Succ m) 同时排掉 Nil 与 FZero 两个不可能分支。
findex : (a : Type) -> (m : Nat) -> Vec a (Succ m) -> Fin (Succ m) -> a
findex a m xs i = case xs of
  Cons b k x rest => case i of
    FZero j   => x
    FSucc j h => x
```

```vuna
-- Eq：Refl 把两个索引统一成一个，sym/trans 不需要额外的证明构造
data Eq : Type -> Type -> Type where
  Refl : (a : Type) -> Eq a a

sym : (a : Type) -> (b : Type) -> Eq a b -> Eq b a
sym a b e = case e of
  Refl c => Refl c

trans : (a : Type) -> (b : Type) -> (c : Type) -> Eq a b -> Eq b c -> Eq a c
trans a b c p q = case p of
  Refl d => q
```

几条硬边界，写代码前值得先知道（M19 之后的状态）：

- **隐式索引推断可用（M15）**。构造子/函数的索引 binder 现在可以写隐式
  （`Cons : {a : Type} -> {n : Nat} -> ...`），调用点由实参或期望类型反推：
  ```vuna
  three : Vec Int (Succ (Succ (Succ Zero)))
  three = vapp (Cons 1 (Cons 2 Nil)) (Cons 3 Nil)
  ```
  推断仍受一阶限制：需要在**构造子推断位置**从内层实参反推（`FSucc FZero` 单独作为
  实参而外层没有期望类型）时仍可能报 `DT: unsolved metavariable`。
- **接口与实例（M15）**。`trait` / `instance` 走字典编码：`trait Pretty a` →
  `data Dict_Pretty : Type -> Type`，方法投影把字典当隐式参数，调用点的实例由**实例
  搜索**自动插入。`Show`/`Eq` 这类单参数接口直接可用；缺失/歧义实例有明确诊断。
  多参数接口报 `DT: interfaces must have exactly one parameter (M15 limitation)`。
- **终止性检查（M16）**。自递归函数必须结构递归：每个递归调用至少有一个实参是同一
  形参的真子项（`case` 分支里构造子的字段算子项）。否则报
  `DT: cannot prove termination of <f> (recursive call does not structurally decrease)`。
  互递归按「每个分量至少一次下降」近似，复杂尺寸变化矩阵不做。
- **擦除规则**：binder 的域是**宇宙**（`a : Type`）⇒ 擦除；域是**归纳族**（`n : Nat`
  这类索引）⇒ **保留运行时表示**。所以 `Vec a n` 的值是一条带长度索引字段的链表
  （`type 'a t_Vec = C_Vec_Nil | C_Vec_Cons of 'a t_Nat * 'a * 'a t_Vec`）。
  M16 探测确认索引**不能无条件擦除**（`vlen` 把长度索引当递归参数传下去，运行时真的
  读它）；完整擦除需要整程序使用分析，仍是后续工作。
- **`case` 分支与模式（M19）**。分支必须绑定构造子的全部显式 telescope binder（族参数
  与索引也各占一个位置，即使分支体不用）；**嵌套构造子模式已支持**（`Succ (Succ k)`，
  精化期改写成内层 case，因此内层同样要过覆盖检查）；兜底 `_ => ...`（变量模式等价）
  只能放**最后一个**分支。
- **多 clause 与方程左端模式（M19）**。`f p1 = e1` / `f p2 = e2` 保留语法，精化期合成
  单个 lambda + case 表达式树（标准模式矩阵），因此同一构造子的多个 clause、变量兜底、
  `f (Just x)` 与 `f (Just (Just y))` 共存都成立；多 clause 的参数个数必须一致。
- **`let` 与推断位 `case`（M19）**。`let ... in`（含 `where` 块）脱糖为
  `(\x => body) e`；`case` 可以出现在推断位（函数实参、`if` 分支、`let` 的 value），
  做法是建元变量当期望类型。
- **内建类型上的字面量模式（M19）**。`Bool` 的 `case` 降级成 `if`；`Int` / `String`
  的字面量分支降级成嵌套 `if` 链，因此**必须有一个变量/通配兜底分支**（值域穷尽不了）。
- **内建泛化（M19）**。`==` / `/=` 带隐式类型参数（`{a : Type} -> a -> a -> Bool`），
  精化到饱和应用时按第一个实参类型特化成 `bi_eq_int` / `bi_eq_str` 这类运行时函数；
  非 `Int` / `String` 报 `is only defined for Int and String`。`strFromInt` /
  `strUnpack` / `strPack` / `strLength` 已进 prelude（定义表在 `DtPrelude.vuna`）。
- **可达性决定分支能否省略**：若函数签名把索引**细化**（如 `Vec a (Succ m)`），
  与该索引不可统一的分支（`Nil`）**可以省略**，写了则报
  `DT: this branch is impossible`；若签名是**泛化**索引（`Vec a n`），则所有构造子
  都可达，必须写全，漏写报 `DT: case is not exhaustive: missing <C>`。
- **`data` 的 kind 必须是 `... -> Type` 的箭头链**，构造子的结果类型必须回到本族
  （否则报 `DT: constructor <C> does not return <F>`）。族名本身按 kind 入
  `globals`，每个构造子挂**完整 Pi 类型**；类型级 `Vec a n` 是**中性应用**，不做
  类型级求值（只在索引 unification 时按定义性相等比较）。
- **`check --dt` 不要求 `main`**（库文件可直接 check），`compile --dt` 要求 `main`
  且其类型为 `Int` / `String` / `Bool`。
- 元变量求解支持引用创建时已存在的局部变量（作用域检查会拒绝逃逸解）；高阶/开放解
  仍不支持。
- 洞 `_` 未解时的诊断带**位置与目标类型**：`DT: unsolved hole <loc> with goal <ty>`；
  `vuna goal` 可列出全部洞（见 [dt-tooling.md](dt-tooling.md)）。

## 命令与边界

```console
vuna check --dt file.vuna            # 精化 + 擦除检查（不生成代码）
vuna compile --dt file.vuna out.ml   # 擦除并生成 OCaml（main : Int/String/Bool）
vuna interp --dt file.vuna           # 核心求值器（NbE + delta）求值 main
```

`--dt` 不支持 `--root` 与包目录；`build` / `seed` 不支持 `--dt`。DT 路径与 HM 路径
互不影响：HM 的 interp + typed + split 语义与产物保持不变。

## 测试夹具

`test/run-tests.sh` 第 34 段，三条路径（`interp --dt` / `check --dt` / `compile --dt` +
`ocamlopt`）都跑：

- 正例 `test/corpus/dt/` 共 **31** 个：M13 `01_id`–`08_if`；M14 `09_nat`/`10_vec`/`11_fin`/`12_eq`；
  M15 `13_iface`/`14_solve`/`15_goal`；M16 `16_total`/`17_erase`；M18 `18_ctx`；
  M18.5 `19_lam`；M18.6 `20_rig`/`21_level`；M19 `22_let` 起共 10 个（`22_let`–`31_deriving_ord`）。
  数值见各 `.out` 文件。
- 负例 `test/corpus/dt_err/` 共 **26** 个：M13 的 `01_universe`、`02_conv`、
  `03_hole`、`05_import`、`06_unknown`、`07_lambda`、`08_arity`、`09_runtime_type`、
  `11_implicit_non_type`；M14 `04_nonexhaustive`/`10_impossible`/`12_case_int`/
  `13_unknown_ctor`/`14_bad_ctor_result`/`15_nested_pat`；M16 `16_nonterm`/`17_nested_total`；
  M18.5 `18_lam_type_used`；M18.6 `19_rig_type_runtime`；M19 `20_let_bad_pat` 起共 7 个。

## 相关阅读

- 设计与实现细节（Core TT / NbE / 精化规则 / 覆盖率）：[docs/dt-core.md](../dt-core.md)
- 与 HM 路径的边界：[architecture.md](../architecture.md)
- DT 后续阶段（M18.5–M24 单路径迁移）：[docs/roadmap.md](../roadmap.md)；能力落差证据：[dt-parity.md](dt-parity.md)
