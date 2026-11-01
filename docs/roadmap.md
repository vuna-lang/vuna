# Vuna 路线图

本文记录 vuna 的当前基线与后续规划。

## 维护规则

- **已完成阶段整段删除**：阶段完成后，删除该阶段的目标、范围、验收、设计要点、实现状态等详细段落，正文中不再保留。
- **已完成阶段一句话**：只在「已完成」列表中保留一句话摘要（阶段编号 + 核心交付物）；需要历史细节时查 git 历史。
- **未完成阶段保留细节**：保留目标、范围、验收，可继续补充设计要点与前置条件。
- **新增阶段先写入「下一步 / 待办」**，完成后按上述规则收敛。
- **研究储备与并行轨道不占 M 编号**；研究储备进入排期时再分配编号。
- **插入阶段用 x.5 编号**（如 M12.7、M18.5），主序列保持整数编号。
- **推翻旧决策必须留痕**：不静默改写历史，在「决策变更」节记一行（原决策 → 新决策 → 理由），
  阶段细节进 [docs/history.md](history.md)。

## 项目前提（2026-11 明确）

vuna **尚未发布任何版本**：没有外部用户、没有下游生态、没有历史包袱。全部源码
（`compiler/`、`base/`、`lib/`、`test/`、`examples/`）都在本仓库内，可以整体重写。

由此导出三条规划原则：

1. **不为兼容而保留**。「两条路径并行」只在迁移期存在，不是终态；任何「以后可能有人依赖」
   都不构成保留理由。评估一个遗留物只看一条：**它在终态里还成立吗**。
2. **允许推翻已定决策**。M18 的「编译器本体暂不全量迁移 DT」是在「DT 仍是单文件 opt-in、
   擦除未完成」的前提下做的；这两个前提正被 M18.5–M22 直接消掉，因此该决策**已被推翻**。
3. **终态优先于渐进**。能一次重写就一次重写（签名收敛、record/deriving 去留都是此类），
   不为平滑过渡额外造过渡层；一次性工具用完即弃。

## 已完成

