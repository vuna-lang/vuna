# 测试体系（testing）

本文覆盖原生 suite（`vuna dev suite`）、corpus 分类与包上下文夹具；Nix checks 清单、
后端自举 conformance、本地开发与性能基准见 [testing-checks.md](testing-checks.md)。
种子不变量与 rotation 见 [bootstrap.md](bootstrap.md)。

## 原生测试：`vuna dev suite`

repo 自测由 `vuna dev suite <suite.toml>` 驱动（原生 Vuna 实现，不是 shell
编排）。核心分层：

- `<test 根>/suite.toml`：suite 配置。`[suite]` 放全局默认（`owner`/`jobs`/`timeout`/`name`）；
  `[family.<name>]` 按目录约定把夹具展开成 golden/error case，`dir` 相对 suite 文件所在目录；
  case id 是 `<owner>/<family>/<相对路径>`；
- `<test 根>/steps/*.steps`（当前 `packages/*/test/steps`）：声明式步进用例（一套行式 DSL，见下）；
- 执行器在 `packages/dev/lib/Vuna/Test/{Suite,Run}.vuna`（插件 `vuna-dev`）；`vuna test` 的单元测试
  入口仍由工具链的 `Vuna.Cli.testArgs` 分派。

```console
vuna dev suite --all                      # 全部独立 suite（读 test/suite.toml 的清单）
vuna dev suite --all --list               # 列出所有 case（id 带 owner 前缀）
vuna dev suite packages/compiler/test/suite.toml --only dt   # 只跑一个 suite 的 owner/family/id 子串
vuna dev suite --all --filter compiler/dt/03  # 按 case id/tag 子串（跨 suite）
vuna dev suite --all --tier fast          # 只跑 fast 层（golden/error/lint/fix）
vuna dev suite --all --tier e2e           # 只跑 e2e 层（steps）
vuna dev suite --all --backend wasm       # 只跑 matrix 允许 wasm 的 case
vuna dev suite --all --matrix pure-cross  # 只跑三端差分精选集
vuna dev suite --all --filter layer:effect  # 按层次 tag 筛选
vuna dev suite --all --jobs 16            # 显式并行度（覆盖 auto）
vuna dev suite --all --timeout 240        # 每个 case 预算的上限（秒；更紧的 family 值仍生效）
vuna dev suite --all --json               # 机器可读汇总（每个 suite 一行）
```

### suite 归属

每个包在自己的 `test/` 下拥有独立 suite；`vuna dev suite --all` 读 `test/suite.toml`
的 driver 清单，**逐个调用**（共享 `VUNA_STORE`，预热由调用方做一次）：

| owner | suite 文件 | 内容 |
| --- | --- | --- |
| `compiler` | `packages/compiler/test/suite.toml` | 语言 / 精化 / DT / IR / 后端 + 后端机制 steps |
| `base` | `packages/base/test/suite.toml` | `Base.*` / `Prelude` 公开面语义 |
| `cli` | `packages/cli/test/suite.toml` | fmt / lint / fix / doc / 包管理 / store / LSP / REPL + 工具链 steps |
| `web-cli` | `packages/web-cli/test/suite.toml` | `vuna-web-cli` 静态服务 e2e |
| `http` / `web` | `packages/*/test/*.vuna` | `vuna test <pkg>` 的包 API 单测（不经过 suite） |
| `target-native` / `target-wasm` | `packages/*/test/RuntimeTable.vuna` | 运行时符号表 ↔ `Ir.Runtime` 契约：arity 一致 + 未实现符号的冻结清单 |

case id = `<owner>/<family>/<相对路径>`；`--only dt` / `--only compiler/` 都是子串匹配。
fixture 与 steps 的相对路径以**所属包的 `test/`** 为根（见 `[family] dir`）。
`--jobs N` 显式；未给出时用 `[suite].jobs`，再回落探测到的全部可用核（`VUNA_TEST_JOBS`
可覆盖）；`--jobs auto` 强制自动探测。
每个子进程仍有独立 `TMPDIR`；但 `VUNA_STORE` 由父进程解析一次、所有 worker/case 共享
（对象库是输入寻址的，见「共享对象库」）。

### 阶段矩阵：期望文件后缀

夹具的阶段参与由**期望文件后缀**表达（`<base>.<stage>.<artifact>`），family 旗标只是
各阶段的上限（关掉即不跑）。文件型夹具的 base 是 `*.vuna` 去掉扩展名；目录型夹具用
`expected.*`：

| 期望文件 | 语义 |
| --- | --- |
| `<base>.diag.json` | **负例的唯一期望载体**：结构化诊断（`check --json` 聚合文档）。断言 `(severity, code, file, line, col)` 多重集 + 条数，**不比对文案**；`--bless-diag` 生成 |
| `<base>.interp.out` | 只跑 interp golden（无 compile/run） |
| `<base>.run.out` | 只做 compile+build+run golden |
| `<base>.run.err` | 产物运行期错误片段；退出码断言非 0 |
| `<base>.run.exit` | 期望退出码（n=0 断言恰好 0；n>0 断言恰好 n） |
| `<base>.out` | **共享** golden：interp 与 compile+run 都开，断言输出一致 |
| `expected.diag.json` | 目录型夹具的负例期望（同上，路径相对夹具目录） |
| `expected.out` / `expected.run.*` | 目录型夹具的正例期望 |

矛盾组合显式失败（CBroken），不静默跳过：golden（`.out`/`.interp.out`/`.run.out`）与
`.diag.json` 并存、`.run.out` 与 `.run.err`/`.run.exit` 并存、family 关掉某阶段但夹具带
该阶段期望。无任何期望文件也是 CBroken。「只跑 compile+run、不跑 interp」由
「有 run 期望而无 interp 期望」表达，没有独立的旁标记文件。

负例只用结构化返回值（见下节「进程内断言」），不比对诊断文本：`warning` 由
`.diag.json` 里 `severity = "warning"` 的条目表达；「warning 让退出码变 1」是
`--deny-warnings` 的 CLI 语义，由 steps 覆盖，fixture 不表达。

