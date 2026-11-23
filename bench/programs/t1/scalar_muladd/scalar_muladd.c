/* scalar_muladd 的 C 对照：32-bit LCG，N 从 argv 读。 */
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
  long n = argc > 1 ? strtol(argv[1], NULL, 10) : 0;
  unsigned long acc = 0;
  while (n > 0) {
    acc = (acc * 1103515245UL + 12345UL) & 0xffffffffUL;
    n--;
  }
  printf("%ld\n", (long)acc);
  return 0;
}