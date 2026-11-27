# 工作流：开工 → 开发 → 提交整理 → PR → 合并

这是 vuna 仓库的固定流程。**任何时候都成立**，与具体改哪个模块无关。
`main` 只读：所有改动（源码、文档、seed 轮换）都经 GitHub PR 合入；本地 `main`
只用于读取与 `git pull --ff-only`。

## 1. 开工：从 `origin/main` 切分支（issue 可选）

**issue 不是开工前置**：PR-only 的改动直接切分支，PR 加 `no-issue` 标签即可。
需要追踪的复杂工作（epic 子任务、多轮验收）再按技能 `vuna-issue` 查重后创建/精炼，
领取时 assign 给自己并把状态设为 In progress（`nix/tools/issue.sh status <n> in-progress`）。

```console
gh issue edit <n> --add-assignee @me                                  # 有关联 issue 时
nix/tools/issue.sh status <n> in-progress
git fetch origin
git switch -c <type>/<slug> origin/main   # 在副 worktree 内
```

- 分支名用 `<type>/<slug>`：`feat/`、`fix/`、`docs/`、`chore/`、`refactor/`、`test/`；
  关联 issue 时形如 `fix/123-slug`。能用 GitHub 关联分支时用
  `gh issue develop <n> --name <type>/<n>-<slug> --checkout`。
- **所有改动都在副 worktree 内完成**（`~/.local/share/opencode/worktree/…` /
  `.local/worktrees/…`），主工作区只读；**不要**再把提交 cherry-pick 回主仓。
- 分支不必追着 `main` rebase：合并队列会在最新 `main` + 队列前序 PR 的组合 head 上
  重新验证。只有 GitHub 报冲突（`mergeable=CONFLICTING`）或需要基于新 `main` 调试时
  才 `git rebase origin/main`；冲突**按语义合并、双方改动都保留**，不要
  `-X ours` / `-X theirs` 整片丢对方变更。
- 开 PR 时可以 rebase 一次得到干净的历史；**PR 打开后不要因为其他 PR 合入就反复 rebase**，
  队列会处理顺序。
- 历史必须**线性**：分支里不产生 merge 提交（`.githooks/pre-push` 会拒绝）。
- rebase 后按需重建本地编译器（需要固定二进制时 `nix build .#vuna --out-link result`，否则
  直接用 `nix run .#vuna -- <subcommand>`），先跑 `nix run .#vuna -- check .` 与相关 suite 再继续。

## 2. 开发：小步 + 本地验证

- 改完**立即**用小范围验证（`nix run .#vuna -- <subcommand>`；矩阵见
  [verification.md](verification.md)）；不要为自测跑全量 `nix build` / `nix flake check`。
- 代码改动后跑 `nix run .#vuna -- fmt <改动的文件/目录>`，让格式差异不混进功能 diff。
- 临时探针、生成脚本、日志一律放 `_scratch/`（已 gitignore）；`git status` 里出现探针
  文件就是违反纪律。
- 想清楚改动属于哪个包/子系统；跨包的顺带重构优先拆成独立提交。

## 3. 提交整理：开 PR 前必须 `rebase -i`

```console
git fetch origin
git rebase origin/main
git rebase -i origin/main
nix run .#ci -- pr
```

- 用 squash / fixup 合并 WIP，reword 写清意图，按逻辑重排；**开 PR 前分支里不允许
  `fixup!` / `squash!` / `WIP` 提交**。
- **一次提交只做一件事**；不要把格式化、重命名、行为变更混在一起。
- **seed rotation 必须独立成 `chore(seed): ...`**，不与特性提交混在一起。
- 提交信息格式见技能 `vuna-commits`（`type(scope): 中文描述`）。
- **提交前门禁**由 `.githooks/pre-commit` 执行（全仓库 `fmt --check` / `lint --max-warnings 0` /
  `check .`）；`chore(seed):` 轮换这类刚重建过整链的提交用 `VUNA_SKIP_HOOKS=1` 跳过，
  别用 `--no-verify` 掩盖真正失败。
- 提交前检查 `git status --short`：不应出现 `result`、`.output`、`_scratch/`、`.local/`、
  `docs/api.html`、`docs/.generated/` 等生成物。
- **禁止手改 `seed/`**：它只能由 `sh nix/seed/rotate.sh ./result/bin/vuna` 轮换（先
  `nix build .#vuna --out-link result` 固定二进制）。

## 4. 推送与 PR

```console
git push -u origin HEAD
gh pr create --base main --title "<type(scope): 中文描述>" --body-file <file>
```

- PR 标题与主提交一致（Conventional Commits）；描述按
  [`.github/pull_request_template.md`](../../.github/pull_request_template.md) 写清
  「跑过 / 没跑」、seed 与后端影响。有关联 issue 时描述含 `Closes #N` 或 `Refs #N`；
  PR-only 改动加 `no-issue` 标签。
- PR 的必需检查是 `pr / run`（fmt + lint + 自检）与 `gates / run`（PR 上是按 `type` +
  `pkg` / `area` 自动选择的切片；在 `merge_group` 上是完整 gate-shard + units + area）。
  `pr-triage` 自动维护 type / pkg / area 标签，不再手工加 `deep` / `suite`；需要强制整组时
  再加 `deep` / `suite` / `browser`。
- PR 已经有提交后再改动：用 `git rebase -i origin/main` 整理提交（不要求追上最新 main），
  然后 `git push --force-with-lease`；**不要**对 `main` 使用 force push。
- 默认交给 auto-merge：required checks 全绿后进合并队列，队列的 `gates / run` 在组合 head
  上跑完整门禁，绿后 rebase 落 `main`。需要 hold 时加 `blocked` / `needs-info` 或转 draft
  （automerge 会把已在队列里的 PR 移出）。不要手动 merge 绕过检查；完整规程见技能 `vuna-pr`。

