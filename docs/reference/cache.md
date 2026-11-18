# 输入寻址对象库

本文记录 vuna **唯一的缓存形态**：一切可复用产物都是「按输入摘要寻址的对象」，存在即
命中。没有查询图、没有会话索引、没有依赖快照比较、没有写锁。

## 三条正交的东西

| 层 | 是什么 | 在哪 |
| --- | --- | --- |
| **payload** | 对象字节（接口载荷、lex tokens、split 产物、工具会话载荷） | `objects/<kind>/<摘要>`、`blobs/<splitIdentity>` |
| **judgment** | 「这个输入算过了吗」= 输入摘要的地址是否存在 | `objects/check/<checkIn>`、`objects/splitptr/<splitIn>` |
| **path / view** | 给人看的渲染，不是身份 | `views/bin/<splitIn>/`、`views/testbin/<testBin>/`、`<pkg>/.output` 符号链接 |

路径可以变（视图、`.output`、`--out DIR`），身份不变（摘要）。

## 存储布局

```
$VUNA_STORE/                       # 唯一根：VUNA_STORE → XDG → ~/.vuna/store → $TMPDIR/vuna-store
  objects/iface/<模块接口地址>      # 模块接口（codec module-iface 4；带实例/方法 span）。
                                    # 入口包（`[export]` 为空）也写：模块面 = 入口闭包，
                                    # 供 LSP/REPL 把本包模块当干净模块预置
  objects/header/<头地址>           # 模块 header（imports + fixities），冷启动快路径
  objects/lex/<源摘要>              # lex tokens
  objects/order/<包源闭包+tag 摘要>  # 该包的模块顺序（split 串接要精化顺序，不是拓扑序）
  objects/check/<checkIn>           # 包级结果：Pass/Fail + 诊断列表（codec check-result 1）
  objects/tool/<工具会话地址>       # LSP / REPL / vuna map 的会话载荷
  objects/doc/<doc 输入摘要>         # vuna doc 的渲染产物（codec doc-html 1）
  objects/test/<测试判定 key>       # test verdict（通过/失败计数）
  objects/pkgiface/<key>            # 依赖接口身份摘要（key = 包名 + lib 源闭包 + 编译器 tag）
  objects/splitptr/<快 splitIn>     # 产物快指针：源输入 → 语义产物身份（注释复用 codegen）
  objects/pkg/<64hex>               # 取包对象族（`pkg-source 1`，见 package-store.md）
  blobs/<splitIdentity>             # 构建产物（split 文件集，规范拓扑序）
  units/<包哈希>/e-<h>-<h>/         # split-unit 缓存（按声明摘要命中）
  views/bin/<视图摘要>/             # 构建视图（产物真身，含 .complete；key = splitIn + 链接工具链）
  views/testbin/<testBin>/          # effect 测试编译产物（bin/vuna-test，含 .complete）
  pkgs/<64hex>/                     # 包物化视图（可删可重建）
  roots/<项目摘要>/.project         # 项目绝对目录（GC 据此清理已消失的项目根）
  roots/<项目摘要>/<digest>         # 该项目的保留集合（每个 digest 一个文件，GC 用）
  .tmp/                             # 视图锁与暂存（可删）
  tmp/                              # 取包中转（可删）
```

缓存族 = `objects/{iface,header,lex,order,check,tool,doc,test,pkgiface,splitptr}` + `blobs` + `units` +
`views` + `.tmp`；包对象族 = `objects/pkg` + `pkgs` + `tmp`。两族生命周期不同：
`vuna clean --store` / `vuna store gc` 只碰缓存族，`vuna clean --packages` 只碰包对象族
（见 [package-store.md](package-store.md)）。

所有地址 = `addrOf [kind, ...输入摘要]`（`Vuna.Compiler.Loader.Addr`，SHA-256）。

## 命中判定

| 场景 | 判据 | 未命中的代价 |
| --- | --- | --- |
| 包级 `check` | `objects/check/<checkIn>` 存在且可解码 | 精化一次；结果（含**失败**与诊断列表）写回 + 登记 roots |
| 包级 `build`（快路径） | `objects/splitptr/<splitIn>` → 语义 blob | 精化一次再按语义 key 判 |
| 包级 `build`（语义产物） | `blobs/<splitIdentity>` 存在 | codegen + 规范排序；成功后写 blob + 快指针 |
| 依赖模块接口 | 按地址读 `objects/iface/<addr>` | 缺任一个依赖模块 ⇒ 回退全量（宁可慢，不用错） |
| 依赖身份 | `objects/pkgiface/<key>` 存在 | 回退 `manifest:<toml 摘要>` 身份 |
| 工具会话（LSP/REPL/`map`） | `objects/tool/<addr>` 存在 | 重建会话载荷 |
| `vuna doc` | `objects/doc/<key>` 存在 | 重新解析 + 渲染 |
| 模块 header | `objects/header/<addr>` 存在 | 解析源码取 header |
| 单元级 codegen（`units`） | 文件名存在 + framing 通过 + 载荷依赖 ⊆ 本次单元集 | 重跑该单元 codegen |

