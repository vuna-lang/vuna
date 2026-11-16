#!/usr/bin/env python3
"""LSP 请求耗时探针（hover / codeAction / documentSymbol / pull diagnostics）。

用法：
  python3 bench/lsp-probe.py [--bin ./result/bin/vuna] [--file lib/Vuna/Lsp/Query.vuna]
                             [--obs-out /tmp/lsp-obs.jsonl] [--json]

起一个真实的 `vuna lsp` 进程，按 LSP 帧协议发请求并计时。同一请求发两次，用来区分
「冷启动」与「同内容重复请求（记忆化）」。

`--obs-out` 会给子进程设 `VUNA_OBS=1` + `VUNA_OBS_FILE`，之后可用
`vuna obs summarize <file>` 归因（关键事件：`lsp.<method>` 跨度、`vuna.def.elab`
计数、`vuna.lsp.goals.incremental` / `vuna.lsp.goals.full` 标记）。
"""

import argparse
import json
import os
import subprocess
import sys
import time


class Lsp:
    def __init__(self, binary, env):
        self.proc = subprocess.Popen(
            [binary, "lsp"],
            stdin=subprocess.PIPE,
            stdout=subprocess.PIPE,
            stderr=subprocess.DEVNULL,
            env=env,
        )
        self.next_id = 0

    def _send(self, obj):
        body = json.dumps(obj).encode()
        self.proc.stdin.write(b"Content-Length: %d\r\n\r\n" % len(body) + body)
        self.proc.stdin.flush()

    def _read(self):
        header = b""
        while b"\r\n\r\n" not in header:
            ch = self.proc.stdout.read(1)
            if not ch:
                raise RuntimeError("lsp closed stdout")
            header += ch
        length = int(
            [
                line
                for line in header.split(b"\r\n")
                if line.lower().startswith(b"content-length")
            ][0].split(b":")[1]
        )
        return json.loads(self.proc.stdout.read(length))

    def request(self, method, params):
        self.next_id += 1
        rid = self.next_id
        start = time.time()
        self._send({"jsonrpc": "2.0", "id": rid, "method": method, "params": params})
        while True:
            msg = self._read()
            if msg.get("id") == rid:
                return int((time.time() - start) * 1000), msg

    def notify(self, method, params):
        self._send({"jsonrpc": "2.0", "method": method, "params": params})

    def close(self):
        try:
            self._send(
                {"jsonrpc": "2.0", "id": 999999, "method": "shutdown", "params": {}}
            )
            self._send({"jsonrpc": "2.0", "method": "exit"})
            self.proc.wait(timeout=120)
        except Exception:
            self.proc.kill()


def find_line(lines, predicate):
    for i, line in enumerate(lines):
        if predicate(line):
            return i
    return 0


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--bin", default="./result/bin/vuna")
    ap.add_argument("--file", default="lib/Vuna/Lsp/Query.vuna")
    ap.add_argument("--obs-out", default="")
    ap.add_argument("--json", action="store_true")
    args = ap.parse_args()

    path = os.path.abspath(args.file)
    text = open(path, encoding="utf-8").read()
    lines = text.split("\n")
    uri = "file://" + path

    export_line = find_line(lines, lambda l: l.startswith("export "))
    plain_line = find_line(
        lines,
        lambda l: l.strip().startswith("--") and "_" not in l and "?" not in l,
    )
    # 洞：追加一条带洞的定义（只在缓冲里，不写盘）。
    holed = text + "\nprobeHole : Int\nprobeHole = _\n"
    hole_line = len(holed.split("\n")) - 2  # 0-based：`probeHole = _` 那行

    env = dict(os.environ)
    if args.obs_out:
        env["VUNA_OBS"] = os.environ.get("VUNA_OBS", "1")
        env["VUNA_OBS_FILE"] = args.obs_out

    lsp = Lsp(args.bin, env)
    results = {}

    def measure(name, method, params):
        ms, msg = lsp.request(method, params)
        results[name] = {
            "ms": ms,
            "has_result": msg.get("result") not in (None, [], {}),
        }
        return ms

    measure(
        "initialize",
        "initialize",
        {"capabilities": {"textDocument": {"diagnostic": {}}}},
    )
    lsp.notify("initialized", {})
    lsp.notify(
        "textDocument/didOpen",
        {
            "textDocument": {
                "uri": uri,
                "languageId": "vuna",
                "version": 1,
                "text": holed,
            }
        },
    )
    time.sleep(0.2)

    hover_plain = {
        "textDocument": {"uri": uri},
        "position": {"line": plain_line, "character": 2},
    }
    hover_export = {
        "textDocument": {"uri": uri},
        "position": {"line": export_line, "character": 2},
    }
    hover_hole = {
        "textDocument": {"uri": uri},
        "position": {"line": hole_line, "character": 12},
    }

    measure("hover_non_hole", "textDocument/hover", hover_plain)
    measure("hover_non_hole_repeat", "textDocument/hover", hover_plain)
    measure("hover_export_line", "textDocument/hover", hover_export)
    measure("hover_hole", "textDocument/hover", hover_hole)
    measure("hover_hole_repeat", "textDocument/hover", hover_hole)

    # 改一行（新内容 ⇒ 内容缓存失效）再发同样请求：量「会话已热」的增量精化。
    edited = holed + "-- probe edit\n"
    lsp.notify(
        "textDocument/didChange",
        {
            "textDocument": {"uri": uri, "version": 2},
            "contentChanges": [{"text": edited}],
        },
    )
    measure("hover_hole_after_edit", "textDocument/hover", hover_hole)
    measure("hover_hole_after_edit_repeat", "textDocument/hover", hover_hole)

    measure(
        "code_action_quickfix",
        "textDocument/codeAction",
        {
            "textDocument": {"uri": uri},
            "range": {
                "start": {"line": export_line, "character": 0},
                "end": {"line": export_line, "character": 6},
            },
            "context": {"diagnostics": [], "only": ["quickfix"]},
        },
    )
    measure(
        "code_action_quickfix_repeat",
        "textDocument/codeAction",
        {
            "textDocument": {"uri": uri},
            "range": {
                "start": {"line": export_line, "character": 0},
                "end": {"line": export_line, "character": 6},
            },
            "context": {"diagnostics": [], "only": ["quickfix"]},
        },
    )
    measure(
        "document_symbol",
        "textDocument/documentSymbol",
        {"textDocument": {"uri": uri}},
    )
    measure("diagnostic", "textDocument/diagnostic", {"textDocument": {"uri": uri}})
    measure(
        "diagnostic_repeat", "textDocument/diagnostic", {"textDocument": {"uri": uri}}
    )

    # 诊断已经把会话建好（编辑器里 pull 诊断在打开文件时就发生）：此时洞 hover 应走
    # 增量装配。改一行拿到新内容 key，避免命中上面的本地结果缓存。
    edited2 = edited + "-- probe edit 2\n"
    lsp.notify(
        "textDocument/didChange",
        {
            "textDocument": {"uri": uri, "version": 3},
            "contentChanges": [{"text": edited2}],
        },
    )
    measure("hover_hole_warm_session", "textDocument/hover", hover_hole)
    measure("hover_hole_warm_session_repeat", "textDocument/hover", hover_hole)
    lsp.close()

    if args.json:
        print(json.dumps(results, ensure_ascii=False, indent=2))
    else:
        for name, r in results.items():
            print(f"{name:28s} {r['ms']:>8d} ms   result={r['has_result']}")
        if args.obs_out:
            print(f"obs trace: {args.obs_out}")


if __name__ == "__main__":
    sys.exit(main())
