# 测试体系（testing）

本文覆盖原生 suite（`vuna test --suite`）、corpus 分类、包上下文夹具、Nix checks、性能基准
与本地开发。种子不变量与 rotation 见 [bootstrap.md](bootstrap.md)。

## 原生测试：`vuna test --suite`

repo 自测现在由 `vuna test --suite test/suite.toml` 驱动（原生 Vuna 实现，不再是 shell
编排）。核心分层：

- `test/suite.toml`：suite 配置。`[suite]` 放全局默认（`jobs`/`timeout`/`name`）；
  `[family.<name>]` 按目录约定把夹具展开成 golden/error case；
- `test/suite/steps/*.steps`：声明式步进用例（一套行式 DSL，见下）；
- 执行器在 `lib/Vuna/Test/{Suite,Run}.vuna`，由 `Vuna.Cli.testArgs` 分派。

```console
vuna test --suite test/suite.toml                 # 全量；--jobs 默认 auto
vuna test --suite test/suite.toml --list          # 列出章节/case
vuna test --suite test/suite.toml --only 34       # 纯数字按 section 精确匹配
vuna test --suite test/suite.toml --filter dt/03  # 按 case id/tag 子串
vuna test --suite test/suite.toml --jobs 16       # 显式并行度（覆盖 auto）
vuna test --suite test/suite.toml --json          # 机器可读汇总
```

`--jobs auto`（默认）= 探测到的全部可用核（`VUNA_TEST_JOBS` 可覆盖，`--jobs N` 显式）。
CLI 子进程各自带独立 `TMPDIR`/`VUNA_IFACE_DIR`，避免并行时写同一份 iface/缓存。

### 阶段矩阵：期望文件后缀

夹具的阶段参与由**期望文件后缀**表达（`<base>.<stage>.<artifact>`），family 旗标只是
各阶段的上限（关掉即不跑）。文件型夹具的 base 是 `*.vuna` 去掉扩展名；目录型夹具用
`expected.*`：

| 期望文件 | 语义 |
| --- | --- |
| `<base>.check.err` | check 必须 fail，诊断含该片段（裸 `.err` 是兼容形态） |
| `<base>.interp.out` | 只跑 interp golden（无 compile/run） |
| `<base>.interp.err` | interp 必须 fail（片段） |
| `<base>.compile.err` | compile 必须 fail（片段；裸 `.cerr` 是兼容形态） |
| `<base>.run.out` | 只做 compile+build+run golden（原 `.nointerp` 场景） |
| `<base>.run.err` | 产物运行期错误片段；退出码断言非 0 |
| `<base>.run.exit` | 期望退出码（n=0 断言恰好 0；n>0 断言恰好 n） |
| `<base>.out` | **共享** golden：interp 与 compile+run 都开，断言输出一致 |
| `<base>.diag.json` | **结构化诊断期望**（`check --json` 聚合文档）；存在时逐字断言；`--bless-diag` 生成 |

矛盾组合显式失败（CBroken），不静默跳过：golden（`.out`/`.interp.out`/`.run.out`）与
error（`.check.err`/…）并存、`.check.err` 与 `.interp.err` 并存、`.run.out` 与
`.run.err`/`.run.exit` 并存、family 关掉某阶段但夹具带该阶段期望。无任何期望文件也是
CBroken。原 `<base>.vuna.nointerp` 旁标记已删除——它的语义由「有 run 期望而无 interp
期望」自然表达。


### 声明式步进用例（`*.steps`）

