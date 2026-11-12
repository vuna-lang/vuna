# 模块级精化缓存（TTC 思路）

本文记录 vuna 的**模块级接口摘要**——对照 Idris2 TTC 的模块化精化缓存：目标、数据流、
不变量、失效判定与仍缺的部分。包级摘要的历史与实现细节见
[compiler.md §接口摘要](compiler.md)；性能读数见 [performance.md](performance.md)。

## 目标

一次包级 `check` / `build` 不应该重复处理依赖包的源码：

- 依赖包的模块**不 parse、不 resolve、不精化**，只读它的接口；
- 模块的接口以**载荷全量语义哈希 + 依赖接口哈希 + 包级环境指纹**为失效判据；
- 缓存可回退：任一接口缺失/损坏/陈旧 ⇒ 回退全量，宁可慢，不静默用坏缓存；
- **读方实际消费的每个字段都必须进哈希**（§不变量的第 1 条）；新增字段忘了接进哈希 =
  下一类「载荷变了、哈希没变」的陈旧复用；
- 间歇性错误必须可捕获：`VUNA_IFACE_AUDIT=1` 在同一进程分别跑摘要路径与全量路径，
  诊断/产物逐字节比较（排障与 CI 用，默认关闭）。

## 对照 Idris2 TTC

| 方面 | Idris2 TTC | vuna 现状 |
| --- | --- | --- |
| 单位 | 每模块一个 `.ttc` | 每模块一个 `<源文件相对路径>.iface`（与源码同布局）+ 包级 `.vuna-iface`（S3/S8） |
| 接口内容 | 接口 + 编译后定义（case tree）+ metadata + import hashes | 闭合精化产物（datas / defs 含 body / globals / insts / classes）+ **已解析源码声明** + exports / fixities / imports |
| 失效 | 源哈希 + 依赖 `ifaceHash`（public/inline 定义体参与） | 模块源码哈希 + `miDepHashes`（直接 import 的接口哈希）+ 包级 `pmEnv`（`vuna.toml` / 传递依赖 / 编译器标签）；`miIfaceHash` 覆盖**载荷全量语义面**（exports / imports / fixities / record 头 / datas / defs / globals / insts / classes），只排除 span/路径 |
| 加载 | 读 `.ttc`，不读源 | 读接口；依赖模块以「已加载模块」注入 Loader（零 parse/resolve） |
| 上游变化 | `importHashes` 链 | `miDepHashes` 链（包内模块也参与） |
| 下游 | 编译器从 TTC 生成代码 | 同一份 `DtProgram` 视图（依赖 artifacts 来自接口）→ `Codegen.Split` |
| 版本 | TTC header/version | `ifaceSchema`（字段布局 + 哈希输入集合；当前 `vuna-iface 21`）+ 编译器 fingerprint + 包名 + `pmEnv` |
| 来源 | 无 | 条目 `meOrigin`（`pkg` = 整包 check/build，`tool` = LSP/REPL 单模块写回）；命令行只信任 `pkg` |
| 快判 | TTC 在构建目录、mtime/hash | 默认在源文件旁（`<pkg>/lib/.../X.iface` + `<pkg>/.vuna-iface`）；`VUNA_IFACE_DIR` 可整体镜像到外部根。默认内容哈希，`VUNA_CACHE_MTIME=1` 时 mtime+size 快路径（距 now <5s 的文件仍回读内容哈希，见下） |

**唯一实质字段差异**：vuna 的接口多存 `miDecls`（已解析源码声明）。原因：vuna 的 record
语法降级（`Elab.Records.prepareDeclsWith`）与终止性 SCT（`Elab.Termination`）都工作在源码
AST 上；Idris2 的对应阶段吃编译后的 case tree。vuna 的等价物就是 resolved 子句，因此把
它作为接口的一部分（也顺带让依赖模块的 record 头 / 终止性上下文可用）。

## 哈希格式（D5）

- **内容摘要 = SHA-256**（`Iface.shaText`，64 位小写十六进制）。`ifaceHashVersion` 参与
  哈希输入：摘要算法、规范编码或段集合变化时递增，旧接口自然换代（与 `ifaceSchema`
  分工：schema 管载荷布局，版本管摘要/编码口径）。
- **哈希输入是显式规范编码，不再是 `prim_marshal`**（C32 的哈希输入侧，
  `Vuna.Compiler.Canonical.{Bytes,Term,Ast,Elab}`）：原子文法 = `#tag;` / `i<n>;` /
  `s<字节长>:<原始字节>` / `b0|b1` / `[<n>:…]` / `0|1…`，自定界、与编译器/OCaml 版本
  无关。编码器是累积器（difference-list）风格，`strConcatMany` 一次拼接，整体 O(字节数)。
- **span / 源路径不参与**：`Canonical.Term` 丢弃 `TVar` 的位置，`Canonical.Elab` 丢弃
  ctor / inst / import / fixity 的 span。旧实现 Marshal 整个 `Term`/`DtCtor`/`DtInst`，
  移动代码（行号变化）会让依赖方判脏——这是本版修复的实质缺陷。
- **排序键改用语义键文本**（`sortByText`）：同一集合在「全量 / 增量」两条路径上的列表
  顺序可能不同（globals 由干净模块产物 + 本次精化产物拼接），接口哈希不能因此漂移；
  文本排序同时消除了「两个名字的哈希值碰撞 ⇒ 顺序歧义」这一类隐患。
