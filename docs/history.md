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

## M26：包上下文统一与单一 codegen 输出模型（2026-11）

- **包上下文唯一**：`Pkg.PackageContext`（抽象，不导出构造子）+ `contextForFile`（向上找
  最近 `vuna.toml` + 依赖闭包）/ `contextForDir`（工具/REPL 从 cwd 取上下文）/ `locateBase`；
  删除环境根：`--root`、`rawRoot`、`List Root` / `Root` 公共构造子、`loadProgram*` 门面
  API，以及 `Driver.Dt` / `Driver.Compile` 的单文件入口。Loader 的 import 可见性由
  **导入方包的依赖闭包**决定（方向回归 `packages/95_cross_dep`）。
- **无 manifest = base-only**：`locateBase` 先读 `VUNA_BASE`，否则按可执行文件相对布局
  `<exeDir>/base`、`../base`、`../../base`、`../../../base` 探测，找不到时明确报出尝试
  路径。为此新增内部原语 `prim_getenv` / `prim_getcwd` / `prim_execPath`（只有 `prim_*`
  名、无公开别名；effectful、仅 TCB 三包可用；`/proc/self/exe` 为 Linux 假设，语义规范
  归 M27）。ad-hoc 单文件与包内模块一样自动注入 Prelude（删除 `implicitPrelude` 对
  `importerPkg==""` 的旁路）。
- **两阶段 seed rotation**：先把新原语/包上下文以旧种子可编译的形式落地并 rotate，再在
  装配统一、删除空 builtins unit 后二次 rotate；最终 seed **65 `.ml` / 66 文件**
  （`nix/seed-count.txt`），`Vuna_builtins` unit 删除（A02）。
- **唯一输出模型**：删除单文件 codegen（`Codegen.Program` → `Codegen.Assembly`，只保留
  同一 `DtProgram` 的装配），`Codegen.Split` 成为唯一生成器（`Vuna_runtime.ml` + 各模块 +
  `Main.ml` + `build.sh`，无 `.mli`）；`compile <entry|pkg-dir> OUTDIR` 只 codegen、OUTDIR
  必填且成功静默；`build [--no-compile] [--out DIR] [PKG-DIR]` 默认 `<PKG-DIR>/.output`，之后
  执行 `build.sh` → `DIR/bin/<包名>`；`--split` / `seed` 子命令删除并给可操作提示
  （A01/A15）。
- **装配与归属身份**：`checkResolvedModules` 同时校验 entryDecls（不带点、非空、不重复）
  与每个 `DtDef` / `DtData` 的归属（C08）；Split 改用 `Elab.instanceName` /
  `derivedInstName` + `Derive.instHead`，删除字符串归属表（A13）；入口 data/trait 可进
  产物（`packages/05_entry_data`、`06_entry_trait`）。
- **语义收口**：零参顶层定义改为求值一次（不再包 thunk、调用点不补 `()`；零参递归组里
  非构造子 RHS 报 `CG_RecursiveValueDefinition`，A05）；Loader 门面死 API 与
  `Driver.Split` 的 HM `lib+app` 生成器/死 writer 清理（A03/A04）。
- **测试与快照**：corpus 建独立包上下文（`test/corpus/vuna.toml`，依赖 `vuna-base`），
  模块夹具按需各自补 manifest；runner 删除 `BASE_ROOT` 与全部根参数、导出 `VUNA_BASE`、
  compile 改为目录化 helper；新增第 38 段 API/产物快照（`test/snapshots/` +
  `update.sh`，C21/E14/E15）与第 39 段包上下文回归；`09_multi_root` 改为同包多模块、
  `89_ambiguous` → `packages/94_ambiguous_module`、`dt_root` → `dt_ad_hoc`。
- **LSP 边界（如实记录）**：本次未改 LSP 加载语义——仍 parse 级、含 `import` 的文件跳过
  类型检查；D13/M30 会把 LSP 接到与 CLI 相同的 `contextForFile`。
