---
name: vuna-phase
description: 把大任务拆成 phase、用 GitHub stacked PR + 合并队列推进时使用——orchestrator 协议、phase ledger、2 个 dev 槽、subagent 任务模板、交接与回滚。用户说「拆 phase」「stacked PR」「phase N 合并前开工 phase N+1」时加载。
---

# 大任务的 phase 流水线

把跨多个 PR 的大改动拆成有顺序的 phase，每 phase 一个分支、一个 worktree、一个 PR。
上层对下层有硬代码依赖时用 stack；没有依赖就开独立分支与独立 PR，不要为了整齐而 stack。

机制细节（stack 与队列的官方行为、API、CI 成本）在
[github-workflow.md](../../../docs/reference/github-workflow.md)「Stacked PR 与合并队列」；
本文件只管**怎么排班与交接**。

## 1. 并发上限（硬约束）

| 项 | 上限 |
| --- | --- |
| 正在开发的 agent（dev 槽） | 2 |
| 每个 stack 的层数 | 3 |
| 全局同时 open 的 layer | 4 |
| 合并队列里同时的 entry | 3（正好一个满 3 层的 stack） |

- **线性 stack 同一时刻只允许 1 个写代码的 agent**：上层要基于下层的最终代码，两个 agent
  同时改同一 stack 会让后一个的基线失效。
- 第二个 dev 槽给独立工作流（另一个 stack / 独立 PR），或给 review / 验证——review 不写代码，
  不破坏「一个 stack 一个写者」。
- 槽满就排队，不要压缩验证步骤来提速。

## 2. phase 生命周期

| 阶段 | 谁做 | 完成判据 |
| --- | --- | --- |
| 规划 | orchestrator | ledger 里有 phase、branch、base、文件边界、验收命令 |
| 开发 | phase agent（占 dev 槽） | 改动在指定 worktree 内，验证命令跑过并记录 |
| 代码冻结 | orchestrator | 提交整理完、push、PR 打开、base 正确；入队由 checks 变绿后 sweep 完成（不依赖 arm） |
| 队列 | GitHub | stack 作为一个 merge group 进入队列 |
| 合并 | GitHub | bottom → top 原子落 `main` |
| 级联 rebase | orchestrator | `gh stack sync` 后各层重新线性、PR base 正确 |

**下一 phase 在上一 phase「代码冻结」后开工，不等 merged。** 冻结意味着该层的代码不再变；
合并与级联由队列和 orchestrator 处理，不占用 dev 槽。

## 3. 什么时候用 stack

- **用 stack**：phase N+1 直接改 phase N 引入的模块、类型或接口，离开下层无法编译/验证。
- **不用 stack**：两 phase 只共享 issue 或主题，代码上互不依赖——各自从 `origin/main` 切分支，
  两个 PR 并行进队列。栈越浅，级联与回滚越便宜。

层数到 3 就收口：第 4 层说明拆分粒度不对，回到规划，从 `main` 另起一条 stack 或独立 PR。

## 4. orchestrator 协议

**远端写操作只有 orchestrator 做**：`git push`、`gh pr create` / `edit` / `merge`、label、
`gh stack push/link/sync`、`merge-queue.sh arm/enqueue/dequeue`、worktree teardown。
phase agent 只改代码、跑验证、commit。

每个 phase 一个 worktree；branch 的 base 是上一 phase 分支，bottom 的 base 是 `main`。

```console
# 1) 每个 phase 在自己的 worktree 切分支（bottom 从 origin/main，上层从下一层分支）
git -C <worktree-1> switch -c feat/123-phase-1 origin/main
git -C <worktree-2> switch -c feat/123-phase-2 feat/123-phase-1

# 2) phase agent 返回 SHA：审 diff、git rebase -i 整理提交，确认验收命令
# 3) 代码冻结：首次建立本地追踪；后续新增层用 gh stack add 收养（在 top 分支所在 worktree）
gh stack init --base main feat/123-phase-1 feat/123-phase-2
gh stack add feat/123-phase-3          # 有第 3 层时；收养已存在的分支
gh stack push

# 4) 每层手动开 PR，base 指向下一层；标题/描述/labels 由 orchestrator 控制
gh pr create --base main              --head feat/123-phase-1 --title ... --body-file ...
gh pr create --base feat/123-phase-1  --head feat/123-phase-2 --title ... --body-file ...

# 5) 把 PR 链成 stack（顺序 bottom → top；只追加，不移除）
gh stack link <pr1> <pr2>

# 6) stack 不依赖 auto-merge；checks 绿后 sweep 自动整条入队
# nix/tools/merge-queue.sh enqueue <top>   # 手动：所有 open 层已 CLEAN
```

- `Closes #N` 只放 bottom 的 PR；上层用 `Refs #N`，PR-only 的上层加 `no-issue`。一个 issue
  只被关闭一次，否则上层合并时 issue 已经 Done。
- stack **不 arm**：GitHub 可能在只想 rebase 的仓库上按默认 squash 拒绝 `includeStack`；
  整条入队由 sweep 走 REST `merge-async`。
- 入队走 stack 语义：GraphQL `enqueuePullRequest` 没有 stack 参数，整条 stack 用 REST
  `PUT /repos/{owner}/{repo}/pulls/{n}/merge-async`、`merge_action: merge_queue`。脚本封装这条路径，
  不要手工逐层 `enqueue`。
