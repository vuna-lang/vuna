# 原语语义规范（Int / String / Show / 效果原语与宿主层）

本文是 vuna **原语语义的唯一权威**：值域与宽度、字符串编码、错误行为、核心求值归约边界、
效果原语与宿主层模型、生成 runtime 的契约。内建声明面只有一份真源
`Vuna.Compiler.Base.Intrinsics`（`allIntrinsics` / `IntrinsicOp`），消费方是
`Loader.Resolve`（解析）、`Elab.Prelude`（签名）、`Target.Ocaml.Term`（runtime
映射）、`Core.Eval`（核心求值归约）。语法见 [language.md](language.md)，类型规则见
[type-system.md](type-system.md)，库的边界见 [stdlib.md](stdlib.md)，开放债务见
[debt.md](debt.md)。

## 1. 术语

| 术语 | 含义 |
| --- | --- |
| primitive 类型 | `Int` / `String`：没有 `data` 声明，表示与字面量由编译器提供 |
| intrinsic | `Base.Intrinsics.allIntrinsics` 的一条：名字、签名形状（`IType`）、核心求值归约标签（`IntrinsicOp`）、runtime 表达式、是否对源码可见 |
| runtime helper | 生成产物 `Vuna_runtime.ml` 里的 OCaml 函数（`bi_*` / `dtp_*` / `dt_show_string`）；`bi_*` 不对用户源码可见 |
| 效果原语 | `intrinsicReturnsEff` 的 intrinsic：隐藏的 `@vuna@prim_eff_*`（`Eff []` 动作叶子）；可见的只有 `effTimeUs` |
| 宿主层 | 用户面经 `Base.Effect.*` 标签 + handler；宿主原语（`@vuna@prim_eff_*` / `@vuna@host@*`）源码写不出，只由 base handler 使用 |

## 2. 身份与常量

- **`Int` / `String` / `Float` 是语言 primitive 类型**（`Base.Intrinsics.typeIntrinsicNames =
  [Int, String, Float]`）：prelude 直接提供对应 `Type`；入口 / 未限定名处的 `data Int` /
  `data String` / `data Float` 报 `CannotRedefineBuiltin`（模块内声明会 mangle 成 `M.Int`，
  属于不同符号）。它们的 **Eq / Ord / Show 实例宿主模块**是 `Base.Data.Int` /
  `Base.Data.String` / `Base.Data.Float`（实例跟类型模块走；primitive 无构造子，实例体走内建特化）。
  类型身份仍由本文件的内建表提供，`Base.Data.Int` 不声明类型。**这是设计选择而非欠账**：把
  `Int`/`String`/`Float` 上移成源码 `primitive type` 声明需要两阶段 bootstrap、改大量身份
  比较与 `Base` 叶模块拆分，功能零增益；用户自定义 primitive 类型的需求归受限 FFI
  （[debt.md](debt.md) D21）。
  实例落点规则见 [operators.md](operators.md)。
- **比较/相等运算符不是内建值**：`==` `/=` `<` `<=` `>` `>=` 是 `Base.Trait.Eq` /
  `Base.Trait.Ord` 的方法名本身（`(==)` / `(/=)` / `(<)` / `(<=)` / `(>)` / `(>=)`）；Int/String 上的
  `bi_eq_int` / `bi_eq_str` / `bi_*_int` / `bi_*_str` / `bi_*_bool` 是这两个类的**内建实例实现**
  （不是运算符的独立语义）。详见 [operators.md](operators.md)。
- **`Eff` 是唯一动作类型**，`Bool` / `List` / `Nat` 是 base 的
  普通 `data` 声明：
  内建类型按名字恒可见；base 的族身份是完整符号而不是短名：

  | 声明 | canonical 符号 | 来源 | 常量 |
  | --- | --- | --- | --- |
  | `Bool` | `Base.Data.Bool.Bool` | `packages/base/lib/Base/Bool.vuna` | `Base.Intrinsics.boolTypeName` |
  | `True` / `False` | `Base.Data.Bool.True` / `Base.Data.Bool.False` | 同上 | `boolTrueCtor` / `boolFalseCtor` |
  | `List` | `Base.Data.List.List`（`(::)` / `Nil`） | `Base.Data.List` | `listFamilyName` / `listConsCtor` / `listNilCtor` |
  | `Nat` | `Base.Data.Nat.Nat`（`Zero` / `Succ` 同理） | `Base.Data.Nat` | `natTypeName` / `natZeroCtor` / `natSuccCtor` |

  三族的身份、固定构造子与运行时表示类别在 `Base.Intrinsics.canonicalFamilies` 单点声明
  （`FamilyRepr` = `FamReprBool` / `FamReprNat` / `FamReprBoxed`）：表示判定、IR 类型、
  展示与 FFI 白名单都查这张表，新增 canonical 族只改这里。

- `Eff`（`Base.Effect.Core.Eff`）：`Row -> Type -> Type` 的 base data，装箱表示 `MkEff`（不导出）；
  行是擦除索引。入口 `main : Eff r a`（内建宿主标签由 entry 预装 handler），执行 `runPure`（[effects.md](effects.md) §2）。


- `True` / `False` 精化为核心 `TBool`，codegen 的运行时表示是 OCaml `bool`：canonical Bool
  族**不生成变体声明**（`Lowering.Env.rtDatasOf` 按 canonical 族表剔除 `FamReprBool` /
  `FamReprNat`）。
- **没有短名 / `lastName` 判定，也没有「全局构造子放行」**：`True` / `False` / `Cons` /
  `Nil` 与其他构造子一样经 import 的导出表解析（`Prelude` 自动注入 `Base.Data.Bool` /
  `Base.Data.List`，所以裸名可用）。类型位置按 `resolveTypeName` 判定：`Int` / `String` /
  `Type` / `->` 等是内建，其余（含 `Bool`）查导出表。
- 用户写的 `data Bool` / `data List` 是**普通 data**、不与 canonical 冲突：模块内名字被
  mangle 成 `<Module>.Bool`；入口文件（不做 mangle）里声明 `data Bool` 时族名就是
  `Bool`，与 `Base.Data.Bool.Bool` 是两个族。`if` / 字面量 `case` 等只认 canonical。

## 3. Int

