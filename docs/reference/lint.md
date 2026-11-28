# lint：AST 驱动的 dispatch 提升、列表/元组/Nat 字面量归一与自动修复

本文记录 `vuna lint` 的规则、可修复判据与语料。实现入口是
`packages/toolchain/lib/Vuna/Lint/Rules.vuna`（dispatch 判定、提升渲染、列表链与 `Pair` 应用检测、
源码切片）、
`packages/toolchain/lib/Vuna/Lint/Fix.vuna`（应用 Edit 的多轮循环）、`packages/toolchain/lib/Vuna/Lint.vuna`（CLI 与输出）、
`packages/toolchain/lib/Vuna/Lint/Config.vuna`（`vuna.toml [lint]`）、`packages/toolchain/lib/Vuna/Lint/Suppress.vuna`（源码抑制）、
`packages/toolchain/lib/Vuna/Lint/Diagnostics.vuna`（规则枚举：
code / rule / 消息的唯一真源）。

## 1. 用法与输出

```console
vuna lint [PATH]...                     # PATH 可为文件或目录；省略 = workspace 各包 lib/app
vuna lint --fix [PATH]...               # 逐轮应用可修复 finding，最多 --max-passes 轮
vuna lint --fix --dry-run [PATH]...     # 只报告会修复多少条，不写盘
vuna lint --fix --diff [PATH]...        # 打印 unified diff，不写盘
vuna lint --format json [PATH]...       # text（默认）| json | github | sarif
vuna lint -                             # 从 stdin 读一份源码
vuna lint --select list-literal --ignore dispatch-lift [PATH]...
vuna lint --max-warnings 0 [PATH]...    # warning 超限也 exit 1
vuna lint --list | --explain <RULE>
```

- 文本格式：`路径:行:列: [LN_xxx] rule-name: 消息`（列 1-based）；`--fix` 模式下不可修复的
  finding 追加 ` (not auto-fixable)`。LSP 用同一批 finding（含结束位置与 severity），见
  `packages/toolchain/lib/Vuna/Lsp/Diagnostics.vuna`。
- 退出码：0 = 无 error 且 warning 未超 `max-warnings`；1 = 有 error / warning 超限；2 = 用法、
  配置、读盘、解析或 fixity 上下文错误。error/warning 由规则配置决定。
- 目录会递归收集 `.vuna`（遵守 `.gitignore`，并跳过生成物 / corpus）；重复路径去重，顺序保持用户/目录顺序。
- `--fix` 原子写盘，只应用可安全修复的 finding（被替换行含注释 / tab / CR 时跳过），每轮
  复验后余下的 finding 照常报告。

## 1.1 配置（`vuna.toml` 的 `[lint]`）

编译器只把 `[lint]` 当 TOML 结构放行（`Frontend.Manifest` 不校验规则语义）；lint 消费时由
`Vuna.Lint.Config` 认领并校验，未知 key / 未知规则 / 非法 severity 报 `vuna.toml:行`。

```toml
[lint]
preset = "recommended"          # recommended | all | none
max-warnings = -1               # -1 = 不限；0 = 任何 warning 也失败
exclude = ["test/**", "examples/**"]

[lint.rules]
literal-if-chain = "error"      # off | warn | error
dispatch-lift = "error"
list-literal = "error"
pair-sugar = "error"
nat-literal = "error"
todo-marker = "off"              # 默认关闭；all 预设可开
redundant-if = "off"             # 默认关闭；all 预设可开
```

配置从文件所在目录向上收集 manifest：外层（workspace 根）先应用，内层覆盖；命令行
`--select` / `--ignore` / `--max-warnings` 最后覆盖。每个文件的配置只决定该文件的规则严重度
与 `exclude`；`max-warnings` 是**整次运行**的阈值，取运行根（cwd）的 manifest 链，不随文件
顺序或首个文件所在包变化。`--config PATH` 读显式文件的 `[lint]`，`--no-config` 使用默认
（recommended、全部 error）。改 `[lint]` 不改变 check/build 缓存（`manifestSemanticText`
不含它）。

