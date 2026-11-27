# 测试门禁与基准（Nix checks / 后端自举 / 本地开发）

本页是 [testing.md](testing.md) 的另一半：那里讲 suite 与 corpus（用例怎么发现、怎么写、
怎么分类），这里讲**门禁怎么跑**——`nix flake check` 的 checks 清单与各 check 的语义、
native 自举 conformance、Nix 命令与本地开发、手动性能基准，以及 effect 测试的执行。

## Nix checks 清单

`nix flake check` 实测 **41 项**：3 个 package 构建（`vuna` / `vuna-compiler` /
`vuna-seed`，同时暴露为 checks）+ 38 个 check 语义项（`context-budget`、
`seed-selfhost`、`vscode-ext`、`vuna-checks-inventory`、`vuna-compiler-growth`、
`vuna-compiler-growth-ctor`、`vuna-compiler-growth-incremental`、`vuna-container-growth`、
`vuna-diag`、`vuna-effect-machine-growth`、`vuna-fmt`、`vuna-frontend-growth`、`vuna-iface-selftest`、
`vuna-lint`、`vuna-metrics`、`vuna-native-artifact`、`vuna-native-codegen-growth`、
`vuna-native-surface`、
`vuna-nix-fmt`、`vuna-obs-dwarf`、`vuna-obs-overhead`、
`vuna-obs-schema`、`vuna-resolve-chain-growth`、`vuna-single-pass`、`vuna-static`、
`vuna-tests-base`、`vuna-tests-core`、`vuna-tests-e2e`、`vuna-tests-frontend`、
`vuna-tests-gate`、`vuna-tests-ir`、`vuna-tests-native`、`vuna-tests-ocaml`、
`vuna-tests-runtime`、`vuna-tests-toolchain`、`vuna-tests-wasm`、`vuna-wasm-browser`、
`vuna-typecheck`；主体是 `nix/checks/<name>.sh`，共享实现与并入门禁的实现放在
`nix/checks/lib/`）。

门禁分组在 `nix/checks/groups.nix`，PR 增量检查在
`nix/checks/pr-gates.nix`；本地与 CI 共用 `nix run .#ci -- <group>` /
`nix run .#ci -- run-plan <labels>`。`.github/workflows/ci.yml` 跑固定分组，
`_check.yml` 是共用的 restore → 运行 → save 流程：

| group | 内容 | 何时跑 |
| --- | --- | --- |
| `pr` | `vuna-fmt` / `vuna-lint` / `vuna-typecheck` | main push、所有 PR（`pr / run`） |
| `gate` | `vuna-tests-gate`（完整 fast+integration）+ `vuna-tests-units` | 本地全量 / 未分片的单 derivation |
| `slices` | 7 个 `vuna-tests-*` area 切片 | PR 计划器按 area 选；本地 `nix run .#ci -- slices` |
| `deep` | `pr` + 全部便宜门禁（静态 / 诊断 / 增长 / obs / metrics / 后端产物基线 / `seed-selfhost`） | 定时、手动、`deep` 标签 |
| `suite` | `vuna-tests-gate` + `vuna-tests-units` + `vuna-tests-e2e`（未分片） | 本地全量；CI 定时/手动改跑下面 3 组分片 |
| `gate-shard-0..3` | `vuna-tests-gate-shard-i`（`--shard i/4`） | CI main push / 定时 / 手动，以及 PR 计划里含完整 gate 时（matrix 并行） |
| `e2e-shard-0..3` | `vuna-tests-e2e-shard-i`（`--shard i/4`） | CI 定时 / 手动，以及 PR 计划里含完整 e2e 时（matrix 并行） |
| `units` | `vuna-tests-units`（各包 `vuna test`） | CI main push / 定时 / 手动 |
| `backends` | `vuna-tests-wasm` + `vuna-tests-native` | CI 定时 / 手动；本地 `nix run .#ci -- backends` |
| `native` | `vuna-native-conformance`（package：selfhost + parity + corpus） | CI 定时 / 手动；本地 `nix run .#ci -- native` |
| `browser` | `vuna-wasm-browser-smoke`（package） | 定时、手动、`browser` 标签 |

