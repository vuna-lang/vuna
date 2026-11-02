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
   擦除未完成」的前提下做的；这两个前提正被 M18.5–M22.3 直接消掉，因此该决策**已被推翻**。
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
M15 遗留缺陷（同 trait 多实例，细节见 [history.md](history.md)）。
- M20：DT 多文件与模块集成——`--dt` 复用 `Loader`（`loadProgramRaw`、`import` / `--root`）、
  参数化 `data Foo a : Type`、签名类型变量隐式量化；剩余包目录归 M22.1。
- M20.5：泛型实例约束求解——`Core.solveMetaHo`（更高阶元变量按模式求解）、`Elab` 的
  字典延迟约束（`dgoals` / `resolveDictGoals`）、`constrainDictDom` 的 kind 检查；
  `Base.List.mem` 的 `Eq a` 与 `do` 的具体 bind/pure 打通。`git log` 的提交标为 M22。

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

- `nix flake check`（vuna-tests / vuna-package / vuna-metrics / vuna-typecheck / vuna-lint / vuna-index / context-budget / seed-selfhost）通过。
- 迁移期登记：M18.5–M23 期间旧路径零回归；M24 起单路径，门槛改为「唯一路径全绿」。
- DT 代码：核心求值器与擦除 codegen 语义一致（同夹具 `interp` 与 `compile`+`ocamlopt` 输出逐字节相同）。
- 当前种子能编译当前源码；rotation 后 stage1 == stage2；seed 仍只含 compiler 包闭包。
- 编译器自检通过；新增阶段更新 README / AGENTS 的约束、`docs/history.md` 与 roadmap 完成摘要。
- **新增 DT 能力必须同时给 `test/corpus/dt*` 正例与反例**，否则计入未完成。

## 路线阶段（M21–M24.7：走向单一路径与 DT 大重构）

### 阶段状态总览

阶段按编号顺序推进；依赖写在每个阶段的「前置」里。**当前阻碍登记在阶段内**，阶段完成
即删除或降为历史摘要；已完成的 M13–M20 细节见 [history.md](history.md)。

| 阶段 | 状态 | 关键交付 | 当前阻碍 |
| --- | --- | --- | --- |
| M13–M18.6 | 已完成 | DT 地基、索引族、trait/实例、终止性、工具链、擦除修复、表示层定型 | — |
| M19 / M20 | 已完成 | 语言面 parity；复用 Loader 走出单文件 | 细节见 [history.md](history.md) |
| M20.5 | 已完成 | 泛型实例约束求解（`solveMetaHo`、字典延迟、`mem`） | —（`git log` 里记作 M22） |
| M21 | 部分 | `main : IO a` 已落地；`do` / trait 方法投影本阶段完成 | `fmap`/`bind` unbound、实例方法构造子形参被拒 |
| M22.1 | 未开始 | 包目录与 CLI 入口（`check` / `compile --dt`） | 目录被当文件读并崩溃 |
| M22.2 | 未开始 | 库名统一与精化缺口（`str*`/`List`、跨模块族名、`Sort`、Bool 去桩） | `Base.String` / `Base.Map` / `Base.Sort` 探针失败 |
| M22.3 | 未开始 | 擦除判据接线 + 统一 codegen + `build`/`seed` 入口 + metrics | 显式索引仍保留运行时字段 |
| M23 | 未开始 | 全仓源码与夹具迁移；签名回填 | 签名量、夹具迁移 |
| M24 | 未开始 | seed 切换、HM 删除、`--dt` 默认化 | 前置 M22.x + M23 |
| M24.5 | 未开始 | 等式搬运与精化器补强 | 跨形参等式不可写 |
| M24.6 | 未开始 | 编译器本体 DT 大重构（分级） | 第三级依赖 M24.5 |
| M24.7 | 未开始 | Eq/Ord/Show 库化 | 前置 M24 |

### M21：效应与 IO 的 DT 化

**目标**：DT 程序能表达 `main : IO a`、`do` 块与 effectful 内建，达到现有 `Base.IO` 的可用性。

