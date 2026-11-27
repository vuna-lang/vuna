# 诊断系统（Diagnostic）

本文是诊断系统的**唯一参考页**：数据模型、结果通道、位置契约、错误码域、渲染视图、
LSP 映射、错误码目录、测试与门禁。工具链命令语义（退出码、`vuna errors explain` 等）在
[tooling.md](tooling.md)；实现模块在 [compiler.md](compiler.md)。

## 1. 设计目标

1. 诊断从产生到消费都是**结构化值**（`Diagnostic`），字符串只在最终渲染器出现。
2. 位置只放在 `Label` 里（起止 span）；禁止在错误路径拼 `file:line:col`。
3. 每条用户可见诊断有**稳定错误码**、严重度、阶段、分类、机器可读字段。
4. 一个结果通道：`Vuna.Compiler.Base.Diag` 的 `Check a = OkC a | ErrC Diagnostic`。
5. 三个消费视图（CLI short/human、JSON、LSP）同源；任何下游都不反解析文本。

## 2. 数据模型

实现：`packages/compiler/lib/Vuna/Compiler/Base/Diag.vuna`（模型 + 结果通道）、
`packages/compiler/lib/Vuna/Compiler/Base/Source.vuna`（`Pos`/`Span`/路径工具）。

```text
Severity = SevError | SevWarning | SevNote | SevHelp
Phase    = Lex Parse Resolve Load Elab Unify Coverage Termination Usage
         | Codegen Package Driver Tool Internal
Category = Syntax Names Types Universes Coverage Termination Quantity Effects
         | Records Traits Codegen Package Tool Internal

Label      = { span : Maybe Span, text, style : Primary|Secondary|Context, provenance : Maybe Span }
DiagEdit   = { span, newText }
Suggestion = { title, applicability, edits }
Candidate  = { text, span, reason }
CallInfo   = { callee, arg, relation, span }
TraceFrame = { phase, text, span, children }
IceInfo    = { phase, function, invariant, fingerprint, hint }
NoSourceReason = Synthetic | ToolUsage | PackageGraph | Internal
Stability  = Stable | Volatile
Diagnostic = { id, severity, phase, category, code, message, labels, fields, trace,
               notes, suggestions, origin(Direct|Cascade), children, internal, ice,
               absent(Maybe NoSourceReason), stability }
```

- **位置**：行/列 1-based；列 = **UTF-8 字节**（与 lexer 的 `advanceChar` 一致）。
  LSP 适配器用 buffer 文本把字节列换算成 0-based UTF-16 code units。
- **无位置**必须显式：没有主 span 的诊断必须带 `absent` 理由（`Synthetic` 档，
  门禁要求逐码 allowlist）；一旦附加主 span，`withLabel` 自动清空 `absent`。
  `stability=Volatile` 的诊断（无源码位置/工具/包图）不允许作为输入摘要的纯函数落盘。
- **文本兼容层**：`diagText` 渲染 `file:line:col: [CODE] 消息`（short 视图），
  仍被部分工具用作字符串出口；新代码不得使用它构造/解析诊断。

## 3. 结果通道

- `Vuna.Compiler.Base.Common` 重导出 `Source` + `Diag`；`Err` 载荷是 `Diagnostic`。
- `Common.bind/step/traverse` 固定作用于 `Check`（`packages/compiler/lib/Vuna/Compiler/Base/Common.vuna`）；
  `OkC/ErrC` 构造子避免与 `Prelude` 的 `Base.Data.Result` 冲突。
- `Base.Data.Result`（字符串错误）只留给 `packages/base/` 标准库内部；compiler 与根工具链统一 `Check`。
- 构造函数：
  - `err : String -> Check a`：工具错误（phase = Tool，无码）；根工具链 CLI 错误用它。
  - `rawAt` / `rawNoLoc`：未分类的源码裸消息（新代码不要使用）。
  - `icFuel` / `icInternal`：编译器内部错误（phase = Internal，`diagInternal = True`）。
- **状态**：compiler 内裸 `err` 只剩 **10 处**，且都是
  工具/构建白名单（`CompilerCli`/`Compile`/`Dt`，exit 2、无源码 span）；
  源码与清单诊断全部走域码（TC_/CG_/RN_/PKG_/LD_/IC_）。`rawAt` 只剩 `Elab/Types.errAt` 的
  记录/派生兜底路径。

