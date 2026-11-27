# Float 与字面量转换（FromString / FromInt / FromFloat）

本页覆盖三块相关能力：

1. **`Float` primitive 类型**：字面量、算术/比较、`==`、`main : Float`、模板插值；
2. **字面量转换 trait**：`FromString` / `FromInt` / `FromFloat`（checking 位置按期望类型
   把字面量降级成 trait 方法）；
3. **`deriving`**：`deriving (FromString)` / `(FromInt)` / `(FromFloat)` 为单字段包装类型
   自动生成实例。

## Float

`Float` 是编译器内建 primitive（与 `Int` / `String` 同类，没有 `data` 声明），运行时是
OCaml IEEE-754 double。字面量语法只有一种：

```vuna
1.5       -- digits '.' digits
```

**没有**指数（`1e3`）、负号（写 `0.0 - x`）、十六进制或 `1.` 形式。`1e3` 会被词法拆成
`1` 与 `e3` 两个 token，于是按函数应用解析，在精化期报类型错误（不是词法/语法错误）。

### 类型与运算符

* 字面量在 **checking 位置**按期望类型决定是 `Int` / `Nat` / `Float` / 用户类型（见下节）；
  在 inference 位置默认是 `Int`（`Float` 字面量默认 `Float`）。
* `+ - * /` 在两侧都是 `Float` 时特化到浮点内建；除法是 IEEE 语义（`1.0 / 0.0` 得
  `infinity`，`0.0 / 0.0` 得 `nan`），**不**抛除零错误（与 `Int` 除法不同）。
* `< <= > >=`、`==`、`/=` 在两侧都是 `Float` 时直接特化到浮点比较/相等。
* **没有隐式 Int↔Float 转换**：`1 + 1.5` 是类型错误。显式转换：

```vuna
intToFloat : Int -> Float              -- 见 Base.Data.Float.intToFloat
floatToIntTrunc : Float -> Int         -- 向零截断；边界由后端 intFromFloat 决定
floatToIntSat : Float -> Int           -- 向零截断后饱和（NaN → 0）
floatToIntMaybe : Float -> Maybe Int   -- 不可表示 → Nothing
```

这三条都是有损的全函数（`Int -> Float` 超过 53 位尾数会丢精度，`Float -> Int` 截断小数），
因此不进入显式转换 trait `Convert`；`Convert` / `ConvertMaybe` 的契约见
[conversions.md](conversions.md)。底层 intrinsic 仍是 `floatFromInt` / `intFromFloat`：
`intFromFloat` 对 NaN / ±inf / 超界的行为由后端决定（wasm 的 `i64.trunc_f64_s` 会 trap），
需要稳定语义时用 `floatToIntSat` / `floatToIntMaybe`。

取整与判定同样不需要新原语：

```vuna
trunc / floor / ceil / round : Float -> Float   -- .5 远离零；|x| >= 2^52 时原样返回
isNaN / isInfinite / isFinite : Float -> Bool
floorToInt / ceilToInt / roundToInt : Float -> Maybe Int
floatToNat / floatToNatMaybe : Float -> Nat / Maybe Nat
```

`floorToInt` 等先取整再判可表示性，所以仍返回 `Maybe`。`floatToNatMaybe` 先拒绝负数
（`-0.5` 不会经截断变成 `0`），`floatToNat` 则把负数与 NaN 都夹成 0。

`Base.Data.Float` 随 `Prelude` 自动导出：`abs`、`sqrt`、上述转换/取整 helper、
`FromFloat` 字面量转换与 `Eq` / `Ord` / `Show` 实例都不需要
import（显式 `import Base.Data.Float as Float` 仍允许）。`show` 的文本规则与 OCaml `string_of_float`
一致（`%.12g`：12 位有效数字、去掉尾随零、定点范围 `[-4, 12)`、整数值保留结尾 `.`）：

| 值 | 文本 |
| --- | --- |
| `1.5` / `6.0` / `0.0001` | `1.5` / `6.` / `0.0001` |
| `2.0 / 3.0` | `0.666666666667` |
| `1000000000000.0` | `1e+12` |
| `1.0 / 0.0` / `0.0 / 0.0` | `inf` / `nan` |

实现是 `Base.Data.Float.floatRender`（只用 Float / Int 运算与字符串拼接），三个后端
（OCaml / wasm / native）与模板插值共用这一份代码。NaN 不区分符号位：`0.0 / 0.0`
在 x86 上是负 NaN，OCaml 的 `string_of_float` 会打印 `-nan`，这里统一打印 `nan`。

`main : Float` 的展示同样走 `floatRender`；模板插值 `${1.5}` 与 `show` 同文本。
代价见「Prelude 与产物影响」。

### 核心求值 / REPL

核心求值器**支持浮点**：`vuna test` 的纯测试与 REPL 求值按 IEEE-754 double 归约
全部浮点原语（`+ - * /`、`< <= > >=`、`==`、`/=`、`abs` / `sqrt` → `floatAbs` /
`floatSqrt`、`floatFromInt` / `intFromFloat`），语义与编译产物一致
（除零得 `infinity`、`0.0 / 0.0` 得 `nan`、`nan == nan` 为 False、`+0.0 == -0.0` 为
True）。`VFloat` 的值形态就是宿主 double：算术与比较**不经过文本**，字面量文本只在
求值入口解析一次（`quote` 时才按 `%.12g` 落回文本），因此 `1.0 / 3.0 * 3.0` 是 `1.0`、
`0.1 + 0.2 == 0.3` 是 `False`，与产物逐位一致（回归夹具
`packages/compiler/test/corpus/float/12_precision_roundtrip`）：

