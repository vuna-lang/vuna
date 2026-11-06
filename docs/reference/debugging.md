# 调试与运行时错误报告（M38）

本文覆盖**开发/调试回路**的三层支持：编译期诊断的源码片段、运行期未捕获异常的报告、
纯代码里的 `Base.Debug` 工具，以及配套命令（`vuna run` / `vuna test --verbose` /
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

- 消息：`Failure m` 解包成 `m`（所以 `prim_fail` / `Base.Debug.assert` 的文案直接可见），
  其它异常用 `Printexc.to_string`。
- 帧：`Printexc.Slot.name` → 生成代码里的 mangled 值名（如 `v_main`）→ 查
  `Vuna_runtime.dt_def_locs` 表（编译器生成，条目 = `vuna 定义名 + 相对路径:行`）；
  最多打印 12 条命中帧，未命中帧（如 `Stdlib.failwith`）跳过。
- 位置是**定义级**（span 起点行），不是表达式级；路径归一成模块根/包目录下的相对路径
  （`Base/Debug.vuna:30`、`app/Main.vuna:2`），保证同一输入的产物与 seed rotation 可复现。
- 纯 `main`（零参值绑定）在**模块初始化期**求值，早于 main 钩子：`Main.ml` 第一行
  开启回栈、并给入口 main 的绑定套同一个报告器；`main : IO a` 的 thunk 在钩子的
  `try` 内执行。
- 回栈记录由生成代码 `Printexc.record_backtrace true` 打开；`build.sh` 本就带 `-g`
  （见 [compiler.md](compiler.md) 的输出模型）。

**边界**（登记在 [debt.md](debt.md) D33）：`ocamlopt` 会内联小函数，被内联的抛错点
会归到调用者帧；非入口单元顶层初始化的异常不在覆盖范围；没有表达式级 span / 局部
变量值 / 断点（无 DAP，真调试器不在本阶段）。

## 3. `Base.Debug`：纯代码里的 trace / assert

显式 `import Base.Debug` 才可见（不进 `Prelude`，也不进 `Base` 门面）：

| 名字 | 签名 | 行为 |
| --- | --- | --- |
| `trace` | `String -> a -> a` | 把 `msg` + 换行写 stderr 后返回原值 |
| `traceShow` | `Show a => a -> a` | `show` 后写 stderr，返回原值 |
| `assert` | `Bool -> String -> a -> a` | 失败时 `prim_fail "assertion failed: <msg>"` |
| `todo` | `String -> a` | `prim_fail "TODO: <msg>"` |

```console
$ cat app/Main.vuna
import Base.Debug

main : Int
main = trace "starting" (traceShow 42)
$ ./.output/bin/demo
42                     # stdout：main 钩子打印的返回值
starting               # stderr：trace
42                     # stderr：traceShow
```

`trace` / `traceShow` 用 base 的 `runIO`（既有内部信任点）执行 `prim_eprint`，是**调试
专用**的纯度逃逸：不要在生产逻辑里依赖它（登记在 debt.md D34）。`assert` / `todo`
失败经 `prim_fail` 抛 `Failure`，走第 2 节的报告路径：

```console
$ ./.output/bin/demo
vuna: runtime error: assertion failed: broken invariant
  at Base.Debug.assert (Base/Debug.vuna:30)
  at main (app/Main.vuna:4)
```

## 4. 相关原语

`Vuna.Compiler.Intrinsics` 新增两条（真源仍在 Intrinsics，语义见
[primitives.md](primitives.md) §7）：

- `prim_eprint : String -> IO Int`（能力 `console`）：写 stderr 并 flush；
- `prim_fail : String -> a`（无能力）：抛 `Failure <msg>`，可被报告器渲染。

普通程序请经 `Base.Debug` 使用；需要直接调用原语时按 `[capabilities].effects` 声明能力。

## 5. 调试回路里的命令

| 命令 | 用途 |
| --- | --- |
| `vuna run [DIR] [-- ARGS...]` | 增量 build + 执行 `.output/bin/<包名>`，透传参数与退出码（`--no-build` 跳过构建，`--package NAME` 选 workspace 成员） |
| `vuna test --filter PAT --verbose` | 只跑匹配的测试文件；`--verbose` 给每个文件的毫秒耗时与总耗时；`--fail-fast` 首个失败即停 |
| `vuna repl` 的 `:type EXPR` | 只看表达式类型（不求值、不执行效果） |
| `vuna repl` 的 `:info NAME` / `:search QUERY` | 查符号类型/文档/位置；按名称或类型检索 |
| `vuna repl` 的 `:load FILE\|DIR\|MODULE` / `:reload` | 加载入口式源码 / 切换包上下文 / 导入模块；`:browse [MODULE]` 看模块接口 |
| `vuna repl` 的 `:defs` / `:history` / `:set +s` | 看已定义名字与类型 / 输入历史与重放 / 每条输入的耗时 |
| LSP `textDocument/codeAction` | lint finding 的 quick fix（含 fix all） |

REPL 与 LSP 的命令面见 [tooling.md](tooling.md)，测试选项见 [testing.md](testing.md)。