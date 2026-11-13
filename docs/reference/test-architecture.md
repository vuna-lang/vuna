# 测试架构（test-architecture）

本文是测试体系的**设计页**：测试如何消费输入寻址对象库（`cache.md`）、为什么默认共享
一个 store、哪些用例必须隔离，以及后续的 verdict/视图/调度演进方向。操作口径与
commands 在 [testing.md](testing.md)；对象库本身见 [cache.md](cache.md)。

## 1. 问题：测试是最后一个自建缓存的大消费者

对象库已经是仓库唯一的缓存形态（输入寻址、存在即命中、删除只影响命中率、roots + GC）。
但 test runner 曾经给**每个 worker、每个 steps case** 新建一个 `VUNA_STORE`，另外还维护
私有的 `.local/test-cache` 结果缓存与 `set-*` 构建桶。后果：

- 每个 worker 各跑一次 `vuna check base`（冷 store 约 7 s）；16 个 worker ≈ 16 倍；
- 每个 steps case 内的几十次 `check/compile` 都从冷 store 开始；
- 同一个夹具空 store 编译 2.9–5.5 s，暖 store 只要 7 ms（2026-11-13 本机 16 核实测）；
- section 90（74 个 steps）单段 375 s，最慢 case 276 s；全量 suite 超过 10 分钟。

结论：先让测试成为对象库的普通客户端，再谈调度；否则优化的是冷启动重复劳动的分布。

## 2. 目标形态：Test-as-Store-Client

```text
                    .local/store（唯一根；VUNA_STORE 可覆盖）
   objects/iface|header|lex|order|check|tool|test
   blobs/<splitIn>   units/<pkg>   views/bin/<splitIn>   roots/<project>
                              ▲
        ┌─────────────────────┴──────────────────────┐
        │ test scheduler：父进程解析 store、预热一次  │
        │ worker/case 共享；仅 tagged case 隔离      │
        └───────┬───────────────────────┬────────────┘
                │                       │
   golden/error/check 语义 case      steps 工具/仓库 case
   verdict = objects/test/<testIn>   共享 store；长 case 拆分/并行
   存在 = 通过；roots 保护；GC       只有 store 语义用例用私有 store
```

### 2.1 共享规则

1. **一次 run 一个 store root**：默认项目内 `.local/store`（`nix develop` 的 shellHook、
   `nix run .#vuna-run-tests`、CI check 各自导出；`VUNA_STORE` 可覆盖）。父进程解析一次，
   所有 worker/case 继承同一路径。
2. **父进程只预热一次**：`vuna check base`（需要时 `check .`）；worker 不再各自 warmup。
3. **默认共享，隔离显式**：steps 文件头写 `# store-isolated` 的 case 用 `${caseTmp}/store`；
   其余共享。断言缓存布局、GC、冷命中、只读语义的用例必须隔离。
4. **`--no-cache` 只忽略结果判定**（golden/error 的本地结果缓存），不关闭对象库；
   真正的冷跑用 `--fresh-store`（后续）或显式空 `VUNA_STORE`。

### 2.2 为什么可以共用

- 单文件对象（`objects/iface|header|lex|order|check|split|tool`）是输入寻址 + 原子写：
  同一输入同一路径、同一份字节；日常 `check`/`build` 与测试并发写不会互相覆盖。
- 编译器指纹在 `ver` 输入里：日常 CLI 与测试用不同二进制时地址不同，不会读错。
- 删除对象只会导致重算，不会导致错误；GC 因此是性能问题，不是正确性问题。

### 2.3 并发边界（`cache.md` 的补充）

| 位置 | 现状 | 影响 | 计划 |
| --- | --- | --- | --- |
| `roots/<project>` | 读-改-写，无锁 | 并发追加可能丢行；只影响 GC（重算） | P1 改追加式/合并 |
| `views/bin/<splitIn>` | `buildOne` 直接写视图；`storeScratchClaimEff` 尚无调用者 | 日常 build 与测试同时构建同一包时没有互斥保证 | P1 切 scratch claim/publish；测试侧先 `--out`/隔离 |
| `units/<pkg>` | 写原子，按 entry 桶 GC | 并发不同 entry 会互相驱逐（变慢） | P1 缩小 GC 范围 |
| warning | 命中跳过精化，警告不持久化 | 断言 warning 的 case 可能假通过 | 走 `-W`/`--deny-warnings` 或隔离 |

## 3. 用例分层与预算

| tier | 内容 | 目标 | 触发 |
| --- | --- | --- | --- |
| `fast` | 进程内 check/interp 语义、诊断、term | < 10 s | 每次保存 / commit |
| `integration` | compile+run golden、CLI/lint/fix、模块/包 | < 30 s | PR / pre-push |
| `e2e` | `check .`、LSP/REPL、workspace/build、seed | < 60 s | 合并前 / nightly |
| `perf` | growth/metrics/bench | 独立机器 | nightly |

tier 过滤已落地：`--tier fast|integration|e2e`（可重复）；`*.steps` 归 `e2e`，
seed/runtime 归 `integration`，golden/error/lint/fix/check 归 `fast`。

调度（P1，未落地）：父进程按历史 `costs.tsv` + kind 权重做 LPT 分桶；worker 保留
`--worker i/N` 协议。步骤内长脚本按独立断言组拆分；每 case 一个总预算，而不是每命令
300 s。

> 实测（2026-11-13）：只做“按 costs 降序 + 静态轮转”会把 44e/44g/44l2 等**冷隔离**
> 长 case 同时压到多个 worker，全量反而 215 s（原静态顺序 144 s）。LPT 必须先有 tier
> 与 cold-heavy 并发上限，不能只排序；当前保留静态分片。

