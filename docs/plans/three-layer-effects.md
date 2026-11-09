# 三层效应系统：运行时续延（one-shot）+ 行 + 命名实例

> 历史计划存档：本文件来自 2026-11-06 本 session 最后一次 `exit_plan_mode`
> （session event seq 1030，turn 11）。review 被 dismiss，但用户随后以
> “新建worktree,实现”批准并执行；此后作为交付清单使用。

> 进度快照（2026-11-07，W7/W9/W10 残项收口）：
> - W1–W11 全部完成；W7 一次性闭包/捕获规则（`mkCont`）、通用 `bracket`/`finally`
>   的 abort cleanup（每纤程 cleanup 栈）、D45；W9 Mutex/Semaphore、线性 `TaskLin`
>   （恰好一次 await/cancel）、`forkTaskWith` 显式 handler；W10 原生 `prim_sleep` 并
>   切换 `Base.EffClock`/`Base.IO.sleepMicros`、fs 命名实例 `F1`/`F2`、可控 `Exit`、
>   `vuna version` console 标签路径。
> - 验证：`nix flake check` 全过（seed-selfhost、context-budget、lint/fmt/typecheck、
>   vuna-tests、compiler-perf/growth 等）；seed rotation fixed point；snapshots 刷新。
> - 已知边界（D41–D45）：无通用线性箭头/多重性多态；TaskLin 不保证资源释放；
>   Mutex/Semaphore/Channel 为 cooperative 忙等；取消只挂起点生效；无父 fiber
>   handler 继承；W10 仍无编译器级「只能经标签」强制（D43）。

# 三层效应系统：运行时续延（one-shot）+ 行 + 命名实例

## 0. 决策摘要

用户已确认：

1. **不做多射**：续延语义是一次性（one-shot）。OCaml 5 `Effect.Deep` 正好；resume 两次
   由运行时拒绝（后续由线性类型在编译期拒绝）。HTTP/Web 事件监听不需要多射；回溯/概率/
   重放/续延式 UI 重入等场景若未来出现，另立运行时项目，不进入本计划。
2. **`Eff` 去掉世界令牌**：不再是 `Int -> a` 的“世界令牌 thunk”，而是**抽象动作**
   （内部用私有 dummy 参数 `EffUnit -> a` 表示，仅为延迟执行，不传递世界状态）。
3. 三层架构：
   - **Layer 1 核心**：运行时续延 + 行 + 命名实例 + 一阶效应；
   - **Layer 2**：高阶/作用域效应（类型系统 + handler 协议），仍跑在 one-shot 上；
   - **Layer 3**：并发/async（调度器 + `Fork`/`Await`/`Cancel` + 结构化作用域 + 线性资源）。
4. 效应标签**不用闭合 `data EffectLabel`**：标签 = 效应类型构造子（开放世界），行是
   Type-1 数据；命名实例 = 效应参数/运行时 name 值。用户新增效应/实例无需改中心表。
5. 前一版 `Base.Eff` CPS 闭效应计划**作废**；本计划取代之。

## 1. 目标与总验收

最终用户能写：

```vuna
-- 两个同名 State 实例：行里以 name 区分
prog : Eff (State Cnt1 Int :: State Cnt2 Int :: Fs :: r) Int
prog = do
  x <- get Cnt1
  put Cnt2 (x + 1)
  s <- fsReadFile "a.txt"
  pure (byteLength s)

main : IO Int
main = runIO (handleFs (handleState Cnt2 (handleState Cnt1 prog)))
```

验收：

- 行/命名实例在类型层可跟踪、可组合、可移除；缺效应/缺 handler 是编译期错误；
- 一阶效应真实 handler 与 mock handler 可替换；
- Layer 2 能写 `catch`/`local`/`bracket`；
- Layer 3 能写结构化并发与取消；
- 运行时续延走 OCaml 5 effect handler；`vuna interp` 对效果程序报“需 compile+run”；
- seed/TCB/CI 规则不变，运行时生成物变化走 rotation。

## 2. 架构

### 2.1 Layer 1：核心（本计划第一批）

#### 行与标签（开放世界）

```vuna
data Row : Type 1 where
  Nil  : Row
  Cons : (Type -> Type) -> Row -> Row
```

已实测：`Cons Fs Nil`、`Cons (State C1 Int) ...` 均可编译；行只做索引时会被擦除。

