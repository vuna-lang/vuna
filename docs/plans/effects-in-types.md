# 效果进类型（F3 效应部分）：目标、决策与阶段

**状态（2026-11，P1 + P2a/P2b 完成）**：P0（决策落盘）、P1a（效果协议集中）、P1b（`runIOEff`
入口只接受 `Eff []`）、P1c（`TC_UnhandledEffects` 专门诊断）、P1d（语言级调试构造）、P2a（特权边界机制 + 全仓迁移）、P2b（manifest 声明宿主模块 + REPL 显式开关）已落地；P2c 已落地；P3 组合子已落地、自动 lift 结论记录（D51）；P5 待做。本文是
[roadmap](../roadmap.md) 中 `F3` 的展开；仍未关闭的具体缺口见
[debt](../reference/debt.md)。

## 1. 终态

**用户面**（无特权包 / ad-hoc 文件）：

- 只有 `Eff r a` 一种效果类型；宿主效应（console/fs/process/env/clock）经
  `Base.Eff.*` 的标签与 handler 表达。
- `main : IO a` 是不透明入口（`IO` 只是运行时基座类型，用户面不提供它的 API）；用
  `runIOEff : Eff [] a -> IO a` / `runIOAnswer` 把**已处理干净**的动作交给运行时。
- **未处理效应 = 编译错误**：所有运行入口都要求行 `Nil`。
- 用户包不能 import `Base.IO.Host`、不能直调 `prim_*`、不声明 `[capabilities]`/`[trust]`；
  `Base.IO`（公开）只剩 IO 代数与实例，供 `main`、`IORef`/`MArray`/`Buffer`/`ST` 这类
  进程内 IO 使用。
- 行多态 + 自动 lift：`Eff r a` 自动用在期望 `Eff (e :: r) a` 的位置，不再手写 `weaken`。

**特权层**（`vuna-base` 的真实 handler、`vuna-compiler`、根包工具链）：

- 保留 `Base.IO.Host`（`runIO` + 宿主别名）、`prim_*`、`[capabilities]`、`[trust]`；
  base 的 `[trust] unsafe` 审计面不变。
- 这层是运行时基座（TCB），用户面不再看见它。

## 2. 决策

- **D1 不统一 `IO`/`Eff`**（否决 `IO r a`）：vuna 没有类型别名；把 `Eff` 改成 IO 会破坏
  纯效果夹具的 `vuna interp`、把续延/Ctx 拉进 TCB、并要求重写编译器与工具链。
  `IO` 保持不透明运行时入口，`Eff` 是用户面效果类型。
- **D2 不做类型级能力行**（否决 `IO [caps] a`）：行只描述、不授权；行擦除后运行时不可用；
  仍需要策略层。用"特权包边界"代替：行描述效果，边界决定谁能碰宿主。
- **D3 效果协议显式化**：编译器原先硬编码 `Base.Eff.{Row,Nil,Cons,Member,Here,There,
  rowRem}`；这些名字集中到 `Vuna.Compiler.Intrinsics` 的效果协议常量
  （`effRowFamilyName` 等），`Core/Eval.rowRemReduce` 与 `Elab/Dict` 只引用常量。
- **D4 特权标记是纪律/审计机制**（今天 `[capabilities]` 本就是包自声明，不是外部授权）：
  新增的 `[package] privileged` 只把"用户正常路径"与"可审计特权路径"分开；真正的沙箱
  属 F4。
- **D5 一次性续延保持**（OCaml 5 one-shot）；多射不做。并发/async 是 F3 的另一半，不在本文。

## 3. 阶段

