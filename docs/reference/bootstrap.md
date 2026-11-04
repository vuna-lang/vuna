# 自举与种子（bootstrap）

本文覆盖信任锚点 `seed/`、自举链、seed rotation 流程与 fixed point 的含义。编译器模块职责
见 [compiler.md](compiler.md)，测试与 CI 门槛见 [testing.md](testing.md)。

## 自举链

```text
seed/（提交入库的多文件 OCaml 信任锚点：**compiler 包**入口的闭包，不含工具链）
  │  seed/build.sh + ocamlopt（ocamlopt -c 逐模块 + 链接）
  ▼
vuna-seed（stage 0 编译器）
  │  vuna-seed build --no-compile --out s1 compiler   （DT 逐模块 codegen：.ml + build.sh）
  │  sh s1/build.sh ./vuna-stage1                     （ocamlopt 链接 stage 1）
  ▼
stage 1 编译器
  │  ./vuna-stage1 build --no-compile --out s2 compiler   （再生成一级文件集）
  ▼
s1 == s2（文件集合逐字节）即 fixed point
  └ 另外：vuna-compiler build .   （同一种逐模块 codegen → .output/，
                                  ──build.sh/ocamlopt──▶ .output/bin/vuna，产品 CLI）
```

`nix/seed-rotate.sh` 用当前产品 CLI 生成临时种子后，也会用该种子构建出的编译器重新
`build --no-compile --out` 并与种子 `diff -r`，同样要求逐字节一致后才替换 `seed/`。

seed 与 `compile` / `build` 的目录产物都由**同一个** DT split codegen 生成
（`Codegen.Split.generateDtSplitProgram`，包级入口 `Driver.Dt.dtSplitProject`；输出模型是
`Driver.Split.SplitFile` + `Driver.Split.buildScript`）：每个源码模块一个 `.ml`，另有共享
runtime 模块、`Main.ml` 与 `build.sh`；**不生成 `.mli`**。没有第二套输出模型或 `--split`
开关。

Nix 侧的对应关系：`packages.vuna-seed`、`packages.vuna-compiler`、`packages.vuna` 分别构建
stage 0 / stage 1 / 产品 CLI；`checks.seed-selfhost` 守整条链。

## 种子策略

种子（`seed/`）**提交入库**，是构建输入而不是构建产物。种子是**多文件文件集**：每个 vuna
模块对应一个 OCaml 模块（`.ml`），外加共享 runtime 模块与 `build.sh`。种子**只覆盖 compiler
包**（`compiler/app/Main.vuna` 的 import 闭包）：工具链（fmt/lint/repl/doc/test/lsp）由
编译器编译出来，不在信任锚点里。当前入库 `seed/` 为 **71 个 `.ml` / 72 个文件**
（`nix/seed-count.txt` = 71）。唯一的硬性不变量：

> **当前入库的种子必须能编译当前的 vuna 源码，且与当前源码的生成结果同步。**

- 种子**必须**与源码同步：修改 `compiler/` 或 `base/`（seed 闭包内）的任何源码都必须
  rotation；只改 `lib/`、`app/`、`test/` 等工具链 / 夹具时不需要。CI 会拒绝「seed 落后但
  fixed point 仍 PASS」的状态；
- 种子只通过 **seed rotation** 更新：用当前产品 CLI 对 compiler 包做 DT split codegen，
  在临时目录完成 TCB、闭包数量与 fixed point 校验后才替换 `seed/`
  （`nix/seed-rotate.sh`，失败不破坏工作树）；
- **种子与源码同步是硬性要求**，不接受「种子比源码旧是正常状态」；
- CI 用 `checks.seed-selfhost` 守这条不变量：`seed/` 由 `packages.vuna-seed` 构建；种子对
  **compiler 包**做 DT split 得到 stage1 文件集并构建；stage1 再生成 stage2 文件集，
  `diff -r` 逐字节一致；同时 `diff -r seed s1` 断言 seed 与当前源码同步，按
  `nix/tcb-forbidden.txt` 断言 seed/stage1/stage2 都不含工具模块，按
  `nix/seed-count.txt` 断言闭包 `.ml` 数量，并检查增量构建与行为抽查；
- 如果新特性会让源码超出旧种子能编译的语法子集，必须先把特性实现成旧语法可编译的形式，
  rotate 种子后再在编译器源码里使用；
- `seed/` 下所有文件都是生成物，禁止手改。

## 种子轮换流程

```console
# 前提：当前源码能被当前种子编译（nix flake check 通过）
nix build .#vuna --out-link result
sh nix/seed-rotate.sh ./result/bin/vuna   # 生成到临时目录 → TCB + fixed point 校验 → 替换 seed/
nix flake check                           # seed-selfhost 等全部通过
git diff seed/                            # 确认变化可解释（文件集 + 路径/代码变化）
git add seed/ && git commit
```

`nix/seed-rotate.sh` 在临时目录完成全部生成与校验：`vuna build --no-compile --out
"$tmp/seed" compiler` → 按 `nix/tcb-forbidden.txt` 断言 TCB → 用该种子构建并验证自生成
fixed point → 全部通过后才替换 `seed/`，因此中间失败不会破坏当前信任锚点。TCB 黑名单只有
`nix/tcb-forbidden.txt` 一份（由 `nix/tcb-check.sh` 断言），新增工具模块时追加到那里。
当前替换步骤是 `rm -rf seed && cp -r`，不是原子替换（开放债务 E06）。

