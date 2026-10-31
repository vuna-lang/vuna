# 语言参考：DT 子集（M14，实验性）

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

几条 M14 的硬边界，写代码前值得先知道：

- **索引 binder 必须显式**。`data Vec : Type -> Nat -> Type` 的构造子写
  `Cons : (a : Type) -> (n : Nat) -> a -> Vec a n -> Vec a (Succ n)`；隐式索引推断
  （`{n : Nat} -> ...` 靠调用点自动求解，例如 `FSucc FZero`）**M14 不做**，推迟到
  **M15**。M14 里期望类型能给出闭合解时隐式 binder 偶尔可用，但一旦要从调用点反推
  索引或解里出现局部变量，就报 `unsolved metavariable` / `type mismatch`。
- **擦除规则**：binder 的域是**宇宙**（`a : Type`）⇒ 擦除；域是**归纳族**（`n : Nat`
  这类索引）⇒ **保留运行时表示**。所以 `Vec a n` 的值是一条带长度索引字段的链表
  （`type 'a t_Vec = C_Vec_Nil | C_Vec_Cons of 'a t_Nat * 'a * 'a t_Vec`），索引不是
  零成本抽象（完整擦除分析属 M16）。
- **`case` 分支必须绑定构造子的全部显式 telescope binder**（族参数与索引也各占一个
  位置，即使分支体不用）：`Cons b m y ys => ...` 依次对应 `a`、`n`、字段 `a`、
  `Vec a m`。只支持**顶层构造子模式**；嵌套模式（`Succ (Succ k)`）报
  `DT: nested patterns are not supported yet`；兜底 `_ => ...`（变量模式等价）只能放
  **最后**一个分支。
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
- 只有**一阶（闭合）元变量解**；高阶/开放解、终止性/覆盖性证明都归 M15/M16。

## 命令与边界

```console
vuna check --dt file.vuna            # 精化 + 擦除检查（不生成代码）
vuna compile --dt file.vuna out.ml   # 擦除并生成 OCaml（main : Int/String/Bool）
vuna interp --dt file.vuna           # 核心求值器（NbE + delta）求值 main
```

`--dt` 不支持 `--root` 与包目录；`build` / `seed` 不支持 `--dt`。DT 路径与 HM 路径
互不影响：HM 的 interp + typed + split 语义与产物保持不变。

## 测试夹具

`test/run-tests.sh` 第 34 段，两条路径都跑：

- 正例 `test/corpus/dt/` 共 **12** 个：M13 的 `01_id`–`08_if`；M14 新增
  `09_nat`（`Nat` + 递归 `plus`，输出 `5`）、`10_vec`（`Vec` 的长度/首元素/尾，输出
  `4`）、`11_fin`（`Fin` 安全取下标，输出 `7`）、`12_eq`（`Eq` 的 `sym`/`trans`，
  输出 `7`）。
- 负例 `test/corpus/dt_err/` 共 **15** 个：M13 的 `01_universe`、`02_conv`、
  `03_hole`、`05_import`、`06_unknown`、`07_lambda`、`08_arity`、`09_runtime_type`、
  `11_implicit_non_type`；M14 新增/改名 `04_nonexhaustive`（漏写 `Succ` 分支）、
  `10_impossible`（写了不可达分支）、`12_case_int`（case 打在 `Int` 上）、
  `13_unknown_ctor`（未知构造子）、`14_bad_ctor_result`（构造子结果不是所属族）、
  `15_nested_pat`（嵌套模式）。

## 相关阅读

- 设计与实现细节（Core TT / NbE / 精化规则 / 覆盖率）：[docs/dt-core.md](../dt-core.md)
- 与 HM 路径的边界：[architecture.md](../architecture.md)
- DT 后续阶段（M15–M18）：[docs/roadmap.md](../roadmap.md)
