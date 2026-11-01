# DT 与 HM 的能力落差（dt-parity）

本文是**事实表**，不是计划：记录「要让 DT 取代 HM，DT 还缺什么」，是
[docs/roadmap.md](../roadmap.md) M18.5–M24 的证据基础。计划见 roadmap，DT 语义见
[dt.md](dt.md)，设计边界见 [docs/dt-core.md](../dt-core.md) §7 / §22。

**口径**：vuna 无发布、无外部用户，全部源码都在本仓库内，所以每项都是「**取代时必须在新
路径里等价提供的能力**」，不是「为兼容旧用户而保留的负担」。「用量」既是「DT 要写自己时
必须能吃的量」，也是「不改语言就得改写的量」。统计对象 `compiler/lib`（20 文件 11347 行）、
`base/lib`（12/485）、`lib`（13/4565），口径与脚本见 `.local/audit-a/stats/stats.sh`
（awk/grep，近似值；`.local/` 被 gitignore，审计产物只在本地工作区，不在仓库内）。

## 1. 缺口总表（按阻断度排序）

| # | 能力缺口 | 当前行为 / 错误文案 | compiler/lib | base/lib | lib | 归属 |
|---|---|---|---|---|---|---|
| 1 | ~~lambda 形参无条件擦除~~（含 `f = | 8 | DT prelude 无 List/Pair/Maybe/Result，无 `print` / `readFile` / `exit` / `getArgs`（`DtPrelude.preludeGlobals` / `preludeNames`） | `DT: unknown name <name>` | List 1064、Pair 1845、Maybe 65、Result 175；print 42、readFile 13、exit 9 | 79/30/17/18；5/5/5/5 | 132/286/27/21；48/11/8 | M21 |x => ...`、`case` 分支里的闭包） | **M18.5 已修复**：统一判据 `Elab.erasedBinder`——隐式 binder 恒擦除，显式 binder 仅宇宙域擦除；既有反例 `07_lambda` / `09_runtime_type` 之外新增 `18_lam_type_used` | 739（691 含具名参数） | 18 | 104 | M18.5（已完成） |
| 2 | 无签名顶层定义 | `Elab.elabBodies`：`DT: expected a type signature for <name>` | 1083 / 1649 defs | 0 / 85 | 574 / 710 | M23（签名工具） |
| 3 | ~~多 clause 函数~~ | **M19 已实现**：合成单个 lambda + case 表达式树（标准模式矩阵） | 399 名 / 978 行 | 24 / 51 | 123 / 266 | M19（已完成） |
| 4 | ~~方程左端模式~~（构造子/字面量/列表） | **M19 已实现**：随多 clause 一起，模式矩阵展开 | 832 defs（单 clause 433） | 36 | 302 | M19（已完成） |
| 5 | ~~`let` 表达式~~（`where` 块 desugar 成 `ELet`） | **M19 已实现**：脱糖为 `(\\x => body) e` | 296 | 4 | 189 | M19（已完成） |
| 6 | ~~`case` 在推断位~~ | **M19 已实现**：元变量作期望类型 | 132 | 2 | 29 | M19（已完成） |
| 7 | ~~`case` 嵌套构造子模式~~ | **M19 已实现**：改写成内层 case | 410 alts | 1 | 91 | M19（已完成） |
| 8 | DT prelude 只有 Int/String/Bool + 算术比较 + `++` / `&&` / `\|\|` + `str*`：无 List/Pair/Maybe/Result，无 `print` / `readFile` / `exit` / `getArgs`（`DtPrelude.preludeGlobals` / `preludeNames`） | `DT: unknown name <name>` | List 1064、Pair 1845、Maybe 65、Result 175；print 42、readFile 13、exit 9 | 79/30/17/18；5/5/5/5 | 132/286/27/21；48/11/8 | M21 |
| 9 | ~~`==` / `/=` 只对 Int~~ | **M19 已实现**：隐式类型参数 + 精化期按实参类型特化（`bi_eq_str` 等） | 155 处字符串比较 | 0 | 52 | M19（已完成） |
| 10 | ~~`case` 只接受归纳族~~ | **M19 已实现**：Bool 降级 if，Int/String 降级 if 链（需兜底） | 4（Bool 分支） | 0 | 0 | M19（已完成） |
| 11 | 非结构递归（算术递减 / fuel 式） | `Elab.checkTermBody`：`DT: cannot prove termination of <f> ...` | 41（`Elab` 14、`Core` 13、`Loader` 5、余 9） | 3 | 20 | M19 风险项 |
| 12 | ~~单文件~~：无 `import` / `--root` / `data Foo a` | **M20 已实现**：复用 Loader（`loadProgramRaw`）、参数化 `data`、签名类型变量隐式量化。剩余包目录与泛型实例约束 | 20 模块头 / 64 import | 12 / 33 | 13 / 64 | M20（9/10） |
| 13 | `main` 只能是 Int/String/Bool，无 `main : IO a` | `CoreCodegen.mainShowErr`：`DT: main must return Int, String or Bool (M13 limitation)` | 两入口均 `main : IO Int` | — | — | M21 |
| 14 | ~~`record` 声明 / 字段访问 / 更新 / 模式~~ | **M19 已实现**：精化前统一降级成单构造子 data（`DtRecords.vuna`），构造子名 `Mk<R>` | 1 声明、14 构造、4 字段读取（另有 `fmt/` 夹具） | 0 | 0 | M19（已完成） |
| 15 | ~~`deriving`~~ | **M19 已实现**：展开成等价 instance（`DtDerive.vuna`），生成 Show/Eq/Ord 方法体 | 1（`Loader.ExportEntry`）+ `traits/` 13 个夹具 | 0 | 0 | M19（已完成） |
| 16 | `do` 块 | `Elab.inferE` EDo：`DT: do blocks are not supported yet (M19)` | 0（`compiler/app/Main.vuna` 1 处） | 0 | 1（`app/Main.vuna`） | M21 |
| 17 | ~~隐式索引 binder 一律擦除~~ | **M18.5 已修复**：隐式 binder 仍恒擦除（这是正确语义——隐式实参由精化器插入），但**显式索引 binder** 恢复参与运行时表示 | — | — | — | M18.5（已完成） |

