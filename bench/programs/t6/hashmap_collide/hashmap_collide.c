/* 手写 C 对照：与 hashmap_collide.vuna 同算法（所有键哈希相同 → 单桶链表）。
   .vuna 用 Base.Container.HashMap 但键的 Hashable 恒为常量，每次操作都退化成整条桶链的
   线性扫描；.ml 用单桶 assoc list。这里同样用一条 malloc 链表（插入前先扫重复键、命中原位
   覆盖，删除摘链），键就是 record 的 id 字段。
   插入键 1..N（值 = 键）、查找全部、删除偶数键（N/2 个）、最终 size 与 .vuna 逐位一致。
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

static void *xmalloc(size_t n) {
  void *p = malloc(n);
  if (!p) {
    fprintf(stderr, "out of memory\n");
    exit(1);
  }
  return p;
}

typedef struct Node {
  int64_t key;
  int64_t val;
  struct Node *next;
} Node;

/* 单桶插入：先扫重复键（命中即原位覆盖），否则前插。 */
static Node *bucket_insert(Node *xs, int64_t key, int64_t val) {
  for (Node *n = xs; n; n = n->next) {
    if (n->key == key) {
      n->val = val;
      return xs;
    }
  }
  Node *n = xmalloc(sizeof *n);
  n->key = key;
  n->val = val;
  n->next = xs;
  return n;
}

static int bucket_lookup(const Node *xs, int64_t key, int64_t *out) {
  for (; xs; xs = xs->next) {
    if (xs->key == key) {
      *out = xs->val;
      return 1;
    }
  }
  return 0;
}

static Node *bucket_remove(Node *xs, int64_t key) {
  Node **p = &xs;
  while (*p) {
    if ((*p)->key == key) {
      Node *dead = *p;
      *p = dead->next;
      free(dead);
      return xs;
    }
    p = &(*p)->next;
  }
  return xs;
}

static int64_t bucket_size(const Node *xs) {
  int64_t n = 0;
  for (; xs; xs = xs->next) n += 1;
  return n;
}

int main(int argc, char **argv) {
  if (argc < 2) {
    fprintf(stderr, "usage: %s N\n", argv[0]);
    return 2;
  }
  int64_t n = strtoll(argv[1], NULL, 10);
  if (n < 0) n = 0;

  Node *t = NULL;
  for (int64_t k = n; k > 0; k--) t = bucket_insert(t, k, k);

  int64_t acc = 0;
  for (int64_t k = n; k > 0; k--) {
    int64_t v;
    if (bucket_lookup(t, k, &v)) acc = wrap63((uint64_t)acc * 31u + (uint64_t)v);
  }

  for (int64_t k = n / 2; k > 0; k--) t = bucket_remove(t, k * 2);

  printf("%" PRId64 "\n", wrap63((uint64_t)acc + (uint64_t)bucket_size(t)));
  while (t) {
    Node *next = t->next;
    free(t);
    t = next;
  }
  return 0;
}