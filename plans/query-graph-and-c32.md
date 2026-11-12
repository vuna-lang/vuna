# 计划：C32 收口 + 完整查询图（全量接入）

状态：进行中（2026-11-12 起）
范围：`docs/architecture-target.md` 的 D5/D9 与不变量 2/3/9/10；关闭
`docs/reference/debt.md` 的 C32（缓存载荷自描述编码 + 写放大 + 校验和强度）与 C48
（ast 缓存 key 无编译器指纹），并把 `Vuna.Compiler.Query` 从串行骨架升级为唯一增量引擎，
CLI / LSP / REPL / test / doc / index 全部改成它的客户端。

用户已确认范围：**全量接入**（CLI/LSP/REPL/测试/文档都改），不做「只补引擎不接消费者」。

## 退出验收（全部可测）

| 门禁 | 判定 |
| --- | --- |
| 无 Marshal | `grep -R "prim_marshal\|prim_unmarshal\|Marshal\." compiler lib base app` 为 0；生成的 `Vuna_runtime.ml` 不含 `Marshal` |
| 载荷自描述 | 新 steps §70：每类载荷 `decode(encode v) == v`、编码逐字节稳定；单字节篡改 / 截断 / codec 或 tag 不符 ⇒ miss + 重算 |
| 写放大关闭 | check 缓存条目 = marker（0–8 字节载荷）；split/unit 载荷 ≤ 现状（实测 split 5.0 MB、unit 合计 4.6 MB） |
| 单一存储 | 只有 `Vuna.Compiler.Store` 拼载荷文件格式；`CacheFormat` 删除并入 |
| 差分等价 | `VUNA_QUERY_AUDIT=1` 在 repo 与 `corpus/packages/m34_summary` 上：图路径 vs 旧路径诊断逐字节相同、iface manifest 逐字节相同、codegen 目录 `diff -r` 相同 |
| 全量接入 | `--debug-query` 在 `check/build/compile/lsp/repl/test/doc/map` 上都打印节点；`lib/` 不再直接调 `checkPackage`/`compileToDir` |
| 性能 | warm `check compiler` ≤ 43 ms（实测 36 ms ×1.2）、warm `check .` ≤ 78 ms（65 ×1.2）；冷路径相对 `bench/compiler-baseline.txt` ≤ +10% |
| 自举 | `nix flake check` 全绿；阶段 0/收尾各一次 `chore(seed): rotation`，`stage1 == stage2` |
| 单一路径 | 收尾删除 `VUNA_LEGACY_PATH`；仓库不存在绕过查询图的编译入口 |

## 已核实现状（落点）

- `compiler/lib/Vuna/Compiler/Query.vuna`（179 行）：`Db = {HashMap String Entry, trace}`，
  `QVal = QStr|QInt|QList`，纯函数、显式 Db、无 I/O/持久化/取消/并行；唯一消费者
  `examples/infra/app/Main.vuna`（`test/suite/steps/64_infra.steps` 断言 miss/hit/cutoff）。
- `Query`、`Canonical.*`、`CacheFormat`、`Driver.Iface` 都在 seed 闭包内（`nix/seed-files.txt`）。
- Marshal 落盘 7 处：`Driver/Iface`（manifest/模块文件，4 处）、`Driver/Compile`
  （check payload、split files、审计签名）、`Loader/Flatten`（AST 条目）、
  `Driver/PerfCache`（unit）。`lib/` `app/` `base/` `test/` 无用户。
- 实测（本机 16 核，HEAD eddfa51）：`check compiler` 冷 1317 ms / 热 36 ms；
  `check .` 冷根 4336 ms / 热 65 ms；`vuna-cache` 11 MB，单条 check 载荷 3.7 MB + 5.2 MB，
  split 5.0 MB，unit 4.6 MB，ast 136 KB。
- 既有测试对 `--debug-perf` 文本有断言（44a/44b/44e/44f/44g/44h/44j、§52、§59、
  `nix/checks/compiler-perf.sh`、`compiler-growth-pkg.sh`），改语义时必须同步改断言。
