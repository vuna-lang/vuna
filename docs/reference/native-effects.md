# Native effects：效应系统内建化（direct-style 终态路线）

**状态（2026-11，实施中）**：方向已定——效应系统从"库级编码 + 编译器协议"
升格为语言内建语义，运行时（OCaml 5 `Effect.Deep`、one-shot 续延、`(key, name)` 路由）
**不动**。原 labeled-rows 库级路线（P1/P1.5）不再实施，本文吸收其全部语义决策
（D1–D9、名字求解规则、表面语法）作为 N1 的内建规则。分四个阶段：N1 语法内建 →
N2 IO 降级 → N3 表示收敛 → N4 箭头行 direct-style。当前进度：N1 提交 1
（双形状兼容 + 名字求解内建）、rotation、提交 2（3 参命名行全量迁移 + 删旧分支）、
提交 3（`perform` 语法）、提交 4a（`@` 行糖）、提交 4b（`handle` 语法）均已完成，
N1 语法面收口；实施记录与过渡决策见 §3.4 / §9。

## 1. 诊断：库级编码到头了

四个根因（证据见 [effects.md](effects.md)）：

1. **双轨制**：`IO`（内建效应类型，特权基座）与 `Eff`（用户面库级效应）平行，渡口
   `liftIO` / `runIOEff` / `runIOAnswer` / `runPure` 四个方向；特权边界（`privileged` /
   `[trust]` / `unsafe`）只管 IO 轨。
2. **三重表示**：同一抽象三副面孔——纯 monad（`Base.State`/`Reader`/`Error`）、
   IO 基座 transformer（`StateT`/`ReaderT`/`ErrorT` + `MonadIO`）、效应行（`Base.Eff.*`）。
   库 API 与文档面被乘三倍。
3. **协议蔓延**：`Row`/`Member`/`rowRem` 名义是库、实为语言机制。编译器已介入
   `Intrinsics.vuna` 效果协议常量（8 个，L311–340）、`Core/Eval.rowRemReduce`（公理归约）、
   `Elab/Dict.memberLookupRow`（证明构造）、`Elab/Term/Impl.tryEffLift`（自动 lift）、
   行字面量按期望族特判展开。命名行计划里的名字求解规则（原 §4 流程图）本质是类型检查器
   规则，却要以"库 + 协议"形式维护。
4. **描述/权威分离**：类型层 `Row` 说"程序经过哪些效应"，但"被允许做什么"靠三条平行
   机制：运行时 `(key, name)` 路由、包级特权、能力声明，互不可推。

**关键事实**：`Base.Eff` 在 base 包、**不进 seed**（seed 闭包 = `compiler/app/Main.vuna`
的 import 闭包）；Elab 层的降级逻辑可用旧语法写、零 bootstrap 风险。这是 N1 先行的原因。

## 2. 终态

```vuna
-- 效应 = 操作类型 + 结果族（与现在相同的定义形状）
data ConsoleOp : Type where
  Print : String -> ConsoleOp

resConsole : ConsoleOp -> Type
resConsole (Print _) = Int

-- perform：效应进表达式；key/实例名/结果类型全部内建推导
consolePrint : String -> {n : String} -> {r : Row} -> Eff r Int
consolePrint s = perform (Print s)

-- handle：作用域 handler 块，续延显式（k = one-shot resume）
runProgram : {n : String} -> {r : Row} -> Eff (Cons n ConsoleOp r) a -> Eff (rowRem n ConsoleOp r) a
runProgram comp = handle comp {
  return x -> pure x
  Print msg k -> emit msg; k 0
}

-- main：顶层宿主 handler 由运行时预装；用户拿不到宿主 op 构造器（= 权威边界）
main : Eff [] Nat
```

终态各要素的归属：

