# Issue / PR / 门禁协作

本页是仓库的 GitHub 工作流说明：issue 状态机、标签含义、PR 与 issue 的联动、
按 `type + area` 选择的 PR 门禁、合并队列、stacked PR 的入队与级联，以及 main 红灯的
认领流程。分支与提交整理见
[CONTRIBUTING.md](../../CONTRIBUTING.md) 与技能 `vuna-pr`；门禁语义见
[testing-checks.md](testing-checks.md)。

## 状态机

Issue 的进度是 GitHub 原生 status；`status:*` 标签已退役。关闭状态由关闭原因决定：

| status | 类别 | 含义 |
| --- | --- | --- |
| Backlog | backlog | 未排期 |
| Todo | planned | 已排期，尚未开工 |
| In progress | started | 开发中 |
| In review | started | PR 已就绪，等待门禁或评审 |
| Done | completed | 已完成（closed） |
| Not planned | not_planned | 不计划处理（closed） |
| Duplicate | duplicate | 重复（closed，指向 canonical issue） |

GitHub 自带推进，不需要标签：

| 事件 | 结果 |
| --- | --- |
| 新建 issue | Backlog |
| assign 人 | Backlog → Todo |
| 关联 draft PR（`Closes #N`） | In progress |
| PR 转 ready，或关联 ready PR | In review |
| 最后一个 ready PR 转回 draft / 关闭未合并 | In review → In progress |
| `Closes` 合并 | Done（自动关闭） |

仓库脚本补齐 GitHub 不覆盖的部分：

- `Refs #N` 的 PR 不会被 GitHub 原生 link：`pr-triage` 按 draft / ready 把 issue 推到
  In progress / In review；PR 关闭但未合并时回到 Todo，并留一条评论。
- 子任务进入 In progress / In review 时，父 issue（通常是 epic）从 Backlog / Todo 推到
  In progress（只前进，不回退）。
- epic 新建即 Todo；关闭时随关闭原因变 Done / Not planned。

`gh` 还没有 status 的 flag 和 JSON 字段，读写用 `nix/tools/issue.sh`：

```console
nix/tools/issue.sh status <n> in-progress
nix/tools/issue.sh show <n>
gh issue list --search 'status:todo'        # 按状态筛选
```

认领 = assign + In progress；只 assign 会让 issue 留在 Todo，被其他 agent session 当成
可领取。领取后先用 `issue.sh show <n>` 确认 `status=In progress` 再开工。

`milestone` 只做分组，不再表示「已排期」；排期看 assignee 或 Todo。

## backlog 的两类入口

### 人类一句话 idea

用 `想法 / 方向` 模板创建：标题 + 一句话即可，自动带 `needs-refinement`，状态是默认的
Backlog。Agent 处理时：

1. 先查重：
   ```console
   gh issue list --state all --search "<关键词> in:title,body" --limit 20
   ```
2. 在 issue 里讨论，补全背景、目标 / 非目标、方案、验收标准。
3. 补齐元信息：`gh issue edit <n> --type Bug`（或 Feature / Chore / Refactor / Perf /
   Docs / Test / Epic）、`pkg:*` / `area:*` 标签、`nix/tools/issue.sh priority <n> P1`，
   按需加 milestone。
4. 建立关系：`gh issue edit <n> --parent <epic>`、`--add-blocked-by <m>`、
   `nix/tools/issue.sh relate <n> <m>`；来源链接写在正文。
5. 移除 `needs-refinement`；未排期保持 Backlog，已排期 assign 或
   `nix/tools/issue.sh status <n> todo`。
6. 确认重复：`gh issue close <n> --reason duplicate --duplicate-of <m>`。

`needs-refinement` 表示“内容或元信息还没准备好”，不是优先级；等待用户回答时也可以同时加
`needs-info`。

### Agent 发现的后继任务

Agent 在开发、评审或门禁失败时发现问题：

1. 创建前搜索 open + closed issue；已有相同问题就评论补充，不重复建。
2. 正文写清来源（PR / issue / commit / `file:line`）、影响面、建议方案、验收标准。
3. 设原生类型（`gh issue edit <n> --type ...`）与 `pkg:*` / `area:*` 标签，默认 Backlog；
   属于方向时挂到 epic 的 sub-issue（`--parent`）。
4. 与当前改动相关时在新 issue 里链接来源 PR / issue。

## 标签

### type（PR 门禁路由）

