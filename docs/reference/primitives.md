# 原语语义规范（Int / String / Show / 效果原语与能力）

本文是 vuna **原语语义的唯一权威**：值域与宽度、字符串编码、错误行为、interp 归约边界、
效果原语与能力模型、生成 runtime 的契约。内建声明面只有一份真源
`Vuna.Compiler.Intrinsics`（`allIntrinsics` / `Capability` / `IntrinsicOp`），消费方是
`Loader.Resolve`（解析 + 能力检查）、`Elab.Prelude`（签名）、`Codegen.Term`（runtime
映射）、`Core.Eval`（interp 归约）。语法见 [language.md](language.md)，类型规则见
[type-system.md](type-system.md)，库的边界见 [stdlib.md](stdlib.md)，开放债务见
[debt.md](debt.md)。

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
  prelude 直接提供 `Int : Type` / `String : Type`；入口 / 未限定名处的 `data Int` /
  `data String` 报 `CannotRedefineBuiltin`（模块内声明会 mangle 成 `M.Int`，属于不同符号）。
  M31.1 起它们的 **Eq / Ord 实例宿主模块**是 `Base.Int` / `Base.String`（实例跟类型模块走；
  primitive 无构造子，实例体走 Int/String 内建特化）。类型身份仍由本文件的内建表提供，
  `Base.Int` 不声明类型。实例落点规则见 [operators.md](operators.md)。
- **比较/相等运算符不是内建值（M31.1）**：`==` `/=` `<` `<=` `>` `>=` 是 `Base.Eq` /
  `Base.Ord` 方法（`eq` / `neq` / `lt` / `le` / `gt` / `ge`）的解析期别名；Int/String 上的
  `bi_eq_int` / `bi_eq_str` / `bi_*_int` / `bi_*_generic` 是这两个类的**内建实例实现**
  （不是运算符的独立语义）。详见 [operators.md](operators.md)。
- **`IO` 是语言内建效应类型**（M37），`Bool` / `List` / `Nat` 是 base 的普通 `data` 声明：
  内建类型按名字恒可见；base 的族身份是完整符号而不是短名：

  | 声明 | canonical 符号 | 来源 | 常量 |
  | --- | --- | --- | --- |
  | `Bool` | `Base.Bool.Bool` | `base/lib/Base/Bool.vuna` | `Intrinsics.boolTypeName` |
  | `True` / `False` | `Base.Bool.True` / `Base.Bool.False` | 同上 | `boolTrueCtor` / `boolFalseCtor` |
  | `List` | `Base.List.List`（`Cons` / `Nil` 同理） | `Base.List` | `listFamilyName` / `listConsCtor` / `listNilCtor` |
  | `Nat` | `Base.Nat.Nat`（`Zero` / `Succ` 同理） | `Base.Nat` | `natTypeName` / `natZeroCtor` / `natSuccCtor` |

- `IO`：kind `Type -> Type`，运行时裸 thunk `int -> 'a`，没有构造器；canonical 身份就是
  源级名 `IO`（`Intrinsics.ioTypeName` / `ioFamilyName`）。`MkIO` 已删除。

- `True` / `False` 精化为核心 `TBool`，codegen 的运行时表示是 OCaml `bool`：canonical Bool
  族**不生成变体声明**（`Codegen.Decl.runtimeDatas` 按 `boolTypeName` 过滤）。
- **没有短名 / `lastName` 判定，也没有「全局构造子放行」**：`True` / `False` / `Cons` /
  `Nil` 与其他构造子一样经 import 的导出表解析（`Prelude` 自动注入 `Base.Bool` /
  `Base.List`，所以裸名可用）。类型位置按 `resolveTypeName` 判定：`Int` / `String` /
  `IO` / `Type` / `->` 是内建，其余（含 `Bool`）查导出表。
