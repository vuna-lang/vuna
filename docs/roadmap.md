# Vuna 路线图

本文记录 vuna 的当前基线与**可排期阶段**（M27 起）以及**不排期的未来轨道**（F1–F4）。
逐条技术债务、临时决定与可复现缺陷登记在 [reference/debt.md](reference/debt.md)；
里程碑历史在 [history.md](history.md)（各阶段实现细节在 git 历史）。

## 维护规则

- **M 编号 = 可排期阶段**：按依赖顺序推进；完成即按本规则收敛。
- **F 编号 = future，不排期、不占 M 编号**：只表示方向与前置条件，编号不构成排期承诺。
- **已完成阶段只保留一句话摘要**（「已完成」列表）；目标/范围/验收/设计细节删除，历史
  写进 [history.md](history.md)（实现细节在 git 历史）。
- **新阶段必须能映射到 [debt.md](reference/debt.md) 的条目**：每阶段在「范围」里列 debt ID；
  关闭债务时更新该文件，不静默删除。
- **新增/变更阶段先写入 roadmap，完成后收敛摘要**；推翻旧决策必须在「决策变更」留一行，
  细节进 history。
- **禁止无登记的临时层**：任何「先这样、以后再说」的兼容层/哨兵/特判必须同时登记 debt 与
  归属阶段，否则视为未完成。
- 插入阶段用 `x.5`；研究储备不编号，进入排期时再分配编号。

## 项目前提（2026-11）

vuna 尚未发布任何版本：没有外部用户、下游生态与历史包袱，全部源码在本仓库内，可以整体
重写。由此导出：**不为兼容而保留**（评估遗留物只看「它在终态里还成立吗」）、**允许推翻
决策**、**终态优先于渐进**。2026-11 的审计（四份报告合并入 debt）表明：M24 的单路径收尾
只完成了「路径唯一」，旧 HM 架构与迁移期临时决定仍在多处透出；因此 M25 起先做**正本
清源**，再谈能力扩张。

## 已完成（一句话摘要，细节见 history）

- M1–M12.8：parser / 求值器 / 自举 / 文件即模块 / 模块 v2 / record+trait / 包与工具链 /
  分离编译与 seed 多文件 / 编译器独立包（工具链移出 TCB）/ `main : IO a`。
- M13–M18.6：DT 地基——索引族与依赖模式匹配、隐式/接口/洞、终止性与覆盖、DT 工具链、
  擦除判据修复、表示层定型（三值 rig + 不透明 Level）。
- M19–M20.5：语言面 parity（let/推断位 case/嵌套与多 clause/字面量模式/record/deriving）、
  复用 Loader 走出单文件、泛型实例约束求解与字典延迟。
- M21–M22.3：`do`/`Base.IO`、包目录入口、库名统一与模式矩阵、Bool 去桩、rig 驱动擦除、
  `build`/`seed` 与 metrics 重标定。
- M23：全仓源码与夹具迁移到 DT、签名回填、`interp` 改为精化后核心求值。
- M24：单一 DT 路径落地——split seed、删除 HM/`--dt`/`compile --package`、LSP 走 DT、
  `where` 显式签名、`tNNN` 清理。seed 由 DT split codegen 生成。
- M24.5–M24.7：等式搬运（scrutinee 反射/空族分支/隐式 `Eq` 内联/定义性相等）；codegen
  硬化（构造子形状单一真源、名字/作用域/入口护栏、类型族擦除、entry data）；`Show`/`Eq`/
  `Ord` 库化（删内建 trait/实例与 Loader 放行）。
- M24 后维护：源码模块重组（compiler 25→40 模块、门面 + 叶子、目录即层；工具链 Fmt/Lint/
  Index 拆分）；当前基线：seed 55 `.ml` / 56 文件、1076 checks、`nix flake check` 全绿。
- M25：健全性与验证基建——删除按包名检查豁免（SCT + 显式 fuel 源码达标、覆盖率哨兵删除）、
  `VApp`/作用域护栏、泛型相等安全域、诊断文案清理、CI/seed 漂移/闭包数量断言；
  seed 60 `.ml`、1112 checks、flake 全绿。
