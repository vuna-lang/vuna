/* micro_args8 的 C 对照：与 micro_args8.vuna 同算法（每轮一次 8 参非尾直调）。
 * 普通 8 参函数，C ABI 让第 7、8 个实参走栈。两处写法用于保住「同形状的直调」：
 *   * `noinline`：否则 -O2 会把这么小的函数体折进循环；
 *   * 第 2~8 个实参先经 volatile 全局读到局部：否则 GCC 会做常量传播，生成只收 1 个
 *     实参的 mix8.constprop 克隆，第 7、8 个实参就不再走栈。
 * 循环计数经 volatile 局部变量读取，保证 -O2 不能把累加折成闭式。N 从 argv 读。 */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

static volatile int64_t g_small[7] = {1, 2, 3, 4, 5, 6, 7};

static __attribute__((noinline)) int64_t mix8(int64_t a, int64_t b, int64_t c,
                                              int64_t d, int64_t e, int64_t f,
                                              int64_t g, int64_t h) {
  return (a * 1) + (b * 2) + (c * 3) + (d * 4) + (e * 5) + (f * 6) + (g * 7) +
         (h * 8);
}

static int64_t loop(int64_t n, int64_t acc) {
  int64_t b = g_small[0];
  int64_t c = g_small[1];
  int64_t d = g_small[2];
  int64_t e = g_small[3];
  int64_t f = g_small[4];
  int64_t g = g_small[5];
  int64_t h = g_small[6];
  while (n > 0) {
    volatile int64_t k = n;
    acc += mix8(k, b, c, d, e, f, g, h);
    n--;
  }
  return acc;
}

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  printf("%ld\n", (long)loop(n, 0));
  return 0;
}
