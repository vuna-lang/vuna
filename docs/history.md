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
  很 DT」的方向实测收益低于成本，已显式记入 [dt-core.md](dt-core.md) §6.3（原 roadmap
  M24.6 的「明确不划算」小节，随本阶段完成归档），防止后人重做。

同时发现两个与 DT 无关的真 bug：`Pkg` 按包名去重会静默丢弃重名成员的整支依赖
（实测重名 workspace 全部静默 `exit 0`）；`Loader` 用 `Nothing => []` 把「模块未加载」
伪装成「无导出」。两者都记入 M24.6 的「顺手修掉」（M24.5/M24.6 的落地结果见文末两节）。

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


### M13–M20.5：DT 主线（从 roadmap 归档）

> 本小节是原 roadmap「已完成」列表里的阶段摘要，随 roadmap 清理移入；更早的 M1–M12.8
> 见「里程碑一览」与上面的里程碑细节。

- M13：DT 地基——新增 Core TT（`Type`/Pi/应用/lambda/if，NbE + beta/delta/eta，非累积宇宙）、双向精化器（一阶 metavariable、类型级隐式插入、delta 类型别名）、擦除型 DT codegen 与 `interp --dt` 核心求值器；`--dt` 单文件 opt-in（compile/check/interp），HM 路径零改动；新增 `docs/dt-core.md` 设计稿；seed 57 个文件 / ~0.92 MB。
- M14：索引族与依赖模式匹配——Core 增加 `TCon` / `TCase`（值域 `VCon` / `VCase`），`data F : <kind> where` 的索引归纳族（构造子写完整显式 telescope，宇宙域 binder 擦除、索引保留运行时表示），`case` 做索引 unification 与分支可达性/覆盖率判定（不可满足分支可合法省略、写错则拒绝），解除递归定义限制（SCC 分组，终止靠 delta 展开 fuel）；核心求值器与擦除型 codegen 同步扩展（运行时族 → OCaml 变体、构造子名加族前缀、`TCase` → `match` + 不可能分支 `failwith`）；新增 `test/corpus/dt/09_nat` / `10_vec` / `11_fin` / `12_eq` 正例与 `dt_err` 反例；隐式索引推断留 M15，仍是单文件 `--dt` opt-in，split/包集成留 M17。
- M15：隐式参数、接口与洞——元变量上下文（作用域逃逸检查）、隐式索引推断、trait/instance 字典编码 + 实例搜索、洞目标显示（`unsolved hole <loc> with goal <ty>`）。
- M16：终止性与覆盖性——surface AST 上的结构化递归终止性检查（`DT: cannot prove termination of <f>`），覆盖性边界固定；索引擦除分析落地为诊断（探测确认索引不能无条件擦，需整程序使用分析）。
- M17：DT 工具链——`vuna goal` 洞目标/上下文、`vuna lsp`（JSON-RPC over stdio：诊断、Full 同步、洞 hover，27 项冒烟断言）、`vuna doc` 支持接口与隐式签名；`Lsp`/`Json` 不进入 TCB。
- M18：自举迁移决策——seed rotation（stage1 == stage2）；用 DT 表达 de Bruijn 上下文良构（`Ctx a (Succ n)` 静态排除越界）；当时的结论「编译器本体暂不全量迁移」**已被推翻**，见「决策变更」。
- M18.5：DT 可靠性修复——lambda 形参擦除 bug（形参被无条件标为 erased：运行时使用时硬报错、未使用时静默少生成一层 `fun`）；擦除判据收敛为全仓唯一入口 `Elab.erasedBinder`（隐式恒擦 / 显式仅宇宙域擦），六处判据点统一；`run-tests.sh` 第 34 段加「同夹具 `interp` 输出 == 编译产物输出」逐夹具对拍；正例 `19_lam`、反例 `18_lam_type_used`。
- M18.6：核心表示层定型（QTT 预留）——`erased : Bool` 换成三值 `Rig`（`Rig0`/`Rig1`/`RigOmega`，`RigOmega` 在类型里存在但不产生）、`TType : Int` 换成不透明 `Level`；访问器分三层（构造 `rigOfBinder`/`levelSucc`/`levelMax`、判定 `rigIsErased`、展示比较 `levelToInt`/`levelEq`/`levelLt`）；`Core` 之外对 `Rig`/`Level` 模式匹配数为 0；**行为零变化**（全部 DT 夹具 `compile --dt` 产物逐字节相同）；正例 `20_rig`/`21_level`、反例 `19_rig_type_runtime`。
- M19：DT 语言面 parity（9/9，完成）——`let`（检查位 + 推断位脱糖为 `(\\x => body) e`，296 处）、推断位 `case`（元变量作期望类型，132 处）、嵌套构造子模式（改写成内层 case，410 分支）、多 clause 与方程左端模式（标准模式矩阵，399 名 / 978 行）、内建字面量模式（Bool→if，Int/String→if 链）、内建泛化（`==` / `/=` 隐式类型参数 + 精化期按实参类型特化、`str*` 进 prelude）、trait 高阶 kind（类参数 kind 从方法签名推断，投影 multiplicity 两侧统一）、`record`（声明/构造/字段访问/模式/更新，精化前统一降级）；`deriving`（展开成等价 instance，内建 Show/Eq/Ord trait 与内建 Show 实例）；顺带修掉
核心求值器两个缺陷（`normalizeCase` 不进分支体、`applyCaseAlt` 不处理兜底）与一条
M15 遗留缺陷（同 trait 多实例；细节见本文件后文各里程碑节）。
- M20：DT 多文件与模块集成——`--dt` 复用 `Loader`（`loadProgramRaw`、`import` / `--root`）、
  参数化 `data Foo a : Type`、签名类型变量隐式量化；剩余包目录归 M22.1。
- M20.5：泛型实例约束求解——`Core.solveMetaHo`（更高阶元变量按模式求解）、`Elab` 的
  字典延迟约束（`dgoals` / `resolveDictGoals`）、`constrainDictDom` 的 kind 检查；
  `Base.List.mem` 的 `Eq a` 与 `do` 的具体 bind/pure 打通。`git log` 的提交标为 M22。

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
5. **CI 收尾（`nix flake check`）**：`checks.context-budget` 在 M21/M22 后超预算
   （`coldstart_bytes` / `arch_lines` / `max_ref_lines` / `max_module_lines`）。修法：
   (a) 把 M16 终止性检查从 `Elab` 抽成 `Vuna.Compiler.DtTerm`（单模块 2674 → Typecheck
   2529，≤2540 行上限；闭包 38 个模块、总分块量不变）；(b) `dt.md` 211 → 139 行、
   `testing.md` 178 → 166 行（压缩示例与夹具清单，细节留在 roadmap/history），
   `architecture.md` 204 → 195 行并收紧 DT 边界段——预算文件**未上调**（`context.budget`
   的“只降不升”约束）；(c) 按 38 模块重新实测 `nix/metrics.budget`（bytes 1425475 /
   lines 13462 / longlines 5011）。最终 `nix flake check` 8 项全绿。

