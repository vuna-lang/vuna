# 贡献流程

`main` 受保护：所有改动（源码、文档、`seed/` 轮换）都通过 GitHub Pull Request 合入。
本地 `main` 只用于读取与 `git pull --ff-only`。

更细的 agent 规则在 [`.agents/rules/`](.agents/rules/)，PR 操作手册在
[`.agents/skills/vuna-pr/SKILL.md`](.agents/skills/vuna-pr/SKILL.md)，issue / 标签 /
门禁 / 合并队列的完整说明在 [docs/reference/github-workflow.md](docs/reference/github-workflow.md)。

## 1. 准备

issue 可选：PR-only 的改动直接切分支，PR 加 `no-issue` 标签；需要追踪的复杂工作再按
[`.agents/skills/vuna-issue/SKILL.md`](.agents/skills/vuna-issue/SKILL.md) 查重后创建/精炼，
领取时 assign 给自己并把状态设为 In progress（`nix/tools/issue.sh status <n> in-progress`）。

```console
gh issue edit <n> --add-assignee @me                                  # 有关联 issue 时
nix/tools/issue.sh status <n> in-progress
git fetch origin
git switch -c <type>/<slug> origin/main
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

必需检查是 `pr / run`（fmt + lint + 自检）与 `gates / run`（PR 上按 `type` + `pkg` /
`area` 选择切片；`merge_group` 上跑完整 `gate-shard-0..3 + units` + area）。`pr-triage`
会自动维护 type / pkg / area 标签，不需要手工加 `deep` / `suite`：

```console
nix run .#ci -- plan type:bug pkg:compiler   # 预览本 PR 会跑哪些检查
gh pr checks <n>                             # PR 自己的检查
nix/tools/merge-queue.sh status              # 队列位置 / 状态 / ETA
```

需要强制整组时再加 `deep` / `suite` / `browser`。`backends` / `native` 不进 PR 门禁，
只在定时 / 手动跑；改后端时本地先跑 `nix run .#ci -- backends|native`，并在 PR 描述里写清
跑过哪些。
分组与清单见 [`docs/reference/testing-checks.md`](docs/reference/testing-checks.md)，
选择规则见 [`docs/reference/github-workflow.md`](docs/reference/github-workflow.md)。

## 6. 合并

`main` 只允许 **rebase merge**（merge commit 与 squash 关闭）。非 draft、同仓库分支、无
`blocked` / `needs-info` / `wontfix` 的 PR 会自动打开 auto-merge；required checks 全绿后
进入合并队列，队列在最新 `main` + 队前 PR 的组合 head 上重跑完整 `gates / run`，绿后自动
落 `main`：

```console
nix/tools/merge-queue.sh status
gh pr view <n> --json autoMergeRequest,labels,isDraft
```

需要 hold 时加 `blocked` / `needs-info` 或转 draft；automerge 会把已在队列里的 PR 移出。
**`BEHIND` 不是失败，不要为了追 `main` rebase**；只有冲突时才
`git rebase origin/main && git push --force-with-lease`。不要对 `main` force push，也不要
手动 merge 绕过 required checks。合并后：

```console
git -C <MAIN_ROOT> pull --ff-only
```

## 7. seed 轮换

- 轮换放在同一个 PR，独立 `chore(seed): ...` 提交；PR 加 `seed` 标签并优先合并。
- rebase 到最新 `origin/main` 时如果 `seed/` 冲突：abort，先 rebase 非 seed 提交，再重新
  `nix build .#vuna --out-link result && sh nix/seed/rotate.sh ./result/bin/vuna`。
  **不要手选 `seed/` 冲突两侧。**
- 合并用 rebase，保证 `chore(seed)` 独立落库；其他打开的 PR 不需要跟着 rebase，队列会在
  最新 `main` 上重新验证；只有 `seed/` 冲突时才按上面的流程处理。

## 8. 大改动拆 phase（stacked PR）

一个改动太大、要拆成多个 PR，且后一层依赖前一层的代码时，用 stacked PR。限制：

- 同时最多 2 个开发中的 agent（或人）；每 stack ≤3 层；全局 ≤4 个 open layer；队列里
  同时最多 3 个 entry。
- 同一线性 stack 同一时刻只有 1 个写者；第二个并行位给独立工作流或 review / 验证。
- 只在有硬代码依赖时 stack；没有依赖就各自从 `main` 切分支、开独立 PR。

每 phase 一个 worktree，branch base 是上一 phase 分支（bottom 为 `main`）：

```console
gh extension install github/gh-stack           # 一次性
git -C <worktree-phase-1> switch -c feat/123-phase-1 origin/main
git -C <worktree-phase-2> switch -c feat/123-phase-2 feat/123-phase-1
# …各层开发、整理提交…
gh stack init --base main feat/123-phase-1 feat/123-phase-2
gh stack push
gh pr create --base main             --head feat/123-phase-1 ...
gh pr create --base feat/123-phase-1 --head feat/123-phase-2 ...
gh stack link <pr1> <pr2>
# stack 不 arm；checks 绿后 sweep 自动整条入队
```

- 下一 phase 在上一 phase **冻结**（提交整理完、push、PR 打开、base 正确）后开工，不等
  合并；入队由 checks 变绿后 sweep 完成，不依赖 arm。
- `Closes #N` 只放 bottom；上层用 `Refs #N` 或 `no-issue`。
- 只 enqueue **top**（sweep 自动）；某层被 hold 或移出队列，上方所有层一起挡住，修好后
  由 sweep 重新入队。
- 合并后用 `gh stack sync` 级联；冲突用 `gh stack rebase` 解决，不要手写
  `git rebase --onto`。整条 stack 完成后再 `gh stack sync --prune` / `gh stack unstack`
  并清理 worktree。
- seed rotation 跟随真正改变 codegen 的层，独立 `chore(seed): ...`；每层都要独立满足
  「当前 seed 编译当前源码」，不把 rotation 推到后续层；上层不改 codegen 就不碰 `seed/`。
- CI 对每层都跑完整检查，层数直接放大总耗时；3 层是上限，不是目标。

完整机制见 [docs/reference/github-workflow.md](docs/reference/github-workflow.md)
「Stacked PR 与合并队列」，agent 的排班与交接见技能
[`vuna-phase`](.agents/skills/vuna-phase/SKILL.md)。

## 9. 分支保护与 break-glass

`main` 的 ruleset 由 `nix/tools/github-branch-protection.sh` 管理（幂等）：

```console
nix/tools/github-branch-protection.sh --dry-run   # 先看将写入的规则
nix/tools/github-branch-protection.sh --consolidate
```

脚本默认启用合并队列（REBASE / HEADGREEN / min 2 / max 6 / wait 5）并关闭 strict
up-to-date；`--no-merge-queue` 回滚到 strict + 无队列。ruleset 没有 bypass。CI 自身坏了
导致无法合并时，临时停用 ruleset / 移除 required check，修复后立即恢复并重跑脚本；在 PR
描述里记录临时变更与恢复时间。不要把 `--admin` 合并当作常规手段。