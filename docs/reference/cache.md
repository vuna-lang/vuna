# 输入寻址对象库

本文记录 vuna **唯一对象库的形态**：一切可复用产物都是「按输入摘要寻址的对象」，存在即
命中。没有查询图、没有会话索引、没有依赖快照比较、没有写锁。

对象库只保留三个域：

| 域 | 内容 | 生命周期 |
| --- | --- | --- |
| `module-iface` | 模块级精化结果（闭合产物 + 已解析 decls + exports/fixities/imports + `miIfaceHash`/`miDepHashes`/`miSource`/`miDefLocs`） | 缓存；可删可重建，`clean --store` / `gc` 管理 |
| `pkg-summary` | 包摘要：模块精化顺序 + 依赖方消费的 `pkgIfaceHash` | 身份/决策记录；GC 不淘汰，仅显式 `clean --store` 清理 |
| `pkg` | 取来的包源码（`pkg-source 1`，见 [package-store.md](package-store.md)） | 显式 fetch；`clean --packages` 管理 |

`views/`、`check-outcome`、`tool-context`、`target-out`、`module-header`、`units`、`blobs`、
`splitptr` 都已删除。默认 `vuna build` 直接写 `<pkg>/.output`；effect 测试与 REPL 动作在
私有临时目录编译运行；LSP/REPL 的 `ToolContext` 只在内存保留。

## 存储布局

```
$VUNA_STORE/                       # 唯一根：VUNA_STORE → XDG → ~/.vuna/store → $TMPDIR/vuna-store
  objects/module-iface/<模块接口地址>  # 模块接口（codec module-iface 6；带实例/方法 span）。
                                    # 入口包（`[export]` 为空）也写：模块面 = 入口闭包，
                                    # 供 LSP/REPL 把本包模块当干净模块预置
  objects/pkg-summary/<键>          # 包摘要：模块顺序 + 接口身份（codec pkg-summary 1）
  objects/pkg/<64hex>               # 取包对象族（`pkg-source 1`，见 package-store.md）
  pkgs/<64hex>/                     # 包物化视图（可删可重建）
  roots/<项目摘要>/.project         # 项目绝对目录（包 GC 据此清理已消失的项目根）
  roots/<项目摘要>/<digest>         # fetch 登记的项目保留集合（跨项目 GC 保护）
  tmp/                              # 取包中转（可删）
```

所有地址 = `addrOf [kind, ...输入摘要]`（`Vuna.Compiler.Loader.Addr`，SHA-256）。

## 命中判定

| 场景 | 判据 | 未命中的代价 |
| --- | --- | --- |
| 包级 `check` | 按地址读依赖与同包模块的 `objects/module-iface/<addr>` | 精化脏模块；缺任一依赖模块 ⇒ 回退全量 |
| 包级 `build` | 没有产物缓存：每次都精化脏模块 → codegen → 链接 | 冷构建的完整成本 |
| 同树重复 `build` | `<pkg>/.output` 的 `meta` 与当前输入一致 | 重跑 codegen + `ocamlopt` |
| 依赖身份 | `objects/pkg-summary/<键>` 命中 ⇒ `iface:<pkgIfaceHash>` | 回退 `manifest:<toml 摘要>:<根源闭包摘要>` |
| 模块顺序 | 同一 `pkg-summary` 载荷里的 `psOrder` | 回退全量（宁可慢，不产错序） |

`buildViewKey` / `checkIn` 已随 `views` / `check-outcome` 删除；包的构建输入由
`buildMetaText` 直接写进 `.output/build-meta.json`。

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

### 缓存命名空间（`cache-tag`）

`build-id` 只由**源码闭包**决定：同一份源码由不同 seed 构建出的二进制仍共享 `build-id`
（旋转窗口内两者并不保证行为一致）。接口摘要、包摘要等缓存对象如果只按 `build-id` 寻址，
就可能把旧二进制写的结果当成本二进制的。

因此缓存键另有一层**二进制身份** `cache-tag`：`nix/build/packages.nix` 在构建
`vuna-seed` / `vuna-compiler` / `vuna-native` 后写入 `$out/cache-tag`（= 产物二进制的 sha256），
产品安装时复制同一个文件。每个插件派生也把 stage 1 的 `cache-tag` / `build-id` 原样装到自己
的 `$out/`：插件进程里的工具链读可执行文件旁的身份，必须与编译器插件一致。运行时读取顺序：
`VUNA_CACHE_TAG`（排障/测试）→ `$out/cache-tag` → 回退 `build-id`（开发构建与旧安装）。

