# Vuna 路线图

本文记录 vuna 当前基线与后续大阶段规划。

## 已完成

- M1：offside layout parser；
- M2：call-by-value 求值器；
- M3：自解释器；
- M4：动态 value 表示 codegen 与编译版解释器；
- M5：文件即模块、import / qualified / alias、模块名与循环检查；
- M6：vuna 自写 codegen + seed 固定点；
- M7：HM 类型检查、模块类型名解析、顶层推断、编译器自检；
- M8：原生 OCaml typed codegen（data → variant，Int/String/Bool/List 原生），
  typed 默认，typed 自举，`bootstrap/seed.ml` 由 typed 编译器轮换；
- M9：诊断与语言可用性——全链路 span、运行时错误 `文件:行:列`、穷尽性/冗余检查、非 0 退出码。
- M10：模块系统 v2——模块头与显式导出列表、抽象类型、`module B` / `B.name` 重导出、
  `_` 前缀隐私、模块路径不变式（loader 探针：`Vuna.vuna` 与 `Vuna/Parser.vuna` 同根共存）、
  loader 测试；编译器自身使用新特性。
- M10.5：类型表达力——记录类型（构造/访问/更新/模式/参数化/跨模块抽象/`deriving`）；
  trait（单参数、相干默认、命名实例、`@name`、孤儿检查、`deriving (Show, Eq)`）；
  内置 `Show` / `Eq` / `Ord` 与运算符迁移；编译器自举使用记录 + `deriving`；
  删除 `specializeCmp` 与运行时 `show_value`；方法级字典穿参（裸类型变量，按 trait
  方法扁平化）。
- M11：标准库——独立成员包 `vuna-stdlib`（`stdlib/lib/`，Pair/Bool/List/Maybe/
  Result/String/Sort/Map/Monad/IO）；高阶 kind（`TApp`/kind 元数）与一般约束泛化；
  `do` 语法糖与 `>>=`/`>>`、Monad/Functor 实例、IO 组合子；`Vuna.Base` 变门面，
  编译器成为 stdlib 首个用户；新增 `readLine`/`readDir`/`isDirectory`/`makeDir`/
  `removeFile` 内建；两次 seed 轮换。
- M11.5：包管理与工具链——`vuna.toml`（TOML 子集）、workspace（根即包）与依赖 DAG、
  `[export]` 跨包可见性、三目录约定与 `app/Main.vuna` 入口、Loader 模块根抽象；
  `vuna build` / `test` / `fmt` / `repl` / `doc`；多包示例与 Nix 沙箱复现
  （`checks.vuna-package`）。
- M12：性能与编译模型——分离编译（vuna 模块 → OCaml 模块 `.ml`/`.mli`，模块边界保留
  抽象类型/重导出），生成的 `build.sh` 用 ocamlopt `.cmi/.cmx` 缓存做模块级增量构建；
  seed 改为多文件文件集（`bootstrap/` → `seed/`、`vuna-boot` → `vuna-seed`），
  fixed point 按文件集合逐字节比较；`checks.vuna-metrics` 机器无关指标门槛；
  不做 vuna typed IR（优化归 ocamlopt）。
- M11.6：fmt 完善——注释保留（行/块/嵌套/行尾，按语法条目挂载）与 100 列行宽
  折行（RHS / 列表 / 应用 / 中缀链）；fmt golden 覆盖注释与折行。

当前硬约束：

1. 当前编译器必须能通过自身类型检查；
2. seed rotation 后 stage 1 与 stage 2 必须字节一致；
3. `test/run-tests.sh`、`nix build`、`nix flake check` 必须保持通过。

当前保留 `dynamic codegen` 仅作为 `--no-typecheck` 的测试/调试回退路径。

## 推荐顺序

如果目标是“能实际写程序的语言”：

