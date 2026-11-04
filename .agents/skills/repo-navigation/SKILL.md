---
name: repo-navigation
description: 在 vuna 仓库中探索代码时的工具选择规则——哪些模块必须整篇读、哪些只查符号、为什么不要用 grep 定位符号，以及探索完成后必须把结论写进 docs/。开始探查本仓库、或在改动前需要了解某个子系统时使用。
---

# vuna 仓库探索指南

在动手改代码前，用最少的上下文把仓库摸清楚。核心原则：**探索分两个维度，用错工具的代价
是双向的**——读多了浪费上下文，读少了会漏掉调用点导致改漏。

## 第一步：先判定维度

问自己一个问题：**这个文件会出现在我的 `git diff` 里吗？**

| 会 → 维度 A | 不会 → 维度 B |
| --- | --- |
| 要改的模块 | 只引用、只需知道名字/签名/影响面 |
| **整篇 `read`** | **`vuna map` / `vuna api`**（不要 grep） |

这条线画在「**是否要改它**」，不是「是否熟悉它」。熟悉但要改的模块照样整篇读。

## 维度 A：要改的模块 → 整篇 `read`

```console
read compiler/lib/Vuna/Compiler/Elab.vuna
```

**不要**试图用查询工具省这一步。理由：

- 改动点通常是**数据流**而非孤立符号。例如 `Elab.vuna` 的 `Ec` 状态如何穿过
  `elabBodies` → `convEc` → `unsolvedMeta`——这类信息不在任何签名里。
- 改实现必须知道**全部**构造/解构点；`map --impact` 看不到模块**内部**耦合
  （内部类型根本不出现在跨模块签名里）。
- 反复查询的成本会超过一次读取：650 行文件用 20 次 `map --find` 拼出的信息还不如通读。

**唯一例外**：超长文件（`Elab.vuna` 2000+ 行）可先 `map --find` 拿行号，再
`read --offset/--limit` 读那一段。但**改动涉及的函数体必须完整读到**。

## 维度 B：不改、只引用 → `vuna map` / `vuna api`

### 四个子场景

**（a）知道名字，不知道在哪** → `vuna map --find`

```console
vuna map --find Vuna.Compiler.Elab.elabProgram   # 完全限定名，推荐
vuna map --find lookupEnv                        # 短名也行，但见下方警告
```

能查**非导出符号**（`extendSizes`、`ecEmpty` 这类模块内部函数都能定位），
不必先确认它在不在 `module` 导出列表里。

> **警告：短名只取第一个匹配，不报歧义。** 实测 `--find lookup` 直接返回
> `Base.Map.lookup`，退出码 0。拿不准时用**完全限定名** `Module.name`。

**（b）要一个模块的接口面** → `vuna api <Module>`

```console
vuna api Vuna.Compiler.Elab
```

给 data 定义 + 注释 + 行号。**已知缺陷**：只回显源码里**显式写出**的签名；vuna 大量
访问器省略签名（如 `dtDefName (DtDef name ty body) = name`），这些条目显示为空
（实测 `Elab` 的 282 个条目里 37 个签名是空的）。看到空签名就转 `map --find` 或读该行。

**（c）改跨模块符号，想知道波及面** → `vuna map --impact`

```console
$ vuna map --impact Vuna.Compiler.Elab.elabProgram
symbol: Vuna.Compiler.Elab.elabProgram
readers: Vuna.Compiler.Dt
tests: run, stdlib
```

`readers` 是引用者模块，`tests` 是建议测试标签。这是 grep 给不了的。

**（d）某个主题会落在哪些模块** → `vuna map` / `vuna map --modules`

按包分组给模块清单与规模，据此判断再下钻。

### 为什么不用 grep

实测（`compiler/lib` 下）：

