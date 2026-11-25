# 显式类型转换（Convert / ConvertMaybe）

`Base.Trait.Convert` 提供两个显式转换 trait。它们只由显式调用触发：编译器不做隐式插入，
没有 `deriving`，也没有恒等 / 传递 blanket 实例。字面量转换（`FromString` / `FromInt` /
`FromFloat`）是另一套机制，见 [floats.md](floats.md)。

## 契约

| trait | 方法 | 契约 |
| --- | --- | --- |
| `Convert a b` | `convert : a -> b` | 全函数、无损：总能返回，且不丢信息 |
| `ConvertMaybe a b` | `convertMaybe : a -> Maybe b` | 可失败：不成立返回 `Nothing`，不用 clamp / 截断兜底 |

有损但仍全函数的转换（`Nat.fromInt` 的负数 clamp、`floatToInt` 的截断）**不进入**这两个
trait，保留具名函数：损失写在名字上。

## base 实例

| 实例 | 实现 | 落点 |
| --- | --- | --- |
| `Convert Nat Int` | `Nat.toInt` | `Base.Data.Nat` |
| `Convert (Fin n) Nat` | `Fin.finToNat` | `Base.Data.Fin` |
| `Convert (Fin n) Int` | `natToInt (finToNat j)` | `Base.Data.Fin` |
| `ConvertMaybe Int Nat` | `Nat.fromIntMaybe` | `Base.Data.Nat` |

`instance Convert (Fin n) ...` 的 `n` 是 Rig0 索引（不在运行时表示里），一个实例覆盖所有 `n`。

### 进入 Fin 不是实例

`Fin` 的索引在值上擦除，转换进 `Fin` 必须把界当运行时值传入：

```vuna
finFromNat : (n : Nat) -> Nat -> Maybe (Fin n)
finFromInt : (n : Nat) -> Int -> Maybe (Fin n)
```

类方法签名固定为 `a -> b` / `a -> Maybe b`，没有位置放这个界，所以 `Nat -> Fin n`、
`Int -> Fin n` 不能做成实例；`Fin n -> Fin m` 用 `finWeaken`（只放宽一层）。

## 用法

```vuna
import Base.Data.Fin as Fin
import Base.Data.Nat as Nat
import Base.Trait.Convert as Convert

n : Int
n = Convert.convert (Nat.Succ Nat.Zero)

j : Fin 3
j = Fin.finLast 2

i : Int
i = Convert.convert j

m : Maybe Nat
m = Convert.convertMaybe (-1)
```

`convert` / `convertMaybe` 不随 `Prelude` 自动可见：写 `import Base.Trait.Convert as Convert`
（或 `import Base.Trait.Convert` 拿扁平名字）。

### 推断位置要注解

实例搜索按完整头 `Dict_Convert a b` 做，没有 functional dependency，所以两个类型参数都要已知：

```vuna
x : Int
x = convert (Nat.Succ Nat.Zero)      -- 目标 Int 由签名给出

main : String
main =
  let
    y = convert (Nat.Succ Nat.Zero)  -- 报 TC_UnsolvedMetavar：目标类型未知
  in "x"
```

## 用户实例

实例跟类型模块走：给自定义类型加转换，就在定义该类型的模块写实例。

```vuna
data Email : Type where
  MkEmail : String -> Email

instance Convert Email String where
  convert e = case e of MkEmail s => s
```

同一对类型只能有一个实例（coherence）。需要多套映射（公开 / 管理 / 兼容）时写具名函数
或函数记录，不要跨过 coherence。

## 核心求值与后端

- 转换走普通 trait 字典，不做精化特化；base 内部热路径继续直接调原语。
- 实例是普通 vuna 定义，OCaml / WASM / Native 三端都走同一条 codegen。
- 核心求值器（`vuna test` 纯测试 / REPL）先 `force` 再做深度正规化：构造子字段与卡住
  应用的实参都会继续归约，所以 `Nat` 结构递归（含 `finToNat` / `finLast`）在 interp
  路径可用，`Fin` 夹具不需要专门改成 `.run.out`。仍只做 compile + run 的夹具限于
  interp 无法表达的原语（List 桥接、宿主副作用等，见 [primitives.md](primitives.md)）。

## 相关

- 字面量按期望类型降级：`FromString` / `FromInt` / `FromFloat`（[floats.md](floats.md)）。
- trait / 实例 / coherence / 孤儿规则：[records-traits.md](records-traits.md)。
- `Nat` 的无损提升与有损/可失败转换：[primitives.md](primitives.md) §3。