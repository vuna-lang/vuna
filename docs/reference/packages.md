# 语言参考：包管理与工具链命令

本文覆盖 `vuna.toml` 包格式、workspace / 依赖 DAG，以及产品 CLI 的工具链子命令。
语言语法见 [language.md](language.md)，编译器侧 CLI（`vuna-compiler`）与 seed 的关系
见 [bootstrap.md](bootstrap.md)。

## 包管理与工具链（M11.5 / M12.5）

- 包元信息用 `vuna.toml`（TOML 子集）：`[package]`（name/version/edition）、
  `[workspace]`（members）、`[export]`（modules）、`[dependencies]`
  （依赖名 = 相对路径，暂不做 registry）。
- **workspace 根即一个包**（Cargo 风格）：根 `vuna.toml` 同时含 `[workspace]` 与
  `[package]`；成员是子目录，各自有自己的 `vuna.toml`。本仓库 = 根包 `vuna`（产品
  CLI）+ 成员包 `vuna-compiler`（编译器）+ 成员包 `vuna-base`（标准库）；依赖图
  `vuna → vuna-compiler → vuna-base`，根包也直接依赖 `vuna-base`。
- 每包固定三目录：`lib/`（模块根）、`app/`（入口，恒为 `app/Main.vuna`）、
  `test/`（测试模块）。依赖只向下流：`app`/`test` 可用本包 `lib` + 依赖包 `lib`；
  依赖包之间是 DAG（循环依赖报错）。
- **包名 ≠ 模块命名空间**：模块名仍由路径决定（`base/lib/Base/List.vuna` ⇔
  `Base.List`）；每个源文件按**包上下文**解析 import——向上找最近的 `vuna.toml`，可用
  模块根 = 本包 `lib/` + 依赖闭包的 `lib/`（DFS 后序、按包名去重），跨包只认依赖包
  `[export]` 列表，隐藏模块报 `is not exported by package ...`。无 manifest 的文件只有
  base 上下文（`VUNA_BASE` 覆盖，否则按可执行文件相对布局探测），且这类 ad-hoc 单文件
  与包内模块一样**自动注入 `Prelude`**（见 [stdlib.md](stdlib.md)）。**目录入口**
  （`check/build <dir>`）只认该目录自己的 manifest，不向上找。
- **依赖图内包名唯一（M24.7）**：包名参与「同包永远可见」与 effectful 内建 allowlist
  判定，因此同名不同目录是配置错误。同名同目录的 diamond 依赖合法；同名不同目录在加载
  期报 `duplicate package name ...`（M24.7 前的旧实现会按包名去重、静默丢弃整支依赖）。
- 编译器 CLI（`compiler/lib/Vuna/Compiler/Driver/CompilerCli.vuna`）：`vuna-compiler` 提供
  `compile/check/build`，入口 `compiler/app/Main.vuna`；**seed 只由这个入口的闭包
  生成**。产品 CLI（`lib/Vuna/Cli.vuna`）通过 in-process 调库实现同样的命令，并追加
  工具命令：

  - `vuna compile [--no-print] (<entry.vuna> | <package-dir>) OUTDIR`：DT 精化 → 擦除型
    OCaml，**逐模块**写到 OUTDIR（`Vuna_runtime.ml` + 各模块 + `Main.ml` + `build.sh`），
    成功静默；OUTDIR 必填；
  - `vuna check (<entry.vuna> | <package-dir>)`：类型检查（不生成代码）；
  - `vuna build [--no-compile] [--out DIR] [PKG-DIR]`：默认输出到 `<PKG-DIR>/.output`（PKG-DIR 缺省 `.`，`--out` 覆盖）；先做
    逐模块 DT codegen，再执行生成的 `build.sh`（受限进程执行内建调 `ocamlopt`）产出
    `DIR/bin/<包名>`；`--no-compile` 只生成源码目录、不调 `ocamlopt`；
  - `vuna test [DIR]`：经 `Vuna.Interp` 用 DT 核心求值执行 `test/*.vuna`，
    `main : String` 空串通过，非空为失败信息（不走效果）；
  - `vuna fmt [--check] [PATH]...`：`Vuna.Fmt` 格式化（2 空格缩进、幂等、可重新
    parse；M11.6 起**保留行注释/块注释**，超过 100 列时在 RHS、列表字面量、
    函数应用参数与中缀链处折行；模块头显式导出列表逐项一行并按名排序，项注释随项
    移动）；省略 PATH 时格式化 workspace 内所有包的
    `lib/app/test`（拆包后自动覆盖 `compiler/lib`）；
  - `vuna interp <file.vuna>`：DT 精化 + 核心求值（纯；不执行效果；入口文件按最近
    manifest 获得包上下文，无则 base-only）；
  - `vuna repl`：行式 REPL，定义累积、表达式经 DT 求值（支持 import/记录/trait/do；
    顶层定义必须先写签名；与 CLI 同一包上下文）；
  - `vuna doc [DIR] [OUT]`：扫描 `lib/` 生成 Markdown API 文档（默认
    `DIR/docs/api.md`，仓库的 `docs/api.md` 是生成物、gitignored）；
  - `vuna map [--modules]` / `vuna map --find <Module.name>` / `vuna map --impact
    <Module.name>` / `vuna api <Module.name>`：`Vuna.Index` 的源码符号索引，用于定位
    定义、引用者与建议测试标签；索引缓存在 `.local/index/`（gitignored），按
    mtime+size 自动判定新鲜度，没有刷新命令。
