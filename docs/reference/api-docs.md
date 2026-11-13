# API 文档与检索（docstring / HTML / search）

本文覆盖 `vuna doc`（docstring → 单文件交互 HTML）与 `vuna search`（名称 / docstring /
类型检索），以及它们共用的索引与边界。LSP hover、错误码体系见
[tooling.md](tooling.md)；索引缓存实现见 [cache.md](cache.md) 与
[cache.md](cache.md)。

## 1. docstring

docstring 是**源码注释**的一种，由工具链识别；编译器不解析、AST 不保存，因此不进入
TCB，也不需要 seed rotation。

### 1.1 语法

```vuna
-- | 模块文档第一行。
-- | 第二行。
module Demo where

-- | 顶层声明文档。
id : a -> a
id x = x

{- | 块注释也可以当 docstring。
     第二行（按最小公共缩进 dedent）。 -}
data Box a : Type where
  -- | 构造子文档。
  Empty : Box a
  -- | 字段/方法文档同理。
  Full : a -> Box a

-- 尾随形式：与目标同一行、写在目标右侧。
count : Int
count = 0 -- ^ 尾随 doc。
data Wrap a : Type where
  Wrap : a -> Wrap a {- ^ 块注释尾随形式。 -}

-- 普通注释：不是 docstring，不会出现在 HTML / hover / `vuna api` 中。
```

- 行块：首行 `-- |`（前置）或 `-- ^`（尾随）；后续**同列且行号连续**的 `--` /
  `-- |` / `-- ^` 行为续行；空行结束。
- 块：`{- | ... -}` / `{-| ... -}`（前置）、`{- ^ ... -}`（尾随）；剥离首部标记，按非空行的
  最小前导空格 dedent。
- 关联规则（前置）：doc block 归到第一个「行号更大、列相同、行距 ≤ 2 行、中间没有其他注释」的
  目标（模块头 / 顶层声明 / data 构造子 / record 字段 / trait 方法）。
- 关联规则（尾随）：必须是**同一行、列在目标右侧**；归到该行最后一个这样的目标。不支持把
  尾随 doc 写在目标的下一行——fmt 会把单独成行的注释统一挂到下一个条目作为前置注释，那种
  写法在 fmt 后归属会变，因此不纳入语义。同一目标同时有前置与尾随 doc 时**前置优先**。
- 模块文档写在 `module` 头之前；尾随形式不参与模块文档。
- 模块文档也用于 LSP hover——模块名（`import` / 导出项 `module B` / 模块头 / 限定名前缀）
  hover 时在 `module <全名>` 之后显示该模块的 docstring；被 import 的模块读盘取 docstring。
- 孤儿 doc、缩进错误、普通注释都忽略（不报错）。
- 私有名（`_` 前缀）不进入文档与 `--check`，但仍在 `vuna map` / `vuna api` 索引里。

### 1.2 docstring 内的 Markdown 子集

`vuna doc` 在**生成期**把 docstring 渲染为 HTML（客户端不解析 Markdown）：

- 段落（空行分隔）、行内 `` `code` ``、fenced code（```` ``` ````，第一行可选语言标签）；
- `[text](url)` 链接，只允许 `http:` / `https:` / `#` / 相对路径；
- `[Module.name]` 交叉引用：解析为页面内锚点，未解析则原样输出；
- 其余文本一律 HTML 转义。

## 2. `vuna doc`

```console
vuna doc [--check] [--package NAME] [DIR [OUT]]
```

- 默认输出 **一个自包含 HTML 文件**：`DIR=.` → `docs/api.html`，其他 `DIR` →
  `DIR/docs/api.html`；父目录逐级创建。
- `DIR` 是 workspace 根（含 `[workspace].members`）时渲染根包 + 所有成员包；是单个包时只
  渲染该包；`--package NAME` 只保留指定包。
- 每个包尊重自己的 `[export].modules`（按 manifest 顺序；缺模块是错误，exit 2）。
- `--check` 不写文件：逐个报告**顶层符号**缺失 docstring（前置 `-- |` 与尾随 `-- ^` 都
  算；私有名 `_` 前缀跳过），有缺失 exit 1；成员（构造子/字段/方法）不强制。
- `--check` 只在本地按需运行，**不在** `nix flake check` 里（docstring 覆盖不是 CI 门禁）；
  受管辖包与缺失统计口径见 [testing.md](testing.md) 的 Nix checks 清单与 [debt.md](debt.md) D30。
- 输出包含：标题/统计、搜索框、包/kind 过滤、左侧 TOC、模块/符号章节、签名代码块、
  docstring 渲染、内嵌搜索 JSON 与客户端 JS。无外部 CSS/JS/CDN，`file://` 直接打开。
- HTML 是可复现的：无时间戳/随机数，同一 DocBook 两次生成逐字节一致。

### 2.1 单文件 HTML 的搜索框

搜索框是**客户端**检索：名称 / 全名 / 签名 / docstring 子串，附带包与 kind 过滤；
`/` 聚焦、`Esc` 清空、结果点击跳锚点。它**不做类型匹配**：输入含 `->` / `=>` 时页面会
提示改用 `vuna search --type`（类型检索的唯一实现仍在 CLI，避免在 JS 里重写合一器）。

## 3. `vuna search`

```console
vuna search [--type|--name|--doc] [--module PFX] [--limit N] [--json] <query...>
```

- 默认：查询含 `->` / `=>` 走类型检索，否则名称 + docstring 检索；三个模式 flag 互斥。
- `--module PFX` 按模块全名前缀过滤；`--limit N` 默认 20（必须正整数）。
- `--json` 输出 schema `vuna-search/1`：`query` / `mode` / `hits[]`（module、name、kind、
  signature、doc、line、score、match）。
