# 查询图（query graph）

一切都是节点：**key → (依赖表 + 值)**。命中判定只看「同一 key 的依赖摘要快照是否仍然
成立」，命中就跳过重算。这是 Salsa / rust-analyzer / TTC 系谱的增量模型，vuna 把它做成
**编译器内部唯一**的缓存判定层：`check`、`build`、LSP、REPL 都读同一套节点。

| 主题 | 位置 |
| --- | --- |
| 纯核心（命中 / 提交 / cutoff / trace） | `compiler/lib/Vuna/Compiler/Query.vuna` |
| Eff 层（预算 / 环检测 / 会话索引） | `compiler/lib/Vuna/Compiler/Query/Run.vuna` |
| 编译管线的节点族（check / split） | `compiler/lib/Vuna/Compiler/Driver/Graph.vuna` |
| 缓存布局与 framing | [cache.md](cache.md) |
| 编译器模块地图 | [compiler.md](compiler.md) |

## 1. 数据模型

```text
QVal  = QMarker            -- 无载荷（「同输入下曾经成功」，如 check 结果）
      | QBytes String      -- 内联载荷（通常 ≤ 64 KB）
      | QRef String        -- 大载荷的内容地址（Hash.contentAddress）

Entry = { entryDeps     : List (String, String)  -- dep key + 当时摘要（**按 key 升序**）
        , entryDeclared : List String            -- 上次调用声明的 dep key 集合（升序）
        , entryDigest   : String                 -- 值摘要（digestOfVal）
        , entryOrigin   : String                 -- pkg | tool（与 iface meOrigin 同语义）
        , entryVal      : QVal
        , entryHits     : Int }

Db    = { dbEntryMap : HashMap String Entry, dbTraceLines : List String, dbOrigin : String }
```

`Db` 是**纯值**：没有可变单元格、没有 `IORef`、没有宿主依赖。所有落盘/读盘经
`Query.Run` 的 Eff 层（`sessionLoad` / `sessionSave`），`Store` 是唯一写盘层。

## 2. 命中判定（`queryHit`）

一个 key 的旧条目可复用，当且仅当三条同时成立：

1. **声明集合一致**：本次声明的 dep key 集合 = `entryDeclared`（排序后比较，D-Q3）。
   声明集合变了说明「图的输入面」变了——典型是新增一个 import ——此时必须重算；只看观测
   依赖会让这种变化永远看不见（新 key 根本不在旧依赖表里）。
2. **观测依赖摘要未变**：`entryDeps` 逐项比当前的 dep 摘要（两侧排序，顺序无关）。
   动态依赖（`queryWith`）因此能做到「声明了但没读的 key 变化不失效」。
3. 缺失的 dep 按 `QBytes key` 占位 ⇒ 「dep 还没算」不会被误判成命中。

命中 ⇒ `hit <key>`（`entryHits + 1`，值不变，不写盘）。
未命中 ⇒ 调 compute；算完 `queryResolve` 比较值摘要：相同 ⇒ `cutoff <key>`（保留旧值与
来源，只更新依赖表）；不同 ⇒ `miss <key>`（覆盖条目）。

**cutoff 的价值**：重算过但产物没变，下游节点的判据（上游摘要）就不动，整条链不用重算。
编译管线里典型场景：依赖包接口摘要变了但本包 iface 摘要没变。

## 3. Eff 层（`Query.Run`）

```text
RunOpts  = { roOrigin, roBudget, roPersist, roBucket }
RunState = { rsDb, rsStack, rsBudget, rsBudget0, rsSteps }
```

- `runNode st key deps compute`：自环（`key ∈ deps`）/ 栈环（`rsStack`）⇒ `cycle <key>`；
  命中 ⇒ `hit`；预算耗尽（`roBudget > 0` 且用尽）⇒ `reject <key>`；否则 compute 后提交。
- **取消**只有「预算耗尽」一种协作式形态：`EffSched` 的取消在任务边界生效，
  用步数预算表达「这次查询不值得继续」，强杀留给进程级超时。
- **会话索引**：`<cache>/query/<hashContentKey(桶)>/index`，`Store` framing +
  codec `query-index 1`，tag 带编译器指纹（换二进制整套失效）。载荷只含条目表（map），
  不含 trace；写侧 `storeWriteIfChangedEff` 去抖。

## 4. 编译管线的节点族（`Driver.Graph`）

key 是**纯字符串**（不参与哈希输入），节点分成两组：