`checkIn` / `splitIn` 的输入（缺一不可）：

- 包名 + kind（`exe` / `lib:<导出面摘要>` / `pr0|pr1`）；
- `manifest` = **语义**清单投影（包名、`[export]`、依赖的 alias/source/hash）；
  `[diagnostics]`（纯显示配置）与 `[registry]`（取包位置）**不进指纹**——改诊断格式
  或索引位置不得让整包与依赖方接口失效；
- `src` = **本包**源文件闭包摘要；
- `deps` = 依赖包的**接口身份**（`pkgIfaceHash`；缺接口时回退 manifest 摘要 + 该根源闭包摘要）；
- `ver` = 编译器身份（见下节「编译器身份」）；
- `flags` = 语义开关（`release` / `debug`：release 的 debug-only 构造诊断不同，必须进地址）。

`splitIdentity`（产物身份）的输入：包名 + `pr0|pr1` + `pkgIfaceHash` + `pkgImplHash` +
布局摘要（排序后的定义名/相对文件/startLine）+ 编译器 tag。它不看源字节：注释变更不换
语义 key，行移动换布局摘要，`opaque`/`abstract` 体变更换 `pkgImplHash`。快指针
`objects/splitptr/<splitIn>` 只是「源输入 → 语义产物」的别名，不是身份。

## 编译器身份

缓存 key 里的「编译器」段不是二进制指纹，而是**内容身份**：

- 编译器包（本包模块含 `Vuna.Compiler.Loader.Fingerprint`）的身份 = 本包源闭包（模块名 → 内容哈希，
  按名排序）+ 依赖身份摘要 + `vuna-compiler-id 1`（`Fingerprint.compilerIdOf`）；
- 其他包的身份 = 构建它的编译器的身份（继承）。

`vuna build` / `vuna compile` 把身份写进产物目录的 `build-id`（与 `build.sh` 同级），
`nix/build/packages.nix` 装到 `$out/build-id`；`seed/build-id` 由 rotation 一起生成、随信任锚点
入库。运行时读取顺序：`VUNA_COMPILER_TAG`（排障/测试）→ `$out/build-id`（回退
`$out/bin/build-id`；构建布局读 `DIR/build-id`）→ 路径 + 大小 + mtime 兜底（未安装的临时产物）。

为什么不用二进制内容哈希：OCaml 后端的 DWARF 写构建目录（`DW_AT_comp_dir`），同源两次构建的
字节必然不同，内容哈希无法表达「同源同身份」。

后果：改 `packages/cli/`（工具链）不换编译器身份，不脏编译器缓存；改 `packages/compiler/` 才换代；同一份编译器
源码在任意 worktree / 目录构建得到同一身份；重建同源也不再换代。

## 单一 store 根

对象库是**用户级单一根**（默认 `~/.vuna/store`，`VUNA_STORE` 可覆盖），不按 worktree 分。
多 worktree / 多进程共用一个根是设计内用法：

- 视图、对象、roots 全部按输入摘要寻址 → 另一目录 / 另一 worktree 的同一份输入直接命中；
  实测同一编译器身份下换目录 `check .` ~82 ms、`build .` ~0.6 s（冷态分别 ~49 s / ~28 s）；
- 并发安全由既有机制承担：views 用 `mkdir` 锁串行、roots 只追加、units 只在桶内清理；
- 代价：`vuna clean --store` / `vuna store gc` 是**全局操作**，任一 worktree 执行都会影响
  所有使用者（只影响命中率，不影响正确性）。不要在别人构建时跑 `clean --store`。

必须隔离的四类（理由都不是权限，而是判据/口径）：

| 场景 | 根 | 为什么 |
| --- | --- | --- |
| seed rotation 两遍 | 各自全新的临时根 | 共享缓存会让 runtime 位置表路径归一不同、fixed point 假失败 |
| growth / bench 探针 | 每档空根 | 预热根会把读数磨平 |
| suite（`vuna-run-tests`） | `~/.vuna/test-store` | `52_cache_framing` 会故意截断 blob/lex 对象；共用会打回所有开发缓存 |
| nix 沙箱（checks / packages） | `$TMPDIR` | 宿主 store 不可见，`HOME=/homeless-shelter` 天然回落 |

