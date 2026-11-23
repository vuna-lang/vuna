---
name: lint-rule
description: 在 vuna 仓库新增或修改 `vuna lint` 规则（含自动修复）时使用——规则元数据登记、AST 遍历接线、span 切片与 Edit 生成、corpus/steps 测试、文档落点、逐规则验证，以及把规则提升进 recommended 时的一次性全仓迁移与 seed 轮换。开始写 lint 规则、加自动修复、或规则要改默认预设时加载。
---

# 给 vuna 加一条 lint 规则

一条规则 = **元数据**（`Lint/Diagnostics.vuna`）+ **检测与渲染**（`Lint/Rules.vuna`）+
**测试夹具** + **文档**。自动修复复用 `Lint/Fix.vuna` 的行范围应用循环，通常不用改它。

## 0. 三个真源（先读这三处，不要通读全仓）

| 内容 | 位置 |
| --- | --- |
| 机制、可修复判据、既有规则边界 | [docs/reference/lint.md](../../../docs/reference/lint.md)（§2 实现模型、§3 规则） |
| 规则枚举 / code / 消息 / 修复描述 | `packages/toolchain/lib/Vuna/Lint/Diagnostics.vuna` |
| 检测、源码切片、Edit 生成 | `packages/toolchain/lib/Vuna/Lint/Rules.vuna` |

lint 属于 `packages/toolchain`（**不进 seed**）；改它不影响自举链，也不需要 rotate。

## 1. 先定性：规则属于哪一类

| 类型 | 形态 | 接线位置 | 例子 |
| --- | --- | --- | --- |
| dispatch 提升 | `if` / `case` / `let` 分派折进外层模式 | `scanBodyPos` / `Lane` / `liftFindings` | `literal-if-chain`、`dispatch-lift` |
| 语法归一 | 某种写法改写成等价写法 | `walkExprGo`（表达式）+ `walkTypeSyntax*`（类型）+ 模式 walker | `list-literal`、`pair-sugar` |

语法归一型规则**不改 clause 结构**，因此不受「隐式 Pi 签名的函数跳过 clause 级改写」限制，
但要注意下面第 3 节的接线缺口。

## 2. 元数据登记（`Diagnostics.vuna`，一次性改 12 处）

按现有规则的顺序补：

1. `LintRule` 构造子；
2. `lintCode`（`LN_` + 驼峰，文档与 `errors list` 的键）；
3. `lintRule`（kebab 短名，CLI 输出用）；
4. `lintRuleCode`（`LN_` 反查短名）；
5. `lintMsg`（模板，参数由调用方拼好；英文小写、无句号）；
6. `lintEdit`（修复动作描述，`--explain` 用）；
7. `lintDesc`（一句话说明，文档/`--list` 用）；
8. `lintFixable`（`True` 会自动派生 `FX_` 码，由 gen-errors 生成，**不要手写**）；
9. `lintDefaultSeverity`（一般 `LintWarn`）；
10. `lintAllRules`；
11. `lintRecommended`；
12. `lintAll` 的 `LintEntry`。

`--list` / `--explain` / JSON / SARIF / github 输出都从 `lintAll` 派生，**不改输出层**。

**默认开关二选一：**

- **进 recommended**（`lintRecommended = True`）：`checks.vuna-lint` 会对全部包的 lib/app 跑
  `--max-warnings 0`，所以**仓库必须先迁移干净**（见 §8）。
- **opt-in**（`False`）：按 `todo-marker` / `redundant-if` 的先例，测试走
  `steps/39_lint_cli.steps` 的 `--select`，并在 `39_lint_cli.diagcodes` 登记 `LN_` 码——
  `diag-coverage` 门禁要求每个码在 corpus `.out` 或 `.diagcodes` 里出现。

## 3. 检测与遍历接线

三类入口，缺一就会漏报：

1. **表达式位置**：`walkExprGo` / `walkAppList`（模板插值洞传 `allow=False`，不应报告）；
2. **类型位置**：`walkTypeSyntax*`（签名、axiom/extern、data kind/构造子、record 字段、trait
   方法、instance 上下文/head/方法）；表达式与类型共用 `Expr` AST，但走不同遍历；
3. **模式位置**：没有现成 walker，按需新增（`walkPairPat*` 是模板），挂到 6 处：
   `declFindings` 的 clause 头、`walkAlts`（case alt）、`walkBinds`（let）、`walkStmt` 的
   `DBind`（do）、`walkLocalClauses`（局部函数 clause）、`walkHandleAlts`（`handle` op 子句）。

实测注意：