- 表示：宿主 OCaml `int`，**固定 63 位**：`max_int = 4611686018427387903`、
  `min_int = -4611686018427387904`。类型层没有宽度 / 区间信息，`Int` 就是 `Type`。
- 算术：`+` `-` `*` 在溢出时按**二进制补码回绕**（`max_int + 1 = min_int`），不报错、
  不饱和、不提升为大整数。**无大整数计划**。`+ - * /` 是 `Base.Trait.Num` 方法
  （`add` / `sub` / `mul` / `div`）的中缀别名，Int 实例的方法体由精化器特化回
  `bi_*` 内建原语；下面的数值语义不变。
- `/`：整数除法向零截断；`a / 0` 在产物运行期抛宿主 `Failure "division by zero"`
  （runtime `bi_div` 显式检查），未捕获时由运行时报告器输出 `vuna: runtime error: ...` 并以 2
  退出；`min_int / -1` 回绕成 `min_int`，不报错。
- 字面量：十进制数字序列；累加超出 63 位可表示范围即报 `LX_IntLiteralOutOfRange`（不再回绕）。
  没有一元负号，负数写 `0 - n`；`min_int` 的绝对值超出可表示字面量，写 `0 - 4611686018427387903 - 1`。
- 比较：`==` `/=` `<` `<=` `>` `>=` 返回 canonical `Bool`。

### 3.0 位运算原语

- 名字（可见）：`bitAnd` / `bitOr` / `bitXor` / `bitNot` / `bitShl` / `bitShr`。
- **语义按 63-bit 二进制补码**（与 `Int` 的表示一致；这是语言契约，不是实现细节——
  内容寻址要求跨后端逐字节一致，所以 wasm 后端也按 63-bit 模拟）：
  `bitNot x = -x - 1`；`bitShl` 低位补 0；`bitShr` 是**逻辑**右移（高位补 0）。
- **移位计数越界返回 0**：`n < 0 || n >= 63` ⇒ 结果 0（OCaml 原生越界移位是未定义行为，
  不暴露给用户）。
- 没有 `bitRor` 原语：32-bit 固定宽度算术（`mask8` / `mask32` / `add32` / `rotr32` /
  `rol32` / `shl32` / `shr32`）在 `Base.Data.Bits` 库层；宽度策略留在库里，不进原语。
- 没有运算符形式（`&` / `|` / `^` / `<<` / `>>`）：需要时用命名函数，或自己声明 `infixl`。
- 核心求值与 runtime 同语义（`Core.Eval.primReduce` 委托给同名原语；codegen 生成
  `bi_bit*`，and/or/xor/not 的饱和应用直接内联成 OCaml 位运算符）。三个后端都走
  `IrRtApp`（`irInlineArity` 用内建名 `bitAnd`…）；wasm/native 已实现，见
  [wasm.md](wasm.md) §5、[native-runtime.md](native-runtime.md) §1。

## 3.1 Nat

- **身份**：`Base.Data.Nat.Nat` 是 canonical data（固定 `Zero` / `Succ`），类型层仍是普通归纳族；
  运行时表示是 OCaml `int`，值域 `0..max_int`（4611686018427387903）：`Zero = 0`、
  `Succ n = min(n + 1, max_int)`，**不生成变体类型**。
- **字面量**：期望类型为 Nat 时 `3` 展开成 `Succ (Succ (Succ Zero))`（类型层可合一），
  codegen 折回整数字面量；推断位置仍默认 `Int`。超出 63 位可表示范围的字面量在词法期
  报 `LX_IntLiteralOutOfRange`（不再回绕；`TC_NatLiteralOutOfRange` 仅作内部防御）。Nat 字面量
  模式（`case n of 0 => ...; 1 => ...`）在模式解析时展开成 `Zero` / `Succ` 构造子模式，与
  构造子模式混用合法，穷尽性由模式矩阵判定（`0` + `Succ k` 即穷尽），不要求兜底；`Int` / `String`
  字面量模式仍降成 `if` 链并要求兜底。
- **纯 intrinsic**：`natAdd` / `natSub` / `natMul` / `natDiv`（饱和、减截断到 0、除零与 Int
  同文案）、`natToInt`（恒等）、`natFromInt`（负数 clamp 0）。核心求值与产物同语义；
  `+ - * /` 在 Nat 上下文由精化器特化到这些名字（见 [operators.md](operators.md)）。
- **提升**：只允许 `Nat → Int`（精化期插入 `natToInt`，零成本）；`Int → Nat` 必须显式
  `Base.Data.Nat.fromIntClamp`（负数 clamp 0，有损）/ `fromIntMaybe`。混合算术的结果由操作数决定：
  两侧 Nat（或 Nat 与字面量）→ Nat；出现真正的 `Int` → `Int`（Nat 侧经 `natToInt` 提升）。
  低层原语（`strLength` / `arrayLength` 等）仍是 Int，Base 负责暴露 Nat 度量。
- **算术 = `Num` 方法**：`+ - * /` 是 `Base.Trait.Num` 方法 `add` / `sub` / `mul` / `div`
  的中缀别名；`Int` / `Nat` / `Float` 实例由精化器按期望类型/实参类型特化回内建原语，
  其它类型走普通 trait 方法应用。用户类型实现 `Num`（并配 `FromInt` 收字面量）即可重载
  四则（`1 + 2 : MyNum`），见 [operators.md](operators.md)「`Num` 的唯一真源」。
- **度量返回 Nat（只留在 Eff handler 的 result 族）**：`Base.Effect.Console.Print` 与
  `Base.Effect.Fs.WriteFile` / `FileSize` 的结果是 `Nat`（handler 在边界从原语的 `Int` 转 `Nat`）。
  宿主原语是隐藏名（`@vuna@host@print` / `@vuna@host@tryWriteFile` / `@vuna@host@fileSize`），
  源码写不出、只由 handler 调用，返回 `Int`；`@vuna@prim_eff_eprint` 与编译器内部计数器
  （level/meta/fuel/span/arity、字节计数中间量）保留 `Int`。
- **展示**：`main : Nat` 与核心求值都输出十进制。

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
  `\$`（字面 `${`）；其它 `\x` 报 `UnknownEscape`；单行字面量不能跨行，多行用
  `"""..."""`（构造与边界见 [templates.md](templates.md)）。
- 展示 / 转义统一走 `strShow`（§5），没有第二套实现。

## 5. Show 与 main 展示