- 用户写的 `data Bool` / `data List` 是**普通 data**、不与 canonical 冲突：模块内名字被
  mangle 成 `<Module>.Bool`；入口文件（不做 mangle）里声明 `data Bool` 时族名就是
  `Bool`，与 `Base.Bool.Bool` 是两个族。**`IO` 例外**：它是内建类型名，ad-hoc 入口再写
  `data IO` 报 `TC_CannotRedefineBuiltin`；模块内 `data IO` 仍按 mangle 成为
  `<Module>.IO`（与 `data Bool` 同规则）。`if` / 字面量 `case` 等只认 canonical。

## 3. Int

- 表示：宿主 OCaml `int`，**固定 63 位**：`max_int = 4611686018427387903`、
  `min_int = -4611686018427387904`。类型层没有宽度 / 区间信息，`Int` 就是 `Type`。
- 算术：`+` `-` `*` 在溢出时按**二进制补码回绕**（`max_int + 1 = min_int`），不报错、
  不饱和、不提升为大整数。**无大整数计划**。
- `/`：整数除法向零截断；`a / 0` 在产物运行期抛宿主 `Failure "division by zero"`
  （runtime `bi_div` 显式检查），未捕获时由运行时报告器输出 `vuna: runtime error: ...` 并以 2
  退出；`min_int / -1` 回绕成 `min_int`，不报错。
- 字面量：十进制数字序列，按 `acc * 10 + digit` 累加，**越界同样回绕**（`Lexer.collectInt`）；
  没有一元负号，负数写成 `0 - n`。
- 比较：`==` `/=` `<` `<=` `>` `>=` 返回 canonical `Bool`。

## 3.1 Nat（M34.7）

- **身份**：`Base.Nat.Nat` 是 canonical data（固定 `Zero` / `Succ`），类型层仍是普通归纳族；
  运行时表示是 OCaml `int`，值域 `0..max_int`（4611686018427387903）：`Zero = 0`、
  `Succ n = min(n + 1, max_int)`，**不生成变体类型**。
- **字面量**：期望类型为 Nat 时 `3` 展开成 `Succ (Succ (Succ Zero))`（类型层可合一），
  codegen 折回整数字面量；推断位置仍默认 `Int`。越界检查发生在词法累加（63 位回绕）之后：
  回绕成负数才报 `TC_NatLiteralOutOfRange`（≥ 2^63 的回绕见 [debt.md](debt.md) C40）。
  Nat 字面量只用于表达式：`case n of 0 =>` 这类字面量模式不支持（报
  `TC_OnlyCtorPatterns`），模式侧用 `Zero` / `Succ` 或 `isZero`（见 [debt.md](debt.md) D24）。
- **纯 intrinsic**：`natAdd` / `natSub` / `natMul` / `natDiv`（饱和、减截断到 0、除零与 Int
  同文案）、`natToInt`（恒等）、`natFromInt`（负数 clamp 0）。interp 与产物同语义；
  `+ - * /` 在 Nat 上下文由精化器特化到这些名字（见 [operators.md](operators.md)）。
- **提升**：只允许 `Nat → Int`（精化期插入 `natToInt`，零成本）；`Int → Nat` 必须显式
  `Base.Nat.fromInt`（负数 clamp 0，有损）/ `fromIntMaybe`。混合算术的结果由操作数决定：
  两侧 Nat（或 Nat 与字面量）→ Nat；出现真正的 `Int` → `Int`（Nat 侧经 `natToInt` 提升）。
  低层原语（`strLength` / `arrayLength` 等）仍是 Int，Base 负责暴露 Nat 度量。
- **算术特化不是通用重载**：`+ - * /` 仍是内建运算符，只在 `Int` / `Nat` 上按期望类型或
  实参类型特化；不向用户自定义数值类型开放重载。
- **展示**：`main : Nat` 与 interp 都输出十进制。

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
- 源码字面量转义（`Lexer.lexStringToken` / `decodeEscape`）：`\n` `\t` `\r` `\"` `\\` `\'`、
  M36 新增 `\$`（字面 `${`）；其它 `\x` 报 `UnknownEscape`；单行字面量不能跨行，多行用
  `"""..."""`（构造与边界见 [templates.md](templates.md)）。
- 展示 / 转义统一走 `strShow`（§5），没有第二套实现。

## 5. Show 与 main 展示

