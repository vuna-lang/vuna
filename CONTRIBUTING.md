# 贡献流程

`main` 受保护：所有改动（源码、文档、`seed/` 轮换）都通过 GitHub Pull Request 合入。
本地 `main` 只用于读取与 `git pull --ff-only`。

更细的 agent 规则在 [`.agents/rules/`](.agents/rules/)，PR 操作手册在
[`.agents/skills/vuna-pr/SKILL.md`](.agents/skills/vuna-pr/SKILL.md)。

## 1. 准备

```console
git fetch origin
git switch -c <type>/<slug> origin/main
git config core.hooksPath .githooks   # devShell / direnv 会自动设置
```

- 分支名用 `<type>/<slug>`：`feat/`、`fix/`、`docs/`、`chore/`、`refactor/`、`test/`；
  关联 issue 时形如 `fix/123-slug`。
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
「跑过什么 / 没跑什么」、seed 与后端影响。

## 5. PR 门禁

必需检查只有 `pr / run`（fmt + lint + 自检）。其余门禁由标签触发，**加了标签就要等绿**：

| 改动面 | 标签 | 等待 |
| --- | --- | --- |
| `packages/compiler/` / `base/` / `ir/` / `target-ocaml/` / `nix/` / `seed/` | `deep` | `deep` |
| `test/`、语言 / 运行时行为 | `suite` | `suite` |
| `packages/target-native/` / `target-wasm/`、运行时 | `backend` | `backends` + `native` |
| `wasm-host/`、浏览器可跑面 | `browser` | `browser` |
| 只改文档 / `.github` / `.agents` | 无 | `pr` |

```console
gh pr edit <n> --add-label deep,suite,backend
gh pr checks <n> --watch
```

`deep` / `suite` / `backends` / `native` / `browser` 另由 nightly 与手动 dispatch 兜底。
分组与清单见 [`docs/reference/testing-checks.md`](docs/reference/testing-checks.md)。

## 6. 合并

`main` 只允许 **rebase merge**（merge commit 与 squash 关闭），并且要求分支与 `main` 同步：

```console
gh pr checks <n> --watch
gh pr merge <n> --rebase
```

更新 PR 时重新 `git rebase -i origin/main`，然后用 `git push --force-with-lease`；
不要对 `main` force push。合并后：

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