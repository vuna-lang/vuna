# vuna-web：视图、路由与服务驱动

`vuna-web` 是**生态层**包（不进 `seed/`，不在 TCB 内）：页面是数据、路由是纯函数，
服务端是 `vuna-http` 之上的薄驱动。依赖 `vuna-base` + `vuna-http`。

依赖方向：`vuna-web → vuna-http → vuna-base`；编译器与工具链不依赖它（D10：框架永远在
TCB 之外）。构建编排在另一个包 `vuna-web-cli`（见 §7），它依赖编译器并以 `vuna-web`
为框架——框架本身保持可以被客户端产物导入的纯净依赖面。

## 0. 怎么用

应用包**只有库，没有入口**：`lib/App.vuna` 导出 `app : Web.App`（路由表就是应用），
`vuna.toml` 里导出模块 `App`、依赖 `vuna-base` / `vuna-http` / `vuna-web`。

```vuna
-- myapp/lib/App.vuna
import Base
import Web.App as WebApp
import Web.Route as Route
import Web.View as View

export app : WebApp.App
app = WebApp.app
  [ Route.route "GET" "/" home
  , Route.route "GET" "/users/:id" userPage
  ]
```

```console
vuna-web-cli build myapp                 # → myapp/.vuna-web/bin/myapp
vuna-web-cli build myapp --out /tmp/out  # 产物目录可换
vuna-web-cli check myapp
myapp/.vuna-web/bin/myapp tcp:127.0.0.1:8080
```

产物布局：`.vuna-web/adapter/`（生成的适配包：一个 `main = Web.Main.main App.app` 的入口 +
依赖应用与 base/框架的 manifest）、`.vuna-web/build/`（编译器产物）、`.vuna-web/bin/<app>`
（可交付二进制）。适配包只落在构建目录，源码树里除 `.vuna-web/` 外没有任何生成物。

## 1. 三个模块

| 模块 | 职责 |
| --- | --- |
| `Web.View` | HTML 数据（`Text` / `Element` / `Fragment` / `Raw`）+ 纯渲染 |
| `Web.Route` | 方法 + 段模式（静态段 / `:name`）+ 匹配与 `Allow`；handler 是服务端行里的效应动作 |
| `Web.Server` | 路由表 → 响应（200 / 405 / 404 / HEAD，handler 每请求执行）+ 串行 accept 驱动 |
| `Web.App` | 应用值：`App { appRoutes }` |
| `Web.Main` | 服务端根：`main : App -> Eff [...]` 与 `serve : App -> String -> Eff [...]` |

## 2. 渲染口径

- 文本与属性值默认转义 `& < > " '`；`Raw` 是唯一的显式逃逸口。
- void 元素（`br` / `img` / `input` / …）不写闭合标签；属性按给定顺序输出。
- 名字不是「字母 / 数字 / `-` / `_`」的属性被丢弃，避免把 `on click` 这类名字拼进 HTML。
- 渲染只取决于输入：无时间、无随机、无环境，因此产物可以逐字节比较。

## 3. 路由口径

- 路径先去掉查询串、按 `/` 切段并丢弃空段（`/a/` 与 `//a` 都归一成 `a`），再逐段百分号解码
  （非法 / 截断的 `%XX` 原样保留）。
- 段模式：`users` 按字面匹配，`:id` 捕获一段（参数按出现顺序返回）。
- 方法比较大小写不敏感；`HEAD` 按 `GET` 匹配但只回头部（保留 `Content-Length`）。
- 命中 → 200；路径命中但方法不符 → 405 + `Allow`（去重、保序）；都不命中 → 404。
- 查询串 v1 不解析（只做路径匹配）；`Web.Url` 等有真实需求再加。
- **handler 是效应动作，不是预先算好的 `View`**：类型是
  `Params -> Eff [FsOp, EnvOp, ClockOp, NetOp, ConsoleOp] View`，每次请求都会重新执行。
  纯页面写 `pure (...)`；要读环境 / 时钟 / 文件就直接 `do`（`/env`、`/time` 是示例）。
  这就是真 SSR：页面在服务端按请求生成，而不是启动时渲染一次。

## 4. 服务驱动与并发

服务端行 = handler 的行：`[FsOp, EnvOp, ClockOp, NetOp, ConsoleOp]`；入口再多一个 `ArgsOp`
（读 argv）。所以 `Web.Server.respond : List Route -> Request -> Eff <服务端行> Response`，
`Web.Main.serve : App -> String -> Eff <服务端行> Int`，
`Web.Main.main : App -> Eff <服务端行 + ArgsOp> Int`。

