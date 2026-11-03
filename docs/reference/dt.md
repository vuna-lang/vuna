# 语言参考：DT（依赖类型）

DT 是 vuna 唯一类型检查器与 codegen 路径：Core TT + NbE + 双向精化器 + 擦除型
codegen。M14 加入**索引归纳族**与**依赖模式匹配**；M20 起**复用 Loader**（多文件 /
`import` / 包上下文）；M21 起 `main : IO a`、`do` 与 `Base.IO` 可用；M22.1 起 `check` /
`compile` 接受**包目录**，M22.2 起 `base` 全部模块可精化，M22.3 起 `build` 也走 DT；M23
起语言夹具只走 DT、`vuna interp` 改为精化后的核心求值，record update、
参数化 record、命名实例选择 `@inst`、实例重复/未知方法诊断、`Elab.Derive`（原
`DtDerive`）的 Bool 常量与参数化 `Eq` 等能力补齐；M24 起旧检查器与旧 codegen 删除。
M26 起每个源文件只有**唯一包上下文**（最近 `vuna.toml` + 依赖闭包；无 manifest 只有
base 上下文，ad-hoc 单文件自动注入 `Prelude`），删除环境根与「单文件 / 包」两套加载
语义，`compile`/`build` 统一产出逐模块 `.ml` + `build.sh`（`seed` 子命令由
`build --no-compile --out` 取代）。设计与边界见 [dt-core.md](../dt-core.md)，
阶段状态见 [roadmap.md](../roadmap.md)。

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
- **接口与实例（M15/M21/M23/M24.7）**。`trait` / `instance` 走字典编码（`data Dict_C` +
  方法投影 + 实例搜索）；`Show` / `Eq` / `Ord` 是库里的普通 trait（`Base.Show` /
  `Base.Eq` / `Base.Ord`），包上下文（含 ad-hoc 单文件）随自动注入的 `Prelude` 可见。
  缺失/歧义实例有明确诊断；M21 起
  库定义 trait 的投影跨模块可见（`Base.IO` 重导出 `Functor(..)` / `Monad(..)`，
  `do`/`bind`/`pure`/`fmap` 可用），实例方法支持构造子形参与多 clause。M23 起 `@inst`
  （含 `@M.inst`）可用，重复实例（含 `deriving` 生成的）报 `duplicate instance`、未知
  方法报 `instance has unknown method`；参数化 data 的 `deriving (Eq)` 可用（通用结构
  比较兜底，需要 `Eq` 字典的场景仍可能缺实例），`deriving (Show)` / `(Ord)` 只支持
  非参数化类型。多参数接口仍报
  `interfaces must have exactly one parameter (M15 limitation)`。
- **record（M15 降级，M23 补齐）**。`record` 声明、构造、字段访问、字段更新
  （`{ p | x = ... }`，可多字段）与参数化记录（`record Pair a b`）都先在 `Elab.Records`
  （原 `DtRecords`）降成单构造器 `data` 再精化；`deriving (Show, Eq)` 由 `Elab.Derive`
  （原 `DtDerive`）生成（`Show` 用记录源名且仅非参数化、`Eq` 支持参数化），`Ord` 派生
  支持非参数化类型。
- **`let` / `where` 绑定块（M24，M28 统一）**。`let` 与 `where` 共用同一套绑定块模型
  （顺序作用域 + 可选签名）：签名行 `name : Ty` 必须写在同名子句前，绑定可写
  `pat = expr` 或函数子句 `name pats = expr`（降级成 λ）。`where` 仍要求每个绑定有签名
  （缺签名报 `[TC_WhereNeedsSig]`），`let` 的签名行可选（M28 起）。两者都只能引用之前
  的绑定，不支持前向引用 / 自递归 / 互递归（递归放顶层定义组）。语法见
  [language.md](language.md)。