- M24 后维护（本波）：全仓妥协/临时决定/缺陷审计 → [debt.md](reference/debt.md)；路线图
  从「功能扩张」重排为「正本清源」阶段（M25–M30）+ 未来轨道（F1–F4）。
- M24 后维护（本波，错误码体系）：诊断带语义错误码（`[TC_/CG_/LX_/PS_/LD_/LN_/FX_]`
  前缀，一个码一种语义、只增不删）；真源是**域枚举**（`Vuna.Compiler.Diagnostics` 的
  `TcErr`/`CgErr`、`Frontend.Diagnostics` 的 `LexDiag`/`PsDiag`、`Loader.Diagnostics` 的
  `LdDiag`、`Vuna.Lint.Diagnostics` 的 `LintRule`），构造子携带模板、arity 由 `Nat` 索引
  在编译期锁定；`vuna gen-errors` 遍历枚举表生成 `docs/.generated/errors.md`
  （gitignored、幂等，131 码）；lint 输出 `[LN_XXX] 规则: 消息`。
- M26：包上下文统一与单一 codegen 输出模型——删除环境根（roots）与 `List Root` 公共 API，
  每个源文件由最近 `vuna.toml` + 依赖闭包解析（无 manifest 只有 base：`VUNA_BASE` 或可
  执行文件相对布局），目录入口不向上找 manifest，ad-hoc 单文件自动注入 Prelude；删除单
  文件 codegen、`--split` 开关与 `seed` 子命令（`compile`/`build` 统一产逐模块 `.ml` +
  `build.sh`，`build` 默认 `<PKG-DIR>/.output`、`--out` 可改），删除空 `Vuna_builtins`
  unit → seed 65 `.ml` / 66 文件，零参顶层定义改为求值一次；入口 data/trait 归属身份
  收口（A13/C08），API/产物快照与上下文回归入库（C21/E14/E15）；LSP 本次未改加载
  语义（仍 parse 级、含 import 跳过类型检查，D13/M30 接同一 `contextForFile`）。
- M27：内置、原语与效应边界——单一声明面 `Vuna.Compiler.Intrinsics`（名字/签名/arity/
  归约标签/能力/runtime 名），Loader/Elab/Codegen/Eval 全部消费它；内置身份改按**完整
  声明符号**（canonical `Base.Bool.Bool` / `Base.List.List` / `Base.IO.IO`），删
  `lastName`/`isGlobalCtor`/Bool 双身份；效果原语只保留 `prim_*`，包用 manifest
  `[capabilities] effects` 显式声明能力（替代包名 allowlist）；原语语义规范落
  `docs/reference/primitives.md`（Int 63 位回绕、String UTF-8 字节串、除零与 `str*`
  的 interp 边界显式分类、`strShow` 统一 `Show String`）；seed 66 `.ml` / 67 文件。

## 终态（目标）

**一套表面语言、一个类型检查器、一条 codegen、一个 seed，且检查器本身可信。**

- **类型理论**：依赖类型 + 归纳族；QTT 可替换的表示层（rig/Level 已预留），宇宙与擦除
  判据在 M28 定型。
- **路径**：`Parser → Loader → DT 精化 → 擦除 codegen → OCaml`；单文件只是包内 ad-hoc
  入口，与包内模块走同一装配/codegen，不再有第二套加载语义。
- **可信性**：不存在「跳过检查但不告知」的通道；任何放行都是显式、可审计、有诊断的。
- **语言面**：顶层签名必填；不用的特性直接删；不保留兼容层。`record`/`deriving`/多 clause/
  `do`/trait 保留，但降到普通 data/case/字典语义之上，不靠短名特判。
- **模块与包**：模块系统 v3、运行时/后端、效应与并发、生态属于未来轨道（F1–F4），不阻塞
  当前根修。

## 当前硬约束

