# 限制与已知边界

本文汇总当前实现的限制与边界条件（原 README「限制与路线」节迁入）。后续规划见
[docs/roadmap.md](../roadmap.md)，逐条债务 / 缺陷与所属阶段见 [debt.md](debt.md)，
DT 设计见 [docs/dt-core.md](../dt-core.md)。

## 编译模型

- 只有一条编译链：`Loader → DT 精化（Elab） → 擦除 codegen（Codegen）`。
  `check` / `compile` / `build` 与语言夹具全部走它，没有可切换的检查器。
- codegen 不依赖解释循环；已做 Kosaraju SCC 分组、比较运算符
  特化（`bi_eq_int` 等）、`&&`/`||` 短路降级；**零参顶层定义求值一次**（M26：直接
  `let v_x = body`，不再包 thunk、调用点也不再补 `()`）。生成的 runtime
  （`Vuna_runtime.ml`）**无条件**内嵌 Unix（`Unix.stat` / `gettimeofday` /
  `readlink "/proc/self/exe"`），`build.sh` 无条件链接 `unix.cmxa`——见
  [primitives.md](primitives.md) 的 runtime 契约。
- 输出模型只有一种：**逐模块 split**（`vuna compile ENTRY OUTDIR` 与
  `vuna build` 都产依赖序的 `<Module>.ml` + `Vuna_runtime.ml` + `Main.ml` + `build.sh`，
  **不生成 `.mli`**）。`compile` 只 codegen 到目录、成功静默；`build` 默认输出到 `<PKG-DIR>/.output`（PKG-DIR 缺省当前目录，
  `--out DIR` 可改），随后执行 `build.sh` 链接出 `DIR/bin/<包名>`。
  单文件 `.ml` 产物、`--split` 开关与 `seed` 子命令（原 A01/A15）已删除。
- 构建：`build.sh` 的增量粒度是模块（`.ml`/`.cmx` 及依赖 `.cmi` 时间戳），无跨包并行
  与依赖哈希；split 不回退：无法归属到模块的声明报清晰错误，不会静默丢弃。
  基准测量仍手动（`nix run .#vuna-bench`），CI 只守机器无关指标。
- 编译器是独立成员包 `vuna-compiler`，`seed/` 只由 compiler 包入口闭包生成，工具链
  不在 TCB；产品 CLI `vuna` 是单一二进制（in-process 调 compiler 库，不 fork
  `vuna-compiler`）；`vuna build` 在 codegen 后执行生成的 `build.sh`（受限进程执行内建
  `prim_runIn` 调 `ocamlopt`），不是 vuna 进程转发；
  LSP / package manager / Index 在根包侧，**永不进入 seed 闭包**。
