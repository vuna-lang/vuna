---
name: perf-debug
description: vuna 仓库里命令/阶段慢、几分钟不返回或打超时时的定位规程——先修口径（冷/热、二进制版本、观测通道），再量增长率，再二分，最后从小到大验收；禁止用全量跑「看它能不能完」。开始做性能优化、或怀疑某次改动引入复杂度回退时使用。
---

# 性能调试：先修口径，再量增长，再二分，再验收

命令/阶段慢、几分钟不返回、打超时，或要判断优化是否真的改了**增长率**时用这份规程。
逻辑错（结果不对）走打印二分；写断言走 `vuna-run-tests` 的夹具。**性能问题只按本规程走。**
读数怎么对外表述见 [performance.md](../../../docs/reference/performance.md) §7。

## 什么时候用

- `vuna check <pkg>` / `vuna build` / `vuna fmt --check` / 测试章节明显变慢或打超时；
- 迁移/精化器改动后，怀疑新路径引入 n² 或指数级重算；
- 准备声明「性能已修好」之前（必须有增长率表，不能只给一次全量读数）。

## 硬规则

1. **不跑完整用例做定位**：全量最多留**一个**有上限的基线读数，是最后验收，不是定位手段。
   定位期间禁止「等 15 分钟看它能不能完」。
2. **小→大**：先让几秒级的小输入跑通，再按 1×/2×/4×/8× 放大，记「规模 → 墙钟」。
   每档独立进程 + **独立空 `VUNA_STORE`**（§0 第 2 条：只换 `TMPDIR` 不算冷）。
3. **只在能正常退出的 case 上做 profile / 二分**；跑不完的 case 没有读数。
4. **定位后用同一探针从小到大验收**：每档都量，修前/修后用同一张表、同一窗口。
5. **报告写清「没跑完 / 没跑」**；超时不是结论。相邻档时间比 ≈ 规模比 ⇒ 线性；
   ≈ 规模比² ⇒ n²；**每档翻倍 ⇒ 找到指数点了**（先修它，再谈别的）。
6. **禁用前缀截断当阶梯**：vuna 的可达集是 import 级联的（`base` → `compiler` → `lib`），
   只取前 N 个模块/定义会造出假膝点。要放大规模就**合成**（N 个 def / 构造子 / case 分支），
   或在独立包探针里保持闭包完整。
7. **读数必须带口径**：同一条命令写清「冷（空 store）/ 热（同 store 第二遍）/ 负载」。
   只给一个 ms 的读数不可复现，也不算验收。
8. **先查「做了几遍」，再查「每遍多慢」**：包级 check 的重复精化常常比单遍优化更值钱。

## 0. 先修口径（跑任何读数之前）

每条都踩过；跳过会得到「像数据、实际不可比」的读数。

1. **`./result/bin/vuna` 可能过期**。新建副 worktree 没有 `result`；主仓的也可能是几天前的
   构建——过期二进制会在自检时报**源码里已修复**的错误（实测旧二进制报
   `TC_UnknownName @vuna@obs@level`，HEAD 源码本身是好的）。开工先
   `nix build .#vuna --out-link result`，再 `./result/bin/vuna check base`（~0.4 s）确认可用。
   构建时间（缓存命中 ~10–15 s）不算进任何读数。
2. **冷 / 热由 `VUNA_STORE` 决定，不由 `TMPDIR` 决定**。devShell 会
   `export VUNA_STORE="$root/.local/store"` 且已预热；换新 `TMPDIR` 对命中率**没有影响**
   （实测同一热 store 换 TMPDIR，`check compiler` 仍 73–75 ms）。真冷写法：
   ```console
   d=$(mktemp -d /tmp/vp.XXXX); VUNA_STORE=$d/store TMPDIR=$d ./result/bin/vuna check compiler
   ```
3. **`VUNA_STORE` 未设或为空串 ⇒ 回退 `~/.vuna/store`**（回退链
   `VUNA_STORE → $XDG_DATA_HOME/vuna/store → ~/.vuna/store → $TMPDIR/vuna-store`）；只读
   HOME/沙箱下会直接 `Sys_error("...objects/lex/....tmp: Read-only file system")`。
   **不要 `unset`、不要传空值**，一律显式给空目录。
