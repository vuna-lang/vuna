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
- 早期 OCaml 外部编译器 `vunax` 已完成使命并删除（M6 完成后删除，历史可从 git log 找到）。

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

- 路线图（含已完成阶段一句话与后续 M15–M23）：[docs/roadmap.md](roadmap.md)
- DT 设计与 M13/M14 边界：[docs/dt-core.md](dt-core.md)
- 子系统地图：[docs/architecture.md](architecture.md)
