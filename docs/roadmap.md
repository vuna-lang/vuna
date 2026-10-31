# Vuna 路线图

本文记录 vuna 的当前基线与后续规划。

## 维护规则

- **已完成阶段整段删除**：阶段完成后，删除该阶段的目标、范围、验收、设计要点、实现状态等详细段落，正文中不再保留。
- **已完成阶段一句话**：只在「已完成」列表中保留一句话摘要（阶段编号 + 核心交付物）；需要历史细节时查 git 历史。
- **未完成阶段保留细节**：保留目标、范围、验收，可继续补充设计要点。
- 新增阶段先写入「下一步 / 待办」，完成后按上述规则收敛。

## 已完成

- M1：offside layout parser。
- M2：call-by-value 求值器。
- M3：自解释器。
- M4：动态 value 表示 codegen 与编译版解释器。
- M5：文件即模块、import / qualified / alias、模块名与循环检查。
- M6：vuna 自写 codegen 与 seed 固定点。
- M7：HM 类型检查、模块类型名解析、顶层推断与编译器自检。
- M8：原生 OCaml typed codegen（data → variant，Int/String/Bool/List 原生），typed 默认并完成 typed 自举。
- M9：诊断与语言可用性——全链路 span、运行时错误 `文件:行:列`、穷尽性/冗余检查、非 0 退出码。
- M10：模块系统 v2——模块头与显式导出列表、抽象类型、`module B` / `B.name` 重导出、`_` 前缀隐私与模块路径不变式。
- M10.5：类型表达力——记录类型与 trait（单参数、相干默认、命名实例、孤儿检查、`deriving`），内置 `Show` / `Eq` / `Ord` 与方法级字典穿参。
- M11：标准库——独立成员包 `vuna-stdlib`，高阶 kind 与一般约束泛化，`do` 语法糖与 IO 组合子，编译器成为 stdlib 首个用户。
- M11.5：包管理与工具链——`vuna.toml`、workspace 与依赖 DAG、`[export]` 跨包可见性、三目录约定，以及 `build` / `test` / `fmt` / `repl` / `doc`。
- M12：性能与编译模型——分离编译（vuna 模块 → OCaml `.ml` / `.mli`）与 ocamlopt 模块级增量构建，seed 改为多文件文件集，新增机器无关指标门槛。
- M11.6：fmt 完善——注释保留与 100 列行宽折行。
- M12.5：工具链与自举边界拆分——编译器独立为成员包 `vuna-compiler`，seed 只含编译器入口闭包（63 → 49 个文件），工具链移出 TCB；同期修复编译性能（AVL 类型替换 / 路由表 / 快速 seed 构建，compiler 闭包 build --split ~32s → ~2s）。

## 当前硬约束

1. 当前编译器必须能通过自身类型检查；
2. seed rotation 后 stage 1 与 stage 2 必须字节一致；
3. `test/run-tests.sh`、`nix build`、`nix flake check` 必须保持通过；
4. **seed 只含 compiler 包的入口闭包**；工具链（fmt/lint/repl/doc/test、未来的 LSP/package manager）不进入 TCB。


## M13：高级类型 / 效应（研究型）

候选方向（一次只选一个）：

- 依赖类型；
- 线性/效应系统；
- 隐式参数；
- 更完整的模块类型系统。

前置条件：

- 有明确的语言目标与可接受的编译期成本；
- 类型基础（M10.5）与诊断（M9）已就绪——已满足。

## 暂缓事项

- 完整独立运行时/GC；
- 多后端支持（先保持 OCaml 后端）；
- 大型标准库扩张；
- 包 registry 与远程依赖解析。

M9–M12 已稳定，这些事项可在 M13 明确目标后再评估。
