# lint：AST 驱动的风格检查与自动修复

本文记录 `vuna lint` 的规则、可修复判据与语料。实现入口是
`lib/Vuna/Lint/Rules.vuna`（规则与源码切片）、`lib/Vuna/Lint/Fix.vuna`（应用 Edit 的
多轮循环）、`lib/Vuna/Lint.vuna`（CLI 与输出）、`lib/Vuna/Lint/Diagnostics.vuna`
（规则枚举：code / rule / 消息的唯一真源）。

## 1. 用法与输出

```console
vuna lint <file.vuna>...          # 只报告：有 finding 时退出码 1
vuna lint --fix <file.vuna>...    # 逐轮应用可修复 finding，最多 8 轮
```

输出格式：`路径:行:列: [LN_xxx] rule-name: 消息`（列 1-based）。`--fix` 模式下
不可修复的 finding 追加 ` (not auto-fixable)`。LSP 把同一批 finding 合并为 warning
（severity 2），见 `lib/Vuna/Lsp/Diagnostics.vuna`。

## 2. 实现模型

M31 起规则判定全部走 AST：`lintSource` 先 `parseSource`，再按声明遍历 `Expr`
（覆盖全部构造子，含 `ELocalFun` / `EAnn`），同时携带外层模式上下文（clause 模式
列表或外层 case 的 alt 模式）。需要源码原文（字面量、模式、分支体）时用 span +
token 边界从源码切片（`exprText` / `patText`），**不重新渲染/转义字符串字面量**。

修复用行范围 `Edit start stop lines` 表示；`--fix` 每轮收集所有 Edit、按起点从后往前
应用、重新 parse 复验。候选按（行, 列）排序，被更大 Edit 行范围包含的内层 finding
会被丢弃（避免同一链/同一次折叠产生互相冲突的 Edit）。

遍历相互递归组把 `fuel` 放在第 0 形参并 `if fuel <= 0` 守卫，这是编译器
`tryFuelThread` 判据能接受的形态。

## 3. 规则

| code | rule | 可修复 | 触发 |
| --- | --- | --- | --- |
| `LN_LiteralIfChain` | `literal-if-chain` | 是 | `if x == lit then .. else if x == lit then ..` 链（lit 为 String/Int 字面量，else 链同一 scrutinee，分支 ≥2） |
| `LN_LiftDestructure` | `lift-destructure` | 是 | 单候选解构提升到外层 clause/alt 模式（单 alt case / 单绑定 let） |
| `LN_CaseToClauses` | `case-to-clauses` | 是 | 顶层单 clause 函数的 `case` 分支提升为多条同名 clause |

`LN_RedundantCase` / `redundant-case` 是 `lift-destructure` 的历史别名（code 只增不删），
规则已不再产生它；`vuna gen-errors` 仍会列出。

三条规则都只做**语法可证**的改写；判据不满足时只报告、不给 Edit
（`findingEdit = Nothing`）。

### 3.1 `literal-if-chain`

AST 条件：`EIf` 链；条件形如 `EApp (EVar "==") [EVar x, lit]`，`lit` 为 `EStr`/`EInt`；
`else` 继续同 scrutinee 的 `EIf`；分支数 ≥2。改写为：

```console
f x =
  if x == "+" then 2
  else if x == "-" then 2
  else 0
# =>
f x =
  case x of
    "+" => 2
    "-" => 2
    _ => 0
```

Edit 覆盖整条链的 span 行范围：首行 `case x of`（`= if` 同行时保留该行前缀），
每个分支 `<indent+2>lit => then`，末尾 `<indent+2>_ => default`。字面量与分支体
都从源码切片（`exprText`），因此转义形式保持不变。

可修复判据：分支体与 default **单行**；then/default 收束在自己的行片段末尾
（同行后随 token 只允许 `else`，支持 Intrinsics `parseCapability` 那种
`else if a then x else if b then y else z` 的 inline 链尾）；被替换行无
`--`/`{-`/tab/CR。

### 3.2 `lift-destructure`

两种形态：

- 单 alt case：`ECase (EVar x) [(pat, body)]`，`pat` 为 `PCon`/`PInt`/`PStr`/`PRecord`；
- 单绑定 let：`ELet [(pat, EVar x)] body`（只处理 `let` 形态，`where` 的 `ELet` 不处理），
  `pat` 非 `PVar`/`PWild`（即 A1 的 let 模式解构）。

两者都要求：`x` 在外层模式里恰好出现一次；`body` 不引用 `x`；内层模式变量与外层
其它变量不冲突。改写把外层模式里的 `x` 换成 `(<pat 原文>)`，body 成为外层子句/alt
的体：

