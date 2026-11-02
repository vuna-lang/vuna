# 语言参考：core-v0（语法与模块系统）

本文是 vuna 语言 core-v0 的语法与模块系统参考，内容自根 [README](../../README.md)
拆出。记录 / trait / do / Monad / 标准库见 [type-system.md](type-system.md)，
包管理与工具链命令见 [packages.md](packages.md)，依赖类型子集见 [dt.md](dt.md)。

## core-v0 语法

- 类型：`Int` / `String`、`data` 声明的代数数据类型、函数；类型签名会被解析但擦除；
- 语法：Idris2 风格 `data ... where`、多子句函数、`case ... of`、`let ... in`、
  lambda、`if then else`、`do` 块（M11）、整数/字符串字面量、`[..]` 与
  `x :: xs` 列表糖、中缀运算符
  （`-> || && == /= < <= > >= ++ + - * / :: >>= >>`）；
- layout：offside 规则；顶层声明、`data` 构造器块、`case` 分支、`let` 绑定按块列
  对齐，表达式跨行必须缩进超过所在块列；
- `main` 必须是零参数定义；`show` 负责把值变成字符串。`vuna interp` 只展示
  `Int`/`String`/`Bool` 的 `main` 值（M23 起 interp 走 DT 核心求值，见 [limits.md](limits.md)）；
- 内建：`+ - * /`、`== /= < <= > >=`、`&& ||`、`++`、`strLength`、`strUnpack`、
  `strPack`、`strFromInt`，IO 内建 `readFile` / `writeFile` / `print` / `getArgs`，
  文件/目录 `fileExists` / `readDir` / `isDirectory` / `makeDir` / `removeFile`，
  REPL 用 `readLine`，以及 `exit`；
- `&&` / `||` 短路求值：先求左操作数，左侧能决定结果时不求值右侧（核心求值器与
  两条 codegen 一致）；
- `where` 语法在终态不保留（DT 路径 M23 起不再提供 `where` 语义，夹具已改写为等价
  顶层 helper；M24 随 HM 删除 parser/`Fmt` 支持，见 [limits.md](limits.md)）；
- 布尔值与列表约定：`True` / `False` / `Cons` / `Nil` 是内建相邻的全局构造器；
  程序需要自己声明 `data Bool` / `data List` 才能对它们做模式匹配。

## 模块系统

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
  module Vuna.Math
    ( three
    , Nat(..)
    , module Vuna.Compiler.Common
    , Vuna.Compiler.Lexer.lexSource
    ) where
  ```

  `vuna fmt` 会把显式导出列表规范为：导出项按字面文本的 ASCII 字典序排序（`module B`
  整模块重导出排最后）；单行超过 100 列或列表内含注释时逐项一行（逗号前置），否则保持
  单行。排序只影响书写顺序——导出仍是集合，语义不变。

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
