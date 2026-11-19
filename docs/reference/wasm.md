# wasm 后端

> 状态：**端到端工作；浏览器/边缘受限后端，不承担自举**。能力面：Int / Nat / String / Bool / Float；
> `let` / `if` / 用户 `data` / record / 通用 `case`；饱和顶层调用、eta 展开与多参柯里化
> 闭包（`$clo` + `(elem declare func ...)`，应用逐实参 `call $rt_apply`）；内建饱和应用；
> 结构化比较 `bi_lt/le/gt/ge_str` / `bi_lt/le/gt/ge_bool`（`$rt_compare`）；
> `main : Eff r a` 与 handler（全部走显式效应机器 `@ir@m@*`：续延只返回 Control，见 [effect-machine.md](effect-machine.md)）；
> WASI preview1 宿主层（fs / env / args / clock），能力上限是浏览器 WASI 可提供的子集。
> 未实现的宿主操作在运行期显式失败（不伪造结果）；符号表外的原语（extern、网络等）
> 在引用点拒绝。实现入口：`Vuna.Target.Wasm.{Model,Instr,Types,Runtime,Module,Render}`，
> 驱动 `Vuna.Compiler.Driver.Wasm`。

## 1. 产物与工具链

- **canonical 产物是 WAT 文本**（`main.wat`）；`.wasm` 不手写、不进 Git，由
  `wasm-tools parse main.wat -o main.wasm` 生成（版本由 Nix 固定）。
- `vuna compile <ENTRY|PKG-DIR> <OUT> --target wasm` → `<OUT>/main.wat`。
- `vuna build <PKG-DIR> --target wasm --out <OUT>`：写 `<OUT>/main.wat` + `<OUT>/build.sh`，
  并直接调用 `wasm-tools parse` 产出 `<OUT>/main.wasm`（工具缺失/失败即 exit 1，
  不静默留半成品）；`--no-compile` 只写 WAT + `build.sh`。
- `--target` 取值校验在 CLI 解析层（`ocaml|wasm|native`），未知目标是用法错误（exit 2），
  不回落到 OCaml。
- 执行宿主是仓库自带的 Node/V8 宿主（`wasm-host/run.mjs`，宿主层 `wasm-host/host.mjs`，
  浏览器复用同一份 `host.mjs`）：产物不含 wasm stack-switching 类型与指令，默认配置的
  引擎即可直接运行。handler 运行时由显式效应机器的一个循环派发续延；尾位置 resume 不压
  `msCtx`，200k 次顺序 perform 在默认栈上运行（见 [effect-machine.md](effect-machine.md) §9.2.7），
  非尾 resume 的嵌套深度仍按语义保留。
- **栈上限由引擎决定**：V8 的 wasm 栈约 1 MB 且没有开关（`node --stack-size` 不改变
  wasm 栈）。长列表上的**非尾递归**辅助函数（`map` / `append` / `Bytes.lenOf` 这类
  `1 + f rest` 形状）让栈深与输入规模成正比，超出后以 `Maximum call stack size exceeded`
  收口；这是浏览器路径的实际边界，不能靠 flag 调整。词法主循环（`Lexer.lexChars` /
  `lexCharsWith`）是尾递归（逆序累积 + 一次 reverse），不按 token 数吃栈；effect 次数
  也不吃栈，剩余上限由被处理计算自身的递归深度决定。
- 产物把预打开目录的 **fd 3** 当作唯一 preopen 根（见 §5）：Node 宿主用 `--dir <root>`
  （缺省进程 cwd），浏览器下由宿主注入 preopen/adapter。路径按 fd 3 解析而**不按 `PWD`**；
  绝对路径会去掉开头的 `/` 再按根解析。多个 preopen 时只使用 fd 3，不做多根映射。
- 工具链是**构建期/测试期外部工具**，不进 TCB、不进 seed（与 native 侧 `cc` 同构）：
  `nix/build/common.nix` 的 `wasmTools`（`wasm-tools`，devShell / `vuna-run-tests` /
  `vuna-tests-*` 的 PATH）；执行用的 Node 在 `e2eTools` 里。

## 2. 数据表示（WasmGC）

统一值类型 `anyref`，不做类型特化：

| Vuna | wasm |
| --- | --- |
| Int / Nat | `(struct (field i64))`，63 位语义（wrap / 逻辑移位 / 除零 trap） |
| Bool | `i31`（`ref.i31`） |
| String | `(array (mut i8))`；字面量 `array.new_data $str $d0` |
| 数组 | `(array (mut anyref))`；不可变（`arraySet` 复制整块再写），越界 trap |
| 变体 / record | `(struct (field i32 tag) (field anyref ...))` / 纯字段 struct |
| 闭包 | `(struct (field (ref $ft)) (field anyref env))`，`$ft = (func anyref anyref (result anyref))`；多参 lambda 创建时柯里化 |

零参 `IrLam []` 不构造闭包：直接在该引用点内联求值。捕获是创建时把当前作用域里的
binder 全量拷进 `$env` 数组（与 native 同策略），闭包应用经 `$rt_apply` 逐个实参进行。

## 3. 模块布局（稳定 diff）

- 名字稳定：`$t_<watName family>`、`$f_<watName>`、`$g_<watName>`、`$d_<N>`，
  由 Vuna 全限定名派生，**不按位置编号**；`$d_` 只用于数据段；运行时函数 `$rt_*`；
  闭包函数 `$lam<n>`（模块内单调递增）。
