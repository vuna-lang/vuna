# 历史与已完成里程碑

本文记录 vuna 的里程碑历史（逐条一句话摘要）。路线图与后续阶段见
[docs/roadmap.md](roadmap.md)（roadmap 的「已完成」列表只保留分组摘要）；各里程碑的
实现细节在 git 历史里，不在此维护。各里程碑对应的模块与设计见
[docs/architecture.md](architecture.md)、[docs/reference/compiler.md](reference/compiler.md)。

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
  `DT: index unification ran out of reduction fuel`；当时的结论「编译器本体暂不全量
  迁移」已被推翻（见 roadmap 决策变更），metrics 重新标定。
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

## M25：健全性与验证基建（2026-11）

- **删除检查豁免**：去掉按包名跳过终止性/覆盖率的 `dtTrustsTermination`/`dtLibraryTrust`/
  信任字段；compiler、base 与 root 工具链全部源码通过 **SCT（size-change termination）**
  + 显式 fuel/结构递归检查；覆盖率豁免与 `TInt 0` 哨兵一并删除，缺分支一律报错。
- **检查器**：调用图 + Kosaraju SCC、每环严格边、守卫 Int（`n>0` + `n-k`）、fuel-thread
  规则、构造子包装/投影下降；修复旧遍历漏洞（`EApp` 实参、`let`/`where`、`EAnn` 不遍历，
  互递归不查）；拆 `Elab/Termination`→`Measure`/`Scc`、`Elab/Term`→`Impl`/`Support`。
- **内核**：`applyValue` 不再静默丢实参（新增 `VApp` 卡住应用）；作用域护栏覆盖全部定义；
  泛型相等兜底只允许可安全结构比较的类型（函数/含函数字段 data/类型/元变量报错）。
- **源码可达性**：前端状态机（Lexer/Parser/Toml/Pkg/Loader/CLI）与工具链（Json/Fmt/Files/
  Index/Lint/Repl/Lsp）用输入规模 fuel 或 `Base.List.range` 结构递归达标；`Base.List.range`
  改倒计数、`Base.String.split` 共享显式 fuel。
- **验证基建**：`nix/ci.sh`（eval-cache=false + keep-going）、seed 闭包数量断言
  `nix/seed-count.txt`、`checks.seed-selfhost` 的 `diff -r seed s1` 同步检查；seed 与源码
  同步从「允许落后」改为硬不变量；metrics 预算按 SCT/fuel 结构增长重新标定。
- **基线**：seed 60 `.ml` / 61 文件、1112 checks、`nix flake check` 全绿；诊断去掉里程碑
  编号；`internal` 前缀只保留给编译器不变量。

## M25 同期：统一错误码体系（main 3734036）

- 诊断加语义错误码前缀 `[TC_/CG_/LN_/FX_]`（`TC_` Elab 精化/终止/覆盖、`CG_`
  Codegen/Driver/Dt、`LN_` lint 规则、`FX_` 从可修复 `LN_` 推导）；同语义消息共享
  一个符号、符号只增不删（`(Mxx)` 不参与判定）。
- lint 输出 `路径:行:列: [LN_XXX] 规则: 消息`，Elab/Codegen 输出
  `文件:行:列: [CODE] DT: ...`；新增 `vuna gen-errors [ROOT]` 从源码 `-- @code`
  docstring 生成错误码文档（`ROOT/docs/.generated/errors.md`，gitignored、幂等、勿手改）。
- `test/run-tests.sh` 新增错误码段（分区 + 幂等）；错误码约定见
  `docs/reference/dt-tooling.md` 第 4 节。
