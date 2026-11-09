# lint：AST 驱动的 dispatch 提升、列表字面量归一与自动修复

本文记录 `vuna lint` 的规则、可修复判据与语料。实现入口是
`lib/Vuna/Lint/Rules.vuna`（dispatch 判定、提升渲染、列表链检测、源码切片）、
`lib/Vuna/Lint/Fix.vuna`（应用 Edit 的多轮循环）、`lib/Vuna/Lint.vuna`（CLI 与输出）、
`lib/Vuna/Lint/Diagnostics.vuna`（规则枚举：code / rule / 消息的唯一真源）。

## 1. 用法与输出

```console
vuna lint <file.vuna>...          # 只报告：有 finding 时退出码 1
vuna lint --fix <file.vuna>...    # 逐轮应用可修复 finding，最多 8 轮
```

输出格式：`路径:行:列: [LN_xxx] rule-name: 消息`（列 1-based）。`--fix` 模式下不可修复的
finding 追加 ` (not auto-fixable)`。LSP 把同一批 finding 合并为 warning（severity 2），见
`lib/Vuna/Lsp/Diagnostics.vuna`。

`vuna lint` **必须显式给路径**：没有位置参数是用法错误（exit 2）；有 finding 时 exit 1；
文件读不到 / 解析失败 / 取不到程序级 fixity 上下文也是工具错误（exit 2），不静默跳过。
`--fix` 只应用可安全修复的 finding（被替换行含注释 / tab / CR 时跳过），每轮复验后余下
的 finding 照常报告。

## 2. 实现模型

规则判定全部走 AST：`lintSourceWith` 先 `parseSource`，再按声明遍历 `Expr`（覆盖全部构造子，
含 `ELocalFun` / `EAnn`），同时携带外层模式上下文（clause 模式列表或外层 case 的 alt
模式）。需要源码原文（字面量、模式、分支体）时用 span + token 边界从源码切片
（`exprText` / `patText`），**不重新渲染 / 转义字符串字面量**。

切片右边界按「源码序严格在 span end 之后」找 token：普通 token 的 span end 是最后一个
token 的起点，模板字面量（`TTmpl`）的 span end 是字面量结束后的位置，两种都能取到正确的
下一个 token（这保证 `"(x ${s})"` 这类分支体不会被切成行尾）。

修复用行范围 `Edit start stop lines` 表示；`--fix` 每轮收集所有 Edit、按起点从后往前应用、
重新 parse 复验。候选按（行, 列）排序，被更大 Edit 行范围包含的内层 finding 会被丢弃
（避免同一链 / 同一次折叠产生互相冲突的 Edit）。

遍历相互递归组把 `fuel` 放在第 0 形参并 `if fuel <= 0` 守卫，这是编译器
`tryFuelThread` 判据能接受的形态。

`list-literal` 用**独立的表达式遍历**（`walkListLiteral`），不进入 pattern，也不与
dispatch 的 lane 判定耦合；类型位置（签名、axiom/extern、data kind/构造子、record 字段、
trait 方法、instance 上下文/head/方法）由 `declFindings` 分别扫描。模板插值洞
（`EInterp` 的 `IPHole`）跳过：lint 的顶层 token 列表不含洞内 token，`exprText` 无法
可靠切片（已知边界，见 §6）。

## 3. 规则概览

lint 的 dispatch 类改写统一是：**识别一个 dispatch，把它提升进外层的 clause / alt 模式**。

| dispatch 源 | 形态 | 叶子 |
| --- | --- | --- |
| if（字面量链） | `if x == lit then A else if x == lit then B else C` | `lit => A`、…、默认 `_ => C` |
| if（Bool 变量） | `if b then A else if c then B else C`，`b`/`c` 是外层模式变量 | `True => A`、`False/True => B`、`False/False => C` |
| case | `case x of p1 => e1; ...` | 每个 alt 一个叶子 |
| let | `let p = x in body` | 一个叶子（单 alt） |

提升目标：

