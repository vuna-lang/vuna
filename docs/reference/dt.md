# 语言参考：DT 子集（M22.2，实验性）

`--dt` 打开依赖类型（DT）路径：Core TT + NbE + 双向精化器 + 擦除型 codegen。
M14 加入**索引归纳族**与**依赖模式匹配**（`data` + `case`），解除递归定义限制；
M20 起**复用 Loader**，支持多文件、`import` 与 `--root`；M21 起 `main : IO a`、`do`、
effectful 内建与 `Base.IO` 可用；M22.1 起 `check` / `compile --dt` 接受**包目录**，
M22.2 起 `base` 全部模块（`Base.String` / `Map` / `Sort` / 门面 `Base` / `Prelude`）可精化。
DT 仍是**显式 opt-in**：`build` / `build --split` / `seed` 不接受 `--dt`（M22.3）；
HM 路径语义与产物不变。
设计与边界见 [docs/dt-core.md](../dt-core.md)，阶段状态与阻碍见 [roadmap.md](../roadmap.md)。

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
  搜索**自动插入。`Show`/`Eq` 这类单参数接口直接可用；缺失/歧义实例有明确诊断。M21 起库定义 trait 的
  方法投影跨模块可见：`Base.IO` 重导出 `Functor(..)` / `Monad(..)`，所以 `import Base.IO`
  后 `do` / `bind` / `pure` / `fmap` 直接可用；`import Base.Monad` 路径不变。实例方法
  支持构造子形参与多 clause（与普通函数同一条模式矩阵）。
  多参数接口报 `DT: interfaces must have exactly one parameter (M15 limitation)`。
- **终止性检查（M16）**。自递归函数必须结构递归：每个递归调用至少有一个实参是同一
  形参的真子项（`case` 分支里构造子的字段算子项）。否则报
  `DT: cannot prove termination of <f> (recursive call does not structurally decrease)`。
  **互递归不查**（只做逐调用结构下降），跨调用循环可能被接受，见
  [limits.md](limits.md)。
- **擦除规则**：binder 的域是**宇宙**（`a : Type`）⇒ 擦除；域是**归纳族**（`n : Nat`
  这类索引）⇒ **保留运行时表示**。所以 `Vec a n` 的值是一条带长度索引字段的链表
  （`type 'a t_Vec = ...`）；索引**不能无条件擦除**（`vlen` 把长度当递归参数读），
  完整擦除需整程序使用分析（M22.3）。
- **`case` 分支与模式（M19）**。分支必须绑定构造子的全部显式 telescope binder（族参数
  与索引也各占一个位置，即使分支体不用）；**嵌套构造子模式已支持**（`Succ (Succ k)`，
  精化期改写成内层 case，因此内层同样要过覆盖检查）；兜底 `_ => ...`（变量模式等价）
  只能放**最后一个**分支。
- **多 clause 与方程左端模式（M19）**。`f p1 = e1` / `f p2 = e2` 保留语法，精化期合成
  单个 lambda + case 表达式树（标准模式矩阵，实现在 `Vuna.Compiler.DtMatch`）；同一构造子
  多 clause、变量兜底、嵌套模式共存都成立，参数个数必须一致。M22.2 起矩阵按**族的构造子
  集合**判断列覆盖：该列构造子已全覆盖时不再补通配兜底（`mergeBy` 一类多列子句的假
  `missing Cons` 消失）；源级 `case` 的嵌套模式折叠会把后续 `_` 分支下沉为每层内层 case
  的兜底。**仍有限制**：终止性只接受结构递归（见 [limits.md](limits.md)）。
- **`let` 与推断位 `case`（M19）**。`let ... in`（含 `where` 块）脱糖为
  `(\x => body) e`；`case` 可以出现在推断位（函数实参、`if` 分支、`let` 的 value），
  做法是建元变量当期望类型。