一个 `*.steps` 文件 = 一个 case，挂在 `kind = "steps"` 的 family 下
（`[family.steps_native] dir = "test/suite/steps"`，section 90）。行式指令，`#` 注释；
`run:` / `read:` 开新步，其余指令挂到当前步。每个 case 有独立 `TMPDIR` /
`VUNA_IFACE_DIR` / `VUNA_REPL_HISTORY`，可安全并行。

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
| `run:` | 新起一步：`sh -c <cmd>`，cwd = `test/`，注入 `VUNA` / `VUNA_SEED` / `VUNA_BASE` / `OCAMLOPT` / `VUNA_SUITE_ROOT` / `TMPDIR` / `VUNA_IFACE_DIR` / `VUNA_REPL_HISTORY` |
| `read:` | 读文件内容作为该步输出（不执行命令）；文件缺失即失败 |
| `exit:` | `0` / `nonzero` / 具体值；缺省断言 0 |
| `out-contains:` | 合并输出必须包含该片段（可多条） |
| `out-not-contains:` | 合并输出必须**不**包含该片段 |
| `out-equals:` | 合并输出（去尾部换行）逐字相等；空值 = 空串 |
| `out-equals-file:` | 合并输出（去尾部换行）与文件内容逐字相等（快照/诊断对拍） |
| `file-exists:` / `file-absent:` | 路径存在 / 不存在 |
| `file-contains:` | 文件存在且包含片段：`<path> <fragment>` 在首个空格处切分（路径不能含空格） |
| `for-each:` … `end:` | 按 shell 词列表（可 glob）逐项重复块内步骤；`{item}` = 匹配项（去尾 `/`）、`{name}` = basename、`{stem}` = 去掉结尾 `.vuna` 的匹配项；匹配为空 = 显式失败；不支持嵌套 |

路径解析：`$TMPDIR` 展开成该 case 的私有临时根；相对路径按 `test/` 解析（写
`corpus/...`，不是 `test/corpus/...`）。每步额外断言没有被 timeout（超时取 case/family
`timeout`），解析错误（未闭合 loop、指令出现在任何步骤之前等）让 case 显式失败。

断言走统一计数器，失败信息带步骤与 item 名；`*.steps` 不进入本地结果缓存。

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

- 父进程发现 case 后按 `--jobs` spawn N 个自身（隐藏 `--worker i/N`），worker 按
  `index mod N` 静态分片；每个 case 写一份 TSV 结果到共享临时目录，父进程按序读回。
- 每个 case 有独立临时目录与 per-case 超时（默认 300s，`--timeout` / family `timeout`
  覆盖）。子进程输出经固定 shell helper 捕获（`timeout --foreground ... >out 2>err`，
  可选合并），不新增编译器原语。
- family 与 `*.steps` case 都进 worker 并行；worker 按 `index mod N` 静态分片。每个
  steps case 额外有独立的 `TMPDIR` / `VUNA_IFACE_DIR` / `VUNA_REPL_HISTORY`（不再有
  串行 lane；需要独占仓库路径的用例在步骤里把夹具复制到 `$TMPDIR`）。
  **Unix domain socket 用例注意 `sun_path` 上限（108 字节含 NUL）**：case 的 `TMPDIR` 是
  `$TMPDIR/vuna-suite-<stamp>-suite/c-<hash>`（自身已 55+ 字符），再拼
  `vuna-repl-server.XXXXXX/repl.sock` 会越界 ⇒ `bind` 失败、server 不打就绪行、等待方空转到
  10s 超时（症状是「随机失败且耗时恒为 ~11s」）。`corpus/repl-server/smoke.sh` 因此把工作
  目录放在尽量短的路径上（`vrs.XXXXXX`，过长时退到 `/tmp`）。新写 socket 用例照此办理。
- `--fail-fast`：worker 内部失败后不再启动新 case。
- 失败行带 case id；断言失败给步骤名 / expected / actual 片段。父进程汇总也列出失败
  case id（`N checks, M failed case(s): <id>, ...`）；worker 没写出结果文件时汇总报
  `<id> (no result)`（崩溃 / OOM / 被杀），并还原真实 case 名而不是 `unknown-<index>`。
- 本地结果缓存：成功的 golden/error case 写入 `.local/test-cache/`，key 含编译器指纹、
  base 源码树哈希、source/expected 内容（目录型再含夹具 .vuna 树）；命中打印 `(cached)`。
  `--no-cache` 关闭，CI check 固定 `--no-cache`；`*.steps` 不缓存。

### 迁移状态

- 语言/corpus 夹具由 family 覆盖（§1–§34 的 dt/dt_err/dt_base/dt_io 与 run/modules/
  records/traits/monad/stdlib/lint/fix/term 等；对应 section 脚本早已删除）。
- 其余工具链/包/REPL/LSP/net/缓存/iface 段全部是 `test/suite/steps/*.steps` 声明式用例；
  `test/suite/sections/` 与 `test/suite/lib/harness.sh` 已删除，`CSection` 机制随之移除。
- `test/run-tests.sh` 与 `nix/run-tests.sh` 已删除；suite 入口只有
  `vuna test --suite test/suite.toml`。

