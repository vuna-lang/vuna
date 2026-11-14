---
name: vuna-commits
description: 写或校验 vuna 仓库的提交信息——Conventional Commits 格式、type/scope 取值、中文描述、seed rotation 独立提交与 BREAKING CHANGE。当用户问提交信息怎么写、要提交改动、检查 commit message、或需要把改动拆成提交时使用。
---

# vuna 提交信息

本仓库沿用 [Conventional Commits](https://www.conventionalcommits.org/)：`type(scope): 描述`。
**描述用中文**，祈使/陈述语气，句末不加句号。历史保持线性（见 [`../../rules/workflow.md`](../../rules/workflow.md)）。

## 格式

```text
<type>(<scope>): <描述>

[可选 body：为什么改、影响面、取舍]

[可选 footer：BREAKING CHANGE: ... / Refs: #123]
```

## type

| type | 用在 |
| --- | --- |
| `feat` | 新功能、新能力、新命令 |
| `fix` | 修复错误行为 |
| `refactor` | 不改行为的结构调整 |
| `perf` | 性能优化（最好带读数） |
| `test` | 测试夹具 / suite / 门禁脚本 |
| `style` | 仅格式 / 空白（不影响逻辑） |
| `docs` | 文档、注释、AGENTS/技能 |
| `ci` | CI 流程与 check 定义（`nix/`、`.github/`） |
| `chore` | 杂项：seed rotation、依赖、构建/清理 |

## scope

用**包名或子系统**，能一眼定位改动面：

- 包：`compiler` / `base` / `lib` / `app` / `test` / `docs` / `nix` / `vscode`；
- 子系统：`obs` / `diag` / `ir` / `wasm` / `native` / `cache` / `store` / `seed` / `cli` / `effects` / `agents`。

省略 scope 只在改动确实跨仓库（如一次全局重命名）时使用。

## 示例

```text
feat(wasm): M2 局部绑定/顶层函数/Nat 递归与运行时补全（--target wasm 可用）
fix(obs): 三个门禁脚本的 OUT 解析不再拼出两行
docs(agents): 技能与规则归位到 .agents/（rules/ + skills/）
test(obs): suite 段 108 —— `vuna obs serve --cdp` + WS 桥
chore(seed): rotation 定稿（32 提交后的信任锚点）
```

## 拆分与 footer

- **一次提交只做一件事**：格式化、重命名、行为变更分开；跨包顺带重构拆成独立提交。
- **seed rotation 必须独立**成 `chore(seed): ...`，不与特性混在一起。
- **破坏性变更**：`type(scope)!: ...` 或 footer `BREAKING CHANGE: <说明>`（二选一，
  优先 footer 写清迁移方式）。
- 关联任务/Issue 用 `Refs: #<N>`；不要编造不存在的编号。

## 提交前核对

```console
git status --short        # 不应出现 result / .output / _scratch / .local / docs/api.html / docs/.generated
git diff --stat            # 确认范围与提交信息一致
```

代码改动若还没跑 `vuna fmt <改动文件>`，先跑再提交（见 [`../../rules/verification.md`](../../rules/verification.md)）。
