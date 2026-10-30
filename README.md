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
│   ├── lib/              # token / lexer / ast / parser / eval（后续加 typecheck / codegen）
│   ├── bin/              # 可执行文件 vunax
│   └── test/             # alcotest + corpus/ 解析语料与 golden
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
vunax --version       # devShell 里直接可用（devShell 内的 vunax 跳过包测试）
vunax run vunax/test/corpus/run/12_fact.vuna
dune fmt
```

也可以 `cd vunax && dune build`。devShell 里放的 vunax 用 `doCheck = false`
构建，避免“测试失败 → devShell 建不出来 → 没法调试”的死循环；测试由
`nix build` / `nix flake check` 运行。

## 解析器（core-v0，M1）

实现（`vunax/lib/`）：

- `token.ml` / `lexer.ml`：token 带 1-based 行列位置；支持 `--` 行注释、`{- -}`
  嵌套块注释、字符串转义；
- `parser.ml`：手写递归下降 + 优先级解析；layout 用 offside 规则（不插入虚拟括号）：
  顶层声明、`data` 构造器块、`case` 分支、`let` 绑定都按块列对齐，表达式可以跨行，
  只要缩进大于所在块列；
- `ast.ml`：core-v0 AST 与确定性的 S-expression 渲染；
- 支持：`data`（简单参数化）、类型签名（解析、暂不检查）、多子句函数、
  `case ... of`、`let ... in`、lambda、`if then else`、整数/字符串、
  `[..]` 与 `x :: xs` 列表糖、中缀运算符
  （`-> || && == /= < <= > >= ++ + - * / ::`）。

```console
dune exec vunax -- parse vunax/test/corpus/ok/06_list_sugar.vuna
dune exec vunax -- --version
```

语法语料：

- `vunax/test/corpus/ok/*.vuna` + 同名 `.sexp`（AST golden）；
- `vunax/test/corpus/err/*.vuna` + 同名 `.err`（错误位置与信息 golden）；
- 改语料或解析器后运行 `vunax/test/update-golden.sh` 重新生成 golden，再 review diff。

尚未实现（后续里程碑）：类型检查（core-v0 先不检查类型）、源码级自解释（M3b）、
`where` / `do` / 隐式参数 / 依赖类型 / 模块系统。

## 求值器（core-v0，M2）

[eval.ml](vunax/lib/eval.ml) 在现有 AST 上做严格求值（call-by-value）：

- 顶层定义互递归；函数值按子句顺序做模式匹配，参数不足时返回部分应用；
  `name = expr` 这种零参数定义在引用时自动求值（常量语义）；
- 构造器按 `data` 里的 arity 柯里化；`case` / `let` / lambda 都支持嵌套模式；
- `main` 必须是零参数定义，`vunax run` 求值 `main` 并用 `show` 打印结果；
- 内建：`+ - * /`、`== /= < <= > >=`（Int/String/Int 比较）、`&& ||`、
  `++`（String 拼接）、`strLength`、`strUnpack`（String → List Int）、
  `strPack`（List Int → String）、`strFromInt`（Int → String）；
- `if` / `&&` / `||` / 比较结果的布尔值约定为构造器 `True` / `False`
  （与 Idris2 一致）；程序需要自己声明 `data Bool` 才能对它们做模式匹配。

```console
dune exec vunax -- run vunax/test/corpus/run/03_data_case.vuna
# (S (S (S (S Z))))
```

求值语料：

- `vunax/test/corpus/run/*.vuna` + 同名 `.out`（`main` 求值结果 golden）；
- `vunax/test/corpus/run_err/*.vuna` + 同名 `.err`（运行时错误信息 golden）；
- 与解析 golden 一起由 `vunax/test/update-golden.sh` 重新生成。

限制：没有 IO（只能通过 `main` 的返回值观察结果）、没有类型检查，
运行时错误信息暂时不带源码位置（AST 还没有 span）。

## 自解释器（M3a，AST 级）

[app/interp.vuna](app/interp.vuna) 是用 vuna 写的自解释器，被 vunax 解释执行：

- 输入是 `vunax parse` 输出的 `(program ...)` S-expression（同一套 core-v0 AST）；
- 内部实现：S-expression reader → AST 转换 → call-by-value 求值器 → `show`，
  以及和 vunax 一致的内建运算（含 Bool/List/String 的表示转换）；
- `main` 约定与 vunax 相同：`vunax run app/interp.vuna` 会解释内置的 demo 程序；
- 错误统一返回 `error: ...` 字符串。

```console
vunax run app/interp.vuna
# "42"
```

验证方式（62 个测试，`nix build` 的 checkPhase 全跑）：

- **差分测试**：对 `corpus/run/` 的每个程序，先用 vunax 直接跑得到结果，
  再把该程序的 AST 交给 vuna 自解释器跑，两边 `show` 结果必须一致；
- **self application**：把自解释器自己的 AST 交给它自己解释，结果与直接运行一致
  （说明当前语言子集已经能承载整个解释器）。

限制：这一版解释的是 **AST**，还不是源码；用 vuna 重写 lexer/parser
（源码级自解释，M3b）是下一步。运行时错误没有源码位置。

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