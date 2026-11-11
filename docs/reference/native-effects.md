# Native effects：效应系统内建化（direct-style 终态路线）

**状态（2026-11，实施中）**：方向已定——效应系统从"库级编码 + 编译器协议"
升格为语言内建语义，运行时（OCaml 5 `Effect.Deep`、one-shot 续延、`(key, name)` 路由）
**不动**。原 labeled-rows 库级路线（P1/P1.5）不再实施，本文吸收其全部语义决策
（D1–D9、名字求解规则、表面语法）作为 N1 的内建规则。分四个阶段：N1 语法内建 →
N2 IO 降级 → N3 表示收敛 → N4 箭头行 direct-style。当前进度：N1 提交 1
（双形状兼容 + 名字求解内建）、rotation、提交 2（3 参命名行全量迁移 + 删旧分支）、
提交 3（`perform` 语法）、提交 4a（`@` 行糖）、提交 4b（`handle` 语法）均已完成；
**D2（标签 = op 族应用，效应定义去 String）、D5/D6（探测计数求解、拒绝贪婪 Here）与默认名
`"default"` 也已落地**（§3.4 步骤 6）。N1 命名行收口；实施记录与边界见 §3.4 / §9。

## 1. 诊断：库级编码到头了

四个根因（证据见 [effects.md](effects.md)）：

1. **双轨制**：`IO`（内建效应类型，特权基座）与 `Eff`（用户面库级效应）平行，渡口
   `liftIO` / `runPure` / `joinEff` / `runPure` 四个方向；特权边界（`privileged` /
   `[trust]` / `unsafe`）只管 IO 轨。
2. **三重表示**：同一抽象三副面孔——纯 monad（`Base.State`/`Reader`/`Error`）、
   效应行（`Base.Eff.*`）与宿主 handler（历史 transformer/`MonadIO` 已删除）。
   库 API 与文档面被乘三倍。
3. **协议蔓延**：`Row`/`Member`/`rowRem` 名义是库、实为语言机制。编译器已介入
   `Intrinsics.vuna` 效果协议常量（8 个，L311–340）、`Core/Eval.rowRemReduce`（公理归约）、
   `Elab/Dict.memberLookupRow`（证明构造）、`Elab/Term/Impl.tryEffLift`（自动 lift）、
   行字面量按期望族特判展开。命名行计划里的名字求解规则（原 §4 流程图）本质是类型检查器
   规则，却要以"库 + 协议"形式维护。
4. **描述/权威分离**：类型层 `Row` 说"程序经过哪些效应"，但"被允许做什么"靠三条平行
   机制：运行时 `(key, name)` 路由、包级特权、能力声明，互不可推。

**关键事实**：`Base.Eff` **在 seed 闭包里**（`Vuna.Compiler.Common` import 它；`nix/seed-files.txt`
含 `Base_dEff.ml`），base 的其余效应模块不在 seed。D2 只改标签形状、不引入新语法，旧 seed
仍能编译新源码；rotation 按需。

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
| 实例名 | 每效应 `X : String -> …` 编码 | 名字进 `Row`（ND1），默认 `"default"`（ND3），显式 `@` 名（ND4） |
| 行标签 | `Console n` / `State n s` 等 String 参数化标签 | **标签 = op 族应用**（`ConsoleOp`、`StateOp Nat`）；`Exn` 是无参标记类型 |
| 权威 | 包特权 + `unsafe` + `[trust]` | 宿主 op 构造器不导出（N2）；`unsafe` 面收缩到"构造宿主 handler" |
| 纯效应 | `Base.State`/`Reader`/`Error` 三轨并存 | mock handler 一种写法；interp 可执行（N3） |
| 一次性续延 | 运行时异常兜底（resume 两次抛 `Continuation_already_resumed`） | QTT 线性续延类型化（N3/N4） |
| `res op` 擦除 hack | `Obj.t` + 恒等 cast（D27 残留） | 消失：续延只在运行时，不出现在用户 OCaml 类型里 |
| 三重表示（历史） | 纯 monad / transformer / 效应行 | 已收敛：transformer/`MonadIO` 已删除，只剩 handler 一种 |

**决策 D-All**（原命名行计划 D1–D9 吸收 + 新增）：

