# vuna

vuna 是一个函数式编程语言，本仓库是它的编译器与工具链。

编译器完全用 vuna 自己写：编译器包 `compiler/`（`vuna-compiler`，模块
`Vuna.Compiler.*`，含 Ast/Lexer/Parser/Loader/Typecheck/TypedCodegen/Core/Elab 与
编译器驱动）+ 根包 `vuna`（产品 CLI 与工具链 fmt/lint/repl/doc/test），标准库在独立的
成员包 `base/`（`vuna-base`，模块 `Base.*`，模块根 `base/lib/`）。`seed/` 只由
compiler 包的入口闭包生成——**可固化成种子的部分与产品工具链明确分开**。仓库通过提交入库的 OCaml 种子自举，构建、测试和语言演进都不
依赖外部编译器。早期用于启动自举的 OCaml 实现 `vunax` 已在 M6 完成后删除；需要
查看历史可从 git log 找到。

## 工具与自举链

| 工具 | 作用 |
| --- | --- |
| `vuna-seed` | stage 0：从多文件种子 `seed/`（`seed/build.sh` + ocamlopt）构建的种子编译器 |
| `vuna-compiler` | stage 1 编译器（从 `compiler/` 包级 codegen + ocamlopt）：`compile/check/build[--split]/seed` + `compile --package` |
| `vuna` | 产品 CLI：工具链 + 编译器命令（in-process 调用 compiler 库） |

`vuna-compiler` 是编译器自己的 CLI（也是 seed 的来源）：

```console
vuna-compiler compile [--dt] [--no-print] [--root DIR]... <entry.vuna> [out.ml]
vuna-compiler compile --package [--out OUT] [DIR]  # 包级 codegen：OUT/lib/ + OUT/app/Main.ml（默认 OUT=DIR/.output）
vuna-compiler check [--dt] [--root DIR]... (<entry.vuna> | <package-dir>)
vuna-compiler build [--no-compile] [DIR]  # 包模式：compile --package 后调 ocamlopt，产出 DIR/.output/bin/<包名>
vuna-compiler build --split OUT [DIR]  # 分离编译：逐模块 .ml/.mli + build.sh 写到 OUT
vuna-compiler seed [OUT [DIR]]         # 生成多文件 seed（默认 OUT=seed，DIR=.）
vuna-compiler help, -h
```

`vuna` 是产品 CLI：编译器命令与工具链命令都在这里，编译命令直接调用
`Vuna.Compiler.CompilerCli` 的库实现（in-process 调库，不 fork `vuna-compiler`）；
`vuna build` 通过受限的进程执行内建调用 `.output/build.sh`（ocamlopt），除此之外
无额外运行时依赖：

```console
# 文件模式（M9 起的原有能力）
vuna compile [--dt] [--no-print] [--root DIR]... <entry.vuna> [out.ml]
vuna check [--dt] [--root DIR]... (<entry.vuna> | <package-dir>)
vuna lint [--fix] <file.vuna>...
vuna interp [--dt] [--root DIR]... <file.vuna>
# 包模式（M11.5：从 vuna.toml / workspace / 依赖 DAG 解析模块根）
vuna compile --package [--out OUT] [DIR]  # M12.8 包级 codegen（默认 OUT=DIR/.output；库包只有 lib/）
vuna build [--no-compile] [DIR]  # 包模式：compile --package 后调 ocamlopt，产出 DIR/.output/bin/<包名>
vuna build --split OUT [DIR]   # M12 分离编译：逐模块 .ml/.mli + build.sh 写到 OUT（扁平 codegen）
vuna seed [OUT [DIR]]          # 生成扁平多文件 seed 文件集（默认 OUT=seed）
vuna test [DIR]                # 解释执行 test/*.vuna（main : String，空串通过）
vuna fmt [--check] [PATH]...   # 格式化；省略 PATH = 当前包 lib/app/test
vuna repl [--root DIR]...      # 交互式 REPL
vuna doc [DIR [OUT]]           # 从 lib/ 生成 API 文档（默认 DIR/docs/api.md）
vuna help, -h
```

每个命令都必须显式书写，不再支持“无子命令 = compile”的旧式回退。`vuna interp`
取代了原来的独立 `vuna-interp` 二进制，并保留“不检查执行”的调试语义（普通程序
直接求值；record / trait / deriving 程序会先类型检查并降级）。包模式下 loader 的
模块根由 `vuna.toml` 的 workspace / 依赖图解析（本包 `lib/` + 依赖包 `lib/`）；
省略 `--root` 时使用当前目录包的模块根（当前目录不是包则为空），`--root` 仍用于
原始文件模式（例如编译器自举、测试夹具）显式指定模块根。包模式还会**自动导入
顶层模块 `Prelude`**（见下文标准库一节）；原始 `--root` 模式不自动导入。

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

种子轮换流程：

```console
# 前提：当前源码能被当前种子编译（nix flake check 通过）
nix build .#vuna --out-link result
sh nix/seed-rotate.sh ./result/bin/vuna   # vuna seed seed compiler + 自生成 fixed point
nix flake check                           # seed-selfhost 等全部通过
git diff seed/                            # 确认变化可解释（文件集 + 路径/代码变化）
git add seed/ && git commit
```

注意：种子必须从仓库根、以 `compiler` 为包目录生成（脚本已固定这一点），这样产物里
嵌入的源码路径保持一致。如果改的是**现有语法的语义**（而非新增语法），旧种子会按旧
语义编译新编译器，需要确认没有 seed 语义偏差；必要时先 rotate，再让编译器源码依赖新语义。

## 目录结构

