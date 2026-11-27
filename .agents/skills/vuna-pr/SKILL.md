---
name: vuna-pr
description: 在 vuna 仓库开、更新、合并 GitHub PR 时使用——开 PR 前的 rebase -i 提交整理、type/pkg/area 自动标签与 gates 计划、等待 pr/gates 门禁、auto-merge、worktree 收尾与 break-glass。用户说「开 PR」「提 PR」「走 PR 流程」「合并 PR」时加载。
---

# vuna 的 GitHub PR 流程

`main` 只读；所有改动经 PR 合入。规则背景见
[workflow.md](../../rules/workflow.md)，验证矩阵见 [verification.md](../../rules/verification.md)。

## 0. 前置检查

```console
git rev-parse --show-toplevel          # 必须在副 worktree
git branch --show-current              # 不能是 main
git status --short                     # 应为干净；脏就先提交或放 _scratch/
```

主工作区路径用 `git worktree list` 找 `[main]` 那一行。issue 可选：PR-only 改动加
`no-issue` 标签；需要追踪的复杂工作再按技能 `vuna-issue` 建/领并标 `status:in-progress`。

如果 `main` 是红的（`gh issue list --label main-red --state open`），先按
[workflow.md §6](../../rules/workflow.md) 认领；已被别人认领就让出，不要另开修复 PR。

## 1. 开 PR 前：rebase + 整理提交

```console
git fetch origin
git rebase origin/main      # 可选：只为整理历史；不要求追上最新 main
git rebase -i origin/main
nix run .#ci -- pr
```

- 用 `squash` / `fixup` 合并 WIP，`reword` 写清意图，按逻辑重排。
- 不允许残留 `fixup!` / `squash!` / `WIP`；一个提交只做一件事。
- `chore(seed): ...` 保持独立提交，不压进特性提交。
- 整理完分支必须是线性的：`git rev-list --merges origin/main..HEAD` 无输出。
- 开 PR 后不要因为其他 PR 合入、自己变成 `BEHIND` 就反复 rebase；只有冲突才 rebase。

## 2. 推送并创建 PR

```console
git push -u origin HEAD
gh pr create --base main --title "<type(scope): 中文描述>" \
  --body-file /tmp/opencode/pr-body.md
```

- 能自动生成标题与描述时优先用全局技能 `github-pr-create`；标题用主提交的
  Conventional Commits 标题。
- 描述必须包含 `.github/pull_request_template.md` 的「跑过 / 没跑」、seed 与后端影响；
  有关联 issue 时写 `Closes #N` 或 `Refs #N`，PR-only 改动加 `no-issue` 标签。
- 需要草稿时加 `--draft`；草稿会跑 `pr` 与 `gates`，但 auto-merge 关闭。

## 3. 门禁：自动计划，不手工选组

PR 的必需检查是 `pr / run` 与 `gates / run`。`pr-triage` 会根据标题、路径与关联 issue
自动维护 `type:*`、`pkg:*`、`area:*`；PR 上 `gates.yml` 用这些标签选出 area 切片
（suite 侧是 `nix/checks/slices.nix`），`merge_group` 上同一个 `gates / run` 固定跑
完整 `gate-shard-0..3 + units` + area 计划，作为合并队列的最终验证。不需要手工加
`deep` / `suite`；main push 仍跑完整 `gate` 作为合并后兜底。

```console
nix run .#ci -- plan type:bug pkg:compiler   # 本地预览将跑哪些检查
gh pr checks <n>                             # PR 自己的检查
nix/tools/merge-queue.sh status              # 队列位置 / 状态 / ETA
```

需要强制整组时再手动加标签：

| 标签 | 作用 |
| --- | --- |
| `deep` | 跑完整便宜门禁 |
| `suite` | 跑 tests-gate + tests-e2e |
| `browser` | 跑浏览器 smoke |
| `backend` | 只作为本地 `nix run .#ci -- backends|native` 的提示 |

`backend` / `native` 目前不在 GitHub CI 跑；改后端时在 PR 里写清本地跑过哪些。
标签加错可以 `gh pr edit <n> --remove-label <name>`；`gates` 的 concurrency 会取消旧运行。

## 4. 更新 PR

改动后重新整理，不要叠加脏提交：

```console
git commit -am "fix(scope): ..."
git fetch origin
git rebase -i origin/main
git push --force-with-lease
```

force push 只对特性分支使用；`main` 受保护，永远不要对它 force push。

## 5. 合并

非 draft、同仓库分支、无 `blocked` / `needs-info` / `wontfix` 的 PR 会自动打开
GitHub auto-merge；required checks 全绿后进入合并队列。队列在**最新 main + 队前 PR** 的
组合 head 上重跑 `pr / run` 与完整 `gates / run`，绿后自动 rebase 落 `main`。

```console
nix/tools/merge-queue.sh status
gh pr view <n> --json autoMergeRequest,labels,isDraft
```

- 只允许 rebase merge；不要用 squash / merge commit。
- **`BEHIND` 不是失败，不要 rebase**；队列会把 PR 排到最新 main 后面。只有冲突
  （`mergeable=CONFLICTING`）时才 `git rebase origin/main && git push --force-with-lease`。
- 需要 hold 时加 `blocked` / `needs-info` 或转 draft；automerge 会把已在队列里的 PR
  显式 dequeue（只 disable auto-merge 不够）。解除 hold 后会重新 arm。
- 队列把 PR 移除时先看原因：冲突才 rebase；检查失败就修；超时重新 arm。
- 不要手动 merge 绕过 required checks；手动 `gh pr merge <n> --rebase` 只用于 break-glass
  或用户明确要求。
- 用 `nix/tools/merge-queue.sh dequeue <n>` 手动移出队列；`wait <n>` 只在明确要阻塞等结果时用。

## 6. seed 轮换 PR

- 轮换放在同一个 PR，独立 `chore(seed): ...` 提交；PR 加 `seed` 标签。
- rebase 到最新 `origin/main` 时如果 `seed/` 冲突：abort，先 rebase 非 seed 提交，再重新
  `nix build .#vuna --out-link result && sh nix/seed/rotate.sh ./result/bin/vuna`。
  **不要**手选 `seed/` 冲突两侧。
- 合并用 rebase，保证 `chore(seed)` 独立落库；其他打开的 PR 不需要跟着 rebase，队列会在
  最新 `main` 上重新验证；只有 `seed/` 冲突时才按上面的流程处理。

## 7. break-glass

`main` 的 ruleset 没有 bypass。CI 自身坏了导致无法合并时：

1. 先确认失败是 workflow / runner 问题，不是代码问题；
2. 用管理员权限临时把 ruleset 的 `enforcement` 设为 `disabled` 或临时移除 required check；
3. 修复后**立即**恢复 ruleset 并重跑 `nix/tools/github-branch-protection.sh`；
4. 在 PR 描述里记录临时变更与恢复时间。

不要用 `--admin` 合并绕过检查作为常规手段。

## 8. 汇报模板

```markdown
## PR
- 编号 / 链接：
- 分支 → main
- 提交：<sha> <subject> …
- 标签：type / pkg / area / 手动 gate
- 门禁：pr / run 绿；gates / run 绿或失败原因
- 状态：auto-merge 已 arm / 队列 position N / 已合并 <sha> / 已 hold（原因）
```