- `ELam` 的参数是 `List (Pair String Span)`——只有名字没有模式，**不要**给它接 pattern walker；
- `scanBodyPos` 在产生 lift finding 时**不再下降**，且 `dedupFindings` 发生在配置过滤之前：
  `--select <rule>` 时，位于可 lift 的 case/let 体内的 finding 可能被别的规则的 edit 吞掉。
  这是既有行为；验证时要意识到，或接受为已知边界（`list-literal` 同款）；
- 隐式 Pi 签名的函数：`declFindings` 需要单独扫描函数体（否则整段跳过）。结构不变的规则可以
  在体上只保留本规则的 finding（`onlyPairFindings` 是模板），不要顺手放开 dispatch 类改写；
- 相互递归组把 `fuel` 放第 0 形参、`if fuel <= 0` 守卫；这是 `tryFuelThread` 判据要求的形态。

## 4. 切片与 Edit（最容易翻车的地方）

机制是 `Edit editStart editEnd editLines`（1 基行范围整体替换）。`Fix.applyEditList` 从后往前
应用且**同一行每轮只应用一个**；`fixLoop` 每次调用最多 8 轮，所以一行上叠多个 fix 要重复跑
几次 `--fix`。

踩过的坑（每条都实际出现过）：

| 现象 | 原因与处理 |
| --- | --- |
| 切片少一个字符（`""` → `"`、`[]` → `[`） | 空字符串 / 空列表字面量的 span 末尾可能短一位；用 `tokenEndCovering (raw - 1) src.lintSrcToks` 把末 token 补全 |
| 切片多一个 `)` 或 `,` | `exprText` / `spanTextLine` 会把紧贴的下一个 token 卷进来；用 `widenStart` / `widenEnd`（括号净差）补回，方括号另需 `widenBracketEnd` |
| 起点从运算符开始 | 中缀表达式的 span 从运算符起；起点用 `exprStartLine/Col`（`startExpr`），不要用 `spanStartOffset` |
| 取不到括号 | `lintParsedWithConfig` 会先 `reorderProgram`，AST 里**没有** `EInfix`，括号也不在 AST 里；切片只能按 token 净差重建 |
| 非 ASCII 行修完语法错 | `prefixBeforeCol` / `tailFromCol` 用**字符**列，`Span` 列是 **UTF-8 字节**；这类行用字节偏移切片（`offsetOfLineCol` + `sliceOffsets`） |
| 明明可修却标 not auto-fixable | `hasComment` 把字符串里的 `--` 也当注释；含 `--` / `{-` / tab / CR 的行只报告 |
| 元组/自带括号的模式被写成 `((a, b))` | `patNeedsParen` 要认识自带括号的语法（元组），否则 `asPatText` / clause 参数位置多包一层 |
| `parse failed after fix` | `applyFixes` 解析复验失败会**整体拒绝写回**；按报错行列回到切片逻辑，不要绕过 |

其余约定：多行 / 含注释只报告、消息里用 `(...)` 占位；`stripParens` 只剥**紧邻**的成对括号；
finding 的位置用子树真实起点（`mkFindingAt`）。

## 5. 测试

| 夹具 | 何时 | 生成/断言方式 |
| --- | --- | --- |
| `packages/cli/test/corpus/lint/NN_*.vuna` + `.out` | 规则默认开启，或想锁报告形态 | runner 用默认配置跑 in-process lint，逐字比对 `.out`；`.out` 可用 `nix run .#vuna -- lint --no-config <file> \| sed 's#packages/cli/test/##'` 生成（runner 与 CLI 共用 `renderFinding`，路径前缀是 `packages/cli/test/`） |
| `packages/cli/test/corpus/fix/NN_*.vuna` + `.expected` | 自动修复 | runner 跑两遍：第一遍等于 `.expected`，第二遍无改动（幂等）。`--select` 单规则修复不适用这里（runner 用默认配置） |
| `packages/cli/test/steps/39_lint_cli.steps` | 规则默认关闭，或要测 CLI 面 | `--select <rule>` 报告 → `--fix` → 再 lint 为 0 → `check` 通过 |
| `39_lint_cli.diagcodes` | 默认关闭且没有 corpus `.out` | 每个 `LN_` 码必须至少有一个夹具，否则 `diag-coverage` 失败 |

语料约定：文件可以没有 `module` 头（lint 只 parse，不做类型检查）；`.out` 的行列必须精确；
`--no-config` 用来绕过根 `vuna.toml` 的 `exclude`（`packages/*/test/**`、`examples/**`）。

## 6. 文档落点