```text
.
├── .local                # 本地文件，被git忽略，临时文件可以放到 .local/tmp 下面
├── flake.nix             # Nix：vuna-seed / vuna-compiler / vuna、devShell、checks
├── flake.lock
├── vuna.toml             # workspace 根（同时是产品 CLI 包 vuna）；members: compiler/base
├── compiler/             # 编译器包 vuna-compiler（seed 的唯一来源）
│   ├── vuna.toml         # [package] + [export] 编译器模块 + deps vuna-base
│   ├── app/
│   │   └── Main.vuna     # 编译器 CLI 入口：main : IO Int（运行时执行）
│   └── lib/Vuna/Compiler/
│       ├── Common.vuna   # 编译器门面：重导出 Base.* 核心 + Pos/Span/路径/诊断工具
│       ├── Ast.vuna      # 语法类型与 AST helper
│       ├── Lexer.vuna    # 词法分析（token + 位置）
│       ├── Parser.vuna   # offside layout parser → AST/imports
│       ├── Builtins.vuna # 内建函数名字与元数
│       ├── Toml.vuna / Manifest.vuna / Pkg.vuna  # 包格式、workspace / 依赖 DAG
│       ├── Loader.vuna   # import 图、模块根、名字解析与 flatten（含 Prelude 自动导入）
│       ├── Typecheck.vuna # HM 类型检查（记录/trait/高阶 kind/字典穿参）
│       ├── TypedCodegen.vuna # 原生 OCaml typed codegen（单文件 + 分离编译）
│       ├── Core.vuna / Elab.vuna / CoreCodegen.vuna / Dt.vuna # DT 核心类型论、精化器、擦除 codegen、facade
│       ├── Split.vuna / SplitCli.vuna # 分离编译输出模型 / build --split / seed / compile --package
│       ├── Process.vuna  # 工具链进程执行入口（受包级 allowlist 限制）
│       ├── Compile.vuna  # 编译入口（effectiveRoots / typed compile / checkFile）
│       └── CompilerCli.vuna # 编译器 CLI（compile/check/build/seed）
├── lib/                  # 产品 CLI 包 vuna 的模块根（工具链）
│   └── Vuna/
│       ├── Cli.vuna      # 产品 CLI：工具命令 + in-process 调 compiler 命令
│       ├── Interp.vuna   # 解释器 facade（依赖 Eval）
│       ├── Eval.vuna     # 值表示、内建函数、求值器与 show
│       ├── Files.vuna    # 目录遍历小工具（fmt/doc/test 共用）
│       ├── Fmt.vuna      # 源码格式化器（vuna fmt）
│       ├── Lint.vuna     # 风格检查与自动修复（vuna lint）
│       ├── Repl.vuna     # 交互式 REPL（vuna repl）
│       ├── Doc.vuna      # API 文档生成（vuna doc）
│       ├── Process.vuna  # 工具链进程执行入口
│       └── TestRunner.vuna # 包内测试运行器（vuna test）
├── app/
│   └── Main.vuna         # 产品 CLI 入口：main : IO Int（运行时执行）
├── base/                 # 成员包 vuna-base（标准库，独立模块根 base/lib/）
│   ├── vuna.toml         # [package] + [export] 导出模块清单
│   └── lib/
│       ├── Base.vuna     # 包门面：整模块重导出核心模块
│       ├── Prelude.vuna  # 默认自动导入的精选门面（不含 Base.IO 效果函数）
│       └── Base/         # Pair/Bool/List/Maybe/Result/String/Sort/Map/Monad/IO
├── examples/multi/       # M11.5 多包示例（workspace 根包 + 成员包 greet + base 依赖）
├── test/
│   ├── run-tests.sh      # vuna 原生测试（只用 vuna / vuna-seed）
│   └── corpus/           # run/err/modules/records/traits/monad/stdlib（夹具名沿用）/packages/fmt/...
├── seed/                 # compiler 闭包的多文件自举信任锚点，提交入库、由 vuna seed 生成
├── .gitattributes        # 把 seed/** 标记为 generated
└── README.md
```

仓库本身是一个 workspace（Cargo 风格：根目录同时是包）：根包 `vuna` 是产品 CLI
（模块根 `lib/`，入口 `app/Main.vuna`），依赖成员包 `vuna-compiler`（模块根
`compiler/lib/`，入口 `compiler/app/Main.vuna`）与 `vuna-base`（模块根
`base/lib/`）；`vuna-compiler` 依赖 `vuna-base`。`compiler/lib/`、`lib/`、
`base/lib/` 都是 vuna 模块根，不是 OCaml 库目录；`app/` 是纯入口目录。仓库里没有
任何 dune/OCaml 项目，只用 `ocamlopt` 编译生成的种子和程序。

## 语言（core-v0）

- 类型：`Int` / `String`、`data` 声明的代数数据类型、函数；类型签名会被解析但擦除；
- 语法：Idris2 风格 `data ... where`、多子句函数、`case ... of`、`let ... in`、
  lambda、`if then else`、`do` 块（M11）、整数/字符串字面量、`[..]` 与
  `x :: xs` 列表糖、中缀运算符
  （`-> || && == /= < <= > >= ++ + - * / :: >>= >>`）；
- layout：offside 规则；顶层声明、`data` 构造器块、`case` 分支、`let` 绑定按块列
  对齐，表达式跨行必须缩进超过所在块列；
- `main` 必须是零参数定义；`show` 负责把值变成字符串；
- 内建：`+ - * /`、`== /= < <= > >=`、`&& ||`、`++`、`strLength`、`strUnpack`、
  `strPack`、`strFromInt`，IO 内建 `readFile` / `writeFile` / `print` / `getArgs`，
  文件/目录 `fileExists` / `readDir` / `isDirectory` / `makeDir` / `removeFile`，
  REPL 用 `readLine`，以及 `exit`；
- `&&` / `||` 短路求值：先求左操作数，左侧能决定结果时不求值右侧（解释器与
  两种 codegen 一致）；
- 布尔值与列表约定：`True` / `False` / `Cons` / `Nil` 是内建相邻的全局构造器；
  程序需要自己声明 `data Bool` / `data List` 才能对它们做模式匹配。

### 模块系统

- **文件 = 模块**，模块根默认 `lib/`；`--root` 可重复，按出现顺序组成模块根列表
  （如 `--root lib --root app`），`compiler/lib/Vuna/Compiler/Parser.vuna` ⇔ 模块
  `Vuna.Compiler.Parser`；
- 模块按根顺序查找；同名模块出现在多个根时是硬错误（不静默覆盖）；
- 路径段必须匹配 `[A-Z][A-Za-z0-9_]*`，路径/文件名与模块名**精确一致**，没有大小写映射；
- 入口文件可以在模块根外（如 `app/Main.vuna`），它本身不是模块，不能写模块头；
- 包模式下模块根由 `vuna.toml` 解析：本包 `lib/` + 依赖包 `lib/`（按依赖 DAG 排序，
  跨包只看得见依赖包 `[export]` 里的模块）；`app/` 是纯入口目录，不再作为模块根；
  包模式下每个模块（入口文件除外）**自动导入 `Prelude`**（依赖包 `base` 的顶层模块），
  显式 `import Prelude` 时不再重复注入，Prelude 自身不注入；
- 原始文件模式下 `--root` 可重复（如标准库夹具用 `--root ../base/lib`），且**不自动
  导入 Prelude**（只按显式 import 解析）；
- `import` 只能在文件顶部，是**直接依赖**；循环导入、重复 import、重复 alias 都是硬错误；
- import 的四种形式：

  ```vuna
  import Vuna.Compiler.Ast              -- 依赖 + 自动 open：EVar 可直接用
  import qualified Vuna.Compiler.Ast    -- 只依赖：必须写 Vuna.Compiler.Ast.EVar
  import Vuna.Compiler.Parser as P      -- 依赖 + open，并可用 P.parseSource
  import qualified Vuna.Compiler.Lexer as L  -- 只依赖，并可用 L.PTok
  ```

  alias 只是额外的限定前缀，原全名仍然可用；alias 必须是单个大写段、全文件唯一，
  且不能与另一个被 import 的模块名冲突；
- **模块头**：模块文件可以在 `import` 之前写一个模块头声明导出项（导出列表可以跨行；
  入口文件不能写）：

  ```vuna
  module Vuna.Math where           -- 省略导出列表 = 导出全部（v0 兼容）
  module Vuna.Math () where        -- 显式导出空集
  module Vuna.Math (three, Nat(..), module Vuna.Compiler.Common, Vuna.Compiler.Lexer.lexSource) where
  ```

  模块名必须与路径推导出的模块名一致（`lib/Vuna/Math.vuna` ⇔ `Vuna.Math`），不一致是
  硬错误。导出项按「类型名/值名」两套命名空间解析（`module B` 是整模块重导出，不属于
  单个名字）：

  - `name`：裸名，类型/值两套命名空间都解析，同名都导出（构造器名按值命名空间解析）；
    单独导出类型名时只导出类型本身（构造器不可见，即抽象类型）；
  - `Name(..)`：导出类型及全部非私有构造器（重导出已导入的类型时只公开源模块本来就
    公开的构造器，保持源的抽象性）；
  - `module B`：整模块重导出，B 必须是直接 import 的模块，保留 B 的抽象性；
  - `B.name`：从 B 选择性重导出，B 必须是直接 import 的模块；

  这里的 B 可以用模块全名或 import alias 引用。暂不支持重命名重导出
  （`foo = B.foo`）和构造器子集（`T(C1,C2)`）；同一 (kind, 名字) 重复导出（包括
  `module B` 已覆盖的名字再单独写 `B.x`）是 `duplicate export` 硬错误；导出当前作用域
  不可见的名字也是硬错误；