`strShow : String -> String`（intrinsic，runtime `dt_show_string`）是**唯一**的字符串展示
实现：加双引号，并转义 `"` → `\"`、`\` → `\\`、LF → `\n`、TAB → `\t`、CR → `\r`；
其余字节原样输出（不走 OCaml 源码发射时的 `\ddd` 转义——那是 `Codegen.Decl` 的内部细节）。

- `Base.Show` 的 `String` 实例委托给它：`show s = strShow s`，因此 `show` 与
  `main : String` 的展示一致。
- `main` 展示钩子（`Codegen.Term.mainShowForName`）：`Int` / `Nat` → `string_of_int`、
  `String` → `strShow`、`Bool` → `dt_show_bool`（输出 `True` / `False`）。
- **展示类型固定为这四类**：`interp`（`Driver.Dt.evalDtMain`）与编译产物
  （`Codegen.Term.mainShowForName`）都支持 `Int` / `Nat` / `String` / `Bool`；其它类型
  （data / record / 函数等）在 `interp` 报 `[CG_MainNotValue] main does not reduce to a
  value`，在产物侧报 `[CG_MainReturnType]`。
- interp 展示（`Core.Eval.showValue`，字符串走 `Core.Term.showCoreString`）与 `strShow`
  同规则、逐字节一致，因此 `main : String` 在 interp 与产物中输出相同。
- `Show Bool` 库实例用 `if` 输出 `True` / `False`，与 `dt_show_bool` 同语义。

## 6. 其它纯原语

| 原语 | 签名 | 语义 |
| --- | --- | --- |
| `strFromInt` | `Int -> String` | 十进制，负数带 `-`（OCaml `string_of_int`） |
| `strHash` | `String -> Int` | 固定 1024 桶：`h` 初值 0，逐字节 `h = (h*33 + byte) mod 1024`，结果 0..1023 |
| `strAt` | `String -> Int -> Int` | 见 §4（越界 `-1`） |
| `strSubstring` | `Int -> Int -> String -> String` | 字节切片（M33 W4）：start/len 按字节 clamp——负 start 视为 0、负 len 视为 0、越界截断到末尾；与 `Base.String.substring` 同语义 |
| `strConcatMany` | `List String -> String` | 一次性拼接（OCaml `String.concat ""`） |
| `strSubstTemplate` | `String -> List String -> String` | `<N>` 占位符按序号替换；非数字 `<`、越界序号原样保留（`Base.Vec.substTemplate`） |
| `timeUs` | `IO Int` | 微秒时间戳（`Unix.gettimeofday`）；效果原语，能力 `clock` |

`strHash` 的 interp 实现（`Core.Eval.strHashOf`）与 runtime `dtp_strHash` 是同一公式。

## 6.1 容器与可变数据原语（M33 W3）

**内建类型构造子**（名字恒可见，与 `Int` / `String` 一样不能被用户重定义；参数个数唯一
真源是 `Intrinsics.typeIntrinsicArities`，OCaml 表示的渲染在 `Codegen.Decl`）：

| 类型 | kind | OCaml 表示 |
| --- | --- | --- |
| `Array a` | `Type -> Type` | `'a array`（不可变语义：不暴露原地写） |
| `IORef a` | `Type -> Type` | `'a ref` |
| `MArray a` | `Type -> Type` | `'a array`（可变语义） |
| `Buffer` | `Type` | `Buffer.t` |

这些是**类型层构造子**，不是 `data` 声明：没有构造子可模式匹配，只能经原语 / 库 API 使用。
类型参数在签名里用隐式 `{a : Type}` 绑定（`Elab.Prelude.ityToTerm` 生成 de Bruijn）。

**纯原语**（无能力，直接返回值）：

| 原语 | 签名 | runtime |
| --- | --- | --- |
| `arrayLength` | `Array a -> Int` | `Array.length` |
| `arrayGet` | `Array a -> Int -> a` | `Array.get` |
| `arraySet` | `Array a -> Int -> a -> Array a` | `dtp_arraySet`（`Array.copy` 后 `Array.set`，copy-on-write） |
| `arrayMake` | `Int -> a -> Array a` | `Array.make` |
| `arrayFromList` | `List a -> Array a` | `Array.of_list`（经 List 桥接 `dtp_ocamlOf`） |
| `arrayToList` | `Array a -> List a` | `Array.to_list`（经 `dtp_listOf`） |