- **覆盖读方消费的全部字段**：导出表（含 `ExportEntry.parent`）、fixity（含别名目标
  `fixityTarget`）、record 头（含字段类型表达式）、**`miDecls` 整段已解析声明**都进哈希。
  旧实现漏了 parent、fixity 目标与 decls（C47）。
- **`miIfaceHash` 是 Merkle 摘要**：各段编码后 `digestParts`（长度前缀拼接）做一次
  SHA-256。MB 级段先 `prehashOfString` 折叠（4 lane 63-bit 多项式，非密码学）再 SHA-256，
  避免逐字节 SHA 成为 check 的新热点（实测 check-all 会 +1.1 s）。
- **版本分工**：`ifaceHashVersion` 管接口哈希的段集合与编码口径；`checkCacheSchema` /
  `unitCacheSchema` / `lexCacheSchema` 各自管对应缓存键的口径；二进制换代由
  `ifaceCompilerTag`（版本 + 编译器指纹）与各 cache tag 兜底。任一变化都必须换代。
- **源内容哈希 `siHash` 同一函数**（预哈希 + SHA-256），与 `miIfaceHash` 共用一套规范。
- **大输入用内容键，不逐字节跑语言内 SHA**：`check` 的缓存 key 每轮要对全部源文件取
  内容摘要（81 个模块 + 依赖闭包）。直接 `digestOfString`（语言内 SHA-256）会让 warm
  `check compiler` 从 ~25ms 抬到 ~430ms；`Hash.contentKey` = **4-lane 63-bit 预折叠 +
  SHA-256 折叠串 → 63-bit 派生键**（`Hash.contentAddress` 是同一折叠的十六进制地址），
  实测 warm 回到 ~37ms、cold 6.7s（与 HEAD 基线 8.2s 同量级）。预哈希是非密码学函数
  （与 `CacheFormat` 同一威胁模型），顶层摘要仍是 SHA-256。
- **roundtrip 自证**：每个编码器都有对应 `dec*`，`examples/infra`（§64）断言
  `encode (decode (encode v)) == encode v`，以及「只差 span 的两个值编码相同」。
- **依赖链自愈**：`miDepHashes` 记录写接口时各依赖模块的摘要；依赖接口不可得时记哨兵
  `depMissingHash`。带哨兵的接口**判脏并重写**（workspace 并行检查下依赖可能后写，
  必须先保守重算一次），链校验跳过哨兵项。
- **载荷存储也是显式编码**（C32 已关闭）：`ModuleIface` / `CachedProgram` / `SplitFile` /
  `List PTok`（词法 token 流，见下「lex 缓存」）与哈希输入侧共用 `Canonical.*` 的同一套
  原子文法，外层套 `Store` 的 framing（见下「存储与 key」）。解码器不再只服务 roundtrip
  自检，它是唯一读路径；缓存面没有任何 `Marshal` 参与。

## 数据流

### 写侧（一次成功的 check / build）

```text
Dt.check（全量或摘要路径）→ CheckedPackage = { DtProgram, modules, entryDecls, inherited }
  → Driver.Compile.writeIfaceShadow
      ifaceOfPackage：按 Module 归属把 DtProgram 切成每模块 CachedProgram
        （归属表来自 Driver.Owner：声明名 / 实例名 / 派生实例 / trait 投影 / Dict_）
      → 逐模块 hashOfParts（exports / imports / fixities / record 头 /
        miDecls / datas / defs / globals / insts / classes；不含 span / 源路径）→ miIfaceHash
        （各段先按语义键文本排序，再由 `Canonical.*` 编码；内容摘要 = **SHA-256**
        （`Iface.shaText`）；排序是插入排序 O(d²)，单模块数千项时是已知边界——逐项哈希的
        交换律折叠实测在真实包上更贵，见 [performance.md](performance.md) §4/§9）
      → 逐模块 miDepHashes（直接 import 的接口哈希；包内模块边算边进表）
      → 包级 PackageManifest（schema / compiler / package / **pmEnv** / modules）→ 原子写
        `.vuna-iface`（包级锁内：`$TMPDIR/vuna-cache/<pkgHash>/iface.lock`，60s 过期可在
        崩溃后抢占；拿不到锁 ⇒ 跳过本次写入，只读降级）
  → 覆盖性检查：本包模块拥有的 artifact 必须全部进摘要（归属漏项 ⇒ 不写，回退下次）
```

**写侧复用读侧结果**：check 前段判「干净模块」时已经完整读过一次本包 `.vuna-iface`
（`ownCleanInfo`，同时返回 clean 列表与「旧接口可读」标志）；`writeIfaceShadow` 复用同一份
结果，`writePackageIface` 拿标志决定是否信任旧 manifest 做按模块跳过，不再把整包接口
解码第二/第三遍（2026-11：`check compiler` 的 iface-write 244 → 16 ms）。

### 读侧（依赖接口可用时）

