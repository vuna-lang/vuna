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
Diagnostic = { id, severity, phase, category, code, message, labels, fields, trace,
               notes, suggestions, origin(Direct|Cascade), children, internal, ice }
```

- **位置**：行/列 1-based；列 = **UTF-8 字节**（与 lexer 的 `advanceChar` 一致）。
  LSP 适配器用 buffer 文本把字节列换算成 0-based UTF-16 code units。
- **无位置**必须显式：不给 label，不能「忘记带」。
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

## 4. 错误码域

| 域 | 含义 | 真源 |
| --- | --- | --- |
| `LX_` | 词法 | `Frontend/Diagnostics.vuna` |
| `PS_` | 语法 | 同上 |
| `RN_` | 名字解析（import/export/限定名/构造子） | `Diagnostics/Rn.vuna` |
| `PKG_` | `vuna.toml` 清单/包图 | `Diagnostics/Pkg.vuna` |
| `LD_` | 模块/包加载 | `Loader/Diagnostics.vuna` |
| `TC_` | 精化/覆盖性/终止性/用量 | `Diagnostics/Tc.vuna` |
| `CG_` | codegen/驱动 | `Diagnostics/Cg.vuna` |
| `IC_` | 编译器内部错误 | `Diagnostics/Ic.vuna` |
| `UN_` | 告警（未使用/冗余/遮蔽），severity = warning | `Diagnostics/Warning.vuna` |
| `LN_`/`FX_` | lint 规则/修复 | `lib/Vuna/Lint/Diagnostics.vuna` |

约定：符号语义稳定；一个码一种语义。`vuna explain CODE` 与 `vuna gen-errors` 都从这些
枚举条目读取（不维护第二份列表）。

## 5. 渲染视图

实现：`compiler/lib/Vuna/Compiler/Diag/Format.vuna`。

| 视图 | 入口 | 形态 |
| --- | --- | --- |
| short | `renderShort` / `diagText` | `file:line:col: [CODE] 消息`（过渡期/编辑器/grep） |
| human | `renderHuman` | `error[CODE]: 消息` + `--> file:line:col` + 源码行 + 插入符 + notes |
| JSON | `renderJsonList` | `{version,tool,diagnostics[]}`，含 labels/fields/trace/notes/suggestions/origin/internal/ice |
| SARIF | `renderSarif` | SARIF 2.1.0 单 run：ruleId/level/message/locations/relatedLocations |

CLI 开关：`--error-format=short|human|json|sarif`、`--json`、`--message-format=...`、`--lang en|zh`（zh 时 human 追加目录中文说明并默认切 human）；包级 check
会把格式透传给成员包子进程；成员包错误带 `[包名]` 前缀。

JSON 字段是机器契约：`code/severity/phase/category/message/labels[]/fields[]`；
`fields` 目前包含 `expected`/`found`（类型不匹配/解析期望）、`name`/`candidates`（覆盖性缺失构造子）、`effect`（未处理效应）、`note`（洞目标/元变量归属）、`call`/`quantity`/
`effect`/`module`/`span`/`note` 的构造器，后续按语义族填充。

## 5.1 配置（`vuna.toml [diagnostics]`）

可选 section；命令行显式 flag 优先：

| key | 值 | 语义 |
| --- | --- | --- |
| `format` | `short`/`human`/`json`/`sarif` | 默认渲染格式（等价 `--error-format`） |
| `warnings` | bool | 是否默认显示 `UN_` 告警（等价 `-W`；`--deny-warnings` 仍提升退出码） |
| `max-errors` | 正整数 | 一次检查最多显示/序列化多少条诊断（0 或缺省 = 不限） |
| `lang` | `en`/`zh` | human 视图语言；`zh` 追加目录中文说明并默认切 human（命令行 `--lang` 优先） |

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
- 负例夹具双轨：210 个 `.diag.json` 结构化期望（`--json` 聚合文档，`--bless-diag` 生成）
  与原有 `.err` 首行片段断言并存；`--bless-diag` 在 runner 内写盘（worker 透传）。
- `nix/checks/diag-coverage.sh`：目录码 vs 结构化夹具覆盖门禁（allowlist 记录缺口、
  基线 `nix/diag-coverage.min` 防回退；当前 183/234，缺口已在 allowlist 逐码登记）。
- `vuna check .`（旧/新编译器）、全量 suite、`nix build .#vuna-seed` 必须通过。

