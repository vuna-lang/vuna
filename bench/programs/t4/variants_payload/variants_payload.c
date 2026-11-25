/* variants_payload 的 C 对照：带 tag 的递归表达式树（tagged union + 堆节点）。 */
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>

typedef enum { LIT, ADD, MUL, MAX, MIN } Kind;

typedef struct Expr {
  Kind k;
  int64_t v;
  struct Expr *a;
  struct Expr *b;
} Expr;

static Expr *mk(Kind k, int64_t v, Expr *a, Expr *b) {
  Expr *e = (Expr *)malloc(sizeof(Expr));
  if (e == NULL) exit(1);
  e->k = k;
  e->v = v;
  e->a = a;
  e->b = b;
  return e;
}

static int64_t bound(int64_t x) { return x - (x / 1000003 * 1000003); }

static Expr *build(int64_t d, int64_t seed) {
  if (d <= 0) return mk(LIT, bound(seed), NULL, NULL);
  Expr *left = build(d - 1, seed * 2 + 1);
  Expr *rhs = build(d - 1, seed * 3 + 1);
  Expr *mul = mk(MUL, 0, rhs, mk(LIT, seed + 7, NULL, NULL));
  Expr *scaled = mk(MAX, 0, mul, mk(MIN, 0, mk(LIT, seed, NULL, NULL),
                                         mk(LIT, 7, NULL, NULL)));
  return mk(ADD, 0, left, scaled);
}

static int64_t eval(Expr *e) {
  switch (e->k) {
    case LIT: return e->v;
    case ADD: return bound(eval(e->a) + eval(e->b));
    case MUL: return bound(bound(eval(e->a)) * bound(eval(e->b)));
    case MAX: return eval(e->a) > eval(e->b) ? eval(e->a) : eval(e->b);
    case MIN: return eval(e->a) < eval(e->b) ? eval(e->a) : eval(e->b);
  }
  return 0;
}

static void drop(Expr *e) {
  if (e == NULL) return;
  drop(e->a);
  drop(e->b);
  free(e);
}

int main(int argc, char **argv) {
  int64_t depth = argc > 1 ? strtoll(argv[1], NULL, 10) : 0;
  Expr *root = build(depth, 1);
  printf("%" PRId64, eval(root));
  drop(root);
  return 0;
}