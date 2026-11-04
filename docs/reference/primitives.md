# 原语语义规范（Int / String / Show / 效果原语与能力）

本文是 vuna **原语语义的唯一权威**：值域与宽度、字符串编码、错误行为、interp 归约
边界、效果原语与能力模型、生成 runtime 的契约。内建声明面只有一份真源
`Vuna.Compiler.Intrinsics`（`allIntrinsics` / `Capability` / `IntrinsicOp`），消费方是
`Loader.Resolve`（解析 + 能力检查）、`Elab.Prelude`（签名）、`Codegen.Term`（runtime
映射）、`Core.Eval`（interp 归约）。语法见 [language.md](language.md)，DT 侧见
[dt.md](dt.md)，库的边界见 [stdlib.md](stdlib.md)，边界清单见 [limits.md](limits.md)。

## 1. 术语

| 术语 | 含义 |
| --- | --- |
| primitive 类型 | `Int` / `String`：没有 `data` 声明，表示与字面量由编译器提供 |
| intrinsic | `Intrinsics.allIntrinsics` 的一条：名字、签名形状（`IType`）、interp 归约标签（`IntrinsicOp`）、所需能力、runtime 表达式、是否对源码可见 |
| runtime helper | 生成产物 `Vuna_runtime.ml` 里的 OCaml 函数（`bi_*` / `dtp_*` / `dt_show_string`）；`bi_*` 不对用户源码可见 |
| 效果原语 | 带能力（`intrinsicCapability = Just c`）的 intrinsic：只有 `prim_*` 名，外加 `timeUs` |
| 能力（capability） | manifest `[capabilities].effects` 的显式声明，决定该包能否**直接**调用效果原语 |

## 2. 身份与常量

- **`Int` / `String` 是语言 primitive 类型**（`Intrinsics.typeIntrinsicNames = [Int, String]`）：
  prelude 直接提供 `Int : Type` / `String : Type`；入口/未限定名处的 `data Int` /
  `data String` 报 `CannotRedefineBuiltin`（模块内声明会 mangle 成 `M.Int`，属于不同符号）。
- **`Bool` / `List` / `IO` 是 base 的普通 `data` 声明**，身份是完整符号而不是短名：

  | 声明 | canonical 符号 | 来源 | 常量 |
  | --- | --- | --- | --- |
  | `Bool` | `Base.Bool.Bool` | `base/lib/Base/Bool.vuna` | `Intrinsics.boolTypeName` |
  | `True` / `False` | `Base.Bool.True` / `Base.Bool.False` | 同上 | `boolTrueCtor` / `boolFalseCtor` |
  | `List` | `Base.List.List`（`Cons` / `Nil` 同理） | `Base.List` | `listFamilyName` / `listConsCtor` / `listNilCtor` |
  | `IO` | `Base.IO.IO` | `Base.IO` | `ioFamilyName` |

- `True` / `False` 精化为核心 `TBool`，codegen 的运行时表示是 OCaml `bool`：canonical Bool
  族**不生成变体声明**（`Codegen.Decl.runtimeDatas` 按 `boolTypeName` 过滤）。
- **不再有短名 / `lastName` 判定，也不再有「全局构造子放行」**：`True`/`False`/`Cons`/`Nil`
  与其他构造子一样经 import 的导出表解析（`Prelude` 自动注入 `Base.Bool` / `Base.List`，
  所以裸名可用）。类型位置按 `resolveTypeName` 判定：`Int`/`String`/`Type`/`->` 是内建，
  其余（含 `Bool`）查导出表。
- 用户写的 `data Bool` / `data List` / `data IO` 是**普通 data**、不与 canonical 冲突：
  模块内名字被 mangle 成 `<Module>.Bool`；入口文件（不做 mangle）里声明 `data Bool` 时
  族名就是 `Bool`，与 `Base.Bool.Bool` 是两个族。`if` / 字面量 `case` 等只认 canonical。