第 1 项曾是该表唯一的 **bug**，M18.5 已修、第 17 项随之收敛；**M19 完成第 3–7、9、10、14、15 项**，第 8 项的 `str*` 也已落地（剩余容器与 IO 原语归 M21）。第 2 项是**迁移工作量**而非
语言缺陷（§5 ②）；第 8/13/16 项构成「编译器本体不可能用 DT 写」的硬边界；第 14/15 项
**保留并补齐**——它们有 `fmt/` 与 `traits/` 夹具覆盖（决策见 roadmap「决策变更」）。

**M18.6 的表示层改动不在本表内**：它不加能力、不改行为，只把 `erased : Bool` 换成三值
`Rig`、`TType : Int` 换成不透明 `Level`（见 [dt-core.md](../dt-core.md) §24）。

## 2. 「不可绕」与「可绕」

决定阶段排序的不是缺口数量，而是**能否不改语言、只改写源码绕过**。

- **不可绕**（必须补语言或 codegen）：`lambda 形参擦除`（1）——既报错又静默错编译，捕获
  上游状态的闭包**没有替代语法**，顶层命名函数只能救无捕获的少数；`let` + 推断位 `case` +
  嵌套模式（5/6/7）——覆盖最主流的三类写法（296 / 132 / 410），是书写风格本身；多 clause +
  方程模式（3/4）——改写成 `case` 是纯机械操作，但改写量与「重写编译器」同量级，故终态
  决策是**保留语法并实现**；内建容器与字符串/IO 原语（8/9/13/16）——连 `strFromInt` 都要
  自带，等价于用 DT 重写 `base/`，且没有 IO 就无法表达入口的 `main : IO Int`；fuel 式
  递归（11）——`Core.force` 是编译器心脏，41 处算术递减过不了结构递归检查，属 M19 风险项。
