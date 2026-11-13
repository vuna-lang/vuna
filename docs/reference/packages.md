# 包管理与工具链命令

本文覆盖 `vuna.toml` 包格式、workspace / 依赖 DAG，以及产品 CLI 的工具链子命令。
语言语法见 [language.md](language.md)，编译器侧 CLI（`vuna-compiler`）与 seed 的关系见
[bootstrap.md](bootstrap.md)。

## 包管理与工具链

- 包元信息用 `vuna.toml`（TOML 子集）：`[package]`（只有 name）、`[workspace]`（members）、
  `[export]`（modules）、`[diagnostics]`（format / warnings / max-errors，见 [diagnostics.md](diagnostics.md) §5.1）、
  `[dependencies]`（依赖声明，见下节）。TOML 子集支持子表、引号段名（`[releases."1.2.0"]`）、
  点键、内联表、表数组、多行字符串与 `\uXXXX` 转义；**不支持**浮点与日期时间（显式报错，
  不静默近似）。未知 section / key、以及 `[package]` 里出现其他 key 都是错误，不静默忽略
  （`[capabilities]` / `[trust]` / `[privileged]` 已删除，出现即未知 section/key）。
- **workspace 根即一个包**（Cargo 风格）：根 `vuna.toml` 同时含 `[workspace]` 与
  `[package]`；成员是子目录，各自有自己的 `vuna.toml`。本仓库 = 根包 `vuna`（产品 CLI）+
  成员包 `vuna-compiler`（编译器）+ 成员包 `vuna-base`（标准库）；依赖图
  `vuna → vuna-compiler → vuna-base`，根包也直接依赖 `vuna-base`。
- 每包固定三目录：`lib/`（模块根）、`app/`（入口，恒为 `app/Main.vuna`）、`test/`
  （测试模块）。依赖只向下流：`app`/`test` 可用本包 `lib` + 依赖包 `lib`；依赖包之间是
  DAG（循环依赖报错）。
- **包名 ≠ 模块命名空间**：模块名仍由路径决定（`base/lib/Base/List.vuna` ⇔ `Base.List`）；
  每个源文件按**包上下文**解析 import——向上找最近的 `vuna.toml`，可用模块根 = 本包 `lib/`
  + 依赖闭包的 `lib/`（DFS 后序、按包名去重），跨包只认依赖包 `[export]` 列表，隐藏模块报
  `is not exported by package ...`。无 manifest 的文件只有 base 上下文（`VUNA_BASE` 覆盖，
  否则按可执行文件相对布局探测），且这类 ad-hoc 单文件与包内模块一样**自动注入
  `Prelude`**（见 [stdlib.md](stdlib.md)）。**目录入口**（`check/build <dir>`）只认该目录
  自己的 manifest，不向上找。
- **依赖图内包名唯一**：包名参与「同包永远可见」判定，因此同名不同目录是配置错误。同名同
  目录的 diamond 依赖合法；同名不同目录在加载期报 `duplicate package name ...`。
