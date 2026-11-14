#!/usr/bin/env node
// test/corpus/obs-cdp/ws-client.mjs —— `nix/obs-cdp-bridge.mjs` 的最小 WebSocket + CDP 客户端。
//
// 用法：node test/corpus/obs-cdp/ws-client.mjs <HTTP-BASE> [CAPTURE_DIR]
//   HTTP-BASE 形如 `http://127.0.0.1:PORT`（桥的 HTTP 端点）。
//
// 覆盖：`/json/version`、`/json/list`、`/devtools/page/<id>` 的 WS 握手
// （独立实现 `Sec-WebSocket-Accept` 的 SHA-1 + base64，用固定 key 校验服务端算得对）、
// `Profiler.enable` / `Profiler.start` / `Profiler.stop`、ping/pong、close。
// 输出每步一行 `ws: <步骤> ok`；失败写 stderr 并 exit 1；参数错误 exit 3。
//
// 只在 suite 的 e2e tier 用（需要 Node；不进 nix flake check）。
import crypto from 'node:crypto';
import http from 'node:http';
import net from 'node:net';
import fs from 'node:fs';

const base = process.argv[2];
const captureDir = process.argv[3] || '';
if (!base) {
  process.stderr.write('usage: node ws-client.mjs <HTTP-BASE> [CAPTURE_DIR]\n');
  process.exit(3);
}
const port = Number(new URL(base).port);
const host = new URL(base).hostname;

function fail(msg) {
  process.stderr.write(`ws: ${msg}\n`);
  process.exit(1);
}

function getJson(path) {
  return new Promise((resolve, reject) => {
    http
      .get(`${base}${path}`, (res) => {
        let body = '';
        res.on('data', (c) => (body += c));
        res.on('end', () => {
          if (res.statusCode !== 200) return reject(new Error(`${path}: HTTP ${res.statusCode}`));
          try {
            resolve(JSON.parse(body));
          } catch (e) {
            reject(new Error(`${path}: bad JSON`));
          }
        });
      })
      .on('error', reject);
  });
}