它只参与缓存 key，不写进产物、不参与 rotation 的 fixed point（`seed/build-id` 仍是源码身份）。
代价是同一源码的两次字节不同构建会各自冷一次缓存；这是正确性优先的取舍。

## 单一 store 根

对象库是**用户级单一根**（默认 `~/.vuna/store`，`VUNA_STORE` 可覆盖），不按 worktree 分。
多 worktree / 多进程共用一个根是设计内用法：

- 模块接口按输入摘要寻址 → 另一目录 / 另一 worktree 的同一份输入直接命中；
- 并发安全由既有机制承担：单文件对象用原子写，roots 只追加；
- 代价：`vuna store clean --store` / `vuna store gc` 是**全局操作**，任一 worktree 执行都会影响
  所有使用者（只影响命中率，不影响正确性）。不要在别人构建时跑 `clean --store`。
- Nix 里不共享可变 store：`packages.vuna-store` 先把依赖包 `check` 成只读快照，每个插件
  派生把它拷进自己的 `$TMPDIR` 再构建——读到的对象跨派生复用，写只落在各自的副本上。

必须隔离的几类（理由都不是权限，而是判据/口径）：

| 场景 | 根 | 为什么 |
| --- | --- | --- |
| seed rotation 两遍 | 各自全新的临时根 | 共享缓存会让 runtime 位置表路径归一不同、fixed point 假失败 |
| growth / bench 探针 | 每档空根 | 预热根会把读数磨平 |
| suite（`vuna-run-tests`） | `~/.vuna/test-store` | `52_cache_framing` 会故意截断接口对象；共用会打回所有开发缓存 |
| nix 沙箱（checks / packages） | `$TMPDIR` | 宿主 store 不可见，`HOME=/homeless-shelter` 天然回落 |

## 哈希命名（定稿）

| 名称 | 输入面 | 角色 |
| --- | --- | --- |
| `contentHash` | 文件 `(相对路径, 字节)` | 完整性、包对象地址、manifest `hash` |
| `ifaceHash` / `miIfaceHash` / `hashOfIface` | 下游可见语义面（span/path、`opaque`/`abstract` 体排除） | 逻辑指纹：依赖失效 |
| `pkgIfaceHash` | 模块摘要按名排序聚合 | 包接口身份（依赖身份） |
| `identityHash` | 包名 + `[export]` + 依赖摘要 + 文件内容摘要 | 分发/pin 身份（manifest `identity` / registry / `vuna deps pin`；不参与缓存失效） |

`implHash` / `pkgImplHash` 已随产物缓存删除。

## 正确性

- **地址含全部输入**：任何输入变化 ⇒ 新地址 ⇒ 天然 miss。旧对象留着不会被误用。
  模块接口地址 = 包身份 + 模块名 + 自身源摘要 + 包环境 + **每个直接 import 的源摘要**
  （`ifaceAddrOf`），所以依赖变了依赖方的地址就变。
- **同包干净模块复用**（`cache-own-clean`）：接口读得到的模块默认复用；接口读不到的先算脏，
  脏性再沿**重导出链**传播（导出条目的定义处模块是脏模块 ⇒ 本模块也脏，A→B→Z 逐轮）。
  普通 import 不传播（只影响已缓存的实现体），所以叶子模块改动不会把全体传递依赖拖进重精化。
  **写侧同样复用**：`writeIfaceShadowWithClean` 拿同一份干净表，只对脏模块重算 `cachedOfProgram`
  + 7 张表哈希并写回（干净模块的接口已经在它的地址上）。
- **删除任何对象都只影响命中率**：输入寻址下「缺了就是未命中、重算」。所以 GC 是性能问题，
  不是正确性问题——这是整套设计的核心性质（包对象族是例外：删了要重新 fetch）。
- **坏字节进不了解码器**：`Base.Store` 的 framing（magic / tag / codec / 长度 / 内容地址）先校验，
  不符即 `Nothing`；调用方按 miss 处理。输入寻址的接口对象用 `storeReadAsEff` 比对期望地址。
- **产物是输入摘要的纯函数**：依赖模块的 `miDefLocs` 并入位置表（§41 回归）；同一输入重复
  build 的 `.output` 由 `build-meta.json` 判新鲜。
- **模块顺序与缓存状态无关**：split 串接顺序取 `pkg-summary.psOrder`（精化顺序，非拓扑序，
  因为 `base`/`compiler` 的 import 图有环）；缺失 ⇒ 回退全量，不产错序。
- **pkg-summary 缺失的回退**：`manifest:<toml 摘要>:<根源闭包摘要>`；依赖源闭包在回退里，
  所以依赖源码变了而依赖方先跑，也必然换地址，不会复用旧判定。

