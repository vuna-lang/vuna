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

工具命名：`vunax`（stage 0，OCaml）、`vuna-boot`（stage 1 种子二进制）、
`vuna`（stage 2 当前编译器）、`vuna-interp`（自解释器编译产物，调试/差分用）。

## 自举链

```text
vunax（OCaml，stage 0）
  │  vunax compile --no-print --root lib app/compile.vuna
  ▼
bootstrap/stage1.ml（stage 1 种子，提交入库）  ──ocamlopt──▶  vuna-boot
  │  vuna-boot 编译当前 lib/ + app/compile.vuna
  ▼
stage 2（当前编译器）  ──ocamlopt──▶  vuna
  │  vuna 再编译同一份源码
  ▼
stage 3 源码；stage2 == stage3 即 fixed point
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
vunax compile --no-print --root lib app/compile.vuna > bootstrap/stage1.ml
git diff bootstrap/        # 确认变化可解释
nix flake check            # 含 checks.bootstrap-selfhost
git add bootstrap/ && git commit
```

## 目录结构

```text
.
├── flake.nix             # Nix：vunax / vuna-boot / vuna / vuna-interp、开发环境
├── flake.lock
├── dune-workspace        # dune 工作区根；vunax/ 是唯一的 dune 项目
├── vunax/                # 外部编译器（OCaml）
│   ├── dune-project
│   ├── vunax.opam
│   ├── lib/              # token / lexer / ast / parser / loader / eval / codegen
│   ├── bin/              # 可执行文件 vunax
│   └── test/             # alcotest + corpus/ 解析、运行、模块语料
├── lib/                  # vuna 模块根：Vuna/Interp.vuna（自解释器）等，模块名由
│                         # 路径决定（lib/Vuna/Parser.vuna ⇔ Vuna.Parser）
├── app/                  # vuna 入口：compile.vuna（vuna 编译器 CLI）、interp.vuna（vuna-interp）
├── test/                 # 自举：vuna 写的测试（.vuna）
├── bootstrap/stage1.ml   # 自举种子（stage 1），提交入库，由 vunax 生成
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
vunax run lib/Vuna/Interp.vuna          # 运行自解释器 demo
vunax run --root lib app/interp.vuna --root lib lib/Vuna/Interp.vuna
vuna-boot --root lib --no-print app/compile.vuna /tmp/stage2.ml  # 手动试种子
dune fmt
```

也可以 `cd vunax && dune build`。devShell 里放的 vunax 用 `doCheck = false`
构建，避免“测试失败 → devShell 建不出来 → 没法调试”的死循环；测试由
`nix build` / `nix flake check` 运行。`vuna-boot` 是从入库种子固定构建的，
不依赖当前源码，适合手动验证种子不变量；stage2 的 `vuna` 不进 devShell，
避免种子失效时连 shell 都进不去。

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

尚未实现（后续里程碑）：类型检查（core-v0 先不检查类型）、typed codegen、
种子入库、`where` / `do` / 隐式参数 / 依赖类型。

## 求值器（core-v0，M2）

[eval.ml](vunax/lib/eval.ml) 在现有 AST 上做严格求值（call-by-value）：

- 顶层定义互递归；函数值按子句顺序做模式匹配，参数不足时返回部分应用；
  `name = expr` 这种零参数定义在引用时自动求值（常量语义）；
- 构造器按 `data` 里的 arity 柯里化；`case` / `let` / lambda 都支持嵌套模式；
- `main` 必须是零参数定义，`vunax run` 求值 `main` 并用 `show` 打印结果；
- 内建：`+ - * /`、`== /= < <= > >=`（Int/String/Int 比较）、`&& ||`、
  `++`（String 拼接）、`strLength`、`strUnpack`（String → List Int）、
  `strPack`（List Int → String）、`strFromInt`（Int → String）、
  `readFile` / `writeFile` / `print` / `getArgs`（见下面 IO 一节）；
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

限制：没有类型检查，运行时错误信息暂时不带源码位置（AST 还没有 span）。

