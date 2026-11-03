# Vuna 路线图

本文记录 vuna 的当前基线与**可排期阶段**（M25 起）以及**不排期的未来轨道**（F1–F4）。
逐条技术债务、临时决定与可复现缺陷登记在 [reference/debt.md](reference/debt.md)；
已完成阶段的历史细节在 [history.md](history.md)。

## 维护规则

- **M 编号 = 可排期阶段**：按依赖顺序推进；完成即按本规则收敛。
- **F 编号 = future，不排期、不占 M 编号**：只表示方向与前置条件，编号不构成排期承诺。
- **已完成阶段只保留一句话摘要**（「已完成」列表）；目标/范围/验收/设计细节删除，写进
  [history.md](history.md)。
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
- M24 后维护（本波）：全仓妥协/临时决定/缺陷审计 → [debt.md](reference/debt.md)；路线图
  从「功能扩张」重排为「正本清源」阶段（M25–M30）+ 未来轨道（F1–F4）。

## 终态（目标）

**一套表面语言、一个类型检查器、一条 codegen、一个 seed，且检查器本身可信。**

- **类型理论**：依赖类型 + 归纳族；QTT 可替换的表示层（rig/Level 已预留），宇宙与擦除
  判据在 M28 定型。
- **路径**：`Parser → Loader → DT 精化 → 擦除 codegen → OCaml`；单文件只是「一个 unit 的
  split」，不再有第二套装配/加载语义。
- **可信性**：不存在「跳过检查但不告知」的通道；任何放行都是显式、可审计、有诊断的。
- **语言面**：顶层签名必填；不用的特性直接删；不保留兼容层。`record`/`deriving`/多 clause/
  `do`/trait 保留，但降到普通 data/case/字典语义之上，不靠短名特判。
- **模块与包**：模块系统 v3、运行时/后端、效应与并发、生态属于未来轨道（F1–F4），不阻塞
  当前根修。

## 当前硬约束

1. 编译器自检通过（`vuna check .`）；
2. seed rotation 后 stage1 == stage2，并且 **seed 与源码同步**（M25 起有漂移检查）；
3. `test/run-tests.sh`、`nix build`、`nix flake check` 必须通过；
4. seed 只含 compiler 包入口闭包；工具链（fmt/lint/repl/doc/test、LSP、package manager）
   不进 TCB；TCB 边界检查必须覆盖嵌套模块与完整闭包（M25）；
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

| 阶段 | 主题 | 依赖 | 关闭的债务（示例） |
| --- | --- | --- | --- |
| M25 | 健全性与验证基建 | — | B01–B04、C01–C07、C15、C20–C24、E01–E13、E16 |
| M26 | 单一路径与装配收敛 | M25 | A01–A06、A13、A15–A16、C08、C21、E14–E15 |
| M27 | 内置、原语与效应边界 | M26 | A07–A11、C16–C19、D16 |
| M28 | 类型系统地基 | M25、M27 | B05–B10、B15、D05–D10 |
| M29 | 相等、实例与证明 ergonomics | M25、M28 | A14、B11–B14、C05、D11–D12 |
| M30 | 工具链与包 | M25（其余可并行） | C11–C13、C25、D13–D15、D17–D18、E08 |
| F1–F4 | 模块 v3 / 运行时 / 效应并发 / 生态 | 不排期 | D01–D04 |

## 可排期阶段（M25 起）

### M25：健全性与验证基建

**目标**：先让「检查通过」重新等于「程序可信」。把静默跳过、哨兵、两套语义、内部文案
和不可信的验证基建一次性收口；后续所有阶段都踩着这条基线。

**范围**（debt）：
- **删除检查豁免，不维护名单**（B01/B17/C02/C03）：终止性/覆盖率不再按包名
  allowlist 放行；编译器源码靠检查器改进（SCC 互递归 + size-change）与源码修复（显式兜底、
  无哨兵）达标，目标零特例。效果内建是**权限策略**而非检查豁免（B16）：M27 用 manifest
  声明的 capability 替换包名，raw `--root` 的绕过先在 M25 关闭。
- 诊断模型：Error/Warning 分级真正输出（B17/D4）；豁免删除后 warning 只用于真正的非致命
  诊断，不再用于掩盖「跳过检查」。
- bottom/absurd 表示替代 `TInt 0` 哨兵（B02/C01）；缺失分支在 codegen 生成类型正确的
  `failwith` 或由类型检查拒绝。