注意：种子必须从仓库根、以 `compiler` 为包目录生成（脚本已固定这一点），这样产物里嵌入的
源码路径保持一致。如果改的是**现有语法的语义**（而非新增语法），旧种子会按旧语义编译新
编译器，需要确认没有 seed 语义偏差；必要时先 rotate，再让编译器源码依赖新语义。

## 硬不变量

1. **当前 seed 必须能编译当前源码，且与源码同步**（`diff -r seed s1`）——`checks.seed-selfhost` 守；
2. **rotation 后 stage1 == stage2**（文件集逐字节），即 fixed point；
3. **`seed/` 只含 compiler 包入口闭包**：工具链（fmt/lint/repl/doc/test/lsp/index）不进 TCB；
4. 编译器自检：当前编译器必须能类型检查自己的源码（`checks.vuna-typecheck`，`vuna check .`
   走 DT）；
5. **唯一路径**：语言夹具、`vuna interp`、包构建与 seed 全部走 DT（精化 + 擦除 codegen），
   没有可切换的检查器，也没有第二套 codegen。

## 效应能力（capabilities）

`seed/` 里没有工具链模块，但编译器自身需要文件 IO。效应边界是 manifest 里的**显式能力
声明**，不是按包名 allowlist：

- 包在 `vuna.toml` 的 `[capabilities] effects` 里声明 `console` / `fs` / `process` / `env` /
  `clock` 的任意子集（合法名与放行判定在 `Vuna.Compiler.Intrinsics` +
  `Loader.Resolve.checkEffectsBuiltins`；未知 / 重复能力名直接报错）；
- 效果原语只有 `prim_*` 名；每个内建的能力位、签名与 runtime 名同源在
  `Vuna.Compiler.Intrinsics`。未声明能力的包只能经 `Base.IO` 使用效果；
- 仓库内三个包的能力声明见各自 `vuna.toml`：根包与 `vuna-compiler` 五个能力，`vuna-base`
  只声明 `console` / `fs` / `process`（`Base.IO` 的封装面）；`test/corpus` 与夹具 manifest
  不声明能力，只能经 `Base.IO`；
- 能力随包上下文传递（`PackageContext` / `Root` / `Module` / `Project`），无 manifest 的
  ad-hoc 文件没有能力；
- base 定位用的 `prim_getenv` / `prim_getcwd` / `prim_execPath` 需要 `env` 能力，与其它
  effectful 内建走同一套检查。

`Driver.CompilerCli.runIn`（`prim_runIn`）是唯一的进程执行入口，需要 `process` 能力。

## 种子文件集（当前）

`seed/` 由 `vuna build --no-compile --out <tmp>/seed compiler`（`nix/seed-rotate.sh` 在临时
目录执行，校验通过后替换 `seed/`）产出，文件集按依赖序排列，`seed/build.sh` 的 `MODULES`
列出全部编译单元。最终清单与数量以 `seed/` 实际内容与 `nix/seed-count.txt` 为准：

```text
Vuna_runtime
Base_dPair ... Base_dString          （vuna-base 模块，依赖序）
Prelude
Vuna_dCompiler_dCommon ... Vuna_dCompiler_dIntrinsics ...
  ... Vuna_dCompiler_dElab_dTerm ... Vuna_dCompiler_dDriver_dCompilerCli
                                     （编译器模块，依赖序；点转 _d）
Main
```

- `Vuna_runtime`：`Codegen.Term.dtRuntime`（`bi_*` / `dtp_*` 等运行时）。
- 每个源码模块一个 `<Module>.ml`（依赖序；OCaml 编译单元名 = 模块名点转 `_d`），文件头
  `open` runtime 与所有更早模块；`List` 桥接（`dtp_unpack/pack`）放在声明 `List` 族的模块
  文件里；`Vuna_dCompiler_dIntrinsics.ml` 是内建声明的唯一真源。
- `Main.ml`：entry decls 的 datas + defs 与 `main` 钩子（入口文件里声明的 `data` 也必须发进
  `Main.ml`）。**不生成 `.mli`**。
- 没有只为形状稳定而保留的空编译单元。

`seed/build.sh` 由 codegen 生成：干净构建一次 `ocamlopt` 编译全部 `.ml` 并链接；增量构建
按内容哈希逐模块重编。编译 flag 统一为 `-g -w -a+39 -warn-error +39`（warning 39 =
unused rec，设 warn-error），并链接 `unix.cmxa`——runtime 仍无条件依赖 Unix
（`Unix.stat` / `gettimeofday` / `readlink` 等；语义与分类见 [primitives.md](primitives.md)）。

## 相关阅读

- 编译器模块职责：[compiler.md](compiler.md)
- 内建声明面、原语语义与效应能力：[primitives.md](primitives.md)
- 子系统数据流与改动定位：[architecture.md](../architecture.md)
- 测试与 CI 门槛：[testing.md](testing.md)
- 路线图与开放债务：[roadmap.md](../roadmap.md)、[debt.md](debt.md)
