# 调试与运行时错误报告

本文覆盖**开发/调试回路**的三层支持：编译期诊断的源码片段、运行期未捕获异常的报告、
语言级调试构造（`dbg` / `dbgShow` / `assert` / `todo`，见 §3），以及配套命令（`vuna run` / `vuna test --verbose` /
REPL `:type`）。语言语义见 [language.md](language.md)，诊断错误码与 CLI 退出码见
[tooling.md](tooling.md)，lint 规则边界见 [lint.md](lint.md)。

## 1. 编译期诊断：源码片段

`vuna check` / `compile` / `build` / `interp` 的错误在原有
`<file>:<line>:<col>: [CODE] <消息>` 之后追加源码片段（`Vuna.Compiler.Driver.DiagRender`）：

```console
$ vuna check .
error: [demo] ./app/Main.vuna:2:8: [TC_TypeMismatch] type mismatch: expected Int, got String
  --> ./app/Main.vuna:2:8
   |
2 | main = "boom"
  |        ^^^^^^
```

约定：

- 首行保持原样（位置 + 错误码 + 消息仍是稳定输出契约，`.err` 夹具按子串断言）；
  片段只是追加。
- 插入符按 span 起点 token 扫描（标识符/数字/字符串字面量/单符号），clamp 到行尾；
  tab 显示成单空格。
- **无法定位 / 文件不可读 / 行越界 / 消息含换行 → 原文返回**（行为零变化）。例如
  `error: no such file: ...` 仍是单行。
- 实现位于 compiler 包的 CLI 边界（`Driver/CompilerCli` 统一出口），Elab 等纯阶段
  不读盘；LSP 诊断仍走结构化位置，不复用本渲染。

## 2. 运行期：未捕获异常报告

生成的 main 钩子把入口动作包在 `try` 里；未捕获异常交给运行时报告器
（`Vuna_runtime.dt_report_exn`），输出到 **stderr**，退出码 **2**：

```console
$ ./.output/bin/demo
vuna: runtime error: division by zero
  at main (app/Main.vuna:2)
```

- 消息：`Failure m` 解包成 `m`（所以 `prim_fail` / `assert` / `todo` 的文案直接可见），
  其它异常用 `Printexc.to_string`。
- 帧：`Printexc.Slot.name` → 生成代码里的 mangled 值名（如 `v_main`）→ 查
  `Vuna_runtime.dt_def_locs` 表（编译器生成，条目 = `vuna 定义名 + 相对路径:行`）；
  最多打印 12 条命中帧，未命中帧（如 `Stdlib.failwith`）跳过。
- 位置是**定义级**（span 起点行），不是表达式级；路径归一成模块根/包目录下的相对路径
  （`Base/Show.vuna:42`、`app/Main.vuna:2`），保证同一输入的产物与 seed rotation 可复现。
- 纯 `main`（零参值绑定）在**模块初始化期**求值，早于 main 钩子：`Main.ml` 第一行
  开启回栈、并给入口 main 的绑定套同一个报告器；`main : Eff [] a` 的 thunk 在钩子的
  `try` 内执行。
- 回栈记录由生成代码 `Printexc.record_backtrace true` 打开；`build.sh` 本就带 `-g`
  （见 [compiler.md](compiler.md) 的输出模型）。

**边界**（登记在 [debt.md](debt.md) D33）：`ocamlopt` 会内联小函数，被内联的抛错点
会归到调用者帧；非入口单元顶层初始化的异常不在覆盖范围；没有表达式级 span / 局部
变量值 / 断点（无 DAP，真调试器不在本阶段）。

## 3. 语言级调试构造：`dbg` / `dbgShow` / `assert` / `todo`

这些名字是**编译器内建的调试构造**（不是库函数；不需要 import，不需要能力位，
也不进 `[trust]`）：

