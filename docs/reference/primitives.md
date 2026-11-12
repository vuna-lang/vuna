# 原语语义规范（Int / String / Show / 效果原语与宿主层）

本文是 vuna **原语语义的唯一权威**：值域与宽度、字符串编码、错误行为、interp 归约边界、
效果原语与宿主层模型、生成 runtime 的契约。内建声明面只有一份真源
`Vuna.Compiler.Intrinsics`（`allIntrinsics` / `IntrinsicOp`），消费方是
`Loader.Resolve`（解析）、`Elab.Prelude`（签名）、`Codegen.Term`（runtime
映射）、`Core.Eval`（interp 归约）。语法见 [language.md](language.md)，类型规则见
[type-system.md](type-system.md)，库的边界见 [stdlib.md](stdlib.md)，开放债务见
[debt.md](debt.md)。

## 1. 术语

| 术语 | 含义 |
| --- | --- |
| primitive 类型 | `Int` / `String`：没有 `data` 声明，表示与字面量由编译器提供 |
| intrinsic | `Intrinsics.allIntrinsics` 的一条：名字、签名形状（`IType`）、interp 归约标签（`IntrinsicOp`）、runtime 表达式、是否对源码可见 |
| runtime helper | 生成产物 `Vuna_runtime.ml` 里的 OCaml 函数（`bi_*` / `dtp_*` / `dt_show_string`）；`bi_*` 不对用户源码可见 |
| 效果原语 | `intrinsicReturnsEff` 的 intrinsic：返回 `Eff [] a`，名字只有 `prim_eff_*`，外加 `effTimeUs` |
| 宿主层 | 直接调用 `prim_eff_*`（外加 `effTimeUs`）；原宿主别名模块已删除，任何包都可直调，没有 manifest 门控 |

## 2. 身份与常量

- **`Int` / `String` / `Float` 是语言 primitive 类型**（`Intrinsics.typeIntrinsicNames =
  [Int, String, Float]`）：prelude 直接提供对应 `Type`；入口 / 未限定名处的 `data Int` /
  `data String` / `data Float` 报 `CannotRedefineBuiltin`（模块内声明会 mangle 成 `M.Int`，
  属于不同符号）。它们的 **Eq / Ord / Show 实例宿主模块**是 `Base.Int` /
  `Base.String` / `Base.Float`（实例跟类型模块走；primitive 无构造子，实例体走内建特化）。
  类型身份仍由本文件的内建表提供，`Base.Int` 不声明类型。**这是设计选择而非欠账**：把
  `Int`/`String`/`Float` 上移成源码 `primitive type` 声明需要两阶段 bootstrap、改大量身份
  比较与 `Base` 叶模块拆分，功能零增益；用户自定义 primitive 类型的需求归受限 FFI（D21）。
  实例落点规则见 [operators.md](operators.md)。
- **比较/相等运算符不是内建值**：`==` `/=` `<` `<=` `>` `>=` 是 `Base.Eq` /
  `Base.Ord` 方法（`eq` / `neq` / `lt` / `le` / `gt` / `ge`）的解析期别名；Int/String 上的
  `bi_eq_int` / `bi_eq_str` / `bi_*_int` / `bi_*_generic` 是这两个类的**内建实例实现**
  （不是运算符的独立语义）。详见 [operators.md](operators.md)。
- **`Eff` 是唯一动作类型**，`Bool` / `List` / `Nat` 是 base 的
  普通 `data` 声明：
  内建类型按名字恒可见；base 的族身份是完整符号而不是短名：

  | 声明 | canonical 符号 | 来源 | 常量 |
  | --- | --- | --- | --- |
  | `Bool` | `Base.Bool.Bool` | `base/lib/Base/Bool.vuna` | `Intrinsics.boolTypeName` |
  | `True` / `False` | `Base.Bool.True` / `Base.Bool.False` | 同上 | `boolTrueCtor` / `boolFalseCtor` |
  | `List` | `Base.List.List`（`Cons` / `Nil` 同理） | `Base.List` | `listFamilyName` / `listConsCtor` / `listNilCtor` |
  | `Nat` | `Base.Nat.Nat`（`Zero` / `Succ` 同理） | `Base.Nat` | `natTypeName` / `natZeroCtor` / `natSuccCtor` |

- `Eff`（`Base.Eff.Eff`）：`Row -> Type -> Type` 的 base data，装箱表示 `MkEff`（不导出）；
  行是擦除索引。入口 `main : Eff [] a`，执行 `runPure`（[effects.md](effects.md) §2）。


