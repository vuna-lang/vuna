# Vuna 路线图

本文记录 vuna 的当前基线与后续规划。

## 维护规则

- **已完成阶段整段删除**：阶段完成后，删除该阶段的目标、范围、验收、设计要点、实现状态等详细段落，正文中不再保留。
- **已完成阶段一句话**：只在「已完成」列表与状态表保留一句话摘要（阶段编号 + 核心交付物）；历史细节见 [history.md](history.md)（git 历史留底）。
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

- M1–M8：parser / CBV 求值器 / 自解释器 / 动态 codegen / 文件即模块 / 自写 codegen 与 seed 固定点 / HM 类型检查 / typed codegen 自举。
- M9：全链路 span 与诊断、穷尽性/冗余检查、非 0 退出码。
- M10 / M10.5：模块系统 v2（显式导出、抽象类型、重导出）与 record + trait/deriving。
- M11 / M11.5：标准库成员包 `vuna-base`、包管理与工具链（`vuna.toml`、workspace、`build`/`test`/`fmt`/`repl`/`doc`）。
- M12 / M12.5–M12.8：分离编译与 ocamlopt 增量构建、seed 多文件与指标门槛、编译器独立成员包（工具链移出 TCB）、`main : IO a` 语义、`Base.*`/`Prelude` 与 `compile --package`/`build`。
- M13–M18.6：DT 地基、索引族与依赖模式匹配、隐式参数/接口/洞、终止性与覆盖、DT 工具链、seed rotation 决策、擦除判据修复、表示层定型（rig/Level）。
- M19 / M20：DT 语言面 parity（let/推断位 case/嵌套与多 clause/字面量模式/record/deriving）与复用 Loader 走出单文件。
- M20.5：泛型实例约束求解（`solveMetaHo`、字典延迟、`Base.List.mem`）。
- M21–M22.3：`main : IO a` / `do` / `Base.IO`、包目录入口、库名统一与模式矩阵、Bool 去桩、擦除判据接线、`build`/`seed --dt` 与 metrics 重标定。
- M23：全仓源码与夹具迁移——签名回填、`check --dt .` / `build --dt .` 通过、`test/corpus` 全量切 DT、`vuna interp` 改为精化后核心求值（删除 `Vuna.Eval`）。
- M24：单一 DT 路径落地——DT 逐模块 split codegen 与 seed 轮换（38 文件、无 `.mli`）、删除 `Typecheck`/`TypedCodegen`/`SigExport`、`--dt` 与 `compile --package` 移除、LSP 诊断改 DT、`where` 绑定显式签名、`tNNN` 签名清理与名字启发式删除。
- M24.5：等式搬运与精化器补强——scrutinee 反射、空归纳族上下文的不可达分支省略、隐式族参数 `Eq` 构造的元变量内联、`plus` 定义性相等；新夹具 dt/46–50 与 dt_err/36–38。
- M24.6：编译器本体 DT 最小重构——构造子字段形状以 keep flags 为单一真源（三处消费并校验）、de Bruijn 作用域 / OCaml 名字去重 / `checkResolvedModules` 护栏、类型族整体擦除、`splitMainFile` 补 entry data；L2 重新裁定为入口护栏、L3 只做护栏 + 夹具（`Core.eval` 环境不索引化）。
- M24.7：`Show`/`Eq`/`Ord` 库化——`Base.{Show,Eq,Ord}`（含 `Int`/`String`/`Bool` 实例）成为唯一来源，删 `DtDerive` 内建 trait/实例、`Elab` 注入与 `Loader` 短名放行；`deriving` 用解析后类名、`==`/比较按短名查类 + 泛型兜底；修复用户 data 上 `<` 与 `Loader`/`Pkg` 防御性 bug；单文件需 `--root base/lib` + 显式 `import Prelude`。

> 阶段细节见 [history.md](history.md)（「已完成里程碑细节」+ M21–M24.7 各节）；本文件只保留
> 一句话摘要，不再保留已完成阶段的目标/范围/验收段落。