```text
M10 模块系统 v2（已完成）→ M10.5 类型表达力（已完成：记录 + trait）
   → M11 标准库（已完成：高阶 kind/约束泛化 + do/Monad/IO；编译器是首个用户）
   → M11.5 包管理与工具链（已完成：vuna.toml / workspace / 三目录 + 工具链）
   → M12 性能与编译模型（已完成：分离编译 / seed 多文件 / 指标门槛）
   → M11.6 fmt 完善（已完成：注释保留 / 行宽折行）
   → M13 高级类型/效应（研究型，单独规划）
```

依赖说明：

- **M10、M10.5、M11、M11.5、M12、M11.6 已完成**；下一步是 M13（研究型，单独规划）；
  M11.6 是 M11.5 工具链的收尾（fmt 注释/折行），不改变语言语义，也不影响 M12 编译模型；
- **M11 与 M11.5 的机制部分可并行**，二者改动面互不重叠（stdlib vs 包工具）；
  但**交付顺序**是 M11 先、M11.5 后；
- **M11（标准库）依赖 M10.5 的 trait 基础**（已具备，含方法级字典穿参），不依赖 M11.5：
  `do`/Monad 还需要高阶 kind 与一般约束泛化，作为 M11 的前置工作补齐；stdlib 先以
  **模块根**形态存在（`--root lib --root stdlib`），编译器作为首个用户，不需要包格式；
- **M11.5（包管理）依赖 M10 与 M11**：模块导出/重导出与路径不变式是包门面的基础；
  stdlib 是第一个被包装成包的库，且被编译器包依赖；
- **编译器是 stdlib 的第一个大客户**：`Maybe/List/Result/Bool` 单一真源（不再在编译器
  `Vuna.Base` 私人重复），stdlib 由最复杂的程序（编译器）先行验证；
- **M11 与 M11.5 的机制部分可并行**：M11.5 中“stdlib 作为首个包”的验收等 M11。

如果目标是“类型系统研究平台”，可直接推进 M13 候选方向；M9/M10/M10.5 已完成。

---

## M10：模块系统 v2（已完成）

目标：让语言能组织真实程序（模块边界、抽象与可见性）。

范围：

- 显式导出/抽象类型：模块签名，只导出接口不导出构造器；
- 模块类型名与值命名空间进一步分离；
- 视目标再考虑 functor、嵌套模块、模块类型别名（M10 未实现，留待后续）。

验收：

- 跨模块抽象类型不可被构造器模式破坏；
- 模块导出/重导出/`_` 前缀有 loader 测试；
- 编译器自身可用新特性（至少不依赖旧 hack）。

### M10 设计要点（已实现）

#### 模块导出与可见性

- **显式导出列表**写在模块头，**省略列表 = 导出全部**（与 v0 行为一致，自举零迁移）：

  ```vuna
  module M (export-item, ...) where
  ```

- **抽象类型**：导出项 `T` = 只导出类型（构造器不可见）；`T(..)` = 类型 + 构造器
  （重导出已导入的类型时只公开源模块本来就公开的构造器，保持源的抽象性）。
  这直接满足验收“跨模块抽象类型不可被构造器模式破坏”。
- **命名空间**：导出项按 M7 的类型名/值名两套命名空间解析；`foo` 若同时是类型名与值名，
  裸名导出两者，`foo(..)` 再放构造器。暂不做选择性子集 `T(C1,C2)`。
- **重导出**：`module B` = 整模块重导出（门面/伞模块，保留 B 的抽象性）；
  `B.foo` = 选择性重导出（限定名，永不歧义）；重命名重导出 `foo = B.foo` 暂缓。
  重导出名须在当前作用域可见。这是“import 只算直接依赖、不传递”的**受控例外**：
  只有显式列出的名字重新可见。
- **包级别模块导出（分两层）**：
  - 聚合层（M10 已完成）：模块级导出列表 + `module B` 重导出，包门面约定为
    `lib/Vuna.vuna`（M10 只提供能力，仓库当前未放置该文件）；
  - 限制层（M11.5 包管理做）：根 manifest（`vuna.toml`）声明 `[export]`，
    loader 在 import 解析时校验目标模块是否在公开集，从而隐藏包内部模块。
