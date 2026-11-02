# 测试体系（testing）

本文覆盖 `test/run-tests.sh` 的原生测试、corpus 分类、Nix checks、性能基准与本地开发。
种子不变量与 rotation 见 [bootstrap.md](bootstrap.md)。

## 原生测试：`test/run-tests.sh`

vuna 原生测试（34 个编号章节，第 34 段另含 34a–34d 四个子块、不能单独 `--only` 过滤；
当前 1019 checks，确切数看结尾 `vuna tests passed (N checks)` 输出），用 `vuna` /
`vuna-seed` 驱动，不依赖外部 vuna 实现，但需要 `ocamlopt` 作为 codegen 后端。

```console
sh test/run-tests.sh        # 需要 PATH 中有 vuna 与 vuna-seed
```

环境变量：`VUNA`（stage 1 产品 CLI）、`VUNA_SEED`（stage 0 种子编译器）、`OCAMLOPT`
（默认 `ocamlopt`）。脚本会 `cd "$(dirname "$0")"`，从仓库根直接跑即可。推荐入口
（`nix/run-tests.nix` 包装，不修改原脚本；无参数等价于直接跑）：

```console
nix run .#vuna-run-tests [-- --list | --only 34 | --only dt | --vuna stable]
```

`--only` 支持重复与逗号分隔（纯数字按章节序号匹配）；`VUNA` / `VUNA_SEED` 可直接覆盖
编译器（覆盖时不再调用 `nix build`）。

M23 起第 1–11、13–27、30、34 段走 DT 路径（`interp` = DT 精化 + 核心求值，
`check --dt` / `compile --dt`）；第 28/29/33 段与 34d 的 HM 包构建零回归保留到 M24。

## corpus 分类

语言夹具只走 DT：`interp`（DT 精化 + 核心求值）、`check --dt`、`compile --dt` +
ocamlopt。`<base>.vuna.nointerp` 标记跳过 interp 对拍，只做 `compile --dt` + 运行，用于
效果程序（`main : IO a`）与核心求值器不可归约的夹具（`strUnpack`/`strPack`、多隐式参数
字典）；`.nocompile` 跳过 codegen（仅 `monad/04_kind_generic`，只断言 `check --dt`）。
负例 `.err` 是 DT 实际诊断的稳定子串；interp 与 compile 文案不同时用 `.cerr`。

- `corpus/run/*.vuna`：`interp` 输出 vs `.out` golden；`compile --dt`→ocamlopt→运行再比对；
  `.nointerp`（`10_string_pack`、`16_file_exists`、`17_file_meta`）只跑后者；
- `corpus/modules/` 01–29 正例（glob `[012][0-9]_*`）：跨模块函数/数据/嵌套 import 的
  `interp` 与 `compile --dt` 结果（含多根夹具）；覆盖显式导出列表、重导出、抽象类型、
  空导出集、包门面、无头模块重导出、same-target 去重、选择性重导出、两级门面、qualified
  import 重导出、多行模块头、私有类型封装、`_` 私有构造器在定义模块内匹配；
- `corpus/modules/` 70–99 反例（glob `[789][0-9]_*`）：`_` 隐私、隐藏构造器跨模块构造/
  匹配、重导出抽象性与同名冲突、空导出集、入口文件模块头、非法/重复/未知名导出、缺失
  模块、跨根歧义、循环导入、非法模块名、别名冲突、import 不传递；`interp` 与
  `compile --dt` 都要求错误片段、非 0 退出、不写输出文件；
- `corpus/records/` 记录：01–05、08 正例两条路径比对 golden（M23 起 record update 与
  参数化 record 由 `DtRecords` 支持）；90–95 反例两条路径都要求错误片段、非 0 退出、
  compile 不写输出；跨模块 `0*_*/`（`Point(..)` 可构造/匹配，`Point` 保持抽象）与
  `9*_*/`（抽象构造器不可见）同样覆盖；原 `95_unresolved_record_type` 已删除，改为
  `95_ambiguous_field`（歧义字段）；