`strShow : String -> String`（intrinsic，runtime `dt_show_string`）是**唯一**的字符串展示
实现：加双引号，并转义 `"` → `\"`、`\` → `\\`、LF → `\n`、TAB → `\t`、CR → `\r`；
其余字节原样输出（不走 OCaml 源码发射时的 `\ddd` 转义——那是 `Target.Ocaml.Decl` 的内部细节）。

- `Base.Trait.Show` 的 `String` 实例委托给它：`show s = strShow s`，因此 `show` 与
  `main : String` 的展示一致。
- `main` 展示钩子（`Lowering.Entry` 的 `mainShowRtIr` + `Target.Ocaml.Term.genEntryHook`）：`Int` / `Nat` → `string_of_int`、
  `String` → `dt_show_string`（即 `strShow`）、`Bool` → `dt_show_bool`（输出 `True` /
  `False`）、`Float` → `string_of_float`。
- **其它类型走 `Show` 实例**：精化收尾（`Elab.Driver.finishCore`）对非内建的结果
  类型（`main : Eff [] a` 先剥掉动作层取 `a`）搜索 `Dict_Show a`，合成
  `@vuna@main_show : a -> String`（body 是方法投影 `\x -> show {a} {dict} x`）。
  入口 lowering（`Lowering.Entry`）的 `mainShowRtIr` 对它回退到这条定义名；核心求值（`Driver.Dt.evalDtMainCore`）对 main 值应用
  同一份定义后打印。找不到实例在**精化期**报
  `[TC_NoInstanceFound] no instance found for <T>`；`@vuna@main_show` 在 split 归属里固定
  归入口单元 `Main`。
- **`vuna test` 的 main 判据不变**：`packages/toolchain/lib/Vuna/TestRunner.dtMainKind` 只认
  `Int` / `Nat` / `String` / `Bool`（按返回 0/空串/True 判通过）与动作入口（退出码 0）；
  其它类型报 `unsupported test main type`。展示规则不改变测试通过判据——
  需要按 `Show` 类型写「纯测试」只能显式转成 `String` 判定。
- 核心求值展示（`Core.Eval.showValue`，字符串走 `Core.Term.showCoreString`）与 `strShow`
  同规则、逐字节一致，因此 `main : String` 在核心求值与产物中输出相同。非内建类型经
  `@vuna@main_show` 得到的是 `String`，两侧都直接 `print_endline`（**不加引号**）。
- `main : Eff [] a` 的核心求值仍是一律报错（纯核心求值器不执行效果，测试夹具关闭 interp 阶段）；
  产物侧先执行动作（`runPure`），再按上面的规则展示结果。
- `Show Bool` 库实例用 `if` 输出 `True` / `False`，与 `dt_show_bool` 同语义。

## 6. 其它纯原语

| 原语 | 签名 | 语义 |
| --- | --- | --- |
| `strFromInt` | `Int -> String` | 十进制，负数带 `-`（OCaml `string_of_int`） |
| `strHash` | `String -> Int` | 固定 1024 桶：`h` 初值 0，逐字节 `h = (h*33 + byte) mod 1024`，结果 0..1023 |
| `strAt` | `String -> Int -> Int` | 见 §4（越界 `-1`） |
| `strSubstring` | `Int -> Int -> String -> String` | 字节切片：start/len 按字节 clamp——负 start 视为 0、负 len 视为 0、越界截断到末尾；与 `Base.Data.String.substring` 同语义 |
| `strConcatMany` | `List String -> String` | 一次性拼接（OCaml `String.concat ""`） |
| `strSubstTemplate` | `String -> List String -> String` | `<N>` 占位符按序号替换；非数字 `<`、越界序号原样保留（`Base.Data.Vec.substTemplate`） |
| `effTimeUs` | `Eff [] Int` | 微秒时间戳（`Unix.gettimeofday`）；效果原语（clock 组） |
| `@vuna@prim_eff_sleep` | `Int -> Eff [] Int` | 阻塞睡眠 n 微秒（runtime `dtp_sleep` = `Unix.sleepf`；n <= 0 立即返回 0）；效果原语（clock 组）；核心求值不归约 |

`strHash` 的核心求值实现（`Core.Eval.strHashOf`）与 runtime `dtp_strHash` 是同一公式。

## 6.1 容器与可变数据原语

**内建类型构造子**（名字恒可见，与 `Int` / `String` 一样不能被用户重定义；参数个数唯一
真源是 `Base.Intrinsics.typeIntrinsicArities`，OCaml 表示的渲染在 `Target.Ocaml.Decl`）：

| 类型 | kind | OCaml 表示 |
| --- | --- | --- |
| `Array a` | `Type -> Type` | `'a array`（不可变语义：不暴露原地写） |

隐藏的可变容器类型（`@vuna@Cell a` / `@vuna@MArray a` / `@vuna@MDynArray a` /
`@vuna@MBuffer`）同样在这张表里：它们是 `Base.Container.Mut*` 句柄的内部表示，
由 `alias record` / 单构造子 data 包住（[effects.md](effects.md) §8.8）。

这些是**类型层构造子**，不是 `data` 声明：没有构造子可模式匹配，只能经原语 / 库 API 使用。
类型参数在签名里用隐式 `{a : Type}` 绑定（`Elab.Prelude.ityToTerm` 生成 de Bruijn）。

**纯原语**（直接返回值）：

| 原语 | 签名 | runtime |
| --- | --- | --- |
| `arrayLength` | `Array a -> Int` | `Array.length` |
| `arrayGet` | `Array a -> Int -> a` | `Array.get` |
| `arraySet` | `Array a -> Int -> a -> Array a` | `dtp_arraySet`（`Array.copy` 后 `Array.set`，copy-on-write） |
| `arrayMake` | `Int -> a -> Array a` | `Array.make` |
| `arrayFromList` | `List a -> Array a` | `Array.of_list`（经 List 桥接 `dtp_ocamlOf`） |
| `arrayToList` | `Array a -> List a` | `Array.to_list`（经 `dtp_listOf`） |

**可变数据原语**（`Eff []`；不触碰外部世界）：用户面是 `Base.Container.Mut*` 的值句柄，
库函数直接调用隐藏原语 `@vuna@prim_mrefNew` / `@vuna@prim_mrefRead` /
`@vuna@prim_mrefWrite`（数组 / 缓冲同族：`@vuna@prim_marr*` / `@vuna@prim_dyn*` /
`@vuna@prim_mbuf*`）。句柄类型是 `alias record` 包住 `@vuna@Cell` 等隐藏表示；分配与读写
要求 `MutOp` 标记（[effects.md](effects.md) §8.8）。

