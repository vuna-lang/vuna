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
- **名字与运算符**：**运算符 = 有 fixity 的普通名字**；`a op b`、`op a b`、`` a `f` b ``
  与 `f a b` 同义。parser 只产出 `EInfix` / `EBacktick` / `ESect*` / `EParen` 中间节点，
  `Loader.Fixity` 在 resolve 前按模块可见 fixity 表重排、替换别名、展开 section。fixity 与
  别名**唯一来源**是源码里的 `infix*` 声明（库或用户；`->` 是语法由 Loader 的语法表恒可见），
  没有编译器兜底表；未知符号运算符中缀使用是错误；可见闭包按模块去重（防 import diamond
  路径爆炸）。`==` / `/=` / `<` / `<=` / `>` / `>=` 是 `Eq` / `Ord` 方法
  （`eq` / `neq` / `lt` / `le` / `gt` / `ge`）的别名；`>>` 由 Loader 按 do 派生展开（`bind a (\_ -> b)`）。
  fmt 感知程序级 fixity 并打印 `infix*` 声明（M31.1–M31.3，见
  [operators.md](reference/operators.md)）。
- **自举**：`seed/` 是 compiler 包入口闭包的多文件 OCaml 信任锚点；旧 seed 能编译当前
  源码，rotation 后 stage1 == stage2。工具链（fmt/lint/repl/doc/test/LSP/Index）不进 TCB。
- **包与构建**：workspace 根即包；每文件唯一包上下文；声明式效应能力；逐模块 split 输出；
  确定性产物 + 依赖闭包哈希 + 按模块内容哈希增量。
- **工具链**：CLI 统一参数 / 错误出口；LSP 走包上下文（诊断 / hover / 补全 / 定位 /
  references / 格式化 / 符号）；REPL 多行 + IO compile+run；`vuna test` 纯 / 效果双路径；
  VSCode 扩展。
- **容器与查找表**：标准库有 `Base.HashMap` / `Base.HashSet` / `Base.IntMap`（1024 桶持久
  哈希表）；编译器查找表（defs / globals / ctor / clause / defVals）用 `HashMap`，元变量
  解表与创建深度表用 `IntMap`（`metaLookup` 走索引，不再线性扫 / 不再 `strFromInt`）。
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

**M31 系列已收尾**（M31.1–M31.3：运算符=方法别名、parser 去优先级、库内 `infix*` 声明成为
fixity 唯一来源、反引号中缀 / section / 用户符号名、fmt 程序级 fixity）。下一步是已排期的
**M33–M35 性能轨道**（见下）：按「语言能写高性能系统程序 → 编译器快 → 并发 / 服务端」推进。
新阶段必须映射到 debt 条目，并在「范围」里列明关闭哪些项；B / C / E 系列残留按需插入。

## 性能轨道（M33–M35）

性能是下一个大阶段，分三个小阶段。顺序依据：**编译器本身是 vuna 程序（编译为 OCaml
运行）**，因此先做生成程序的性能，B 线的 codegen / 运行时 / 表示改进会直接反哺 A 线；
语言特性（async / 代数效应 / FFI）不会自动让编译器变快，所以 M33 内部先做「编译器也
吃得到」的项。

### M33：语言能写高性能系统程序

1. **测量**：生成程序基准（字符串 / 数组 / 哈希 / 递归 / FFI / GC 压力）+ 分配、GC、
   峰值内存统计；复用同一套设施做编译器基准；
2. **codegen / 运行时质量**（最高优先，编译器也受益）：单态化 / 字典消除、去装箱、内联、
   尾调用、闭包转换、常量折叠、`String` / `Bytes` / Buffer、记录与变体布局、GC 统计与调优；
3. **容器与表示（剩余）**：不可变 `Array`；可变数组 / `IORef`（IO 内）；M34 复用同一
   实现（`HashMap` / `HashSet` / `IntMap` 已落地，见「当前基线」）；
4. **可变数据 / ST / 类型系统**：先 `IORef` / 可变数组 → 线性 / 唯一性类型（或 rank-2 /
   存在类型）→ ST / region；顺序不可颠倒（见 [debt.md](reference/debt.md) D22）；
5. **FFI**：先受限 FFI（纯 C 函数、基本类型、无回调 / GC 交互），再字符串 / 数组 / 回调 /
   GC root / pin（D21）；
6. **最小效应接口**：`IO` 从 thunk 升级为正式效应接口；State / Reader / Error 先库级
   （为 M35 打底）。

**依赖**：1 先于其余；2 / 3 可并行；4 依赖 2 / 3；5 依赖 2 与 4 的能力边界；6 可在尾段启动。
**退出标准**：生成程序基准达到设定门槛（例如典型负载在 2× 手写 OCaml 内）；编译器重编译
后自身有可测下降；FFI / 可变数据可用；ST 是否完成取决于线性类型进度。
**映射 debt**：D02（部分：表示与运行时性能）、D03（部分：IO 正式化）、D04（容器基础已
落地，剩 DT 验证库 / 库）、D21、D22。

### M34：编译器快

1. **基准与门槛**：复用 M33 的测量，设 `check` / `build` / LSP 的软 / 硬门槛；
2. **数据与算法（剩余）**：`append` O(n²)、SCC / 终止性 / loader 的 list→表、
   `Sort` 的 O(n²)、字符串 Buffer（容器 / 索引、`metaLookup` 索引化、去 `strFromInt`
   已落地）；
