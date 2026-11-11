# 包管理与工具链命令

本文覆盖 `vuna.toml` 包格式、workspace / 依赖 DAG，以及产品 CLI 的工具链子命令。
语言语法见 [language.md](language.md)，编译器侧 CLI（`vuna-compiler`）与 seed 的关系见
[bootstrap.md](bootstrap.md)。

## 包管理与工具链

- 包元信息用 `vuna.toml`（TOML 子集）：`[package]`（只有 name）、`[workspace]`（members）、
  `[export]`（modules）、`[capabilities]`（effects）、`[trust]`（unsafe 定义级信任点）、
  `[diagnostics]`（format / warnings / max-errors，见 [diagnostics.md](diagnostics.md) §5.1）、
  `[dependencies]`（依赖名 = 相对路径，暂不做 registry）。未知 section / key、以及 `[package]`
  里出现其他 key 都是错误，不静默忽略。
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
    括号 / 尾随 `=` / `where` / `do` 等自动续行，`:{ ... :}` 块输入；`IO` 表达式经临时包
    compile + 运行执行（每次约 1–2s，需要 `ocamlopt`）；tty 下有行编辑（方向键、Ctrl-R、
    Tab 补全）与颜色，`:load` 接受文件/目录/模块名；
  - `vuna doc [--check] [--package NAME] [DIR [OUT]]`：扫描 `lib/` 生成**单文件交互 HTML**
    API 文档（默认 `DIR/docs/api.html`，gitignored；workspace 根含所有成员包）；`--check`
    报告缺失 docstring 的顶层导出项；docstring / 搜索框 / 类型检索见 [api-docs.md](api-docs.md)；
  - `vuna clean-iface [--dry-run] [DIR]`：批量删除 DIR 下的 vuna iface 缓存文件
    （`*.iface` / `.vuna-iface` / 原子写残留 `*.iface.*.tmp`；默认 `DIR=.`，不碰 `.vuna`
    源码）。接口缓存默认写在源文件旁，`VUNA_IFACE_DIR` 可整体镜像到外部根，见
    [cache.md](cache.md)；
  - `vuna map [--modules]` / `vuna map --find <Module.name>` / `vuna map --impact
    <Module.name>` / `vuna api <Module.name>`：`Vuna.Index` 的源码符号索引，用于定位定义、
    引用者与建议测试标签；索引缓存在 `.local/index/`（gitignored），按**内容哈希**判定
    新鲜度（同 size/同 mtime 的内容变更也会失效），refs 带行 / 列位置，没有刷新命令；
  - `vuna version` / `vuna --version`：打印 `vuna <版本>`；版本唯一真源是
    `compiler/lib/Vuna/Compiler/Version.vuna`。
- 示例：`examples/multi/` 是多包 workspace（根包 + 成员包 `greet` + `base` 路径依赖），
  `checks.vuna-package` 在 Nix 沙箱里构建并运行它，验证包管理路径可复现。
- 可执行入口：`vuna build` 要求入口 `main : Eff [] a`（运行时执行动作，退出码用 `exit`）。
  效果内建只有 `prim_*` 名：包必须在 manifest 显式声明能力才能直接调用，未声明的包只能经
  `Base.Host`（推荐路径）；`vuna interp` 是纯核心求值（不执行效果），效果程序用 `compile` +
  运行产物。

## 效应能力

- 包在 `[capabilities] effects` 里**显式声明**可直接使用的 effectful 内建能力：合法值
  `console` / `fs` / `process` / `env` / `clock` / `unsafe`（可任意子集）。`Frontend.Manifest` 只做
  结构校验（空名字 / 重复名字分别报错），合法能力名与放行判定在 Loader：未知名字报
  `unknown capability ...`（typo 不静默降级）；`manifestCapabilities` 是读取入口。
- 能力按**包**生效：同包所有模块共享本包 manifest 的能力；`PackageContext` / `Root` /
  `Module` / `Project` 都携带能力，`Loader.Resolve.checkEffectsBuiltins` 按
  `Vuna.Compiler.Intrinsics` 里每个内建声明的能力位检查。**没有按包名 / 路由的 allowlist**，
  能力声明不可由调用参数伪造；检查覆盖整个源文件（包括未求值的定义），不只看 `main`。
