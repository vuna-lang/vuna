# 测试架构（test-architecture）

本文是测试体系的**设计页**：测试如何消费输入寻址对象库（`cache.md`）、为什么默认共享
一个 store、哪些用例必须隔离。操作口径与 commands 在 [testing.md](testing.md)；
对象库本身见 [cache.md](cache.md)。

## 1. 原则：测试是对象库的普通客户端

对象库是仓库唯一的缓存形态（输入寻址、存在即命中、删除只影响命中率、roots + GC）。
测试 runner 因此不维护第二套缓存：**一次 run 只有一个 store root**，父进程预热一次，
worker 与 case 共享；只有断言缓存布局 / GC / 冷命中的用例显式隔离。

冷启动重复劳动的代价是为什么共享的根据：每个 worker 各跑一次 `vuna check packages/base`
（冷 store 约 7 s）会在 16 个 worker 上乘 16；同一夹具空 store 编译 2.9–5.5 s，
暖 store 7 ms（本机 16 核实测）。所以先让测试成为对象库的普通客户端，再谈调度。

## 2. 形态：Test-as-Store-Client

```text
                    ~/.vuna/test-store（测试专用根；VUNA_STORE 可覆盖）
   objects/iface|header|lex|order|check|tool|test|pkgiface|splitptr
   blobs/<splitIdentity>   units/<pkg>   views/bin/<splitIn>   roots/<project>/<digest>
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

1. **一次 run 一个 store root**：默认 `~/.vuna/test-store`（测试专用，不与开发缓存共用；`nix run .#vuna-run-tests` 导出，
   `nix run .#vuna-run-tests`、CI check 各自导出；`VUNA_STORE` 可覆盖）。父进程解析一次，
   所有 worker/case 继承同一路径。
2. **父进程只预热一次**：`vuna check packages/base`（需要时 `check .`）；worker 不各自 warmup。
3. **默认共享，隔离显式**：steps 文件头写 `# store-isolated` 的 case 用 `${caseTmp}/store`；
   其余共享。断言缓存布局、GC、冷命中、只读语义的用例必须隔离。
4. **`--no-cache` 只忽略结果判定**（golden/error 的本地结果缓存），不关闭对象库；
   真正的冷跑用显式空 `VUNA_STORE`。

### 2.2 为什么可以共用

- 单文件对象（`objects/iface|header|lex|order|check|split|tool`）是输入寻址 + 原子写：
  同一输入同一路径、同一份字节；日常 `check`/`build` 与测试并发写不会互相覆盖。
- 编译器身份在 `ver` 输入里：身份取自产物 `build-id` 的内容，同源同身份——日常 CLI 与测试
  用**不同源码**构建的二进制地址不同，不会读错；同源的不同副本则共享对象。
- 删除对象只会导致重算，不会导致错误；GC 因此是性能问题，不是正确性问题。

### 2.3 并发边界（`cache.md` 的补充）

| 位置 | 现状 | 影响 |
| --- | --- | --- |
| `roots/<project>/<digest>` | 逐摘要文件，无读-改-写 | 并发追加不丢 root |
| `views/bin/<splitIn>` | `mkdir` 构建锁 + 持锁写最终视图、`.complete` 原子提交 | 日常 build 与测试同时构建同一包会串行；显式 `--out` 不经过锁 |
| `units/<pkg>` | 写原子，按 entry 桶内 GC | 并发不同 entry 不互相驱逐 |

### 2.4 进程内执行层（fixture 用例）

fixture 用例（`CGolden` / `CError` / `CCheck` / `CLint` / `CFix`）**不 spawn `vuna`**：
runner 直接调用编译器/工具链的导出函数并断言返回值（细节见
[testing.md](testing.md) 的「进程内断言」）。

- **路径选择只在进程内**：增量会话（`Vuna.Test.Session`，依赖接口 + `AuxCache`）优先，
  不可用时同进程退回全量精化。没有「回退子进程」这一步——那会把断言退回字符串匹配。
  增量会话不覆盖的只有 `warnUnusedDefsIn`，所以负例一律走全量。
- **verdict key 只有输入摘要**（不含 env 分量），所以同一输入在不同环境共用同一裁决。
- **隔离只保留在 steps 岛**：`# store-isolated` 的私有 store 只用于断言缓存布局/GC/
  冷命中的 steps 用例；fixture 负例不需要私有 store 绕缓存。

## 3. 用例分层与预算

