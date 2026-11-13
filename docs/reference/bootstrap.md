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
（`Codegen.Split.generateDtSplitProgram`，入口 `Driver.Dt.dtSplitProjectParts`（接口路径 `dtSplitProjectWithIfaces`）；输出模型是
`Driver.Split.SplitFile` + `Driver.Split.buildScript`）：每个源码模块一个 `.ml`，另有共享
runtime 模块、`Main.ml` 与 `build.sh`；**不生成 `.mli`**。没有第二套输出模型或 `--split`
开关。

Nix 侧的对应关系：`packages.vuna-seed`、`packages.vuna-compiler`、`packages.vuna` 分别构建
stage 0 / stage 1 / 产品 CLI；`checks.seed-selfhost` 守整条链。

## 种子策略

种子（`seed/`）**提交入库**，是构建输入而不是构建产物。种子是**多文件文件集**：每个 vuna
模块对应一个 OCaml 模块（`.ml`），外加共享 runtime 模块与 `build.sh`。种子**只覆盖 compiler
包**（`compiler/app/Main.vuna` 的 import 闭包）：工具链（fmt/lint/repl/doc/test/lsp）由
编译器编译出来，不在信任锚点里。当前闭包规模以 `seed/` 实际内容与 `nix/seed-count.txt` 为准。

唯一的硬性不变量：

> **当前入库的种子必须能编译当前的 vuna 源码。**

种子**不要求**与当前源码的生成结果逐字节同步（`diff -r seed s1` 不再作为 CI 门槛）。
rotation 是**按需**事件；`seed-selfhost` 在 seed 落后时只输出滞后报告，仍然执行
`stage1 == stage2` 的 fixed point 检查——它证明「当前源码被旧 seed 编译出的编译器自洽」，
不要求信任锚点等于当前源码。

按需 rotation 的触发条件：

- **旧 seed 编不动当前源码**：新语法、新内建、种子闭包内新增依赖等。此时 `nix build .#vuna`
  本身就会失败；必须先按下面的「旧种子能编译新源码」规则把特性落成旧语法可编译的形式，
  rotate 后再使用新语法；
- **生成产物形状改变**：codegen 输出、模块划分或 `build.sh` 结构变化会让 `stage1 != stage2`
  自然失败，从而强制 rotation（fixed point 是安全网，不另设同步检查）；
- **修改现有语义**：旧 seed 会按旧语义翻译新编译器，可能产生语义偏差；先以旧语义可正确
  编译的形式落地 → rotation → 再让源码依赖新语义；
- **发布前**：发布流程必须 rotation 并跑完整 `nix flake check`；
- 日常新增 / 修改功能、只改 `lib/`、`app/`、`test/` 等工具链 / 夹具时，都不需要 rotation。

取舍：信任锚点因此可能落后于源码。这是明确接受的代价，换来的是不再为每次 `compiler/`
或 `base/` 改动产生 3–4k 行生成物 diff、避免 feature 分支与 rebase 的 seed 冲突。fixed point
仍保证当前编译器自洽；发布前由 rotation 收敛。滞后程度由 CI 报告与
`nix/seed-rotation.txt` 元数据可见。

- 种子只通过 **seed rotation** 更新：用当前产品 CLI 对 compiler 包做 DT split codegen，
  在临时目录完成 TCB、完整 allowlist、闭包数量与 fixed point 校验后才替换 `seed/`，并写入
  `nix/seed-rotation.txt`（`nix/seed-rotate.sh`，失败不破坏工作树）；
- 接口缓存已并入对象库（`$VUNA_STORE/objects/iface`），rotation 前不需要再清理源码旁的
  `*.iface` / `.vuna-iface`（树内文件层已删除；历史说明 stale-ref-ok）；两遍编译共用对象库，位置表路径由包上下文
  归一，fixed point 比较的是生成文件集；
- CI 用 `checks.seed-selfhost` 守不变量 1/2：`seed/` 由 `packages.vuna-seed` 构建；种子对
  **compiler 包**做 DT split 得到 stage1 文件集并构建；stage1 再生成 stage2 文件集，
  `diff -r` 逐字节一致；同时报告 seed 与当前源码生成结果的滞后规模（不失败），按
  `nix/tcb-check.sh` / `nix/tcb-forbidden.txt` 断言 seed/stage1/stage2 都不含工具模块，按
  `nix/tcb-allowlist.sh` / `nix/seed-files.txt` 断言 seed 文件集逐项一致，按
  `nix/seed-count.txt` 断言闭包 `.ml` 数量，并检查增量构建与行为抽查；
- 如果新特性会让源码超出旧种子能编译的语法子集，必须先把特性实现成旧语法可编译的形式，
  rotate 种子后再在编译器源码里使用；
- `seed/` 下所有文件都是生成物，禁止手改。

### 滞后报告与元数据

- `checks.seed-selfhost` 用 `LC_ALL=C diff -rq seed s1` 统计差异文件数，写入
  `$OUT/seed-lag.txt` 与 CI 日志，**不失败**；
- `nix/seed-rotation.txt` 记录上次 rotation 的时间、`compiler/` + `base/` 源码指纹、
  文件数、seed 闭包数量与 git commit（`nix/seed-rotate.sh` 写入）；它只用于审计，不参与
  失败判定；
- rotation 必须独立成 `chore(seed): ...` 提交，不与特性提交混合。

## 种子轮换流程