- 固定顺序：types（基础类型 → 按声明序的族）→ tags（泛型 `$eff`）→ imports
  （WASI preview1）→ memory（4 页 = 256 KiB，导出 `memory`）→ globals
  （`$g_cleanups` / `$g_hostStatus` → 零参定义（定义序））→ functions（Runtime →
  `$rt_compare` 与字符串/数组比较 → List 桥接 → 用户函数（定义序）→ `$lam<n>` →
  `_start`）→ elements → data → exports。
- elements 是 `(elem declare func ...)`：闭包函数按创建顺序，末尾固定追加
  `$rt_effThunk` / `$rt_effResumeClo`（两者都被 `ref.func` 引用）。
- 缩进固定 2 空格、一条指令一行；行宽上限 100 列，超长字符串按 24 字节分块
  为相邻字面量。
- 同一 IR 的 WAT 字节确定；`.wasm` 只保证行为（字节依赖工具版本，由 Nix 固定）。
- 局部变量编号只在**函数内**递增（`$l<n>`）；每个函数生成前局部表清零
  （`beginFuncScope`），结束后恢复外层状态。参数是 `$p<n>`，`case` 的 scrutinee
  槽是 `$sc0`。

## 4. IR 支持面

从 `IrEntry.irEntryMain` 沿 `irDefDeps` 收集**可达**定义，只生成可达函数与可达全局；
不可达定义即使含不支持构造也不拒绝（与 native 同策略）。

| IR 节点 | 当前 | 说明 |
| --- | --- | --- |
| `IrVar` / `IrInt` / `IrBool` / `IrCast` / `IrStr` | 支持 | 字符串字面量进 `$d0` 池，空串走 `array.new_default` |
| `IrGlobal` | 支持 | arity 0 读全局；arity > 0 作值引用时 eta 展开成柯里化闭包 |
| `IrLet` | 支持（≤1 运行时 binder） | 多运行时 binder（boxed case 降级）拒绝 |
| `IrIf` | 支持 | 条件 `ref.cast i31` + `i31.get_u`；两臂**顺序**生成，合并局部表 / 闭包函数 / elem 表（见 §6） |
| `IrApp` | 支持 | 饱和顶层调用；部分应用、高阶与函数值走闭包（逐实参 `call $rt_apply`）；立即单参 lambda 应用走直接 `local.set` 快路径 |
| `IrLam` | 支持 | 作为值 → `$clo`（code + 捕获 env）；多参 lambda 创建时柯里化为嵌套单参闭包；零参 lambda 直接内联 |
| `IrNatCase` | 支持 | `sc == 0` 二选一；succ binder = `sc - 1`（重新装箱），catch binder = `sc` |
| `IrRtApp` | 支持白名单 | 参数左→右；`&&`/`\|\|` 短路在 Lowering 已降成 `IrIf` |
| `IrConcatMany` | 支持 | 左折叠到 `$rt_strConcat` |
| `IrRt` | 支持 | `RtValue` 直接内联；`RtFunc` 作值 eta 展开成闭包；符号表外的符号在引用点拒绝 |
| `IrCtor` / `IrRecord` / `IrProj` / `IrRecUpd` / `IrCase` | 支持 | WasmGC struct：变体 `(field i32 tag) (field anyref...)`；record 纯字段 |
| Float | 支持 | `$float` struct + f64 指令；比较按 IEEE 语义；展示走 `Base.Data.Float.floatRender` |
| Eff thunk / IORef | 支持 | `MkEff` 包装原语；`IORef` 是长度 1 的 `$arr` |
| Effect handlers | 支持 | 泛型 tag + `resume`/`suspend`；key/name 不匹配时转发外层；见 [effect-machine.md](effect-machine.md) |
| `IrEffBind` | 拒绝 | effect 的 bind 降级；与 native 同一限制 |
| extern / FFI | 拒绝 | `IrExternDef` 在生成期报 `WasmUnsupported` |

- 入口：`main` 必须是零参值；`main : Eff r a` 支持——入口按 `irEntryHandlersOf`
  预装 base 内建效应的 `run*Host`（清单见 `Vuna.Compiler.Base.Intrinsics.builtinEffects`），
  再用 `runMain` 执行后展示。入口 show 接受 `@ir@showInt` / `@ir@showNat` /
  `@ir@showBool` / `@ir@showStr` / `@ir@showFloat`（Float 走
  `Base.Data.Float.floatRender`）；其它自定义 Show 在生成期拒绝。`--no-print` 不打印，仍求值。
- **零参定义**在 `_start` 里按依赖序初始化进全局（每次引用读全局，不重算）；
  **饱和函数**（arity > 0）生成 `$f_<name>` 并被 `call`。
- **尾调用**：函数体统一按尾位置生成（效应机器合成的 lambda 依赖这一点）；结果位置直调
  发 `return_call $f_<name>`，闭包的最后一次应用发 `return_call $rt_apply`。`IrTail`
  是同一语义的共享标记。零参定义在 `_start` 内联求值，生成期用 `stripTail` 去掉该上下文的
  标记（`_start` 没有结果类型）。

## 5. 运行时符号

