/* micro_boxed_record 的 C 对照：每轮 malloc / free 一个单字段 struct。
 * volatile 读写避免 GCC 把分配 / 释放对折掉。 */
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

typedef struct {
  int64_t h;
} Handle;

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  int64_t h = 0;
  while (n > 0) {
    volatile int64_t *p = (volatile int64_t *)malloc(sizeof(int64_t));
    if (p == NULL) return 1;
    *p = h + 1;
    h = *p;
    free((void *)p);
    n--;
  }
  printf("%" PRId64, h);
  return 0;
}