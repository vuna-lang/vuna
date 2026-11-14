#!/usr/bin/env node
// nix/obs-cdp-bridge.mjs —— Chrome DevTools 的 WebSocket 桥（工具侧资产，零依赖）。
//
// 规范：docs/reference/observability.md §1 O11、§7 `serve --cdp`、§8 生态表、§10。
//
// 为什么要这个文件：`vuna obs serve --cdp` 只做 **Content-Length JSON-RPC over socket**
// （与 REPL server / LSP 同一套帧层）。CDP 客户端（Chrome DevTools frontend）要的是
// HTTP `/json/version`、`/json/list` + WebSocket：握手需要 `Sec-WebSocket-Accept` =
// base64(SHA-1(key + GUID))。vuna 语言层没有 SHA-1/base64，也不该为一个桥在 TCB 里造
// 密码学（O11 / debt D83），所以握手与帧编解码放在这个 Node 脚本里，vuna 侧保持干净的
// JSON-RPC 传输。
//
// 架构（每个 WS 连接一个 vuna 进程；因为 serve 是单连接串行语义）：
//
//   Chrome DevTools ──HTTP /json/*──▶ 本脚本 ──WS 帧──▶ 本脚本 ──Content-Length──▶
//                                       vuna obs serve --cdp tcp:127.0.0.1:0 [TRACE...]
//
//   1. WS 连接建立时，脚本按 `--vuna` 起一个 `vuna obs serve`，等它 stdout 打出就绪行
//      `listening tcp:127.0.0.1:<PORT>`（PORT=0 ⇒ 由 serve 挑空闲端口并回填，脚本不自己
//      猜端口，避免 TOCTOU）；
//   2. 之后 WS 文本帧里每条 JSON-RPC 请求（带 `id` 或通知）按 FIFO 顺序写进那条 TCP 连接
//      （`Content-Length: N\r\n\r\n<body>`，body 是 UTF-8 字节数）；
//   3. 从 TCP 读回的每一帧就是一条 JSON-RPC 响应，按同一 FIFO 顺序转成 WS 文本帧回给客户端
//      （serve 对每帧必回一帧：未知方法回 -32601，坏帧回 -32700，所以顺序一一对应）；
//   4. WS 关闭 ⇒ 关 TCP ⇒ serve 因对端关闭正常退出（退出码 0），脚本回收子进程。
//
// 协议细节（本脚本支持的子集，超出部分明确拒绝而不是静默画错）：
//   * HTTP：只认 GET `/json/version`、`/json/version/browser`、`/json/list`（含 `/json`）；
//     其它路径 404。响应体是 JSON，`webSocketDebuggerUrl` 指向 `/devtools/page/<id>`。
//   * WS 握手：`Sec-WebSocket-Accept` 由 node:crypto 的 SHA-1 + base64 算；只接受 GET。
//   * WS 帧：只支持**文本帧（opcode 1）**、close(8)、ping(9)/pong(10)。客户端帧必须带遮罩
//     （按 RFC 6455 解开；服务端帧不遮罩）。**不支持分片续帧**（FIN=0 或 opcode 0 一律按
//     协议错误处理：回 close 1003 并结束该 WS）。理由：本桥只转发小 JSON-RPC 消息，
//     分片是 DevTools 前端不会走到的路径；要支持就得多一个分片重组状态机，收益为零。
//
// 用法（缺 Node 时给可操作提示：脚本没有额外依赖检查，`#!/usr/bin/env node` 会直接报
// `node: command not found`；装 Node 用 `nix shell nixpkgs#nodejs`）：
//
//   # 1) 先准备一份带 CPU 采样的 trace（level 3 + cpu 采样）：
//   VUNA_OBS=3 VUNA_OBS_DIR=/tmp/vuna-trace <your-program>
//   ls /tmp/vuna-trace/vuna-*.jsonl
//
//   # 2) 起桥（默认监听 127.0.0.1:9229；trace 是桥的**数据源**，可给多份）：
//   node nix/obs-cdp-bridge.mjs --port 9229 /tmp/vuna-trace/vuna-1234.jsonl
//
//   # 3) 检查 HTTP 端点：
//   curl -s http://127.0.0.1:9229/json/version
//   curl -s http://127.0.0.1:9229/json/list
//
//   # 4) Chrome DevTools frontend：用 /json/version 里的 webSocketDebuggerUrl（或
//   #    在 `chrome://inspect` 的 Discover network targets → Configure 里加 127.0.0.1:9229）。
//   #    Profiler 面板的 Start/Stop 对应 Profiler.start/stop；stop 回的是**整份 trace 的**
//   #    profile（离线，不是 live sampling）。
//
//   # 选项：
//   #   --port N            桥监听端口（默认 9229；0 = 系统挑端口并在就绪行打印）
//   #   --host H            桥监听地址（默认 127.0.0.1；不要在不可信网络上暴露）
//   #   --vuna PATH         vuna 可执行（默认 $VUNA / ./result/bin/vuna / PATH 里的 vuna）
//   #   --serve-addr ADDR   复用已有 serve 端点（tcp:... | unix:...）。**注意**：serve 是
//   #                       单连接、连接关闭即退出，复用端点只适合「一个 WS 客户端」；
//   #                       默认（省略本 flag）每个 WS 连接起一个独立 serve 进程。
//   #   --allow-slow        透传给 serve（当前无效果，见文档 §7）
//   #   TRACE...            传给 serve 的数据源（省略则只服 Profiler.enable /
//   #                       Runtime.getIsolateId；Profiler.stop 会回 -32000）
//
// 退出码：0 = 正常结束；2 = 用法/参数/起 serve 失败（可操作错误打到 stderr）。
// 不进 `nix flake check`：需要 Node + 网络端口，沙箱不保证；端到端验证见文档 §7 的
// 可复现步骤（本地自检脚本 `_scratch/` 不提交）。
import http from 'node:http';
import net from 'node:net';
import crypto from 'node:crypto';
import { spawn } from 'node:child_process';
import fs from 'node:fs';
import path from 'node:path';

