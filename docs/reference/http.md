# vuna-http：HTTP/1.1 编解码与连接层

`vuna-http` 是**中立库**（生态层，不进 `seed/`，不在 TCB 内）：只做 HTTP/1.1 的字节 ↔
消息变换与传输无关的连接循环。工具链的 dev server 与 `vuna-web` 的产品 server 共用同一份实现，
因此它既不属于编译器，也不属于框架。

依赖方向：`vuna-http → vuna-base`；`vuna`（CLI）与 `vuna-web` 可以依赖它，反向不成立。

## 1. 边界

- **只做 HTTP/1.1**：h2 / h3（HPACK、ALPN）不在这个包的设计位。
- **不持有 socket**：传输由调用方以 duplex 记录传入（内存流 / TCP / 将来的 TLS）。
  包内不出现 `prim_net` 句柄，TLS 归属因此不阻塞本包。
- **不做 web 专有词汇**：路由、会话、静态资源、SSR 都不在这里，属于 `vuna-web`。
- **WebSocket（ws/wss）与本包同一层**：`ws` 与 `wss` 只差传输，握手与帧完全一致。

## 2. 消息模型

`Http.Request` / `Http.Response` 是 record：请求行三个分量（方法、request-target、版本）、
头部（`List (Pair String String)`，保持发送顺序）、已解码的体（`String` 是字节串）。
`Http.Header` 提供大小写不敏感查找、token 校验与渲染；`Http.Response.statusText` 给常见状态码
的原因短语。

## 3. 解析规则（安全面）

`Http.Parse.parseRequest` / `parseResponse` 是**增量**的，返回

```text
Parsed a = Complete a String   -- 消息 + 剩余字节（流水线下一条）
         | Incomplete          -- 需要更多字节
         | Invalid String      -- 非法，带原因
```

请求走私相关形态一律拒绝，不做「宽容解析」：

- `Content-Length` 与 `Transfer-Encoding` 同时出现；
- 重复的 `Content-Length`、重复的 `Transfer-Encoding`；
- 折叠头部行（行首空格 / 制表符）；
- 分块尾部字段（trailers）：显式拒绝而不是静默丢弃；
- 超大头部 / 超大体重：`maxHeaderBytes` = 16 KiB，`maxBodyBytes` = 16 MiB（与工具链 JSON 帧同口径）；
- 非 `HTTP/1.0` / `HTTP/1.1` 的版本行。

请求目标按原始形态保留（origin-form / absolute-form 不归一化），归一化属于框架。

## 4. 渲染

`Http.Render.renderRequest` / `renderResponse` 按体字节数补 `Content-Length`（调用方已给则不覆盖）；
1xx / 204 / 304 不补也不输出体。头的顺序即调用方给的顺序——产物逐字节确定。

## 5. 传输接缝

调用方构造 duplex 记录后交给连接循环：

```text
Duplex r = { readSome  : Bytes -> Eff r Int    -- 0 = EOF
             writeAll  : Bytes -> Eff r Unit
             close     : Eff r Unit }
```

内存 duplex 的 `r` 是 `Nil`，所以编解码与连接循环都能在无端口、无 socket 的条件下测。
TLS 将来若自持，只是第三个 duplex 实现，`Http.*` 不需要改。

## 6. 现状与测试

已落地：消息模型、双向编解码、严格解析规则、包内测试
（`packages/http/test/Codec.vuna`，`vuna test packages/http`）。
连接循环、WebSocket 握手与帧、客户端循环按后续提交落地。

基础算法在 `vuna-base`：`Base.Data.Sha1`（RFC 3174，十六进制与原始字节两种输出）与
`Base.Data.Base64`（RFC 4648，严格解码）。它们放在 base 是因为属于通用算法，
且编译器不 import，因此不进 `seed/` 闭包。