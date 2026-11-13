# 输入寻址对象库（缓存终态 v2）

本文记录 vuna 现在**唯一的缓存形态**：一切可复用产物都是「按输入摘要寻址的对象」，存在即
命中。没有查询图、没有会话索引、没有依赖快照比较、没有写锁。历史形态（`*.iface` 文件层 +
包级 manifest + 查询图节点）在 git 历史里。

## 三条正交的东西

| 层 | 是什么 | 在哪 |
| --- | --- | --- |
| **payload** | 对象字节（接口载荷、lex tokens、split 产物、工具会话载荷） | `objects/<kind>/<摘要>`、`blobs/<splitIdentity>` |
| **judgment** | 「这个输入算过了吗」= 输入摘要的地址是否存在 | `objects/check/<checkIn>`、`objects/splitptr/<splitIn>` |
| **path / view** | 给人看的渲染，不是身份 | `views/bin/<splitIn>/`、`<pkg>/.output` 符号链接 |

路径可以变（视图、`.output`、`--out DIR`），身份不变（摘要）。

## 存储布局

```
$VUNA_STORE/                       # 唯一根：VUNA_STORE → XDG → ~/.vuna/store → $TMPDIR/vuna-store
  objects/iface/<模块接口地址>      # 模块接口（codec module-iface 4；带实例/方法 span）
  objects/header/<头地址>           # 模块 header（imports + fixities），冷启动快路径
  objects/lex/<源摘要>              # lex tokens
  objects/order/<包摘要>            # 该包的模块顺序（split 串接要精化顺序，不是拓扑序）
  objects/check/<checkIn>           # 包级判定 marker（空载荷）
  objects/tool/<工具会话地址>       # LSP / REPL / vuna map 的会话载荷
  objects/mods/<闭包摘要>           # 模块接口地址表（冷 check 的 assign 快路径）
  objects/test/<测试判定 key>       # test verdict（通过/失败计数）
  objects/pkgiface/<key>            # 依赖接口身份摘要（key = 包名 + lib 源闭包 + 编译器 tag）
  objects/splitptr/<快 splitIn>     # 产物快指针：源输入 → 语义产物身份（注释复用 codegen）
  objects/pkg/<64hex>               # 取包对象族（`pkg-source 1`，见 package-store.md）
  blobs/<splitIdentity>             # 构建产物（split 文件集，规范拓扑序）
  units/<包哈希>/e-<h>-<h>/         # split-unit 缓存（按声明摘要命中）
  views/bin/<splitIn>/              # 构建视图（产物真身，含 .complete）
views/testbin/<testBin>/          # effect 测试编译产物（bin/vuna-test，含 .complete）
  pkgs/<64hex>/                     # 包物化视图（可删可重建）
  roots/<项目摘要>/<digest>         # 该项目的保留集合（每个 digest 一个文件，GC 用）
  .tmp/                             # 视图锁与暂存（可删）
  tmp/                              # 取包中转（可删）
```

缓存族 = `objects/{iface,header,lex,order,check,tool,mods,test,pkgiface,splitptr}` + `blobs` + `units` +
`views` + `.tmp`；包对象族 = `objects/pkg` + `pkgs` + `tmp`。两族生命周期不同：
`vuna clean --store` / `vuna store gc` 只碰缓存族，`vuna clean --packages` 只碰包对象族
（见 [package-store.md](package-store.md)）。

所有地址 = `addrOf [kind, ...输入摘要]`（`Vuna.Compiler.Addr`，SHA-256）。

## 命中判定