#### 效应定义（用户/库各自声明）

```vuna
data Fs : Type -> Type where
  ReadFile  : String -> Fs String
  WriteFile : String -> String -> Fs Int

data Name : Type where
  Cnt1 : Name
  Cnt2 : Name

data State : Name -> Type -> Type -> Type where
  Get : {n : Name} -> {s : Type} -> State n s s
  Put : {n : Name} -> {s : Type} -> s -> State n s Int
```

- 标签是 `Type -> Type` 的构造子；`State Cnt1 Int` / `State Cnt2 Int` 是不同行条目。
- 命名是参数（值/类型）；用户在自己的模块里新增效应/name，编译器不需要登记表。

#### 动作与行族

```vuna
data Eff : Row -> Type -> Type where
  MkEff : {r : Row} -> {a : Type} -> (EffUnit -> a) -> Eff r a
-- EffUnit 是 Base.Eff 私有 dummy；构造子 MkEff 不导出；没有世界令牌语义
```

```vuna
Mem : (Type -> Type) -> Row -> Type
Mem e Nil = No
Mem e (Cons e r) = Yes
Mem e (Cons x r) = Mem e r

Rem : (Type -> Type) -> Row -> Row
Rem e Nil = Nil
Rem e (Cons e r) = r
Rem e (Cons x r) = Cons x (Rem e r)
```

（已实测非线性类型族模式可正确归约；`No` 为空族。）

#### API

```vuna
pure  : a -> Eff r a
bind  : Eff r a -> (a -> Eff r b) -> Eff r b

send  : {e : Type -> Type} -> {x : Type} -> {r : Row}
     -> Member e r => String -> Int -> e x -> Eff r x

data Handler : (Type -> Type) -> Type -> Type -> Type where
  MkHandler : {e : Type -> Type} -> {a : Type} -> {b : Type}
           -> (a -> b)
           -> ({x : Type} -> e x -> (x -> b) -> b)
           -> Handler e a b

handle : {e : Type -> Type} -> {a : Type} -> {b : Type} -> {r : Row}
      -> Member e r => String -> Int
      -> Handler e a b -> Eff r a -> Eff (Rem e r) b
```

- `String` = 效应字面 key（由效应模块给，如 `"fs"`/`"state"`）；`Int` = 运行时 name 码
  （`Cnt1`/`Cnt2` 的稳定编码；无名效应用 0）。key 不在类型层，不需要 type codes。
- `Member`/`Removed`/`Union` 是**内建行约束**（语法同 trait 约束），不是用户 trait：
  - 具体行：归约 `Mem` → `Yes`/`No`；
  - 刚性行变量：要求在签名里写 `Member e r =>`，作为隐式证据参数传递（擦除；
    运行时不依赖它，因为 key 由字面量+name 给出）；
  - 修正当前隐式空类型被静默放行的问题：约束实参必须“求解或来自局部假设”。
- 行约束用内建而不用多参数 trait：类实例的 overlap/刚性类型相等等在行上不可靠；
  多参数 trait 仍是独立升级项（见 §4）。

#### 运行时

`Vuna_runtime.ml` 增加（已用 OCaml 5.5.1 原型验证）：

```ocaml
type _ Effect.t += Perform : string * int * Obj.t -> Obj.t Effect.t

effect_perform key name v : Obj.t =
  Effect.perform (Perform (key, name, Obj.repr v))

effect_handle key name
    (h : Obj.t -> (Obj.t -> Obj.t) -> Obj.t)
    (th : EffUnit -> Obj.t) : EffUnit -> Obj.t =
  fun u ->
    Effect.Deep.match_with (fun () -> th u) ()
      { retc = (fun x -> x);
        exnc = (fun e -> raise e);
        effc = fun (type a) (eff : a Effect.t) ->
          match eff with
          | Perform (k, n, payload) when k = key && n = name ->
              Some (fun cont ->
                h payload (fun v -> Effect.Deep.continue cont (Obj.repr v)))
          | _ -> None }
```

- `None` 把未匹配的 effect 交给外层 handler；顶层（`main` 钩子）装兜底 handler，
  逃逸的 `Perform` 报 `vuna: runtime error: unhandled effect <key>#<name>` + 位置帧。
- `continue` 只允许一次（一次性）；resume 两次 → `Continuation_already_resumed`，
  兜底报告。
