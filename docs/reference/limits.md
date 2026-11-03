# 限制与已知边界

本文汇总当前实现的限制与边界条件（原 README「限制与路线」节迁入）。后续规划见
[docs/roadmap.md](../roadmap.md)，逐条债务 / 缺陷与所属阶段见 [debt.md](debt.md)，
DT 设计见 [docs/dt-core.md](../dt-core.md)。

## 编译模型

- 只有一条编译链：`Loader → DT 精化（Elab） → 擦除 codegen（Codegen）`。
  `check` / `compile` / `build` / `seed` 与语言夹具全部走它，没有可切换的检查器。
- codegen 只用 OCaml 标准库、不依赖解释循环；已做 Kosaraju SCC 分组、比较运算符
  特化（`bi_eq_int` 等）、`&&`/`||` 短路降级、零参顶层定义 thunk 化。
- 输出模型有两种：**单文件**（`vuna compile` 产一个 `.ml`；`vuna build` 产
  `.output/main.ml` + `build.sh` + `bin/<包名>`）与**逐模块 split**（`vuna build --split
  OUT`、`vuna seed OUT` → 依赖序 `<Module>.ml` + `build.sh`，**不生成 `.mli`**）。
  单文件路径是 split 的回归基线（两者产物行为按夹具对拍）。
- 构建：`build.sh` 的增量粒度是模块（`.ml`/`.cmx` 及依赖 `.cmi` 时间戳），无跨包并行
  与依赖哈希；split 不回退：无法归属到模块的声明报清晰错误，不会静默丢弃或改用单文件
  输出。基准测量仍手动（`nix run .#vuna-bench`），CI 只守机器无关指标。
- 编译器是独立成员包 `vuna-compiler`，`seed/` 只由 compiler 包入口闭包生成，工具链
  不在 TCB；产品 CLI `vuna` 是单一二进制（in-process 调 compiler 库，不 fork
  `vuna-compiler`）；`vuna build` 通过受限进程执行内建（`prim_runIn`）调 ocamlopt 编
  `.output/main.ml`（同时产出 `.output/build.sh` 供手动重建），不是 vuna 进程转发；
  LSP / package manager / Index 在根包侧，**永不进入 seed 闭包**。
- `do` / Monad / IO 组合子已在 M11 实现；DT 自 M13 起步，M14 索引族、M15 隐式/
  接口/洞、M16 终止性、M17 工具链、M18.5–M18.6 擦除修复与表示层定型、M19–M22
  语言面/多文件/效应、M23 夹具迁移与 `interp` 核心求值、M24 单路径收尾、M24.5 等式
  搬运、M24.6 编译器本体最小重构、M24.7 trait 库化。**当前阻碍按阶段登记在
  [docs/roadmap.md](../roadmap.md)**。仍是边界的几条：
  - **单文件 / 无库模式没有隐式 `Bool`**：单文件程序用 `True`/`False` 需自己
    `data Bool`（与 `List` 约定一致）或经 `Prelude` 使用 `Base.Bool`；`Bool` 类型名仍
    是 prelude 类型别名（prelude 里 `==` / 比较的签名需要），数据定义在包模式下以
    `Base.Bool` 为权威。
  - **擦除由 rig 判据驱动**：`Rig0`（隐式 binder / `Type` 域）不进运行时表示，`Rig1`
    （显式值、显式索引 `(n : Nat)`）保留字段（`17_erase` / `dt/38_explicit_index` 锁定
    两侧）；不做整程序使用分析，「想擦但被读」的显式索引不会自动擦除（可改成隐式