### iface 判据回归（§44m–§44p）

摘要路径的正确性不再只靠「诊断逐字节一致」的间接证据，§44 另有一组针对判据本身的回归：

| 断言 | 覆盖的判据 |
| --- | --- |
| §44m | `exports` 进 `miIfaceHash`：依赖隐藏调用方用到的导出名 ⇒ 依赖方判脏；摘要与全量给出同一诊断 |
| §44n | `pmEnv` 包级环境指纹：改 `vuna.toml`（不进模块源哈希）⇒ `iface-reject=own-env`，重算后收敛 |
| §44o | 镜像模式内容寻址 + 孤儿 GC：实现变化产生新 token 文件，旧 token 在 60s 窗口外被删 |
| §44p | `meOrigin` 隔离：LSP 冷启动写回标 `tool`，命令行 check 拒绝（`iface-reject=tool-origin`），下一次整包写回归 `pkg` |

基础开关：`VUNA_IFACE_AUDIT=1`（同一进程跑摘要 + 全量、逐字节比较、不一致即失败且不落盘）、
`VUNA_IFACE_SELFTEST=1`（写侧读回 + `hashOfIface` 载荷自证）。两者建议**分别**开启：
同时开启在冷缓存上有已知误报（debt C49）。

### 超时

| 层 | 控制 | 默认 | 行为 |
| --- | --- | --- | --- |
| case | `--timeout` / family `timeout` | 300s | 超时计 FAIL 并继续其余 case；`timeout` 缺失时降级直跑 |
| steps 单步 | 同上（继承 case timeout） | 300s | 单步超时即失败，失败信息带 `timed out after Ns` |

### 产品化过滤与更新

```console
vuna test --suite test/suite.toml --changed HEAD   # 仅跑 git diff 影响到的 case
vuna test --suite test/suite.toml --last-failed    # 重跑上次失败
vuna test --suite test/suite.toml --bless          # 更新 golden .out（只写 golden）
vuna test --suite test/suite.toml --bless-diag     # 生成/更新 .diag.json 结构化诊断期望
vuna test --suite test/suite.toml --watch          # 改文件后自动重跑
vuna test --suite test/suite.toml --audit          # 孤儿 fixture 审计
vuna test --suite test/suite.toml --timings        # 最慢 10 个 case
vuna test --suite test/suite.toml --strict-skips   # fail-fast 产生的 skip 也算失败
vuna test --suite test/suite.toml --cache-dir DIR   # 覆盖本地结果缓存目录
```

- `--changed REV`：`git diff --name-only REV`；compiler/base/lib/app/suite 配置变更跑全量，
  夹具变更只跑对应 family case，以及 steps 文件文本里提到该目录的 case；无变更时不跑 case。
- `--last-failed`：失败 case id 写到 `.local/test-suite/last-failed`，重跑时按 id 过滤；
  空结果不会清空已有失败列表。
- `--bless`：golden 失败时把实际输出写回对应 `.out`，并打印 `blessed`；不处理 `.check.err`/`.compile.err`。
- `--bless-diag`：负例 case 用 `check/compile --json` 的实际聚合文档写回 `.diag.json`（源码路径相对 cwd；环境路径归一化为 `<ROOT>`/`<BASE>`，本地与 nix 构建可比）。
- 目录型夹具根部的 `.package-dir` 标记：check/compile 以该目录为 cwd 运行 `vuna <cmd> .`，用于包级诊断（`PKG_`/`LD_`），对应 family `pkg_err`（`entry = "lib/Main.vuna"`）。
- 夹具旁的 `.deny` 标记：check/compile 探测加 `--deny-warnings`（用于断言「warning 在 deny 模式下失败」，如冗余分支夹具）。
- `nix/checks/diag-coverage.sh` 对比码集合（`.diag.json` + lint `.out`；缺口与不可达审计在 `nix/diag-coverage-allow.txt`，覆盖数不低于 `nix/diag-coverage.min`）；`nix/checks/diag-style.sh` 查消息列文案规范（句号/大小写/空白/占位符，例外在 `nix/diag-style-allow.txt`）；LSP quick fix 集成在 `test/corpus/lsp/quickfix.sh`。
- `--watch`：首次跑完后每 500ms 比较 suite/corpus/工具链源码 mtime，变化即重跑。
- `--cache-dir DIR`：覆盖 `.local/test-cache`；worker 继承同一目录。
- `--strict-skips`：`--fail-fast` 跳过的 case 计为失败（CI 使用）。
- `--audit`：扫描 `test/corpus` 的 `.vuna`，未被 family case 或 steps 文件文本引用的夹具列出
  并 exit 1；`test/corpus/codegen` 是 metrics 固定输入，显式排除。

