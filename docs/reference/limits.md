# 限制与已知边界

本文汇总当前实现的限制、路线状态与边界条件（原 README「限制与路线」节迁入）。
后续规划见 [docs/roadmap.md](../roadmap.md)，DT 设计见 [docs/dt-core.md](../dt-core.md)。

## 编译模型

- 类型检查与原生 OCaml typed codegen 已默认开启，且是唯一 codegen 路径
  （M12.7 删除 dynamic codegen）；M8 完成 typed 自举，`seed/` 由 typed 编译器轮换
  （M12 起为多文件）；`vuna interp` 对普通程序保留“不检查执行”的调试语义；
- M8c 完成 codegen 性能与输出质量收尾：Kosaraju SCC、类型特化比较、`&&`/`||`
  短路、`++` 折叠与线性拼接、零参纯值 hoist、pretty printer；自举 codegen
  从 ~12s 降到 ~2s 量级；构建加 `-g` 并对 warning 39（unused rec）设 warn-error；
- M12 起分离编译是构建模型的主干（每 vuna 模块一个 OCaml 模块 + `build.sh` 增量构建）；
  M12.8 起 `vuna build` 先做包级 codegen（`.output/lib/` + `app/Main.ml`），再由
  `.output/build.sh` 调 ocamlopt 产出 `.output/bin/<包名>`；`vuna build --split` 仍保留
  为旧的扁平分离 codegen（逐模块 `.ml/.mli` + `build.sh`），遇到不支持构造直接报错
  （不回退）；typed codegen 的**单文件**路径仍保留：`vuna compile`、测试/调试与包级
  codegen 不支持的构造使用单文件产物；优化仍归 ocamlopt（M12 不做 vuna typed IR）；
  runtime prelude 在分离编译中完整保留；
- `do` / Monad / IO 组合子已在 M11 实现；DT（依赖类型）M13 起步、M14 索引族、M15 隐式/
  接口/洞、M16 终止性、M17 工具链、M18 自举决策、M18.5 擦除修复、M18.6 表示层定型
  （三值 `Rig` + 不透明 `Level`，见 [docs/dt-core.md](../dt-core.md) §24）、M19–M22 语言面/
  多文件/多 clause：`--dt` 路径（Core TT + 精化器 + 擦除 codegen + `interp --dt` +
  `vuna goal` + `vuna lsp`）。**仍存的 DT 边界**（M23–M24 逐条拆除，清单与用量见
  [dt-parity.md](dt-parity.md)）：
  - ~~**lambda 形参被无条件擦除**（bug）~~：**M18.5 已修复**——擦除判据收敛为全仓唯一入口
    `Elab.binderRig`（隐式 binder 恒擦除，显式 binder 仅宇宙域擦除），并加了「同夹具
    `interp` 输出 == 编译产物输出」的逐夹具对拍断言；
  - ~~仍是单文件、不接入 `import` / `--root`~~：**M20 已接入 Loader**（`interp`/`check`
    支持 `import` 与 `--root`）；**包目录模式**与 split / `build` / `seed` 仍不支持 `--dt`；
  - **索引保留运行时表示**（完整擦除需整程序使用分析，见
    [m16-design.md](m16-design.md) §3）（M22）；
  - **互递归与跨调用 size-change 不查**（终止性只做逐调用结构下降，可能放过死循环程序）；
  - **跨模块构造子名**：`case`/模式里按源名（`Nil`）匹配，导入族的构造子存的是限定名
    （`Base.List.Nil`），因此在导入模块里对导入族写 `case` 会报
    `DT: unknown constructor <C> in case <F>`；绕法是改用定义模块导出的访问器
    （`Base.List.lookupPair` 用 `firstOf`/`secondOf`）。M23 处理模块级名字解析；
  - **多列 clause 的覆盖判定**：模式矩阵按列下降、不按列间依赖拆矩阵，把不同列的构造子
    分放在不同 clause（`zip [] ys = ...; zip xs [] = ...`）会报缺分支；写法限制为
    「具体子句 + `_ _` 兜底」；
  - **真实 `Base.Bool.Bool` 值只在检查层可用**：DT 精化器把 prelude 桩 `Bool` 与
    `Base.Bool.Bool` 视为定义相等（`Elab.convEc` 的布尔短路，所以 `filter (\x => x > 1)`
    这类混合能过 check）；但核心求值器的 `TIf` 只归约 `VBool`、内建算子产生裸
    `True`/`False`，真实 Bool 值的 `if` 在 `interp --dt` 与 codegen 路径尚未打通
    （`import Base.Bool; main = if True then 1 else 0` 能 check、`interp` 报
    `main does not reduce to a value`）。M23 接 codegen 前需统一 Bool 表示；
  - `record` / `deriving` 按终态决策**删除**而非补齐；
  - 无签名顶层定义不支持（M23 用一次性导出工具回填签名）；
  - 高阶/开放元变量解不支持（作用域逃逸会被拒）。
  完整 DT 主线见 [docs/roadmap.md](../roadmap.md)、设计边界见
  [docs/dt-core.md](../dt-core.md)、工具链见 [dt-tooling.md](dt-tooling.md)；