3. **分配削减**：`Ec` / `Sols` 复制、Term / Value 表示、`normalize` / `force` 复用、
   hash-consing / interning；
4. **并行 / 增量**：workspace 并行 `check`（纯核心 + 确定性合并）、模块级并行 codegen、
   LSP 增量；
5. **单文件 / 模块级编译缓存**：依赖图 + 接口摘要 → 进程内缓存（LSP / REPL / workspace）→
   AST 磁盘缓存 → **elab 级磁盘缓存**。缓存 key 含源内容哈希、依赖接口摘要、base / prelude
   版本、编译器版本、manifest 能力；接口不变时复用 elab 结果，实现变化只失效 codegen。
   前置是序列化格式（Core Term / DtProgram，见 [debt.md](reference/debt.md) C32）；
6. **吃 M33 红利**：编译器重编译后验证 codegen / 运行时的收益并设门槛。

**依赖**：M33 的 1 / 2 / 3；2 可与 M33 并行；5 依赖序列化与接口摘要。
**退出标准**：`check .` 从当前 ~8 s 降至目标；单文件增量进入秒级以下；LSP 编辑反馈明显
下降；性能 CI 门槛可用（[debt.md](reference/debt.md) C33）。
**映射 debt**：C30、C31、C32、C33、E01、E04、E06。

### M35：并发 / 服务端

1. **效应系统 / 代数效应**：effect rows 或等价设计、handler、与 ST / 可变数据整合；
2. **结构化并发 / async**：调度器、取消 / 超时、结构化作用域、内存模型；先库级
   （线程池 / 事件循环 + IO），再语言级；
3. **网络 / 系统库与完整 FFI**：socket / 文件 / 进程、异步 IO、回调 / GC 交互；
4. **服务端框架 / 包生态**（可选，依赖外部用户）。

**依赖**：M33 的运行时 / FFI / 最小效应接口；M34 的确定性与缓存。
**退出标准**：并发 echo / HTTP 基准；取消 / 超时语义正确；无数据竞争（类型层或运行时检测）。
**映射 debt**：D03（关闭）、D02（运行时决策）、D04（生态，可选）。

**明确排除**：不自研后端 / GC / LLVM / native；OCaml 后端长期保留（D02 的该分支关闭）。
Wasm / JS 暂缓，不排期；若未来需要单独立项。性能轨道不改变「单一 DT 路径」、seed 不变量
与 TCB 边界；codegen / 运行时改动进入 seed 闭包时，按既有「旧种子能编译新源码 → rotation
→ stage1 == stage2」流程执行。

## 未来轨道（F = future，不排期）

### F1：模块系统 v3

签名 / 接口、functor、嵌套与局部模块、选择性 import；与包 `[export]`、模块身份、split
单元整合；是否重新引入 `.mli` 在此决策。

**前置**：现行包上下文、命名空间与 split 稳定。**状态**：不排期。

### F2：运行时与多后端

擦除感知的运行时；OCaml runtime 长期保留 vs 自研 GC / 后端无关 IR；Wasm/JS 后端原型；
GC / 运行时正确性与性能；后端语义一致与 seed 边界不变。

**M33–M35 决策**：不自研 GC / 后端；OCaml 后端长期保留；Wasm / JS 暂缓（见「性能轨道」
的排除项）。
**前置**：原语 / 效应边界、擦除判据稳定。**状态**：不排期；擦除后 OCaml 后端可能长期够用。

### F3：效应、并发与异步

通用效应系统（effect rows 或等价设计）、async/await 或结构化并发、调度器、取消 / 超时；
把 `IO` 从 thunk 升级为正式效应接口。

**前置**：F2 方向决策。**状态**：不排期；可先库级后语言级。**M33–M35 决策**：最小效应
接口在 M33 尾段，通用效应 / 并发在 M35；F3 的完整形态以 M35 的范围为准。

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
- 线性 / 唯一性类型的进阶形态（M33 只取可变数据 / ST 所需子集；完整 QTT 见上）。
- 证明自动化 / tactics / reflection、`rewrite` / `with` 的进阶形态。
- 效应行多态（若 F3 未采用）。

## 维护规则

- **M 编号 = 可排期阶段**：按依赖顺序推进；完成后从本文件删除阶段记录（历史在 git），
  roadmap 只保留当前基线与未来轨道。
- **F 编号 = future**：不排期、不占 M 编号，只表示方向与前置条件。
- **新阶段必须映射到 debt.md 的开放项**；推翻旧决策在提交信息与对应主题页说明，不静默
  改写。
- **禁止无登记的临时层**：任何「先这样、以后再说」的兼容层 / 哨兵 / 特判必须登记 debt 并
  给关闭阶段，否则视为未完成。
- 插入阶段用 `x.5`；研究储备进入排期时再分配编号。
- 性能轨道（M33–M35）是同一大阶段的三个小阶段，可按依赖合并 / 拆分；完成后按 M 编号规则
  删除阶段记录。

## 相关阅读

- 债务与缺陷逐条登记：[debt.md](reference/debt.md)
- 子系统地图：[architecture.md](architecture.md)
- 类型系统 / Core 实现：[type-system.md](reference/type-system.md)、[core.md](reference/core.md)
- 自举链：[bootstrap.md](reference/bootstrap.md)；测试与 CI：[testing.md](reference/testing.md)；
  已知边界：[limits.md](reference/limits.md)
