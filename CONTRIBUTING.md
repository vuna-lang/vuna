# 贡献流程

`main` 受保护：所有改动（源码、文档、`seed/` 轮换）都通过 GitHub Pull Request 合入。
本地 `main` 只用于读取与 `git pull --ff-only`。

更细的 agent 规则在 [`.agents/rules/`](.agents/rules/)，PR 操作手册在
[`.agents/skills/vuna-pr/SKILL.md`](.agents/skills/vuna-pr/SKILL.md)，issue / 标签 /
门禁 / 自动合并的完整说明在 [docs/reference/github-workflow.md](docs/reference/github-workflow.md)。

## 1. 准备

先确认已有 issue；没有就按 [`.agents/skills/vuna-issue/SKILL.md`](.agents/skills/vuna-issue/SKILL.md)
查重后创建或精炼。领取时把 issue 标成 `status:in-progress` 并 assign 给自己。

```console
gh issue edit <n> --add-assignee @me --add-label status:in-progress
git fetch origin
git switch -c <type>/<n>-<slug> origin/main
git config core.hooksPath .githooks   # devShell / direnv 会自动设置
```

- 分支名用 `<type>/<slug>`：`feat/`、`fix/`、`docs/`、`chore/`、`refactor/`、`test/`；
  关联 issue 时形如 `fix/123-slug`。也可以用 `gh issue develop <n> --name ... --checkout`。
- 本地开发建议放独立 worktree：`~/.local/share/opencode/worktree/…` 或 `.local/worktrees/…`。

## 2. 开发与本地验证

```console
nix run .#vuna -- check .
nix run .#vuna -- fmt <改动的文件/目录>
nix run .#vuna-run-tests -- --only <owner/family>
nix run .#ci -- pr
```

按改动面选测试，矩阵见 [`docs/architecture.md`](docs/architecture.md) 的「改一处 → 跑什么」与
[`.agents/rules/verification.md`](.agents/rules/verification.md)。临时探针放 `_scratch/`（已 gitignore）。

## 3. 提交与整理

提交信息用 `type(scope): 中文描述`，一次提交只做一件事；`seed/` 轮换独立成
`chore(seed): ...`。开 PR 前必须整理分支：

```console
git fetch origin
git rebase origin/main
git rebase -i origin/main
nix run .#ci -- pr
```

用 squash / fixup 合并 WIP，reword 写清意图；**PR 分支里不允许 `fixup!` / `squash!` / `WIP`
提交，也不允许 merge commit**（`.githooks/pre-push` 会拒绝 merge commit 和直推 `main`）。

`.githooks/pre-commit` 会跑全仓库 `fmt --check`、`lint --max-warnings 0`、`check .`。
`chore(seed):` 轮换这类刚重建过整链的提交用 `VUNA_SKIP_HOOKS=1`；不要用 `--no-verify`
掩盖真正失败。

## 4. 开 PR

```console
git push -u origin HEAD
gh pr create --base main --title "<type(scope): 中文描述>" --body-file <file>
```

描述按 [`.github/pull_request_template.md`](.github/pull_request_template.md) 填写，必须写清
`Closes #N` / `Refs #N`、「跑过什么 / 没跑什么」、seed 与后端影响。

## 5. PR 门禁

必需检查是 `pr / run`（fmt + lint + 自检）与 `gates / run`（按 `type` + `pkg` / `area`
自动选择检查）。`pr-triage` 会自动维护 type / pkg / area 标签，不需要手工加
`deep` / `suite`：

```console
nix run .#ci -- plan type:bug pkg:compiler   # 预览本 PR 会跑哪些检查
gh pr checks <n> --watch
```

需要强制整组时再加 `deep` / `suite` / `browser`。`backends` / `native` 暂不在 GitHub CI
跑，只在本地手动；改后端时在 PR 描述里写清跑过哪些。
分组与清单见 [`docs/reference/testing-checks.md`](docs/reference/testing-checks.md)，
选择规则见 [`docs/reference/github-workflow.md`](docs/reference/github-workflow.md)。

## 6. 合并

`main` 只允许 **rebase merge**（merge commit 与 squash 关闭）。非 draft、同仓库分支、无
`blocked` / `needs-info` / `wontfix` 的 PR 会自动打开 auto-merge；`pr / run` 与
`gates / run` 全绿且分支与 `main` 同步后自动合并：

```console
gh pr checks <n> --watch
gh pr view <n> --json autoMergeRequest,labels,isDraft
```

需要 hold 时加 `blocked` / `needs-info` 或转 draft。分支落后时重新
`git rebase -i origin/main`，然后 `git push --force-with-lease`；不要对 `main` force push。
不要手动 merge 绕过 required checks。合并后：

```console
git -C <MAIN_ROOT> pull --ff-only
```

## 7. seed 轮换

- 轮换放在同一个 PR，独立 `chore(seed): ...` 提交；PR 加 `seed` 标签并优先合并。
- rebase 到最新 `origin/main` 时如果 `seed/` 冲突：abort，先 rebase 非 seed 提交，再重新
  `nix build .#vuna --out-link result && sh nix/seed/rotate.sh ./result/bin/vuna`。
  **不要手选 `seed/` 冲突两侧。**
- 合并用 rebase，保证 `chore(seed)` 独立落库；其他打开的 PR 在它合并后重新 rebase。

## 8. 分支保护与 break-glass

`main` 的 ruleset 由 `nix/tools/github-branch-protection.sh` 管理（幂等）：

```console
nix/tools/github-branch-protection.sh --dry-run   # 先看将写入的规则
nix/tools/github-branch-protection.sh --consolidate
```

ruleset 没有 bypass。CI 自身坏了导致无法合并时，临时停用 ruleset / 移除 required check，
修复后立即恢复并重跑脚本；在 PR 描述里记录临时变更与恢复时间。不要把 `--admin` 合并当作常规手段。