- 效果原语的 runtime 表达仍是「立即算完的 OCaml 表达式」，由 `effThunkText` 按 arity
  包成 `MkEff` thunk（`fun args -> fun (_ : int) -> rt args`；零参 `fun (_ : int) -> rt`）。
- `arrayFromList` / `arrayToList` 依赖 canonical `Base.Data.List.List` 桥接（契约里
  `irRtBridgesList = True`，实现见 `Target.Ocaml.Runtime`）；完整的桥接清单与缺失时的诊断见 §9。
- **核心求值不归约**全部容器原语（`OpNone`）：夹具关闭 interp 阶段，只 compile + 运行。
- 越界行为：`arrayGet` 越界是宿主 `Invalid_argument`（不是 `strAt` 的
  -1 哨兵，也没有语言层诊断）；`Array.set` 先 `Array.copy`，原数组不变。
- 可变数据的安全边界：可变容器操作返回 `Eff []`，但要求 `MutOp` 标记；句柄是普通值，
  可以逃逸（GC 所有权，见 [effects.md](effects.md) §8.8）。没有 region/ST 令牌；
  也没有依赖 multiplicity / 线性箭头（多用未禁止，见 [effects.md](effects.md)、
  [debt.md](debt.md) D22）。

## 6.2 多线程原语

**内建类型构造子**（与 `Array` / `@vuna@Cell` 同层；名字恒可见、不可重定义，参数个数真源是
`Base.Intrinsics.typeIntrinsicArities`）：

| 类型 | kind | 运行时承载 |
| --- | --- | --- |
| `Thread a` | `Type -> Type` | 并行执行流的句柄 |
| `Mutex` / `Condvar` / `Atomic` | `Type` | 互斥 / 条件变量 / 63-bit 原子单元 |

这些类型在 IR 里统一落 `IrTyOpaque`（擦除值），OCaml runtime helper 用 `Obj.t` 承载；
语言层类型安全仍由 prelude 类型保证。`Atomic` 只承载 `Int`。

**原语**（全部返回 `Eff []`、`OpNone`；可见名 + `@vuna@` 隐藏别名，基库用隐藏名）：

| 原语 | 签名 |
| --- | --- |
| `prim_eff_threadSpawn` | `{a} -> (Int -> a) -> Eff [] (Thread a)` |
| `prim_eff_threadJoin` | `{a} -> Thread a -> Eff [] a` |
| `prim_eff_threadYield` / `threadId` / `threadParallelism` | `Eff [] Int` |
| `prim_eff_mutexNew` | `Eff [] Mutex` |
| `prim_eff_mutexLock` / `TryLock` / `Unlock` | `Mutex -> Eff [] Int` / `Eff [] Bool` / `Eff [] Int` |
| `prim_eff_condvarNew` | `Eff [] Condvar` |
| `prim_eff_condvarWait` | `Condvar -> Mutex -> Eff [] Int` |
| `prim_eff_condvarSignal` / `Broadcast` | `Condvar -> Eff [] Int` |
| `prim_eff_atomicNew` | `Int -> Eff [] Atomic` |
| `prim_eff_atomicLoad` / `Store` | `Atomic -> Eff [] Int` / `Atomic -> Int -> Eff [] Int` |
| `prim_eff_atomicFetchAdd` / `Exchange` | `Atomic -> Int -> Eff [] Int`（返回旧值） |
| `prim_eff_atomicCompareExchange` | `Atomic -> Int -> Int -> Eff [] Int`（返回旧值） |

语义：

- **线程体是 `Eff [] a`**：任务内效应必须由任务自己的 handler 处理干净，不继承父线程的
  handler 栈；续延不跨线程恢复。线程内未捕获错误按运行时错误报告并 exit 2；`join` 不做
  `Result` 包装。宿主效应要在任务体内显式安装真实 handler，例如
  `runFsError "fs-error" (runFsHost comp)` 把默认实例 fs 装进 worker（夹具
  `effect/common/104`）；native 的宿主 scratch（路径 / stat / 读缓冲）按线程隔离，
  多个 worker 并行 fs 互不覆盖（夹具 `effect/common/105`）。
- **同步**：`Atomic` 操作顺序一致（63-bit `Int` 回绕）；`Mutex` 非公平、非递归、无 owner 检查；
  `Condvar` 允许虚假唤醒；`join` / `lock` / `wait` 建立 happens-before。
- **可共享可变状态**只有这四类句柄。`MutRef` 单元与可变容器（`MArray` / `MDynArray` / `MBuffer`）不是线程安全的（跨线程访问属数据竞争）；
  `List` / `String` / record / 不可变 `Array` 共享读安全。
- 这些是**阻塞的宿主操作**：不经过单线程 fiber 调度器，也不让出纤程。`join` 只允许一次、
  不能 join 当前线程；未 join 的线程在进程退出时被一并结束。
- 没有取消 / 优先级 / 线程本地存储 / 异步 I/O；协作取消用 `Atomic` 标志 + `join` 组合。

**库面组合子**：`Base.Thread.Par` 的 `parMap` / `parMapWith` / `parFoldMap` 把列表切成连续块，
每块一个 `spawn`，结果按输入顺序拼接；并行度收敛到 `1..min 32 parallelism n`，`k = 1` 时在调用
线程顺序执行（不 spawn，也是 worker 内不要再并行的逃生口）。纯 body 用这三个；effectful body 用
`parMapEff` / `parMapEffWith`，第一个参数是 worker 内的收口 runner `Eff r b -> Eff [] c`。
每个宿主效应模块都有默认实例的闭合 runner：Console / Clock / Env / Args / Stdin / Tty / Exit 是
`runConsoleEff` … `runExitEff : Eff [XOp] a -> Eff [] a`，Fs / Process / Net 是
`runFsResult` / `runProcessResult` / `runNetResult : Eff [XOp] a -> Eff [] (Result a)`
（`Process` 的 `Exit` 在 runner 里仍是真实退出）。runner 在子线程里安装自己的 handler，
父线程 handler 栈仍不继承；不提供取消；不可嵌套。夹具 `effect/common/106` 覆盖逐项
读 → 算 → 写与失败收成 `Result`，`107` 覆盖 Console / Clock / Env / Args / Tty 的并行 runner，
native `96` 与 ocaml `95` 分别覆盖 Process / Net 的 `Result` runner。