**范围**：`do` 精化（desugar 到 bind/pure 或直接精化）；`IO` 作为普通 `data` 在 DT 下成立；
effectful 内建进 DT prelude；**trait 方法投影跨模块可见**（`fmap` / `bind` / `pure`，
`do` 的降级产物依赖它）；**实例方法体的模式矩阵**（实例方法支持构造子形参）；包级
allowlist 语义保留；`main : IO a` 的执行语义对齐现有 `ioRunExpr`。可选的代数效应方向
不在此阶段。

**已完成（2026-11）**：

- `main : IO a` 的执行：`Dt.evalDtMain` 与 `CoreCodegen.generateDtProgram` 按 main 的
  **类型**识别 IO（族名 `IO`，含 `Base.IO.IO` 前缀形态），取构造子**末实参** `f`（隐式
  族参数也进值表示，不能按位置取第一个）后对世界令牌 0 应用 `f 0` 并继续归约，与 HM
  `ioRunExpr` 一致。正例 `dt/34_io_do`、`dt/35_io_main`。
- 多态族构造子的函数类型字段被索引精化：`Elab.varTypeValue` / `evalCtx` 把精化代入
  **求值环境**再 `eval`，而不是对 `VPi`/`VLam` 递归——闭包捕获环境，域与余域都递归
  精化。正例 `dt/33_poly_fn_field`（输出 `1`），反例 `dt_err/27_poly_fn_field_err`
  （`expected Bool, got Int`）。`Base.IO` 的 `MkIO : (Int -> a) -> IO a` 由此解锁。
- effectful 内建（`prim_*`）签名已进 DT prelude。

**当前阻碍（2026-11 探针，均在本阶段范围内解决）**：

- `import Base.Monad` 后 `fmap` 报 `unbound variable fmap`；`import Base.IO` 后 `do` 报
  `unbound variable bind`——`elabTrait` 生成的投影名是裸方法名，不经过 Loader 的模块
  限定，也没有进入模块导出表。需要把投影纳入导出/导入解析（或按「trait 名.方法名」
  限定）。
- `instance FMap Box where fmp g (MkBox x) = ...` 报
  `DT: definition parameters must be variables (M13)`——实例方法体没有走
  `DtMatch.multiToExpr` 的模式矩阵。把实例方法体接到与普通多 clause 相同的路径。
- 泛型 `Monad IO` 实例依赖 M20.5（已完成）。

**验收**：`app/Main.vuna` 与 `compiler/app/Main.vuna` 的等价程序在 DT 下 check → compile →
运行成功；`do` 正反例；`fmap` / `bind` / `pure` 经 `import Base.IO` 或 `import Base.Monad`
可用；实例方法构造子形参正例与反例各一；`Base.IO` 全部 API 可用。

**前置**：M20.5（已完成）。**风险**：投影命名变更会影响 `deriving` 展开（生成体的
方法名），需要同步 M24.7 的 trait 库化方案。

### M22.1：包目录与 CLI 入口（`check` / `compile --dt`）

**目标**：让 `--dt` 接受包目录，后续阶段都能在真实包上验证。

**范围**：

- `check --dt <pkg-dir>` / `compile --dt <pkg-dir>` 走 `loadProject` / `packageRoots`
  （当前把目录当文件读，直接 `Fatal error: readFile ...`）。
- CLI 死代码：`CompilerCli.dtRootErr` / `dtDirErr` 定义但无调用点；`--dt --root` 实际
  可用而文案仍写「does not support --root」。要么接线（给出清晰错误），要么删除。
- `build --dt` / `seed --dt` 的入口接线放 M22.3（依赖 codegen 输出模型）。

**当前阻碍**：`check --dt base/lib` 把目录当文件读并崩溃。

**验收**：包目录 `check --dt` / `compile --dt` 可用；不接受的形式给出清晰错误而非崩溃；
`dtRootErr` / `dtDirErr` 有调用点或被删除。

**前置**：M21（`do` / trait 投影完成后再验证包模式）。**风险**：`--dt` 与 HM 的 CLI
解析共用路径，改动要保证 HM 分支零回归。

### M22.2：库名统一与精化缺口（含 Bool 去桩）

**目标**：`base` 的所有模块在 `--dt` 下可精化，且 `Bool` 只有一个权威定义。

**范围**（按可独立验证的顺序）：