Issue 的类型是 org 级 issue type：`Bug`、`Feature`、`Chore`、`Refactor`、`Perf`、`Docs`、
`Test`、`Epic`，不是标签。`type:*` 标签只出现在 PR 上，由 `pr-triage` 从标题前缀和关联
issue 的 issue type 派生，`gates` 用它选检查；`type:*` 与 issue type 一一对应
（`Chore` 对应 `type:chore`）。

### priority（原生字段）

`Priority` 是 org 级 issue field，选项是 `Urgent` / `High` / `Medium` / `Low`，对应
`P0` / `P1` / `P2` / `P3`：

```console
nix/tools/issue.sh priority <n> P1              # 写入 High
gh api "repos/vuna-lang/vuna/issues?issue_field_values=priority:High" --jq '.[].number'
```

### 关系（原生）

- sub-issue：`gh issue edit <child> --parent <epic>`；批量用 `--add-sub-issue`
- blocked by / blocking：`gh issue edit <n> --add-blocked-by <m>`、`--add-blocking <m>`
- relates to：`nix/tools/issue.sh relate <n> <m>`
- duplicate：`gh issue close <n> --reason duplicate --duplicate-of <m>`

### pkg（工作区包归属）

对应 `vuna.toml` 的成员包：`pkg:compiler`、`pkg:compiler-base`、`pkg:ir`、
`pkg:target-ocaml`、`pkg:target-native`、`pkg:target-wasm`、`pkg:plugin-web`、
`pkg:dev`、`pkg:base`、`pkg:plugin-kit`、`pkg:toolchain`、`pkg:cli`、`pkg:http`、
`pkg:web`、`pkg:web-cli`、`pkg:obs`。

`pkg:*` 表示“改到了哪个包”，由路径自动派生；主要用于筛选、归属和 fallback。
一个 PR 可以有多个 `pkg:*`。

### area（门禁选择）

`area:*` 表示包内子系统或跨包面：`compiler-frontend`、`compiler-core`、`ir`、
`codegen-ocaml`、`codegen-native`、`codegen-wasm`、`base`、`runtime`、`toolchain`、
`obs`、`editor`、`web`、`seed`、`tests`、`ci`、`docs`、`repo`。

`area:*` 优先决定 `gates` 要跑哪些检查；suite 侧映射到 `nix/checks/slices.nix` 的
area 切片（只跑该影响面的夹具，完整覆盖由 nightly 的 `suite` 组兜底）。没有 area 时用
`pkg:*` 映射到默认 scope，两者都没有时用 `area:repo`。

### 控制

- `needs-refinement`：等待 agent 查重、补全内容与元信息。
- `needs-info`：等待用户补充信息。
- `blocked`：PR 的 hold 标记（automerge 会让出队列）；issue 侧阻塞用原生 blocked by。
- `main-red`：main 门禁失败事故单与修复 PR（由 `main-red.yml` 维护）。
- `breaking`：破坏性改动。
- `no-issue`：PR 不关联 issue（PR-only 改动的默认做法）。
- `deep` / `suite` / `browser`：手动强制跑整组门禁。
- `backend`：后端矩阵提示；wasm / native 矩阵只在定时 / 手动跑，本地先跑
  `nix run .#ci -- backends|native`。
- `seed`：seed 轮换，优先合并。

### 债务

- `debt`：从旧债务清单迁移的未关闭债务；
- `debt:A` / `debt:B` / `debt:C` / `debt:D`：原分类（补丁 / 能力缺口 / 近似 / 结构妥协）；
- `debt:silent`：后果是静默错误；
- `debt:trigger`：触发条件型；
- `debt:future`：长期能力缺口，当前不排期。

文档和注释引用 issue 统一写 `gh#N`；issue 正文的 `Legacy-Debt: Dxx` 只用于迁移追溯。

标签定义在 [`.github/labels.yml`](../../.github/labels.yml)，由
`nix/tools/github-labels.sh` 同步；旧标签用 `--migrate` 迁移。issue status、issue type 与
Priority 字段不在标签表里。

## PR 与 issue 联动

issue 可选：PR-only 改动加 `no-issue` 标签即可；需要关联时在描述里写 `Closes #N` 或
`Refs #N`（`gates / run` 检查）。文档里的 issue 引用写 `gh#N`，不写裸 `#N`。

`pr-triage` 在 PR 打开/更新时自动：