**验证**：`test/run-tests.sh` 新增 34d 段（build --dt 运行、--no-compile 布局、
--split / seed --dt 的 build.sh 可运行、seed --dt 拒绝 seed/、缺 OUT exit 2、库包错误、
HM build 零回归）；`--only 34` 与全量测试全绿；`dt/38_explicit_index` 三路一致。

**仍存边界**：DT 输出尚未逐模块切分（M24 seed 切换前置）；`seed/` 仍由 HM 生成，未轮换。

## M23：全仓源码与夹具迁移（2026-11）

### 1. 三包源码迁到 DT 下通过

**目标推进**：`vuna check --dt .`（root/lib/app + compiler/base 依赖闭包）与
`vuna build --dt .` 首次全仓通过；`compiler/.output/bin/vuna-compiler` 与
`.output/bin/vuna` 两个 DT 产物可运行（help/check 正常）。签名回填已在先前提交完成
（一次性工具 `Vuna.SigExport`，`vuna sig-export`）。

**精化器补强（本阶段发现并修）**：

1. **HM 泛化签名的两类问题**：`{a} -> ...` 全隐式前缀的全局值必须在引用处实例化
   （`unifyErr : Result a`）；`==` 在无 Eq 实例时退回泛型结构比较（`bi_eq_generic`），
   否则 `List String` 等比较没有实例可搜。HM 推断出的 `tNNN` 类型变量直接走泛型比较。
2. **字典提升（M20.5）的索引 bug**：字典 binder 应插在**所有隐式 binder 之后**；插入
   TPi 链时 cod 的移位 cutoff = 剩余 binder 数（`shift 0 1` 只对 cod 根成立）；body 的
   替换要在 `insertLamBinder` **之后**做、`q = argIdx + 2`。修好后 `Base.Map` /
   `Base.List.mem` 等基库重新通过，`findMethodNamed` 一类的双类型参数函数不再把字典
   实参错当类型实参。
3. **通配 `let` 的移位**：`let _ = e in body` 落成 `(\_ => body) e` 时，body 的 de Bruijn
   索引要 `shift 0 1`；否则引用外层定义参数的 term 会指向错误的 binder（擦除检查报
   「type-level binding used at runtime」）。
4. **字面量 case**：`case s of "x" => ...; v => ...` 的比较用 `bi_eq_str`/`bi_eq_int`
   特化名（此前留裸 `==`，codegen 默认映射成 `bi_eq_int`，字符串比较生成非法 OCaml）；
   兜底变量要真正绑定到 scrutinee（`(\v => body) scrut`）。
5. **嵌套模式 + 变量兜底**：精化器内联兜底体到更深 binder 作用域会错位，改用 DtMatch
   模式矩阵降级（`multiToCaseExpr` + `let`），按名字重新精化。
6. **推断位置也要特化** `==`/比较运算符（`inferApp` 的 globals 分支），否则 `if` 分支里
   生成的 term 与 check 位置不一致。
7. **覆盖率放行**：TCB 三包跳过穷尽性报错（对齐 HM 只告警 + `-w -a`），记录在 roadmap
   决策表。

**性能**：`checkSolsScoped` 原来在**每次 `convEc`** 扫全部元变量作用域，是编译器包
的主要瓶颈（180s 只走到第 800/1900 个定义）。改为只复核**本次新增**的解（解表前插，
旧表头 id 作分界），并在程序级做一次全表兜底；字典目标在定义体与实例体之后各收敛一轮。
`check --dt compiler` 从 >10min 降到**约 7s**，`check --dt .` **约 13s**（最终实测，含前几轮修掉的
dict-lifting 过度实例化）。

**codegen 补强**：`getArgs` / `readDir` 把 OCaml list 桥接回程序的 `List` 归纳族；
`prim_runIn` 参数反向桥接；**零运行时参数定义包 thunk**（与 HM 一致），避免
`help = let _ = print ... in 0` 在模块初始化时执行。

### 2. 夹具迁移与 `vuna interp` 切换

**`vuna interp` 改为精化后核心求值**：`Vuna.Interp` facade 从「Loader + HM `Typecheck` +
`Vuna.Eval` 免检求值」改为直接调用 `Dt.dtEvalFile`；删除 542 行的 `Vuna.Eval`；`interp`
的 `--dt` 开关移除（传入报 removed、退出码 2），`--root` 保留。求值是纯的：**任何
`main : IO a` 一律报** `DT: interp cannot execute effects (main : IO a); compile and run the
program instead`（不做「纯动作求值、效果丢弃」的错误二分）。`vuna test` 与 `vuna repl`
随之切到同一求值器；REPL 通过新增的 `Dt.dtEvalExpr`（program 源码 + 表达式源码，进口
`Loader.loadProgramRawOrderedSource`、`Elab.inferE` 推断表达式类型后 show）求值，顶层定义
仍须先写签名。

**夹具迁移**：`test/corpus/` 全部语言夹具改为 DT 断言路径（`interp` / `check --dt` /
`compile --dt` + ocamlopt），HM 只保留为源码自检（`vuna check .`）与包构建段（第 28/29/33、
34d 零回归），M24 再切/删。具体：

- 补全夹具顶层签名（签名工具 `sig-export` 的同款要求，测试文件同样适用）；
- `main` 返回数据的夹具改写为 `Int`/`String` 并保留被调函数覆盖（`run/03` 加 `toInt`、
  `run/13` 加 `sum`、`records/08` 改字段和、`modules/11` 改 `area`、`modules/23` 增
  `unT` 选择性再导出、`type_modules/01` 加 `toInt`）；
- 效果/不可归约夹具加 `.nointerp`（`run/16`、`run/17`、`run/10`、`stdlib/03`、
  `stdlib/07`、`stdlib/09`、`stdlib/10`、`dt_base/01`–`03`；`stdlib/06` 为既有）；
  多隐式参数字典的 `monad/04` 另加 `.nocompile`，只断言 `check --dt`；
- 负例 `.err` 全部改为 DT 实际诊断的稳定片段；interp 与 `compile --dt` 文案不同时用
  `.cerr`（`run_err/07`）。原「运行时匹配失败」夹具（`run_err/02`、`10`）在 DT 下成为
  静态覆盖错误；`run_err/03` 改为「产物运行期负例」（运行非 0、stderr 含
  `division by zero`）；