```text
Driver.Compile.depIfacesOf
  ├─ 逐依赖包读该包的 `.vuna-iface`，校验 schema / 编译器指纹 / 包名 / **pmEnv**
  ├─ depIfaceSourcesValid：每个模块源内容哈希 = 接口记录；且当前源码模块集合 == 接口模块集合
  ├─ depIfaceChainValid：每个模块记录的 miDepHashes 等于当前闭包里同名模块的 miIfaceHash
  ├─ （镜像模式）readModuleFile 校验文件名 token == 条目 miIfaceHash
  └─ 全部通过 ⇒ Just (List ModuleIface)
      → Dt.dtCheckPackageWithIfacesParts / dtSplitProjectWithIfaces
          • modulesOfIfaces：接口 → 已解析 Module（reverse topo 注入 Loader 模块表）
          • Loader.loadProjectWithPreloaded + resolveProjectKeeping：命中种子模块，不读源码
          • depStartOf (mergeCachedPrograms ifaces)：依赖 artifact → 起始 Ec / globals
          • termAux = 依赖模块的 miDecls：record 头与终止性上下文（与全量路径同一语义）
          • 只精化本包模块 → DtProgram / SplitFile
      → 写本包接口（depHashes 来自已验证的依赖接口）
```

任一校验失败或接口缺失 ⇒ 全量路径（`loadProject` + 全量精化），并重新写接口。
`VUNA_ELAB_FULL=1` 强制全量；`VUNA_IFACE_AUDIT=1` 在同一进程跑摘要 + 全量并逐字节
比较（不一致 ⇒ `iface-audit-mismatch subject=... at=...` 且**不写缓存**）。

所有拒绝路径都带统一归因码 `iface-reject=<code>`（`dep-manifest-miss` / `dep-invalid` /
`dep-chain` / `dep-tag` / `dep-env` / `own-env` / `self-hash` / `tool-origin` / `tool-chain` /
`tool-manifest-*` / `lock` / `compute` / `readonly` / `path` / `empty-package`），
配合 `--debug-perf` 可定位「为什么回退了」。原 `cache-dep-*` / `iface-skip` 片段保留在行尾
（既有测试按子串匹配）。

## 不变量

1. **接口字段必须闭合**：`cachedProgramValid` 保证 datas / defs / globals / insts / classes
   无未解 meta、无负索引、无自由变量；擦除位残 meta 仍按包段重编号（见
   [compiler.md](compiler.md) §硬不变量）。
2. **`deftbl` 只装定义体**：签名项进 deftbl 会让 `force` 把 `Int`/`String` 归约成 `Type`
   （C37 的 `Eq Type` 假歧义根因）。
3. **接口哈希不含 span / 源路径，但必须覆盖读方消费的全部语义字段**：换行、注释、
   checkout 路径变化不失效；exports（含 parent）、imports、fixities（含
   别名目标）、record 头（含字段类型）、miDecls、datas、defs、globals、insts、classes
   全部参与。历史缺口：`hashExports` 定义存在但从未接线（§44m 回归）；`ExportEntry.parent`、
   `FixityDecl.fixityTarget`、record 字段类型与 `miDecls` 曾整段不进哈希（C47），现已由
   规范编码补齐。
4. **归属表必须覆盖全部 artifact**：写侧做覆盖性检查；漏项不写接口（安全阀）。
5. **依赖接口哈希链必须闭合**：包内与跨包都按直接 import 校验；缺项（`-1` 哨兵）永不失配。
6. **摘要路径的 `Err` 必须上报**：只有「接口不可用」才回退全量，本包真实错误不得被吞。
7. **依赖模块零 parse**：接口模式下依赖模块只被 read（算哈希），从不 `parseFileWithPath`；
   `--debug-perf` 的 `parse-module=<name>` 计数可验证（测试 §44 断言 `Dep` 未被 parse）。
8. **包级环境指纹（`pmEnv`）必须校验**：自身 `vuna.toml` + 传递依赖（名字 / 规范化目录 /
   toml 内容）+ 编译器标签。`[export]` / `[diagnostics]` / `[dependencies]` / flags 不改变
   模块源哈希，只能靠它整包判脏（§44n）。manifest 能力/信任/特权 section 已删除，其从
   `pmEnv` 语义中移除使 `ifaceSchema` 20→21、`ifaceCodec` 1→2、`ifaceHashVersion` 4→5
   （旧接口自然换代，不会与新代码互读）。
9. **产物来源（`meOrigin`）决定命令行是否可信**：`pkg`（整包 check/build）与 `tool`
   （LSP/REPL 单模块写回）分开；`check`/`build` 只复用 `pkg`（§44p）。工具产物下一次整包
   写回归为 `pkg`。
10. **镜像模式文件名自证**：文件名是 `<stem>-<ifaceHashToken>.iface`，读侧要求 token 与
    条目 `meIfaceHash` 一致。同一路径永远不可能承载两份不同内容 ⇒ 消除「布局/半写错位」。
11. **载荷可自证**：`hashOfIface` 从已存载荷重算哈希，`VUNA_IFACE_SELFTEST=1` 时在写侧
    读回与读侧判净都校验；失败即拒绝（不静默用坏缓存）。默认关闭（O(payload)，CI 开）。

## 存储与 key