1. 编译器自检通过（`vuna check .`）；
2. seed rotation 后 stage1 == stage2，并且 **seed 与源码同步**（有漂移检查）；
3. `test/run-tests.sh`、`nix build`、`nix flake check` 必须通过；
4. seed 只含 compiler 包入口闭包；工具链（fmt/lint/repl/doc/test、LSP、package manager）
   不进 TCB；TCB 边界检查必须覆盖嵌套模块与完整闭包；
5. 唯一路径：所有检查/构建/seed/interp 走 DT；禁止第二套检查器/codegen 或隐藏开关；
6. 新语法先以当前 seed 可编译的形式落地 → rotation → 再在编译器源码中使用；
7. **检查必须真实**：不允许按包名/文件名静默跳过终止性、覆盖率、effect 检查；放行必须
   有 Warning/Error 诊断或显式、不可伪造的信任声明；
8. 不为兼容旧行为新增特判/哨兵；临时层必须登记 debt 并给关闭阶段。

## 阶段共同门槛

- `nix flake check` 全绿（含 `seed-selfhost`、`vuna-tests`、`vuna-typecheck`、`vuna-lint`、
  `vuna-index`、`vuna-metrics`、`vuna-package`、`context-budget`）。
- 旧 seed 能编译新源码；rotation 后 stage1 == stage2，且 `seed/` 无漂移。
- DT 语义一致：夹具 `interp` 与 `compile`+运行输出一致（效果/不可归约夹具除外，且有分类
  标记与原因）。
- **debt 收敛**：本阶段「范围」列出的 debt 条目全部关闭，或经决策后迁移到明确阶段。
- 新增/变更能力必须同时有 `test/corpus` 正例与反例；编译器自检通过。
- 文档同步：README / AGENTS / architecture / reference 相关页 / history / roadmap / debt。

## 阶段状态总览

| 阶段 | 主题 | 依赖 | 状态 | 关闭的债务（示例） |
| --- | --- | --- | --- | --- |
| M26 | 包上下文统一（删除 roots）与单一路径 | — | 已完成 | A01–A06、A13、A15–A16、C08、C21、E14–E15 |
| M27 | 内置、原语与效应边界 | M26 | 已完成 | A07–A11、B16、C16–C19、D16 |
| M28 | 类型系统地基 | M27 | 待排期 | B05–B10、B15、D05–D10 |
| M29 | 相等、实例与证明 ergonomics | M28 | 待排期 | A14、B11–B14、C05、D11–D12 |
| M30 | 工具链与包 | —（可与 M27–M29 并行） | 待排期 | C11–C13、C25、D13–D15、D17–D18、E08 |
| F1–F4 | 模块 v3 / 运行时 / 效应并发 / 生态 | 不排期 | 不排期 | D01–D04 |

## 可排期阶段（M28 起）

### M28：类型系统地基

**目标**：把「宇宙 / 擦除 / 合一 / 命名空间 / 定义形式」从中间态收成一套明确规则，
为 M29 的相等与证明能力打地基。

**范围**（debt）：
- 宇宙：决定「累积性 + lift」还是「单一 Type:Type」（B05/D05）；`kindWellFormed` 校验
  data kind 的 level 与构造子结果（B05/D06）。
- 擦除：4 个谓词收成一个判据；采用使用分析/QTT multiplicity 或显式标注（B06/D07）；
  索引擦除策略明确。
- 合一：pattern unification（Miller patterns）、元变量创建深度就地检查、统一 zonk
  （B07）；删除 `inlineSolvedMetas` 补洞。
- 命名空间：type/value 双命名空间进解析层，删除同名特判（B18）。
- 定义形式：axiom/foreign 定义、η 展开（参数少于签名）、let/where 统一作用域模型
  （B10/D10）。
- case 规范形：统一走模式矩阵单一规范形；空族/absurd 与中性索引（B08/B15/D12 的
  absurd 部分）。

**验收**：宇宙/kind 反例被拒；合一有正/反例测试；编译器源码在**不伪造包名**的前提下
通过终止性/覆盖检查；命名空间行为一致。