- **模块路径不变式**：模块路径的**最后一段是文件名，中间段是目录，目录本身不是模块**。

  ```vuna
  modulePath root name = root ++ "/" ++ joinSlashes (splitOnDot name) ++ ".vuna"
  ```

  由此在同根下 `Vuna.vuna`（模块 `Vuna`）与 `Vuna/Parser.vuna`（模块 `Vuna.Parser`）
  可以共存、无歧义，包门面可直接命名 `Vuna`。loader 测试用探针验证：
  `Vuna.vuna` + `Vuna/Parser.vuna` 共存，`import Vuna` 与 `import Vuna.Parser` 都能解析。
- **`_` 前缀不可导出**：任何顶层名字（值/类型/构造器）以 `_` 开头 ⇒ 隐式私有、不可导出；
  尝试导出 `_` 名 ⇒ 硬错误（不是静默剔除，符合 M9“不再靠猜”）；对构造器也生效
  （`_` 是硬隐私标记，不因 `(..)` 放松）；顶层名字禁止裸 `_`（与模式通配符冲突）。
  模块名段不受此约束（须 `[A-Z][A-Za-z0-9_]*`），二者不冲突。

#### 验收补充

- 跨模块抽象类型不可被构造器模式破坏（`T` 导出、跨模块 `case x of ...` 报错）；
- `_` 名不可导出（编译错误）；
- `Vuna.vuna` + `Vuna/Parser.vuna` 共存、门面可解析；

## M10.5：类型表达力（已完成）

目标：解决 ad-hoc 多态，为 `do`/Monad 铺路。

范围：

- 记录类型：字段访问、更新、模式；
- trait（命名实例）：替代当前 `==`、`show` 等特化；
- 高阶 kind 类型变量（`TApp`/kind）：`Monad m` 要求 `m :: * -> *`
  （M10.5 未实现，留作 M11 前置）；
- 不建议此阶段直接上依赖类型；先完成记录 + trait。

实现状态：记录（M10.5a）与 trait/实例/`deriving`（M10.5b）、方法级字典穿参
（M10.5c，裸类型变量）已完成；高阶 kind 与一般约束泛化不在 M10.5 范围内
（见文末实现状态）。

验收：

- 记录与 trait 有类型检查测试与 typed codegen 测试；
- 编译器自身可用新特性（至少不依赖旧 hack）。

### M10.5 设计要点（已定）

#### trait（替代当前 `==`、`show` 特化）

- 命名：**`trait`**。不用 `interface`（① 暗示面向对象子类型，vuna 无对象；
  ② 与“模块签名/模块接口”撞词）；不用 `type class`（背负 Haskell 全套实例解析的预期包袱）。
- 声明与使用（`as` 复用 import alias 风格）：

  ```vuna
  trait Show a where
    show : a -> String

  instance Show Int where               -- default（未命名，相干）
    show n = strFromInt n

  instance Show Int as showHexInt where -- 命名实例
    show n = "0x" ++ strFromInt n

  show x                -- 隐式走 default
  show @showHexInt x    -- 显式指名（名字级，与未来类型应用 @T 正交）
  ```

