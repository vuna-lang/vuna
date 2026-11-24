/* 手写 C 对照：与 priority_queue.vuna 同算法（优先队列：push / pop 最小值 / size）。
   .vuna 用 Base.Container.PriorityQueue（左偏堆），.ml 用标准库 Set 当有序多重集；
   这里手写二叉最小堆（动态数组 + 上浮/下沉），与 vuna 的堆算法同档，只依赖 libc。
   push 键 scramble(k)、最小值弹出顺序、累加与 size 口径都与 .vuna 一致
   （vuna 的堆是持久结构，主程序加的是弹出前原始堆的 size = N）。
   伪随机键 scramble(i) = i*7919 - (i*7919)/100003*100003。规模 N 从 argv[1] 读入。 */
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

typedef struct {
  int64_t *a;
  size_t len;
  size_t cap;
} Heap;

static void heap_init(Heap *h) {
  h->cap = 1024;
  h->len = 0;
  h->a = xmalloc(h->cap * sizeof(int64_t));
}

static void heap_push(Heap *h, int64_t v) {
  if (h->len == h->cap) {
    h->cap *= 2;
    h->a = realloc(h->a, h->cap * sizeof(int64_t));
    if (!h->a) {
      fprintf(stderr, "out of memory\n");
      exit(1);
    }
  }
  size_t i = h->len++;
  h->a[i] = v;
  while (i > 0) {
    size_t parent = (i - 1) / 2;
    if (h->a[parent] <= h->a[i]) break;
    int64_t tmp = h->a[parent];
    h->a[parent] = h->a[i];
    h->a[i] = tmp;
    i = parent;
  }
}

static int heap_pop_min(Heap *h, int64_t *out) {
  if (h->len == 0) return 0;
  *out = h->a[0];
  h->len--;
  if (h->len == 0) return 1;
  h->a[0] = h->a[h->len];
  size_t i = 0;
  for (;;) {
    size_t l = i * 2 + 1;
    size_t r = l + 1;
    size_t smallest = i;
    if (l < h->len && h->a[l] < h->a[smallest]) smallest = l;
    if (r < h->len && h->a[r] < h->a[smallest]) smallest = r;
    if (smallest == i) break;
    int64_t tmp = h->a[i];
    h->a[i] = h->a[smallest];
    h->a[smallest] = tmp;
    i = smallest;
  }
  return 1;
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

  Heap h;
  heap_init(&h);

  for (int64_t k = n; k > 0; k--) heap_push(&h, scramble(k));

  int64_t acc = 0;
  for (int64_t k = 0; k < n; k++) {
    int64_t x;
    if (!heap_pop_min(&h, &x)) break;
    acc = wrap63((uint64_t)acc * 31u + (uint64_t)x);
  }

  /* vuna 侧堆不可变，弹完后原始堆仍有 N 个元素。 */
  int64_t out = wrap63((uint64_t)acc + (uint64_t)n);
  printf("%" PRId64 "\n", out);

  free(h.a);
  return 0;
}