- iface 已有语义哈希（SHA-256）、`.vuna-iface` 提交点、`meOrigin`、镜像 token、`pmEnv`、
  `hashOfIface` 自证；`Canonical.*` 已覆盖 `Term`/`Expr`/`Pat`/`Decl`/`DtDef`/`DtData`/
  `DtInst`/`DtClass`/`RecordMeta`/`ExportEntry`/`FixityDecl`/`Import`。

## 决策（落地时写进 `docs/reference/query-graph.md` 与 `docs/reference/cache.md`）

- **D-Q1 身份与完整性分离**（延续 D5）：节点身份 = 语义 key（源码/依赖/编译器 tag/环境指纹，
  与今天同口径）；载荷完整性 = 载荷字节的 SHA-256 内容地址（`Hash.contentAddress`）。
- **D-Q2 只有一套存储**：`Vuna.Compiler.Store` 独占全部载荷落盘（framing v2 + codec 校验 +
  原子写 + GC）；`Iface`/`Compile`/`PerfCache`/`Flatten` 不再自拼格式。
- **D-Q3 依赖快照顺序无关**：`Entry.deps` 按 key 排序比较（旧实现「dep 顺序不同即不同依赖」
  会制造伪 miss）。推翻 `Query.vuna` 头注释第 5 条，同步 §64。
- **D-Q4 大值只存地址**：节点值 > 64 KB ⇒ `QRef digest`，需要内容时从 Store 读。
- **D-Q5 check 缓存只记「同输入曾成功」**：载荷 = marker，消除写放大；
  `cachedOfProgram` 不再进 check 缓存（已由 iface 承载）。
- **D-Q6 删 `prim_marshal`/`prim_unmarshal`**：无兼容义务，从语言面消除「随手序列化」入口。
- **D-Q7 解析缓存去源文本回读校验；载荷是 token 流不是 AST**（实施中修正）：
  key 已是内容地址 + 新增 payload digest，回读校验冗余。原计划缓存 `Canonical.Ast`
  `encSourceFile`，实测会**丢 span**（cached 命中时诊断位置退化 `:0:0`、codegen 位置表
  变 `":0"`），改为缓存词法 token 流（`Canonical.Lex`）：位置保真，且 lexer 占 parse 的
  86%，收益不变。详见「阶段 0 落地记录 · 偏差 1」。
- **D-Q8 `clean-iface` → `vuna clean [--iface] [--store] [--all] [--dry-run] [DIR]`**：
  一个清理入口覆盖树内 iface 与 `$TMPDIR` store。
- **D-Q9 编译器指纹下沉到 `Vuna.Compiler.Fingerprint`**：`Compile`/`PerfCache`/`Flatten`
  共用（关闭 C48，ast key 并入指纹）。

## 阶段 0：C32 收口（载荷自描述 + 存储层统一）

新增
- `compiler/lib/Vuna/Compiler/Store.vuna`：framing v2
  `vuna-cache-frame 2|<tag>|<codec>|<len>|<digest-64hex>\n<payload>`；
  `storeEncode`/`storeDecode`（纯）、`storeReadEff`/`storeWriteEff`/`storeWriteIfChangedEff`/
  `storeRemoveEff`/`storeListEff`/`storeGcKeepEff`/`storeEnsureDirEff`/`storeRootEff`（Eff）。
  校验和 = `Hash.contentAddress payload`（4-lane 预折叠 + SHA-256，与今天同量级成本）。
- `compiler/lib/Vuna/Compiler/Canonical/Source.vuna`：`SourceFile` 载荷 codec
  （`encSourceFile`/`decSourceFileComplete`，复用 Ast 的 Expr/Pat/Decl + Elab 的 Import/Fixity；
  span 丢弃，解码补 `Span "" 0 0 0 0`）。
- `compiler/lib/Vuna/Compiler/Fingerprint.vuna`：`compilerFingerprintEff`/`compilerTagEff`。

codec（就近实现，避免 import 环）
- `Driver/Cache.vuna`：`encCachedProgram`/`decCachedProgram`（复用 `encDtData/encDtDef/...`）。
- `Driver/Iface.vuna`：`encModuleIface`/`decModuleIface`、`encPackageManifest`/
  `decPackageManifest`、`encManifestEntry`、`encSourceInfo`。
