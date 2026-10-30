# vuna

vuna 是一个函数式编程语言，本仓库是它的编译器。

编译器完全用 vuna 自己写（`lib/Vuna/` 下的 Ast/Lexer/Parser/Interp/Codegen
模块 + `app/Main.vuna`、`app/Lint.vuna`），通过提交入库的 OCaml 种子自举。构建、
测试和语言演进都不依赖外部编译器。早期用于启动自举的 OCaml 实现 `vunax` 已在
M6 完成后删除；需要查看历史可从 git log 找到。

## 工具与自举链

| 工具 | 作用 |
| --- | --- |
| `vuna-boot` | stage 0：从 `bootstrap/seed.ml` 构建的种子二进制 |
| `vuna` | stage 1：`vuna-boot` 编译当前 `lib/` + `app/Main.vuna` 得到，当前编译器 |

`vuna` 统一了原来的编译器与解释器入口：

```console
vuna compile [--no-print] [--no-typecheck] [--typecheck] [--typed] [--root DIR]... <entry.vuna> [out.ml]
vuna lint [--fix] <file.vuna>...
vuna interp [--root DIR]... <file.vuna>
vuna help
```

不带子命令时等价于 `vuna compile`（兼容旧调用）；`vuna interp` 取代了原来的独立
`vuna-interp` 二进制。

```text
bootstrap/seed.ml（提交入库的 OCaml 信任锚点种子）──ocamlopt──▶ vuna-boot
  │  vuna-boot 编译当前 lib/ + app/Main.vuna
  ▼
stage1.ml ──ocamlopt──▶ vuna（当前编译器）
  │  vuna 再编译同一份源码
  ▼
stage2.ml；stage1 == stage2 即 fixed point
```

## 种子策略

种子（`bootstrap/`）**提交入库**，是构建输入而不是构建产物。唯一的硬性不变量：

> **当前入库的种子必须能编译当前的 vuna 源码。**

- 种子**不需要**与源码同步：日常修改 `lib/`、`app/`、`test/` 不重新生成种子；
- 种子只通过 **seed rotation** 更新：用当前 `vuna-boot` 编译当前编译器源码，把生成的
  `stage1.ml` 提交为新种子；
- 种子比源码旧是正常状态，但必须始终保持“能编译当前源码”的能力；
- CI 用 `checks.bootstrap-selfhost` 守这条不变量：用种子编译当前源码，构建出
  stage 1 / stage 2 并校验字节一致；`checks.fixed-point` 与它同一派生；
- 如果新特性会让源码超出旧种子能编译的语法子集，必须先把特性实现成旧语法可编译的
  形式，rotate 种子后再在编译器源码里使用新语法；
- `bootstrap/` 下所有文件都是生成物，禁止手改。

种子轮换流程：

```console
# 前提：当前源码能被当前种子编译（nix flake check 通过）
vuna --typed --no-print --root lib --root app app/Main.vuna bootstrap/seed.ml
nix flake check            # 新种子能编译当前源码，且 fixed point 成立
git diff bootstrap/        # 确认变化可解释
git add bootstrap/ && git commit
```

注意：如果改的是**现有语法的语义**（而非新增语法），旧种子会按旧语义编译新编译器，
需要确认没有 bootstrap 语义偏差；必要时先 rotate，再让编译器源码依赖新语义。

## 目录结构

```text
.
├── .local                # 本地文件，被git忽略，临时文件可以放到 .local/tmp 下面
├── flake.nix             # Nix：vuna-boot / vuna、devShell、checks
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
│       ├── Typecheck.vuna # HM 类型检查（M7）
│       ├── TypedCodegen.vuna # 原生 OCaml typed codegen（M8）
│       ├── Codegen.vuna  # flatten 后的 AST → OCaml
│       └── Interp.vuna   # 对外 facade（interpret/interpretFile/compileFile）
├── app/
│   ├── Main.vuna         # 统一 CLI 入口（compile / lint / interp）
│   └── Lint.vuna         # 风格检查与自动修复（literal-if-chain / redundant-case）
├── test/
│   ├── run-tests.sh      # vuna 原生测试（只用 vuna / vuna-boot）
│   └── corpus/           # run / run_err / err / modules / lint / fix 语料与 golden
├── bootstrap/seed.ml     # 自举信任锚点种子（非 stage），提交入库，由 vuna-boot 轮换生成
├── .gitattributes        # 把 bootstrap/** 标记为 generated
└── README.md
```

`lib/` 是 vuna 的默认模块根，不是 OCaml 库目录；`app/` 可同时作为额外模块根
（`--root lib --root app`），因此 `app/Main.vuna` 可以直接 `import Lint`。仓库里
没有任何 dune/OCaml 项目，只用 `ocamlopt` 编译生成的种子和程序。

## 语言（core-v0）