- `do` / Monad / IO 组合子已在 M11 实现；DT 自 M13 起步，M14–M24.7 补齐索引族/隐式/
  终止性/工具链/擦除/语言面/单路径收尾与 trait 库化，M25–M29 依次完成健全性基建、单一
  装配、内置与效应边界、类型系统地基、相等/实例/证明 ergonomics（各里程碑一句话状态见
  [docs/roadmap.md](../roadmap.md)，历史见 [docs/history.md](../history.md)）。
  **当前阻碍按阶段登记在 [docs/roadmap.md](../roadmap.md)**。仍是边界的几条：
  - **身份按声明符号判定（M27）**：`Int` / `String` 是 language primitive 类型；`Bool` /
    `List` / `IO` 是 base 的普通 `data` 声明，canonical 身份分别是 `Base.Bool.Bool` /
    `Base.List.List` / `Base.IO.IO`。没有短名判定、没有 prelude 桩、没有全局构造子放行；
    用户同名 `data` 是普通声明。原语语义与身份常量表见 [primitives.md](primitives.md)。
  - **擦除由单一判据驱动（M28）**：`Elab.Meta.isTypeDomain`/`binderRig` 是唯一入口——隐式
    binder 恒 `Rig0`，显式 binder 仅当域在类型层（宇宙或域全为类型层的 Pi 链）才 `Rig0`，
    其余 `Rig1`。**索引擦除策略=写成隐式 binder**：隐式索引 `{n : Nat}` 无运行时字段，
    显式索引 `(n : Nat)` 保留字段（`dt/17_erase` / `dt/38_explicit_index` 锁定两侧）；
    不做整程序使用分析，「想擦但被读」的显式索引不会自动擦除（改成隐式即读不到该值）。
    详见 [dt-core.md](../dt-core.md) §6 与 [dt.md](dt.md)。
  - **宇宙严格分层、非累积（M28）**：`Type i : Type (i+1)`，Pi formation `max(i,j)`，
    `Type i ≠ Type j`，无 subtyping/cumulativity；data kind 必须是 Pi 链 → `Type l`，
    构造子**字段 binder** 的域 sort 必须 ≤ 族层级（`data D : Type where Mk : Type -> D`
    被拒，改住 `Type 1` 即可；族参数/索引不受限）。累积性/宇宙多态归研究。
  - **终止性：结构下降 + 守卫 Int（M25.2a/M25.2b）**：递归调用（含互递归组内
    调用）必须在某个固定测度位置上递减；测度可以是形参的真子项（含嵌套构造子模式、
    `case` 分支、`f v` 形式的单 clause 投影/accessor），或**带守卫的 Int**：
    `n - k`（k>0）且能证明 `n > 0`——证据来自 `if n <= 0 then … else …` 的 else 区，
    或 SCC 入口假设（组内某函数的该形参在**所有**调用点都收到正数，可经 `normalize fuel`
    这类同 fuel 转发传播）。无守卫的 `n - 1`、升序 `i + 1`（有界计数器规则尚未实现）
    与无下降的互递归仍会被拒；HOF 递归（`map (\x => f x)`）、`where` 绑定体里调外层
    函数、`Cons x (f x)` 这类藏在实参里的递归都会被检查（旧实现只递归函数头，这些是
    静默通过）。每个 SCC 的每个环都必须有严格下降边（去掉严格边后无环）。
    **没有包级豁免**：依赖模块、入口模块与编译器包用同一套判据；基库为此改了两处
    实现（`Base.List.range` 改倒计数、`Base.String.split` 两段递归共享显式 fuel）。
  - **`where` 绑定必须写签名且是顺序 let**：M28 起 `let`/`where` 共用同一绑定块解析与
    同一个签名 gate：`let` 的签名行可选（缺省推断）、支持子句糖；`where` 仍要求每个绑定
    在子句前写签名（缺签名报 `DT: binding ... needs a type signature`）。只能引用之前的
    绑定——不支持前向引用 / 自递归 / 互递归，递归与互相引用放顶层定义组。通配绑定
    `_ = expr` 无法写签名，因此也会报缺签名诊断。语法见 [language.md](language.md)。
  - **`vuna interp` 不执行效果**：任何 `main : IO a` 一律报
    `DT: interp cannot execute effects (main : IO a); compile and run the program instead`
    （退出码 2），不做「纯动作求值、效果丢弃」的区分；需要效果时用 `compile` + 运行产物。
    `vuna test` / `vuna repl` 走同一求值器。
  - **REPL 定义必须先写签名**：交互式定义也要先输入 `x : Int` 再输入 `x = 1 + 1`；
    表达式走 DT 表达式接口（推断表达式类型后求值）。
  - **除零语义**：核心求值器对 `a / 0` **不归约**（`interp` 报 `main does not reduce to a
    value`），`compile` 产物运行时 `failwith "division by zero"`（未捕获异常，退出码
    2）；测试用 `compile` + 运行断言（`run_err/03_div_zero`）。这是显式分类而非静默 0，
    完整边界见 [primitives.md](primitives.md) 的 interp 归约边界。
  - **`main` 的数据值展示限制**：`interp` 只展示 `Int`/`String`/`Bool`，与产物同一展示
    语义（`String` 走 `strShow` 转义，见 [primitives.md](primitives.md)）；返回
    data/record 的 `main` 报 `main does not reduce to a value`。夹具的 `main` 用
    `Int`/`String`（数据覆盖点留在被调函数里）。
  - **interp 不归约的原语按类分类**：返回/接收 `List` 的 `strUnpack` / `strPack` /
    `strConcatMany` / `strSubstTemplate`（List 桥接依赖 `Base.List.List` 构造子表示）、
    `/0`、以及全部效果原语；其余 `str*`（`strFromInt` / `strLength` / `strHash` /
    `strAt` / `strShow`）已实现且与 runtime 同公式。相关夹具用 `.nointerp` 标记。
  - **`Prelude` 自动注入（M24.7/M26）**：包上下文内所有源文件（含 ad-hoc 单文件）自动
    导入 `Prelude`，`Show` / `Eq` / `Ord` 及其实例开箱可用；显式 `import` 仍可补充。
    缺 import 的诊断只在显式绕开 `Prelude` 的上下文出现。
  - **`==` / `/=` 是证据驱动的（M29 定稿，无泛型兜底）**：只有两条路径——`Int` /
    `String` 内建特化，或 `Eq` 证据（字典：手写实例、`deriving`、约束实例）。具体类型
    没有实例、函数类型相等、`Eq` 类不在作用域，都在 `check` 期报错；不存在「运行时
    结构比较兜底」，interp 与编译产物也没有第二套相等算法。刚性类型变量保持 M22 语义
    （搜不到实例时提升成隐式字典参数，实例优先）。
    `<` / `<=` / `>` / `>=`：`Int` 内建特化、`String` / `Bool` 保留泛型运行时，其它
    类型必须有 `Ord` 证据，无实例 / 无类在 check 期报错。
  - **约束实例与参数化 `deriving`（M29）**：`instance Eq a => Eq (Box a)` 可用（实例
    def 带隐式类型参数 + ctx 字典参数，搜索递归解 ctx）；`deriving (Show, Eq, Ord)`
    对参数化 data 同样可用（按 data 参数生成 ctx）。`mem (Box 1) [...]` 这类需要
    `Dict_Eq (Box Int)` 的用法因此不再是边界；`List a` / `Maybe a` 等容器的实例仍需
    显式声明（Base 只带 `Int` / `String` / `Bool` 的实例）。
  - **OCaml 保留字**：codegen 只对 lambda binder 的裸标识符加 `_` 后缀转义
    （`method` / `type` 等可以作 vuna 标识符）；用户值 / 类型 / 构造子名分别有
    `v_` / `t_` / `C_` 前缀，不会撞 OCaml 保留字。
  - **类型族（结果以 `Type` 收尾的 Pi 链，如 `sel : Nat -> Type`）整体擦除（M24.6）**：
    不生成运行时定义；在运行时定义里把擦除的族参数当值用报错
    （`dt_err/45_generic_sigma_runtime`）。
  - **axiom 与命名空间（M28）**：`axiom name : Ty` 是无运行时定义的擦除/类型层声明，
    运行时（非擦除位置）使用报 `CG_AxiomAtRuntime`；限定名 `M.typeConst` 可在类型位置
    引用（裸小写名仍按隐式类型变量处理，跨模块类型位置引用请用限定名）。同模块
    `data T` 与 `def T` 同名仍不支持（需 Elab globals 按命名空间拆表），归 F1 收尾。
  - **等式搬运与证明 ergonomics（M24.5 / M29）**：隐式**值**参数 `{x : a}` 已支持
    （M29/B09；隐式 binder 恒擦除，值只进类型/索引/证明位置，子句体不能按名字引用；
    隐式模式 `{p}` 与 `auto`/隐式等式搜索归 F4）；构造子当函数值部分应用可参与 `conv`
    （M29 η 展开，`cong ... Succ ...` 直接可用）；`Ctx n -> Fin n -> Tm n` 这类**依赖
    索引取值**用 **Tarski 式存在式**（运行时类型码 `Ty` + 指标族 `Tm : Ty -> Type` +
    `Some`）表达（`dt/62_sigma_basic` / `dt/63_dep_lookup`，B13 以此关闭）；**泛型 Σ 的
    值级构造仍是边界**（类型不能依赖运行时值），归 F4。空族判定在索引含中性项时仍保守。
    详见 [dt-parity.md](dt-parity.md) §6.3。
  - **命名实例已删除（M29）**：`as name` / `@name` 不再存在；实例按 head 全局唯一
    （相干性），重复报 `duplicate instance`；孤儿实例（trait 与类型都不在本模块定义）
    仍被拒。
  - **type-as-value（M29 决策）**：**不引入 type codes**；Type 级等式走擦除的 `Eq` 证据
    + `cast` 组合子；把类型放到**运行时位置**仍被擦除检查拒（`CG_TypeUsedAtRuntime` /
    `CG_TypeLevelBindingRuntime` / `CG_TypeLevelNameRuntime`）。
  - **高阶 kind 与多隐式参数字典**：高阶 kind 的 **check** 已支持（`m a` 推断
    `m : Type -> Type`）；M29 修掉 `liftFreeDictGoals` 的字典 binder 位置 bug（C05），
    `monad/04_kind_generic` 已去掉 `.nointerp` / `.nocompile`，check/interp/compile+运行
    全过。含多隐式参数字典的 `do` 程序不再是边界。trait 多参数 / 默认方法 / 父类 /
    关联类型归 F4（M29 终态是单参数 trait + 约束实例）。
  - **延迟字典目标的最终诊断**：类参数始终未解时报 `unsolved metavariable`（而非「缺
    实例」）；`missingInstance` 级诊断细化留待后续。**DT 要求顶层定义有类型签名**：新增
    代码同样要写，否则报 `DT: expected a type signature for ...`。
  - **高阶/开放元变量解（M28）**：Miller pattern unification 已落地（局部变量 spine → λ
    抽象）；非 pattern 形状（如 meta-spine flex-flex `?m ?n = Maybe Json`）仍走保守
    head 提取兜底，其余报 `TC_CannotSolveHigherOrder`。完整高阶合一属研究项。
  - **覆盖率与终止性对所有包一致执行**：M25 已删除按包名跳过检查的豁免；编译器、base
    与工具链源码通过 SCT + 显式 fuel/结构递归达标，不再有「可信包静默跳过」路径。
    工具链/前端/加载器的状态机用输入规模线性 fuel 或内存内不可达上界（debt C26/C27/C28），
    正常输入不触发；触发时是明确的 internal 错误，不会静默改变语义。
  - **`List` 桥接**：返回或接收 `List` 的原语（`strUnpack` / `strPack` /
    `strConcatMany` / `strSubstTemplate` / `prim_getArgs` / `prim_readDir`）由 codegen
    映射到桥接 helper，桥接只为 canonical `Base.List.List` 生成；`Prelude` 自动注入
    `Base.List`，因此正常上下文总可用，闭包里没有该族时这些原语不可用。
  完整 DT 主线见 [docs/roadmap.md](../roadmap.md)、设计边界见 [docs/dt-core.md](../dt-core.md)、
  工具链见 [dt-tooling.md](dt-tooling.md)；种子轮换是手动流程（发版/不兼容变更时），日常
  工具链改动不需要 rotation；`test/run-tests.sh` 以 golden 比对为主。

