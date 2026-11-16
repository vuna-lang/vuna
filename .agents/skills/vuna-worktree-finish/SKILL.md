---
name: vuna-worktree-finish
description: 副 worktree 完成后把改动带回 vuna 主仓的收尾规程——按需 commit、cherry-pick 到主仓并校验等价、冲突时保留 worktree 并报告、最后 git worktree remove。当用户要关闭 worktree、把 worktree 的改动带回主仓、cherry-pick 回 main、或收尾副工作区时使用。
---

# 收尾：把副 worktree 的改动带回主仓

目标：让主仓 `main` 以**线性历史**拿到副 worktree 的提交，校验通过后才删目录。
顺序固定：**commit → cherry-pick → 校验 → remove**，任何一步失败都停在原地保留 worktree。

## 第一步：看清要带什么

```console
git status --short                 # 有无未提交改动
git log --oneline main..HEAD       # 副 worktree 相对 main 的提交（要带回的集合）
git rev-parse --show-toplevel      # 确认这是副 worktree 根
```

- `main..HEAD` 为空且工作树干净 ⇒ 没有要带的东西，直接跳到第六步。
- 先确认主仓路径（第三、六步要用）：`git worktree list` 里分支为 `main` 的那一行。

## 第二步：commit（仅当工作树脏）

```console
git add <明确的路径>               # 显式 add；别用 -A 带进 result/_scratch/.local
git commit -m "type(scope): 中文描述"
```

- 工作树干净就**不要**造空提交或 `--amend` 别人的提交。
- 多个逻辑改动优先拆成多个提交，带回主仓后历史更可读；`seed/` 轮换必须独立成
  `chore(seed): ...`。
- 提交前跑过 `vuna fmt <改动文件>`，并确认 `git status` 里没有生成物
  （`result`、`_scratch/`、`.local/`、`docs/api.html`、`docs/.generated/`）。

## 第三步：cherry-pick 到主仓

```console
cd <主仓路径>
git status --short                 # 主仓必须干净，否则先处理
git fetch origin main
git pull --ff-only origin main     # 或 git merge --ff-only origin/main；让 main 与远端一致
git log --oneline -1 main          # 记下基线，便于回滚判断

# 从旧到新逐个带回（用副 worktree 里 git rev-list --reverse main..HEAD 的顺序）
git cherry-pick <SHA1> <SHA2> ...
```

替代方案（**可选**）：副 worktree 的基线正好是主仓 `main` 的祖先、且主仓没有新提交时，
可以 `git merge --ff-only <分支>`，同样得到线性历史。主仓已有新提交时不要 merge，改用
cherry-pick 或让副 worktree 先 `git rebase main` 再 ff-only。

## 第四步：校验带过去了

```console
# 在副 worktree（或主仓，git 命令都可用）
git cherry main HEAD
```

输出每行 `- <sha>`（带 `-` 前缀）= 主仓已有等价补丁；`+` = **还没带过去**。目标是
**全部为 `-`**。需要精确核对单个提交时（可选）：

```console
git cherry main <SHA> <SHA>^
```

再在主仓确认内容与提交面：

```console
cd <主仓路径>
git log --oneline -n <提交数>      # 提交都在、顺序线性、信息未变
git status --short                 # 无残留冲突或暂存
git diff <副 worktree 的 HEAD> HEAD --stat   # 除主仓自身新增提交外应无差异
```

cherry-pick 后**顺手在主仓验证**：`./result/bin/vuna check .`（主仓 `result` 可能需
`nix build .#vuna --out-link result` 重建）+ `nix run .#vuna-run-tests -- --only <章节>`。
校验不通过就不要进入第五步。

## 第五步：冲突处理（保留 worktree）

cherry-pick 冲突时**不要**急着手工改完 `--continue`，也不要删 worktree：

```console
cd <主仓路径>
git status --short                 # 冲突文件标为 UU / AA 等
git cherry-pick --abort            # 建议：先让主仓回到干净基线
```

然后在**副 worktree**里按语义重解：

```console
cd <副 worktree>
git fetch origin main
git rebase main                    # 冲突在此处解决，双方改动都保留
# 解完继续：git add <file> && git rebase --continue
./result/bin/vuna check . && nix run .#vuna-run-tests -- --only <章节>
```

rebase 干净后回到第三步重新 cherry-pick。汇报时必须列出：冲突文件、冲突原因
（同一函数/同一 `vuna.toml` 字段/`seed/` 生成物等）、你选择的合并语义、以及
`--abort` 是否已执行。**不要用 `-X ours` / `-X theirs` 整片丢对方改动**；`seed/` 冲突
说明轮换时机不对，应先回滚该提交再重排顺序。

## 第六步：移除副 worktree

确认主仓校验通过后再删：

```console
cd <主仓路径>
git worktree remove <副 worktree 路径>     # 例：~/.local/worktrees/<name>
git worktree prune                          # 可选：清理已失效的元数据
git branch -d <副 worktree 分支>            # 可选：仅当已完全合入
```

- 命令报 dirty 时先 `git status --short` 逐项确认；**不要 `--force`**，除非用户明确要求
  丢弃改动。
- 删除前确认第三步/第四步已通过；worktree 一旦删掉，未带回的提交只能从 reflog 捞。

## 汇报模板

```text
worktree: <路径>（分支 <branch>）
提交: <N> 个 —— <sha> type(scope): 描述 ...
带回: cherry-pick 到 main <sha>...；git cherry main HEAD 全部为 '-'
校验: ./result/bin/vuna check . ✅ | --only <章节> ✅（主仓）
冲突: 无 / 文件 <列表>，处理 <语义合并说明>，已 --abort 并在 worktree rebase
移除: git worktree remove ✅（保留 / 未移除，原因 ...）
遗留: 未 push（按约定）/ 其他
```

## 不要做的事

- 未经用户明确要求 `git push`、删远程分支、或 `git push --force*`。
- `git reset --hard`、`git checkout .` 清理现场——会丢工作树改动。
- `git worktree remove --force` 或先删目录再问，导致提交无法带回。
- 在主仓直接 `git commit --amend` 改动已带回的提交来「修冲突」。
- 冲突时手改 `seed/` 让 cherry-pick 过；`seed/` 只经 `sh nix/seed/rotate.sh` 轮换。
- 为收尾跑 `nix flake check`（CI 口径），本地验证用 `./result/bin/vuna` + 章节过滤。
