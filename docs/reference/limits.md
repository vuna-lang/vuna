# 限制与已知边界

本文汇总当前实现仍成立的限制与边界条件。后续规划与开放债务见
[roadmap.md](../roadmap.md) / [debt.md](debt.md)；类型规则见
[type-system.md](type-system.md)，原语语义见 [primitives.md](primitives.md)，
编译器实现见 [compiler.md](compiler.md) / [core.md](core.md)。

## 编译模型与产物

- 只有一条编译链：`Loader → DT 精化（Elab） → 擦除 codegen（Codegen）`。
  `check` / `compile` / `build` 与语言夹具全部走它，没有可切换的检查器。
- 输出模型只有一种：**逐模块 split**（`vuna compile ENTRY OUTDIR` 与 `vuna build` 都产
  依赖序的 `<Module>.ml` + `Vuna_runtime.ml` + `Main.ml` + `build.sh`，**不生成 `.mli`**）。
  `compile` 只 codegen 到目录、成功静默；`build` 默认输出到 `<PKG-DIR>/.output`
  （PKG-DIR 缺省当前目录，`--out DIR` 可改），随后执行 `build.sh` 链接出
  `DIR/bin/<包名>`。
- **确定性**：同一源码 + 同一编译器产出的 `.ml` / `build.sh` / `build-meta.json` 逐字节
  一致，产物不含绝对路径或时间戳；`build` 链接成功后写 `<out>/build-meta.json`，同哈希 +
  二进制存在时跳过（`up to date:`）。`compile` 与 `build --no-compile` 不写 meta。
- **增量**：生成的 `build.sh` 按模块内容哈希（Merkle stamp）判断是否重编，不用 mtime；
  需要 POSIX sh + `sha256sum`。`--no-compile` 只产源码，不调 `ocamlopt`。
- **hermetic 边界**：确定性 / 哈希 / 增量由 vuna 保证；完全 hermetic 的固定工具链由 Nix
  构建承担，本地 `vuna build` 仍调用宿主 `ocamlopt`。
- 编译器是独立成员包 `vuna-compiler`，`seed/` 只由 compiler 包入口闭包生成，工具链不在
  TCB；产品 CLI `vuna` 是单一二进制（in-process 调 compiler 库，不 fork
  `vuna-compiler`）；`vuna build` 在 codegen 后执行生成的 `build.sh`（`prim_runIn` 调
  `ocamlopt`）。LSP / package manager / Index 在根包侧，**永不进入 seed 闭包**。
- `do` / Monad / IO 组合子、DT 索引族、隐式、终止性、擦除与单路径均已落地；单文件只是
  包内 ad-hoc 入口，与包内模块走同一装配 / codegen，不再有第二套加载语义。
- `result*` out-link 是手工指向某次构建的符号链接，源码 / seed 变了不会自动更新；跑测试或
  基准前先重建对应的 `nix build ... --out-link`（开放债务 E03）。

## 类型系统边界

- **身份按声明符号判定**：`Int` / `String` 是 language primitive 类型；`Bool` / `List` /
  `IO` 是 base 的普通 `data` 声明，canonical 身份分别是 `Base.Bool.Bool` /
  `Base.List.List` / `Base.IO.IO`。没有短名判定、没有 prelude 桩、没有全局构造子放行；
  用户同名 `data` 是普通声明。原语语义与身份常量表见 [primitives.md](primitives.md)。
- **擦除由单一判据驱动**：`Elab.Meta.isTypeDomain` / `binderRig` 是唯一入口——隐式 binder
  恒 `Rig0`，显式 binder 仅当域在类型层（宇宙或域全为类型层的 Pi 链）才 `Rig0`，其余
  `Rig1`。**索引擦除策略 = 写成隐式 binder**：隐式索引 `{n : Nat}` 无运行时字段，显式索引
  `(n : Nat)` 保留字段（`dt/17_erase` / `dt/38_explicit_index` 锁定两侧）；不做整程序使用
  分析，「想擦但被读」的显式索引不会自动擦除（改成隐式即读不到该值）。