**前端位置**：Lexer 在字符游标处、Parser 在**产生点**用当前 token 的 span
构造 `LX_`/`PS_` 诊断（`lexErrAt` / `psErrAt`；路径由 `Loader.Flatten` 经
`withSpanFileIfEmpty` 注入）；Resolver 在 `EVar`/模式/限定名/类型表达式边界
`withFallbackSpan`，Loader 的导入点用 `Import.importSpan`。没有「首条解析诊断无位置」
的兼容特例，也没有 `attachParsePath` 的 context-label 兜底。确实无源码位置的码登记在
`nix/checks/data/diag-located.allow`（只减不增），由 `nix/checks/lib/diag-located.sh` 守住。

## 4. 错误码域

| 域 | 含义 | 真源 |
| --- | --- | --- |
| `LX_` | 词法 | `Base/Diagnostics/Frontend.vuna` |
| `PS_` | 语法 | 同上 |
| `RN_` | 名字解析（import/export/限定名/构造子）与内置宏展开（未知宏 / arity） | `Base/Diagnostics/Rn.vuna` |
| `PKG_` | `vuna.toml` 清单/包图 | `Base/Diagnostics/Pkg.vuna` |
| `LD_` | 模块/包加载 | `Base/Diagnostics/Loader.vuna` |
| `TC_` | 精化/覆盖性/终止性/用量 | `Base/Diagnostics/Tc.vuna` |
| `CG_` | codegen/驱动 | `Base/Diagnostics/Cg.vuna` |
| `IC_` | 编译器内部错误 | `Base/Diagnostics/Ic.vuna` |
| `UN_` | 告警（未使用/冗余/遮蔽），severity = warning | `Base/Diagnostics/Warning.vuna` |
| `LN_`/`FX_` | lint 规则/修复 | `packages/toolchain/lib/Vuna/Lint/Diagnostics.vuna` |

约定：符号语义稳定；一个码一种语义。**没有「诊断码只增不删」的约定**：vuna 未发布、
无兼容义务，删改码允许（同步目录、`explain` 与夹具）。`vuna errors explain CODE` 与
`vuna dev errors gen` 都从这些
枚举条目读取（不维护第二份列表）。

告警语义：`UN_ShadowedBinder` 只比较**运行时** binder（`Rig ≠ 0`）。`Rig0` 的隐式类型 /
索引 binder（`f : a -> a` 里自动量化的 `a`、实例方法签名里的 `a`/`b`/`c`、`{n : Nat}`）
由精化器在体前插成擦除 λ，源码里没有用户可见的外层 binder，因此 `f a = a`、`Applicative`
实例的 `\a => \b =>` 不误报；显式 `0 x` binder 与它们同等对待。`UN_UnusedDefinition`
只在入口路径检查（库包导出面未知，避免误报）。编译器生成的内部 binder（do 忽略 binder
命名 `_`、trait 字典字段 `_f<n>`）同样不参与 `UN_UnusedBinder` / `UN_ShadowedBinder`。
`UN_UnusedImport` 的判据是「这个 import 对本次检查单元有可见贡献」，任一条成立即算使用：
解析结果里实际引用的 canonical target（含重载构造子候选、do 链的 bind 目标）、重导出
（模块头 `module X` / `export module`，以及 `export import B (x, T(..))` 这类带 `B.` 前缀的
条目）、**fixity**（该模块声明的运算符在本模块源码里出现，或本模块自己声明了这个运算符——
fixity 表随 import 闭包传播，要留给下游）、以及**实例**（实例搜索发生在 Elab，loader 的
名字扫描看不到「加载实例」这件事，声明了实例的模块一律算已使用）。alias 归一到 import 名；
模板字符串降级合成的 `Base.Trait.Interp.interp` 不算使用。删除建议只在 import 独占一行时
给出 machine-applicable 编辑（同行还有别的 import / 声明时整行删除会连带删掉它们）。
warning 不写进 iface；check 结果缓存会带上 warning，但「干净模块复用」的运行可能不完整，
`-W` / `--deny-warnings` 因此强制本包模块重新精化以避免漏报（见
[tooling.md](tooling.md) 退出码一节）。

