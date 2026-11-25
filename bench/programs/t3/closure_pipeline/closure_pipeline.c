/* closure_pipeline 的 C 对照：与 closure_pipeline.vuna 同算法（闭包表逐轮 fold）。
 * C 侧表示：闭包 = 函数指针 + 环境指针；ops 是 4 个闭包的表，环境用栈上结构体，
 * 每轮按顺序 fold 应用。函数指针与环境指针经 volatile 局部变量读取，保证 -O2 不会
 * 把间接调用折成直调（否则整轮可折成闭式）。
 * N 从 argv 读，避免 GCC 把常量循环折成闭式。 */
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

typedef int64_t (*Fn)(void *env, int64_t x);

typedef struct {
  Fn fn;
  void *env;
} Closure;

/* 部分应用：环境里放已绑定的第一个参数。 */
static int64_t plus_impl(void *env, int64_t x) {
  int64_t a = *(const int64_t *)env;
  return a + x;
}

static int64_t mul_impl(void *env, int64_t x) {
  int64_t a = *(const int64_t *)env;
  return a * x;
}

static int64_t wrap_impl(void *env, int64_t x) {
  (void)env;
  return x - (x / 1000 * 1000);
}

/* 一轮：按表顺序 fold，每个 op 经 volatile 读到函数指针后动态应用。 */
static int64_t step(const Closure *ops, int nops, int64_t acc) {
  for (int i = 0; i < nops; i++) {
    Fn volatile fn = ops[i].fn;
    void *volatile env = ops[i].env;
    acc = fn(env, acc);
  }
  return acc;
}

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  int64_t env_plus1 = 1;
  int64_t env_mul2 = 2;
  int64_t env_plus3 = 3;
  const Closure ops[4] = {
      {plus_impl, &env_plus1},
      {mul_impl, &env_mul2},
      {wrap_impl, NULL},
      {plus_impl, &env_plus3},
  };
  int64_t acc = 0;
  while (n > 0) {
    acc = step(ops, 4, acc);
    n--;
  }
  printf("%ld\n", (long)acc);
  return 0;
}