| 要素 | 现状 | 终态 |
| --- | --- | --- |
| 效应描述 | 库级 `Row`/`Member`（+ 8 个协议常量） | 内建语义；`Row`/`Member` 仍是 Type-1 数据（资产保留），求解是编译器规则 |
| 效应执行 | `sendCore`/`handleCore` + `prim_effectPerform`/`prim_effectHandle` | `perform`/`handle` 语法降级到同一对 intrinsic（N1）；N3 后 intrinsic 是唯一信任边界 |
| key | 手写字符串（send/handle 两侧对齐靠约定） | **key := op 族规范名**（编译器推导，两侧由构造保证一致） |
| 实例名 | 每效应 `X : String -> …` 编码 | 名字进 `Row`（ND1），默认 `"main"`（ND3/ND7），`@` 糖（ND4/ND9） |
| 权威 | 包特权 + `unsafe` + `[trust]` | 宿主 op 构造器不导出（N2）；`unsafe` 面收缩到"构造宿主 handler" |
| 纯效应 | `Base.State`/`Reader`/`Error` 三轨并存 | mock handler 一种写法；interp 可执行（N3） |
| 一次性续延 | 运行时异常兜底（resume 两次抛 `Continuation_already_resumed`） | QTT 线性续延类型化（N3/N4） |
| `res op` 擦除 hack | `Obj.t` + 恒等 cast（D27 残留） | 消失：续延只在运行时，不出现在用户 OCaml 类型里 |
| 三重表示 | 纯 monad / transformer / 效应行 | 收敛为 handler 一种；`StateT`/`ReaderT`/`ErrorT`/`MonadIO` 删除（N3） |

**决策 D-All**（原命名行计划 D1–D9 吸收 + 新增）：

- **ND1 名字进 `Row`**：`Cons : (n : String) -> (e : Type) -> Row -> Row`。
- **ND2 效应定义不出现 `String`**（= D2）：标签 = 操作类型；纯标记型效应保留最小标记类型。
- **ND3 裸标签 = 默认名 `"main"`**（= D3）：单点定义 `Base.Eff.defaultInstance`。
- **ND4 多实例显式 `[ConsoleOp@audit]`**（= D4/D9）：原始写法 `Cons n e r` 永远可用。
- **ND5 同名同标签多处 = `TC_AmbiguousInstance`**（= D5）。
- **ND6 隐式名只从行解**（= D6）：唯一候选才解；**拒绝贪婪 Here**（必须全扫描）。
- **ND7 默认兜底只在最终化**（= D7）：只解名字 meta，不发明行结构。
- **ND8 key := op 族规范名**（新）：`perform (Print s)` 的 key = `"Base.EffConsole.ConsoleOp"`
  （op 数据族的规范名）；handle 侧同规则推导。运行时 `(key, name)` 路由不变，只换 key 的
  取值来源；`unhandled effect` 运行时报告文案随 golden 更新。
- **ND9 res 族协议**（新）：`perform o` 的结果类型 = `res<族短名> o`（沿用现有
  `resConsole`/`resFs`/`resExn` 命名约定，升格为编译器协议：族模块内查全局
  `res ++ 族短名`）。这同时解决 `sendCore` 隐式 `{x}` 在 infer 方向无法求解的问题。
- **ND10 `handle` 的 op 族从 clause 构造子推断**（新）：所有 clause 头构造子必须同族，
  否则编译错误；族名不需要显式写出。
- **ND11 one-shot 不变**（= effects.md §10）：multi-shot 不做；线性续延由 QTT 管（N3）。
- **ND12 语法编码沿仓库先例**（新）：`perform`/`handle` 不新增 `Expr` 构造子，用保留名
  标记 `EVar "@vuna@perform"` / `EVar "@vuna@handle@ret"` / `EVar "@vuna@handle@op"` 编码
  （与 `@vuna@do@bind@` / `@vuna@list@cons` 同法），Elab 按标记降级；`exprSpan`、Fmt、
  Index、LSP 的结构遍历按标记处理。

## 3. N1：语法内建（本阶段实施）

### 3.1 表面语法