const WS_GUID = '258EAFA5-E914-47DA-95CA-C5AB0DC85B11';
const VERSION = 'vuna-obs-cdp-bridge 1';
const TARGET_ID = 'vuna-obs';
const WS_PATH = `/devtools/page/${TARGET_ID}`;

// ---------------------------------------------------------------- 参数
function usage() {
  const text = fs.readFileSync(process.argv[1], 'utf8');
  const head = text.split('\n').filter((l) => l.startsWith('//'));
  process.stderr.write(`${head.map((l) => l.replace(/^\/\/ ?/, '')).join('\n')}\n`);
  process.exit(2);
}

function fail(msg) {
  process.stderr.write(`obs-cdp-bridge: ${msg}\n`);
  process.exit(2);
}

function parseArgs(argv) {
  const opts = { port: 9229, host: '127.0.0.1', vuna: '', serveAddr: '', allowSlow: false, traces: [] };
  for (let i = 0; i < argv.length; i += 1) {
    const a = argv[i];
    if (a === '--help' || a === '-h') usage();
    else if (a === '--port') {
      opts.port = Number(argv[++i]);
      if (!Number.isInteger(opts.port) || opts.port < 0) fail('--port needs a non-negative integer');
    } else if (a === '--host') {
      opts.host = argv[++i] || '';
      if (!opts.host) fail('--host needs a value');
    } else if (a === '--vuna') {
      opts.vuna = argv[++i] || '';
      if (!opts.vuna) fail('--vuna needs a path');
    } else if (a === '--serve-addr') {
      opts.serveAddr = argv[++i] || '';
      if (!opts.serveAddr) fail('--serve-addr needs an address');
    } else if (a === '--allow-slow') opts.allowSlow = true;
    else if (a === '--') {
      opts.traces.push(...argv.slice(i + 1));
      i = argv.length;
    } else if (a.startsWith('-')) fail(`unknown flag: ${a}`);
    else opts.traces.push(a);
  }
  return opts;
}

// ---------------------------------------------------------------- vuna 可执行定位
// 与 nix/obs.sh 的 find_vuna 同一个顺序：$VUNA → ./result/bin/vuna → PATH 里的 vuna。
function findVuna(explicit) {
  if (explicit) return explicit;
  if (process.env.VUNA) return process.env.VUNA;
  const local = path.resolve('result/bin/vuna');
  if (fs.existsSync(local)) return local;
  for (const dir of (process.env.PATH || '').split(':')) {
    if (!dir) continue;
    const candidate = path.join(dir, 'vuna');
    try { fs.accessSync(candidate, fs.constants.X_OK); return candidate; } catch { /* next */ }
  }
  return '';
}

