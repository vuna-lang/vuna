# 诊断系统（Diagnostic）

本文是诊断系统的**唯一参考页**：数据模型、结果通道、位置契约、错误码域、渲染视图、
LSP 映射、错误码目录、测试与迁移状态。工具链命令语义（退出码、`vuna explain` 等）在
[tooling.md](tooling.md)；实现模块在 [compiler.md](compiler.md)。

> 当前处于**诊断重设计迁移中**：结构化通道与三个渲染视图已落地；错误码分类、
> warnings、多错误累积、目录元数据生成仍在推进。每一节的「状态」标注了已落地/待办。

## 1. 设计目标

1. 诊断从产生到消费都是**结构化值**（`Diagnostic`），字符串只在最终渲染器出现。
2. 位置只放在 `Label` 里（起止 span）；禁止在错误路径拼 `file:line:col`。
3. 每条用户可见诊断有**稳定错误码**、严重度、阶段、分类、机器可读字段。
4. 一个结果通道：`Vuna.Compiler.Diag` 的 `Check a = OkC a | ErrC Diagnostic`。
5. 三个消费视图（CLI short/human、JSON、LSP）同源；任何下游不再反解析文本。

## 2. 数据模型

实现：`compiler/lib/Vuna/Compiler/Diag.vuna`（模型 + 结果通道）、
`compiler/lib/Vuna/Compiler/Source.vuna`（`Pos`/`Span`/路径工具）。

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
- **无位置**必须显式：没有主 span 的诊断必须带 `absent` 理由（`Synthetic` 是过渡档，
  门禁要求逐码 allowlist）；一旦附加主 span，`withLabel` 自动清空 `absent`。
  `stability=Volatile` 的诊断（无源码位置/工具/包图）不允许作为输入摘要的纯函数落盘。
- **文本兼容层**：`diagText` 渲染 `file:line:col: [CODE] 消息`（short 视图），迁移期
  仍被部分工具用作字符串出口；新代码不得使用它构造/解析诊断。

## 3. 结果通道与迁移

- `Vuna.Compiler.Common` 重导出 `Source` + `Diag`；`Err` 载荷是 `Diagnostic`。
- `Common.bind/step/traverse` 固定作用于 `Check`（`compiler/lib/Vuna/Compiler/Common.vuna`）；
  `OkC/ErrC` 构造子避免与 `Prelude` 的 `Base.Result` 冲突。
- `Base.Result`（字符串错误）只留给 `base/` 标准库内部；compiler 与根工具链统一 `Check`。
- 迁移期构造函数：
  - `err : String -> Check a`：工具错误（phase = Tool，无码）；根工具链 CLI 错误用它。
  - `rawAt` / `rawNoLoc`：尚未分类的源码裸消息（迁移完成后删除）。
  - `icFuel` / `icInternal`：编译器内部错误（phase = Internal，`diagInternal = True`）。
- **状态**：结构化通道已落地。compiler 内裸 `err` 由初版 421 处降到 **10 处**，且只剩
  工具/构建白名单（`CompilerCli`/`Compile`/`Dt`，exit 2、无源码 span）；
  源码与清单诊断已全部走域码（TC_/CG_/RN_/PKG_/LD_/IC_）。`rawAt` 只剩 `Elab/Types.errAt` 的
  记录/派生兜底路径。

**前端位置（P0 已落地）**：Lexer 在字符游标处、Parser 在**产生点**用当前 token 的 span
构造 `LX_`/`PS_` 诊断（`lexErrAt` / `psErrAt`；路径由 `Loader.Flatten` 经
`withSpanFileIfEmpty` 注入）；Resolver 在 `EVar`/模式/限定名/类型表达式边界
`withFallbackSpan`，Loader 的导入点用 `Import.importSpan`。原先「首条解析诊断无位置」的
兼容特例与 `attachParsePath` 的 context-label 兜底已删除。剩余确实无源码位置的码登记在
`nix/diag-located.allow`（只减不增），由 `nix/checks/diag-located.sh` 守住。

## 4. 错误码域