| 场景 | 判据 | 未命中的代价 |
| --- | --- | --- |
| 包级 `check` | `objects/check/<checkIn>` 存在 | 精化一次；成功后写 marker + 登记 roots |
| 包级 `build`（快路径） | `objects/splitptr/<splitIn>` → 语义 blob | 精化一次再按语义 key 判 |
| 包级 `build`（语义产物） | `blobs/<splitIdentity>` 存在 | codegen + 规范排序；成功后写 blob + 快指针 |
| 依赖模块接口 | 按地址读 `objects/iface/<addr>` | 缺任一个依赖模块 ⇒ 回退全量（宁可慢，不用错） |
| 依赖身份（D69） | `objects/pkgiface/<key>` 存在 | 回退 `manifest:<toml 摘要>` 身份 |
| 工具会话（LSP/REPL/`map`） | `objects/tool/<addr>` 存在 | 重建会话载荷 |
| 模块 header | `objects/header/<addr>` 存在 | 解析源码取 header |

`checkIn` / `splitIn` 的输入（缺一不可）：

- 包名 + kind（`exe` / `lib:<导出面摘要>` / `pr0|pr1`）；
- `manifest` = `vuna.toml` 内容摘要（依赖声明、flags、`[export]` 都在这）；
- `src` = **本包**源文件闭包摘要；
- `deps` = 依赖包的**接口身份**（`pkgIfaceHash`；缺接口时回退 manifest 摘要）；
- `ver` = 编译器版本 + 二进制指纹。

`splitIdentity`（产物身份）的输入：包名 + `pr0|pr1` + `pkgIfaceHash` + `pkgImplHash` +
布局摘要（排序后的定义名/相对文件/startLine）+ 编译器 tag。它不看源字节：注释变更不换
语义 key，行移动换布局摘要，`opaque`/`abstract` 体变更换 `pkgImplHash`。快指针
`objects/splitptr/<splitIn>` 只是「源输入 → 语义产物」的别名，不是身份。

## 哈希命名（定稿）

| 名称 | 输入面 | 角色 | D5 |
| --- | --- | --- | --- |
| `contentHash` | 文件 `(相对路径, 字节)` | 完整性、包对象地址、manifest `hash` | 内容哈希 |
| `ifaceHash` / `miIfaceHash` / `hashOfIface` | 下游可见语义面（span/path、`opaque`/`abstract` 体排除） | 逻辑指纹：依赖失效 | 逻辑指纹（接口面） |
| `implHash` / `miImplHash` | 产物面（含 `opaque`/`abstract` 体，不含 span） | 产物身份 | 逻辑指纹（实现面） |
| `pkgIfaceHash` / `pkgImplHash` | 模块摘要按名排序聚合 | 包接口身份 / 包产物身份 | 身份模型 |
| `identityHash` | 包名 + `[export]` + 依赖摘要 + 文件内容摘要 | 分发/pin 身份（不参与缓存失效） | 身份模型（源） |

## 正确性

- **地址含全部输入**：任何输入变化 ⇒ 新地址 ⇒ 天然 miss。旧对象留着不会被误用。
- **删除任何对象都只影响命中率**：输入寻址下「缺了就是未命中、重算」。所以 GC 是性能问题，
  不是正确性问题——这是整套设计的核心性质（包对象族是例外：删了要重新 fetch）。
- **坏字节进不了解码器**：`Store` 的 framing（magic / tag / codec / 长度 / 内容地址）先校验，
  不符即 `Nothing`；调用方按 miss 处理。输入寻址的 blob 用 `storeReadAsEff` 比对期望地址。
- **产物是输入摘要的纯函数**：依赖模块的 `miDefLocs` 并入位置表（§41 回归）；产物身份
  另把本包 `miDefLocs` 计入布局摘要，行移动必然重建。

## roots 与 GC

- 每个项目一个目录 `roots/<项目摘要>/`，每个受保护 digest 一个空文件（项目 = 规范化绝对
  包目录的摘要）。项目**只追加**；没有读-改-写，并发 check/build 不会丢 root。
  GC 扫所有项目目录里文件名的并集——A 不需要知道 B 的存在。读取侧兼容旧的单文件布局；
  写侧遇到 `roots/<项目>` 是文件时先读 digest 列表、删文件、建目录（seed rotation 里
  stage0 用旧布局、stage1 用新布局，必须能平滑接上）。
