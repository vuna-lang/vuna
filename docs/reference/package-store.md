# 包存储与获取（package store / fetch）

本文记录**依赖如何被固定、包对象存在哪里、check/build 如何离线复用**。包格式与命令
一览见 [packages.md](packages.md)；终态方向与决策（D12–D15）见
[architecture-target.md](../architecture-target.md)。

## 1. 两个摘要，输入面不同

| 摘要 | 输入 | 用途 | 何时变 |
| --- | --- | --- | --- |
| **内容摘要** `contentHash` | `vuna.toml` + `lib/**/*.vuna` + `app/**/*.vuna` + `test/**/*.vuna` 的 `(相对路径, 字节)`，按路径升序 | 不可变源的完整性校验（manifest 的 `hash`） | 任何文件字节变化（含注释、测试） |
| **语义身份** `identityHash` | 包名 + `[export]` + 各依赖的 `(别名, 摘要)` + 每个文件的 `(路径, 内容摘要)` | 缓存失效 / `pmEnv` | 声明面或任何源码语义变化；**不含**绝对路径、mtime、注释、测试目录以外的非文件信息 |

规范编码在 `Vuna.Compiler.Canonical.Pkg`（codec `pkg-source 1`，原子文法同
`Canonical.Bytes`：`#tag;` / `i<n>;` / `s<len>:<bytes>` / `b0|b1` / `[<n>:…]`）。
roundtrip 自检：`examples/infra` 的 `pkg-canon-rt` / `pkg-identity-rt`。

**为什么 `path` 依赖不写摘要**（D12）：`path` 是工作树共变的可变输入，正确性由
「源内容哈希 → 模块接口哈希 → 依赖接口哈希链」保证；把摘要写进 manifest 会让每次改
依赖源码都要改上游 manifest，把「完整性」错配到「日常开发」。`git` / `url` 是不可变源，
必须带 `hash`。

## 2. store 布局

```text
$VUNA_STORE                     # 默认 $XDG_DATA_HOME/vuna/store，回退 ~/.vuna/store
  objects/pkg/<64hex>           # 包对象族：`pkg-source 1` 载荷 + Store framing，地址 = 内容摘要
  pkgs/<64hex>/                 # 物化视图（可删可重建），最后写 .complete（内容 = 摘要）作为提交点
  tmp/                          # 取包中转（git clone 等）
  roots/<项目摘要>/<digest>     # fetch 登记的项目保留集合（跨项目 GC 保护）
```

- **对象是唯一真源**：内容摘要即对象地址；写用 `prim_eff_writeFileAtomic`。
- **物化视图可丢弃**：读前校验 `.complete`，缺失/不符就重建；并发重复物化幂等。
- framing 复用 `Vuna.Compiler.Store`，但 tag **不含编译器指纹**（`pkg-source/1`）：
  包对象只是源码字节，跨编译器版本复用。
- **同一个根、两类生命周期**（D15）：缓存族（`objects/<kind>/`、`blobs/`、`units/`、
  `views/`、`.tmp/`、`roots/`）由 `vuna store gc` / `clean --store` 管理；包对象族
  （`objects/pkg/`、`pkgs/`、`tmp/`）由 `clean --packages` 管理。包对象放在 `objects/pkg/`
  这个 kind 目录下，是为了让两族的清理/GC 作用域不互相误删。
- **fetch 登记 roots**：`vuna fetch` 把取到的包摘要写进发起项目的 roots，`clean --packages
  --gc` 取所有项目 roots 的并集 ⇒ 共享 store 上不会误删别的项目取过的对象（D73）。

## 3. 获取（`vuna fetch`）

```console
vuna fetch [--locked] [DIR]
```

| 源 | 行为 |
| --- | --- |
| `path` | 不复制、不写 store；声明了 `hash` 就校验（不符报 `PKG_HashMismatch`），没写则打印当前摘要 |
| `git` + `rev` + `hash` | 已物化 ⇒ `cached`；否则克隆到 `tmp/` → checkout `rev` → 收集内容 → 校验摘要 → 写对象 + 物化 |
| `url` + `hash` | URL 直指 **`pkg-source 1` 对象文件**（不是 tar/压缩包；vuna 没有解压原语），下载后按 framing + 内容地址校验 |

- **只有 fetch 联网**：`check` / `build` / `test` 只读 store，缺对象报
  `PKG_NotMaterialized`（消息里带 `vuna fetch` 提示），绝不隐式取包。
- `--locked`：不联网，只检查 store 是否已物化；缺失即失败。
- 传输外置给宿主：`git`（clone/checkout）与 `curl`（URL 下载）。语言内只有裸 TCP 原语，
  **不实现 TLS**；HTTPS 由宿主工具的证书栈承担。
- 摘要不符时**不写 store、不物化**：说明源被改写或声明过期，需人工确认后用正确摘要重写。

## 4. 解析与失败模式

`Vuna.Compiler.Packages.Pkg` 的依赖定位：

```text
DepPath rel      → <包目录>/<rel>
DepGit/DepUrl    → $VUNA_STORE/pkgs/<normalizeHash hash>   （校验 .complete）
```

- 缺失/损坏 ⇒ `PKG_NotMaterialized`；hash 不符（path 显式锁定时）⇒ `PKG_HashMismatch`。
- **包名唯一性不变**：一个依赖图内同名包只能出现一次（无版本号，D13）；需要多版本
  只能改名/分叉。
