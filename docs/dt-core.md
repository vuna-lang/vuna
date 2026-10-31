# DT 核心类型论与精化器设计（M13）

本文是 M13 的设计稿与实现边界说明。M13 在 HM 路径之外新增一条**独立、显式 opt-in**
的依赖类型（DT）子集路径：Core TT + NbE + 双向精化器 + 擦除型 codegen。HM 路径
（interp / typed / split）语义与产物保持不变。

## 1. 范围

- 新增模块：`compiler/lib/Vuna/Compiler/Core.vuna`（core 语法/值/NbE/转换）、
  `compiler/lib/Vuna/Compiler/Elab.vuna`（双向精化器）、
  `compiler/lib/Vuna/Compiler/CoreCodegen.vuna`（擦除 + OCaml 生成）、
  `compiler/lib/Vuna/Compiler/Dt.vuna`（单文件 facade）。
- 入口：`vuna compile --dt` / `vuna check --dt` / `vuna interp --dt`。
- 只支持单文件：不经过 Loader、不支持 `import`、不支持包模式、不接入
  `build` / `split` / `seed`（M17 前 roadmap 允许 split 回退）。

**非目标（M13 不做）**：cumulativity / universe polymorphism、索引归纳族（M14）、
依赖模式匹配（M14）、接口/实例搜索/洞目标显示（M15）、终止性与覆盖性（M16）、
完整擦除分析（M16）、IO/effects（M19）、跨模块 import、`rewrite` / `with`。

## 2. Surface 子集

```vuna
-- 类型
Type            -- Type 0
Type 1          -- 任意非负字面量层级；EApp (EVar "Type") [EInt n]
A -> B          -- 匿名显式 Pi（沿用现有 `->` 中缀编码）
(x : A) -> B    -- 显式命名 Pi
{x : A} -> B    -- 隐式 Pi

-- 项
x | 42 | "s" | \x => e | f a b | if c then t else e | _
```

- 定义必须有签名：`f : T` 紧跟 `f p1 ... pn = body`；`pi` 只能是变量（`_` 视为
  不使用的变量）。无签名、多子句、非变量模式都报错。
- 洞 `_` 只在 check 位置合法；最终仍有未解元变量则报错。
- 语句级构造（`let` / `where` / `case` / `do` / 记录 / trait / data / 递归）暂不支持，
  诊断里写明"M13 不支持"。

## 3. Core TT

```vuna
data Term where
  TVar    : String -> Int -> Term      -- 名字（打印/生成用）+ de Bruijn index
  TMeta   : Int -> Term
  TGlobal : String -> Term
  TType   : Int -> Term
  TPi     : String -> Bool -> Term -> Term -> Term  -- 名字、是否隐式、域、余域
  TLam    : String -> Bool -> Term -> Term          -- 名字、是否擦除、体
  TApp    : Term -> Term -> Bool -> Term            -- 函数、实参、实参是否擦除
  TInt / TStr / TBool / TIf
```

- 绑定是否擦除由精化器按「绑定域的值是不是宇宙」决定：`a : Type` 擦除，
  `x : a` 保留。codegen 只读标志，不再需要类型信息。
- 值：`VType` / `VPi` / `VLam`（带 `Closure`）/ `VNeutral` / `VMeta m spine` /
  字面量 / `VIf`；neutral 头是 `NVar name level spine` 或 `NGlobal name spine`。

## 4. NbE 与定义性相等

- `eval`：call-by-name（closure + 环境），全局保持 opaque neutral。
- `force`：展开已解元变量，并按需 **delta 展开**有定义的全局（步数上限 512，
  到限返回 stuck，不 panic）；这样类型别名与 `main = id Int 42` 能归约。
- `conv`：结构比较 + Pi/Lam 的 eta（fresh var）+ neutral spine 逐项比较；
  元变量求解满足：一阶（只接受空 spine）、闭合解（解中不含局部绑定变量）、
  occurs check。失败返回 `type mismatch: expected X, got Y`。
- 明确限制：带局部变量的解与高阶元变量在 M13 报错，M15 引入 metavariable
  context 后补齐。
- 宇宙规则：非累积。`Type i : Type (i+1)`；Pi formation 取 `max(i, j)`；
  `Type i` 与 `Type j`（i≠j）不相等，因此 `Type 0 : Type 1` 合法而
  `bad : Type; bad = Type` 报类型不匹配。

## 5. 精化器规则