**IO 原语**（返回 `IO` 动作，无能力：不触碰外部世界；经 `Base.IORef` / `Base.MArray` /
`Base.Buffer` 使用）：

| 原语 | 签名 | runtime |
| --- | --- | --- |
| `prim_newRef` / `prim_readRef` / `prim_writeRef` | `a -> IO (IORef a)` / `IORef a -> IO a` / `IORef a -> a -> IO Int` | `ref` / `!` / `:=` |
| `prim_newMArray` / `prim_readMArray` / `prim_writeMArray` / `prim_mArrayLength` | `Int -> a -> IO (MArray a)` / `MArray a -> Int -> IO a` / `MArray a -> Int -> a -> IO Int` / `MArray a -> IO Int` | `Array.make` / `Array.get` / `Array.set` / `Array.length` |
| `prim_newBuffer` / `prim_bufferAdd` / `prim_bufferContents` / `prim_bufferLength` | `IO Buffer` / `Buffer -> String -> IO Int` / `Buffer -> IO String` / `Buffer -> IO Int` | `Buffer.create` / `add_string` / `contents` / `length` |

- 效果原语的 runtime 表达仍是「立即算完的 OCaml 表达式」，由 `ioPrimThunkText` 按 arity
  包成 thunk（`fun args -> fun (_ : int) -> rt args`；零参 `fun (_ : int) -> rt`）。
  零参 `prim_newBuffer` 是动作**值**。
- `arrayFromList` / `arrayToList` 依赖 canonical `Base.List.List` 桥接（`needsListBridge`）；
  完整的桥接清单与缺失时的诊断见 §9。
- **interp 不归约**全部容器原语（`OpNone`）：夹具带 `.nointerp`，只 compile + 运行。
- 越界行为：`arrayGet` / `MArray.read` 越界是宿主 `Invalid_argument`（不是 `strAt` 的
  -1 哨兵，也没有语言层诊断）；`Array.set` 先 `Array.copy`，原数组不变。
- 可变数据的安全边界是 **IO 隔离**：`IORef` / `MArray` / `Buffer` 的句柄只能在 `IO` 动作里
  使用；`runIO` 是 main 外的逃逸口、需要 `unsafe`。**ST/region（M35.1）**：`Base.ST` 的
  `Ref` / `SArray` 只在 `ST r` 里使用且不能逃出 `runST`；M38 起它们是 linear record（句柄恰好一次），
  `ST` 动作本身仍可复制；仍无依赖 multiplicity / 线性箭头（
  多用未禁止，见 [effects.md](effects.md)）。

## 7. 效果原语、IO 动作与能力（M31/M37）

**IO 类型**：`IO` 是语言内建效应类型（kind `Type -> Type`，运行时裸 thunk
`int -> 'a`，无构造器，见 §2）。它的代数也是内建原语：

| 原语 | 签名 | 说明 |
| --- | --- | --- |
| `prim_pureIO` | `{a : Type} -> a -> IO a` | 构造动作 |
| `prim_bindIO` | `{a b : Type} -> IO a -> (a -> IO b) -> IO b` | 串行绑定 |
| `prim_runIO` | `{a : Type} -> IO a -> a` | main 外唯一执行入口；能力 `unsafe` |

`Base.IO` 把 `runIO` / `print` / … 暴露为别名，并提供 `Functor` / `Monad IO` 实例；
`IO` 类型本身恒可见（不需要 import）。它不导出 `bindIO` / `pureIO` / `fmapIO` 这样的名字：
动作组合统一走 `Functor` / `Monad` 实例（`fmap` / `bind` / `pure`、`>>=`、`do`）。