- **内建类型上的字面量模式（M19）**。`Bool` 的 `case` 降级成 `if`；`Int` / `String`
  的字面量分支降级成嵌套 `if` 链，因此**必须有一个变量/通配兜底分支**（值域穷尽不了）。
- **Bool 的运行时表示已统一（M21）**，**值构造子已在 M22.2 去桩**：`data Bool`
  （`Base.Bool.Bool` 或单文件声明）的 `True` / `False` 精化成核心 `TBool`，Bool 族不生成
  OCaml 变体，`if` / `case` / `main : Bool` 按族**短名**识别；`True` / `False` 不再由
  prelude 提供，必须来自 `Base.Bool` 或本地 `data Bool`。prelude 只保留 `Pair "Bool"
  (TType 0)` 这一条**类型别名**（内建 trait 方法签名与不含 `data Bool` 的程序需要它），
  Bool 的**数据定义**仍以 `Base.Bool` 为唯一权威（决策见 [roadmap.md](../roadmap.md)
  「决策变更」）。
- **内建泛化（M19/M22.2）**。`==` / `/=` 带隐式类型参数（`{a : Type} -> a -> a -> Bool`），
  饱和应用按实参类型特化：`Int` / `String` 走 `bi_*_int` / `bi_*_str`，其它类型走 `Eq`
  字典投影（无实例给出缺失诊断）。`<` / `<=` / `>` / `>=` 同理：`Int` → `bi_*_int`，
  `String` / `Bool` → `bi_*_generic`，其它类型走 `Ord` 字典（内建 Int/String/Bool 实例 +
  `deriving (Ord)`）；刚性类型参数延迟提升成 `{d : Dict_Ord a}`。`strFromInt` 等已进
  prelude（`DtPrelude.vuna`）。
- **可达性决定分支能否省略**：若函数签名把索引**细化**（如 `Vec a (Succ m)`），
  与该索引不可统一的分支（`Nil`）**可以省略**，写了报 `this branch is impossible`；
  签名是**泛化**索引（`Vec a n`）时所有构造子都可达，漏写报 `case is not exhaustive`。
- **`data` 的 kind 必须是 `... -> Type` 的箭头链**，构造子的结果类型必须回到本族
  （否则报 `DT: constructor <C> does not return <F>`）。族名本身按 kind 入
  `globals`，每个构造子挂**完整 Pi 类型**；类型级 `Vec a n` 是**中性应用**，不做
  类型级求值（只在索引 unification 时按定义性相等比较）。
- **`check --dt` 不要求 `main`**（库文件可直接 check），`compile --dt` 要求 `main`；
  `main` 的类型可以是 `Int` / `String` / `Bool`（普通值），也可以是 `IO a`（M21：
  按类型识别 IO 族、取构造子末字段 `f` 后 `f 0`）。编译产物执行效果；`interp --dt`
  的纯核心求值器不执行效果，所以效果夹具只比编译产物输出。
- 元变量求解支持引用创建时已存在的局部变量（作用域检查会拒绝逃逸解）；高阶/开放解
  仍不支持。
- 洞 `_` 未解时的诊断带**位置与目标类型**：`DT: unsolved hole <loc> with goal <ty>`；
  `vuna goal` 可列出全部洞（见 [dt-tooling.md](dt-tooling.md)）。

## 命令与边界

```console
vuna check --dt <file.vuna | package-dir>            # 精化 + 擦除检查（不生成代码）
vuna compile --dt <file.vuna | package-dir> out.ml   # 擦除并生成 OCaml（main : Int/String/Bool/IO a）
vuna interp --dt file.vuna                           # 核心求值器（NbE + delta）求值 main（单文件）
```

M20 起 `--dt` **复用 Loader**：支持多文件 / `import` / `--root`，参数化 `data Foo a : Type`
也可用；M22.1 起 `check` / `compile --dt` 接受**包目录**（可执行包同时加载入口，库包只
`check`；不存在路径 / 坏目录 / `interp --dt <dir>` 都是清晰错误）。`build` / `seed` 仍不
支持 `--dt`（M22.3）。HM 路径语义与产物不变。