## 4. 结果判定：verdict 对象（P1）

- `objects/test/<testIn>`，`testIn = addrOf ["test", caseId, kind, srcHash, expectedHash,
  compilerFp, depsHash, toolHash]`；存在 = 上次通过。
- 只缓存输入可声明的 golden/error/check；steps 先共享 store 但不缓存。
- 通过后写对象并 `storeRootAppendEff` 登记；`vuna store gc` 直接复用。
- 删除私有 `.local/test-cache/*.cache`（其 key 含 mtime/size，内容不变也会 miss）。

## 5. 产物：走 store 视图（P1）

- `views/bin/<splitIn>` / `units/` 替代 `buildCacheDir` + `syncBuildDir` + `cp -a`。
- 先把 build 视图切到 `storeScratchClaimEff`/`storeViewPublishEff`，再让测试共享视图；
  在那之前，测试对 repo 包的 build 用 `--out` 私有目录或 `store-isolated`。
- **验收**：compile+run 的 build 复用；不再复制整棵 base。

## 6. CI（P2）

- build 阶段一次构建 vuna/seed 并预热 store；test 阶段 suite 与 18 个 check 共享只读
  store + 每 check 可写 overlay。
- 取消每个 check 内部 `--jobs auto`：全局 token 池；重 check 串行/分批。
- 去重 `check .`/fmt/package/lint（suite 与 Nix checks 重叠）。
- **验收**：`nix flake check` ≤ 3 min；无 256 路超订。

## 7. 终态（P3，不计成本）

- `vuna test --serve` 常驻 world（每包一个，JSON-RPC），语义 case 进程内；
- 按 family 批量 link（400+ → ~20 次）或 dispatcher 单二进制；
- 效果 handler 测试替身；interp 全量 + codegen 抽样/差分测试；
- 远程/分布式 store 与 CI 缓存。

## 8. 验收与测量

- 同一 store 连续 `check compiler`：第二次 `cache-path=hit`、`iface-write=0/N`、< 100 ms。
- 单 dt golden case：< 2 s；section 90：< 60 s；全量：< 2 min（P0），P1 < 60 s 冷 /
  < 20 s 热。
- 测量必须在静默树上重录，记录 HEAD、CPU、`VUNA_STORE` 是否为空、`--cache-dir`。

## 相关阅读

- 对象库：[cache.md](cache.md)；测试操作口径：[testing.md](testing.md)
- 性能方法与读数：[performance.md](performance.md)
- 终态方向：[../architecture-target.md](../architecture-target.md)
### 长 case：拆分/预热实测（2026-11-13）

- 把 44g（LSP+REPL）与 44l2（LSP 大闭包+REPL）拆成独立 case，fresh e2e 反而
  **88 s**（原单 case ~54 s）：每个拆分都重复冷 `check .` / 冷 REPL 编译。
- 父进程增加一次串行 `check .` 预热后再跑 44e/44g/44l2：wall **177 s**，其中预热本身
  ~80 s；44g 降到 28 s、44l2 降到 9 s，但总账更差。
- 结论：长 case 的根因是**冷编译**，不是断言数量。拆分必须满足“拆分后的子 case 共享
  已预热 store”，预热必须在 worker 内/并发阶段完成，不能串行挡在父进程；cache 断言
  与功能断言也要分开，功能部分才能吃预热 store。
- 再试“父进程后台并发跑 `check compiler` / `check .`，与 worker 重叠”：e2e 变为
  **209 s**，44e 106 s、32_fmt 86 s —— 预热进程与 worker 抢 CPU/冷编译，仍不划算。
  结论：需要**专用预热阶段完成后**再放 worker，或让 e2e 用例共享一份已热 store；
  “并发预热”不是免费重叠。
- 44e（repo `check .` 冷摘要）已删除：其覆盖与 `checks.vuna-typecheck`（`vuna check .`）和
  44b（小包冷 `cache-path=summary deps=2`）重复；删后 e2e 最长从 59.6 s 降到 56.9 s
  （44g），不再为一条冗余断言付整仓冷编译。
- 32_fmt 不再自编译探针包：`check.sh` 改用产品 CLI（复制+`vuna fmt`、`fmt --check`）后，
  32_fmt 从 ~47 s 降到 **9 s**，且 63 个夹具全过；`_probe.vuna` 删除。
- e2e 采用“专用串行预热”：CI 的 e2e check 先依次 `check base` / `check compiler` /
  `check .`（约 23 s），再跑 suite；44g 去掉 `store-isolated` 共享这份热 store。
  结果：e2e 最长 case 37.2 s → **29.5 s**，wall 仍约 77 s。47c/36 的进一步拆分在
  8 worker 下因并发争用反而到 34 s，已回退。
- 47c 再验：删掉 workspace 聚合段（test-m30）后冷跑 33.7 s、warm 35.6 s，没有收益；
  其成本是多次 `vuna test` 子进程各自编译 effect 测试。下一步应给包内 effect 测试做
  内容寻址的“编译产物缓存”，让 serial/parallel/overlap 复用同一份测试二进制，而不是
  继续删断言或拆 case。
- 包内 effect 测试增加 `views/testbin/<testBin>` 产物缓存：key = 编译器指纹 + 包源码闭包
  内容 + 各 context root 内容 + 测试源内容；命中直接运行缓存的 `bin/vuna-test`，跳过
  compile + build.sh。47c 因此从 ~29.5 s 降到 **23.6 s**（≤25 s），全量 789 cases 仍全绿。
