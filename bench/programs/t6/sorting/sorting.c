/* 手写 C 对照：与 sorting.vuna / sorting.ml 同算法（链表归并排序：split 拆半 + merge 合并，
   再用非尾递归 sum 求和）。split 在奇数长度时把末尾元素留在左半，merge 用 x <= y 取左，
   都与 .vuna 一致。只依赖 libc。规模 N 从 argv[1] 读入，fuel 取 N（覆盖 log 层递归）。
   输入 desc 0 N = [0, 1, ..., N-1]。 */
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

static Node *build_desc(int64_t n) {
  Node *xs = NULL;
  for (int64_t i = n - 1; i >= 0; i--) xs = cons(i, xs);
  return xs;
}

/* split 把 xs 交替分到左右两半（各自逆序累积，与 .vuna 的 split 一致）。 */
static void split(Node *left, Node *right, Node *xs, Node **out_left, Node **out_right) {
  while (xs) {
    Node *x = xs;
    xs = xs->next;
    if (!xs) {
      *out_left = cons(x->value, left);
      *out_right = right;
      return;
    }
    Node *y = xs;
    xs = xs->next;
    left = cons(x->value, left);
    right = cons(y->value, right);
  }
  *out_left = left;
  *out_right = right;
}

static Node *merge(Node *a, Node *b) {
  if (!a) return b;
  if (!b) return a;
  if (a->value <= b->value) return cons(a->value, merge(a->next, b));
  return cons(b->value, merge(a, b->next));
}

static Node *msort(int64_t fuel, Node *xs) {
  if (fuel <= 0) return xs;
  if (!xs || !xs->next) return xs;
  Node *left;
  Node *right;
  split(NULL, NULL, xs, &left, &right);
  return merge(msort(fuel - 1, left), msort(fuel - 1, right));
}

static int64_t list_sum(const Node *xs) {
  if (!xs) return 0;
  return wrap63((uint64_t)xs->value + (uint64_t)list_sum(xs->next));
}

int main(int argc, char **argv) {
  if (argc < 2) {
    fprintf(stderr, "usage: %s N\n", argv[0]);
    return 2;
  }
  int64_t n = strtoll(argv[1], NULL, 10);
  if (n < 0) n = 0;

  Node *xs = msort(n, build_desc(n));
  int64_t out = list_sum(xs);
  printf("%" PRId64 "\n", out);
  return 0;
}