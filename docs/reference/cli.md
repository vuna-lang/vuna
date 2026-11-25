# CLI：命令面、全局约定与退出码

本文是 `vuna` 命令面的参考页：命令树、flag 词汇、帮助与建议、退出码、机器输出、
插件发现，以及产品面与 `vuna dev` 的边界。命令面按「入口 / 协议 / 工具链」三层分布：

| 模块 | 所属 | 职责 |
| --- | --- | --- |
| `Vuna.Plugin.Command` | `plugin-kit` | 命令面数据模型（`Cmd` / `Group` / `FlagDoc` / `ArgSpec`）与表查询 |
| `Vuna.Plugin.Args` / `Parse` / `Suggest` | `plugin-kit` | 纯参数解析与近邻建议（不认识「已删 flag」，提示由调用方注入） |
| `Vuna.Plugin.Err` / `Help` | `plugin-kit` | 错误出口与帮助渲染（表由调用方传入） |
| `Vuna.Plugin.Describe` | `plugin-kit` | describe 协议 v1 的渲染与解析 |
| `Vuna.Cli` / `Vuna.Cli.Discover` | `cli`（入口） | 命令发现、帮助总览、路由；只带 `help` / `version` |
| `Vuna.Cli.Spec` | `toolchain` | 产品命令表（路径、分组、摘要、用法、flag 表）——**单一真源** |
| `Vuna.Cli.Registry` | `toolchain` | 路径 → 实现接线表；插件入口（describe / help / dispatch） |
| `Vuna.Cli.Help` | `toolchain` | 工具链侧帮助（`Spec` + 编译器命令转发） |
| `Vuna.Cli.Args` | `toolchain` | 门面：解析失败转 `Check` 文案、工具侧已删 flag 提示、读盘守卫 |
| `Vuna.Cli.Err` / `Suggest` | `toolchain` | 工具命令错误出口与建议 |
| `Vuna.Cli.{Test,Fmt,Index,Repl,Suite,Dev}` | `toolchain` | 各命令族的参数校验与目录展开 |
| `Vuna.Fmt` / `Vuna.Lint` / `Vuna.Doc` / … | `toolchain` | 工具实现 |

命令实现只调用 `Vuna.Cli.Spec.parseCmdArgs`：flag 表来自命令表，未知 flag 的校验与
帮助文本不会各写一份。新增命令 = 命令表一条 + Registry 一条；`packages/cli/test/steps/14_cli.steps`
逐条跑 `vuna help <path>` 与分组命令，漏接线会红。

## 0. 插件发现

`vuna` 二进制只做发现与路由，工具实现都在 `vuna-toolchain` 进程里：

| 契约 | 说明 |
| --- | --- |
| 搜索目录 | `<exeDir>` → `$VUNA_EXEC_PATH`（冒号分隔）。**不扫 `PATH`**：那里可能有别的 `vuna-*` 工具（`vuna-seed` / `vuna-compiler`），不是插件 |
| 候选 | 文件名 `vuna-<domain>`（无点、非 `vuna` 自身） |
| `vuna-<domain> --vuna-describe` | 打印命令表（stdout） |
| `vuna-<domain> --vuna-describe FILE` | 把命令表写到 FILE（入口用这个形态收集，子进程 stdout/stderr 被丢弃） |
| 路由 | `vuna <path> ...` 原样把 argv 交给拥有该路径的插件；stdio 继承、退出码透传 |
| `vuna-<domain> --vuna-describe` 的 `req\t<domain>` 行 | 声明的依赖域；未满足（没有提供该域的插件）时整个插件被丢弃 |
| 缺失 | 插件不在 → 它的命令从帮助里消失，调用报 exit 2；入口其余功能不受影响 |

插件集合（默认安装）：

| 插件 | 域 | 提供 |
| --- | --- | --- |
| `vuna-toolchain` | `toolchain` | run / test / fmt / lint / doc / search / map / api / goal / errors / deps / store / repl / lsp |
| `vuna-compiler` | `compiler` | check / build / compile；裸 flag（`vuna --typed`）也转给它（已删 flag 提示的真源） |
| `vuna-dev` | `dev` | 仓库专用的 `vuna dev …`（suite / obs / errors gen / ir dump）；独立包 `packages/dev`，默认随产品安装 |
| `vuna-target-native` | `target-native` | `--target native` 的后端：读 IR 编码、写 x86-64 汇编文件集 |
| `vuna-target-wasm` | `target-wasm` | `--target wasm` 的后端：读 IR 编码、写 `main.wat` + 能力告警 |
| `vuna-web` | `web` | `vuna web build / check / version`（服务端目标 ocaml/native，不依赖后端插件） |