**效果原语类型**：全部效果原语返回 `IO` 动作，而不是「立刻算完的值」：`prim_print : String -> IO Int`、
`prim_readFile : String -> IO String`、`prim_readLine : IO String`、
`prim_readDir : String -> IO (List String)`、`prim_isDirectory` / `prim_fileExists : String -> IO Bool`、
`prim_makeDir` / `prim_removeFile` / `prim_fileMtime` / `prim_fileSize : String -> IO Int`、
`prim_getArgs : IO (List String)`、`prim_getenv : String -> IO String`、
`prim_getcwd` / `prim_execPath : IO String`、`prim_exit : Int -> IO Int`（执行即退出、不返回）、
`prim_runIn : String -> List String -> IO Int`、`prim_spawn : List String -> IO Int`、
`prim_wait : Int -> IO Int`、`prim_readBytes : Int -> IO String`、
`timeUs : IO Int`。零参原语因此是**真正的值**（动作值）：引用不执行、也不重新求值。

纯 `main` 直接调用效果原语是类型错误（`TC_TypeMismatch`）：效果只能出现在 `IO` 动作里。

M38 新增两条调试/诊断原语（`Base.Debug` 的实现基础，见
[debugging.md](debugging.md)）：

- `prim_eprint : String -> IO Int`（能力 `console`）：写 stderr 并 flush，返回写入字节数；
- `prim_fail : String -> a`（**无能力**、不在 `IO` 里）：抛 `Failure <msg>` 的底值，
  由生成的运行时报告器渲染成 `vuna: runtime error: ...` 并 exit 2。用户代码经
  `Base.Debug.assert` / `todo` 使用。

M35.3 新增 `net` 能力与 7 条 socket 原语（工具链 server 与测试用；用户代码同样按能力直调）：

- `prim_netListen : String -> IO Int`：绑定并监听，返回 listener 句柄。地址是
  `tcp:HOST:PORT`（HOST 只接受数字 IPv4；`PORT=0` 取临时端口）或 `unix:PATH`；
- `prim_netPort : Int -> IO Int`：listener 的端口（TCP；unix 返回 0），配合 `PORT=0`；
- `prim_netAccept : Int -> IO Int`：阻塞接受一个连接，返回连接句柄；
- `prim_netRecv : Int -> Int -> IO String`：最多读 n 字节、**有数据就立即返回**（可能更少）；
  `""` 表示对端关闭；
- `prim_netSend : Int -> String -> IO Int`：写完整串（内部循环处理部分写），返回字节数；
- `prim_netClose : Int -> IO Int`：关闭句柄（幂等）；
- `prim_netConnect : String -> IO Int`：客户端连接（`vuna repl --client` 与测试夹具用）。

`net` 是**权限**不是豁免：未声明时报 `` effectful builtin `prim_netListen` requires capability
`net` ``。句柄是小整数，运行时映射到 `Unix.file_descr` 表，**不引入新的语言类型**；
无 DNS / TLS / 异步 / 超时（`accept`/`recv` 阻塞，见 §8）。

**名字面**：效果原语只保留 `prim_*` 名。用户有两条合法用法：

1. `import Base.IO`，使用返回 `IO` 动作的 API（`print` / `readFile` / …——它们是 `prim_*` 的**别名**）；
2. 在 `vuna.toml` 声明所需能力后**直接**调用 `prim_*`，同样得到 `IO` 动作。IO 升格后
   不再要求 `import Base.IO`（类型是内建的），只是没有别名与实例可用。

**执行入口**：动作只在 `main` 处由运行时执行；`main : IO a` 的产物钩子是 `v_main 0`。
`Base.IO.runIO : IO a -> a`（= `prim_runIO`）是唯一的「main 之外执行」入口，要求能力
`unsafe`（工具链特权）：未声明时报
`` `runIO` executes IO outside main; requires capability `unsafe` ... ``；`runIO` 每次调用
都重新执行动作（动作值可复用、效果不缓存）。

**内部 cast（不可见）**：`prim_erase` 是隐藏 intrinsic（`visible = False`），只由精化器在
「运行时类型不可命名」的 binder 使用点插入；签名 `{a} -> a -> a`、runtime `Obj.magic`、
`IntrinsicOp.OpIdentity` 让它对求值/定义性相等透明。用户源码不可引用它（不在 prelude，
也不吃能力位）。设计见 [effects.md](effects.md) §5。

