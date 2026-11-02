# 历史与已完成里程碑

本文记录 vuna 的里程碑历史与已完成阶段的细节。路线图与后续阶段见
[docs/roadmap.md](roadmap.md)（roadmap 的「已完成」列表只保留一句话摘要，细节在本文与
git 历史里）。各里程碑对应的模块与设计见 [docs/architecture.md](architecture.md)、
[docs/reference/compiler.md](reference/compiler.md)。

## 里程碑一览

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
- M12.7：删除 dynamic codegen（`Vuna.Codegen`）与 `--no-typecheck` / `--typecheck` /
  `--typed` / `build --no-print` / `--out` / 裸 compile 回退；typed 成为唯一 codegen，
  `vuna check` 改为纯类型检查（单次 typecheck）、arity 诊断统一到 typecheck，
  CLI 要求显式子命令、默认模块根改为当前包；seed 49 个文件 / ~0.81 MB；
- M13：DT 地基——Core TT（`Type`/Pi/应用/lambda/if；NbE + beta/delta/eta；
  非累积宇宙）、双向精化器（一阶 metavariable、类型级隐式插入、delta 类型别名）、
  擦除型 DT codegen 与 `interp --dt` 核心求值器；`--dt` 单文件 opt-in，HM 路径
  语义与产物不变；新增 `docs/dt-core.md` 设计稿与 `test/corpus/dt*` 夹具；
  seed 49 → 57 个文件 / ~0.92 MB；
- M14：索引族与依赖模式匹配——Core 增加构造子应用与 case（`TCon`/`TCase` /
  `VCon`/`VCase`），`data F : <kind> where` 声明的索引归纳族（构造子写完整显式
  telescope `(a : Type) -> (n : Nat) -> ...`；宇宙域 binder 擦除、索引保留运行时表示），
  `case` 做索引 unification 与分支可达性判定（不可满足分支可省略、写错则报错）与
  覆盖率检查；解除递归定义限制（SCC 分组，终止靠 delta 展开 fuel）；核心求值器与
  擦除型 codegen 同步扩展（运行时族 → OCaml 变体、族前缀构造子名、`match` + 不可能
  分支 `failwith`）；新增 `test/corpus/dt/09_nat` / `10_vec` / `11_fin` / `12_eq`
  正例（输出 5 / 4 / 7 / 7）与 `dt_err` 反例；隐式索引推断留 M15；仍为单文件
  `--dt` opt-in，split/包集成留 M17；
- M15：隐式参数、接口与洞——元变量上下文（解记录创建深度，`convEc` 复核作用域逃逸，
  取代 M13 的「闭合解」限制）、隐式索引推断（`vapp`/`three` 免写族参数）、
  trait/instance 字典编码（`Dict_C` / `MkDict_C`）+ 方法投影（签名 + 定义体）+
  实例搜索（按头统一并写回元变量解，缺失/歧义明确诊断）、洞目标显示
  （`DT: unsolved hole <loc> with goal <ty>`）；新增夹具 `13_iface` / `14_solve` / `15_goal`；
- M16：终止性与覆盖性——surface AST 上的结构化递归终止性检查（自递归调用必须有实参
  是同一形参的真子项；`plus`/`vlen` 通过，`loop n = loop n` 被拒，文案
  `DT: cannot prove termination of <f>`）；覆盖性边界固定（嵌套模式/多 clause 仍不支持）；
  索引擦除分析落地为**诊断级**（`eraseIndexMask`）——探测确认索引不能无条件擦：`vlen`
  把长度索引当递归参数传下去，运行时真被读，安全擦除需整程序使用分析；夹具
  `16_total` / `17_erase` 与 `16_nonterm` / `17_nested_total`；
- M17：DT 工具链——`vuna goal <file.vuna>` 列出洞的位置/目标类型/上下文
  （`Elab.goalsOfProgram`）；`vuna lsp`（JSON-RPC 2.0 over stdio：initialize/shutdown/
  exit、didOpen/didChange/didClose Full 同步、publishDiagnostics（0-based range）、
  DT 洞 hover；未实现 method 显式返回空结果）；`lib/Vuna/Json.vuna` 最小 JSON 编解码；
  `test/corpus/lsp/smoke.sh` 27 项断言；`vuna doc` 可渲染接口与隐式签名；`Lsp`/`Json`
  加入 TCB forbidden 清单；新增 `docs/reference/dt-tooling.md`；
- M18：自举迁移决策——seed rotation 让 M15–M17 的 DT 精化器进入信任锚点
  （stage1 == stage2 逐字节一致，seed 仍 31 个模块）；用 DT 表达编译器不变量
  （`test/corpus/dt/18_ctx.vuna`：`Ctx a (Succ n)` 静态排除越界访问）；健全性修复：
  `unifyIdx` 燃料耗尽从静默成功改为硬错误
  `DT: index unification ran out of reduction fuel`；**决策：编译器本体暂不全量迁移**
  （擦除未完成、DT 仍单文件、收益集中在 Core/Elab），前置条件见
  `docs/reference/m18-migration.md`；metrics 重新标定；新增 `docs/reference/m16-design.md`；
- 早期 OCaml 外部编译器 `vunax` 已完成使命并删除（M6 完成后删除，历史可从 git log 找到）；
- M18.5：DT 可靠性修复——`Elab.checkLam` 曾把每个 lambda 形参无条件标成 `erased = True`，
  造成两条失败路径：形参在运行时被使用 → `DT: type-level binding ... is used at runtime`
  硬报错；形参未被使用 → **静默少生成一层 `fun`**（`check`/`compile` 退出 0，
  `ocamlopt` 才报类型错），这是审计中唯一违反「能 check 就能 compile」的通道。
  修复方式：擦除判据收敛为全仓唯一入口 `Elab.erasedBinder implicit dom =
  implicit || isTypeValue dom`（隐式 binder 恒擦除，显式 binder 仅宇宙域擦除），
  `teleOf` / `checkBinders` / `bindOnePattern` / `checkLam` / `inferArgs` /
  `bindCtorBinder` 六处判据点全部改走它；`test/run-tests.sh` 第 34 段新增逐夹具
  「`interp --dt` 输出 == `compile --dt`+`ocamlopt` 输出」对拍断言；新增正例
  `dt/19_lam`（四种形态：形参被使用 / 未被使用 / 捕获上游 / 高阶传参）与反例
  `dt_err/18_lam_type_used`（宇宙域形参仍擦除，被当运行时值必须报错）。
- M18.6：核心表示层定型（QTT 预留）——把两处「以后要上 QTT / 宇宙多态就得全仓改」的
  表示决定一次钉死，**行为零变化**（全部 DT 夹具的 `compile --dt` 产物与 M18.5 逐字节
  相同，`diff -r` 验证）。① `TPi`/`TLam`/`TApp`/`TCon`/`CaseAlt` 的 `Bool`（是否擦除）
  换成三值 `Rig`（`Rig0` 类型级 / `Rig1` 值级 / `RigOmega` 预留但不产生）；
  ② `TType : Int` / `VType : Int` 换成不透明 `Level`（内部 `MkLevel Int`，只有 `Core`
  可见）；③ 泄漏面收敛成三层访问器——构造 `rigOfBinder` / `levelZero` / `levelSucc` /
  `levelMax` / `levelOfInt`，判定 `rigIsErased` / `rigIsLinear` / `rigIsOmega`，展示与比较
  `levelToInt` / `levelEq` / `levelLt`。全仓 `Pair Term Bool` / `Pair String Bool` 清零，
  `Core` 之外对 `Rig` / `Level` 的模式匹配数为 0（`Elab` / `CoreCodegen` 只构造
  `Rig0` / `Rig1` 并经 `rigIsErased` 读）。`erasedBinder : Bool -> Value -> Bool` 相应
  升级为 `binderRig : Bool -> Value -> Rig`。映射表与三条不变量写进 `docs/dt-core.md` §24；
  新增正例 `dt/20_rig` / `dt/21_level` 与反例 `dt_err/19_rig_type_runtime`。