**前置**：M27。**决策点**：宇宙方案；QTT vs 显式 multiplicity。

### M29：相等、实例与证明 ergonomics

**目标**：让 `Eq`/字典/派生/证明写法成为类型系统的自然结果，而不是「泛型兜底 + 手写
显式参数」的拼凑。

**范围**（debt）：
- 字典 schema：参数化/约束实例（`instance Eq a => Eq (F a)`）、参数化 `deriving (Eq/Show/
  Ord)`、字典身份与 owner（B11/A13 收尾）；`monad/04` 的字典 binder bug（C05）。
- 删除泛型 `==` 兜底与 `bi_eq_generic`/`valueEqDeep` 双实现（B04/C04）；若保留结构比较，
  必须类型导向且与 interp 同语义（M25 已做安全域限制，在此收口）。
- type-as-value / type codes 决策（B14/D09）；Type 级等式与 `cast` 的最终形态。
- 证明 ergonomics：构造子部分应用 conv（`cong Succ`）、隐式等式搜索/auto、隐式值参数
  `{x:a}` 与隐式模式、absurd/空族、Σ 与依赖索引取值（Ctx/Env）（B13/D08/D12）。
- trait 能力与 coherence：多参数/默认方法/父类/关联类型、命名实例进搜索或删除该特性
  （B11/B12/D11）。
- 记录/投影 span 与诊断（A14）。

**验收**：`mem (Box Int)` 等参数化实例可用；`deriving` 覆盖参数化 Show/Ord；函数相等在
check 期被拒；`sym/cong/subst` 无需手写全显式参数；依赖索引 lookup 可表达；`monad/04`
去掉 `.nointerp/.nocompile`。

**前置**：M28。**决策点**：type codes vs 保留 `cast` 组合子；命名实例去留。

### M30：工具链与包

**目标**：让工具链的「查询/诊断/文档/构建」与编译器语义同级可信；补齐包与构建的工程
缺口（生态能力仍归 F4）。

**范围**（debt）：
- CLI 错误层：`fmt`/`map`/`doc` 对不存在路径/非工作区给可读错误，不再抛宿主异常
  （C12）；参数模型统一。
- 工具链语义：LSP 对 import 的文件真正做类型检查（需要包解析）、Index 内容哈希 +
  可选语义索引（C11/D13）；REPL 多行/效果（D14）；TestRunner 支持效果与 main 类型（D14）；
  `doc --with-comments` 实现或删除、doc 尊重 `[export]`（C13/D17）。
- 包与构建：manifest 字段语义（version/edition 或删除）、workspace 作为检查/构建单元、
  hermetic 构建与依赖哈希（C25/D15）；registry/lockfile 仍归 F4。
- 工程化：benchmark 基线/软告警（E08）、性能（NbE 共享/自检耗时）（D18）。
- 文档与验证：把「工具链能力/边界」写入 reference，并给关键行为加集成测试。

**验收**：CLI 无宿主异常泄漏；LSP/Index 在两模块以上工程可用；doc 与 usage 一致；构建可
复现（同输入同产物）；benchmark 有基线。

**前置**：—（可与 M26–M29 并行）。

## 未来轨道（F = future，不排期、不占 M 编号）

### F1：模块系统 v3

签名/接口、functor、嵌套与局部模块、选择性 import；与包 `[export]`、模块身份、
split 单元整合；是否重新引入 `.mli` 在此决策。

**前置**：M26–M30 稳定（尤其 M26 装配与 M28 命名空间）。**状态**：不排期。

### F2：运行时与多后端

擦除感知的运行时；OCaml runtime 长期保留 vs 自研 GC/后端无关 IR；Wasm/JS 后端原型；
GC/运行时正确性与性能；后端语义一致与 seed 边界不变。

**前置**：M27（原语/效应边界）、M28（擦除判据）。**状态**：不排期；擦除后 OCaml 后端
可能长期够用。

### F3：效应、并发与异步