binder 类诊断（`UN_UnusedBinder` / `UN_ShadowedBinder` / `TC_LinearUnused` /
`TC_LinearOverused` / `TC_ErasedBinderUsed`）的位置是 **binder 名本身**：Core `Term` 的
`TLam` 与 `CaseAlt` 的 `Binder` 带名字 span，定义参数 / λ 参数 / `let` binder / case 字段 /
do-binder 都由精化时填入。改名建议的编辑 span 也必须恰好覆盖名字（长度 = 名字字节数），
否则不给 machine-applicable 编辑；合成 binder（字典、η、derive、handle 降级）用
`spanEmpty`，诊断回落到定义级位置且不提供编辑。

warning 的**通道**没有进程内全局收集器：Elab 期 `warnAt*`
（`Elab/Usage.vuna`）把诊断追加进显式状态 `Ec.ecWarnings`，精化出口挂到
`DtProgram.dtProgWarnings`；loader 的 unused-import（`Loader/Flatten.vuna` 的
`unusedImportWarnings`）与入口路径的 `UN_UnusedDefinition`（`Driver/Dt.vuna`）直接返回
诊断列表。驱动层把三者按 loader → elab → unused-def 的顺序拼成
`CheckedPackage.checkedWarnings` / check 入口的返回值；`-W` / `--deny-warnings` / LSP
在输出前用 `Base/Diagnostics/Sink.vuna` 的 `dedupeWarnings` 去重（按首次出现顺序）。
解析恢复期的多条 `PS_` 诊断由 `Parser.parseSourceRecovering` 显式返回，加载器把它们挂到
首条错误的 `Diagnostic.diagChildren` 上（批量错误通道），CLI 逐个输出——两者都不依赖
跨调用保留的可变状态。

## 5. 渲染视图

实现：`packages/compiler/lib/Vuna/Compiler/Base/Diag/Format.vuna`。

| 视图 | 入口 | 形态 |
| --- | --- | --- |
| short | `renderShort` / `diagText` | `file:line:col: [CODE] 消息`（编辑器/grep/管道默认）；CLI 片段由 `renderShortSnippetEff` 从 label 结构化追加 |
| human | `renderHuman` | 交互终端默认：首行 + 主/相关 label 片段（context 标签输出 `= in ...`）+ note/建议/目录说明 |
| github | `renderGithub` | GitHub Actions workflow annotation：`::error file=…,line=…,col=…::[CODE] 消息`（按行流式，工作区多包可混排；`%`/CR/LF 转义） |
| human | `renderHuman` | `error[CODE]: 消息` + `--> file:line:col` + 源码行 + 插入符 + notes |
| JSON | `renderJsonList` | `{version,tool,diagnostics[]}`，含 labels/fields/trace/notes/suggestions/origin/internal/ice |
| SARIF | `renderSarif` | SARIF 2.1.0 单 run：ruleId/level/message/locations/relatedLocations |

CLI 开关：`--error-format=short|human|json|sarif|github`、`--with-sources`（JSON 附源文件内容摘要）、`--json`、`--message-format=...`、`--lang en|zh`（zh 时 human 消息本地化）、`--continue-on-error`（elab 单遍逐定义恢复，仅**入口文件**与库包；签名/data/trait/实例头错误仍是硬错误；级联默认折叠，`--show-cascade` 显示；`--fail-fast` 只显示首条；带 `module` 头的库模块单文件检查只报首错）；包级 check
会把格式、`--lang`、`--max-errors` 透传给成员包子进程；成员包错误带 `[包名]` 前缀。
**源身份**：`--json --with-sources` 在顶层追加 `"sources"`，每项含 `file` / `package`（最近祖先 `vuna.toml` 的包名）/ `module`（`lib|app` 前缀 + `.vuna` 去掉后按 `/` → `.`）/ `relPath`（包相对路径）/ `digest`（内容摘要）。用于跨 checkout/缓存复用时定位同一份内容；不带该 flag 时输出与既有 `.diag.json` 契约逐字节一致。

