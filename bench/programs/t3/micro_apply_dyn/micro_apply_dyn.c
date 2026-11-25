/* micro_apply_dyn 的 C 对照：与 micro_apply_dyn.vuna 同算法（运行期选闭包后饱和调用）。
 * C 侧表示：闭包 = 函数指针 + 环境指针；两个无环境函数按奇偶选一个。函数指针经
 * volatile 局部变量读取，保证循环里保留一次真正的间接调用。
 * N 从 argv 读，避免 GCC 把常量循环折成闭式。 */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

typedef int64_t (*Fn)(void *env, int64_t x);

typedef struct {
  Fn fn;
  void *env;
} Closure;

static int64_t inc_impl(void *env, int64_t x) {
  (void)env;
  return x + 1;
}

static int64_t add2_impl(void *env, int64_t x) {
  (void)env;
  return x + 2;
}

static int64_t loop(int64_t n, int64_t acc) {
  while (n > 0) {
    int64_t p = n - (n / 2) * 2;
    Closure g = (p == 0) ? (Closure){inc_impl, NULL} : (Closure){add2_impl, NULL};
    Fn volatile fn = g.fn;
    void *volatile env = g.env;
    acc += fn(env, p);
    n--;
  }
  return acc;
}

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  printf("%ld\n", (long)loop(n, 0));
  return 0;
}
