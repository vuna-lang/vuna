# Issue / PR / 门禁协作

本页是仓库的 GitHub 工作流说明：issue 状态机、标签含义、PR 与 issue 的联动、
按 `type + area` 选择的 PR 门禁、合并队列，以及 main 红灯的认领流程。分支与提交整理见
[CONTRIBUTING.md](../../CONTRIBUTING.md) 与技能 `vuna-pr`；门禁语义见
[testing-checks.md](testing-checks.md)。

## 状态机

Issue 的打开/关闭是唯一的状态边界：**closed = Done**；打开期间用 `status:*` 标签表示进度。

```text
open issue
  status:backlog
      │ 加 milestone / assignee
      ▼
  status:todo
      │ 开分支 / draft PR
      ▼
  status:in-progress
      │ PR ready_for_review
      ▼
  status:in-review
      │ PR merged（Closes #N）
      ▼
   issue closed = Done
```

- 新 issue 默认 `status:backlog`。
- 加 assignee 或 milestone 时，`backlog` 自动进入 `todo`；已经是 `in-progress` /
  `in-review` 的状态不会被下调。
- PR 关闭但未合并时，关联 issue 回到 `status:todo`，并留一条自动评论。
- issue 关闭时自动移除所有 `status:*`；PR 用 `Closes #N` 合入时由 GitHub 原生关闭。
- 同一 issue 只保留一个 `status:*`；手动加第二个会被 workflow 收敛。
- 当前没有 `status:in-preview`：合并即进入 `in-review` 的终点，验证完成后关闭 issue。

## backlog 的两类入口

### 人类一句话 idea

用 `想法 / 方向` 模板创建：标题 + 一句话即可，自动带 `status:backlog` 和
`needs-refinement`。Agent 处理时：

1. 先查重：
   ```console
   gh issue list --state all --search "<关键词> in:title,body" --limit 20
   ```
2. 在 issue 里讨论，补全背景、目标 / 非目标、方案、验收标准。
3. 打 `type:*`、`pkg:*`、`area:*`，按需加 priority / milestone。
4. 建立 parent epic、sub-issue、`blocked by`、related，写来源链接。
5. 移除 `needs-refinement`；未排期保持 `status:backlog`，已排期改 `status:todo`。
6. 确认重复：关闭为 `duplicate`，链接 canonical issue，不新建。

`needs-refinement` 表示“内容或元信息还没准备好”，不是优先级；等待用户回答时也可以同时加
`needs-info`。

### Agent 发现的后继任务

Agent 在开发、评审或门禁失败时发现问题：

1. 创建前搜索 open + closed issue；已有相同问题就评论补充，不重复建。
2. 正文写清来源（PR / issue / commit / `file:line`）、影响面、建议方案、验收标准。
3. 直接打 `type:*`、`pkg:*`、`area:*`，默认 `status:backlog`；属于方向时挂到 epic 的
   sub-issue。
4. 与当前改动相关时在新 issue 里链接来源 PR / issue。

## 标签

### type（恰一个）

`type:bug`、`type:feature`、`type:refactor`、`type:perf`、`type:docs`、`type:test`、
`type:chore`、`type:epic`。

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
- `blocked`：被依赖或外部条件阻塞。
- `main-red`：main 门禁失败事故单与修复 PR（由 `main-red.yml` 维护）。
- `breaking`：破坏性改动。
- `no-issue`：PR 不关联 issue（PR-only 改动的默认做法）。
- `deep` / `suite` / `browser`：手动强制跑整组门禁。
- `backend`：后端矩阵提示；GitHub CI 不跑 wasm/native 矩阵，只在本地
  `nix run .#ci -- backends|native`。
- `seed`：seed 轮换，优先合并。

### 债务

- `debt`：从旧债务清单迁移的未关闭债务；
- `debt:A` / `debt:B` / `debt:C` / `debt:D`：原分类（补丁 / 能力缺口 / 近似 / 结构妥协）；
- `debt:silent`：后果是静默错误；
- `debt:trigger`：触发条件型；
- `priority:P0` … `priority:P3`：优先级，不替代 `status:*`。

文档和注释引用 issue 统一写 `gh#N`；issue 正文的 `Legacy-Debt: Dxx` 只用于迁移追溯。

标签定义在 [`.github/labels.yml`](../../.github/labels.yml)，由
`nix/tools/github-labels.sh` 同步；旧标签用 `--migrate` 迁移。

## PR 与 issue 联动

issue 可选：PR-only 改动加 `no-issue` 标签即可；需要关联时在描述里写 `Closes #N` 或
`Refs #N`（`gates / run` 检查）。文档里的 issue 引用写 `gh#N`，不写裸 `#N`。

`pr-triage` 在 PR 打开/更新时自动：

