/* mut_dyn 的 C 对照：与 mut_dyn.vuna 同算法——realloc 按倍数扩容，push N 个值，
 * 再逐项读出、加一写回并累加新值，最后把长度清零。N 从 argv 读。
 */
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  if (n < 0) return 1;
  int64_t cap = 0;
  int64_t len = 0;
  int64_t *buf = NULL;
  for (int64_t i = 0; i < n; i += 1) {
    if (len == cap) {
      cap = cap == 0 ? 8 : cap * 2;
      int64_t *grown = realloc(buf, (size_t)cap * sizeof *buf);
      if (!grown) {
        free(buf);
        return 1;
      }
      buf = grown;
    }
    buf[len] = i;
    len += 1;
  }
  int64_t sum = 0;
  for (int64_t i = 0; i < n; i += 1) {
    int64_t v = buf[i];
    buf[i] = v + 1;
    sum += v + 1;
  }
  int64_t n1 = len;
  len = 0;
  int64_t m = len;
  printf("%" PRId64, sum + n1 + m);
  free(buf);
  return 0;
}