## 1.2 源码抑制

只认注释里的 `vuna-lint:` 前缀（注释文本来自 lexer）：

```vuna
-- vuna-lint: disable-next-line literal-if-chain
probe x = if x == 1 then 1 else if x == 2 then 2 else 3

-- vuna-lint: disable list-literal
-- vuna-lint: enable list-literal
-- vuna-lint: ignore-file
```

规则名接受 kebab 短名或 `LN_` code；`disable` / `enable` 按行区间生效，`disable-line` /
`disable-next-line` 只作用于单行；未知规则是配置错误（exit 2）。抑制在 CLI 与 LSP 同一条
`lintSourceWithConfig` 路径上生效。

## 1.3 不做结果缓存

`vuna lint` 每次都重新跑规则：单文件 lint 的生产耗时与读回一份 finding 载荷是同一量级，
缓存是净损失且要多冻结一份 schema。finding 不落对象库，`--fix` 的每轮复验也直接重算。
workspace 整体读数见 [performance.md](performance.md)。

## 1.4 并行

父线程先按文件所在目录解析一次 `PackageContext`（最近的 `vuna.toml`，目录级缓存），再按
`contextDir` 把文件归到包组；每组按 `lintUnitFiles`（128）切块，块按源字节数（每个上下文
再加一份固定开销）用 LPT 装进 `min(parallelism, 8)` 个 worker。worker 内顺序处理自己那些块，
块间共享 fixity 模块图与配置缓存；模块图仍按 `contextDir` 缓存，fixity 声明表逐文件重算。
包被切成多块时每块各自加载一次模块图——块上限远大于常见包大小，只有超大包才会切开。

输出顺序按目标在输入里的位置恢复，与串行一致；重复路径先保序去重。`--fix` 的原子写按文件
独立；`--fix --diff` 只把修复前后文本带回父线程，由父线程按顺序调用 `diff -u`（不在 worker
里改进程级 cwd）。`-`（stdin）由父线程读一次后与其它结果按位置合并。worker 级宿主失败
（写盘 / 读盘竞态）汇总为工具错误（exit 2）。

`max-warnings` 仍是整次运行的阈值；每个文件的配置只决定该文件的规则严重度与 exclude。
静态分块的长尾保留（`Base.Thread.Par` 没有动态任务队列，见 gh#101）。

## 2. 实现模型

规则判定全部走 AST：`lintSourceWithConfig` 先 `parseSourceDetailed`（一次词法同时给出 AST、
注释表与 token 流），再按声明遍历 `Expr`（覆盖全部构造子，
含 `BindingValue` 的局部函数组；where / let 签名行由 `Binding.bindSig` 单独遍历），同时携带外层模式上下文（clause 模式列表或外层 case 的 alt
模式）。需要源码原文（字面量、表达式体）时按 `Span` / token 的字节偏移直接切片
（`exprText` / `spanText`），**不重新渲染 / 转义字符串字面量**；模式文本在 parser pattern
span 偏移不完整时回落到行/列路径（`patText`）。本文件可见 fixity 也吃同一次解析的
`SourceFile`（`lintParsedWithConfig` + `FixityEnv.fixitiesForParsed`；并行路径的上下文由父线程
预解析，worker 用 `FixityEnv.fixitiesForCtx`），不再为它二次语法分析。

切片右边界按「源码序严格在 span end 之后」找 token：普通 token 的 span end 是最后一个
token 的起点，模板字面量（`TTmpl`）的 span end 是字面量结束后的位置，两种都能取到正确的
下一个 token（这保证 `"(x ${s})"` 这类分支体不会被切成行尾）。

修复用行范围 `Edit start stop lines` 表示；`--fix` 每轮收集所有 Edit、按起点从后往前应用、
重新 parse 复验。候选按（行, 列）排序，被更大 Edit 行范围包含的内层 finding 会被丢弃
（避免同一链 / 同一次折叠产生互相冲突的 Edit）。