## IO（core-v0）

最小 IO 内建，`vunax run`、自解释器和 codegen 产物行为一致：

| 内建 | 约定类型 | 说明 |
| --- | --- | --- |
| `readFile` | `String -> String` | 读整个文件（binary）；失败抛运行时错误 |
| `writeFile` | `String -> String -> Int` | 写文件（覆盖），返回写入字节数 |
| `print` | `String -> Int` | 写 stdout，不追加换行，返回写入长度 |
| `getArgs` | `List String` | 进程参数；零参数内建，引用即求值 |

- CLI：`vunax run <file.vuna> [args...]`，参数通过 `getArgs` 传给程序；
- 编译产物：`./program args...`，`getArgs` 是编译产物自己的参数；
- 自解释器：`interpret` 目前只接受源码，被解释程序里的 `getArgs` 观察到的是
  宿主进程参数（等 `interpret` 增加 args 参数时修正）；
- IO 错误直接抛运行时错误（如 `readFile: No such file or directory`），
  不会变成自解释器返回的 `error: ...` 字符串；
- 这些内建和普通内建一样是严格求值的柯里化函数值，支持部分应用。

## 自解释器（M3，源码级）

[lib/Vuna/Interp.vuna](lib/Vuna/Interp.vuna)（约 1400 行 vuna，模块 `Vuna.Interp`）是用 vuna
写、被 vunax 解释执行的自解释器：

- 输入是 **vuna 源码**（`interpret`）或 **模块入口文件 + 模块根**（`interpretFile`）；
- 内部完整实现 core-v0 的前端、模块加载与求值：词法分析（token 带行列）→ offside
  layout parser → import/名字解析（flatten）→ call-by-value 求值 → `show`，
  并复刻 vunax 的内建运算与 Bool/List/String 表示转换；
- parser 与 `vunax/lib/parser.ml` 同构：顶层声明、`data` 构造器块、`case` 分支、
  `let` 绑定按列对齐，表达式跨行需要缩进超过块列；
- `main` 约定与 vunax 相同：`vunax run lib/Vuna/Interp.vuna` 解释内置 demo 源码；
- 解析/运行错误统一返回 `error: ...` 字符串（暂时没有源码位置）；import 由
  `interpretFile root entry` 通过 `readFile` 加载。

```console
vunax run lib/Vuna/Interp.vuna
# "42"
```

验证（104 个测试，`nix build` 的 checkPhase 全跑）：

- **差分测试**：`corpus/run/` 的 15 个程序，vunax 直接跑 vs vuna 自解释器读同一份
  源码跑，两边 `show` 结果必须一致；
- **self application**：把 `lib/Vuna/Interp.vuna` 自己的源码交给它自己解释，结果与直接
  运行一致 —— 当前语言子集已经能完整承载自己的词法、语法和求值实现；
- **modules selfhost**：`interpretFile` 加载 `corpus/modules/` 的模块夹具，结果与
  vunax loader 一致。

限制：`where` / `do` / 隐式参数 / 依赖类型仍未实现；错误没有源码位置；
未做性能优化（self application 全程走解释器，秒级）。

## Codegen（core-v0，M4a）

[codegen.ml](vunax/lib/codegen.ml) 把 core-v0 程序翻译成可编译的 OCaml 源码：

```console
vunax compile vunax/test/corpus/run/01_arithmetic.vuna > program.ml
ocamlopt -o program program.ml && ./program
# 7
```

实现方式：

- 生成程序里没有解释循环：vuna 函数编译成柯里化 OCaml 函数，构造器编译成闭包
  构造器（`mk_Cons` 等），模式匹配编译成 OCaml `match`，`case`/`let`/`if` 也都是
  原生控制流；
- 值统一用动态表示 `VInt` / `VStr` / `VCon (name, args)` / `VFun (name, fn)`，
  因为 core-v0 还没有类型系统；typed codegen 等类型检查之后再做；