- 编译器 CLI（`compiler/lib/Vuna/Compiler/Driver/CompilerCli.vuna`）：`vuna-compiler` 提供
  `compile/check/build`，入口 `compiler/app/Main.vuna`；**seed 只由这个入口的闭包生成**。
  产品 CLI（`lib/Vuna/Cli.vuna`）通过 in-process 调库实现同样的命令（单一二进制，不 fork
  `vuna-compiler`），并追加工具命令：

  - `vuna compile [--no-print] (<entry.vuna> | <package-dir>) OUTDIR`：DT 精化 → 擦除型
    OCaml，**逐模块**写到 OUTDIR（`Vuna_runtime.ml` + 各模块 + `Main.ml` + `build.sh`），
    成功静默；OUTDIR 必填；
  - `vuna check (<file.vuna> | <package-dir>)`：类型检查（不生成代码）；目录是 workspace
    根时**逐个检查所有成员**（成员错误不再被根 check 忽略）；文件带 `module` 头时按包上下文
    做**单库模块检查**（与编辑器打开该文件同一条链，告警只报本文件；包入口 `app/Main.vuna`
    仍按入口报 `LD_ModuleHeaderInEntryFile`），无头时按入口文件检查（`--continue-on-error`
    的恢复只支持入口）；
  - `vuna build [--no-compile] [--out DIR] [--package NAME] [PKG-DIR]`：默认输出到
    `<PKG-DIR>/.output`（PKG-DIR 缺省 `.`，`--out` 覆盖）；目录是 workspace 根时构建所有
    **可执行**成员（库成员只检查并打印 `skipped (library)`），`--out DIR` 时按
    `DIR/<包名>` 分目录；`--package NAME` 只构建指定包（Nix 构建根包用）；`--no-compile`
    只生成源码目录、不调 `ocamlopt`（非 `--no-compile` 时生成的 `build.sh` 需要 PATH 里有
    `ocamlopt`）；
  - `vuna test [DIR]`：纯测试（`main : String` 空串 / `Int` 0 / `Bool` True 通过）走
    DT 核心求值；`main : Eff [] ...` 走 compile + 运行，退出码 0 通过（可测效果）。DIR 是
    workspace 根时对每个包的 `test/` 聚合；
  - `vuna fmt [--check] [PATH]...`：`Vuna.Fmt` 格式化（2 空格缩进、幂等、可重新 parse；
    保留行注释 / 块注释，超过 100 列时在 RHS、列表字面量、函数应用参数与中缀链处折行；
    模块头显式导出列表逐项一行并按名排序，项注释随项移动；`infix*` 声明按源码顺序打印在
    imports 之后；fixity 取**程序级**可见闭包，见 [operators.md](operators.md)）；省略 PATH
    时格式化 workspace 内所有包的 `lib/app/test`；
  - `vuna interp <file.vuna>`：DT 精化 + 核心求值（纯；不执行效果；入口文件按最近 manifest
    获得包上下文，无则 base-only）；
  - `vuna repl [FILE|DIR|MODULE]`：REPL，定义累积、表达式经 DT 求值（支持 import/记录/
    trait/do；缺签名的 `DFun` 自动推断并回写，失败回滚；与 CLI 同一包上下文）；未闭合
    括号 / 尾随 `=` / `where` / `do` 等自动续行，`:{ ... :}` 块输入；动作表达式经临时包
    compile + 运行执行（每次约 1–2s，需要 `ocamlopt`）；tty 下有行编辑（方向键、Ctrl-R、
    Tab 补全）与颜色，`:load` 接受文件/目录/模块名；
  - `vuna doc [--check] [--package NAME] [DIR [OUT]]`：扫描 `lib/` 生成**单文件交互 HTML**
    API 文档（默认 `DIR/docs/api.html`，gitignored；workspace 根含所有成员包）；`--check`
    报告缺失 docstring 的顶层导出项；docstring / 搜索框 / 类型检索见 [api-docs.md](api-docs.md)；
  - `vuna fetch [--locked] [DIR]`：把不可变源依赖（`git` + `rev`、`url`）取到持久 store；
    `path` 依赖只校验摘要。`--locked` 不联网、只校验已物化。`check`/`build` 永不取包，
    缺对象报 `PKG_NotMaterialized`。布局与失败模式见 [package-store.md](package-store.md)；
  - `vuna add <name>[@<version>] [DIR]`：查 `[registry].index`（目录 / `file://` / `http(s)://`），
    按版本解析出 `(源, hash)`，写回 `[dependencies]` 的内联表行并自动 fetch；
    `--dry-run` 只打印，`--no-fetch` 只改 manifest。索引是便利层，不是身份真源；
  - `vuna clean [--store] [--packages] [--gc] [--all] [--dry-run] [DIR]`：一个 store 根、
    两类生命周期——`--store` 清缓存族（`objects/<kind>`、`blobs`、`units`、`views/bin`、
    `.tmp`），`--packages` 清包对象族（`objects/pkg` + `pkgs` + `tmp`），`--gc` 只删未被
    工作区/项目 roots 引用的包对象，`--all` 两者都清；不带 flag 时只清缓存族。没有树内
    `*.iface`，也没有 `--iface`。见 [cache.md](cache.md) / [package-store.md](package-store.md)；
  - `vuna map [--modules]` / `vuna map --find <Module.name>` / `vuna map --impact
    <Module.name>` / `vuna api <Module.name>`：`Vuna.Index` 的源码符号索引，用于定位定义、
    引用者与建议测试标签；索引会话对象在 `$VUNA_STORE/objects/tool/`，按输入摘要判定
    新鲜度，refs 带行 / 列位置，没有刷新命令；
  - `vuna version` / `vuna --version`：打印 `vuna <版本>`；版本唯一真源是
    `compiler/lib/Vuna/Compiler/Version.vuna`。