- `prim_effectPerform` / `prim_effectHandle` 是隐藏 intrinsic（不进 prelude、无能力位）；
  `Base.Eff` 的 `send`/`handle` 用 `Obj.t` + M39 的 cast 包装成类型安全 API。
- `Eff` 的 `bind`/`pure`/`send`/`handle` 是库函数；没有递归解释器，总语言终止性无压力。

#### 命名实例

- 效应模块提供 `nameCode : Name -> Int`（或构造函数标签）；`get cnt1` / `handleState cnt1`
  用同一个码。
- `State Cnt1 Int` 与 `State Cnt2 Int` 在行里是不同条目；`Mem`/`Rem` 靠类型/值索引区分。
- key 冲突由效应模块负责（字面量 + name 码）；文档约定。

### 2.2 Layer 2：高阶/作用域效应（one-shot）

- 扩展效应接口：op payload 可含**子计算** `Eff r a`（如 `Catch`、`Local`、`Bracket`）。
- Handler 协议：
  - handler 可运行子计算，并**临时安装/恢复** handler 栈（scoped handler）；
  - 类型上对子计算的行做量化/减法（`catch` 内层 `Exn :: r`，外层 `r`）；
  - 资源安全（`bracket` 的 finally/masking）。
- 运行时：在 `Effect.Deep` 之上增加 shallow/嵌套安装能力；用 `continue_with`/
  显式 handler 栈实现作用域；仍是一次性续延。
- 首批交付：`catch`（异常）、`local`（Reader）；`bracket` 视资源/线性进度。
- 类型系统是主要难点；运行时 OCaml 5 一次性 handler 足够。

### 2.3 Layer 3：并发/async

- **调度器/纤程**：基于 one-shot 续延；`Fork`/`Await`/`Yield`/`Sleep`/`Cancel` 作为效应；
  handler/scheduler 负责排队与恢复。
- **结构化作用域**：`async`/`await` 的 scope、取消传播、超时；依赖 Layer 2 的作用域
  handler。
- **线性资源**：取消令牌、`Mutex`/`Channel`、`bracket` 的 exactly-once 清理；依赖
  QTT 线性箭头（§4）。
- **IO 迁移**：`fs`/`console`/`process`/`clock`/`env` 标签化；handler 调 `prim_*`；
  `IO` 保留为运行时基座/逃逸口（FFI、main、unsafe、未标签化原语）；`Base.IO` 退为底层。
- 并行/多核（OCaml domains、内存模型）不在本层首版，单独评估。

## 3. 工作项与依赖

| 项 | 内容 | 依赖 | 验收 |
| --- | --- | --- | --- |
| **W1 运行时** | `Perform`/`perform`/`handle`；隐藏 intrinsic；main 兜底；一次性 | — | 生成程序 perform→handle→resume；未处理效应报错；OCaml 5 链接 |
| **W2 行/动作** | `Row`、`Eff`（私有 dummy，无令牌）、`pure`/`bind`、`Mem`/`Rem` | W1 | 行擦除；`Mem` 正负例；`interp` 对效果程序报错 |
| **W3 行约束** | 内建 `Member`/`Removed`/`Union`；归约/提升/诊断；修隐式空类型放行 | W2 | 泛型 `Member e r =>`；具体行自动求解；缺成员编译错误 |
| **W4 命名效应/handler** | `State`/`Fs` 模块；`get`/`put`/`fsReadFile`；`Handler`/`handle`；两个同名实例 | W1–W3 | 两路独立 State；handler 移除各自条目；真实/mock fs |
| **W5 核心语义** | abort、一次性、嵌套、key 过滤、未处理 | W4 | abort 返回 handler 的 `b`；二次 resume 报错；嵌套正确 |
| **W6 高阶/作用域** | op 含子计算；scoped handler；`catch`/`local` | W5 | 行多态子计算；作用域安装/恢复；异常/环境正确 |
| **W7 线性** | QTT 线性箭头/多重性；resume 线性；资源安全基础 | W6（可并行） | resume 两次类型错误；线性 handler 通过；`bracket` 基础 |
| **W8 多参数 trait** | `trait C a b`、N 参字典/投影/实例头/搜索/相干性、`C a b =>` | W3（约束解析） | 多参数用户 trait 正负例；单参不回归 |
| **W9 并发** | 调度器、`Fork`/`Await`/`Cancel`/`Yield`、结构化作用域、取消/超时 | W6/W7 | echo/生产者-消费者；取消清理；无泄漏 |
| **W10 IO 迁移** | fs/console/process/clock/env 标签；`IO`/`Unsafe` 退底层 | W4/W9 | 同程序真实↔mock；既有 IO 夹具不回归（库层已完成：`Base.Eff*` + `dt_base/26–30`；残项收口：`prim_sleep`、fs 命名实例、可控 `Exit`、工具链一条 console 路径，见 effects.md §8.6；剩余编译器级强制与 `Base.IO.sleepMicros` 切换归 D43） |
| **W11 收尾** | 诊断、文档、性能、seed rotation、TCB、context budget | 全部 | `nix flake check` 仅剩已知 C43；seed-selfhost 通过；rotation 单独提交 |

