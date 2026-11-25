/* 受限 FFI 的 C 实现：Int 在 C 侧是 tagged value，用 Long_val / Val_long 进出。 */
#include <caml/mlvalues.h>

value vuna_add(value a, value b) { return Val_long(Long_val(a) + Long_val(b)); }