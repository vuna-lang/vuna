# 验证：本地口径与 CI 口径

**本地只跑便宜且相关的检查；CI 口径留给合并前 / Lead / CI。** 汇报时必须写清「跑过什么、
没跑什么」，没跑完不是通过。

## 本地口径

```console
./result/bin/vuna check .                        # 自检（DT 单路径）
./result/bin/vuna check <pkg>                    # 只查该包入口 import 闭包
./result/bin/vuna fmt <改动的文件/目录>           # 代码改动后必跑
nix run .#vuna-run-tests -- --only <章节>        # 按章节跑原生 suite（--list 看章节）
```

- 编译器优先用**当前 worktree 自己**的 `./result/bin/vuna`；没有或版本可疑时
  `nix build .#vuna --out-link result`（缓存命中约 10–15s）。
- 测试别为验证一处改动跑全量：先 `--only <章节>`，必要时再 `--filter PAT`。
- 只有纯 `Int`/`String`/`Bool` 的夹具能走 `vuna interp`；`main : Eff [] a` 走
  `compile`/`build` + 运行产物。

## 按改动面选验证

完整矩阵在 [`docs/architecture.md`](../../docs/architecture.md) 的「改一处 → 跑什么」，
按其所在链路选章节。常用对应关系：

| 你改了什么 | 至少跑 |
| --- | --- |
| `lib/`（工具链）/ `docs`/`nix` | 相关章节 suite + `vuna check .` |
| `base/`（含效应 monad、`dbg!`/`assert`） | `--only dt` / `dt_base` / `dt_err` + `vuna check .` |
| `compiler/`（语法 / 类型 / 精化 / 擦除） | 相关章节 + `vuna check .`；合并前 `checks.seed-selfhost` |
| codegen / 运行时 / `#line` / 观测 | 相关章节 + `checks.vuna-obs-*` + `vuna check .` |
| CLI（`run`/`test`/REPL/LSP） | 第 40、42、47–49 段 + `corpus/lsp/smoke.sh` |

## 硬门禁（改到相关面时必须确认）

- **seed 自举**：改 `compiler/` 后先确认「旧种子能编译新源码」——本地
  `nix build .#vuna-seed`，或等 CI 的 `checks.seed-selfhost`；要用的新语法先以旧语法落地
  → rotate → 再用新语法。
- **隐藏效果守卫**：`sh nix/checks/lib/eff-boundary.sh`（基线 `nix/eff-boundary.allowlist` 为空，
  只允许减少、不允许新增）；编译器/工具链不得用 `runPure` 在纯签名里隐藏 Eff 执行。
- **格式化**：`vuna fmt --check <PATH>`；省略 PATH 时扫 workspace 各包 `lib/app/test`
  （`test/corpus/` 夹具跳过）。
- **TCB 边界**：`seed/` 只含 compiler 包入口闭包；工具链（整个 `lib/`、`app/`）不进 seed，
  黑名单见 `nix/tcb-forbidden.txt`。

## CI 口径（合并前/Lead）

```console
nix flake check                      # 3 packages + 19 checks
nix run .#vuna-run-tests             # 全量 suite
```

清单与各 check 的职责见 [`docs/reference/testing.md`](../../docs/reference/testing.md)。
性能问题不要用 CI 全量做定位——按技能 `perf-debug` 的增长率规程走。