- 终止性：互递归按 SCC + size-change（或显式 well-founded 见证）；fuel 截断给专门诊断
  （B03/C03）。
- 语义一致性：`applyValue` 的 `VCase` 洞（C06）；作用域护栏覆盖全部定义（C07）；
  `==` 泛型兜底先做**安全域限制**（可结构比较的类型才允许，函数/抽象/IO 报可操作错误），
  两套求值器同一语义（C04/B04；彻底删除兜底在 M29）。
- 诊断文本：去掉用户可见的里程碑编号与 `DT: internal:`（C20）。
- 验证基建：CI 入口（E01/C24）、check 清单/数量自动生成（E02）、seed 漂移检查（C15/E05）、
  result 新鲜度（E03）、seed 闭包 allowlist + 数量断言（E04/C09 已修一半）、
  index-check/metrics/context 脚本修正（C10/C22/E06/E07）、runner 标记语义与负向断言
  （C23/E09–E11）、`.nocompile` 改为「已知产物不可编译」断言（C05 标记部分）。
- 文档过期项：fmt 崩溃描述、`--with-comments`、checks 数量（E12，随本波文档同步）。

**验收**：上述债务关闭；新增反例夹具覆盖「伪造包名（豁免已删，不再受影响）」「Bool 缺分支」「互递归非结构」
「函数相等」「静默丢实参」；CI 一条命令可复现；`seed/` 漂移会被 CI 拒绝。

**决策点**：豁免删除后，确实不可判定的定义只有「改进检查器 vs 显式逐条标注」两条路（目标
零特例）；`==` 安全域限制的边界；effect capability 形态留给 M27。

### M26：单一路径与装配收敛

**目标**：单文件与 split 收敛成同一装配计划；所有「归属/名字/初始化」靠结构数据而不是
字符串启发式；清掉 HM 时代死 API/死代码与第二套加载语义。

**范围**（debt）：
- 统一装配：单文件 = 单 unit 的 split；删除重复 prepare/hook/`build.sh` 生成器（A01）；
  删除空 `Vuna_builtins` unit（A02）；`seed` 与 `build --split` 关系收敛（A15）。
- resolved identity：Elab 在 `DtProgram` 上给出 owner/实例身份；split 只消费结构（A13）；`checkResolvedModules` 覆盖 entryDecls（C08）；入口 trait/实例可 seed。
- **跨包 import 方向**：Loader 按「导入方包的依赖闭包」过滤 roots（A16/E16）；当前
  `rootAllows` + selfRoot `Nothing` 允许依赖包 import 消费包模块（实测 `vuna check b` 通过），
  root 上下文还会掩盖 compiler→tools 的误 import；改完加「隔离入口」回归（`check compiler`、
  `check base`）而不是只靠 seed 事后失败。
- 死代码清理：Loader 门面死 API（A03）、Driver/Split 的 HM `lib+app` 生成器与死 writer（A04）。
- 初始化语义：零参定义 thunk/求值一次明确化，去掉调用点补 `()` 的约定（A05）。
- 加载语义：raw `--root` 与单文件模式的去留决策（A06）；夹具迁移路径明确。
- 重构不变性：加 API/导出面快照与关键 split 产物断言（C21/E14/E15）。

**验收**：seed 文件集确定（删除 builtins 后 54 `.ml`）；任意包（含入口 data/trait）可
`build --split`/`seed`；无字符串归属表；死导出清零；旧 seed 可编译新源码。

**前置**：M25。**决策点**：raw/单文件模式保留为「匿名包」还是删除；thunk 语义。

### M27：内置、原语与效应边界

**目标**：内置实体不再靠「短名/lastName」；`Bool`/`List`/`IO` 回到普通声明或明确的
primitive 接口；效应只能经显式能力；原语语义写成规范。

**范围**（debt）：
- 内置身份：`Bool` 类型桩与 `Base.Bool` 双身份（A07）、`lastName` 短名特判（A08）、全局
  构造子名（A09）→ 按编译期 symbol/declaration 判定；用户 `data Bool`/`data IO`/`data List`
  行为正确（C17/C18）。
- 内建声明单一真源：`Elab.Prelude` 硬编码 globals、4 份内建表、幽灵名（A10/A11）→ 一个
  intrinsic/primitive 声明面；删公开名与 `prim_*` 双份；runtime 只保留 primitive。