`Wasm.Runtime` 按 `Ir.Runtime` 契约的**符号名**实现子集；语义参考实现是
`Vuna.Target.Ocaml.Term` 的 `bi_*` / `dtp_*` 模板，不重新定义语义：

| 组 | 已实现 |
| --- | --- |
| Int | `+ - * /`（63-bit wrap；除零 → `$rt_failStr` + `unreachable`）、`bitAnd/Or/Xor/Not/Shl/Shr`、`bi_eq_int` / `bi_neq_int` / `bi_lt_int` / `bi_le_int` / `bi_gt_int` / `bi_ge_int`、`&&` / `\|\|` |
| Nat | `@ir@natSucc`（饱和）、`natAdd` / `natSub` / `natMul` / `natDiv`（饱和与截断语义）、`natToInt`（恒等）/ `natFromInt`（负数钳 0） |
| String | `++`（`array.copy`）、`strFromInt`、`strShow`（`"` 包裹，按 `dt_show_string` 转义引号/反斜杠/换行/制表/回车；两遍扫描先定长度）、`strLength`、`strAt`（越界 `-1`）、`strSubstring(start, len, s)`（钳位后复制）、`strHash`（`(h*33+byte)&1023`）、`bi_eq_str` / `bi_neq_str`、List 桥接 `strUnpack` / `strPack` / `strConcatMany` / `strSubstTemplate` / `arrayFromList` / `arrayToList` |
| 结构化比较 | `$rt_compare` 给三向 i32（`-1` / `0` / `1`），`bi_lt/le/gt/ge_str` / `bi_lt/le/gt/ge_bool` 包装成 Bool。分派按运行时类型：`i31` → `$int` → `$float` → `$str` → `$arr` → 用户族（声明序逐个 `ref.test`）；`null` 参与排序；分派末端与不可比的值对走 `$rt_cmpTrap`（`wasm host operation is not implemented` + exit 2），跨族的 `ref.cast` 也可能直接 trap |
| 入口 / 诊断 | `@ir@showInt` / `showNat` / `showBool` / `showStr`、`prim_erase`、`assert`、`prim_fail`、`todo` |
| 宿主（WASI preview1 import） | `fd_write`（经 `$rt_writeChunked`，每次 ≤64 KiB）、`fd_read`、`fd_close`、`path_open`、`path_filestat_get`、`path_create_directory`、`path_remove_directory`、`path_unlink_file`、`path_rename`、`fd_readdir`、`environ_get` / `environ_sizes_get`、`args_get` / `args_sizes_get`、`clock_time_get`、`proc_exit` |
| 宿主叶子（`@vuna@host@*`） | `tryReadFile` / `tryWriteFile` / `tryWriteFileAtomic` / `tryReadDir` / `tryIsDirectory` / `tryMakeDir` / `tryMakeDirExclusive` / `tryRemoveFile` / `tryRemoveTree` / `tryRename`、`fileExists` / `fileSize`、`getenv` / `getcwd` / `execPath` / `getArgs`、`print` / `exitOp`、`newRef` / `readRef` / `writeRef`、`isTty`（恒 `False`） |
| 显式降级 / 拒绝的叶子 | `trySymlink`（trap）、`fileMtime`（状态置不可用，`FsOp.FileMtime` 得 `Nothing`）、`sleep`（trap）、`readLine` / `readBytes`（trap）、`runIn` / `spawn` / `wait`（trap） |
| 其它 | `arrayEmpty`（空数组值）；`@vuna@debug@on`（恒 `False`）/ `@vuna@debug@line`（桩）；obs 叶子桩（见下） |

- **运行时错误报告**统一为 `vuna: runtime error: <msg>\n`（stderr，exit 2），与 OCaml
  报告器 `dt_report_exn` 的第一行一致；`assert` / `todo` 分别加 `assertion failed: ` /
  `TODO: ` 前缀。`rt_failStr` 是唯一的失败出口（拼前缀后走 `rt_write`）。
- 位运算是 `IrRtApp`（`irInlineArity` 用内建名 `bitAnd`…）：`bitShr` 按 OCaml `lsr` 语义
  （63-bit 值先 `shl`+`shr_u` 清掉符号扩展位，再逻辑右移）。
- 浮点展示不是运行时符号，走 `Base.Data.Float.floatRender`（三端共用）：Lowering 把
  `strFromFloat` 改写成该定义，入口 `@ir@showFloat` 也直接调到它。
- 浮点：`$rt_floatFromInt` / `$rt_intFromFloat`（`i64.trunc_f64_s`）/ `$rt_floatAbs` /
  `$rt_floatSqrt`，`$rt_floatAdd/Sub/Mul/Div` 与 `$rt_floatEq/Neq/Lt/Le/Gt/Ge`（`f64.*`）。
- 值形态（`IrApp (IrRt sym) args`）覆盖 `strAt` / `strSubstring` / `assert` / `todo` /
  `prim_fail` / `arrayLength` / `arrayGet` / `arraySet` / `arrayMake`，以及需要 canonical
  `List` 族的 `arrayFromList` / `arrayToList` / `strUnpack` / `strPack` /
  `strConcatMany` / `strSubstTemplate`。
- 数组：`$rt_arrayLength` / `$rt_arrayGet` / `$rt_arraySet` / `$rt_arrayMake`；越界走
  `$rt_arrayOob`（`Invalid_argument("index out of bounds")` + exit 2）。