- M1：offside layout parser。
- M2：call-by-value 求值器。
- M3：自解释器。
- M4：动态 value 表示 codegen 与编译版解释器。
- M5：文件即模块、import / qualified / alias、模块名与循环检查。
- M6：vuna 自写 codegen 与 seed 固定点。
- M7：HM 类型检查、模块类型名解析、顶层推断与编译器自检。
- M8：原生 OCaml typed codegen（data → variant，Int/String/Bool/List 原生），typed 默认并完成 typed 自举。
- M9：诊断与语言可用性——全链路 span、运行时错误 `文件:行:列`、穷尽性/冗余检查、非 0 退出码。
- M10：模块系统 v2——模块头与显式导出列表、抽象类型、`module B` / `B.name` 重导出、`_` 前缀隐私与模块路径不变式。
- M10.5：类型表达力——记录类型与 trait（单参数、相干默认、命名实例、孤儿检查、`deriving`），内置 `Show` / `Eq` / `Ord` 与方法级字典穿参。
- M11：标准库——独立标准库成员包（现 `vuna-base`，当时叫 `vuna-stdlib`；模块现 `Base.*`），高阶 kind 与一般约束泛化，`do` 语法糖与 IO 组合子，编译器成为标准库首个用户。
- M11.5：包管理与工具链——`vuna.toml`、workspace 与依赖 DAG、`[export]` 跨包可见性、三目录约定，以及 `build` / `test` / `fmt` / `repl` / `doc`。
- M12：性能与编译模型——分离编译（vuna 模块 → OCaml `.ml` / `.mli`）与 ocamlopt 模块级增量构建，seed 改为多文件文件集，新增机器无关指标门槛。
- M11.6：fmt 完善——注释保留与 100 列行宽折行。
- M12.5：工具链与自举边界拆分——编译器独立为成员包 `vuna-compiler`，seed 只含编译器入口闭包（63 → 49 个文件），工具链移出 TCB；同期修复编译性能（AVL 类型替换 / 路由表 / 快速 seed 构建，compiler 闭包 build --split ~32s → ~2s）。
- M12.6：main / IO 语义——可执行入口 `main : IO a` 由运行时执行（无公开 runner），用户包与 `vuna interp`/`--root` 入口都不能直接调用 effectful 内建（只能经 `Base.IO`，当时叫 `Vuna.IO`）；IO 组合统一走 Functor/Monad trait（`fmap`/`bind`/`pure`、`>>=`、`do`），效果 API 直接 IO 化（print/getArgs/readFile 等返回 IO，内部 prim_*）；seed 51 个文件 / ~0.86 MB；`vuna interp` / `vuna test` 保留纯 main 结果 show 的调试约定。
- M12.7：DT 前置清理——删除 dynamic codegen（`Vuna.Codegen`）与 `--no-typecheck` / `--typecheck` / `--typed` / `build --no-print` / `--out` / 裸 compile 回退，typed 成为唯一 codegen；`check` 改为纯类型检查（单次 typecheck），clause arity 诊断统一到 typecheck；默认模块根改为当前包；seed 49 个文件 / ~0.81 MB。
- M13：DT 地基——新增 Core TT（`Type`/Pi/应用/lambda/if，NbE + beta/delta/eta，非累积宇宙）、双向精化器（一阶 metavariable、类型级隐式插入、delta 类型别名）、擦除型 DT codegen 与 `interp --dt` 核心求值器；`--dt` 单文件 opt-in（compile/check/interp），HM 路径零改动；新增 `docs/dt-core.md` 设计稿；seed 57 个文件 / ~0.92 MB。
- M12.8：命名空间、Prelude 与包级构建——标准库改为 `vuna-base` / `Base.*`，编译器模块迁到 `Vuna.Compiler.*`（门面 `Vuna.Compiler.Common`）；新增顶层 `Prelude`（重导出 Pair/Bool/List/Maybe/Result/String/Monad，不含 `Base.IO` 效果函数），包模式自动导入、原始 `--root` 模式不导入；新增 `vuna compile --package`（`.output/{lib,app}`）与 `vuna build`（ocamlopt → `.output/bin/<包名>`），`--split` / `seed` 保留扁平分离 codegen；seed 61 个文件 / ~1.2 MB。
- M14：索引族与依赖模式匹配——Core 增加 `TCon` / `TCase`（值域 `VCon` / `VCase`），`data F : <kind> where` 的索引归纳族（构造子写完整显式 telescope，宇宙域 binder 擦除、索引保留运行时表示），`case` 做索引 unification 与分支可达性/覆盖率判定（不可满足分支可合法省略、写错则拒绝），解除递归定义限制（SCC 分组，终止靠 delta 展开 fuel）；核心求值器与擦除型 codegen 同步扩展（运行时族 → OCaml 变体、构造子名加族前缀、`TCase` → `match` + 不可能分支 `failwith`）；新增 `test/corpus/dt/09_nat` / `10_vec` / `11_fin` / `12_eq` 正例与 `dt_err` 反例；隐式索引推断留 M15，仍是单文件 `--dt` opt-in，split/包集成留 M17。
- M15：隐式参数、接口与洞——元变量上下文（作用域逃逸检查）、隐式索引推断、trait/instance 字典编码 + 实例搜索、洞目标显示（`unsolved hole <loc> with goal <ty>`）。
- M16：终止性与覆盖性——surface AST 上的结构化递归终止性检查（`DT: cannot prove termination of <f>`），覆盖性边界固定；索引擦除分析落地为诊断（探测确认索引不能无条件擦，需整程序使用分析）。
- M17：DT 工具链——`vuna goal` 洞目标/上下文、`vuna lsp`（JSON-RPC over stdio：诊断、Full 同步、洞 hover，27 项冒烟断言）、`vuna doc` 支持接口与隐式签名；`Lsp`/`Json` 不进入 TCB。
- M18：自举迁移决策——seed rotation（stage1 == stage2）；用 DT 表达 de Bruijn 上下文良构（`Ctx a (Succ n)` 静态排除越界）；当时的结论「编译器本体暂不全量迁移」**已被推翻**，见「决策变更」。
- M18.5：DT 可靠性修复——lambda 形参擦除 bug（形参被无条件标为 erased：运行时使用时硬报错、未使用时静默少生成一层 `fun`）；擦除判据收敛为全仓唯一入口 `Elab.erasedBinder`（隐式恒擦 / 显式仅宇宙域擦），六处判据点统一；`run-tests.sh` 第 34 段加「同夹具 `interp` 输出 == 编译产物输出」逐夹具对拍；正例 `19_lam`、反例 `18_lam_type_used`。
- M18.6：核心表示层定型（QTT 预留）——`erased : Bool` 换成三值 `Rig`（`Rig0`/`Rig1`/`RigOmega`，`RigOmega` 在类型里存在但不产生）、`TType : Int` 换成不透明 `Level`；访问器分三层（构造 `rigOfBinder`/`levelSucc`/`levelMax`、判定 `rigIsErased`、展示比较 `levelToInt`/`levelEq`/`levelLt`）；`Core` 之外对 `Rig`/`Level` 模式匹配数为 0；**行为零变化**（全部 DT 夹具 `compile --dt` 产物逐字节相同）；正例 `20_rig`/`21_level`、反例 `19_rig_type_runtime`。
- M19：DT 语言面 parity（9/9，完成）——`let`（检查位 + 推断位脱糖为 `(\\x => body) e`，296 处）、推断位 `case`（元变量作期望类型，132 处）、嵌套构造子模式（改写成内层 case，410 分支）、多 clause 与方程左端模式（标准模式矩阵，399 名 / 978 行）、内建字面量模式（Bool→if，Int/String→if 链）、内建泛化（`==` / `/=` 隐式类型参数 + 精化期按实参类型特化、`str*` 进 prelude）、trait 高阶 kind（类参数 kind 从方法签名推断，投影 multiplicity 两侧统一）、`record`（声明/构造/字段访问/模式/更新，精化前统一降级）；`deriving`（展开成等价 instance，内建 Show/Eq/Ord trait 与内建 Show 实例）；顺带修掉
核心求值器两个缺陷（`normalizeCase` 不进分支体、`applyCaseAlt` 不处理兜底）与一条
M15 遗留缺陷（同 trait 多实例，见下方）。

## 终态（本路线图的目标）

**一套表面语言、一个类型检查器、一条 codegen、一个 seed。**

- **类型理论**：依赖类型（Core TT + 精化器）；HM 检查器与其 codegen 从仓库删除。
  核心表示层按 **QTT 可替换**设计（rig 三值与不透明 `Level`，见 M18.6），但 QTT 本身不排期。