- `True` / `False` 精化为核心 `TBool`，codegen 的运行时表示是 OCaml `bool`：canonical Bool
  族**不生成变体声明**（`Codegen.Decl.runtimeDatas` 按 `boolTypeName` 过滤）。
- **没有短名 / `lastName` 判定，也没有「全局构造子放行」**：`True` / `False` / `Cons` /
  `Nil` 与其他构造子一样经 import 的导出表解析（`Prelude` 自动注入 `Base.Bool` /
  `Base.List`，所以裸名可用）。类型位置按 `resolveTypeName` 判定：`Int` / `String` /
  `Type` / `->` 等是内建，其余（含 `Bool`）查导出表。
- 用户写的 `data Bool` / `data List` 是**普通 data**、不与 canonical 冲突：模块内名字被
  mangle 成 `<Module>.Bool`；入口文件（不做 mangle）里声明 `data Bool` 时族名就是
  `Bool`，与 `Base.Bool.Bool` 是两个族。`if` / 字面量 `case` 等只认 canonical。

## 3. Int

- 表示：宿主 OCaml `int`，**固定 63 位**：`max_int = 4611686018427387903`、
  `min_int = -4611686018427387904`。类型层没有宽度 / 区间信息，`Int` 就是 `Type`。
- 算术：`+` `-` `*` 在溢出时按**二进制补码回绕**（`max_int + 1 = min_int`），不报错、
  不饱和、不提升为大整数。**无大整数计划**。D23 起 `+ - * /` 是 `Base.Num` 方法
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
  `rol32` / `shl32` / `shr32`）在 `Base.Bits` 库层；宽度策略留在库里，不进原语。
- 没有运算符形式（`&` / `|` / `^` / `<<` / `>>`）：需要时用命名函数，或自己声明 `infixl`。
- interp 与 runtime 同语义（`Core.Eval.primReduce` 委托给同名原语；codegen 生成
  `bi_bit*`，and/or/xor/not 的饱和应用直接内联成 OCaml 位运算符）。

## 3.1 Nat

- **身份**：`Base.Nat.Nat` 是 canonical data（固定 `Zero` / `Succ`），类型层仍是普通归纳族；
  运行时表示是 OCaml `int`，值域 `0..max_int`（4611686018427387903）：`Zero = 0`、
  `Succ n = min(n + 1, max_int)`，**不生成变体类型**。
- **字面量**：期望类型为 Nat 时 `3` 展开成 `Succ (Succ (Succ Zero))`（类型层可合一），
  codegen 折回整数字面量；推断位置仍默认 `Int`。超出 63 位可表示范围的字面量在词法期
  报 `LX_IntLiteralOutOfRange`（不再回绕；`TC_NatLiteralOutOfRange` 仅作内部防御）；Nat 字面量模式支持 `case n of 0 =>`：模式只含字面量/变量/通配时降成 Int 比较的
  if 链（`case n of 0 => a; k => b` 的 `k` 绑回原始 Nat）；与构造子模式混用仍报 `TC_OnlyCtorPatterns`，
  混用时改用 `Zero` / `Succ` 或 `isZero`。
- **纯 intrinsic**：`natAdd` / `natSub` / `natMul` / `natDiv`（饱和、减截断到 0、除零与 Int
  同文案）、`natToInt`（恒等）、`natFromInt`（负数 clamp 0）。interp 与产物同语义；
  `+ - * /` 在 Nat 上下文由精化器特化到这些名字（见 [operators.md](operators.md)）。
- **提升**：只允许 `Nat → Int`（精化期插入 `natToInt`，零成本）；`Int → Nat` 必须显式
  `Base.Nat.fromInt`（负数 clamp 0，有损）/ `fromIntMaybe`。混合算术的结果由操作数决定：
  两侧 Nat（或 Nat 与字面量）→ Nat；出现真正的 `Int` → `Int`（Nat 侧经 `natToInt` 提升）。
  低层原语（`strLength` / `arrayLength` 等）仍是 Int，Base 负责暴露 Nat 度量。
- **算术 = `Num` 方法（D23）**：`+ - * /` 是 `Base.Num` 方法 `add` / `sub` / `mul` / `div`
  的中缀别名；`Int` / `Nat` / `Float` 实例由精化器按期望类型/实参类型特化回内建原语，
  其它类型走普通 trait 方法应用。用户类型实现 `Num`（并配 `FromInt` 收字面量）即可重载
  四则（`1 + 2 : MyNum`），见 [operators.md](operators.md)「`Num` 的唯一真源」。