## main 与 IO

- 可执行入口（`vuna build`）要求 `main : IO a`（`IO` 判定只认 canonical `Base.IO.IO`），
  由运行时执行动作（没有公开的 `runIO` / `unsafeRunIO`）。
- **效果靠显式能力**：效果原语只有 `prim_*` 名（`prim_print` / `prim_readFile` / …，
  旧公开名已删除）。普通包不能直接调用它们，只能经 `Base.IO`；要在源码里直接调用，必须
  在 `vuna.toml` 的 `[capabilities].effects` 声明对应能力（`console` / `fs` / `process` /
  `env` / `clock`）。无 manifest 的 ad-hoc 文件没有能力。未声明时报
  `` requires capability `<cap>` ... ``
  （`Loader.Resolve.checkEffectsBuiltins`）。这是**权限声明**，不是检查豁免；不再存在按
  包名字符串判定的 allowlist。完整表见 [primitives.md](primitives.md)。
  `vuna interp` / `vuna test` 的**入口文件**同样受限。
- `vuna interp` 只做**纯**核心求值：任何 `main : IO a` 一律报错并提示 `compile` +
  运行产物；纯 `main : Int/String/Bool` 的结果展示仍保留为调试约定（`String` 走
  `strShow` 转义）。IO 组合统一用 `Functor`/`Monad` trait（`fmap`/`bind`/`pure`、`>>=`、
  `do`），不导出 `bindIO`/`pureIO`/`fmapIO`；`Base.IO` API 直接返回 IO，内部包装
  `prim_*` 效果原语。当前 `IO` 仍是库层 thunk 表示，不是完整的 effect 类型系统（见
  [docs/roadmap.md](../roadmap.md)）。
- IO 失败（如读缺失文件）在产物里抛宿主异常，但入口文件缺失返回普通错误；CLI 用
  `prim_exit` 返回非 0 退出码（compile 错误 1、lint 有 finding 1、用法/解析/IO 错误 2）。

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
  `Vuna.Compiler.Common`）；包上下文内所有源文件（含 ad-hoc 单文件）自动导入
  `Prelude`；`vuna build` 需要 PATH 中有 `ocamlopt`；`Prelude` 刻意不含 `Base.IO`
  （效果 API 需显式 import）。

## 阶段与历史

- 阶段状态、当前阻碍与「决策变更」以 [roadmap.md](../roadmap.md) 为唯一口径；里程碑的
  实现细节见 [history.md](../history.md)（更细的在 git 历史）。**本文件只保留当前仍
  成立的边界，不复制里程碑清单**，避免 roadmap / history / limits 三处漂移。