## 哈希命名（定稿）

| 名称 | 输入面 | 角色 |
| --- | --- | --- |
| `contentHash` | 文件 `(相对路径, 字节)` | 完整性、包对象地址、manifest `hash` |
| `ifaceHash` / `miIfaceHash` / `hashOfIface` | 下游可见语义面（span/path、`opaque`/`abstract` 体排除） | 逻辑指纹：依赖失效 |
| `implHash` / `miImplHash` | 产物面（含 `opaque`/`abstract` 体，不含 span） | 产物身份 |
| `pkgIfaceHash` / `pkgImplHash` | 模块摘要按名排序聚合 | 包接口身份 / 包产物身份 |
| `identityHash` | 包名 + `[export]` + 依赖摘要 + 文件内容摘要 | 分发/pin 身份（manifest `identity` / registry / `vuna pin`；不参与缓存失效） |

## 正确性

- **地址含全部输入**：任何输入变化 ⇒ 新地址 ⇒ 天然 miss。旧对象留着不会被误用。
  模块接口地址 = 包身份 + 模块名 + 自身源摘要 + 包环境 + **每个直接 import 的源摘要**
  （`ifaceAddrOf`），所以依赖变了依赖方的地址就变。
- **同包干净模块复用**（`cache-own-clean`）：接口读得到的模块默认复用；接口读不到的先算脏，
  脏性再沿**重导出链**传播（导出条目的定义处模块是脏模块 ⇒ 本模块也脏，A→B→Z 逐轮）。
  普通 import 不传播（只影响已缓存的实现体），所以叶子模块改动不会把全体传递依赖拖进重精化。
  重导出传播是必须的：依赖的依赖变化不改变依赖方地址，但会改变它重导出的名字集合。
- **删除任何对象都只影响命中率**：输入寻址下「缺了就是未命中、重算」。所以 GC 是性能问题，
  不是正确性问题——这是整套设计的核心性质（包对象族是例外：删了要重新 fetch）。
- **坏字节进不了解码器**：`Base.Store` 的 framing（magic / tag / codec / 长度 / 内容地址）先校验，
  不符即 `Nothing`；调用方按 miss 处理。输入寻址的 blob 用 `storeReadAsEff` 比对期望地址。
- **产物是输入摘要的纯函数**：依赖模块的 `miDefLocs` 并入位置表（§41 回归）；产物身份
  另把本包 `miDefLocs` 计入布局摘要，行移动必然重建。
- **单元缓存读侧按本次程序校验**：`units` 载荷自带依赖表，命中时还要求「文件名声明的
  单元名一致 + 每个依赖都是本次程序的已知单元」。模块集合变化留下的旧 key 文件（或载荷
  与当前程序不一致）按 miss 重算，不会把不存在的单元写进 build.sh 的依赖/stamp 表。
- **模块顺序与缓存状态无关**：split 串接顺序取 import 图的拓扑序，拓扑排序的**起点**
  先按 `(名字内容键, 名字)` 全序排好 —— loader 的模块列表顺序（新加载者前插、预置模块
  在尾）不进语义，同一模块集合在冷/热 store、不同入口下都得到同一份顺序与单元 key。

## roots 与 GC

- 每个项目一个目录 `roots/<项目摘要>/`：`<digest>` 空文件（项目 = 规范化绝对包目录的
  摘要）+ 一个 `.project`（项目绝对目录，只写一次）。项目**只追加**；没有读-改-写，并发
  check/build 不会丢 root。GC 扫所有项目目录里 digest 文件名的并集——A 不需要知道 B
  的存在。读取侧也接受单文件布局（`roots/<项目>` 是文件时先读 digest 列表）。
- 登记的时机：check 判定 marker 提交后、build 的 split blob 提交后、`vuna fetch` 取到包后、
  test verdict 提交后。
- `vuna store gc [--dry-run] [--older-than SEC] [--max-size BYTES]`：
  - **先裁剪项目根**：`.project` 记录的目录已不存在（临时包、删掉的 worktree）或 legacy
    布局没有 `.project` ⇒ 整个 `roots/<项目摘要>/` 丢掉。它只缩小保留集，不影响正确性。
  - 候选 = 缓存族里名字不在保留集合、且 mtime 早于宽限窗口（默认 3600s，覆盖「对象已写、
    root 还没写」的崩溃窗口）；`objects/pkg/` 永不进入候选（包对象族归 `clean --packages`）；
  - `views/bin/` 与 `views/testbin/` 只能**整目录**淘汰（`.complete` 还在时删单文件会让半截视图看起来完整），
    目录名参与 roots 保护；
  - `--max-size` 有值时按 mtime 从旧到新淘汰（文件与 view 目录都计入总量），直到降到上限以下。