- **基线**：seed 65 `.ml` / 66 文件、`nix flake check` 全绿（测试断言数与套件
  耗时见 [reference/testing.md](reference/testing.md)）。

## M27：内置、原语与效应边界（2026-11）

- **单一内建声明面**：新增 `Vuna.Compiler.Intrinsics`（声明名、IType 签名形状、arity、
  `IntrinsicOp` 归约标签、能力、runtime 表达式、是否用户可见）。Loader（解析/放行/
  能力检查）、`Elab.Prelude`（prelude globals）、`Codegen.Term`（名字 → runtime）、
  `Core.Eval`（归约）全部消费同一张表；删除 Loader 的 `builtinArity` /
  `dtPreludeNames` / `isEffectfulBuiltin` 手写清单、`Codegen.Term.globalRef` 大 case、
  `Elab.Sig.topPreludeNames` 过期副本与 `Core.Eval.isPrimitiveName` 死代码（A10/A11）。
- **内置身份按完整声明符号**：Bool 回到 base 普通 data（canonical `Base.Bool.Bool`，
  `True`/`False` 精化成 `TBool`）；List/IO 同样是 base 普通 data（canonical
  `Base.List.List` / `Base.IO.IO`）。`Loader.Modules.isGlobalCtor` 删除，构造子一律
  mangle 后按声明/导出身份解析；Codegen/Elab/Driver 的 `lastName`/短名判据全部替换为
  canonical 常量；List 桥接只认 `Base.List.List`，IO main hook 只认 `Base.IO.IO`
  （A07/A08/A09/C17/C18）。
- **效应边界**：效果原语只保留 `prim_*`（公开名 `readFile`/`print`/… 删除，工具链源码
  改调 primitive）；包用 `vuna.toml` 的 `[capabilities] effects = ["console","fs",
  "process","env","clock"]` 显式声明能力，`PackageContext`/`Root`/`Module`/`Project`
  携带能力表，`Loader.Resolve.checkEffectsBuiltins` 按 Intrinsics 的能力位检查；删除
  `packageAllowsEffects` 包名 allowlist，未知能力名报错（B16）。
- **原语语义规范**：新增 `docs/reference/primitives.md`——Int 固定 63 位补码回绕；
  String 是 UTF-8 字节串（`strLength`/`strAt` 按字节）；`/0` 产物运行期 Failure、
  interp 不归约；`strUnpack`/`strPack`/`strConcatMany`/`strSubstTemplate` 等 interp
  不归约项显式分类；`strShow`（`dt_show_string`）成为 `Show String` 与 `main : String`
  展示的唯一转义实现；`strHash`/`strAt`/`strLength` 在 interp 与 runtime 同公式；
  runtime 的 Unix 依赖、`prim_getenv`/`getcwd`/`execPath` 语义写入规范（C16/C19/D16）。
- **测试**：新增 `dt/54_user_bool_data`（用户 data Bool 是普通 data）、`55_user_io_data`、
  `56_user_list_data`（用户 data List 与 base List 并存，C17 正例）、`run/18_int_overflow`、
  `19_string_utf8`、`20_str_hash`；`packages/07_effect_capability`（正例）、
  `96_effect_no_capability`、`97_unknown_capability`（负例）；单文件 Bool 夹具迁移到 base
  Bool，`dt/34_io_do`/`35_io_main` 改用 `import Base.IO`；第 39c 段改为 `prim_print` +
  `requires capability`。快照按新模块面/实例名重生成。
- **自举**：新内建声明面与能力先以旧种子可编译的形式落地并 rotation（seed 66 `.ml` /
  67 文件），第二轮加入 `strShow` 使用后再 rotation；`seed-count.txt` 自动更新。
- **基线**：seed 66 `.ml` / 67 文件、`nix flake check` 全绿（测试断言数与套件耗时见
  [reference/testing.md](reference/testing.md)）。

