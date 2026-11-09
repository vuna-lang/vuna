# 模块级精化缓存（TTC 思路）

本文记录 vuna 的**模块级接口摘要**——对照 Idris2 TTC 的模块化精化缓存：目标、数据流、
不变量、失效判定与仍缺的部分。包级摘要的历史与实现细节见
[compiler.md §接口摘要](compiler.md)；性能读数见 [performance.md](performance.md)。

## 目标

一次包级 `check` / `build` 不应该重复处理依赖包的源码：

- 依赖包的模块**不 parse、不 resolve、不精化**，只读它的接口；
- 模块的接口以**自身内容 + 依赖接口哈希**为失效判据（实现变化但不改接口 ⇒ 不失效）；
- 缓存可回退：任一接口缺失/损坏/陈旧 ⇒ 回退全量，宁可慢，不静默用坏缓存。

## 对照 Idris2 TTC

| 能力 | Idris2 TTC | vuna 现状 |
| --- | --- | --- |
| 单位 | 每模块一个 `.ttc` | 每模块一个 `<源文件相对路径>.iface`（与源码同布局）+ 包级 `.vuna-iface`（S3/S8） |
| 接口内容 | 接口 + 编译后定义（case tree）+ metadata + import hashes | 闭合精化产物（datas / defs 含 body / globals / insts / classes）+ **已解析源码声明** + exports / fixities / imports / capabilities |
| 失效 | 源哈希 + 依赖 `ifaceHash`（public/inline 定义体参与） | 模块源码哈希 + `miDepHashes`（直接 import 的接口哈希）；`miIfaceHash` 覆盖导出面 + 导出定义体，不含 span/路径 |
| 加载 | 读 `.ttc`，不读源 | 读接口；依赖模块以「已加载模块」注入 Loader（零 parse/resolve） |
| 上游变化 | `importHashes` 链 | `miDepHashes` 链（包内模块也参与） |
| 下游 | 编译器从 TTC 生成代码 | 同一份 `DtProgram` 视图（依赖 artifacts 来自接口）→ `Codegen.Split` |
| 版本 | TTC header/version | `ifaceSchema` + 编译器 fingerprint + 包名 |
| 快判 | TTC 在构建目录、mtime/hash | 默认在源文件旁（`<pkg>/lib/.../X.iface` + `<pkg>/.vuna-iface`）；`VUNA_IFACE_DIR` 可整体镜像到外部根。默认内容哈希，`VUNA_CACHE_MTIME=1` 时 mtime+size 快路径（距 now <5s 的文件仍回读内容哈希，见下） |

**唯一实质字段差异**：vuna 的接口多存 `miDecls`（已解析源码声明）。原因：vuna 的 record
语法降级（`Elab.Records.prepareDeclsWith`）与终止性 SCT（`Elab.Termination`）都工作在源码
AST 上；Idris2 的对应阶段吃编译后的 case tree。vuna 的等价物就是 resolved 子句，因此把
它作为接口的一部分（也顺带让依赖模块的 record 头 / 终止性上下文可用）。

## 数据流

### 写侧（一次成功的 check / build）

```text
Dt.check（全量或摘要路径）→ CheckedPackage = { DtProgram, modules, entryDecls, inherited }
  → Driver.Compile.writeIfaceShadow
      ifaceOfPackage：按 Module 归属把 DtProgram 切成每模块 CachedProgram
        （归属表来自 Driver.Owner：声明名 / 实例名 / 派生实例 / trait 投影 / Dict_）
      → 逐模块 hashOfParts（不含 span / 源路径）→ miIfaceHash
      → 逐模块 miDepHashes（直接 import 的接口哈希；包内模块边算边进表）
      → 包级 PackageManifest（schema / compiler / package / modules）→ 原子写 `.vuna-iface`
  → 覆盖性检查：本包模块拥有的 artifact 必须全部进摘要（归属漏项 ⇒ 不写，回退下次）
```

### 读侧（依赖接口可用时）