| 表面形式 | 规则 |
| --- | --- |
| `EVar x` | 局部：`TVar`（类型取上下文）；全局：`TGlobal`（签名域）；找不到报 unknown name |
| `_` | check：新建元变量；infer：报错 |
| 字面量 | `Int` / `String` / `Bool` |
| `\x => e` | 只支持 check：逐层消费显式 Pi；遇到隐式 Pi 自动绑定 |
| `f a b` | 推断 `f`，每个显式实参前插入隐式元变量，实参按域 check |
| `if c then t else e` | `c` check `Bool`，分支 check 期望类型 |
| `A -> B` / `(x:A) -> B` / `{x:A} -> B` | Pi formation：域/余域必须是类型；返回 `Type (max i j)` |
| `Type` / `Type n` | `TType 0` / `TType n`，类型是 `Type (n+1)` |

定义精化顺序：按源顺序精化全部签名（加入全局环境）→ 按源顺序 check 定义体
（已精化的定义体进入 delta 表）→ 检查未解元变量。因此前向引用的**类型别名**
暂不可用（签名阶段未见其定义），文档与测试按此约定。

## 6. 擦除与 codegen

1. 按「类型 force 后是否为 `VType _`」区分类型级定义与运行时定义；类型级定义
   不生成运行时代码（如 `Endo`、`f : (a:Type) -> Type`）。
2. 擦除检查：运行时项引用被擦除绑定 / 类型级定义 / `TPi` 时报错
   （`check --dt` 与 `compile --dt` 都跑）。
3. 运行时定义按 `TGlobal` 依赖拓扑排序；有环 = 递归 → 报错（M14/M16 再支持）。
4. 生成逻辑：擦除绑定不生成参数、擦除实参不生成参数；`TGlobal` → `v_<name>`；
   prelude 运算符映射到 `bi_add` / `bi_eq_int` / `bi_concat` 等既有运行时名字；
   输出自包含的最小 DT runtime（`bi_*` + `dt_show_string` / `dt_show_bool`），
   不依赖 `TypedCodegen`。
5. `main` 必须是 `Int` / `String` / `Bool`；`--no-print` 时只 `ignore`。

## 7. 与 HM 路径的边界

- 只共享 `Vuna.Compiler.Ast` / `Vuna.Compiler.Parser` / `Vuna.Fmt` 与 `Base.*`；
  `EPi` 在 HM 的 loader 里报 `dependent function type requires --dt`。
- `Vuna.Compiler.Dt` 是唯一对外 facade（`compiler/vuna.toml` 的 `[export]`）；
  核心求值器通过 `vuna interp --dt` 暴露，用于与 codegen 结果做一致性测试。
- M13 的 DT 不进入 `build` / `seed` / `split`；seed 仍只由 HM typed codegen 生成
  （DT 模块是普通 HM 源码，随 compiler 闭包进入 TCB）。

## 8. 诊断

所有精化诊断带 `文件:行:列` 前缀；关键消息见实现与测试夹具
（`test/corpus/dt_err/*.err`）。codegen 阶段错误（递归、运行时使用类型级绑定）
不带 span，M16 擦除分析再补位置。

## 9. 后续阶段接口

- M14：`data Vec : Nat -> Type where ...`、带 telescope 的构造器、依赖模式匹配；
  届时 Core 增加归纳族表示与 case 树，精化器增加索引 unification。
- M15：metavariable context、隐式搜索/接口、洞目标显示；替换 M13 的一阶求解限制。
- M16：终止性/覆盖性 + 真正擦除分析（替代 M13 的 codegen 期擦除检查）。

## 10. 基准（本机参考，非 CI 门槛）

`nix run .#bench -- --quick` 新增 `dt_elab` 项：对
`test/corpus/dt/03_compose.vuna`（Pi + 3 个类型参数擦除 + compose）跑
`compile --dt --no-print`（精化 + 擦除检查 + codegen）的耗时。

- 本机（M13 完成时）：`dt_elab` ≈ **2 ms**；对照同一报告的
  `compiler_self_compile` ≈ **2.8 s**、`seed_build` ≈ **1.5 s**、
  `corpus_compile`（16 个 HM 夹具批量编译）≈ **0.5 s**。
- 时间依赖机器，只用于回归对比（`--baseline` / `--json`），不进入
  `nix flake check`；机器无关指标仍由 `nix/metrics.budget` 约束 seed 闭包的
  HM codegen 产物（M13 后 bytes 867732 / lines 9049）。
