/* scalar_idiv 的 C 对照：与 vuna 同算法（非 2 幂常量除法 + 负数被除数）。
 * N 从 argv 读，避免 GCC 把常量循环折成闭式。 */
#include <stdio.h>
#include <stdlib.h>

static long loop(long acc, long n) {
  while (n > 0) {
    acc += (n - 5000000) / 1000;
    n--;
  }
  return acc;
}

int main(int argc, char **argv) {
  long n = argc > 1 ? strtol(argv[1], NULL, 10) : 0;
  printf("%ld\n", loop(0, n));
  return 0;
}