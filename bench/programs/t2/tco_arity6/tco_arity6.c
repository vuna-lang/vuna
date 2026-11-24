/* tco_arity6 的 C 对照：与 tco_arity6.vuna 同算法（6 参自递归尾调用）。
 * 6 个循环变量轮转，N 从 argv 读。 */
#include <stdio.h>
#include <stdlib.h>

static long step(long a, long b, long c, long d, long e, long n) {
  while (n > 0) {
    long next = a + n;
    a = b;
    b = c;
    c = d;
    d = e;
    e = next;
    n--;
  }
  return a + b + c + d + e;
}

int main(int argc, char **argv) {
  long n = argc > 1 ? strtol(argv[1], NULL, 10) : 0;
  printf("%ld\n", step(0, 0, 0, 0, 0, n));
  return 0;
}