CI 的 `ci.yml` 把 gate 拆成 4 个、e2e 拆成 8 个 matrix job：每个 shard 是一个独立 derivation
（`VUNA_TEST_SHARD=i/4`），共用 `nix-suite-<os>-` 的 store cache（`cache-key: suite`），
gate 的第 0 片负责写 cache（其余 job 只 restore，避免同 key 并发写）。分片是**完整 case
集合的划分**而不是采样：`--shard i/N` 在 runner 内按耗时均分，每片仍执行自己那部分全部
case；每片带 `VUNA_TEST_MIN_CASES` 下限（gate 150、e2e 12）挡住分片过滤后骤降。包内单测
独立成 `units` job，不随 shard 重复。

PR 的必需检查是 `pr / run` 与 `gates / run`。`gates.yml` 的 `detect` 从 PR 的
`type:*` + `pkg:*` / `area:*` 计算检查子集；计划里出现完整 gate / e2e 时，`detect` 把它们
换成同一批 `gate-shard-*` / `e2e-shard-*`（`nix run .#ci -- plan-json` 的结果再切分），由
`suite` 矩阵并行跑，`gates / run` 只跑计划里剩下的检查并把 shard 结论一并收成 required
check。`deep` / `suite` / `browser` 标签仍可手动强制整组。`backend` 标签不触发 GitHub
job：wasm / native 矩阵与自举 conformance 只在定时 / 手动跑（见下两节）；改后端时本地用
`nix run .#ci -- backends|native` 先跑一遍（见 [github-workflow.md](github-workflow.md)）。

### PR 的 area 切片

`nix/checks/slices.nix` 把 area 组合成独立 check（独立 store path），PR 只构建命中的那些。
用例侧的影响面在 `suite.toml` 的 `[family.<name>] areas` 与 `*.steps` 的 `# areas:` 里
声明（语义与 `--area` 见 [testing.md](testing.md)「影响面（area）与 PR 切片」）：

| 切片 | area | tier | backend | 单测包 |
| --- | --- | --- | --- | --- |
| `vuna-tests-frontend` | `compiler-frontend` | fast+integration | ocaml | `packages/compiler` |
| `vuna-tests-core` | `compiler-core` | fast+integration | ocaml | `packages/compiler` |
| `vuna-tests-ir` | `ir` | fast+integration | ocaml | `packages/ir` |
| `vuna-tests-ocaml` | `codegen-ocaml` | fast+integration | ocaml | — |
| `vuna-tests-runtime` | `runtime` | fast+integration | ocaml | `base` / `http` / `web` |
| `vuna-tests-base` | `base` | fast+integration | ocaml | `packages/base` |
| `vuna-tests-toolchain` | `toolchain` | fast+integration | ocaml | `packages/plugin-kit` |

选择是**风险定向**的：它回答「这类改动最可能被哪些用例抓到」，不是严格依赖图（严格依赖会
让前端改动命中所有夹具）。完整覆盖由 nightly 的 `suite` 组（gate + e2e）兜底；切片保留
`minCases` 下限，过滤后 case 数骤降直接失败。`codegen-wasm` / `codegen-native` 不进 PR
切片（PR 计划里不按这两个 area 选检查；nightly 的 `backends` 组跑完整矩阵），它们的 area
标签只服务本地 `--area` 局部筛选。

**合并队列与 main 基线**：auto-merge 负责 arm，`merge-queue-sweep.yml` 在 required checks
变绿后补一次 enqueue（GitHub 回归 community#209348）；队列在最新 main + 队前 PR 的组合 head
上重跑 `pr / run` 与完整 `gates / run`（gate-shard-0..3 + units + area），绿后 rebase 落
main。main push 仍跑完整 gate 作为合并后兜底，定时 `suite` 继续覆盖 e2e。
`AUTOMERGE_TOKEN` 仍用于人工 / break-glass 推送触发 push 门禁。