## 3. Int

- 表示：宿主 OCaml `int`，**固定 63 位**：`max_int = 4611686018427387903`、
  `min_int = -4611686018427387904`。类型层没有宽度/区间信息，`Int` 就是 `Type`。
- 算术：`+` `-` `*` 在溢出时按**二进制补码回绕**（`max_int + 1 = min_int`），不报错、
  不饱和、不提升为大整数。**无大整数计划**（roadmap 决策 D16）。
- `/`：整数除法向零截断；`a / 0` 在产物运行期抛 `Failure "division by zero"`
  （runtime `bi_div` 显式检查）；`min_int / -1` 回绕成 `min_int`，不报错。
- 字面量：十进制数字序列，按 `acc * 10 + digit` 累加，**越界同样回绕**（`Lexer.collectInt`）；
  没有一元负号，负数写成 `0 - n`。
- 比较：`==` `/=` `<` `<=` `>` `>=` 返回 canonical `Bool`（`Base.Bool.Bool`）。

## 4. String

- 表示 = UTF-8 **字节串**（OCaml `string`）：长度、下标、切分都以**字节**为单位，文本可以
  是任意字节序列，语言**不做 UTF-8 校验**，也没有码点 API。
- `strLength : String -> Int`：字节数（不是字符数）。
- `strAt : String -> Int -> Int`：返回 0..255 的字节值；下标越界返回哨兵 `-1`（不抛异常）。
- `strUnpack : String -> List Int`：字节码列表，元素 0..255。
- `strPack : List Int -> String`：元素必须是 0..255，越界是**宿主运行期错误**
  （`Char.chr` 抛 `Invalid_argument`，无语言层诊断）；实现逐元素 `List.nth`，长串 O(n²)。
- `++`：按字节拼接（runtime `bi_concat` = OCaml `^`）。
- 比较：`==` / `/=` 按字节相等（`bi_eq_str` / `bi_neq_str`）；`<` `<=` `>` `>=` 走泛型
  `compare`（OCaml 字符串字节序）。
- 源码字面量转义（`Lexer.scanString` / `scanEscape`）：`\n` `\t` `\r` `\"` `\\` `\'`；
  其它 `\x` 报 `UnknownEscape`；字符串字面量不能跨行。
- 展示/转义统一走 `strShow`（§5），没有第二套实现。

## 5. Show 与 main 展示