family discovery 对目录里每个夹具要求一个期望文件（阶段限定后缀或兼容裸后缀；目录型是
`expected.*`）；缺期望文件或矛盾组合生成 `CBroken` case 并失败（防改名/放错目录静默
漏跑）。

**默认护栏**（不依赖 `--audit` 手动开关，跑 suite 就生效）：

- `audit/orphans`：已声明 family 目录里的每个夹具必须与某个 case 的 source 精确对应，
  否则注入一个失败 case。旧的 `--audit` 仍保留全 corpus 的宽松报告（steps 文件里
  提到目录名就算认领），两者互不替代。
- `audit/min-cases`：`[suite] min_cases = 630` 是 case 总数下限。整族从 `suite.toml`
  消失时，孤儿审计连目录都看不到了，只有总数骤降能兜住这类「少跑 case 却全绿」。
  新增夹具无需调整；批量删除夹具时同步下调。

局部运行（`--only` / `--filter`）会把这两个审计 case 一起过滤掉，符合预期。

### 进程内精化会话（golden 的 check / interp）

golden 正例的 `check` / `interp` 断言走**进程内会话**（`lib/Vuna/Test/Session.vuna`）：

- 每个 worker 启动时用 `vuna check <base>` 把 base 的模块接口灌进**会话专用**镜像
  `${envTmp}/iface-session`（`vuna check` 会写接口，`compile`/单文件 `check` 不写）；
- 会话持有 `List ModuleIface` + 增量精化的 `AuxCache`，每个夹具只精化自己的入口
  （走 `Dt.dtCheckSourceIncremental` / `Dt.dtEvalSourceIncremental`，即 LSP 诊断的
  同一条路径），不再重精化整棵 base；
- **接口镜像与子进程隔离**：子进程仍用 `${envTmp}/iface`（通常为空 ⇒ 全量精化），
  保证 `compile`/`build` 的语义与诊断顺序不受工具侧增量路径影响（增量路径与全量
  在 `deriving via field` 上仍有差异，属已知边界）；
- 接口缺失 / tag 不符 / 增量自检 `applied = False` ⇒ 回退 CLI 子进程，语义与
  文本不变；`VUNA_TEST_NO_SESSION=1` 可强制回退（A/B 排查用）。

收益：golden 的两个子进程（各 ~100ms：进程启动 + 重精化 base）变成进程内 ~10ms；
全量 suite 约省 10%（实测 101s → 90s）。负例（`.check.err` / `.compile.err`）仍走
CLI，保证片段匹配语义完全一致。

### 增量构建桶（跨 run 持久）

golden/runtime case 的 codegen 产物按「生成模块集」分桶（`set-<key>`），桶放在
`--cache-dir`（默认 `.local/test-cache`）下的
`build/<worker 作用域>-<编译器指纹>-<base 哈希>/`：

- 同 run 内：只有 `Main.ml` 变化 ⇒ `build.sh` 内容哈希 stamp 只重编它 + 链接；
- **跨 run**：base 的 25 个单元 `.cmx` 直接复用，本地重跑不再付「每 worker 首次
  整棵 base 冷编译」；
- 桶名含编译器指纹与 base 哈希，编译器/base 变了自动换桶（不会读到陈旧产物）；
- 并发注意：两个 suite 同时用同一 worker 号会写同一桶（内容哈希 stamp 会退化为
  重编，极端情况下互相踩写）；并发跑时给其中一个传 `--cache-dir` 隔离。

实测（`--no-cache --jobs 8`，全量 4027 checks）：首次 122.7s，之后每次 93.6s
（约 -24%）。`Compile.cacheBase` 另有 `VUNA_CACHE_DIR` 覆盖（默认
`$TMPDIR/vuna-cache`），供 CI 显式指定 split/unit 缓存位置；runner 不设置它——
实测把 split 缓存塞进同一桶会因首次填充变慢。
## corpus 的包上下文与 `VUNA_BASE`