```console
first p = case p of            shift p =
  Pair a b => a        ==>     shift (Pair x y) = x + y
                               （let 解构形态）
first (Pair a b) = a
```

可修复判据（沿用旧 `redundant-case` 的保守策略）：外层是 clause 时该 DFun 是该名字的
最后一条 clause；外层是嵌套 alt 时该 alt 是父 case 的最后一个 alt；外层 head/alt 单行；
被替换行无 `--`/`{-`/tab/CR；单行体收束行片段，多行体从独立行开始。多行体换行并按
外层缩进重排（dedent 到 case/let 行的缩进）。

### 3.3 `case-to-clauses`

顶层 `DFun name pats` 的 body 直接是 `ECase (EVar x) alts`；`x` 是 `pats` 中的顶层
`PVar` 且恰好一次；`alts` ≥2；语法可证穷尽（最后一个模式是 `PWild`/`PVar`，或恰好
`Nil` + `Cons` 两分支）；该函数名只有一条 clause；至少一个分支体引用 `x`（全不引用时
lift 后参数只剩模式匹配，不是本规则的目标形态）；每个分支可提升：分支体引用 `x` 时
该分支模式必须是 `PWild`（提升后写成 `x` 绑定），`PVar`/构造子模式且 body 引用 `x`
则不报；分支模式变量与外层其它参数不冲突。

Edit 把 `[clause 起始行 .. case 末行]` 替换为 N 条 clause：单行 body 与 head 同行，
多行 body 换行并重排缩进到 clause 缩进 +2：

```console
genTypeDeclsOf allDatas subset = case subset of
  [] => Ok ""
  _ => <多行 body>
# =>
genTypeDeclsOf allDatas [] = Ok ""
genTypeDeclsOf allDatas subset = <多行 body 重排>
```

可修复判据：clause head 模式单行；被替换行无注释/tab/CR；每个分支体单行收束行片段或
从独立行开始的多行体。

## 4. 语料与测试

`test/run-tests.sh` 第 15/16 段：

- `test/corpus/lint/*.vuna` + `.out`：报告 golden 与退出码（01–04 为回归基线，
  05–11 覆盖三条规则与「不报」形态：inline else、Int 链、`= if` 链首、`= case` 单分支、
  `genTypeDeclsOf`、多分支无兜底/body 引用 x/多 clause、let 解构）；
- `test/corpus/fix/*.vuna` + `.expected`：`--fix` 产物与二次运行幂等（01–06 回归基线，
  07–12 覆盖三条规则与 let 解构）。

## 5. 已知边界

- **规则只报告可安全自动修复的形态**：不可安全折叠的情形（非最后 clause、clause head
  跨行、含注释/tab/CR、分支体无法安全收束等）**不再报告**（早期 `04_unfixable` 的
  “报告但不修复”行为在 M30 统一为“不报”，语料期望为空输出）。
- **签名含隐式 Pi 的函数跳过 clause 级改写**：`{n : Nat} -> ...` 这类隐式参数由精化器
  插入，把 `case` 折叠进 clause 模式会改变模式矩阵与隐式 Pi 的对齐（`Base.Vec.vhead`
  实测会把 `VCons` 错配到 `n : Nat`）；`literal-if-chain` 与函数参数无关，不受影响。
- **CI 门禁**：`nix/checks/vuna-lint.sh` 现在扫全部包源码
  （`find compiler/lib base/lib lib app -name '*.vuna'`），要求零 finding；规则不再产生
  “只报告”项，因此门禁可通过。
- `--fix` 产物保证可重新 parse；不保证 `vuna fmt` 幂等（历史语料 01–03 的期望产物
  保留旧的「行首 `case`」形态）。新增 fix 语料按 fmt 规范形态设计并验证幂等。
- `lift-destructure` 只处理顶层 DFun 的 clause 与 case alt 的直接体；instance 方法、
  `where` 绑定不参与 clause 级提升（`ELocalFun`/`EAnn` 只做遍历）。
- 规则不做类型/语义推理，只做语法可证的改写（穷尽性仅限 wildcard 或 Nil/Cons 形态）。
- `case-to-clauses` 要求 `case` 直接是函数体；`x` 未被任何分支引用时不触发。

## 6. 相关文件

- `lib/Vuna/Lint/Rules.vuna`：规则、AST 遍历、源码切片、Edit/Finding 数据类型；
- `lib/Vuna/Lint/Fix.vuna`：Edit 排序与多轮 `--fix`；
- `lib/Vuna/Lint/Diagnostics.vuna`：`LintRule` 枚举（code/rule/消息/可修复性/文档项）；
- `lib/Vuna/Lint.vuna`：CLI 参数、打印、退出码；
- `lib/Vuna/Lsp/Diagnostics.vuna`：LSP 诊断合并。