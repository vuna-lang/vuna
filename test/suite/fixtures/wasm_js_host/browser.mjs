// headless Chromium 冒烟：用 Playwright 驱动真实浏览器，实例化产物并跑 `_start`。
//
// 用法：node browser.mjs <main.wasm> [--expect STDOUT]
//   环境：
//     VUNA_PLAYWRIGHT  playwright-core 包目录（含 index.mjs）
//     VUNA_CHROMIUM    可选：浏览器可执行文件（不给时交给 Playwright 解析）
//
// 只覆盖 console 一类：宿主对象用 host.mjs（去掉 `export ` 后注入页面），文件系统用 trap
// 适配器（这条冒烟不碰 fs）。Playwright 负责启动/清理（含 Crashpad 与 dev-shm 处理）。

import { readFileSync } from "node:fs";
import { join } from "node:path";
import { pathToFileURL } from "node:url";

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

const pwDir = process.env.VUNA_PLAYWRIGHT;
if (!pwDir) {
  console.error("SKIP VUNA_PLAYWRIGHT not set");
  process.exit(0);
}

const here = new URL(".", import.meta.url).pathname;
const wasmB64 = readFileSync(wasmPath).toString("base64");
const hostSrc = readFileSync(join(here, "../../../../wasm-host/host.mjs"), "utf8").replace(/^export /gm, "");

const pw = await import(pathToFileURL(join(pwDir, "index.mjs")).href);
const launchOpts = {
  headless: true,
  args: ["--no-sandbox", "--disable-dev-shm-usage", "--disable-gpu"],
};
if (process.env.VUNA_CHROMIUM) launchOpts.executablePath = process.env.VUNA_CHROMIUM;

const browser = await pw.chromium.launch(launchOpts);
let failed = false;
try {
  const page = await browser.newPage();
  await page.addScriptTag({ content: hostSrc });
  const got = await page.evaluate(async (b64) => {
    const wasm = Uint8Array.from(atob(b64), (c) => c.charCodeAt(0));
    const chunks = { 1: [], 2: [] };
    const trap = () => {
      const e = new Error("not supported in browser smoke");
      e.code = "ENOTSUP";
      throw e;
    };
    const fsStub = {
      stat: trap,
      mkdir: trap,
      rmdir: trap,
      unlink: trap,
      rename: trap,
      truncate: trap,
      createEmpty: trap,
      readFile: trap,
      writeFile: trap,
      listDir: trap,
    };
    const host = createHost({
      rootDir: "/",
      env: {},
      args: [],
      fs: fsStub,
      sink: (fd, chunk) => {
        if (chunks[fd]) chunks[fd].push(chunk);
      },
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
      for (const c of list) {
        out.set(c, at);
        at += c.length;
      }
      return new TextDecoder().decode(out);
    };
    result.stdout = join(chunks[1]);
    result.stderr = join(chunks[2]);
    return result;
  }, wasmB64);

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
  if (!failed) console.log(`ok   browser(stdout=${JSON.stringify(got.stdout)}, exit=${got.exit})`);
} finally {
  await browser.close();
}
process.exit(failed ? 1 : 0);