| 域 | 含义 | 真源 |
| --- | --- | --- |
| `LX_` | 词法 | `Frontend/Diagnostics.vuna` |
| `PS_` | 语法 | 同上 |
| `RN_` | 名字解析（import/export/限定名/构造子）与内置宏展开（未知宏 / arity） | `Diagnostics/Rn.vuna` |
| `PKG_` | `vuna.toml` 清单/包图 | `Diagnostics/Pkg.vuna` |
| `LD_` | 模块/包加载 | `Loader/Diagnostics.vuna` |
| `TC_` | 精化/覆盖性/终止性/用量 | `Diagnostics/Tc.vuna` |
| `CG_` | codegen/驱动 | `Diagnostics/Cg.vuna` |
| `IC_` | 编译器内部错误 | `Diagnostics/Ic.vuna` |
| `UN_` | 告警（未使用/冗余/遮蔽），severity = warning | `Diagnostics/Warning.vuna` |
| `LN_`/`FX_` | lint 规则/修复 | `lib/Vuna/Lint/Diagnostics.vuna` |

约定：符号语义稳定；一个码一种语义。**没有「诊断码只增不删」的约定**：vuna 未发布、
无兼容义务，删改码允许（同步目录、`explain` 与夹具），历史在 git——本次删除 manifest
能力/特权/信任机制即移除了 `PKG_EmptyCapability` 等 11 个码。`vuna explain CODE` 与
`vuna gen-errors` 都从这些
枚举条目读取（不维护第二份列表）。

告警语义：`UN_ShadowedBinder` 只比较**运行时** binder（`Rig ≠ 0`）。`Rig0` 的隐式类型 /
索引 binder（`f : a -> a` 里自动量化的 `a`、实例方法签名里的 `a`/`b`/`c`、`{n : Nat}`）
由精化器在体前插成擦除 λ，源码里没有用户可见的外层 binder，因此 `f a = a`、`Applicative`
实例的 `\a => \b =>` 不误报；显式 `0 x` binder 与它们同等对待。`UN_UnusedDefinition`
只在入口路径检查（库包导出面未知，避免误报）。编译器生成的内部 binder（do 忽略 binder
命名 `_`、trait 字典字段 `_f<n>`）同样不参与 `UN_UnusedBinder` / `UN_ShadowedBinder`。
`UN_UnusedImport` 按「解析结果里实际引用的 canonical target（含重载构造子候选、do 链的
bind 目标）+ 模块头 `module X` 重导出」判定（alias 归一到 import 名；模板字符串降级合成的
`Base.Interp.interp` 不算使用，与旧判定一致）；warning 不写进 iface；check 结果缓存会带上 warning，但「干净模块复用」的运行可能不完整，
`-W` / `--deny-warnings` 因此仍强制本包模块重新精化以避免漏报（见
[tooling.md](tooling.md) 退出码一节）。

warning 的**通道**（M4 起）没有进程内全局收集器：Elab 期 `warnAt*`
（`Elab/Usage.vuna`）把诊断追加进显式状态 `Ec.ecWarnings`，精化出口挂到
`DtProgram.dtProgWarnings`；loader 的 unused-import（`Loader/Flatten.vuna` 的
`unusedImportWarnings`）与入口路径的 `UN_UnusedDefinition`（`Driver/Dt.vuna`）直接返回
诊断列表。驱动层把三者按 loader → elab → unused-def 的顺序拼成
`CheckedPackage.checkedWarnings` / check 入口的返回值；`-W` / `--deny-warnings` / LSP
在输出前用 `Diagnostics/Sink.vuna` 的 `dedupeWarnings` 去重（按首次出现顺序）。
解析恢复期的多条 `PS_` 诊断由 `Parser.parseSourceRecovering` 显式返回，加载器把它们挂到
首条错误的 `Diagnostic.diagChildren` 上（批量错误通道），CLI 逐个输出——两者都不再依赖
跨调用保留的可变状态。

## 5. 渲染视图

实现：`compiler/lib/Vuna/Compiler/Diag/Format.vuna`。

| 视图 | 入口 | 形态 |
| --- | --- | --- |
| short | `renderShort` / `diagText` | `file:line:col: [CODE] 消息`（编辑器/grep/管道默认）；CLI 片段由 `renderShortSnippetEff` 从 label 结构化追加 |
| human | `renderHuman` | 交互终端默认：首行 + 主/相关 label 片段（context 标签输出 `= in ...`）+ note/建议/目录说明 |
| human | `renderHuman` | `error[CODE]: 消息` + `--> file:line:col` + 源码行 + 插入符 + notes |
| JSON | `renderJsonList` | `{version,tool,diagnostics[]}`，含 labels/fields/trace/notes/suggestions/origin/internal/ice |
| SARIF | `renderSarif` | SARIF 2.1.0 单 run：ruleId/level/message/locations/relatedLocations |