- 类型：`Int` / `String`、`data` 声明的代数数据类型、函数；类型签名会被解析但擦除；
- 语法：Idris2 风格 `data ... where`、多子句函数、`case ... of`、`let ... in`、
  lambda、`if then else`、整数/字符串字面量、`[..]` 与 `x :: xs` 列表糖、
  中缀运算符（`-> || && == /= < <= > >= ++ + - * / ::`）；
- layout：offside 规则；顶层声明、`data` 构造器块、`case` 分支、`let` 绑定按块列
  对齐，表达式跨行必须缩进超过所在块列；
- `main` 必须是零参数定义；`show` 负责把值变成字符串；
- 内建：`+ - * /`、`== /= < <= > >=`、`&& ||`、`++`、`strLength`、`strUnpack`、
  `strPack`、`strFromInt`，IO 内建 `readFile` / `writeFile` / `print` / `getArgs`，
  以及 `fileExists` / `exit`；
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
- `app/` 也可以作为模块根：`vuna --root lib --root app app/Main.vuna` 时，
  `import Lint` 解析到 `app/Lint.vuna`，`import Vuna.Base` 解析到 `lib/Vuna/Base.vuna`；
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
- 限制（M10.5 取舍）：**静态派发**——调用点类型必须能确定；只有 `Eq` / `Ord` 在类型
  无法确定时回退到运行时结构比较（typed 用 OCaml 结构比较，interp/dynamic 用 value
  结构比较）；`show` 用在多态类型会报错；暂不做字典穿参、约束泛化与高阶 kind（留待
  M11 标准库/`do`/Monad 的前置工作）；default 实例的可见性目前按整个程序（flatten）
  计算，未做 import 图级细化；只有程序里出现 trait / instance / deriving 声明（或
  记录等需要降级的语法）时，interp 与 `--no-typecheck` 路径才会先类型检查 + 降级，
  因此只有内建 `show` / `==` 调用、却没有任何 trait/instance/deriving 声明的程序在
  interp 与 `--no-typecheck` 路径保持 legacy（不做类型检查：此时 `show` 不可用、
  `String` 的 `<` / `<=` 仍是旧的仅 Int 运行时语义），typed 路径仍会报多态 `show` 错误；
  上面的 `Eq` / `Ord` 结构回退同样只在触发降级（出现 trait/instance/deriving/记录等）后生效；
- 命名空间与导出：trait 名在类型命名空间、方法名在值命名空间；无模块头 = 全部导出
  （含方法），显式导出列表需 `Trait(..)` 才导出方法；命名实例名按普通值名导出/限定
  （显式列表里可写 `fancy`，app 侧用 `@M.fancy` 选择）；
- 迁移：`==` / `/=` / `<` / `<=` / `>` / `>=` 由 `Eq` / `Ord` trait 承担（删除旧的
  `specializeCmp` 特化）；动态 codegen 的固定 `show_value` 已删除，改为按程序 data
  声明生成 `vuna_show`。

## 编译器实现

- `lib/Vuna/Base.vuna`：Result/Maybe/List/Pair/Bool、列表/Result 辅助函数与
  `splitOnDot`/`splitLastDot` 等字符串工具；
- `lib/Vuna/Ast.vuna`：语法类型（Pat/Expr/Decl/Import/模块头、导出项与记录字段）与
  AST helper（`funArity`/`ctorArity`/`topNames`/`ctorsOf` 等），依赖 Base；
- `lib/Vuna/Lexer.vuna`：词法分析，token 带行列位置；
- `lib/Vuna/Parser.vuna`：offside layout parser，输出模块头、记录声明、AST 与 imports；
- `lib/Vuna/Builtins.vuna`：内建函数名字与元数，Loader 与 Eval 共用；
- `lib/Vuna/Eval.vuna`：值表示、内建函数、call-by-value 求值器与 `show`；
- `lib/Vuna/Loader.vuna`：import 图、模块头/模块名校验、模块导出表（条目是
  `deriving (Eq)` 的 `record ExportEntry`；记录与 data 共用 `T` / `T(..)` 规则）、
  名字解析与 flatten
  （`loadProgram roots entry`，模块根是有序列表，逐根用 `fileExists` 探测，
  跨根同名模块报歧义）；
- `lib/Vuna/Typecheck.vuna`：HM 风格类型检查（Ty/Scheme、unify、构造器 scheme、
  表达式/模式推断、签名校验与无签名顶层推断）；loader 会把 DSig/构造器类型里的类型名解析成
  模块内全名（open/qualified/alias 都支持），因此跨模块类型检查可用；
- `lib/Vuna/Codegen.vuna`：把 flatten 后的 program 翻译成动态 value 表示的 OCaml（保留为测试/调试回退）；
- `lib/Vuna/TypedCodegen.vuna`：M8 typed codegen，用类型信息生成原生 OCaml
  类型、构造器、模式匹配、data show 与 builtins；现在是默认 codegen；