- 示例：`examples/multi/` 是多包 workspace（根包 + 成员包 `greet` + `base` 路径依赖），
  `checks.vuna-package` 在 Nix 沙箱里构建并运行它，验证包管理路径可复现。
- 可执行入口：`vuna build` 要求入口 `main : Eff [] a`（运行时执行动作，退出码用 `prim_eff_exit` / `Base.EffExit`）。
  没有 manifest 级能力/特权/信任门控：effectful `prim_*` / `prim_eff_*` 宿主层
  对任何包（用户包、ad-hoc 文件）都可见（直接调用即可）。用户面**应**经 `Base.Eff.*` 标签 +
  handler 使用效果——这是约定与文档纪律，不是强制门控。`vuna interp` 是纯核心求值
  （不执行效果），效果程序用 `compile` + 运行产物。

## 效应边界（manifest 门控已删除）

- 没有 manifest 级能力 / 特权 / 信任机制：`vuna.toml` 不再有 `[capabilities]`、`[trust]`、
  `[privileged]`；`[package]` 只接受 `name`。
- 任何包（用户包、ad-hoc 文件）都可以直接调用 `prim_*` / `prim_eff_*`
  （效果原语是 `Eff []` 叶子）。编译器不再有包级原语白名单、宿主模块 import 门控、`unsafe` 的定义级
  审计，也没有 `REPL --privileged`。旧诊断码 `PKG_EmptyCapability`、
  `PKG_DuplicateCapability`、`PKG_TrustNeedsUnsafe`、`PKG_EmptyTrustPoint`、
  `PKG_DuplicateTrustPoint`、`PKG_InvalidTrustPoint`、`PKG_TrustPointMissing`、
  `PKG_NonPrivileged`、`PKG_EffectCapabilityRequired`、`RN_UnknownCapability`、
  `LD_HostModulePrivileged` 全部删除（未发布、无兼容义务；历史见 git）。
- **用户面纪律（非门控）**：标准库与用户代码**应**经 `Base.Eff.*` 标签 + handler 使用效果
  （入口执行点 `runPure : Eff [] a -> a`）；`prim_*` / `prim_eff_*` 是宿主层 / 底层原语，
  base 的 Eff handler、编译器与根工具链内部仍直接使用它们——不再由编译器强制，只是约定。
- **显式接受的损失**（历史见 git；后续用表示层权限（N2/N3）或新模型补）：宿主层 import 门控、
  每包原语白名单、`unsafe` 定义级审计、网络仅根包可用。仍然有效的边界决策：唯一动作类型
  是 `Eff r a`，入口 `main : Eff [] a`，`vuna interp` 不执行运行时效应。
- **base 的宿主层直接使用点（只读说明）**：`base/vuna.toml` 曾用 `[trust] unsafe` 收敛
  `unsafe` 的直接使用点，机制删除后清单见 git 历史；13 个真实使用点见
  [effects.md](effects.md) §8.6。

## 依赖声明（源 + 摘要）

`[dependencies]` 支持三种等价写法（同一别名只能一种）：

```toml
[dependencies]
greet = "../greet"                                   # 字符串 = path 简写
mathlib = { git = "https://...", rev = "<commit>", hash = "sha256:<64hex>" }  # 内联表

[dependencies.greet]                                 # 子表
path = "../greet"
```

