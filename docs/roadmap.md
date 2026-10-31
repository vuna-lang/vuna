# Vuna 路线图

本文记录 vuna 的当前基线与后续规划。

## 维护规则

- **已完成阶段整段删除**：阶段完成后，删除该阶段的目标、范围、验收、设计要点、实现状态等详细段落，正文中不再保留。
- **已完成阶段一句话**：只在「已完成」列表中保留一句话摘要（阶段编号 + 核心交付物）；需要历史细节时查 git 历史。
- **未完成阶段保留细节**：保留目标、范围、验收，可继续补充设计要点与前置条件。
- **新增阶段先写入「下一步 / 待办」**，完成后按上述规则收敛。
- **研究储备与并行轨道不占 M 编号**；研究储备进入排期时再分配编号。
- **插入阶段用 x.5 编号**（如 M12.7），主序列保持整数编号。

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
- M14：索引族与依赖模式匹配——Core 增加 `TCon` / `TCase`（值域 `VCon` / `VCase`），`data F : <kind> where` 的索引归纳族（构造子带显式 `{...}` telescope、族参数隐式、宇宙域 binder 擦除），`case` 做索引 unification 与分支可达性/覆盖率判定（不可满足分支可合法省略、写错则拒绝），解除递归定义限制（SCC 分组，终止靠 delta 展开 fuel）；核心求值器与擦除型 codegen 同步扩展（运行时族 → OCaml 变体、构造子名加族前缀、`TCase` → `match` + 不可能分支 `failwith`）；新增 `test/corpus/dt/09_nat` / `10_vec` / `11_fin` / `12_eq` 正例与 `dt_err` 反例；仍是单文件 `--dt` opt-in，split/包集成留 M17。

## 当前硬约束

1. 当前编译器必须能通过自身类型检查；
2. seed rotation 后 stage 1 与 stage 2 必须字节一致；
3. `test/run-tests.sh`、`nix build`、`nix flake check` 必须保持通过；
4. **seed 只含 compiler 包的入口闭包**；工具链（fmt/lint/repl/doc/test、未来的 LSP/package manager）不进入 TCB；
5. 已不再保留 dynamic codegen；HM 回归路径是 **interp + typed + split**，DT 主路径是 **core evaluator + 擦除 codegen**（M13 起是 `--dt` 单文件 opt-in，M17 前 split 可回退）；
6. 新增语法先以**旧种子可编译**的形式落地，rotation 之后才在编译器源码中使用；每阶段保持旧 HM 回归。

## 路线目标：依赖类型

- **终态**：Idris2 风格的完整依赖类型——宇宙、Pi、索引归纳族、依赖模式匹配、隐式参数、接口、洞、终止性/覆盖性、擦除，并能用 vuna 自己写编译器。
- **迁移方式**：渐进/双路径。新增核心类型论（Core TT）与精化器（Elaborator），与现有 HM 检查器并存；HM 代码继续走原路径，DT 代码走新路径，逐步统一，M18 再把编译器本体迁到 DT。**不做一次性全量重写**——那会直接破坏自举、seed 和现有测试。
- **兼容性**：现有 trait / 记录 / 模块 / 包 / IO / 工具链继续可用；旧 HM 测试与既有路径（interp + typed + split）不得回归。
- **非目标（当前）**：证明助手级 tactic/自动化；线性类型；独立 GC 与多后端优先于 DT 核心；大型标准库扩张优先于类型核心。
- **成本边界**：每阶段过 `nix flake check`（含 `seed-selfhost`、`vuna-metrics`）；HM 编译时间不回归；DT 精化时间有基准记录。

## 阶段共同门槛

- `nix flake check`（vuna-tests / vuna-package / vuna-metrics / vuna-typecheck / vuna-lint / seed-selfhost / fixed-point）通过。
- 旧 HM 代码零回归：interp + typed + split 三路径；新增 DT 语法的 interp 覆盖按阶段能力补齐，例外在文档中显式记录。
- DT 代码：核心求值器与 typed codegen 语义一致；`build --split` 在 M17 前允许单文件回退。
- 当前种子能编译当前源码；rotation 后 stage1 == stage2；seed 仍只含 compiler 包闭包。
- 编译器自检通过；新增阶段更新 README 限制/历史与 roadmap 完成摘要；M18 起编译器逐步 dogfooding。

