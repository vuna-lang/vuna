# 测试体系（testing）

本文覆盖 `test/run-tests.sh` 的原生测试、corpus 分类、包上下文夹具、Nix checks、性能基准
与本地开发。种子不变量与 rotation 见 [bootstrap.md](bootstrap.md)。

## 原生测试：`test/run-tests.sh`

vuna 原生测试按编号章节组织（**43 个章节**：编号到 44，无第 12 段；34a–34d 归在第 34
段内）。用 `vuna` / `vuna-seed` 驱动，不依赖外部 vuna 实现，但需要 `ocamlopt` 作为 codegen
后端。精确 checks 数随夹具增删变化，以运行输出为准。测试覆盖：

- `corpus/cli/check.sh`：CLI 错误矩阵（参数 / 路径 / workspace / 包目录）；
- `corpus/index/check.sh`：Index v2（内容哈希缓存、原子写、refs 位置）；
- `corpus/doc/01_export`：`vuna doc` 尊重 `[export]`；
- `corpus/packages/{09_workspace_member_error, 10_workspace_build}`：workspace check/build；
- `corpus/test-m30/`：REPL / effect test；
- LSP smoke：`corpus/lsp/smoke.sh`；
- 接口摘要（check 期模块化精化）：`corpus/packages/m34_summary/` + 仓库自身预热回归。

```console
sh test/run-tests.sh        # 需要 PATH 中有 vuna 与 vuna-seed
```

环境变量：`VUNA`（stage 1 产品 CLI）、`VUNA_SEED`（stage 0 种子编译器）、`OCAMLOPT`
（默认 `ocamlopt`）。脚本会 `cd "$(dirname "$0")"`，从仓库根直接跑即可；并导出
**`VUNA_BASE="$PWD/../base"`**——runner 写进 `$tmp` 的**无 manifest 临时夹具**靠它定位
base 上下文（corpus 内的夹具由 `test/corpus/vuna.toml` 给出包上下文）。

**接口摘要路径的测试**（第 44 段）：依赖包先单独 `check`（写摘要缓存），再 `check` 根包 ——
`--debug-perf` 应出现 `cache-path=summary deps=N`；负例注入后摘要路径与
`VUNA_ELAB_FULL=1` 全量路径的诊断逐字节一致；最后对仓库自身做「预热 base/compiler →
`check .`」回归（C37 的 `Eq Type` 假歧义）。`VUNA_ELAB_FULL=1` 是排障/A-B 对拍开关
（强制全量精化），默认不设。

推荐入口（`nix/run-tests.nix` 包装，不修改原脚本；无参数等价于直接跑）：

```console
nix run .#vuna-run-tests [-- --list | --only 34 | --only dt | --vuna stable]
```

`--only` 支持重复与逗号分隔（纯数字按章节序号匹配）；`VUNA` / `VUNA_SEED` 可直接覆盖
编译器（覆盖时不再调用 `nix build`）。

**并行**：`--jobs N` 把选中的章节切片后并发跑（每章节独立临时目录；日志按章节顺序回放并
汇总 pass/fail）。各章节必须相互独立；写仓库 `.output` 的章节（§28/§41 一类）与其它章节
并发时可能竞争，定位阶段用 `--only` 排除即可。CI 的 `checks.vuna-tests` 仍是串行全量
（权威口径）。

所有语言夹具与包构建都走 DT（`interp` = DT 精化 + 核心求值，`check` / `compile` = DT 精化
+ 擦除 codegen，`build` = DT 逐模块 codegen + `build.sh`）。没有按检查器分支的段，也没有
第二套 codegen 输出模型。

**compile 是目录化产物**：`compile <entry|pkg-dir> OUTDIR` 写逐模块 `.ml` + `build.sh`，
成功静默。脚本里的 `compile_dir_bin` / `compile_dir_and_run` helper 负责「codegen 到临时
目录 → 执行 `build.sh` → 运行产物比对」，没有单文件 `.ml` 的写法。

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
- 夹具 manifest 都**不声明 `[capabilities]`**：corpus 代码只能经 `Base.IO` 使用效果；能力
  正 / 反例在 `packages/{07_effect_capability, 96_effect_no_capability,
  97_unknown_capability}`；
- `test/corpus/fmt/check.sh` 与主 runner 用同一套约定（`VUNA_BASE` + 目录化 compile），
  不接受模块根参数。

## corpus 分类

语言夹具只走 DT：`interp`（DT 精化 + 核心求值）、`check`、`compile` + ocamlopt。
`<base>.vuna.nointerp` 标记跳过 interp 对拍，只做 `compile` + 运行，用于效果程序
（`main : IO a`）与核心求值器不可归约的夹具（`strUnpack` / `strPack` / `strConcatMany` /
`strSubstTemplate`；这些内建的 interp 不归约是显式分类）。当前 `.nointerp` 包括 `dt/34`、
`dt/35`、`dt/56`、`dt_base/01`–`03`/`06`/`10`、`run/10`/`16`/`17`、`stdlib/03`/`07`/`09`/`10`。
第 43 段对每个标记夹具跑一次 `interp`，断言**非 0（明确拒绝：效果不可执行或不归约为
值）**；`.nocompile` 死标记已从 runner 删除。负例 `.err` 是稳定诊断子串，interp / compile
文案不同时用 `.cerr`。

