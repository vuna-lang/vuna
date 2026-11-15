# 效应系统内建化（direct-style）

**现状**：效应系统是**语言内建语义**——`perform` / `handle` 是语法，行标签是 op 族应用，
实例名进 `Row` 并由行解出，key 由编译器按 op 族规范名推导。运行时不动：OCaml 5
`Effect.Deep`、one-shot 续延、`(key, name)` 路由。语法降级到 `Base.Eff.performCore` /
`Base.Eff.handleWith`（以及行首条目版 `handleWithAt`），降级点不新增 `Expr` 构造子。

## 1. 为什么内建

把 `Row`/`Member`/`rowRem` 当普通库编码会撞到四个硬问题：

1. **双轨制**：内建动作类型（特权基座）与 `Eff`（用户面库级效应）平行，两者靠转换函数
   桥接。今天只有 `Eff` 一个动作类型，宿主 op 构造器不导出、`prim_eff_*` 只作宿主层
   逃生口。
2. **三重表示**：同一抽象三副面孔（纯 monad `Base.State`/`Reader`/`Error`、效应行
   `Base.Eff.*`、宿主 handler）会把库 API 与文档面乘三倍。今天库 API 只剩 handler 一种
   写法，`transformer` 与 `MonadIO` 不存在。
3. **协议蔓延**：`Row`/`Member`/`rowRem` 名义是库、实为语言机制。编译器介入四处：
   `Intrinsics.vuna` 的效果协议常量、`Core/Eval.rowRemReduce`（公理归约）、
   `Elab/Dict.memberLookupRow`（证明构造）、`Elab/Term/Impl` 的 `perform`/`handle` 降级与
   自动 lift。名字求解规则本质是类型检查器规则，只能以编译器规则维护。
4. **描述/权威分离**：类型层 `Row` 说「程序经过哪些效应」，「被允许做什么」只剩运行时
   `(key, name)` 路由 + 约定（没有包级特权与能力声明，见 [effects.md](effects.md) §8.6）。

**seed 约束**：`Base.Eff` 在 seed 闭包里（`Vuna.Compiler.Common` import 它；
`nix/seed-files.txt` 含 `Base_dEff.ml`），base 的其余效应模块不在 seed。改标签形状而不
引入新语法时，旧 seed 仍能编译新源码；rotation 按需触发（规则见
[bootstrap.md](bootstrap.md)）。

## 2. 表示

