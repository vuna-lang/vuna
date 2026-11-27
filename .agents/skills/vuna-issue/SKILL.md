---
name: vuna-issue
description: 创建、精炼、领取或收尾 vuna 的 GitHub issue 时使用——backlog 两类来源、查重、needs-refinement 精炼、原生 status/type/priority、sub-issue 与依赖关系。
---

# vuna 的 issue 流程

issue 是任务、bug 与方向的载体；PR 通过 `Closes #N` / `Refs #N` 与它联动。
进度、类型、优先级、关系都是 GitHub 原生字段；标签只用于 `pkg` / `area` 与流程控制。
完整状态机与标签表见 [docs/reference/github-workflow.md](../../../docs/reference/github-workflow.md)。

## 1. 两类 backlog

### 人类一句话 idea

模板 `想法 / 方向` 自动带 `needs-refinement`，状态是默认的 Backlog。收到后不要直接开工，
先按下面的「精炼」流程处理。

### Agent 发现的后继任务

创建前必须查重，open + closed 都查：

```console
gh issue list --state all --search "<关键词> in:title,body" --limit 20
gh issue list --state all --label pkg:compiler --search "<关键词>" --limit 20
```

- 已有相同 issue：评论补充信息，不新建。
- 已有相关 issue：用原生 relates-to（`nix/tools/issue.sh relate <n> <m>`），或挂到该 epic
  的 sub-issue（`gh issue edit <n> --parent <epic>`），不要写正文关系行。
- 确认没有对应 issue 才创建；正文写来源（PR / issue / commit / `file:line`）、影响面、
  建议方案与验收标准。

## 2. 精炼 `needs-refinement`

1. 在 issue 里和用户确认背景、目标 / 非目标、方案、验收标准。
2. 补齐元信息：
   - issue type：`gh issue edit <n> --type Bug|Feature|Chore|Refactor|Perf|Docs|Test|Epic`
   - `pkg:*`：涉及的 workspace 包，可多个
   - `area:*`：包内子系统，决定 PR 门禁
   - 优先级：`nix/tools/issue.sh priority <n> P0..P3`（字段里显示 Urgent / High / Medium / Low）
   - milestone：按需
3. 建立关系（全部原生）：
   - Parent epic：`gh issue edit <n> --parent <epic>`
   - 阻塞：`gh issue edit <n> --add-blocked-by <m>`
   - 相关：`nix/tools/issue.sh relate <n> <m>`
4. 移除 `needs-refinement`；未排期保持 Backlog，已排期 assign 或
   `nix/tools/issue.sh status <n> todo`。
5. 等待用户回答时加 `needs-info`，回答后移除。

精炼后的正文至少包含：

```markdown
## 背景 / 问题
## 目标
## 非目标
## 方案要点
## 验收标准
## 影响面
- pkg:
- area:
## 来源
```

关系只放原生字段，不写进正文。重复 issue：

```console
gh issue close <n> --reason duplicate --duplicate-of <m>
```

## 3. 领取与开工

- 只处理被 assign、被提及或用户明确交给你的 issue；不要自动扫全部 backlog。
- **领取 = assign + In progress，两步都做完再开工**：
  `gh issue edit <n> --add-assignee @me`（Backlog → Todo），紧接着
  `nix/tools/issue.sh status <n> in-progress`。只 assign 不改状态时，其他 agent 仍会在
  `status:todo` 里看到它并重复认领；状态更新是认领动作的一部分，不是开工后的可选步骤。
- 领取后用 `nix/tools/issue.sh show <n>` 确认 `status=In progress`；不对就补一次。
- 分支命名：`<type>/<n>-<slug>`，例如 `fix/123-elab-zonk`。
- 能用 GitHub 的关联分支时：

```console
gh issue develop <n> --name fix/<n>-<slug> --checkout
```

- 开工后不要在 issue 里刷进度；关键决策写进 issue 或 PR 描述。

## 4. 收尾

- PR 描述写 `Closes #N`（完整完成）或 `Refs #N`（部分完成）。
- PR 打开/ready 会自动推进 issue 状态；merged 后 `Closes` 自动关闭 issue（Done）。
- PR 关闭但未合并会自动把 issue 放回 Todo。
- `Refs` 合入后 issue 保持 In review，验证完成再手动关闭。
- 子任务开工会把父 issue（通常是 epic）从 Backlog / Todo 推到 In progress。
- 合并后按 `vuna-pr` 技能清理 worktree 与分支。

## 5. 查询

```console
gh issue list --search 'status:todo'
gh issue list --type Epic
gh issue list --label needs-refinement --state open
gh issue list --milestone "native 自举"
gh issue list --label pkg:compiler --state all --search "elab in:title,body"
nix/tools/issue.sh show <n>
gh issue view <n> --comments
```

## 不要做的事

- 不查重就新建 issue。
- 只 `--add-assignee` 就开工，把 issue 留在 Todo（会被其他 session 当成可领取）。
- 给一句话 idea 直接设 Todo 或开工。
- 在 issue 关闭后继续用它跟踪新工作；新工作另开 issue 并链接旧 issue。
- 在正文写 `Parent:` / `Blocked by:` / `Related:` 行，或用 `status:*` / `priority:*` 标签。