| 写法 | 降级目标 |
| --- | --- |
| `perform (Print s)` | `Base.Eff.performCore <n=洞> "<op族规范名>" (<族标签> <n=洞>) (Print s)`，结果类型由上下文定 |
| `handle comp { return x -> e1  C p k -> e2 }` | `Base.Eff.handleWith <n=洞> "<op族规范名>" (<族标签> <n=洞>) <op族> (Base.Eff.resFn <res族>) comp (\x => e1) (\o, k => case o of { C p => e2 })` |
| `[Console@audit]` | `Cons "audit" (Console "audit") Nil`（ND4；裸标签条目名取首个 String 实参，否则 `defaultInstance`） |

`handle` 块的 clause 形状：

```vuna
handle comp {
  return x -> retFn            -- 可省略；省略时 ret = \x => x
  Ctor pats k -> body          -- \o, k => case o of { Ctor pats => body }
}
```

- 合成 λ 的第二个参数就是续延 `k`：alt 的 pattern **只含构造子实参**，不补通配；
  `k` 的类型是 `resOf rf (Ctor pats)`，依赖匹配下按构造子索引收窄（N1 是 ω 续延，
  N3 起 QTT 线性化）。同一 handle 块的所有 op 子句共用一个续延 binder 名。
- `handleWith` 的 handler 类型显式写成 `(o : op) -> (resOf rf o -> b) -> b`，这是
  `handleCore` 的裸 `h : Type` 做不到的（否则 clause 里的 `case o of ...` 拿不到族、
  `k` 拿不到续延域）。`rf` 是**擦除量**：结果族 `op -> Type` 不能作显式类型实参
  （M15 禁 `(0 res : op -> Type)`，不标擦除则把 `resXxx` 名字带进运行时），所以用
  `Base.Eff.ResFn` 包装、由 base 函数 `resFn` 构造（构造子名在精化期按规范名查不到）。
- 名字仍由行解出（与 `perform` 同一 `Member` 求解路径）；key 两边都是 op 族规范名
  （ND8），所以 `perform` 发的效应正好被 `handle` 接住。
- 子句必须**穷尽**该 op 族（合成 case 走普通覆盖检查，缺一个构造子即 `TC_NotExhaustive`）。

### 3.2 名字求解（内建规则）

约束形态 `Member ?n e r`：

| 行 `r` | 标签 `e` 候选 | 结果 |
| --- | --- | --- |
| 未解 meta | — | 推迟（`MemberStuck`） |
| 已解，恰好 1 条 | 1 | `?n := 该条目名字` |
| 已解，条目名字是 meta 且标签唯一 | 1 | `?n := 同名 meta`（两侧合一） |
| 已解，≥2 条 | ≥2 | 推迟 → 最终化 `TC_AmbiguousInstance` |
| 已解，0 条 | 0 | `MemberAbsent`（缺效应诊断） |

最终化：仍为未解名字 meta 的 `Member` 约束 → `defaultInstance`（仅当标签刚性）；行仍为
meta → 报未解，不发明行。**禁止贪婪 Here**：名字槽受限统一 + 全扫描。

### 3.3 编译器改动点（探索证据）