- **路径**：`Parser → DT 精化 → 擦除 codegen → OCaml`。不再有 `--dt` 开关——它就是默认且唯一路径。
- **模块与包**：DT 直接建在现有 `Loader` / `Pkg` 之上，**不搞平行 Loader**（HM 将删除，平行实现是纯浪费）。
- **语言面**：**顶层签名必填**，不引入 HM 式顶层推断；不用的特性直接删，不留兼容层。
- **明确删除**：`vuna interp` 的「不检查直接执行」调试语义（改为精化后的核心求值器）。
- **明确保留**：`record` 与 `deriving`、多 clause / 方程左端模式、`do` 与 `Base.IO`、
  trait/instance（含高阶 kind）、包级 effectful allowlist、seed 自举链与全部 CI 门槛。

## 当前硬约束

1. 当前编译器必须能通过自身类型检查；
2. seed rotation 后 stage 1 与 stage 2 必须字节一致；
3. `test/run-tests.sh`、`nix build`、`nix flake check` 必须保持通过；
4. **seed 只含 compiler 包的入口闭包**；工具链（fmt/lint/repl/doc/test、LSP、package manager）不进入 TCB；
5. **迁移期双路径零回归**：M18.5–M23 期间 HM（interp + typed + split）与 DT（core evaluator +
   擦除 codegen）都必须保持通过；**M24 之后只保留一条路径**，HM 模块删除；
6. 新增语法先以**当前种子可编译**的形式落地，rotation 之后才在编译器源码中使用。

## 阶段共同门槛

- `nix flake check`（vuna-tests / vuna-package / vuna-metrics / vuna-typecheck / vuna-lint / seed-selfhost / fixed-point）通过。
- 迁移期登记：M18.5–M23 期间旧路径零回归；M24 起单路径，门槛改为「唯一路径全绿」。
- DT 代码：核心求值器与擦除 codegen 语义一致（同夹具 `interp` 与 `compile`+`ocamlopt` 输出逐字节相同）。
- 当前种子能编译当前源码；rotation 后 stage1 == stage2；seed 仍只含 compiler 包闭包。
- 编译器自检通过；新增阶段更新 README / AGENTS 的约束、`docs/history.md` 与 roadmap 完成摘要。
- **新增 DT 能力必须同时给 `test/corpus/dt*` 正例与反例**，否则计入未完成。

## 路线阶段（M18.5–M24：走向单一路径）

### M19：DT 语言面 parity（单文件）

**目标**：让 DT 单文件路径支持 `base` / `lib` / `compiler` 里实际使用的全部表面构造与内建。
不涉及模块、包与效应。

**范围**（按实测用量排序，见 [dt-parity.md](reference/dt-parity.md)）：

- **多 clause 与方程左端模式**（约 400 个函数名、830 个带模式定义）：保留语法，精化时逐 clause
  合成单个 `case`。
- **`let` 表达式**（约 296 处）：支持局部定义（含可选签名）。
- **推断位 `case`**（约 132 处）：推断时先建元变量作期望类型，再逐个分支 check。
- **嵌套构造子模式**（约 410 个分支）：递归展开为嵌套 `case`。
- **内建类型的字面量模式**：`case` 打在 `Bool` / `Int` / `String` 上。
- ~~**内建泛化**~~：**已完成**——`==` / `/=` 带隐式类型参数、精化期按实参类型特化成
  `bi_eq_int` / `bi_eq_str` 等；`strFromInt` / `strUnpack` / `strPack` / `strLength` 进 prelude。
- ~~**trait 高阶 kind**~~：**已完成**——类参数的 kind 从方法签名推断（被应用 k 次 ⇒
  `Type -> ... -> Type`，见 `DtKind.vuna`），字典构造子与投影按真实 kind 生成，实例头与
  隐式参数检查也接受 kind 形态。顺带修掉一个真实错位：投影的 lambda 链与应用点原先一律
  用 Rig1，而 `a : Type` 这类参数实际擦除，导致 `interp` 与编译产物不一致——现在两侧
  统一用同一份 `rigs`。
- ~~**`record`（声明 / 构造 / 字段访问 / 更新 / 记录模式）**~~：**已完成**——record 是
  纯记法（等价于「带一个构造子的 data」），在精化前统一降级（`DtRecords.vuna`），DT 侧
  没有任何 record 专用精化规则。降级后的构造子名用 `Mk<R>`（DT 的 globals 是一张表，
  同名会让 `Point 1 2` 被解析成「把类型当函数应用」）。
- ~~**`deriving`（`Show` / `Eq` / `Ord`）**~~：**已完成**——DT 的自然形态是**生成
  instance**（`DtDerive.vuna`）：展开成等价 `DInstance`，交给既有的字典编码与实例搜索，
  不照搬 HM 的降级通道。内建 `Show` / `Eq` / `Ord` trait 与内建 `Show` 实例（`Int` /
  `String` / `Bool`）一并给出。
- ~~**同 trait 多实例**（M19 发现的 M15 遗留缺陷）~~：**已修复**——两条不变量：
  ① 实例搜索不得解决元变量（`filterInstances` 只接受不新增解的匹配，并以 `ecSols`
  为初始解集）；② 类参数由 `constrainDictDom` 约束，跳过类型实参并把实参类型收缩到
  应用头部。正例 `dt/29_multi_instance`、反例 `dt_err/25_no_instance`。

**决策**（记入「决策变更」）：