4. **入库的增长率门禁现在自己隔离 store，但「探针测的是不是你要守的那条路径」仍要自己验**。
   `compiler-growth.sh` / `compiler-growth-pkg.sh` 已改为每档 `VUNA_STORE=$(mktemp -d)/store`
   （2026-11 修复前的版本只隔离 `TMPDIR`，在 devShell 里会复用调用方的热 store）。
   **更隐蔽的坑**：pkg 门禁原先计时「无改动的第二次 check」——子单元全命中，读数只有
   ~20 ms 且与 N 全无关（N=1000/2000/4000 都是 20 ms），门槛永远绿但什么也守不住；
   现在改成「冷跑一次 → **改一行定义**让本模块缓存失效 → 计时」，读数才恢复成随 N 增长
   （231/435/1115/3116 ms）。**读数与 N 无关就是探针失效的信号，先查它，别急着调阈值。**
   本地复现 CI 口径：
   ```console
   VUNA=$PWD/result/bin/vuna VUNA_STORE=$(mktemp -d) sh nix/checks/compiler-growth.sh _scratch/out
   ```
5. **`--debug-perf` 的膨胀不是常数，负载比开关更响**。冷 `check compiler` 同一窗口交替：
   clean 22.2 s / debug 45.3 s（`user+sys` 21.8 vs 37.7 s），下一轮却 42.5 s / 23.0 s
   （loadavg 15–17）。规则：绝对读数只用「无 `--debug-perf`、`VUNA_OBS=0`」；
   阶段**比例**可用 debug，但 A/B 必须同窗口交替；读数行同时记 `user+sys`。
6. **`vuna fmt --check`（省略 PATH）在本仓库必然 exit 2**：会扫 `test/suite/fixtures`
   （有依赖不存在模块的夹具）。CI 的 `nix/checks/vuna-fmt.sh` 只覆盖各包 + `examples`；
   本地只查改动的包：`./result/bin/vuna fmt --check <目录>`。

## 骨架

### ① 量增长率

**a) 合成微基准（首选）**：N 个同形定义，包上下文只依赖 base。

```console
mkdir -p _scratch/g
printf '[package]\nname = "growth-local"\n\n[dependencies]\nvuna-base = "%s"\n' "$PWD/base" > _scratch/g/vuna.toml
for n in 500 1000 2000 4000 8000; do
  f=_scratch/g/p$n.vuna; : > $f; i=1
  while [ $i -le $n ]; do printf 'f%s : Int\nf%s = %s\n' $i $i $i >> $f; i=$((i+1)); done
  best=999999
  for k in 1 2; do d=$(mktemp -d /tmp/vp.XXXX)
    s=$(date +%s%3N); VUNA_STORE=$d/store TMPDIR=$d ./result/bin/vuna check $f >/dev/null 2>&1
    e=$(date +%s%3N); ms=$((e-s)); [ $ms -lt $best ] && best=$ms; rm -rf $d
  done; echo "N=$n $best ms"
done
```

**b) 模块/包探针**：只 import 目标模块、`main` 调代表函数的独立小包（可达集 = 目标模块 +
import 闭包；同 slug 读数可横向比，不同 slug 只看增量）。夹具三个已知坑：

```console
mkdir -p _scratch/probe/<slug>/lib _scratch/probe/<slug>/app
# vuna.toml：[package] name = "probe-<slug>"（只允许 a-z0-9-）
#            [export] modules = ["<Target>"]；[dependencies] vuna = "../../.."
VUNA_STORE=$(mktemp -d)/store ./result/bin/vuna check _scratch/probe/<slug>
```

- `[package] name` 非法字符 ⇒ `PKG_InvalidPackageName`（拼接路径进包名是最常见事故）；
- `lib/X.vuna` 要 `module X where` 头；`app/Main.vuna` 里 `import X` 后裸名引用**仍需
  `export`**（`RN_UnknownVariable` 的第一嫌疑是导出面没声明）；
- 逐定义导出：签名行 `export f : T`，实现行 `f = ...` 别再写 `export`（两行都写 ⇒
  `RN_DuplicateExport`）。

**c) 阶段切分**：`VUNA_OBS` 是当前唯一的结构化阶段通道；别再用临时插 `print` 的老办法。

```console
VUNA_OBS=1 VUNA_OBS_DIR=$PWD/_scratch/trace VUNA_STORE=$(mktemp -d)/store ./result/bin/vuna check compiler
./result/bin/vuna obs summarize _scratch/trace/vuna-*.jsonl          # 阶段 span
grep '"name":"vuna.def.elab"' _scratch/trace/*.jsonl \                # level 2 才有逐定义
  | sed -E 's/.*"dur":([0-9]+).*"def":"([^"]+)".*/\1 \2/' | sort -nr | head -20
```

