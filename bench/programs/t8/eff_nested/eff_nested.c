/* eff_nested 的 C 对照：与 eff_nested.vuna 同语义；C 侧把每层 P handler 内联成
 * 直接调用，但先安装本层 handler 再执行内层，内层返回后才在本层 perform 一次，
 * handler 以 x+1 resume。handler 安装次数与派发次数都等于层数，顺序一致。
 * 测 N 层 handler 嵌套时的帧链与回退成本。 */
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

/* 每次派发真实读一次 resume 增量，避免编译器把 layer(n) 折成闭式 n。 */
static volatile int64_t p_delta = 1;
static volatile int64_t handler_installs = 0;

/* handle { P x k -> k (x + 1) }。 */
static int64_t p_handler(int64_t x) { return x + p_delta; }

/* layer 0 = pure 0；
 * layer (Succ m) = 安装本层 handler，执行 layer m，再在层内 perform (P x)。 */
static int64_t layer(int64_t n) {
  if (n == 0) return 0;
  handler_installs += 1; /* 安装本层 handler，内层在该帧之下运行 */
  int64_t x = layer(n - 1);
  return p_handler(x); /* perform (P x)，本层 handler 以 x+1 resume */
}

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  printf("%" PRId64, layer(n)); /* golden 无尾换行 */
  return 0;
}