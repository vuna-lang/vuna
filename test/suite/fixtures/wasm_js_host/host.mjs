// 测试用 WASI preview1 宿主（Node / 浏览器通用，单文件、无 import 依赖）。
//
// 契约见 docs/reference/wasm.md §5 与 §8.6：只实现产物 import 的那组函数，errno 用
// WASI preview1 的数值（guest 侧 `$rt_errno` 再映射成 1..6 / 9）；fd 3 是唯一的 preopen
// 根，guest 传来的路径已去掉前导 `/`；未实现的操作显式失败，不伪造结果。
//
// 文件系统经 `fs` 适配器注入（node fs / 内存 FS 同一接口）：
//   stat(abs) -> { isDirectory(): Bool, size: Int }   失败抛带 `code` 的错误
//   mkdir / rmdir / unlink / rename(a, b) / truncate(abs) / createEmpty(abs)
//   readFile(abs) -> Uint8Array
//   writeFile(abs, bytes)
//   listDir(abs) -> Array<{ name: String, type: 3|4 }>
//
// 用法：
//   const host = createHost({ rootDir, env, args, fs, sink });
//   const { instance } = await WebAssembly.instantiate(module, host.imports);
//   host.attach(instance.exports.memory);
//   instance.exports._start();

const ERRNO = {
  SUCCESS: 0,
  ACCES: 2,
  BADF: 8,
  NODEV: 19,
  EXIST: 20,
  FBIG: 22,
  INVAL: 28,
  IO: 29,
  ISDIR: 31,
  NOENT: 44,
  NOSPC: 51,
  NOTDIR: 54,
  NOTEMPTY: 55,
  NOTSUP: 58,
  PERM: 63,
  NFILES: 41,
};

export const FILETYPE = { DIR: 3, FILE: 4 };

// | 退出请求：guest 调 `proc_exit` 抛这个，由 loader 转成退出码。
export class ExitError extends Error {
  constructor(code) {
    super(`exit ${code}`);
    this.exitCode = code;
  }
}