- **ND1 名字进 `Row`**：`Cons : (n : String) -> (e : Type) -> Row -> Row`。
- **ND2 效应定义不出现 `String`**（= D2，**已落地**）：标签 = op 族应用（`ConsoleOp`、
  `StateOp Nat`、`ReaderOp Int`…）；`Exn` 保留无参标记类型 `Exn : Type`，`ExnOp` 仍带
  String 索引（构造子参数匹配需要，见 §9）。
- **ND3 裸标签 = 默认名 `"default"`**（= D3）：单点定义 `Base.Eff.defaultInstance`。
- **ND4 多实例显式 `[ConsoleOp@audit]`**（= D4/D9）：原始写法 `Cons n e r` 永远可用；
  `@` 右侧裸标识符是**名字字面量**，变量名必须写 `Cons`。
- **ND5 同名同标签多处 = `TC_AmbiguousInstance`**（= D5，**已落地**）：候选显示条目
  **实例名**（不是标签）。
- **ND6 隐式名只从行解**（= D6，**已落地**）：探测计数 + 唯一候选才提交；
  **拒绝贪婪 Here**（必须全扫描）。
- **ND7 默认兜底不发明行**（= D7，复核收敛）：默认名只在行字面量与 `handleWithAt`
  两个显式点产生；**不新增**最终化名字兜底（当前形状下不可达，见 §3.2）。
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

**D1–D9 复核状态**（旧计划文档在 `2418e35` 删除；历史计划进 git，本节是终态记录）：

| 决策 | 终态 | 状态 |
| --- | --- | --- |
| D1 名字进 Row，不用 At 包装 | `Cons : String -> Type -> Row -> Row` | 已落地（N1） |
| D2 效应定义不出现 String | 标签 = op 族应用；`Exn` 标记 | 已落地 |
| D3 裸标签 = 默认名 | `"default"` | 已落地 |
| D4 多实例 `[ConsoleOp@audit]` | `Cons "audit" ConsoleOp Nil`；原始 `Cons` 可用 | 已落地 |
| D5 歧义复用 `TC_AmbiguousInstance` | 候选 = 实例名 | 已落地 |
| D6 只从行解名字、拒绝贪婪 Here | 探测计数 + 唯一候选提交 | 已落地 |
| D7 默认兜底只在最终化且不发明行 | 只保留“不发明行”；默认名只在 2 个显式点 | 收敛（见 §3.2） |
| D8 保留 key | `(key,name)` 路由不变 | 已成立 |
| D9 `@` 糖 | N1 4a 已完成（不是 P1.5） | 已落地 |

## 3. N1：语法内建（本阶段实施）

### 3.1 表面语法

| 写法 | 降级目标 |
| --- | --- |
| `perform (Print s)` | `Base.Eff.performCore <n=洞> "<op族规范名>" <op 族应用> (Print s)`，结果类型由上下文定 |
| `handle comp { return x -> e1  C p k -> e2 }` | `Base.Eff.handleWith <n=洞> "<op族规范名>" <op 族应用> (Base.Eff.resFn (\o => <res族> <族参数洞…> o)) comp (\x => e1) (\o, k => case o of { C p => e2 })` |
| `[ConsoleOp]` | `Cons "default" ConsoleOp Nil`（ND3；裸标签补默认名） |
| `[ConsoleOp@audit]` | `Cons "audit" ConsoleOp Nil`（ND4） |
| `[StateOp Nat@counter]` | `Cons "counter" (StateOp Nat) Nil`（参数化标签的 `@` 作用于完整标签表达式） |

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
- `handleWith` 的 handler 类型显式写成 `(o : e) -> (resOf rf o -> b) -> b`，这是
  `handleCore` 的裸 `h : Type` 做不到的（否则 clause 里的 `case o of ...` 拿不到族、
  `k` 拿不到续延域）。`rf` 是**擦除量**：结果族 `e -> Type` 不能作显式类型实参
  （M15 禁 `(0 res : op -> Type)`，不标擦除则把 `resXxx` 名字带进运行时），所以用
  `Base.Eff.ResFn` 包装、由 base 函数 `resFn` 构造（构造子名在精化期按规范名查不到）。