**stacked PR 的 CI 成本**：stack 的每层都是独立 PR，`pr / run` 与 `gates / run` 对每层各跑
一次 `pull_request`；入队后 `merge_group` 按组完整跑 `gate-shard-0..3 + units` + area，超大
stack 拆到后续组时每组各一次 build。检查不做 stack 专属缩减——每层都要独立满足 `main` 的
rules，否则上层会卡在合并框。层数因此直接放大总成本，仓库上限是每 stack 3 层
（见 [github-workflow.md](github-workflow.md)「Stacked PR 与合并队列」）；单次耗时按实测，
不承诺固定分钟数。

每组有独立的 Nix store cache 前缀（`nix-<group>-<os>-<sha>`），只恢复自己组（冷启动回退
`deep` → `pr`），只在 main push 与定时 / 手动 dispatch 上写；`purge-created: 0` 让每组只留一代。
`nix run .#ci` 用 `--out-link .ci/result` 构建，产物是 save 前 GC 的 root，所以保存时只会
回收上一代遗留的 store 路径。restore / save 是独立 action，门禁失败也照常保存，因此不需要
`continue-on-error` + 汇总 job：每个组的 job 状态就是结论。

`CI_JOBS` 控制 `nix build` 的并行度：`pr` / `deep` 用默认 2（`--cores` 为核数/2），
`suite` / `browser` / `backends` / `native` 用 1，把 runner 的 4 核全给单个 derivation。

保存前还有一个 `Drop builder lock files` 步：Nix 在 store 里留下 `<out>.lock`
（root 0600），非 root 的 tar 读不动会让整次保存失败。

语义项：

- `seed-selfhost`：seed→stage0→stage1→stage2 逐字节一致、TCB 黑名单、seed 完整 allowlist、闭包数量、增量构建、
  行为抽查与 seed 滞后报告（不阻塞）；
- `vuna-tests-wasm` / `vuna-tests-native`：各包 suite 在 `--backend wasm|native` 下跑
  `fast integration`，只覆盖 matrix 允许该目标的 case（`pure-cross` + 对应 `effect-*`）；
  wasm 的执行宿主是 Node/V8（`wasm-host/run.mjs`），即「浏览器可跑面」的行为门禁。
  `test/suite/wasm-allow-fail.txt` 是允许失败清单（当前为空），命中且失败按 `allow` 计
  （不算 skip，`--strict-skips` 不抓），见 [wasm.md](wasm.md) §8.5。
  ocaml 的完整门禁仍由 `vuna-tests-gate` 逐份调用各包 suite 承担。
- `vuna-static`：结构守卫（诊断码 / IR 边界 / 进程绑定岛 / 隐藏效果 / **suite 清单**）——
  `test/suite.toml` 的 driver 清单必须覆盖所有 `packages/*/test/suite.toml`，且每个 suite
  带 `owner` 与正的 `min_cases`。
- `vuna-wasm-browser`：产物在**默认 wasm 特性**下必须 validate 通过——纯程序、内建宿主效应、
  宿主效应 + 用户 handler 三种形态都走显式效应机器，不含 `cont` / `$eff`，**都不需要 stack
  switching**（门禁按 `--features=-stack-switching` validate 三份产物）。Chromium 实跑那一档
  也跑 `mixed` 产物并期望 `done4`。默认不跑浏览器（保持 `nix flake check` 秒级）。