- **命名实例模型 X（已定）**：
  - 未命名实例 = `default`，按 **(trait, 类型) 至多一个**，且**全局唯一**（flatten 时检查，
    不是使用期）。`default` 不是全模块唯一——`Show Int` 与 `Show String` 可同存。
  - 显式实例名占模块顶层命名空间：同模块、同 trait 内唯一；可模块限定（`M.name`）、
    可导出导入。
  - **孤儿实例（trait 与类型都不在本模块定义）必须命名、禁止 `default`**——这是
    “默认相干”的安全阀：default 永不孤儿 ⇒ 不会出现两库各写一个 `default Show Int`。
  - 隐式解析**只认 `default`，命名实例绝不自动选**。算法：无 `@` 时收集“可见
    （当前模块 + 已导入模块导出列表 + prelude）且能作用于 T 的 default”，恰 1 ⇒ 用；
    0 ⇒ “no instance”；≥2 ⇒ 声明期已被全局唯一检查拦住，不会到使用期。有 `@name` ⇒
    查名（可 `M.name`，需已导入），命中即用，未命中或头类型不符 ⇒ 报错。
  - **`deriving (Show, Eq)` 生成 `default`**：同一类型可“derive 的 default + 手写命名
    自定义”并存（用 `@` 挑自定义）；“derive 又手写未命名 default” ⇒ 两个 default ⇒
    声明期错误。
  - **经验法则**：主/结构实例写成 `default`，备选写成命名（如 `showHex`）。
  - **实现**：无 overlapping、无实例链搜索；只要“default 全局唯一检查 + `@` 名字查找”。
    实际落地采用**静态派发 + 方法级字典穿参**（裸类型变量，见文末实现状态）；
    `specializeCmp` 与运行时 `show_value` 已删除。
  - M10.5 只做**单参数 trait + 相干默认 + 命名逃逸 + deriving Show/Eq**；
    多参数/关联类型留 M13。

#### 验收补充

- 命名实例：同类型 default 与命名并存、`@name` 选择、孤儿必须命名（反例报错）；
- 编译器自身迁移：去掉 `specializeCmp` / 运行时 `show_value`，改用 trait + deriving。

### M10.5 实现状态（已落地）

- trait 主要按**静态派发**实现：调用点类型确定时，类型检查期直接解析到 default 实例 /
  `@` 命名实例 / `Eq`、`Ord`、`Show` 的结构回退，生成直接函数调用。**方法级字典穿参**
  （M10.5c）覆盖调用点类型是裸类型变量的情况：类型检查给函数增加方法函数参数（字典按
  trait 方法扁平化），调用点静态传入具体实例方法或调用者的字典参数，支持跨函数传播、
  前向引用与递归。
- 原因：M10.5 只需支撑记录与标准库早期代码；静态派发实现小、无运行时字典开销，与现有
  typed codegen 兼容；裸类型变量场景再用方法级字典穿参补齐。`Eq` / `Ord` 在类型无法
  确定时（含 `List a` 等结构化泛型）保留运行时结构比较（typed 用 OCaml 结构比较，
  interp/dynamic 用 value 结构比较）作为回退；`Show` / 用户 trait 的结构化泛型仍报错。
- 后续：高阶 kind（`m :: * -> *`）与一般约束泛化是 `do`/Monad 的前置，作为 M11 标准库
  的先行工作推进；default 实例可见性目前按整个程序（flatten）计算，未做 import 图级
  细化。
- 边界：`Ord` 的运行时内建回退只覆盖 `Int` / `String` / `Bool`（其余类型报
  `no instance Ord`）；命名实例可经显式导出列表导出，app 侧用 `@M.fancy` 选择。
- 回归修复（M10.5c）：同一 trait 的多个不同类型 default 实例相互独立（实现函数按
  head 类型取名），直接调用与泛型字典穿参调用均可。

## M11：标准库（已完成）

目标：从“能编译示例”到“有可用的标准库与 effectful 编程”。

范围：

- 核心库：`List`、`Maybe`、`Result`、`String`、`IO`、排序、映射等；stdlib 是
  **独立的模块根 `stdlib/`**（成员包 `vuna-stdlib`），不混入编译器 `lib/`；
- `do` 语法糖与明确的 IO 组合子（`bind`/`pure`/`>>`）：`do` 是 `>>=`/`pure` 的语法糖，
  依赖 Monad trait（trait 与裸类型变量字典穿参已在 M10.5 提供；高阶 kind 与一般约束
  泛化需在 M11 前补齐）；`Monad m` 要求 `m :: * -> *`；
- 顺序执行 `>>` 作为 `do` 的派生。

验收：

