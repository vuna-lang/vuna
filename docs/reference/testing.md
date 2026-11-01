# 测试体系（testing）

本文覆盖 `test/run-tests.sh` 的原生测试、corpus 分类、Nix checks 清单、性能基准与
本地开发环境。种子不变量与 rotation 见 [bootstrap.md](bootstrap.md)。

## 原生测试：`test/run-tests.sh`

`test/run-tests.sh` 是 vuna 原生测试（34 个章节，当前约 680 checks；确切数字看结尾
`vuna tests passed (N checks)` 输出），用 `vuna` / `vuna-seed`
驱动，不依赖外部 vuna 实现；但运行测试需要 OCaml 编译器（`ocamlopt`）作为代码生成后端：

```console
sh test/run-tests.sh          # 需要 PATH 中有 vuna 与 vuna-seed
```

环境变量：`VUNA`（stage 1 产品 CLI）、`VUNA_SEED`（stage 0 种子编译器）、
`OCAMLOPT`（默认 `ocamlopt`）。脚本开头会 `cd "$(dirname "$0")"`，
并以相对路径引用 `corpus/...` 与 `../base/lib`，所以从仓库根 `sh test/run-tests.sh`
即可（不需要手工切到 `test/`）。

推荐入口（由 `nix/run-tests.nix` 提供；runner 是包装，不修改 `test/run-tests.sh`，
无参数时行为与直接跑原脚本完全等价）：

```console
nix run .#run-tests                 # 等价于 sh test/run-tests.sh
nix run .#run-tests -- --list       # 列出全部章节
nix run .#run-tests -- --only dt    # 只跑 DT 相关章节
nix run .#run-tests -- --vuna stable  # 编译器改用注册表别名 vuna（远端稳定版）
```

`--only` 支持重复与逗号分隔（`--only 34` 按章节序号匹配）；`VUNA` / `VUNA_SEED`
环境变量可直接覆盖编译器（覆盖时不再调用 `nix build`）。

## corpus 分类

- `corpus/run/*.vuna`：`vuna interp` 输出 vs `.out` golden；编译器生成→`ocamlopt`→运行再比对；
- `corpus/modules/` 01–29 正例（runner glob `[012][0-9]_*`）：跨模块函数/数据/嵌套 import
  的解释器与 typed codegen 结果（含多根夹具）；覆盖 M10 显式导出列表、
  重导出、抽象类型、空导出集与包门面路径共存；20–29 补充无头模块重导出、same-target
  去重、选择性类型/构造器重导出、两级门面、qualified import 重导出、多行模块头、
  私有类型封装、`_` 私有构造器在定义模块内匹配；
- `corpus/modules/` 70–99 反例（runner glob `[789][0-9]_*`）：M10 的 `_` 隐私（私有值/
  类型/构造器跨模块使用、私有构造器 `(..)` 不公开）、隐藏构造器跨模块构造/模式匹配、
  重导出抽象性、重导出同名冲突、限定名函数当构造器模式、空导出集语义、入口文件模块头、
  导出未知名、模块名不匹配、重复导出、显式导出 `_` 名、裸 `_` 顶层名，以及缺失模块、
  跨根歧义、循环导入、未限定引用/未导入、同名不同定义歧义、未导出名字、非法模块名、
  别名冲突、import 不传递；错误用例在 interp / typed codegen 两条路径都要求错误片段、
  不写输出文件；typed 路径同时断言非 0 退出；
- `corpus/records/` 记录（M10.5a）：01–05 正例在 interp / typed codegen
  两条路径比对 golden；90–95 错误例两条路径都要求错误片段与非 0 退出，typed 还要求
  不写输出文件；跨模块正例 `0*_*/`（`Point(..)` 可构造/模式匹配，`Point` 保持抽象）、
  跨模块错误 `9*_*/`（抽象记录构造器不可见）同样覆盖两条路径；
