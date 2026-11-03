# 技术债务与缺陷登记（debt）

本文件是 **M24 后维护审计**（2026-11，main `82e4891`）的落盘结果：把仓库里「为兼容旧
HM / 旧架构留下的妥协」「升级期临时决定」「可复现 bug」「未实现缺陷 / 基建缺口」逐条
编号登记，并给出**根因修法方向**与**归属阶段**（阶段定义见 [roadmap.md](../roadmap.md)，
M25–M30 为可排期阶段，F1–F4 为不排期未来轨道）。

维护规则：

- 每条一行；关闭时把阶段列改成 `已修（<commit/说明>）`，不要删除（保留决策痕迹）。
- 新增债务必须同时给出**证据**（可复现命令或 file:line）与归属阶段；没有归属的放「未分类」。
- 本文件只记**当前仍成立**的项；纯历史决策（已被推翻/已落地）不进来，见
  [history.md](../history.md) 与 roadmap 的「决策变更」。
- 审计证据原文（较长、含探针清单）不提交：`_scratch/audit-*.md`（gitignored，可复跑）。

阶段口径：**M25** 健全性与验证基建 · **M26** 单一路径与装配 · **M27** 内置/原语/效应
边界 · **M28** 类型系统地基 · **M29** 相等/实例/证明 ergonomics · **M30** 工具链与包 ·
**F1** 模块系统 v3 · **F2** 运行时与多后端 · **F3** 效应/并发/异步 · **F4** 标准库与包生态。

## A. 旧架构 / 兼容妥协（HM 时代遗留或为使旧流程成立而保留）

| ID | 摘要 | 证据 | 阶段 |
| --- | --- | --- | --- |
| A01 | 单文件与 split 两套输出模型、两套 prepare/hook/`build.sh` 装配代码重复 | `Codegen/Program.vuna` vs `Codegen/Split.vuna`；`Decl.genTypeDecls`/`genTypeDeclsOf` | M26 |
| A02 | 空 `Vuna_builtins.ml` 仍被生成、编译、`open`（M15 内建实例容器遗留） | `Codegen/Split.vuna` 无条件写该 unit；`seed/Vuna_builtins.ml` 2 行 | M26 |
| A03 | `Loader` 门面保留 HM 时代死 API（`loadProgram*` 等零调用导出） | `grep loadProgram` 仅定义/注释 | M26 |
| A04 | `Driver.Split` 留整套 HM `lib/+app/` 布局生成器与死 writer（~90 行零调用） | `buildScriptPackage`/`writeSplitFilesChanged` 等 | M26 |
| A05 | 零参定义统一包 thunk（call-by-name），没有「顶层值求值一次」语义 | `Codegen/Term.vuna` thunk 约定；B 组 | M26 |
| A06 | raw `--root` 是第二套加载语义：不注入 Prelude、不校验 export、可绕 effect allowlist | `Loader/Flatten.implicitPrelude` 对 `importerPkg==""` 返回空；探针 | M26 |
| A07 | `Bool` 双重身份：prelude 类型桩（无构造子）+ `Base.Bool` 真值，`if`/case/conv 多处特判 | `Elab/Prelude.boolTy`、`Core/Conv.isBoolTyName`、`Elab/Meta.boolCtor*` | M27 |
| A08 | 内置实体靠 `lastName` 短名特判：用户 `data Bool`/`data IO`/`data List` 被误当内建 | `Codegen/Decl.vuna`、`Elab/Dict.vuna` 短名判据；探针 | M27 |
| A09 | `True`/`False`/`Cons`/`Nil` 等构造子名是**全局**的，用户同名构造子解析错 | `Loader/Modules.vuna` 导出裸构造子；探针 | M27 |
| A10 | `Elab.Prelude` 硬编码 globals（Int/String/Bool 类型、`str*`、`prim_*`）；内建表 4 处重复；Loader 有幽灵名 | `Elab/Prelude.preludeGlobals` 等 | M27 |
| A11 | 公开名与 `prim_*` 是同一内建的双份名字；生成 runtime 无条件下嵌 Unix | `Elab/Prelude` 双份表；`Codegen/Term.dtRuntime` | M27 |
| A12 | `IO a` 是 thunk 表示（`Int -> a`）、无 `runIO`，仅 `main` 处由生成 hook 执行 | `Base/IO.vuna`；`Codegen/Term` main hook | F3（接口清理 M27） |
| A13 | `Split` 仍匹配 M24.7 前的 `Show_Show_` 实例名前缀（死兜底），与 Elab 命名规则脱节 | `Codegen/Split.vuna` `isBuiltinInstanceName` | M26 |
| A14 | 记录/trait 投影全部降级成 `case`，诊断 span 指向生成代码（来源信息丢失） | `Elab/Records.prepareDecls`、`Elab/Dict` 投影 eta 展开 | M28 |
| A15 | `seed` 与 `build --split` 是同一命令的两个名字；CLI 参数解析各自手写；包模式下 `--root` 被静默忽略 | `Driver/CompilerCli.vuna` seedRun/buildSplitRun；Design | M26 |