## 下一步 / 待办

### M15：隐式参数、接口与洞

**目标**：让 DT 可用：隐式参数、自动插入/求解、接口（替代/兼容 trait）、洞与目标显示。

**范围**：

- Surface/Core：`{x : A}` 隐式 binder、隐式应用/插入、接口声明与实例（可用 record + implicit 编码）、洞 `_` 与目标类型显示。
- 解析：instance search、歧义/相干性、局部 given、跨模块可见；与 M13 的 metavariable/unification 整合。
- 旧 trait 兼容：现有 `trait`/`instance` 语法尽量 desugar 到新接口；旧代码不要求改写。
- Codegen/split：隐式参数/字典擦除或穿参；`.mli` 能导出接口/隐式签名。
- 测试：`Show`/`Eq` 接口、Vec 的隐式长度、实例搜索、洞求解、旧 trait corpus 回归。

**验收**：接口/隐式/洞例子通过；旧 trait 代码零改动；歧义/缺失实例有明确诊断；编译器自检/fixed point/flake check；HM 性能不回归。

**前置**：M13/M14。**风险**：解析/相干性；metavariable 交互；错误信息；与旧 trait 的语义差异。**设计闸门**：先定接口/实例/隐式解析规则与旧 trait 的兼容边界。

### M16：终止性、覆盖性与擦除

**目标**：健全性与性能：终止性/覆盖性检查，证明与索引的擦除，DT 代码生成不携带证明开销。

**范围**：

- 终止性检查（结构化递归/尺寸变化）、totality/partial 标记；类型级求值的终止性保证。
- 覆盖性检查：穷尽性、不可达分支、不可能情况。
- 擦除分析：类型/索引/证明擦除；typed codegen/核心 codegen；运行时表示。
- 性能：DT 与 HM 程序基准；编译器自举性能预算。
- 测试：total/non-total、覆盖性正反例、擦除前后语义一致、性能基线。

**验收**：非终止/不覆盖程序被正确拒绝或标记；总函数通过；证明/索引在生成代码中被擦除（有检查）；DT 语义不变；编译器自检/fixed point/flake check；性能不超预算。

**前置**：M14/M15。**风险**：终止性检查难度；擦除正确性；性能；与 split 的交互。**设计闸门**：先定 termination 规则、erasure 规则与例外（如 `partial`）。

### M17：DT 工具链与证明工程

**目标**：让 DT 可日常使用：LSP、洞/目标、case splitting、诊断、文档与教程；可与 M16 重叠。

**范围**：

- LSP server（放根包，永不进 seed）：诊断、补全、跳转、悬停、洞目标、case splitting、格式化。
- 洞工作流：`vuna` 命令展示目标/上下文；编辑器冒烟。
- 证明工程：`rewrite`/`with` 等 ergonomics 按需；tactics/自动化只做研究储备。
- 文档：DT 教程、错误索引、迁移说明；`vuna doc` 支持接口/隐式签名。

**验收**：VS Code/Neovim 冒烟；洞/case splitting/诊断可用；文档站构建；seed 闭包不变；`nix flake check` 扩展。

**前置**：M15；可与 M16 并行。**风险**：编辑器协议/兼容；性能；语法变更导致返工。

### M18：自举迁移（决策点）

**目标**：编译器本体使用 DT 子集；seed rotation 后 fixed point；用语言写自己，验证 DT 的实用性。

**范围**：

- 在 M17 结束前轮换 seed，使 seed 包含 DT 精化器；再用 DT 语法迁移编译器模块（从 Core/Elab 周边开始，逐步扩大）。
- 使用索引类型/隐式参数/接口/证明表达关键不变量（如 de Bruijn 索引、上下文良构）；可选证明关键引理（substitution/weakening 等），不承诺完整验证。
- seed/多文件 fixed point、性能预算、旧测试回归。

