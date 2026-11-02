# 限制与已知边界

本文汇总当前实现的限制、路线状态与边界条件（原 README「限制与路线」节迁入）。后续规划见
[docs/roadmap.md](../roadmap.md)，DT 设计见 [docs/dt-core.md](../dt-core.md)。

## 编译模型

- 类型检查与原生 OCaml typed codegen 是 HM 路径的默认产物（M12.7 删除 dynamic codegen）；
  M8 完成 typed 自举，`seed/` 由 typed 编译器轮换（M12 起为多文件）；M23 起 `vuna interp`
  改为 **DT 精化 + 核心求值**（不再有「不检查直接执行」的语义），HM 代码路径保留到 M24。
- M8c 完成 codegen 性能与输出质量收尾：Kosaraju SCC、类型特化比较、`&&`/`||` 短路、`++`
  折叠与线性拼接、零参纯值 hoist、pretty printer；自举 codegen 从 ~12s 降到 ~2s 量级；
  构建加 `-g` 并对 warning 39（unused rec）设 warn-error。
- M12 起分离编译是构建模型主干（每 vuna 模块一个 OCaml 模块 + `build.sh` 增量构建）；
  M12.8 起 `vuna build` 先做包级 codegen（`.output/lib/` + `app/Main.ml`），再由
  `.output/build.sh` 调 ocamlopt 产出 `.output/bin/<包名>`；`vuna build --split` 是旧的扁平
  分离 codegen（逐模块 `.ml/.mli` + `build.sh`），遇到不支持构造直接报错（不回退）；typed
  codegen 的**单文件**路径保留给 `vuna compile` 与测试/调试；优化仍归 ocamlopt（M12 不做
  vuna typed IR）；runtime prelude 在分离编译中完整保留。
- M12 限制：分离编译的*生成*阶段仍是整程序分析（M12.5 后与单文件同量级，约 2s），增量
  收益在 ocamlopt 只重编受影响模块；`build.sh` 增量粒度是模块（.cmi 时间戳），无跨包并行
  与依赖哈希；`vuna build --split` 不自动回退单文件；基准测量仍手动
  （`nix run .#vuna-bench`），CI 只守机器无关指标。
- M12.5 边界：编译器是独立成员包 `vuna-compiler`，`seed/` 只由 compiler 包入口闭包生成，
  工具链不在 TCB；产品 CLI `vuna` 是单一二进制（in-process 调 compiler 库，不 fork
  `vuna-compiler`）；`vuna build` 通过受限进程执行内建（`prim_runIn`）跑 `.output/build.sh`
  调 ocamlopt，不是 vuna 进程转发；LSP / package manager 若加入，放在根包侧或独立包，
  **永不进入 seed 闭包**。M12.5 编译性能修复（unify 改 AVL、分离编译预计算路由表、跳过占位
  scheme 的 env 扫描）把 compiler 闭包 `build --split` 从 ~32s 降到 ~2s。
