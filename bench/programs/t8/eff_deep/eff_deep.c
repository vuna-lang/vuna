/* eff_deep 的 C 对照：与 eff_deep.vuna 同语义；C 侧把 Tick handler 内联成直接
 * 调用，最深处的 perform 只发生一次，续延恢复后逐层 +1 的顺序与次数一致。
 * 测非尾递归到深度 N 才 perform 时续延捕获/恢复的深度成本。 */
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

static volatile int64_t tick_value = 1;

/* handle { Tick n k -> k n }：把 n 原样 resume 回去。 */
static int64_t tick_handler(void) { return tick_value; }

/* sum 0 = perform (Tick 1)；sum (Succ m) = do y <- sum m; pure (y + 1)。
 * 续延恢复交回的 y 落在栈槽里，每层必须真实保存一次，避免编译器把整段
 * 非尾递归折成闭式。 */
static int64_t sum(int64_t n) {
  if (n == 0) return tick_handler();
  volatile int64_t y = sum(n - 1);
  return y + 1;
}

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  printf("%" PRId64, sum(n)); /* golden 无尾换行 */
  return 0;
}