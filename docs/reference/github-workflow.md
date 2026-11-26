# Issue / PR / 门禁协作

本页是仓库的 GitHub 工作流说明：issue 状态机、标签含义、PR 与 issue 的联动、
按 `type + area` 选择的 PR 门禁，以及自动合并的边界。分支与提交整理见
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
| `pr` | fmt / lint / typecheck | 所有 PR 与 main push（`pr / run`） |
| `gate` / `gate-shard-0..3` | tests-gate（fast+integration）+ 单测；CI 里拆 4 片并行 | main push、定时、手动 |
| `e2e-shard-0..3` | tests-e2e（steps / 长 case）4 片并行 | 定时、手动 |
| `units` | 各包 `vuna test`（与 suite 解耦） | main push、定时、手动 |
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

`gates.yml` 在 PR 上做三件事：

1. `detect`：从 diff 和 issue/PR 标签得到 type + pkg/area、检查 issue 关联，并用
   `nix run .#ci -- plan-json <labels>` 算出门禁计划；
2. `suite`：计划里含完整 gate / e2e 时，按 `gate-shard-*` / `e2e-shard-*` 组起 4+4 的
   matrix job 并行跑（与 main 基线同一批 check，每片仍是完整 case 集合的一部分）；
   计划里没有时整个 job 跳过，不占 runner；
3. `gates`：跑计划里剩下的检查（`nix run .#ci -- run-plan --without-suite <labels>`），
   结果汇总成 `gates / run`。

`gates / run` 是 required check，它同时把 `suite` 的结论收进来：`detect` 失败或任一 shard
失败都会让它失败，不会因为 job 跳过而卡在 Expected。`pr / run` 与 `gates / run` 都绿且
分支与 main 同步后，PR 才能合并。

## 自动合并

`automerge.yml` 对非 draft、同仓库分支、没有 `blocked` / `needs-info` / `wontfix`
标签的 PR 打开 GitHub auto-merge；draft 或 hold 标签出现时关闭。

GitHub 只在 required checks 全绿、分支满足 strict up-to-date 时执行 rebase merge；
检查失败、取消或 PR 落后于 main 都不会合并。落后时仍需 agent 在分支上
`git rebase origin/main && git push --force-with-lease`。

合并身份是 `github-actions[bot]`（`GITHUB_TOKEN`），GitHub 不为该身份的推送创建工作流，
所以 main push 的 `gate-shards` 只覆盖人工 / break-glass 推送。配 `AUTOMERGE_TOKEN` 后合并会
触发 push 门禁；否则 main 的完整基线由定时任务承担（gate 4 片 + e2e 4 片 + units 并行）。

`AUTOMERGE_TOKEN` 用**细粒度 PAT**（仓库 secret，不是 org secret）：

1. <https://github.com/settings/personal-access-tokens/new> → 只授权 `vuna-lang/vuna`；
2. 权限：Contents = Read and write、Pull requests = Read and write、Workflows = Read and write
   （Metadata 自动只读）；
3. `gh secret set AUTOMERGE_TOKEN --repo vuna-lang/vuna`（交互输入，不进 shell history）。

缺 `workflow` 权限时，包含 `.github/workflows/*` 改动的 PR 会合并不了；OAuth（`gho_`）会话
token 不适合当长期 secret。

`main` 的 ruleset 由 [nix/tools/github-branch-protection.sh](../../nix/tools/github-branch-protection.sh)
管理，required checks 是 `pr / run` 与 `gates / run`。没有 bypass；break-glass 流程见
CONTRIBUTING.md。

## 常用查询

```console
gh issue list --label status:todo
gh issue list --label status:backlog --label needs-refinement
gh issue list --milestone "native 自举"
gh issue list --label pkg:compiler --state all --search "elab in:title,body"
gh pr view <n> --json autoMergeRequest,labels,isDraft
gh pr checks <n> --watch
```

## 故障

- `gates / run` 一直 Expected：确认 `gates.yml` 在当前分支已生效，且 `detect` job 有结论；
  首次上线时先在测试 PR 上确认实际 check 名，再写进 ruleset。
- `gates` 选错检查：先在本地跑 `nix run .#ci -- plan <labels>`，再检查 PR 的 `type:*` /
  `pkg:*` / `area:*` 是否完整。
- auto-merge 没打开：确认 PR 非 draft、同仓库、没有 hold 标签，且仓库仍允许 auto-merge。
- `pr-triage` / `automerge` 没跑：它们用 `pull_request_target`，workflow 从默认分支读取；
  修改必须先合入 main 才会对该 PR 生效。
- 标签迁移失败：先跑 `nix/tools/github-labels.sh --sync`，再跑 `--migrate`；脚本只加新标签、
  删旧标签，不直接重命名。
- 没有 `pkg:*` / `area:*`：`nix/tools/pr-labels.sh` 对路径做映射；新增目录时同步补映射与
  `pr-gates.nix`。