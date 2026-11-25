/* micro_vec 的 C 对照：固定 8 元素 int64 数组。 */
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

static int64_t read_all(const int64_t *a) {
  int64_t acc = 0;
  for (int i = 0; i < 8; i++) acc += a[i];
  return acc;
}

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  int64_t v[8] = {1, 2, 3, 4, 5, 6, 7, 8};
  int64_t acc = 0;
  while (n > 0) {
    acc += read_all(v);
    n--;
  }
  printf("%" PRId64, acc);
  return 0;
}