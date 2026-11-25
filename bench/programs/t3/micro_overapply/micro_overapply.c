/* micro_overapply 的 C 对照：与 micro_overapply.vuna 同算法（每轮一次过度应用）。
 * C 没有过度应用的概念，最省的惯用写法是把柯里化闭包摊成「环境 k + 两个实参」的
 * 饱和调用，不分配中间的返回闭包。函数指针与环境指针经 volatile 局部变量读取，
 * 保证循环里保留一次真正的间接调用（否则 -O2 会把每轮的 3 * (n mod 1000) 折成闭式）。
 * N 从 argv 读，避免 GCC 把常量循环折成闭式。 */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

typedef int64_t (*Fn2)(void *env, int64_t x, int64_t y);

static int64_t add_impl(void *env, int64_t x, int64_t y) {
  int64_t k = *(const int64_t *)env;
  return k + x + y;
}

static int64_t loop(int64_t n, int64_t acc) {
  Fn2 volatile fn = add_impl;
  void *volatile env = NULL;
  while (n > 0) {
    int64_t k = n - (n / 1000) * 1000;
    env = &k;
    acc += fn(env, k, k);
    n--;
  }
  return acc;
}

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  printf("%ld\n", (long)loop(n, 0));
  return 0;
}