- M19：DT 语言面 parity（8/9 项落地）——把 dt-parity 表里「不补就写不了真实模块」的
  八项补齐，全部有正反例：
  ① **多 clause 与方程左端模式**（399 名 / 978 行）：合成单个 lambda + case 表达式树，
     按列递归（标准模式矩阵）——整列是变量就改名继续，出现构造子就按构造子分组、把
     模式替换成子模式后递归，变量/通配汇成兜底；分支 pattern 的子模式一律用新鲜变量
     （`_sc<i>`），因此不依赖 `bindCtorTele` 内部的 `_np<N>` 编号约定。
  ② **`let`**（296 处，含 `where` 块）：检查位与推断位两条路径都脱糖为
     `(\x => body) e`，绑定子的 rig 由值类型经 `binderRig` 决定，擦除行为与函数参数一致。
  ③ **推断位 `case`**（132 处）：建元变量当期望类型再按检查模式处理，分支逐个 check
     会把期望写进它——`if` 分支、函数实参、`let` 的 value 位置都可用。
  ④ **嵌套构造子模式**（410 分支）：改写成内层 case（`Cons a x rest => case x of
     Succ k => body`），因此内层同样过覆盖检查与索引合一，支持任意深度。
  ⑤ **内建类型上的字面量模式**：`Bool` 降级成 `TIf`；`Int` / `String` 降级成嵌套
     `TIf` 链（判据 `==`），因此必须有变量/通配兜底分支。
  ⑥ **内建泛化**：`==` / `/=` 带隐式类型参数，精化到饱和应用时按第一个实参类型
     特化成 `bi_eq_int` / `bi_eq_str` 这类运行时函数（codegen 只做名字映射）；
     `strFromInt` / `strUnpack` / `strPack` / `strLength` 进 prelude。定义表拆成
     独立模块 `DtPrelude.vuna`（`Elab` 行数回到模块预算内）。
  顺带修掉核心求值器两个真实缺陷：`normalizeCase` 原先只正规化 scrutinee、不进入分支体
  （嵌套 case 在 `interp` 下无法归约），`applyCaseAlt` 原先不处理兜底分支（空名字），
  于是「变量 clause 汇成兜底」的分支永远命不中。metrics 按实测重新标定两次。
  ⑦ **trait 高阶 kind**：类参数的 kind 从方法签名推断（`DtKind.vuna`；被应用 k 次 ⇒
     `Type -> ... -> Type`），字典构造子与投影按真实 kind 生成，实例头与隐式参数检查也
     接受 kind 形态。顺带修掉一个真实错位——投影的 lambda 链与应用点原先一律写 Rig1，
     而 `a : Type` 这类参数实际擦除，导致 `interp` 与编译产物不一致；现在两侧统一用
     `methodArgRigsOf` 取的同一份 rigs。「类型层」判据同时收窄成「域全为宇宙的 Pi 链」，
     否则值层函数类型 `a -> b` 会被误擦（`03_compose` / `04_apply` 崩）。
  ⑧ **`record`**（声明 / 构造 / 字段访问 / 更新 / 记录模式）：record 是**纯记法**——
     等价于「带一个构造子的 data，构造子按声明顺序接收全部字段」。降级在精化前完成
     （`DtRecords.vuna`），因此 DT 侧没有任何 record 专用精化规则：构造 → 构造子应用、
     字段访问 → `case` 投影、记录模式 → 构造子模式、更新 → 构造新记录。构造子名用
     `Mk<R>`：DT 的 `globals` 是一张表，类型名与构造子同名会让 `Point 1 2` 被解析成
     「把类型当函数应用」（HM 分表存储，因此沿用记录名）。带点标识符（`p.x`）由 lexer
     合成单 token，降级时按「变量 + 字段链」拆分。
  未完成：`deriving`。

- M19 收尾时尝试 `deriving`，撞上一条 **M15 遗留缺陷**：同 trait 多实例会互相干扰。
  根因定位到 `inferArgsGo` 的字典参数分支——类参数 `?a` 还没被后续实参约束时就去
  搜索实例，`Dict_C ?a` 与第一个候选统一、`?a` 被解成该候选的参数，于是第二个实例的
  调用全错（`nameOf MkB` 报 `expected A, got B`）。现有夹具都只有单实例，所以从 M15
  起一直没暴露；它会直接挡住 M23 全仓迁移。结论写进 `docs/dt-core.md` §24.6 与 roadmap，
  列为 M22 首要项，`deriving` 后移到其后。

- M19 收尾时接着修复了上一条记录里的同 trait 多实例缺陷（它挡住 `deriving` 与 M23）。
  两条不变量：① **实例搜索不得解决元变量**——`filterInstances` 只接受「不新增解」的
  头匹配，并以 `ecSols` 为初始解集（否则已解的元变量会被误判为新增解，既有单实例夹具
  反而全挂）；② **类参数由 `constrainDictDom` 约束**——跳过类型实参（`firstOf2 Int ...`
  的 `Int` 会把 `?a` 解成 `Int`），并把实参类型收缩到**应用头部**（类参数只可能是
  构造器形态，高阶 kind 的实例头写的就是构造器，而实参类型常是 `Box Int`）。
  正例 `dt/29_multi_instance`（正序与反序调用都对）、反例 `dt_err/25_no_instance`。

- M19 最后一项 `deriving` 落地：DT 的自然形态是**生成 instance**，因此 `DtDerive.vuna`
  把 `deriving (Show, Eq, Ord)` 展开成等价的 `DInstance` 声明，交给既有的字典编码与
  实例搜索——没有新增任何精化规则。方法体按构造子骨架机械生成：`show` 逐构造子拼
  `"(C f0 f1)"`（零参直接给名字）、`eq` 同构造子逐字段 `&&`、`lt` 先按声明顺序比构造子
  索引再逐字段、`le` 由 `lt` 派生（不依赖 `Eq`）、`gt`/`ge` 由 `lt`/`le` 反转。
  同时给出内建 `Show`/`Eq`/`Ord` trait 声明与内建 `Show` 实例（`Int`/`String`/`Bool`），
  因为派生 `show` 的字段展示是递归的。
  
  关键实现细节：展开出的实例必须**追加到声明列表末尾**——那条 data 的族信息要等
  `elabDatas` 阶段才进 `globals`，插在中间会让实例方法体的 `case` 拿不到 scrutinee
  类型。`==` 对非内建类型也改为走 `Eq` 实例（`deriving (Eq)` 才有意义），反例
  `dt_err/22_eq_unsupported` 的诊断相应变成「找不到 Eq 实例」。
  夹具：正例 `dt/30_deriving`（Show + Eq 的四种组合）、`dt/31_deriving_ord`（Ord 四方法
  + 字段比较 + Show 组合）；反例 `dt_err/26_derive_unknown`。

- M20：DT 复用 Loader，走出单文件。`dtLoad` 改成 `loadProgramRaw`；`--dt` 的 CLI 放行
  `--root` 与目录；Loader 从「拒绝 `EPi`」改成「结构递归、放行判定交给下游检查器」
  （HM 的 `Typecheck` 仍报 `requires --dt`，零放宽），并认得 DT prelude、`Type` 层级、
  洞 `_` 与 data 类型名。接入后暴露两个真实 bug 并修掉：`sanitizeChar` 不处理 `#`
  （Loader 生成的匿名实例名 `#default` 不是合法 OCaml 标识符）、匿名实例名不唯一
  （同 trait 多实例的字典互相覆盖）。
- M20 第二个补丁：参数化 `data Foo a : Type` 在 DT 下可用（`vuna-base` 7 个模块都用
  这种写法）。两处改动：`DtPrelude.prependParams` 把族名后的参数作为**隐式** binder
  并进 kind（`data List a : Type` 的 kind 只有裸 `Type`，不并进去 `List a` 就被当成
  「把非函数应用」）；`Elab.elabCtor` 在检查构造子类型前把族参数补成隐式 `EPi`
  （`MkWrap : a -> Wrap a` ⇒ `{a : Type} -> a -> Wrap a`），与 `data Foo : Type -> Type` +
  显式 `{a : Type}` 的既有写法形状对齐——否则构造 `Wrap Int` 报
  `type mismatch: expected a, got Int`。
- M20 第三个补丁：签名里的类型变量隐式量化。vuna 允许 `append : List a -> List a`
  不写类型参数（HM 靠推断，DT 需要显式 binder），trait 方法签名同理
  （`fmap : (a -> b) -> f a -> f b`）。新增 `Vuna.Compiler.DtQuant`（纯 AST 变换，
  独立成模块以守住 `Elab` 的模块行数门槛）：收集签名里的自由小写名并包成
  `EPi n True (Type)`，同时排除类参数（其 kind 是 `Type -> Type`，不能被 `Type` 覆盖）、
  签名内已显式绑定的名字、以及**本程序另有定义的名字**（`vapp` 这类会被误当类型变量）。
  副作用：`Elab` 反而从 2539 降到 2525 行（顺手把两段长设计注释压成指针，细节移入本文档）。