- Console / Ref 的 `@vuna@prim_eff_*` 变体（`_print` / `_eprint` / `_exit` /
  `_newRef` / `_readRef` / `_writeRef`）直连同一组实现：写 fd 1/2、`proc_exit`、
  长度 1 的 `$arr`。

**宿主层**：直接实现 WASI preview1，不引入自定义 host import。线性内存只有固定 scratch
（iov、两条路径区、64 KiB 读写缓冲、`filestat`、4 KiB `readdir` 缓冲），GC 堆在引擎侧；
预打开目录的 **fd 3** 是唯一的根，路径统一去掉开头的 `/`（WASI dirfd 形式）；`path_open`
与 `path_filestat_get` 都关掉 symlink follow。写走 `$rt_writeChunked`（每次 ≤64 KiB，
stdout/stderr 大输出不受线性内存大小限制）；读按 `filestat` 的 size 分块；`fd_readdir`
用 cookie 续读。WASI errno 映射成与 `dtp_hostCode` 一致的 1..6 / 9，写进
`$g_hostStatus` 供 `@vuna@prim_eff_hostStatus` 读取。

- **env / cwd / execPath / 时间**：`getenv` 一次 `environ_get` 进 scratch 后按 `KEY=`
  前缀匹配；`getcwd` 返回固定 `"/"`（虚拟 preopen 根，不读 `PWD`）；`execPath` 返回空串
  （WASI preview1 没有可执行路径）；`clockNow` 读 monotonic clock；`sleep` 是运行期 trap
  （浏览器不能用同步忙等阻塞事件循环）；`isTty` 恒 `False`（WASI preview1 无 isatty，stdout 终端性不可知，保守按管道处理）。
- **未实现的宿主操作**走 `$rt_hostTrap<n>`：运行期 `vuna: runtime error: wasm host
  operation is not implemented` + exit 2，不返回伪造结果。直接调用多数
  `@vuna@prim_eff_*` 文件系统原语（`readFile` / `writeFile` / `writeFileAtomic` /
  `isDirectory` / `makeDir` / `removeFile` / `fileExists` / `fileMtime` / `fileSize`）
  是这条路径；base 的 `FsOp` handler 不走它们，而是走 `@vuna@host@try*`，属于可用路径。
  `@vuna@prim_eff_readDir` / `getArgs` / `getenv` / `getcwd` / `execPath` 直连真实实现。

**明确拒绝**（`RtUnsupported` → 引用点 `WasmUnsupported`，带符号名）：未列入符号表的
契约符号，例如 Sched 家族（`prim_sched*`）与网络宿主原语（`@vuna@host@tryNet*`）。

**可观测性**（规范见 [observability.md](observability.md)）：`@vuna@obs@level` /
`log` / `counter` / `mark` / `spanBegin` / `spanEnd` / `sampleStart` / `sampleStop`
是 **no-op 桩**（返回盒装 `Int 0`；`counter` / `spanBegin` / `sampleStart` 是 2 元桩）；
`@vuna@obs@span` / `spanLab` 把最后一个 thunk 应用到 unit 后返回，不产生计时数据。
叶子全是 no-op，因此 wasm 产物上 `VUNA_OBS` 不生效。

## 6. 实现约束

- `Wasm` 子模块只 import `Base.*`、`Vuna.Ir.*`、`Wasm.*`（IR 是独立包 `vuna-ir`；
  `packages/compiler/vuna.toml` 的 `[layers]` 不再约束 Wasm）；驱动只经
  `Driver.Dt.dtCheckWithProgramParts` + `Lowering.Program.lowerProgramOf`，不 import
  Core/Elab/Intrinsics（`checks.ir-boundary` 只留形状与正向断言）。
- `Module.build` 是纯函数；`Driver.Wasm.compileWasm` 负责写文件，签名只要求
  `Member nFs FsOp r` / `nEnv EnvOp r` / `nProcess ProcessOp r`，不用全集行。
- 生成器带 fuel（`genExpr` 等），越界返回 `wasm codegen fuel exhausted`（内部错），不 panic。
- 错误分类：`wasm target:` 前缀 = 能力限制（`WasmUnsupported`）；其余 = 生成器内部错
  （`WasmInternal`，前缀 `internal wasm backend error`）。
- 任何新表都必须按定义序/固定顺序构造（禁止 HashMap 迭代），否则 WAT 不确定。
- **`IrIf` 的两臂必须顺序生成**：else 臂从 then 臂生成后的 `GenState` 续跑
  （`resumeArm` 只把作用域回到条件后的基线）。`gsNextLam` 与函数表单调累加，
  `mergeArmState` 按名字取并集。若两臂都从条件后的状态起步，两臂各自的 lambda 会拿到
  同一个 `$lamN`，后一臂的闭包函数在按名去重时被丢掉，else 臂的 `ref.func` 便指向 then
  臂的函数体。回归夹具：`packages/compiler/test/corpus/pure_cross/49_if_branch_closures.vuna`
  （期望 `11110`），由 suite 的 `pure-cross` 分类对拍三端。
- 闭包函数先插到 `gsFuncs` 头部、装配时 reverse；elem 名字同样 reverse 后追加固定的
  `$rt_effThunk` / `$rt_effResumeClo`。`$lam<n>` 只由生成顺序决定且不复用，所以生成顺序
  必须固定，WAT 才能逐字节确定。