## 9. 迁移状态（对照完整设计）

| 项 | 状态 |
| --- | --- |
| D1 三通道（源码/工具/内部） | 已落地（phase Tool/Internal + ICE 信息） |
| D2 `Diagnostic` 全字段 | 已落地 |
| D3 位置契约（end span、UTF-16、显式 NoLoc） | 已落地（span 填充仍在补齐） |
| D4 码域（RN_/PKG_ 独立域、死码清理） | 已落地（`RN_` 23 码、`PKG_` 27 码；已删除 9 个 TC + 4 RN + 2 PS + 1 LD 无发射点死码） |
| D5 目录单一真源 + 生成枚举/文档 | 部分（条目仍是手写；`explain`/`gen-errors` 同源，`gen-errors` 同时生成 `errors.md` 与目录 JSON `errors.json`；两者都输出 severity/phase/category 元数据） |
| D6 渲染/LSP/CLI | 已落地 short/human/JSON/SARIF + LSP push/pull + `[diagnostics]` 配置；human 视图展示 fields/trace/suggestions（与 JSON 同源）；SARIF rules 带目录 shortDescription/help/defaultConfiguration/tags；i18n 部分（`--lang zh` 与 `[diagnostics] lang` 的 human 消息本地化 + `= message:` 英文原文附注；机器格式保持英文） |
| D7.1 多错误 + Cascade | 部分（parser 顶层 resync：多个语法错误一次报出，`--max-errors` 截断且作用于 short/JSON/SARIF；elab 逐 decl 恢复 + Cascade 待办） |
| D7.2 warnings（未使用/冗余/不可达） | 已落地（`UN_UnusedBinder`/`UN_ShadowedBinder`/`UN_RedundantCtorBranch`/`UN_RedundantLiteralBranch`/`UN_BranchAfterCatchAll`/`UN_UnusedImport`（限定/别名/open import 统一追踪）/`UN_UnusedDefinition`；`-W`/`--deny-warnings` 已接） |
| D7.3 建议引擎 + Fix | 部分（`Candidate`/`Suggestion` 模型就绪；`UN_UnusedBinder`/`UN_UnusedDefinition`/`UN_UnusedImport` 附 machine-applicable 编辑；LSP codeAction 已应用诊断 suggestions；更多码待接） |
| D7.4 类型不匹配 expected/found | 已落地（fields + PhUnify trace 帧 expected/found；双端 label 待补） |
| D7.5 实例搜索 trace | 部分（`TC_NoInstanceFound` 附失败目标族桶的候选实例 `fields.candidates`；完整搜索树/拒绝原因仍待补） |
| D7.6 终止性 call matrix | 部分（`TC_CannotProveTermination` 附 `fields.call` 边：caller/callee/relation；逐参数矩阵与完整调用点待补） |
| D7.7 覆盖性缺失构造子标签 | 已落地（缺失构造子进 `fields.candidates`，每个候选带构造子声明 `span`；JSON/SARIF/LSP（含 diag fields 的 candidates.span）可跳转） |
| D7.8 QTT 使用点 | 部分（线性/擦除错误附 `fields.quantity`：name/declared/observed；逐使用点 span 待 Core `TSp`） |
| D7.9 文案规范/门禁 | 已落地（`nix/checks/diag-style.sh`：句号/大小写/空白/占位符；专有名词例外逐码 allowlist） |
| D7.10 explanation/example/`explain` | 部分（`explain` 文本/`--json`/`--list --json` 均可用，含模板/中文说明/severity/phase/category/`example` 夹具路径；元变量/洞已有 `name`/`note` 字段） |
| 结构化夹具 + 每码覆盖门禁 | 部分（210 个 `.diag.json`；覆盖门禁 183/234，缺口 allowlist 逐码登记） |

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
7. **夹具迁移**：`.diag.json` + `--bless-diag` 已落地（206 份）；继续补 allowlist 中 143 个码的结构化夹具，渲染 golden。

## 11. 边界

- 列单位是 UTF-8 字节（不是码点）；渲染宽字符按字节/显示字符混合处理，LSP 边界换算
  UTF-16。
- `base/` 标准库仍用 `Base.Result`（字符串错误）；不要把 `Check` 扩散进 base。
- 消息模板为英文（机器格式稳定）；`--lang zh` / `[diagnostics].lang` 的 human 视图用目录中文说明替代消息，并附 `= message: <英文原文>`。