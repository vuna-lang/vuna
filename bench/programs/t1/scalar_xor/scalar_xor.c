/* scalar_xor 的 C 对照：N 从 argv 读，避免常量循环被折成闭式。 */
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
  long n = argc > 1 ? strtol(argv[1], NULL, 10) : 0;
  unsigned long acc = 0;
  while (n > 0) {
    acc ^= (unsigned long)n;
    n--;
  }
  printf("%ld\n", (long)acc);
  return 0;
}