- `Driver/Split.vuna`：`encSplitFile`/`decSplitFile`、`encSplitFiles`/`decSplitFilesComplete`。
- check 条目：payload = `""`（codec `check-marker 1`）。

修改
- `CacheFormat.vuna` → 删除（并入 Store）；所有 import 改 Store。
- `Driver/Iface.vuna`：manifest/模块文件改 Store（codec `package-manifest 1`/`module-iface 1`，
  tag = `<ifaceSchema>/<compilerTag>`）；删 `ifaceFileMagic/encodeIfaceFile/decodeIfaceFile`；
  `ifaceSchema` 19 → 20；保留 `.vuna-iface` 提交点、写去抖、token 校验、`meOrigin`、`hashOfIface`。
- `Driver/Compile.vuna`：`checkAndCache` 写 marker（`checkCacheSchema` 7 → 8）；
  `checkCacheHit` 走 Store；`splitSignatureOf` 用 codec 摘要；split 缓存走 Store
  （`splitCacheSchema` 3 → 4）。
- `Driver/PerfCache.vuna`：unit 读写走 Store（codec `split-file 1`）。
- `Loader/Flatten.vuna`：删 `AstCacheEntry`；AST codec `ast-source 1`；`astCacheSchema` 7 → 8；
  key 并入编译器 tag（C48）。
- `Intrinsics.vuna` + `Codegen/Term.vuna`：删 `prim_marshal`/`prim_unmarshal`/`dtp_marshal`/
  `dtp_unmarshal`。
- `lib/Vuna/Clean.vuna` + `lib/Vuna/Cli.vuna`：`vuna clean`（`--iface/--store/--all/--dry-run`）。
- 测试：§52 改 `vuna-cache-frame 2` + 新增篡改 digest 用例；§59 改 `vuna clean`；
  新增 §70/§71。

## 阶段 1：查询引擎 v2（纯核心 + Eff runner + 会话索引）

`Vuna.Compiler.Query`（纯，进 seed）
- `QVal = QMarker | QBytes String | QRef String`；`Entry = {digest, deps(排序), val, origin, hits}`。
- `query`（签名不变、语义不变）、`queryWith`（compute 返回观测依赖）、`digestOfPayload`、
  `dbLookup`/`dbEntryCount`/`dbTraceText`。
- trace：`hit|cutoff|miss <key>`（§64 不变）+ 新增 `cycle|reject|deps-changed <key>`。
- `sameDeps` 排序比较（D-Q3）。

新增 `compiler/lib/Vuna/Compiler/Query/Run.vuna`（Eff）
- `RunOpts`（budget/parallel/persist/root/origin）、`runNode`（命中判定→预算→取消→compute→
  提交）、`runNodesParallel`（`withScope`+`forkTask`+`awaitTask`，只在已就绪层并行）、
  `sessionLoad`/`sessionSave`（codec `query-index 1`，目录 = 包桶，manifest 最后原子写）。

## 阶段 2：编译管线接图（CLI check/build/compile）

新增 `Driver/Graph.vuna`：节点族
`env:<pkg>`、`src:<content>`、`ast:<path>:<srcDigest>:<tag>`、`iface:<pkg>:<module>`、
`check:<pkg>:<entry|exports>:<mode>`、`split:<key>`、`unit:<name>:<key>`；
`checkViaGraph`/`buildViaGraph`/`compileViaGraph` 为唯一入口；
`Driver/Compile.checkPackage`/`compileToDir` 转发；check/split 独立缓存目录删除
（由 `query/` 条目替代），unit/ast 条目保留原 key 公式。
debug 行映射（保持既有断言可用）：`cache-own-clean=`（干净模块节点数）、
`parse-module=`（真 parse 节点）、`iface-write=`、`cache-path=summary`、`unit-cache-hit`；
新增 `query-*` 行。
差分开关：`VUNA_QUERY_AUDIT=1` 图/旧路径对拍；`VUNA_LEGACY_PATH=1` 强制旧路径（收尾删除）。

