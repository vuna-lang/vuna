/* 手写 C 对照：与 hashset.vuna 同算法（Int 键的集合：插入 / 删除 / 成员判定 / size）。
   .vuna 用 Base.Container.HashSet（1024 桶持久表），.ml 用标准库 Hashtbl（手写上限）；
   按 .ml 的口径这里用链地址哈希（每个键一个节点），只依赖 libc。
   键序列 scramble(k) = k*7919 - k*7919/100003*100003、删除 scramble(2k)、命中累加
   acc*31+k 与最终 size 都与 .vuna 逐位一致。
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

enum { BUCKETS = 4096 };

typedef struct Node {
  int64_t key;
  struct Node *next;
} Node;

static Node *buckets[BUCKETS];
static int64_t used;

static size_t bucket_of(int64_t key) {
  uint64_t x = (uint64_t)key;
  x ^= x >> 30;
  x *= UINT64_C(0xbf58476d1ce4e5b9);
  x ^= x >> 27;
  x *= UINT64_C(0x94d049bb133111eb);
  x ^= x >> 31;
  return (size_t)x & (BUCKETS - 1);
}

static int set_member(int64_t key) {
  for (const Node *n = buckets[bucket_of(key)]; n; n = n->next)
    if (n->key == key) return 1;
  return 0;
}

static void set_insert(int64_t key) {
  if (set_member(key)) return;
  size_t b = bucket_of(key);
  Node *n = xmalloc(sizeof *n);
  n->key = key;
  n->next = buckets[b];
  buckets[b] = n;
  used += 1;
}

static void set_remove(int64_t key) {
  Node **p = &buckets[bucket_of(key)];
  while (*p) {
    if ((*p)->key == key) {
      Node *dead = *p;
      *p = dead->next;
      free(dead);
      used -= 1;
      return;
    }
    p = &(*p)->next;
  }
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

  for (int64_t k = n; k > 0; k--) set_insert(scramble(k));
  for (int64_t k = n; k > 0; k--) set_remove(scramble(k * 2));

  int64_t acc = 0;
  for (int64_t k = n; k > 0; k--) {
    if (set_member(scramble(k)))
      acc = wrap63((uint64_t)acc * 31u + (uint64_t)k);
  }

  printf("%" PRId64 "\n", wrap63((uint64_t)acc + (uint64_t)used));
  return 0;
}