# bench/baselines

性能基线统一放在这里。**每个 family 只有一份**，不再按 target 拆文件。

| 文件 | 测什么 | 生成命令 | 检查 |
| --- | --- | --- | --- |
| `programs.json` | `vuna-perf`：全部生成程序 × ocaml/native/wasm | `sh bench/run.sh --target all --runs 5 --warmup 2 --json bench/baselines/programs.json` | `vuna-perf --check`（只比本次跑的 target / benchmark；`--only eff_*` 就是效应子集） |
| `bootstrap.json` | 构建链 / 自举 / 编译墙钟与产物尺寸 | `nix run .#vuna-bench -- --quick --json bench/baselines/bootstrap.json` | `vuna-bench --check` |
| `compiler.txt` | 工具链命令（check/build/map/fmt）墙钟 | `sh bench/compiler.sh --save-baseline` | `compiler.sh --check` |
| `artifacts.json` | 三端产物：文本文件树/字节/行数、最终二进制大小、分段构建时间（minimal / hello / defs-N / mods-N / self） | `nix run .#vuna-artifacts -- --json bench/baselines/artifacts.json` | `vuna-artifacts --check` |
| `native.json` | 编译器编到 native 后的端到端（`check packages/base` 冷/热；`--full` 加 compiler 包，compiler 档在 D122 关闭前跑不完，当前基线 `"full": false`） | `sh bench/native.sh --runs 3 --json bench/baselines/native.json`（`--full` 可用时再加） | `native.sh --check` |

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
- `artifacts.json` 是**尺寸基线**：生成物不含绝对路径/时间戳、工具链由 flake 固定，
  所以文本/二进制大小跨机器可比（默认 5% WARN / 20% FAIL，FAIL 退出 1）；构建耗时只与
  同机同 arch 的基线比，且是软判定（默认看 `*_cpu_ms`，20% / 50%，只报告）。
- `native.json` / `compiler.txt` 只比绝对值，要求同机器、同编译器。
- `--check` 默认软告警；`--strict` 把 WARN 变 exit 1，`--fail-threshold`（默认 50%）直接失败。
- 基线是回归参照，不是跨机器排行榜：换机器或换编译器后应重新生成，而不是改阈值。
- 重标一律走 nix 包装（`nix run .#vuna-artifacts` / `.#vuna-bench`）：它们把仓库构建的
  `vuna` 放进 PATH 首位。直接 `sh bench/artifact.sh` 会用 PATH 上的 `vuna`，可能命中
  profile 里的旧编译器（症状：老二进制编不动新输入，报 `IC_FuelExhausted` 之类）。

已知口径边界：

- `programs.json` 的 `meta.git_head` / `git_dirty` 记录生成时的源码状态；`--check` 不读这两个字段。
- `bootstrap.json` 由构建链自己测量（stage0/stage1/product），与 `compiler.txt` 的 CLI 命令不是同一负载，不要混用成一个信号。