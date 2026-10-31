# M16 设计闸门：终止性、覆盖性与擦除

> 基线 `ec97707 feat(dt): M16 终止性与覆盖性`。三项结论：**终止性已落地并验证**（§1 如实
> 记录）；**覆盖性** M14 已有，M16 固定回归 + 划边界 + 收紧两处（§2）；**索引/证明擦除只做
> 诊断、不改运行时表示**，§3 给出整程序判定与 codegen 改动点；`partial` 例外未落地（§1.4）。
> 只覆盖 `--dt` 单文件路径；HM 路径（interp + typed + split）不受影响，`nix/metrics.budget`
> 不变（§5）。非目标（归 M17/M18）：tactic、多参数尺寸矩阵、互递归完整 size-change、嵌套
> 模式、多 clause。

## 1. 终止性（已落地）

### 1.1 规则：surface AST 上的逐调用结构下降

只看**自递归**：体里是否出现对自身名字的调用（`funMentions`）。判断在 surface `Expr`
上做，不依赖精化后的 `Term`，因此擦除/归一化之前即可判定。

size 表把源码变量名映射到 `(形参下标, 深度)`：

- 形参自身深度 `0`（`initialSizes`）；
- `case a of C k => ...` 中**仅当** scrutinee 是变量 `a` 时，构造子字段才继承 `a` 的
  形参下标、深度 `+1`（`extendSizes` / `subSizeGo`）——即「真子项」；
- 递归调用 `f a1..an` **下降** ⇔ 存在位置 `i`，使 `sizeOfVar ai` 的形参下标 == `i`
  且深度 > `0`（`argDescendsAt`）。

所以 `plus a b = case a of Zero => b | Succ k => Succ (plus k b)` 通过（`k` 的 size 为
`(0,1)`）；`loop n = loop n` 被拒（`n` 的 size 为 `(0,0)`）。

这是**逐调用**判定而非 size-change 闭包，两个后果：**互递归完全不查**（`even n = odd n` /
`odd n = even n` 都不自递归，`check --dt` 退出 0，`interp --dt` 才报
`DT: main does not reduce to a value`）；**跨调用循环被接受**
（`f a b = case a of Zero => (case b of Succ j => f (Succ Zero) j) | Succ k => f k (Succ b)`
每个调用都有实参下降 ⇒ `check --dt` 退出 0，编译产物实测死循环，`timeout 5` → 124）。

### 1.2 实现位置

全部在 `compiler/lib/Vuna/Compiler/Elab.vuna`：`checkTerminationDecls`（入口，`funDefsOf`
取所有 `DFun`）→ `checkTermOne`（`initialSizes (patNames pats)` 建初始 size 表）→
`checkTermBody`（遍历 `Expr`：`EApp` 判下降、`ECase` 扩 size 表），辅助 `checkTermArgs` /
`checkTermAlts` / `extendSizes` / `subSizeEntries` / `sizeOfVar` / `nthExpr` /
`argDescendsAt`。调用点在 `elabProgramFull` 末尾：
`andThen (checkTerminationDecls decls) (\_ => Ok (DtProgram ...))`，属硬错误；因为
`Dt.vuna` 的 `dtCheckFile` / `dtCompileFile` / `dtEvalFile` 都经 `elabProgram`，
`check --dt` / `compile --dt` / `interp --dt` 三条命令都会跑检查。

### 1.3 文案与夹具

唯一文案（`errAt` 会加 `error: <file>:<line>:<col>: ` 前缀）：

```
DT: cannot prove termination of <f> (recursive call does not structurally decrease)
```

| 夹具 | 用途 | 预期 |
| --- | --- | --- |
| `test/corpus/dt/16_total.vuna` | 正例：`plus` / `toInt` 结构递归 | `interp --dt` 输出 `8`，`check --dt` 退出 0 |
| `test/corpus/dt_err/16_nonterm.vuna` | 反例：`loop n = loop n` | 退出码非 0，`.err` 片段 `cannot prove termination of loop` |
| `test/corpus/dt/09_nat.vuna` | 回归：既有正例 | 不变 |

实测集合（回归比对用）：接受 `plus`、`toInt`、`vlen`（长度索引当递归参数）、`down`（`case`
内再 `case` 降两层）、`sym`；拒绝 `swap a b = swap b a` 与实参变大的 `f a b = case a of Zero
=> b | Succ k => f (Succ k) b`；不查互递归对与 Ackermann 形嵌套 `ack k (ack m j)`。