| 能力 | 原语 / 入口 |
| --- | --- |
| `console` | `prim_print`、`prim_readLine`、`prim_readBytes` |
| `fs` | `prim_readFile`、`prim_writeFile`、`prim_writeFileAtomic`、`prim_readDir`、`prim_isDirectory`、`prim_makeDir`、`prim_removeFile`、`prim_fileExists`、`prim_fileMtime`、`prim_fileSize` |
| `process` | `prim_getArgs`、`prim_exit`、`prim_runIn`、`prim_spawn`、`prim_wait` |
| `env` | `prim_getenv`、`prim_getcwd`、`prim_execPath` |
| `clock` | `timeUs` |
| `net` | `prim_netListen`、`prim_netPort`、`prim_netAccept`、`prim_netRecv`、`prim_netSend`、`prim_netClose`、`prim_netConnect` |
| `unsafe` | `prim_runIO`（= `Base.IO.runIO`：在 main 之外执行 IO 动作） |

- 声明面：manifest `[capabilities] effects = ["console", "fs", ...]`，按**包**声明
  （`Frontend.Manifest.manifestCapabilities`）；无 manifest 的 ad-hoc 文件没有能力。
  `vuna interp` 与 `vuna test` 的入口文件同样受这条约束：ad-hoc 文件没有能力，测试文件
  属于所在包、用该包声明的能力。
- 未知能力名报 `unknown capability "<name>" (known: console, fs, process, env, clock, unsafe, net)`
  （`Loader.Resolve.checkCapabilities`）。
- 用到但未声明报
  `` effectful builtin `<name>` requires capability `<cap>` in <package> (declare [capabilities] effects = ["<cap>"] or use Base.IO) ``
  （`Loader.Resolve.checkEffectsBuiltins`）。
- **这是权限声明，不是检查豁免**：能力不改变类型检查、擦除或 codegen 语义，只决定能否在
  源码里直接引用效果原语 / `runIO`；没有按包名字符串判定的 allowlist。
- `Base.IO` 自身声明 `["console", "fs", "process"]`（只做别名，不调用 `runIO`）；`base` 另声明
  `unsafe`（`Base.IO.runIO` 的别名定义与 `Base.ST.runST` 的 `runIO` 使用点，见
  [effects.md](effects.md)）；产品 CLI（根包）声明全部七个能力（含 `unsafe` 与 `net`），编译器包声明六个（不含 `net`）——编译器自身不使用网络。

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
| `prim_writeFileAtomic` | 同 `prim_writeFile`，但写 `<path>.<pid>.tmp` 后 `Sys.rename` 原子替换：并发读者只会看到完整旧内容或完整新内容（workspace 并行 check 的子进程共享缓存目录，必须原子写） |
| `prim_readFile` | 读整个文件为字节串；IO 失败抛宿主异常 |
| `prim_readLine` | 读一行；EOF 返回 `""`（与空行不可区分） |
| `prim_readBytes` | `Int -> String`：最多读 n 字节，**有数据就立即返回**（可能少于 n），EOF 返回 `""`；调用方负责循环 / 拼接（LSP 帧读取用） |
| `prim_readDir` | 目录项按字符串排序；目录不存在 / 不可读时抛宿主异常 |
| `prim_makeDir` / `prim_removeFile` | **幂等**：已存在 / 不存在时直接返回 `0` |
| `prim_fileExists` | 路径不存在时为 `False` |
| `prim_isDirectory` | 普通路径检查；**不存在**的路径抛宿主异常（`Sys_error` → `failwith`） |
| `prim_fileMtime` / `prim_fileSize` | 秒级 mtime / 字节数；取不到时**静默返回 0** |
| `prim_getenv` | 变量未设置或为空串都返回 `""`（两者不可区分） |
| `prim_getcwd` | 失败时返回 `"."` |
| `prim_execPath` | 先读 `/proc/self/exe`（**Linux 假设**），失败回落 `Sys.executable_name` |
| `prim_getArgs` | 排除 `argv[0]` 的其余参数 |
| `prim_exit` | 立即退出进程（原语类型 `Int -> IO Int`，执行即退出、**不返回**） |
| `prim_runIn` | 在给定目录执行 `sh` 命令并返回退出码，执行后恢复原 cwd |
| `prim_spawn` | 异步启动子进程（argv 列表，继承 stdin/stdout/stderr），返回 pid |
| `prim_wait` | 等待子进程并返回退出码（signal/stopped 归 1） |
| `prim_netListen` | 绑定并监听：`tcp:HOST:PORT`（`SO_REUSEADDR`，backlog 8）或 `unix:PATH`（bind 前删除已存在的路径，开发工具惯例）；返回句柄表下标；失败 `failwith "net: ..."` |
| `prim_netPort` | `getsockname` 的端口（TCP）；unix socket 返回 0 |
| `prim_netAccept` | 阻塞接受一个连接，返回新句柄 |
| `prim_netRecv` | 阻塞 `Unix.read`：有数据即返回（可能少于 n），对端关闭返回 `""` |
| `prim_netSend` | 循环写完整串（处理部分写）；对端关闭时报 `net: send: connection closed` |
| `prim_netClose` | 关闭 fd 并从句柄表移除（幂等） |
| `prim_netConnect` | 客户端 `Unix.connect`（`tcp:`/`unix:` 同一套地址语法） |

