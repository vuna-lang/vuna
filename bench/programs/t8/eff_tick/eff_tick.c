/* eff_tick 的 C 对照：与 eff_tick.vuna 同语义；C 侧把 Tick handler 内联成直接
 * 调用（handler 只把收到的 n 作为 resume 值交回），perform 与 resume 的顺序、次数
 * 一致。测浅续延下一次 handler 派发的成本。
 *
 * handler 交回的值每次派发都真实读一次，避免编译器把整段派发循环折成闭式。 */
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

static volatile int64_t tick_value = 1;

/* handle { Tick n k -> k n }：把 n 原样 resume 回去。 */
static int64_t tick_handler(void) { return tick_value; }

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  int64_t acc = 0;
  while (n > 0) {
    int64_t x = tick_handler(); /* perform (Tick 1) */
    acc += x;
    n--;
  }
  printf("%" PRId64, acc); /* golden 无尾换行 */
  return 0;
}