// ---------------------------------------------------------------- Content-Length 客户端
// 一条到 `vuna obs serve` 的 TCP 连接：写帧 + 按 Content-Length 切读响应帧。
class VunaClient {
  constructor(addr, onFrame, onGone) {
    this.onFrame = onFrame;
    this.onGone = onGone;
    this.buf = '';
    this.closed = false;
    const m = /^(tcp|unix):(.*)$/.exec(addr || '');
    if (!m) throw new Error(`bad address: ${addr}`);
    if (m[1] === 'unix') this.sock = net.createConnection({ path: m[2] });
    else {
      const idx = m[2].lastIndexOf(':');
      this.sock = net.createConnection({ host: m[2].slice(0, idx), port: Number(m[2].slice(idx + 1)) });
    }
    this.sock.on('data', (chunk) => this.onData(chunk));
    this.sock.on('error', () => this.onGone());
    this.sock.on('close', () => this.onGone());
  }

  send(body) {
    if (this.closed) return;
    // Content-Length 是 UTF-8 字节数（vuna 侧 strLength 同为字节数）。
    const bytes = Buffer.from(body, 'utf8').length;
    this.sock.write(`Content-Length: ${bytes}\r\n\r\n${body}`);
  }

  onData(chunk) {
    this.buf += chunk.toString('utf8');
    for (;;) {
      const headerEnd = this.buf.indexOf('\r\n\r\n');
      if (headerEnd < 0) return;
      const lenLine = /content-length:\s*(\d+)/i.exec(this.buf.slice(0, headerEnd));
      if (!lenLine) {
        this.buf = this.buf.slice(headerEnd + 4);
        continue;
      }
      const len = Number(lenLine[1]);
      if (this.buf.length < headerEnd + 4 + len) return;
      const body = this.buf.slice(headerEnd + 4, headerEnd + 4 + len);
      this.buf = this.buf.slice(headerEnd + 4 + len);
      this.onFrame(body);
    }
  }

  close() {
    if (this.closed) return;
    this.closed = true;
    try { this.sock.end(); } catch { /* already gone */ }
  }
}

// ---------------------------------------------------------------- 起一个 serve 子进程
// 从 stdout 解析 `listening tcp:127.0.0.1:<PORT>`（serve 的 stdout 只用于就绪行，
// 协议帧与诊断都不走 stdout）。成功 → onReady(addr)；失败 → onFail(msg)。
function spawnServe(opts, onReady, onFail) {
  const bin = findVuna(opts.vuna);
  if (!bin) {
    onFail('cannot find vuna: pass --vuna PATH or build with `nix build .#vuna --out-link result` (node: `nix shell nixpkgs#nodejs`)');
    return null;
  }
  const argv = ['obs', 'serve', '--cdp', 'tcp:127.0.0.1:0'];
  if (opts.allowSlow) argv.push('--allow-slow');
  argv.push(...opts.traces);
  let child;
  try {
    child = spawn(bin, argv, { stdio: ['ignore', 'pipe', 'pipe'], env: { ...process.env } });
  } catch (e) {
    onFail(`failed to start vuna: ${e.message}`);
    return null;
  }
  let ready = false;
  child.stdout.setEncoding('utf8');
  child.stdout.on('data', (chunk) => {
    if (ready) return;
    const m = /listening (tcp:127\.0\.0\.1:\d+|unix:\S+)/.exec(chunk);
    if (m) {
      ready = true;
      onReady(m[1]);
    }
  });
  child.stderr.setEncoding('utf8');
  // serve 的诊断默认丢弃（避免噪音）；需要排查时设 BRIDGE_VERBOSE=1 透传。
  child.stderr.on('data', (chunk) => { if (process.env.BRIDGE_VERBOSE === '1') process.stderr.write(chunk); });
  child.on('error', (e) => { if (!ready) onFail(`failed to start vuna: ${e.message}`); });
  child.on('exit', (code, sig) => {
    if (!ready) onFail(`vuna obs serve exited before printing a readiness line (code ${code}${sig ? `, signal ${sig}` : ''})`);
  });
  return {
    stop() { try { child.kill(); } catch { /* already gone */ } },
  };
}

// ---------------------------------------------------------------- WS 帧
const OP_TEXT = 1;
const OP_CLOSE = 8;
const OP_PING = 9;
const OP_PONG = 10;