### 1.4 `partial` 例外（未落地）

需要一个「显式标记不检查」的出口，否则互递归/尺寸变化程序无法写。硬约束是**不新增关键字**
（新语法须旧种子可编译）：首选 `-- partial: <name>` 行注释写在定义签名前——`Parser` 已
`import Vuna.Compiler.Lexer`，可用 `lexComments` 取注释文本，再用 `Ast.declSpan` 的行号
关联声明；实测 `vuna fmt` 保留该注释且 `fmt --check` 退出 0。暂缓理由：检查目前是硬错误且
没有 `partial` 消费者，先落地会造成「写了标记但语义不变」的假接口。最小版本验收：带标记的
`f` 跳过 `checkTermOne`，但 `f` 若出现在类型级位置仍须拒，文案
`DT: partial definition <f> is used at the type level`。

### 1.5 类型级求值的终止性

`Core.force` 用 `defaultFuel = 512` 做 delta 展开上限，耗尽时**返回卡住的值**而非报错
（`if fuel <= 0 then v`）。这保证求值器不挂死，但**不是**终止性论证：卡住的值会被
`unifyIdx` / `conv` 当成「不相等」，错误表现为「分支不可能」等二级信息。M16 的定位：fuel
只是安全网，健全性由 §1.1 负责；另需把 `unifyIdx` 的 `if fuel <= 0 then Ok acc`（**静默
成功**）改成硬错误 `DT: index unification ran out of reduction fuel`——否则燃料耗尽被当成
索引相等。

## 2. 覆盖性

### 2.1 现状（M14 起已有，M16 只固定回归）

检查链：`checkCase` → `checkCaseFam` → `checkCaseOf` → `elabCaseAlts`（逐分支 `elabConAlt`）
→ `checkCaseDone` → `checkCoverage` / `checkCovered`。四条判定：

| 判定 | 实现 | 错误文案 |
| --- | --- | --- |
| 可达构造子必须写全 | `checkCovered`（逐构造子 `unifyIdxList`，不可达的跳过） | `DT: case is not exhaustive: missing <Ctor>` |
| 写了不可达分支要拒 | `elabConAlt` 的 `unifyIdxList` 失败 | `DT: this branch is impossible (index constraints are unsatisfiable)` |
| 同一构造子重复 | `checkCaseOf` 的 `hasDupNames (altNames alts)` | `DT: duplicate constructor in case` |
| 兜底分支只能最后 | `elabCatchAll` | `DT: the catch-all branch must be the last one` |

夹具：`test/corpus/dt_err/04_nonexhaustive.vuna`（`missing Succ`）、`10_impossible.vuna`、
M16 新增 `17_nested_total.vuna`（固定漏写可达分支仍被拒的回归）。

### 2.2 边界（明确不做）

| 事项 | 现状 | 结论 |
| --- | --- | --- |
| 嵌套模式 `Succ (Succ k)` | `bindCtorGo` 报 `DT: nested patterns are not supported yet (M14 limitation)` | **不在 M16**，保持 |
| 多 clause | 先被 `elabBodies` 的 `DT: definition parameters must be variables (M13)` 拦；变量形重复 clause 才命中 `DT: multiple clauses are not supported yet (use a single equation; M16)` | **不在 M16**，只把阶段标注改到后续阶段 |

无害瑕疵（记录不改）：`Succ (Succ k)` 与另一 `Succ` 分支共存时，`hasDupNames` 可能先命中，
报 `duplicate constructor in case` 而非 `nested patterns`（`altNames` 只看构造子头）；两者都
非零退出，不构成健全性问题。

### 2.3 必须收紧的两处

**(1) `unifyIdx` 把「卡住」当「不可能」。** `unifyIdxRigid` 在 `VNeutral (NGlobal ...)`
对 `VCon` 时回落 `unifyIdxConv`，`conv` 失败即判不等。当索引含**卡住的归约**（如
`Vec Int (plus n Zero)` 且 `n` 为中性变量）时，`plus n Zero` 展开成中性全局、`conv` 必然
失败，于是可达分支被误判不可达：

```
f : (n : Nat) -> Vec Int (plus n Zero) -> Int
f n xs = case xs of
  Nil => 0      -- 实测：DT: this branch is impossible (index constraints are unsatisfiable)
```