**机器格式单文档**：`--error-format=json|sarif` 的工作区检查在父进程内逐包收集诊断，
stdout 恰好输出一份文档（成员子进程不各打一份）；成员 manifest 的 `[diagnostics]`
不能覆盖命令行显式格式。

`vuna check <file.vuna>` 支持两类文件：无 `module` 头的入口文件（按入口语义，含
`--continue-on-error` 恢复）；带 `module` 头的库模块（按 `Pkg.contextForFile` 的包上下文
单模块精化，与编辑器打开该文件同一条链，告警只报本文件；包入口文件仍按入口报
`LD_ModuleHeaderInEntryFile`，与包级 check 一致）。

JSON 字段是机器契约：`code/severity/phase/category/message/labels[]/fields[]`；
`fields` 当前包含 `expected`/`found`（类型不匹配/解析期望）、`name`/`candidates`（覆盖性缺失构造子）、`effect`（未处理效应）、`note`（洞目标/元变量归属）、`call`/`quantity`/
`effect`/`module`/`span`/`note` 的构造器。

## 5.1 配置（`vuna.toml [diagnostics]`）

可选 section；命令行显式 flag 优先：

| key | 值 | 语义 |
| --- | --- | --- |
| `format` | `short`/`human`/`json`/`sarif`/`github` | 默认渲染格式（等价 `--error-format`）；未显式指定时按消费端选：TTY → `human`，管道/CI → `short`（`lang=zh` 时 human） |
| `warnings` | bool | 是否默认显示 `UN_` 告警（等价 `-W`；`--deny-warnings` 仍提升退出码） |
| `max-errors` | 正整数 | 一次检查最多显示/序列化多少条诊断（缺省 20；0 = 不限） |
| `lang` | `en`/`zh` | human 视图语言；`zh` 追加目录中文说明并默认切 human（命令行 `--lang` 优先） |
| 缓存 | — | 整个 `[diagnostics]` section 是**纯显示配置**，不进 check/build 的语义身份：改它不触发重编译 |
| `deny-warnings` | bool | 等价 `--deny-warnings`：warning 提升为失败（命令行显式 flag 优先；为 true 时同时显示 warning） |

非法值是该清单的结构诊断（`PKG_InvalidDiagFormat` / `PKG_InvalidDiagMaxErrors`）；未知 key 报 `PKG_UnknownKey`。

## 6. LSP 映射

实现：`packages/toolchain/lib/Vuna/Lsp/Diagnostics.vuna`。

- 直接消费 `Diagnostic`：不从文本扫位置；依赖文件诊断按 span 文件过滤。
- range 用完整 span（起止），UTF-16 换算；无位置诊断落到 0:0。
- 所有错误都发布（编译器 + lint 合并）；lint `Finding` 转成同一 `Diagnostic`；`UN_UnusedImport` 在 LSP 增量路径不回放（编辑器侧使用集未重算，避免误报；CLI 仍报告）。
- `relatedInformation` 来自 secondary/context 标签；`data` 来自 `diagFields`；
  `code` 直接给客户端；消息追加 notes/suggestions。
- lint quick fix 的内嵌诊断与发布诊断字段集合一致；诊断自带 `suggestions`（如未使用 binder/定义）也生成 quick fix CodeAction（应用其 `DiagEdit`）。
- **pull**：`textDocument/diagnostic` 回 `{kind:"full", items:[...]}`（与 push 同一诊断链/JSON 字段），initialize 声明 `diagnosticProvider`。
- **push / pull 二选一**：客户端在 `initialize` 声明 `capabilities.textDocument.diagnostic`
  时服务器只走 pull（不发 `publishDiagnostics`），否则走 push。两套同时用会让
  vscode-languageclient 的 push / pull 诊断集合各显示一份同一诊断（Problems 面板重复）。

## 7. 退出码

| 码 | 含义 |
| --- | --- |
| 0 | 成功 |
| 1 | 源码诊断错误 |
| 2 | 用法/工具错误；内部编译器错误（ICE） |
| 70 | 内部编译器错误（ICE）：`diagInternal = True` 的诊断；输出仍带 `internal compiler error`/ICE 载荷 |

## 8. 测试与门禁

- `packages/cli/test/corpus/lsp/smoke.sh`：结构化诊断 smoke（0-based range、UTF-16、全部诊断、
  quick fix、relatedInformation）。