CLI 开关：`--error-format=short|human|json|sarif`、`--json`、`--message-format=...`、`--lang en|zh`（zh 时 human 消息本地化）、`--continue-on-error`（elab best-effort 多错误，仅**入口文件**；带 `module` 头的库模块单文件检查只报首错）；包级 check
会把格式、`--lang`、`--max-errors` 透传给成员包子进程；成员包错误带 `[包名]` 前缀。
**机器格式单文档**：`--error-format=json|sarif` 的工作区检查在父进程内逐包收集诊断，
stdout 恰好输出一份文档（不再让成员子进程各打一份）；成员 manifest 的 `[diagnostics]`
不能覆盖命令行显式格式。

`vuna check <file.vuna>` 支持两类文件：无 `module` 头的入口文件（旧语义，含
`--continue-on-error` 恢复）；带 `module` 头的库模块（按 `Pkg.contextForFile` 的包上下文
单模块精化，与编辑器打开该文件同一条链，告警只报本文件；包入口文件仍按入口报
`LD_ModuleHeaderInEntryFile`，与包级 check 一致）。

JSON 字段是机器契约：`code/severity/phase/category/message/labels[]/fields[]`；
`fields` 目前包含 `expected`/`found`（类型不匹配/解析期望）、`name`/`candidates`（覆盖性缺失构造子）、`effect`（未处理效应）、`note`（洞目标/元变量归属）、`call`/`quantity`/
`effect`/`module`/`span`/`note` 的构造器，后续按语义族填充。

## 5.1 配置（`vuna.toml [diagnostics]`）

可选 section；命令行显式 flag 优先：

| key | 值 | 语义 |
| --- | --- | --- |
| `format` | `short`/`human`/`json`/`sarif` | 默认渲染格式（等价 `--error-format`）；未显式指定时按消费端选：TTY → `human`，管道/CI → `short`（`lang=zh` 时 human） |
| `warnings` | bool | 是否默认显示 `UN_` 告警（等价 `-W`；`--deny-warnings` 仍提升退出码） |
| `max-errors` | 正整数 | 一次检查最多显示/序列化多少条诊断（0 或缺省 = 不限） |
| `lang` | `en`/`zh` | human 视图语言；`zh` 追加目录中文说明并默认切 human（命令行 `--lang` 优先） |
| 缓存 | — | 整个 `[diagnostics]` section 是**纯显示配置**，不进 check/build 的语义身份：改它不触发重编译 |
| `deny-warnings` | bool | 等价 `--deny-warnings`：warning 提升为失败（命令行显式 flag 优先；为 true 时同时显示 warning） |

非法值是该清单的结构诊断（`PKG_InvalidDiagFormat` / `PKG_InvalidDiagMaxErrors`）；未知 key 报 `PKG_UnknownKey`。

## 6. LSP 映射

实现：`lib/Vuna/Lsp/Diagnostics.vuna`。

- 直接消费 `Diagnostic`：不再从文本扫位置；依赖文件诊断按 span 文件过滤。
- range 用完整 span（起止），UTF-16 换算；无位置诊断落到 0:0。
- 所有错误都发布（编译器 + lint 合并）；lint `Finding` 转成同一 `Diagnostic`；`UN_UnusedImport` 在 LSP 增量路径不回放（编辑器侧使用集未重算，避免误报；CLI 仍报告）。
- `relatedInformation` 来自 secondary/context 标签；`data` 来自 `diagFields`；
  `code` 直接给客户端；消息追加 notes/suggestions。
- lint quick fix 的内嵌诊断与发布诊断字段集合一致；诊断自带 `suggestions`（如未使用 binder/定义）也生成 quick fix CodeAction（应用其 `DiagEdit`）。
- **pull**：`textDocument/diagnostic` 回 `{kind:"full", items:[...]}`（与 push 同一诊断链/JSON 字段），initialize 声明 `diagnosticProvider`。
- **push / pull 二选一**：客户端在 `initialize` 声明 `capabilities.textDocument.diagnostic`
  时服务器只走 pull（不再发 `publishDiagnostics`），否则走 push。两套同时用会让
  vscode-languageclient 的 push / pull 诊断集合各显示一份同一诊断（Problems 面板重复）。

## 7. 退出码