- `corpus/run/*.vuna`：`interp` 输出 vs `.out` golden；`compile` → ocamlopt → 运行再比对；
  `.nointerp`（`10_string_pack`、`16_file_exists`、`17_file_meta`）只跑后者；
  `18_int_overflow` / `19_string_utf8` / `20_str_hash` 是纯值语义 golden；
- `corpus/modules/` 01–30 正例：跨模块函数 / 数据 / 嵌套 import 的 `interp` 与 `compile`
  结果（原“多根”夹具已迁移为**同包多模块**夹具，Helper 在 `lib/`；不再有“多根”概念）；
  覆盖显式导出列表、重导出、抽象类型、空导出集、包门面、无头模块重导出、same-target
  去重、选择性重导出、两级门面、qualified import 重导出、多行模块头、私有类型封装、`_`
  私有构造器在定义模块内匹配；
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
  `mem (Box 1) [...]`）、`15_parametric_deriving`（参数化 `deriving (Show, Eq, Ord)`）、
  `16_eq_ord_alias`（`==` / `eq`、`<` / `lt` 走同一路径，Int/String 特化 + Bool 实例）、
  `17`–`22`（M32 显式签名约束：单 / 多约束、结构化 `Eq (Box a)`、高阶 kind `Monad m`、
  约束函数互调、未使用约束））；
  命名实例特性不存在。错误例 90–95、98 要求错误片段、非 0 退出、不写
  输出（重复实例 / 相干性、head 不符、缺 / 未知方法、显式只写 `Trait` 不写 `(..)`；
  `90_orphan_default` 实际覆盖重复实例，孤儿规则表述已随 M31.1 删除，见 B23）；
  `99_explicit_*`（M32 约束负例：未知接口、非单参数应用、kind 不符、where / trait 方法
  位置不支持）。
  `96_named_instance_removed` / `97_instance_sel_removed` 是 `as` / `@` 语法的解析负例；
- `corpus/monad/`：`do` / `>>=` / `>>` 在 Maybe/List 上的正例，含高阶 kind 泛型
  `bindPair : m a -> m b -> m (Pair a b)`；`04_kind_generic`（多隐式参数字典）check /
  interp / compile+运行三路全过；错误例覆盖 kind 不符、无 Monad、do 结尾 / 绑定模式非法；
- `corpus/stdlib/`：`Base.*` 与 do/IO 正例、错误例；效果夹具 `03_do_io`、`09_io`、
  `10_package` 与 `strUnpack`/`strPack` 的 `07_string` 带 `.nointerp`；另有
  `test/corpus/fmt/check.sh` 覆盖格式化 golden、注释保留、行宽折行、模块头导出列表排序、
  `where` 签名行与幂等；
- `corpus/packages/`：`build` / `test` 的 workspace 正例与缺依赖、依赖环、隐藏模块错误例；
  包构建走 DT，`vuna test` 走 DT 核心求值；`03_reexport` 覆盖 facade 重导出；
  `05_entry_data` 覆盖「入口文件里声明 data」的 codegen 回归（并直接断言 `Main.ml` 含入口
  data 的 OCaml 构造子名）；`06_entry_trait` 覆盖入口 trait 的归属与产物；
  `93_duplicate_name` 覆盖同名包显式报错；`94_ambiguous_module` 覆盖包上下文下的歧义模块；
  `95_cross_dep` 覆盖依赖方向的负例（依赖包不能 import 消费包模块）；
  `07_effect_capability`（声明 `[capabilities] effects` 后可直接调 `prim_*`）与负例
  `96_effect_no_capability`（未声明能力）、`97_unknown_capability`（未知能力名）；
  `08_module_scope`（entry 顶层小写名与同包模块签名里的类型变量同名，banned 集按模块作用域
  计算后 base 模块不再报 `unknown name x`）；
- `corpus/err/`、`corpus/run_err/`：解析 / 求值错误片段；`run_err` 的 `.err` 是 DT 诊断
  子串（非穷尽、if 条件类型、参数过多、clause 数不匹配、let 绑定模式等），
  `03_div_zero` 是产物运行期负例（运行断言 `division by zero`），`07_main_arity` 用
  `.cerr` 区分 compile 文案；
- `corpus/type_ok`、`corpus/type_err`、`corpus/type_modules/`、`corpus/typed_ok`：语言夹具，
  走 `check` / `compile` + 运行断言；`typed_ok/06_where_fwd`、`07_where_mutual`、
  `08_where_self` 是 where 签名正例（局部辅助函数 / 顶层递归），fmt 黄金例见
  `corpus/fmt/05_where`、`15_where_inst`、`fmt/typed/01_where`；where 缺签名负例是
  `corpus/dt_err/35_where_no_sig`；