- **子句 lane**：1 个叶子 → 模式替换（`let` / 单 alt case）；≥2 个叶子 → 拆成多条同名
  clause。要求该函数名只有一条 clause（多 clause 拆分可能暴露 unreachable clause）。
- **alt lane**：1 个叶子 → 模式替换；≥2 个叶子 → 把该 alt 拆成多个更细的 alt。要求该
  alt 是外层 case 的最后一个 alt。

提升只发生在 clause/alt 的**直接体**。嵌套在表达式里的 dispatch（`g (if b then A else B)`、
let 值里的 if）需要上下文分发（case-of-case），会复制代码与求值结构，本轮不做，源码保持
原形。Bool 变量 if 提升不了时**不回退 case**：`if b then ...` 本身就是更紧凑的形态；
只有字面量 if 链提升不了时才回退成 case（`chainFindings`）。

规则按 dispatch 源划分：

| code | rule | 可修复 | 触发 |
| --- | --- | --- | --- |
| `LN_LiteralIfChain` | `literal-if-chain` | 是 | if dispatch（`x == lit` 链 / Bool 变量）在可提升位置；字面量链提升失败时改写为 case |
| `LN_DispatchLift` | `dispatch-lift` | 是 | case / let dispatch 在可提升位置（单 alt 替换、多 alt 拆 clause / alt） |
| `LN_ListLiteral` | `list-literal` | 是 | 表达式/类型位置的闭合 cons 链（`::` / `Cons` + `[]` / `Nil`）与裸 `Nil`；**模式匹配不动** |

dispatch 两条规则共用同一套 lane 判定与 as-pattern 渲染；`lift-destructure` /
`case-to-clauses` 的旧 code 已删除（判定与渲染合并进 `dispatch-lift`）。`list-literal`
是独立的表达式遍历（不是 dispatch 提升），见 §3.3。

### 3.1 `literal-if-chain`

AST 条件：

- 字面量链：`EIf` 链；条件形如 `EApp (EVar "==") [EVar x, lit]`，`lit` 为 `EStr` / `EInt`；
  `else` 继续同 scrutinee 的 `EIf`；分支数 ≥2。
- Bool 变量：`EIf (EVar b) A B`，`b` 是外层模式变量；`else` 可继续是另一个外层模式变量的
  `EIf`（笛卡尔叶子）；遇到非模式变量 / 重复 scrutinee / 非 if 的 else 即停止，把剩余
  if 作为叶子体保留。

提升示例：

```console
-- 字面量链
sign name = if name == "a" then 1 else if name == "b" then 2 else 3
# => sign "a" = 1
#    sign "b" = 2
#    sign _ = 3

-- Bool 变量（clause 体）
not b = if b then False else True
# => not True = False
#    not False = True

-- Bool 变量（alt 体，外层 case 保留）
h p = case firstOf p of
  Other => 0
  Wrap b n => if b then n else 0
# => h p = case firstOf p of
#      Other => 0
#      Wrap True n => n
#      Wrap False n => 0
```

可修复判据：lane head 单行；被替换行无 `--` / `{-` / tab / CR；每个叶子体单行且收束在自己
的行片段末尾（同行后随 token 只允许 `else`）；scrutinee 在外层模式里恰好出现一次；所有
替换 token 都能定位。body 引用 scrutinee 时生成 as-pattern（`b@True`、`label@"x"`）。

### 3.2 `dispatch-lift`

- 单 alt case：`ECase (EVar x) [(pat, body)]`，`pat` 为 `PCon` / `PInt` / `PStr` /
  `PRecord`；单绑定 let：`ELet [(pat, EVar x)] body`（`where` 的 `ELet` 不处理），`pat`
  非 `PVar` / `PWild`。两者都要求 `x` 在外层模式里恰好出现一次、`body` 不引用 `x`、
  内层模式变量与外层其它变量不冲突；改写把外层模式里的 `x` 换成 `(<pat 原文>)`。