- **`_` 前缀私有**：任何顶层名字（值/类型/构造器）以 `_` 开头即模块私有，不能导出；
  显式导出 `_` 名是硬错误（不是静默剔除），裸 `_` 也不能作顶层名；`(..)` 同样不会让
  `_` 构造器变公开；
- **抽象类型**：导出项 `T` 只导出类型、不导出构造器，跨模块既不能构造也不能模式匹配；
  要公开构造器必须写 `T(..)`；
- **模块路径不变式**：模块路径的最后一段是文件名、中间段是目录，目录本身不是模块。
  因此 `lib/Vuna.vuna`（模块 `Vuna`）与 `lib/Vuna/Compiler/Parser.vuna`（模块
  `Vuna.Compiler.Parser`）能在同一个根下共存、没有歧义，包门面可以直接命名为
  `Base` 或 `Vuna`；
- 模块导出只算聚合层；包级隐藏（哪些模块对外公开）留给 M11.5 的根 manifest；
- 非限定名的查找顺序：局部绑定 → 全局构造器 → 本模块顶层定义 → builtin →
  已自动 open 的 import 导出。两个 open import 导出同名但指向不同定义时，裸名报歧义
  （指向同一定义的重复导出不算歧义，例如原模块与它的门面重导出）；写全名或 alias
  即可消歧；import 只提供目标模块**导出列表**中的名字（省略模块头 = 全部导出，
  `_` 前缀除外）；
- 限定名用**完整模块名**或 alias，永远不会歧义，但同样只解析目标模块的导出项；
  注意 import 只算直接依赖，**不传递**：
  A import B，C import A 看不到 B 的名字——除非 A 用 `module B` / `B.name` 显式重导出，
  这是受控例外，只有显式写出的名字经 A 重新可见；
- loader 解析 import 图、做名字解析后 **flatten** 成一个 program（内部名字带模块前缀，
  如 `Vuna.Compiler.Parser.parse`），解释器与 codegen 复用同一份实现；`show` 只显示
  最后一段，所以输出与单文件程序一致。

### 记录类型（M10.5）

- 声明：`record Point where` 后跟缩进的字段列表，字段写作 `x : Int`；记录可以参数化
  （`record Pair a b where`），记录类型名同时是它的构造器名；
- 构造、访问、更新与模式：

  ```vuna
  record Point where
    x : Int
    y : Int

  p : Point
  p = Point { y = 2, x = 1 }         -- 字段顺序任意，但必须给全

  q : Point
  q = { p | x = 3 }                  -- 字段更新，可一次更新多个字段

  sum : Point -> Int
  sum p = case p of
    Point { x = a, y = b } => a + b  -- 可省略字段（省略 = 通配）

  onlyX : Point -> Int
  onlyX p = case p of
    Point { x } => x                 -- pun：等价于 Point { x = x }
  ```

  字段访问写作 `p.x`，支持链式（如 `s.start.x`）；
- 实现上记录在类型检查阶段降级为单构造器 `data`：构造 = 构造器应用，字段访问/更新 =
  内联 `case`，所以解释器与 typed codegen 行为一致；
- 字段访问/更新的 base 类型必须可推断；推断不出时报
  `cannot resolve record type ... add a type signature`，给函数参数补类型签名即可；
- 导出遵循模块规则：`T` 只导出记录类型（构造器隐藏，跨模块不能构造/模式匹配，即抽象），
  `T(..)` 才公开记录构造器；
- 错误：缺字段（`missing field`）、重复字段（`duplicate field`）、未知字段
  （`unknown field`）、对非记录做字段访问/更新（`not a record type`）；
- 记录支持 `deriving (Show, Eq)`（`Show` 要求非参数化记录且字段可 show，`Eq` 支持
  参数化记录）；记录字段访问/更新在 base 类型未定时报错。

### trait 与实例（M10.5）

- 语法：

  ```vuna
  trait Pretty a where
    pretty : a -> String

  data Color : Type where
    Red : Color
    Blue : Color
  deriving (Show, Eq)

  instance Pretty Color where          -- 未命名实例 = default（相干默认）
    pretty c = case c of
      Red => "red"
      Blue => "blue"

  instance Pretty Color as fancy where -- 命名实例
    pretty c = "fancy"

  main : String
  main = pretty Red ++ "/" ++ pretty @fancy Blue ++ "/" ++ show Red
  ```

- 上面的 `main : String` 是 `vuna interp` / `vuna test` 的调试约定；可执行包
  （`vuna build` / `--split`）要求 `main : IO a`（M12.6）。
- trait 只支持单参数；default 实例按 (trait, 类型) 全局唯一（flatten 时检查，
  重复报 `duplicate instance`）；命名实例不自动参与解析，只能用 `@name` 选择
  （可 `@M.name`，M 需已导入）；trait 与类型都不在本模块定义时禁止写 default，
  必须命名（孤儿规则）；
- `deriving (Show, Eq)` 生成 default 实例：`Show` 只支持非参数化类型且字段可 show，
  `Eq` 支持参数化类型；derive 与手写同名 default 冲突报 `duplicate instance`；
- 内置 trait：`Show`（`show`）、`Eq`（`eq` / `neq` 对应 `==` / `/=`）、`Ord`
  （`lt` / `le` / `gt` / `ge` 对应 `<` / `<=` / `>` / `>=`）；运算符在类型确定时
  静态派发到实例方法。内建/结构回退：`Eq` 覆盖 data/record/`List`；`Show` 覆盖
  `Int` / `String` / `Bool` 与非参数化 data/record；`Ord` 的运行时内建回退只覆盖
  `Int` / `String` / `Bool`（`Int` 用原生比较，`String` / `Bool` 走运行时结构比较，
  typed 路径用 OCaml 结构比较），其它类型报 `no instance Ord ...`；
- 实现（M10.5c）与限制：具体类型的调用点仍走**静态派发**；当方法调用点类型是
  **裸类型变量**时（如 `showIt x = show x`）做**方法级字典穿参**——类型检查给该函数
  增加方法函数参数（字典按 trait 方法扁平化），调用点静态传入具体实例方法或调用者的
  字典参数，支持跨函数传播、前向引用与递归；例如 `data Dummy deriving (Eq)` 加
  `showIt x = show x` 是合法程序（调用 `showIt 42` / `showIt "s"` 时分别传入对应
  `show` 实现）。`Eq` / `Ord` 在类型无法确定时（含 `List a` 等结构化泛型）仍回退到
  运行时结构比较（typed 用 OCaml 结构比较，interp 用 value 结构比较）；
  `Show` / 用户 trait 的结构化泛型（如 `show (List a)`）仍不支持（只有裸类型变量
  支持字典穿参）并报错；**高阶 kind**（`Ty.TApp` + kind 元数）与**一般约束泛化**
  （trait 参数本身是类型构造器变量，如 `Monad m` 的字典穿参）已在 M11 实现；
  default 实例的可见性目前按整个程序（flatten）计算，未做 import 图级细化；
