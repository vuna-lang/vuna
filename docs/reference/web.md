# vuna-web：视图、路由与服务驱动

`vuna-web` 是**生态层**包（不进 `seed/`，不在 TCB 内）：页面是数据、路由是纯函数，
服务端是 `vuna-http` 之上的薄驱动。依赖 `vuna-base` + `vuna-http`。

依赖方向：`vuna-web → vuna-http → vuna-base`；编译器与工具链不依赖它（D10：框架永远在
TCB 之外）。

## 1. 三个模块

| 模块 | 职责 |
| --- | --- |
| `Web.View` | HTML 数据（`Text` / `Element` / `Fragment` / `Raw`）+ 纯渲染 |
| `Web.Route` | 方法 + 段模式（静态段 / `:name`）+ 匹配与 `Allow` |
| `Web.Server` | 路由表 → 响应（200 / 405 / 404 / HEAD）+ 串行 accept 驱动 |

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

## 4. 服务驱动与并发

`Web.Server.serve : List Route -> String -> Eff r Int`：`netListen` → 打印
`listening <addr>`（`:0` 回填实际端口）→ 串行 accept → 每个连接交给
`Http.Connection.serve`（keep-alive、400 收口、请求预算都在那里）。

**限制（明确）**：v1 是串行 accept，一个慢客户端会挡住其它连接。并发模型（同进程 fiber +
非阻塞 socket）与效果机器的 `Wait` 一起做；换掉 accept 循环即可，`respond` 与 `Route` 不变。

`Http.Connection.serve` 结束时会关闭 duplex（用 `Connection.fromNet` 时即 `netClose` 该句柄），
调用方**不要**再关第二次——重复关闭是 `net: close handle …: invalid handle`。

## 5. 测试

- 纯：`packages/web/test/{View,Route}.vuna`（`vuna test packages/web`）——转义、void 元素、
  属性过滤、切段、百分号解码、参数匹配、405 的 `Allow`。
- e2e：`test/suite/steps/109_web_static.steps` 跑 `test/corpus/web/static-smoke.sh`：
  build `examples/web-static` → `tcp:127.0.0.1:0` → `curl` 断言状态码 / 正文 / `Content-Type` /
  `Allow` / HEAD 的 `Content-Length` / 尾斜杠归一 / 百分号解码 + 转义。
  无 `curl` 时打印 SKIP；端口在沙箱不保证，所以不进 `nix flake check`。
- 示例：`examples/web-static`（`/`、`/about`、`/users/:id`、`POST /users/:id`、`/echo/:msg`）。

## 6. 与 SSR 的关系

这一步只有「静态页面 + 路由」：每条路由返回一个固定的 `View`，没有状态、没有水合、
没有浏览器侧代码。水合、交互与 HMR 需要浏览器侧（wasm）与效果机器的 `Wait`，
不在这一层；`respond` 的形状（请求 → 响应）在那之前不需要改。