- `docs/reference/lint.md`：§1.1 配置样例、§2 实现模型（遍历函数名）、§3 规则表加一行、
  新增 `### 3.x <rule>`（触发 / 不触发 / 为什么等价 / 可修复判据 / 不可修复形态）、§4 语料清单、§6 边界；
- `docs/reference/frontend-syntax.md` §9（Lint 条目）；
- `docs/reference/testing.md`（lint/fix family 的规则与语料说明）。

机制细节只写在 `lint.md`，技能与规则说明不要复制第二份。

## 7. 逐规则验证清单

```console
# 1) 手测：报告形态与修复结果
nix run .#vuna -- lint --select <rule> <probe.vuna>
nix run .#vuna -- lint --select <rule> --fix <probe.vuna>   # 再跑一次确认 0

# 2) 门禁（改动面：工具链 + 夹具 + 文档）
nix run .#vuna -- lint --max-warnings 0
nix run .#vuna -- check .
nix run .#vuna -- fmt --check

# 3) 语料（--only 按 owner/family；case id 形如 cli/lint/21_pair_sugar）
nix run .#vuna -- dev suite packages/cli/test/suite.toml --only cli/lint
nix run .#vuna -- dev suite packages/cli/test/suite.toml --only cli/fix
nix run .#vuna -- dev suite packages/cli/test/suite.toml --only cli --filter 39_lint_cli
```

改了规则逻辑后第一次 `nix run` 会重建 toolchain，慢是正常的；反复手测用
`nix build .#vuna --out-link result` 固定二进制。

## 8. 提升进 recommended 的迁移剧本

规则先以 opt-in 落地，测试/文档齐全后再翻转默认；翻转前必须让仓库零 finding。

```console
# 1) 迁移：显式路径 + --select；--no-config 用于 examples/ 或 test/ 这类被 exclude 的目标
nix run .#vuna -- lint --fix --select <rule> packages/base packages/compiler-base packages/ir \
  packages/target-ocaml packages/compiler
nix run .#vuna -- lint --fix --select <rule> packages/toolchain packages/dev packages/target-native \
  packages/target-wasm packages/http packages/web packages/plugin-kit packages/cli packages/web-cli packages/plugin-web
nix run .#vuna -- lint --no-config --fix --select <rule> examples
```

要点：

1. **重复调用到 `fixed 0`**：一次调用 8 轮、同一行每轮一条，嵌套/叠行要再跑；
2. **`fmt` 之后再跑一轮**：fmt 会把跨行应用折成单行，可能变成可修复；
3. 剩余 `(not auto-fixable)` 按形状处理：`Rule\n e1\n e2` 脚本合并成 `(e1, e2)`（各剥一层外层
   括号），`Rule x (\n case … \n)` 手工改成 `let` 绑定或 tuple + 多行 case，字符串含 `--`/注释行手工；
4. **残余人工审**：`grep -rn '\b<Rule>\b' packages/*/lib packages/*/app`，只允许
   import / 注释 / 字符串字面量 / 裸构造子（值传递、部分应用）；
5. `nix run .#vuna -- check .` 验证语义（两种写法在 Loader 里落到同一 AST，但仍要跑）；
6. 翻转 `lintRecommended`，把语料 fixture 改成新写法（fix 语料的 `.expected` 要同步），
   新增 `lint/ fix/` 的 2 个 case，更新文档配置样例。

改了 seed 闭包（base / compiler-base / ir / target-ocaml / compiler）之后：

```console
nix build .#vuna --out-link result
sh nix/seed/rotate.sh ./result/bin/vuna      # 内部校验 fixed point
nix build .#vuna-seed                        # 旧种子能编译新源码（bootstrap 不变量）
VUNA_SKIP_HOOKS=1 git commit -m 'chore(seed): 轮换 seed'   # 独立提交
```

## 9. 已知坑速查

- `dedupFindings` 在配置过滤之前：`--select <rule>` 可能被其他规则的 edit 吞 finding（见 §3）；
- `hasComment` 是子串判断，字符串里的 `--` 也会阻止修复；
- `Span` 的 end 是开区间，但个别空 token 形态会短一位；一律用「末 token 覆盖」+「净差补回」；
- `fixLoop` 每次调用 8 轮，不是无限；报告里的 `not auto-fixable` 可能是轮数用尽或多行；
- 规则进 recommended 之前不要顺手改 `vuna.toml` 的 `[lint]` 去掩盖 finding；
- `diag-coverage` / `diag-style` 会检查新码：消息首字符小写、无句号、无首尾空白；
- 语料 runner 与 `--select` 用的是不同配置（默认 vs 只选一条），两边都要有覆盖或明确取舍。