/* micro_capture 的 C 对照：与 micro_capture.vuna 同算法（每轮构造捕获 k 的闭包后
 * 饱和调用；尾递归写成 while）。
 * C 侧表示：闭包 = 函数指针 + 环境指针；maker 每轮把捕获的 k 放栈上，环境生命周期
 * 到调用结束。函数指针经 volatile 局部变量读取，保证循环里保留一次真正的间接调用。
 * N 从 argv 读，避免 GCC 把常量循环折成闭式。 */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

typedef int64_t (*Fn)(void *env, int64_t x);

typedef struct {
  Fn fn;
  void *env;
} Closure;

typedef struct {
  int64_t k;
} AddEnv;

static int64_t add_impl(void *env, int64_t x) { return x + ((AddEnv *)env)->k; }

static int64_t apply1(Closure g, int64_t x) {
  Fn volatile fn = g.fn;
  void *volatile env = g.env;
  return fn(env, x);
}

static int64_t loop(int64_t n, int64_t acc) {
  while (n > 0) {
    AddEnv k = {n - (n / 1000) * 1000};
    Closure g = {add_impl, &k};
    acc = apply1(g, acc);
    n--;
  }
  return acc;
}

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  printf("%ld\n", (long)loop(n, 0));
  return 0;
}