- 能力声明是**特权包专属**：`[capabilities]` / `[trust]` 只能出现在
  `[package] privileged = true` 的 manifest（`vuna-base` / `vuna-compiler` / 根包；测试夹具包
  按需标记）；用户包/ad-hoc 声明即 manifest 错误。宿主层模块由特权包在
  `[privileged] modules = ["Base.Host"]` 里声明（base 的清单），非特权包 import 即
  `LD_HostModulePrivileged`，也不能直调 `prim_*`；用户面宿主效应经 `Base.Eff.*` 标签 +
  handler（`runPure : Eff [] a -> a`）。REPL 默认非特权，`vuna repl --privileged` 才以
  特权上下文求值 ad-hoc 片段。

### 定义级信任点（D28，opt-in 严格模式）

- `[trust] unsafe = ["Module.def", ...]` 是**定义级**信任声明：声明该 section 的包进入
  **严格模式**——只有列表里的定义可以**直接**引用 `unsafe` 门控目标（`intrinsicCapability`
  为 `unsafe` 的内建 `prim_schedNewScope` / `prim_effectPerform` / `prim_effectHandle` /
  `prim_cleanup*` / `prim_sched*`，以及 `runPure` 别名）。其它定义（同包所有模块 +
  入口文件）直调即被 `Loader.Resolve` 拒绝，错误给出定义全限定名、触发的内建名与修复写法。
- 检查是**逐定义**的：`DFun` body 与 instance 方法体里**直接出现**目标名字才需要信任点；
  只经信任入口间接调用的传递调用者不需要列。新增直接使用点必须同时更新清单。
- `[trust]` 是 opt-in：没有该 section 的包保持原有「包级 `unsafe` 能力 + 整模块首个效应」
  检查，不做定义级限制（根包 `vuna` 与 `vuna-compiler` 因此不受影响）。`[trust]` 但能力表
  没有 `unsafe` → 报错；列表项必须是 `Module.def` 形式的字符串且是本包**真实定义**，
  假项在模块解析后报错（`checkTrustPoints`）。入口文件定义没有全限定名，不能作为信任点。
- **base 是唯一 opt-in 方**：`vuna-base` 的 `[trust] unsafe` 是它的安全审计面（直接使用点
  见 `base/vuna.toml`，夹具 `test/corpus/packages/12_trust_points/`）。

- 本仓库声明：根包 `vuna` 与 `vuna-compiler` 声明全部六个能力（含 `unsafe`；工具链在
  main 之外用 `runPure`，没有 `[trust]`，保持包级门控）；`vuna-base` 声明
  `console` / `fs` / `process` / `env` / `clock` / `unsafe`，并用 `[trust] unsafe` 收紧
  `unsafe` 的直接使用点。无 manifest 的 ad-hoc 文件没有能力，直接调用 effectful 内建即被拒。

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

# 直接使用 effectful 内建（本包 = 产品 CLI/工具链）的能力声明
[capabilities]
effects = ["console", "fs", "process", "env", "clock"]
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
  "Base.Host",
  "Base.ST",
  "Prelude"
]

# D28：定义级信任点（opt-in 严格模式）。unsafe 的直接使用点必须显式列出。
[trust]
unsafe = [
  "runPure",
  "Base.ST.runST",
  "Base.Eff.bracket",
  # …完整清单见 base/vuna.toml
]
```

（`vuna-base` 不在 `[dependencies]` 里依赖别的包；上例的 `[dependencies]` 段从略。
`vuna-base` 的 `[capabilities] effects` 列
`["console", "fs", "process", "env", "clock", "unsafe"]`：`Base.Host` 封装了这些能力对应的
`prim_*`；`unsafe` 的直接使用点（`runPure` 执行入口、`Base.Eff` 运行时续延、`Base.EffSched`
调度器原语等）逐条列在 `[trust] unsafe` 里，见
[effects.md](effects.md) 与 `base/vuna.toml`。）

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
| `vuna repl [FILE\|DIR\|MODULE]` | 交互式 REPL（自动签名、行编辑/Ctrl-R、颜色；IO 表达式经 compile+运行） |
| `vuna doc [--check] [--package NAME] [DIR [OUT]]` | 单文件交互 HTML API 文档（docstring；尊重 `[export]`） |
| `vuna search [--type|--name|--doc] ... <query...>` | 名称 / docstring / 类型检索（Hoogle 式打分；`--json`） |
| `vuna map [--modules]` / `--find` / `--impact` | 源码符号索引（内容哈希缓存；定义、引用位置、建议测试） |
| `vuna api <Module.name>` | 某模块的签名面（含 docstring 与行号） |
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
- 测试命令的环境变量与 nix 入口：[testing.md](testing.md)