效果原语的 runtime 表（`dtp_*`）仍是**立即执行**的 OCaml 函数；生成器
（`Codegen.Term.ioPrimText`）按 `Intrinsic` 的 arity 把它们包成 **thunk 动作值**，例如
`prim_getcwd` → `(fun (_ : int) -> dtp_getcwd ())`、`prim_print` →
`(fun s -> fun (_ : int) -> dtp_print s)`。IO 代数原语（`prim_pureIO` / `prim_bindIO`）
由 `ioAlgebraText` 单独生成（runtime 本身就是动作值）；`prim_runIO` →
`(fun io -> io 0)`。世界令牌标注 `int` 是必须的（否则 OCaml 值限制留下弱类型变量）。
因此零参原语（`prim_getArgs` / `prim_readLine` / `prim_getcwd` / `prim_execPath` /
`timeUs`）是动作**值**：引用不执行、不重新求值；需要快照 / 执行时显式
`let t = runIO timeUs` 或在 `do` 里 `<-`。

## 9. interp 归约边界

`vuna interp` 是精化后的纯核心求值器（`Core.Eval.primReduce` 按 `IntrinsicOp` 归约）。
语言运算符 `+ - * /`、`== /= < <= > >=`、`++`、`&&`、`||` 全部归约（`/` 除零例外）。
边界按**显式分类**处理，不是静默错值：

| 类别 | 归约 | 说明 |
| --- | --- | --- |
| 上述运算符 | 是 | `/` 在除数为 0 时**不归约**（见下） |
| `strFromInt` / `strLength` / `strHash` / `strAt` / `strSubstring` / `strShow` | 是 | 与 runtime **同语义同公式** |
| `natAdd` / `natSub` / `natMul` / `natDiv` / `natToInt` / `natFromInt` | 是 | 与 runtime 同饱和 / 截断语义 |
| `strUnpack` / `strPack` / `strConcatMany` / `strSubstTemplate` | **否** | 结果依赖 `Base.List.List` 的构造子表示（List 桥接），核心求值器不构造该表示 |
| 全部 `OpNone` 原语：效果原语（`prim_*` / `timeUs`）、IO 代数、容器原语、`prim_marshal` / `prim_unmarshal`、`prim_fail` | **否** | 纯求值器不执行效果 / 不构造内建容器表示 |
| `a / 0` | **否** | 核心求值器表达不了运行期异常；显式分类，不返回 0 |

- 不可归约时 `main` 报 `[CG_MainNotValue] main does not reduce to a value`。
- `main : IO a` 一律报
  `error: [CG_InterpCannotExecuteEffects] interp cannot execute effects (main : IO a); compile and run the program instead`
  （退出码 2；无 `DT:` 前缀），不做「纯动作求值、效果丢弃」。