- M20 第四个补丁：`Loader.resolveTypeName` 让本模块声明的类型名**优先于**内建名——
  `Base.Bool` 重新声明 `data Bool` 时，`Bool` 必须解析成 mangled 的 `Base.Bool.Bool`，
  否则构造子检查报 `constructor False does not return Base.Bool.Bool`。
- M20 剩余：`vuna-base` 的 `check --dt` 已推进到 `Base.List:54`（`mem : a -> List a -> Bool`
  里 `x == y` 需要 `Eq a` 实例约束）——泛型函数上的实例约束求解属 M22 范围。此外
  `pkg` 目录模式（包入口）未接通。
- M21 前置缺口补丁：多态族构造子的**函数类型**字段不被索引精化。根因是
  `Elab.refineValue` 对 `VPi`/`VLam` 的兜底 `_ => v` 不递归，所以 `MkWrap : {a : Type} ->
  (a -> Int) -> Wrap a` 在 `case w of MkWrap g`（w : Wrap Int）里 `g : a -> Int` 的 `a`
  永远替换不到 `Int`，`g 0` 报 `expected a, got Int`。修法：`Elab.varTypeValue` /
  `Elab.evalCtx` 不再在**求值结果**上做 `refineValue`，而是在**取用点**把精化代入
  **求值环境**再 `eval`——闭包捕获的是环境，精化后的环境自然被 `applyClosure` 携带，
  域与余域都递归精化。不动 `refineValue` 的 16 个调用点；此前试过给 `refineValue` 加
  `VPi`/`VLam` 分支（`refineClosureDown` + `freshVarValue`），因 `quote` 深度错位让
  `compose` 这类三层 Pi 的 `b`/`c` 错位、10 个既有夹具回归，已放弃。新增正例
  `test/corpus/dt/33_poly_fn_field.vuna`（输出 `1`）、负例
  `test/corpus/dt_err/27_poly_fn_field_err.vuna`（`expected Bool, got Int`）；全量
  `test/run-tests.sh` 841 项通过。`Base.IO` 的 `MkIO : (Int -> a) -> IO a`（`bindIO` /
  `ioFmap` 的阻塞点）由此解锁。
- M21 主体第一步：`main : IO a` 的执行 + `do` 的具体 bind/pure。`Dt.evalDtMain` 与
  `CoreCodegen.generateDtProgram` 都按 main 的**类型**识别 IO（族名 `IO`，含
  `Base.IO.IO` 带模块前缀形态），取构造子**末实参** `f`（隐式族参数也进值表示，所以
  不能按位置取第一个）后对世界令牌 0 应用 `f 0` 并继续归约，与 HM `ioRunExpr` 语义
  一致（`interp --dt` 与 `compile --dt`+ocamlopt 产物逐字节一致）。`do` 在 DT 下可
  精化执行，但用**具体**（非 trait）`bind`/`pure`——泛型 `Monad IO` 实例需要「字典域
  类参数被后续实参约束后再搜实例」的推理次序修复，属 M22 泛型实例约束求解
  （`Base.List.mem` 的 `Eq a` 是同一处）。新增正例 `test/corpus/dt/34_io_do.vuna`
  （输出 `42`）、`35_io_main.vuna`（`main : IO String`，输出 `"hello"`）；全量
  `test/run-tests.sh` 849 项通过。

## 编号修正：M22 拆分与两次重排（2026-11）

roadmap 重整时发现 `M22` 一号两用：roadmap 里 M22 是「擦除判据接线与统一 codegen」，
但 2026-11 的提交 `feat(dt): defer dict metas` / `lift generic dict constraints` /
`lower multi-clause ctor patterns and check Base.List` 都把泛型实例约束工作标成了 M22。
处理分两步：

1. 先拆为 M22.1–M22.5（泛型实例 / 包目录 / 库名 / trait 投影 / 擦除 codegen）；
2. 再按**可开工依赖顺序**重排。第一次重排把 trait 投影放到了 M22.4，导致 M21 的 `do`
   阻碍要等更晚阶段——阶段依赖倒置。最终把 trait 投影并回 **M21**（`do` 本来就是 M21
   的范围），已完成的基础工作前移为 **M20.5**，M22 只保留三个未开始阶段。

| 现编号 | 内容 | 原编号 |
| --- | --- | --- |
| M20.5 | 泛型实例约束求解（已完成） | M22.5（`git log` 记为 M22） |
| M21 | 效应与 IO 的 DT 化（含 trait 投影与实例方法模式） | M21 + M22.2 |
| M22.1 | 包目录与 CLI 入口（`check` / `compile --dt`） | M22.4 |
| M22.2 | 库名统一与精化缺口（含 Bool 去桩） | M22.3 |
| M22.3 | 擦除判据接线与统一 codegen | M22.1 |

历史提交信息保持原样、不回写；以本文与 roadmap 的编号为准。

## DT 阻碍实况核对（2026-11）

为避免文档继续引用过时结论，用当前源码构建的 `.output/bin/vuna`（HEAD `18818be`）跑了
一轮只读探针。**注意 `./result/bin/vuna` 可能是旧构建**，不能作为基准。

| 探针 | 结果 |
| --- | --- |
| 单文件 `test/corpus/dt/*`（36）/ `dt_err/*`（28） | 全绿（抽样 `30_deriving` 输出 1） |
| `import Base.{Pair,Bool,List,Maybe,Result,Monad,IO}` + 简单使用 | 通过 |
| `import Base.Bool` + `if True` / `not False` | 通过 |
| `import Base.List` + `mem 1 (Cons 1 Nil)` | 通过 |
| `import Base.IO` + `main : IO Int` + `print` | 通过 |
| `import Base.String` / `Prelude` | 失败：`expected (List Int), got (Base.List.List ?2)` |
| `import Base.Map` / `Base` | 失败：`DT: unknown name Base.List.List` |
| `import Base.Sort` | 失败：`case is not exhaustive: missing Cons` |
| `fmap` / `do`（降级成 `bind`） | 失败：`unbound variable fmap` / `unbound variable bind` |
| `instance FMap Box where fmp g (MkBox x) = ...` | 失败：`definition parameters must be variables (M13)` |
| `check --dt base/lib`（包目录） | 崩溃：`Fatal error: exception Failure("readFile: ...")` |

这些失败项已分别登记为 roadmap 的 M21（trait 投影）/ M22.2（库名）/ M22.1（包目录）的「当前阻碍」。旧文档里
「M20 9/10、M22 让 Base.List 全量通过」的说法只在特定写法下成立，不能外推到 `base` 的
全部模块。

## 决策变更：M18 迁移动机失效（2026-11）

M18 的结论是「编译器本体暂不全量迁移到 DT」，依据是四条理由，其中两条是**硬前提**：
DT 仍是单文件 opt-in、擦除未完成。2026-11 明确了项目前提——**vuna 尚未发布，没有外部
用户与下游生态，所有源码都在本仓库内，任何设计/接口/命令/实现/哲学都可推翻**——
因此「保留 HM 以避免破坏兼容」这条理由消失，M18 的决策随之被推翻。

推翻后的路线（详见 [docs/roadmap.md](roadmap.md)）：

- **终态**：单一依赖类型路径，`Typecheck` / `TypedCodegen` 从仓库删除，`--dt` 开关消失；
- **迁移期**（M18.5–M23）双路径零回归仍然守门，但只是过程性约束；
- 原「DT 多文件与包集成」从「第一前置」**后延**为 M20：真正的第一前置是语言面 parity
  （M19）与关键缺陷修复（M18.5）；
- 原「完整擦除分析」从待办小项提升为独立阶段 M22（codegen 换代 + metrics 重标定）；
- 原 M19–M23（效应 / 模块 v3 / 运行时 / 生态 / 并发）依次后延为 M21 / M25 / M26 /
  M28 / M27。

决策理由与能力落差的量化证据见 [docs/reference/dt-parity.md](reference/dt-parity.md)；
M18 当时的完整论证保留在 [docs/reference/m18-migration.md](reference/m18-migration.md)
作为历史记录与「被推翻的决策」样本，不再代表当前方向。

## 路线补充：DT 大重构（2026-11）

