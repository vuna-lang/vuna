# bench/baselines

性能基线统一放在这里。**每个 family 只有一份**，不再按 target 拆文件。

| 文件 | 测什么 | 生成命令 | 检查 |
| --- | --- | --- | --- |
| `programs.json` | `vuna-perf`：全部生成程序 × ocaml/native/wasm | `sh bench/run.sh --target all --runs 5 --warmup 2 --json bench/baselines/programs.json` | `vuna-perf --check`（只比本次跑的 target / benchmark；`--only eff_*` 就是效应子集） |
| `bootstrap.json` | 构建链 / 自举 / 编译墙钟与产物尺寸 | `sh bench/bootstrap.sh --quick --json bench/baselines/bootstrap.json` | `vuna-bench --check` |
| `compiler.txt` | 工具链命令（check/build/map/fmt）墙钟 | `sh bench/compiler.sh --save-baseline` | `compiler.sh --check` |
| `native.json` | 编译器编到 native 后的端到端（`check packages/base` 冷/热；`--full` 加 compiler 包） | `sh bench/native.sh --full --json bench/baselines/native.json` | `native.sh --check` |

统一重标：

```console
nix build .#vuna --out-link result
sh bench/update-baselines.sh            # programs + bootstrap + compiler（有 result-native 时加 native）
sh bench/update-baselines.sh --only programs
```

口径：

- `programs.json` 的绝对 ms / KB 只与同一机器可比；跨机器只比 `meta` 里的 `git_head` 之外的
  `ratio`（vs 手写 OCaml）与 `rss_ratio`。wasm 另记 `net_median_ms` / `net_vs_handwritten`
  （已减 `meta.node_startup_ms`）。
- `programs.json` 里每个 target 都带 `artifact {bytes, lines}`（wasm 是 `wat_bytes`/`wasm_bytes`）；
  `--check` 用 `--artifact-threshold`（默认 20%）单独比。
- `native.json` / `compiler.txt` 只比绝对值，要求同机器、同编译器。
- `--check` 默认软告警；`--strict` 把 WARN 变 exit 1，`--fail-threshold`（默认 50%）直接失败。
- 基线是回归参照，不是跨机器排行榜：换机器或换编译器后应重新生成，而不是改阈值。

已知口径边界：

- `programs.json` 的 `meta.git_head` / `git_dirty` 记录生成时的源码状态；`--check` 不读这两个字段。
- `bootstrap.json` 由构建链自己测量（stage0/stage1/product），与 `compiler.txt` 的 CLI 命令不是同一负载，不要混用成一个信号。