## 4. 编译器/运行时改动面

- `compiler/lib/Vuna/Compiler/Codegen/Term.vuna`：runtime 文本 + 隐藏 intrinsic 映射。
- `compiler/lib/Vuna/Compiler/Intrinsics.vuna`：`prim_effectPerform`/`prim_effectHandle`
  （隐藏；无能力位）。
- `compiler/lib/Vuna/Compiler/Driver` / main 钩子：顶层未处理效应报告。
- `compiler/lib/Vuna/Compiler/Elab/*`：
  - 行约束 `Member`/`Removed`/`Union` 的解析、求解、提升、诊断（W3）；
  - 多参数 trait 的字典/投影/实例搜索/相干性（W8）；
  - 线性箭头/多重性（W7，QTT 扩展）。
- `compiler/lib/Vuna/Compiler/Elab/Trait.vuna`：保留并扩展上一轮已知的两处修复
  （实例头小写全局名、构造子 kind 推断）。
- `base/lib/Base/Eff.vuna`：`Row`、`Eff`、`Mem`/`Rem`、`send`/`handle`、`Handler`。
- `base/lib/Base/Eff/State.vuna`、`Fs.vuna`、`Exn.vuna`、`Reader.vuna` 等效应模块。
- `base/vuna.toml` `[export]` 增列；`Base` 门面/Prelude 仍不自动注入效应（显式 import）。
- `seed/`：runtime 文本变化会改变生成物 → 按需 rotation（单独 `chore(seed)`）。

## 5. 测试矩阵

- **W1**：`dt/87_runtime_effect`（perform/handle/resume/abort/未处理）。
- **W2**：`dt/88_eff_rows`（Type-1 行、`Mem` 正负例、行擦除）。
- **W3**：`dt_err/61_missing_member`（缺成员）；`dt/89_row_poly`（泛型 `Member e r =>`）。
- **W4**：`dt_base/16_eff_named_state`（`.nointerp`，两个 `State Int` 实例独立读写；
  handler 逐个处理；golden）。
- **W4**：`dt_base/17_eff_fs`（真实 fs handler ↔ mock handler）。
- **W5**：`dt_base/18_eff_abort`（abort/一次性/嵌套）。
- **W6**：`dt_base/19_eff_scoped`（`catch`/`local`）。
- **W7**：`dt_err/62_linear_resume_twice`（类型错误）；`dt_base/20_eff_bracket`。
- **W8**：`traits/xx_multi_param_*`（正/负/相干性）。
- **W9**：`dt_base/31–35`（fork/await 顺序与结构化 scope、取消清理、步数超时、失败监督、重复 await）、负例 `dt_err/76`（任务行非 `Nil`）；echo/生产者-消费者需要通道（D44，未做）。
- **W10**：fs/console/process/clock/env 真实与 mock 对拍；收尾：`dt_base/37`（fs 命名实例
  mock/real 并存）、`dt_base/38`（`Exit` 可观察）、`dt_err/77`（fs 实例名不匹配）、
  `packages/10_prim_io`（原生 `prim_sleep` 探针）。
- 全量：`vuna check .`、`nix run .#vuna-run-tests`、`nix flake check`（对比 C43 基线）、
  `fmt --check`、`lint`、seed-selfhost。

## 6. 风险与限制

- **一次性**：无 backtracking/概率/重放；这类需求未来单独立项，不改本核心。
- **Type-1 行 codegen**：D27 残留；行只做擦除索引，若进运行时位置会报错；需要 cast/
  抽象隔离并加回归夹具。