- **宇宙严格分层、非累积**：`Type i : Type (i+1)`，Pi formation `max(i,j)`，
  `Type i ≠ Type j`，无 subtyping / cumulativity；data kind 必须是 Pi 链 → `Type l`，
  构造子**字段 binder** 的域 sort 必须 ≤ 族层级（`data D : Type where Mk : Type -> D`
  被拒，改住 `Type 1` 即可；族参数 / 索引不受限）。`Type i` 的显示不带 level，所以非累积
  的类型不匹配文案可能是 `expected Type, got Type`（拒绝正确，显示待补）。没有宇宙多态。
- **终止性：结构下降 + 守卫 Int**：递归调用（含互递归组内调用）必须在某个固定测度位置上
  递减；测度可以是形参的真子项（含嵌套构造子模式、`case` 分支、`f v` 形式的单 clause
  投影 / accessor），或**带守卫的 Int**：`n - k`（k>0）且能证明 `n > 0`——证据来自
  `if n <= 0 then … else …` 的 else 区，或 SCC 入口假设。无守卫的 `n - 1`、升序
  `i + 1`（有界计数器规则尚未实现）与无下降的互递归仍会被拒；HOF 递归、`where` 绑定体里
  调外层函数、`Cons x (f x)` 这类藏在实参里的递归都会被检查。每个 SCC 的每个环都必须有
  严格下降边。**没有包级豁免**：依赖模块、入口模块与编译器包用同一套判据。
- **`where` 绑定必须写签名且是顺序 let**：`let` 的签名行可选、支持子句糖；`where` 仍要求
  每个绑定在子句前写签名。只能引用之前的绑定——不支持前向引用 / 自递归 / 互递归，递归与
  互相引用放顶层定义组。
- **局部函数能力边界**：`let` 绑定左端支持构造子 / 记录 / 字面量模式解构（等价单分支
  `case`，必须穷尽，否则报 `TC_NotExhaustive`）；`where` / `let` 的**相邻**同名子句合并成
  局部多 clause 函数（复用模式矩阵，穷尽性同 `case`；签名只能写一条、覆盖全部子句，非相邻
  同名子句报 `PS_WhereSigMultiClause`）。局部函数仍不支持递归。
- **as-pattern**：`x@pat` 可用于函数子句参数与嵌套模式（模式矩阵注入绑定，STR 视作整个
  值），`case` 分支左端也支持 as-pattern（desugar 为 `let` 绑定）。`vuna lint` 的 `case-to-clauses` 对递归 / 互递归函数
  `case`（与 STR 的已知冲突，见 [lint.md](lint.md) §5）。
- **`vuna interp` 不执行效果**：任何 `main : IO a` 一律报
  `DT: interp cannot execute effects (main : IO a); compile and run the program instead`
  （退出码 2），不做「纯动作求值、效果丢弃」的区分；需要效果时用 `compile` + 运行产物。
  `vuna test` 的 `main : IO ...` 与 REPL 的 `IO` 表达式都走 compile + 运行（退出码 0 通过 /
  输出直接到终端），纯 `String` / `Int` / `Bool` 测试仍走核心求值（快）。
- **REPL 定义必须先写签名**：交互式定义也要先输入 `x : Int` 再输入 `x = 1 + 1`；表达式走
  DT 表达式接口（推断表达式类型后求值）。支持多行续行（未闭合括号 / 尾随 `=` / `where` /
  `do` 等），空行强制结束；`IO` 表达式编译到临时包运行，每次约 1–2s，需要 `ocamlopt`。
- **除零语义**：核心求值器对 `a / 0` **不归约**（`interp` 报 `main does not reduce to a
  value`），`compile` 产物运行时 `failwith "division by zero"`（未捕获异常，退出码 2）；
  测试用 `compile` + 运行断言（`run_err/03_div_zero`）。这是显式分类而非静默 0，完整边界见
  [primitives.md](primitives.md) 的 interp 归约边界。