`{n : Nat}`，代价是分支体读不到）。详见 [dt-core.md](../dt-core.md) §6。
  - **终止性：结构下降 + 守卫 Int（M25.2a/M25.2b）**：递归调用（含互递归组内
    调用）必须在某个固定测度位置上递减；测度可以是形参的真子项（含嵌套构造子模式、
    `case` 分支、`f v` 形式的单 clause 投影/accessor），或**带守卫的 Int**：
    `n - k`（k>0）且能证明 `n > 0`——证据来自 `if n <= 0 then … else …` 的 else 区，
    或 SCC 入口假设（组内某函数的该形参在**所有**调用点都收到正数，可经 `normalize fuel`
    这类同 fuel 转发传播）。无守卫的 `n - 1`、升序 `i + 1`（有界计数器规则尚未实现）
    与无下降的互递归仍会被拒；HOF 递归（`map (\x => f x)`）、`where` 绑定体里调外层
    函数、`Cons x (f x)` 这类藏在实参里的递归都会被检查（旧实现只递归函数头，这些是
    静默通过）。每个 SCC 的每个环都必须有严格下降边（去掉严格边后无环）。
    **没有包级豁免之外的分层**：依赖模块与入口模块用同一套判据；基库为此改了两处
    实现（`Base.List.range` 改倒计数、`Base.String.split` 两段递归共享显式 fuel）。
    编译器包（`Vuna.Compiler.*`）仍由包级 trust 跳过终止性检查，其 conv/eval/parser
    等递归留给 M25.2c（详见 [debt.md](debt.md)）。
  - **`where` 绑定必须写签名且是顺序 let**：每个绑定都要在子句前写签名（缺签名报
    `DT: where binding ... needs a type signature`），只能引用之前的绑定——不支持前向
    引用 / 自递归 / 互递归（引用报 `DT: unknown name ...`），递归与互相引用放顶层定义组。
    通配绑定 `_ = expr` 无法写签名，因此也会报缺签名诊断。语法见
    [language.md](language.md)。
  - **`vuna interp` 不执行效果**：任何 `main : IO a` 一律报
    `DT: interp cannot execute effects (main : IO a); compile and run the program instead`
    （退出码 2），不做「纯动作求值、效果丢弃」的区分；需要效果时用 `compile` + 运行产物。
    `vuna test` / `vuna repl` 走同一求值器。
  - **REPL 定义必须先写签名**：交互式定义也要先输入 `x : Int` 再输入 `x = 1 + 1`；
    表达式走 DT 表达式接口（推断表达式类型后求值）。
  - **除零语义**：核心求值器对 `a / 0` **不归约**（`interp` 报 `main does not reduce to a
    value`），`compile` 产物运行时 `failwith "division by zero"`（未捕获异常，退出码
    2）；测试用 `compile` + 运行断言（`run_err/03_div_zero`）。
  - **`main` 的数据值展示限制**：`interp` 只展示 `Int`/`String`/`Bool`（`show` 语义，
    字符串带引号）；返回 data/record 的 `main` 报 `main does not reduce to a value`。
    夹具的 `main` 用 `Int`/`String`（数据覆盖点留在被调函数里）。
  - **`strUnpack`/`strPack` 在核心求值器不归约**：codegen 侧已补齐（无 `List` 族时
    映射 `bi_strUnpack`/`bi_strPack`），但 interp 不归约；相关夹具用 `.nointerp` 标记。
  - **单文件 / 裸 `--root` 模式需显式 import trait 模块（M24.7）**：`Prelude` 不自动
    注入，`Show` / `Eq` / `Ord` 及其实例需要 `--root <repo>/base/lib` 并在文件头
    `import Prelude`；只用 `Int`/`String` 原语或泛型兜底比较的夹具可以省略 import；
    包目录模式仍自动导入 `Prelude`。
  - **`==` / 比较在无实例时的兜底**：具体类型没有可用 `Eq` 实例时 `==` / `/=` 退回
    运行时结构比较（`bi_eq_generic`）；程序里没有 `Eq` 类（单文件 / 未 import）同样
    退回。刚性类型变量保持 M22 语义（搜不到实例时提升成隐式字典参数，实例优先）。
    `<` / `<=` / `>` / `>=` 只对 `Int` 做运行时特化、`String`/`Bool` 走泛型运行时；
    **其它具体类型**（含用户 `data`）必须走 `Ord` 字典，无 `Ord` 类时同样退回泛型比较。
  - **`deriving` 对参数化 data 仍只支持 `Eq`**：`deriving (Eq)` 可用（走通用结构比较
    兜底，需要 `Eq` 字典的场景如 `mem (List (Maybe2 Int))` 仍可能缺实例）；
    `deriving (Show)` / `(Ord)` 只支持非参数化类型（参数化时显式报错）。
  - **OCaml 保留字**：codegen 只对 lambda binder 的裸标识符加 `_` 后缀转义
    （`method` / `type` 等可以作 vuna 标识符）；用户值 / 类型 / 构造子名分别有
    `v_` / `t_` / `C_` 前缀，不会撞 OCaml 保留字。
  - **类型族（结果以 `Type` 收尾的 Pi 链，如 `sel : Nat -> Type`）整体擦除（M24.6）**：
    不生成运行时定义；在运行时定义里把擦除的族参数当值用报错
    （`dt_err/39_type_family_runtime_use`）。
  - **等式搬运边界（M24.5）**：隐式**值**参数 `{x : a}` 不支持（类型/值参数都要写显式）；
    构造子当函数值部分应用不参与 `conv`（`cong ... Succ ...` 与饱和 `VCon` 对不上，
    可用 lambda 或包装函数绕过）；`Ctx n -> Fin n -> Tm n` 这类**依赖索引取值**仍写
    不出（按位置变化的类型族没有表达手段）；空族判定在索引含中性项时保守。详见
    [dt-parity.md](dt-parity.md) §6.3。
  - **命名实例 `@inst` 不参与自动实例搜索**：default 实例按 (trait, 类型) 唯一；命名实例
    只能用 `@name` 显式选择（`@M.name` 需已导入）。
  - **高阶 kind 与多隐式参数的推断**：高阶 kind 的 **check** 已支持（`m a` 推断
    `m : Type -> Type`）；含多隐式参数字典的 `do` 程序核心求值不归约、擦除 codegen 也
    尚未支持（`monad/04_kind_generic` 用 `.nointerp` + `.nocompile`，只断言 `check`；
    interp/codegen 待修 `liftFreeDictGoals`）。
  - **延迟字典目标的最终诊断**：类参数始终未解时报 `unsolved metavariable`（而非「缺
    实例」）；`missingInstance` 级诊断细化留待后续。**DT 要求顶层定义有类型签名**：新增
    代码同样要写，否则报 `DT: expected a type signature for ...`。
  - **高阶/开放元变量解**：`solveMetaHo` 覆盖常见形状（M20.5），其余仍受限。
  - **覆盖率与终止性对所有包一致执行**：M25 已删除按包名跳过检查的豁免；编译器、base
    与工具链源码通过 SCT + 显式 fuel/结构递归达标，不再有「可信包静默跳过」路径。
    工具链/前端/加载器的状态机用输入规模线性 fuel 或内存内不可达上界（debt C26/C27/C28），
    正常输入不触发；触发时是明确的 internal 错误，不会静默改变语义。
  - **单文件 `List` 桥接**：单文件程序的 `List` 若由程序自己声明，`getArgs` / `readDir`
    等效果内建返回的列表由 codegen 桥接回该族；没有声明 `List` 的单文件程序不能使用
    这些内建。
  完整 DT 主线见 [docs/roadmap.md](../roadmap.md)、设计边界见 [docs/dt-core.md](../dt-core.md)、
  工具链见 [dt-tooling.md](dt-tooling.md)；种子轮换是手动流程（发版/不兼容变更时），日常
  工具链改动不需要 rotation；`test/run-tests.sh` 以 golden 比对为主。

