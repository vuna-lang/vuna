# Vuna 路线图

本文记录**当前基线**、**终态方向**与**未排期轨道**。已完成阶段、已落地决策与历史细节不在
此维护（在 git 历史）；仍未完成的能力 / 缺陷登记在 [debt.md](reference/debt.md)。

## 项目前提

vuna 尚未发布任何版本：没有外部用户、下游生态与历史包袱，全部源码在本仓库内，可以整体
重写。由此导出：**不为兼容而保留**（评估遗留物只看「它在终态里还成立吗」）、**允许推翻
决策**、**终态优先于渐进**。

## 当前基线

- **一条路径**：`Parser → Loader → DT 精化 → 擦除 codegen → OCaml`；DT 是唯一检查器，
  没有第二套 checker / codegen，也没有可切换开关。
- **自举**：`seed/` 是 compiler 包入口闭包的多文件 OCaml 信任锚点；旧 seed 能编译当前
  源码，rotation 后 stage1 == stage2。工具链（fmt/lint/repl/doc/test/LSP/Index）不进 TCB。
- **包与构建**：workspace 根即包；每文件唯一包上下文；声明式效应能力；逐模块 split 输出；
  确定性产物 + 依赖闭包哈希 + 按模块内容哈希增量。
- **工具链**：CLI 统一参数 / 错误出口；LSP 走包上下文（诊断 / hover / 补全 / 定位 /
  references / 格式化 / 符号）；REPL 多行 + IO compile+run；`vuna test` 纯 / 效果双路径；
  VSCode 扩展。
- **质量门禁**：`nix flake check`（packages + seed-selfhost + tests + typecheck + lint + fmt +
  index + metrics + package + context-budget + vscode-ext）、原生测试、lint / fmt / metrics /
  文档预算。

## 终态（目标）

**一套表面语言、一个类型检查器、一条 codegen、一个 seed，且检查器本身可信。**

- **类型理论**：依赖类型 + 归纳族；严格分层宇宙；擦除由单一判据驱动，QTT 的完整变体留研究。
- **路径**：单文件只是包内 ad-hoc 入口，与包内模块走同一装配 / codegen；不存在第二套加载
  语义。
- **可信性**：不存在「跳过检查但不告知」的通道；任何放行都是显式、可审计、有诊断的。
- **语言面**：顶层签名必填；不用的特性直接删；不保留兼容层。`record` / `deriving` /
  多 clause / `do` / trait 保留，但降到普通 data/case/字典语义之上，不靠短名特判。
- **模块与包**：模块系统 v3、运行时 / 后端、效应与并发、生态属于未来轨道（F1–F4），不阻塞
  当前根修。

## 下一步

**下一阶段从 M31 起按需排期；当前没有已承诺的阶段。** 候选来自
[debt.md](reference/debt.md) 的开放项（语言 / 精化器残留、工具与构建、F1–F4 能力缺口）。
新阶段必须映射到 debt 条目，并在「范围」里列明关闭哪些项。

## 未来轨道（F = future，不排期）

### F1：模块系统 v3

签名 / 接口、functor、嵌套与局部模块、选择性 import；与包 `[export]`、模块身份、split
单元整合；是否重新引入 `.mli` 在此决策。

**前置**：现行包上下文、命名空间与 split 稳定。**状态**：不排期。

### F2：运行时与多后端

擦除感知的运行时；OCaml runtime 长期保留 vs 自研 GC / 后端无关 IR；Wasm/JS 后端原型；
GC / 运行时正确性与性能；后端语义一致与 seed 边界不变。

**前置**：原语 / 效应边界、擦除判据稳定。**状态**：不排期；擦除后 OCaml 后端可能长期够用。

### F3：效应、并发与异步

通用效应系统（effect rows 或等价设计）、async/await 或结构化并发、调度器、取消 / 超时；
把 `IO` 从 thunk 升级为正式效应接口。

**前置**：F2 方向决策。**状态**：不排期；可先库级后语言级。

### F4：标准库与包生态

DT 验证库（Vec/Fin/Map/Set/排序/证明组合子）；证明 ergonomics 进阶（隐式模式 `{p}`、
`auto` / 隐式等式搜索、absurd / 空族消去、类型级部分应用、泛型 Σ / type codes 若采用）；
trait 能力补完（多参数 / 默认方法 / 父类 / 关联类型）；包 registry、版本解析、lockfile、
文档托管；生态与发布流程。

**前置**：相等 / 实例 / 证明 ergonomics 与包基建稳定。**状态**：不排期；验证库优先于
registry（没有外部用户时 registry 没有意义）。

## 研究储备（不排期，不占编号）

- QTT 的完整变体（依赖 multiplicity、资源安全）。
- 宇宙多态 / 累积性的更强形式。
- CoC 补完：非直谓 Prop、完整依赖消除的进阶形态。
- 线性 / 量化类型、证明自动化 / tactics / reflection、`rewrite` / `with` 的进阶形态。
- 效应行多态（若 F3 未采用）、自研 GC / 多后端（若 F2 决定不做）。

## 维护规则

- **M 编号 = 可排期阶段**：按依赖顺序推进；完成后从本文件删除阶段记录（历史在 git），
  roadmap 只保留当前基线与未来轨道。
- **F 编号 = future**：不排期、不占 M 编号，只表示方向与前置条件。
- **新阶段必须映射到 debt.md 的开放项**；推翻旧决策在提交信息与对应主题页说明，不静默
  改写。
- **禁止无登记的临时层**：任何「先这样、以后再说」的兼容层 / 哨兵 / 特判必须登记 debt 并
  给关闭阶段，否则视为未完成。
- 插入阶段用 `x.5`；研究储备进入排期时再分配编号。

## 相关阅读

- 债务与缺陷逐条登记：[debt.md](reference/debt.md)
- 子系统地图：[architecture.md](architecture.md)
- 类型系统 / Core 实现：[type-system.md](reference/type-system.md)、[core.md](reference/core.md)
- 自举链：[bootstrap.md](reference/bootstrap.md)；测试与 CI：[testing.md](reference/testing.md)；
  已知边界：[limits.md](reference/limits.md)
