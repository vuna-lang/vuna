# vuna

vuna 是一个函数式编程语言，本仓库是它的编译器。

编译器完全用 vuna 自己写（`lib/Vuna/` 下的 Ast/Lexer/Parser/Interp/Codegen
模块 + `app/Compile.vuna`），通过提交入库的 OCaml 种子自举。构建、
测试和语言演进都不依赖外部编译器。早期用于启动自举的 OCaml 实现 `vunax` 已在
M6 完成后删除；需要查看历史可从 git log 找到。

## 工具与自举链

| 工具 | 作用 |
| --- | --- |
| `vuna-boot` | stage 1：从 `bootstrap/stage1.ml` 构建的种子二进制 |
| `vuna` | stage 2：`vuna-boot` 编译当前 `lib/` + `app/Compile.vuna` 得到，当前编译器 |
| `vuna-interp` | 自解释器编译产物，解释执行 `.vuna` 文件，用于差分测试 |

```text
bootstrap/stage1.ml（提交入库的 OCaml 种子）──ocamlopt──▶ vuna-boot
  │  vuna-boot 编译当前 lib/ + app/Compile.vuna
  ▼
stage2.ml ──ocamlopt──▶ vuna（当前编译器）
  │  vuna 再编译同一份源码
  ▼
stage3.ml；stage2 == stage3 即 fixed point
```

## 种子策略

种子（`bootstrap/`）**提交入库**，是构建输入而不是构建产物。唯一的硬性不变量：

> **当前入库的种子必须能编译当前的 vuna 源码。**

- 种子**不需要**与源码同步：日常修改 `lib/`、`app/`、`test/` 不重新生成种子；
- 种子只通过 **seed rotation** 更新：用当前 `vuna-boot` 编译当前编译器源码，把生成的
  `stage2.ml` 提交为新种子；
- 种子比源码旧是正常状态，但必须始终保持“能编译当前源码”的能力；
- CI 用 `checks.bootstrap-selfhost` 守这条不变量：用种子编译当前源码，构建出
  stage 2 / stage 3 并校验字节一致；`checks.fixed-point` 与它同一派生；
- 如果新特性会让源码超出旧种子能编译的语法子集，必须先把特性实现成旧语法可编译的
  形式，rotate 种子后再在编译器源码里使用新语法；
- `bootstrap/` 下所有文件都是生成物，禁止手改。

种子轮换流程：

```console
# 前提：当前源码能被当前种子编译（nix flake check 通过）
vuna-boot --root lib --no-print app/Compile.vuna bootstrap/stage1.ml
nix flake check            # 新种子能编译当前源码，且 fixed point 成立
git diff bootstrap/        # 确认变化可解释
git add bootstrap/ && git commit
```

注意：如果改的是**现有语法的语义**（而非新增语法），旧种子会按旧语义编译新编译器，
需要确认没有 bootstrap 语义偏差；必要时先 rotate，再让编译器源码依赖新语义。

## 目录结构

```text
.
├── flake.nix             # Nix：vuna-boot / vuna / vuna-interp、devShell、checks
├── flake.lock
├── lib/                  # vuna 模块根（模块名由路径精确决定）
│   └── Vuna/
│       ├── Base.vuna     # Result/Maybe/List/Pair/Bool、通用 helper、字符串工具
│       ├── Ast.vuna      # 语法类型（Pat/Expr/Decl/Import）与 AST helper
│       ├── Lexer.vuna    # 词法分析（token + 位置）
│       ├── Parser.vuna   # offside layout parser → AST/imports
│       ├── Builtins.vuna # 内建函数名字与元数（Loader/Eval 共用）
│       ├── Eval.vuna     # 值表示、内建函数、求值器与 show
│       ├── Loader.vuna   # import 图、名字解析、flatten（含模块规则）
│       ├── Codegen.vuna  # flatten 后的 AST → OCaml
│       └── Interp.vuna   # 对外 facade（interpret/interpretFile/compileFile）
├── app/
│   ├── Compile.vuna      # 编译器 CLI（vuna）
│   └── Interp.vuna       # 解释器 CLI（vuna-interp）
├── test/
│   ├── run-tests.sh      # vuna 原生测试（只用 vuna / vuna-boot / vuna-interp）
│   └── corpus/           # run / run_err / err / modules 语料与 golden
├── bootstrap/stage1.ml   # 自举种子（stage 1），提交入库，由 vuna-boot 轮换生成
├── .gitattributes        # 把 bootstrap/** 标记为 generated
└── README.md
```