## 阶段 3：工具接图（LSP / REPL）

- `Lsp/Diagnostics`：删 `DiagCache`，改持 `Db`；诊断节点 `diagnostics:<uri>:<contentDigest>`，
  旧请求预算 + 取消位废弃；clean 判定改节点命中。
- `Repl`：删 `stateAuxCache`/`stateToolSession`/`stateIndexCache`，改持同一 `Db`；
  节点 `eval:<moduleCtxDigest>:<blockDigest>`；`:browse` 走 `index` 节点。
- debug 行：`iface-source=repl modules=` → `query-source=repl nodes=`；
  `iface-tool-lazy modules=` → `query-lazy nodes=`；同步 §44g 与 `compiler-perf.sh`。

## 阶段 4：test / doc / index 接图

- `Test/Run`：构建走 `buildViaGraph`；用例二进制节点记账（`--last-failed` 语义不变）。
- `Doc/*`：docstring 扫描消费 `ast` 节点。
- `Index/Scan`：删 `.local/index/` 文本缓存，改 `index:<dir>:<manifestDigest>` 节点；
  `vuna map` 输出必须与 `test/snapshots/modules.txt` 逐字节一致。

## 阶段 5：收尾

删 `VUNA_LEGACY_PATH` 与旧缓存目录代码；`debt.md` 删 C32/C48（C49 按复测）；
`bench/compiler-baseline.txt` 重标定；`nix build .#vuna` + `sh nix/seed-rotate.sh ./result/bin/vuna`
+ `nix flake check`。

## 测试与门禁

- 新增 steps：`70_canonical_payload.steps`、`71_store.steps`、`72_query_graph.steps`、
  `73_consumers.steps`；`test/suite.toml` 的 `min_cases` 上调。
- 修改：`52_cache_framing.steps`（v2 + digest 篡改）、`59_clean_iface.steps` → `59_clean.steps`、
  `64_infra.steps`（QVal/trace + 载荷 roundtrip）、`44a`（头断言）、`44g`（`query-source` 行）。
- 新增 CI：`checks.query-audit`（`nix/checks/query-audit.sh`）接入 `nix/checks/default.nix`。
- 复用：`bench/compiler.sh --check`、`vuna-compiler-growth*`、`checks.vuna-index`、
  `checks.doc-coverage`、`VUNA_IFACE_AUDIT=1 VUNA_IFACE_SELFTEST=1`（C49 复测）。

## 文档落点

新增 `docs/reference/query-graph.md`（引擎语义/节点族/存储/codec/会话/边界）；
重写 `cache.md` 存储与哈希两节；`compiler.md` 模块表加 `Store`/`Query.Run`/`Driver.Graph`/
`Canonical.Source`/`Fingerprint`；`architecture.md` 新增「查询图与内容寻址存储」链路；
`debt.md` 删 C32/C48；`primitives.md` 删 marshal 行；`performance.md` 新读数；
`AGENTS.md` 与 `README.md` 文档表各加一行。

## 边界与风险

- 依赖环：模块 import 环仍由 loader 拒绝；图内环 ⇒ `cycle` trace + `Err`。
- 取消/并行（D44 约束）：取消只在节点边界生效；并行只跑已就绪层，写盘串行；超时按逻辑步数。
- 解码失败：digest 通过但 `dec` 失败 ⇒ miss + 覆盖写，记 `store-reject=decode`。
- span 丢弃：`miDecls`/`FixityDecl` 编码丢 span（本就为哈希如此），依赖模块 aux 诊断可能
  失去位置；用 `VUNA_QUERY_AUDIT=1` 对全仓诊断逐字节比对；若 dep 侧 warning 位置差异，
  抑制预置模块 warning 并在文档登记，不改回带 span 编码。
- 只读树/写失败：降级只读，退出码与诊断不变。
- 内存：大值 `QRef` + 64 KB 阈值；`Db` 不常驻 split 载荷。
- 性能回退点：每节点多一次 digest（≈1.2 ms/MB）、会话索引恢复、圈复杂上升；warm 门槛兜住。
- seed：阶段 0 与阶段 5 各一次 rotation；`nix/tcb-forbidden.txt` 不需新增。