通用效应系统（effect rows 或等价设计）、async/await 或结构化并发、调度器、取消/超时；
把 `IO` 从 thunk 升级为正式效应接口（A12）。

**前置**：M27、F2 方向决策。**状态**：不排期；可先库级后语言级。

### F4：标准库与包生态

DT 验证库（Vec/Fin/Map/Set/排序/证明组合子）；包 registry、版本解析、lockfile、文档托管；
生态与发布流程。

**前置**：M29（相等/实例/证明 ergonomics）、M30（包基建）。**状态**：不排期；验证库优先
于 registry（没有外部用户时 registry 没有意义）。

## 待决策（在所属阶段拍板，不在本文件预设）

- **宇宙**：累积性 + lift（保持分层）vs 单一 `Type : Type`（简单但不一致）——M28。
- **擦除/QTT**：整程序使用分析 + multiplicity 标注 vs 继续 rig 显式标注——M28。
- **相等**：强制 Eq 字典 vs 类型导向结构比较；若保留兜底，其可比较类型域如何定义——M25 已做安全域限制，M29 定稿。
- **type-as-value**：引入 type codes（类型作为一等值）vs 只保留 `cast` 组合子——M29。
- **无 manifest 时的 base 定位**：已定并落地（M26）**可执行文件相对布局 + `VUNA_BASE` 覆盖**；
  找不到 base 时明确报错，不退回纯内建。定位由 `Pkg.locateBase` 用
  `prim_getenv` / `prim_getcwd` / `prim_execPath` 三个内部原语实现（语义规范见 [primitives.md](reference/primitives.md)）。
- **ad-hoc 单文件语义**：已定并落地（M26）**自动注入 Prelude**（与包内模块一致；显式
  import 仍可用）。
- **IO/effects 边界**：已定并落地（M27）**保留 `Base.IO` thunk + `prim_*` primitive 面**；
  声明式效应接口留 F3（A12）。
- **检查豁免**：已执行（M25）：删除按包名豁免（终止性/覆盖率），不再设计信任声明；若个别定义
  确实不可判定，只能显式逐条标注并跟踪，目标清零。

## 决策变更（仍影响当前/未来的；更早的决策细节见 history）

