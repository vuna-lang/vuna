# M16 设计闸门：终止性、覆盖性与擦除

> **历史文档（M16 当时记录）**：文中 `--dt` 与另一条路径已在 M24 删除，现行语义见
> [dt.md](dt.md) / [limits.md](limits.md)；本文只保留设计推理与当时的边界证据。
> 基线 `ec97707`。**终止性已落地并验证**；覆盖性 M14 已有，M16 固定回归 + 划边界 + 收紧两处；
> **索引/证明擦除只做诊断、不改运行时表示**；`partial` 例外未落地。只覆盖 `--dt` 单文件路径；
> HM 路径（interp + typed + split）不受影响、`nix/metrics.budget` 不变。非目标（M17/M18）：
> tactic、多参数尺寸矩阵、互递归完整 size-change、嵌套模式、多 clause。

## 1. 终止性（已落地）

**规则**：只看自递归（`funMentions`），判断在 surface `Expr` 上、不依赖精化后的 `Term`。size
表把变量名映射到 `(形参下标, 深度)`：形参深度 `0`（`initialSizes`）；`case a of C k` 里**仅
当** scrutinee 是变量 `a` 时字段才继承 `a` 的形参下标、深度 `+1`（`extendSizes` /
`subSizeGo`，即「真子项」）；递归调用 `f a1..an` **下降** ⇔ 存在 `i` 使 `sizeOfVar ai` 的形参
下标 == `i` 且深度 > `0`（`argDescendsAt`）。故 `plus a b = case a of Zero => b | Succ k =>
Succ (plus k b)` 通过（`k` 为 `(0,1)`），`loop n = loop n` 被拒（`n` 为 `(0,0)`）。

这是**逐调用**判定而非 size-change 闭包，两个后果：互递归完全不查（`even n = odd n` /
`odd n = even n` 都不自递归，`check --dt` 退出 0）；跨调用循环被接受（每调用都有实参下降 ⇒
退出 0，而编译产物实测死循环）。

**实现**全在 `compiler/lib/Vuna/Compiler/Elab.vuna`：`checkTerminationDecls`（入口，`funDefsOf` 取 `DFun`）→ `checkTermOne` → `checkTermBody`，辅以 `checkTermArgs` / `checkTermAlts` / `extendSizes` / `subSizeEntries` / `sizeOfVar` / `nthExpr` / `argDescendsAt`。调用点在 `elabProgramFull` 末尾 `andThen (checkTerminationDecls decls)`，属硬错误；`Dt.vuna` 的 `dtCheckFile` / `dtCompileFile` / `dtEvalFile` 都经 `elabProgram`，故三条命令都会跑检查。

**文案**（`errAt` 加 `error: <file>:<line>:<col>: ` 前缀）：
`DT: cannot prove termination of <f> (recursive call does not structurally decrease)`

| 夹具 | 用途 | 预期 |
| --- | --- | --- |
| `test/corpus/dt/16_total.vuna` | 正例 `plus` / `toInt` | `interp --dt` 输出 `8`，`check --dt` 退出 0 |
| `test/corpus/dt_err/16_nonterm.vuna` | 反例 `loop n = loop n` | 非 0，`.err` 片段 `cannot prove termination of loop` |
| `test/corpus/dt/09_nat.vuna` | 回归 | 不变 |

接受：`plus`、`toInt`、`vlen`、`down`、`sym`；拒绝：`swap a b = swap b a`、实参变大的
`f (Succ k) b`；不查互递归与 Ackermann 形嵌套。`partial` 例外**未落地**：方案是
`-- partial: <name>` 行注释（`Parser` 已 import `Vuna.Compiler.Lexer`，可用 `lexComments` +
`Ast.declSpan` 行号关联；实测 `vuna fmt` 保留且 `fmt --check` 退出 0），暂缓因为检查目前是
硬错误且无消费者。类型级求值：`Core.force` 的 `defaultFuel = 512` 耗尽时返回卡住的值、只是
安全网；`unifyIdx` 的 `if fuel <= 0 then Ok acc`（静默成功）须改成硬错误
`DT: index unification ran out of reduction fuel`。