## 并行分工（Agent Teams，写作用域互斥）

| 工作流 | 写作用域 | 依赖 |
| --- | --- | --- |
| W1 载荷 codec | `Canonical/*`、`Driver/{Cache,Split,Iface}` 的 codec 段 | — |
| W2 Store/framing | `Store.vuna`、`Driver/PerfCache.vuna`、`Loader/Flatten.vuna`、`lib/Vuna/Clean.vuna` | W1 |
| W3 引擎 | `Query.vuna`、`Query/Run.vuna` | W2 |
| W4 CLI 接图 | `Driver/{Graph,Compile}.vuna` | W2/W3 |
| W5 工具接图 | `lib/Vuna/{Lsp,Repl,Test,Doc,Index}/*` | W4 |
| W6 文档/测试/CI | `docs/**`、`test/suite/steps/**`、`nix/checks/**`、快照 | 按阶段 |

Lead：阶段门禁（`vuna check .`、suite、bench、`nix flake check`、rotation）、最终 diff 复核、
提交拆分（`feat(store)` / `refactor(query)` / `feat(graph)` / `chore(seed)`）。

## 明确不做

- 不做第二套增量机制：收尾后不允许再出现独立缓存目录（`check/`、`split/`、`.local/index/` 消失）。
- 不做常驻 daemon；会话生命周期 = 进程。
- 本轮不引入 `opaque`/`abstract`（D11）与宏节点。
- 不为并行而并行。
- 不保留 `prim_marshal` 兼容层。

## 进度

- [x] 阶段 0：Store + codec + 删 Marshal + clean 命令（**偏差已登记，见下**）
- [x] 阶段 1：Query v2 + Query.Run（纯核心三段式 + Eff 层预算/环/会话索引）
- [x] 阶段 2：Driver.Graph 接 check/build/compile（check + split 节点，check/、split/ 目录下线）
- [ ] 阶段 3：LSP / REPL 接图
- [ ] 阶段 4：test / doc / index 接图
- [ ] 阶段 5：收尾（删旧路径、债务、基线、rotation、flake check）

### 阶段 0 落地记录（2026-11-12）

已完成：`Store`（framing v2）、`Fingerprint`、`Canonical.Bytes` 游标化、
`Canonical.Ast`/`Canonical.Elab`、`Driver.{Iface,Cache,Split,PerfCache}` 全量显式编码、
check 缓存 marker、删 `prim_marshal`/`prim_unmarshal`/`dtp_marshal`/`dtp_unmarshal`、
删 `CacheFormat.vuna`、`vuna clean [--iface|--store|--all|--dry-run]`、§52/§59 改造、
`ifaceSchema` 19→20、`mePayloadDigest` 三层读校验。

**偏差 1（推翻 D-Q7 的字面表述）**：载荷缓存**不是 AST，而是词法 token 流**。
原计划让 `Loader.Flatten` 缓存 `Canonical.Ast.encSourceFile`；实测缓存命中后
**所有诊断位置退化成 `:0:0`、codegen 的 `dt_def_locs` 整表变成 `":0"`**（AST 编码按
iface 哈希口径丢 span），全量 suite 133 个 case 失败、unused-import 等 warning 直接消失
（warning 靠 `ownedByFile` 按 span 文件名归属，位置丢了就被过滤掉）。
token 流带位置 ⇒ 重放 parse 与冷路径逐字节一致；且 lexer 占 parse 的 86%
（40 KB 文件 lex 3.96 ms / 全程 4.59 ms），收益几乎不变。落地为
`Canonical.Lex` + `lexCacheSchema = "vuna-lex-cache 1"` + codec `lex-tokens 1`，
目录 `$TMPDIR/vuna-cache/lex/`。`Canonical.Ast.encSourceFile` 保留但**只服务 roundtrip
自检**，`cache.md` 已写明「不要拿它当载荷」。