- 登记的时机：check 判定 marker 提交后、build 的 split blob 提交后、`vuna fetch` 取到包后、
  test verdict 提交后。
- `vuna store gc [--dry-run] [--older-than SEC] [--max-size BYTES]`：
  - 候选 = 缓存族里名字不在保留集合、且 mtime 早于宽限窗口（默认 3600s，覆盖「对象已写、
    root 还没写」的崩溃窗口）；`objects/pkg/` 永不进入候选（包对象族归 `clean --packages`）；
  - `views/bin/` 只能**整目录**淘汰（`.complete` 还在时删单文件会让半截视图看起来完整），
    目录名参与 roots 保护；
  - `--max-size` 有值时按 mtime 从旧到新淘汰（文件与 view 目录都计入总量），直到降到上限以下。

## 并发边界（views / units）

- **views/bin**：同一 `splitIn` 的构建用 `mkdir` 锁（`$VUNA_STORE/.tmp/lock-bin-<digest>`）串行化。
  持锁者**直接在最终视图路径构建**（codegen 里的绝对路径保持稳定）；成功后用原子写提交
  `.complete`（内容 = digest），失败则删 partial view 再放锁。等锁者轮询 `.complete`，
  拿不到锁且超时才报错。显式 `--out` 不经过视图锁。
- **roots**：逐 digest 文件（见上），不需要锁；GC 的宽限窗口覆盖「对象已写、root 还没写」。
- **units**：只做**当前 entry 桶内**的旧 key 清理；不再跨 entry 删目录。并发构建不同入口
  不会互相驱逐。桶的容量由 `vuna store gc`（按 mtime / `--max-size`）或
  `vuna clean --store` 管理；删除 unit 只是重算，不影响正确性。

## 观测

| 标签 | 含义 |
| --- | --- |
| `cache-path=hit` / `cache-path=miss` | 包级 check 判定结果 |
| `split-pointer-hit` | build 命中快指针（源码未改动，零精化） |
| `split-identity-hit` | 精化后命中语义产物 blob（注释类改动复用 codegen） |
| `dep-identity=<pkg> verdict=iface\|manifest` | 依赖身份取自 `objects/pkgiface` 还是 manifest 回退 |
| `iface-write=N/M` | 本次真的写盘的接口对象数（内容未变的写入不计） |
| `iface-skip partial` | 这次 check 只覆盖部分模块（入口闭包），不写接口，等库面那遍写全 |
| `iface-reject=module-order` | 依赖包缺 `objects/order`，无法确定模块顺序 ⇒ 回退全量 |
| `cache-own-clean=N` | 本包可复用的干净模块数 |
| `tool-closure modules=N` | 工具会话的 import 闭包规模 |
| `store-gc candidates=… delete=… total=…` | GC 决策 |

`--debug-perf` / `VUNA_DEBUG_PERF=1` 打开。

**已删除的观测能力**：查询图时代的节点 span / trace / 预算 / 取消（`query-span`、
`--debug-query`）随图一起删除。现在排查「为什么 miss」靠比对地址：`addrOf` 的输入项都在
上面的表里，逐个对即可。

## 已知边界

- **warning 不持久化**：命中判定会跳过精化，警告因此只在未命中的那次出现。`-W` /
  `--deny-warnings` 直接绕过判定（不判命中也不提交）。
- **入口-only 包不写接口**：单文件夹具没有可复用的库模块面，写接口会让后续阶段命中缓存而
  跳过精化，`UN_UnusedImport` 这类只在精化期产生的诊断会静默消失。
- **模块顺序是显式对象**：split 串接要精化顺序，而 import 图有环（`base`/`compiler` 都有），
  拓扑排序给不出唯一顺序 ⇒ 写侧把顺序存成 `objects/order`，读侧照它排列。
- `VUNA_ELAB_FULL=1` 强制全量精化（排障 / A-B 对拍）；`VUNA_IFACE_AUDIT=1` 在同一进程跑
  摘要与全量两条路径并逐字节比较诊断与产物。