**target 能力**：`Ir.Runtime.irRtTargets` 是唯一判据。同步原语（Mutex / Condvar / Atomic）是
`["ocaml","native"]`；调度子集（spawn / join / yield / id / parallelism）三端都支持，wasm 上按
单线程顺序退化（`spawn` 立即执行、`join` 读回、`parallelism = 1`）。

**native 运行时**（`Native.Runtime` 的 `thread_*` / `*mutex*` / `*condvar*` / `atomic_*`）：

- 线程 = 共享地址空间的内核线程（`clone`，`CLONE_VM|FS|FILES|SIGHAND|THREAD|SYSVSEM|SETTLS`）；
  每线程一条虚拟栈（缺省 64 MiB，读 `VUNA_NATIVE_STACK_MB`，下限 1 MiB；低页
  `PROT_NONE` 护栏），TCB 在栈顶下方、`%fs` 指向它；4096 槽的线程表登记 live TCB
  （槽在 `join` 时用 CAS 清空，串行 spawn/join 可以无限次复用槽）。Thread 对象在堆上
  （state/futex | result | stack base | size | closure | tcb | slot | scratch），`join`
  用 futex 等 state，完成后 `munmap` 栈与 scratch；重复 join 返回同一结果。登记失败时先
  `munmap` 刚分配的栈与 scratch 再 trap `too many threads (limit 4096)`；**没有 detach**：
  spawn 出来的句柄必须 join，否则槽、栈与 scratch 都不回收（见 [debt.md](debt.md) D140）。
- 子线程在 `runPure` 里执行任务体；`threadId` 是线程表槽号（主线程 0，与 OCaml 的 domain
  id 同口径），`threadParallelism` 数 `sched_getaffinity` 的位。
- 分配：有子线程（`rt_thread_count > 0`）时 `alloc` 拿一把 futex 堆锁；单线程路径不加锁。
- **STW GC**：回收器置 `rt_gc_requested`，等 `rt_parked_threads == live-1`；线程在
  `alloc` / 循环头（`rt_safepoint`，只在线程程序里注入）、futex 等待（`block_begin`/
  `block_end`）以及阻塞的宿主 syscall（read / write / wait4 / nanosleep / getdents64，
  有子线程时才标记）发布 `saved_rsp` 并停车。根集 = 每个 live 线程的 `[saved_rsp, stack_top)`
  保守扫描 + CAF + 每个线程 TCB 的 cleanup 链。回收结束清请求、推进 `rt_gc_epoch` 并唤醒
  全部停车线程（先读 epoch 再查请求，避免丢失唤醒）。扫描上界取 `rt_thread_hi`（已用最高
  槽 + 1，单调）而不是表容量：并发通常只有几十，扫满 4096 槽会在 `GC_STRESS` 下变成可测
  开销；槽里解引用 TCB 前核对 magic，表被写坏时 trap 而不是把任意内存当 TCB 扫。
- `Mutex` 是 3 态 futex（0 空闲 / 1 锁定 / 2 有等待者）；`Condvar` 是 32-bit 序号 + futex
  （抗虚假唤醒）；`Atomic` 是 8 字节单元，load 普通 mov、store/RMW `xchg`/`lock` 前缀
  （C11 seq_cst 的 x86 映射），`fetchAdd` 用 CAS 循环并保持 63-bit 回绕。
- 宿主态是**每线程**的：宿主状态槽、cleanup 链头在 TCB；路径 / stat / getdents / 命令行 /
  spawn arena / 8 MiB 读缓冲 / timespec / termios / affinity / 子进程 envp 在每线程的
  mmap scratch 块（约 8.4 MiB 虚拟，`MAP_NORESERVE`）。scratch 是整程序属性：可达代码
  用得到宿主叶子时主线程在 `init_tcb_scratch` 映射、子线程按 `rt_scratch_needed` 在
  `thread_spawn` 映射；否则一次都不映射。进程级的只有子进程 pid 表：64 槽，
  `child_push` / `child_drop` 用一把 futex 锁串行，`sigalrm` 不拿锁、读一次计数遍历（push
  先写槽后写计数、drop 先交换后减计数，见 [native-runtime.md](native-runtime.md) §4）；
  槽满时调用点立刻 `kill` + `wait4` 收掉刚 fork 的子进程并报 `ProcessTooManyChildren`——
  超时机制跟踪不到的子进程会让总超时静默失效。`runIn` 的 `chdir` 在子进程里做，父进程的
  cwd 全程不动。

**OCaml 运行时**（`Vuna_runtime.ml` 的 `dtThreadRuntime`）：

| 原语 | 运行时 |
| --- | --- |
| `threadSpawn` / `join` | `Domain.spawn` / `Domain.join`（join self 先检查 `Domain.get_id`） |
| `threadYield` / `Id` / `Parallelism` | `Unix.sleepf 0.0` / `Domain.self ()` / `Domain.recommended_domain_count ()` |
| `mutex*` | `Mutex.create` / `lock` / `try_lock` / `unlock` |
| `condvar*` | `Condition.create` / `wait` / `signal` / `broadcast` |
| `atomic*` | `int Atomic.t`（`fetch_and_add` 按 OCaml int 的 63-bit 回绕；CAS 返回旧值） |

OCaml 端不需要额外链接库（`Domain` / `Mutex` / `Condition` / `Atomic` 都在 5.x stdlib）。
`bracket` cleanup 栈按 `Domain.DLS` 分域存放；`dtp_print` / `dtp_eprint` 用进程级锁保证整次调用
不交错。

**GC 参数按 domain 生效**：生成的 `dtRuntime` 前缀用 `Gc.set` 调的是**主 domain**（`minor_heap_size`
16 MB、`space_overhead` 200）；`Domain.spawn` 出来的 domain 用运行时启动参数
（`OCAMLRUNPARAM`）或 OCaml 默认值（256k words = 2 MB minor heap），不继承主 domain 的
`Gc.set`。分配量大的纯函数负载因此在 worker 里做更多次 minor GC：`parMap` 的 user 时间高于
同工作量的串行路径，wall 收益低于核数。