- **度量返回 Nat（D25，只留在 Eff handler 的 result 族）**：`Base.EffConsole.Print` 与
  `Base.EffFs.WriteFile` / `FileSize` 的结果是 `Nat`（handler 在边界从原语的 `Int` 转 `Nat`）；
  直接调用 `prim_eff_print` / `prim_eff_writeFile` / `prim_eff_fileSize` 得到 `Eff [] Int`。
  `prim_eff_eprint` / `prim_eff_writeFileAtomic` 与编译器内部计数器（level/meta/fuel/span/arity、
  字节计数中间量）保留 `Int`。
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
  `\$`（字面 `${`）；其它 `\x` 报 `UnknownEscape`；单行字面量不能跨行，多行用
  `"""..."""`（构造与边界见 [templates.md](templates.md)）。
- 展示 / 转义统一走 `strShow`（§5），没有第二套实现。

## 5. Show 与 main 展示

`strShow : String -> String`（intrinsic，runtime `dt_show_string`）是**唯一**的字符串展示
实现：加双引号，并转义 `"` → `\"`、`\` → `\\`、LF → `\n`、TAB → `\t`、CR → `\r`；
其余字节原样输出（不走 OCaml 源码发射时的 `\ddd` 转义——那是 `Codegen.Decl` 的内部细节）。

- `Base.Show` 的 `String` 实例委托给它：`show s = strShow s`，因此 `show` 与
  `main : String` 的展示一致。
- `main` 展示钩子（`Codegen.Term.mainShow`）：`Int` / `Nat` → `string_of_int`、
  `String` → `dt_show_string`（即 `strShow`）、`Bool` → `dt_show_bool`（输出 `True` /
  `False`）、`Float` → `string_of_float`。
- **其它类型走 `Show` 实例**（D17）：精化收尾（`Elab.Driver.finishCore`）对非内建的结果
  类型（`main : Eff [] a` 先剥掉动作层取 `a`）搜索 `Dict_Show a`，合成
  `@vuna@main_show : a -> String`（body 是方法投影 `\x -> show {a} {dict} x`）。
  `mainShow` 对它回退到这条定义名；interp（`Driver.Dt.evalDtMainCore`）对 main 值应用
  同一份定义后打印。找不到实例在**精化期**报
  `[TC_NoInstanceFound] no instance found for <T>`（旧的 `[CG_MainReturnType]` 已随 D17
  删除，不再产生；`@vuna@main_show` 在 split 归属里固定归入口单元 `Main`）。
- **`vuna test` 的 main 判据不变**：`lib/Vuna/TestRunner.dtMainKind` 仍只认
  `Int` / `Nat` / `String` / `Bool`（按返回 0/空串/True 判通过）与动作入口（退出码 0）；
  其它类型报 `unsupported test main type`。D17 只负责**展示**，不改变测试通过判据——
  需要按 `Show` 类型写「纯测试」暂时只能显式转成 `String` 判定。
- interp 展示（`Core.Eval.showValue`，字符串走 `Core.Term.showCoreString`）与 `strShow`
  同规则、逐字节一致，因此 `main : String` 在 interp 与产物中输出相同。非内建类型经
  `@vuna@main_show` 得到的是 `String`，两侧都直接 `print_endline`（**不加引号**）。
- `main : Eff [] a` 的 interp 仍是一律报错（纯核心求值器不执行效果，夹具用 `.nointerp`）；
  产物侧先执行动作（`runPure`），再按上面的规则展示结果。
- `Show Bool` 库实例用 `if` 输出 `True` / `False`，与 `dt_show_bool` 同语义。

## 6. 其它纯原语

| 原语 | 签名 | 语义 |
| --- | --- | --- |
| `strFromInt` | `Int -> String` | 十进制，负数带 `-`（OCaml `string_of_int`） |
| `strHash` | `String -> Int` | 固定 1024 桶：`h` 初值 0，逐字节 `h = (h*33 + byte) mod 1024`，结果 0..1023 |
| `strAt` | `String -> Int -> Int` | 见 §4（越界 `-1`） |
| `strSubstring` | `Int -> Int -> String -> String` | 字节切片：start/len 按字节 clamp——负 start 视为 0、负 len 视为 0、越界截断到末尾；与 `Base.String.substring` 同语义 |
| `strConcatMany` | `List String -> String` | 一次性拼接（OCaml `String.concat ""`） |
| `strSubstTemplate` | `String -> List String -> String` | `<N>` 占位符按序号替换；非数字 `<`、越界序号原样保留（`Base.Vec.substTemplate`） |
| `effTimeUs` | `Eff [] Int` | 微秒时间戳（`Unix.gettimeofday`）；效果原语（clock 组） |
| `prim_eff_sleep` | `Int -> Eff [] Int` | 阻塞睡眠 n 微秒（runtime `dtp_sleep` = `Unix.sleepf`；n <= 0 立即返回 0）；效果原语（clock 组）；interp 不归约 |

`strHash` 的 interp 实现（`Core.Eval.strHashOf`）与 runtime `dtp_strHash` 是同一公式。

## 6.1 容器与可变数据原语

**内建类型构造子**（名字恒可见，与 `Int` / `String` 一样不能被用户重定义；参数个数唯一
真源是 `Intrinsics.typeIntrinsicArities`，OCaml 表示的渲染在 `Codegen.Decl`）：

| 类型 | kind | OCaml 表示 |
| --- | --- | --- |
| `Array a` | `Type -> Type` | `'a array`（不可变语义：不暴露原地写） |
| `IORef a` | `Type -> Type` | `'a ref` |

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