| 位置 | 改动 |
| --- | --- |
| `Frontend/Lexer.vuna` `isKeyword` | 新增 `"perform"`、`"handle"`；`"return"` **不**占全局关键字（只在 handle 子句头按标识符识别，可继续当普通变量名） |
| `Frontend/Parser.vuna` `parseLhs` + `parseHandle*` | `perform` → `parsePerform`（单表达式）；`handle` → `parseHandle`（`comp { return-clause? op-clause+ }`）。op 子句头解析成模式后**拆出尾部续延 binder**，再合成 `\o, k => case o of { Ctor pats => body }`；`comp` 为裸标识符且紧跟 `{` 时直接收成 `EVar`（否则会被 `parseAtomBase` 当记录字面量） |
| `Frontend/Ast.vuna` 保留名区 | `performSyntax` / `handleSyntax` / `handleNoRetSyntax`（无 return 子句的哨兵）+ 判定函数；`Expr` 不加变体（ND12） |
| `Loader` | 无专门分支：parser 已把 handle 降到 markers + 普通 λ/case，Loader 只做常规名字解析（构造子解析成规范名/over 名，供 ND10 推族） |
| `Intrinsics.vuna` 效果协议常量 | `Row.Cons` 3 参、`Member` 3 参（名字槽）、`effDefaultInstance`；`perform`/`handle` 的 key 由降级点生成 |
| `Elab/Dict.vuna` `memberLookupRow`/`resolveRowGoalsCtx`/`resolveDictGoals` | 3 参模式 + §3.2 名字求解规则 + 最终化兜底（ND1/ND6/ND7） |
| `Elab/Term/Impl.vuna` | `@vuna@perform` → `performCore`；`@vuna@handle` → `Base.Eff.handleWith`：从 clause 构造子推 op 族（ND10，跨族报 `TC_HandleClauseFamilyMismatch`）、按 `<族>Op` ↔ `<族>` ↔ `res<族>` 推 label/res（ND9）、校验 op 族是 nullary（否则 `TC_HandleFamilyUnsupported`）；`handleOperand` 在 `inferEFuel`/`checkEFuel`/`inferEFuelHint` 三处内联拦截 |
| `Core/Eval.vuna` `rowRemReduce` | `VCon consName (n :: h :: t :: _)` 双匹配（先名后标签）；比较前对 name/label（含 label 一层 spine 实参）做 `force`——已解 meta 在值里仍是 `VMeta` 节点，不 force 就永远比较不出相等（`handle` 的结果行依赖这一点） |
| `Elab/Sig.vuna` / `Elab/Term/Impl.vuna` | 行条目展示 `Console@real`；名字未解诊断带 `(name, label)` |
| `Diagnostics/{Tc,Frontend/Diagnostics}.vuna` | `TC_AmbiguousInstance`、`TC_EffResFamilyMissing`（ND9）、`TC_HandleClauseFamilyMismatch`（ND10）、`TC_HandleFamilyUnsupported`（族形状）；PS 侧 `PS_Handle{NeedsOpClause,ClauseNotIndented,ClauseNeedsCtor,ContinuationNameMismatch,ReturnMisplaced}` |
| `Base.Eff`（base 包，不进 seed） | `defaultInstance`、`Row.Cons`/`Member` 3 参、`ResFn(..)`/`resFn`/`resOf`/`handleWith`（handler 类型显式、`rf` 擦除量、`{w : Member n e r}` 置尾）、12 个效应模块去 `String` 参数 |

不改：`Eff` 本体、`runPure`/`runIOEff`/`runIOAnswer`、`prim_effectPerform`/`prim_effectHandle`
语义、`Codegen/Term.dtPrimRuntime` 的运行时块、`Eff` 的私有 `MkEff` 表示。

### 3.4 Bootstrap（每步验收：`./result/bin/vuna check .` + 小范围 `vuna test`）

1. **提交 1 — 双形状兼容**（已完成）：`Row.Cons`/`Member` 同时接受 2/3 参；
   `rowRemReduce` 双形状；名字求解规则（§3.2）落在 `Elab/Dict`；源码仍全旧形状。
   旧 seed 编译新源码通过。
2. **rotation**（已完成）：`nix develop --command sh nix/seed-rotate.sh ./result/bin/vuna`；
   验收 stage1 == stage2（97 文件）。
3. **提交 2 — 迁移**（已完成）：`Row.Cons`/`Member`/`rowRem` 全量切 3 参命名形状；
   20 个 base 效应模块 + 夹具调用点；编译器删除全部旧 2 参分支；
   全量 suite 3312 checks 通过、快照 `exports.txt` 重生成。
