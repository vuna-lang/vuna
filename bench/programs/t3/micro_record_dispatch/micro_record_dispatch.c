/* micro_record_dispatch 的 C 对照：与 micro_record_dispatch.vuna 同算法
 * （闭包存在 record 字段里，每轮一次字段投影 + 一次间接饱和调用）。
 * C 侧表示：闭包 = 函数指针 + 环境指针，Step 只含一个 Closure 字段；每轮通过
 * s.run.fn(s.run.env, acc) 调用，fn/env 先读到 volatile 局部变量，保证 -O2 保住
 * 这次间接调用。N 从 argv 读。 */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

typedef int64_t (*Fn)(void *env, int64_t x);

typedef struct {
  Fn fn;
  void *env;
} Closure;

typedef struct {
  Closure run;
} Step;

static int64_t add_impl(void *env, int64_t x) {
  int64_t k = *(const int64_t *)env;
  return x + k;
}

static Step mk_step(int64_t *k) {
  Step s = {{add_impl, k}};
  return s;
}

static int64_t loop(Step s, int64_t n, int64_t acc) {
  while (n > 0) {
    Fn volatile fn = s.run.fn;
    void *volatile env = s.run.env;
    acc = fn(env, acc);
    n--;
  }
  return acc;
}

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  int64_t k = 3;
  Step s = mk_step(&k);
  printf("%ld\n", (long)loop(s, n, 0));
  return 0;
}
