/* mut_array 的 C 对照：与 mut_array.vuna 同算法——malloc 一个 int64_t 数组，
 * 填下标值，再逐槽读出、加一写回并累加旧值。N 从 argv 读。
 */
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  if (n < 0) return 1;
  int64_t *a = malloc((size_t)n * sizeof *a);
  if (!a) return 1;
  for (int64_t i = 0; i < n; i += 1) a[i] = i;
  int64_t acc = 0;
  for (int64_t i = 0; i < n; i += 1) {
    int64_t v = a[i];
    a[i] = v + 1;
    acc += v;
  }
  printf("%" PRId64, acc);
  free(a);
  return 0;
}