规则：判「不可能」只允许**刚性冲突**（两侧都能化成构造子/字面量/宇宙且头不同，`VInt` 不同、
`VType` 层不同等，`unifyIdxRigid` 已有这些分支）；任一侧仍是中性（`NVar` / `NGlobal` 应用）
或燃料耗尽 ⇒ **未知**，按「可能可达」处理。因此 `unifyIdx` 结果要从
`Result (List (Pair Int Value))` 细化为三值（`Unifiable` / `RigidClash` / `Unknown`），或用
`stuck` 布尔带出；`checkCovered` 与 `elabConAlt` 对 `Unknown` 都按可达处理。

**(2) 兜底短路覆盖率。** `checkCaseDone` 在 `hasCatchAll` 时短路掉全部覆盖率检查，于是
「所有可达构造子都写了还加 `_`」被静默接受（实测退出 0，codegen 生成 `| _ -> 2`）。规则：
兜底不短路，仍检查未被兜底覆盖的可达构造子；全覆盖后多出的 `_` 报
`DT: redundant case alternative`。

## 3. 擦除分析（本阶段重点）

### 3.1 事实：现在哪些东西带运行时表示

`teleOf`（签名/构造子 telescope）与 `splitKind`（data 的 kind）的标志为

```
erased = implicit || isTypeValue dom        -- teleOf
erased = isTypeValue dom                    -- splitKind / inferArgs 的显式实参
```

`isTypeValue` 只认「域是宇宙」，因此**宇宙域擦除、索引域保留**。实测：

| 输入 | 生成的类型声明 | 说明 |
| --- | --- | --- |
| `10_vec.vuna`：`Cons : (a : Type) -> (n : Nat) -> a -> Vec a n -> Vec a (Succ n)` | `and 'a t_Vec = C_Vec_Nil \| C_Vec_Cons of 'a t_Nat * 'a * 'a t_Vec` | **长度索引变成 `'a t_Nat` 字段** |
| `17_erase.vuna`：同族隐式版 `Cons : {a : Type} -> {n : Nat} -> ...` | `and 'a t_Vec = C_Vec_Nil \| C_Vec_Cons of 'a * 'a t_Vec` | 隐式索引已因 `implicit` 擦掉 |
| `12_eq.vuna`：`Refl : (a : Type) -> Eq a a` | `and 'a t_Eq = C_Eq_Refl` | 证明族本就零字段 |

结论：**隐式索引已免费擦掉，剩余开销全在显式索引**（`(n : Nat)` 写法，`10_vec` /`11_fin`
与用户代码都用），每个 `Cons` 多一个 `t_Nat` 装箱。

### 3.2 关键约束：**不能无条件擦索引**

反例即 `10_vec.vuna` 的 `vlen`：`vlen a n xs = case xs of Nil b => 0 | Cons b m y ys => 1 + vlen b m ys`。
`m` 被当实参传下去，索引在运行时**真的被读**（既作函数实参，也作构造子实参）；M16 探测期间
无条件擦的版本在编译期即报 `DT: type-level binding 'm' is used at runtime (M13 limitation)`。
`Elab.vuna` 中 `eraseIndexMask` 上方注释记录的正是这条事实。

### 3.3 「索引可擦除」的整程序判定

对族第 `i` 个参数判可擦，需两条件同时成立：

- **(a) 族内**：不出现在任何构造子的**非索引字段域**，只出现在结果索引位置。已由
  `eraseIndexMask` / `paramUsedInFieldTys` 实现（de Bruijn 位置比较：跳过前 `arity` 个
  binder 后看字段域是否引用它）。
- **(b) 整程序**：**从不流到运行时位置**——不作函数调用实参（含递归调用）、不作构造子实参、
  不被 `case` 绑定后在运行时位置使用。

(b) 可判定：在 Core `Term` 上收集「运行时位置读到的变量来源」，与 (a) 取交：

