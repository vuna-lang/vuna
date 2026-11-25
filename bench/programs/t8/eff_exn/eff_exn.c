/* eff_exn 的 C 对照：与 eff_exn.vuna 同语义；C 侧把 tryWith / catchExn /
 * bracketExn 内联成等价分支：奇偶决定走正常路径还是抛出路径，release 在两条
 * 路径上都恰好执行一次。测 scoped Try 与 cleanup 的成本。 */
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

static volatile int64_t use_value = 1;
static int64_t cleanups = 0;

/* 正常路径：acquire(0) -> use -> release，返回 use 的值。 */
static int64_t ok_once(void) {
  int64_t v = use_value;
  cleanups += 1; /* release */
  return v;
}

/* 抛出路径：use 抛异常，release 仍执行，catchExn 的 fallback 返回 0。 */
static int64_t throw_once(void) {
  int64_t v = use_value;
  (void)v;
  cleanups += 1; /* release：异常路径也在 cleanup 上执行一次 */
  return 0;      /* catchExn -> pure 0 */
}

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  int64_t acc = 0;
  while (n > 0) {
    int64_t v = (n - (n / 2) * 2 == 0) ? throw_once() : ok_once();
    acc += v + 1;
    n--;
  }
  printf("%" PRId64, acc * 100000 + cleanups); /* golden 无尾换行 */
  return 0;
}