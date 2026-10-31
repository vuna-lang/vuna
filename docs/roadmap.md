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
- M14：索引族与依赖模式匹配——Core 增加 `TCon` / `TCase`（值域 `VCon` / `VCase`），`data F : <kind> where` 的索引归纳族（构造子写完整显式 telescope，宇宙域 binder 擦除、索引保留运行时表示），`case` 做索引 unification 与分支可达性/覆盖率判定（不可满足分支可合法省略、写错则拒绝），解除递归定义限制（SCC 分组，终止靠 delta 展开 fuel）；核心求值器与擦除型 codegen 同步扩展（运行时族 → OCaml 变体、构造子名加族前缀、`TCase` → `match` + 不可能分支 `failwith`）；新增 `test/corpus/dt/09_nat` / `10_vec` / `11_fin` / `12_eq` 正例与 `dt_err` 反例；隐式索引推断留 M15，仍是单文件 `--dt` opt-in，split/包集成留 M17。
- M15：隐式参数、接口与洞——元变量上下文（作用域逃逸检查）、隐式索引推断、trait/instance 字典编码 + 实例搜索、洞目标显示（`unsolved hole <loc> with goal <ty>`）。
- M16：终止性与覆盖性——surface AST 上的结构化递归终止性检查（`DT: cannot prove termination of <f>`），覆盖性边界固定；索引擦除分析落地为诊断（探测确认索引不能无条件擦，需整程序使用分析）。
- M17：DT 工具链——`vuna goal` 洞目标/上下文、`vuna lsp`（JSON-RPC over stdio：诊断、Full 同步、洞 hover，27 项冒烟断言）、`vuna doc` 支持接口与隐式签名；`Lsp`/`Json` 不进入 TCB。
- M18：自举迁移决策——seed rotation（stage1 == stage2）；用 DT 表达 de Bruijn 上下文良构（`Ctx a (Succ n)` 静态排除越界）；决策：编译器本体暂不全量迁移，前置条件（DT 多文件、完整擦除）已记录。

## 当前硬约束

1. 当前编译器必须能通过自身类型检查；
2. seed rotation 后 stage 1 与 stage 2 必须字节一致；
3. `test/run-tests.sh`、`nix build`、`nix flake check` 必须保持通过；
4. **seed 只含 compiler 包的入口闭包**；工具链（fmt/lint/repl/doc/test、未来的 LSP/package manager）不进入 TCB；
5. 已不再保留 dynamic codegen；HM 回归路径是 **interp + typed + split**，DT 主路径是 **core evaluator + 擦除 codegen**（M13 起是 `--dt` 单文件 opt-in；M18 后仍单文件，DT 多文件见「下一步 / 待办」）；
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
### DT 多文件与包集成（M20 前置）

**目标**：让 `--dt` 走出单文件——支持 `import` / `--root` / 包模式，并被 `build` / `split` /
`seed` 接受。这是 M18 决策里「编译器本体迁 DT」的第一前置条件。

**范围**：DT 侧模块级名字解析与可见性规则（平行于 HM 的 `Loader`）、跨模块精化顺序、
`vuna.toml` 包模式下的 DT 入口、`build --dt` 与 `split` 的产物形状。

**验收**：多文件 DT 程序可 `check` / `compile` / `interp --dt`；旧 HM 三路径零回归；
seed 闭包不变（DT 多文件仍是 `--dt` opt-in，不进 seed）。

**前置**：M20 模块系统 v3 的签名匹配。**风险**：平行 Loader 的语义漂移；与 HM 模块系统分叉。

### 完整擦除分析（M18 前置）

**目标**：把 M16 的「索引擦除诊断」推进到真正改写运行时表示——索引/证明不出现在生成代码里。

**范围**：整程序使用分析（`indexReads` / `finalMask`，见
[m16-design.md](reference/m16-design.md) §3.3）；`DtData`/`DtCtor` 的 mask 应用；
codegen 三处对齐（`ctorFieldTys`、`genConApp`、`alignAltBinders`）；反例保护（`vlen` 类必须保留字段）。

**验收**：`10_vec` 的 `C_Vec_Cons` 字段数 3 → 2；全部 DT 夹具 `interp --dt` 与
`compile --dt`+`ocamlopt` 输出逐字节一致；`vlen` 不被误擦。

**前置**：M16。**风险**：误擦导致运行时报错；保守判定可能收益有限。


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

**M12.7 → M13 → M12.8 → M14 → M15 → M16 → M17 → M18（全部已完成）→ M19 / M20 → M21 → M22 / M23**

- **M12.7–M14 已完成**：先删除无法支持 DT 的第二条 codegen（缩小 TCB、简化测试/CLI），
  再落地 Core TT + 精化器 + `--dt` 单文件路径，随后完成标准库/编译器命名空间收敛、
  `Prelude` 自动导入与 `.output` 包级构建，最后加入索引归纳族与依赖模式匹配。
- **M15–M18 已完成**：隐式参数/接口/洞 → 终止性与覆盖性 → DT 工具链（`vuna goal`、
  LSP、doc）→ 自举迁移决策（seed rotation + 不变量验证，本体暂不迁移）。
- **M19 / M20 可并行**；**M21 在 M18 后决策**；**M22 贯穿**；**M23 在 M19/M21 后**。
- DT 主线后续两项前置工作见「下一步 / 待办」：**DT 多文件与包集成**、
  **完整擦除分析**——它们是「编译器本体迁 DT」的前置条件。

替代路径：

- 只做 GADT/类型级编程：M13–M14 可裁剪，M15–M18 后移。
- 优先大程序模块化：M20 提前并行。
- 优先实用效应：M19 并行，不阻塞 DT 主线。
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