```text
# 默认：接口文件落在**构建产物目录**（gitignored；`vuna clean --iface .` 批量清理）
<包目录>/.output/iface/<编译器指纹>/lib/Base/Int.iface   # 源文件 lib/Base/Int.vuna 的接口（显式编码，原子写）
<包目录>/.output/iface/<编译器指纹>/.vuna-iface          # 包级 manifest（模块名 → 相对路径/源信息/接口哈希）
#   按编译器指纹分桶：seed / nix 产品二进制 / 本地构建产物各自命中自己的接口，
#   交替使用不再互相失效（此前同布局写在源树旁，三者互踩 ⇒ 每次全量精化 5–7s）。
#   指纹随二进制变化 ⇒ 旧桶会残留（每个几十 MB 量级），`vuna clean --iface` 清。

# VUNA_IFACE_DIR=R 时：整体镜像到外部根（内容寻址，适合持久化/共享/多步工具）
<R>/<包绝对目录>/lib/Base/Int-<ifaceHashToken>.iface
<R>/<包绝对目录>/.vuna-iface
#   同一模块的新旧版本各占一个文件名；manifest 是唯一索引（最后原子写 = 提交点），
#   未被引用的旧 token 在 mtime 超过 60s 后由孤儿 GC 删除（写侧、锁内）。

# 其余缓存仍在 $TMPDIR/vuna-cache/（按包名哈希，与本布局无关）；目录名 = 语义 key，
# 文件内头再记载荷内容地址（身份与完整性分离，见下）
$TMPDIR/vuna-cache/query/<hashText(hashContentKey(包名))>/index          # 查询图会话索引（check / split 节点，codec `query-index 1`）
$TMPDIR/vuna-cache/blobs/<64 位十六进制内容地址>                            # codegen 产物 blob（内容寻址、跨包共享，codec `split-files 1`）
$TMPDIR/vuna-cache/<hashText(textHash(包名))>/split-units/e-<entryId>/<unit>.unit  # 单元缓存
$TMPDIR/vuna-cache/lex/<hashText(lexKey)>                                          # 词法 token 流缓存（含编译器 tag）
```

check 结果与 codegen 产物都由**查询图节点**承载（阶段 2）：节点 `check:<pkg>:<kind>`（值 `QMarker`）与 `split:<pkg>:<pr0|pr1>`（值 `QRef` = blob 内容地址），依赖表是四个输入摘要（manifest / 源闭包 / 依赖接口闭包 / 编译器版本+指纹，见 `Driver.Graph`）。命中判定走 `Query.queryHit`，会话索引按包桶持久化。check 结果节点只记录「同输入下曾经成功」，**不含 warning**；请求告警
（`-W` / `--deny-warnings` / manifest `[diagnostics] warnings`）时 `checkPackage` 跳过
check 缓存、并把摘要路径的「干净本包模块」表清空（本包模块全部重新精化，依赖包仍从接口
预置），因此该次 check 不是 27ms 的命中路径，而是「摘要路径 + 本包重算」。普通 check
不受影响。check 节点的载荷是**空 marker**（值即 `QMarker`），命中路径从不读内容；「写 1–4MB
`CachedProgram` 但没人读」的写放大在 C32 已关闭。codegen 产物只在未命中时写一次 blob，
而 blob 是内容寻址的 ⇒ 同一产物被多个 key 引用时只存一份。

**载荷 framing（`Store`，唯一落盘层）**：所有缓存载荷都由
`Vuna.Compiler.Store` 承载，格式

```text
vuna-cache-frame 2|<tag>|<codec>|<len>|<64 位十六进制内容地址>\n<payload>
```

- `tag` = `<schema>/<编译器 tag>`（schema 管载荷布局，编译器 tag = 版本 + 指纹）；
- `codec` = 载荷编码族（如 `module-iface 1` / `package-manifest 1` / `split-files 1` /
  `lex-tokens 1` / `check-marker 1`）；
- `len` 与 `<payload>` 的字节数必须相符；内容地址 = `Hash.contentAddress payload`。
- 读侧**只扫头行**（首个换行之前，限 512 字节），逐项校验 magic / tag / codec / len /
  内容地址；任一不符 ⇒ `Nothing`（视为 miss、重算并覆盖），绝不把任意字节喂给解码器。
  校验内容地址**不重算 MB 级 SHA-256**：调用方若已知期望摘要（iface manifest 的
  `mePayloadDigest`），传预期值直接比字符串即可（`storeReadAsEff`）。
- 载荷本身是 `Canonical.*` 的显式原子文法（`#tag;` / `i<n>;` / `s<len>:<bytes>` /
  `b0|b1` / `[<n>:…]` / `0|1…`），自定界、与 OCaml 版本无关；解码失败即 miss。

**key 与可移植性**：接口文件的 key 就是**包目录 + 相对源路径**，不再用包名哈希。默认布局
下文件就在源码旁（`<stem>.iface`，路径固定），同一包在相对/绝对/含 `..` 的不同写法下指向
同一份文件；同名不同目录的包也天然各占一棵树。`VUNA_IFACE_DIR` 模式用**规范化绝对包目录**
（lexical 归一、不解析 symlink）镜像，文件名再带内容哈希（`<stem>-<token>.iface`）：换
checkout / 移动目录只是 miss（回退全量），不会误用；symlink / 挂载别名会各存一份。manifest
里的 `meFile` 是相对路径（换机器 / 复制源码树仍可命中，只要源内容不变）；读侧校验它必须
是相对路径、无 `..` 段、`.iface` 后缀（防篡改穿越），镜像模式下还要求 token 与条目哈希一致。

**只读降级**：写侧写前用一次 `sh`（`mkdir -p` + 逐目录 `test -w`，返回码判定、不抛异常）
探测；不可写（Nix store 只读源树、只读 checkout、`VUNA_IFACE_DIR` 指到只读树）就
`note "iface-skip readonly <dir>"` 并跳过写入，check/build 退出码与诊断不变，下次可写时照常
写。manifest 写去抖：编码后与磁盘逐字节相同则不写（避免默认布局每次 check 都改源树 dotfile
的 mtime）。