- 删除 `traits/96_deriving_ord`（DT 支持 Ord 派生，正向覆盖在 `dt/31`）；
  `records/95_unresolved_record_type` 改写为 `95_ambiguous_field`（DT 在同场景报
  `ambiguous field`）；原 runner 第 12 段与段 2 重复，删除后 runner 为 **34 个编号段**
  （34a–34d 在段 34 内）；
- 夹具规模：`corpus/dt` 正例 **44**、`corpus/dt_err` 反例 **33**（新增 dt/40–44：
  record update、参数化 record、命名实例、参数化 Eq 派生、短路；dt_err/30–34：重复实例、
  未知方法、`@inst` 误用、参数化 Show 拒绝、update 歧义）。

### 3. 夹具迁移驱动的 DT 能力补齐

- **零运行时参数构造子**：`Elab` 对 telescope 只剩擦除 binder 的构造子（`Nil`）生成
  `TCon`，并用隐式元变量填满 telescope 实参（VCon 实参与 case binder 逐位对齐）。修好
  `range` / `split` / `lines` 一类「递归产出 `Nil`」的核心归约（`stdlib/05` 恢复三路一致）。
- **record**：`DtRecords` 把 `{ r | x = ... }` 降级成「case + 重建构造子」（字段名唯一定位
  record、歧义/未知报错）；参数化 record 的 family kind 由参数补齐；构造子名**去掉 `Mk`
  前缀**（DT 已支持与族同名的构造子），派生 `Show` 因此输出 `(Point 1 2)` 而非内部名。
- **命名实例 `@inst`**：`Elab.inferInstSel` 按名取实例字典，生成 eta 展开的方法投影
  （裸 `case` 当函数应用不会 β 归约）；命名实例不参与自动搜索（与 HM 一致）。
- **实例诊断**：同 head 的默认实例（含 `deriving` 生成、跨模块）报 `duplicate instance`；
  实例含未声明方法报 `instance has unknown method`；缺方法检查提前到方法体精化之前。
- **`deriving`**：生成体不再引用源码 `True`/`False`（改用 Int `==` 产生 Bool）；`Show
  String` 加引号对齐 HM；参数化 data 的 Eq 走通用结构比较兜底，Show/Ord 参数化派生显式
  拒绝并给清晰错误。
- **`&&` / `||` 短路**：精化期降级成 `TIf`（`a && b` ⇒ `if a then b else False`），
  core 求值与 codegen 自动一致；`False && (1/0 == 0)` 不再触发除零。
- **除零**：`Core` 对 `a / 0` 不归约（interp 报 `main does not reduce to a value`），
  产物为 `failwith "division by zero"`；两个入口的可观测差异记录在 limits。
- **`strPack`/`strUnpack` codegen**：按程序是否声明 `List` 族映射到 `dtp_*` 桥接或
  `bi_str*`，修掉未声明 List 时生成未绑定 OCaml 名的问题。
- **元变量/字典**：`DtQuant`/`DtKind` 按签名中名字的应用次数推断高阶 kind（
  `monad/04` 的 `m : Type -> Type` check 通过）；`dtEvalExpr` 与 `loadProgramRawOrderedSource`
  支撑 REPL 内存求值。

### 4. 已知边界与遗留（M24 处理）

- **多隐式参数 + 字典**：`liftFreeDictGoals` 逐调用点插字典 binder 的记账有 bug（
  `bindPair` 生成 3 个字典参数、`(v_bind d) d` 实参错位），影响 interp 与擦除 codegen；
  `monad/04_kind_generic` 用 `.nointerp` + `.nocompile` 保留 check 覆盖，修复留 M24。
- **`where` 子句**：DT 精化器不能在无期望类型时推断 lambda；M23 把相关夹具改写为等价
  顶层函数，**终态不保留该语法**（M24 随 HM 删除 parser/Fmt 的 where 支持，见 roadmap
  决策表）。
- **`main` 展示**：interp 只展示 `Int`/`String`/`Bool`，不展示 data/record 值（夹具已改写）。
- **效果程序**：interp 不执行效果（任何 `main : IO a` 报错），`test`/`repl` 同；REPL 定义
  须先写签名。
- **kind 诊断**：`instance Monad Int` 一类报通用 `type mismatch`，HM 的 kind 专属文案消失
  （`monad/90`、`stdlib/92` 的 `.err` 已相应改写）。
- **`@inst`** 只能显式选择命名实例，不参与自动搜索；参数化 `deriving (Show/Ord)` 不支持，
  参数化 Eq 走通用结构比较（需字典的场景仍可能缺实例）。
- HM（`Typecheck`/`TypedCodegen`/`Split`）代码路径保留到 M24；`seed/` 未轮换。

### 5. 验证

- `vuna check --dt .`（约 13s）与 `vuna build --dt .` 全仓通过；`vuna check .`（HM 自检）通过。
- `test/run-tests.sh`：**1019 checks 全绿**（34 个编号段；含 dt 44 / dt_err 33 三路互拍）。
- `nix flake check`：9 项全绿（`context-budget` 按本轮实测重新标定 max_module_lines，原因见
  `nix/context.budget` 标定历史）。
- `vuna fmt --check` 与 `vuna lint` 干净；旧 seed 能编译新编译器源码（stage1 由 `nix build`
  验证），`seed-selfhost` 的 stage1 == stage2 由 CI 保持。

## M24：单一 DT 路径落地（2026-11）

### 1. DT 逐模块 split codegen 与 seed 轮换

**目标推进**：seed 不再由 HM typed codegen 生成，改由 DT 擦除 codegen 的**逐模块 split**
输出生成；`--dt` 开关消失，check/compile/build/seed/interp 全部走 DT。

**生成器**（`CoreCodegen.generateDtSplitProgram`）：

- 整程序先按 DT 精化，再按「声明归属」把 datas/defs 切到模块文件；归属表由 Loader 的
  module 声明构造（数据/签名/函数/trait/实例名 + 派生实例名按 `Elab.instanceName` 同规则
  展开，`DRecord` 的 deriving 也算）。名字归属优先级：精确声明名 → 内建类投影/内建实例
  （`Vuna_builtins`）→ `Show_Show_<data>` 等派生实例前缀反查 data 所属模块 → 带点名字按
  模块前缀 → entry 声明（`Main`）→ 报清晰错误（不静默丢定义）。
- 文件集：`Vuna_runtime.ml`（`dtRuntime`）+ `Vuna_builtins.ml`（内建 `Dict_Show/Eq/Ord`
  与内建实例/投影）+ 每个源码模块一个 `<Module>.ml`（依赖序，`open` 所有更早模块）+
  `Main.ml`（entry defs + main 钩子）+ `build.sh`。**不生成 `.mli`**：跨模块引用靠全局
  唯一 OCaml 名字（`v_<sanitized global name>`、`C_<family>_<ctor>`、`t_<family>`）与
  `open` 链；`build.sh` 复用 `Split` 的增量构建脚本（无 `.mli` 时干净构建只编 `.ml`）。