`lib/` 是 vuna 的模块根，不是 OCaml 库目录；仓库里没有任何 dune/OCaml 项目，只
用 `ocamlopt` 编译生成的种子和程序。

## 语言（core-v0）

- 类型：`Int` / `String`、`data` 声明的代数数据类型、函数；类型签名会被解析但擦除；
- 语法：Idris2 风格 `data ... where`、多子句函数、`case ... of`、`let ... in`、
  lambda、`if then else`、整数/字符串字面量、`[..]` 与 `x :: xs` 列表糖、
  中缀运算符（`-> || && == /= < <= > >= ++ + - * / ::`）；
- layout：offside 规则；顶层声明、`data` 构造器块、`case` 分支、`let` 绑定按块列
  对齐，表达式跨行必须缩进超过所在块列；
- `main` 必须是零参数定义；`show` 负责把值变成字符串；
- 内建：`+ - * /`、`== /= < <= > >=`、`&& ||`、`++`、`strLength`、`strUnpack`、
  `strPack`、`strFromInt`，以及 IO 内建 `readFile` / `writeFile` / `print` /
  `getArgs`；
- 布尔值与列表约定：`True` / `False` / `Cons` / `Nil` 是内建相邻的全局构造器；
  程序需要自己声明 `data Bool` / `data List` 才能对它们做模式匹配。

### 模块系统

- **文件 = 模块**，模块根默认 `lib/`（`--root` 可覆盖）；`lib/Vuna/Parser.vuna`
  ⇔ 模块 `Vuna.Parser`；
- 路径段必须匹配 `[A-Z][A-Za-z0-9_]*`，路径/文件名与模块名**精确一致**，没有大小写映射；
- 入口文件可以在 `lib/` 外（如 `app/Compile.vuna`），它本身不是模块；
- `import` 只能在文件顶部，是**直接依赖**；循环导入、重复 import、重复 alias 都是硬错误；
- import 的四种形式：

  ```vuna
  import Vuna.Ast              -- 依赖 + 自动 open：EVar 可直接用
  import qualified Vuna.Ast    -- 只依赖：必须写 Vuna.Ast.EVar
  import Vuna.Parser as P      -- 依赖 + open，并可用 P.parseSource
  import qualified Vuna.Lexer as L  -- 只依赖，并可用 L.PTok
  ```

  alias 只是额外的限定前缀，原全名仍然可用；alias 必须是单个大写段、全文件唯一，
  且不能与另一个被 import 的模块名冲突；
- 非限定名的查找顺序：局部绑定 → 全局构造器 → 本模块顶层定义 → builtin →
  已自动 open 的 import 导出。两个 open import 导出同名时，裸名报歧义，写全名或
  alias 即可消歧；
- 限定名用**完整模块名**或 alias，永远不会歧义；注意 import 只算直接依赖，**不传递**：
  A import B，C import A 看不到 B 的名字；
- v0 所有顶层声明默认导出；`True` / `False` / `Cons` / `Nil` 不参与模块前缀；
- loader 解析 import 图、做名字解析后 **flatten** 成一个 program（内部名字带模块前缀，
  如 `Vuna.Parser.parse`），解释器与 codegen 复用同一份实现；`show` 只显示最后一段，
  所以输出与单文件程序一致。

## 编译器实现

- `lib/Vuna/Base.vuna`：Result/Maybe/List/Pair/Bool、列表/Result 辅助函数与
  `splitOnDot`/`splitLastDot` 等字符串工具；
- `lib/Vuna/Ast.vuna`：语法类型（Pat/Expr/Decl/Import）与 AST helper
  （`funArity`/`ctorArity`/`topNames`/`ctorsOf` 等），依赖 Base；
- `lib/Vuna/Lexer.vuna`：词法分析，token 带行列位置；
- `lib/Vuna/Parser.vuna`：offside layout parser，输出 AST 与 imports；
- `lib/Vuna/Builtins.vuna`：内建函数名字与元数，Loader 与 Eval 共用；
- `lib/Vuna/Eval.vuna`：值表示、内建函数、call-by-value 求值器与 `show`；
- `lib/Vuna/Loader.vuna`：import 图、模块名校验、名字解析与 flatten
  （`loadProgram root entry`）；
- `lib/Vuna/Codegen.vuna`：把 flatten 后的 program 翻译成 OCaml；
- `lib/Vuna/Interp.vuna`：facade，只暴露 `interpret`/`interpretFile`/`compileFile`；
- 模块内部通过 import 自动 open 使用非限定名，只有 import 行写模块全名；
- [app/Compile.vuna](app/Compile.vuna)：`vuna [--no-print] [--root DIR] <entry.vuna> [out.ml]`；
  `--no-print` 表示生成的程序不自动打印 `main` 的结果（用于编译自己做 IO 的 CLI）；