- `vuna-wasm-browser-smoke`（**package，不在 `nix flake check` 里**）：用 Playwright 驱动
  `pkgs.playwright-driver` 的 chromium（revision 与 `pkgs.playwright` 对齐，约 356 MB）做
  headless 实跑，跑法与本地一致：
  ```console
  nix build .#vuna-wasm-browser-smoke
  ```
  注意构建里必须给可写的 `HOME` / `XDG_*`：浏览器崩溃上报器（crashpad）没有 database 目录会
  `SIGTRAP`。本地单跑一条产物：
  ```console
  VUNA_PLAYWRIGHT=$(nix build --impure --no-link --print-out-paths \
    --expr 'let f = builtins.getFlake (toString ./.); in f.inputs.nixpkgs.legacyPackages.x86_64-linux.playwright')
  VUNA_CHROMIUM=$(nix build nixpkgs#playwright-driver.browsers-chromium --no-link --print-out-paths)/chromium-*/chrome-linux64/chrome
  VUNA_PLAYWRIGHT=$VUNA_PLAYWRIGHT VUNA_CHROMIUM=$VUNA_CHROMIUM \
    node test/suite/fixtures/wasm_js_host/browser.mjs <main.wasm> --expect 'hi2<换行>'
  ```

- `vuna-fmt`：workspace 全包与 `examples/`；
- `vuna-nix-fmt`：`flake.nix` 与 `nix/` 下的 Nix 文件必须与 `nixfmt` 输出一致；
- `vuna-checks-inventory`：顶层 `nix/checks/*.sh` 与 `default.nix` 的登记一一对应
  （`nix/checks/lib/` 是共享实现，不入登记面），防止 orphan 脚本；
- `vuna-compiler-growth`：合成 500/1000/2000/4000 同形定义，相邻档墙钟比 ≤2.3（增长率
  门槛，跨机器有效）；
- `vuna-compiler-growth-incremental`：合成可执行包（N 个同形 def + `app/Main.vuna`），
  先落依赖接口、再以独立进程计时**第二次 check**（包路径增量收尾），1000/2000/4000/8000
  相邻档 ≤2.6；单文件探针走全量精化，覆盖不到 `dedup*`/`anyOwn`/写接口这类收尾热点
  （见 [performance.md](performance.md) §5.2）；
- `vuna-frontend-growth`：合成 2000/4000/8000 个同形定义，`fmt --check` 的 CPU 时间相邻档
  ≤2.5×；trace 的 `vuna.parse.lex` / `vuna.parse.syntax` 的 `totalUs`（按同一进程窗口的
  CPU / 墙钟比折算）聚合了整个 base 闭包的解析、且会跨过 minor heap 回收台阶，因此只断言
  2000→8000 的 4x 窗口 ≤8×，相邻档仅作诊断。与 `vuna-compiler-growth` 互补（整条 check 里
  前端只占几个百分点，n² 会被精化成本掩盖）。读数见 [performance.md](performance.md) §6.1；
- `vuna-resolve-chain-growth`：合成 `g = 1 + 1 + …`（2000/4000/8000 项）的单文件中缀链，
  从 trace 取 `vuna.resolve.warn` 的 `totalUs`，相邻档 ≤2.5×；重排后的左结合链是左嵌套，
  引用名收集按层 `append (左子结果) …` 就是 O(n²)，而真实源码链短、别的探针看不见它；
- `vuna-container-growth`：HashMap / Queue / TreeMap / PriorityQueue / Sort 各三档合成探针
  （N / 2N / 4N），先编译成 OCaml 后端产物、只测**运行** CPU 时间（user+sys，编译不计），
  相邻档 ≤3.0×；
  线性路径 ≈2、n² 退化 ≈4。容器契约见 [stdlib.md](stdlib.md)「容器复杂度契约」；
- `vuna-effect-machine-growth`：效应机器两个深度探针，都只测运行墙钟（编译不计）——
  ① `frames`（OCaml 后端）：每层装一个 handler、内层返回后在本层非尾 `perform`，层数
  100k / 200k / 400k，每档 30s 硬上限 + 相邻档 ≤3.0×（本机 2.1–2.4×），挡 `MSt.msUsed` /
  handler 帧链按活续延数二次退化；② `answer-row`（native 后端）：handler 的 clause 先
  `perform` 一次外层效应再 resume，N=40000 单档 10s 硬上限（本机约 0.37 s）——这条路径的
  退化只在 native 上可见，比值门槛分不清，用数量级余量的绝对上限抓。夹具侧的小尺寸版本是
  `effect/perf/51_eff_nested`，复杂度契约见 [effect-machine.md](effect-machine.md)；