- `corpus/traits/` trait：正例 01–13 两条路径比对 golden（含泛型字典穿参、多类型 default、
  02 命名实例 `@fancy`、08 跨模块 `@M.fancy`）；错误例 90–95、98 两条路径都要求错误片段、
  非 0 退出、不写输出（孤儿默认、重复实例、未知 `@`、head 不符、缺/未知方法、显式只写
  `Trait` 不写 `(..)`）；HM 专属负例 `96_deriving_ord` 已删除（DT 正例见
  `dt/31_deriving_ord`）；
- `corpus/monad/`：`do` / `>>=` / `>>` 在 Maybe/List 上的正例两条路径，含高阶 kind 泛型
  `bindPair : m a -> m b -> m (Pair a b)`；`04_kind_generic` 带 `.nointerp` +
  `.nocompile`（多隐式参数字典，只断言 `check --dt`）；错误例覆盖 kind 不符、无 Monad、
  do 结尾/绑定模式非法；
- `corpus/stdlib/`（`--root ../base/lib`）：`Base.*` 与 do/IO 正例两条路径、错误例；效果
  夹具 `03_do_io`、`09_io`、`10_package` 与 `strUnpack`/`strPack` 的 `07_string` 带
  `.nointerp`；另有 `test/corpus/fmt/check.sh`（第 32 段）覆盖格式化 golden、注释保留、
  行宽折行、模块头导出列表排序与幂等；
- `corpus/packages/`（第 28–29 段）：`compile --package` / `build` / `test` 的 workspace
  正例与缺依赖、依赖环、隐藏模块错误例；M23 起包构建仍走 HM，`vuna test` 已随 interp
  走 DT，并额外断言 `check --dt`；`03_reexport` 覆盖 facade 重导出；
- `corpus/err/`、`corpus/run_err/`：解析/求值错误片段；`run_err` 的 `.err` 是 DT 诊断
  子串（非穷尽、if 条件类型、参数过多、clause 数不匹配、let 绑定模式等），
  `03_div_zero` 改为产物运行期负例（运行断言 `division by zero`），`07_main_arity` 用
  `.cerr` 区分 compile 文案；
- `corpus/type_ok`、`corpus/type_err`、`corpus/type_modules/`、`corpus/typed_ok`：M23 起
  以 `check --dt` / `compile --dt` + 运行断言（HM typed 不再检查语言夹具；`where` 夹具
  已改写为顶层 helper，M24 随 HM 决定 `typed_ok` 去向）；
- `corpus/lint/`、`corpus/fix/`：`vuna lint` / `lint --fix` golden、退出码与幂等（工具链，
  DT 无关）；第 14 段统一 CLI（含 `interp --dt` 的 removed 提示）；第 13 段 `vuna-seed`
  编译 `run/12_fact` 冒烟（seed 仍是 HM 产物）；第 17 段 M9 静态诊断；第 30 段 fmt 前后
  DT 语义一致与幂等；第 31 段 `doc` / `repl` 冒烟（REPL 顶层定义先输签名行）；
- 第 33 段：包级 `compile --package` 的 `.output/{lib,app}` + `build.sh` 增量编译、输出
  一致、无改动不重编、touch 单模块只重编（HM Split 模型保留到 M24）；