**可变数据原语**（`prim_eff_*` 返回 `Eff []`；不触碰外部世界；`Base.IORef` 的公开操作返回 `Eff []`）：

| 原语 | 签名 | runtime |
| --- | --- | --- |
| `prim_eff_newRef` / `prim_eff_readRef` / `prim_eff_writeRef` | `a -> Eff [] (IORef a)` / `IORef a -> Eff [] a` / `IORef a -> a -> Eff [] Int` | `ref` / `!` / `:=` |

- 效果原语的 runtime 表达仍是「立即算完的 OCaml 表达式」，由 `effThunkText` 按 arity
  包成 `MkEff` thunk（`fun args -> fun (_ : int) -> rt args`；零参 `fun (_ : int) -> rt`）。
- `arrayFromList` / `arrayToList` 依赖 canonical `Base.List.List` 桥接（`needsListBridge`）；
  完整的桥接清单与缺失时的诊断见 §9。
- **interp 不归约**全部容器原语（`OpNone`）：夹具带 `.nointerp`，只 compile + 运行。
- 越界行为：`arrayGet` 越界是宿主 `Invalid_argument`（不是 `strAt` 的
  -1 哨兵，也没有语言层诊断）；`Array.set` 先 `Array.copy`，原数组不变。
- 可变数据的安全边界：`IORef` 的公开操作与实现都返回 `Eff []`；局部可变（region/ST、
  可变数组、字符串缓冲）已删除，重建约束见 [debt.md](debt.md)；仍无依赖 multiplicity /
  线性箭头（多用未禁止，见 [effects.md](effects.md)）。

## 7. 效果原语、Eff 动作与宿主层

**动作类型**：唯一动作类型是 `Eff r a`（`Base.Eff`，装箱 data；行是擦除索引），入口
`main : Eff [] a`，执行 `Base.Eff.runPure`。

**宿主原语单表**：

| 表 | 名字 | 类型 | 用途 |
| --- | --- | --- | --- |
| Eff 表 | `prim_eff_*`（如 `prim_eff_print`、`prim_eff_readFile`、`effTimeUs`） | 返回 `Eff [] a` | 宿主层（原宿主别名模块已删除，直接调用） |

原语在 codegen 里包成 `MkEff (fun _ -> rt args)`；Int/Nat 归一化只在 `Base.Eff.*` handler
的 result 族（`Print`、`WriteFile`/`FileSize`）里做，原语本身返回 `Int`。

**Eff 代数不是原语**：`pure` / `>>=` / `do` / `fmap` 来自 `Functor`/`Applicative`/`Monad (Eff r)`
实例（`Base.Eff` 内建）；`runPure` / `joinEff` / `raise` / `weaken` 是 `Base.Eff` 的库函数。
`prim_effectPerform` / `prim_effectHandle` / `prim_cleanupPush` / `prim_cleanupPop` 是隐藏的
运行时效应核心，常规只由 `Base.Eff` 包装使用（不再有 `unsafe` 门控）。