## 终态（本路线图的目标）

**一套表面语言、一个类型检查器、一条 codegen、一个 seed。**

- **类型理论**：依赖类型（Core TT + 精化器）；HM 检查器与其 codegen 从仓库删除。
  核心表示层按 **QTT 可替换**设计（rig 三值与不透明 `Level`，见 M18.6），但 QTT 本身不排期。
- **路径**：`Parser → DT 精化 → 擦除 codegen → OCaml`。不再有 `--dt` 开关——它就是默认且唯一路径。
- **模块与包**：DT 直接建在现有 `Loader` / `Pkg` 之上，**不搞平行 Loader**（HM 将删除，平行实现是纯浪费）。
- **语言面**：**顶层签名必填**，不引入 HM 式顶层推断；不用的特性直接删，不留兼容层。
- **已删除**：`vuna interp` 的「不检查直接执行」调试语义（M23 起改为精化后的核心求值器）。
- **明确保留**：`record` 与 `deriving`、多 clause / 方程左端模式、`do` 与 `Base.IO`、
  trait/instance（含高阶 kind）、包级 effectful allowlist、seed 自举链与全部 CI 门槛。

## 当前硬约束

1. 当前编译器必须能通过自身类型检查；
2. seed rotation 后 stage 1 与 stage 2 必须字节一致；
3. `test/run-tests.sh`、`nix build`、`nix flake check` 必须保持通过；
4. **seed 只含 compiler 包的入口闭包**；工具链（fmt/lint/repl/doc/test、LSP、package manager）不进入 TCB；
5. **唯一路径**：M24 起语言夹具、`vuna interp`、包构建与 seed 全部走 DT（精化 + 擦除
   codegen，`vuna check .` 也是 DT 自检）；HM 模块已删除，没有可切换的检查器或第二套
   codegen，也没有 `--dt` 开关；
6. 新增语法先以**当前种子可编译**的形式落地，rotation 之后才在编译器源码中使用。

## 阶段共同门槛

- `nix flake check`（vuna-tests / vuna-package / vuna-metrics / vuna-typecheck / vuna-lint / vuna-index / context-budget / seed-selfhost）通过。
- 单路径门槛：M24 起「唯一路径全绿」——HM 已删除，全部检查/构建/seed 都走 DT。
- DT 代码：核心求值器与擦除 codegen 语义一致（同夹具 `interp` 与 `compile`+`ocamlopt` 输出逐字节相同）。
- 当前种子能编译当前源码；rotation 后 stage1 == stage2；seed 仍只含 compiler 包闭包。
- 编译器自检通过；新增阶段更新 README / AGENTS 的约束、`docs/history.md` 与 roadmap 完成摘要。
- **新增 DT 能力必须同时给 `test/corpus/dt*` 正例与反例**，否则计入未完成。

## 路线阶段

### 阶段状态总览

阶段按编号顺序推进；依赖写在每个阶段的「前置」里。**当前阻碍登记在未完成阶段内**，完成
阶段整段删除、只在本表保留一句话摘要；已完成的 M13–M24.7 细节见 [history.md](history.md)。

| 阶段 | 状态 | 关键交付 | 当前阻碍 / 备注 |
| --- | --- | --- | --- |
| M13–M18.6 | 已完成 | DT 地基、索引族、trait/实例、终止性、工具链、擦除修复、表示层定型 | — |
| M19 / M20 | 已完成 | 语言面 parity；复用 Loader 走出单文件 | — |
| M20.5 | 已完成 | 泛型实例约束求解（`solveMetaHo`、字典延迟、`mem`） | — |
| M21 | 已完成 | `main : IO a`、`do` / trait 投影、实例方法矩阵、Bool 统一表示 | — |
| M22.1 | 已完成 | 包目录 `check` / `compile --dt` + 依赖序加载 | — |
| M22.2 | 已完成 | 库名统一、模式矩阵、泛型比较、Bool 去桩、`Base.Sort` | — |
| M22.3 | 已完成 | rig 驱动擦除、`build`/`seed --dt`、metrics | — |
| M23 | 已完成 | 全仓源码与夹具迁移、签名回填、`interp` 改核心求值（删除 `Vuna.Eval`） | — |
| M24 | 已完成 | DT split seed 与轮换、删除 HM/`--dt`/`compile --package`、单路径 CLI/LSP、`where` 签名、`tNNN` 清理 | — |
| M24.5 | 已完成 | 等式搬运与精化器补强（scrutinee 反射、空族不可达分支、`Eq` 元变量内联、`plus` 定义性相等） | — |
| M24.6 | 已完成 | 编译器本体最小重构（构造子形状单一真源、de Bruijn/名字/入口护栏、类型族擦除、split entry data） | — |
| M24.7 | 已完成 | `Show`/`Eq`/`Ord` 库化（`Base.{Show,Eq,Ord}`）、删内建 trait/实例与 Loader 放行、单文件显式 import | — |