4. **提交 3 — perform 语法**（已完成）：`perform` 关键字（保留名 `@vuna@perform` 编码）
   + Elab 降级（ND8 key = op 族规范名、实例名由行解出、res 族存在性校验）
   + `TC_EffResFamilyMissing` + Fmt 回渲染 + 3 个夹具。实现要点见 §9。
   **提交 4a — `@` 行糖**（已完成）：`[X@name]` → `Cons "name" (X "name") Nil`
   （保留名 `@vuna@row@at` 编码，Fmt 往返稳定），夹具 `dt_base/75`。
   **提交 4b — `handle` 语法**（已完成）：`handleWith` + `ResFn` 擦除量 + op 族推断
   + rowRem 归约修复 + Fmt/Lint 接线；夹具 `dt_base/76`、`dt_base/77` 与
   `dt_err/99–104`；实现要点与边界见 §9。
5. **N1 收口**（已完成）：语法面（`perform` / `handle` / `@` 行糖）与名字求解全部落地，
   文档同步到本节与 §9。

**提交 2 的两条过渡决策**（ND2/ND4 真正落地前的桥，提交 3/4 会替换）：

- **行字面量名从标签的首个 String 实参推导**：`[Console "real"]` →
  `Cons "real" (Console "real") Nil`，`[Console n]` → `Cons n (Console n) Nil`；
  无该实参的裸标签（`Fetch`）→ `defaultInstance`。这样旧夹具里 `X : String -> ...`
  的实例名与行索引天然一致，无需在提交 2 大批量改写夹具。ND2 把 String 从标签
  移除后，规则收敛为 ND3 的「裸标签 = 默认名」+ ND4 的 `@` 显式名。
- **`weaken` 的名字参数是擦除量 `(0 n : String)`**：M15 拒绝值类型的隐式 binder
  `{n : String}`，而显式 `(n : String)` 是 RigOmega、与自动 lift 生成的 Rig0 实参
  不匹配（codegen 擦除后少一个实参）。`(0 n)` 既满足 M15，又让名字只在类型索引里
  出现、运行时完全擦除。

新关键字对 bootstrap 无压力：降级逻辑与编译器源码本身都不需要用 `perform`/`handle` 写
（编译器源码不写效应程序）；即使将来要用，也是 rotate 之后的事（bootstrap.md L54–56）。

## 4. N2：IO 降级

- `main : Eff [] a`（替代 `main : IO a`）；运行时 main 钩子预装宿主 handler（print/fs/
  clock/env/process 的 handler 在特权层由 runtime 直接提供）。
- 宿主 op 类型（`ConsoleOp` 等的宿主分支）构造器不导出：用户能 `perform`、能写 mock
  handler，但**不能**在无 handler 情况下构造宿主动作——权威边界从 `unsafe`/`privileged`
  收缩为"宿主 op 构造器不导出"。
- `Base.IO.Host`、`prim_runIO` 保留为特权逃生口；`runIOEff` 收缩为内部。
- `IO` 类型仍内建保留（`Base.IO` / `ST` / `IORef` 等宿主面不动，另行评估是否全部改写为
  宿主 op——倾向是，但放 N2 尾部）。

## 5. N3：表示收敛

- 删 `Base.State`/`Base.Reader`/`Base.Error`（纯函数表示）与 `StateT`/`ReaderT`/`ErrorT`/
  `MonadIO`：State/Reader/Exn 只剩 handler 一种写法。
- **interp 升级**：纯 handler（不触宿主 op）在 NbE 内执行（delimited continuation 的
  NbE 实现）；`vuna interp` 可跑 mock 效应程序，mock/real 对拍变成 interp vs 产物。
- **QTT 线性续延**：`k : res o -{rows}-> ans` 标 linear；resume 两次从运行时异常变编译错误。
- D27 残留（漏 cast 边界、trait 自动 λ 插入点）随 `res op` 不再出现在用户类型面而消失。

## 6. N4：箭头行 direct-style（远期，独立立项）