在「迁移到单一路径」之后追加了一段**编译器本体 DT 大重构**（M24.5 + M24.6）。起因是
一个自然的问题：既然编译器已经跑在 DT 上，那就该用上依赖类型真正的表达力，而不是
把 HM 风格的代码逐行翻译过来。

为此做了一轮实测（77 个夹具），结论直接决定了阶段划分：

- **正面**：弱化（`wkVar`/`wkTerm`）、单变量替换（`subst`，穿过 binder 时 lift）、
  按族 `case`（`vhead`/`idv`）都已可写，`subst` 甚至能 `interp` 求值。
- **边界**：精化器只在「`case` 打在被索引族本身、且 goal 索引就是该形参」时给出等式；
  跨形参等式（`append`）、scrutinee 精化反射进 goal（`rep`）、用「分支不可能」免写分支
  （`lookupEnv`）都还不行。**这构成了 M24.5 的全部范围。**
- **反面（同样重要）**：拓扑序见证、元变量上下文索引化、终止性 `Acc` 见证三个「看起来
  很 DT」的方向实测收益低于成本，已显式记入 roadmap 的「明确不划算」，防止后人重做。

同时发现两个与 DT 无关的真 bug：`Pkg` 按包名去重会静默丢弃重名成员的整支依赖
（实测重名 workspace 全部静默 `exit 0`）；`Loader` 用 `Nothing => []` 把「模块未加载」
伪装成「无导出」。两者都记入 M24.6 的「顺手修掉」。

> 过程中有一份实验报告得出「`subst` 也写不出来」的结论，复核后发现是该夹具漏掉了
> 穿过 binder 时的 `shift u`；修正后通过。教训已写进
> [dt-parity.md §6](reference/dt-parity.md)（引用此类结论前先复核夹具本身）。

## 已完成里程碑细节

### M8c / M12：codegen 与编译模型

- M8c：Kosaraju SCC、类型特化比较、`&&`/`||` 短路、`++` 折叠与线性拼接、
  零参纯值 hoist、pretty printer；自举 codegen 从 ~12s 降到 ~2s 量级；构建加 `-g`
  并对 warning 39（unused rec）设 warn-error；
- M12 起分离编译是构建模型的主干（每 vuna 模块一个 OCaml 模块 + `build.sh` 增量构建）；
  M12.8 起 `vuna build` 先做包级 codegen（`.output/lib/` + `app/Main.ml`），再由
  `.output/build.sh` 调 ocamlopt 产出 `.output/bin/<包名>`；`vuna build --split` 仍保留
  为旧的扁平分离 codegen（逐模块 `.ml/.mli` + `build.sh`），遇到不支持构造直接报错
  （不回退）；typed codegen 的**单文件**路径仍保留：`vuna compile`、测试/调试与包级
  codegen 不支持的构造使用单文件产物；优化仍归 ocamlopt（M12 不做 vuna typed IR）；
  runtime prelude 在分离编译中完整保留。

### M12.5：工具链与自举边界拆分 + 编译性能

- 编译器独立为成员包 `vuna-compiler`（自有 CLI `vuna-compiler`），根包 `vuna` 退为
  产品 CLI 并经 in-process 调库复用编译命令；
- seed 只覆盖 compiler 包入口闭包（工具链移出 TCB，文件 63→49），fixed point、
  seed 闭包断言、metrics 目标与基准脚本同步调整；新增跨包重导出夹具；
- 产品 CLI `vuna` 仍是单一二进制（in-process 调 compiler 库，不 fork `vuna-compiler`
  进程）。`vuna build` 通过受限进程执行内建（`prim_runIn`）运行 `.output/build.sh`
  调 ocamlopt；这不是 vuna 进程转发。LSP / package manager 若加入，放在根包（CLI）侧
  或独立包，**永不进入 seed 闭包**；
- 编译性能修复：类型替换改 AVL（unify 从 O(n²) 回到 O(n log n)）、分离编译
  预计算路由表（去掉每模块 O(decls×names) 扫描）、跳过无签名函数占位 scheme 的
  env free-var 扫描、干净构建走单次 ocamlopt。本机 compiler 闭包的 `build --split`
  从 ~32s 降到 ~2s，`nix build .#vuna-seed --rebuild` ~1.4s、
  `nix build .#vuna-compiler --rebuild` ~3.4s。

### M12.6：main / IO 语义

- 可执行入口（`vuna build` / `--split` / `seed`）要求 `main : IO a`，由运行时执行
  动作（没有公开的 `runIO` / `unsafeRunIO`）；普通用户包不能直接调用 effectful 内建
  （`print` / `readFile` / `exit` / ...），只能经 `Base.IO`（当时叫 `Vuna.IO`；编译器 / 产品 CLI /
  `vuna-base` 自身在包级 allowlist 内）；`vuna interp` / `vuna test` / `--root` 的
  **入口文件**同样禁止直接调用 effectful 内建（只有被加载的 base/compiler 模块内部
  可用），纯 main 结果 show 仍保留为调试约定；
- IO 组合统一用 `Functor`/`Monad` trait（`fmap`/`bind`/`pure`、`>>=`、`do`），不再导出
  `bindIO`/`pureIO`/`fmapIO`；效果 API 直接返回 IO（`print : String -> IO Int`、
  `getArgs : IO (List String)` 等），内部由不导出的 `prim_*` 原语实现。当前 `IO` 仍是
  库层 thunk 表示，不是完整的 effect 类型系统（留给后续效应阶段，见
  [docs/roadmap.md](roadmap.md)）；seed 51 个文件 / ~0.86 MB。

### M12.8：命名空间收敛与包级构建

- 标准库包改名 `vuna-base`（模块 `Base.*`），编译器模块迁到 `Vuna.Compiler.*`
  （门面 `Vuna.Compiler.Common`）；新增顶层 `Prelude`（`base/lib/Prelude.vuna`，
  重导出 Pair/Bool/List/Maybe/Result/String/Monad，不含 `Base.IO` 效果函数），
  包模式自动导入、原始 `--root` 模式不导入；
- 新增 `vuna compile --package`（`.output/{lib,app}`）与 `vuna build`（ocamlopt →
  `.output/bin/<包名>`），`vuna build --split` / `seed` 保留扁平分离 codegen；
- 包模式自动导入 `Prelude`，原始 `--root` 模式不导入（保持自举/夹具的显式 import
  语义）；`vuna build` 需要 PATH 中有 `ocamlopt`，库包先用 `vuna compile --package`
  生成 `.output/lib/`；seed 61 个文件 / ~1.2 MB。

## 相关阅读

- 路线图（终态 + M18.5–M28 规划 + 决策变更表）：[docs/roadmap.md](roadmap.md)
- DT 取代 HM 的能力落差证据：[docs/reference/dt-parity.md](reference/dt-parity.md)
- DT 设计与 M13/M14 边界：[docs/dt-core.md](dt-core.md)
- 被推翻的 M18 决策原文：[docs/reference/m18-migration.md](reference/m18-migration.md)
- 子系统地图：[docs/architecture.md](architecture.md)

## M22 泛型实例约束求解：阻塞点精确定位（探查记录）

`bind (pure 41) (\x => pure (x+1))`（`main : IO Int`）在 DT 下报
`no instance found for (Dict_Base.Monad.Monad ?4)`。逐层定位到根因与两条独立阻塞点：

1. **`bind` 的类参数由结果类型而非实参确定**。`bind : {m}{a}{b} -> {d : Dict_Monad m}
   -> m a -> (a -> m b) -> m b` 的字典 `{d}` 出现在显式实参**之前**。精化到 `{d}` 时
   `?m` 仍未解：`constrainDictDom` 只把 `?m` 与实参类型头部统一（`pure 41 : ?m' ?a` 的
   头部是 `?m'`，统一后仍两个元变量，得不到构造子）。`hasUnsolvedMetaValue` 为真 ⇒ 走
   **延迟路径**（`Elab.vuna:1906-1922`）：字典被降级成普通元变量 `pmeta`，等 `?m` 被
   结果类型（`IO Int`）解开——但 `?m` 是在 `inferArgsGo` **返回之后**（`checkByInfer`
   的 `convEc expected`）才解开，延迟路径**从不回填** `pmeta`，最终 `unsolvedMeta` 报错。
   ⇒ 需要一个「延迟约束收集 + 事后求解」机制：延迟路径把 `(pmeta, Dict_Monad ?m)` 记成
   待解约束；所有 def 精化完成后扫描，`?m` 已解为具体构造子时 `searchInstance` 回填
   `pmeta`。
