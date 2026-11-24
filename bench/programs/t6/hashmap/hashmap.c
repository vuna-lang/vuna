/* 手写 C 对照：与 hashmap.vuna 同语义（字符串键 -> Int 值的哈希表）。
   .vuna 用 Base.Container.HashMap（1024 桶持久表），.ml 用标准库 Hashtbl 作为手写上限；
   按 .ml 的口径，这里用开放寻址（线性探测 + 2 倍扩容）的字符串键哈希表，只依赖 libc。
   键序列 "0".."N-1"、插入值 i*3、求和与 size 的口径都与 .vuna 一致。
   规模 N 从 argv[1] 读入。 */
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* vuna Int 是 63 位二进制补码（与 OCaml int 相同），不是 64 位；
   先按 2^64 做无符号运算，再符号扩展到 63 位。 */
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

static char *xstrdup(const char *s) {
  size_t n = strlen(s) + 1;
  char *p = xmalloc(n);
  memcpy(p, s, n);
  return p;
}

typedef struct {
  char *key; /* NULL 表示空槽 */
  int64_t val;
} Slot;

typedef struct {
  Slot *slots;
  size_t cap; /* 2 的幂 */
  size_t len;
} Map;

static size_t hash_str(const char *s) {
  uint64_t h = UINT64_C(1469598103934665603);
  for (; *s; s++) {
    h ^= (unsigned char)*s;
    h *= UINT64_C(1099511628211);
  }
  return (size_t)h;
}

static void map_init(Map *m) {
  m->cap = 1024;
  m->len = 0;
  m->slots = xmalloc(m->cap * sizeof(Slot));
  for (size_t i = 0; i < m->cap; i++) m->slots[i].key = NULL;
}

static void map_grow(Map *m) {
  size_t old_cap = m->cap;
  Slot *old = m->slots;
  m->cap = old_cap * 2;
  m->slots = xmalloc(m->cap * sizeof(Slot));
  for (size_t i = 0; i < m->cap; i++) m->slots[i].key = NULL;
  m->len = 0;
  for (size_t j = 0; j < old_cap; j++) {
    if (!old[j].key) continue;
    size_t i = hash_str(old[j].key) & (m->cap - 1);
    while (m->slots[i].key) i = (i + 1) & (m->cap - 1);
    m->slots[i] = old[j];
    m->len++;
  }
  free(old);
}

static void map_put(Map *m, const char *key, int64_t val) {
  if ((m->len + 1) * 10 >= m->cap * 7) map_grow(m);
  size_t i = hash_str(key) & (m->cap - 1);
  while (m->slots[i].key) {
    if (strcmp(m->slots[i].key, key) == 0) {
      m->slots[i].val = val;
      return;
    }
    i = (i + 1) & (m->cap - 1);
  }
  m->slots[i].key = xstrdup(key);
  m->slots[i].val = val;
  m->len++;
}

static int map_get(const Map *m, const char *key, int64_t *out) {
  size_t i = hash_str(key) & (m->cap - 1);
  while (m->slots[i].key) {
    if (strcmp(m->slots[i].key, key) == 0) {
      *out = m->slots[i].val;
      return 1;
    }
    i = (i + 1) & (m->cap - 1);
  }
  return 0;
}

int main(int argc, char **argv) {
  if (argc < 2) {
    fprintf(stderr, "usage: %s N\n", argv[0]);
    return 2;
  }
  int64_t n = strtoll(argv[1], NULL, 10);
  if (n < 0) n = 0;

  Map m;
  map_init(&m);
  char **keys = xmalloc((size_t)n * sizeof(char *));
  for (int64_t i = 0; i < n; i++) {
    char buf[32];
    snprintf(buf, sizeof buf, "%" PRId64, i);
    keys[i] = xstrdup(buf);
    map_put(&m, keys[i], i * 3);
  }

  int64_t total = 0;
  for (int64_t i = 0; i < n; i++) {
    int64_t v;
    if (map_get(&m, keys[i], &v))
      total = wrap63((uint64_t)total + (uint64_t)v);
  }

  int64_t out = wrap63((uint64_t)total + (uint64_t)m.len);
  printf("%" PRId64 "\n", out);

  for (int64_t i = 0; i < n; i++) free(keys[i]);
  free(keys);
  for (size_t i = 0; i < m.cap; i++) free(m.slots[i].key);
  free(m.slots);
  return 0;
}