- 生成程序入口打印 `show_value main`，格式与 `vunax run` 的输出完全一致；
- IO 内建在生成程序里也实现了（`readFile` / `writeFile` / `print` / `getArgs`），
  语义与解释器一致；`getArgs` 返回编译产物自己的命令行参数；
- 编译期检查：`main` 必须存在且零参数、未绑定变量、子句 arity 不一致、
  构造器/函数重名都会报 `codegen error`；
- `vunax compile --no-print`（`Codegen.generate ~print_result:false`）只求值
  `main`、不自动打印结果，适合自己用 `print` / `writeFile` 做 IO 的 CLI 程序。

验证（104 个测试，`nix build` 的 checkPhase 全跑）：

- **codegen 差分**：`corpus/run/` 的 15 个程序逐个生成 OCaml、用 `ocamlopt` 编译、
  运行，stdout 与解释器的 `show` 结果一致；
- **codegen self**：把自解释器 `lib/Vuna/Interp.vuna` 用 codegen 编译成 OCaml 可执行文件，
  运行结果与解释执行一致；
- **codegen error**：3 个非法程序必须在 codegen 阶段报错；
- **IO**：`getArgs` / `writeFile` + `readFile` 往返 / `readFile` 失败 / `print`
  在解释器、codegen 产物和自解释器三条路径上分别验证；
- **modules**：模块夹具经 loader flatten 后，eval 与 codegen 结果一致；
- **M4b**：`app/interp.vuna`（import `Vuna.Interp`）编译出的二进制解释 corpus 全部
  15 个程序和模块夹具，输出与 `vunax run` 一致。

限制：生成代码仍是单文件（loader 先 flatten 成一个 program）、动态值表示，
性能与错误信息暂未优化；分离编译/多单元 codegen 留给后续优化。

## vuna-interp（编译出的解释器二进制，M4b）

[app/interp.vuna](app/interp.vuna) 是 CLI 入口（`import Vuna.Interp`，调用
`Vuna.Interp.interpretFile`），用 `print` 原样输出结果，由 vunax 加载 `lib/` 后编译成
独立二进制：

```console
nix build .#vuna-interp
./result/bin/vuna-interp vunax/test/corpus/run/12_fact.vuna
# 120
./result/bin/vuna-interp --root vunax/test/corpus/modules/02_data/lib \
  vunax/test/corpus/modules/02_data/app/Main.vuna
# 6
```

- 输出语义与 `vunax run <file>` 一致（`show` + 换行）；无参数时打印 usage；
- 产物是原生 OCaml 可执行文件（解释器被编译后的结果），不依赖 vunax 或解释循环；
- `--root DIR` 指定模块根（默认 `lib`），import 在运行期由 vuna 版 loader 通过
  `readFile` 加载。

## 模块系统（M5）

规则：

- **文件 = 模块**，模块根默认 `lib/`（`--root` 可覆盖）；
  `lib/Vuna/Parser.vuna` ⇔ 模块 `Vuna.Parser`；
- 路径段必须首字母大写并匹配 `[A-Z][A-Za-z0-9_]*`，**路径/文件名与模块名精确一致**，
  没有大小写映射；
- 入口文件可以在 `lib/` 外（如 `app/interp.vuna`），它本身不是模块；
- `import` 只能出现在文件顶部，是**直接依赖**（不传递可见），循环导入硬错误；
- 跨模块引用必须**全限定**：`Vuna.Parser.parseSource`、构造器 `Vuna.List.Cons`；
  本模块名字、内建名不加限定；
- v0 所有顶层声明默认导出；`True` / `False` / `Cons` / `Nil` 是内建相邻的**全局构造器**
  （不参与模块前缀），这样 `getArgs`/`strUnpack` 产生的列表和 Bool 才能与用户声明匹配；
- 实现方式是 loader 把 import 图解析、名字解析后 **flatten** 成一个 program：内部名字
  带模块前缀（如 `Vuna.Parser.parse`），eval/codegen/自解释器复用现有实现；`show`
  只显示最后一段，所以输出与单文件程序一致。