`test/corpus/vuna.toml` 给整个 corpus 一个**独立包上下文**（`name = "vuna-corpus"`，
`[dependencies] vuna-base = "../../base"`，没有 `[export]` / `[workspace]` 成员）：

- corpus 下的夹具文件**没有自己的 manifest** 时，向上找最近 manifest 即
  `test/corpus/vuna.toml`：**单文件夹具也是 corpus 包内的 ad-hoc 入口**（包上下文，
  import 可见范围 = 本包 `lib/` + `vuna-base` 依赖闭包）；真正的 base-only 上下文只出现在
  runner 写进 `$tmp`、没有任何 manifest 祖先的临时夹具；
- 需要跨模块 / 需要多包语义的模块夹具（`corpus/modules/*`、`records/`、`traits/`、
  `type_modules/`、`packages/*`）各自补 `vuna.toml`（默认只依赖 `vuna-base`）；
- `VUNA_BASE` 由脚本导出给无 manifest 的临时夹具；corpus 内的夹具通过 `vuna-base` 依赖
  获得 base；
- 两类上下文都**自动注入 `Prelude`**，因此夹具需要 `show` / `==` / 比较 / `deriving` 时
  直接可用；显式 `import Prelude` 仍合法；
- 夹具 manifest 只有 `[package]` / `[export]` / `[dependencies]`（没有能力 / 信任 /
  特权 section）：corpus 代码可直接调用 `prim_*` / `prim_eff_*` 使用效果，没有门控；
  原语直调正例是 `packages/07_prim_direct`（直调 `prim_eff_*`）；
- `test/corpus/fmt/check.sh` 与主 runner 用同一套约定（`VUNA_BASE` + 目录化 compile），
  不接受模块根参数。

## corpus 分类

语言夹具只走 DT：`interp`（DT 精化 + 核心求值）、`check`、`compile` + ocamlopt。
「只 compile+run、不做 interp 对拍」的夹具（效果程序 `main : Eff [] a`，以及核心求值器不可
归约的夹具：`strUnpack` / `strPack` / `strConcatMany` / `strSubstTemplate`）用
`<base>.run.out` 表达（原 `.nointerp` 旁标记已删除）。负例 `.check.err` 是稳定诊断子串，
interp / compile 文案不同时用 `.compile.err`。

- `corpus/run/*.vuna`：`interp` 输出 vs `.out` golden；`compile` → ocamlopt → 运行再比对；
  `.run.out`（`10_string_pack`、`16_file_exists`、`17_file_meta`）只做 compile+run；
  `18_int_overflow` / `19_string_utf8` / `20_str_hash` 是纯值语义 golden；
- `corpus/modules/` 01–31 正例：跨模块函数 / 数据 / 嵌套 import 的 `interp` 与 `compile`
  结果（原“多根”夹具已迁移为**同包多模块**夹具，Helper 在 `lib/`；不再有“多根”概念）；
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
  `16_eq_ord_alias`（`==` / `eq`、`<` / `lt` 走同一路径，Int/String 特化 + Bool 实例）、
  `17`–`22`（显式签名约束：单 / 多约束、结构化 `Eq (Box a)`、高阶 kind `Monad m`、
  约束函数互调、未使用约束））；
  命名实例特性不存在。错误例 90–95、98 要求错误片段、非 0 退出、不写
  输出（重复实例 / 相干性、head 不符、缺 / 未知方法、显式只写 `Trait` 不写 `(..)`；
  `90_orphan_default` 实际覆盖重复实例，孤儿规则已删除，见 debt）；
  `99_explicit_*`（约束负例：未知接口、非单参数应用、kind 不符、where / trait 方法
  位置不支持）。
  `96_named_instance_removed` / `97_instance_sel_removed` 是 `as` / `@` 语法的解析负例；
- `corpus/monad/`：`do` / `>>=` / `>>` 在 Maybe/List 上的正例，含高阶 kind 泛型
  `bindPair : m a -> m b -> m (Pair a b)`；`04_kind_generic`（多隐式参数字典）check /
  interp / compile+运行三路全过；错误例覆盖 kind 不符、无 Monad、do 结尾 / 绑定模式非法；