- `corpus/lint/`、`corpus/fix/`：`vuna lint` / `lint --fix` golden、退出码与幂等（工具链，
  与检查器无关）。规则为 AST 驱动：`literal-if-chain`、`lift-destructure`、`case-to-clauses`；
  语料 05–11、fix 07–13 覆盖三条规则与「不报」形态。输出带错误码：
  `路径:行:列: [LN_XXX] <rule>: <message>`，错误码体系见 [tooling.md](tooling.md) 第 4 节，
  完整清单由 `vuna gen-errors` 生成。规则与边界见 [lint.md](lint.md)；
  `checks.vuna-lint` 对全部包源码要求零 finding；
- `corpus/lsp/smoke.sh`：`vuna lsp` 的 JSON-RPC 冒烟。走包上下文（含 import 的文件真正
  类型检查），覆盖两模块临时包、formatting、documentSymbol、definition、references、
  completion、workspace symbol、lint 诊断、URI `%XX` 与退出码；边界见
  [tooling.md](tooling.md) §2；
- `corpus/dt/*` 正例：索引族 / 依赖匹配 / 擦除 / 相等与证明 / case 矩阵 / axiom / η /
  命名空间等（清单见目录）。`54_user_bool_data`、`55_user_io_data`、`56_user_list_data`
  （`.nointerp`）覆盖用户本地 `data Bool`/`IO`/`List` 与 canonical `Base.*` 身份并存；
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
- **第 39 段：包上下文与能力回归**。覆盖语义边界：无 manifest 的文件只可见 base
  （`VUNA_BASE` 生效、找不到 base 明确报错）；目录入口只认该目录自己的 manifest、不向上
  找；ad-hoc 单文件自动注入 Prelude；依赖方向（`95_cross_dep`：依赖包不能 import 消费包
  模块）在所有入口上下文都被拒（`build` / `check` / `compile` 三入口）；removed-hint 非 0
  退出 + 可操作提示，且 `vuna help` 不再宣传已删路径；39c 用 `prim_print` 断言无 manifest
  上下文报 `requires capability`（能力必须显式声明）。

## Nix checks 清单

`nix flake check` 实测 **13 项**：3 个 package 构建（`vuna` / `vuna-compiler` /
`vuna-seed`）+ 10 个 check 语义项（`context-budget`、`seed-selfhost`、`vuna-fmt`、
`vuna-index`、`vuna-lint`、`vuna-metrics`、`vuna-package`、`vuna-tests`、`vuna-typecheck`、
`vscode-ext`；主体是 `nix/checks/<name>.sh`）。语义项：

- `seed-selfhost`：seed→stage0→stage1→stage2 逐字节一致、TCB 黑名单、闭包数量、增量构建与
  行为抽查；
- `vuna-tests`：沙箱跑上述原生测试；
- `vuna-typecheck` / `vuna-lint`：`vuna check .` 自检、lint 零 finding；
- `vuna-fmt`：workspace 全包与 `examples/`；
- `vuna-package`：`examples/multi` 的 build/test/fmt/doc + 根包构建；
- `vuna-metrics`：冻结夹具（`test/corpus/codegen`）的 codegen 产物对
  `nix/codegen.baseline` 的精确基线；种子尺寸不设门槛（见 [compiler.md](compiler.md)
  §codegen 夹具基线）；
- `vuna-index`：`map` / `--find` / `--impact` / `api` 与内容哈希缓存失效；
- `context-budget`：入口文档字节数与单模块行数对 `nix/context.budget`；
- `vscode-ext`：提交的 `vscode/dist/extension.js` 与清单 / 语法文件的离线自检，不跑
  `npm install`。

## Nix 命令与本地开发

```console
nix build                  # 默认 = vuna；.#vuna-compiler / .#vuna-seed 同理
nix flake check            # 全部 checks
sh nix/ci.sh               # CI 统一入口（eval-cache=false + --keep-going）
nix develop                # 全量开发环境（工具链 + vuna-seed）；.#ocaml 只有 OCaml 工具链
nix build .#vuna --out-link result-vuna      # 产品 CLI（stage 1）
nix build .#vuna-compiler --out-link result-compiler  # 编译器 CLI（stage 1）
nix build .#vuna-seed --out-link result-seed          # stage 0 种子编译器
VUNA=$PWD/result-vuna/bin/vuna VUNA_SEED=$PWD/result-seed/bin/vuna-seed \
  sh test/run-tests.sh
```

**`result*` 可能过期**：out-link 只是手工指到某次构建，源码 / seed 变了不会自动更新。跑
测试或基准前先重建对应的 `nix build ... --out-link`（开放债务 E03）。

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