- **参数化 op 族**（State/Reader 的 `k = 1`，Console 等 `k = 0`）：族约定一致——
  `<Op> : <params…> -> Type`、`res<短名> : <params…> -> <Op> -> Type`。标签 = op 族应用，
  降级点按 `k` 给标签/op 补洞；族参数由行条目（如 `StateOp Nat` 的 `Nat`）与 op 的类型解出；
  `res` 用 η-λ `\o => res<族> ?p1 … ?pk o` 现场解族参数（不能直接传多态族名）。
- **行多态 comp**（`handle (pure e) { … }`、内联 do 块）：`handleWith` 的 `r` 仍未解、
  结果行 `rowRem n e r` 归约不了，check 位置失败后改降级到 `Base.Eff.handleWithAt`：
  comp 的行被定成 `Cons n e er`（条目在行首）、名字取默认实例名（ND3 的 `default`）、
  结果行就是 `er`（与期望类型合一）。正常 handler 完全体（comp 是参数或行首已有的
  具体行）仍走 `handleWith`，支持条目在行中任意位置。
- 名字仍由行解出（与 `perform` 同一 `Member` 求解路径）；key 两边都是 op 族规范名
  （ND8），所以 `perform` 发的效应正好被 `handle` 接住。
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
（`StateOp ?s` vs 行里的 `StateOp Nat`）靠标签探测匹配。**禁止贪婪 Here**：计数先于
证明构造，非目标条目的标签参数不会被提前解掉。

**D7 收敛**：默认名只在行字面量裸标签与 `handleWithAt` 两个显式点产生；**不做**
“最终化把名字 meta 解成 default”的兜底——行未解/开放尾时那也无法让 `Member` 成立，
只会掩盖错误。仍保持“行仍是 meta 时报未解，不发明出行结构”。

### 3.3 编译器改动点（探索证据）

| 位置 | 改动 |
| --- | --- |
| `Frontend/Lexer.vuna` `isKeyword` | 新增 `"perform"`、`"handle"`；`"return"` **不**占全局关键字（只在 handle 子句头按标识符识别，可继续当普通变量名） |
| `Frontend/Parser.vuna` `parseLhs` + `parseHandle*` | `perform` → `parsePerform`（单表达式）；`handle` → `parseHandle`（`comp { return-clause? op-clause+ }`）。op 子句头解析成模式后**拆出尾部续延 binder**，再合成 `\o, k => case o of { Ctor pats => body }`；`comp` 为裸标识符且紧跟 `{` 时直接收成 `EVar`（否则会被 `parseAtomBase` 当记录字面量） |
| `Frontend/Ast.vuna` 保留名区 | `performSyntax` / `handleSyntax` / `handleNoRetSyntax`（无 return 子句的哨兵）+ 判定函数；`Expr` 不加变体（ND12） |
| `Loader` | 无专门分支：parser 已把 handle 降到 markers + 普通 λ/case，Loader 只做常规名字解析（构造子解析成规范名/over 名，供 ND10 推族） |
| `Intrinsics.vuna` 效果协议常量 | `Row.Cons` 3 参、`Member` 3 参（名字槽）、`effDefaultInstance = "default"`；`perform`/`handle` 的 key 由降级点生成 |
| `Elab/Dict.vuna` `memberLookupRow`/`resolveRowGoalsCtx`/`resolveDictGoals` | 3 参模式 + §3.2 探测计数求解（删除贪婪匹配；候选文本用实例名；无最终化默认兜底） |
| `Elab/Term/Impl.vuna` | `@vuna@perform` → `performCore`；`@vuna@handle` → `Base.Eff.handleWith`（rowRem 版）/ `handleWithAt`（行首条目版，check 失败后重试）：从 clause 构造子推 op 族（ND10，跨族报 `TC_HandleClauseFamilyMismatch`）、**标签 = op 族应用**（`handleOpArg canon k`，D2）、res = `res<短名>`（ND9）、按 op 族 kind 的显式参数个数 `k` 补洞（State/Reader `k = 1`；非宇宙域参数如 `ExnOp` 的 `Row` 报 `TC_HandleFamilyUnsupported`）；`handleOperand` 在 `inferEFuel`/`checkEFuel`/`inferEFuelHint` 三处内联拦截 |
| `Core/Eval.vuna` `rowRemReduce` | `VCon consName (n :: h :: t :: _)` 双匹配（先名后标签）；比较前对 name/label（含 label 一层 spine 实参）做 `force`——已解 meta 在值里仍是 `VMeta` 节点，不 force 就永远比较不出相等（`handle` 的结果行依赖这一点） |
| `Elab/Term/Impl.vuna` `rowEffectLabels` | 行条目展示 `<短标签>@<名字>`（`ConsoleOp@default`、`StateOp Nat@counter`）；歧义候选显示实例名 |
| `Diagnostics/{Tc,Frontend/Diagnostics}.vuna` | `TC_AmbiguousInstance`、`TC_EffResFamilyMissing`（ND9）、`TC_HandleClauseFamilyMismatch`（ND10）、`TC_HandleFamilyUnsupported`（族形状）；PS 侧 `PS_Handle{NeedsOpClause,ClauseNotIndented,ClauseNeedsCtor,ContinuationNameMismatch,ReturnMisplaced}` |
| `Base.Eff`（在 seed 闭包里） | `defaultInstance = "default"`、`Row.Cons`/`Member` 3 参、`ResFn(..)`/`resFn`/`resOf`/`performCore`/`handleWith`/`handleWithAt`（`e` 同时作标签与 op 类型、`rf` 擦除量、`{w : Member n e r}` 移到 comp 之后先解名字；行首条目版把条目放在 comp 的行首、结果行即剩余行）；12 个效应模块删除 String 标签 |

