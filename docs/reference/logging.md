# 文本日志（logging）

本页是 **vuna 全语言层**的文本日志规范：一条内置宏 `log!`、一组 env 开关、两种逐行输出格式。
它与结构化观测（[observability.md](observability.md)：span / counter / mark / sample，`VUNA_OBS`）
是**两条独立通道**——日志产出**行文本**，观测产出 **Chrome Trace Event JSONL**。

## 0. 一句话

`log! "debug" msg` 在 `VUNA_LOG` 阈值与 `VUNA_LOG_SCOPE` 过滤都放行时，向 stderr（或
`VUNA_LOG_FILE`）写一行 `<epoch-us> <LEVEL> <scope> <text>`；关闭或被过滤时 `msg` **不求值**。

## 1. 宏 `log! "level" msg`

`log!` 是**内置宏**（不是库函数；任何包可用，不需要 import），恰好两个实参：

- 第一个实参必须是**字符串字面量**，取值 `error|warn|info|debug|trace`，编译期校验；
- 第二个实参是消息表达式，只有在门控放行时才求值；
- 表达式返回 `Int 0`，调用点写 `_ = log! ...`。

```vuna
main : Int
main =
  let
    _ = log! "debug" "starting"
    _ = log! "warn" ("cache miss: " ++ key)
  in 0
```

`level` 不是字面量（例如变量或拼接结果）报 `[RN_LogLevelNotLiteral]`；字面量不是
`error|warn|info|debug|trace` 之一报 `[RN_LogLevelUnknown]`；实参个数不是 2 报
`[RN_MacroArity]`。三者都带调用点 span。

### 展开与 scope

`Loader.Expand` 在 fixity 重排之后、名字解析之前展开（`docs/reference/language.md`「内置宏」）：

```text
log! "level" msg
  ⇒ if @vuna@log@on <level 的整数> <scope> then @vuna@log@emit <level> <scope> msg else 0
```

`scope` 在**展开期烘入**，运行时不再拼模块名：

- 模块文件取**模块名**（如 `Vuna.Compiler.Driver.Dt`）；
- 入口文件取**文件名**（basename 去掉 `.vuna`，如 `app/Main.vuna` → `Main`；取不到时退回包名）。

门控在 `if` 的条件里，所以关闭或 scope 被过滤时 `msg` 的构造（字符串拼接、`show` 等）
完全不会发生。`log!` 展开后只引用隐藏原语 `@vuna@log@on` / `@vuna@log@emit`
（见 [primitives.md](primitives.md)）。

## 2. 级别与开关

级别是整数，`0..4`：

| 级别 | 名字 |
| --- | --- |
| 0 | `error` |
| 1 | `warn` |
| 2 | `info` |
| 3 | `debug` |
| 4 | `trace` |

| 开关 | 语义 |
| --- | --- |
| `VUNA_LOG` | 阈值：`off`（别名 `none`）/ `error` / `warn` / `info` / `debug` / `trace`，也接受整数（按原值当阈值）。缺省 `warn`；空串与未知值回落 `warn`。级别 ≤ 阈值即输出 |
| `VUNA_LOG_SCOPE` | 逗号分隔的 scope 过滤器；未设或空串 = 全开（见 §3） |
| `VUNA_LOG_FORMAT` | `text`（缺省）/ `jsonl`（见 §4） |
| `VUNA_LOG_FILE` | 输出文件；缺省 stderr。文件打不开时退回 stderr |

阈值只读一次（lazy CAF），所以进程内改环境变量对已启动的进程无效。

## 3. `VUNA_LOG_SCOPE` 过滤

逗号分隔，逐项 `trim`，空项忽略。每个模式按形态选择匹配方式：

| 模式形态 | 匹配 |
| --- | --- |
| 不含 `*` / `?` 且不含 `.` | **原始前缀**：`Vuna` 命中 `Vuna.Compiler`，也命中 `VunaX` |
| 含 `.` 且不含通配符 | **点边界前缀**：`Lib.A` 命中 `Lib.A` 与 `Lib.A.B`，不命中 `Lib.AB` |
| 含 `*` / `?` | glob：`*` 匹配任意长度（含空），`?` 匹配单个字符 |
| `!pat` | 否定：`pat` 按上面三条匹配后**排除** |

组合规则：先算「包含」——没有非否定模式时从全开起算，否则任一非否定模式命中即包含；
再减去任一否定模式的命中。例：

```console
VUNA_LOG_SCOPE='Vuna.Compiler,!Vuna.Compiler.Elab'   # compiler 全部，但排除 Elab 子树
VUNA_LOG_SCOPE='!Vuna.Compiler'                     # 全开，只排除 compiler
VUNA_LOG_SCOPE='Vuna.*.Dt,Main'                     # glob + 点边界前缀
```