## 5. 合并与收尾

```console
nix/tools/merge-queue.sh status        # 队列位置 / 状态 / ETA
gh pr checks <n>                       # PR 自己的检查（不是队列状态）
git -C <MAIN_ROOT> pull --ff-only
~/.config/opencode/skills/worktree/scripts/worktree-teardown.sh --json \
  --main <MAIN_ROOT> --worktree <WORKTREE> --branch <BRANCH> --delete-branch
```

- 只允许 **rebase merge**（squash 关闭）：整理过的提交原样落到 `main`，`chore(seed)` 不会被压扁。
- 非 draft、同仓库分支、无 `blocked` / `needs-info` / `wontfix` 的 PR 由 workflow 自动打开
  auto-merge；required checks 全绿后进入 GitHub 合并队列，队列在**最新 main + 前序 PR**
  的组合 head 上重跑必需检查，绿后自动落 `main`。
- **分支落后（`BEHIND`）不是失败，不要 rebase**；队列会把它排到最新 main 后面。只有冲突
  时才在分支上 `git rebase origin/main && git push --force-with-lease`。
- 队列把 PR 移除时先看原因：冲突才 rebase；检查失败就修；超时重新 arm auto-merge。
  不要用 `gh pr merge --rebase` 手动绕过队列。
- 合并后主仓 `git pull --ff-only`，再按技能 `worktree` 的 teardown 清掉副 worktree 与本地分支。
- 分支不合并就放弃时保留 worktree 或按需删除，**不要**把提交带回 `main`。

## 6. main 红灯：先认领再修

`main` 的 `ci` 失败时，`main-red.yml` 会维护一个 `main-red` issue（失败追加、恢复绿自动关闭）。

- 开始修之前先 `gh issue list --label main-red --state open`。
- issue 已有 assignee 或状态 `In progress`：**不要开修复 PR**，在 issue / PR 里说明并让出。
- 没有认领：先评论 claim，再 `gh issue edit <n> --add-assignee @me` 与
  `nix/tools/issue.sh status <n> in-progress`。
- 修复 PR 写 `Closes #<n>` 并加 `main-red` 标签；`main-red-guard.yml` 会把第二个修复 PR
  加 `blocked` 并移出队列。
- `main` 还没绿时，不要给无关 PR arm auto-merge；队列会在红灯基线上失败并反复踢出。

## 7. 大任务拆 phase（stacked PR）

跨多个 PR 的大改动按 phase 推进：phase N 还没合并就开工 phase N+1。完整排班与 subagent
交接见技能 `vuna-phase`，机制、API 与 CI 口径见
[github-workflow.md](../../docs/reference/github-workflow.md)「Stacked PR 与合并队列」。

- **并发**：2 个 dev 槽；每个 stack 最多 3 层；全局最多 4 个 open layer；队列最多 3 entry。
  线性 stack 同一时刻只有 1 个写代码的 agent，第二个槽给独立工作流或 review / 验证。
- **只在 phase N+1 对 phase N 有硬代码依赖时 stack**；无依赖的 phase 各自从 `origin/main`
  切分支、开独立 PR 并行。
- **一个 phase 一个 worktree**；branch 的 base 是上一 phase 分支，bottom 的 base 是 `main`。
- **冻结**：提交整理完、push、PR 打开、base 正确；入队由 checks 变绿后 sweep 完成
  （不依赖 arm）。下一 phase 在冻结后开工，不等 merged；冻结后该层不再接受代码改动。
- **远端写只有 orchestrator 做**：push / PR / label / `gh stack` / `merge-queue.sh` /
  teardown；phase agent 只改代码、跑验证、commit。
- **stack 操作**：`gh stack init --base main <b1> <b2>`（已有追踪时 `gh stack add <bN>`）→
  `gh stack push` → 每层 `gh pr create --base <parent>` → `gh stack link <pr...>`。只
  enqueue top（sweep 自动），不逐层入队；合并后 `gh stack sync` 级联，不手写 `rebase --onto`。
- `Closes #N` 只放 bottom，上层用 `Refs #N` 或 `no-issue`。
- **seed**：rotation 只放最低层并独立成 `chore(seed): ...`；上层 PR 不碰 `seed/`，全局同时
  只允许一次 rotation。
- 整条 stack 合并完再 `gh stack sync --prune` / `gh stack unstack`，然后 teardown 各 worktree。

## 不要做的事

- 直推 `main` / `master`，或对 `main` 执行 force push。
- 在 PR 合并前把提交 cherry-pick 回本地 `main`。
- 用主仓的编译器（无论是 `./result/bin/vuna` 还是全局 `vuna`）验证副 worktree 的源码：
  版本不匹配，会静默跑旧编译器。副 worktree 里用 `nix run .#vuna --`，它按当前源码构建。
- 把「这次没超时 / CI 绿了」当成验证完成；本地能跑的检查先跑，跑不了要明说。
- 为了过 CI 手改 `seed/` 或 `seed/` 里的生成文件。
- 在提交信息 / PR 标题里写「update」「fix bug」这类无法回溯意图的描述。
- 因为 `BEHIND` 就 rebase，或手动 `gh pr merge --rebase` 绕过合并队列。
- 在 `main` 红灯时给无关 PR arm auto-merge，或无视已认领的 `main-red` issue 再开一个修复 PR。
- 让 phase agent 做远端写操作（push / PR / label / `gh stack` / `merge-queue.sh`）。
- 逐层 enqueue，或对 stack 用 `gh pr merge` / 同步 merge 端点。
- 无依赖也硬叠 stack，或在 stack 中途 teardown 仍会被级联 rebase 的 worktree。