| tier | 内容 | 目标 | 触发 |
| --- | --- | --- | --- |
| `fast` | 进程内 check/核心求值语义、诊断、term | < 10 s | 每次保存 / commit |
| `integration` | compile+run golden、CLI/lint/fix、模块/包 | < 30 s | PR / pre-push |
| `e2e` | `check .`、LSP/REPL、workspace/build、seed | < 60 s | 合并前 / nightly |
| `tools` | `vuna test --jobs`、REPL 工具 case | < 25 s | e2e check 内固定 2 worker |
| `perf` | growth/metrics/bench | 独立机器 | nightly |

tier 过滤：`--tier fast|integration|e2e|tools`（可重复）；`*.steps` 默认 `e2e`，
seed/runtime 归 `integration`，golden/error/lint/fix/check 归 `fast`。

### 3.1 后端维度（与 tier 正交）

| matrix | 层 | 目标 | 门禁 |
| --- | --- | --- | --- |
| `tool` | 前端/工具 | ocaml | gate |
| `pure` | L1 纯 | ocaml（全量） | gate |
| `pure-cross` | L1 纯 | ocaml + wasm + native | gate（ocaml）+ `vuna-tests-wasm` / `vuna-tests-native` |
| `effect-common` | L2 | ocaml + wasm + native | 同上 |
| `effect-native` | L2 | ocaml + native | gate + `vuna-tests-native` |
| `effect-wasm` | L2 | ocaml + wasm | gate + `vuna-tests-wasm` |
| `effect-ocaml` | L2 | ocaml | gate |

`--backend` 与 `matrix` 只决定「在哪些目标上执行」，不改变 tier；跨后端 case 仍按
`fast`/`integration` 归属。wasm / native 门禁只跑 `fast integration`——e2e 的
LSP/REPL/包管理器/seed 是 ocaml 宿主的工具链面，不跨目标。

调度：LPT 只用于非 e2e tier（gate：`fast integration`）——父/worker 读
`.local/test-suite/costs.tsv`（上次每 case 的 ms），按成本降序把重 case 放到当前负载最小
的 worker；worker 确定性重算同一组 bins，再取自己的 bin。全量（空 tier）与 e2e tier 按
发现顺序，避免冷隔离长 case 同时开跑。worker 协议是 `--worker i/N`。

**冷隔离长 case 不能只靠排序**：把 e2e 长 case 同时压到多个 worker 会让全量变慢，
必须先有 tier 与 cold-heavy 并发上限；当前就是静态分片。e2e 采用**专用串行预热**（先
`check packages/base` / `check packages/compiler` / `check .`，再跑 suite），长 case 的根因是冷编译而不是
断言数量，所以拆 case 必须共享已预热 store。

## 4. 结果判定：verdict 对象

- `objects/test/<testIn>`，`testIn = addrOf ["test", caseId, kind, srcHash, expectedHash,
  compilerFp, depsHash, toolHash]`；存在 = 上次通过。
- 只缓存输入可声明的 golden/error/check；steps 先共享 store 但不缓存。
- 通过后写对象并 `storeRootAppendEff` 登记；`vuna store gc` 直接复用。

## 5. 产物：走 store 视图

- `views/bin/<splitIn>` / `units/` 承担 build 产物；测试共享同一视图。
- 包内 effect 测试有 `views/testbin/<testBin>` 产物缓存：key = 编译器指纹 + 各 context
  root 内容 + 测试源内容；命中直接运行缓存的 `bin/vuna-test`，跳过 compile + `build.sh`。
- repo 包的 build 可对不需要共享视图的用例用 `--out` 私有目录或 `store-isolated`。

## 6. CI

- build 阶段一次构建 vuna/seed 并预热 store；test 阶段 suite 与 check 共享只读
  store + 每 check 可写 overlay。
- 全局 token 池替代每 check 内部 `--jobs auto`；重 check 串行/分批。
- 去掉 suite 与 Nix checks 重叠的 `check .` / fmt / package / lint 重复执行。

## 7. 验收与测量

- 同一 store 连续 `check packages/compiler`：第二次 `cache-path=hit`、`iface-write=0/N`、< 100 ms。
- 单 dt golden case：< 2 s；section 90：< 60 s；全量：< 2 min。
- 测量必须在静默树上重录，记录 HEAD、CPU、`VUNA_STORE` 是否为空、`--cache-dir`。

## 相关阅读

- 对象库：[cache.md](cache.md)；测试操作口径：[testing.md](testing.md)
- 性能方法与读数：[performance.md](performance.md)
- 终态方向：[../architecture-target.md](../architecture-target.md)