- 效应边界：effect allowlist → capability/显式声明（B16）；`Base.IO` 的 `prim_*` 接口与
  runtime Unix 依赖决策（A11/A12）；raw root 绕过关闭（与 M25 协同）。
- 原语语义规范：Int 溢出/宽度、String 编码（字节 vs 码点）、除零、`Show String` 转义
  一致性（C16/C19/D16）；interp 对 `str*`/除零行为与 codegen 对齐或明确分类。
- 单文件 prelude shim：`Elab.Prelude` 硬编码容器/IO 签名与 List 族重绑（A10）删除或改为
  加载真实 base（与 M26 模式决策联动）。

**验收**：`grep` 不到短名内置特判；intrinsic 表只有一份；用户同名 data 不冲突；效果尝试在
任何包名/路由下都得到一致错误；原语语义有规范与正/反例。

**前置**：M26。**决策点**：Int/String 语义；IO/effects 接口是否在 M27 就改为声明式。

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
通过终止性/覆盖检查（为移除 trust 铺路）；命名空间行为一致。

**前置**：M25、M27。**决策点**：宇宙方案；QTT vs 显式 multiplicity。

### M29：相等、实例与证明 ergonomics

**目标**：让 `Eq`/字典/派生/证明写法成为类型系统的自然结果，而不是「泛型兜底 + 手写
显式参数」的拼凑。

**范围**（debt）：
- 字典 schema：参数化/约束实例（`instance Eq a => Eq (F a)`）、参数化 `deriving (Eq/Show/
  Ord)`、字典身份与 owner（B11/A13 收尾）；`monad/04` 的字典 binder bug（C05）。
- 删除泛型 `==` 兜底与 `bi_eq_generic`/`valueEqDeep` 双实现（B04/C04）；若保留结构比较，
  必须类型导向且与 interp 同语义（M25 的安全域限制在此收口）。
- type-as-value / type codes 决策（B14/D09）；Type 级等式与 `cast` 的最终形态。
- 证明 ergonomics：构造子部分应用 conv（`cong Succ`）、隐式等式搜索/auto、隐式值参数
  `{x:a}` 与隐式模式、absurd/空族、Σ 与依赖索引取值（Ctx/Env）（B13/D08/D12）。
- trait 能力与 coherence：多参数/默认方法/父类/关联类型、命名实例进搜索或删除该特性
  （B11/B12/D11）。
- 记录/投影 span 与诊断（A14）。

**验收**：`mem (Box Int)` 等参数化实例可用；`deriving` 覆盖参数化 Show/Ord；函数相等在
check 期被拒；`sym/cong/subst` 无需手写全显式参数；依赖索引 lookup 可表达；`monad/04`
去掉 `.nointerp/.nocompile`。

**前置**：M25、M28。**决策点**：type codes vs 保留 `cast` 组合子；命名实例去留。

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

**前置**：M25（其余可并行）。

## 未来轨道（F = future，不排期、不占 M 编号）

### F1：模块系统 v3

签名/接口、functor、嵌套与局部模块、选择性 import；与包 `[export]`、模块身份、
split 单元整合；是否重新引入 `.mli` 在此决策。

**前置**：M25–M30 稳定（尤其 M26 装配与 M28 命名空间）。**状态**：不排期。

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
- **相等**：强制 Eq 字典 vs 类型导向结构比较；若保留兜底，其可比较类型域如何定义——M25
  先止血，M29 定稿。
- **type-as-value**：引入 type codes（类型作为一等值）vs 只保留 `cast` 组合子——M29。
- **单文件/raw 模式**：删除（夹具全部包化）vs 作为「匿名包」加载真实 base——M26。
- **Int/String 语义**：固定宽度 + UTF-8 字节串 vs 大整数/Unicode 码点——M27。
- **IO/effects 边界**：`Base.IO` thunk 留到 F3，还是 M27 就改为声明式 intrinsic 接口。
- **检查豁免**：M25 直接删除按包名豁免（终止性/覆盖率），不再设计信任声明；若个别定义确实
  不可判定，只能显式逐条标注并跟踪，目标清零。

## 决策变更（仍影响当前/未来的；更早的决策细节见 history 与 m18-migration.md）

