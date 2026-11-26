---
name: vuna-issue
description: 创建、精炼、领取或收尾 vuna 的 GitHub issue 时使用——backlog 两类来源、查重、needs-refinement 精炼、type/pkg/area 元信息、epic 子任务与状态流转。
---

# vuna 的 issue 流程

issue 是任务、bug 与方向的载体；PR 通过 `Closes #N` / `Refs #N` 与它联动。
完整状态机与标签表见 [docs/reference/github-workflow.md](../../../docs/reference/github-workflow.md)。

## 1. 两类 backlog

### 人类一句话 idea

模板 `想法 / 方向` 会自动带 `status:backlog` + `needs-refinement`。收到后不要直接开工，
先按下面的「精炼」流程处理。

### Agent 发现的后继任务

创建前必须查重，open + closed 都查：

```console
gh issue list --state all --search "<关键词> in:title,body" --limit 20
gh issue list --state all --label pkg:compiler --search "<关键词>" --limit 20
```

- 已有相同 issue：评论补充信息，不新建。
- 已有相关 issue：在新 issue 里写 `Related #N`，或把新内容挂到该 issue 的 epic 下。
- 确认没有对应 issue 才创建；正文写来源（PR / issue / commit / `file:line`）、影响面、
  建议方案与验收标准。

## 2. 精炼 `needs-refinement`

1. 在 issue 里和用户确认背景、目标 / 非目标、方案、验收标准。
2. 补齐元信息：
   - `type:*`：bug / feature / refactor / perf / docs / test / chore / epic
   - `pkg:*`：涉及的 workspace 包，可多个
   - `area:*`：包内子系统，决定 PR 门禁
   - priority / milestone：按需
3. 建立关系：
   - Parent epic：在 epic 正文写 `- [ ] #N`，由 issue-triage 同步为 sub-issue
   - `Blocked by: #N` / `Related: #N`
4. 移除 `needs-refinement`；未排期保持 `status:backlog`，已排期改 `status:todo`。
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
## 关系
- Parent:
- Blocked by:
- Related:
## 来源
```

重复 issue：关闭为 `duplicate`，在关闭评论里链接 canonical issue。

## 3. 领取与开工

- 只处理被 assign、被提及或用户明确交给你的 issue；不要自动扫全部 backlog。
- 领取：`gh issue edit <n> --add-assignee @me --add-label status:in-progress`。
- 分支命名：`<type>/<n>-<slug>`，例如 `fix/123-elab-zonk`。
- 能用 GitHub 的关联分支时：

```console
gh issue develop <n> --name fix/<n>-<slug> --checkout
```

- 开工后不要在 issue 里刷进度；关键决策写进 issue 或 PR 描述。

## 4. 收尾

- PR 描述写 `Closes #N`（完整完成）或 `Refs #N`（部分完成）。
- PR 打开/ready 会自动推进 issue 状态；merged 后 `Closes` 自动关闭 issue。
- PR 关闭但未合并会自动把 issue 放回 `status:todo`。
- `Refs` 合入后 issue 保持 `status:in-review`，验证完成再手动关闭。
- 合并后按 `vuna-pr` 技能清理 worktree 与分支。

## 5. 查询

```console
gh issue list --label status:todo
gh issue list --label needs-refinement --state open
gh issue list --milestone "native 自举"
gh issue list --label pkg:compiler --state all --search "elab in:title,body"
gh issue view <n> --comments
```

## 不要做的事

- 不查重就新建 issue。
- 给一句话 idea 直接打 `status:todo` 或开工。
- 在 issue 关闭后继续用它跟踪新工作；新工作另开 issue 并链接旧 issue。
- 用 `priority:*` 代替 `status:*`；两者含义不同。