/* tco_unrotated 的 C 对照：与 tco_unrotated.vuna 同算法。
 * 两个循环分别对应 step（两支都自调用）与 guard（`&&` 条件），N 从 argv 读后平分。 */
#include <stdio.h>
#include <stdlib.h>

static long step(int flag, long acc, long n) {
  while (n > 0) {
    acc += flag ? n : -n;
    flag = !flag;
    n--;
  }
  return acc;
}

static long guard(long acc, long n) {
  while (n > 0) {
    acc += (n > 2500000 && (n & 1) == 0) ? 1 : 2;
    n--;
  }
  return acc;
}

int main(int argc, char **argv) {
  long n = argc > 1 ? strtol(argv[1], NULL, 10) : 0;
  long half = n / 2;
  printf("%ld\n", step(1, 0, half) + guard(0, n - half));
  return 0;
}