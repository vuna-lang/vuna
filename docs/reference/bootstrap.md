# 自举与种子（bootstrap）

本文覆盖信任锚点 `seed/`、自举链、seed rotation 流程与 fixed point 的含义。
编译器模块职责见 [compiler.md](compiler.md)，测试与 CI 门槛见 [testing.md](testing.md)。

## 自举链

```text
seed/（提交入库的多文件 OCaml 信任锚点：**compiler 包**入口的闭包，不含工具链）
  │  seed/build.sh + ocamlopt（ocamlopt -c 逐模块 + 链接）
  ▼
vuna-seed（stage 0 编译器）
  │  vuna-seed build --split s1 compiler   （DT split codegen：逐模块 .ml + build.sh）
  │  sh s1/build.sh ../vuna-stage1         （ocamlopt 链接 stage 1）
  ▼
stage 1 编译器
  │  ./vuna-stage1 build --split s2 compiler   （再生成一级文件集）
  ▼
s1 == s2（文件集合逐字节）即 fixed point
  └ 另外：vuna-compiler build .            （DT 单文件 codegen → .output/main.ml，
                                          ──ocamlopt──▶ .output/bin/vuna，产品 CLI）
```

`nix/seed-rotate.sh` 用当前产品 CLI 生成临时种子后，也会用该种子构建出的编译器
重新 `build --split` 并与种子 `diff -r`，同样要求逐字节一致后才替换 `seed/`。

seed 与 split 文件集都由 **DT split codegen** 生成（`Codegen.Split.generateDtSplitProgram`，
包级入口 `Driver.Dt.dtSplitProject`；输出模型是 `Driver.Split.SplitFile` +
`Driver.Split.buildScript`）：
每个源码模块一个 `.ml`，另有共享 runtime / 内建模块与 `build.sh`；**不生成 `.mli`**。
单文件 DT codegen（`Codegen.Program.generateDtProgram`）只服务 `compile` / `build`。

Nix 侧的对应关系：`packages.vuna-seed`、`packages.vuna-compiler`、`packages.vuna`
分别构建 stage 0 / stage 1 / 产品 CLI；`checks.seed-selfhost` 守整条链。

## 种子策略

种子（`seed/`）**提交入库**，是构建输入而不是构建产物。种子是**多文件文件集**：
每个 vuna 模块对应一个 OCaml 模块（`.ml`），外加共享 runtime / 内建模块与
`build.sh`。种子**只覆盖 compiler 包**（`compiler/app/Main.vuna` 的 import 闭包）：
工具链（fmt/lint/repl/doc/test/lsp）由编译器编译出来，不在信任锚点里。源码模块重组
（compiler 25 → 40 模块）后文件集为 **56 个（55 个 `.ml` + `build.sh`）**，无 `.mli`
（最终以 `seed/` 实际内容为准）。唯一的硬性不变量：

> **当前入库的种子必须能编译当前的 vuna 源码。**

- 种子**不需要**与源码同步：日常修改 `lib/`、`app/`、`test/`、`base/`（以及只在
  CLI 侧的工具改动）不重新生成种子；只有 `compiler/` 的变更才可能需要 rotation；
- 种子只通过 **seed rotation** 更新：用当前产品 CLI 对 compiler 包做 DT split
  codegen，在临时目录完成 TCB 与 fixed point 校验后才替换 `seed/`
  （`nix/seed-rotate.sh`，失败不破坏工作树）；
- 种子比源码旧是正常状态，但必须始终保持“能编译当前源码”的能力；
- CI 用 `checks.seed-selfhost` 守这条不变量：`seed/` 由 `packages.vuna-seed` 构建；
  种子对 **compiler 包**做 DT split 得到 stage1 文件集并构建；stage1 再生成 stage2
  文件集，`diff -r` 逐字节一致；同时按 `nix/tcb-forbidden.txt` 断言 seed/stage1/stage2
  都不含工具模块，并检查增量构建（无改动不重编、touch 一个模块只重编它）与行为抽查；
- 如果新特性会让源码超出旧种子能编译的语法子集，必须先把特性实现成旧语法可编译的
  形式，rotate 种子后再在编译器源码里使用新语法；
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

`nix/seed-rotate.sh` 在临时目录完成全部生成与校验：`vuna seed "$tmp/seed" compiler` →
按 `nix/tcb-forbidden.txt` 断言 TCB → 用该种子构建并验证自生成 fixed point → 全部通过后
才 `rm -rf seed && cp -r "$tmp/seed" seed`，因此中间失败不会破坏当前信任锚点。TCB 黑名单
只有 `nix/tcb-forbidden.txt` 一份（由 `nix/tcb-check.sh` 断言），新增工具模块时追加到那里。