## M28：类型系统地基（2026-11）

- **宇宙（B05/D05/D06）**：定为**严格分层、非累积、无 `Type : Type`**（不引入 subtyping）。
  `kindWellFormed` 从「只查箭头链形状」升级为「Pi 链 → `Type l`（l 非负）+ 域层级防御
  复核」；族 kind 的结果层级传入构造子检查，构造子**字段 binder**（跳过前 arity 个族参数/
  索引）的域 sort 必须 `≤` 族层级，否则报 `TC_CtorError`（`data D : Type where Mk : Type -> D`
  被拒；`data D : Type 1 where Mk : Type -> D` 合法）。`showValueAt` 现在区分 `Type n`
  的层级显示。正反例 `dt/57_universe`、`dt_err/40_universe_{field,field0,kind,cumulativity}`；
  `dt/45_ctor_shape` 的 `Proxy` 按其字段 sort 改住 `Type 1`。
- **擦除（B06/D07）**：4 个判据收成 **`isTypeDomain` / `binderRig` 单一入口**——隐式 binder
  恒 `Rig0`；显式 binder 仅当域在类型层（宇宙或域全为类型层的 Pi 链）才 `Rig0`；显式索引
  保留运行时表示。删除 `typeLayerRig` 与 `binderRig` 里「只查裸 `Type`」的旧判据。策略
  定为**显式 multiplicity 标注**（不做整程序使用分析）；QTT 完整变体留研究。正例
  `dt/60_erasure_unify`。
- **合一（B07）**：`Sols` 携带元变量创建深度索引（`solsDepth`），求解点**就地**检查解的
  作用域；非空 spine 走 **Miller pattern unification**（spine 为互不相同的局部中性变量 →
  λ 抽象，闭包环境按 level 复原创建点上下文）；非 pattern 形状保留旧的保守 head 提取兜底
  （`CannotSolveHigherOrder` 仍可能出现）。删除事后 `checkSolsDelta` 复核与
  `inlineSolvedMetas`/`inlineSolvedMetaAlt`，统一为 `zonkTerm`（签名 / 构造子类型 / 族 kind
  的唯一 zonk 入口）。shape 统计：编译器自检时实际命中的是 meta-spine 的 flex-flex
  形状（`?m ?n = Maybe Json`），pattern 路径是理论上的首选分支。
- **命名空间（B18）**：Loader 的 `own`/`ownCtors`/`ownTypes` 拍平表替换为
  `Loader.Modules.Namespaces`（`nsValues`/`nsCtors`/`nsTypes`，对应导出表 kind
  `val`/`ctor`/`type`）：值位置 def → ctor → 内建 → 导入值/ctor → 本模块类型名作项；类型
  位置只查类型命名空间（保留本模块类型名优先于内建），退化到索引构造子/类型层 def。Elab
  新增 `isTypeName`/`typeLookup`/`valueLookup`，`inferVarRef`/`checkTypeFuel`/`checkAppFuel`
  改走显式命名空间查询，删除「kind 是不是宇宙」的猜测与 `checkAppUnderType` 的 infer→general
  兜底。夹具 `dt/61_namespace_dual`、`dt_err/44_namespace_value_as_type`、
  `modules/30_namespace_dual`（本地 `data token` 不再遮蔽导入值）。
- **定义形式（B10/D10/C29）**：新增 `axiom name : Ty`（无体、擦除/类型层定义；
  `DtDef` 增加 `DtAxiom`、`dtDefBody : DtDef -> Maybe Term`；运行时使用报
  `CG_AxiomAtRuntime`，带体报 `TC_AxiomWithDefinition`）；定义参数少于签名时按剩余 Pi
  **η 展开**（`TC_DefFewerParams` 保留码但不再触发；`dt_err/08_arity` 改为锁
  `TC_DefMoreParams`）；`let`/`where` 共用绑定块解析与同一个签名 gate（let 签名可选、
  where 仍必填）。C29：签名量化的 banned 集改由 `Elab.Sig.bannedForModule` 按模块前缀
  现场计算（`packages/08_module_scope`）。
