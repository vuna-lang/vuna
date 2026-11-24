/* 手写 C 对照：与 hashmap_remove.vuna 同算法（Int 键的哈希表：插入 / 删除 / 查找 / size）。
   .vuna 用 Base.Container.HashMap，.ml 用标准库 Hashtbl（手写上限）；按 .ml 的口径这里用
   开放寻址（线性探测 + 墓碑 + 2 倍扩容）的整数键哈希表，只依赖 libc。
   键序列 scramble(k)、插入值 k、删除 scramble(2k)、查找累加与最终 size 都与 .vuna 逐位一致。
   伪随机键 scramble(i) = i*7919 - (i*7919)/100003*100003（C 的截断除法与 OCaml 一致）。
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

enum { SLOT_EMPTY = 0, SLOT_USED = 1, SLOT_TOMB = 2 };

typedef struct {
  int64_t key;
  int64_t val;
  unsigned char state;
} Slot;

typedef struct {
  Slot *slots;
  size_t cap; /* 2 的幂 */
  size_t used;
  size_t tomb;
} Map;

static size_t hash_key(int64_t key) {
  uint64_t x = (uint64_t)key;
  x ^= x >> 30;
  x *= UINT64_C(0xbf58476d1ce4e5b9);
  x ^= x >> 27;
  x *= UINT64_C(0x94d049bb133111eb);
  x ^= x >> 31;
  return (size_t)x;
}

static void map_init(Map *m) {
  m->cap = 1024;
  m->used = 0;
  m->tomb = 0;
  m->slots = xmalloc(m->cap * sizeof(Slot));
  for (size_t i = 0; i < m->cap; i++) m->slots[i].state = SLOT_EMPTY;
}

static void map_grow(Map *m) {
  size_t old_cap = m->cap;
  Slot *old = m->slots;
  m->cap = old_cap * 2;
  m->slots = xmalloc(m->cap * sizeof(Slot));
  for (size_t i = 0; i < m->cap; i++) m->slots[i].state = SLOT_EMPTY;
  m->used = 0;
  m->tomb = 0;
  for (size_t j = 0; j < old_cap; j++) {
    if (old[j].state != SLOT_USED) continue;
    size_t i = hash_key(old[j].key) & (m->cap - 1);
    while (m->slots[i].state == SLOT_USED) i = (i + 1) & (m->cap - 1);
    m->slots[i] = old[j];
    m->used++;
  }
  free(old);
}

static void map_put(Map *m, int64_t key, int64_t val) {
  if ((m->used + m->tomb + 1) * 10 >= m->cap * 7) map_grow(m);
  size_t i = hash_key(key) & (m->cap - 1);
  size_t first_tomb = (size_t)-1;
  while (m->slots[i].state != SLOT_EMPTY) {
    if (m->slots[i].state == SLOT_USED && m->slots[i].key == key) {
      m->slots[i].val = val;
      return;
    }
    if (m->slots[i].state == SLOT_TOMB && first_tomb == (size_t)-1)
      first_tomb = i;
    i = (i + 1) & (m->cap - 1);
  }
  if (first_tomb != (size_t)-1) {
    m->slots[first_tomb].key = key;
    m->slots[first_tomb].val = val;
    m->slots[first_tomb].state = SLOT_USED;
    m->tomb--;
  } else {
    m->slots[i].key = key;
    m->slots[i].val = val;
    m->slots[i].state = SLOT_USED;
  }
  m->used++;
}

static void map_remove(Map *m, int64_t key) {
  size_t i = hash_key(key) & (m->cap - 1);
  while (m->slots[i].state != SLOT_EMPTY) {
    if (m->slots[i].state == SLOT_USED && m->slots[i].key == key) {
      m->slots[i].state = SLOT_TOMB;
      m->used--;
      m->tomb++;
      return;
    }
    i = (i + 1) & (m->cap - 1);
  }
}

static int map_get(const Map *m, int64_t key, int64_t *out) {
  size_t i = hash_key(key) & (m->cap - 1);
  while (m->slots[i].state != SLOT_EMPTY) {
    if (m->slots[i].state == SLOT_USED && m->slots[i].key == key) {
      *out = m->slots[i].val;
      return 1;
    }
    i = (i + 1) & (m->cap - 1);
  }
  return 0;
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

  Map m;
  map_init(&m);

  for (int64_t k = n; k > 0; k--) map_put(&m, scramble(k), k);
  for (int64_t k = n; k > 0; k--) map_remove(&m, scramble(k * 2));

  int64_t acc = 0;
  for (int64_t k = n; k > 0; k--) {
    int64_t v;
    if (map_get(&m, scramble(k), &v))
      acc = wrap63((uint64_t)acc * 31u + (uint64_t)v);
  }

  int64_t out = wrap63((uint64_t)acc + (uint64_t)m.used);
  printf("%" PRId64 "\n", out);

  free(m.slots);
  return 0;
}