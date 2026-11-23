# `.agents/`：本仓库的 AI 规则与技能

`AGENTS.md` 是**唯一必读入口**；本目录是它的细则层，按场景取用，不要通读。

- `rules/`：**任何时候都成立**的硬规则（流程、验证、文档）；
- `skills/`：**特定场景**的操作规程（agent 发现相关场景时才加载）。

## 规则（always-on）

| 文件 | 何时读 |
| --- | --- |
| [rules/workflow.md](rules/workflow.md) | 开工 / 提交 / 收尾的固定流程：rebase、线性历史、格式化、生成物 |
| [rules/verification.md](rules/verification.md) | 改完跑什么：本地口径 vs CI 口径、按改动面选测试、seed/effect 门禁 |
| [rules/docs.md](rules/docs.md) | 写完或探索完：文档落点、导航同步、哪些是生成物不能读/写 |
| [rules/comments.md](rules/comments.md) | 写/改注释与说明文字：只写当下成立的事实，不写阶段编号、实现史与未来计划 |

## 技能（按场景）

| 技能 | 何时用 |
| --- | --- |
| [repo-navigation](skills/repo-navigation/SKILL.md) | 动手前摸仓库：要改的模块整篇读，只引用的查 `vuna map` / `vuna api` |
| [lint-rule](skills/lint-rule/SKILL.md) | 新增/修改 `vuna lint` 规则（含自动修复），或把规则提升进 recommended 并迁移仓库 |
| [perf-debug](skills/perf-debug/SKILL.md) | 命令/阶段变慢、超时、怀疑复杂度回退 |
| [vuna-worktree-dev](skills/vuna-worktree-dev/SKILL.md) | 在副 worktree 里开发（构建产物、测试、seed、提交的隔离） |
| [vuna-worktree-finish](skills/vuna-worktree-finish/SKILL.md) | 副 worktree 收尾：commit → cherry-pick 回主仓 → 校验 → remove |
| [vuna-commits](skills/vuna-commits/SKILL.md) | 写或校验提交信息（Conventional Commits 的 vuna 口径） |

## 维护约定

- **新增技能**：`skills/<id>/SKILL.md`，frontmatter 只写 `name` + `description`；
  `description` 必须写清「何时用」（它决定技能能否被检索到），并在上表加一行。
  `id` 用 kebab-case；与全局技能重名时加 `vuna-` 前缀（项目 `.agents/skills` 的优先级低于
  `~/.config/opencode/skills`，同名会被全局版本覆盖）。
- **新增规则**：`rules/<topic>.md`，只写**长期成立**的约束；会随命令/实现变化的细节放
  `docs/reference/`，规则只留一句 + 链接。
- **不要两份真源**：规则与 `docs/` 冲突时以 `docs/reference/` 的现状为准，改完把过期的一侧
  删掉；历史决策留在 git 提交信息里。
