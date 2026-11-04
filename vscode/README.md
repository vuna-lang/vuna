# Vuna VS Code 扩展

Vuna 语言的 VS Code 支持：TextMate 语法高亮、语言配置、代码片段，以及基于
`vuna lsp`（JSON-RPC over stdio）的 LSP 集成和 `vuna` CLI 命令。

## 功能

| 能力 | 说明 |
| --- | --- |
| 语法高亮 | `source.vuna`：注释（`--` / 可嵌套 `{- -}`）、字符串与转义、整数、关键字、类型/构造子、`prim_*` 内建、运算符、模块/import 名、定义名 |
| LSP | 诊断、hover（DT 洞目标）、formatting、documentSymbol、definition、references、completion 全部由 `vuna lsp` 服务器提供；扩展只转发服务器在 `initialize` 中声明的能力，不硬编码 capability |
| 状态栏 | 显示语言服务器状态（启动中 / 运行中 + 版本 / 出错），点击运行 `Vuna: Show Version` |
| 命令 | restartServer、formatDocument、lintFile、checkFile、buildPackage、showVersion |
| 保存时 lint | 保存 `.vuna` 文件时运行 `vuna lint <file>`，结果作为诊断进 Problems 面板（`vuna.diagnostics.onSave`） |
| 片段 | data / record / trait / instance / 函数 / case / do / where / let / module / import / axiom |

## 运行要求

- VS Code `^1.90.0`；
- 一个可执行的 `vuna`（`vuna lsp` 与 `vuna lint/check/fmt/build` 都由它提供）。

扩展按以下顺序解析 `vuna`：

1. 设置 `vuna.server.path`（显式指定，最高优先级）；
2. `PATH` 里的 `vuna`；
3. `<workspace>/result/bin/vuna`（本仓库 `nix build .#vuna --out-link result` 的产物）；
4. `<workspace>/../result/bin/vuna`。

每个候选在启动前都会用 `vuna --version`（不支持时退回 `vuna version`）探测；两者都不支持
的旧构建仍会启动（LSP 本身可用），版本显示为 unknown。

## 设置

| 设置 | 默认值 | 说明 |
| --- | --- | --- |
| `vuna.server.path` | `""` | `vuna` 可执行文件路径；空 = 按上面的顺序自动探测 |
| `vuna.basePath` | `""` | 传给子进程的 `VUNA_BASE`；空 = workspace 下有 `base/` 时用它，否则交给服务器自己探测 |
| `vuna.trace.server` | `"off"` | LSP 通信跟踪（`off` / `messages` / `verbose`），输出到 **Vuna Language Server Trace** 通道 |
| `vuna.diagnostics.onSave` | `true` | 保存时运行 `vuna lint` 并发布诊断（与服务器的 parse/type 诊断相互独立；lint 太慢可关掉） |

## 命令

| 命令 | 行为 |
| --- | --- |
| `Vuna: Restart Language Server` | 重启 `vuna lsp` |
| `Vuna: Format Document` | 优先用服务器的 `textDocument/formatting`；服务器未声明该能力或返回空编辑时，回退到已保存文件的 `vuna fmt <file>`，以可撤销的 WorkspaceEdit 应用 |
| `Vuna: Lint File` | 运行 `vuna lint <file>`，输出到 **Vuna** 通道，并把 `[LN_*]` 诊断发布到 Problems |
| `Vuna: Check File` | 运行 `vuna check <file>`（注意：`check` 的入口语义是「入口文件或包目录」，模块文件带 `module` 头会报 `LD_ModuleHeaderInEntryFile`） |
| `Vuna: Build Package` | 在终端运行 `vuna build <pkg>`，`<pkg>` 是从当前文件向上找到的最近 `vuna.toml` 所在目录 |
| `Vuna: Show Version` | 显示服务器路径、版本、`VUNA_BASE` 与 trace 设置，并写入 **Vuna** 通道 |

所有命令都在命令面板可用；`.vuna` 编辑器右键菜单包含 format/lint/check/build。

## 开发与构建

依赖安装（默认 npm cache 是只读的，显式指定可写 cache）：

```console
cd vscode
npm_config_cache=/tmp/npm-cache npm install
npm run typecheck      # tsc --noEmit
npm run build          # esbuild -> dist/extension.js（CJS、external: vscode）
npm run package        # vsce package --no-dependencies -> vuna-0.1.0.vsix（可选）
```

`dist/extension.js` **构建后提交入库**：离线环境下无需 `npm install` 即可加载扩展。
需要调试源码时用 `node scripts/build.mjs --sourcemap` 重新构建（inline sourcemap，
可打断点；不入库）。

## F5 手动调试

1. 在 VS Code 中打开 `vscode/` 目录（扩展项目根）；
2. 生成本地 launch 配置（仓库根 `.gitignore` 忽略 `.vscode/`，所以模板放在 `dev/`）：

   ```console
   mkdir -p .vscode && cp dev/launch.json .vscode/launch.json
   ```

3. 按 `F5`（Run Extension）：扩展开发宿主窗口打开仓库根目录（`${workspaceFolder}/..`），
   这样自动探测能命中 `<repo>/result/bin/vuna`；
4. 打开的宿主窗口里打开任意 `.vuna` 文件（例如 `lib/Vuna/Lsp.vuna`）验证高亮/诊断；
5. 输出面板选 **Vuna** 看服务器日志，选 **Vuna Language Server Trace** 看 LSP 帧
   （需把 `vuna.trace.server` 设为 `messages`）。

不依赖 launch 配置的等价方式：

```console
code --extensionDevelopmentPath="$PWD/vscode" "$PWD/.."
```

## 自检脚本

`check.sh` 是 POSIX sh，可接进 Nix check：校验 package.json 可解析与 `main` 存在、
`activationEvents`、`node --check dist/extension.js`、grammar `scopeName == source.vuna`、
language-configuration / snippets 可解析、dist 含 `vuna lsp` 等：

```console
sh vscode/check.sh
```

退出码非 0 表示失败（需要 PATH 里有 `node`）。脚本会自己定位扩展根目录（脚本所在目录 /
当前目录 / `<cwd>/vscode`，也可用 `VUNA_VSCODE_ROOT` 显式指定），所以从树内运行和从
Nix store 拷出的脚本 + `vscode/` 工作树运行都适用；接 Nix 时把 `vscode/` 放进源集合并
在 `nativeBuildInputs` 里提供 `nodejs` 即可。

## 已知边界（与服务器实现同步）

- 当前 `vuna lsp`（M26/M30 阶段）只声明 `textDocumentSync` 与 `hoverProvider`；
  formatting / documentSymbol / definition / references / completion 会显式返回空结果，
  等服务器实现后扩展自动生效（无需改扩展）。
- 扩展不自己实现任何语言特性，也不猜测服务器未声明的能力；因此「命令存在但暂时无输出」
  是服务器能力尚未落地的表现，不是扩展错误。
- vscode-languageclient v9 把文件监听移到了 `synchronize.fileEvents`；服务器尚未注册
  `workspace/didChangeWatchedFiles`，所以文件事件目前不会触发服务器动作（打开/编辑/保存
  的文档同步走 `textDocument/didOpen|didChange`，不受影响）。
- `Vuna: Check File` 原样运行 `vuna check <file>`；包级检查请用 `vuna check .`（终端）。