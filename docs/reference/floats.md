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
import Base.Float

floatFromInt : Int -> Float     -- 见 Base.Float.intToFloat（更可读的别名）
intFromFloat : Float -> Int     -- 向零截断
```

`Base.Float` 还提供 `abs`、`sqrt`、`intToFloat`、`floatToInt`，以及 `Eq` / `Ord` / `Show`
实例（`show` 输出 OCaml `string_of_float` 的十进制形式）。**注意 `Base.Float` 不在
`Prelude`**（见「bootstrap 边界」）：`Show` / `Eq` / `Ord` 字典、转换 helper 与
`FromFloat` 字面量转换需要显式 `import Base.Float`；字面量、算术、比较、`main : Float`
和模板插值不需要。

`main : Float` 的展示函数是 `string_of_float`；模板插值 `${1.5}` 直接走 `strFromFloat`，
不需要 `Show` 实例。

### interp / REPL 限制

核心求值器**不支持浮点**：`vuna interp`、REPL 求值与 `:type` 遇到浮点程序/表达式会明确
报错：

```console
error: vuna interp: Float is not supported by the interpreter (use vuna compile / vuna run; ...)
```

Float 程序请用 `vuna compile` + `vuna run`（测试夹具用 `.nointerp` 标记）。这是**已知
缺口**（debt 记录），不是最终形态。

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

-- Base.Float（需要 import Base.Float）
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

## bootstrap 边界（为什么 Base.Float 不在 Prelude）

当前 seed 还是 rotation 之前的旧编译器：它不认识 `Float` 语法/内建。如果 `Prelude`
（在 seed 闭包里）导入 `Base.Float` 或出现浮点字面量，**当前 seed 就无法编译当前源码**，
违反硬不变量。因此：

* `Float` 的语法/类型/运算符/`main` 支持在编译器里，不需要库导入；
* `Base.Float`（trait/实例/helper）**不**被 `Prelude` 导入，只由用户显式 `import`；
* `Intrinsics` 里浮点内建单独成表（`floatIntrinsics`），且 `Vuna_runtime.ml` 只在程序
  （含依赖）真的用到浮点时追加浮点 helper——no-float 程序的生成结果与之前**逐字节一致**
  （seed 固定点/模块缓存不受影响）。

将来做一次 seed rotation 后，可以把 `Base.Float` 提升进 `Prelude` 并按 favourite 的
`deriving` 清单扩展；在此之前，`FromString` / `FromInt` 已在 Prelude（它们不引入
`Float`，旧 seed 可以编译）。

## 测试

`test/corpus/float`（`[family.float]`，章节 60）覆盖字面量/算术、比较/相等、转换、
模板插值、`Show/Eq/Ord` 实例、`FromFloat` + `deriving`、`main : Float` 与两条负例
（隐式混用、类型表达式里的浮点字面量）。浮点夹具都带 `.nointerp`。