- 从标题的 Conventional Commits 前缀同步 `type:*`（标题缺失时用关联 issue 的 issue type）；
- 从改动路径派生 `pkg:*` / `area:*`，并从关联 issue 补齐缺失的 `pkg` / `area`；
- 从关联 issue 继承 milestone；
- 按 PR 的 draft / ready 状态推进关联 issue 的原生 status（`Refs #N` 与 `Closes #N` 都覆盖）；
  PR 关闭但未合并时回到 Todo。

PR 标题与分支名仍按 `<type>/<slug>`、`<type>(scope): 中文描述` 的约定；
`pr-triage` 只负责把约定同步成标签。

## 门禁：type + area 计划器

固定分组仍在 [nix/checks/groups.nix](../../nix/checks/groups.nix)：

| group | 内容 | 何时跑 |
| --- | --- | --- |
| `pr` | fmt / lint / typecheck | 所有 PR、`merge_group`、main push（`pr / run`） |
| `gate` / `gate-shard-0..3` | tests-gate（fast+integration）+ 单测；CI 里拆 4 片并行 | `merge_group`、main push、定时、手动 |
| `e2e-shard-0..7` | tests-e2e（steps / 长 case）8 片并行 | 定时、手动 |
| `units` | 各包 `vuna test`（与 suite 解耦） | `merge_group`、main push、定时、手动 |
| `deep` | pr + 全部便宜门禁 | 定时、手动、`deep` 标签 |
| `suite` | tests-gate + units + tests-e2e（未分片） | 本地全量；`suite` 标签 |
| `backends` | wasm / native suite 矩阵（fast+integration + 全包单测） | 定时、手动 |
| `native` | native 自举 conformance（selfhost + parity + corpus） | 定时、手动 |
| `browser` | 浏览器 smoke | 定时、手动、`browser` 标签 |

PR 的增量检查由 [nix/checks/pr-gates.nix](../../nix/checks/pr-gates.nix) 计算，规则是：

- `type:perf` 取每个 area 的 `perf` 子集；
- 其他 type 取 area 的 default 加 type 的附加检查；
- 多个 area 取并集，去重。

本地预览与执行：

```console
nix run .#ci -- plan type:perf area:base
nix run .#ci -- plan type:bug pkg:compiler
nix run .#ci -- run-plan type:docs area:docs
```

`gates.yml` 同时服务 PR 与 `merge_group`：

1. `detect`：PR 上从 diff 和 issue/PR 标签得到 type + pkg/area；`merge_group` 上从
   `merge_group.base_sha...head_sha` 的完整 diff 取 area，从 `head_ref` 里的组头 PR 取
   type / issue 信息。两条路径产出同一形状的 labels。
2. `suite`：PR 上用 `plan-json` 判断计划是否含完整 gate / e2e，含则起对应 shard matrix；
   `merge_group` 上固定起 `gate-shard-0..3 + units`，覆盖 main push 的完整 suite 基线。
3. `gates`：用 `run-plan --without-suite` 按 labels 跑 area 检查，并汇总 `suite` 结论为
   `gates / run`。

`gates / run` 是 required check：PR 上是轻量切片，`merge_group` 上是完整 gate + units +
area。`detect` 失败或任一 shard 失败都会让它失败，不会因为 job 跳过而卡在 Expected。
`pr / run` 与 `gates / run` 都绿后，PR 才能进入合并队列。

## 合并队列

`automerge.yml` 对非 draft、同仓库分支、没有 `blocked` / `needs-info` / `wontfix`
标签的 PR 打开 GitHub auto-merge；draft 或 hold 标签出现时先把已在队列里的 PR
`dequeuePullRequest`，再关闭 auto-merge。PR 落后于 main 不需要处理——队列会基于最新
`main` + 队前 PR 建临时组合分支并重跑 required checks。