// 一帧解码：只支持单帧（FIN=1）文本/close/ping/pong；客户端帧必须遮罩。
// 返回 {opcode, payload, fin, consumed}；数据不够 = null；协议违规 = throw。
function decodeFrame(buf) {
  if (buf.length < 2) return null;
  const fin = (buf[0] & 0x80) !== 0;
  const opcode = buf[0] & 0x0f;
  const masked = (buf[1] & 0x80) !== 0;
  let len = buf[1] & 0x7f;
  let off = 2;
  if (len === 126) {
    if (buf.length < 4) return null;
    len = buf.readUInt16BE(2);
    off = 4;
  } else if (len === 127) {
    if (buf.length < 10) return null;
    len = Number(buf.readBigUInt64BE(2));
    off = 10;
  }
  if (!masked) throw new Error('client frame without mask (RFC 6455 §5.1)');
  if (buf.length < off + 4 + len) return null;
  const mask = buf.slice(off, off + 4);
  const payload = Buffer.alloc(len);
  for (let i = 0; i < len; i += 1) payload[i] = buf[off + 4 + i] ^ mask[i % 4];
  return { fin, opcode, payload, consumed: off + 4 + len };
}

function encodeFrame(opcode, payload) {
  const len = payload.length;
  let header;
  if (len < 126) header = Buffer.from([0x80 | opcode, len]);
  else if (len < 65536) {
    header = Buffer.alloc(4);
    header[0] = 0x80 | opcode;
    header[1] = 126;
    header.writeUInt16BE(len, 2);
  } else {
    header = Buffer.alloc(10);
    header[0] = 0x80 | opcode;
    header[1] = 127;
    header.writeBigUInt64BE(BigInt(len), 2);
  }
  return Buffer.concat([header, payload]);
}

// close 帧的载荷 = 2 字节状态码（RFC 6455 §5.5.1）。
function closePayload(code) {
  const p = Buffer.alloc(2);
  p.writeUInt16BE(code, 0);
  return p;
}

// ---------------------------------------------------------------- 一个 WS 会话
// 每个 WS 连接一个 serve 子进程（serve 是单连接语义）+ 一条 FIFO 的待回帧计数。
// 注意：serve 对收到的**每一帧**都回一帧（含未知方法 / 坏帧），所以用计数就够了；
// 万一 serve 多回/少回，这里不会错配到别的请求——它只会丢掉多余帧 / 留下空等。
function handleWebSocket(socket, req, opts) {
  const key = req.headers['sec-websocket-key'];
  const accept = crypto.createHash('sha1').update(key + WS_GUID).digest('base64');
  socket.write(
    'HTTP/1.1 101 Switching Protocols\r\n'
    + 'Upgrade: websocket\r\n'
    + 'Connection: Upgrade\r\n'
    + `Sec-WebSocket-Accept: ${accept}\r\n\r\n`,
  );

  let buf = Buffer.alloc(0);
  let alive = true;
  let pending = 0; // 已发给 serve、还没回帧的请求数
  const outbox = []; // serve 还在起时就到的请求 body（按序保留）
  let serveProc = null;
  let client = null;

  const wsSend = (opcode, payload) => {
    if (!alive) return;
    try { socket.write(encodeFrame(opcode, payload)); } catch { alive = false; }
  };

  // serve 回的一帧 → 客户端（body 是 serve 写的 JSON 文本，原样转发）。
  const onServeFrame = (body) => {
    if (pending > 0) pending -= 1; // 多余的帧（不该发生）：丢弃，不发给客户端
    wsSend(OP_TEXT, Buffer.from(body, 'utf8'));
  };

  const shutdown = () => {
    if (!alive) return;
    alive = false;
    if (client) client.close();
    if (serveProc) serveProc.stop();
    try { socket.end(); } catch { /* gone */ }
  };

  const start = (addr) => {
    try {
      client = new VunaClient(addr, onServeFrame, () => shutdown());
    } catch (e) {
      process.stderr.write(`obs-cdp-bridge: ${e.message}\n`);
      shutdown();
      return;
    }
    // 排队的请求按原顺序补发（serve 在起的过程中到达的帧不丢）。
    for (const body of outbox) {
      pending += 1;
      client.send(body);
    }
    outbox.length = 0;
  };

  if (opts.serveAddr) {
    start(opts.serveAddr);
  } else {
    serveProc = spawnServe(opts, start, (msg) => {
      process.stderr.write(`obs-cdp-bridge: ${msg}\n`);
      // 起子进程失败：回一条 JSON-RPC internal error 再关，客户端不会空等。
      wsSend(OP_TEXT, Buffer.from(JSON.stringify({
        jsonrpc: '2.0', id: null, error: { code: -32603, message: msg },
      }), 'utf8'));
      shutdown();
    });
  }

  socket.on('data', (chunk) => {
    buf = Buffer.concat([buf, chunk]);
    for (;;) {
      let frame;
      try {
        frame = decodeFrame(buf);
      } catch (e) {
        process.stderr.write(`obs-cdp-bridge: bad frame: ${e.message}\n`);
        wsSend(OP_CLOSE, closePayload(1003)); // unsupported data
        shutdown();
        return;
      }
      if (!frame) return;
      buf = buf.slice(frame.consumed);
      if (!frame.fin) { wsSend(OP_CLOSE, closePayload(1003)); shutdown(); return; }
      if (frame.opcode === OP_CLOSE) { wsSend(OP_CLOSE, frame.payload.subarray(0, 2)); shutdown(); return; }
      if (frame.opcode === OP_PING) { wsSend(OP_PONG, frame.payload); continue; }
      if (frame.opcode === OP_PONG) continue;
      if (frame.opcode !== OP_TEXT) { wsSend(OP_CLOSE, closePayload(1003)); shutdown(); return; }
      const body = frame.payload.toString('utf8');
      if (!client) { outbox.push(body); continue; }
      pending += 1;
      client.send(body);
    }
  });
  socket.on('close', shutdown);
  socket.on('error', shutdown);
}
// ---------------------------------------------------------------- HTTP
function targetJson(opts, port) {
  return {
    id: TARGET_ID,
    type: 'page',
    title: 'vuna obs (offline trace)',
    url: 'vuna-obs://trace',
    description: 'vuna obs serve --cdp (offline: the profile comes from an existing trace, not live sampling)',
    webSocketDebuggerUrl: `ws://${opts.host}:${port}${WS_PATH}`,
    devtoolsFrontendUrl: `devtools://devtools/bundled/inspector.html?ws=${opts.host}:${port}${WS_PATH}`,
  };
}