```text
Driver.Compile.depIfacesOf
  ├─ 逐依赖包读该包的 `.vuna-iface`，校验 schema / 编译器指纹 / 包名
  ├─ depIfaceSourcesValid：每个模块源内容哈希 = 接口记录；且当前源码模块集合 == 接口模块集合
  ├─ depIfaceChainValid：每个模块记录的 miDepHashes 等于当前闭包里同名模块的 miIfaceHash
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
`VUNA_ELAB_FULL=1` 强制全量（排障 / A-B 对拍）。

## 不变量

1. **接口字段必须闭合**：`cachedProgramValid` 保证 datas / defs / globals / insts / classes
   无未解 meta、无负索引、无自由变量；擦除位残 meta 仍按包段重编号（见
   [compiler.md](compiler.md) §硬不变量）。
2. **`deftbl` 只装定义体**：签名项进 deftbl 会让 `force` 把 `Int`/`String` 归约成 `Type`
   （C37 的 `Eq Type` 假歧义根因）。
3. **接口哈希不含 span / 源路径**：换行、注释、checkout 路径变化不失效；导出定义体参与
   （精化会 delta 展开，类型级求值依赖它）。
4. **归属表必须覆盖全部 artifact**：写侧做覆盖性检查；漏项不写接口（安全阀）。
5. **依赖接口哈希链必须闭合**：包内与跨包都按直接 import 校验；缺项（`-1` 哨兵）永不失配。
6. **摘要路径的 `Err` 必须上报**：只有「接口不可用」才回退全量，本包真实错误不得被吞。
7. **依赖模块零 parse**：接口模式下依赖模块只被 read（算哈希），从不 `parseFileWithPath`；
   `--debug-perf` 的 `parse-module=<name>` 计数可验证（测试 §44 断言 `Dep` 未被 parse）。

## 存储与 key

```text
# 默认：接口文件与源码同布局（gitignored；`vuna clean-iface .` 批量清理）
<包目录>/lib/Base/Int.iface          # 源文件 lib/Base/Int.vuna 的接口（Marshal，原子写）
<包目录>/.vuna-iface                 # 包级 manifest（模块名 → 相对路径/源信息/接口哈希）

# VUNA_IFACE_DIR=R 时：整体镜像到外部根（内部布局完全相同，适合持久化/共享）
<R>/<包绝对目录>/lib/Base/Int.iface
<R>/<包绝对目录>/.vuna-iface

