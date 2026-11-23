/* float_math 的 C 对照：与 vuna 同算法（sqrt / abs / 除法 / 比较）。
 * N 从 argv 读，避免 GCC 把常量循环折成闭式；用 builtin 避免依赖 libm。 */
#include <stdio.h>
#include <stdlib.h>

static double loop(double acc, long n) {
  while (n > 0) {
    double step = __builtin_sqrt(__builtin_fabs((double)n)) * 0.25 - 0.5;
    acc = acc + step / 3.0 + (acc < 50000000.0 ? 1.0 : 0.0);
    n--;
  }
  return acc;
}

int main(int argc, char **argv) {
  long n = argc > 1 ? strtol(argv[1], NULL, 10) : 0;
  printf("%d\n", (int)loop(0.0, n));
  return 0;
}