```console
vuna> 1.5 + 2.25
3.75
vuna> 2.0
2.
vuna> 1.0 / 0.0
inf
```

`main : Float` 的核心求值展示同样用 `%.12g` 规范文本（与编译路径一致）。
REPL 的 `:type` 仍只做类型检查，不等价于求值。**类型表达式里的浮点字面量仍被拒绝**
（类型语法不接受 `Float` 字面量，见负例 `09_float_in_type`）。

## 字面量转换 trait

`"..."` / `42` / `1.5` 在 checking 位置如果期望类型**不是**对应的内建类型
（`String` / `Int` / `Float`；`Nat` 字面量仍展开成 `Zero`/`Succ` 链），编译器会做一次
实例搜索：

* 找到实例：字面量降级成 `fromString "..."` / `fromInt 42` / `fromFloat 1.5`，再按普通
  方法调用精化（隐式类参、字典 binder、延迟字典目标都走既有路径）；
* 找不到：回退到常规推断路径并给出通常的类型错误。

trait 定义：

```vuna
-- Base.Trait.FromString（Prelude 导出）
trait FromString a where
  fromString : String -> a
instance FromString String where fromString s = s

-- Base.Trait.FromInt（Prelude 导出）
trait FromInt a where
  fromInt : Int -> a
instance FromInt Int where fromInt n = n

-- Base.Data.Float（Prelude 导出）
trait FromFloat a where
  fromFloat : Float -> a
instance FromFloat Float where fromFloat x = x
```

只有 **checking 位置**会降级（注解、函数实参、返回类型已知的分支等）；`let x = 42` 这类
inference 位置仍默认 `Int`。`Nat` 的整数字面量特例优先于 `FromInt`（`x : Nat` 时 `42`
是 `Succ` 链，不会调用 `fromInt`）；显式 Int→Nat 用 `Base.Data.Nat.fromIntClamp`。

### deriving

`deriving (FromString)` / `(FromInt)` / `(FromFloat)` 只接受**一个构造子、一个字段、
字段类型就是对应内建类型**的包装类型（记录在降级后同样适用）：

```vuna
import Base.Trait.FromString as FromString
import Base.Trait.FromInt as FromInt

data Email : Type where
  MkEmail : String -> Email
deriving (FromString)

data Age : Type where
  MkAge : Int -> Age
deriving (FromInt)

main : String
main =
  (
    case (MkEmail "x@y") of
      MkEmail s => s
  )
    ++ "/"
    ++ case (MkAge 42) of
      MkAge n => strFromInt n
```

生成的是 `instance C T where fromX sx = C sx`（不递归调用 trait，因此没有自引用/终止性
问题）。多构造子、多字段、字段类型不匹配都会给出可解释错误；跨类型语义（如字段是
`Email` 而不是 `String`）需要手写实例。

## Prelude 与产物影响

`Base.Data.Float` 进入 `Prelude`（`module Base.Data.Float` + `import Base.Data.Float`）。Float 语法/类型/运算符/`main` 支持一直在编译器里，不需要库导入；进
Prelude 的是 trait、实例与 helper。取舍：

* `FromFloat`、`abs` / `sqrt` / `intToFloat` / `floatToIntTrunc` / `floatToIntSat` /
  `floatToIntMaybe` / 取整 helper 与 `Show/Eq/Ord Float`
  随 Prelude 自动可见；`deriving (Show, Eq, Ord)` 的包装类型字段是 Float 时也不需要
  额外 import。
* 代价：Prelude 闭包包含 `Base.Data.Float`，`Driver.SplitGen` 按**全部定义**扫描浮点用法，
  因此所有程序的 `Vuna_runtime.ml` 都会追加浮点 helper；没有「no-float 程序不追加」的
  逐字节约定（seed 固定点 / 模块缓存仍由 rotation 保证）。
* `Driver/Dt.programUsesFloat` / `Elab/Driver.exprHasFloat` 这两个「核心求值见浮点就拒绝」
  的 guard 不存在；核心求值 / REPL 直接按 `Core/Eval` 的浮点归约求值。
* `Base.Intrinsics` 里浮点内建单独成表（`floatIntrinsics`），不改变 Int/String 原语面。

## 测试

`packages/compiler/test/corpus/float`（`[family.float]`，章节 60）覆盖字面量/算术、比较/相等、转换、
模板插值、`Show/Eq/Ord` 实例、`FromFloat` + `deriving`、`main : Float`、Prelude 默认
可见性（`10_prelude_float`）、核心求值的 double 精度（`12_precision_roundtrip`：文本往返
不再参与算术/比较）与两条负例（隐式混用、类型表达式里的浮点字面量）。浮点夹具
同时走核心求值与 run，二者都与同一份 golden 逐字节比较。