已知边界：**level 1 只有 2 个 span**（`vuna.elab` / `vuna.codegen.check`），`sum%` 远小于墙钟
（实测 16.0 s / 21.6 s），看不到 load/parse/iface/split；**level 3 的 CPU 采样当前拿不到
样本**——`dtp_obs_sample_start` 在生成运行时里完整，但仓库内**没有调用点**，实测
`vuna.sample.cpu` 为 0 条、`summarize` 打 `samples:cpu (none)`。要看阶段顺序就用
`VUNA_DEBUG_PERF=1`（冷 `check compiler` 修后约 **18.8 万行**，其中逐 def ~1.1 万行 ×1 遍），
它成本远高于 obs level 1，只适合回答「几遍 / 什么顺序」。判读配方：`dbg!` 行带
`DEBUG <epoch-us> <text>`，用两行相减得到**无日志开销的净阶段时长**（首行到
`collectSigs-done` 是 load/parse 前缀、`collectSigs-done`→`bodies-done` 是逐 def 精化）；
这比 obs 的 `sum%` 近似更接近墙钟。

判据：先算**相邻档时间比 / 规模比**。线性≈1、平方≈规模比、指数≈每档×2 以上。

### ② 二分定位

1. **先数「做了几遍」**：`--debug-perf` 的 `collectSigs-done` 出现几次 = 精化了几遍；
   `iface-skip partial ... missing=<模块>` ⇒ 入口闭包没写全导出面，每轮都补一遍 lib check
   （可执行包 + `[export]` 常见；实测入口漏 import 两个导出模块时冷 `check compiler` 跑
   **两遍**、各约 11–12 s）；出现 `check-lib-skip covered=N` 说明第二遍已被省掉。
2. **再区分精化 / 发射**：`check` = 精化 + codegen 自检（擦除/分组/文本生成后丢弃文本）；
   `build --no-compile` = 完整 split 落盘；完整 `build` 才到 `ocamlopt`。
3. **只在能完成的最大档**上二分：缩入口（更小包/更小 N），不要等大 case。
4. 找死循环式重算，重点五类：
   1. **同一子表达式在 `case` 各分支各写一次**：精化逐分支展开 ⇒ 分支数相乘，指数
      （`patClauseConOrder` 与嵌套字面量模式是这类放大的常见来源）。
   2. **`let` 是否被重新求值**：vuna 的 `let` 是记法，落成 lambda 应用；DT 精化按出现次数
      展开，塞进 `let` 只是语法糖。
   3. **元变量/字典回填的整表扫描**：`solveMeta`、`resolveDictGoals*`、`relevantMetas`
      一类「每次调用都扫全表」的函数，在 O(def 数) 层调用就是 n²。
   4. **按名字逐个线性查表**：`findDtDef` / `findDefByName` / `memName` / `memList` 放在
      「每个 def 各调一次」的循环里就是 n²（codegen 分组 `Lower.appendGroups` 对每级 SCC
      线性过滤全体定义：同一探针 `termination-done → cg-typedecls-done` = 89/284/1083 ms
      （N=2000/4000/8000，逐档 ×3.2/×3.8），而 `bodies` 段是 75/89/127 ms 的线性）。
   5. **插入排序**：`Base.Sort.sortBy` 与 `Driver.Iface.insertByText` 都是插入排序（DT 只接受
      结构递归）；单模块数千项才退化（合成 2→4k def 模块 iface `compute` 376→1203 ms），
      真实包每模块几十项时收益低——改前先量折叠点。
   6. **「集合成员」却用了线性扫描**：`memName x used` / `memList x members` 出现在
      「对每个元素各查一次」的循环里就是 n²，即使它看着像一次比较。已修两处都属于这类：
      `Diagnostics.Sink.dedupeWarnings`（`containsDiag` 对新诊断逐个线性扫历史；
      16000 条未使用告警探针里占 ~3 s）与 `Driver.Dt.warnUnusedDefsGo`（逐 def `memName`
      查 `used`）。改法统一：入口 `HashMap.ofNames` / 键表**一次建表**，逐项 `member`。
      **注意键必须与既有等价关系等价**（`dedupeWarnings` 的键 = 码 + 消息 + 严重度 +
      全部 label 的 span 序列），否则去重结果会变——改完用 `check --warnings` 逐字节对拍。
5. 聚合用**具名阶段**（哪个函数/哪个 def），不要按 GC/系统时间猜。

### ③ 小到大验收

- 微基准每档过关（线性/多项式），和修前**同一张表**对比（同窗口交替、同二进制口径）；
- 真实阶段读数成对给。`vuna check .` 是**三段收敛**而非冷/热两档（实测空 store：
  21.2 s → 5.9 s → 5.8 s → 57 ms：冷精化 → 重写接口/单元 → 全命中），只报「热 57 ms」或
  「冷 21 s」都会误导；