- **case 规范形（B08/B15）**：`checkCase` 成唯一入口——源级校验（兜底位置/重复构造子/
  重复字面量）→ 需要时经 `multiToCaseExpr` 唯一降级 → 模式矩阵规范形 → 按家族降低
  （Bool→if、Int/String→if 链、归纳族→TCase）；删除 `checkCaseDedup` 旁路与精化器内
  `Pending` 嵌套折叠。覆盖率与「写出分支」共用单一 `BranchVerdict`（索引合一 + 上下文
  空族，空族唯一实现 `allCtorsUnsatisfiable`）；新增稳定码 `TC_RedundantCtorBranch`/
  `TC_RedundantLiteralBranch`/`TC_BranchAfterCatchAll`，不可达分支在精化体之前报错。
  附带修复模式矩阵嵌套降级的新鲜名互撞（位置名带 `ctxDepth`）。
- **测试/基线**：新增 dt 正例 `57_universe`、`58_case_matrix`、`58b_case_absurd`、
  `59_axiom`/`59_eta`/`59_let_where`、`60_erasure_unify`、`61_namespace_dual` 与模块级
  `modules/30_namespace_dual`、`packages/08_module_scope`；负例 `dt_err/40_*`、`41*`、
  `42_axiom_runtime`、`44_namespace_value_as_type`。seed 模块面不变（66 `.ml` / 67 文件），
  `nix flake check` 全绿。
## M29：相等、实例与证明 ergonomics（2026-11）

- **实例字典 schema v2（B11/B12/A13 收尾）**：`instance [<ctx> ,...] => <head> where` 语法
  （AST `DInstance` 带 ctx；Parser/Loader 一次到位）；`DtInst` 改为
  `{name, tele, ctx, head}`——实例是「隐式类型参数 tele + ctx 字典参数 → 结果头
  `Dict_C <arg>`」的全 Pi 值；`checkInstanceHeads` 在 datas/traits 就绪后把 head/ctx
  类型化（tele kind 由应用次数/族 kind 推断；`instance Eq (Box Int)` 不再被塌成
  `Dict_Eq Int`）；`elabInstance` 在 `tele + _ctx<k>` 上下文里精化方法体，方法体产生的
  字典 goal 与声明 ctx conv 命中即解成 ctx 字典变量，剩余刚性 goal 走 `searchInstanceIn`
  局部 ctx + 自实例递归，失败报 `TC_InstanceContextMissing`。实例搜索改为
  `searchInstanceIn globals ctx ec dom sp`：局部 ctx 字典 → 刚性结构化快路径 → 候选
  alloc tele meta → 结果头 conv → 递归解 ctx → 组装
  `TGlobal inst <teleArgs(Rig0)> <dictArgs(Rig1)>`；coherence 用 head 同名/α-等价 +
  可合一重叠（`TC_OverlappingInstances`），单态实例 head/字典类型与旧实现一致。
- **参数化 deriving**：`deriving (Show, Eq, Ord)` 对参数化 data（单参/双参/递归）按
  **字段类型里出现的参数**生成 ctx 实例（`instance Eq a => Eq (F a)`），`Ord` 的逐字段
  比较改走 `le`/`lt` 不再额外要求 `Eq`；`instHead` 修成 `Eq (Box a)`（旧实现对参数化
  data 生成多实参头）；`exprNameFor` 修 `Eq_X` 撞名。
