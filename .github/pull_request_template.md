## 关联

Closes # / 风巢 #

## 变更

-

## 提交整理

- [ ] 已 `git rebase -i origin/main` 整理：无 WIP / `fixup!` / `squash!`，`chore(seed)` 独立提交
- [ ] 已 rebase 到最新 `origin/main`，分支无 merge commit
- [ ] 一个提交只做一件事

## 验证（跑过 / 没跑）

- [ ] `nix run .#ci -- pr`（CI 自动；必需检查 `pr / run`）
- [ ] 相关 suite：`nix run .#vuna-run-tests -- --only <owner/family>`
- [ ] `deep` 标签已加并绿（改 compiler / base / ir / target / nix / seed）
- [ ] `suite` 标签已加并绿（改 test / 语言行为）
- [ ] `backend` 标签已加并绿（改 native / wasm / runtime）
- [ ] `browser` 标签已加并绿（改 wasm-host / 浏览器面）
- 未跑：

## seed / 后端

- [ ] 无 seed 变更
- [ ] 含独立 `chore(seed)` 提交，fixed point 已验证
- [ ] 三端同步（OCaml → WASM → Native）

## 风险与回滚