- 求值与降级触发：只有程序里出现 trait / instance / deriving 声明（或记录等需要降级
  的语法）时，`vuna interp` 才会先类型检查 + 降级；普通程序保持 legacy 直接求值
  （不检查，作为 `--no-typecheck` 删除后的调试入口）。typed 路径始终按 M10.5 规则
  检查（裸类型变量 `show` 可经字典穿参，结构化泛型 `show` 仍报错）；上面的
  `Eq` / `Ord` 结构回退同样只在触发降级后生效；
- 命名空间与导出：trait 名在类型命名空间、方法名在值命名空间；无模块头 = 全部导出
  （含方法），显式导出列表需 `Trait(..)` 才导出方法；命名实例名按普通值名导出/限定
  （显式列表里可写 `fancy`，app 侧用 `@M.fancy` 选择）；
- 迁移：`==` / `/=` / `<` / `<=` / `>` / `>=` 由 `Eq` / `Ord` trait 承担（删除旧的
  `specializeCmp` 特化）；Show 由 typed codegen 按程序 data 声明生成。

### do、Monad 与 Functor（M11）

- 语法：`do` 块，语句是 `pat <- expr`（pat 只支持变量或 `_`）或裸表达式，
  最后一条必须是裸表达式；`a >>= f` 等价 `bind a f`，`a >> b` 等价
  `bind a (\_ -> b)`（顺序执行）。
- `do` 在 **loader** 里 desugar 成 `bind` / lambda（parser 保留 `EDo`，formatter
  因此能还原 do 语法）：

  ```vuna
  import Base.Monad
  import Base.Maybe

  safeDiv : Int -> Int -> Maybe Int
  safeDiv a b = if b == 0 then Nothing else Just (a / b)

  main : Maybe Int
  main = do
    x <- safeDiv 10 2
    y <- safeDiv x 0
    pure (x + y)
  ```

- `Functor`（`fmap`）与 `Monad`（`bind` / `pure`）在 `base/lib/Base/Monad.vuna`；
  `Maybe` / `List` / `IO` 各有 default 实例。`Monad m` 的 m 是 kind `* -> *`：
  trait 声明的类型参数可以当类型构造器应用（`m a`），实例 head 是类型构造器本身
  （`instance Monad Maybe`），kind 不符（如 `instance Monad Int`）在声明期报错。
- 一般约束泛化：签名里出现高阶类型变量（如 `bindPair : m a -> m b -> m (Pair a b)`）
  时，类型检查自动给函数加方法级字典参数；调用点按实际类型静态派发或继续穿参。
- `do` 对 `Maybe` / `List` / `IO` 都生效。`IO` 是 `base/lib/Base/IO.vuna` 的抽象类型
  （构造器私有）；组合统一用 `Functor` / `Monad` trait 的 `fmap` / `bind` / `pure`、
  `>>=` 与 `do`，不再导出 `bindIO` / `pureIO` / `fmapIO`。效果 API 直接返回 IO：
  `print` / `println` / `readFile` / `writeFile` / `readLine` / `readDir` /
  `isDirectory` / `makeDir` / `removeFile` / `fileExists` / `getArgs` / `exit`
  （例如 `getArgs : IO (List String)`、`print : String -> IO Int`）；
  内部实现用不导出的 `prim_*` 原语。
  **没有公开的 `runIO`/`unsafeRunIO`**：IO 动作只能由运行时在 `main` 处执行。
  可执行包/`vuna build` 要求 `main : IO a`；`vuna interp`/`vuna test` 仍保留
  “显示纯 main 结果”的调试约定，但入口代码里同样不能直接调用 effectful 内建。

### 标准库（M11 / M12.8）

标准库是独立成员包 `vuna-base`（模块 `Base.*`，模块根 `base/lib/`），编译器是它的
第一个用户：`compiler/lib/Vuna/Compiler/Common.vuna` 只是门面（整模块重导出
`Base.Pair` / `Base.Bool` / `Base.List` / `Base.Maybe` / `Base.Result` / `Base.String`
+ 保留编译器的 `Pos`/`Span`、模块路径与诊断工具），编译器不再私自重复定义
`Maybe`/`List` 等类型。包名 `vuna-base` 与模块命名空间 `Base.*` 是两回事（包名 ≠ 模块名）。

| 模块 | 内容 |
| --- | --- |
| `Base.Pair` / `Base.Bool` / `Base.List` / `Base.Maybe` / `Base.Result` | 核心代数数据类型与常用 helper（append/reverse/map/filter/foldl/foldr/traverse/andThen/step/...） |
| `Base.String` | split/join/lines/unlines/trim/contains/startsWith/endsWith/repeat/substring |
| `Base.Sort` | 稳定归并排序 `mergeSort` / `sortBy` |
| `Base.Map` | 关联表实现的抽象 Map（empty/insert/lookup/remove/keys/values/size/...） |
| `Base.Monad` | `Functor` / `Monad` trait |
| `Base.IO` | 抽象 `IO a` 与 IO 组合子（实例 + print/readFile/writeFile/getArgs/exit） |
| `Base` | 包门面：整模块重导出以上模块（`import Base` 即可用） |
| `Prelude` | 顶层模块（`base/lib/Prelude.vuna`）：重导出 `Base.Pair` / `Bool` / `List` / `Maybe` / `Result` / `String` / `Monad`，**包模式自动导入**；刻意不含 `Base.IO` 的效果函数（`print`/`readFile` 等与编译器直接使用的内建同名），需要 IO 时显式 `import Base.IO`；`--root` 原始模式不自动导入 |

跨包使用时只可见 `base/vuna.toml` `[export]` 列出的模块；抽象类型（`Map`、`IO`）
的构造器保持私有。`Map` / `Sort` 不在 `Prelude` 里，需要显式 import。

### 包管理与工具链（M11.5 / M12.5）

- 包元信息用 `vuna.toml`（TOML 子集）：`[package]`（name/version/edition）、
  `[workspace]`（members）、`[export]`（modules）、`[dependencies]`
  （依赖名 = 相对路径，暂不做 registry）。
- **workspace 根即一个包**（Cargo 风格）：根 `vuna.toml` 同时含 `[workspace]` 与
  `[package]`；成员是子目录，各自有自己的 `vuna.toml`。本仓库 = 根包 `vuna`（产品
  CLI）+ 成员包 `vuna-compiler`（编译器）+ 成员包 `vuna-base`（标准库）；依赖图
  `vuna → vuna-compiler → vuna-base`，根包也直接依赖 `vuna-base`。
- 每包固定三目录：`lib/`（模块根）、`app/`（入口，恒为 `app/Main.vuna`）、
  `test/`（测试模块）。依赖只向下流：`app`/`test` 可用本包 `lib` + 依赖包 `lib`；
  依赖包之间是 DAG（循环依赖报错）。
- **包名 ≠ 模块命名空间**：模块名仍由路径决定（`base/lib/Base/List.vuna` ⇔
  `Base.List`）；loader 按「本包 lib + 依赖包 lib（DFS 后序、按包名去重）」解析
  import，跨包只认依赖包 `[export]` 列表，隐藏模块报
  `is not exported by package ...`。包模式自动注入 `Prelude` import（见标准库一节）。