export function createHost({ rootDir, env = {}, args = [], fs, sink }) {
  // fd 表：0 = stdin（恒 EOF），1/2 = stdout/stderr，3 = preopen 根，4+ = 打开的文件/目录。
  const open = new Map();
  let memory = null;

  const view = () => new DataView(memory.buffer);
  const bytes = () => new Uint8Array(memory.buffer);
  const readBytes = (ptr, len) => bytes().slice(ptr, ptr + len);
  const readStr = (ptr, len) => new TextDecoder().decode(readBytes(ptr, len));
  const enc = new TextEncoder();

  const errnoOf = (e) => {
    switch (e && e.code) {
      case "ENOENT":
        return ERRNO.NOENT;
      case "EACCES":
        return ERRNO.ACCES;
      case "EPERM":
        return ERRNO.PERM;
      case "EEXIST":
        return ERRNO.EXIST;
      case "ENOTDIR":
        return ERRNO.NOTDIR;
      case "EISDIR":
        return ERRNO.ISDIR;
      case "ENOTEMPTY":
        return ERRNO.NOTEMPTY;
      case "ENOSPC":
        return ERRNO.NOSPC;
      case "EINVAL":
        return ERRNO.INVAL;
      case "ENOTSUP":
      case "ENOSYS":
        return ERRNO.NOTSUP;
      default:
        return ERRNO.IO;
    }
  };

  // | 路径必须落在 root 之内；`..` 逃逸按访问拒绝处理。
  const normalizeInside = (abs) => {
    const r = rootDir.endsWith("/") ? rootDir.slice(0, -1) : rootDir;
    if (abs === r) return r;
    if (!abs.startsWith(`${r}/`)) return null;
    if (abs.split("/").includes("..")) return null;
    return abs;
  };

  const resolve = (dirfd, ptr, len) => {
    let rel = readStr(ptr, len);
    if (rel.startsWith("/")) rel = rel.slice(1);
    const base = dirfd === 3 ? rootDir : open.get(dirfd)?.absPath;
    if (base === undefined) return { errno: ERRNO.BADF };
    const norm = normalizeInside(rel === "" ? base : `${base}/${rel}`);
    if (norm === null) return { errno: ERRNO.ACCES };
    return { abs: norm };
  };

  const allocFd = (entry) => {
    for (let fd = 4; fd < 4096; fd++) {
      if (!open.has(fd)) {
        open.set(fd, entry);
        return fd;
      }
    }
    return -1;
  };

  const statInto = (bufPtr, st) => {
    const dv = view();
    dv.setBigUint64(bufPtr + 0, 0n, true); // dev
    dv.setBigUint64(bufPtr + 8, 0n, true); // ino
    dv.setUint8(bufPtr + 16, st.isDirectory() ? FILETYPE.DIR : FILETYPE.FILE);
    dv.setBigUint64(bufPtr + 24, 1n, true); // nlink
    dv.setBigUint64(bufPtr + 32, BigInt(st.isDirectory() ? 0 : st.size), true);
    dv.setBigUint64(bufPtr + 40, 0n, true); // atim
    dv.setBigUint64(bufPtr + 48, 0n, true); // mtim
    dv.setBigUint64(bufPtr + 56, 0n, true); // ctim
  };

  const writeStringArray = (list, arrPtr, bufPtr) => {
    const dv = view();
    let at = bufPtr;
    for (let i = 0; i < list.length; i++) {
      const encoded = enc.encode(list[i]);
      dv.setUint32(arrPtr + i * 4, at, true);
      bytes().set(encoded, at);
      bytes()[at + encoded.length] = 0;
      at += encoded.length + 1;
    }
  };

  // | 写进打开的文件：容量不足时按需翻倍，`pos` 前进，`size` 取最大值。
  const writeInto = (entry, ptr, len) => {
    const need = entry.pos + len;
    if (need > entry.data.length) {
      let cap = entry.data.length === 0 ? 64 : entry.data.length;
      while (cap < need) cap *= 2;
      const grown = new Uint8Array(cap);
      grown.set(entry.data.subarray(0, entry.size));
      entry.data = grown;
    }
    entry.data.set(readBytes(ptr, len), entry.pos);
    entry.pos = need;
    if (need > entry.size) entry.size = need;
    entry.dirty = true;
  };

  const imports = {
    wasi_snapshot_preview1: {
      fd_write: (fd, iovsPtr, iovsLen, nwrittenPtr) => {
        const entry = fd === 1 || fd === 2 ? null : open.get(fd);
        if (entry === undefined) return ERRNO.BADF;
        if (entry !== null && entry.kind === "dir") return ERRNO.ISDIR;
        let total = 0;
        for (let i = 0; i < iovsLen; i++) {
          const ptr = view().getUint32(iovsPtr + i * 8, true);
          const len = view().getUint32(iovsPtr + i * 8 + 4, true);
          if (len === 0) continue;
          if (entry === null) sink(fd, readBytes(ptr, len));
          else writeInto(entry, ptr, len);
          total += len;
        }
        view().setUint32(nwrittenPtr, total, true);
        return ERRNO.SUCCESS;
      },
      fd_read: (fd, iovsPtr, iovsLen, nreadPtr) => {
        if (fd === 0) {
          view().setUint32(nreadPtr, 0, true);
          return ERRNO.SUCCESS;
        }
        const entry = open.get(fd);
        if (entry === undefined) return ERRNO.BADF;
        if (entry.kind === "dir") return ERRNO.ISDIR;
        let total = 0;
        for (let i = 0; i < iovsLen; i++) {
          const ptr = view().getUint32(iovsPtr + i * 8, true);
          const len = view().getUint32(iovsPtr + i * 8 + 4, true);
          if (len === 0) continue;
          const n = Math.min(len, Math.max(0, entry.size - entry.pos));
          if (n > 0) {
            bytes().set(entry.data.subarray(entry.pos, entry.pos + n), ptr);
            entry.pos += n;
            total += n;
          }
          if (entry.pos >= entry.size) break;
        }
        view().setUint32(nreadPtr, total, true);
        return ERRNO.SUCCESS;
      },
      fd_close: (fd) => {
        if (fd === 0 || fd === 1 || fd === 2) return ERRNO.SUCCESS;
        const entry = open.get(fd);
        if (entry === undefined) return ERRNO.BADF;
        if (entry.kind === "file" && entry.dirty) {
          try {
            fs.writeFile(entry.absPath, entry.data.subarray(0, entry.size));
          } catch (e) {
            return errnoOf(e);
          }
        }
        open.delete(fd);
        return ERRNO.SUCCESS;
      },
      path_open: (dirfd, _dirflags, pathPtr, pathLen, oflags, _rightsBase, _rightsInh, _fdflags, openedPtr) => {
        const r = resolve(dirfd, pathPtr, pathLen);
        if (r.errno !== undefined) return r.errno;
        const wantDir = (oflags & 2) !== 0;
        const create = (oflags & 1) !== 0;
        const excl = (oflags & 4) !== 0;
        const trunc = (oflags & 8) !== 0;
        let st = null;
        try {
          st = fs.stat(r.abs);
        } catch (e) {
          if (!create) return errnoOf(e);
        }
        if (st !== null && excl) return ERRNO.EXIST;
        if (st !== null && wantDir !== st.isDirectory()) return st.isDirectory() ? ERRNO.ISDIR : ERRNO.NOTDIR;
        try {
          if (st === null) {
            if (wantDir) fs.mkdir(r.abs);
            else if (trunc) fs.createEmpty(r.abs);
            else fs.createEmpty(r.abs);
          } else if (!st.isDirectory() && trunc) {
            fs.truncate(r.abs);
          }
        } catch (e) {
          return errnoOf(e);
        }
        let fd;
        if (wantDir) {
          fd = allocFd({ kind: "dir", absPath: r.abs, entries: null });
        } else {
          try {
            st = fs.stat(r.abs);
            fd = allocFd({ kind: "file", absPath: r.abs, data: fs.readFile(r.abs), size: st.size, pos: 0 });
          } catch (e) {
            return errnoOf(e);
          }
        }
        if (fd < 0) return ERRNO.NFILES;
        view().setUint32(openedPtr, fd, true);
        return ERRNO.SUCCESS;
      },
      path_filestat_get: (dirfd, _flags, pathPtr, pathLen, bufPtr) => {
        const r = resolve(dirfd, pathPtr, pathLen);
        if (r.errno !== undefined) return r.errno;
        try {
          statInto(bufPtr, fs.stat(r.abs));
          return ERRNO.SUCCESS;
        } catch (e) {
          return errnoOf(e);
        }
      },
      path_create_directory: (dirfd, pathPtr, pathLen) => {
        const r = resolve(dirfd, pathPtr, pathLen);
        if (r.errno !== undefined) return r.errno;
        try {
          fs.mkdir(r.abs);
          return ERRNO.SUCCESS;
        } catch (e) {
          return errnoOf(e);
        }
      },
      path_remove_directory: (dirfd, pathPtr, pathLen) => {
        const r = resolve(dirfd, pathPtr, pathLen);
        if (r.errno !== undefined) return r.errno;
        try {
          fs.rmdir(r.abs);
          return ERRNO.SUCCESS;
        } catch (e) {
          return errnoOf(e);
        }
      },
      path_unlink_file: (dirfd, pathPtr, pathLen) => {
        const r = resolve(dirfd, pathPtr, pathLen);
        if (r.errno !== undefined) return r.errno;
        try {
          if (fs.stat(r.abs).isDirectory()) return ERRNO.ISDIR;
          fs.unlink(r.abs);
          return ERRNO.SUCCESS;
        } catch (e) {
          return errnoOf(e);
        }
      },
      path_rename: (oldDirfd, oldPtr, oldLen, newDirfd, newPtr, newLen) => {
        const a = resolve(oldDirfd, oldPtr, oldLen);
        if (a.errno !== undefined) return a.errno;
        const b = resolve(newDirfd, newPtr, newLen);
        if (b.errno !== undefined) return b.errno;
        try {
          fs.rename(a.abs, b.abs);
          return ERRNO.SUCCESS;
        } catch (e) {
          return errnoOf(e);
        }
      },
      fd_readdir: (fd, bufPtr, bufLen, cookie, bufusedPtr) => {
        const entry = open.get(fd);
        if (entry === undefined) return ERRNO.BADF;
        if (entry.kind !== "dir") return ERRNO.NOTDIR;
        if (entry.entries === null) {
          try {
            entry.entries = fs.listDir(entry.absPath);
          } catch (e) {
            return errnoOf(e);
          }
        }
        const dv = view();
        let used = 0;
        let i = Number(cookie);
        while (i < entry.entries.length) {
          const item = entry.entries[i];
          const nameBytes = enc.encode(item.name);
          const need = 24 + nameBytes.length;
          if (used + need > bufLen) break;
          const at = bufPtr + used;
          dv.setBigUint64(at + 0, BigInt(i + 1), true); // d_next：下一次的 cookie
          dv.setBigUint64(at + 8, BigInt(i + 1), true); // d_ino
          dv.setUint32(at + 16, nameBytes.length, true);
          dv.setUint8(at + 20, item.type);
          bytes().set(nameBytes, at + 24);
          used += need;
          i += 1;
        }
        dv.setUint32(bufusedPtr, used, true);
        return ERRNO.SUCCESS;
      },
      environ_sizes_get: (countPtr, sizePtr) => {
        const pairs = envPairs(env);
        view().setUint32(countPtr, pairs.length, true);
        view().setUint32(sizePtr, pairs.reduce((n, s) => n + enc.encode(s).length + 1, 0), true);
        return ERRNO.SUCCESS;
      },
      environ_get: (arrPtr, bufPtr) => {
        writeStringArray(envPairs(env), arrPtr, bufPtr);
        return ERRNO.SUCCESS;
      },
      args_sizes_get: (countPtr, sizePtr) => {
        view().setUint32(countPtr, args.length, true);
        view().setUint32(sizePtr, args.reduce((n, s) => n + enc.encode(s).length + 1, 0), true);
        return ERRNO.SUCCESS;
      },
      args_get: (arrPtr, bufPtr) => {
        writeStringArray(args, arrPtr, bufPtr);
        return ERRNO.SUCCESS;
      },
      clock_time_get: (id, _precision, outPtr) => {
        // 0 = realtime，1 = monotonic；其余 id 不支持。
        let ns;
        if (id === 0) ns = BigInt(Date.now()) * 1000000n;
        else if (id === 1) ns = BigInt(Math.round(performance.now() * 1e6));
        else return ERRNO.NOTSUP;
        view().setBigUint64(outPtr, ns, true);
        return ERRNO.SUCCESS;
      },
      proc_exit: (code) => {
        throw new ExitError(code);
      },
    },
  };

  return {
    imports,
    attach(mem) {
      memory = mem;
    },
  };
}

const envPairs = (env) => Object.keys(env).map((k) => `${k}=${env[k]}`);