| 节点 | 值 | 依赖 |
| --- | --- | --- |
| `check:<pkg>:exe` / `check:<pkg>:lib:<namesHash>` | `QMarker` | `env:` / `src:` / `deps:` / `ver:` |
| `split:<pkg>:pr0` / `split:<pkg>:pr1` | `QRef <blob 地址>` | 同上（`ver:` 含 printResult） |
| `env:<pkg>:<manifestHash>` | 占位（key 已含摘要） | — |
| `src:<pkg>:<closureHash>` | 占位 | — |
| `deps:<pkg>:<closureHash>` | 占位 | — |
| `ver:<verHash>` | 占位 | — |

**为什么输入摘要写进 dep key 而不是真节点**：这些摘要每轮都要重新读盘算（`Db` 是纯的，
没有「输入可变」的概念；跨进程缓存过它们就会读到过期值）。把摘要放进 key，任何输入变化
都会让依赖表本身变化 ⇒ miss，等价于旧实现「拼一个复合 key 当文件名」的判等，但复用了
查询图的 trace / cutoff / 会话索引。

`split` 节点的值是 blob 的**内容地址**，载荷落在 `<cache>/blobs/<digest>`（跨包共享）。
命中时按地址读 blob、校验 framing 四段（tag/codec/len/内容地址）后再规范解码；任何不符
⇒ 当作 miss 重算并重写同一路径。坏字节永远进不了解码器。

## 5. 失效与清理

- 失效是**内容寻址 + 依赖快照**的自然后果：源文件、依赖接口、manifest、编译器指纹任何
  一项变化都会让相应节点的依赖表变。
- `vuna clean --store` 清整个 `vuna-cache` 根（`query/` + `blobs/` + `lex/` + 单元缓存），
  不需要认识具体节点。
- 旧布局 `check/`、`split/` 已下线（阶段 2）；阶段 5 会再检视 `vuna clean` 的措辞与
  `nix/checks/compiler-perf.sh` 的断言。

## 6. 当前状态与后续

已落地：纯核心（阶段 1）；`check` / `build` 两个 CLI 入口与 blob 载荷（阶段 2）；
LSP `DiagCache`、REPL `stateToolSession` / `stateIndexCache`（阶段 3/4，见下）；会话索引。

- LSP：`lspiface:<pkg>:<dirHash>` 节点，依赖表 = 校验面 stat（`st:` 键）。
- REPL：`tooliface:<pkg>:<dirHash>`（工具接口）与 `index:<dir>`（源码索引）两个节点，
  依赖表 = 校验面 stat + import 闭包 / stat 快照键；`toolSessionFresh`、
  `sessionClosureOk`、`Index.indexStatsUnchanged` 的启发式与比较函数已删除。
- debug 行统一为 `query-source=` / `query-lazy`。
- `stateAuxCache` **不需要迁移**：`AuxCache` 本来就按
  `dtAuxKey`（包名 + 依赖 iface 哈希 + 干净模块 iface 哈希）自校验，是内容键 memo，
  不是新鲜度启发式缓存。
- `Doc` 没有自有缓存（每次现 parse），`vuna test` 走 `compileToDir` ⇒ 自动吃 split 节点。
- `Index` 已整体接图（阶段 4）：节点 `index:<dir>`（CLI，强依赖 = 逐文件内容哈希）与
  `index-cheap:<dir>`（REPL，stat 键 + 安全窗内容哈希），值 = `Index.Codec` 载荷的 `QRef`，
  落 `<cache>/blobs/<digest>`（codec `index-payload 1`）。`.local/index/` 已下线，
  `Store` 是唯一写盘层；`test/corpus/index/check.sh` 与 `nix/index-check.sh` 已按 blob
  布局重写（不再断言 `.local/index/`）。

仍未做：`debt.md` 只剩 C51（codegen 全量/增量逐字节差异，与图无关）；`VUNA_LEGACY_PATH`
从未实现，已从计划删掉。

## 7. 已知边界

- `Db` 没有「输入可变」概念：需要「同一 key 换值」的场景必须靠声明集合变化触发重算。
- 命中判定要求**声明集合稳定**：调用方漏声明就会漏失效（`queryWith` 的观测表能收窄，但
  收窄的前提是声明集合仍能反映输入面变化）。
- 会话索引是**进程间**缓存；同进程内命中不需要落盘（`sessionSave` 只在提交后写）。
- 并行 / 抢占式取消不在模型内（见 §3 预算说明）。