- 编译器 CLI（`compiler/lib/Vuna/Compiler/CompilerCli.vuna`）：`vuna-compiler` 提供
  `compile/check/build[--split]/seed` 与 `compile --package`，入口
  `compiler/app/Main.vuna`；**seed 只由这个入口的闭包生成**。产品 CLI
  （`lib/Vuna/Cli.vuna`）通过 in-process 调库实现同样的命令，并追加工具命令：
  - `vuna compile --package [--out OUT] [DIR]`：包级 codegen 到 `OUT`（默认
    `DIR/.output`），可执行包生成 `OUT/lib/` + `OUT/app/Main.ml`，库包只有 `OUT/lib/`；
  - `vuna build [--no-compile] [DIR]`：先做包级 codegen，再调用 `DIR/.output/build.sh`
    用 ocamlopt 构建，产出 `DIR/.output/bin/<包名>`（`--no-compile` 跳过 codegen，
    复用已有 `.output`）；
  - `vuna build --split OUT [DIR]`：旧的扁平分离编译 codegen（逐模块 `.ml/.mli` +
    `build.sh` 写到 OUT），遇到不支持构造不回退；
  - `vuna test [DIR]`：解释执行 `test/*.vuna`，`main : String` 空串通过，非空为失败信息；
  - `vuna fmt [--check] [PATH]...`：`Vuna.Fmt` 格式化（2 空格缩进、幂等、可重新
    parse；M11.6 起**保留行注释/块注释**，超过 100 列时在 RHS、列表字面量、
    函数应用参数与中缀链处折行）；省略 PATH 时格式化 workspace 内所有包的
    `lib/app/test`（拆包后自动覆盖 `compiler/lib`）；
  - `vuna repl [--root DIR]...`：行式 REPL，定义累积、表达式立即走完整
    loader/类型检查/解释器路径（支持 import/记录/trait/do）；
  - `vuna doc [DIR] [OUT]`：扫描 `lib/` 生成 Markdown API 文档。
- 示例：`examples/multi/` 是多包 workspace（根包 + 成员包 `greet` + `base` 路径依赖），
  `checks.vuna-package` 在 Nix 沙箱里构建并运行它，验证包管理路径可复现。
- 可执行入口：`vuna build` / `vuna seed` 要求入口 `main : IO a`（运行时执行动作，
  退出码用 `exit`）；`vuna build --split` 同样按可执行入口处理。普通用户包不能
  直接调用 effectful 内建（`print` / `readFile` / ...），只能经 `Base.IO`；编译器、
  产品 CLI、`vuna-base` 自身在包级 allowlist 内，`--root` 原始文件模式与 `vuna interp`
  保留给调试/测试。

### DT 子集（M14，实验性）

`--dt` 打开与 HM 并存的依赖类型（DT）路径：Core TT + NbE + 双向精化器 +
擦除型 codegen。M14 在 M13（依赖函数 + 一阶元变量）之上加入**索引归纳族**与
**依赖模式匹配**（`data` + `case`），并因此解除了递归定义限制。DT 仍是
**单文件、自包含、显式 opt-in**：不经过模块 Loader，不支持 `import` / 包模式，
也不进入 `build` / `build --split` / `seed`；HM 路径（interp + typed + split）
语义与产物不变。设计与边界见 [docs/dt-core.md](docs/dt-core.md)。

```vuna
id : (a : Type) -> a -> a
id a x = x

-- 索引归纳族：Nat / Vec / Fin / Eq 都是用户声明的，没有内置 Nat
data Nat : Type where
  Zero : Nat
  Succ : Nat -> Nat

-- 族头只写 kind，箭头个数 = 族的参数/索引个数；构造子用完整 telescope 重绑它们,
-- 前 arity 个 binder 对应族的参数/索引，其余是字段。
-- 注意：M14 的索引 binder 一律写成**显式**（`(n : Nat)`）——隐式索引推断属于 M15。
data Vec : Type -> Nat -> Type where
  Nil  : (a : Type) -> Vec a Zero
  Cons : (a : Type) -> (n : Nat) -> a -> Vec a n -> Vec a (Succ n)

-- 递归定义在 M14 已解禁（靠 delta 展开 fuel 终止）
plus : Nat -> Nat -> Nat
plus a b = case a of
  Zero   => b
  Succ k => Succ (plus k b)

-- 构造子应用要写全族参数/索引（显式 binder 不会被省略）。
-- 「类型参数」域是宇宙（如 `a : Type`）⇒ 擦除；
-- 「索引」域是归纳族（如 `n : Nat`）⇒ 保留运行时表示，所以 Vec 的值带长度字段。
three : Vec Int (Succ (Succ (Succ Zero)))
three = Cons Int (Succ (Succ Zero)) 1 (Cons Int (Succ Zero) 2 (Cons Int Zero 3 (Nil Int)))

vlength : (a : Type) -> (n : Nat) -> Vec a n -> Nat
vlength a n xs = case xs of
  Nil b              => Zero
  Cons b m y ys      => Succ (vlength b m ys)
```

依赖模式匹配：`case` 对索引做 unification，只有可达分支才要求写出。

```vuna
-- vhead 只写 Cons：Nil 的结果索引 Vec a Zero 与 scrutinee 的 Vec a (Succ n)
-- 不可统一，因此该分支不可能，覆盖率检查合法地跳过它。
vhead : (a : Type) -> (n : Nat) -> Vec a (Succ n) -> a
vhead a n xs = case xs of
  Cons b m x rest => x
```

```vuna
-- Fin：上界索引让 FZero 只存在于 Succ n
data Fin : Nat -> Type where
  FZero : (n : Nat) -> Fin (Succ n)
  FSucc : (n : Nat) -> Fin n -> Fin (Succ n)

-- Vec a (Succ m) 与 Fin (Succ m) 同时排掉 Nil 与 FZero 两个不可能分支。
findex : (a : Type) -> (m : Nat) -> Vec a (Succ m) -> Fin (Succ m) -> a
findex a m xs i = case xs of
  Cons b k x rest => case i of
    FZero j   => x
    FSucc j h => x
```

```vuna
-- Eq：Refl 把两个索引统一成一个，sym/trans 不需要额外的证明构造
data Eq : Type -> Type -> Type where
  Refl : (a : Type) -> Eq a a

sym : (a : Type) -> (b : Type) -> Eq a b -> Eq b a
sym a b e = case e of
  Refl c => Refl c

trans : (a : Type) -> (b : Type) -> (c : Type) -> Eq a b -> Eq b c -> Eq a c
trans a b c p q = case p of
  Refl d => q
```

几条 M14 的硬边界，写代码前值得先知道：

- **索引 binder 必须显式**。`data Vec : Type -> Nat -> Type` 的构造子写
  `Cons : (a : Type) -> (n : Nat) -> a -> Vec a n -> Vec a (Succ n)`；隐式索引推断
  （`{n : Nat} -> ...` 靠调用点自动求解，例如 `FSucc FZero`）**M14 不做**，推迟到
  **M15**。M14 里期望类型能给出闭合解时隐式 binder 偶尔可用，但一旦要从调用点反推
  索引或解里出现局部变量，就报 `unsolved metavariable` / `type mismatch`。
- **擦除规则**：binder 的域是**宇宙**（`a : Type`）⇒ 擦除；域是**归纳族**（`n : Nat`
  这类索引）⇒ **保留运行时表示**。所以 `Vec a n` 的值是一条带长度索引字段的链表
  （`type 'a t_Vec = C_Vec_Nil | C_Vec_Cons of 'a t_Nat * 'a * 'a t_Vec`），索引不是
  零成本抽象（完整擦除分析属 M16）。
