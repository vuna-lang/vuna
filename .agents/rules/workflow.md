# 工作流：开工 → 开发 → 提交 → 收尾

这是 vuna 仓库的固定流程。**任何时候都成立**，与具体改哪个模块无关。

## 1. 开工：先 rebase

```console
git fetch origin main              # 远端不可达：跳过，用本地 main
git rebase main
```

- 冲突**按语义合并、双方改动都保留**；不要 `-X ours` / `-X theirs` 整片丢对方变更。
- 历史必须**线性**：优先 ff-only merge / rebase / cherry-pick / 挤压提交，不产生 merge 提交。
- rebase 后按需重建本地编译器（需要固定二进制时 `nix build .#vuna --out-link result`，否则
  直接用 `nix run .#vuna -- <subcommand>`），先跑 `nix run .#vuna -- check .` 与相关 suite 再继续。
- **所有改动都在副 worktree 内完成**（`~/.local/share/opencode/worktree/…` /
  `.local/worktrees/…`），主工作区只读：不直接在主根改文件，收尾用脚本把提交 cherry-pick
  回去。完整口径见技能 `worktree`。

## 2. 开发：小步 + 本地验证

- 改完**立即**用小范围验证（`nix run .#vuna -- <subcommand>`；矩阵见
  [verification.md](verification.md)）；不要为自测跑全量 `nix build` / `nix flake check`。
- 代码改动后跑 `nix run .#vuna -- fmt <改动的文件/目录>`，让格式差异不混进功能 diff。
- 临时探针、生成脚本、日志一律放 `_scratch/`（已 gitignore）；`git status` 里出现探针
  文件就是违反纪律。
- 想清楚改动属于哪个包/子系统；跨包的顺带重构优先拆成独立提交。

## 3. 提交：一次一件事

提交信息格式、type/scope 与示例见技能 `vuna-commits`。硬规则：

- **一次提交只做一件事**；不要把格式化、重命名、行为变更混在一起。
- **提交前门禁**由 `.githooks/pre-commit` 执行（全仓库 `fmt --check` / `lint --max-warnings 0` /
  `check .`，等价 CI 的三个 check）；`chore(seed):` 轮换这类刚重建过整链的提交用
  `VUNA_SKIP_HOOKS=1` 跳过，别用 `--no-verify` 掩盖真正失败。
- **seed rotation 必须独立成 `chore(seed): ...`**，不与特性提交混在一起。
- 提交前检查 `git status --short`：不应出现 `result`、`.output`、`_scratch/`、`.local/`、
  `docs/api.html`、`docs/.generated/` 等生成物。
- 允许 `git add` / `git commit`；`git checkout` / `git reset` 会丢工作树改动，执行前先确认。
- **禁止手改 `seed/`**：它只能由 `sh nix/seed/rotate.sh ./result/bin/vuna` 轮换（先
  `nix build .#vuna --out-link result` 固定二进制）。

## 4. 收尾：带回主仓

副 worktree 的收尾顺序固定：**commit → cherry-pick → 校验 → remove**，任何一步失败都保留
worktree。完整规程见技能 `vuna-worktree-finish`。

- 未经用户明确要求：不 `push`、不删远程分支、不 `git worktree remove --force`。
- 主仓校验通过前不删 worktree；没带回的提交只能从 reflog 捞。

## 不要做的事

- 用主仓的编译器（无论是 `./result/bin/vuna` 还是全局 `vuna`）验证副 worktree 的源码：
  版本不匹配，会静默跑旧编译器。副 worktree 里用 `nix run .#vuna --`，它按当前源码构建。
- 把「这次没超时 / CI 绿了」当成验证完成；本地能跑的检查先跑，跑不了要明说。
- 为了过 CI 手改 `seed/` 或 `seed/` 里的生成文件。
- 在提交信息里写「update」「fix bug」这类无法回溯意图的描述。
