# 技术债务与未实现能力（debt）

本文件只登记**当前仍未关闭**的债务、缺陷与能力缺口。关闭即删除（历史在 git）；已落地决策
与已修复缺陷不在此维护。每条给**当前证据**与**归属**（阶段编号见
[roadmap.md](../roadmap.md)）；无法归属的标「待定」。

维护规则：新增项必须能给出可复现证据（命令或 file:line）与归属；同义项合并为一行；不保留
「部分修复」的模糊措辞——要么当前仍成立，要么删除。

## 语言与精化器

| ID | 摘要 | 当前证据 | 归属 |
| --- | --- | --- | --- |
| B07 | 完整高阶合一未实现：只支持空 spine 与 Miller pattern；非 pattern 形状明确报错 | `Core/Conv.solveMeta`；`TC_CannotSolveHigherOrder` | 研究储备 |
| B09/D08 | 隐式模式 `{p}` 与 `auto` / 隐式等式搜索未实现；隐式**值**参数 `{x : a}` 已可用 | parser pattern 语法无 `{p}`；`Elab/Meta.isImplicitDomain` 只放行值参数 | F4 |
| B11/D11 | trait 只支持单参数；多参数 trait、默认方法、父类、关联类型未实现 | `Elab/Trait` 的「exactly one parameter」；约束实例与参数化 deriving 已可用 | F4 |
| B13/D20 | 泛型 Σ 的值级构造仍不可表达（字段类型不能依赖运行时值） | `dt_err/45_generic_sigma_runtime`；Tarski 式存在式是当前替代（`dt/62`/`dt/63`） | F4 |
| B18 | 同模块 `data T` 与 `def T` 同名仍不支持（Elab globals 需按命名空间拆表） | `Elab.Term` 的类型层 def 退化路径只查同名值定义 | F1 |
| C07 | 擦除位的作用域护栏按约定跳过，未对擦除位置做完整 de Bruijn 校验 | `Codegen/Erase.checkAllDefScopes`：跳过擦除实参 | 待定 |
| D12 | 证明 ergonomics 进阶未实现：absurd / 空族消去语法、`rewrite` / `with`；隐式模式与 `auto` 见 B09/D08 | `limits.md` 的证明 ergonomics 边界；`tooling.md` §5 | F4 |
| D19 | 类型级部分应用不可用（如把 `Vec Int` 当类型参数传给 `Sigma Nat`） | `checkAppUnderTypeFuel` 报 `expected Nat, got Int` | F4 |

## 工具、构建与验证

| ID | 摘要 | 当前证据 | 归属 |
| --- | --- | --- | --- |
| C23 | `test/run-tests.sh` 无按章节 timeout，夹具 / 段数守卫仍靠脚本自律 | `test/run-tests.sh`；42 个章节 | 待定 |
| E01 | 无托管 CI：只有本地 `nix/ci.sh` 封装 flake check | 仓库无 `.github/` 等 CI 配置 | 待定 |
| E03 | `result*` out-link 可过期（手工指向某次构建），文档只能提示重建 | `nix build ... --out-link` 的语义 | 待定 |
| E04 | TCB 只有黑名单 + 闭包数量断言，没有完整 allowlist | `nix/tcb-check.sh` + `nix/seed-count.txt` | 待定 |
| E06 | seed rotation 替换步骤非原子：校验通过后 `rm -rf seed && cp -r` | `nix/seed-rotate.sh` | 待定 |
| C30 | `vuna build` 的 build meta 不含 manifest 摘要：改 `vuna.toml` 能力声明后 `build` 报 "up to date"、跳过重检查与重编（`vuna check` 仍全量） | `Driver/Compile.buildMetaText` / `metaUpToDate` | 待定 |

## 未来能力（F1–F4）

| ID | 摘要 | 归属 |
| --- | --- | --- |
| D01 | 模块系统无签名 / 接口、无 functor / 嵌套 / 局部模块、import 仅文件顶部、无选择性 import | F1 |
| D02 | 运行时 / 后端未定型：GC、后端无关 IR、Wasm/JS（当前绑 OCaml runtime） | F2 |
| D03 | 无通用效应系统 / 并发 / async；`IO` 仍是 thunk + IO 化的 `prim_*`（M31：动作只在 `main`，`runIO` 是能力门控逃逸） | F3 |
| D04 | 包生态：registry、版本解析、lockfile、文档托管、DT 验证库（Vec/Fin/Map/Set） | F4 |
| D06 | 完整依赖 kind / CoC 依赖消除（当前只检查 kind 形状与层级） | 研究储备 |
| D17 | `main` 的展示仍限 `Int` / `String` / `Bool`；任意类型展示需要运行时 `Show` 证据 | F3 |

## 相关阅读

- 阶段与未来轨道：[roadmap.md](../roadmap.md)
- 当前边界（用户可见）：[limits.md](limits.md)
- 语言规则：[type-system.md](type-system.md)；Core 实现：[core.md](core.md)