- 多 clause **保留并实现**（改 400 个函数为 `case` 的成本高于实现成本）。
- `record` / `deriving` **保留并补齐**：两者是已实现且有测试覆盖的语言特性
  （`test/corpus/traits/` 13 个 `deriving` 夹具、`test/corpus/fmt/` 的 record 夹具），
  删除虽能省下 ~68 个穿透点与 17 个夹具，但记法 ergonomics 是真实成本；
  本仓库自己少用不等于特性该淘汰。
- `do` 保留，实现放 M21。

**进度（9/9，已完成）**：九项全部落地并有正反例——多 clause 与方程左端模式、`let`、
推断位 `case`、嵌套构造子模式、内建字面量模式、内建泛化、trait 高阶 kind、`record`、
`deriving`；顺带修掉核心求值器两个缺陷与一条 M15 遗留缺陷（同 trait 多实例）。
详见 [docs/history.md](history.md)。

**验收**：每项都有至少一正一反 corpus；`test/corpus/traits/` 与 `test/corpus/fmt/` 的
record/deriving 夹具在 `--dt` 下全绿；[dt.md](reference/dt.md) 的「硬边界」清单同步收缩；
HM 三路径零回归。

**前置**：M18.6。**风险**：多 clause 展开与可达性判定的交互；推断位 `case` 的元变量泄漏；
record 的字段访问在做擦除判定时容易与「类型级投影」混淆。

### M20：DT 多文件与模块集成

**进度（已完成 9/10 项）**：`--dt` 复用 `Loader`（多文件 / `import` / `--root`）；
参数化 `data Foo a : Type`（`prependParams` 并 kind + 构造子补隐式 `EPi`）；
trait 方法与顶层签名的类型变量隐式量化（`DtQuant`，`Base.Monad` / `Base.List` 已能过）；
`Base.Bool` 的类型名优先级修复。剩余：`vuna-base` 卡在 `Base.List:54` 的
`needs Eq a` 约束──泛型函数里的实例约束需要 M22 的约束求解，以及 `pkg` 目录模式。

**目标**：DT 走出单文件，接入 `import` / `--root` / 包模式；**直接复用现有 `Loader` / `Pkg`**。

**范围**：

- DT 侧以 `Loader.loadProject` + `resolveProject` 的结果为单位（保留模块边界，不走
  `flatten`，否则 M22 的分离编译没有模块信息可用）；
- 模块头、`[export]` 跨包可见性、Prelude 自动导入、`vuna.toml` 依赖 DAG 对 DT 生效；
- `check --dt` / `compile --dt` / `interp --dt` 接受包目录与 `--root`；
- 名字解析完全复用 Loader（**不新建平行 Loader**）。
- `--dt` 开关迁移期内保留，M24 删除。

**实现要点（已落地）**：

- `Dt.dtLoad` 改成 `loadProgramRaw roots entry`：入口文件 + 所有依赖模块的声明拼接后
  一起精化（DT 是按整程序精化，模块边界对精化不构成约束；M22 分离编译才需要模块级形状）。
- `--dt` 的 CLI 放行 `--root` 与目录参数：`Compile` / `CompilerCli` / `Cli` 三处 facade
  都改成传 roots；`interp --dt --root <dir> <entry>` 可用。
- **Loader 放行 DT 语法**（roadmap 预见的风险项）：`EPi` 从「直接拒绝」改为**结构递归
  解析**，允许与否交给下游检查器——HM 的 `Typecheck` 仍报 `dependent function type
  requires --dt`（零放宽），DT 的 `Elab` 正常精化。`effExpr` 也补上 `EPi` 分支（否则
  副作用扫描会崩）。
- **Loader 认得 DT prelude 与族名**：`Int` / `String` / `Bool` / `Type` / `->` / `_` /
  运算符号 / `str*` / 内建 trait 方法进放行表；`own` 与 `ownTypes` 都并入 data 类型名
  （`Vec Nat n` 的 `Nat` 在值层位置出现）。
- 两处 **codegen / 命名**修正：`sanitizeChar` 处理 `#`（Loader 生成的匿名实例名
  `#default` 不是合法 OCaml 标识符）；匿名实例名按实例头唯一化（否则同 trait 多实例
  在 `defs` 表里互相覆盖——这是 M20 接入 Loader 后暴露的真实 bug）。

**验收**：多文件 DT 程序（含跨包 import）可 check / compile / interp ✅；
`vuna-base` 全部模块 `check --dt` 通过 ⬜（只剩 `Base.List:54` 的泛型实例约束）；
HM 三路径零回归 ✅；seed 闭包不变 ✅（36 个模块，metrics 已重标定）。

**前置**：M19。**风险**：DT 与 HM 共用 Loader 时，`--dt` 专属语法（`EPi`、索引 `data`）
需要 Loader 放行而非报错，注意别把 HM 的既有检查放宽。

### M21：效应与 IO 的 DT 化

**目标**：DT 程序能表达 `main : IO a`、`do` 块与 effectful 内建，达到现有 `Base.IO` 的可用性。

**范围**：`do` 精化（desugar 到 bind/pure 或直接精化）；`IO` 作为普通 `data` 在 DT 下成立；
effectful 内建进 DT prelude；包级 allowlist 语义保留；`main : IO a` 的执行语义对齐现有
`ioRunExpr`。可选的代数效应方向不在此阶段。

**已探明的前置缺口（2026-11，起 M21 前必须补）**：