### 后端矩阵分层

三个后端的能力面不同，suite 用 family 的 `matrix` 键（steps 用 `# matrix:` 头）把用例分成
两层六类；分类决定该 case 参与哪些目标，而不是靠注释约定：

| matrix | 层 | 执行目标 | 内容 |
| --- | --- | --- | --- |
| `tool`（缺省） | 前端 / 工具 | ocaml | lint / fix / type_* / term / 诊断；不产生目标代码 |
| `pure` | L1 纯 | ocaml（全量门禁） | 纯函数与纯代数效应 |
| `pure-cross` | L1 纯 | ocaml + wasm + native | 三端差分精选集 |
| `effect-common` | L2 副作用 | ocaml + wasm + native | Console / 值句柄可变容器（`MutOp`）/ getenv / getArgs / exit / 经标签的相对路径 FS |
| `effect-native` | L2 副作用 | ocaml + native | process / sleep / mtime / 真实 cwd |
| `effect-wasm` | L2 副作用 | ocaml + wasm | preopen 根、cwd=`/`、execPath=`""`、mtime=`Nothing` |
| `effect-ocaml` | L2 副作用 | ocaml | stdin / raw net（另两端没有宿主实现） |

- 取值在 `[family.<name>]` 的 `matrix` 键；steps 用任意位置的 `# matrix: <分类>` 覆盖 family
  默认。未知取值是配置错误（`matrix must be tool/pure/...`）。
- 后端能力的唯一真源是 `Compiler.Base.Intrinsics.hostSupportOf`（标签 × `ocaml` / `native` /
  `wasm` → `full` / `partial` / `none`，`partial` 的具体缺项写在注释里）。`partial` 表示
  「该标签下有 op 没实现」，家族分档是粗粒度近似：用例只要不碰缺的那条 op 仍可进该后端
  （如 wasm 的 `FsOp` 缺 symlink，`effect-common` 的相对路径 FS 仍在三端跑）。只有标签、
  没有 op 信息的消费者（如未来的 `vuna test --target`）按 `full` 保守处理。`main` 行里的
  内建标签用 `Driver.Dt.dtMainInfo`（同一份 `Lowering.Entry.mainRowTags`，与 entry 预装
  handler 同源）。
- `--backend ocaml|wasm|native|all` 选执行目标：只保留 `matrixTargets` 允许该目标的 case；
  未选中是**排除**，不是 skip（不影响 `--strict-skips`）。
- `--matrix <分类>` 精确筛选，`--filter layer:pure|effect` 按层次筛选；每个 case 自动带
  `layer:<层次>` 与 `matrix:<分类>` 两个 tag。
- 跨后端 golden：夹具写进 case 私有包目录（`app/Main.vuna` + 指向 base 的 `vuna.toml`），
  对每个目标 `build --target` 后执行；wasm 走 `node wasm-host/run.mjs ... --dir <case-dir>`
  （WASI preopen），native 直接跑静态产物，三者都以 case 私有目录为 cwd，FS 用例不污染源码树。
- 期望文件按目标覆盖：`<base>.<backend>.out` 优先，否则共享 `<base>.out`——共享期望即三端
  差分。没有 `--backend` 时只跑 ocaml；`effect-*` 分类即使只跑 ocaml 也走私有包目录。
- `vuna-base` 的 `stdlib` family 也声明 `pure-cross`：40+ 个标准库夹具在三个后端上对拍。
- 机制断言（trap 文本、WAT / ELF 形状、import 缺失、ABI）留在 steps 的单后端用例，不进差分。

### 声明式步进用例（`*.steps`）

一个 `*.steps` 文件 = 一个 case，挂在 `kind = "steps"` 的 family 下
（`[family.steps_native] dir = "suite/steps"`，当前 test 根是 `test/`）。行式指令，`#` 注释；
`run:` / `read:` 开新步，其余指令挂到当前步。每个 case 有独立 `TMPDIR` /
`TMPDIR` / `VUNA_REPL_HISTORY`，对象库共享（`VUNA_STORE`），可安全并行。

```text
run: sh -c 'printf "%s\n" "main : Int" "main = 1" > "$TMPDIR/pkg/Main.vuna"'
exit: 0
file-exists: $TMPDIR/pkg/Main.vuna
file-contains: $TMPDIR/pkg/Main.vuna "main = 1"
read: $TMPDIR/pkg/Main.vuna
out-contains: main
for-each: corpus/packages/[01][0-9]_*/
  run: "$VUNA" check "$TMPDIR/{name}" 2>&1
  exit: 0
end:
```

| 指令 | 语义 |
| --- | --- |
| `run:` | 新起一步：`sh -c <cmd>`，cwd = suite 的 test 根（当前 `test/`），注入 `VUNA` / `VUNA_SEED` / `VUNA_BASE` / `OCAMLOPT` / `VUNA_SUITE_ROOT`（仓库根）/ `VUNA_TEST_ROOT`（suite 的 test 根）/ `TMPDIR` / `VUNA_STORE` / `VUNA_REPL_HISTORY` / `XDG_CACHE_HOME` |
| `read:` | 读文件内容作为该步输出（不执行命令）；文件缺失即失败 |
| `exit:` | `0` / `nonzero` / 具体值；缺省断言 0 |
| `out-contains:` | 合并输出必须包含该片段（可多条） |
| `out-not-contains:` | 合并输出必须**不**包含该片段 |
| `out-equals:` | 合并输出（去尾部换行）逐字相等；空值 = 空串 |
| `out-equals-file:` | 合并输出（去尾部换行）与文件内容逐字相等（快照/诊断对拍） |
| `file-exists:` / `file-absent:` | 路径存在 / 不存在 |
| `file-contains:` | 文件存在且包含片段：`<path> <fragment>` 在首个空格处切分（路径不能含空格） |
| `for-each:` … `end:` | 按 shell 词列表（可 glob）逐项重复块内步骤；`{item}` = 匹配项（去尾 `/`）、`{name}` = basename、`{stem}` = 去掉结尾 `.vuna` 的匹配项；匹配为空 = 显式失败；不支持嵌套 |