```console
vunax run --root lib app/interp.vuna  <args...>
vunax compile --root lib app/interp.vuna
```

测试夹具 `vunax/test/corpus/modules/` 覆盖：跨模块函数/数据/构造器、嵌套 import，
以及缺失模块、循环导入、未限定跨模块引用、未导出名字、非法模块名等错误。

## M6：自举编译器与种子

codegen 也搬进了 vuna：[lib/Vuna/Interp.vuna](lib/Vuna/Interp.vuna) 末尾实现
`generateProgram` / `compileFile`（与 `vunax/lib/codegen.ml` 同构），
[app/compile.vuna](app/compile.vuna) 是编译器 CLI。

- `vunax` 把 vuna 编译器源码编译成 `bootstrap/stage1.ml`（stage 1 种子，提交入库）；
- `vuna-boot` 是从种子构建的二进制；它编译当前 `lib/ + app/compile.vuna` 得到
  stage 2 → `vuna`（当前编译器）；
- stage 2 再编译同一份源码得到 stage 3；`stage2.ml == stage3.ml` 即 fixed point。

```console
nix build .#vuna            # 当前编译器（stage 2）
nix build .#vuna-boot       # 种子二进制（stage 1）
nix build .#vuna-interp     # 解释器（差分测试用）
nix flake check             # 含 checks.bootstrap-selfhost / fixed-point
```

本地命令（devShell 里）：

```console
vunax compile --no-print --root lib app/compile.vuna > bootstrap/stage1.ml
vuna-boot --root lib --no-print app/compile.vuna /tmp/stage2.ml
ocamlopt -w -a -o /tmp/stage2 /tmp/stage2.ml
/tmp/stage2 --root lib --no-print app/compile.vuna /tmp/stage3.ml
cmp /tmp/stage2.ml /tmp/stage3.ml      # fixed point
```

验证：104 个测试（含 vuna codegen 对 corpus 与模块夹具的生成→编译→运行）；
`checks.bootstrap-selfhost` 用种子构建 stage 2、校验 stage2/stage3 字节一致，
并编译运行一个程序（`12_fact` → 120）；`checks.fixed-point` 与它同一派生。

限制：生成代码仍是动态 value 表示、单文件（loader flatten 后一个 program）；
没有类型检查（M7 再设计）；种子更新仍是手动（发版/不兼容变更时）。

## Nix

```console
nix build             # 默认 = vuna（stage 2 当前编译器）
nix build .#vunax     # stage 0 外部编译器
nix build .#vuna-boot # stage 1 种子二进制
nix build .#vuna-interp
nix flake check       # 构建 packages + checks（含 bootstrap-selfhost / fixed-point）
nix fmt               # nixfmt-tree 格式化 .nix
```

## 自举链的当前状态

- `packages.vunax`（stage 0）：OCaml 外部编译器，把 vuna 源码编译成 OCaml；
- `packages.vuna-boot`（stage 1）：`ocamlopt` 构建入库的 `bootstrap/stage1.ml`；
- `packages.vuna`（stage 2）：`vuna-boot` 编译当前 `lib/ + app/compile.vuna` 得到；
- `packages.vuna-interp`：自解释器编译产物，读 `.vuna` 解释执行，用于差分测试；
- `checks.bootstrap-selfhost` / `checks.fixed-point`：种子编译当前源码得到 stage 2，
  stage 2 再编译得到 stage 3，`cmp` 两者并抽查运行结果，守住
  「种子必须能编译当前源码」与 fixed point。

种子更新流程见上面「自举链」一节；`bootstrap/` 下文件仍是生成物，禁止手改。

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
- `nix build` 默认构建 `vuna`（stage 2）；`nix build .#vunax` 构建 stage 0。
- vuna codegen 的 runtime 前导代码由 `vunax/test/gen-runtime-vuna.sh` 从
  `vunax/lib/codegen.ml` 生成并嵌在 `lib/Vuna/Interp.vuna`，两边有测试保证同步。