- **`str*` 与 `List` 的名统一**：`DtPrelude` 里 `strUnpack` / `strPack` 的签名用裸
  `List`，而程序里的类型是 `Base.List.List`——`import Base.String` 报
  `expected (List Int), got (Base.List.List ?2)`。按「族短名 / 实际族名」绑定，或让
  `str*` 的签名在精化后按 globals 里的 `List` 族重写。
- **跨模块族名**：`Base.Map` / `Base` 报 `DT: unknown name Base.List.List`——`Map.vuna`
  对 `Base.List.List` 的引用没有在导入方解析；检查 `Loader` 的限定名解析与 `elabData`
  的 globals 命名。
- **`Sort` 覆盖判定**：`Base.Sort` 报 `case is not exhaustive: missing Cons`——多列
  覆盖拆分（`zip xs []` 这类列间独立子句）在 `DtMatch` 的模式矩阵里仍会漏分支；
  见 [limits.md](reference/limits.md) 的「多列 clause 覆盖判定」。
- **Bool 去桩**：删除 `DtPrelude.preludeNames` / `preludeGlobals` 里的 `Bool` /
  `True` / `False`，`if` 条件与 `case` 按「族短名 Bool」识别，构造子的运行时表示统一为
  `VBool`/`TBool`；`Base.Bool` 成为唯一权威定义（与 `List` 的既有约定一致）。单文件
  DT 夹具补 `data Bool` 或改用 `--root base/lib`。去桩后 `str*` 与 `List` 的静态签名
  可按同一套「实际族名」逻辑处理，因此与上面两项放在同一阶段。

**当前阻碍（2026-11 探针）**：`Base.String` / `Base.Map` / `Base.Sort` 三个失败探针；
Bool 桩与 `Base.Bool.Bool` 双表示（`Elab.boolTypedVal` 一类桥接）。

**验收**：`import Base.String` / `Base.Map` / `Base.Sort` / `Base` / `Prelude` 的探针在
`--dt` 下通过；Bool 去桩后单文件夹具与包模式全绿；`preludeGlobals` 不再出现
`Bool` / `True` / `False`。

**前置**：M22.1（包目录入口用于逐包验证）。**风险**：名字统一会改动 `DtPrelude` 的
静态签名表与 `Elab` 的布尔桥接，需同步单文件夹具。

### M22.3：擦除判据接线与统一 codegen

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
- **DT 输出模型对齐 `Split`**：逐模块 `.ml` / `.mli` + `build.sh`，`--split` 产物形状与
  `seed/` 一致；`build --dt` / `seed --dt` 入口接线（依赖 M22.1 的 CLI 包目录）。
- **metrics 重标定**：codegen 换代后必须重设 `nix/metrics.budget`，不能沿用 HM 预算衡量
  （DT 产物无 `.mli`、runtime 前缀不同、ctor 计数口径不同）。

**当前阻碍**：擦除判据尚未接到 codegen——显式索引/证明仍保留运行时字段（`Vec a n` 的
`Cons` 带 `t_Nat` 长度字段）；详见 [m16-design.md](reference/m16-design.md) §3。
`build` / `seed` 仍不接受 `--dt`。

**验收**：显式标 `Rig0` 的索引在产物中消失（`17_erase` 一类夹具）；`vlen` 不被误擦；
全部 DT 夹具 `interp` 与 `compile`+`ocamlopt` 逐字节一致；`build --dt` / `seed --dt`
产出可编译文件集；新预算落库；擦除判定只有一个入口（grep 可验证）。

**前置**：M21（`do` / trait 投影）、M22.1（包目录与 CLI 入口）、M22.2（库模块可精化）。
**风险**：误擦导致运行时崩溃；保守判定可能收益有限；判据接口若设计得太窄，QTT 落地时
仍需改动 codegen。

### M23：全仓源码与夹具迁移

**目标**：把 `base` → `lib` → `compiler` 三包与全部夹具迁到 DT 下通过。这是 seed 切换的前置。

**范围**：

- **签名导出工具（一次性）**：用现有 HM 检查器的推断结果生成 DT 签名并回写源码
  （约 1083 个无签名定义）。工具在 M24 后删除——这是「无兼容义务」换来的最划算的一步。