**验收**：编译器能从 seed 构建；stage1 == stage2；性能可接受；DT 编译器源码通过自身检查；旧 HM 功能/测试不回归；文档记录迁移范围与未验证部分。

**前置**：M16/M17；seed rotation 完成。**风险**：最高；可能暴露 DT 性能/终止性/擦除问题。**决策闸门**：若 DT 仍不可用/性能不可接受，保留 HM 编译器并只把 DT 作为用户语言，不强行全量迁移。

## 后续大阶段（M19–M23）

### M19：效应与 IO 的 DT 化

**目标**：在 DT 上表达 IO/State/Reader/Error 等效果；保留 `main : IO a` 与现有 `Base.IO`（当时叫 `Vuna.IO`）兼容；代数效应作为可选方向。

**范围**：接口/monad 编码；DT 程序 IO 例子；`main` 语义；测试；性能。

**验收**：DT 程序通过核心求值器 + typed codegen；`main : IO a` 与包级 effectful 内建限制保持；旧 HM IO 代码兼容。

**前置**：M15/M16；可与 M16 后段并行。**优先级**：高（实用程序需要），不阻塞 DT 主线。

### M20：模块系统 v3

**目标**：signature / functor / 嵌套模块 / module type 别名 / opaque ascription；与包 `[export]`、DT 记录/接口整合。

**范围**：签名匹配、functor Map/Set、跨包可见性、split/`.mli`、旧模块代码兼容。

**验收**：签名匹配正/反例、抽象泄露反例、functor 示例；旧模块代码零改动；seed 闭包不变。

**前置**：M13/M15；可并行。**优先级**：中。

### M21：运行时与多后端

**目标**：擦除感知的运行时；决定继续绑定 OCaml runtime 还是自研 GC/后端无关 IR；Wasm/JS 后端。

**范围**：决策文档 + 原型；GC/运行时正确性/性能；新后端语义一致；seed 边界不变。

**验收**：决策结论可执行；若实施，后端语义一致、性能基线、旧测试不回归。

**前置**：M16/M18。**优先级**：条件性；DT 擦除后 OCaml 后端可能长期够用。

### M22：标准库与包生态

**目标**：DT 验证库（Vec/Fin/Map/Set/排序等）、包 registry/版本解析/lockfile/文档托管。

**范围**：验证库正例/性质；本地 registry 端到端；锁文件可复现；CI。

**验收**：验证库可构建；registry 端到端；锁文件可复现；文档可发布。

**前置**：M14/M15/M17。**优先级**：高（采用度），贯穿推进；registry 可后置。

### M23：并发与异步

**目标**：基于效应/接口的 async/await 或结构化并发；调度器；取消/超时。

**范围**：并发原语/调度；与 IO/effect 整合；测试。

**验收**：并发示例、取消/超时/异常、竞态测试；性能基线。

**前置**：M19/M21。**优先级**：条件性；可先库级后语言级。

## 推荐顺序与并行策略

主序列：

**M12.7（已完成）→ M13（已完成）→ M12.8（已完成）→ M14（已完成）→ M15 → M16 → M17 → M18**

- **M12.7 / M13 / M12.8 / M14 已完成**：先删除无法支持 DT 的第二条 codegen（缩小
  TCB、简化测试/CLI），再落地 Core TT + 精化器 + `--dt` 单文件路径，随后完成标准库/
  编译器命名空间收敛、`Prelude` 自动导入与 `.output` 包级构建，最后加入索引归纳族与
  依赖模式匹配、解除递归定义限制；DT 主线进入 M15（隐式参数、接口与洞）。
- **M13 → M14 是核心**，难以并行（已完成）；M15 的可用性工作可在 M14 尾部启动。
- **M16 收口健全性/性能**；**M17 可与 M16 重叠**；**M18 是最高风险决策点**。
- **M19 / M20 可在 M15 后并行**；**M21 在 M16/M18 后决策**；**M22 贯穿**；**M23 在 M19/M21 后**。

替代路径：

- 只做 GADT/类型级编程：M13–M14 可裁剪，M15–M18 后移。
- 优先大程序模块化：M20 提前到 M14/M15 之后并行。
- 优先实用效应：M19 在 M15 后并行，不阻塞 DT 主线。