| 问题 | grep | `map --find` |
| --- | --- | --- |
| **拿多**：查 `lookup` | 命中 `lookupEntry` `lookupEntryLine` `lookupEnv` `lookupDtDef` `lookupProvided` `lookupKV` `lookup` `lookupPair` 一整族；`lookup`/`apply` 前缀单在 `compiler/lib` 就 57 行 | 唯一定位 + 模块前缀 + 签名 + 行号 |
| **拿少**：多 clause 函数 | `lookupEnv` 有签名 + 2 个 clause，`grep '^lookupEnv '` 抓 3 行但看不出是一个函数 | 明确给出唯一签名与定义点 |
| **拿不到签名** | 只给名字 | 直接给类型 |

注意：vuna 有模块系统，**跨模块真重名几乎不存在**（实测无同名顶层定义）。所以 grep 的
痛点是「**前缀相似的家族名噪音**」＋「多 clause」，不是「歧义」。

## 工具边界（动手前先知道）

| 边界 | 兜底 |
| --- | --- |
| `--impact` 看不到模块内部耦合 | 整篇 `read` 要改的模块 |
| `api` 空签名 | `map --find` 或读该行 |
| 索引只到 parse 级，签名是源码里写的、非推断 | 同上 |
| 短名静默取第一个 | 用完全限定名 |
| 索引缓存 `.local/index/` 自动判新鲜度 | 怀疑过期就 `rm -rf .local/index/`（实测会自动重建） |

**没有「读一段实现」的命令**——这是当前工具链最明显的缺口。只能
`map --find` 拿行号 + `read --offset/--limit`。

## `vuna doc` 用来看还是用来生成

**`vuna doc` 是发布用途，不是探索用途**：内容与 `vuna api` 同源（同样受空签名限制），
但输出是整包聚合的一大篇，查单个符号更慢。探索用 `vuna api <Module>`。

注意 `vuna doc` 要求输出文件的**父目录已存在**（它不创建目录）。

## 探索完成后：必须落盘

**这是最容易被跳过、但价值最高的一步。**

读 4000 行建立的理解若只留在会话里，会话一结束就没了，下一个 agent 要从零重建。
所以每完成一个主题的探查理解后，**立即**把结论写进 `docs/`。

写什么（按价值排序）：

1. **数据流**：子系统「输入 → 各阶段 → 输出」的链路，每段的入口符号；
2. **不变量与陷阱**：什么必须保持、什么改动会破坏它（例：`Ec` 字段顺序与访问器的
   对应关系；`erased` 标志的语义）；
3. **已知边界与缺陷**：工具/子系统**做不到**什么（本文的「工具边界」就是这类）；
4. **导航**：某主题该看哪几个文件、哪几个函数。

**不要写**：能从源码直接看到的东西（函数签名、行号——会漂移），以及 `vuna api` 已覆盖的
接口清单。

落点：

- 子系统地图级 → `docs/architecture.md`（已有五条链路）
- 单一参考主题 → `docs/reference/<topic>.md`
- 阶段方向 / 开放项 → `docs/roadmap.md` + `docs/reference/debt.md`（只记仍未完成项）
- 历史 / 已完成阶段 / 已落地决策 → git log（不要写进 `docs/`）

**写完必须接进导航**：`AGENTS.md` 的「文档导航」与 `README.md` 的文档表各加一行，
否则文档等于不存在。

## 速查

```console
# 维度 A：要改的模块 —— 整篇读
read compiler/lib/Vuna/Compiler/Elab.vuna

# 维度 B：不改，只查
vuna map                                        # 主题落在哪些模块
vuna map --modules                              # 扁平模块清单
vuna map --find <Module.name>                   # 符号：定义位置 + 签名
vuna map --impact <Module.name>                 # 改它波及谁 + 建议测试
vuna api <Module.name>                          # 模块接口面 + 注释 + 行号

# 有行号之后读一段
read <file> --offset <line> --limit <n>

# 探索完必做：写进 docs/，并接进 AGENTS.md 与 README 的导航
```