规则（D12/D13）：

| 源 | 必填 | 语义 |
| --- | --- | --- |
| `path = "相对路径"` | 无 `hash`（可写，写了就校验） | 工作树共变的**可变输入**；不复制、不写 store |
| `git = url` + `rev = commit` | `hash = "sha256:<64hex>"` | 不可变源；`vuna fetch` 取到持久 store |
| `url = "..."` | `hash = ...` | URL 直指 `pkg-source 1` 对象文件（不是 tarball） |

- 摘要只固定**不可变源**：改 `path` 依赖的源码**不需要**改任何 manifest（新鲜度由 iface
  接口哈希链负责；回归见 `90/steps_native/67_pkg_deps`）。
- 一个依赖图内包名唯一：无版本号共存；需要多版本只能改名/分叉。
- 未知 key、源字段互斥、`git` 缺 `rev`、不可变源缺 hash 都在加载期报 `PKG_*` 码
  （`PKG_UnknownSourceKey` / `PKG_SourceConflict` / `PKG_GitRevRequired` / `PKG_MissingHash`）。
- 存储布局、fetch 流程与离线边界见 [package-store.md](package-store.md)。

## 包格式速查

```toml
# 根 vuna.toml：workspace 根同时是包（可执行目标）
[package]
name = "vuna"

[workspace]
members = ["compiler", "base"]

[dependencies]
vuna-compiler = "compiler"
vuna-base = "base"
```

```toml
# 成员包（库包）：用 [export] 限定跨包可见的模块（下为节选，完整列表见 base/vuna.toml）
[package]
name = "vuna-base"

[export]
modules = [
  "Base",
  "Base.Pair",
  "Base.Bool",
  "Base.Show",
  "Base.Eq",
  "Base.Ord",
  "Base.List",
  "Base.Nat",
  "Base.Vec",
  "Base.Maybe",
  "Base.Result",
  "Base.String",
  "Base.Sort",
  "Base.Map",
  "Base.Monad",

  "Prelude"
]
```

（`vuna-base` 不在 `[dependencies]` 里依赖别的包；上例的 `[dependencies]` 段从略。
成员包 manifest 只有 `[package]` + `[export]`（可选 `[diagnostics]`、`[dependencies]`）：
没有能力 / 特权 / 信任 section。宿主层直接调用 `prim_eff_*`，原宿主别名模块已删除。）

`[export]` 的每个名字都是模块全名；`[dependencies]` 的值是相对该包目录的路径（lexical
规范化，不做 realpath）。manifest 只被解析与校验（`Vuna.Compiler.Frontend.Manifest`），
文件 I/O 由调用方负责。

## 构建确定性与增量

- **确定性**：同一源码 + 同一编译器产出的 `.ml` / `build.sh` / `build-meta.json` 逐字节
  一致，产物不含绝对路径或时间戳（测试对两次 `build --out` 做逐字节 diff）。
- **build meta**：`build` 链接成功后写 `<out>/build-meta.json`（`compile` 与
  `build --no-compile` 不写，避免污染 seed rotation 与快照）。字段：`schema`、`compiler`、
  `package`、`entry`、`linked`、`closure`、`manifest`、`sources`（模块名 → 内容哈希）、
  `dependencies`（依赖包名 → 闭包哈希）。同哈希 + 二进制存在时 `build` 直接打印
  `up to date:` 跳过。
- **按模块内容哈希增量**：生成的 `build.sh` 按**直接依赖**分层（`depth(u) = 1 + max(depth(dep))`，
  层内单元互不依赖、层间串行），每个模块写 `<module>.stamp`——内容 = 自身 `.ml`/`.mli` 与
  **直接依赖的 `.stamp`** 的哈希（Merkle 式，不读 `.cmi`），命中则跳过重编。判据不用
  mtime，所以 checkout / 复制不会造成全量重编；改一个单元只重编它的直接 / 传递依赖者。
  脚本只需 POSIX sh + `sha256sum` + `ocamlopt`（Nix stdenv 与常规 coreutils 环境都有）。