- 退出码：0 命中、1 无命中、2 用法 / 查询解析 / 非 workspace 错误。
- 查询是位置参数拼接（类型查询可含空格），例如 `vuna search --type "a -> a"`。

### 3.1 名称 / docstring 打分

- 名称：全名精确 > 裸名精确 > 裸名前缀 > 裸名子串 > 全名前缀 > 全名子串 > 模块名子串。
- docstring：查询按空白分词，要求全部 token 出现在 doc 中；命中加分。
- 名称与 doc 命中相加；同分按名字升序，保证确定性。

### 3.2 类型检索（parse 级）

查询与索引里的签名都来自 **parse 级 `symType`**（`Vuna.Sig.renderType` 的可回读文本），
不跑类型检查、不做实例/隐式解析。

归一化：

- 去括号；`->`（`EApp` / `EInfix`）→ 箭头；应用 spine 拉平；
- 隐式 Pi binder 丢弃并绑定变量，显式 Pi → 箭头（依赖被擦除）；
- 小写自由名与 `_` → 变量；大写 / `Type` → 构造子；
- 用索引里 data/record/trait 的短名 → 全名做类型名归一（只有唯一短名时）。

类型文本的列表语法：`Vuna.Sig` 把 parser 的保留名 `@vuna@list@nil` /
`@vuna@list@cons` 还原成 `[]` / `[a, b]`；`a :: b` 仍打印为中缀（闭合 `::` 链**不**改写成
`[...]`，保持 `symType` 的 parse 级形状与查询拼写一致）。因此 api/doc/search/hover 不再
出现保留名或前缀形式 `(:: a b)`；源码侧的归一由 `vuna lint --fix` 的 `list-literal` 负责。

匹配模式（按优先级/分数）：

| 模式 | 含义 |
| --- | --- |
| `alpha` | 归一后 α-等价（含变量重命名） |
| `general` | 查询变量可实例化到签名（签名变量刚性） |
| `specific` | 反向：签名变量可实例化到查询 |
| `result` | 查询匹配签名的结果类型（函数返回类型） |
| `overlap` | 头部构造子/元数相同（弱匹配） |

查询本身与签名文本完全相同还会加 exact bonus。单个符号的类型不可解析时跳过，不影响其他
命中；查询解析失败 exit 2。

### 3.3 已知边界

- 类型名解析是**语法级近似**：短名歧义时回退源码短名比较；不按 import 闭包解析。
- 无实例/隐式参数/依赖相等/类型别名展开的语义匹配；`Eq a =>` 约束在检索中忽略。
- 没有语义级检索（精化后比较），CLI 也没有 `--semantic`；见 [debt.md](debt.md)。
- 文档输出是单页 HTML；没有多页站点 / 搜索服务 / 托管。

## 4. 索引 v3

`vuna doc` 直接按源码构建 DocBook；`vuna search` / `vuna api` / LSP 用索引（会话载荷在
`$VUNA_STORE/objects/tool/`，按输入摘要判定）。
v3（本次 API 文档 + 检索）变化：

- `symbols.txt` 每行 8 字段：`module TAB name TAB kind TAB line TAB col TAB sig TAB doc TAB type`；
- `doc` 用 `\\`、`\t`、`\n`、`\r` 转义保存换行（多行 docstring 经缓存命中后仍完整）；
- `type` 是 `symType`（函数/构造子/字段/方法/axiom/extern 的显示类型；data/record/trait 为空）；
- manifest 首行 `vuna-index 3`；旧 v2 缓存自动全量重建。

`vuna api` / LSP hover 只显示 `symDoc`（docstring），普通注释不再出现；多行 doc 逐行缩进。

## 5. 设计参照

- **Haddock**：`-- |` 前置文档、续行语义；vuna 取 `-- |` / `{- | -}` 与**同一行**的尾随
  `-- ^` / `{- ^ -}`（不取写在目标下一行的尾随形式：fmt 会把单独成行的注释挂到下一条目，
  归属会变；见 §1.1）。
- **Idris2**：`|||` 是语言级 doc comment；vuna 不采用，因为 Lexer/Parser/AST 在 seed 闭包内，
  改语法需要 seed rotation，而工具链侧注释提取已能满足 hover / 生成 / 检索。
- **Hoogle**：类型查询 + 多种匹配强度（exact/equivalent/instance/partial）；vuna 的
  `alpha/general/specific/result/overlap` 是其 parse 级近似。

## 6. 实现导航

| 模块 | 职责 |
| --- | --- |
| `Vuna.Doc.Comments` | 识别 `-- |` / `{- | -}` / 同行尾随 `-- ^`、关联声明、普通注释排除 |
| `Vuna.Doc.Types` | DocBlock / DocTable 数据模型 |
| `Vuna.Doc.Model` | AST + DocTable → DocBook（模块/条目/成员） |
| `Vuna.Doc.Prose` | docstring 受限 Markdown → HTML |
| `Vuna.Doc.Html` | 单文件 HTML（内联 CSS/JS + 搜索 JSON） |
| `Vuna.Doc.Run` | 参数、包发现、`[export]`、`--check`、写出 |
| `Vuna.Sig` | 类型打印单一真源（api / doc / search 共用） |
| `Vuna.Search.Query` | 名称/doc/类型匹配纯函数 |
| `Vuna.Search.Run` | `vuna search` 参数与输出 |
| `Vuna.Index.*` | 符号索引 v3、`symDoc` / `symType` |

测试：`test/corpus/doc/check.sh`、`test/corpus/search/check.sh`、`test/corpus/index/check.sh`；
LSP hover 见 `test/corpus/lsp/smoke.sh`。