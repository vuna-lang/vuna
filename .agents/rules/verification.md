# 验证：本地口径与 CI 口径

**本地只跑便宜且相关的检查；CI 口径留给合并前 / Lead / CI。** 汇报时必须写清「跑过什么、
没跑什么」，没跑完不是通过。

## 本地口径

```console
nix run .#vuna -- check .                        # 自检（DT 单路径）
nix run .#vuna -- check <pkg>                    # 只查该包入口 import 闭包
nix run .#vuna -- fmt <改动的文件/目录>           # 代码改动后必跑
nix run .#vuna-run-tests -- --only <owner/family>   # 按 owner/family 跑原生 suite（--list 看 id）
```

- 默认用 `nix run .#vuna -- <subcommand>`：按当前 worktree 的源码构建，永远对应当前代码。
- 需要固定二进制（反复调用、传给脚本、性能读数）时先 `nix build .#vuna --out-link result`
  （缓存命中约 10–15s），再用 `./result/bin/vuna`；`result` 是共享 out-link，可能指向别的
  产物（例如 `vuna-wasm-browser`）或旧二进制，用之前确认刚构建过。
- **改完源码要验证 `nix build` 真的重建了**：机器级 eval cache 会在副 worktree / 未提交
  改动下返回旧求值（`Output paths:` 里是同一个 store 路径、也没有 `building ...` 行）。
  加 `--option eval-cache false`；判据是产物里能看到刚加的字符串（或 store 路径变了）。
- 测试别为验证一处改动跑全量：先 `--only <owner/family>`，必要时再 `--filter PAT`。
- 只有纯 `Int`/`String`/`Bool` 的夹具能走核心求值（进程内 interp 阶段）；`main : Eff [] a` 走
  `compile`/`build` + 运行产物。

## 按改动面选验证

完整矩阵在 [`docs/architecture.md`](../../docs/architecture.md) 的「改一处 → 跑什么」，
按其所在链路选 case（--list 看 owner/family/id）。常用对应关系：

| 你改了什么 | 至少跑 |
| --- | --- |
| `packages/cli/`（工具链）/ `docs`/`nix` | 相关 family + `vuna check .` |
| `packages/base/`（含效应 monad、`dbg!`/`assert`） | `--only dt` / `dt_base` / `dt_err` + `vuna check .` |
| `packages/compiler/`（语法 / 类型 / 精化 / 擦除） | 相关 family + `vuna check .`；合并前 `checks.seed-selfhost` |
| codegen / 运行时 / `#line` / 观测 | 相关 family + `checks.vuna-obs-*` + `vuna check .` |
| CLI（`run`/`test`/REPL/LSP） | `--only steps_native` 下的 `14_cli` / `42_repl` / `47_*` / `48_run_cmd` / `49_repl_debug` / `54_*` + `corpus/lsp/smoke.sh` |

## 硬门禁（改到相关面时必须确认）

- **seed 自举**：改 `packages/compiler/` 后先确认「旧种子能编译新源码」——本地
  `nix build .#vuna-seed`，或等 CI 的 `checks.seed-selfhost`；要用的新语法先以旧语法落地
  → rotate → 再用新语法。
- **隐藏效果守卫**：`sh nix/checks/lib/eff-boundary.sh`（基线 `nix/checks/data/eff-boundary.allowlist` 为空，
  只允许减少、不允许新增）；编译器/工具链不得用 `runPure` 在纯签名里隐藏 Eff 执行。
- **格式化**：`vuna fmt --check <PATH>`；省略 PATH 时扫 workspace 各包 `lib/app/test`
  （`test/corpus/` 夹具跳过）。
- **层方向**：`packages/compiler/vuna.toml` 的 `[layers]` 由 loader 在 `vuna check .` 时强制（越层报
  `LD_LayerViolation`）；`checks.ir-boundary` 只留正向断言与 IR 形状断言。
- **TCB 边界**：`seed/` 只含 compiler 包入口闭包；工具链（整个 `packages/cli/`）不进 seed，
  黑名单见 `nix/seed/forbidden.txt`。

## 跨后端变更（原语 / 运行时）

- **顺序**：OCaml 驱动 → 需要时 `sh nix/seed/rotate.sh ./result/bin/vuna`（先用 `nix build
  .#vuna --out-link result` 固定二进制；独立
  `chore(seed)`）→ WASM → Native。OCaml 落地后才能用新原语改 `packages/base/`（seed 闭包）。
- **验收**：三个后端各自的 effect/run 章节 + 对应 native/wasm 对拍；只落一个后端不算完成。
- 原语登记点：`Base/Intrinsics.vuna`、`Ir/Runtime.vuna`、`Wasm/Runtime.vuna`
  （`rtImplOf`）、`Native/Runtime.vuna`（`nativeRtTargetBase` / `nativeRtValueArityBase`）。

## CI 口径（合并前/Lead）

```console
nix flake check                      # 3 packages + 19 checks
nix run .#vuna-run-tests             # 全量 suite
```

清单与各 check 的职责见 [`docs/reference/testing.md`](../../docs/reference/testing.md)。
性能问题不要用 CI 全量做定位——按技能 `perf-debug` 的增长率规程走。