**效果原语类型**（`prim_eff_*`，全部返回 `Eff []`）：`prim_eff_print : String -> Eff [] Int`
（`Base.EffConsole.Print` 在 handler 边界转 `Nat`）、`prim_eff_readFile : String -> Eff [] String`、
`prim_eff_readLine : Eff [] String`、`prim_eff_readDir : String -> Eff [] (List String)`、
`prim_eff_isDirectory` / `prim_eff_fileExists : String -> Eff [] Bool`、
`prim_eff_makeDir` / `prim_eff_removeFile` / `prim_eff_fileMtime : String -> Eff [] Int`、
`prim_eff_fileSize : String -> Eff [] Int`、`prim_eff_writeFile : String -> String -> Eff [] Int`、
`prim_eff_getArgs : Eff [] (List String)`、`prim_eff_getenv : String -> Eff [] String`、
`prim_eff_getcwd` / `prim_eff_execPath : Eff [] String`、
`prim_eff_exit : Int -> Eff [] Int`（执行即退出、不返回）、
`prim_eff_runIn : String -> List String -> Eff [] Int`、`prim_eff_spawn : List String -> Eff [] Int`、
`prim_eff_wait : Int -> Eff [] Int`、`prim_eff_readBytes : Int -> Eff [] String`、
`prim_eff_sleep : Int -> Eff [] Int`（阻塞 us 微秒）、`effTimeUs : Eff [] Int`。
零参原语因此是**真正的动作值**：引用不执行、也不重新求值。

纯 `main` 直接调用效果原语是类型错误（`TC_TypeMismatch`）：效果只能出现在 `Eff` 动作里。

调试/诊断原语与语言级调试构造（见 [debugging.md](debugging.md) §3）：

- `assert : Bool -> String -> a -> a`（debug-only）：失败抛 `Failure`；
- `todo : String -> a`（debug-only）：以 `TODO: <msg>` 抛 `Failure`；
- `@vuna@debug@on : Int -> Bool` / `@vuna@debug@line : String -> Int`：编译器 tracing 的
  **隐藏 runtime 原语**（`visible = False`，源码不可写；只由 `dbg!` 展开引用；
  `vuna interp` 归约为 no-op）；
- `prim_eff_eprint : String -> Eff [] Int`（console 组）：写 stderr 并 flush，返回写入字节数；
- `prim_fail : String -> a`（不在动作里）：抛 `Failure <msg>` 的底值，
  由生成的运行时报告器渲染成 `vuna: runtime error: ...` 并 exit 2。

`assert` / `todo` 在 release 构建（CLI 显式解析 `--release` / `VUNA_RELEASE=1` 得到 `Bool`，
包括 workspace 成员子进程）里由 `Loader.Resolve` 拒绝（`TC_DebugConstructInRelease`）；
`dbg!` 作为调试输出在两种构建都可用（受 `--debug-perf` 门控）。

`net` 原语 7 条 socket（工具链 server 与测试用；任何包都可直调）：

- `prim_eff_netListen : String -> Eff [] Int`：绑定并监听，返回 listener 句柄。地址是
  `tcp:HOST:PORT`（HOST 只接受数字 IPv4；`PORT=0` 取临时端口）或 `unix:PATH`；
- `prim_eff_netPort : Int -> Eff [] Int`：listener 的端口（TCP；unix 返回 0），配合 `PORT=0`；
- `prim_eff_netAccept : Int -> Eff [] Int`：阻塞接受一个连接，返回连接句柄；
- `prim_eff_netRecv : Int -> Int -> Eff [] String`：最多读 n 字节、**有数据就立即返回**（可能更少）；
  `""` 表示对端关闭；
- `prim_eff_netSend : Int -> String -> Eff [] Int`：写完整串（内部循环处理部分写），返回字节数；
- `prim_eff_netClose : Int -> Eff [] Int`：关闭句柄（幂等）；
- `prim_eff_netConnect : String -> Eff [] Int`：客户端连接（`vuna repl --client` 与测试夹具用）。

句柄是小整数，运行时映射到 `Unix.file_descr` 表，**不引入新的语言类型**；
无 DNS / TLS / 异步 / 超时（`accept`/`recv` 阻塞，见 §8）。

**名字面**：效果原语只有 `prim_eff_*` 名（外加 `effTimeUs`）。唯一用法是**直接**调用
`prim_eff_*`，得到 `Eff []` 动作（不需要 alias、不需要任何声明；原宿主别名层已删除）。