## 并发边界（views / units）

- **views/bin**：同一 `splitIn` 的构建用 `mkdir` 锁（`$VUNA_STORE/.tmp/lock-bin-<digest>`）串行化。
  持锁者**直接在最终视图路径构建**（codegen 里的绝对路径保持稳定）；成功后用原子写提交
  `.complete`（内容 = digest），失败则删 partial view 再放锁。等锁者轮询 `.complete`，
  拿不到锁且超时才报错。显式 `--out` 不经过视图锁。
- **views/testbin**：effect 测试二进制按 `testbin 3|指纹|rootsHash|源码` 摘要寻址；与 bin
  视图共用 scratch claim/publish（`storeView*Eff`），命中直接运行。
- **roots**：逐 digest 文件（见上），不需要锁；GC 的宽限窗口覆盖「对象已写、root 还没写」。
- **units**：只做**当前 entry 桶内**的过期 key 清理；不跨 entry 删目录。并发构建不同入口
  不会互相驱逐。桶的容量由 `vuna store gc`（按 mtime / `--max-size`）或
  `vuna clean --store` 管理；删除 unit 只是重算，不影响正确性。split 生成顺序按实际
  依赖图规范化（`canonicalTopo`：层 = 1 + max(依赖层)，同层按名字内容键），并校验该图
  无环 —— 命中集合不同不会让产物或 build.sh 分层漂移。

## 观测

| 标签 | 含义 |
| --- | --- |
| `cache-path=hit` / `cache-path=miss` | 包级 check 判定结果（hit 时重放 Pass/Fail 诊断） |
| `check-store stable=N/M` | 诊断落盘前的稳定性检查（M 条里 N 条 Stable） |
| `check-store write=N` | 诊断载荷写盘返回（0 = 内容未变，1 = 写入） |
| `check-cache=skip volatile` | 结果含 Volatile/绝对路径诊断 ⇒ 不落盘，下次重算 |
| `split-pointer-hit` | build 命中快指针（源码未改动，零精化） |
| `split-identity-hit` | 精化后命中语义产物 blob（注释类改动复用 codegen） |
| `dep-identity=<pkg> verdict=iface|manifest` | 依赖身份取自 `objects/pkgiface` 还是 manifest 回退 |
| `iface-write=N/M` | 本次真的写盘的接口对象数（内容未变的写入不计） |
| `iface-skip partial` | 这次 check 没覆盖 `[export].modules` 的全部模块（判据只看导出面，见 `writeIfaceShadow.exportedOwnOf`；日志带 `closure=`/`required=`/`covered=`/`missing=`），不写接口，等库面那遍写全 |
| `check-lib-skip covered=N` | 入口闭包已写全 N 个导出模块（order 覆盖）⇒ 不再补跑第二遍 lib check |
| `iface-reject=module-order` | 依赖包缺 `objects/order`，无法确定模块顺序 ⇒ 回退全量 |
| `cache-own-clean=N` | 本包可复用的干净模块数 |
| `tool-closure modules=N` | 工具会话的 import 闭包规模 |
| `store-gc candidates=… delete=… total=…` | GC 决策 |

`--debug-perf` / `VUNA_DEBUG_PERF=1` 打开。

**结构化观测**（`VUNA_OBS>=1`，见 [observability.md](observability.md)）走另一条通道：
`Driver/Compile` 与 `Driver/Dt` 的阶段跨度（`vuna.load` / `vuna.elab` / `vuna.iface.compute` /
`vuna.codegen.split` …），与上面 `dbg!` 标签**同时可用但独立开关**。对象库读/写本身是
`ph:"X"` 跨度：`Base.Store` 的 `storeObjectReadEff` / `storeObjectWriteEff`（以及 `storeReadAsEff`）
分别发 `vuna.cache.lookup` / `vuna.cache.write`，所以「慢在哪个对象读写」可以直接在 trace
里归因。排查「为什么 miss」仍靠比对地址：`addrOf` 的输入项都在上面的表里，逐个对即可。

## 诊断载荷与重放

- **载荷就是结果**：`objects/check/<checkIn>` 存 `CheckPassed ds` / `CheckFailed ds` + 诊断列表
  （`Base.Diag.Codec` 规范编码）。命中时直接重放：Pass 返回诊断（通常是 warning），Fail 用首条
  诊断 + children 重建错误通道。失败检查因此也是 O(读对象)，不是每次全量精化。