- **`main` 的数据值展示限制**：`interp` 只展示 `Int` / `String` / `Bool`，与产物同一展示
  语义（`String` 走 `strShow` 转义）；返回 data / record 的 `main` 报
  `main does not reduce to a value`，编译产物报 `CG_MainReturnType`。夹具的 `main` 用
  `Int` / `String`（数据覆盖点留在被调函数里）。任意类型 `main` 的展示归 F3（需要运行时
  `Show` 证据）。
- **interp 不归约的原语按类分类**：返回 / 接收 `List` 的 `strUnpack` / `strPack` /
  `strConcatMany` / `strSubstTemplate`（List 桥接依赖 `Base.List.List` 构造子表示）、`/0`、
  以及全部效果原语；其余 `str*`（`strFromInt` / `strLength` / `strHash` / `strAt` /
  `strShow`）已实现且与 runtime 同公式。相关夹具用 `.nointerp` 标记。
- **`Prelude` 自动注入**：包上下文内所有源文件（含 ad-hoc 单文件）自动导入 `Prelude`，
  `Show` / `Eq` / `Ord` 及其实例开箱可用；显式 `import` 仍可补充。缺 import 的诊断只在
  显式绕开 `Prelude` 的上下文出现。
- **`==` / `/=` 是证据驱动的（无泛型兜底）**：只有两条路径——`Int` / `String` 内建特化，
  或 `Eq` 证据（字典：手写实例、`deriving`、约束实例）。具体类型没有实例、函数类型相等、
  `Eq` 类不在作用域，都在 `check` 期报错；不存在「运行时结构比较兜底」，interp 与编译产物
  也没有第二套相等算法。刚性类型变量搜不到实例时提升成隐式字典参数，实例优先。
  `<` / `<=` / `>` / `>=`：`Int` 内建特化、`String` / `Bool` 保留泛型运行时，其它类型必须
  有 `Ord` 证据。
- **约束实例与参数化 `deriving`**：`instance Eq a => Eq (Box a)` 可用（实例 def 带隐式类型
  参数 + ctx 字典参数，搜索递归解 ctx）；`deriving (Show, Eq, Ord)` 对参数化 data 同样可用。
  `List a` / `Maybe a` 等容器的实例仍需显式声明（Base 只带 `Int` / `String` / `Bool` 的
  实例）。
- **顶层签名约束（M32）**：`f : Eq a, Show a => τ` 可用。约束生成隐式 Rig1 字典 binder
  （插在前导隐式类型参数之后、显式参数之前），body 的方法调用优先命中声明的假设；签名
  未覆盖的刚性字典需求仍按旧规则提升成额外隐式参数。**只支持顶层签名**：`where` / `let`
  绑定、`axiom`、trait 方法、构造子 / 记录字段的类型里写 `=>` 报
  `[PS_ConstraintUnsupportedHere]`；trait 方法签名上的约束是父类语义，归 F4。约束头未
  声明报 `unknown interface <name>`；约束项不是单参数 trait 应用报
  `[TC_ConstraintNotDict]`；实参与类参数 kind 不符报 `[TC_TypeMismatch]`。
- **类型族**（结果以 `Type` 收尾的 Pi 链，如 `sel : Nat -> Type`）整体擦除，不生成运行时
  定义；在运行时定义里把擦除的族参数当值用报错。
- **axiom 与命名空间**：`axiom name : Ty` 是无运行时定义的擦除 / 类型层声明，运行时使用报
  `CG_AxiomAtRuntime`；限定名 `M.typeConst` 可在类型位置引用（裸小写名仍按隐式类型变量
  处理，跨模块类型位置引用请用限定名）。同模块 `data T` 与 `def T` 同名仍不支持，归 F1
  收尾。
- **证明 ergonomics**：隐式值参数 `{x : a}` 已支持（隐式 binder 恒擦除，值只进类型 / 索引 /
  证明位置，子句体不能按名字引用）；构造子当函数值部分应用可参与 `conv`（η 展开）；
  `Ctx n -> Fin n -> Tm n` 这类依赖索引取值用 **Tarski 式存在式**（运行时类型码 `Ty` +
  指标族 `Tm : Ty -> Type` + `Some`）表达。**泛型 Σ 的值级构造仍是边界**（类型不能依赖
  运行时值），归 F4。空族判定在索引含中性项时仍保守。