注意：种子必须从仓库根、以 `compiler` 为包目录生成（脚本已固定这一点），这样产物里
嵌入的源码路径保持一致。如果改的是**现有语法的语义**（而非新增语法），旧种子会按旧
语义编译新编译器，需要确认没有 seed 语义偏差；必要时先 rotate，再让编译器源码依赖新语义。

## 硬不变量

1. **当前 seed 必须能编译当前源码**——`checks.seed-selfhost` 守；
2. **rotation 后 stage1 == stage2**（文件集逐字节），即 fixed point；
3. **`seed/` 只含 compiler 包入口闭包**：工具链（fmt/lint/repl/doc/test/lsp/index）
   不进 TCB；
4. 编译器自检：当前编译器必须能类型检查自己的源码（`checks.vuna-typecheck`，
   `vuna check .` 走 DT）；
5. **唯一路径**：语言夹具、`vuna interp`、包构建与 seed 全部走 DT（精化 + 擦除 codegen），
   没有可切换的检查器，也没有第二套 codegen。

## 效应内建的包级 allowlist

`seed/` 里没有工具链模块，但编译器自身需要文件 IO。规则在
`compiler/lib/Vuna/Compiler/Loader/Resolve.vuna` 的 `packageAllowsEffects`：

- 允许直接调用 effectful 内建的包：`vuna`、`vuna-compiler`、`vuna-base`；
- 其余包只能经 `Base.IO` 的 IO API 使用效果，纯代码里直接 `print` / `readFile` 报
  `effectful builtin ... is not available in package ...`；
- `--root` 原始模式 `entryPkg = ""`：入口文件之外（被加载的模块）不受限，入口文件受限
  （调试/夹具路径）。

`Driver.CompilerCli.runIn`（`prim_runIn`，原独立 `Process` 模块已删除）是唯一的进程
执行入口，同样受 allowlist 限制。

## 种子文件集（当前）

`seed/` 由 `vuna seed <tmp>/seed compiler`（`nix/seed-rotate.sh` 在临时目录执行，
校验通过后替换 `seed/`）产出，文件集按依赖序排列，`seed/build.sh` 的 `MODULES`
列出全部编译单元（下列为形状示意，最终清单与数量以 `seed/` 实际内容为准）：

```text
Vuna_runtime
Vuna_builtins
Base_dPair ... Base_dString          （vuna-base 模块，依赖序）
Prelude
Vuna_dCompiler_dCommon ... Vuna_dCompiler_dFrontend_dParser
  ... Vuna_dCompiler_dElab_dTerm ... Vuna_dCompiler_dDriver_dCompilerCli
                                     （编译器 40 模块，依赖序；点转 _d）
Main
```

- `Vuna_runtime`：`Codegen.Term.dtRuntime`（`bi_*` 等运行时）。
- `Vuna_builtins`：split 生成器保留的编译单元；M24.7 删除旧内建 trait/实例后内容为空
  （只 `open Vuna_runtime`），保留它是为了让文件集形状稳定。
- 每个源码模块一个 `<Module>.ml`（依赖序；OCaml 编译单元名 = 模块名点转 `_d`），
  文件头 `open` runtime / builtins 与所有更早模块；`List` 桥接（`dtp_unpack/pack`）
  放在声明 `List` 族的模块文件里。
- `Main.ml`：entry decls 的 datas + defs 与 `main` 钩子（M24.6 修复：入口文件里声明的
  `data` 也必须发进 `Main.ml`）。**不生成 `.mli`**。

`seed/build.sh` 由 codegen 生成：干净构建一次 `ocamlopt` 编译全部 `.ml` 并链接；
增量构建按 `.ml`/`.cmi` 时间戳逐模块重编（`compile <module>` 行可被脚本断言）。
编译 flag 统一为 `-g -w -a+39 -warn-error +39`（warning 39 = unused rec，设 warn-error），
并链接 `unix.cmxa`（`fileMtime`/`fileSize` 内建用 `Unix.stat`）。

## 相关阅读

- 编译器模块职责：[compiler.md](compiler.md)
- 子系统数据流与改动定位：[architecture.md](../architecture.md)
- 测试与 CI 门槛：[testing.md](testing.md)
- 路线图中的阶段门槛与硬约束：[docs/roadmap.md](../roadmap.md)