- 每个模块内类型用 `genTypeDeclsOf allDatas subset`（族间参数推断仍用全量 datas，只 emit
  本模块族）；运行时定义按模块子集重新做 SCC 分组（跨模块依赖由模块依赖序保证，不会成环）；
  零运行时参数定义仍包 thunk（`main` 例外）；List 族的 `strUnpack/strPack` 桥接跟在声明
  List 的模块末尾（后续模块 open 后可用）。
- `SplitCli` 重写为 DT split CLI：`buildSplit`/`seedSplit` → `Dt.dtSplitProject`（Loaders
  `loadProject` + `resolveProject`，modules 反序成依赖序）→ `writeSplitFiles` + `build.sh`。
  `Compile`/`CompilerCli` 同步删 HM 入口。

**rotation**：`sh nix/seed-rotate.sh ./result/bin/vuna` 一次性通过——旧 seed 编译新源码 →
新编译器 `seed` 生成 38 文件（37 `.ml` + `build.sh`，0 `.mli`）→ 新 seed 构建 stage1 →
stage1 重生成逐字节一致 → TCB 断言 → 替换 `seed/`。rotation 后 `nix build .#vuna-seed`、
`.#vuna-compiler`、`.#vuna` 全部从新 seed 重建通过；`nix flake check` 9 项全绿。

### 2. HM 删除与单路径 CLI / LSP

- 删除 `Vuna.Compiler.Typecheck`、`Vuna.Compiler.TypedCodegen`、`Vuna.SigExport`（一次性
  签名工具）；`compiler/vuna.toml` 移除 Typecheck/TypedCodegen；仓库内无任何引用。
- CLI 收敛（`CompilerCli` 重写，352 行）：`compile [--no-print] [--root]... (file|pkgdir)
  [out.ml]`、`check [--root]... (file|pkgdir)`、`build [--no-compile] [DIR]`（默认 DT
  单文件 `main.ml` + `build.sh` + `.output/bin/<name>`）、`build --split OUT [DIR]`、
  `seed OUT [DIR]`（必须显式 OUT）。`--dt` 全部 removed（exit 2，含 interp），
  `compile --package` 删除；`nix/packages.nix` 的 stage1 改为 `vuna-seed seed stage1
  compiler`（旧 HM seed 也支持 `seed`，新旧形状一致）。
- LSP：`diagnosticsFor` 改为 parse + `Elab.elabProgramWith`（DT 精化错误，severity 1），
  删除 `checkProgramInfoElab`/`exhaustiveWarningsFor` 的 HM 诊断分支；hover 仍
  `goalsOfProgram`；含 `import` 时仍跳过类型检查。
- `nix/checks/vuna-metrics.sh` 口径从 `compile --package` 改为 `vuna seed` 聚合 DT split
  产物，`nix/metrics.budget` 按实测重标定（files 37 / bytes 1165000 / lines 11550 /
  longlines 3450 / letrec 480 / eqint 125 / zeroarg 95 / ctorcount 3550）；
  `seed-selfhost.sh`/`vuna-package.sh`/`bench.sh`/`index-check.sh` 同步新 CLI；
  `nix/tcb-forbidden.txt` 无需改（HM 模块从未以短名列入，DT split 命名规则不变）。

### 3. `where` 绑定显式签名语法（保留 where）

- AST 新增 `EAnn : Expr -> Expr -> Span -> Expr`（表达式类型标注）；Parser 的 where 块
  允许签名行 `name : Ty`（同名子句前；重复/悬空/顺序错误有带位置的 parse 错误），降级为
  `ELet ... True`，绑定值 = `EAnn value ty`（函数子句为 `EAnn (ELam ...) ty`）。
- Elab：`checkWhereSigs` 要求 where 的每个绑定有签名（缺失报
  `DT: where binding `<g>` needs a type signature (write `<g> : <type>` before the clause)`）；
  `ELet ... True` 按**顺序 let** 精化（不做 ctx 预绑定/递归组）；`inferE/checkE` 支持
  `EAnn`（checkType ty → 按 eval ty checking）。Loader/DtRecords/DtMatch/DtTerm/Index/
  Fmt 补 `EAnn` 遍历；Fmt 在 where 绑定前渲染签名行、非 where 位置透明渲染。
- **语义决策**：where 是局部顺序 let，不支持前向/自/互递归（递归放顶层定义组，顶层组
  仍支持互递归/自递归/前向引用）。夹具 `typed_ok/06..08` 改为新语义（捕获外层参数 /
  多绑定顺序依赖 / 单绑定+case），`fmt/05`、`fmt/15`、`fmt/typed/01_where` 加签名；
  新增负例 `dt_err/35_where_no_sig`。

### 4. `tNNN` 签名清理与名字启发式删除

- 删除 HM 后剩余 9 文件 77 处 `t<数字>` 类型变量（Loader 15、DtRecords 13、Pkg 10、Toml 6、
  Manifest 4、Elab 4、Lint 20、Fmt 3、Index 2），按每个签名内首次出现顺序改为 `a`/`b`/`c`…；
  全仓 `\bt[0-9]{3,}\b` 归零。
- `Elab.isInferredVarName`/`isInferredVarValue`/`allDigitChars` 与 `specializeEqTy`/
  `specializeCmpTy` 的名字分支删除。**终态语义**：HM 删除后不再产生 `tNNN`；刚性类型
  变量保持 M22 字典提升/延迟提升（实例/deriving 优先）；`bi_*_generic` 只作「具体类型
  无实例」兜底。曾试「刚性变量一律 genericEqApp」，实测两个回归：自定义 `instance Eq`
  被旁路（`mem` 从 T 变 F），以及 `Core.valueEqDeep` 用 `force` 不是 `normalize` 使
  `range` 递归在 interp 下卡住（`stdlib/05` 变 F）。`force→normalize` 留待后续（非本阶段）。

### 5. 验证

- `nix flake check`：9 项全绿（tests/package/metrics/typecheck/lint/index/context-budget/
  seed-selfhost/fmt）。
- `test/run-tests.sh`：**1026 checks 全绿**（34 个编号段；全仓 0 处 `--dt`；段 28/29/33/34d
  全部走新 DT CLI；包夹具 golden 不变——`main : IO Int` 的 do 末加 `exit 0`；段 13 由
  新 DT seed 自举编译并跑出 120）。
