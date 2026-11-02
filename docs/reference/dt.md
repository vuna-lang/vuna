# 语言参考：DT 子集（M23）

`--dt` 打开依赖类型（DT）路径：Core TT + NbE + 双向精化器 + 擦除型 codegen。
M14 加入**索引归纳族**与**依赖模式匹配**；M20 起**复用 Loader**（多文件 / `import` /
`--root`）；M21 起 `main : IO a`、`do` 与 `Base.IO` 可用；M22.1 起 `check` / `compile --dt`
接受**包目录**，M22.2 起 `base` 全部模块可精化，M22.3 起 `build` / `seed` 也接受 `--dt`。
M23 起 **`vuna interp` 默认走 DT**（DT 精化 + 核心求值，`--dt` 开关移除），语言夹具只走
DT 检查路径；record update、参数化 record、命名实例选择 `@inst`、实例重复/未知方法诊断、
`DtDerive` 的 Bool 常量与参数化 `Eq` 等能力补齐。`--dt` 开关只剩在
`check` / `compile` / `build` / `seed` 上，单一路径是终态（HM 在 M24 删除）；设计与边界见
[dt-core.md](../dt-core.md)，阶段状态见 [roadmap.md](../roadmap.md)。

```vuna
id : (a : Type) -> a -> a
id a x = x

-- 索引归纳族：Nat / Vec 都是用户声明的，没有内置 Nat
data Nat : Type where
  Zero : Nat
  Succ : Nat -> Nat

-- 族头只写 kind，箭头个数 = 族参数/索引个数；构造子用完整 telescope 重绑它们，
-- 前 arity 个 binder 对应族参数/索引，其余是字段。
data Vec : Type -> Nat -> Type where
  Nil : (a : Type) -> Vec a Zero
  Cons : (a : Type) -> (n : Nat) -> a -> Vec a n -> Vec a (Succ n)

-- 递归定义已解禁（delta 展开 + 终止性检查）
plus : Nat -> Nat -> Nat
plus a b = case a of
  Zero => b
  Succ k => Succ (plus k b)

-- 构造子应用要写全族参数/索引；`a : Type` 域擦除，`n : Nat` 索引保留运行时表示。
three : Vec Int (Succ (Succ (Succ Zero)))
three = Cons Int (Succ (Succ Zero)) 1 (Cons Int (Succ Zero) 2 (Cons Int Zero 3 (Nil Int)))
```

```vuna
-- 依赖模式匹配：case 对索引做 unification，只有可达分支要求写出。
-- `vhead` 的 Nil 分支结果索引 Vec a Zero 与 Vec a (Succ n) 不可统一 ⇒ 可省略。
vhead : (a : Type) -> (n : Nat) -> Vec a (Succ n) -> a
vhead a n xs = case xs of
  Cons b m x rest => x

-- Fin / Eq：索引让 FZero 只存在于 Succ n；Refl 把两个索引统一成一个。
data Fin : Nat -> Type where
  FZero : (n : Nat) -> Fin (Succ n)
  FSucc : (n : Nat) -> Fin n -> Fin (Succ n)

data Eq : Type -> Type -> Type where
  Refl : (a : Type) -> Eq a a

sym : (a : Type) -> (b : Type) -> Eq a b -> Eq b a
sym a b e = case e of
  Refl c => Refl c
```

几条硬边界，写代码前值得先知道：

- **隐式索引推断（M15）**。构造子/函数的索引 binder 可写隐式（`{n : Nat}`），调用点由
  实参或期望类型反推；推断仍受一阶限制（`FSucc FZero` 单独作实参且外层无期望类型时可能
  报 `DT: unsolved metavariable`）。
- **接口与实例（M15/M21/M23）**。`trait` / `instance` 走字典编码（`data Dict_C` + 方法投影
  + 实例搜索）；`Show`/`Eq` 直接可用，缺失/歧义实例有明确诊断；M21 起库定义 trait 的投影
  跨模块可见（`Base.IO` 重导出 `Functor(..)` / `Monad(..)`，`do`/`bind`/`pure`/`fmap`
  可用），实例方法支持构造子形参与多 clause。M23 起 `@inst`（含 `@M.inst`）可用，重复实例
  （含 `deriving` 生成的）报 `duplicate instance`、未知方法报 `instance has unknown method`；
  参数化 data 的 `deriving (Eq)` 可用（通用结构比较兜底，需要 `Eq` 字典的场景仍可能缺实例），
  `deriving (Show)` / `(Ord)` 只支持非参数化类型。多参数接口仍报
  `interfaces must have exactly one parameter (M15 limitation)`。