- **Bool 收口**：去桩已在 M22.2 完成（`DtPrelude` 不再有 `Bool` / `True` / `False` 桩，
  `if` / `case` 按族短名识别，`Base.Bool` 是唯一权威定义）；M23 只随 `base` 迁移同步
  注释与文档（[dt.md](reference/dt.md) / [limits.md](reference/limits.md)）。
- 逐包迁移，顺序 `base` → `lib` → `compiler`（依赖顺序），每包独立可验证。
- 夹具迁移：`test/corpus/` 按新路径重写 / 替换 / 删除（DT 正例 36 / 负例 28）；
  HM 专属段按新语义重写（`traits/` 与 `fmt/` 的 record/deriving 夹具要保留语义，不删特性）。
- `vuna interp` 语义切到「精化后核心求值」，免检调试语义正式取消。

**验收**：`vuna check --dt .` 全仓通过；`vuna build --dt .` 三包都能产出可运行二进制；
夹具在新路径全绿；[language.md](reference/language.md) / [type-system.md](reference/type-system.md) /
[limits.md](reference/limits.md) 同步。

**前置**：M21–M22.3（M19/M20 已完成）。**风险**：这是最大的一块机械
工作量；按包分批，每批独立绿灯再进下一批。

### M24：seed 切换、HM 删除与工具链统一

**目标**：seed 由 DT codegen 生成，`--dt` 开关消失，HM 检查器与 codegen 从仓库删除。

**范围**：

- rotation：先用旧 seed 编译新源码 → `nix/seed-rotate.sh` → 验证 stage1 == stage2；
- 删除 `Typecheck`、`TypedCodegen`（`Split` 的**输出模型**保留，只换生成器）；
- CLI：`--dt` 成为默认并移除开关，`CompilerCli` / `Cli` 用法行同步；
- `nix/tcb-forbidden.txt` 与 `nix/seed-rotate.sh` / `nix/checks/` 同步（删掉的模块名要移除，避免清单腐化）；
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

### M24.7：Eq / Ord / Show 库化（内建边界收敛）

**目标**：把 `Show` / `Eq` / `Ord` 从编译器合成迁到 `base`，消除「内建 trait + 内建实例
+ Loader 放行表」的多处定义；编译器只保留语法与运行时表示特化（`==` 的 Int/String 特化、
`True`/`False` 构造子名、`deriving` 展开机制）。

**范围**：

- 新增 `base/lib/Base/Show.vuna` / `Base/Eq.vuna` / `Base/Ord.vuna`：trait 声明 +
  `Int` / `String` / `Bool` 实例（`Show Bool` 用 `if`，`Eq Bool` 用析取避免自递归）；
  更新 `base/vuna.toml` 的 `[export]`、`Base.vuna` 门面与 `Prelude.vuna`。
- 删除 `DtDerive` 的 `builtinTraitDecls` / `builtinShowInstances` / `builtinEqInstances`；
  `expandDerivings` 改为使用 `DData` 里**已由 Loader 解析**的 derivings 名（如
  `Base.Show.Show`）生成实例头，方法名按 `trait 名 + "." + 方法名` 推导。
- `Elab` 中 `==` / `/=` 的实例搜索（`dictTypeName "Eq"` 硬编码）改为按短名 `Eq` 查类表。
- 删除 `Loader.isBuiltinTraitName` / `isPreludeTraitMethod` 放行，改为经 import / Prelude
  解析；单文件 / 无库模式需要显式 import（与 M22.2 的 Bool 约定一致）。
- `Typecheck` 的 `builtinTraitDecls` / `builtinMethodRefs` 在 M24 已随 HM 删除，无需处理。

**验收**：`DtDerive` / `Loader` 中不再有 Show/Eq/Ord 的定义或放行；`deriving` 在
`import Base.Show` 下工作；base 的实例参与实例搜索；seed 自举与全量测试全绿；`docs/` 的
内建清单收敛到「Int/String 原语 + 语法」。

**前置**：M24（HM 删除后）。**风险**：`deriving` 展开依赖 trait 已解析，缺 import 时要
给可解释错误；单文件夹具在 M22.2 已补 `data Bool` / `--root`。

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

