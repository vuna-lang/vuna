#!/usr/bin/env node
// test/corpus/obs-cdp/cdp-client.mjs —— `vuna obs serve --cdp` 的最小 Content-Length JSON-RPC 客户端。
//
// 用法：node test/corpus/obs-cdp/cdp-client.mjs <ADDR> <requests.json> [CAPTURE_DIR]
//   ADDR = tcp:127.0.0.1:PORT | unix:PATH（与 `vuna obs serve --cdp` 的地址语法一致）
//   requests.json = `[{"method":"...","params":{...}}, ...]`，按顺序在同一连接上发；
//   CAPTURE_DIR 给定时，把每个响应的 `result.profile`（若有）落成 `frame-<N>.json`，
//   供调用方 `cmp`（确定性断言）。
//
// 输出每个响应一行摘要：`#<N> result=...` / `#<N> error code=<c> message=<...>`；
// 退出码：0 = 全部请求都收到响应，2 = 连接/协议失败，3 = 参数错误。
//
// 为什么是 Node：`vuna repl --client` 一次调用只发一帧，而 `Profiler.stop` 必须在
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

const sock = connect(addr);
const bodies = [];
let buf = '';
let finished = false;

function finish(code) {
  if (finished) return;
  finished = true;
  sock.end();
  process.exit(code);
}

sock.on('data', (chunk) => {
  buf += chunk.toString('utf8');
  for (;;) {
    const h = buf.indexOf('\r\n\r\n');
    if (h < 0) return;
    const m = /content-length:\s*(\d+)/i.exec(buf.slice(0, h));
    if (!m) {
      buf = buf.slice(h + 4);
      continue;
    }
    const len = Number(m[1]);
    if (buf.length < h + 4 + len) return;
    const body = buf.slice(h + 4, h + 4 + len);
    buf = buf.slice(h + 4 + len);
    bodies.push(body);
    if (bodies.length === requests.length) done(bodies);
  }
});

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

sock.on('connect', () => {
  requests.forEach((r, i) => {
    const body = JSON.stringify({ jsonrpc: '2.0', id: i + 1, method: r.method, params: r.params || {} });
    const bytes = Buffer.from(body, 'utf8').length;
    sock.write(`Content-Length: ${bytes}\r\n\r\n${body}`);
  });
});

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
