/* tco_wide 的 C 对照：与 tco_wide.vuna 同算法（9 参自递归尾递归）。
 * 循环变量写成 9 个局部；N 从 argv 读。 */
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
  long n = argc > 1 ? strtol(argv[1], NULL, 10) : 0;
  long a = 0, b = 0, c = 0, d = 0, e = 0, f = 0, g = 0, h = 0;
  while (n > 0) {
    long na = a + 1, nb = b + 2, nc = c + 3, nd = d + 4;
    long ne = e + 5, nf = f + 6, ng = g + 7, nh = h + n;
    a = na;
    b = nb;
    c = nc;
    d = nd;
    e = ne;
    f = nf;
    g = ng;
    h = nh;
    n--;
  }
  printf("%ld\n", a + b + c + d + e + f + g + h);
  return 0;
}