/* ffi_arith 的 C 对照：与 ffi_arith.vuna 同语义，但直接做加法（不经 FFI 边界）；
 * 每轮累加 i + i，输出 N(N+1)，不受 OCaml tagged int 表示影响。 */
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  int64_t acc = 0;
  for (int64_t i = 1; i <= n; i++) acc += i + i;
  printf("%" PRId64, acc); /* golden 无尾换行 */
  return 0;
}