1. **多态族的构造子字段类型不被索引精化**。`data Wrap : Type -> Type where
   MkWrap : {a : Type} -> (a -> Int) -> Wrap a` 的 `run : Wrap Int -> Int` 里
   `case w of MkWrap f => f 41` 报 `type mismatch: expected a, got Int`——`f` 的类型
   `a -> Int` 里的 `a` 是构造子的隐式族参数 binder，`unifyIdxList` 产出
   `Elab.refineValue` 的兜底分支 `_ => v` 让 **`VPi`/`VLam` 不参与精化**——字段类型
   `a -> Int` 求值是 `VPi`，精化直接原样返回，ref 永远替换不到里面（纯变量字段能过是因为
   走 `NVar` 分支）。详见 [dt-core.md](dt-core.md)。
   这不是 M20 引入的：显式 `{a : Type}` 写法在 M20 前就失败。`Base.IO` 的
   `MkIO : (Int -> a) -> IO a` 正好是这种形状，**它是 `bindIO` 精化的直接阻塞点**。
2. `do` 降级产物是裸 `bind`/`pure`（`Loader.desugarDo`），DT prelude 与 globals 都要
   提供这两个名字（trait 方法投影 + `Monad IO` 实例）。
3. `interp --dt` 目前只接受「归约成值」的 `main`，`main : IO a` 需要按 `ioRunExpr`
   的语义执行（DT 核心求值器侧：对 `MkIO f` 取 `f 0` 并继续归约）。


**验收**：`app/Main.vuna` 与 `compiler/app/Main.vuna` 的等价程序在 DT 下 check → compile →
运行成功；`do` 正反例；`Base.IO` 全部 API 可用。

**前置**：M19（`do` 需要 let/推断位 case）。**可与 M20 并行。** **优先级**：高。

### M22：擦除判据接线与统一 codegen

**目标**：擦除真正改写运行时表示，且**判据是可替换的**；DT codegen 产出 `build` /
`build --split` / `seed` 需要的全部形状，并重标定机器无关指标。

> **本阶段的定位由 QTT 决策确定**：QTT 很可能要做，而 QTT 的擦除判据是 multiplicity 0
> （`Rig0` 即擦），不是整程序使用分析。因此本阶段**不投入做整程序 `indexReads` 启发式**，
> 而是把「判据 → codegen 字段形状」这条线接好，让 M18.6 引入的 rig 直接驱动擦除。
> 若最终不做 QTT，再回来补启发式分析也不会推翻本阶段成果。

**范围**：

- **rig 驱动擦除**：`Rig0` binder 不进运行时表示；把 M18.6 的三值 rig 一路贯到
  `DtData` / `DtCtor` 的字段判定（现在 `dtCtorTelescope` 的 `erased` 标志）；
- **codegen 三处对齐**：`ctorFieldTys`、`genConApp`、`alignAltBinders`；反例保护
  （保守判定下 `vlen` 类仍必须保留字段，不得误擦）；
- **判据接口化**：擦除判定收成单一入口（`eraseMask` 之类），使「rig 驱动」与未来的
  「使用分析驱动」可互换，codegen 不感知来源；
- DT 输出模型对齐 `Split`：逐模块 `.ml` / `.mli` + `build.sh`，`--split` 产物形状与
  `seed/` 一致；
- **metrics 重标定**：codegen 换代后必须重设 `nix/metrics.budget`，不能沿用 HM 预算衡量
  （DT 产物无 `.mli`、runtime 前缀不同、ctor 计数口径不同）。

**验收**：显式标 `Rig0` 的索引在产物中消失（`17_erase.a` 一类夹具）；`vlen` 不被误擦；
全部 DT 夹具 `interp` 与 `compile`+`ocamlopt` 逐字节一致；`build --dt` / `seed --dt`
产出可编译文件集；新预算落库；擦除判定只有一个入口（grep 可验证）。

**前置**：M18.6（rig）+ M20（模块边界，分离编译需要）。**风险**：误擦导致运行时崩溃；
保守判定可能收益有限；判据接口若设计得太窄，QTT 落地时仍需改动 codegen。

### M23：全仓源码与夹具迁移

**目标**：把 `base` → `lib` → `compiler` 三包与全部夹具迁到 DT 下通过。这是 seed 切换的前置。

**范围**：

- **签名导出工具（一次性）**：用现有 HM 检查器的推断结果生成 DT 签名并回写源码
  （约 1080 个无签名定义）。工具在 M24 后删除——这是「无兼容义务」换来的最划算的一步。
- 逐包迁移，顺序 `base` → `lib` → `compiler`（依赖顺序），每包独立可验证。
- 夹具迁移：`test/corpus/` 35 段按新路径重写 / 替换 / 删除；HM 专属段按新语义重写
  （`traits/` 与 `fmt/` 的 record/deriving 夹具要保留语义，不删特性）。
- `vuna interp` 语义切到「精化后核心求值」，免检调试语义正式取消。

**验收**：`vuna check --dt .` 全仓通过；`vuna build --dt .` 三包都能产出可运行二进制；
夹具在新路径全绿；[language.md](reference/language.md) / [type-system.md](reference/type-system.md) /
[limits.md](reference/limits.md) 同步。

**前置**：M19–M22。**风险**：这是最大的一块机械工作量；按包分批，每批独立绿灯再进下一批。

### M24：seed 切换、HM 删除与工具链统一

**目标**：seed 由 DT codegen 生成，`--dt` 开关消失，HM 检查器与 codegen 从仓库删除。

**范围**：