- **`axiom` 与 η 展开（M28，D10）**。`axiom name : Ty` 是**无体/不透明**的顶层：只在
  擦除/类型层可用，codegen 不生成运行时定义；运行时位置使用报
  `[CG_AxiomAtRuntime] axiom ... cannot be used at runtime`（`dt/59_axiom` 正例、
  `dt_err/42_axiom_runtime` 反例）。定义子句参数少于签名时按剩余 Pi 链 **η 展开**
  （补 `\_arityN` 并把 body 应用到新参数，`dt/59_eta`）；参数多于签名仍报
  `TC_DefMoreParams`，旧的 `TC_DefFewerParams` 保留在错误表里但不再触发。
- **跨模块签名量化（M28 / C29）**。顶层签名里自由小写名的 banned 集按**模块作用域**
  计算（只排除同一模块里另有定义的名字），跨模块同名小写名不再把类型变量误当全局名
  （正例 `corpus/packages/08_module_scope`）。
- **终止性检查（M16）**。自递归函数必须结构递归（每个递归调用至少有一个实参是同一形参
  的真子项），否则报 `cannot prove termination ...`；互递归不查，见 [limits.md](limits.md)。
- **擦除规则（M16/M22.3）**。运行时表示只由 `Core.rigIsErased` 判定：隐式 binder 与 `Type`
  域擦除（`Rig0`），显式值 / 显式索引 `(n : Nat)` 保留（`Rig1`）——`Vec a n` 的隐式索引
  版本无长度字段，显式索引版本保留（`vlen` 可读）；不做整程序使用分析。
- **`case` 分支与模式（M19/M28）**。分支绑定构造子的全部显式 telescope binder；兜底
  `_ => ...` / 变量兜底只能放**最后一个**分支。**M28 起所有 `case` 只有一条精化规范形**：
  先做家族无关的源级校验（兜底位置、重复构造子、重复字面量），需要嵌套模式或同构造子
  多分支消解时先降级成**模式矩阵**（`Elab.Match.multiToCaseExpr`）——矩阵产物就是规范形
  （每构造子一个分支 + 变量子模式），规范形再按 scrutinee 家族降低（`Bool` → `if`、
  `Int`/`String` 字面量 → `if` 链、归纳族 → `TCase`）。精化器里不再有「去重降级」「嵌套
  模式折叠」两条旁路（旧 `checkCaseDedup` 与 `foldPending` 已删）。
- **冗余/不可达分支（M28/B15）**。`case` 的不可达分支从「静默忽略」改为**稳定诊断**：
  重复构造子分支（前面的同构造子分支子模式全为变量/通配）报 `TC_RedundantCtorBranch`；
  重复字面量报 `TC_RedundantLiteralBranch`；兜底分支之后还有字面量分支报
  `TC_BranchAfterCatchAll`（兜底之后写构造子分支沿用 `TC_CatchAllNotLast`）。需要矩阵
  消解的同构造子多分支（`Just (TStr s)` 之后的 `Just v`）不是冗余——矩阵会让两条都可达。
- **多 clause 与方程左端模式（M19/M22.2）**。`f p1 = e1` / `f p2 = e2` 精化成单 lambda +
  case 树（`Elab.Match`，原 `DtMatch`）；变量兜底、嵌套模式共存，参数个数必须一致；M22.2
  起矩阵按族的构造子集合判覆盖（全覆盖不再补通配兜底），源级 `case` 的嵌套模式把后续 `_`
  下沉。M28 起这套矩阵也是源级 `case` 的**唯一**降级入口（多 clause 与 `case` 共用）。
- **`let` / 推断位 `case`（M19）**。`let ... in` 脱糖为 `(\x => body) e`；`case` 可出现在
  推断位（实参、`if` 分支、let value），做法是建元变量当期望类型。
- **内建字面量模式（M19/M28）**。`Bool` 的 `case` 降级成 `if`；`Int` / `String` 字面量分支
  降级成嵌套 `if` 链，因此**必须有一个变量/通配兜底分支**（`TC_IntStringCaseNeedsFallback`）；
  重复字面量与兜底之后的分支分别报 `TC_RedundantLiteralBranch` / `TC_BranchAfterCatchAll`
  （M28）。