2. **`mem : a -> List a -> Bool` 缺约束**（`base/lib/Base/List.vuna:54`）。签名不含
   `Eq a`，但函数体用 `x == y` 触发 `Dict_Eq a`（`a` 为**刚性**签名变量）⇒ 实例搜索失败。
   HM 路径靠「约束推断」自动补 `Eq a`；DT 需在签名里推断并补隐式 `{d : Dict_Eq a}`
   （实例搜索失败且类参数为刚性变量时，提升为签名约束并重精化）。

**两条路径的共性**：都要求 Elab.vuna 在 `max_module_lines 2540`（上下文预算，只允许降）
的硬约束下**净增**代码——延迟约束需要 `newDictMeta`（用 `ecGoals` 记录字典元变量类型，
复用 `DtGoal` 结构，无需改 `Ec` 字段）+ 事后 `resolveDictGoals` 扫描 + 调用点；约束推断
需要失败回退重精化。两者都是 M22 的核心，但**不可**做成小补丁；`filterInstances` 的
「唯一候选回退（pickSolo）」是死代码——`searchInstance` 只在 `?m` 已解时被调用，从不
遇到未解类参数，回退永远不触发。

**结论**：M22 泛型实例约束求解需要一个专门、谨慎的精化架构改动（延迟约束收集 + 事后
求解 / 期望类型前向传播），并伴随 Elab 行数净压缩。建议单独一轮专注处理，先用现有
`test/corpus/dt/` 的 `bind`/`do` 用例做门禁，再补 `mem` 的约束推断。

### M22 追加定位：更高阶元变量的硬阻塞（M13 限制）

实现「延迟字典约束」（`newHoleMeta` 记 `ecGoals` + `resolveDictGoals` 事后回填）后，
`m21_bind` 的错误从 `no instance found for (Dict_Monad ?4)` 变成
`cannot solve higher-order metavariable ?0 (M13 limitation)`。这暴露了**比延迟回填更深的
根因**：

1. **`constrainDictDom` 无 kind 检查**（`Elab.vuna`）。`constrainDictDomGo` 用
   `convEc` 把类参数与**后续实参类型头部**统一；`convEc`/`solveMeta` 解元变量**不做
   kind 检查**，于是 `pure 41` 的内层字典 `Dict_Monad ?m'` 被实参 `41 : Int` 解成
   `?m' = Int`（`?m'` 的 kind 是 `Type -> Type`，`Int` 的 kind 是 `Type`）。`bind` 的
   `?m` 跟着塌缩到 `Int`，`normalize dom = Dict_Monad Int`，`Monad Int` 无实例 ⇒
   `searchInstance` 报错。**延迟路径因 `?m` 已被解成 `Int` 而从不触发**
   （`hasUnsolvedMetaValue` 为假）。
   - 修法（已验证可行）：`constrainDictDom` 先取**字典族的类参数 kind**
     （`Dict_C` 的构造子类型 `MkDict_C : {p : K} -> ...` 第一个 binder 的域 `K`），
     实参头部 `g` 的 kind 与 `K` 一致（`Color` 对 `Show`，`IO` 对 `Monad`）才约束；
     头部是元变量（`?m' Int`）或 Pi 则跳过。这样 `?m` 保持未解 ⇒ 延迟路径触发。
2. **更高阶元变量不可解（M13 硬限制，真正的阻塞）**。`solveMeta`（`Core.vuna:599`）
   对**被应用的元变量**直接报错：`sp` 非空 ⇒ `cannot solve higher-order metavariable`。
   `Monad` 的类参数 `?m : Type -> Type` 天生更高阶：`bind` 精化时 `?m` 已被应用
   （`?m ?a`、`?m ?b`），结果类型 `?m ?b = IO Int` 要求 `?m = IO`——这是**高阶模式**
   解，M13 拒绝。`?m` 在 `constrainDictDom` 时是**裸**元变量（可一阶解），但此时
   `?m = IO` 的来源（结果类型 `IO Int`）尚未出现；等到 `?m ?b = IO Int` 出现时 `?m`
   已被应用。**延迟回填解决不了这一点**：无论 `?m` 何时解，它一旦被应用就触发 M13。
   ⇒ `bind (pure 41)` 的 `Monad` 用例**需要更高阶元变量求解**（`solveMeta` 支持模式
   统一），这是 `Core.vuna` 的核心改动，不是 Elab 层的补丁。
3. **`instanceHeadTerm`/`argNameOf` 头部限定名缺失**（潜在第二处不匹配）。
   `instanceHeadTerm (EApp fn (a::_) _) = TGlobal (argNameOf a)`，`argNameOf (EVar n _) = n`
   返回**非限定**名（`IO`），而程序里的 `IO` 是 `TGlobal "Base.IO.IO"`（模块限定）。
   即使 `?m` 正确解成 `IO`，实例头 `Dict_Monad (TGlobal "IO")` 也未必与
   `Dict_Monad (TGlobal "Base.IO.IO")` 统一。

**当前状态**：`resolveDictGoals` + `newHoleMeta` 的延迟字典机制与 `constrainDictDom`
的 kind 检查都已实现并验证（849 项测试全绿、零回归），但**因 M13 更高阶限制，`bind`
用例仍未通过**；`Elab.vuna` 因这两处改动净增约 63 行，超出 `max_module_lines 2540`
预算。为保持 CI 绿与预算守门，本提交暂将 `Elab.vuna` 还原到 HEAD（2540 行），把
上述定位落盘。**M22 的真实完成路径**：先做 `Core.vuna` 的更高阶元变量模式统一
（`solveMeta` 支持 `VMeta m sp` 的 pattern 求解），再启用延迟字典机制 + kind 检查 +
头部限定名修正，最后补 `mem` 约束推断。

### M22 实现进展：Core 更高阶统一 + 字典延迟骨架

按上节结论先做 `Core.vuna` 的更高阶元变量模式统一，并重新启用延迟字典机制与
`constrainDictDom` 的 kind 检查：

1. **`Core.vuna` 更高阶统一（`solveMeta` → `solveMetaHo`）**：非空 spine 不再直接报
   M13，而是按形状求解——
   - 元-元对齐（`?m sp = ?n sp2`）：`?m = ?n` 再 `convSpines`；
   - 中性头提取（`?m sp = head args`，`|args| >= |sp|`）：`?m = head (take extra args)`
     再统一剩余 spine（`solveMetaHead` + `splitAtVals`）；
   - 其余形状仍报 M13（保守）。
2. **`Elab.vuna` 字典延迟 + kind 检查**：`constrainDictDom` 先取字典族类参数 kind
   （`dictArgKind`），实参头部与之 kind 一致才约束（`argHeadMatchesKind`）；`?m` 未解且
   无唯一实例时延迟成普通元变量（`hasUnsolvedMetaValue` 判据）；`filterInstances` 放开头
   匹配（允许新增解，候选对照同一份初始 sols）。
3. **`Base.IO` 构造子模式改 case**：`ioBind`/`ioFmap` 的参数 `MkIO f` 触发 M13
   「定义参数必须是变量」，改写为函数体 `case ... of`（与 DT 设计一致）。

**验证**：`test/corpus/dt/` 全绿（0 失败）；`test/run-tests.sh` 849 项通过（零回归）；
`sh nix/context-budget.sh .` 在预算内（`max_module_lines 2529`）；seed rotation fixed
point 通过。新增局部夹具 `_scratch/m22_monad.vuna`（本地 `IO` + 泛型 `Monad` trait）——
`bind (pure 41) (\x => pure (x+1))` 在 DT 下**通过**，证明结果类型驱动 `?m = IO` 的
更高阶路径已打通。

**仍阻塞（下一轮）**：
- `m21_bind`（`Base.IO` 版）：`Base/IO.vuna` 的 `prim_*` effectful 内建未进 DT prelude
  （属 M21「effectful 内建进 DT prelude」）；
- `mem : a -> List a -> Bool`：刚性签名变量 `a` 上的 `Eq a` 约束推断（签名缺 `Eq a`，
  DT 需在签名推断并补隐式 `{d : Dict_Eq a}`，失败回退重精化）。

### M22 实现进展：多 clause 模式矩阵修复，`Base.List` 全量 check 通过