遍历相互递归组把 `fuel` 放在第 0 形参并 `if fuel <= 0` 守卫，这是编译器
`tryFuelThread` 判据能接受的形态。

`list-literal` 在 `walkExprGo` 的应用/变量位置与 dispatch 同趟检查（模板插值洞用
`allow=False` 跳过）；类型位置（签名、axiom/extern、data kind/构造子、record 字段、
trait 方法、instance 上下文/head/方法）仍由 `declFindings` 的 `walkTypeSyntax` 扫描。模板插值洞
（`EInterp` 的 `IPHole`）跳过：lint 的顶层 token 列表不含洞内 token，`exprText` 无法
可靠切片（已知边界，见 §6）。

`pair-sugar` 复用同一批遍历：表达式位置接在 `walkAppList`，类型位置接在 `walkTypeSyntax`，
模式位置由 `walkPairPat` 覆盖（clause 头、case alt、let 绑定、do 绑定、局部函数 clause 与
`handle` op 子句）；元素原文按表达式 / 模式的字节 span 切片（括号节点保留括号），避免把
紧邻的 `)` / `,` 卷进来。

`nat-literal` 也复用这两套遍历：表达式位置在 `walkAppList`，类型位置在 `walkTypeSyntax`，
模式位置在 `walkPairPat`（同一批 6 处接线）。只认裸名 `Zero` / `Succ`，闭合链只报最外层
（内层 `Succ Zero` 不再单独报告）；替换文本是 `strFromInt` 的十进制。模式改写依赖精化器把
Nat 字面量模式展开成构造子模式（[type-system.md](type-system.md)「依赖模式匹配与 case」），
因此 `1 => ...` 与 `Succ Zero => ...` 落在同一个模式矩阵。

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
let 值里的 if）需要上下文分发（case-of-case），会复制代码与求值结构，lint 不做，源码保持
原形。Bool 变量 if 提升不了时**不回退 case**：`if b then ...` 本身就是更紧凑的形态；
只有字面量 if 链提升不了时才回退成 case（`chainFindings`）。

规则按 dispatch 源划分：

| code | rule | 可修复 | 触发 |
| --- | --- | --- | --- |
| `LN_LiteralIfChain` | `literal-if-chain` | 是 | if dispatch（`x == lit` 链 / Bool 变量）在可提升位置；字面量链提升失败时改写为 case |
| `LN_DispatchLift` | `dispatch-lift` | 是 | case / let dispatch 在可提升位置（单 alt 替换、多 alt 拆 clause / alt） |
| `LN_ListLiteral` | `list-literal` | 是 | 表达式/类型位置的闭合 `::` 链（尾部是 `[]` 保留名，右嵌套）；**模式匹配不动** |
| `LN_PairSugar` | `pair-sugar` | 是 | 表达式/类型/模式位置的显式 `Pair a b` 应用（右嵌套链展平） |
| `LN_NatLiteral` | `nat-literal` | 是 | 表达式/类型/模式位置的闭合 `Zero` / `Succ` 链（`Succ k` 等开放链不动） |
| `LN_TodoMarker` | `todo-marker` | 否 | 注释里的 `TODO` / `FIXME` / `XXX`；默认关闭，`--select` / all 预设启用 |
| `LN_RedundantIf` | `redundant-if` | 是 | `if True/False then a else b` 的常量条件；默认关闭，`--select` / all 预设启用 |
| `LN_ClosedAdtCatchAll` | `closed-adt-catch-all` | 否 | case 的兜底分支代替了**同文件** `data` 族未写的构造子；默认关闭，`--select` / all 预设启用 |

dispatch 两条规则（`literal-if-chain` / `dispatch-lift`）共用同一套 lane 判定与 as-pattern
渲染，区别只在 dispatch 源（if 链 vs case / let）。`list-literal` / `pair-sugar` / `nat-literal`
与 dispatch 同趟遍历，但判据独立（不是 dispatch 提升），见 §3.3 / §3.4 / §3.5。

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

