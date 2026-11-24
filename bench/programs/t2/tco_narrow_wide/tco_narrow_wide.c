/* tco_narrow_wide 的 C 对照：与 tco_narrow_wide.vuna 同算法。
 * C 不保证跨函数尾调用，这里直接写成等价的单循环（narrow ↔ wide 一轮减两步、
 * acc 每轮加 1..8），N 从 argv 读。 */
#include <stdio.h>
#include <stdlib.h>

static long run(long n) {
  long acc = 0;
  while (n > 0) {
    acc += 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8;
    n--;
  }
  return acc;
}

int main(int argc, char **argv) {
  long n = argc > 1 ? strtol(argv[1], NULL, 10) : 0;
  printf("%ld\n", run(n));
  return 0;
}