不改：`Eff` 本体、`runPure`/`joinEff`、`prim_effectPerform`/`prim_effectHandle`
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
   + rowRem 归约修复 + Fmt/Lint 接线；随后补齐**参数化 op 族**（State/Reader，族参数
   按 `k` 补洞，`perform` 同步支持）与**行多态 comp**（`handleWithAt` 行首条目版），
   两者分别消掉当时登记的 D54/D56。夹具 `dt_base/76`–`80` 与 `dt_err/99–104`；
   实现要点与边界见 §9。
5. **N1 收口**（已完成）：语法面（`perform` / `handle` / `@` 行糖）与名字求解全部落地，
   文档同步到本节与 §9。
6. **D2 + D5/D6（已完成）**：标签 = op 族应用（`ConsoleOp` / `StateOp Nat`），删除 11 个
   String 标签类型；`Exn` 退成无参标记（`ExnOp` 保留 String 索引，见 §9）；`Dict` 改成
   探测计数求解、删除贪婪匹配；默认名 `"default"`；夹具与文档全量迁移，新增
   `dt_base/81–82`、`dt_err/108–109`。边界见 §9。

过渡桥（已删除）：提交 2 曾从标签首个 String 实参推导名字；D2 落地后该路径删除，
行字面量只剩「裸标签 = 默认名」+ `@` 显式名两种来源。`weaken` 的名字参数仍是擦除量
`(0 n : String)`（M15 拒绝值类型隐式 binder；`(0 n)` 只作类型索引、运行时完全擦除）。

新关键字对 bootstrap 无压力：降级逻辑与编译器源码本身都不需要用 `perform`/`handle` 写
（编译器源码不写效应程序）；即使将来要用，也是 rotate 之后的事（bootstrap.md L54–56）。

## 4. N2：IO 降级

- `main : Eff [] a`（替代 `main : Eff [] a`）；运行时 main 钩子预装宿主 handler（print/fs/
  clock/env/process 的 handler 在特权层由 runtime 直接提供）。
- 宿主 op 类型（`ConsoleOp` 等的宿主分支）构造器不导出：用户能 `perform`、能写 mock
  handler，但**不能**在无 handler 情况下构造宿主动作——权威边界从 `unsafe`/`privileged`
  收缩为"宿主 op 构造器不导出"。
- `Base.Host`、`prim_schedNewScope` 保留为特权逃生口；`runPure` 收缩为内部。
- `IO` 类型仍内建保留（`Base.Host` / `ST` / `IORef` 等宿主面不动，另行评估是否全部改写为
  宿主 op——倾向是，但放 N2 尾部）。

## 5. N3：表示收敛

- `Base.State`/`Base.Reader`/`Base.Error` 纯表示已随 transformer 一并删除：State/Reader/Exn 只剩 handler 一种写法。
- **interp 升级**：纯 handler（不触宿主 op）在 NbE 内执行（delimited continuation 的
  NbE 实现）；`vuna interp` 可跑 mock 效应程序，mock/real 对拍变成 interp vs 产物。