| 阶段 | 内容 | 状态 |
| --- | --- | --- |
| **P0** | 本文 + roadmap/effects/debt/AGENTS 落盘 | 已落地 |
| **P1a** | 效果协议常量集中（`Intrinsics` + `Core/Eval` + `Elab/Dict`） | 已落地 |
| **P1b** | `runIOEff : Eff [] a -> IO a`；入口未处理效应变类型错误 | 已落地 |
| **P1c** | 未处理效应的专门诊断（`TC_UnhandledEffects`，列出具体标签；`Elab/Term/Impl.checkByInferFuel`） | 已落地 |
| **P1d** | 语言级调试构造：`dbg` / `dbgShow`（`DebugShow` blanket）/ `assert` / `todo`；`assert`/`todo` 仅 debug 构建（release 由 `Loader.Resolve` 拒绝，`TC_DebugConstructInRelease`）；`Base.Debug` 退役 | 已落地 |
| **P2a** | 特权边界机制：`[package] privileged`、`Base.IO` 拆分（公开代数 / `Base.IO.Host`）、非特权包禁 import Host / 直调 `prim_*` / 声明能力；全仓特权代码（base/compiler/toolchain/测试包）迁移到 `Base.IO.Host` | 已落地 |
| **P2b** | 机制收口：`[privileged] modules` 由 manifest 声明（base 声明 `["Base.IO.Host"]`）、REPL 默认非特权 + 显式 `--privileged`（ad-hoc 特权上下文仅由该 flag 打开） | 已落地 |
| **P2c** | 用户面收敛：用户夹具迁到 typed effects + 去掉对应包的 `privileged = true`。已落地：dt_io/dt/stdlib/cli/repl/packages 01–04 迁移完成；剩余 36 个 Host 引用均为有意特权测试（handler/API/trust/net/test-runner/多效应组合待 P3） | 已落地 |
| **P3** | 行多态与自动 lift：`runConsole`/`runFs`/`runEnv`/`runClock`/`runProcess` 单效应组合子已落地；手动 `weaken` 组合已验证（dt_io 05 与探针）。自动 lift 探针结论见 D51（终止性检查拒绝互递归方案；改走独立 helper 或推断后行合一） | 部分落地（自动 lift 延后，结论已记） |
| **P4** | 语言级 `perform`/`handle` 语法与高阶/作用域效应类型（需单独立项） | 未排期 |
| **P5** | 收口：文档、debt、TCB 复核、性能、最终 rotation | 待做 |

每阶段的 compiler 行为变化以独立 `chore(seed)` rotation 收尾；只做重构/常量集中的提交
不强制立刻 rotation（旧 seed 仍能编译新源码）。

## 4. 取代表

| 现状 | 终态 |
| --- | --- |
| `Base.IO` 同时是用户面与实现面 | 用户面只有 `Eff`；`Base.IO` 只留代数，宿主别名进 `Base.IO.Host`（特权） |
| `runIOEff` 接受任意行（未处理效应运行时报错） | `runIOEff : Eff [] a -> IO a`；入口未处理效应是类型错误 |
| 编译器散落硬编码 `Base.Eff.*` 名字 | `Intrinsics` 的效果协议常量 + 单一归约点 |
| `[capabilities]`/`[trust]` 对所有包可见 | 仅特权包；用户面退役 |
| `weaken` 手写 | 行子类型自动插入 |
| 未处理效应诊断只在运行时 | 编译错误 + 专门错误码（P1c，已落地） |

## 5. 测试与验收

- P1：`vuna check .`（compiler/base/root）、`fmt --check`、`dt_base/31–39,43`
  （`runIOEff` 全是 `Eff []`）不回归、新负例
  `dt_err/82_unhandled_effect_entry`（非 Nil 行直接进 `runIOEff` → `TC_TypeMismatch`）。
- P2：非特权包 import `Base.IO.Host`/直调 `prim_*`/声明能力均报错；迁移后的用户夹具在
  typed 效果下全绿；工具链/编译器行为不变。
- P3：行多态 helper 与自动 weaken 正例；行/实例名不匹配仍是类型错误。
- 每阶段：全量 `nix run .#vuna-run-tests`、§38 快照、`vuna check .`；rotation 后
  stage1 == stage2。

## 6. 风险与前置

- **精化器前置**：行推断/子类型会踩 D46（trait 方法期望类型）与 D48（长 `do` 链指数
  膨胀）；P3 前先做小探针，必要时把精化器双向化提前。
- **D39**（`Member` 重叠实例）不阻塞：W3 的归纳族 + 精化器构造证明已可用。
- **迁移面**：57 个 `Base.IO` 夹具 + examples + 39 个特权导入点；按阶段分提交。
- **REPL/LSP**：ad-hoc 片段在 P2 后按非特权处理；必要时给 REPL 显式"以某包特权上下文
  求值"开关。
- **`Base.Debug`**：已退役（F3 B）：`trace`/`traceShow` → 语言级 `dbg`/`dbgShow`，
  `assert`/`todo` 变为 debug-only 内建（release 由 Resolve 拒绝），不再需要 runIO 逃逸
  （默认保留为用户可见的显式调试逃逸，登记 debt）。
- **`net`**：没有标签模块，P2 后仅特权层可用；是否补 `Base.Eff.Net` 列 P5 可选。