```
-- 与 dtDataParams 一一对应，True = 可擦
finalMask datas defs =
  map (\d => Pair (dtDataName d)
              (zipWith (\i cand => cand && not (memName (tagOf (dtDataName d) i) (indexReads defs)))
                       (rangeInt (length (dtDataParams d))) (eraseIndexMask d)))
      datas

indexReads defs = concatMap (\d => termReads [] (dtDefBody d)) defs   -- 元素写作 "F#i"

-- 环境为「最近绑定在前」的 (变量名, 是否擦除)；进到 erased 位置的实参不算运行时读取
termReads env t = case t of
  TVar n i         => sourceOf (envAt i env)                 -- 只记来源，不递归
  TApp f a erased  => termReads env f ++ (if erased then [] else termReads env a)
  TCon c args      => concatMap (\pa => case pa of Pair a e => if e then [] else termReads env a) args
  TCase scrut alts => termReads env scrut ++ concatMap (altReads env) alts
  TLam n e b       => termReads (Pair n e :: env) b
  TPi n i dom cod  => termReads env dom ++ termReads (Pair n True :: env) cod
  TIf c th el      => termReads env c ++ termReads env th ++ termReads env el
  _                => []
```

工程简化（**建议先做这一版**）：不追踪「来源」，只判「该族索引参数是否在**任何**
`TApp`/`TCon` 的非擦除实参位置或 `TCase` 分支体里被读」。索引进入运行时位置只有「从构造子
字段绑定出的变量」与「显式传参」两种形态，都被上面的 `TVar` 分支覆盖；代价是保守（多留
字段），不会错擦。

### 3.4 codegen 侧改动点

擦除作用在 `DtData` / `DtCtor` 层面，codegen 三处对齐、一处补：

| 位置（`CoreCodegen.vuna`） | 现状 | 改动 |
| --- | --- | --- |
| `ctorFieldTys` | 按 `dtCtorTelescope` 的 `erased` 跳过字段 | 逻辑不动；靠 §3.3 mask 经 `eraseParamsWith`（`e \|\| m`）把 telescope 标志改对，字段数与类型自动对齐 |
| `ocamlFieldTy` | 索引域回落 `'a`（即 `'a t_Nat`） | 同上：被擦位置不再进 `ctorFieldTys`，不再走 `ocamlFieldTy` |
| `genConApp` / `genConArgs` | 已按 `TApp`/`TCon` 的 `erased` 跳过实参 | 需让构造子索引实参标志跟 mask 走：隐式索引已由 `inferArgs` 的 `isIndexDomain` 标 `True`；**显式**索引实参当前是 `isTypeValue dom`（False），新增一步按 `finalMask` 覆写 |
| `genArm` / `altEnv` / `armPatternText` | 分支绑定按精化期 `caseAltBinders` 的顺序与标志 | **必须重对齐**：`CaseAlt` binders 是擦除前记录的，索引擦掉后 pattern 要少绑字段。新增 `alignAltBinders`，用已含 mask 的 `dtCtorTelescope` 的 `erased` 覆盖 `caseAltBinders` 的 `erased`，只有 `False` 位置进 pattern 文本；分支体仍按 de Bruijn index 引用，故只需对齐「位置 → 是否进 pattern」 |

`genCase` 的兜底 `| _ -> failwith "DT: impossible branch"` 是既有防御臂，不因擦除改变。

### 3.5 验收方式

1. **语义不变**：`test/corpus/dt/*.vuna` 全部 17 个夹具，`interp --dt` 的 stdout 与
   `compile --dt` → `ocamlopt` → 运行的 stdout 逐字节相同。`test/run-tests.sh` 第 34 段已按
   `.out` golden 做这条比对，擦除改动必须保持绿色。
2. **表示真的变小**：`10_vec.vuna` 生成物中 `C_Vec_Cons` 字段数 3 → 2，
   `grep -c "C_Vec_Cons of 'a t_Nat" out.ml` 为 0；`.ml` 体积应从当前 2089 字节下降
   （`17_erase.vuna` 的 1737 字节是隐式版本的下界参考）。
3. **不能擦的不许擦**：`vlen` 这类把索引当递归参数的定义仍须生成 `t_Nat` 字段且不报
   `DT: type-level binding ... is used at runtime`；把 `indexReads` 关掉（无条件擦）必须能
   复现该报错——即该判定的反例测试。
4. **诊断保留**：`eraseIndexMask` / `indexErasureCandidates` 继续作为「理论上可擦但当前仍
   保留」的诊断入口导出（`Elab.vuna` module 头已导出），供 `vuna map` / lint 未来使用。

## 4. 实现 checklist

