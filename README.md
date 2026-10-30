# vuna

vuna 是一个函数式编程语言，本仓库是它的编译器。

编译器完全用 vuna 自己写：`lib/Vuna/` 下的编译器模块（Ast/Lexer/Parser/Loader/
Typecheck/Codegen/Interp/工具链）+ `app/Main.vuna` 入口，标准库在独立的成员包
`stdlib/`（模块根 `stdlib/lib/`）。仓库通过提交入库的 OCaml 种子自举，构建、
测试和语言演进都不依赖外部编译器。早期用于启动自举的 OCaml 实现 `vunax` 已在
M6 完成后删除；需要查看历史可从 git log 找到。

## 工具与自举链

| 工具 | 作用 |
| --- | --- |
| `vuna-seed` | stage 0：从多文件种子 `seed/`（`seed/build.sh` + ocamlopt）构建的种子二进制 |
| `vuna` | stage 1：`vuna-seed` 对当前源码分离编译后再用生成的 `build.sh` 构建，当前编译器 |

`vuna` 统一了原来的编译器与解释器入口：

```console
# 文件模式（M9 起的原有能力）
vuna compile [--no-print] [--no-typecheck] [--typecheck] [--typed] [--root DIR]... <entry.vuna> [out.ml]
vuna check [--root DIR]... (<entry.vuna> | <package-dir>)
vuna lint [--fix] <file.vuna>...
vuna interp [--root DIR]... <file.vuna>
# 包模式（M11.5：从 vuna.toml / workspace / 依赖 DAG 解析模块根）
vuna build [--no-print] [DIR] [OUT]   # 默认 DIR=.、OUT=DIR/Main.ml（生成 typed OCaml）
vuna build --split OUT [DIR]          # M12 分离编译：逐模块 .ml/.mli + build.sh 写到 OUT
vuna seed [OUT] [DIR]                 # 生成多文件 seed 文件集（默认 OUT=seed）
vuna test [DIR]                       # 解释执行 test/*.vuna（main : String，空串通过）
vuna fmt [--check] [PATH]...          # 格式化；省略 PATH = 当前包 lib/app/test
vuna repl [--root DIR]...             # 交互式 REPL
vuna doc [DIR] [OUT]                  # 从 lib/ 生成 API 文档（默认 DIR/docs/api.md）
vuna help
```

不带子命令时等价于 `vuna compile`（兼容旧调用）；`vuna interp` 取代了原来的独立
`vuna-interp` 二进制。包模式下 loader 的模块根由 `vuna.toml` 的 workspace / 依赖图
解析（本包 `lib/` + 依赖包 `lib/`），不再需要手写 `--root`；`--root` 保留为原始
文件模式（例如编译器自举、测试夹具）显式指定模块根的入口。

```text
seed/（提交入库的多文件 OCaml 信任锚点：逐 vuna 模块的 .ml/.mli + build.sh）
  │  seed/build.sh + ocamlopt（ocamlopt -c 逐模块 + 链接）
  ▼
vuna-seed（stage 0）
  │  vuna-seed build --split stage1 .   （对当前源码分离编译：每模块一个 OCaml 模块）
  ▼
stage1/*.ml + *.mli + build.sh ──ocamlopt（增量）──▶ vuna（stage 1，当前编译器）
  │  vuna 再生成 stage2 文件集
  ▼
stage2 文件集；stage1 == stage2（文件集合逐字节）即 fixed point
```

## 种子策略

种子（`seed/`）**提交入库**，是构建输入而不是构建产物。M12 起种子是**多文件文件集**：
每个 vuna 模块对应一个 OCaml 模块（`.ml` + `.mli`），外加共享 runtime 与 `build.sh`。
唯一的硬性不变量：

> **当前入库的种子必须能编译当前的 vuna 源码。**

- 种子**不需要**与源码同步：日常修改 `lib/`、`app/`、`test/`、`stdlib/` 不重新生成种子；
- 种子只通过 **seed rotation** 更新：用当前编译器对当前源码做分离编译，把生成的
  多文件文件集提交为新 `seed/`（`nix/seed-rotate.sh` 会顺带验证种子自生成 fixed point）；
- 种子比源码旧是正常状态，但必须始终保持“能编译当前源码”的能力；
- CI 用 `checks.seed-selfhost` 守这条不变量：`seed/build.sh` → `vuna-seed`；种子对
  当前源码分离编译得到 stage1 文件集并构建；stage1 再生成 stage2 文件集，`diff -r`
  逐字节一致；同时检查增量构建（无改动不重编、touch 一个模块只重编它）与行为抽查；
  `checks.fixed-point` 与它同一派生；
- 如果新特性会让源码超出旧种子能编译的语法子集，必须先把特性实现成旧语法可编译的
  形式，rotate 种子后再在编译器源码里使用新语法；
- `seed/` 下所有文件都是生成物，禁止手改。

种子轮换流程：

