/* eff_host 的 C 对照：与 eff_host.vuna 同语义；C 侧把两层 handler 都内联成直接
 * 调用：Console handler 的 opH 每轮先 perform Tick 1，再以 0 resume 回 `consolePrint`；
 * 外层 Tick handler 把 n 原样交回。派发顺序与次数一致。
 * 测 handler 的 answer 本身是 Eff（answer row）时每轮额外一次派发的成本。 */
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

static volatile int64_t tick_value = 1;

/* 外层：handle { Tick n k -> k n }。 */
static int64_t tick_handler(void) { return tick_value; }

/* 内层 Console handler 的 opH：先 perform (Tick 1)，再 continue k 0。 */
static int64_t console_print(const char *s) {
  (void)s;
  (void)tick_handler();
  return 0;
}

/* loop 0 = pure 0；loop (Succ m) = do _ <- consolePrint "x"; y <- loop m; pure (y + 1)。 */
static int64_t loop(int64_t n) {
  if (n == 0) return 0;
  (void)console_print("x");
  return loop(n - 1) + 1;
}

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  printf("%" PRId64, loop(n)); /* golden 无尾换行 */
  return 0;
}