- `vuna check .`（DT 自检）、`vuna check compiler`、`vuna build .`（DT 单文件产物可运行并
  自检）、`vuna fmt --check`、`vuna lint`、LSP 冒烟、`nix/index-check.sh` 全部通过。
- `nix/context.budget` 按实测重标定（max_module_lines 3400 等）；`docs/` 双路径表述清零
  （历史文档除外，已标注）。

### 6. 已知边界（留后续）

- `monad/04_kind_generic` 的多隐式参数字典仍是 `.nointerp` + `.nocompile`（
  `liftFreeDictGoals` binder 记账 bug 未修）。
- `Core.valueEqDeep` 用 `force` 而非 `normalize` 强制实参（见 §4）。
- `where` 内递归/前向引用不保留（见 §3）。
- kind 诊断仍为通用 `type mismatch`（HM 专属文案已消失）。

## M24.5：等式搬运与精化器补强（2026-11）

### 1. 目标与实测基线

本阶段不加用户可见语法糖，只补精化器「给出索引等式」的能力，让 M24.6 的编译器本体
重构真的能写。原依据是 [reference/dt-parity.md](reference/dt-parity.md) §6 的实测表：
旧精化器只在「`case` 打在被索引族本身、且 goal 的索引就是该形参」时精化 goal，
`append` / `rep` / `lookupEnv` 这类跨形参 / 裸形参形态写不出。§6.1 已改成 M24.5 前/后
两列的能力表（每行都有夹具）。

### 2. 关键实现与修复（`Elab`）

1. **scrutinee 反射**（`reflectScrutinee` / `ctorValueIn`）：旧实现只把构造子的**结果
   索引**与 scrutinee 的索引合一；`case n of ...`（裸 `Nat` 形参）或包装族因此拿不到
   任何等式，goal 里的 `n` 不会被精化成 `Zero` / `Succ k`。现在索引合一之后，再把
   `evalCtx ctx scrutTerm`（只对 `NVar` 且 spine 为空的中性变量）与构造子结果值
   `VCon c [telescope 值]` 再合一一次，refs 同时喂 `refineValue expected` 与
   `ctxRefine`。Bool / Int / String 的 case 走各自专用降级路径，不受影响。
2. **不可达分支按上下文省略**（`branchReachable` / `ctxHasEmptyBinder`）：判据两层——
   ① 构造子结果索引与 scrutinee 索引合一失败（M14 既有）；② 分支 telescope 绑定 +
   索引合一后，分支上下文里有 binder 的类型是**空归纳族**（如进 `ENil` 分支时
   `n ↦ Zero`，于是 `i : Fin Zero`）。任何一层判不可达都允许省略该分支；写出来的
   不可达分支仍报错（索引不可达报 `this branch is impossible (index constraints are
   unsatisfiable)`，空族上下文报 `... (its context contains an empty inductive family)`）。
   空族判定只在索引**全刚性**时生效；索引含中性项（`Fin (plus x Zero)`）时保守判非空。
   **性能约束**：可达性只对**没写出来**的构造子计算（写出的分支跳过），否则
   `vuna check .` 会从 ~90s 掉到 400s+。
3. **隐式族参数版 `Eq` 构造的元变量内联**（`inlineSolvedMetas`）：`data Eq :
   {a : Type} -> a -> a -> Type` + `Refl : {a : Type} -> (x : a) -> Eq x x` 时，结果类型
   `Eq x x` 里的隐式族参数由检查器插成元变量、检查期解成构造子自己的 `a`；旧实现把这个
   level 形态的解留在 `dtCtorType` 里，使用点按另一份上下文求值就变成悬空变量
   （`constructor Refl: type mismatch: expected Nat, got a`）。现在构造子类型 / 族 kind /
   签名在登记前把**检查期已解**的元变量按当前 binder 深度 quote 内联（解越界时不内联，
   保守）。族 kind 与签名同样会被存进 `globals` 在别处求值，因此一起处理。
4. **定义性相等扩展到 `plus`**：`plus Zero n` 经 delta + case 归约到 `n`，一个 `Refl`
   收尾（`plusZero`）；`plus n Zero` 的归纳步靠反射把 goal 精化成
   `Eq (Succ k) (Succ (plus k Zero))`，再用归纳假设 + `cong`（`plusZeroR`）。
   `append` 的旧文档 ❌ 被实测推翻：分支精化 + `plus` 定义性相等已经足够。

### 3. 新夹具

- 正例 `dt/46_rep`（scrutinee 反射：`case` 打在裸 `Nat` 形参上）、`dt/47_lookup_env`
  （空族上下文的 `ENil` 分支省略）、`dt/48_eq_defeq`（`plusZero` 的定义性相等）、
  `dt/49_eq_induction`（反射 + `cong` 的归纳证明）、`dt/50_eq_transport`
  （值级 `sym`/`trans`/`subst` 与 Type 级 `cast`、索引级 `castLen`）。
- 反例 `dt_err/36_diff_index_case`（两个索引不同时仍要求写分支）、
  `37_impossible_branch`（写出索引不可达分支）、`38_empty_ctx_branch`（写出空族上下文
  分支仍必须报错）。

### 4. 边界（详见 [reference/dt-parity.md](reference/dt-parity.md) §6.3）

- 隐式**值**参数 `{x : a}` 不支持（报 `implicit parameters must be types or inductive
  families`）；证明辅助函数要把类型与值参数都写成显式（`cong`/`sym`/`trans` 夹具如此）。
- 构造子当函数值**部分应用**不参与 `conv`（`cong ... Succ ...` 与饱和应用产生的 `VCon`
  对不上，报 `expected (Succ n), got (Succ n)`）；用 lambda 或包装函数绕过。
- `Ctx n -> Fin n -> Tm n` 这类**取回依赖索引的值**仍写不出（需要「按位置变化的类型
  族」）；空族判定在索引含中性项时保守。
- 没有隐式等式搜索，等式要显式传参；类型当运行时值会被擦除检查拦下。
- 本阶段发现但未修的预存在 codegen 缺陷：类型级函数（`sel : Nat -> Type`）被当运行时
  定义、产物出现未定义的 `v_Int` / `v_String` —— 记为 M24.6 的修复项（§M24.6、dt-core §6.4）。

### 5. 验证

- 新夹具三路（`interp` / `check` / `compile` + ocamlopt）全绿；全量测试随 M24.6/M24.7
  继续增量，最终 **1076 checks**（见 M24.7 §4）。
- `vuna check .` 自检通过；`dt_elab` 基准不回归（可达性只对缺失构造子计算）。

## M24.6：编译器本体 DT 大重构（2026-11）

### 1. 分级与重新裁定