- **`case` 分支必须绑定构造子的全部显式 telescope binder**（族参数与索引也各占一个
  位置，即使分支体不用）：`Cons b m y ys => ...` 依次对应 `a`、`n`、字段 `a`、
  `Vec a m`。只支持**顶层构造子模式**；嵌套模式（`Succ (Succ k)`）报
  `DT: nested patterns are not supported yet`；兜底 `_ => ...`（变量模式等价）只能放
  **最后**一个分支。
- **可达性决定分支能否省略**：若函数签名把索引**细化**（如 `Vec a (Succ m)`），
  与该索引不可统一的分支（`Nil`）**可以省略**，写了则报
  `DT: this branch is impossible`；若签名是**泛化**索引（`Vec a n`），则所有构造子
  都可达，必须写全，漏写报 `DT: case is not exhaustive: missing <C>`。
- **`data` 的 kind 必须是 `... -> Type` 的箭头链**，构造子的结果类型必须回到本族
  （否则报 `DT: constructor <C> does not return <F>`）。族名本身按 kind 入
  `globals`，每个构造子挂**完整 Pi 类型**；类型级 `Vec a n` 是**中性应用**，不做
  类型级求值（只在索引 unification 时按定义性相等比较）。
- **`check --dt` 不要求 `main`**（库文件可直接 check），`compile --dt` 要求 `main`
  且其类型为 `Int` / `String` / `Bool`。
- 只有**一阶（闭合）元变量解**；高阶/开放解、终止性/覆盖性证明都归 M15/M16。

测试夹具（`test/run-tests.sh` 第 34 段，两条路径都跑）：

- 正例 `test/corpus/dt/` 共 **12** 个：M13 的 `01_id`–`08_if`；M14 新增
  `09_nat`（`Nat` + 递归 `plus`，输出 `5`）、`10_vec`（`Vec` 的长度/首元素/尾，输出
  `4`）、`11_fin`（`Fin` 安全取下标，输出 `7`）、`12_eq`（`Eq` 的 `sym`/`trans`，
  输出 `7`）。
- 负例 `test/corpus/dt_err/` 共 **15** 个：M13 的 `01_universe`、`02_conv`、
  `03_hole`、`05_import`、`06_unknown`、`07_lambda`、`08_arity`、`09_runtime_type`、
  `11_implicit_non_type`；M14 新增/改名 `04_nonexhaustive`（漏写 `Succ` 分支）、
  `10_impossible`（写了不可达分支）、`12_case_int`（case 打在 `Int` 上）、
  `13_unknown_ctor`（未知构造子）、`14_bad_ctor_result`（构造子结果不是所属族）、
  `15_nested_pat`（嵌套模式）。

```console
vuna check --dt file.vuna            # 精化 + 擦除检查（不生成代码）
vuna compile --dt file.vuna out.ml   # 擦除并生成 OCaml（main : Int/String/Bool）
vuna interp --dt file.vuna           # 核心求值器（NbE + delta）求值 main
```

### codegen 的表示

只有一条 codegen（typed，M12.7 起 dynamic codegen 已删除）：

- `TypedCodegen`：用类型信息生成原生 OCaml 类型与代码——用户
  `data` 编译成 OCaml 变体、`Int/String/Bool/List` 映射到原生类型、`case` 编译成
  OCaml `match`、构造器直接构造变体，没有动态 `value` 包装。

typed codegen 只用 OCaml 标准库，不依赖解释循环。代码质量优化：

- **依赖分组**：用 Kosaraju SCC 一次正向 + 一次反向 DFS 求出函数依赖分量，
  `genTop` 复杂度从 O(V²·reach) 降到 O(V+E)（自举 codegen 从 ~12s 降到 ~0.2s）；
  非自递归单函数用 `let`，互递归分量才用 `let rec ... and ...`；
- **比较运算符特化**：`==` `/=` `<` `<=` `>` `>=` 按操作数类型改写为
  `bi_eq_int` / `bi_eq_str` / `bi_eq_bool` / `bi_*_int` 等单态 helper，
  避免多态 `caml_equal` / `caml_less_than`（多态函数里的比较仍保留通用 `bi_eq`）；
- **短路**：`a && b` / `a || b` 生成 OCaml `if`，左侧能决定结果时不求值右侧；
  解释器同样短路；
- **字符串拼接**：同层 `++` 链编译期折叠相邻字面量，3 段以上生成按序求值的
  `let` 绑定 + `String.concat "" [...]`（线性时间，不再是右嵌套 `^`）；
- **输出收尾**：单子句全变量模式直接生成 `fun x y -> ...`（省 match/元组）、
  原子实参省略括号、零参纯值 hoist 成普通 `let`（每次引用不再重建值）；
- **可读性**：生成代码经过轻量 pretty printer（按 `in`/`else`/行宽断行），
  长字符串按真实换行输出，避免几 KB 的单行；
- 生成结果仍是**单个 OCaml 文件**（loader 先 flatten）；分离编译时拆成逐模块
  `.ml/.mli`；runtime 前导代码在 `TypedCodegen.vuna` 的 `runtimeCodeTyped`。

## 测试

`test/run-tests.sh` 是 vuna 原生测试（679 checks），用 `vuna` / `vuna-seed` 驱动，
不依赖外部 vuna 实现；但运行测试需要 OCaml 编译器（`ocamlopt`）作为代码生成后端：

```console
sh test/run-tests.sh          # 需要 PATH 中有 vuna 与 vuna-seed
```

覆盖：

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
- 第 34 段（M13/M14）DT：`corpus/dt/*.vuna`（12 个）的 `interp --dt`（核心求值器）/
  `check --dt`（精化 + 擦除检查）/ `compile --dt`（擦除 codegen → ocamlopt → 运行）
  三路与 golden 一致；`corpus/dt_err/*.vuna`（15 个）在 `check --dt` 与 `compile --dt`
  两条路径都要求错误片段、非 0 退出且不写输出文件（非穷尽 case、不可满足分支、
  对 `Int` 做 case、未知构造子、构造子不返回该族、嵌套模式）；另有 `--dt` CLI 约束
  （不支持 `--root` / 包目录，`build` / `seed` 不支持 `--dt`）；

Nix 侧：

- `checks.vuna-tests`：在沙箱里跑上述原生测试；
- `checks.vuna-typecheck`：用当前编译器类型检查自己的源码；
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
  `12_fact` → `120`；
- `checks.vuna-metrics`（M12）：机器无关 codegen 指标（bytes/lines/最长行/超长行/
  `let rec`/拼接/比较特化/ctor 计数）对 **compiler 闭包** 聚合，对比
  `nix/metrics.budget`，超预算失败；
- `checks.fixed-point`：与 `seed-selfhost` 同一派生。

## 开发

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

## Nix

```console
nix build             # 默认 = vuna（产品 CLI）
nix build .#vuna-compiler # stage 1 编译器（从 compiler/ 分离编译）
nix build .#vuna-seed # stage 0 种子编译器（从多文件 seed/ 构建）
nix flake check       # vuna-tests / vuna-package / vuna-metrics / vuna-typecheck / vuna-lint / seed-selfhost
nix fmt               # nixfmt-tree 格式化 .nix
```

## 限制与路线

