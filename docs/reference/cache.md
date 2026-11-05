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
| 单位 | 每模块一个 `.ttc` | 每模块一个 `<Module.Name>.iface` + 包级 `manifest`（S3） |
| 接口内容 | 接口 + 编译后定义（case tree）+ metadata + import hashes | 闭合精化产物（datas / defs 含 body / globals / insts / classes）+ **已解析源码声明** + exports / fixities / imports / capabilities |
| 失效 | 源哈希 + 依赖 `ifaceHash`（public/inline 定义体参与） | 模块源码哈希 + `miDepHashes`（直接 import 的接口哈希）；`miIfaceHash` 覆盖导出面 + 导出定义体，不含 span/路径 |
| 加载 | 读 `.ttc`，不读源 | 读接口；依赖模块以「已加载模块」注入 Loader（零 parse/resolve） |
| 上游变化 | `importHashes` 链 | `miDepHashes` 链（包内模块也参与） |
| 下游 | 编译器从 TTC 生成代码 | 同一份 `DtProgram` 视图（依赖 artifacts 来自接口）→ `Codegen.Split` |
| 版本 | TTC header/version | `ifaceSchema` + 编译器 fingerprint + 包名 |
| 快判 | TTC 在构建目录、mtime/hash | `$TMPDIR/vuna-cache/iface-<包名>/`；默认内容哈希，`VUNA_CACHE_MTIME=1` 时 mtime+size 快路径 |

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
      → 包级 PackageIface（schema / compiler / package / dir / modules）→ 原子写 iface.pkg
  → 覆盖性检查：本包模块拥有的 artifact 必须全部进摘要（归属漏项 ⇒ 不写，回退下次）
```

### 读侧（依赖接口可用时）

```text
Driver.Compile.depIfacesOf
  ├─ 逐依赖包读 iface.pkg，校验 schema / 编译器指纹 / 包名
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
$TMPDIR/vuna-cache/
  iface-<hashText(textHash(包名))>/manifest                   # 包级 manifest（模块名→文件/源信息/接口哈希）
  iface-<hashText(textHash(包名))>/<Module.Name>.iface        # per-module 接口（Marshal，原子写）
  <hashText(textHash(包名))>/check/<key>                       # 包级 check 缓存（成功标记 + 兼容）
  <hashText(textHash(包名))>/split/<key>                       # codegen SplitFile 缓存
  ast/<key>                                                    # parse 结果缓存
