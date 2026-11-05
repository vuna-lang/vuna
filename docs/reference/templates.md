# 模板字符串与多行字面量（M36）

字符串字面量支持**插值**和**多行**：`"hi ${name}"`、`""" ... """`。两者都是
**纯语法糖**——`Loader.Resolve` 在名字解析后把模板降级成普通表达式，Elab / codegen
永远看不到模板节点。

## 插值

`"text ${e} rest"` 中每个 `${e}` 求值后转成字符串拼进结果：

1. 文本块保持原样（转义按 §「转义」解码）；
2. 洞 → `Base.Interp.interp e`；
3. 整体用 `++` 左结合链起（空文本块跳过；只有洞时直接返回该洞）。

转换语义**完全由 base 的 `Interp` 实例决定**（`base/lib/Base/Interp.vuna`）：

```vuna
trait Interp a where
  interp : a -> String

instance Show a => Interp a where   -- blanket：有 Show 就免费可插值，默认 = show
  interp x = show x

instance Interp String where        -- 具体实例覆盖 blanket：String 原样输出
  interp s = s
```

因此：

- `"${interp 42}"` → `"42"`；`"${interp "hi"}"` → `"hi"`（不加引号）；`"${interp True}"` → `"True"`；
- 任意 `deriving (Show)` 的 ADT 直接可插值；想自定义输出就写 `instance Interp T`（具体实例
  优先于 blanket），具体实例之间仍禁止重叠（`TC_OverlappingInstances`）；
- 泛型函数里的洞需要 `Interp`（或 `Show`）约束；签名里写 `Interp a =>` 最直接。**泛型函数的
  推断类型可能因此多一个隐式 `Interp` 字典参数**——需要稳定接口时显式写约束；
- 缺实例报 `TC_InterpNoInstance`（带解析后的类型名与三条修法提示）；
- 刻意**不提供** `deriving (Interp)`：要默认展示用 `deriving (Show)`。

洞内是任意表达式（支持嵌套字符串、嵌套模板、`let`/`case`/`do`）；`${}` 为空报
`PS_TemplateHoleEmpty`，`${...` 未闭合报 `LX_UnterminatedInterpolation`。插值**不支持**
模式（`PS_TemplateInPattern`）。

## 多行字面量

`""" ... """`：内容**逐字保留**（原始换行 / tab / `"` / `""` 都可以），只丢掉**紧跟开引号的
那一个换行**；遇 `"""` 结束。转义与插值同样生效。

```vuna
msg = """
line1 ${interp n}
  line2 "q"
"""
```

内容 = `line1 <n>\n  line2 "q"\n`（开引号后的第一个换行被丢掉，缩进是内容的一部分，
**不做 dedent**）。`fmt` 的规范形就是这个规则的正向写法：开引号后直接跟内容；若内容本身
以换行开头，则先补一个换行。单行且无洞的字面量仍按 `"..."` 输出。

## 转义

单行与多行共用的转义：`\n` `\t` `\r` `\"` `\\` `\'`，以及 M36 新增的 **`\$`**
（写一个字面 `${`；不带 `\` 的 `${` 会被解析成插值洞）。文本块里的 `$` 后紧跟 `{` 时
`fmt` 自动写成 `\$`。

## 已知边界

- `${...}` 里的注释由词法跳过、不进 AST，`fmt` 会丢失它们；
- 插值要求 base 在包依赖里（`Base.Interp` 由 `Prelude` 自动注入）；
- 模板节点只活到 `Loader.Resolve`：Lint / Index / Doc / LSP 在 parse 后看到 `EInterp`，
  `vuna lint` 会照常遍历洞内表达式；`vuna doc` 的类型签名里不会出现模板。
