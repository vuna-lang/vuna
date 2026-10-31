# 自举迁移决策（M18）

本文是 M18「自举迁移（决策点）」的记录：**做到了什么、验证了什么、还差什么、以及
编译器本体是否应该继续迁到 DT**。设计背景见 [docs/dt-core.md](../dt-core.md)，
路线图见 [docs/roadmap.md](../roadmap.md)。

## 1. 结论（决策）

**决策：编译器本体暂不全量迁移到 DT；DT 作为「用户语言 + 逐步 dogfooding」保留。**

理由（按权重）：

1. **擦除仍未完成**。索引目前保留运行时表示（`Vec a n` 的 `Cons` 带 `t_Nat` 长度字段），
   M16 的探测确认索引在 `vlen` 这类定义里**真的被运行时读取**，不能无条件擦。把编译器
   迁到 DT 会显著增大生成代码（metrics 已因 M15–M17 精化器代码从 1.12MB → 1.18MB），
   与「编译器自身性能不回归」的硬门槛冲突。
2. **DT 仍是单文件 opt-in**。`--dt` 不支持 `import` / `--root` / 包模式，而编译器是
   跨 21 个模块、约 14.5k 行的多模块包。要让编译器本体用 DT，**先要让 DT 支持多文件**
   ——那是独立的一大块工作（M20 模块系统 v3 前后），不是 M18 一次能收口的。
3. **收益集中在少数模块**。DT 的价值在「用类型表达不变量」（de Bruijn 上下文良构、
   替换/弱化引理）。这些集中在 `Core` / `Elab`，而它们已经**用 HM + 显式检查**表达得
   足够清楚；全量迁移的边际收益 < 迁移风险（可能暴露 DT 的终止性/擦除/性能问题）。
4. **roadmap 自己的决策闸门**：若 DT 仍不可用/性能不可接受，保留 HM 编译器并只把 DT
   作为用户语言，不强行全量迁移。当前正落在这个分支上。

因此 M18 的实际交付是：**完成 seed rotation（让 DT 精化器进入信任锚点）+ 验证 DT
足以表达编译器关键不变量 + 用可执行的夹具固定这个结论**，并把「全量迁移」显式标记为
需要前置条件（DT 多文件 + 完整擦除）的后续工作。

## 2. 已完成：seed rotation

M15–M17 的 DT 精化器全部是**普通 HM 源码**（`compiler/lib/Vuna/Compiler/{Core,Elab,
CoreCodegen,Dt}.vuna`），因此它们本来就在 compiler 包闭包里、随 seed 一起进入 TCB。
M18 执行了正式的 rotation 让这些改动进入信任锚点：

```console
$ sh nix/seed-rotate.sh ./result/bin/vuna
wrote 60 files to seed
seed-rotate: 已生成 seed/（61 个文件）
seed-rotate: 种子自生成 fixed point 通过（文件集逐字节一致）
```

rotation 后的验证：

| 检查 | 结果 |
| --- | --- |
| 旧种子能编译新源码（rotation 前提） | 通过 |
| `nix build .#vuna-seed`（stage 0） | 通过 |
| `nix build .#vuna-compiler`（stage 1） | 通过 |
| `nix build .#vuna`（产品 CLI） | 通过 |
| stage1 == stage2（fixed point，逐字节） | 通过 |
| seed 模块数 | 31（不变；`Lsp`/`Json` 未进闭包） |
| TCB blacklist | `Lsp` / `Json` 已加入 `nix/seed-rotate.sh` 与 `flake.nix` |

**seed 闭包纯净性**：新增的 `lib/Vuna/Lsp.vuna`、`lib/Vuna/Json.vuna` 是根包工具链，
不在 `compiler/app/Main.vuna` 的 import 闭包里，因此**没有**进入 seed；已通过
rotation 脚本与 `flake.nix` 的 forbidden 循环断言。

## 3. 已完成：用 DT 表达编译器不变量（可执行验证）

M18 用可运行的夹具验证了「DT 足以表达编译器里最关键的那类不变量」：