**执行入口**：动作只在 `main` 处由运行时执行；`main : Eff [] a` 的产物钩子是
`dtp_sched_main (fun () -> Base.Eff.runPure v_main)`。没有 main 之外的通用执行入口：
需要重复执行的部分用 handler 显式解释。

**内部 cast（不可见）**：`prim_erase` 是隐藏 intrinsic（`visible = False`），只由精化器在
「运行时类型不可命名」的 binder 使用点插入；签名 `{a} -> a -> a`、runtime `Obj.magic`、
`IntrinsicOp.OpIdentity` 让它对求值/定义性相等透明。用户源码不可引用它（不在 prelude，
也不受任何门控）。设计见 [effects.md](effects.md) §5。

以下分组只是**文档归类**（内建表不再带能力位；调用不受门控）：

| 分组 | 原语 / 入口 |
| --- | --- |
| `console` | `prim_eff_print`、`prim_eff_eprint`、`prim_eff_readLine`、`prim_eff_readBytes` |
| `fs` | `prim_eff_readFile`、`prim_eff_writeFile`、`prim_eff_writeFileAtomic`、`prim_eff_readDir`、`prim_eff_isDirectory`、`prim_eff_makeDir`、`prim_eff_removeFile`、`prim_eff_fileExists`、`prim_eff_fileMtime`、`prim_eff_fileSize` |
| `process` | `prim_eff_getArgs`、`prim_eff_exit`、`prim_eff_runIn`、`prim_eff_spawn`、`prim_eff_wait` |
| `env` | `prim_eff_getenv`、`prim_eff_getcwd`、`prim_eff_execPath` |
| `clock` | `effTimeUs`、`prim_eff_sleep` |
| `net` | `prim_eff_netListen`、`prim_eff_netPort`、`prim_eff_netAccept`、`prim_eff_netRecv`、`prim_eff_netSend`、`prim_eff_netClose`、`prim_eff_netConnect` |
| 运行时核心（隐藏） | `prim_effectPerform` / `prim_effectHandle` / `prim_cleanupPush` / `prim_cleanupPop`（运行时续延与 bracket cleanup，常规仅 `Base.Eff` 包装使用） |

- **原语是普通内建**：任何包（用户包、ad-hoc 文件）都可以直接调用 `prim_*` /
  `prim_eff_*`。不再有 manifest `[capabilities]` /
  `[trust]`、每包原语白名单、宿主模块 import 门控，也没有 REPL `--privileged`；旧诊断码
  （`PKG_EffectCapabilityRequired`、`RN_UnknownCapability`、`LD_HostModulePrivileged`、
  `PKG_NonPrivileged` 等）已删除，历史见 git。
- **推荐用法（纪律，非强制）**：常规用户面经 `Base.Eff.*` 标签 + handler 使用效果
  （入口 `runPure : Eff [] a -> a`），宿主层细节留在 `Base.Eff*` handler 内部（需要直调时
  调用 `prim_eff_*`）；base 的 Eff handler、编译器与根工具链内部仍直接使用原语。原语不改变类型检查、擦除或 codegen 语义，
  只是底层叶子。
- 显式接受的损失（宿主层 import 门控、每包原语白名单、网络仅根包可用等）与后续方向见
  [effects.md](effects.md) §8.6。

## 8. 生成 runtime 的契约

产物固定包含一个 `Vuna_runtime.ml`（`Codegen.Term.dtRuntime`），**无条件**内嵌 Unix：

- `Unix.stat`（`prim_eff_fileMtime` / `prim_eff_fileSize`）、`Unix.gettimeofday`（`effTimeUs`）、
  `Unix.sleepf`（`prim_eff_sleep`）、
  `Unix.readlink "/proc/self/exe"`（`prim_eff_execPath`）；`build.sh` 无条件
  `-I +unix ... unix.cmxa`。因此任何产物都依赖 OCaml 的 unix 库。
- 启动时设置 GC（`minor_heap_size` 16MB、`space_overhead` 200）。

下表 runtime 契约使用 `prim_eff_*` 名字（codegen 包一层 `MkEff`）。