- M12 限制：分离编译的*生成*阶段仍是整程序分析，但经过 M12.5 性能修复后与单文件
  编译同量级（约 2s）；增量收益体现在 ocamlopt 只重编译受影响模块（`build.sh`）；
  seed 多文件（`.ml/.mli` 文件集）fixed point 逐字节比较；分离编译的
  `build.sh` 增量粒度是模块（.cmi 依赖时间戳），无跨包并行构建与依赖哈希；
  `vuna build --split` 暂不会自动回退单文件（遇到不支持构造报错，需改用
  `vuna build` 的包级 / `vuna compile --package` 路径）；基准时间测量仍手动
  （`nix run .#bench`），CI 只守机器无关指标；
- M12.5 边界：编译器是独立成员包 `vuna-compiler`，`seed/` 只由 compiler 包入口闭包
  生成，工具链不在 TCB；产品 CLI `vuna` 仍是单一二进制（in-process 调 compiler 库，
  不 fork `vuna-compiler` 进程）。M12.8 的 `vuna build` 通过受限进程执行内建
  （`prim_runIn`）运行 `.output/build.sh` 调 ocamlopt；这不是 vuna 进程转发。
  LSP / package manager 若加入，放在根包（CLI）侧或独立包，**永不进入 seed 闭包**；
- M12.5 编译性能修复：类型替换改 AVL（unify 从 O(n²) 回到 O(n log n)）、分离编译
  预计算路由表（去掉每模块 O(decls×names) 扫描）、跳过无签名函数占位 scheme 的
  env free-var 扫描、干净构建走单次 ocamlopt。本机 compiler 闭包的 `build --split`
  从 ~32s 降到 ~2s，`nix build .#vuna-seed --rebuild` ~1.4s、
  `nix build .#vuna-compiler --rebuild` ~3.4s；
- 种子轮换是手动流程（发版/不兼容变更时）；日常工具链改动不需要 rotation；
- `test/run-tests.sh` 目前以 golden 比对为主，后续可以补充更多随机/差分测试。

## main 与 IO（M12.6）