- **相等收口（B04/C04，决策 A）**：删除泛型结构比较兜底与两套实现——
  `bi_eq_generic`/`bi_neq_generic`、`OpEqGeneric`/`OpNeqGeneric`、`genericEqPrim`/
  `valueEqDeep`/`valueListEqDeep`、`genericEqApp`/`typeComparable` 全家；`==`/`/=` 只剩
  「Int/String 内建特化」与「`Eq` 证据（字典/`deriving`/约束实例）」两条路径，
  `specializeEqTy` 在无类/无实例时 check 期报错；`<` 等比较同波删除「无 `Ord` 类 →
  generic cmp」兜底（String/Bool 的泛型运行时保留）。11 处编译器/工具链裸 `==` 改为
  显式 helper（`levelEq`、`length x == 0`、`levelListEq`、`manifestEntriesSame` 等），
  interp 与 codegen 不再有第二套相等算法；函数字段相等/无实例 data 相等在 check 期被拒。
- **证明 ergonomics（B09/D08/D12 部分）**：隐式值参数 `{x : a}` 可用
  （`Elab.Meta.isImplicitDomain`：类型/索引域、未解 meta、中性类型变量域放行；隐式
  binder 恒 Rig0 擦除，值只进类型/索引/证明位置，子句体不能按名引用）；构造子未饱和
  引用/应用按 **η 展开**（`Elab.Meta.etaCtorTerm`，唯一 binder 名 `#eta<i>`），
  `cong ... Succ ...` 与「构造子当值传递后再应用」check/compile/run 全过。隐式模式
  `{p}`、`auto`/隐式等式搜索、absurd 语法迁 F4。
- **Σ 与依赖索引 lookup（B13/D12）**：泛型 Σ 的值级构造受「类型依赖运行时值」限制
  （codegen 无表示，`CG_TypeLevelNameRuntime`）→ F4；M29 用 **Tarski 式存在式**
  （运行时类型码族 `Ty` + 指标族 `Tm : Ty -> Type` + `Some`）表达
  `Ctx n -> Fin n -> Sigma Ty Tm` 形态的依赖索引 lookup，夹具可编译可运行。
- **type-as-value（B14/D09 决策）**：不引入 type codes；Type 级等式走擦除的 `Eq` 证据 +
  `cast` 组合子；类型进运行时位置仍由 `CG_TypeUsedAtRuntime`/`CG_TypeLevel*` 拒绝。
- **命名实例删除（B12）**：删除 `instance ... as name` 与 `@name`/`EInstSel` 全链
  （AST/Parser/Loader/Elab/Split/Fmt/Index）；实例按 head 全局唯一，相干性靠重复/重叠
  诊断；孤儿实例仍被拒。错误码按「只增不删」保留枚举但不再触发。
- **A14 记录/投影 span**：`DtDef`/`DtAxiom` 携带来源 `Maybe Span`，顶层定义 / 实例字典 /
  trait 投影定义在 codegen 阶段报错时带 `file:line:col`（`CG_*` 诊断不再只有定义名或
  完全无位置）；记录字段访问/投影错误指向源码使用/声明位置。
- **测试/基线**：新增 `traits/14`（约束实例 + `mem (MkBox 1)`）、`traits/15`（参数化
  deriving 单/双/递归 + `<`/`==`/show）、`dt/60_ctor_eta`、`dt/61_implicit_values`、
  `dt/62_sigma_basic`、`dt/63_dep_lookup`、dt_err/42–49、records/93 等；`monad/04` 去
  `.nointerp`/`.nocompile`（C05：字典目标按域 conv 去重、binder 位置循环外定基准、
  `insertLamBinder` 移位 cutoff 修 0）；命名实例夹具删除/改写。seed rotation 后
  seed 66 `.ml` / 67 文件（模块面不变）；`nix flake check` 全绿；测试断言数以
  [reference/testing.md](reference/testing.md) 为准。
- **性能**：M29 未改 check 主路径（bodies/conv/force）；相等收口删掉的是非主路径的
  interp/runtime 比较实现；开发期自检墙钟受并行构建影响，正式基准见
  [reference/performance.md](reference/performance.md)。