```console
# 前提：当前源码能被当前种子编译（nix flake check 通过）
nix build .#vuna --out-link result
sh nix/seed-rotate.sh ./result/bin/vuna   # 生成 seed/ 并校验种子自生成 fixed point
nix flake check                           # seed-selfhost 等全部通过
git diff seed/                            # 确认变化可解释（通常只有生成代码变化）
git add seed/ && git commit
```

注意：如果改的是**现有语法的语义**（而非新增语法），旧种子会按旧语义编译新编译器，
需要确认没有 bootstrap 语义偏差；必要时先 rotate，再让编译器源码依赖新语义。

## 目录结构

```text
.
├── .local                # 本地文件，被git忽略，临时文件可以放到 .local/tmp 下面
├── flake.nix             # Nix：vuna-boot / vuna、devShell、checks
├── flake.lock
├── vuna.toml             # workspace 根（同时是编译器包 vuna）；deps: vuna-stdlib
├── lib/                  # 编译器包 vuna 的模块根（模块名由路径精确决定）
│   └── Vuna/
│       ├── Base.vuna     # 编译器门面：重导出 stdlib 核心模块 + Pos/Span/模块路径工具
│       ├── Ast.vuna      # 语法类型（Pat/Expr/DoStmt/Decl/Import）与 AST helper
│       ├── Lexer.vuna    # 词法分析（token + 位置）
│       ├── Parser.vuna   # offside layout parser → AST/imports（含 do / >>= / >>）
│       ├── Builtins.vuna # 内建函数名字与元数（Loader/Eval 共用）
│       ├── Eval.vuna     # 值表示、内建函数、求值器与 show
│       ├── Loader.vuna   # import 图、模块根（Root/包导出）、名字解析与 flatten
│       ├── Typecheck.vuna # HM 类型检查（含记录/trait/高阶 kind/字典穿参）
│       ├── TypedCodegen.vuna # 原生 OCaml typed codegen（M8）
│       ├── Codegen.vuna  # flatten 后的 AST → OCaml（--no-typecheck 回退）
│       ├── Interp.vuna   # 对外 facade（含包感知入口）
│       ├── Toml.vuna     # TOML 子集解析（vuna.toml 基础件）
│       ├── Manifest.vuna # vuna.toml 语义模型与校验
│       ├── Pkg.vuna      # workspace / 依赖 DAG / 模块根解析
│       ├── Files.vuna    # 目录遍历小工具（fmt/doc/test 共用）
│       ├── Fmt.vuna      # 源码格式化器（vuna fmt）
│       ├── Repl.vuna     # 交互式 REPL（vuna repl）
│       ├── Doc.vuna      # API 文档生成（vuna doc）
│       ├── TestRunner.vuna # 包内测试运行器（vuna test）
│       ├── Cli.vuna      # 统一 CLI 实现
│       ├── Split.vuna    # 分离编译输出文件模型 + 增量构建脚本生成
│       ├── SplitCli.vuna # 包模式分离编译入口（build --split / seed）
│       └── Lint.vuna     # 风格检查与自动修复（literal-if-chain / redundant-case）
├── app/
│   └── Main.vuna         # 纯入口：main = exit (runCli (getArgs))
├── stdlib/               # 成员包 vuna-stdlib（独立模块根 stdlib/lib/）
│   ├── vuna.toml         # [package] + [export] 导出模块清单
│   └── lib/
│       ├── Vuna.vuna     # 包门面：整模块重导出核心模块
│       └── Vuna/         # Pair/Bool/List/Maybe/Result/String/Sort/Map/Monad/IO
├── examples/multi/       # M11.5 多包示例（workspace 根包 + 成员包 greet + stdlib 依赖）
├── test/
│   ├── run-tests.sh      # vuna 原生测试（只用 vuna / vuna-boot）
│   └── corpus/           # run/err/modules/records/traits/monad/stdlib/packages/fmt/...
├── seed/                 # 多文件自举信任锚点（.ml/.mli + build.sh），提交入库、由 vuna seed 生成
├── .gitattributes        # 把 seed/** 标记为 generated
└── README.md
```

仓库本身是一个 workspace（Cargo 风格：根目录同时是包）：根包 `vuna`（模块根
`lib/`，入口 `app/Main.vuna`）依赖成员包 `vuna-stdlib`（模块根 `stdlib/lib/`）。
`lib/`、`stdlib/lib/` 都是 vuna 模块根，不是 OCaml 库目录；`app/` 是纯入口目录，
不再作为模块根（原 `app/Lint.vuna` 已迁到 `lib/Vuna/Lint.vuna`）。仓库里没有任何
dune/OCaml 项目，只用 `ocamlopt` 编译生成的种子和程序。

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
  （如 `--root lib --root app`），`lib/Vuna/Parser.vuna` ⇔ 模块 `Vuna.Parser`；