## main 与 IO（M12.6）

- 可执行入口（`vuna build` / `--split` / `seed`）要求 `main : IO a`，由运行时执行动作
  （没有公开的 `runIO` / `unsafeRunIO`）；普通用户包不能直接调用 effectful 内建
  （`print` / `readFile` / `exit` / ...），只能经 `Base.IO`（编译器 / 产品 CLI /
  `vuna-base` 自身在包级 allowlist 内）；该 allowlist 按**包名字符串**判定、可伪造，
  raw `--root` 的依赖模块也能绕过——debt **B16**，M25/M27 改为 capability / 显式声明。
  `vuna interp` / `vuna test` / `--root` 的**入口文件**同样禁止直接调用 effectful 内建
  （只有被加载的 base/compiler 模块内部可用）。
  `vuna interp` 只做**纯**核心求值：任何 `main : IO a` 一律报错并提示 `compile` +
  运行产物；纯 `main : Int/String/Bool` 结果 show 仍保留为调试约定。IO 组合统一用
  `Functor`/`Monad` trait（`fmap`/`bind`/`pure`、`>>=`、`do`），不导出
  `bindIO`/`pureIO`/`fmapIO`；效果 API 直接返回 IO，内部由不导出的 `prim_*` 原语实现。
  当前 `IO` 仍是库层 thunk 表示，不是完整的 effect 类型系统（见 [docs/roadmap.md](../roadmap.md)）。