- **List 桥接**：codegen 把返回或接收 `List` 的 10 个原语映射到桥接 helper（`dtp_unpack` /
  `dtp_pack` / `dtp_concatMany` / `dtp_substTemplate` / `dtp_listOf` / `dtp_ocamlOf`）：
  `strUnpack` / `strPack` / `strConcatMany` / `strSubstTemplate`、`prim_getArgs` /
  `prim_readDir` / `prim_runIn` / `prim_spawn`、`arrayFromList` / `arrayToList`。桥接只为
  canonical `Base.List.List` 声明生成；包内没有该族时（例如没有 base 依赖）codegen 报
  ``[CG_ListBridgeRequired] builtin `<name>` requires the canonical `Base.List.List` declaration ...``。
- 相关夹具带 `.nointerp` 标记，只做 `compile` + 运行产物。

## 10. 受限 FFI（M33 W5）

语法（顶层声明，任意模块；入口与库模块一致）：

```vuna
extern c_add "vuna_add" : Int -> Int -> Int
```

- `extern` 后是 vuna 值名，字符串是 C 符号名；无 `=` 体。运行时由包根 `ffi/*.c`
  提供的 C 函数实现。
- **允许的类型**（`Elab.Driver.checkExternTy`）：`Int` / `String` / `Bool`，以及
  `Array Int` / `Array String` / `Array Bool`（**不含 `Nat`**）；只允许显式参数（不允许
  隐式、依赖类型、泛型、函数参数 / 回调）。超出子集报 `TC_FfiTypeUnsupported`。
- **codegen**：`DtExtern` 在运行时分组生成 OCaml
  `external v_<name> : <ocaml ty> = "<c_symbol>"`；`compileToDir` 把包根 `ffi/*.c`
  复制到 `OUTDIR/ffi/`，生成的 `build.sh` 用 `ocamlopt -c` 编译并按 `.o` 链接
  （确定性构建；C 编译失败是构建期错误）。
- **C ABI**：`int` 在 C 侧是 tagged `value`（`Long_val` / `Val_long`，见
  `caml/mlvalues.h`）；`Bool` 用 `Bool_val` / `Val_bool`；`String` 用
  `String_val`（只读，不保证 NUL 结尾之外的布局）。不要用 32 位 `int` / `intnat`
  直接接 OCaml 的 `int`。
- **边界**：没有回调 / GC root / pin、没有字符串 / 数组的双向可变共享（String 只读传递）、
  没有 C 头文件解析（符号名与签名都要手写）；interp 不执行 extern（`main` 里用到时
  只走 compile + 运行）。
- C 实现是包的一部分：`ffi/` 目录随包走，不改变 `vuna.toml` 形状。

## 11. 已知边界

- 无大整数、无溢出诊断；`Int` 的 63 位宽度是宿主实现事实。
- 无 Unicode 码点 API / 无 UTF-8 校验；`String` 是字节串，`strPack` 越界是宿主错误。
- `prim_execPath` 依赖 `/proc/self/exe`（Linux），其它平台走 `Sys.executable_name`。
- `strPack` / `strUnpack` 的 List 桥接、`strSubstTemplate` 的模板扫描均在 runtime 里实现，
  interp 不覆盖（§9）。
- 原语的失败（IO 错误、`strPack` 越界、`/0`、`exit`）都是**宿主异常 / 进程退出**，
  由生成的运行时报告器统一报告（见 [debugging.md](debugging.md)），不是语言的可捕获错误。
- `net` 只有 TCP（数字 IPv4）与 Unix domain socket：无 DNS、TLS、异步/超时、并发；
  `accept`/`recv` 是阻塞语义。原语本身不限制绑定地址，`vuna repl --listen` 在 CLI 层只接受
  loopback 与 Unix socket（见 [tooling.md](tooling.md)）。
- 以上是原语与 runtime 侧的现状边界；开放债务见 [debt.md](debt.md)。
