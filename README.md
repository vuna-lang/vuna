# vuna

vuna 是一个函数式编程语言，本仓库是它的编译器。

编译器有两套实现：先用 OCaml 写一个**外部编译器**（host compiler），再由它把
用 vuna 写的编译器源码编译成 OCaml，作为**自举种子**启动自举。

| 目录 | 角色 | 实现语言 |
| --- | --- | --- |
| `vunax/` | 外部编译器（host compiler），把 vuna 源码编译成 OCaml | OCaml |
| `app/`、`lib/`、`test/` | 自举编译器的 CLI / 编译器库 / 测试 | vuna |
| `bootstrap/` | 自举种子（stage 1）：vunax 编译 vuna 编译器源码得到的 OCaml，提交入库 | OCaml（生成） |

`vunax` 不是自举种子；它只是“认识 vuna 的 OCaml 程序”，用来生产种子。

## 自举链

```text
vunax（OCaml，外部编译器）
  │  生成 / 更新种子（发版或兼容性变更时）
  ▼
bootstrap/（OCaml，stage 1 种子，提交入库）
  │  编译当前 app/ + lib/ + test/ 中的 vuna 源码
  ▼
stage 2（当前版本的 vuna 编译器）
  │  再编译同一份 vuna 源码
  ▼
stage 3 编译器
```

stage 2 与 stage 3 的行为一致（对同一输入产生相同输出）即达到 fixed point，自举完成。

自举种子（`bootstrap/`）**提交入库**，是构建输入而不是构建产物。这里只有一个硬性
不变量：

> **当前入库的种子必须能编译当前的 vuna 源码。**

- 种子**不需要**与源码同步：日常修改 `app/lib/test` 不重新生成种子；
- 只在两种情况下更新种子：发版时；或语言出现旧种子无法编译的不兼容变更时；
- 种子比源码旧是正常状态，但必须始终保持“能编译当前源码”的能力；
- CI 用 `checks.bootstrap-selfhost` 守这条不变量：用种子编译当前源码，构建出
  stage 2 并运行；
- 若旧种子编译不了新源码，必须在合并前解决：要么回退语言变更，要么更新种子
  （同时升级 vunax）；
- `bootstrap/` 下所有文件都是生成物，禁止手改。

种子更新流程：

```console
# 触发条件：发版，或当前种子已无法编译当前源码
# 用能编译新源码的 vunax 重新生成（具体命令等 vunax 的 CLI 接口确定）
vunax generate --out bootstrap/
git diff bootstrap/        # 确认变化可解释
nix flake check            # 含 checks.bootstrap-selfhost
git add bootstrap/ && git commit
```

## 目录结构

```text
.
├── flake.nix             # Nix：构建 vunax、开发环境；后续加 stage1/stage2
├── flake.lock
├── dune-workspace        # dune 工作区根；vunax/ 是唯一的 dune 项目
├── vunax/                # 外部编译器（OCaml）
│   ├── dune-project
│   ├── vunax.opam
│   ├── lib/              # lexer / parser / typecheck / codegen_ocaml ...
│   ├── bin/              # 可执行文件 vunax
│   └── test/             # alcotest 测试
├── app/                  # 自举：vuna 写的 CLI 入口（.vuna）
├── lib/                  # 自举：vuna 写的编译器库（.vuna）
├── test/                 # 自举：vuna 写的测试（.vuna）
├── bootstrap/            # 自举种子（stage 1），提交入库；当前为空占位
├── .ocamlformat
└── README.md
```

注意：仓库根的 `lib/` 不是 OCaml 库目录。根目录只有 `dune-workspace`，真正的
dune 项目在 `vunax/`；因此 `app/`、`lib/`、`test/` 里的 `.vuna` 文件不会被 dune
当成 OCaml 源码扫描，也不会进入 vunax 的构建输入。

## 开发（vunax，OCaml）

```console
nix develop
dune build            # 在仓库根通过 dune-workspace 构建 vunax
dune runtest
dune exec vunax
dune fmt
```

也可以 `cd vunax && dune build`。

## Nix

```console
nix build             # 构建 vunax → ./result/bin/vunax
nix run               # 运行 vunax
nix flake check       # 构建 + 运行测试
nix fmt               # nixfmt-tree 格式化 .nix
```

## 自举链的实现计划

种子策略是「提交入库、构建时直接使用、按发版/兼容性变更更新」，所以 Nix 侧分三类派生：

- `packages.vuna`（stage 1）：直接构建入库的 `bootstrap/`（`buildDunePackage`），
  `nix build` 因此不依赖 vunax，可离线复现；
- `packages.vunax`（stage 0，已有）：外部编译器，用于发版 / 兼容性变更时重新生成
  种子，也是种子失效时的兜底；
- `checks.bootstrap-selfhost`：用入库种子编译当前 `app/lib/test` 源码得到 stage 2，
  构建并运行 stage 2 的自检/测试 —— 守住「种子能编译当前源码」这条不变量；
- `checks.fixed-point`：stage 2 再编译同一份源码得到 stage 3，比较 stage 2 与
  stage 3 行为一致；
- 可选 `checks.vunax-selfhost`：vunax 也能编译当前源码，保证兜底路径始终可用。

等 vunax 的输出接口（接受什么、生成哪些 `.ml`/`.mli`/dune 文件、目录布局）确定后
再实现以上派生。生成物应带 vunax 版本标记（以及生成时的源码版本），这样种子的
“年龄”和重新生成时的 diff 都可解释。

## 依赖管理

- vunax 的库依赖：`vunax/lib/dune` 的 `(libraries ...)`；nixpkgs 提供的库通过
  flake 中 `buildDunePackage` 的 `propagatedBuildInputs` 注入；
- 测试依赖：flake 的 `checkInputs` + `vunax/vunax.opam` 的 `{with-test}`；
- 开发工具：`devShells.default.packages`。

## 说明

- nixpkgs 输入使用 `channels.nixos.org` 的 channel tarball（本机访问不到 GitHub
  的 archive 端点）；能访问 GitHub 时换回 `"github:NixOS/nixpkgs/nixos-unstable"` 即可。
- `.ocamlformat` 的 version 需与 devShell 中的 ocamlformat 一致（当前 0.29.0）。
- 若用 opam：`opam pin ./vunax`（opam 文件位于 vunax 项目根）。
- `bootstrap/` 是提交入库的生成物：不要手改；日常改 vuna 源码不需要重新生成种子，
  但必须保证种子能编译当前源码（`checks.bootstrap-selfhost`）。
- `nix build` 会运行测试（`doCheck = true`），`nix run` 运行 vunax。