- 多 alt 顶层 case：`ECase (EVar x) alts`，`alts` ≥2，顶层单 clause 函数，`x` 是参数且
  恰好出现一次；每个分支可提升。拆分后的 clause 顺序与分支顺序一致。

可修复判据：外层是 clause 时该 DFun 是该名字的最后一条 clause（单 alt 替换）或唯一
clause（多 alt 拆分）；外层是嵌套 alt 时该 alt 是父 case 的最后一个 alt；外层 head/alt
单行；被替换行无注释 / tab / CR；单行体收束行片段，多行体从独立行开始。

拆分「分支体引用 scrutinee」时用 as-pattern 保持绑定（见 §5）。

### 3.3 `list-literal`

- **触发**：表达式或类型位置的**闭合 cons 链**：
  - `a :: b :: []`（`::` 走 `Loader.Fixity` 的 alias，lint 看到 `EApp (EVar "::")`）；
  - `Cons a (Cons b Nil)`（显式构造子）；
  - 裸 `Nil`（空列表构造）。
- **不触发**：pattern（`PCon "::"` / `PCon "Cons"` 不在表达式遍历内）、开放链
  `a :: xs`（无法写成闭合字面量）、已经是列表字面量的保留名、模板插值洞（见 §6）。
- **可修复判据**：整个表达式单行；被替换行无 `--` / `{-` / tab / CR；每个元素能由
  `exprText` 从源码切出。修复文本是 `[e1, e2, ...]` / `[]`，并剥离**紧邻**表达式的
  成对括号（`f (a :: [])` → `f [a]`；只剥紧邻成对的一层/多层，不跨表达式贪心）。
- **不可修复形态仍报告**（跨行、含注释 / tab），`--fix` 不写文件并在输出标
  ` (not auto-fixable)`。
- 语法等价性由 M41 的「列表字面量按期望族展开」保证：`[..]` 与 `Cons`/`Nil` 链在
  List / Vec / Row / 用户同形族上落到同一组构造子；模式里的 `::` 保持原样。
- 一个已知边界：仓库里 `compiler/lib/Vuna/Compiler/Frontend/Parser.vuna` 的 4 处
  `(name :: [])` 位于模板插值 `${...}` 内，规则跳过；这 4 处已手工改写为 `[name]`。
- 语料中 `dt/67` / `dt_err/70` 的显式 `Cons`/`Nil` 与 `dt_base/53` 的裸 `Nil`
  仍保留：它们测试的是构造子名解析 / 同名重载，不是列表语法覆盖；corpus 不在
  `checks.vuna-lint` 门禁内。

## 4. 语料与测试

原生 suite 的 `lint` / `fix` family（`test/suite.toml`，kind `lint` / `fix`）：

- `test/corpus/lint/*.vuna` + `.out`：报告 golden 与退出码（01–04 为回归基线，05–14 覆盖
  dispatch 两条规则与「不报」形态；15–18 覆盖 Bool 变量 if 的 clause/alt 报告、不报形态与
  模板字符串分支；19 覆盖 `list-literal`：`::` / `Cons` / 裸 `Nil` / 类型位置报告，
  以及 pattern、开放链、注释行、既有字面量不误报）。
- `test/corpus/fix/*.vuna` + `.expected`：`--fix` 产物与二次运行幂等（01–06 回归基线，
  07–15 覆盖 dispatch 两条规则与 let 解构；16–19 覆盖 Bool if 的 clause/alt/链提升、
  as-pattern 与模板字符串分支；20 覆盖 `list-literal`：表达式/类型位置、括号剥离、
  `Cons` / 裸 `Nil`、注释行不修、幂等）。

## 5. as-pattern 生成

拆分 / 替换后，如果叶子体仍然引用 scrutinee，用 as-pattern（`x@pat`）保留绑定：

```console
advance (PState file toks last count) = case toks of
  t :: rest => ...
  [] => ...
# =>
advance (PState file toks@(t :: rest) last count) = ...
advance (PState file toks@[] last count) = ...
```

