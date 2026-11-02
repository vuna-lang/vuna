# 测试体系（testing）

本文覆盖 `test/run-tests.sh` 的原生测试、corpus 分类、Nix checks、性能基准与本地开发。
种子不变量与 rotation 见 [bootstrap.md](bootstrap.md)。

## 原生测试：`test/run-tests.sh`

vuna 原生测试按编号章节组织（**34 个章节**：编号到 35，第 12 段已删除；34a–34d 归在
第 34 段内，`--list` 列 34 行），用 `vuna` / `vuna-seed` 驱动，不依赖外部 vuna 实现，
但需要 `ocamlopt` 作为 codegen 后端。当前 **1026 checks**（结尾 `vuna tests passed
(1026 checks)`；seed rotation 后重跑可能微调，以脚本输出为准）。

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

所有语言夹具与包构建都走 DT（`interp` = DT 精化 + 核心求值，`check` / `compile` =
DT 精化 + 擦除 codegen，`build` / `build --split` / `seed` = DT codegen）。没有按检查器
分支的段。

## corpus 分类

语言夹具只走 DT：`interp`（DT 精化 + 核心求值）、`check`、`compile` + ocamlopt。
`<base>.vuna.nointerp` 标记跳过 interp 对拍，只做 `compile` + 运行，用于效果程序
（`main : IO a`）与核心求值器不可归约的夹具（`strUnpack`/`strPack`、多隐式参数
字典）；`.nocompile` 跳过 codegen（仅 `monad/04_kind_generic`，只断言 `check`）。
负例 `.err` 是 DT 实际诊断的稳定子串；interp 与 compile 文案不同时用 `.cerr`。

- `corpus/run/*.vuna`：`interp` 输出 vs `.out` golden；`compile`→ocamlopt→运行再比对；
  `.nointerp`（`10_string_pack`、`16_file_exists`、`17_file_meta`）只跑后者；
- `corpus/modules/` 01–29 正例：跨模块函数/数据/嵌套 import 的 `interp` 与 `compile`
  结果（含多根夹具）；覆盖显式导出列表、重导出、抽象类型、空导出集、包门面、无头模块
  重导出、same-target 去重、选择性重导出、两级门面、qualified import 重导出、多行模块
  头、私有类型封装、`_` 私有构造器在定义模块内匹配；
- `corpus/modules/` 70–99 反例：`_` 隐私、隐藏构造器跨模块构造/匹配、重导出抽象性与
  同名冲突、空导出集、入口文件模块头、非法/重复/未知名导出、缺失模块、跨根歧义、循环
  导入、非法模块名、别名冲突、import 不传递；`interp` 与 `compile` 都要求错误片段、
  非 0 退出、不写输出文件；
- `corpus/records/` 记录：01–05、08 正例 `interp` 与 `compile` 比对 golden
  （record update 与参数化 record 由 `DtRecords` 支持）；90–95 反例要求错误片段、非 0
  退出、compile 不写输出；跨模块 `0*_*/`（`Point(..)` 可构造/匹配，`Point` 保持抽象）与
  `9*_*/`（抽象构造器不可见）同样覆盖；`95_ambiguous_field` 覆盖歧义字段；
- `corpus/traits/` trait：正例 01–13 `interp` 与 `compile` 比对 golden（含泛型字典穿参、
  多类型 default、02 命名实例 `@fancy`、08 跨模块 `@M.fancy`）；错误例 90–95、98 要求
  错误片段、非 0 退出、不写输出（孤儿默认、重复实例、未知 `@`、head 不符、缺/未知方法、
  显式只写 `Trait` 不写 `(..)`）；
- `corpus/monad/`：`do` / `>>=` / `>>` 在 Maybe/List 上的正例，含高阶 kind 泛型
  `bindPair : m a -> m b -> m (Pair a b)`；`04_kind_generic` 带 `.nointerp` +
  `.nocompile`（多隐式参数字典，只断言 `check`）；错误例覆盖 kind 不符、无 Monad、
  do 结尾/绑定模式非法；
- `corpus/stdlib/`（`--root ../base/lib`）：`Base.*` 与 do/IO 正例、错误例；效果
  夹具 `03_do_io`、`09_io`、`10_package` 与 `strUnpack`/`strPack` 的 `07_string` 带
  `.nointerp`；另有 `test/corpus/fmt/check.sh` 覆盖格式化 golden、注释保留、行宽折行、
  模块头导出列表排序、`where` 签名行与幂等；
- `corpus/packages/`：`build` / `build --split` / `test` 的 workspace 正例与缺依赖、
  依赖环、隐藏模块错误例；包构建走 DT，`vuna test` 走 DT 核心求值；`03_reexport` 覆盖
  facade 重导出；
- `corpus/err/`、`corpus/run_err/`：解析/求值错误片段；`run_err` 的 `.err` 是 DT 诊断
  子串（非穷尽、if 条件类型、参数过多、clause 数不匹配、let 绑定模式等），
  `03_div_zero` 是产物运行期负例（运行断言 `division by zero`），`07_main_arity` 用
  `.cerr` 区分 compile 文案；
- `corpus/type_ok`、`corpus/type_err`、`corpus/type_modules/`、`corpus/typed_ok`：
  语言夹具，走 `check` / `compile` + 运行断言；M24 起 `typed_ok/06_where_fwd`、
  `07_where_mutual`、`08_where_self` 是 where 签名正例（局部辅助函数 / 顶层递归），
  fmt 黄金例见 `corpus/fmt/05_where`、`15_where_inst`、`fmt/typed/01_where`；
  where 缺签名负例是 `corpus/dt_err/35_where_no_sig`；
- `corpus/lint/`、`corpus/fix/`：`vuna lint` / `lint --fix` golden、退出码与幂等（工具链，
  与检查器无关）；
- `corpus/lsp/smoke.sh`：`vuna lsp` 的 JSON-RPC 冒烟（诊断来自 DT 精化 + `goalsOfProgram`
  洞目标）；
- `corpus/dt/*`（44 个正例）、`corpus/dt_err/*`（34 个负例，其中
  `35_where_no_sig` 是 M24 新增）、`corpus/dt_base/`（8）、`corpus/dt_io/`（1）、
  `corpus/dt_pkg/`（3 个包目录）、`corpus/dt_root/`：DT 专项夹具，见
  [dt.md](dt.md) 的夹具一节。

## Nix checks 清单

`nix flake check` 覆盖（`nix/checks/default.nix`；主体是 `nix/checks/<name>.sh`）：
`seed-selfhost`（seed→stage0→stage1→stage2 逐字节一致、TCB 黑名单、增量构建与行为抽查）、
`vuna-tests`（沙箱跑上述原生测试）、`vuna-typecheck` / `vuna-lint`（`vuna check .` 自检、
lint 零 finding）、`vuna-fmt`（workspace 全包与 `examples/`）、`vuna-package`
（`examples/multi` 的 build/test/fmt/doc + 根包构建）、`vuna-metrics`（seed 闭包的
codegen 指标对 `nix/metrics.budget`）、`vuna-index`（`map` / `--find` / `--impact` /
`api` 与缓存失效）、`context-budget`（入口文档字节数与单模块行数对 `nix/context.budget`）。
M24 后这些 check 的脚本已按单路径 CLI（无 `compile --package`）更新。

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
进不去；`VUNA_SEED` 只需要一个能 `seed` 的编译器。

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