提升失败时的 case 回退（`chainFindings`）只在整行可替换时给出修复：链的各 then 分支收束
行片段，链尾（default 分支）**结束所在行**。链尾后还有外层 `else`
（`if a then <链> else b`）时该链不报告也不修复——整行替换会丢掉那个 `else`；这类链保持
原形，仍可由外层可提升的 shape 处理。

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

- **触发**：表达式或类型位置的**闭合 `::` 链**：`a :: b :: []`（`::` 走 `Loader.Fixity`
  的 alias，lint 看到 `EApp (EVar "::")`；尾部必须是列表字面量保留名 `[]`）。
- **不触发**：pattern（`PCon "::"` 不在表达式遍历内）、开放链 `a :: xs`（无法写成闭合
  字面量）、裸 `Nil` / `Cons`（普通构造子名，可能是用户 `data` 的构造子或别的族；与 Fmt
  同一口径，只从 parser 保留名识别语法糖）、已经是列表字面量的保留名、模板插值洞（见 §6）。
- **可修复判据**：整个表达式单行；被替换行无 `--` / `{-` / tab / CR；每个元素能由
  `exprText` 从源码切出。修复文本是 `[e1, e2, ...]` / `[]`，并剥离**紧邻**表达式的
  成对括号（`f (a :: [])` → `f [a]`；只剥紧邻成对的一层/多层，不跨表达式贪心）。
- **不可修复形态仍报告**（跨行、含注释 / tab），`--fix` 不写文件并在输出标
  ` (not auto-fixable)`。
- 语法等价性由「列表字面量按期望族展开」保证：`[..]` 与 `::` 链在 List / Vec / Row /
  用户同形族上落到同一组构造子。`::` 仍是源码运算符名，规则不做作用域解析：同名自定义
  `(::)` 由 `vuna check` 裁决。模式里的 `::` 保持原样。
- 一个已知边界：仓库里 `packages/compiler/lib/Vuna/Compiler/Frontend/Parser.vuna` 的 4 处
  `(name :: [])` 位于模板插值 `${...}` 内，规则跳过；这 4 处已手工改写为 `[name]`。
- 显式 `Cons` / `Nil` 不属于本规则：它们是普通构造子名，`--fix` 在没有期望类型时会按
  `Base.Data.List` 展开（换族）。语料中 `dt/67` / `dt_err/70` 的显式 `Cons`/`Nil` 与
  `dt_base/53` 的裸 `Nil` 因此不在 lint 报告范围内；corpus 也不在 `checks.vuna-lint` 门禁内。

### 3.4 `pair-sugar`

- **触发**：表达式 / 类型位置的显式 `Pair` 应用 `EApp (EVar "Pair") [a, b]`，以及模式位置的
  `PCon "Pair" [a, b]`（clause 头、case alt、let 绑定、do 绑定、局部函数 clause、`handle` op
  子句）。右嵌套链展平：`Pair a (Pair b c)` → `(a, b, c)`；左嵌套 `Pair (Pair a b) c` →
  `((a, b), c)`（内层由下一轮修复处理）。
- **不触发**：裸名 `Pair`（值传递 / 部分应用）、实参不是恰好两个、带模块前缀的名字
  （`Pair.Pair`）、记录字段模式 `Pair { first = a, second = b }`、元组语法本身、模板插值洞。
- **为什么等价**：元组语法由 parser 编成 `@vuna@tuple@pair` 保留名，`Loader.Resolve` 把它还原成
  与显式写法相同的 `Pair` 应用 / 构造子模式；改写只换语法，不改名字解析结果（`Pair` 在显式
  写法里可见，说明元组语法要求的作用域已经满足）。
- **可修复判据**：整个应用 / 模式单行；被替换行无 `--` / `{-` / tab / CR；每个元素能按 span
  切出原文。修复文本是 `(e1, e2, ...)`，并剥离**紧邻**的成对括号
  （`first (Pair a b)` → `first (a, b)`，不会写成双括号）。