- rotation：先用旧 seed 编译新源码 → `nix/seed-rotate.sh` → 验证 stage1 == stage2；
- 删除 `Typecheck`、`TypedCodegen`（`Split` 的**输出模型**保留，只换生成器）；
- CLI：`--dt` 成为默认并移除开关，`CompilerCli` / `Cli` 用法行同步；
- `nix/seed-rotate.sh` 与 `flake.nix` 的 forbidden 清单同步（删掉的模块名要移除，避免清单腐化）；
- LSP：`goalsOfProgram` 成为唯一诊断来源，删除 HM 诊断分支；
- 文档收尾：[architecture.md](architecture.md) 的五条链路收敛，双路径表述全部删除。

**验收**：`nix flake check` 全绿；`vuna check .` / `vuna build .` 在单路径下通过；仓库中不再有
`Typecheck` / `TypedCodegen` 模块；`docs/` 里不再出现「HM 路径与 DT 路径」这类并列表述。

**前置**：M23。**风险**：seed 切换不可逆，必须先在分支验证 fixed point 再合入。

### M24.5：等式搬运与精化器补强（大重构的语言前置）

**目标**：补齐「按索引编程」缺的那一块，让 M24.6 的编译器本体重构**真的能写**。
本阶段不加用户可见语法糖，只加精化器给出等式的能力。

> **为什么单列**：实测确认（见 [dt-parity.md](reference/dt-parity.md) §6），当前精化器只在
> 「`case` 打在被索引族本身、且 goal 的索引就是同一个形参」时精化 goal。
> 一旦需要在**两个不同形参**之间搬运等式，就报 `type mismatch: expected n, got (Succ n)`。
> 这恰好是 `append`、`Env`/`lookup`、`rep` 这类定义的核心形态。

**范围**（按依赖顺序，每项都要正反例）：

1. **归纳类型的等式类型**：让 `Eq a b` 是一个可被 `case` 精化的索引族（现在
   `test/corpus/dt/12_eq.vuna` 里 `Eq` 只是普通族，`Refl` 不能把两个**形参**合一）。
   目标形态：`case p of Refl => ...` 之后，`p : Eq a b` 让 `a` 与 `b` 在 goal 里可互换。
2. **等式搬运（`subst` / `cong` / `sym` / `trans`）**：上面三条必须能在**索引族上**用，
   而不只是 `Type` 上。这是 `append : Vec a n -> Vec a m -> Vec a (plus n m)` 的前提。
3. **定义性相等扩展到 `plus` 一类类型级函数**：现在 `unifyIdx` 靠 delta 展开 + fuel，
   能处理 `Succ`，但 `plus Zero m` 与 `m` 的相等需要更稳的归约（或在 `case` 分支里
   给出「`n` 已被精化为 `Zero`，所以 `plus n m` 归约成 `m`」的等式）。
4. **不可达分支的等式传递**：`Env`/`Fin` 的 `ENil` 分支里 `Fin Zero` 是空类型，
   现在能判「不可能」，但**不能**让「不可能 ⇒ 该分支随便写」；补上这条后
   `lookupEnv` 才能只写 `ECons` 分支。

**实测基线**（当前 HEAD，供验收对照）：

| 夹具形态 | 现状 |
| --- | --- |
| `wkVar` / `wkTerm`（弱化，同形参） | ✅ 通过 |
| `subst`（单变量替换，穿过 binder 时 lift） | ✅ 通过，`interp` 可求值 |
| `vhead` / `idv`（case 打在被索引族本身） | ✅ 通过 |
| `get`（`Env n` + `Fin n` 取**不依赖索引**的值） | ✅ 通过 |
| `lookupEnv`（返回 `Tm n`，值依赖索引） | ❌ `expected (Succ n), got n` |
| `append` / `rep` / `constRight`（跨形参等式） | ❌ `expected (Zero), got m` 等 |

**验收**：上表后三行全部转为通过；`Vec`/`Fin`/`Env`/`Tm` 四个族上的等式搬运正反例；
`test/corpus/dt/` 新增夹具固定这四种形态。

**前置**：M24（单路径稳定）。**风险**：等式搬运会显著增加 `unifyIdx` 的复杂度与
fuel 消耗，需同步 `dt_elab` 基准；若第 3 项做不动，M24.6 的范围要相应缩减到
「只索引化不依赖跨形参等式的那部分」（见 M24.6 的分级）。

### M24.6：编译器本体 DT 大重构

**目标**：在 seed 已由 DT 生成的前提下，用上 DT 的全部语言特性重写编译器核心，
把「靠约定 + 显式检查 + 注释」维持的不变量改由类型保证。

> **这是重写，不是翻译**：目标不是把现有 HM 风格代码逐行改写，而是重新设计数据结构，
> 让非法状态不可表示。允许删除现有函数、合并模块、改变内部接口——**没有兼容义务**。

**分级推进**（按实测收益排序，每级独立可交付、独立绿灯）：

**第一级：几乎零增量，与既有阶段合流**

- **擦除判据 → 字段形状的三重一致性**：现在 `ctorFieldTys` / `genConApp` / `altEnv`
  各自独立 `if erased`，字段数、telescope 长度、绑定数三者无交叉校验，违反即静默
  错编译。DT 形态：`Ctor : (k : Nat) -> Telescope k` + `Binds : Nat -> Type`，
  用共享的 `k` 强制。**已实测可表达**（`TKeep`/`TDrop`/`countKeep` 模式）。
- **`varIndex` 的 `else 0` 兜底**：越界被静默当成最外层变量，错得无声。不必上 DT，
  改成返回 `Maybe` 或断言即可（M18.6 已把 `Level` 不透明化，顺路做）。