- **载荷是输入的纯函数**：落盘前把 label 路径规范化为**包相对**路径；含绝对路径或
  `Volatile`（工具/包图/合成、无源码位置）的诊断**不落盘**，下次 miss 重算。读回时按
  当前 `contextDir` 还原路径——同一份内容在不同 checkout / 不同目录共享 store 时，
  输出指向当前项目自己的文件。
- **Pass 只落本包可达的 Stable 诊断**：依赖包 warning 的路径在包目录之外（绝对路径不可跨
  checkout 复用），显示侧本来也会被 `ownedByPackage` 过滤，因此落盘前丢弃并在
  `check-store dropped=N` 里可见；Fail 则要求整条错误 Stable，否则不落盘。
- **坏载荷只降级**：解码失败/截断按 miss 处理并重写；删除对象只是重算。
- **trace 子帧不落盘**：产生侧只生成单层 trace；出现嵌套子帧时需要 bump diag codec。

## 轨道 C 出口门禁

| 层 | 门禁 | 测试 |
| --- | --- | --- |
| 哈希格式 | 编码 roundtrip；固定输入金标；跨目录/跨环境同摘要 | `64_infra`（`pkg-canon-rt` / `pkg-identity-*` / `pkg-golden`）、`78_determinism`（双目录 + TZ/LANG/HOME/TMPDIR 矩阵） |
| 对象库 | 新旧路径 audit 差分；clean/gc 互不误删；对象读写有 span | `44c2` / `44m` / `44q`（check 与 compile 两条 audit）、`59` / `70` / `75` / `77`、`107_observability` |
| 依赖身份 | 依赖方只消费 `pkgIfaceHash`；依赖未重跑不假命中 | `79_dep_identity`（注释 / 透明体 / opaque / 冷热 store / build 快指针） |
| 产物身份 | `pkgImplHash` + 布局；注释/行移动/opaque/abstract 的边界 | `80_code_identity`（本包 + 跨包 q 的 splitptr） |
| 包身份 | `identityHash` 进 manifest/registry/pin/fetch/check | `67` / `68` / `69` / `81` / `64_infra` |
| 单一根 | 换目录/换 worktree 同一输入直接命中；项目根可裁剪；默认根 = `~/.vuna/store`；视图 key 含链接工具链 | `76_store_shared` |

## 已知边界

- **warning 可能不完整**：诊断列表会随 Pass 一起落盘，但「干净模块复用」的那次运行只拿到
  被精化模块的 warning；`-W` / `--deny-warnings` 仍直接绕过判定（不判命中也不提交），
  以保证热缓存下告警完整。普通 `vuna check` 的命中/失败重放不受影响。
- **依赖未重跑时回退身份含源闭包**：`objects/pkgiface` 缺失（依赖还没 check，或依赖源码
  变了还没重跑）时，回退值是 `manifest:<toml 摘要>:<根源闭包摘要>`。源闭包在回退里，
  所以依赖方先跑也不会复用旧判定；代价是依赖**未重跑**时注释变更也会多一次 miss。
  依赖重跑后身份回到 `iface:<pkgIfaceHash>`，注释不敏感的增量性质恢复。
- **入口-only 包不写接口**：单文件夹具没有可复用的库模块面，写接口会让之后的阶段命中缓存而
  跳过精化，`UN_UnusedImport` 这类只在精化期产生的诊断会静默消失。
- **模块顺序是显式对象**：split 串接要精化顺序，而 import 图有环（`base`/`compiler` 都有），
  拓扑排序给不出唯一顺序 ⇒ 写侧把顺序存成 `objects/order`，读侧照它排列。顺序对象的 key =
  包名 + 该包源闭包 + 编译器 tag；读侧还要求顺序里的模块名仍存在于当前闭包，不相容即当
  缺失处理（回退全量，不产错序）。
- `VUNA_ELAB_FULL=1` 强制全量精化（排障 / A-B 对拍）；`VUNA_IFACE_AUDIT=1` 在同一进程跑
  摘要与全量两条路径并逐字节比较诊断与产物；`VUNA_COMPILER_TAG=<tag>` 覆盖编译器身份
  （排障 / 锁「身份进地址」的测试；正常构建不要设置）；`VUNA_OCAML_ID=<id>` 覆盖链接工具链
  身份（`views/bin` key 的一段；devShell 与测试 runner 会自动注入，手工构建时一般不用设）。