`test/corpus/dt/18_ctx.vuna`——**de Bruijn 上下文良构**：

```vuna
data Ctx : Type -> Nat -> Type where
  Empty  : {a : Type} -> Ctx a Zero
  Extend : {a : Type} -> {n : Nat} -> Ctx a n -> a -> Ctx a (Succ n)

-- 已知非空的上下文里取最近绑定：类型保证不会越界。
head : {a : Type} -> {n : Nat} -> Ctx a (Succ n) -> a
head c = case c of
  Extend rest x => x

clen : {a : Type} -> {n : Nat} -> Ctx a n -> Nat
clen c = case c of
  Empty => Zero
  Extend rest x => Succ (clen rest)

three : Ctx String (Succ (Succ (Succ Zero)))
three = Extend (Extend (Extend Empty "a") "b") "c"
```

这里同时用到了 M14–M16 的全部能力：

- **索引归纳族**（M14）：`Ctx` 的长度是索引；
- **隐式参数与索引推断**（M15）：`Extend (Extend Empty "a") "b"` 不需要手写长度；
- **不可达分支省略**（M14）：`head` 只写 `Extend`，`Empty` 被索引排除；
- **终止性检查**（M16）：`clen` 的结构化递归通过。

三条路径一致：`interp --dt` 输出 `2`，`check --dt` 通过，`compile --dt` + `ocamlopt`
运行输出 `2`。

## 4. 未完成：全量迁移的前置条件

要让「编译器本体使用 DT 子集」成立，还缺三件（按依赖顺序）：

1. **DT 多文件 + 模块/包集成**（当前 `--dt` 是单文件 opt-in）：
   `--dt` 需支持 `import`、`--root`、包模式，并被 `build` / `split` / `seed` 接受。
   这是 M20（模块系统 v3）附近的工作，M17 的 roadmap 已把它列为 DT 进包模式的门槛。
2. **完整擦除分析**（M16 只做到诊断级）：索引/证明不在运行时出现，才能让 DT 版编译器
   的生成代码规模不劣于 HM 版。见 `docs/reference/m16-design.md` 的擦除判定与 codegen
   改动点。
3. **DT 侧的模块级名字解析与循环检查**：现有 `Loader` 是 HM 专属；DT 走自己的精化器，
   跨模块引用需要一套平行的解析/可见性规则。

在这三件完成前，把编译器迁到 DT 会**同时**违反「性能不回归」与「seed 只含 compiler
闭包」两条硬约束。

## 5. 现有 dogfooding：DT 已经被编译器自己用到哪一步

「DT 作为用户语言、编译器自己写 DT 代码」目前只在**编译器内的 DT 模块**这一层成立：

- `Core` / `Elab` / `CoreCodegen` / `Dt` 是用 HM 写的**DT 实现**（不是用 DT 写的）；
- 真正用 DT 语言写的东西是夹具（`test/corpus/dt/*.vuna`，18 个正例）；
- `vuna goal` / `vuna lsp` 让这些 DT 代码的开发体验接近可用（洞目标、诊断、hover）。

也就是说：**编译器能跑 DT，但编译器本身还没跑在 DT 上**。这个边界是 M18 决策的直接
结果，不是遗漏。

## 6. 后续路线建议

按优先级：

1. DT 多文件 + 包集成（前置：M20 模块系统 v3 的签名匹配）；
2. 完整擦除（前置：整程序使用分析，见 M16 设计稿）；
3. 从 `Core` 的 de Bruijn 辅助函数开始小范围用 DT 重写（`shift` / `subst` 这类
   纯函数、易验证终止性的部分）；
4. 只有在 1–3 完成并且 metrics 不回归后，才考虑更大范围的迁移。

## 相关阅读

- DT 语言参考：[dt.md](reference/dt.md)
- DT 工具链：[dt-tooling.md](reference/dt-tooling.md)
- DT 设计与实现边界：[docs/dt-core.md](dt-core.md)
- 自举链与 seed：[reference/bootstrap.md](reference/bootstrap.md)
- 路线图：[docs/roadmap.md](roadmap.md)