- **命名实例不存在**：没有 `as name` / `@name`；实例按 head 全局唯一（相干性），重复报
  `duplicate instance`。**M31.1**：实例按**落点规则**分布（跟类型模块走，trait 签名
  直接依赖的类型例外，见 [operators.md](operators.md)），不再声称「孤儿实例被拒」
  （实现从未强制，B23）。
- **type-as-value**：**不引入 type codes**；Type 级等式走擦除的 `Eq` 证据 + `cast`
  组合子；把类型放到**运行时位置**仍被擦除检查拒（`CG_TypeUsedAtRuntime` /
  `CG_TypeLevelBindingRuntime` / `CG_TypeLevelNameRuntime`）。
- **高阶 kind 与多隐式参数字典**：高阶 kind 的 check 已支持（`m a` 推断
  `m : Type -> Type`）；含多隐式参数字典的 `do` 程序不再是边界。trait 多参数 / 默认方法 /
  父类 / 关联类型归 F4（单参数 trait + 约束实例 + 顶层签名约束是当前终态）。
- **延迟字典目标的最终诊断**：类参数始终未解时报 `unsolved metavariable`（而非「缺实例」）；
  `missingInstance` 级诊断细化留待后续。**顶层定义必须有类型签名**，否则报
  `DT: expected a type signature for ...`。
- **高阶 / 开放元变量解**：Miller pattern unification 已落地（局部变量 spine → λ 抽象）；
  非 pattern 形状（如 meta-spine flex-flex）报 `TC_CannotSolveHigherOrder`。完整高阶合一属
  研究项。
- **覆盖率与终止性对所有包一致执行**：没有按包名跳过检查的豁免；编译器、base 与工具链源码
  通过 SCT + 显式 fuel / 结构递归达标。工具链 / 前端 / 加载器的状态机用输入规模线性 fuel
  或内存内不可达上界，正常输入不触发；触发时是明确的 internal 错误，不会静默改变语义。
- **section 是 lambda 语法糖**：`(+ e)` / `(e +)` 在 Loader 展开成未标注 lambda（`(+)` 只是
  运算符作值）。因此**直接应用** section（`(+ 3) 4`）会命中既有的 lambda 推断边界
  `TC_LambdaNoSignature`（普通 `(\x => x) 5` 同样报错）；把 section 传给带签名的参数
  （`inc : Int -> Int`，`inc = (+ 3)`）正常。用户符号名函数同理按普通定义处理，codegen 用
  `_x<code>_` 转义非标识符字符。
- **`List` 桥接**：返回或接收 `List` 的原语（`strUnpack` / `strPack` / `strConcatMany` /
  `strSubstTemplate` / `prim_getArgs` / `prim_readDir`）由 codegen 映射到桥接 helper，
  桥接只为 canonical `Base.List.List` 生成；`Prelude` 自动注入 `Base.List`，因此正常上下文
  总可用，闭包里没有该族时这些原语不可用。

## 容器与可变数据（M33 W3）

- **内建类型构造子**：`Array a` / `IORef a` / `MArray a` / `Buffer` 是类型层构造子（不是
  `data` 声明），名字恒可见、不能重定义；没有构造子可模式匹配，只能经原语 / `Base.*` API。
- **不可变 `Array`**：`fromList` / `toList` / `length` / `get` / `set` / `make`；`set` 是
  copy-on-write（`Array.copy` + `Array.set`），原数组不变；越界是宿主 `Invalid_argument`。
- **IO 内可变数据**：`IORef` / `MArray` / `Buffer` 的操作全部是 `IO` 动作，只能经
  `Base.IORef` / `Base.MArray` / `Base.Buffer` 使用；`runIO` 是 main 外唯一执行入口、需要
  `unsafe`。**没有线性 / 唯一性类型与 ST / region**：类型上无法表达「句柄不逃逸」，
  可变句柄的安全边界目前是 IO 隔离 + `unsafe` 的显式放行（D22 部分关闭）。