## 旧 M13 候选方向归属

| 原方向 | 新归属 |
| --- | --- |
| 依赖类型 | **M13–M18 主线** |
| 隐式参数 | **M15** |
| 线性/效应系统 | **M19 效应**；线性类型进研究储备 |
| 更完整的模块类型系统 | **M20** |
| 类型类 v2 | 不单列；**M15 的接口/隐式参数**取代，保留旧 trait 兼容层 |
| dynamic codegen | 已由 M12.7 删除（DT 前置清理） |

## 研究储备（不排期）

- 宇宙多态/累积性。
- 线性/量化类型（资源安全）。
- 证明自动化/tactics/reflection。
- `rewrite` / `with` / dependent elimination 的进阶 ergonomics（若 M15/M17 未覆盖）。
- 效应行多态/更完整的效应系统（若 M19 只做 monadic 编码）。
- 自研 GC/多后端探索（若 M21 决定不做）。

## 暂缓事项

- 独立 runtime/GC → M21 决策。
- 多后端 → M21（决策后）。
- 大型标准库扩张 → M22/持续轨道。
- 包 registry 与远程依赖 → M22（DT 核心稳定后）。
- 线性类型与依赖类型之外的类型系统研究 → 研究储备。

## 附录：M14 验收明细（已完成，可删除）

按维护规则，已完成阶段最终收敛为一句话摘要（已写入上方「已完成」列表）；这里保留
M14 的验收清单供核对，确认后可整段删除。

### M14：索引族与依赖模式匹配（已完成）

**目标**：支持索引归纳族（Vec/Fin/Eq 等）与依赖模式匹配。

**状态**：已完成（DT 单文件 `--dt` 路径；split/包集成按硬约束延后到 M17）。

**范围**：

- Surface/Core：`data F : <kind> where`（kind 箭头个数 = 族参数 arity）、带显式
  telescope 的构造器、构造子应用；类型级 `Nat` / 构造器归约（靠 delta 展开，非专门
  类型级求值）。
- 依赖模式匹配：`case` 对索引做 unification、不可达分支/不可能情况；基础 coverage
  检查；`with`/`rewrite` 未做（留研究储备）。
- 类型级递归限制：暂用结构化递归/燃料限制（`defaultFuel = 512`），完整 termination
  留 M16。
- Codegen：运行时族 → OCaml 变体（只有宇宙域族参数成为类型参数，索引作为构造子字段
  保留），`TCon` → 构造子应用，`TCase` → `match`；SCC 分组生成 `let rec ... and ...`。
- 测试：Vec length/append/head、Fin 安全索引、Eq 的 sym/trans；不可能情况正反例。

**验收**（逐条）：

- [x] Vec/Fin/Eq 例子通过核心求值器（`interp --dt`）+ typed codegen（`compile --dt`）：
  `test/corpus/dt/09_nat` / `10_vec` / `11_fin` / `12_eq`。
- [x] 不可能情况正确拒绝：源码写出的不可满足分支报
  `DT: this branch is impossible (index constraints are unsatisfiable)`；省略的
  不可满足分支合法（`vhead` 只写 `Cons`）；非穷尽 case 报
  `DT: case is not exhaustive: missing <C>`；反例在 `test/corpus/dt_err/`。
- [x] 旧 HM 零回归：interp + typed + split 三路径语义与产物不变，DT 仍是 `--dt`
  单文件 opt-in。
- [x] 编译器自检 / fixed point / `nix flake check` 通过（M14 合并前 Lead 验证）。
- [x] split 回退显式记录：DT 的 split / 包集成按硬约束延后到 M17，M14 只做单文件
  `--dt`；当前 `--dt` 不接受 `--root` / 包目录，`build` / `seed` 不支持 `--dt`，
  `build --split` 对 DT 无专门回退。

**前置**：M13（已完成）。**风险**：依赖模式匹配/索引 unification；类型级递归；
与现有 ADT/codegen 的整合。**设计闸门**：先定索引族 core 表示、模式匹配 unifier、
coverage 规则（已完成，落地记录见 [dt-core.md](dt-core.md) §11–§23）。
