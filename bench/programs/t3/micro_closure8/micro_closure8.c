/* micro_closure8 的 C 对照：与 micro_closure8.vuna 同算法（8 参捕获闭包经形参传入后
 * 饱和调用；尾递归写成 while）。
 * C 侧表示：闭包 = 函数指针 + 环境指针；8 参函数指针的调用自然把第 7~9 个整型实参
 * 压在栈上。函数指针经 volatile 局部变量读取，保证循环里保留一次真正的间接调用。
 * N 从 argv 读，避免 GCC 把常量循环折成闭式。 */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

typedef int64_t (*Fn8)(void *env, int64_t a, int64_t b, int64_t c, int64_t d,
                       int64_t e, int64_t f, int64_t g, int64_t h);

typedef struct {
  Fn8 fn;
  void *env;
} Closure;

typedef struct {
  int64_t k;
} AddEnv;

static int64_t add8_impl(void *env, int64_t a, int64_t b, int64_t c, int64_t d,
                         int64_t e, int64_t f, int64_t g, int64_t h) {
  return ((AddEnv *)env)->k + a + b + c + d + e + f + g + h;
}

static int64_t loop(Closure g, int64_t n, int64_t acc) {
  Fn8 volatile fn = g.fn;
  void *volatile env = g.env;
  while (n > 0) {
    acc += fn(env, 1, 2, 3, 4, 5, 6, 7, 8);
    n--;
  }
  return acc;
}

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  AddEnv k = {3};
  Closure g = {add8_impl, &k};
  printf("%ld\n", (long)loop(g, n, 0));
  return 0;
}