- 示例：`examples/multi/` 是多包 workspace（根包 + 成员包 `greet` + `base` 路径依赖），
  `checks.vuna-package` 在 Nix 沙箱里构建并运行它，验证包管理路径可复现。
- 可执行入口：`vuna build` 要求入口 `main : IO a`（运行时执行动作，退出码用 `exit`）。
  普通用户包不能直接调用 effectful 内建（`print` / `readFile` / ...），只能经 `Base.IO`；
  编译器、产品 CLI、`vuna-base` 自身在包级 allowlist 内；`vuna interp` 是纯核心求值
  （不执行效果），效果程序用 `compile` + 运行产物。

## 包格式速查

```toml
# 根 vuna.toml：workspace 根同时是包（可执行目标）
[package]
name = "vuna"
version = "0.1.0"
edition = "2026"

[workspace]
members = ["compiler", "base"]

[dependencies]
vuna-compiler = "compiler"
vuna-base = "base"
```

```toml
# 成员包（库包）：用 [export] 限定跨包可见的模块
[package]
name = "vuna-base"
version = "0.1.0"
edition = "2026"

[export]
modules = [
  "Base",
  "Base.Pair",
  "Base.Bool",
  "Base.List",
  "Base.Maybe",
  "Base.Result",
  "Base.String",
  "Base.Sort",
  "Base.Map",
  "Base.Monad",
  "Base.IO",
  "Prelude"
]
```

（`vuna-base` 不在 `[dependencies]` 里依赖别的包；上例的 `[dependencies]` 段从略。）

`[export]` 的每个名字都是模块全名；`[dependencies]` 的值是相对该包目录的路径
（lexical 规范化，不做 realpath）。manifest 只被解析与校验（`Vuna.Compiler.Frontend.Manifest`），
文件 I/O 由调用方负责。

## 工具链命令一览

| 命令 | 说明 |
| --- | --- |
| `vuna compile [--no-print] (<entry.vuna> \| <package-dir>) OUTDIR` | 逐模块 codegen 写到目录（唯一输出模型；成功静默） |
| `vuna check (<entry.vuna> \| <package-dir>)` | 类型检查（不生成代码） |
| `vuna build [--no-compile] [--out DIR] [PKG-DIR]` | 逐模块 codegen（默认 `<PKG-DIR>/.output`）+ 执行 `build.sh` → `DIR/bin/<包名>` |
| `vuna lint [--fix] <file.vuna>...` | 风格检查与自动修复 |
| `vuna interp <file.vuna>` | DT 精化 + 核心求值（纯；只展示 `Int`/`String`/`Bool`） |
| `vuna test [DIR]` | 用 DT 核心求值执行包内 `test/*.vuna`（`main : String`，空串通过） |
| `vuna fmt [--check] [PATH]...` | 格式化 |
| `vuna repl` | 交互式 REPL（同一包上下文） |
| `vuna doc [DIR [OUT]]` | 生成 Markdown API 文档 |
| `vuna map [--modules]` / `--find` / `--impact` | 源码符号索引（定义、引用者、建议测试） |
| `vuna api <Module.name>` | 某模块的签名面（含注释与行号） |
| `vuna gen-errors [ROOT]` | 生成错误码文档（默认 `docs/.generated/errors.md`） |
| `vuna help`, `vuna -h` | 用法 |

每个命令都必须显式书写，不再支持“无子命令 = compile”的旧式回退。没有可选的检查器
开关：所有编译命令都走 DT 精化 + 擦除 codegen，`vuna interp` 总是 DT 精化 +
核心求值。`vuna compile --package`、环境根参数、`--split` 与 `seed` 均已删除：包目录入口
直接作为入口文件交给 `compile` / `check`；`compile`/`build` 的产物统一是逐模块目录
（`--out` 指定 build 的输出目录），seed rotation 用 `build --no-compile --out` +
`nix/seed-rotate.sh`。详见 [bootstrap.md](bootstrap.md)。

## 相关阅读

- 模块系统与 import 解析：[language.md](language.md)
- `Prelude` 与标准库包：[stdlib.md](stdlib.md)
- 测试命令的环境变量与 nix 入口：[testing.md](testing.md)