- **Bool（M21/M22.2/M27）**。`Bool` 是 base 的普通 `data` 声明，canonical 身份是完整
  符号 `Base.Bool.Bool`（`True` / `False` = `Base.Bool.True` / `Base.Bool.False`）；
  `True`/`False` 精化成核心 `TBool`，canonical Bool 族不生成 OCaml 变体（运行时表示就是
  OCaml `bool`）。`if` / 字面量 `case` / `main : Bool` 一律按 canonical 符号判定，
  **不再有族短名（`lastName`）判定、`Base.Bool` 双身份或 prelude 桩**。用户写的同名
  `data Bool` 是另一个普通族（模块内 mangle 成 `<Module>.Bool`），不受特殊对待。
- **内建泛化（M19/M22.2/M24.7）**。`==`/`/=` 与 `<`/`<=`/`>`/`>=` 在饱和应用处按实参
  类型特化：`Int` 走具体运行时，`String` 的 `==` 走 `bi_eq_str`，`Bool` 走库的 `Eq Bool`
  实例，比较的 `String`/`Bool` 走泛型运行时；其它类型（含用户 data）走 `Eq`/`Ord`
  字典——具体类型无实例或没有对应类可见（只可能出现在显式绕开 `Prelude` 的上下文）时
  退回泛型运行时兜底。刚性类型参数延迟提升成 `{d : Dict_C a}`；库里的
  `Int`/`String`/`Bool` 实例与 `deriving` 实例参与搜索。
- **等式搬运与不可达分支（M24.5/M28）**。`case` 打在裸形参或包装族上时，把 scrutinee 的
  值与构造子结果值再合一（`dt/46_rep`）；`plus` 一类类型级函数的定义性相等可用于 `Refl`
  收尾，归纳步靠反射 + `cong`（`dt/48`–`50`）。剩余边界见 [dt-parity.md](dt-parity.md) §6.3。
- **类型族（M24.6）**。结果类型以 `Type` 收尾的函数（`sel : Nat -> Type`、
  `Id : (a : Type) -> Type`）整体擦除、不生成运行时定义；正例 `dt/51`/`52`，在运行时
  定义里把擦除族参数当值用报错（`dt_err/39`）。
- **可达性（M14/M24.5/M28）**。省略一个分支与写出一个分支走**同一套判据**
  `Elab.Case.BranchVerdict`：构造子结果索引与 scrutinee 索引一阶合一失败
  （`TC_ImpossibleBranchIndex`），或分支上下文含空归纳族（`TC_ImpossibleBranchEmptyCtx`，
  空族判定的唯一实现是 `isEmptyFamilyValue` → `allCtorsUnsatisfiable`）⇒ 分支不可达：
  **省略合法、写出报错**（即使分支体自身类型正确，`dt_err/41d`）。签名把索引细化
  （`Vec a (Succ m)`）时不可统一的分支可省略（`dt/47_lookup_env`）；泛化索引（`Vec a n`）
  漏写报 `case is not exhaustive`。索引/上下文索引**含中性项**时无法证明空族，判据保守判
  「可能非空」：分支必须写出且会被接受（`dt/58b` 的 `Mk : W f (f Zero)`），不会误判成空族。
  M28 之前的「体检查失败就改报 impossible branch」特判已删——写出分支的诊断在精化分支体
  之前给出，与覆盖率完全对称。
- **`data` kind** 必须是 `... -> Type` 箭头链，构造子结果类型回到本族；族名与完整 Pi
  构造子类型进 `globals`，类型级 `Vec a n` 是中性应用（只在 unification 时比较）。