- **不可修复形态仍报告**（跨行、含注释 / tab），`--fix` 不写文件并在输出标
  ` (not auto-fixable)`。
- 只按裸名 `Pair` 判定，不做作用域名字解析：同名函数 / 用户自定义 `Pair` 由 `vuna check`
  裁决。元组语法没有可对照的显式拼写（`@vuna@tuple@pair` 只由 parser 产生），所以这里
  保留裸名判定；`list-literal` 反过来只认保留名 `[]`，不认裸 `Nil` / `Cons`。

### 3.5 `nat-literal`

- **触发**：表达式 / 类型 / 模式位置的**闭合** Nat 构造子链：`Zero`、`Succ (Succ Zero)`；
  改写文本是按 `Succ` 层数的十进制字面量（`0` / `1` / `2` …），只报最外层。
- **不触发**：开放链 `Succ n` / `Succ (f x)`；带模块前缀的名字（`Nat.Zero`）；裸 `Succ`
  （值传递 / 部分应用）；注释（AST 遍历看不到）；模板插值洞。
- **为什么等价**：期望类型是 Nat 时字面量精化成同一个 `natLitTerm` 链
  （`Elab/Term/Impl`）；类型层字面量本来就是语言特性（`Vec 3 a`）。模式里的 Nat 字面量在
  模式解析阶段展开成 `Zero` / `Succ` 构造子模式，与手写链落同一个模式矩阵，穷尽性、
  可达性与匹配顺序都不变（见 [type-system.md](type-system.md)）。
- **可修复判据**：链单行；被替换行无 `--` / `{-` / tab / CR；切片走字节偏移并用末 token
  补全、剥离**紧邻**的成对括号（`TcErr (Succ Zero)` → `TcErr 1`、`f (Succ Zero)` →
  `f 1`、`x@(Succ Zero)` → `x@1`）。
- **不可修复形态仍报告**（跨行、含注释 / tab），`--fix` 不写文件并在输出标
  ` (not auto-fixable)`。
- **表达式推断位置**：没有期望类型时字面量仍按 `Int` 推断；只有期望类型是 Nat（或被
  Nat 上下文约束，如 `natToInt` 实参）时才与 `Succ Zero` 等价。规则只做语法归一，
  `vuna check` 是最终裁决。
- **已知边界**：单 clause 函数直接体里的可提升 `case`（`dispatch-lift` 会先给出整段编辑）
  在 `--select nat-literal` 下可能吞掉模式 finding（`dedupFindings` 在配置过滤之前，见 §6）；
  默认推荐配置的多轮 `--fix` 会先把 case 提升成 clause，再在下一轮改写成字面量。

### 3.6 `closed-adt-catch-all`

- **触发**：同一个文件里声明的 `data` 族，`case` 的显式 `PCon` 分支全属该族、但仍缺构造子，
  并且存在兜底分支（`_` 或裸变量）。finding 落在兜底分支上，消息列出缺失构造子。
- **不触发**：显式分支覆盖全族（即使保留兜底）；分支里出现非本地族的构造子；模式是
  字面量 / record（没有 `PCon`）；**一个显式 `PCon` 分支都没有**（兜底此时匹配的是别的
  类型，族名无从推断）；跨文件族（`List` / `Maybe` / `Bool` 等 canonical 族需要
  类型信息，lint 不做）。
- **为什么有用**：封闭 ADT 的遍历定义一旦用 `_` 兜底，新增构造子会静默降级；这条规则把
  「漏写构造子」变成可见 finding。默认关闭，遍历类代码用
  `--select closed-adt-catch-all` 或 `[lint] preset = "all"` 启用。
