/* tco_args 的 C 对照：与 tco_args.vuna 同算法（交叉依赖实参的尾递归）。
 * 上一轮的值在 a / b / c 之间轮转，N 从 argv 读。 */
#include <stdio.h>
#include <stdlib.h>

static long step(long a, long b, long c, long n) {
  while (n > 0) {
    long s = a + b + c;
    long next = s - (s / 1000) * 1000;
    a = b;
    b = c;
    c = next;
    n--;
  }
  return a * 1000000 + b * 1000 + c;
}

int main(int argc, char **argv) {
  long n = argc > 1 ? strtol(argv[1], NULL, 10) : 0;
  printf("%ld\n", step(1, 2, 3, n));
  return 0;
}