- **QTT 线性续延**：`k : res o -{rows}-> ans` 标 linear；resume 两次从运行时异常变编译错误。
- D27 残留（漏 cast 边界、trait 自动 λ 插入点）随 `res op` 不再出现在用户类型面而消失。

## 6. N4：箭头行 direct-style（远期，独立立项）

`a ->{r} b`：效应进箭头类型，bind 由应用语义承担，monad 退场。前置：Core `TPi` 增行域
（`TPi : String -> Bool -> Rig -> Term -> Term` 加效应域或引入新形式）、行合一半路
（Koka 式 row variable）、`do`/`>>=` 与直接风格的互操作设计。**N1–N3 全部是 N4 的前置
与缓冲**：行结构、求解规则、handler 语义到 N3 已全部就位，N4 只换表示轴。

## 7. 迁移面（N1 + D2，均已完成）

| 区域 | 规模 |
| --- | --- |
| 命名效应模块 | 12 个（`base/lib/Base/Eff*.vuna` + `Eff/Reader.vuna`）：删除 String 标签，标签改 op 族应用 |
| `Eff [` 闭行 | `base/lib` 与 `test` 的行字面量改为 `Cons n <Op> …` / `[<Op>@name]` |
| `rowRem`/`Member (` | `base/lib` 约 50 处改 op 族标签 |
| 测试夹具 | `dt_base/11–45,74–82`、`dt_io/01–07`、`dt_err/70–109`、`packages/01–04`、`stdlib/03,09,10`、`run/16–17`、`traits/pending/31`；`run_err/04` 的 key 文案随 ND8 变 |
| 文档 | `effects.md`、`effects-layers.md`、`stdlib.md`、`language.md`、`type-system.md`、`debt.md`、本文 |

## 8. 测试与验收

- N1 正例：`perform` 单实例不写名字（`dt_base/74`）；`@` 行糖（`75`）；`handle` 语法
  （`76_eff_handle_syntax`：省略 return / 显式 return / 开放尾行 wrapper / infer 位置的
  let 绑定；`77_eff_handle_answer`：`return x -> pure x` 答案 + 两层 `runPure`、abort 续延；
  `78_eff_handle_state` / `79_eff_handle_reader`：参数化 op 族（`k = 1`）；
  `80_eff_handle_unknown_row`：行多态 comp（`pure` 与内联 do 块）走 `handleWithAt`）。
- D2/D3/D6 正例：`dt_base/81_eff_named_row_default`（裸标签 = 默认名，perform/handle
  都不写名字）；`dt_base/82_eff_named_row_multi`（单实例裸标签自动解名 + 多实例用
  带 `(n : String)` 的 wrapper）。
- D5 负例：`dt_err/108_eff_ambiguous_console`（ConsoleOp 两实例 + 裸 `perform`）与
  `dt_err/109_eff_ambiguous_state`（`StateOp Nat` 两实例，覆盖参数化标签探测计数）
  → `TC_AmbiguousInstance`，候选显示实例名。
- N1 负例：res 族缺失 → `TC_EffResFamilyMissing`（`dt_err/98`、`101`）；clause 构造子跨族
  → `TC_HandleClauseFamilyMismatch`（`99`）；作用域/高阶 op 族（Exn）→ `TC_HandleFamilyUnsupported`
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
- **参数化 op 族的字面量边界（D2 实测）**：`perform Put 1` 里字面量先按 Numeric 默认成
  `Int`，而行的标签是 `StateOp Nat` 时 Member 无法把 `?s` 解成 `Nat`；写
  `oneN : Nat` 后 `perform Put oneN` 正常。这是数值默认与行推导的交互边界，未在本轮
  改默认器。
- **`handle` clause 与依赖匹配**：`k` 的类型 `res o` 在 case 分支内收窄，降级产生的
  case 是依赖 matcher，验证 elab_perf 与深层依赖匹配的组合。
- **`return` 不是全局关键字**（提交 4b 定）：只在 handle 子句头按标识符识别，普通作用域里
  仍是合法标识符；return 子句的位置/重复由 `PS_HandleReturnMisplaced` 覆盖。