| 码 | 含义 |
| --- | --- |
| 0 | 成功 |
| 1 | 源码诊断错误 |
| 2 | 用法/工具错误；内部编译器错误（ICE） |
| 70 | 内部编译器错误（ICE）：`diagInternal = True` 的诊断；输出仍带 `internal compiler error`/ICE 载荷 |

## 8. 测试与门禁（当前）

- `test/corpus/lsp/smoke.sh`：结构化诊断 smoke（0-based range、UTF-16、全部诊断、
  quick fix、relatedInformation）。
- `nix/checks/diag-raw.sh`：compiler 内源码/清单诊断不得走裸 `err`（工具/构建白名单：`CompilerCli`/`Compile`/`Dt`），
  `showSpanLoc` 只能出现在渲染器/目标消息组装处。
- 负例夹具双轨：320 个 `.diag.json` 结构化期望（`--json` 聚合文档，`--bless-diag` 生成）
  与原有 `.err` 首行片段断言并存；`--bless-diag` 在 runner 内写盘（worker 透传）。
- `nix/checks/diag-located.sh`：结构化诊断必须有主 span，或带显式 `absent` 理由并逐码
  登记在 `nix/diag-located.allow`（只减不增）；当前 317/324 有位置，7 条按码登记（3 package-graph + 4 synthetic）。
- `nix/checks/diag-coverage.sh`：目录码 vs 结构化夹具覆盖门禁（allowlist 记录缺口、
  基线 `nix/diag-coverage.min` 防回退；当前 191/242，缺口在 allowlist 且必须于 `nix/diag-unreachable.txt` 登记不可达原因）。
- `vuna check .`（旧/新编译器）、全量 suite、`nix build .#vuna-seed` 必须通过。

## 9. 迁移状态（对照完整设计）

| 项 | 状态 |
| --- | --- |
| D1 三通道（源码/工具/内部） | 已落地（phase Tool/Internal + ICE 信息） |
| D2 `Diagnostic` 全字段 | 已落地 |
| D3 位置契约（end span、UTF-16、显式 NoLoc） | 已落地（Core `TVar` 带源 span 供 QTT 使用点；合成/内部项无源位置时显式 NoLoc） |
| D4 码域（RN_/PKG_ 独立域、死码清理） | 已落地（`RN_` / `PKG_` 各自独立域；历代已清理无发射点死码；本次删除 manifest 能力/信任机制又移除 11 个码——9 个 `PKG_` + `RN_UnknownCapability` + `LD_HostModulePrivileged`。未发布、无兼容义务，码可删；具体码数以枚举真源与 `gen-errors` 产物为准） |
| D5 目录单一真源 + 生成枚举/文档 | 已落地（枚举构造子锁定码/arity；描述/中文/示例表与枚举同模块维护并由 `gen-errors` 生成 `errors.md`+`errors.json`（含 example）；`explain` 同源；LSP data 附 `catalog` 提示） |
| D6 渲染/LSP/CLI | 已落地 short/human/JSON/SARIF + LSP push/pull + `[diagnostics]` 配置；human 视图展示 fields/trace/suggestions（与 JSON 同源）；SARIF rules 带目录 shortDescription/help/defaultConfiguration/tags；i18n 已落地（`--lang zh` 与 `[diagnostics] lang` 的 human 消息本地化 + `= message:` 英文原文；机器 JSON 保留英文 `message` 并附 `localizedMessage`） |
| D7.1 多错误 + Cascade | 已落地（parser 顶层 resync；elab `--continue-on-error` best-effort：文件入口/可执行包/库包逐次移除失败声明，最多 8 条；依赖被移除声明的错误标 `origin=cascade`（human note；JSON/SARIF/LSP data 同源）；`--max-errors` 同时约束恢复结果） |
| D7.2 warnings（未使用/冗余/不可达） | 已落地（`UN_UnusedBinder`/`UN_ShadowedBinder`/`UN_RedundantCtorBranch`/`UN_RedundantLiteralBranch`/`UN_BranchAfterCatchAll`/`UN_UnusedImport`（限定/别名/open import/`module X` 重导出统一追踪）/`UN_UnusedDefinition`；`-W`/`--deny-warnings` 已接且绕过 check 缓存/干净模块复用以保证不漏报） |
| D7.3 建议引擎 + Fix | 已落地（`Candidate`/`Suggestion` 模型；所有可安全自动修复的 warning 附 machine-applicable 编辑（unused binder/definition/import、冗余构造子/字面量分支、catch-all 后分支）；LSP codeAction 应用诊断 suggestions，`test/corpus/lsp/quickfix.sh` 集成测试） |
| D7.4 类型不匹配 expected/found | 已落地（fields expected/found + PhUnify trace 帧；期望类型无源 span，以 fields 而非双端 label 表达） |
| D7.5 实例搜索 trace | 已落地（`TC_NoInstanceFound` 附失败目标族桶的候选实例 `fields.candidates`，每个候选带 instance 声明 span 与拒绝原因「实例头 vs 目标」） |
| D7.6 终止性 call matrix | 已落地（`TC_CannotProveTermination` 附 `fields.call` 边：caller/callee/参数位置/调用点 span；human 行尾显示文件:行号） |
| D7.7 覆盖性缺失构造子标签 | 已落地（缺失构造子进 `fields.candidates`，每个候选带构造子声明 `span`；JSON/SARIF/LSP（含 diag fields 的 candidates.span）可跳转） |
| D7.8 QTT 使用点 | 已落地（Core `TVar` 携带源 span；线性/擦除错误附 `fields.quantity`：name/declared/observed，并逐使用点附 `fields.span name=use`；内部合成变量无源位置时不附） |
| D7.9 文案规范/门禁 | 已落地（`nix/checks/diag-style.sh`：句号/大小写/空白/占位符；专有名词例外逐码 allowlist） |
| D7.10 explanation/example/`explain` | 已落地（`explain` 文本/`--json`/`--list --json`，含模板/中文说明/severity/phase/category/example；元变量/洞带 `name`/note 与洞目标 span；`Elab/MetaSpans` 登记创建点，洞与可延迟字典元变量附 `fields.span name=created`，纯合成 meta 无源位置时不伪造） |
| D7.11 效果行 | 已落地（`TC_UnhandledEffects` fields 含 expected/actual 行 + 每个未处理 effect 单独一条 `unhandled:` 行） |
| 结构化夹具 + 每码覆盖门禁 | 已落地（320 个 `.diag.json`；覆盖门禁 191/242，51 个缺口 allowlist 且逐码在 `nix/diag-unreachable.txt` 审计） |
| D3b 无源码位置显式化 | 已落地（`NoSourceReason`/`Stability` 模型字段；JSON 仅在无位置时输出 `absent`；剩余无位置码逐码登记在 `nix/diag-located.allow`，门禁要求「无 span 必须带理由」） |