Bool / 字面量分派同样适用：`keep b = if b then b else b` → `keep b@True = b` /
`keep b@False = b`；`mark label = if label == "x" then label else ...` →
`mark label@"x" = label`。STR 把 as 绑定视作整个值（`patNames` / `pathInPat` /
`patSizeStrict` 已支持），因此递归调用落在 as 模式的严格子项时仍能证明下降；但拆分本身
不豁免终止性检查（见 §6）。

## 6. 已知边界

- **dispatch 规则只报告可安全自动修复的形态**：不可安全折叠的情形（非最后 clause、clause
  head 跨行、含注释 / tab / CR、分支体无法安全收束等）**不报告**（语料期望为空输出）。
  `list-literal` 例外：不可修复的闭合链 / 裸 `Nil` 仍报告（`--fix` 标 not auto-fixable），
  因为「应写成列表字面量」本身是确定的。
- **`list-literal` 的模板插值洞跳过**：lint 只拿到顶层 token 列表，`EInterp` 洞内 token
  不可见，切片右边界不可靠；formatter 同样不保留洞内注释（已知边界）。
- **提升只在直接体**：嵌套 dispatch 需要上下文分发，本轮不做；保持原形。
- **子句拆分只对单 clause 函数**：多 clause 函数里拆子句可能暴露 unreachable clause，
  因此 `if` / `case` 的 clause 拆分都要求 `countFunClauses == 1`；多 clause 函数的 Bool
  if 保持 `if`。alt 拆分 / 替换要求该 alt 是最后一个。
- **签名含隐式 Pi 的函数跳过 clause 级改写**：`{n : Nat} -> ...` 这类隐式参数由精化器
  插入，把 dispatch 折叠进 clause 模式会改变模式矩阵与隐式 Pi 的对齐（`Base.Vec.vhead`
  实测会把 `Cons` 错配到 `n : Nat`）；`literal-if-chain` / `dispatch-lift` 都跳过这类声明。
  `list-literal` 不改变 clause 结构，因此这类函数的体仍会扫描。
- **Bool 名字解析**：Bool if 提升按源码名字生成 `True` / `False` 模式；vuna 包内它们就是
  canonical `Base.Bool` 构造子。用户自定义同名构造子的极端情况不由 lint 判定，`vuna check`
  是最终裁决（与现有 case 拆分边界一致）。
- **只做提升，不做 Bool 化简**：`if c then True else False` 在定义级会被提升成
  `f True = True` / `f False = False`，而不会化到 `f c = c`（后者需要作用域/名字解析，
  且对 `if c then False else True` 会自递归成 `not`）。语言惯例里「Bool 不做字面量搬运」
  仍适用于调用点；退化形态优先手写。
- **穷尽性 / 终止性依赖类型检查**：`dispatch-lift` 不做语法穷尽性证明；lint 的前提输入是
  通过 `vuna check` 的程序（DT 已强制 `case` 穷尽）。把 case 拆成多 clause 会改变 SCT 的
  分析形态；若某个递归函数拆分后 SCT 找不到下降环，应改进 SCT 或收窄规则，不能靠 lint 层
  豁免（CI 门禁要求零 finding）。
- **CI 门禁**：`nix/checks/vuna-lint.sh` 扫全部包源码
  （`find compiler/lib base/lib lib app -name '*.vuna'`），要求零 finding；脚本没有按规则
  或按文件的过滤豁免。
- `--fix` 产物保证可重新 parse；不保证 `vuna fmt` 幂等（部分既有语料的期望产物保留
  lift 的换行体形态）。新增 fix 语料按 fmt 规范形态设计并验证幂等。
- `dispatch-lift` 只处理顶层 DFun 的 clause 与 case alt 的直接体；instance 方法、
  `where` 绑定不参与 clause 级提升（`ELocalFun` / `EAnn` 只做遍历）。
- 规则不做类型 / 语义推理，只做语法可证的改写。