- 合并后级联用 `gh stack sync`（fetch + rebase + push + 同步 PR）。冲突时 `gh stack rebase`
  交互解决；**不要手写 `git rebase --onto`**，也不要用 `-X ours` / `-X theirs` 整片丢改动。
- 整条 stack 全部合并后才 `gh stack sync --prune`（或 `gh stack unstack`）并 teardown 各 phase
  worktree；中途 teardown 上层会让级联失去本地 checkout。

## 5. phase ledger

orchestrator 维护一张表，会话内与每个 phase 的 PR 描述里保持同一行信息：

| phase | issue | branch | base | worktree | PR | 状态 | seed |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1 | #123 | `feat/123-phase-1` | `main` | `…/phase-1` | #201 | frozen | 轮换 |
| 2 | #123 | `feat/123-phase-2` | `feat/123-phase-1` | `…/phase-2` | #202 | dev | 禁止 |
| 3 | #123 | `feat/123-phase-3` | `feat/123-phase-2` | `…/phase-3` | — | planned | 禁止 |

状态只用 `planned` / `dev` / `frozen` / `queued` / `merged` / `abandoned`；`frozen` 之后不再接受
代码改动。要改就回到 `dev`：已入队时先从 top `dequeue` 整条 stack，改完重新整理、push、
arm；绿后由 sweep 入队。

## 6. 2 个 dev 槽怎么排

1. 先排线性 stack 的当前层（写者 1 个）。
2. 第二个槽按价值选：另一条独立工作流，或对本 stack 已冻结层的 review / 验证。
3. review / 验证发现问题只写评论或开 issue；修复回到写者槽，不在 review 槽里改代码。
4. 有 phase 在等 CI 或等队列时不占槽；槽空出来就启动下一个 planned phase。

## 7. subagent 任务模板

派发时把下面整段填好；路径用绝对路径，不要让 agent 自己找主仓或别的 worktree。

```markdown
## 任务
phase <N>：<一句话目标>

## 工作区
- worktree：/absolute/path/to/worktree
- 分支：feat/<n>-phase-<N>（已存在，不要新建、不要切换）
- 基线：<上一 phase 分支或 origin/main>，不要 rebase 到 main

## 文件边界
只改：
- <path/glob>
- <path/glob>
不要改：seed/、.github/workflows/、nix/tools/、其他 worktree、其他 phase 的文件。

## 验收
- nix run .#vuna -- fmt <改动路径>
- nix run .#vuna -- check .
- nix run .#vuna-run-tests -- --only <owner/family>
- <本 phase 特有的命令>

## 纪律
- commit 用 `type(scope): 中文描述`，一次提交只做一件事；不产生 merge commit。
- 不 push、不开/改 PR、不加 label、不跑 gh stack / merge-queue.sh、不 teardown。
- 结束时返回：HEAD SHA、`git status --short`、跑过的命令与结果、没跑的项与原因。
```

## 8. 交接 checklist（代码冻结前）

- [ ] `git status --short` 只有预期改动，没有 `result*` / `.output` / `_scratch/` / 生成物。
- [ ] 无 `fixup!` / `squash!` / `WIP`，无 merge commit；提交按逻辑整理过。
- [ ] `nix run .#vuna -- fmt --check <改动路径>`、`check .`、相关 suite 通过；没跑的要写明。
- [ ] 只动了 ledger 里列出的文件边界；`seed/` 只允许**最低层**的独立 `chore(seed)`。
- [ ] 报告含 SHA 与验证清单；orchestrator 已审过 diff。
- [ ] 冻结动作完成：push、PR 打开、base 正确、已 arm；绿后由 sweep 入队 top。

## 9. 失败与回滚

| 情况 | 处理 |
| --- | --- |
| 级联冲突 | `gh stack rebase` → 按语义解决 → `git add` → `--continue`；要整体还原用 `--abort`。保留双方改动。 |
| 下层要改（已冻结后） | 先从 top `dequeue` 整条 stack；改下层 → `gh stack rebase` 级联上层 → 重新整理 / push；绿后由 sweep 入队。上层不能带着旧基线继续。 |
| 某层要撤掉 | `gh stack modify` 的 drop / fold，或关掉该层 PR 后 `gh stack unstack` 重建；**保留 worktree** 直到改动找回。 |
| 队列把某层移出 | 上层会被一起移出。修根因后由 sweep 重新入队，不要逐层重试。 |
| stack 超过 3 层 | 停止加层；从 `main` 另起一条 stack 或独立 PR，把后续 phase 移过去。 |
| seed 冲突 / 上层碰了 `seed/` | 撤回上层的 seed 改动；rotation 只在最低层做，全局同时只允许一次。 |
| 整个 phase 放弃 | 从 top 往下关 PR；`gh stack unstack --local` 只清本地追踪；worktree 保留到确认无未保存改动，再 teardown。 |

## 不要做的事

- 让 phase agent push、开 PR 或跑 `gh stack` / `merge-queue.sh`。
- 逐层 enqueue，或对 stack 用 `gh pr merge` / 同步 merge 端点。
- 在上一 phase 没冻结时开下一 phase 的写者。
- 手写 `rebase --onto`，或用手工 rebase 代替 `gh stack sync`。
- 为了「保持整齐」把无依赖的改动硬叠成 stack。
- 在 stack 中途 teardown 仍会被级联 rebase 的 worktree。