**清理**：默认布局会在工作树留下 `*.iface` / `.vuna-iface`（`.gitignore` 已忽略）；
`vuna clean --iface [--dry-run] [DIR]` 按文件名批量删除它们（以及原子写残留
`*.iface.*.tmp`），不碰 `.vuna` 源码；`vuna clean --store` 另清 `/vuna-cache`。

**per-module 写**：写侧只重写「接口哈希 / 依赖哈希 / 来源」变化（或文件缺失）的模块，
manifest 最后原子写 = 提交点；读侧先读 manifest，再逐模块读文件并校验「相对路径 ↔ 记录名
/接口哈希」，缺件/损坏回退全量。`VUNA_IFACE_SELFTEST=1` 打开写侧自检（读回 + 模块名集合
/接口哈希一致 + `hashOfIface` 载荷自证），失败让 check 失败；`VUNA_DEBUG_PERF=1` 等价于
`--debug-perf`（给 `vuna-compiler` 这类不经过 `Vuna.Cli` 的入口用）。写侧 `ifaceOfPackage`
对 DtProgram 只做**一遍** owner 分桶（`ProgParts`），coverage 用 `HashMap`；整包 sols 表只
建一次供逐模块 zonk 复用——iface 阶段因此从 ~1.44s 降到 ~0.22s。

**并发**：同一包的写入在 `$TMPDIR/vuna-cache/<pkgHash>/iface.lock`（`mkdir` 原子）内串行；
锁 60s 过期可抢占（崩溃残留），拿不到锁就跳过本次写入（`iface-reject=lock`，只读降级）。
镜像模式的孤儿 GC 也在锁内做：只删 manifest 未引用且 mtime 超过 60s 的 `*.iface`，
避开「先写内容文件、后写 manifest」的中间态。

`VUNA_CACHE_MTIME=1` 开 mtime+size 快路径：记录/当前 mtime 距 **now** <5s 的文件回落内容
哈希（同秒同大小编辑必失效），更老的文件才用 mtime+size。默认路径仍是内容哈希；实测快路径
在缓存命中路径上的收益 <5%，故保持 opt-in（测试 §51 覆盖同秒同大小编辑）。

## 包内逐模块增量（S4）

接口文件 per-module 后，包内检查/构建不再无条件整包重精化：

1. **脏/净判定**（`Driver.Compile.ownCleanModules`）：模块干净 ⇔ 条目来源是 `pkg` ∧ 源
   内容哈希未变 ∧ 闭合产物有效 ∧ 载荷自证通过（SELFTEST）∧ 它记录的每个直接依赖接口哈希
   仍成立（外部依赖对比当前接口表，同包依赖必须是**已判定干净**的模块）。脏性沿 import 边
   保守传播：干净模块只依赖干净模块，一个模块变脏会让依赖它的模块也判脏（接口哈希可能变，
   不做乐观复用）。工具写回的 `tool` 条目对命令行等价于脏（§44p），但工具会话自己可用。
2. **只精化脏模块**（`Driver.Dt.dtCheckPackageIncrementalParts`）：干净模块以「预置模块」进
   Loader（零 parse/resolve），闭合产物并入起始 Ec；起始 meta 编号放在干净模块残 meta
   之上（干净记录不重编号，保持接口哈希稳定）；只喂脏模块 decls + 入口声明，干净 decls 与
   依赖 decls 只作终止性/record 上下文。
3. **合并回整包**：codegen 与接口写仍看整包 `DtProgram`（干净产物 + 本次精化产物）；模块
   列表显式 DFS 拓扑排序后交给 split 生成器（依赖在前）。
4. **收敛**：脏模块重写时同时更新 `miDepHashes`（manifest 记录依赖哈希，写判定同时看接口
   哈希与依赖哈希）；下一次运行全部干净、零重写。实测 base 副本改一个叶子模块：
   冷 268ms → 增量 64ms → 全干净 50ms（全量 210ms）。

A/B：`VUNA_ELAB_FULL=1` 强制全量；`check`/`compile` 的增量与全量结果对拍（诊断逐字节、
manifest 逐字节、codegen 目录 `diff -r`）见测试 §44f。

## LSP / REPL 消费接口（默认开启，会话缓存 + 单文件增量）

`VUNA_IFACE_TOOL=0` 显式关闭（排障/A-B）；默认开启。LSP 诊断链与 REPL 求值把「本次源码
import 闭包需要的模块接口」作为预置模块交给 Loader（`dtCheckSourceWithIfaces` /
`dtEvalExprInfoWithIfaces`）；接口缺失/失效自动退回全量。

**惰性读（S7）**：manifest 自带每模块的直接 import 名（schema `vuna-iface 12`）。工具路径
先只读依赖包的 `.vuna-iface`（校验 schema/编译器指纹/包名/`pmEnv`/源哈希），按 entry（含
隐式 Prelude）的 import 闭包算出需要哪些模块，再只 unmarshal 这些文件；仍按 `miDepHashes`
链校验。

**闭包完整性**：闭包起算集并入**同包模块自己的 import**（本包 manifest 的
`meImports`）；`Dt` 侧安全阀在加载后发现任一依赖模块缺 artifact 时整条回退全量（宁可慢，
不静默给假 `TC_UnknownName`）。REPL 路径同时补回依赖 datas/defs 并精化同包源码模块 decls。