- **`main`**：`check` 不要求 `main`，`compile` 要求；`main` 可为
  `Int`/`String`/`Bool` 或 `IO a`（`IO` 的判定只认 canonical `Base.IO.IO`；M21：取 IO
  末字段后 `f 0`）。`vuna interp` 是 DT 核心求值器，只展示 `Int`/`String`/`Bool` 的值，
  与产物用同一展示语义（`String` 走 `strShow` 转义，见
  [primitives.md](primitives.md)）；**任何 `main : IO a` 一律不能 interp**，报
  `interp cannot execute effects (main : IO a); compile and run the program instead`
  并提示改用 `compile` + 运行产物；数据值 `main` 的夹具用
  `Int`/`String`（见 [limits.md](limits.md)）。
- **`str*` 与 interp 边界分类**。返回/接收 `List` 的原语（`strUnpack` / `strPack` /
  `strConcatMany` / `strSubstTemplate`）映射到 List 桥接 helper，桥接只为 canonical
  `Base.List.List` 生成（`Codegen.Term.dtListBridge`）；核心求值器**不归约**它们
  （List 桥接依赖该族的构造子表示），`a / 0` 与全部效果原语同样不归约——这是显式分类，
  不是静默错值。用到它们的夹具用 `.nointerp` 标记，只做 `compile` + 运行。完整表见
  [primitives.md](primitives.md) 的 interp 归约边界一节。
- 洞 `_` 未解时诊断带位置与目标类型（`DT: unsolved hole <loc> with goal <ty>`），
  `vuna goal` 可列出全部洞（[dt-tooling.md](dt-tooling.md)）。

## 命令与边界

```console
vuna check <file.vuna | package-dir>                     # 精化 + 擦除检查
vuna compile [--no-print] <file.vuna | package-dir> OUTDIR  # 擦除并逐模块生成 OCaml 目录
vuna interp <file.vuna>                                  # DT 精化 + 核心求值 main（纯）
vuna build [--no-compile] [--out DIR] [package-dir]      # 逐模块 codegen（默认 `<PKG-DIR>/.output`）→ 输出目录/bin/<pkg>
```

DT 复用 Loader：多文件 / `import` / 包上下文都可用；codegen 只有一种输出模型（逐模块
`.ml` + `build.sh`，`Vuna_runtime` + 各模块 + `Main`，无 `.mli`，见
[bootstrap.md](bootstrap.md)）。`vuna interp` 总走 DT 精化 + 核心求值，入口是单个源文件
（按最近 `vuna.toml` 获得包上下文，无则 base-only）；包目录入口给 `check` / `compile`。

## 测试夹具

`test/run-tests.sh` 第 34 段（`interp` / `check` / `compile` + `ocamlopt` 三路）。
`.nointerp` 夹具跳过 interp，只做 `compile` + 运行（效果/不可归约）。

- 正例 `test/corpus/dt/`（64 个）：按阶段 M13 `01_id`–`08_if`、M14 `09_nat`–`12_eq`、
  M15 `13_iface`–`15_goal`、M16 `16_total`/`17_erase`、M18–M18.6 `18_ctx`–`21_level`、
  M19 `22_let`–`31_deriving_ord`、M20 `32_parametric_data`、M20.5 `36_multi_clause`、
  M21 `33_poly_fn_field`/`34_io_do`/`35_io_main`/`37_instance_ctor_pat`（`34_io_do` /
  `35_io_main` 是 `main : IO a`，带 `.nointerp`）、M22.3
  `38_explicit_index`（显式索引是 Rig1、保留字段，对照 `17_erase` 的隐式索引擦除）、
  M23 `39_generic_eq`（无 `Eq` 实例时的泛型 `==` 兜底）、`40_record_update`（record
  update 降级）、`41_record_parametric`（参数化 record kind + swap）、
  `42_named_instance`（`@inst` 命名实例选择）、`43_deriving_parametric_eq`（参数化
  data 派生 `Eq`）、`44_short_circuit`（`&&`/`||` 短路，右侧 `1/0` 不求值）；
  M24.5 `46_rep`（scrutinee 反射）/`47_lookup_env`（空族上下文省略分支）/
  `48_eq_defeq`（`plus` 定义性相等）/`49_eq_induction`（归纳 + `cong`）/
  `50_eq_transport`（`sym`/`trans`/`subst`/`cast`）；M24.6 `45_ctor_shape`（构造子
  字段形状）、`51_type_family`/`52_type_family`（类型族整体擦除）；M24.7
  `53_derived_ord_operator`（deriving(Ord) 后 `<`/`<=` 走 Ord 字典）；M28
  `58_case_matrix`（源级 `case` 的规范形：嵌套模式/同构造子多分支经模式矩阵、字面量
  if 链、Bool if 降级）、`58b_case_absurd`（空族/中性索引按同一判据：可省略的分支与
  保守判非空的中性索引分支）、`59_axiom`（axiom 的类型层使用）、`59_eta`（η 展开）、
  `59_let_where`（let/where 统一绑定块 + let 可选签名）、`60_erasure_unify`
  （擦除单判据 + 合一）、`61_namespace_dual`（type/value 双命名空间）。