## 7. 效果原语、Eff 动作与宿主层

**动作类型**：唯一动作类型是 `Eff r a`（`Base.Effect.Core`，装箱 data；行是擦除索引）。
入口 `main : Eff r a`：行里的内建宿主标签由 entry 自动预装 handler；自定义效应必须在入口前
`handle` 成 `Nil`，否则是类型错误（`TC_UnhandledEffects`）。纯动作的执行入口是
`Base.Effect.Core.runPure : Eff [] a -> a`。

**宿主原语是隐藏名**：宿主叶子只有 `@vuna@prim_eff_*` / `@vuna@host@*` 两族，源码写不出
（`Frontend/Lexer` 的 `@vuna@` 内部名规则 + 不在用户可见内建表），类型固定为 `Eff [HostOp] a`。
可见的效果内建只有 `effTimeUs` / `effTimeUs_host`（同样是 `Eff [HostOp] Int`）。
用户面只有 `Base.Effect.*` 标签 + handler：

| 模块 | 标签 | 用户面 sender | handler 内部的宿主符号 |
| --- | --- | --- | --- |
| `Base.Effect.Console` | `ConsoleOp` | `consolePrint`（结果 `Nat`）/ `consoleEprint` | `@vuna@host@print` / `@vuna@prim_eff_eprint` |
| `Base.Effect.Fs` | `FsOp` | `fsReadFile` / `fsReadFileRange` / `fsWriteFile` / `fsWriteFileAtomic` / `fsReadDir` / `fsIsDirectory` / `fsMakeDir` / `fsRemoveFile` / `fsFileExists` / `fsFileMtime` / `fsFileSize` / `fsRemoveTree` / `fsRename` / `fsSymlink` / `fsMakeDirExclusive` | `@vuna@host@try*` + `@vuna@prim_eff_hostStatus` |
| `Base.Effect.Clock` | `ClockOp` | `clockNow` / `clockSleepMicros` | `effTimeUs` / `@vuna@prim_eff_sleep` |
| `Base.Effect.Env` | `EnvOp` | `envGetEnv` / `envGetCwd` / `envExecPath` | `@vuna@prim_eff_getenv` / `getcwd` / `execPath` |
| `Base.Effect.Process` | `ProcessOp` | `processRunIn` / `processSpawn` / `processWait` / `processArgs` / `processExit` | `@vuna@prim_eff_runIn` / `spawn` / `wait` / `getArgs` / `exit`；宿主行变体 `@vuna@host@tryRunIn`、`@vuna@prim_eff_*_process_host` |
| `Base.Effect.Stdin` | `StdinOp` | `stdinReadLine`（`Maybe String`）/ `stdinReadBytes` | `@vuna@host@readLine` / `readBytes`；无 handler 行的库路径回落到 `@vuna@prim_eff_readLine` / `readBytes` |
| `Base.Effect.Args` | `ArgsOp` | `argsGetArgs` | `@vuna@prim_eff_getArgs` |
| `Base.Effect.Tty` | `TtyOp` | `ttyIsTty`（结果 `Bool`） | `@vuna@host@isTty`（wasm 恒 `False`） |
| `Base.Effect.Exit` | `ExitOp` | `exitWith` | `@vuna@prim_eff_exit`（库路径）/ `@vuna@host@exitOp`（宿主行） |
| `Base.Effect.Net` | `NetOp` | `netListen` / `netPort` / `netAccept` / `netRecv` / `netSend` / `netClose` / `netConnect`（含 `Within` 变体） | `@vuna@host@tryNet*` + `@vuna@prim_eff_hostStatus` |
| （隐藏）`@vuna@Cell` | `Base.Container.MutRef` 句柄的内部表示 | — | `@vuna@prim_mrefNew` / `read` / `write`（由 `Base.Container.MutRef` 的 `alias record` 包住） |

**执行与求值**：宿主原语是 `Eff [HostOp]` 动作叶子（`Base.Effect.Host` 的 `runHost` /
`hostSync` 是唯一关闭器）；codegen 按 arity 包成 `MkEff`（零参原语是动作
**值**，引用不执行、不重新求值），`@vuna@prim_eff_bind1`（线性绑定）由 `effLinearBindText` 生成。
`Int`/`Nat` 归一化只在 handler 的结果索引（`Print`、`WriteFile`、`FileSize` 返回 `Nat`），
宿主原语本身返回 `Int`。`@vuna@prim_eff_hostStatus` 是 try 变体的失败码状态槽
（0 = 成功），base 的 handler 读它并抛 typed error（`FsErrorOp` / `NetErrorOp`）。

**源码侧边界**：`prim_eff_print` 与 `@vuna@prim_eff_print` 都报 `RN_UnknownVariable`。
strict 非 try 的文件与网络符号（`@vuna@prim_eff_{readFile,readFileRange,writeFile,
writeFileAtomic,readDir,isDirectory,makeDir,removeFile}`、`@vuna@prim_eff_net*`，连同它们的
`@vuna@host@*` 形式）没有源码入口，已从内建表、契约与三端符号表删除；失败面统一走
`@vuna@host@try*` + 状态槽 + typed error
（entry 收口成诊断 + exit 1）。`Base.Effect.Fs` 的 `fsFileMtime` / `fsFileSize` 返回 `Maybe`
（取不到 = 无值，不是 0），`fsRemoveFile` / `fsRemoveTree` 幂等。

**运行时核心（隐藏）**：`prim_effectPerformId` / `prim_effectHandleId` / `prim_effectSelf` /
`prim_cleanupPush` / `prim_cleanupPop` 是续延、scoped handler 重装与 bracket cleanup 的底层
原语，常规只由 `Base.Effect.Core` 包装使用；`effectId : String -> Int` 是派发 id（FNV-1a 32 位
取低 30 位，三端 runtime 与编译器折叠同一公式）。内部 cast `prim_erase`（`visible = False`）只由
精化器插入；设计见 [effects.md](effects.md) §5。