**偏差 2（新发现，顺手修）**：`SourceInfo.siPath` 之前保留入口写法（相对/绝对），
它进接口载荷 ⇒ `vuna check base` 与 `vuna check $PWD/base` 交替会算出不同载荷字节、
`mePayloadDigest` 失配、**每次 check 整包重写接口**。写侧（`Compile.ownSourceInfos`）与
读侧（`Iface.ifaceRelPathOf`）都改成先 `absolutePath` 归一（§57c 覆盖）。

**偏差 3（测试基建）**：`corpus/repl-server/smoke.sh` 的 socket 落在 case `TMPDIR` 下，
而 steps 的 `TMPDIR` 本身已 55+ 字符，拼出 `repl.sock` 会超过 `sun_path` 108 字节上限
⇒ bind 失败、等就绪行空转到 10s（表现为「随机失败且耗时恒为 ~11s」）。改成短路径
工作目录（`vrs.XXXXXX`，过长退到 `/tmp`），并写进 `testing.md`。

阶段 0 门禁实测（本机 16 核，改后二进制）：warm `check compiler` 28–30 ms（门槛 43）、
warm `check .` 56–57 ms（门槛 78）；全量 suite **5551 checks / 0 failed**。

### 阶段 1 落地记录（2026-11-12）

`Query` 改成**三段式**纯核心，Eff 层复用同一套判据：

- `queryHit db key deps`（判命中：声明集合一致 + 观测依赖摘要未变）、
  `queryDepValues`（取依赖值喂 compute）、`queryResolve`（算完提交，判 cutoff/miss）；
  `query` / `queryWith` 只是这三段的组合。
- `QVal = QMarker | QBytes | QRef`（D-Q4）；`Entry` 增 `entryDeclared`（上次声明的 dep key
  集合）与 `entryHits`、`entryOrigin`（与 iface `meOrigin` 同语义）。
- **依赖比较顺序无关**（D-Q3，两侧都排序后逐项比），推翻旧头注释第 5 条。
- 动态依赖的判据是**观测依赖**，但「声明集合变化」也算失效：只按观测表判命中会让
  「新增一个依赖」永远看不见（新 key 不在观测表里），所以两条一起用。
- `Query.Run`（新模块，Eff）：`RunOpts`/`RunState`、`runNode`（命中 → 预算 → compute →
  纯提交）、自环（key ∈ deps）与栈环（`rsStack`）检测、`sessionLoad`/`sessionSave`
  （`Store` + codec `query-index 1`，路径 `<cache>/query/<包桶>/index`，`writeIfChanged`）。
  **并行与抢占式取消不在本轮**：`EffSched` 的取消只在任务边界生效，run 层用「预算耗尽」
  作为唯一协作式取消形态，强杀留给进程级超时。
- §64（`examples/infra`）扩到 25 条断言：原有 miss/hit/cutoff 三条不变，新增
  `query-order`（反序声明仍命中）、`query4`（动态依赖 hit）、`query5`（声明集合变 ⇒
  cutoff）、`query-marker`（QVal 三形态渲染的单射性锁死）。

### 下一步（阶段 2 起的落点，已在阶段 0/1 期间核实）

- `Driver/Compile.vuna` 的接入点：`checkPackage`（= `checkCachedExe` / `checkCachedLib`）
  与 `compileToDir`；判定逻辑现在散在 `checkCacheHit` / `checkAndCache` / `ownCleanInfo` /
  `depIfacesOf`，全部应改写成图节点（`env:` / `src:` / `ast:` / `iface:` / `check:` /
  `split:` / `unit:`）。`check/` 与 `split/` 两个独立缓存目录随之下线。
- 纯层已经就绪：`Query.queryHit` 用**观测依赖 + 声明集合**两条判据；`Query.Run.runNode`
  带预算与环检测；`sessionSave` 可直接承接「跨进程 check 命中」（替代 `check/` marker）。
- 工具侧（阶段 3）：`Lsp/Diagnostics` 的 `DiagCache`、`Repl` 的 `stateAuxCache` /
  `stateToolSession` 换成持同一 `Db`；debug 行 `iface-source=repl` → `query-source=repl`。
