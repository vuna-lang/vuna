// host.mjs 文件系统适配器的 Node 实现：fd 3 的 preopen 根直接映射到 node fs。
//
// 失败语义交给 node 的 `code`（ENOENT / EEXIST / ENOTDIR / EISDIR / ENOTEMPTY …），
// host.mjs 只做 errno 映射。

import fs from "node:fs";

export function createNodeFs() {
  const wired = (fn) => (...args) => {
    try {
      return fn(...args);
    } catch (e) {
      if (e && typeof e === "object" && e.code) throw e;
      const err = new Error(e && e.message ? e.message : String(e));
      err.code = "EIO";
      throw err;
    }
  };

  const listDir = (abs) => {
    const items = fs.readdirSync(abs, { withFileTypes: true });
    items.sort((a, b) => (a.name < b.name ? -1 : a.name > b.name ? 1 : 0));
    return items.map((d) => ({ name: d.name, type: d.isDirectory() ? 3 : 4 }));
  };

  return {
    stat: (abs) => {
      const st = fs.statSync(abs);
      return { isDirectory: () => st.isDirectory(), size: st.size };
    },
    mkdir: wired((abs) => fs.mkdirSync(abs)),
    rmdir: wired((abs) => fs.rmdirSync(abs)),
    unlink: wired((abs) => fs.unlinkSync(abs)),
    rename: wired((a, b) => fs.renameSync(a, b)),
    truncate: wired((abs) => fs.truncateSync(abs, 0)),
    createEmpty: wired((abs) => fs.writeFileSync(abs, new Uint8Array(0))),
    readFile: (abs) => new Uint8Array(fs.readFileSync(abs)),
    writeFile: wired((abs, bytes) => fs.writeFileSync(abs, bytes)),
    listDir: wired(listDir),
  };
}