`a ->{r} b`：效应进箭头类型，bind 由应用语义承担，monad 退场。前置：Core `TPi` 增行域
（`TPi : String -> Bool -> Rig -> Term -> Term` 加效应域或引入新形式）、行合一半路
（Koka 式 row variable）、`do`/`>>=` 与直接风格的互操作设计。**N1–N3 全部是 N4 的前置
与缓冲**：行结构、求解规则、handler 语义到 N3 已全部就位，N4 只换表示轴。

## 7. 迁移面（N1）

| 区域 | 规模 |
| --- | --- |
| 命名效应模块 | 12 个（`base/lib/Base/Eff*.vuna` + `Eff/Reader.vuna`） |
| `Eff [` 闭行 | `base/lib` 32 处、`test` 84 处 |
| `rowRem`/`Member (` | `base/lib` 约 50 处 |
| 测试夹具 | `dt_base/16–45`、`dt_err/70–92` 约 40 个；`run_err/04` 的 key 文案随 ND8 变 |
| 文档 | `effects.md`、`effects-layers.md`、`records-traits.md`（行约束段）、`AGENTS.md`、本文 |

## 8. 测试与验收

- N1 正例：`perform` 单实例不写名字（`dt_base/74`）；`@` 行糖（`75`）；`handle` 语法
  （`76_eff_handle_syntax`：省略 return / 显式 return / 开放尾行 wrapper / infer 位置的
  let 绑定；`77_eff_handle_answer`：`return x -> pure x` 答案 + 两层 `runPure`、abort 续延）。
- N1 负例：res 族缺失 → `TC_EffResFamilyMissing`（`dt_err/98`、`101`）；clause 构造子跨族
  → `TC_HandleClauseFamilyMismatch`（`99`）；参数化 op 族 → `TC_HandleFamilyUnsupported`
  （`100`）；子句不穷尽 → `TC_NotExhaustive`（`102`）；续延 binder 名不一致 → `PS_…`（`103`）；
  return 子句位置错 → `PS_HandleReturnMisplaced`（`104`）。
- 工具链：`30_fmt_roundtrip` 覆盖 handle 夹具的 fmt 往返（格式化后仍 `check` 通过、二次 fmt 幂等）。
- 全域：`vuna check .`、`vuna fmt --check`、`nix run .#vuna-run-tests`；rotation 后
  stage1 == stage2；`seed/` 闭包不变（`nix/tcb-check.sh`）。
- 性能：`elab_perf` 全绿；D48 长 do 链边界回归（Member 证明参数 4 → 6）。

## 9. 风险与开放问题

- **诊断质量**：名字未解必须报 `(name, label)`，不能退化为 unsolved metavariable。
- **证明项变宽**：`Member` 索引 2 → 3；`elab_perf/01_do20` 回归。
- **key 推导的稳定性**：op 族重命名会换 key——mock/real 与持久化 handler 注册（若有）
  需要稳定 key 的场景要显式覆盖（后续若有 IPC/插件需求再议）。
- **`handle` clause 与依赖匹配**：`k` 的类型 `res o` 在 case 分支内收窄，降级产生的
  case 是依赖 matcher，验证 elab_perf 与深层依赖匹配的组合。
- **`return` 不是全局关键字**（提交 4b 定）：只在 handle 子句头按标识符识别，普通作用域里
  仍是合法标识符；return 子句的位置/重复由 `PS_HandleReturnMisplaced` 覆盖。
- **工具链展示**：`vuna api`/`doc`/LSP hover 显示 `Console@main`；`showValue`/doc 渲染路径。
- **N2 宿主 op 不导出的粒度**：按 op 类型整体不导出还是按构造子分支导出（mock 可构造）
  ——倾向整体不导出 + 库提供 mock 构造器（mock op 独立类型或同名 mock 模块），N2 设计时定。