`Web.Server.serve`：`netListen` → 打印 `listening <addr>`（`:0` 回填实际端口）→ 串行 accept →
每个连接交给 `Http.Connection.serve`（keep-alive、400 收口、请求预算都在那里）。

**行的一次性选择**：app 代码与服务端驱动共用同一行（v1 简化）。真正的按效应切分（哪些页面
只需 client / 共享）等分类器落地后再收窄；届时 handler 会变成对行参数化，`Route`/`App`
也要换成索引数据类型（record 不吃 `Row` kind）。

**限制（明确）**：v1 是串行 accept，一个慢客户端会挡住其它连接。并发模型（同进程 fiber +
非阻塞 socket）与效果机器的 `Wait` 一起做；换掉 accept 循环即可，`respond` 与 `Route` 不变。

`Http.Connection.serve` 结束时会关闭 duplex（用 `Connection.fromNet` 时即 `netClose` 该句柄），
调用方**不要**再关第二次——重复关闭是 `net: close handle …: invalid handle`。

## 5. 测试

- 纯：`packages/web/test/{View,Route}.vuna`（`vuna test packages/web`）——转义、void 元素、
  属性过滤、切段、百分号解码、参数匹配、405 的 `Allow`。
- e2e：`packages/web-cli/test/steps/109_web_static.steps` 跑 `packages/web-cli/test/corpus/web/static-smoke.sh`：
  `vuna-web-cli build examples/web-static` → `tcp:127.0.0.1:0` → `curl` 断言状态码 / 正文 /
  `Content-Type` / `Allow` / HEAD 的 `Content-Length` / 尾斜杠归一 / 百分号解码 + 转义
  （与手写入口时的断言完全一致：同样的服务端契约，换的是构建器）。
  无 `curl` 时打印 SKIP；端口在沙箱不保证，所以不进 `nix flake check`。
- 示例：`examples/web-static`（`/`、`/about`、`/users/:id`、`POST /users/:id`、`/echo/:msg`）。

## 6. 与 SSR 的关系

已经有 **SSR**：handler 是效应动作，每次请求在服务端重新执行（读环境 / 时钟 / 文件），
渲染出 HTML 再回给客户端——不是启动时渲染一次、也不是客户端渲染。

还没有的是 **水合与客户端**：服务端生成的 HTML 不带状态快照与事件绑定，页面没有客户端
路由与响应式。这些需要浏览器侧（wasm 产物、导出 ABI、效果机器的 `Wait`），以及按效应行
推断切分的分类器；`respond` 的形状（请求 → 响应）在那之前不需要改。

## 7. `vuna-web-cli`（编排工具）

`packages/web-cli`（包名 `vuna-web-cli`，二进制同名）是生态层的编排工具，不属产品 CLI：

- **职责**：读应用包上下文 → 生成适配包（`main = Web.Main.main App.app`）→ 调
  `Driver.CompilerCli.runCompilerCliFor "vuna-web-cli" ["build", adapter, ...]`（与 `vuna build`
  同一条构建链）→ 把产物改名成应用名。
- **不写第二套 codegen**：编译、split、缓存、目标选择全部复用编译器包；它只做编排。
- **依赖来源**：适配包的 `vuna-base` / `vuna-web` 取**应用自己依赖图里的实例**（模块根名 →
  包目录），因此同一个依赖图里不会出现两个 `vuna-base`；`VUNA_WEB` 可覆盖框架目录。
- **目标**：默认 `--target ocaml`。`native` 目前不能构建服务端——native 宿主层还没有网络
  原语（`@vuna@host@tryNet*` 报 `runtime function values are not supported yet`），等
  native-effects 那条线补上网络后再说。
- **已知限制**：串行 accept（慢客户端挡住其它连接，见 §4）；`PATH` 里必须有 `ocamlopt`
  （`--target ocaml` 的构建脚本需要它）。
### 7.1 插件形态（`vuna web …`）

`vuna-web` 插件（`packages/plugin-web`，二进制 `vuna-web`）把同一个 `Vuna.Web.Cli`
挂到产品入口下：

```console
vuna web build myapp [--out DIR] [--target ocaml|native] [--release]
vuna web check myapp
vuna web version
```

它**不声明后端插件依赖**：服务端目标只有 `ocaml` / `native`，构建链在编译器库内完成，
不需要 `vuna-target-*` 进程。describe 的 `req` 行留给真正需要别的插件的场景（协议见
[cli.md](cli.md)「插件发现」）。