- `vuna-metrics`：冻结夹具（`corpus/codegen`）的 codegen 产物对
  `nix/checks/data/codegen.baseline` 的精确基线；种子尺寸不设门槛（见 [compiler.md](compiler.md)
  §codegen 夹具基线）；
- `vuna-native-surface`：native 平台面（syscall 站点、`.bss` 宿主缓冲上限、内核路径）
  对 `nix/checks/data/native-surface.baseline`；平台知识只能经这条基线变化
  （见 [native-platform.md](native-platform.md)）；
- `vuna-native-artifact`：最小程序的 `runtime.s` / `Main.s` 逐字节基线。`runtime.s` 与
  程序无关、覆盖全部运行时函数，因此纯重构必须保持它不变（见 [native-runtime.md](native-runtime.md) §2）；
- `vuna-native-codegen-growth`：native codegen 的两类探针——右深标量链
  `1 + (2 + (… + x))` 与 N 个顶层闭包 `g0 … gN`——各 100/400/800 档，每档在 120 s 硬上限内
  完成、相邻档墙钟 ≤6×+5 s（线性 ≈2×）。这两类形状分别对应标量链回溯与跳转目标枚举的
  指数级退化，每档独立空 `VUNA_STORE`；
- `context-budget`：入口文档字节数与单模块行数对 `nix/checks/data/context.budget`（预算按实测 ×1.5
  留余量；超过预算失败，达到 70% 只打印 `WARN`。`WARN` 在本机跑 check 时可见，nix 只在
  失败时打印 builder 日志，所以 CI 成功时不显示）；
- `vscode-ext`：提交的 `vscode/dist/extension.js` 与清单 / 语法文件的离线自检，不跑
  `npm install`。

## 后端自举 conformance（`vuna-native`）

`vuna-native` 把「编译器编译自己」固化成可执行入口，CI 用它跑与 OCaml 版同规格的检查。
wasm 不自举（浏览器/边缘受限后端的契约见 [wasm.md](wasm.md)），因此没有 wasm 侧的
自举产物与 runner。该 package **不进 `nix flake check`**：整轮成本远高于日常门禁。
CI 里由 `ci.yml` 的 `native` job（定时 / 手动）构建 `vuna-native-conformance`（构建即运行
`backend-check --scope all`）。整轮的大头是单线程的 native 自举编译（20+ 分钟），
conformance 本身约 5 分钟，所以不放 push / PR；本地手动入口是
`nix run .#ci -- native`。fast+integration 的 native / wasm 矩阵由 `backends` job
（同样定时 / 手动）覆盖。

| 包 | 产物 | 说明 |
| --- | --- | --- |
| `vuna-native` | `bin/vuna-native` + `bin/vuna-target-{native,wasm}` + `base/` | 原生可执行文件 + 它编非 OCaml 目标要用的后端插件（与产品 CLI 同构，插件按 `<exeDir>` 发现）；`build-id` = 编译器源码闭包身份，`cache-tag` = 二进制摘要 |

runner 是 `nix run .#backend-check -- --compiler native`，四个 scope：

| scope | 断言 |
| --- | --- |
| `selfhost` | workspace 的每个成员包各跑一次 `check <member> --error-format json`：零 error 诊断且 exit 0。成员清单取根 `vuna.toml` 的 `members`；每个成员独立进程，默认串行（native 单包峰值 RSS 5–6 GiB；`VUNA_BACKEND_SELFHOST_JOBS` 可调大） |
| `selfhost-stress` | 整仓单进程 `check . --error-format json`：**成本读数**。报错算失败；超时 / 无 json 记 skip，不阻塞（整仓单堆的形状见 [native-selfhost.md](native-selfhost.md) §4.1） |
| `parity` | `corpus/pure_cross/*.vuna` 每个夹具在 `ocaml` / `wasm` / `native` 三个输出目标上 `build --target` + 宿主执行，输出与 `.out`（或仅 run 的 `.run.out`）逐字相等（与 suite 的 `pure-cross` 分类同源） |
| `corpus` | `test/corpus` 的每个夹具各一条断言：有 `*.diag.json`（目录夹具是 `expected.diag.json`）的比 `(severity, code, file, line, col)` 多重集（`file` 只比 basename）；其余有 `.out` / `.run.out` / `expected.out` 的要求零 error 诊断；无期望文件的不计入。工具链家族（`fmt` / `lint` / `fix` / `doc` / `cli` / `repl` / `search` / `lsp` / `codegen` / `cst`）的 `.out` 是工具输出、`packages` 是多包/workspace 语义，这两类跳过并计数 |

