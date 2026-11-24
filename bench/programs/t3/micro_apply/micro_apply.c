/* micro_apply 的 C 对照：与 micro_apply.vuna 同算法（函数作为值传入循环，每次迭代
 * 一次直接应用；尾递归写成 while）。
 * C 侧表示：闭包 = 函数指针 + 环境指针；f 无环境，用空环境占位。函数指针经 volatile
 * 局部变量读取，保证循环里保留一次真正的间接调用（否则 -O2 会把 acc + 1 折成 acc = n）。
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

static int64_t loop(Closure g, int64_t n, int64_t acc) {
  Fn volatile fn = g.fn;
  void *volatile env = g.env;
  while (n > 0) {
    acc = fn(env, acc);
    n--;
  }
  return acc;
}

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  Closure f = {inc_impl, NULL};
  printf("%ld\n", (long)loop(f, n, 0));
  return 0;
}