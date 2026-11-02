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

> 阶段细节见 [history.md](history.md)（「已完成里程碑细节」+ M21–M22.3 各节）；本文件只保留
> 一句话摘要，不再保留已完成阶段的目标/范围/验收段落。

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

## 路线阶段（M23–M24.7：走向单一路径与 DT 大重构）

### 阶段状态总览

阶段按编号顺序推进；依赖写在每个阶段的「前置」里。**当前阻碍登记在未完成阶段内**，完成
阶段整段删除、只在本表保留一句话摘要；已完成的 M13–M22.3 细节见 [history.md](history.md)。

| 阶段 | 状态 | 关键交付 | 当前阻碍 / 备注 |
| --- | --- | --- | --- |
| M13–M18.6 | 已完成 | DT 地基、索引族、trait/实例、终止性、工具链、擦除修复、表示层定型 | — |
| M19 / M20 | 已完成 | 语言面 parity；复用 Loader 走出单文件 | — |
| M20.5 | 已完成 | 泛型实例约束求解（`solveMetaHo`、字典延迟、`mem`） | — |
| M21 | 已完成 | `main : IO a`、`do` / trait 投影、实例方法矩阵、Bool 统一表示 | — |
| M22.1 | 已完成 | 包目录 `check` / `compile --dt` + 依赖序加载 | — |
| M22.2 | 已完成 | 库名统一、模式矩阵、泛型比较、Bool 去桩、`Base.Sort` | — |
| M22.3 | 已完成 | rig 驱动擦除、`build`/`seed --dt`、metrics | — |
| M23 | 进行中 | 全仓源码与夹具迁移；签名回填（`check --dt .` / `build --dt .` 已通，夹具迁移/interp 切换待做） | 夹具迁移、interp 语义切换 |
| M24 | 未开始 | seed 切换、HM 删除、`--dt` 默认化 | 前置 M22.x + M23 |
| M24.5 | 未开始 | 等式搬运与精化器补强 | 跨形参等式不可写 |
| M24.6 | 未开始 | 编译器本体 DT 大重构（分级） | 第三级依赖 M24.5 |
| M24.7 | 未开始 | Eq/Ord/Show 库化 | 前置 M24 |

> **已完成阶段（M21–M22.3）**：细节见 [history.md](history.md) 的对应归档节。完成时保留的
> 两个例外（Bool 类型别名、逐模块 split 推迟到 M24）见「决策变更」；本文件不保留已完成阶段的目标/范围/验收段落。


### M23：全仓源码与夹具迁移

**目标**：把 `base` → `lib` → `compiler` 三包与全部夹具迁到 DT 下通过。这是 seed 切换的前置。

**范围**：

- **签名导出工具（一次性）**：用现有 HM 检查器的推断结果生成 DT 签名并回写源码
  （约 1083 个无签名定义）。工具在 M24 后删除——这是「无兼容义务」换来的最划算的一步。
- **Bool 收口**：去桩已在 M22.2 完成（`DtPrelude` 不再有 `Bool` / `True` / `False` 桩，
  `if` / `case` 按族短名识别，`Base.Bool` 是唯一权威定义）；M23 只随 `base` 迁移同步
  注释与文档（[dt.md](reference/dt.md) / [limits.md](reference/limits.md)）。
- 逐包迁移，顺序 `base` → `lib` → `compiler`（依赖顺序），每包独立可验证。
- 夹具迁移：`test/corpus/` 按新路径重写 / 替换 / 删除（DT 正例 38 / 负例 29）；
  HM 专属段按新语义重写（`traits/` 与 `fmt/` 的 record/deriving 夹具要保留语义，不删特性）。
- `vuna interp` 语义切到「精化后核心求值」，免检调试语义正式取消。

**验收**：`vuna check --dt .` 全仓通过；`vuna build --dt .` 三包都能产出可运行二进制；
夹具在新路径全绿；[language.md](reference/language.md) / [type-system.md](reference/type-system.md) /
[limits.md](reference/limits.md) 同步。