路径解析：`$TMPDIR` 展开成该 case 的私有临时根；相对路径按 suite 的 test 根解析（当前写
`corpus/...`，不是 `test/corpus/...`）。每步额外断言没有被 timeout（超时取 case/family
`timeout`），解析错误（未闭合 loop、指令出现在任何步骤之前等）让 case 显式失败。

断言走统一计数器，失败信息带步骤与 item 名。

### case 类型与语义

| kind | 语义 |
| --- | --- |
| `auto` | 按期望文件后缀推导 golden/error/runtime（见上表）；缺期望文件 CBroken |
| `golden` / `error` | 与 auto 同一推导路径（kind 只剩语义提示） |
| `check-ok` | 只跑 `vuna check`，必须 exit 0 |
| `check-error` | check 必须 fail（片段） |
| `CLint` | `vuna lint` 输出 vs `.out` + 期望退出码 |
| `CFix` | `vuna lint --fix` 后内容 vs `.expected`，并验证幂等 |
| `CRuntime` | compile+build+run：片段（可选）+ 退出码（`.run.err`/`.run.exit`） |
| `CSeed` | 用 `VUNA_SEED` 编译运行，验证 seed 冒烟 |
| `CSteps` | 解释执行 `*.steps` 声明式用例（见上） |
| `CBroken` | discovery 失败（缺期望文件、矛盾组合、目录不存在等），显式失败而不是静默跳过 |

### 执行模型

- 父进程发现 case 后按 `--jobs`（未给出时用 `[suite].jobs`，再回落自动探测）spawn N 个自身（隐藏 `--worker i/N`），worker 按
  `index mod N` 静态分片；每个 case 写一份 TSV 结果到共享临时目录，父进程按序读回。
- 每个 case 有独立临时目录与 per-case 超时（默认 300s；family `timeout` 声明更紧的预算，
  `--timeout` 只能再压低、不能放宽）。子进程输出经固定 shell helper 捕获（`timeout -s TERM -k 10 ... >out 2>err`，
  可选合并），不新增编译器原语；超时按 `timeout` 建的进程组收尾，steps 经 `sh -c` 起的
  孙进程一并退出。
- SIGKILL runner 时收不到信号：每次 run 在临时根写 `runner.pid`，下次启动先清扫这些根
  （标记进程已死 ⇒ 按 `TMPDIR` 收掉残留进程再删目录；并发 run 的标记仍存活则跳过）。
  只在有 `/proc` 的平台生效。
- family 与 `*.steps` case 都进 worker 并行；worker 按 `index mod N` 静态分片。每个
  steps case 有独立的 `TMPDIR` / `VUNA_REPL_HISTORY`；对象库默认与 suite 共用，
  只有文件头带 `# store-isolated` 的 case 用 `${caseTmp}/store`（断言缓存布局/GC/
  冷命中的用例；需要独占仓库路径的用例在步骤里把夹具复制到 `$TMPDIR`）。
  **Unix domain socket 用例注意 `sun_path` 上限（108 字节含 NUL）**：case 的 `TMPDIR` 是
  `$TMPDIR/vuna-suite-<stamp>-suite/c-<hash>`（自身已 55+ 字符），再拼
  `vuna-repl-server.XXXXXX/repl.sock` 会越界 ⇒ `bind` 失败、server 不打就绪行、等待方空转到
  10s 超时（症状是「随机失败且耗时恒为 ~11s」）。`corpus/repl-server/smoke.sh` 因此把工作
  目录放在尽量短的路径上（`vrs.XXXXXX`，过长时退到 `/tmp`）。新写 socket 用例照此办理。
- `--fail-fast`：worker 内部失败后不启动新 case。
- 失败行带 case id；断言失败给步骤名 / expected / actual 片段。父进程汇总也列出失败
  case id（`N checks, M failed case(s): <id>, ...`）；worker 没写出结果文件时汇总报
  `<id> (no result)`（崩溃 / OOM / 被杀），并还原真实 case 名而不是 `unknown-<index>`。
  `run:` 步的退出码/超时失败额外附**该步命令**与**捕获输出尾部**（脚本自己打印的
  `FAIL: ...` 就在里面），否则只能看到 `exit: exit 1`。
- 本地结果判定：没有。每次 suite 都真正执行 golden / error / steps，结果不落对象库，
  也没有 `(cached)` 行；`--cache-dir` 只决定构建桶与测试对象库的位置。

### 共享对象库（`VUNA_STORE`）

- 默认根：**测试专用** `~/.vuna/test-store`（`nix run .#vuna-run-tests` 导出；
  `VUNA_STORE` 可覆盖）。子进程的 `TMPDIR` 仍按 worker/case 隔离，但对象库共用。
- 父进程只预热一次 `vuna check packages/base`（需要时 `check .`），worker 不各自 warmIfaces。
- 单文件对象（`objects/module-iface|module-order|check-outcome|tool-context|pkg-iface|splitptr`）是输入寻址 + 原子写：
  同一输入同一路径、同一份字节，日常 `check`/`build` 与测试共用不会互相覆盖。
- 目录视图 `views/bin` 与 `roots/` 的并发边界见 [cache.md](cache.md)；断言缓存布局/GC/
  冷命中的 steps 在文件头写 `# store-isolated`，用 `${caseTmp}/store` 私有库。
- 对象库的 GC 用 `vuna store gc`（roots + 宽限窗口 + 容量上限）。
- **warning 不持久化**：共享 store 命中会跳过精化。fixture 负例走进程内全量精化
  （`InProc.checkFile`），warning 必然重算，不需要 `-W` / 私有 store；`warning`
  的「让退出码变 1」语义由 steps 的 `--deny-warnings` 覆盖。

### suite 的组成