**单文件增量精化**：LSP 请求先取本包干净模块（源哈希 + 依赖哈希未变）与依赖 iface 作为
预置，只精化当前 buffer（`dtCheckSourceIncremental`）；只对本次新精化的 datas/defs 跑
诊断检查链，终止性 SCT 只喂 aux 的 data/record 头与投影；成功后写回**当前模块** iface
（merge 写、原子写；写回失败不影响诊断）。没有 iface / 脏依赖 / buffer 与磁盘不一致时
自动回退全量。

**会话缓存**：`LspState`/`ReplState` 持有 `DiagCache`：包上下文、依赖 ifaces、
prepared termAux、起始 Ec、干净模块、fixity env 与校验面（编译器指纹 + 包名 + 闭包源 /
manifest 的 mtime+size；安全窗内回读内容哈希）。无 watcher ⇒ 每请求惰性 stat 校验，外部
改任意依赖文件后下一次请求必然失效重建（测试 §44l 覆盖）。实测本仓库（16 核）：

- LSP 单次编辑：compiler 最大文件 ~0.12s、根包普通文件 ~0.02s（会话热）；同内容重复请求
  0–5ms；首次请求（建会话 + 首轮增量）~1.1–1.5s；
- REPL：轻量求值 ~30ms；重 import（4 次求值）~4.2s。

**单模块写回（结构性隔离，C37 关闭）**：LSP/REPL 写回的条目带 `meOrigin = "tool"`。
命令行 `check`/`build` 只复用 `pkg` 条目（`iface-reject=tool-origin`），因此「增量上下文
算出的接口哈希与整包 check 略有差异」不再可能被命令行消费——不再依赖「首次整包 check
自愈」这种条件触发。工具会话内部仍可用 tool 条目（热路径收益保留）。下一次整包
`check`/`build` 会把该模块重写成 `pkg`（`writeModules` 的 unchanged 判定包含来源）。
测试 §44p 覆盖：冷启动写回 → `tool` → check 拒绝 → 重写为 `pkg`。
接口摘要仍剩的缺口只是擦除位置残留未解 meta 的包段重编号（见 debt C37 的历史说明）。

## codegen 单元级缓存（S5/S7，默认开启）

`VUNA_UNIT_CACHE=0` 显式关闭；默认开启。`build` 在包级 split 缓存未命中（包内一个模块变了）
后不再重新生成所有单元：每个 `SplitFile` 按 **单元 key** 缓存在
`$TMPDIR/vuna-cache/<pkg>/split-units/`。**按 entry 分桶**：目录为
`.../split-units/e-<entryId>/`（entryId = 包名 + 入口路径，不是内容哈希——入口内容变化仍
复用同桶）；单元 key = 单元名 + 模块声明内容哈希 + 依赖单元 key 传递哈希链 + `printResult`。
写/读前 GC 只保留当前 entry 桶（清掉旧桶与旧布局散落文件）；**桶内**按「本次全部单元
key」保留文件、旧 key 清除，因此连续编辑不会让桶无限增长（测试 §53）。生成结果规范化为
确定性拓扑序（深度分层 + 同层名字哈希，依赖同序 normalize），增量与干净重建产物逐字节
一致（测试 §44h/§44j）。

实测（同机预热后改入口）：workspace `build --no-compile .` 中位 3236ms（开）vs 3612ms
（关）→ -10.4%；全量链接 `build .` 6621 vs 7042ms → -6.0%。

## 依赖可见性收敛（S6）

全量路径只加载 entry/本包模块的 **import 闭包**；接口路径为省 parse 会一次性预置整包
依赖模块，若不加约束，未 import 模块的实例/类也会进入求解视图（相对全量过近似）。S6 在
load 之后按闭包过滤模块表：起点 = entry 的全部 imports（含隐式 Prelude/导出根），沿
`moduleImportsOf + moduleImplicitImportsOf` 传递；被过滤掉的依赖模块不再提供接口产物
（`materializedDeps`），干净模块同理（`materializedOwn`），Loader 仍零 parse。摘要路径与
全量路径因此看到同一组模块/实例/类（测试 §44i：trait/实例在未 import 的模块里时两条路径一致
拒绝，import 后一致接受）。

## 已知边界（仍缺的部分）

- **包内逐模块增量已落地（S4）**：干净模块复用、只精化脏模块；剩余是更细的
  headers / bodies 分阶段复用（当前仍以模块为单位）。
- **codegen 单元级缓存已默认开启（S5/S7）**：按 entry 分桶 + 桶间/桶内 GC，产物顺序
  规范化保证增量/全量一致；`VUNA_UNIT_CACHE=0` 可关（测试 §44h/§44j/§53）。
- **LSP / REPL 消费接口默认开启**：惰性闭包 + 会话缓存 + 单文件增量 + 单模块写回已落地
  （见上）；工具产物与整包产物已按 `meOrigin` 结构性隔离。REPL 每条表达式重读
  manifest/iface 的残余已关闭：REPL
  把 `depIfacesForToolSourceDetailed` 的结果连校验面一起缓存在 `ReplState.stateToolSession`
  （key = 编译器指纹 + 包名 + 包目录；复用前按校验面 stat + import 闭包未扩大判定，失效即
  整条重建），因此轻量求值降到 ~6–8ms/条。`:browse` 首次建索引时另在
  `ReplState.stateIndexCache` 记逐源文件 stat 快照，后续 `:browse`/`:info`/`:search` 只重新
  stat 比对（`Vuna.Index.indexStatsUnchanged`：窗口外只 stat、窗口内回落内容哈希），命中就
  不再读全部源码算内容哈希（~6ms vs ~0.6–1.0s）。