```console
# 前提：当前 seed 能编译当前源码（否则先按「旧种子能编译新源码」规则把源码落到旧语法）
nix build .#vuna --out-link result
sh nix/seed-rotate.sh ./result/bin/vuna   # 生成 → TCB + fixed point 校验 → 替换 seed/ 并写元数据
nix flake check                           # seed-selfhost 等全部通过
git diff seed/                            # 确认变化可解释（文件集 + 路径/代码变化）
git add seed/ nix/seed-count.txt nix/seed-files.txt nix/seed-rotation.txt && git commit
```

`nix/seed-rotate.sh` 在临时目录完成全部生成与校验：`vuna build --no-compile --out
"$tmp/seed" compiler` → 按 `nix/tcb-forbidden.txt` 断言 TCB → 用该种子构建并验证自生成
fixed point → 全部通过后才替换 `seed/` 并写入 `nix/seed-rotation.txt`，因此中间失败不会破坏
当前信任锚点。TCB 黑名单只有 `nix/tcb-forbidden.txt` 一份（由 `nix/tcb-check.sh` 断言），
新增工具模块时追加到那里。替换步骤先把新种子复制到同目录临时路径，再用 rename 换入
（失败回滚旧 `seed/`），因此不再有 `rm -rf seed` 的半成品窗口。

注意：种子必须从仓库根、以 `compiler` 为包目录生成（脚本已固定这一点），这样产物里嵌入的
源码路径保持一致。如果改的是**现有语法的语义**（而非新增语法），旧种子会按旧语义编译新
编译器，需要确认没有 seed 语义偏差；必要时先 rotate，再让编译器源码依赖新语义。

## 硬不变量

1. **当前 seed 必须能编译当前源码**——`checks.seed-selfhost` 守；不要求与源码逐字节同步；
2. **stage1 == stage2**（文件集逐字节），即 fixed point；每次 CI 与 rotation 后都检查；
3. **`seed/` 只含 compiler 包入口闭包**：工具链（fmt/lint/repl/doc/test/lsp/index）与
   package manager 都不进 TCB；
4. 编译器自检：当前编译器必须能类型检查自己的源码（`checks.vuna-typecheck`，`vuna check .`
   走 DT）；
5. **唯一路径**：语言夹具、`vuna interp`、包构建与 seed 全部走 DT（精化 + 擦除 codegen），
   没有可切换的检查器，也没有第二套 codegen。

## 效应边界（manifest 门控已删除）

`seed/` 里没有工具链模块，但编译器自身需要文件读写。这条边界**不再由 manifest 门控**：
`[capabilities]` / `[trust]` / `[privileged]` 与宿主模块 import 门控已整体删除。

- **seed 闭包不变**：seed 仍只含 compiler 包入口闭包；编译器与 base 的 Eff handler 仍直调
  `prim_*` / `prim_eff_*`（`Eff []` 叶子）。动作类型仍是唯一的 `Eff r a`，入口 `main : Eff [] a`，
  执行入口 `Base.Eff.runPure`。
- **任何包都可见宿主层**：用户包、`test/corpus` 夹具、ad-hoc 文件都可以直接调用
  `prim_*` / `prim_eff_*`；没有每包原语白名单、`unsafe` 定义级审计，也没有
  REPL `--privileged`。编译器不再检查内建的能力位。
- **用户面纪律（非门控）**：用户面**应**经 `Base.Eff.*` 标签 + handler 使用效果；宿主层
  细节留在 `prim_eff_*` / `Base.Eff*` handler 内部（原宿主别名模块已删除）。见 [effects.md](effects.md) §8.6 与
  [primitives.md](primitives.md) §7。
- **显式接受的损失**：宿主层 import 门控、每包原语白名单、`unsafe` 定义级审计、网络仅
  根包可用；历史见 git，后续用表示层权限（N2/N3）或新模型补。
- `Driver.CompilerCli.runIn`（`prim_eff_runIn`）仍是唯一的进程执行入口（代码内部约定，
  不再是能力检查）。

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
  **只** `open Vuna_runtime`（没有 open 链），跨单元引用写成 OCaml 限定名 `Unit.name`
  （值 / 构造子 / 类型一致）；`List` 桥接（`dtp_unpack/pack`）放在声明 `List` 族的模块
  文件里；`Vuna_dCompiler_dIntrinsics.ml` 是内建声明的唯一真源。
- `Main.ml`：entry decls 的 datas + defs 与 `main` 钩子（入口文件里声明的 `data` 也必须发进
  `Main.ml`）。**不生成 `.mli`**。
- 没有只为形状稳定而保留的空编译单元。

`seed/build.sh` 由 codegen 生成：干净构建一次 `ocamlopt` 编译全部 `.ml` 并链接；增量构建
按内容哈希**按直接依赖分层**重编（层内并行，每模块 stamp 只含直接依赖的 `.stamp`）。编译
flag 统一为 `-g -w -a+39 -warn-error +39`（warning 39 = unused rec，设 warn-error），并
链接 `unix.cmxa`——runtime 仍无条件依赖 Unix
（`Unix.stat` / `gettimeofday` / `readlink` 等；语义与分类见 [primitives.md](primitives.md)）。

## 相关阅读

- 编译器模块职责：[compiler.md](compiler.md)
- 内建声明面、原语语义与宿主层：[primitives.md](primitives.md)
- 子系统数据流与改动定位：[architecture.md](../architecture.md)
- 测试与 CI 门槛：[testing.md](testing.md)
- 开放债务：[debt.md](debt.md)
