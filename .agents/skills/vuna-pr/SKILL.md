---
name: vuna-pr
description: 在 vuna 仓库开、更新、合并 GitHub PR 时使用——开 PR 前的 rebase -i 提交整理、按改动面加 deep/suite/backend 标签、等待门禁、rebase merge、worktree 收尾与 break-glass。用户说「开 PR」「提 PR」「走 PR 流程」「合并 PR」时加载。
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

主工作区路径用 `git worktree list` 找 `[main]` 那一行。

## 1. 开 PR 前：rebase + 整理提交

```console
git fetch origin
git rebase origin/main
git rebase -i origin/main
nix run .#ci -- pr
```

- 用 `squash` / `fixup` 合并 WIP，`reword` 写清意图，按逻辑重排。
- 不允许残留 `fixup!` / `squash!` / `WIP`；一个提交只做一件事。
- `chore(seed): ...` 保持独立提交，不压进特性提交。
- 整理完分支必须是线性的：`git rev-list --merges origin/main..HEAD` 无输出。

## 2. 推送并创建 PR

```console
git push -u origin HEAD
gh pr create --base main --title "<type(scope): 中文描述>" \
  --body-file /tmp/opencode/pr-body.md
```

- 能自动生成标题与描述时优先用全局技能 `github-pr-create`；标题用主提交的
  Conventional Commits 标题。
- 描述必须包含 `.github/pull_request_template.md` 的「跑过 / 没跑」、seed 与后端影响。
- 需要草稿时加 `--draft`；草稿也会跑 `pr` 检查。

## 3. 标签门禁（按改动面）

PR 的必需检查只有 `pr / run`。其余组由标签在
`.github/workflows/label-checks.yml` 里触发，不是 GitHub required，但**加了就必须等绿**：

| 改动面 | 标签 | 等待的组 |
| --- | --- | --- |
| `packages/compiler/` / `base/` / `ir/` / `target-ocaml/` / `nix/` / `seed/` | `deep` | deep |
| `test/`、语言/运行时行为 | `suite` | suite |
| `packages/target-native/` / `target-wasm/` / 运行时 | `backend` | backends + native |
| `wasm-host/`、浏览器可跑面 | `browser` | browser |
| 只改文档 / `.github` / `.agents` | 无 | pr |

```console
gh pr edit <n> --add-label deep,suite,backend
gh pr checks <n> --watch
```

加标签不会取消正在跑的 `pr`；长尾在独立 workflow 里跑。标签加错可以
`gh pr edit <n> --remove-label <name>` 取消对应运行（workflow 的 concurrency 会处理）。

## 4. 更新 PR

改动后重新整理，不要叠加脏提交：

```console
git commit -am "fix(scope): ..."
git fetch origin
git rebase -i origin/main
git push --force-with-lease
```

force push 只对特性分支使用；`main` 受保护，永远不要对它 force push。

## 5. 合并（需用户明确授权）

```console
gh pr checks <n> --watch
gh pr merge <n> --rebase
```

- 只允许 rebase merge；不要用 squash / merge commit。
- 加了 `deep` / `suite` / `backend` 标签时，合并前确认对应 workflow 已绿。
- 在副 worktree 内**不要**加 `--delete-branch`（本地分支被 checkout，删除会失败）；
  先合并，再 teardown 时删分支。

合并后收尾：

```console
git -C <MAIN_ROOT> pull --ff-only
~/.config/opencode/skills/worktree/scripts/worktree-teardown.sh --json \
  --main <MAIN_ROOT> --worktree <WORKTREE> --branch <BRANCH> --delete-branch
```

teardown 前确认 `git -C <MAIN_ROOT> log --oneline -1` 已包含 PR 的提交；teardown 失败就保留
worktree，不要强删。

## 6. seed 轮换 PR

- 轮换放在同一个 PR，独立 `chore(seed): ...` 提交；PR 加 `seed` 标签。
- rebase 到最新 `origin/main` 时如果 `seed/` 冲突：abort，先 rebase 非 seed 提交，再重新
  `nix build .#vuna --out-link result && sh nix/seed/rotate.sh ./result/bin/vuna`。
  **不要**手选 `seed/` 冲突两侧。
- 合并用 rebase，保证 `chore(seed)` 独立落库；其他打开的 PR 在它合并后重新 rebase。

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
- 标签：deep / suite / backend / 无
- 门禁：pr 绿；deep 绿；suite 未跑（原因）
- 状态：待合并 / 已合并 <sha> / 等待用户授权
```