- **快判**：默认内容哈希；`VUNA_CACHE_MTIME=1` 提供带 5s 安全窗的 mtime+size 快路径
  （可选、非默认；收益 <5%）。
- **R4（records-v2）**：`DtData` 增加 `dtDataIsRecord`（record 声明来源；`data`/字典族为
  `False`），`miPrepared` 中的 decls **保留 `DRecord`**（不再降级成 `DData`），`miRecords`
  仍是模块的结构化字段表。字段表 / 表示档位 / `dtDataIsRecord` 都进 `miCached`，跨包
  字段访问与表示判定按同一份结论。布局与语义变化 ⇒ `vuna-iface 16 → 17`；`TRecord` 类型
  前导再 bump 到 18。
- **序列化（C32 已关闭）**：载荷用 `Canonical.*` 显式编码（自描述、自定界、无 OCaml 版本
  依赖）外加 `Store` framing（magic/tag/codec/len/内容地址）；损坏、截断、错 codec 都
  在读侧变成 `Nothing`（miss + 覆盖写），不会进解码器，也不再有「同长同校验和 ⇒ 解出错类型」
  的构造性风险。语义面另有三层自证：内容寻址文件名 token、manifest 的 `mePayloadDigest`、
  `miName`/`miIfaceHash` 比对（SELFTEST 下更会做 `hashOfIface` 全载荷自证）。
- **依赖可见性已收敛（S6）**：摘要路径 load 后按 entry/本包 import 闭包过滤模块表，未
  materialize 的依赖模块不提供实例/类，等价于全量路径（测试 §44i）。
- **默认 iface 落在 `.output/iface/<编译器指纹>/`**（构建产物目录，gitignored）：与
  `.ml`/`.cmx`/`build.sh` 同生命周期，删包产物即清缓存；按指纹分桶让 seed / nix 产品
  二进制 / 本地构建产物各自命中，不再互相失效。批量清理用 `vuna clean --iface [DIR]`
  （已覆盖 `.output`）；指纹变化后旧桶不会被自动 GC，需要时手动清。默认布局（路径固定）
  的模块删除/改名孤儿不会被自动 GC（读侧只看 manifest，孤儿不参与）；镜像模式的内容寻址
  文件由写侧孤儿 GC（mtime > 60s 且未被 manifest 引用）清。
- **判据维护成本**：新增接口字段时必须同时接进 `hashOfParts`（或在文档里写明为什么不需要），
  否则就是下一类「载荷变了、哈希没变」。`ifaceSchema` 的语义已扩为「字段布局 + 哈希输入
  集合」，两者任一变化都要 bump（当前 `vuna-iface 21` / `module-iface 2` /
  `vuna-iface-hash 5`；manifest 能力/信任 section 删除即一次这样的 bump）。
- **其余缓存仍是 TMPDIR + 包名哈希**：check / split / split-units 按包名哈希隔离
  （`VUNA_IFACE_DIR` 只影响 iface），跨项目同名包在 TMPDIR 缓存上仍可能互相覆盖（各自
  回退，正确性不受影响）。
- **`lex` 缓存的 key 含编译器指纹（C48 已关闭）**：`lexKeyOf` 的哈希输入是
  `lexCacheSchema\t<编译器 tag>\t<路径>\t<源内容>`，framing 的 tag 段同样带编译器 tag。
  `PTok` / `Tok` 布局不同的二进制（未 rotation 的 seed 与新 vuna、同一 TMPDIR 里的新旧
  二进制）因此各占一套 key 空间，不可能互读对方条目。指纹只在 `Eff []` 的加载入口取一次
  （`Fingerprint.compilerTagEff`），纯函数部分不吃指纹，M4 守卫不受影响。
- **lex 缓存（不是 AST 缓存）**：载荷是 `Lexer` 的 `List PTok`，不是 parse 产物。原因有
  两条：① parse = lex + 语法分析，实测 lexer 占 86%（40 KB 文件 lex 3.96 ms / 全程
  4.59 ms），缓存 token 流就拿到绝大部分收益；② **AST 编码必须丢 span**（它是接口哈希的
  输入，移动代码不能改依赖方摘要），若把 AST 当载荷，缓存命中的进程里所有诊断位置会退化
  成 `:0:0`、codegen 的 `dt_def_locs` 整表变成 `":0"`——缓存改变了用户可见行为。token 流
  自带位置，重放 parse 得到的 AST 与冷路径逐字节相同。**新增缓存载荷时不要用
  `Canonical.Ast` 的 `encSourceFile`**：它只服务哈希输入与 roundtrip 自检。
- **`SourceInfo.siPath` 一律绝对值**：它进接口载荷，而包目录/root 目录可能来自相对入口
  （`vuna check base` vs `vuna check $PWD/base`）。不归一的话同一份源码在不同入口写法下
  算出不同载荷字节 ⇒ `mePayloadDigest` 失配 ⇒ 每次 check 都整包重写接口。写侧
  （`Compile.ownSourceInfos`）与读侧（`Iface.ifaceRelPathOf`）都先 `absolutePath` 归一。
- **擦除位残 meta** 仍靠包段重编号；彻底方案是精化收尾消 meta。
- 接口多存 `miDecls`（见上），文件比 TTC 的「只存编译后定义」更接近源码体积；后续可换更
  紧凑的终止性/record 上下文表示。
- **`defVals` 不参与记忆化**；`DtProgram.dtProgDefVals` 字段保留为空表，
  后续清理 schema 时可一并删。