- 可执行入口（`vuna build` / `--split` / `seed`）要求 `main : IO a`，
  由运行时执行动作（没有公开的 `runIO` / `unsafeRunIO`）；普通用户包不能直接调用
  effectful 内建（`print` / `readFile` / `exit` / ...），只能经 `Base.IO`（编译器 /
  产品 CLI / `vuna-base` 自身在包级 allowlist 内）；`vuna interp` / `vuna test` / `--root`
  的**入口文件**同样禁止直接调用 effectful 内建（只有被加载的 base/compiler
  模块内部可用），纯 main 结果 show 仍保留为调试约定。IO 组合统一用
  `Functor`/`Monad` trait（`fmap`/`bind`/`pure`、`>>=`、`do`），不再导出
  `bindIO`/`pureIO`/`fmapIO`；效果 API 直接返回 IO（`print : String -> IO Int`、
  `getArgs : IO (List String)` 等），内部由不导出的 `prim_*` 原语实现。
  当前 `IO` 仍是库层 thunk 表示，不是完整的 effect
  类型系统（留给后续效应阶段，见 [docs/roadmap.md](../roadmap.md)）；
- IO 失败（如 `readFile` 缺失文件）会抛宿主异常，但入口文件缺失会返回普通错误；
  CLI 使用 `exit` 内建返回非 0 退出码（compile 错误 1、lint 有 finding 1、用法/
  解析/IO 错误 2）。

## 工具链细节

- M11.6 fmt 限制：行宽 100，但模块头/导出列表、类型签名与超长字符串字面量不折行；
  表达式内部的注释会前移到最内层包含它的条目（或下一条目），不保证留在原位置；
  单行块注释可以挂在行尾，多行块注释只作为前置注释；
- M11.5 工具链限制：REPL 一次只接受一行（多行定义/表达式需后续扩展）；
  `vuna test` 走解释器路径（代码生成路径由
  `test/run-tests.sh` 覆盖）；`vuna build` 生成 `.output/{lib,app}` 并调用 ocamlopt
  产出 `.output/bin/<包名>`；依赖只支持本地路径（registry/锁文件未做）；`Map` 是关联表实现的抽象类型（无平衡树）；
  `Result` 暂无 Functor/Monad 实例；
- `vuna lint` 首批规则是保守子集：lambda 体内的冗余 `case` 不报告（vuna 的 lambda
  参数只有变量名，不能写模式）；只处理从行首 `if` 起始的规范布局（整条 if 链写在
  一行时不检测）；多行表达式分支的 if 链、非最后子句/alt 上的冗余 `case` 只报告
  不自动修复；`--fix` 遇到注释、tab、CRLF 也跳过；
- `vuna lint` **必须显式给路径**（`vuna lint <file.vuna>...` 或 shell glob）；无参数是
  用法错误（退出码 2）；
- `vuna fmt --check` 省略 PATH 时按 workspace 包约定扫描每个包的 `lib/app/test`；若某包
  缺其中某个目录（本仓库 `compiler/` 没有 `test/`、`base/` 没有 `app/`），当前会抛
  `Failure("isDirectory: ...")` 异常。**workaround：显式给 PATH**
  （`vuna fmt --check compiler/lib lib base/lib app` 或逐个文件）。`checks.vuna-package`
  里的 fmt 检查都是显式传目录。

## 命名与构建（M12.8）

- 标准库包名 `vuna-base`、模块根 `Base.*`，编译器模块
  `Vuna.Compiler.*`（门面 `Vuna.Compiler.Common`）；包模式自动导入 `Prelude`，
  原始 `--root` 模式不导入（保持自举/夹具的显式 import 语义）；`vuna build` 需要
  PATH 中有 `ocamlopt`，库包先用 `vuna compile --package` 生成 `.output/lib/`；
  `Prelude` 刻意不含 `Base.IO` 效果函数（避免与编译器直接使用的内建同名）。

## 已完成阶段（细节见 history）

- M12.7 / M12.8 / M13 / M14 已完成：删除 dynamic codegen 与旧开关；完成标准库/
  编译器命名空间收敛、`Prelude` 自动导入与 `.output` 包级构建；DT 地基（Core TT +
  精化器 + 单文件 `--dt`）之后落地索引归纳族与依赖模式匹配；依赖类型主线（M13–M18）
  见 [docs/roadmap.md](../roadmap.md)。
- 每个已完成阶段的细节见 [docs/history.md](../history.md)。