队列只接受 ruleset 里的 `merge_method`（`REBASE`）。GitHub 回归
（[community#209348](https://github.com/orgs/community/discussions/209348)，2026-09 起）后，
已 arm 的 PR 在 required checks 变绿时不再自动进入规则集合并队列，会停在 `CLEAN`；
`autoMergeRequest.mergeMethod` 恒为 `SQUASH`，显式设 `REBASE` 也会被改回，不是原因。
[merge-queue-sweep.yml](../../.github/workflows/merge-queue-sweep.yml) 每 10 分钟把
「已 arm、无 hold、`CLEAN`、不在队列」的 PR 补 enqueue；`automerge.yml` 只负责 arm / disarm。

启用顺序：先合并 workflow 改动（`ci.yml` / `gates.yml` 的 `merge_group` 支持），再跑
[nix/tools/github-branch-protection.sh](../../nix/tools/github-branch-protection.sh) 打开
队列；反过来的话 required checks 在 `merge_group` 上还没有报告者。

队列配置在 [nix/tools/github-branch-protection.sh](../../nix/tools/github-branch-protection.sh)
的 ruleset 里：

- `merge_method: REBASE`，保持线性历史与独立提交；
- `grouping_strategy: HEADGREEN`，只要求组头通过；
- `min_entries_to_merge: 2`、`max_entries_to_merge: 6`、等待 5 分钟；
- `max_entries_to_build: 2`；
- `strict_required_status_checks_policy: false`（队列已经承担 up-to-date 验证）。

因此 **`BEHIND` 不是失败信号**：不要为了追 `main` 反复 rebase。只有 GitHub 报
`mergeable=CONFLICTING` 时才在分支上 `git rebase origin/main && git push --force-with-lease`。
PR 被队列移除时看原因：冲突才 rebase，检查失败就修，超时重新 arm。

队列状态用 helper 查看（`gh` CLI 没有队列子命令，底层是 GraphQL）：

```console
nix/tools/merge-queue.sh status
nix/tools/merge-queue.sh wait <n> [timeout] [interval]
nix/tools/merge-queue.sh dequeue <n>
nix/tools/merge-queue.sh sweep [--dry-run]
```

`wait` 只读轮询（默认 10 秒），**遇到无法自行推进的状态立即退出**，后台会话才不会
永久挂住：`0` 已合并、`1` 关闭未合并、`2` 冲突、`3` 检查失败、`4` changes requested、
`5` 被移出合并队列、`6` draft、`7` 未 arm（宽限期 60 秒，`PR_WATCH_ARM_GRACE` 可调）、
`8` 带 `blocked`/`needs-info`/`wontfix` 标签、`124` 超时。`BEHIND` 与 pending checks
继续等；脚本不 rebase、不改分支。后台守候 PR 用它，不要另写 `sleep` 循环。

需要 hold 时加 `blocked` / `needs-info` 或转 draft；只 `--disable-auto` 不会把已经在队列里的
PR 拿掉。手动 `gh pr merge --rebase` 只用于 break-glass。

main push 仍跑完整 `gate-shards` + `units` 作为合并后兜底。合并由 GitHub 队列执行；
`AUTOMERGE_TOKEN` 仍用于 automerge 的入队身份（细粒度 PAT，仓库 secret，不是 org
secret）：

1. <https://github.com/settings/personal-access-tokens/new> → 只授权 `vuna-lang/vuna`；
2. 权限：Contents = Read and write、Pull requests = Read and write、Workflows = Read and write
   （Metadata 自动只读）；
3. `gh secret set AUTOMERGE_TOKEN --repo vuna-lang/vuna`（交互输入，不进 shell history）。

缺 `workflow` 权限时，包含 `.github/workflows/*` 改动的 PR 会合并不了；OAuth（`gho_`）会话
token 不适合当长期 secret。

`main` 的 ruleset 由 [nix/tools/github-branch-protection.sh](../../nix/tools/github-branch-protection.sh)
管理，required checks 是 `pr / run` 与 `gates / run`。没有 bypass；break-glass 流程见
CONTRIBUTING.md。

## Stacked PR 与合并队列

大任务拆 phase、上层依赖下层代码时用 stacked PR：每层一个 PR，base 指向下一层，bottom 的
base 是 `main`；stack 通过合并队列逐层推进，**不承诺整条原子落库**。排班与并发上限见技能
`vuna-phase`，提交整理与 PR 操作见技能 `vuna-pr`。

机制与实测：

- GitHub 文档把 stack 描述为一个 merge group；但通过 REST `merge-async` 入队时，各层是独立
  entry，队列按 FIFO / HEADGREEN 分组，可能把 bottom 与前序普通 PR 合成一组，其余层被
  eject。2026-11 的 2 层 pilot 实测如此。
- 下层合并后，剩余层会自动 retarget 到 `main`；`sweep` 会把它们重新入队。因此 stack 是
  **有序流水线**，不是原子事务。
- 每层按 **stack base（`main`）** 的 rules 与 required checks 评估，即使直接 base 是下层
  分支；`pull_request` workflow 对每层都跑。
- **每层都必须独立可合并**：seed 能编译该层源码、gates 在该层通过；不要假设“最终组合态
  自洽就够了”。
- 某层被移除 / 弹出队列，上方所有层一起被移除；hold 一层等于挡住上方所有层；修好后由
  `sweep` 重新入队。
- 失去线性历史（下层被改、`main` 前进）时用 `gh stack rebase` 或 PR 的 **Rebase stack**
  恢复；bottom 合并后剩余层自动 retarget。
- `merge_group` 侧每个入队组各跑一次完整门禁；层数越多，总 CI 成本越高。

```console
gh extension install github/gh-stack      # 一次性；要求 gh ≥2.0、git ≥2.36
gh stack init --base main <b1> <b2>       # 建立本地追踪（bottom → top）
gh stack add <b3>                         # 已有追踪时收养新分支
gh stack push                             # 原子推所有层
gh pr create --base <parent> ...          # 每层手动建 PR，标题 / 描述 / 标签自控
gh stack link <pr1> <pr2>                 # 在 GitHub 上建立 stack（只追加，不移除）
gh stack sync                             # fetch + 级联 rebase + push + 同步 PR
gh stack rebase [--continue|--abort]      # 只做级联 rebase；冲突时交互解决
gh stack unstack [--local]                # 解散 stack；--local 只清本地追踪
nix/tools/merge-queue.sh sweep        # checks 绿后整条入队（stack 不依赖 auto-merge）
# nix/tools/merge-queue.sh enqueue <top>  # 手动：所有 open 层 CLEAN 时
```

- stack **不依赖 auto-merge**：GitHub 可能在只想 rebase 的仓库上按默认 squash 校验
  `includeStack` 并拒绝 arm；checks 绿后由 sweep 自动、或手动 `enqueue <top>` 走 REST
  `merge-async` 整条入队。GraphQL
  `enqueuePullRequest` 没有 stack 参数；stack 必须走 REST
  `PUT /repos/{owner}/{repo}/pulls/{n}/merge-async`、`merge_action: merge_queue`（202 即接受，
  脚本不阻塞轮询）。`gh pr merge` 没有 stack flag。
- GraphQL 的 mutation 里只有 auto-merge 认 stack：`enablePullRequestAutoMerge(includeStack: true)` 与
  `autoMergeRequest(includeStack: true)`（`disablePullRequestAutoMerge` 同名参数）。
- `Closes #N` 只放 bottom；上层用 `Refs #N` 或 `no-issue`。否则上层合并时 issue 已经关闭。
- 合并后用 `gh stack sync`（或 `gh stack rebase` + `gh stack push`）级联；整条 stack 完成后再
  `gh stack sync --prune` / `gh stack unstack`，然后 teardown 各 phase worktree。
- 远端写（push / PR / 标签 / arm / enqueue / merge / teardown）只由 orchestrator 执行；
  phase agent 只改代码、跑验证、commit。

限制与代价：

- stack 要求所有分支在同一仓库，跨 fork 不支持。
- 每 stack ≤3 层；全局 ≤4 个 open layer；队列 ≤3 entry；2 个 dev 槽（见技能 `vuna-phase`）。
- CI 不为 stack 缩减检查：`pull_request` 每层都跑，`merge_group` 按入队组完整跑；单次耗时
  按实测。层数是门禁成本的乘数。
- **seed**：rotation 放在真正改变 codegen 的那一层；如果多层都改 codegen，每层各自带
  rotation；上层不改 codegen 就不碰 `seed/`。每层都必须独立满足「当前 seed 编译当前源码」，
  不能把 rotation 推到后续层。
- hold 用 `blocked` / `needs-info` / draft；它挡住上方所有层，解除后由 sweep 直接入队，
  不要逐层重试。

## main 红灯

`main` 的 `ci` 失败时，[main-red.yml](../../.github/workflows/main-red.yml) 维护唯一的
`main-red` issue：失败创建/追加失败 job 与相关 PR，恢复绿自动关闭。

- 修复前先 `gh issue list --label main-red --state open`；
- issue 已有 assignee 或状态 `In progress` 时让出，不要开第二个修复 PR；
- 没有认领时评论 claim，再
  `gh issue edit <n> --add-assignee @me` 与 `nix/tools/issue.sh status <n> in-progress`；
- 修复 PR 写 `Closes #<n>` 并加 `main-red` 标签；
- [main-red-guard.yml](../../.github/workflows/main-red-guard.yml) 会把第二个引用同一
  issue 的 PR 加 `blocked` 并移出队列；换人时先在 issue 上 unassign；
- `main` 未恢复绿时不要给无关 PR arm auto-merge。

## 常用查询

```console
gh issue list --search 'status:todo'
gh issue list --search 'status:backlog' --label needs-refinement
gh issue list --type Epic
gh issue list --label main-red --state open
gh issue list --milestone "native 自举"
gh issue list --label pkg:compiler --state all --search "elab in:title,body"
gh api "repos/vuna-lang/vuna/issues?issue_field_values=priority:High" --jq '.[].number'
nix/tools/issue.sh show <n>
gh pr view <n> --json autoMergeRequest,labels,isDraft
gh pr checks <n>
gh stack view --short
gh stack view --json
nix/tools/merge-queue.sh status
```

## 故障

- `gates / run` 一直 Expected：确认 `gates.yml` 在当前分支已生效，且 `detect` job 有结论；
  首次上线时先在测试 PR 上确认实际 check 名，再写进 ruleset。
- `gates` 选错检查：先在本地跑 `nix run .#ci -- plan <labels>`，再检查 PR 的 `type:*` /
  `pkg:*` / `area:*` 是否完整。
- PR 一直 `BEHIND`：正常；合并队列会在最新 main 上重新验证，不要 rebase。
- PR 全绿（`CLEAN`）但一直不进队列：GitHub 回归（community#209348），armed PR
  不再自动入队。`merge-queue-sweep.yml` 会每 10 分钟补 enqueue；手动用
  `nix/tools/merge-queue.sh sweep [--dry-run]` 或 `enqueue <n>`。`mergeMethod` 恒为
  `SQUASH` 是已知表现，不是原因。
- 队列一直等 check：确认 `ci.yml` / `gates.yml` 有 `merge_group` 触发器，且 `gates / run`
  在组合 head 上有结论；检查 `merge_group.head_ref` 是否能解析出 PR 号。
- PR 被移出队列：看 PR 时间线的原因；冲突才 rebase，检查失败就修，超时重新 arm。
- stack 的某层不能合并：确认它下方的所有层都满足 rules、且 stack 保持线性；合并框要求
  **Rebase stack** 时先级联（`gh stack rebase`），不要单独重试该层。
- stack 入队后只落了前几层：队列按组推进，剩余层留在后续组；某层被 eject 时上方一起移除，
修根因后由 sweep 重新入队。
- `gh stack link` 报 “has auto-merge enabled”：先对每层 `merge-queue.sh disarm <pr>`；或把 PR
  先开成 draft，`link` 完再 `ready_for_review`，让 automerge 按 stack 整条处理。stack 入队
  由 sweep 负责，不依赖 arm。
- `gh stack` 不存在：`gh extension install github/gh-stack`；`gh stack` 与 `gh pr merge` 的
  行为不同，合 stack 不要用后者。
- `gh stack view` 报 “belongs to multiple stacks”：本地追踪同时存在多条 stack；用
  `gh stack checkout <stack-number>` 选择，或对已完成的追踪 `gh stack unstack --local` 清理。
- `gh pr checks` 看不到队列：用 `nix/tools/merge-queue.sh status`；队列状态只在 GraphQL。
- auto-merge 没打开：确认 PR 非 draft、同仓库、没有 hold 标签；队列启用后不再需要
  `strict up-to-date`。
- `main-red` issue 重复：确认 `main-red.yml` 已合入 main；guard 依赖同一个 issue 的
  assignee 与状态。
- `pr-triage` / `automerge` / `main-red-guard` 没跑：它们用 `pull_request_target`，workflow
  从默认分支读取；修改必须先合入 main 才会对该 PR 生效。
- `issue.sh status` 写不进去：确认 issue 未关闭（关闭的 issue 不能设 open 类状态）；
  status 是 public preview，仓库未开通时 REST 会忽略该字段。
- 标签迁移失败：先跑 `nix/tools/github-labels.sh --sync`，再跑 `--migrate`；脚本只加新标签、
  删旧标签，不直接重命名。
- 没有 `pkg:*` / `area:*`：`nix/tools/pr-labels.sh` 对路径做映射；新增目录时同步补映射与
  `pr-gates.nix`。