## 7. 验证

- `packages/compiler/test/steps/106_wasm_backend.steps`（`steps_native`，e2e）：
  wasm 机制——WAT 产物形状、顶层函数 `$f_<name>`、闭包函数进 `(elem declare func ...)`、
  WAT 确定性 + 每行 ≤100 列、除零 / 数组越界 / `assert` / `prim_fail` / `todo` 的错误
  文本、`--no-compile`、拒绝面、`--target` 取值校验；另有 2000 次 perform（引擎默认栈）
  与重复 resume 的 one-shot trap（`continuation already resumed`）。浏览器能力裁剪由同一
  文件锁住：`path_symlink` 不出现在 import、symlink/sleep 运行期 trap、mtime 得
  `Nothing`、cwd 恒 `/`、stdin 能力告警。
- 共享语义（含 handler / 续延 / abort / 嵌套 / 宿主 console / 高阶 API）由
  suite 的 `pure-cross` 分类对拍三端（OCaml 是语义 oracle）；
  新增共享能力先加 `packages/compiler/test/corpus/pure_cross/` 夹具，再实现两个后端。生成器的两臂顺序约束由
  `49_if_branch_closures.vuna` 锁住（见 §6）。
- 引擎支持矩阵由 `114_wasm_engine_probe.steps` 锁住：纯程序、内建宿主效应、用户 handler
  与作用域 handler 的产物都在默认配置下可编译运行（§8.5）；开启 V8 实验特性后的读数
  只作报告。
- 宿主（`wasm-host/`）由 `115_wasm_js_host.steps` 冒烟：同一份 `.wasm` 在 Node（V8）上的
  stdout / exit / 失败文本按 §8.6 的契约断言。
- CI 门禁：`checks.vuna-tests-wasm`（整份 wasm matrix 在 V8 上跑，`test/suite/wasm-allow-fail.txt`
  是允许失败清单，当前为空）与 `checks.vuna-wasm-browser`（默认特性
  validate 是硬门；浏览器实跑走 **`.#vuna-wasm-browser-smoke`**：Playwright +
  `pkgs.playwright-driver` 的 chromium，按需构建、不进 `nix flake check`，见
  [testing.md](testing.md)「Nix checks 清单」）。
- wasm **不自举**：没有 wasm 版编译器产物、没有 wasm seed，也不跑 `backend-check`。
  `--target wasm` 只作为产品产物与三端语义对拍的目标；自举 conformance 只覆盖
  `vuna-native`（见 [testing.md](testing.md)「后端自举 conformance」）。

## 8. 后端契约与边界

wasm 的契约上限是**浏览器能提供的能力子集**：纯计算、WasmGC 值、wasm 内 handler、经显式
preopen 的文件读写、stdout/stderr、monotonic clock、args/env。进程派生 / stdin / raw 网络 /
信号 / 线程 / 符号链接 / 阻塞 sleep 不在契约内。

宿主面固定为 WASI preview1（§1 的 import 列表），由本仓手写实现（`wasm-host/host.mjs`，
Node 与浏览器共用，§8.6）。不引入 preview2-shim / `jco`：它们是
Component Model 的运行链路，而产物是核心模块，且测试宿主需要确定性（固定时钟、临时目录、
严格 trap 文本）。

**执行边界（性能口径同源）**：V8 的 wasm 栈约 1 MB 且没有开关（`node --stack-size` 不改变
wasm 栈），所以非尾深递归的生成程序在浏览器路径上会以 `Maximum call stack size exceeded`
收口；尾调用（`return_call`）的形状不受影响。生成程序在浏览器路径上的读数与判定见
[benchmarks.md](benchmarks.md) §1.3。

### 8.1 浏览器 wasm 能力矩阵

能力口径参考 `@bytecodealliance/preview2-shim` 的 Browser support matrix（0.31.1，
<https://github.com/bytecodealliance/jco/tree/main/packages/preview2-shim>），但**不使用该
shim**（§8 的分层说明）：它描述的是浏览器平台能提供什么，不是我们的实现路径。产物 import
WASI preview1，宿主侧逐函数实现。下表的「允许」指浏览器平台的能力交集，不是 Node
宿主的全部宿主能力。

| WASI 面 | preview2-shim 浏览器 | Vuna 效应 / 原语 | 当前 wasm 后端 |
| --- | --- | --- | --- |
| stdout / stderr | console-backed，保留 UTF-8 分片 | `ConsoleOp` / `prim_eff_print` | 支持 |
| stdin | adapter-backed，默认 closed | `StdinOp` | 不支持（trap） |
| args / env / initial cwd | 可配置；默认空快照 | `ArgsOp` / `EnvOp` | 支持；cwd 固定 `/`，env 可空 |
| exit | cli/exit（`ComponentExit`） | `ExitOp` / `ProcessOp.Exit` | 支持 |
| clocks | wall + monotonic + timer | `ClockOp.Now` / `SleepMicros` | `Now` 支持；`Sleep` trap |
| random | `crypto.getRandomValues` | 无 | 未实现 |
| filesystem | adapter + 显式 preopen；默认 ephemeral | `FsOp` / `@vuna@host@try*` | 核心支持；见 §8.2 |
| 持久 filesystem | 宿主注入 OPFS / IndexedDB 等 | 无 | 未实现（宿主侧能力） |
| io streams / poll | 浏览器资源；非阻塞 | 无 | 未实现（无异步/流效应） |
| outbound HTTP | `fetch`；请求体缓冲，无 streaming/trailers | 无（`NetOp` 不映射） | 未实现 |
| incoming HTTP | adapter / service worker | 无 | 非目标 |
| TCP / UDP | 无 raw socket；仅 in-memory adapter | `NetOp` | 不支持（生成期拒绝） |
| DNS | 需宿主 adapter | 无 | 非目标 |
| terminal | adapter-backed；默认无资源 | `isTty` | 恒 `False` |
| process spawn / exec | 无 | `ProcessOp.Spawn` / `Wait` / `RunIn` | 不支持（trap） |
| threads / signals | 无 | 无 | 非目标 |

