/* micro_variant_wide 的 C 对照：16 个枚举值的 next / code。 */
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

typedef enum { T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12, T13, T14, T15 } Tag;

static Tag next(Tag t) { return (Tag)((t + 1) % 16); }

static int64_t code(Tag t) {
  switch (t) {
    case T0: return 0;
    case T1: return 1;
    case T2: return 2;
    case T3: return 3;
    case T4: return 4;
    case T5: return 5;
    case T6: return 6;
    case T7: return 7;
    case T8: return 8;
    case T9: return 9;
    case T10: return 10;
    case T11: return 11;
    case T12: return 12;
    case T13: return 13;
    case T14: return 14;
    case T15: return 15;
  }
  return 0;
}

int main(int argc, char **argv) {
  int64_t n = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  int64_t acc = 0;
  Tag t = T0;
  while (n > 0) {
    acc += code(t);
    t = next(t);
    n--;
  }
  printf("%" PRId64, acc);
  return 0;
}