- `corpus/traits/` trait（M10.5b/c，runner 第 22–25 段）：正例 01–13 两条路径
  （interp / typed codegen）比对 golden（含 11/12 泛型字典穿参、13
  多类型 default 实例）；跨模块 08 覆盖无头模块全导出（含命名实例），10 覆盖显式导出
  `Trait(..)`；错误例 90–96、98 两条路径都要求错误片段、非 0 退出、不写输出文件
  （含孤儿默认、重复实例、未知 `@`、head 不符、缺/未知方法、`deriving Ord`、显式
  只写 `Trait` 不写 `(..)` 时方法不可见）；
- `corpus/monad/`（M11，runner 第 26 段）：`do` / `>>=` / `>>` 在 Maybe/List 上的
  正例两条路径，含高阶 kind 泛型函数（`bindPair : m a -> m b -> m (Pair a b)`）与
  kind 不符、无 Monad、do 块结尾非法、do 绑定模式非法等错误例；
- `corpus/stdlib/`（M11 起的标准库夹具，目录名沿用；源模块在 `base/`）：
  `--root ../base/lib` 下 `Base.*` 各模块与 do/IO 的正例两条路径、错误例；另有
  `test/corpus/fmt/check.sh`（第 32 段）覆盖格式化 golden、注释保留（行/块/嵌套/行尾）、
  行宽折行与幂等；
- `corpus/packages/`（M11.5，第 28–29 段）：`vuna compile --package` / `vuna build` /
  `vuna test` 的 workspace 正例（跨包 import + `[export]` + `app/Main.vuna` 入口）与
  缺依赖、依赖环、隐藏模块错误例；M12.5 增加 `03_reexport`（facade 包重导出标准库
  `base`、只依赖 facade 的包使用 List/Maybe，覆盖 compiler 包门面的三包链路）；
  第 30–31 段覆盖 fmt 前后语义一致、`vuna doc`、`vuna repl`；
- `corpus/err/*.vuna`、`corpus/run_err/*.vuna`：解析/求值错误片段；
- `corpus/type_ok`、`corpus/type_err`：单文件类型检查正/反例；
- `corpus/type_modules/0*`、`9*`：跨模块类型检查正/反例；
- `corpus/typed_ok`：默认 typed 单文件原生 OCaml 生成、编译运行与 golden 比对；
- `corpus/modules/` 01–29 的 typed 版本：默认 typed + `--root` 跨模块生成与运行；
- `corpus/lint/*.vuna`：`vuna lint` 检测 golden 与退出码；
- `corpus/fix/*.vuna`：`vuna lint --fix` 结果、退出码与幂等性；
- 统一 CLI：`help`、无参、子命令要求、已删除参数提示、错误退出码、`vuna interp` 缺文件；
- `vuna-seed` 编译 `12_fact` 的种子冒烟；
- 第 33 段（M12.8）：包级 `compile --package`——`.output/{lib,app}` + `build.sh`
  增量编译、输出与单文件一致、无改动不重编、touch 单个模块只重编它；
- 第 34 段（M13–M16）DT：`corpus/dt/*.vuna`（17 个）的 `interp --dt`（核心求值器）/
  `check --dt`（精化 + 擦除检查）/ `compile --dt`（擦除 codegen → ocamlopt → 运行）
  三路与 golden 一致；`corpus/dt_err/*.vuna`（15 个）在 `check --dt` 与 `compile --dt`
  两条路径都要求错误片段、非 0 退出且不写输出文件（非穷尽 case、不可满足分支、
  对 `Int` 做 case、未知构造子、构造子不返回该族、嵌套模式）；另有 `--dt` CLI 约束
  （不支持 `--root` / 包目录，`build` / `seed` 不支持 `--dt`）。

## Nix checks 清单

`nix flake check` 覆盖（定义在 `flake.nix` 的 `checks`）：

- `checks.vuna-tests`：在沙箱里跑上述原生测试；
- `checks.vuna-typecheck`：用当前编译器类型检查自己的源码（`vuna check .`）；
- `checks.vuna-lint`：对 `compiler/lib/Vuna/Compiler/*.vuna`、`lib/Vuna/*.vuna`、
  `base/lib/Base/*.vuna`、`base/lib/*.vuna` 与 `app/*.vuna` 跑 `vuna lint`，
  要求零 finding；
