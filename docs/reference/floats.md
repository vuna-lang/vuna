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

**没有**指数（`1e3`）、负号（写 `0.0 - x`）、十六进制或 `1.` 形式；这些会被拆成其它
token 并报语法错误。

### 类型与运算符

* 字面量在 **checking 位置**按期望类型决定是 `Int` / `Nat` / `Float` / 用户类型（见下节）；
  在 inference 位置默认是 `Int`（`Float` 字面量默认 `Float`）。
* `+ - * /` 在两侧都是 `Float` 时特化到浮点内建；除法是 IEEE 语义（`1.0 / 0.0` 得
  `infinity`，`0.0 / 0.0` 得 `nan`），**不**抛除零错误（与 `Int` 除法不同）。
* `< <= > >=`、`==`、`/=` 在两侧都是 `Float` 时直接特化到浮点比较/相等。
* **没有隐式 Int↔Float 转换**：`1 + 1.5` 是类型错误。显式转换：

```vuna
floatFromInt : Int -> Float     -- 见 Base.Float.intToFloat（更可读的别名）
intFromFloat : Float -> Int     -- 向零截断
```

`Base.Float` 随 `Prelude` 自动导出（2026-11 rotation 后提升）：`abs`、`sqrt`、
`intToFloat`、`floatToInt`、`FromFloat` 字面量转换与 `Eq` / `Ord` / `Show` 实例都不需要
import（显式 `import Base.Float` 仍允许）。`show` 输出 OCaml `string_of_float` 的十进制
形式。代价见「Prelude 与产物影响」。

`main : Float` 的展示函数是 `string_of_float`；模板插值 `${1.5}` 直接走 `strFromFloat`，
不需要 `Show` 实例。

### interp / REPL

核心求值器**支持浮点**（B44 起）：`vuna interp` 与 REPL 求值按 IEEE-754 double 归约
全部浮点原语（`+ - * /`、`< <= > >=`、`==`、`/=`、`abs` / `sqrt` → `floatAbs` /
`floatSqrt`、`strFromFloat` / `floatFromInt` / `intFromFloat`），语义与编译产物一致
（除零得 `infinity`、`0.0 / 0.0` 得 `nan`、`nan == nan` 为 False、`+0.0 == -0.0` 为
True）。`VFloat` 的载荷是 `string_of_float` 的规范文本（字面量在求值入口规范化），
因此 interp 展示、定义性相等与编译产物三处同文本：

```console
vuna> 1.5 + 2.25
3.75
vuna> 2.0
2.
vuna> 1.0 / 0.0
inf
```

`main : Float` 的 interp 展示同样用规范文本（与编译路径的 `string_of_float` 一致）。
REPL 的 `:type` 仍只做类型检查，不等价于求值。**类型表达式里的浮点字面量仍被拒绝**
（类型语法不接受 `Float` 字面量，见负例 `09_float_in_type`）。

## 字面量转换 trait

`"..."` / `42` / `1.5` 在 checking 位置如果期望类型**不是**对应的内建类型
（`String` / `Int` / `Float`；`Nat` 字面量仍展开成 `Zero`/`Succ` 链），编译器会做一次
实例搜索：

* 找到实例：字面量降级成 `fromString "..."` / `fromInt 42` / `fromFloat 1.5`，再按普通
  方法调用精化（隐式类参、字典 binder、延迟字典目标都走既有路径）；
* 找不到：回退到原来的推断路径并给出通常的类型错误。

trait 定义：

```vuna
-- Base.FromString（Prelude 导出）
trait FromString a where
  fromString : String -> a
instance FromString String where fromString s = s

-- Base.FromInt（Prelude 导出）
trait FromInt a where
  fromInt : Int -> a
instance FromInt Int where fromInt n = n

-- Base.Float（Prelude 导出）
trait FromFloat a where
  fromFloat : Float -> a
instance FromFloat Float where fromFloat x = x
```

只有 **checking 位置**会降级（注解、函数实参、返回类型已知的分支等）；`let x = 42` 这类
inference 位置仍默认 `Int`。`Nat` 的整数字面量特例优先于 `FromInt`（`x : Nat` 时 `42`
是 `Succ` 链，不会调用 `fromInt`）；显式 Int→Nat 用 `Base.Nat.fromInt`。

### deriving

`deriving (FromString)` / `(FromInt)` / `(FromFloat)` 只接受**一个构造子、一个字段、
字段类型就是对应内建类型**的包装类型（记录在降级后同样适用）：

```vuna
import Base.FromString
import Base.FromInt

data Email : Type where
  MkEmail : String -> Email
deriving (FromString)

data Age : Type where
  MkAge : Int -> Age
deriving (FromInt)

main : String
main = case (MkEmail "x@y") of
    MkEmail s => s
  ++ "/" ++ case (MkAge 42) of
    MkAge n => strFromInt n
```

生成的是 `instance C T where fromX sx = C sx`（不递归调用 trait，因此没有自引用/终止性
问题）。多构造子、多字段、字段类型不匹配都会给出可解释错误；跨类型语义（如字段是
`Email` 而不是 `String`）需要手写实例。

## Prelude 与产物影响

`Base.Float` 自 2026-11 的 rotation 起进入 `Prelude`（`module Base.Float` + `import
Base.Float`）。Float 语法/类型/运算符/`main` 支持一直在编译器里，不需要库导入；进
Prelude 的是 trait、实例与 helper。取舍：

* `FromFloat`、`abs` / `sqrt` / `intToFloat` / `floatToInt` 与 `Show/Eq/Ord Float`
  随 Prelude 自动可见；`deriving (Show, Eq, Ord)` 的包装类型字段是 Float 时也不需要
  额外 import。
* 代价：Prelude 闭包包含 `Base.Float`，`Codegen.Split` 按**全部定义**扫描浮点用法，
  因此所有程序的 `Vuna_runtime.ml` 都会追加浮点 helper；原先把 Float 当 opt-in 时的
  「no-float 程序逐字节一致」不再成立（seed 固定点/模块缓存仍由 rotation 保证）。
* `Driver/Dt.programUsesFloat` / `Elab/Driver.exprHasFloat` 这两个「interp 见浮点就拒绝」
  的 guard 已随 B44 删除；interp / REPL 直接按 `Core/Eval` 的浮点归约求值。
* `Intrinsics` 里浮点内建单独成表（`floatIntrinsics`），不改变 Int/String 原语面。

## 测试

`test/corpus/float`（`[family.float]`，章节 60）覆盖字面量/算术、比较/相等、转换、
模板插值、`Show/Eq/Ord` 实例、`FromFloat` + `deriving`、`main : Float`、Prelude 默认
可见性（`10_prelude_float`）与两条负例（隐式混用、类型表达式里的浮点字面量）。B44 起
浮点夹具不再带 `.nointerp`：interp 与 run 都与同一份 golden 逐字节比较。