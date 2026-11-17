// 测试用 wasm loader：在 Node（V8）上跑 `main.wasm`，宿主层见 host.mjs。
//
// 用法：node run.mjs <main.wasm> [--dir ROOT] [--env K=V]... [--arg S]...
//   --dir    fd 3 的 preopen 根（默认 cwd）
//   --env    传给 guest 的环境变量（默认空）
//   --arg    传给 guest 的 argv（默认空）
//
// 退出码：guest `proc_exit(n)` → n；引擎 trap → 2（文本写 stderr，不参与跨宿主比对）。
// stdout/stderr 按到达顺序直接写进程流，与 Wasmtime 下合并流的读法一致。

import fs from "node:fs";
import { createHost, ExitError } from "./host.mjs";
import { createNodeFs } from "./fs-node.mjs";

const argv = process.argv.slice(2);
let wasmPath = null;
let rootDir = process.cwd();
const env = {};
const args = [];

for (let i = 0; i < argv.length; i++) {
  const a = argv[i];
  if (a === "--dir") rootDir = argv[++i];
  else if (a === "--env") {
    const kv = argv[++i] ?? "";
    const eq = kv.indexOf("=");
    if (eq > 0) env[kv.slice(0, eq)] = kv.slice(eq + 1);
  } else if (a === "--arg") args.push(argv[++i] ?? "");
  else if (a.startsWith("-")) {
    process.stderr.write(`error: unknown option ${a}\n`);
    process.exit(2);
  } else if (wasmPath === null) wasmPath = a;
  else {
    process.stderr.write(`error: unexpected argument ${a}\n`);
    process.exit(2);
  }
}

if (wasmPath === null) {
  process.stderr.write("usage: node run.mjs <main.wasm> [--dir ROOT] [--env K=V] [--arg S]\n");
  process.exit(2);
}

const host = createHost({
  rootDir,
  env,
  args,
  fs: createNodeFs(),
  sink: (fd, chunk) => {
    if (fd === 2) process.stderr.write(chunk);
    else process.stdout.write(chunk);
  },
});

let instance;
try {
  const module = new WebAssembly.Module(fs.readFileSync(wasmPath));
  instance = new WebAssembly.Instance(module, host.imports);
} catch (e) {
  process.stderr.write(`error: wasm instantiate: ${e.message}\n`);
  process.exit(2);
}

host.attach(instance.exports.memory);

try {
  instance.exports._start();
} catch (e) {
  if (e instanceof ExitError) process.exitCode = e.exitCode;
  else {
    process.stderr.write(`error: wasm trap: ${e.message}\n`);
    process.exitCode = 2;
  }
}