- `corpus/stdlib/`：`Base.*` 与 do/动作正例、错误例；效果夹具 `03_do_io`、`09_io`、
  `10_package` 与 `strUnpack`/`strPack` 的 `07_string` 用 `.run.out`；另有
  `test/corpus/fmt/check.sh` 覆盖格式化 golden、注释保留、行宽折行、模块头导出列表排序、
  `where` 签名行与幂等；
- `corpus/packages/`：`build` / `test` 的 workspace 正例与缺依赖、依赖环、隐藏模块错误例；
  包构建走 DT，`vuna test` 走 DT 核心求值；`03_reexport` 覆盖 facade 重导出；
  `05_entry_data` 覆盖「入口文件里声明 data」的 codegen 回归（并直接断言 `Main.ml` 含入口
  data 的 OCaml 构造子名）；`06_entry_trait` 覆盖入口 trait 的归属与产物；
  `93_duplicate_name` 覆盖同名包显式报错；`94_ambiguous_module` 覆盖包上下文下的歧义模块；
  `95_cross_dep` 覆盖依赖方向的负例（依赖包不能 import 消费包模块）；
  `07_prim_direct`（无 manifest 门控：直调 `prim_*` / `prim_eff_*`）；
  `08_module_scope`（entry 顶层小写名与同包模块签名里的类型变量同名，banned 集按模块作用域
  计算后 base 模块不再报 `unknown name x`）；
- `corpus/err/`、`corpus/run_err/`：解析 / 求值错误片段；`run_err` 的 `.err` 是 DT 诊断
  子串（非穷尽、if 条件类型、参数过多、clause 数不匹配、let 绑定模式等），
  `03_div_zero` 是产物运行期负例（运行断言 `division by zero`），`07_main_arity` 用
  `.compile.err` 区分 compile 文案；
- `corpus/type_ok`、`corpus/type_err`、`corpus/type_modules/`、`corpus/typed_ok`：语言夹具，
  走 `check` / `compile` + 运行断言；`typed_ok/06_where_fwd`、`07_where_mutual`、
  `08_where_self` 是 where 签名正例（局部辅助函数 / 顶层递归），fmt 黄金例见
  `corpus/fmt/05_where`、`15_where_inst`、`fmt/typed/01_where`；where 缺签名负例是
  `corpus/dt_err/35_where_no_sig`；
- `corpus/lint/`、`corpus/fix/`：`vuna lint` / `lint --fix` golden、退出码与幂等（工具链，
  与检查器无关）。规则为 AST 驱动：`literal-if-chain`、`dispatch-lift`、`list-literal`；
  语料 05–14、15–18、19 与 fix 07–19、20 覆盖 dispatch 提升、列表字面量归一与「不报」形态。
  输出带错误码：
  `路径:行:列: [LN_XXX] <rule>: <message>`，错误码体系见 [tooling.md](tooling.md) 第 4 节，
  完整清单由 `vuna gen-errors` 生成。规则与边界见 [lint.md](lint.md)；
  `checks.vuna-lint` 对全部包源码要求零 finding；
- `corpus/lsp/smoke.sh`：`vuna lsp` 的 JSON-RPC 冒烟。走包上下文（含 import 的文件真正
  类型检查），覆盖两模块临时包、formatting、documentSymbol、definition、references、
  completion、workspace symbol、lint 诊断、URI `%XX` 与退出码；还覆盖模块名
  hover/definition（含模块 docstring）、局部绑定 hover/definition（语法级类型/值、遮蔽）、
  未解 `_` 洞的目标+上下文与命名洞 `?name` 的名字/目标/range；边界见
  [tooling.md](tooling.md) §2；
- `corpus/dt/*` 正例：索引族 / 依赖匹配 / 擦除 / 相等与证明 / case 矩阵 / axiom / η /
  命名空间等（清单见目录）。`54_user_bool_data`、`56_user_list_data`
  （`.run.out`）覆盖用户本地 `data Bool`/`List` 与 canonical `Base.*` 身份并存；
  `57_universe`、`58_case_matrix`/`58b_case_absurd`、`59_axiom`/`59_eta`/`59_let_where`、
  `60_erasure_unify`、`61_namespace_dual`、`60_ctor_eta`、`61_implicit_values`、
  `62_sigma_basic`、`63_dep_lookup` 覆盖现行类型规则。`corpus/dt_err/*` 是对应负例
  （kind / 宇宙、冗余 / 不可达分支、axiom 运行时、命名空间、隐式参数、泛型 Σ、无 Eq 证据
  等）。`corpus/dt_base/`、`corpus/dt_io/`、`corpus/dt_pkg/`、`corpus/dt_ad_hoc/` 是 DT
  专项夹具；
