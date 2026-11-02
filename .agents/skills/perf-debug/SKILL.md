---
name: perf-debug
description: vuna 仓库里命令/阶段慢、几分钟不返回或打超时时的定位规程——先量增长率，再在能跑完的档位二分，最后从小到大逐档验收；禁止用全量跑「看它能不能完」。开始做性能优化、或怀疑某次改动引入复杂度回退时使用。
---

# 性能调试：先量增长，再二分，再小到大验收

命令/阶段慢、几分钟不返回、打超时，或要判断优化是否真的改了**增长率**时用这份规程。
逻辑错（结果不对）走打印二分；写断言走 `vuna-run-tests` 的夹具。**性能问题只按本规程走。**

## 什么时候用

- `vuna check --dt <pkg>` / `vuna build` / `vuna fmt --check` / 测试章节明显变慢或打超时；
- 迁移/精化器改动后，怀疑新路径引入 n² 或指数级重算；
- 准备声明「性能已修好」之前（必须有增长率表，不能只给一次全量读数）。

## 硬规则

1. **不跑完整用例做定位**：全量最多留**一个**有上限的基线读数，是最后验收，不是定位手段。
   定位期间禁止「等 15 分钟看它能不能完」。
2. **小→大**：先让几秒级的小输入跑通，再按 1×/2×/4×/8× 放大，记「规模 → 墙钟」，
   判断增长率。每档独立进程计时（避免缓存/预热混档）。
3. **只在能正常退出的 case 上做profile/二分**；跑不完的 case 没有读数，
   把入口缩到能完成的最大档才有意义。
4. **定位后用同一探针从小到大验收**：每档都量；修好前 vs 修好后用同一张表。
5. **报告写清「没跑完 / 没跑」**；超时不是结论。相邻档时间比 ≈ 规模比 ⇒ 线性；
   ≈ 规模比² ⇒ n²；**每档翻倍 ⇒ 找到指数点了**（先修它，再谈别的）。
6. **禁用前缀截断当阶梯**：vuna 的可达集是 import 级联的（`base` → `compiler` → `lib`），
   只取前 N 个模块/定义会造出假膝点，读数不可比。要放大规模就**合成**规模（N 个 def /
   N 个构造子 / N 个 case 分支），或者在独立包探针里保持闭包完整。

## 骨架

### ① 量增长率

三种探针，按问题定位选：

**a) 合成微基准（首选）**：生成「N 个同形 def/构造子/case 分支」的程序，N = 10/20/40/80/…，
每档独立进程跑 `vuna check --dt`，记录 `date +%s%3N` 差值。同形放大才能把「单位成本」
和「算法复杂度」分开。用 `_scratch/` 存放生成脚本与探针（gitignored，不进提交）。

**b) 模块探针**：只 `import` 目标模块、`main` 调一个代表函数的独立小包：

```console
mkdir -p _scratch/probe/<slug>/lib
# _scratch/probe/<slug>/vuna.toml：
#   [package] name = "probe-<slug>" ...
#   [export] modules = ["Vuna.Compiler.<Target>"]
#   [dependencies] vuna = "../../.."
./result/bin/vuna check --dt _scratch/probe/<slug>
```

可达集 = 该模块 + 其 import 闭包（含 `base`），所以**同 slug 的读数可横向比较**；
不同 slug 只能看增量。现成设施：`_scratch/probe/run-all.sh` / `run-one.sh`。

**c) 阶段切分**：vuna 没有内建 profile 开关；需要 cut 时用
- 包探针（a/b）压掉下游阶段；
- 临时在 `Vuna.Compiler.CompilerCli` / `Vuna.Cli` 的 check/compile 前后插 `print` 计时
  （**必须撤销**，别提交）；
- `nix run .#vuna-bench -- --quick` 看端到端回归。

判据：先算**相邻档时间比 / 规模比**。线性≈1、平方≈规模比、指数≈每档×2 以上。

### ② 二分定位

- **只在能完成的最大档**上二分：缩入口（更小包/更小 N），不要等大 case。
- 先区分「精化（elab）」还是「发射（codegen）」：`check --dt` 只做精化 + 擦除/生成检查，
  `build --dt --no-compile` 才到 OCaml 侧；用 `--dt` 的 check vs build 对比即可分离。
- 读实现找死循环式重算，重点三类：
  1. **同一子表达式在 `case` 多个分支各写一次**：vuna 的精化是逐分支展开，
     一个 `case` 里每个分支都重写同样的 `f x` ⇒ 分支数相乘，指数。
     （历史上 `patClauseConOrder`、嵌套字面量模式都踩过。）
  2. **`let` 在精化期是否被重新求值**：vuna 的 `let` 是记法（HM 侧落成 lambda 应用），
     DT 精化按出现次数展开；把共享值塞进 `let` 只是语法糖，不保证只精化一次。
  3. **元变量/字典回填的整表扫描**：`solveMeta`、`resolveDictGoals*`、
     `relevantMetas` 一类"每次调用都扫全表"的函数，在 O(def 数) 层调用就是 n²。
- 聚合用**具名阶段**（哪个函数/哪个 def），不要按 GC/系统时间猜。

### ③ 小到大验收

- 微基准每档过关（线性/多项式），并和修前**同一张表**对比；
- 真实阶段读数：`vuna check --dt base`、`--dt compiler`、`--dt .` 各一次（有上限）；
- 按面跑闸门：`nix run .#vuna-run-tests -- --only dt`（DT 语义/夹具）、
  `./result/bin/vuna check .`（HM 双路径零回归）、必要时 `nix run .#vuna-run-tests`
  全量 + `nix flake check`（CI 口径）。
- 修好标准是**增长率变了**（例如 n²→线性），不是「这次快了几秒」。

## vuna 专用提示

- 计时只信独立进程：`start=$(date +%s%3N); ./result/bin/vuna ... > log 2>&1; echo $(( $(date +%s%3N) - start ))`。
  不要用 `time ... | head`——`head` 的 SIGPIPE 会让被测进程提前退出，读数没意义。
- 探针产物一律放 `_scratch/`（gitignored）；`git status` 里出现探针文件就是违反纪律。
- `nix build .#vuna --out-link result` 的构建时间（Nix 缓存命中时 ~10–15s）算进读数前先
  单独量，别混进被测阶段；需要反复测时先构建一次，然后只跑 `./result/bin/vuna`。
- 打包/测试要用 `nix run .#vuna-run-tests -- --only <章节>` 过滤，别为了定位跑全量章节。
- 大包（`compiler`）的闭包远大于单模块探针；**不要拿单模块探针的绝对时间推断全包时间**，
  只比较同 slug 修前/修后。

## 反模式

- 全量 15/40/60 分钟「看它能不能完」：没读数、没定位，只是把超时当时钟。
- 只报一次「现在快/慢了」而不报增长率表：无法区分噪声、复杂度回退与规模差异。
- 用 `head` 截断被测命令输出：SIGPIPE 提前终止，时间假小。
- 拿不同闭包的探针互相比较绝对值（`base` 探针 vs `compiler` 探针）。
- 把「这次没超时」当修好；超时/没跑完必须明说。