- `nix/checks/lib/diag-raw.sh`：compiler 内源码/清单诊断不得走裸 `err`（工具/构建白名单：`CompilerCli`/`Compile`/`Dt`），
  `showSpanLoc` 只能出现在渲染器/目标消息组装处。
- 负例夹具双轨：320 个 `.diag.json` 结构化期望（`--json` 聚合文档，`--bless-diag` 生成）
  与 `.err` 首行片段断言并存；`--bless-diag` 在 runner 内写盘（worker 透传）。
- `nix/checks/lib/diag-located.sh`：结构化诊断必须有主 span，或带显式 `absent` 理由并逐码
  登记在 `nix/checks/data/diag-located.allow`（只减不增）；当前 320/324 有位置，4 条按码登记（3 package-graph + 1 synthetic）。
- `nix/checks/lib/diag-coverage.sh`：目录码 vs 结构化夹具覆盖门禁（allowlist 记录缺口、
  基线 `nix/checks/data/diag-coverage.min` 防回退；当前 191/242，缺口在 allowlist 且必须于 `nix/checks/data/diag-unreachable.txt` 登记不可达原因）。
- `vuna check .`、全量 suite、`nix build .#vuna-seed` 必须通过。

## 9. 能力现状

| 能力 | 现状 |
| --- | --- |
| 三通道（源码/工具/内部） | phase Tool/Internal + ICE 信息 |
| `Diagnostic` 全字段 | severity/phase/category/label/field/trace/ICE 全在模型里 |
| 位置契约（end span、UTF-16、显式 NoLoc） | Core `TVar` 带源 span 供 QTT 使用点；合成/内部项无源位置时显式 NoLoc |
| 码域（RN_/PKG_ 独立域、无死码） | `RN_` / `PKG_` 各自独立域；无发射点的死码已清理；码数以枚举真源与 `gen-errors` 产物为准 |
| 目录单一真源 + 生成枚举/文档 | 枚举构造子锁定码/arity；描述/中文/示例表与枚举同模块维护并由 `gen-errors` 生成 `errors.md`+`errors.json`（含 example）；`explain` 同源；LSP data 附 `catalog` 提示 |
| 渲染/LSP/CLI | short/human/JSON/SARIF + LSP push/pull + `[diagnostics]` 配置；human 视图展示 fields/trace/suggestions（与 JSON 同源）；SARIF rules 带目录 shortDescription/help/defaultConfiguration/tags；i18n（`--lang zh` 与 `[diagnostics] lang` 的 human 消息本地化 + `= message:` 英文原文；机器 JSON 保留英文 `message` 并附 `localizedMessage`） |
| 多错误 + Cascade | 默认上限 20；级联默认折叠，`--show-cascade` 显示；parser 顶层 resync；elab `--continue-on-error`：单遍精化，失败的定义体/实例体回滚后跳过（丢弃它创建的元变量与解），错误按源序收集、条数只受 `--max-errors` 约束；不再重跑整程序，也不再有「移除声明后的级联」；`--max-errors` 同时约束恢复结果 |
| warnings（未使用/冗余/不可达/跨目标能力） | `UN_UnusedBinder`/`UN_ShadowedBinder`/`UN_RedundantCtorBranch`/`UN_RedundantLiteralBranch`/`UN_BranchAfterCatchAll`/`UN_UnusedImport`（限定/别名/open import/`module X` 重导出统一追踪）/`UN_UnusedDefinition`；`-W`/`--deny-warnings` 已接且绕过 check 缓存/干净模块复用以保证不漏报。`UN_TargetEffectUnavailable` 在 `build`/`compile` 的入口行检查里发出（目标不实现该内建效应，执行到叶子会 trap；见 [wasm.md](wasm.md) §8） |
| 建议引擎 + Fix | `Candidate`/`Suggestion` 模型；所有可安全自动修复的 warning 附 machine-applicable 编辑（unused binder/definition/import、冗余构造子/字面量分支、catch-all 后分支）；LSP codeAction 应用诊断 suggestions，`packages/cli/test/corpus/lsp/quickfix.sh` 集成测试 |
| 类型不匹配 expected/found | fields expected/found + PhUnify trace 帧；期望类型无源 span，以 fields 而非双端 label 表达 |
| 实例搜索 trace | `TC_NoInstanceFound` 附失败目标族桶的候选实例 `fields.candidates`，每个候选带 instance 声明 span 与拒绝原因「实例头 vs 目标」；递归深度预算（实例 ctx 链）耗尽改报 `TC_InstanceSearchExhausted`，不落到缺实例 |
| 终止性 call matrix | `TC_CannotProveTermination` 附 `fields.call` 边：callee、被测形参位置（`arg`）、关系（`relation`：严格子项 / 守卫减法 / 缺非负证明 / 升序计数器 / 无尺寸来源 / 关系落在别的形参 / 无关系）、调用点 span；human 行尾显示文件:行号。SCT 失败在 message 后缀给出幂等图，闭包放弃时后缀改为「闭包未收敛 + 上限」；存在盲调用（callee 以值传递 / 遍历预算耗尽）时再追加「未识别调用」名单 |
| 覆盖性缺失构造子标签 | 缺失构造子进 `fields.candidates`，每个候选带构造子声明 `span`；JSON/SARIF/LSP（含 diag fields 的 candidates.span）可跳转 |
| QTT 使用点 | Core `TVar` 携带源 span；线性/擦除错误附 `fields.quantity`：name/declared/observed，并逐使用点附 `fields.span name=use`；内部合成变量无源位置时不附 |
| 文案规范/门禁 | `nix/checks/lib/diag-style.sh`：句号/大小写/空白/占位符；专有名词例外逐码 allowlist |
| explanation/example/`explain` | `explain` 文本/`--json`/`--list --json`，含模板/中文说明/severity/phase/category/example；元变量/洞带 `name`/note 与洞目标 span；`Elab/MetaSpans` 登记创建点，洞与可延迟字典元变量附 `fields.span name=created`，纯合成 meta 无源位置时不伪造 |
| 效果行 | `TC_UnhandledEffects` fields 含 expected/actual 行 + 每个未处理 effect 单独一条 `unhandled:` 行 |
| 入口行实例名 | `TC_EntryInstanceNotDefault`：`main` 行里的内建宿主效应用了非 `default` 的显式实例（如 `ConsoleOp@mock`）即编译期拒绝——entry 只预装默认实例的 handler |
| 结构化夹具 + 每码覆盖门禁 | 383 个 `.diag.json`；覆盖门禁 218/280，62 个缺口 allowlist 且逐码在 `nix/checks/data/diag-unreachable.txt` 审计 |
| 位置门禁 | `nix/checks/lib/diag-located.sh`：无 span 必须带 `absent` 理由并逐码登记；当前 320/324 有位置，剩余 3 package-graph + 1 internal；parser/resolver/loader/elab 用户面码均有位置 |
| 无源码位置显式化 | `NoSourceReason`（synthetic/tool-usage/package-graph/internal）/`Stability` 模型字段；JSON 仅在无位置时输出 `absent`；剩余无位置码逐码登记在 `nix/checks/data/diag-located.allow`，门禁要求「无 span 必须带理由」 |
| SourceRef | `--json --with-sources` 顶层 `sources`：file/digest/package/module/relPath；默认 JSON 契约不变 |

## 10. 已知缺口

- `rawAt` / `rawNoLoc` 仍是未分类的源码裸消息出口（只剩 `Elab/Types.errAt` 的兜底路径）。
- 目录元数据：部分条目未带 severity/phase/category/explanation/example；仍有码没有结构化夹具
  （缺口在 allowlist，逐码登记在 `nix/checks/data/diag-unreachable.txt`）。
- `fields` 的构造器按语义族填充，尚未覆盖全部诊断族。

## 11. 边界

- 列单位是 UTF-8 字节（不是码点）；渲染宽字符按字节/显示字符混合处理，LSP 边界换算
  UTF-16。
- `packages/base/` 标准库仍用 `Base.Data.Result`（字符串错误）；不要把 `Check` 扩散进 base。
- 消息模板为英文（机器格式稳定）；`--lang zh` / `[diagnostics].lang` 的 human 视图用目录中文说明替代消息，并附 `= message: <英文原文>`。