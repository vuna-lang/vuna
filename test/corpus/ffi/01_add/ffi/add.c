/* M33 W5：受限 FFI 的 C 实现（纯函数、基本类型、无回调 / GC 交互）。
   OCaml 的 `int` 在 C 侧是 tagged `value`：用 Long_val / Val_long（caml/mlvalues.h）。 */
#include <caml/mlvalues.h>

value vuna_add(value a, value b) { return Val_long(Long_val(a) + Long_val(b)); }

value vuna_twice(value a) { return Val_long(Long_val(a) * 2); }