- **可绕改写**（不需补语言，改写成本可控）：`do`（16）→ 手写 `bind` / `>>=`（2 处入口）；
  隐式索引擦除（17）→ 改显式 `(n : Nat)` binder（实测通过，但索引会变成运行时字段）。
  `record`（14）与 `deriving`（15）**不在此列**：它们是终态保留的语言特性，DT 侧必须补齐
  （`deriving` 在 DT 的自然形态是生成 instance，复用 M15 的实例搜索）。

## 3. lambda 擦除缺陷（M18.5 已修复，留作样本）

`Elab.checkLam` 曾把**每个** lambda 形参标成 `erased = True`，`CoreCodegen.genTerm` 的
`TLam` 分支配套「擦除即不生成形参」。于是任何 lambda 形参都被当成类型级变量，产生两条
失败路径——两路都已被 `test/corpus/dt/19_lam.vuna` 固化为回归夹具。

**路径 A：形参在运行时被使用 → 直接报错**（修复前）：

```vuna
twice : (Nat -> Nat) -> Nat -> Nat
twice f x = f (f x)

three : Nat
three = twice (\n => Succ n) Zero
-- error: in `three`: DT: type-level binding `n` is used at runtime
```

**路径 B：形参未被使用 → 静默错编译**：`check` 与 `compile` 都退出 0、`interp` 结果正确，
但生成的 OCaml **少一个形参**（`main = apply2 (\n => 7) 1`）：

```ocaml
let v_apply2 = (fun f -> (fun x -> (f x)))
let v_main = ((v_apply2 7) 1)     (* 少一层 fun：7 被当成函数 *)
(* $ vuna check/compile --dt ... 均 exit 0；ocamlopt 才报： *)
(* Error: The constant 7 has type int but an expression was expected of type 'a -> 'b *)
```

路径 B 是审计中唯一**违反类型系统基本保证**的发现：`CoreCodegen` 注释里「能 check 就能
compile」在此失效，DT 存在能产出错误程序的通道。修复方式是把判据收敛成全仓唯一入口
`Elab.erasedBinder implicit dom = implicit || isTypeValue dom`，六处判据点
（`teleOf` / `checkBinders` / `bindOnePattern` / `checkLam` / `inferArgs` / `bindCtorBinder`）
全部改走它；`test/run-tests.sh` 第 34 段同时加了「同夹具 `interp` 输出 == 编译产物输出」的
逐夹具对拍断言，保证语义一致性不靠人工比对。

## 4. 核对的数字与口径差异

三处口径差异（其余与 `.local/audit-a/stats/stats.sh` 一致）：
1. **字符串比较 155 / 52**：155 是 `compiler/lib` 中「`==` 右侧紧跟字符串字面量的行数」，
   `lib` 同口径是 **52**（`/=` 也算上是 **55**）；表 1 写 52，roadmap 引用 155 时指 `compiler/lib`。
2. **多 clause 399 名 / 978 行**是逐文件去重口径；跨文件拼接是 421 名 / 1050 行（同名碰撞）。
3. **`let` 296 是 `compiler/lib` 的量**，`lib` 是 189——勿混列读取。

测试面：DT 正例 32 / 负例 26，见 [testing.md](testing.md)。

## 5. 对计划的三条推论

**① 多文件不是第一前置，语言面才是。** 第 1–11 项全部能在单文件里遇到；即使立刻做出多
文件 + 包集成，任何含闭包或 `let` 的模块仍过不了精化。顺序应是 M18.5 → M19 → M20。

**② 签名必填是迁移工作，不是 DT 语言特性。** 1083 个无签名定义是**改写量**：终态要求顶层
签名必填并**不引入 HM 式顶层推断**（精化需要签名做检查模式与错误定位）。写一次性签名导出
工具、用 HM 推断结果回填源码即可，工具在 M24 后删除。

**③ 擦除与 metrics 重标定必须排在切换 seed 之前。** `seed/` 由 HM split codegen 生成，DT
产物形状完全不同（单文件、无 `.mli`、每产物带 28 行 runtime 前导）。所以「DT 能编译自己」
（M23）与「DT codegen 产出 seed 需要的形状 + 新预算」（M22）必须都在 M24 的 seed 切换之前
完成；顺序反了会拿 HM 的预算衡量 DT 产物，得到无意义的门槛。