- `checks.vuna-package`：在沙箱里用 `vuna build` 构建 `examples/multi`（workspace +
  成员包 + `base` 依赖）、运行并比对输出，跑 `vuna test` / `vuna fmt --check` /
  `vuna doc`，并用 package 模式构建编译器自身；
- `checks.seed-selfhost`（M12/M12.5）：`seed/` 构建 `vuna-seed` →
  `vuna-seed build --split` 对 **compiler 包**生成 stage 1 文件集 →
  构建 stage 1 `vuna-compiler` → 再生成 stage 2 文件集，
  `diff -r` 逐字节一致；另用 `compile --package` 构建 `vuna-compiler`、
  `vuna-compiler build .` 构建产品 CLI；断言 seed/stage1/stage2 都不含工具模块与
  dynamic codegen；另查增量构建（无改动不重编、touch 模块只重编它）与
  `12_fact` → `120`；DT 行为抽查（`compile --dt` → `42`）；
- `checks.vuna-metrics`（M12）：机器无关 codegen 指标（bytes/lines/最长行/超长行/
  `let rec`/拼接/比较特化/ctor 计数）对 **compiler 闭包** 聚合，对比
  `nix/metrics.budget`，超预算失败；
- `checks.fixed-point`：与 `seed-selfhost` 同一派生。

## Nix 命令

```console
nix build             # 默认 = vuna（产品 CLI）
nix build .#vuna-compiler # stage 1 编译器（从 compiler/ 分离编译）
nix build .#vuna-seed # stage 0 种子编译器（从多文件 seed/ 构建）
nix flake check       # vuna-tests / vuna-package / vuna-metrics / vuna-typecheck / vuna-lint / seed-selfhost
nix fmt               # nixfmt-tree 格式化 .nix
```

## 本地开发

```console
nix develop
nix build .#vuna --out-link result-vuna           # 产品 CLI
nix build .#vuna-compiler --out-link result-compiler  # 编译器 CLI（stage 1）
nix build .#vuna-seed --out-link result-seed      # stage 0 种子编译器
VUNA=$PWD/result-vuna/bin/vuna \
VUNA_SEED=$PWD/result-compiler/bin/vuna-compiler \
sh test/run-tests.sh
```

devShell 提供 `ocaml` / `ocamlopt` 工具链和 `vuna-seed`；stage 1 的 `vuna` 不进
devShell，避免种子失效时连 shell 都进不去。`vuna-compiler` 可独立使用；
`VUNA_SEED` 只需要一个能 `compile` 的编译器，stage 0 或 stage 1 均可。

## 性能基准（手动）

`nix run .#bench` 是**手动**性能基准，用来在优化前后快速测量收益；不是 CI check，
结果依赖机器，不参与 `nix flake check`。默认测量 `vuna`（产品 CLI），
`--compiler boot` 改测 `vuna-seed`（stage 0 编译器）。

```console
nix run .#bench -- --quick                 # 快速冒烟（runs=1）
nix run .#bench -- --runs 5 --save .local/bench/base.json
# 修改代码后与基线对比：
nix run .#bench -- --baseline .local/bench/base.json
nix run .#bench -- --compiler boot         # 改测 seed 编译器
nix run .#bench -- --with-tests            # 额外跑全部 checks
```

报告包含：三级构建性能（seed → vuna-compiler → vuna 的 ocamlopt 时间）、编译性能
（seed/vuna 自编译 compiler 闭包与产品闭包、corpus 批量编译、tiny 程序、
DT 精化 + 擦除 codegen（`dt_elab`））、编译吞吐、
生成产物的 bytes/lines/最长行/超长行/行尾空白、
codegen 健康度计数（`let rec`、`String.concat ""`、`bi_eq_int/_str/_bool`、零参 rec
thunk）、以及 fixed point / seed 一致性 / 可选 tests 状态。`--json` 输出机器可读
报告，`--baseline` 输出与历史报告的 delta。所有中间产物写入临时目录
（`TMPDIR` 可覆盖），不会写入仓库。

## 相关阅读

- 种子不变量与 rotation：[bootstrap.md](bootstrap.md)
- 编译器模块职责：[compiler.md](compiler.md)
- 改动定位与建议测试标签：[architecture.md](../architecture.md)
