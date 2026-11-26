---
name: vuna-commits
description: 写或校验 vuna 仓库的提交信息时使用——`type(scope): 中文描述` 的 Conventional Commits 口径、scope 选择、一次提交只做一件事、seed 轮换独立提交、开 PR 前的 rebase -i 整理。
---

# vuna 提交信息

格式：

```
type(scope): 中文描述
```

- `type` 用小写：`feat` / `fix` / `docs` / `chore` / `refactor` / `test` / `perf` / `build` / `ci` / `style` / `revert`。
- `scope` 用受影响的包或子系统短名，例如 `compiler` / `elab` / `ir` / `base` / `cli` /
  `toolchain` / `store` / `ci` / `seed` / `docs` / `debt` / `bench`。
- 描述用中文，写清「改了什么、为什么」；不要写 `update`、`fix bug`、`wip`。
- 一次提交只做一件事；格式化、重命名、行为变更分开。
- `seed/` 轮换必须独立成 `chore(seed): ...`，不与特性提交混在一起。
- 跨后端原语 / 运行时变更在同一轮完成 OCaml → WASM → Native，提交里说明三端都已落地。

## 开 PR 前整理

`main` 只接受线性历史，PR 用 rebase merge，因此提交信息会原样保留：

```console
git fetch origin
git rebase origin/main
git rebase -i origin/main
```

用 `squash` / `fixup` 合并 WIP，`reword` 修正描述，按逻辑重排；不允许 `fixup!` / `squash!` / `WIP`
残留。整理后跑 `nix run .#ci -- pr` 再推送。

## 示例

```
feat(store): 对象库按输入摘要复用视图
fix(elab): 实例头实参取尽时不再伪造 Int 类型
docs(debt): 同步 gh#100 的现状
test(store): 锁定精简后的对象库布局
chore(seed): 轮换 seed
```