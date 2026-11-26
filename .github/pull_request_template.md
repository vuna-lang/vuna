## 关联

Closes #N / Refs #N（PR-only 改动写 `no issue` 并加 `no-issue` 标签）

> `.github/workflows/gates.yml` 要求这里有 `Closes #N` / `Refs #N`，或者 PR 带 `no-issue` 标签。

## 变更

-

## 提交整理

- [ ] 已 `git rebase -i origin/main` 整理：无 WIP / `fixup!` / `squash!`，`chore(seed)` 独立提交
- [ ] 已 rebase 到最新 `origin/main`，分支无 merge commit
- [ ] 一个提交只做一件事

## 验证（跑过 / 没跑）

- [ ] `nix run .#ci -- pr`（CI 自动；必需检查 `pr / run`）
- [ ] 相关 suite：`nix run .#vuna-run-tests -- --only <owner/family>`
- [ ] 按改动面跑过对应本地门禁（`nix run .#ci -- deep|suite|backends|native|browser`）
- [ ] 未跑：

> `gates / run` 会按 `type:*` + `pkg:*` / `area:*` 自动选择检查；PR 标签由 triage 自动维护，
> 不需要手动加 `deep` / `suite`（需要强制整组时再加）。

## seed / 后端

- [ ] 无 seed 变更
- [ ] 含独立 `chore(seed)` 提交，fixed point 已验证
- [ ] 三端同步（OCaml → WASM → Native）

## 风险与回滚