- **已发现：多深度 Cons 分支的 codegen 变量串位（main 既有 bug，N1 提交 1 实测，
  已登记 [debt.md](debt.md) D53）**：同一 `case` 里深 Cons 分支在前、浅 Cons 分支在后时，
  深分支部分匹配失败回退到浅分支，浅分支变量会绑到深分支的部分绑定上
  （`case sp of n :: e :: r :: _ => 0 | e :: r :: _ => length e` 对 2 元素列表返回 2
  而非 1）。旧产品 CLI 与新 stage1 CLI 编译+运行的最小探针都复现；`interp` 路径不复现
  （是 codegen 匹配器生成的问题，不是求值器）。
  **规避**：所有按实参个数分派的地方一律用「`length` 判别 + 每臂单 Cons 分支」
  （`Core/Eval.rowRemReduceDispatch`、`Elab/Dict.memberSpine`、
  `Elab/Term/Impl.effConsLabelTail`）。这个约束会一直生效到 D53 修复，N1 后续
  perform/handle 的降级逻辑同样要遵守。
- **开放行与 ND6 全扫描的边界（提交 2 实测）**：`{r : Row}` 这种刚性开放尾行下，
  「数完全部标签候选」永远无法结束，会让所有带开放行的 wrapper 报
  `TC_NoInstanceFound`。规则修正为：扫描到未知尾部即收束为「具体前缀的候选 +
  open 标记」——0 候选 + 具体 `Nil` → 缺效应，0 候选 + 开放尾 → 推迟；
  前缀有候选即可构造 Here/There（`Here` 对未知尾部天然合法）。另：名字刚性时
  ≥2 个同标签候选用名字消歧（`conv` 失败继续往尾部走 There），只有名字是未解
  meta 且 ≥2 候选才 `TC_AmbiguousInstance`。
- **perform 降级的实现要点（提交 3 实测，后续改这段代码前必读）**：
  1. **必须内联进 `inferEFuel`，不能新增顶层函数**：给精化器的互递归 SCC 加一个节点会让
     终止性检查从 1.6s 涨到 240s+（`term-facts` 之后）。纯辅助（族推导 / 调用表达式构造）
     抽成**不递归**的顶层函数是安全的；任何**调用 `inferEFuel` 的新函数**都不行。
  2. **钩子体要小**：把推导+构造抽成 `performCallExpr` 后，`inferEFuel` 里只剩两个
     `bind`；整段逻辑内联会让编译自身时 `inference fuel exhausted`。
  3. **`inferEFuelHint` 有独立 `EApp` 分支**，必须先拦标记，否则标记名会被当普通变量解析
     （报 `unknown name @vuna@perform`）。
  4. **`performCore` 的签名形状受语言限制**：M15 禁止值类型隐式参数（`{n : String}`），
     类型域又禁止写 `(0 x : T)` 显式擦除量，因此类型级函数（label / res）不能作为显式
     参数传。当前形状是 `(n : String) -> (key : String) -> (e : Type) -> {r} -> {w : Member n e r}
     -> {op} -> {x} -> (o : op) -> Eff r x`：标签在编译期按过渡期约定补实例名，`res` 族
     只做存在性协议校验（ND9 的精确结果类型待后续）。
  5. **运行期 key 尚未统一（ND8 下半）**：`perform` 用 op 族规范名，现有 base wrapper
     仍手写 `"console"` 等 key，所以 perform 程序要用**同 key 的 handler**
     （夹具 74 演示）；统一留给 `handle` 语法的提交。