**前置**：M21–M22.3（已完成）。**风险**：这是最大的一块机械
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
| M21 验收含「`app/Main.vuna` 等价程序 DT 全绿」 | 本文 M21 | 拆到 M22.2 / M23：M21 以 dt_base/dt_io 夹具验收 `Base.IO` 面 | app/Main 依赖 record 与全库迁移；M21 只承诺 IO/trait 通路可用 |
| `vuna interp` 保留「不检查直接执行」 | M12.6 | 取消，改为精化后的核心求值器 | 单路径下没有「另一种语言」可以免检执行 |
| 原 M19（效应）/ M20（模块 v3）/ M21（运行时）/ M22（生态）/ M23（并发） | 本文旧版 | 依次改为 M21 / M25 / M26 / M28 / M27 | 让位于单路径迁移主线 |
| `Show` / `Eq` / `Ord` 与 Bool 桩由编译器内建 | M10.5 / M19 | 库为唯一来源：`Base.{Show,Eq,Ord}` + `Base.Bool`，编译器只留语法/表示特化；Bool 去桩在 M22.2、trait 库化排 M24.7 | 消除双份定义与 5 处短名桥接 hack；与已库化的 `List` / `Monad` 对齐 |
| M22 一号两用（roadmap=擦除/codegen；git log=泛型实例约束） | M22 | 先拆 M22.1–M22.5，再按可开工依赖重排：泛型实例→M20.5（已完成）、trait 投影并入 M21、包目录→M22.1、库名/Bool 去桩→M22.2、擦除/codegen→M22.3 | 编号顺序 = 可开工顺序；M21 自包含 `do` / trait 投影，不再依赖更晚阶段 |
| Bool 去桩后 prelude 不再有 `Bool` 类型名 | 本文 M22.2 验收草案 | 只去 `True`/`False` **值**桩；保留 `Pair "Bool" (TType 0)` 类型别名 | 内建 trait（Show/Eq/Ord）方法签名与不含 `data Bool` 的单文件程序仍需要一个 Bool 类型名；数据定义仍以 `Base.Bool` 为唯一权威，值构造子与 `case`/`if` 全按族短名解析 |
| 覆盖率/穷尽性检查对所有包严格 | M14 起 | TCB 三包（`vuna` / `vuna-compiler` / `vuna-base`）**只告警不报错**，其余包严格 | 编译器源码是执行代码而不是被证明的定理；HM 路径本来就只告警、生成 OCaml 用 `-w -a`。与「终止性检查按包名 allowlist 跳过」同一机制，见 `dtTrustsTermination` |
| 非 `Int`/`String` 的 `==` 必须解析到 Eq 实例，否则报错 | M19 / M22 | 没有实例时**退回泛型结构比较**（`bi_eq_generic`，OCaml 结构化相等），与 HM 的运行时 `=` 对齐；HM 推断出的类型变量（`tNNN`）直接走泛型 | 编译器源码里大量「比较列表/记录」不写 `deriving`；不退回就无法迁移，而终态要删除 HM。有实例时仍优先字典 |
| 零参数定义的初始化时机 | M12 | DT codegen 对**零运行时参数**的顶层定义包成 thunk（`fun () -> body`），引用处补 `()`；`main` 例外 | HM codegen 一直这样做（`help = let _ = print ... in 0` 不能在建表时执行）；不补则 DT 产物在启动时打印所有帮助/错误文本 |
| M22.3 的 DT 输出模型要求逐模块 `.ml`/`.mli` + `build.sh`（与 `seed/` 同形） | 本文 M22.3 草案 | 本轮只做**单文件** `main.ml` + `build.sh`；逐模块切分与 `seed` 的文件集形状推迟到 **M24** 的 seed 切换 | seed 轮换发生在 M24，届时与 HM 删除一起做；单文件形状已足以验证 `build --dt` / `seed --dt` 入口、擦除与 codegen 接线；先做 split 会与 M24 的迁移一次性收益重复 |
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
