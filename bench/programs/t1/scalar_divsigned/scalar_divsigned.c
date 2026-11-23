/* scalar_divsigned 的 C 对照：与 vuna 同算法（被除数可能为负的常量除法）。
 * N 从 argv 读，避免 GCC 把常量循环折成闭式。 */
#include <stdio.h>
#include <stdlib.h>

static long loop(long sum, long acc, long n) {
  while (n > 0) {
    sum += acc;
    acc = (acc - n) / 8;
    n--;
  }
  return sum;
}

int main(int argc, char **argv) {
  long n = argc > 1 ? strtol(argv[1], NULL, 10) : 0;
  printf("%ld\n", loop(0, 0, n));
  return 0;
}