- 按面跑闸门：`nix run .#vuna-run-tests -- --only dt`、`./result/bin/vuna check .`
  （唯一 DT 自检）、必要时全量 + `nix flake check`（CI 口径）；
- 修好标准是**增长率变了**（例如 n²→线性），不是「这次快了几秒」。

## vuna 专用提示

- 计时只信独立进程，也别用 `time ... | head`（SIGPIPE 让被测进程提前退出，时间假小）。
  墙钟会随宿主负载抖到 2× 以上（同一二进制、同一档探针：loadavg 1.6 时 N=500 168–176 ms，
  loadavg 15–18 时 512 ms 而 `user+sys` 只 0.29 s ⇒ 多出来的是**等待**）：同一张表只收
  同一窗口的读数，跨窗口先看 `user+sys` 是否漂。
- 本机参考量级（16 核、单进程、无 debug、空 store、空闲；只判「量级对不对」，跨机不可比）：
  `check base` 冷 ~0.40 s / 热 ~19 ms；`check compiler` 冷 ~13 s / 热 ~36 ms；
  `check .` 18 s → 6.1 s → 6.1 s → 57 ms；单文件合成 500/1000/2000/4000/8000 def =
  154/164/187/254/397 ms；脏模块增量探针 1000/2000/4000/8000 = 231/435/1115/3116 ms；
  `map` 冷 2.2–2.5 s / 热 0.16–0.17 s。
- 探针产物一律放 `_scratch/`（gitignored）；`git status` 里出现探针文件就是违反纪律。
- 测试用 `nix run .#vuna-run-tests -- --only <章节>` 过滤，别为定位跑全量章节。
- 大包（`compiler`）闭包远大于单模块探针；**不要拿单模块探针的绝对时间推断全包时间**，
  只比同 slug 修前/修后。
- 探针 `rc=70` 是 `diagInternal`（内部错/不变式，例如 `IC_FuelExhausted`：实测 `case`
  分支 ≥150 触发），**不是**性能结论；别改探针规模「绕开」它。
- 依赖包接口没落盘时包级探针会退回全量路径（测到的不是增量收尾）：先
  `VUNA_STORE=... vuna check <dep>` 再测。
- **「同一份工作做两遍」的排查入口**：`iface-skip partial ... missing=<模块列表>` 一眼指出
  入口闭包少了哪些导出模块（`compiler/app/Main.vuna` 与 `compiler/vuna.toml` 的
  `[export].modules` 必须全覆盖）；修好后同一处会打印 `iface-write=N/N` +
  `check-lib-skip covered=M`。包 `[export]` 少模块 ⇒ 永远跑全量（`check app/Main.vuna`
  实测每轮 27–33 s 不收敛），这是**设计如此**，不是 bug。
- **签名/告警不变式的验收方式**：这类「只改容器不改语义」的优化，除了增长率表，还要
  用 `check --warnings` 对比旧/新二进制的**逐字节输出**，以及整仓
  `build --no-compile` 的 `diff -r`（本轮的四处改动两者都通过）。
- `nix run .#vuna-run-tests` 默认用**主仓 `.local/store`**（`run-tests.nix` 里
  `VUNA_STORE=${VUNA_STORE:-$repo/.local/store}`）；副 worktree 里跑它会把主仓的 store
  路径带进来，容易得出「看起来失败」的读数。要在副 worktree 干净验证就直接
  `VUNA_STORE=$(mktemp -d) ./result/bin/vuna test --suite test/suite.toml`。

## 反模式

- 全量 15/40/60 分钟「看它能不能完」：没读数、没定位，只是把超时当时钟。
- 只报一次「现在快/慢了」而不报增长率表：无法区分噪声、复杂度回退与规模差异。
- **在 devShell 里不隔离 `VUNA_STORE` 就量冷基准**：量到的是热路径（§0 第 2/4 条）。
- **只换 `TMPDIR` 就以为换了冷热**；或不给 `VUNA_STORE` 让 store 落到 `~/.vuna/store`。
- **跨窗口比 clean vs debug 的墙钟**：负载比开关更响（§0 第 5 条）。
- 用过期 `./result/bin/vuna` 的自检失败反推「源码坏了」：先重建二进制。
- **拿「与规模无关」的读数当门槛通过**：探针失效（全命中/走错路径）时每档都一样快，
  门槛永远绿。先确认读数随 N 增长，再谈阈值（§0 第 4 条）。
- 用 `head` 截断被测命令输出；拿不同闭包的探针比较绝对值。
- 把「这次没超时」当修好；超时/没跑完必须明说。