- 类型检查与原生 OCaml typed codegen 已默认开启，且是唯一 codegen 路径
  （M12.7 删除 dynamic codegen）；M8 完成 typed 自举，`seed/` 由 typed 编译器轮换
  （M12 起为多文件）；`vuna interp` 对普通程序保留“不检查执行”的调试语义；
- M8c 完成 codegen 性能与输出质量收尾：Kosaraju SCC、类型特化比较、`&&`/`||`
  短路、`++` 折叠与线性拼接、零参纯值 hoist、pretty printer；自举 codegen
  从 ~12s 降到 ~2s 量级；构建加 `-g` 并对 warning 39（unused rec）设 warn-error；
- M12 起分离编译是构建模型的主干（每 vuna 模块一个 OCaml 模块 + `build.sh` 增量构建）；
  M12.8 起 `vuna build` 先做包级 codegen（`.output/lib/` + `app/Main.ml`），再由
  `.output/build.sh` 调 ocamlopt 产出 `.output/bin/<包名>`；`vuna build --split` 仍保留
  为旧的扁平分离 codegen（逐模块 `.ml/.mli` + `build.sh`），遇到不支持构造直接报错
  （不回退）；typed codegen 的**单文件**路径仍保留：`vuna compile`、测试/调试与包级
  codegen 不支持的构造使用单文件产物；优化仍归 ocamlopt（M12 不做 vuna typed IR）；
  runtime prelude 在分离编译中完整保留；
- `do` / Monad / IO 组合子已在 M11 实现；DT（依赖类型）M13 起步、M14 落地索引族：
  `--dt` 单文件路径（Core TT + 精化器 + 擦除 codegen + `interp --dt`），M14 加入
  `data` 索引归纳族与依赖 `case`、解除递归定义限制；仍无隐式索引推断 / 高阶元变量 /
  终止性与完整擦除分析，仍不接入 split / 包模式 / `import`。完整 DT 主线见
  [docs/roadmap.md](docs/roadmap.md) 与 [docs/dt-core.md](docs/dt-core.md)；
- M12 限制：分离编译的*生成*阶段仍是整程序分析，但经过 M12.5 性能修复后与单文件
  编译同量级（约 2s）；增量收益体现在 ocamlopt 只重编译受影响模块（`build.sh`）；
  seed 多文件（`.ml/.mli` 文件集）fixed point 逐字节比较；分离编译的
  `build.sh` 增量粒度是模块（.cmi 依赖时间戳），无跨包并行构建与依赖哈希；
  `vuna build --split` 暂不会自动回退单文件（遇到不支持构造报错，需改用
  `vuna build` 的包级 / `vuna compile --package` 路径）；基准时间测量仍手动
  （`nix run .#bench`），CI 只守机器无关指标；
- M12.5 边界：编译器是独立成员包 `vuna-compiler`，`seed/` 只由 compiler 包入口闭包
  生成，工具链不在 TCB；产品 CLI `vuna` 仍是单一二进制（in-process 调 compiler 库，
  不 fork `vuna-compiler` 进程）。M12.8 的 `vuna build` 通过受限进程执行内建
  （`prim_runIn`）运行 `.output/build.sh` 调 ocamlopt；这不是 vuna 进程转发。
  LSP / package manager 若加入，放在根包（CLI）侧或独立包，**永不进入 seed 闭包**；
- M12.5 编译性能修复：类型替换改 AVL（unify 从 O(n²) 回到 O(n log n)）、分离编译
  预计算路由表（去掉每模块 O(decls×names) 扫描）、跳过无签名函数占位 scheme 的
  env free-var 扫描、干净构建走单次 ocamlopt。本机 compiler 闭包的 `build --split`
  从 ~32s 降到 ~2s，`nix build .#vuna-seed --rebuild` ~1.4s、
  `nix build .#vuna-compiler --rebuild` ~3.4s；
- M12.6 main / IO：可执行入口（`vuna build` / `--split` / `seed`）要求 `main : IO a`，
  由运行时执行动作（没有公开的 `runIO` / `unsafeRunIO`）；普通用户包不能直接调用
  effectful 内建（`print` / `readFile` / `exit` / ...），只能经 `Base.IO`（编译器 /
  产品 CLI / `vuna-base` 自身在包级 allowlist 内）；`vuna interp` / `vuna test` / `--root`
  的**入口文件**同样禁止直接调用 effectful 内建（只有被加载的 base/compiler
  模块内部可用），纯 main 结果 show 仍保留为调试约定。IO 组合统一用
  `Functor`/`Monad` trait（`fmap`/`bind`/`pure`、`>>=`、`do`），不再导出
  `bindIO`/`pureIO`/`fmapIO`；效果 API 直接返回 IO（`print : String -> IO Int`、
  `getArgs : IO (List String)` 等），内部由不导出的 `prim_*` 原语实现。
  当前 `IO` 仍是库层 thunk 表示，不是完整的 effect
  类型系统（留给后续效应阶段，见 [docs/roadmap.md](docs/roadmap.md)）；
- M11.6 fmt 限制：行宽 100，但模块头/导出列表、类型签名与超长字符串字面量不折行；
  表达式内部的注释会前移到最内层包含它的条目（或下一条目），不保证留在原位置；
  单行块注释可以挂在行尾，多行块注释只作为前置注释；
- M11.5 工具链限制：REPL 一次只接受一行（多行定义/表达式需后续扩展）；
  `vuna test` 走解释器路径（代码生成路径由
  `test/run-tests.sh` 覆盖）；`vuna build` 生成 `.output/{lib,app}` 并调用 ocamlopt
  产出 `.output/bin/<包名>`；依赖只支持本地路径（registry/锁文件未做）；`Map` 是关联表实现的抽象类型（无平衡树）；
  `Result` 暂无 Functor/Monad 实例；
- `vuna lint` 首批规则是保守子集：lambda 体内的冗余 `case` 不报告（vuna 的 lambda
  参数只有变量名，不能写模式）；只处理从行首 `if` 起始的规范布局（整条 if 链写在
  一行时不检测）；多行表达式分支的 if 链、非最后子句/alt 上的冗余 `case` 只报告
  不自动修复；`--fix` 遇到注释、tab、CRLF 也跳过；
- IO 失败（如 `readFile` 缺失文件）会抛宿主异常，但入口文件缺失会返回普通错误；
  CLI 使用 `exit` 内建返回非 0 退出码（compile 错误 1、lint 有 finding 1、用法/
  解析/IO 错误 2）；
- 种子轮换是手动流程（发版/不兼容变更时）；日常工具链改动不需要 rotation；
- `test/run-tests.sh` 目前以 golden 比对为主，后续可以补充更多随机/差分测试；
- M12.8 命名与构建：标准库包名 `vuna-base`、模块根 `Base.*`，编译器模块
  `Vuna.Compiler.*`（门面 `Vuna.Compiler.Common`）；包模式自动导入 `Prelude`，
  原始 `--root` 模式不导入（保持自举/夹具的显式 import 语义）；`vuna build` 需要
  PATH 中有 `ocamlopt`，库包先用 `vuna compile --package` 生成 `.output/lib/`；
  `Prelude` 刻意不含 `Base.IO` 效果函数（避免与编译器直接使用的内建同名）；
- M12.7 / M12.8 / M13 / M14 已完成：删除 dynamic codegen 与旧开关；完成标准库/
  编译器命名空间收敛、`Prelude` 自动导入与 `.output` 包级构建；DT 地基（Core TT +
  精化器 + 单文件 `--dt`）之后落地索引归纳族与依赖模式匹配；依赖类型主线（M13–M18）
  见 [docs/roadmap.md](docs/roadmap.md)。