- **hermetic 边界**：确定性 / 哈希 / 增量由 vuna 保证；**完全 hermetic 的固定工具链由 Nix
  构建承担**。本地 `vuna build` 仍调用宿主 `ocamlopt`；`--no-compile` 只产源码。
- **workspace 单元**：`check` 是所有成员的检查单元；`build` 是全部可执行成员的构建单元
  （库成员 check + skip），`--package` 可只建一个包。

## 工具链命令一览

| 命令 | 说明 |
| --- | --- |
| `vuna compile [--no-print] (<entry.vuna> \| <package-dir>) OUTDIR` | 逐模块 codegen 写到目录（唯一输出模型；成功静默） |
| `vuna check (<file.vuna> \| <package-dir>)` | 类型检查（workspace 根检查所有成员；单文件带 `module` 头 = 库模块检查；不生成代码） |
| `vuna build [--no-compile] [--out DIR] [--package NAME] [PKG-DIR]` | 逐模块 codegen（默认 `<PKG-DIR>/.output`）+ 执行 `build.sh` → `DIR/bin/<包名>`；workspace 根建所有可执行成员 |
| `vuna lint [--fix] <file.vuna>...` | 风格检查与自动修复 |
| `vuna interp <file.vuna>` | DT 精化 + 核心求值（纯；只展示 `Int`/`String`/`Bool`） |
| `vuna test [DIR]` | 纯测试走核心求值；`main : Eff [] ...` 走 compile+运行（退出码 0 通过） |
| `vuna fmt [--check] [PATH]...` | 格式化 |
| `vuna repl [FILE\|DIR\|MODULE]` | 交互式 REPL（自动签名、行编辑/Ctrl-R、颜色；动作表达式经 compile+运行） |
| `vuna doc [--check] [--package NAME] [DIR [OUT]]` | 单文件交互 HTML API 文档（docstring；尊重 `[export]`） |
| `vuna search [--type|--name|--doc] ... <query...>` | 名称 / docstring / 类型检索（Hoogle 式打分；`--json`） |
| `vuna map [--modules]` / `--find` / `--impact` | 源码符号索引（内容哈希缓存；定义、引用位置、建议测试） |
| `vuna api <Module.name>` | 某模块的签名面（含 docstring 与行号） |
| `vuna fetch [--locked] [DIR]` | 取不可变源依赖到持久 store；`--locked` 只校验不联网 |
| `vuna add <name>[@<version>] [DIR]` | 查 `[registry].index` → 写回 `[dependencies]` 并取包（`--dry-run` / `--no-fetch`） |
| `vuna clean [--store] [--packages] [--gc] [--all] [--dry-run] [DIR]` | 清缓存族 / 包对象族（`--gc` 只删未引用包对象） |
| `vuna gen-errors [ROOT]` | 生成错误码文档（默认 `docs/.generated/errors.md`） |
| `vuna version`, `vuna --version` | 版本 |
| `vuna help`, `vuna -h` | 用法 |

每个命令都必须显式书写，不再支持“无子命令 = compile”的旧式回退。没有可选的检查器开关：
所有编译命令都走 DT 精化 + 擦除 codegen，`vuna interp` 总是 DT 精化 + 核心求值。包目录
入口直接作为入口文件交给 `compile` / `check`；`compile`/`build` 的产物统一是逐模块目录
（`--out` 指定 build 的输出目录），seed rotation 用 `build --no-compile --out` +
`nix/seed-rotate.sh`。工具命令的退出码约定：0 成功、1 运行期错误、2 用法 / 参数错误；
不存在路径 / 非 workspace / 非包目录给可读错误，不泄漏宿主异常。详见
[bootstrap.md](bootstrap.md)。

## 相关阅读

- 模块系统与 import 解析：[language.md](language.md)
- `Prelude` 与标准库包：[stdlib.md](stdlib.md)
- 内建 / 原语的声明面与效应语义：[primitives.md](primitives.md)
- 持久包 store 与 fetch：[package-store.md](package-store.md)
- 测试命令的环境变量与 nix 入口：[testing.md](testing.md)