- **record（M15 降级，M23 补齐）**。`record` 声明、构造、字段访问、字段更新
  （`{ p | x = ... }`，可多字段）与参数化记录（`record Pair a b`）都先在 `DtRecords` 降成
  单构造器 `data` 再精化；`deriving (Show, Eq)` 由 `DtDerive` 生成（`Show` 用记录源名且
  仅非参数化、`Eq` 支持参数化），`Ord` 派生支持非参数化类型。**`where` 语法在终态不保留**
  （M23 夹具已改写为等价顶层 helper，M24 随 HM 删除语法支持，见 [limits.md](limits.md)）。
- **终止性检查（M16）**。自递归函数必须结构递归（每个递归调用至少有一个实参是同一形参
  的真子项），否则报 `cannot prove termination ...`；互递归不查，见 [limits.md](limits.md)。
- **擦除规则（M16/M22.3）**。运行时表示只由 `Core.rigIsErased` 判定：隐式 binder 与 `Type`
  域擦除（`Rig0`），显式值 / 显式索引 `(n : Nat)` 保留（`Rig1`）——`Vec a n` 的隐式索引
  版本无长度字段，显式索引版本保留（`vlen` 可读）；不做整程序使用分析。
- **`case` 分支与模式（M19）**。分支绑定构造子的全部显式 telescope binder；嵌套构造子
  模式改写成内层 case（内层同样过覆盖检查）；兜底 `_ => ...` 只能放**最后一个**分支。
- **多 clause 与方程左端模式（M19/M22.2）**。`f p1 = e1` / `f p2 = e2` 精化成单 lambda +
  case 树（`DtMatch`）；变量兜底、嵌套模式共存，参数个数必须一致；M22.2 起矩阵按族的
  构造子集合判覆盖（全覆盖不再补通配兜底），源级 `case` 的嵌套模式把后续 `_` 下沉。
- **`let` / 推断位 `case`（M19）**。`let ... in` 脱糖为 `(\x => body) e`；`case` 可出现在
  推断位（实参、`if` 分支、let value），做法是建元变量当期望类型。
- **内建字面量模式（M19）**。`Bool` 的 `case` 降级成 `if`；`Int` / `String` 字面量分支
  降级成嵌套 `if` 链，因此**必须有一个变量/通配兜底分支**。
- **Bool（M21/M22.2）**。`data Bool` 的 `True`/`False` 精化成核心 `TBool`，Bool 族不生成
  OCaml 变体，`if`/`case`/`main : Bool` 按族**短名**识别；`True`/`False` 必须来自
  `Base.Bool` 或本地 `data Bool`，prelude 只保留 `Bool` 类型别名（内建 trait 签名需要）。
- **内建泛化（M19/M22.2）**。`==`/`/=` 与 `<`/`<=`/`>`/`>=` 在饱和应用处按实参类型特化：
  `Int`/`String` 走具体运行时，其它类型走 `Eq`/`Ord` 字典（缺失给诊断）；刚性类型参数
  延迟提升成 `{d : Dict_C a}`，内建 Int/String/Bool 实例 + `deriving (Ord)` 参与搜索。
- **可达性**：签名把索引**细化**（`Vec a (Succ m)`）时不可统一的分支可省略（否则报
  `this branch is impossible`）；泛化索引（`Vec a n`）漏写报 `case is not exhaustive`。
- **`data` kind** 必须是 `... -> Type` 箭头链，构造子结果类型回到本族；族名与完整 Pi
  构造子类型进 `globals`，类型级 `Vec a n` 是中性应用（只在 unification 时比较）。
- **`main`**：`check --dt` 不要求 `main`，`compile --dt` 要求；`main` 可为
  `Int`/`String`/`Bool` 或 `IO a`（M21：取 IO 末字段后 `f 0`）。M23 起 `vuna interp`
  默认走 DT 核心求值器，只展示 `Int`/`String`/`Bool` 的值（`show` 语义，字符串带引号）；
  **任何 `main : IO a` 一律不能 interp**，报
  `DT: interp cannot execute effects (main : IO a); compile and run the program instead`
  并提示改用 `compile` + 运行产物；数据值 `main` 的夹具已改为
  `Int`/`String`（见 [limits.md](limits.md)）。
- **`strUnpack` / `strPack`**：M23 起没有声明 `List` 族时也映射到运行时桥接
  `bi_strUnpack` / `bi_strPack`；但核心求值器不归约这两个内建，用到它们的夹具用
  `.nointerp` 标记，只做 `compile --dt` + 运行。
- 洞 `_` 未解时诊断带位置与目标类型（`DT: unsolved hole <loc> with goal <ty>`），
  `vuna goal` 可列出全部洞（[dt-tooling.md](dt-tooling.md)）。

## 命令与边界