| 原决策 | 新决策 | 理由 |
| --- | --- | --- |
| HM 与 DT 双路径长期并存 | 终态单 DT；HM 于 M24 删除 | 无发布/无兼容义务；双检查器维护成本不可接受 |
| 顶层签名可省略、靠 HM 推断 | DT 顶层签名必填（一次性工具回填） | 依赖精化需要签名做检查模式与定位 |
| 擦除用 `erased : Bool` 启发式 | 三值 rig + 不透明 Level（M18.6），M28 再统一判据 | 为 QTT/宇宙多态预留；先接线后换判据 |
| `record`/`deriving` 删除 | 保留并补齐（降级为 data/case/字典） | 有夹具覆盖且是记法 ergonomics；不是兼容层 |
| `Show`/`Eq`/`Ord` 内建 | 库为唯一来源 `Base.{Show,Eq,Ord}`（M24.7） | 删双份定义与短名桥接；与 List/Monad 对齐 |
| Bool 去桩 = prelude 不再有 Bool | 只去值桩、保留类型别名；M27 再收双身份 | 旧 `==`/比较签名需要 Bool 名；现成为 debt A07 |
| 非 Int/String 的 `==` 必须有实例 | 无实例时退回泛型结构比较 | 迁移期编译器源码大量裸比较；现成为 debt B04（M25/M29 收口） |
| TCB 三包覆盖率/终止性只告警 | 实现是静默跳过（无 warning 通道） | 迁移期应急；debt B01/B17，M25 改为显式可审计信任 |
| seed 由 HM codegen 生成 | M24 起由 DT split codegen 生成，无 `.mli` | 终态只有一套 codegen，seed 必须自证 |
| `--dt` 开关、`compile --package`、SigExport | M24 全部删除 | 单路径不需要开关；一次性工具用完即弃 |
| M24.6 二级 `Expr : Phase -> Type` | 改为 split 入口 `checkResolvedModules` 护栏 | M24 后 codegen 只吃 `DtProgram`，phantom index 无落点 |
| M24.6 三级 Core Env 索引化 | 只做作用域护栏 + 夹具，`Core.eval` 不换索引表示 | 依赖索引取值仍写不出，索引化收益不成立 |
| 类型族按运行时定义 | 整体擦除（`... -> Type`），运行时用擦除参数报错 | check 过而 ocamlopt 才炸的存量 bug（M24.6） |
| compiler 25 个扁平模块 | 目录即层 + 门面 + 叶子（40 模块），工具链同法拆分 | 单模块阅读成本 3530 → ≤~800 行；index/seed 模块面稳定 |
| 原 M25–M28（模块 v3/运行时/并发/生态）为顺序阶段 | 改为 **F1–F4 不排期**；M25 起先做正本清源（本文件） | M24 审计显示旧架构与迁移折中仍是主要风险，先修地基再扩张 |
| 检查豁免（按包名跳过终止性/覆盖率）重设计为可审计信任 | **排期删除，不维护名单**（M25）：检查器改进 + 源码修复达标；个别不可判定定义显式逐条标注，目标清零 | 任何“可信名单”都会重新变成静默绕过；宁可让编译器源码接受与用户代码相同的检查 |
| 「完成即删除细节」只记 history | 另立 [debt.md](reference/debt.md) 债务账本，roadmap 按债务排阶段 | 让「哪些妥协还在、由谁在哪个阶段关闭」可审计、不丢账 |

## 研究储备（不排期，不占编号）

- QTT 的完整变体（依赖 multiplicity、资源安全）——M28 先落最小判据，完整理论在此。
- 宇宙多态 / 累积性的更强形式（超出 M28 决策）——研究项。
- CoC 补完：非直谓 Prop、完整依赖消除的进阶形态（M28 只做 kind 形状的地基）。
- 线性/量化类型（资源安全）、证明自动化/tactics/reflection、`rewrite`/`with` 等
  证明 ergonomics 的进阶形态。
- 效应行多态（若 F3 未采用）、自研 GC/多后端（若 F2 决定不做）。

## 相关阅读

- 债务与缺陷逐条登记：[reference/debt.md](reference/debt.md)
- 已完成阶段细节：[history.md](history.md)；旧决策原文：[m18-migration.md](reference/m18-migration.md)
- 子系统地图：[architecture.md](architecture.md)；DT 语义与设计边界：[dt.md](reference/dt.md)、
  [dt-core.md](dt-core.md)；自举链：[bootstrap.md](reference/bootstrap.md)；测试与 CI：
  [testing.md](reference/testing.md)；已知限制：[limits.md](reference/limits.md)