| 原决策 | 新决策 | 理由 |
| --- | --- | --- |
| HM 与 DT 双路径长期并存 | 终态单 DT；HM 于 M24 删除 | 无发布/无兼容义务；双检查器维护成本不可接受 |
| 顶层签名可省略、靠 HM 推断 | DT 顶层签名必填（一次性工具回填） | 依赖精化需要签名做检查模式与定位 |
| 擦除用 `erased : Bool` 启发式 | 三值 rig + 不透明 Level（M18.6），M28 再统一判据 | 为 QTT/宇宙多态预留；先接线后换判据 |
| `record`/`deriving` 删除 | 保留并补齐（降级为 data/case/字典） | 有夹具覆盖且是记法 ergonomics；不是兼容层 |
| `Show`/`Eq`/`Ord` 内建 | 库为唯一来源 `Base.{Show,Eq,Ord}`（M24.7） | 删双份定义与短名桥接；与 List/Monad 对齐 |
| Bool 去桩 = prelude 不再有 Bool | 只去值桩、保留类型别名；M27 再收双身份 | 旧 `==`/比较签名需要 Bool 名；现成为 debt A07 |
| 非 Int/String 的 `==` 必须有实例 | 无实例时退回泛型结构比较 | 迁移期编译器源码大量裸比较；现成为 debt B04（M25/M29 收口） |
| TCB 三包覆盖率/终止性豁免（静默/告警） | **M25 已删除**：compiler/base/toolchain 源码全部接受 SCT + 显式 fuel 检查，不再有 per-package 信任声明 | 任何信任名单都会变成静默绕过；检查必须对编译器自身与用户代码一致 |
| seed 由 HM codegen 生成 | M24 起由 DT split codegen 生成，无 `.mli` | 终态只有一套 codegen，seed 必须自证 |
| `--dt` 开关、`compile --package`、SigExport | M24 全部删除 | 单路径不需要开关；一次性工具用完即弃 |
| M24.6 二级 `Expr : Phase -> Type` | 改为 split 入口 `checkResolvedModules` 护栏 | M24 后 codegen 只吃 `DtProgram`，phantom index 无落点 |
| M24.6 三级 Core Env 索引化 | 只做作用域护栏 + 夹具，`Core.eval` 不换索引表示 | 依赖索引取值仍写不出，索引化收益不成立 |
| 类型族按运行时定义 | 整体擦除（`... -> Type`），运行时用擦除参数报错 | check 过而 ocamlopt 才炸的存量 bug（M24.6） |
| compiler 25 个扁平模块 | 目录即层 + 门面 + 叶子（40 模块），工具链同法拆分 | 单模块阅读成本 3530 → ≤~800 行；index/seed 模块面稳定 |
| 模块可见性由环境根（roots）决定，单文件是第二套加载语义 | **删除 roots 概念**（M26）：以最近 `vuna.toml` 的包上下文解析；无 manifest 时只有 base（可执行文件相对布局 + `VUNA_BASE` 覆盖）；单文件=包内 ad-hoc 入口且自动注入 Prelude | 环境 roots 既掩盖依赖方向（依赖包可 import 消费包模块），又带来 raw 模式绕过与双语义；包上下文是唯一正确模型，不用“过滤 roots”打补丁 |
| 单文件 codegen 与逐模块 split 两套输出模型（`compile` 产单 `.ml`，split 是可选开关，`seed` 是另一条命令） | **只保留逐模块 split**（M26）：`Vuna_runtime` + 各模块 + `Main` + `build.sh`；删除单文件生成器、`--split` 开关与 `seed` 子命令 | 两套生成器重复 prepare/hook/`build.sh` 装配且行为漂移；单文件产物是十几万字符的单一编译单元，难以优化与回归；只留一种产物让 seed/测试/基准同口径 |
| `compile` 写单文件、`build` 隐式 `.output`、`seed` 单独一套参数解析 | `compile <entry\|pkg-dir> OUTDIR` 只 codegen（OUTDIR 必填、成功静默）；`build [--no-compile] [--out DIR] [PKG-DIR]` 默认 `<PKG-DIR>/.output`，codegen 后跑 `build.sh` → `DIR/bin/<包名>`（M26） | 一个输出模型对应一个显式目录参数；CLI 不再为每个命令各写一套路径/打印/错误逻辑 |
| 无 manifest 时 base 靠环境根列表/调用参数传入 | 落地为 `Pkg.locateBase`：`VUNA_BASE` 覆盖 → 可执行文件相对布局四级探测 → 明确报错；依赖 3 个新原语 `prim_getenv` / `prim_getcwd` / `prim_execPath`（只有 `prim_*` 名、无公开别名；effectful、仅 TCB 三包可用；`/proc/self/exe` 为 Linux 假设）（M26） | 环境根已删除；定位信息必须来自编译器自身运行环境而不是调用参数；原语语义规范归 M27 |
| 原 M25–M28（模块 v3/运行时/并发/生态）为顺序阶段 | 改为 **F1–F4 不排期**；M25 起先做正本清源（本文件） | M24 审计显示旧架构与迁移折中仍是主要风险，先修地基再扩张 |
| 检查豁免（按包名跳过终止性/覆盖率）重设计为可审计信任 | **已删除**（M25）：检查器改进 + 源码修复达标；不维护名单 | 任何“可信名单”都会重新变成静默绕过；宁可让编译器源码接受与用户代码相同的检查 |
| 「完成即删除细节」只记 history | 另立 [debt.md](reference/debt.md) 债务账本，roadmap 按债务排阶段 | 让「哪些妥协还在、由谁在哪个阶段关闭」可审计、不丢账 |
| 诊断消息是纯文本（无稳定标识符） | 加语义错误码前缀 `[CODE]`（`TC_`/`CG_`/`LX_`/`PS_`/`LD_`/`LN_`/`FX_` 域）；**M30 起真源是域枚举**（构造子携带模板、`Nat` 索引锁定 arity），`vuna gen-errors` 遍历枚举表生成 `docs/.generated/errors.md`；删除了 `-- @code` docstring | 诊断可被符号引用/去重/测试；一个码一种语义、只增不删；arity 写错即编译失败；运行输出 `文件:行:列: [CODE] 消息`（lint 为 `[LN_XXX] 规则: 消息`） |