```console
vuna check --dt <file.vuna | package-dir>            # 精化 + 擦除检查
vuna compile --dt <file.vuna | package-dir> out.ml   # 擦除并生成 OCaml
vuna interp [--root DIR]... <file.vuna>              # DT 精化 + 核心求值 main（纯；单文件）
vuna build --dt [--no-compile] [DIR]                 # 包级 → .output/{main.ml,build.sh,bin/<pkg>}
vuna build --dt --split OUT [DIR]                    # 只产 OUT/main.ml + OUT/build.sh
vuna seed --dt OUT [DIR]                             # 同上；必须显式 OUT，拒绝写 seed/
```

`--dt` 复用 Loader：多文件 / `import` / `--root` / 包目录都可用（M22.1）；`build --dt`
与 `seed --dt` 于 M22.3 接线，输出是**整程序单文件** `main.ml` + `build.sh`，逐模块切分
留到 M24 的 seed 切换（[roadmap.md](../roadmap.md)「决策变更」）。`vuna interp` 自 M23 起
不再接受 `--dt`（传了报 `interp no longer takes --dt`、退出码 2）：它总是 DT 精化 +
核心求值，入口只能是单文件（可用 `--root` 加载依赖模块；包目录入口是 `check` /
`compile`）。HM 路径语义与产物不变。

## 测试夹具

`test/run-tests.sh` 第 34 段（`interp` / `check --dt` / `compile --dt` + `ocamlopt` 三路；interp
已无 `--dt`）。`.nointerp` 夹具跳过 interp，只做 `compile --dt` + 运行（效果/不可归约）。

- 正例 `test/corpus/dt/`（**44** 个）：按阶段 M13 `01_id`–`08_if`、M14 `09_nat`–`12_eq`、
  M15 `13_iface`–`15_goal`、M16 `16_total`/`17_erase`、M18–M18.6 `18_ctx`–`21_level`、
  M19 `22_let`–`31_deriving_ord`、M20 `32_parametric_data`、M20.5 `36_multi_clause`、
  M21 `33_poly_fn_field`/`34_io_do`/`35_io_main`/`37_instance_ctor_pat`（`34_io_do` /
  `35_io_main` 是 `main : IO a`，带 `.nointerp`）、M22.3
  `38_explicit_index`（显式索引是 Rig1、保留字段，对照 `17_erase` 的隐式索引擦除）、
  M23 `39_generic_eq`（无 `Eq` 实例时的泛型 `==` 兜底）、`40_record_update`（record
  update 降级）、`41_record_parametric`（参数化 record kind + swap）、
  `42_named_instance`（`@inst` 命名实例选择）、`43_deriving_parametric_eq`（参数化
  data 派生 `Eq`）、`44_short_circuit`（`&&`/`||` 短路，右侧 `1/0` 不求值）。
- 正例 `test/corpus/dt_base/`（`--root ../base/lib`，**8** 个）：M21 的 `Base.IO`/`do`/
  trait 投影与 `Base.IO` API 类型面；`06_base_string`（`str*` 的 `List` 族桥接）、
  `01_io_do`/`02_io_api`/`03_fmap_bind`（效果动作）与 `06_base_string` 带 `.nointerp`
  （interp 不执行效果、不归约 `strUnpack`/`strPack`）；`07_base_sort_map`（Ord 泛型比较
  + Map，`123`）、`08_base_facade`（`import Base`，`2`）。
- 正例 `test/corpus/dt_pkg/`（M22.1，3 个）：`01_exec`（运行 `42`）、`02_lib`（库包
  check 通过、compile 清晰报错）、`03_bad`（无 `vuna.toml`）；`corpus/dt_root/` 是
  `interp --root` 多文件夹具。
- 正例 `test/corpus/dt_io/`（M21，1 个）：`main : IO a` 的编译产物真正执行
  `Base.IO` 效果（核心求值器不执行效果，所以只比产物输出）。
- 负例 `test/corpus/dt_err/`（**33** 个）：M13 `01_universe`–`11_implicit_non_type`、
  M14 `04_nonexhaustive`–`15_nested_pat`、M16 `16_nonterm`/`17_nested_total`、
  M18.5 `18_lam_type_used`、M18.6 `19_rig_type_runtime`、M19 `20_let_bad_pat` 起、
  M20.5 `28_multi_clause_coverage`、M21 `27_poly_fn_field_err`/`29_instance_ctor_pat_coverage`、
  M23 `30_duplicate_instance`（`duplicate instance`）、`31_instance_unknown_method`
  （`instance has unknown method`）、`32_inst_sel_wrong_method`、`33_deriving_parametric_show`、
  `34_record_update_ambiguous`（`ambiguous field`）。

## 相关阅读

- 设计与实现细节：[docs/dt-core.md](../dt-core.md)；工具链：[dt-tooling.md](dt-tooling.md)
- 与 HM 路径的边界：[architecture.md](../architecture.md)；能力落差证据：[dt-parity.md](dt-parity.md)
- DT 阶段状态：[docs/roadmap.md](../roadmap.md)；已知限制：[limits.md](limits.md)