**前置**：M22.3 / M24。**优先级**：条件性；擦除后 OCaml 后端可能长期够用。

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

## 决策变更

| 原决策 | 出处 | 新决策 | 理由 |
| --- | --- | --- | --- |
| 编译器本体暂不全量迁移 DT，HM 长期保留 | M18 / [m18-migration.md](reference/m18-migration.md) | 全面迁移，终态删除 HM | 前提「无发布、无兼容义务」；当时两条阻碍（单文件、擦除未完成）正被 M18.5–M22 消掉 |
| HM 与 DT 双路径长期并存 | M13–M18 | 双路径**只在迁移期**存在（M18.5–M23） | 同上；长期并行等于维护两套类型检查器 |
| 「DT 多文件与包集成」是 M18 决策的第一前置 | 原「下一步 / 待办」 | 后延为 M20，且**不再平行实现 Loader** | 语言面 parity（M19）才是第一前置；HM 将删除，平行 Loader 是纯浪费 |
| 「完整擦除分析」是 M18 的小前置 | 原「下一步 / 待办」 | 提升为独立阶段 M22（现 M22.3），但**改为判据接线**而非整程序使用分析 | QTT 很可能要做，其 multiplicity 判据会取代启发式分析；先接线后换判据，避免白干 |
| `record` 与 `deriving` 删除 | 本文 2026-11 初版 | **保留并补齐** | 两者是已实现且有 17 个夹具覆盖的特性；删除只省 ~68 个穿透点，却损失记法 ergonomics。本仓库自己少用不等于特性该淘汰 |
| 核心表示层用 `erased : Bool` + `TType : Int` | M13 起 | M18.6 改为三值 rig + 不透明 `Level` | 现在改是几小时，M23 规模后改是几周；QTT/宇宙多态落地时只需换判据与层级实现 |
| 顶层签名可省略 | M7 起 | DT **必须写签名**，提供一次性签名导出工具回填 | 依赖类型精化需要签名做检查模式与错误定位；不引入 HM 式顶层推断 |
| `vuna interp` 保留「不检查直接执行」 | M12.6 | 取消，改为精化后的核心求值器 | 单路径下没有「另一种语言」可以免检执行 |
| 原 M19（效应）/ M20（模块 v3）/ M21（运行时）/ M22（生态）/ M23（并发） | 本文旧版 | 依次改为 M21 / M25 / M26 / M28 / M27 | 让位于单路径迁移主线 |
| `Show` / `Eq` / `Ord` 与 Bool 桩由编译器内建 | M10.5 / M19 | 库为唯一来源：`Base.{Show,Eq,Ord}` + `Base.Bool`，编译器只留语法/表示特化；Bool 去桩在 M22.2、trait 库化排 M24.7 | 消除双份定义与 5 处短名桥接 hack；与已库化的 `List` / `Monad` 对齐 |
| M22 一号两用（roadmap=擦除/codegen；git log=泛型实例约束） | M22 | 先拆 M22.1–M22.5，再按可开工依赖重排：泛型实例→M20.5（已完成）、trait 投影并入 M21、包目录→M22.1、库名/Bool 去桩→M22.2、擦除/codegen→M22.3 | 编号顺序 = 可开工顺序；M21 自包含 `do` / trait 投影，不再依赖更晚阶段 |

## 研究储备（不排期）

> 「表示层已预留」的项，M18.6 完成后可直接接入，不需要重做 Core/Codegen 骨架。

- **QTT（量化类型理论）**：`Rig` 三值已在 M18.6 定型；落地工作 = 判据实现 + 语法加
  multiplicity 标注 + 擦除由 `Rig0` 驱动（替换 M22.3 的判据入口）。**这是最可能落地的一项。**
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

- DT 与 HM 的能力落差历史证据：[dt-parity.md](reference/dt-parity.md)（当前状态见「阶段状态总览」）
- DT 语言语义：[dt.md](reference/dt.md)；设计与实现边界：[docs/dt-core.md](dt-core.md)
- 自举链与 seed：[bootstrap.md](reference/bootstrap.md)；测试与 CI：[testing.md](reference/testing.md)
- 历史与已完成阶段细节：[docs/history.md](history.md)；旧决策原文：[m18-migration.md](reference/m18-migration.md)
