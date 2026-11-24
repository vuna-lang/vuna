/* 手写 C 对照：与 treemap.vuna 同算法（有序映射：插入 / 查找 / 升序遍历）。
   .vuna 用 Base.Container.TreeMap（AVL），.ml 用标准库 Map（同为平衡树）；按 .ml 的口径
   这里手写 AVL 树，只依赖 libc。键序列 scramble(k)、值 k、查找累加、升序折叠与 size
   都与 .vuna 逐位一致。伪随机键 scramble(i) = i*7919 - (i*7919)/100003*100003。
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
  int64_t key;
  int64_t val;
  int height;
  struct Node *left;
  struct Node *right;
} Node;

static int height(const Node *n) { return n ? n->height : 0; }
static int max_int(int a, int b) { return a > b ? a : b; }
static void update(Node *n) { n->height = 1 + max_int(height(n->left), height(n->right)); }
static int balance(const Node *n) { return height(n->left) - height(n->right); }

static Node *rotate_right(Node *y) {
  Node *x = y->left;
  y->left = x->right;
  x->right = y;
  update(y);
  update(x);
  return x;
}

static Node *rotate_left(Node *x) {
  Node *y = x->right;
  x->right = y->left;
  y->left = x;
  update(x);
  update(y);
  return y;
}

static Node *new_node(int64_t key, int64_t val) {
  Node *n = malloc(sizeof *n);
  if (!n) {
    fprintf(stderr, "out of memory\n");
    exit(1);
  }
  n->key = key;
  n->val = val;
  n->height = 1;
  n->left = NULL;
  n->right = NULL;
  return n;
}

static Node *insert(Node *n, int64_t key, int64_t val, int *added) {
  if (!n) {
    *added = 1;
    return new_node(key, val);
  }
  if (key < n->key) {
    n->left = insert(n->left, key, val, added);
  } else if (key > n->key) {
    n->right = insert(n->right, key, val, added);
  } else {
    n->val = val;
    return n;
  }

  update(n);
  int b = balance(n);
  if (b > 1 && key < n->left->key) return rotate_right(n);
  if (b < -1 && key > n->right->key) return rotate_left(n);
  if (b > 1 && key > n->left->key) {
    n->left = rotate_left(n->left);
    return rotate_right(n);
  }
  if (b < -1 && key < n->right->key) {
    n->right = rotate_right(n->right);
    return rotate_left(n);
  }
  return n;
}

static int lookup(const Node *n, int64_t key, int64_t *out) {
  while (n) {
    if (key < n->key)
      n = n->left;
    else if (key > n->key)
      n = n->right;
    else {
      *out = n->val;
      return 1;
    }
  }
  return 0;
}

/* 升序（中序）折叠：acc = acc*31 + key。 */
static int64_t asc_fold(const Node *n, int64_t acc) {
  if (!n) return acc;
  acc = asc_fold(n->left, acc);
  acc = wrap63((uint64_t)acc * 31u + (uint64_t)n->key);
  return asc_fold(n->right, acc);
}

static void free_tree(Node *n) {
  if (!n) return;
  free_tree(n->left);
  free_tree(n->right);
  free(n);
}

static int64_t scramble(int64_t i) {
  int64_t x = i * 7919;
  return x - x / 100003 * 100003;
}

int main(int argc, char **argv) {
  if (argc < 2) {
    fprintf(stderr, "usage: %s N\n", argv[0]);
    return 2;
  }
  int64_t n = strtoll(argv[1], NULL, 10);
  if (n < 0) n = 0;

  Node *root = NULL;
  int64_t size = 0;
  for (int64_t k = n; k > 0; k--) {
    int added = 0;
    root = insert(root, scramble(k), k, &added);
    size += added;
  }

  int64_t acc = 0;
  for (int64_t k = n; k > 0; k--) {
    int64_t v;
    if (lookup(root, scramble(k), &v))
      acc = wrap63((uint64_t)acc * 31u + (uint64_t)v);
  }

  int64_t asc = asc_fold(root, 0);
  int64_t out = wrap63((uint64_t)acc + (uint64_t)asc + (uint64_t)size);
  printf("%" PRId64 "\n", out);

  free_tree(root);
  return 0;
}