function versionJson(opts, port) {
  return {
    Browser: `${VERSION} (vuna obs serve --cdp)`,
    'Protocol-Version': '1.3',
    'User-Agent': VERSION,
    'V8-Version': '0.1.0',
    'WebKit-Version': '0.1.0',
    webSocketDebuggerUrl: `ws://${opts.host}:${port}${WS_PATH}`,
  };
}

function startHttp(opts) {
  const server = http.createServer((req, res) => {
    const port = server.address().port;
    const url = new URL(req.url, `http://${opts.host}`);
    if (url.pathname === '/json/version' || url.pathname === '/json/version/browser') {
      res.writeHead(200, { 'content-type': 'application/json' });
      res.end(`${JSON.stringify(versionJson(opts, port))}\n`);
      return;
    }
    if (url.pathname === '/json' || url.pathname === '/json/list') {
      res.writeHead(200, { 'content-type': 'application/json' });
      res.end(`${JSON.stringify([targetJson(opts, port)])}\n`);
      return;
    }
    res.writeHead(404, { 'content-type': 'text/plain' });
    res.end('404: use /json/version, /json/list or the webSocketDebuggerUrl\n');
  });

  server.on('upgrade', (req, socket) => {
    const url = new URL(req.url, `http://${opts.host}`);
    if (url.pathname !== WS_PATH) {
      socket.write('HTTP/1.1 404 Not Found\r\n\r\n');
      socket.destroy();
      return;
    }
    if (req.method !== 'GET' || (req.headers.upgrade || '').toLowerCase() !== 'websocket') {
      socket.write('HTTP/1.1 400 Bad Request\r\n\r\n');
      socket.destroy();
      return;
    }
    handleWebSocket(socket, req, opts);
  });
  return server;
}

// ---------------------------------------------------------------- 主
const opts = parseArgs(process.argv.slice(2));
const server = startHttp(opts);
server.on('error', (e) => fail(`cannot listen on ${opts.host}:${opts.port}: ${e.message}`));
server.listen(opts.port, opts.host, () => {
  const port = server.address().port;
  const base = `http://${opts.host}:${port}`;
  // 就绪行：脚本 / e2e 用它判断可连（与 `vuna obs serve` 的 `listening <ADDR>` 同精神）。
  process.stdout.write(`bridge listening ${base} (json: ${base}/json/version)\n`);
  const traces = opts.traces.length === 0 ? '(no trace: Profiler.stop -> -32000)' : opts.traces.join(', ');
  const source = opts.serveAddr ? `reuse ${opts.serveAddr}` : (findVuna(opts.vuna) || '<vuna not found>');
  process.stdout.write(`bridge data source: ${source} ${traces}\n`);
});

for (const sig of ['SIGINT', 'SIGTERM']) {
  process.on(sig, () => { server.close(() => process.exit(0)); });
}