- **哈希容器**：桶是 `Array (Array (List ...))`（`Array.get` O(1)，`insert` copy-on-write）；
  `empty` 已移除、统一写 `fromList []`（见 stdlib.md 的弱类型变量说明）。
- **没有泛型 `Hashable`**：`HashMap` / `HashSet` 只覆盖 `String`，`IntMap` 只覆盖 `Int`；
  无 `deriving Hash`（trait 单参数限制）；无有序持久容器。
- `Base.Sort` 仍是插入排序（O(n²)，编译器热点之外的库算法项）。

## 受限 FFI（M33 W5）

- 只支持 `Int` / `String` / `Bool` / `Array Int|String|Bool` 的**显式参数**；无回调 /
  GC root / pin、无 C 头文件解析、无字符串双向可变共享（String 只读传递）、无泛型。
- C 源在包根 `ffi/*.c`，随生成的 `build.sh` 编译并链接；没有 `ffi/` 的包行为不变。
- `extern` 的名字与签名都手写（不 import C 头）；超出子集报 `TC_FfiTypeUnsupported`。
- interp 不执行 extern（只走 compile + 运行）；`extern` 声明本身不参与 `interp` 求值。

## fuel / measure 站点

工具链 / 前端 / 加载器 / 库的状态机逐点采用结构递归或可证明的界，不再有「无静态上界的
线性 fuel」：

| 站点 | measure / 论证 |
| --- | --- |
| `Base.String.split` | `2*len(text)+len(sep)+2`；每步消费 1 字符或跳过 ≤len(sep) 字符 |
| `Frontend.Lexer` | `2*len(source)+64`；每个递归调用消费 ≥1 字符，trivia/token 不重叠 |
| `Frontend.Parser` | `128*toksLeft+1024`；每个循环至少消费 1 token（offside 状态机保留守卫；列表循环尽量结构递归） |
| `Frontend.Toml` | 逐行结构递归；状态机按 `4*lines+16` 证明 |
| `Packages.Pkg` | 依赖图无环 + 已访问目录集；守卫上界为可达 manifest 目录数 |
| `Loader.Resolve` | 对 `List Decl` / `Expr` 的结构递归去 fuel；状态机保留并证明 |
| `Vuna.Json` | 每个解析函数消费 ≥1 字符；`8*len+64` 守卫（互递归返回剩余输入，SCT 不可见） |
| `Vuna.Fmt.Expr` | `formatFuelBound = 64*astSize+1024`；AST 结构递归 + 互递归组证明 |
| `Vuna.Files` / `Index.Scan` | 目录树每层递减；上界 = 目录深度（符号链接环被截断） |
| `Vuna.Repl` / `Vuna.Lsp` | 交互 / 服务主循环保留 1G 程序不变量：非全函数，fuel 只防不可达死循环 |

所有站点在正常输入下不会触发；触发时是明确的 internal 错误。深层 / 长输入夹具锁定不会因
合法规模耗尽守卫。

## main 与 IO

- 可执行入口（`vuna build`）要求 `main : IO a`（`IO` 判定只认 canonical `Base.IO.IO`），
  由运行时执行动作；「main 之外执行」只有 `Base.IO.runIO`（要求能力 `unsafe`，工具链特权）。
- **效果原语返回 `IO` 动作（M31）**：纯 `main` 直呼 `prim_*` 是类型错误（`TC_TypeMismatch`）。
- **效果靠显式能力**：效果原语只有 `prim_*` 名。普通包不能直接调用它们，只能经
  `Base.IO`；要在源码里直接调用，必须在 `vuna.toml` 的 `[capabilities].effects` 声明对应
  能力（`console` / `fs` / `process` / `env` / `clock` / `unsafe`）。无 manifest 的 ad-hoc 文件没有
  能力。未声明时报 `` requires capability `<cap>` ... ``
  （`Loader.Resolve.checkEffectsBuiltins`）。这是**权限声明**，不是检查豁免；不存在按包名
  字符串判定的 allowlist。完整表见 [primitives.md](primitives.md)。`vuna interp` /
  `vuna test` 的入口文件同样受限。