- IO 失败（如 `readFile` 缺失文件）抛宿主异常，但入口文件缺失返回普通错误；CLI 用 `exit`
  内建返回非 0 退出码（compile 错误 1、lint 有 finding 1、用法/解析/IO 错误 2）。

## 工具链细节

- M11.6 fmt 限制：行宽 100，但模块头/导出列表、类型签名与超长字符串字面量不折行；表达式
  内部的注释会前移到最内层包含它的条目（或下一条目），不保证留在原位置；单行块注释可挂
  行尾，多行块注释只作前置注释。`where` 块的绑定签名行按源码顺序保留、幂等。
- M11.5 工具链限制：REPL 一次只接受一行（多行定义/表达式需后续扩展）；`vuna test` 经
  `Vuna.Interp` 用 DT 核心求值器（不执行效果；代码生成路径由 `test/run-tests.sh` 覆盖）；
  REPL 的顶层定义必须**先写签名**（DT 签名必填）；依赖只支持本地路径（registry/锁文件
  未做）；`Map` 是关联表实现的抽象类型（无平衡树）；`Result` 暂无 Functor/Monad 实例。
- `vuna lint` 首批规则是保守子集：lambda 体内的冗余 `case` 不报告（lambda 参数只有变量
  名）；只处理从行首 `if` 起始的规范布局；多行分支 if 链、非最后子句/alt 上的冗余 `case`
  只报告不自动修复；`--fix` 遇到注释、tab、CRLF 也跳过。`vuna lint` **必须显式给路径**，
  无参数是用法错误（退出码 2）。
- `vuna fmt --check` 省略 PATH 时按 workspace 包约定扫描各包 `lib/app/test`（缺目录的
  崩溃已修）；但**非包目录 / 不存在路径仍会抛宿主异常**（如
  `Failure("readFile: lib")`），`vuna map` 在同类场景会静默输出空结果。登记 debt **C12**，
  M30 在 CLI 错误层统一改成可操作诊断。`vuna doc` 也忽略包的 `[export]`（输出全部模块），usage 已删除未实现的注释开关——
  debt **C13**，M30 修。

## 命名与构建（M12.8）

- 标准库包名 `vuna-base`、模块根 `Base.*`，编译器模块 `Vuna.Compiler.*`（门面
  `Vuna.Compiler.Common`）；包模式自动导入 `Prelude`，原始 `--root` 模式不导入（保持
  自举/夹具的显式 import 语义）；`vuna build` 需要 PATH 中有 `ocamlopt`；`Prelude`
  刻意不含 `Base.IO` 效果函数。

## 已完成阶段（细节见 history）

- M12.7 / M12.8 / M13–M24.7 已完成：删除 dynamic codegen 与旧开关；标准库/编译器命名
  空间收敛、`Prelude` 自动导入与 `.output` 构建；DT 地基与全部语言能力落地；单路径
  收尾（删除第二套检查器、seed 改由 DT split codegen 生成）；M24.5 等式搬运、M24.6
  编译器本体最小重构、M24.7 `Show`/`Eq`/`Ord` 库化。依赖类型主线（M13–M18）见
  [docs/roadmap.md](../roadmap.md)；里程碑历史见 [docs/history.md](../history.md)
  （实现细节在 git 历史）。