/* scalar_bit 的 C 对照：与 vuna 同算法（位或 / 按位取反 / 立即数异或）。
 * 上一轮的结果在循环变量间传递，N 从 argv 读。 */
#include <stdio.h>
#include <stdlib.h>

static long loop(long acc, long inv, long orv, long x, long n) {
  while (n > 0) {
    acc += inv;
    inv = ~orv;
    orv = x | n;
    x ^= 12345;
    n--;
  }
  return acc;
}

int main(int argc, char **argv) {
  long n = argc > 1 ? strtol(argv[1], NULL, 10) : 0;
  printf("%ld\n", loop(0, 0, 0, 1, n));
  return 0;
}