`--scope all` = `selfhost,parity,corpus`（不含 `selfhost-stress`），默认 `selfhost,parity`。
`--jobs N` 控制 parity / corpus 的并行度，`--filter PAT` 只跑匹配的夹具，`--target` 收窄
parity 的输出目标。selfhost 的并行度独立：`VUNA_BACKEND_SELFHOST_JOBS`（默认 `1`；内存允许时调大，单成员峰值 5–6 GiB；CI 设 `2`）。

每条外部命令（编译器、`cc`、`node`、生成的程序）默认 240 s 上限
（`VUNA_BACKEND_TIMEOUT=<秒>`，`0` = 不限）；selfhost 的每个成员是单独一条命令，默认
1200 s（`VUNA_BACKEND_SELFHOST_TIMEOUT=<秒>`，`0` = 不限）。超时的夹具按失败计入清单，
其余夹具继续跑：单条命令挂住时按超时计入失败，没有超时整轮会被拖到 job 级 timeout 而丢掉
失败面。失败达到 `VUNA_BACKEND_MAX_FAILS`（默认 `0` = 不限；CI 设 20）后停止派发剩余
夹具，其余记为 skip——编译器整体坏掉时清单已经很说明问题。

```console
nix run .#backend-check -- --compiler native --scope parity --jobs 8
nix run .#backend-check -- --compiler native --scope all --jobs 8
nix run .#backend-check -- --compiler native --scope selfhost
nix run .#backend-check -- --compiler native --scope selfhost-stress
```

CI 里 native 组的 job 就是 `vuna-native-conformance` 派生的构建结果：失败即 job 红
（边界见 [native-runtime.md](native-runtime.md) §4）。三个 scope 的当前读数、逐包耗时、
单进程整仓检查的成本形状与已知边界见 [native-selfhost.md](native-selfhost.md)；
本页只保留门禁语义与运行方式。

**口径约束**：编译器必须与被测源码同一棵树构建——Nix 派生天然满足；手工跑时先
`nix build .#vuna-native`，不要拿旧二进制去跑新源码（诊断会指向编译器的能力差异，而不是
夹具问题）。

## Nix 命令与本地开发

```console
nix build                  # 默认 = vuna；.#vuna-compiler / .#vuna-seed 同理
nix run .#ci -- pr          # 门禁分组：pr / deep / suite / backends / native / browser
nix run .#ci -- --list      # 打印每组包含的 installable
nix run .#ci -- deep        # 本地完整便宜门禁（与 CI 的 deep 同一条命令）
nix run .#ci -- plan type:perf area:base      # 预览 PR 增量检查
nix run .#ci -- run-plan type:perf area:base  # 只跑这些检查
CI_TOKENS=8 CI_JOBS=4 nix run .#ci -- deep   # 覆写并行度（默认 CI_JOBS=2，cores=核数/2）
nix flake check            # 本地全量兜底（包括 suite / 后端矩阵；CI 不用）
nix develop                # 全量开发环境（工具链 + vuna-seed）；.#ocaml 只有 OCaml 工具链
nix build .#vuna --out-link result-vuna      # 产品 CLI（stage 1）
nix build .#vuna-compiler --out-link result-compiler  # 编译器 CLI（stage 1）
nix build .#vuna-seed --out-link result-seed          # stage 0 种子编译器
VUNA=$PWD/result-vuna/bin/vuna VUNA_SEED=$PWD/result-seed/bin/vuna-seed \
  vuna dev suite --all --jobs auto
```