### 8.2 当前 wasm 多出来、已砍 / 降级的能力

- **符号链接**：`path_symlink` import 移除，`@vuna@host@trySymlink` 走
  `$rt_hostTrap2`；`path_open` / `path_filestat_get` 都关闭 symlink follow。
  `FsOp.Symlink` 在 wasm 上运行期失败。
- **mtime**：浏览器 adapter 的修改时间通常是 epoch 或 no-op；
  `@vuna@host@fileMtime` 直接置不可用状态，`FsOp.FileMtime` 得到 `Nothing`。
- **阻塞 sleep**：`SleepMicros` 及所有 `*_sleep*` 符号映射到 `$rt_hostTrap1`；
  `clockNow`（monotonic）保留。浏览器不能用同步忙等占住事件循环。
- **cwd**：`getcwd` 返回 `/`，不读 `PWD`；`execPath` 返回空串。相对路径按这个虚拟根
  归一。
- **fd 3 主机根**：fd 3 只是 preview1 的 preopen 约定，不是主机 `/`。浏览器没有隐含
  根；文件访问必须在宿主注入的 preopen 内，多个 preopen 不支持。
- **原子写**：`WriteFileAtomic` 保留「写临时文件 + rename」的 best-effort 语义；
  浏览器 adapter 不承诺 rename 的原子性。
- **递归删除**：`RemoveTree` 只做 unlink 文件或删空目录，不递归（见下）。
- **进程**：`ProcessOp.Args` / `Exit` 可用（`Exit` 走 `proc_exit`）；`Spawn` / `Wait` /
  `RunIn` 运行期 trap。家族整体仍按不可用告警。
- **stdin / raw 网络**：分别 trap 与生成期拒绝；浏览器默认 stdin closed，raw TCP/UDP/DNS
  不暴露。
- **直接 `prim_eff_*` 文件系统原语**：多数仍是 trap；base 的 `FsOp` handler 走
  `@vuna@host@try*`，是可用路径。

### 8.3 浏览器允许但当前未实现

- `wasi:random`（secure / insecure bytes 与 seed）：浏览器有
  `crypto.getRandomValues`，Vuna 还没有随机效应。
- wall clock：当前只暴露 monotonic `clockNow`。
- outbound HTTP（`wasi:http/outgoing-handler`，fetch-backed）：浏览器允许，但 `NetOp`
  是 raw socket 语义，不能直接映射；需要单独的 HTTP 效应。
- 持久文件系统：由宿主注入 OPFS / IndexedDB 等存储后端；guest 侧没有额外能力。
- 可注入 stdin / terminal：宿主可以注入；当前后端仍按不可用处理。
- 浏览器宿主层在 `wasm-host/`（§8.6）；Chromium 实跑由 `.#vuna-wasm-browser-smoke`
  按需提供。

### 8.4 能力表

| 能力 | 状态 | 构建期 / 运行期 |
| --- | --- | --- |
| 纯计算、WasmGC 值、结构化比较 | 支持 | — |
| `Eff` 的 handler | 全部走显式效应机器（`@ir@m@*`），宿主家族与用户/作用域 handler 同一套帧 | 产物默认引擎可跑；`bracket`/`finally` 的 cleanup 由机器弹帧前按深度执行 |
| `FsOp` 核心（经 `@vuna@host@try*` + fd 3 preopen） | 支持 | 需 preopen + mutate 权限；失败经 errno 走 `FsOp` 错误通道 |
| `ConsoleOp` / `ExitOp` / `ArgsOp` / `EnvOp` / `RefOp` | 支持 | `getcwd` 恒 `/`、`execPath` 空串、`isTty` 恒 `False` |
| `ClockOp.Now` | 支持 | monotonic clock |
| `ClockOp.SleepMicros` | 不支持 | 运行期 trap（浏览器不能阻塞事件循环） |
| `ProcessOp` | 部分 | `Args` / `Exit` 可用；`Spawn` / `Wait` / `RunIn` trap；家族告警 |
| `StdinOp` | 不支持 | 构建期告警；执行到叶子 trap（exit 2） |
| `NetOp` | 不支持 | 构建期告警；raw socket 生成期拒绝 |
| `FsOp.Symlink` / `FsOp.FileMtime` | 降级 | symlink trap；mtime 得 `Nothing` |
| 网络宿主原语 / extern / FFI | 不支持 | 生成期拒绝（exit 1） |