// WebSocket 帧编解码（只支持单帧文本 + close/ping/pong；桥也不分片）。
function encodeFrame(opcode, payload) {
  const data = Buffer.isBuffer(payload) ? payload : Buffer.from(payload, 'utf8');
  const len = data.length;
  let head;
  if (len < 126) {
    head = Buffer.from([0x80 | opcode, len]);
  } else if (len < 65536) {
    head = Buffer.alloc(4);
    head[0] = 0x80 | opcode;
    head[1] = 126;
    head.writeUInt16BE(len, 2);
  } else {
    head = Buffer.alloc(10);
    head[0] = 0x80 | opcode;
    head[1] = 127;
    head.writeBigUInt64BE(BigInt(len), 2);
  }
  // 客户端帧必须遮罩（mask bit + 4 字节 key）。
  const mask = crypto.randomBytes(4);
  const masked = Buffer.alloc(len);
  for (let i = 0; i < len; i += 1) masked[i] = data[i] ^ mask[i % 4];
  const withMask = Buffer.concat([head, mask, masked]);
  const at = head.length - 1;
  withMask[at] = withMask[at] | 0x80;
  return withMask;
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
  const masked = (buf[1] & 0x80) !== 0;
  if (masked) {
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

const cdpRequests = [
  { method: 'Profiler.enable', params: {} },
  { method: 'Profiler.start', params: {} },
  { method: 'Profiler.stop', params: {} },
];

async function main() {
  const version = await getJson('/json/version');
  process.stdout.write('ws: /json/version ok\n');
  const list = await getJson('/json/list');
  if (!Array.isArray(list) || list.length === 0) fail('/json/list is empty');
  process.stdout.write('ws: /json/list ok\n');

  const wsUrl = list[0].webSocketDebuggerUrl;
  if (!wsUrl) fail('/json/list entry has no webSocketDebuggerUrl');
  const wsPath = new URL(wsUrl).pathname;

  // 用固定 key 做握手，自己算一遍 acccept 再与服务端比较。
  const key = 'dGVsdGUtb2Nkcy1jb2RldGVzdA==';
  const expectedAccept = crypto
    .createHash('sha1')
    .update(`${key}258EAFA5-E914-47DA-95CA-C5AB0DC85B11`)
    .digest('base64');

  const sock = net.createConnection({ host, port });
  let upgraded = false;
  let pending = '';
  let buf = Buffer.alloc(0);
  let got = 0;
  let done = false;

  const nextRequest = () => {
    if (got >= cdpRequests.length) {
      sock.write(encodeFrame(0x8, '')); // close
      setTimeout(() => {
        if (!done) fail('no close frame from bridge');
      }, 2000);
      return;
    }
    const r = cdpRequests[got];
    const body = JSON.stringify({ jsonrpc: '2.0', id: got + 1, method: r.method, params: r.params });
    sock.write(encodeFrame(0x1, body));
  };

  sock.on('connect', () => {
    sock.write(
      `GET ${wsPath} HTTP/1.1\r\nHost: ${host}:${port}\r\nUpgrade: websocket\r\nConnection: Upgrade\r\n` +
        `Sec-WebSocket-Key: ${key}\r\nSec-WebSocket-Version: 13\r\n\r\n`,
    );
  });

  sock.on('data', (chunk) => {
    if (!upgraded) {
      pending += chunk.toString('utf8');
      const h = pending.indexOf('\r\n\r\n');
      if (h < 0) return;
      const head = pending.slice(0, h);
      const accept = /sec-websocket-accept:\s*(\S+)/i.exec(head);
      if (!/^HTTP\/1\.1 101/i.test(head)) fail(`handshake status: ${head.split('\r\n')[0]}`);
      if (!accept || accept[1] !== expectedAccept) fail(`bad Sec-WebSocket-Accept: ${accept ? accept[1] : 'missing'}`);
      process.stdout.write('ws: handshake ok\n');
      // 握手响应之后可能已经带着帧（同一 chunk）。
      const rest = pending.slice(h + 4);
      upgraded = true;
      pending = '';
      buf = Buffer.from(rest, 'utf8');
      drain();
      nextRequest();
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
      if (f.opcode === 0x8) {
        done = true;
        if (got !== cdpRequests.length) fail(`closed after ${got}/${cdpRequests.length} responses`);
        process.stdout.write('ws: close ok\n');
        sock.end();
        process.exit(0);
      }
      if (f.opcode === 0x9) {
        sock.write(encodeFrame(0xa, f.payload));
        process.stdout.write('ws: ping/pong ok\n');
        continue;
      }
      if (f.opcode === 0x1) {
        const text = f.payload.toString('utf8');
        let parsed;
        try {
          parsed = JSON.parse(text);
        } catch (e) {
          fail(`bad JSON in text frame: ${text.slice(0, 120)}`);
        }
        handleResponse(parsed, got);
        got += 1;
        nextRequest();
      }
    }
  }

  function handleResponse(v, idx) {
    if (v.error) fail(`${cdpRequests[idx].method} -> JSON-RPC error ${v.error.code}: ${v.error.message}`);
    if (cdpRequests[idx].method === 'Profiler.stop') {
      const p = v.result && v.result.profile;
      if (!p || !Array.isArray(p.nodes) || p.nodes.length === 0) fail('Profiler.stop: empty profile.nodes');
      if (captureDir) fs.writeFileSync(`${captureDir}/ws-profile.json`, JSON.stringify(p));
      process.stdout.write(`ws: Profiler.stop nodes=${p.nodes.length} samples=${p.samples.length}\n`);
    } else {
      process.stdout.write(`ws: ${cdpRequests[idx].method} ok\n`);
    }
  }

  sock.on('error', (e) => fail(e.message));
}

main().catch((e) => fail(e.message));
