/* 手写 C 对照：与 map_assoc.vuna 同算法（assoc 表：线性查找、覆盖保留原位置、删除保序）。
   .vuna 的 Base.Container.Map 内部就是 List (Pair k v)，.ml 是 assoc list；这里用连续的
   (key, val) 数组模拟同一串 pair：插入扫到末尾（重复键原位覆盖），删除按位移动。
   键序列 scramble(k)、查找累加 acc*31+v、删除偶数键（N/2 个）与最终 size 都与 .vuna 一致。
   伪随机键 scramble(i) = i*7919 - i*7919/100003*100003。规模 N 从 argv[1] 读入。 */
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

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

typedef struct {
  int64_t key;
  int64_t val;
} Pair;

typedef struct {
  Pair *pairs;
  size_t len;
  size_t cap;
} Assoc;

static void assoc_insert(Assoc *m, int64_t key, int64_t val) {
  for (size_t i = 0; i < m->len; i += 1) {
    if (m->pairs[i].key == key) {
      m->pairs[i].val = val;
      return;
    }
  }
  m->pairs[m->len].key = key;
  m->pairs[m->len].val = val;
  m->len += 1;
}

static int assoc_lookup(const Assoc *m, int64_t key, int64_t *out) {
  for (size_t i = 0; i < m->len; i += 1) {
    if (m->pairs[i].key == key) {
      *out = m->pairs[i].val;
      return 1;
    }
  }
  return 0;
}

static void assoc_remove(Assoc *m, int64_t key) {
  for (size_t i = 0; i < m->len; i += 1) {
    if (m->pairs[i].key == key) {
      memmove(&m->pairs[i], &m->pairs[i + 1],
              (m->len - i - 1) * sizeof m->pairs[0]);
      m->len -= 1;
      return;
    }
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

  Assoc m;
  m.len = 0;
  m.cap = (size_t)n + 1;
  m.pairs = xmalloc(m.cap * sizeof m.pairs[0]);

  for (int64_t k = n; k > 0; k--) assoc_insert(&m, scramble(k), k);

  int64_t acc = 0;
  for (int64_t k = n; k > 0; k--) {
    int64_t v;
    if (assoc_lookup(&m, scramble(k), &v))
      acc = wrap63((uint64_t)acc * 31u + (uint64_t)v);
  }

  for (int64_t k = n / 2; k > 0; k--) assoc_remove(&m, scramble(k * 2));

  printf("%" PRId64 "\n", wrap63((uint64_t)acc + (uint64_t)m.len));
  free(m.pairs);
  return 0;
}