- **不做自动修复**：每个缺失分支应写什么体无法安全生成。
- **结构遍历**：走 `Frontend.AstWalk`（`foldExpr` / `foldDecl`），因此覆盖 trait 参数 kind、record update 字段与模板洞；**family 范围仍限同文件**。
- **已知边界**：只覆盖 `case` 分支形态；函数多子句的反射兜底（`f _ = …`）尚未覆盖。
  行级抑制 `-- vuna-lint: disable-next-line closed-adt-catch-all` 按兜底分支所在行生效。

## 4. 语料与测试

原生 suite 的 `lint` / `fix` family（`test/suite.toml`，kind `lint` / `fix`）：

- `packages/cli/test/corpus/lint/*.vuna` + `.out`：报告 golden 与退出码（01–04 为回归基线，05–14 覆盖
  dispatch 两条规则与「不报」形态；15–18 覆盖 Bool 变量 if 的 clause/alt 报告、不报形态与
  模板字符串分支；19 覆盖 `list-literal`：`::` 闭合链 / 类型位置报告，以及裸 `Nil` / `Cons`、
  pattern、开放链、注释行、既有字面量不误报；21 覆盖 `pair-sugar`：类型/值/模式、
  右嵌套展平、左嵌套多轮、部分应用与既有元组不报、注释/跨行报告但不可修复；
  22 覆盖 `nat-literal`：构造子结果类型、签名、clause / 嵌套 case 模式、表达式与裸 `Zero`，
  以及开放链、`Nat.Zero`、裸 `Succ`、注释/跨行不误报）。

`closed-adt-catch-all` 是 opt-in 规则，规则级回归在 `packages/toolchain/test/ClosedAdtCatchAll.vuna`
（部分覆盖 / 全覆盖 / 非构造子匹配 / 零显式构造子的兜底 / 缺一个构造子）；CLI 面在
`packages/cli/test/steps/39_lint_cli.steps`（`--select`、全覆盖零 finding、源码抑制）。
- `packages/cli/test/corpus/fix/*.vuna` + `.expected`：`--fix` 产物与二次运行幂等（01–06 回归基线，
  07–15 覆盖 dispatch 两条规则与 let 解构；16–19 覆盖 Bool if 的 clause/alt/链提升、
  as-pattern 与模板字符串分支；20 覆盖 `list-literal`：表达式/类型位置、括号剥离、
  裸 `Nil` / `Cons` 与用户同形族不修、注释行不修、幂等；21 覆盖 `pair-sugar`：类型/值/模式、右嵌套展平、
  左嵌套多轮、注释与跨行不修、幂等；22 覆盖 `nat-literal` 的类型/表达式/模式、
  `Zero`、as-pattern 括号剥离、注释与跨行不修、幂等）。
- `packages/cli/test/steps/39_lint_cli.steps`：`vuna.toml [lint]`、源码抑制、`--format json`
  （含结束位置与 fixable）、「未知规则只由 lint 认领、`vuna check` 仍通过」，以及
  `--select pair-sugar` 的报告 / `--fix` / 幂等 / 修完 `check` 通过。
- `nix/checks/vuna-lint.sh`：workspace 默认目标 + `--max-warnings 0`。

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
  `list-literal` 例外：不可修复的闭合 `::` 链仍报告（`--fix` 标 not auto-fixable），
  因为「应写成列表字面量」本身是确定的；`pair-sugar` / `nat-literal` 同样把跨行 / 含注释的
  应用 / 链报告为 not auto-fixable。
- **`list-literal` 的模板插值洞跳过**：lint 只拿到顶层 token 列表，`EInterp` 洞内 token
  不可见，切片右边界不可靠；formatter 同样不保留洞内注释（已知边界）。
- **`pair-sugar` 只认裸名 `Pair`**：带模块前缀的名字、记录字段模式、裸 `Pair`（值传递 /
  部分应用）与模板插值洞不处理；作用域语义由 `vuna check` 裁决。