## 2. 覆盖性

**已有**（`checkCase` → `checkCaseOf` → `elabCaseAlts` → `checkCaseDone` → `checkCoverage` /
`checkCovered`）：可达构造子必须写全（`DT: case is not exhaustive: missing <Ctor>`）、写了不
可达分支要拒（`DT: this branch is impossible (index constraints are unsatisfiable)`）、同构造
子重复（`DT: duplicate constructor in case`）、兜底只能最后（`DT: the catch-all branch must be
the last one`）；夹具 `dt_err/04_nonexhaustive`、`10_impossible`、`17_nested_total`。

**边界（不在 M16）**：嵌套模式 `Succ (Succ k)`（`bindCtorGo` → `DT: nested patterns are not
supported yet (M14 limitation)`）、多 clause（先被 `DT: definition parameters must be
variables (M13)` 拦，变量形重复才命中 `DT: multiple clauses are not supported yet (use a
single equation; M16)`，只把阶段标注改到后续阶段）。

**收紧两处**：(1) `unifyIdxRigid` 在 `VNeutral (NGlobal ...)` 对 `VCon` 时回落
`unifyIdxConv`、`conv` 失败即判不等，于是索引含**卡住归约**时可达分支被误判不可达（
`Vec Int (plus n Zero)` 的 `Nil` 分支实测报 `impossible`）；规则：只有**刚性冲突**（两侧都化
成构造子/字面量/宇宙且头不同）才判不可能，中性或燃料耗尽 ⇒ **未知**、按可达处理，故
`unifyIdx` 结果要细化成 `Unifiable` / `RigidClash` / `Unknown` 三值。(2) `checkCaseDone` 在
`hasCatchAll` 时短路全部覆盖率检查，「全覆盖后还加 `_`」被静默接受（实测退出 0，codegen 生
成 `| _ -> 2`）；规则：兜底不短路，全覆盖后多余的 `_` 报 `DT: redundant case alternative`。

## 3. 擦除分析（本阶段重点）

### 3.1 事实

`teleOf` / `splitKind` / `inferArgs` 的标志是 `erased = implicit || isTypeValue dom`，而
`isTypeValue` 只认「域是宇宙」，故**宇宙域擦除、索引域保留**：

| 输入（`test/corpus/dt/`） | 生成的类型声明 | 说明 |
| --- | --- | --- |
| `10_vec.vuna`：`Cons : (a : Type) -> (n : Nat) -> ...` | `and 'a t_Vec = C_Vec_Nil \| C_Vec_Cons of 'a t_Nat * 'a * 'a t_Vec` | **长度索引成 `'a t_Nat` 字段** |
| `17_erase.vuna`：隐式版 `{n : Nat}` | `and 'a t_Vec = C_Vec_Nil \| C_Vec_Cons of 'a * 'a t_Vec` | 隐式索引已擦 |
| `12_eq.vuna`：`Refl : (a : Type) -> Eq a a` | `and 'a t_Eq = C_Eq_Refl` | 证明族零字段 |

结论：**隐式索引已免费擦掉，剩余开销全在显式索引**，每个 `Cons` 多一个 `t_Nat` 装箱。

### 3.2 关键约束：不能无条件擦索引

反例即 `10_vec.vuna` 的 `vlen`：`vlen a n xs = case xs of Nil b => 0 | Cons b m y ys => 1 +
vlen b m ys`，`m` 被当实参传下去，索引在运行时**真的被读**；无条件擦的版本编译期即报
`DT: type-level binding 'm' is used at runtime (M13 limitation)`。`Elab.vuna` 中
`eraseIndexMask` 上方注释记录的正是这条事实。

### 3.3 整程序判定