入口行的能力检查在构建期给出：`vuna build --target wasm -W` 显示
`UN_TargetEffectUnavailable`，`--deny-warnings` 提升为失败（不留产物）。产物本身仍然
生成——**声明了不可用效应但从不执行**的程序可以正常跑；执行到对应叶子时以
`vuna: runtime error: wasm host operation is not implemented` 退出（exit 2），不返回
伪造结果。能力表在 `Vuna.Compiler.Base.Capabilities`，粒度是效应家族；逐操作缺口以
§8.1–§8.3 为准。

宿主 scratch 的边界：路径复制按目标区容量（`wasiPath1` 4096 字节 / `wasiPath2` 至
`wasiAux`）检查，超长路径 trap（不覆盖相邻 iov / io 缓冲）；原子写的临时名是
`<path>.tmp<µs><seq>`（时间 + 进程内序号），同进程并发写不会互相覆盖。

- 闭包是**单参**形状（`$ft = (anyref anyref) -> anyref`）：多参 lambda 创建时柯里化，
  应用侧每多一个实参就多一次 `call $rt_apply`。零参 lambda 内联，不产生闭包。
- 变体分支只按 tag 一次线性分派（不做多模式矩阵）；结构化比较的用户族也按声明序线性
  `ref.test`。
- **进程派生**：WASI preview1 没有 `fork`/`exec`。任何调用 `processSpawn` /
  `processWait` / `processRunIn` 的程序在 wasm 上以
  `vuna: runtime error: wasm host operation is not implemented` 退出（exit 2）；
  文本格式的多包 workspace `check` 若走这个路径同样失败。可行替代：
  `--error-format json`（机器格式走进程内顺序检查）或按包单独 `check <pkg-dir>`。
- stdin（`readLine` / `readBytes`）在运行期 trap；网络（`@vuna@host@tryNet*`）与
  extern / FFI 在生成期拒绝。
- 直接调用 `@vuna@prim_eff_*` 文件系统原语（`readFile` / `writeFile` / …）是运行期
  trap；base 的 `FsOp` handler 走 `@vuna@host@try*`，是可用路径（见 §5）。
- wasm 的 `tryRemoveTree` 只做「unlink 文件」或「删空目录」（`path_unlink_file` +
  `path_remove_directory`），不递归；要删非空树需调用方逐层处理。
- 栈：V8 的 wasm 栈约 1 MB 且没有开关；长列表上的非尾辅助函数（`append` 之类
  `1 + f rest`）栈深与列表长度成正比，超出后以 `Maximum call stack size exceeded` 收口
  （§8 执行边界）。
- 线性内存只有固定 scratch（4 页），没有 bump 堆；GC 堆由引擎管理。
- 多单元链接、WAT 缓存、wasm seed（不做，见
  [architecture-target](../architecture-target.md) D7）、Component Model / WASI 0.2/0.3
  （D16 的终端未决部分）。

## 8.5 引擎支持矩阵

产物用到的引擎特性与浏览器侧状态：

| 特性 | 产物里的用法 | 浏览器状态 |
| --- | --- | --- |
| WasmGC | `struct` / `array` / `i31` / `ref.cast` / `ref.test` / `array.new_data` | Chrome 119、Firefox 120、Safari 18.2 起默认（Baseline 2024-12-11） |
| typed function references | `ref.func` + 直接调用（`$ft` 闭包） | 随 WasmGC 进入 Baseline（Safari 18.0 起） |
| tail calls | `return_call` / `return_call_ref`（handler 运行时） | Chrome 112、Firefox 121、Safari 18.2 起默认 |
| exception handling | `tag $abort` / `throw` / `try_table`（CPS abort） | Chrome 137、Firefox 147、Safari 26.2 起（legacy EH 从 2022 起已可用） |
| **stack switching** | 不再发射（后端已删除 `$ct` / `$eff` / `$rt_eff*`） | 与本产物无关；需求由显式效应机器覆盖 |

前五项共同覆盖浏览器可跑面；不再依赖任何 wasm 提案特性（见
[effect-machine.md](effect-machine.md) §7）。三条降低路径：

- **宿主效应直连**（`Wasm.Module` 的 `sendCore` 改写）：入口行里的内建宿主效应在
  「可达代码没有用户 handler」时被降成 `MkEff (\_ => runMain (opH op pureK))`——`opH`
  是该族的宿主解释器，`pureK` 是模块生成的纯动作续延。入口也不再预装这些家族。
- **显式效应机器**（`Ir.Cps` + `Base.Effect.Core.Control`）：其余程序整片走 `@ir@m@*`——续延只返回
  `Control`（`Done`/`Apply`/`Perform`/`Handle`），机器循环单层派发；handler 帧在链上，
  answer 是 `Eff` 时 resume 会把帧装回去。宿主家族、用户 handler、作用域 handler 同一套帧。
- **清理钩子**：`bracket`/`finally` 经 `prim_cleanupPush/Pop` 维护 LIFO，机器在弹帧前
  按帧深度跑（`Base.Effect.Core.dropCleanups`）。

实测读数（`test/suite/fixtures/wasm_engine_probe/probe.sh`，node 24.22 / Chromium 145）：

| 引擎配置 | 纯程序 / 宿主效应 / 用户 handler / 作用域 handler |
| --- | --- |
| Node 默认 | 编译 + 运行通过 |
| Chromium 默认 | 编译 + 运行通过 |
| Node / Chromium + wasmfx | 通过（本产物不需要它） |

