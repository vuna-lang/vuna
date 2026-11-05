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
  哈希表；M33 W3 起桶是 `Array (Array (List ...))`）、不可变 `Base.Array`（copy-on-write）
  与 IO 内 `Base.IORef` / `Base.MArray` / `Base.Buffer`；内建类型构造子 `Array` / `IORef` /
  `MArray` / `Buffer`（M33 W3）。编译器查找表（defs / globals / ctor / clause / defVals）用
  `HashMap`，元变量解表与创建深度表用 `IntMap`（`metaLookup` 走索引，不再线性扫 /
  不再 `strFromInt`）。
- **Nat 零开销表示（M34.7）**：`Base.Nat` 保持归纳族语义，运行时是 OCaml `int`（无变体 /
  无分配）；期望类型处的字面量编译期展开、codegen 折回整数；`Zero`/`Succ` 与 `case` 降成
  整数与 `if`；`+ - * /` 在 Nat 上下文特化到 `bi_nat*`（饱和/截断），`Nat → Int` 隐式提升，
  反向显式 `fromInt`。Base 公开度量（List/Array/MArray/Buffer/String/IO/Map/Vec）迁到 Nat；
  低层原语、位置/fuel/level/meta/哈希等仍 Int（见 [limits.md](reference/limits.md)）。
- **系统编程能力（M33）**：生成程序基准 `nix run .#vuna-perf`（vuna vs 手写 OCaml，典型
  负载 ≤2×）；codegen 内建内联 / 多参数 lambda 链 / 字符串批拼；`Array` / `IORef` / `MArray` /
  `Buffer` 与 IO 隔离的可变数据；受限 FFI（`extern` + 包根 `ffi/*.c`）；库级 `State` /
  `Reader` / `Error`。测量设施与基线在 `bench/`。
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
fixity 唯一来源、反引号中缀 / section / 用户符号名、fmt 程序级 fixity）。**M33 已收尾**（六波：
测量地基 `nix run .#vuna-perf`、codegen / 运行时优化、容器与表示（`Array`/`IORef`/`MArray`/
`Buffer` + `HashMap`/`IntMap` 的 `Array` 桶）、可变数据边界与字符串补齐、受限 FFI
（`extern` + `ffi/*.c`）、库级最小效应接口（`State`/`Reader`/`Error`）；生成程序基准全部进入
2× 手写 OCaml；线性类型 / ST 按计划裁剪，见 debt D22）。下一步是已排期的 **M34（编译器快）**，
再往后 **M35（并发 / 服务端）**。新阶段必须映射到 debt 条目，并在「范围」里列明关闭哪些项；
B / C / E 系列残留按需插入。

## 性能轨道（M34–M35）

M33（语言能写高性能系统程序）已收尾，历史在 git；剩下两个小阶段。顺序依据：**编译器本身
是 vuna 程序（编译为 OCaml 运行）**，M33 的 codegen / 运行时 / 容器改进已直接反哺编译器。

### M34：编译器快

1. **基准与门槛**：复用 M33 的测量，设 `check` / `build` / LSP 的软 / 硬门槛；
2. **数据与算法（剩余）**：`append` O(n²)、SCC / 终止性 / loader 的 list→表、
   `Sort` 的 O(n²)、字符串 Buffer（容器 / 索引、`metaLookup` 索引化、去 `strFromInt`
   已落地）；**`vuna map` 冷启动全量重建 ~31 s**：索引缓存内容哈希失效后整仓重扫，且
   `Vuna.Index.Scan.refsInExpr` 用左结合 `append` 拼接子树引用列表，嵌套表达式 / 应用
   spine 上呈 O(n²)（热缓存读数 ~0.46 s；见 [debt.md](reference/debt.md) C34）；
3. **分配削减**：`Ec` / `Sols` 复制、Term / Value 表示、`normalize` / `force` 复用、
   hash-consing / interning；
4. **并行 / 增量**：workspace 并行 `check`（纯核心 + 确定性合并）、模块级并行 codegen、
   LSP 增量；
