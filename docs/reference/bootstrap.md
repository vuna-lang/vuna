# 自举与种子（bootstrap）

本文覆盖信任锚点 `seed/`、自举链、seed rotation 流程与 fixed point 的含义。
编译器模块职责见 [compiler.md](compiler.md)，测试与 CI 门槛见 [testing.md](testing.md)。

## 自举链

```text
seed/（提交入库的多文件 OCaml 信任锚点：**compiler 包**入口的闭包，不含工具链）
  │  seed/build.sh + ocamlopt（ocamlopt -c 逐模块 + 链接）
  ▼
vuna-seed（stage 0 编译器）
  │  vuna-seed compile --package --out stage1 compiler   （包级 codegen）
  │  sh stage1/build.sh vuna-compiler                     （ocamlopt 链接 stage 1）
  ▼
vuna-compiler（stage 1 编译器）
  │  vuna-compiler build .          （对根包 compile --package → .output/lib + app/Main.ml，
  │                                  ──ocamlopt──▶ .output/bin/vuna）
  ▼
vuna（产品 CLI）
  │  vuna-compiler build --split s1 compiler   （扁平分离 codegen，生成 stage 1 文件集）
  │  vuna-compiler build --split s2 compiler   （stage 1 再生成 stage 2 文件集）
  ▼
stage1 == stage2（文件集合逐字节）即 fixed point
```

Nix 侧的对应关系：`packages.vuna-seed`、`packages.vuna-compiler`、`packages.vuna`
分别构建 stage 0 / stage 1 / 产品 CLI；`checks.seed-selfhost`（别名
`checks.fixed-point`）守整条链。

## 种子策略

种子（`seed/`）**提交入库**，是构建输入而不是构建产物。M12 起种子是**多文件文件集**：
每个 vuna 模块对应一个 OCaml 模块（`.ml` + `.mli`），外加共享 runtime 与 `build.sh`。
M12.5 起种子**只覆盖 compiler 包**（`compiler/app/Main.vuna` 的 import 闭包）：工具链
（fmt/lint/repl/doc/test）由编译器编译出来，不在信任锚点里。当前 61 个文件（60 个
源码/清单 + `build.sh`）、约 1.2 MB（M13 起含 DT 模块 Core/Elab/CoreCodegen/Dt，
M12.8 起含 `Base_*` 与 `Prelude`）。唯一的硬性不变量：

> **当前入库的种子必须能编译当前的 vuna 源码。**

- 种子**不需要**与源码同步：日常修改 `lib/`、`app/`、`test/`、`base/`（以及只在
  CLI 侧的工具改动）不重新生成种子；只有 `compiler/` 的变更才可能需要 rotation；
- 种子只通过 **seed rotation** 更新：用当前产品 CLI 对 compiler 包做分离编译，把生成的
  多文件文件集提交为新 `seed/`（`nix/seed-rotate.sh` 会顺带验证种子自生成 fixed point）；
- 种子比源码旧是正常状态，但必须始终保持“能编译当前源码”的能力；
- CI 用 `checks.seed-selfhost` 守这条不变量：`seed/build.sh` → `vuna-seed`；种子对
  **compiler 包**分离编译得到 stage1 文件集并构建；stage1 再生成 stage2 文件集，
  `diff -r` 逐字节一致；同时断言 seed/stage1/stage2 都不含工具模块、检查增量构建
  （无改动不重编、touch 一个模块只重编它）与行为抽查；`checks.fixed-point` 与它同一派生；
- 如果新特性会让源码超出旧种子能编译的语法子集，必须先把特性实现成旧语法可编译的
  形式，rotate 种子后再在编译器源码里使用新语法；
- `seed/` 下所有文件都是生成物，禁止手改。

## 种子轮换流程

```console
# 前提：当前源码能被当前种子编译（nix flake check 通过）
nix build .#vuna --out-link result
sh nix/seed-rotate.sh ./result/bin/vuna   # vuna seed seed compiler + 自生成 fixed point
nix flake check                           # seed-selfhost 等全部通过
git diff seed/                            # 确认变化可解释（文件集 + 路径/代码变化）
git add seed/ && git commit
```

`nix/seed-rotate.sh` 的实际步骤：`rm -rf seed && mkdir seed` →
`vuna seed seed compiler` → 断言重生成的文件集与刚生成的一致（fixed point 自检）→
断言不含工具模块。它同时检查 `seed/` 只含 compiler 闭包：