- `lib/Vuna/Interp.vuna`：facade，只暴露 `interpret`/`interpretFile`/`compileFile`；
- 模块内部通过 import 自动 open 使用非限定名，只有 import 行写模块全名；
- 顶层类型签名紧贴其第一个函数子句，签名与实现之间不留空行；顶层声明之间用一个空行分隔；
- [app/Main.vuna](app/Main.vuna)：统一 CLI 入口。`vuna compile` 保留
  `[--no-print] [--no-typecheck] [--typed] [--root DIR]... <entry.vuna> [out.ml]`；
  默认跑类型检查并生成原生 OCaml typed codegen；`--no-typecheck` 关闭检查并回退
  dynamic value codegen；`--no-print` 表示生成的程序不自动打印 `main` 的结果；
  不带子命令时按 compile 处理，兼容旧调用；
- [app/Lint.vuna](app/Lint.vuna)：`vuna lint [--fix] <file.vuna>...`，首批两条规则
  `literal-if-chain` 与 `redundant-case`；只做语法层检查，`--fix` 写回前会重新
  `parseSource` 校验。`vuna interp` 直接调用 `interpretFile` 解释执行文件。

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

`test/run-tests.sh` 是 vuna 原生测试（551 checks），用 `vuna` / `vuna-boot` 驱动，
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
- `corpus/traits/` trait（M10.5b，runner 第 22–25 段）：正例 01–10 三路径
  （interp / 动态 codegen / typed codegen）比对 golden；跨模块 08 覆盖无头模块全导出
  （含命名实例），10 覆盖显式导出 `Trait(..)`；错误例 90–98 三路径都要求错误片段、
  非 0 退出、不写输出文件（含孤儿默认、重复实例、未知 `@`、head 不符、缺/未知方法、
  `deriving Ord`、多态 `show`、显式只写 `Trait` 不写 `(..)` 时方法不可见）；
- `corpus/err/*.vuna`、`corpus/run_err/*.vuna`：解析/求值错误片段；
- `corpus/type_ok`、`corpus/type_err`：单文件类型检查正/反例；
- `corpus/type_modules/0*`、`9*`：跨模块类型检查正/反例；
- `corpus/typed_ok`：`--typed` 单文件原生 OCaml 生成、编译运行与 golden 比对；
- `corpus/modules/` 01–29 的 typed 版本：`--typed --root` 跨模块生成与运行；
- `corpus/lint/*.vuna`：`vuna lint` 检测 golden 与退出码；
- `corpus/fix/*.vuna`：`vuna lint --fix` 结果、退出码与幂等性；
- 统一 CLI：`help`、无参、旧式 compile 兼容、错误退出码、`vuna interp` 缺文件；
- `vuna-boot` 编译 `12_fact` 的种子冒烟。

Nix 侧：

- `checks.vuna-tests`：在沙箱里跑上述原生测试；
- `checks.vuna-typecheck`：用当前编译器类型检查自己的源码；
- `checks.vuna-lint`：对 `lib/Vuna/*.vuna` 与 `app/*.vuna` 跑 `vuna lint`，要求零 finding；
- `checks.bootstrap-selfhost`：种子编译当前源码得到 stage 1，stage 1 再编译得到
  stage 2，`cmp` 两者，并抽查 `12_fact` → `120`；
- `checks.fixed-point`：与 `bootstrap-selfhost` 同一派生。

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
nix build .#vuna-boot # stage 0 种子二进制
nix flake check       # vuna-tests / vuna-typecheck / vuna-lint / bootstrap-selfhost
nix fmt               # nixfmt-tree 格式化 .nix
```

## 限制与路线

- 类型检查与原生 OCaml typed codegen 已默认开启；M8 完成 typed 自举，
  `bootstrap/seed.ml` 由 typed 编译器轮换；dynamic codegen 保留为
  `--no-typecheck` 的测试/调试回退路径；
- M8c 完成 codegen 性能与输出质量收尾：Kosaraju SCC、类型特化比较、`&&`/`||`
  短路、`++` 折叠与线性拼接、零参纯值 hoist、pretty printer；自举 codegen
  从 ~12s 降到 ~2s 量级；构建加 `-g` 并对 warning 39（unused rec）设 warn-error；
- typed codegen 仍生成单文件 OCaml；小程序的 runtime prelude 会按需裁剪，
  大程序保持完整 prelude；
- `do` / 隐式参数 / 依赖类型未实现；
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
- M10.5：记录类型、trait 与实例（静态派发）、`deriving (Show, Eq)`、内置
  `Show` / `Eq` / `Ord` 与运算符迁移；编译器自举使用记录 + `deriving`；
- 早期 OCaml 外部编译器 `vunax` 已完成使命并删除。