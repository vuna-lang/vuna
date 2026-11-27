# 已决取舍

本页记录**已决定、不再作为待办**的设计取舍。它们不是债务；改动这些取舍需要新的设计
决策，而不是修一个 issue。

债务与未实现能力在 GitHub issues 跟踪（查询 `label:debt`，文档引用写 `gh#N`）。

| ID | 取舍 | 位置 |
| --- | --- | --- |
| DEC-rig | 定义性相等不比 `rig`（擦除格子不参与类型相等） | [core.md](core.md) §3 |
| DEC-nat | 超过 `natChainMaxValue` 的 Nat 链饱和成相等（预算 `convFuelBase + 4*depth`、`convFuelMax` 封顶） | [core.md](core.md) §3 |
| 前端不支持清单 | guard / `\case` / 类型层 lambda / 用户宏等已决边界 | [frontend-syntax.md](frontend-syntax.md) §11 |
| 无 manifest 能力门控 | `prim_*`（纯原语）任意包可直调；宿主效应原语是隐藏名（剩余缺口见 gh#104） | [effects.md](effects.md) §8.6 |
| CPS 机器节点类型 | 机器级类型（`Control` / 续延 / `Step`）不进 `IrTy`，机器 pass 的节点类型槽统一 `IrTyOpaque`；空槽由 `Ir.Validate` 拒绝 | [ir.md](ir.md)「已知边界」 |
| native 线程表固定 4096 槽 | 表容量与并发解耦（GC 按 `rt_thread_hi` 扫、槽在 join 时 CAS 复用）；上限显式 trap `too many threads`，不做动态扩容——真正的上限是内核 task 数 / 地址空间 | [primitives.md](primitives.md) §6.2 |
| native 子进程 pid 表进程级 64 槽 | 语义正确的一侧（SIGALRM 要看到全进程的子进程）；写者一把 futex 锁、读者（信号处理器）不拿锁；槽满时收掉新子进程并报 `ProcessTooManyChildren` | [native-runtime.md](native-runtime.md) §4 |
| DEC-stack | 大任务拆 phase 时用 stacked PR + 合并队列，逐层推进；下层合并后上层 retarget 到 `main` 并由 sweep 重新入队，**不承诺整条原子落库** | [github-workflow.md](github-workflow.md)「Stacked PR 与合并队列」 |
| DEC-phase-concurrency | 2 个 dev 槽；每 stack ≤3 层、全局 ≤4 个 open layer、队列 ≤3 entry；线性 stack 同一时刻只有 1 个写代码的 agent | 技能 `vuna-phase`、[github-workflow.md](github-workflow.md)「Stacked PR 与合并队列」 |
| DEC-phase-remote | 远端写（push / PR / label / arm / enqueue / merge / teardown）只由 orchestrator 执行；phase agent 只改代码、跑验证、commit | 技能 `vuna-phase` |
| DEC-phase-ci | stack 保持每层完整 gates：`pull_request` 每层都跑，`merge_group` 按入队组完整跑，不为 stack 缩减检查 | [testing-checks.md](testing-checks.md)「stacked PR 的 CI 成本」 |
| DEC-phase-seed | seed rotation 跟随真正改变 codegen 的层；每层独立满足「当前 seed 编译当前源码」，不假设最终组合态自洽 | [github-workflow.md](github-workflow.md)「Stacked PR 与合并队列」 |