匹配结果是按 scope 字符串记忆的（模块名是有限常量），同一 scope 只算一次。

## 4. 输出格式

两种格式都是**一行一条、逐行 flush**，时间戳是 epoch 微秒（整数）：

- `VUNA_LOG_FORMAT=text`（缺省）：

  ```text
  <epoch-us> <LEVEL> <scope> <text>
  ```

  `LEVEL` 是上表名字的**大写**形式（`ERROR` / `WARN` / `INFO` / `DEBUG` / `TRACE`），
  scope 原样，text 原样（可含空格；换行会原样落进输出）。

- `VUNA_LOG_FORMAT=jsonl`：

  ```json
  {"ts":1794470874925810,"pid":123,"level":"debug","scope":"Main","text":"starting"}
  ```

  键序固定为 `ts` / `pid` / `level` / `scope` / `text`；`level` 是小写名字；字符串按 JSON
  转义（`"`、`\`、换行、回车、制表，其余 C0 控制字符写成 `\u00xx`），非 ASCII 原样输出。

`VUNA_LOG_FILE` 在第一次真正要写时打开（lazy），进程退出时关闭。

## 5. 关闭路径的成本

关闭（或 scope 被过滤）时，每个 `log!` 只付：

1. 一次 `Lazy.force`（阈值）+ 一次整数比较；
2. `VUNA_LOG_SCOPE` 为空时不查 scope 表（直接放行）；
3. `msg` **不求值**（宏的 `if` 门控）。

打开时每行成本 = 一次时钟读 + 一次格式化 + 一次写并 flush；日志是同步 I/O，
**热路径默认不要打开**（用它做定位，不用它做常驻输出）。

## 6. 库层 `Base.Data.Log`

需要先拿到字符串、或要自行判断实参开销时用库层（纯函数、无 `Eff`）：

```text
logOn   : Int -> String -> Bool             -- 级别 + scope 是否放行
logAt   : Int -> String -> String -> Int    -- (level, scope, text)
logError : String -> String -> Int          -- (scope, text)，级别 0
logWarn  : String -> String -> Int          -- 级别 1
logInfo  : String -> String -> Int          -- 级别 2
logDebug : String -> String -> Int          -- 级别 3
logTrace : String -> String -> Int          -- 级别 4
```

函数形态**没有** `msg` 不求值的性质：实参在调用点已经求值。热路径用宏
（`log! "debug" msg`），或者先 `logOn level scope` 再决定是否构造消息。

## 7. 与 structured observability 的分工

| 通道 | 开关 | 形态 | 消费方 |
| --- | --- | --- | --- |
| 文本日志（本页） | `VUNA_LOG*` | 行文本 / JSONL（`ts`/`pid`/`level`/`scope`/`text`） | 人、`grep`、日志收集器 |
| 结构化观测（[observability.md](observability.md)） | `VUNA_OBS=0..3` | Chrome Trace Event JSONL（span / counter / mark / sample） | `vuna dev obs summarize/convert/render/serve`、Chrome / Perfetto |

- `vuna dev obs` **不解析**日志文件：没有 span、没有 `args`、没有事件名；要把日志与时间轴
  对齐，用日志行的 epoch 微秒自己比对。
- `mark!` 仍是结构化事件（`@vuna@obs@mark`，`ph:"i"`，`VUNA_OBS >= 1` 才写 trace），
  它不是文本日志；实参在关闭时仍会求值，需要时用 `Obs.obsOn 0` 自行判（模块 `Obs` 在
  生态包 `vuna-obs`）。
- `error` / `warn` 只是文本，**不改变退出码**，也不参与诊断通道；编译器的错误/告警仍是
  `Diagnostic`（`vuna check` 的退出码与渲染由它决定）。

## 8. 后端

| 后端 | `log@on` | `log@emit` |
| --- | --- | --- |
| OCaml | 按 `VUNA_LOG*` 计算 | 写一行（text / jsonl） |
| wasm | 恒 `False` | 恒 `0` |
| native | 恒 `False` | 恒 `0` |

即文本日志**只在 OCaml 后端输出**；wasm / native 上门控恒为假，`log!` 不产生任何输出
（见 [wasm.md](wasm.md) / [native-runtime.md](native-runtime.md) 的运行时符号表）。
核心求值（`vuna test` 的纯测试、REPL）把 `log@on` 归约成 `False`、`log@emit` 归约成 `0`，
所以纯测试里没有日志输出。