- 核心库覆盖常用操作；`do`/IO 组合子对 `Maybe`/`List`/`IO` 生效；
- 标准库与 `do` 有类型检查与 typed codegen 测试；
- 编译器自身已使用 stdlib（作为首个用户，自举 fixed point 在 `lib+stdlib+app` 源上成立）。

### M11 实现状态（已落地）

- 标准库：`stdlib/` 成员包（`stdlib/lib/` 模块根），模块 Pair/Bool/List/Maybe/
  Result/String/Sort/Map/Monad/IO + 包门面 `Vuna`；`[export]` 清单；
- 高阶 kind：`Ty.TApp`（类型变量当类型构造器应用）、trait 参数 kind 元数与实例
  kind 校验（`instance Monad Int` 声明期报错）；一般约束泛化：高阶 kind 类型变量的
  方法级字典穿参（如 `bindPair : m a -> m b -> m (Pair a b)` 跨类型构造器派发）；
- `do`：parser 产出 `EDo`，loader desugar 成 `bind`/lambda；`>>=`/`>>` 中缀；
  `do` 对 Maybe/List/IO 生效；IO 用抽象 `IO a`（`Int -> a` 包装）+ runIO/printIO 等；
- 编译器迁移：`Vuna.Base` 门面重导出 stdlib，构建根 `lib+stdlib/lib+app`，
  编译器是 stdlib 首个用户（fixed point 在 lib+stdlib/lib+app 上成立）；
- 内建补充：`readLine` / `readDir` / `isDirectory` / `makeDir` / `removeFile`；
- 测试：`corpus/monad/`（do/高阶 kind，26 段）、`corpus/stdlib/`（27 段，
  `--root ../stdlib/lib`）、fmt golden（32 段）。

### M11 设计要点（已定）

#### 编译器是 stdlib 的首个用户（单一真源）

- 编译器依赖 stdlib：`Maybe/Result/List/Bool/Pair` 与通用 helper 的唯一定义在 stdlib，
  不再在编译器 `Vuna.Base` 私人重复（避免“内建相邻全局构造器”不变式被两份定义破坏）；
- `Vuna.Base` 变**门面**：删除上述类型与已迁走 helper，改**重导出** stdlib 模块
  （`module Vuna.Maybe`/`module Vuna.Result`/`module Vuna.List`/`module Vuna.Bool`），
  保留编译器专属（`Pos`/`Span`/`showSpanLoc`、模块路径 `splitOnDot`/`joinSlashes` 等、
  诊断 `suggest`/`similarName`）；现有 `import Vuna.Base` 的模块不改一行即继续可见这些名字；
- 门面是过渡态，日后可让各模块直接 import stdlib 后解散 `Base`；门面内不再定义
  与 stdlib 重名的值（如 `length` 归 stdlib `List`）。

#### 落地顺序与 seed 轮换（三步，前一步不依赖后一步）

- **Step 1 纯重构（旧语法，seed 不轮换）**：把类型与通用 helper 从 `Vuna.Base` 迁到
  stdlib（`data`/`import`/`module` 重导出均为 M10 已有语法），构建命令变
  `--root lib --root stdlib --root app`；
- **Step 2 语法落地**：M10.5 trait + 高阶 kind 进编译器（编译器自迁移去掉
  `specializeCmp`/运行时 `show_value`）→ **rotate seed**；随后 `do` 语法糖进编译器 →
  **rotate seed**；
- **Step 3 stdlib 升级**：seed 已懂 trait/do，此时才允许 stdlib 写 `Monad`/`Functor`
  实例与 `do`/`IO` 组合子；fixed point `stage1 == stage2` 在 `lib+stdlib+app` 源上成立。

> 硬规则：stdlib 用 `do` 之前，seed 必须已轮换到懂 `do`（README 种子策略）。

## M11.5：包管理与工具链（已完成）

目标：从“能编译示例”到“能开发项目”。依赖 M10（模块导出）与 M11（标准库，stdlib 成为首个包）。

范围：

