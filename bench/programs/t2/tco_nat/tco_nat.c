/* tco_nat 的 C 对照：与 tco_nat.vuna 同算法（Nat 结构递归的尾调用）。
 * N 从 argv 读，累加 0..N-1。 */
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
  long n = argc > 1 ? strtol(argv[1], NULL, 10) : 0;
  long acc = 0;
  while (n > 0) {
    n--;
    acc += n;
  }
  printf("%ld\n", acc);
  return 0;
}