- **高阶 kind 字段**：`e : Type -> Type` 只能做族参数/索引；`Handler` 若字段 sort 超限，
  改为族参数 + 不透明 `Obj.t` 内部表示（M39）。
- **约束求解**：`Member` 求解器范围限定在 `Mem`/`Rem`；必须修掉隐式空类型放行，
  否则 `send` 会接受行外效应。
- **多参数 trait / 线性**：两个大编译器特性，会改字典 schema、实例搜索、用量检查；
  需要 seed rotation 与全量回归。
- **性能**：OCaml 5 effect + 字符串 key；先正确后优化（one-shot 优化是后续）。
- **`vuna interp`**：纯求值器不能执行运行时效应；效果夹具只用 `check` + `compile` + run
  （`.nointerp`），文档明确。
- **依赖类型 + 行 + handler + 线性** 属研究边缘；第一版限定一阶效应，Layer 2 再做
  higher-order/scoped。

## 7. 非目标

- 多射续延、运行时栈复制。
- 并行/多核/内存模型（Layer 3 只做单线程调度器与结构化并发）。
- 类型码（Tarski `Ty`/`Tm` 上移）。
- 自动行推断/行子类型（显式 `Member e r =>` 起步）。
- 闭合 `data EffectLabel`、闭合效应库作为终态。
- `Prelude` 自动注入效应模块（显式 import）。

## 8. 执行开始（approval 后第一步）

1. **新建 worktree**：`create_worktree`，分支/目录名 `runtime-effects`，从当前 `HEAD`
   创建；后续所有实现在该 worktree 内进行，不碰 `main` 工作树。
2. 按 M1（W1→W5）依次落地；每个 W 一个独立 commit（`feat(effects): ...` /
   `feat(elab): ...`），worktree 内本地验证：
   - `nix build .#vuna --out-link result`（旧 seed 能编译新源码）；
   - 目标夹具 check/compile/run；
   - `nix run .#vuna-run-tests`；
   - `./result/bin/vuna fmt --check` / `lint` 改动文件；
   - `vuna check .`；`nix flake check` 对照 C43 基线。
3. M1 完成后由用户/Lead review；需要 rotation 时单独 `chore(seed)`。

## 9. 里程碑与交付

- **M1（本次）**：W1 + W2 + W3 + W4 + W5。交付运行时续延（OCaml 5，一次性）、
  行/命名实例/一阶效应、双 `State Int` 实例、fs mock/real、行约束与诊断、夹具与最小文档。
- **M2**：W6 + W7（高阶/作用域 + 线性）。
- **M3**：W8 + W9 + W10（多参数 trait、并发、IO 迁移）。
- **M4**：W11（文档、性能、seed、TCB、CI）。

第一批文件级落点：

1. `compiler/lib/Vuna/Compiler/Codegen/Term.vuna`（runtime 文本）
2. `compiler/lib/Vuna/Compiler/Intrinsics.vuna`（隐藏 prims）
3. `compiler/lib/Vuna/Compiler/Driver`/main hook（未处理效应兜底）
4. `compiler/lib/Vuna/Compiler/Elab`（`Member`/`Removed`/`Union` 行约束）
5. `base/lib/Base/Eff.vuna`（Row/Eff/Mem/Rem/send/handle/Handler）
6. `base/lib/Base/Eff/State.vuna`、`Fs.vuna`
7. `base/vuna.toml` `[export]`
8. 夹具 `test/corpus/dt/87–89`、`dt_base/16–18`、`dt_err/61`
9. 最小文档：`docs/reference/effects.md` 重写（三层架构、one-shot、行/命名、无令牌、
   一次性限制）、`stdlib.md`、`roadmap`、`debt`（D22/D27/D32 收窄 + 新一次性条目）、
   `architecture`、`AGENTS`/`README` 导航。

## 10. 与旧计划/硬不变量的关系

- 旧 `Base.Eff` CPS 计划取消；`Base.Eff` 名称保留，内容换成行/运行时版本。
- 硬不变量 5（IO 内建效应）本轮不改：`IO` 仍是运行时基座；Layer 3 才把用户 API
  迁到标签，`IO` 退为逃逸口。
- 硬不变量 1/2（seed）与 TCB：W1 改运行时生成物，预计触发 rotation；先确保旧 seed
  能编译新源码，再单独 `chore(seed)`。
- `vuna check .` 与全量测试是每批的硬门槛；`nix flake check` 对照已知 C43 基线。