- 语言/corpus 夹具由 family 覆盖（§1–§34 的 dt/dt_err/dt_base/dt_compiler、pure_cross 与 effect/*、run/modules/
  records/traits/monad/stdlib/lint/fix/term 等）。`dt_compiler` 是编译器包 API 的函数级夹具
  （mock handler + `runPure`，不碰真实文件系统），只跑 run。
- 工具链/包/REPL/LSP/net/缓存/iface 段是 `packages/*/test/steps/*.steps` 声明式用例。
- suite 入口是 `vuna dev suite --all`（driver 清单）或单个 `packages/<owner>/test/suite.toml`。

### iface 判据回归（§44m–§44q）

摘要路径的正确性除「诊断逐字节一致」的间接证据外，§44 另有一组针对判据本身的回归：

| 断言 | 覆盖的判据 |
| --- | --- |
| §44m | `exports` 进 `miIfaceHash`：依赖隐藏调用方用到的导出名 ⇒ 依赖方判脏；摘要与全量给出同一诊断 |
| §44n | `pmEnv` 包级环境指纹：改 `vuna.toml`（不进模块源哈希）⇒ `iface-reject=own-env`，重算后收敛 |
| §44o | 镜像模式内容寻址 + 孤儿 GC：实现变化产生新 token 文件，过期 token 在 60s 窗口外被删 |
| §44p | `meOrigin` 隔离：LSP 冷启动写回标 `tool`，命令行 check 拒绝（`iface-reject=tool-origin`），下一次整包写回归 `pkg` |
| §44q | 闭合判定的 binder 深度口径：含 record-update（`TRecUpd.body` 在 `tele` 之下）的最小包，冷/热缓存的 check audit 都必须 exit 0；`build --no-compile` 另断言 `iface-audit subject=compile`（摘要 codegen vs 全量 codegen） |

基础开关：`VUNA_IFACE_AUDIT=1`（同一进程跑摘要 + 全量、逐字节比较、不一致即失败且不落盘）、
`VUNA_IFACE_SELFTEST=1`（写侧载荷自证：写前逐个模块重算 `hashOfIface` 并与记录值比对，
不一致就不写并留 `iface-hash-mismatch`；复用侧 `payloadSelfOk` 用同一口径）。两者可以
**同时**开启；注意 AUDIT 会绕过 check 图命中、强制每次重算两条路径，全量双跑成本高，不适合
放在热路径。`44q` 只覆盖 AUDIT；SELFTEST 由 `checks.vuna-iface-selftest`（base + compiler
冷跑）覆盖，不单独成 steps。

### 超时

| 层 | 控制 | 默认 | 行为 |
| --- | --- | --- | --- |
| case | `--timeout` / family `timeout` | 300s | 预算是「declared 与 flag 取小」：family `timeout` 声明更紧的值（`effect_perf` 60s、`elab_perf` 15s），`--timeout` 只能把它压得更低，不会放宽；未声明 family `timeout` 时回落 `[suite].timeout`（默认 300s）。超时计 FAIL 并继续其余 case；`timeout` 缺失时降级直跑 |
| steps 单步 | 同上（继承 case timeout） | 300s | 单步超时即失败，失败信息带 `timed out after Ns` |

### 产品化过滤与更新

```console
vuna dev suite --all --changed HEAD   # 仅跑 git diff 影响到的 case
vuna dev suite --all --last-failed    # 重跑上次失败
vuna dev suite --all --bless          # 更新 golden .out（只写 golden）
vuna dev suite --all --bless-diag     # 生成/更新 .diag.json 结构化诊断期望
vuna dev suite --all --watch          # 改文件后自动重跑
vuna dev suite --all --audit          # 孤儿 fixture 审计
vuna dev suite --all --timings        # 最慢 10 个 case
vuna dev suite --all --strict-skips   # fail-fast 产生的 skip 也算失败
vuna dev suite --all --cache-dir DIR   # 覆盖测试对象库与构建桶根
```

- `--changed REV`：`git diff --name-only REV`；`packages/` 源码、`examples/` 或 suite 执行器配置变更跑全量，
  夹具变更只跑对应 family case，以及 steps 文件文本里提到该目录的 case；无变更时不跑 case。
- `--last-failed`：失败 case id 写到 `.local/test-suite/last-failed`，重跑时按 id 过滤；
  空结果不会清空已有失败列表。
- `--bless`：golden 失败时把实际输出写回对应 `.out`，并打印 `blessed`；负例走 `--bless-diag`。
- `--bless-diag`：负例 case 用 `check/compile --json` 的实际聚合文档写回 `.diag.json`（源码路径相对 cwd；环境路径归一化为 `<ROOT>`/`<BASE>`，本地与 nix 构建可比）。
- 目录型夹具根部的 `.package-dir` 标记：check/compile 以该目录为 cwd 运行 `vuna <cmd> .`，用于包级诊断（`PKG_`/`LD_`），对应 family `pkg_err`（`entry = "lib/Main.vuna"`）。
- `nix/checks/lib/diag-coverage.sh` 对比码集合（`.diag.json` + lint `.out` + steps 侧车
  `*.diagcodes`；缺口与不可达审计在 `nix/checks/data/diag-coverage-allow.txt`，覆盖数不低于
  `nix/checks/data/diag-coverage.min`）；`nix/checks/lib/diag-style.sh` 查消息列文案规范（句号/大小写/空白/占位符，例外在 `nix/checks/data/diag-style-allow.txt`）；LSP quick fix 集成在 `corpus/lsp/quickfix.sh`。
- `--watch`：首次跑完后每 500ms 比较 suite/corpus/工具链源码 mtime，变化即重跑。
- `--cache-dir DIR`：覆盖 `.local/test-cache`（构建桶/last-failed；verdict 在对象库）。
- `--strict-skips`：`--fail-fast` 跳过的 case 计为失败（CI 使用）。
- `--audit`：扫描 suite 的 test 根下 `corpus/`（当前 `packages/*/test/corpus`）的 `.vuna`，未被 family case 或 steps 文件文本引用的夹具列出
  并 exit 1；`corpus/codegen` 是 metrics 固定输入，显式排除。

family discovery 对目录里每个夹具要求一个期望文件（阶段限定后缀或兼容裸后缀；目录型是
`expected.*`）；缺期望文件或矛盾组合生成 `CBroken` case 并失败（防改名/放错目录静默
漏跑）。

**默认护栏**（不依赖 `--audit` 手动开关，跑 suite 就生效）：

- `audit/orphans`：已声明 family 目录里的每个夹具必须与某个 case 的 source 精确对应，
  否则注入一个失败 case。`--audit` 另有全 corpus 的宽松报告（steps 文件里
  提到目录名就算认领），两者互不替代。
- `audit/min-cases`：每个 suite 的 `[suite] min_cases` 是该 suite 的 case 总数下限
  （compiler 730 / base 31 / cli 142 / web-cli 1）。整族从 `suite.toml` 消失时，
  孤儿审计连目录都看不到了，只有总数骤降能兜住这类「少跑 case 却全绿」。
  新增夹具无需调整；批量删除夹具时同步下调对应 suite 的数字。

局部运行（`--only` / `--filter`）会把这两个审计 case 一起过滤掉，符合预期。

### 进程内断言（fixture 用例零子进程）

**fixture 用例（`CGolden` / `CError` / `CCheck` / `CLint` / `CFix`）不 spawn `vuna`**：
runner 直接调用编译器 / 工具链的导出函数，断言它们的**返回值**。

| 用例 | 进程内调用 | 断言 |
| --- | --- | --- |
| golden interp | `Interp.interpretFile`（或 `Dt.dtEvalFile` / 增量版） | 输出文本 == `.out`（语言语义，保留文本比对） |
| golden check | `Dt.dtCheck` / `Dt.dtCheckModuleFile` | `OkC` 且无 error 级诊断（warning 允许） |
| golden compile | `Compile.compileToDir` | `OkC`；随后 `sh build.sh` + 跑 `prog` 仍子进程（执行产物无法替代） |
| 负例 check | 同上 | `ErrC`（或 `OkC` 里的 error 级条目）→ 投影成 `.diag.json` 的键序列 |
| 负例 compile | `Compile.compileToDir` | 同上；额外断言输出目录未创建 |
| 包目录负例 | `Compile.checkPackage release True pkg` | 同上（`wantWarnings=True` 直接拿 warning） |
| lint | `Lint.Rules.lintSourceWith`（fixities 经 `FixityEnv.fixitiesForFile`） | `renderFinding` 文本 == `.out` |
| fix | `Lint.Fix.fixLoop` | 新源码 == `.expected`；再跑一遍验收敛（幂等） |

**断言口径**（`packages/dev/lib/Vuna/Test/Expect.vuna`）：负例只比 `(severity, code, file, line, col)`
的**多重集** + 条数，不比 `message` / `fields` / `labels.text`——文案由
`nix/checks/lib/diag-style.sh` / `diag-raw.sh` 两个门禁守。顺序不锁：`--json` 的
`flushSarif` 输出序与 `ErrC` 的 `diagChildren` 装配序不同，两列排序后逐项比。

路径归一：期望文件里有 `<ROOT>/test/...`、`corpus/...`、`./vuna.toml`、`<BASE>/lib/...`
四种写法；`Expect.projFile` 把两侧都压到「相对 `test/`」或 `packages/base/`，夹具不需要改写。
无源位置的诊断投影成 `||0|0!<absent 理由>`，与 `nix/checks/lib/diag-located.sh` 同源。

**没有子进程回退**：进程内只有两条路径——增量会话（`packages/dev/lib/Vuna/Test/Session.vuna`，依赖
接口 + `AuxCache`）优先，不可用时**在同一进程内**退回全量精化；两条都不可用即用例失败
（`ErrC`）。没有子进程、也没有绕过缓存的开关：`VUNA_ELAB_FULL=1` 是 CLI 语义，只出现在
steps 里，用于「摘要路径 vs 全量路径逐字节一致」的对拍。

**进程内没有 `timeout(1)`**：`elab_perf` 一族（15s 回归守卫）改用挂钟自测
（`effTimeUs`），超 `caseTimeout` 即失败。

**进程绑定岛**：steps 里仍有子进程，但只限于**构造上不可进程内**的场景——PTY / stdio
（`repl` / `lsp`）、执行产物（`build.sh` / `prog` / `vuna run` / `vuna test`）、另一个二进制
（`seed`）、多进程 store 互斥（`fetch` / `add` / `pin` / `store` / `clean`）、CLI 渲染文本与
`--json` / SARIF 文档形状。这些逐个登记在 `test/suite/process-bound.txt`（
`文件<TAB>子命令<TAB>原因`），由 `nix/checks/lib/steps-inproc.sh` 校验：`packages/*/test/steps`
里出现未登记的文件名就失败；登记数超过 `nix/checks/data/steps-inproc.max` 也失败（ratchet 只降）。

已知边界：增量会话的 `dtIncrementalCheckedCore` 只汇总 loader + `dtProgWarnings`，
**不跑**全量尾部的 `warnUnusedDefsIn`；所以负例的 check 一律走全量（`InProc.checkFile`），
只有正例才用会话。
### 增量构建桶（跨 run 持久）

golden/runtime case 的 codegen 产物按「生成模块集」分桶（`set-<key>`），桶放在
`--cache-dir`（默认 `.local/test-cache`）下的
`build/<worker 作用域>-<编译器身份>-<base 哈希>/`：

- 同 run 内：只有 `Main.ml` 变化 ⇒ `build.sh` 内容哈希 stamp 只重编它 + 链接；
- **跨 run**：base 的 25 个单元 `.cmx` 直接复用，本地重跑不必付「每 worker 首次
  整棵 base 冷编译」；
- 桶名含编译器身份与 base 哈希，编译器/base 变了自动换桶（不会读到陈旧产物）；
- 并发注意：两个 suite 同时用同一 worker 号会写同一桶（内容哈希 stamp 会退化为
  重编，极端情况下互相踩写）；并发跑时给其中一个传 `--cache-dir` 隔离。

实测（本机 16 核）：空 store 下同一夹具 compile 2.9–5.5s，暖 store 7ms；
`vuna check packages/base` 7.25s → 13ms。对象库的 split-unit 缓存在 `$VUNA_STORE/units`；
`--cache-dir` 只放构建桶与测试临时根（split-unit 与视图见 store，
[test-architecture.md](test-architecture.md)）。
### 包内测试（`packages/<pkg>/test/`）

`vuna test <包目录>` 逐个跑 `test/*.vuna`（只认顶层，不递归），每个文件的 `main` 决定是否通过。
同一个 `test/` 目录还放该包的 suite 配置与夹具（`suite.toml` / `corpus/` / `steps/`）；
两者互不干扰。

| `main` 形态 | 执行路径 | 通过条件 |
| --- | --- | --- |
| `String` / `Int` / `Bool` | DT 核心求值 | `""` / `0` / `True` |
| `Eff r a` | compile + 运行产物（行里的内建宿主标签由 entry 预装 handler） | 退出码 0 |

纯形态走核心求值，因此**只能用核心求值器实现的原语**：`strUnpack` / `strPack` /
`strConcatMany` / `strSubstring` 这类 List 桥接原语不在其中，用了会得到
`CG_MainNotValue: main does not reduce to a value (stuck at <卡住的值>)`（语言夹具同理，`packages/base/test/corpus/stdlib/07_string`
因此用 `.run.out`）。需要这些原语时把测试写成 `Eff` 入口，失败自己收口：

```vuna
main : Eff [ConsoleOp, ExitOp] String
main = case failuresOf n written of
  [] => pure ""
  bad => do
    _ <- consolePrint ("codec failed: " ++ join "; " bad ++ "\n")
    _ <- exitWith 1
    pure ""
```

失败面走标签 + handler：`consolePrint`（`Base.Effect.Console`）/ `exitWith`（`Base.Effect.Exit`）在
entry 预装的宿主 handler 下执行；它们背后的 `@vuna@prim_eff_print` / `@vuna@prim_eff_exit` 是
隐藏内部名，源码写不出。
`packages/http/test/` 是这套写法的实例（编解码、连接循环、WebSocket、客户端回环），
失败原因只打到 stderr，判定看退出码。`checks.vuna-tests*` 会跑所有包顶层的 `test/*.vuna`。

## corpus 的包上下文与 `VUNA_BASE`

每个包的 `test/corpus/vuna.toml` 给它自己的 corpus 一个**独立包上下文**
（`name = "vuna-<owner>-corpus"`，只依赖 `vuna-base`，没有 `[export]` / `[workspace]` 成员）：

- corpus 下的夹具文件**没有自己的 manifest** 时，向上找最近 manifest 即该包的
  `test/corpus/vuna.toml`：**单文件夹具也是该 corpus 包内的 ad-hoc 入口**（包上下文，
  import 可见范围 = 本包 `lib/` + `vuna-base` 依赖闭包）；真正的 base-only 上下文只出现在
  runner 写进 `$tmp`、没有任何 manifest 祖先的临时夹具；
- 需要跨模块 / 需要多包语义的模块夹具（`corpus/modules/*`、`records/`、`traits/`、
  `type_modules/`、`corpus/packages/*`）各自补 `vuna.toml`（默认只依赖 `vuna-base`）；
- `VUNA_BASE` 由脚本导出给无 manifest 的临时夹具；corpus 内的夹具通过 `vuna-base` 依赖
  获得 base；
- 两类上下文都**自动注入 `Prelude`**，因此夹具需要 `show` / `==` / 比较 / `deriving` 时
  直接可用；显式 `import Prelude` 仍合法；
- 夹具 manifest 只有 `[package]` / `[export]` / `[dependencies]`（没有能力 / 信任 /
  特权 section）：corpus 代码用效果也只经标签 + handler（`consolePrint` / `fsReadFile` …），
  纯原语 `prim_*` 可直接调用；标签正例是 `corpus/packages/07_prim_direct`（`fsFileExists`，
  没有能力 section 也照常检查）；
- `corpus/fmt/check.sh` 与主 runner 用同一套约定（`VUNA_BASE` + 目录化 compile），
  不接受模块根参数。

## corpus 分类

下面路径都相对**所属包的 `test/corpus/`**（stdlib → `packages/base`；fmt/lint/fix/doc/cli/
pkg_err/packages/test-m30 → `packages/cli`；web → `packages/web-cli`；其余 → `packages/compiler`）。
`vuna test` 的单元测试仍在各包 `test/*.vuna`。

语言夹具只走 DT：`interp`（DT 精化 + 核心求值）、`check`、`compile` + ocamlopt。
「只 compile+run、不做 interp 对拍」的夹具（效果程序 `main : Eff r a`，以及核心求值器不可
归约的夹具：`strUnpack` / `strPack` / `strConcatMany` / `strSubstTemplate`）用
`<base>.run.out` 表达。负例统一用
`<base>.diag.json`（结构化诊断），interp / compile 共用同一份（绝大多数负例完全一致，少数仅 message
不同、`(code, line)` 全同）。

- `corpus/run/*.vuna`：`interp` 输出 vs `.out` golden；`compile` → ocamlopt → 运行再比对；
  `.run.out`（`10_string_pack`、`16_file_exists`、`17_file_meta`）只做 compile+run；
  `18_int_overflow` / `19_string_utf8` / `20_str_hash` 是纯值语义 golden；
- `corpus/modules/` 01–31 正例：跨模块函数 / 数据 / 嵌套 import 的 `interp` 与 `compile`
  结果（夹具是**同包多模块**：Helper 在 `lib/`；没有「多根」概念）；
  覆盖显式导出列表、重导出、抽象类型、空导出集、包门面、无头模块重导出、same-target
  去重、选择性重导出、两级门面、qualified import 重导出、多行模块头、私有类型封装、`_`
  私有构造器在定义模块内匹配；`31_type_as_term` 覆盖导入模块的类型名在值位置作为显式
  类型实参（含隐式 Prelude 的 `Maybe`）；
- `corpus/modules/` 70–99 反例：`_` 隐私、隐藏构造器跨模块构造 / 匹配、重导出抽象性与同名
  冲突、空导出集、入口文件模块头、非法 / 重复 / 未知名导出、缺失模块、跨根歧义、循环
  导入、非法模块名、别名冲突、import 不传递；`interp` 与 `compile` 都要求错误片段、非 0
  退出、不写输出文件；歧义模块场景在 `corpus/packages/94_ambiguous_module`（必须在包
  上下文里判定）；
- `corpus/records/`：01–05、08 正例 `interp` 与 `compile` 比对 golden（record update 与
  参数化 record 由 `Elab.Records` 支持）；90–95 反例要求错误片段、非 0 退出、compile 不写
  输出；跨模块 `0*_*/`（`Point(..)` 可构造 / 匹配，`Point` 保持抽象）与 `9*_*/`（抽象
  构造器不可见）同样覆盖；`95_ambiguous_field` 覆盖歧义字段；
- `corpus/traits/`：正例 `interp` 与 `compile` 比对 golden（含泛型字典穿参、多类型
  default；`14_constrained_instance`（`instance Eq a => Eq (Box a)` +
  `mem (Box 1) [...]`）、`15_parametric_deriving`（参数化 `deriving (Show, Eq, Ord)`）、`27_deriving_hashable`（`deriving (Eq, Hashable)`，data + 记录）、
  `16_eq_ord_alias`（`==` / `(==)`、`<` / `(<)` 走同一路径，Int/String 特化 + Bool 实例）、
  `17`–`22`（显式签名约束：单 / 多约束、结构化 `Eq (Box a)`、高阶 kind `Monad m`、
  约束函数互调、未使用约束））；
  命名实例特性不存在。错误例 90–95、98 要求错误片段、非 0 退出、不写
  输出（重复实例 / 相干性、head 不符、缺 / 未知方法、显式只写 `Trait` 不写 `(..)`；
  `90_orphan_default` 实际覆盖重复实例，孤儿规则不存在，见 debt D30）；
  `99_explicit_*`（约束负例：未知接口、非单参数应用、kind 不符、where / trait 方法
  位置不支持）。
  `96_named_instance_removed` / `97_instance_sel_removed` 是 `as` / `@` 语法的解析负例；
- `corpus/monad/`：`do` / `>>=` / `>>` 在 Maybe/List 上的正例，含高阶 kind 泛型
  `bindPair : m a -> m b -> m (Pair a b)`；`04_kind_generic`（多隐式参数字典）check /
  interp / compile+运行三路全过；错误例覆盖 kind 不符、无 Monad、do 结尾 / 绑定模式非法；
- `corpus/stdlib/`：`Base.*` 与 do/动作正例、错误例；效果夹具 `03_do_io`、`09_io`、
  `10_package` 与 `strUnpack`/`strPack` 的 `07_string` 用 `.run.out`；另有
  `corpus/fmt/check.sh` 覆盖格式化 golden、注释保留、行宽折行、模块头导出列表排序、
  `where` 签名行与幂等；`run/`、`typed/` 另比对「格式化前后运行输出一致」与「格式化前后
  lowering 的 IR 逐字节一致」（锁住可解析但换了树的语义漂移）；
- `corpus/packages/`：`build` / `test` 的 workspace 正例与缺依赖、依赖环、隐藏模块错误例；
  包构建走 DT，`vuna test` 走 DT 核心求值；`03_reexport` 覆盖 facade 重导出；
  `05_entry_data` 覆盖「入口文件里声明 data」的 codegen 回归（并直接断言 `Main.ml` 含入口
  data 的 OCaml 构造子名）；`06_entry_trait` 覆盖入口 trait 的归属与产物；
  `93_duplicate_name` 覆盖同名包显式报错；`94_ambiguous_module` 覆盖包上下文下的歧义模块；
  `95_cross_dep` 覆盖依赖方向的负例（依赖包不能 import 消费包模块）；
  `07_prim_direct`（无 manifest 门控：效果标签 `fsFileExists` 在没有能力 section 的包里照常可用）；
  `08_module_scope`（entry 顶层小写名与同包模块签名里的类型变量同名，banned 集按模块作用域
  计算后 base 模块不报 `unknown name x`）；
- `corpus/err/`、`corpus/run_err/`：解析 / 求值负例，期望载体是 `.diag.json`
  （非穷尽、if 条件类型、参数过多、clause 数不匹配、let 绑定模式等）；`15_corpus_compile_neg`
  一类 `07_main_arity` 的 compile 阶段诊断与 check 同一份期望；`03_div_zero`
  是产物运行期负例（运行断言 `division by zero`）；
- `corpus/type_ok`、`corpus/type_err`、`corpus/type_modules/`、`corpus/typed_ok`：语言夹具，
  走 `check` / `compile` + 运行断言；`typed_ok/06_where_fwd`、`07_where_mutual`、
  `08_where_self` 是 where 签名正例（局部辅助函数 / 顶层递归），fmt 黄金例见
  `corpus/fmt/05_where`、`15_where_inst`、`fmt/typed/01_where`；where 缺签名负例是
  `corpus/dt_err/35_where_no_sig`；
- `corpus/lint/`、`corpus/fix/`：`vuna lint` / `lint --fix` golden、退出码与幂等（工具链，
  与检查器无关）。规则为 AST 驱动：`literal-if-chain`、`dispatch-lift`、`list-literal`、
  `pair-sugar`、`nat-literal`；语料 05–14、15–18、19、21、22 与 fix 07–19、20、21、22 覆盖
  dispatch 提升、列表字面量归一、Pair 元组归一、Nat 字面量归一与「不报」形态，
  `pair-sugar` 另由 `steps/39_lint_cli` 的 `--select` 用例覆盖报告、修复与幂等。
  输出带错误码：
  `路径:行:列: [LN_XXX] <rule>: <message>`，错误码体系见 [tooling.md](tooling.md) 第 4 节，
  完整清单由 `vuna dev errors gen` 生成。规则与边界见 [lint.md](lint.md)；
  `checks.vuna-lint` 对全部包源码要求零 finding；
- `corpus/lsp/smoke.sh`：`vuna lsp` 的 JSON-RPC 冒烟。走包上下文（含 import 的文件真正
  类型检查），覆盖两模块临时包、formatting、documentSymbol、definition、references、
  completion、workspace symbol、lint 诊断、URI `%XX` 与退出码；`--stdio` 空操作、未知
  flag 只写 stderr、stderr 为管道时日志仍可写；还覆盖模块名
  hover/definition（含模块 docstring）、局部绑定 hover/definition（语法级类型/值、遮蔽）、
  未解 `_` 洞的目标+上下文与命名洞 `?name` 的名字/目标/range；边界见
  [tooling.md](tooling.md) §2；
- `corpus/dt/*` 正例：索引族 / 依赖匹配 / 擦除 / 相等与证明 / case 矩阵 / axiom / η /
  命名空间等（清单见目录）。`54_user_bool_data`、`56_user_list_data`
  （`.run.out`）覆盖用户本地 `data Bool`/`List` 与 canonical `Base.*` 身份并存；
  `57_universe`、`58_case_matrix`/`58b_case_absurd`、`59_axiom`/`59_eta`/`59_let_where`、
  `60_erasure_unify`、`61_namespace_dual`、`60_ctor_eta`、`61_implicit_values`、
  `62_sigma_basic`、`63_dep_lookup` 覆盖现行类型规则。`corpus/dt_deep/` 是「深层嵌套
  单定义体」夹具（150 层嵌套应用）：固定 fuel 的推导路径在这里会耗尽，IR 上必须能
  编译并跑出结果（用例 `103_ir_lowering.steps`）；
  `104_ir_runtime_contract.steps` 钉住 IR 运行时符号到 OCaml 文本的代表性映射
  （入口展示 / 裸符号 / 内联 / `++` 展平 / List 桥接 / 动作 thunk）。
  `corpus/pure_cross/`（family `pure-cross`）是三端**共享语义**的唯一来源：每份程序配一个
  `.out`，`--backend all` 时对拍 OCaml / wasm / native 的输出；新增共享能力先加夹具，再
  实现两个后端（一侧缺失即失败）。`35_eff_*`–`50_eff_*` 覆盖 resume / abort / 嵌套
  handler / return 改类型 / 宿主 console / 深递归；`105*_native_*.steps` 按主题拆成六个 case，
  只保留 native 机制（`105a_native_shape` 产物形状 / label 唯一性 / 确定性 / trap 文本 / arena /
  栈传参，`105b_native_effects` 动作入口与库机器，`105c_native_host` 宿主效应与进程边界，
  `105d_native_gc` GC 与内存，`105e_native_tco` 尾调用 / 闭包 / 标量代码生成，
  `105f_native_artifacts` 产物文件集 / 增量 / 宿主失败面）；
  `106_wasm_backend.steps` 只保留 wasm 机制（WAT 产物形状、`elem declare`、WAT 确定性 +
  行宽、trap、拒绝面、`--target` 校验、2000 次 perform 与能力拒绝面）；它同时探
  `wasm-opt` 是否存在，并锁 `--wasm-opt 0`（`build.sh` 不含 `wasm-opt`）与默认 `-O3`
  （含 `wasm-opt`）两种产物的尺寸关系；
  wasm 不自举（浏览器能力矩阵见 [wasm.md](wasm.md) §8）。`corpus/dt_err/*` 是对应负例
  （kind / 宇宙、冗余 / 不可达分支、axiom 运行时、命名空间、隐式参数、泛型 Σ、无 Eq 证据
  等）。`corpus/dt_base/`、`corpus/pure_cross/`、`corpus/effect/*`、`corpus/dt_pkg/`、`corpus/dt_ad_hoc/` 是 DT
  专项夹具；
- `corpus/term/` / `corpus/term_err/`：终止性正反例（HOF / where / 互递归 / SCT / fuel /
  `let` 别名），第 37 段；SCT 第三级的正例是 `09_ack`（第 0/1 位各自覆盖部分环）、
  `10_lex_mutual`（互递归字典序）与 `14_lex_unknown`（未知关系实参不制造伪环），
  `let` 别名是 `11_let_bind` 与 `15_alias_call`（别名指向组内函数），
  守卫组合是 `16_guard_conj`（`&&` 真分支 / `||` 假分支 / `n > 1` 阈值），
  HOF 元素关系是 `17_hof_fold`（foldl/foldr 的元素参数），实例方法是 `18_instance_rec`
  （结构递归的方法与派生实例），字段投影是 `19_record_proj`（记录字段与 `case <投影>`），
  转发器是 `20_forwarder`（`apply` / `flip` 按定义性归约）；负例
  `14_blind_value`（callee 经函数参数转发）、`15_unknown_rel`（实参无尺寸关系仍按弱边留图）、
  `16_alias_equal`（别名解析后是相等而非下降）、`17_or_then`（`||` 真分支只算共有结论）、
  `18_and_else`（`&&` 假分支只算共有结论）、`19_local_map`（本地同名 `map` 不被信任）、
  `20_instance_rec`（实例方法自递归）、`21_instance_mutual`（同名方法互递归）、
  `22_alias_proj`（alias record 的投影是恒等）与 `23_forwarder_equal`（转发后仍是相等）；
  错误码段（第 36 段）用 `vuna dev errors gen`（真源是诊断域枚举）检查 TC/CG/LN/FX
  分区与幂等。
- **第 39 段：包上下文回归**。覆盖语义边界：无 manifest 的文件只可见 base
  （`VUNA_BASE` 生效、找不到 base 明确报错）；目录入口只认该目录自己的 manifest、不向上
  找；ad-hoc 单文件自动注入 Prelude；依赖方向（`95_cross_dep`：依赖包不能 import 消费包
  模块）在所有入口上下文都被拒（`build` / `check` / `compile` 三入口）；removed-hint 非 0
  退出 + 可操作提示，且 `vuna help` 不宣传不存在的路径；无 manifest 的 ad-hoc 文件直接调用
  effectful 原语也通过（`effect.vuna`；没有 `requires capability` 断言）。

Nix checks 清单、后端自举 conformance、Nix 命令与本地开发、手动性能基准见
[testing-checks.md](testing-checks.md)；改动定位与建议测试标签见 [architecture.md](../architecture.md)。