### 实测成本归因（2026-11，compiler 包，冷/热/编辑后）

`vuna check compiler`（65 模块，依赖 base）三种场景的独立进程读数：

| 场景 | 时间 | 说明 |
| --- | --- | --- |
| 热（包缓存命中） | **27ms** | `checkCacheHit` 直接返回 |
| 无 iface（全量） | **3.1s** | `depIfacesOf = Nothing` ⇒ `dtCheckWithProgramParts` |
| 编辑一个模块后 | **3.5s**（干净 iface）/ **6.8s**（iface 被别的二进制写过） | 见下 |

编辑后的时间**不在精化本身**（临时插桩实测）：`checkAndCache` 的 `elaborated` 标记
之前已经花掉 ~5.6s，而 `depIfacesOf` 为 `Just`、`cache-own-clean=60`（60 个模块都判
干净）。也就是说这段耗时在 `dtCheckPackageIncrementalParts` 内：`termAux`
（60 个干净模块的**源码 decls**）重新跑 `prepareDecls` + `expandDerivings`——`AuxCache`
只在进程内（REPL/LSP 会话）有效，命令行单次调用每次都重付这笔固定开销。之后
`writeIfaceShadow` 写 65 个模块接口再 0.5s。

**多二进制共存曾让 iface 互相失效**（已修）：默认布局过去把 iface 写在源树旁，读侧按
`${vunaVersion}/${compilerFingerprint}` 校验；`seed`、nix 产品二进制、本地
`vuna build` 产物三者指纹不同 ⇒ 交替使用时每次都是「全量 5–7s」。现在默认路径为
`.output/iface/<编译器指纹>/`，三者各自分桶，交替使用各命中自己的接口。

改进方向（按收益）：① 把 `AuxCache` 的 prepared 结果持久化进 iface / 包 manifest，
让包内增量不必重跑干净模块的 record/deriving 预处理（预计 5.6s → ~0.5s）；
② `writeIfaceShadow` 只在「会复用」的上下文里写（CI 一次性检查可跳过，省 0.5s）；
③ 默认 iface 按编译器 tag 分桶（消除多二进制互踩）。

### prepared termAux 持久化（已做，收益不及预期）

`ModuleIface` 增加 `miPrepared`（schema 13）：整包写回时，每个模块把自己的
`prepareDeclsWith` + `expandDerivings` 结果算好存进接口（aux = 同包其它模块 decls +
入口声明；单模块写回/旧接口留空）。包内增量读侧若所有参与模块都带 prepared，就直接
拼接使用，否则回退整表 `dtPrepareTermAux`。

实测（compiler 包，「编辑一个模块后 check」）：**3.3s → 3.3s，没有改善**。原因是
那 3.3s 的主体现在不是 termAux 预处理，而是增量路径的固定成本：

| 增量路径阶段 | 量级 |
| --- | --- |
| `dtLoadModulesPartsIncremental`（Loader + resolve，60 模块） | ~1s |
| `depStartOfAt`（shift 60 个 CachedProgram、组装起始 Ec） | ~0.5s |
| `dtFinishPackage`（整包组装 + `checkDtProgram` 整包 codegen 检查） | ~1.3s |
| `writeIfaceShadow`（写 65 个模块接口） | ~0.5s |

→ 下一个有效项是「check 的诊断用 scoped 检查、但按模块增量组装/写回 CheckedPackage」，
把整包 `checkDtProgram`（cg-partition/erasure/typedecls）从每次编辑后的 rebuild 里去掉；
以及把 `writeIfaceShadow` 限制为只写脏模块。`miPrepared` 仍保留：它是这条按模块组装
路线的前提（组装时同样需要 prepared）。

### 增量路径的 scoped 收尾（已做）

`dtIncrementalCheckedCore` 的整包收尾从 `dtFinishPackage`（组装后对 65 个模块重跑
`checkDtProgram`）换成 `dtFinishPackageScoped`：产物照常组装（写 iface 需要 per-module
的 cp/parts），但 codegen 检查只跑**本次新精化**的 datas/defs。干净模块在它们自己的接口
写回时已跑过同样的检查（依赖包同理），因此诊断语义等价。

实测「编辑一个模块后 check compiler」的增量路径分段（临时插桩，已撤销）：

| 阶段 | 改前 | 改后 |
| --- | --- | --- |
| `ownCleanModules` + `depIfacesOf` | 322ms | 320ms |
| `dtLoadPartsIncremental` | 512ms | 505ms |
| `depStartOfAt` | 497ms | 457ms |
| `dtElabFullWithPrepared` | 225ms | 200ms |
| `dtFinishPackage`（整包 codegen 检查） | **1421ms** | **759ms**（scoped） |
| 写 65 个 iface | ~500ms | ~500ms |
| **总墙钟（含进程启动）** | **~3.3s** | **~2.9s** |

剩下的 759ms 是组装本身（65 个 CachedProgram 的 datas/defs 拼接 + `dedupGlobals`）与脏
模块的 scoped 检查；再往下需要把 `ownCleanModules` / `depStartOfAt` / load 做成跨进程
会话（或持久化起始 Ec），收益与改动都更大。

## 相关阅读

- 包级摘要与 codegen：[compiler.md](compiler.md)
- 性能读数与基准：[performance.md](performance.md)
- 测试口径（§44 摘要路径）：[testing.md](testing.md)
- 开放债务：[debt.md](debt.md)