| 原语 | runtime 契约 |
| --- | --- |
| `prim_eff_print` | 写 stdout 并 flush，返回**字节数**（签名 `Eff [] Int`；`Base.EffConsole.Print` 在 handler 边界转 `Nat`，D25） |
| `prim_eff_writeFile` | 二进制写整串，返回**字节数**（签名 `Eff [] Int`；`Base.EffFs.WriteFile` 在 handler 边界转 `Nat`，D25）；写失败抛宿主异常 |
| `prim_eff_writeFileAtomic` | 同 `prim_eff_writeFile`，但写 `<path>.<pid>.tmp` 后 `Sys.rename` 原子替换：并发读者只会看到完整旧内容或完整新内容（workspace 并行 check 的子进程共享缓存目录，必须原子写） |
| `prim_eff_readFile` | 读整个文件为字节串；读失败抛宿主异常 |
| `prim_eff_readLine` | 读一行；EOF 返回 `""`（与空行不可区分） |
| `prim_eff_readBytes` | `Int -> String`：最多读 n 字节，**有数据就立即返回**（可能少于 n），EOF 返回 `""`；调用方负责循环 / 拼接（LSP 帧读取用） |
| `prim_eff_readDir` | 目录项按字符串排序；目录不存在 / 不可读时抛宿主异常 |
| `prim_eff_makeDir` / `prim_eff_removeFile` | **幂等**：已存在 / 不存在时直接返回 `0` |
| `prim_eff_fileExists` | 路径不存在时为 `False` |
| `prim_eff_isDirectory` | 普通路径检查；**不存在**的路径抛宿主异常（`Sys_error` → `failwith`） |
| `prim_eff_fileMtime` / `prim_eff_fileSize` | 秒级 mtime / 字节数；取不到时**静默返回 0**（两个原语都返回 `Int`；`Base.EffFs.FileSize` 的结果族是 `Nat`，D25） |
| `prim_eff_getenv` | 变量未设置或为空串都返回 `""`（两者不可区分） |
| `prim_eff_getcwd` | 失败时返回 `"."` |
| `prim_eff_execPath` | 先读 `/proc/self/exe`（**Linux 假设**），失败回落 `Sys.executable_name` |
| `prim_eff_getArgs` | 排除 `argv[0]` 的其余参数 |
| `prim_eff_exit` | 立即退出进程（原语类型 `Int -> Eff [] Int`，执行即退出、**不返回**） |
| `prim_eff_sleep` | 阻塞 `Unix.sleepf (us / 1000000)`；`us <= 0` 立即返回 `0`（真实睡眠，非忙等） |
| `prim_eff_runIn` | 在给定目录执行 `sh` 命令并返回退出码，执行后恢复原 cwd |
| `prim_eff_spawn` | 异步启动子进程（argv 列表，继承 stdin/stdout/stderr），返回 pid |
| `prim_eff_wait` | 等待子进程并返回退出码（signal/stopped 归 1） |
| `prim_eff_netListen` | 绑定并监听：`tcp:HOST:PORT`（`SO_REUSEADDR`，backlog 8）或 `unix:PATH`（bind 前删除已存在的路径，开发工具惯例）；返回句柄表下标；失败 `failwith "net: ..."` |
| `prim_eff_netPort` | `getsockname` 的端口（TCP）；unix socket 返回 0 |
| `prim_eff_netAccept` | 阻塞接受一个连接，返回新句柄 |
| `prim_eff_netRecv` | 阻塞 `Unix.read`：有数据即返回（可能少于 n），对端关闭返回 `""` |
| `prim_eff_netSend` | 循环写完整串（处理部分写）；对端关闭时报 `net: send: connection closed` |
| `prim_eff_netClose` | 关闭 fd 并从句柄表移除（幂等） |
| `prim_eff_netConnect` | 客户端 `Unix.connect`（`tcp:`/`unix:` 同一套地址语法） |

效果原语的 runtime 表（`dtp_*`）仍是**立即执行**的 OCaml 函数；生成器
（`Codegen.Term.effPrimText`）按 `Intrinsic` 的 arity 把它们包成 `MkEff` 动作值，例如
`prim_eff_getcwd` → `(MkEff (fun (_ : EffUnit) -> dtp_getcwd ()))`、`prim_eff_print` →
`(fun s -> MkEff (fun (_ : EffUnit) -> dtp_print s))`。`prim_eff_bind1`（线性绑定）由
`effLinearBindText` 单独生成（装箱 `MkEff` 的 match）。因此零参原语（`prim_eff_getArgs` /
`prim_eff_readLine` / `prim_eff_getcwd` / `effTimeUs`）是动作**值**：引用不执行、不重新求值；
需要快照 / 执行时显式 `let t = runPure effTimeUs` 或在 `do` 里 `<-`。

## 9. interp 归约边界

