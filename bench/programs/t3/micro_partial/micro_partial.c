/* micro_partial 的 C 对照：与 micro_partial.vuna 同算法（每轮做一次部分应用再饱和调用）。
 * C 侧表示：闭包 = 函数指针 + 环境指针；部分应用写成栈上 shim，环境指向栈上的首参。
 * 函数指针经 volatile 局部变量读取，保证循环里保留一次真正的间接调用（否则 -O2 会把
 * a + acc 折进外层循环）。N 从 argv 读，避免 GCC 把常量循环折成闭式。 */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

typedef int64_t (*Fn)(void *env, int64_t x);

typedef struct {
  Fn fn;
  void *env;
} Closure;

static int64_t add_impl(void *env, int64_t x) {
  return *(int64_t *)env + x;
}

static int64_t loop(int64_t n, int64_t acc) {
  while (n > 0) {
    int64_t a = n - (n / 1000) * 1000;
    Closure part = {add_impl, &a};
    Fn volatile fn = part.fn;
    void *volatile env = part.env;
    acc = fn(env, acc);
    n--;
  }
  return acc;
}

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  printf("%ld\n", (long)loop(n, 0));
  return 0;
}
