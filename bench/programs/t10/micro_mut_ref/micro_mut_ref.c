/* micro_mut_ref 的 C 对照：与 micro_mut_ref.vuna 同算法——int64_t 单元上的读-改-写
 * 循环。N 从 argv 读；asm 屏障让 GCC 每轮都重新读单元，避免折成闭式。
 */
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  int64_t cell = 0;
  for (int64_t i = 0; i < n; i += 1) {
    int64_t v = cell;
    cell = v + 1;
    __asm__ volatile("" : "+r"(cell));
  }
  printf("%" PRId64, cell);
  return 0;
}