```vuna
-- 效应 = 操作类型 + 结果族
data ConsoleOp : Type where
  Print : String -> ConsoleOp

resConsole : ConsoleOp -> Type
resConsole (Print _) = Int

-- 实例名可选：`Member n e r =>` 生成隐式 String 名 + 行成员证明；
-- 调用点不写名字（行裸标签 = default），`consolePrint@audit` 显式选。
consolePrint : Member n ConsoleOp r => String -> Eff r Int
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

各要素的当前表示：

| 要素 | 当前表示 |
| --- | --- |
| 效应描述 | `Row` / `Member` 是 Type-1 数据；名字求解是编译器规则（§3.2） |
| 效应执行 | `perform`/`handle` 降级到 `performCore` / `handleWith`（`handleWithAt`），落到同一对 intrinsic `prim_effectPerform` / `prim_effectHandle` |
| key | op 族规范名（编译器推导，send / handle 两侧由构造保证一致） |
| 实例名 | 名字在 `Row`（`Cons : String -> Type -> Row -> Row`），默认 `"default"`，显式 `@` 名 |
| 行标签 | 标签 = op 族应用（`ConsoleOp`、`StateOp Nat`）；`Exn` 是无参标记类型 |
| 权威 | 宿主 op 构造器不导出；`prim_eff_*` 是宿主层逃生口（无 manifest 门控，见 [effects.md](effects.md) §8.6 与 [debt.md](debt.md) D62） |
| 纯效应 | 库级 monad 与 mock handler 并存；interp 可执行 mock 程序 |
| 一次性续延 | 运行时 one-shot；resume 两次抛 `Continuation_already_resumed`，线性类型化未做（[debt.md](debt.md) D42） |
| `res op` 擦除 | `Obj.t` + 恒等 cast；残留边界见 [debt.md](debt.md) D27 |

决策（本文内以名字互相引用）：

- **名字进 `Row`**：`Cons : (n : String) -> (e : Type) -> Row -> Row`。
- **效应定义不出现 `String`**：标签 = op 族应用（`ConsoleOp`、`StateOp Nat`、
  `ReaderOp Int`…）；`Exn` 保留无参标记类型 `Exn : Type`，`ExnOp` 仍带 String 索引
  （构造子参数匹配需要，见 §9）。
- **裸标签 = 默认名 `"default"`**：单点定义 `Base.Eff.defaultInstance`。
- **多实例显式 `[ConsoleOp@audit]`**：原始写法 `Cons n e r` 永远可用；`@` 右侧裸标识符是
  **名字字面量**，变量名必须写 `Cons`。
- **同名同标签多处 = `TC_AmbiguousInstance`**：候选显示条目**实例名**（不是标签）。
- **隐式名只从行解**：探测计数 + 唯一候选才提交；**拒绝贪婪 Here**（必须全扫描）。
- **默认兜底不发明行**：默认名只在行字面量与 `handleWithAt` 两个显式点产生；没有「最终化
  把名字 meta 解成 default」的兜底（当前形状下那也救不回来，见 §3.2）。
- **key = op 族规范名**：`perform (Print s)` 的 key = `"Base.EffConsole.ConsoleOp"`（op
  数据族的规范名）；handle 侧同规则推导。运行时 `(key, name)` 路由不变，只换 key 的取值
  来源。
- **res 族协议**：`perform o` 的结果类型 = `res<族短名> o`（沿用
  `resConsole`/`resFs`/`resExn` 命名约定，作为编译器协议：族模块内查全局 `res ++ 族短名`）。
- **`handle` 的 op 族从 clause 构造子推断**：所有 clause 头构造子必须同族，否则编译错误；
  族名不需要显式写出。
- **one-shot 不变**：multi-shot 不做；线性续延由 QTT 管（见 [debt.md](debt.md) D42）。
- **语法编码沿仓库先例**：`perform`/`handle` 不新增 `Expr` 构造子，用保留名标记
  `EVar "@vuna@perform"` / `EVar "@vuna@handle@ret"` / `EVar "@vuna@handle@op"` 编码（与
  `@vuna@do@bind@` / `@vuna@list@cons` 同法），Elab 按标记降级；`exprSpan`、Fmt、Index、
  LSP 的结构遍历按标记处理。

## 3. 语法内建

### 3.1 表面语法

| 写法 | 降级目标 |
| --- | --- |
| `perform (Print s)` | `Base.Eff.performCore <n=洞> "<op族规范名>" <op 族应用> (Print s)`，结果类型由上下文定 |
| `handle comp { return x -> e1  C p k -> e2 }` | `Base.Eff.handleWith <n=洞> "<op族规范名>" <op 族应用> (Base.Eff.resFn (\o => <res族> <族参数洞…> o)) comp (\x => e1) (\o, k => case o of { C p => e2 })` |
| `[ConsoleOp]` | `Cons "default" ConsoleOp Nil`（裸标签补默认名） |
| `[ConsoleOp@audit]` | `Cons "audit" ConsoleOp Nil` |
| `[StateOp Nat@counter]` | `Cons "counter" (StateOp Nat) Nil`（参数化标签的 `@` 作用于完整标签表达式） |

`handle` 块的 clause 形状：

```vuna
handle comp {
  return x -> retFn            -- 可省略；省略时 ret = \x => x
  Ctor pats k -> body          -- \o, k => case o of { Ctor pats => body }
}
```

- 合成 λ 的第二个参数就是续延 `k`：alt 的 pattern **只含构造子实参**，不补通配；
  `k` 的类型是 `resOf rf (Ctor pats)`，依赖匹配下按构造子索引收窄。续延是 ω，线性化未做
  （[debt.md](debt.md) D42）。同一 handle 块的所有 op 子句共用一个续延 binder 名。
- `handleWith` 的 handler 类型显式写成 `(o : e) -> (resOf rf o -> b) -> b`，这是
  `handleCore` 的裸 `h : Type` 做不到的（否则 clause 里的 `case o of ...` 拿不到族、`k`
  拿不到续延域）。`rf` 是**擦除量**：结果族 `e -> Type` 不能作显式类型实参（类型域不接受
  `(0 res : op -> Type)`，不标擦除则把 `resXxx` 名字带进运行时），所以用
  `Base.Eff.ResFn` 包装、由 base 函数 `resFn` 构造（构造子名在精化期按规范名查不到）。
- **参数化 op 族**（State/Reader 的 `k = 1`，Console 等 `k = 0`）：族约定一致——
  `<Op> : <params…> -> Type`、`res<短名> : <params…> -> <Op> -> Type`。标签 = op 族应用，
  降级点按 `k` 给标签/op 补洞；族参数由行条目（如 `StateOp Nat` 的 `Nat`）与 op 的类型解出；
  `res` 用 η-λ `\o => res<族> ?p1 … ?pk o` 现场解族参数（不能直接传多态族名）。
- **行多态 comp**（`handle (pure e) { … }`、内联 do 块）：`handleWith` 的 `r` 仍未解、
  结果行 `rowRem n e r` 归约不了，check 位置失败后改降级到 `Base.Eff.handleWithAt`：
  comp 的行被定成 `Cons n e er`（条目在行首）、名字取默认实例名（`"default"`）、结果行就是
  `er`（与期望类型合一）。正常 handler 完全体（comp 是参数或行首已有的具体行）仍走
  `handleWith`，支持条目在行中任意位置。
- 名字仍由行解出（与 `perform` 同一 `Member` 求解路径）；key 两边都是 op 族规范名，所以
  `perform` 发的效应正好被 `handle` 接住。
- 子句必须**穷尽**该 op 族（合成 case 走普通覆盖检查，缺一个构造子即 `TC_NotExhaustive`）。

### 3.2 名字求解（内建规则）

约束形态 `Member ?n e r`（`e` 可以带 meta，如 `StateOp ?s`）：

| 扫描结果 | 名字槽 `?n` | 结果 |
| --- | --- | --- |
| 行是未解 `VMeta` / 未知形态 | — | 推迟（`MemberStuck`；不发明行） |
| 0 候选 + 具体 `Nil` | — | `MemberAbsent`（缺效应诊断） |
| 0 候选 + 刚性开放尾 | — | `MemberStuck`（推迟） |
| 恰好 1 条匹配 | meta / 刚性 | 在目标条目上提交 `e`/`n` 合一，构造 `Here`/`There` |
| ≥2 条匹配 | meta | `MemberAmbiguous`（候选文本 = 条目实例名） |
| ≥2 条匹配 | 刚性 | 名字探测已过滤；仍 ≥2（同名同标签重复）→ 歧义 |

实现要点：每个条目对标签与名字各做一次 **`convEc` 探测**（在快照 Ec 上跑、结果丢弃，
不提交解表）来计数；只有唯一候选（或名字刚性消歧后唯一）才真正提交。参数化标签
（`StateOp ?s` vs 行里的 `StateOp Nat`）靠标签探测匹配。**禁止贪婪 Here**：计数先于证明
构造，非目标条目的标签参数不会被提前解掉。

默认名只在行字面量裸标签与 `handleWithAt` 两个显式点产生；**不做**「最终化把名字 meta 解
成 default」的兜底——行未解/开放尾时那也无法让 `Member` 成立，只会掩盖错误。行仍是 meta
时报未解，不发明出行结构。

### 3.3 编译器落点

| 位置 | 职责 |
| --- | --- |
| `Frontend/Lexer.vuna` `isKeyword` | `"perform"`、`"handle"` 是关键字；`"return"` **不**占全局关键字（只在 handle 子句头按标识符识别，可继续当普通变量名） |
| `Frontend/Parser.vuna` `parseLhs` + `parseHandle*` | `perform` → `parsePerform`（单表达式）；`handle` → `parseHandle`（`comp { return-clause? op-clause+ }`）。op 子句头解析成模式后**拆出尾部续延 binder**，再合成 `\o, k => case o of { Ctor pats => body }`；`comp` 为裸标识符且紧跟 `{` 时直接收成 `EVar`（否则会被 `parseAtomBase` 当记录字面量） |
| `Frontend/Ast.vuna` 保留名区 | `performSyntax` / `handleSyntax` / `handleNoRetSyntax`（无 return 子句的哨兵）+ 判定函数；`Expr` 不加变体 |
| `Loader` | 无专门分支：parser 已把 handle 降到 markers + 普通 λ/case，Loader 只做常规名字解析（构造子解析成规范名/over 名，供族推断） |
| `Intrinsics.vuna` 效果协议常量 | `Row.Cons` 3 参、`Member` 3 参（名字槽）、`effDefaultInstance = "default"`；`perform`/`handle` 的 key 由降级点生成 |
| `Elab/Dict.vuna` `memberLookupRow`/`resolveRowGoalsCtx`/`resolveDictGoals` | 3 参模式 + §3.2 探测计数求解（无贪婪匹配；候选文本用实例名；无最终化默认兜底） |
| `Elab/Term/Impl.vuna` | `@vuna@perform` → `performCore`；`@vuna@handle` → `Base.Eff.handleWith`（rowRem 版）/ `handleWithAt`（行首条目版，check 失败后重试）：从 clause 构造子推 op 族（跨族报 `TC_HandleClauseFamilyMismatch`）、**标签 = op 族应用**（`handleOpArg canon k`）、res = `res<短名>`、按 op 族 kind 的显式参数个数 `k` 补洞（State/Reader `k = 1`；非宇宙域参数如 `ExnOp` 的 `Row` 报 `TC_HandleFamilyUnsupported`）；`handleOperand` 在 `inferEFuel`/`checkEFuel`/`inferEFuelHint` 三处内联拦截 |
| `Core/Eval.vuna` `rowRemReduce` | `VCon consName (n :: h :: t :: _)` 双匹配（先名后标签）；比较前对 name/label（含 label 一层 spine 实参）做 `force`——已解 meta 在值里仍是 `VMeta` 节点，不 force 就永远比较不出相等（`handle` 的结果行依赖这一点） |
| `Elab/Term/Impl.vuna` `rowEffectLabels` | 行条目展示 `<短标签>@<名字>`（`ConsoleOp@default`、`StateOp Nat@counter`）；歧义候选显示实例名 |
| `Diagnostics/{Tc,Frontend/Diagnostics}.vuna` | `TC_AmbiguousInstance`、`TC_EffResFamilyMissing`、`TC_HandleClauseFamilyMismatch`、`TC_HandleFamilyUnsupported`（族形状）；PS 侧 `PS_Handle{NeedsOpClause,ClauseNotIndented,ClauseNeedsCtor,ContinuationNameMismatch,ReturnMisplaced}` |
| `Base.Eff`（在 seed 闭包里） | `defaultInstance = "default"`、`Row.Cons`/`Member` 3 参、`ResFn(..)`/`resFn`/`resOf`/`performCore`/`handleWith`/`handleWithAt`（`e` 同时作标签与 op 类型、`rf` 擦除量、`{w : Member n e r}` 移到 comp 之后先解名字；行首条目版把条目放在 comp 的行首、结果行即剩余行）；12 个效应模块用 op 族标签 |

不改：`Eff` 本体、`runPure`/`joinEff`、`prim_effectPerform`/`prim_effectHandle` 语义、
`Codegen/Term.dtPrimRuntime` 的运行时块、`Eff` 的私有 `MkEff` 表示。

### 3.4 bootstrap 要求

改这套降级逻辑时：`./result/bin/vuna check .` 必须过；新 seed 由 stage1 重新生成后
stage1 == stage2（97 文件）；seed 闭包不变（`nix/tcb-check.sh`）。新关键字对 bootstrap 无
压力——编译器源码本身不写效应程序，降级逻辑也不需要用 `perform`/`handle` 写
（[bootstrap.md](bootstrap.md)）。

## 4. 动作类型与宿主层

- `main : Eff [] a`；运行时 main 钩子预装宿主 handler（print/fs/clock/env/process 的
  handler 在宿主层由 runtime 直接提供）。
- 宿主 op 类型（`ConsoleOp` 等的宿主分支）构造器不导出：用户能 `perform`、能写 mock
  handler，但**不能**在无 handler 情况下构造宿主动作。权威只有「宿主 op 构造器不导出」
  ——manifest 权威（`unsafe`/`privileged`）不存在（[debt.md](debt.md) D62）。
- 直接调用 `prim_eff_*`、`prim_schedNewScope` 保留为宿主层逃生口。
- 内建动作类型不存在；`prim_eff_*` / `IORef` 等宿主面就是宿主层，`IORef` 的实现全是
  `Eff []`。

## 5. 表示收敛

- 纯 handler（不触宿主 op）在 NbE 内执行（delimited continuation 的 NbE 实现）；
  `vuna interp` 可跑 mock 效应程序，mock/real 对拍变成 interp vs 产物。
- 续延类型化未做：`k` 当前是 ω，线性续延 / 一次性闭包的 QTT 类型化见
  [debt.md](debt.md) D42。
- `res op` 在用户类型面上的残留（漏 cast 边界、trait 自动 λ 插入点）见
  [debt.md](debt.md) D27。

## 6. 箭头行 direct-style（未实现）

`a ->{r} b` 这样的箭头类型不存在：效应只进 `Eff r a`，箭头类型没有效应域。这条路径要动
Core `TPi`（增加效应域或引入新形式）、行合一半路（row variable）与 `do`/`>>=` 的互操作
设计。当前的线性/依赖箭头缺口见 [debt.md](debt.md) D42。

## 7. 改动面

改这套语义时要同步的位置：

| 区域 | 位置 |
| --- | --- |
| 命名效应模块 | 12 个（`base/lib/Base/Eff*.vuna` + `Eff/Reader.vuna`）：标签是 op 族应用 |
| `Eff [` 闭行 | `base/lib` 与 `test` 的行字面量写成 `Cons n <Op> …` / `[<Op>@name]` |
| `rowRem`/`Member (` | `base/lib` 约 50 处按 op 族标签写 |
| 测试夹具 | `dt_base/11–45,74–82`、`dt_io/01–07`、`dt_err/70–109`、`packages/01–04`、`stdlib/03,09,10`、`run/16–17`、`traits/pending/31`；`run_err/04` 的 key 文案 |
| 文档 | `effects.md`、`effects-layers.md`、`stdlib.md`、`language.md`、`type-system.md`、`debt.md`、本文 |

## 8. 测试与验收

- 正例：`perform` 单实例不写名字（`dt_base/74`）；`@` 行糖（`75`）；`handle` 语法
  （`76_eff_handle_syntax`：省略 return / 显式 return / 开放尾行 wrapper / infer 位置的
  let 绑定；`77_eff_handle_answer`：`return x -> pure x` 答案 + 两层 `runPure`、abort 续延；
  `78_eff_handle_state` / `79_eff_handle_reader`：参数化 op 族（`k = 1`）；
  `80_eff_handle_unknown_row`：行多态 comp（`pure` 与内联 do 块）走 `handleWithAt`）。
- 默认名 / 多实例：`dt_base/81_eff_named_row_default`（裸标签 = 默认名，perform/handle
  都不写名字）；`dt_base/82_eff_named_row_multi`（单实例裸标签自动解名 + 多实例用
  带 `(n : String)` 的 wrapper）。
- 歧义负例：`dt_err/108_eff_ambiguous_console`（ConsoleOp 两实例 + 裸 `perform`）与
  `dt_err/109_eff_ambiguous_state`（`StateOp Nat` 两实例，覆盖参数化标签探测计数）
  → `TC_AmbiguousInstance`，候选显示实例名。
- 负例：res 族缺失 → `TC_EffResFamilyMissing`（`dt_err/98`、`101`）；clause 构造子跨族
  → `TC_HandleClauseFamilyMismatch`（`99`）；作用域/高阶 op 族（Exn）
  → `TC_HandleFamilyUnsupported`（`100`）；子句不穷尽 → `TC_NotExhaustive`（`102`）；
  续延 binder 名不一致 → `PS_…`（`103`）；return 子句位置错 →
  `PS_HandleReturnMisplaced`（`104`）。
- 工具链：`30_fmt_roundtrip` 覆盖 handle 夹具的 fmt 往返（格式化后仍 `check` 通过、
  二次 fmt 幂等）。
- 全域：`vuna check .`、`vuna fmt --check`、`nix run .#vuna-run-tests`；rotation 后
  stage1 == stage2；`seed/` 闭包不变（`nix/tcb-check.sh`）。
- 性能：`elab_perf` 全绿；长 do 链的 `Member` 证明参数边界（4 → 6）。

## 9. 风险与开放问题

- **诊断质量**：名字未解必须报 `(name, label)`，不能退化为 unsolved metavariable。
- **证明项变宽**：`Member` 索引 2 → 3；`elab_perf/01_do20` 是回归点。
- **key 推导的稳定性**：op 族重命名会换 key——mock/real 与持久化 handler 注册需要稳定
  key 的场景要显式覆盖。
- **参数化 op 族的字面量边界**：`perform Put 1` 里字面量先按 Numeric 默认成 `Int`，而行的
  标签是 `StateOp Nat` 时 `Member` 无法把 `?s` 解成 `Nat`；写 `oneN : Nat` 后
  `perform Put oneN` 正常。这是数值默认与行推导的交互边界。
- **`handle` clause 与依赖匹配**：`k` 的类型 `res o` 在 case 分支内收窄，降级产生的 case
  是依赖 matcher（`elab_perf` 与深层依赖匹配的组合是回归点）。
- **`return` 不是全局关键字**：只在 handle 子句头按标识符识别，普通作用域里仍是合法
  标识符；return 子句的位置/重复由 `PS_HandleReturnMisplaced` 覆盖。
- **工具链展示**：诊断里显示 `<短标签>@<名字>`（`ConsoleOp@default`、
  `StateOp Nat@counter`）；`vuna api`/`doc`/LSP hover 仍是通用类型展示。
- **宿主 op 不导出的粒度**：按 op 类型整体不导出，库侧提供 mock 构造器（mock op 独立
  类型或同名 mock 模块）。
- **多深度 `Cons` 分支**：同一 `case` 里深 `Cons` 分支在前、浅 `Cons` 分支在后时，深分支
  部分匹配失败会回退到浅分支，浅分支的变量绑到自己那一层的元素
  （`case sp of n :: e :: r :: _ => 0 | e :: r :: _ => length e` 对 2 元素列表返回 1）。
  匹配器按 clause 各自改名（`Elab/Match.prepVarColumn`），不会把另一个 clause 的同名更深
  子模式当成自己的 binder。按实参个数分派的地方仍可写「`length` 判别 + 每臂单 `Cons`
  分支」（`Core/Eval.rowRemReduceDispatch`、`Elab/Dict.memberSpine`、
  `Elab/Term/Impl.effConsLabelTail`），读起来更直接。
- **开放行与全扫描的边界**：`{r : Row}` 这种刚性开放尾行下，「数完全部标签候选」永远无法
  结束，会让所有带开放行的 wrapper 报 `TC_NoInstanceFound`。规则：扫描到未知尾部即收束为
  「具体前缀的候选 + open 标记」——0 候选 + 具体 `Nil` → 缺效应，0 候选 + 开放尾 → 推迟；
  前缀有候选即可构造 Here/There（`Here` 对未知尾部天然合法）。名字刚性时 ≥2 个同标签候
  选用名字消歧（`conv` 失败继续往尾部走 There），只有名字是未解 meta 且 ≥2 候选才
  `TC_AmbiguousInstance`。
- **`perform` 降级的实现约束（改这段代码前必读）**：
  1. **锁进 `inferEFuel`，不新增顶层函数**：给精化器的互递归 SCC 加一个节点会让终止性检查
     从 1.6s 涨到 240s+（`term-facts` 之后）。纯辅助（族推导 / 调用表达式构造）抽成
     **不递归**的顶层函数是安全的；任何**调用 `inferEFuel` 的新函数**都不行。
  2. **钩子体要小**：把推导+构造抽成 `performCallExpr` 后，`inferEFuel` 里只剩两个 `bind`；
     整段逻辑内联会让编译自身时 `inference fuel exhausted`。
  3. **`inferEFuelHint` 有独立 `EApp` 分支**，必须先拦标记，否则标记名会被当普通变量解析
     （报 `unknown name @vuna@perform`）。
  4. **`performCore` 的签名形状**：保持显式 `(n : String)`；隐式 String 实例名（RigΩ，见
     §10）合法，但类型级函数（label / res）仍不能作为显式参数传（类型域又禁止写
     `(0 x : T)` 显式擦除量）。形状是
     `(n : String) -> (key : String) -> (e : Type) -> {r} -> {w : Member n e r} -> {x} ->
     (o : e) -> Eff r x`（标签与 op 同型）；`handleWith` 的 `{w}` 放在 `comp` 之后、
     `ret`/`opH` 之前，先由行解出标签参数，避免 handler 体里的字面量先默认成 `Int`。
     `res` 族只做存在性协议校验。
  5. **key 配对**：`perform` 与 `handle` 的 key 都是 op 族规范名，二者配对；base 里手写
     `"console"`/`"state"`/`"reader"` 等 key 的 wrapper（`get`/`put`/`ask`/`runConsole`…）
     **不**配对（[debt.md](debt.md) D57），所以参数化族的语法夹具用 `perform` 而不是
     `get`/`ask` 写程序。
  6. **族形状与参数个数**：base 全体一致——`<Op> : <params…> -> Type`、
     `res<Label> : <params…> -> <Op> -> Type`。降级点按 op 族 kind 数**显式参数个数 `k`**：
     `k` 给标签/op 补洞，结果族用 η-λ `\o => res<族> ?p1 … ?pk o` 现场解族参数（State/Reader
     `k = 1`，Console 等 `k = 0`）。标签/结果族 arity 与 `k` 不符即
     `TC_HandleFamilyUnsupported`：只剩**作用域/高阶族** Exn
     （`ExnOp : String -> Row -> Type -> Type`，第一个显式参数域是 `Row` 而非宇宙）不支持，
     继续用手写 handler（[debt.md](debt.md) D54）。`Exn` 的行标签是无参标记 `Exn`；
     `ExnOp` 保留 String 索引只为构造子参数匹配，不参与 `perform`/`handle`。`perform` 走
     同一套族推导（`perfFamilyOfValue` 允许族参数是中性 spine）。
  7. **语法边界**：`comp` 是裸标识符且紧跟 `{` 时按 handle 块解析；其它形态（应用、do 块、
     记录字面量）在源里建议加括号，`fmt` 回渲染时会自动补（`renderHandleCompGo`），否则
     `handle pure x { ... }` 会被解析成记录字面量 `x { ... }`。同一 handle 块的所有 op
     子句共用一个续延 binder 名（`PS_HandleContinuationNameMismatch`）；`return` 不是全局
     关键字（只在子句头识别）。
  8. **comp 的行没有具体化时走行首条目版**：正常 handler 完全体的 comp 是参数（行由调用点
     固定），走 `handleWith`（条目可在行中任意位置）。若 comp 是**行多态表达式**
     （`handle (pure e) { … }`、内联 do 块、泛型函数直接调用），rowRem 版的 `r` 仍是未解
     meta、结果行归约不了；check 位置在第一次失败后改降级到 `handleWithAt`：把条目放在
     comp 的行首（`Cons n e er`）、名字取默认实例名（`"default"`）、结果行 `er` 与期望类型
     合一。代价：失败路径上 handle 表达式会被精化两次；comp 的行已具体时行首版只会同样
     失败，原错误保留。夹具 `dt_base/80`。
- **`fmt` 规范化与列表字面量模式冲突**：`fmt` 把 `a :: b :: []` 精确链改写成 `[a, b]` 后，
  与该模式相邻的后续 `Cons` 分支会触发 `TC_RedundantCtorBranch`（无位置信息 `:0:0`，
  覆盖检查判定与 codegen 解糖不一致）。因此模式里不写 `Nil`/`[]` 结尾；用上面的长度判别
  形态同时规避两者。

## 10. 实例名可选

效应 wrapper 的实例名默认 `"default"`，调用点不写；允许显式指定；**不**新增
`consolePrintAt`/`Defaulted`/`:=` 默认参数。实现采用 **`Member n e r =>` 签名糖 +
隐式 String 名从行解 + `@` 覆盖**。

```vuna
-- 源码只写这一份签名；n/r/证明 binder 都由编译器生成。
consolePrint : Member n ConsoleOp r => String -> Eff r Nat
consolePrint s = sendCore ConsoleOp "console" n (Print s)

consolePrint "hi"          -- 行 [ConsoleOp] ⇒ n = "default"
consolePrint@audit "hi"    -- 行 [ConsoleOp@audit] ⇒ 显式选 audit
consolePrint@(n) "hi"      -- n 是运行时变量
```

- **签名糖**：顶层签名的 `Member n e r` 约束（canonical `Base.Eff.Member`）不是 trait；
  不参与实例搜索，生成隐式 **Rig0** 证明 binder `{_memberK : Member n e r}`，插在前导隐式
  binder 之后。`n`/`r` 的域由参数位置量化为 `String`/`Row`；标签 `e` 的其它自由名仍按
  现有 kind 规则量化。只在顶层签名生效（local/trait/extern 仍拒 `=>`）。
- **隐式 String 运行时例外**：`{n : String}` 是合法隐式 binder，且是 `RigOmega`（实例名
  要传给 `sendCore`/`handleCore`）；类型/索引/证明隐式仍 Rig0，字典隐式原为 Ω。
  `isImplicitDomain`/`inferPiFuel`/`inferArgsGo` 走同一例外；其它值类型隐式仍拒绝。
  resolver 只把 **String 域**的隐式 binder（以及 `Member` ctx 的自由小写名）加进子句体
  作用域，`{a : Type} -> {x : a} -> a` 的 `x` 仍不可命名（`dt_err/43`）。
- **`@`**：`f@name args` 编码为 `@vuna@app@at`；Elab 重写成
  `f (@vuna@inst@arg name) args`。`inferArgsGo` 在第一个隐式 String binder 处消费该标记：
  按 String 检查 payload 后以 RigΩ 插入；没有标记则建 RigΩ meta 交给行 `Member` 求解。
  没有隐式 String binder 时报 `TC_NoInstParam`。隐式参数不参与位置实参，所以饱和应用和
  同型参数无歧义。payload 裸标识符是名字字面量，变量写 `@(n)`。
- **默认名**：只在行字面量裸标签（`effDefaultInstance = "default"`）产生；函数签名里没有
  `"default"`，也没有最终化默认兜底。`[ConsoleOp@audit]` 行里裸调用会解成 `audit`（行已
  指定）；多实例行 `[ConsoleOp@a, ConsoleOp@b]` 裸调用 `TC_AmbiguousInstance`，用
  `@a`/`@b`。
- **base 的写法**：senders（console/fs/clock/env/process/exit/args/stdin/throw）用
  `Member ... =>` 签名，定义体用隐式 n + 短 key `sendCore`；结构行 handler
  （`runError`/`catch`/`tryWith`/`local`/`handleExn`/`run*Host` 等）保留显式 `{n}`/`{w}`
  （`rowRem` 需要在 comp 之后解名字），内部跨 wrapper 调用用 `@(n)`。
- **不做**：`consolePrintAt`、`Defaulted`、`:=` 默认参数、显式位置默认参数、把 `Member`
  变成 trait；`perform`/`handle` 语法本身仍无 `@`（[debt.md](debt.md) D60 的剩余部分）。
