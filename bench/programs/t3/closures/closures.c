/* closures 的 C 对照：与 closures.vuna 同算法（twice 高阶传参、每次迭代新建闭包、
 * foldl 累积 lambda）。
 * C 侧表示：闭包 = 函数指针 + 环境指针（Closure 结构体）；dbl 无环境，`+ 3` 的 lambda
 * 把常量放进栈上的 AddEnv，pipeline 每次调用都重新构造这两个闭包。
 * 规模 N 从 argv 读（等价 range 0 N），避免 GCC 把常量循环折成闭式。 */
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

static int64_t twice(Closure f, int64_t x) { return f.fn(f.env, f.fn(f.env, x)); }

static int64_t dbl_impl(void *env, int64_t x) {
  (void)env;
  return x * 2;
}

static int64_t add_impl(void *env, int64_t x) { return x + ((AddEnv *)env)->k; }

static int64_t pipeline(int64_t x) {
  AddEnv add3 = {3};
  Closure add = {add_impl, &add3};
  Closure dbl = {dbl_impl, NULL};
  return twice(add, twice(dbl, x));
}

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  int64_t acc = 0;
  for (int64_t i = 0; i < n; i++) acc += pipeline(i);
  printf("%ld\n", (long)acc);
  return 0;
}