`vuna-compiler` 与自举 stage-1 是**同一个产物**：包的入口就是产品插件入口，nix 把它装成两个名字。

describe v1 是行式 TAB 分隔文本（见 `Vuna.Plugin.Describe`）：首行 `vuna-plugin 1 cli <domain>`，
其余行是 `cmd` / `flag` / `note`。`summary` 与 `synopsis` 放在最后，正文里的空格与 `|` 无需转义。

`nix` 侧把入口与工具链装进同一个 `$out/bin`，因此 `nix profile install` / `systemPackages`
合并 bin 目录后 `vuna <cmd>` 直接可用；`VUNA_EXEC_PATH` 用于 Bin 目录不共享的安装方式。

## 1. 命令树

```text
vuna check|build|compile ...        编译器命令（flag 由编译器包解析）
vuna run [DIR] [-- ARG]...          构建并运行包入口
vuna test [DIR]                     包内 test/*.vuna
vuna fmt [--check] [PATH]...
vuna lint [--fix] [--format FORMAT] [PATH]...

vuna doc [--check] [--package NAME] [DIR [OUT]]
vuna search [--name|--type|--doc] <query>...
vuna map                            模块总览
vuna map find <Module.name>         符号定义 + 引用者 + 建议测试
vuna map impact <Module.name>       受影响模块 + 测试标签
vuna api <Module.name>
vuna goal <file.vuna>
vuna errors list [PREFIX]
vuna errors explain <CODE>

vuna deps add <name>[@<version>] [DIR]
vuna deps fetch [--locked] [DIR]
vuna deps pin [DIR]
vuna store gc [--dry-run] [--older-than SEC] [--max-size BYTES]
vuna store clean [--dry-run] [--store|--packages|--gc|--all]

vuna repl [FILE|DIR|MODULE]
vuna repl serve --listen ADDR [FILE|DIR|MODULE]
vuna repl client --addr ADDR
vuna lsp [--stdio]

vuna version | -V | --version
vuna help [<command>...]
```

`vuna dev`（仓库专用，默认帮助只列一行入口）：

```text
vuna dev suite [FILE]               原生 suite（test/suite.toml）
vuna dev errors gen [ROOT]          错误码文档生成
vuna dev macro FILE [--json]        内置宏调用表 / 展开合成 id
vuna dev obs run|summarize|validate|convert|render|merge|symbols|serve
```

**为什么这样分组**：顶层只放「用户在自己项目上会跑的命令」。conformance suite 的
family / tier / matrix 词汇、`VUNA_OBS` 自采样、错误码枚举文档生成都只对 vuna 仓库成立，
放进 `dev` 后产品帮助只有十几行。边界由 `nix/checks/lib/product-boundary.sh` 守卫：
产品侧模块不得 import `Vuna.Cli.Dev`，顶层分发表是唯一同时接两侧的地方。

## 2. flag 词汇

| 词汇 | 含义 |
| --- | --- |
| `--check` | 只报告不改盘（`fmt` / `doc`） |
| `--fix` + `--dry-run` | 应用 / 预览自动修复（`lint`） |
| `--json` | 单行 JSON 输出（`lint --format json`、`search`、`errors`、`dev suite`、`dev obs summarize`） |
| `--format text\|json\|github\|sarif` | 诊断渲染格式（`lint`） |
| `--jobs auto\|N` | 并行度（`test` / `dev suite`；`dev suite` 未给出时用 `[suite].jobs`，`auto` 强制探测） |
| `--timeout SECS` | 单个 case 预算的上限（`dev suite`；更紧的 family `timeout` 仍生效） |
| `--filter` / `--select` / `--ignore` / `--only` / `--tier` / `--matrix` / `--backend` | 可重复筛选（按命令声明） |
| `--release` | 发布构建；只对构建类命令合法 |
| `--wasm-opt 0..3` | wasm 产物的 binaryen 优化级别（只对 `build` 合法；默认 3，`0` = 只汇编不优化） |

**没有第二条全局旗标通路**：每条命令在命令表里声明自己接受的 flag；不属于该命令的
flag 是 exit 2 的用法错误（附带最近候选建议）。运行时的观测开关（`--obs` /
`--obs-level`）不走命令表，由 runtime 读原始 argv；文本日志没有 argv 开关，只认
`VUNA_LOG` 系列 env（见 [logging.md](logging.md)）。

## 3. 帮助与建议

- `vuna help`：按分组列出顶层命令（核心循环 / 文档与导航 / 依赖与缓存 / 交互与服务 /
  帮助与版本 / 开发与维护）。