- [app/Interp.vuna](app/Interp.vuna)：`vuna-interp [--root DIR] <file.vuna>`，把
  `interpretFile` 的字符串结果原样打印。

### codegen 的表示

生成代码不使用解释循环：vuna 函数编译成柯里化 OCaml 函数，构造器编译成闭包构造器
（`mk_Cons` 等），模式匹配编译成 OCaml `match`。值统一为动态表示：

```ocaml
type value =
  | VInt of int
  | VStr of string
  | VCon of string * value list
  | VFun of string * (value -> value)
```

- 生成程序入口打印 `show_value main`，格式与解释器一致；
- IO 内建在生成程序里有对应实现，语义与解释器一致；
- 编译期检查：`main` 存在且零参数、未绑定变量、子句 arity 不一致、构造器/函数重名；
- 生成结果是**单个 OCaml 文件**（loader 先 flatten），性能与错误信息暂未优化；
- runtime 前导代码固化在 `Codegen.vuna` 的 `runtimeCode`，是唯一实现。

## 测试

`test/run-tests.sh` 是 vuna 原生测试（96 checks），只用 `vuna` / `vuna-boot` /
`vuna-interp`，不依赖任何外部编译器：

```console
sh test/run-tests.sh          # 需要 PATH 中有三个二进制
```

覆盖：

- `corpus/run/*.vuna`：解释器输出 vs `.out` golden；编译器生成→`ocamlopt`→运行再比对；
- `corpus/modules/0*`：跨模块函数/数据/嵌套 import 的解释器与编译器结果；
- `corpus/modules/9*`：缺失模块、循环导入、未限定引用、未导出名字、非法模块名；
- `corpus/err/*.vuna`、`corpus/run_err/*.vuna`：解析/求值错误片段；
- `vuna-boot` 编译 `12_fact` 的种子冒烟。

Nix 侧：

- `checks.vuna-tests`：在沙箱里跑上述原生测试；
- `checks.bootstrap-selfhost`：种子编译当前源码得到 stage 2，stage 2 再编译得到
  stage 3，`cmp` 两者，并抽查 `12_fact` → `120`；
- `checks.fixed-point`：与 `bootstrap-selfhost` 同一派生。

## 开发

```console
nix develop
nix build .#vuna --out-link result-vuna
nix build .#vuna-boot --out-link result-boot
nix build .#vuna-interp --out-link result-interp
VUNA=$PWD/result-vuna/bin/vuna \
VUNA_BOOT=$PWD/result-boot/bin/vuna-boot \
VUNA_INTERP=$PWD/result-interp/bin/vuna-interp \
sh test/run-tests.sh
```

devShell 提供 `ocaml` / `ocamlopt` 工具链和 `vuna-boot`；stage2 的 `vuna` 不进
devShell，避免种子失效时连 shell 都进不去。

## Nix

```console
nix build             # 默认 = vuna（stage 2 当前编译器）
nix build .#vuna-boot # stage 1 种子二进制
nix build .#vuna-interp
nix flake check       # vuna-tests / bootstrap-selfhost / fixed-point
nix fmt               # nixfmt-tree 格式化 .nix
```

## 限制与路线

- 没有类型检查、typed codegen（M7 再设计）；类型签名只解析、擦除；
- 生成代码是单文件、动态 value 表示，性能与错误信息暂未优化；
- 运行时错误没有源码位置；`where` / `do` / 隐式参数 / 依赖类型未实现；
- IO 失败（如 `readFile` 缺失文件）会抛宿主异常；编译器 CLI 没有 `exit` 内建，
  编译错误时退出码仍可能是 0，只通过 stdout 的 `error: ...` 判断；
- 种子轮换是手动流程（发版/不兼容变更时）；
- `test/run-tests.sh` 目前以 golden 比对为主，后续可以补充更多随机/差分测试。

## 历史

- M1：解析器；M2：解释器；M3a/M3b：AST 与源码级自解释器；
- M4a：codegen（vuna → OCaml）；M4b：自解释器编译成独立二进制；
- M5：模块系统（文件=模块、import、flatten）；
- M6：用 vuna 写 codegen，种子入库，stage2/stage3 fixed point；
- M6 之后：种子轮换为 vuna 生成，P2 把测试迁移到 vuna 原生 harness；
- 早期 OCaml 外部编译器 `vunax` 已完成使命并删除。