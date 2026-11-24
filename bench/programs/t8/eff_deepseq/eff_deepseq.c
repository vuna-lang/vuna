/* eff_deepseq 的 C 对照：与 eff_deepseq.vuna 同语义；C 侧把 P handler 内联成直接
 * 调用，每一层都 perform 一次，深栈上顺序 resume 的顺序与次数一致。
 * 测非尾递归每一层都派发一次时的续延成本。 */
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

static volatile int64_t p_value = 1;

/* handle { P n k -> k n }：把 n 原样 resume 回去。 */
static int64_t p_handler(void) { return p_value; }

/* sum 0 = pure 0；sum (Succ m) = do x <- perform (P 1); y <- sum m; pure (x + y)。 */
static int64_t sum(int64_t n) {
  if (n == 0) return 0;
  return p_handler() + sum(n - 1);
}

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  printf("%" PRId64, sum(n)); /* golden 无尾换行 */
  return 0;
}