`vuna interp` 是精化后的纯核心求值器（`Core.Eval.primReduce` 按 `IntrinsicOp` 归约）。
语言运算符 `+ - * /`、`== /= < <= > >=`、`++`、`&&`、`||` 全部归约（`/` 除零例外）。
边界按**显式分类**处理，不是静默错值：

| 类别 | 归约 | 说明 |
| --- | --- | --- |
| 上述运算符 | 是 | `/` 在除数为 0 时**不归约**（见下） |
| `bitAnd` / `bitOr` / `bitXor` / `bitNot` / `bitShl` / `bitShr` | 是 | 63-bit 补码语义，与 runtime `bi_bit*` 同公式（移位越界 = 0） |
| `bitAnd` / `bitOr` / `bitXor` / `bitNot` / `bitShl` / `bitShr` | 是 | 63-bit 补码语义，与 runtime `bi_bit*` 同公式（移位越界 = 0） |
| `strFromInt` / `strLength` / `strHash` / `strAt` / `strSubstring` / `strShow` | 是 | 与 runtime **同语义同公式** |
| `natAdd` / `natSub` / `natMul` / `natDiv` / `natToInt` / `natFromInt` | 是 | 与 runtime 同饱和 / 截断语义 |
| `strUnpack` / `strPack` / `strConcatMany` / `strSubstTemplate` | **否** | 结果依赖 `Base.List.List` 的构造子表示（List 桥接），核心求值器不构造该表示 |
| 全部 `OpNone` 原语：效果原语（`prim_eff_*`）、容器原语、`prim_fail` | **否** | 纯求值器不执行效果 / 不构造内建容器表示 |
| `a / 0` | **否** | 核心求值器表达不了运行期异常；显式分类，不返回 0 |

- 不可归约时 `main` 报 `[CG_MainNotValue] main does not reduce to a value`。
- `main : Eff [] a` / `main : Eff [] a` 一律报
  `error: [CG_InterpCannotExecuteEffects] interp cannot execute effects (main : Eff [] a / Eff [] a); compile and run the program instead`
  （退出码 2；无 `DT:` 前缀），不做「纯动作求值、效果丢弃」。
- **List 桥接**：codegen 把返回或接收 `List` 的 10 个原语映射到桥接 helper（`dtp_unpack` /
  `dtp_pack` / `dtp_concatMany` / `dtp_substTemplate` / `dtp_listOf` / `dtp_ocamlOf`）：
  `strUnpack` / `strPack` / `strConcatMany` / `strSubstTemplate`、`prim_eff_getArgs` /
  `prim_eff_readDir` / `prim_eff_runIn` / `prim_eff_spawn`、`arrayFromList` / `arrayToList`。桥接只为
  canonical `Base.List.List` 声明生成；包内没有该族时（例如没有 base 依赖）codegen 报
  ``[CG_ListBridgeRequired] builtin `<name>` requires the canonical `Base.List.List` declaration ...``。
- 相关夹具带 `.nointerp` 标记，只做 `compile` + 运行产物。

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
  没有 C 头文件解析（符号名与签名都要手写）；interp 不执行 extern（`main` 里用到时
  只走 compile + 运行）。
- C 实现是包的一部分：`ffi/` 目录随包走，不改变 `vuna.toml` 形状。

## 11. 已知边界

- 无大整数、无溢出诊断；`Int` 的 63 位宽度是宿主实现事实。
- 无 Unicode 码点 API / 无 UTF-8 校验；`String` 是字节串，`strPack` 越界是宿主错误。
- `prim_execPath` 依赖 `/proc/self/exe`（Linux），其它平台走 `Sys.executable_name`。
- `strPack` / `strUnpack` 的 List 桥接、`strSubstTemplate` 的模板扫描均在 runtime 里实现，
  interp 不覆盖（§9）。
- 原语的失败（宿主错误、`strPack` 越界、`/0`、`exit`）都是**宿主异常 / 进程退出**，
  由生成的运行时报告器统一报告（见 [debugging.md](debugging.md)），不是语言的可捕获错误。
- `net` 只有 TCP（数字 IPv4）与 Unix domain socket：无 DNS、TLS、异步/超时、并发；
  `accept`/`recv` 是阻塞语义。原语本身不限制绑定地址，`vuna repl --listen` 在 CLI 层只接受
  loopback 与 Unix socket（见 [tooling.md](tooling.md)）。
- 以上是原语与 runtime 侧的现状边界；开放债务见 [debt.md](debt.md)。
