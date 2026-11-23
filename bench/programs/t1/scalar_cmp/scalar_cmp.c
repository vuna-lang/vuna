/* scalar_cmp 的 C 对照：与 vuna 同算法（六种比较关系物化成 0/1 后累加）。
 * 比较结果放在循环变量里传给下一轮，N 从 argv 读。 */
#include <stdio.h>
#include <stdlib.h>

static long loop(long acc, int lt, int le, int eq, int ne, int gt, int ge, long n) {
  while (n > 0) {
    acc += lt + le + eq + ne + gt + ge;
    lt = n < 500000;
    le = n <= 1000000;
    eq = n == 1500000;
    ne = n != 1500000;
    gt = n > 1200000;
    ge = n >= 1800000;
    n--;
  }
  return acc;
}

int main(int argc, char **argv) {
  long n = argc > 1 ? strtol(argv[1], NULL, 10) : 0;
  printf("%ld\n", loop(0, 1, 1, 1, 1, 1, 1, n));
  return 0;
}