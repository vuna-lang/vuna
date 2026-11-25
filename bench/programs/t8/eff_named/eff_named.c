/* eff_named 的 C 对照：与 eff_named.vuna 同语义；两个命名 Reader 实例在 C 侧
 * 就是两个变量，handler 投影成常量后直接相加，每轮顺序 ask 两次。
 * 测命名实例路由的成本。 */
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

static volatile int64_t left_value = 3;  /* handleReader "left"  -> 3 */
static volatile int64_t right_value = 4; /* handleReader "right" -> 4 */

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  int64_t acc = 0;
  while (n > 0) {
    int64_t a = left_value;  /* ask "left" */
    int64_t b = right_value; /* ask "right" */
    acc += a * 10 + b;
    n--;
  }
  printf("%" PRId64, acc); /* golden 无尾换行 */
  return 0;
}