- **OCaml 名编码单射性**：`sanitizeName` + `ctorOcamlName` 的 `_`/`.`/`'` 编码无分隔
  逃逸，理论上存在碰撞。属实现 bug，直接加长度前缀修掉。

**第二级：phantom index 做编译阶段标记（最便宜的高收益项）**

- `Loader` 现在靠调用顺序与 `mangle` 命名前缀保证「codegen 只吃已 resolve 的声明」，
  无类型约束。DT 形态：`data Expr : Phase -> Type`、`codegen : Expr Resolved -> String`。
  **已实测**：反例「把未 resolve 的名字喂给 codegen」被拒（`expected Resolved, got Parsed`）。
- 收益：单点改造，模块边界上的类型保证；代价低。

**第三级：Core 的 de Bruijn 索引化（部分可行，范围受 M24.5 约束）**

- **可做**：`Env : Nat -> Type` + `Fin` 提供 total 的 `lookup`（无 `Maybe`、无 `else 0`）；
  弱化与单变量替换已实测可写（`wkVar` / `wkTerm` / `subst` 全通过）。
- **受限于 M24.5**：`Env` 的值若依赖索引（如返回 `Tm n`），或需要在两个形参间搬运
  等式，当前写不出来。**M24.5 完成前不要动这部分**，否则会写出大量 `type mismatch`。
- 明确**不做**：把 `Term` 的 Pi/Lam 结构整体索引化。实测其收益主要在 `Env`/`lookup`
  这一层，Term 层索引化成本极高而收益递减。

**明确不划算（审计结论，不要做）**

- **拓扑序见证**：`jj2` 形态可表达，但 `orderGroups` 已经显式报错（触发即错），
  不满足「靠约定维持、违反则静默出错」的判据。
- **元变量上下文索引化**：需要 `conv` 全线签名带深度，成本极高；且现有
  `checkSolsScoped` 是事后全量复核，属「已有检查」。
- **终止性/`Acc` 见证**：当前终止性检查已能报错，且 `Acc` 式证明会拖慢精化。

**顺手修掉的真 bug（不是 DT 收益，但被本次审计发现）**

- **包名唯一性**：`Pkg.dependencyRoots` 按包名去重，workspace 内重名成员会**静默丢弃
  整支依赖**；实测三个重名工作区全部 `check` 静默 `exit 0`。短期加显式校验即可，
  不必上 DT。
- **`Loader` 的 `Nothing => []` 静默空表**：把「模块未加载」伪装成「无导出」，
  应改为 `Err`。

**验收**：第一、二级全部落地并有测试；第三级在 M24.5 能力范围内完成，超出的部分
在 [dt-core.md](dt-core.md) 记录边界；每个「明确不划算」项在文档里留一行理由，
防止后人重做；两个真 bug 修复并加回归测试；`nix flake check` 全绿，`dt_elab` 基准不回归。

**前置**：M24.5（第三级依赖它；第一、二级可提前到 M24 期间做）。
**风险**：这是**唯一一个「做错了会浪费很多时间」的阶段**——索引化的诱惑很大，
但实测表明「Term 层整体索引化」与「元变量索引化」收益远低于成本。严格按分级推进，
每级完成即停，不要在第三级上无限深入。

## 后续大阶段（M25–M28）

### M25：模块系统 v3

**目标**：signature / functor / 嵌套模块 / module type 别名 / opaque ascription；与包
`[export]`、DT 记录（已删，用 `data`）/接口整合。

**范围**：签名匹配、functor Map/Set、跨包可见性、split/`.mli`。

**验收**：签名匹配正/反例、抽象泄露反例、functor 示例；seed 闭包不变。

**前置**：M24.6（重构期内不动模块语义）。**优先级**：中。

### M26：运行时与多后端

**目标**：擦除感知的运行时；决定继续绑定 OCaml runtime 还是自研 GC / 后端无关 IR；Wasm/JS 后端。

**范围**：决策文档 + 原型；GC / 运行时正确性 / 性能；新后端语义一致；seed 边界不变。

**验收**：决策结论可执行；若实施，后端语义一致、性能基线、旧测试不回归。

**前置**：M22 / M24。**优先级**：条件性；擦除后 OCaml 后端可能长期够用。

### M27：并发与异步

**目标**：基于效应/接口的 async/await 或结构化并发；调度器；取消/超时。

**范围**：并发原语 / 调度；与 IO / effect 整合；测试。

**验收**：并发示例、取消/超时/异常、竞态测试；性能基线。

**前置**：M21 / M26。**优先级**：条件性；可先库级后语言级。

### M28：标准库与包生态

**目标**：DT 验证库（Vec/Fin/Map/Set/排序等）；包 registry / 版本解析 / lockfile / 文档托管。

**范围**：验证库正例/性质；本地 registry 端到端；锁文件可复现；CI。

**验收**：验证库可构建；registry 端到端；锁文件可复现；文档可发布。

**前置**：M19 / M24。**优先级**：验证库高（DT 的核心卖点），**registry 低**（没有外部用户时
没有意义，可后置）。

## 推荐顺序与并行策略

主序列：

```text
M18（已完成）→ M18.5 → M18.6 → M19 → M20 → M22 → M23 → M24 → M24.5 → M24.6 → M25 / M26 → M27 / M28
                                      └→ M21 ┘（可与 M20 并行）
```

- **M18.5–M19 是真正的第一前置**：语言面 parity 不解决，多文件毫无意义。原规划把
  「DT 多文件」当成第一前置，方向错了，见「决策变更」。
