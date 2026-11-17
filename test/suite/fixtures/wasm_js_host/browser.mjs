// headless Chromium 冒烟：在真实页面环境里实例化产物并跑 `_start`（CDP，零依赖）。
//
// 用法：node browser.mjs <main.wasm> [--expect STDOUT]
//   环境：VUNA_CHROMIUM（默认 `chromium`）
//
// 只覆盖 console 一类：宿主对象用 host.mjs（去掉 `export ` 后作为页面脚本注入），
// 文件系统用 trap 适配器（这条冒烟不碰 fs）。缺 Chromium 时打印 SKIP 并 exit 0。

import { spawn } from "node:child_process";
import { mkdtempSync, readFileSync, rmSync } from "node:fs";
import { tmpdir } from "node:os";
import { join } from "node:path";

const argv = process.argv.slice(2);
const wasmPath = argv[0];
let expectStdout = null;
for (let i = 1; i < argv.length; i++) {
  if (argv[i] === "--expect") expectStdout = argv[++i] ?? "";
}
if (!wasmPath) {
  console.error("usage: node browser.mjs <main.wasm> [--expect STDOUT]");
  process.exit(2);
}

const chromium = process.env.VUNA_CHROMIUM || "chromium";
const here = new URL(".", import.meta.url).pathname;
const wasmB64 = readFileSync(wasmPath).toString("base64");
const hostSrc = readFileSync(join(here, "host.mjs"), "utf8").replace(/^export /gm, "");
const profile = mkdtempSync(join(tmpdir(), "vchromium-"));

const extraFlags = (process.env.VUNA_CHROMIUM_FLAGS || "").split(/\s+/).filter(Boolean);
const args = [
  ...extraFlags,
  "--headless=new",
  "--disable-crash-reporter",
  "--disable-breakpad",
  "--no-crash-upload",
  "--no-sandbox",
  "--disable-gpu",
  "--disable-dev-shm-usage",
  "--no-first-run",
  "--no-default-browser-check",
  `--user-data-dir=${profile}`,
  "--remote-debugging-port=0",
  "about:blank",
];

// 构建沙箱里没有可写的 HOME：crashpad 会因此 SIGTRAP，所以显式给一个临时 HOME。
const child = spawn(chromium, args, {
  stdio: ["ignore", "ignore", "pipe"],
  env: { ...process.env, HOME: profile, XDG_RUNTIME_DIR: profile },
});
let stderr = "";
const cleanup = () => {
  try {
    child.kill("SIGKILL");
  } catch {
    /* ignore */
  }
  try {
    rmSync(profile, { recursive: true, force: true });
  } catch {
    /* ignore */
  }
};
process.on("exit", cleanup);

const wsUrl = await new Promise((resolve, reject) => {
  const timer = setTimeout(() => reject(new Error("chromium: DevTools endpoint timeout")), 20000);
  child.stderr.on("data", (buf) => {
    stderr += buf.toString();
    const m = stderr.match(/DevTools listening on (ws:\/\/\S+)/);
    if (m) {
      clearTimeout(timer);
      resolve(m[1]);
    }
  });
  child.on("error", (e) => {
    clearTimeout(timer);
    reject(e);
  });
  child.on("exit", (code, signal) => {
    clearTimeout(timer);
    const tail = stderr.trim().split("\n").slice(-8).join("\n");
    reject(new Error(`chromium exited early (code=${code} signal=${signal})\n${tail}`));
  });
});

const port = new URL(wsUrl).port;
const page = await (await fetch(`http://127.0.0.1:${port}/json/new?about:blank`, { method: "PUT" })).json();
const ws = new WebSocket(page.webSocketDebuggerUrl);
let id = 0;
const pending = new Map();
ws.addEventListener("message", (e) => {
  const msg = JSON.parse(e.data);
  if (msg.id && pending.has(msg.id)) {
    pending.get(msg.id)(msg);
    pending.delete(msg.id);
  }
});
await new Promise((resolve) => ws.addEventListener("open", resolve));
const send = (method, params) =>
  new Promise((resolve) => {
    const my = ++id;
    pending.set(my, resolve);
    ws.send(JSON.stringify({ id: my, method, params }));
  });
await send("Runtime.enable");

const driver = `(async () => {
  const enc = new TextEncoder();
  const dec = new TextDecoder();
  const wasm = Uint8Array.from(atob(${JSON.stringify(wasmB64)}), (c) => c.charCodeAt(0));
  const chunks = { 1: [], 2: [] };
  const trap = () => { const e = new Error("not supported in browser smoke"); e.code = "ENOTSUP"; throw e; };
  const fsStub = { stat: trap, mkdir: trap, rmdir: trap, unlink: trap, rename: trap,
    truncate: trap, createEmpty: trap, readFile: trap, writeFile: trap, listDir: trap };
  const host = createHost({
    rootDir: "/",
    env: {},
    args: [],
    fs: fsStub,
    sink: (fd, chunk) => { if (chunks[fd]) chunks[fd].push(chunk); },
  });
  const result = { stdout: "", stderr: "", exit: 0, error: null };
  try {
    const { instance } = await WebAssembly.instantiate(wasm, host.imports);
    host.attach(instance.exports.memory);
    instance.exports._start();
  } catch (e) {
    if (e && typeof e.exitCode === "number") result.exit = e.exitCode;
    else result.error = String((e && e.message) || e);
  }
  const join = (list) => {
    let total = 0;
    for (const c of list) total += c.length;
    const out = new Uint8Array(total);
    let at = 0;
    for (const c of list) { out.set(c, at); at += c.length; }
    return dec.decode(out);
  };
  result.stdout = join(chunks[1]);
  result.stderr = join(chunks[2]);
  return JSON.stringify(result);
})()`;

const evaluated = await send("Runtime.evaluate", {
  expression: `${hostSrc}\n;${driver}`,
  awaitPromise: true,
  returnByValue: true,
  timeout: 30000,
});
const raw = evaluated.result?.result?.value;
if (typeof raw !== "string") {
  console.error(`FAIL browser: no result (${JSON.stringify(evaluated.result?.exceptionDetails ?? evaluated).slice(0, 400)})`);
  process.exit(1);
}
const got = JSON.parse(raw);
let failed = false;
if (got.error) {
  console.error(`FAIL browser: wasm error: ${got.error}`);
  failed = true;
}
if (got.exit !== 0) {
  console.error(`FAIL browser: exit ${got.exit}`);
  failed = true;
}
if (expectStdout !== null && got.stdout !== expectStdout) {
  console.error(`FAIL browser: stdout ${JSON.stringify(got.stdout)} != ${JSON.stringify(expectStdout)}`);
  failed = true;
}
ws.close();
if (failed) process.exit(1);
console.log(`ok   browser(stdout=${JSON.stringify(got.stdout)}, exit=${got.exit})`);