# 其余缓存仍在 $TMPDIR/vuna-cache/（按包名哈希，与本布局无关）
$TMPDIR/vuna-cache/<hashText(textHash(包名))>/check/<key>                          # 包级 check 缓存（framing）
$TMPDIR/vuna-cache/<hashText(textHash(包名))>/split/<key>                          # codegen SplitFile 缓存
$TMPDIR/vuna-cache/<hashText(textHash(包名))>/split-units/e-<entryId>/<unit>.unit  # 单元缓存
$TMPDIR/vuna-cache/ast/<key>                                                       # parse 结果缓存（schema 7）
```

**载荷 framing（M34.6，C32 最小硬化）**：除 iface 文件自己的
`vuna-iface-file 1|schema|compiler|\n` 头外，split/check/ast/unit 载荷统一用
`CacheFormat`：`magic|tag|len|strHash 校验和\n` + payload。读侧先做**头行前缀扫描 + 长度
校验**（不做整段 `strUnpack`，否则命中路径会从 ~80ms 抬到 1.1s），不合法 ⇒ 视为 miss、
重算并覆盖；不再把任意字节喂给 `Marshal.from_bytes`。schema/tag 变化即拒绝旧缓存（无兼容
义务）。载荷本身仍是 OCaml Marshal（显式编码格式是后续项，见 [debt.md](debt.md) C32）。

**key 与可移植性**：接口文件的 key 就是**包目录 + 相对源路径**，不再用包名哈希。默认布局
下文件就在源码旁，同一包在相对/绝对/含 `..` 的不同写法下指向同一份文件；同名不同目录的包
也天然各占一棵树。`VUNA_IFACE_DIR` 模式用**规范化绝对包目录**（lexical 归一、不解析
symlink）镜像：换 checkout / 移动目录只是 miss（回退全量），不会误用；symlink / 挂载别名会
各存一份。manifest 里的 `meFile` 是相对路径（换机器 / 复制源码树仍可命中，只要源内容不变）；
读侧校验它必须是相对路径、无 `..` 段、`.iface` 后缀（防篡改穿越）。

**只读降级**：写侧写前用一次 `sh`（`mkdir -p` + 逐目录 `test -w`，返回码判定、不抛异常）
探测；不可写（Nix store 只读源树、只读 checkout、`VUNA_IFACE_DIR` 指到只读树）就
`note "iface-skip readonly <dir>"` 并跳过写入，check/build 退出码与诊断不变，下次可写时照常
写。manifest 写去抖：编码后与磁盘逐字节相同则不写（避免默认布局每次 check 都改源树 dotfile
的 mtime）。

**清理**：默认布局会在工作树留下 `*.iface` / `.vuna-iface`（`.gitignore` 已忽略）；
`vuna clean-iface [--dry-run] [DIR]` 按文件名批量删除它们（以及原子写残留
`*.iface.*.tmp`），不碰 `.vuna` 源码。

**per-module 写**：写侧只重写接口哈希变化（或文件缺失）的模块，manifest 最后原子写 =
提交点；读侧先读 manifest，再逐模块读文件并校验「相对路径 ↔ 记录名/接口哈希」，缺件/损坏
回退全量。`VUNA_IFACE_SELFTEST=1` 打开写侧自检（读回 + 模块名集合/接口哈希一致），失败让
check 失败；`VUNA_DEBUG_PERF=1` 等价于 `--debug-perf`（给 `vuna-compiler` 这类不经过
`Vuna.Cli` 的入口用）。写侧 `ifaceOfPackage` 对 DtProgram 只做**一遍** owner 分桶
（`ProgParts`），coverage 用 `HashMap`；整包 sols 表只建一次供逐模块 zonk 复用——iface
阶段因此从 ~1.44s 降到 ~0.22s（M34.6）。

`VUNA_CACHE_MTIME=1` 开 mtime+size 快路径：记录/当前 mtime 距 **now** <5s 的文件回落内容
哈希（同秒同大小编辑必失效），更老的文件才用 mtime+size。默认路径仍是内容哈希；实测快路径
在缓存命中路径上的收益 <5%，故保持 opt-in（测试 §51 覆盖同秒同大小编辑）。

## 包内逐模块增量（S4）

接口文件 per-module 后，包内检查/构建不再无条件整包重精化：

1. **脏/净判定**（`Driver.Compile.ownCleanModules`）：模块干净 ⇔ 源内容哈希未变 ∧ 闭合
   产物有效 ∧ 它记录的每个直接依赖接口哈希仍成立（外部依赖对比当前接口表，同包依赖必须是
   **已判定干净**的模块）。脏性沿 import 边保守传播：干净模块只依赖干净模块，一个模块变脏
   会让依赖它的模块也判脏（接口哈希可能变，不做乐观复用）。
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

**惰性读（S7）**：manifest 自带每模块的直接 import 名（schema `vuna-iface 8`）。工具路径
先只读依赖包的 `.vuna-iface`（校验 schema/编译器指纹/包名/源哈希），按 entry（含隐式 Prelude）
的 import 闭包算出需要哪些模块，再只 unmarshal 这些文件；仍按 `miDepHashes` 链校验。

**闭包完整性（M34.6）**：闭包起算集并入**同包模块自己的 import**（本包 manifest 的
`meImports`）；`Dt` 侧安全阀在加载后发现任一依赖模块缺 artifact 时整条回退全量（宁可慢，
不静默给假 `TC_UnknownName`）。REPL 路径同时补回依赖 datas/defs 并精化同包源码模块 decls。

**单文件增量精化**：LSP 请求先取本包干净模块（源哈希 + 依赖哈希未变）与依赖 iface 作为
预置，只精化当前 buffer（`dtCheckSourceIncremental`）；只对本次新精化的 datas/defs 跑
诊断检查链，终止性 SCT 只喂 aux 的 data/record 头与投影；成功后写回**当前模块** iface
（merge 写、原子写；写回失败不影响诊断）。没有 iface / 脏依赖 / buffer 与磁盘不一致时
自动回退全量。

**会话缓存（M34.6 5c）**：`LspState`/`ReplState` 持有 `DiagCache`：包上下文、依赖 ifaces、
prepared termAux、起始 Ec、干净模块、fixity env 与校验面（编译器指纹 + 包名 + 闭包源 /
manifest 的 mtime+size；安全窗内回读内容哈希）。无 watcher ⇒ 每请求惰性 stat 校验，外部
改任意依赖文件后下一次请求必然失效重建（测试 §44l 覆盖）。实测本仓库（16 核）：

- LSP 单次编辑：compiler 最大文件 ~0.12s、根包普通文件 ~0.02s（会话热）；同内容重复请求
  0–5ms；首次请求（建会话 + 首轮增量）~1.1–1.5s；
- REPL：轻量求值 ~30ms；重 import（4 次求值）~4.2s（M34.6 起点 ~6.1s）。

**单模块写回的已知边界**：LSP-only 冷启动写回的单模块 `miIfaceHash` 与随后整包 check 的
值可能略有差异（增量上下文擦除位残 meta 不同）。写侧有「manifest 已有同源接口则不重写」
守卫，热会话零抖动；LSP-only 写回后首次整包 check 会重写该模块及其依赖者一次（保守、自愈）。

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
  （见上）；剩余是「LSP-only 冷启动写回的单模块 iface 哈希与整包 check 偶有差异」的
  自愈（首次整包 check 重写一次）。REPL 每条表达式重读 manifest/iface 的残余已关闭：REPL
  把 `depIfacesForToolSourceDetailed` 的结果连校验面一起缓存在 `ReplState.stateToolSession`
  （key = 编译器指纹 + 包名 + 包目录；复用前按校验面 stat + import 闭包未扩大判定，失效即
  整条重建），因此轻量求值降到 ~6–8ms/条。`:browse` 首次建索引时另在
  `ReplState.stateIndexCache` 记逐源文件 stat 快照，后续 `:browse`/`:info`/`:search` 只重新
  stat 比对（`Vuna.Index.indexStatsUnchanged`：窗口外只 stat、窗口内回落内容哈希），命中就
  不再读全部源码算内容哈希（~6ms vs ~0.6–1.0s）。
- **快判**：默认内容哈希；`VUNA_CACHE_MTIME=1` 提供带 5s 安全窗的 mtime+size 快路径
  （可选、非默认；收益 <5%）。
- **序列化**：载荷已有 framing + 损坏回退 + schema/编译器指纹拒绝，但**仍是 OCaml
  Marshal**（非自描述格式；同长同校验和的构造性损坏仍可能让 `Marshal.from_string` 抛异常）。
  把 `ModuleIface`/`CachedProgram`/`SplitFile` 换成显式编码格式（C32 的完整形态）是后续项。
- **依赖可见性已收敛（S6）**：摘要路径 load 后按 entry/本包 import 闭包过滤模块表，未
  materialize 的依赖模块不提供实例/类，等价于全量路径（测试 §44i）；模块签名隔离归 F1。
- **默认 iface 落在源树里**：`*.iface` / `.vuna-iface` 已在 `.gitignore`（Nix dirty-tree
  source 不会收进 store），工具链遍历只认 `.vuna` 扩展，不受影响；需要批量清理时用
  `vuna clean-iface [DIR]`。模块删除/改名后的孤儿 `.iface` 不会被自动 GC（读侧只看
  manifest，孤儿不参与），同样由 `clean-iface` 清。
- **其余缓存仍是 TMPDIR + 包名哈希**：check / split / split-units / ast 按包名哈希隔离
  （`VUNA_IFACE_DIR` 只影响 iface），跨项目同名包在 TMPDIR 缓存上仍可能互相覆盖（各自
  回退，正确性不受影响）。
- **擦除位残 meta** 仍靠包段重编号；彻底方案是精化收尾消 meta。
- 接口多存 `miDecls`（见上），文件比 TTC 的「只存编译后定义」更接近源码体积；后续可换更
  紧凑的终止性/record 上下文表示。
- **`defVals` 不再参与记忆化**（M34.6 删除）；`DtProgram.dtProgDefVals` 字段保留为空表，
  后续清理 schema 时可一并删。

## 相关阅读

- 包级摘要与 codegen：[compiler.md](compiler.md)
- 性能读数与基准：[performance.md](performance.md)
- 测试口径（§44 摘要路径）：[testing.md](testing.md)
- 债务与路线图：[debt.md](debt.md)、[roadmap.md](../roadmap.md)