原计划三级：字段形状单一真源 / `Expr : Phase -> Type` / Core 的 de Bruijn 索引化。
M24 单路径落地后复核，只有第一级按原样落地，后两级**重新裁定**：

- **L1（字段形状 + 护栏）全部落地**（见 §2–§3）。
- **L2** 改为**入口护栏**：M24 后单文件 codegen 只接受 `DtProgram`（Elab 输出），不再
  接触 `Decl`/`Expr`；唯一还读 `Decl` 的是 split 的模块归属表。因此原 `Expr : Phase ->
  Type` phantom index 没有落点；改为 `generateDtSplitProgram` 入口调用
  `checkResolvedModules`，要求每个模块的声明名带模块前缀（Loader 保证的 resolved 形态），
  未 resolve 的裸声明一旦被喂进 codegen 会在入口被拒绝。单文件 / REPL / LSP 的 parsed
  入口不经过该函数。
- **L3** 只做**护栏 + 语言侧证据**：`Core.varIndex` 越界返回 `-1`、
  `checkAllDefScopes` 验证运行时定义体的 de Bruijn 作用域；`Env : Nat -> Type` + `Fin`
  total lookup 的骨架作为夹具记录（`dt/47_lookup_env` 的缺席分支省略）。`Core.eval`
  的 `List Value` 环境与 `Clos` 捕获环境**不换**索引表示——M24.5 后「取回依赖索引的
  值」仍写不出，索引化的核心收益不成立；而 `Clos` 需要存在式长度并改写 eval /
  applyClosure 全部调用点，风险与收益不匹配。按「每级完成即停」原则收窄。

两处裁定都记入 roadmap「决策变更」（M24.6 第二级 / 第三级两行）。

### 2. L1：构造子字段形状的单一真源

- `CoreCodegen.ctorKeepFlags` 从构造子 telescope 的 rig 算出 keep flags（`True` =
  该 binder 进运行时表示），`mkGenSt` 把它作为 `gsCtorShapes` 带入生成状态。
- 类型声明（`ctorFieldTexts`）、构造子应用（`genConApp`/`alignCtorArgs`）与 case 分支
  绑定（`genArm`/`altEnvChecked`）三处都消费同一份 flags，并在使用点校验长度与
  rig 一致；不一致报 `DT: internal: constructor shape ...`，不再静默少字段/错位
  （旧实现三处各自 `if erased`，字段数 / telescope 长度 / 绑定数无交叉校验）。
- 两种合法约定：普通构造子用**全 telescope**（含擦除隐式位），字典构造子
  `MkDict_C` 只用**保留字段**；`alignCtorArgs` / `caseAltBinders` 按长度择一并逐位校验。

### 3. L1 附带护栏与修复

- `Core.varIndex` 越界返回 `-1`（旧实现静默当成最外层变量 index 0，错得无声）；
  `checkAllDefScopes` 对**全部**定义体（含已整体擦除的类型级定义）做作用域验证，
  越界/负 index 在 check 期报 `DT: internal: out-of-scope de Bruijn index ...`。
- `ensureUniqueOcamlNames`：对实际生成的 `v_*` / `t_*` / `C_*` 名字做族内去重
  （`sanitizeName` 的转义本身是前缀码；护栏防未来改动引入碰撞）。
- **OCaml 保留字**：lambda binder 是唯一直接写裸标识符的地方，`ocamlBinderName` 对
  `method` / `type` 等保留字统一加 `_` 后缀；值 / 类型 / 构造子名分别有
  `v_` / `t_` / `C_` 前缀，不会撞保留字。
- **类型族整体擦除**：`isTypeLevelDef` 改用 `isTypeForming`（类型 force 后以宇宙收尾的
  Pi 链 `... -> Type`），`sel : Nat -> Type` 一类不再生成运行时定义（旧判据只看裸
  `Type`，生成未定义的 `v_Int`/`v_String`，`ocamlopt` 才炸）。正例 `dt/51`/`52`；在
  运行时定义里把擦除的族参数当值用仍报错（`dt_err/39`）；旧的三个「类型级 Pi 体用类型
  参数」负例（`dt_err/09`、`18`、`19`）语义纠正后删除。
- **split entry data 存量 bug**：`splitMainFile` 原来只发 entry defs、不发 entry datas；
  `app/Main.vuna` 里声明的 `data` 生成的 `C_*` 引用在 `Main.ml` 里未定义（默认单文件
  `build` 不复现，`build --split`/`seed` 的 `ocamlopt` 才报 Unbound constructor）。
  现在 `Main.ml` 先发 `genTypeDeclsOf entryDatas` 再发 defs；夹具
  `test/corpus/packages/05_entry_data`。

### 4. 新夹具与设计记录

- 正例 `dt/45_ctor_shape`（隐式族参数 / 显式索引 / 运行时字段 / record 构造子 / 参数化
  data / 宇宙域字段的构造子形状与 case 绑定）、`dt/51_type_family`、
  `dt/52_type_family`；负例 `dt_err/39_type_family_runtime_use`；包夹具
  `packages/05_entry_data`（`build --split` 的 entry data 回归）。
- 设计细节写进 [docs/dt-core.md](dt-core.md) §6.1–§6.4（字段形状、L2/L3 裁定、类型族），
  roadmap 不再保留已完成阶段的详细段落。

### 5. 验证

- `dt/45` 三路、`dt/51`/`52` 的 `interp`/`compile`+ocamlopt、`packages/05_entry_data`
  的 `build --split` 全部通过；`vuna check .` 自检通过；全量测试随 M24.7 收尾为
  **1076 checks**（见 M24.7 §4）；rotated seed 的 stage1 == stage2。

## M24.7：Eq / Ord / Show 库化（2026-11）

### 1. 第一波：库模块落地（过渡态）

- 新增 `base/lib/Base/Show.vuna` / `Eq.vuna` / `Ord.vuna`：trait 声明 + `Int` / `String` /
  `Bool` 实例，方法面与编译器内建逐位对齐（`show : a -> String`；`eq` / `neq`；
  `lt` / `le` / `gt` / `ge`）。`Show Bool` 用 `if` 输出 `True`/`False`；`Eq Bool` 方法体
  用析取（`Bool == Bool` 会落到该实例，不能自递归）；`Ord` 的方法体直接写比较运算符
  （`Int` 走精化期特化，`String`/`Bool` 走泛型运行时，不会自递归）。
- 更新 `base/vuna.toml` `[export]`、`Base.vuna` 门面与 `Prelude.vuna`（Prelude 增重导出
  `Base.{Show,Eq,Ord}`，包模式自动可见）；seed 闭包 37 → 40 个 `.ml`。
- 第一波只落地库模块，编译器仍注入同形内建 trait/实例、`Loader` 短名放行仍生效
  （过渡态）。

