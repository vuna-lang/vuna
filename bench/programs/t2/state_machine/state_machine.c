/* state_machine 的 C 对照：与 state_machine.vuna 同算法（9 状态线性分派 + 尾递归）。
 * GCC 对稠密 switch 会发跳转表，vuna 侧是 compare 链——这正是本项要量的差距。 */
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
  long n = argc > 1 ? strtol(argv[1], NULL, 10) : 0;
  long acc = 0;
  int s = 0;
  while (n > 0) {
    switch (s) {
      case 0: s = 1; acc += 1; break;
      case 1: s = 2; acc += 2; break;
      case 2: s = 3; acc += 3; break;
      case 3: s = 4; acc += 5; break;
      case 4: s = 5; acc += 8; break;
      case 5: s = 6; acc += 13; break;
      case 6: s = 7; acc += 21; break;
      case 7: s = 8; acc += 34; break;
      default: s = acc > 1000000 ? 0 : 1; acc += 55; break;
    }
    n--;
  }
  printf("%ld\n", acc);
  return 0;
}