> **已完成阶段（M21–M24.7）**：细节见 [history.md](history.md) 的对应归档节。完成时保留的
> 例外（Bool 类型别名、`where` 保留并改为「带签名的顺序 let」）见「决策变更」；本文件不保留
> 已完成阶段的目标/范围/验收段落。

## 后续大阶段（M25–M28）

### M25：模块系统 v3

**目标**：signature / functor / 嵌套模块 / module type 别名 / opaque ascription；与包
`[export]`、DT 记录（已删，用 `data`）/接口整合。

**范围**：签名匹配、functor Map/Set、跨包可见性、split/`.mli`。

**验收**：签名匹配正/反例、抽象泄露反例、functor 示例；seed 闭包不变。

**前置**：M24.6（已完成）。**优先级**：中。

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
| M21 验收含「`app/Main.vuna` 等价程序 DT 全绿」 | 本文 M21 | 拆到 M22.2 / M23：M21 以 dt_base/dt_io 夹具验收 `Base.IO` 面 | app/Main 依赖 record 与全库迁移；M21 只承诺 IO/trait 通路可用 |
| `vuna interp` 保留「不检查直接执行」 | M12.6 | 取消，改为精化后的核心求值器 | 单路径下没有「另一种语言」可以免检执行 |
| 原 M19（效应）/ M20（模块 v3）/ M21（运行时）/ M22（生态）/ M23（并发） | 本文旧版 | 依次改为 M21 / M25 / M26 / M28 / M27 | 让位于单路径迁移主线 |
| `Show` / `Eq` / `Ord` 与 Bool 桩由编译器内建 | M10.5 / M19 | 库为唯一来源：`Base.{Show,Eq,Ord}` + `Base.Bool`，编译器只留语法/表示特化；Bool 去桩在 M22.2、trait 库化排 M24.7 | 消除双份定义与 5 处短名桥接 hack；与已库化的 `List` / `Monad` 对齐 |
| M22 一号两用（roadmap=擦除/codegen；git log=泛型实例约束） | M22 | 先拆 M22.1–M22.5，再按可开工依赖重排：泛型实例→M20.5（已完成）、trait 投影并入 M21、包目录→M22.1、库名/Bool 去桩→M22.2、擦除/codegen→M22.3 | 编号顺序 = 可开工顺序；M21 自包含 `do` / trait 投影，不再依赖更晚阶段 |
| Bool 去桩后 prelude 不再有 `Bool` 类型名 | 本文 M22.2 验收草案 | 只去 `True`/`False` **值**桩；保留 `Bool` 类型别名 | prelude 里 `==` / 比较的签名与不含 `data Bool` 的单文件程序仍需要一个 Bool 类型名（M24.7 后 trait 本身在 `Base.{Show,Eq,Ord}`，不再依赖此别名）；数据定义仍以 `Base.Bool` 为唯一权威 |
| 覆盖率/穷尽性检查对所有包严格 | M14 起 | TCB 三包（`vuna` / `vuna-compiler` / `vuna-base`）**只告警不报错**，其余包严格 | 编译器源码是执行代码而不是被证明的定理；HM 路径本来就只告警、生成 OCaml 用 `-w -a`。与「终止性检查按包名 allowlist 跳过」同一机制，见 `dtTrustsTermination` |
| 非 `Int`/`String` 的 `==` 必须解析到 Eq 实例，否则报错 | M19 / M22 | 没有实例时**退回泛型结构比较**（`bi_eq_generic`，OCaml 结构化相等），与 HM 的运行时 `=` 对齐；**M24 删 HM 后不再产生 `tNNN` 推断变量，名字启发式直接删除**：刚性类型变量仍走 M22 字典提升/延迟提升（实例优先），泛型结构比较只作「具体类型无实例」兜底 | 编译器源码里大量「比较列表/记录」不写 `deriving`；不退回就无法迁移。有实例时仍优先字典；「刚性变量一律 generic」会旁路 M22 提升并让 interp 走 `Core.valueEqDeep` 的 `force` 薄弱点，实测回归，故不做 |
| 零参数定义的初始化时机 | M12 | DT codegen 对**零运行时参数**的顶层定义包成 thunk（`fun () -> body`），引用处补 `()`；`main` 例外 | HM codegen 一直这样做（`help = let _ = print ... in 0` 不能在建表时执行）；不补则 DT 产物在启动时打印所有帮助/错误文本 |
| M22.3 的 DT 输出模型要求逐模块 `.ml`/`.mli` + `build.sh`（与 `seed/` 同形） | 本文 M22.3 草案 | 本轮只做**单文件** `main.ml` + `build.sh`；逐模块切分与 `seed` 的文件集形状推迟到 **M24**。M24 已落地 DT 逐模块 split（`CoreCodegen.generateDtSplitProgram`），且**不生成 `.mli`**：`seed` = `Vuna_runtime.ml` + `Vuna_builtins.ml` + 逐模块 `.ml` + `Main.ml` + `build.sh`（38 文件） | seed 轮换发生在 M24，与 HM 删除一起做一次性收益最大；`.mli` 只是 HM 时代的抽象边界，DT split 靠全局唯一名字 + open 链即可，去掉后 seed 更小、生成器更简单 |
| seed 由 HM typed codegen 生成（`compile --package` 的 lib/app 布局） | M12–M23 | **M24 起 seed 由 DT split codegen 生成**（`SplitCli.buildSplit`/`seedSplit` → `Dt.dtSplitProject`）；`compile --package` 删除，`build` 默认 DT 单文件、`build --split` 与 `seed` 产逐模块 split | 终态只有一套 codegen；HM 产物与 DT 产物语义不同源，seed 必须来自终态路径才能自证 |
| metrics 口径 = `compile --package` 的 HM 产物 | M12–M23 | **M24 起改为 `vuna seed` 的 DT split 产物聚合**，并按实测重标定 `nix/metrics.budget` | HM 删除后旧口径已不存在；seed 闭包才是 TCB 关心的 codegen 面 |
| `--dt` 开关 + HM 为默认检查器 | M13–M23 | **M24 删除 `--dt`**：check/compile/build/seed/interp 全部 DT，`--dt` 报 removed（exit 2）；LSP 诊断改 `Elab`（`goalsOfProgram` 同源），删除 HM 诊断分支 | 终态唯一路径不需要开关；保留开关意味着两套语义永远要维护 |
| 一次性签名导出工具 `Vuna.SigExport`（`vuna sig-export`） | M23 | **M24 用完即删**（`tNNN` 回填完成、HM 删除后不再需要） | 「一次性工具用完即弃」；它依赖 HM 推断结果，HM 删除后无法运行 |
| 迁移期夹具在 HM typed 与 DT 两条路径各跑一遍 | M18.5–M22 | M23 起语言夹具只走 DT（`check --dt` / `compile --dt` / `interp`）；HM 只守源码自检与包构建，直到 M24 删除 | 夹具是语言的验收面，双路径各跑一遍会掩盖两条语义差异；M23 的交付就是把验收面切到终态路径 |
| interp 对效果程序：旧 `Vuna.Eval` 可直接执行 `print` / 文件效果 | M12.6 | 核心求值器是纯的：任何 `main : IO a` 一律报「不能执行效果」，效果程序用 `compile` + 运行；夹具用 `.nointerp` 跳过 interp | 纯 NbE 无法可靠区分「效果被丢弃」与纯计算，静默丢效果会误导调试；单路径下不应保留第二套执行语义 |
| `where` 子句（parser 支持、仅夹具使用） | M12 起 | M23 不进 DT（夹具改写为等价顶层 helper）；**M24 改为保留并新增显式签名语法**：每个 where 绑定必须写 `name : Ty`，语义是局部**顺序 let**（后定义可用前者，无前向/自/互递归；递归放顶层定义组），parser/Fmt 的 where 支持保留 | 顶层签名必填后 where 局部绑定无法推断；给 where 绑定补显式签名后 DT 可直接按 checking 模式精化，成本低且保留记法 ergonomics。递归语义不做：顶层定义组已支持互递归/自递归/前向引用，where 只作局部辅助 |
| `where` 内支持递归/前向引用（HM 的 `ELet rec=True` 语义） | M12–M23 | **不保留**：where 绑定按书写顺序可见；顶层定义组仍是互递归/自递归/前向引用的唯一入口 | 递归 where 需要 Core 的 fixpoint 载体（`TLetRec`）或 lambda lifting，成本与风险远大于收益；终态语言要求「不用的特性直接删/简化」 |
| DT 的 record update / 参数化 record / 命名实例 `@inst` / 实例诊断留到 M24.6 的大重构 | M19 / M22.3 规划 | **M23 随夹具迁移补齐**（`DtRecords` 降级 update、构造器名去 `Mk` 前缀、`Elab.inferInstSel`、重复实例 / 未知方法诊断） | 夹具迁移是终态语言的验收面；这些是已保留特性的必要部分，留到 M24.6 会让「夹具全绿」与「特性语义」互相矛盾 |
| M24.6 第二级：`Expr : Phase -> Type` phantom index（Parsed/Resolved 编译期标记） | M24.6 规划 | **重新裁定为入口护栏**：M24 后 codegen 只接受 `DtProgram`，唯一读 `Decl` 的 split 归属表在入口用 `checkResolvedModules` 校验「声明名带模块前缀」；不再为 Expr 引入 phase 参数 | 原风险（未 resolve 的 Expr 进 codegen）在单路径架构下不存在：解析结果经 Loader→Elab→DtProgram 才到 codegen。引入 Phase 会穿透 Fmt/Index/LSP/REPL 全部 Expr 匹配，收益接近零 |
| M24.6 第三级：Core 的 `Env : Nat -> Type` + `Fin` total lookup 全面索引化 | M24.6 规划 | **只做护栏 + 语言侧证据**：`Core.varIndex` 越界返回 -1、`checkAllDefScopes` 验证运行时定义体作用域；`Env`/`Fin` 形态作为夹具记录（47_lookup_env）；`Core.eval` 的 `List Value` 环境与 `Clos` 捕获**不换**索引表示 | M24.5 后「依赖索引取值」（`Ctx n -> Fin n -> Tm n`）仍写不出，索引化的核心收益不成立；`Clos` 需要存在式长度、改写 eval/applyClosure 全部调用点，风险与收益不匹配。「每级完成即停，不要在第三级无限深入」|
| 类型族（结果类型以 `Type` 收尾的函数，如 `sel : Nat -> Type`）按运行时定义处理 | M14–M24.5 | **整体擦除**：`isTypeLevelDef` 改用 `isTypeForming`（宇宙或 `... -> Type` Pi 链）；三个旧负例（`dt_err/09`、`18`、`19`）语义纠正后删除，新增正例 51/52 与「运行时定义里把擦除参数当值用」负例 39 | 旧判据只看裸 `Type`，导致类型族生成未定义 `v_Int`/`v_String`（check 过、ocamlopt 才炸）；类型族本身在类型层求值，不产生运行时定义 |
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