## 历史

- M1：解析器；M2：解释器；M3a/M3b：AST 与源码级自解释器；
- M4a：codegen（vuna → OCaml）；M4b：自解释器编译成独立二进制；
- M5：模块系统（文件=模块、import、flatten）；
- M6：用 vuna 写 codegen，种子入库，stage1/stage2 fixed point；
- M6 之后：种子轮换为 vuna 生成，P2 把测试迁移到 vuna 原生 harness；
- M7：HM 类型检查；M8a/M8b：原生 OCaml typed codegen 与 typed 自举；
- M8c：codegen 性能与输出质量收尾（SCC、比较特化、短路、拼接、pretty printer），
  种子随之轮换；
- 工具链：`vuna` 统一 CLI（`compile` / `lint --fix` / `interp`），新增
  `fileExists` / `exit` 内建、可重复 `--root`（app 可作为模块根）；
- M9：诊断与语言可用性——全链路 span、运行时错误带 `文件:行:列`、穷尽性/冗余检查、
  非 0 退出码；
- M10：模块系统 v2——模块头与显式导出列表、抽象类型、`module B` / `B.name` 重导出、
  `_` 前缀隐私、模块路径不变式；
- M10.5：记录类型、trait 与实例（静态派发 + 裸类型变量方法级字典穿参）、
  `deriving (Show, Eq)`、内置 `Show` / `Eq` / `Ord` 与运算符迁移；编译器自举使用
  记录 + `deriving`；
- M11：标准库成独立成员包（现 `vuna-base`，当时叫 `vuna-stdlib`；模块现 `Base.*`，
  当时叫 `Vuna.*`；Pair/Bool/List/Maybe/Result/String/Sort/Map/Monad/IO），编译器门面
  （现 `Vuna.Compiler.Common`，当时叫 `Vuna.Base`）变为重导出、编译器成为标准库首个
  用户；高阶 kind（`TApp` + kind 元数）与一般约束泛化、`do` 语法糖、`>>=`/`>>`、
  Monad/Functor 实例与 IO 组合子；新增 readLine/readDir/isDirectory/makeDir/removeFile
  内建；两次 seed 轮换；
- M11.5：`vuna.toml` 包格式、workspace（根即包）、依赖 DAG 与 `[export]` 跨包
  可见性、三目录约定与 `app/Main.vuna` 入口；`vuna build/test/fmt/repl/doc` 子命令；
  多包示例与 `checks.vuna-package`；
- M12：分离编译——vuna 模块 → OCaml 模块（`.ml` + `.mli`，模块边界保留抽象类型/
  重导出），`build.sh` 增量构建（ocamlopt `.cmi/.cmx` 缓存）；seed 改为多文件
  文件集（`bootstrap/` → `seed/`、`vuna-boot` → `vuna-seed`），fixed point 按
  文件集合逐字节比较；机器无关 codegen 指标作 CI 门槛（`checks.vuna-metrics`）；
- M11.6：fmt 完善——注释保留（行/块/嵌套/行尾，按语法条目挂载）、100 列行宽折行
  （RHS / 列表 / 应用 / 中缀链），fmt golden 覆盖注释与折行；
- M12.5：工具链与自举边界拆分——编译器独立为成员包 `vuna-compiler`（自有 CLI
  `vuna-compiler`），根包 `vuna` 退为产品 CLI 并经 in-process 调库复用编译命令；
  seed 只覆盖 compiler 包入口闭包（工具链移出 TCB，文件 63→49），fixed point、
  seed 闭包断言、metrics 目标与基准脚本同步调整；新增跨包重导出夹具；
  同期修复编译性能（AVL 类型替换、分离编译路由表、快速 seed 构建），compiler 闭包
  的 `build --split` 从 ~32s 降到 ~2s；
- M12.6：main / IO 语义——可执行入口 `main : IO a`（运行时执行，无公开 runner），
  用户包与调试入口都不能直接调用 effectful 内建（包级 / 入口级限制），
  `Base.IO`（当时叫 `Vuna.IO`）成为唯一效果 API；IO 组合统一走 `Functor`/`Monad` trait
  （`fmap`/`bind`/`pure`、`>>=`、`do`），删除 `bindIO`/`pureIO`/`fmapIO` 导出；
  效果 API 直接 IO 化（`print : String -> IO Int`、`getArgs : IO (List String)` 等），
  内部由不导出的 `prim_*` 原语实现；
  seed 51 个文件 / ~0.86 MB；`vuna interp`/`vuna test` 保留纯 main 结果 show 的调试约定；
- M13：DT 地基——Core TT（`Type`/Pi/应用/lambda/if；NbE + beta/delta/eta；
  非累积宇宙）、双向精化器（一阶 metavariable、类型级隐式插入、delta 类型别名）、
  擦除型 DT codegen 与 `interp --dt` 核心求值器；`--dt` 单文件 opt-in，HM 路径
  语义与产物不变；新增 `docs/dt-core.md` 设计稿与 `test/corpus/dt*` 夹具；
  seed 49 → 57 个文件 / ~0.92 MB；
- M12.7：删除 dynamic codegen（`Vuna.Codegen`）与 `--no-typecheck` / `--typecheck` /
  `--typed` / `build --no-print` / `--out` / 裸 compile 回退；typed 成为唯一 codegen，
  `vuna check` 改为纯类型检查（单次 typecheck）、arity 诊断统一到 typecheck，
  CLI 要求显式子命令、默认模块根改为当前包；seed 49 个文件 / ~0.81 MB；
- M12.8：命名空间收敛与包级构建——标准库包改名 `vuna-base`（模块 `Base.*`），
  编译器模块迁到 `Vuna.Compiler.*`（门面 `Vuna.Compiler.Common`）；新增顶层
  `Prelude`（`base/lib/Prelude.vuna`，重导出 Pair/Bool/List/Maybe/Result/String/Monad，
  不含 `Base.IO` 效果函数），包模式自动导入、原始 `--root` 模式不导入；新增
  `vuna compile --package`（`.output/{lib,app}`）与 `vuna build`（ocamlopt →
  `.output/bin/<包名>`），`vuna build --split` / `seed` 保留扁平分离 codegen；
  seed 61 个文件 / ~1.2 MB；
- M14：索引族与依赖模式匹配——Core 增加构造子应用与 case（`TCon`/`TCase` /
  `VCon`/`VCase`），`data F : <kind> where` 声明的索引归纳族（构造子写完整显式
  telescope `(a : Type) -> (n : Nat) -> ...`；宇宙域 binder 擦除、索引保留运行时表示），
  `case` 做索引 unification 与分支可达性判定（不可满足分支可省略、写错则报错）与
  覆盖率检查；解除递归定义限制（SCC 分组，终止靠 delta 展开 fuel）；核心求值器与
  擦除型 codegen 同步扩展（运行时族 → OCaml 变体、族前缀构造子名、`match` + 不可能
  分支 `failwith`）；新增 `test/corpus/dt/09_nat` / `10_vec` / `11_fin` / `12_eq`
  正例（输出 5 / 4 / 7 / 7）与 `dt_err` 反例；隐式索引推断留 M15；仍为单文件
  `--dt` opt-in，split/包集成留 M17；
- 早期 OCaml 外部编译器 `vunax` 已完成使命并删除。