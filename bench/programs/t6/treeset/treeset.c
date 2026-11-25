/* 手写 C 对照：与 treeset.vuna 同算法（Int 键的有序集合：插入 / 成员判定 / 删除 / 升序遍历）。
   .vuna 用 Base.Container.TreeSet（AVL），.ml 用标准库 Set（同为平衡树）；按 .ml 的口径这里用
   有序数组 + 二分查找（插入 / 删除按位移动），只依赖 libc。键序列 scramble(k)、命中累加
   acc*31+k、删除 scramble(2k)、升序折叠与 size 都与 .vuna 逐位一致。
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
  int64_t *keys; /* 升序，前 len 个有效 */
  size_t len;
  size_t cap;
} SortedSet;

/* 二分查找：命中返回下标，未命中返回应插入位置（~pos）。 */
static size_t set_find(const SortedSet *s, int64_t key, int *found) {
  size_t lo = 0;
  size_t hi = s->len;
  while (lo < hi) {
    size_t mid = lo + (hi - lo) / 2;
    if (s->keys[mid] < key) {
      lo = mid + 1;
    } else {
      hi = mid;
    }
  }
  *found = lo < s->len && s->keys[lo] == key;
  return lo;
}

static void set_insert(SortedSet *s, int64_t key) {
  int found = 0;
  size_t at = set_find(s, key, &found);
  if (found) return;
  memmove(&s->keys[at + 1], &s->keys[at], (s->len - at) * sizeof s->keys[0]);
  s->keys[at] = key;
  s->len += 1;
}

static int set_member(const SortedSet *s, int64_t key) {
  int found = 0;
  (void)set_find(s, key, &found);
  return found;
}

static void set_remove(SortedSet *s, int64_t key) {
  int found = 0;
  size_t at = set_find(s, key, &found);
  if (!found) return;
  memmove(&s->keys[at], &s->keys[at + 1], (s->len - at - 1) * sizeof s->keys[0]);
  s->len -= 1;
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

  SortedSet s;
  s.len = 0;
  s.cap = (size_t)n + 1;
  s.keys = xmalloc(s.cap * sizeof s.keys[0]);

  for (int64_t k = n; k > 0; k--) set_insert(&s, scramble(k));

  for (int64_t k = n; k > 0; k--) set_remove(&s, scramble(k * 2));

  int64_t acc = 0;
  for (int64_t k = n; k > 0; k--) {
    if (set_member(&s, scramble(k)))
      acc = wrap63((uint64_t)acc * 31u + (uint64_t)k);
  }

  int64_t asc = 0;
  for (size_t i = 0; i < s.len; i++)
    asc = wrap63((uint64_t)asc * 31u + (uint64_t)s.keys[i]);

  printf("%" PRId64 "\n",
         wrap63((uint64_t)acc + (uint64_t)asc + (uint64_t)s.len));
  free(s.keys);
  return 0;
}