目标：让 `vuna check --dt --root base/lib` 能完整精化 `Base.List`（`mem`、`zip`、
`lookupPair`、`take`/`drop` 等），并把 DT 的多 clause/构造子模式路径补到「标准模式矩阵」
该有的样子。逐层剥出的缺陷与修法：

1. **零参构造子被当成函数**。`take`/`drop`/`zip` 的 `[]`、`Just`/`Nothing` 等零参（或
   只有隐式参数的）构造子，`inferE (EVar "Nil")` 直接返回 `eval tyTerm`
   （`{a} -> List a`），于是 `[1,2,3]` 报 `expected List Int, got Int`。修法：
   `inferCtorRef` + `instantiateNullaryCtor`——**只对「整条类型链没有显式 Pi」的构造子**
   把隐式类型/族参数实例化成元变量，`Cons`/`Just` 这类有显式参数的保持多态类型。
2. **`if` 条件写死 prelude 桩 `Bool`**。`inferE (EIf)` 用
   `checkE ... (NGlobal "Bool")` 检查条件，`Base.List.filter` 的 `if p x`
   （`p : a -> Base.Bool.Bool`）报 `expected Bool, got Base.Bool.Bool`。修法：先
   `inferE` 条件再判 `isBoolType`（按末端段名同时接受 prelude 桩与真实
   `Base.Bool.Bool`），两分支各自推断后 `convEc`。
3. **构造子与族同名**（`data Pair a b where Pair : a -> b -> Pair a b`）。
   `checkAppCtor` 原来用 `globalLookup`，拿到的是**族的 kind**
   （`Type -> Type -> Type`）而不是构造子类型，报 `expected Type, got Int`；反过来
   `Pair` 出现在类型位置时又被当构造子。修法：`checkAppCtor` 改用
   `dtCtorLookup` + `dtCtorType`；`checkApp` 在 `expected` 是宇宙（`isSortVal`）时走
   `checkAppGeneral`。
4. **单 clause 的构造子形参**（`firstOf (Pair a b) = a`）：M13「定义参数必须是变量」。
   修法：`elabFunDef` 先判 `allVarPats`，否则把整条 clause 矩阵交给 `multiToExpr`
   降级（与多 clause 同一条路径）。
5. **构造子 + 通配混合列**（`zip (x :: xs) (y :: ys) = ...; zip _ _ = []`）：
   `buildColumnExpr` 原先把这种列落到 `litAltExpr`，而它的 `PWild` 分支只
   `stripFirstCol`、不展开构造子子模式 → 丢 `x`/`xs`/`y`/`ys` 绑定，报
   `:0:0: expected List a, got Int`。修法：加 `hasCtorHead`，混合列也走
   `ctorAltList` + `fallbackAltList`；同时 `clausesForCtor` 把变量/通配子句**分发进
   每个构造子分支**（用该分支的新鲜子名占位，并把体里对该变量的引用改写成该列
   scrutinee），否则嵌套 case 缺分支、覆盖检查报 `missing <C>`。
6. **`zip` 的 `expected a, got b`（本轮最深的一个）**。修完 5 之后错误从有位置的
   `:0:0` 变成无位置的类型串位：`a` 被当成 `b`。根因是 `ctorAltList` 每层递归都用
   `_sc0/_sc1` 当新鲜子模式名——**层间同名**：内层 case 的 binder 遮蔽外层，外层
   `renameFirstVars` 又把外层变量（`y`）改写进内层 binder（`_sc1`），`x`/`y` 的类型
   因此互换。修法：`subNamesFor pos` 让新鲜名带**本列位置名**
   （`_sc_mc0_0`、`_sc_mc1_0`……），层间不再撞名。
7. **`Bool` 的双重身份**。`Base.Bool` 重新声明了 `data Bool`（`Base.Bool.Bool`），而
   prelude 内建 `Bool` 仍是类型注解与内建算子的默认（HM 的 `if` 判据 `TCon "Bool"`、
   求值器 `evalIf` 只认 `VCon "True"/"False"`）。DT 里两者混用时（`main : Bool` 对
   `mem ... : Base.Bool.Bool`）报 `expected Base.Bool.Bool, got Bool`。修法：**只在 DT
   精化器**里让 `convEc` 把两侧都是布尔头的值视为定义相等（`boolTypedVal` + 末段名
   `Bool`），并在 `inferVarRef` 里把「本程序数据构造子」排在「全局签名」之前
   （`True`/`False` 与 `preludeGlobals` 的桩同名，先查全局会拿到桩类型）。
   期间试过更"正统"的做法——改 Loader 让 `Bool` 统一解析到 `Base.Bool.Bool`、构造子
   声明一律 mangle——DT 侧可行，但 **HM 回归**：`Eval.evalIf` 只认裸 `VCon "True"`，
   `interp --root base/lib` 的 stdlib 夹具大面积报 `no matching clause` / 挂死
   （`corpus/stdlib/08_sort_map` 空转），违反「迁移期 HM 零回归」，已整体回退 Loader
   到 HEAD；跨模块构造子 mangle 的完整方案留给 M23。
8. **模块预算**。以上改动让 `Elab.vuna` 从 2539 涨到 2634（预算 2540）。按 35281c2 的
   先例做拆分：把纯语法的「多 clause 模式矩阵 → lambda + case」整块
   （`multiToExpr`/`buildColumnExpr`/`ctorAltList`/`renameExpr` 等，只依赖
   `Common` + `Ast`）移到新模块 `Vuna.Compiler.DtMatch`，并删掉拆分后变死的
   `firstCtorPats` 与旧 `subNames`；`Elab.vuna` 降到 2403 行。

**验证**：`_scratch/m22_allops.vuna` 覆盖 `Base.List` 全部导出（`append`/`reverse`/
`length`/`map`/`filter`/`foldl`/`foldr`/`concatMap`/`flatMap`/`mem`/`memName`/
`lookupPair`/`zip`/`take`/`drop`/`range`/`mapMaybe`）在
`check --dt --root base/lib` 下全绿（`filter (\x => x > 1)` 也能过，`Bool` 等价短路
生效）；`zip` 夹具从报错转为通过。新增语料正例
`test/corpus/dt/36_multi_clause.vuna`（双构造子参数、构造子+通配混合列、单 clause
构造子形参、零参构造子值，三路输出 `47`）与负例
`test/corpus/dt_err/28_multi_clause_coverage.vuna`（多 clause 覆盖不足 → `missing Succ`）。
`Base.List.lookupPair` 从嵌套模式 `(Pair k v) :: rest` 改为 `firstOf`/`secondOf`
（见下条边界）；`List.zip` 写成「具体子句 + `_ _` 兜底」（用户指出的顺序问题：
具体子句必须在前，否则被通配遮蔽）。`test/run-tests.sh` **858 项全绿**（含新夹具）；
`nix build .#vuna-compiler`（HEAD 种子编译当前源码）通过；`sh nix/context-budget.sh .`
在预算内（`Elab.vuna` 2403 行、`max_module` 仍是 `Typecheck.vuna` 2529）。

**仍存边界（下一阶段处理，已同步 limits.md / dt.md）**：
- **多列覆盖拆分**：模式矩阵按列下降、不按列间依赖拆矩阵，`zip [] ys = [];
  zip xs [] = []; zip (x :: xs) (y :: ys) = ...` 报 `missing Cons`；
- **跨模块构造子名**：`case`/模式按源名匹配 `dtDataCtors` 的限定名，导入模块里对
  导入族写 `case`（含嵌套模式降级出的 case）报
  `DT: unknown constructor <C> in case <F>`；`Base.List.lookupPair` 因此用访问器绕开；
- **真实 `Base.Bool.Bool` 值只在检查层可用**：`evalIf` 只归约 `VBool`、内建算子按
  裸 `True`/`False` 产生值，所以 `interp --dt`/codegen 下真实 Bool 的 `if` 仍不归约
  （例：`import Base.Bool; main = if True then 1 else 0` 能 check、interp 报
  `main does not reduce to a value`），M23 接 codegen 前需统一 Bool 表示。

## M21：效应与 IO 的 DT 化（2026-11）

**目标**：DT 程序能表达 `main : IO a`、`do` 块与 effectful 内建，`Base.IO` 达到可用性。
`main : IO a` 的执行（按 main 类型识别 IO、取构造子末实参 `f` 后应用世界令牌 0）与
多态函数字段的索引精化在此前已落地（`dt/33`–`35`），本轮收尾解决剩下 4 类阻塞：