| # | 文件 | 函数 | 改什么 |
| --- | --- | --- | --- |
| 1 | `Elab.vuna` | `unifyIdx` / `unifyIdxRigid` | 结果区分「刚性冲突」与「卡住/燃料耗尽」；`if fuel <= 0` 从 `Ok acc` 改为 `DT: index unification ran out of reduction fuel`（§1.5、§2.3） |
| 2 | 同上 | `checkCovered` / `elabConAlt` | 只有刚性冲突才判不可达/不可能，未知按可达（§2.3） |
| 3 | 同上 | `checkCaseDone` / `hasCatchAll` | 兜底不再短路覆盖率；全覆盖后多余的 `_` 报 `DT: redundant case alternative` |
| 4 | 同上 | `elabBodies` | `multiple clauses ... (use a single equation; M16)` 的阶段标注改到后续阶段（§2.2） |
| 5 | 同上 | 新增 `indexReads` / `finalMask` | 整程序判定 (b)，与 `eraseIndexMask` 取交（§3.3） |
| 6 | 同上 | `applyIndexErasure` / `eraseParamsWith` | 把 `finalMask` 真正作用到 `DtData`，在 `elabProgramFull` 返回 `DtProgram` 前执行（当前 `datas1` 原样传出） |
| 7 | 同上 | `teleOf` / `teleOfType` / `splitKind` / `inferArgs` | 构造子显式索引实参的 `erased` 按 `finalMask` 覆写 |
| 8 | `CoreCodegen.vuna` | `ctorFieldTys` / `ocamlFieldTy` | 逻辑不动，靠改对的 telescope 标志生效；补「字段数 == telescope 非擦位置数」一致性断言 |
| 9 | 同上 | 新增 `alignAltBinders`，供 `genArm` / `altEnv` / `armPatternText` | `CaseAlt` binders 按擦除后 telescope 重对齐，pattern 少绑索引位置（§3.4） |
| 10 | 同上 | `genConApp` / `genConArgs` | 与 #7 的标志一致，跳过被擦索引实参 |
| 11 | 同上 | `prepareDtProgram` / `checkErasure` | `checkErasure` 只允许 `erased` 绑定出现在被擦位置；正常路径不再出现 `M13 limitation` 文案 |
| 12 | `test/corpus/dt/`、`dt_err/` | 新增夹具 | 显式索引 `Vec`（擦除后无 `t_Nat` 字段）+ `vlen` 形（索引真被读、保住字段）；冗余兜底反例 |
| 13 | `docs/reference/limits.md`、`dt.md` | — | 记录 §1.1 互递归缺口、§2.2 边界、§3 索引擦除现状 |

## 5. 性能预算（明确：`nix/metrics.budget` 不变）

预算聚合的是 `vuna compile --package` 的 **compiler 包闭包**（seed 闭包），那是 **HM typed
codegen** 的产物；擦除只改 `--dt` 单文件输出，不进 seed、不进包级 compile，因此 M16
**不需要重新标定**（当前值：bytes 1120000 / lines 10500 / maxline 12400 / longlines 3890 /
letrec 575 / strcat 320 / eqint 35 / zeroarg 30 / ctorcount 2200）——只有擦除影响到 HM 路径时
才按 `metrics.budget` 头部注释的流程复测。`dt_elab` 基准（`nix/bench.sh`：
`compile --dt --no-print test/corpus/dt/03_compose.vuna`）不得回归：`docs/dt-core.md` §10
记录 M13 完成时约 2 ms，本机当前实测 3–4 ms（5 次取样 `3/4/3/4/3` ms，`date +%s%N` 计时）；
§3.3 的 `indexReads` 是一次线性遍历，量级远小于精化本身。`nix run .#bench -- --quick` 是
手动基准（不进 CI），用于出对比报告。

## 6. 已知例外（进 limits）

1. 互递归与跨调用 size-change 不查 ⇒ 可能接受死循环程序（`check --dt` 通过、运行时挂死）。
2. 嵌套模式、多 clause 不支持 ⇒ 覆盖性只在「单层构造子模式 + 单 equation」内成立。
3. 索引擦除只到诊断级 ⇒ 显式索引仍带 `t_Nat` 字段；隐式索引已擦。
4. 兜底 `_` 的求值器与 codegen 语义不一致（实测 `interp --dt` 报
   `DT: main does not reduce to a value`，编译产物打印 `2`）：先修 `Core.applyCaseAlt` 的
   兜底匹配（`vCaseAltName` 为空串的分支应命中任意 `VCon`）再放开 `_`。