## 相关阅读

阶段划分与验收：[roadmap.md](../roadmap.md)（M18.5–M24）；DT 语义与设计：[dt.md](dt.md)、
[dt-core.md](../dt-core.md)；被推翻的 M18 决策原文：[m18-migration.md](m18-migration.md)；
限制与测试面：[limits.md](limits.md)、[testing.md](testing.md)；审计原始数据：
`.local/audit-a/REPORT.md`、`.local/audit-a/repro.sh`、`.local/audit-b/`。

## 6. 索引精化的能力边界（M24.5 的依据）

要判断「编译器本体能否用 DT 重写」，关键不是 DT 有多少语法，而是**精化器能在多大范围内
给出索引等式**。本节是 2026-11 的实测结论，每行都有可复现夹具。

### 6.1 可写与不可写的分界

| 形态 | 结果 | 说明 |
| --- | --- | --- |
| `wkVar : Var n -> Var (Succ n)` | ✅ | 弱化，索引只往后推一位 |
| `wkTerm : Term n -> Term (Succ n)`（穿过 binder） | ✅ | 递归时上下文变 `Succ (Succ n)`，goal 仍单一形参 |
| `subst : Term (Succ n) -> Term n -> Term n`（穿过 binder 时 lift 目标项） | ✅ | `interp` 可求值；这是「DT 能写编译器」的关键正面证据 |
| `vhead : Vec a (Succ n) -> a` / `idv : Vec a n -> Vec a n` | ✅ | `case` 打在被索引族本身，goal 索引随分支精化 |
| `get : Env n -> Fin n -> Nat` | ✅ | 取出**不依赖索引**的值 |
| `lookupEnv : Env n -> Fin n -> Tm n` | ❌ `expected (Succ n), got n` | 取出**依赖索引**的值 |
| `append : Vec a n -> Vec a m -> Vec a (plus n m)` | ❌ `expected (Zero), got m` | 需要在**两个形参**间搬运等式 |
| `rep : (k : Nat) -> a -> Vec a k` | ❌ `expected k, got (Zero)` | `case` 打在裸 `Nat` 形参上，goal 里含该形参 |

### 6.2 边界的一句话表述

**精化器只在「`case` 打在被索引族本身、且 goal 的索引就是该 case 精化的那个形参」时
提供等式。** 一旦需要

1. 两个**不同形参**之间的等式（`append` 的 `n` 与 `m`），或
2. 把 `case` 的**scrutinee** 精化反射进 goal（`rep` 的裸 `Nat`），或
3. 用「某分支不可能」来**免除**写该分支（`lookupEnv` 的 `ENil` 分支里 `Fin Zero` 为空，
   现在能判不可能，但不能据此跳过）

就写不出来。这三条正是「按索引编程」的核心手法，也是 M24.5 要补的东西。

### 6.3 对计划的含义

- **「用 DT 重写编译器」不是幻想，但也不是照抄**。弱化、替换、按族 case 都已是可行的；
  卡住的是 `append`/`Env` 这类**跨索引等式**。
- 因此 M24.6「Core 索引化」的范围**由 M24.5 的能力决定**：M24.5 补齐等式搬运后，
  `Env`/`lookup` 与 `append` 才可写；否则只能做到「`Env` 存不依赖索引的值」这一层。
- **不要先动 Term 层**：实测收益集中在 `Env`/`lookup`/弱化/替换这一层，把 `Term` 的
  Pi/Lam 结构整体索引化成本极高且收益递减。
- 三个「看起来诱人但不划算」的项（拓扑序见证、元变量上下文索引化、终止性 `Acc` 见证）
  的记录见 [docs/roadmap.md](../roadmap.md) M24.6 的「明确不划算」小节。

> **口径提示**：本节结论来自 2026-11 的一轮实验（`.local/audit-c/`，77 个夹具）。
> 早期有一份报告认为「`subst` 也写不出来」，复核后发现是那份夹具漏了穿过 binder 时的
> `shift u`（`subst` 的目标项必须先弱化），修正后通过。**引用「DT 写不了编译器」这类
> 结论前请先复核夹具本身是否正确。**