- 第 34 段 DT：`corpus/dt/*.vuna`（44 个）三路（`interp` / `check --dt` / `compile --dt`
  + ocamlopt）与 golden 一致，并断言 `interp` 输出 == 编译产物输出；`corpus/dt_err/`
  （33 个）两条路径都要求错误片段、非 0 退出、不写输出。M23 新增 `dt/39_generic_eq`–
  `44_short_circuit`（泛型 `==` 兜底、record update、参数化 record、`@inst`、参数化
  derived `Eq`、`&&`/`||` 短路）与 `dt_err/30_duplicate_instance`–
  `34_record_update_ambiguous`；34a `dt_base/`（8 个，`--root ../base/lib`）三路 + 对拍
  （`01/02/03/06` 带 `.nointerp`）；34b `dt_io/` 只跑 check + compile+ocamlopt；34c
  `dt_pkg/` 包目录（`01_exec` 三路、`02_lib` check 过 / compile 清晰报错、`03_bad` 无
  `vuna.toml`）与 `interp <包目录>` 清晰错误；34d `build --dt` / `seed --dt` 入口与
  `--dt` CLI 约束（HM `build` 零回归，M24 删除该部分）；
- 第 35 段：`vuna goal` 洞目标显示 + `corpus/lsp/smoke.sh` 冒烟。

## Nix checks 清单

`nix flake check` 覆盖（`nix/checks/default.nix`；主体是 `nix/checks/<name>.sh`）：
`seed-selfhost`（seed→stage0→stage1→stage2 逐字节一致、TCB 黑名单、增量构建与行为抽查）、
`vuna-tests`（沙箱跑上述原生测试）、`vuna-typecheck` / `vuna-lint`（`vuna check .` 自检、
lint 零 finding）、`vuna-fmt`（workspace 全包与 `examples/`）、`vuna-package`
（`examples/multi` 的 build/test/fmt/doc + 根包构建）、`vuna-metrics`（codegen 指标对
`nix/metrics.budget`）、`vuna-index`（`map` / `--find` / `--impact` / `api` 与缓存失效）、
`context-budget`（入口文档字节数与单模块行数对 `nix/context.budget`）。

## Nix 命令与本地开发

```console
nix build                  # 默认 = vuna；.#vuna-compiler / .#vuna-seed 同理
nix flake check            # 全部 checks
nix develop                # 全量开发环境（工具链 + vuna-seed）；.#ocaml 只有 OCaml 工具链
nix build .#vuna --out-link result-vuna      # 产品 CLI（stage 1）
nix build .#vuna-compiler --out-link result-compiler  # 编译器 CLI
nix build .#vuna-seed --out-link result-seed          # stage 0 种子
VUNA=$PWD/result-vuna/bin/vuna VUNA_SEED=$PWD/result-compiler/bin/vuna-compiler \
  sh test/run-tests.sh
```

`devShells.default` = `ocaml`/`ocamlopt` + `vuna-seed`；`devShells.ocaml` 只有工具链，
种子重建或损坏时用它。stage 1 的 `vuna` 不进任何 devShell，避免种子失效时连 shell 都
进不去；`VUNA_SEED` 只需要一个能 `compile` 的编译器。

## 性能基准（手动）

`nix run .#vuna-bench` 是**手动**基准（不是 CI check，结果依赖机器）：默认测 `vuna`，
`--compiler seed` 改测 `vuna-seed`；`--quick` 快速冒烟，`--runs N --save F` 存档，
`--baseline F` 与历史对比，`--with-tests` 额外跑全部 checks，`--json` 输出机器可读报告。

报告包含三级构建（seed → vuna-compiler → vuna 的 ocamlopt 时间）、编译性能（自编译
compiler 闭包、corpus 批量、tiny 程序、DT 精化 + 擦除 codegen）、吞吐、产物
bytes/lines/最长行/行尾空白、codegen 健康度计数（`let rec`、`String.concat ""`、
`bi_eq_int/_str/_bool`、零参 rec thunk）、fixed point / seed 一致性与可选 tests 状态。
中间产物写入临时目录（`TMPDIR` 可覆盖），不写入仓库。

## 相关阅读

- 种子不变量与 rotation：[bootstrap.md](bootstrap.md)；编译器模块职责：[compiler.md](compiler.md)
- 改动定位与建议测试标签：[architecture.md](../architecture.md)