(a) **族内**：参数不出现在任何构造子的**非索引字段域**、只在结果索引位置——已由
`eraseIndexMask` / `paramUsedInFieldTys` 实现（de Bruijn 位置比较，跳过前 `arity` 个
binder）。(b) **整程序**：参数**从不流到运行时位置**（不作函数/构造子实参、不被 `case` 绑定
后在运行时位置使用）。两者取交即 mask；伪代码（环境为「最近绑定在前」的
`(变量名, 是否擦除)`，进到 erased 位置的实参不算运行时读取）：

```
finalMask datas defs =
  map (\d => Pair (dtDataName d)
              (zipWith (\i cand => cand && not (memName (tagOf (dtDataName d) i) (indexReads defs)))
                       (rangeInt (length (dtDataParams d))) (eraseIndexMask d))) datas

indexReads defs = concatMap (\d => termReads [] (dtDefBody d)) defs   -- 元素写作 "F#i"

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

工程简化（**建议先做**）：不追踪来源，只判「该族索引参数是否在**任何** `TApp`/`TCon` 的非
擦除实参位置或 `TCase` 分支体里被读」；索引进入运行时位置只有「从构造子字段绑定出的变量」与
「显式传参」两形态，都被 `TVar` 覆盖，故保守（多留字段）但不会错擦。

### 3.4 codegen 改动点

| 位置（`CoreCodegen.vuna`） | 现状 | 改动 |
| --- | --- | --- |
| `ctorFieldTys` / `ocamlFieldTy` | 前者按 `dtCtorTelescope` 的 `erased` 跳过字段，后者把索引域回落成 `'a`（即 `'a t_Nat`） | 逻辑不动；靠 §3.3 mask 经 `eraseParamsWith`（`e \|\| m`）把 telescope 标志改对，字段数与类型自动对齐 |
| `genConApp` / `genConArgs` | 已按 `TApp`/`TCon` 的 `erased` 跳过实参 | 构造子索引实参标志跟 mask 走：隐式索引已由 `inferArgs` 的 `isIndexDomain` 标 `True`；**显式**索引实参当前是 `isTypeValue dom`（False），新增按 `finalMask` 覆写 |
| `genArm` / `altEnv` / `armPatternText` | 分支绑定按精化期 `caseAltBinders` 的顺序与标志 | **必须重对齐**：`CaseAlt` binders 是擦除前记录的，索引擦掉后 pattern 要少绑字段。新增 `alignAltBinders`，用已含 mask 的 `dtCtorTelescope` 的 `erased` 覆盖 `caseAltBinders`，只有 `False` 位置进 pattern；分支体仍按 de Bruijn index 引用 |

`genCase` 的兜底 `| _ -> failwith "DT: impossible branch"` 是既有防御臂，不因擦除改变。

### 3.5 验收

1. **语义不变**：`test/corpus/dt/*.vuna` 全部 17 个夹具，`interp --dt` 的 stdout 与
   `compile --dt` → `ocamlopt` → 运行的 stdout 逐字节相同（`test/run-tests.sh` 第 34 段按
   `.out` golden 比对，必须保持绿色）。
2. **表示真变小**：`10_vec.vuna` 的 `C_Vec_Cons` 字段数 3 → 2，
   `grep -c "C_Vec_Cons of 'a t_Nat" out.ml` 为 0；`.ml` 从 2089 字节下降（`17_erase.vuna`
   的 1737 字节是隐式版本下界参考）。
3. **不能擦的不许擦**：`vlen` 这类仍须生成 `t_Nat` 字段且不报 `DT: type-level binding ...
   is used at runtime`；关掉 `indexReads`（无条件擦）必须能复现该报错——即反例测试。
4. **诊断保留**：`eraseIndexMask` / `indexErasureCandidates` 继续作为「理论上可擦但当前仍保
   留」的诊断入口导出，供 `vuna map` / lint 使用。

## 4. 实现 checklist

| # | 文件 | 函数 | 改什么 |
| --- | --- | --- | --- |
| 1 | `Elab.vuna` | `unifyIdx` / `unifyIdxRigid` | 结果区分刚性冲突与卡住/燃料耗尽；`if fuel <= 0` 从 `Ok acc` 改为 `DT: index unification ran out of reduction fuel` |
| 2 | 同上 | `checkCovered` / `elabConAlt` | 只有刚性冲突才判不可达/不可能，未知按可达 |
| 3 | 同上 | `checkCaseDone` / `hasCatchAll` | 兜底不再短路覆盖率；全覆盖后多余的 `_` 报 `DT: redundant case alternative` |
| 4 | 同上 | `elabBodies` | `multiple clauses ... (use a single equation; M16)` 的阶段标注改到后续阶段 |
| 5 | 同上 | 新增 `indexReads` / `finalMask` | 整程序判定 (b)，与 `eraseIndexMask` 取交 |
| 6 | 同上 | `applyIndexErasure` / `eraseParamsWith` | 把 `finalMask` 真正作用到 `DtData`，在 `elabProgramFull` 返回 `DtProgram` 前执行（当前 `datas1` 原样传出） |
| 7 | 同上 | `teleOf` / `teleOfType` / `splitKind` / `inferArgs` | 构造子显式索引实参的 `erased` 按 `finalMask` 覆写 |
| 8 | `CoreCodegen.vuna` | `ctorFieldTys` / `ocamlFieldTy` | 逻辑不动，靠改对的 telescope 标志生效；补「字段数 == telescope 非擦位置数」一致性断言 |
| 9 | 同上 | 新增 `alignAltBinders`，供 `genArm` / `altEnv` / `armPatternText` | `CaseAlt` binders 按擦除后 telescope 重对齐，pattern 少绑索引位置 |
| 10 | 同上 | `genConApp` / `genConArgs` | 与 #7 标志一致，跳过被擦索引实参 |
| 11 | 同上 | `prepareDtProgram` / `checkErasure` | `checkErasure` 只允许 `erased` 绑定出现在被擦位置；正常路径不再出现 `M13 limitation` 文案 |
| 12 | `test/corpus/dt/`、`dt_err/` | 新增夹具 | 显式索引 `Vec`（擦除后无 `t_Nat` 字段）+ `vlen` 形（索引真被读、保住字段）；冗余兜底反例 |
| 13 | `docs/reference/limits.md`、`dt.md` | — | 记录 §1 互递归缺口、§2 边界、§3 索引擦除现状 |

## 5. 性能预算（`nix/metrics.budget` 不变）

预算聚合 `vuna compile --package` 的 **compiler 包闭包**（seed 闭包），是 **HM typed codegen** 的产物；擦除只改 `--dt` 单文件输出，不进 seed、不进包级 compile，故 M16 **不需要重新标定**（bytes 1120000 / lines 10500 / maxline 12400 / longlines 3890 / letrec 575 / strcat 320 / eqint 35 / zeroarg 30 / ctorcount 2200）。`dt_elab` 基准（`nix/bench.sh` 的 `compile --dt --no-print test/corpus/dt/03_compose.vuna`）不得回归：`docs/dt-core.md` §10 记录 M13 完成时约 2 ms，本机实测 3–4 ms（5 次取样 `3/4/3/4/3` ms，`date +%s%N` 计时）；§3.3 的 `indexReads` 是一次线性遍历，量级远小于精化本身。`nix run .#vuna-bench -- --quick` 是手动基准（不进 CI）。

## 6. 已知例外（M16 当时的记录；已迁入 limits 与 roadmap M22.x）

1. 互递归与跨调用 size-change 不查 ⇒ 可能接受死循环程序（`check --dt` 通过、运行时挂死）。
2. 嵌套模式、多 clause 不支持 ⇒ 覆盖性只在「单层构造子模式 + 单 equation」内成立。
3. 索引擦除只到诊断级 ⇒ 显式索引仍带 `t_Nat` 字段；隐式索引已擦。
4. 兜底 `_` 的求值器与 codegen 语义不一致（`interp --dt` 报 `DT: main does not reduce to a
   value`，编译产物打印 `2`）：先修 `Core.applyCaseAlt` 的兜底匹配（`vCaseAltName` 为空串的
   分支应命中任意 `VCon`）再放开 `_`。