- 从标题的 Conventional Commits 前缀同步 `type:*`（标题缺失时用关联 issue 的 type）；
- 从改动路径派生 `pkg:*` / `area:*`，并从关联 issue 补齐缺失的 `pkg` / `area`；
- 从关联 issue 继承 milestone；
- 按 PR 的 draft / ready 状态推进关联 issue 的 `status:*`。

PR 标题与分支名仍按 `<type>/<slug>`、`<type>(scope): 中文描述` 的约定；
`pr-triage` 只负责把约定同步成标签。

## 门禁：type + area 计划器

固定分组仍在 [nix/checks/groups.nix](../../nix/checks/groups.nix)：

| group | 内容 | 何时跑 |
| --- | --- | --- |
| `pr` | fmt / lint / typecheck | 所有 PR、`merge_group`、main push（`pr / run`） |
| `gate` / `gate-shard-0..3` | tests-gate（fast+integration）+ 单测；CI 里拆 4 片并行 | `merge_group`、main push、定时、手动 |
| `e2e-shard-0..3` | tests-e2e（steps / 长 case）4 片并行 | 定时、手动 |
| `units` | 各包 `vuna test`（与 suite 解耦） | `merge_group`、main push、定时、手动 |
| `deep` | pr + 全部便宜门禁 | 定时、手动、`deep` 标签 |
| `suite` | tests-gate + units + tests-e2e（未分片） | 本地全量；`suite` 标签 |
| `backends` | wasm / native suite 矩阵 | 本地手动 |
| `native` | native 自举 conformance | 本地手动 |
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
nix/tools/merge-queue.sh wait <n> [timeout]
nix/tools/merge-queue.sh dequeue <n>
```

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

## main 红灯

`main` 的 `ci` 失败时，[main-red.yml](../../.github/workflows/main-red.yml) 维护唯一的
`main-red` issue：失败创建/追加失败 job 与相关 PR，恢复绿自动关闭。

- 修复前先 `gh issue list --label main-red --state open`；
- issue 已有 assignee 或 `status:in-progress` 时让出，不要开第二个修复 PR；
- 没有认领时评论 claim，再
  `gh issue edit <n> --add-assignee @me --add-label status:in-progress`；
- 修复 PR 写 `Closes #<n>` 并加 `main-red` 标签；
- [main-red-guard.yml](../../.github/workflows/main-red-guard.yml) 会把第二个引用同一
  issue 的 PR 加 `blocked` 并移出队列；换人时先在 issue 上 unassign；
- `main` 未恢复绿时不要给无关 PR arm auto-merge。

## 常用查询

```console
gh issue list --label status:todo
gh issue list --label status:backlog --label needs-refinement
gh issue list --label main-red --state open
gh issue list --milestone "native 自举"
gh issue list --label pkg:compiler --state all --search "elab in:title,body"
gh pr view <n> --json autoMergeRequest,labels,isDraft
gh pr checks <n>
nix/tools/merge-queue.sh status
```

## 故障

- `gates / run` 一直 Expected：确认 `gates.yml` 在当前分支已生效，且 `detect` job 有结论；
  首次上线时先在测试 PR 上确认实际 check 名，再写进 ruleset。
- `gates` 选错检查：先在本地跑 `nix run .#ci -- plan <labels>`，再检查 PR 的 `type:*` /
  `pkg:*` / `area:*` 是否完整。
- PR 一直 `BEHIND`：正常；合并队列会在最新 main 上重新验证，不要 rebase。
- 队列一直等 check：确认 `ci.yml` / `gates.yml` 有 `merge_group` 触发器，且 `gates / run`
  在组合 head 上有结论；检查 `merge_group.head_ref` 是否能解析出 PR 号。
- PR 被移出队列：看 PR 时间线的原因；冲突才 rebase，检查失败就修，超时重新 arm。
- `gh pr checks` 看不到队列：用 `nix/tools/merge-queue.sh status`；队列状态只在 GraphQL。
- auto-merge 没打开：确认 PR 非 draft、同仓库、没有 hold 标签；队列启用后不再需要
  `strict up-to-date`。
- `main-red` issue 重复：确认 `main-red.yml` 已合入 main；guard 依赖同一个 issue 的 assignee。
- `pr-triage` / `automerge` / `main-red-guard` 没跑：它们用 `pull_request_target`，workflow
  从默认分支读取；修改必须先合入 main 才会对该 PR 生效。
- 标签迁移失败：先跑 `nix/tools/github-labels.sh --sync`，再跑 `--migrate`；脚本只加新标签、
  删旧标签，不直接重命名。
- 没有 `pkg:*` / `area:*`：`nix/tools/pr-labels.sh` 对路径做映射；新增目录时同步补映射与
  `pr-gates.nix`。