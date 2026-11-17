// 引擎探针：报告给定 .wasm 在当前引擎上的 validate / compile 结果。
//
// 用法：node [--experimental-wasm-wasmfx] --no-warnings probe.mjs <file.wasm>...
// 输出每行 `probe <path>: validate=<bool> compile=<ok|error>`，编译失败时附原因。
// 只报告事实，不做断言；判定在 probe.sh 里（断言口径固定为「默认配置拒绝」）。

import fs from "node:fs";

for (const file of process.argv.slice(2)) {
  const bytes = fs.readFileSync(file);
  const validated = WebAssembly.validate(bytes);
  let compile = "ok";
  let reason = "";
  try {
    new WebAssembly.Module(bytes);
  } catch (e) {
    compile = "error";
    reason = String(e && e.message ? e.message : e).split("\n")[0];
  }
  const tail = reason === "" ? "" : ` (${reason})`;
  console.log(`probe ${file}: validate=${validated} compile=${compile}${tail}`);
}