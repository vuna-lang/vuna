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

当前硬约束：

1. 当前编译器必须能通过自身类型检查；
2. seed rotation 后 stage 1 与 stage 2 必须字节一致；
3. `test/run-tests.sh`、`nix build`、`nix flake check` 必须保持通过。

当前保留 `dynamic codegen` 仅作为 `--no-typecheck` 的测试/调试回退路径。

## 推荐顺序

如果目标是“能实际写程序的语言”：

```text
M10 模块系统 v2（已完成）──────→ M11.5 包管理与工具链（同时依赖 M11）
M10.5 类型表达力（trait+记录+高阶kind）→ M11 标准库（do/Monad/IO 组合子）
   → M12 性能与编译模型 → M13 高级类型/效应（研究型，单独规划）
```

依赖说明：

- **M10 已完成**；下一步主线是 M10.5 与 M11，M11.5 的前期工作可在 M10 完成后启动；
- **M10.5（类型表达力）与 M11.5 的前期工作可并行**，二者改动面互不重叠
  （loader/包工具 vs 类型检查/codegen）；
- **M11（标准库）依赖 M10.5**：`do`/Monad 需要 trait + 高阶 kind；
- **M11.5（包管理）依赖 M10 与 M11**：模块导出/重导出与路径不变式是包门面的基础；
  多包示例项目需 M11 标准库；
- **M11 与 M11.5 可并行**：M10 前置已完成；M11.5 中依赖标准库的验收部分等 M11。

如果目标是“类型系统研究平台”，可提前 M10.5；M10 与 M9 已完成。

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
  - 限制层（M11.5 包管理做）：根 manifest（如 `package.vuna`）声明 `[exported-modules]`，
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

## M10.5：类型表达力

目标：解决 ad-hoc 多态，为 `do`/Monad 铺路。

范围：

- 记录类型：字段访问、更新、模式；
- trait（命名实例）：替代当前 `==`、`show` 等特化；
- 高阶 kind 类型变量（`TApp`/kind）：`Monad m` 要求 `m :: * -> *`；
- 不建议此阶段直接上依赖类型；先完成记录 + trait。

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
  - **`deriving (Show)` 生成 `default`**：同一类型可“derive 的 default + 手写命名自定义”并存
    （用 `@` 挑自定义）；“derive 又手写未命名 default” ⇒ 两个 default ⇒ 声明期错误。
  - **经验法则**：主/结构实例写成 `default`，备选写成命名（如 `showHex`）。
  - **实现**：无 overlapping、无实例链搜索；只要“default 全局唯一检查 + `@` 名字查找 +
    字典穿参”。TypedCodegen 照常穿字典；`specializeCmp` 与运行时 `show_value`
    迁到 trait 上后删除。
  - M10.5 只做**单参数 trait + 相干默认 + 命名逃逸 + deriving Show/Eq**；
    多参数/关联类型留 M13。

#### 验收补充

- 命名实例：同类型 default 与命名并存、`@name` 选择、孤儿必须命名（反例报错）；
- 编译器自身迁移：去掉 `specializeCmp` / 运行时 `show_value`，改用 trait + deriving。

## M11：标准库

目标：从“能编译示例”到“有可用的标准库与 effectful 编程”。

范围：

- 核心库：`List`、`Maybe`、`Result`、`String`、`IO`、排序、映射等；
- `do` 语法糖与明确的 IO 组合子（`bind`/`pure`/`>>`）：`do` 是 `>>=`/`pure` 的语法糖，
  依赖 Monad trait（M10.5 引入 trait 与高阶 kind）；`Monad m` 要求 `m :: * -> *`；
- 顺序执行 `>>` 作为 `do` 的派生。

验收：

- 核心库覆盖常用操作；`do`/IO 组合子对 `Maybe`/`List`/`IO` 生效；
- 标准库与 `do` 有类型检查与 typed codegen 测试。

## M11.5：包管理与工具链

目标：从“能编译示例”到“能开发项目”。依赖 M10（模块导出）与 M11（标准库）。

范围：

- 包格式与锁文件；先与 Nix 集成，不急于完整 registry；
- `vuna fmt`、REPL、测试运行器、文档生成；
- LSP 可后置，但 formatter + REPL 对语言迭代帮助最大。

验收：

- 用 vuna 写一个多包示例项目；
- 格式化后源码仍可编译且输出不变；
- 包管理路径在 Nix 沙箱内可复现。

## M12：性能与编译模型

目标：摆脱“整程序 flatten + 全量重编”。

范围：

- 分离编译与增量缓存；
- typed IR 与优化：模式匹配编译、尾调用、死代码、内联；
- 基准测试与性能回归门槛；
- 评估是否以及何时脱离 OCaml 后端。

验收：

- 增量编译不再重编全部模块；
- 关键基准有可比较数据；
- 固定点与自检不因优化改变语义。

自研 native/LLVM/C 后端应作为独立大项目评估，不与本阶段捆绑。

## M13：高级类型 / 效应（研究型）

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