## B. 升级期临时决定 / 精化器折中

| ID | 摘要 | 证据 | 阶段 |
| --- | --- | --- | --- |
| B01 | TCB 信任 = 包名字符串 allowlist：`vuna*` 包静默跳过终止性/覆盖率；无 warning 通道 | `Driver/Dt.dtTrustsTermination`；对照探针 | M25 |
| B02 | 覆盖率放行实现是插入 `TInt 0` 哨兵（而不是 bottom/absurd） | `Elab/Term.vuna`；trusted Bool 缺分支生成 `if ... else 0` | M25 |
| B03 | 终止性只查自递归，互递归不查；归约 fuel=512 静默截断 | `Elab/Termination`、`Core/Eval.force` | M25 |
| B04 | 无 Eq 实例时 `==` 退回 OCaml 多态结构相等；interp 用另一套 `valueEqDeep` | `Elab/Dict.genericEqApp`、`Core/Eval.valueEqDeep` | M25（根修 M29） |
| B05 | 宇宙中间态：严格分层（`Type:Type` 不成立）但**无累积性**；data kind 的 level 不校验 | `Core/Conv.vuna` level 相等；`data Box5 : Type 5` 通过 | M28 |
| B06 | 擦除判据 4 个谓词、按语法 rig 判定、不做整程序使用分析 | `Core/Term.rigOfBinder`、`Elab/Meta.{isIndexDomain,binderRig,typeLayerRig}` | M28 |
| B07 | `solveMetaHo` 只覆盖少数形状；元变量深度是事后复核；存库项靠 `inlineSolvedMetas` 补洞 | `Core/Conv` 三条 M13 出口；`Elab/Meta.inlineSolvedMetas` | M28 |
| B08 | case 精化三条路径并存（直接/去重降级/嵌套矩阵）；中性索引下空族「写也错、省也错」 | `Elab/Term.checkCase` 分流；`Elab/Case` 保守判定 | M28 |
| B09 | 隐式仅精化器内部插入：`{x : a}`、隐式模式 `{p}`、用户 `auto` 均无 | `Elab/Meta.isIndexDomain`；parser pattern 语法 | M28（语法）/M29（搜索） |
| B10 | `let` 与 `where` 两套作用域模型（签名必填/顺序可见）；无 axiom/未定义顶层；无 η 展开 | `Elab/Term.checkWhereSigs`；`DT: signature for ... has no definition` | M28 |
| B11 | trait 只支持单参数、无默认方法/父类/关联类型；无约束实例；字典是单态编码 | `Elab/Trait`「exactly one parameter」；`Elab/Derive` 参数化只 Eq | M29 |
| B12 | 命名实例不参与自动搜索；实例命名规则在 Elab/Derive/Split 三处重复实现 | `Elab/Dict.searchInstance` 过滤 named；命名 helper | M29 |
| B13 | 依赖索引取值（`Ctx n -> Fin n -> Tm n`）无表达手段 | `dt-parity.md` §6.3；探针 `p3_dep_lookup` | M29 |
| B14 | 类型当运行时值被擦除检查拦下（`Refl Nat` 失败），无 type codes | `Codegen/Erase` rig 检查；探针 | M29（决策） |
| B15 | 字面量 case 必须有兜底；无冗余/不可达分支诊断 | `Elab/Term.checkLitCase` | M28 |
| B16 | 效果 allowlist 同样按包名（可伪造）；raw root 依赖模块可调 `prim_*` | `Loader/Resolve.packageAllowsEffects`；探针 | M25/M27 |
| B17 | case/终止性对 TCB 包「只告警」的文档与实现不符：实现无任何 warning 输出 | `docs/reference/limits.md` vs `Elab/Case.ecTrusted` | M25 |
| B18 | 解析层只有单一命名空间：同名 type/ctor/global 靠多处特判兜住，与导出层双命名空间不一致 | `Elab/Term.inferVarRef`、`Elab/Records` 注释 | M28 |

## C. 可复现缺陷（bug）

