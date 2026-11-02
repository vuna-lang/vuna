# 多包示例（M11.5 / M24）

workspace 根 `vuna.toml` 同时是包（`multi`，可执行入口 `app/Main.vuna`），
成员包 `greet` 通过 `[export]` 公开 `Greet` / `Greet.Internal`；根包在
`[dependencies]` 里以相对路径依赖 `greet` 与 `vuna-base`。

```console
vuna build examples/multi            # DT 单文件 codegen 到 examples/multi/.output，再调 ocamlopt
examples/multi/.output/bin/multi     # -> .output/bin/<包名>
vuna build --no-compile examples/multi  # 只生成 .output/{main.ml,build.sh}
vuna build --split /tmp/multi-split examples/multi  # 逐模块 OCaml 源码 + build.sh
vuna test examples/multi             # DT 核心求值 test/*.vuna，main : String 空串为通过
vuna fmt --check examples/multi      # 格式化检查
vuna doc examples/multi              # -> examples/multi/docs/api.md
```