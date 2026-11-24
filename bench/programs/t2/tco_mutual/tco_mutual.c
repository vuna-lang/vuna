/* tco_mutual 的 C 对照：与 tco_mutual.vuna 同算法（互递归尾调用）。
 * 写成等价的奇偶状态循环；N 从 argv 读。 */
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
  long n = argc > 1 ? strtol(argv[1], NULL, 10) : 0;
  int even = 1;
  while (n > 0) {
    even = !even;
    n--;
  }
  printf("%d\n", even);
  return 0;
}