---
name: vuna-worktree-dev
description: 在 vuna 的副 worktree（非主仓 main 路径，如 ~/.local/worktrees/ 或 opencode 建的 worktree）里开发时的约束与惯例——开工 rebase、重建本地 result、本地验证与测试过滤、seed 纪律、提交规范与主仓隔离。当会话路径是副 worktree、用户提到 worktree / 副工作区、或 agent 被指派在 worktree 内改代码时使用。
---

# 在副 worktree 里开发 vuna

副 worktree 只是**同一仓库的另一份检出**，不是另一个项目：所有硬不变量、seed 纪律、
验证口径照常生效，只是构建产物、缓存与分支各归各的。

## 第一步：判定自己在哪

```console
git worktree list                  # 分支为 main 的那一行 = 主仓路径
git rev-parse --show-toplevel      # 当前根
git rev-parse --abbrev-ref HEAD    # 当前分支（副 worktree 通常不是 main）
```

- 当前根 **≠** `git worktree list` 里 `[main]` 的路径 ⇒ **你在副 worktree**，本技能适用。
- 常见位置：`~/.local/worktrees/<name>`、仓库内 `.local/worktrees/<name>`（`.local/`
  已 gitignore）、opencode 的 `~/.local/share/opencode/worktree/<id>/<name>`。
- 副 worktree 里**没有**主仓的未提交改动，也没有主仓的 `result`。

## 硬规则

1. **每轮开始先 rebase 主分支**（与主仓同一纪律）：`git fetch origin main`（远端不可达则用
   本地 `main`）→ `git rebase main`。冲突按语义合并、**双方改动都保留**，不要用 `-X ours`
   整片丢对方变更。rebase 后按下面第 2 条重建 `result`，再跑 `vuna check .` 与相关 suite。
2. **`result` 是每个 worktree 各自的产物**：`./result/bin/vuna` 是
   `nix build .#vuna --out-link result` 在该 worktree 目录下建的软链。副 worktree 没有就
   自己建，**不要指向别的 worktree 或主仓的 `result`**（版本对不上会静默跑旧编译器）。
3. **本地验证只用 `./result/bin/vuna`**：小范围 `vuna check <pkg>` / `vuna fmt <改动文件>` /
   `vuna run`。**不要为自测跑 `nix build` / `nix flake check`**（慢，CI/Lead 负责）。
4. **测试用章节过滤**：`nix run .#vuna-run-tests -- --only <章节>`（`--list` 看章节名），
   别为验证一处改动跑全量套件。
5. **`seed/` 禁止手改**：它是生成物，只能 `sh nix/seed-rotate.sh ./result/bin/vuna` 轮换。
   改 `compiler/` 前先确认**旧种子能编译新源码**：`nix build .#vuna-seed`（或至少等 CI 的
   `checks.seed-selfhost`）；需要新语法时先以旧语法落地 → rotate → 再用新语法。
   日常改 `lib/` / `app/` / `test/` / `docs/` **不需要** rotation；rotation 必须独立成
   `chore(seed): ...` 提交，不与特性混在一起。
6. **提交信息** `type(scope): 描述`（Conventional Commits，描述用中文）：`scope` 用包名或
   子系统（`compiler` / `base` / `lib` / `test` / `docs` / `nix`）；一次提交只做一件事。
7. **未经用户明确要求不 push、不 `git reset --hard`、不 `git checkout` 丢工作树改动**。
   worktree 收尾走 `vuna-worktree-finish` 技能，不在本技能里删目录。

## 骨架

### ① 开工（每次进入）

```console
git status --short                 # 先看有没有上次遗留的改动
git fetch origin main              # 远端不可达：跳过，用本地 main
git rebase main
nix build .#vuna --out-link result # 仅当 ./result/bin/vuna 不存在或版本可疑
./result/bin/vuna check .          # 自检（含改 compiler/ 时的 DT 自检）
```

`nix build` 命中缓存时约 10–15s；构建时间不算进任何性能读数（见 `perf-debug` 技能）。

### ② 开发中的本地验证

```console
vuna check <pkg>                       # 包级类型检查（app/ 与 compiler/ 都适用）
vuna fmt <改动的文件或目录>             # 代码改动后必跑
./result/bin/vuna run <pkg> -- ...     # 增量 build + 执行入口
nix run .#vuna-run-tests -- --only dt  # 按章节跑测试
```

改了 `lib/` 里的工具链要显式重建 `./result/bin/vuna` 才会生效——它不随源码自动更新。

### ③ 改 `compiler/` 或 `base/`（进 seed 的包）

```console
nix build .#vuna-seed              # 不变量 1：旧种子能编译当前源码
sh nix/seed-rotate.sh ./result/bin/vuna   # 仅当确实需要轮换（新语法 / 发布前）
git diff seed/                     # 轮换后必须能解释每个变化
```

顺序不能反：**能用旧语法表达的改动，先落地 → 换种子 → 再用新语法**。反了会让旧种子编译
不过新源码，违反不变量 1。

### ④ 提交

```console
git add <明确的路径>               # 显式 add，别用 -A 把生成物带进来
git commit -m "type(scope): 中文描述"
```

提交前自查：`git status --short` 里不应出现 `result`、`_scratch/`、`.local/`、`seed/`
的非轮换变更、`docs/api.html`、`docs/.generated/`。

## 与主仓隔离的注意事项

| 资源 | 归属 | 注意 |
| --- | --- | --- |
| `result` / `.output` | 每个 worktree 各自 | 不要跨目录复用；`result` 与 `.output` 都已 gitignore |
| 分支与 HEAD | 各自 | 副 worktree 不要 checkout `main`（主仓通常已占用） |
| `_scratch/` | 每个 worktree 各自 | 探针与临时脚本放这里，已 gitignore，不进提交 |
| `$VUNA_STORE` 对象库 | 机器级共享 | 内容寻址，共享安全；但**不要**依赖另一个 worktree 的增量缓存判定 |
| nix eval cache | 机器级 | 并行/多 worktree 下可能返回旧求值结果（`nix/ci.sh` 因此关闭它），拿不准就重建 |

多个 worktree 同时构建时不要互相删对方的 `result`/`.output`；也不要在主仓目录里直接编辑
副 worktree 的文件——用 worktree 自己的路径。

## 反模式

- 用主仓的 `./result/bin/vuna` 验证副 worktree 的改动（编译器版本与源码不匹配）。
- 为「确认没问题」跑 `nix build` / `nix flake check`：耗时且与 CI 重复，本地口径是
  `./result/bin/vuna` + `--only <章节>`。
- 手改 `seed/` 让 CI 变绿；或把 rotation 混进特性提交。
- rebase 时冲突一律取自己一侧，静默丢掉主仓改动。
- 跳过 `vuna fmt` 就提交，让格式差异混进功能 diff。
- 在副 worktree 里 `git checkout main` / `git reset --hard` 图省事。
