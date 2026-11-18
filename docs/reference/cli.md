# CLI：命令面、全局约定与退出码

本文是 `vuna` 命令面的参考页：命令树、flag 词汇、帮助与建议、退出码、机器输出，以及
产品面与 `vuna dev` 的边界。实现入口是 `packages/cli/lib/Vuna/Cli/`：

| 模块 | 职责 |
| --- | --- |
| `Vuna.Cli.Spec` | 命令表（路径、分组、摘要、用法、flag 表）——**单一真源** |
| `Vuna.Cli.Help` | 总览 / 分支 / 单命令帮助渲染，全部从命令表派生 |
| `Vuna.Cli.Args` | flag 解析（`ArgSpec` / `Parsed`）、参数错误文案与建议 |
| `Vuna.Cli.Err` | 工具命令错误出口（exit 2 用法错误 / exit 1 语义失败） |
| `Vuna.Cli.Suggest` | 未知命令 / flag 的「是不是想输入」建议 |
| `Vuna.Cli.{Test,Fmt,Index,Repl,Suite}` | 各命令族的参数校验与目录展开 |
| `Vuna.Cli.Dev` | `vuna dev` 子命令（suite / 观测 / 错误码文档生成） |
| `Vuna.Cli` | 顶层分发表 + `help` / `version` / 未知命令 |

命令实现只调用 `Vuna.Cli.Spec.parseCmdArgs`：flag 表来自命令表，未知 flag 的校验与
帮助文本不会各写一份。新增命令 = 命令表一条 + 顶层分发表一条；`packages/cli/test/steps/14_cli.steps`
逐条跑 `vuna help <path>` 与分组命令，漏接线会红。

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
vuna lsp

vuna version | -V | --version
vuna help [<command>...]
```

`vuna dev`（仓库专用，默认帮助只列一行入口）：

```text
vuna dev suite [FILE]               原生 suite（test/suite.toml）
vuna dev errors gen [ROOT]          错误码文档生成
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
| `--jobs auto\|N` | 并行度（`test` / `dev suite`） |
| `--filter` / `--select` / `--ignore` / `--only` / `--tier` / `--matrix` / `--backend` | 可重复筛选（按命令声明） |
| `--release` | 发布构建；只对构建类命令合法 |
| `--debug-perf` | 隐藏：由 runtime 读原始 argv，不进帮助、不参与分发 |

**没有第二条全局旗标通路**：每条命令在命令表里声明自己接受的 flag；不属于该命令的
flag 是 exit 2 的用法错误（附带最近候选建议）。`--debug-perf` 是唯一的例外——它在
分发前被摘掉，因为读写它的是 runtime 原语而不是 CLI 层。

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