- **工具链展示**：诊断里显示 `<短标签>@<名字>`（`ConsoleOp@default`、`StateOp Nat@counter`）；
  `vuna api`/`doc`/LSP hover 仍是通用类型展示，行条目美化留后续。
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
     参数传。D2 后的形状是 `(n : String) -> (key : String) -> (e : Type) -> {r} -> {w : Member n e r}
     -> {x} -> (o : e) -> Eff r x`（标签与 op 同型）；`handleWith` 的 `{w}` 放在 `comp`
     之后、`ret`/`opH` 之前，先由行解出标签参数，避免 handler 体里的字面量先默认成 `Int`。
     `res` 族仍只做存在性协议校验（ND9 的精确结果类型待后续）。
  5. **运行期 key 尚未统一（ND8 下半）**：`perform` 用 op 族规范名，现有 base wrapper
     仍手写 `"console"` 等 key，所以 perform 程序要用**同 key 的 handler**
     （夹具 74 演示）；统一留给 `handle` 语法的提交。
  4. **族形状与参数个数**：base 全体一致——`<Op> : <params…> -> Type`、
     `<Label> : String -> <params…> -> Type`、`res<Label> : <params…> -> <Op> -> Type`。
     降级点按 op 族 kind 数**显式参数个数 `k`**：`k` 给标签/op 补洞，结果族用 η-λ
     `\o => res<族> ?p1 … ?pk o` 现场解族参数（State/Reader `k = 1`，Console 等 `k = 0`）。
     标签/结果族 arity 与 `k` 不符即 `TC_HandleFamilyUnsupported`：当前只剩**作用域/高阶族**
     Exn（`ExnOp : String -> Row -> Type -> Type`，第一个显式参数域是 `Row` 而非宇宙）不支持，
     继续用手写 handler（[debt.md](debt.md) D54）。`Exn` 的行标签是无参标记 `Exn`；
     `ExnOp` 保留 String 索引只为构造子参数匹配，不参与 `perform`/`handle`。
     `perform` 走同一套族推导（`perfFamilyOfValue` 允许族参数是中性 spine）。
  5. **key 配对**：`handle` 与 `perform` 的 key 都是 op 族规范名，二者配对；与 base 里手写
     `"console"`/`"state"`/`"reader"` 等 key 的旧 wrapper（`get`/`put`/`ask`/`runConsole`…）
     **不**配对（过渡期并存，统一留 N2/N3），所以参数化族的语法夹具用 `perform` 而不是
     `get`/`ask` 写程序。
  6. **语法边界**：`comp` 是裸标识符且紧跟 `{` 时按 handle 块解析；其它形态（应用、do 块、
     记录字面量）在源里建议加括号，`fmt` 回渲染时会自动补（`renderHandleCompGo`），
     否则 `handle pure x { ... }` 会被解析成记录字面量 `x { ... }`。同一 handle 块的所有
     op 子句共用一个续延 binder 名（`PS_HandleContinuationNameMismatch`）；`return` 不是
     全局关键字（只在子句头识别）。
  7. **comp 的行没有具体化时走行首条目版**：正常 handler 完全体的 comp 是参数（行由调用点
     固定），走 `handleWith`（条目可在行中任意位置）。若 comp 是**行多态表达式**
     （`handle (pure e) { … }`、内联 do 块、泛型函数直接调用），rowRem 版的 `r` 仍是未解
     meta、结果行归约不了；check 位置在第一次失败后改降级到 `handleWithAt`：把条目放在
     comp 的行首（`Cons n e er`）、名字取默认实例名（ND3 的 `default`）、结果行 `er` 与期望
     类型合一。代价：失败路径上 handle 表达式会被精化两次；comp 的行已具体时行首版只会
     同样失败，原错误保留。夹具 `dt_base/80`。
- **相关：`fmt` 规范化与列表字面量模式冲突**：`fmt` 把 `a :: b :: []` 精确链改写成
  `[a, b]` 后，与该模式相邻的后续 Cons 分支会触发 `TC_RedundantCtorBranch`
  （无位置信息 `:0:0`，覆盖检查判定与 codegen 解糖不一致，机制待独立修复）。
  因此模式里不写 `Nil`/`[]` 结尾；用上面的长度判别形态同时规避两者。