- 阶段 5 必做：`sh nix/seed-rotate.sh ./result/bin/vuna`（`Canonical.Lex` 已进
  `Loader.Flatten` 的 import 闭包 ⇒ seed 闭包变化，`nix/seed-files.txt` 会新增
  `Vuna_dCompiler_dCanonical_dLex.ml`）、`bench/compiler-baseline.txt` 重标定、
  `nix flake check`。

### 阶段 2 落地记录（2026-11-12）

两条缓存判定链都改由查询图承担，`check/` 与 `split/` 两个目录下线：

- **check 节点** `check:<pkg>:<kind>`：值 `QMarker`，依赖 = 四个输入摘要节点
  （`env:` manifest / `src:` 源闭包 / `deps:` 依赖接口闭包 / `ver:` 版本+指纹）。输入摘要
  写进 dep key ⇒ 任何输入变化让依赖表变化 ⇒ miss（等价于旧复合 key 的判等），且无需给
  「输入节点」做可变性（`Db` 是纯的）。命中直接 `OkC []`，完全跳过精化。
- **split 节点** `split:<pkg>:<pr0|pr1>`：值 `QRef` = 产物载荷的内容地址，载荷落
  `<cache>/blobs/<digest>`（`Store` framing，codec `split-files 1`）。blob 内容寻址 ⇒
  跨包共享、同产物只存一份、写重靠 `writeIfChanged` 去抖。
- 会话索引按包桶持久化（`sessionSave` / `sessionLoad`，`query-index 1`）；`-W` /
  `--deny-warnings`（warning 不持久化）、`VUNA_ELAB_FULL=1`、`VUNA_IFACE_AUDIT=1` 仍直接
  绕过图（审计必须跑两条真实路径，成功后同样提交节点）。
- 并行竞态顺带修掉：`Store.storeEnsureDirEff` / `Compile.ensureDirPath` 的
  「exists 再 makeDir」TOCTOU（改 `mkdir -p`），`PerfCache` 单元缓存 GC 的
  `removeFile`（缺失即抛）改 `safeRemoveFile`。

实测：冷 `build --no-compile --out compiler` 8.9s → 热 296ms（产物逐字节相同）；warm
`check compiler` 29ms / `check .` 55ms；全量 suite 5554 checks / 0 failed。

遗留（阶段 3+）：LSP/REPL 仍各自持缓存（`DiagCache` / `stateAuxCache` /
`stateToolSession`），test/doc/index 未接图；`vuna clean --store` 仍按目录清；seed rotation
留到阶段 5。

## 阶段 3/4 执行设计（2026-11-12 勘察后落盘）

目标：LSP / REPL / test / doc / index 都改成**查询图客户端**，删掉各自的 ad-hoc 会话缓存。
难点不是判定逻辑（`Query` 已就绪），而是**大值载荷的编码**：这些缓存里存的是记录树
（`ToolContext` / `Index` / doc 索引），`QVal` 只有三种形态，装不进去。

设计：

1. **tool 会话层（新）** `lib/Vuna/Tool/Session.vuna`（工具链，不进 seed）：
   `ToolSession = { tsDb : Db, tsOpts : RunOpts, tsPath : String }`，
   `toolHit : ToolSession -> String -> List String -> Maybe QVal`、
   `toolCommit : ToolSession -> String -> List String -> QVal -> Eff [] ToolSession`（提交后
   `sessionSave`，桶名 `tool:<包名>`，origin `tool`）。所有工具共用这一层 ⇒ 同一个 `Db`。
2. **编码**（`compiler/lib/Vuna/Compiler/Driver/ToolPayload.vuna`，进 seed 因为记录定义在
   compiler）：`encToolContext`/`decToolContext`（codec `tool-context 1`），
   `encIndexPayload`/`decIndexPayload`（`index-payload 1`，`Index.Types` 的记录树）——
   复用已有 `encModuleIface` / `decModuleIfaceComplete` / `encSourceInfo` / `encManifest`；
   缺的 `decSourceInfo`、`ManifestEntry` 解码器在这里补。大值 `QRef` + `Store` blob
   （路径 `<cache>/blobs/<digest>`，与 split 产物同一个 blob 树）。