| 名字 | 签名 | 行为 |
| --- | --- | --- |
| `dbg` | `String -> a -> a` | 求值期把 `msg` + 换行写 stderr 后返回第二个实参（debug / release 都可用） |
| `dbgShow` | `DebugShow a => a -> a` | 用 `debugShow`（默认由 `show` 派生）打印后返回原值 |
| `assert` | `Bool -> String -> a -> a` | `True` 返回第三个实参；`False` 以 `assertion failed: <msg>` abort（debug-only） |
| `todo` | `String -> a` | 以 `TODO: <msg>` abort（debug-only 占位） |

`DebugShow` 在 `Base.Show` 里声明，并有一个 blanket instance `Show a => DebugShow a`，
所以**所有 `Show` 实例自动获得 `dbgShow`**；需要不同调试格式的类型可另写实例。

```console
$ cat app/Main.vuna
main : Int
main = dbg "starting" (dbgShow 42)
$ ./.output/bin/demo
42                     # stdout：main 钩子打印的返回值
starting               # stderr：dbg
42                     # stderr：dbgShow
```

**release 构建**（`--release` 或 `VUNA_RELEASE=1`）拒绝 `assert` / `todo`：

```console
$ vuna check --release app/Main.vuna
error: app/Main.vuna:4:8: [TC_DebugConstructInRelease] `assert` is only available in
debug builds; remove it before a release build (--release)
```

`dbg` / `dbgShow` 是显式的调试输出，release 构建仍可用（调试输出不是程序语义的一部分）。
`assert` / `todo` 失败经内建的 `failwith` 抛 `Failure`，走第 2 节报告路径；内建本身没有
源码位置，帧只显示调用点：

```console
$ ./.output/bin/demo
vuna: runtime error: assertion failed: broken invariant
  at main (app/Main.vuna:4)
```

## 4. 相关原语

`Vuna.Compiler.Intrinsics` 的调试/诊断内建（真源在 Intrinsics，语义见
[primitives.md](primitives.md) §7）：

- `dbg` / `assert` / `todo`：§3 的语言级调试构造（无能力位；`assert` / `todo` 由
  `Loader.Resolve` 在 release 构建拒绝）；
- `prim_eprint : String -> Eff [] Int`（能力 `console`）：写 stderr 并 flush；
- `prim_fail : String -> a`（无能力）：抛 `Failure <msg>`，可被报告器渲染。

普通程序用 §3 的构造即可；需要直接调用原语时按 `[capabilities].effects` 声明能力。

## 5. 调试回路里的命令

| 命令 | 用途 |
| --- | --- |
| `vuna run [DIR] [-- ARGS...]` | 增量 build + 执行 `.output/bin/<包名>`，透传参数与退出码（`--no-build` 跳过构建，`--package NAME` 选 workspace 成员） |
| `vuna test --filter PAT --verbose` | 只跑匹配的测试文件；`--verbose` 给每个文件的毫秒耗时与总耗时；`--fail-fast` 首个失败即停 |
| `vuna repl` 的 `:type EXPR` | 只看表达式或类型名的类型（类型构造子给 kind；按 token 着色；不求值、不执行效果） |
| `vuna repl` 的 `:typeinfo EXPR`（`:ti`） | 显式类型 + 单独列出的隐式参数；工作区内附 docstring |
| `vuna repl` 的 `:info NAME` / `:search QUERY` | 查符号类型/文档/位置；按名称或类型检索 |
| `vuna repl` 的 `:load FILE\|DIR\|MODULE` / `:reload` | 加载入口式源码 / 切换包上下文 / 导入模块；`:browse [MODULE]` 看模块接口 |
| `vuna repl` 的 `:defs` / `:history` / `:set +s` | 看已定义名字与类型 / 输入历史与重放 / 每条输入的耗时 |
| `vuna repl --listen ADDR` + `--client ADDR` | 常驻 REPL server（Unix socket / loopback TCP）+ 每次调用一发一收；agent/脚本跨进程驱动，JSON-RPC 帧协议（见 [tooling.md](tooling.md) §5） |
| LSP `textDocument/codeAction` | lint finding 的 quick fix（含 fix all） |

REPL 与 LSP 的命令面见 [tooling.md](tooling.md)，测试选项见 [testing.md](testing.md)。