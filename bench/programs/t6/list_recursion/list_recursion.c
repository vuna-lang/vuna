/* 手写 C 对照：与 list_recursion.vuna 同算法（单链表上的非尾递归求和、foldl、append、
   reverse、length）。.vuna 与 .ml 都是同构的链表实现，这里同样用 malloc 的单链表，
   保留非尾递归的 sum / append，只依赖 libc。range 0 N、两次拼接与求和的顺序与 .vuna 一致。
   规模 N 从 argv[1] 读入。 */
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

/* vuna Int 是 63 位二进制补码（与 OCaml int 相同），先按 2^64 运算再符号扩展到 63 位。 */
static int64_t wrap63(uint64_t u) {
  const uint64_t mask = (UINT64_C(1) << 63) - 1;
  u &= mask;
  if (u & (UINT64_C(1) << 62)) u |= ~mask;
  return (int64_t)u;
}

typedef struct Node {
  int64_t value;
  struct Node *next;
} Node;

static Node *cons(int64_t value, Node *next) {
  Node *n = malloc(sizeof *n);
  if (!n) {
    fprintf(stderr, "out of memory\n");
    exit(1);
  }
  n->value = value;
  n->next = next;
  return n;
}

/* range 0 n = [0, 1, ..., n-1]，从高到低前插构造。 */
static Node *build_range(int64_t n) {
  Node *xs = NULL;
  for (int64_t i = n - 1; i >= 0; i--) xs = cons(i, xs);
  return xs;
}

/* 非尾递归求和。 */
static int64_t list_sum(const Node *xs) {
  if (!xs) return 0;
  return wrap63((uint64_t)xs->value + (uint64_t)list_sum(xs->next));
}

/* foldl (fun acc x -> acc + x) acc xs。 */
static int64_t foldl(const Node *xs, int64_t acc) {
  for (; xs; xs = xs->next) acc = wrap63((uint64_t)acc + (uint64_t)xs->value);
  return acc;
}

/* 非尾递归 append：拷贝 xs 的骨架后接到 ys 上。 */
static Node *append(const Node *xs, Node *ys) {
  if (!xs) return ys;
  return cons(xs->value, append(xs->next, ys));
}

static Node *reverse(const Node *xs) {
  Node *out = NULL;
  for (; xs; xs = xs->next) out = cons(xs->value, out);
  return out;
}

int main(int argc, char **argv) {
  if (argc < 2) {
    fprintf(stderr, "usage: %s N\n", argv[0]);
    return 2;
  }
  int64_t n = strtoll(argv[1], NULL, 10);
  if (n < 0) n = 0;

  Node *xs = build_range(n);
  Node *rev = reverse(xs);
  Node *doubled = append(xs, rev);

  int64_t s = list_sum(xs);
  int64_t f = foldl(doubled, 0);
  int64_t out = wrap63((uint64_t)s + (uint64_t)f + (uint64_t)n);
  printf("%" PRId64 "\n", out);
  return 0;
}