- `vuna help <command>...` 与 `vuna <command> --help`：同一条命令的完整用法
  （`usage:` / `commands:` / `options:` / `notes:`）。
- `--` 之后的 `--help` 不触发帮助（`vuna run pkg -- --help` 透传给子进程）。
- 未知命令 / flag 给最近候选：`did you mean \`check\`?`、`did you mean \`--fix\`?`。
- 已改名的旧入口给迁移提示而不是静默失败：`explain` / `gen-errors` / `fetch` / `add` /
  `pin` / `clean` / `seed`，以及旧的模式 flag（`test --suite`、`map --find`、
  `map --impact`、`map --modules`、`repl --listen`、`repl --client`）。
- 编译器命令（`check` / `build` / `compile`）的详细 flag 帮助转发编译器用法文本
  （`Vuna.Compiler.Driver.CompilerCli.compilerUsageLines`），不在 CLI 层重复一份。

## 4. 退出码

| 退出码 | 含义 | 典型来源 |
| --- | --- | --- |
| 0 | 成功 | 命令完成；`--check` 无差异；lint 无 finding；测试全过 |
| 1 | 源码 / 诊断错误或查询未命中 | `check` / `build` / `compile` 失败；`fmt --check` 有需重排文件；`doc --check` 缺 docstring；`test` 有失败；`search` 无命中；`map find` 无命中或多候选（多候选为 2） |
| 2 | 用法 / 工具错误 | 未知命令或 flag、缺值、参数个数不对；输入路径不存在、不是 workspace、配置非法、未知子命令；`map find` 多候选 |
| 70 | 内部编译器错误（ICE） | 不变量破坏 / fuel 耗尽，见 [diagnostics.md](diagnostics.md) |

`vuna run` 透传子进程退出码。`dev obs summarize --baseline` 超过 `--threshold` 退 1。

## 5. 输出约定

- stdout = 结果数据；stderr = 诊断与进度。诊断文本统一 `文件:行:列: [CODE] 消息`
  （Codegen 无位置时省略 `行:列:`），由 `Base.Diagnostics.Format` 渲染。
- `--json` 是逐命令的稳定形状（`search` 的结果数组、`errors` 的条目对象、lint 的
  findings、`dev suite` 的汇总、`dev obs summarize` 的 summary）。不是「所有命令都有
  JSON」——`check` / `build` / `run` 的机器接口是退出码与结构化诊断通道（见
  [diagnostics.md](diagnostics.md)）。
- 无颜色输出（当前不写 ANSI），因此没有 `--color` / `--no-color`。

## 6. 相关页面

- 包与依赖语义：[packages.md](packages.md)、[package-store.md](package-store.md)
- lint / fmt / doc：[lint.md](lint.md)、[api-docs.md](api-docs.md)、[tooling.md](tooling.md)
- 测试与 suite：[testing.md](testing.md)
- 观测：[observability.md](observability.md)
### 后端插件协议（`vuna-target-*`）

编译器把 DT 检查 + Lowering 后的 IR 编码成字节（`Vuna.Ir.Codec.encodeProgram`），再以
子进程调用后端：

```console
vuna-target-<t> --ir FILE --out DIR [--print] [--diag FILE] [--files FILE]
```

- `--ir`：`Vuna.Ir.Codec` 的载荷；`--out`：输出目录；
- `--diag`：诊断回传（`Vuna.Compiler.Base.Diag.Codec` 编码；错误与非阻塞告警都走它）；
- `--files`：产物清单（每行一个相对路径，编译器据此生成 native 链接脚本）；
- 退出码：`0` 成功（诊断可为 warning）、`2` 后端拒绝（诊断已写回）、`3` 载荷无效。

发现规则与命令插件相同（`<exeDir>` → `$VUNA_EXEC_PATH`）：缺插件时 `--target <t>`
报 `target backend plugin ... is not installed`，不静默回落到 OCaml。

产物有内容寻址缓存（`objects/target-out/<irHash+target+后端身份+print>`）：命中时编译器
直接物化上次的文件表与诊断，**不启动插件**；IR 本身不落盘（中间表示不建域），只把它的内容哈希编进键。
详见 [cache.md](cache.md)「后端产物缓存」。

插件调用有超时：默认 300s（`VUNA_PLUGIN_TIMEOUT` 覆盖，允许小数、`0` = 关闭；负数 / 非数字
回落默认），驱动用 `timeout -s KILL` 包住插件进程；到点插件被杀、命令以「timed out after Ns」
失败，不会静默挂住。`timeout` 不在 PATH 时退回无超时调用（与 `vuna test` 同一降级口径）。