- `corpus/term/` / `corpus/term_err/`：终止性正反例（HOF / where / 互递归 / SCT / fuel），
  第 37 段；错误码段（第 36 段）用 `vuna gen-errors`（真源是诊断域枚举）检查 TC/CG/LN/FX
  分区与幂等。
- **第 38 段：API / 产物快照**。把重构后必须稳定的对外面与 codegen 形状落成入库基准：
  `test/snapshots/{exports.txt, modules.txt, split-*.txt}` 分别锁导出面、模块清单与关键
  split 产物（`split-05_entry_data.txt` / `split-06_entry_trait.txt` /
  `split-dt_ad_hoc.txt` 等逐文件 `type t_`/`let v_` 名字清单）。golden 由
  `test/snapshots/update.sh` 重新生成（**有意变更才更新**，diff 必须可解释），断言是
  「生成结果与 golden 逐字节一致」。
- **第 39 段：包上下文回归**。覆盖语义边界：无 manifest 的文件只可见 base
  （`VUNA_BASE` 生效、找不到 base 明确报错）；目录入口只认该目录自己的 manifest、不向上
  找；ad-hoc 单文件自动注入 Prelude；依赖方向（`95_cross_dep`：依赖包不能 import 消费包
  模块）在所有入口上下文都被拒（`build` / `check` / `compile` 三入口）；removed-hint 非 0
  退出 + 可操作提示，且 `vuna help` 不再宣传已删路径；无 manifest 的 ad-hoc 文件直接调用
  effectful 原语也通过（`effect.vuna`，旧 `requires capability` 断言已删除）。

## Nix checks 清单

`nix flake check` 实测 **17 项**：3 个 package 构建（`vuna` / `vuna-compiler` /
`vuna-seed`）+ 14 个 check 语义项（`context-budget`、`doc-coverage`、`seed-selfhost`、
`vuna-compiler-growth`、`vuna-compiler-growth-incremental`、`vuna-compiler-perf`、
`vuna-fmt`、`vuna-index`、`vuna-lint`、
`vuna-metrics`、`vuna-package`、`vuna-tests`、`vuna-typecheck`、`vscode-ext`；主体是
`nix/checks/<name>.sh`）。语义项：

- `seed-selfhost`：seed→stage0→stage1→stage2 逐字节一致、TCB 黑名单、seed 完整 allowlist、闭包数量、增量构建、
  行为抽查与 seed 滞后报告（不阻塞）；
- `vuna-tests`：沙箱跑 `vuna test --suite test/suite.toml`（`--jobs auto --no-cache`）；
- `vuna-typecheck` / `vuna-lint`：`vuna check .` 自检、lint 零 finding；
- **`check` 的覆盖边界**：`vuna check <pkg>` 只检查**该包入口的 import 闭包**——可执行包
  （有 `app/Main.vuna`）检查入口闭包，库包以 `[export].modules` 为根。因此可执行包里
  **未被入口引用的新模块不会被 `check` 覆盖**，而包 iface 也只覆盖被精化的模块（依赖
  iface 校验要求「iface 模块集合 == 源码模块集合」，缺件会让依赖方回退 full 路径）。这类
  模块要么进入口闭包，要么有自己的门禁：被验收包（如 `examples/infra`）引用并走 build/run，
  或用 `vuna repl` 的 `:load` 精化。`compiler` 包的导出面已全部进入 `app/Main.vuna` 闭包
  （Hash / Query / Frontend.Cst 显式 import），所以 `vuna check compiler` 覆盖全部导出模块、
  iface 也是完整模块面；
- `vuna-fmt`：workspace 全包与 `examples/`；
- `vuna-package`：`examples/multi` 的 build/test/fmt/doc + 根包构建；
- `vuna-compiler-perf`：冷/热 `check .` 比例 + 包内增量的 clean/parse 语义断言 + REPL
  默认走接口路径；
- `vuna-compiler-growth`：合成 500/1000/2000/4000 同形定义，相邻档墙钟比 ≤2.3（增长率
  门槛，跨机器有效）；
