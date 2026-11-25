/* micro_alias_record 的 C 对照：alias / 自动去装箱 record 都是裸 int64。 */
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

typedef int64_t user_id;
typedef int64_t wrap;

static int64_t apply_sel(int64_t (*f)(int64_t), int64_t u) { return f(u); }
static int64_t uid(int64_t u) { return u; }

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  int64_t u = 0;
  int64_t w = 0;
  while (n > 0) {
    u = u + 1;
    w = w + 2;
    n--;
  }
  printf("%" PRId64, apply_sel(uid, u) + w);
  return 0;
}