## 测试夹具

`test/run-tests.sh` 第 34 段三条路径（`interp --dt` / `check --dt` / `compile --dt` + `ocamlopt`）。

- 正例 `test/corpus/dt/` 共 **37** 个：M13 `01_id`–`08_if`；M14 `09_nat`/`10_vec`/`11_fin`/`12_eq`；
  M15 `13_iface`/`14_solve`/`15_goal`；M16 `16_total`/`17_erase`；M18 `18_ctx`；
  M18.5 `19_lam`；M18.6 `20_rig`/`21_level`；M19 `22_let` 起共 10 个（`22_let`–`31_deriving_ord`）；
  M20 `32_parametric_data`（`data Foo a : Type` 写法 + 构造子字段引用族参数）；M21
  `33_poly_fn_field`（函数字段被索引精化）、`34_io_do`/`35_io_main`（main : IO a 执行）、
  `37_instance_ctor_pat`（实例方法多 clause + 构造子形参）；M20.5 `36_multi_clause`。
  数值见各 `.out` 文件。
- 正例 `test/corpus/dt_base/`（M21/M22.2，`--root ../base/lib`，**8** 个）：M21 的
  `import Base.IO` 后 `do`/`bind`/`pure`/`fmap` 可用、`Base.IO` 全部 API 的类型面、
  `import Base.Monad` + `Base.Maybe` 的 trait 投影与实例方法构造子形参；M22.2 新增
  `06_base_string`（`import Base.String`，`join`/`split` 走 `dtp_unpack`/`dtp_pack`
  桥接）、`07_base_sort_map`（`Base.Sort` 的 Ord 泛型比较 + `Base.Map`，运行 `123`）、
  `08_base_facade`（`import Base` 门面，运行 `2`）。三条路径（interp / check /
  compile+run）与 golden 与 interp==run 对拍；带 `.nointerp` 标记的夹具（`06`）只比
  check / compile / run——核心求值器还没有 `strUnpack` / `strPack` 的归约。
- 正例 `test/corpus/dt_pkg/`（M22.1，包目录，3 个）：`01_exec`（可执行包，运行 `42`）、
  `02_lib`（库包：check 通过、compile 清晰报错且不写输出）、`03_bad`（无 `vuna.toml`，
  清晰错误）。
- 正例 `test/corpus/dt_io/`（M21，效果执行，1 个）：`main : IO a` 的编译产物真正执行
  `Base.IO` 效果（`print`）。核心求值器不执行效果，所以这一段只比编译产物输出。
- 负例 `test/corpus/dt_err/` 共 **29** 个：M13 的 `01_universe`、`02_conv`、
  `03_hole`、`05_import`、`06_unknown`、`07_lambda`、`08_arity`、`09_runtime_type`、
  `11_implicit_non_type`；M14 `04_nonexhaustive`/`10_impossible`/`12_case_int`/
  `13_unknown_ctor`/`14_bad_ctor_result`/`15_nested_pat`；M16 `16_nonterm`/`17_nested_total`；
  M18.5 `18_lam_type_used`；M18.6 `19_rig_type_runtime`；M19 `20_let_bad_pat` 起共 7 个；
  M21 `27_poly_fn_field_err`（函数字段精化失败）、`29_instance_ctor_pat_coverage`
  （实例方法多 clause 覆盖不足）；M20.5 `28_multi_clause_coverage`。

## 相关阅读

- 设计与实现细节（Core TT / NbE / 精化规则 / 覆盖率）：[docs/dt-core.md](../dt-core.md)
- 与 HM 路径的边界：[architecture.md](../architecture.md)
- DT 阶段状态与当前阻碍：[docs/roadmap.md](../roadmap.md)（「阶段状态总览」+ 各阶段
  「当前阻碍」）；历史能力落差证据：[dt-parity.md](dt-parity.md)
