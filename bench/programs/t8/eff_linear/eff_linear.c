/* eff_linear 的 C 对照：与 eff_linear.vuna 同语义；线性续延在 C 侧内联成
 * 一次性闭包的构造与立即调用（每轮恰好一次）。测线性续延构造 + 一次消费的成本。 */
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

static volatile int64_t token_value = 1;

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  int64_t acc = 0;
  while (n > 0) {
    int64_t t = token_value; /* MkToken 1：每轮一个线性 Token */
    acc += t + 1;            /* resumeCont k 1 */
    n--;
  }
  printf("%" PRId64, acc); /* golden 无尾换行 */
  return 0;
}