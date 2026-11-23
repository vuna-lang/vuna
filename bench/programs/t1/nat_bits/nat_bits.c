/* nat_bits 的 C 对照：与 vuna 同算法（Nat 饱和算术 + 63-bit 位运算）。
 * N 从 argv 读，避免 GCC 把常量循环折成闭式。 */
#include <stdio.h>
#include <stdlib.h>

static long loop(long acc, long n) {
  while (n > 0) {
    n--;
    acc += n * 3;
  }
  return acc;
}

static long minus(long a, long b) { return a >= b ? a - b : 0; }
static long clampNat(long n) { return n < 0 ? 0 : n; }

int main(int argc, char **argv) {
  long n0 = argc > 1 ? strtol(argv[1], NULL, 10) : 0;
  long n = minus(loop(0, n0), 3);
  long m = clampNat(0 - 7);
  unsigned long x = 123456789UL;
  for (int k = 0; k < 64; k++) x = (x >> 1) ^ ((x & 1UL) << 62);
  printf("%ld\n", n + (long)(x & 65535UL) + m);
  return 0;
}