`strShow : String -> String`（intrinsic，runtime `dt_show_string`）是**唯一**的字符串
展示实现：加双引号，并转义 `"` → `\"`、`\` → `\\`、LF → `\n`、TAB → `\t`、CR → `\r`；
其余字节原样输出（不走 OCaml 源码发射时的 `\ddd` 转义——那是 `Codegen.Decl` 的内部细节）。

- `Base.Show` 的 `String` 实例委托给它：`show s = strShow s`，因此 `show` 与
  `main : String` 的展示一致。
- `main` 展示钩子（`Codegen.Term.mainShowForName`）：`Int` → `string_of_int`、
  `String` → `strShow`、`Bool` → `dt_show_bool`（输出 `True` / `False`）。
- interp 展示（`Core.Eval.showValue`，字符串走 `Core.Term.showCoreString`）与 `strShow`
  同规则、逐字节一致，因此 `main : String` 在 interp 与产物中输出相同。
- `Show Bool` 库实例用 `if` 输出 `True` / `False`，与 `dt_show_bool` 同语义。

## 6. 其它纯原语

| 原语 | 签名 | 语义 |
| --- | --- | --- |
| `strFromInt` | `Int -> String` | 十进制，负数带 `-`（OCaml `string_of_int`） |
| `strHash` | `String -> Int` | 固定 1024 桶：`h` 初值 0，逐字节 `h = (h*33 + byte) mod 1024`，结果 0..1023 |
| `strAt` | `String -> Int -> Int` | 见 §4（越界 `-1`） |
| `strConcatMany` | `List String -> String` | 一次性拼接（OCaml `String.concat ""`） |
| `strSubstTemplate` | `String -> List String -> String` | `<N>` 占位符按序号替换；非数字 `<`、越界序号原样保留（`Base.Vec.substTemplate`） |
| `timeUs` | `Int`（**值**，非函数） | 微秒时间戳（`Unix.gettimeofday`）；效果原语，能力 `clock` |

`strHash` 的 interp 实现（`Core.Eval.strHashOf`）与 runtime `dtp_strHash` 是同一公式。

## 7. 效果原语与能力

**名字面**：效果原语只保留 `prim_*` 名，旧公开名（`readFile` / `print` / `exit` / …）
已删除。用户有两条合法用法：

1. `import Base.IO`，使用返回 `IO` 动作的 API（`print` / `readFile` / …）；
2. 在自己的 `vuna.toml` 声明所需能力后**直接**调用 `prim_*`。

| 能力 | 原语 |
| --- | --- |
| `console` | `prim_print`、`prim_readLine`、`prim_readBytes` |
| `fs` | `prim_readFile`、`prim_writeFile`、`prim_readDir`、`prim_isDirectory`、`prim_makeDir`、`prim_removeFile`、`prim_fileExists`、`prim_fileMtime`、`prim_fileSize` |
| `process` | `prim_getArgs`、`prim_exit`、`prim_runIn` |
| `env` | `prim_getenv`、`prim_getcwd`、`prim_execPath` |
| `clock` | `timeUs` |

- 声明面：manifest `[capabilities] effects = ["console", "fs", ...]`，按**包**声明
  （`Frontend.Manifest.manifestCapabilities`）；无 manifest 的 ad-hoc 文件没有能力。
- 未知能力名报 `unknown capability "<name>" (known: console, fs, process, env, clock)`
  （`Loader.Resolve.checkCapabilities`）。
- 用到但未声明报
  `` effectful builtin `<name>` requires capability `<cap>` in <package> (declare [capabilities] effects = ["<cap>"] or use Base.IO) ``
  （`Loader.Resolve.checkEffectsBuiltins`）。
- **这是权限声明，不是检查豁免**：能力不改变类型检查、擦除或 codegen 语义，只决定能否
  在源码里直接引用效果原语；不再有任何按包名字符串判定的 allowlist。
- `Base.IO` 自身声明 `["console", "fs", "process"]`；编译器与产品 CLI 声明全部五个能力。

## 8. 生成 runtime 的契约

产物固定包含一个 `Vuna_runtime.ml`（`Codegen.Term.dtRuntime`），**无条件**内嵌 Unix：

- `Unix.stat`（`prim_fileMtime` / `prim_fileSize`）、`Unix.gettimeofday`（`timeUs`）、
  `Unix.readlink "/proc/self/exe"`（`prim_execPath`）；`build.sh` 无条件
  `-I +unix ... unix.cmxa`。因此任何产物都依赖 OCaml 的 unix 库。
- 启动时设置 GC（`minor_heap_size` 16MB、`space_overhead` 200）。

| 原语 | runtime 契约 |
| --- | --- |
| `prim_print` | 写 stdout 并 flush，返回**字节数** |
| `prim_writeFile` | 二进制写整串，返回**字节数**；IO 失败抛宿主异常 |
| `prim_readFile` | 读整个文件为字节串；IO 失败抛宿主异常 |
| `prim_readLine` | 读一行；EOF 返回 `""`（与空行不可区分） |
| `prim_readBytes` | `Int -> String`：最多读 n 字节，**有数据就立即返回**（可能少于 n），EOF 返回 `""`；调用方负责循环/拼接（LSP 帧读取用） |
| `prim_readDir` | 目录项按字符串排序；目录不存在/不可读时抛宿主异常 |
| `prim_makeDir` / `prim_removeFile` | **幂等**：已存在/不存在时直接返回 `0` |
| `prim_fileExists` | 路径不存在时为 `False` |
| `prim_isDirectory` | 普通路径检查；**不存在**的路径抛宿主异常（`Sys_error` → `failwith`） |
| `prim_fileMtime` / `prim_fileSize` | 秒级 mtime / 字节数；取不到时**静默返回 0** |
| `prim_getenv` | 变量未设置或为空串都返回 `""`（两者不可区分） |
| `prim_getcwd` | 失败时返回 `"."` |
| `prim_execPath` | 先读 `/proc/self/exe`（**Linux 假设**），失败回落 `Sys.executable_name` |
| `prim_getArgs` | 排除 `argv[0]` 的其余参数 |
| `prim_exit` | 立即退出进程（类型 `Int -> Int` 但**不返回**） |
| `prim_runIn` | 在给定目录执行 `sh` 命令并返回退出码，执行后恢复原 cwd |

零参效果原语（`prim_getArgs` / `prim_readLine` / `prim_getcwd` / `prim_execPath` / `timeUs`）
是**值形式的名字**，但 runtime 映射是表达式，所以**每次引用都会重新求值**
（`Codegen.Term.globalRef` 映射成 `(dtp_*(()))` 一类表达式）；需要快照时先 `let` 绑定。

## 9. interp 归约边界

`vuna interp` 是精化后的纯核心求值器（`Core.Eval.primReduce` 按 `IntrinsicOp` 归约）。
语言运算符 `+ - * /`、`== /= < <= > >=`、`++`、`&&`、`||` 全部归约（`/` 除零例外）。
边界按**显式分类**处理，不是静默错值：

| 类别 | 归约 | 说明 |
| --- | --- | --- |
| 上述运算符 | 是 | `/` 在除数为 0 时**不归约**（见下） |
| `strFromInt` / `strLength` / `strHash` / `strAt` / `strShow` | 是 | 与 runtime **同语义同公式** |
| `strUnpack` / `strPack` / `strConcatMany` / `strSubstTemplate` | **否** | 结果依赖 `Base.List.List` 的构造子表示（List 桥接），核心求值器不构造该表示 |
| 全部效果原语（`prim_*` / `timeUs`） | **否** | 纯求值器不执行效果 |
| `a / 0` | **否** | 核心求值器表达不了运行期异常；显式分类，不返回 0 |

- 不可归约时 `main` 报 `main does not reduce to a value`（`CG_MainNotValue`）。
- `main : IO a` 一律报
  `interp cannot execute effects (main : IO a); compile and run the program instead`
  （`CG_InterpCannotExecuteEffects`），不做「纯动作求值、效果丢弃」。
- 相关夹具带 `.nointerp` 标记，只做 `compile` + 运行产物。

## 10. 已知边界

- 无大整数、无溢出诊断；`Int` 的 63 位宽度是宿主实现事实。
- 无 Unicode 码点 API / 无 UTF-8 校验；`String` 是字节串，`strPack` 越界是宿主错误。
- `prim_execPath` 依赖 `/proc/self/exe`（Linux），其它平台走 `Sys.executable_name`。
- `strPack` / `strUnpack` 的 List 桥接、`strSubstTemplate` 的模板扫描均在 runtime 里实现，
  interp 不覆盖（§9）。
- 效果原语的失败（IO 错误、`strPack` 越界、`exit`）都是**宿主异常/进程退出**，不是语言的
  可捕获错误。

## 相关阅读

- 语法与模块系统、内建名可见范围：[language.md](language.md)
- 库的边界（`Base.Show` / `Base.IO` / 能力声明）：[stdlib.md](stdlib.md)
- DT 侧身份判定与字面量模式：[dt.md](dt.md)；边界清单：[limits.md](limits.md)
- 生成器与产物布局：[compiler.md](compiler.md)