- **M18.5 + M18.6 应该合成一次改动**：两者都改同一条擦除路径与同一批 `Core` 类型，
  分两次做等于把机械改动做两遍。
- **M20 → M22 顺序固定**：分离编译需要模块边界；擦除接线也需要 `--split` 的输出模型。
- **M21 可与 M20 并行**：效应化只碰精化器与 prelude，不碰 Loader。
- **M23 是最大的一块机械工作量**，按包分开绿灯；不要等全部迁移完才跑 CI。
- **M24 之后是「DT 大重构」这一段**：M24.5 补等式搬运 → M24.6 分级重写编译器核心。
  M24.6 的第三级严格依赖 M24.5，第一、二级可提前到 M24 期间穿插做。
- **M24.6 之后才谈模块系统 v3 与新后端**：重构期内不动模块语义，避免两类风险叠加。

## 决策变更

| 原决策 | 出处 | 新决策 | 理由 |
| --- | --- | --- | --- |
| 编译器本体暂不全量迁移 DT，HM 长期保留 | M18 / [m18-migration.md](reference/m18-migration.md) | 全面迁移，终态删除 HM | 前提「无发布、无兼容义务」；当时两条阻碍（单文件、擦除未完成）正被 M18.5–M22 消掉 |
| HM 与 DT 双路径长期并存 | M13–M18 | 双路径**只在迁移期**存在（M18.5–M23） | 同上；长期并行等于维护两套类型检查器 |
| 「DT 多文件与包集成」是 M18 决策的第一前置 | 原「下一步 / 待办」 | 后延为 M20，且**不再平行实现 Loader** | 语言面 parity（M19）才是第一前置；HM 将删除，平行 Loader 是纯浪费 |
| 「完整擦除分析」是 M18 的小前置 | 原「下一步 / 待办」 | 提升为独立阶段 M22，但**改为判据接线**而非整程序使用分析 | QTT 很可能要做，其 multiplicity 判据会取代启发式分析；先接线后换判据，避免白干 |
| `record` 与 `deriving` 删除 | 本文 2026-11 初版 | **保留并补齐** | 两者是已实现且有 17 个夹具覆盖的特性；删除只省 ~68 个穿透点，却损失记法 ergonomics。本仓库自己少用不等于特性该淘汰 |
| 核心表示层用 `erased : Bool` + `TType : Int` | M13 起 | M18.6 改为三值 rig + 不透明 `Level` | 现在改是几小时，M23 规模后改是几周；QTT/宇宙多态落地时只需换判据与层级实现 |
| 顶层签名可省略 | M7 起 | DT **必须写签名**，提供一次性签名导出工具回填 | 依赖类型精化需要签名做检查模式与错误定位；不引入 HM 式顶层推断 |
| `vuna interp` 保留「不检查直接执行」 | M12.6 | 取消，改为精化后的核心求值器 | 单路径下没有「另一种语言」可以免检执行 |
| 原 M19（效应）/ M20（模块 v3）/ M21（运行时）/ M22（生态）/ M23（并发） | 本文旧版 | 依次改为 M21 / M25 / M26 / M28 / M27 | 让位于单路径迁移主线 |

## 研究储备（不排期）

> 「表示层已预留」的项，M18.6 完成后可直接接入，不需要重做 Core/Codegen 骨架。

- **QTT（量化类型理论）**：`Rig` 三值已在 M18.6 定型；落地工作 = 判据实现 + 语法加
  multiplicity 标注 + 擦除由 `Rig0` 驱动（替换 M22 的判据入口）。**这是最可能落地的一项。**
- **宇宙多态 / 累积性**：`Level` 已不透明化，加变量与 `max` 是局部改动；累积性需要改
  `conv` 的 `VType i` / `VType j` 分支（现在是 `i == j`）。
- **CoC 补完**：当前已是 λC 结构（`Type : Type` 层级可预测、Pi/依赖消除/归纳族都在）。
  真正缺的是**完整依赖消除**（`Elab.kindWellFormed` 目前要求族 kind 必须是「箭头链终于
  Type」，`data F : (Type -> Type) -> Type` 写不了）与非直谓 Prop（不一定想要）。
- 线性/量化类型（资源安全）——与 QTT 同源，若上 QTT 则此条被吸收。
- 证明自动化 / tactics / reflection。
- `rewrite` / `with` / dependent elimination 的进阶 ergonomics。
- 效应行多态 / 更完整的效应系统（若 M21 只做 monadic 编码）。
- 自研 GC / 多后端探索（若 M26 决定不做）。

## 暂缓事项

- 独立 runtime / GC → M26 决策。
- 多后端 → M26（决策后）。
- 大型标准库扩张 → M28 / 持续轨道。
- 包 registry 与远程依赖 → M28 后置段（没有外部用户前优先级最低）。
- 线性类型与依赖类型之外的类型系统研究 → 研究储备。

## 相关阅读

- DT 与 HM 的能力落差证据：[dt-parity.md](reference/dt-parity.md)
- DT 语言语义：[dt.md](reference/dt.md)；设计与实现边界：[docs/dt-core.md](dt-core.md)
- 自举链与 seed：[bootstrap.md](reference/bootstrap.md)；测试与 CI：[testing.md](reference/testing.md)
- 历史与已完成阶段细节：[docs/history.md](history.md)；旧决策原文：[m18-migration.md](reference/m18-migration.md)
