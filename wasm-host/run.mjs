// wasm 产物的 Node（V8）loader：`vuna run --target wasm`、suite 的 wasm 矩阵与 bench 共用，
// 宿主层见 host.mjs。
//
// 用法：node run.mjs <main.wasm> [--dir ROOT] [--env K=V]... [--arg S]...
//   --dir    fd 3 的 preopen 根（默认 cwd）
//   --env    传给 guest 的环境变量（默认空）
//   --arg    传给 guest 的 argv（默认空）
//
// 退出码：guest `proc_exit(n)` → n；引擎 trap → 2（文本写 stderr，不参与断言）。
// stdout/stderr 按到达顺序直接写进程流（单一 sink）。

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
let readMs = 0;
let compileMs = 0;
let instantiateMs = 0;
try {
  const t0 = performance.now();
  const bytes = fs.readFileSync(wasmPath);
  readMs = performance.now() - t0;
  const t1 = performance.now();
  const module = new WebAssembly.Module(bytes);
  compileMs = performance.now() - t1;
  const t2 = performance.now();
  instance = new WebAssembly.Instance(module, host.imports);
  instantiateMs = performance.now() - t2;
} catch (e) {
  process.stderr.write(`error: wasm instantiate: ${e.message}\n`);
  process.exit(2);
}

host.attach(instance.exports.memory);

const startT0 = performance.now();
try {
  instance.exports._start();
} catch (e) {
  if (e instanceof ExitError) process.exitCode = e.exitCode;
  else {
    process.stderr.write(`error: wasm trap: ${e.message}\n`);
    process.exitCode = 2;
  }
}
const startMs = performance.now() - startT0;

// bench 用：退出时报告线性内存大小与启动四段耗时（与 OCaml/native 的峰值口径分开记录）。
// 四段之和约等于 `_start` 之外的固定成本：读文件（含 OS 缓存）/ 模块编译 / 实例化 / 程序本体。
if (process.env.VN_PERF_STATS === "1") {
  const mem = instance.exports.memory;
  const bytes = mem && mem.buffer ? mem.buffer.byteLength : 0;
  const ms = (v) => v.toFixed(3);
  process.stderr.write(
    `VN_PERF_WASM memory_bytes=${bytes} read_ms=${ms(readMs)} compile_ms=${ms(compileMs)} ` +
      `instantiate_ms=${ms(instantiateMs)} start_ms=${ms(startMs)}\n`,
  );
}