- 模块按根顺序查找；同名模块出现在多个根时是硬错误（不静默覆盖）；
- 路径段必须匹配 `[A-Z][A-Za-z0-9_]*`，路径/文件名与模块名**精确一致**，没有大小写映射；
- 入口文件可以在模块根外（如 `app/Main.vuna`），它本身不是模块，不能写模块头；
- 包模式下模块根由 `vuna.toml` 解析：本包 `lib/` + 依赖包 `lib/`（按依赖 DAG 排序，
  跨包只看得见依赖包 `[export]` 里的模块）；`app/` 是纯入口目录，不再作为模块根；
- 原始文件模式下 `--root` 可重复（如编译器自举用
  `--root lib --root stdlib/lib --root app`）；
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
- **模块头**：模块文件可以在 `import` 之前写一个模块头声明导出项（导出列表可以跨行；
  入口文件不能写）：

  ```vuna
  module Vuna.Math where           -- 省略导出列表 = 导出全部（v0 兼容）
  module Vuna.Math () where        -- 显式导出空集
  module Vuna.Math (three, Nat(..), module Vuna.Base, Vuna.Lexer.lexSource) where
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
  因此 `lib/Vuna.vuna`（模块 `Vuna`）与 `lib/Vuna/Parser.vuna`（模块 `Vuna.Parser`）
  能在同一个根下共存、没有歧义，包门面可以直接命名为 `Vuna`；
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
  如 `Vuna.Parser.parse`），解释器与 codegen 复用同一份实现；`show` 只显示最后一段，
  所以输出与单文件程序一致。

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
  内联 `case`，所以解释器、动态 codegen（`--no-typecheck`）与 typed codegen 行为一致；
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
  运行时结构比较（typed 用 OCaml 结构比较，interp/dynamic 用 value 结构比较）；
  `Show` / 用户 trait 的结构化泛型（如 `show (List a)`）仍不支持（只有裸类型变量
  支持字典穿参）并报错；**高阶 kind**（`Ty.TApp` + kind 元数）与**一般约束泛化**
  （trait 参数本身是类型构造器变量，如 `Monad m` 的字典穿参）已在 M11 实现；
  default 实例的可见性目前按整个程序（flatten）计算，未做 import 图级细化；
- 求值与降级触发：只有程序里出现 trait / instance / deriving 声明（或记录等需要降级
  的语法）时，interp 与 `--no-typecheck` 路径才会先类型检查 + 降级；只有内建
  `show` / `==` 调用、却没有任何 trait/instance/deriving 声明的程序在上述路径保持
  legacy（不做类型检查：此时 `show` 不可用、`String` 的 `<` / `<=` 仍是旧的仅 Int
  运行时语义），typed 路径仍按 M10.5 规则检查（裸类型变量 `show` 可经字典穿参，
  结构化泛型 `show` 仍报错）；上面的 `Eq` / `Ord` 结构回退同样只在触发降级后生效；
- 命名空间与导出：trait 名在类型命名空间、方法名在值命名空间；无模块头 = 全部导出
  （含方法），显式导出列表需 `Trait(..)` 才导出方法；命名实例名按普通值名导出/限定
  （显式列表里可写 `fancy`，app 侧用 `@M.fancy` 选择）；
- 迁移：`==` / `/=` / `<` / `<=` / `>` / `>=` 由 `Eq` / `Ord` trait 承担（删除旧的
  `specializeCmp` 特化）；动态 codegen 的固定 `show_value` 已删除，改为按程序 data
  声明生成 `vuna_show`。

### do、Monad 与 Functor（M11）

- 语法：`do` 块，语句是 `pat <- expr`（pat 只支持变量或 `_`）或裸表达式，
  最后一条必须是裸表达式；`a >>= f` 等价 `bind a f`，`a >> b` 等价
  `bind a (\_ -> b)`（顺序执行）。
- `do` 在 **loader** 里 desugar 成 `bind` / lambda（parser 保留 `EDo`，formatter
  因此能还原 do 语法）：

  ```vuna
  import Vuna.Monad
  import Vuna.Maybe

  safeDiv : Int -> Int -> Maybe Int
  safeDiv a b = if b == 0 then Nothing else Just (a / b)

  main : Maybe Int
  main = do
    x <- safeDiv 10 2
    y <- safeDiv x 0
    pure (x + y)
  ```

- `Functor`（`fmap`）与 `Monad`（`bind` / `pure`）在 `stdlib/lib/Vuna/Monad.vuna`；
  `Maybe` / `List` / `IO` 各有 default 实例。`Monad m` 的 m 是 kind `* -> *`：
  trait 声明的类型参数可以当类型构造器应用（`m a`），实例 head 是类型构造器本身
  （`instance Monad Maybe`），kind 不符（如 `instance Monad Int`）在声明期报错。
- 一般约束泛化：签名里出现高阶类型变量（如 `bindPair : m a -> m b -> m (Pair a b)`）
  时，类型检查自动给函数加方法级字典参数；调用点按实际类型静态派发或继续穿参。
- `do` 对 `Maybe` / `List` / `IO` 都生效；`IO` 是 `stdlib/lib/Vuna/IO.vuna`
  的抽象类型（构造器私有），提供 `runIO` / `printIO` / `printlnIO` /
  `readFileIO` / `writeFileIO` / `getArgsIO` / `exitIO` 与 Monad 组合子。

### 标准库（M11）

标准库是独立成员包 `vuna-stdlib`（模块根 `stdlib/lib/`），编译器是它的第一个用户：
`lib/Vuna/Base.vuna` 只是门面（整模块重导出 stdlib 核心模块 + 保留编译器的
`Pos`/`Span`、模块路径与诊断工具），编译器不再私自重复定义 `Maybe`/`List` 等类型。

| 模块 | 内容 |
| --- | --- |
| `Vuna.Pair` / `Vuna.Bool` / `Vuna.List` / `Vuna.Maybe` / `Vuna.Result` | 核心代数数据类型与常用 helper（append/reverse/map/filter/foldl/foldr/traverse/andThen/step/...） |
| `Vuna.String` | split/join/lines/unlines/trim/contains/startsWith/endsWith/repeat/substring |
| `Vuna.Sort` | 稳定归并排序 `mergeSort` / `sortBy` |
| `Vuna.Map` | 关联表实现的抽象 Map（empty/insert/lookup/remove/keys/values/size/...） |
| `Vuna.Monad` | `Functor` / `Monad` trait |
| `Vuna.IO` | 抽象 `IO a` 与 IO 组合子（实例 + print/readFile/writeFile/getArgs/exit） |
| `Vuna` | 包门面：整模块重导出以上模块（`import Vuna` 即可用） |

跨包使用时只可见 `stdlib/vuna.toml` `[export]` 列出的模块；抽象类型（`Map`、`IO`）
的构造器保持私有。

### 包管理与工具链（M11.5）

- 包元信息用 `vuna.toml`（TOML 子集）：`[package]`（name/version/edition）、
  `[workspace]`（members）、`[export]`（modules）、`[dependencies]`
  （依赖名 = 相对路径，暂不做 registry）。
- **workspace 根即一个包**（Cargo 风格）：根 `vuna.toml` 同时含 `[workspace]` 与
  `[package]`；成员是子目录，各自有自己的 `vuna.toml`。
- 每包固定三目录：`lib/`（模块根）、`app/`（入口，恒为 `app/Main.vuna`）、
  `test/`（测试模块）。依赖只向下流：`app`/`test` 可用本包 `lib` + 依赖包 `lib`；
  依赖包之间是 DAG（循环依赖报错）。
- **包名 ≠ 模块命名空间**：模块名仍由路径决定（`stdlib/lib/Vuna/List.vuna` ⇔
  `Vuna.List`）；loader 按「本包 lib + 依赖包 lib（DFS 后序、按包名去重）」解析
  import，跨包只认依赖包 `[export]` 列表，隐藏模块报
  `is not exported by package ...`。
- 工具链（`lib/Vuna/Cli.vuna`）：
  - `vuna build [DIR] [OUT]`：从 `vuna.toml` 解析模块根，生成 typed OCaml（默认
    `DIR/Main.ml`）；
  - `vuna test [DIR]`：解释执行 `test/*.vuna`，`main : String` 空串通过，非空为失败信息；
  - `vuna fmt [--check] [PATH]...`：`Vuna.Fmt` 格式化（2 空格缩进、幂等、可重新
    parse；**注释会丢失**，因为 AST 不保留注释）；
  - `vuna repl [--root DIR]...`：行式 REPL，定义累积、表达式立即走完整
    loader/类型检查/解释器路径（支持 import/记录/trait/do）；
  - `vuna doc [DIR] [OUT]`：扫描 `lib/` 生成 Markdown API 文档。
- 示例：`examples/multi/` 是多包 workspace（根包 + 成员包 `greet` + stdlib 路径依赖），
  `checks.vuna-package` 在 Nix 沙箱里构建并运行它，验证包管理路径可复现。

## 编译器实现

- `lib/Vuna/Base.vuna`：编译器门面——整模块重导出 `Vuna.Pair` / `Vuna.Bool` /
  `Vuna.List` / `Vuna.Maybe` / `Vuna.Result` / `Vuna.String`，并保留编译器专属的
  `Pos` / `Span`、模块路径工具（`splitOnDot` 等）与诊断建议（`suggest`）；
- `lib/Vuna/Ast.vuna`：语法类型（Pat/Expr/DoStmt/Decl/Import/模块头、导出项与记录字段）
  与 AST helper（`funArity`/`ctorArity`/`topNames`/`ctorsOf` 等），依赖 Base；
- `lib/Vuna/Lexer.vuna`：词法分析，token 带行列位置；
- `lib/Vuna/Parser.vuna`：offside layout parser，输出模块头、记录声明、AST 与 imports；
  支持 `do` 块（`DoStmt`）与 `>>=` / `>>` 中缀；`parseExpressionSource` 供 REPL 用；
- `lib/Vuna/Builtins.vuna`：内建函数名字与元数，Loader 与 Eval 共用；
- `lib/Vuna/Eval.vuna`：值表示、内建函数、call-by-value 求值器与 `show`；
- `lib/Vuna/Loader.vuna`：import 图、模块头/模块名校验、模块导出表（条目是
  `deriving (Eq)` 的 `record ExportEntry`；记录与 data 共用 `T` / `T(..)` 规则）、
  名字解析与 flatten（`loadProgram roots entryPkg entry`：模块根是 `Pkg.Root` 有序列表
  ——目录 + 包名 + 可选 `[export]` 集；同包全可见、跨包只认导出集，隐藏模块与跨根同名
  都是硬错误）、`do` 语句 desugar 成 `bind`；
- `lib/Vuna/Typecheck.vuna`：HM 风格类型检查（Ty/Scheme、unify、构造器 scheme、
  表达式/模式推断、签名校验与无签名顶层推断）；`Ty` 含 `TApp`（高阶 kind 应用）、
  `Scheme` 带 trait 约束、方法级字典穿参（裸类型变量与高阶 kind 类型变量都支持）；
  loader 会把 DSig/构造器类型里的类型名解析成模块内全名（open/qualified/alias 都支持），
  因此跨模块类型检查可用；
- `lib/Vuna/Codegen.vuna`：把 flatten 后的 program 翻译成动态 value 表示的 OCaml（保留为测试/调试回退）；
- `lib/Vuna/TypedCodegen.vuna`：typed codegen，用类型信息生成原生 OCaml 类型、
  构造器、模式匹配、data show 与 builtins；默认 codegen。M12 新增
  `generateSplitProgram`：按 vuna 模块生成逐模块 `.ml` + `.mli`（模块间用 open 链
  解析全局唯一名字；抽象类型按模块导出表生成 sig；整模块重导出用 include），
  单文件路径重构为 `genTopNames` 等子集函数，产物字节不变；
- `lib/Vuna/Split.vuna` / `SplitCli.vuna`：分离编译输出文件模型、`build.sh` 增量
  构建脚本（模块 .ml/.mli 或依赖 .cmi 变化才重编，最后链接）、包模式
  `vuna build --split` / `vuna seed` 入口；
- `lib/Vuna/Interp.vuna`：facade（`interpretFile` / `compileFileTyped` 等 + 包感知
  `...In entryPkg ...` 变体）；
- `lib/Vuna/Toml.vuna` / `Manifest.vuna` / `Pkg.vuna`：`vuna.toml` 解析、
  manifest 模型与校验、workspace/依赖 DAG/模块根解析（`Root` 的包导出限制在此计算）；
- `lib/Vuna/Files.vuna` / `Fmt.vuna` / `Repl.vuna` / `Doc.vuna` /
  `TestRunner.vuna` / `Cli.vuna`：M11.5 工具链（目录遍历、格式化、REPL、文档、
  测试运行器、统一 CLI）；
- 模块内部通过 import 自动 open 使用非限定名，只有 import 行写模块全名；
- 顶层类型签名紧贴其第一个函数子句，签名与实现之间不留空行；顶层声明之间用一个空行分隔；
- [app/Main.vuna](app/Main.vuna)：纯入口，`main = exit (runCli (getArgs))`；CLI 实现
  在 `lib/Vuna/Cli.vuna`。`vuna compile` 保留
  `[--no-print] [--no-typecheck] [--typed] [--root DIR]... <entry.vuna> [out.ml]`；
  默认跑类型检查并生成原生 OCaml typed codegen；`--no-typecheck` 关闭检查并回退
  dynamic value codegen；`--no-print` 表示生成的程序不自动打印 `main` 的结果；
  不带子命令时按 compile 处理，兼容旧调用；M11.5 起另有 `build/test/fmt/repl/doc`；
- [lib/Vuna/Lint.vuna](lib/Vuna/Lint.vuna)：`vuna lint [--fix] <file.vuna>...`，首批
  两条规则 `literal-if-chain` 与 `redundant-case`；只做语法层检查，`--fix` 写回前会
  重新 `parseSource` 校验。`vuna interp` 直接调用 `interpretFile` 解释执行文件。

### codegen 的表示

有两种 codegen，默认走 typed：

- `TypedCodegen`（默认，`--typed`）：用类型信息生成原生 OCaml 类型与代码——用户
  `data` 编译成 OCaml 变体、`Int/String/Bool/List` 映射到原生类型、`case` 编译成
  OCaml `match`、构造器直接构造变体，没有动态 `value` 包装；
- `Codegen`（`--no-typecheck` 回退）：值统一为动态表示，生成程序入口按程序的
  data 声明生成 `vuna_show`，打印 `vuna_show main`（不再有固定运行时 `show_value`）：

```ocaml
type value =
  | VInt of int
  | VStr of string
  | VCon of string * value list
  | VFun of string * (value -> value)
```

两种路径都只用 OCaml 标准库，不依赖解释循环。typed codegen 的代码质量优化：

- **依赖分组**：用 Kosaraju SCC 一次正向 + 一次反向 DFS 求出函数依赖分量，
  `genTop` 复杂度从 O(V²·reach) 降到 O(V+E)（自举 codegen 从 ~12s 降到 ~0.2s）；
  非自递归单函数用 `let`，互递归分量才用 `let rec ... and ...`；
- **比较运算符特化**：`==` `/=` `<` `<=` `>` `>=` 按操作数类型改写为
  `bi_eq_int` / `bi_eq_str` / `bi_eq_bool` / `bi_*_int` 等单态 helper，
  避免多态 `caml_equal` / `caml_less_than`（多态函数里的比较仍保留通用 `bi_eq`）；
- **短路**：`a && b` / `a || b` 生成 OCaml `if`，左侧能决定结果时不求值右侧；
  解释器与动态 codegen 同样短路；
- **字符串拼接**：同层 `++` 链编译期折叠相邻字面量，3 段以上生成按序求值的
  `let` 绑定 + `String.concat "" [...]`（线性时间，不再是右嵌套 `^`）；
- **输出收尾**：单子句全变量模式直接生成 `fun x y -> ...`（省 match/元组）、
  原子实参省略括号、零参纯值 hoist 成普通 `let`（每次引用不再重建值）；
- **可读性**：生成代码经过轻量 pretty printer（按 `in`/`else`/行宽断行），
  长字符串按真实换行输出，避免几 KB 的单行；
- 生成结果仍是**单个 OCaml 文件**（loader 先 flatten）；runtime 前导代码分别在
  `Codegen.vuna` 的 `runtimeCode` 与 `TypedCodegen.vuna` 的 `runtimeCodeTyped`。

## 测试

`test/run-tests.sh` 是 vuna 原生测试（693 checks），用 `vuna` / `vuna-boot` 驱动，
不依赖外部 vuna 实现；但运行测试需要 OCaml 编译器（`ocamlopt`）作为代码生成后端：

```console
sh test/run-tests.sh          # 需要 PATH 中有 vuna 与 vuna-boot
```

覆盖：

- `corpus/run/*.vuna`：`vuna interp` 输出 vs `.out` golden；编译器生成→`ocamlopt`→运行再比对；
- `corpus/modules/` 01–29 正例（runner glob `[012][0-9]_*`）：跨模块函数/数据/嵌套 import
  的解释器与动态 codegen（`--no-typecheck`）结果（含多根夹具）；覆盖 M10 显式导出列表、
  重导出、抽象类型、空导出集与包门面路径共存；20–29 补充无头模块重导出、same-target
  去重、选择性类型/构造器重导出、两级门面、qualified import 重导出、多行模块头、
  私有类型封装、`_` 私有构造器在定义模块内匹配；
- `corpus/modules/` 70–99 反例（runner glob `[789][0-9]_*`）：M10 的 `_` 隐私（私有值/
  类型/构造器跨模块使用、私有构造器 `(..)` 不公开）、隐藏构造器跨模块构造/模式匹配、
  重导出抽象性、重导出同名冲突、限定名函数当构造器模式、空导出集语义、入口文件模块头、
  导出未知名、模块名不匹配、重复导出、显式导出 `_` 名、裸 `_` 顶层名，以及缺失模块、
  跨根歧义、循环导入、未限定引用/未导入、同名不同定义歧义、未导出名字、非法模块名、
  别名冲突、import 不传递；错误用例在 interp / 动态 codegen（`--no-typecheck`）/
  typed codegen 三条路径都要求错误片段、不写输出文件；typed 路径同时断言非 0 退出；
- `corpus/records/` 记录（M10.5a）：01–05 正例在 interp / 动态 codegen / typed codegen
  三路径比对 golden；90–95 错误例三路径都要求错误片段与非 0 退出，动态/typed 还要求
  不写输出文件；跨模块正例 `0*_*/`（`Point(..)` 可构造/模式匹配，`Point` 保持抽象）、
  跨模块错误 `9*_*/`（抽象记录构造器不可见）同样覆盖三路径；
- `corpus/traits/` trait（M10.5b/c，runner 第 22–25 段）：正例 01–13 三路径
  （interp / 动态 codegen / typed codegen）比对 golden（含 11/12 泛型字典穿参、13
  多类型 default 实例）；跨模块 08 覆盖无头模块全导出（含命名实例），10 覆盖显式导出
  `Trait(..)`；错误例 90–96、98 三路径都要求错误片段、非 0 退出、不写输出文件
  （含孤儿默认、重复实例、未知 `@`、head 不符、缺/未知方法、`deriving Ord`、显式
  只写 `Trait` 不写 `(..)` 时方法不可见）；
- `corpus/monad/`（M11，runner 第 26 段）：`do` / `>>=` / `>>` 在 Maybe/List 上的
  正例三路径，含高阶 kind 泛型函数（`bindPair : m a -> m b -> m (Pair a b)`）与
  kind 不符、无 Monad、do 块结尾非法、do 绑定模式非法等错误例；
- `corpus/stdlib/`（M11，第 27 段）：`--root ../stdlib/lib` 下 stdlib 各模块与
  do/IO 的正例三路径、错误例；另有 `test/corpus/fmt/check.sh`（第 32 段）覆盖
  格式化 golden 与幂等；
- `corpus/packages/`（M11.5，第 28–29 段）：`vuna build` / `vuna test` 的
  workspace 正例（跨包 import + `[export]` + `app/Main.vuna` 入口）与缺依赖、
  依赖环、隐藏模块错误例；第 30–31 段覆盖 fmt 前后语义一致、`vuna doc`、`vuna repl`；
- `corpus/err/*.vuna`、`corpus/run_err/*.vuna`：解析/求值错误片段；
- `corpus/type_ok`、`corpus/type_err`：单文件类型检查正/反例；
- `corpus/type_modules/0*`、`9*`：跨模块类型检查正/反例；
- `corpus/typed_ok`：`--typed` 单文件原生 OCaml 生成、编译运行与 golden 比对；
- `corpus/modules/` 01–29 的 typed 版本：`--typed --root` 跨模块生成与运行；
- `corpus/lint/*.vuna`：`vuna lint` 检测 golden 与退出码；
- `corpus/fix/*.vuna`：`vuna lint --fix` 结果、退出码与幂等性；
- 统一 CLI：`help`、无参、旧式 compile 兼容、错误退出码、`vuna interp` 缺文件；
- `vuna-seed` 编译 `12_fact` 的种子冒烟；
- 第 33 段（M12）：包模式分离编译——`vuna build --split` 生成文件集、`build.sh`
  构建运行与单文件输出一致、无改动不重编、touch 单个模块只重编它。

Nix 侧：

- `checks.vuna-tests`：在沙箱里跑上述原生测试；
- `checks.vuna-typecheck`：用当前编译器类型检查自己的源码；
- `checks.vuna-lint`：对 `lib/Vuna/*.vuna`、`stdlib/lib/Vuna/*.vuna`、`stdlib/lib/*.vuna`
  与 `app/*.vuna` 跑 `vuna lint`，要求零 finding；
- `checks.vuna-package`：在沙箱里用 `vuna build` 构建 `examples/multi`（workspace +
  成员包 + stdlib 依赖）、运行并比对输出，跑 `vuna test` / `vuna fmt --check` /
  `vuna doc`，并用 package 模式构建编译器自身；
- `checks.seed-selfhost`（M12）：`seed/` 构建 `vuna-seed` → 分离编译当前源码得
  stage 1 文件集 → 构建 stage 1 → 再生成 stage 2 文件集，`diff -r` 逐字节一致；
  另查增量构建（无改动不重编、touch 模块只重编它）与 `12_fact` → `120`；
- `checks.vuna-metrics`（M12）：机器无关 codegen 指标（bytes/lines/最长行/超长行/
  `let rec`/拼接/比较特化/ctor 计数）对比 `nix/metrics.budget`，超预算失败；
- `checks.fixed-point`：与 `seed-selfhost` 同一派生。

## 开发

```console
nix develop
nix build .#vuna --out-link result-vuna
nix build .#vuna-boot --out-link result-boot
VUNA=$PWD/result-vuna/bin/vuna \
VUNA_BOOT=$PWD/result-boot/bin/vuna-boot \
sh test/run-tests.sh
```

devShell 提供 `ocaml` / `ocamlopt` 工具链和 `vuna-boot`；stage 1 的 `vuna` 不进
devShell，避免种子失效时连 shell 都进不去。

## 性能基准（手动）

`nix run .#bench` 是**手动**性能基准，用来在优化前后快速测量收益；不是 CI check，
结果依赖机器，不参与 `nix flake check`。默认测量 `vuna`（stage 1），
`--compiler boot` 改测 `vuna-boot`（stage 0 种子）。

```console
nix run .#bench -- --quick                 # 快速冒烟（runs=1）
nix run .#bench -- --runs 5 --save .local/bench/base.json
# 修改代码后与基线对比：
nix run .#bench -- --baseline .local/bench/base.json
nix run .#bench -- --compiler boot         # 改测 seed 编译器
nix run .#bench -- --with-tests            # 额外跑全部 checks
```

报告包含：构建性能（ocamlopt 构建 seed/stage1 的时间）、编译性能（seed/vuna 自编译、
corpus 批量编译、tiny 程序、typed 与 `--no-typecheck` 路径）、编译吞吐、
生成产物的 bytes/lines/最长行/超长行/行尾空白、codegen 健康度计数
（`let rec`、`String.concat ""`、`bi_eq_int/_str/_bool`、零参 rec thunk）、
以及 fixed point / seed 一致性 / 可选 tests 状态。`--json` 输出机器可读报告，
`--baseline` 输出与历史报告的 delta。所有中间产物写入临时目录（`TMPDIR` 可覆盖），
不会写入仓库。

## Nix

```console
nix build             # 默认 = vuna（stage 1 当前编译器）
nix build .#vuna-seed # stage 0 种子二进制（从多文件 seed/ 构建）
nix flake check       # vuna-tests / vuna-package / vuna-metrics / vuna-typecheck / vuna-lint / seed-selfhost
nix fmt               # nixfmt-tree 格式化 .nix
```

## 限制与路线

- 类型检查与原生 OCaml typed codegen 已默认开启；M8 完成 typed 自举，
  `bootstrap/seed.ml` 由 typed 编译器轮换；dynamic codegen 保留为
  `--no-typecheck` 的测试/调试回退路径；
- M8c 完成 codegen 性能与输出质量收尾：Kosaraju SCC、类型特化比较、`&&`/`||`
  短路、`++` 折叠与线性拼接、零参纯值 hoist、pretty printer；自举 codegen
  从 ~12s 降到 ~2s 量级；构建加 `-g` 并对 warning 39（unused rec）设 warn-error；
- M12 起构建默认走分离编译（每 vuna 模块一个 OCaml 模块 + `build.sh` 增量构建）；
  typed codegen 的**单文件**路径仍保留：解释器/动态回退、以及分离编译不支持的构造
  （选择性重导出、部分构造器导出、dict 约束泛化等）会回退单文件，两者输出语义一致；
  优化仍归 ocamlopt（M12 不做 vuna typed IR）；runtime prelude 在分离编译中完整保留；
- `do` / Monad / IO 组合子已在 M11 实现；隐式参数 / 依赖类型仍未实现；
- M12 限制：seed 多文件（`.ml/.mli` 文件集）fixed point 逐字节比较；分离编译的
  `build.sh` 增量粒度是模块（.cmi 依赖时间戳），无跨包并行构建与依赖哈希；
  `vuna build --split` 暂不会自动回退单文件（遇到不支持构造报错，需手动用
  `vuna build`）；基准时间测量仍手动（`nix run .#bench`），CI 只守机器无关指标；
- M11.5 工具链限制：`vuna fmt` 不保留注释（AST 无注释）、不做行宽折行；REPL 一次
  只接受一行（多行定义/表达式需后续扩展）；`vuna test` 走解释器路径（代码生成路径由
  `test/run-tests.sh` 覆盖）；`vuna build` 只生成 OCaml 源码，不含编译器驱动；
  依赖只支持本地路径（registry/锁文件未做）；`Map` 是关联表实现的抽象类型（无平衡树）；
  `Result` 暂无 Functor/Monad 实例；
- `vuna lint` 首批规则是保守子集：lambda 体内的冗余 `case` 不报告（vuna 的 lambda
  参数只有变量名，不能写模式）；只处理从行首 `if` 起始的规范布局（整条 if 链写在
  一行时不检测）；多行表达式分支的 if 链、非最后子句/alt 上的冗余 `case` 只报告
  不自动修复；`--fix` 遇到注释、tab、CRLF 也跳过；
- IO 失败（如 `readFile` 缺失文件）会抛宿主异常，但入口文件缺失会返回普通错误；
  CLI 使用 `exit` 内建返回非 0 退出码（compile 错误 1、lint 有 finding 1、用法/
  解析/IO 错误 2）；
- 种子轮换是手动流程（发版/不兼容变更时）；
- `test/run-tests.sh` 目前以 golden 比对为主，后续可以补充更多随机/差分测试。

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
- M11：标准库成独立成员包 `vuna-stdlib`（Pair/Bool/List/Maybe/Result/String/Sort/
  Map/Monad/IO），`Vuna.Base` 变门面、编译器成为 stdlib 首个用户；高阶 kind
  （`TApp` + kind 元数）与一般约束泛化、`do` 语法糖、`>>=`/`>>`、
  Monad/Functor 实例与 IO 组合子；新增 readLine/readDir/isDirectory/makeDir/removeFile
  内建；两次 seed 轮换；
- M11.5：`vuna.toml` 包格式、workspace（根即包）、依赖 DAG 与 `[export]` 跨包
  可见性、三目录约定与 `app/Main.vuna` 入口；`vuna build/test/fmt/repl/doc` 子命令；
  多包示例与 `checks.vuna-package`；
- M12：分离编译——vuna 模块 → OCaml 模块（`.ml` + `.mli`，模块边界保留抽象类型/
  重导出），`build.sh` 增量构建（ocamlopt `.cmi/.cmx` 缓存）；seed 改为多文件
  文件集（`bootstrap/` → `seed/`、`vuna-boot` → `vuna-seed`），fixed point 按
  文件集合逐字节比较；机器无关 codegen 指标作 CI 门槛（`checks.vuna-metrics`）；
- 早期 OCaml 外部编译器 `vunax` 已完成使命并删除。