- 包格式与锁文件；先与 Nix 集成，不急于完整 registry；
- `vuna fmt`、REPL、测试运行器、文档生成；
- LSP 可后置，但 formatter + REPL 对语言迭代帮助最大。

验收：

- 用 vuna 写一个多包示例项目；
- 格式化后源码仍可编译且输出不变；
- 包管理路径在 Nix 沙箱内可复现。

### M11.5 实现状态（已落地）

- `vuna.toml`：TOML 子集解析（`Vuna.Toml`）+ manifest 模型/校验（`Vuna.Manifest`）；
  `[package]` / `[workspace].members` / `[export].modules` / `[dependencies]`（本地路径）；
- workspace：根即包（Cargo 风格），本仓库 = 根包 `vuna` + 成员包 `vuna-stdlib`；
- 模块根解析：`Vuna.Pkg`（`Root` = 目录 + 包名 + 可选导出集；依赖 DFS 后序、按包名
  去重），loader 用 `loadProgram roots entryPkg entry`：同包全可见、跨包只认
  `[export]`，隐藏模块报错；`app/Main.vuna` 固定入口，`app/` 不再作模块根
  （`app/Lint.vuna` 迁到 `lib/Vuna/Lint.vuna`）；
- 工具链：`vuna build`（package → typed OCaml）、`vuna test`（test/*.vuna，
  main : String 空串通过）、`vuna fmt --check`（`Vuna.Fmt`，幂等、可重解析；
  注释保留与折行见 M11.6）、`vuna repl`（行式，定义累积 + 完整 loader/类型检查路径）、
  `vuna doc`（Markdown API）；
- 验收载体：`examples/multi/` 多包 workspace；`checks.vuna-package` 在 Nix 沙箱里
  build/test/fmt/doc 并构建编译器自身，验证包管理路径可复现；测试 28–31 段；
- 未做：registry / 锁文件 / 远程依赖、LSP、`vuna build` 的 ocamlopt 驱动
  （只生成 .ml）、REPL 多行输入。

### M11.5 设计要点（已定）

#### 包格式：`vuna.toml`

- 包元信息用 `vuna.toml`（TOML，非 vuna 源码）：`[package]`（name/version/edition）、
  `[export]`（可导出模块）、`[workspace]`（成员）、`[dependencies]`；
- **包名 ≠ 模块命名空间**：模块空间仍是 `Vuna.*`，包名只是依赖解析的键；loader 解析
  `import Vuna.List` 按**依赖包的 `lib/` 根顺序**查找；跨依赖同名模块沿用“跨根同名硬错误”；
- `[export]` 只能列 `lib/` 下的模块（结构约束，loader 强校验）；省略 = 导出全部 lib。

#### workspace：根即一个子包

- workspace 根本身是一个子包（Cargo 风格）：根 `vuna.toml` 同时含 `[workspace]` 与 `[package]`；
- 当前仓库 = 一个 workspace：根包（编译器，`name = "vuna"`）+ 成员包 `stdlib`
  （`name = "vuna-stdlib"`）；
- 根包 `[dependencies]` 含 `vuna-stdlib`；`vuna-stdlib` 依赖空（`readFile`/`print`/`++`/`==`
  是语言内建，不是包依赖）；依赖图无环：`用户包 → vuna-stdlib`、`vuna(编译器) → vuna-stdlib`。

#### 三目录与单向依赖（每包固定 `lib/` `app/` `test/`）

- 包内分层（依赖只向下流）：`lib` → 仅外部包 `lib`；`app` → 本包 `lib` + 本包 `app`
  + 外部包 `lib`；`test` → 本包 `lib` + 本包 `app` + 本包 `test` + 外部包 `lib`；
- 包间：A 依赖 B ⇒ A 只能用 B 的 `lib`；B 的 `app`/`test` 对 A 不可见；包依赖图是 DAG（无环）；
- `app/Main.vuna` 固定入口：有可执行目标的包，入口恒为 `app/Main.vuna`；
- `app/` **不再作为模块根**：`app/Main.vuna` 只从 `lib/`（本包+依赖包）import；`app/` 下的
  辅助模块是 app 私有、其他包不可见；
- 结构推论：`app/Lint.vuna` 是库模块（被 import，非入口），挪到 `lib/Vuna/Lint.vuna`；
  `app/` 退化为纯入口目录；多根 `--root lib --root app` 退休，loader 根 = 本包 `lib/` +
  依赖包 `lib/`（由 workspace/依赖图解析，取代手写 `--root`）。

#### 与现状衔接

- `test/corpus/modules/0*` 夹具已具包形态（`lib/`+`app/`+`expected.out`），升级为迷你包
  只需加 `vuna.toml`，是天然的验收载体；
- `test/run-tests.sh` 是工具链脚本+黄金数据，暂原地保留（CI 依赖）；`test/` 的 vuna 测试
  模块从 `test/*.vuna` 起步；三目录约定约束源码包，不约束 harness。

## M12：性能与编译模型（已完成）

目标：摆脱“整程序 flatten + 全量重编”，走向多文件分离编译。

依赖：M11.5（包 DAG 是增量边界：接口变化的包，只有其传递依赖者被重编）。

### M12 实现状态（已落地）

- **分离编译（路线 B）**：`Vuna.TypedCodegen.generateSplitProgram` 把每个 vuna 模块
  生成一个 OCaml 模块（`<Mod>.ml` + `<Mod>.mli`）：模块间用 `open Vuna_runtime` +
  按 import 拓扑序 `open` 之前模块（全局唯一名字无需改写）；`.mli` 按模块导出表生成
  sig（抽象类型 vs 完整变体、整模块重导出用 `include module type of`），入口生成
  `Main.ml`；单文件 codegen 路径保留（解释器/动态回退、以及分离编译不支持的构造回退），
  产物字节不变。
- **增量构建**：`Vuna.Split.buildScript` 生成 `build.sh`：模块 `.ml/.mli` 变化、或任一
  更早模块的 `.cmi` 比本模块 `.cmx` 新才重编，最后链接；实测无改动只链接、touch 一个
  模块只重编它。优化仍归 ocamlopt（不做 vuna typed IR）。
- **seed 多文件**：`bootstrap/seed.ml`（单文件）→ `seed/`（逐模块 `.ml/.mli` +
  `build.sh`）；`vuna-boot` → `vuna-seed`；seed rotation 用 `nix/seed-rotate.sh`
  （`vuna seed seed .`）；fixed point 按**文件集合逐字节**比较（`diff -r`），
  `checks.seed-selfhost` 同时断言增量构建与 `12_fact` 行为。
- **基准与回归门槛**：`checks.vuna-metrics` 聚合分离编译产物的机器无关指标
  （bytes/lines/最长行/超长行/`let rec`/线性拼接/比较特化/ctor 计数），对比
  `nix/metrics.budget`；精确时间测量仍手动 `nix run .#bench`（已适配多文件 seed/构建，
  报告 fixed point / seed 一致性 / 指标）。
- 未做：vuna typed IR、自研 native/LLVM/C 后端、跨包并行构建、依赖哈希/内容寻址缓存；
  `vuna build --split` 遇到不支持构造（选择性重导出、部分构造器导出、dict 约束泛化等）
  报错而不自动回退（`vuna build` 单文件路径可用）。

范围：

- **分离编译（路线 B）**：vuna 模块 → OCaml 模块（`module M : sig ... end = struct ... end`），
  逐模块 `.ml`；构建用 ocamlopt 原生 `.cmi/.cmx` 缓存；
- **优化归属 ocamlopt**：模式匹配编译/尾调用/死代码/内联等由 ocamlopt 承担；M12 **不做
  vuna typed IR**（完整 IR + 优化 pass 随多后端一并评估）；
- **seed 接受多文件**：信任锚点从单文件变多文件集合；`bootstrap/` 改名 `seed/`、
  `vuna-boot` 改名 `vuna-seed`（随本项落地时执行）；seed rotation 与 fixed point 按
  **文件集合逐字节一致**；
- **基准测试与性能回归门槛**：机器无关指标（生成产物 bytes/lines/最长行、构造计数）
  作 CI 门槛 + 粗时间界；精确时间测量保持手动 `nix run .#bench -- --baseline`；
- 评估是否以及何时脱离 OCaml 后端 → 后置到多后端/IR 项目一并评估。

验收：

- 增量编译不再重编全部模块（ocamlopt `.cmi/.cmx` 缓存生效）；
- 跨模块抽象类型/重导出在 OCaml 模块边界（sig）上仍正确；
- 关键基准有可比较数据；机器无关指标作回归门槛；
- fixed point 与自检不因优化改变语义（seed 多文件后 = 文件集合逐字节一致）。

自研 native/LLVM/C 后端 + 完整 typed IR 应作为独立大项目评估，不与本阶段捆绑。

## M11.6：fmt 完善（已完成）

目标：补齐 M11.5 工具链遗留的 `vuna fmt` 两大缺口——注释保留与行宽折行。

范围：

- **注释保留**：AST 不保留注释，格式化器在 parse 之外单独 lex 注释（`Lexer.lexComments`），
  按源码位置挂到语法条目上，再随条目输出；
- **行宽折行**：默认 100 列，超过时在可重新 parse 的位置折行。

### M11.6 实现状态（已落地）

- **注释模型**：`Comment`（行/块 + 原文 + span）由 `lexComments` 单独扫描；与 `skipTrivia`
  同一套规则（`--` 行注释、可嵌套 `{- -}`，字符串里的注释符不算）。注释不进 token 流，
  parser 与其余编译路径零改动。
- **注释挂载**：格式化器为每个可挂注释的条目收集 span（模块头、import、顶层声明、
  数据构造器、记录字段、trait 方法、instance 方法、let/where 绑定、case 分支、
  do 语句），按位置分配：
  - 与条目结尾同行的单行注释 → 该条目的行尾注释（追加在该条目最后一行）；
  - 其它注释 → 下一条目的前置注释（条目缩进处单独成行）；
  - 若「下一条目」已跳出当前声明（函数体末尾的注释等）→ 前移到最内层包含它的条目；
  - 文件末尾的注释保留在文件末尾。
  该规则保证 `format(format(x)) == format(x)` 且 `format(x)` 可重新 parse；
  多行块注释按条目缩进重排（只改前导空白）。
- **折行规则**（`maxWidth = 100`）：声明/绑定/分支/do 绑定的 RHS 放不下时折到下一行
  （`=` / `=>` / `<-` 之后缩进 2）；列表字面量逐元素一行；函数应用参数按行宽贪心
  折行；中缀链把运算符放续行行首（续行缩进 2，满足 offside 约束）。
  模块头/导出列表、类型签名与超长字符串字面量不折行（折行以可重新 parse 为前提）。
- **验收载体**：`test/corpus/fmt/` 新增/更新注释夹具（09、15、16、17、18）与折行夹具
  19，`run/07_wrap.vuna` 验证「折行后语义不变」；probe 断言 format→parse→format 幂等。
  fmt corpus 65 checks；`vuna lint` 自检与 `checks.vuna-metrics` 预算同步更新。
- 未做：注释在表达式内部的精确定位（会前移）、类型/模块头折行、按项目配置行宽。

## M13：高级类型 / 效应（研究型，下一步）

候选方向（一次只选一个）：

- 依赖类型；
- 线性/效应系统；
- 隐式参数；
- 更完整的模块类型系统。

前置条件：

- M10.5 的类型基础稳定；
- M9 的诊断能支撑复杂类型错误；
- 有明确的语言目标与可接受的编译期成本。

## 暂缓事项

- 完整独立运行时/GC；
- 多后端支持（先保持 OCaml 后端）；
- 大型标准库扩张；
- 包 registry 与远程依赖解析。

这些应在 M9–M12 稳定后再评估。