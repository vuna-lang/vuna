# 多包示例（M11.5）

workspace 根 `vuna.toml` 同时是包（`multi`，可执行入口 `app/Main.vuna`），
成员包 `greet` 通过 `[export]` 公开 `Greet` / `Greet.Internal`；根包在
`[dependencies]` 里以相对路径依赖 `greet` 与 `vuna-stdlib`。

```console
vuna build examples/multi            # -> examples/multi/Main.ml
ocamlopt -w -a -o examples/multi/main examples/multi/Main.ml && examples/multi/main
vuna test examples/multi             # 解释 test/*.vuna，main : String 空串为通过
vuna fmt --check examples/multi      # 格式化检查
vuna doc examples/multi              # -> examples/multi/docs/api.md
```