**调试/诊断**：`@vuna@prim_eff_eprint` 写 stderr 并 flush（报告器/调试输出用）；`prim_fail`
抛 `Failure`，由生成的运行时报告器渲染成 `vuna: runtime error: ...` 并 exit 2。
`assert` / `todo` 在 release 构建里由 `Loader.Resolve` 拒绝（`TC_DebugConstructInRelease`）。
文本日志与观测原语（`@vuna@log@*` / `@vuna@obs@*`）同样隐藏，只由 `log!` / `mark!` 与
`Base.Data.Log` / 生态包 `vuna-obs`（模块 `Obs`）使用；编译器用自己的
`Vuna.Compiler.Base.Obs` 包装。

**分组只是文档归类**（内建表不带能力位，也没有 manifest 门控）：

| 分组 | 用户面入口 | 宿主符号（隐藏） |
| --- | --- | --- |
| `console` | `consolePrint` / `consoleEprint` | `@vuna@host@print`、`@vuna@prim_eff_eprint` |
| `fs` | `fs*`（见上表） | `@vuna@host@try*` + `@vuna@prim_eff_hostStatus` |
| `process` | `process*` / `exitWith` / `argsGetArgs` | `@vuna@prim_eff_{runIn,spawn,wait,getArgs,exit}`、`@vuna@host@tryRunIn`、`@vuna@prim_eff_{exit,getArgs}_process_host` |
| `env` | `envGetEnv` / `envGetCwd` / `envExecPath` | `@vuna@prim_eff_{getenv,getcwd,execPath}` |
| `clock` | `clockNow` / `clockSleepMicros` | `effTimeUs`、`@vuna@prim_eff_sleep` |
| `stdin` | `stdinReadLine` / `stdinReadBytes` | `@vuna@host@{readLine,readBytes}`、`@vuna@prim_eff_{readLine,readBytes}` |
| `net` | `net*`（`NetOp`，含 `Within`） | `@vuna@host@tryNet*` + `@vuna@prim_eff_hostStatus` |
| `ref` | `Base.Effect.MutRef`（`@vuna@Cell`，隐藏） | `@vuna@prim_mref*` |
| 运行时核心 | — | `prim_effectPerformId` / `prim_effectHandleId` / `prim_effectSelf` / `prim_cleanupPush` / `prim_cleanupPop`、`effectId` |

- **宿主原语不是用户 API**：源码写不出这些名字；用户面只有标签 + handler（`runPure` 执行
  已处理干净的动作）。
- **`prim_*`（纯原语）仍可直接调用**：没有 manifest `[capabilities]` / `[trust]`、每包原语
  白名单或 `unsafe` 审计；显式接受的损失见 [effects.md](effects.md) §8.6 与
  [debt.md](debt.md) D62。
- `vuna repl` 能求值顶层类型为 `Eff r a` 的表达式：Nil 行直接跑；带行时先定义带显式签名的值
  （`prog : Eff [ConsoleOp] Int`）再求值 `prog`（见 [tooling.md](tooling.md)）。

## 8. 生成 runtime 的契约

产物固定包含一个 `Vuna_runtime.ml`（`Target.Ocaml.Term.dtRuntime`），**无条件**内嵌 Unix：

- `Unix.stat`（`@vuna@host@fileMtime` / `fileSize`）、`Unix.gettimeofday`（`effTimeUs`）、
  `Unix.sleepf`（`@vuna@prim_eff_sleep`）、`Unix.readlink "/proc/self/exe"`
  （`@vuna@prim_eff_execPath`）；`build.sh` 无条件 `-I +unix ... unix.cmxa`。因此任何产物都
  依赖 OCaml 的 unix 库。
- 启动时设置 GC（`minor_heap_size` 16MB、`space_overhead` 200）。

契约里的符号都是隐藏名（codegen 包一层 `MkEff`）；下表的「用户面」列给出对应标签：

| 内部符号 | runtime 契约 | 用户面 |
| --- | --- | --- |
| `@vuna@host@print` / `@vuna@prim_eff_eprint` | 写 stdout / stderr 并 flush，返回**字节数** | `consolePrint`（`Nat`）/ `consoleEprint` |
| `@vuna@prim_eff_readFile` 等 strict 文件族 | `dtp_readFile` 等仍是 `dtp_tryReadFile` 的实现细节，**不是契约符号**；`try*` 失败写状态槽、返回默认值 | `fsReadFile` 等；base 抛 `FsErrorOp`，`runFsError` 可局部收成 `Result` |
| `@vuna@host@{fileExists,fileMtime,fileSize,isTty}` | 路径不存在给 `False`；mtime/size 取不到给状态（`Maybe` 在 base 侧）；isTty 探测 stdin | `fsFileExists` / `fsFileMtime` / `fsFileSize` / REPL 行编辑 |
| `@vuna@prim_eff_readLine` / `@vuna@host@readLine` | 读一行；EOF 返回 `""`（与空行不可区分） | `stdinReadLine`（`Maybe`） |
| `@vuna@prim_eff_readBytes` / `@vuna@host@readBytes` | 最多读 n 字节，**有数据就立即返回**；EOF 返回 `""` | `stdinReadBytes` |
| `@vuna@prim_eff_getenv` | 未设置或空串都返回 `""` | `envGetEnv`（`envGetEnvNonEmpty` 给 `Maybe`） |
| `@vuna@prim_eff_getcwd` | 失败时返回 `"."` | `envGetCwd` |
| `@vuna@prim_eff_execPath` | 先读 `/proc/self/exe`（**Linux 假设**），失败回落 `Sys.executable_name` | `envExecPath` |
| `@vuna@prim_eff_getArgs` | 排除 `argv[0]` 的其余参数 | `argsGetArgs` |
| `@vuna@prim_eff_exit` / `@vuna@host@exitOp` | 立即退出进程（执行即退出、**不返回**） | `exitWith` |
| `@vuna@prim_eff_sleep` | 阻塞 `Unix.sleepf (us / 1000000)`；`us <= 0` 立即返回 0（真实睡眠，非忙等） | `clockSleepMicros` |
| `effTimeUs` | `Unix.gettimeofday` 换算微秒（可见内建，唯一例外） | `clockNow` |
| `@vuna@prim_eff_runIn` / `@vuna@host@tryRunIn` | 在给定目录执行 `sh` 命令并返回退出码，执行后恢复原 cwd | `processRunIn` |
| `@vuna@prim_eff_spawn` / `wait` | 异步启动子进程（argv 列表，继承 stdio）返回 pid；等待返回退出码（signal/stopped 归 1） | `processSpawn` / `processWait` |
| `@vuna@host@tryNet*`（含 `Within`） | 失败写状态槽（1 = 对端关闭、2 = refused、3/7 = timeout、4 = closed、5 = addr-in-use、6 = bad-addr、8 = bad-handle、其它 = io）；`recv` 对端关闭是 `Nothing` | `net*`；base 抛 `NetErrorOp` |
| `@vuna@prim_mrefNew` / `read` / `write` | `ref` / `!` / `:=`（命名可变单元，原地读写） | `Base.Effect.MutRef`（句柄由精化器合成） |
| `@vuna@prim_eff_hostStatus` | 宿主 try 变体的失败码状态槽（0 = 成功；OCaml 用 Domain.DLS） | 仅 base 的 handler 读取 |
| `@vuna@prim_eff_bind1` | 线性绑定（`effLinearBindText` 生成） | `>>=` / `do` |