- 只读 store（Nix 沙箱）：fetch 失败，已物化可直接 build；Nix 构建应把 store 目录作为
  输入（`fetchgit` + 预物化），而不是在构建里联网。

## 5. 清理

```console
vuna clean --store                  # 清缓存族（objects/<kind>、blobs、units、views/bin、.tmp）
vuna clean --packages [--dry-run]   # 清包对象族（objects/pkg + pkgs + tmp）
vuna clean --packages --gc [DIR]    # 只删未被工作区/项目 roots 引用的包对象
vuna clean --all                    # 两族都清
vuna store gc [--dry-run] [--older-than SEC] [--max-size BYTES]   # 缓存族按 roots + grace 淘汰
```

不带 flag 时只清缓存族（默认**不碰**包对象族：对象跨项目复用，误删代价是重新取包）。
`--store` 保留 `objects/pkg`、`pkgs`、`roots`；`--packages` 保留缓存族与 `roots`。当前没有
按引用计数的 GC；`--packages` 是整族清理，`--gc` 的引用集是「声明 + 所有项目 roots」，
roots 只追加（删除依赖后旧对象仍受保护，直到显式整族清理）。

## 6. 静态索引与 `vuna add`（阶段 2）

索引是**可选**的便利层（D14）：`name [@version] → (源, hash)`。

```toml
# index/<name>.toml（[releases."<version>"] 用引号段名）
[package]
name = "greet"

[releases."1.2.0"]
git = "https://..."        # 或 url = "..."（pkg-source 对象文件）
rev = "<commit>"
hash = "sha256:<64hex>"
```

包 manifest 里声明索引位置：

```toml
[registry]
index = "../registry"      # 目录 / file:// / http(s)://（后者由宿主 curl 取一次）
```

```console
vuna add greet@1.2.0 [DIR] [--dry-run] [--no-fetch]
```

- 无版本时取索引里的**最后一个**发布；版本精确匹配；版本不存在报可读错误（退出码 2）。
- 写回 `[dependencies]` 段的内联表行：同名行替换，否则段末追加；子表形式不猜、报错让
 用户手改。
- 默认随后 `vuna fetch`（命中 `cached` 不重复取）；`--no-fetch` 只改 manifest，
  `--dry-run` 只打印。
- **索引不可信**：写回的永远是摘要，之后 fetch/check 只认摘要。

## 7. GC（阶段 3）

```console
vuna clean --packages --gc [--dry-run] [DIR]
```

引用集 = `DIR` 的 manifest 与 `[workspace].members`（**递归嵌套**）里 `git` / `url` 依赖的
摘要（`path` 依赖不参与，D12）**∪ 所有项目 roots**。只删 `objects/pkg/<digest>` 与
`pkgs/<digest>/...` 中不被引用的文件；空目录会残留（与 `clean --store` 一致，只删文件）。
不带 `--gc` 的 `--packages` 仍是整族清理。`--gc` 必须与 `--packages` 连用。
`vuna fetch` 把取到的摘要登记进发起项目的 roots，因此共享 store 上 A 项目取过的包不会被
B 项目的 `--gc` 误删（D73）；roots 只追加，删除依赖后旧对象仍受保护，直到整族清理。

## 8. 已知边界

- **无版本号 / 无 lockfile**：manifest 即锁文件；`path` 依赖不锁定。
- **无 registry 服务器**：静态索引（`name → version → (源, hash)`）是下一阶段的便利层，
  不是真源；包名只是本地别名，不需要全局唯一命名。
- **`url` 不是 tarball**：没有 tar/zip/解压原语，URL 只能是 `pkg-source 1` 对象文件。
- **git/curl 由宿主提供**：缺失时是宿主错误（与 `vuna build` 依赖 `ocamlopt` 同级）。
- **无签名/信任**：摘要只保证完整性，来源可信性由用户选择的 URL 决定。
- **导出面**：新模块 `Canonical.Pkg` / `Packages.Source` 在 `compiler/vuna.toml` 的
  `[export]` 列表里，跨包（如 `examples/infra`）可直接 import。

## 9. 测试标签

- `90/steps_native/67_pkg_deps`：依赖声明三路写法、摘要规则、结构错误码、改依赖源码
  不动 manifest 的回归。
- `90/steps_native/68_pkg_fetch`：本地 git 仓库取包、摘要不符、`--locked`、离线 check、
  `clean --packages`、`pin`。
- `90/steps_native/69_pkg_registry`：本地静态索引、`add` 的 dry-run/写回/自动 fetch/幂等、
  版本不存在、`--no-fetch`、`[registry]` 未知 key。
- `90/steps_native/70_pkg_gc`：`clean --packages --gc` 保留被工作区/项目 roots 引用的对象、
  删除游离对象、跨项目 roots 保护、`--gc` 必须配 `--packages`。
- `90/steps_native/64_infra`：`pkg-canon-rt` / `pkg-identity-*`（规范编码与两种摘要的输入面）。

## 相关阅读

- 包格式与命令：[packages.md](packages.md)
- 终态决策（D12–D15）：[architecture-target.md](../architecture-target.md)
- 缓存：[cache.md](cache.md)（输入寻址对象库）
- 存储层 framing：[cache.md](cache.md) 的「存储与 key」