- **`nat-literal` 只认裸名 `Zero` / `Succ` 的闭合链**：开放链（`Succ n`）、带模块前缀的
  名字与注释不报；表达式推断位置的字面量默认 `Int`，只有期望类型是 Nat 时才与构造子链
  等价，`vuna check` 是最终裁决。模式改写取决于精化器把 Nat 字面量模式展开成构造子模式
  （[type-system.md](type-system.md)）；单 clause 函数直接体里的可提升 `case` 会先被
  `dispatch-lift` 整段覆盖，`--select nat-literal` 下其中的模式 finding 可能被吞掉
  （`dedupFindings` 在配置过滤之前），默认推荐配置的多轮 `--fix` 会先提升再改写。
- **`closed-adt-catch-all` 只认同文件 `data` 族与 `case` 形态**：显式分支一个都没写的兜底
  不算命中（族名无从推断）；跨文件族、函数多子句的反射兜底（`f _ = …`）不在判据内；
  规则默认关闭，先用于遍历定义的定向检查。
- **提升只在直接体**：嵌套 dispatch 需要上下文分发，lint 不做；保持原形。
- **子句拆分只对单 clause 函数**：多 clause 函数里拆子句可能暴露 unreachable clause，
  因此 `if` / `case` 的 clause 拆分都要求 `countFunClauses == 1`；多 clause 函数的 Bool
  if 保持 `if`。alt 拆分 / 替换要求该 alt 是最后一个。拆出来的子句之间**不能有模式蕴含**
  （前一个 alt 的模式蕴含后一个时规则不动，否则会产出 `PS_ClauseShadowed` /
  `TC_ClauseUnreachable` 拒绝的源）。
- **签名含隐式 Pi 的函数跳过 clause 级改写**：`{n : Nat} -> ...` 这类隐式参数由精化器
  插入，把 dispatch 折叠进 clause 模式会改变模式矩阵与隐式 Pi 的对齐（`Base.Data.Vec.vhead`
  实测会把 `Cons` 错配到 `n : Nat`）；`literal-if-chain` / `dispatch-lift` 都跳过这类声明。
  `list-literal` / `pair-sugar` / `nat-literal` 不改变 clause 结构，因此这类函数的体仍会扫描。
- **Bool 名字解析**：Bool if 提升按源码名字生成 `True` / `False` 模式；vuna 包内它们就是
  canonical `Base.Data.Bool` 构造子。用户自定义同名构造子的极端情况不由 lint 判定，`vuna check`
  是最终裁决（与现有 case 拆分边界一致）。
- **只做提升，不做 Bool 化简**：`if c then True else False` 在定义级会被提升成
  `f True = True` / `f False = False`，而不会化到 `f c = c`（后者需要作用域/名字解析，
  且对 `if c then False else True` 会自递归成 `not`）。语言惯例里「Bool 不做字面量搬运」
  仍适用于调用点；退化形态优先手写。
- **穷尽性 / 终止性依赖类型检查**：`dispatch-lift` 不做语法穷尽性证明；lint 的前提输入是
  通过 `vuna check` 的程序（DT 已强制 `case` 穷尽）。把 case 拆成多 clause 会改变 SCT 的
  分析形态；若某个递归函数拆分后 SCT 找不到下降环，应改进 SCT 或收窄规则，不能靠 lint 层
  豁免（CI 门禁要求零 finding）。
- **CI 门禁**：`nix/checks/vuna-lint.sh` 执行 `vuna lint --max-warnings 0`，
  扫 workspace 各包的 lib/app，要求零 finding；配置来自根 `vuna.toml`，没有按文件的过滤豁免。
- `--fix` 产物保证可重新 parse；不保证 `vuna fmt` 幂等（部分既有语料的期望产物保留
  lift 的换行体形态）。新增 fix 语料按 fmt 规范形态设计并验证幂等。
- `dispatch-lift` 只处理顶层 DFun 的 clause 与 case alt 的直接体；instance 方法、
  `where` 绑定不参与 clause 级提升（局部函数组 `BClauses` 与 `Binding.bindSig` 只做遍历）。
- 规则不做类型 / 语义推理，只做语法可证的改写。