- `vuna-compiler-growth-incremental`：合成可执行包（N 个同形 def + `app/Main.vuna`），
  先落依赖接口、再以独立进程计时**第二次 check**（包路径增量收尾），1000/2000/4000/8000
  相邻档 ≤2.6；单文件探针走全量精化，覆盖不到 `dedup*`/`anyOwn`/写接口这类收尾热点
  （见 [performance.md](performance.md) §5.2）；
- `vuna-metrics`：冻结夹具（`test/corpus/codegen`）的 codegen 产物对
  `nix/codegen.baseline` 的精确基线；种子尺寸不设门槛（见 [compiler.md](compiler.md)
  §codegen 夹具基线）；
- `vuna-index`：`map` / `--find` / `--impact` / `api` 与内容哈希缓存失效；
- `doc-coverage`：docstring 覆盖 ratchet 门禁（D30）。统计受管辖包（`vuna-compiler` +
  `vuna-base`；根包 `lib/` 并行改造期暂不纳入）的 `vuna doc --check` 缺失总数，与
  `nix/doc-coverage.baseline` 比：超过基线（新增公开符号没带 docstring）即失败，低于基线
  通过并提示下调基线。补齐公开面后往下压，压到 0 时可直接换成 `doc --check`（见
  [api-docs.md](api-docs.md)）；
- `context-budget`：入口文档字节数与单模块行数对 `nix/context.budget`（预算按实测 ×1.5
  留余量；超过预算失败，达到 70% 只打印 `WARN`。`WARN` 在本机跑 check 时可见，nix 只在
  失败时打印 builder 日志，所以 CI 成功时不显示）；
- `vscode-ext`：提交的 `vscode/dist/extension.js` 与清单 / 语法文件的离线自检，不跑
  `npm install`。

## Nix 命令与本地开发

```console
nix build                  # 默认 = vuna；.#vuna-compiler / .#vuna-seed 同理
nix flake check            # 全部 checks
sh nix/ci.sh               # CI 统一入口（eval-cache=false + log-lines=5000 + --keep-going）；GitHub Actions 由 .github/workflows/ci.yml 调用
nix develop                # 全量开发环境（工具链 + vuna-seed）；.#ocaml 只有 OCaml 工具链
nix build .#vuna --out-link result-vuna      # 产品 CLI（stage 1）
nix build .#vuna-compiler --out-link result-compiler  # 编译器 CLI（stage 1）
nix build .#vuna-seed --out-link result-seed          # stage 0 种子编译器
VUNA=$PWD/result-vuna/bin/vuna VUNA_SEED=$PWD/result-seed/bin/vuna-seed \
  vuna test --suite test/suite.toml --jobs auto
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
输出机器可读报告。入库基线 `nix/bench-baseline.json`、`--check`（默认读基线，超
`--threshold N`（默认 20%）只打印 `WARN`、退出 0）、`--strict`（同机 + 同 compiler 的
WARN 变失败）；`nix/ci.sh --bench` 在 flake check 之后跑软告警（默认不跑，避免 CI 抖动）。
跨机器 / 不同口径只做软告警。

报告包含三级构建（seed → vuna-compiler → vuna 的 ocamlopt 时间）、编译性能（自编译
compiler 闭包、corpus 批量、tiny 程序、DT 精化 + 擦除 codegen）、吞吐、产物
bytes/lines/最长行/行尾空白、codegen 健康度计数（`let rec`、`String.concat ""`、
`bi_eq_int/_str/_bool`、零参定义）以及 fixed point / seed 一致性与可选 tests 状态。中间
产物写入临时目录（`TMPDIR` 可覆盖），不写入仓库。基线在空闲机器上重跑：
`nix run .#vuna-bench -- --quick --json nix/bench-baseline.json`（或默认 runs=3 更稳）。

所有构建口径都是逐模块 split（`compile`/`build`/seed 同一种产物），不再有「单文件
`main.ml` vs 多模块」两种读数需要区分。

## 相关阅读

- 种子不变量与 rotation：[bootstrap.md](bootstrap.md)；编译器模块职责：[compiler.md](compiler.md)
- 改动定位与建议测试标签：[architecture.md](../architecture.md)
- lint 规则：[lint.md](lint.md)；错误码：[tooling.md](tooling.md)
