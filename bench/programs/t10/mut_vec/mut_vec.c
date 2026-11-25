/* mut_vec 的 C 对照：与 mut_vec.vuna 同算法——int64_t 数组填下标值，第一遍读出
 * 加十写回并累加旧值，第二遍读出写回后的值。N 从 argv 读。
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
  int64_t sum1 = 0;
  for (int64_t i = 0; i < n; i += 1) {
    int64_t x = a[i];
    a[i] = x + 10;
    sum1 += x;
  }
  int64_t sum2 = 0;
  for (int64_t i = 0; i < n; i += 1) sum2 += a[i];
  printf("%" PRId64, sum1 + sum2);
  free(a);
  return 0;
}