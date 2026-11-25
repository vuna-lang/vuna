/* eff_payload 的 C 对照：与 eff_payload.vuna 同语义；payload 是三字段 struct，
 * handler 投影 lo/hi/step 后把组合值 resume 回去。
 * 测带多字段 payload 的 perform/resume 成本。 */
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

struct span {
  int64_t lo;
  int64_t hi;
  int64_t step;
};

static volatile struct span payload = {1, 2, 3};

/* handler：投影三字段后 resume。 */
static int64_t handle_span(void) {
  struct span p = payload;
  return p.lo * 100 + p.hi * 10 + p.step;
}

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  int64_t acc = 0;
  while (n > 0) {
    int64_t v = handle_span(); /* perform (AskSpan payload) + resume */
    acc += v;
    n--;
  }
  printf("%" PRId64, acc); /* golden 无尾换行 */
  return 0;
}