3. **REPL**（`lib/Vuna/Repl.vuna`）：
   - `stateToolSession`（137–142 记录 + `withToolSession` 238）→ `ToolSession` + 节点
     `tooliface:<pkg>:<dirHash>`，依赖 = 现有校验面（`sessionStats` 的
     `path:size:mtime` 键；安全窗外的内容哈希进 key 的另一段）。
   - `stateIndexCache`（148–155 + `withIndexCache`）→ 节点 `index:<dir>`，依赖 = 逐源文件
     `srcstat:<path>:<size>:<mtime>`，值 = `QRef`（`index-payload 1` blob）。
   - `stateAuxCache`：`AuxCache` 是「按 import 名单草拟的辅助表」，可并入 `tooliface:` 节点的
     依赖（import 名单进 key），记录删除。
   - debug 行：`iface-source=repl` → `query-source=repl`、`iface-tool-lazy` →
     `query-lazy`；`test/suite/steps/44g_tool_iface.steps` 同步（两处片段 + 一条 grep）。
4. **LSP**（`lib/Vuna/Lsp/Diagnostics.vuna`）：`DiagCache`（222）去掉
   `dcStats`/`dcBuiltSec` 的 mtime 启发式，改成 `ToolSession` + 节点
   `lspiface:<pkg>:<dirHash>`；`buildSession`（267）/`usableSession`（284）/
   `sessionClosureOk`（295）合并成「取节点 → 命中复用 → 未命中重建并提交」；
   `diagnosticsForCached` 的「干净模块」来自节点依赖表的命中结果。
5. **Index / Doc**（阶段 4）：`Vuna.Index.loadOrBuild`（`lib/Vuna/Index/Scan.vuna`）的
   `.local/index/` manifest 换成 `index:<dir>` 节点 + blob；`vuna map` 输出必须与
   `test/snapshots/modules.txt` 逐字节一致（现有 §38 快照兜底）。`vuna doc` 同理，
   节点 `doc:<pkg>:<closureHash>`。`vuna test` 已经走 `compileToDir` ⇒ 自动吃到 split 节点，
   只需删它自己按文件名的旧缓存（若有）。
6. **验证口径**：每迁移一个消费者就跑该消费者的既有 steps（44g/44l1/44l2/LSP smoke/
   47c/38/§19），外加 `nix/checks/compiler-perf.sh`（它已按 `$TMPDIR/vuna-cache` 整体清理，
   与布局无关，只需确认 `--debug-perf` 的 `cache-own-clean`/`cache-path` 行仍在）。

### 阶段 3 进展（2026-11-12，第 3 轮）

- ✅ `ToolPayload`（`Driver/ToolPayload`，codec `tool-context 1`）：`ToolContext` 的规范编码，
  `Iface` 补导出 Cur 级编解码别名；`examples/infra` 的 `tool-ctx-rt` + §64 断言锁死字段顺序。
- 勘察确认下一步的形状：**会话记录整个进 blob**（不再只持久化「命中标记」）。REPL 的
  `stateToolSession` 因此可以删除（不再需要内存里的 `ReplToolSession`：命中就从 blob 解码
  `ToolContext`）。依赖表这样取：
  - `man:<pkg>:<manifest mtime+size>`（本包 manifest）；
  - `depman:<包>:<mtime+size>`（各依赖包 manifest，枚举成本 = workspace 图，不读 iface）；
  - `closure:<sorted import 名单>`（buffer 新增 import ⇒ 依赖表变化 ⇒ miss，替代
    `sessionClosureOk` 的启发式）。
  注意顺序：这三个依赖**不需要**先建 `ToolContext`（旧实现是先建会话才知道 `tcStats`，
  于是只能用 mtime 启发式倒推）——这正是图模型能删掉 `toolSessionFresh` 的原因。
- 待做：`lib/Vuna/Tool/Session.vuna`（`toolHit`/`toolCommit` + blob 读写）、REPL 三处缓存迁移、
  LSP `DiagCache` 迁移、Index/Doc 接图。