## 研究储备（不排期，不占编号）

- QTT 的完整变体（依赖 multiplicity、资源安全）——M28 先落最小判据，完整理论在此。
- 宇宙多态 / 累积性的更强形式（超出 M28 决策）——研究项。
- CoC 补完：非直谓 Prop、完整依赖消除的进阶形态（M28 只做 kind 形状的地基）。
- 线性/量化类型（资源安全）、证明自动化/tactics/reflection、`rewrite`/`with` 等
  证明 ergonomics 的进阶形态。
- 效应行多态（若 F3 未采用）、自研 GC/多后端（若 F2 决定不做）。

## 相关阅读

- 债务与缺陷逐条登记：[reference/debt.md](reference/debt.md)
- 已完成阶段细节：[history.md](history.md)
- 子系统地图：[architecture.md](architecture.md)；DT 语义与设计边界：[dt.md](reference/dt.md)、
  [dt-core.md](dt-core.md)；自举链：[bootstrap.md](reference/bootstrap.md)；测试与 CI：
| Bool 双身份（prelude 类型桩 + `Base.Bool` data）与短名内置身份 | **M27：内置实体按完整声明符号判定**——Bool/List/IO 都是 base 普通 data（canonical `Base.Bool.Bool` / `Base.List.List` / `Base.IO.IO`），删 `lastName`/`isGlobalCtor`/Bool 桩；用户同名 data 是普通 data | 短名判定在用户同名 data 上必然误判；完整符号是 Loader 已 mangle 的唯一身份，无需第二套特判 |
| 公开效果名与 `prim_*` 双份 | **M27：只保留 `prim_*` primitive 面**；用户经 `Base.IO`（IO 动作）或在自己 manifest 声明能力后直接调 `prim_*` | 双份名字无语义差异，只有维护成本；`prim_*` 才是 runtime 的 primitive 接口 |
| 效果 allowlist 按包名字符串（`vuna`/`vuna-compiler`/`vuna-base`） | **M27：manifest `[capabilities] effects = [...]` 显式能力**，按包声明、未知能力名报错；无 manifest 无能力 | 包名是普通字符串、可伪造；能力是显式、可审计的声明（权限策略），不再随包名路由漂移 |
| Int/String 语义未定 | **M27：Int = 固定宽度 63 位（补码回绕）；String = UTF-8 字节串**；除零与 `strUnpack`/`strPack` 等 interp 不归约项**显式分类**并写规范 | 宿主 OCaml 表示与大整数/码点不可兼得；先钉死可实现语义，Unicode 语义留 F2/F4 |
| `Show String` 两套转义（runtime vs `Base.Show`） | **M27：`strShow` 是唯一实现**（runtime `dt_show_string`）；`Base.Show` String 实例与 `main : String` 展示共用 | 同一语义只能有一个实现；两套必然漂移 |
| 生成 runtime 去掉 Unix 依赖（多后端目标） | **M27 决策：保留单个 OCaml runtime 的无条件 Unix 依赖**（`Unix.stat`/`gettimeofday`/`readlink`，`build.sh` 链接 `unix.cmxa`），作为 runtime 契约写入 `primitives.md`；无 Unix 后端归 F2 | 当前唯一后端就是 OCaml + Unix（base 定位还需要 `/proc/self/exe`）；抽象后端会引入 IR 与第二套语义，属 F2 的范围，不应在 M27 半途引入 |
  [testing.md](reference/testing.md)；已知限制：[limits.md](reference/limits.md)