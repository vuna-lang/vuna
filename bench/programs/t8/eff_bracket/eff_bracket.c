/* eff_bracket 的 C 对照：与 eff_bracket.vuna 同语义；C 侧把 Tick handler 内联成
 * 直接调用，bracket 的 acquire → use → release 收尾内联成顺序调用，次数与顺序一致
 * （正常路径 release 恰好一次）。测每轮 bracket 的 cleanup push/pop 与 do 绑定成本。 */
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

static volatile int64_t tick_value = 1;

/* handle { Tick n k -> k n }：把 n 原样 resume 回去。 */
static int64_t tick_handler(void) { return tick_value; }

static int64_t acquire(void) { return 0; } /* bracket (pure 0) ... */
static int64_t release(void) { return 1; } /* \_ => pure 1 */
static int64_t use(void) { return tick_handler(); } /* \_ => perform (Tick 1) */

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  int64_t acc = 0;
  while (n > 0) {
    (void)acquire();
    int64_t x = use();
    (void)release(); /* 收尾：正常路径弹出 cleanup 后执行一次 */
    acc += x;
    n--;
  }
  printf("%" PRId64, acc); /* golden 无尾换行 */
  return 0;
}