| ID | 摘要 | 证据 | 阶段 |
| --- | --- | --- | --- |
| C01 | trusted 包 Bool case 缺分支生成 `if b then "t" else 0`（ocamlopt 类型错误） | 探针 `_scratch/audit-lead/booltrust`；`Elab/Term.vuna` | M25 |
| C02 | 包名 `vuna-base` 的普通包跳过终止性/覆盖率（静默）、可直接调用效果内建 | 对照探针 trusted vs `user-lib` | M25 |
| C03 | 非结构互递归 `ping n = pong n; pong n = ping n` 通过检查 | `Elab/Termination` 只分析自调用 | M25 |
| C04 | 含函数字段的值 `==`：`interp` 返回 0，编译产物抛 `Invalid_argument("compare: functional value")` | 探针 `p9`/`funeq` | M25（根修 M29） |
| C05 | `monad/04_kind_generic`：compile 产出的字典 binder 多态错误（`'b occurs inside t_Dict_uMonad`），`.nocompile` 整段跳过掩盖 | `Elab/Trait.liftFreeDictGoals` 记账；探针产物 | M29（标记清理 M25） |
| C06 | `Core.applyValue` 没有 `VCase` 分支，落到 `_ => f` **静默丢实参** | `Core/Eval.vuna`；Elab 靠 eta 展开规避 | M25 |
| C07 | 作用域护栏只验运行时 defs 且跳过擦除位；类型级定义/擦除位可带越界 index | `Codegen/Erase.checkAllDefScopes` | M25 |
| C08 | `checkResolvedModules` 只校验模块声明，不校验 entryDecls | `Codegen/Split.vuna` | M26 |
| C09 | `tcb-check.sh` 只匹配 `Vuna_d<短名>.ml`，重组后嵌套模块（`Vuna_dFmt_dExpr.ml`）漏检 | 已修：改为前缀匹配（2026-11 本轮） | 已修 |
| C10 | `index-check.sh` 用硬编码符号 + touch 空模块，重组后漂移 | 已修：探针改为真实源文件 `Loader/Resolve.vuna`（本轮） | 已修 |
| C11 | Index 缓存只按 `(size, mtime 秒)` 判新，同秒等长内容变更不失效；缓存写非原子无锁 | `Index/Scan.vuna`；探针 `idx2` | M30 |
| C12 | `fmt --check` 在非包目录/子目录崩溃（`Failure("readFile: lib")`）；不存在路径抛异常；`map` 同场景静默空输出 | `lib/Vuna/Cli.vuna` fmtDefaultTargets；探针 | M30 |
| C13 | `doc --with-comments` 在 usage/文档中宣传但 CLI 未解析（exit 2）；`doc` 忽略 `[export]`（出 41 模块） | `lib/Vuna/Cli.docArgs`；usage 已删该 flag（本轮） | M30 |
| C14 | tracked 0 字节 `compiler/lib/Vuna/Compiler/Builtins.vuna` 被索引成幻影模块 | 已删（本轮）；index 扫描应跳过 0 字节/坏文件 | 已修 |
| C15 | seed rotation 无漂移判据：fixed point PASS 时 `seed/` 仍可与源码生成差 5 行；`result*` 无新鲜度保障 | `nix/checks/seed-selfhost.sh`；探针 `rot` | M25 |
| C16 | `Show String` 两套实现：runtime 转义 vs `Base.Show` 只加引号（转义不一致） | `Codegen/Term` vs `Base/Show.vuna`；探针 | M27 |
| C17 | 自定义 `data List`（Empty/Link）时产物引用未生成的 `dtp_pack`，`ocamlopt` 报 Unbound value（check 却过） | List 桥接判据两处不一致；探针 | M27 |
| C18 | 用户自声明 `data IO`/`data Bool` 与内建短名冲突（被当内建） | 探针；同 A08 | M27 |
| C19 | 语义边界不一致：interp 不归约 `strPack/strUnpack`、除零卡住；Int 静默 63 位溢出；String 按字节 | `Core/Eval`、`Core/Term`；探针 | M27 |
| C20 | 用户可见错误带里程碑编号（"M13 limitation"/"M14"/"M19"）与 `DT: internal:` 文案 | `grep -rn "M1[0-9] limitation\|DT: internal"` | M25 |
| C21 | 重组后的对外 API/行为不变性没有入库夹具（只有一次性对拍） | `git show --stat 82e4891 -- test/` | M26 |
| C22 | `metrics.sh` 用 `cat` 无分隔拼接：无尾换行文件导致 lines/maxline 失真 | `nix/metrics.sh`；探针 `met` | M25 |
| C23 | `test/run-tests.sh` 965 行 shell、无 timeout、夹具/段数无守卫；`.nocompile` 语义过期 | `test/run-tests.sh`；附录清单 | M25 |
| C24 | 无 CI 配置；flake check 实际 12 项文档/提交信息写 9；无 eval-cache/keep-going 封装 | `nix eval .#checks`；文档 | M25 |
| C25 | `[workspace]` 成员不是检查/构建单元（成员错误可被根 check 忽略）；manifest `version`/`edition` 死字段；构建非 hermetic | `Manifest`/`Pkg`/`Cli`；探针 | M30 |

## D. 未实现能力 / 语言缺口