```

接口 key **只用包名**（与 check 缓存同一约定）：包目录在「单独 check 依赖包」与「作为依赖被
读」两个上下文里可能是相对/绝对/含 `..` 的不同写法，用目录参与 key 会找不到同一份接口。
跨项目同名包的陈旧接口由读侧源哈希/哈希链校验拒绝（回退全量），不会误用；代价是两个项目
交替 check 同名包时接口会互相覆盖（各自回退，正确性不受影响）。

**per-module 写**：写侧只重写接口哈希变化（或文件缺失）的模块，manifest 最后原子写 =
提交点；读侧先读 manifest，再逐模块读文件并校验「文件名 ↔ 记录名/接口哈希」，缺件/损坏
回退全量。`VUNA_IFACE_SELFTEST=1` 打开写侧自检（读回 + 模块名集合/接口哈希一致），失败让
check 失败；`VUNA_DEBUG_PERF=1` 等价于 `--debug-perf`（给 `vuna-compiler` 这类不经过
`Vuna.Cli` 的入口用）。`VUNA_CACHE_MTIME=1` 开 mtime+size 快路径（同秒内改内容且大小不变
可能漏判；测试/A-B 用默认内容哈希）。

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

## LSP / REPL 消费接口（opt-in）

`VUNA_IFACE_TOOL=1` 时 LSP 诊断链与 REPL 求值会把「本包依赖闭包的模块接口」作为预置
模块交给 Loader（`dtCheckSourceWithIfaces` / `dtEvalExprInfoWithIfaces`），编辑/求值只
精化当前源码与同包源码；接口缺失/失效自动退回原路径。**默认关闭**：当前实现每次请求会
读+校验整个依赖闭包（本仓库 94 个模块 ≈2s/次），对小项目反而慢于按需 load；下一步做
「只读 import 闭包需要的模块 + 会话内缓存」后再默认打开。测试 §44g 覆盖开启后的
REPL 求值与 LSP smoke。

## codegen 单元级缓存（S5，opt-in）

`VUNA_UNIT_CACHE=1` 时，`build` 在包级 split 缓存未命中（包内一个模块变了）后不再重新
生成所有单元：每个 `SplitFile` 按 **单元 key** 缓存在 `$TMPDIR/vuna-cache/<pkg>/split-units/`
（自描述头 + Marshal；`Driver.PerfCache`）。key = 单元名 + 模块声明内容哈希 + 依赖单元
key 的传递哈希链；依赖接口变化沿链使依赖者失效，无关模块变化不影响。生成结果规范化为
**确定性拓扑序**（按深度分层、同层按名字哈希；每单元直接依赖也按同序 normalize），因此
复用旧记录不会让 build.sh 的层/顺序漂移——增量与干净重建产物逐字节一致（测试 §44h）。
实测 compiler 包改一个叶子模块：无缓存 14.6s vs 有 14.3s（elab 主导，codegen 只占 ~1–2%）。

**默认关闭**：单包增量收益有限；且缓存目录按包名隔离，共享 `TMPDIR` 下多个「同包、不同
entry 的单文件编译」会共用单元缓存（entry key 含声明哈希，但清理/隔离策略未做）。下一步：
按 entry 分桶 + 旧单元 GC 后再默认启用。

## 依赖可见性收敛（S6）

全量路径只加载 entry/本包模块的 **import 闭包**；接口路径为省 parse 会一次性预置整包
依赖模块，若不加约束，未 import 模块的实例/类也会进入求解视图（相对全量过近似）。S6 在
load 之后按闭包过滤模块表：起点 = entry 的全部 imports（含隐式 Prelude/导出根），沿
`moduleImportsOf + moduleImplicitImportsOf` 传递；被过滤掉的依赖模块不再提供接口产物
（`materializedDeps`），干净模块同理（`materializedOwn`），Loader 仍零 parse。摘要路径与
全量路径因此看到同一组模块/实例/类（测试 §44i：实例在未 import 的模块里时两条路径一致
拒绝，import 后一致接受）。

## 已知边界（仍缺的部分）

- **包内逐模块增量已落地（S4）**：干净模块复用、只精化脏模块；剩余是更细的
  headers / bodies 分阶段复用（当前仍以模块为单位）。
- **codegen 单元级缓存已落地（S5，`VUNA_UNIT_CACHE=1`）**：整包 split 缓存未命中时按单元 key 复用已生成的
  `SplitFile`；产物顺序规范化保证增量/全量一致（详见上）。
- **LSP / REPL 消费接口已接好（`VUNA_IFACE_TOOL=1`，默认关）**：默认仍全量精化；
  开启后单次请求读整个依赖闭包偏慢，惰性读闭包 + 会话缓存未做。
- **快判**：默认内容哈希；`VUNA_CACHE_MTIME=1` 提供 mtime+size 快路径（可选、非默认）。
- **序列化**：接口文件带自描述头（magic|schema|compiler），读侧先校验头再 unmarshal，
  错版本/损坏直接拒绝并回退；载荷仍是 OCaml Marshal（C32 的完整规范化格式只做了哈希侧
  的顺序/残 meta 规范化，split 缓存也是裸 Marshal）。
- **依赖可见性已收敛（S6）**：摘要路径 load 后按 entry/本包 import 闭包过滤模块表，未 materialize 的依赖模块不提供实例/类，等价于全量路径（测试 §44i）；模块签名隔离另立项。
- **擦除位残 meta** 仍靠包段重编号；彻底方案是精化收尾消 meta。
- 接口多存 `miDecls`（见上），文件比 TTC 的「只存编译后定义」更接近源码体积；后续可换更
  紧凑的终止性/record 上下文表示。

## 相关阅读

- 包级摘要与 codegen：[compiler.md](compiler.md)
- 性能读数与基准：[performance.md](performance.md)
- 测试口径（§44 摘要路径）：[testing.md](testing.md)
- 债务与路线图：[debt.md](debt.md)、[roadmap.md](../roadmap.md)