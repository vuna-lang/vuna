/* eff_install 的 C 对照：与 eff_install.vuna 同语义；每轮单独「安装」一个 handler
 * （局部帧 + 安装计数），perform 一次 (P 1) 后由该 handler 以 v resume，然后拆掉。
 * handler 无法内联成单一表达式，所以用局部状态机表达，安装次数与派发次数都等于 N。
 * 测 MkHandle/finish 的固定成本。 */
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

static volatile int64_t p_value = 1;
static volatile int64_t handler_installs = 0;

/* once = 安装 handler，perform (P 1)，handler 以 v resume。 */
static int64_t once(void) {
  int handled = 0;         /* 本层 handler 帧的局部状态 */
  handler_installs += 1;   /* 安装一次 handler */
  int64_t v = p_value;     /* perform (P 1) 交给 handler 的值 */
  if (!handled) {          /* handler 捕获 P */
    handled = 1;
    return v;              /* continue k v */
  }
  return 0;
}

/* loop 0 = pure 0；loop (Succ m) = do x <- once; y <- loop m; pure (x + y)。 */
static int64_t loop(int64_t n) {
  int64_t acc = 0;
  while (n > 0) {
    acc += once();
    n--;
  }
  return acc;
}

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  printf("%" PRId64, loop(n)); /* golden 无尾换行 */
  return 0;
}