- **`handle` 降级的实现要点（提交 4b 实测，改这段代码前必读）**：
  1. **handler 类型由 base 入口供给**：`handleCore` 的 `h` 是裸类型变量，合成 clause 里的
     `case o of { C p => b }` 拿不到 `o` 的族（`TC_NotInductiveFamily`）、`k` 也拿不到续延
     类型（`k 5` → `TC_TooManyArgs`）。新增 `Base.Eff.handleWith`，handler 域显式写
     `(o : op) -> (resOf rf o -> b) -> b`；结果族 `res : op -> Type` 不能作显式类型实参
     （M15 禁 `(0 res : op -> Type)`，不标擦除则 `resXxx` 名字进运行时触发
     `CG_TypeLevelNameRuntime`），所以用 `ResFn` 包装 + `(0 rf)` 擦除量传入，并且降级点
     通过 base 函数 `resFn` 构造包装值（构造子在精化期按规范名查不到；`globalsLookup` 只含定义）。
  2. **`{w : Member n e r}` 必须排在 `comp` 之后**：`r` 由 comp 解出后 Member 当场解掉
     name/label 两个洞；排前面会推迟到最终化，而调用点 conv 此时要归约结果行
     `rowRem n e r`，只会得到 `expected Nil, got rowRem ?n ...`。`comp` 也排在 `ret` 之前：
     先定 `a`，ret 体里的数字运算才不会被 Numeric 默认成 `Int`。
  3. **`rowRemReduce` 要能看见已解 meta**：解表不改写已经构造好的 value，结果行里
     name/label 仍是 `VMeta` 节点，而 `valueEqFuel` 不做 force ⇒ 永远比较不出相等。比较前
     对 name、label（含 label 的一层 spine 实参）各 `force` 一次；未解 meta 仍照旧卡住。
  4. **族形状限制**：只支持 nullary op 族 + `<Label> : String -> Type` + `res<Label> : Op -> Type`
     （Console/Fs/Clock/Env/Process/Args/Stdin/Exit/Error）。State/Reader/Exn 是参数化族
     （`StateOp : Type -> Type`），res 族还要按族参数实例化 → `TC_HandleFamilyUnsupported`，
     继续用手写 handler（[debt.md](debt.md) D54）。
  5. **key 配对**：`handle` 与 `perform` 的 key 都是 op 族规范名，二者配对；与 base 里手写
     `"console"` 等 key 的旧 wrapper **不**配对（过渡期并存，统一留 N2/N3）。
  6. **同族多实例 + 裸标签**：标签含未解 meta 时 Member 走线性合一匹配、取首个匹配条目，
     不报 `TC_AmbiguousInstance`（perform/handle 共用同一路径，[debt.md](debt.md) D55）。
  7. **语法边界**：`comp` 是裸标识符且紧跟 `{` 时按 handle 块解析（记录字面量作 comp 需加括号）；
     同一 handle 块的所有 op 子句共用一个续延 binder 名（`PS_HandleContinuationNameMismatch`）；
     `return` 不是全局关键字（只在子句头识别）。
  8. **comp 的行必须在 handle 点已具体**（正常 handler 完全体天然满足）：
     `runX comp = handle comp { ... }` 里 `comp` 是参数（行由调用点固定），或
     `runOpen : {r} -> Eff (Cons "audit" (Console "audit") r) a -> Eff r a` 里行首是具体条目。
     若 comp 是**行多态表达式**（`handle (pure e) { ... }`、内联 `do` 块、泛型函数直接调用），
     comp 的行仍是未解 meta，结果行 `rowRem n e r` 在调用点 conv 时无法归约，报
     `TC_TypeMismatch expected <row>, got rowRem ?n ...`。规避：把 comp 绑到带签名/参数的位置
     （`let c : Eff [Console@audit] Nat = ...` 或函数参数）。更好的诊断/延迟默认化见
     [debt.md](debt.md) D56。
- **相关：`fmt` 规范化与列表字面量模式冲突**：`fmt` 把 `a :: b :: []` 精确链改写成
  `[a, b]` 后，与该模式相邻的后续 Cons 分支会触发 `TC_RedundantCtorBranch`
  （无位置信息 `:0:0`，覆盖检查判定与 codegen 解糖不一致，机制待独立修复）。
  因此模式里不写 `Nil`/`[]` 结尾；用上面的长度判别形态同时规避两者。
