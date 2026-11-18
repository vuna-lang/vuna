#!/usr/bin/env node
// test/corpus/obs-cdp/cdp-client.mjs —— `vuna dev obs serve --cdp` 的最小 WebSocket + CDP 客户端。
//
// 用法：node test/corpus/obs-cdp/cdp-client.mjs <ADDR> <requests.json> [CAPTURE_DIR]
//   ADDR = tcp:127.0.0.1:PORT | unix:PATH（与 `vuna dev obs serve --cdp` 的地址语法一致）
//   requests.json = `[{"method":"...","params":{...}}, ...]`，按顺序在同一连接上发；
//   CAPTURE_DIR 给定时，把每个响应的 `result.profile`（若有）落成 `frame-<N>.json`，
//   供调用方 `cmp`（确定性断言）。
//
// 输出每个响应一行摘要：`#<N> result=...` / `#<N> error code=<c> message=<...>`；
// 退出码：0 = 全部请求都收到响应，2 = 连接/协议失败，3 = 参数错误。
//
// 传输是 RFC 6455 WebSocket：先发升级请求，再发掩码文本帧；服务端回不掩码文本帧。
// 为什么是 Node：`vuna repl client --addr` 一次调用只发一帧，而 `Profiler.stop` 必须在
// `Profiler.start` 之后（同一连接），所以这里需要「同一连接多帧」的客户端。
// 只在 suite 的 e2e tier 用（`pkgs.nodejs` 在 nix 的 e2e check 里注入）。
import net from 'node:net';
import fs from 'node:fs';
import crypto from 'node:crypto';

const addr = process.argv[2];
const reqPath = process.argv[3];
const captureDir = process.argv[4] || '';
if (!addr || !reqPath) {
  process.stderr.write('usage: node cdp-client.mjs <ADDR> <requests.json> [CAPTURE_DIR]\n');
  process.exit(3);
}

const requests = JSON.parse(fs.readFileSync(reqPath, 'utf8'));
if (!Array.isArray(requests) || requests.length === 0) {
  process.stderr.write('cdp-client: requests.json must be a non-empty array\n');
  process.exit(3);
}

function connect(a) {
  const m = /^(tcp|unix):(.*)$/.exec(a);
  if (!m) throw new Error(`bad address: ${a}`);
  if (m[1] === 'unix') return net.createConnection({ path: m[2] });
  const i = m[2].lastIndexOf(':');
  return net.createConnection({ host: m[2].slice(0, i), port: Number(m[2].slice(i + 1)) });
}

// 客户端帧必须掩码（RFC 6455 §5.3）。
function encodeFrame(opcode, payload) {
  const data = Buffer.isBuffer(payload) ? payload : Buffer.from(payload, 'utf8');
  const len = data.length;
  let head;
  if (len < 126) {
    head = Buffer.from([0x80 | opcode, 0x80 | len]);
  } else if (len < 65536) {
    head = Buffer.alloc(4);
    head[0] = 0x80 | opcode;
    head[1] = 0x80 | 126;
    head.writeUInt16BE(len, 2);
  } else {
    head = Buffer.alloc(10);
    head[0] = 0x80 | opcode;
    head[1] = 0x80 | 127;
    head.writeBigUInt64BE(BigInt(len), 2);
  }
  const mask = crypto.randomBytes(4);
  const masked = Buffer.alloc(len);
  for (let i = 0; i < len; i += 1) masked[i] = data[i] ^ mask[i % 4];
  return Buffer.concat([head, mask, masked]);
}

function decodeFrame(buf) {
  if (buf.length < 2) return null;
  const opcode = buf[0] & 0x0f;
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
  if (buf[1] & 0x80) {
    if (buf.length < off + 4 + len) return null;
    const mask = buf.slice(off, off + 4);
    off += 4;
    const out = Buffer.alloc(len);
    for (let i = 0; i < len; i += 1) out[i] = buf[off + i] ^ mask[i % 4];
    return { opcode, payload: out, rest: buf.slice(off + len) };
  }
  if (buf.length < off + len) return null;
  return { opcode, payload: buf.slice(off, off + len), rest: buf.slice(off + len) };
}

const sock = connect(addr);
const key = 'dGhlIHNhbXBsZSBub25jZQ==';
const bodies = [];
let pending = '';
let buf = Buffer.alloc(0);
let upgraded = false;
let finished = false;

function finish(code) {
  if (finished) return;
  finished = true;
  sock.end();
  process.exit(code);
}

sock.on('connect', () => {
  sock.write(
    `GET /devtools/page/vuna HTTP/1.1\r\nHost: localhost\r\nUpgrade: websocket\r\nConnection: Upgrade\r\n` +
      `Sec-WebSocket-Key: ${key}\r\nSec-WebSocket-Version: 13\r\n\r\n`,
  );
});

sock.on('data', (chunk) => {
  if (!upgraded) {
    pending += chunk.toString('utf8');
    const h = pending.indexOf('\r\n\r\n');
    if (h < 0) return;
    const head = pending.slice(0, h);
    if (!/^HTTP\/1\.1 101/i.test(head)) {
      process.stderr.write(`cdp-client: handshake status: ${head.split('\r\n')[0]}\n`);
      finish(2);
      return;
    }
    upgraded = true;
    buf = Buffer.from(pending.slice(h + 4), 'utf8');
    pending = '';
    requests.forEach((r, i) => {
      const body = JSON.stringify({ jsonrpc: '2.0', id: i + 1, method: r.method, params: r.params || {} });
      sock.write(encodeFrame(0x1, body));
    });
    drain();
    return;
  }
  buf = Buffer.concat([buf, chunk]);
  drain();
});

function drain() {
  for (;;) {
    const f = decodeFrame(buf);
    if (!f) return;
    buf = f.rest;
    if (f.opcode === 0x8) continue;
    if (f.opcode === 0x1) {
      bodies.push(f.payload.toString('utf8'));
      if (bodies.length === requests.length) done(bodies);
    }
  }
}

function done(frames) {
  let ok = true;
  frames.forEach((body, i) => {
    let parsed;
    try {
      parsed = JSON.parse(body);
    } catch (e) {
      process.stdout.write(`#${i} BAD JSON: ${body.slice(0, 120)}\n`);
      ok = false;
      return;
    }
    process.stdout.write(`#${i} ${summarize(parsed)}\n`);
    if (captureDir && parsed.result && parsed.result.profile) {
      // 落盘 profile 对象本身（不含 jsonrpc/id 信封），给确定性比较用。
      fs.writeFileSync(`${captureDir}/frame-${i}.json`, JSON.stringify(parsed.result.profile));
    }
  });
  finish(ok ? 0 : 2);
}

function summarize(v) {
  if (v.error) return `error code=${v.error.code} message=${JSON.stringify(v.error.message)}`;
  const r = v.result;
  if (!r) return `result=${JSON.stringify(v)}`;
  if (r.profile) {
    const p = r.profile;
    const sha = crypto.createHash('sha1').update(JSON.stringify(p)).digest('hex').slice(0, 12);
    return `result.profile nodes=${p.nodes.length} samples=${p.samples.length} startTime=${p.startTime} endTime=${p.endTime} sha1=${sha}`;
  }
  return `result=${JSON.stringify(r).slice(0, 200)}`;
}

sock.on('close', () => {
  if (!finished) {
    process.stdout.write(`# got ${bodies.length}/${requests.length} response(s) before close\n`);
    process.exit(2);
  }
});

sock.on('error', (e) => {
  process.stderr.write(`cdp-client: ${e.message}\n`);
  process.exit(2);
});