## roots 与 GC

- 每个项目一个目录 `roots/<项目摘要>/`：`<digest>` 空文件（项目 = 规范化绝对包目录的
  摘要）+ 一个 `.project`（项目绝对目录，只写一次）。项目**只追加**，没有读-改-写，并发
  fetch 不会丢 root。
- 登记时机：**只有 `vuna deps fetch`** 把取到的包摘要写进发起项目的 roots。check/build/test
  不再登记 roots（缓存对象只靠 age/size 淘汰）。
- `vuna store gc [--dry-run] [--older-than SEC] [--max-size BYTES]`：
  - **先裁剪项目根**：`.project` 记录的目录已不存在（临时包、删掉的 worktree）或 legacy
    布局没有 `.project` ⇒ 整个 `roots/<项目摘要>/` 丢掉；
  - 候选 = `objects/module-iface` 里 mtime 早于宽限窗口（默认 3600s）的文件；
  - `--max-size` 有值时按 mtime 从旧到新淘汰，直到降到上限以下；
  - `objects/pkg/` 永不进入候选（源对象族归 `clean --packages`），`objects/pkg-summary`
    是身份记录，也不进入候选。

## 观测

| 标签 | 含义 |
| --- | --- |
| `cache-path=full` / `cache-path=summary` | 本次 check 走全量还是接口摘要路径 |
| `cache-own-clean=N` | 本包可复用的干净模块数 |
| `iface-write=N/M` | 本次真的写盘的接口对象数（内容未变的写入不计） |
| `iface-skip partial` | 这次 check 没覆盖 `[export].modules` 的全部模块（日志带 `closure=`/`required=`/`covered=`/`missing=`） |
| `check-lib-skip covered=N` | 入口闭包已写全 N 个导出模块（order 覆盖）⇒ 不再补跑第二遍 lib check |
| `iface-reject=pkg-summary` | 依赖包缺 `pkg-summary`，无法确定模块顺序 ⇒ 回退全量 |
| `dep-identity=<pkg> verdict=iface|manifest` | 依赖身份取自 `pkg-summary` 还是 manifest 回退 |
| `store-gc candidates=… delete=… total=…` | GC 决策 |

`VUNA_LOG=debug` 打开。

**结构化观测**（`VUNA_OBS>=1`）走另一条通道：`Driver/Compile` 与 `Driver/Dt` 的阶段跨度
（`vuna.load` / `vuna.elab` / `vuna.iface.compute` / `vuna.codegen.split` …）。对象库读/写本身是
`ph:"X"` 跨度：`Base.Store` 的 `storeObjectReadEff` / `storeObjectWriteEff` 分别发
`vuna.cache.lookup` / `vuna.cache.write`。

## 已知边界

- **warning 可能不完整**：`-W` / `--deny-warnings` 强制本包模块重新精化（依赖包仍复用接口），
  普通 `vuna check` 不显示 warning。
- **依赖未重跑时回退身份含源闭包**：`objects/pkg-summary` 缺失（依赖还没 check，或依赖源码
  变了还没重跑）时，回退值是 `manifest:<toml 摘要>:<根源闭包摘要>`；依赖方先跑也不会复用
  旧判定，代价是依赖**未重跑**时注释变更也会多一次 miss。
- **入口-only 包不写接口**：单文件夹具没有可复用的库模块面，写接口会让之后的阶段命中缓存而
  跳过精化，`UN_UnusedImport` 这类只在精化期产生的诊断会静默消失。
- **没有 check 结果重放**：失败的 `check` 每次都重新精化（干净模块仍复用），不再落盘 Pass/Fail。
- **没有构建产物缓存**：默认 build 只在 `.output` 的 `meta` 与输入一致时跳过；显式
  `--no-compile --out` 每次重跑 codegen。
- **没有工具会话持久化**：`vuna map` / `api` 每次重建索引（约 3 s）；LSP/REPL 只在进程内
  复用 `ToolContext`。
- `VUNA_ELAB_FULL=1` 强制全量精化（排障 / A-B 对拍）；`VUNA_IFACE_AUDIT=1` 在同一进程跑
  摘要与全量两条路径并逐字节比较诊断与产物；`VUNA_COMPILER_TAG=<tag>` 覆盖编译器身份。
- `VUNA_IFACE_WRITE=0` 跳过接口影子写（计算 + 落盘）：只在「这个 store 写完就丢」的一次性
  构建里用（自举 / CI 的每级全新对象库，脚本已默认设置）；常驻 store 上关掉会让下一次
  构建失去接口复用，只能回退全量。