**`result*` 可能过期**：out-link 只是手工指到某次构建，源码 / seed 变了不会自动更新。需要
确定的产物路径时用 `nix build --print-out-paths --no-link .#vuna`（不建软链），或先重建对应的
`nix build ... --out-link`（见下方「Nix 命令与本地开发」）。

`devShells.default` = `ocaml`/`ocamlopt` + `vuna-seed`；`devShells.ocaml` 只有工具链，种子
重建或损坏时用它。stage 1 的 `vuna` 不进任何 devShell，避免种子失效时连 shell 都进不去；
`VUNA_SEED` 只需要一个能 `build --no-compile --out`（或 `compile`）的编译器。

## 性能基准（手动）

`nix run .#vuna-bench` 是**手动**基准（不是 CI check，结果依赖机器）：默认测 `vuna`，
`--compiler seed` 改测 `vuna-seed`；`--quick` 快速冒烟，`--runs N --save F` 存档，
`--baseline F` 与历史对比（JSON 用 `jq` 解析），`--with-tests` 额外跑全部 checks，`--json`
输出机器可读报告。入库基线 `bench/baselines/bootstrap.json`、`--check`（默认读基线，超
`--threshold N`（默认 20%）只打印 `WARN`、退出 0）、`--strict`（同机 + 同 compiler 的
WARN 变失败）。基准不进 CI（结果依赖机器）；需要时本地手动跑。
跨机器 / 不同口径只做软告警。

报告包含三级构建（seed → vuna-compiler → vuna 的 ocamlopt 时间）、编译性能（自编译
compiler 闭包、corpus 批量、tiny 程序、DT 精化 + 擦除 codegen）、吞吐、产物
bytes/lines/最长行/行尾空白、codegen 健康度计数（`let rec`、`String.concat ""`、
`bi_eq_int/_str/_bool`、零参定义）以及 fixed point / seed 一致性与可选 tests 状态。中间
产物写入临时目录（`TMPDIR` 可覆盖），不写入仓库。基线在空闲机器上重跑：
`nix run .#vuna-bench -- --quick --json bench/baselines/bootstrap.json`（或默认 runs=3 更稳）。

所有构建口径都是逐模块 split（`compile`/`build`/seed 同一种产物），没有「单文件
`main.ml` vs 多模块」两种读数需要区分。

产物本身另有一份基线：`nix run .#vuna-artifacts`（`bench/artifact.sh`）测三端的
`.ml` / `.s` / `.wat` 文件树与字节/行数、最终 `prog` / `main.wasm` 大小、以及
`vuna compile` 与外部工具链的分段构建时间（含 user+sys CPU），按 `hello` /
`defs-N` / `mods-N` / `self` 分档。基线 `bench/baselines/artifacts.json`；
`--check` 的尺寸阈值默认 5% / 20%（跨机器可比），耗时 20% / 50%（同机、软判定）。
读数见 [performance.md §产物规模](performance.md)。

## effect 测试的执行

`vuna test` 的 effect 测试（`main : Eff ...`）在私有临时目录 `compile` + `build.sh` 后运行，
产物不落对象库、没有跨 run 的二进制缓存。pure 测试仍走 `interpretFile`，不缓存。没有
coreutils `timeout` 时同一路径不加外部超时。REPL 的动作表达式同样在私有临时目录编译运行。

## 相关阅读

- suite 与 corpus 怎么写、怎么分类：[testing.md](testing.md)；测试体系设计（共享对象库 /
  store-isolated）：[test-architecture.md](test-architecture.md)
- 种子不变量与 rotation：[bootstrap.md](bootstrap.md)；编译器模块职责：[compiler.md](compiler.md)
- 改动定位与建议测试标签：[architecture.md](../architecture.md)
- lint 规则：[lint.md](lint.md)；错误码：[tooling.md](tooling.md)