## 10. 后续路线（按依赖排序）

1. **错误分类**：源码/清单诊断已全部走域码；裸 `err` 只剩纯工具/构建错误白名单（`CompilerCli`/`Compile`/`Dt`），由 `nix/checks/diag-raw.sh` 守住。下一步清理死码与补齐目录元数据。
   删 `rawAt`/`rawNoLoc`；CI 门禁「compiler 内无 `err "`」。
2. **目录元数据**：条目补 severity/phase/category/explanation/example；`gen-errors`
   输出这些字段；每码至少一个结构化夹具。
3. **warnings**：冗余/不可达分支改判 warning；未使用 binder/import；`-W` 组与
   `--deny-warnings`。
4. **多错误**：`Elab.Driver` 逐 decl 恢复（失败名字集合 + Cascade）；parser 顶层 resync；
   排序/去重/上限。
5. **语义质量**：实例搜索树、终止性 call matrix、覆盖性缺失构造子标签、QTT 使用点
   （Core `TSp` + 使用日志）、统一建议引擎（编辑距离 + Fix）。
6. **消费端**：i18n、LSP quick fix 扩展（SARIF、ICE 退出码、`[diagnostics]` 配置、pull diagnostics 已落地）。
7. **夹具迁移**：`.diag.json` + `--bless-diag` 已落地（320 份）；继续补 allowlist 中 51 个码的结构化夹具，渲染 golden。

## 11. 边界

- 列单位是 UTF-8 字节（不是码点）；渲染宽字符按字节/显示字符混合处理，LSP 边界换算
  UTF-16。
- `base/` 标准库仍用 `Base.Result`（字符串错误）；不要把 `Check` 扩散进 base。
- 消息模板为英文（机器格式稳定）；`--lang zh` / `[diagnostics].lang` 的 human 视图用目录中文说明替代消息，并附 `= message: <英文原文>`。