- `do` / Monad / IO 组合子已在 M11 实现；DT（依赖类型）M13 起步、M14 索引族、M15 隐式/
  接口/洞、M16 终止性、M17 工具链、M18 自举决策、M18.5 擦除修复、M18.6 表示层定型
  （三值 `Rig` + 不透明 `Level`，见 [docs/dt-core.md](../dt-core.md) §24）、M19–M22
  语言面/多文件/效应。**M23 起 `vuna interp` 也走 DT 核心求值**（`--dt` 移除，
  `check --dt` / `compile --dt` 是语言夹具唯一检查路径）。**当前阻碍按阶段登记在
  [docs/roadmap.md](../roadmap.md)**；仍是边界的几条：
  - **单文件 / 无库模式没有隐式 `Bool`**：`--dt` 单文件程序用 `True`/`False` 需自己
    `data Bool`（与 `List` 约定一致）；`Bool` 类型名仍是 prelude 类型别名（内建 trait
    签名需要），数据定义在包模式下以 `Base.Bool` 为权威。
  - **DT 输出尚非逐模块 `Split`**：`build --dt` / `--split` / `seed --dt` 产**整程序单文件**
    `main.ml` + `build.sh`，逐模块切分与 `seed/` 轮换留 M24；`seed --dt` 必须显式 OUT
    且拒绝写 `seed/`。
  - **擦除由 rig 判据驱动**：`Rig0`（隐式 binder / `Type` 域）不进运行时表示，`Rig1`
    （显式值、显式索引 `(n : Nat)`）保留字段（`17_erase` / `dt/38_explicit_index` 锁定
    两侧）；不做整程序使用分析，「想擦但被读」的显式索引不会自动擦除（可改成隐式
    `{n : Nat}`，代价是分支体读不到）。详见 [m16-design.md](m16-design.md) §3。
  - **终止性只接受结构递归**：递归调用必须是形参的真子项；`sortBy le (take half xs)`
    这类要改写成结构递归（`Base.Sort` 已改插入排序），互递归与跨调用 size-change 不查。
  - **`where` 语法在终态不保留**：DT 把 `where` 解析成带 lambda 的 `ELet`，精化器不能在
    无期望类型时推断 lambda；M23 已把夹具改写为等价顶层 helper，M24 随 HM 删除 parser /
    `Fmt` 的 `where` 支持（`fmt` 的 where 格式夹具届时删除）。
  - **`vuna interp` 不执行效果**：任何 `main : IO a` 一律报
    `DT: interp cannot execute effects (main : IO a); compile and run the program instead`
    （退出码 2），不做「纯动作求值、效果丢弃」的区分；需要效果时用 `compile` + 运行产物。
    `vuna test` / `vuna repl` 走同一求值器。
  - **REPL 定义必须先写签名**：交互式定义也要先输入 `x : Int` 再输入 `x = 1 + 1`；
    表达式走 DT 表达式接口（推断表达式类型后求值）。
  - **除零语义**：核心求值器对 `a / 0` **不归约**（`interp` 报 `main does not reduce to a
    value`），`compile --dt` 产物运行时 `failwith "division by zero"`（未捕获异常，退出码
    2）；测试改为 `compile --dt` + 运行断言（`run_err/03_div_zero`）。
  - **`main` 的数据值展示限制**：`interp` 只展示 `Int`/`String`/`Bool`（`show` 语义，
    字符串带引号）；返回 data/record 的 `main` 报 `main does not reduce to a value`。
    M23 起夹具的 `main` 已改为 `Int`/`String`（数据覆盖点留在被调函数里）。
  - **`strUnpack`/`strPack` 在核心求值器不归约**：codegen 侧 M23 已补齐（无 `List` 族时
    映射 `bi_strUnpack`/`bi_strPack`），但 interp 不归约；相关夹具用 `.nointerp` 标记。
  - **参数化 data 的派生实例**：`deriving (Eq)` 可用但走通用结构比较兜底（需要 `Eq` 字典
    的场景如 `mem (List (Maybe2 Int))` 仍可能缺实例）；`deriving (Show)` / `(Ord)` 只支持
    非参数化类型（参数化时显式报错）。
  - **命名实例 `@inst` 不参与自动实例搜索**：default 实例按 (trait, 类型) 唯一；命名实例
    只能用 `@name` 显式选择（`@M.name` 需已导入）。
  - **高阶 kind 与多隐式参数的推断**：高阶 kind 的 **check** 已支持（`m a` 推断
    `m : Type -> Type`）；含多隐式参数字典的 `do` 程序核心求值不归约、擦除 codegen 也
    尚未支持（`monad/04_kind_generic` 用 `.nointerp` + `.nocompile`，只断言 `check --dt`；
    interp/codegen 留 M24 修 liftFreeDictGoals）。
  - **延迟字典目标的最终诊断**：类参数始终未解时报 `unsolved metavariable`（而非「缺
    实例」）；`missingInstance` 级诊断细化留待后续。**DT 要求顶层定义有类型签名**：M23 已
    回填全仓签名，新增代码同样要写，否则报 `DT: expected a type signature for ...`。
  - **高阶/开放元变量解**：`solveMetaHo` 覆盖常见形状（M20.5），其余仍受限。
  完整 DT 主线见 [docs/roadmap.md](../roadmap.md)、设计边界见 [docs/dt-core.md](../dt-core.md)、
  工具链见 [dt-tooling.md](dt-tooling.md)；种子轮换是手动流程（发版/不兼容变更时），日常
  工具链改动不需要 rotation；`test/run-tests.sh` 以 golden 比对为主。

## main 与 IO（M12.6）

- 可执行入口（`vuna build` / `--split` / `seed`）要求 `main : IO a`，由运行时执行动作
  （没有公开的 `runIO` / `unsafeRunIO`）；普通用户包不能直接调用 effectful 内建
  （`print` / `readFile` / `exit` / ...），只能经 `Base.IO`（编译器 / 产品 CLI /
  `vuna-base` 自身在包级 allowlist 内）；`vuna interp` / `vuna test` / `--root` 的**入口
  文件**同样禁止直接调用 effectful 内建（只有被加载的 base/compiler 模块内部可用）。
  M23 起 `vuna interp` 只做**纯**核心求值：任何 `main : IO a` 一律报错并提示 `compile` +
  运行产物；纯 `main : Int/String/Bool` 结果 show 仍保留为调试约定。IO 组合统一用
  `Functor`/`Monad` trait（`fmap`/`bind`/`pure`、`>>=`、`do`），不再导出
  `bindIO`/`pureIO`/`fmapIO`；效果 API 直接返回 IO，内部由不导出的 `prim_*` 原语实现。
  当前 `IO` 仍是库层 thunk 表示，不是完整的 effect 类型系统（见 [docs/roadmap.md](../roadmap.md)）。