### 2. 第二波：删除内建、收敛到库

- **`DtDerive`**：删除 `builtinTraitDecls` / `builtinShowInstances` /
  `builtinEqInstances` / `builtinOrdInstances`；`expandDerivings` 用 `DData` 里**已由
  Loader 解析**的 derivings 名（如 `Base.Show.Show`）生成实例头，按类名最后一段分派
  （`Show`/`Eq`/`Ord`），方法体里对同类方法的递归调用用解析后的投影全局名
  （`Base.Show.show` 等）——`Loader` 短名放行已删除，裸名再也解析不到。
- **`Elab`**：`==` / `/=` 的字典名与方法投影名从 `ecClasses` 按短名 `Eq` 查
  （`findClassByShortName` / `classMethodProjection`），不再硬编码 `Dict_Eq` / `eq`；
  比较运算符同理查 `Ord`；参数化字典的类参数按当前上下文深度 quote，避免刚性变量错位。
- **兜底语义**：具体类型没有 `Eq` 实例时 `==`/`/=` 退回 `bi_eq_generic`；程序里没有
  `Eq` 类（单文件 / 未 import）同样退回。`<`/`<=`/`>`/`>=` 的运行时特化改用
  `cmpBuiltinTyName`（只认 `Int`/`String`/`Bool`）——**修复用户 `data` 上 `<`**：
  旧实现把任何零参全局（含用户 data 族名）都当内建类型，`deriving (Ord)` 的
  `Red < Blue` 报 `DT: '<' is not defined for C3 (Ord instance required)`；现在走
  `Ord` 字典，无 `Ord` 类时退回泛型比较。
- **`Loader`**：删除 `isBuiltinTraitName` / `isPreludeTraitMethod` 与
  `dtPreludeNames` 里的 `show`/`eq`/`neq`/`lt`/`le`/`gt`/`ge`；裸名只能经 import 的
  导出表解析，unbound 诊断追加可操作提示（`trait Show is not in scope; add
  \`import Base.Show\`` 等）。
- **`Loader` 防御性修复**：`moduleDecls` / `exportsOf` 的 `Nothing => []` 改为
  `loader: internal: module ... is not loaded`——旧实现把「加载器状态不一致」伪装成
  「没有这个导出」，错误被静默吞掉。
- **`Pkg` 包名唯一性校验**：包名参与 `Loader` 的「同包永远可见」与 effectful 内建
  allowlist 判定，同名不同目录是配置错误。新增 `checkUniquePackageNames`（同名同目录的
  diamond 合法；同名不同目录报 `duplicate package name ...`），旧实现 `dependencyRoots`
  按包名去重会静默丢弃整支依赖；夹具 `packages/93_duplicate_name`。

### 3. 单文件 / 裸 `--root` 的 import 约定

- 包模式仍自动导入 `Prelude`；单文件 / 裸 `--root` 模式不再自动可见 trait 与实例：
  需要 `--root <repo>/base/lib`（测试里 `--root ../base/lib`）并在文件头显式
  `import Prelude`（或按需 `import Base.Show` / `Base.Eq` / `Base.Ord`）。
- `test/run-tests.sh` 的单文件循环统一加 `BASE_ROOT="--root ../base/lib"`；需要
  `show` / `==` / 比较 / `deriving` 的夹具补 `import Prelude`（只用 `Int`/`String` 原语
  或泛型兜底比较的夹具可以省略）。包目录夹具（`corpus/packages/`、`corpus/dt_pkg/`）
  不受影响。

### 4. 验证

- `test/run-tests.sh`：**1076 checks 全绿**（34 个编号段）；`vuna check .`、
  `vuna check compiler`、`vuna fmt --check`、`vuna lint`、`nix/index-check.sh`、
  `vuna-package` 全绿；`nix/metrics.budget` 与 `nix/context.budget` 通过。
- seed rotation：**40 个 `.ml` / 41 文件**（`Base_dShow` / `Base_dEq` / `Base_dOrd` 进入
  闭包，`Vuna_builtins` 变空），stage1 == stage2 fixed point；`nix build .#vuna-seed` /
  `.#vuna-compiler` / `.#vuna` 从新 seed 重建通过（`nix flake check` 由 Lead 在收尾时
  复跑）。
- `nix/metrics.budget` 与 `nix/context.budget` 通过：metrics 实测 seed 闭包 40 个 `.ml`
  （bytes 1184619 / lines 11867 / longlines 3513 / letrec 495 / ctorcount 3591，均在
  预算内；删内建 trait/实例后 codegen 产物回降）；`context.budget` 的 `max_ref_lines`
  随 dt-parity §6 重标定到 208（实际 203），入口文档与 `max_module_lines` 不变。

### 5. 边界与遗留

- 单文件 / 裸模式必须显式 import（见 §3）；缺 import 时诊断给可操作提示。
- 具体类型无实例时 `==` / 比较的 generic 兜底语义见
  [reference/limits.md](reference/limits.md)；`deriving` 对参数化 data 仍只支持 `Eq`。
- `monad/04_kind_generic` 的多隐式参数字典仍是 `.nointerp` + `.nocompile`
  （`liftFreeDictGoals` binder 记账 bug 未修）；`Core.valueEqDeep` 仍用 `force` 而非
  `normalize` 强制实参（见 M24 §4）。

## M24 后续维护：源码模块重组（2026-11）

### 1. 动机

M24.7 之后 `compiler/lib/Vuna/Compiler/` 是 25 个扁平模块，四个超大模块吃掉几乎所有
阅读与维护成本：`Elab.vuna` 3529 行、`CoreCodegen.vuna` 1781 行、`Loader.vuna`
1363 行、`Core.vuna` 1227 行；同时 `DtKind` / `DtQuant` / `DtPrelude` / `DtMatch` /
`DtRecords` / `DtDerive` / `SplitCli` / `Process` 这些「小但独立」的模块没有层次归属，
`Index` 的 `--find` / `--impact` 与模块面检查也要求稳定的模块边界。根包工具链的
`Fmt.vuna`（约 1200 行）与 `Lint` / `Index` 是同样的形态。

### 2. 原则

- **目录即层**：目录 = 依赖层次；同层可互相 import，上层依赖下层，反向禁止。
- **门面模式**：每层 `X.vuna` 只 import 子模块 + 选择性重导出，**对外名字面与拆分前
  逐项一致**（外部只需 import 门面，不感知叶子）；实现只在 `X/` 叶子。
- **数据定义只在叶子**：`Core.Term`、`Elab.Types` 等是数据的唯一真源，门面不定义数据。
- **控制流按 SCC 内聚，不硬拆**：`Elab.Term`（infer/check 与 case 互递归）、
  `Elab.Meta`（共享工具层）保持整体；否则要新造大量中间接口。