1. **trait 方法投影跨模块不可见**。`import Base.Monad` 时投影可用（Loader 的
   `T(..)` 重导出带出方法条目），但 `import Base.IO` 后的 `do`（脱糖成 `bind`）报
   `unbound variable bind`——Base.IO 只定义实例、不重导出 trait。修法在**库层**：
   `Base.IO` 模块头导出 `Functor(..)` / `Monad(..)`（源 target 仍是
   `Base.Monad.*`），Loader 的重导出规则自动带出投影；HM 与 DT 同一份重导出，
   `checks.vuna-lint` / 夹具零回归。同时修了门面重复重导出同一目标的 duplicate
   export 误报（条目按 target 去重；`module M (f, f)` 这类真正的重复项仍然报错）。

2. **实例方法体的构造子形参**。`instance FMap Box2 where fmp g (MkBox2 x) = ...` 报
   `DT: definition parameters must be variables (M13)`：实例方法走独立的
   `checkBinders`，没接模式矩阵。修法：`elabInstanceMethod` 改走 `elabFunDef`，
   多 clause 与构造子形参复用 `DtMatch` 的同一套矩阵/覆盖判定。顺带发现并修掉
   「实例方法只取第一条 clause」（原实现按方法**位置**取，现按方法名收集全部
   clause；投影名是模块限定的，实例体里的方法名是裸名，按末段匹配）。正例
   `dt/37_instance_ctor_pat`，反例 `dt_err/29_instance_ctor_pat_coverage`。

3. **匿名实例字典互相覆盖**。Loader 给无名实例加模块前缀（`Base.IO.#default`），
   Elab 旧判定只看「名字是否以 # 开头」，于是 `instance Functor IO` 与
   `instance Monad IO` 生成同一个定义名，后者覆盖前者（`bind` 投影拿到 Functor
   字典 → `main does not reduce to an IO action`）。修法：匿名名按「类名 + 头实参」
   重新派生（`Base.IO.Functor_IO` / `Base.IO.Monad_IO`）；`ecAddInst` 幂等。
   **连带**：内建 `Show`/`Eq` 实例头必须提前到定义体之前注册（否则 `Dict_Eq Int`
   在 `mem` 调用点搜不到），实例定义体仍在最后阶段精化。

4. **泛型字典提升与自递归**。`mem : a -> List a -> Bool` 体里的 `x == y` 把
   `Dict_Eq a` 延迟成 `?d`，定义体精化完后提升成隐式字典参数。旧实现有三处缺陷：
   (a) 字典 binder 插入点用 `quote` 得到的 de Bruijn **index** 而不是类的
   binder **level**，多类型参数时位置漂移；(b) `insertDictBinder` 误把字典域
   shift 一次（`Dict_Eq a` 变成 `Dict_Eq a#1`）；(c) 体是按旧签名精化的，自递归
   调用点没有字典实参，`let rec v_mem = fun d -> ... v_mem x ys` 的 OCaml 类型对
   不上。修法：按 level 插入、域不 shift、新增 `insertDictCalls` 按应用位置补实参
   （遍历时跟踪 binder 深度算 `TVar d` 的 index）；提升后的签名回写 globals，后续
   定义按新签名走隐式实参插入；已提升的目标不再被后续每个定义重复提升。

5. **effectful 内建的 DT codegen**。签名早在 prelude，但 codegen 没有运行时实现：
   `prim_print` 之类的全局引用生成 `v_prim_uprint`（未定义）。修法：`dtRuntime` 新增
   `dtp_*`（print/readFile/writeFile/getArgs/readLine/readDir/isDirectory/makeDir/
   removeFile/fileExists/fileMtime/fileSize/exit/runIn），`globalRef` 按名映射；
   `prim_getArgs`/`prim_readLine` 在引用点展开成 `(dtp_getArgs ())`（与 HM 一致）。
   效果夹具 `corpus/dt_io/01_print` 编译运行输出 `hello7`。

6. **Bool 统一运行时表示**（M22.2 去桩的前置，提前到 M21 因为 `Base.List` /
   `Base.Maybe` 传递依赖 `Base.Bool`）。此前 `data Bool` 是变体而 `if`/内建算子走
   `TBool`，两侧靠 `boolTypedVal` 桥接；一旦 `Base.Bool` 进入 DT 程序，变体构造子
   与 OCaml bool 混用直接编译失败。修法：Bool 族的 `True`/`False` 在精化期一律
   变成核心 `TBool`，Bool 族不进 codegen 的变体声明与构造子表，`if`/`case` 与
   `main : Bool` 按族**短名**识别。`if True then 1 else 0` 的 `interp --dt` 与编译
   产物现在一致（此前 history 记录的「真实 Bool 的 if 不归约」边界消失）。

7. **codegen 变体类型的字段形状**。旧的「所有字段共用一个 `'a`」让特异字段
   （字典的 `bind`/`pure`、异构 `Pair`）无法通过 OCaml 类型检查；改为按「用到的族
   参数」分配：族应用字段复用族参数（递归族如 `List` 因此不会触发 occurs check），
   函数/其它字段各占独立不透明参数，**显式 Pi 字段结构化渲染**（`MkIO` 的字段是
   `int -> 'a0`，顶层 `IO` 值不再有不可泛化的弱类型）。擦除判据（`Rig`）仍是唯一
   字段形状来源，见 [dt-core.md](dt-core.md)。同一轮还修了：`inferPi` 的显式
   `(a : Type)` binder 未按「域是宇宙」擦除（`binderRig`）、字典构造子字段 Pi 链
   逐字段 `shift`（`Eq`/`Ord` 多方法签名把类参数指到前一个字段）。

**验证**：`test/corpus/dt_base/`（Base.IO 的 `do`、trait 投影、实例方法构造子形参、
Base.IO 全 API 类型面）三路全绿；`test/corpus/dt_io/01_print` 编译运行输出 golden；
新增正例 `dt/37` 与反例 `dt_err/29`；`test/run-tests.sh` **889 项全绿**（含 dt_base /
dt_io 两个新段）。`docs/reference/dt.md`、`limits.md`、`testing.md` 同步。

**仍存边界**（M22.2/M22.3 处理）：`str*` 签名用裸 `List` 而程序里是 `Base.List.List`
（`import Base.String` 失败）；`Base.Map`/`Base` 的跨模块族名解析；`Base.Sort` 的多列
覆盖；prelude 里 `Bool`/`True`/`False` 桩尚未删除（表示已统一，权威定义已是
`Base.Bool`）；`build`/`seed` 仍不接受 `--dt`；擦除判据尚未接线到 codegen。

## M22.1：包目录与 CLI 入口（2026-11）

**目标**：`--dt` 接受包目录，让后续阶段在真实包上验证。改动集中在 `Dt.vuna`、
`Compile.vuna`、`CompilerCli.vuna`、`lib/Vuna/Cli.vuna` 与新增夹具 `test/corpus/dt_pkg/`。

1. **包模式加载**：新增 `Dt.dtProjectDecls`（`reverse modules` 的声明 + 入口声明；
   Loader 的 modules 是依赖在前的反序）、`dtLoadProject` / `dtLoadModuleSet`、
   `dtCheckProject` / `dtCompileProject` / `dtCheckLibrary`，`Compile` 侧加三个包装；
   `check --dt <dir>` 与 `compile --dt <dir>` 走 `loadProject` / `loadProjectModules` +
   `resolveProject`。库包（无 `app/Main.vuna`）可 `check`，`compile` 报
   `library package ... has no app/Main.vuna` 且不写输出文件。
2. **CLI 分派与错误**：删除死代码 `dtRootErr` / `dtDirErr`；`check` / `compile --dt`
   先 `fileExists` 再 `isDirectory`（内建 `isDirectory` 对不存在路径会抛
   `Fatal error: readFile ...`）；新增 `dtPathErr`（`no such file or package directory`）、
   `dtNoMainErr`；`interp --dt <dir>` 由 Fatal error 改为
   `interp --dt takes a single file, not a package directory`。usage 与 `--dt` 文案同步。
3. **依赖序加载进 Loader**：`orderedProjectDecls` / `loadProgramOrdered` /
   `loadProgramRawOrdered` 按「被依赖模块在前」拼接；`Dt.dtLoad`（单文件 / `--root`）
   改用 `loadProgramRawOrdered`。HM 的 `loadProgram` 保持「入口在前」的历史输出顺序，
   零回归。