- IO 失败（如 `readFile` 缺失文件）抛宿主异常，但入口文件缺失返回普通错误；CLI 用 `exit`
  内建返回非 0 退出码（compile 错误 1、lint 有 finding 1、用法/解析/IO 错误 2）。

## 工具链细节

- M11.6 fmt 限制：行宽 100，但模块头/导出列表、类型签名与超长字符串字面量不折行；表达式
  内部的注释会前移到最内层包含它的条目（或下一条目），不保证留在原位置；单行块注释可挂
  行尾，多行块注释只作前置注释。
- M11.5 工具链限制：REPL 一次只接受一行（多行定义/表达式需后续扩展）；`vuna test` 经
  `Vuna.Interp` 用 DT 核心求值器（不执行效果；代码生成路径由 `test/run-tests.sh` 覆盖）；
  REPL 的顶层定义必须**先写签名**（DT 签名必填）；依赖只支持本地路径（registry/锁文件
  未做）；`Map` 是关联表实现的抽象类型（无平衡树）；`Result` 暂无 Functor/Monad 实例。
- `vuna lint` 首批规则是保守子集：lambda 体内的冗余 `case` 不报告（lambda 参数只有变量
  名）；只处理从行首 `if` 起始的规范布局；多行分支 if 链、非最后子句/alt 上的冗余 `case`
  只报告不自动修复；`--fix` 遇到注释、tab、CRLF 也跳过。`vuna lint` **必须显式给路径**，
  无参数是用法错误（退出码 2）。
- `vuna fmt --check` 省略 PATH 时按 workspace 包约定扫描各包 `lib/app/test`；若某包缺其中
  某个目录（本仓库 `compiler/` 没有 `test/`、`base/` 没有 `app/`），当前会抛
  `Failure("isDirectory: ...")`。**workaround：显式给 PATH**（`checks.vuna-package` 的
  fmt 检查都是显式传目录）。

## 命名与构建（M12.8）

- 标准库包名 `vuna-base`、模块根 `Base.*`，编译器模块 `Vuna.Compiler.*`（门面
  `Vuna.Compiler.Common`）；包模式自动导入 `Prelude`，原始 `--root` 模式不导入（保持
  自举/夹具的显式 import 语义）；`vuna build` 需要 PATH 中有 `ocamlopt`，库包先用
  `vuna compile --package` 生成 `.output/lib/`；`Prelude` 刻意不含 `Base.IO` 效果函数。

## M23 迁移期（DT 路径，2026-11）

- **`vuna interp` 已默认 DT**：`--dt` 移除，效果程序不能 interp（见上）；语言夹具只走
  `check --dt` / `compile --dt` / `interp`，效果/不可归约夹具用 `.nointerp` 标记只跑
  `compile --dt` + 运行。HM（`Typecheck` / `TypedCodegen`）保留为源码自检与包构建路径到 M24。
- 覆盖率（穷尽性/冗余）检查对 TCB 三包（`vuna` / `vuna-compiler` / `vuna-base`）**只告警
  不报错**（编译器源码是执行代码，HM 路径本来就只告警、OCaml 用 `-w -a`）；用户包与夹具
  仍严格。终止性检查同机制（`dtTrustsTermination`）。
- `==` / `/=` 无 `Eq` 实例时退回泛型结构比较（见 [type-system.md](type-system.md)）；
  「比较函数/不可结构比较的值」在无实例时是运行时未定义行为，而不是编译错误。单文件 DT
  的 `List` 若由程序自己声明，`getArgs` / `readDir` 等效果内建返回的列表由 codegen 桥接
  回该族；没有声明 `List` 的单文件程序不能使用这些内建。
- `check --dt .` 目前约 13s（`--dt compiler` 约 7s，编译器闭包 1900+ 定义）；作用域逃逸
  检查只查新增解 + 程序级兜底一次。

## 已完成阶段（细节见 history）

- M12.7 / M12.8 / M13 / M14 已完成：删除 dynamic codegen 与旧开关；标准库/编译器命名空间
  收敛、`Prelude` 自动导入与 `.output` 包级构建；DT 地基（Core TT + 精化器 + 单文件
  `--dt`）之后落地索引归纳族与依赖模式匹配；依赖类型主线（M13–M18）见
  [docs/roadmap.md](../roadmap.md)；每个阶段的细节见 [docs/history.md](../history.md)。