- **每模块 ≤~800 行**：超了就按「数据/工具/入口」切开。
- **`base/` 公开 API 不动**：base 的 15 个模块名就是用户可见 API（一概念一模块），
  重组只发生在 `compiler/lib` 与根包工具链实现。

### 3. 旧 → 新模块映射

| 旧模块（M24.7，25 个） | 新模块（40 个） | 说明 |
| --- | --- | --- |
| `Ast` / `Lexer` / `Parser` / `Toml` / `Manifest` | `Frontend.{Ast,Lexer,Parser,Toml,Manifest}` | 归入 Frontend 层 |
| `Builtins` | `Loader.Resolve`（合并） | 内建元数并入名字解析层 |
| `Pkg` | `Packages.Pkg` | 归入 Packages 层 |
| `Loader` | `Loader` 门面 + `Loader/{Modules,Resolve,Flatten}` | 数据/模块图、名字解析、flatten 三层 |
| `Core` | `Core` 门面 + `Core/{Term,Eval,Conv}` | 表示层、NbE、定义性相等 |
| `Elab` | `Elab` 门面 + `Elab/{Types,Meta,Case,Dict,Term,Data,Trait,Driver}` | 精化状态/工具/case/字典/项/数据/trait/入口 |
| `DtKind` + `DtQuant` | `Elab.Sig`（合并） | 类参数 kind 推断 + 签名自由名量化 |
| `DtPrelude` | `Elab.Prelude` | 内置定义表 |
| `DtMatch` | `Elab.Match` | 多 clause/模式矩阵降级 |
| `DtRecords` | `Elab.Records` | record 语法降级 |
| `DtDerive` | `Elab.Derive` | deriving 实例生成 |
| （无） | `Elab.Termination` | 终止性检查（原独立模块，归入 Elab 层） |
| `CoreCodegen` | `Codegen` 门面 + `Codegen/{Decl,Erase,Term,Program,Split}` | 名字/类型声明、擦除与 SCC、项生成、单文件、split |
| `Split` | `Driver.Split` | 输出模型 + build.sh |
| `SplitCli` | `Driver.Compile`（合并） | `buildSplit` / `seedSplit` 并入编译入口 |
| `Process` | `Driver.CompilerCli`（合并） | `runIn` 并入 CLI（`Vuna.Process` 已删除） |
| `Compile` | `Driver.Compile` | 编译入口 |
| `CompilerCli` | `Driver.CompilerCli` | 编译器 CLI |
| `Dt` | `Driver.Dt` | DT facade |
| 根包 `Fmt` | `Fmt` 门面 + `Fmt/{Comment,Decl,Expr,Util}` | 注释保留 / 声明 / 表达式 / 小工具 |
| 根包 `Lint` | `Lint` 门面 + `Lint/{Rules,Fix}` | 规则与修复 |
| 根包 `Index` | `Index` 门面 + `Index/{Types,Scan,Query,Render}` | 数据/扫描/查询/渲染 |
| `Vuna.Process`（根包） | 删除 | `runIn` 在 `Driver.CompilerCli`，工具链不再有独立进程模块 |

`base/lib` 的 15 个公开模块（13 个 `Base/*` + `Base` 门面 + `Prelude`）保持不变。

### 4. 规模变化（实测）

- compiler 模块数 **25 → 40**；源码行数 **12956 → 13853（+897）**——主要是模块头 +
  门面重导出 + 新模块的接口行，逻辑没有净增。
- seed 闭包 **40 → 55 个 `.ml`**（文件集 41 → 56，含 `build.sh`）；stage1 == stage2
  逐字节 fixed point。新增的 `Vuna_dCompiler_dFrontend_d*` / `dLoader_d*` /
  `dElab_d*` / `dCodegen_d*` / `dDriver_d*` 就是拆分后的模块。
- 单模块最大值 **3529 → 823 行**（`Elab` → `Frontend/Parser`）；`max_module_lines`
  预算 3530 → 840（实测 823）。依次为 `Frontend/Parser` 823、`Elab/Term` 804、
  `Elab/Meta` 717、`Elab/Trait` 701。
- 文档同步后的 context 实测：coldstart 28076/29200、agents 103/104、arch 155/178、
  readme 166/168、max_ref 204/208、max_module 823/840（架构文档按新布局重写后
  coldstart/arch 反而回降；README/AGENTS 只做等价替换、行数不变）。
- metrics（seed 闭包）：bytes 1285679 / lines 12569 / maxline 8152 / longlines 3730 /
  letrec 495 / eqint 118 / zeroarg 74 / ctorcount 3591；预算已按实测更新为
  1290000 / 12600 / 8250 / 3760 / 496 / 120 / 76 / 3600。

### 5. 验证

- **1076 checks**（34 段）全绿；`vuna check .`、`vuna fmt --check`、`vuna lint`、
  `vuna index` 全绿。
- **旧 seed 能编译新源码**：`nix build .#vuna-seed` 通过；rotation 后 55 `.ml` /
  56 文件 fixed point；`nix flake check` 由 Lead 收尾复跑。
- 模块名解析面：`vuna map --find Vuna.Compiler.Elab.Driver.elabProgramFull` 等新符号
  可用（`nix/index-check.sh` 已改用定义模块全名，门面前缀不再作为 `--find` 键）。

### 6. 边界与遗留

- **`Elab.Term` 804 行**是当前最大的控制流模块：`inferE`/`checkE`/case 规则共 48 个
  定义的 SCC（双向检查与 case 精化互递归），再拆需要新造大量接口，暂不硬拆。
- **`Loader.Resolve` 624 行**含名字解析 + 内建元数 + effect allowlist；若继续降本，
  可把 `builtinArity` 拆回独立叶子（但会重新引入「微模块」问题）。
- 若还要继续压 `max_module_lines`，优先拆 `Elab.Meta` / `Elab.Term`（工具层 vs 规则层），
  其次是 `Loader.Resolve` / `Codegen.Term`（名字编码 vs 生成）。
- `base/` 保持不动是**有意决定**：公开模块名 = API，重组会破坏所有用户 import；
  非公开实现如果要拆，只能在 `Base.*` 内部拆分并保持导出面。
- 代码注释里把这次重组标为「M25 前从 Loader.vuna 拆出」/「M25 重组」；本文档统一称
  **M24 后维护**，roadmap 的 M25 是模块系统 v3，两者无关（不要把重组当 M25 交付）。
- 旧模块名只保留在历史叙述（本目录及 `dt-parity.md` 的「原 X」注释）中；当前模块面
  以 `compiler/vuna.toml` 的 `[export]` 与本文 §3 为准。