| ID | 摘要 | 阶段 |
| --- | --- | --- |
| D01 | 模块系统无签名/接口、无 functor/嵌套/局部模块、import 仅文件顶部、无选择性 import | F1 |
| D02 | 运行时/后端未定型：GC、后端无关 IR、Wasm/JS（当前绑 OCaml runtime） | F2 |
| D03 | 无通用效应系统 / 并发 / async；IO 只是 thunk + `prim_*` | F3 |
| D04 | 包生态：registry、版本解析、lockfile、文档托管、DT 验证库（Vec/Fin/Map/Set） | F4 |
| D05 | 宇宙：累积性 / 宇宙多态（当前严格分层但无 subtyping） | M28 |
| D06 | 完整依赖 kind / CoC 依赖消除（`kindWellFormed` 只查箭头链形状） | M28 |
| D07 | QTT / 整程序使用分析（擦除仍按语法 rig） | M28 |
| D08 | 隐式语言化：用户 `implicit`/`auto`、隐式值参数 `{x:a}`、隐式模式 `{p}` | M28/M29 |
| D09 | type-as-value / type codes（Type 级等式的根本障碍） | M29 |
| D10 | axiom/foreign 定义、η 展开（定义参数个数必须与签名一致）、typed let/统一 let-where | M28 |
| D11 | trait 能力：多参数、默认方法、父类、关联类型、约束实例、coherence | M29 |
| D12 | 证明 ergonomics：构造子部分应用 conv（`cong Succ`）、隐式等式搜索、absurd/空族、Σ | M29 |
| D13 | LSP 语义诊断（含 import 即跳过类型检查）；Index 仅 parse 级 | M30 |
| D14 | REPL 多行/效果；`vuna test` 只能 `main : String` 且走 interp（不能测效果） | M30 |
| D15 | hermetic / 增量依赖哈希 / 并行构建（当前宿主 ocamlopt + mtime 增量） | M30 |
| D16 | 数值塔（Int 固定宽度/溢出）与 Unicode String 语义（字节 vs 码点）决策 | M27 |
| D17 | `main` 结果显示只支持 Int/String/Bool；interp 不执行效果 | M30（其余 F3） |
| D18 | 性能工程：NbE 无共享、`termMetasAll` 扫描、自检 ~2min | M30 |

## E. 验证/CI/文档基建缺口

| ID | 摘要 | 阶段 |
| --- | --- | --- |
| E01 | 无 CI 入口；建议 `nix run .#vuna-ci` 封装 flake check（eval-cache=false、--keep-going、汇总） | M25 |
| E02 | check 数量/清单漂移（文档写 9、实际 12）；无自动生成清单 | M25 |
| E03 | `result`/`result-seed` 手工且可过期（实测两者差 176 行），文档仍推荐优先用 | M25 |
| E04 | TCB 只有黑名单、无 allowlist/数量断言；seed 闭包可静默缩水 | M25 |
| E05 | seed rotation 无漂移判据（见 C15） | M25 |
| E06 | 验证脚本改真实工作树（index-check touch、seed-rotate 非原子 `rm -rf seed`） | M25 |
| E07 | metrics/context 预算手工、单边上限、历史注释长；缺 `--recalibrate` 生成器 | M25 |
| E08 | benchmark 完全脱离 CI、无基线文件、JSON 用 sed 解析 | M30 |
| E09 | `nix run .#vuna-run-tests` 与 flake `vuna-tests` 两入口；章节过滤各自实现 | M25 |
| E10 | `.nointerp` 只有跳过、无「interp 仍拒绝」负向断言；`.nocompile` 语义已过期（C05） | M25 |
| E11 | 特殊标记清单与跳过原因未在 testing.md 成表 | M25 |
| E12 | 文档过期：`fmt --check` 崩溃已修但 limits 仍写；`--with-comments`；checks 数量 | M25→已随本波修 |
| E13 | `docs/.local`、`test/.local` 曾被索引缓存污染（审计探针产生，已清理；应加入 .gitignore/防护） | M25 |
| E14 | `packages/05_entry_data` 只断言运行结果，未直接断言 `Main.ml` 含 `C_Color` | M26 |
| E15 | 重组/拆分的行为不变性没有入库夹具（一次性 diff） | M26 |

## 报告映射

本登记由四份审计合并：语言核心（39 项，`_scratch/audit-elab.md`）、codegen/loader/driver
（27 项，`_scratch/audit-codegen.md`）、库/包/工具链（38 项，`_scratch/audit-lib.md`）、
测试/CI（28 项，`_scratch/audit-tests.md`）。合并时去重（同一根因只在最合适类别留一条），
A/B/C/D/E 之外的细枝末节（探针路径、逐文件行号）留在审计原文；需要复核时按本表证据列
重跑对应探针。