- 正例 `test/corpus/dt_base/`（8 个，所在 corpus 包上下文 `test/corpus/vuna.toml`，
  只依赖 `base`）：M21 的 `Base.IO`/`do`/
  trait 投影与 `Base.IO` API 类型面；`06_base_string`（`str*` 的 `List` 族桥接）、
  `01_io_do`/`02_io_api`/`03_fmap_bind`（效果动作）与 `06_base_string` 带 `.nointerp`
  （interp 不执行效果、不归约 `strUnpack`/`strPack`）；`07_base_sort_map`（Ord 泛型比较
  + Map，`123`）、`08_base_facade`（`import Base`，`2`）。
- 正例 `test/corpus/dt_pkg/`（3 个包目录）：`01_exec`（运行 `42`）、`02_lib`（库包
  check 通过、compile 清晰报错）、`03_bad`（无 `vuna.toml`）；`corpus/dt_ad_hoc/` 是
  **包内 ad-hoc 单文件**夹具（包根 `Main.vuna` + `lib/Lib.vuna`，验证自动注入 Prelude
  与最近 manifest 上下文）。
- 正例 `test/corpus/dt_io/`（1 个）：`main : IO a` 的编译产物真正执行 `Base.IO` 效果
  （核心求值器不执行效果，所以只比产物输出）。
- 负例 `test/corpus/dt_err/`（45 个）：M13–M23 的诊断夹具（`duplicate instance`、
  `instance has unknown method`、`deriving_parametric_show`、`record_update_ambiguous`
  等），M24 新增 `35_where_no_sig`（期望片段 `needs a type signature`）；M24.5 新增
  `36_diff_index_case`/`37_impossible_branch`/`38_empty_ctx_branch`，M24.6 新增
  `39_type_family_runtime_use`（类型族擦除后的运行时误用）；M28 新增
  `40_universe_*`（严格分层/kind 反例）、`41_redundant_ctor_branch` /
  `41b_redundant_literal` / `41c_branch_after_catchall`（冗余/不可达分支诊断）与
  `41d_written_unreachable_branch`（可达性判据对「写出」与「省略」对称：上下文空族的
  分支写出来也报错）、`42_axiom_runtime`（axiom 运行时使用）、`44_namespace_value_as_type`
  （类型位置的值名）；`08_arity` 改为参数多于签名（`TC_DefMoreParams`；原 `fewer
  parameters` 场景由 η 展开接管）。
- `where` 签名正例在 `test/corpus/typed_ok/06_where_fwd`、`07_where_mutual`、
  `08_where_self`（局部辅助函数 / 顶层递归的对照）与 `corpus/fmt` 的 where 黄金例。

## 相关阅读

- 设计与实现细节：[dt-core.md](../dt-core.md)；工具链：[dt-tooling.md](dt-tooling.md)
- 编译链与改动定位：[architecture.md](../architecture.md)；能力落差证据（历史）：
  [dt-parity.md](dt-parity.md)
- DT 阶段状态：[roadmap.md](../roadmap.md)；已知限制：[limits.md](limits.md)