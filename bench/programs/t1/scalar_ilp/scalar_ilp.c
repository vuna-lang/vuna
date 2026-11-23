/* scalar_ilp 的 C 对照：与 vuna 同算法（4 个独立累加器 + 循环计数）。
 * N 从 argv 读，避免 GCC 把常量循环折成闭式。 */
#include <stdio.h>
#include <stdlib.h>

static long loop(long a, long b, long c, long d, long n) {
  while (n > 0) {
    a += n * 3;
    b ^= n;
    c += n / 8;
    d = (d * 5 + 7) & 65535;
    n--;
  }
  return a + b + c + d;
}

int main(int argc, char **argv) {
  long n = argc > 1 ? strtol(argv[1], NULL, 10) : 0;
  printf("%ld\n", loop(0, 0, 0, 0, n));
  return 0;
}