```console
for tool in Cli Fmt Lint Doc Repl TestRunner Files Eval Interp Process Codegen; do
  [ -e "seed/Vuna_d$tool.ml" ] && fail
done
```

（`Index` 等后续工具模块落地后同样追加进这个清单，见 `flake.nix` 与
`nix/seed-rotate.sh` 的 `forbidden` 列表。）

注意：种子必须从仓库根、以 `compiler` 为包目录生成（脚本已固定这一点），这样产物里
嵌入的源码路径保持一致。如果改的是**现有语法的语义**（而非新增语法），旧种子会按旧
语义编译新编译器，需要确认没有 seed 语义偏差；必要时先 rotate，再让编译器源码依赖新语义。

## 硬不变量

1. **当前 seed 必须能编译当前源码**——`checks.seed-selfhost` 守；
2. **rotation 后 stage1 == stage2**（文件集逐字节），即 fixed point；
3. **`seed/` 只含 compiler 包入口闭包**：工具链（fmt/lint/repl/doc/test、未来的
   LSP / package manager / Index）不进 TCB；
4. 编译器自检：当前编译器必须能类型检查自己的源码（`checks.vuna-typecheck`）；
5. **HM 路径与 `--dt` 路径零回归**：interp + typed + split 三路径语义与产物不变，
   DT 是显式 opt-in。

## 效应内建的包级 allowlist

`seed/` 里没有工具链模块，但编译器自身需要文件 IO。规则在
`compiler/lib/Vuna/Compiler/Loader.vuna` 的 `packageAllowsEffects`：

- 允许直接调用 effectful 内建的包：`vuna`、`vuna-compiler`、`vuna-base`；
- 其余包只能经 `Base.IO` 的 IO API 使用效果，纯代码里直接 `print` / `readFile` 报
  `effectful builtin ... is not available in package ...`；
- `--root` 原始模式 `entryPkg = ""`：入口文件之外（被加载的模块）不受限，入口文件受限
  （调试/夹具路径）。

`Vuna.Compiler.Process.runIn`（`prim_runIn`）是唯一的进程执行内建，同样受 allowlist
限制，且 `Process` 不进 `compiler/vuna.toml` 的 `[export]`。

## 种子文件集（当前）

`seed/` 由 `vuna seed seed compiler` 生成，文件集按依赖序排列，`seed/build.sh`
的 `MODULES` 列出全部编译单元：

```text
Vuna_runtime
Base_dPair Base_dBool Base_dMonad Base_dMaybe Base_dList Base_dIO Base_dResult Base_dString
Prelude
Vuna_dCompiler_dCommon Vuna_dCompiler_dToml Vuna_dCompiler_dManifest Vuna_dCompiler_dPkg
Vuna_dCompiler_dAst Vuna_dCompiler_dLexer Vuna_dCompiler_dParser Vuna_dCompiler_dBuiltins
Vuna_dCompiler_dLoader Vuna_dCompiler_dTypecheck Vuna_dCompiler_dSplit
Vuna_dCompiler_dTypedCodegen Vuna_dCompiler_dCore Vuna_dCompiler_dElab
Vuna_dCompiler_dCoreCodegen Vuna_dCompiler_dDt Vuna_dCompiler_dCompile
Vuna_dCompiler_dSplitCli Vuna_dCompiler_dProcess Vuna_dCompiler_dCompilerCli
Main
```

`seed/build.sh` 由 codegen 生成：干净构建一次 `ocamlopt` 编译全部 `.mli`/`.ml` 并链接；
增量构建按 `.ml`/`.mli`/`.cmi` 时间戳逐模块重编（`compile <module>` 行可被脚本断言）。
编译 flag 统一为 `-g -w -a+39 -warn-error +39`（warning 39 = unused rec，设 warn-error），
并链接 `unix.cmxa`（`fileMtime`/`fileSize` 内建用 `Unix.stat`）。

## 相关阅读

- 编译器模块职责：[compiler.md](compiler.md)
- 子系统数据流与改动定位：[architecture.md](../architecture.md)
- 测试与 CI 门槛：[testing.md](testing.md)
- 路线图中的阶段门槛与硬约束：[docs/roadmap.md](../roadmap.md)