`114_wasm_engine_probe.steps` 锁默认列；`115_wasm_js_host.steps` 用 Node 锁用户 handler
的 stdout/exit。

- 所有效应形态的产物都不含 `cont` / `$eff`，**浏览器默认配置即可运行**；
- 栈深由引擎决定（V8 的 wasm 栈约 1 MB、无开关）：2000 次顺序 perform 约需 192 KiB，
  `106` 已按默认栈验收；
- 执行器只有仓库自带的 Node/V8 宿主（Node 与 Chrome 同引擎）；非 V8 引擎（Firefox /
  Safari）不在当前验证面内。

## 8.6 engine / host / loader 分层

"运行时"在这里分四层，只有第一层由平台提供：

| 层 | 提供者 | 内容 |
| --- | --- | --- |
| engine | 浏览器 / Node | 校验、编译、GC、尾调用、执行；入口是 `WebAssembly.instantiate` |
| host | 本仓 | 16 个 `wasi_snapshot_preview1` 函数的实现、capability 表、errno / 退出映射 |
| loader | 本仓 | 取 `.wasm`、喂 args/env/preopen、接 stdout/stderr、拿退出码 |
| 语言运行时 | 编进 `.wasm`（`$rt_*`） | GC 对象、字符串、数组、闭包、handler 运行时 |

宿主实现策略：**不内嵌 wasm 运行时**（把现成运行时编成 wasm 都需要自己实现 GC /
尾调用，包体与性能双输），也**不引 preview2-shim / jco**（组件化前置 + npm 依赖 +
浏览器默认值不确定）。宿主层是手写的 JS 对象，同一份实现服务 Node（V8，与 Chrome 同引擎）
与浏览器。

加载/执行契约（宿主与 loader 共同遵守）：

- `WebAssembly.compile(bytes)` 或 `compileStreaming(fetch(...))`（MIME `application/wasm`）；
- `new WebAssembly.Instance(module, imports)`，`_start()` 调用一次；
- `proc_exit(n)` → 抛 `ExitError(n)`，由 loader 转成退出码；
- 引擎级 trap 的文本因引擎而异，**不跨引擎比对**；guest 自己经 `fd_write` 写的
  `vuna: runtime error: …` 仍逐字节比对；
- stdout/stderr 走**单一 sink、按到达顺序追加**：guest 单线程，顺序确定；
- 线性内存只有固定的 4 页 scratch（导出 `memory`），宿主只读写它，不分配；GC 堆归引擎；
- 宿主 import 的**签名保持同步**。异步能力（如将来的 HTTP）只在宿主实现内部异步
  （浏览器用 `WebAssembly.Suspending` + `fetch`，测试宿主用阻塞实现），guest 契约不变；
- 未实现的操作走 `vuna: runtime error: wasm host operation is not implemented`（exit 2），
  不返回伪造结果。

宿主效应直连的判据与边界（`Wasm.Module`）：

- 分类与 key/opH 全在 `Base.Intrinsics.builtinEffects` 的 `HostClass`：`HostDirect key opH`
  可直连，`HostAbort key text` 是可直连的失败收口，`HostHandled` 只能走库机器。
  entry 预装的每个 handler（含 `runXErrorHost`）都要在表里且不是 `HostHandled`，
  缺一个就整体走显式效应机器。
- 改写按 `sendCore` 的应用脊椎匹配（`isSendCoreName` 同时认派发前的 `sendCore` 与派发后的
  `sendCoreId`）：实参末尾五元组是 (key 字面量, name, keyId, nameId, op)，key 命中即改写。
- 改写后按**体引用**重算可达集（静态依赖表会漏掉字典实例等隐式引用，因此保留集用「全依赖
  闭包 ∩ 不含续延原语」）；`genStartBody` 的初始化列表用同一份集合。
- 若改写后仍有可达到的 `prim_effectPerformId` / `prim_effectHandleId` / `prim_effectSelf`，说明
  存在用户 handler 或未覆盖的族，整体走显式效应机器（不静默改语义）。

当前落地：宿主与 loaders 在 `wasm-host/`（`host.mjs` + `fs-node.mjs` + `run.mjs`，
`vuna run --target wasm`、suite 的 wasm matrix、bench 与浏览器冒烟共用；不进 seed）。
`115_wasm_js_host.steps` 冒烟 Node 路径的 stdout / exit / 失败文本。

代价（按引擎管理，不按后端分叉）：

- 无 `-W max-wasm-stack`：栈上限、递归深度、GC 阈值都是引擎参数；
- 观测面为零：`VUNA_OBS` 在 wasm 上是 no-op 桩，浏览器侧也没有 `vuna dev obs` 通道；
- 能力矩阵按宿主取值：浏览器允许 `fetch`、不允许 raw socket；Node 宿主按同一张表实现。

## 9. 相关阅读

- [ir.md](ir.md)：IR 节点、运行时契约、后端义务。
- [effect-machine.md](effect-machine.md)：显式效应机器的协议、控制栈与已知边界。
- [native.md](native.md)：另一个产品后端（同样的「文本 canonical + 外部工具」策略；
  支持字符串与 bump 堆）。
- [architecture.md](../architecture.md)：子系统地图与改动定位。