- `vuna interp` 只做**纯**核心求值：任何 `main : IO a` 一律报错并提示 `compile` + 运行
  产物；纯 `main : Int/String/Bool` 的结果展示仍保留为调试约定（`String` 走 `strShow`
  转义）。IO 组合统一用 `Functor` / `Monad` trait（`fmap` / `bind` / `pure`、`>>=`、
  `do`），不导出 `bindIO` / `pureIO` / `fmapIO`；`Base.IO` API 直接别名到 IO 化的
  `prim_*` 原语（M31）。`IO` 仍是库层 thunk 表示，不是完整的 effect 类型系统（归 F3）。
- IO 失败（如读缺失文件）在产物里抛宿主异常，但入口文件缺失返回普通错误；CLI 用
  `prim_exit` 返回非 0 退出码（compile 错误 1、lint 有 finding 1、用法 / 解析 / IO 错误 2）。

## 工具链细节

- fmt：行宽 100，但模块头 / 导出列表、类型签名与超长字符串字面量不折行；表达式内部的注释
  会前移到最内层包含它的条目（或下一条目），不保证留在原位置；单行块注释可挂行尾，多行块
  注释只作前置注释。`where` 块的绑定签名行按源码顺序保留、幂等。`infix*` 声明被打印在
  imports 之后、源码顺序、每条一行；fixity 是**程序级**属性，CLI / LSP 用
  `Loader.Flatten.fixitiesForSource` 取可见闭包；取不到（上下文 / 依赖加载失败）时 fmt 报错、
  不格式化该文件；未知符号运算符同样报错（不静默按默认优先级重排）。
- REPL 支持多行续行（括号 / 字符串 / 注释 / 尾 token），但每个提交项仍是一个完整表达式或
  一条定义；顶层定义必须**先写签名**（DT 签名必填）；依赖只支持本地路径（registry / 锁文件
  未做）；`Map` 是关联表实现的抽象类型（无平衡树）；`HashMap` / `HashSet` / `IntMap` 是
  1024 桶的持久哈希容器（无 `remove` / resize，键限 `String` / `Int`，`toList` 桶序、
  `size` O(n)）；`Result` 暂无 Functor / Monad 实例。
- `vuna lint` 只报告**可安全自动修复**的形态，三条规则：`literal-if-chain`、
  `lift-destructure`、`case-to-clauses`。不可安全折叠的情形（非最后 clause、clause head
  跨行、含注释 / tab / CR、分支体无法安全收束）**不报告**；签名含隐式 Pi 的函数跳过
  clause 级改写。`case-to-clauses` 不做语法穷尽性证明（交给 `vuna check`），对编译不过的
  文件可能拆出不完整 clause。`--fix` 遇到注释、tab、CRLF 也跳过。`vuna lint` **必须显式给
  路径**，无参数是用法错误（退出码 2）。规则语义与边界见 [lint.md](lint.md)。
- `vuna fmt --check` 省略 PATH 时按 workspace 包约定扫描各包 `lib/app/test`；非包目录 /
  不存在路径都是可读错误 exit 2，`map` 同类场景也给出明确错误而非静默空输出。`vuna doc`
  尊重 `[export].modules`。
- **as-pattern 与 lint**：`case-to-clauses` 拆分「分支体引用 scrutinee」的函数时自动生成
  `x@pat` 保持绑定；STR 把 as 绑定视作整个值，递归/互递归函数也能通过终止性检查。
  `case` 分支左端也支持 as-pattern（desugar 为 `let` 绑定，scrutinee 纯表达式重复求值语义等价）。
## 命名与构建

- 标准库包名 `vuna-base`、模块根 `Base.*`，编译器模块 `Vuna.Compiler.*`（门面
  `Vuna.Compiler.Common`）；包上下文内所有源文件（含 ad-hoc 单文件）自动导入 `Prelude`；
  `vuna build` 需要 PATH 中有 `ocamlopt`；`Prelude` 刻意不含 `Base.IO`（效果 API 需显式
  import）。
- `seed/` 是生成物，只能通过 rotation 更新；当前文件集以 `seed/` 与
  `nix/seed-count.txt` 为准。流程与不变量见 [bootstrap.md](bootstrap.md)。