4. **夹具**：`dt_pkg/01_exec`（可执行包，`Util` 依赖 `Answer` 覆盖依赖序，运行输出
   `42`）、`02_lib`（库包）、`03_bad`（目录无 `vuna.toml`）；`run-tests.sh` 新增 34c
   段（11 项检查：check/compile/run、库包清晰报错、坏目录、不存在路径、interp 单文件
   检查）。

**验证**：包目录 check/compile/run 全绿；单文件与 `--root` 路径零回归；HM 包模式
（28/29/33 段）零回归。

## M22.2：库名统一与精化缺口（2026-11）

**目标**：`base` 全部模块在 `--dt` 下可精化，Bool 只有一个权威数据定义。

1. **`str*` 的 `List` 族名**：`DtPrelude.rewriteFamilyName` 把 prelude 静态签名里的裸
   `TGlobal "List"` 重绑到实际族名（`preludeGlobalsFor`），修掉
   `expected (List Int), got (Base.List.List ?2)`。codegen 侧 `dtListBridge` 按实际族
   生成 `dtp_unpack` / `dtp_pack`（`strUnpack` 语义是 OCaml `int list`，而 DT 的
   `List` 是程序自声明变体），`globalRef` 映射到它们。
2. **跨模块族名**：依赖序拼接（M22.1）+ `Base.Map` 辅助函数移到公开函数之前
   （前向引用看到的是提升字典参数前的旧签名，`_insertPair` 少一个字典实参导致 OCaml
   类型错），`unknown name Base.List.List` 消失。
3. **模式矩阵的两处缺口**：`Elab.ctorFamilyTable` 把「族 → 构造子集合」传给
   `DtMatch`，列内构造子已全覆盖时不补通配分支（修 `mergeBy le [] ys` /
   `mergeBy xs []` / `mergeBy (x::xs) (y::ys)` 的 `missing Cons` 假覆盖）；
   源级 `case` 的嵌套模式折叠（`foldPending`）把后续 `_` 分支的体作为每层内层 case
   的通配分支（修 `case xs of (x :: Nil) => ...; _ => ...`）。另修：折叠出的内层
   case 的隐式族参数 binder 与用户变量同名会把体里的变量解析成 `Type`
   （`bindCtorGo` 改为 `name ++ "#fam"`）。
4. **泛型比较与内建 Ord 实例**：`<` / `<=` / `>` / `>=` 饱和应用按实参类型特化
   （Int → `bi_*_int`；String/Bool → `bi_*_generic`；其它 → `Ord` 字典投影；刚性参数
   延迟提升成 `{d : Dict_Ord a}`），新增 `builtinOrdInstances`；DT core evaluator 补
   `bi_*_int` / `bi_*_generic` 归约（`mergeSort` 三路可跑）。字典提升的 `dictDom` 用
   `substSolvedMetasAt` 按定义上下文深度重写（此前 `mergeSort` 的提升签名残留
   `Dict_Ord ?67`，调用点变成悬挂 rigid 变量、报 `no instance found`）。
5. **隐式字典 binder 的类参数未解时延迟**：`inferArgs` 的 dict 分支在类参数是未解
   元变量时不做实例搜索（否则被第一个内建实例提前定死，`srt (\x, y => x <= y) xs`
   报 occurs check）；`Core.solveMeta` 对「同一个未解元变量统一自己」短路，避免
   `?m := ?m` 误报无限链。
6. **Bool 去桩**：`DtPrelude.preludeGlobals` / `preludeNames`、`Loader.dtPreludeNames`、
   `DtQuant.topPreludeNames` 去掉 `True` / `False` 值桩；`Base.Bool` 是唯一数据定义，
   `Bool` / `True` / `False` 按族短名解析（新增 `Elab.shortBoolFamily`）。
   **保留** `Pair "Bool" (TType 0)` 类型别名：内建 trait 方法签名与不含 `data Bool`
   的单文件程序仍需要 Bool 类型名；数据定义与构造子仍只来自 `Base.Bool`。
   单文件夹具补 `data Bool`（08/25/26/30/31）。
7. **`Base.Sort` 结构递归化**：归并排序的 `sortBy le (take half xs)` 过不了 DT 终止性
   检查（只接受形参真子项），改为插入排序（`sortBy` 按 tail 递归 + `insertBy`），
   排序结果与稳定性不变；`mergeSort` 用内建 `<=`（Ord 泛型比较）。
8. **lib 侧小修**：`Base.IO` / `Base.Sort` 补 `import Base.Bool`（Bool 值去桩后类型
   需要显式 import；`Loader` 仍保留 `Bool` 作为 HM 内建类型名）。

**验证**：`Base.String` / `Base.Map` / `Base.Sort` / `Base` / `Prelude` 探针在 `--dt`
下通过；新增 `dt_base/06_base_string`（check+compile+run；core evaluator 尚无
`strUnpack` 归约，夹具带 `.nointerp`）、`07_base_sort_map`（123）、`08_base_facade`（2）；
`run-tests.sh` **910 项全绿**。

**仍存边界**：`build --dt` / `seed --dt`、擦除判据接线、统一 codegen 输出模型与
metrics 重标定都留给 M22.3；DT core evaluator 不支持 `strUnpack`/`strPack`（interp 对
带这两个内建的夹具用 `.nointerp` 约定跳过）；延迟字典目标在最终仍无解时报
`unsolved metavariable`（而非「缺实例」），诊断细化留待后续；多列覆盖的进一步统一
（`dt_err/25` 期望文本随诊断变化已更新）。

## M22.3：擦除判据接线与统一 codegen（2026-11）

**目标**：擦除由 rig 判据驱动，DT codegen 产出 `build` / `seed` 需要的输出形状，重标定
机器无关指标。

1. **擦除判据单入口**：运行时表示只由 `Core.rigIsErased` 判定（`Rig` 的构造与判定仅在
   `Core`，其它模块只用访问器）；codegen 的 `ctorFieldTexts` / `genConArgs` / `altEnvGo` /
   `genTerm` 等 15 处跳过擦除位全部走它。隐式 binder（族参数、隐式索引 `{n : Nat}`）是
   `Rig0` → 擦除：`17_erase` 的 `Vec` 产物没有长度字段；显式索引 `(n : Nat)` 是 `Rig1`
   → 保留运行时字段，`vlen` 类定义能把它读回来。新增正例 `dt/38_explicit_index`：产物是
   `C_Vec_Cons of t_Nat * 'a0 * ...`、运行输出 1，锁定“不误擦”的一侧。
2. **DT 输出模型**：`Compile.dtProjectFiles` 统一产出整程序单文件 `main.ml` +
   `build.sh`（`cd "$(dirname "$0")"` + `ocamlopt -w -a -I +unix unix.cmxa main.ml -o main`）；
   逐模块 `.ml`/`.mli` 切分**推迟到 M24 的 seed 切换**（roadmap「决策变更」记一行）。
3. **build / seed 入口**：`build --dt [--no-compile] [DIR]` → `.output/{main.ml,build.sh}`
   →（默认）`ocamlopt` 到 `.output/bin/<pkg>`；`build --dt --split OUT` 与
   `seed --dt OUT` 只写两份源码、不跑 ocamlopt；`seed --dt` 必须显式 OUT 且拒绝写
   `seed/`（HM 信任锚点，轮换在 M24 切换）；库包 / 单文件入口 / 缺失路径都给出清晰错误。
   HM 的 `build` / `seed` 分支未动（零回归），`compile --package --dt` 仍被明确拒绝。
4. **metrics 重标定**：M21/M22 的编译器源码增长后按实测重设 `nix/metrics.budget`
   （seed 闭包 37 个模块：bytes 1424318 / lines 13426 / longlines 5009 / letrec 727 /
   strcat 355 / zeroarg 51 / ctorcount 2778；`sh nix/metrics.sh` within budget）。

**验证**：`test/run-tests.sh` 新增 34d 段（build --dt 运行、--no-compile 布局、
--split / seed --dt 的 build.sh 可运行、seed --dt 拒绝 seed/、缺 OUT exit 2、库包错误、
HM build 零回归）；`--only 34` 与全量测试全绿；`dt/38_explicit_index` 三路一致。

**仍存边界**：DT 输出尚未逐模块切分（M24 seed 切换前置）；`seed/` 仍由 HM 生成，未轮换。