5. **单文件 / 模块级编译缓存**：依赖图 + 接口摘要 → 进程内缓存（LSP / REPL / workspace）→
   AST 磁盘缓存 → **elab 级磁盘缓存**。缓存 key 含源内容哈希、依赖接口摘要、base / prelude
   版本、编译器版本、manifest 能力；接口不变时复用 elab 结果，实现变化只失效 codegen。
   前置是序列化格式（Core Term / DtProgram，见 [debt.md](reference/debt.md) C32）；
6. **吃 M33 红利**：编译器重编译后验证 codegen / 运行时的收益并设门槛。

**依赖**：M33 已落地（测量 / 容器 / codegen 基础）；5 依赖序列化与接口摘要。
**退出标准**：`check .` 从当前 ~8 s 降至目标；`vuna map` 冷启动从 ~31 s 降至秒级；单文件
增量进入秒级以下；LSP 编辑反馈明显下降；性能 CI 门槛可用（[debt.md](reference/debt.md) C33）。
**映射 debt**：C30、C31、C32、C33、E01、E04、E06。

M34.1 基准/软门槛/分配统计（C34 关闭、C33 部分）；M34.2 热点（termination worklist、
`groupDefs`/`extraDefsOf`/`Namespaces` 表化、`vuna map` 索引 O(n²)→O(n)、
`unsolvedFrom` 的 list→IntMap（全解表扫描 O(n²)→O(n)）、C30）；M34.3 部分
（`termHasAnyMeta` 快速路径；`Ec`/`Sols` 已是 O(1) cons 与增量 delta）；M34.5 的 check/build 级
elab 缓存（`$TMPDIR/vuna-cache`，冷/热：check . 6.5s→25ms、build --no-compile 2.8s→21ms）；M34.6 读数
随基准。M34.4 workspace 并行 check 完成（`prim_spawn`/`prim_wait`；check . 冷 6.5s→4.1s；根包串行 + 成员并行）；
LSP 诊断帧进程内缓存（同 uri+内容重复请求命中，编辑后仍全量精化）。剩余（M34 收尾状态）：M34.5 接口摘要（C37）已修复 3 层真实缺陷——`quote 0` 的负索引
（`NVar "b" (-1)`）、深度感知序列化（`DtProgram.depths` + `quote d` + 占位环境恢复）、
自由变量过滤（`freeVarTerm` + dropped 安全阀）；剩 1 层（`runIO` 隐式 `a` 的求解路径，
`Interp.vuna:70` 的 `b <> String`）未定位，作为独立后续阶段（跨包 elab 状态复用需要完整
的作用域/实例化语义恢复）。其余剩余：M34.3 的 hash-consing（需全局 intern 表，与纯精化
路径冲突）；M34.4 模块级并行 codegen（C35：codegen open 全序 + 构造子名非模块限定）；
规范序列化格式（C32）。

**TTC 模块化精化收尾（2026-11）**：AST 缓存已落地（`Loader/Flatten.parseFileWithPath`，key = 路径 + 源内容哈希，`$TMPDIR/vuna-cache/ast`）。接口摘要（第 1 步）已修 4 层缺陷，摘要路径 779–955 ms，但 `Eq Type` 歧义未定位（详见 debt C37）。第 3 步被 C35 阻塞；第 2 步需模块级签名隔离。

### M35：并发 / 服务端

1. **效应系统 / 代数效应**：effect rows 或等价设计、handler、与 ST / 可变数据整合；
2. **结构化并发 / async**：调度器、取消 / 超时、结构化作用域、内存模型；先库级
   （线程池 / 事件循环 + IO），再语言级；
3. **网络 / 系统库与完整 FFI**：socket / 文件 / 进程、异步 IO、回调 / GC 交互；
4. **服务端框架 / 包生态**（可选，依赖外部用户）。

**依赖**：M33 的运行时 / 受限 FFI / 库级效应已落地；M34 的确定性与缓存。
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
