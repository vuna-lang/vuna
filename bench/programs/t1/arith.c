/* arith 的 C 对照：与 arith.vuna 同算法（尾递归写成 while 循环）。
 * N 从 argv 读，避免 GCC 把常量循环折成闭式。 */
#include <stdio.h>
#include <stdlib.h>

static long loop(long acc, long n) {
  while (n > 0) {
    acc = acc + n * 3 - n / 2;
    n--;
  }
  return acc;
}

int main(int argc, char **argv) {
  long n = argc > 1 ? strtol(argv[1], NULL, 10) : 0;
  printf("%ld\n", loop(0, n));
  return 0;
}