效果原语的 runtime 表（`dtp_*`）仍是**立即执行**的 OCaml 函数；生成器
（`Target.Ocaml.Term.effThunkText`）按 `Intrinsic` 的 arity 把它们包成 `MkEff` 动作值，例如
`@vuna@prim_eff_getcwd` → `(MkEff (fun (_ : EffUnit) -> dtp_getcwd ()))`、
`@vuna@host@print` → `(fun s -> MkEff (fun (_ : EffUnit) -> dtp_print s))`。因此零参原语
（`@vuna@prim_eff_getArgs` / `readLine` / `getcwd` / `effTimeUs`）是动作**值**：引用不执行、
不重新求值。native / wasm 的符号表与 OCaml 契约由测试（`target-*/test/RuntimeTable.vuna`）
逐条对拍；无入口的 strict 非 try 家族已从三端表删除。
## 9. 核心求值归约边界

核心求值路径是精化后的纯求值器（`Core.Eval.primReduce` 按 `IntrinsicOp` 归约）。
语言运算符 `+ - * /`、`== /= < <= > >=`、`++`、`&&`、`||` 全部归约（`/` 除零例外）。
边界按**显式分类**处理，不是静默错值：

| 类别 | 归约 | 说明 |
| --- | --- | --- |
| 上述运算符 | 是 | `/` 在除数为 0 时**不归约**（见下） |
| `bitAnd` / `bitOr` / `bitXor` / `bitNot` / `bitShl` / `bitShr` | 是 | 63-bit 补码语义，与 runtime `bi_bit*` 同公式（移位越界 = 0） |
| `bitAnd` / `bitOr` / `bitXor` / `bitNot` / `bitShl` / `bitShr` | 是 | 63-bit 补码语义，与 runtime `bi_bit*` 同公式（移位越界 = 0） |
| `strFromInt` / `strLength` / `strHash` / `strAt` / `strSubstring` / `strShow` | 是 | 与 runtime **同语义同公式** |
| `natAdd` / `natSub` / `natMul` / `natDiv` / `natToInt` / `natFromInt` | 是 | 与 runtime 同饱和 / 截断语义 |
| `strUnpack` / `strPack` / `strConcatMany` / `strSubstTemplate` | **否** | 结果依赖 `Base.Data.List.List` 的构造子表示（List 桥接），核心求值器不构造该表示 |
| 全部 `OpNone` 原语：效果原语（`@vuna@prim_eff_*`）、容器原语、`prim_fail` | **否** | 纯求值器不执行效果 / 不构造内建容器表示 |
| `a / 0` | **否** | 核心求值器表达不了运行期异常；显式分类，不返回 0 |

- 不可归约时 `main` 报
  `[CG_MainNotValue] main does not reduce to a value (stuck at <卡住的值>)`；括号里是卡住
  的值的头部（通常是没归约的原语或中立项）。
- `main : Eff [] a` 一律报
  `[CG_InterpCannotExecuteEffects] interp cannot execute effects (main : Eff [] a), so compile and run the program instead`
  （无 `DT:` 前缀），不做「纯动作求值、效果丢弃」。
- **List 桥接**：codegen 把返回或接收 `List` 的 10 个原语映射到桥接 helper（`dtp_unpack` /
  `dtp_pack` / `dtp_concatMany` / `dtp_substTemplate` / `dtp_listOf` / `dtp_ocamlOf`）：
  `strUnpack` / `strPack` / `strConcatMany` / `strSubstTemplate`、`@vuna@prim_eff_getArgs` /
  `@vuna@host@tryReadDir` / `@vuna@prim_eff_runIn` / `@vuna@prim_eff_spawn`、`arrayFromList` / `arrayToList`。桥接只为
  canonical `Base.Data.List.List` 声明生成；包内没有该族时（例如没有 base 依赖）codegen 报
  ``[CG_ListBridgeRequired] builtin `<name>` requires the canonical `Base.Data.List.List` declaration ...``。
- 相关夹具关闭 interp 阶段，只做 `compile` + 运行产物。

## 10. 受限 FFI

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
  没有 C 头文件解析（符号名与签名都要手写）；核心求值不执行 extern（`main` 里用到时
  只走 compile + 运行）。
- C 实现是包的一部分：`ffi/` 目录随包走，不改变 `vuna.toml` 形状。

## 11. 已知边界

- 无大整数、无溢出诊断；`Int` 的 63 位宽度是宿主实现事实。
- 无 Unicode 码点 API / 无 UTF-8 校验；`String` 是字节串，`strPack` 越界是宿主错误。
- `prim_execPath` 依赖 `/proc/self/exe`（Linux），其它平台走 `Sys.executable_name`。
- `strPack` / `strUnpack` 的 List 桥接、`strSubstTemplate` 的模板扫描均在 runtime 里实现，
  核心求值不覆盖（§9）。
- 原语的失败（宿主错误、`strPack` 越界、`/0`、`exit`）都是**宿主异常 / 进程退出**，
  由生成的运行时报告器统一报告（见 [debugging.md](debugging.md)），不是语言的可捕获错误。
- `net` 只有 TCP（数字 IPv4）与 Unix domain socket：无 DNS、TLS、异步/超时、并发；
  `accept`/`recv` 是阻塞语义。原语本身不限制绑定地址，`vuna repl serve --listen` 在 CLI 层只接受
  loopback 与 Unix socket（见 [tooling.md](tooling.md)）。
- 以上是原语与 runtime 侧的现状边界；开放债务见 [debt.md](debt.md)。
